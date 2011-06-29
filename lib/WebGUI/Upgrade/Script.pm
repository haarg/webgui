package WebGUI::Upgrade::Script;
use 5.010;
use strict;
use warnings;
use feature ();

use Sub::Exporter;
use Sub::Name;
use WebGUI::Upgrade ();
use Scalar::Util qw(weaken);
use Try::Tiny;
use B::Hooks::Parser;
use Guard;

use Sub::Exporter -setup => {
    groups => {
        default => \&_build_exports,
    },
    collectors => {
        INIT => sub {
            my ($col, $config) = @_;
            my $config_file  = $ENV{WEBGUI_CONFIG}
                or die 'WEBGUI_CONFIG environment variable must be specified';
            my $version      = $ENV{WEBGUI_UPGRADE_VERSION};
            my $upgrade_file = File::Spec->rel2abs( (caller 4)[1] );
            (my $vol, my $dir, my $shortname) = File::Spec->splitpath( $upgrade_file );
            $shortname =~ s/\.[^.]*$//;
            my $last_dir = (File::Spec->splitdir($dir))[-1];
            if ( !$version && $last_dir =~ /\A\d+\.\d+\.\d+-(\d+\.\d+\.\d+)\z/msx ) {
                $version = $1;
            }
            if (! $version) {
                die 'WEBGUI_UPGRADE_VERSION must be set';
            }

            $col->{config_file} = $config_file;
            $col->{version} = $version;
            $col->{upgrade_file} = $upgrade_file;
            $col->{upgrade_name} = $shortname;

            feature->import(':5.10');
            strict->import;
            warnings->import;
            warnings->unimport('uninitialized');
            B::Hooks::Parser::inject('; Guard::scope_guard { _cleanup(); };');
            1;
        }
    }
};

my @cleanups;
sub _build_exports {
    my ($class, $name, $arg, $col) = @_;
    my $config = $col->{INIT};

    my $config_file  = $config->{config_file};
    my $version      = $config->{version};
    my $upgrade_name = $config->{upgrade_name};

    # need to be able to reference these directly in the cleanup code
    my $session;
    my $versionTag;

    # these subs are kept separate so the others can call them
    my $config_sub = sub () {
        state $config = do {
            require WebGUI::Config;
            WebGUI::Config->new($config_file);
        };
        return $config;
    };
    my $session_sub = sub () {
        return $session
            if $session && ! $session->closed;

        require WebGUI::Session;
        $session = WebGUI::Session->open($config_sub->());
        $session->user({userId => 3});
        return $session;
    };
    my $version_tag_sub = sub (;$) {
        my $name = shift;
        require WebGUI::VersionTag;
        if ($versionTag) {
            if ($name) {
                $versionTag->commit;
            }
            elsif ( ! $versionTag->get('isCommitted') ) {
                return $versionTag;
            }
        }
        $name ||= $upgrade_name;
        $versionTag = WebGUI::VersionTag->getWorking($session_sub->());
        $versionTag->set({name => "Upgrade to $version - $name"});
        return $versionTag;
    };
    my $dbh_sub = sub () {
        state $dbh = do {
            WebGUI::Upgrade->dbhForConfig($config_sub->());
        };
        return $dbh;
    };
    my $collateral_sub = sub () {
        state $collateral = do {
            my $path = $config->{upgrade_file};
            $path =~ s/\.[^.]*$//;
            Path::Class::Dir->new($path);
        };
        return $collateral;
    };

    # we keep a weakened copy around.  this prevents us from keeping a
    # copy if the guard gets freed, but otherwise allows us to call it
    # manually in END.
    my $indent = 1;
    my $just_started;

    my $subs = {
        config      => $config_sub,
        session     => $session_sub,
        version_tag => $version_tag_sub,
        dbh         => $dbh_sub,
        collateral  => $collateral_sub,
        _cleanup    => sub () {
            state $has_run = 0;
            return
                if $has_run++;
            if ($session) {
                require WebGUI::VersionTag;
                if (WebGUI::VersionTag->getWorking($session, 'nocreate')) {
                    $version_tag_sub->()->commit;
                }
                $session->end;
                $session->close;
            }
            undef $session;
            undef $versionTag;
        },
        start_step  => sub (@) {
            print "\n"
                if $just_started;
            print "\t" x $indent, @_, '... ';
            $just_started = 1;
            $indent++;
        },
        report => sub (@) {
            print "\n"
                if $just_started;
            print "\t" x $indent, @_, "\n";
            $just_started = 0;
        },
        done => sub () {
            $indent--;
            print "\t" x $indent
                unless $just_started;
            print "Done.\n";
            $just_started = 0;
        },
        sql => sub (@) {
            my $sql = shift;
            my $dbh = $dbh_sub->();
            my $sth = $dbh->prepare($sql);
            $sth->execute(@_);
        },
        rm_lib => sub (@) {
            my @modules = @_;
            for my $module (@modules) {
                $module =~ s{::}{/}g;
                $module .= '.pm';
                for my $inc (@INC) {
                    my $fullPath = File::Spec->catfile($inc, $module);
                    unlink $fullPath;
                }
            }
        },
        import_package => sub (@) {
            my $fullPath = $collateral_sub->()->file(@_);
            require WebGUI::Upgrade::File::wgpkg;
            WebGUI::Upgrade::File::wgpkg->import_package($session_sub->(), $fullPath);
        },
        root_asset => sub () {
            require WebGUI::Asset;
            return WebGUI::Asset->getRoot($session_sub->());
        },
        import_node => sub () {
            require WebGUI::Asset;
            return WebGUI::Asset->getImportNode($session_sub->());
        },
        asset => sub ($) {
            require WebGUI::Asset;
            my $session = $session_sub->();
            my $assetId = shift;
            my $asset;
            if ($session->id->valid($assetId)) {
                try {
                    $asset = WebGUI::Asset->newById($session, $assetId);
                };
            }
            if ( ! $asset ) {
                $asset = WebGUI::Asset->newByUrl($session, $assetId);
            }
            return $asset;
        },
        clear_cache => sub () {
            my $session = $session_sub->();
            my $cache = $session->cache;
            $cache->clear;
        },
    };

    # give the subs some names to help with diagnostics
    my $sub_package = $upgrade_name;
    $sub_package =~ s/\W//g;
    for my $sub_name ( keys %$subs ) {
        subname join('::', __PACKAGE__, $sub_package, $sub_name) => $subs->{$sub_name};
    }
    return $subs;
}

