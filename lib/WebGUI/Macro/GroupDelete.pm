package WebGUI::Macro::GroupDelete;

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2003 Plain Black LLC.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

use strict;
use WebGUI::Group;
use WebGUI::Macro;
use WebGUI::Session;
use WebGUI::Privilege;
use WebGUI::URL;

#-------------------------------------------------------------------
sub process {
	my @param = WebGUI::Macro::getParams($_[0]);
	return "" if ($param[0] eq "");
	my $g = WebGUI::Group->find($param[0]);
	return "" if ($g->groupId eq "");
	return "" unless ($g->autoDelete);
	return "" unless (WebGUI::Privilege::isInGroup($g->groupId));
	return '<a href="'.WebGUI::URL::page("op=autoDeleteFromGroup&groupId=".$g->groupId).'">'.$param[1].'</a>';
}


1;

