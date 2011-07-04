package WebGUI::Test;

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

Package WebGUI::Test

=head1 DESCRIPTION

Utility module for making testing in WebGUI easier.

=cut

use strict;
use warnings;
use base qw(Test::Builder::Module);

use Log::Log4perl;  # load early to ensure proper order of END blocks
use Test::MockObject::Extends;
use Clone               qw(clone);
use File::Basename      qw(dirname fileparse);
use File::Spec::Functions qw(abs2rel rel2abs catdir catfile updir splitdir);
use IO::Handle          ();
use IO::Select          ();
use Cwd                 qw( realpath );
use Scalar::Util        qw( blessed );
use Carp                qw( carp croak );
use List::MoreUtils qw(any);
use File::Copy ();
use File::Temp ();
use Try::Tiny;
use Monkey::Patch       qw( patch_object );
use Guard;
use WebGUI::Paths -inc;
use namespace::clean;
use WebGUI::User;
use WebGUI::Test::Mechanize;
use HTTP::Request::Common;

our @EXPORT = qw(cleanupGuard addToCleanup);
our @EXPORT_OK = qw(session config collateral);

my $CLASS = __PACKAGE__;

my $test_collateral;
my $original_config_file;
sub import {
    my $test_dir = realpath( dirname( rel2abs( (caller 0)[1] ) ) );
    while ( 1 ) {
        if ( (splitdir($test_dir))[-1] eq 't') {
            my $lib_dir = catdir($test_dir, 'lib');
            if ( -d $lib_dir ) {
                $test_collateral = catdir(
                    $test_dir,
                    'supporting_collateral'
                );

                unshift @INC, $lib_dir;
            }
            last;
        }
        my $next_dir = realpath( catdir( $test_dir, updir ) );
        if ( $test_dir eq $next_dir ) {
            last;
        }
        $test_dir = $next_dir;
    }

    if ( ! $original_config_file ) {
        my $config = $ENV{WEBGUI_CONFIG};
        die "Enviroment variable WEBGUI_CONFIG must be set to the full path to a WebGUI config file.\n"
            unless $config;

        for my $tryPath (
            rel2abs( $config ),
            rel2abs( $config, WebGUI::Paths->configBase )
        ) {
            if ( -e $tryPath ) {
                $config = $tryPath;
            }
        }

        die "WEBGUI_CONFIG path '$config' does not exist.\n"
            unless -e $config;
        die "WEBGUI_CONFIG path '$config' is not a file.\n"
            unless -f _;
        die "WEBGUI_CONFIG path '$config' is not readable by effective uid '$>'.\n"
            unless -r _;
        $original_config_file = $config;
    }
    goto &{ $_[0]->can('SUPER::import') };
}

sub _initSession {
    my $session = our $SESSION = $CLASS->newSession(1);

    my $originalSetting = clone $session->setting->get;
    $CLASS->addToCleanup(sub {
        while (my ($param, $value) = each %{ $originalSetting }) {
            $session->setting->set($param, $value);
        }
    });

    if ($ENV{WEBGUI_TEST_DEBUG}) {
        ##Offset Sessions, and Scratch by 1 because 1 will exist at the start
        my @checkCount = (
            Sessions             => 'userSession',
            Scratch              => 'userSessionScratch',
            Users                => 'users',
            Groups               => 'groups',
            mailQ                => 'mailQueue',
            Tags                 => 'assetVersionTag',
            Assets               => 'assetData',
            Workflows            => 'Workflow',
            'Workflow Instances' => 'WorkflowInstance',
            Carts                => 'cart',
            AdSpaces             => 'adSpace',
            Ads                  => 'advertisement',
            Inbox                => 'inbox',
            Transactions         => 'transaction',
            'Transaction Items'  => 'transactionItem',
            'Address Books'      => 'addressBook',
            'Ship Drivers'       => 'shipper',
            'Payment Drivers'    => 'paymentGateway',
            'Database Links'     => 'databaseLink',
            'LDAP Links'         => 'ldapLink',
            'Profile Fields'    => 'userProfileField',
        );
        my %initCounts;
        for ( my $i = 0; $i < @checkCount; $i += 2) {
            my ($label, $table) = @checkCount[$i, $i+1];
            $initCounts{$table} = $session->db->quickScalar('SELECT COUNT(*) FROM ' . $table);
        }
        $CLASS->addToCleanup(sub {
            for ( my $i = 0; $i < @checkCount; $i += 2) {
                my ($label, $table) = @checkCount[$i, $i+1];
                my $quant = $session->db->quickScalar('SELECT COUNT(*) FROM ' . $table);
                my $delta = $quant - $initCounts{$table};
                if ($delta || $ENV{WEBGUI_TEST_DEBUG} eq 2) {
                    $CLASS->builder->diag(sprintf '%-24s: %4d (delta %+d)', $label, $quant, $delta);
                }
            }
        });
    }
}

