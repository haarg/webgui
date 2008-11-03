package WebGUI::Account;

use strict;

use Class::InsideOut qw{ :std };
use WebGUI::Exception;
use WebGUI::International;
use WebGUI::Pluggable;
use WebGUI::Utility;

=head1 NAME

Package WebGUI::Account::Profile

=head1 DESCRIPTION

This is the class which is used to display a users's profile information

=head1 SYNOPSIS

 use WebGUI::Account::Profile;

=head1 METHODS

These subroutines are available from this package:

=cut

readonly session => my %session;

#-------------------------------------------------------------------

=head2 editSettingsForm ( )

    Override this method to create settings for your Account Pluggin

=cut

sub editUserSettingsForm {
    my $self = shift;
    return "";
}

#-------------------------------------------------------------------

=head2 editSettingsFormSave ( )

    Override this method to create settings for your Account Pluggin

=cut

sub editUserSettingsFormSave {
    my $self = shift;
    return "";
}


#-------------------------------------------------------------------

=head2 getLayoutTemplateId ( )

    Override this method to return the template Id for the account layout.

=cut

sub getLayoutTemplateId {
    my $self = shift;
    return "FJbUTvZ2nUTn65LpW6gjsA";
}

#-------------------------------------------------------------------

=head2 getStyleTemplate ( )

    Override this method to return the template for the main style.

=cut

sub getStyleTemplateId {
    my $self = shift;
    return $self->session->setting->get("userFunctionStyleId");
}

#-------------------------------------------------------------------

=head2 new ( $session )

Constructor.

=head3 $session

A WebGUI::Session object.

=cut

sub new {
    my $class         = shift;
    my $session       = shift;

    unless (ref $session eq 'WebGUI::Session') {
        WebGUI::Error::InvalidObject->throw(
            expected =>"WebGUI::Session",
            got      =>(ref $session),
            error    => q{Must provide a session variable}
        );
    }

    my $self          = register $class;
    my $id            = id $self;
    $session { $id }  = $session;
    return $self;
}

#-------------------------------------------------------------------

=head2 processTemplate ( vars, templateId, template )

Returns the content generated from this template.  It adds the Asset control
bar to the template variables, as well as all Asset properties and metadata.

=head3 vars

A hash reference containing variables and loops to pass to the template engine.

=head3 templateId

An id referring to a particular template in the templates table.

=head3 template

Instead of passing in a templateId, you may pass in a template object.

=cut

sub processTemplate {
    my $self       = shift;
    my $session    = $self->session;

    my $var        = shift;
    my $templateId = shift;
    my $template   = shift;
    my $className  = ref $self;

    # Sanity checks
    if (ref $var ne "HASH") {
        $session->log->error("First argument to processTemplate() should be a hash reference.");
        my $i18n = WebGUI::International->new($self->session, 'Account');
        return sprintf($i18n->get('Error: Cannot instantiate template'),$templateId,$className);
    }

    $template = WebGUI::Asset->new($session, $templateId,"WebGUI::Asset::Template") unless (defined $template);

    unless (defined $template) {
        $session->log->error("Can't instantiate template $templateId for class ".$className);
        my $i18n = WebGUI::International->new($self->session, 'Account');
        return sprintf($i18n->get('Error: Cannot instantiate template'),$templateId,$className);
    }

    return $template->process($var);
}


1;
