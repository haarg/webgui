package WebGUI::Macro::AdminToggle;

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2004 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com info@plainblack.com
#-------------------------------------------------------------------

use strict;
use WebGUI::Grouping;
use WebGUI::International;
use WebGUI::Macro;
use WebGUI::Session;
use WebGUI::Template;
use WebGUI::URL;

#-------------------------------------------------------------------
sub process {
         if (WebGUI::Grouping::isInGroup(12)) {
        	my %var;
                 my @param = WebGUI::Macro::getParams($_[0]);
              my $turnOn = $param[0] || WebGUI::International::get(516);
              my $turnOff = $param[1] || WebGUI::International::get(517);
                 if ($session{var}{adminOn}) {
                      $var{'toggle.url'} = WebGUI::URL::page('op=switchOffAdmin');
                      $var{'toggle.text'} = $turnOff;
                 } else {
                      $var{'toggle.url'} = WebGUI::URL::page('op=switchOnAdmin');
                      $var{'toggle.text'} = $turnOn;
                 }
                return WebGUI::Template::process(WebGUI::Template::getIdByName($param[2],"Macro/AdminToggle"),"Macro/AdminToggle",\%var);
	}
       return "";
}

1;


