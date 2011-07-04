package WebGUI::Definition::Asset;

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

use 5.010;
use feature ();

use Moose::Exporter;
use WebGUI::Definition ();
use WebGUI::Definition::Meta::Asset;
use Moose::Util;
use Moose::Util::MetaRole;
use Hook::AfterRuntime;
use true;

use namespace::autoclean;

no warnings qw(uninitialized);

our $VERSION = '0.0.1';

=head1 NAME

Package WebGUI::Definition::Asset

=head1 DESCRIPTION

Moose-based meta class for all Asset definitions in WebGUI.

=head1 SYNOPSIS

A definition contains all the information needed to build an object.
Information required to build forms are added as optional roles and
sub metaclasses.  Database persistance is handled similarly.

=head1 METHODS

These methods are available from this class:

=cut

my ($import, $unimport, $init_meta) = Moose::Exporter->build_import_methods(
    install          => [ 'unimport' ],
    also             => 'WebGUI::Definition',
);

#-------------------------------------------------------------------

=head2 import ( )

A custom import method is provided so that uninitialized properties do not
generate warnings.

=cut

sub import {
    my $class = shift;
    my $caller = caller;
    strict->import;
    warnings->import;
    feature->import(':5.10');
    true->import;

    $class->$import({ into_level => 1 });
    warnings->unimport('uninitialized');
    if ($caller->meta->isa('Moose::Meta::Class')) {
        after_runtime { $caller->meta->make_immutable };
    }
    namespace::autoclean->import( -cleanee => $caller );
    return 1;
}

#-------------------------------------------------------------------

=head2 init_meta ( )

A custom init_meta, so that if inported into a class, it applies the roles
to the class, and applies the meta-role to the meta-class.

But, if it is applied to a Role, then only the meta-role is applied, since we want
the final application to be in the end user of the Role.

This permits using this to compose Asset Roles with their own database tables.

=cut

sub init_meta {
    my $class = shift;
    my %args = @_;
    my $for_class = $args{for_class};
    if ($for_class->meta->isa('Moose::Meta::Class')) {
        Moose::Util::MetaRole::apply_metaroles(
            for             => $for_class,
            class_metaroles => {
                class           => ['WebGUI::Definition::Meta::Asset'],
            },
        );
        Moose::Util::apply_all_roles(
            $for_class,
            'WebGUI::Definition::Role::Asset',
        );
    }
    else {
        Moose::Util::MetaRole::apply_metaroles(
            for             => $for_class,
            role_metaroles  => {
                role            => ['WebGUI::Definition::Meta::Asset'],
            },
        );
    }
    return $for_class->meta;
}

