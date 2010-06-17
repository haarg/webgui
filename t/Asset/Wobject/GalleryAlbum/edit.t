# vim:syntax=perl
#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2009 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#------------------------------------------------------------------

# Test editing a GalleryAlbum from the web interface
# 
#

use FindBin;
use strict;
use lib "$FindBin::Bin/../../../lib";
use Test::More;
use WebGUI::Test; # Must use this before any other WebGUI modules
use WebGUI::Session;
use Test::Deep;
use WebGUI::Test::Mechanize;
use Plack::Builder;

plan tests => 6;        # Increment this number for each test you create

#----------------------------------------------------------------------------
# Init
my $session         = WebGUI::Test->session;
my $node            = WebGUI::Asset->getImportNode( $session );

# Override some settings to make things easier to test
# userFunctionStyleId 
$session->setting->set( 'userFunctionStyleId', 'PBtmpl0000000000000132' );
# specialState
$session->setting->set( 'specialState', '' );

# Create a user for testing purposes
my $user        = WebGUI::User->new( $session, "new" );
WebGUI::Test->addToCleanup($user);
$user->username( 'dufresne' . time );

my ($mech, $redirect, $response);

# Get the site's base URL
my $baseUrl         = 'http://localhost';

my $i18n        = WebGUI::International->new( $session, 'Asset_GalleryAlbum' );

my $gallery
    = $node->addChild( {
        className           => 'WebGUI::Asset::Wobject::Gallery',
        groupIdAddFile      => '2',     # Registered Users
        workflowIdCommit    => 'pbworkflow000000000003', # Commit Content Immediately
    } );
my $vt = WebGUI::VersionTag->getWorking( $session );
$vt->commit;
WebGUI::Test->addToCleanup($vt);

#----------------------------------------------------------------------------
# Tests

my $mech = WebGUI::Test::Mechanize->new(config => WebGUI::Test->config);

#----------------------------------------------------------------------------
# Visitor user cannot add albums 
$mech->get( $baseUrl . $gallery->getUrl('func=add;class=WebGUI::Asset::Wobject::GalleryAlbum') );

# Should contain the Log In form
$mech->content_contains( "Permission Denied" );

my $mech_session = $mech->session;
$mech_session->user({userId => $user->userId});

# Complete the GalleryAlbum edit form
my $properties  = {
    title           => 'Gallery Album',
    description     => 'This is a new Gallery Album',
};

$mech->get_ok( $baseUrl . $gallery->getUrl('func=add;class=WebGUI::Asset::Wobject::GalleryAlbum') );

warn $mech->content;
$mech->submit_form_ok( {
    with_fields     => $properties,
}, 'Sent GalleryAlbum edit form' );

# Shows the confirmation page
$mech->content_contains( 
    $i18n->get( 'what next' ),
    'Shows message about what next',
);
$mech->content_contains( 
    q{func=add;class=WebGUI::Asset::File::GalleryFile::Photo},
    'Shows link to add a Photo',
);

# Creates the album with the appropriate properties
my $album   = WebGUI::Asset->newById( $session, $gallery->getAlbumIds->[0] );
cmp_deeply( $properties, subhashof( $album->get ), "Properties from edit form are set correctly" );

