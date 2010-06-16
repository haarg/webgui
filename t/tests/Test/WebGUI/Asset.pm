package Test::WebGUI::Asset;
#-------------------------------------------------------------------
# WebGUI is Copyright 2001-2009 Plain Black Corporation.
#-------------------------------------------------------------------
# Please read the legal notices (docs/legal.txt) and the license
# (docs/license.txt) that came with this distribution before using
# this software.
#-------------------------------------------------------------------
# http://www.plainblack.com                     info@plainblack.com
#-------------------------------------------------------------------
use base qw/My::Test::Class/;

use Test::More;
use Test::Deep;
use Test::Exception;
use WebGUI::Test;
use Data::Dumper;

sub assetUiLevel {
    return 1;
}

sub list_of_tables {
    return [qw/assetData/];
}

sub parent_list {
    return [];
}

sub getAnchoredAsset {
    my $test    = shift;
    my $session = $test->session;
    my $tag     = WebGUI::VersionTag->getWorking($session);
    my @parents = $test->getMyParents;
    my $asset   = $parents[-1]->addChild({
        className => $test->class,
    }, undef, undef, {skipNotification => 1, skipAutoCommitWorkflows => 1,});
    $tag->commit;
    foreach my $a ($asset, @parents) {
        $a = $a->cloneFromDb;
    }
    WebGUI::Test->addToCleanup($tag);
    return ($tag, $asset, @parents);
}

sub getMyParents {
    my $test           = shift;
    my $session        = $test->session;
    my $parent_classes = $test->parent_list;
    my @parents        = ();
    my $default        = WebGUI::Asset->getDefault($session);
    push @parents, $default;
    my $parent = $default;
    foreach $parent_class (@{ $parent_classes }) {
        my $new_parent = $parent->addChild({className => $parent_class}, undef, undef, {skipNotification => 1, skipAutoCommitWorkflows => 1,});
        push @parents, $new_parent;
        $parent = $new_parent;
        WebGUI::Test->addToCleanup($new_parent);
    }
    return @parents;
}

sub _constructor : Test(4) {
    my $test    = shift;
    my $session = $test->session;
    my $asset   = $test->class->new({session => $session});

    isa_ok $asset, $test->class;
    isa_ok $asset->session, 'WebGUI::Session';
    is $asset->session->getId, $session->getId, 'asset was assigned the correct session';

    note "calling new with no assetId throws an exception";
    $asset = eval { WebGUI::Asset->new($session, ''); };
    my $e = Exception::Class->caught;
    isa_ok $e, 'WebGUI::Error';

}

sub t_00_class_dispatch : Test(2) {
    my $test    = shift;
    my $session = $test->session;
    note "Class dispatch";
    my $asset   = $test->class->new({session => $session});

    my $asset = WebGUI::Asset->new({
        session   => $session,
        title     => 'testing snippet',
        className => 'WebGUI::Asset::Snippet',
    });

    isa_ok $asset, 'WebGUI::Asset';
    is $asset->className, 'WebGUI::Asset', 'passing className is ignored';
}

sub t_00_get_tables : Test(1) {
    my $test    = shift;
    note "get_tables";
    my @tables = $test->class->meta->get_tables;
    cmp_bag(
        \@tables,
        $test->list_of_tables,
        'Set of tables for properties is correct'
    );
}

sub t_00_getParent : Test(2) {
    my $test    = shift;
    my $session = $test->session;
    note "getParent";
    my $testId1      = 'wg8TestAsset0000000001';
    my $testId2      = 'wg8TestAsset0000000002';
    my $now          = time();
    my $baseLineage  = $session->db->quickScalar('select lineage from asset where assetId=?',['PBasset000000000000002']);
    my $testLineage  = $baseLineage. '909090';
    $session->db->write("insert into asset (assetId, className, lineage) VALUES (?,?,?)",       [$testId1, 'WebGUI::Asset', $testLineage]);
    $session->db->write("insert into assetData (assetId, revisionDate, status) VALUES (?,?,?)", [$testId1, $now, 'approved']);
    my $testLineage2 = $testLineage . '000001';
    $session->db->write("insert into asset (assetId, className, parentId, lineage) VALUES (?,?,?,?)", [$testId2, 'WebGUI::Asset', $testId1, $testLineage2]);
    $session->db->write("insert into assetData (assetId, revisionDate) VALUES (?,?)", [$testId2, $now]);

    my $testAsset = WebGUI::Asset->new($session, $testId2, $now);
    is $testAsset->parentId, $testId1, 'parentId assigned correctly on db fetch in new';
    my $testParent = $testAsset->getParent();
    isa_ok $testParent, 'WebGUI::Asset';

    $session->db->write("delete from asset where assetId like 'wg8TestAsset00000%'");
    $session->db->write("delete from assetData where assetId like 'wg8TestAsset00000%'");
}