END {
    $CLASS->cleanup;
}

#----------------------------------------------------------------------------

=head2 newSession ( $noCleanup, [ $request ] )

Builds a WebGUI session object for testing.

=head3 $noCleanup

If true, the session won't be registered for automatic deletion.

=head3 $request

Either a HTTP::Request object to use for this session, or a hash ref of form parameters.

=cut

sub newSession {
    shift
        if eval { $_[0]->isa($CLASS) };
    my $noCleanup = shift;
    my $http_request = shift;
    require WebGUI::Session;
    my $session = WebGUI::Session->open( $CLASS->config, newEnv( $http_request ) );
    my $request = Test::MockObject::Extends->new( $session->request );
    $request->mock('setup_body', sub {
        my $self = shift;
        my $params = shift;
        delete $self->env->{$_} for grep { /^plack\./ } keys %{ $self->env };
        my $body_params = $self->body_parameters;
        $body_params->clear;
        $body_params->add( $_ => $params->{$_} ) for keys %$params;
    });
    $request->mock('setup_param', sub {
        my $self = shift;
        my $params = shift;
        delete $self->env->{$_} for grep { /^plack\./ } keys %{ $self->env };
        my $query_params = $self->query_parameters;
        $query_params->clear;
        $query_params->add( $_ => $params->{$_} ) for keys %$params;
    });
    if ( ! $noCleanup ) {
        $CLASS->addToCleanup($session);
    }
    return $session;
}

=head2 newEnv

This method works either as a object method, or as a standalone subroutine.

=head3 form

Something that could be a HTTP::Request object.

=cut

sub newEnv {
    shift
        if eval { $_[0]->isa($CLASS) };
    my $form = shift;

    require HTTP::Message::PSGI;
    require HTTP::Request::Common;
    my $config = $CLASS->config;
    my $request;
    if ( try { $form->isa('HTTP::Request') } ) {
        $request = $form;
    }
    else {
        my $url = 'http://' . $config->get('sitename')->[0];
        $request = $form
            ? HTTP::Request::Common::POST( $url, [ %$form ] )
            : HTTP::Request::Common::GET( $url )
            ;
        $request->headers->user_agent('WebGUI');
    }
    return $request->to_psgi;
}

sub clientTest (&) {
    my $client = shift;
    local $ENV{WEBGUI_CONFIG} = $CLASS->file;
    my $test_psgi = Plack::Util::load_psgi(
        $CLASS->config->get('psgiFile')
        || WebGUI::Paths->defaultPSGI,
    );
    Plack::Test::test_psgi(
        app => $test_psgi,
        client => $client,
    );
}

#----------------------------------------------------------------------------

=head2 interceptLogging

Intercept logging request and capture them in buffer variables for testing.  Also,
mock the isDebug flag so that debug output is always generated.

=cut

sub interceptLogging (&) {
    shift
        if eval { $_[0]->isa($CLASS) };
    my $sub = shift;
    my @logged;
    my $last_logged = {};
    local $CLASS->session->log->{'_logger'} = sub {
        my $to_log = shift;
        push @logged, $to_log;
        $last_logged->{$to_log->{level}} = $to_log->{message};
    };
    $sub->($last_logged);
    return \@logged;
}

