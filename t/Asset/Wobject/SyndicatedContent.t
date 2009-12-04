#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2009 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------

use FindBin;
use strict;
use File::Spec;
use lib "$FindBin::Bin/../../lib";

use Data::Dumper;

# The goal of this test is to test the creation of 
# and expose any bugs of SyndicatedContent Wobjects.

use WebGUI::Test;
use WebGUI::Session;
use Test::More tests => 35; # increment this value for each test you create
use Test::Deep;
use WebGUI::Asset::Wobject::SyndicatedContent;
use XML::FeedPP;
use WebGUI::Cache;

my $session = WebGUI::Test->session;
my %var;

##############################
##          SETUP           ##
##############################
# Do our work in the import node
my $node = WebGUI::Asset->getImportNode($session);

# Create a version tag to work in
my $versionTag = WebGUI::VersionTag->getWorking($session);
$versionTag->set({name=>"SyndicatedContent Test"});
addToCleanup($versionTag);
my $syndicated_content = $node->addChild({className=>'WebGUI::Asset::Wobject::SyndicatedContent'});

##############################
##      Start Test          ##
##############################

# Test for a sane object type
isa_ok($syndicated_content, 'WebGUI::Asset::Wobject::SyndicatedContent');

# Test to see if we can set new values
my $newSyndicatedContentSettings = {
	cacheTimeout => 124,
	templateId   => "PBtmpl0000000000000065", 
    rssUrl      => 'http://svn.webgui.org/svnweb/plainblack/rss/WebGUI/',
};

# update the new values for this instance
$syndicated_content->update($newSyndicatedContentSettings);

# Let's check our updated values
foreach my $newSetting (keys %{$newSyndicatedContentSettings}) {
	is ($syndicated_content->get($newSetting), $newSyndicatedContentSettings->{$newSetting}, "updated $newSetting is ".$newSyndicatedContentSettings->{$newSetting});
}

my $feed = $syndicated_content->generateFeed;
isa_ok($feed, 'XML::FeedPP', 'Got an XML::FeedPP object');
isnt($feed->title,'', 'the feed has data');

# Lets make sure the view method returns something.
is ($syndicated_content->{_viewTemplate}, undef, 'internal template cache unset until prepareView is called');

$syndicated_content->prepareView;
isnt ($syndicated_content->{_viewTemplate}, undef, 'internal template cache set by prepare view');
isa_ok ($syndicated_content->{_viewTemplate}, 'WebGUI::Asset::Template', 'internal template cache');

ok($syndicated_content->view(), 'it generates some output');

my $output = $syndicated_content->www_viewRss;
my $feed = XML::FeedPP->new($output);
cmp_ok($feed->get_item, ">", 0, 'RSS has items');

my $output = $syndicated_content->www_viewRdf;
my $feed = XML::FeedPP->new($output);
cmp_ok($feed->get_item, ">", 0, 'RDF has items');

my $output = $syndicated_content->www_viewAtom;
my $feed = XML::FeedPP->new($output);
cmp_ok($feed->get_item, ">", 0, 'Atom has items');

# create a new template object in preparation for rendering
my $template = WebGUI::Asset::Template->new($session, $syndicated_content->get("templateId"));
$template->prepare;
isa_ok($template, 'WebGUI::Asset::Template');

$syndicated_content->{_viewTemplate} = $template;

# check out the template vars

my $var = $syndicated_content->getTemplateVariables($feed);

isnt($var->{channel_description}, '', 'got a channel description');
isnt($var->{channel_title}, '', 'got a channel title');
isnt($var->{channel_link}, '', 'got a channel link');
cmp_ok(scalar(@{$var->{item_loop}}), '>', 0, 'the item loop has items');

# processTemplate, this is where we run into trouble...
my $processed_template = eval {$syndicated_content->processTemplate($var,undef,$template) };
ok($processed_template, "A response was received from processTemplate.");

####################################################################
#
#  getTemplateVariables
#
####################################################################

##Construct a feed with no description, so the resulting template variables can
##be checked for an undef description
my $feed = XML::FeedPP->new(<<EOFEED);
<?xml version="1.0" encoding="UTF-8" ?>
<feed xmlns="http://purl.org/atom/ns#" version="0.3" xmlns:admin="http://webns.net/mvcb/" xmlns:syn="http://purl.org/rss/1.0/modules/syndication/" xmlns:taxo="http://purl.org/rss/1.0/modules/taxonomy/">
<title type="text/plain">Revision Log - /WebGUI/</title>
<link rel="alternate" type="text/html" href="https://svn.webgui.org/svnweb/plainblack/log/WebGUI/" />
<author>
<name></name>
</author>
<modified>1970-01-01T00:53:41</modified>
<entry>
<title type="text/plain">12312 - Ready for 7.7.20 development.
</title>
<link rel="alternate" type="text/html" href="https://svn.webgui.org/svnweb/plainblack/revision?rev=12312" />
<author>
<name>colin</name>
</author>
<id>https://svn.webgui.org/svnweb/plainblack/revision?rev=12312</id>
<issued>1970-01-01T00:53:41</issued>
<modified>1970-01-01T00:53:41</modified>
</entry>
EOFEED

my $vars = $syndicated_content->getTemplateVariables($feed);
ok( defined $vars->{item_loop}->[0]->{description}, 'getTemplateVariables: description is not undefined');

####################################################################
#
#  generateFeed, hasTerms
#
####################################################################