1;

__END__

=head1 LEGAL

 -------------------------------------------------------------------
  WebGUI is Copyright 2001-2009 Plain Black Corporation.
 -------------------------------------------------------------------
  Please read the legal notices (docs/legal.txt) and the license
  (docs/license.txt) that came with this distribution before using
  this software.
 -------------------------------------------------------------------
  http://www.plainblack.com                     info@plainblack.com
 -------------------------------------------------------------------

=head1 NAME

WebGUI::Upgrade::Script - Utility package for WebGUI upgrade scripts

=head1 SYNOPSIS

    use WebGUI::Upgrade::Script;

    print "Adding new snippet.\n";
    import_node->addChild({ className => 'WebGUI::Asset::Snippet', title => 'New Snippet'});
    config->set('config/item', 'new value');
    done;

=head1 DESCRIPTION

This is a package to be used in upgrade scripts to provide a number
of functions and automatic cleanup to make writing upgrade scripts
faster and simpler.

C<use>ing this module will also enable strictures, warnings, and
all of Perl 5.10's syntax enhancements in the caller.

=head1 ENVIRONMENT

This package will use the following environment variables to determine
its operation.  These variables are automatically set by
L<WebGUI::Upgrade::File::pl> if run through the main upgrade system.

=head2 WEBGUI_CONFIG

The WebGUI config file to operate against.

=head2 WEBGUI_UPGRADE_VERSION

The version being upgraded to.

=head1 EXPORTED SUBROUTINES

These subroutines are all exported by default using L<Sub::Exporter>.
They cannot be called directly.

=head2 report ( $message )

Outputs $message.

=head2 done

Reports that the current step has been completed.

=head2 config

Returns the WebGUI::Config object for the site.

=head2 session

Returns a session for the site.

=head2 dbh

Returns a database handle for the site's database.

=head2 version_tag ( [ $name ] )

If $name is specified, creates a new version tag with that name,
sets it as the active version tag, and returns it

If $name is not specified, returns the current working version tag,
creating it if needed.

The actual name of the version tag will automatically include a
note specifying that it is an upgrade version tag.

=head2 rm_lib ( $module )

Deletes the specified Perl module.  The module should be specified
as a colon separated name, and it will be removed from all include
paths.

=head2 collateral

Returns a L<Path::Class::Dir> object for the upgrade script's collateral
path.  The collateral path is the same as the name of the upgrade
script with the extension stripped off.

=head2 import_package ( $package_file )

Imports the specified package from the upgrade script's collateral path.

=head2 root_asset

Returns the site's root asset.

=head2 import_node

Returns the site's import node.

=head2 asset ( $assetId_or_URL )

Returns an asset based on an asset ID or URL.

=cut
