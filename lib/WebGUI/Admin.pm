package WebGUI::Admin;

# The new WebGUI Admin console

use Moose;
use JSON qw( from_json to_json );
use namespace::autoclean;

has 'session' => (
    is          => 'ro',
    isa         => 'WebGUI::Session',
    required    => 1,
);

sub BUILDARGS {
    my ( $class, $session, @args ) = @_;
    return { session => $session, @args };
}

# Use the template data located in our DATA block
my $tdata   = do { local $/ = undef; <WebGUI::Admin::DATA> };

#----------------------------------------------------------------------

sub getAdminPluginTemplateVars {
    my $self    = shift;
    my $session = $self->session;
    my ( $user, $url, $setting ) = $session->quick(qw(user url setting));
    my $functions = $session->config->get("adminConsole");
    my %processed;  # title => attributes

    # process the raw information from the config file
    foreach my $funcId ( keys %{$functions} ) {
        my $funcDef = $functions->{$funcId};
        my $var     = {};

        # If we have a class name, we've got a new WebGUI::Admin::Plugin
        if ( $funcDef->{className} ) {
            my $plugin = $funcDef->{className}->new( $session, $funcId, $funcDef );
            next unless $plugin->canUse;
            $var = {
                title           => $plugin->getTitle,
                icon            => $plugin->getIcon,
                'icon.small'    => $plugin->getIconSmall,
                url             => $plugin->getUrl,
            };

            # build the list of processed items
            $processed{$plugin->getTitle} = $var;
        }
        # Don't know what we have (old admin console functions)
        else {
            # make title
            my $title = $funcDef->{title};
            WebGUI::Macro::process( $session, \$title );

            # determine if the user can use this thing
            my $canUse = 0;
            if ( defined $funcDef->{group} ) {
                $canUse = $user->isInGroup( $funcDef->{group} );
            }
            elsif ( defined $funcDef->{groupSetting} ) {
                $canUse = $user->isInGroup( $setting->get( $funcDef->{groupSetting} ) );
            }
            if ( $funcDef->{uiLevel} > $user->profileField("uiLevel") ) {
                $canUse = 0;
            }
            next unless $canUse;

            # build the attributes
            $var = {
                title        => $title,
                icon         => $url->extras( "/adminConsole/" . $funcDef->{icon} ),
                'icon.small' => $url->extras( "adminConsole/small/" . $funcDef->{icon} ),
                url          => $funcDef->{url},
            };

            # build the list of processed items
            $processed{$title} = $var;

        } ## end else [ if ( $funcDef->{className...})]

    } ## end foreach my $funcId ( keys %...)

    #sort the functions alphabetically
    return [ map { $processed{$_} } sort keys %processed ];
} ## end sub getAdminFunctionTemplateVars

#----------------------------------------------------------------------

=head2 getClipboardTemplateVars

=cut

sub getClipboardTemplateVars {
    my ( $self ) = @_;
    my $session = $self->session;
    my $vars    = [];
    my $clipboardItems = $session->asset->getAssetsInClipboard(1);

}

#----------------------------------------------------------------------

=head2 getNewContentTemplateVars 

=cut

sub getNewContentTemplateVars {
    my ( $self ) = @_;
    my $session = $self->session;
    my ( $user ) = $session->quick(qw( user ));
    my $vars    = [];
}

#----------------------------------------------------------------------------

=head2 getTreePaginator ( $asset )

Get a page for the Asset Tree view. Returns a WebGUI::Paginator object 
filled with asset IDs.

=cut

sub getTreePaginator {
    my ( $self, $asset ) = @_;
    my $session = $self->session;

    my $orderByColumn       = $session->form->get( 'orderByColumn' ) 
                            || "lineage"
                            ;
    my $orderByDirection    = lc $session->form->get( 'orderByDirection' ) eq "desc"
                            ? "DESC"
                            : "ASC"
                            ;

    my $recordOffset        = $session->form->get( 'recordOffset' ) || 1;
    my $rowsPerPage         = $session->form->get( 'rowsPerPage' ) || 100;
    my $currentPage         = int ( $recordOffset / $rowsPerPage ) + 1;

    my $p           = WebGUI::Paginator->new( $session, '', $rowsPerPage, 'pn', $currentPage );

    my $orderBy     = $session->db->dbh->quote_identifier( $orderByColumn ) . ' ' . $orderByDirection;
    $p->setDataByArrayRef( $asset->getLineage( ['children'], { orderByClause => $orderBy } ) );
    
    return $p;
}


#----------------------------------------------------------------------

=head2 getVersionTagTemplateVars

=cut