my $tbbUrl = 'http://www.plainblack.com/tbb.rss';
$syndicated_content->update({
    rssUrl   => $tbbUrl,
    hasTerms => 'WebGUI',
});

my $cache = WebGUI::Cache->new($session, $tbbUrl, 'RSS');
open my $rssFile, '<', WebGUI::Test->getTestCollateralPath('rss/tbb.rss')
    or die "Unable to get RSS file";
my $rssContent = do { local $/; <$rssFile>; };
close $rssFile;
$cache->set($rssContent, 60);

my $filteredFeed = $syndicated_content->generateFeed();

cmp_deeply(
    [ map { $_->title } $filteredFeed->get_item() ],
    [
        'Google Picasa Plugin for WebGUI Gallery',
        'WebGUI Roadmap',
        'WebGUI 8 Performance',
    ],
    'generateFeed: filters items based on the terms being in title, or description'
);

$cache->delete;

####################################################################
#
#  Odd feeds
#
####################################################################


##Feed with no links or pubDates.
my $oncpUrl = 'http://www.oncp.gob.ve/oncp.xml';
$syndicated_content->update({
    rssUrl       => $oncpUrl,
    hasTerms     => '',
    maxHeadlines => 50,
});

my $cache = WebGUI::Cache->new($session, $oncpUrl, 'RSS');
my $rssContent = slurp_rss('duplicate-link.rss');
$cache->set($rssContent, 60);

my $oddFeed1 = $syndicated_content->generateFeed();

my @oddItems = $oddFeed1->get_item();
is (@oddItems, 2, 'feed has items even without pubDates or links');

$cache->delete;

####################################################################
#
#  Encoding tests
#
####################################################################

my $testFeedUrl = 'http://www.example.com/feed.rss';
$syndicated_content->update({rssUrl => $testFeedUrl});

my $UTF8_BOM = "\xEF\xBB\xBF";

my $cache = WebGUI::Cache->new($session, $testFeedUrl, 'RSS');

my $utf8_es = slurp_rss('utf8-es.rss');
my $utf8_ru = slurp_rss('utf8-ru.rss');
my $entity_es = slurp_rss('entity-es.rss');
my $entity_ru = slurp_rss('entity-ru.rss');
my $utf8_no_prolog = Encode::decode_utf8(slurp_rss('utf8-no-prolog-encoding.rss'));
my $iso_8859_1 = slurp_rss('iso-8859-1.rss');
my $iso_8859_5 = slurp_rss('iso-8859-5.rss');

my $es_title = "PM captur\x{00F3} a tres delincuentes que robaron agencia bancaria en San Mart\x{00ED}n";
my $ru_title = "\x{412}\x{438}\x{43a}\x{438}\x{43f}\x{435}\x{434}\x{438}\x{44f}  - \x{421}\x{432}\x{435}\x{436}\x{438}\x{435} \x{43f}\x{440}\x{430}\x{432}\x{43a}\x{438} [ru]";

$cache->set($utf8_es, 60);
is $syndicated_content->generateFeed->title, $es_title, 'Latin-1 compatible, UTF-8 encoded';
$cache->set($utf8_ru, 60);
is $syndicated_content->generateFeed->title, $ru_title, 'Russian, UTF-8 encoded';
$cache->set($entity_es, 60);
is $syndicated_content->generateFeed->title, $es_title, 'Latin-1 compatible, Entity encoded, utf8 flag off';
$cache->set($entity_ru, 60);
is $syndicated_content->generateFeed->title, $ru_title, 'Russian, Entity encoded, utf8 flag off';
$cache->set($UTF8_BOM . $utf8_es, 60);
is $syndicated_content->generateFeed->title, $es_title, 'Latin-1 compatible, UTF-8 encoded, With BOM';

$cache->set(Encode::decode_utf8($utf8_es), 60);
is $syndicated_content->generateFeed->title, $es_title, 'Latin-1 compatible, Decoded';
$cache->set(Encode::decode_utf8($utf8_ru), 60);
is $syndicated_content->generateFeed->title, $ru_title, 'Russian, Decoded';
$cache->set(Encode::decode_utf8($entity_es), 60);
is $syndicated_content->generateFeed->title, $es_title, 'Latin-1, Entity encoded, utf8 flag on';
$cache->set(Encode::decode_utf8($entity_ru), 60);
is $syndicated_content->generateFeed->title, $ru_title, 'Russian, Entity encoded, utf8 flag on';
$cache->set($UTF8_BOM . Encode::decode_utf8($utf8_es), 60);
is $syndicated_content->generateFeed->title, $es_title, 'Latin-1 compatible, Decoded, With BOM';

$cache->set($utf8_no_prolog, 60);
is $syndicated_content->generateFeed->title, $es_title, 'No encoding in prolog, Decoded';

$cache->set($iso_8859_1, 60);
is $syndicated_content->generateFeed->title, $es_title, 'ISO-8859-1 encoded';
$cache->set($iso_8859_5, 60);
is $syndicated_content->generateFeed->title, $ru_title, 'ISO-8859-5 encoded';

$cache->delete;

sub slurp_rss {
    my $file = shift;
    my $filepath = WebGUI::Test->getTestCollateralPath('rss/' . $file);
    open my $fh, '<', $filepath
        or die "Unable to get RSS file $file: $!";
    my $content = do { local $/; <$fh> };
    close $fh;
    return $content;
}

