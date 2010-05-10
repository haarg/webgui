package WebGUI::Macro::YUI2;

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2009 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

use strict;

=head1 NAME

Package WebGUI::Macro::YUI2

=head1 DESCRIPTION

Returns the URL to the requested YUI.

=head2 process( $session, $path )

=cut


#-------------------------------------------------------------------
sub process {
    my $session = shift;
    my $file = shift;
    return $session->url->yui2($file);
}

1;

#vim:ft=perl
