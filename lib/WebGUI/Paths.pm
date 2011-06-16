package WebGUI::Paths;

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

=cut

our $VERSION = '0.0.1';
use 5.010;
use strict;
use warnings;
use Carp qw(croak);
use Cwd qw(realpath);
use File::Spec::Functions qw(catdir splitpath catpath splitpath updir catfile);
use Try::Tiny;
use namespace::autoclean -also => qr/^_/;

=head1 NAME

Package WebGUI::Paths

=head1 DESCRIPTION

Locations for WebGUI files

=head1 IMPORT OPTIONS

=head2 -preload

Loads all of the entries from the preload.custom file into @INC,
and loads all modules in the WebGUI namespace.

=head1 METHODS

These methods are available from this class:

=head2 configBase

Returns the base directory for WebGUI site config files.

=head2 logConfig

Returns the file path of the log configuration file.

=head2 spectreConfig

Returns the file path of the Spectre configuration file.

=head2 preloadCustom

Returns the file path of the preload.custom file to use.

=head2 preloadExclusions

Returns the file path of the preload.exclude file to use.

=head2 upgrades

Returns the base directory that contains the upgrade scripts.

=head2 extras

Returns the base directory of the WebGUI extra web files.

=head2 defaultUploads

Returns the base directory of the default site uploads content.

=head2 defaultCreateSQL

Returns the file path of the default site create.sql script.

=head2 share

Returns the base directory for WebGUI auxiliary files.

=cut

BEGIN {
    use Class::MOP;
    my $root = realpath(catdir(
        catpath((splitpath(__FILE__))[0,1], ''), (updir) x 2
    ));
    my $share = catdir($root, 'share');
    my $etc = catdir($root, 'etc');
    my %paths = (
        configBase         => $etc,
        logConfig          => catfile($etc, 'log.conf'),
        spectreConfig      => catfile($etc, 'spectre.conf'),
        preloadExclusions  => catfile($etc, 'preload.exclude'),
        upgrades           => catdir($share, 'upgrades'),
        extras             => catdir($share, 'extras'),
        defaultUploads     => catdir($share, 'uploads'),
        defaultCreateSQL   => catdir($share, 'create.sql'),
        share              => $share,
        defaultPSGI        => catdir($share, 'site.psgi'),
    );
    my $meta = Class::MOP::Class->initialize(__PACKAGE__);
    for my $sub (keys %paths) {
        my $path = $paths{$sub};
        $meta->add_method( $sub, sub { $path } );
    }
}

sub import {
    my $class = shift;
    my @invalid;
    for my $param (@_) {
        if ($param eq '-preload') {
            $class->preloadAll;
        }
        else {
            push @invalid, $param;
        }
    }
    if (@invalid) {
        croak 'Invalid options ' . join(', ', @invalid);
    }
}


=head2 siteConfigs

Returns the absolute paths of all of the config files inside L</configBase> as an array.

=cut

sub siteConfigs {
    my $class = shift;
    opendir my $dh, $class->configBase;
    my @configs;
    while ( my $file = readdir $dh ) {
        my $fullPath = realpath( catfile( $class->configBase, $file ) );
        if (   -d $fullPath
            || $file !~ /\.conf$/
            || $fullPath eq realpath($class->logConfig)
            || $fullPath eq realpath($class->spectreConfig) )
        {
            next;
        }
        push @configs, $fullPath;
    }
    return @configs;
} ## end sub siteConfigs

=head2 preloadExclude

Returns the list of modules to exclude from preloading as an array.

=cut

sub preloadExclude {
    my $class = shift;
    my @excludes = _readTextLines($class->preloadExclusions);
    push @excludes, 'WebGUI::Upgrade', 'WebGUI::Upgrade::*';
    push @excludes, 'WebGUI::Test', 'WebGUI::Test::*';
    return @excludes;
}

=head2 preloadAll

Preloads all of the modules in the WebGUI namespace into memory.

=cut

sub preloadAll {
    my $class = shift;

    require WebGUI::Pluggable;

    my @exclusions = $class->preloadExclude;
    WebGUI::Pluggable::findAndLoad( 'WebGUI', {
        exclude     => \@exclusions,
        onLoadFail  => sub { warn sprintf "Error loading %s: %s\n", @_ },
    });
}

sub _readTextLines {
    my $file = shift;
    my @lines;
    open my $fh, '<', $file or return;
    while (my $line = <$fh>) {
        $line =~ s/#.*//;
        $line =~ s/^\s+//;
        $line =~ s/\s+$//;
        next
            if !$line;
        push @lines, $line;
    }
    return @lines;
}

1;
