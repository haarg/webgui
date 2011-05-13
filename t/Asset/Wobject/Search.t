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

##The goal of this test is to test the creation of Search Wobjects.

use WebGUI::Test;
use WebGUI::Test::MockAsset;
use WebGUI::Session;
use Test::More tests => 13; # increment this value for each test you create
use Test::Deep;
use WebGUI::Asset::Wobject::Search;
use Data::Dumper;

my $session = WebGUI::Test->session;

# Do our work in the import node
my $node = WebGUI::Asset->getDefault($session);

my $versionTag = WebGUI::VersionTag->getWorking($session);
$versionTag->set({name=>"Search Test"});
my %tag = ( tagId => $versionTag->getId, status => "pending" );
WebGUI::Test->addToCleanup($versionTag);
my $search = $node->addChild({className=>'WebGUI::Asset::Wobject::Search', %tag});

# Test for a sane object type
isa_ok($search, 'WebGUI::Asset::Wobject::Search');

# Test to see if we can set new values
my $newSearchSettings = {
	templateId=>'testingtestingtesting1',
	searchRoot=>'testingtestingtesting2',
	classLimiter=>'WebGUI::Asset::Wobject::Article',
};
$search->update($newSearchSettings);

foreach my $newSetting (keys %{$newSearchSettings}) {
	is ($search->get($newSetting), $newSearchSettings->{$newSetting}, "updated $newSetting is ".$newSearchSettings->{$newSetting});
}

                 #1234567890123456789012#
my $templateId = '_FAUX_SEARCH_TEMPLATE_';

my $templateMock = WebGUI::Test::MockAsset->new('WebGUI::Asset::Template');
$templateMock->mock_id($templateId);
$templateMock->set_true('prepare');
my $templateVars;
$templateMock->mock('process', sub { $templateVars = $_[1]; } );

$search->update({
    searchRoot   => WebGUI::Asset->getDefault($session)->getId,
    classLimiter => '',
    templateId   => $templateId,
});

{

    $session->request->setup_body({
        doit     => 1,
        keywords => 'building + applications',
    });
    $search->prepareView;
    eval { $search->view; };
    ok(! $@, 'view did now error out on standalone regexp wildcard')
        or diag $@;
    $session->request->setup_body({
        keywords => 'building +applications',
    });
    eval { $search->view; };
    ok(! $@, 'view did now error out on prefix regexp wildcard')
        or diag $@;
    $session->request->setup_body({
        keywords => 'building applications*',
    });
    eval { $search->view; };
    ok(! $@, 'view did now error out on prefix regexp wildcard')
        or diag $@;
    $session->request->setup_body({});

}

{
    my $versionTag2 = WebGUI::VersionTag->getWorking($session);
    $tag{tagId} = $versionTag2->getId;
    $versionTag2->set({name=>"Collab setup"});
    my @addArgs = ( undef, undef, { skipNotification => 1 } );
    my $collab = $node->addChild({
            className      => 'WebGUI::Asset::Wobject::Collaboration',
            editTimeout    => '1',
            threadsPerPage => 3,
            %tag,
        },
        @addArgs);
    # finally, add the post to the collaboration system
    my $props = {
        className   => 'WebGUI::Asset::Post::Thread',
        content     => 'verbosity shale anything',
        ownerUserId => 1,
        %tag,
    };

    my $thread = $collab->addChild($props, @addArgs);
    $thread->setSkipNotification;
    $versionTag2->commit();
    WebGUI::Test->addToCleanup($versionTag2);

    $session->request->setup_body({
        doit     => 1,
        keywords => 'shale',
    });
    $search->prepareView;
    $search->view;
    $search->update({useContainers => 0});
    unlike $templateVars->{result_set}->[0]->{url}, qr{\?pn=\d}, 'search returns regular URL for a Thread';
    $search->update({useContainers => 1});
    $search->view;
    like $templateVars->{result_set}->[0]->{url}, qr{\?pn=\d}, 'search returns paginated URL for a Thread when useContainers=1';

    $session->request->setup_body({});
    $search->update({useContainers => 0});
}

{
    # Test useContainers when the user cannot view the container
    my $versionTag3 = WebGUI::VersionTag->getWorking($session);
    $versionTag3->set({name=>"Folder setup"});
    $tag{tagId} = $versionTag3->getId;
    my @addArgs = ( undef, undef, { skipAutoCommitWorkflows => 1, skipNotification => 1 } );
    my $folder = $node->addChild({
            className      => 'WebGUI::Asset::Wobject::Folder',
            groupIdView     => '3', # Admins
            %tag,
        },
        @addArgs);
    # add an article anyone can see
    my $props = {
        className   => 'WebGUI::Asset::Wobject::Article',
        synopsis => 'juxtaposition coolwhip cheezewhiz',
        groupIdView => '7', # Everyone
        tagId   => $versionTag3->getId,
        status  => 'pending',
    };

    my $snippet = $folder->addChild($props, @addArgs);
    $versionTag3->commit();
    WebGUI::Test->addToCleanup($versionTag3);

    $session->request->setup_body({
        doit     => 1,
        keywords => 'juxtaposition',
    });
    WebGUI::Test::MockAsset->mock_id($templateId, $templateMock);
    $search->prepareView;
    $search->view;
    $search->update({useContainers => 0});
    note( explain $templateVars );
    is $templateVars->{result_set}->[0]->{url}, $snippet->get('url'), 'search returns regular URL for article';
    $search->update({useContainers => 1});
    $search->view;
    is $templateVars->{result_set}->[0]->{url}, $snippet->get('url'), 'search returns regular URL for article because user cannot see container';

    WebGUI::Test::MockAsset->unmock_id($templateId);
    $session->request->setup_body({});
    $search->update({useContainers => 0});
}

TODO: {
        local $TODO = "Tests to make later";
        ok(0, 'Test prepareView method');
	ok(0, 'Test view method');
}
