package WebGUI::Macro::RandomImage;

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2004 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

use strict;
use Tie::CPHash;
use WebGUI::Collateral;
use WebGUI::Macro;
use WebGUI::Session;
use WebGUI::SQL;

#-------------------------------------------------------------------
sub process {
        my @param = WebGUI::Macro::getParams($_[0]);
	my $collateralFolderId = 0;
	if ($param[0] ne "") {
		($collateralFolderId) = WebGUI::SQL->quickArray("select collateralFolderId from collateralFolder 
			where name=".quote($param[0]),WebGUI::SQL->getSlave);
		$collateralFolderId = 0 unless ($collateralFolderId);
	}
	my @images = WebGUI::SQL->buildArray("select collateralId from collateral 
		where collateralType='image' and collateralFolderId=".quote($collateralFolderId),WebGUI::SQL->getSlave);
	if (my $collateral = WebGUI::Collateral->new($images[rand($#images+1)])) {
	        return '<img src="'.$collateral->getURL.'" '.$collateral->get("parameters").' />';
        } else {
                return undef;
        }
}


1;


