package WebGUI::Wobject::MessageBoard;

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
use Tie::CPHash;
use WebGUI::DateTime;
use WebGUI::Discussion;
use WebGUI::HTML;
use WebGUI::HTMLForm;
use WebGUI::Icon;
use WebGUI::International;
use WebGUI::Privilege;
use WebGUI::Session;
use WebGUI::SQL;
use WebGUI::URL;
use WebGUI::Utility;
use WebGUI::Wobject;

our @ISA = qw(WebGUI::Wobject);

#-------------------------------------------------------------------
sub duplicate {
        my ($w);
	$w = $_[0]->SUPER::duplicate($_[1]);
        $w = WebGUI::Wobject::MessageBoard->new({wobjectId=>$w,namespace=>$_[0]->get("namespace")});
        $w->set({
		messagesPerPage=>$_[0]->get("messagesPerPage"),
		templateId=>$_[0]->get("templateId")
		});
}

#-------------------------------------------------------------------
sub name {
        return WebGUI::International::get(2,$_[0]->get("namespace"));
}

#-------------------------------------------------------------------
sub new {
        my $class = shift;
        my $property = shift;
        my $self = WebGUI::Wobject->new(
                $property,
                [qw(templateId messagesPerPage)]
                );
        bless $self, $class;
}

#-------------------------------------------------------------------
sub set {
        $_[0]->SUPER::set($_[1],[qw(templateId messagesPerPage)]);
}

#-------------------------------------------------------------------
sub status {
        if ($_[0] eq "Approved") {
                return WebGUI::International::get(560);
        } elsif ($_[0] eq "Denied") {
                return WebGUI::International::get(561);
        } elsif ($_[0] eq "Pending") {
                return WebGUI::International::get(562);
        }
}

#-------------------------------------------------------------------
sub www_edit {
	return WebGUI::Privilege::insufficient() unless (WebGUI::Privilege::canEditPage());
	my $messagesPerPage = $_[0]->get("messagesPerPage") || 50;
        my $output = helpIcon(1,$_[0]->get("namespace"));
	$output .= '<h1>'.WebGUI::International::get(6,$_[0]->get("namespace")).'</h1>';
	my $properties = WebGUI::HTMLForm->new;
	my $layout = WebGUI::HTMLForm->new;
        $layout->integer("messagesPerPage",WebGUI::International::get(4,$_[0]->get("namespace")),$messagesPerPage);
	$layout->template(
                -name=>"templateId",
                -value=>$_[0]->get("templateId"),
                -namespace=>$_[0]->get("namespace"),
                -label=>WebGUI::International::get(72,$_[0]->get("namespace")),
                -afterEdit=>'func=edit&wid='.$_[0]->get("wobjectId")
                );
	$properties->raw($_[0]->SUPER::discussionProperties);
	$output .= $_[0]->SUPER::www_edit(
		-layout=>$layout->printRowsOnly,
		-properties=>$properties->printRowsOnly
		);
        return $output;
}

#-------------------------------------------------------------------
sub www_editSave {
	return WebGUI::Privilege::insufficient() unless (WebGUI::Privilege::canEditPage());
	$_[0]->SUPER::www_editSave({
		messagesPerPage=>$session{form}{messagesPerPage},
		templateId=>$session{form}{templateId}
		});
        return "";
}

#-------------------------------------------------------------------
sub www_showMessage {
        return $_[0]->SUPER::www_showMessage('<a href="'.WebGUI::URL::page().'">'.WebGUI::International::get(11,$_[0]->get("namespace")).'</a><br>');
}

#-------------------------------------------------------------------
sub www_view {
	my ($p, $data, %var, @message_loop, $rows, @last, $replies);
	$var{title} = $_[0]->get("title");
	$var{description} = $_[0]->get("description");
	$var{canPost} = WebGUI::Privilege::isInGroup($_[0]->get("groupToPost"));
	$var{"post.url"} = WebGUI::URL::page('func=post&mid=new&wid='.$_[0]->get("wobjectId"));
	$var{"post.label"} = WebGUI::International::get(17,$_[0]->get("namespace"));
	$var{"search.url"} = WebGUI::URL::page('func=search&wid='.$_[0]->get("wobjectId"));
	$var{"search.label"} = WebGUI::International::get(364);
	$var{"subject.label"} = WebGUI::International::get(229);
	$var{"user.label"} = WebGUI::International::get(15,$_[0]->get("namespace"));
	$var{"date.label"} = WebGUI::International::get(18,$_[0]->get("namespace"));
	$var{"views.label"} = WebGUI::International::get(514);
	$var{"replies.label"} = WebGUI::International::get(19,$_[0]->get("namespace"));
	$var{"last.label"} = WebGUI::International::get(20,$_[0]->get("namespace"));
	$p = WebGUI::Paginator->new(WebGUI::URL::page('wid='.$_[0]->get("wobjectId").'&func=view'),[],$_[0]->get("messagesPerPage"));
	$p->setDataByQuery("select messageId,subject,username,dateOfPost,userId,views,status
		from discussion where wobjectId=".$_[0]->get("wobjectId")." and pid=0 
		and (status='Approved' or userId=$session{user}{userId}) order by dateOfPost desc");
	$rows = $p->getPageData;
	foreach $data (@$rows) {
		@last = WebGUI::SQL->quickArray("select messageId,dateOfPost,username,subject,userId 
			from discussion where wobjectId=".$_[0]->get("wobjectId")." and rid=$data->{messageId} 
			and status='Approved' order by dateOfPost desc");
		($replies) = WebGUI::SQL->quickArray("select count(*) from discussion 
			where rid=$data->{messageId} and status='Approved'");
		$replies--;
		push (@message_loop,{
			"last.url" => WebGUI::URL::page('func=showMessage&mid='.$last[0].'&wid='.$_[0]->get("wobjectId")),
			"last.subject" => substr(WebGUI::HTML::filter($last[3],'all'),0,30),
			"last.date" => epochToHuman($last[1]),
			"last.userProfile" => WebGUI::URL::page('op=viewProfile&uid='.$last[4]),
			"last.username" => $last[2],
			"message.replies" => $replies,
			"message.url" => WebGUI::URL::page('func=showMessage&mid='.$data->{messageId}.'&wid='.$_[0]->get("wobjectId")),
			"message.subject" => substr($data->{subject},0,30),
			"message.currentUser" => ($data->{userId} == $session{user}{userId}),
			"message.status" => status($data->{status}),
			"message.userProfile" => WebGUI::URL::page('op=viewProfile&uid='.$data->{userId}),
			"message.username" => $data->{username},
			"message.date" => epochToHuman($data->{dateOfPost}),
			"message.views" => $data->{views}
			});
        }
	$var{message_loop} = \@message_loop;
        $var{firstPage} = $p->getFirstPageLink;
        $var{lastPage} = $p->getLastPageLink;
        $var{nextPage} = $p->getNextPageLink;
        $var{pageList} = $p->getPageLinks;
        $var{previousPage} = $p->getPreviousPageLink;
        $var{multiplePages} = ($p->getNumberOfPages > 1);
        return $_[0]->processTemplate($_[0]->get("templateId"),\%var);
}

1;