sub t_00_newByPropertyHashRef : Test(2) {
    my $test    = shift;
    my $session = $test->session;
    note "newByPropertyHashRef";
    my $asset;
    $asset = WebGUI::Asset->newByPropertyHashRef($session, {className => $test->class, title => 'The Shawshank Snippet'});
    isa_ok $asset, $test->class;
    is $asset->title, 'The Shawshank Snippet', 'title is assigned from the property hash';
}

sub t_00_scan_properties : Test(1) {
    note "scan properties for table definitions";
    my $test    = shift;
    my @properties = $test->class->meta->get_all_properties;
    my @undefined_tables = ();
    foreach my $prop (@properties) {
        push @undefined_tables, $prop->name if (!$prop->tableName);
    }
    ok !@undefined_tables, "all properties have tables defined"
        or diag "except these: ".join ", ", @undefined_tables;
}

sub t_01_assetId : Test(4) {
    my $test    = shift;
    my $session = $test->session;
    my $asset   = $test->class->new({session => $session});
    note "assetId, getId";
    can_ok $asset, qw/assetId getId/;
    ok $session->id->valid( $asset->assetId), 'assetId generated by default is valid';
    is $asset->assetId, $asset->getId, '... getId is an alias for assetId';

    $asset = $test->class->new({ session => $session, assetId => '' });
    ok !$session->id->valid($asset->assetId), 'blank assetId in constructor is okay??';
}

sub t_01_title : Test(6) {
    my $test    = shift;
    my $session = $test->session;
    my $asset   = $test->class->new({session => $session});

    note "title";
    can_ok $asset, 'title';
    is $asset->title, 'Untitled', 'title: default is untitled';

    $asset->title('asset title');
    is $asset->title, 'asset title', '... set, get';
    $asset->title('');
    is $asset->title, 'Untitled', '... get default title when empty title set';
    $asset->title('<h1>Header</h1>text');
    is $asset->title, 'Headertext', '... HTML is filtered out';
    $asset->title('<h1></h1>');
    is $asset->title, 'Untitled', '... if HTML filters out all, returns default';

    #is $asset->get('title'), $asset->title, '... get(title) works';

}

sub t_01_menuTitle : Test(8) {
    my $test    = shift;
    my $session = $test->session;
    my $asset = $test->class->new({session => $session});

    note "menuTitle";

    can_ok $asset, 'menuTitle';
    is $asset->menuTitle, 'Untitled', 'menuTitle: default is untitled';

    $asset = $test->class->new({
        session => $session,
        title   => 'asset title',
    });

    is $asset->menuTitle, 'asset title', 'menuTitle: default is title';

    $asset->menuTitle('asset menuTitle');
    is $asset->menuTitle, 'asset menuTitle', '... set and get';

    $asset->menuTitle('');
    is $asset->menuTitle, 'asset title', '... set to default when trying to clear the title';

    $asset->menuTitle('<h1>Header</h1>text');
    is $asset->menuTitle, 'Headertext', '... HTML is filtered out';
    $asset->menuTitle('<h1></h1>');
    is $asset->menuTitle, 'asset title', '... if HTML filters out all, returns default';

    $asset = $test->class->new({
        session   => $session,
        title     => 'asset title',
        menuTitle => 'menuTitle asset',
    });
    is $asset->menuTitle, 'menuTitle asset', '... set via constructor';
}

sub t_01_uiLevel : Test(1) {
    my $test    = shift;
    my $session = $test->session;
    note "uiLevel";
    my $asset   = $test->class->new({session => $session});
    is $asset->uiLevel, $test->assetUiLevel, 'asset uiLevel check';
}

sub t_01_write_update : Test(8) {
    my $test    = shift;
    my $session = $test->session;
    note "write, update";

    my $testId       = 'wg8TestAsset0000000001';
    my $revisionDate = time();
    $session->db->write("insert into asset (assetId) VALUES (?)", [$testId]);
    $session->db->write("insert into assetData (assetId, revisionDate) VALUES (?,?)", [$testId, $revisionDate]);

    my $testAsset = WebGUI::Asset->new($session, $testId, $revisionDate);
    $testAsset->title('wg8 test title');
    $testAsset->lastModified(0);
    is $testAsset->assetSize, 0, 'assetSize is 0 by default';
    $testAsset->write();
    isnt $testAsset->lastModified, 0, 'lastModified updated on write';
    isnt $testAsset->assetSize,    0, 'assetSize    updated on write';

    my $testData = $session->db->quickHashRef('select * from assetData where assetId=? and revisionDate=?',[$testId, $revisionDate]);
    is $testData->{title}, 'wg8 test title', 'data written correctly to db';

    $testAsset->update({
        isHidden    => 1,
        encryptPage => 1,
    });

    is $testAsset->isHidden,    1, 'isHidden set via update';
    is $testAsset->encryptPage, 1, 'encryptPage set via update';

    $testData = $session->db->quickHashRef('select * from assetData where assetId=? and revisionDate=?',[$testId, $revisionDate]);
    is $testData->{isHidden},    1, 'isHidden written correctly to db';
    is $testData->{encryptPage}, 1, 'encryptPage written correctly to db';

    $session->db->write("delete from asset where assetId=?", [$testId]);
    $session->db->write("delete from assetData where assetId=?", [$testId]);
}