#----------------------------------------------------------------------------

=head2 asset ( props )

Create a safe asset to use for testing. Add all your assets to this asset and
your assets will be automatically cleaned up after the test.

props is a set of name/value pairs for properties for the new asset. defaults
to adding a layout

=cut

sub asset {
    my ( $class, %props ) = @_;
    $props{className} ||= "WebGUI::Asset::Wobject::Layout";
    my $asset = WebGUI::Asset->getImportNode( $class->session )->addChild( \%props );
    addToCleanup( $asset );
    return $asset;
}

#----------------------------------------------------------------------------

=head2 user ( props )

Create a safe user to use for testing. The user will be removed after the test
is run.

=cut

sub user {
    my ( $class, %props ) = @_;
    my $user = WebGUI::User->create( $class->session );
    $user->update( %props );
    addToCleanup( $user );
    return $user;
}

#----------------------------------------------------------------------------

=head2 config

Returns the config object from the session.

=cut

my $config;
sub config {
    return $config
        if $config;
    require WebGUI::Config;
    $config = WebGUI::Config->new($CLASS->file);
    return $config;
}

#----------------------------------------------------------------------------

=head2 file

Returns the name of the WebGUI config file used for this test.

=cut

my $config_copy;
sub file {
    return $config_copy
        if $config_copy;
    my $config_base = fileparse( $original_config_file, '.conf' );
    (undef, $config_copy) = File::Temp::tempfile(
        "$config_base-XXXX",
        SUFFIX  => '.conf',
        UNLINK  => 0,
        OPEN    => 0,
        TMPDIR  => 1,
    );
    File::Copy::copy($original_config_file, $config_copy)
        or die "Error creating temp config file: $!";
    $CLASS->addToCleanup(sub {
        unlink $config_copy;
        undef $config_copy;
        undef $config;
    });
    return $config_copy;
}

#----------------------------------------------------------------------------

=head2 getPage ( asset | sub, pageName [, opts] )

