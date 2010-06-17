package WebGUI::Test::Mechanize;

use strict;
use warnings;

use parent 'Test::WWW::Mechanize::PSGI';

use WebGUI;
use WebGUI::Config;
use WebGUI::Session;
use WebGUI::Middleware::Session;

sub new {
    my $class = shift;
    my %options = @_;
    my $config_file = delete $options{config};
    if (ref $config_file) {
        $config_file = $config_file->pathToFile;
    }
    my $wg = WebGUI->new( site => $config_file );
    my $app = $wg->to_app;
    $app = WebGUI::Middleware::Session->wrap($app, config => $wg->config);
    $options{app} = $app;
    my $self = $class->SUPER::new(%options);
    $self->{_webgui_config} = $wg->config;
    return $self;
}

sub session {
    my $self = shift;
    return $self->{_webgui_session}
        if $self->{_webgui_session};
    my $session = WebGUI::Session->open($self->{_webgui_config}, undef, $self->sessionId);
    $self->{_webgui_session} = $session;
    return $session;
}

sub sessionId {
    my $self = shift;
    return $self->{_webgui_sessionId}
        if $self->{_webgui_sessionId};
    my $sessionId;
    my $cookieName = $self->{_webgui_config}->get('cookieName');
    $self->cookie_jar->scan(sub {
        my ($key, $value) = @_[1,2];
        if ($key eq $cookieName) {
            $sessionId = $value;
        }
    });
    if (! $sessionId) {
        die "Unable to find session cookie!";
    }
    $self->{_webgui_sessionId} = $sessionId;
    return $sessionId;
}

sub DESTROY {
    my $self = shift;
    my $session = delete $self->{_webgui_session};
    if ($session) {
        $session->var->end;
        $session->close;
    }
}

1;