sub t_03_addRevision : Test(5) {
    note "cut";
    my $test    = shift;
    my $session = $test->session;
    my ($tag, $asset, @parents) = $test->getAnchoredAsset();
    ok $asset->cut, 'cut returns true if it was cut';
    is $asset->state, 'clipboard', 'asset state updated';
    my $session_asset = $session->asset();
    $session->asset($parents[-1]);
    ok $asset->canPaste, 'canPaste: allowed to paste here';
    ok $parents[-1]->paste($asset->assetId), 'paste returns true when it pastes';
    $asset_prime = $asset->cloneFromDb;
    is $asset_prime->state, 'published', 'asset state updated';
    $session->asset($session_asset);
}

sub t_05_cut_paste : Test(5) {
    note "cut";
    my $test    = shift;
    my $session = $test->session;
    my ($tag, $asset, @parents) = $test->getAnchoredAsset();
    ok $asset->cut, 'cut returns true if it was cut';
    is $asset->state, 'clipboard', 'asset state updated';
    my $session_asset = $session->asset();
    $session->asset($parents[-1]);
    ok $asset->canPaste, 'canPaste: allowed to paste here';
    ok $parents[-1]->paste($asset->assetId), 'paste returns true when it pastes';
    $asset_prime = $asset->cloneFromDb;
    is $asset_prime->state, 'published', 'asset state updated';
    $session->asset($session_asset);
}

sub t_05_keywords : Test(3) {
    my $test    = shift;
    my $session = $test->session;
    my ($tag, $asset, @parents) = $test->getAnchoredAsset();
    can_ok $asset, 'keywords';
    $asset->keywords('chess set');
    is $asset->keywords, 'chess set', 'set and get of keywords via direct accessor';
    is $asset->get('keywords'), 'chess set', 'via get method';
}

sub t_05_purge : Test(3) {
    note "purge";
    my $test    = shift;
    my $session = $test->session;
    my ($tag, $asset, @parents) = $test->getAnchoredAsset();
    my @tables = $asset->meta->get_tables;
    ok $asset->purge, 'purge returns true if it was purged';
    throws_ok { WebGUI::Asset->newById($session, $asset->assetId); } 'WebGUI::Error::InvalidParam', 'Unable to fetch asset by assetId now';
    my $exists_in_table = 0;
    foreach my $table (@tables) {
        $exists_in_table ||= $session->db->quickScalar("select count(*) from `$table` where assetId=?",[$asset->assetId]);
    }
    ok ! $exists_in_table, 'assetId removed from all asset tables';
}

1;

__END__

{
    note "getClassById";
    my $class;
    $class = WebGUI::Asset->getClassById($session, 'PBasset000000000000001');
    is $class, 'WebGUI::Asset', 'getClassById: retrieve a class';
    $class = WebGUI::Asset->getClassById($session, 'PBasset000000000000001');
    is $class, 'WebGUI::Asset', '... cache check';
    $class = WebGUI::Asset->getClassById($session, 'PBasset000000000000002');
    is $class, 'WebGUI::Asset::Wobject::Folder', '... retrieve another class';
}

{
    note "new, fetching from db";
    my $asset;
    $asset = WebGUI::Asset->new($session, 'PBasset000000000000001');
    isa_ok $asset, 'WebGUI::Asset';
    is $asset->title, 'Root', 'got the right asset';
}

{
    note "getDefault";
    my $asset = WebGUI::Asset->getDefault($session);
    isa_ok $asset, 'WebGUI::Asset::Wobject::Layout';
}

{
    note "get gets WebGUI::Definition properties, and standard attributes";
    my $asset = WebGUI::Asset->new({session => $session, parentId => 'I have a parent'});
    is $asset->get('className'), 'WebGUI::Asset', 'get(property) works on className';
    is $asset->get('assetId'),  $asset->assetId,   '... works on assetId';
    is $asset->get('parentId'), 'I have a parent',  '... works on parentId';
    my $properties = $asset->get();
    is $properties->{className}, 'WebGUI::Asset', 'get() works on className';
    is $properties->{assetId},  $asset->assetId,   '... works on assetId';
    is $properties->{parentId}, 'I have a parent',  '... works on parentId';
}