Get the entire response from a page request. C<asset> is a WebGUI::Asset 
object. C<sub> is a string containing a fully-qualified subroutine name. 
C<pageName> is the name of the page subroutine to run (may be C<undef> for 
sub strings. C<options> is a hash reference of options with keys outlined 
below. 

 args           => Array reference of arguments to the pageName sub
 user           => A user object to set for this request
 userId         => A userId to set for this request
 formParams     => A hash reference of form parameters
 uploads        => A hash reference of files to "upload"

=cut


# I think that getPage should be entirely replaced with calles to Plack::Test::test_psgi
# - testing with the callback is better and it means we can run on any backend
# I agree.
sub getPage {
    my $class       = shift;
    my $actor       = shift;    # The actor to work on
    my $page        = shift;    # The page subroutine
    my $optionsRef  = shift;    # A hashref of options
                                # args      => Array ref of args to the page sub
                                # user      => A user object to set
                                # userId    => A user ID to set, "user" takes
                                #              precedence

    my $session = $CLASS->session;
    # Set the appropriate user
    my $oldUser     = $session->user;
    if ($optionsRef->{user}) {
        $session->user({ user => $optionsRef->{user} });
    }
    elsif ($optionsRef->{userId}) {
        $session->user({ userId => $optionsRef->{userId} });
    }
    $session->user->uncache;

    # Create a new request object
    my $oldRequest  = $session->request;
    my $request     = WebGUI::Session::Request->new(newEnv($optionsRef->{formParams}));
    # $request->setup_param($optionsRef->{formParams});
    local $session->{_request} = $request;
    local $session->{_response} = $request->new_response( 200 );
    local $session->output->{_handle};

    # Fill the buffer
    my $returnedContent;
    if (blessed $actor) {
        $returnedContent = $actor->$page(@{$optionsRef->{args}});
    }
    elsif ( ref $actor eq "CODE" ) {
        $returnedContent = $actor->(@{$optionsRef->{args}});
    }
    else {
        # Try using it as a subroutine
        no strict 'refs';
        $returnedContent = $actor->(@{$optionsRef->{args}});
    }

    if ($returnedContent && $returnedContent ne "chunked") {
        $session->output->print($returnedContent);
    }

    # Restore the former user and request
    $session->user({ user => $oldUser });

    # Return the page's output
    return join '', @{$session->response->body};
}

=head2 getPage2 ( request|url [, opts] )

Get the entire response from a page request using L<WebGUI::Test::Mechanize>.
This is a wrapper around L<WebGUI::Test::Mechanize> for the purpose of easing conversion of tests that use C<getPage>.

Accepts an L<HTTP::Request> object as an argument, which cooked up auth info will be added to.
An L<HTTP::Request> will be constructed from a simple relative URL such as C<home> if a string is passed instead.

Returns a string containing the body of the requested page.

C<options> is a hash reference of options with keys outlined below. 

 user           => A user object to set for this request
 userId         => A userId to set for this request
 formParams     => A hash reference of form parameters

Compared to C<getPage> above, these are not yet supported:

 uploads
 args

=cut

sub getPage2 {
    my $class       = shift;
    my $request     = shift;
    my $optionsRef  = shift;    # A hashref of options
                                # args      => Array ref of args to the page sub
                                # user      => A user object to set
                                # userId    => A user ID to set, "user" takes
                                #              precedence

    die "not supported" if exists $optionsRef->{args};
    die "not supported" if exists $optionsRef->{uploads};

    my $session = $CLASS->session;

    # Save state
    my $oldUser     = $session->user;
    my $oldRequest  = $session->request;

    my $mech  = WebGUI::Test::Mechanize->new( config => WebGUI::Test->file );

    # Set the appropriate user
    if ($optionsRef->{user}) {
        $mech->session->user({ user => $optionsRef->{user} });
    }
    elsif ($optionsRef->{userId}) {
        $mech->session->user({ userId => $optionsRef->{userId} });
    }
    $session->user->uncache;

    $mech->session or die; # force a session to be created for the request
    my $session_id = $mech->sessionId or die;

    # Build or fix up a request object
    if( ! eval { $request->isa('HTTP::Request') } ) {
        if( $optionsRef->{formParams} ) {
            $request = HTTP::Request::Common::POST( "http://127.0.0.1/$request", [ %{ $optionsRef->{formParams} } ] ) or die;
        }
        else {
            $request = HTTP::Request->new( GET => "http://127.0.0.1/$request" ) or die;
        }
    } 
    $request->header( 'Set-Cookie3' => qq{wgSession=$session_id; path="/"; domain=127.0.0.1; path_spec; discard; version=0} );

    $mech->request( $request );

    # Restore the former user and request
    $session->user({ user => $oldUser });
    $session->{_request} = $oldRequest; # dubious about this; if we're going to try to support requests inside of other requests, it should be tested and actually supported rather than just some optimistic arm waving done

    return $mech->response->decoded_content;

}

#----------------------------------------------------------------------------

=head2 getTestCollateralPath ( [filename] )

Returns the full path to the directory containing the collateral files to be
used for testing.

Optionally adds a filename to the end.

=cut

sub getTestCollateralPath {
    my $class           = shift;
    my @path            = @_;
    return catfile($test_collateral, @path);
}

sub collateral {
    return $CLASS->getTestCollateralPath(@_);
}

#----------------------------------------------------------------------------

=head2 lib ( )

Returns the full path to the WebGUI lib directory, usually /data/WebGUI/lib.

=cut

my $webgui_lib = realpath( catdir( dirname( __FILE__ ), (updir) x 1 ) );
sub lib {
    return $webgui_lib;
}

#----------------------------------------------------------------------------

=head2 session ( )

Returns the WebGUI::Session object that was created by the test.  This session object
will automatically be destroyed if the test finishes without dying.

The logger for this session has been overridden so that you can test
that WebGUI is logging errors.  That means that errors will not be put into
your webgui.log file (or whereever log.conf says to put it).  This will probably
be moved into a utility sub so that the interception can be enabled, and then
disabled.

=cut

sub session {
    our $SESSION;
    if (! $SESSION) {
        _initSession();
    }
    return $SESSION;
}

#----------------------------------------------------------------------------

=head2 webguiBirthday ( )

This constant is used in several tests, so it's reproduced here so it can
be found easy.  This is the epoch date when WebGUI was released.

=cut

sub webguiBirthday {
    return 997966800 ;
}

#----------------------------------------------------------------------------

=head2 getAssetSkipCoda ( )

Coded here for the sake of consistency, this returns everything that should be
appended to calls to addChild to autogenerate ids, revisionDates, and to skip
autoCommit workflows, and notifications.

=cut

sub getAssetSkipCoda {
    return undef,
           undef,
           {
            skipAutoCommitWorkflows => 1,
            skipNotification        => 1,
           };
}

#----------------------------------------------------------------------------

=head2 getSmokeLDAPProps ( )

Returns a hashref of properties for connecting to smoke's LDAP server.

=cut

sub getSmokeLDAPProps {
    my $ldapProps   = {
        ldapLinkName    => "Test LDAP Link",
        ldapUrl         => "ldaps://smoke.plainblack.com/o=shawshank", # Always test ldaps
        connectDn       => "cn=Warden,o=shawshank",
        identifier      => "gooey",
        ldapUserRDN     => "dn",
        ldapIdentity    => "uid",
        ldapLinkId      => sprintf( '%022s', "testlink" ),
    };
    return $ldapProps;
}

#----------------------------------------------------------------------------

=head2 originalConfig ( $param )

Stores the original data from the config file, to be restored
automatically at the end of the test.  This is a class method.

=cut

my %originalConfig;
sub originalConfig {
    my ($class, $param) = @_;
    my $safeValue = my $value = $CLASS->session->config->get($param);
    if (ref $value) {
        $safeValue = clone $value;
    }
    # add cleanup handler if this is the first time we were run
    if (! keys %originalConfig) {
        $class->addToCleanup(sub {
            while (my ($key, $value) = each %originalConfig) {
                if (defined $value) {
                    $CLASS->session->config->set($key, $value);
                }
                else {
                    $CLASS->session->config->delete($key);
                }
            }
        });
    }
    $originalConfig{$param} = $safeValue;
}

#----------------------------------------------------------------------------

#----------------------------------------------------------------------------

=head2 overrideSetting (name, val)

Overrides WebGUI::Test->session->setting->get($name) to return $val until the
handle this method returns goes out of scope.

=cut

sub overrideSetting {
    my ($class, $name, $val) = @_;
    patch_object $class->session->setting => get => sub {
        my $get = shift;
        return $val if $_[1] eq $name;
        goto &$get;
    };
}

#----------------------------------------------------------------------------

=head2 cleanupAdminInbox ( )

Push a list of Asset objects onto the stack of assets to be automatically purged
at the end of the test.  This will also clean-up all version tags associated
with the Asset.

This is a class method.

=cut

sub cleanupAdminInbox {
    my $class = shift;
    my $admin = WebGUI::User->new($class->session, '3');
    my $inbox = WebGUI::Inbox->new($class->session);
    $inbox->deleteMessagesForUser($admin);
}

#----------------------------------------------------------------------------

=head2 cleanupGuard ( $object, $class => $ident )

Pass in a list of objects or pairs of classes and identifiers, and
it will return a guard object for cleaning them up.  When the guard
object goes out of scope, it will automatically clean up all of the
passed in objects.  Objects will be destroyed in the order they
were passed in.  Currently able to destroy:

    WebGUI::AdSpace
    WebGUI::Asset
    WebGUI::Group
    WebGUI::Session
    WebGUI::Storage
    WebGUI::User
    WebGUI::VersionTag
    WebGUI::Workflow
    WebGUI::Shop::Cart
    WebGUI::Shop::ShipDriver
    WebGUI::Shop::PayDriver
    WebGUI::Shop::Transaction
    WebGUI::Shop::Vendor
    WebGUI::Shop::AddressBook
    WebGUI::DatabaseLink
    WebGUI::LDAPLink
    WebGUI::Inbox::Message
    WebGUI::Fork
    WebGUI::ProfileField

Example call:

    my $guard = cleanupGuard(
        $user,
        $workflow,
        'WebGUI::Group' => $groupId,
        $asset,
    );

=cut

{
    my %initialize = (
        '' => sub {
            my ($class, $ident) = @_;
            return $class->new($CLASS->session, $ident);
        },
        'WebGUI::Asset' => sub {
            my ($class, $ident) = @_;
            return WebGUI::Asset->newPending($CLASS->session, $ident);
        },
        'WebGUI::Storage' => sub {
            my ($class, $ident) = @_;
            return WebGUI::Storage->get($CLASS->session, $ident);
        },
        'SQL' => sub {
            my (undef, $sql) = @_;
            my $db = $CLASS->session->db;
            my @params;
            if ( ref $sql ) {
                ( $sql, @params ) = @$sql;
            }
            return sub {
                $db->do( $sql, {}, @params );
            }
        },
    );

    my %clone = (
        'WebGUI::User' => sub {
            WebGUI::User->new($CLASS->session, shift->getId);
        },
        'WebGUI::Group' => sub {
            WebGUI::Group->new($CLASS->session, shift->getId);
        },
        'WebGUI::Session' => 'duplicate',
    );

    my %check = (
        'WebGUI::User' => sub {
            my $user = shift;
            my $userId = $user->userId;
            die "Refusing to clean up vital user @{[ $user->username ]}!\n"
                if any { $userId eq $_ } (1, 3);
        },
        'WebGUI::DatabaseLink' => sub {
            my $db_link = shift;
            die "Refusing to clean up database link @{[ $db_link->get('title') ]}!\n"
                if $db_link->getId eq '0';
        },
        'WebGUI::Group' => sub {
            my $group = shift;
            die "Refusing to clean up vital group @{[ $group->name ]}!\n"
                if $group->vitalGroup;
        },
        'WebGUI::Workflow' => sub {
            my $workflow = shift;
            my $workflowId = $workflow->getId;
            die "Refusing to clean up vital workflow @{[ $workflow->get('title') ]}!\n"
                if any { $workflowId eq $_ } qw{
                    AuthLDAPworkflow000001
                    csworkflow000000000001
                    DPWwf20061030000000002
                    PassiveAnalytics000001
                    pbworkflow000000000001
                    pbworkflow000000000002
                    pbworkflow000000000003
                    pbworkflow000000000004
                    pbworkflow000000000005
                    pbworkflow000000000006
                    pbworkflow000000000007
                    send_webgui_statistics
                    xR-_GRRbjBojgLsFx3dEMA
                };
        },
    );

    my %cleanup = (
        'WebGUI::User'               => 'delete',
        'WebGUI::Group'              => 'delete',
        'WebGUI::Storage'            => 'delete',
        'WebGUI::Asset'              => 'purge',
        'WebGUI::VersionTag'         => 'rollback',
        'WebGUI::Workflow'           => 'delete',
        'WebGUI::DatabaseLink'       => 'delete',
        'WebGUI::Shop::AddressBook'  => 'delete',
        'WebGUI::Shop::Transaction'  => 'delete',
        'WebGUI::Shop::ShipDriver'   => 'delete',
        'WebGUI::Shop::PayDriver'    => 'delete',
        'WebGUI::Shop::Vendor'       => 'delete',
        'WebGUI::Inbox::Message'     => 'purge',
        'WebGUI::AdSpace'            => 'delete',
        'WebGUI::FilePump::Bundle'   => 'delete',
        'WebGUI::ProfileField'       => 'delete',
        'WebGUI::Shop::Cart'         => sub {
            my $cart        = shift;
            my $addressBook = eval { $cart->getAddressBook(); };
            $addressBook->delete if $addressBook;  ##Should we call cleanupGuard instead???
            $cart->delete;
        },
        'WebGUI::Workflow::Instance' => sub {
            my $instance = shift;
            $instance->delete('skipNotify');
        },
        'WebGUI::Session'          => sub {
            my $session = shift;
            $session->end;
            $session->close;
        },
        'WebGUI::LDAPLink'         => sub {
            my $link = shift;
            $link->session->db->write("delete from ldapLink where ldapLinkId=?", [$link->{_ldapLinkId}]);
        },
        'CODE' => sub {
            (shift)->();
        },
        'SQL' => sub {
            (shift)->();
        },
        'WebGUI::Fork' => sub {
            my $fork = shift;
            my $id = $fork->getId;
            session()->db->write("update Fork set finished = 1 where id = ?", [ $id ] );
        },
    );

    sub cleanupGuard {
        shift
            if eval { $_[0]->isa($CLASS) };
        my @cleanups;
        while (@_) {
            my $class = shift;
            next
                if !defined $class;
            my $construct;
            if ( ref $class ) {
                my $object = $class;
                $class = ref $class;
                my $cloneSub = $CLASS->_findByIsa($class, \%clone);
                $construct = $cloneSub ? sub { $object->$cloneSub } : sub { $object };
            }
            else {
                my $id = shift;
                my $initSub = $CLASS->_findByIsa($class, \%initialize)
                    || croak "Can't find initializer for $class\n";
                $construct = sub { $initSub->($class, $id) };
            }
            if (my $check = $CLASS->_findByIsa($class, \%check)) {
                local $@;
                if ( ! eval { $construct->()->$check; 1 } ) {
                    if ($@) {
                        carp $@;
                    }
                    else {
                        carp "Refusing to clean up vital $class!\n";
                    }
                    next;
                }
            }
            my $destroy = $CLASS->_findByIsa($class, \%cleanup)
                || croak "Can't find destructor for $class";
            push @cleanups, $construct, $destroy;
        }
        return guard {
            local $@;
            while ( 1 ) {
                my ($construct, $destroy) = (shift @cleanups, shift @cleanups);
                last
                    if ! $construct;
                if ( my $object = eval { $construct->() } ) {
                    eval { $object->$destroy };
                }
                if (ref $@ && $@->isa('WebGUI::Error::ObjectNotFound')) {
                    # ignore objects that don't exist
                }
                elsif ($@) {
                    warn $@;
                }
            }
            return;
        };
    }
}

sub _findByIsa {
    my $self = shift;
    my $toFind = shift;
    my $hash = shift;
    for my $key ( sort { length $b <=> length $a} keys %$hash ) {
        if ($toFind eq $key || $toFind->isa($key)) {
            return $hash->{$key};
        }
    }
    return $hash->{''};
}

#----------------------------------------------------------------------------

=head2 addToCleanup ( $object, $class => $ident )

Takes the same parameters as cleanupGuard, but cleans the objects
up at the end of the test instead of returning a guard object.

This is a class method.

=cut

my @guarded;
sub addToCleanup {
    shift
        if eval { $_[0]->isa($CLASS) };
    push @guarded, cleanupGuard(@_);
}

sub cleanup {
    if ($ENV{WEBGUI_TEST_NOCLEANUP}) {
        (pop @guarded)->cancel
            while @guarded;
        return;
    }

    # remove guards in reverse order they were added, triggering all of the
    # requested cleanup operations
    pop @guarded
        while @guarded;

    if ( our $SESSION ) {
        $SESSION->end;
        $SESSION->close;
        undef $SESSION;
    }
}

#----------------------------------------------------------------------------

=head2 C<< waitForAllForks( [ $wait_time ] ) >>

Will block until all WebGUI::Fork processes are completed.
Optional argument C<< $wait_time >> gives a maxmimum wait time before turning in failure.

=cut

sub waitForAllForks {
    my ( $class, $wait_time ) = @_;
    my $session = session;
    my @forkIds = $session->db->quickArray( "SELECT id FROM Fork WHERE finished != 1" );
    my $start_time = time;
    while ( 1 ) {
        return 1 if ! grep { !$_->isFinished } map { WebGUI::Fork->new( $session, $_ ) } @forkIds;
        return if $wait_time and $start_time + $wait_time < time;
        sleep 1;
    }
}

1;