sub getVersionTagTemplateVars {
    my ( $self ) = @_;
    my $session = $self->session;
    my ( $user ) = $session->quick(qw( user ));
    my $vars    = [];

    my $working = WebGUI::VersionTag->getWorking( $session, "nocreate" );
    my $tags = WebGUI::VersionTag->getOpenTags($session);
    if ( @$tags ) {
        for my $tag ( @$tags ) {
            next unless $user->isInGroup( $tag->get("groupToUse") );
            push @$vars, {
                name        => $tag->get("name"),
                isWorking   => ( $working && $working->getId eq $tag->getId ) ? 1 : 0,
                joinUrl     => $tag->getJoinUrl,
                editUrl     => $tag->getEditUrl,
            };
        }
    }

    return $vars;
}

#----------------------------------------------------------------------

=head2 www_getTreeData ( ) 

Get the Tree data for a given asset URL

=cut

sub www_getTreeData {
    my ( $self ) = @_;
    my $session = $self->session;
    my ( $user, $form ) = $session->quick(qw{ user form });

    my $assetUrl    = $form->get('assetUrl');
    my $asset       = WebGUI::Asset->newByUrl( $session, $assetUrl );

    my $i18n        = WebGUI::International->new( $session, "Asset" );
    my $assetInfo   = { assets => [] };
    my $p           = $self->getTreePaginator( $asset );

    for my $assetId ( @{ $p->getPageData } ) {
        my $asset       = WebGUI::Asset->newById( $session, $assetId );

        # Populate the required fields to fill in
        my %fields      = (
            assetId         => $asset->getId,
            url             => $asset->getUrl,
            lineage         => $asset->lineage,
            title           => $asset->menuTitle,
            revisionDate    => $asset->revisionDate,
            childCount      => $asset->getChildCount,
            assetSize       => $asset->assetSize,
            lockedBy        => ($asset->isLockedBy ? $asset->lockedBy->username : ''),
            canEdit         => $asset->canEdit && $asset->canEditIfLocked,
            helpers         => $asset->getHelpers,
        );

        $fields{ className } = {};
        # The asset icon
        $fields{ icon } = $asset->getIcon("small");

        # The asset type (i18n name)
        $fields{ className } = $asset->getName;

        push @{ $assetInfo->{ assets } }, \%fields;
    }

    $assetInfo->{ totalAssets   } = $p->getRowCount;
    $assetInfo->{ sort          } = $session->form->get( 'orderByColumn' );
    $assetInfo->{ dir           } = lc $session->form->get( 'orderByDirection' );
    $assetInfo->{ currentAsset  } = { 
        assetId => $asset->getId,
        url     => $asset->getUrl,
        title => $asset->getTitle,
        icon    => $asset->getIcon("small"),
        helpers => $asset->getHelpers,
    };

    $assetInfo->{ crumbtrail    } = [];
    for my $asset ( @{ $asset->getLineage( ['ancestors'], { returnObjects => 1 } ) } ) {
        push @{ $assetInfo->{crumbtrail} }, {
            title       => $asset->getTitle,
            url         => $asset->getUrl
        };
    }

    $session->http->setMimeType( 'application/json' );

    return to_json( $assetInfo );
}

#----------------------------------------------------------------------

=head2 www_view ( session )

Show the main Admin console wrapper

=cut

