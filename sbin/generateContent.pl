#!/usr/bin/perl

#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2004 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

 
our $webguiRoot;

BEGIN {
        $webguiRoot = "..";
        unshift (@INC, $webguiRoot."/lib");
}

use DBI;
use Getopt::Long;
use strict qw(subs vars);
use WebGUI;
use WebGUI::Session;
use WebGUI::Export;

$|=1;

my ($configFile, $pageId, $userId, $styleId, $toFile, $stripHTML, $help, $relativeUrls);

$userId = 1;

GetOptions(
	'configFile:s'=>\$configFile,
	'pageId:i'=>\$pageId,
	'userId:i'=>\$userId,
	'styleId:i'=>\$styleId,
	'toFile:s'=>\$toFile,
	'stripHTML'=>\$stripHTML,
	'help'=>\$help,
	'relativeUrls'=>\$relativeUrls,
);

if ($help || $configFile eq '' ) {
	print <<STOP;


Usage: perl $0 --configFile=<webguiConfig>

	--configFile    WebGUI config file (with no path info).

Options:

	--pageId        Set the page to be generated.

        --help		Displays this message.

	--userId	Set the user that should view the page.
			Defaults to "1" (Visitor).

	--styleId	Set an alternate style for the page.
			Defaults to page's default style.

	--toFile	Set the path and filename to write the
			content to instead of standard out.

	--stripHTML	A flag indicating that WebGUI should
			strip all the HTML from the document and
			output only text. NOTE: The resulting
			text may have formatting problems as a
			result.

	--relativeUrls	If set, all navigation URL's will be relative
			instead of absolute. Defaults to "0" (absolute
			URLs)

STOP
	exit;
}

# Open WebGUI session
WebGUI::Session::open($webguiRoot,$configFile);
WebGUI::Session::refreshUserInfo(3,$session{dbh});

my $e = WebGUI::Export->new(
				pageId => $pageId,
				userId => $userId,
				styleId => $styleId,
				stripHTML => $stripHTML,
				relativeUrls => $relativeUrls
			);

my $content = $e->generate;
if ($toFile) {
        open (TOFILE, ">$toFile") or die "Can't open file $toFile for writing. $!";
	print TOFILE $content;
	close (TOFILE);
} else {
	print $content;
}

# Clean-up WebGUI Session
WebGUI::Session::end($session{var}{sessionId});
WebGUI::Session::close();

exit;