sub www_view {
    my ( $self ) = @_;
    my $session = $self->session;
    my ( $user, $url, $style ) = $session->quick(qw{ user url style });

    my $var;
    $var->{backToSiteUrl} = $url->page;

    # Add vars for AdminBar
    $var->{adminPlugins} = $self->getAdminPluginTemplateVars;
    $var->{versionTags} = $self->getVersionTagTemplateVars;
    #$var->{clipboardAssets} = $self->getClipboardTemplateVars;
    $var->{newContentTabs} = $self->getNewContentTemplateVars;

    # Add vars for current user
    $var->{username}   = $user->username;
    $var->{profileUrl} = $user->getProfileUrl;
    $var->{logoutUrl}  = $url->page("op=auth;method=logout");

    # Add vars for current version tag
    if ( my $tag = WebGUI::VersionTag->getWorking( $session, "nocreate" ) ) {
        $var->{tagName}         = $tag->get("name");
        $var->{tagEditUrl}      = $tag->getEditUrl;
        $var->{tagPublishUrl}   = "";                  #TODO
        $var->{tagLeaveUrl}     = "";                  #TODO
    }

    $var->{viewUrl} = $url->page;
    $var->{homeUrl} = WebGUI::Asset->getDefault( $session )->getUrl;

    # All this needs to be template attachments
    $style->setLink( $url->yui2('build/button/assets/skins/sam/button.css'), {type=>"text/css",rel=>"stylesheet"});
    $style->setLink( $url->yui2('build/menu/assets/skins/sam/menu.css'), {type=>"text/css",rel=>"stylesheet"});
    $style->setLink( $url->yui2('build/tabview/assets/skins/sam/tabview.css'), {type=>"text/css",rel=>"stylesheet"});
    $style->setLink( $url->yui2('build/paginator/assets/skins/sam/paginator.css'), {rel=>'stylesheet', type=>'text/css'});
    $style->setLink( $url->yui2('build/datatable/assets/skins/sam/datatable.css'), {rel=>'stylesheet', type=>'text/css'});
    $style->setLink( $url->yui2('build/menu/assets/skins/sam/menu.css'), {rel=>'stylesheet', type=>'text/css'});
    $style->setLink( $url->extras('yui-webgui/build/assetManager/assetManager.css' ), { rel => "stylesheet", type => 'text/css' } );
    $style->setLink( $url->extras('macro/AdminBar/slidePanel.css'), {type=>'text/css', rel=>'stylesheet'});
    $style->setLink( $url->extras('admin/admin.css'), { type=>'text/css', rel=>'stylesheet'} );
    $style->setScript($url->yui2('build/yahoo-dom-event/yahoo-dom-event.js'), {type=>'text/javascript'});
    $style->setScript($url->yui2('build/utilities/utilities.js'), {type=>'text/javascript'});
    $style->setScript($url->extras('accordion/accordion.js'), {type=>'text/javascript'});
    $style->setScript($url->extras('admin/admin.js'), {type=>'text/javascript'});
    $style->setScript($url->yui2('build/element/element-min.js'), {type=>"text/javascript"});
    $style->setScript( $url->yui2( 'build/paginator/paginator-min.js ' ) );
    $style->setScript( $url->yui2( 'build/datasource/datasource-min.js ' ) );
    $style->setScript( $url->yui2( 'build/datatable/datatable-min.js ' ) );
    $style->setScript( $url->yui2( 'build/container/container-min.js' ) );
    $style->setScript($url->yui2('build/tabview/tabview-min.js'), {type=>"text/javascript"});
    $style->setScript($url->yui2('build/menu/menu-min.js'), {type=>"text/javascript"});
    $style->setScript($url->yui2('build/button/button-min.js'), {type=>"text/javascript"});

    $style->setScript( $url->yui2( 'build/json/json-min.js' ) );
    $style->setScript( $url->extras( 'yui-webgui/build/i18n/i18n.js' ) );

    # Use the template in our __DATA__ block
    my $tmpl    = WebGUI::Asset::Template::HTMLTemplate->new( $session );

    # Use the blank style
    my $output = $style->process( $tmpl->process( $tdata, $var ), "PBtmplBlankStyle000001" );

    return $output;
} ## end sub www_view

1;

__DATA__
<dl class="accordion-menu">
    <dt class="a-m-t">^International("admin console","AdminConsole");</dt>
    <dd class="a-m-d"><div class="bd">
        <TMPL_LOOP adminPlugins>
        <a class="link" href="<tmpl_var url>">
            <img src="<tmpl_var icon.small>" style="border: 0px; vertical-align: middle;" alt="icon" />
            <tmpl_var title>
        </a>
        </TMPL_LOOP>
    </div></dd>
</dl>

<div id="wrapper" class="yui-skin-sam">

    <div id="versionTag" <TMPL_UNLESS tagName>style="display: none"</TMPL_UNLESS> >
        <div style="float: right">Publish | Leave</div>
        <a href="<tmpl_var tagEditUrl>" id="tagEditLink" target="view">
            <img src="^Extras(icon/tag_blue.png);" class="icon"/>
            <tmpl_var tagName>
        </a>
    </div>
    <div id="user">
        <div style="float: right">Back to Site | Log Out</div>
        <a href="<tmpl_var userEditUrl>" target="view">
            <img src="^Extras(icon/user.png);" class="icon" />
            <tmpl_var userName>
        </a>
    </div>

    <div id="tabBar" class="yui-navset">
        <ul class="yui-nav">
            <li class="selected"><a href="#tab1"><em>View</em></a></li>
            <li><a href="#tab2"><em>Tree</em></a></li>
        </ul>
        <div id="locationBar">
            <span id="left">
                <input type="button" id="backButton" value="&lt;" /><input type="button" id="forwardButton" value="&gt;" />
            </span>
            <div id="location">
                <input type="text" id="locationUrl" value="" />
                <span id="locationTitle"></span>
            </div>
            <span id="right">
                <input type="button" id="searchButton" value="S" /><input type="button" id="homeButton" value="H" />
            </span>
            <div id="search"></div>
        </div>
        <div class="yui-content">
            <div id="viewTab"><iframe src="<tmpl_var viewUrl>" name="view" style="width: 100%; height: 80%"></iframe></div>
            <div id="treeTab">
                <div id="treeCrumbtrail"></div>
                <div id="treeDataTableContainer"></div>
                <div id="treePagination"></div>
            </div>
        </div>
    </div>


</div>

<script type="text/javascript">
YAHOO.util.Event.onDOMReady( function() { 
    window.admin = new WebGUI.Admin( {
        homeUrl : '<tmpl_var homeUrl>'
    } );
} );
</script>
