-- MySQL dump 8.21
--
-- Host: localhost    Database: WebGUI
---------------------------------------------------------
-- Server version	3.23.49

--
-- Table structure for table 'Article'
--

CREATE TABLE Article (
  wobjectId int(11) NOT NULL default '0',
  image varchar(255) default NULL,
  linkTitle varchar(255) default NULL,
  linkURL text,
  attachment varchar(255) default NULL,
  convertCarriageReturns int(11) NOT NULL default '0',
  alignImage varchar(30) NOT NULL default 'left',
  allowDiscussion int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Article'
--


INSERT INTO Article VALUES (-2,NULL,'','',NULL,0,'right',0);

--
-- Table structure for table 'EventsCalendar'
--

CREATE TABLE EventsCalendar (
  wobjectId int(11) NOT NULL default '0',
  calendarLayout varchar(30) NOT NULL default 'list',
  paginateAfter int(11) NOT NULL default '50',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'EventsCalendar'
--



--
-- Table structure for table 'EventsCalendar_event'
--

CREATE TABLE EventsCalendar_event (
  EventsCalendar_eventId int(11) NOT NULL default '0',
  wobjectId int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  description text,
  startDate int(11) default NULL,
  endDate int(11) default NULL,
  EventsCalendar_recurringEventId int(11) NOT NULL default '0',
  PRIMARY KEY  (EventsCalendar_eventId)
) TYPE=MyISAM;

--
-- Dumping data for table 'EventsCalendar_event'
--



--
-- Table structure for table 'ExtraColumn'
--

CREATE TABLE ExtraColumn (
  wobjectId int(11) NOT NULL default '0',
  spacer int(11) default NULL,
  width int(11) default NULL,
  class varchar(50) default NULL,
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'ExtraColumn'
--



--
-- Table structure for table 'FAQ'
--

CREATE TABLE FAQ (
  wobjectId int(11) NOT NULL default '0',
  templateId int(11) NOT NULL default '1',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'FAQ'
--



--
-- Table structure for table 'FAQ_question'
--

CREATE TABLE FAQ_question (
  wobjectId int(11) NOT NULL default '0',
  FAQ_questionId int(11) NOT NULL default '0',
  question text,
  answer text,
  sequenceNumber int(11) NOT NULL default '0',
  PRIMARY KEY  (FAQ_questionId)
) TYPE=MyISAM;

--
-- Dumping data for table 'FAQ_question'
--



--
-- Table structure for table 'FileManager'
--

CREATE TABLE FileManager (
  wobjectId int(11) NOT NULL default '0',
  paginateAfter int(11) NOT NULL default '50',
  displayThumbnails int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'FileManager'
--



--
-- Table structure for table 'FileManager_file'
--

CREATE TABLE FileManager_file (
  FileManager_fileId int(11) NOT NULL default '0',
  wobjectId int(11) NOT NULL default '0',
  fileTitle varchar(128) NOT NULL default 'untitled',
  downloadFile varchar(255) default NULL,
  groupToView int(11) NOT NULL default '2',
  briefSynopsis varchar(255) default NULL,
  dateUploaded int(11) default NULL,
  sequenceNumber int(11) NOT NULL default '1',
  alternateVersion1 varchar(255) default NULL,
  alternateVersion2 varchar(255) default NULL,
  PRIMARY KEY  (FileManager_fileId)
) TYPE=MyISAM;

--
-- Dumping data for table 'FileManager_file'
--



--
-- Table structure for table 'Item'
--

CREATE TABLE Item (
  wobjectId int(11) NOT NULL default '0',
  linkURL text,
  attachment varchar(255) default NULL,
  templateId int(11) NOT NULL default '1',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Item'
--



--
-- Table structure for table 'LinkList'
--

CREATE TABLE LinkList (
  wobjectId int(11) NOT NULL default '0',
  indent int(11) NOT NULL default '0',
  lineSpacing int(11) NOT NULL default '1',
  bullet varchar(255) NOT NULL default '&middot;',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'LinkList'
--



--
-- Table structure for table 'LinkList_link'
--

CREATE TABLE LinkList_link (
  wobjectId int(11) NOT NULL default '0',
  LinkList_linkId int(11) NOT NULL default '0',
  name varchar(128) default NULL,
  url text,
  description text,
  sequenceNumber int(11) NOT NULL default '0',
  newWindow int(11) NOT NULL default '0',
  PRIMARY KEY  (LinkList_linkId)
) TYPE=MyISAM;

--
-- Dumping data for table 'LinkList_link'
--



--
-- Table structure for table 'MailForm'
--

CREATE TABLE MailForm (
  wobjectId int(11) NOT NULL default '0',
  width int(11) NOT NULL default '0',
  fromField text,
  fromStatus char(1) default '0',
  toField text,
  toStatus char(1) default '0',
  ccField text,
  ccStatus char(1) default '0',
  bccField text,
  bccStatus char(1) default '0',
  subjectField text,
  subjectStatus char(1) default '0',
  acknowledgement text,
  storeEntries char(1) default NULL
) TYPE=MyISAM;

--
-- Dumping data for table 'MailForm'
--



--
-- Table structure for table 'MailForm_entry'
--

CREATE TABLE MailForm_entry (
  MailForm_entryId int(11) NOT NULL default '0',
  wobjectId int(11) NOT NULL default '0',
  userId int(11) default NULL,
  username varchar(255) default NULL,
  ipAddress varchar(255) default NULL,
  submissionDate int(11) NOT NULL default '0',
  PRIMARY KEY  (MailForm_entryId)
) TYPE=MyISAM;

--
-- Dumping data for table 'MailForm_entry'
--



--
-- Table structure for table 'MailForm_entryData'
--

CREATE TABLE MailForm_entryData (
  MailForm_entryId int(11) NOT NULL default '0',
  wobjectId int(11) NOT NULL default '0',
  sequenceNumber int(11) NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  value text
) TYPE=MyISAM;

--
-- Dumping data for table 'MailForm_entryData'
--



--
-- Table structure for table 'MailForm_field'
--

CREATE TABLE MailForm_field (
  wobjectId int(11) NOT NULL default '0',
  MailForm_fieldId int(11) NOT NULL default '0',
  sequenceNumber int(11) NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  status char(1) NOT NULL default '0',
  type varchar(30) NOT NULL default '',
  possibleValues text,
  defaultValue text,
  PRIMARY KEY  (MailForm_fieldId)
) TYPE=MyISAM;

--
-- Dumping data for table 'MailForm_field'
--



--
-- Table structure for table 'MessageBoard'
--

CREATE TABLE MessageBoard (
  wobjectId int(11) NOT NULL default '0',
  messagesPerPage int(11) NOT NULL default '50',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'MessageBoard'
--



--
-- Table structure for table 'Poll'
--

CREATE TABLE Poll (
  wobjectId int(11) NOT NULL default '0',
  active int(11) NOT NULL default '1',
  graphWidth int(11) NOT NULL default '150',
  voteGroup int(11) default NULL,
  question varchar(255) default NULL,
  a1 varchar(255) default NULL,
  a2 varchar(255) default NULL,
  a3 varchar(255) default NULL,
  a4 varchar(255) default NULL,
  a5 varchar(255) default NULL,
  a6 varchar(255) default NULL,
  a7 varchar(255) default NULL,
  a8 varchar(255) default NULL,
  a9 varchar(255) default NULL,
  a10 varchar(255) default NULL,
  a11 varchar(255) default NULL,
  a12 varchar(255) default NULL,
  a13 varchar(255) default NULL,
  a14 varchar(255) default NULL,
  a15 varchar(255) default NULL,
  a16 varchar(255) default NULL,
  a17 varchar(255) default NULL,
  a18 varchar(255) default NULL,
  a19 varchar(255) default NULL,
  a20 varchar(255) default NULL,
  karmaPerVote int(11) NOT NULL default '0',
  randomizeAnswers int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Poll'
--



--
-- Table structure for table 'Poll_answer'
--

CREATE TABLE Poll_answer (
  wobjectId int(11) NOT NULL default '0',
  answer char(3) default NULL,
  userId int(11) default NULL,
  ipAddress varchar(50) default NULL
) TYPE=MyISAM;

--
-- Dumping data for table 'Poll_answer'
--



--
-- Table structure for table 'Product'
--

CREATE TABLE Product (
  wobjectId int(11) NOT NULL default '0',
  image1 varchar(255) default NULL,
  image2 varchar(255) default NULL,
  image3 varchar(255) default NULL,
  brochure varchar(255) default NULL,
  manual varchar(255) default NULL,
  warranty varchar(255) default NULL,
  price varchar(255) default NULL,
  productNumber varchar(255) default NULL,
  templateId int(11) NOT NULL default '1',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Product'
--



--
-- Table structure for table 'Product_accessory'
--

CREATE TABLE Product_accessory (
  wobjectId int(11) NOT NULL default '0',
  AccessoryWobjectId int(11) NOT NULL default '0',
  sequenceNumber int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId,AccessoryWobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Product_accessory'
--



--
-- Table structure for table 'Product_benefit'
--

CREATE TABLE Product_benefit (
  wobjectId int(11) NOT NULL default '0',
  Product_benefitId int(11) NOT NULL default '0',
  benefit varchar(255) default NULL,
  sequenceNumber int(11) NOT NULL default '0',
  PRIMARY KEY  (Product_benefitId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Product_benefit'
--



--
-- Table structure for table 'Product_feature'
--

CREATE TABLE Product_feature (
  wobjectId int(11) NOT NULL default '0',
  Product_featureId int(11) NOT NULL default '0',
  feature varchar(255) default NULL,
  sequenceNumber int(11) NOT NULL default '0',
  PRIMARY KEY  (Product_featureId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Product_feature'
--



--
-- Table structure for table 'Product_related'
--

CREATE TABLE Product_related (
  wobjectId int(11) NOT NULL default '0',
  RelatedWobjectId int(11) NOT NULL default '0',
  sequenceNumber int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId,RelatedWobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Product_related'
--



--
-- Table structure for table 'Product_specification'
--

CREATE TABLE Product_specification (
  wobjectId int(11) NOT NULL default '0',
  Product_specificationId int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  value varchar(255) default NULL,
  units varchar(255) default NULL,
  sequenceNumber int(11) NOT NULL default '0',
  PRIMARY KEY  (Product_specificationId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Product_specification'
--



--
-- Table structure for table 'SQLReport'
--

CREATE TABLE SQLReport (
  wobjectId int(11) NOT NULL default '0',
  template text,
  dbQuery text,
  DSN varchar(255) default NULL,
  username varchar(255) default NULL,
  identifier varchar(255) default NULL,
  convertCarriageReturns int(11) NOT NULL default '0',
  paginateAfter int(11) NOT NULL default '50',
  preprocessMacros int(11) NOT NULL default '0',
  debugMode int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'SQLReport'
--



--
-- Table structure for table 'SiteMap'
--

CREATE TABLE SiteMap (
  wobjectId int(11) NOT NULL default '0',
  startAtThisLevel int(11) default NULL,
  depth int(11) NOT NULL default '0',
  indent int(11) NOT NULL default '5',
  bullet varchar(30) NOT NULL default '&middot',
  lineSpacing int(11) NOT NULL default '1',
  displaySynopsis int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'SiteMap'
--


INSERT INTO SiteMap VALUES (-1,0,0,5,'&middot;',1,1);

--
-- Table structure for table 'Survey'
--

CREATE TABLE Survey (
  wobjectId int(11) NOT NULL default '0',
  questionOrder varchar(30) default NULL,
  groupToTakeSurvey int(11) default NULL,
  groupToViewReports int(11) default NULL,
  mode varchar(30) default NULL,
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Survey'
--



--
-- Table structure for table 'Survey_answer'
--

CREATE TABLE Survey_answer (
  wobjectId int(11) NOT NULL default '0',
  Survey_questionId int(11) NOT NULL default '0',
  Survey_answerId int(11) NOT NULL default '0',
  sequenceNumber int(11) NOT NULL default '1',
  goto int(11) default NULL,
  answer varchar(255) default NULL,
  isCorrect int(11) NOT NULL default '0',
  PRIMARY KEY  (Survey_answerId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Survey_answer'
--



--
-- Table structure for table 'Survey_question'
--

CREATE TABLE Survey_question (
  wobjectId int(11) NOT NULL default '0',
  Survey_questionId int(11) NOT NULL default '0',
  question text,
  sequenceNumber int(11) NOT NULL default '1',
  allowComment int(11) NOT NULL default '0',
  randomizeAnswers int(11) NOT NULL default '0',
  answerFieldType varchar(35) default NULL,
  PRIMARY KEY  (Survey_questionId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Survey_question'
--



--
-- Table structure for table 'Survey_response'
--

CREATE TABLE Survey_response (
  wobjectId int(11) NOT NULL default '0',
  Survey_questionId int(11) NOT NULL default '0',
  Survey_answerId int(11) NOT NULL default '0',
  Survey_responseId int(11) NOT NULL default '0',
  userId int(11) default NULL,
  username varchar(255) default NULL,
  ipAddress varchar(15) default NULL,
  response varchar(255) default NULL,
  comment text,
  dateOfResponse int(11) default NULL,
  PRIMARY KEY  (Survey_responseId)
) TYPE=MyISAM;

--
-- Dumping data for table 'Survey_response'
--



--
-- Table structure for table 'SyndicatedContent'
--

CREATE TABLE SyndicatedContent (
  wobjectId int(11) NOT NULL default '0',
  rssUrl text,
  content text,
  lastFetched int(11) default NULL,
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'SyndicatedContent'
--



--
-- Table structure for table 'USS'
--

CREATE TABLE USS (
  wobjectId int(11) NOT NULL default '0',
  groupToContribute int(11) default NULL,
  submissionsPerPage int(11) NOT NULL default '50',
  defaultStatus varchar(30) default 'Approved',
  groupToApprove int(11) NOT NULL default '4',
  allowDiscussion int(11) NOT NULL default '0',
  karmaPerSubmission int(11) NOT NULL default '0',
  templateId int(11) NOT NULL default '1',
  submissionTemplateId int(11) NOT NULL default '1',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'USS'
--



--
-- Table structure for table 'USS_submission'
--

CREATE TABLE USS_submission (
  wobjectId int(11) NOT NULL default '0',
  USS_submissionId int(11) NOT NULL default '0',
  title varchar(128) default NULL,
  dateSubmitted int(11) default NULL,
  username varchar(30) default NULL,
  userId int(11) default NULL,
  content text,
  image varchar(255) default NULL,
  attachment varchar(255) default NULL,
  status varchar(30) default NULL,
  convertCarriageReturns int(11) NOT NULL default '0',
  views int(11) NOT NULL default '0',
  PRIMARY KEY  (USS_submissionId)
) TYPE=MyISAM;

--
-- Dumping data for table 'USS_submission'
--



--
-- Table structure for table 'WobjectProxy'
--

CREATE TABLE WobjectProxy (
  wobjectId int(11) NOT NULL default '0',
  proxiedWobjectId int(11) NOT NULL default '0',
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'WobjectProxy'
--



--
-- Table structure for table 'discussion'
--

CREATE TABLE discussion (
  messageId int(11) NOT NULL default '0',
  rid int(11) default NULL,
  wobjectId int(11) NOT NULL default '0',
  pid int(11) default NULL,
  userId int(11) default NULL,
  username varchar(30) default NULL,
  subject varchar(255) default NULL,
  message text,
  dateOfPost int(11) default NULL,
  subId int(11) default NULL,
  views int(11) NOT NULL default '0',
  locked int(11) NOT NULL default '0',
  status varchar(30) NOT NULL default 'Approved',
  PRIMARY KEY  (messageId)
) TYPE=MyISAM;

--
-- Dumping data for table 'discussion'
--



--
-- Table structure for table 'groupings'
--

CREATE TABLE groupings (
  groupId int(11) NOT NULL default '0',
  userId int(11) NOT NULL default '0',
  expireDate int(11) NOT NULL default '2114402400',
  PRIMARY KEY  (groupId,userId)
) TYPE=MyISAM;

--
-- Dumping data for table 'groupings'
--


INSERT INTO groupings VALUES (5,3,2114402400);
INSERT INTO groupings VALUES (4,3,2114402400);
INSERT INTO groupings VALUES (3,3,2114402400);
INSERT INTO groupings VALUES (6,3,2114402400);

--
-- Table structure for table 'groups'
--

CREATE TABLE groups (
  groupId int(11) NOT NULL default '0',
  groupName varchar(30) default NULL,
  description varchar(255) default NULL,
  expireAfter int(11) NOT NULL default '314496000',
  karmaThreshold int(11) NOT NULL default '1000000000',
  PRIMARY KEY  (groupId)
) TYPE=MyISAM;

--
-- Dumping data for table 'groups'
--


INSERT INTO groups VALUES (1,'Visitors','This is the public group that has no privileges.',314496000,1000000000);
INSERT INTO groups VALUES (2,'Registered Users','All registered users belong to this group automatically. There are no associated privileges other than that the user has an account and is logged in.',314496000,1000000000);
INSERT INTO groups VALUES (3,'Admins','Anyone who belongs to this group has privileges to do anything and everything.',314496000,1000000000);
INSERT INTO groups VALUES (4,'Content Managers','Users that have privileges to edit content on this site. The user still needs to be added to a group that has editing privileges on specific pages.',314496000,1000000000);
INSERT INTO groups VALUES (5,'Style Managers','Users that have privileges to edit styles for this site. These privileges do not allow the user to assign privileges to a page, just define them to be used.',314496000,1000000000);
INSERT INTO groups VALUES (6,'Package Managers','Users that have privileges to add, edit, and delete packages of wobjects and pages to deploy.',314496000,1000000000);
INSERT INTO groups VALUES (7,'Everyone','A group that automatically includes all users including Visitors.',314496000,1000000000);
INSERT INTO groups VALUES (8,'Template Managers','Users that have privileges to edit templates for this site.',314496000,1000000000);
INSERT INTO groups VALUES (9,'Image Managers','Users that have privileges to add, edit, and delete images from the image manager. Content managers can view by default',314496000,1000000000);

--
-- Table structure for table 'help'
--

CREATE TABLE help (
  helpId int(11) NOT NULL default '0',
  namespace varchar(30) NOT NULL default 'WebGUI',
  titleId int(11) default NULL,
  bodyId int(11) default NULL,
  seeAlso text,
  PRIMARY KEY  (helpId,namespace),
  KEY helpId (helpId)
) TYPE=MyISAM;

--
-- Dumping data for table 'help'
--


INSERT INTO help VALUES (20,'WebGUI',670,625,'26,WebGUI;');
INSERT INTO help VALUES (1,'FileManager',61,71,'2,DownloadManager;21,WebGUI;');
INSERT INTO help VALUES (23,'WebGUI',673,628,'26,WebGUI;');
INSERT INTO help VALUES (26,'WebGUI',676,631,'36,WebGUI;20,WebGUI;23,WebGUI;');
INSERT INTO help VALUES (28,'WebGUI',678,633,'1,WebGUI;3,WebGUI;');
INSERT INTO help VALUES (31,'WebGUI',681,636,'30,WebGUI;1,WebGUI;3,WebGUI;');
INSERT INTO help VALUES (30,'WebGUI',680,635,'31,WebGUI;');
INSERT INTO help VALUES (25,'WebGUI',675,630,NULL);
INSERT INTO help VALUES (1,'Item',61,71,'21,WebGUI;');
INSERT INTO help VALUES (6,'WebGUI',656,611,'12,WebGUI;');
INSERT INTO help VALUES (46,'WebGUI',696,651,NULL);
INSERT INTO help VALUES (22,'WebGUI',672,627,'12,WebGUI;');
INSERT INTO help VALUES (1,'USS',61,71,'21,WebGUI;');
INSERT INTO help VALUES (24,'WebGUI',674,629,'12,WebGUI;');
INSERT INTO help VALUES (1,'FAQ',61,71,'2,FAQ;21,WebGUI;');
INSERT INTO help VALUES (13,'WebGUI',663,618,'12,WebGUI;');
INSERT INTO help VALUES (1,'SyndicatedContent',61,71,'21,WebGUI;');
INSERT INTO help VALUES (1,'EventsCalendar',61,71,'2,EventsCalendar;21,WebGUI;');
INSERT INTO help VALUES (1,'MessageBoard',61,71,'21,WebGUI;');
INSERT INTO help VALUES (1,'LinkList',61,71,'2,LinkList;21,WebGUI;');
INSERT INTO help VALUES (21,'WebGUI',671,626,'1,Article;1,DownloadManager;1,EventsCalendar;1,ExtraColumn;1,FAQ;1,Item;1,LinkList;19,WebGUI;1,MailForm;1,MessageBoard;1,Poll;1,Product;1,SiteMap;1,SQLReport;18,WebGUI;1,SyndicatedContent;1,UserSubmission;1,WobjectProxy;27,WebGUI;14,WebGUI;');
INSERT INTO help VALUES (1,'Article',61,71,'21,WebGUI;');
INSERT INTO help VALUES (1,'ExtraColumn',61,71,'21,WebGUI;');
INSERT INTO help VALUES (27,'WebGUI',677,632,'21,WebGUI;');
INSERT INTO help VALUES (1,'Poll',61,71,'21,WebGUI;');
INSERT INTO help VALUES (1,'SiteMap',61,71,'21,WebGUI;');
INSERT INTO help VALUES (1,'SQLReport',61,71,'21,WebGUI;');
INSERT INTO help VALUES (18,'WebGUI',668,623,NULL);
INSERT INTO help VALUES (17,'WebGUI',667,622,'10,WebGUI;');
INSERT INTO help VALUES (2,'WebGUI',652,607,'12,WebGUI;');
INSERT INTO help VALUES (15,'WebGUI',665,620,'10,WebGUI;');
INSERT INTO help VALUES (16,'WebGUI',666,621,'9,WebGUI;');
INSERT INTO help VALUES (14,'WebGUI',664,619,'21,WebGUI;');
INSERT INTO help VALUES (12,'WebGUI',662,617,'6,WebGUI;29,WebGUI;13,WebGUI;24,WebGUI;22,WebGUI;2,WebGUI;');
INSERT INTO help VALUES (10,'WebGUI',660,615,'17,WebGUI;15,WebGUI;8,WebGUI;');
INSERT INTO help VALUES (8,'WebGUI',658,613,'10,WebGUI;32,WebGUI;5,WebGUI;7,WebGUI;');
INSERT INTO help VALUES (9,'WebGUI',659,614,'19,WebGUI;18,WebGUI;16,WebGUI;4,WebGUI;');
INSERT INTO help VALUES (7,'WebGUI',657,612,'8,WebGUI;');
INSERT INTO help VALUES (32,'WebGUI',682,637,'8,WebGUI;');
INSERT INTO help VALUES (5,'WebGUI',655,610,'8,WebGUI;');
INSERT INTO help VALUES (3,'WebGUI',653,608,'1,WebGUI;');
INSERT INTO help VALUES (4,'WebGUI',654,609,'9,WebGUI;');
INSERT INTO help VALUES (1,'WebGUI',642,606,'3,WebGUI;');
INSERT INTO help VALUES (29,'WebGUI',679,634,'12,WebGUI;');
INSERT INTO help VALUES (33,'WebGUI',683,638,'34,WebGUI;35,WebGUI;');
INSERT INTO help VALUES (34,'WebGUI',684,639,'33,WebGUI;');
INSERT INTO help VALUES (35,'WebGUI',685,640,'33,WebGUI;');
INSERT INTO help VALUES (19,'WebGUI',669,624,'9,WebGUI;21,WebGUI;');
INSERT INTO help VALUES (1,'MailForm',61,71,'21,WebGUI;');
INSERT INTO help VALUES (2,'MailForm',62,72,'1,MailForm;');
INSERT INTO help VALUES (36,'WebGUI',686,641,'26,WebGUI;');
INSERT INTO help VALUES (2,'FileManager',72,73,'1,DownloadManager;');
INSERT INTO help VALUES (2,'EventsCalendar',72,73,'1,EventsCalendar;');
INSERT INTO help VALUES (2,'FAQ',72,73,'1,FAQ;');
INSERT INTO help VALUES (2,'LinkList',72,73,'1,LinkList;');
INSERT INTO help VALUES (47,'WebGUI',697,698,'1,Article;17,WebGUI;1,MessageBoard;1,Poll;2,WebGUI;1,UserSubmission;');
INSERT INTO help VALUES (1,'WobjectProxy',5,6,'21,WebGUI;');
INSERT INTO help VALUES (1,'Product',38,39,'5,Product;4,Product;6,Product;2,Product;3,Product;7,Product;21,WebGUI;');
INSERT INTO help VALUES (2,'Product',40,41,'6,Product;1,Product;');
INSERT INTO help VALUES (3,'Product',42,43,'1,Product;');
INSERT INTO help VALUES (4,'Product',44,45,'1,Product;');
INSERT INTO help VALUES (5,'Product',46,47,'1,Product;');
INSERT INTO help VALUES (48,'WebGUI',708,709,'12,WebGUI;');
INSERT INTO help VALUES (6,'Product',49,50,'2,Product;1,Product;');
INSERT INTO help VALUES (7,'Product',62,63,'1,Product;');
INSERT INTO help VALUES (1,'Survey',3,4,'21,WebGUI;');

--
-- Table structure for table 'imageGroup'
--

CREATE TABLE imageGroup (
  imageGroupId int(11) NOT NULL default '0',
  name varchar(128) NOT NULL default 'untitled',
  parentId int(11) NOT NULL default '0',
  description varchar(255) default NULL
) TYPE=MyISAM;

--
-- Dumping data for table 'imageGroup'
--


INSERT INTO imageGroup VALUES (0,'Root',0,'Top level');

--
-- Table structure for table 'images'
--

CREATE TABLE images (
  imageId int(11) NOT NULL default '0',
  name varchar(128) NOT NULL default 'untitled',
  filename varchar(255) default NULL,
  parameters varchar(255) default NULL,
  userId int(11) default NULL,
  username varchar(128) default NULL,
  dateUploaded int(11) default NULL,
  imageGroupId int(11) NOT NULL default '0',
  PRIMARY KEY  (imageId)
) TYPE=MyISAM;

--
-- Dumping data for table 'images'
--



--
-- Table structure for table 'incrementer'
--

CREATE TABLE incrementer (
  incrementerId varchar(50) NOT NULL default '',
  nextValue int(11) NOT NULL default '1',
  PRIMARY KEY  (incrementerId)
) TYPE=MyISAM;

--
-- Dumping data for table 'incrementer'
--


INSERT INTO incrementer VALUES ('groupId',26);
INSERT INTO incrementer VALUES ('messageId',1000);
INSERT INTO incrementer VALUES ('pageId',1000);
INSERT INTO incrementer VALUES ('styleId',1000);
INSERT INTO incrementer VALUES ('userId',26);
INSERT INTO incrementer VALUES ('wobjectId',1);
INSERT INTO incrementer VALUES ('EventsCalendar_eventId',1000);
INSERT INTO incrementer VALUES ('LinkList_linkId',1000);
INSERT INTO incrementer VALUES ('FAQ_questionId',1000);
INSERT INTO incrementer VALUES ('USS_submissionId',1);
INSERT INTO incrementer VALUES ('EventsCalendar_recurringEventId',1000);
INSERT INTO incrementer VALUES ('messageLogId',1000);
INSERT INTO incrementer VALUES ('FileManager_fileId',1);
INSERT INTO incrementer VALUES ('imageId',1);
INSERT INTO incrementer VALUES ('profileCategoryId',1000);
INSERT INTO incrementer VALUES ('templateId',1000);
INSERT INTO incrementer VALUES ('imageGroupId',1000);
INSERT INTO incrementer VALUES ('Product_featureId',1000);
INSERT INTO incrementer VALUES ('Product_specificationId',1000);
INSERT INTO incrementer VALUES ('languageId',1000);
INSERT INTO incrementer VALUES ('MailForm_fieldId',1000);
INSERT INTO incrementer VALUES ('MailForm_entryId',1000);
INSERT INTO incrementer VALUES ('Product_benefitId',1000);
INSERT INTO incrementer VALUES ('Survey_answerId',1000);
INSERT INTO incrementer VALUES ('Survey_questionId',1000);
INSERT INTO incrementer VALUES ('Survey_responseId',1000);

--
-- Table structure for table 'international'
--

CREATE TABLE international (
  internationalId int(11) NOT NULL default '0',
  namespace varchar(30) NOT NULL default 'WebGUI',
  languageId int(11) NOT NULL default '1',
  message mediumtext,
  lastUpdated int(11) default NULL,
  PRIMARY KEY  (internationalId,namespace,languageId)
) TYPE=MyISAM;

--
-- Dumping data for table 'international'
--


INSERT INTO international VALUES (367,'WebGUI',1,'Expire After',1031514049);
INSERT INTO international VALUES (39,'USS',3,'Post een reactie',1031516049);
INSERT INTO international VALUES (1,'Article',1,'Article',1031514049);
INSERT INTO international VALUES (1,'Article',4,'Art�culo',1031510000);
INSERT INTO international VALUES (1,'Article',5,'Artigo',1031510000);
INSERT INTO international VALUES (37,'USS',3,'Verwijder',1031516049);
INSERT INTO international VALUES (1,'EventsCalendar',1,'Proceed to add event?',1031514049);
INSERT INTO international VALUES (1,'EventsCalendar',5,'Proseguir com a adi��o do evento?',1031510000);
INSERT INTO international VALUES (10,'LinkList',2,'Link Liste\nbearbeiten',1031510000);
INSERT INTO international VALUES (35,'USS',3,'Titel',1031516049);
INSERT INTO international VALUES (1,'ExtraColumn',1,'Extra Column',1031514049);
INSERT INTO international VALUES (1,'ExtraColumn',4,'Columna Extra',1031510000);
INSERT INTO international VALUES (1,'ExtraColumn',5,'Coluna extra',1031510000);
INSERT INTO international VALUES (34,'USS',3,'Return converteren',1031516049);
INSERT INTO international VALUES (1,'Item',1,'Link URL',1031514049);
INSERT INTO international VALUES (1,'LinkList',1,'Indent',1031514049);
INSERT INTO international VALUES (1,'LinkList',5,'Destaque',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',6,'StyleSheet Class',1031510000);
INSERT INTO international VALUES (700,'WebGUI',6,'Dag',1031510000);
INSERT INTO international VALUES (5,'Article',6,'Body',1031510000);
INSERT INTO international VALUES (4,'WebGUI',6,'Kontrollera inst�llningar.',1031581194);
INSERT INTO international VALUES (10,'Poll',2,'Abstimmung\nzur�cksetzen',1031510000);
INSERT INTO international VALUES (33,'USS',3,'Bijlage',1031516049);
INSERT INTO international VALUES (1,'Poll',1,'Poll',1031514049);
INSERT INTO international VALUES (1,'Poll',4,'Encuesta',1031510000);
INSERT INTO international VALUES (1,'Poll',5,'Sondagem',1031510000);
INSERT INTO international VALUES (4,'USS',6,'Ditt meddelande har blivit validerat.',1031648642);
INSERT INTO international VALUES (4,'SyndicatedContent',6,'Redigera Syndicated ineh�ll',1031510000);
INSERT INTO international VALUES (563,'WebGUI',2,'Standard\nstatus',1031510000);
INSERT INTO international VALUES (32,'USS',3,'Plaatje',1031516049);
INSERT INTO international VALUES (1,'SQLReport',1,'SQL Report',1031514049);
INSERT INTO international VALUES (1,'SQLReport',4,'Reporte SQL',1031510000);
INSERT INTO international VALUES (1,'SQLReport',5,'Relat�rio SQL',1031510000);
INSERT INTO international VALUES (31,'USS',3,'Inhoud',1031516049);
INSERT INTO international VALUES (1,'SyndicatedContent',1,'URL to RSS File',1031514049);
INSERT INTO international VALUES (1,'SyndicatedContent',5,'Ficheiro de URL para RSS',1031510000);
INSERT INTO international VALUES (1,'USS',1,'Who can approve?',1031514049);
INSERT INTO international VALUES (1,'USS',5,'Quem pode aprovar?',1031510000);
INSERT INTO international VALUES (18,'SQLReport',3,'Er waren geen resultaten voor deze query',1031516049);
INSERT INTO international VALUES (1,'WebGUI',1,'Add content...',1031514049);
INSERT INTO international VALUES (1,'WebGUI',4,'Agregar Contenido ...',1031510000);
INSERT INTO international VALUES (1,'WebGUI',5,'Adicionar conteudo...',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',1,'Events Calendar',1031514049);
INSERT INTO international VALUES (2,'EventsCalendar',4,'Calendario de Eventos',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',5,'Calend�rio de eventos',1031510000);
INSERT INTO international VALUES (4,'SiteMap',6,'Niv�er att traversera',1031510000);
INSERT INTO international VALUES (4,'Poll',6,'Vem kan r�sta?',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',6,'Meddelanden per sida',1031510000);
INSERT INTO international VALUES (4,'LinkList',6,'Kula',1031510000);
INSERT INTO international VALUES (10,'SQLReport',2,'Fehler: Das\nSQL-Statement ist im falschen Format.',1031510000);
INSERT INTO international VALUES (17,'SQLReport',3,'Debug: Query:',1031516049);
INSERT INTO international VALUES (2,'FAQ',1,'F.A.Q.',1031514049);
INSERT INTO international VALUES (2,'FAQ',4,'F.A.Q.',1031510000);
INSERT INTO international VALUES (2,'FAQ',5,'Perguntas mais frequentes',1031510000);
INSERT INTO international VALUES (2,'Item',1,'Attachment',1031514049);
INSERT INTO international VALUES (16,'SQLReport',3,'Debug?',1031516049);
INSERT INTO international VALUES (2,'LinkList',1,'Line Spacing',1031514049);
INSERT INTO international VALUES (2,'LinkList',5,'Espa�o entre linhas',1031510000);
INSERT INTO international VALUES (1,'Article',10,'Artikel',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',1,'Message Board',1031514049);
INSERT INTO international VALUES (2,'MessageBoard',4,'Table de Mensages',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',5,'Quadro de mensagens',1031510000);
INSERT INTO international VALUES (4,'FAQ',6,'L�gg till fr�ga',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',6,'Bredd',1031510000);
INSERT INTO international VALUES (15,'SQLReport',3,'Verwerk macros voor query?',1031516049);
INSERT INTO international VALUES (2,'SiteMap',1,'Site Map',1031514049);
INSERT INTO international VALUES (2,'SiteMap',5,'Mapa do site',1031510000);
INSERT INTO international VALUES (10,'WebGUI',2,'M�lleimer\nanschauen',1031510000);
INSERT INTO international VALUES (4,'Article',6,'Slutdatum',1032257354);
INSERT INTO international VALUES (3,'WebGUI',6,'Klistra in fr�n klippbord...',1031510000);
INSERT INTO international VALUES (14,'SQLReport',3,'Breek pagina af na',1031516049);
INSERT INTO international VALUES (2,'SyndicatedContent',1,'Syndicated Content',1031514049);
INSERT INTO international VALUES (2,'SyndicatedContent',5,'Conteudo sindical',1031510000);
INSERT INTO international VALUES (2,'USS',1,'Who can contribute?',1031514049);
INSERT INTO international VALUES (2,'USS',4,'Qui�nes pueden contribuir?',1031510000);
INSERT INTO international VALUES (2,'USS',5,'Quem pode contribuir?',1031510000);
INSERT INTO international VALUES (13,'SQLReport',3,'Converteer Return?',1031516049);
INSERT INTO international VALUES (2,'WebGUI',1,'Page',1031514049);
INSERT INTO international VALUES (2,'WebGUI',4,'P�gina',1031510000);
INSERT INTO international VALUES (2,'WebGUI',5,'P�gina',1031510000);
INSERT INTO international VALUES (3,'Article',1,'Start Date',1031514049);
INSERT INTO international VALUES (3,'Article',4,'Fecha Inicio',1031510000);
INSERT INTO international VALUES (3,'Article',5,'Data de inicio',1031510000);
INSERT INTO international VALUES (11,'Article',2,'(Bitte anklicken,\nfalls Sie nicht &lt;br&gt; in Ihrem Text hinzuf�gen.)',1031510000);
INSERT INTO international VALUES (3,'SyndicatedContent',6,'L�gg till syndicated inneh�ll',1031581068);
INSERT INTO international VALUES (3,'SQLReport',6,'Rapportmall',1032859295);
INSERT INTO international VALUES (3,'SiteMap',6,'Starta fr�n denna niv�?',1031510000);
INSERT INTO international VALUES (3,'Poll',6,'Aktiv',1031510000);
INSERT INTO international VALUES (9,'SiteMap',3,'Omschrijving laten zien?',1031516049);
INSERT INTO international VALUES (3,'ExtraColumn',1,'Spacer',1031514049);
INSERT INTO international VALUES (3,'ExtraColumn',4,'Espaciador',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',5,'Espa�amento',1031510000);
INSERT INTO international VALUES (564,'WebGUI',6,'Vem kan posta?',1031510000);
INSERT INTO international VALUES (3,'LinkList',6,'�ppna i nytt f�nster?',1031649790);
INSERT INTO international VALUES (3,'Item',1,'Delete Attachment',1031514049);
INSERT INTO international VALUES (11,'FileManager',2,'Neuen\nDownload hinzuf�gen.',1031510000);
INSERT INTO international VALUES (11,'Poll',3,'Stem!',1031516049);
INSERT INTO international VALUES (3,'LinkList',1,'Open in new window?',1031514049);
INSERT INTO international VALUES (3,'LinkList',5,'Abrir numa nova janela?',1031510000);
INSERT INTO international VALUES (564,'WebGUI',1,'Who can post?',1031514049);
INSERT INTO international VALUES (564,'WebGUI',4,'Quienes pueden mandar?',1031510000);
INSERT INTO international VALUES (564,'WebGUI',5,'Quem pode colocar novas?',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',3,'Verwijder bericht',1031516049);
INSERT INTO international VALUES (3,'Poll',1,'Active',1031514049);
INSERT INTO international VALUES (3,'Poll',4,'Activar',1031510000);
INSERT INTO international VALUES (3,'Poll',5,'Activo',1031510000);
INSERT INTO international VALUES (3,'SiteMap',1,'Starting from this level?',1031514049);
INSERT INTO international VALUES (3,'SiteMap',5,'Iniciando neste n�vel?',1031510000);
INSERT INTO international VALUES (565,'WebGUI',3,'Wie kan bewerken?',1031516049);
INSERT INTO international VALUES (3,'SQLReport',1,'Report Template',1031514049);
INSERT INTO international VALUES (3,'SQLReport',4,'Modelo',1031510000);
INSERT INTO international VALUES (3,'SQLReport',5,'Template',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',6,'Mellanrum',1031649752);
INSERT INTO international VALUES (3,'EventsCalendar',6,'L�gg till h�ndelsekalender',1031581052);
INSERT INTO international VALUES (3,'Article',6,'Startdatum',1032257347);
INSERT INTO international VALUES (4,'Item',3,'Item',1031516049);
INSERT INTO international VALUES (5,'Item',3,'Download bijlage',1031516049);
INSERT INTO international VALUES (3,'USS',1,'You have a new user submission to approve.',1031514049);
INSERT INTO international VALUES (3,'USS',5,'Tem nova submiss�o para aprovar.',1031510000);
INSERT INTO international VALUES (3,'WebGUI',1,'Paste from clipboard...',1031514049);
INSERT INTO international VALUES (3,'WebGUI',4,'Pegar desde el Portapapeles...',1031510000);
INSERT INTO international VALUES (3,'WebGUI',5,'Colar do clipboard...',1031510000);
INSERT INTO international VALUES (11,'Poll',2,'Abstimmen',1031510000);
INSERT INTO international VALUES (11,'MessageBoard',2,'Zur�ck zur\nBeitragsliste',1031510000);
INSERT INTO international VALUES (3,'Item',3,'Verwijder bijlage',1031516049);
INSERT INTO international VALUES (4,'Article',1,'End Date',1031514049);
INSERT INTO international VALUES (4,'Article',4,'Fecha finalizaci�n',1031510000);
INSERT INTO international VALUES (4,'Article',5,'Data de fim',1031510000);
INSERT INTO international VALUES (2,'Item',3,'Bijlage',1031516049);
INSERT INTO international VALUES (4,'EventsCalendar',1,'Happens only once.',1031514049);
INSERT INTO international VALUES (4,'EventsCalendar',4,'Sucede solo una vez.',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',5,'Apenas uma vez.',1031510000);
INSERT INTO international VALUES (1,'Item',3,'Link URL',1031516049);
INSERT INTO international VALUES (4,'ExtraColumn',1,'Width',1031514049);
INSERT INTO international VALUES (4,'ExtraColumn',4,'Ancho',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',5,'Largura',1031510000);
INSERT INTO international VALUES (2,'USS',6,'Vem kan g�ra inl�gg?',1031510000);
INSERT INTO international VALUES (2,'SyndicatedContent',6,'Syndicated ineh�ll',1031510000);
INSERT INTO international VALUES (4,'Item',1,'Item',1031514049);
INSERT INTO international VALUES (4,'LinkList',1,'Bullet',1031514049);
INSERT INTO international VALUES (4,'LinkList',5,'Marca',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',1,'Messages Per Page',1031514049);
INSERT INTO international VALUES (4,'MessageBoard',4,'Mensages por p�gina',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',5,'Mensagens por p�gina',1031510000);
INSERT INTO international VALUES (4,'Poll',1,'Who can vote?',1031514049);
INSERT INTO international VALUES (4,'Poll',4,'Qui�nes pueden votar?',1031510000);
INSERT INTO international VALUES (4,'Poll',5,'Quem pode votar?',1031510000);
INSERT INTO international VALUES (13,'FAQ',3,'Zet [top] link aan?',1031516049);
INSERT INTO international VALUES (4,'SiteMap',1,'Depth To Traverse',1031514049);
INSERT INTO international VALUES (4,'SiteMap',5,'profundidade a travessar',1031510000);
INSERT INTO international VALUES (11,'SQLReport',2,'Fehler: Es gab\nein Problem mit der Abfrage.',1031510000);
INSERT INTO international VALUES (12,'FAQ',3,'Zet V/A aan?',1031516049);
INSERT INTO international VALUES (4,'SQLReport',1,'Query',1031514049);
INSERT INTO international VALUES (4,'SQLReport',4,'Consulta',1031510000);
INSERT INTO international VALUES (4,'SQLReport',5,'Query',1031510000);
INSERT INTO international VALUES (11,'FAQ',3,'Zet inhoud aan?',1031516049);
INSERT INTO international VALUES (4,'SyndicatedContent',1,'Edit Syndicated Content',1031514049);
INSERT INTO international VALUES (4,'SyndicatedContent',5,'Modificar conteudo sindical',1031510000);
INSERT INTO international VALUES (19,'EventsCalendar',3,'Breek pagina af na',1031516049);
INSERT INTO international VALUES (4,'USS',1,'Your submission has been approved.',1031514049);
INSERT INTO international VALUES (4,'USS',5,'A sua submiss�o foi aprovada.',1031510000);
INSERT INTO international VALUES (4,'WebGUI',1,'Manage settings.',1031514049);
INSERT INTO international VALUES (4,'WebGUI',4,'Configurar Opciones.',1031510000);
INSERT INTO international VALUES (4,'WebGUI',5,'Organizar prefer�ncias.',1031510000);
INSERT INTO international VALUES (11,'WebGUI',2,'M�lleimer\nleeren',1031510000);
INSERT INTO international VALUES (38,'USS',1,'(Select \"No\" if you\'re writing an HTML/Rich Edit submission.)',1031514049);
INSERT INTO international VALUES (20,'EventsCalendar',1,'Add an event.',1031514049);
INSERT INTO international VALUES (18,'EventsCalendar',3,'Calendar Month',1031516049);
INSERT INTO international VALUES (700,'WebGUI',1,'Day(s)',1031514049);
INSERT INTO international VALUES (700,'WebGUI',4,'D�a',1031510000);
INSERT INTO international VALUES (700,'WebGUI',5,'Dia',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',1,'StyleSheet Class',1031514049);
INSERT INTO international VALUES (5,'ExtraColumn',4,'Clase StyleSheet',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',5,'StyleSheet Class',1031510000);
INSERT INTO international VALUES (17,'EventsCalendar',3,'Lijst',1031516049);
INSERT INTO international VALUES (5,'FAQ',1,'Question',1031514049);
INSERT INTO international VALUES (5,'FAQ',4,'Pregunta',1031510000);
INSERT INTO international VALUES (5,'FAQ',5,'Quest�o',1031510000);
INSERT INTO international VALUES (5,'Item',1,'Download Attachment',1031514049);
INSERT INTO international VALUES (16,'EventsCalendar',3,'Kalender layout',1031516049);
INSERT INTO international VALUES (5,'LinkList',1,'Proceed to add link?',1031514049);
INSERT INTO international VALUES (5,'LinkList',5,'Proseguir com a adi��o do hiperlink?',1031510000);
INSERT INTO international VALUES (566,'WebGUI',1,'Edit Timeout',1031514049);
INSERT INTO international VALUES (566,'WebGUI',4,'Timeout de edici�n',1031510000);
INSERT INTO international VALUES (566,'WebGUI',5,'Modificar Timeout',1031510000);
INSERT INTO international VALUES (12,'Article',2,'Artikel\nbearbeiten',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',3,'Eind datum',1031516049);
INSERT INTO international VALUES (5,'Poll',1,'Graph Width',1031514049);
INSERT INTO international VALUES (5,'Poll',4,'Ancho del gr�fico',1031510000);
INSERT INTO international VALUES (5,'Poll',5,'Largura do gr�fico',1031510000);
INSERT INTO international VALUES (5,'SiteMap',1,'Edit Site Map',1031514049);
INSERT INTO international VALUES (5,'SiteMap',5,'Editar mapa do site',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',3,'Start datum',1031516049);
INSERT INTO international VALUES (5,'SQLReport',1,'DSN',1031514049);
INSERT INTO international VALUES (5,'SQLReport',4,'DSN',1031510000);
INSERT INTO international VALUES (5,'SQLReport',5,'DSN',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',1,'Last Fetched',1031514049);
INSERT INTO international VALUES (5,'SyndicatedContent',5,'Ultima retirada',1031510000);
INSERT INTO international VALUES (21,'EventsCalendar',3,'Doorgaan met evenement toevoegen?',1031516049);
INSERT INTO international VALUES (5,'USS',1,'Your submission has been denied.',1031514049);
INSERT INTO international VALUES (5,'USS',5,'A sua submiss�o n�o foi aprovada.',1031510000);
INSERT INTO international VALUES (5,'WebGUI',1,'Manage groups.',1031514049);
INSERT INTO international VALUES (5,'WebGUI',4,'Configurar Grupos.',1031510000);
INSERT INTO international VALUES (5,'WebGUI',5,'Organizar grupos.',1031510000);
INSERT INTO international VALUES (6,'Article',1,'Image',1031514049);
INSERT INTO international VALUES (6,'Article',4,'Imagen',1031510000);
INSERT INTO international VALUES (6,'Article',5,'Imagem',1031510000);
INSERT INTO international VALUES (20,'EventsCalendar',3,'Evenement toevoegen',1031516049);
INSERT INTO international VALUES (701,'WebGUI',1,'Week(s)',1031514049);
INSERT INTO international VALUES (701,'WebGUI',4,'Semana',1031510000);
INSERT INTO international VALUES (701,'WebGUI',5,'Semana',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',1,'Edit Extra Column',1031514049);
INSERT INTO international VALUES (6,'ExtraColumn',4,'Editar Columna Extra',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',5,'Modificar coluna extra',1031510000);
INSERT INTO international VALUES (6,'FAQ',1,'Answer',1031514049);
INSERT INTO international VALUES (6,'FAQ',4,'Respuesta',1031510000);
INSERT INTO international VALUES (6,'FAQ',5,'Resposta',1031510000);
INSERT INTO international VALUES (12,'FileManager',2,'Sind Sie\nsicher, dass Sie diesen Download l�schen m�chten?',1031510000);
INSERT INTO international VALUES (22,'FileManager',3,'Doorgaan met download toevoegen',1031516049);
INSERT INTO international VALUES (6,'LinkList',1,'Link List',1031514049);
INSERT INTO international VALUES (6,'LinkList',4,'Lista de Enlaces',1031510000);
INSERT INTO international VALUES (6,'LinkList',5,'Lista de hiperlinks',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',1,'Edit Message Board',1031514049);
INSERT INTO international VALUES (6,'MessageBoard',4,'Editar Tabla de Mensages',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',5,'Modificar quadro de mensagens',1031510000);
INSERT INTO international VALUES (21,'FileManager',3,'Miniaturen weergeven?',1031516049);
INSERT INTO international VALUES (6,'Poll',1,'Question',1031514049);
INSERT INTO international VALUES (6,'Poll',4,'Pregunta',1031510000);
INSERT INTO international VALUES (6,'Poll',5,'Quest�o',1031510000);
INSERT INTO international VALUES (6,'SiteMap',1,'Indent',1031514049);
INSERT INTO international VALUES (6,'SiteMap',5,'Destaque',1031510000);
INSERT INTO international VALUES (12,'EventsCalendar',2,'Veranstaltungskalender bearbeiten',1031510000);
INSERT INTO international VALUES (20,'FileManager',3,'Kap pagina af na',1031516049);
INSERT INTO international VALUES (6,'SQLReport',1,'Database User',1031514049);
INSERT INTO international VALUES (6,'SQLReport',4,'Usuario de la Base de Datos',1031510000);
INSERT INTO international VALUES (6,'SQLReport',5,'User da base de dados',1031510000);
INSERT INTO international VALUES (6,'SyndicatedContent',1,'Current Content',1031514049);
INSERT INTO international VALUES (6,'SyndicatedContent',5,'Conteudo actual',1031510000);
INSERT INTO international VALUES (12,'LinkList',2,'Link\nbearbeiten',1031510000);
INSERT INTO international VALUES (19,'FileManager',3,'U heeft geen bestanden te downloaden',1031516049);
INSERT INTO international VALUES (6,'USS',1,'Submissions Per Page',1031514049);
INSERT INTO international VALUES (6,'USS',4,'Contribuciones por p�gina',1031510000);
INSERT INTO international VALUES (6,'USS',5,'Submiss�es por p�gina',1031510000);
INSERT INTO international VALUES (6,'WebGUI',1,'Manage styles.',1031514049);
INSERT INTO international VALUES (6,'WebGUI',4,'Configurar Estilos',1031510000);
INSERT INTO international VALUES (6,'WebGUI',5,'Organizar estilos.',1031510000);
INSERT INTO international VALUES (18,'FileManager',3,'Alternatieve Versie #2',1031516049);
INSERT INTO international VALUES (7,'Article',1,'Link Title',1031514049);
INSERT INTO international VALUES (7,'Article',4,'Link T�tulo',1031510000);
INSERT INTO international VALUES (7,'Article',5,'Titulo da hiperlink',1031510000);
INSERT INTO international VALUES (2,'SiteMap',6,'Sitekarta',1031651399);
INSERT INTO international VALUES (2,'Poll',6,'L�gg till fr�ga',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',6,'Meddelandeforum',1031650036);
INSERT INTO international VALUES (12,'MessageBoard',2,'Beitrag\nbearbeiten',1031510000);
INSERT INTO international VALUES (7,'FAQ',1,'Are you certain that you want to delete this question?',1031514049);
INSERT INTO international VALUES (7,'FAQ',4,'Est� seguro de querer eliminar �sta pregunta?',1031510000);
INSERT INTO international VALUES (7,'FAQ',5,'Tem a certeza que quer apagar esta quest�o?',1031510000);
INSERT INTO international VALUES (2,'Item',6,'Bilagor',1031510000);
INSERT INTO international VALUES (2,'FAQ',6,'F.A.Q.',1031510000);
INSERT INTO international VALUES (2,'ExtraColumn',6,'L�gg till extra kolumn',1031579372);
INSERT INTO international VALUES (17,'FileManager',3,'Alternatieve Versie #1',1031516049);
INSERT INTO international VALUES (7,'MessageBoard',1,'Author:',1031514049);
INSERT INTO international VALUES (7,'MessageBoard',4,'Autor:',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',5,'Autor:',1031510000);
INSERT INTO international VALUES (12,'SQLReport',2,'Fehler:\nDatenbankverbindung konnte nicht aufgebaut werden.',1031510000);
INSERT INTO international VALUES (7,'Poll',1,'Answers',1031514049);
INSERT INTO international VALUES (7,'Poll',4,'Respuestas',1031510000);
INSERT INTO international VALUES (7,'Poll',5,'Respostas',1031510000);
INSERT INTO international VALUES (16,'FileManager',3,'Upload datum',1031516049);
INSERT INTO international VALUES (7,'SiteMap',1,'Bullet',1031514049);
INSERT INTO international VALUES (7,'SiteMap',5,'Marca',1031510000);
INSERT INTO international VALUES (7,'SQLReport',1,'Database Password',1031514049);
INSERT INTO international VALUES (7,'SQLReport',4,'Password de la Base de Datos',1031510000);
INSERT INTO international VALUES (7,'SQLReport',5,'Password da base de dados',1031510000);
INSERT INTO international VALUES (15,'FileManager',3,'Beschrijving',1031516049);
INSERT INTO international VALUES (560,'WebGUI',1,'Approved',1031514049);
INSERT INTO international VALUES (560,'WebGUI',4,'Aprobado',1031510000);
INSERT INTO international VALUES (560,'WebGUI',5,'Aprovado',1031510000);
INSERT INTO international VALUES (14,'FileManager',3,'Bestand',1031516049);
INSERT INTO international VALUES (7,'WebGUI',1,'Manage users.',1031514049);
INSERT INTO international VALUES (7,'WebGUI',4,'Configurar Usuarios',1031510000);
INSERT INTO international VALUES (7,'WebGUI',5,'Organizar utilizadores.',1031510000);
INSERT INTO international VALUES (8,'Article',1,'Link URL',1031514049);
INSERT INTO international VALUES (8,'Article',4,'Link URL',1031510000);
INSERT INTO international VALUES (8,'Article',5,'URL da hiperlink',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',1,'Recurs every',1031514049);
INSERT INTO international VALUES (8,'EventsCalendar',4,'Se repite cada',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',5,'Repeti��o',1031510000);
INSERT INTO international VALUES (8,'FAQ',1,'Edit F.A.Q.',1031514049);
INSERT INTO international VALUES (8,'FAQ',4,'Editar F.A.Q.',1031510000);
INSERT INTO international VALUES (8,'FAQ',5,'Modificar perguntas mais frequentes',1031510000);
INSERT INTO international VALUES (12,'FileManager',3,'Weet u zeker dat u deze download wilt verwijderen?',1031516049);
INSERT INTO international VALUES (8,'LinkList',1,'URL',1031514049);
INSERT INTO international VALUES (8,'LinkList',4,'URL',1031510000);
INSERT INTO international VALUES (8,'LinkList',5,'URL',1031510000);
INSERT INTO international VALUES (12,'USS',2,'(Bitte\nausklicken, wenn Ihr Beitrag in HTML geschrieben ist)',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',1,'Date:',1031514049);
INSERT INTO international VALUES (8,'MessageBoard',4,'Fecha:',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',5,'Data:',1031510000);
INSERT INTO international VALUES (11,'FileManager',3,'Nieuwe download toevoegen',1031516049);
INSERT INTO international VALUES (8,'Poll',1,'(Enter one answer per line. No more than 20.)',1031514049);
INSERT INTO international VALUES (8,'Poll',4,'(Ingrese una por l�nea. No m�s de 20)',1031510000);
INSERT INTO international VALUES (8,'Poll',5,'(Introduza uma resposta por linha. N�o passe das 20.)',1031510000);
INSERT INTO international VALUES (10,'FileManager',3,'Bewerk Download',1031516049);
INSERT INTO international VALUES (8,'SiteMap',1,'Line Spacing',1031514049);
INSERT INTO international VALUES (8,'SiteMap',5,'Espa�amento de linha',1031510000);
INSERT INTO international VALUES (8,'SQLReport',1,'Edit SQL Report',1031514049);
INSERT INTO international VALUES (8,'SQLReport',4,'Editar Reporte SQL',1031510000);
INSERT INTO international VALUES (8,'SQLReport',5,'Modificar o rela�rio SQL',1031510000);
INSERT INTO international VALUES (9,'FileManager',3,'Bewerk download Manager',1031516049);
INSERT INTO international VALUES (561,'WebGUI',1,'Denied',1031514049);
INSERT INTO international VALUES (561,'WebGUI',4,'Denegado',1031510000);
INSERT INTO international VALUES (561,'WebGUI',5,'Negado',1031510000);
INSERT INTO international VALUES (8,'WebGUI',1,'View page not found.',1031514049);
INSERT INTO international VALUES (8,'WebGUI',4,'Ver P�gina No Encontrada',1031510000);
INSERT INTO international VALUES (8,'WebGUI',5,'Ver p�gina n�o encontrada.',1031510000);
INSERT INTO international VALUES (12,'WebGUI',2,'Administrationsmodus abschalten',1031510000);
INSERT INTO international VALUES (8,'FileManager',3,'Korte Omschrijving',1031516049);
INSERT INTO international VALUES (9,'Article',1,'Attachment',1031514049);
INSERT INTO international VALUES (9,'Article',4,'Adjuntar',1031510000);
INSERT INTO international VALUES (9,'Article',5,'Anexar',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',1,'until',1031514049);
INSERT INTO international VALUES (9,'EventsCalendar',4,'hasta',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',5,'at�',1031510000);
INSERT INTO international VALUES (13,'Article',2,'L�schen',1031510000);
INSERT INTO international VALUES (7,'FileManager',3,'Groep om te downloaden',1031516049);
INSERT INTO international VALUES (9,'FAQ',1,'Add a new question.',1031514049);
INSERT INTO international VALUES (9,'FAQ',4,'Agregar nueva pregunta.',1031510000);
INSERT INTO international VALUES (9,'FAQ',5,'Adicionar nova quest�o.',1031510000);
INSERT INTO international VALUES (728,'WebGUI',1,'Are you certain you wish to delete this file?',1031514049);
INSERT INTO international VALUES (6,'FileManager',3,'Download bestand',1031516049);
INSERT INTO international VALUES (9,'LinkList',1,'Are you certain that you want to delete this link?',1031514049);
INSERT INTO international VALUES (9,'LinkList',4,'Est� seguro de querer eliminar �ste enlace?',1031510000);
INSERT INTO international VALUES (9,'LinkList',5,'Tem a certeza que quer apagar esta hiperlink?',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',1,'Message ID:',1031514049);
INSERT INTO international VALUES (9,'MessageBoard',4,'ID del mensage:',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',5,'ID da mensagem:',1031510000);
INSERT INTO international VALUES (5,'FileManager',3,'Bestand Titel',1031516049);
INSERT INTO international VALUES (9,'Poll',1,'Edit Poll',1031514049);
INSERT INTO international VALUES (9,'Poll',4,'Editar Encuesta',1031510000);
INSERT INTO international VALUES (9,'Poll',5,'Modificar sondagem',1031510000);
INSERT INTO international VALUES (3,'FileManager',3,'Verder gaan met bestand toevoegen?',1031516049);
INSERT INTO international VALUES (9,'SQLReport',1,'<b>Debug:</b> Error: The DSN specified is of an improper format.',1031514049);
INSERT INTO international VALUES (9,'SQLReport',4,'Error: El DSN especificado est� en un formato incorrecto.',1031510000);
INSERT INTO international VALUES (9,'SQLReport',5,'Erro: O DSN especificado tem um formato impr�prio.',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',2,'Veranstaltung bearbeiten',1031510000);
INSERT INTO international VALUES (562,'WebGUI',1,'Pending',1031514049);
INSERT INTO international VALUES (562,'WebGUI',4,'Pendiente',1031510000);
INSERT INTO international VALUES (562,'WebGUI',5,'Pendente',1031510000);
INSERT INTO international VALUES (1,'FileManager',3,'Download Manager',1031516049);
INSERT INTO international VALUES (9,'WebGUI',1,'View clipboard.',1031514049);
INSERT INTO international VALUES (9,'WebGUI',4,'Ver Portapapeles',1031510000);
INSERT INTO international VALUES (9,'WebGUI',5,'Ver o clipboard.',1031510000);
INSERT INTO international VALUES (10,'Article',1,'Convert carriage returns?',1031514049);
INSERT INTO international VALUES (10,'Article',4,'Convertir saltos de carro?',1031510000);
INSERT INTO international VALUES (10,'Article',5,'Converter o caracter de retorno (CR) ?',1031510000);
INSERT INTO international VALUES (13,'LinkList',2,'Neuen Link\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (577,'WebGUI',2,'Antwort\nschicken',1031510000);
INSERT INTO international VALUES (28,'Article',3,'Bekijk reacties',1031516049);
INSERT INTO international VALUES (10,'FAQ',1,'Edit Question',1031514049);
INSERT INTO international VALUES (10,'FAQ',4,'Editar Pregunta',1031510000);
INSERT INTO international VALUES (10,'FAQ',5,'Modificar quest�o',1031510000);
INSERT INTO international VALUES (10,'LinkList',1,'Edit Link List',1031514049);
INSERT INTO international VALUES (10,'LinkList',4,'Editar Lista de Enlaces',1031510000);
INSERT INTO international VALUES (10,'LinkList',5,'Modificar lista de hiperlinks',1031510000);
INSERT INTO international VALUES (394,'WebGUI',2,'Grafiken\nverwalten',1031510000);
INSERT INTO international VALUES (6,'Article',10,'Billede',1031510000);
INSERT INTO international VALUES (5,'Article',10,'Br�dtekst',1031510000);
INSERT INTO international VALUES (4,'Article',10,'Til dato',1031510000);
INSERT INTO international VALUES (3,'Article',10,'Fra dato',1031510000);
INSERT INTO international VALUES (27,'Article',3,'Terug naar artikel',1031516049);
INSERT INTO international VALUES (10,'Poll',1,'Reset votes.',1031514049);
INSERT INTO international VALUES (10,'Poll',5,'Reinicializar os votos.',1031510000);
INSERT INTO international VALUES (23,'Article',3,'Datum',1031516049);
INSERT INTO international VALUES (24,'Article',3,'Post reactie',1031516049);
INSERT INTO international VALUES (10,'SQLReport',1,'<b>Debug:</b> Error: The SQL specified is of an improper format.',1031514049);
INSERT INTO international VALUES (10,'SQLReport',4,'Error: El SQL especificado est� en un formato incorrecto.',1031510000);
INSERT INTO international VALUES (10,'SQLReport',5,'Erro: O SQL especificado tem um formato impr�prio.',1031510000);
INSERT INTO international VALUES (22,'Article',3,'Auteur',1031516049);
INSERT INTO international VALUES (563,'WebGUI',1,'Default Status',1031514049);
INSERT INTO international VALUES (563,'WebGUI',4,'Estado por defecto',1031510000);
INSERT INTO international VALUES (563,'WebGUI',5,'Estado por defeito',1031510000);
INSERT INTO international VALUES (18,'Article',3,'Discussie toelaten?',1031516049);
INSERT INTO international VALUES (10,'WebGUI',1,'Manage trash.',1031514049);
INSERT INTO international VALUES (10,'WebGUI',4,'Ver Papelera',1031510000);
INSERT INTO international VALUES (10,'WebGUI',5,'Ver o caixote do lixo.',1031510000);
INSERT INTO international VALUES (17,'Article',3,'Centreren',1031516049);
INSERT INTO international VALUES (11,'Article',1,'(Select \"Yes\" only if you aren\'t adding &lt;br&gt; manually.)',1031514049);
INSERT INTO international VALUES (11,'Article',4,'(marque si no est� agregando &lt;br&gt; manualmente.)',1031510000);
INSERT INTO international VALUES (11,'Article',5,'(escolher se n�o adicionar &lt;br&gt; manualmente.)',1031510000);
INSERT INTO international VALUES (392,'WebGUI',2,'Sind Sie sicher,\ndass Sie diese Grafik l�schen wollen?',1031510000);
INSERT INTO international VALUES (58,'Product',1,'Edit Product Template',1031514049);
INSERT INTO international VALUES (707,'WebGUI',1,'Show debugging?',1031514049);
INSERT INTO international VALUES (78,'EventsCalendar',1,'Don\'t delete anything, I made a mistake.',1031514049);
INSERT INTO international VALUES (393,'WebGUI',2,'Grafiken\nverwalten',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',6,'H�ndelsekalender',1032259717);
INSERT INTO international VALUES (2,'Article',6,'L�gg till artikel',1031510000);
INSERT INTO international VALUES (1,'WebGUI',6,'L�gg till inneh�ll...',1031648961);
INSERT INTO international VALUES (1,'USS',6,'Vem kan validera?',1031510000);
INSERT INTO international VALUES (16,'Article',3,'links',1031516049);
INSERT INTO international VALUES (11,'MessageBoard',1,'Back To Message List',1031514049);
INSERT INTO international VALUES (11,'MessageBoard',4,'Volver a la Lista de Mensages',1031510000);
INSERT INTO international VALUES (11,'MessageBoard',5,'Voltar � lista de mensagens',1031510000);
INSERT INTO international VALUES (15,'Article',3,'Rechts',1031516049);
INSERT INTO international VALUES (11,'SQLReport',1,'<b>Debug:</b> Error: There was a problem with the query.',1031514049);
INSERT INTO international VALUES (11,'SQLReport',4,'Error: Hay un problema con la consulta.',1031510000);
INSERT INTO international VALUES (11,'SQLReport',5,'Erro: Houve um problema com a query.',1031510000);
INSERT INTO international VALUES (391,'WebGUI',2,'Anhang l�schen',1031510000);
INSERT INTO international VALUES (1,'SQLReport',6,'SQL Rapport',1031510000);
INSERT INTO international VALUES (1,'SiteMap',6,'L�gg till site-karta',1031579426);
INSERT INTO international VALUES (1,'Poll',6,'Fr�ga',1031510000);
INSERT INTO international VALUES (14,'Article',3,'Plaatje uitlijnen',1031516049);
INSERT INTO international VALUES (11,'WebGUI',1,'Empy trash.',1031514049);
INSERT INTO international VALUES (11,'WebGUI',4,'Vaciar Papelera',1031510000);
INSERT INTO international VALUES (11,'WebGUI',5,'Esvaziar o caixote do lixo.',1031510000);
INSERT INTO international VALUES (355,'WebGUI',3,'Standaard',1031516049);
INSERT INTO international VALUES (12,'Article',1,'Edit Article',1031514049);
INSERT INTO international VALUES (12,'Article',4,'Editar Art�culo',1031510000);
INSERT INTO international VALUES (12,'Article',5,'Modificar artigo',1031510000);
INSERT INTO international VALUES (354,'WebGUI',3,'Bekijk berichten log.',1031516049);
INSERT INTO international VALUES (12,'EventsCalendar',1,'Edit Events Calendar',1031514049);
INSERT INTO international VALUES (12,'EventsCalendar',4,'Editar Calendario de Eventos',1031510000);
INSERT INTO international VALUES (12,'EventsCalendar',5,'Modificar calend�rio de eventos',1031510000);
INSERT INTO international VALUES (12,'LinkList',1,'Edit Link',1031514049);
INSERT INTO international VALUES (12,'LinkList',4,'Editar Enlace',1031510000);
INSERT INTO international VALUES (12,'LinkList',5,'Modificar hiperlink',1031510000);
INSERT INTO international VALUES (353,'WebGUI',3,'U heeft nu geen berichten log toevoegingen.',1031516049);
INSERT INTO international VALUES (12,'MessageBoard',1,'Edit Message',1031514049);
INSERT INTO international VALUES (12,'MessageBoard',4,'Editar mensage',1031510000);
INSERT INTO international VALUES (12,'MessageBoard',5,'Modificar mensagem',1031510000);
INSERT INTO international VALUES (390,'WebGUI',2,'Grafik anzeigen\n...',1031510000);
INSERT INTO international VALUES (352,'WebGUI',3,'Datum van toevoeging',1031516049);
INSERT INTO international VALUES (12,'SQLReport',1,'<b>Debug:</b> Error: Could not connect to the database.',1031514049);
INSERT INTO international VALUES (12,'SQLReport',4,'Error: No se puede conectar a la base de datos.',1031510000);
INSERT INTO international VALUES (12,'SQLReport',5,'Erro: N�o � poss�vel ligar � base de dados.',1031510000);
INSERT INTO international VALUES (389,'WebGUI',2,'Grafik Id',1031510000);
INSERT INTO international VALUES (350,'WebGUI',3,'Klaar',1031516049);
INSERT INTO international VALUES (351,'WebGUI',3,'Bericht',1031516049);
INSERT INTO international VALUES (12,'USS',1,'(Uncheck if you\'re writing an HTML submission.)',1031514049);
INSERT INTO international VALUES (12,'USS',4,'(desmarque si est� escribiendo la contribuci�n en HTML.)',1031510000);
INSERT INTO international VALUES (12,'USS',5,'(deixar em branco se a submiss�o for em HTML.)',1031510000);
INSERT INTO international VALUES (388,'WebGUI',2,'Upload Datum',1031510000);
INSERT INTO international VALUES (12,'WebGUI',1,'Turn admin off.',1031514049);
INSERT INTO international VALUES (12,'WebGUI',4,'Apagar Admin',1031510000);
INSERT INTO international VALUES (12,'WebGUI',5,'Desligar o modo administrativo.',1031510000);
INSERT INTO international VALUES (349,'WebGUI',3,'Laatst beschikbare versie',1031516049);
INSERT INTO international VALUES (13,'Article',1,'Delete',1031514049);
INSERT INTO international VALUES (13,'Article',4,'Eliminar',1031510000);
INSERT INTO international VALUES (13,'Article',5,'Apagar',1031510000);
INSERT INTO international VALUES (348,'WebGUI',3,'Naam',1031516049);
INSERT INTO international VALUES (13,'EventsCalendar',1,'Edit Event',1031514049);
INSERT INTO international VALUES (13,'EventsCalendar',4,'Editar Evento',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',5,'Modificar evento',1031510000);
INSERT INTO international VALUES (387,'WebGUI',2,'Zur Verf�gung\ngestellt von',1031510000);
INSERT INTO international VALUES (13,'LinkList',1,'Add a new link.',1031514049);
INSERT INTO international VALUES (13,'LinkList',4,'Agregar nuevo Enlace',1031510000);
INSERT INTO international VALUES (13,'LinkList',5,'Adicionar nova hiperlink.',1031510000);
INSERT INTO international VALUES (385,'WebGUI',2,'Parameter',1031510000);
INSERT INTO international VALUES (347,'WebGUI',3,'Bekijk profiel van',1031516049);
INSERT INTO international VALUES (577,'WebGUI',1,'Post Reply',1031514049);
INSERT INTO international VALUES (577,'WebGUI',4,'Responder',1031510000);
INSERT INTO international VALUES (577,'WebGUI',5,'Responder',1031510000);
INSERT INTO international VALUES (13,'USS',1,'Date Submitted',1031514049);
INSERT INTO international VALUES (13,'USS',4,'Fecha Contribuci�n',1031510000);
INSERT INTO international VALUES (13,'USS',5,'Data de submiss�o',1031510000);
INSERT INTO international VALUES (386,'WebGUI',2,'Bild\nbearbeiten',1031510000);
INSERT INTO international VALUES (13,'WebGUI',1,'View help index.',1031514049);
INSERT INTO international VALUES (13,'WebGUI',4,'Ver �ndice de Ayuda',1031510000);
INSERT INTO international VALUES (13,'WebGUI',5,'Ver o indice da ajuda.',1031510000);
INSERT INTO international VALUES (14,'Article',1,'Align Image',1031514049);
INSERT INTO international VALUES (384,'WebGUI',2,'Datei',1031510000);
INSERT INTO international VALUES (516,'WebGUI',1,'Turn Admin On!',1031514049);
INSERT INTO international VALUES (517,'WebGUI',1,'Turn Admin Off!',1031514049);
INSERT INTO international VALUES (515,'WebGUI',1,'Add edit stamp to posts?',1031514049);
INSERT INTO international VALUES (383,'WebGUI',2,'Name',1031510000);
INSERT INTO international VALUES (14,'USS',1,'Status',1031514049);
INSERT INTO international VALUES (14,'USS',4,'Estado',1031510000);
INSERT INTO international VALUES (14,'USS',5,'Estado',1031510000);
INSERT INTO international VALUES (346,'WebGUI',3,'Deze gebruiker in geen lid meer van onze site. We hebben geen informatie meer over deze gebruiker.',1031516049);
INSERT INTO international VALUES (14,'WebGUI',1,'View pending submissions.',1031514049);
INSERT INTO international VALUES (14,'WebGUI',4,'Ver contribuciones pendientes.',1031510000);
INSERT INTO international VALUES (14,'WebGUI',5,'Ver submiss�es pendentes.',1031510000);
INSERT INTO international VALUES (345,'WebGUI',3,'Geen lid',1031516049);
INSERT INTO international VALUES (15,'MessageBoard',1,'Author',1031514049);
INSERT INTO international VALUES (15,'MessageBoard',4,'Autor',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',5,'Autor',1031510000);
INSERT INTO international VALUES (343,'WebGUI',3,'Bekijk profiel.',1031516049);
INSERT INTO international VALUES (15,'USS',1,'Edit/Delete',1031514049);
INSERT INTO international VALUES (15,'USS',4,'Editar/Eliminar',1031510000);
INSERT INTO international VALUES (15,'USS',5,'Modificar/Apagar',1031510000);
INSERT INTO international VALUES (15,'WebGUI',1,'January',1031514049);
INSERT INTO international VALUES (15,'WebGUI',4,'Enero',1031510000);
INSERT INTO international VALUES (15,'WebGUI',5,'Janeiro',1031510000);
INSERT INTO international VALUES (379,'WebGUI',2,'Gruppen ID',1031510000);
INSERT INTO international VALUES (342,'WebGUI',3,'Bewerk account informatie.',1031516049);
INSERT INTO international VALUES (16,'MessageBoard',1,'Date',1031514049);
INSERT INTO international VALUES (16,'MessageBoard',4,'Fecha',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',5,'Data',1031510000);
INSERT INTO international VALUES (341,'WebGUI',3,'Bewerk profiel.',1031516049);
INSERT INTO international VALUES (16,'USS',1,'Untitled',1031514049);
INSERT INTO international VALUES (16,'USS',4,'Sin t�tulo',1031510000);
INSERT INTO international VALUES (16,'USS',5,'Sem titulo',1031510000);
INSERT INTO international VALUES (380,'WebGUI',2,'Stil ID',1031510000);
INSERT INTO international VALUES (340,'WebGUI',3,'Vrouw',1031516049);
INSERT INTO international VALUES (16,'WebGUI',1,'February',1031514049);
INSERT INTO international VALUES (16,'WebGUI',4,'Febrero',1031510000);
INSERT INTO international VALUES (16,'WebGUI',5,'Fevereiro',1031510000);
INSERT INTO international VALUES (339,'WebGUI',3,'Man',1031516049);
INSERT INTO international VALUES (17,'MessageBoard',1,'Post New Message',1031514049);
INSERT INTO international VALUES (17,'MessageBoard',4,'Mandar Nuevo Mensage',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',5,'Colocar nova mensagem',1031510000);
INSERT INTO international VALUES (338,'WebGUI',3,'Bewerk profiel',1031516049);
INSERT INTO international VALUES (17,'USS',1,'Are you certain you wish to delete this submission?',1031514049);
INSERT INTO international VALUES (17,'USS',4,'Est� seguro de querer eliminar �sta contribuci�n?',1031510000);
INSERT INTO international VALUES (17,'USS',5,'Tem a certeza que quer apagar esta submiss�o?',1031510000);
INSERT INTO international VALUES (337,'WebGUI',3,'Home pagina URL',1031516049);
INSERT INTO international VALUES (17,'WebGUI',1,'March',1031514049);
INSERT INTO international VALUES (17,'WebGUI',4,'Marzo',1031510000);
INSERT INTO international VALUES (17,'WebGUI',5,'Mar�o',1031510000);
INSERT INTO international VALUES (336,'WebGUI',3,'Geboortedatum',1031516049);
INSERT INTO international VALUES (18,'MessageBoard',1,'Thread Started',1031514049);
INSERT INTO international VALUES (18,'MessageBoard',4,'Inicio',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',5,'Inicial',1031510000);
INSERT INTO international VALUES (59,'USS',1,'Next Submission',1031514049);
INSERT INTO international VALUES (335,'WebGUI',3,'Sexe',1031516049);
INSERT INTO international VALUES (18,'USS',1,'Edit User Submission System',1031514049);
INSERT INTO international VALUES (18,'USS',4,'Editar Sistema de Contribuci�n de Usuarios',1031510000);
INSERT INTO international VALUES (18,'USS',5,'Modificar sistema de submiss�o do utilizador',1031510000);
INSERT INTO international VALUES (334,'WebGUI',3,'Werk telefoon',1031516049);
INSERT INTO international VALUES (18,'WebGUI',1,'April',1031514049);
INSERT INTO international VALUES (18,'WebGUI',4,'Abril',1031510000);
INSERT INTO international VALUES (18,'WebGUI',5,'Abril',1031510000);
INSERT INTO international VALUES (333,'WebGUI',3,'Werk land',1031516049);
INSERT INTO international VALUES (19,'MessageBoard',1,'Replies',1031514049);
INSERT INTO international VALUES (19,'MessageBoard',4,'Respuestas',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',5,'Respostas',1031510000);
INSERT INTO international VALUES (19,'USS',1,'Edit Submission',1031514049);
INSERT INTO international VALUES (19,'USS',4,'Editar Contribuci�n',1031510000);
INSERT INTO international VALUES (19,'USS',5,'Modificar submiss�o',1031510000);
INSERT INTO international VALUES (332,'WebGUI',3,'Werk postcode',1031516049);
INSERT INTO international VALUES (19,'WebGUI',1,'May',1031514049);
INSERT INTO international VALUES (19,'WebGUI',4,'Mayo',1031510000);
INSERT INTO international VALUES (19,'WebGUI',5,'Maio',1031510000);
INSERT INTO international VALUES (331,'WebGUI',3,'Werk staat',1031516049);
INSERT INTO international VALUES (20,'MessageBoard',1,'Last Reply',1031514049);
INSERT INTO international VALUES (20,'MessageBoard',4,'�ltima respuesta',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',5,'Ultima resposta',1031510000);
INSERT INTO international VALUES (20,'USS',1,'Post New Submission',1031514049);
INSERT INTO international VALUES (20,'USS',4,'Nueva Contribuci�n',1031510000);
INSERT INTO international VALUES (20,'USS',5,'Colocar nova submiss�o',1031510000);
INSERT INTO international VALUES (330,'WebGUI',3,'Werk stad',1031516049);
INSERT INTO international VALUES (20,'WebGUI',1,'June',1031514049);
INSERT INTO international VALUES (20,'WebGUI',4,'Junio',1031510000);
INSERT INTO international VALUES (20,'WebGUI',5,'Junho',1031510000);
INSERT INTO international VALUES (21,'USS',1,'Submitted By',1031514049);
INSERT INTO international VALUES (21,'USS',4,'Contribuida por',1031510000);
INSERT INTO international VALUES (21,'USS',5,'Submetido por',1031510000);
INSERT INTO international VALUES (329,'WebGUI',3,'Werk adres',1031516049);
INSERT INTO international VALUES (21,'WebGUI',1,'July',1031514049);
INSERT INTO international VALUES (21,'WebGUI',4,'Julio',1031510000);
INSERT INTO international VALUES (21,'WebGUI',5,'Julho',1031510000);
INSERT INTO international VALUES (328,'WebGUI',3,'Thuis telefoon',1031516049);
INSERT INTO international VALUES (22,'WebGUI',1,'August',1031514049);
INSERT INTO international VALUES (22,'WebGUI',4,'Agosto',1031510000);
INSERT INTO international VALUES (22,'WebGUI',5,'Agosto',1031510000);
INSERT INTO international VALUES (327,'WebGUI',3,'Thuis land',1031516049);
INSERT INTO international VALUES (23,'WebGUI',1,'September',1031514049);
INSERT INTO international VALUES (23,'WebGUI',4,'Septiembre',1031510000);
INSERT INTO international VALUES (23,'WebGUI',5,'Setembro',1031510000);
INSERT INTO international VALUES (572,'WebGUI',1,'Approve',1031514049);
INSERT INTO international VALUES (572,'WebGUI',4,'Aprobar',1031510000);
INSERT INTO international VALUES (572,'WebGUI',5,'Aprovar',1031510000);
INSERT INTO international VALUES (326,'WebGUI',3,'Thuis postcode',1031516049);
INSERT INTO international VALUES (24,'WebGUI',1,'October',1031514049);
INSERT INTO international VALUES (24,'WebGUI',4,'Octubre',1031510000);
INSERT INTO international VALUES (24,'WebGUI',5,'Outubro',1031510000);
INSERT INTO international VALUES (381,'WebGUI',2,'WebGUI hat eine\nverst�mmelte Anfrage erhalten und kann nicht weitermachen. �blicherweise\nwird das durch Sonderzeichen verursacht. Nutzen Sie bitte den \"Zur�ck\"\nButton Ihres Browsers und versuchen Sie es noch einmal.',1031510000);
INSERT INTO international VALUES (573,'WebGUI',1,'Leave Pending',1031514049);
INSERT INTO international VALUES (573,'WebGUI',4,'Dejan pendiente',1031510000);
INSERT INTO international VALUES (573,'WebGUI',5,'Deixar pendente',1031510000);
INSERT INTO international VALUES (325,'WebGUI',3,'Thuis staat',1031516049);
INSERT INTO international VALUES (25,'WebGUI',1,'November',1031514049);
INSERT INTO international VALUES (25,'WebGUI',4,'Noviembre',1031510000);
INSERT INTO international VALUES (25,'WebGUI',5,'Novembro',1031510000);
INSERT INTO international VALUES (574,'WebGUI',1,'Deny',1031514049);
INSERT INTO international VALUES (574,'WebGUI',4,'Denegar',1031510000);
INSERT INTO international VALUES (574,'WebGUI',5,'Negar',1031510000);
INSERT INTO international VALUES (378,'WebGUI',2,'Benutzer ID',1031510000);
INSERT INTO international VALUES (324,'WebGUI',3,'Thuis plaats',1031516049);
INSERT INTO international VALUES (26,'WebGUI',1,'December',1031514049);
INSERT INTO international VALUES (26,'WebGUI',4,'Diciembre',1031510000);
INSERT INTO international VALUES (26,'WebGUI',5,'Dezembro',1031510000);
INSERT INTO international VALUES (323,'WebGUI',3,'Thuis adres',1031516049);
INSERT INTO international VALUES (27,'USS',1,'Edit',1031514049);
INSERT INTO international VALUES (27,'USS',4,'Editar',1031510000);
INSERT INTO international VALUES (27,'USS',5,'Modificar',1031510000);
INSERT INTO international VALUES (322,'WebGUI',3,'Pager',1031516049);
INSERT INTO international VALUES (27,'WebGUI',1,'Sunday',1031514049);
INSERT INTO international VALUES (27,'WebGUI',4,'Domingo',1031510000);
INSERT INTO international VALUES (27,'WebGUI',5,'Domingo',1031510000);
INSERT INTO international VALUES (321,'WebGUI',3,'Mobiel nummer',1031516049);
INSERT INTO international VALUES (28,'USS',1,'Return To Submissions List',1031514049);
INSERT INTO international VALUES (28,'USS',4,'Regresar a lista de contribuciones',1031510000);
INSERT INTO international VALUES (28,'USS',5,'Voltar � lista de submiss�es',1031510000);
INSERT INTO international VALUES (376,'WebGUI',2,'Paket',1031510000);
INSERT INTO international VALUES (28,'WebGUI',1,'Monday',1031514049);
INSERT INTO international VALUES (28,'WebGUI',4,'Lunes',1031510000);
INSERT INTO international VALUES (28,'WebGUI',5,'Segunda',1031510000);
INSERT INTO international VALUES (29,'USS',1,'User Submission System',1031514049);
INSERT INTO international VALUES (29,'USS',4,'Sistema de Contribuci�n de Usuarios',1031510000);
INSERT INTO international VALUES (29,'USS',5,'Sistema de submiss�o do utilizador',1031510000);
INSERT INTO international VALUES (320,'WebGUI',3,'\"<a href=\"\"http://messenger.yahoo.com/\"\">Yahoo! Messenger</a> Id\"',1031516049);
INSERT INTO international VALUES (29,'WebGUI',1,'Tuesday',1031514049);
INSERT INTO international VALUES (29,'WebGUI',4,'Martes',1031510000);
INSERT INTO international VALUES (29,'WebGUI',5,'Ter�a',1031510000);
INSERT INTO international VALUES (1,'LinkList',6,'Indentering',1031510000);
INSERT INTO international VALUES (1,'Item',6,'L�nk URL',1031510000);
INSERT INTO international VALUES (1,'ExtraColumn',6,'Extra kolumn',1031649742);
INSERT INTO international VALUES (30,'WebGUI',1,'Wednesday',1031514049);
INSERT INTO international VALUES (30,'WebGUI',4,'Mi�rcoles',1031510000);
INSERT INTO international VALUES (30,'WebGUI',5,'Quarta',1031510000);
INSERT INTO international VALUES (31,'WebGUI',1,'Thursday',1031514049);
INSERT INTO international VALUES (31,'WebGUI',4,'Jueves',1031510000);
INSERT INTO international VALUES (31,'WebGUI',5,'Quinta',1031510000);
INSERT INTO international VALUES (377,'WebGUI',2,'Von Ihren (Paket)\n-Administratoren wurden keine Pakete bereitgestellt.',1031510000);
INSERT INTO international VALUES (32,'WebGUI',1,'Friday',1031514049);
INSERT INTO international VALUES (32,'WebGUI',4,'Viernes',1031510000);
INSERT INTO international VALUES (32,'WebGUI',5,'Sexta',1031510000);
INSERT INTO international VALUES (319,'WebGUI',3,'\"<a href=\"\"http://messenger.msn.com/\"\">MSN Messenger</a> Id\"',1031516049);
INSERT INTO international VALUES (33,'WebGUI',1,'Saturday',1031514049);
INSERT INTO international VALUES (33,'WebGUI',4,'Sabado',1031510000);
INSERT INTO international VALUES (33,'WebGUI',5,'Sabado',1031510000);
INSERT INTO international VALUES (34,'WebGUI',1,'set date',1031514049);
INSERT INTO international VALUES (34,'WebGUI',4,'fijar fecha',1031510000);
INSERT INTO international VALUES (34,'WebGUI',5,'acertar a data',1031510000);
INSERT INTO international VALUES (1,'MessageBoard',6,'L�gg till meddelandeforum',1031579387);
INSERT INTO international VALUES (35,'WebGUI',1,'Administrative Function',1031514049);
INSERT INTO international VALUES (35,'WebGUI',4,'Funciones Administrativas',1031510000);
INSERT INTO international VALUES (35,'WebGUI',5,'Fun��o administrativa',1031510000);
INSERT INTO international VALUES (317,'WebGUI',3,'\"<a href=\"\"http://www.icq.com\"\">ICQ</a> UIN\"',1031516049);
INSERT INTO international VALUES (318,'WebGUI',3,'\"<a href=\"\"http://www.aol.com/aim/homenew.adp\"\">AIM</a> Id\"',1031516049);
INSERT INTO international VALUES (36,'WebGUI',1,'You must be an administrator to perform this function. Please contact one of your administrators. The following is a list of the administrators for this system:',1031514049);
INSERT INTO international VALUES (36,'WebGUI',4,'Debe ser administrador para realizar esta tarea. Por favor contacte a uno de los administradores. La siguiente es una lista de los administradores de �ste sistema:',1031510000);
INSERT INTO international VALUES (36,'WebGUI',5,'Fun��o reservada a administradores. Fale com um dos seguintes administradores:',1031510000);
INSERT INTO international VALUES (316,'WebGUI',3,'Achternaam',1031516049);
INSERT INTO international VALUES (37,'WebGUI',1,'Permission Denied!',1031514049);
INSERT INTO international VALUES (37,'WebGUI',4,'Permiso Denegado!',1031510000);
INSERT INTO international VALUES (37,'WebGUI',5,'Permiss�o negada!',1031510000);
INSERT INTO international VALUES (38,'WebGUI',5,'\"N�o tem privil�gios para essa opera��o. ^a(Identifique-se na entrada); com uma conta que permita essa opera��o.\"',1031510000);
INSERT INTO international VALUES (404,'WebGUI',1,'First Page',1031514049);
INSERT INTO international VALUES (38,'WebGUI',4,'\"No tiene privilegios suficientes para realizar �sta operaci�n. Por favor ^a(ingrese con una cuenta); que posea los privilegios suficientes antes de intentar �sta operaci�n.\"',1031510000);
INSERT INTO international VALUES (314,'WebGUI',3,'Voornaam',1031516049);
INSERT INTO international VALUES (315,'WebGUI',3,'Tussenvoegsel',1031516049);
INSERT INTO international VALUES (38,'WebGUI',1,'You do not have sufficient privileges to perform this operation. Please ^a(log in with an account); that has sufficient privileges before attempting this operation.',1031514049);
INSERT INTO international VALUES (375,'WebGUI',2,'Paket ausw�hlen,\ndas verteilt werden soll',1031510000);
INSERT INTO international VALUES (374,'WebGUI',2,'Pakete\nanschauen',1031510000);
INSERT INTO international VALUES (313,'WebGUI',3,'Sta andere informatie toe?',1031516049);
INSERT INTO international VALUES (39,'WebGUI',1,'You do not have sufficient privileges to access this page.',1031514049);
INSERT INTO international VALUES (39,'WebGUI',4,'No tiene suficientes privilegios para ingresar a �sta p�gina.',1031510000);
INSERT INTO international VALUES (39,'WebGUI',5,'N�o tem privil�gios para aceder a essa p�gina.',1031510000);
INSERT INTO international VALUES (372,'WebGUI',2,'Gruppen eines\nBenutzers bearbeiten',1031510000);
INSERT INTO international VALUES (312,'WebGUI',3,'Sta bedrijfs informatie toe?',1031516049);
INSERT INTO international VALUES (40,'WebGUI',1,'Vital Component',1031514049);
INSERT INTO international VALUES (40,'WebGUI',4,'Componente Vital',1031510000);
INSERT INTO international VALUES (40,'WebGUI',5,'Componente vital',1031510000);
INSERT INTO international VALUES (371,'WebGUI',2,'Gruppierung\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (310,'WebGUI',3,'Sta extra contact informatie toe?',1031516049);
INSERT INTO international VALUES (311,'WebGUI',3,'Sta thuis informatie toe?',1031516049);
INSERT INTO international VALUES (41,'WebGUI',1,'You\'re attempting to remove a vital component of the WebGUI system. If you were allowed to continue WebGUI may cease to function.',1031514049);
INSERT INTO international VALUES (41,'WebGUI',4,'Esta intentando eliminar un componente vital del sistema WebGUI. Si contin�a puede causar un mal funcionamiento de WebGUI.',1031510000);
INSERT INTO international VALUES (41,'WebGUI',5,'Est� a tentar remover um componente vital do WebGUI. Se continuar pode haver um erro grave.',1031510000);
INSERT INTO international VALUES (42,'WebGUI',1,'Please Confirm',1031514049);
INSERT INTO international VALUES (42,'WebGUI',4,'Por favor confirme',1031510000);
INSERT INTO international VALUES (42,'WebGUI',5,'Confirma',1031510000);
INSERT INTO international VALUES (309,'WebGUI',3,'Sta echte naam toe?',1031516049);
INSERT INTO international VALUES (43,'WebGUI',1,'Are you certain that you wish to delete this content?',1031514049);
INSERT INTO international VALUES (43,'WebGUI',4,'Est� seguro de querer eliminar �ste contenido?',1031510000);
INSERT INTO international VALUES (43,'WebGUI',5,'Tem a certeza que quer apagar este conteudo?',1031510000);
INSERT INTO international VALUES (368,'WebGUI',2,'Diesem Benutzer\neine neue Gruppe hinzuf�gen.',1031510000);
INSERT INTO international VALUES (308,'WebGUI',3,'Bewerk profiel instellingen',1031516049);
INSERT INTO international VALUES (44,'WebGUI',1,'Yes, I\'m sure.',1031514049);
INSERT INTO international VALUES (44,'WebGUI',4,'Si',1031510000);
INSERT INTO international VALUES (44,'WebGUI',5,'\"Sim, tenho a certeza.\"',1031510000);
INSERT INTO international VALUES (45,'WebGUI',1,'No, I made a mistake.',1031514049);
INSERT INTO international VALUES (45,'WebGUI',4,'No',1031510000);
INSERT INTO international VALUES (45,'WebGUI',5,'\"N�o, enganei-me.\"',1031510000);
INSERT INTO international VALUES (46,'WebGUI',1,'My Account',1031514049);
INSERT INTO international VALUES (46,'WebGUI',4,'Mi Cuenta',1031510000);
INSERT INTO international VALUES (46,'WebGUI',5,'Minha Conta',1031510000);
INSERT INTO international VALUES (307,'WebGUI',3,'Gebruik standaard metag tags?',1031516049);
INSERT INTO international VALUES (47,'WebGUI',1,'Home',1031514049);
INSERT INTO international VALUES (47,'WebGUI',4,'Home',1031510000);
INSERT INTO international VALUES (47,'WebGUI',5,'Inicio',1031510000);
INSERT INTO international VALUES (48,'WebGUI',1,'Hello',1031514049);
INSERT INTO international VALUES (48,'WebGUI',4,'Hola',1031510000);
INSERT INTO international VALUES (48,'WebGUI',5,'Ola',1031510000);
INSERT INTO international VALUES (304,'WebGUI',3,'Taal',1031516049);
INSERT INTO international VALUES (306,'WebGUI',3,'Bind gebruikersnaam',1031516049);
INSERT INTO international VALUES (49,'WebGUI',1,'Click <a href=\"^\\;?op=logout\">here</a> to log out.',1031514049);
INSERT INTO international VALUES (49,'WebGUI',4,'Click <a href=\"^\\;?op=logout\">aqu�</a> para salir.',1031510000);
INSERT INTO international VALUES (49,'WebGUI',5,'Clique <a href=\"^\\;?op=logout\">aqui</a> para sair.',1031510000);
INSERT INTO international VALUES (245,'WebGUI',3,'Datum',1031516049);
INSERT INTO international VALUES (50,'WebGUI',1,'Username',1031514049);
INSERT INTO international VALUES (50,'WebGUI',4,'Nombre usuario',1031510000);
INSERT INTO international VALUES (50,'WebGUI',5,'Username',1031510000);
INSERT INTO international VALUES (51,'WebGUI',1,'Password',1031514049);
INSERT INTO international VALUES (51,'WebGUI',4,'Password',1031510000);
INSERT INTO international VALUES (51,'WebGUI',5,'Password',1031510000);
INSERT INTO international VALUES (244,'WebGUI',3,'Afzender',1031516049);
INSERT INTO international VALUES (52,'WebGUI',1,'login',1031514049);
INSERT INTO international VALUES (52,'WebGUI',4,'ingresar',1031510000);
INSERT INTO international VALUES (52,'WebGUI',5,'entrar',1031510000);
INSERT INTO international VALUES (367,'WebGUI',2,'verf�llt nach',1031510000);
INSERT INTO international VALUES (370,'WebGUI',2,'Gruppierung\nbearbeiten',1031510000);
INSERT INTO international VALUES (369,'WebGUI',2,'Verfallsdatum',1031510000);
INSERT INTO international VALUES (240,'WebGUI',3,'Bericht ID:',1031516049);
INSERT INTO international VALUES (53,'WebGUI',1,'Make Page Printable',1031514049);
INSERT INTO international VALUES (53,'WebGUI',4,'Hacer p�gina imprimible',1031510000);
INSERT INTO international VALUES (53,'WebGUI',5,'Vers�o para impress�o',1031510000);
INSERT INTO international VALUES (239,'WebGUI',3,'Datum:',1031516049);
INSERT INTO international VALUES (54,'WebGUI',1,'Create Account',1031514049);
INSERT INTO international VALUES (54,'WebGUI',4,'Crear Cuenta',1031510000);
INSERT INTO international VALUES (54,'WebGUI',5,'Criar conta',1031510000);
INSERT INTO international VALUES (238,'WebGUI',3,'Naam:',1031516049);
INSERT INTO international VALUES (55,'WebGUI',1,'Password (confirm)',1031514049);
INSERT INTO international VALUES (55,'WebGUI',4,'Password (confirmar)',1031510000);
INSERT INTO international VALUES (55,'WebGUI',5,'Password (confirmar)',1031510000);
INSERT INTO international VALUES (237,'WebGUI',3,'Onderwerp:',1031516049);
INSERT INTO international VALUES (56,'WebGUI',1,'Email Address',1031514049);
INSERT INTO international VALUES (56,'WebGUI',4,'Direcci�n de e-mail',1031510000);
INSERT INTO international VALUES (56,'WebGUI',5,'Endere�o de e-mail',1031510000);
INSERT INTO international VALUES (233,'WebGUI',3,'(einde)',1031516049);
INSERT INTO international VALUES (234,'WebGUI',3,'Bezig met antwoord posten',1031516049);
INSERT INTO international VALUES (57,'WebGUI',1,'This is only necessary if you wish to use features that require Email.',1031514049);
INSERT INTO international VALUES (57,'WebGUI',4,'Solo es necesaria si desea usar opciones que requieren e-mail.',1031510000);
INSERT INTO international VALUES (57,'WebGUI',5,'Apenas � necess�rio se pretender utilizar as funcionalidade que envolvam e-mail.',1031510000);
INSERT INTO international VALUES (232,'WebGUI',3,'Geen onderwerp',1031516049);
INSERT INTO international VALUES (58,'WebGUI',1,'I already have an account.',1031514049);
INSERT INTO international VALUES (58,'WebGUI',4,'Ya tengo una cuenta!',1031510000);
INSERT INTO international VALUES (58,'WebGUI',5,'J� tenho uma conta.',1031510000);
INSERT INTO international VALUES (59,'WebGUI',1,'I forgot my password.',1031514049);
INSERT INTO international VALUES (59,'WebGUI',4,'Perd� mi password',1031510000);
INSERT INTO international VALUES (59,'WebGUI',5,'Esqueci a minha password.',1031510000);
INSERT INTO international VALUES (363,'WebGUI',2,'Position des\nTemplates',1031510000);
INSERT INTO international VALUES (365,'WebGUI',2,'Ergebnisse der\nAbfrage',1031510000);
INSERT INTO international VALUES (366,'WebGUI',2,'Es wurden keine\nSeiten gefunden, die zu Ihrer Abfrage passen.',1031510000);
INSERT INTO international VALUES (229,'WebGUI',3,'Onderwerp',1031516049);
INSERT INTO international VALUES (230,'WebGUI',3,'Bericht',1031516049);
INSERT INTO international VALUES (231,'WebGUI',3,'Bezig met bericht posten...',1031516049);
INSERT INTO international VALUES (60,'WebGUI',1,'Are you certain you want to deactivate your account. If you proceed your account information will be lost permanently.',1031514049);
INSERT INTO international VALUES (60,'WebGUI',4,'Est� seguro que quiere desactivar su cuenta. Si contin�a su informaci�n se perder� permanentemente.',1031510000);
INSERT INTO international VALUES (60,'WebGUI',5,'Tem a certeza que quer desactivar a sua conta. Se o fizer � permanente!',1031510000);
INSERT INTO international VALUES (61,'WebGUI',1,'Update Account Information',1031514049);
INSERT INTO international VALUES (61,'WebGUI',4,'Actualizar informaci�n de la Cuenta',1031510000);
INSERT INTO international VALUES (61,'WebGUI',5,'Actualizar as informa��es da conta',1031510000);
INSERT INTO international VALUES (228,'WebGUI',3,'Bewerk bericht...',1031516049);
INSERT INTO international VALUES (62,'WebGUI',1,'save',1031514049);
INSERT INTO international VALUES (62,'WebGUI',4,'guardar',1031510000);
INSERT INTO international VALUES (62,'WebGUI',5,'gravar',1031510000);
INSERT INTO international VALUES (63,'WebGUI',1,'Turn admin on.',1031514049);
INSERT INTO international VALUES (63,'WebGUI',4,'Encender Admin',1031510000);
INSERT INTO international VALUES (63,'WebGUI',5,'Ligar modo administrativo.',1031510000);
INSERT INTO international VALUES (175,'WebGUI',3,'Macro\'s uitvoeren?',1031516049);
INSERT INTO international VALUES (64,'WebGUI',1,'Log out.',1031514049);
INSERT INTO international VALUES (64,'WebGUI',4,'Salir',1031510000);
INSERT INTO international VALUES (64,'WebGUI',5,'Sair.',1031510000);
INSERT INTO international VALUES (364,'WebGUI',2,'Suchen',1031510000);
INSERT INTO international VALUES (362,'WebGUI',2,'Nebeneinander',1031510000);
INSERT INTO international VALUES (65,'WebGUI',1,'Please deactivate my account permanently.',1031514049);
INSERT INTO international VALUES (65,'WebGUI',4,'Por favor desactive mi cuenta permanentemente',1031510000);
INSERT INTO international VALUES (65,'WebGUI',5,'Desactivar a minha conta permanentemente.',1031510000);
INSERT INTO international VALUES (174,'WebGUI',3,'Titel laten zien?',1031516049);
INSERT INTO international VALUES (66,'WebGUI',1,'Log In',1031514049);
INSERT INTO international VALUES (66,'WebGUI',4,'Ingresar',1031510000);
INSERT INTO international VALUES (66,'WebGUI',5,'Entrar',1031510000);
INSERT INTO international VALUES (171,'WebGUI',3,'Rich edit',1031516049);
INSERT INTO international VALUES (67,'WebGUI',1,'Create a new account.',1031514049);
INSERT INTO international VALUES (67,'WebGUI',4,'Crear nueva Cuenta',1031510000);
INSERT INTO international VALUES (67,'WebGUI',5,'Criar nova conta.',1031510000);
INSERT INTO international VALUES (169,'WebGUI',3,'Een nieuwe gebruiker toevoegen.',1031516049);
INSERT INTO international VALUES (170,'WebGUI',3,'Zoeken',1031516049);
INSERT INTO international VALUES (68,'WebGUI',1,'The account information you supplied is invalid. Either the account does not exist or the username/password combination was incorrect.',1031514049);
INSERT INTO international VALUES (68,'WebGUI',4,'La informaci�n de su cuenta no es v�lida. O la cuenta no existe',1031510000);
INSERT INTO international VALUES (68,'WebGUI',5,'As informa��es da sua conta n�o foram encontradas. N�o existe ou a combina��o username/password est� incorrecta.',1031510000);
INSERT INTO international VALUES (69,'WebGUI',1,'Please contact your system administrator for assistance.',1031514049);
INSERT INTO international VALUES (69,'WebGUI',4,'Por favor contacte a su administrador por asistencia.',1031510000);
INSERT INTO international VALUES (69,'WebGUI',5,'Contacte o seu administrador de sistemas para assist�ncia.',1031510000);
INSERT INTO international VALUES (361,'WebGUI',2,'Drei �ber\neinem',1031510000);
INSERT INTO international VALUES (360,'WebGUI',2,'Einer �ber\ndrei',1031510000);
INSERT INTO international VALUES (357,'WebGUI',2,'Nachrichten',1031510000);
INSERT INTO international VALUES (358,'WebGUI',2,'Linke Spalte',1031510000);
INSERT INTO international VALUES (168,'WebGUI',3,'Bewerk gebruiker',1031516049);
INSERT INTO international VALUES (70,'WebGUI',1,'Error',1031514049);
INSERT INTO international VALUES (70,'WebGUI',4,'Error',1031510000);
INSERT INTO international VALUES (70,'WebGUI',5,'Erro',1031510000);
INSERT INTO international VALUES (71,'WebGUI',1,'Recover password',1031514049);
INSERT INTO international VALUES (71,'WebGUI',4,'Recuperar password',1031510000);
INSERT INTO international VALUES (71,'WebGUI',5,'Recuperar password',1031510000);
INSERT INTO international VALUES (72,'WebGUI',1,'recover',1031514049);
INSERT INTO international VALUES (72,'WebGUI',4,'recuperar',1031510000);
INSERT INTO international VALUES (72,'WebGUI',5,'recoperar',1031510000);
INSERT INTO international VALUES (73,'WebGUI',1,'Log in.',1031514049);
INSERT INTO international VALUES (73,'WebGUI',4,'Ingresar.',1031510000);
INSERT INTO international VALUES (73,'WebGUI',5,'Entrar.',1031510000);
INSERT INTO international VALUES (359,'WebGUI',2,'Rechte Spalte',1031510000);
INSERT INTO international VALUES (74,'WebGUI',1,'Account Information',1031514049);
INSERT INTO international VALUES (74,'WebGUI',4,'Informaci�n de la Cuenta',1031510000);
INSERT INTO international VALUES (74,'WebGUI',5,'Informa��es da sua conta',1031510000);
INSERT INTO international VALUES (354,'WebGUI',2,'Beitrags Log\nanschauen.',1031510000);
INSERT INTO international VALUES (166,'WebGUI',3,'Verbindt DN',1031516049);
INSERT INTO international VALUES (167,'WebGUI',3,'Weet u zeker dat u deze gebruiker wilt verwijderen? Alle gebruikersinformatie wordt permanent verwijdert als u door gaat.',1031516049);
INSERT INTO international VALUES (75,'WebGUI',1,'Your account information has been sent to your email address.',1031514049);
INSERT INTO international VALUES (75,'WebGUI',4,'La informaci�n de su cuenta ha sido enviada a su e-mail-',1031510000);
INSERT INTO international VALUES (75,'WebGUI',5,'As informa��es da sua conta foram envidas para o seu e-mail.',1031510000);
INSERT INTO international VALUES (165,'WebGUI',3,'LDAP URL',1031516049);
INSERT INTO international VALUES (76,'WebGUI',1,'That email address is not in our databases.',1031514049);
INSERT INTO international VALUES (76,'WebGUI',4,'El e-mail no est� en nuestra base de datos',1031510000);
INSERT INTO international VALUES (76,'WebGUI',5,'Esse endere�o de e-mail n�o foi encontrado nas nossas bases de dados',1031510000);
INSERT INTO international VALUES (356,'WebGUI',2,'Vorlage',1031510000);
INSERT INTO international VALUES (355,'WebGUI',2,'Standard',1031510000);
INSERT INTO international VALUES (163,'WebGUI',3,'Gebruiker toevoegen',1031516049);
INSERT INTO international VALUES (164,'WebGUI',3,'Toegangs controle methode',1031516049);
INSERT INTO international VALUES (77,'WebGUI',1,'That account name is already in use by another member of this site. Please try a different username. The following are some suggestions:',1031514049);
INSERT INTO international VALUES (77,'WebGUI',4,'El nombre de cuenta ya est� en uso por otro miembro. Por favor trate con otro nombre de usuario.  Los siguiente son algunas sugerencias:',1031510000);
INSERT INTO international VALUES (77,'WebGUI',5,'\"Esse nome de conta j� existe, tente outro. Veja as nossas sugest�es:\"',1031510000);
INSERT INTO international VALUES (162,'WebGUI',3,'Weet u zeker dat u alle pagina\'s en wobjects uit de prullenbak wilt verwijderen?',1031516049);
INSERT INTO international VALUES (78,'WebGUI',1,'Your passwords did not match. Please try again.',1031514049);
INSERT INTO international VALUES (78,'WebGUI',4,'Su password no concuerda. Trate de nuevo.',1031510000);
INSERT INTO international VALUES (78,'WebGUI',5,'\"As suas passwords n�o coincidem, tente novamente.\"',1031510000);
INSERT INTO international VALUES (161,'WebGUI',3,'Ingevoerd door',1031516049);
INSERT INTO international VALUES (79,'WebGUI',1,'Cannot connect to LDAP server.',1031514049);
INSERT INTO international VALUES (79,'WebGUI',4,'No se puede conectar con el servidor LDAP',1031510000);
INSERT INTO international VALUES (79,'WebGUI',5,'Impossivel ligar ao LDAP.',1031510000);
INSERT INTO international VALUES (160,'WebGUI',3,'Invoer datum',1031516049);
INSERT INTO international VALUES (80,'WebGUI',1,'Account created successfully!',1031514049);
INSERT INTO international VALUES (80,'WebGUI',4,'La cuenta se ha creado con �xito!',1031510000);
INSERT INTO international VALUES (80,'WebGUI',5,'Conta criada com sucesso!',1031510000);
INSERT INTO international VALUES (159,'WebGUI',3,'Berichten log',1031516049);
INSERT INTO international VALUES (81,'WebGUI',1,'Account updated successfully!',1031514049);
INSERT INTO international VALUES (81,'WebGUI',4,'La cuenta se actualiz� con �xito!',1031510000);
INSERT INTO international VALUES (81,'WebGUI',5,'Conta actualizada com sucesso!',1031510000);
INSERT INTO international VALUES (82,'WebGUI',1,'Administrative functions...',1031514049);
INSERT INTO international VALUES (82,'WebGUI',4,'Funciones Administrativas...',1031510000);
INSERT INTO international VALUES (82,'WebGUI',5,'Fun��es administrativas...',1031510000);
INSERT INTO international VALUES (353,'WebGUI',2,'Zur Zeit sind\nkeine ausstehenden Beitr�ge vorhanden.',1031510000);
INSERT INTO international VALUES (350,'WebGUI',2,'Abgeschlossen',1031510000);
INSERT INTO international VALUES (158,'WebGUI',3,'Een nieuwe stijl toevoegen.',1031516049);
INSERT INTO international VALUES (84,'WebGUI',1,'Group Name',1031514049);
INSERT INTO international VALUES (84,'WebGUI',4,'Nombre del Grupo',1031510000);
INSERT INTO international VALUES (84,'WebGUI',5,'Nome do grupo',1031510000);
INSERT INTO international VALUES (351,'WebGUI',2,'Beitragseingang',1031510000);
INSERT INTO international VALUES (157,'WebGUI',3,'Stijlen',1031516049);
INSERT INTO international VALUES (85,'WebGUI',1,'Description',1031514049);
INSERT INTO international VALUES (85,'WebGUI',4,'Descripci�n',1031510000);
INSERT INTO international VALUES (85,'WebGUI',5,'Descri��o',1031510000);
INSERT INTO international VALUES (352,'WebGUI',2,'Beitragsdatum',1031510000);
INSERT INTO international VALUES (155,'WebGUI',3,'Weet u zeker dat u deze stijl wilt verwijderen en migreer alle pagina\'s met de �fail safe� stijl?',1031516049);
INSERT INTO international VALUES (156,'WebGUI',3,'Bewerk stijl',1031516049);
INSERT INTO international VALUES (86,'WebGUI',1,'Are you certain you wish to delete this group? Beware that deleting a group is permanent and will remove all privileges associated with this group.',1031514049);
INSERT INTO international VALUES (86,'WebGUI',4,'Est� segugo de querer eliminar �ste grupo? Tenga en cuenta que la eliminaci�n es permanente y remover� todos los privilegios asociados con el grupo.',1031510000);
INSERT INTO international VALUES (86,'WebGUI',5,'Tem a certeza que quer apagar este grupo. Se o fizer apaga-o permanentemente e a todos os seus provil�gios.',1031510000);
INSERT INTO international VALUES (348,'WebGUI',2,'Name',1031510000);
INSERT INTO international VALUES (154,'WebGUI',3,'Style sheet',1031516049);
INSERT INTO international VALUES (87,'WebGUI',1,'Edit Group',1031514049);
INSERT INTO international VALUES (87,'WebGUI',4,'Editar Grupo',1031510000);
INSERT INTO international VALUES (87,'WebGUI',5,'Modificar grupo',1031510000);
INSERT INTO international VALUES (88,'WebGUI',1,'Users In Group',1031514049);
INSERT INTO international VALUES (88,'WebGUI',4,'Usuarios en Grupo',1031510000);
INSERT INTO international VALUES (88,'WebGUI',5,'Utilizadores no grupo',1031510000);
INSERT INTO international VALUES (349,'WebGUI',2,'Aktuelle\nVersion',1031510000);
INSERT INTO international VALUES (151,'WebGUI',3,'Stijl naam',1031516049);
INSERT INTO international VALUES (89,'WebGUI',1,'Groups',1031514049);
INSERT INTO international VALUES (89,'WebGUI',4,'Grupos',1031510000);
INSERT INTO international VALUES (89,'WebGUI',5,'Grupos',1031510000);
INSERT INTO international VALUES (149,'WebGUI',3,'Gebruikers',1031516049);
INSERT INTO international VALUES (90,'WebGUI',1,'Add new group.',1031514049);
INSERT INTO international VALUES (90,'WebGUI',4,'Agregar nuevo grupo',1031510000);
INSERT INTO international VALUES (90,'WebGUI',5,'Adicionar novo grupo.',1031510000);
INSERT INTO international VALUES (148,'WebGUI',3,'Wobjects',1031516049);
INSERT INTO international VALUES (91,'WebGUI',1,'Previous Page',1031514049);
INSERT INTO international VALUES (91,'WebGUI',4,'P�gina previa',1031510000);
INSERT INTO international VALUES (91,'WebGUI',5,'P�gina anterior',1031510000);
INSERT INTO international VALUES (147,'WebGUI',3,'Pagina\'s',1031516049);
INSERT INTO international VALUES (92,'WebGUI',1,'Next Page',1031514049);
INSERT INTO international VALUES (92,'WebGUI',4,'Siguiente p�gina',1031510000);
INSERT INTO international VALUES (92,'WebGUI',5,'Pr�xima p�gina',1031510000);
INSERT INTO international VALUES (93,'WebGUI',1,'Help',1031514049);
INSERT INTO international VALUES (93,'WebGUI',4,'Ayuda',1031510000);
INSERT INTO international VALUES (93,'WebGUI',5,'Ajuda',1031510000);
INSERT INTO international VALUES (146,'WebGUI',3,'Aktieve sessies',1031516049);
INSERT INTO international VALUES (94,'WebGUI',1,'See also',1031514049);
INSERT INTO international VALUES (94,'WebGUI',4,'Vea tambi�n',1031510000);
INSERT INTO international VALUES (94,'WebGUI',5,'Ver temb�m',1031510000);
INSERT INTO international VALUES (347,'WebGUI',2,'Profil anschauen\nvon',1031510000);
INSERT INTO international VALUES (145,'WebGUI',3,'WebGUI versie',1031516049);
INSERT INTO international VALUES (95,'WebGUI',1,'Help Index',1031514049);
INSERT INTO international VALUES (95,'WebGUI',4,'�ndice de Ayuda',1031510000);
INSERT INTO international VALUES (95,'WebGUI',5,'Indice da ajuda',1031510000);
INSERT INTO international VALUES (5,'LinkList',6,'Forts�tt med att l�gga till en l�nk?',1031510000);
INSERT INTO international VALUES (5,'Item',6,'Ladda ned bilaga',1031510000);
INSERT INTO international VALUES (346,'WebGUI',2,'Dieser Benutzer\nist kein Mitglied. Wir haben keine weiteren Informationen �ber ihn.',1031510000);
INSERT INTO international VALUES (99,'WebGUI',1,'Title',1031514049);
INSERT INTO international VALUES (99,'WebGUI',4,'T�tulo',1031510000);
INSERT INTO international VALUES (99,'WebGUI',5,'Titulo',1031510000);
INSERT INTO international VALUES (144,'WebGUI',3,'Bekijk statistieken',1031516049);
INSERT INTO international VALUES (100,'WebGUI',1,'Meta Tags',1031514049);
INSERT INTO international VALUES (100,'WebGUI',4,'Meta Tags',1031510000);
INSERT INTO international VALUES (100,'WebGUI',5,'Meta Tags',1031510000);
INSERT INTO international VALUES (345,'WebGUI',2,'Kein Mitglied',1031510000);
INSERT INTO international VALUES (142,'WebGUI',3,'Sessie time out',1031516049);
INSERT INTO international VALUES (143,'WebGUI',3,'Beheer instellingen.',1031516049);
INSERT INTO international VALUES (101,'WebGUI',1,'Are you certain that you wish to delete this page, its content, and all items under it?',1031514049);
INSERT INTO international VALUES (101,'WebGUI',4,'Est� seguro de querer eliminar �sta p�gina',1031510000);
INSERT INTO international VALUES (101,'WebGUI',5,'\"Tem a certeza que quer apagar esta p�gina, o seu conteudo e tudo que est� abaixo?\"',1031510000);
INSERT INTO international VALUES (102,'WebGUI',1,'Edit Page',1031514049);
INSERT INTO international VALUES (102,'WebGUI',4,'Editar P�gina',1031510000);
INSERT INTO international VALUES (102,'WebGUI',5,'Modificar a p�gina',1031510000);
INSERT INTO international VALUES (141,'WebGUI',3,'Niet gevonden pagina',1031516049);
INSERT INTO international VALUES (103,'WebGUI',1,'Page Specifics',1031514049);
INSERT INTO international VALUES (103,'WebGUI',4,'Propio de la p�gina',1031510000);
INSERT INTO international VALUES (103,'WebGUI',5,'Especifica��es da p�gina',1031510000);
INSERT INTO international VALUES (104,'WebGUI',1,'Page URL',1031514049);
INSERT INTO international VALUES (104,'WebGUI',4,'URL de la p�gina',1031510000);
INSERT INTO international VALUES (104,'WebGUI',5,'URL da p�gina',1031510000);
INSERT INTO international VALUES (140,'WebGUI',3,'Bewerk allerlei instellingen',1031516049);
INSERT INTO international VALUES (105,'WebGUI',1,'Style',1031514049);
INSERT INTO international VALUES (105,'WebGUI',4,'Estilo',1031510000);
INSERT INTO international VALUES (105,'WebGUI',5,'Estilo',1031510000);
INSERT INTO international VALUES (342,'WebGUI',2,'Benutzerkonto\nbearbeiten.',1031510000);
INSERT INTO international VALUES (341,'WebGUI',2,'Profil\nbearbeiten.',1031510000);
INSERT INTO international VALUES (340,'WebGUI',2,'weiblich',1031510000);
INSERT INTO international VALUES (138,'WebGUI',3,'Ja',1031516049);
INSERT INTO international VALUES (139,'WebGUI',3,'Nee',1031516049);
INSERT INTO international VALUES (106,'WebGUI',1,'Select \"Yes\" to change all the pages under this page to this style.',1031514049);
INSERT INTO international VALUES (106,'WebGUI',4,'Marque para dar �ste estilo a todas las sub-p�ginas.',1031510000);
INSERT INTO international VALUES (106,'WebGUI',5,'Escolha para atribuir este estilo a todas as sub-p�ginas',1031510000);
INSERT INTO international VALUES (135,'WebGUI',3,'SMTP server',1031516049);
INSERT INTO international VALUES (107,'WebGUI',1,'Privileges',1031514049);
INSERT INTO international VALUES (107,'WebGUI',4,'Privilegios',1031510000);
INSERT INTO international VALUES (107,'WebGUI',5,'Privil�gios',1031510000);
INSERT INTO international VALUES (108,'WebGUI',1,'Owner',1031514049);
INSERT INTO international VALUES (108,'WebGUI',4,'Due�o',1031510000);
INSERT INTO international VALUES (108,'WebGUI',5,'Dono',1031510000);
INSERT INTO international VALUES (134,'WebGUI',3,'Bericht om wachtwoord terug te vinden',1031516049);
INSERT INTO international VALUES (109,'WebGUI',1,'Owner can view?',1031514049);
INSERT INTO international VALUES (109,'WebGUI',4,'Due�o puede ver?',1031510000);
INSERT INTO international VALUES (109,'WebGUI',5,'O dono pode ver?',1031510000);
INSERT INTO international VALUES (110,'WebGUI',1,'Owner can edit?',1031514049);
INSERT INTO international VALUES (110,'WebGUI',4,'Due�o puede editar?',1031510000);
INSERT INTO international VALUES (110,'WebGUI',5,'O dono pode modificar?',1031510000);
INSERT INTO international VALUES (343,'WebGUI',2,'Profil\nanschauen.',1031510000);
INSERT INTO international VALUES (133,'WebGUI',3,'Bewerk email instellingen',1031516049);
INSERT INTO international VALUES (111,'WebGUI',1,'Group',1031514049);
INSERT INTO international VALUES (111,'WebGUI',4,'Grupo',1031510000);
INSERT INTO international VALUES (111,'WebGUI',5,'Grupo',1031510000);
INSERT INTO international VALUES (112,'WebGUI',1,'Group can view?',1031514049);
INSERT INTO international VALUES (112,'WebGUI',4,'Grupo puede ver?',1031510000);
INSERT INTO international VALUES (112,'WebGUI',5,'O grupo pode ver?',1031510000);
INSERT INTO international VALUES (130,'WebGUI',3,'Maximum grootte bijlagen',1031516049);
INSERT INTO international VALUES (113,'WebGUI',1,'Group can edit?',1031514049);
INSERT INTO international VALUES (113,'WebGUI',4,'Grupo puede editar?',1031510000);
INSERT INTO international VALUES (113,'WebGUI',5,'O grupo pode modificar?',1031510000);
INSERT INTO international VALUES (338,'WebGUI',2,'Profil\nbearbeiten',1031510000);
INSERT INTO international VALUES (127,'WebGUI',3,'URL bedrijf',1031516049);
INSERT INTO international VALUES (114,'WebGUI',1,'Anybody can view?',1031514049);
INSERT INTO international VALUES (114,'WebGUI',4,'Cualquiera puede ver?',1031510000);
INSERT INTO international VALUES (114,'WebGUI',5,'Qualquer pessoa pode ver?',1031510000);
INSERT INTO international VALUES (115,'WebGUI',1,'Anybody can edit?',1031514049);
INSERT INTO international VALUES (115,'WebGUI',4,'Cualquiera puede editar?',1031510000);
INSERT INTO international VALUES (115,'WebGUI',5,'Qualquer pessoa pode modificar?',1031510000);
INSERT INTO international VALUES (339,'WebGUI',2,'m�nnlich',1031510000);
INSERT INTO international VALUES (125,'WebGUI',3,'Bedrijfsnaam',1031516049);
INSERT INTO international VALUES (126,'WebGUI',3,'Email adres bedrijf',1031516049);
INSERT INTO international VALUES (116,'WebGUI',1,'Select \"Yes\" to change the privileges of all pages under this page to these privileges.',1031514049);
INSERT INTO international VALUES (116,'WebGUI',4,'Marque para dar �stos privilegios a todas las sub-p�ginas.',1031510000);
INSERT INTO international VALUES (116,'WebGUI',5,'Escolher para atribuir estes privil�gios a todas as sub-p�ginas.',1031510000);
INSERT INTO international VALUES (117,'WebGUI',1,'Edit User Settings',1031514049);
INSERT INTO international VALUES (117,'WebGUI',4,'Editar Opciones de Auntentificaci�n',1031510000);
INSERT INTO international VALUES (117,'WebGUI',5,'Modificar prefer�ncias de autentica��o',1031510000);
INSERT INTO international VALUES (337,'WebGUI',2,'Homepage URL',1031510000);
INSERT INTO international VALUES (124,'WebGUI',3,'Bewerk bedrijfsinformatie',1031516049);
INSERT INTO international VALUES (118,'WebGUI',1,'Anonymous Registration',1031514049);
INSERT INTO international VALUES (118,'WebGUI',4,'Registraci�n An�nima',1031510000);
INSERT INTO international VALUES (118,'WebGUI',5,'Registo an�nimo',1031510000);
INSERT INTO international VALUES (123,'WebGUI',3,'LDAP wachtwoord naam',1031516049);
INSERT INTO international VALUES (119,'WebGUI',1,'Authentication Method (default)',1031514049);
INSERT INTO international VALUES (119,'WebGUI',4,'M�todo de Autentificaci�n (por defecto)',1031510000);
INSERT INTO international VALUES (119,'WebGUI',5,'M�todo de autentica��o (defeito)',1031510000);
INSERT INTO international VALUES (122,'WebGUI',3,'LDAP identiteit naam',1031516049);
INSERT INTO international VALUES (120,'WebGUI',1,'LDAP URL (default)',1031514049);
INSERT INTO international VALUES (120,'WebGUI',4,'URL LDAP (por defecto)',1031510000);
INSERT INTO international VALUES (120,'WebGUI',5,'URL LDAP (defeito)',1031510000);
INSERT INTO international VALUES (121,'WebGUI',1,'LDAP Identity (default)',1031514049);
INSERT INTO international VALUES (121,'WebGUI',4,'Identidad LDAP (por defecto)',1031510000);
INSERT INTO international VALUES (121,'WebGUI',5,'Identidade LDAP (defeito)',1031510000);
INSERT INTO international VALUES (121,'WebGUI',3,'LDAP identiteit (standaard)',1031516049);
INSERT INTO international VALUES (122,'WebGUI',1,'LDAP Identity Name',1031514049);
INSERT INTO international VALUES (122,'WebGUI',4,'Nombre Identidad LDAP',1031510000);
INSERT INTO international VALUES (122,'WebGUI',5,'Nome da entidade LDAP',1031510000);
INSERT INTO international VALUES (120,'WebGUI',3,'LDAP URL (standaard)',1031516049);
INSERT INTO international VALUES (123,'WebGUI',1,'LDAP Password Name',1031514049);
INSERT INTO international VALUES (123,'WebGUI',4,'Password LDAP',1031510000);
INSERT INTO international VALUES (123,'WebGUI',5,'Nome da password LDAP',1031510000);
INSERT INTO international VALUES (124,'WebGUI',1,'Edit Company Information',1031514049);
INSERT INTO international VALUES (124,'WebGUI',4,'Editar Informaci�n de la Compan�a',1031510000);
INSERT INTO international VALUES (124,'WebGUI',5,'Modificar informa��o da empresa',1031510000);
INSERT INTO international VALUES (119,'WebGUI',3,'Toegangs controle methode (standaard)',1031516049);
INSERT INTO international VALUES (125,'WebGUI',1,'Company Name',1031514049);
INSERT INTO international VALUES (125,'WebGUI',4,'Nombre de la Compan�a',1031510000);
INSERT INTO international VALUES (125,'WebGUI',5,'Nome da empresa',1031510000);
INSERT INTO international VALUES (118,'WebGUI',3,'Anonieme registratie',1031516049);
INSERT INTO international VALUES (126,'WebGUI',1,'Company Email Address',1031514049);
INSERT INTO international VALUES (126,'WebGUI',4,'E-mail de la Compan�a',1031510000);
INSERT INTO international VALUES (126,'WebGUI',5,'Moarada da empresa',1031510000);
INSERT INTO international VALUES (333,'WebGUI',2,'Land (B�ro)',1031510000);
INSERT INTO international VALUES (335,'WebGUI',2,'Geschlecht',1031510000);
INSERT INTO international VALUES (334,'WebGUI',2,'Telefon (B�ro)',1031510000);
INSERT INTO international VALUES (336,'WebGUI',2,'Geburtstag',1031510000);
INSERT INTO international VALUES (127,'WebGUI',1,'Company URL',1031514049);
INSERT INTO international VALUES (127,'WebGUI',4,'URL de la Compan�a',1031510000);
INSERT INTO international VALUES (127,'WebGUI',5,'URL da empresa',1031510000);
INSERT INTO international VALUES (331,'WebGUI',2,'Bundesland\n(B�ro)',1031510000);
INSERT INTO international VALUES (117,'WebGUI',3,'Bewerk toegangs controle instellingen',1031516049);
INSERT INTO international VALUES (130,'WebGUI',1,'Maximum Attachment Size',1031514049);
INSERT INTO international VALUES (130,'WebGUI',4,'Tama�o m�ximo de adjuntos',1031510000);
INSERT INTO international VALUES (130,'WebGUI',5,'Tamanho m�ximo dos anexos',1031510000);
INSERT INTO international VALUES (330,'WebGUI',2,'Ort (B�ro)',1031510000);
INSERT INTO international VALUES (133,'WebGUI',1,'Edit Mail Settings',1031514049);
INSERT INTO international VALUES (133,'WebGUI',4,'Editar configuraci�n de e-mail',1031510000);
INSERT INTO international VALUES (133,'WebGUI',5,'Modificar prefer�ncias de e-mail',1031510000);
INSERT INTO international VALUES (332,'WebGUI',2,'Postleitzahl\n(B�ro)',1031510000);
INSERT INTO international VALUES (116,'WebGUI',3,'Aanvinken om deze privileges aan alle sub pagina\'s te geven.',1031516049);
INSERT INTO international VALUES (134,'WebGUI',1,'Recover Password Message',1031514049);
INSERT INTO international VALUES (134,'WebGUI',4,'Mensage de Recuperar Password',1031510000);
INSERT INTO international VALUES (134,'WebGUI',5,'Mensagem de recupera��o de password',1031510000);
INSERT INTO international VALUES (135,'WebGUI',1,'SMTP Server',1031514049);
INSERT INTO international VALUES (135,'WebGUI',4,'Servidor SMTP',1031510000);
INSERT INTO international VALUES (135,'WebGUI',5,'Servidor SMTP',1031510000);
INSERT INTO international VALUES (326,'WebGUI',2,'Postleitzahl\n(privat)',1031510000);
INSERT INTO international VALUES (327,'WebGUI',2,'Land (privat)',1031510000);
INSERT INTO international VALUES (138,'WebGUI',1,'Yes',1031514049);
INSERT INTO international VALUES (138,'WebGUI',4,'Si',1031510000);
INSERT INTO international VALUES (138,'WebGUI',5,'Sim',1031510000);
INSERT INTO international VALUES (115,'WebGUI',3,'Iedereen kan bewerken?',1031516049);
INSERT INTO international VALUES (139,'WebGUI',1,'No',1031514049);
INSERT INTO international VALUES (139,'WebGUI',4,'No',1031510000);
INSERT INTO international VALUES (139,'WebGUI',5,'N�o',1031510000);
INSERT INTO international VALUES (329,'WebGUI',2,'Strasse (B�ro)',1031510000);
INSERT INTO international VALUES (328,'WebGUI',2,'Telefon\n(privat)',1031510000);
INSERT INTO international VALUES (114,'WebGUI',3,'Iedereen kan bekijken?',1031516049);
INSERT INTO international VALUES (140,'WebGUI',1,'Edit Miscellaneous Settings',1031514049);
INSERT INTO international VALUES (140,'WebGUI',4,'Editar configuraciones miscel�neas',1031510000);
INSERT INTO international VALUES (140,'WebGUI',5,'Modificar prefer�ncias mistas',1031510000);
INSERT INTO international VALUES (141,'WebGUI',1,'Not Found Page',1031514049);
INSERT INTO international VALUES (141,'WebGUI',4,'P�gina no encontrada',1031510000);
INSERT INTO international VALUES (141,'WebGUI',5,'P�gina n�o encontrada',1031510000);
INSERT INTO international VALUES (113,'WebGUI',3,'Groep kan bewerken?',1031516049);
INSERT INTO international VALUES (142,'WebGUI',1,'Session Timeout',1031514049);
INSERT INTO international VALUES (142,'WebGUI',4,'Timeout de sesi�n',1031510000);
INSERT INTO international VALUES (142,'WebGUI',5,'Timeout de sess�o',1031510000);
INSERT INTO international VALUES (325,'WebGUI',2,'Bundesland\n(privat)',1031510000);
INSERT INTO international VALUES (112,'WebGUI',3,'Groep kan bekijken?',1031516049);
INSERT INTO international VALUES (143,'WebGUI',1,'Manage Settings',1031514049);
INSERT INTO international VALUES (143,'WebGUI',4,'Configurar Opciones',1031510000);
INSERT INTO international VALUES (143,'WebGUI',5,'Organizar prefer�ncias',1031510000);
INSERT INTO international VALUES (111,'WebGUI',3,'Groep',1031516049);
INSERT INTO international VALUES (144,'WebGUI',1,'View statistics.',1031514049);
INSERT INTO international VALUES (144,'WebGUI',4,'Ver estad�sticas',1031510000);
INSERT INTO international VALUES (144,'WebGUI',5,'Ver estatisticas.',1031510000);
INSERT INTO international VALUES (145,'WebGUI',1,'WebGUI Build Version',1031514049);
INSERT INTO international VALUES (145,'WebGUI',4,'Versi�n de WebGUI',1031510000);
INSERT INTO international VALUES (145,'WebGUI',5,'WebGUI vers�o',1031510000);
INSERT INTO international VALUES (323,'WebGUI',2,'Strasse\n(privat)',1031510000);
INSERT INTO international VALUES (110,'WebGUI',3,'Gebruiker kan bewerken?',1031516049);
INSERT INTO international VALUES (146,'WebGUI',1,'Active Sessions',1031514049);
INSERT INTO international VALUES (146,'WebGUI',4,'Sesiones activas',1031510000);
INSERT INTO international VALUES (146,'WebGUI',5,'Sess�es activas',1031510000);
INSERT INTO international VALUES (147,'WebGUI',1,'Pages',1031514049);
INSERT INTO international VALUES (147,'WebGUI',4,'P�ginas',1031510000);
INSERT INTO international VALUES (147,'WebGUI',5,'P�ginas',1031510000);
INSERT INTO international VALUES (109,'WebGUI',3,'Eigenaar kan bekijken?',1031516049);
INSERT INTO international VALUES (148,'WebGUI',1,'Wobjects',1031514049);
INSERT INTO international VALUES (148,'WebGUI',4,'Wobjects',1031510000);
INSERT INTO international VALUES (148,'WebGUI',5,'Wobjects',1031510000);
INSERT INTO international VALUES (108,'WebGUI',3,'Eigenaar',1031516049);
INSERT INTO international VALUES (149,'WebGUI',1,'Users',1031514049);
INSERT INTO international VALUES (149,'WebGUI',4,'Usuarios',1031510000);
INSERT INTO international VALUES (149,'WebGUI',5,'Utilizadores',1031510000);
INSERT INTO international VALUES (107,'WebGUI',3,'Privileges',1031516049);
INSERT INTO international VALUES (151,'WebGUI',1,'Style Name',1031514049);
INSERT INTO international VALUES (151,'WebGUI',4,'Nombre del Estilo',1031510000);
INSERT INTO international VALUES (151,'WebGUI',5,'Nome do estilo',1031510000);
INSERT INTO international VALUES (505,'WebGUI',1,'Add a new template.',1031514049);
INSERT INTO international VALUES (504,'WebGUI',1,'Template',1031514049);
INSERT INTO international VALUES (503,'WebGUI',1,'Template ID',1031514049);
INSERT INTO international VALUES (502,'WebGUI',1,'Are you certain you wish to delete this template and set all pages using this template to the default template?',1031514049);
INSERT INTO international VALUES (154,'WebGUI',1,'Style Sheet',1031514049);
INSERT INTO international VALUES (154,'WebGUI',4,'Hoja de Estilo',1031510000);
INSERT INTO international VALUES (154,'WebGUI',5,'Estilo de p�gina',1031510000);
INSERT INTO international VALUES (322,'WebGUI',2,'Pager',1031510000);
INSERT INTO international VALUES (321,'WebGUI',2,'Mobiltelefon',1031510000);
INSERT INTO international VALUES (324,'WebGUI',2,'Ort (privat)',1031510000);
INSERT INTO international VALUES (320,'WebGUI',2,'<a href=\"\"\nhttp://messenger.yahoo.com/\"\">Yahoo! Messenger</a> Id',1031510000);
INSERT INTO international VALUES (105,'WebGUI',3,'Stijl',1031516049);
INSERT INTO international VALUES (106,'WebGUI',3,'Aanvinken om deze stijl in alle pagina\'s te gebruiiken.',1031516049);
INSERT INTO international VALUES (155,'WebGUI',1,'Are you certain you wish to delete this style and migrate all pages using this style to the \"Fail Safe\" style?',1031514049);
INSERT INTO international VALUES (155,'WebGUI',4,'\"Est� seguro de querer eliminar �ste estilo y migrar todas la p�ginas que lo usen al estilo \"\"Fail Safe\"\"?\"',1031510000);
INSERT INTO international VALUES (155,'WebGUI',5,'\"Tem a certeza que quer apagar este estilo e migrar todas as p�ginas para o estilo \"\"Fail Safe\"\"?\"',1031510000);
INSERT INTO international VALUES (156,'WebGUI',1,'Edit Style',1031514049);
INSERT INTO international VALUES (156,'WebGUI',4,'Editar Estilo',1031510000);
INSERT INTO international VALUES (156,'WebGUI',5,'Modificar estilo',1031510000);
INSERT INTO international VALUES (104,'WebGUI',3,'Pagina URL',1031516049);
INSERT INTO international VALUES (157,'WebGUI',1,'Styles',1031514049);
INSERT INTO international VALUES (157,'WebGUI',4,'Estilos',1031510000);
INSERT INTO international VALUES (157,'WebGUI',5,'Estilos',1031510000);
INSERT INTO international VALUES (103,'WebGUI',3,'Pagina specifiek',1031516049);
INSERT INTO international VALUES (158,'WebGUI',1,'Add a new style.',1031514049);
INSERT INTO international VALUES (158,'WebGUI',4,'Agregar nuevo Estilo',1031510000);
INSERT INTO international VALUES (158,'WebGUI',5,'Adicionar novo estilo.',1031510000);
INSERT INTO international VALUES (102,'WebGUI',3,'Bewerk pagina',1031516049);
INSERT INTO international VALUES (471,'WebGUI',10,'Rediger bruger profil felt',1031510000);
INSERT INTO international VALUES (159,'WebGUI',4,'Contribuciones Pendientes',1031510000);
INSERT INTO international VALUES (159,'WebGUI',5,'Log das mensagens',1031510000);
INSERT INTO international VALUES (160,'WebGUI',1,'Date Submitted',1031514049);
INSERT INTO international VALUES (160,'WebGUI',4,'Fecha Contribuci�n',1031510000);
INSERT INTO international VALUES (160,'WebGUI',5,'Data de submiss�o',1031510000);
INSERT INTO international VALUES (319,'WebGUI',2,'<a href=\"\"\nhttp://messenger.msn.com/\"\">MSN Messenger</a> Id',1031510000);
INSERT INTO international VALUES (161,'WebGUI',1,'Submitted By',1031514049);
INSERT INTO international VALUES (161,'WebGUI',4,'Contribuido por',1031510000);
INSERT INTO international VALUES (161,'WebGUI',5,'Submetido por',1031510000);
INSERT INTO international VALUES (100,'WebGUI',3,'Meta tags',1031516049);
INSERT INTO international VALUES (101,'WebGUI',3,'Weet u zeker dat u deze pagina wilt verwijderen en alle inhoud en objecten erachter?',1031516049);
INSERT INTO international VALUES (162,'WebGUI',1,'Are you certain that you wish to purge all the pages and wobjects in the trash?',1031514049);
INSERT INTO international VALUES (162,'WebGUI',4,'Est� seguro de querer eliminar todos los elementos de la papelera?',1031510000);
INSERT INTO international VALUES (162,'WebGUI',5,'Tem a certeza que quer limpar todas as p�ginas e wobjects para o caixote do lixo?',1031510000);
INSERT INTO international VALUES (99,'WebGUI',3,'Titel',1031516049);
INSERT INTO international VALUES (163,'WebGUI',1,'Add User',1031514049);
INSERT INTO international VALUES (163,'WebGUI',4,'Agregar usuario',1031510000);
INSERT INTO international VALUES (163,'WebGUI',5,'Adicionar utilizador',1031510000);
INSERT INTO international VALUES (95,'WebGUI',3,'Help index',1031516049);
INSERT INTO international VALUES (164,'WebGUI',1,'Authentication Method',1031514049);
INSERT INTO international VALUES (164,'WebGUI',4,'M�todo de Auntentificaci�n',1031510000);
INSERT INTO international VALUES (164,'WebGUI',5,'Metodo de autentica��o',1031510000);
INSERT INTO international VALUES (94,'WebGUI',3,'Zie ook',1031516049);
INSERT INTO international VALUES (165,'WebGUI',1,'LDAP URL',1031514049);
INSERT INTO international VALUES (165,'WebGUI',4,'LDAP URL',1031510000);
INSERT INTO international VALUES (165,'WebGUI',5,'LDAP URL',1031510000);
INSERT INTO international VALUES (317,'WebGUI',2,'<a href=\"\"\nhttp://www.icq.com\"\">ICQ</a> UIN',1031510000);
INSERT INTO international VALUES (93,'WebGUI',3,'Help',1031516049);
INSERT INTO international VALUES (166,'WebGUI',1,'Connect DN',1031514049);
INSERT INTO international VALUES (166,'WebGUI',4,'Connect DN',1031510000);
INSERT INTO international VALUES (166,'WebGUI',5,'Connectar DN',1031510000);
INSERT INTO international VALUES (91,'WebGUI',3,'Vorige pagina',1031516049);
INSERT INTO international VALUES (92,'WebGUI',3,'Volgende pagina',1031516049);
INSERT INTO international VALUES (167,'WebGUI',1,'Are you certain you want to delete this user? Be warned that all this user\'s information will be lost permanently if you choose to proceed.',1031514049);
INSERT INTO international VALUES (167,'WebGUI',4,'Est� seguro de querer eliminar �ste usuario? Tenga en cuenta que toda la informaci�n del usuario ser� eliminada permanentemente si procede.',1031510000);
INSERT INTO international VALUES (167,'WebGUI',5,'Tem a certeza que quer apagar este utilizador? Se o fizer perde todas as informa��es do utilizador.',1031510000);
INSERT INTO international VALUES (90,'WebGUI',3,'Voeg nieuwe groep toe.',1031516049);
INSERT INTO international VALUES (168,'WebGUI',1,'Edit User',1031514049);
INSERT INTO international VALUES (168,'WebGUI',4,'Editar Usuario',1031510000);
INSERT INTO international VALUES (168,'WebGUI',5,'Modificar utilizador',1031510000);
INSERT INTO international VALUES (89,'WebGUI',3,'Groepen',1031516049);
INSERT INTO international VALUES (169,'WebGUI',1,'Add a new user.',1031514049);
INSERT INTO international VALUES (169,'WebGUI',4,'Agregar nuevo usuario',1031510000);
INSERT INTO international VALUES (169,'WebGUI',5,'Adicionar utilizador.',1031510000);
INSERT INTO international VALUES (170,'WebGUI',1,'search',1031514049);
INSERT INTO international VALUES (170,'WebGUI',4,'buscar',1031510000);
INSERT INTO international VALUES (170,'WebGUI',5,'procurar',1031510000);
INSERT INTO international VALUES (88,'WebGUI',3,'Gebruikers in groep',1031516049);
INSERT INTO international VALUES (171,'WebGUI',1,'rich edit',1031514049);
INSERT INTO international VALUES (171,'WebGUI',4,'rich edit',1031510000);
INSERT INTO international VALUES (171,'WebGUI',5,'rich edit',1031510000);
INSERT INTO international VALUES (318,'WebGUI',2,'<a href=\"\"\nhttp://www.aol.com/aim/homenew.adp\"\">AIM</a> Id',1031510000);
INSERT INTO international VALUES (87,'WebGUI',3,'Bewerk groep',1031516049);
INSERT INTO international VALUES (174,'WebGUI',1,'Display the title?',1031514049);
INSERT INTO international VALUES (174,'WebGUI',4,'Mostrar el t�tulo?',1031510000);
INSERT INTO international VALUES (174,'WebGUI',5,'Mostrar o titulo?',1031510000);
INSERT INTO international VALUES (175,'WebGUI',1,'Process macros?',1031514049);
INSERT INTO international VALUES (175,'WebGUI',4,'Procesar macros?',1031510000);
INSERT INTO international VALUES (175,'WebGUI',5,'Processar macros?',1031510000);
INSERT INTO international VALUES (228,'WebGUI',1,'Editing Message...',1031514049);
INSERT INTO international VALUES (228,'WebGUI',4,'Editar Mensage...',1031510000);
INSERT INTO international VALUES (228,'WebGUI',5,'Modificando mensagem...',1031510000);
INSERT INTO international VALUES (229,'WebGUI',1,'Subject',1031514049);
INSERT INTO international VALUES (229,'WebGUI',4,'Asunto',1031510000);
INSERT INTO international VALUES (229,'WebGUI',5,'Assunto',1031510000);
INSERT INTO international VALUES (230,'WebGUI',1,'Message',1031514049);
INSERT INTO international VALUES (230,'WebGUI',4,'Mensage',1031510000);
INSERT INTO international VALUES (230,'WebGUI',5,'Mensagem',1031510000);
INSERT INTO international VALUES (231,'WebGUI',1,'Posting New Message...',1031514049);
INSERT INTO international VALUES (231,'WebGUI',4,'Mandando Nuevo Mensage ...',1031510000);
INSERT INTO international VALUES (231,'WebGUI',5,'Colocando nova mensagem...',1031510000);
INSERT INTO international VALUES (232,'WebGUI',1,'no subject',1031514049);
INSERT INTO international VALUES (232,'WebGUI',4,'sin t�tulo',1031510000);
INSERT INTO international VALUES (232,'WebGUI',5,'sem assunto',1031510000);
INSERT INTO international VALUES (86,'WebGUI',3,'Weet u zeker dat u deze groep wilt verwijderen? Denk er aan dat een groep verwijderen permanent en alle privileges geassocieerd met de groep verwijdert worden.',1031516049);
INSERT INTO international VALUES (233,'WebGUI',1,'(eom)',1031514049);
INSERT INTO international VALUES (233,'WebGUI',4,'(eom)',1031510000);
INSERT INTO international VALUES (233,'WebGUI',5,'(eom)',1031510000);
INSERT INTO international VALUES (85,'WebGUI',3,'Beschrijving',1031516049);
INSERT INTO international VALUES (234,'WebGUI',1,'Posting Reply...',1031514049);
INSERT INTO international VALUES (234,'WebGUI',4,'Respondiendo...',1031510000);
INSERT INTO international VALUES (234,'WebGUI',5,'Respondendo...',1031510000);
INSERT INTO international VALUES (315,'WebGUI',2,'Zweiter\nVorname',1031510000);
INSERT INTO international VALUES (314,'WebGUI',2,'Vorname',1031510000);
INSERT INTO international VALUES (316,'WebGUI',2,'Nachname',1031510000);
INSERT INTO international VALUES (237,'WebGUI',1,'Subject:',1031514049);
INSERT INTO international VALUES (237,'WebGUI',4,'Asunto:',1031510000);
INSERT INTO international VALUES (237,'WebGUI',5,'Assunto:',1031510000);
INSERT INTO international VALUES (84,'WebGUI',3,'Groep naam',1031516049);
INSERT INTO international VALUES (238,'WebGUI',1,'Author:',1031514049);
INSERT INTO international VALUES (238,'WebGUI',4,'Autor:',1031510000);
INSERT INTO international VALUES (238,'WebGUI',5,'Autor:',1031510000);
INSERT INTO international VALUES (239,'WebGUI',1,'Date:',1031514049);
INSERT INTO international VALUES (239,'WebGUI',4,'Fecha:',1031510000);
INSERT INTO international VALUES (239,'WebGUI',5,'Data:',1031510000);
INSERT INTO international VALUES (313,'WebGUI',2,'Zus�tzliche\nInformationen anzeigen?',1031510000);
INSERT INTO international VALUES (82,'WebGUI',3,'Administratieve functies...',1031516049);
INSERT INTO international VALUES (240,'WebGUI',1,'Message ID:',1031514049);
INSERT INTO international VALUES (240,'WebGUI',4,'ID del mensage:',1031510000);
INSERT INTO international VALUES (240,'WebGUI',5,'ID da mensagem:',1031510000);
INSERT INTO international VALUES (244,'WebGUI',1,'Author',1031514049);
INSERT INTO international VALUES (244,'WebGUI',4,'Autor',1031510000);
INSERT INTO international VALUES (244,'WebGUI',5,'Autor',1031510000);
INSERT INTO international VALUES (81,'WebGUI',3,'Account is aangepast!',1031516049);
INSERT INTO international VALUES (245,'WebGUI',1,'Date',1031514049);
INSERT INTO international VALUES (245,'WebGUI',4,'Fecha',1031510000);
INSERT INTO international VALUES (245,'WebGUI',5,'Data',1031510000);
INSERT INTO international VALUES (304,'WebGUI',1,'Language',1031514049);
INSERT INTO international VALUES (304,'WebGUI',4,'Idioma',1031510000);
INSERT INTO international VALUES (304,'WebGUI',5,'Lingua',1031510000);
INSERT INTO international VALUES (312,'WebGUI',2,'Gesch�ftsadresse\nanzeigen?',1031510000);
INSERT INTO international VALUES (80,'WebGUI',3,'Account is aangemaakt!',1031516049);
INSERT INTO international VALUES (306,'WebGUI',1,'Username Binding',1031514049);
INSERT INTO international VALUES (306,'WebGUI',5,'Liga��o ao username',1031510000);
INSERT INTO international VALUES (307,'WebGUI',1,'Use default meta tags?',1031514049);
INSERT INTO international VALUES (307,'WebGUI',5,'Usar as meta tags de defeito?',1031510000);
INSERT INTO international VALUES (79,'WebGUI',3,'Kan niet verbinden met LDAP server.',1031516049);
INSERT INTO international VALUES (308,'WebGUI',1,'Edit Profile Settings',1031514049);
INSERT INTO international VALUES (308,'WebGUI',5,'Modificar as prefer�ncias do perfil',1031510000);
INSERT INTO international VALUES (309,'WebGUI',1,'Allow real name?',1031514049);
INSERT INTO international VALUES (309,'WebGUI',5,'Permitir o nome real?',1031510000);
INSERT INTO international VALUES (311,'WebGUI',2,'Privatadresse\nanzeigen?',1031510000);
INSERT INTO international VALUES (78,'WebGUI',3,'De wachtwoorden waren niet gelijk. Probeer opnieuw.',1031516049);
INSERT INTO international VALUES (310,'WebGUI',1,'Allow extra contact information?',1031514049);
INSERT INTO international VALUES (310,'WebGUI',5,'Permitir informa��o extra de contacto?',1031510000);
INSERT INTO international VALUES (311,'WebGUI',1,'Allow home information?',1031514049);
INSERT INTO international VALUES (311,'WebGUI',5,'Permitir informa��o de casa?',1031510000);
INSERT INTO international VALUES (309,'WebGUI',2,'Name anzeigen?',1031510000);
INSERT INTO international VALUES (312,'WebGUI',1,'Allow business information?',1031514049);
INSERT INTO international VALUES (312,'WebGUI',5,'Permitir informa��o do emprego?',1031510000);
INSERT INTO international VALUES (313,'WebGUI',1,'Allow miscellaneous information?',1031514049);
INSERT INTO international VALUES (313,'WebGUI',5,'Permitir informa�ao mista?',1031510000);
INSERT INTO international VALUES (314,'WebGUI',1,'First Name',1031514049);
INSERT INTO international VALUES (314,'WebGUI',5,'Nome',1031510000);
INSERT INTO international VALUES (77,'WebGUI',3,'Deze account naam wordt al gebruikt door een andere gebruiker van dit systeem. Probeer een andere naam. We hebben de volgende suggesties:',1031516049);
INSERT INTO international VALUES (315,'WebGUI',1,'Middle Name',1031514049);
INSERT INTO international VALUES (315,'WebGUI',5,'segundo(s) nome(s)',1031510000);
INSERT INTO international VALUES (316,'WebGUI',1,'Last Name',1031514049);
INSERT INTO international VALUES (316,'WebGUI',5,'Apelido',1031510000);
INSERT INTO international VALUES (76,'WebGUI',3,'Dat email adresis niet in onze database aanwezig.',1031516049);
INSERT INTO international VALUES (317,'WebGUI',1,'<a href=\"http://www.icq.com\">ICQ</a> UIN',1031514049);
INSERT INTO international VALUES (317,'WebGUI',5,'\"<a href=\"\"http://www.icq.com\"\">ICQ</a> UIN\"',1031510000);
INSERT INTO international VALUES (75,'WebGUI',3,'Uw account informatie is naar uw email adres verzonden.',1031516049);
INSERT INTO international VALUES (318,'WebGUI',1,'<a href=\"http://www.aol.com/aim/homenew.adp\">AIM</a> Id',1031514049);
INSERT INTO international VALUES (318,'WebGUI',5,'\"<a href=\"\"http://www.aol.com/aim/homenew.adp\"\">AIM</a> Id\"',1031510000);
INSERT INTO international VALUES (310,'WebGUI',2,'Kontaktinformationen anzeigen?',1031510000);
INSERT INTO international VALUES (566,'WebGUI',6,'Redigera Timeout',1031510000);
INSERT INTO international VALUES (74,'WebGUI',3,'Account informatie',1031516049);
INSERT INTO international VALUES (319,'WebGUI',1,'<a href=\"http://messenger.msn.com/\">MSN Messenger</a> Id',1031514049);
INSERT INTO international VALUES (319,'WebGUI',5,'\"<a href=\"\"http://messenger.msn.com/\"\">MSN Messenger</a> Id\"',1031510000);
INSERT INTO international VALUES (72,'WebGUI',3,'Terugvinden',1031516049);
INSERT INTO international VALUES (73,'WebGUI',3,'Log in.',1031516049);
INSERT INTO international VALUES (320,'WebGUI',1,'<a href=\"http://messenger.yahoo.com/\">Yahoo! Messenger</a> Id',1031514049);
INSERT INTO international VALUES (320,'WebGUI',5,'\"<a href=\"\"http://messenger.yahoo.com/\"\">Yahoo! Messenger</a> Id\"',1031510000);
INSERT INTO international VALUES (321,'WebGUI',1,'Cell Phone',1031514049);
INSERT INTO international VALUES (321,'WebGUI',5,'Telem�vel',1031510000);
INSERT INTO international VALUES (71,'WebGUI',3,'Wachtwoord terugvinden',1031516049);
INSERT INTO international VALUES (322,'WebGUI',1,'Pager',1031514049);
INSERT INTO international VALUES (322,'WebGUI',5,'Pager',1031510000);
INSERT INTO international VALUES (70,'WebGUI',3,'Fout',1031516049);
INSERT INTO international VALUES (323,'WebGUI',1,'Home Address',1031514049);
INSERT INTO international VALUES (323,'WebGUI',5,'Morada (de casa)',1031510000);
INSERT INTO international VALUES (307,'WebGUI',2,'Standard Meta\nTags benutzen?',1031510000);
INSERT INTO international VALUES (324,'WebGUI',1,'Home City',1031514049);
INSERT INTO international VALUES (324,'WebGUI',5,'Cidade (de casa)',1031510000);
INSERT INTO international VALUES (308,'WebGUI',2,'Profil\nbearbeiten',1031510000);
INSERT INTO international VALUES (325,'WebGUI',1,'Home State',1031514049);
INSERT INTO international VALUES (325,'WebGUI',5,'Concelho (de casa)',1031510000);
INSERT INTO international VALUES (69,'WebGUI',3,'Vraag uw systeembeheerder om assistentie.',1031516049);
INSERT INTO international VALUES (326,'WebGUI',1,'Home Zip Code',1031514049);
INSERT INTO international VALUES (326,'WebGUI',5,'C�digo postal (de casa)',1031510000);
INSERT INTO international VALUES (327,'WebGUI',1,'Home Country',1031514049);
INSERT INTO international VALUES (327,'WebGUI',5,'Pa�s (de casa)',1031510000);
INSERT INTO international VALUES (328,'WebGUI',1,'Home Phone',1031514049);
INSERT INTO international VALUES (328,'WebGUI',5,'Telefone (de casa)',1031510000);
INSERT INTO international VALUES (329,'WebGUI',1,'Work Address',1031514049);
INSERT INTO international VALUES (329,'WebGUI',5,'Morada (do emprego)',1031510000);
INSERT INTO international VALUES (306,'WebGUI',2,'Benutze LDAP\nBenutzername',1031510000);
INSERT INTO international VALUES (330,'WebGUI',1,'Work City',1031514049);
INSERT INTO international VALUES (330,'WebGUI',5,'Cidade (do emprego)',1031510000);
INSERT INTO international VALUES (68,'WebGUI',3,'De account informatie is niet geldig. Het account bestaat niet of de gebruikersnaam/wachtwoord was fout.',1031516049);
INSERT INTO international VALUES (331,'WebGUI',1,'Work State',1031514049);
INSERT INTO international VALUES (331,'WebGUI',5,'Concelho (do emprego)',1031510000);
INSERT INTO international VALUES (239,'WebGUI',2,'Datum:',1031510000);
INSERT INTO international VALUES (332,'WebGUI',1,'Work Zip Code',1031514049);
INSERT INTO international VALUES (332,'WebGUI',5,'C�digo postal (do emprego)',1031510000);
INSERT INTO international VALUES (67,'WebGUI',3,'Cre�er een nieuw account',1031516049);
INSERT INTO international VALUES (333,'WebGUI',1,'Work Country',1031514049);
INSERT INTO international VALUES (333,'WebGUI',5,'Pa�s (do emprego)',1031510000);
INSERT INTO international VALUES (334,'WebGUI',1,'Work Phone',1031514049);
INSERT INTO international VALUES (334,'WebGUI',5,'Telefone (do emprego)',1031510000);
INSERT INTO international VALUES (66,'WebGUI',3,'Log in',1031516049);
INSERT INTO international VALUES (335,'WebGUI',1,'Gender',1031514049);
INSERT INTO international VALUES (335,'WebGUI',5,'Sexo',1031510000);
INSERT INTO international VALUES (244,'WebGUI',2,'Autor',1031510000);
INSERT INTO international VALUES (336,'WebGUI',1,'Birth Date',1031514049);
INSERT INTO international VALUES (336,'WebGUI',5,'Data de nascimento',1031510000);
INSERT INTO international VALUES (65,'WebGUI',3,'Deaktiveer mijn account voorgoed.',1031516049);
INSERT INTO international VALUES (337,'WebGUI',1,'Homepage URL',1031514049);
INSERT INTO international VALUES (337,'WebGUI',5,'Endere�o da Homepage',1031510000);
INSERT INTO international VALUES (338,'WebGUI',1,'Edit Profile',1031514049);
INSERT INTO international VALUES (338,'WebGUI',5,'Modificar perfil',1031510000);
INSERT INTO international VALUES (64,'WebGUI',3,'Log uit.',1031516049);
INSERT INTO international VALUES (339,'WebGUI',1,'Male',1031514049);
INSERT INTO international VALUES (339,'WebGUI',5,'Masculino',1031510000);
INSERT INTO international VALUES (240,'WebGUI',2,'Beitrags ID:',1031510000);
INSERT INTO international VALUES (340,'WebGUI',1,'Female',1031514049);
INSERT INTO international VALUES (340,'WebGUI',5,'Feminino',1031510000);
INSERT INTO international VALUES (63,'WebGUI',3,'Zet beheermode aan',1031516049);
INSERT INTO international VALUES (341,'WebGUI',1,'Edit profile.',1031514049);
INSERT INTO international VALUES (341,'WebGUI',5,'Modificar o perfil.',1031510000);
INSERT INTO international VALUES (245,'WebGUI',2,'Datum',1031510000);
INSERT INTO international VALUES (62,'WebGUI',3,'Bewaar',1031516049);
INSERT INTO international VALUES (342,'WebGUI',1,'Edit account information.',1031514049);
INSERT INTO international VALUES (342,'WebGUI',5,'Modificar as informa��es da conta.',1031510000);
INSERT INTO international VALUES (304,'WebGUI',2,'Sprache',1031510000);
INSERT INTO international VALUES (343,'WebGUI',1,'View profile.',1031514049);
INSERT INTO international VALUES (343,'WebGUI',5,'Ver perfil.',1031510000);
INSERT INTO international VALUES (351,'WebGUI',1,'Message',1031514049);
INSERT INTO international VALUES (468,'WebGUI',10,'Rediger bruger profil kategori',1031510000);
INSERT INTO international VALUES (61,'WebGUI',3,'Account informatie bijwerken',1031516049);
INSERT INTO international VALUES (345,'WebGUI',1,'Not A Member',1031514049);
INSERT INTO international VALUES (345,'WebGUI',5,'N�o � membro',1031510000);
INSERT INTO international VALUES (233,'WebGUI',2,'(eom)',1031510000);
INSERT INTO international VALUES (234,'WebGUI',2,'Antworten...',1031510000);
INSERT INTO international VALUES (346,'WebGUI',1,'This user is no longer a member of our site. We have no further information about this user.',1031514049);
INSERT INTO international VALUES (346,'WebGUI',5,'Esse utilizador j� n�o � membro do site. N�o existe mais informa��o.',1031510000);
INSERT INTO international VALUES (237,'WebGUI',2,'Betreff:',1031510000);
INSERT INTO international VALUES (347,'WebGUI',1,'View Profile For',1031514049);
INSERT INTO international VALUES (347,'WebGUI',5,'Ver o perfil de',1031510000);
INSERT INTO international VALUES (60,'WebGUI',3,'Weet u zeker dat u uw account wilt deaktiveren? Als u doorgaat gaat alle account informatie voorgoed verloren.',1031516049);
INSERT INTO international VALUES (348,'WebGUI',1,'Name',1031514049);
INSERT INTO international VALUES (348,'WebGUI',5,'Nome',1031510000);
INSERT INTO international VALUES (349,'WebGUI',1,'Latest version available',1031514049);
INSERT INTO international VALUES (349,'WebGUI',5,'Ultima vers�o dispon�vel',1031510000);
INSERT INTO international VALUES (59,'WebGUI',3,'Ik ben mijn wachtwoord vergeten.',1031516049);
INSERT INTO international VALUES (350,'WebGUI',1,'Completed',1031514049);
INSERT INTO international VALUES (350,'WebGUI',5,'Completo',1031510000);
INSERT INTO international VALUES (351,'WebGUI',5,'Entrada no log de mensagens',1031510000);
INSERT INTO international VALUES (58,'WebGUI',3,'Ik heb al een account.',1031516049);
INSERT INTO international VALUES (352,'WebGUI',1,'Date Of Entry',1031514049);
INSERT INTO international VALUES (352,'WebGUI',5,'Data de entrada',1031510000);
INSERT INTO international VALUES (471,'WebGUI',6,'Redigera anv�ndarprofils attribut',1032859851);
INSERT INTO international VALUES (353,'WebGUI',5,'Actualmente n�o tem entradas no log de mensagens.',1031510000);
INSERT INTO international VALUES (471,'WebGUI',1,'Edit User Profile Field',1031514049);
INSERT INTO international VALUES (354,'WebGUI',5,'Ver o log das mensagens.',1031510000);
INSERT INTO international VALUES (57,'WebGUI',3,'Dit is alleen nodig als er functies gebruikt worden die email nodig hebben.',1031516049);
INSERT INTO international VALUES (355,'WebGUI',1,'Default',1031514049);
INSERT INTO international VALUES (355,'WebGUI',5,'Por defeito',1031510000);
INSERT INTO international VALUES (356,'WebGUI',1,'Template',1031514049);
INSERT INTO international VALUES (357,'WebGUI',1,'News',1031514049);
INSERT INTO international VALUES (358,'WebGUI',1,'Left Column',1031514049);
INSERT INTO international VALUES (359,'WebGUI',1,'Right Column',1031514049);
INSERT INTO international VALUES (360,'WebGUI',1,'One Over Three',1031514049);
INSERT INTO international VALUES (361,'WebGUI',1,'Three Over One',1031514049);
INSERT INTO international VALUES (362,'WebGUI',1,'SideBySide',1031514049);
INSERT INTO international VALUES (363,'WebGUI',1,'Page Template Position',1034736999);
INSERT INTO international VALUES (364,'WebGUI',1,'Search',1031514049);
INSERT INTO international VALUES (365,'WebGUI',1,'Search results...',1031514049);
INSERT INTO international VALUES (366,'WebGUI',1,'No  pages were found with content that matched your query.',1031514049);
INSERT INTO international VALUES (368,'WebGUI',1,'Add a new group to this user.',1031514049);
INSERT INTO international VALUES (369,'WebGUI',1,'Expire Date',1031514049);
INSERT INTO international VALUES (370,'WebGUI',1,'Edit Grouping',1031514049);
INSERT INTO international VALUES (371,'WebGUI',1,'Add Grouping',1031514049);
INSERT INTO international VALUES (372,'WebGUI',1,'Edit User\'s Groups',1031514049);
INSERT INTO international VALUES (374,'WebGUI',1,'Manage packages.',1031514049);
INSERT INTO international VALUES (375,'WebGUI',1,'Select Package To Deploy',1031514049);
INSERT INTO international VALUES (376,'WebGUI',1,'Package',1031514049);
INSERT INTO international VALUES (377,'WebGUI',1,'No packages have been defined by your package manager(s) or administrator(s).',1031514049);
INSERT INTO international VALUES (11,'Poll',1,'Vote!',1031514049);
INSERT INTO international VALUES (31,'USS',1,'Content',1031514049);
INSERT INTO international VALUES (32,'USS',1,'Image',1031514049);
INSERT INTO international VALUES (33,'USS',1,'Attachment',1031514049);
INSERT INTO international VALUES (34,'USS',1,'Convert Carriage Returns',1031514049);
INSERT INTO international VALUES (35,'USS',1,'Title',1031514049);
INSERT INTO international VALUES (21,'EventsCalendar',1,'Proceed to add event?',1031514049);
INSERT INTO international VALUES (378,'WebGUI',1,'User ID',1031514049);
INSERT INTO international VALUES (379,'WebGUI',1,'Group ID',1031514049);
INSERT INTO international VALUES (380,'WebGUI',1,'Style ID',1031514049);
INSERT INTO international VALUES (381,'WebGUI',1,'WebGUI received a malformed request and was unable to continue. Proprietary characters being passed through a form typically cause this. Please feel free to hit your back button and try again.',1031514049);
INSERT INTO international VALUES (1,'FileManager',1,'Download Manager',1031514049);
INSERT INTO international VALUES (1,'EventsCalendar',6,'Forts�tt med att l�gga till en h�ndelse?',1031510000);
INSERT INTO international VALUES (3,'FileManager',1,'Proceed to add file?',1031514049);
INSERT INTO international VALUES (367,'WebGUI',6,'B�st f�re',1031510000);
INSERT INTO international VALUES (5,'FileManager',1,'File Title',1031514049);
INSERT INTO international VALUES (6,'FileManager',1,'Download File',1031514049);
INSERT INTO international VALUES (7,'FileManager',1,'Group to Download',1031514049);
INSERT INTO international VALUES (8,'FileManager',1,'Brief Synopsis',1031514049);
INSERT INTO international VALUES (9,'FileManager',1,'Edit Download Manager',1031514049);
INSERT INTO international VALUES (10,'FileManager',1,'Edit Download',1031514049);
INSERT INTO international VALUES (11,'FileManager',1,'Add a new download.',1031514049);
INSERT INTO international VALUES (12,'FileManager',1,'Are you certain that you wish to delete this download?',1031514049);
INSERT INTO international VALUES (22,'FileManager',1,'Proceed to add download?',1031514049);
INSERT INTO international VALUES (14,'FileManager',1,'File',1031514049);
INSERT INTO international VALUES (15,'FileManager',1,'Description',1031514049);
INSERT INTO international VALUES (16,'FileManager',1,'Date Uploaded',1031514049);
INSERT INTO international VALUES (15,'Article',1,'Right',1031514049);
INSERT INTO international VALUES (16,'Article',1,'Left',1031514049);
INSERT INTO international VALUES (17,'Article',1,'Center',1031514049);
INSERT INTO international VALUES (37,'USS',1,'Delete',1031514049);
INSERT INTO international VALUES (13,'SQLReport',1,'Convert carriage returns?',1031514049);
INSERT INTO international VALUES (17,'FileManager',1,'Alternate Version #1',1031514049);
INSERT INTO international VALUES (18,'FileManager',1,'Alternate Version #2',1031514049);
INSERT INTO international VALUES (19,'FileManager',1,'You have no files available for download.',1031514049);
INSERT INTO international VALUES (14,'EventsCalendar',1,'Start Date',1031514049);
INSERT INTO international VALUES (15,'EventsCalendar',1,'End Date',1031514049);
INSERT INTO international VALUES (20,'FileManager',1,'Paginate After',1031514049);
INSERT INTO international VALUES (14,'SQLReport',1,'Paginate After',1031514049);
INSERT INTO international VALUES (16,'EventsCalendar',1,'Calendar Layout',1031514049);
INSERT INTO international VALUES (17,'EventsCalendar',1,'List',1031514049);
INSERT INTO international VALUES (18,'EventsCalendar',1,'Calendar Month',1031514049);
INSERT INTO international VALUES (19,'EventsCalendar',1,'Paginate After',1031514049);
INSERT INTO international VALUES (383,'WebGUI',1,'Name',1031514049);
INSERT INTO international VALUES (384,'WebGUI',1,'File',1031514049);
INSERT INTO international VALUES (385,'WebGUI',1,'Parameters',1031514049);
INSERT INTO international VALUES (386,'WebGUI',1,'Edit Image',1031514049);
INSERT INTO international VALUES (387,'WebGUI',1,'Uploaded By',1031514049);
INSERT INTO international VALUES (388,'WebGUI',1,'Upload Date',1031514049);
INSERT INTO international VALUES (389,'WebGUI',1,'Image Id',1031514049);
INSERT INTO international VALUES (390,'WebGUI',1,'Displaying Image...',1031514049);
INSERT INTO international VALUES (391,'WebGUI',1,'Delete attached file.',1031514049);
INSERT INTO international VALUES (392,'WebGUI',1,'Are you certain that you wish to delete this image?',1031514049);
INSERT INTO international VALUES (393,'WebGUI',1,'Manage Images',1031514049);
INSERT INTO international VALUES (394,'WebGUI',1,'Manage images.',1031514049);
INSERT INTO international VALUES (395,'WebGUI',1,'Add a new image.',1031514049);
INSERT INTO international VALUES (396,'WebGUI',1,'View Image',1031514049);
INSERT INTO international VALUES (397,'WebGUI',1,'Back to image list.',1031514049);
INSERT INTO international VALUES (398,'WebGUI',1,'Document Type Declaration',1031514049);
INSERT INTO international VALUES (399,'WebGUI',1,'Validate this page.',1031514049);
INSERT INTO international VALUES (400,'WebGUI',1,'Prevent Proxy Caching',1031514049);
INSERT INTO international VALUES (401,'WebGUI',1,'Are you certain you wish to delete this message and all messages under it in this thread?',1031514049);
INSERT INTO international VALUES (565,'WebGUI',1,'Who can moderate?',1031514049);
INSERT INTO international VALUES (22,'MessageBoard',1,'Delete Message',1031514049);
INSERT INTO international VALUES (402,'WebGUI',1,'The message you requested does not exist.',1031514049);
INSERT INTO international VALUES (403,'WebGUI',1,'Prefer not to say.',1031514049);
INSERT INTO international VALUES (405,'WebGUI',1,'Last Page',1031514049);
INSERT INTO international VALUES (406,'WebGUI',1,'Thumbnail Size',1031514049);
INSERT INTO international VALUES (21,'FileManager',1,'Display thumbnails?',1031514049);
INSERT INTO international VALUES (407,'WebGUI',1,'Click here to register.',1031514049);
INSERT INTO international VALUES (15,'SQLReport',1,'Preprocess macros on query?',1031514049);
INSERT INTO international VALUES (16,'SQLReport',1,'Debug?',1031514049);
INSERT INTO international VALUES (17,'SQLReport',1,'<b>Debug:</b> Query:',1031514049);
INSERT INTO international VALUES (18,'SQLReport',1,'There were no results for this query.',1031514049);
INSERT INTO international VALUES (231,'WebGUI',2,'Neuen Beitrag\nschreiben...',1031510000);
INSERT INTO international VALUES (238,'WebGUI',2,'Autor:',1031510000);
INSERT INTO international VALUES (230,'WebGUI',2,'Beitrag',1031510000);
INSERT INTO international VALUES (229,'WebGUI',2,'Betreff',1031510000);
INSERT INTO international VALUES (232,'WebGUI',2,'kein Betreff',1031510000);
INSERT INTO international VALUES (175,'WebGUI',2,'Makros\nausf�hren?',1031510000);
INSERT INTO international VALUES (228,'WebGUI',2,'Beitr�ge\nbearbeiten ...',1031510000);
INSERT INTO international VALUES (169,'WebGUI',2,'Neuen Benutzer\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (171,'WebGUI',2,'Bearbeiten mit\nAttributen',1031510000);
INSERT INTO international VALUES (170,'WebGUI',2,'suchen',1031510000);
INSERT INTO international VALUES (174,'WebGUI',2,'Titel\nanzeigen?',1031510000);
INSERT INTO international VALUES (168,'WebGUI',2,'Benutzer\nbearbeiten',1031510000);
INSERT INTO international VALUES (167,'WebGUI',2,'Sind Sie sicher,\ndass sie diesen Benutzer l�schen m�chten? Die Benutzerinformation geht\ndamit endg�ltig verloren!',1031510000);
INSERT INTO international VALUES (166,'WebGUI',2,'Connect DN',1031510000);
INSERT INTO international VALUES (165,'WebGUI',2,'LDAP URL',1031510000);
INSERT INTO international VALUES (164,'WebGUI',2,'Authentifizierungsmethode',1031510000);
INSERT INTO international VALUES (163,'WebGUI',2,'Benutzer\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (162,'WebGUI',2,'Sind Sie sicher,\ndass Sie alle Seiten und Widgets im M�lleimer l�schen m�chten?',1031510000);
INSERT INTO international VALUES (160,'WebGUI',2,'Erstellungsdatum',1031510000);
INSERT INTO international VALUES (161,'WebGUI',2,'Erstellt von',1031510000);
INSERT INTO international VALUES (158,'WebGUI',2,'Neuen Stil\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (506,'WebGUI',1,'Manage Templates',1031514049);
INSERT INTO international VALUES (159,'WebGUI',2,'Ausstehende\nBeitr�ge',1031510000);
INSERT INTO international VALUES (157,'WebGUI',2,'Stile',1031510000);
INSERT INTO international VALUES (156,'WebGUI',2,'Stil\nbearbeiten',1031510000);
INSERT INTO international VALUES (155,'WebGUI',2,'Sind Sie sicher,\ndass Sie diesen Stil l�schen und alle Seiten die diesen Stil benutzen in\nden Stil \"Fail Safe\" �berf�hren wollen?',1031510000);
INSERT INTO international VALUES (154,'WebGUI',2,'Style Sheet',1031510000);
INSERT INTO international VALUES (151,'WebGUI',2,'Stil Name',1031510000);
INSERT INTO international VALUES (149,'WebGUI',2,'Benutzer',1031510000);
INSERT INTO international VALUES (146,'WebGUI',2,'Aktive\nSitzungen',1031510000);
INSERT INTO international VALUES (148,'WebGUI',2,'Widgets',1031510000);
INSERT INTO international VALUES (147,'WebGUI',2,'sichtbare\nSeiten',1031510000);
INSERT INTO international VALUES (145,'WebGUI',2,'WebGUI Build\nVersion',1031510000);
INSERT INTO international VALUES (140,'WebGUI',2,'Sonstige\nEinstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (144,'WebGUI',2,'Auswertungen\nanschauen',1031510000);
INSERT INTO international VALUES (141,'WebGUI',2,'\"Nicht gefunden\nSeite\"',1031510000);
INSERT INTO international VALUES (142,'WebGUI',2,'Sitzungs\nZeit�berschreitung',1031510000);
INSERT INTO international VALUES (143,'WebGUI',2,'Einstellungen\nverwalten',1031510000);
INSERT INTO international VALUES (139,'WebGUI',2,'Nein',1031510000);
INSERT INTO international VALUES (138,'WebGUI',2,'Ja',1031510000);
INSERT INTO international VALUES (135,'WebGUI',2,'SMTP Server',1031510000);
INSERT INTO international VALUES (134,'WebGUI',2,'Passwortmeldung\nwiederherstellen',1031510000);
INSERT INTO international VALUES (133,'WebGUI',2,'Maileinstellungen\nbearbeiten',1031510000);
INSERT INTO international VALUES (130,'WebGUI',2,'Maximale\nDateigr��e f�r Anh�nge',1031510000);
INSERT INTO international VALUES (125,'WebGUI',2,'Firmenname',1031510000);
INSERT INTO international VALUES (126,'WebGUI',2,'Emailadresse der\nFirma',1031510000);
INSERT INTO international VALUES (127,'WebGUI',2,'Webseite der\nFirma',1031510000);
INSERT INTO international VALUES (124,'WebGUI',2,'Firmeninformationen bearbeiten',1031510000);
INSERT INTO international VALUES (122,'WebGUI',2,'LDAP\nIdentit�ts-Name',1031510000);
INSERT INTO international VALUES (123,'WebGUI',2,'LDAP Passwort\nName',1031510000);
INSERT INTO international VALUES (121,'WebGUI',2,'LDAP Identit�t\n(Standard)',1031510000);
INSERT INTO international VALUES (119,'WebGUI',2,'Authentifizierungsmethode (Standard)',1031510000);
INSERT INTO international VALUES (120,'WebGUI',2,'LDAP URL\n(Standard)',1031510000);
INSERT INTO international VALUES (117,'WebGUI',2,'Authentifizierungseinstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (118,'WebGUI',2,'anonyme\nRegistrierung',1031510000);
INSERT INTO international VALUES (115,'WebGUI',2,'Kann jeder\nbearbeiten?',1031510000);
INSERT INTO international VALUES (116,'WebGUI',2,'Rechte an alle\nnachfolgenden Seiten weitergeben.',1031510000);
INSERT INTO international VALUES (114,'WebGUI',2,'Kann jeder\nanschauen?',1031510000);
INSERT INTO international VALUES (111,'WebGUI',2,'Gruppe',1031510000);
INSERT INTO international VALUES (113,'WebGUI',2,'Gruppe kann\nbearbeiten?',1031510000);
INSERT INTO international VALUES (110,'WebGUI',2,'Besitzer kann\nbearbeiten?',1031510000);
INSERT INTO international VALUES (112,'WebGUI',2,'Gruppe kann\nanschauen?',1031510000);
INSERT INTO international VALUES (108,'WebGUI',2,'Besitzer',1031510000);
INSERT INTO international VALUES (109,'WebGUI',2,'Besitzer kann\nanschauen?',1031510000);
INSERT INTO international VALUES (107,'WebGUI',2,'Rechte',1031510000);
INSERT INTO international VALUES (105,'WebGUI',2,'Stil',1031510000);
INSERT INTO international VALUES (106,'WebGUI',2,'Stil an alle\nnachfolgenden Seiten weitergeben.',1031510000);
INSERT INTO international VALUES (104,'WebGUI',2,'URL der Seite',1031510000);
INSERT INTO international VALUES (103,'WebGUI',2,'Seitenspezifikation',1031510000);
INSERT INTO international VALUES (102,'WebGUI',2,'Seite\nbearbeiten',1031510000);
INSERT INTO international VALUES (100,'WebGUI',2,'Meta Tags',1031510000);
INSERT INTO international VALUES (353,'WebGUI',1,'You have no messages in your Inbox at this time.',1031514049);
INSERT INTO international VALUES (101,'WebGUI',2,'Sind Sie sicher,\ndass Sie diese Seite und ihren kompletten Inhalt darunter l�schen\nm�chten?',1031510000);
INSERT INTO international VALUES (99,'WebGUI',2,'Titel',1031510000);
INSERT INTO international VALUES (93,'WebGUI',2,'Hilfe',1031510000);
INSERT INTO international VALUES (94,'WebGUI',2,'Siehe auch',1031510000);
INSERT INTO international VALUES (92,'WebGUI',2,'N�chste Seite',1031510000);
INSERT INTO international VALUES (95,'WebGUI',2,'Hilfe',1031510000);
INSERT INTO international VALUES (91,'WebGUI',2,'Vorherige Seite',1031510000);
INSERT INTO international VALUES (89,'WebGUI',2,'Gruppen',1031510000);
INSERT INTO international VALUES (90,'WebGUI',2,'Neue Gruppe\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (88,'WebGUI',2,'Benutzer in dieser\nGruppe',1031510000);
INSERT INTO international VALUES (87,'WebGUI',2,'Gruppe\nbearbeiten',1031510000);
INSERT INTO international VALUES (86,'WebGUI',2,'Sind Sie sicher,\ndass Sie diese Gruppe l�schen m�chten? Denken Sie daran, dass diese Gruppe\nund die zugeh�rige Rechtesstruktur endg�ltig gel�scht wird.',1031510000);
INSERT INTO international VALUES (85,'WebGUI',2,'Beschreibung',1031510000);
INSERT INTO international VALUES (84,'WebGUI',2,'Gruppenname',1031510000);
INSERT INTO international VALUES (82,'WebGUI',2,'Administrative\nFunktionen ...',1031510000);
INSERT INTO international VALUES (81,'WebGUI',2,'Benutzerkonto\nwurde aktualisiert',1031510000);
INSERT INTO international VALUES (80,'WebGUI',2,'Benutzerkonto\nwurde angelegt',1031510000);
INSERT INTO international VALUES (78,'WebGUI',2,'Die Passworte\nunterscheiden sich. Bitte versuchen Sie es noch einmal.',1031510000);
INSERT INTO international VALUES (79,'WebGUI',2,'Verbindung zum\nLDAP-Server konnte nicht hergestellt werden.',1031510000);
INSERT INTO international VALUES (77,'WebGUI',2,'Ein anderes\nMitglied dieser Seiten benutzt bereits diesen Namen. Bitte w�hlen Sie einen\nanderen Benutzernamen. Hier sind einige Vorschl�ge:',1031510000);
INSERT INTO international VALUES (74,'WebGUI',2,'Benutzerkonteninformation',1031510000);
INSERT INTO international VALUES (73,'WebGUI',2,'Anmelden',1031510000);
INSERT INTO international VALUES (76,'WebGUI',2,'Ihre Emailadresse\nist nicht in unserer Datenbank.',1031510000);
INSERT INTO international VALUES (75,'WebGUI',2,'Ihre\nBenutzerkonteninformation wurde an Ihre Emailadresse geschickt',1031510000);
INSERT INTO international VALUES (72,'WebGUI',2,'wiederherstellen',1031510000);
INSERT INTO international VALUES (71,'WebGUI',2,'Passwort\nwiederherstellen',1031510000);
INSERT INTO international VALUES (70,'WebGUI',2,'Fehler',1031510000);
INSERT INTO international VALUES (69,'WebGUI',2,'Bitten Sie Ihren\nSystemadministrator um Hilfe.',1031510000);
INSERT INTO international VALUES (66,'WebGUI',2,'Anmelden',1031510000);
INSERT INTO international VALUES (67,'WebGUI',2,'Neues\nBenutzerkonto einrichten',1031510000);
INSERT INTO international VALUES (408,'WebGUI',1,'Manage Roots',1031514049);
INSERT INTO international VALUES (409,'WebGUI',1,'Add a new root.',1031514049);
INSERT INTO international VALUES (410,'WebGUI',1,'Manage roots.',1031514049);
INSERT INTO international VALUES (411,'WebGUI',1,'Menu Title',1031514049);
INSERT INTO international VALUES (412,'WebGUI',1,'Synopsis',1031514049);
INSERT INTO international VALUES (9,'SiteMap',1,'Display synopsis?',1031514049);
INSERT INTO international VALUES (18,'Article',1,'Allow discussion?',1031514049);
INSERT INTO international VALUES (10,'Product',1,'Price',1031514049);
INSERT INTO international VALUES (22,'Article',1,'Author',1031514049);
INSERT INTO international VALUES (23,'Article',1,'Date',1031514049);
INSERT INTO international VALUES (24,'Article',1,'Post Response',1031514049);
INSERT INTO international VALUES (58,'USS',1,'Previous Submission',1031514049);
INSERT INTO international VALUES (27,'Article',1,'Back To Article',1031514049);
INSERT INTO international VALUES (28,'Article',1,'View Responses',1031514049);
INSERT INTO international VALUES (55,'Product',1,'Add a benefit.',1031514049);
INSERT INTO international VALUES (416,'WebGUI',1,'<h1>Problem With Request</h1>We have encountered a problem with your request. Please use your back button and try again. If this problem persists, please contact us with what you were trying to do and the time and date of the problem.',1031514049);
INSERT INTO international VALUES (417,'WebGUI',1,'<h1>Security Violation</h1>You attempted to access a wobject not associated with this page. This incident has been reported.',1031514049);
INSERT INTO international VALUES (418,'WebGUI',1,'Filter Contributed HTML',1031514049);
INSERT INTO international VALUES (419,'WebGUI',1,'Remove all tags.',1031514049);
INSERT INTO international VALUES (420,'WebGUI',1,'Leave as is.',1031514049);
INSERT INTO international VALUES (421,'WebGUI',1,'Remove all but basic formating.',1031514049);
INSERT INTO international VALUES (422,'WebGUI',1,'<h1>Login Failed</h1>The information supplied does not match the account.',1031514049);
INSERT INTO international VALUES (423,'WebGUI',1,'View active sessions.',1031514049);
INSERT INTO international VALUES (424,'WebGUI',1,'View login history.',1031514049);
INSERT INTO international VALUES (425,'WebGUI',1,'Active Sessions',1031514049);
INSERT INTO international VALUES (426,'WebGUI',1,'Login History',1031514049);
INSERT INTO international VALUES (427,'WebGUI',1,'Styles',1031514049);
INSERT INTO international VALUES (428,'WebGUI',1,'User (ID)',1031514049);
INSERT INTO international VALUES (429,'WebGUI',1,'Login Time',1031514049);
INSERT INTO international VALUES (430,'WebGUI',1,'Last Page View',1031514049);
INSERT INTO international VALUES (431,'WebGUI',1,'IP Address',1031514049);
INSERT INTO international VALUES (432,'WebGUI',1,'Expires',1031514049);
INSERT INTO international VALUES (433,'WebGUI',1,'User Agent',1031514049);
INSERT INTO international VALUES (434,'WebGUI',1,'Status',1031514049);
INSERT INTO international VALUES (435,'WebGUI',1,'Session Signature',1031514049);
INSERT INTO international VALUES (436,'WebGUI',1,'Kill Session',1031514049);
INSERT INTO international VALUES (437,'WebGUI',1,'Statistics',1031514049);
INSERT INTO international VALUES (438,'WebGUI',1,'Your Name',1031514049);
INSERT INTO international VALUES (68,'WebGUI',2,'Die\nBenutzerkontoinformationen die Sie eingegeben haben, sind ung�ltig.\nEntweder existiert das Konto nicht, oder die Kombination aus Benutzername\nund Passwort ist falsch.',1031510000);
INSERT INTO international VALUES (65,'WebGUI',2,'Benutzerkonto\nendg�ltig deaktivieren',1031510000);
INSERT INTO international VALUES (62,'WebGUI',2,'sichern',1031510000);
INSERT INTO international VALUES (64,'WebGUI',2,'Abmelden',1031510000);
INSERT INTO international VALUES (63,'WebGUI',2,'Administrationsmodus einschalten',1031510000);
INSERT INTO international VALUES (61,'WebGUI',2,'Benutzerkontendetails aktualisieren',1031510000);
INSERT INTO international VALUES (60,'WebGUI',2,'Sind Sie sicher,\ndass Sie dieses Benutzerkonto deaktivieren m�chten? Wenn Sie fortfahren\nsind Ihre Konteninformationen endg�ltig verloren.',1031510000);
INSERT INTO international VALUES (1,'SyndicatedContent',6,'URL till RSS filen',1031510000);
INSERT INTO international VALUES (59,'WebGUI',2,'Ich habe mein\nPasswort vergessen',1031510000);
INSERT INTO international VALUES (58,'WebGUI',2,'Ich besitze\nbereits ein Benutzerkonto.',1031510000);
INSERT INTO international VALUES (59,'Product',1,'Name',1031514049);
INSERT INTO international VALUES (60,'Product',1,'Template',1031514049);
INSERT INTO international VALUES (56,'WebGUI',2,'Email Adresse',1031510000);
INSERT INTO international VALUES (57,'WebGUI',2,'(Dies ist nur\nnotwendig, wenn Sie Eigenschaften benutzen m�chten die eine Emailadresse\nvoraussetzen)',1031510000);
INSERT INTO international VALUES (55,'WebGUI',2,'Passwort\n(best�tigen)',1031510000);
INSERT INTO international VALUES (54,'WebGUI',2,'Benutzerkonto\nanlegen',1031510000);
INSERT INTO international VALUES (7,'Article',10,'Titel p� henvisning',1031510000);
INSERT INTO international VALUES (53,'WebGUI',2,'Druckerbares\nFormat',1031510000);
INSERT INTO international VALUES (51,'WebGUI',2,'Passwort',1031510000);
INSERT INTO international VALUES (49,'WebGUI',2,'Hier k�nnen Sie\nsich <a href=\"^;?op=logout\">abmelden</a>.',1031510000);
INSERT INTO international VALUES (52,'WebGUI',2,'Anmelden',1031510000);
INSERT INTO international VALUES (50,'WebGUI',2,'Benutzername',1031510000);
INSERT INTO international VALUES (48,'WebGUI',2,'Hallo',1031510000);
INSERT INTO international VALUES (47,'WebGUI',2,'Startseite',1031510000);
INSERT INTO international VALUES (46,'WebGUI',2,'Mein\nBenutzerkonto',1031510000);
INSERT INTO international VALUES (45,'WebGUI',2,'Nein, ich habe\neinen Fehler gemacht.',1031510000);
INSERT INTO international VALUES (44,'WebGUI',2,'Ja, ich bin mir\nsicher.',1031510000);
INSERT INTO international VALUES (43,'WebGUI',2,'Sind Sie sicher,\ndass Sie diesen Inhalt l�schen m�chten?',1031510000);
INSERT INTO international VALUES (42,'WebGUI',2,'Bitte best�tigen\nSie',1031510000);
INSERT INTO international VALUES (41,'WebGUI',2,'Sie versuchen\neinen notwendigen Bestandteil des Systems zu l�schen. WebGUI wird nach\ndieser Aktion m�glicherweise nicht mehr richtig funktionieren.',1031510000);
INSERT INTO international VALUES (39,'WebGUI',2,'Sie sind nicht\nberechtigt, diese Seite anzuschauen.',1031510000);
INSERT INTO international VALUES (40,'WebGUI',2,'Notwendiger\nBestandteil',1031510000);
INSERT INTO international VALUES (38,'WebGUI',2,'Sie sind nicht\nberechtigt, diese Aktion auszuf�hren. ^a(Melden Sie sich bitte mit einem\nBenutzernamen an);, der �ber ausreichende Rechte verf�gt.',1031510000);
INSERT INTO international VALUES (2,'LinkList',6,'Avst�nd mellan rader',1031510000);
INSERT INTO international VALUES (37,'WebGUI',2,'Zugriff\nverweigert!',1031510000);
INSERT INTO international VALUES (2,'SQLReport',6,'L�gg till SQL-rapport',1031579399);
INSERT INTO international VALUES (37,'USS',2,'L�schen',1031510000);
INSERT INTO international VALUES (36,'WebGUI',2,'Um diese Funktion\nausf�hren zu k�nnen, m�ssen Sie Administrator sein. Eine der folgenden\nPersonen kann Sie zum Administrator machen:',1031510000);
INSERT INTO international VALUES (35,'WebGUI',2,'Administrative\nFunktion',1031510000);
INSERT INTO international VALUES (35,'USS',2,'Titel',1031510000);
INSERT INTO international VALUES (34,'WebGUI',2,'Datum setzen',1031510000);
INSERT INTO international VALUES (34,'USS',2,'Carriage\nReturn beachten?',1031510000);
INSERT INTO international VALUES (33,'WebGUI',2,'Samstag',1031510000);
INSERT INTO international VALUES (32,'WebGUI',2,'Freitag',1031510000);
INSERT INTO international VALUES (33,'USS',2,'Anhang',1031510000);
INSERT INTO international VALUES (32,'USS',2,'Grafik',1031510000);
INSERT INTO international VALUES (31,'WebGUI',2,'Donnerstag',1031510000);
INSERT INTO international VALUES (30,'WebGUI',2,'Mittwoch',1031510000);
INSERT INTO international VALUES (31,'USS',2,'Inhalt',1031510000);
INSERT INTO international VALUES (29,'WebGUI',2,'Dienstag',1031510000);
INSERT INTO international VALUES (28,'WebGUI',2,'Montag',1031510000);
INSERT INTO international VALUES (29,'USS',2,'Benutzer\nBeitragssystem',1031510000);
INSERT INTO international VALUES (28,'USS',2,'Zur�ck zur\nBeitragsliste',1031510000);
INSERT INTO international VALUES (28,'Article',2,'Kommentare\nanschauen',1031510000);
INSERT INTO international VALUES (27,'WebGUI',2,'Sonntag',1031510000);
INSERT INTO international VALUES (27,'USS',2,'Bearbeiten',1031510000);
INSERT INTO international VALUES (27,'Article',2,'Zur�ck zum\nArtikel',1031510000);
INSERT INTO international VALUES (26,'WebGUI',2,'Dezember',1031510000);
INSERT INTO international VALUES (2,'WebGUI',6,'Sida',1031510000);
INSERT INTO international VALUES (574,'WebGUI',2,'Verbieten',1031510000);
INSERT INTO international VALUES (25,'WebGUI',2,'November',1031510000);
INSERT INTO international VALUES (573,'WebGUI',2,'Ausstehend\nverlassen',1031510000);
INSERT INTO international VALUES (24,'WebGUI',2,'Oktober',1031510000);
INSERT INTO international VALUES (24,'Article',2,'Kommentar\nschreiben',1031510000);
INSERT INTO international VALUES (1,'Article',6,'Artikel',1031510000);
INSERT INTO international VALUES (572,'WebGUI',2,'Erlauben',1031510000);
INSERT INTO international VALUES (23,'WebGUI',2,'September',1031510000);
INSERT INTO international VALUES (3,'FAQ',6,'L�gg till F.A.Q.',1031510000);
INSERT INTO international VALUES (23,'Article',2,'Datum',1031510000);
INSERT INTO international VALUES (22,'WebGUI',2,'August',1031510000);
INSERT INTO international VALUES (22,'Article',2,'Autor',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',2,'Beitrag\nl�schen',1031510000);
INSERT INTO international VALUES (3,'USS',6,'Du har ett nytt meddelande att validera.',1031648406);
INSERT INTO international VALUES (21,'WebGUI',2,'Juli',1031510000);
INSERT INTO international VALUES (21,'USS',2,'Erstellt\nvon',1031510000);
INSERT INTO international VALUES (565,'WebGUI',2,'Wer kann\nmoderieren?',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',6,'Intr�ffar endast en g�ng.',1031510000);
INSERT INTO international VALUES (21,'FileManager',2,'Vorschaubilder anzeigen?',1031510000);
INSERT INTO international VALUES (20,'WebGUI',2,'Juni',1031510000);
INSERT INTO international VALUES (20,'USS',2,'Neuen\nBeitrag schreiben',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',2,'Letzte\nAntwort',1031510000);
INSERT INTO international VALUES (4,'Item',6,'Post',1031510000);
INSERT INTO international VALUES (4,'SQLReport',6,'Query',1031510000);
INSERT INTO international VALUES (20,'FileManager',2,'Sp�ter\nmit Seitenzahlen versehen',1031510000);
INSERT INTO international VALUES (19,'WebGUI',2,'Mai',1031510000);
INSERT INTO international VALUES (19,'USS',2,'Beitrag\nbearbeiten',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',2,'Antworten',1031510000);
INSERT INTO international VALUES (5,'FAQ',6,'Fr�ga',1031510000);
INSERT INTO international VALUES (19,'EventsCalendar',2,'Sp�ter mit\nSeitenzahlen versehen',1031510000);
INSERT INTO international VALUES (19,'FileManager',2,'Sie\nbesitzen keine Dateien, die zum Download bereitstehen.',1031510000);
INSERT INTO international VALUES (18,'WebGUI',2,'April',1031510000);
INSERT INTO international VALUES (18,'USS',2,'Benutzer\nBeitragssystem bearbeiten',1031510000);
INSERT INTO international VALUES (18,'SQLReport',2,'Diese Abfrage\nliefert keine Ergebnisse.',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',2,'Diskussion\nbegonnen',1031510000);
INSERT INTO international VALUES (18,'FileManager',2,'Alternative #2',1031510000);
INSERT INTO international VALUES (17,'WebGUI',2,'M�rz',1031510000);
INSERT INTO international VALUES (18,'EventsCalendar',2,'Kalendermonat',1031510000);
INSERT INTO international VALUES (18,'Article',2,'Diskussion\nerlauben?',1031510000);
INSERT INTO international VALUES (17,'USS',2,'Sind Sie\nsicher, dass Sie diesen Beitrag l�schen wollen?',1031510000);
INSERT INTO international VALUES (17,'SQLReport',2,'<b>Debug:</b>\nAbfrage:',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',2,'Neuen\nBeitrag schreiben',1031510000);
INSERT INTO international VALUES (17,'EventsCalendar',2,'Liste',1031510000);
INSERT INTO international VALUES (17,'FileManager',2,'Alternative #1',1031510000);
INSERT INTO international VALUES (16,'WebGUI',2,'Februar',1031510000);
INSERT INTO international VALUES (16,'USS',2,'Ohne\nTitel',1031510000);
INSERT INTO international VALUES (48,'Product',1,'Are you certain you wish to delete this benefit? It cannot be recovered once it has been deleted.',1031514049);
INSERT INTO international VALUES (16,'FileManager',2,'Upload\nDatum',1031510000);
INSERT INTO international VALUES (16,'EventsCalendar',2,'Kalender\nLayout',1031510000);
INSERT INTO international VALUES (16,'SQLReport',2,'debuggen?',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',2,'Datum',1031510000);
INSERT INTO international VALUES (17,'Article',2,'Zentrum',1031510000);
INSERT INTO international VALUES (15,'USS',2,'Bearbeiten/L�schen',1031510000);
INSERT INTO international VALUES (15,'WebGUI',2,'Januar',1031510000);
INSERT INTO international VALUES (16,'Article',2,'Links',1031510000);
INSERT INTO international VALUES (15,'SQLReport',2,'Sollen die\nMakros in der Abfrage vorverarbeitet werden?',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',2,'Autor',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',2,'Ende\nDatum',1031510000);
INSERT INTO international VALUES (14,'WebGUI',2,'Ausstehende\nBeitr�ge anschauen',1031510000);
INSERT INTO international VALUES (15,'FileManager',2,'Beschreibung',1031510000);
INSERT INTO international VALUES (15,'Article',2,'Rechts',1031510000);
INSERT INTO international VALUES (14,'USS',2,'Status',1031510000);
INSERT INTO international VALUES (14,'SQLReport',2,'Sp�ter mit\nSeitenzahlen versehen',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',2,'Start\nDatum',1031510000);
INSERT INTO international VALUES (14,'FileManager',2,'Datei',1031510000);
INSERT INTO international VALUES (14,'Article',2,'Anhang\nherunterladen',1031510000);
INSERT INTO international VALUES (13,'WebGUI',2,'Hilfe anschauen',1031510000);
INSERT INTO international VALUES (13,'USS',2,'Erstellungsdatum',1031510000);
INSERT INTO international VALUES (13,'SQLReport',2,'Carriage Return\nbeachten?',1031510000);
INSERT INTO international VALUES (439,'WebGUI',1,'Personal Information',1031514049);
INSERT INTO international VALUES (440,'WebGUI',1,'Contact Information',1031514049);
INSERT INTO international VALUES (441,'WebGUI',1,'Email To Pager Gateway',1031514049);
INSERT INTO international VALUES (442,'WebGUI',1,'Work Information',1031514049);
INSERT INTO international VALUES (443,'WebGUI',1,'Home Information',1031514049);
INSERT INTO international VALUES (444,'WebGUI',1,'Demographic Information',1031514049);
INSERT INTO international VALUES (445,'WebGUI',1,'Preferences',1031514049);
INSERT INTO international VALUES (446,'WebGUI',1,'Work Web Site',1031514049);
INSERT INTO international VALUES (447,'WebGUI',1,'Manage page tree.',1031514049);
INSERT INTO international VALUES (448,'WebGUI',1,'Page Tree',1031514049);
INSERT INTO international VALUES (449,'WebGUI',1,'Miscellaneous Information',1031514049);
INSERT INTO international VALUES (450,'WebGUI',1,'Work Name (Company Name)',1031514049);
INSERT INTO international VALUES (451,'WebGUI',1,'is required.',1031514049);
INSERT INTO international VALUES (452,'WebGUI',1,'Please wait...',1031514049);
INSERT INTO international VALUES (453,'WebGUI',1,'Date Created',1031514049);
INSERT INTO international VALUES (454,'WebGUI',1,'Last Updated',1031514049);
INSERT INTO international VALUES (455,'WebGUI',1,'Edit User\'s Profile',1031514049);
INSERT INTO international VALUES (456,'WebGUI',1,'Back to user list.',1031514049);
INSERT INTO international VALUES (457,'WebGUI',1,'Edit this user\'s account.',1031514049);
INSERT INTO international VALUES (458,'WebGUI',1,'Edit this user\'s groups.',1031514049);
INSERT INTO international VALUES (459,'WebGUI',1,'Edit this user\'s profile.',1031514049);
INSERT INTO international VALUES (460,'WebGUI',1,'Time Offset',1031514049);
INSERT INTO international VALUES (461,'WebGUI',1,'Date Format',1031514049);
INSERT INTO international VALUES (462,'WebGUI',1,'Time Format',1031514049);
INSERT INTO international VALUES (463,'WebGUI',1,'Text Area Rows',1031514049);
INSERT INTO international VALUES (464,'WebGUI',1,'Text Area Columns',1031514049);
INSERT INTO international VALUES (465,'WebGUI',1,'Text Box Size',1031514049);
INSERT INTO international VALUES (466,'WebGUI',1,'Are you certain you wish to delete this category and move all of its fields to the Miscellaneous category?',1031514049);
INSERT INTO international VALUES (467,'WebGUI',1,'Are you certain you wish to delete this field and all user data attached to it?',1031514049);
INSERT INTO international VALUES (468,'WebGUI',6,'Redigera Anv�ndar Profil Kategorier',1031579473);
INSERT INTO international VALUES (469,'WebGUI',1,'Id',1031514049);
INSERT INTO international VALUES (470,'WebGUI',1,'Name',1031514049);
INSERT INTO international VALUES (472,'WebGUI',1,'Label',1031514049);
INSERT INTO international VALUES (473,'WebGUI',1,'Visible?',1031514049);
INSERT INTO international VALUES (474,'WebGUI',1,'Required?',1031514049);
INSERT INTO international VALUES (475,'WebGUI',1,'Text',1031514049);
INSERT INTO international VALUES (476,'WebGUI',1,'Text Area',1031514049);
INSERT INTO international VALUES (477,'WebGUI',1,'HTML Area',1031514049);
INSERT INTO international VALUES (478,'WebGUI',1,'URL',1031514049);
INSERT INTO international VALUES (479,'WebGUI',1,'Date',1031514049);
INSERT INTO international VALUES (480,'WebGUI',1,'Email Address',1031514049);
INSERT INTO international VALUES (481,'WebGUI',1,'Telephone Number',1031514049);
INSERT INTO international VALUES (482,'WebGUI',1,'Number (Integer)',1031514049);
INSERT INTO international VALUES (483,'WebGUI',1,'Yes or No',1031514049);
INSERT INTO international VALUES (484,'WebGUI',1,'Select List',1031514049);
INSERT INTO international VALUES (485,'WebGUI',1,'Boolean (Checkbox)',1031514049);
INSERT INTO international VALUES (486,'WebGUI',1,'Data Type',1031514049);
INSERT INTO international VALUES (487,'WebGUI',1,'Possible Values',1031514049);
INSERT INTO international VALUES (488,'WebGUI',1,'Default Value(s)',1031514049);
INSERT INTO international VALUES (489,'WebGUI',1,'Profile Category',1031514049);
INSERT INTO international VALUES (490,'WebGUI',1,'Add a profile category.',1031514049);
INSERT INTO international VALUES (491,'WebGUI',1,'Add a profile field.',1031514049);
INSERT INTO international VALUES (492,'WebGUI',1,'Profile fields list.',1031514049);
INSERT INTO international VALUES (493,'WebGUI',1,'Back to site.',1031514049);
INSERT INTO international VALUES (495,'WebGUI',1,'Built-In Editor',1031514049);
INSERT INTO international VALUES (496,'WebGUI',1,'Editor To Use',1031514049);
INSERT INTO international VALUES (494,'WebGUI',1,'Real Objects Edit-On Pro',1031514049);
INSERT INTO international VALUES (497,'WebGUI',1,'Start Date',1031514049);
INSERT INTO international VALUES (498,'WebGUI',1,'End Date',1031514049);
INSERT INTO international VALUES (499,'WebGUI',1,'Wobject ID',1031514049);
INSERT INTO international VALUES (500,'WebGUI',1,'Page ID',1031514049);
INSERT INTO international VALUES (5,'Poll',6,'Bredd p� staplar',1031650849);
INSERT INTO international VALUES (5,'SiteMap',6,'Redigera Site Kartan',1031510000);
INSERT INTO international VALUES (5,'SQLReport',6,'DSN',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',6,'Senast h�mtad',1031510000);
INSERT INTO international VALUES (5,'USS',6,'Ditt meddelande har blivit nekat validering.',1031648653);
INSERT INTO international VALUES (5,'WebGUI',6,'Kontrollera grupper.',1031580887);
INSERT INTO international VALUES (6,'Article',6,'Bild',1031510000);
INSERT INTO international VALUES (701,'WebGUI',6,'Vecka',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',6,'L�gg till extra column',1031510000);
INSERT INTO international VALUES (6,'FAQ',6,'Svar',1031510000);
INSERT INTO international VALUES (6,'LinkList',6,'L�nklista',1032257336);
INSERT INTO international VALUES (6,'MessageBoard',6,'Redigera Meddelande Forum',1031510000);
INSERT INTO international VALUES (6,'Poll',6,'Fr�ga',1031510000);
INSERT INTO international VALUES (6,'SiteMap',6,'Indentering',1031510000);
INSERT INTO international VALUES (6,'SQLReport',6,'Databas anv�ndare',1031651366);
INSERT INTO international VALUES (6,'SyndicatedContent',6,'Nuvarande inneh�ll',1031651469);
INSERT INTO international VALUES (6,'USS',6,'Inl�gg per sida',1031510000);
INSERT INTO international VALUES (6,'WebGUI',6,'Kontrollera stilar.',1031579234);
INSERT INTO international VALUES (7,'Article',6,'L�nktitel',1032859374);
INSERT INTO international VALUES (7,'EventsCalendar',6,'L�gg till h�ndelse',1031510000);
INSERT INTO international VALUES (7,'FAQ',6,'�r du s�ker p� att du vill radera denna fr�ga?',1031510000);
INSERT INTO international VALUES (7,'LinkList',6,'L�gg till l�nk',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',6,'F�rfattare:',1031510000);
INSERT INTO international VALUES (7,'Poll',6,'Svar',1031510000);
INSERT INTO international VALUES (7,'SiteMap',6,'Kula',1031510000);
INSERT INTO international VALUES (7,'SQLReport',6,'Databas l�senord',1031651382);
INSERT INTO international VALUES (560,'WebGUI',6,'Godk�nnt',1031510000);
INSERT INTO international VALUES (7,'WebGUI',6,'Kontrollera anv�ndare.',1031647963);
INSERT INTO international VALUES (8,'Article',6,'L�nk-URL',1032859384);
INSERT INTO international VALUES (8,'EventsCalendar',6,'�terkommer varje',1031649719);
INSERT INTO international VALUES (8,'FAQ',6,'Redigera F.A.Q.',1031510000);
INSERT INTO international VALUES (8,'LinkList',6,'URL',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',6,'Datum:',1031510000);
INSERT INTO international VALUES (8,'Poll',6,'(Mata in ett svar per rad. Max 20.)',1031510000);
INSERT INTO international VALUES (8,'SiteMap',6,'Avst�nd mellan rader',1031510000);
INSERT INTO international VALUES (8,'SQLReport',6,'Redigera SQL Rapport',1031510000);
INSERT INTO international VALUES (561,'WebGUI',6,'Nekat',1031510000);
INSERT INTO international VALUES (8,'WebGUI',6,'Visa page not found.',1031510000);
INSERT INTO international VALUES (9,'Article',6,'Bilagor',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',6,'till',1031649729);
INSERT INTO international VALUES (9,'FAQ',6,'L�gg till ny fr�ga.',1031510000);
INSERT INTO international VALUES (9,'LinkList',6,'�r du s�ker att du vill radera denna l�nk?',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',6,'Meddelande-ID:',1031650055);
INSERT INTO international VALUES (9,'Poll',6,'Redigera fr�ga',1031510000);
INSERT INTO international VALUES (9,'SQLReport',6,'&lt;b&gt;Debug:&lt;/b&gt; Error: The DSN specified is of an improper format.',1031510000);
INSERT INTO international VALUES (562,'WebGUI',6,'V�ntande',1031510000);
INSERT INTO international VALUES (9,'WebGUI',6,'Visa klippbord.',1031510000);
INSERT INTO international VALUES (10,'Article',6,'Konvertera radbrytning?',1031510000);
INSERT INTO international VALUES (10,'FAQ',6,'Redigera fr�ga',1031510000);
INSERT INTO international VALUES (10,'LinkList',6,'Redigera l�nklista',1032257325);
INSERT INTO international VALUES (2,'Article',10,'Tilf�j artikel',1031510000);
INSERT INTO international VALUES (10,'Poll',6,'�terst�ll r�ster.',1031510000);
INSERT INTO international VALUES (10,'SQLReport',6,'&lt;b&gt;Debug:&lt;/b&gt; Error: The SQL specified is of an improper format.',1031510000);
INSERT INTO international VALUES (563,'WebGUI',6,'Standardstatus',1031580967);
INSERT INTO international VALUES (10,'WebGUI',6,'Hantera skr�pkorgen.',1031510000);
INSERT INTO international VALUES (11,'Article',6,'(Kryssa i om du inte skriver &lt;br&gt; manuellt.)',1031841919);
INSERT INTO international VALUES (77,'EventsCalendar',1,'Delete this event <b>and</b> all of its recurrences.',1031514049);
INSERT INTO international VALUES (11,'LinkList',6,'L�gg till l�nklista',1031579360);
INSERT INTO international VALUES (11,'MessageBoard',6,'Tillbaka till meddelandelista',1031649810);
INSERT INTO international VALUES (11,'SQLReport',6,'&lt;b&gt;Debug:&lt;/b&gt; Error: There was a problem with the query.',1031510000);
INSERT INTO international VALUES (11,'USS',6,'L�gg till inl�gg',1031510000);
INSERT INTO international VALUES (11,'WebGUI',6,'T�m skr�pkorgen.',1031648713);
INSERT INTO international VALUES (12,'Article',6,'Redigera artikel',1031841932);
INSERT INTO international VALUES (12,'EventsCalendar',6,'Redigera H�ndelser Kalender',1031649518);
INSERT INTO international VALUES (12,'LinkList',6,'Redigera L�nk',1031510000);
INSERT INTO international VALUES (12,'MessageBoard',6,'Redigera meddelande',1031510000);
INSERT INTO international VALUES (12,'SQLReport',6,'&lt;b&gt;Debug:&lt;/b&gt; Error: Could not connect to the database.',1031510000);
INSERT INTO international VALUES (12,'USS',6,'(Avkryssa om du skriver ett HTML-inl�gg)',1031648376);
INSERT INTO international VALUES (12,'WebGUI',6,'St�ng av adminverktyg.',1031510000);
INSERT INTO international VALUES (13,'Article',6,'Radera',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',6,'L�gg till h�ndelse',1031510000);
INSERT INTO international VALUES (13,'LinkList',6,'L�gg till en ny l�nk.',1031510000);
INSERT INTO international VALUES (577,'WebGUI',6,'Skicka svar',1031510000);
INSERT INTO international VALUES (13,'USS',6,'Inlagt den',1031510000);
INSERT INTO international VALUES (13,'WebGUI',6,'Visa hj�lpindex.',1031510000);
INSERT INTO international VALUES (14,'Article',6,'Justera bild',1031841948);
INSERT INTO international VALUES (514,'WebGUI',1,'Views',1031514049);
INSERT INTO international VALUES (14,'USS',6,'Status',1031510000);
INSERT INTO international VALUES (14,'WebGUI',6,'Visa v�ntande meddelanden.',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',6,'F�rfattare',1031510000);
INSERT INTO international VALUES (15,'USS',6,'Redigera/Ta bort',1031510000);
INSERT INTO international VALUES (15,'WebGUI',6,'Januari',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',6,'Datum',1031510000);
INSERT INTO international VALUES (16,'USS',6,'Namnl�s',1031510000);
INSERT INTO international VALUES (16,'WebGUI',6,'Februari',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',6,'Skicka nytt meddelande',1031510000);
INSERT INTO international VALUES (17,'USS',6,'�r du s�ker du vill ta bort detta inl�gg?',1031648389);
INSERT INTO international VALUES (17,'WebGUI',6,'Mars',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',6,'Tr�d startad',1031510000);
INSERT INTO international VALUES (18,'USS',6,'Redigera inl�ggssystem',1032257235);
INSERT INTO international VALUES (18,'WebGUI',6,'April',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',6,'Svar',1031510000);
INSERT INTO international VALUES (19,'USS',6,'Redigera inl�gg',1031510000);
INSERT INTO international VALUES (19,'WebGUI',6,'Maj',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',6,'Senaste svar',1031510000);
INSERT INTO international VALUES (20,'USS',6,'Skicka nytt inl�gg',1031510000);
INSERT INTO international VALUES (20,'WebGUI',6,'Juni',1031510000);
INSERT INTO international VALUES (21,'USS',6,'Skrivet av',1031510000);
INSERT INTO international VALUES (21,'WebGUI',6,'Juli',1031510000);
INSERT INTO international VALUES (22,'WebGUI',6,'Augusti',1031510000);
INSERT INTO international VALUES (23,'WebGUI',6,'September',1031510000);
INSERT INTO international VALUES (572,'WebGUI',6,'Godk�nn',1031510000);
INSERT INTO international VALUES (24,'WebGUI',6,'Oktober',1031510000);
INSERT INTO international VALUES (573,'WebGUI',6,'L�mna i v�ntel�ge',1031510000);
INSERT INTO international VALUES (25,'WebGUI',6,'November',1031510000);
INSERT INTO international VALUES (574,'WebGUI',6,'Neka',1031510000);
INSERT INTO international VALUES (26,'WebGUI',6,'December',1031510000);
INSERT INTO international VALUES (27,'USS',6,'Redigera',1031510000);
INSERT INTO international VALUES (27,'WebGUI',6,'S�ndag',1031510000);
INSERT INTO international VALUES (28,'USS',6,'�terg� till inl�ggslistan',1031510000);
INSERT INTO international VALUES (28,'WebGUI',6,'M�ndag',1031510000);
INSERT INTO international VALUES (29,'USS',6,'Anv�ndar-inl�ggssystem',1032257257);
INSERT INTO international VALUES (29,'WebGUI',6,'Tisdag',1031510000);
INSERT INTO international VALUES (576,'WebGUI',1,'Delete',1031514049);
INSERT INTO international VALUES (30,'WebGUI',6,'Onsdag',1031510000);
INSERT INTO international VALUES (31,'WebGUI',6,'Torsdag',1031510000);
INSERT INTO international VALUES (32,'WebGUI',6,'Fredag',1031510000);
INSERT INTO international VALUES (33,'WebGUI',6,'L�rdag',1031510000);
INSERT INTO international VALUES (34,'WebGUI',6,'s�tt datum',1031510000);
INSERT INTO international VALUES (35,'WebGUI',6,'Administrativa funktioner',1031510000);
INSERT INTO international VALUES (36,'WebGUI',6,'Du m�ste vara administrat�r f�r att utf�ra denna funktion. Var v�nlig kontakta n�gon av administrat�rerna. F�ljande �r en lista av administrat�rer i systemet:',1031510000);
INSERT INTO international VALUES (37,'WebGUI',6,'�tkomst nekas!',1031510000);
INSERT INTO international VALUES (404,'WebGUI',6,'F�rstasidan',1032859685);
INSERT INTO international VALUES (38,'WebGUI',6,'Du har inte r�ttigheter att utf�ra denna operation. Var v�nlig och ^a(logga in); p� ett konto med tillr�ckliga r�ttigheter.',1031510000);
INSERT INTO international VALUES (39,'WebGUI',6,'�tkomst nekas, du har inte tillr�ckliga privilegier.',1032434775);
INSERT INTO international VALUES (40,'WebGUI',6,'Vital komponent',1031510000);
INSERT INTO international VALUES (41,'WebGUI',6,'Du h�ller p� att ta bort en vital komponent fr�n WebGUI systemet. Om du hade varit till�ten att g�ra detta, hade WebGUI slutat fungera!',1032859714);
INSERT INTO international VALUES (42,'WebGUI',6,'Var v�nlig konfirmera',1031510000);
INSERT INTO international VALUES (43,'WebGUI',6,'�r du s�ker att du vill ta bort detta inneh�ll?',1032434800);
INSERT INTO international VALUES (44,'WebGUI',6,'Ja, jag �r s�ker.',1031510000);
INSERT INTO international VALUES (45,'WebGUI',6,'Nej, jag gjorde ett misstag.',1031510000);
INSERT INTO international VALUES (46,'WebGUI',6,'Mitt konto',1031510000);
INSERT INTO international VALUES (47,'WebGUI',6,'Hem',1031510000);
INSERT INTO international VALUES (48,'WebGUI',6,'Hej',1031510000);
INSERT INTO international VALUES (49,'WebGUI',6,'Klicka &lt;a href=unknown://\"^\\;?op=logout\" TARGET=\"_blank\"&gt;h�r&lt;/a&gt; f�r att logga ur.',1031510000);
INSERT INTO international VALUES (50,'WebGUI',6,'Anv�ndarnamn',1031510000);
INSERT INTO international VALUES (51,'WebGUI',6,'L�senord',1031510000);
INSERT INTO international VALUES (52,'WebGUI',6,'logga in',1031580920);
INSERT INTO international VALUES (53,'WebGUI',6,'Utskriftsversion',1031580930);
INSERT INTO international VALUES (54,'WebGUI',6,'Skapa konto',1031510000);
INSERT INTO international VALUES (55,'WebGUI',6,'L�senord (kontroll)',1031510000);
INSERT INTO international VALUES (56,'WebGUI',6,'E-postadress',1031580948);
INSERT INTO international VALUES (57,'WebGUI',6,'Detta kr�vs endas om du vill anv�nda tj�nster som kr�ver e-post.',1031580985);
INSERT INTO international VALUES (58,'WebGUI',6,'Jag har redan ett konto.',1031510000);
INSERT INTO international VALUES (59,'WebGUI',6,'Jag har gl�mt mitt l�senord.',1031510000);
INSERT INTO international VALUES (60,'WebGUI',6,'�r du s�ker p� att du vill st�nga ned ditt konto? Om du forts�tter kommer all information att vara permanent f�rlorad.',1032859889);
INSERT INTO international VALUES (61,'WebGUI',6,'Uppdatera kontoinformation',1032859900);
INSERT INTO international VALUES (62,'WebGUI',6,'spara',1031510000);
INSERT INTO international VALUES (63,'WebGUI',6,'Sl� p� admin-verktyg.',1031510000);
INSERT INTO international VALUES (64,'WebGUI',6,'Logga ut.',1031510000);
INSERT INTO international VALUES (65,'WebGUI',6,'Var v�nlig och radera mitt konto permanent.',1031510000);
INSERT INTO international VALUES (66,'WebGUI',6,'Logga in.',1031510000);
INSERT INTO international VALUES (67,'WebGUI',6,'Skapa ett konto.',1031510000);
INSERT INTO international VALUES (68,'WebGUI',6,'Informationen du gav var felaktig. Antingen s� finns ingen s�dan anv�ndare eller ocks� s� gav du fel l�senord.',1031582413);
INSERT INTO international VALUES (69,'WebGUI',6,'Var v�nlig kontakta system administrat�ren f�r vidare hj�lp.',1031510000);
INSERT INTO international VALUES (70,'WebGUI',6,'Fel',1031510000);
INSERT INTO international VALUES (71,'WebGUI',6,'�terh�mta l�senord',1031840958);
INSERT INTO international VALUES (72,'WebGUI',6,'r�dda',1031510000);
INSERT INTO international VALUES (73,'WebGUI',6,'Logga in.',1031510000);
INSERT INTO international VALUES (74,'WebGUI',6,'Kontoinformation',1031647976);
INSERT INTO international VALUES (75,'WebGUI',6,'Din kontoinformation har skickats till din e-postadress.',1031648000);
INSERT INTO international VALUES (76,'WebGUI',6,'Den e-postadressen finns inte i v�rt system.',1031582377);
INSERT INTO international VALUES (77,'WebGUI',6,'Det kontonamnet du valde anv�nds redan p� denna site. Var v�nlig v�lj ett annat. H�r kommer n�gra ideer som du kan anv�nda:',1031510000);
INSERT INTO international VALUES (78,'WebGUI',6,'Ditt l�senord st�mde inte. Var v�nlig f�rs�k igen.',1031510000);
INSERT INTO international VALUES (79,'WebGUI',6,'Kan inte ansluta till LDAP-server.',1031581018);
INSERT INTO international VALUES (80,'WebGUI',6,'Kontot skapades utan problem!',1031510000);
INSERT INTO international VALUES (81,'WebGUI',6,'Kontot uppdaterat utan problem!',1031510000);
INSERT INTO international VALUES (82,'WebGUI',6,'Administrativa funktioner...',1031510000);
INSERT INTO international VALUES (84,'WebGUI',6,'Grupp namn',1031510000);
INSERT INTO international VALUES (85,'WebGUI',6,'Beskrivning',1031510000);
INSERT INTO international VALUES (86,'WebGUI',6,'�r du s�ker p� att du vill radera denna grupp? Var medveten om att alla r�ttigheter associerade med denna grupp kommer att raderas.',1031510000);
INSERT INTO international VALUES (87,'WebGUI',6,'�ndra grupp',1031510000);
INSERT INTO international VALUES (88,'WebGUI',6,'Anv�ndare i gruppen',1031510000);
INSERT INTO international VALUES (89,'WebGUI',6,'Grupper',1031510000);
INSERT INTO international VALUES (90,'WebGUI',6,'L�gg till grupp.',1031510000);
INSERT INTO international VALUES (91,'WebGUI',6,'F�reg�ende sida',1031510000);
INSERT INTO international VALUES (92,'WebGUI',6,'N�sta sida',1031510000);
INSERT INTO international VALUES (93,'WebGUI',6,'Hj�lp',1031510000);
INSERT INTO international VALUES (94,'WebGUI',6,'Se vidare',1031510000);
INSERT INTO international VALUES (95,'WebGUI',6,'Hj�lpindex',1031648017);
INSERT INTO international VALUES (98,'WebGUI',6,'L�gg till sida',1031510000);
INSERT INTO international VALUES (99,'WebGUI',6,'Titel',1031510000);
INSERT INTO international VALUES (100,'WebGUI',6,'Meta Tag',1031510000);
INSERT INTO international VALUES (101,'WebGUI',6,'�r du s�ker p� att du vill radera denna sida, dess inneh�ll och underliggande objekt?',1032851375);
INSERT INTO international VALUES (102,'WebGUI',6,'Redigera sida',1031649551);
INSERT INTO international VALUES (103,'WebGUI',6,'Sidspecifikation',1031510000);
INSERT INTO international VALUES (104,'WebGUI',6,'Sidans URL',1031510000);
INSERT INTO international VALUES (105,'WebGUI',6,'Stil',1031510000);
INSERT INTO international VALUES (106,'WebGUI',6,'Ge samma stil till underliggande sidor.',1031510000);
INSERT INTO international VALUES (107,'WebGUI',6,'Privilegier',1031648692);
INSERT INTO international VALUES (108,'WebGUI',6,'�gare',1031510000);
INSERT INTO international VALUES (109,'WebGUI',6,'�garen kan se?',1031510000);
INSERT INTO international VALUES (110,'WebGUI',6,'�garen kan redigera?',1032859339);
INSERT INTO international VALUES (111,'WebGUI',6,'Grupp',1031510000);
INSERT INTO international VALUES (112,'WebGUI',6,'Gruppen kan se?',1031510000);
INSERT INTO international VALUES (113,'WebGUI',6,'Gruppen kan redigera?',1032859356);
INSERT INTO international VALUES (114,'WebGUI',6,'Vem som helst kan titta?',1031649397);
INSERT INTO international VALUES (115,'WebGUI',6,'Kan vem som helst redigera?',1031510000);
INSERT INTO international VALUES (116,'WebGUI',6,'Kryssa h�r f�r att kopiera dessa previlegier till undersidor.',1031510000);
INSERT INTO international VALUES (117,'WebGUI',6,'Redigera anv�ndarinst�llningar',1032859534);
INSERT INTO international VALUES (118,'WebGUI',6,'Anonyma registreringar',1031510000);
INSERT INTO international VALUES (119,'WebGUI',6,'Authentiseringsmetod (standard)',1031648747);
INSERT INTO international VALUES (120,'WebGUI',6,'LDAP URL (standard)',1031649002);
INSERT INTO international VALUES (121,'WebGUI',6,'LDAP Identitet (standard)',1031648988);
INSERT INTO international VALUES (122,'WebGUI',6,'LDAP Identitet namn',1031649021);
INSERT INTO international VALUES (123,'WebGUI',6,'LDAP L�senord namn',1031649038);
INSERT INTO international VALUES (124,'WebGUI',6,'Redigera f�retagsinformation',1031649057);
INSERT INTO international VALUES (125,'WebGUI',6,'F�retagets namn',1031649080);
INSERT INTO international VALUES (126,'WebGUI',6,'F�retagets e-postadress',1031649095);
INSERT INTO international VALUES (127,'WebGUI',6,'F�retagets URL',1031649115);
INSERT INTO international VALUES (130,'WebGUI',6,'Maximal storlek p� bilagor',1031510000);
INSERT INTO international VALUES (133,'WebGUI',6,'Redigera e-post-inst�llningar',1032859588);
INSERT INTO international VALUES (134,'WebGUI',6,'R�dda-l�senords-meddelande',1032859568);
INSERT INTO international VALUES (135,'WebGUI',6,'SMTP Server',1031510000);
INSERT INTO international VALUES (527,'WebGUI',1,'Default Home Page',1031514049);
INSERT INTO international VALUES (138,'WebGUI',6,'Ja',1031510000);
INSERT INTO international VALUES (139,'WebGUI',6,'Nej',1031510000);
INSERT INTO international VALUES (140,'WebGUI',6,'Redigera �vriga inst�llningar',1031510000);
INSERT INTO international VALUES (141,'WebGUI',6,'Not Found Page',1031510000);
INSERT INTO international VALUES (142,'WebGUI',6,'Session Timeout',1031510000);
INSERT INTO international VALUES (143,'WebGUI',6,'Kontrollera inst�llningar',1031649291);
INSERT INTO international VALUES (144,'WebGUI',6,'Visa statistik.',1031510000);
INSERT INTO international VALUES (145,'WebGUI',6,'WebGUI Build Version',1031510000);
INSERT INTO international VALUES (146,'WebGUI',6,'Aktiva sessioner',1031510000);
INSERT INTO international VALUES (147,'WebGUI',6,'Sidor',1031510000);
INSERT INTO international VALUES (148,'WebGUI',6,'Wobjects',1031510000);
INSERT INTO international VALUES (149,'WebGUI',6,'Anv�ndare',1031510000);
INSERT INTO international VALUES (151,'WebGUI',6,'Stilnamn',1032859552);
INSERT INTO international VALUES (501,'WebGUI',1,'Body',1031514049);
INSERT INTO international VALUES (154,'WebGUI',6,'Stil schema (style sheet)',1031649332);
INSERT INTO international VALUES (155,'WebGUI',6,'�r du s�ker p� att du vill radera denna stil och vilket resulterar i att alla sidor som anv�nder den stilen kommer anv�nda \"Fail Safe\" stilen?',1031510000);
INSERT INTO international VALUES (156,'WebGUI',6,'Redigera stil',1031510000);
INSERT INTO international VALUES (157,'WebGUI',6,'Stilar',1031510000);
INSERT INTO international VALUES (158,'WebGUI',6,'L�gg till en ny stil.',1031510000);
INSERT INTO international VALUES (159,'WebGUI',6,'Inbox',1031649349);
INSERT INTO international VALUES (160,'WebGUI',6,'Inlagt den',1031510000);
INSERT INTO international VALUES (161,'WebGUI',6,'Skrivet av',1031510000);
INSERT INTO international VALUES (162,'WebGUI',6,'�r du s�ker p� att du vill ta bort allt ur skr�pkorgen?',1031510000);
INSERT INTO international VALUES (163,'WebGUI',6,'L�gg till anv�ndare',1031510000);
INSERT INTO international VALUES (164,'WebGUI',6,'Autentiserings metod',1031510000);
INSERT INTO international VALUES (165,'WebGUI',6,'LDAP URL',1031510000);
INSERT INTO international VALUES (166,'WebGUI',6,'Connect DN',1031510000);
INSERT INTO international VALUES (167,'WebGUI',6,'�r du absolut s�ker att du vill radera denna anv�ndare? Var medveten om att all information om denna anv�ndare kommer att vara permanent f�rlorade om du forts�tter.',1031510000);
INSERT INTO international VALUES (168,'WebGUI',6,'Redigera anv�ndare',1031649411);
INSERT INTO international VALUES (169,'WebGUI',6,'L�gg till en ny anv�ndare.',1031510000);
INSERT INTO international VALUES (170,'WebGUI',6,'s�k',1031510000);
INSERT INTO international VALUES (171,'WebGUI',6,'rich edit',1031510000);
INSERT INTO international VALUES (174,'WebGUI',6,'Visa titel?',1031510000);
INSERT INTO international VALUES (175,'WebGUI',6,'K�r makron?',1031649373);
INSERT INTO international VALUES (228,'WebGUI',6,'Redigerar meddelande...',1031648121);
INSERT INTO international VALUES (229,'WebGUI',6,'�mne',1031648152);
INSERT INTO international VALUES (230,'WebGUI',6,'Meddelande',1031510000);
INSERT INTO international VALUES (231,'WebGUI',6,'Skickar nytt meddelande...',1031510000);
INSERT INTO international VALUES (232,'WebGUI',6,'inget �mne',1031583873);
INSERT INTO international VALUES (233,'WebGUI',6,'(eom)',1031510000);
INSERT INTO international VALUES (234,'WebGUI',6,'Skickar svar...',1031510000);
INSERT INTO international VALUES (237,'WebGUI',6,'�mne:',1031583849);
INSERT INTO international VALUES (238,'WebGUI',6,'F�rfattare:',1031510000);
INSERT INTO international VALUES (239,'WebGUI',6,'Datum:',1031510000);
INSERT INTO international VALUES (240,'WebGUI',6,'Meddelande-ID:',1031583887);
INSERT INTO international VALUES (244,'WebGUI',6,'F�rfattare',1031510000);
INSERT INTO international VALUES (245,'WebGUI',6,'Datum',1031510000);
INSERT INTO international VALUES (304,'WebGUI',6,'Spr�k',1031510000);
INSERT INTO international VALUES (306,'WebGUI',6,'Anv�ndarnamn Bindning',1031648142);
INSERT INTO international VALUES (307,'WebGUI',6,'Anv�nd den vanliga meta tagen?',1031510000);
INSERT INTO international VALUES (308,'WebGUI',6,'Redigera profilinst�llningar',1031510000);
INSERT INTO international VALUES (309,'WebGUI',6,'Till�t riktigt namn?',1031510000);
INSERT INTO international VALUES (310,'WebGUI',6,'Till�t extra kontaktinformation?',1031510000);
INSERT INTO international VALUES (311,'WebGUI',6,'Till�t heminformation?',1031510000);
INSERT INTO international VALUES (312,'WebGUI',6,'Till�t f�retagsinformation?',1031510000);
INSERT INTO international VALUES (313,'WebGUI',6,'Till�t extra informaiton?',1031510000);
INSERT INTO international VALUES (314,'WebGUI',6,'F�rnamn',1031510000);
INSERT INTO international VALUES (315,'WebGUI',6,'Mellannamn',1031510000);
INSERT INTO international VALUES (316,'WebGUI',6,'Efternamn',1031510000);
INSERT INTO international VALUES (317,'WebGUI',6,'ICQ UIN',1031510000);
INSERT INTO international VALUES (318,'WebGUI',6,'AIM Id',1031510000);
INSERT INTO international VALUES (319,'WebGUI',6,'MSN Messenger Id',1031510000);
INSERT INTO international VALUES (320,'WebGUI',6,'Yahoo! Messenger Id',1031510000);
INSERT INTO international VALUES (321,'WebGUI',6,'Mobilnummer',1031648173);
INSERT INTO international VALUES (322,'WebGUI',6,'Persons�kare',1031510000);
INSERT INTO international VALUES (323,'WebGUI',6,'Hem adress',1031510000);
INSERT INTO international VALUES (324,'WebGUI',6,'Hem stad',1031510000);
INSERT INTO international VALUES (325,'WebGUI',6,'Hem l�n',1031510000);
INSERT INTO international VALUES (326,'WebGUI',6,'Hem postnummer',1031510000);
INSERT INTO international VALUES (327,'WebGUI',6,'Hem land',1031510000);
INSERT INTO international VALUES (328,'WebGUI',6,'Hem telefon',1031510000);
INSERT INTO international VALUES (329,'WebGUI',6,'Arbete adress',1031648204);
INSERT INTO international VALUES (330,'WebGUI',6,'Arbete stad',1031648188);
INSERT INTO international VALUES (331,'WebGUI',6,'Arbete l�n',1031648292);
INSERT INTO international VALUES (332,'WebGUI',6,'Arbete postnummer',1031648218);
INSERT INTO international VALUES (333,'WebGUI',6,'Arbete land',1031648266);
INSERT INTO international VALUES (334,'WebGUI',6,'Arbete telefon',1031648277);
INSERT INTO international VALUES (335,'WebGUI',6,'K�n',1031510000);
INSERT INTO international VALUES (336,'WebGUI',6,'F�delsedatum',1031510000);
INSERT INTO international VALUES (337,'WebGUI',6,'Hemsida (URL)',1031584026);
INSERT INTO international VALUES (338,'WebGUI',6,'Redigera profil',1031510000);
INSERT INTO international VALUES (339,'WebGUI',6,'Man',1031510000);
INSERT INTO international VALUES (340,'WebGUI',6,'Kvinna',1031510000);
INSERT INTO international VALUES (341,'WebGUI',6,'Redigera profil.',1031510000);
INSERT INTO international VALUES (342,'WebGUI',6,'Redigera kontoinformation.',1031510000);
INSERT INTO international VALUES (343,'WebGUI',6,'Visa profil.',1031510000);
INSERT INTO international VALUES (345,'WebGUI',6,'Inte en medlem',1031510000);
INSERT INTO international VALUES (346,'WebGUI',6,'Denna anv�ndare �r inte l�ngre medlem p� v�r webbplats. Vi har ingen vidare information om anv�ndaren.',1032859632);
INSERT INTO international VALUES (347,'WebGUI',6,'Visa profilen f�r',1031510000);
INSERT INTO international VALUES (348,'WebGUI',6,'Namn',1031510000);
INSERT INTO international VALUES (349,'WebGUI',6,'Senaste tillg�ngliga version',1031510000);
INSERT INTO international VALUES (350,'WebGUI',6,'Avslutad',1031510000);
INSERT INTO international VALUES (351,'WebGUI',6,'Meddelande',1031584059);
INSERT INTO international VALUES (352,'WebGUI',6,'Skapat datum',1031510000);
INSERT INTO international VALUES (353,'WebGUI',6,'Du har inga meddelanden i din Inbox just nu.',1031584097);
INSERT INTO international VALUES (354,'WebGUI',6,'Visa Inbox.',1031584128);
INSERT INTO international VALUES (355,'WebGUI',6,'Standard',1031510000);
INSERT INTO international VALUES (356,'WebGUI',6,'Mall',1031510000);
INSERT INTO international VALUES (357,'WebGUI',6,'Nyheter',1031510000);
INSERT INTO international VALUES (358,'WebGUI',6,'V�nster kolumn',1031510000);
INSERT INTO international VALUES (359,'WebGUI',6,'H�ger kolumn',1031510000);
INSERT INTO international VALUES (360,'WebGUI',6,'En �ver tre',1031510000);
INSERT INTO international VALUES (361,'WebGUI',6,'Tre �ver en',1031510000);
INSERT INTO international VALUES (362,'WebGUI',6,'Sida vid sida',1031648324);
INSERT INTO international VALUES (363,'WebGUI',6,'Mall-position',1031648339);
INSERT INTO international VALUES (364,'WebGUI',6,'S�k',1031510000);
INSERT INTO international VALUES (365,'WebGUI',6,'S�kresultaten..',1031510000);
INSERT INTO international VALUES (366,'WebGUI',6,'Inga sidor hittades som st�mde med din f�rfr�gan.',1031510000);
INSERT INTO international VALUES (368,'WebGUI',6,'L�gg till en ny grupp till denna anv�ndare.',1031510000);
INSERT INTO international VALUES (369,'WebGUI',6,'B�st f�re datum',1031648357);
INSERT INTO international VALUES (370,'WebGUI',6,'Redigera gruppering',1031510000);
INSERT INTO international VALUES (371,'WebGUI',6,'L�gg till gruppering',1031510000);
INSERT INTO international VALUES (372,'WebGUI',6,'Redigera anv�ndares grupper',1032859654);
INSERT INTO international VALUES (374,'WebGUI',6,'Hantera paket.',1031510000);
INSERT INTO international VALUES (375,'WebGUI',6,'V�lj ett paket att anv�nda',1031510000);
INSERT INTO international VALUES (376,'WebGUI',6,'Paket',1031510000);
INSERT INTO international VALUES (377,'WebGUI',6,'Inga paket har definierats av din pakethanterare eller administrat�r.',1031581099);
INSERT INTO international VALUES (11,'Poll',6,'R�sta!',1031510000);
INSERT INTO international VALUES (31,'USS',6,'Inneh�ll',1031648476);
INSERT INTO international VALUES (32,'USS',6,'Bild',1031510000);
INSERT INTO international VALUES (33,'USS',6,'Bilaga',1031648631);
INSERT INTO international VALUES (34,'USS',6,'Konvertera radbrytningar',1031510000);
INSERT INTO international VALUES (35,'USS',6,'Titel',1031510000);
INSERT INTO international VALUES (36,'USS',6,'Radera fil.',1031510000);
INSERT INTO international VALUES (378,'WebGUI',6,'Anv�ndar-ID',1031581110);
INSERT INTO international VALUES (379,'WebGUI',6,'Grupp-ID',1031581117);
INSERT INTO international VALUES (380,'WebGUI',6,'Stil-ID',1031581134);
INSERT INTO international VALUES (381,'WebGUI',6,'WebGUI fick in en felformulerad f�rfr�gan och kunde inte forts�tta. Oftast beror detta p� ovanliga tecken som skickas fr�n ett formul�r. Du kan f�rs�ka med att g� tillbaka och f�rs�ka igen.',1031510000);
INSERT INTO international VALUES (1,'FileManager',6,'Filhanterare',1031510000);
INSERT INTO international VALUES (2,'FileManager',6,'L�gg till filhanterare',1031581035);
INSERT INTO international VALUES (3,'FileManager',6,'Forts�tt med att l�gga till fil?',1031510000);
INSERT INTO international VALUES (4,'FileManager',6,'L�gg till nedladdning',1031581043);
INSERT INTO international VALUES (5,'FileManager',6,'Filens titel',1032859258);
INSERT INTO international VALUES (6,'FileManager',6,'Ladda ned fil',1031510000);
INSERT INTO international VALUES (7,'FileManager',6,'Grupp f�r nedladdning',1031510000);
INSERT INTO international VALUES (8,'FileManager',6,'Kort beskrivning',1031649429);
INSERT INTO international VALUES (9,'FileManager',6,'Redigera filhanterare',1031649529);
INSERT INTO international VALUES (10,'FileManager',6,'Redigera nedladdning',1032859231);
INSERT INTO international VALUES (11,'FileManager',6,'L�gg till en ny nedladdning.',1031510000);
INSERT INTO international VALUES (12,'FileManager',6,'�r du s�ker p� att du vill ta bort denna nedladdning?',1031510000);
INSERT INTO international VALUES (13,'FileManager',6,'Radera',1031510000);
INSERT INTO international VALUES (14,'FileManager',6,'Fil',1031510000);
INSERT INTO international VALUES (15,'FileManager',6,'Beskrivning',1031510000);
INSERT INTO international VALUES (16,'FileManager',6,'Uppladdat den',1032859243);
INSERT INTO international VALUES (15,'Article',6,'H�ger',1031510000);
INSERT INTO international VALUES (16,'Article',6,'V�nster',1031510000);
INSERT INTO international VALUES (17,'Article',6,'Centrera',1031510000);
INSERT INTO international VALUES (37,'USS',6,'Radera',1031510000);
INSERT INTO international VALUES (13,'SQLReport',6,'Konvertera radbrytning?',1031510000);
INSERT INTO international VALUES (17,'FileManager',6,'Alternativ version #1',1032859401);
INSERT INTO international VALUES (18,'FileManager',6,'Alternativ version #2',1032859416);
INSERT INTO international VALUES (19,'FileManager',6,'Du har inga filer att ladda ned.',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',6,'Start datum',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',6,'Slut datum',1031510000);
INSERT INTO international VALUES (20,'FileManager',6,'Sidbrytning efter',1031510000);
INSERT INTO international VALUES (14,'SQLReport',6,'Sidbrytning efter',1031510000);
INSERT INTO international VALUES (16,'EventsCalendar',6,'Kalenderutseende',1031841894);
INSERT INTO international VALUES (17,'EventsCalendar',6,'Lista',1031510000);
INSERT INTO international VALUES (18,'EventsCalendar',6,'Kalenderm�nad',1031649486);
INSERT INTO international VALUES (19,'EventsCalendar',6,'Sidbrytning efter',1031510000);
INSERT INTO international VALUES (354,'WebGUI',1,'View Inbox.',1031514049);
INSERT INTO international VALUES (383,'WebGUI',6,'Namn',1031510000);
INSERT INTO international VALUES (384,'WebGUI',6,'Fil',1031510000);
INSERT INTO international VALUES (385,'WebGUI',6,'Parametrar',1031510000);
INSERT INTO international VALUES (386,'WebGUI',6,'Redigera bild',1031581152);
INSERT INTO international VALUES (387,'WebGUI',6,'Uppladdat av',1031581166);
INSERT INTO international VALUES (388,'WebGUI',6,'Uppladdat den',1031581182);
INSERT INTO international VALUES (389,'WebGUI',6,'Bild-ID',1031581500);
INSERT INTO international VALUES (390,'WebGUI',6,'Visar bild...',1031510000);
INSERT INTO international VALUES (391,'WebGUI',6,'Radera',1031510000);
INSERT INTO international VALUES (392,'WebGUI',6,'�r du s�ker p� att du vill radera denna bild?',1031510000);
INSERT INTO international VALUES (393,'WebGUI',6,'Hantera bilder',1031582466);
INSERT INTO international VALUES (394,'WebGUI',6,'Hantera bilder.',1031510000);
INSERT INTO international VALUES (395,'WebGUI',6,'L�gg till en ny bild.',1031510000);
INSERT INTO international VALUES (396,'WebGUI',6,'Visa bild',1031510000);
INSERT INTO international VALUES (397,'WebGUI',6,'Tillbaka till bildlistan.',1031510000);
INSERT INTO international VALUES (398,'WebGUI',6,'Dokumenttypsdeklaration',1032859737);
INSERT INTO international VALUES (399,'WebGUI',6,'Validera denna sida.',1031510000);
INSERT INTO international VALUES (400,'WebGUI',6,'Blockera proxy caching',1031582451);
INSERT INTO international VALUES (401,'WebGUI',6,'�r du s�ker p� att du vill radera meddelandet och alla undermeddelanden i denna tr�d?',1031582487);
INSERT INTO international VALUES (565,'WebGUI',6,'Vem kan moderera?',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',6,'Radera meddelandet',1031649828);
INSERT INTO international VALUES (402,'WebGUI',6,'Meddelandet du fr�gade efter existerar inte.',1032859672);
INSERT INTO international VALUES (403,'WebGUI',6,'F�redrar att inte s�ga.',1031510000);
INSERT INTO international VALUES (405,'WebGUI',6,'Sista sidan',1031510000);
INSERT INTO international VALUES (407,'WebGUI',6,'Klicka h�r f�r att registrera.',1031510000);
INSERT INTO international VALUES (15,'SQLReport',6,'K�r macron vid f�rfr�gan?',1031651307);
INSERT INTO international VALUES (16,'SQLReport',6,'Debug?',1031510000);
INSERT INTO international VALUES (17,'SQLReport',6,'&lt;b&gt;Debug:&lt;/b&gt; F�rfr�gan(query):',1031510000);
INSERT INTO international VALUES (18,'SQLReport',6,'Det fanns inga resultat f�r denna f�rfr�gan.',1031510000);
INSERT INTO international VALUES (408,'WebGUI',6,'Hantera bassidor (roots)',1031582598);
INSERT INTO international VALUES (409,'WebGUI',6,'L�gg till en ny bassida.',1031510000);
INSERT INTO international VALUES (410,'WebGUI',6,'Hantera bassidor.',1031510000);
INSERT INTO international VALUES (411,'WebGUI',6,'Huvudtitel',1031582640);
INSERT INTO international VALUES (412,'WebGUI',6,'Synopsis',1031510000);
INSERT INTO international VALUES (9,'SiteMap',6,'Visa synopsis?',1031510000);
INSERT INTO international VALUES (18,'Article',6,'Till�t diskussion?',1031841978);
INSERT INTO international VALUES (6,'Product',1,'Edit Product',1031514049);
INSERT INTO international VALUES (4,'Product',1,'Are you certain you wish to delete the relationship to this related product?',1031514049);
INSERT INTO international VALUES (22,'Article',6,'F�rfattare',1031510000);
INSERT INTO international VALUES (23,'Article',6,'Datum',1031510000);
INSERT INTO international VALUES (24,'Article',6,'Skicka svar',1031510000);
INSERT INTO international VALUES (578,'WebGUI',1,'You have a pending message to approve.',1031514049);
INSERT INTO international VALUES (27,'Article',6,'Tillbaka till artikel',1031510000);
INSERT INTO international VALUES (28,'Article',6,'Visa svar',1031510000);
INSERT INTO international VALUES (54,'Product',1,'Benefits',1031514049);
INSERT INTO international VALUES (416,'WebGUI',6,'<h1>Problem med f�rfr�gan</h1>\r\nVi har st�tt p� ett problem med din f�rfr�gan. Var v�nlig och g� tillbaka och f�s�k igen. Om problemet kvarst�r var v�nlig och rapportera detta till oss med tid och datum samt vad du f�rs�kte g�ra.',1031582660);
INSERT INTO international VALUES (417,'WebGUI',6,'<h1>S�kerhets�vertr�delse</h1><br>Du f�rs�kte att komma �t en wobject som inte associeras med denna sida. Denna incident har rapporterats.',1032859766);
INSERT INTO international VALUES (418,'WebGUI',6,'Ta bort inmatad HTML',1031510000);
INSERT INTO international VALUES (419,'WebGUI',6,'Ta bort alla taggar.',1031510000);
INSERT INTO international VALUES (420,'WebGUI',6,'L�mna som den �r.',1031510000);
INSERT INTO international VALUES (421,'WebGUI',6,'Ta bort allt utom grundformateringen.',1031510000);
INSERT INTO international VALUES (422,'WebGUI',6,'&lt;h1&gt;Inloggning misslyckades&lt;/h1&gt;\r\nInformationen du gav st�mmer inte med kontot.',1031510000);
INSERT INTO international VALUES (423,'WebGUI',6,'Visa aktiva sessioner.',1031510000);
INSERT INTO international VALUES (424,'WebGUI',6,'Visa inloggningshistorik.',1031582778);
INSERT INTO international VALUES (425,'WebGUI',6,'Aktiva sessioner',1031510000);
INSERT INTO international VALUES (426,'WebGUI',6,'Inloggningshistorik',1031582752);
INSERT INTO international VALUES (427,'WebGUI',6,'Stilar',1031510000);
INSERT INTO international VALUES (428,'WebGUI',6,'Anv�ndar-ID',1031582798);
INSERT INTO international VALUES (429,'WebGUI',6,'Inloggningstid',1031583069);
INSERT INTO international VALUES (430,'WebGUI',6,'Senaste sida visad',1031510000);
INSERT INTO international VALUES (431,'WebGUI',6,'IP-adress',1031582843);
INSERT INTO international VALUES (432,'WebGUI',6,'B�st f�re',1031510000);
INSERT INTO international VALUES (433,'WebGUI',6,'Anv�ndarklient (webbl�sare)',1031582872);
INSERT INTO international VALUES (434,'WebGUI',6,'Status',1031510000);
INSERT INTO international VALUES (435,'WebGUI',6,'Sessions-signatur',1031582926);
INSERT INTO international VALUES (436,'WebGUI',6,'Avsluta session',1031510000);
INSERT INTO international VALUES (437,'WebGUI',6,'Statistik',1031510000);
INSERT INTO international VALUES (438,'WebGUI',6,'Ditt namn',1031510000);
INSERT INTO international VALUES (439,'WebGUI',6,'Personlig information',1031582964);
INSERT INTO international VALUES (440,'WebGUI',6,'Kontaktinformation',1031582615);
INSERT INTO international VALUES (441,'WebGUI',6,'E-post till persons�kar-gateway',1031582891);
INSERT INTO international VALUES (442,'WebGUI',6,'Arbetsinformation',1031583936);
INSERT INTO international VALUES (443,'WebGUI',6,'Heminformation',1031648066);
INSERT INTO international VALUES (444,'WebGUI',6,'Demografisk Information',1031510000);
INSERT INTO international VALUES (445,'WebGUI',6,'Inst�llningar',1031510000);
INSERT INTO international VALUES (446,'WebGUI',6,'Arbetets Website',1031510000);
INSERT INTO international VALUES (447,'WebGUI',6,'Hantera sidtr�d.',1031510000);
INSERT INTO international VALUES (448,'WebGUI',6,'Sidtr�d',1031583051);
INSERT INTO international VALUES (449,'WebGUI',6,'�vrig information',1031510000);
INSERT INTO international VALUES (450,'WebGUI',6,'F�retagsnamn',1031582830);
INSERT INTO international VALUES (451,'WebGUI',6,'�r obligatoriskt.',1031510000);
INSERT INTO international VALUES (452,'WebGUI',6,'Var god v�nta...',1031510000);
INSERT INTO international VALUES (453,'WebGUI',6,'Skapad den',1031510000);
INSERT INTO international VALUES (454,'WebGUI',6,'Senast uppdaterad',1031583228);
INSERT INTO international VALUES (455,'WebGUI',6,'Redigera Anv�ndar Profil',1031510000);
INSERT INTO international VALUES (456,'WebGUI',6,'Tillbaka till anv�ndarlistan.',1031510000);
INSERT INTO international VALUES (457,'WebGUI',6,'Redigera denna anv�ndares konto.',1031510000);
INSERT INTO international VALUES (458,'WebGUI',6,'Redigera denna anv�ndares grupper.',1031510000);
INSERT INTO international VALUES (459,'WebGUI',6,'Redigera denna anv�ndares profil.',1031510000);
INSERT INTO international VALUES (460,'WebGUI',6,'Tidsoffset',1031510000);
INSERT INTO international VALUES (461,'WebGUI',6,'Datumformat',1031583703);
INSERT INTO international VALUES (462,'WebGUI',6,'Tidsformat',1031583793);
INSERT INTO international VALUES (463,'WebGUI',6,'Textf�lt, rader',1032859800);
INSERT INTO international VALUES (464,'WebGUI',6,'Textf�lt, kolumner',1032859816);
INSERT INTO international VALUES (465,'WebGUI',6,'Textruta, storlek',1032859827);
INSERT INTO international VALUES (466,'WebGUI',6,'�r du s�ker p� att du vill ta bort denna kategori och flytta alla dess attribut till �vrigt-kategorin.',1031583816);
INSERT INTO international VALUES (467,'WebGUI',6,'�r du s�ker p� att du vill ta bort detta attribut och all anv�ndar data som finns i det ?',1031510000);
INSERT INTO international VALUES (468,'WebGUI',1,'Edit User Profile Category',1031514049);
INSERT INTO international VALUES (469,'WebGUI',6,'Id',1031510000);
INSERT INTO international VALUES (470,'WebGUI',6,'Namn',1031510000);
INSERT INTO international VALUES (159,'WebGUI',1,'Inbox',1031514049);
INSERT INTO international VALUES (472,'WebGUI',6,'M�rke',1031510000);
INSERT INTO international VALUES (473,'WebGUI',6,'Synligt?',1031510000);
INSERT INTO international VALUES (474,'WebGUI',6,'Obligatoriskt?',1031510000);
INSERT INTO international VALUES (475,'WebGUI',6,'Text',1031510000);
INSERT INTO international VALUES (476,'WebGUI',6,'Textomr�de',1031580764);
INSERT INTO international VALUES (477,'WebGUI',6,'HTML-omr�de',1031580775);
INSERT INTO international VALUES (478,'WebGUI',6,'URL',1031510000);
INSERT INTO international VALUES (479,'WebGUI',6,'Datum',1031510000);
INSERT INTO international VALUES (480,'WebGUI',6,'E-postadress',1031580789);
INSERT INTO international VALUES (481,'WebGUI',6,'Telefonnummer',1031580799);
INSERT INTO international VALUES (482,'WebGUI',6,'Nummer (Heltal)',1031510000);
INSERT INTO international VALUES (483,'WebGUI',6,'Ja eller Nej',1031510000);
INSERT INTO international VALUES (484,'WebGUI',6,'Vallista',1031510000);
INSERT INTO international VALUES (485,'WebGUI',6,'Boolean (Kryssbox)',1031510000);
INSERT INTO international VALUES (486,'WebGUI',6,'Data typ',1031510000);
INSERT INTO international VALUES (487,'WebGUI',6,'M�jliga v�rden',1031510000);
INSERT INTO international VALUES (488,'WebGUI',6,'Standardv�rden',1031580822);
INSERT INTO international VALUES (489,'WebGUI',6,'Profilkategorier.',1031580898);
INSERT INTO international VALUES (490,'WebGUI',6,'L�gg till en profilkategori.',1031510000);
INSERT INTO international VALUES (491,'WebGUI',6,'L�gg till profilattribut.',1031510000);
INSERT INTO international VALUES (492,'WebGUI',6,'Profilattribut, lista.',1031580860);
INSERT INTO international VALUES (493,'WebGUI',6,'Tillbaka till webbplatsen.',1032434829);
INSERT INTO international VALUES (507,'WebGUI',1,'Edit Template',1031514049);
INSERT INTO international VALUES (508,'WebGUI',1,'Manage templates.',1031514049);
INSERT INTO international VALUES (39,'USS',1,'Post a Reply',1031514049);
INSERT INTO international VALUES (41,'USS',1,'Date',1031514049);
INSERT INTO international VALUES (8,'Product',1,'Product Image 2',1031514049);
INSERT INTO international VALUES (1,'Product',1,'Product',1031514049);
INSERT INTO international VALUES (45,'USS',1,'Return to Submission',1031514049);
INSERT INTO international VALUES (46,'USS',1,'Read more...',1031514049);
INSERT INTO international VALUES (47,'USS',1,'Post a Response',1031514049);
INSERT INTO international VALUES (48,'USS',1,'Allow discussion?',1031514049);
INSERT INTO international VALUES (571,'WebGUI',1,'Unlock Thread',1031514049);
INSERT INTO international VALUES (569,'WebGUI',1,'Moderation Type',1031514049);
INSERT INTO international VALUES (567,'WebGUI',1,'Pre-emptive',1031514049);
INSERT INTO international VALUES (51,'USS',1,'Display thumbnails?',1031514049);
INSERT INTO international VALUES (52,'USS',1,'Thumbnail',1031514049);
INSERT INTO international VALUES (53,'USS',1,'Layout',1031514049);
INSERT INTO international VALUES (57,'USS',1,'Responses',1031514049);
INSERT INTO international VALUES (11,'FAQ',1,'Turn TOC on?',1031514049);
INSERT INTO international VALUES (12,'FAQ',1,'Turn Q/A on?',1031514049);
INSERT INTO international VALUES (13,'FAQ',1,'Turn [top] link on?',1031514049);
INSERT INTO international VALUES (509,'WebGUI',1,'Discussion Layout',1031514049);
INSERT INTO international VALUES (510,'WebGUI',1,'Flat',1031514049);
INSERT INTO international VALUES (511,'WebGUI',1,'Threaded',1031514049);
INSERT INTO international VALUES (512,'WebGUI',1,'Next Thread',1031514049);
INSERT INTO international VALUES (513,'WebGUI',1,'Previous Thread',1031514049);
INSERT INTO international VALUES (8,'Article',10,'henvisning URL',1031510000);
INSERT INTO international VALUES (9,'Article',10,'Vis besvarelser',1031510000);
INSERT INTO international VALUES (10,'Article',10,'Konverter linieskift?',1031510000);
INSERT INTO international VALUES (11,'Article',10,'\"(Kontroller at du ikke tilf�jer &lt;br&gt; manuelt.)\"',1031510000);
INSERT INTO international VALUES (12,'Article',10,'rediger artikel',1031510000);
INSERT INTO international VALUES (13,'Article',10,'Slet',1031510000);
INSERT INTO international VALUES (14,'Article',10,'Placer billede',1031510000);
INSERT INTO international VALUES (15,'Article',10,'H�jre',1031510000);
INSERT INTO international VALUES (16,'Article',10,'Venstre',1031510000);
INSERT INTO international VALUES (17,'Article',10,'Centreret',1031510000);
INSERT INTO international VALUES (18,'Article',10,'Tillad diskussion?',1031510000);
INSERT INTO international VALUES (3,'Product',1,'Are you certain you wish to delete this feature?',1031514049);
INSERT INTO international VALUES (22,'Article',10,'Forfatter',1031510000);
INSERT INTO international VALUES (23,'Article',10,'Dato',1031510000);
INSERT INTO international VALUES (24,'Article',10,'Send respons',1031510000);
INSERT INTO international VALUES (580,'WebGUI',1,'Your message has been denied.',1031514049);
INSERT INTO international VALUES (27,'Article',10,'Tilbage til artikel',1031510000);
INSERT INTO international VALUES (28,'Article',10,'Vis respons',1031510000);
INSERT INTO international VALUES (1,'FileManager',10,'Download Manager',1031510000);
INSERT INTO international VALUES (2,'FileManager',10,'Tilf�j Download Manager',1031510000);
INSERT INTO international VALUES (3,'FileManager',10,'Forts�t med at tilf�je fil?',1031510000);
INSERT INTO international VALUES (4,'FileManager',10,'Tilf�j Download',1031510000);
INSERT INTO international VALUES (5,'FileManager',10,'Navn p� fil',1031510000);
INSERT INTO international VALUES (6,'FileManager',10,'Hent fil',1031510000);
INSERT INTO international VALUES (7,'FileManager',10,'Gruppe til Download',1031510000);
INSERT INTO international VALUES (8,'FileManager',10,'Kort beskrivelse',1031510000);
INSERT INTO international VALUES (9,'FileManager',10,'rediger Download Manager',1031510000);
INSERT INTO international VALUES (10,'FileManager',10,'rediger Download  ',1031510000);
INSERT INTO international VALUES (11,'FileManager',10,'Tilf�j ny Download',1031510000);
INSERT INTO international VALUES (12,'FileManager',10,'Er du sikker p� du vil slette denne Download?',1031510000);
INSERT INTO international VALUES (13,'FileManager',10,'Slet tilf�jet fil?',1031510000);
INSERT INTO international VALUES (14,'FileManager',10,'Fil',1031510000);
INSERT INTO international VALUES (15,'FileManager',10,'Beskrivelse',1031510000);
INSERT INTO international VALUES (16,'FileManager',10,'Oprettelsesdato',1031510000);
INSERT INTO international VALUES (17,'FileManager',10,'Alternativ version nr. 1',1031510000);
INSERT INTO international VALUES (18,'FileManager',10,'Alternativ version nr. 2',1031510000);
INSERT INTO international VALUES (19,'FileManager',10,'Du har ikke nogen filer til Download',1031510000);
INSERT INTO international VALUES (20,'FileManager',10,'Slet efter',1031510000);
INSERT INTO international VALUES (21,'FileManager',10,'Hvis miniature?',1031510000);
INSERT INTO international VALUES (1,'EventsCalendar',10,'Forts�t med at tilf�je begivenhed?',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',10,'Begivenheds kalender',1031510000);
INSERT INTO international VALUES (3,'EventsCalendar',10,'Tilf�j begivenheds kalender',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',10,'Begivenhed sker �n gang',1031510000);
INSERT INTO international VALUES (700,'WebGUI',10,'dag',1031510000);
INSERT INTO international VALUES (701,'WebGUI',10,'uge',1031510000);
INSERT INTO international VALUES (7,'EventsCalendar',10,'Tilf�j begivenhed ',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',10,'Gentages hver',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',10,'indtil',1031510000);
INSERT INTO international VALUES (61,'Product',1,'Product Template',1031514049);
INSERT INTO international VALUES (12,'EventsCalendar',10,'rediger begivenheds kalender',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',10,'rediger begivenhed ',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',10,'Fra dato',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',10,'Til dato',1031510000);
INSERT INTO international VALUES (16,'EventsCalendar',10,'Kalender layout',1031510000);
INSERT INTO international VALUES (17,'EventsCalendar',10,'Liste',1031510000);
INSERT INTO international VALUES (18,'EventsCalendar',10,'Calendar Month',1031510000);
INSERT INTO international VALUES (19,'EventsCalendar',10,'Slet efter ',1031510000);
INSERT INTO international VALUES (1,'ExtraColumn',10,'Ekstra kolonne',1031510000);
INSERT INTO international VALUES (2,'ExtraColumn',10,'Tilf�j ekstra kolonne',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',10,'Mellemrum',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',10,'Bredde',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',10,'stilarter klasse',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',10,'rediger ekstra kolonne',1031510000);
INSERT INTO international VALUES (74,'FAQ',1,'Template',1036260684);
INSERT INTO international VALUES (2,'FAQ',10,'Ofte stillede sp�rgsm�l (F.A.Q.)',1031510000);
INSERT INTO international VALUES (3,'FAQ',10,'Tilf�j F.A.Q.',1031510000);
INSERT INTO international VALUES (4,'FAQ',10,'Tilf�j sp�rgsm�l',1031510000);
INSERT INTO international VALUES (5,'FAQ',10,'Sp�rgsm�l',1031510000);
INSERT INTO international VALUES (6,'FAQ',10,'Svar',1031510000);
INSERT INTO international VALUES (7,'FAQ',10,'Er du sikker p� du vil slette dette sp�rgsm�l',1031510000);
INSERT INTO international VALUES (8,'FAQ',10,'Rediger F.A.Q.',1031510000);
INSERT INTO international VALUES (9,'FAQ',10,'Tilf�j nyt sp�rgsm�l',1031510000);
INSERT INTO international VALUES (10,'FAQ',10,'rediger sp�rgsm�l',1031510000);
INSERT INTO international VALUES (1,'Item',10,'henvisning URL',1031510000);
INSERT INTO international VALUES (2,'Item',10,'Vedh�ft',1031510000);
INSERT INTO international VALUES (3,'Item',10,'Slet vedh�ft',1031510000);
INSERT INTO international VALUES (4,'Item',10,'Item',1031510000);
INSERT INTO international VALUES (5,'Item',10,'Hent vedh�ftet',1031510000);
INSERT INTO international VALUES (1,'LinkList',10,'Indryk',1031510000);
INSERT INTO international VALUES (2,'LinkList',10,'Linie afstand',1031510000);
INSERT INTO international VALUES (3,'LinkList',10,'Skal der �bnes i nyt vindue?',1031510000);
INSERT INTO international VALUES (4,'LinkList',10,'Punkt',1031510000);
INSERT INTO international VALUES (5,'LinkList',10,'Forts�t med at tilf�je henvisning',1031510000);
INSERT INTO international VALUES (6,'LinkList',10,'Liste over henvisning',1031510000);
INSERT INTO international VALUES (7,'LinkList',10,'Tilf�j henvisning',1031510000);
INSERT INTO international VALUES (8,'LinkList',10,'URL',1031510000);
INSERT INTO international VALUES (9,'LinkList',10,'Er du sikker p� du vil slette denne henvisning',1031510000);
INSERT INTO international VALUES (10,'LinkList',10,'Rediger henvisnings liste',1031510000);
INSERT INTO international VALUES (11,'LinkList',10,'Tilf�j henvisnings liste',1031510000);
INSERT INTO international VALUES (12,'LinkList',10,'Rediger henvisning  ',1031510000);
INSERT INTO international VALUES (13,'LinkList',10,'Tilf�j ny henvisning',1031510000);
INSERT INTO international VALUES (1,'MessageBoard',10,'Tilf�j opslagstavle',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',10,'Opslagstavle',1031510000);
INSERT INTO international VALUES (564,'WebGUI',10,'Hvem kan komme med indl�g?',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',10,'Antal beskeder pr. side',1031510000);
INSERT INTO international VALUES (566,'WebGUI',10,'Rediger Timeout',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',10,'Rediger opslagstavle',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',10,'Forfatter:',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',10,'Dato:',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',10,'Besked nr.:',1031510000);
INSERT INTO international VALUES (10,'MessageBoard',10,'Forrige tr�d',1031510000);
INSERT INTO international VALUES (11,'MessageBoard',10,'Tilbage til oversigt',1031510000);
INSERT INTO international VALUES (12,'MessageBoard',10,'Rediger meddelelses',1031510000);
INSERT INTO international VALUES (577,'WebGUI',10,'Send respons',1031510000);
INSERT INTO international VALUES (14,'MessageBoard',10,'N�ste tr�d',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',10,'Forfatter',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',10,'Dato',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',10,'Ny meddelelse',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',10,'Tr�d startet',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',10,'Antal svar',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',10,'Seneste svar',1031510000);
INSERT INTO international VALUES (565,'WebGUI',10,'Hvem kan moderere?',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',10,'Slet besked',1031510000);
INSERT INTO international VALUES (1,'Poll',10,'Afstemning',1031510000);
INSERT INTO international VALUES (2,'Poll',10,'Tilf�j afstemning',1031510000);
INSERT INTO international VALUES (3,'Poll',10,'Aktiv',1031510000);
INSERT INTO international VALUES (4,'Poll',10,'Hvem kan stemme',1031510000);
INSERT INTO international VALUES (5,'Poll',10,'Bredde p� graf',1031510000);
INSERT INTO international VALUES (6,'Poll',10,'Sp�rgsm�l',1031510000);
INSERT INTO international VALUES (7,'Poll',10,'Svar',1031510000);
INSERT INTO international VALUES (8,'Poll',10,'(Indtast �t svar pr. linie. Ikke mere end 20.)',1031510000);
INSERT INTO international VALUES (9,'Poll',10,'Rediger afstemning',1031510000);
INSERT INTO international VALUES (10,'Poll',10,'Nulstil afstemning',1031510000);
INSERT INTO international VALUES (11,'Poll',10,'Stem!',1031510000);
INSERT INTO international VALUES (1,'SiteMap',10,'Tilf�j Site oversigt',1031510000);
INSERT INTO international VALUES (2,'SiteMap',10,'Site oversigt',1031510000);
INSERT INTO international VALUES (3,'SiteMap',10,'Startende fra dette niveau',1031510000);
INSERT INTO international VALUES (4,'SiteMap',10,'Dybde?',1031510000);
INSERT INTO international VALUES (5,'SiteMap',10,'Rediger Site oversigt',1031510000);
INSERT INTO international VALUES (6,'SiteMap',10,'Indryk',1031510000);
INSERT INTO international VALUES (7,'SiteMap',10,'Punkt',1031510000);
INSERT INTO international VALUES (8,'SiteMap',10,'Linie afstand',1031510000);
INSERT INTO international VALUES (9,'SiteMap',10,'Vis synopsis?',1031510000);
INSERT INTO international VALUES (1,'SQLReport',10,'SQL rapport',1031510000);
INSERT INTO international VALUES (2,'SQLReport',10,'Tilf�j SQL rapport',1031510000);
INSERT INTO international VALUES (3,'SQLReport',10,'Rapport template',1031510000);
INSERT INTO international VALUES (4,'SQLReport',10,'Query',1031510000);
INSERT INTO international VALUES (5,'SQLReport',10,'DSN',1031510000);
INSERT INTO international VALUES (6,'SQLReport',10,'Database bruger',1031510000);
INSERT INTO international VALUES (7,'SQLReport',10,'Database Password',1031510000);
INSERT INTO international VALUES (8,'SQLReport',10,'Rediger SQL rapport',1031510000);
INSERT INTO international VALUES (9,'SQLReport',10,'<b>Debug:</b> Error: The DSN specified is of an improper format.',1031510000);
INSERT INTO international VALUES (10,'SQLReport',10,'<b>Debug:</b> Error: The SQL specified is of an improper format.',1031510000);
INSERT INTO international VALUES (11,'SQLReport',10,'<b>Debug:</b> Error: There was a problem with the query.',1031510000);
INSERT INTO international VALUES (12,'SQLReport',10,'<b>Debug:</b> Error: Could not connect to the database.',1031510000);
INSERT INTO international VALUES (13,'SQLReport',10,'Konverter linieskift?',1031510000);
INSERT INTO international VALUES (14,'SQLReport',10,'Slet efter',1031510000);
INSERT INTO international VALUES (15,'SQLReport',10,'Udf�r makroer ved foresp�rgsel?',1031510000);
INSERT INTO international VALUES (16,'SQLReport',10,'Debut?',1031510000);
INSERT INTO international VALUES (17,'SQLReport',10,'<b>Debug:</b> Query:',1031510000);
INSERT INTO international VALUES (18,'SQLReport',10,'Der var ikke nogen svar til denne foresp�rgsel!',1031510000);
INSERT INTO international VALUES (1,'SyndicatedContent',10,'URL til RSS fil',1031510000);
INSERT INTO international VALUES (2,'SyndicatedContent',10,'Syndicated Content',1031510000);
INSERT INTO international VALUES (3,'SyndicatedContent',10,'Tilf�j Syndicated Content',1031510000);
INSERT INTO international VALUES (4,'SyndicatedContent',10,'Rediger Syndicated Content',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',10,'Sidst opdateret',1031510000);
INSERT INTO international VALUES (6,'SyndicatedContent',10,'G�ldende indhold',1031510000);
INSERT INTO international VALUES (1,'USS',10,'Hvem kan godkende indl�g?',1031510000);
INSERT INTO international VALUES (2,'USS',10,'Hvem kan tilf�je indl�g?',1031510000);
INSERT INTO international VALUES (3,'USS',10,'Du har nye indl�g til godkendelse',1031510000);
INSERT INTO international VALUES (4,'USS',10,'Dit indl�g er godkendt',1031510000);
INSERT INTO international VALUES (5,'USS',10,'Dit indl�g er afvist',1031510000);
INSERT INTO international VALUES (6,'USS',10,'Antal indl�g pr. side',1031510000);
INSERT INTO international VALUES (560,'WebGUI',10,'Godkendt',1031510000);
INSERT INTO international VALUES (561,'WebGUI',10,'Afvist',1031510000);
INSERT INTO international VALUES (562,'WebGUI',10,'Afventer',1031510000);
INSERT INTO international VALUES (563,'WebGUI',10,'Default Status',1031510000);
INSERT INTO international VALUES (11,'USS',10,'Tilf�j indl�g',1031510000);
INSERT INTO international VALUES (12,'USS',10,'(Kryds ikke hvis du laver et HTML indl�g.)',1031510000);
INSERT INTO international VALUES (13,'USS',10,'Tilf�jet dato',1031510000);
INSERT INTO international VALUES (14,'USS',10,'Status',1031510000);
INSERT INTO international VALUES (15,'USS',10,'Rediger/Slet',1031510000);
INSERT INTO international VALUES (16,'USS',10,'Ingen titel',1031510000);
INSERT INTO international VALUES (17,'USS',10,'Er du sikker p� du vil slette dette indl�g?',1031510000);
INSERT INTO international VALUES (18,'USS',10,'Rediger User Submission System',1031510000);
INSERT INTO international VALUES (19,'USS',10,'Rediger indl�g',1031510000);
INSERT INTO international VALUES (20,'USS',10,'Lav nyt indl�g',1031510000);
INSERT INTO international VALUES (21,'USS',10,'Indsendt af',1031510000);
INSERT INTO international VALUES (572,'WebGUI',10,'Godkendt',1031510000);
INSERT INTO international VALUES (573,'WebGUI',10,'Afvent ',1031510000);
INSERT INTO international VALUES (574,'WebGUI',10,'Afvist',1031510000);
INSERT INTO international VALUES (27,'USS',10,'Rediger',1031510000);
INSERT INTO international VALUES (28,'USS',10,'Tilbage til Submission oversigt',1031510000);
INSERT INTO international VALUES (29,'USS',10,'Bruger Indl�g',1031510000);
INSERT INTO international VALUES (31,'USS',10,'Indhold',1031510000);
INSERT INTO international VALUES (32,'USS',10,'Billede',1031510000);
INSERT INTO international VALUES (33,'USS',10,'Till�g',1031510000);
INSERT INTO international VALUES (34,'USS',10,'Konverter linieskift?',1031510000);
INSERT INTO international VALUES (35,'USS',10,'Titel',1031510000);
INSERT INTO international VALUES (36,'USS',10,'Slet fil.',1031510000);
INSERT INTO international VALUES (37,'USS',10,'Slet',1031510000);
INSERT INTO international VALUES (1,'WebGUI',10,'Tilf�j indhold',1031510000);
INSERT INTO international VALUES (2,'WebGUI',10,'Side',1031510000);
INSERT INTO international VALUES (3,'WebGUI',10,'Kopier fra udklipsholder',1031510000);
INSERT INTO international VALUES (4,'WebGUI',10,'administrer indstillinger',1031510000);
INSERT INTO international VALUES (5,'WebGUI',10,'administrer grupper',1031510000);
INSERT INTO international VALUES (6,'WebGUI',10,'administrer Stilarter',1031510000);
INSERT INTO international VALUES (7,'WebGUI',10,'administrer brugere',1031510000);
INSERT INTO international VALUES (8,'WebGUI',10,'Vis side_ikke_fundet',1031510000);
INSERT INTO international VALUES (9,'WebGUI',10,'Vis udklipsholder',1031510000);
INSERT INTO international VALUES (10,'WebGUI',10,'administrer skraldespand',1031510000);
INSERT INTO international VALUES (11,'WebGUI',10,'T�m skraldespand',1031510000);
INSERT INTO international VALUES (12,'WebGUI',10,'Sl� administration fra',1031510000);
INSERT INTO international VALUES (13,'WebGUI',10,'Vis hj�lpe indeks',1031510000);
INSERT INTO international VALUES (14,'WebGUI',10,'Vis afventende indl�g',1031510000);
INSERT INTO international VALUES (15,'WebGUI',10,'Januar',1031510000);
INSERT INTO international VALUES (16,'WebGUI',10,'Februar',1031510000);
INSERT INTO international VALUES (17,'WebGUI',10,'Marts',1031510000);
INSERT INTO international VALUES (18,'WebGUI',10,'April',1031510000);
INSERT INTO international VALUES (19,'WebGUI',10,'Maj',1031510000);
INSERT INTO international VALUES (20,'WebGUI',10,'Juni',1031510000);
INSERT INTO international VALUES (21,'WebGUI',10,'Juli',1031510000);
INSERT INTO international VALUES (22,'WebGUI',10,'August',1031510000);
INSERT INTO international VALUES (23,'WebGUI',10,'September',1031510000);
INSERT INTO international VALUES (24,'WebGUI',10,'Oktober',1031510000);
INSERT INTO international VALUES (25,'WebGUI',10,'November',1031510000);
INSERT INTO international VALUES (26,'WebGUI',10,'December',1031510000);
INSERT INTO international VALUES (27,'WebGUI',10,'S�ndag',1031510000);
INSERT INTO international VALUES (28,'WebGUI',10,'Mandag',1031510000);
INSERT INTO international VALUES (29,'WebGUI',10,'Tirsdag',1031510000);
INSERT INTO international VALUES (30,'WebGUI',10,'Onsdag',1031510000);
INSERT INTO international VALUES (31,'WebGUI',10,'Torsdag',1031510000);
INSERT INTO international VALUES (32,'WebGUI',10,'Fredag',1031510000);
INSERT INTO international VALUES (33,'WebGUI',10,'L�rdag',1031510000);
INSERT INTO international VALUES (34,'WebGUI',10,'S�t dato',1031510000);
INSERT INTO international VALUES (35,'WebGUI',10,'Administrative funktioner',1031510000);
INSERT INTO international VALUES (36,'WebGUI',10,'Du skal v�re administrator for at udf�re denne funktion. Kontakt en af f�lgende personer der er administratorer:',1031510000);
INSERT INTO international VALUES (37,'WebGUI',10,'Adgang n�gtet!',1031510000);
INSERT INTO international VALUES (38,'WebGUI',10,'\"Du har ikke n�dvendige rettigheder til at udf�re denne funktion. Venligst log in ^a(log in med en konto); med n�dvendige rettigheder f�r du pr�ver dette.\"',1031510000);
INSERT INTO international VALUES (39,'WebGUI',10,'Du har ikke rettigheder til at f� adgang til denne side.',1031510000);
INSERT INTO international VALUES (40,'WebGUI',10,'Vital komponent',1031510000);
INSERT INTO international VALUES (41,'WebGUI',10,'DU fors�ger at fjerne en VITAL system komponent. Hvis du fik lov til dette, ville systemet ikke virke mere �..',1031510000);
INSERT INTO international VALUES (42,'WebGUI',10,'Venligst bekr�ft',1031510000);
INSERT INTO international VALUES (43,'WebGUI',10,'Er du sikker p� du vil slette dette indhold?',1031510000);
INSERT INTO international VALUES (44,'WebGUI',10,'Ja, jeg er sikker!',1031510000);
INSERT INTO international VALUES (45,'WebGUI',10,'Nej, jeg lavede en fejl',1031510000);
INSERT INTO international VALUES (46,'WebGUI',10,'Min konto',1031510000);
INSERT INTO international VALUES (47,'WebGUI',10,'Hjem',1031510000);
INSERT INTO international VALUES (48,'WebGUI',10,'Hej',1031510000);
INSERT INTO international VALUES (49,'WebGUI',10,'\"Klik <a href=\"\"^\\;?op=logout\"\">her</a> for at logge ud.\"',1031510000);
INSERT INTO international VALUES (50,'WebGUI',10,'Brugernavn',1031510000);
INSERT INTO international VALUES (51,'WebGUI',10,'Kodeord',1031510000);
INSERT INTO international VALUES (52,'WebGUI',10,'Login',1031510000);
INSERT INTO international VALUES (53,'WebGUI',10,'Print side',1031510000);
INSERT INTO international VALUES (54,'WebGUI',10,'Opret konto',1031510000);
INSERT INTO international VALUES (55,'WebGUI',10,'Kodeord (bekr�ft)',1031510000);
INSERT INTO international VALUES (56,'WebGUI',10,'Email Adresse',1031510000);
INSERT INTO international VALUES (57,'WebGUI',10,'Dette er kun n�dvendigt hvis du bruger en funktion der kr�ver Email',1031510000);
INSERT INTO international VALUES (58,'WebGUI',10,'Jeg har allerede en konto',1031510000);
INSERT INTO international VALUES (59,'WebGUI',10,'Jeg har glemt mit kodeord (igen)',1031510000);
INSERT INTO international VALUES (60,'WebGUI',10,'Er du sikker p� du vil deaktivere din konto. Kontoen kan IKKE �bnes igen.',1031510000);
INSERT INTO international VALUES (61,'WebGUI',10,'Opdater konto information',1031510000);
INSERT INTO international VALUES (62,'WebGUI',10,'Gem',1031510000);
INSERT INTO international VALUES (63,'WebGUI',10,'Sl� administration til.',1031510000);
INSERT INTO international VALUES (64,'WebGUI',10,'Log ud.',1031510000);
INSERT INTO international VALUES (65,'WebGUI',10,'Venligst de-aktiver min konto permanent.',1031510000);
INSERT INTO international VALUES (66,'WebGUI',10,'Log In',1031510000);
INSERT INTO international VALUES (67,'WebGUI',10,'Opret ny konto',1031510000);
INSERT INTO international VALUES (68,'WebGUI',10,'Konto informationen er ikke gyldig. Enten eksisterer kontoen ikke, eller ogs� er brugernavn/kodeord forkert',1031510000);
INSERT INTO international VALUES (69,'WebGUI',10,'Kontakt venligst systemadministratoren for yderligere hj�lp!',1031510000);
INSERT INTO international VALUES (70,'WebGUI',10,'Fejl',1031510000);
INSERT INTO international VALUES (71,'WebGUI',10,'Genskab kodeord',1031510000);
INSERT INTO international VALUES (72,'WebGUI',10,'Genskab  ',1031510000);
INSERT INTO international VALUES (73,'WebGUI',10,'Log in.',1031510000);
INSERT INTO international VALUES (74,'WebGUI',10,'Konto information.',1031510000);
INSERT INTO international VALUES (75,'WebGUI',10,'Din konto information er sendt til den oplyste Email adresse',1031510000);
INSERT INTO international VALUES (76,'WebGUI',10,'Email adressen er ikke registreret i systemet',1031510000);
INSERT INTO international VALUES (77,'WebGUI',10,'Det brugernavn er desv�rre allerede brugt af en anden. Pr�v evt. en af disse:',1031510000);
INSERT INTO international VALUES (78,'WebGUI',10,'Du har indtastet to forskellige kodeord - pr�v igen!',1031510000);
INSERT INTO international VALUES (79,'WebGUI',10,'Kan ikke forbinde til LDAP server',1031510000);
INSERT INTO international VALUES (80,'WebGUI',10,'Konto er nu oprettet!',1031510000);
INSERT INTO international VALUES (81,'WebGUI',10,'Konto er nu opdateret.',1031510000);
INSERT INTO international VALUES (82,'WebGUI',10,'Administrative funktioner',1031510000);
INSERT INTO international VALUES (84,'WebGUI',10,'Gruppe navn',1031510000);
INSERT INTO international VALUES (85,'WebGUI',10,'Beskrivelse',1031510000);
INSERT INTO international VALUES (86,'WebGUI',10,'Er du sikker p� du vil slette denne gruppe? - og dermed alle rettigheder der er knyttet hertil',1031510000);
INSERT INTO international VALUES (87,'WebGUI',10,'Rediger gruppe',1031510000);
INSERT INTO international VALUES (88,'WebGUI',10,'brugere i gruppe',1031510000);
INSERT INTO international VALUES (89,'WebGUI',10,'Grupper',1031510000);
INSERT INTO international VALUES (90,'WebGUI',10,'Tilf�j gruppe',1031510000);
INSERT INTO international VALUES (91,'WebGUI',10,'Forrige side',1031510000);
INSERT INTO international VALUES (92,'WebGUI',10,'N�ste side',1031510000);
INSERT INTO international VALUES (93,'WebGUI',10,'Hj�lp',1031510000);
INSERT INTO international VALUES (94,'WebGUI',10,'Se ogs�',1031510000);
INSERT INTO international VALUES (95,'WebGUI',10,'Hj�lpe indeks',1031510000);
INSERT INTO international VALUES (98,'WebGUI',10,'Tilf�j side',1031510000);
INSERT INTO international VALUES (99,'WebGUI',10,'Titel',1031510000);
INSERT INTO international VALUES (100,'WebGUI',10,'Meta Tags',1031510000);
INSERT INTO international VALUES (101,'WebGUI',10,'Er du sikker p� du vil slette denne side, og alt indhold derunder?',1031510000);
INSERT INTO international VALUES (102,'WebGUI',10,'Rediger side',1031510000);
INSERT INTO international VALUES (103,'WebGUI',10,'Side specifikationer',1031510000);
INSERT INTO international VALUES (104,'WebGUI',10,'Side URL',1031510000);
INSERT INTO international VALUES (105,'WebGUI',10,'Stil',1031510000);
INSERT INTO international VALUES (106,'WebGUI',10,'S�t kryds for at give denne stil til alle undersider',1031510000);
INSERT INTO international VALUES (107,'WebGUI',10,'Rettigheder',1031510000);
INSERT INTO international VALUES (108,'WebGUI',10,'Ejer',1031510000);
INSERT INTO international VALUES (109,'WebGUI',10,'Ejer kan se?',1031510000);
INSERT INTO international VALUES (110,'WebGUI',10,'Ejer kan redigere?',1031510000);
INSERT INTO international VALUES (111,'WebGUI',10,'Gruppe',1031510000);
INSERT INTO international VALUES (112,'WebGUI',10,'Gruppe kan se?',1031510000);
INSERT INTO international VALUES (113,'WebGUI',10,'Gruppe kan redigere?',1031510000);
INSERT INTO international VALUES (114,'WebGUI',10,'Alle kan se?',1031510000);
INSERT INTO international VALUES (115,'WebGUI',10,'Alle kan redigere?',1031510000);
INSERT INTO international VALUES (116,'WebGUI',10,'S�t kryds for at give disse rettigheder til alle undersider',1031510000);
INSERT INTO international VALUES (117,'WebGUI',10,'Rediger autorisations indstillinger',1031510000);
INSERT INTO international VALUES (118,'WebGUI',10,'Anonym registrering',1031510000);
INSERT INTO international VALUES (119,'WebGUI',10,'autorisations metode (default)',1031510000);
INSERT INTO international VALUES (120,'WebGUI',10,'LDAP URL (default)',1031510000);
INSERT INTO international VALUES (121,'WebGUI',10,'LDAP Identitet (default)',1031510000);
INSERT INTO international VALUES (122,'WebGUI',10,'LDAP Identitets navn',1031510000);
INSERT INTO international VALUES (123,'WebGUI',10,'LDAP kodeord',1031510000);
INSERT INTO international VALUES (124,'WebGUI',10,'Rediger firma information',1031510000);
INSERT INTO international VALUES (125,'WebGUI',10,'Firma/organisations navn',1031510000);
INSERT INTO international VALUES (126,'WebGUI',10,'Firma/organisations Email',1031510000);
INSERT INTO international VALUES (127,'WebGUI',10,'Firma/organisation URL',1031510000);
INSERT INTO international VALUES (130,'WebGUI',10,'Maksimal st�rrelse p� vedh�ftede filer',1031510000);
INSERT INTO international VALUES (133,'WebGUI',10,'Rediger Mail indstillinger',1031510000);
INSERT INTO international VALUES (134,'WebGUI',10,'Besked for genskab adgangskode',1031510000);
INSERT INTO international VALUES (135,'WebGUI',10,'SMTP Server',1031510000);
INSERT INTO international VALUES (138,'WebGUI',10,'Ja',1031510000);
INSERT INTO international VALUES (139,'WebGUI',10,'Nej ',1031510000);
INSERT INTO international VALUES (140,'WebGUI',10,'Rediger diverse indstillinger',1031510000);
INSERT INTO international VALUES (141,'WebGUI',10,'Ikke fundet side',1031510000);
INSERT INTO international VALUES (142,'WebGUI',10,'Session Timeout',1031510000);
INSERT INTO international VALUES (143,'WebGUI',10,'administrer indstillinger',1031510000);
INSERT INTO international VALUES (144,'WebGUI',10,'Vis statistik',1031510000);
INSERT INTO international VALUES (145,'WebGUI',10,'WebGUI Build Version',1031510000);
INSERT INTO international VALUES (146,'WebGUI',10,'Aktive sessioner',1031510000);
INSERT INTO international VALUES (147,'WebGUI',10,'Sider',1031510000);
INSERT INTO international VALUES (148,'WebGUI',10,'Wobjects',1031510000);
INSERT INTO international VALUES (149,'WebGUI',10,'brugere i gruppe',1031510000);
INSERT INTO international VALUES (151,'WebGUI',10,'Navn p� stilart',1031510000);
INSERT INTO international VALUES (152,'WebGUI',10,'Hoved',1031510000);
INSERT INTO international VALUES (153,'WebGUI',10,'Fod',1031510000);
INSERT INTO international VALUES (154,'WebGUI',10,'Stilart Sheet',1031510000);
INSERT INTO international VALUES (155,'WebGUI',10,'\"Er du sikker p� du vil slette denne stilart og overf�re alle sider der bruger denne til \"\"Fail Safe\"\" stilarten ?\"',1031510000);
INSERT INTO international VALUES (156,'WebGUI',10,'Rediger stilart',1031510000);
INSERT INTO international VALUES (157,'WebGUI',10,'stilarter',1031510000);
INSERT INTO international VALUES (158,'WebGUI',10,'Tilf�j ny stilart',1031510000);
INSERT INTO international VALUES (159,'WebGUI',10,'Meddelelses log',1031510000);
INSERT INTO international VALUES (160,'WebGUI',10,'Dato oprettet',1031510000);
INSERT INTO international VALUES (161,'WebGUI',10,'Oprettet af',1031510000);
INSERT INTO international VALUES (162,'WebGUI',10,'Er du sikker p� du vil t�mme skraldespanden?',1031510000);
INSERT INTO international VALUES (163,'WebGUI',10,'Tilf�j bruger  ',1031510000);
INSERT INTO international VALUES (164,'WebGUI',10,'Metode for autorisation',1031510000);
INSERT INTO international VALUES (165,'WebGUI',10,'LDAP URL',1031510000);
INSERT INTO international VALUES (166,'WebGUI',10,'Connect DN',1031510000);
INSERT INTO international VALUES (167,'WebGUI',10,'Er du sikker p� du vil slette denne bruger? (Du kan ikke fortryde)',1031510000);
INSERT INTO international VALUES (168,'WebGUI',10,'Rediger bruger',1031510000);
INSERT INTO international VALUES (169,'WebGUI',10,'Tilf�j ny bruger',1031510000);
INSERT INTO international VALUES (170,'WebGUI',10,'S�g',1031510000);
INSERT INTO international VALUES (171,'WebGUI',10,'Avanceret redigering',1031510000);
INSERT INTO international VALUES (174,'WebGUI',10,'Vis titel p� siden?',1031510000);
INSERT INTO international VALUES (175,'WebGUI',10,'Udf�r makroer?',1031510000);
INSERT INTO international VALUES (228,'WebGUI',10,'Rediger besked�',1031510000);
INSERT INTO international VALUES (229,'WebGUI',10,'Emne',1031510000);
INSERT INTO international VALUES (230,'WebGUI',10,'Besked  ',1031510000);
INSERT INTO international VALUES (231,'WebGUI',10,'Oprettet ny besked �',1031510000);
INSERT INTO international VALUES (232,'WebGUI',10,'Intet emne',1031510000);
INSERT INTO international VALUES (233,'WebGUI',10,'(eom)',1031510000);
INSERT INTO international VALUES (234,'WebGUI',10,'Oprettet svar �',1031510000);
INSERT INTO international VALUES (237,'WebGUI',10,'Emne:',1031510000);
INSERT INTO international VALUES (238,'WebGUI',10,'Forfatter:',1031510000);
INSERT INTO international VALUES (239,'WebGUI',10,'Dato:',1031510000);
INSERT INTO international VALUES (240,'WebGUI',10,'Besked ID:',1031510000);
INSERT INTO international VALUES (244,'WebGUI',10,'Forfatter ',1031510000);
INSERT INTO international VALUES (245,'WebGUI',10,'Dato',1031510000);
INSERT INTO international VALUES (304,'WebGUI',10,'Sprog',1031510000);
INSERT INTO international VALUES (306,'WebGUI',10,'Brugernavn binding',1031510000);
INSERT INTO international VALUES (307,'WebGUI',10,'Brug standard meta tags?',1031510000);
INSERT INTO international VALUES (308,'WebGUI',10,'Rediger profil indstillinger',1031510000);
INSERT INTO international VALUES (309,'WebGUI',10,'Tillad rigtige navne?',1031510000);
INSERT INTO international VALUES (310,'WebGUI',10,'Tillad ekstra kontakt information?',1031510000);
INSERT INTO international VALUES (311,'WebGUI',10,'Tillad hjemme information?',1031510000);
INSERT INTO international VALUES (312,'WebGUI',10,'Tillad arbejds information?',1031510000);
INSERT INTO international VALUES (313,'WebGUI',10,'Tillad diverse information?',1031510000);
INSERT INTO international VALUES (314,'WebGUI',10,'Fornavn',1031510000);
INSERT INTO international VALUES (315,'WebGUI',10,'Mellemnavn',1031510000);
INSERT INTO international VALUES (316,'WebGUI',10,'Efternavn',1031510000);
INSERT INTO international VALUES (317,'WebGUI',10,'\"<a href=\"\"http://www.icq.com\"\">ICQ</a> UIN\"',1031510000);
INSERT INTO international VALUES (318,'WebGUI',10,'\"<a href=\"\"http://www.aol.com/aim/homenew.adp\"\">AIM</a> Id\"',1031510000);
INSERT INTO international VALUES (319,'WebGUI',10,'\"<a href=\"\"http://messenger.msn.com/\"\">MSN Messenger</a> Id\"',1031510000);
INSERT INTO international VALUES (320,'WebGUI',10,'\"<a href=\"\"http://messenger.yahoo.com/\"\">Yahoo! Messenger</a> Id\"',1031510000);
INSERT INTO international VALUES (321,'WebGUI',10,'Bil tlf.',1031510000);
INSERT INTO international VALUES (322,'WebGUI',10,'OPS',1031510000);
INSERT INTO international VALUES (323,'WebGUI',10,'Hjemme adresse',1031510000);
INSERT INTO international VALUES (324,'WebGUI',10,'Hjemme by',1031510000);
INSERT INTO international VALUES (325,'WebGUI',10,'Hjemme stat',1031510000);
INSERT INTO international VALUES (326,'WebGUI',10,'Hjemme postnr.',1031510000);
INSERT INTO international VALUES (327,'WebGUI',10,'Hjemme amt',1031510000);
INSERT INTO international VALUES (328,'WebGUI',10,'Hjemme tlf.',1031510000);
INSERT INTO international VALUES (329,'WebGUI',10,'Arbejds adresse',1031510000);
INSERT INTO international VALUES (330,'WebGUI',10,'Arbejds by',1031510000);
INSERT INTO international VALUES (331,'WebGUI',10,'Arbejds stat',1031510000);
INSERT INTO international VALUES (332,'WebGUI',10,'Arbejds postnr.',1031510000);
INSERT INTO international VALUES (333,'WebGUI',10,'Arbejds amt',1031510000);
INSERT INTO international VALUES (334,'WebGUI',10,'Arbejds tlf.',1031510000);
INSERT INTO international VALUES (335,'WebGUI',10,'M/K',1031510000);
INSERT INTO international VALUES (336,'WebGUI',10,'F�dselsdag',1031510000);
INSERT INTO international VALUES (337,'WebGUI',10,'Hjemmeside URL',1031510000);
INSERT INTO international VALUES (338,'WebGUI',10,'Rediger profil  ',1031510000);
INSERT INTO international VALUES (339,'WebGUI',10,'Mand',1031510000);
INSERT INTO international VALUES (340,'WebGUI',10,'Kvinde',1031510000);
INSERT INTO international VALUES (341,'WebGUI',10,'Rediger profil',1031510000);
INSERT INTO international VALUES (342,'WebGUI',10,'Rediger konto information',1031510000);
INSERT INTO international VALUES (343,'WebGUI',10,'Vis profil',1031510000);
INSERT INTO international VALUES (345,'WebGUI',10,'Ikke medlem',1031510000);
INSERT INTO international VALUES (346,'WebGUI',10,'Denne bruger findes ikke l�ngere p� dette system. Jeg har ikke yderligere oplysninger om denne bruger',1031510000);
INSERT INTO international VALUES (347,'WebGUI',10,'Vis profil for',1031510000);
INSERT INTO international VALUES (348,'WebGUI',10,'Navn  ',1031510000);
INSERT INTO international VALUES (349,'WebGUI',10,'Seneste version',1031510000);
INSERT INTO international VALUES (350,'WebGUI',10,'Gennemf�rt',1031510000);
INSERT INTO international VALUES (351,'WebGUI',10,'Message Log Entry',1031510000);
INSERT INTO international VALUES (352,'WebGUI',10,'Dato',1031510000);
INSERT INTO international VALUES (353,'WebGUI',10,'Du har ingen meddelelser i �jeblikket',1031510000);
INSERT INTO international VALUES (354,'WebGUI',10,'Vis meddelelses log',1031510000);
INSERT INTO international VALUES (355,'WebGUI',10,'Standard',1031510000);
INSERT INTO international VALUES (356,'WebGUI',10,'Template',1031510000);
INSERT INTO international VALUES (357,'WebGUI',10,'Nyheder',1031510000);
INSERT INTO international VALUES (358,'WebGUI',10,'Venstre kolonne',1031510000);
INSERT INTO international VALUES (359,'WebGUI',10,'H�jre kolonne',1031510000);
INSERT INTO international VALUES (360,'WebGUI',10,'En over tre',1031510000);
INSERT INTO international VALUES (361,'WebGUI',10,'Tre over en',1031510000);
INSERT INTO international VALUES (362,'WebGUI',10,'Side ved side',1031510000);
INSERT INTO international VALUES (363,'WebGUI',10,'Template position',1031510000);
INSERT INTO international VALUES (364,'WebGUI',10,'S�g',1031510000);
INSERT INTO international VALUES (365,'WebGUI',10,'S�ge resultater �',1031510000);
INSERT INTO international VALUES (366,'WebGUI',10,'Jeg fandt desv�rre ingen sider med de(t) s�geord',1031510000);
INSERT INTO international VALUES (367,'WebGUI',10,'Udl�ber efter',1031510000);
INSERT INTO international VALUES (368,'WebGUI',10,'Tilf�j en ny gruppen til denne bruger.',1031510000);
INSERT INTO international VALUES (369,'WebGUI',10,'Udl�bs dato',1031510000);
INSERT INTO international VALUES (370,'WebGUI',10,'Rediger gruppering',1031510000);
INSERT INTO international VALUES (371,'WebGUI',10,'Tilf�j gruppering',1031510000);
INSERT INTO international VALUES (372,'WebGUI',10,'Rediger brugers gruppe',1031510000);
INSERT INTO international VALUES (374,'WebGUI',10,'administrer packages',1031510000);
INSERT INTO international VALUES (375,'WebGUI',10,'V�lg package der skal tages i brug',1031510000);
INSERT INTO international VALUES (376,'WebGUI',10,'Package',1031510000);
INSERT INTO international VALUES (377,'WebGUI',10,'\"Der er endnu ikke defineret nogle \"\"Packages\"\".\"',1031510000);
INSERT INTO international VALUES (378,'WebGUI',10,'Bruger ID',1031510000);
INSERT INTO international VALUES (379,'WebGUI',10,'Gruppe ID',1031510000);
INSERT INTO international VALUES (380,'WebGUI',10,'Stilart ID',1031510000);
INSERT INTO international VALUES (381,'WebGUI',10,'WebGUI modtog en fejlformateret besked og kan ikke forts�tte - dette skyldes typisk eb speciel karakter. Pr�v evt. at trykke tilbage og pr�v igen.',1031510000);
INSERT INTO international VALUES (383,'WebGUI',10,'Navn',1031510000);
INSERT INTO international VALUES (384,'WebGUI',10,'Fil  ',1031510000);
INSERT INTO international VALUES (385,'WebGUI',10,'Parametre',1031510000);
INSERT INTO international VALUES (386,'WebGUI',10,'Rediger billede',1031510000);
INSERT INTO international VALUES (387,'WebGUI',10,'Tilf�jet af',1031510000);
INSERT INTO international VALUES (388,'WebGUI',10,'Tilf�jet dato',1031510000);
INSERT INTO international VALUES (389,'WebGUI',10,'Billede ID',1031510000);
INSERT INTO international VALUES (390,'WebGUI',10,'Viser billede �',1031510000);
INSERT INTO international VALUES (391,'WebGUI',10,'Sletter vedh�ftet fil',1031510000);
INSERT INTO international VALUES (392,'WebGUI',10,'Er du sikker p� du vil slette dette billede',1031510000);
INSERT INTO international VALUES (393,'WebGUI',10,'administrer billeder',1031510000);
INSERT INTO international VALUES (394,'WebGUI',10,'administrer billeder.',1031510000);
INSERT INTO international VALUES (395,'WebGUI',10,'Tilf�j nyt billede',1031510000);
INSERT INTO international VALUES (396,'WebGUI',10,'Vis billede',1031510000);
INSERT INTO international VALUES (397,'WebGUI',10,'Tilbage til billede oversigt',1031510000);
INSERT INTO international VALUES (398,'WebGUI',10,'Dokument type deklarering',1031510000);
INSERT INTO international VALUES (399,'WebGUI',10,'Valider denne side.',1031510000);
INSERT INTO international VALUES (400,'WebGUI',10,'Forhindre Proxy Caching',1031510000);
INSERT INTO international VALUES (401,'WebGUI',10,'Er du sikker p� du vil slette denne besked, og alle under beskeder i tr�den?',1031510000);
INSERT INTO international VALUES (402,'WebGUI',10,'Beskeden findes ikke',1031510000);
INSERT INTO international VALUES (403,'WebGUI',10,'Det foretr�kker jeg ikke at oplyse',1031510000);
INSERT INTO international VALUES (404,'WebGUI',10,'F�rste side',1031510000);
INSERT INTO international VALUES (405,'WebGUI',10,'Sidste side',1031510000);
INSERT INTO international VALUES (406,'WebGUI',10,'Miniature st�rrelse',1031510000);
INSERT INTO international VALUES (407,'WebGUI',10,'Klik her for at registrere',1031510000);
INSERT INTO international VALUES (408,'WebGUI',10,'administrer rod',1031510000);
INSERT INTO international VALUES (409,'WebGUI',10,'Tilf�j ny rod',1031510000);
INSERT INTO international VALUES (410,'WebGUI',10,'Administrer rod',1031510000);
INSERT INTO international VALUES (411,'WebGUI',10,'Menu titel',1031510000);
INSERT INTO international VALUES (412,'WebGUI',10,'Synopsis',1031510000);
INSERT INTO international VALUES (51,'Product',1,'Benefit',1031514049);
INSERT INTO international VALUES (56,'Product',1,'Add a product template.',1031514049);
INSERT INTO international VALUES (416,'WebGUI',10,'<h1>Problem med foresp�rgsel</h1>Oops, jeg har lidt problemer med din foresp�rgsel. Tryk tilbage og pr�v igen. Hvis problemet forts�tte vil jeg v�re glad hvis du vil kontakte os og fort�lle hvad du pr�ver, p� forh�nd tak.',1031510000);
INSERT INTO international VALUES (417,'WebGUI',10,'<h1>Sikkerhedsbrud</h1>Du fors�gte at f� adgang med en Wobject der ikke h�rer til her. Jeg har rapporteret dit fors�g.',1031510000);
INSERT INTO international VALUES (418,'WebGUI',10,'Filter Contributed HTML',1031510000);
INSERT INTO international VALUES (419,'WebGUI',10,'Fjern alle tags',1031510000);
INSERT INTO international VALUES (420,'WebGUI',10,'Lad det v�re',1031510000);
INSERT INTO international VALUES (421,'WebGUI',10,'Fjerne alt bortset fra basal formatering',1031510000);
INSERT INTO international VALUES (422,'WebGUI',10,'<h1>Login mislykkedes</h1>Dine informationer stemmer ikke med mine oplysninger',1031510000);
INSERT INTO international VALUES (423,'WebGUI',10,'Vis aktive sessioner',1031510000);
INSERT INTO international VALUES (424,'WebGUI',10,'Vis login historik',1031510000);
INSERT INTO international VALUES (425,'WebGUI',10,'Aktive sessioner',1031510000);
INSERT INTO international VALUES (426,'WebGUI',10,'Login historik',1031510000);
INSERT INTO international VALUES (427,'WebGUI',10,'stilarter',1031510000);
INSERT INTO international VALUES (428,'WebGUI',10,'Bruger (ID)',1031510000);
INSERT INTO international VALUES (429,'WebGUI',10,'Login tid',1031510000);
INSERT INTO international VALUES (430,'WebGUI',10,'Sidste side vist',1031510000);
INSERT INTO international VALUES (431,'WebGUI',10,'IP Adresse',1031510000);
INSERT INTO international VALUES (432,'WebGUI',10,'Udl�ber efter',1031510000);
INSERT INTO international VALUES (433,'WebGUI',10,'Bruger agent:',1031510000);
INSERT INTO international VALUES (434,'WebGUI',10,'Status',1031510000);
INSERT INTO international VALUES (435,'WebGUI',10,'Session Signatur',1031510000);
INSERT INTO international VALUES (436,'WebGUI',10,'Afbryd Session',1031510000);
INSERT INTO international VALUES (437,'WebGUI',10,'Statistik',1031510000);
INSERT INTO international VALUES (438,'WebGUI',10,'Dit navn',1031510000);
INSERT INTO international VALUES (439,'WebGUI',10,'Personlig information',1031510000);
INSERT INTO international VALUES (440,'WebGUI',10,'Kontakt information',1031510000);
INSERT INTO international VALUES (441,'WebGUI',10,'Email  til OPS Gateway',1031510000);
INSERT INTO international VALUES (442,'WebGUI',10,'Arbejdsinformation',1031510000);
INSERT INTO international VALUES (443,'WebGUI',10,'Hjemme information',1031510000);
INSERT INTO international VALUES (444,'WebGUI',10,'Demografisk information',1031510000);
INSERT INTO international VALUES (445,'WebGUI',10,'Pr�ferencer',1031510000);
INSERT INTO international VALUES (446,'WebGUI',10,'Arbejds hjemmeside',1031510000);
INSERT INTO international VALUES (447,'WebGUI',10,'Administrer tr� struktur',1031510000);
INSERT INTO international VALUES (448,'WebGUI',10,'Tr� struktur',1031510000);
INSERT INTO international VALUES (449,'WebGUI',10,'Diverse information',1031510000);
INSERT INTO international VALUES (450,'WebGUI',10,'Arbejdsnavn (Firma navn)',1031510000);
INSERT INTO international VALUES (451,'WebGUI',10,'er p�kr�vet',1031510000);
INSERT INTO international VALUES (452,'WebGUI',10,'Vent venligst �',1031510000);
INSERT INTO international VALUES (453,'WebGUI',10,'Dato oprettet',1031510000);
INSERT INTO international VALUES (454,'WebGUI',10,'Sidste opdateret',1031510000);
INSERT INTO international VALUES (455,'WebGUI',10,'Rediger bruger profil',1031510000);
INSERT INTO international VALUES (456,'WebGUI',10,'Tilbage til bruger liste',1031510000);
INSERT INTO international VALUES (457,'WebGUI',10,'Rediger denne brugers konto',1031510000);
INSERT INTO international VALUES (458,'WebGUI',10,'Rediger denne bruger gruppe',1031510000);
INSERT INTO international VALUES (459,'WebGUI',10,'Rediger denne brugers profil',1031510000);
INSERT INTO international VALUES (460,'WebGUI',10,'Tidsforskel',1031510000);
INSERT INTO international VALUES (461,'WebGUI',10,'Dato format',1031510000);
INSERT INTO international VALUES (462,'WebGUI',10,'Tids format',1031510000);
INSERT INTO international VALUES (463,'WebGUI',10,'Tekst Area Rows',1031510000);
INSERT INTO international VALUES (464,'WebGUI',10,'Tekst Area Columns',1031510000);
INSERT INTO international VALUES (465,'WebGUI',10,'Tekst Box Size',1031510000);
INSERT INTO international VALUES (466,'WebGUI',10,'Er du sikker p� du vil slette denne kategori og flytte indholdet over i diverse kategorien?',1031510000);
INSERT INTO international VALUES (467,'WebGUI',10,'Er du sikker p� du vil slette dette felt, og alle relaterede brugerdata?',1031510000);
INSERT INTO international VALUES (469,'WebGUI',10,'Id',1031510000);
INSERT INTO international VALUES (470,'WebGUI',10,'Navn',1031510000);
INSERT INTO international VALUES (472,'WebGUI',10,'Label',1031510000);
INSERT INTO international VALUES (473,'WebGUI',10,'Synlig?',1031510000);
INSERT INTO international VALUES (474,'WebGUI',10,'P�kr�vet?',1031510000);
INSERT INTO international VALUES (475,'WebGUI',10,'Tekst',1031510000);
INSERT INTO international VALUES (476,'WebGUI',10,'Tekst omr�de',1031510000);
INSERT INTO international VALUES (477,'WebGUI',10,'HTML omr�de',1031510000);
INSERT INTO international VALUES (478,'WebGUI',10,'URL',1031510000);
INSERT INTO international VALUES (479,'WebGUI',10,'Dato',1031510000);
INSERT INTO international VALUES (480,'WebGUI',10,'Email Adresse',1031510000);
INSERT INTO international VALUES (481,'WebGUI',10,'Tlf. nr.',1031510000);
INSERT INTO international VALUES (482,'WebGUI',10,'Heltal',1031510000);
INSERT INTO international VALUES (483,'WebGUI',10,'Ja eller Nej',1031510000);
INSERT INTO international VALUES (484,'WebGUI',10,'V�lg fra list',1031510000);
INSERT INTO international VALUES (485,'WebGUI',10,'Logisk (Checkboks)',1031510000);
INSERT INTO international VALUES (486,'WebGUI',10,'Data type',1031510000);
INSERT INTO international VALUES (487,'WebGUI',10,'Mulige v�rdier',1031510000);
INSERT INTO international VALUES (488,'WebGUI',10,'Standard v�rdi',1031510000);
INSERT INTO international VALUES (489,'WebGUI',10,'Profil kategori',1031510000);
INSERT INTO international VALUES (490,'WebGUI',10,'Tilf�j en profil kategori',1031510000);
INSERT INTO international VALUES (491,'WebGUI',10,'Tilf�j et profil felt',1031510000);
INSERT INTO international VALUES (492,'WebGUI',10,'Liste over profil felter',1031510000);
INSERT INTO international VALUES (493,'WebGUI',10,'Tilbage til Site',1031510000);
INSERT INTO international VALUES (494,'WebGUI',10,'Real Objects Edit-On Pro',1031510000);
INSERT INTO international VALUES (495,'WebGUI',10,'Indbygget editor',1031510000);
INSERT INTO international VALUES (496,'WebGUI',10,'Hvilken editor bruges',1031510000);
INSERT INTO international VALUES (497,'WebGUI',10,'Start dato',1031510000);
INSERT INTO international VALUES (498,'WebGUI',10,'Slut dato',1031510000);
INSERT INTO international VALUES (499,'WebGUI',10,'Wobject ID',1031510000);
INSERT INTO international VALUES (518,'WebGUI',1,'Inbox Notifications',1031514049);
INSERT INTO international VALUES (519,'WebGUI',1,'I would not like to be notified.',1031514049);
INSERT INTO international VALUES (520,'WebGUI',1,'I would like to be notified via email.',1031514049);
INSERT INTO international VALUES (521,'WebGUI',1,'I would like to be notified via email to pager.',1031514049);
INSERT INTO international VALUES (522,'WebGUI',1,'I would like to be notified via ICQ.',1031514049);
INSERT INTO international VALUES (523,'WebGUI',1,'Notification',1031514049);
INSERT INTO international VALUES (524,'WebGUI',1,'Add edit stamp to posts?',1031514049);
INSERT INTO international VALUES (525,'WebGUI',1,'Edit Content Settings',1031514049);
INSERT INTO international VALUES (526,'WebGUI',1,'Remove only JavaScript.',1031514049);
INSERT INTO international VALUES (528,'WebGUI',1,'Template Name',1031514049);
INSERT INTO international VALUES (529,'WebGUI',1,'results',1031514049);
INSERT INTO international VALUES (530,'WebGUI',1,'with <b>all</b> the words',1031514049);
INSERT INTO international VALUES (531,'WebGUI',1,'with the <b>exact phrase</b>',1031514049);
INSERT INTO international VALUES (532,'WebGUI',1,'with <b>at least one</b> of the words',1031514049);
INSERT INTO international VALUES (533,'WebGUI',1,'<b>without</b> the words',1031514049);
INSERT INTO international VALUES (535,'WebGUI',1,'Group To Alert On New User',1031514049);
INSERT INTO international VALUES (534,'WebGUI',1,'Alert on new user?',1031514049);
INSERT INTO international VALUES (536,'WebGUI',1,'A new user named ^@; has joined the site.',1031514049);
INSERT INTO international VALUES (56,'WebGUI',3,'Emailadres',1031516049);
INSERT INTO international VALUES (55,'WebGUI',3,'Wachtwoord (bevestigen)',1031516049);
INSERT INTO international VALUES (11,'Product',1,'Product Number',1031514049);
INSERT INTO international VALUES (2,'Product',1,'Are you certain you wish to delete the relationship to this accessory?',1031514049);
INSERT INTO international VALUES (54,'WebGUI',3,'Cre�er account',1031516049);
INSERT INTO international VALUES (53,'WebGUI',3,'Maak pagina printbaar',1031516049);
INSERT INTO international VALUES (579,'WebGUI',1,'Your message has been approved.',1031514049);
INSERT INTO international VALUES (52,'WebGUI',3,'Login',1031516049);
INSERT INTO international VALUES (51,'WebGUI',3,'Wachtwoord',1031516049);
INSERT INTO international VALUES (50,'WebGUI',3,'Gebruikersnaam',1031516049);
INSERT INTO international VALUES (49,'WebGUI',3,'Klik <a href=\"^\\;?op=logout\">hier</a> om uit te loggen.',1031516049);
INSERT INTO international VALUES (48,'WebGUI',3,'Hallo',1031516049);
INSERT INTO international VALUES (47,'WebGUI',3,'Home',1031516049);
INSERT INTO international VALUES (46,'WebGUI',3,'Mijn account',1031516049);
INSERT INTO international VALUES (45,'WebGUI',3,'\"Nee, ik heb een foutje gemaakt.\"',1031516049);
INSERT INTO international VALUES (44,'WebGUI',3,'\"Ja, ik weet het zeker.\"',1031516049);
INSERT INTO international VALUES (43,'WebGUI',3,'Weet u zeker dat u deze inhoud wilt verwijderen?',1031516049);
INSERT INTO international VALUES (42,'WebGUI',3,'Alstublieft bevestigen',1031516049);
INSERT INTO international VALUES (41,'WebGUI',3,'U probeert een vitaal component van het WebGUI systeem te verwijderen. Als u dit zou mogen dan zou WebGUI waarschijnlijk niet meer werken.',1031516049);
INSERT INTO international VALUES (40,'WebGUI',3,'Vitaal component',1031516049);
INSERT INTO international VALUES (39,'WebGUI',3,'U heeft niet voldoende privileges om deze pagina op te vragen.',1031516049);
INSERT INTO international VALUES (38,'WebGUI',3,'U heeft niet voldoende privileges om deze bewerking uit te voeren. ^a(Log in); als een gebruiker met voldoende privileges.',1031516049);
INSERT INTO international VALUES (37,'WebGUI',3,'Geen toegang!',1031516049);
INSERT INTO international VALUES (36,'WebGUI',3,'U moet een beheerder zijn om deze functie uit te voeren. Neem contact op met een van de beheerders:',1031516049);
INSERT INTO international VALUES (35,'WebGUI',3,'Administratieve functie',1031516049);
INSERT INTO international VALUES (34,'WebGUI',3,'Zet datum',1031516049);
INSERT INTO international VALUES (33,'WebGUI',3,'zaterdag',1031516049);
INSERT INTO international VALUES (32,'WebGUI',3,'vrijdag',1031516049);
INSERT INTO international VALUES (31,'WebGUI',3,'donderdag',1031516049);
INSERT INTO international VALUES (30,'WebGUI',3,'woensdag',1031516049);
INSERT INTO international VALUES (29,'WebGUI',3,'dinsdag',1031516049);
INSERT INTO international VALUES (29,'USS',3,'Gebruikers bijdrage systeem',1031516049);
INSERT INTO international VALUES (28,'WebGUI',3,'maandag',1031516049);
INSERT INTO international VALUES (28,'USS',3,'Ga terug naar bijdrage lijst',1031516049);
INSERT INTO international VALUES (27,'WebGUI',3,'zondag',1031516049);
INSERT INTO international VALUES (27,'USS',3,'Bewerk',1031516049);
INSERT INTO international VALUES (26,'WebGUI',3,'december',1031516049);
INSERT INTO international VALUES (574,'WebGUI',3,'Keur af',1031516049);
INSERT INTO international VALUES (25,'WebGUI',3,'november',1031516049);
INSERT INTO international VALUES (573,'WebGUI',3,'Laat in behandeling',1031516049);
INSERT INTO international VALUES (24,'WebGUI',3,'oktober',1031516049);
INSERT INTO international VALUES (572,'WebGUI',3,'Keur goed',1031516049);
INSERT INTO international VALUES (23,'WebGUI',3,'september',1031516049);
INSERT INTO international VALUES (22,'WebGUI',3,'augustus',1031516049);
INSERT INTO international VALUES (9,'Product',1,'Product Image 3',1031514049);
INSERT INTO international VALUES (7,'Product',1,'Product Image 1',1031514049);
INSERT INTO international VALUES (21,'WebGUI',3,'juli',1031516049);
INSERT INTO international VALUES (21,'USS',3,'Ingevoerd door',1031516049);
INSERT INTO international VALUES (20,'WebGUI',3,'juni',1031516049);
INSERT INTO international VALUES (575,'WebGUI',1,'Edit',1031514049);
INSERT INTO international VALUES (570,'WebGUI',1,'Lock Thread',1031514049);
INSERT INTO international VALUES (568,'WebGUI',1,'After-the-fact',1031514049);
INSERT INTO international VALUES (20,'USS',3,'Post nieuwe bijdrage',1031516049);
INSERT INTO international VALUES (20,'MessageBoard',3,'Laatste antwoord',1031516049);
INSERT INTO international VALUES (19,'WebGUI',3,'mei',1031516049);
INSERT INTO international VALUES (19,'USS',3,'Bewerk bijdrage',1031516049);
INSERT INTO international VALUES (19,'MessageBoard',3,'Antwoorden',1031516049);
INSERT INTO international VALUES (18,'WebGUI',3,'april',1031516049);
INSERT INTO international VALUES (18,'USS',3,'Bewerk gebruikers bijdrage systeem',1031516049);
INSERT INTO international VALUES (18,'MessageBoard',3,'Tread gestart',1031516049);
INSERT INTO international VALUES (17,'WebGUI',3,'maart',1031516049);
INSERT INTO international VALUES (16,'WebGUI',3,'februari',1031516049);
INSERT INTO international VALUES (17,'MessageBoard',3,'Post nieuw bericht',1031516049);
INSERT INTO international VALUES (17,'USS',3,'Weet u zeker dat u deze bijdrage wilt verwijderen?',1031516049);
INSERT INTO international VALUES (16,'USS',3,'Zonder titel',1031516049);
INSERT INTO international VALUES (16,'MessageBoard',3,'Datum',1031516049);
INSERT INTO international VALUES (15,'WebGUI',3,'januari',1031516049);
INSERT INTO international VALUES (15,'USS',3,'bewerk/Verwijder',1031516049);
INSERT INTO international VALUES (15,'MessageBoard',3,'Afzender',1031516049);
INSERT INTO international VALUES (14,'WebGUI',3,'Laat lopende aanmeldingen zien.',1031516049);
INSERT INTO international VALUES (14,'USS',3,'Status',1031516049);
INSERT INTO international VALUES (13,'WebGUI',3,'Laat help index zien.',1031516049);
INSERT INTO international VALUES (13,'USS',3,'Invoerdatum',1031516049);
INSERT INTO international VALUES (577,'WebGUI',3,'Post antwoord',1031516049);
INSERT INTO international VALUES (13,'LinkList',3,'Voeg een nieuwe link toe.',1031516049);
INSERT INTO international VALUES (13,'EventsCalendar',3,'Bewerk evenement',1031516049);
INSERT INTO international VALUES (13,'Article',3,'Verwijder',1031516049);
INSERT INTO international VALUES (12,'WebGUI',3,'Zet beheermode uit.',1031516049);
INSERT INTO international VALUES (12,'USS',3,'(niet aanvinken als u een HTML bijdrage levert.)',1031516049);
INSERT INTO international VALUES (12,'SQLReport',3,'Fout: Kon niet met de database verbinden.',1031516049);
INSERT INTO international VALUES (12,'EventsCalendar',3,'Bewerk evenementen kalender',1031516049);
INSERT INTO international VALUES (12,'LinkList',3,'Bewerk link',1031516049);
INSERT INTO international VALUES (12,'MessageBoard',3,'Bewerk bericht',1031516049);
INSERT INTO international VALUES (12,'Article',3,'Bewerk artikel',1031516049);
INSERT INTO international VALUES (11,'WebGUI',3,'Leeg prullenbak.',1031516049);
INSERT INTO international VALUES (11,'SQLReport',3,'Fout: Er was een probleem met de query',1031516049);
INSERT INTO international VALUES (11,'MessageBoard',3,'Terug naar berichten lijst',1031516049);
INSERT INTO international VALUES (11,'Article',3,'(Vink aan als u geen &lt;br&gt; manueel gebruikt.)',1031516049);
INSERT INTO international VALUES (10,'WebGUI',3,'Bekijk prullenbak.',1031516049);
INSERT INTO international VALUES (563,'WebGUI',3,'Standaard status',1031516049);
INSERT INTO international VALUES (10,'SQLReport',3,'Fout: De ingevoerde SQL instructie is van een verkeerd formaat.',1031516049);
INSERT INTO international VALUES (10,'Poll',3,'Begin opnieuw met stemmen',1031516049);
INSERT INTO international VALUES (10,'LinkList',3,'Bewerk link lijst',1031516049);
INSERT INTO international VALUES (10,'FAQ',3,'Bewerk vraag',1031516049);
INSERT INTO international VALUES (10,'Article',3,'Enter converteren?',1031516049);
INSERT INTO international VALUES (562,'WebGUI',3,'Lopend',1031516049);
INSERT INTO international VALUES (9,'WebGUI',3,'Bekijk klembord.',1031516049);
INSERT INTO international VALUES (9,'SQLReport',3,'Fout: De ingevoerde DSN is van een verkeerd formaat.',1031516049);
INSERT INTO international VALUES (9,'Poll',3,'Bewerk stemming',1031516049);
INSERT INTO international VALUES (9,'MessageBoard',3,'Bericht ID:',1031516049);
INSERT INTO international VALUES (9,'LinkList',3,'Weet u zeker dat u deze link wilt verwijderen?',1031516049);
INSERT INTO international VALUES (9,'FAQ',3,'Voeg een nieuwe vraag toe',1031516049);
INSERT INTO international VALUES (9,'EventsCalendar',3,'Tot',1031516049);
INSERT INTO international VALUES (9,'Article',3,'Bijlage',1031516049);
INSERT INTO international VALUES (713,'WebGUI',1,'Style Managers Group',1031514049);
INSERT INTO international VALUES (714,'WebGUI',1,'Template Managers Group',1031514049);
INSERT INTO international VALUES (8,'SiteMap',3,'Regelafstand',1031516049);
INSERT INTO international VALUES (8,'SQLReport',3,'Bewerk SQL rapport',1031516049);
INSERT INTO international VALUES (561,'WebGUI',3,'Afgekeurd',1031516049);
INSERT INTO international VALUES (8,'WebGUI',3,'Bekijk \'pagina niet gevonden\'.',1031516049);
INSERT INTO international VALUES (8,'LinkList',3,'URL',1031516049);
INSERT INTO international VALUES (8,'MessageBoard',3,'Datum:',1031516049);
INSERT INTO international VALUES (8,'Poll',3,'(Voer een antwoord per regel in. Niet meer dan 20.)',1031516049);
INSERT INTO international VALUES (8,'FAQ',3,'Bewerk FAQ',1031516049);
INSERT INTO international VALUES (8,'EventsCalendar',3,'Herhaalt elke',1031516049);
INSERT INTO international VALUES (8,'Article',3,'Link URL',1031516049);
INSERT INTO international VALUES (7,'WebGUI',3,'Beheer gebruikers',1031516049);
INSERT INTO international VALUES (7,'SQLReport',3,'Database wachtwoord',1031516049);
INSERT INTO international VALUES (560,'WebGUI',3,'Goedgekeurd',1031516049);
INSERT INTO international VALUES (7,'SiteMap',3,'Opsommingsteken',1031516049);
INSERT INTO international VALUES (7,'Poll',3,'Antwoorden',1031516049);
INSERT INTO international VALUES (7,'MessageBoard',3,'Naam:',1031516049);
INSERT INTO international VALUES (7,'FAQ',3,'Weet u zeker dat u deze vraag wilt verwijderen?',1031516049);
INSERT INTO international VALUES (7,'Article',3,'Link titel',1031516049);
INSERT INTO international VALUES (6,'WebGUI',3,'Beheer stijlen.',1031516049);
INSERT INTO international VALUES (6,'USS',3,'Bijdrages per pagina',1031516049);
INSERT INTO international VALUES (6,'SyndicatedContent',3,'Huidige inhoud',1031516049);
INSERT INTO international VALUES (6,'SQLReport',3,'Database gebruiker',1031516049);
INSERT INTO international VALUES (6,'SiteMap',3,'Inspringen',1031516049);
INSERT INTO international VALUES (6,'Poll',3,'Vraag',1031516049);
INSERT INTO international VALUES (6,'MessageBoard',3,'Bewerk berichten bord',1031516049);
INSERT INTO international VALUES (6,'LinkList',3,'Link lijst',1031516049);
INSERT INTO international VALUES (6,'FAQ',3,'Andwoord',1031516049);
INSERT INTO international VALUES (6,'ExtraColumn',3,'Bewerk extra kolom',1031516049);
INSERT INTO international VALUES (701,'WebGUI',3,'Week',1031516049);
INSERT INTO international VALUES (6,'Article',3,'Plaatje',1031516049);
INSERT INTO international VALUES (5,'WebGUI',3,'Beheer groepen.',1031516049);
INSERT INTO international VALUES (5,'USS',3,'Uw bijdrage is afgekeurd.',1031516049);
INSERT INTO international VALUES (5,'SyndicatedContent',3,'Laatste keer bijgewerkt',1031516049);
INSERT INTO international VALUES (5,'SQLReport',3,'DSN',1031516049);
INSERT INTO international VALUES (5,'SiteMap',3,'Bewerk sitemap',1031516049);
INSERT INTO international VALUES (5,'Poll',3,'Grafiek breedte',1031516049);
INSERT INTO international VALUES (566,'WebGUI',3,'Bewerk timeout',1031516049);
INSERT INTO international VALUES (5,'LinkList',3,'Doorgaan met link toevoegen?',1031516049);
INSERT INTO international VALUES (5,'FAQ',3,'Vraag',1031516049);
INSERT INTO international VALUES (5,'ExtraColumn',3,'Style sheet klasse (class)',1031516049);
INSERT INTO international VALUES (700,'WebGUI',3,'Dag',1031516049);
INSERT INTO international VALUES (4,'WebGUI',3,'Beheer instellingen.',1031516049);
INSERT INTO international VALUES (4,'USS',3,'Uw bijdrage is goedgekeurd.',1031516049);
INSERT INTO international VALUES (4,'SQLReport',3,'Query',1031516049);
INSERT INTO international VALUES (4,'SyndicatedContent',3,'Bewerk syndicated content',1031516049);
INSERT INTO international VALUES (4,'Poll',3,'Wie kan stemmen?',1031516049);
INSERT INTO international VALUES (4,'SiteMap',3,'Diepteniveau',1031516049);
INSERT INTO international VALUES (4,'MessageBoard',3,'Berichten per pagina',1031516049);
INSERT INTO international VALUES (4,'LinkList',3,'Opsommingsteken',1031516049);
INSERT INTO international VALUES (4,'ExtraColumn',3,'Breedte',1031516049);
INSERT INTO international VALUES (4,'EventsCalendar',3,'Gebeurt maar een keer.',1031516049);
INSERT INTO international VALUES (4,'Article',3,'Eind datum',1031516049);
INSERT INTO international VALUES (3,'WebGUI',3,'Plakken van het klemboord...',1031516049);
INSERT INTO international VALUES (3,'USS',3,'U heeft een nieuwe bijdrage om goed te keuren.',1031516049);
INSERT INTO international VALUES (3,'SQLReport',3,'Sjabloon',1031516049);
INSERT INTO international VALUES (3,'SiteMap',3,'Op dit niveau beginnen?',1031516049);
INSERT INTO international VALUES (3,'Poll',3,'Aktief',1031516049);
INSERT INTO international VALUES (564,'WebGUI',3,'Wie kan posten',1031516049);
INSERT INTO international VALUES (3,'LinkList',3,'Open in nieuw venster?',1031516049);
INSERT INTO international VALUES (3,'ExtraColumn',3,'Tussenruimte',1031516049);
INSERT INTO international VALUES (3,'Article',3,'Begindatum',1031516049);
INSERT INTO international VALUES (2,'WebGUI',3,'Pagina',1031516049);
INSERT INTO international VALUES (2,'USS',3,'Wie kan bijdragen?',1031516049);
INSERT INTO international VALUES (2,'SyndicatedContent',3,'Syndicated content',1031516049);
INSERT INTO international VALUES (2,'SiteMap',3,'Sitemap',1031516049);
INSERT INTO international VALUES (2,'MessageBoard',3,'Berichtenbord',1031516049);
INSERT INTO international VALUES (2,'LinkList',3,'Regelafstand',1031516049);
INSERT INTO international VALUES (2,'FAQ',3,'FAQ',1031516049);
INSERT INTO international VALUES (2,'EventsCalendar',3,'Evenementen kalender',1031516049);
INSERT INTO international VALUES (1,'WebGUI',3,'Inhoud toevoegen...',1031516049);
INSERT INTO international VALUES (1,'USS',3,'Wie kan goedkeuren?',1031516049);
INSERT INTO international VALUES (1,'SyndicatedContent',3,'URL naar RSS bestand',1031516049);
INSERT INTO international VALUES (1,'SQLReport',3,'SQL rapport',1031516049);
INSERT INTO international VALUES (1,'Poll',3,'Stemming',1031516049);
INSERT INTO international VALUES (1,'LinkList',3,'Inspringen',1031516049);
INSERT INTO international VALUES (1,'ExtraColumn',3,'Extra kolom',1031516049);
INSERT INTO international VALUES (1,'EventsCalendar',3,'Doorgaan naar gebeurtenis toevoegen?',1031516049);
INSERT INTO international VALUES (1,'Article',3,'Artikel',1031516049);
INSERT INTO international VALUES (537,'WebGUI',1,'Karma',1031514049);
INSERT INTO international VALUES (538,'WebGUI',1,'Karma Threshold',1031514049);
INSERT INTO international VALUES (539,'WebGUI',1,'Enable Karma?',1031514049);
INSERT INTO international VALUES (540,'WebGUI',1,'Karma Per Login',1031514049);
INSERT INTO international VALUES (20,'Poll',1,'Karma Per Vote',1031514049);
INSERT INTO international VALUES (541,'WebGUI',1,'Karma Per Post',1031514049);
INSERT INTO international VALUES (5,'Product',1,'Are you certain you wish to delete this specification?',1031514049);
INSERT INTO international VALUES (542,'WebGUI',1,'Previous..',1031514049);
INSERT INTO international VALUES (543,'WebGUI',1,'Add a new image group.',1031514049);
INSERT INTO international VALUES (544,'WebGUI',1,'Are you certain you wish to delete this group?',1031514049);
INSERT INTO international VALUES (545,'WebGUI',1,'Edit Image Group',1031514049);
INSERT INTO international VALUES (546,'WebGUI',1,'Group Id',1031514049);
INSERT INTO international VALUES (547,'WebGUI',1,'Parent group',1031514049);
INSERT INTO international VALUES (548,'WebGUI',1,'Group name',1031514049);
INSERT INTO international VALUES (549,'WebGUI',1,'Group description',1031514049);
INSERT INTO international VALUES (550,'WebGUI',1,'View Image group',1031514049);
INSERT INTO international VALUES (382,'WebGUI',1,'Edit Image',1031514049);
INSERT INTO international VALUES (551,'WebGUI',1,'Notice',1031514049);
INSERT INTO international VALUES (552,'WebGUI',1,'Pending',1031514049);
INSERT INTO international VALUES (553,'WebGUI',1,'Status',1031514049);
INSERT INTO international VALUES (554,'WebGUI',1,'Take Action',1031514049);
INSERT INTO international VALUES (555,'WebGUI',1,'Edit this user\'s karma.',1031514049);
INSERT INTO international VALUES (556,'WebGUI',1,'Amount',1031514049);
INSERT INTO international VALUES (557,'WebGUI',1,'Description',1031514049);
INSERT INTO international VALUES (558,'WebGUI',1,'Edit User\'s Karma',1031514049);
INSERT INTO international VALUES (6,'Item',1,'Edit Item',1031514049);
INSERT INTO international VALUES (559,'WebGUI',1,'Run On Registration',1031514049);
INSERT INTO international VALUES (13,'Product',1,'Brochure',1031514049);
INSERT INTO international VALUES (14,'Product',1,'Manual',1031514049);
INSERT INTO international VALUES (15,'Product',1,'Warranty',1031514049);
INSERT INTO international VALUES (16,'Product',1,'Add Accessory',1031514049);
INSERT INTO international VALUES (17,'Product',1,'Accessory',1031514049);
INSERT INTO international VALUES (18,'Product',1,'Add another accessory?',1031514049);
INSERT INTO international VALUES (21,'Product',1,'Add another related product?',1031514049);
INSERT INTO international VALUES (19,'Product',1,'Add Related Product',1031514049);
INSERT INTO international VALUES (20,'Product',1,'Related Product',1031514049);
INSERT INTO international VALUES (22,'Product',1,'Edit Feature',1031514049);
INSERT INTO international VALUES (23,'Product',1,'Feature',1031514049);
INSERT INTO international VALUES (24,'Product',1,'Add another feature?',1031514049);
INSERT INTO international VALUES (25,'Product',1,'Edit Specification',1031514049);
INSERT INTO international VALUES (26,'Product',1,'Label',1031514049);
INSERT INTO international VALUES (27,'Product',1,'Specification',1031514049);
INSERT INTO international VALUES (28,'Product',1,'Add another specification?',1031514049);
INSERT INTO international VALUES (29,'Product',1,'Units',1031514049);
INSERT INTO international VALUES (30,'Product',1,'Features',1031514049);
INSERT INTO international VALUES (31,'Product',1,'Specifications',1031514049);
INSERT INTO international VALUES (32,'Product',1,'Accessories',1031514049);
INSERT INTO international VALUES (33,'Product',1,'Related Products',1031514049);
INSERT INTO international VALUES (34,'Product',1,'Add a feature.',1031514049);
INSERT INTO international VALUES (35,'Product',1,'Add a specification.',1031514049);
INSERT INTO international VALUES (36,'Product',1,'Add an accessory.',1031514049);
INSERT INTO international VALUES (37,'Product',1,'Add a related product.',1031514049);
INSERT INTO international VALUES (581,'WebGUI',1,'Add New Value',1031514049);
INSERT INTO international VALUES (582,'WebGUI',1,'Leave Blank',1031514049);
INSERT INTO international VALUES (583,'WebGUI',1,'Max Image Size',1031514049);
INSERT INTO international VALUES (1,'WobjectProxy',1,'Wobject To Proxy',1031514049);
INSERT INTO international VALUES (2,'WobjectProxy',1,'Edit Wobject Proxy',1031514049);
INSERT INTO international VALUES (3,'WobjectProxy',1,'Wobject Proxy',1031514049);
INSERT INTO international VALUES (4,'WobjectProxy',1,'Wobject proxying failed. Perhaps the proxied wobject has been deleted.',1031514049);
INSERT INTO international VALUES (5,'USS',7,'����Ͷ�屻�ܾ���',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',7,'�����ȡ��',1031510000);
INSERT INTO international VALUES (5,'SQLReport',7,'DSN',1031510000);
INSERT INTO international VALUES (5,'SiteMap',7,'�༭��վ��ͼ',1031510000);
INSERT INTO international VALUES (5,'Poll',7,'ͼ�ο���',1031510000);
INSERT INTO international VALUES (5,'MessageBoard',7,'�༭��ʱ',1031510000);
INSERT INTO international VALUES (5,'LinkList',7,'�Ƿ�ִ���������ӣ�',1031510000);
INSERT INTO international VALUES (5,'Item',7,'���ظ���',1031510000);
INSERT INTO international VALUES (5,'FAQ',7,'����',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',7,'��� Class',1031510000);
INSERT INTO international VALUES (700,'WebGUI',7,'��',1031510000);
INSERT INTO international VALUES (20,'EventsCalendar',7,'��������',1031510000);
INSERT INTO international VALUES (38,'USS',7,'(�����ʹ���˳��ı����ԣ���ѡ�񡰷񡱡�)',1031510000);
INSERT INTO international VALUES (4,'WebGUI',7,'�������á�',1031510000);
INSERT INTO international VALUES (4,'USS',7,'����Ͷ����ͨ����ˡ�',1031510000);
INSERT INTO international VALUES (4,'SyndicatedContent',7,'�༭ͬ������',1031510000);
INSERT INTO international VALUES (4,'SQLReport',7,'��ѯ',1031510000);
INSERT INTO international VALUES (4,'SiteMap',7,'չ�����',1031510000);
INSERT INTO international VALUES (4,'Poll',7,'ͶƱȨ�ޣ�',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',7,'ÿҳ��ʾ',1031510000);
INSERT INTO international VALUES (4,'LinkList',7,'ǰ׺�ַ�',1031510000);
INSERT INTO international VALUES (4,'Item',7,'��Ŀ',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',7,'����',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',7,'ֻ����һ�Ρ�',1031510000);
INSERT INTO international VALUES (4,'Article',7,'��������',1031510000);
INSERT INTO international VALUES (3,'WebGUI',7,'�Ӽ�������ճ��...',1031510000);
INSERT INTO international VALUES (3,'USS',7,'����һƪ�µ��û�Ͷ��ȴ���ˡ�',1031510000);
INSERT INTO international VALUES (3,'SQLReport',7,'����ģ��',1031510000);
INSERT INTO international VALUES (3,'SiteMap',7,'�Ƿ�Ӵ˼���ʼ��',1031510000);
INSERT INTO international VALUES (3,'Poll',7,'����',1031510000);
INSERT INTO international VALUES (3,'MessageBoard',7,'����Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (3,'LinkList',7,'�Ƿ����´����д򿪣�',1031510000);
INSERT INTO international VALUES (3,'Item',7,'ɾ������',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',7,'�հ�',1031510000);
INSERT INTO international VALUES (3,'Article',7,'��ʼ����',1031510000);
INSERT INTO international VALUES (2,'WebGUI',7,'ҳ',1031510000);
INSERT INTO international VALUES (2,'USS',7,'Ͷ��Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (2,'SyndicatedContent',7,'ͬ������',1031510000);
INSERT INTO international VALUES (2,'SiteMap',7,'��վ��ͼ',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',7,'������',1031510000);
INSERT INTO international VALUES (2,'LinkList',7,'�м��',1031510000);
INSERT INTO international VALUES (2,'Item',7,'����',1031510000);
INSERT INTO international VALUES (2,'FAQ',7,'F.A.Q.',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',7,'������',1031510000);
INSERT INTO international VALUES (507,'WebGUI',7,'�༭ģ��',1031510000);
INSERT INTO international VALUES (1,'WebGUI',7,'��������...',1031510000);
INSERT INTO international VALUES (1,'USS',7,'���Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (1,'SyndicatedContent',7,'RSS �ļ�����',1031510000);
INSERT INTO international VALUES (1,'SQLReport',7,'SQL ����',1031510000);
INSERT INTO international VALUES (1,'Poll',7,'����',1031510000);
INSERT INTO international VALUES (1,'LinkList',7,'����',1031510000);
INSERT INTO international VALUES (1,'Item',7,'���� URL',1031510000);
INSERT INTO international VALUES (1,'ExtraColumn',7,'��չ��',1031510000);
INSERT INTO international VALUES (1,'EventsCalendar',7,'�Ƿ�ִ����������',1031510000);
INSERT INTO international VALUES (1,'Article',7,'����',1031510000);
INSERT INTO international VALUES (367,'WebGUI',7,'����ʱ��',1031510000);
INSERT INTO international VALUES (5,'WebGUI',7,'�����û��顣',1031510000);
INSERT INTO international VALUES (6,'Article',7,'ͼƬ',1031510000);
INSERT INTO international VALUES (701,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',7,'�༭��չ��',1031510000);
INSERT INTO international VALUES (6,'FAQ',7,'�ش�',1031510000);
INSERT INTO international VALUES (6,'LinkList',7,'�����б�',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',7,'�༭������',1031510000);
INSERT INTO international VALUES (6,'Poll',7,'����',1031510000);
INSERT INTO international VALUES (6,'SiteMap',7,'����',1031510000);
INSERT INTO international VALUES (6,'SQLReport',7,'���ݿ��û�',1031510000);
INSERT INTO international VALUES (6,'SyndicatedContent',7,'��ǰ����',1031510000);
INSERT INTO international VALUES (6,'USS',7,'ÿҳͶ����',1031510000);
INSERT INTO international VALUES (6,'WebGUI',7,'�������',1031510000);
INSERT INTO international VALUES (7,'Article',7,'���ӱ���',1031510000);
INSERT INTO international VALUES (7,'FAQ',7,'���Ƿ�ȷ����Ҫɾ��������⣿',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',7,'���ߣ�',1031510000);
INSERT INTO international VALUES (7,'Poll',7,'�ش�',1031510000);
INSERT INTO international VALUES (7,'SiteMap',7,'ǰ׺�ַ�',1031510000);
INSERT INTO international VALUES (7,'SQLReport',7,'���ݿ�����',1031510000);
INSERT INTO international VALUES (7,'USS',7,'ͨ��',1031510000);
INSERT INTO international VALUES (7,'WebGUI',7,'�����û���',1031510000);
INSERT INTO international VALUES (8,'Article',7,'���� URL',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',7,'�ظ�����',1031510000);
INSERT INTO international VALUES (8,'FAQ',7,'�༭ F.A.Q.',1031510000);
INSERT INTO international VALUES (8,'LinkList',7,'URL',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',7,'���ڣ�',1031510000);
INSERT INTO international VALUES (8,'Poll',7,'��ÿ������һ���𰸡���಻����20������',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',7,'���� ID:',1031510000);
INSERT INTO international VALUES (11,'MessageBoard',7,'���������б�',1031510000);
INSERT INTO international VALUES (12,'MessageBoard',7,'�༭����',1031510000);
INSERT INTO international VALUES (13,'MessageBoard',7,'�����ظ�',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',7,'����',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',7,'����',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',7,'����������',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',7,'������ʼ',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',7,'�ظ�',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',7,'���ظ�',1031510000);
INSERT INTO international VALUES (21,'MessageBoard',7,'����Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',7,'ɾ������',1031510000);
INSERT INTO international VALUES (9,'Poll',7,'�༭����',1031510000);
INSERT INTO international VALUES (10,'Poll',7,'��ʼ��ͶƱ��',1031510000);
INSERT INTO international VALUES (11,'Poll',7,'ͶƱ��',1031510000);
INSERT INTO international VALUES (8,'SiteMap',7,'�о�',1031510000);
INSERT INTO international VALUES (8,'SQLReport',7,'Edit SQL Report',1031510000);
INSERT INTO international VALUES (8,'USS',7,'���ܾ�',1031510000);
INSERT INTO international VALUES (8,'WebGUI',7,'���鿴��ҳ�治���ڡ�',1031510000);
INSERT INTO international VALUES (9,'Article',7,'����',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',7,'ֱ��',1031510000);
INSERT INTO international VALUES (9,'FAQ',7,'���������⡣',1031510000);
INSERT INTO international VALUES (9,'LinkList',7,'���Ƿ�ȷ��Ҫɾ�������ӣ�',1031510000);
INSERT INTO international VALUES (9,'SQLReport',7,'<b>Debug:</b> Error: The DSN specified is of an improper format.',1031510000);
INSERT INTO international VALUES (9,'USS',7,'�����',1031510000);
INSERT INTO international VALUES (9,'WebGUI',7,'�鿴������',1031510000);
INSERT INTO international VALUES (10,'Article',7,'�Ƿ�ת���س�����',1031510000);
INSERT INTO international VALUES (10,'FAQ',7,'�༭����',1031510000);
INSERT INTO international VALUES (10,'LinkList',7,'�༭�����б�',1031510000);
INSERT INTO international VALUES (10,'SQLReport',7,'<b>Debug:</b> Error: The SQL specified is of an improper format.',1031510000);
INSERT INTO international VALUES (10,'USS',7,'Ĭ��״̬',1031510000);
INSERT INTO international VALUES (10,'WebGUI',7,'����������',1031510000);
INSERT INTO international VALUES (11,'Article',7,'(�����û���ֶ�����&lt;br&gt;����ѡ���ǡ�)',1031510000);
INSERT INTO international VALUES (76,'EventsCalendar',1,'Delete only this event.',1031514049);
INSERT INTO international VALUES (11,'SQLReport',7,'<b>Debug:</b> Error: There was a problem with the query.',1031510000);
INSERT INTO international VALUES (11,'WebGUI',7,'���������',1031510000);
INSERT INTO international VALUES (12,'Article',7,'�༭����',1031510000);
INSERT INTO international VALUES (12,'EventsCalendar',7,'�༭������',1031510000);
INSERT INTO international VALUES (12,'LinkList',7,'�༭����',1031510000);
INSERT INTO international VALUES (12,'SQLReport',7,'<b>Debug:</b> Error: Could not connect to the database.',1031510000);
INSERT INTO international VALUES (12,'USS',7,'(�����ʹ���˳��ı����ԣ��벻Ҫѡ�����)',1031510000);
INSERT INTO international VALUES (12,'WebGUI',7,'�˳�����',1031510000);
INSERT INTO international VALUES (13,'Article',7,'ɾ��',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',7,'�༭����',1031510000);
INSERT INTO international VALUES (13,'LinkList',7,'���������ӡ�',1031510000);
INSERT INTO international VALUES (13,'USS',7,'Ͷ��ʱ��',1031510000);
INSERT INTO international VALUES (13,'WebGUI',7,'�鿴��������',1031510000);
INSERT INTO international VALUES (14,'Article',7,'ͼƬλ��',1031510000);
INSERT INTO international VALUES (516,'WebGUI',7,'�������',1031510000);
INSERT INTO international VALUES (517,'WebGUI',7,'�˳�����',1031510000);
INSERT INTO international VALUES (515,'WebGUI',7,'�Ƿ����ӱ༭����',1031510000);
INSERT INTO international VALUES (14,'USS',7,'״̬',1031510000);
INSERT INTO international VALUES (14,'WebGUI',7,'�鿴�ȴ���˵�Ͷ��',1031510000);
INSERT INTO international VALUES (15,'USS',7,'�༭/ɾ��',1031510000);
INSERT INTO international VALUES (15,'WebGUI',7,'һ��',1031510000);
INSERT INTO international VALUES (16,'USS',7,'�ޱ���',1031510000);
INSERT INTO international VALUES (16,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (17,'USS',7,'��ȷ��Ҫɾ���˸����',1031510000);
INSERT INTO international VALUES (17,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (18,'USS',7,'�༭�û�Ͷ��ϵͳ',1031510000);
INSERT INTO international VALUES (18,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (19,'USS',7,'�༭Ͷ��',1031510000);
INSERT INTO international VALUES (19,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (20,'USS',7,'��ҪͶ��',1031510000);
INSERT INTO international VALUES (20,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (21,'USS',7,'������',1031510000);
INSERT INTO international VALUES (21,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (22,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (23,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (24,'USS',7,'ͨ��',1031510000);
INSERT INTO international VALUES (24,'WebGUI',7,'ʮ��',1031510000);
INSERT INTO international VALUES (25,'USS',7,'�������',1031510000);
INSERT INTO international VALUES (25,'WebGUI',7,'ʮһ��',1031510000);
INSERT INTO international VALUES (26,'USS',7,'�ܾ�',1031510000);
INSERT INTO international VALUES (26,'WebGUI',7,'ʮ����',1031510000);
INSERT INTO international VALUES (27,'USS',7,'�༭',1031510000);
INSERT INTO international VALUES (27,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (28,'USS',7,'���ظ���б�',1031510000);
INSERT INTO international VALUES (28,'WebGUI',7,'����һ',1031510000);
INSERT INTO international VALUES (29,'USS',7,'�û�Ͷ��ϵͳ',1031510000);
INSERT INTO international VALUES (29,'WebGUI',7,'���ڶ�',1031510000);
INSERT INTO international VALUES (30,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (31,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (32,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (33,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (34,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (35,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (36,'WebGUI',7,'��������ϵͳ����Ա����ʹ�ô˹��ܡ�����ϵ����ϵͳ����Ա�������Ǳ�ϵͳ��ϵͳ����Ա�嵥��',1031510000);
INSERT INTO international VALUES (37,'WebGUI',7,'Ȩ�ޱ��ܾ���',1031510000);
INSERT INTO international VALUES (404,'WebGUI',7,'��һҳ',1031510000);
INSERT INTO international VALUES (38,'WebGUI',7,'��û���㹻��Ȩ��ִ�д����������^a(��¼);Ȼ������һ�Ρ�',1031510000);
INSERT INTO international VALUES (39,'WebGUI',7,'�Բ�����û���㹻��Ȩ�޷���һҳ��',1031510000);
INSERT INTO international VALUES (40,'WebGUI',7,'ϵͳ���',1031510000);
INSERT INTO international VALUES (41,'WebGUI',7,'����Ҫɾ��һ��ϵͳ����������������ϵͳ���ܿ��ܻ��ܵ�Ӱ�졣',1031510000);
INSERT INTO international VALUES (42,'WebGUI',7,'��ȷ��',1031510000);
INSERT INTO international VALUES (43,'WebGUI',7,'���Ƿ�ȷ��Ҫɾ����������',1031510000);
INSERT INTO international VALUES (44,'WebGUI',7,'�ǵģ���ȷ����',1031510000);
INSERT INTO international VALUES (45,'WebGUI',7,'�����Ұ����ˡ�',1031510000);
INSERT INTO international VALUES (46,'WebGUI',7,'�ҵ��ʻ�',1031510000);
INSERT INTO international VALUES (47,'WebGUI',7,'��ҳ',1031510000);
INSERT INTO international VALUES (48,'WebGUI',7,'��ӭ��',1031510000);
INSERT INTO international VALUES (49,'WebGUI',7,'��� <a href=\"^;?op=logout\">�˴�</a> �˳���¼��',1031510000);
INSERT INTO international VALUES (50,'WebGUI',7,'�ʻ�',1031510000);
INSERT INTO international VALUES (51,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (52,'WebGUI',7,'��¼',1031510000);
INSERT INTO international VALUES (53,'WebGUI',7,'��ӡ��ҳ',1031510000);
INSERT INTO international VALUES (54,'WebGUI',7,'�����ʻ�',1031510000);
INSERT INTO international VALUES (55,'WebGUI',7,'���루ȷ�ϣ�',1031510000);
INSERT INTO international VALUES (56,'WebGUI',7,'�����ʼ�',1031510000);
INSERT INTO international VALUES (57,'WebGUI',7,'����ֻ����ϣ��ʹ�õ���Ҫ�����ʼ��Ĺ��ܵ�ʱ�����á�',1031510000);
INSERT INTO international VALUES (58,'WebGUI',7,'���Ѿ�����һ���ʻ���',1031510000);
INSERT INTO international VALUES (59,'WebGUI',7,'�����������롣',1031510000);
INSERT INTO international VALUES (60,'WebGUI',7,'���Ƿ����ϣ��ע�������ʻ�������������������ʻ���Ϣ��������ɾ����',1031510000);
INSERT INTO international VALUES (61,'WebGUI',7,'�����ʻ���Ϣ',1031510000);
INSERT INTO international VALUES (62,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (63,'WebGUI',7,'���������',1031510000);
INSERT INTO international VALUES (64,'WebGUI',7,'�˳���¼��',1031510000);
INSERT INTO international VALUES (65,'WebGUI',7,'��ɾ���ҵ��ʻ���',1031510000);
INSERT INTO international VALUES (66,'WebGUI',7,'�û���¼',1031510000);
INSERT INTO international VALUES (67,'WebGUI',7,'�������ʻ���',1031510000);
INSERT INTO international VALUES (68,'WebGUI',7,'��������ʻ���Ϣ��Ч����������������ʻ������ڣ��������˴�������롣',1031510000);
INSERT INTO international VALUES (69,'WebGUI',7,'�������ҪЭ��������ϵϵͳ����Ա��',1031510000);
INSERT INTO international VALUES (70,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (71,'WebGUI',7,'�ָ�����',1031510000);
INSERT INTO international VALUES (72,'WebGUI',7,'�ָ�',1031510000);
INSERT INTO international VALUES (73,'WebGUI',7,'�û���¼',1031510000);
INSERT INTO international VALUES (74,'WebGUI',7,'�ʻ���Ϣ',1031510000);
INSERT INTO international VALUES (75,'WebGUI',7,'�����ʻ���Ϣ�Ѿ����͵����ĵ����ʼ��С�',1031510000);
INSERT INTO international VALUES (76,'WebGUI',7,'�Բ��𣬴˵����ʼ���ַ����ϵͳ���ݿ��С�',1031510000);
INSERT INTO international VALUES (77,'WebGUI',7,'�Բ��𣬴��ʻ����ѱ������û�ʹ�á�������ѡ��һ���û��������ǽ�����ʹ������������Ϊ��¼����',1031510000);
INSERT INTO international VALUES (78,'WebGUI',7,'����������벻һ�£����������롣',1031510000);
INSERT INTO international VALUES (79,'WebGUI',7,'�������ӵ�Ŀ¼��������',1031510000);
INSERT INTO international VALUES (80,'WebGUI',7,'�����ʻ��ɹ���',1031510000);
INSERT INTO international VALUES (81,'WebGUI',7,'�����ʻ��ɹ���',1031510000);
INSERT INTO international VALUES (82,'WebGUI',7,'��������...',1031510000);
INSERT INTO international VALUES (536,'WebGUI',7,'���û� ^@; �ռ��뱾վ��',1031510000);
INSERT INTO international VALUES (84,'WebGUI',7,'�û���',1031510000);
INSERT INTO international VALUES (85,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (86,'WebGUI',7,'��ȷ��Ҫɾ�����û����𣿴������������ɾ�����û��飬��ȡ�����û����������Ȩ�ޡ�',1031510000);
INSERT INTO international VALUES (87,'WebGUI',7,'�༭�û���',1031510000);
INSERT INTO international VALUES (88,'WebGUI',7,'�û����Ա',1031510000);
INSERT INTO international VALUES (89,'WebGUI',7,'�û���',1031510000);
INSERT INTO international VALUES (90,'WebGUI',7,'�������顣',1031510000);
INSERT INTO international VALUES (91,'WebGUI',7,'��һҳ',1031510000);
INSERT INTO international VALUES (92,'WebGUI',7,'��һҳ',1031510000);
INSERT INTO international VALUES (93,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (94,'WebGUI',7,'�ο�',1031510000);
INSERT INTO international VALUES (95,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (99,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (100,'WebGUI',7,'Meta ��ʶ',1031510000);
INSERT INTO international VALUES (101,'WebGUI',7,'��ȷ��Ҫɾ����ҳ���Լ�ҳ���ڵ��������ݺ������',1031510000);
INSERT INTO international VALUES (102,'WebGUI',7,'�༭ҳ��',1031510000);
INSERT INTO international VALUES (103,'WebGUI',7,'ҳ������',1031510000);
INSERT INTO international VALUES (104,'WebGUI',7,'ҳ�� URL',1031510000);
INSERT INTO international VALUES (105,'WebGUI',7,'���',1031510000);
INSERT INTO international VALUES (106,'WebGUI',7,'ѡ���ǡ�����ҳ���¼�����ҳ�����Ϊ�˷��',1031510000);
INSERT INTO international VALUES (107,'WebGUI',7,'Ȩ������',1031510000);
INSERT INTO international VALUES (108,'WebGUI',7,'ӵ����',1031510000);
INSERT INTO international VALUES (109,'WebGUI',7,'ӵ���߷���Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (110,'WebGUI',7,'ӵ���߱༭Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (111,'WebGUI',7,'�û���',1031510000);
INSERT INTO international VALUES (112,'WebGUI',7,'�û������Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (113,'WebGUI',7,'�û���༭Ȩ�ޣ�',1031510000);
INSERT INTO international VALUES (114,'WebGUI',7,'�κ��˿ɷ��ʣ�',1031510000);
INSERT INTO international VALUES (115,'WebGUI',7,'�κ��˿ɱ༭��',1031510000);
INSERT INTO international VALUES (116,'WebGUI',7,'ѡ���ǡ�����ҳ���¼�����ҳ��Ȩ�޸�Ϊ��Ȩ�����á�',1031510000);
INSERT INTO international VALUES (117,'WebGUI',7,'�༭�û�����',1031510000);
INSERT INTO international VALUES (118,'WebGUI',7,'�����û�ע��',1031510000);
INSERT INTO international VALUES (119,'WebGUI',7,'Ĭ���û���֤��ʽ',1031510000);
INSERT INTO international VALUES (120,'WebGUI',7,'Ĭ�� LDAP URL',1031510000);
INSERT INTO international VALUES (121,'WebGUI',7,'Ĭ�� LDAP Identity',1031510000);
INSERT INTO international VALUES (122,'WebGUI',7,'LDAP Identity ��',1031510000);
INSERT INTO international VALUES (123,'WebGUI',7,'LDAP Password ��',1031510000);
INSERT INTO international VALUES (124,'WebGUI',7,'�༭��˾��Ϣ',1031510000);
INSERT INTO international VALUES (125,'WebGUI',7,'��˾��',1031510000);
INSERT INTO international VALUES (126,'WebGUI',7,'��˾�����ʼ���ַ',1031510000);
INSERT INTO international VALUES (127,'WebGUI',7,'��˾����',1031510000);
INSERT INTO international VALUES (130,'WebGUI',7,'��󸽼���С',1031510000);
INSERT INTO international VALUES (133,'WebGUI',7,'�༭�ʼ�����',1031510000);
INSERT INTO international VALUES (134,'WebGUI',7,'�ָ������ʼ�����',1031510000);
INSERT INTO international VALUES (135,'WebGUI',7,'�ʼ�������',1031510000);
INSERT INTO international VALUES (138,'WebGUI',7,'��',1031510000);
INSERT INTO international VALUES (139,'WebGUI',7,'��',1031510000);
INSERT INTO international VALUES (140,'WebGUI',7,'�༭һ������',1031510000);
INSERT INTO international VALUES (141,'WebGUI',7,'Ĭ��δ�ҵ�ҳ��',1031510000);
INSERT INTO international VALUES (142,'WebGUI',7,'�Ի���ʱ',1031510000);
INSERT INTO international VALUES (143,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (144,'WebGUI',7,'�鿴ͳ����Ϣ��',1031510000);
INSERT INTO international VALUES (145,'WebGUI',7,'ϵͳ�汾',1031510000);
INSERT INTO international VALUES (146,'WebGUI',7,'��Ի�',1031510000);
INSERT INTO international VALUES (147,'WebGUI',7,'ҳ����',1031510000);
INSERT INTO international VALUES (148,'WebGUI',7,'�����',1031510000);
INSERT INTO international VALUES (149,'WebGUI',7,'�û���',1031510000);
INSERT INTO international VALUES (533,'WebGUI',7,'<b>������</b>������',1031510000);
INSERT INTO international VALUES (532,'WebGUI',7,'����<b>����һ��</b>������',1031510000);
INSERT INTO international VALUES (151,'WebGUI',7,'�����',1031510000);
INSERT INTO international VALUES (505,'WebGUI',7,'����һ����ģ��',1031510000);
INSERT INTO international VALUES (504,'WebGUI',7,'ģ��',1031510000);
INSERT INTO international VALUES (502,'WebGUI',7,'��ȷ��Ҫɾ����ģ�壬��������ʹ�ô�ģ���ҳ����ΪĬ��ģ�壿',1031510000);
INSERT INTO international VALUES (154,'WebGUI',7,'���',1031510000);
INSERT INTO international VALUES (155,'WebGUI',7,'��ȷ��Ҫɾ����ҳ���񣬲�������ʹ�ô˷���ҳ������Ϊ����ȫģʽ�����',1031510000);
INSERT INTO international VALUES (156,'WebGUI',7,'�༭���',1031510000);
INSERT INTO international VALUES (157,'WebGUI',7,'���',1031510000);
INSERT INTO international VALUES (158,'WebGUI',7,'�����·��',1031510000);
INSERT INTO international VALUES (160,'WebGUI',7,'�ύ����',1031510000);
INSERT INTO international VALUES (161,'WebGUI',7,'�ύ��',1031510000);
INSERT INTO international VALUES (162,'WebGUI',7,'���Ƿ�ȷ��Ҫ���������������ҳ��������',1031510000);
INSERT INTO international VALUES (163,'WebGUI',7,'�����û�',1031510000);
INSERT INTO international VALUES (164,'WebGUI',7,'�û���֤��ʽ',1031510000);
INSERT INTO international VALUES (165,'WebGUI',7,'LDAP URL',1031510000);
INSERT INTO international VALUES (166,'WebGUI',7,'���� DN',1031510000);
INSERT INTO international VALUES (167,'WebGUI',7,'���Ƿ�ȷ��Ҫɾ�����û���ע��ɾ���û�������ɾ�����û���������Ϣ��',1031510000);
INSERT INTO international VALUES (168,'WebGUI',7,'�༭�û�',1031510000);
INSERT INTO international VALUES (169,'WebGUI',7,'�������û���',1031510000);
INSERT INTO international VALUES (170,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (171,'WebGUI',7,'���ӻ��༭',1031510000);
INSERT INTO international VALUES (174,'WebGUI',7,'�Ƿ���ʾ���⣿',1031510000);
INSERT INTO international VALUES (175,'WebGUI',7,'�Ƿ�ִ�к����',1031510000);
INSERT INTO international VALUES (228,'WebGUI',7,'�༭��Ϣ...',1031510000);
INSERT INTO international VALUES (229,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (230,'WebGUI',7,'��Ϣ',1031510000);
INSERT INTO international VALUES (231,'WebGUI',7,'��������Ϣ...',1031510000);
INSERT INTO international VALUES (232,'WebGUI',7,'�ޱ���',1031510000);
INSERT INTO international VALUES (233,'WebGUI',7,'(eom)',1031510000);
INSERT INTO international VALUES (234,'WebGUI',7,'������Ӧ...',1031510000);
INSERT INTO international VALUES (237,'WebGUI',7,'���⣺',1031510000);
INSERT INTO international VALUES (238,'WebGUI',7,'���ߣ�',1031510000);
INSERT INTO international VALUES (239,'WebGUI',7,'���ڣ�',1031510000);
INSERT INTO international VALUES (240,'WebGUI',7,'��Ϣ ID:',1031510000);
INSERT INTO international VALUES (244,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (245,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (304,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (306,'WebGUI',7,'�û�����',1031510000);
INSERT INTO international VALUES (307,'WebGUI',7,'�Ƿ�ʹ��Ĭ�� meta ��ʶ����',1031510000);
INSERT INTO international VALUES (308,'WebGUI',7,'�༭�û���������',1031510000);
INSERT INTO international VALUES (309,'WebGUI',7,'�Ƿ�����ʹ����ʵ������',1031510000);
INSERT INTO international VALUES (310,'WebGUI',7,'�Ƿ�����ʹ����չ��ϵ��Ϣ��',1031510000);
INSERT INTO international VALUES (311,'WebGUI',7,'�Ƿ�����ʹ�ü�ͥ��Ϣ��',1031510000);
INSERT INTO international VALUES (312,'WebGUI',7,'�Ƿ�����ʹ����ҵ��Ϣ��',1031510000);
INSERT INTO international VALUES (313,'WebGUI',7,'�Ƿ�����ʹ��������Ϣ��',1031510000);
INSERT INTO international VALUES (314,'WebGUI',7,'��',1031510000);
INSERT INTO international VALUES (315,'WebGUI',7,'�м���',1031510000);
INSERT INTO international VALUES (316,'WebGUI',7,'��',1031510000);
INSERT INTO international VALUES (317,'WebGUI',7,'<a href=\"http://www.icq.com\">ICQ</a> UIN',1031510000);
INSERT INTO international VALUES (318,'WebGUI',7,'<a href=\"http://www.aol.com/aim/homenew.adp\">AIM</a> ID',1031510000);
INSERT INTO international VALUES (319,'WebGUI',7,'<a href=\"http://messenger.msn.com/\">MSN Messenger</a> ID',1031510000);
INSERT INTO international VALUES (320,'WebGUI',7,'<a href=\"http://messenger.yahoo.com/\">Yahoo! Messenger</a> ID',1031510000);
INSERT INTO international VALUES (321,'WebGUI',7,'�ƶ��绰',1031510000);
INSERT INTO international VALUES (322,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (323,'WebGUI',7,'��ͥסַ',1031510000);
INSERT INTO international VALUES (324,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (325,'WebGUI',7,'ʡ��',1031510000);
INSERT INTO international VALUES (326,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (327,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (328,'WebGUI',7,'סլ�绰',1031510000);
INSERT INTO international VALUES (329,'WebGUI',7,'��λ��ַ',1031510000);
INSERT INTO international VALUES (330,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (331,'WebGUI',7,'ʡ��',1031510000);
INSERT INTO international VALUES (332,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (333,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (334,'WebGUI',7,'��λ�绰',1031510000);
INSERT INTO international VALUES (335,'WebGUI',7,'�Ա�',1031510000);
INSERT INTO international VALUES (336,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (337,'WebGUI',7,'������ҳ',1031510000);
INSERT INTO international VALUES (338,'WebGUI',7,'�༭�û�����',1031510000);
INSERT INTO international VALUES (339,'WebGUI',7,'��',1031510000);
INSERT INTO international VALUES (340,'WebGUI',7,'Ů',1031510000);
INSERT INTO international VALUES (341,'WebGUI',7,'�༭�û����ԡ�',1031510000);
INSERT INTO international VALUES (342,'WebGUI',7,'�༭�ʻ���Ϣ',1031510000);
INSERT INTO international VALUES (343,'WebGUI',7,'�鿴�û����ԡ�',1031510000);
INSERT INTO international VALUES (351,'WebGUI',7,'��Ϣ',1031510000);
INSERT INTO international VALUES (345,'WebGUI',7,'���Ǳ�վ�û�',1031510000);
INSERT INTO international VALUES (346,'WebGUI',7,'���û������Ǳ�վ�û����޷��ṩ���û��ĸ�����Ϣ��',1031510000);
INSERT INTO international VALUES (347,'WebGUI',7,'�鿴�û����ԣ�',1031510000);
INSERT INTO international VALUES (348,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (349,'WebGUI',7,'���°汾',1031510000);
INSERT INTO international VALUES (350,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (352,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (471,'WebGUI',7,'�༭�û�������',1031510000);
INSERT INTO international VALUES (355,'WebGUI',7,'Ĭ��',1031510000);
INSERT INTO international VALUES (356,'WebGUI',7,'ģ��',1031510000);
INSERT INTO international VALUES (357,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (358,'WebGUI',7,'�󵼺�',1031510000);
INSERT INTO international VALUES (359,'WebGUI',7,'�ҵ���',1031510000);
INSERT INTO international VALUES (360,'WebGUI',7,'һ����',1031510000);
INSERT INTO international VALUES (361,'WebGUI',7,'����һ',1031510000);
INSERT INTO international VALUES (362,'WebGUI',7,'ƽ��',1031510000);
INSERT INTO international VALUES (363,'WebGUI',7,'ģ�嶨λ',1031510000);
INSERT INTO international VALUES (364,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (365,'WebGUI',7,'�������...',1031510000);
INSERT INTO international VALUES (366,'WebGUI',7,'û���ҵ���������������ҳ�档',1031510000);
INSERT INTO international VALUES (368,'WebGUI',7,'�����û��������û��顣',1031510000);
INSERT INTO international VALUES (369,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (370,'WebGUI',7,'�༭�û�����',1031510000);
INSERT INTO international VALUES (371,'WebGUI',7,'�����û�����',1031510000);
INSERT INTO international VALUES (372,'WebGUI',7,'�༭�û�������Ⱥ',1031510000);
INSERT INTO international VALUES (605,'WebGUI',1,'Add Groups',1031514049);
INSERT INTO international VALUES (374,'WebGUI',7,'����������',1031510000);
INSERT INTO international VALUES (375,'WebGUI',7,'ѡ��Ҫչ���İ�����',1031510000);
INSERT INTO international VALUES (376,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (377,'WebGUI',7,'��������Ա��ϵͳ����Աû�ж��������',1031510000);
INSERT INTO international VALUES (31,'USS',7,'����',1031510000);
INSERT INTO international VALUES (32,'USS',7,'ͼƬ',1031510000);
INSERT INTO international VALUES (33,'USS',7,'����',1031510000);
INSERT INTO international VALUES (34,'USS',7,'ת���س�',1031510000);
INSERT INTO international VALUES (35,'USS',7,'����',1031510000);
INSERT INTO international VALUES (21,'EventsCalendar',7,'�Ƿ�ִ����������',1031510000);
INSERT INTO international VALUES (378,'WebGUI',7,'�û� ID',1031510000);
INSERT INTO international VALUES (379,'WebGUI',7,'�û��� ID',1031510000);
INSERT INTO international VALUES (380,'WebGUI',7,'��� ID',1031510000);
INSERT INTO international VALUES (381,'WebGUI',7,'ϵͳ�յ�һ����Ч�ı��������޷���������ͨ������������һЩ�Ƿ��ַ���ͨ���ᵼ�����������밴������ķ��ذ�Ŧ������ҳ�������롣',1031510000);
INSERT INTO international VALUES (1,'FileManager',7,'���ع���',1031510000);
INSERT INTO international VALUES (3,'FileManager',7,'�Ƿ�ִ�������ļ���',1031510000);
INSERT INTO international VALUES (5,'FileManager',7,'�ļ�����',1031510000);
INSERT INTO international VALUES (6,'FileManager',7,'�����ļ�',1031510000);
INSERT INTO international VALUES (7,'FileManager',7,'�����û���',1031510000);
INSERT INTO international VALUES (8,'FileManager',7,'���',1031510000);
INSERT INTO international VALUES (9,'FileManager',7,'�༭���ع���Ա',1031510000);
INSERT INTO international VALUES (10,'FileManager',7,'�༭����',1031510000);
INSERT INTO international VALUES (11,'FileManager',7,'����������',1031510000);
INSERT INTO international VALUES (12,'FileManager',7,'���Ƿ�ȷ��Ҫɾ������������',1031510000);
INSERT INTO international VALUES (22,'FileManager',7,'�Ƿ�ִ���������أ�',1031510000);
INSERT INTO international VALUES (14,'FileManager',7,'�ļ�',1031510000);
INSERT INTO international VALUES (15,'FileManager',7,'����',1031510000);
INSERT INTO international VALUES (16,'FileManager',7,'��������',1031510000);
INSERT INTO international VALUES (15,'Article',7,'����',1031510000);
INSERT INTO international VALUES (16,'Article',7,'����',1031510000);
INSERT INTO international VALUES (17,'Article',7,'����',1031510000);
INSERT INTO international VALUES (37,'USS',7,'ɾ��',1031510000);
INSERT INTO international VALUES (13,'SQLReport',7,'Convert carriage returns?',1031510000);
INSERT INTO international VALUES (17,'FileManager',7,'�����汾 #1',1031510000);
INSERT INTO international VALUES (18,'FileManager',7,'�����汾 #2',1031510000);
INSERT INTO international VALUES (19,'FileManager',7,'û�����������ص��ļ���',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',7,'��ʼ����',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',7,'��������',1031510000);
INSERT INTO international VALUES (20,'FileManager',7,'�ں����עҳ��',1031510000);
INSERT INTO international VALUES (14,'SQLReport',7,'Paginate After',1031510000);
INSERT INTO international VALUES (16,'EventsCalendar',7,'����������',1031510000);
INSERT INTO international VALUES (17,'EventsCalendar',7,'�б���ʽ',1031510000);
INSERT INTO international VALUES (18,'EventsCalendar',7,'Calendar Month',1031510000);
INSERT INTO international VALUES (19,'EventsCalendar',7,'�ں����עҳ��',1031510000);
INSERT INTO international VALUES (529,'WebGUI',7,'���',1031510000);
INSERT INTO international VALUES (383,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (384,'WebGUI',7,'�ļ�',1031510000);
INSERT INTO international VALUES (385,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (386,'WebGUI',7,'�༭ͼ��',1031510000);
INSERT INTO international VALUES (387,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (388,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (389,'WebGUI',7,'ͼ�� ID',1031510000);
INSERT INTO international VALUES (390,'WebGUI',7,'��ʾͼ��...',1031510000);
INSERT INTO international VALUES (391,'WebGUI',7,'ɾ�������ļ���',1031510000);
INSERT INTO international VALUES (392,'WebGUI',7,'��ȷ��Ҫɾ����ͼ����',1031510000);
INSERT INTO international VALUES (393,'WebGUI',7,'����ͼ��',1031510000);
INSERT INTO international VALUES (394,'WebGUI',7,'����ͼ��',1031510000);
INSERT INTO international VALUES (395,'WebGUI',7,'������ͼ��',1031510000);
INSERT INTO international VALUES (396,'WebGUI',7,'�鿴ͼ��',1031510000);
INSERT INTO international VALUES (397,'WebGUI',7,'����ͼ���б���',1031510000);
INSERT INTO international VALUES (398,'WebGUI',7,'�ĵ����Ͷ���',1031510000);
INSERT INTO international VALUES (399,'WebGUI',7,'������ҳ�档',1031510000);
INSERT INTO international VALUES (400,'WebGUI',7,'�Ƿ���ֹ�������棿',1031510000);
INSERT INTO international VALUES (401,'WebGUI',7,'���Ƿ�ȷ��Ҫɾ��������Ϣ�Լ�������Ϣ������������',1031510000);
INSERT INTO international VALUES (402,'WebGUI',7,'��Ҫ�Ķ�����Ϣ�����ڡ�',1031510000);
INSERT INTO international VALUES (403,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (405,'WebGUI',7,'���һҳ',1031510000);
INSERT INTO international VALUES (406,'WebGUI',7,'���մ�С',1031510000);
INSERT INTO international VALUES (21,'FileManager',7,'��ʾ����',1031510000);
INSERT INTO international VALUES (407,'WebGUI',7,'����˴�ע�ᡣ',1031510000);
INSERT INTO international VALUES (15,'SQLReport',7,'Preprocess macros on query?',1031510000);
INSERT INTO international VALUES (16,'SQLReport',7,'Debug?',1031510000);
INSERT INTO international VALUES (17,'SQLReport',7,'<b>Debug:</b> Query:',1031510000);
INSERT INTO international VALUES (18,'SQLReport',7,'There were no results for this query.',1031510000);
INSERT INTO international VALUES (506,'WebGUI',7,'����ģ��',1031510000);
INSERT INTO international VALUES (535,'WebGUI',7,'�����û�ע��ʱ֪ͨ�û���',1031510000);
INSERT INTO international VALUES (353,'WebGUI',7,'���������ռ�����û����Ϣ��',1031510000);
INSERT INTO international VALUES (530,'WebGUI',7,'����<b>����</b>�ؼ���',1031510000);
INSERT INTO international VALUES (408,'WebGUI',7,'������ҳ��',1031510000);
INSERT INTO international VALUES (409,'WebGUI',7,'�����¸�ҳ�档',1031510000);
INSERT INTO international VALUES (410,'WebGUI',7,'������ҳ�档',1031510000);
INSERT INTO international VALUES (411,'WebGUI',7,'Ŀ¼����',1031510000);
INSERT INTO international VALUES (412,'WebGUI',7,'ҳ������',1031510000);
INSERT INTO international VALUES (9,'SiteMap',7,'��ʾ��飿',1031510000);
INSERT INTO international VALUES (18,'Article',7,'�Ƿ��������ۣ�',1031510000);
INSERT INTO international VALUES (19,'Article',7,'˭���Է�����',1031510000);
INSERT INTO international VALUES (20,'Article',7,'˭���Թ�����',1031510000);
INSERT INTO international VALUES (21,'Article',7,'�༭��ʱ',1031510000);
INSERT INTO international VALUES (22,'Article',7,'����',1031510000);
INSERT INTO international VALUES (23,'Article',7,'����',1031510000);
INSERT INTO international VALUES (24,'Article',7,'������Ӧ',1031510000);
INSERT INTO international VALUES (25,'Article',7,'�༭��Ӧ',1031510000);
INSERT INTO international VALUES (26,'Article',7,'ɾ����Ӧ',1031510000);
INSERT INTO international VALUES (27,'Article',7,'��������',1031510000);
INSERT INTO international VALUES (711,'WebGUI',1,'Image Managers Group',1031514049);
INSERT INTO international VALUES (28,'Article',7,'�鿴��Ӧ',1031510000);
INSERT INTO international VALUES (57,'Product',1,'Are you certain you wish to delete this template and set all the products using it to the default template?',1031514049);
INSERT INTO international VALUES (53,'Product',1,'Edit Benefit',1031514049);
INSERT INTO international VALUES (416,'WebGUI',7,'<h1>���������������</h1> \r\n�����������һ�������밴������ķ��ذ�ť������һҳ����һ�Ρ�����������������ڣ�����ϵ���ǣ�ͬʱ������������ʲôʱ��ʹ��ʲô���ܵ�ʱ����ֵ��������лл��',1031510000);
INSERT INTO international VALUES (417,'WebGUI',7,'<h1>��ȫ����</h1>\r\n �����ʵ����������һҳ�ϡ�����Ϣ�Ѿ����͸�ϵͳ����Ա��',1031510000);
INSERT INTO international VALUES (418,'WebGUI',7,'HTML ����',1031510000);
INSERT INTO international VALUES (419,'WebGUI',7,'������еı�ʶ����',1031510000);
INSERT INTO international VALUES (420,'WebGUI',7,'�������еı�ʶ����',1031510000);
INSERT INTO international VALUES (421,'WebGUI',7,'���������ı�ʶ����',1031510000);
INSERT INTO international VALUES (422,'WebGUI',7,'<h1>��¼ʧ��</h1>\r\n��������ʻ���Ϣ����',1031510000);
INSERT INTO international VALUES (423,'WebGUI',7,'�鿴��Ի���',1031510000);
INSERT INTO international VALUES (424,'WebGUI',7,'�鿴��¼��ʷ��¼��',1031510000);
INSERT INTO international VALUES (425,'WebGUI',7,'��Ի�',1031510000);
INSERT INTO international VALUES (426,'WebGUI',7,'��¼��ʷ��¼',1031510000);
INSERT INTO international VALUES (427,'WebGUI',7,'���',1031510000);
INSERT INTO international VALUES (428,'WebGUI',7,'�û� (ID)',1031510000);
INSERT INTO international VALUES (429,'WebGUI',7,'��¼ʱ��',1031510000);
INSERT INTO international VALUES (430,'WebGUI',7,'������ҳ��',1031510000);
INSERT INTO international VALUES (431,'WebGUI',7,'IP ��ַ',1031510000);
INSERT INTO international VALUES (432,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (433,'WebGUI',7,'�û���',1031510000);
INSERT INTO international VALUES (434,'WebGUI',7,'״̬',1031510000);
INSERT INTO international VALUES (435,'WebGUI',7,'�Ի��ź�',1031510000);
INSERT INTO international VALUES (436,'WebGUI',7,'ɱ���˶Ի�',1031510000);
INSERT INTO international VALUES (437,'WebGUI',7,'ͳ����Ϣ',1031510000);
INSERT INTO international VALUES (438,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (439,'WebGUI',7,'������Ϣ',1031510000);
INSERT INTO international VALUES (440,'WebGUI',7,'��ϵ��Ϣ',1031510000);
INSERT INTO international VALUES (441,'WebGUI',7,'�����ʼ�����������',1031510000);
INSERT INTO international VALUES (442,'WebGUI',7,'������Ϣ',1031510000);
INSERT INTO international VALUES (443,'WebGUI',7,'��ͥ��Ϣ',1031510000);
INSERT INTO international VALUES (444,'WebGUI',7,'������˽',1031510000);
INSERT INTO international VALUES (445,'WebGUI',7,'ϲ������',1031510000);
INSERT INTO international VALUES (446,'WebGUI',7,'��λ��վ',1031510000);
INSERT INTO international VALUES (447,'WebGUI',7,'����ҳ����',1031510000);
INSERT INTO international VALUES (448,'WebGUI',7,'ҳ����',1031510000);
INSERT INTO international VALUES (449,'WebGUI',7,'һ����Ϣ',1031510000);
INSERT INTO international VALUES (450,'WebGUI',7,'��λ����',1031510000);
INSERT INTO international VALUES (451,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (452,'WebGUI',7,'������...',1031510000);
INSERT INTO international VALUES (453,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (454,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (455,'WebGUI',7,'�༭�û���Ϣ��',1031510000);
INSERT INTO international VALUES (456,'WebGUI',7,'�����û��б���',1031510000);
INSERT INTO international VALUES (457,'WebGUI',7,'�༭���û��ʻ���',1031510000);
INSERT INTO international VALUES (458,'WebGUI',7,'�༭���û���Ⱥ��',1031510000);
INSERT INTO international VALUES (459,'WebGUI',7,'�༭���û����ԡ�',1031510000);
INSERT INTO international VALUES (460,'WebGUI',7,'ʱ��',1031510000);
INSERT INTO international VALUES (461,'WebGUI',7,'���ڸ�ʽ',1031510000);
INSERT INTO international VALUES (462,'WebGUI',7,'ʱ���ʽ',1031510000);
INSERT INTO international VALUES (463,'WebGUI',7,'�ı�����������',1031510000);
INSERT INTO international VALUES (464,'WebGUI',7,'�ı�����������',1031510000);
INSERT INTO international VALUES (465,'WebGUI',7,'�ı����С',1031510000);
INSERT INTO international VALUES (466,'WebGUI',7,'��ȷ��Ҫɾ��������ҽ��������������Ŀ�ƶ���һ�������',1031510000);
INSERT INTO international VALUES (467,'WebGUI',7,'��ȷ��Ҫɾ������Ŀ���������й��ڴ���Ŀ���û���Ϣ��',1031510000);
INSERT INTO international VALUES (469,'WebGUI',7,'ID',1031510000);
INSERT INTO international VALUES (470,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (472,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (473,'WebGUI',7,'�ɼ���',1031510000);
INSERT INTO international VALUES (474,'WebGUI',7,'���룿',1031510000);
INSERT INTO international VALUES (475,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (476,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (477,'WebGUI',7,'HTML ��',1031510000);
INSERT INTO international VALUES (478,'WebGUI',7,'URL',1031510000);
INSERT INTO international VALUES (479,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (480,'WebGUI',7,'�����ʼ���ַ',1031510000);
INSERT INTO international VALUES (481,'WebGUI',7,'�绰����',1031510000);
INSERT INTO international VALUES (482,'WebGUI',7,'���� (����)',1031510000);
INSERT INTO international VALUES (483,'WebGUI',7,'�ǻ��',1031510000);
INSERT INTO international VALUES (484,'WebGUI',7,'ѡ���б�',1031510000);
INSERT INTO international VALUES (485,'WebGUI',7,'����ֵ (ѡ���)',1031510000);
INSERT INTO international VALUES (486,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (487,'WebGUI',7,'��ѡֵ',1031510000);
INSERT INTO international VALUES (488,'WebGUI',7,'Ĭ��ֵ',1031510000);
INSERT INTO international VALUES (489,'WebGUI',7,'������',1031510000);
INSERT INTO international VALUES (490,'WebGUI',7,'����һ�������ࡣ',1031510000);
INSERT INTO international VALUES (491,'WebGUI',7,'����һ����������',1031510000);
INSERT INTO international VALUES (492,'WebGUI',7,'�������б���',1031510000);
INSERT INTO international VALUES (493,'WebGUI',7,'������վ��',1031510000);
INSERT INTO international VALUES (495,'WebGUI',7,'���ñ༭��',1031510000);
INSERT INTO international VALUES (496,'WebGUI',7,'ʹ��',1031510000);
INSERT INTO international VALUES (494,'WebGUI',7,'Real Objects Edit-On Pro',1031510000);
INSERT INTO international VALUES (497,'WebGUI',7,'��ʼ����',1031510000);
INSERT INTO international VALUES (498,'WebGUI',7,'��������',1031510000);
INSERT INTO international VALUES (499,'WebGUI',7,'��� ID',1031510000);
INSERT INTO international VALUES (500,'WebGUI',7,'ҳ�� ID',1031510000);
INSERT INTO international VALUES (514,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (527,'WebGUI',7,'Ĭ����ҳ',1031510000);
INSERT INTO international VALUES (503,'WebGUI',7,'ģ�� ID',1031510000);
INSERT INTO international VALUES (501,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (528,'WebGUI',7,'ģ������',1031510000);
INSERT INTO international VALUES (468,'WebGUI',7,'�༭�û�������',1031510000);
INSERT INTO international VALUES (159,'WebGUI',7,'�ռ���',1031510000);
INSERT INTO international VALUES (508,'WebGUI',7,'����ģ�塣',1031510000);
INSERT INTO international VALUES (39,'USS',7,'�����ظ�',1031510000);
INSERT INTO international VALUES (41,'USS',7,'����',1031510000);
INSERT INTO international VALUES (42,'USS',7,'�༭��Ӧ',1031510000);
INSERT INTO international VALUES (43,'USS',7,'ɾ����Ӧ',1031510000);
INSERT INTO international VALUES (45,'USS',7,'����Ͷ��ϵͳ',1031510000);
INSERT INTO international VALUES (46,'USS',7,'����...',1031510000);
INSERT INTO international VALUES (47,'USS',7,'�ظ�',1031510000);
INSERT INTO international VALUES (48,'USS',7,'�Ƿ��������ۣ�',1031510000);
INSERT INTO international VALUES (49,'USS',7,'�༭��ʱ',1031510000);
INSERT INTO international VALUES (50,'USS',7,'�����������û���',1031510000);
INSERT INTO international VALUES (44,'USS',7,'�����������û���',1031510000);
INSERT INTO international VALUES (51,'USS',7,'��ʾ���գ�',1031510000);
INSERT INTO international VALUES (52,'USS',7,'����',1031510000);
INSERT INTO international VALUES (53,'USS',7,'����',1031510000);
INSERT INTO international VALUES (72,'USS',1,'Main Template',1036277516);
INSERT INTO international VALUES (57,'USS',7,'��Ӧ',1031510000);
INSERT INTO international VALUES (11,'FAQ',7,'�Ƿ�� TOC ��',1031510000);
INSERT INTO international VALUES (12,'FAQ',7,'�Ƿ�� Q/A ��',1031510000);
INSERT INTO international VALUES (13,'FAQ',7,'�Ƿ�� [top] ���ӣ�',1031510000);
INSERT INTO international VALUES (509,'WebGUI',7,'���۲���',1031510000);
INSERT INTO international VALUES (510,'WebGUI',7,'ƽ��',1031510000);
INSERT INTO international VALUES (511,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (512,'WebGUI',7,'��һ������',1031510000);
INSERT INTO international VALUES (513,'WebGUI',7,'��һ������',1031510000);
INSERT INTO international VALUES (534,'WebGUI',7,'���û���ʾ��',1031510000);
INSERT INTO international VALUES (354,'WebGUI',7,'�鿴�ռ��䡣',1031510000);
INSERT INTO international VALUES (531,'WebGUI',7,'����<b>������ƴд</b>',1031510000);
INSERT INTO international VALUES (518,'WebGUI',7,'�ռ�����ʾ',1031510000);
INSERT INTO international VALUES (519,'WebGUI',7,'��ϣ�������ѡ�',1031510000);
INSERT INTO international VALUES (520,'WebGUI',7,'��ϣ��ͨ�������ʼ��ķ�ʽ���ѡ�',1031510000);
INSERT INTO international VALUES (521,'WebGUI',7,'��ϣ��ͨ�������ʼ��������ķ�ʽ���ѡ�',1031510000);
INSERT INTO international VALUES (522,'WebGUI',7,'��ϣ��ͨ�� ICQ �ķ�ʽ���ѡ�',1031510000);
INSERT INTO international VALUES (523,'WebGUI',7,'����',1031510000);
INSERT INTO international VALUES (524,'WebGUI',7,'�Ƿ����ӱ༭����',1031510000);
INSERT INTO international VALUES (525,'WebGUI',7,'�༭��������',1031510000);
INSERT INTO international VALUES (526,'WebGUI',7,'ֻ��� JavaScript ��',1031510000);
INSERT INTO international VALUES (584,'WebGUI',1,'Add a new language.',1031514049);
INSERT INTO international VALUES (585,'WebGUI',1,'Manage translations.',1031514049);
INSERT INTO international VALUES (586,'WebGUI',1,'Languages',1031514049);
INSERT INTO international VALUES (587,'WebGUI',1,'Are you certain you wish to delete this language and all the help and international messages that go with it?',1031514049);
INSERT INTO international VALUES (589,'WebGUI',1,'Edit Language',1031514049);
INSERT INTO international VALUES (590,'WebGUI',1,'Language ID',1031514049);
INSERT INTO international VALUES (591,'WebGUI',1,'Language',1031514049);
INSERT INTO international VALUES (592,'WebGUI',1,'Character Set',1031514049);
INSERT INTO international VALUES (595,'WebGUI',1,'International Messages',1031514049);
INSERT INTO international VALUES (596,'WebGUI',1,'MISSING',1031514049);
INSERT INTO international VALUES (597,'WebGUI',1,'Edit International Message',1031514049);
INSERT INTO international VALUES (598,'WebGUI',1,'Edit language.',1031514049);
INSERT INTO international VALUES (601,'WebGUI',1,'International ID',1031514049);
INSERT INTO international VALUES (1,'MailForm',1,'Mail Form',1031514049);
INSERT INTO international VALUES (2,'MailForm',1,'Your email subject here',1031514049);
INSERT INTO international VALUES (3,'MailForm',1,'Thank you for your feedback!',1031514049);
INSERT INTO international VALUES (4,'MailForm',1,'Hidden',1031514049);
INSERT INTO international VALUES (5,'MailForm',1,'Displayed',1031514049);
INSERT INTO international VALUES (6,'MailForm',1,'Modifiable',1031514049);
INSERT INTO international VALUES (7,'MailForm',1,'Edit Mail Form',1031514049);
INSERT INTO international VALUES (8,'MailForm',1,'Width',1031514049);
INSERT INTO international VALUES (9,'MailForm',1,'Add Field',1031514049);
INSERT INTO international VALUES (10,'MailForm',1,'From',1031514049);
INSERT INTO international VALUES (11,'MailForm',1,'To (email, username, or group name)',1031514049);
INSERT INTO international VALUES (12,'MailForm',1,'Cc',1031514049);
INSERT INTO international VALUES (13,'MailForm',1,'Bcc',1031514049);
INSERT INTO international VALUES (14,'MailForm',1,'Subject',1031514049);
INSERT INTO international VALUES (15,'MailForm',1,'Proceed to add more fields?',1031514049);
INSERT INTO international VALUES (16,'MailForm',1,'Acknowledgement',1031514049);
INSERT INTO international VALUES (17,'MailForm',1,'Mail Sent',1031514049);
INSERT INTO international VALUES (18,'MailForm',1,'Go back!',1031514049);
INSERT INTO international VALUES (19,'MailForm',1,'Are you certain that you want to delete this field?',1031514049);
INSERT INTO international VALUES (20,'MailForm',1,'Edit Field',1031514049);
INSERT INTO international VALUES (21,'MailForm',1,'Field Name',1031514049);
INSERT INTO international VALUES (22,'MailForm',1,'Status',1031514049);
INSERT INTO international VALUES (23,'MailForm',1,'Type',1031514049);
INSERT INTO international VALUES (24,'MailForm',1,'Possible Values (Drop-Down Box only)',1031514049);
INSERT INTO international VALUES (25,'MailForm',1,'Default Value (optional)',1031514049);
INSERT INTO international VALUES (26,'MailForm',1,'Store Entries?',1031514049);
INSERT INTO international VALUES (491,'WebGUI',8,'Aggiungi un campo al profilo.',1031510000);
INSERT INTO international VALUES (490,'WebGUI',8,'Aggiungi una categoria al profilo.',1031510000);
INSERT INTO international VALUES (489,'WebGUI',8,'Categoria Profilo',1031510000);
INSERT INTO international VALUES (488,'WebGUI',8,'Valore(i) di Default',1031510000);
INSERT INTO international VALUES (487,'WebGUI',8,'Valori Possibili',1031510000);
INSERT INTO international VALUES (486,'WebGUI',8,'Tipo Data',1031510000);
INSERT INTO international VALUES (484,'WebGUI',8,'Seleziona Lista',1031510000);
INSERT INTO international VALUES (485,'WebGUI',8,'Booleano (Checkbox)',1031510000);
INSERT INTO international VALUES (483,'WebGUI',8,'Si o No',1031510000);
INSERT INTO international VALUES (482,'WebGUI',8,'Numero (Intero)',1031510000);
INSERT INTO international VALUES (481,'WebGUI',8,'Telefono',1031510000);
INSERT INTO international VALUES (479,'WebGUI',8,'Data',1031510000);
INSERT INTO international VALUES (480,'WebGUI',8,'Indirizzo Email',1031510000);
INSERT INTO international VALUES (476,'WebGUI',8,'Text Area',1031510000);
INSERT INTO international VALUES (477,'WebGUI',8,'HTML Area',1031510000);
INSERT INTO international VALUES (478,'WebGUI',8,'URL',1031510000);
INSERT INTO international VALUES (475,'WebGUI',8,'Text',1031510000);
INSERT INTO international VALUES (473,'WebGUI',8,'Visibile?',1031510000);
INSERT INTO international VALUES (474,'WebGUI',8,'Campo Richisto?',1031510000);
INSERT INTO international VALUES (470,'WebGUI',8,'Nome',1031510000);
INSERT INTO international VALUES (472,'WebGUI',8,'Etichetta',1031510000);
INSERT INTO international VALUES (469,'WebGUI',8,'Id',1031510000);
INSERT INTO international VALUES (468,'WebGUI',8,'Modifica categoria profilo utenti',1031510000);
INSERT INTO international VALUES (467,'WebGUI',8,'Sei certo di voler cancellare questo campo e tutti i dati ad esso relativi?',1031510000);
INSERT INTO international VALUES (466,'WebGUI',8,'Sei certo di voler cancellare questa categoria e spostare il suo contenuto nella categoria Varie?',1031510000);
INSERT INTO international VALUES (465,'WebGUI',8,'Dimensione Text Box',1031510000);
INSERT INTO international VALUES (464,'WebGUI',8,'Colonne Text Area',1031510000);
INSERT INTO international VALUES (463,'WebGUI',8,'Righe Text Area',1031510000);
INSERT INTO international VALUES (462,'WebGUI',8,'Formato ora',1031510000);
INSERT INTO international VALUES (461,'WebGUI',8,'Formato data',1031510000);
INSERT INTO international VALUES (460,'WebGUI',8,'Time Offset',1031510000);
INSERT INTO international VALUES (459,'WebGUI',8,'Modifica il profilo di questo utente.',1031510000);
INSERT INTO international VALUES (458,'WebGUI',8,'Modifica il gruppo di questo utente.',1031510000);
INSERT INTO international VALUES (457,'WebGUI',8,'Modifica l\'account di questo utente.',1031510000);
INSERT INTO international VALUES (456,'WebGUI',8,'Indietro alla lista degli utenti.',1031510000);
INSERT INTO international VALUES (455,'WebGUI',8,'Modifica il profilo utente',1031510000);
INSERT INTO international VALUES (454,'WebGUI',8,'Ultimo aggiornamento',1031510000);
INSERT INTO international VALUES (452,'WebGUI',8,'Attendi...',1031510000);
INSERT INTO international VALUES (453,'WebGUI',8,'Data di creazione',1031510000);
INSERT INTO international VALUES (450,'WebGUI',8,'Professione (Azienda)',1031510000);
INSERT INTO international VALUES (451,'WebGUI',8,'� richiesto.',1031510000);
INSERT INTO international VALUES (448,'WebGUI',8,'Albero di Navigazione',1031510000);
INSERT INTO international VALUES (449,'WebGUI',8,'Informazioni varie',1031510000);
INSERT INTO international VALUES (447,'WebGUI',8,'Gestisci albero di navigazione.',1031510000);
INSERT INTO international VALUES (446,'WebGUI',8,'Web Site',1031510000);
INSERT INTO international VALUES (445,'WebGUI',8,'Preferenze',1031510000);
INSERT INTO international VALUES (444,'WebGUI',8,'Informazioni Geografiche',1031510000);
INSERT INTO international VALUES (443,'WebGUI',8,'Informazioni Tempo Libero',1031510000);
INSERT INTO international VALUES (441,'WebGUI',8,'Email al Pager ',1031510000);
INSERT INTO international VALUES (442,'WebGUI',8,'Informazioni Professionali',1031510000);
INSERT INTO international VALUES (440,'WebGUI',8,'Contatti',1031510000);
INSERT INTO international VALUES (439,'WebGUI',8,'Informazioni Personali',1031510000);
INSERT INTO international VALUES (438,'WebGUI',8,'Il tuo nome',1031510000);
INSERT INTO international VALUES (436,'WebGUI',8,'Uccidi Sessione',1031510000);
INSERT INTO international VALUES (437,'WebGUI',8,'Statistiche',1031510000);
INSERT INTO international VALUES (435,'WebGUI',8,'Firma di Sessione',1031510000);
INSERT INTO international VALUES (434,'WebGUI',8,'Stato',1031510000);
INSERT INTO international VALUES (433,'WebGUI',8,'User Agent',1031510000);
INSERT INTO international VALUES (432,'WebGUI',8,'Scade',1031510000);
INSERT INTO international VALUES (431,'WebGUI',8,'Indirizzo IP',1031510000);
INSERT INTO international VALUES (430,'WebGUI',8,'Ultima pagina vista',1031510000);
INSERT INTO international VALUES (429,'WebGUI',8,'Ultimo Login',1031510000);
INSERT INTO international VALUES (427,'WebGUI',8,'Stili',1031510000);
INSERT INTO international VALUES (428,'WebGUI',8,'Utente (ID)',1031510000);
INSERT INTO international VALUES (426,'WebGUI',8,'Storico Login',1031510000);
INSERT INTO international VALUES (425,'WebGUI',8,'Sessioni Attive',1031510000);
INSERT INTO international VALUES (424,'WebGUI',8,'Visualizza Storico Login.',1031510000);
INSERT INTO international VALUES (423,'WebGUI',8,'Visualizza Sessioni Attive.',1031510000);
INSERT INTO international VALUES (422,'WebGUI',8,'<h1>Login Fallito!</h1>\r\nLe informazioni che hai provvisto non corrispondono all\'account.',1031510000);
INSERT INTO international VALUES (421,'WebGUI',8,'Rimuovi tutto tranne che la formattazione basilare.',1031510000);
INSERT INTO international VALUES (420,'WebGUI',8,'Lascia com\'�.',1031510000);
INSERT INTO international VALUES (419,'WebGUI',8,'Rimuovi tutti i tag.',1031510000);
INSERT INTO international VALUES (418,'WebGUI',8,'Filtra l\'HTML nei contributi degli utenti',1031510000);
INSERT INTO international VALUES (417,'WebGUI',8,'<h1>Violazione della Sicurezza</h1>\r\nHai cercato di accedere ad un widget non associato a questa pagina. Questo incidente � stato registrato.',1031510000);
INSERT INTO international VALUES (52,'Product',1,'Add another benefit?',1031514049);
INSERT INTO international VALUES (416,'WebGUI',8,'<h1>Problemi con la richiesta</h1>\r\nci sono stati dei problemi con la tua richiesta. Prego clicca sul bottone \"indietro\" del browser e riprova. Se questo problema persiste, contattaci specificando quello che stai tentando di fare e la data dell\'errore.',1031510000);
INSERT INTO international VALUES (28,'Article',8,'Visualizza Risposte',1031510000);
INSERT INTO international VALUES (27,'Article',8,'Torna all\'articolo',1031510000);
INSERT INTO international VALUES (710,'WebGUI',1,'Edit Privilege Settings',1031514049);
INSERT INTO international VALUES (26,'Article',8,'Cancella Risposta',1031510000);
INSERT INTO international VALUES (25,'Article',8,'Modifica Risposta',1031510000);
INSERT INTO international VALUES (24,'Article',8,'Invia Risposta',1031510000);
INSERT INTO international VALUES (21,'Article',8,'Modifica Timeout',1031510000);
INSERT INTO international VALUES (22,'Article',8,'Autore',1031510000);
INSERT INTO international VALUES (23,'Article',8,'Data',1031510000);
INSERT INTO international VALUES (20,'Article',8,'Chi pu� moderare?',1031510000);
INSERT INTO international VALUES (19,'Article',8,'Chi pu� postare?',1031510000);
INSERT INTO international VALUES (18,'Article',8,'Consenti discussione?',1031510000);
INSERT INTO international VALUES (9,'SiteMap',8,'Visualizza Descrizione?',1031510000);
INSERT INTO international VALUES (411,'WebGUI',8,'Titolo nel Menu',1031510000);
INSERT INTO international VALUES (412,'WebGUI',8,'Descrizione',1031510000);
INSERT INTO international VALUES (410,'WebGUI',8,'Gestisci roots.',1031510000);
INSERT INTO international VALUES (409,'WebGUI',8,'Aggiungi una nuova root.',1031510000);
INSERT INTO international VALUES (408,'WebGUI',8,'Gestisci Roots',1031510000);
INSERT INTO international VALUES (18,'SQLReport',8,'Non ci sono risultati per questa query.',1031510000);
INSERT INTO international VALUES (16,'SQLReport',8,'Debug?',1031510000);
INSERT INTO international VALUES (17,'SQLReport',8,'<b>Debug:</b> Query:',1031510000);
INSERT INTO international VALUES (15,'SQLReport',8,'Preprocessa le macro nella query?',1031510000);
INSERT INTO international VALUES (46,'WebGUI',8,'Il mio account',1031510000);
INSERT INTO international VALUES (407,'WebGUI',8,'Clicca qui per registrarti.',1031510000);
INSERT INTO international VALUES (21,'FileManager',8,'Visualizza i  thumbnails?',1031510000);
INSERT INTO international VALUES (406,'WebGUI',8,'Grandezza del Thumbnail',1031510000);
INSERT INTO international VALUES (405,'WebGUI',8,'Ultima Pagina',1031510000);
INSERT INTO international VALUES (403,'WebGUI',8,'Preferisco non dirlo.',1031510000);
INSERT INTO international VALUES (402,'WebGUI',8,'Il messaggio che hai richiesto non esiste.',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',8,'Cancella Messaggio',1031510000);
INSERT INTO international VALUES (21,'MessageBoard',8,'Chi pu� moderare?',1031510000);
INSERT INTO international VALUES (60,'WebGUI',8,'Sei sicuro di voler disattivare il tuo account? Se continui le informazioni del tuo account saranno perse permanentemente.',1031510000);
INSERT INTO international VALUES (401,'WebGUI',8,'Sei sicuro di voler cancellare questo messaggio e tutti i messaggi sotto di esso in questo thread?',1031510000);
INSERT INTO international VALUES (400,'WebGUI',8,'Impedisci la Cache del Proxy',1031510000);
INSERT INTO international VALUES (399,'WebGUI',8,'Valida questa pagina.',1031510000);
INSERT INTO international VALUES (398,'WebGUI',8,'Document Type Declaration',1031510000);
INSERT INTO international VALUES (394,'WebGUI',8,'Gestisci Immagini.',1031510000);
INSERT INTO international VALUES (395,'WebGUI',8,'Aggiungi una nuova Immagine.',1031510000);
INSERT INTO international VALUES (396,'WebGUI',8,'Visualizza Immagine',1031510000);
INSERT INTO international VALUES (397,'WebGUI',8,'Indietro alla lista delle Immagini.',1031510000);
INSERT INTO international VALUES (393,'WebGUI',8,'Gestisci Immagini',1031510000);
INSERT INTO international VALUES (391,'WebGUI',8,'Cancella il file Allegato.',1031510000);
INSERT INTO international VALUES (392,'WebGUI',8,'Sei sicuro di voler cancellare questa Immagine?',1031510000);
INSERT INTO international VALUES (390,'WebGUI',8,'Visualizza Immagine...',1031510000);
INSERT INTO international VALUES (389,'WebGUI',8,'Id Immagine',1031510000);
INSERT INTO international VALUES (387,'WebGUI',8,'Uploadato Da',1031510000);
INSERT INTO international VALUES (388,'WebGUI',8,'Data di Upload',1031510000);
INSERT INTO international VALUES (386,'WebGUI',8,'Modifica Immagine',1031510000);
INSERT INTO international VALUES (385,'WebGUI',8,'Parametri',1031510000);
INSERT INTO international VALUES (384,'WebGUI',8,'File',1031510000);
INSERT INTO international VALUES (19,'EventsCalendar',8,'Cambio Pagina dopo',1031510000);
INSERT INTO international VALUES (383,'WebGUI',8,'Nome',1031510000);
INSERT INTO international VALUES (18,'EventsCalendar',8,'Calendar Month',1031510000);
INSERT INTO international VALUES (16,'EventsCalendar',8,'Layout del Calendario',1031510000);
INSERT INTO international VALUES (17,'EventsCalendar',8,'Lista',1031510000);
INSERT INTO international VALUES (20,'FileManager',8,'Cambio Pagina dopo',1031510000);
INSERT INTO international VALUES (14,'SQLReport',8,'Cambio Pagina dopo',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',8,'Data di Inizio',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',8,'Data di Fine',1031510000);
INSERT INTO international VALUES (19,'FileManager',8,'Non hai files disponibili per il download.',1031510000);
INSERT INTO international VALUES (18,'FileManager',8,'Versione Alternativa #2',1031510000);
INSERT INTO international VALUES (17,'FileManager',8,'Versione Alternativa #1',1031510000);
INSERT INTO international VALUES (13,'SQLReport',8,'Converti gli a capo?',1031510000);
INSERT INTO international VALUES (37,'USS',8,'Cancella',1031510000);
INSERT INTO international VALUES (17,'Article',8,'Centro',1031510000);
INSERT INTO international VALUES (15,'Article',8,'Destra',1031510000);
INSERT INTO international VALUES (16,'Article',8,'Sinistra',1031510000);
INSERT INTO international VALUES (16,'FileManager',8,'Uploadato in Data',1031510000);
INSERT INTO international VALUES (15,'FileManager',8,'Descrizione',1031510000);
INSERT INTO international VALUES (14,'FileManager',8,'File',1031510000);
INSERT INTO international VALUES (9,'FileManager',8,'Modifica Download Manager',1031510000);
INSERT INTO international VALUES (10,'FileManager',8,'Modifica Download',1031510000);
INSERT INTO international VALUES (11,'FileManager',8,'Aggiungi un nuovo download',1031510000);
INSERT INTO international VALUES (12,'FileManager',8,'Sei sicuro di voler cancellare questo download?',1031510000);
INSERT INTO international VALUES (8,'FileManager',8,'Breve Descrizione',1031510000);
INSERT INTO international VALUES (7,'FileManager',8,'Group to Download',1031510000);
INSERT INTO international VALUES (6,'FileManager',8,'Download File',1031510000);
INSERT INTO international VALUES (3,'FileManager',8,'Continua aggiungendo un  file?',1031510000);
INSERT INTO international VALUES (5,'FileManager',8,'Titolo del File',1031510000);
INSERT INTO international VALUES (1,'FileManager',8,'Download Manager',1031510000);
INSERT INTO international VALUES (380,'WebGUI',8,'ID Stile',1031510000);
INSERT INTO international VALUES (381,'WebGUI',8,'Il sistema ha ricevuto un richiesta non valida. Utilizza il tasto bagk del browser e prova ancora',1031510000);
INSERT INTO international VALUES (35,'USS',8,'Titolo',1031510000);
INSERT INTO international VALUES (378,'WebGUI',8,'ID utente',1031510000);
INSERT INTO international VALUES (379,'WebGUI',8,'ID Gruppo',1031510000);
INSERT INTO international VALUES (34,'USS',8,'Converti gli a capo',1031510000);
INSERT INTO international VALUES (33,'USS',8,'Allegato',1031510000);
INSERT INTO international VALUES (32,'USS',8,'Immagine',1031510000);
INSERT INTO international VALUES (31,'USS',8,'Contenuto',1031510000);
INSERT INTO international VALUES (377,'WebGUI',8,'Nessun packages � stato definito dal tuo package manager o amministratore.',1031510000);
INSERT INTO international VALUES (11,'Poll',8,'Vota!',1031510000);
INSERT INTO international VALUES (374,'WebGUI',8,'Visualizza packages.',1031510000);
INSERT INTO international VALUES (375,'WebGUI',8,'Seleziona Package da svolgere',1031510000);
INSERT INTO international VALUES (376,'WebGUI',8,'Package',1031510000);
INSERT INTO international VALUES (373,'WebGUI',8,'<b>Attenzione:</b> modificando la lista dei gruppi sottostante, si resetta ogni informazione sulla scadenza di ogni gruppo ai nuovi defaults.',1031510000);
INSERT INTO international VALUES (371,'WebGUI',8,'Aggiungi Grouping',1031510000);
INSERT INTO international VALUES (372,'WebGUI',8,'Modifica i gruppi dell\'utente',1031510000);
INSERT INTO international VALUES (370,'WebGUI',8,'Modifica Grouping',1031510000);
INSERT INTO international VALUES (369,'WebGUI',8,'Data di scadenza',1031510000);
INSERT INTO international VALUES (368,'WebGUI',8,'Aggiungi un nuovo gruppo a questo utente.',1031510000);
INSERT INTO international VALUES (365,'WebGUI',8,'Risultati della ricerca...',1031510000);
INSERT INTO international VALUES (366,'WebGUI',8,'Non sono state trovate pagine che soddisfano la tua richiesta.',1031510000);
INSERT INTO international VALUES (364,'WebGUI',8,'Cerca',1031510000);
INSERT INTO international VALUES (362,'WebGUI',8,'Fianco a fianco',1031510000);
INSERT INTO international VALUES (363,'WebGUI',8,'Posizione nel Template',1031510000);
INSERT INTO international VALUES (361,'WebGUI',8,'Tre su Una',1031510000);
INSERT INTO international VALUES (359,'WebGUI',8,'Colonna Destra',1031510000);
INSERT INTO international VALUES (360,'WebGUI',8,'Una su Tre',1031510000);
INSERT INTO international VALUES (358,'WebGUI',8,'Colonna Sinistra',1031510000);
INSERT INTO international VALUES (357,'WebGUI',8,'News',1031510000);
INSERT INTO international VALUES (356,'WebGUI',8,'Template',1031510000);
INSERT INTO international VALUES (355,'WebGUI',8,'Default',1031510000);
INSERT INTO international VALUES (471,'WebGUI',8,'Modifica campi profilo utenti',1031510000);
INSERT INTO international VALUES (352,'WebGUI',8,'Data dell\'Elemento',1031510000);
INSERT INTO international VALUES (159,'WebGUI',8,'Inbox',1031510000);
INSERT INTO international VALUES (349,'WebGUI',8,'Ultima Versione Disponibile',1031510000);
INSERT INTO international VALUES (351,'WebGUI',8,'Messaggio',1031510000);
INSERT INTO international VALUES (350,'WebGUI',8,'Completato',1031510000);
INSERT INTO international VALUES (348,'WebGUI',8,'Nome',1031510000);
INSERT INTO international VALUES (347,'WebGUI',8,'Visualizza il Profilo per',1031510000);
INSERT INTO international VALUES (343,'WebGUI',8,'Visualizza Profilo.',1031510000);
INSERT INTO international VALUES (345,'WebGUI',8,'Non membro',1031510000);
INSERT INTO international VALUES (346,'WebGUI',8,'Questo utente non � pi� membro del nostro sito. Non abbiamo altre informazioni su questo utente.',1031510000);
INSERT INTO international VALUES (341,'WebGUI',8,'Modifica Profilo.',1031510000);
INSERT INTO international VALUES (342,'WebGUI',8,'Modifica le informazioni dell\'account.',1031510000);
INSERT INTO international VALUES (337,'WebGUI',8,'Homepage URL',1031510000);
INSERT INTO international VALUES (338,'WebGUI',8,'Modifica  Profilo',1031510000);
INSERT INTO international VALUES (339,'WebGUI',8,'Maschio',1031510000);
INSERT INTO international VALUES (340,'WebGUI',8,'Femmina',1031510000);
INSERT INTO international VALUES (336,'WebGUI',8,'Data di nascita',1031510000);
INSERT INTO international VALUES (335,'WebGUI',8,'Genere',1031510000);
INSERT INTO international VALUES (331,'WebGUI',8,'Stato lavoro',1031510000);
INSERT INTO international VALUES (332,'WebGUI',8,'CAP lavoro',1031510000);
INSERT INTO international VALUES (333,'WebGUI',8,'Provincia lavoro',1031510000);
INSERT INTO international VALUES (334,'WebGUI',8,'Telefono lavoro',1031510000);
INSERT INTO international VALUES (330,'WebGUI',8,'Citt� lavoro',1031510000);
INSERT INTO international VALUES (329,'WebGUI',8,'Indirizzo lavoro',1031510000);
INSERT INTO international VALUES (328,'WebGUI',8,'Telefono casa',1031510000);
INSERT INTO international VALUES (327,'WebGUI',8,'Provincia casa',1031510000);
INSERT INTO international VALUES (326,'WebGUI',8,'CAP casa',1031510000);
INSERT INTO international VALUES (324,'WebGUI',8,'Citt� casa',1031510000);
INSERT INTO international VALUES (325,'WebGUI',8,'Stato casa',1031510000);
INSERT INTO international VALUES (323,'WebGUI',8,'Indirizzo casa',1031510000);
INSERT INTO international VALUES (322,'WebGUI',8,'Pager',1031510000);
INSERT INTO international VALUES (321,'WebGUI',8,'Telefono Cellulare',1031510000);
INSERT INTO international VALUES (320,'WebGUI',8,'<a href=\"http://messenger.yahoo.com/\">Yahoo! Messenger</a> Id',1031510000);
INSERT INTO international VALUES (319,'WebGUI',8,'<a href=\"http://messenger.msn.com/\">MSN Messenger</a> Id',1031510000);
INSERT INTO international VALUES (318,'WebGUI',8,'<a href=\"http://www.aol.com/aim/homenew.adp\">AIM</a> Id',1031510000);
INSERT INTO international VALUES (317,'WebGUI',8,'<a href=\"http://www.icq.com\">ICQ</a> UIN',1031510000);
INSERT INTO international VALUES (316,'WebGUI',8,'Cognome',1031510000);
INSERT INTO international VALUES (315,'WebGUI',8,'Altro Nome',1031510000);
INSERT INTO international VALUES (314,'WebGUI',8,'Nome',1031510000);
INSERT INTO international VALUES (313,'WebGUI',8,'Consenti informazioni varie?',1031510000);
INSERT INTO international VALUES (312,'WebGUI',8,'Consenti informazioni business?',1031510000);
INSERT INTO international VALUES (311,'WebGUI',8,'Consenti informazioni home?',1031510000);
INSERT INTO international VALUES (310,'WebGUI',8,'Consenti informazioni extra sugli account?',1031510000);
INSERT INTO international VALUES (309,'WebGUI',8,'Consenti il nome reale?',1031510000);
INSERT INTO international VALUES (307,'WebGUI',8,'Usa i meta tags di default?',1031510000);
INSERT INTO international VALUES (308,'WebGUI',8,'Modifica i settaggi del profilo',1031510000);
INSERT INTO international VALUES (306,'WebGUI',8,'Binding del Nome Utente',1031510000);
INSERT INTO international VALUES (245,'WebGUI',8,'Data',1031510000);
INSERT INTO international VALUES (304,'WebGUI',8,'Lingua',1031510000);
INSERT INTO international VALUES (244,'WebGUI',8,'Autore',1031510000);
INSERT INTO international VALUES (239,'WebGUI',8,'Data:',1031510000);
INSERT INTO international VALUES (240,'WebGUI',8,'ID Messaggio:',1031510000);
INSERT INTO international VALUES (238,'WebGUI',8,'Autore:',1031510000);
INSERT INTO international VALUES (237,'WebGUI',8,'Oggetto:',1031510000);
INSERT INTO international VALUES (234,'WebGUI',8,'Inviare una Risposta...',1031510000);
INSERT INTO international VALUES (233,'WebGUI',8,'(eom)',1031510000);
INSERT INTO international VALUES (232,'WebGUI',8,'Senza Oggetto',1031510000);
INSERT INTO international VALUES (231,'WebGUI',8,'Inviare un nuovo Messaggio...',1031510000);
INSERT INTO international VALUES (230,'WebGUI',8,'Messaggio',1031510000);
INSERT INTO international VALUES (229,'WebGUI',8,'Oggetto',1031510000);
INSERT INTO international VALUES (228,'WebGUI',8,'Modifica Messaggio...',1031510000);
INSERT INTO international VALUES (175,'WebGUI',8,'Processa le macro?',1031510000);
INSERT INTO international VALUES (174,'WebGUI',8,'Visualizza il Titolo?',1031510000);
INSERT INTO international VALUES (170,'WebGUI',8,'cerca',1031510000);
INSERT INTO international VALUES (171,'WebGUI',8,'Assistente per la creazione del testo',1031510000);
INSERT INTO international VALUES (169,'WebGUI',8,'Aggiungi un nuovo Utente.',1031510000);
INSERT INTO international VALUES (168,'WebGUI',8,'Modifica Utente',1031510000);
INSERT INTO international VALUES (167,'WebGUI',8,'Sei sicuro di voler cancellare questo utente? Sappi che tutte le informazioni associate all\'utente saranno cancellate se procedi.',1031510000);
INSERT INTO international VALUES (165,'WebGUI',8,'LDAP URL',1031510000);
INSERT INTO international VALUES (166,'WebGUI',8,'Connect DN',1031510000);
INSERT INTO international VALUES (163,'WebGUI',8,'Aggiungi Utente',1031510000);
INSERT INTO international VALUES (164,'WebGUI',8,'Metodo di autenticazione',1031510000);
INSERT INTO international VALUES (162,'WebGUI',8,'Sei sicuro di voler cancellare tutte le pagine e i widgets nel cestino?',1031510000);
INSERT INTO international VALUES (161,'WebGUI',8,'Inviato Da',1031510000);
INSERT INTO international VALUES (160,'WebGUI',8,'Inviato in Data',1031510000);
INSERT INTO international VALUES (158,'WebGUI',8,'Aggiungi un nuovo stile.',1031510000);
INSERT INTO international VALUES (353,'WebGUI',8,'Non hai messaggi in Inbox attualmente.',1031510000);
INSERT INTO international VALUES (157,'WebGUI',8,'Stili',1031510000);
INSERT INTO international VALUES (156,'WebGUI',8,'Modifica Stile',1031510000);
INSERT INTO international VALUES (155,'WebGUI',8,'Sei sicuro di voler cancellare questo stile ed assegnare a tutte le pagine che lo usano lo stile \"Fail Safe\" ?',1031510000);
INSERT INTO international VALUES (151,'WebGUI',8,'Nome dello stile',1031510000);
INSERT INTO international VALUES (154,'WebGUI',8,'Style Sheet',1031510000);
INSERT INTO international VALUES (149,'WebGUI',8,'Utenti',1031510000);
INSERT INTO international VALUES (148,'WebGUI',8,'Widgets Visualizzabili',1031510000);
INSERT INTO international VALUES (147,'WebGUI',8,'Pagine Visualizzabili',1031510000);
INSERT INTO international VALUES (144,'WebGUI',8,'Visualizza statistiche.',1031510000);
INSERT INTO international VALUES (145,'WebGUI',8,'Versione',1031510000);
INSERT INTO international VALUES (146,'WebGUI',8,'Sessioni Attive',1031510000);
INSERT INTO international VALUES (143,'WebGUI',8,'Gestisci i settaggi',1031510000);
INSERT INTO international VALUES (142,'WebGUI',8,'Timeout della Sessione',1031510000);
INSERT INTO international VALUES (141,'WebGUI',8,'Pagina non trovata',1031510000);
INSERT INTO international VALUES (140,'WebGUI',8,'Modifica settaggi vari',1031510000);
INSERT INTO international VALUES (134,'WebGUI',8,'Messaggio di Recupero Password',1031510000);
INSERT INTO international VALUES (135,'WebGUI',8,'SMTP Server',1031510000);
INSERT INTO international VALUES (138,'WebGUI',8,'S�',1031510000);
INSERT INTO international VALUES (139,'WebGUI',8,'No',1031510000);
INSERT INTO international VALUES (133,'WebGUI',8,'Modifica i settaggi della Mail',1031510000);
INSERT INTO international VALUES (130,'WebGUI',8,'Massima Dimensione Allegato',1031510000);
INSERT INTO international VALUES (127,'WebGUI',8,'URL dell\'Azienda',1031510000);
INSERT INTO international VALUES (126,'WebGUI',8,'Indirizzo Email dell\'Azienda',1031510000);
INSERT INTO international VALUES (125,'WebGUI',8,'Nome dell\'Azienda',1031510000);
INSERT INTO international VALUES (124,'WebGUI',8,'Modifica informazioni sull\'Azienda',1031510000);
INSERT INTO international VALUES (123,'WebGUI',8,'LDAP Password Name',1031510000);
INSERT INTO international VALUES (122,'WebGUI',8,'LDAP Identity Name',1031510000);
INSERT INTO international VALUES (121,'WebGUI',8,'LDAP Identity (default)',1031510000);
INSERT INTO international VALUES (120,'WebGUI',8,'LDAP URL (default)',1031510000);
INSERT INTO international VALUES (118,'WebGUI',8,'Registrazione Anonima',1031510000);
INSERT INTO international VALUES (119,'WebGUI',8,'Authentication Method (default)',1031510000);
INSERT INTO international VALUES (117,'WebGUI',8,'Modifica settaggi Utente',1031510000);
INSERT INTO international VALUES (116,'WebGUI',8,'Seleziona \"Si\" per dare a tutte le sottopagine gli stessi privilegi di questa.',1031510000);
INSERT INTO international VALUES (115,'WebGUI',8,'Chiunque pu� modificare?',1031510000);
INSERT INTO international VALUES (113,'WebGUI',8,'Il gruppo pu� modificare?',1031510000);
INSERT INTO international VALUES (114,'WebGUI',8,'Chiunque pu� visualizzare?',1031510000);
INSERT INTO international VALUES (112,'WebGUI',8,'Il gruppo pu� visualizzare?',1031510000);
INSERT INTO international VALUES (111,'WebGUI',8,'Gruppo',1031510000);
INSERT INTO international VALUES (110,'WebGUI',8,'Il proprietario pu� modificare?',1031510000);
INSERT INTO international VALUES (109,'WebGUI',8,'Il proprietario pu� visualizzare?',1031510000);
INSERT INTO international VALUES (108,'WebGUI',8,'Proprietario',1031510000);
INSERT INTO international VALUES (107,'WebGUI',8,'Privilegi',1031510000);
INSERT INTO international VALUES (106,'WebGUI',8,'Seleziona \"Si\" per dare a tutte le sottopagine lo stesso stile di questa.',1031510000);
INSERT INTO international VALUES (105,'WebGUI',8,'Stile',1031510000);
INSERT INTO international VALUES (104,'WebGUI',8,'URL della Pagina',1031510000);
INSERT INTO international VALUES (102,'WebGUI',8,'Modifica Pagina',1031510000);
INSERT INTO international VALUES (103,'WebGUI',8,'Specifiche della Pagina',1031510000);
INSERT INTO international VALUES (101,'WebGUI',8,'Sei sicuro di voler cancellare questa pagina, il suo contenuto, e tutti gli elementi sotto di essa?',1031510000);
INSERT INTO international VALUES (100,'WebGUI',8,'Meta Tags',1031510000);
INSERT INTO international VALUES (99,'WebGUI',8,'Titolo',1031510000);
INSERT INTO international VALUES (642,'WebGUI',1,'Page, Add/Edit',1031514049);
INSERT INTO international VALUES (95,'WebGUI',8,'Indice Aiuto',1031510000);
INSERT INTO international VALUES (94,'WebGUI',8,'Vedi anche',1031510000);
INSERT INTO international VALUES (93,'WebGUI',8,'Aiuto',1031510000);
INSERT INTO international VALUES (92,'WebGUI',8,'Pagina Successiva',1031510000);
INSERT INTO international VALUES (91,'WebGUI',8,'Pagina Precedente',1031510000);
INSERT INTO international VALUES (89,'WebGUI',8,'Gruppi',1031510000);
INSERT INTO international VALUES (90,'WebGUI',8,'Aggiungi nuovo gruppo.',1031510000);
INSERT INTO international VALUES (88,'WebGUI',8,'Utenti nel Gruppo',1031510000);
INSERT INTO international VALUES (87,'WebGUI',8,'Modifica Gruppo',1031510000);
INSERT INTO international VALUES (86,'WebGUI',8,'Sei sicuro di voler cancellare questo gruppo? Sappi che cancellare un gruppo � permanente e rimuover� tutti i privilrgi associati a questo gruppo.',1031510000);
INSERT INTO international VALUES (84,'WebGUI',8,'Nome del Gruppo',1031510000);
INSERT INTO international VALUES (85,'WebGUI',8,'Corpo del testo',1031510000);
INSERT INTO international VALUES (82,'WebGUI',8,'Funzioni Amministrative...',1031510000);
INSERT INTO international VALUES (81,'WebGUI',8,'Account aggiornato con successo!',1031510000);
INSERT INTO international VALUES (80,'WebGUI',8,'Account creato con successo!',1031510000);
INSERT INTO international VALUES (79,'WebGUI',8,'Cannot connect to LDAP server.',1031510000);
INSERT INTO international VALUES (78,'WebGUI',8,'Le tue password non corrispondono. Prego prova di nuovo.',1031510000);
INSERT INTO international VALUES (77,'WebGUI',8,'Questo nome di account � gi� in uso da un altro membro di questo sito. Prego scegli un nuovo nome utente. Ecco alcuni suggerimenti:',1031510000);
INSERT INTO international VALUES (76,'WebGUI',8,'Questo indirizzo di email non � nei nostri database.',1031510000);
INSERT INTO international VALUES (75,'WebGUI',8,'Le Informazioni sul tuo account sono state inviate al tuo indirizzo di email.',1031510000);
INSERT INTO international VALUES (74,'WebGUI',8,'Informazioni Account',1031510000);
INSERT INTO international VALUES (73,'WebGUI',8,'Entra.',1031510000);
INSERT INTO international VALUES (72,'WebGUI',8,'recupera',1031510000);
INSERT INTO international VALUES (70,'WebGUI',8,'Errore',1031510000);
INSERT INTO international VALUES (71,'WebGUI',8,'Recupera password',1031510000);
INSERT INTO international VALUES (69,'WebGUI',8,'Prego contatta il tuo amministratore di sistema per assistenza.',1031510000);
INSERT INTO international VALUES (68,'WebGUI',8,'Le informazioni sul\' account non sono valide. O l\'account non esiste oppure hai fornito una combinazione errata di Nome Utente/Password.',1031510000);
INSERT INTO international VALUES (67,'WebGUI',8,'Crea un nuovo account.',1031510000);
INSERT INTO international VALUES (66,'WebGUI',8,'Entra',1031510000);
INSERT INTO international VALUES (65,'WebGUI',8,'Prego disattiva il mio account permanentemente.',1031510000);
INSERT INTO international VALUES (64,'WebGUI',8,'Esci.',1031510000);
INSERT INTO international VALUES (63,'WebGUI',8,'Attiva l\'Interfaccia Amministrativa.',1031510000);
INSERT INTO international VALUES (62,'WebGUI',8,'Salva',1031510000);
INSERT INTO international VALUES (61,'WebGUI',8,'Aggiorna Informazioni dell\'Account',1031510000);
INSERT INTO international VALUES (492,'WebGUI',8,'Lista dei campi del profilo.',1031510000);
INSERT INTO international VALUES (59,'WebGUI',8,'Ho dimenticato la password.',1031510000);
INSERT INTO international VALUES (58,'WebGUI',8,'Ho gi� un account.',1031510000);
INSERT INTO international VALUES (57,'WebGUI',8,'E\' necessario solo se vuoi usare funzioni che richiedono l\'email.',1031510000);
INSERT INTO international VALUES (56,'WebGUI',8,'Indirizzo Email',1031510000);
INSERT INTO international VALUES (55,'WebGUI',8,'Password (conferma)',1031510000);
INSERT INTO international VALUES (54,'WebGUI',8,'Crea Account',1031510000);
INSERT INTO international VALUES (51,'WebGUI',8,'Password',1031510000);
INSERT INTO international VALUES (52,'WebGUI',8,'login',1031510000);
INSERT INTO international VALUES (53,'WebGUI',8,'Rendi Pagina Stampabile',1031510000);
INSERT INTO international VALUES (50,'WebGUI',8,'Nome Utente',1031510000);
INSERT INTO international VALUES (48,'WebGUI',8,'Ciao',1031510000);
INSERT INTO international VALUES (49,'WebGUI',8,'<br>Clicca <a href=\"^\\;?op=logout\">qui</a> per uscire.',1031510000);
INSERT INTO international VALUES (47,'WebGUI',8,'Home',1031510000);
INSERT INTO international VALUES (45,'WebGUI',8,'No, ho fatto uno sbaglio.',1031510000);
INSERT INTO international VALUES (44,'WebGUI',8,'S�, sono sicuro.',1031510000);
INSERT INTO international VALUES (43,'WebGUI',8,'Sei sicuro di voler cancellare questo contenuto?',1031510000);
INSERT INTO international VALUES (42,'WebGUI',8,'Prego Conferma',1031510000);
INSERT INTO international VALUES (41,'WebGUI',8,'Hai cercato di rimuovere un componente vitale del sistema. Se continui pu�\r\ncessare di funzionare.',1031510000);
INSERT INTO international VALUES (40,'WebGUI',8,'Componente Vitale',1031510000);
INSERT INTO international VALUES (39,'WebGUI',8,'Non hai abbastanza privilegi per accedere a questa pagina.',1031510000);
INSERT INTO international VALUES (38,'WebGUI',8,'Non hai abbastanza privilegi per questa operazione. Prego ^a(entra con un account); che ha sufficenti privilegi prima di eseguire questa operazione.',1031510000);
INSERT INTO international VALUES (404,'WebGUI',8,'Prima Pagina',1031510000);
INSERT INTO international VALUES (37,'WebGUI',8,'Permesso negato!',1031510000);
INSERT INTO international VALUES (36,'WebGUI',8,'Devi essere un amministratore per usare questa funzione. Per favore contatta uno degli amministratori. Questa � una lista degli amministratori di questo sistema:',1031510000);
INSERT INTO international VALUES (35,'WebGUI',8,'Funzioni Amministrative',1031510000);
INSERT INTO international VALUES (34,'WebGUI',8,'imposta la data (mm/gg/aaaa)',1031510000);
INSERT INTO international VALUES (33,'WebGUI',8,'Sabato',1031510000);
INSERT INTO international VALUES (31,'WebGUI',8,'Gioved�',1031510000);
INSERT INTO international VALUES (32,'WebGUI',8,'Venerd�',1031510000);
INSERT INTO international VALUES (30,'WebGUI',8,'Mercoled�',1031510000);
INSERT INTO international VALUES (29,'WebGUI',8,'Marted�',1031510000);
INSERT INTO international VALUES (29,'USS',8,'Sistema di Contributi degli Utenti',1031510000);
INSERT INTO international VALUES (28,'WebGUI',8,'Luned�',1031510000);
INSERT INTO international VALUES (28,'USS',8,'Ritorna alla lista dei Contributi',1031510000);
INSERT INTO international VALUES (27,'WebGUI',8,'Domenica',1031510000);
INSERT INTO international VALUES (27,'USS',8,'Modifica',1031510000);
INSERT INTO international VALUES (26,'WebGUI',8,'Dicembre',1031510000);
INSERT INTO international VALUES (26,'USS',8,'Rifiuta',1031510000);
INSERT INTO international VALUES (25,'WebGUI',8,'Novembre',1031510000);
INSERT INTO international VALUES (25,'USS',8,'Lascia Pendenti',1031510000);
INSERT INTO international VALUES (24,'WebGUI',8,'Ottobre',1031510000);
INSERT INTO international VALUES (24,'USS',8,'Approva',1031510000);
INSERT INTO international VALUES (23,'WebGUI',8,'Settembre',1031510000);
INSERT INTO international VALUES (22,'WebGUI',8,'Agosto',1031510000);
INSERT INTO international VALUES (21,'WebGUI',8,'Luglio',1031510000);
INSERT INTO international VALUES (21,'USS',8,'Mandato da',1031510000);
INSERT INTO international VALUES (20,'WebGUI',8,'Giugno',1031510000);
INSERT INTO international VALUES (20,'USS',8,'Manda un nuovo Contributo',1031510000);
INSERT INTO international VALUES (19,'WebGUI',8,'Maggio',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',8,'Ultima Risposta',1031510000);
INSERT INTO international VALUES (19,'USS',8,'Modifica Contributo',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',8,'Risposte',1031510000);
INSERT INTO international VALUES (18,'WebGUI',8,'Aprile',1031510000);
INSERT INTO international VALUES (18,'USS',8,'Modifica il sistema di contributi degli utenti',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',8,'Thread Iniziato',1031510000);
INSERT INTO international VALUES (17,'WebGUI',8,'Marzo',1031510000);
INSERT INTO international VALUES (17,'USS',8,'Sei sicuro di voler cancellare questo contributo?',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',8,'Manda un nuovo Messaggio',1031510000);
INSERT INTO international VALUES (16,'WebGUI',8,'Febbraio',1031510000);
INSERT INTO international VALUES (16,'USS',8,'Senza Titolo',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',8,'Data',1031510000);
INSERT INTO international VALUES (15,'WebGUI',8,'Gennaio',1031510000);
INSERT INTO international VALUES (15,'USS',8,'Modifica/Cancella',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',8,'Autore',1031510000);
INSERT INTO international VALUES (14,'WebGUI',8,'Visualizza i contributi pendenti.',1031510000);
INSERT INTO international VALUES (14,'USS',8,'Stato',1031510000);
INSERT INTO international VALUES (14,'Article',8,'Allinea Immagine',1031510000);
INSERT INTO international VALUES (13,'WebGUI',8,'Visualizza indice dell\'aiuto.',1031510000);
INSERT INTO international VALUES (13,'USS',8,'Data',1031510000);
INSERT INTO international VALUES (13,'MessageBoard',8,'Rispondi',1031510000);
INSERT INTO international VALUES (13,'LinkList',8,'Aggiungi un nuovo link.',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',8,'Modifica Evento',1031510000);
INSERT INTO international VALUES (13,'Article',8,'Cancella',1031510000);
INSERT INTO international VALUES (12,'WebGUI',8,'Spegni interfaccia amministrativa.',1031510000);
INSERT INTO international VALUES (12,'USS',8,'(deseleziona se scrivi in HTML)',1031510000);
INSERT INTO international VALUES (12,'EventsCalendar',8,'Modifica Calendario Eventi',1031510000);
INSERT INTO international VALUES (12,'LinkList',8,'Modifica Link',1031510000);
INSERT INTO international VALUES (12,'MessageBoard',8,'Modifica Messaggio',1031510000);
INSERT INTO international VALUES (12,'SQLReport',8,'Error: Could not connect to the database.',1031510000);
INSERT INTO international VALUES (11,'WebGUI',8,'Svuota il cestino',1031510000);
INSERT INTO international VALUES (12,'Article',8,'Modifica Articolo',1031510000);
INSERT INTO international VALUES (11,'SQLReport',8,'<b>Debug:</b> Errore: c\'� stato un problema con la query.',1031510000);
INSERT INTO international VALUES (11,'MessageBoard',8,'Torna alla lista dei messaggi',1031510000);
INSERT INTO international VALUES (75,'EventsCalendar',1,'Which do you wish to do?',1031514049);
INSERT INTO international VALUES (11,'Article',8,'(Seleziona \"Si\" solo se non hai aggiunto &lt;br&gt; manualmente.)',1031510000);
INSERT INTO international VALUES (10,'WebGUI',8,'Visualizza il cestino.',1031510000);
INSERT INTO international VALUES (10,'USS',8,'Stato predefinito',1031510000);
INSERT INTO international VALUES (10,'SQLReport',8,'Error: The SQL specified is of an improper format.',1031510000);
INSERT INTO international VALUES (10,'Poll',8,'Azzera i voti.',1031510000);
INSERT INTO international VALUES (10,'LinkList',8,'Modifica Lista di Link',1031510000);
INSERT INTO international VALUES (10,'FAQ',8,'Modifica Domanda',1031510000);
INSERT INTO international VALUES (715,'WebGUI',1,'Redirect URL',1031514049);
INSERT INTO international VALUES (10,'Article',8,'Converti gli \'a capo\'?',1031510000);
INSERT INTO international VALUES (9,'WebGUI',8,'Visualizza appunti.',1031510000);
INSERT INTO international VALUES (9,'USS',8,'Pendente',1031510000);
INSERT INTO international VALUES (9,'SQLReport',8,'Error: The DSN specified is of an improper format.',1031510000);
INSERT INTO international VALUES (9,'Poll',8,'Modifica Sondaggio',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',8,'ID Messaggio:',1031510000);
INSERT INTO international VALUES (9,'LinkList',8,'Sei sicuro di voler cancellare questo link?',1031510000);
INSERT INTO international VALUES (9,'FAQ',8,'Aggiungi una nuova domanda.',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',8,'finch�',1031510000);
INSERT INTO international VALUES (9,'Article',8,'Allegato',1031510000);
INSERT INTO international VALUES (8,'WebGUI',8,'Visualizza pagina non trovata.',1031510000);
INSERT INTO international VALUES (8,'USS',8,'Respinto',1031510000);
INSERT INTO international VALUES (8,'SQLReport',8,'Modifica SQL Report',1031510000);
INSERT INTO international VALUES (8,'SiteMap',8,'Spaziatura di linea',1031510000);
INSERT INTO international VALUES (8,'Poll',8,'(Aggiungi una risposta per linea. Non pi� di 20)',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',8,'Data:',1031510000);
INSERT INTO international VALUES (8,'LinkList',8,'URL',1031510000);
INSERT INTO international VALUES (8,'FAQ',8,'Modifica F.A.Q.',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',8,'Ricorre ogni',1031510000);
INSERT INTO international VALUES (8,'Article',8,'URL del Link',1031510000);
INSERT INTO international VALUES (7,'WebGUI',8,'Gestisci gli utenti.',1031510000);
INSERT INTO international VALUES (7,'SQLReport',8,'Password Database',1031510000);
INSERT INTO international VALUES (7,'USS',8,'Approvato',1031510000);
INSERT INTO international VALUES (7,'SiteMap',8,'Bullet',1031510000);
INSERT INTO international VALUES (7,'Poll',8,'Risposte',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',8,'Autore:',1031510000);
INSERT INTO international VALUES (7,'FAQ',8,'Sei sicuro di voler cancellare questa domanda?',1031510000);
INSERT INTO international VALUES (7,'Article',8,'Titolo del link',1031510000);
INSERT INTO international VALUES (6,'WebGUI',8,'Gestisci gli stili.',1031510000);
INSERT INTO international VALUES (6,'USS',8,'Contributi per pagina',1031510000);
INSERT INTO international VALUES (6,'SyndicatedContent',8,'Contenuto Attuale',1031510000);
INSERT INTO international VALUES (6,'SQLReport',8,'Utente Database',1031510000);
INSERT INTO international VALUES (6,'SiteMap',8,'Rientro',1031510000);
INSERT INTO international VALUES (6,'Poll',8,'Domanda',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',8,'Modifica Forum',1031510000);
INSERT INTO international VALUES (6,'LinkList',8,'Lista di Link',1031510000);
INSERT INTO international VALUES (6,'FAQ',8,'Risposta',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',8,'Modifica Colonna Extra',1031510000);
INSERT INTO international VALUES (701,'WebGUI',8,'Settimana',1031510000);
INSERT INTO international VALUES (6,'Article',8,'Immagine',1031510000);
INSERT INTO international VALUES (5,'WebGUI',8,'Gestisci i gruppi.',1031510000);
INSERT INTO international VALUES (5,'USS',8,'Il tuo contributo � stato respinto.',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',8,'Ultimo preso',1031510000);
INSERT INTO international VALUES (5,'SQLReport',8,'DSN',1031510000);
INSERT INTO international VALUES (5,'SiteMap',8,'Modifica la mappa del sito',1031510000);
INSERT INTO international VALUES (5,'Poll',8,'Larghezza del grafico',1031510000);
INSERT INTO international VALUES (5,'MessageBoard',8,'Modifica Timeout',1031510000);
INSERT INTO international VALUES (5,'LinkList',8,'Continua aggiungendo un link?',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',8,'StyleSheet Class',1031510000);
INSERT INTO international VALUES (5,'FAQ',8,'Domanda',1031510000);
INSERT INTO international VALUES (5,'Item',8,'Scarica allegato',1031510000);
INSERT INTO international VALUES (700,'WebGUI',8,'Giorno',1031510000);
INSERT INTO international VALUES (4,'WebGUI',8,'Gestisci i settaggi.',1031510000);
INSERT INTO international VALUES (4,'USS',8,'Il tuo contributo � stato approvato.',1031510000);
INSERT INTO international VALUES (4,'SyndicatedContent',8,'Modifica Contenuto di altri siti',1031510000);
INSERT INTO international VALUES (4,'SQLReport',8,'Query',1031510000);
INSERT INTO international VALUES (4,'SiteMap',8,'Profondit�',1031510000);
INSERT INTO international VALUES (4,'Poll',8,'Chi pu� votare?',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',8,'Messaggi Per Pagina',1031510000);
INSERT INTO international VALUES (4,'LinkList',8,'Bullet',1031510000);
INSERT INTO international VALUES (4,'Item',8,'Item',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',8,'Larghezza',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',8,'Accade solo una volta.',1031510000);
INSERT INTO international VALUES (4,'Article',8,'Data di fine',1031510000);
INSERT INTO international VALUES (3,'WebGUI',8,'Incolla dagli appunti...',1031510000);
INSERT INTO international VALUES (3,'USS',8,'Hai nuovi contenuti degli utenti da approvare.',1031510000);
INSERT INTO international VALUES (3,'SQLReport',8,'Template',1031510000);
INSERT INTO international VALUES (3,'SiteMap',8,'Partire da questo livello?',1031510000);
INSERT INTO international VALUES (3,'Poll',8,'Attivo',1031510000);
INSERT INTO international VALUES (3,'MessageBoard',8,'Chi pu� postare?',1031510000);
INSERT INTO international VALUES (3,'LinkList',8,'Apri in nuova finestra?',1031510000);
INSERT INTO international VALUES (3,'Item',8,'Cancella allegato',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',8,'Spaziatore',1031510000);
INSERT INTO international VALUES (3,'Article',8,'Data di inizio',1031510000);
INSERT INTO international VALUES (2,'WebGUI',8,'Pagina',1031510000);
INSERT INTO international VALUES (2,'USS',8,'Chi pu� contribuire?',1031510000);
INSERT INTO international VALUES (2,'SyndicatedContent',8,'Contenuto da altri siti',1031510000);
INSERT INTO international VALUES (2,'SiteMap',8,'Mappa del sito',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',8,'Forum',1031510000);
INSERT INTO international VALUES (2,'LinkList',8,'Spaziatura di linea',1031510000);
INSERT INTO international VALUES (2,'Item',8,'Allegato',1031510000);
INSERT INTO international VALUES (2,'FAQ',8,'F.A.Q.',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',8,'Calendario Eventi',1031510000);
INSERT INTO international VALUES (1,'WebGUI',8,'Aggiungi contenuto...',1031510000);
INSERT INTO international VALUES (1,'USS',8,'Chi pu� approvare?',1031510000);
INSERT INTO international VALUES (1,'SyndicatedContent',8,'URL del file RSS',1031510000);
INSERT INTO international VALUES (1,'SQLReport',8,'SQL Report',1031510000);
INSERT INTO international VALUES (1,'Poll',8,'Sondaggio',1031510000);
INSERT INTO international VALUES (1,'LinkList',8,'Indentazione',1031510000);
INSERT INTO international VALUES (1,'Item',8,'URL del link',1031510000);
INSERT INTO international VALUES (1,'ExtraColumn',8,'Colonna Extra',1031510000);
INSERT INTO international VALUES (1,'EventsCalendar',8,'Continua aggiungendo un evento?',1031510000);
INSERT INTO international VALUES (1,'Article',8,'Articolo',1031510000);
INSERT INTO international VALUES (367,'WebGUI',8,'Scade dopo',1031510000);
INSERT INTO international VALUES (493,'WebGUI',8,'Torna al sito.',1031510000);
INSERT INTO international VALUES (495,'WebGUI',8,'Assistente creazione del testo',1031510000);
INSERT INTO international VALUES (496,'WebGUI',8,'Editor da utilizzare',1031510000);
INSERT INTO international VALUES (494,'WebGUI',8,'Real Objects Edit-On Pro',1031510000);
INSERT INTO international VALUES (497,'WebGUI',8,'Data di pubblicazione',1031510000);
INSERT INTO international VALUES (498,'WebGUI',8,'Data di oscuramento',1031510000);
INSERT INTO international VALUES (499,'WebGUI',8,'Wobject ID',1031510000);
INSERT INTO international VALUES (22,'FileManager',8,'Continua aggiungendo un download?',1031510000);
INSERT INTO international VALUES (21,'EventsCalendar',8,'Continua aggiungendo un evento?',1031510000);
INSERT INTO international VALUES (20,'EventsCalendar',8,'Aggiungi un evento.',1031510000);
INSERT INTO international VALUES (38,'USS',8,'(Seleziona \"No\" solo se hai usato l\'assistente per la creazione del testo.)',1031510000);
INSERT INTO international VALUES (500,'WebGUI',8,'ID pagina',1031510000);
INSERT INTO international VALUES (501,'WebGUI',8,'Body',1031510000);
INSERT INTO international VALUES (502,'WebGUI',8,'Sei sicuro di voler cancellare questo template e attribuire a tutte le pagine che lo usano il template di default?',1031510000);
INSERT INTO international VALUES (503,'WebGUI',8,'Template ID',1031510000);
INSERT INTO international VALUES (504,'WebGUI',8,'Template',1031510000);
INSERT INTO international VALUES (505,'WebGUI',8,'Aggiungi un nuovo template.',1031510000);
INSERT INTO international VALUES (506,'WebGUI',8,'Gestisci i Templates',1031510000);
INSERT INTO international VALUES (507,'WebGUI',8,'Modifica Template',1031510000);
INSERT INTO international VALUES (508,'WebGUI',8,'Gestisci templates.',1031510000);
INSERT INTO international VALUES (39,'USS',8,'Rispondi',1031510000);
INSERT INTO international VALUES (41,'USS',8,'Data',1031510000);
INSERT INTO international VALUES (42,'USS',8,'Modifica Risposta',1031510000);
INSERT INTO international VALUES (43,'USS',8,'Cancella Risposta',1031510000);
INSERT INTO international VALUES (45,'USS',8,'Torna ad invio',1031510000);
INSERT INTO international VALUES (46,'USS',8,'Leggi di piu\'...',1031510000);
INSERT INTO international VALUES (47,'USS',8,'Rispondi',1031510000);
INSERT INTO international VALUES (48,'USS',8,'Consenti Discussioni?',1031510000);
INSERT INTO international VALUES (49,'USS',8,'Modifica il Timeout',1031510000);
INSERT INTO international VALUES (50,'USS',8,'Chi pu� postare',1031510000);
INSERT INTO international VALUES (44,'USS',8,'Chi pu� Moderare',1031510000);
INSERT INTO international VALUES (51,'USS',8,'Visualizza thumbnails?',1031510000);
INSERT INTO international VALUES (52,'USS',8,'Thumbnail',1031510000);
INSERT INTO international VALUES (53,'USS',8,'Layout',1031510000);
INSERT INTO international VALUES (57,'USS',8,'Risposte',1031510000);
INSERT INTO international VALUES (11,'FAQ',8,'Attiva elenco domande con link?',1031510000);
INSERT INTO international VALUES (12,'FAQ',8,'Attiva D/R ?',1031510000);
INSERT INTO international VALUES (13,'FAQ',8,'Attiva [top] link?',1031510000);
INSERT INTO international VALUES (509,'WebGUI',8,'Layout Discussioni',1031510000);
INSERT INTO international VALUES (510,'WebGUI',8,'Flat',1031510000);
INSERT INTO international VALUES (511,'WebGUI',8,'Threaded',1031510000);
INSERT INTO international VALUES (512,'WebGUI',8,'Prossimo Thread',1031510000);
INSERT INTO international VALUES (513,'WebGUI',8,'Thread Precedente',1031510000);
INSERT INTO international VALUES (514,'WebGUI',8,'Visto',1031510000);
INSERT INTO international VALUES (515,'WebGUI',8,'Aggiungi la data di modifica nei posts?',1031510000);
INSERT INTO international VALUES (517,'WebGUI',8,'Spegni Admin!',1031510000);
INSERT INTO international VALUES (516,'WebGUI',8,'Attiva Admin!',1031510000);
INSERT INTO international VALUES (518,'WebGUI',8,'Inbox Notifiche',1031510000);
INSERT INTO international VALUES (519,'WebGUI',8,'Non voglio ricevere notifiche.',1031510000);
INSERT INTO international VALUES (520,'WebGUI',8,'Voglio ricevere notifiche via email.',1031510000);
INSERT INTO international VALUES (521,'WebGUI',8,'Voglio ricevere notifiche via email al pager.',1031510000);
INSERT INTO international VALUES (522,'WebGUI',8,'Voglio ricevere notifiche via ICQ.',1031510000);
INSERT INTO international VALUES (523,'WebGUI',8,'Notification',1031510000);
INSERT INTO international VALUES (524,'WebGUI',8,'Aggiungi la data di modifica nei post?',1031510000);
INSERT INTO international VALUES (525,'WebGUI',8,'Modifica Settaggi Contenuti',1031510000);
INSERT INTO international VALUES (526,'WebGUI',8,'Filtra solo JavaScript.',1031510000);
INSERT INTO international VALUES (527,'WebGUI',8,'Home Page di default',1031510000);
INSERT INTO international VALUES (354,'WebGUI',8,'Visualizza Inbox.',1031510000);
INSERT INTO international VALUES (528,'WebGUI',8,'Nome Template',1031510000);
INSERT INTO international VALUES (529,'WebGUI',8,'Risultati',1031510000);
INSERT INTO international VALUES (530,'WebGUI',8,'con <b>tutte</b> le parole',1031510000);
INSERT INTO international VALUES (531,'WebGUI',8,'con la <b>frase esatta</b>',1031510000);
INSERT INTO international VALUES (532,'WebGUI',8,'con <b>almeno</b> queste parole',1031510000);
INSERT INTO international VALUES (533,'WebGUI',8,'<b>senza</b> le parole',1031510000);
INSERT INTO international VALUES (535,'WebGUI',8,'Gruppo a cui notificare un nuovo utente',1031510000);
INSERT INTO international VALUES (534,'WebGUI',8,'Notifica quando si iscrive un nuovo utente?',1031510000);
INSERT INTO international VALUES (536,'WebGUI',8,'Il nuovo utente ^@; si � iscritto al sito.',1031510000);
INSERT INTO international VALUES (537,'WebGUI',8,'Karma',1031510000);
INSERT INTO international VALUES (538,'WebGUI',8,'Soglia del Karma',1031510000);
INSERT INTO international VALUES (539,'WebGUI',8,'Abilita Karma?',1031510000);
INSERT INTO international VALUES (540,'WebGUI',8,'Karma Per Login',1031510000);
INSERT INTO international VALUES (20,'Poll',8,'Karma Per Voto',1031510000);
INSERT INTO international VALUES (541,'WebGUI',8,'Karma Per Post',1031510000);
INSERT INTO international VALUES (30,'USS',8,'Karma Per Contributo',1031510000);
INSERT INTO international VALUES (542,'WebGUI',8,'Precedente..',1031510000);
INSERT INTO international VALUES (543,'WebGUI',8,'Aggiungi un nuovo gruppo',1031510000);
INSERT INTO international VALUES (544,'WebGUI',8,'Sei sicuro di voler cancellare questo gruppo?',1031510000);
INSERT INTO international VALUES (545,'WebGUI',8,'Modifica i Gruppi di Immagini',1031510000);
INSERT INTO international VALUES (546,'WebGUI',8,'Id Gruppo',1031510000);
INSERT INTO international VALUES (547,'WebGUI',8,'Gruppo Genitore',1031510000);
INSERT INTO international VALUES (548,'WebGUI',8,'Nome del Gruppo',1031510000);
INSERT INTO international VALUES (549,'WebGUI',8,'Descrizione del Gruppo',1031510000);
INSERT INTO international VALUES (550,'WebGUI',8,'Visualizza Gruppo di Immagini',1031510000);
INSERT INTO international VALUES (382,'WebGUI',8,'Modifica Immagine',1031510000);
INSERT INTO international VALUES (551,'WebGUI',8,'Avviso',1031510000);
INSERT INTO international VALUES (552,'WebGUI',8,'Pendente',1031510000);
INSERT INTO international VALUES (553,'WebGUI',8,'Stato',1031510000);
INSERT INTO international VALUES (554,'WebGUI',8,'Agisci',1031510000);
INSERT INTO international VALUES (555,'WebGUI',8,'Modifica il karma di questo utente.',1031510000);
INSERT INTO international VALUES (556,'WebGUI',8,'Ammontare',1031510000);
INSERT INTO international VALUES (557,'WebGUI',8,'Descrizione',1031510000);
INSERT INTO international VALUES (558,'WebGUI',8,'Modifica il karma dell\'utente',1031510000);
INSERT INTO international VALUES (61,'FileManager',1,'Download Manager, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'Item',1,'Item, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'FAQ',1,'FAQ, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'SyndicatedContent',1,'Syndicated Content, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'EventsCalendar',1,'Events Calendar, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'MessageBoard',1,'Message Board, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'LinkList',1,'Link List, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'Article',1,'Article, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'ExtraColumn',1,'Extra Column, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'Poll',1,'Poll, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'SiteMap',1,'Site Map, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'SQLReport',1,'SQL Report, Add/Edit',1031514049);
INSERT INTO international VALUES (61,'MailForm',1,'Mail Form, Add/Edit',1031514049);
INSERT INTO international VALUES (62,'MailForm',1,'Mail Form Fields, Add/Edit',1031514049);
INSERT INTO international VALUES (71,'FileManager',1,'The Download Manager is designed to help you manage file distribution on your site. It allows you to specify who may download files from your site.\r\n<p>\r\n\r\n<b>Paginate After</b><br>\r\nHow many files should be displayed before splitting the results into separate pages? In other words, how many files should be displayed per page?\r\n<p>\r\n\r\n<b>Display thumbnails?</b><br>\r\nCheck this if you want to display thumbnails for any images that are uploaded. Note that the thumbnail is only displayed for the main attachment, not the alternate versions.\r\n<p>\r\n\r\n<b>Proceed to add download?</b><br>\r\nIf you wish to start adding files to download right away, leave this checked.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (71,'Item',1,'Like Articles, Items are the Swiss Army knife of WebGUI. Most pieces of static content can be added via the Item, though Items are usually used for smaller content than Articles.\r\n<br><br>\r\n\r\n<b>Link URL</b><br>\r\nThis URL will be attached to the title of this Item.\r\n<br><br>\r\n<i>Example:</i> http://www.google.com\r\n<br><br>\r\n\r\n<b>Attachment</b><br>\r\nIf you wish to attach a word processor file, a zip file, or any other file for download by your users, then choose it from your hard drive.\r\n\r\n',1031514049);
INSERT INTO international VALUES (71,'FAQ',1,'It seems that almost every web site, intranet, and extranet in the world has a Frequently Asked Questions area. This wobject helps you build one, too.\r\n<br><br>\r\n\r\n<b>Turn TOC on?</b><br>\r\nDo you wish to display a TOC (or Table of Contents) for this FAQ? A TOC is a list of links (questions) at the top of the FAQ that link down the answers.\r\n<p>\r\n\r\n<b>Turn Q/A on?</b><br>\r\nSome people wish to display a <b>Q:</b> in front of each question and an <b>A:</b> in front of each answer. This switch enables that.\r\n<p>\r\n\r\n<b>Turn [top] link on?</b><br>\r\nDo you wish to display a link after each answer that takes you back to the top of the page?\r\n<p>\r\n\r\n<b>Proceed to add question?</b><br>\r\nLeave this checked if you want to add questions to the FAQ directly after creating it.\r\n<br><br>\r\n\r\n<hr size=\"1\">\r\n<i><b>Note:</b></i> The following style is specific to the FAQ.\r\n<br><br>\r\n<b>.faqQuestion</b><br>\r\nAn F.A.Q. question. To distinguish it from an answer.\r\n\r\n',1031514049);
INSERT INTO international VALUES (71,'SyndicatedContent',1,'Syndicated content is content that is pulled from another site using the RDF/RSS specification. This technology is often used to pull headlines from various news sites like <a href=\"http://www.cnn.com/\">CNN</a> and  <a href=\"http://slashdot.org/\">Slashdot</a>. It can, of course, be used for other things like sports scores, stock market info, etc.\r\n<br><br>\r\n\r\n<b>URL to RSS file</b><br>\r\nProvide the exact URL (starting with http://) to the syndicated content\'s RDF or RSS file. The syndicated content will be downloaded from this URL hourly.\r\n<br><br>\r\nYou can find syndicated content at the following locations:\r\n</p><ul>\r\n<li><a href=\"http://www.newsisfree.com/\">http://www.newsisfree.com</a>\r\n</li><li><a href=\"http://www.syndic8.com/\">http://www.syndic8.com</a>\r\n</li><li><a href=\"http://www.voidstar.com/node.php?id=144\">http://www.voidstar.com/node.php?id=144</a>\r\n</li><li><a href=\"http://my.userland.com/\">http://my.userland.com</a>\r\n</li><li><a href=\"http://www.webreference.com/services/news/\">http://www.webreference.com/services/news/</a>\r\n</li><li><a href=\"http://www.xmltree.com/\">http://www.xmltree.com</a>\r\n</li><li><a href=\"http://w.moreover.com/\">http://w.moreover.com/</a>\r\n</li></ul>',1031514049);
INSERT INTO international VALUES (71,'EventsCalendar',1,'Events calendars are used on many intranets to keep track of internal dates that affect a whole organization. Also, Events Calendars on consumer sites are a great way to let your customers know what events you\'ll be attending and what promotions you\'ll be having.\r\n<br><br>\r\n\r\n<b>Display Layout</b><br>\r\nThis can be set to <i>List</i> or <i>Calendar</i>. When set to <i>List</i> the events will be listed by date of occurence (and events that have already passed will not be displayed). This type of layout is best suited for Events Calendars that have only a few events per month. When set to <i>Calendar</i> the Events Calendar will display a traditional monthly Calendar, which can be paged through month-by-month. This type of layout is generally used when there are many events in each month.\r\n<br><br>\r\n\r\n<b>Paginate After</b><br>\r\nWhen using the list layout, how many events should be shown per page?\r\n<br><br>\r\n<b>Proceed to add event?</b><br>\r\nLeave this set to yes if you want to add events to the Events Calendar directly after creating it.\r\n<br><br>\r\n\r\n<i>Note:</i> Events that have already happened will not be displayed on the events calendar.\r\n<br><br>\r\n<hr size=\"1\">\r\n<i><b>Note:</b></i> The following style is specific to the Events Calendar.\r\n<br><br>\r\n<b>.eventTitle </b><br>\r\nThe title of an individual event.\r\n\r\n',1031514049);
INSERT INTO international VALUES (71,'MessageBoard',1,'Message boards, also called Forums and/or Discussions, are a great way to add community to any site or intranet. Many companies use message boards internally to collaborate on projects.\r\n<br><br>\r\n\r\n<b>Messages Per Page</b><br>\r\nWhen a visitor first comes to a message board s/he will be presented with a listing of all the topics (a.k.a. threads) of the Message Board. If a board is popular, it will quickly have many topics. The Messages Per Page attribute allows you to specify how many topics should be shown on one page.\r\n<p>\r\n\r\n<b>Who can post?</b><br>\r\nSelect the group that is allowed to post to this discussion.\r\n<p>\r\n\r\n<b>Edit Timeout</b><br>\r\nHow long should a user be able to edit their post before editing is locked to them?\r\n<p>\r\n<i>Note:</i> Don\'t set this limit too high. One of the great things about discussions is that they are an accurate record of who said what. If you allow editing for a long time, then a user has a chance to go back and change his/her mind a long time after the original statement was made.\r\n<p>\r\n\r\n<b>Karma Per Post</b><br>\r\nHow much karma should be given to a user when they post to this discussion?\r\n<p>\r\n\r\n<b>Who can moderate?</b><br>\r\nSelect the group that is allowed to moderate this discussion.\r\n<p>\r\n\r\n<b>Moderation Type?</b><br>\r\nYou can select what type of moderation you\'d like for your users. <i>After-the-fact</i> means that when a user posts a message it is displayed publically right away. <i>Pre-emptive</i> means that a moderator must preview and approve users posts before allowing them to be publically visible. Alerts for new posts will automatically show up in the moderator\'s WebGUI Inbox.\r\n<p>\r\nNote: In both types of moderation the moderator can always edit or delete the messages posted by your users.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (71,'LinkList',1,'Link Lists are just what they sound like, a list of links. Many sites have a links section, and this wobject just automates the process.\r\n<br><br>\r\n\r\n<b>Indent</b><br>\r\nHow many characters should indent each link?\r\n<p>\r\n\r\n<b>Line Spacing</b><br>\r\nHow many carriage returns should be placed between each link?\r\n<p>\r\n\r\n\r\n<b>Bullet</b><br>\r\nSpecify what bullet should be used before each line item. You can leave this blank if you want to. You can also specify HTML bullets like � and �. You can even use images from the image manager by specifying a macro like this ^I(bullet);.\r\n<p>\r\n\r\n\r\n<b>Proceed to add link?</b><br>\r\nLeave this set to yes if you want to add links to the Link List directly after creating it.\r\n<br><br>\r\n\r\n<b>Style</b><br>\r\nAn extra StyleSheet class has been added to this wobject: <b>.linkTitle</b>.  Use this to bold, colorize, or otheriwise manipulate the title of each link.\r\n</p><p>',1031514049);
INSERT INTO international VALUES (71,'Article',1,'Articles are the Swiss Army knife of WebGUI. Most pieces of static content can be added via the Article.\r\n<br><br>\r\n<b>Image</b><br>\r\nChoose an image (.jpg, .gif, .png) file from your hard drive. This file will be uploaded to the server and displayed in your article.\r\n<br><br>\r\n\r\n<b>Align Image</b><br>\r\nChoose where you\'d like to position the image specified above.\r\n</p><p>\r\n\r\n<b>Attachment</b><br>\r\nIf you wish to attach a word processor file, a zip file, or any other file for download by your users, then choose it from your hard drive.\r\n<br><br>\r\n\r\n<b>Link Title</b><br>\r\nIf you wish to add a link to your article, enter the title of the link in this field. \r\n<br><br>\r\n<i>Example:</i> Google\r\n<br><br>\r\n\r\n<b>Link URL</b><br>\r\nIf you added a link title, now add the URL (uniform resource locator) here. \r\n<br><br>\r\n<i>Example:</i> http://www.google.com\r\n\r\n<br><br>\r\n\r\n<b>Convert carriage returns?</b><br>\r\nIf you\'re publishing HTML there\'s generally no need to check this option, but if you aren\'t using HTML and you want a carriage return every place you hit your \"Enter\" key, then check this option.\r\n<p>\r\n\r\n<b>Allow discussion?</b><br>\r\nChecking this box will enable responses to your article much like Articles on Slashdot.org.\r\n<p>\r\n\r\n<b>Who can post?</b><br>\r\nSelect the group that is allowed to post to this discussion.\r\n<p>\r\n\r\n<b>Edit Timeout</b><br>\r\nHow long should a user be able to edit their post before editing is locked to them?\r\n<p>\r\n<i>Note:</i> Don\'t set this limit too high. One of the great things about discussions is that they are an accurate record of who said what. If you allow editing for a long time, then a user has a chance to go back and change his/her mind a long time after the original statement was made.\r\n<p>\r\n\r\n<b>Karma Per Post</b><br>\r\nHow much karma should be given to a user when they post to this discussion?\r\n<p>\r\n\r\n<b>Who can moderate?</b><br>\r\nSelect the group that is allowed to moderate this discussion.\r\n<p>\r\n\r\n<b>Moderation Type?</b><br>\r\nYou can select what type of moderation you\'d like for your users. <i>After-the-fact</i> means that when a user posts a message it is displayed publically right away. <i>Pre-emptive</i> means that a moderator must preview and approve users posts before allowing them to be publically visible. Alerts for new posts will automatically show up in the moderator\'s WebGUI Inbox.\r\n<p>\r\nNote: In both types of moderation the moderator can always edit or delete the messages posted by your users.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (71,'ExtraColumn',1,'Extra columns allow you to change the layout of your page for one page only. If you wish to have multiple columns on all your pages, perhaps you should consider altering the <i>style</i> applied to your pages or use a Template instead of an Extra Column. \r\n<br><br>\r\nColumns are always added from left to right. Therefore any existing content will be on the left of the new column.\r\n<br><br>\r\n<b>Spacer</b><br>\r\nSpacer is the amount of space between your existing content and your new column. It is measured in pixels.\r\n<br><br>\r\n<b>Width</b><br>\r\nWidth is the actual width of the new column to be added. Width is measured in pixels.\r\n<br><br>\r\n<b>StyleSheet Class</b><br>\r\nBy default the <i>content</i> style (which is the style the body of your site should be using) that is applied to all columns. However, if you\'ve created a style specifically for columns, then feel free to modify this class.\r\n',1031514049);
INSERT INTO international VALUES (71,'Poll',1,'Polls can be used to get the impressions of your users on various topics.\r\n<br><br>\r\n<b>Active</b><br>\r\nIf this box is checked, then users will be able to vote. Otherwise they\'ll only be able to see the results of the poll.\r\n<br><br>\r\n\r\n<b>Who can vote?</b><br>\r\nChoose a group that can vote on this Poll.\r\n<br><br>\r\n\r\n<b>Karma Per Vote</b><br>\r\nHow much karma should be given to a user when they vote?\r\n<p>\r\n\r\n<b>Graph Width</b><br>\r\nThe width of the poll results graph. The width is measured in pixels.\r\n<br><br>\r\n\r\n<b>Question</b><br>\r\nWhat is the question you\'d like to ask your users?\r\n<br><br>\r\n\r\n<b>Answers</b><br>\r\nEnter the possible answers to your question. Enter only one answer per line. Polls are only capable of 20 possible answers.\r\n<br><br>\r\n\r\n<b>Randomize answers?</b><br>\r\nIn order to be sure that the ordering of the answers in the poll does not bias your users, it is often helpful to present the options in a random order each time they are shown. Select \"yes\" to randomize the answers on the poll.\r\n<p>\r\n\r\n<b>Reset votes.</b><br>\r\nReset the votes on this Poll.\r\n<br><br>\r\n\r\n<hr size=\"1\">\r\n<i><b>Note:</b></i> The following style sheet entries are custom to the Poll wobject:\r\n<br><br>\r\n\r\n<b>.pollAnswer </b><br>\r\nAn answer on a poll.\r\n<p>\r\n\r\n<b>.pollColor </b>\r\nThe color of the percentage bar on a poll.\r\n<p>\r\n\r\n<b>.pollQuestion </b>\r\nThe question on a poll.\r\n\r\n',1031514049);
INSERT INTO international VALUES (71,'SiteMap',1,'Site maps are used to provide additional navigation in WebGUI. You could set up a traditional site map that would display a hierarchical view of all the pages in the site. On the other hand, you could use site maps to provide extra navigation at certain levels in your site.\r\n<br><br>\r\n\r\n<b>Display synopsis?</b><br>\r\nDo you wish to display page sysnopsis along-side the links to each page? Note that in order for this option to be valid, pages must have synopsis defined.\r\n<br><br>\r\n\r\n<b>Starting from this level?</b><br>\r\nIf the Site Map should display the page tree starting from this level, then check this box. If you wish the Site Map to start from the home page then uncheck it.\r\n<br><br>\r\n\r\n<b>Depth To Traverse</b><br>\r\nHow many levels deep of navigation should the Site Map show? If 0 (zero) is specified, it will show as many levels as there are.\r\n<p>\r\n\r\n<b>Indent\r\nHow many characters should indent each level?\r\n</b></p><p><b>\r\n\r\n<b>Bullet</b><br>\r\nSpecify what bullet should be used before each line item. You can leave this blank if you want to. You can also specify HTML bullets like &middot; and &raquo;. You can even use images from the image manager by specifying a macro like this ^I(bullet);.\r\n</b></p><p><b>\r\n\r\n<b>Line Spacing</b><br>\r\nSpecify how many carriage returns should go between each item in the Site Map. This should be set to 1 or higher.\r\n</b></p><p><b>',1031514049);
INSERT INTO international VALUES (71,'SQLReport',1,'SQL Reports are perhaps the most powerful wobject in the WebGUI arsenal. They allow a user to query data from any database that they have access to. This is great for getting sales figures from your Accounting database or even summarizing all the message boards on your web site.\r\n<p>\r\n\r\n\r\n<b>Preprocess macros on query?</b><br>\r\nIf you\'re using WebGUI macros in your query you\'ll want to check this box.\r\n<p>\r\n\r\n\r\n<b>Debug?</b><br>\r\nIf you want to display debugging and error messages on the page, check this box.\r\n<p>\r\n\r\n\r\n<b>Query</b><br>\r\nThis is a standard SQL query. If you are unfamiliar with SQL, <a href=\"http://www.plainblack.com/\">Plain Black Software</a> provides training courses in SQL and database management. You can make your queries more dynamic by using the ^FormParam(); macro.\r\n<p>\r\n\r\n\r\n<b>Report Template</b><br>\r\nLayout a template of how this report should look. Usually you\'ll use HTML tables to generate a report. An example is included below. If you leave this field blank a template will be generated based on your result set.\r\n<p>\r\n\r\n\r\nThere are special macro characters used in generating SQL Reports. They are ^-;, ^0;, ^1;, ^2;, ^3;, etc. These macros will be processed regardless of whether you checked the process macros box above. The ^- macro represents split points in the document where the report will begin and end looping. The numeric macros represent the data fields that will be returned from your query. There is an additional macro, ^rownum; that counts the rows of the query starting at 1 for use where the lines of the output need to be numbered.\r\n<p>\r\n\r\n\r\n<b>DSN</b><br>\r\n<b>D</b>ata <b>S</b>ource <b>N</b>ame is the unique identifier that Perl uses to describe the location of your database. It takes the format of DBI:[driver]:[database name]:[host]. \r\n<p>\r\n\r\n\r\n<i>Example:</i> DBI:mysql:WebGUI:localhost\r\n<p>\r\n\r\n\r\n<b>Database User</b>\r\nThe username you use to connect to the DSN.\r\n<p>\r\n\r\n\r\n<b>Database Password</b>\r\nThe password you use to connect to the DSN.\r\n<p>\r\n\r\n\r\n<b>Paginate After</b>\r\nHow many rows should be displayed before splitting the results into separate pages? In other words, how many rows should be displayed per page?\r\n<p>\r\n\r\n\r\n<b>Convert carriage returns?</b>\r\nDo you wish to convert the carriage returns in the resultant data to HTML breaks (<br>).\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (71,'MailForm',1,'This wobject creates a simple form that will email an email address when it is filled out.\r\n<br><br>\r\n\r\n<b>Width</b><br>\r\nThe width of all fields in the form.  The default value is 45.\r\n<p>\r\n\r\n<b>From, To, Cc, Bcc, Subject</b><br>\r\nThese fields control how the email will look when sent, and who it is sent to.  You can give your site visitors the ability to modify some or all of these fields, but typically the only fields you will want the user to be able to modify are From and Subject.  Use the drop-down options by each field to choose whether or not the user can see or modify that field.<br>\r\n<br>\r\nYou may also choose to enter a WebGUI username or group in the To field, and the email will be sent to the corresponding user or group.\r\n<p>\r\n\r\n<b>Acknowledgement</b><br>\r\nThis message will be displayed to the user after they click \"Send\".\r\n<p>\r\n\r\n<b>Store Entries?</b><br>\r\nIf set to yes, when your mail form is submitted the entries will be saved to the database for later viewing.  The tool to view these entries is not yet available, but when it is you will be able to view all entries from your form in a centralized location.\r\n<p>\r\n\r\n<b>Proceed to add more fields?</b><br>\r\nLeave this checked if you want to add additional fields to your form directly after creating it.',1031514049);
INSERT INTO international VALUES (72,'MailForm',1,'You may add as many additional fields to your Mail Form as you like.\r\n<br><br>\r\n\r\n<b>Field Name</b><br>\r\nThe name of this field.  It must be unique among all of the other fields on your form.\r\n<p>\r\n\r\n<b>Status</b><br>\r\nHidden fields will not be visible to the user, but will be sent in the email.<br>\r\nDisplayed fields can be seen by the user but not modified.<br>\r\nModifiable fields can be filled in by the user.<br>\r\nIf you choose Hidden or Displayed, be sure to fill in a Default Value.\r\n<p>\r\n\r\n<b>Type</b><br>\r\nChoose the type of form element for this field.  The following field types are supported:<br>\r\nURL: A textbox that will auto-format URL\'s entered.<br>\r\nTextbox: A standard textbox.<br>\r\nDate: A textbox field with a popup window to select a date.<br>\r\nYes/No: A set of yes/no radio buttons.<br>\r\nEmail Address: A textbox that requires the user to enter a valid email address.<br>\r\nTextarea: A simple textarea.<br>\r\nCheckbox: A single checkbox.<br>\r\nDrop-Down Box: A drop-down box. Use the Possible Values field to enter each option to be displayed in the box.  Enter one option per line.\r\n<p>\r\n\r\n<b>Possible Values</b><br>\r\nThis field is only used for the Drop-Down Box type.  Enter the values you wish to appear in your drop-down box, one per line.\r\n<p>\r\n\r\n<b>Default Value (optional)</b><br>\r\nEnter the default value (if any) for the field.  For Yes/No fields, enter \"yes\" to select \"Yes\" and \"no\" to select \"No\".\r\nFor Checkbox fields, enter \"checked\" to check the box.\r\n<p>\r\n\r\n<b>Proceed to add more fields?</b><br>\r\nLeave this checked if you want to add additional fields to your form directly after creating this field.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (625,'WebGUI',1,'<b>Name</b><br>\r\nThe label that this image will be referenced by to include it into pages.\r\n<p>\r\n\r\n<b>File</b><br>\r\nSelect a file from your local drive to upload to the server.\r\n<p>\r\n\r\n<b>Parameters</b><br>\r\nAdd any HTML &ltimg&rt; parameters that you wish to act as the defaults for this image.\r\n<p>\r\n\r\n<i>Example:</i><br>\r\nalign=\"right\"<br>\r\nalt=\"This is an image\"<br>\r\n',1031514049);
INSERT INTO international VALUES (628,'WebGUI',1,'When you delete an image it will be removed from the server and cannot be recovered. Therefore, be sure that you really wish to delete the image before you confirm the delete.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (631,'WebGUI',1,'Using the built in image manager in WebGUI you can upload images to one central location for use anywhere else in the site with no need for any special software or knowledge.\r\nYou can also create image groups to help organize your images. To do so, simply click \"Add a new group.\"\r\n<p>\r\n\r\nTo place the images you\'ve uploaded use the ^I(); and ^i(); macros. More information on them can be found in the Using Macros help.\r\n\r\n<p>\r\n<i>Tip:</i> You can use the ^I(); macro (and therefore the images from the image manager) in places you may not have conisdered. For instance, you could place images in the titles of your wobjects. Or in wobjects like Link List and Site Map that use bullets, you could use image manager images as the bullets.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (633,'WebGUI',1,'Simply put, roots are pages with no parent. The first and most important root in WebGUI is the \"Home\" page. Many people will never add any additional roots, but a few power users will. Those power users will create new roots for many different reasons. Perhaps they\'ll create a staging area for content managers. Or maybe a hidden area for Admin tools. Or possibly even a new root just to place their search engine.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (636,'WebGUI',1,'To create a package follow these simple steps:\r\n\r\n<ol>\r\n<li> From the admin menu select \"Manage packages.\"\r\n</li>\r\n\r\n<li> Add a page and give it a name. The name of the page will be the name of the package.\r\n</li>\r\n\r\n<li> Go to the new page you created and start adding pages and wobjects. Any pages or wobjects you add will be created each time this package is deployed. \r\n</li>\r\n</ol>\r\n\r\n<b>Notes:</b><br>\r\nIn order to add, edit, or delete packages you must be in the Package Mangers group or in the Admins group.\r\n<br><br>\r\n\r\nIf you add content to any of the wobjects, that content will automatically be copied when the package is deployed.\r\n<br><br>\r\n\r\nPrivileges and styles assigned to pages in the package will not be copied when the package is deployed. Instead the pages will take the privileges and styles of the area to which they are deployed.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (635,'WebGUI',1,'Packages are groups of pages and wobjects that are predefined to be deployed together. A package manager may see the need to create a package several pages with a message board, an FAQ, and a Poll because that task is performed quite often. Packages are often defined to lessen the burden of repetitive tasks.\r\n<br><br>\r\nOne package that many people create is a Page/Article package. It is often the case that you want to add a page with an article on it for content. Instead of going through the steps of creating a page, going to the page, and then adding an article to the page, you may wish to simply create a package to do those steps all at once.',1031514049);
INSERT INTO international VALUES (630,'WebGUI',1,'WebGUI has a small, but sturdy real-time search engine built-in. If you wish to use the internal search engine, you can use the ^?; macro, or by adding <i>?op=search</i> to the end of any URL, or feel free to build your own form to access it.\r\n<p>\r\nMany people need a search engine to index their WebGUI site, plus many others. Or they have more advanced needs than what WebGUI\'s search engine allows. In those cases we recommend <a href=\"http://www.mnogosearch.org/\">MnoGo Search</a> or <a href=\"http://www.htdig.org/\">ht://Dig</a>.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (611,'WebGUI',1,'<b>Company Name</b><br>\r\nThe name of your company. It will appear on all emails and anywhere you use the Company Name macro.\r\n<br><br>\r\n\r\n<b>Company Email Address</b><br>\r\nA general email address at your company. This is the address that all automated messages will come from. It can also be used via the WebGUI macro system.\r\n<br><br>\r\n\r\n<b>Company URL</b><br>\r\nThe primary URL of your company. This will appear on all automated emails sent from the WebGUI system. It is also available via the WebGUI macro system.\r\n',1031514049);
INSERT INTO international VALUES (651,'WebGUI',1,'If you choose to empty your trash, any items contained in it will be lost forever. If you\'re unsure about a few items, it might be best to cut them to your clipboard before you empty the trash.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (627,'WebGUI',1,'Profiles are used to extend the information of a particular user. In some cases profiles are important to a site, in others they are not. The profiles system is completely extensible. You can add as much information to the users profile as you like.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (629,'WebGUI',1,'<b>Prevent Proxy Caching</b><br>\r\nSome companies have proxy servers that cause problems with WebGUI. If you\'re experiencing problems with WebGUI, and you have a proxy server, you may want to set this setting to <i>Yes</i>. Beware that WebGUI\'s URLs will not be as user-friendly after this feature is turned on.\r\n<p>\r\n\r\n<b>On Critical Error</b><br>\r\nWhat do you want WebGUI to do if a critical error occurs. It can be a security risk to show debugging information, but you may want to show it if you are in development.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (616,'WebGUI',1,'<b>Path to WebGUI Extras</b><br>\r\nThe web-path to the directory containing WebGUI images and javascript files.\r\n<br><br>\r\n\r\n<b>Maximum Attachment Size</b><br>\r\nThe maximum size of files allowed to be uploaded to this site. This applies to all wobjects that allow uploaded files and images (like Article and User Contributions). This size is measured in kilobytes.\r\n<br><br>\r\n\r\n<b>Thumbnail Size</b><br>\r\nThe size of the longest side of thumbnails. The thumbnail generation maintains the aspect ratio of the image. Therefore, if this value is set to 100, and you have an image that\'s 400 pixels wide and 200 pixels tall, the thumbnail will be 100 pixels wide and 50 pixels tall.\r\n<p>\r\n<i>Note:</i> Thumbnails are automatically generated as images are uploaded to the system.\r\n<p>\r\n\r\n<b>Web Attachment Path</b><br>\r\nThe web-path of the directory where attachments are to be stored.\r\n<br><br>\r\n\r\n<b>Server Attachment Path</b><br>\r\nThe local path of the directory where attachments are to be stored. (Perhaps /var/www/public/uploads) Be sure that the web server has the rights to write to that directory.\r\n',1031514049);
INSERT INTO international VALUES (618,'WebGUI',1,'<b>Recover Password Message</b><br>\r\nThe message that gets sent to a user when they use the \"recover password\" function.\r\n<br><br>\r\n\r\n<b>SMTP Server</b><br>\r\nThis is the address of your local mail server. It is needed for all features that use the Internet email system (such as password recovery).\r\n<p>\r\nOptionally, if you are running a sendmail server on the same machine as WebGUI, you can also specify a path to your sendmail executable. On most Linux systems this can be found at \"/usr/lib/sendmail\".\r\n\r\n',1031514049);
INSERT INTO international VALUES (626,'WebGUI',1,'Wobjects (fomerly known as Widgets) are the true power of WebGUI. Wobjects are tiny pluggable applications built to run under WebGUI. Message boards and polls are examples of wobjects.\r\n<p>\r\n\r\nTo add a wobject to a page, first go to that page, then select <i>Add Content...</i> from the upper left corner of your screen. Each wobject has it\'s own help so be sure to read the help if you\'re not sure how to use it.\r\n<p>\r\n\r\n\r\n<i>Style Sheets</i>: All wobjects have a style-sheet class and id attached to them. \r\n<p>\r\n\r\nThe style-sheet class is the word \"wobject\" plus the type of wobject it is. So for a poll the class would be \"wobjectPoll\". The class pertains to all wobjects of that type in the system. \r\n<p>\r\n\r\nThe style-sheet id is the word \"wobjectId\" plus the Wobject Id for that wobject instance. So if you had an Article with a Wobject Id of 94, then the id would be \"wobjectId94\".\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (632,'WebGUI',1,'You can add wobjects by selecting from the <i>Add Content</i> pulldown menu. You can edit them by clicking on the \"Edit\" button that appears directly above an instance of a particular wobject.\r\n<p>\r\n\r\nAlmost all wobjects share some properties. Those properties are:\r\n<p>\r\n\r\n<b>Wobject ID</b><br>\r\nThis is the unique identifier WebGUI uses to keep track of this wobject instance. Normal users should never need to be concerned with the Wobject ID, but some advanced users may need to know it for things like SQL Reports.\r\n<p>\r\n\r\n\r\n<b>Title</b>\r\nThe title of the wobject. This is typically displayed at the top of each wobject.\r\n<p>\r\n\r\n<i>Note:</i> You should always specify a title even if you are going to turn it off (with the next property). This is because the title shows up in the trash and clipboard and you\'ll want to be able to distinguish which wobject is which.\r\n<p>\r\n\r\n\r\n<b>Display title?</b><br>\r\nDo you wish to display the title you specified? On some sites, displaying the title is not necessary.\r\n<p>\r\n\r\n\r\n<b>Process macros?</b><br>\r\nDo you wish to process macros in the content of this wobject? Sometimes you\'ll want to do this, but more often than not you\'ll want to say \"no\" to this question. By disabling the processing of macros on the wobjects that don\'t use them, you\'ll speed up your web server slightly.\r\n<p>\r\n\r\n\r\n<b>Template Position</b><br>\r\nTemplate positions range from 0 (zero) to any number. How many are available depends upon the Template associated with this page. The default template has only one template position, others may have more. By selecting a template position, you\'re specifying where this wobject should be placed within the template.\r\n<p>\r\n\r\n\r\n<b>Start Date</b><br>\r\nOn what date should this wobject become visible? Before this date, the wobject will only be displayed to Content Managers.\r\n<p>\r\n\r\n\r\n<b>End Date</b><br>\r\nOn what date should this wobject become invisible? After this date, the wobject will only be displayed to Content Managers.\r\n<p>\r\n\r\n\r\n<b>Description</b><br>\r\nA content area in which you can place as much content as you wish. For instance, even before an FAQ there is usually a paragraph describing what is contained in the FAQ.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (623,'WebGUI',1,'<a href=\"http://www.w3.org/Style/CSS/\">Cascading Style Sheets (CSS)</a> are a great way to manage the look and feel of any web site. They are used extensively in WebGUI.\r\n<p>\r\n\r\n\r\nIf you are unfamiliar with how to use CSS, <a href=\"http://www.plainblack.com/\">Plain Black Software</a> provides training classes on XHTML and CSS. Alternatively, Bradsoft makes an excellent CSS editor called <a href=\"http://www.bradsoft.com/topstyle/index.asp\">Top Style</a>.\r\n<p>\r\n\r\n\r\nThe following is a list of classes used to control the look of WebGUI:\r\n<p>\r\n\r\n\r\n<b>A</b><br>\r\nThe links throughout the style.\r\n<p>\r\n\r\n\r\n<b>BODY</b><br>\r\nThe default setup of all pages within a style.\r\n<p>\r\n\r\n\r\n<b>H1</b><br>\r\nThe headers on every page.\r\n<p>\r\n\r\n\r\n<b>.accountOptions</b><br>\r\nThe links that appear under the login and account update forms.\r\n<p>\r\n\r\n\r\n<b>.adminBar </b><br>\r\nThe bar that appears at the top of the page when you\'re in admin mode.\r\n<p>\r\n\r\n\r\n<b>.content</b><br>\r\nThe main content area on all pages of the style.\r\n<p>\r\n\r\n\r\n<b>.formDescription </b><br>\r\nThe tags on all forms next to the form elements. \r\n<p>\r\n\r\n\r\n<b>.formSubtext </b><br>\r\nThe tags below some form elements.\r\n<p>\r\n\r\n\r\n<b>.highlight </b><br>\r\nDenotes a highlighted item, such as which message you are viewing within a list.\r\n<p>\r\n\r\n\r\n<b>.horizontalMenu </b><br>\r\nThe horizontal menu (if you use a horizontal menu macro).\r\n<p>\r\n\r\n\r\n<b>.pagination </b><br>\r\nThe Previous and Next links on pages with pagination.\r\n<p>\r\n\r\n\r\n<b>.selectedMenuItem</b><br>\r\nUse this class to highlight the current page in any of the menu macros.\r\n<p>\r\n\r\n\r\n<b>.tableData </b><br>\r\nThe data rows on things like message boards and user contributions.\r\n<p>\r\n\r\n\r\n<b>.tableHeader </b><br>\r\nThe headings of columns on things like message boards and user contributions.\r\n<p>\r\n\r\n\r\n<b>.tableMenu </b><br>\r\nThe menu on things like message boards and user submissions.\r\n<p>\r\n\r\n\r\n<b>.verticalMenu </b><br>\r\nThe vertical menu (if you use a vertical menu macro).\r\n<p>\r\n\r\n\r\n<i><b>Note:</b></i> Some wobjects and macros have their own unique styles sheet classes, which are documented in their individual help files.\r\n<p>\r\n\r\n\r\n',1031514049);
INSERT INTO international VALUES (622,'WebGUI',1,'See <i>Manage Group</i> for a description of grouping functions and the default groups.\r\n<p>\r\n\r\n<b>Group Name</b><br>\r\nA name for the group. It is best if the name is descriptive so you know what it is at a glance.\r\n<p>\r\n\r\n<b>Description</b><br>\r\nA longer description of the group so that other admins and content managers (or you if you forget) will know what the purpose of this group is.\r\n<p>\r\n\r\n<b>Expire After</b><br>\r\nThe amount of time that a user will belong to this group before s/he is expired (or removed) from it. This is very useful for membership sites where users have certain privileges for a specific period of time. Note that this can be overridden on a per-user basis.\r\n<p>\r\n\r\n<b>Karma Threshold</b><br>\r\nIf you\'ve enabled Karma, then you\'ll be able to set this value. Karma Threshold is the amount of karma a user must have to be considered part of this group.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (607,'WebGUI',1,'<b>Anonymous Registration</b><br>\r\nDo you wish visitors to your site to be able to register themselves?\r\n<br><br>\r\n\r\n<b>Run On Registration</b><br>\r\nIf there is a command line specified here, it will be executed each time a user registers anonymously.\r\n<p>\r\n\r\n<b>Alert on new user?</b><br>\r\nShould someone be alerted when a new user registers anonymously?\r\n<p>\r\n\r\n<b>Group To Alert On New User</b><br>\r\nWhat group should be alerted when a new user registers?\r\n<p>\r\n\r\n<b>Enable Karma?</b><br>\r\nShould karma be enabled?\r\n<p>\r\n\r\n<b>Karma Per Login</b><br>\r\nThe amount of karma a user should be given when they log in. This only takes affect if karma is enabled.\r\n<p>\r\n\r\n<b>Session Timeout</b><br>\r\nThe amount of time that a user session remains active (before needing to log in again). This timeout is reset each time a user views a page. Therefore if you set the timeout for 8 hours, a user would have to log in again if s/he hadn\'t visited the site for 8 hours.\r\n<p>\r\n\r\n<b>Authentication Method (default)</b><br>\r\nWhat should the default authentication method be for new accounts that are created? The two available options are WebGUI and LDAP. WebGUI authentication means that the users will authenticate against the username and password stored in the WebGUI database. LDAP authentication means that users will authenticate against an external LDAP server.\r\n<br><br>\r\n<i>Note:</i> Authentication settings can be customized on a per user basis.\r\n<br><br>\r\n\r\n<b>Username Binding</b><br>\r\nBind the WebGUI username to the LDAP Identity. This requires the user to have the same username in WebGUI as they specified during the Anonymous Registration process. It also means that they won\'t be able to change their username later. This only in effect if the user is authenticating against LDAP.\r\n<br><br>\r\n\r\n<b>LDAP URL (default)</b><br>\r\nThe default url to your LDAP server. The LDAP URL takes the form of <b>ldap://[server]:[port]/[base DN]</b>. Example: ldap://ldap.mycompany.com:389/o=MyCompany.\r\n<br><br>\r\n\r\n<b>LDAP Identity</b><br>\r\nThe LDAP Identity is the unique identifier in the LDAP server that the user will be identified against. Often this field is <b>shortname</b>, which takes the form of first initial + last name. Example: jdoe. Therefore if you specify the LDAP identity to be <i>shortname</i> then Jon Doe would enter <i>jdoe</i> during the registration process.\r\n<br><br>\r\n\r\n<b>LDAP Identity Name</b><br>\r\nThe label used to describe the LDAP Identity to the user. For instance, some companies use an LDAP server for their proxy server users to authenticate against. In the documentation or training already provided to their users, the LDAP identity is known as their <i>Web Username</i></b><i>. So you could enter that label here for consitency.\r\n<br><br>\r\n\r\n<b>LDAP Password Name</b><br>\r\nJust as the LDAP Identity Name is a label, so is the LDAP Password Name. Use this label as you would LDAP Identity Name.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (620,'WebGUI',1,'As the function suggests you\'ll be deleting a group and removing all users from the group. Be careful not to orphan users from pages they should have access to by deleting a group that is in use.\r\n<p>\r\n\r\nAs with any delete operation, you are prompted to be sure you wish to proceed with the delete. If you answer yes, the delete will proceed and there is no recovery possible. If you answer no you\'ll be returned to the prior screen.',1031514049);
INSERT INTO international VALUES (621,'WebGUI',1,'Styles are WebGUI macro enabled. See <i>Using Macros</i> for more information.\r\n<p>\r\n\r\n\r\n<b>Style Name</b><br>\r\nA unique name to describe what this style looks like at a glance. The name has no effect on the actual look of the style.\r\n<p>\r\n\r\n\r\n<b>Body</b><br>\r\nThe body is quite literally the HTML body of your site. It defines how the page navigation will be laid out and many other things like logo, copyright, etc. At bare minimum a body must consist of a few things, the ^AdminBar; macro and the ^-; (seperator) macro. The ^AdminBar; macro tells WebGUI where to display admin functions. The ^-; (splitter) macro tells WebGUI where to put the content of your page.\r\n<p>\r\n\r\n\r\nIf you are in need of assistance for creating a look for your site, or if you need help cutting apart your design, <a href=\"http://www.plainblack.com/\">Plain Black Software</a> provides support services for a small fee.\r\n<p>\r\n\r\n\r\nMany people will add WebGUI macros to their body for automated navigation, and other features.\r\n<p>\r\n\r\n\r\n<b>Style Sheet</b><br>\r\nPlace your style sheet entries here. Style sheets are used to control colors, sizes, and other properties of the elements on your site. See <i>Using Style Sheets</i> for more information.\r\n<p>\r\n\r\n\r\n<i>Advanced Users:</i> for greater performance create your stylesheet on the file system (call it something like webgui.css) and add an entry like this to this area: \r\n<link href=\"/webgui.css\" rel=\"stylesheet\" rev=\"stylesheet\" type=\"text/css\">\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (619,'WebGUI',1,'This function permanently deletes the selected wobject from a page. If you are unsure whether you wish to delete this content you may be better served to cut the content to the clipboard until you are certain you wish to delete it.\r\n<p>\r\n\r\n\r\nAs with any delete operation, you are prompted to be sure you wish to proceed with the delete. If you answer yes, the delete will proceed and there is no recovery possible. If you answer no you\'ll be returned to the prior screen.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (617,'WebGUI',1,'Settings are items that allow you to adjust WebGUI to your particular needs.\r\n<p>\r\n\r\n\r\n<b>Edit Company Information</b><br>\r\nInformation specific about the company or individual who controls this installation of WebGUI.\r\n<p>\r\n\r\n\r\n<b>Edit Content Settings</b><br>\r\nSettings related to content and content management.\r\n<p>\r\n\r\n\r\n<b>Edit Mail Settings</b><br>\r\nSettings concerning email and related functions.\r\n<p>\r\n\r\n\r\n<b>Edit Miscellaneous Settings</b><br>\r\nAnything we couldn\'t find a place for.\r\n<p>\r\n\r\n\r\n<b>Edit Profile Settings</b><br>\r\nDefine what user profiles look like and what the users have the ability to edit.\r\n<p>\r\n\r\n\r\n<b>Edit User Settings</b><br>\r\nSettings relating to users (beyond profile information), like authentication information, and registration options.\r\n<p>\r\n\r\n\r\n',1031514049);
INSERT INTO international VALUES (615,'WebGUI',1,'Groups are used to subdivide privileges and responsibilities within the WebGUI system. For instance, you may be building a site for a classroom situation. In that case you might set up a different group for each class that you teach. You would then apply those groups to the pages that are designed for each class.\r\n<p>\r\n\r\nThere are several groups built into WebGUI. They are as follows:\r\n<p>\r\n\r\n<b>Admins</b><br>\r\nAdmins are users who have unlimited privileges within WebGUI. A user should only be added to the admin group if they oversee the system. Usually only one to three people will be added to this group.\r\n<p>\r\n\r\n<b>Content Managers</b><br>\r\nContent managers are users who have privileges to add, edit, and delete content from various areas on the site. The content managers group should not be used to control individual content areas within the site, but to determine whether a user can edit content at all. You should set up additional groups to separate content areas on the site.\r\n<p>\r\n\r\n<b>Everyone</b><br>\r\nEveryone is a magic group in that no one is ever physically inserted into it, but yet all members of the site are part of it. If you want to open up your site to both visitors and registered users, use this group to do it.\r\n<p>\r\n\r\n<b>Package Managers</b><br>\r\nUsers that have privileges to add, edit, and delete packages of wobjects and pages to deploy.\r\n<p>\r\n\r\n<b>Registered Users</b><br>\r\nWhen users are added to the system they are put into the registered users group. A user should only be removed from this group if their account is deleted or if you wish to punish a troublemaker.\r\n<p>\r\n\r\n<b>Style Managers</b><br>\r\nUsers that have privileges to edit styles for this site. These privileges do not allow the user to assign privileges to a page, just define them to be used.\r\n<p>\r\n\r\n<b>Template Managers</b><br>\r\nUsers that have privileges to edit templates for this site.\r\n<p>\r\n\r\n<b>Visitors</b><br>\r\nVisitors are users who are not logged in using an account on the system. Also, if you wish to punish a registered user you could remove him/her from the Registered Users group and insert him/her into the Visitors group.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (613,'WebGUI',1,'Users are the accounts in the system that are given rights to do certain things. There are two default users built into the system: Admin and Visitor.\r\n</i></p><p><i>\r\n\r\n<b>Admin</b><br>\r\nAdmin is exactly what you\'d expect. It is a user with unlimited rights in the WebGUI environment. If it can be done, this user has the rights to do it.\r\n</i></p><p><i>\r\n\r\n<b>Visitor</b><br>\r\nVisitor is exactly the opposite of Admin. Visitor has no rights what-so-ever. By default any user who is not logged in is seen as the user Visitor.\r\n</i></p><p><i>\r\n\r\n<b>Add a new user.</b><br>\r\nClick on this to go to the add user screen.\r\n</i></p><p><i>\r\n\r\n<b>Search</b><br>\r\nYou can search users based on username and email address. You can do partial searches too if you like.',1031514049);
INSERT INTO international VALUES (614,'WebGUI',1,'Styles are used to manage the look and feel of your WebGUI pages. With WebGUI, you can have an unlimited number of styles, so your site can take on as many looks as you like. You could have some pages that look like your company\'s brochure, and some pages that look like Yahoo!�. You could even have some pages that look like pages in a book. Using style management, you have ultimate control over all your designs.\r\n<p>\r\n\r\nThere are several styles built into WebGUI. The first of these are used by WebGUI can should not be edited or deleted. The last few are simply example styles and may be edited or deleted as you please.\r\n<p>\r\n\r\n\r\n<b>Clipboard</b><br>\r\nThis style is used by the clipboard system.\r\n<p>\r\n\r\n\r\n<b>Fail Safe</b><br>\r\nWhen you delete a style that is still in use on some pages, the Fail Safe style will be applied to those pages. This style has a white background and simple navigation.\r\n<p>\r\n\r\n\r\n<b>Make Page Printable</b><br>\r\nThis style is used if you place an <b>^r;</b> macro on your pages and the user clicks on it. This style allows you to put a simple logo and copyright message on your printable pages.\r\n<p>\r\n\r\n\r\n<b>Packages</b><br>\r\nThis style is used by the package management system.\r\n<p>\r\n\r\n\r\n<b>Trash</b><br>\r\nThis style is used by the trash system.\r\n<p>\r\n\r\n\r\n<hr>\r\n\r\n<b>Demo Style</b><br>\r\nThis is a sample design taken from a templates site (www.freewebtemplates.com).\r\n<p>\r\n\r\n\r\n<b>Plain Black Software (black) & (white)</b><br>\r\nThese designs are used on the Plain Black site.\r\n<p>\r\n\r\n\r\n<b>Yahoo!�</b><br>\r\nThis is the design of the Yahoo!� site. (Used without permission.)\r\n<p>\r\n\r\n\r\n<b>WebGUI</b><br>\r\nThis is a simple design featuring WebGUI logos.\r\n<p>\r\n\r\n<b>WebGUI 4</b><br>\r\nThis style was added to WebGUI as of version 4.0.0. It is now the default style and has superceded the \"WebGUI\" style.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (612,'WebGUI',1,'There is no need to ever actually delete a user. If you are concerned with locking out a user, then simply change their password. If you truely wish to delete a user, then please keep in mind that there are consequences. If you delete a user any content that they added to the site via wobjects (like message boards and user contributions) will remain on the site. However, if another user tries to visit the deleted user\'s profile they will get an error message. Also if the user ever is welcomed back to the site, there is no way to give him/her access to his/her old content items except by re-adding the user to the users table manually.\r\n<p>\r\n\r\n\r\nAs with any delete operation, you are prompted to be sure you wish to proceed with the delete. If you answer yes, the delete will proceed and there is no recovery possible. If you answer no you\'ll be returned to the prior screen.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (637,'WebGUI',1,'<b>First Name</b><br>\r\nThe given name of this user.\r\n<p>\r\n\r\n<b>Middle Name</b><br>\r\nThe middle name of this user.\r\n<p>\r\n\r\n<b>Last Name</b><br>\r\nThe surname (or family name) of this user.\r\n<p>\r\n\r\n<b>Email Address</b><br>\r\nThe user\'s email address. This must only be specified if the user will partake in functions that require email.\r\n<p>\r\n\r\n<b>ICQ UIN</b><br>\r\nThe <a href=\"http://www.icq.com/\">ICQ</a> UIN is the \"User ID Number\" on the ICQ network. ICQ is a very popular instant messaging platform.\r\n<p>\r\n\r\n<b>AIM Id</b><br>\r\nThe account id for the <a href=\"http://www.aim.com/\">AOL Instant Messenger</a> system.\r\n<p>\r\n\r\n<b>MSN Messenger Id</b><br>\r\nThe account id for the <a href=\"http://messenger.msn.com/\">Microsoft Network Instant Messenger</b> system.\r\n<p>\r\n\r\n<b>Yahoo! Messenger Id</b><br>\r\nThe account id for the <a href=\"http://messenger.yahoo.com/\">Yahoo! Instant Messenger</a> system.\r\n<p>\r\n\r\n<b>Cell Phone</b><br>\r\nThis user\'s cellular telephone number.\r\n<p>\r\n\r\n<b>Pager</b><br>\r\nThis user\'s pager telephone number.\r\n<p>\r\n\r\n<b>Email To Pager Gateway</b><br>\r\nThis user\'s text pager email address.\r\n<p>\r\n\r\n<b>Home Information</b><br>\r\nThe postal (or street) address for this user\'s home.\r\n<p>\r\n\r\n<b>Work Information</b><br>\r\nThe postal (or street) address for this user\'s company.\r\n<p>\r\n\r\n<b>Gender</b><br>\r\nThis user\'s sex.\r\n<p>\r\n\r\n<b>Birth Date</b><br>\r\nThis user\'s date of birth.\r\n\r\n<b>Language</b><br>\r\nWhat language should be used to display system related messages.\r\n<p>\r\n\r\n<b>Time Offset</b><br>\r\nA number of hours (plus or minus) different this user\'s time is from the server. This is used to adjust for time zones.\r\n<p>\r\n\r\n<b>First Day Of Week</b><br>\r\nThe first day of the week on this user\'s local calendar. For instance, in the United States the first day of the week is Sunday, but in many places in Europe, the first day of the week is Monday.\r\n<p>\r\n\r\n<b>Date Format</b><br>\r\nWhat format should dates on this site appear in?\r\n<p>\r\n\r\n<b>Time Format</b><br>\r\nWhat format should times on this site appear in? \r\n<p>\r\n\r\n<b>Discussion Layout</b><br>\r\nShould discussions be laid out flat or threaded? Flat puts all replies on one page in the order they were created. Threaded shows the heirarchical list of replies as they were created.\r\n<p>\r\n\r\n<b>Inbox Notifications</b><br>\r\nHow should this user be notified when they get a new WebGUI message?\r\n\r\n',1031514049);
INSERT INTO international VALUES (610,'WebGUI',1,'See <b>Manage Users</b> for additional details.\r\n<p>\r\n\r\n<b>Username</b><br>\r\nUsername is a unique identifier for a user. Sometimes called a handle, it is also how the user will be known on the site. (<i>Note:</i> Administrators have unlimited power in the WebGUI system. This also means they are capable of breaking the system. If you rename or create a user, be careful not to use a username already in existance.)\r\n<p>\r\n\r\n\r\n<b>Password</b><br>\r\nA password is used to ensure that the user is who s/he says s/he is.\r\n<p>\r\n\r\n\r\n<b>Authentication Method</b><br>\r\nSee <i>Edit Settings</i> for details.\r\n<p>\r\n\r\n\r\n<b>LDAP URL</b><br>\r\nSee <i>Edit Settings</i> for details.\r\n<p>\r\n\r\n\r\n<b>Connect DN</b><br>\r\nThe Connect DN is the <b>cn</b> (or common name) of a given user in your LDAP database. It should be specified as <b>cn=John Doe</b>. This is, in effect, the username that will be used to authenticate this user against your LDAP server.\r\n<p>\r\n\r\n\r\n',1031514049);
INSERT INTO international VALUES (608,'WebGUI',1,'Deleting a page can create a big mess if you are uncertain about what you are doing. When you delete a page you are also deleting the content it contains, all sub-pages connected to this page, and all the content they contain. Be certain that you have already moved all the content you wish to keep before you delete a page.\r\n<p>\r\n\r\nAs with any delete operation, you are prompted to be sure you wish to proceed with the delete. If you answer yes, the delete will proceed and there is no recovery possible. If you answer no you\'ll be returned to the prior screen.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (609,'WebGUI',1,'When you delete a style all pages using that style will be reverted to the fail safe (default) style. To ensure uninterrupted viewing, you should be sure that no pages are using a style before you delete it.\r\n<p>\r\n\r\n\r\nAs with any delete operation, you are prompted to be sure you wish to proceed with the delete. If you answer yes, the delete will proceed and there is no recovery possible. If you answer no you\'ll be returned to the prior screen.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (606,'WebGUI',1,'Think of pages as containers for content. For instance, if you want to write a letter to the editor of your favorite magazine you\'d get out a notepad (or open a word processor) and start filling it with your thoughts. The same is true with WebGUI. Create a page, then add your content to the page.\r\n<p>\r\n\r\n<b>Title</b><br>\r\nThe title of the page is what your users will use to navigate through the site. Titles should be descriptive, but not very long.\r\n<p>\r\n\r\n\r\n<b>Menu Title</b><br>\r\nA shorter or altered title to appear in navigation. If left blank this will default to <i>Title</i>.\r\n<p>\r\n\r\n<b>Page URL</b><br>\r\nWhen you create a page a URL for the page is generated based on the page title. If you are unhappy with the URL that was chosen, you can change it here.\r\n<p>\r\n\r\n<b>Redirect URL</b><br>\r\nWhen this page is visited, the user will be redirected to the URL specified here. In order to edit this page in the future, you\'ll have to access it from the \"Manage page tree.\" menu under \"Administrative functions...\"\r\n<p>\r\n\r\n<b>Template</b><br>\r\nBy default, WebGUI has one big content area to place wobjects. However, by specifying a template other than the default you can sub-divide the content area into several sections.\r\n<p>\r\n\r\n<b>Synopsis</b><br>\r\nA short description of a page. It is used to populate default descriptive meta tags as well as to provide descriptions on Site Maps.\r\n<p>\r\n\r\n<b>Meta Tags</b><br>\r\nMeta tags are used by some search engines to associate key words to a particular page. There is a great site called <a href=\"http://www.metatagbuilder.com/\">Meta Tag Builder</a> that will help you build meta tags if you\'ve never done it before.\r\n<p>\r\n\r\n<i>Advanced Users:</i> If you have other things (like JavaScript) you usually put in the  area of your pages, you may put them here as well.\r\n<p>\r\n\r\n<b>Use default meta tags?</b><br>\r\nIf you don\'t wish to specify meta tags yourself, WebGUI can generate meta tags based on the page title and your company\'s name. Check this box to enable the WebGUI-generated meta tags.\r\n<p>\r\n\r\n\r\n<b>Style</b><br>\r\nBy default, when you create a page, it inherits a few traits from its parent. One of those traits is style. Choose from the list of styles if you would like to change the appearance of this page. See <i>Add Style</i> for more details.\r\n<p>\r\n\r\nIf you select \"Yes\" below the style pull-down menu, all of the pages below this page will take on the style you\'ve chosen for this page.\r\n<p>\r\n\r\n<b>Start Date</b><br>\r\nThe date when users may begin viewing this page. Note that before this date only content managers with the rights to edit this page will see it.\r\n<p>\r\n\r\n<b>End Date</b><br>\r\nThe date when users will stop viewing this page. Note that after this date only content managers with the rights to edit this page will see it.\r\n<p>\r\n\r\n\r\n<b>Owner</b><br>\r\nThe owner of a page is usually the person who created the page.\r\n<p>\r\n\r\n<b>Owner can view?</b><br>\r\nCan the owner view the page or not?\r\n<p>\r\n\r\n<b>Owner can edit?</b><br>\r\nCan the owner edit the page or not? Be careful, if you decide that the owner cannot edit the page and you do not belong to the page group, then you\'ll lose the ability to edit this page.\r\n<p>\r\n\r\n<b>Group</b><br>\r\nA group is assigned to every page for additional privilege control. Pick a group from the pull-down menu.\r\n<p>\r\n\r\n<b>Group can view?</b><br>\r\nCan members of this group view this page?\r\n<p>\r\n\r\n<b>Group can edit?</b><br>\r\nCan members of this group edit this page?\r\n<p>\r\n\r\n<b>Anybody can view?</b><br>\r\nCan any visitor or member regardless of the group and owner view this page?\r\n<p>\r\n\r\n<b>Anybody can edit?</b><br>\r\nCan any visitor or member regardless of the group and owner edit this page?\r\n<p>\r\n\r\nYou can optionally recursively give these privileges to all pages under this page.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (634,'WebGUI',1,'<b>Default Home Page</b><br>\r\nSome really small sites don\'t have a home page, but instead like to use one of their internal pages like \"About Us\" or \"Company Information\" as their home page. For that reason, you can set the default page of your site to any page in the site. That page will be the one people go to if they type in just your URL http://www.mywebguisite.com, or if they click on the Home link generated by the ^H; macro.\r\n<p>\r\n\r\n<b>Not Found Page</b><br>\r\nIf a page that a user requests is not found in the system, the user can be redirected to the home page or to an error page where they can attempt to find what they were looking for. You decide which is better for your users.\r\n<p>\r\n\r\n<b>Document Type Declaration</b><br>\r\nThese days it is very common to have a wide array of browsers accessing your site, including automated browsers like search engine spiders. Many of those browsers want to know what kind of content you are serving. The doctype tag allows you to specify that. By default WebGUI generates HTML 4.0 compliant content.\r\n<p>\r\n\r\n<b>Add edit stamp to posts?</b><br>\r\nTypically if a user edits a post on a message board, a stamp is added to that post to identify who made the edit, and at what time. On some sites that information is not necessary, therefore you can turn it off here.\r\n<p>\r\n\r\n<b>Filter Contributed HTML</b><br>\r\nEspecially when running a public site where anybody can post to your message boards or user submission systems, it is often a good idea to filter their content for malicious code that can harm the viewing experience of your visitors; And in some circumstances, it can even cause security problems. Use this setting to select the level of filtering you wish to apply.\r\n<p>\r\n\r\n<b>Maximum Attachment Size</b><br>\r\nThe size (in kilobytes) of the maximum allowable attachment to be uploaded to your system.\r\n<p>\r\n\r\n<b>Max Image Size</b><br>\r\nIf images are uploaded to your system that are bigger than the max image size, then they will be resized to the max image size. The max image size is measured in pixels and will use the size of the longest side of the image to determine if the limit has been reached.\r\n<p>\r\n\r\n<b>Thumbnail Size</b><br>\r\nWhen images are uploaded to your system, they will automatically have thumbnails generated at the size specified here. Thumbnail size is measured in pixels.\r\n<p>\r\n\r\n<b>Text Area Rows</b><br>\r\nSome sites wish to control the size of the forms that WebGUI generates. With this setting you can specify how many rows of characters will be displayed in textareas on the site.\r\n<p>\r\n\r\n<b>Text Area Columns</b><br>\r\nSome sites wish to control the size of the forms that WebGUI generates. With this setting you can specify how many columns of characters will be displayed in textareas on the site.\r\n<p>\r\n\r\n<b>Text Box Size</b><br>\r\nSome sites wish to control the size of the forms that WebGUI generates. With this setting you can specify how characters can be displayed at once in text boxes on the site.\r\n<p>\r\n\r\n<b>Editor To Use</b><br>\r\nWebGUI has a very sophisticated Rich Editor that allows users to fomat content as though they were in Microsoft Word� or some other word processor. To use that functionality, select \"Built-In Editor\". Sometimes web sites have the need for even more complex rich editors for things like Spell Check. For that reason you can install an 3rd party editor called <a href=\"http://www.realobjects.de/\"><i>Real Objects Edit-On Pro�</i></a> rich text editor. After you\'ve installed it change this option. If you need detailed instructions on how to integrate <i>Edit-On Pro�)</i>, you can find them in <a href=\"http://www.plainblack.com/ruling_webgui\"><i>Ruling WebGUI</i></a>.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (638,'WebGUI',1,'Templates are used to affect how pages are laid out in WebGUI. For instance, most sites these days have more than just a menu and one big text area. Many of them have three or four columns preceeded by several headers and/or banner areas. WebGUI accomodates complex layouts through the use of Templates. There are several templates that come with WebGUI to make life easier for you, but you can create as many as you\'d like.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (639,'WebGUI',1,'<b>Template Name</b><br>\r\nGive this template a descriptive name so that you\'ll know what it is when you\'re applying the template to a page.\r\n<p>\r\n\r\n\r\n<b>Template</b><br>\r\nCreate your template by placing the special macros ^0; ^1; ^2;  and so on in your template to represent the different content areas. Typically this is done by using a table to position the content. Be sure to take a look at the templates that come with WebGUI for ideas.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (640,'WebGUI',1,'It is not a good idea to delete templates as you never know what kind of adverse affect it may have on your site (some pages may still be using the template). If you should choose to delete a template, all the pages still using the template will be set to the \"Default\" template.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (624,'WebGUI',1,'WebGUI macros are used to create dynamic content within otherwise static content. For instance, you may wish to show which user is logged in on every page, or you may wish to have a dynamically built menu or crumb trail. \r\n<p>\r\n\r\nMacros always begin with a carat (^) and follow with at least one other character and ended with w semicolon (;). Some macros can be extended/configured by taking the format of ^<i>x</i>(\"<b>config text</b>\");. The following is a description of all the macros in the WebGUI system.\r\n<p>\r\n\r\n<b>^a; or ^a(); - My Account Link</b><br>\r\nA link to your account information. In addition you can change the link text by creating a macro like this <b>^a(\"Account Info\");</b>. \r\n<p>\r\n\r\n<i>Notes:</i> You can also use the special case ^a(linkonly); to return only the URL to the account page and nothing more. Also, the .myAccountLink style sheet class is tied to this macro.\r\n<p>\r\n\r\n<b>^AdminBar;</b><br>\r\nPlaces the administrative tool bar on the page. This is a required element in the \"body\" segment of the Style Manager.\r\n<p>\r\n\r\n<b>^AdminText();</b><br>\r\nDisplays a small text message to a user who is in admin mode. Example: ^AdminText(\"You are in admin mode!\");\r\n<p>\r\n\r\n<b>^AdminToggle; or ^AdminToggle();</b><br>\r\nPlaces a link on the page which is only visible to content managers and adminstrators. The link toggles on/off admin mode. You can optionally specify other messages to display like this: ^AdminToggle(\"Edit On\",\"Edit Off\");\r\n<p>\r\n\r\n<b>^C; or ^C(); - Crumb Trail</b><br>\r\nA dynamically generated crumb trail to the current page. You can optionally specify a delimeter to be used between page names by using ^C(::);. The default delimeter is >.\r\n<p>\r\n\r\n<i>Note:</i> The .crumbTrail style sheet class is tied to this macro.\r\n<p>\r\n\r\n<b>^c; - Company Name</b><br>\r\nThe name of your company specified in the settings by your Administrator.\r\n<p>\r\n\r\n\r\n<b>^D; or ^D(); - Date</b><br>\r\nThe current date and time.\r\n<p>\r\n\r\nYou can configure the date by using date formatting symbols. For instance, if you created a macro like this <b>^D(\"%c %D, %y\");</b> it would output <b>September 26, 2001</b>. The following are the available date formatting symbols:\r\n<p>\r\n\r\n<table><tbody><tr><td>%%</td><td>%</td></tr><tr><td>%y</td><td>4 digit year</td></tr><tr><td>%Y</td><td>2 digit year</td></tr><tr><td>%m</td><td>2 digit month</td></tr><tr><td>%M</td><td>variable digit month</td></tr><tr><td>%c</td><td>month name</td></tr><tr><td>%d</td><td>2 digit day of month</td></tr><tr><td>%D</td><td>variable digit day of month</td></tr><tr><td>%w</td><td>day of week name</td></tr><tr><td>%h</td><td>2 digit base 12 hour</td></tr><tr><td>%H</td><td>variable digit base 12 hour</td></tr><tr><td>%j</td><td>2 digit base 24 hour</td></tr><tr><td>%J</td><td>variable digit base 24 hour</td></tr><tr><td>%p</td><td>lower case am/pm</td></tr><tr><td>%P</td><td>upper case AM/PM</td></tr><tr><td>%z</td><td>user preference date format</td></tr><tr><td>%Z</td><td>user preference time format</td></tr></tbody></table>\r\n<p>\r\n\r\n\r\n<b>^e; - Company Email Address</b><br>\r\nThe email address for your company specified in the settings by your Administrator.\r\n<p>\r\n\r\n<b>^Env()</b><br>\r\nCan be used to display a web server environment variable on a page. The environment variables available on each server are different, but you can find out which ones your web server has by going to: http://www.yourwebguisite.com/env.pl\r\n<p>\r\n\r\nThe macro should be specified like this ^Env(\"REMOTE_ADDR\");\r\n<p>\r\n\r\n<b>^Execute();</b><br>\r\nAllows a content manager or administrator to execute an external program. Takes the format of <b>^Execute(\"/this/file.sh\");</b>.\r\n<p>\r\n\r\n\r\n<b>^Extras;</b><br>\r\nReturns the path to the WebGUI \"extras\" folder, which contains things like WebGUI icons.\r\n<p>\r\n\r\n\r\n<b>^FlexMenu;</b><br>\r\nThis menu macro creates a top-level menu that expands as the user selects each menu item.\r\n<p>\r\n\r\n<b>^FormParam();</b><br>\r\nThis macro is mainly used in generating dynamic queries in SQL Reports. Using this macro you can pull the value of any form field simply by specifing the name of the form field, like this: ^FormParam(\"phoneNumber\");\r\n<p>\r\n\r\n<b>^GroupText();</b><br>\r\nDisplays a small text message to the user if they belong to the specified group. Example: ^GroupText(\"Visitors\",\"You need an account to do anything cool on this site!\");\r\n<p>\r\n\r\n\r\n<b>^H; or ^H(); - Home Link</b><br>\r\nA link to the home page of this site.  In addition you can change the link text by creating a macro like this <b>^H(\"Go Home\");</b>.\r\n<p>\r\n\r\n<i>Notes:</i> You can also use the special case ^H(linkonly); to return only the URL to the home page and nothing more. Also, the .homeLink style sheet class is tied to this macro.\r\n<p>\r\n\r\n<b>^I(); - Image Manager Image with Tag</b><br>\r\nThis macro returns an image tag with the parameters for an image defined in the image manager. Specify the name of the image using a tag like this <b>^I(\"imageName\")</b>;.\r\n<p>\r\n\r\n<b>^i(); - Image Manager Image Path</b><br>\r\nThis macro returns the path of an image uploaded using the Image Manager. Specify the name of the image using a tag like this <b>^i(\"imageName\");</b>.\r\n<p>\r\n\r\n<b>^Include();</b><br>\r\nAllows a content manager or administrator to include a file from the local filesystem. Takes the format of <b>^Include(\"/this/file.html\")</b>;\r\n<p>\r\n\r\n<b>^L; or ^L(); - Login</b><br>\r\nA small login form. You can also configure this macro. You can set the width of the login box like this ^L(20);. You can also set the message displayed after the user is logged in like this ^L(20,Hi ^a(^@;);. Click %here% if you wanna log out!)\r\n<p>\r\n\r\n<i>Note:</i> The .loginBox style sheet class is tied to this macro.\r\n<p>\r\n\r\n<b>^LoginToggle; or ^LoginToggle();</b><br>\r\nDisplays a \"Login\" or \"Logout\" message depending upon whether the user is logged in or not. You can optionally specify other messages like this: ^LoginToggle(\"Click here to log in.\",\"Click here to log out.\");\r\n<p>\r\n\r\n<b>^M; or ^M(); - Current Menu (Vertical)</b><br>\r\nA vertical menu containing the sub-pages at the current level. In addition, you may configure this macro by specifying how many levels deep the menu should go. By default it will show only the first level. To go three levels deep create a macro like this <b>^M(3);</b>. If you set the macro to \"0\" it will track the entire site tree.\r\n<p>\r\n\r\n<b>^m; - Current Menu (Horizontal)</b><br>\r\nA horizontal menu containing the sub-pages at the current level. You can optionally specify a delimeter to be used between page names by using ^m(:--:);. The default delimeter is �.\r\n<p>\r\n\r\n<b>^P; or ^P(); - Previous Menu (Vertical)</b><br>\r\nA vertical menu containing the sub-pages at the previous level. In addition, you may configure this macro by specifying how many levels deep the menu should go. By default it will show only the first level. To go three levels deep create a macro like this <b>^P(3);</b>. If you set the macro to \"0\" it will track the entire site tree.\r\n<p>\r\n\r\n<b>^p; - Previous Menu (Horizontal)</b><br>\r\nA horizontal menu containing the sub-pages at the previous level. You can optionally specify a delimeter to be used between page names by using ^p(:--:);. The default delimeter is �.\r\n<p>\r\n\r\n<b>^Page();</b><br>\r\nThis can be used to retrieve information about the current page. For instance it could be used to get the page URL like this ^Page(\"urlizedTitle\"); or to get the menu title like this ^Page(\"menuTitle\");.\r\n<p>\r\n\r\n<b>^PageTitle;</b><br>\r\nDisplays the title of the current page.\r\n<p>\r\n\r\n<i>Note:</i> If you begin using admin functions or the indepth functions of any wobject, the page title will become a link that will quickly bring you back to the page.\r\n<p>\r\n\r\n<b>^r; or ^r(); - Make Page Printable</b><br>\r\nCreates a link to remove the style from a page to make it printable.  In addition, you can change the link text by creating a macro like this <b>^r(\"Print Me!\");</b>.\r\n<p>\r\n\r\nBy default, when this link is clicked, the current page\'s style is replaced with the \"Make Page Printable\" style in the Style Manager. However, that can be overridden by specifying the name of another style as the second parameter, like this: ^r(\"Print!\",\"WebGUI\");\r\n<p>\r\n\r\n<i>Notes:</i> You can also use the special case ^r(linkonly); to return only the URL to the make printable page and nothing more. Also, the .makePrintableLink style sheet class is tied to this macro.\r\n<p>\r\n\r\n<b>^rootmenu; or ^rootmenu(); (Horizontal)</b><br>\r\nCreates a horizontal menu of the various roots on your system (except for the WebGUI system roots). You can optionally specify a menu delimiter like this: ^rootmenu(|);\r\n<p>\r\n\r\n\r\n<b>^RootTitle;</b><br>\r\nReturns the title of the root of the current page. For instance, the main root in WebGUI is the \"Home\" page. Many advanced sites have many roots and thus need a way to display to the user which root they are in.\r\n<p>\r\n\r\n<b>^S(); - Specific SubMenu (Vertical)</b><br>\r\nThis macro allows you to get the submenu of any page, starting with the page you specified. For instance, you could get the home page submenu by creating a macro that looks like this <b>^S(\"home\",0);</b>. The first value is the urlized title of the page and the second value is the depth you\'d like the menu to go. By default it will show only the first level. To go three levels deep create a macro like this <b>^S(\"home\",3);</b>.\r\n<p>\r\n\r\n\r\n<b>^s(); - Specific SubMenu (Horizontal)</b><br>\r\nThis macro allows you to get the submenu of any page, starting with the page you specified. For instance, you could get the home page submenu by creating a macro that looks like this <b>^s(\"home\");</b>. The value is the urlized title of the page.  You can optionally specify a delimeter to be used between page names by using ^s(\"home\",\":--:\");. The default delimeter is �.\r\n<p>\r\n\r\n<b>^SQL();</b><br>\r\nA one line SQL report. Sometimes you just need to pull something back from the database quickly. This macro is also useful in extending the SQL Report wobject. It uses the numeric macros (^0; ^1; ^2; etc) to position data and can also use the ^rownum; macro just like the SQL Report wobject. Examples:<p>\r\n ^SQL(\"select count(*) from users\",\"There are ^0; users on this system.\");\r\n<p>\r\n^SQL(\"select userId,username from users order by username\",\"&lt;a href=\'^/;?op=viewProfile&uid=^0;\'&gt;^1;&lt;/a&gt;&lt;br&gt;\");\r\n<p>\r\n\r\n<b>^Synopsis; or ^Synopsis(); Menu</b><br>\r\nThis macro allows you to get the submenu of a page along with the synopsis of each link. You may specify an integer to specify how many levels deep to traverse the page tree.\r\n<p>\r\n\r\n<i>Notes:</i> The .synopsis_sub, .synopsis_summary, and .synopsis_title style sheet classes are tied to this macro.\r\n<p>\r\n\r\n<b>^T; or ^T(); - Top Level Menu (Vertical)</b><br>\r\nA vertical menu containing the main pages of the site (aka the sub-pages from the home page). In addition, you may configure this macro by specifying how many levels deep the menu should go. By default it will show only the first level. To go three levels deep create a macro like this <b>^T(3);</b>. If you set the macro to \"0\" it will track the entire site tree.\r\n<p>\r\n\r\n<b>^t; - Top Level Menu (Horizontal)</b><br>\r\nA vertical menu containing the main pages of the site (aka the sub-pages from the home page). You can optionally specify a delimeter to be used between page names by using ^t(:--:);. The default delimeter is �.\r\n<p>\r\n\r\n<b>^Thumbnail();</b><br>\r\nReturns the URL of a thumbnail for an image from the image manager. Specify the name of the image like this <b>^Thumbnail(\"imageName\");</b>.\r\n<p>\r\n\r\n<b>^ThumbnailLinker();</b><br>\r\nThis is a good way to create a quick and dirty screenshots page or a simple photo gallery. Simply specify the name of an image in the Image Manager like this: ^ThumbnailLinker(\"My Grandmother\"); and this macro will create a thumnail image with a title under it that links to the full size version of the image.\r\n<p>\r\n\r\n<b>^u; - Company URL</b><br>\r\nThe URL for your company specified in the settings by your Administrator.\r\n<p>\r\n\r\n<b>^URLEncode();</b><br>\r\nThis macro is mainly useful in SQL reports, but it could be useful elsewhere as well. It takes the input of a string and URL Encodes it so that the string can be passed through a URL. It\'s syntax looks like this: ^URLEncode(\"Is this my string?\");\r\n<p>\r\n\r\n\r\n<b>^User();</b><br>\r\nThis macro will allow you to display any information from a user\'s account or profile. For instance, if you wanted to display a user\'s email address you\'d create this macro: ^User(\"email\");\r\n<p>\r\n\r\n<b>^/; - System URL</b><br>\r\nThe URL to the gateway script (example: <i>/index.pl/</i>).\r\n<p>\r\n\r\n<b>^\\; - Page URL</b><br>\r\nThe URL to the current page (example: <i>/index.pl/pagename</i>).\r\n<p>\r\n\r\n<b>^@; - Username</b><br>\r\nThe username of the currently logged in user.\r\n<p>\r\n\r\n<b>^?; - Search</b><br>\r\nAdd a search box to the page. The search box is tied to WebGUI\'s built-in search engine.\r\n<p>\r\n\r\n<i>Note:</i> The .searchBox style sheet class is tied to this macro.\r\n<p>\r\n\r\n<b>^#; - User ID</b><br>\r\nThe user id of the currently logged in user.\r\n<p>\r\n\r\n<b>^*; or ^*(); - Random Number</b><br>\r\nA randomly generated number. This is often used on images (such as banner ads) that you want to ensure do not cache. In addition, you may configure this macro like this <b>^*(100);</b> to create a random number between 0 and 100.\r\n<p>\r\n\r\n<b>^-;,^0;,^1;,^2;,^3;, etc.</b><br>\r\nThese macros are reserved for system/wobject-specific functions as in the SQL Report wobject and the Body in the Style Manager.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (62,'Product',1,'Product Template, Add/Edit',1031514049);
INSERT INTO international VALUES (63,'Product',1,'Product templates are used to control how your product presented to your customer, in much the same way that other templates in WebGUI layout content. There are a few templates provided for you as reference, but you should create a template that\'s right for your product. \r\n<p>\r\nChances are you won\'t need all of the fields that WebGUI\'s product manager gives you. When creating your template, be sure to remove those fields for faster operation.\r\n<p>\r\n<b>NOTE:</b> You shouldn\'t edit the default templates, but rather make copies of them if you wish to edit them. This is because the templates may be changed in future releases of WebGUI and then your changes would be lost at upgrade time. If you make copies, or create your own templates, you won\'t have to worry about losing your changes.\r\n<p>\r\nThere are many custom macros to use in your product templates. They are as follows:\r\n<p>\r\n<b>^Product_Accessories;</b><br>\r\nDisplays the list of accessories associated with this product.\r\n<p>\r\n<b>^Product_Benefits;</b><br>\r\nDisplays the list of benefits associated with this product.\r\n<p>\r\n<b>^Product_Description;</b><br>\r\nDisplays the product\'s description.\r\n<p>\r\n<b>^Product_Features;</b><br>\r\nDisplays the list of features associated with this product.\r\n<p>\r\n<b>^Product_Image1;</b><br>\r\nDisplays the first image you uploaded with this product (if any).\r\n<p>\r\n<b>^Product_Image2;</b><br>\r\nDisplays the second image you uploaded with this product (if any).\r\n<p>\r\n<b>^Product_Image2;</b><br>\r\nDisplays the third image you uploaded with this product (if any).\r\n<p>\r\n<b>^Product_Number;</b><br>\r\nDisplays the product\'s number field or SKU.\r\n<p>\r\n<b>^Product_Price;</b><br>\r\nDisplays the product\'s price field.\r\n<p>\r\n<b>^Product_Related;</b><br>\r\nDisplays the list of related products associated with this product.\r\n<p>\r\n<b>^Product_Specifications;</b><br>\r\nDisplays the list of specifications associated with this product.\r\n<p>\r\n<b>^Product_Thumbnail1;</b><br>\r\nDisplays the thumbnail of the first image you uploaded with this product (if any) along with a link to view the full size image.\r\n<p>\r\n<b>^Product_Thumbnail2;</b><br>\r\nDisplays the thumbnail of the second image you uploaded with this product (if any) along with a link to view the full size image.\r\n<p>\r\n<b>^Product_Thumbnail3;</b><br>\r\nDisplays the thumbnail of the third image you uploaded with this product (if any) along with a link to view the full size image.\r\n<p>\r\n<b>^Product_Title;</b><br>\r\nDisplays the title of the product. Note that if you use this macro, you\'ll likely want to turn off the default title by selecting \"No\" on the \"Display title?\" field.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (670,'WebGUI',1,'Image, Add/Edit',1031514049);
INSERT INTO international VALUES (673,'WebGUI',1,'Image, Delete',1031514049);
INSERT INTO international VALUES (676,'WebGUI',1,'Images, Manage',1031514049);
INSERT INTO international VALUES (678,'WebGUI',1,'Root, Manage',1031514049);
INSERT INTO international VALUES (681,'WebGUI',1,'Packages, Creating',1031514049);
INSERT INTO international VALUES (680,'WebGUI',1,'Package, Add',1031514049);
INSERT INTO international VALUES (675,'WebGUI',1,'Search Engine, Using',1031514049);
INSERT INTO international VALUES (656,'WebGUI',1,'Company Information, Edit',1031514049);
INSERT INTO international VALUES (696,'WebGUI',1,'Trash, Empty',1031514049);
INSERT INTO international VALUES (672,'WebGUI',1,'Profile Settings, Edit',1031514049);
INSERT INTO international VALUES (674,'WebGUI',1,'Miscellaneous Settings, Edit',1031514049);
INSERT INTO international VALUES (661,'WebGUI',1,'File Settings, Edit',1031514049);
INSERT INTO international VALUES (663,'WebGUI',1,'Mail Settings, Edit',1031514049);
INSERT INTO international VALUES (671,'WebGUI',1,'Wobjects, Using',1031514049);
INSERT INTO international VALUES (677,'WebGUI',1,'Wobject, Add/Edit',1031514049);
INSERT INTO international VALUES (668,'WebGUI',1,'Style Sheets, Using',1031514049);
INSERT INTO international VALUES (667,'WebGUI',1,'Group, Add/Edit',1031514049);
INSERT INTO international VALUES (652,'WebGUI',1,'User Settings, Edit',1031514049);
INSERT INTO international VALUES (665,'WebGUI',1,'Group, Delete',1031514049);
INSERT INTO international VALUES (666,'WebGUI',1,'Style, Add/Edit',1031514049);
INSERT INTO international VALUES (664,'WebGUI',1,'Wobject, Delete',1031514049);
INSERT INTO international VALUES (662,'WebGUI',1,'Settings, Manage',1031514049);
INSERT INTO international VALUES (660,'WebGUI',1,'Groups, Manage',1031514049);
INSERT INTO international VALUES (658,'WebGUI',1,'Users, Manage',1031514049);
INSERT INTO international VALUES (659,'WebGUI',1,'Styles, Manage',1031514049);
INSERT INTO international VALUES (657,'WebGUI',1,'User, Delete',1031514049);
INSERT INTO international VALUES (682,'WebGUI',1,'User Profile, Edit',1031514049);
INSERT INTO international VALUES (655,'WebGUI',1,'User, Add/Edit',1031514049);
INSERT INTO international VALUES (653,'WebGUI',1,'Page, Delete',1031514049);
INSERT INTO international VALUES (654,'WebGUI',1,'Style, Delete',1031514049);
INSERT INTO international VALUES (679,'WebGUI',1,'Content Settings, Edit',1031514049);
INSERT INTO international VALUES (683,'WebGUI',1,'Templates, Manage',1031514049);
INSERT INTO international VALUES (684,'WebGUI',1,'Template, Add/Edit',1031514049);
INSERT INTO international VALUES (685,'WebGUI',1,'Template, Delete',1031514049);
INSERT INTO international VALUES (669,'WebGUI',1,'Macros, Using',1031514049);
INSERT INTO international VALUES (686,'WebGUI',1,'Image Group, Add',1031514049);
INSERT INTO international VALUES (641,'WebGUI',1,'Image groups are like folders that are used to organize your images. The use of image groups is not required, but on large sites it is definitely useful.\r\n<p>\r\n\r\n<b>Group Name</b><br>\r\nThe name that will be displayed as you\'re browsing through your images.\r\n<p>\r\n\r\n<b>Group Description</b><br>\r\nBriefly describe what this image group is used for.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (72,'FileManager',1,'Download, Add/Edit',1031514049);
INSERT INTO international VALUES (73,'FileManager',1,'<b>File Title</b><br>\r\nThe title that will be displayed for this download.\r\n<p>\r\n\r\n<b>Download File</b><br>\r\nChoose the file from your hard drive that you wish to upload to this download manager.\r\n<p>\r\n\r\n<b>Alternate Version #1</b><br>\r\nAn alternate version of the Download File. For instance, if the download file was a JPEG, perhaps the alternate version would be a TIFF or a BMP.\r\n<p>\r\n\r\n<b>Alternate Version #2</b><br>\r\nAn alternate version of the Download File. For instance, if the download file was a JPEG, perhaps the alternate version would be a TIFF or a BMP.\r\n<p>\r\n\r\n<b>Brief Synopsis</b><br>\r\nA short description of this file. Be sure to include keywords that users may try to search for.\r\n<p>\r\n\r\n<b>Group To Download</b><br>\r\nChoose the group that may download this file.\r\n<p>\r\n\r\n<b>Proceed to add download?</b><br>\r\nChoose \"Yes\" if you have another file to add to this download manager.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (72,'EventsCalendar',1,'Event, Add/Edit',1031514049);
INSERT INTO international VALUES (73,'EventsCalendar',1,'<b>Title</b><br>\r\nThe title for this event.\r\n<p>\r\n\r\n<b>Description</b><br>\r\nDescribe the activities of this event or information about where the event is to be held.\r\n<p>\r\n\r\n<b>Start Date</b><br>\r\nOn what date will this event begin?\r\n<p>\r\n\r\n<b>End Date</b><br>\r\nOn what date will this event end?\r\n<p>\r\n\r\n<b>Recurs every<b><br>\r\nSelect a recurrence interval for this event. \r\n\r\n<p>\r\n\r\n<b>Proceed to add event?</b><br>\r\nIf you\'d like to add another event, select \"Yes\".\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (72,'FAQ',1,'Question, Add/Edit',1031514049);
INSERT INTO international VALUES (73,'FAQ',1,'<b>Question</b><br>\r\nAdd the question you\'d like to appear on the FAQ.\r\n<p>\r\n\r\n\r\n<b>Answer</b><br>\r\nAdd the answer for the question you entered above.\r\n<p>\r\n\r\n\r\n<b>Proceed to add question?</b><br>\r\nIf you have another question to add, select \"Yes\".\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (50,'Product',1,'Benefits are typically the result of the features of your product. They are why your product is so good. If you add benefits, you may also wish to consider adding some features.\r\n<p>\r\n\r\n<b>Benefit</b><br>\r\nYou may enter a new benefit, or select from one you\'ve already entered.\r\n<p>\r\n\r\n<b>Add another benefit?</b><br>\r\nIf you\'d like to add another benefit right away, select \"Yes\".\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (72,'LinkList',1,'Link, Add/Edit',1031514049);
INSERT INTO international VALUES (73,'LinkList',1,'<b>Title</b><br>\r\nThe text that will be linked.\r\n<p>\r\n\r\n<b>URL</b><br>\r\nThe web site to link to.\r\n<p>\r\n\r\n<b>Open in new window?</b><br>\r\nSelect yes if you\'d like this link to pop-up into a new window.\r\n<p>\r\n\r\n<b>Description</b><br>\r\nDescribe the site you\'re linking to. You can omit this if you\'d like.\r\n<p>\r\n\r\n<b>Proceed to add link?</b>\r\nIf you have another link to add, select \"Yes\".\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (49,'Product',1,'Product Benefit, Add/Edit',1031514049);
INSERT INTO international VALUES (697,'WebGUI',1,'Karma, Using',1031514049);
INSERT INTO international VALUES (698,'WebGUI',1,'Karma is a method of tracking the activity of your users, and potentially rewarding or punishing them for their level of activity. Once karma has been enabled, you\'ll notice that the menus of many things in WebGUI change to reflect karma.\r\n<p>\r\n\r\nYou can track whether users are logging in, and how much they contribute to your site. And you can allow them access to additional features by the level of their karma.\r\n<p>\r\n\r\nYou can find out more about karma in <a href=\"http://www.plainblack.com/ruling_webgui\">Ruling WebGUI</a>.',1031514049);
INSERT INTO international VALUES (5,'WobjectProxy',1,'Wobject Proxy, Add/Edit',1031514049);
INSERT INTO international VALUES (6,'WobjectProxy',1,'With the Wobject Proxy you can mirror a wobject from another page to any other page. This is useful if you want to reuse the same content in multiple sections of your site.\r\n<p>\r\n\r\n\r\n<b>Wobject To Proxy</b><br>\r\nSelect the wobject from your system that you\'d like to proxy. The select box takes the format of \"<b>Page Title</b> / <b>Wobject Name</b> (<b>Wobject Id</b>) so that you can quickly and accurately find the wobject you\'re looking for.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (38,'Product',1,'Product, Add/Edit',1031514049);
INSERT INTO international VALUES (39,'Product',1,'WebGUI has a product management system built in to enable you to publish your products and services to your site quickly and easily.\r\n<p>\r\n\r\n<b>Price</b><br>\r\nThe price of this product. You may optionally enter text like \"call for pricing\" if you wish, or you may leave it blank.\r\n<p>\r\n\r\n<b>Product Number</b><br>\r\nThe product number, SKU, ISBN, or other identifier for this product.\r\n<p>\r\n\r\n<b>Product Image 1</b><br>\r\nAn image of this product.\r\n<p>\r\n\r\n<b>Product Image 2</b><br>\r\nAn image of this product.\r\n<p>\r\n\r\n<b>Product Image 3</b><br>\r\nAn image of this product.\r\n<p>\r\n\r\n<b>Brochure</b><br>\r\nThe brochure for this product.\r\n<p>\r\n\r\n<b>Manual</b><br>\r\nThe product, user, or service manual for this product.\r\n<p>\r\n\r\n<b>Warranty</b><br>\r\nThe warranty for this product.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (40,'Product',1,'Product Feature, Add/Edit',1031514049);
INSERT INTO international VALUES (41,'Product',1,'Features are selling points for a product. IE: Reasons to buy your product. Features often result in benefits, so you may want to also add some benefits to this product.\r\n<p>\r\n\r\n<b>Feature</b><br>\r\nYou may enter a new feature, or select one you entered for another product in the system.\r\n<p>\r\n\r\n<b>Add another feature?</b><br>\r\nIf you\'d like to add another feature right away, select \"Yes\".\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (42,'Product',1,'Product Specification, Add/Edit',1031514049);
INSERT INTO international VALUES (43,'Product',1,'Specifications are the technical details of your product.\r\n<p>\r\n\r\n\r\n<b>Label</b><br>\r\nThe type of specification. For instance, height, weight,   or color. You may select one you\'ve entered for another product, or type in a new specification.\r\n<p>\r\n\r\n\r\n<b>Specification</b><br>\r\nThe actual specification value. For instance, if you chose height as the Label, then you\'d enter a numeric value like \"18\".\r\n<p>\r\n\r\n\r\n<b>Units</b><br>\r\nThe unit of measurement for this specification. For instance, if you chose height for your label, perhaps the units would be \"meters\".\r\n<p>\r\n\r\n\r\n<b>Add another specification?</b><br>\r\nIf you\'d like to add another specification, select \"Yes\".\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (709,'WebGUI',1,'<b>Image Managers Group</b><br>\r\nSelect the group that should have control over adding, editing, and deleting images.\r\n<p>\r\n\r\n<b>Style Managers Group</b><br>\r\nSelect the group that should have control over adding, editing, and deleting styles.\r\n<p>\r\n\r\n<b>Template Managers Group</b><br>\r\nSelect the group that should have control over adding, editing, and deleting templates.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (44,'Product',1,'Product Accessory, Add/Edit',1031514049);
INSERT INTO international VALUES (45,'Product',1,'Accessories are products that enhance other products.\r\n<p>\r\n\r\n<b>Accessory</b><br>\r\nChoose from the list of products you\'ve already entered.\r\n<p>\r\n\r\n<b>Add another accessory?</b><br>\r\nSelect \"Yes\" if you have another accessory to add.\r\n<p>\r\n',1031514049);
INSERT INTO international VALUES (46,'Product',1,'Product (Related), Add/Edit',1031514049);
INSERT INTO international VALUES (47,'Product',1,'Related products are products that are comparable or complimentary to other products.\r\n<p>\r\n\r\n\r\n<b>Related products</b><br>\r\nChoose from the list of products you\'ve already entered.\r\n<p>\r\n\r\n\r\n<b>Add another related product?</b><br>\r\nSelect \"Yes\" if you have another related product to add.\r\n<p>\r\n\r\n',1031514049);
INSERT INTO international VALUES (708,'WebGUI',1,'Privilege Settings, Manage',1031514049);
INSERT INTO international VALUES (30,'USS',1,'Karma Per Submission',1031514049);
INSERT INTO international VALUES (72,'Poll',1,'Randomize answers?',1031514049);
INSERT INTO international VALUES (699,'WebGUI',1,'First Day Of Week',1031514049);
INSERT INTO international VALUES (74,'EventsCalendar',1,'Calendar Month (Small)',1031514049);
INSERT INTO international VALUES (702,'WebGUI',1,'Month(s)',1031514049);
INSERT INTO international VALUES (703,'WebGUI',1,'Year(s)',1031514049);
INSERT INTO international VALUES (704,'WebGUI',1,'Second(s)',1031514049);
INSERT INTO international VALUES (705,'WebGUI',1,'Minute(s)',1031514049);
INSERT INTO international VALUES (706,'WebGUI',1,'Hour(s)',1031514049);
INSERT INTO international VALUES (716,'WebGUI',1,'Login',1031514049);
INSERT INTO international VALUES (717,'WebGUI',1,'Logout',1031514049);
INSERT INTO international VALUES (41,'USS',3,'Datum',1031516049);
INSERT INTO international VALUES (45,'USS',3,'Ga terug naar bijdrages',1031516049);
INSERT INTO international VALUES (46,'USS',3,'Lees meer...',1031516049);
INSERT INTO international VALUES (47,'USS',3,'Post een reactie',1031516049);
INSERT INTO international VALUES (48,'USS',3,'Discussie toestaan?',1031516049);
INSERT INTO international VALUES (51,'USS',3,'Miniaturen weergeven',1031516049);
INSERT INTO international VALUES (52,'USS',3,'Miniatuur',1031516049);
INSERT INTO international VALUES (53,'USS',3,'Layout',1031516049);
INSERT INTO international VALUES (57,'USS',3,'Reacties',1031516049);
INSERT INTO international VALUES (516,'WebGUI',3,'Zet beheermode aan!',1031516049);
INSERT INTO international VALUES (517,'WebGUI',3,'Zet beheermode uit!',1031516049);
INSERT INTO international VALUES (515,'WebGUI',3,'Bewerkings stempel toevoegen?',1031516049);
INSERT INTO international VALUES (532,'WebGUI',3,'Met minstens 1 van de worden',1031516049);
INSERT INTO international VALUES (531,'WebGUI',3,'met de exacte zin',1031516049);
INSERT INTO international VALUES (505,'WebGUI',3,'Een niewe template toevoegen',1031516049);
INSERT INTO international VALUES (504,'WebGUI',3,'Sjabloon',1031516049);
INSERT INTO international VALUES (503,'WebGUI',3,'Sjabloon ID',1031516049);
INSERT INTO international VALUES (502,'WebGUI',3,'Weet u zeker dat u deze sjabloon wilt verwijderen? Elke pagina die de template gebruikt zal de standaard template krijgen!',1031516049);
INSERT INTO international VALUES (536,'WebGUI',3,'Een nieuwe gebruiker genaamd ^@; is bij de site aangemeld',1031516049);
INSERT INTO international VALUES (356,'WebGUI',3,'Sjabloon',1031516049);
INSERT INTO international VALUES (357,'WebGUI',3,'Nieuws',1031516049);
INSERT INTO international VALUES (358,'WebGUI',3,'Linker kolom',1031516049);
INSERT INTO international VALUES (359,'WebGUI',3,'Rechter kolom',1031516049);
INSERT INTO international VALUES (360,'WebGUI',3,'Een boven drie',1031516049);
INSERT INTO international VALUES (361,'WebGUI',3,'Drie boven een',1031516049);
INSERT INTO international VALUES (362,'WebGUI',3,'Zij aan zij',1031516049);
INSERT INTO international VALUES (363,'WebGUI',3,'Sjabloon positie',1031516049);
INSERT INTO international VALUES (364,'WebGUI',3,'Zoeken',1031516049);
INSERT INTO international VALUES (365,'WebGUI',3,'Zoek resultaten',1031516049);
INSERT INTO international VALUES (366,'WebGUI',3,'Er is geen pagina die aan uw vraag voldoet',1031516049);
INSERT INTO international VALUES (368,'WebGUI',3,'Voeg een nieuwe groep aan deze gebruiker toe',1031516049);
INSERT INTO international VALUES (369,'WebGUI',3,'Verloop datum',1031516049);
INSERT INTO international VALUES (370,'WebGUI',3,'Bewerk groeperen',1031516049);
INSERT INTO international VALUES (371,'WebGUI',3,'Groeperen toevoegen',1031516049);
INSERT INTO international VALUES (372,'WebGUI',3,'Bewerk gebruiker groep',1031516049);
INSERT INTO international VALUES (374,'WebGUI',3,'Beheer pakketten',1031516049);
INSERT INTO international VALUES (375,'WebGUI',3,'Selecteer pakket',1031516049);
INSERT INTO international VALUES (376,'WebGUI',3,'Pakket',1031516049);
INSERT INTO international VALUES (377,'WebGUI',3,'Er zijn geen pakketten gedefinieerd door uw pakket manager of beheerder.',1031516049);
INSERT INTO international VALUES (378,'WebGUI',3,'Gebruikers ID',1031516049);
INSERT INTO international VALUES (379,'WebGUI',3,'Groep ID',1031516049);
INSERT INTO international VALUES (380,'WebGUI',3,'Stijl ID',1031516049);
INSERT INTO international VALUES (381,'WebGUI',3,'WebGUI heeft een verkeerde vraag gekregen en kan niet verder gaan. Bepaalde karakters op de pagina kunnen de oorzaak zijn. Probeer terug te gaan naar de vorige pagina en probeer het opnieuw.',1031516049);
INSERT INTO international VALUES (528,'WebGUI',3,'Sjabloon naam',1031516049);
INSERT INTO international VALUES (383,'WebGUI',3,'Naam',1031516049);
INSERT INTO international VALUES (384,'WebGUI',3,'Bestand',1031516049);
INSERT INTO international VALUES (385,'WebGUI',3,'Parameters',1031516049);
INSERT INTO international VALUES (386,'WebGUI',3,'Bewerk plaatje',1031516049);
INSERT INTO international VALUES (387,'WebGUI',3,'Geleverd door',1031516049);
INSERT INTO international VALUES (388,'WebGUI',3,'Upload datum',1031516049);
INSERT INTO international VALUES (389,'WebGUI',3,'Plaatje ID',1031516049);
INSERT INTO international VALUES (390,'WebGUI',3,'Plaatje laten zien......',1031516049);
INSERT INTO international VALUES (391,'WebGUI',3,'Verwijder bijgevoegd bestand',1031516049);
INSERT INTO international VALUES (392,'WebGUI',3,'Weet u zeker dat u dit plaatje wilt verwijderen?',1031516049);
INSERT INTO international VALUES (393,'WebGUI',3,'Beheer plaatjes',1031516049);
INSERT INTO international VALUES (394,'WebGUI',3,'Beheer plaatjes.',1031516049);
INSERT INTO international VALUES (395,'WebGUI',3,'Een nieuw plaatje toevoegen',1031516049);
INSERT INTO international VALUES (396,'WebGUI',3,'Plaatje laten zien',1031516049);
INSERT INTO international VALUES (397,'WebGUI',3,'Terug naar plaatjes lijst',1031516049);
INSERT INTO international VALUES (398,'WebGUI',3,'Document type declaratie',1031516049);
INSERT INTO international VALUES (399,'WebGUI',3,'Valideer deze pagina',1031516049);
INSERT INTO international VALUES (400,'WebGUI',3,'Voorkom Proxy Caching',1031516049);
INSERT INTO international VALUES (401,'WebGUI',3,'Weet u zeker dat u dit bericht wilt verwijderen en alle berichten onder deze thread?',1031516049);
INSERT INTO international VALUES (402,'WebGUI',3,'Het bericht wat u vroeg bestaat niet.',1031516049);
INSERT INTO international VALUES (403,'WebGUI',3,'Geen mening',1031516049);
INSERT INTO international VALUES (405,'WebGUI',3,'Laatste pagina',1031516049);
INSERT INTO international VALUES (406,'WebGUI',3,'Miniatuur grootte',1031516049);
INSERT INTO international VALUES (407,'WebGUI',3,'Klik hier om te registreren',1031516049);
INSERT INTO international VALUES (506,'WebGUI',3,'Beheer Sjablonen',1031516049);
INSERT INTO international VALUES (408,'WebGUI',3,'Beheer roots',1031516049);
INSERT INTO international VALUES (409,'WebGUI',3,'Een nieuwe root toevoegen',1031516049);
INSERT INTO international VALUES (410,'WebGUI',3,'Beheer roots.',1031516049);
INSERT INTO international VALUES (411,'WebGUI',3,'Menu Titel',1031516049);
INSERT INTO international VALUES (412,'WebGUI',3,'Omschrijving',1031516049);
INSERT INTO international VALUES (416,'WebGUI',3,'<h1>Probleem met aanvraag</h1><br> We hebben een probleemm gevonden met de aanvraag van deze pagina. Ga terug naar de vorige pagina en probeer het opnieuw. Mocht het probleem zich blijven voordoen wendt u dan tot de beheerder.',1031516049);
INSERT INTO international VALUES (417,'WebGUI',3,'<h1>Beveiligings probleem</h1><br> U probeerde een widget op te vragen die niet bij deze pagina hoort. Het incident is gerapporteerd.',1031516049);
INSERT INTO international VALUES (418,'WebGUI',3,'Filter Contributed HTML',1031516049);
INSERT INTO international VALUES (419,'WebGUI',3,'Verwijder alle tags',1031516049);
INSERT INTO international VALUES (420,'WebGUI',3,'Laat het zoals het is',1031516049);
INSERT INTO international VALUES (421,'WebGUI',3,'Verwijder alles behalve de basis formaten',1031516049);
INSERT INTO international VALUES (422,'WebGUI',3,'<h1>Login Fout</h1><br>De informatie komt niet overeen met het account',1031516049);
INSERT INTO international VALUES (423,'WebGUI',3,'Laat aktieve sessies zien',1031516049);
INSERT INTO international VALUES (424,'WebGUI',3,'Laat login historie zien',1031516049);
INSERT INTO international VALUES (425,'WebGUI',3,'Aktieve sessies',1031516049);
INSERT INTO international VALUES (426,'WebGUI',3,'Login historie',1031516049);
INSERT INTO international VALUES (427,'WebGUI',3,'Stijlen',1031516049);
INSERT INTO international VALUES (428,'WebGUI',3,'Gebruiker (ID)',1031516049);
INSERT INTO international VALUES (429,'WebGUI',3,'Login tijd',1031516049);
INSERT INTO international VALUES (430,'WebGUI',3,'Laatst bekeken pagina',1031516049);
INSERT INTO international VALUES (431,'WebGUI',3,'IP Adres',1031516049);
INSERT INTO international VALUES (432,'WebGUI',3,'Verloopt',1031516049);
INSERT INTO international VALUES (433,'WebGUI',3,'Gebruikers applicatie',1031516049);
INSERT INTO international VALUES (434,'WebGUI',3,'Status',1031516049);
INSERT INTO international VALUES (435,'WebGUI',3,'Sessie handtekening',1031516049);
INSERT INTO international VALUES (436,'WebGUI',3,'Vermoord sessie',1031516049);
INSERT INTO international VALUES (437,'WebGUI',3,'Statistieken',1031516049);
INSERT INTO international VALUES (438,'WebGUI',3,'Uw naam',1031516049);
INSERT INTO international VALUES (441,'WebGUI',3,'Email naar pager gateway',1031516049);
INSERT INTO international VALUES (442,'WebGUI',3,'Bedrijfs informatie',1031516049);
INSERT INTO international VALUES (443,'WebGUI',3,'Thuis informatie',1031516049);
INSERT INTO international VALUES (439,'WebGUI',3,'Persoonlijke informatie',1031516049);
INSERT INTO international VALUES (440,'WebGUI',3,'Contact informatie',1031516049);
INSERT INTO international VALUES (444,'WebGUI',3,'Demografische informatie',1031516049);
INSERT INTO international VALUES (445,'WebGUI',3,'Voorkeuren',1031516049);
INSERT INTO international VALUES (446,'WebGUI',3,'Bedrijfs website',1031516049);
INSERT INTO international VALUES (447,'WebGUI',3,'Beheer pagina boom',1031516049);
INSERT INTO international VALUES (448,'WebGUI',3,'Pagina boom',1031516049);
INSERT INTO international VALUES (449,'WebGUI',3,'Overige informatie',1031516049);
INSERT INTO international VALUES (450,'WebGUI',3,'Werk naam (Bedrijfsnaam)',1031516049);
INSERT INTO international VALUES (451,'WebGUI',3,'is vereist',1031516049);
INSERT INTO international VALUES (452,'WebGUI',3,'Even wachten alstublieft....',1031516049);
INSERT INTO international VALUES (453,'WebGUI',3,'Creatie datum',1031516049);
INSERT INTO international VALUES (454,'WebGUI',3,'Laatst veranderd',1031516049);
INSERT INTO international VALUES (455,'WebGUI',3,'Bewerk gebruikersprofiel',1031516049);
INSERT INTO international VALUES (456,'WebGUI',3,'Terug naar gebruikers lijst',1031516049);
INSERT INTO international VALUES (457,'WebGUI',3,'Bewerk het account van deze gebruiker',1031516049);
INSERT INTO international VALUES (458,'WebGUI',3,'Bewerk de groepen van deze gebruiker',1031516049);
INSERT INTO international VALUES (459,'WebGUI',3,'Bewerk het profiel van deze gebruiker',1031516049);
INSERT INTO international VALUES (460,'WebGUI',3,'Tijd offset',1031516049);
INSERT INTO international VALUES (461,'WebGUI',3,'Datum formaat',1031516049);
INSERT INTO international VALUES (462,'WebGUI',3,'Tijd formaat',1031516049);
INSERT INTO international VALUES (463,'WebGUI',3,'Tekst vlak rijen',1031516049);
INSERT INTO international VALUES (464,'WebGUI',3,'Tekst vlak kolommen',1031516049);
INSERT INTO international VALUES (465,'WebGUI',3,'Tekst blok grootte',1031516049);
INSERT INTO international VALUES (466,'WebGUI',3,'Weet u zeker dat u deze categorie wilt verwijderen en alle velden naar de overige categorie wilt verplaatsen?',1031516049);
INSERT INTO international VALUES (467,'WebGUI',3,'Weet u zeker dat u dit veld wilt verwijderen en daarmee ook alle data die er aan vast zit?',1031516049);
INSERT INTO international VALUES (469,'WebGUI',3,'Id',1031516049);
INSERT INTO international VALUES (470,'WebGUI',3,'Naam',1031516049);
INSERT INTO international VALUES (472,'WebGUI',3,'Label',1031516049);
INSERT INTO international VALUES (473,'WebGUI',3,'Zichtbaar?',1031516049);
INSERT INTO international VALUES (474,'WebGUI',3,'Verplicht?',1031516049);
INSERT INTO international VALUES (475,'WebGUI',3,'Tekst',1031516049);
INSERT INTO international VALUES (476,'WebGUI',3,'Tekst vlak',1031516049);
INSERT INTO international VALUES (477,'WebGUI',3,'HTML vlak',1031516049);
INSERT INTO international VALUES (478,'WebGUI',3,'URL',1031516049);
INSERT INTO international VALUES (479,'WebGUI',3,'Datum',1031516049);
INSERT INTO international VALUES (480,'WebGUI',3,'Email adres',1031516049);
INSERT INTO international VALUES (481,'WebGUI',3,'Telefoon nummer',1031516049);
INSERT INTO international VALUES (482,'WebGUI',3,'Nummer (Geheel getal)',1031516049);
INSERT INTO international VALUES (483,'WebGUI',3,'Ja of nee',1031516049);
INSERT INTO international VALUES (484,'WebGUI',3,'Selecteer lijst',1031516049);
INSERT INTO international VALUES (485,'WebGUI',3,'Booleaanse waarde (Checkbox)',1031516049);
INSERT INTO international VALUES (486,'WebGUI',3,'Data type',1031516049);
INSERT INTO international VALUES (487,'WebGUI',3,'Mogelijke waardes',1031516049);
INSERT INTO international VALUES (488,'WebGUI',3,'Standaard waarde(s)',1031516049);
INSERT INTO international VALUES (489,'WebGUI',3,'Profiel categorie',1031516049);
INSERT INTO international VALUES (490,'WebGUI',3,'Profiel categorie toevoegen',1031516049);
INSERT INTO international VALUES (491,'WebGUI',3,'Profiel veld toevoegen',1031516049);
INSERT INTO international VALUES (492,'WebGUI',3,'Profiel veld lijst',1031516049);
INSERT INTO international VALUES (493,'WebGUI',3,'terug naar de site',1031516049);
INSERT INTO international VALUES (496,'WebGUI',3,'Ingebouwde editor',1031516049);
INSERT INTO international VALUES (494,'WebGUI',3,'Te gebruiken Editor',1031516049);
INSERT INTO international VALUES (497,'WebGUI',3,'Start datum',1031516049);
INSERT INTO international VALUES (498,'WebGUI',3,'Eind Datum',1031516049);
INSERT INTO international VALUES (499,'WebGUI',3,'Wobject ID',1031516049);
INSERT INTO international VALUES (500,'WebGUI',3,'Pagina ID',1031516049);
INSERT INTO international VALUES (514,'WebGUI',3,'Bekeken',1031516049);
INSERT INTO international VALUES (527,'WebGUI',3,'Standaard home pagina',1031516049);
INSERT INTO international VALUES (530,'WebGUI',3,'Met alle woorden',1031516049);
INSERT INTO international VALUES (501,'WebGUI',3,'Body',1031516049);
INSERT INTO international VALUES (468,'WebGUI',3,'Bewerk gebruikers profiel categorie',1031516049);
INSERT INTO international VALUES (507,'WebGUI',3,'Bewerk sjabloon',1031516049);
INSERT INTO international VALUES (508,'WebGUI',3,'Beheer sjablonen',1031516049);
INSERT INTO international VALUES (509,'WebGUI',3,'Discussie layout',1031516049);
INSERT INTO international VALUES (510,'WebGUI',3,'Plat',1031516049);
INSERT INTO international VALUES (511,'WebGUI',3,'threaded',1031516049);
INSERT INTO international VALUES (512,'WebGUI',3,'Volgende thread',1031516049);
INSERT INTO international VALUES (513,'WebGUI',3,'Vorige thread',1031516049);
INSERT INTO international VALUES (533,'WebGUI',3,'Zonder de woorden',1031516049);
INSERT INTO international VALUES (529,'WebGUI',3,'Resultaten',1031516049);
INSERT INTO international VALUES (518,'WebGUI',3,'Inbox notificaties',1031516049);
INSERT INTO international VALUES (519,'WebGUI',3,'Ik wil geen notificatie krijgen',1031516049);
INSERT INTO international VALUES (520,'WebGUI',3,'Ik wil notificatie via email',1031516049);
INSERT INTO international VALUES (521,'WebGUI',3,'Ik wil notificatie via email naar pager',1031516049);
INSERT INTO international VALUES (522,'WebGUI',3,'Ik wil notificatie via ICQ',1031516049);
INSERT INTO international VALUES (523,'WebGUI',3,'Notificatie',1031516049);
INSERT INTO international VALUES (524,'WebGUI',3,'Voeg bewerk stempel toe aan post',1031516049);
INSERT INTO international VALUES (525,'WebGUI',3,'Bewerk inhoud Settings',1031516049);
INSERT INTO international VALUES (526,'WebGUI',3,'Verwijder alleen javascript',1031516049);
INSERT INTO international VALUES (72,'EventsCalendar',3,'Gebeurtenis, Toevoegen/aanpassen',1031516049);
INSERT INTO international VALUES (9,'Product',3,'Product plaatje 3',1031516049);
INSERT INTO international VALUES (9,'MailForm',3,'Voeg veld toe',1031516049);
INSERT INTO international VALUES (8,'Product',3,'Product plaatje 2',1031516049);
INSERT INTO international VALUES (8,'MailForm',3,'Breedte',1031516049);
INSERT INTO international VALUES (78,'EventsCalendar',3,'Niets weggooien, ik heb een foutje gemaakt.',1031516049);
INSERT INTO international VALUES (77,'EventsCalendar',3,'Gooi deze gebeurtenis weg <b>en</b> alle herhalingen hiervan.',1031516049);
INSERT INTO international VALUES (76,'EventsCalendar',3,'Gooi alleen deze gebeurtenis weg.',1031516049);
INSERT INTO international VALUES (75,'EventsCalendar',3,'Welke van deze keuzes wilt u uitvoeren?',1031516049);
INSERT INTO international VALUES (74,'EventsCalendar',3,'Maandkalender (klein)',1031516049);
INSERT INTO international VALUES (73,'LinkList',3,'<b>Titel</b><br>\r\nText die gelinked zal worden.\r\n<p>\r\n<b>URL</b><br>\r\nDe Website waarnaar gelinked wordt.\r\n<p>\r\n\r\n<b>In een nieuw venster openen?</b><br>\r\nSelecteer ja als u wilt dat deze link in een nieuw opkomend venster geopend wordt.\r\n<p>\r\n\r\n<b>Omschrijving</b><br>\r\nBeschrijf de site waar u naar linkt. Dit kan weggelaten worden als u dat wilt.\r\n<p>\r\n\r\n<b>Nog een link toevoegen?</b><br>\r\nAls u nog een link toe wilt voegen, selecteer dan ja.\r\n<p>\r\n',1031516049);
INSERT INTO international VALUES (73,'FAQ',3,'<b>Vraag</b><br>\r\nVoer de vraag in die u in de FAQ wilt laten verschijnen.\r\n<p>\r\n\r\n\r\n<b>Antwoord</b><br>\r\nVoer het antwoord in voor de vraag die u hierboven heeft ingevuld.\r\n<p>\r\n\r\n\r\n<b>Nog een vraag toevoegen?</b><br>\r\nAls u nog een vraag wilt toevoegen, selecteer dan ja.\r\n<p>\r\n',1031516049);
INSERT INTO international VALUES (73,'EventsCalendar',3,'<b>Titel</b><br>\r\nDe titel voor deze gebeurtenis.\r\n<p>\r\n\r\n<b>Beschrijving</b><br>\r\nOmschrijf de activiteit van deze gebeurtenis of voer informatie in over waar deze gebeurtenis plaatsvind.\r\n<p>\r\n\r\n<b>Begindatum</b><br>\r\nWanneer begint deze gebeurtenis?\r\n<p>\r\n\r\n<b>Einddatum</b><br>\r\nOp welke datum zal deze gebeurtenis plaatsvinden?\r\n<p>\r\n\r\n<b>Gebeurt iedere</b><br>\r\nSelecteer een interval waarin deze gebeurtenis opnieuw plaatsvind.\r\n<p>\r\n\r\n<b>Nog een gebeurtenis toevoegen?</b><br>\r\nAls u nog een gebeurtenis toe wilt voegen, selecteer dan ja.\r\n<p>',1031516049);
INSERT INTO international VALUES (72,'Poll',3,'Antwoorden in willekeurige volgorde weergeven?',1031516049);
INSERT INTO international VALUES (72,'LinkList',3,'Link, Toevoegen/Aanpassen',1031516049);
INSERT INTO international VALUES (72,'FAQ',3,'Vraag, Toevoegen/Aanpasssen',1031516049);
INSERT INTO international VALUES (72,'FileManager',3,'Download, Toevoegen/Aanpassen',1031516049);
INSERT INTO international VALUES (717,'WebGUI',3,'Uitloggen',1031516049);
INSERT INTO international VALUES (716,'WebGUI',3,'Inloggen',1031516049);
INSERT INTO international VALUES (715,'WebGUI',3,'Redirect URL',1031516049);
INSERT INTO international VALUES (714,'WebGUI',3,'Sjabloonbeheer groep',1031516049);
INSERT INTO international VALUES (713,'WebGUI',3,'Stijlbeheer groep',1031516049);
INSERT INTO international VALUES (711,'WebGUI',3,'Plaatjesbeheer groep',1031516049);
INSERT INTO international VALUES (710,'WebGUI',3,'Pas privilege instellingen aan',1031516049);
INSERT INTO international VALUES (654,'WebGUI',3,'Stijl, Verwijder',1031516049);
INSERT INTO international VALUES (471,'WebGUI',3,'Pas gebruikers profielveld aan',1031516049);
INSERT INTO international VALUES (36,'Product',3,'Voeg een accesoire toe',1031516049);
INSERT INTO international VALUES (585,'WebGUI',3,'Beheer vertalingen.',1031516049);
INSERT INTO international VALUES (708,'WebGUI',3,'Privilege instellingen, Beheren',1031516049);
INSERT INTO international VALUES (707,'WebGUI',3,'Laat debugging zien?',1031516049);
INSERT INTO international VALUES (706,'WebGUI',3,'Uren',1031516049);
INSERT INTO international VALUES (705,'WebGUI',3,'Minuten',1031516049);
INSERT INTO international VALUES (704,'WebGUI',3,'Seconden',1031516049);
INSERT INTO international VALUES (703,'WebGUI',3,'Jaren',1031516049);
INSERT INTO international VALUES (702,'WebGUI',3,'Maanden',1031516049);
INSERT INTO international VALUES (7,'Product',3,'Product plaatje 1',1031516049);
INSERT INTO international VALUES (5,'WobjectProxy',3,'Wobject proxy, Toevoegen/aanpassen',1031516049);
INSERT INTO international VALUES (699,'WebGUI',3,'Eerste dag van de week',1031516049);
INSERT INTO international VALUES (696,'WebGUI',3,'Prullenbak, Legen',1031516049);
INSERT INTO international VALUES (697,'WebGUI',3,'Karma, Gebruiken',1031516049);
INSERT INTO international VALUES (686,'WebGUI',3,'Plaatjesgroep, Toevoegen',1031516049);
INSERT INTO international VALUES (685,'WebGUI',3,'Sjabloon, verwijderen',1031516049);
INSERT INTO international VALUES (684,'WebGUI',3,'Template, Toevoegen/aanpassen',1031516049);
INSERT INTO international VALUES (598,'WebGUI',3,'Taal aanpassen.',1031516049);
INSERT INTO international VALUES (596,'WebGUI',3,'NIET AANWEZIG',1031516049);
INSERT INTO international VALUES (605,'WebGUI',3,'Voeg groepen toe',1031516049);
INSERT INTO international VALUES (601,'WebGUI',3,'International ID',1031516049);
INSERT INTO international VALUES (597,'WebGUI',3,'Pas internationaal bericht aan',1031516049);
INSERT INTO international VALUES (594,'WebGUI',3,'Vertaal internationale berichten',1031516049);
INSERT INTO international VALUES (593,'WebGUI',3,'Verstuur vertaling naar Plain Black',1031516049);
INSERT INTO international VALUES (595,'WebGUI',3,'Internationale berichten',1031516049);
INSERT INTO international VALUES (591,'WebGUI',3,'Taal',1031516049);
INSERT INTO international VALUES (590,'WebGUI',3,'Taal ID',1031516049);
INSERT INTO international VALUES (589,'WebGUI',3,'Pas taal aan',1031516049);
INSERT INTO international VALUES (586,'WebGUI',3,'Talen',1031516049);
INSERT INTO international VALUES (584,'WebGUI',3,'Voeg een nieuwe taal toe',1031516049);
INSERT INTO international VALUES (575,'WebGUI',3,'Pas aan',1031516049);
INSERT INTO international VALUES (576,'WebGUI',3,'Verwijder',1031516049);
INSERT INTO international VALUES (582,'WebGUI',3,'Laat leeg',1031516049);
INSERT INTO international VALUES (683,'WebGUI',3,'Sjablonen, beheer',1031516049);
INSERT INTO international VALUES (682,'WebGUI',3,'Gebruikersprofiel, Aanpassen',1031516049);
INSERT INTO international VALUES (681,'WebGUI',3,'Pakketten, Maken',1031516049);
INSERT INTO international VALUES (680,'WebGUI',3,'Pakket, Toevoegen',1031516049);
INSERT INTO international VALUES (679,'WebGUI',3,'Inhoudsinstellingen, Aanpassen',1031516049);
INSERT INTO international VALUES (677,'WebGUI',3,'Wobject, Toevoegen/Aanpassen',1031516049);
INSERT INTO international VALUES (1,'MailForm',3,'E-mail formulier',1031516049);
INSERT INTO international VALUES (10,'MailForm',3,'Van',1031516049);
INSERT INTO international VALUES (11,'MailForm',3,'Aan (email, gebruikersnaam of groepsnaam)',1031516049);
INSERT INTO international VALUES (23,'MailForm',3,'Type',1031516049);
INSERT INTO international VALUES (13,'MailForm',3,'Bcc (Onzichtbare kopie naar)',1031516049);
INSERT INTO international VALUES (12,'MailForm',3,'Cc (Kopie naar)',1031516049);
INSERT INTO international VALUES (22,'MailForm',3,'Status',1031516049);
INSERT INTO international VALUES (21,'MailForm',3,'Veldnaam',1031516049);
INSERT INTO international VALUES (20,'MailForm',3,'Pas veld aan',1031516049);
INSERT INTO international VALUES (2,'MailForm',3,'Uw email onderwerp hier',1031516049);
INSERT INTO international VALUES (14,'MailForm',3,'Onderwerp',1031516049);
INSERT INTO international VALUES (15,'MailForm',3,'Doorgaan met meer velden toevoegen?',1031516049);
INSERT INTO international VALUES (18,'MailForm',3,'Ga terug!',1031516049);
INSERT INTO international VALUES (16,'MailForm',3,'Bevestigingsbericht',1031516049);
INSERT INTO international VALUES (17,'MailForm',3,'Mail is verstuurd',1031516049);
INSERT INTO international VALUES (19,'MailForm',3,'Weet u zeker dat u dit veld wilt verwijderen?',1031516049);
INSERT INTO international VALUES (61,'Article',3,'Artikel, Toevoegen/Aanpassen',1031516049);
INSERT INTO international VALUES (24,'MailForm',3,'Mogelijke waarden (alleen voor \'drop-down box\')',1031516049);
INSERT INTO international VALUES (25,'MailForm',3,'Standaard waarde (optioneel)',1031516049);
INSERT INTO international VALUES (7,'MailForm',3,'Pas email formulier aan',1031516049);
INSERT INTO international VALUES (6,'MailForm',3,'Aanpasbaar',1031516049);
INSERT INTO international VALUES (62,'MailForm',3,'Email formulier velden, toevoegen/aanpassen',1031516049);
INSERT INTO international VALUES (61,'MailForm',3,'Email formulier, toevoegen/aanpassen',1031516049);
INSERT INTO international VALUES (5,'MailForm',3,'Zichtbaar(niet aanpasbaar)',1031516049);
INSERT INTO international VALUES (4,'MailForm',3,'Verborgen',1031516049);
INSERT INTO international VALUES (26,'MailForm',3,'Inzendingen opslaan?',1031516049);
INSERT INTO international VALUES (3,'MailForm',3,'Bedankt voor uw bericht!',1031516049);
INSERT INTO international VALUES (588,'WebGUI',3,'Weet u zeker dat u deze vertaling naar Plain Black wilt versturen voor bundeling in de standaarddistributie? Door op de \'ja\' link te klikken snapt u dat u Plain Black een onbeperkte licentie geeft om de vertaling in haar software verspreidingen te gebruiken.',1031516049);
INSERT INTO international VALUES (581,'WebGUI',3,'Voeg een nieuwe waarde toe',1031516049);
INSERT INTO international VALUES (543,'WebGUI',3,'Voeg een nieuwe plaatjesgroep toe.',1031516049);
INSERT INTO international VALUES (583,'WebGUI',3,'Maximale plaatjesgrootte',1031516049);
INSERT INTO international VALUES (547,'WebGUI',3,'Ouder groep',1031516049);
INSERT INTO international VALUES (546,'WebGUI',3,'Groep Id',1031516049);
INSERT INTO international VALUES (542,'WebGUI',3,'Vorige..',1031516049);
INSERT INTO international VALUES (544,'WebGUI',3,'Weet u zeker dat u deze groep wilt verwijderen? ',1031516049);
INSERT INTO international VALUES (5,'USS',9,'�z���i�K�峹�Q�ڵ�',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',9,'�̫ᴣ���_',1031510000);
INSERT INTO international VALUES (5,'SQLReport',9,'DSN',1031510000);
INSERT INTO international VALUES (5,'SiteMap',9,'�s������a��',1031510000);
INSERT INTO international VALUES (5,'Poll',9,'�ϧμe��',1031510000);
INSERT INTO international VALUES (5,'MessageBoard',9,'�s��W��',1031510000);
INSERT INTO international VALUES (5,'LinkList',9,'�O�_����W�[�W�s��',1031510000);
INSERT INTO international VALUES (5,'Item',9,'�U������',1031510000);
INSERT INTO international VALUES (5,'FAQ',9,'���D',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',9,'Style Class',1031510000);
INSERT INTO international VALUES (5,'EventsCalendar',9,'��',1031510000);
INSERT INTO international VALUES (20,'EventsCalendar',9,'�W�[�ư�',1031510000);
INSERT INTO international VALUES (38,'USS',9,'(�p�G�z�ϥΤF�W�奻�y���A�п�ܡ��_ǵz)',1031510000);
INSERT INTO international VALUES (4,'WebGUI',9,'�޲z�]�m',1031510000);
INSERT INTO international VALUES (4,'USS',9,'�z���i�K�峹�w�q�L�f��',1031510000);
INSERT INTO international VALUES (4,'SyndicatedContent',9,'�s��P�B���e',1031510000);
INSERT INTO international VALUES (4,'SQLReport',9,'�d��',1031510000);
INSERT INTO international VALUES (4,'SiteMap',9,'�i�}�`��',1031510000);
INSERT INTO international VALUES (4,'Poll',9,'�벼�v��',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',9,'�C�����',1031510000);
INSERT INTO international VALUES (4,'LinkList',9,'�e��r��',1031510000);
INSERT INTO international VALUES (4,'Item',9,'����',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',9,'�e��',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',9,'�u�o�ͤ@��',1031510000);
INSERT INTO international VALUES (4,'Article',9,'�������',1031510000);
INSERT INTO international VALUES (3,'WebGUI',9,'�q�ŶK�O���߶K...',1031510000);
INSERT INTO international VALUES (3,'USS',9,'�z���@�g�s���ϥΪ̱i�K�峹���ݼf��',1031510000);
INSERT INTO international VALUES (3,'SQLReport',9,'���i�ҪO',1031510000);
INSERT INTO international VALUES (3,'SiteMap',9,'�O�_�q���ŧO�}�l',1031510000);
INSERT INTO international VALUES (3,'Poll',9,'�E��',1031510000);
INSERT INTO international VALUES (3,'MessageBoard',9,'�o���v��',1031510000);
INSERT INTO international VALUES (3,'LinkList',9,'�O�_�b�s���f�����}',1031510000);
INSERT INTO international VALUES (3,'Item',9,'�R������',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',9,'�ť�',1031510000);
INSERT INTO international VALUES (3,'Article',9,'�}�l���',1031510000);
INSERT INTO international VALUES (2,'WebGUI',9,'��',1031510000);
INSERT INTO international VALUES (2,'USS',9,'�i�K�峹�v��',1031510000);
INSERT INTO international VALUES (2,'SyndicatedContent',9,'�P�B���e',1031510000);
INSERT INTO international VALUES (2,'SiteMap',9,'�����a��',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',9,'���i��',1031510000);
INSERT INTO international VALUES (2,'LinkList',9,'�涡�Z',1031510000);
INSERT INTO international VALUES (2,'Item',9,'����',1031510000);
INSERT INTO international VALUES (2,'FAQ',9,'F.A.Q.',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',9,'��ƾ�',1031510000);
INSERT INTO international VALUES (507,'WebGUI',9,'�s��ҪO',1031510000);
INSERT INTO international VALUES (1,'WebGUI',9,'�W�[���e...',1031510000);
INSERT INTO international VALUES (1,'USS',9,'�f���v��',1031510000);
INSERT INTO international VALUES (1,'SyndicatedContent',9,'RSS ���W�s��',1031510000);
INSERT INTO international VALUES (1,'SQLReport',9,'SQL ���i',1031510000);
INSERT INTO international VALUES (1,'Poll',9,'�լd',1031510000);
INSERT INTO international VALUES (1,'LinkList',9,'�Y�i',1031510000);
INSERT INTO international VALUES (1,'Item',9,'�W�s�� URL',1031510000);
INSERT INTO international VALUES (72,'Item',1,'Template',1036267550);
INSERT INTO international VALUES (1,'ExtraColumn',9,'�X�i�C',1031510000);
INSERT INTO international VALUES (1,'EventsCalendar',9,'�O�_����W�[�ư�',1031510000);
INSERT INTO international VALUES (1,'Article',9,'�峹',1031510000);
INSERT INTO international VALUES (367,'WebGUI',9,'�L���ɶ�',1031510000);
INSERT INTO international VALUES (5,'WebGUI',9,'�޲z�ϥΪ̲�',1031510000);
INSERT INTO international VALUES (6,'Article',9,'�Ϥ�',1031510000);
INSERT INTO international VALUES (6,'EventsCalendar',9,'�P��',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',9,'�s���X�i�C',1031510000);
INSERT INTO international VALUES (6,'FAQ',9,'�^��',1031510000);
INSERT INTO international VALUES (6,'LinkList',9,'�W�s���C��',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',9,'�s�褽�i��',1031510000);
INSERT INTO international VALUES (6,'Poll',9,'���D',1031510000);
INSERT INTO international VALUES (6,'SiteMap',9,'�Y�i',1031510000);
INSERT INTO international VALUES (6,'SQLReport',9,'��Ʈw�ϥΪ�',1031510000);
INSERT INTO international VALUES (6,'SyndicatedContent',9,'���e���e',1031510000);
INSERT INTO international VALUES (6,'USS',9,'�C���i�K�峹��',1031510000);
INSERT INTO international VALUES (6,'WebGUI',9,'�޲zStyle',1031510000);
INSERT INTO international VALUES (7,'Article',9,'�s�����D',1031510000);
INSERT INTO international VALUES (7,'FAQ',9,'�z�O�_�T�w�z�n�R���o�Ӱ��D',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',9,'�@�̡G',1031510000);
INSERT INTO international VALUES (7,'Poll',9,'�^��',1031510000);
INSERT INTO international VALUES (7,'SiteMap',9,'�e��r��',1031510000);
INSERT INTO international VALUES (7,'SQLReport',9,'��Ʈw�K�X',1031510000);
INSERT INTO international VALUES (7,'USS',9,'�q�L',1031510000);
INSERT INTO international VALUES (7,'WebGUI',9,'�޲z�ϥΪ�',1031510000);
INSERT INTO international VALUES (8,'Article',9,'�W�s�� URL',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',9,'���ЩP��',1031510000);
INSERT INTO international VALUES (8,'FAQ',9,'�s�� F.A.Q.',1031510000);
INSERT INTO international VALUES (8,'LinkList',9,'URL',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',9,'����G',1031510000);
INSERT INTO international VALUES (8,'Poll',9,'�]�C���J�@�����סC�̦h���W�L20���C�^',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',9,'�峹 ID:',1031510000);
INSERT INTO international VALUES (11,'MessageBoard',9,'��^�峹�C��',1031510000);
INSERT INTO international VALUES (12,'MessageBoard',9,'�s��峹',1031510000);
INSERT INTO international VALUES (13,'MessageBoard',9,'�o���^��',1031510000);
INSERT INTO international VALUES (15,'MessageBoard',9,'�@��',1031510000);
INSERT INTO international VALUES (16,'MessageBoard',9,'���',1031510000);
INSERT INTO international VALUES (17,'MessageBoard',9,'�o���s�峹',1031510000);
INSERT INTO international VALUES (18,'MessageBoard',9,'�u���}�l',1031510000);
INSERT INTO international VALUES (19,'MessageBoard',9,'�^��',1031510000);
INSERT INTO international VALUES (20,'MessageBoard',9,'�̫�^��',1031510000);
INSERT INTO international VALUES (21,'MessageBoard',9,'�޲z�v��',1031510000);
INSERT INTO international VALUES (22,'MessageBoard',9,'�R���峹',1031510000);
INSERT INTO international VALUES (9,'Poll',9,'�s��լd',1031510000);
INSERT INTO international VALUES (10,'Poll',9,'��l�Ƨ벼',1031510000);
INSERT INTO international VALUES (11,'Poll',9,'�벼�I',1031510000);
INSERT INTO international VALUES (8,'SiteMap',9,'��Z',1031510000);
INSERT INTO international VALUES (8,'SQLReport',9,'Edit SQL Report',1031510000);
INSERT INTO international VALUES (8,'USS',9,'�Q�ڵ�',1031510000);
INSERT INTO international VALUES (8,'WebGUI',9,'�z�d�ݪ��������s�b',1031510000);
INSERT INTO international VALUES (9,'Article',9,'����',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',9,'����',1031510000);
INSERT INTO international VALUES (9,'FAQ',9,'�W�[�s���D',1031510000);
INSERT INTO international VALUES (9,'LinkList',9,'�z�O�_�T�w�n�R�����W�s��',1031510000);
INSERT INTO international VALUES (9,'SQLReport',9,'<b>Debug:</b> Error: The DSN specified is of an improper format.',1031510000);
INSERT INTO international VALUES (9,'USS',9,'�f�֤�',1031510000);
INSERT INTO international VALUES (9,'WebGUI',9,'�d�ݰŶK�O',1031510000);
INSERT INTO international VALUES (10,'Article',9,'�O�_�ഫ�^����',1031510000);
INSERT INTO international VALUES (10,'EventsCalendar',9,'�z�O�_�T�w�n�R�������ư�',1031510000);
INSERT INTO international VALUES (10,'FAQ',9,'�s����D',1031510000);
INSERT INTO international VALUES (10,'LinkList',9,'�s��W�s���C��',1031510000);
INSERT INTO international VALUES (10,'SQLReport',9,'<b>Debug:</b> Error: The SQL specified is of an improper format.',1031510000);
INSERT INTO international VALUES (10,'USS',9,'�q�{���A',1031510000);
INSERT INTO international VALUES (10,'WebGUI',9,'�޲z�U����',1031510000);
INSERT INTO international VALUES (11,'Article',9,'(�p�G�z�S����ʿ�J&lt;br&gt;�A�п�ܡ��O\")',1031510000);
INSERT INTO international VALUES (11,'EventsCalendar',9,'<b>�M</b>�Ҧ������ư�',1031510000);
INSERT INTO international VALUES (11,'SQLReport',9,'<b>Debug:</b> Error: There was a problem with the query.',1031510000);
INSERT INTO international VALUES (11,'WebGUI',9,'�M�ũU����',1031510000);
INSERT INTO international VALUES (12,'Article',9,'�s��峹',1031510000);
INSERT INTO international VALUES (12,'EventsCalendar',9,'�s���ƾ�',1031510000);
INSERT INTO international VALUES (12,'LinkList',9,'�s��W�s��',1031510000);
INSERT INTO international VALUES (12,'SQLReport',9,'<b>Debug:</b> Error: Could not connect to the database.',1031510000);
INSERT INTO international VALUES (12,'USS',9,'(�p�G�z�ϥΤF�W�奻�y���A�Ф��n��ܦ���)',1031510000);
INSERT INTO international VALUES (12,'WebGUI',9,'�h�X�޲z',1031510000);
INSERT INTO international VALUES (13,'Article',9,'�R��',1031510000);
INSERT INTO international VALUES (13,'EventsCalendar',9,'�s��ư�',1031510000);
INSERT INTO international VALUES (13,'LinkList',9,'�W�[�s�W�s��',1031510000);
INSERT INTO international VALUES (13,'USS',9,'�i�K�峹�ɶ�',1031510000);
INSERT INTO international VALUES (13,'WebGUI',9,'�d�����U����',1031510000);
INSERT INTO international VALUES (14,'Article',9,'�Ϥ���m',1031510000);
INSERT INTO international VALUES (516,'WebGUI',9,'�i�J�޲z',1031510000);
INSERT INTO international VALUES (517,'WebGUI',9,'�h�X�޲z',1031510000);
INSERT INTO international VALUES (515,'WebGUI',9,'�O�_�W�[�s���W',1031510000);
INSERT INTO international VALUES (14,'USS',9,'���A',1031510000);
INSERT INTO international VALUES (14,'WebGUI',9,'�d�ݵ��ݼf�֪��i�K�峹',1031510000);
INSERT INTO international VALUES (15,'USS',9,'�s��/�R��',1031510000);
INSERT INTO international VALUES (15,'WebGUI',9,'�@��',1031510000);
INSERT INTO international VALUES (16,'USS',9,'�L���D',1031510000);
INSERT INTO international VALUES (16,'WebGUI',9,'�G��',1031510000);
INSERT INTO international VALUES (17,'USS',9,'�z�T�w�n�R�����Z���',1031510000);
INSERT INTO international VALUES (17,'WebGUI',9,'�T��',1031510000);
INSERT INTO international VALUES (18,'USS',9,'�s��ϥΪ̱i�K�峹�t��',1031510000);
INSERT INTO international VALUES (18,'WebGUI',9,'�|��',1031510000);
INSERT INTO international VALUES (19,'USS',9,'�s��i�K�峹',1031510000);
INSERT INTO international VALUES (19,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (20,'USS',9,'�ڭn�i�K�峹',1031510000);
INSERT INTO international VALUES (20,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (21,'USS',9,'�o���H',1031510000);
INSERT INTO international VALUES (21,'WebGUI',9,'�C��',1031510000);
INSERT INTO international VALUES (22,'WebGUI',9,'�K��',1031510000);
INSERT INTO international VALUES (23,'WebGUI',9,'�E��',1031510000);
INSERT INTO international VALUES (24,'USS',9,'�q�L',1031510000);
INSERT INTO international VALUES (24,'WebGUI',9,'�Q��',1031510000);
INSERT INTO international VALUES (25,'USS',9,'�~��f��',1031510000);
INSERT INTO international VALUES (25,'WebGUI',9,'�Q�@��',1031510000);
INSERT INTO international VALUES (26,'USS',9,'�ڵ�',1031510000);
INSERT INTO international VALUES (26,'WebGUI',9,'�Q�G��',1031510000);
INSERT INTO international VALUES (27,'USS',9,'�s��',1031510000);
INSERT INTO international VALUES (27,'WebGUI',9,'�P����',1031510000);
INSERT INTO international VALUES (28,'USS',9,'��^�Z��C��',1031510000);
INSERT INTO international VALUES (28,'WebGUI',9,'�P���@',1031510000);
INSERT INTO international VALUES (29,'USS',9,'�ϥΪ̱i�K�峹�t��',1031510000);
INSERT INTO international VALUES (29,'WebGUI',9,'�P���G',1031510000);
INSERT INTO international VALUES (30,'WebGUI',9,'�P���T',1031510000);
INSERT INTO international VALUES (31,'WebGUI',9,'�P���|',1031510000);
INSERT INTO international VALUES (32,'WebGUI',9,'�P����',1031510000);
INSERT INTO international VALUES (33,'WebGUI',9,'�P����',1031510000);
INSERT INTO international VALUES (34,'WebGUI',9,'�]�m���',1031510000);
INSERT INTO international VALUES (35,'WebGUI',9,'�޲z���',1031510000);
INSERT INTO international VALUES (36,'WebGUI',9,'�z�����O�t�κ޲z���~��ϥΦ����C���p�t�z���t�κ޲z���C�H�U�O���t�Ϊ��t�κ޲z���M��G',1031510000);
INSERT INTO international VALUES (37,'WebGUI',9,'�v���Q�ڵ��I',1031510000);
INSERT INTO international VALUES (404,'WebGUI',9,'�Ĥ@��',1031510000);
INSERT INTO international VALUES (38,'WebGUI',9,'�z�S���������v�����榹���ާ@�C��^a(�n��);�M��A�դ@��',1031510000);
INSERT INTO international VALUES (39,'WebGUI',9,'�藍�_�A�z�S���������v���X�ݤ@��',1031510000);
INSERT INTO international VALUES (40,'WebGUI',9,'�t�βե�',1031510000);
INSERT INTO international VALUES (41,'WebGUI',9,'�z�N�n�R���@�Өt�βե�C�p�G�z�~��A�t�Υ��i��|����v�T',1031510000);
INSERT INTO international VALUES (42,'WebGUI',9,'�нT�{',1031510000);
INSERT INTO international VALUES (43,'WebGUI',9,'�z�O�_�T�w�n�R�������e��',1031510000);
INSERT INTO international VALUES (44,'WebGUI',9,'�O���A�ڽT�w',1031510000);
INSERT INTO international VALUES (45,'WebGUI',9,'���A�ګ����F',1031510000);
INSERT INTO international VALUES (46,'WebGUI',9,'�ڪ��b��',1031510000);
INSERT INTO international VALUES (47,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (48,'WebGUI',9,'�w��I',1031510000);
INSERT INTO international VALUES (49,'WebGUI',9,'�I�� <a href=\"^;?op=logout\">���B</a> �h�X�n��',1031510000);
INSERT INTO international VALUES (50,'WebGUI',9,'�b��',1031510000);
INSERT INTO international VALUES (51,'WebGUI',9,'�K�X',1031510000);
INSERT INTO international VALUES (52,'WebGUI',9,'�n��',1031510000);
INSERT INTO international VALUES (53,'WebGUI',9,'���L����',1031510000);
INSERT INTO international VALUES (54,'WebGUI',9,'�s�رb��',1031510000);
INSERT INTO international VALUES (55,'WebGUI',9,'�K�X�]�T�{�^',1031510000);
INSERT INTO international VALUES (56,'WebGUI',9,'�q�l�l��',1031510000);
INSERT INTO international VALUES (57,'WebGUI',9,'�����u�b�z�Ʊ�ϥΨ�ݭn�q�l�l�󪺥�઺�ɭԦ���',1031510000);
INSERT INTO international VALUES (58,'WebGUI',9,'�ڤw�g���F�@�ӱb��',1031510000);
INSERT INTO international VALUES (59,'WebGUI',9,'�ڧѰO�F�K�X',1031510000);
INSERT INTO international VALUES (60,'WebGUI',9,'�z�O�_�u���Ʊ���P�z���b��H�p�G�z�~��A�z���b���T�N�Q�ä[�R��',1031510000);
INSERT INTO international VALUES (61,'WebGUI',9,'��s�b���T',1031510000);
INSERT INTO international VALUES (62,'WebGUI',9,'�O�s',1031510000);
INSERT INTO international VALUES (63,'WebGUI',9,'�i�J�޲z',1031510000);
INSERT INTO international VALUES (64,'WebGUI',9,'�h�X�n��',1031510000);
INSERT INTO international VALUES (65,'WebGUI',9,'�ЧR���ڪ��b��',1031510000);
INSERT INTO international VALUES (66,'WebGUI',9,'�ϥΪ̵n��',1031510000);
INSERT INTO international VALUES (67,'WebGUI',9,'�Ыطs�b��',1031510000);
INSERT INTO international VALUES (68,'WebGUI',9,'�z��J���b���T�L�ġC�i��O�z��J���b�ᤣ�s�b�A�ο�J�F���~���K�X',1031510000);
INSERT INTO international VALUES (69,'WebGUI',9,'�p�G�z�ݭn��U�A���p�t�t�κ޲z��',1031510000);
INSERT INTO international VALUES (70,'WebGUI',9,'���~',1031510000);
INSERT INTO international VALUES (71,'WebGUI',9,'���бK�X',1031510000);
INSERT INTO international VALUES (72,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (73,'WebGUI',9,'�ϥΪ̵n��',1031510000);
INSERT INTO international VALUES (74,'WebGUI',9,'�b���T',1031510000);
INSERT INTO international VALUES (75,'WebGUI',9,'�z���b���T�w�g�o�e��z���q�l�l��',1031510000);
INSERT INTO international VALUES (76,'WebGUI',9,'�藍�_�A���q�l�l��a�}���b�t�θ�Ʈw��',1031510000);
INSERT INTO international VALUES (77,'WebGUI',9,'�藍�_�A���b��W�w�Q��L�ϥΪ̨ϥΡC�Хt�~��ܤ@�ӨϥΪ̦W�C�ڭ̫�ĳ�z�ϥΥH�U�W�r�@���n���W�G',1031510000);
INSERT INTO international VALUES (78,'WebGUI',9,'�z��J���K�X���@�P�A�Э��s��J',1031510000);
INSERT INTO international VALUES (79,'WebGUI',9,'����s����ؿ��A�Ⱦ�',1031510000);
INSERT INTO international VALUES (80,'WebGUI',9,'�Ыرb�ᦨ��I',1031510000);
INSERT INTO international VALUES (81,'WebGUI',9,'��s�b�ᦨ��I',1031510000);
INSERT INTO international VALUES (82,'WebGUI',9,'�޲z���...',1031510000);
INSERT INTO international VALUES (536,'WebGUI',9,'�s�ϥΪ� ^@; ��[�J����',1031510000);
INSERT INTO international VALUES (84,'WebGUI',9,'�ϥΪ̲�',1031510000);
INSERT INTO international VALUES (85,'WebGUI',9,'�y�z',1031510000);
INSERT INTO international VALUES (86,'WebGUI',9,'�z�T�w�n�R�����ϥΪ̲նܡH�����ާ@�N�ä[�R�����ϥΪ̲աA�}�������ϥΪ̲թҦ������v��',1031510000);
INSERT INTO international VALUES (87,'WebGUI',9,'�s��ϥΪ̲�',1031510000);
INSERT INTO international VALUES (88,'WebGUI',9,'�ϥΪ̲զ���',1031510000);
INSERT INTO international VALUES (89,'WebGUI',9,'�ϥΪ̲�',1031510000);
INSERT INTO international VALUES (90,'WebGUI',9,'�W�[�s��',1031510000);
INSERT INTO international VALUES (91,'WebGUI',9,'�W�@��',1031510000);
INSERT INTO international VALUES (92,'WebGUI',9,'�U�@��',1031510000);
INSERT INTO international VALUES (93,'WebGUI',9,'���U',1031510000);
INSERT INTO international VALUES (94,'WebGUI',9,'�Ѧ�',1031510000);
INSERT INTO international VALUES (95,'WebGUI',9,'���U����',1031510000);
INSERT INTO international VALUES (99,'WebGUI',9,'���D',1031510000);
INSERT INTO international VALUES (100,'WebGUI',9,'Meta ����',1031510000);
INSERT INTO international VALUES (101,'WebGUI',9,'�z�T�w�n�R���������H�έ��������Ҧ����e�M�ե��',1031510000);
INSERT INTO international VALUES (102,'WebGUI',9,'�s�譶��',1031510000);
INSERT INTO international VALUES (103,'WebGUI',9,'�����y�z',1031510000);
INSERT INTO international VALUES (104,'WebGUI',9,'���� URL',1031510000);
INSERT INTO international VALUES (105,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (106,'WebGUI',9,'Select \"Yes\" to change all the pages under this page to this style.',1031510000);
INSERT INTO international VALUES (107,'WebGUI',9,'�v���]�m',1031510000);
INSERT INTO international VALUES (108,'WebGUI',9,'�֦���',1031510000);
INSERT INTO international VALUES (109,'WebGUI',9,'�֦��̳X���v��',1031510000);
INSERT INTO international VALUES (110,'WebGUI',9,'�֦��̽s���v��',1031510000);
INSERT INTO international VALUES (111,'WebGUI',9,'�ϥΪ̲�',1031510000);
INSERT INTO international VALUES (112,'WebGUI',9,'�ϥΪ̲ճX���v��',1031510000);
INSERT INTO international VALUES (113,'WebGUI',9,'�ϥΪ̲սs���v��',1031510000);
INSERT INTO international VALUES (114,'WebGUI',9,'����H�i�X��',1031510000);
INSERT INTO international VALUES (115,'WebGUI',9,'����H�i�s��',1031510000);
INSERT INTO international VALUES (116,'WebGUI',9,'Select \"Yes\" to change the privileges of all pages under this page to these privileges.',1031510000);
INSERT INTO international VALUES (117,'WebGUI',9,'�s��ϥΪ̳]�m',1031510000);
INSERT INTO international VALUES (118,'WebGUI',9,'�ΦW�ϥΪ̵��U',1031510000);
INSERT INTO international VALUES (119,'WebGUI',9,'�q�{�ϥΪ̻{���覡',1031510000);
INSERT INTO international VALUES (120,'WebGUI',9,'�q�{ LDAP URL',1031510000);
INSERT INTO international VALUES (121,'WebGUI',9,'�q�{ LDAP Identity',1031510000);
INSERT INTO international VALUES (122,'WebGUI',9,'LDAP Identity �W',1031510000);
INSERT INTO international VALUES (123,'WebGUI',9,'LDAP Password �W',1031510000);
INSERT INTO international VALUES (124,'WebGUI',9,'�s�褽�q��T',1031510000);
INSERT INTO international VALUES (125,'WebGUI',9,'���q�W',1031510000);
INSERT INTO international VALUES (126,'WebGUI',9,'���q�q�l�l��a�}',1031510000);
INSERT INTO international VALUES (127,'WebGUI',9,'���q�W�s��',1031510000);
INSERT INTO international VALUES (130,'WebGUI',9,'�̤j����j�p',1031510000);
INSERT INTO international VALUES (133,'WebGUI',9,'�s��l��]�m',1031510000);
INSERT INTO international VALUES (134,'WebGUI',9,'���бK�X�l�󤺮e',1031510000);
INSERT INTO international VALUES (135,'WebGUI',9,'�l��A�Ⱦ�',1031510000);
INSERT INTO international VALUES (138,'WebGUI',9,'�O',1031510000);
INSERT INTO international VALUES (139,'WebGUI',9,'�_',1031510000);
INSERT INTO international VALUES (140,'WebGUI',9,'�s��@��]�m',1031510000);
INSERT INTO international VALUES (141,'WebGUI',9,'�q�{����쭶��',1031510000);
INSERT INTO international VALUES (142,'WebGUI',9,'��ܶW��',1031510000);
INSERT INTO international VALUES (143,'WebGUI',9,'�޲z�]�m',1031510000);
INSERT INTO international VALUES (144,'WebGUI',9,'�d�ݲέp��T',1031510000);
INSERT INTO international VALUES (145,'WebGUI',9,'�t�Ϊ���',1031510000);
INSERT INTO international VALUES (146,'WebGUI',9,'���ʹ��',1031510000);
INSERT INTO international VALUES (147,'WebGUI',9,'������',1031510000);
INSERT INTO international VALUES (148,'WebGUI',9,'�ե��',1031510000);
INSERT INTO international VALUES (149,'WebGUI',9,'�ϥΪ̼�',1031510000);
INSERT INTO international VALUES (533,'WebGUI',9,'<b>���]�A</b>�j���r',1031510000);
INSERT INTO international VALUES (532,'WebGUI',9,'�]�A<b>�ܤ֤@��</b>�j���r',1031510000);
INSERT INTO international VALUES (151,'WebGUI',9,'����W',1031510000);
INSERT INTO international VALUES (505,'WebGUI',9,'�W�[�@�ӷs�ҪO',1031510000);
INSERT INTO international VALUES (504,'WebGUI',9,'�ҪO',1031510000);
INSERT INTO international VALUES (502,'WebGUI',9,'�z�T�w�n�R�����ҪO�A�}�N�Ҧ��ϥΦ��ҪO�������]���q�{�ҪO',1031510000);
INSERT INTO international VALUES (154,'WebGUI',9,'�����',1031510000);
INSERT INTO international VALUES (155,'WebGUI',9,'�z�T�w�n�R������������A�}�N�Ҧ��ϥΦ����檺��������]�����w���Ҧ�ǽ�q��A',1031510000);
INSERT INTO international VALUES (156,'WebGUI',9,'�s�護��',1031510000);
INSERT INTO international VALUES (157,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (158,'WebGUI',9,'�W�[�s����',1031510000);
INSERT INTO international VALUES (160,'WebGUI',9,'������',1031510000);
INSERT INTO international VALUES (161,'WebGUI',9,'����H',1031510000);
INSERT INTO international VALUES (162,'WebGUI',9,'�z�O�_�T�w�n�M�ũU�������Ҧ������M�ե��',1031510000);
INSERT INTO international VALUES (163,'WebGUI',9,'�W�[�ϥΪ�',1031510000);
INSERT INTO international VALUES (164,'WebGUI',9,'�ϥΪ̻{���覡',1031510000);
INSERT INTO international VALUES (165,'WebGUI',9,'LDAP URL',1031510000);
INSERT INTO international VALUES (166,'WebGUI',9,'�s�� DN',1031510000);
INSERT INTO international VALUES (167,'WebGUI',9,'�z�O�_�T�w�n�R�����ϥΪ̶ܡH�`�N�R���ϥΪ̱N�ä[�R���ӨϥΪ̪��Ҧ���T',1031510000);
INSERT INTO international VALUES (168,'WebGUI',9,'�s��ϥΪ�',1031510000);
INSERT INTO international VALUES (169,'WebGUI',9,'�W�[�s�ϥΪ�',1031510000);
INSERT INTO international VALUES (170,'WebGUI',9,'�j��',1031510000);
INSERT INTO international VALUES (171,'WebGUI',9,'�i���ƽs��',1031510000);
INSERT INTO international VALUES (174,'WebGUI',9,'�O�_��ܼ��D',1031510000);
INSERT INTO international VALUES (175,'WebGUI',9,'�O�_���槻�R�O',1031510000);
INSERT INTO international VALUES (228,'WebGUI',9,'�s�����...',1031510000);
INSERT INTO international VALUES (229,'WebGUI',9,'���D',1031510000);
INSERT INTO international VALUES (230,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (231,'WebGUI',9,'�o���s����...',1031510000);
INSERT INTO international VALUES (232,'WebGUI',9,'�L���D',1031510000);
INSERT INTO international VALUES (233,'WebGUI',9,'(eom)',1031510000);
INSERT INTO international VALUES (234,'WebGUI',9,'�o���^��...',1031510000);
INSERT INTO international VALUES (237,'WebGUI',9,'���D�G',1031510000);
INSERT INTO international VALUES (238,'WebGUI',9,'�@�̡G',1031510000);
INSERT INTO international VALUES (239,'WebGUI',9,'����G',1031510000);
INSERT INTO international VALUES (240,'WebGUI',9,'���� ID:',1031510000);
INSERT INTO international VALUES (244,'WebGUI',9,'�@��',1031510000);
INSERT INTO international VALUES (245,'WebGUI',9,'���',1031510000);
INSERT INTO international VALUES (304,'WebGUI',9,'�y��',1031510000);
INSERT INTO international VALUES (306,'WebGUI',9,'�ϥΪ̦W�j�w',1031510000);
INSERT INTO international VALUES (307,'WebGUI',9,'�O�_�ϥ��q�{ meta ����',1031510000);
INSERT INTO international VALUES (308,'WebGUI',9,'�s��ϥΪ��ݩʳ]�m',1031510000);
INSERT INTO international VALUES (309,'WebGUI',9,'�O�_����ϥίu��m�W',1031510000);
INSERT INTO international VALUES (310,'WebGUI',9,'�O�_����ϥ��X�i�p�t��T',1031510000);
INSERT INTO international VALUES (311,'WebGUI',9,'�O�_����ϥήa�x��T',1031510000);
INSERT INTO international VALUES (312,'WebGUI',9,'�O�_����ϥΰӷ~��T',1031510000);
INSERT INTO international VALUES (313,'WebGUI',9,'�O�_����ϥΨ�L��T',1031510000);
INSERT INTO international VALUES (314,'WebGUI',9,'�m',1031510000);
INSERT INTO international VALUES (315,'WebGUI',9,'�����W',1031510000);
INSERT INTO international VALUES (316,'WebGUI',9,'�W',1031510000);
INSERT INTO international VALUES (317,'WebGUI',9,'<a href=\"http://www.icq.com\">ICQ</a> UIN',1031510000);
INSERT INTO international VALUES (318,'WebGUI',9,'<a href=\"http://www.aol.com/aim/homenew.adp\">AIM</a> ID',1031510000);
INSERT INTO international VALUES (319,'WebGUI',9,'<a href=\"http://messenger.msn.com/\">MSN Messenger</a> ID',1031510000);
INSERT INTO international VALUES (320,'WebGUI',9,'<a href=\"http://messenger.yahoo.com/\">Yahoo! Messenger</a> ID',1031510000);
INSERT INTO international VALUES (321,'WebGUI',9,'���ʹq��',1031510000);
INSERT INTO international VALUES (322,'WebGUI',9,'�ǩI',1031510000);
INSERT INTO international VALUES (323,'WebGUI',9,'�a�x���}',1031510000);
INSERT INTO international VALUES (324,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (325,'WebGUI',9,'�٥�',1031510000);
INSERT INTO international VALUES (326,'WebGUI',9,'�l�F�s�X',1031510000);
INSERT INTO international VALUES (327,'WebGUI',9,'��a',1031510000);
INSERT INTO international VALUES (328,'WebGUI',9,'���v�q��',1031510000);
INSERT INTO international VALUES (329,'WebGUI',9,'���a�}',1031510000);
INSERT INTO international VALUES (330,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (331,'WebGUI',9,'�٥�',1031510000);
INSERT INTO international VALUES (332,'WebGUI',9,'�l�F�s�X',1031510000);
INSERT INTO international VALUES (333,'WebGUI',9,'��a',1031510000);
INSERT INTO international VALUES (334,'WebGUI',9,'���q��',1031510000);
INSERT INTO international VALUES (335,'WebGUI',9,'�ʧO',1031510000);
INSERT INTO international VALUES (336,'WebGUI',9,'�ͤ�',1031510000);
INSERT INTO international VALUES (337,'WebGUI',9,'�ӤH����',1031510000);
INSERT INTO international VALUES (338,'WebGUI',9,'�s��ϥΪ��ݩ�',1031510000);
INSERT INTO international VALUES (339,'WebGUI',9,'�k',1031510000);
INSERT INTO international VALUES (340,'WebGUI',9,'�k',1031510000);
INSERT INTO international VALUES (341,'WebGUI',9,'�s��ϥΪ��ݩ�',1031510000);
INSERT INTO international VALUES (342,'WebGUI',9,'�s��b���T',1031510000);
INSERT INTO international VALUES (343,'WebGUI',9,'�d�ݨϥΪ��ݩ�',1031510000);
INSERT INTO international VALUES (351,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (345,'WebGUI',9,'���O�����ϥΪ�',1031510000);
INSERT INTO international VALUES (346,'WebGUI',9,'���ϥΪ̤��A�O�����ϥΪ̡C�L�k���Ѧ��ϥΪ̪���h��T',1031510000);
INSERT INTO international VALUES (347,'WebGUI',9,'�d�ݨϥΪ��ݩʡG',1031510000);
INSERT INTO international VALUES (348,'WebGUI',9,'�m�W',1031510000);
INSERT INTO international VALUES (349,'WebGUI',9,'�̷s����',1031510000);
INSERT INTO international VALUES (350,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (352,'WebGUI',9,'�o�X���',1031510000);
INSERT INTO international VALUES (471,'WebGUI',9,'�s��ϥΪ��ݩʶ�',1031510000);
INSERT INTO international VALUES (355,'WebGUI',9,'�q�{',1031510000);
INSERT INTO international VALUES (356,'WebGUI',9,'�ҪO',1031510000);
INSERT INTO international VALUES (357,'WebGUI',9,'�s�D',1031510000);
INSERT INTO international VALUES (358,'WebGUI',9,'���ɯ�',1031510000);
INSERT INTO international VALUES (359,'WebGUI',9,'�k�ɯ�',1031510000);
INSERT INTO international VALUES (360,'WebGUI',9,'�@�[�T',1031510000);
INSERT INTO international VALUES (361,'WebGUI',9,'�T�[�@',1031510000);
INSERT INTO international VALUES (362,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (363,'WebGUI',9,'�ҪO�w��',1031510000);
INSERT INTO international VALUES (364,'WebGUI',9,'�j��',1031510000);
INSERT INTO international VALUES (365,'WebGUI',9,'�j�����G...',1031510000);
INSERT INTO international VALUES (366,'WebGUI',9,'�S�����ŦX�j�����󪺭���',1031510000);
INSERT INTO international VALUES (368,'WebGUI',9,'�N���ϥΪ̥[�J�s�ϥΪ̲�',1031510000);
INSERT INTO international VALUES (369,'WebGUI',9,'�L�����',1031510000);
INSERT INTO international VALUES (370,'WebGUI',9,'�s��ϥΪ̤���',1031510000);
INSERT INTO international VALUES (371,'WebGUI',9,'�W�[�ϥΪ̤���',1031510000);
INSERT INTO international VALUES (372,'WebGUI',9,'�s��ϥΪ̩��ݲոs',1031510000);
INSERT INTO international VALUES (605,'WebGUI',9,'�s�W�s��',1031510000);
INSERT INTO international VALUES (374,'WebGUI',9,'�޲z�]�q',1031510000);
INSERT INTO international VALUES (375,'WebGUI',9,'��ܭn�i�}���]�q',1031510000);
INSERT INTO international VALUES (376,'WebGUI',9,'�]�q',1031510000);
INSERT INTO international VALUES (377,'WebGUI',9,'�]�q�޲z���Ψt�κ޲z���S���w�q�]�q',1031510000);
INSERT INTO international VALUES (31,'USS',9,'���e',1031510000);
INSERT INTO international VALUES (32,'USS',9,'�Ϥ�',1031510000);
INSERT INTO international VALUES (33,'USS',9,'����',1031510000);
INSERT INTO international VALUES (34,'USS',9,'�ഫ�^��',1031510000);
INSERT INTO international VALUES (35,'USS',9,'���D',1031510000);
INSERT INTO international VALUES (21,'EventsCalendar',9,'�O�_����W�[�ư�',1031510000);
INSERT INTO international VALUES (378,'WebGUI',9,'�ϥΪ� ID',1031510000);
INSERT INTO international VALUES (379,'WebGUI',9,'�ϥΪ̲� ID',1031510000);
INSERT INTO international VALUES (380,'WebGUI',9,'���� ID',1031510000);
INSERT INTO international VALUES (381,'WebGUI',9,'�t�Φ���@�ӵL�Ī�����ШD�A�L�k�~��C���q�L�����J�F�@�ǫD�k�r�šA�q�`�|�ɭP�o�ӵ��G�C�Ы��s��������^���ê�^�W�����s��J',1031510000);
INSERT INTO international VALUES (1,'FileManager',9,'�U���޲z',1031510000);
INSERT INTO international VALUES (3,'FileManager',9,'�O�_����W�[���',1031510000);
INSERT INTO international VALUES (5,'FileManager',9,'�����D',1031510000);
INSERT INTO international VALUES (6,'FileManager',9,'�U�����',1031510000);
INSERT INTO international VALUES (7,'FileManager',9,'�U���ϥΪ̲�',1031510000);
INSERT INTO international VALUES (8,'FileManager',9,'²��',1031510000);
INSERT INTO international VALUES (9,'FileManager',9,'�s��U���޲z��',1031510000);
INSERT INTO international VALUES (10,'FileManager',9,'�s��U��',1031510000);
INSERT INTO international VALUES (11,'FileManager',9,'�W�[�s�U��',1031510000);
INSERT INTO international VALUES (12,'FileManager',9,'�z�O�_�T�w�n�R�����U������',1031510000);
INSERT INTO international VALUES (22,'FileManager',9,'�O�_����W�[�U��',1031510000);
INSERT INTO international VALUES (14,'FileManager',9,'���',1031510000);
INSERT INTO international VALUES (15,'FileManager',9,'�y�z',1031510000);
INSERT INTO international VALUES (16,'FileManager',9,'�W�����',1031510000);
INSERT INTO international VALUES (15,'Article',9,'�a�k',1031510000);
INSERT INTO international VALUES (16,'Article',9,'�a��',1031510000);
INSERT INTO international VALUES (17,'Article',9,'�~��',1031510000);
INSERT INTO international VALUES (37,'USS',9,'�R��',1031510000);
INSERT INTO international VALUES (13,'SQLReport',9,'Convert carriage returns?',1031510000);
INSERT INTO international VALUES (17,'FileManager',9,'��L���� #1',1031510000);
INSERT INTO international VALUES (18,'FileManager',9,'��L���� #2',1031510000);
INSERT INTO international VALUES (19,'FileManager',9,'�S���z�i�H�U�������',1031510000);
INSERT INTO international VALUES (14,'EventsCalendar',9,'�}�l���',1031510000);
INSERT INTO international VALUES (15,'EventsCalendar',9,'�������',1031510000);
INSERT INTO international VALUES (20,'FileManager',9,'�b�᭱�Ъ`���X',1031510000);
INSERT INTO international VALUES (14,'SQLReport',9,'Paginate After',1031510000);
INSERT INTO international VALUES (16,'EventsCalendar',9,'��ƾ䥬��',1031510000);
INSERT INTO international VALUES (17,'EventsCalendar',9,'�C���覡',1031510000);
INSERT INTO international VALUES (18,'EventsCalendar',9,'����覡',1031510000);
INSERT INTO international VALUES (19,'EventsCalendar',9,'�b�᭱�Ъ`���X',1031510000);
INSERT INTO international VALUES (529,'WebGUI',9,'���G',1031510000);
INSERT INTO international VALUES (383,'WebGUI',9,'�W�r',1031510000);
INSERT INTO international VALUES (384,'WebGUI',9,'���',1031510000);
INSERT INTO international VALUES (385,'WebGUI',9,'�Ѽ�',1031510000);
INSERT INTO international VALUES (386,'WebGUI',9,'�s��Ϥ�',1031510000);
INSERT INTO international VALUES (387,'WebGUI',9,'�W���H',1031510000);
INSERT INTO international VALUES (388,'WebGUI',9,'�W�����',1031510000);
INSERT INTO international VALUES (389,'WebGUI',9,'�Ϥ� ID',1031510000);
INSERT INTO international VALUES (390,'WebGUI',9,'��ܹϤ�...',1031510000);
INSERT INTO international VALUES (391,'WebGUI',9,'�R�����[���',1031510000);
INSERT INTO international VALUES (392,'WebGUI',9,'�z�T�w�n�R�����Ϥ���',1031510000);
INSERT INTO international VALUES (393,'WebGUI',9,'�޲z�Ϥ�',1031510000);
INSERT INTO international VALUES (394,'WebGUI',9,'�޲z�Ϥ�',1031510000);
INSERT INTO international VALUES (395,'WebGUI',9,'�W�[�s�Ϥ�',1031510000);
INSERT INTO international VALUES (396,'WebGUI',9,'�d�ݹϤ�',1031510000);
INSERT INTO international VALUES (397,'WebGUI',9,'��^�Ϥ��C��',1031510000);
INSERT INTO international VALUES (398,'WebGUI',9,'���������w�q',1031510000);
INSERT INTO international VALUES (399,'WebGUI',9,'���R������',1031510000);
INSERT INTO international VALUES (400,'WebGUI',9,'�O�_����N�z�w�s',1031510000);
INSERT INTO international VALUES (401,'WebGUI',9,'�z�O�_�T�w�n�R�����������H�Φ����������Ҧ��u��',1031510000);
INSERT INTO international VALUES (402,'WebGUI',9,'�z�n�Ū���������s�b',1031510000);
INSERT INTO international VALUES (403,'WebGUI',9,'���i�D�A',1031510000);
INSERT INTO international VALUES (405,'WebGUI',9,'�̫�@��',1031510000);
INSERT INTO international VALUES (406,'WebGUI',9,'�ַӤj�p',1031510000);
INSERT INTO international VALUES (21,'FileManager',9,'��ܧַ�',1031510000);
INSERT INTO international VALUES (407,'WebGUI',9,'�I�����B���U',1031510000);
INSERT INTO international VALUES (15,'SQLReport',9,'Preprocess macros on query?',1031510000);
INSERT INTO international VALUES (16,'SQLReport',9,'Debug?',1031510000);
INSERT INTO international VALUES (17,'SQLReport',9,'<b>Debug:</b> Query:',1031510000);
INSERT INTO international VALUES (18,'SQLReport',9,'There were no results for this query.',1031510000);
INSERT INTO international VALUES (506,'WebGUI',9,'�޲z�ҪO',1031510000);
INSERT INTO international VALUES (535,'WebGUI',9,'���s�ϥΪ̵��U�ɳq���ϥΪ̲�',1031510000);
INSERT INTO international VALUES (353,'WebGUI',9,'�{�b�z������c���S������',1031510000);
INSERT INTO international VALUES (530,'WebGUI',9,'�j��<b>�Ҧ�</b>����r',1031510000);
INSERT INTO international VALUES (408,'WebGUI',9,'�޲z�ڭ���',1031510000);
INSERT INTO international VALUES (409,'WebGUI',9,'�W�[�s�ڭ���',1031510000);
INSERT INTO international VALUES (410,'WebGUI',9,'�޲z�ڭ���',1031510000);
INSERT INTO international VALUES (411,'WebGUI',9,'�ؿ����D',1031510000);
INSERT INTO international VALUES (412,'WebGUI',9,'�����y�z',1031510000);
INSERT INTO international VALUES (9,'SiteMap',9,'���²��',1031510000);
INSERT INTO international VALUES (18,'Article',9,'�O�_����Q��',1031510000);
INSERT INTO international VALUES (19,'Article',9,'�֥i�H�o��',1031510000);
INSERT INTO international VALUES (20,'Article',9,'�֥i�H�޲z',1031510000);
INSERT INTO international VALUES (21,'Article',9,'�s��W��',1031510000);
INSERT INTO international VALUES (22,'Article',9,'�@��',1031510000);
INSERT INTO international VALUES (23,'Article',9,'���',1031510000);
INSERT INTO international VALUES (24,'Article',9,'�o���^��',1031510000);
INSERT INTO international VALUES (25,'Article',9,'�s��^��',1031510000);
INSERT INTO international VALUES (26,'Article',9,'�R���^��',1031510000);
INSERT INTO international VALUES (27,'Article',9,'��^�峹',1031510000);
INSERT INTO international VALUES (413,'WebGUI',9,'�J���Y�����~��',1031510000);
INSERT INTO international VALUES (28,'Article',9,'�d�ݦ^��',1031510000);
INSERT INTO international VALUES (414,'WebGUI',9,'��ܰ�����T',1031510000);
INSERT INTO international VALUES (415,'WebGUI',9,'��ܤͦn��T',1031510000);
INSERT INTO international VALUES (416,'WebGUI',9,'<h1>�z���ШD�X�{���D</h1> \r\n�z���ШD�X�{�@�ӿ��~�C�Ы��s��������^���s��^�W�@�����դ@���C�p�G�������~�~��s�b�A���p�t�ڭ̡A�P�ɧi�D�ڭ̱z�b����ɶ��ϥΤ���઺�ɭԥX�{���o�ӿ��~�C���¡I',1031510000);
INSERT INTO international VALUES (417,'WebGUI',9,'<h1>�w��ĵ��</h1>\r\n �z�X�ݪ��ե󤣦b�o�@���W�C����T�w�g�o�e���t�κ޲z��',1031510000);
INSERT INTO international VALUES (418,'WebGUI',9,'HTML �L�o',1031510000);
INSERT INTO international VALUES (419,'WebGUI',9,'�M���Ҧ�������',1031510000);
INSERT INTO international VALUES (420,'WebGUI',9,'�O�d�Ҧ�������',1031510000);
INSERT INTO international VALUES (421,'WebGUI',9,'�O�d�򥻪�����',1031510000);
INSERT INTO international VALUES (422,'WebGUI',9,'<h1>�n������</h1>\r\n�z��J���b���T���~',1031510000);
INSERT INTO international VALUES (423,'WebGUI',9,'�d�ݬ��ʹ��',1031510000);
INSERT INTO international VALUES (424,'WebGUI',9,'�d�ݵn�����v�O��',1031510000);
INSERT INTO international VALUES (425,'WebGUI',9,'���ʹ��',1031510000);
INSERT INTO international VALUES (426,'WebGUI',9,'�n�����v�O��',1031510000);
INSERT INTO international VALUES (427,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (428,'WebGUI',9,'�ϥΪ� (ID)',1031510000);
INSERT INTO international VALUES (429,'WebGUI',9,'�n���ɶ�',1031510000);
INSERT INTO international VALUES (430,'WebGUI',9,'�̫�X�ݭ���',1031510000);
INSERT INTO international VALUES (431,'WebGUI',9,'IP �a�}',1031510000);
INSERT INTO international VALUES (432,'WebGUI',9,'�L��',1031510000);
INSERT INTO international VALUES (433,'WebGUI',9,'�ϥΪ̺�',1031510000);
INSERT INTO international VALUES (434,'WebGUI',9,'���A',1031510000);
INSERT INTO international VALUES (435,'WebGUI',9,'��ܫH��',1031510000);
INSERT INTO international VALUES (436,'WebGUI',9,'�屼�����',1031510000);
INSERT INTO international VALUES (437,'WebGUI',9,'�έp��T',1031510000);
INSERT INTO international VALUES (438,'WebGUI',9,'�z���W�r',1031510000);
INSERT INTO international VALUES (439,'WebGUI',9,'�ӤH��T',1031510000);
INSERT INTO international VALUES (440,'WebGUI',9,'�p�t��T',1031510000);
INSERT INTO international VALUES (441,'WebGUI',9,'�q�l�l���ǩI����',1031510000);
INSERT INTO international VALUES (442,'WebGUI',9,'�u�@��T',1031510000);
INSERT INTO international VALUES (443,'WebGUI',9,'�a�x��T',1031510000);
INSERT INTO international VALUES (444,'WebGUI',9,'�ӤH���p',1031510000);
INSERT INTO international VALUES (445,'WebGUI',9,'�ߦn�]�m',1031510000);
INSERT INTO international VALUES (446,'WebGUI',9,'������',1031510000);
INSERT INTO international VALUES (447,'WebGUI',9,'�޲z������',1031510000);
INSERT INTO international VALUES (448,'WebGUI',9,'������',1031510000);
INSERT INTO international VALUES (449,'WebGUI',9,'�@���T',1031510000);
INSERT INTO international VALUES (450,'WebGUI',9,'���W��',1031510000);
INSERT INTO international VALUES (451,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (452,'WebGUI',9,'�i�J��...',1031510000);
INSERT INTO international VALUES (453,'WebGUI',9,'�Ыؤ��',1031510000);
INSERT INTO international VALUES (454,'WebGUI',9,'�̫��s',1031510000);
INSERT INTO international VALUES (455,'WebGUI',9,'�s��ϥΪ̸�T',1031510000);
INSERT INTO international VALUES (456,'WebGUI',9,'��^�ϥΪ̦C��',1031510000);
INSERT INTO international VALUES (457,'WebGUI',9,'�s�覹�ϥΪ̱b��',1031510000);
INSERT INTO international VALUES (458,'WebGUI',9,'�s�覹�ϥΪ̲ոs',1031510000);
INSERT INTO international VALUES (459,'WebGUI',9,'�s�覹�ϥΪ��ݩ�',1031510000);
INSERT INTO international VALUES (460,'WebGUI',9,'�ɰ�',1031510000);
INSERT INTO international VALUES (461,'WebGUI',9,'����榡',1031510000);
INSERT INTO international VALUES (462,'WebGUI',9,'�ɶ��榡',1031510000);
INSERT INTO international VALUES (463,'WebGUI',9,'�奻��J�Ϧ��',1031510000);
INSERT INTO international VALUES (464,'WebGUI',9,'�奻��J�ϦC��',1031510000);
INSERT INTO international VALUES (465,'WebGUI',9,'�奻�ؤj�p',1031510000);
INSERT INTO international VALUES (466,'WebGUI',9,'�z�T�w�n�R�������O�åB�N�����O�U�Ҧ���ز��ʨ�@�����O��',1031510000);
INSERT INTO international VALUES (467,'WebGUI',9,'�z�T�w�n�R������ءA�åB�Ҧ�������ت��ϥΪ̸�T��',1031510000);
INSERT INTO international VALUES (469,'WebGUI',9,'ID',1031510000);
INSERT INTO international VALUES (470,'WebGUI',9,'�W�r',1031510000);
INSERT INTO international VALUES (472,'WebGUI',9,'���D',1031510000);
INSERT INTO international VALUES (473,'WebGUI',9,'�i��',1031510000);
INSERT INTO international VALUES (474,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (475,'WebGUI',9,'��r',1031510000);
INSERT INTO international VALUES (476,'WebGUI',9,'��r��',1031510000);
INSERT INTO international VALUES (477,'WebGUI',9,'HTML ��',1031510000);
INSERT INTO international VALUES (478,'WebGUI',9,'URL',1031510000);
INSERT INTO international VALUES (479,'WebGUI',9,'���',1031510000);
INSERT INTO international VALUES (480,'WebGUI',9,'�q�l�l��a�}',1031510000);
INSERT INTO international VALUES (481,'WebGUI',9,'�q�ܸ��X',1031510000);
INSERT INTO international VALUES (482,'WebGUI',9,'�Ʀr (���)',1031510000);
INSERT INTO international VALUES (483,'WebGUI',9,'�O�Χ_',1031510000);
INSERT INTO international VALUES (484,'WebGUI',9,'��ܦC��',1031510000);
INSERT INTO international VALUES (485,'WebGUI',9,'������ (��ܮ�)',1031510000);
INSERT INTO international VALUES (486,'WebGUI',9,'���u����',1031510000);
INSERT INTO international VALUES (487,'WebGUI',9,'�i���',1031510000);
INSERT INTO international VALUES (488,'WebGUI',9,'�q�{��',1031510000);
INSERT INTO international VALUES (489,'WebGUI',9,'�ݩ���',1031510000);
INSERT INTO international VALUES (490,'WebGUI',9,'�W�[�@���ݩ���',1031510000);
INSERT INTO international VALUES (491,'WebGUI',9,'�W�[�@���ݩ���',1031510000);
INSERT INTO international VALUES (492,'WebGUI',9,'�ݩ���C��',1031510000);
INSERT INTO international VALUES (493,'WebGUI',9,'��^����',1031510000);
INSERT INTO international VALUES (495,'WebGUI',9,'���m�s�边',1031510000);
INSERT INTO international VALUES (496,'WebGUI',9,'�ϥ�',1031510000);
INSERT INTO international VALUES (494,'WebGUI',9,'Real Objects Edit-On Pro',1031510000);
INSERT INTO international VALUES (497,'WebGUI',9,'�}�l���',1031510000);
INSERT INTO international VALUES (498,'WebGUI',9,'�������',1031510000);
INSERT INTO international VALUES (499,'WebGUI',9,'�ե� ID',1031510000);
INSERT INTO international VALUES (500,'WebGUI',9,'���� ID',1031510000);
INSERT INTO international VALUES (514,'WebGUI',9,'�X��',1031510000);
INSERT INTO international VALUES (527,'WebGUI',9,'�q�{����',1031510000);
INSERT INTO international VALUES (503,'WebGUI',9,'�ҪO ID',1031510000);
INSERT INTO international VALUES (501,'WebGUI',9,'�D�^',1031510000);
INSERT INTO international VALUES (528,'WebGUI',9,'�ҪO�W��',1031510000);
INSERT INTO international VALUES (468,'WebGUI',9,'�s��ϥΪ��ݩ���',1031510000);
INSERT INTO international VALUES (159,'WebGUI',9,'����c',1031510000);
INSERT INTO international VALUES (508,'WebGUI',9,'�޲z�ҪO',1031510000);
INSERT INTO international VALUES (39,'USS',9,'�o���^��',1031510000);
INSERT INTO international VALUES (747,'WebGUI',1,'Usernames must contain only alpha-numeric characters.',1036384261);
INSERT INTO international VALUES (41,'USS',9,'���',1031510000);
INSERT INTO international VALUES (42,'USS',9,'�s��^��',1031510000);
INSERT INTO international VALUES (43,'USS',9,'�R���^��',1031510000);
INSERT INTO international VALUES (45,'USS',9,'��^�i�K�峹�t��',1031510000);
INSERT INTO international VALUES (46,'USS',9,'��h...',1031510000);
INSERT INTO international VALUES (47,'USS',9,'�^��',1031510000);
INSERT INTO international VALUES (48,'USS',9,'�O�_����Q��',1031510000);
INSERT INTO international VALUES (49,'USS',9,'�s��W��',1031510000);
INSERT INTO international VALUES (50,'USS',9,'����o�����ϥΪ̲�',1031510000);
INSERT INTO international VALUES (44,'USS',9,'����޲z���ϥΪ̲�',1031510000);
INSERT INTO international VALUES (51,'USS',9,'��ܧַ�',1031510000);
INSERT INTO international VALUES (52,'USS',9,'�ַ�',1031510000);
INSERT INTO international VALUES (53,'USS',9,'����',1031510000);
INSERT INTO international VALUES (73,'USS',1,'Submission Template',1036277524);
INSERT INTO international VALUES (57,'USS',9,'�^��',1031510000);
INSERT INTO international VALUES (11,'FAQ',9,'�O�_���} TOC ',1031510000);
INSERT INTO international VALUES (12,'FAQ',9,'�O�_���} Q/A ',1031510000);
INSERT INTO international VALUES (13,'FAQ',9,'�O�_���} [top] �s��',1031510000);
INSERT INTO international VALUES (509,'WebGUI',9,'�Q�ץ���',1031510000);
INSERT INTO international VALUES (510,'WebGUI',9,'���Q',1031510000);
INSERT INTO international VALUES (511,'WebGUI',9,'�u��',1031510000);
INSERT INTO international VALUES (512,'WebGUI',9,'�U�@���u��',1031510000);
INSERT INTO international VALUES (513,'WebGUI',9,'�W�@���u��',1031510000);
INSERT INTO international VALUES (534,'WebGUI',9,'�s�ϥΪ̴���',1031510000);
INSERT INTO international VALUES (354,'WebGUI',9,'�d�ݦ���c',1031510000);
INSERT INTO international VALUES (531,'WebGUI',9,'�]�A<b>���㪺���g</b>',1031510000);
INSERT INTO international VALUES (518,'WebGUI',9,'����c����',1031510000);
INSERT INTO international VALUES (519,'WebGUI',9,'�ڧƱ�Q����',1031510000);
INSERT INTO international VALUES (520,'WebGUI',9,'�ڧƱ�q�L�q�l�l�󪺤覡����',1031510000);
INSERT INTO international VALUES (521,'WebGUI',9,'�ڧƱ�q�L�q�l�l���ǩI���覡����',1031510000);
INSERT INTO international VALUES (522,'WebGUI',9,'�ڧƱ�q�L ICQ ���覡����',1031510000);
INSERT INTO international VALUES (523,'WebGUI',9,'����',1031510000);
INSERT INTO international VALUES (524,'WebGUI',9,'�O�_�W�[�s���W',1031510000);
INSERT INTO international VALUES (525,'WebGUI',9,'�s�褺�e�]�m',1031510000);
INSERT INTO international VALUES (10,'FAQ',2,'Frage bearbeiten',1031510000);
INSERT INTO international VALUES (10,'FileManager',2,'Download\nbearbeiten',1031510000);
INSERT INTO international VALUES (10,'Article',2,'Carriage Return\nbeachten?',1031510000);
INSERT INTO international VALUES (562,'WebGUI',2,'Ausstehend',1031510000);
INSERT INTO international VALUES (9,'WebGUI',2,'Zwischenablage\nanschauen',1031510000);
INSERT INTO international VALUES (9,'SQLReport',2,'Fehler: Die DSN\nbesitzt das falsche Format.',1031510000);
INSERT INTO international VALUES (9,'SiteMap',2,'�bersicht\nanzeigen?',1031510000);
INSERT INTO international VALUES (9,'Poll',2,'Abstimmung\nbearbeiten',1031510000);
INSERT INTO international VALUES (9,'MessageBoard',2,'Beitrags\nID:',1031510000);
INSERT INTO international VALUES (9,'LinkList',2,'Sind Sie sicher,\ndass Sie diesen Link l�schen wollen?',1031510000);
INSERT INTO international VALUES (9,'FAQ',2,'Neue Frage\nhinzuf�gen',1031510000);
INSERT INTO international VALUES (9,'EventsCalendar',2,'bis',1031510000);
INSERT INTO international VALUES (9,'FileManager',2,'Download\nManager bearbeiten',1031510000);
INSERT INTO international VALUES (9,'Article',2,'Dateianhang',1031510000);
INSERT INTO international VALUES (8,'WebGUI',2,'\"Seite nicht\ngefunden\" anschauen',1031510000);
INSERT INTO international VALUES (561,'WebGUI',2,'Verboten',1031510000);
INSERT INTO international VALUES (8,'SQLReport',2,'SQL Bericht\nbearbeiten',1031510000);
INSERT INTO international VALUES (8,'SiteMap',2,'Zeilenabstand',1031510000);
INSERT INTO international VALUES (8,'Poll',2,'(Eine Antwort pro\nZeile. Bitte nicht mehr als 20 verschiedene Antworten)',1031510000);
INSERT INTO international VALUES (8,'MessageBoard',2,'Datum:',1031510000);
INSERT INTO international VALUES (8,'LinkList',2,'URL',1031510000);
INSERT INTO international VALUES (8,'FAQ',2,'F.A.Q. bearbeiten',1031510000);
INSERT INTO international VALUES (8,'EventsCalendar',2,'Wiederholt\nsich',1031510000);
INSERT INTO international VALUES (8,'FileManager',2,'Kurze\nBeschreibung',1031510000);
INSERT INTO international VALUES (7,'WebGUI',2,'Benutzer\nverwalten',1031510000);
INSERT INTO international VALUES (8,'Article',2,'Link URL',1031510000);
INSERT INTO international VALUES (560,'WebGUI',2,'Erlaubt',1031510000);
INSERT INTO international VALUES (7,'SQLReport',2,'Datenbankpasswort',1031510000);
INSERT INTO international VALUES (7,'SiteMap',2,'Kugel',1031510000);
INSERT INTO international VALUES (7,'Poll',2,'Antworten',1031510000);
INSERT INTO international VALUES (7,'MessageBoard',2,'Autor:',1031510000);
INSERT INTO international VALUES (7,'FAQ',2,'Sind Sie sicher, dass\nSie diese Frage l�schen wollen?',1031510000);
INSERT INTO international VALUES (7,'FileManager',2,'Gruppe,\ndie Download benutzen kann',1031510000);
INSERT INTO international VALUES (7,'Article',2,'Link Titel',1031510000);
INSERT INTO international VALUES (6,'WebGUI',2,'Stile verwalten',1031510000);
INSERT INTO international VALUES (6,'USS',2,'Beitr�ge\npro Seite',1031510000);
INSERT INTO international VALUES (6,'SyndicatedContent',2,'Aktueller Inhalt',1031510000);
INSERT INTO international VALUES (6,'SQLReport',2,'Datenbankbenutzer',1031510000);
INSERT INTO international VALUES (6,'SiteMap',2,'Zweck',1031510000);
INSERT INTO international VALUES (6,'MessageBoard',2,'Diskussionsforum bearbeiten',1031510000);
INSERT INTO international VALUES (6,'Poll',2,'Frage',1031510000);
INSERT INTO international VALUES (6,'LinkList',2,'Link Liste',1031510000);
INSERT INTO international VALUES (6,'FAQ',2,'Antwort',1031510000);
INSERT INTO international VALUES (6,'ExtraColumn',2,'Extra Spalte\nbearbeiten',1031510000);
INSERT INTO international VALUES (701,'WebGUI',2,'Woche',1031510000);
INSERT INTO international VALUES (6,'FileManager',2,'Dateiname',1031510000);
INSERT INTO international VALUES (6,'Article',2,'Bild',1031510000);
INSERT INTO international VALUES (5,'WebGUI',2,'Gruppen\nverwalten',1031510000);
INSERT INTO international VALUES (5,'USS',2,'Ihr Beitrag\nwurde abgelehnt.',1031510000);
INSERT INTO international VALUES (5,'SyndicatedContent',2,'zuletzt\ngeholt',1031510000);
INSERT INTO international VALUES (5,'SQLReport',2,'DSN (Data Source\nName)',1031510000);
INSERT INTO international VALUES (5,'SiteMap',2,'Site Map\nbearbeiten',1031510000);
INSERT INTO international VALUES (5,'Poll',2,'Breite der Grafik',1031510000);
INSERT INTO international VALUES (566,'WebGUI',2,'Timeout zum\nbearbeiten',1031510000);
INSERT INTO international VALUES (5,'LinkList',2,'Wollen Sie einen\nLink hinzuf�gen?',1031510000);
INSERT INTO international VALUES (5,'Item',2,'Anhang\nherunterladen',1031510000);
INSERT INTO international VALUES (5,'FAQ',2,'Frage',1031510000);
INSERT INTO international VALUES (5,'ExtraColumn',2,'StyleSheet\nClass',1031510000);
INSERT INTO international VALUES (700,'WebGUI',2,'Tag',1031510000);
INSERT INTO international VALUES (5,'FileManager',2,'Dateititel',1031510000);
INSERT INTO international VALUES (4,'WebGUI',2,'Einstellungen\nverwalten',1031510000);
INSERT INTO international VALUES (4,'USS',2,'Ihr Betrag\nwurde angenommen.',1031510000);
INSERT INTO international VALUES (4,'SQLReport',2,'Abfrage',1031510000);
INSERT INTO international VALUES (4,'SyndicatedContent',2,'Clipping-Dienst bearbeiten',1031510000);
INSERT INTO international VALUES (4,'SiteMap',2,'Tiefe',1031510000);
INSERT INTO international VALUES (4,'Poll',2,'Wer kann\nabstimmen?',1031510000);
INSERT INTO international VALUES (4,'Item',2,'Kleiner Artikel',1031510000);
INSERT INTO international VALUES (4,'LinkList',2,'Kugel',1031510000);
INSERT INTO international VALUES (4,'MessageBoard',2,'Beitr�ge pro\nSeite',1031510000);
INSERT INTO international VALUES (4,'ExtraColumn',2,'Breite',1031510000);
INSERT INTO international VALUES (4,'EventsCalendar',2,'Einmaliges\nEreignis',1031510000);
INSERT INTO international VALUES (4,'Article',2,'Ende Datum',1031510000);
INSERT INTO international VALUES (3,'WebGUI',2,'Aus Zwischenablage\neinf�gen...',1031510000);
INSERT INTO international VALUES (3,'USS',2,'Sie sollten\neinen neuen Beitrag genehmigen.',1031510000);
INSERT INTO international VALUES (3,'SQLReport',2,'Schablone',1031510000);
INSERT INTO international VALUES (3,'SiteMap',2,'Auf dieser Ebene\nStarten?',1031510000);
INSERT INTO international VALUES (3,'Poll',2,'Aktiv',1031510000);
INSERT INTO international VALUES (564,'WebGUI',2,'Wer kann\nBeitr�ge schreiben?',1031510000);
INSERT INTO international VALUES (3,'LinkList',2,'In neuem Fenster\n�ffnen?',1031510000);
INSERT INTO international VALUES (3,'Item',2,'Anhang l�schen',1031510000);
INSERT INTO international VALUES (3,'ExtraColumn',2,'Platzhalter',1031510000);
INSERT INTO international VALUES (3,'FileManager',2,'Fortfahren\ndie Datei hinzuzuf�gen?',1031510000);
INSERT INTO international VALUES (3,'Article',2,'Start Datum',1031510000);
INSERT INTO international VALUES (2,'WebGUI',2,'Seite',1031510000);
INSERT INTO international VALUES (2,'USS',2,'Wer kann\nBeitr�ge schreiben?',1031510000);
INSERT INTO international VALUES (2,'SyndicatedContent',2,'Clipping-Dienst',1031510000);
INSERT INTO international VALUES (2,'SiteMap',2,'Site\nMap/�bersicht',1031510000);
INSERT INTO international VALUES (2,'FAQ',2,'F.A.Q.',1031510000);
INSERT INTO international VALUES (2,'Item',2,'Anhang',1031510000);
INSERT INTO international VALUES (2,'LinkList',2,'Zeilenabstand',1031510000);
INSERT INTO international VALUES (2,'MessageBoard',2,'Diskussionsforum',1031510000);
INSERT INTO international VALUES (2,'EventsCalendar',2,'Veranstaltungskalender',1031510000);
INSERT INTO international VALUES (1,'WebGUI',2,'Inhalt\nhinzuf�gen...',1031510000);
INSERT INTO international VALUES (1,'SyndicatedContent',2,'URL zur\nRSS-Datei',1031510000);
INSERT INTO international VALUES (1,'USS',2,'Wer kann\ngenehmigen?',1031510000);
INSERT INTO international VALUES (1,'SQLReport',2,'SQL Bericht',1031510000);
INSERT INTO international VALUES (1,'Poll',2,'Abstimmung',1031510000);
INSERT INTO international VALUES (1,'LinkList',2,'Tabulator',1031510000);
INSERT INTO international VALUES (1,'Item',2,'Link URL',1031510000);
INSERT INTO international VALUES (1,'ExtraColumn',2,'Extra\nSpalte',1031510000);
INSERT INTO international VALUES (1,'EventsCalendar',2,'Termin\nhinzuf�gen?',1031510000);
INSERT INTO international VALUES (1,'FileManager',2,'Download\nManager',1031510000);
INSERT INTO international VALUES (1,'Article',2,'Artikel',1031510000);
INSERT INTO international VALUES (395,'WebGUI',2,'Neue Grafik\nhinzuf�gen.',1031510000);
INSERT INTO international VALUES (396,'WebGUI',2,'Grafik\nanschauen',1031510000);
INSERT INTO international VALUES (397,'WebGUI',2,'Zur�ck zur\nGrafik�bersicht.',1031510000);
INSERT INTO international VALUES (398,'WebGUI',2,'Dokumententyp\nBeschreibung',1031510000);
INSERT INTO international VALUES (399,'WebGUI',2,'Diese Seite\n�berpr�fen.',1031510000);
INSERT INTO international VALUES (400,'WebGUI',2,'Caching\nverhindern',1031510000);
INSERT INTO international VALUES (401,'WebGUI',2,'Sind Sie sicher,\ndass Sie diese Nachrichten und alle darunterliegenden l�schen wollen?',1031510000);
INSERT INTO international VALUES (402,'WebGUI',2,'Die Nachricht die\nsie abfragen wollten existiert leider nicht.',1031510000);
INSERT INTO international VALUES (403,'WebGUI',2,'Ich teile es\nlieber nicht mit.',1031510000);
INSERT INTO international VALUES (404,'WebGUI',2,'Erste Seite',1031510000);
INSERT INTO international VALUES (405,'WebGUI',2,'Letzte Seite',1031510000);
INSERT INTO international VALUES (406,'WebGUI',2,'Gr��e der kleinen\nBilder',1031510000);
INSERT INTO international VALUES (407,'WebGUI',2,'Klicken Sie hier,\num sich zu registrieren',1031510000);
INSERT INTO international VALUES (408,'WebGUI',2,'Startseiten\nbearbeiten',1031510000);
INSERT INTO international VALUES (409,'WebGUI',2,'Neue Startseite\nanlegen',1031510000);
INSERT INTO international VALUES (410,'WebGUI',2,'Startseiten\nbearbeiten',1031510000);
INSERT INTO international VALUES (411,'WebGUI',2,'Men� Titel',1031510000);
INSERT INTO international VALUES (412,'WebGUI',2,'Synopse',1031510000);
INSERT INTO international VALUES (416,'WebGUI',2,'<h1>Abfrageproblem</h1> Ihre Anfrage macht dem\nSystem Probleme. Bitte bet�tigen Sie den Zur�ckbutton im Browser und\nversuchen Sie es nochmal. Sollte dieses Problem weiterbestehen, teilen Sie\nuns bitte mit, was Sie wo im System wann gemacht haben.',1031510000);
INSERT INTO international VALUES (417,'WebGUI',2,'<h1>Sicherheitsversto�</h1> Sie haben versucht\nauf einen Systemteil zuzugreifen, der Ihnen nicht erlaubt ist. Der Versto�\nwurde gemeldet.',1031510000);
INSERT INTO international VALUES (418,'WebGUI',2,'HTML filtern',1031510000);
INSERT INTO international VALUES (419,'WebGUI',2,'Alle\nBeschreibungselemente entfernen',1031510000);
INSERT INTO international VALUES (420,'WebGUI',2,'Nicht\nver�ndern',1031510000);
INSERT INTO international VALUES (421,'WebGUI',2,'Nur einfache\nFormatierungen beibehalten',1031510000);
INSERT INTO international VALUES (422,'WebGUI',2,'<h1>Anmeldung ist\nfehlgeschlagen!</h1> Die eingegebenen Zugansdaten stimmen mit keinen\nBenutzerdaten �berein.',1031510000);
INSERT INTO international VALUES (423,'WebGUI',2,'Aktive Sitzungen\nanschauen',1031510000);
INSERT INTO international VALUES (424,'WebGUI',2,'Anmeldungshistorie anschauen',1031510000);
INSERT INTO international VALUES (425,'WebGUI',2,'Aktive\nSitzungen',1031510000);
INSERT INTO international VALUES (426,'WebGUI',2,'Anmeldungshistorie',1031510000);
INSERT INTO international VALUES (427,'WebGUI',2,'Stile',1031510000);
INSERT INTO international VALUES (428,'WebGUI',2,'Benutzername',1031510000);
INSERT INTO international VALUES (429,'WebGUI',2,'Anmeldungszeit',1031510000);
INSERT INTO international VALUES (430,'WebGUI',2,'Seite wurde das\nletzte mal angeschaut',1031510000);
INSERT INTO international VALUES (431,'WebGUI',2,'IP Adresse',1031510000);
INSERT INTO international VALUES (432,'WebGUI',2,'l�uft ab',1031510000);
INSERT INTO international VALUES (434,'WebGUI',2,'Status',1031510000);
INSERT INTO international VALUES (435,'WebGUI',2,'Sitzungssignatur',1031510000);
INSERT INTO international VALUES (436,'WebGUI',2,'Sitzung\nbeenden',1031510000);
INSERT INTO international VALUES (437,'WebGUI',2,'Statistiken',1031510000);
INSERT INTO international VALUES (438,'WebGUI',2,'Ihr Name',1031510000);
INSERT INTO international VALUES (51,'USS',2,'Bildvorschau anzeigen?',1031510000);
INSERT INTO international VALUES (1,'Product',2,'Produkt',1031510000);
INSERT INTO international VALUES (10,'MailForm',2,'Von',1031510000);
INSERT INTO international VALUES (10,'Product',2,'Preis',1031510000);
INSERT INTO international VALUES (11,'FAQ',2,'Inhaltsverzeichnis einschalten?',1031510000);
INSERT INTO international VALUES (11,'MailForm',2,'senden an (Email, Benutzername oder Gruppenname)',1031510000);
INSERT INTO international VALUES (11,'Product',2,'Produktnummer',1031510000);
INSERT INTO international VALUES (12,'FAQ',2,'Frage/Antwort einschalten?',1031510000);
INSERT INTO international VALUES (12,'MailForm',2,'Kopie',1031510000);
INSERT INTO international VALUES (728,'WebGUI',2,'Sind Sie sicher, da� Sie diese Datei l�schen wollen?',1031510000);
INSERT INTO international VALUES (13,'FAQ',2,'[top] Link einschalten?',1031510000);
INSERT INTO international VALUES (13,'MailForm',2,'Blindkopie',1031510000);
INSERT INTO international VALUES (13,'Product',2,'Brosch�re',1031510000);
INSERT INTO international VALUES (14,'MailForm',2,'Betreff',1031510000);
INSERT INTO international VALUES (15,'MailForm',2,'Mehr Felder hinzuf�gen?',1031510000);
INSERT INTO international VALUES (15,'Product',2,'Garantie',1031510000);
INSERT INTO international VALUES (9,'MailForm',2,'Feld hinzuf�gen',1031510000);
INSERT INTO international VALUES (8,'MailForm',2,'Breite',1031510000);
INSERT INTO international VALUES (1,'MailForm',2,'Mail Vorlage',1031510000);
INSERT INTO international VALUES (16,'MailForm',2,'Wissen',1031510000);
INSERT INTO international VALUES (17,'MailForm',2,'E-mail wurde gesendet',1031510000);
INSERT INTO international VALUES (463,'WebGUI',2,'Zeilen des Textfeldes',1031510000);
INSERT INTO international VALUES (462,'WebGUI',2,'Zeitformat',1031510000);
INSERT INTO international VALUES (461,'WebGUI',2,'Format des Datums',1031510000);
INSERT INTO international VALUES (460,'WebGUI',2,'Zeitabweichung',1031510000);
INSERT INTO international VALUES (46,'USS',2,'Lesen Sie mehr...',1031510000);
INSERT INTO international VALUES (46,'Product',2,'Produkt (verwandt), hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (459,'WebGUI',2,'Das Profil dieses Benutzers bearbeiten.',1031510000);
INSERT INTO international VALUES (458,'WebGUI',2,'Gruppen dieses Benuzters bearbeiten',1031510000);
INSERT INTO international VALUES (457,'WebGUI',2,'Konto des Benutzers bearbeiten',1031510000);
INSERT INTO international VALUES (456,'WebGUI',2,'zur�ck zur Benutzer�bersicht',1031510000);
INSERT INTO international VALUES (455,'WebGUI',2,'Profil des Benutzers bearbeiten',1031510000);
INSERT INTO international VALUES (454,'WebGUI',2,'letztes Update',1031510000);
INSERT INTO international VALUES (453,'WebGUI',2,'Erstelldatum',1031510000);
INSERT INTO international VALUES (452,'WebGUI',2,'Bitte warten...',1031510000);
INSERT INTO international VALUES (451,'WebGUI',2,'ist erforderlich.',1031510000);
INSERT INTO international VALUES (450,'WebGUI',2,'Firmenname',1031510000);
INSERT INTO international VALUES (45,'USS',2,'zur�ck zur Submission',1031510000);
INSERT INTO international VALUES (449,'WebGUI',2,'sonstige Informationen',1031510000);
INSERT INTO international VALUES (448,'WebGUI',2,'Baumstruktur der Seite',1031510000);
INSERT INTO international VALUES (447,'WebGUI',2,'Baumstruktur der Seite verwalten',1031510000);
INSERT INTO international VALUES (445,'WebGUI',2,'Pr�ferenzen',1031510000);
INSERT INTO international VALUES (444,'WebGUI',2,'demografische Informationen',1031510000);
INSERT INTO international VALUES (439,'WebGUI',2,'pers�nliche Informationen',1031510000);
INSERT INTO international VALUES (39,'USS',2,'Antwort schreiben',1031510000);
INSERT INTO international VALUES (4,'MailForm',2,'unsichtbar',1031510000);
INSERT INTO international VALUES (40,'Product',2,'Produkteigenschaft hinzu�gen/bearbeiten',1031510000);
INSERT INTO international VALUES (41,'USS',2,'Datum',1031510000);
INSERT INTO international VALUES (18,'MailForm',2,'Zur�ck!',1031510000);
INSERT INTO international VALUES (21,'Product',2,'Add another related product?',1031510000);
INSERT INTO international VALUES (8,'Product',2,'Produktgrafik 3',1031510000);
INSERT INTO international VALUES (78,'EventsCalendar',2,'L�schen Sie nichts, ich habe einen Fehler verursacht.',1031510000);
INSERT INTO international VALUES (73,'LinkList',2,'Title\r\nThe text that will be linked. \r\nURL\r\nThe web site to link to. \r\n\r\nOpen in new window?\r\nSelect yes if you\'d like this link to pop-up into a new window. \r\n\r\nDescription\r\nDescribe the site you\'re linking to. You can omit this if you\'d like. \r\n\r\nProceed to add link? If you have another link to add, select \"Yes\". \r\n',1031510000);
INSERT INTO international VALUES (76,'EventsCalendar',2,'Nur dieses Ereignis l�schen',1031510000);
INSERT INTO international VALUES (77,'EventsCalendar',2,'Dieses Ereignis und alle Wiederholungen l�schen.',1031510000);
INSERT INTO international VALUES (75,'EventsCalendar',2,'Was m�chten Sie gerne tun?',1031510000);
INSERT INTO international VALUES (74,'EventsCalendar',2,'Kalendermonat (klein)',1031510000);
INSERT INTO international VALUES (72,'Poll',2,'Antworten zuf�llig anordnen?',1031510000);
INSERT INTO international VALUES (72,'LinkList',2,'Link hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (72,'FAQ',2,'Frage hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (72,'EventsCalendar',2,'Ereignis hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (72,'FileManager',2,'Download hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (717,'WebGUI',2,'Abmelden',1031510000);
INSERT INTO international VALUES (716,'WebGUI',2,'Anmelden',1031510000);
INSERT INTO international VALUES (715,'WebGUI',2,'Redirect URL',1031510000);
INSERT INTO international VALUES (710,'WebGUI',2,'privilegierte Einstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (27,'Product',2,'Spezifikation',1031510000);
INSERT INTO international VALUES (26,'Product',2,'Label',1031510000);
INSERT INTO international VALUES (25,'Product',2,'Spezifikation bearbeiten',1031510000);
INSERT INTO international VALUES (25,'MailForm',2,'Standartwert (optional)',1031510000);
INSERT INTO international VALUES (24,'Product',2,'Ein weitere Eigenschaft hinzuf�gen?',1031510000);
INSERT INTO international VALUES (2,'WobjectProxy',2,'Wobject Proxy bearbeiten',1031510000);
INSERT INTO international VALUES (26,'MailForm',2,'Eintragungen speichern?',1031510000);
INSERT INTO international VALUES (24,'MailForm',2,'M�gliche Werte der Drop-Down Box',1031510000);
INSERT INTO international VALUES (23,'Product',2,'Eigenschaft',1031510000);
INSERT INTO international VALUES (23,'MailForm',2,'Art',1031510000);
INSERT INTO international VALUES (22,'Product',2,'Eigenschaft bearbeiten',1031510000);
INSERT INTO international VALUES (22,'MailForm',2,'Status',1031510000);
INSERT INTO international VALUES (22,'FileManager',2,'Einen weiteren Download hinzuf�gen?',1031510000);
INSERT INTO international VALUES (21,'MailForm',2,'Feldname',1031510000);
INSERT INTO international VALUES (21,'EventsCalendar',2,'Ein weiteres Ereignis hinzuf�gen?',1031510000);
INSERT INTO international VALUES (20,'Product',2,'�hnliches Produkt',1031510000);
INSERT INTO international VALUES (20,'MailForm',2,'Feld bearbeiten',1031510000);
INSERT INTO international VALUES (2,'MailForm',2,'Hier Betreff ihrer Email eingeben',1031510000);
INSERT INTO international VALUES (14,'Product',2,'Handbuch',1031510000);
INSERT INTO international VALUES (20,'EventsCalendar',2,'ein Ereignis hinzuf�gen',1031510000);
INSERT INTO international VALUES (19,'Product',2,'�hnliches produkt hinzuf�gen',1031510000);
INSERT INTO international VALUES (19,'MailForm',2,'Sind Sie sich sicher, dass Sie dieses Feld l�schen m�chten?',1031510000);
INSERT INTO international VALUES (520,'WebGUI',2,'Ich m�chte gern per Email benachrichtigt werden.',1031510000);
INSERT INTO international VALUES (52,'Product',2,'Einen weiteren Gewinn (benefit) hinzuf�gen?',1031510000);
INSERT INTO international VALUES (519,'WebGUI',2,'Ich m�chte nicht benachrichtigt werden.',1031510000);
INSERT INTO international VALUES (517,'WebGUI',2,'Administrationsmodus ausschalten!',1031510000);
INSERT INTO international VALUES (516,'WebGUI',2,'Administrationsmodus einschalten!',1031510000);
INSERT INTO international VALUES (514,'WebGUI',2,'Ansichten (views)',1031510000);
INSERT INTO international VALUES (51,'Product',2,'Gewinn (benefit)',1031510000);
INSERT INTO international VALUES (508,'WebGUI',2,'Vorlagen verwalten',1031510000);
INSERT INTO international VALUES (507,'WebGUI',2,'Vorlage bearbeiten',1031510000);
INSERT INTO international VALUES (506,'WebGUI',2,'Vorlagen verwalten',1031510000);
INSERT INTO international VALUES (505,'WebGUI',2,'neue Vorlage hinzuf�gen',1031510000);
INSERT INTO international VALUES (504,'WebGUI',2,'Vorlage',1031510000);
INSERT INTO international VALUES (503,'WebGUI',2,'ID der Vorlage',1031510000);
INSERT INTO international VALUES (502,'WebGUI',2,'Sind Sie sich sicher, dass Sie diese Vorlage l�schen m�chten und alle Seiten, die diese Vorlage benutzen somit auf die Standartvorlage setzen?',1031510000);
INSERT INTO international VALUES (500,'WebGUI',2,'ID der Seite',1031510000);
INSERT INTO international VALUES (5,'Product',2,'Sind Sie sich sicher, dass Sie diese Spezifikation l�schen m�chten?',1031510000);
INSERT INTO international VALUES (5,'MailForm',2,'Displayed',1031510000);
INSERT INTO international VALUES (499,'WebGUI',2,'Wobject ID',1031510000);
INSERT INTO international VALUES (498,'WebGUI',2,'Enddatum',1031510000);
INSERT INTO international VALUES (497,'WebGUI',2,'Anfangsdatum',1031510000);
INSERT INTO international VALUES (493,'WebGUI',2,'Zur�ck zur Seite.',1031510000);
INSERT INTO international VALUES (49,'Product',2,'Produktgewinn (benefit) hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (488,'WebGUI',2,'Standartwert(e)',1031510000);
INSERT INTO international VALUES (487,'WebGUI',2,'m�gliche Werte',1031510000);
INSERT INTO international VALUES (486,'WebGUI',2,'Datentyp',1031510000);
INSERT INTO international VALUES (483,'WebGUI',2,'Ja oder Nein',1031510000);
INSERT INTO international VALUES (482,'WebGUI',2,'Zahl (Integer)',1031510000);
INSERT INTO international VALUES (481,'WebGUI',2,'Telefonnummer',1031510000);
INSERT INTO international VALUES (480,'WebGUI',2,'Emailadresse',1031510000);
INSERT INTO international VALUES (48,'USS',2,'Diskussion zulassen?',1031510000);
INSERT INTO international VALUES (48,'Product',2,'Sind Sie sich sicher, dass Sie diesen Gewinn (benefit) l�schen m�chten? Er kann, wenn er einmal gel�scht wurde, nicht mehr wiederhergestellt werden.',1031510000);
INSERT INTO international VALUES (479,'WebGUI',2,'Datum',1031510000);
INSERT INTO international VALUES (478,'WebGUI',2,'URL',1031510000);
INSERT INTO international VALUES (477,'WebGUI',2,'HTML Bereich',1031510000);
INSERT INTO international VALUES (476,'WebGUI',2,'Textfeld',1031510000);
INSERT INTO international VALUES (475,'WebGUI',2,'Text',1031510000);
INSERT INTO international VALUES (474,'WebGUI',2,'Erforderlich?',1031510000);
INSERT INTO international VALUES (473,'WebGUI',2,'sichtbar?',1031510000);
INSERT INTO international VALUES (472,'WebGUI',2,'Label',1031510000);
INSERT INTO international VALUES (471,'WebGUI',2,'Benutzerprofilfeld bearbeiten',1031510000);
INSERT INTO international VALUES (470,'WebGUI',2,'Name',1031510000);
INSERT INTO international VALUES (47,'USS',2,'eine Antwort schreiben',1031510000);
INSERT INTO international VALUES (469,'WebGUI',2,'Id',1031510000);
INSERT INTO international VALUES (467,'WebGUI',2,'Sind Sie sich sicher, dass Sie dieses Feld und alle daraufbezogenen Benutzerdaten l�schen m�chten?',1031510000);
INSERT INTO international VALUES (466,'WebGUI',2,'Sind sie sich sicher, dass Sie diese Kategorie l�schen m�chten und alle ihre Felder in die Kategorie \'sonstiges\' verschieben m�chten?',1031510000);
INSERT INTO international VALUES (465,'WebGUI',2,'Gr��e der Textbox',1031510000);
INSERT INTO international VALUES (464,'WebGUI',2,'Spalten des Textfeldes',1031510000);
INSERT INTO international VALUES (628,'WebGUI',2,'Wenn Sie ein Bild l�schen, wird es endg�ltig gel�scht und kann nicht mehr wiederhergestellt werden. Sie sollten sich ganz sicher sein bevor Sie best�tigen, da� ein Bild gel�scht werden kann.',1031510000);
INSERT INTO international VALUES (696,'WebGUI',2,'M�lleimer leeren',1031510000);
INSERT INTO international VALUES (684,'WebGUI',2,'Vorlagen hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (683,'WebGUI',2,'Vorlagen verwalten',1031510000);
INSERT INTO international VALUES (682,'WebGUI',2,'Benutzerpofil bearbeiten',1031510000);
INSERT INTO international VALUES (681,'WebGUI',2,'Packages, Creating',1031510000);
INSERT INTO international VALUES (680,'WebGUI',2,'\'Package\' hinzuf�gen',1031510000);
INSERT INTO international VALUES (686,'WebGUI',2,'Gruppe von Grafiken hinzuf�gen',1031510000);
INSERT INTO international VALUES (679,'WebGUI',2,'inhaltliche Einstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (677,'WebGUI',2,'Wobject hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (708,'WebGUI',2,'Sondereinstellungen verwalten',1031510000);
INSERT INTO international VALUES (706,'WebGUI',2,'Stunde(n)',1031510000);
INSERT INTO international VALUES (707,'WebGUI',2,'Fehlersuche anzeigen?',1031510000);
INSERT INTO international VALUES (699,'WebGUI',2,'Erster Tag der Woche',1031510000);
INSERT INTO international VALUES (702,'WebGUI',2,'Monat(e)',1031510000);
INSERT INTO international VALUES (703,'WebGUI',2,'Jahr(e)',1031510000);
INSERT INTO international VALUES (704,'WebGUI',2,'Sekunde(n)',1031510000);
INSERT INTO international VALUES (7,'MailForm',2,'Emailformular bearbeiten',1031510000);
INSERT INTO international VALUES (685,'WebGUI',2,'Vorlage l�schen',1031510000);
INSERT INTO international VALUES (678,'WebGUI',2,'Hauptverzeichns verwalten',1031510000);
INSERT INTO international VALUES (676,'WebGUI',2,'Grafiken verwalten',1031510000);
INSERT INTO international VALUES (673,'WebGUI',2,'Grafik l�schen',1031510000);
INSERT INTO international VALUES (675,'WebGUI',2,'Suchmaschine benutzen',1031510000);
INSERT INTO international VALUES (674,'WebGUI',2,'sonstige Einstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (672,'WebGUI',2,'Profileinstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (669,'WebGUI',2,'Makros verwenden',1031510000);
INSERT INTO international VALUES (668,'WebGUI',2,'\'Style Sheets\' verwenden',1031510000);
INSERT INTO international VALUES (697,'WebGUI',2,'\'Karma\' verwenden',1031510000);
INSERT INTO international VALUES (670,'WebGUI',2,'Grafik hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (666,'WebGUI',2,'Gestaltung hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (665,'WebGUI',2,'Gruppe l�schen',1031510000);
INSERT INTO international VALUES (662,'WebGUI',2,'Einstellungen verwalten',1031510000);
INSERT INTO international VALUES (663,'WebGUI',2,'Email-Einstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (705,'WebGUI',2,'Minute(n)',1031510000);
INSERT INTO international VALUES (661,'WebGUI',2,'DateiEinstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (659,'WebGUI',2,'Gestaltungen verwalten',1031510000);
INSERT INTO international VALUES (658,'WebGUI',2,'Benutzer verwalten',1031510000);
INSERT INTO international VALUES (660,'WebGUI',2,'Gruppen verwalten',1031510000);
INSERT INTO international VALUES (655,'WebGUI',2,'Benutzer hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (652,'WebGUI',2,'Benutzereinstelungen bearbeiten',1031510000);
INSERT INTO international VALUES (671,'WebGUI',2,'Wobjects benutzen',1031510000);
INSERT INTO international VALUES (657,'WebGUI',2,'Benutzer l�schen',1031510000);
INSERT INTO international VALUES (667,'WebGUI',2,'Gruppe hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (653,'WebGUI',2,'Seite l�schen',1031510000);
INSERT INTO international VALUES (656,'WebGUI',2,'Informationen �ber das Unternehemen bearbeiten',1031510000);
INSERT INTO international VALUES (651,'WebGUI',2,'Falls Sie Ihren M�lleimer leeren, werden alle Posten darin unwiderruflich gel�scht. Wenn Sie sich �ber einige Posten nicht sicher sind, w�re es am besten, sie mittels \'ausschneiden\' in die Zwischenablage zu legen bevor Sie den M�lleimer leeren.',1031510000);
INSERT INTO international VALUES (664,'WebGUI',2,'Wobject l�schen',1031510000);
INSERT INTO international VALUES (640,'WebGUI',2,'Es ist nicht sinnvoll Vorlagen zu l�schen, da man nie wei�, welche ung�nstige Auswirkung es auf die Seite haben kann (manche Seiten nutzen diese Vorlage eventuell noch). Wenn Sie eine Vorlage l�schen, werden alle Seiten, die diese Vorlage noch benutzen, auf die Standardcorlage gesetzt.',1031510000);
INSERT INTO international VALUES (7,'Product',2,'Produktgrafik 3',1031510000);
INSERT INTO international VALUES (526,'WebGUI',2,'nur JavaScript entfernen',1031510000);
INSERT INTO international VALUES (547,'WebGUI',2,'Hauptgruppe',1031510000);
INSERT INTO international VALUES (552,'WebGUI',2,'Ausstehend',1031510000);
INSERT INTO international VALUES (551,'WebGUI',2,'Notiz/Bemerkung',1031510000);
INSERT INTO international VALUES (550,'WebGUI',2,'Gruppe von Grafiken ansehen',1031510000);
INSERT INTO international VALUES (542,'WebGUI',2,'Vorhergerige(r)',1031510000);
INSERT INTO international VALUES (55,'Product',2,'Gewinn (benefit) hinzuf�gen',1031510000);
INSERT INTO international VALUES (549,'WebGUI',2,'Beschreibung der Gruppe',1031510000);
INSERT INTO international VALUES (548,'WebGUI',2,'Gruppenname',1031510000);
INSERT INTO international VALUES (539,'WebGUI',2,'\'Karma\' aktivieren?',1031510000);
INSERT INTO international VALUES (546,'WebGUI',2,'Id der Gruppe',1031510000);
INSERT INTO international VALUES (545,'WebGUI',2,'Gruppe von Grafiken bearbeiten',1031510000);
INSERT INTO international VALUES (535,'WebGUI',2,'Group To Alert On New User',1031510000);
INSERT INTO international VALUES (534,'WebGUI',2,'Bei neuem Benutzer benachrichtigen?',1031510000);
INSERT INTO international VALUES (536,'WebGUI',2,'Ein neuer Nebutzer mit dem Namen ^@, hat die Seite betreten',1031510000);
INSERT INTO international VALUES (544,'WebGUI',2,'Sind Sie sich sicher, dass Sie diese Gruppe l�schen m�chten?',1031510000);
INSERT INTO international VALUES (543,'WebGUI',2,'neue Gruppe von Bildern hinzuf�gen',1031510000);
INSERT INTO international VALUES (541,'WebGUI',2,'Karma Per Post',1031510000);
INSERT INTO international VALUES (537,'WebGUI',2,'Karma',1031510000);
INSERT INTO international VALUES (540,'WebGUI',2,'Karma Per Login',1031510000);
INSERT INTO international VALUES (54,'Product',2,'Gewinne (benefits)',1031510000);
INSERT INTO international VALUES (533,'WebGUI',2,'ohne die W�rter',1031510000);
INSERT INTO international VALUES (525,'WebGUI',2,'inhaltliche Einstellungen bearbeiten',1031510000);
INSERT INTO international VALUES (522,'WebGUI',2,'Ich m�chte �ber ICQ benachrichtigt werden.',1031510000);
INSERT INTO international VALUES (527,'WebGUI',2,'Standard Startseite',1031510000);
INSERT INTO international VALUES (528,'WebGUI',2,'Name der Vorlage',1031510000);
INSERT INTO international VALUES (523,'WebGUI',2,'Benachrichtigung',1031510000);
INSERT INTO international VALUES (38,'Product',2,'Produkt hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (532,'WebGUI',2,'mit mindestens einem der W�rter',1031510000);
INSERT INTO international VALUES (36,'Product',2,'Zubeh�r hinzuf�gen',1031510000);
INSERT INTO international VALUES (531,'WebGUI',2,'mit genau dem Satz',1031510000);
INSERT INTO international VALUES (530,'WebGUI',2,'mit all diesen W�rtern',1031510000);
INSERT INTO international VALUES (433,'WebGUI',2,'Benutzeragent',1031510000);
INSERT INTO international VALUES (53,'USS',2,'Layout',1031510000);
INSERT INTO international VALUES (31,'Product',2,'Spezifikationen',1031510000);
INSERT INTO international VALUES (53,'Product',2,'Gewinn (benefit) bearbeiten',1031510000);
INSERT INTO international VALUES (30,'Product',2,'Eigenschaften',1031510000);
INSERT INTO international VALUES (3,'MailForm',2,'Vielen Dank f�r Ihren Beitrag!',1031510000);
INSERT INTO international VALUES (29,'Product',2,'Einheiten',1031510000);
INSERT INTO international VALUES (28,'Product',2,'Eine weitere Spezifikation hinzuf�gen?',1031510000);
INSERT INTO international VALUES (3,'Product',2,'Sind Sie sich sicher, dass Sie diese Eigenschaft l�schen m�chten?',1031510000);
INSERT INTO international VALUES (382,'WebGUI',2,'Grafik bearbeiten',1031510000);
INSERT INTO international VALUES (32,'Product',2,'Zubeh�r',1031510000);
INSERT INTO international VALUES (33,'Product',2,'Verwandte Produkte',1031510000);
INSERT INTO international VALUES (34,'Product',2,'Eine Eigenschaft hinzuf�gen',1031510000);
INSERT INTO international VALUES (61,'USS',2,'Benutzerbeitragssystem hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'SiteMap',2,'Site Map/�bersicht hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'SQLReport',2,'SQL Bericht hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'Product',2,'Produktvorlage',1031510000);
INSERT INTO international VALUES (61,'Poll',2,'Abstimmung hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'MessageBoard',2,'\'Diskussionsforum\' hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'LinkList',2,'Linkliste hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'Item',2,'Posten hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'FAQ',2,'FAQ hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'ExtraColumn',2,'zus�tzliche Spalte hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'EventsCalendar',2,'Ereigniskalender hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'FileManager',2,'Download Manager hinzuf�gen/bearebiten',1031510000);
INSERT INTO international VALUES (61,'Article',2,'Artikel hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (61,'MailForm',2,'Emailformular hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (60,'Product',2,'Vorlage',1031510000);
INSERT INTO international VALUES (6,'Product',2,'Produkt bearbeiten',1031510000);
INSERT INTO international VALUES (6,'MailForm',2,'ver�nderbar',1031510000);
INSERT INTO international VALUES (6,'Item',2,'Posten bearbeiten',1031510000);
INSERT INTO international VALUES (597,'WebGUI',2,'�bersetzung bearbeiten',1031510000);
INSERT INTO international VALUES (596,'WebGUI',2,'fehlende �bersetzung',1031510000);
INSERT INTO international VALUES (598,'WebGUI',2,'Sprache bearbeiten',1031510000);
INSERT INTO international VALUES (594,'WebGUI',2,'�bersetzen',1031510000);
INSERT INTO international VALUES (593,'WebGUI',2,'�bersetzung zu Plain Black �bermitteln',1031510000);
INSERT INTO international VALUES (592,'WebGUI',2,'Zeichensatz',1031510000);
INSERT INTO international VALUES (591,'WebGUI',2,'Sprache',1031510000);
INSERT INTO international VALUES (590,'WebGUI',2,'ID der Sprache',1031510000);
INSERT INTO international VALUES (595,'WebGUI',2,'�bersetzungen',1031510000);
INSERT INTO international VALUES (59,'Product',2,'Name',1031510000);
INSERT INTO international VALUES (589,'WebGUI',2,'Sprache bearbeiten',1031510000);
INSERT INTO international VALUES (588,'WebGUI',2,'Sind Sie sich sicher, dass Sie diese �bersetzung an Plain Black zur Einbeziehung in die Standardverteilung �bermitteln wollen?\r\nWenn Sie den \'Ja\'-Link anklicken, erkl�ren Sie sich damit einverstanden, dass Sie Plain Black eine unbeschr�nkte Lizenz zur Verwendung der �bersetzung in seiner Softwareverteilung geben.',1031510000);
INSERT INTO international VALUES (587,'WebGUI',2,'Sind Sie sich sicher, dass Sie diese Sprache und somit auch alle damit verbundene internationale und Hilfe -Nachrichten l�schen m�chten?',1031510000);
INSERT INTO international VALUES (586,'WebGUI',2,'Sprachen',1031510000);
INSERT INTO international VALUES (585,'WebGUI',2,'�bersetzungen bearbeiten',1031510000);
INSERT INTO international VALUES (584,'WebGUI',2,'Eine neue Sprache hinzuf�gen.',1031510000);
INSERT INTO international VALUES (35,'Product',2,'Spezifikation hinzuf�gen',1031510000);
INSERT INTO international VALUES (654,'WebGUI',2,'Gestaltung l�schen',1031510000);
INSERT INTO international VALUES (581,'WebGUI',2,'neuen Wert hinzuf�gen',1031510000);
INSERT INTO international VALUES (642,'WebGUI',2,'Seite hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (62,'Product',2,'Produktvorlage hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (62,'MailForm',2,'Emailformularfelder hinzuf�gen oder bearbeiten',1031510000);
INSERT INTO international VALUES (605,'WebGUI',2,'Gruppen hinzuf�gen',1031510000);
INSERT INTO international VALUES (59,'USS',2,'n�chster Beitrag',1031510000);
INSERT INTO international VALUES (583,'WebGUI',2,'maximale Gr��e einer Grafik',1031510000);
INSERT INTO international VALUES (582,'WebGUI',2,'freilassen',1031510000);
INSERT INTO international VALUES (580,'WebGUI',2,'Ihre Nachricht wurde abgelehnt.',1031510000);
INSERT INTO international VALUES (58,'USS',2,'vorheriger Beitrag',1031510000);
INSERT INTO international VALUES (58,'Product',2,'Produktvorlage bearbeiten',1031510000);
INSERT INTO international VALUES (579,'WebGUI',2,'Ihre Nachricht wurde akzeptiert.',1031510000);
INSERT INTO international VALUES (576,'WebGUI',2,'L�schen',1031510000);
INSERT INTO international VALUES (575,'WebGUI',2,'Bearbeiten',1031510000);
INSERT INTO international VALUES (57,'USS',2,'Antworten',1031510000);
INSERT INTO international VALUES (57,'Product',2,'Sind Sie sich sicher, dass Sie diese Vorlage l�schen nud alle Produkte, die sie benutzen auf die Standardvorlage setzen m�chten?',1031510000);
INSERT INTO international VALUES (569,'WebGUI',2,'Moderationsart',1031510000);
INSERT INTO international VALUES (56,'Product',2,'Eine Produktvorlage hinzuf�gen.',1031510000);
INSERT INTO international VALUES (557,'WebGUI',2,'Beschreibung',1031510000);
INSERT INTO international VALUES (556,'WebGUI',2,'Betrag',1031510000);
INSERT INTO international VALUES (553,'WebGUI',2,'Status',1031510000);
INSERT INTO international VALUES (529,'WebGUI',2,'Ergebnisse',1031510000);
INSERT INTO international VALUES (588,'WebGUI',1,'Are you certain you wish to submit this translation to Plain Black for inclusion in the official distribution of WebGUI? By clicking on the yes link you understand that you\'re giving Plain Black an unlimited license to use the translation in its software distributions.',1031514630);
INSERT INTO international VALUES (593,'WebGUI',1,'Submit translation.',1031514223);
INSERT INTO international VALUES (594,'WebGUI',1,'Translate messages.',1031514314);
INSERT INTO international VALUES (61,'USS',1,'User Submission System, Add/Edit',1031517089);
INSERT INTO international VALUES (71,'USS',1,'User Submission Systems are a great way to add a sense of community to any site as well as get free content from your users.\r\n<br><br>\r\n\r\n<b>Layout</b><br>\r\nWhat should this user submission system look like? Currently these are the views available:\r\n<ul>\r\n<li><b>Traditional</b> - Creates a simple spreadsheet style table that lists off each submission and is sorted by date. \r\n</li>\r\n<li><b>Web Log</b> - Creates a view that looks like the news site <a href=\"http://slashdot.org/\">Slashdot</a>. Incidentally, Slashdot invented the web log format, which has since become very popular on news oriented sites. To limit the amount of the article shown on the main page, place the separator macro ^-; where you\'d like the front page content to stop.\r\n</li>\r\n<li><b>Photo Gallery</b> - Creates a matrix of thumbnails that can be clicked on to view the full image.\r\n</li></ul>\r\n\r\n<b>Who can approve?</b><br>\r\nWhat group is allowed to approve and deny content?\r\n<br><br>\r\n\r\n<b>Who can contribute?</b><br>\r\nWhat group is allowed to contribute content?\r\n<br><br>\r\n\r\n<b>Submissions Per Page</b><br>\r\nHow many submissions should be listed per page in the submissions index?\r\n<br><br>\r\n\r\n<b>Default Status</b><br>\r\nShould submissions be set to <i>Approved</i>, <i>Pending</i>, or <i>Denied</i> by default?\r\n<br><br>\r\n<i>Note:</i> If you set the default status to Pending, then be prepared to monitor your message log for new submissions.\r\n<p>\r\n\r\n<b>Karma Per Submission</b><br>\r\nHow much karma should be given to a user when they contribute to this user submission system?\r\n<p>\r\n\r\n\r\n<b>Display thumbnails?</b><br>\r\nIf there is an image present in the submission, the thumbnail will be displayed in the Layout (see above).\r\n<p>\r\n\r\n<b>Allow discussion?</b><br>\r\nDo you wish to attach a discussion to this user submission system? If you do, users will be able to comment on each submission.\r\n<p>\r\n\r\n<b>Who can post?</b><br>\r\nSelect the group that is allowed to post to this discussion.\r\n<p>\r\n\r\n<b>Edit Timeout</b><br>\r\nHow long should a user be able to edit their post before editing is locked to them?\r\n<p>\r\n<i>Note:</i> Don\'t set this limit too high. One of the great things about discussions is that they are an accurate record of who said what. If you allow editing for a long time, then a user has a chance to go back and change his/her mind a long time after the original statement was made.\r\n<p>\r\n\r\n<b>Karma Per Post</b><br>\r\nHow much karma should be given to a user when they post to this discussion?\r\n<p>\r\n\r\n<b>Who can moderate?</b><br>\r\nSelect the group that is allowed to moderate this discussion.\r\n<p>\r\n\r\n<b>Moderation Type?</b><br>\r\nYou can select what type of moderation you\'d like for your users. <i>After-the-fact</i> means that when a user posts a message it is displayed publically right away. <i>Pre-emptive</i> means that a moderator must preview and approve users posts before allowing them to be publically visible. Alerts for new posts will automatically show up in the moderator\'s WebGUI Inbox.\r\n<p>\r\nNote: In both types of moderation the moderator can always edit or delete the messages posted by your users.\r\n<p>\r\n',1031517089);
INSERT INTO international VALUES (722,'WebGUI',1,'Id',1031517195);
INSERT INTO international VALUES (721,'WebGUI',1,'Namespace',1031515005);
INSERT INTO international VALUES (720,'WebGUI',1,'OK',1031514777);
INSERT INTO international VALUES (719,'WebGUI',1,'Out of Date',1031514679);
INSERT INTO international VALUES (718,'WebGUI',1,'Export translation.',1031514184);
INSERT INTO international VALUES (12,'Poll',1,'Total Votes:',1031514049);
INSERT INTO international VALUES (12,'Poll',7,'��ͶƱ����:',1031514049);
INSERT INTO international VALUES (723,'WebGUI',1,'Deprecated',1031800566);
INSERT INTO international VALUES (727,'WebGUI',1,'Your password cannot be \"password\".',1031880154);
INSERT INTO international VALUES (725,'WebGUI',1,'Your username cannot be blank.',1031879612);
INSERT INTO international VALUES (724,'WebGUI',1,'Your username cannot begin or end with a space.',1031879593);
INSERT INTO international VALUES (726,'WebGUI',1,'Your password cannot be blank.',1031879567);
INSERT INTO international VALUES (727,'WebGUI',6,'Ditt l�senord kan inte vara \"l�senord\".',1032262393);
INSERT INTO international VALUES (726,'WebGUI',6,'Du m�ste fylla i ett l�senord.',1032262370);
INSERT INTO international VALUES (725,'WebGUI',6,'Du m�ste fylla i ett anv�ndarnamn.',1032262345);
INSERT INTO international VALUES (724,'WebGUI',6,'Ditt anv�ndarnamn kan inte b�rja eller sluta med ett mellanslag.',1032262328);
INSERT INTO international VALUES (12,'Poll',6,'Totalt antal r�ster:',1032262302);
INSERT INTO international VALUES (723,'WebGUI',6,'F�r�ldrat',1032262278);
INSERT INTO international VALUES (63,'Product',6,'Produktmallar anv�nds f�r att kontrollera hur din produkt presenteras f�r anv�ndarna. Detta fungerar p� liknande s�tt som �vriga mallar till WebGUI. Det finns n�gra referensmallar f�r att ge dig en snabbstart, men det b�sta �r �nd� att skapa ett utseende som passar din produkt.\r\n\r\nTroligtvis beh�ver du inte anv�nda alla f�lt som WebGUI\'s produkthanterare tillhandah�ller. Ta bort on�diga f�lt n�r du skapar en ny mall f�r att f� sidorna att ladda snabbare.\r\n\r\n<b>Note:</b> Du b�r inte �ndra standardmallarna utan ist�llet g�ra kopior av dom. Vid WebGUI uppgraderingar skrivs standardmallarna �ver med nya uppdaterade vilket tar bort dina �ndringar. Kopior r�rs inte av en uppgradering.\r\n\r\nDet finns m�nga special-macros att anv�nda i dina produktmallar.\r\n\r\n<b>^Product_Accessories;</b>\r\nVisar en lista p� tillbeh�r till produkten.\r\n\r\n<b>^Product_Benefits;</b>\r\nVisar en lista p� f�rdelar med produkten.\r\n\r\n<b>^Product_Description;</b>\r\nVisar en produkts beskrivning.\r\n\r\n<b>^Product_Features;</b>\r\nVisar en lista p� produktens egenskaper.\r\n\r\n<b>^Product_Image1;</b>\r\nVisar den f�rsta bilden du laddade upp (om det finns n�gon).\r\n\r\n<b>^Product_Image2;</b>\r\nVisar den andra bilden du laddade upp (om det finns n�gon).\r\n\r\n<b>^Product_Image3;</b>\r\nVisar den tredje bilden du laddade upp (om det finns n�gon).\r\n\r\n<b>^Product_Number;</b>\r\nVisar produktens nummer.\r\n\r\n<b>^Product_Price;</b>\r\nVisar produktens pris.\r\n\r\n<b>^Product_Related;</b>\r\nVisar en lista p� relaterade produkter.\r\n\r\n<b>^Product_Specifications;</b>\r\nVisar en lista p� produktens specifikationer.\r\n\r\n<b>^Product_Thumbnail1;</b>\r\nVisar en miniatyrbild av den den f�rsta bilden du laddade upp till produkten (om du gjorde det) tillsammans med en l�nk till bilden i full storlek.\r\n\r\n<b>^Product_Thumbnail2;</b>\r\nVisar en miniatyrbild av den den andra bilden du laddade upp till produkten (om du gjorde det) tillsammans med en l�nk till bilden i full storlek.\r\n\r\n<b>^Product_Thumbnail3;</b>\r\nVisar en miniatyrbild av den den tredje bilden du laddade upp till produkten (om du gjorde det) tillsammans med en l�nk till bilden i full storlek.\r\n\r\n<b>^Product_Title;</b>\r\nVisar produktens titel. Om du anv�nder det h�r macrot vill du antagligen st�nga av visning av standardtitel genom att v�lja Nej p� Visa titel-f�ltet.',1032260807);
INSERT INTO international VALUES (678,'WebGUI',6,'Bassidor, hantera',1032260722);
INSERT INTO international VALUES (497,'WebGUI',6,'Startdatum',1032259765);
INSERT INTO international VALUES (6,'WobjectProxy',6,'Men wobject proxy kan du spegla ett wobject fr�n en annan sida till vilken annan sida som helst. Det �r anv�ndbart n�r du vill �teranv�nda inneh�ll fr�n en sektion av webbplatsen till en annan.\r\n\r\n<b>Wobject till proxy</b>\r\nV�lj ett wobject fr�n ditt system som du vill proxya. V�ljrutan visar inneh�ll som \"Sidtitel / Wobject namn (Wobject-ID)\" s� att du snabbt och enkelt kan hitta det wobject du letar efter.',1032257192);
INSERT INTO international VALUES (5,'WobjectProxy',6,'Wobject Proxy, l�gg till/redigera',1032256964);
INSERT INTO international VALUES (4,'WobjectProxy',6,'Wobject proxying misslyckades. Kanske det proxiade wobjectet har blivit borttaget?',1032256949);
INSERT INTO international VALUES (3,'WobjectProxy',6,'Wobject Proxy',1032256918);
INSERT INTO international VALUES (2,'WobjectProxy',6,'Redigera wobject proxy',1032256908);
INSERT INTO international VALUES (1,'WobjectProxy',6,'Wobject till Proxy',1032256896);
INSERT INTO international VALUES (709,'WebGUI',6,'<b>Bildhanteringsgrupp</b>\r\nV�lj en grupp som ska ha kontroll �ver till�gg, redigering och borttagning av bilder.\r\n\r\n<b>Stilhanteringsgrupp</b>\r\nV�lj en grupp som ska ha kontroll �ver till�gg, redigering och borttagning av stilar.\r\n\r\n<b>Mallhanteringsgrupp</b>\r\nV�lj en grupp som ska ha kontroll �ver till�gg, redigering och borttagning av mallar.',1032256879);
INSERT INTO international VALUES (698,'WebGUI',6,'Karma �r en metod f�r att m�ta en anv�ndares aktivitet och eventuellt bel�na eller bestraffa denne beroende p� aktivitetsniv�. N�r v�l karma �r p�slaget kommer du m�rka att m�nga saker i WebGUI �ndras f�r att visa karma.\r\n\r\nDu kan m�ta om anv�ndarna loggar in och hur mycket de bidrar med till din webbplats. Du kan till�ta dem att komma �t material baserat p� deras karma-niv�.\r\n\r\nDu kan l�sa mer om karma i online-boken Ruling WebGUI.',1032256794);
INSERT INTO international VALUES (651,'WebGUI',6,'Om du v�ljer att t�mma skr�pkorgen kommer alla saker i den att f�rsvinna. Om du �r os�ker p� vissa saker kan du klippa ut dom till klippbordet innan du t�mmer skr�pkorgen.',1032256602);
INSERT INTO international VALUES (641,'WebGUI',6,'Bildgrupper �r som mappar som hj�lper dig organisera dina bilder. Du beh�ver inte anv�nda grupper men p� st�rre webbplatser kan det definitivt vara anv�ndbart.\r\n\r\n<b>Gruppnamn</b>\r\nNamnet p� gruppen som kommer visas n�r du bl�ddrar bland bilderna.\r\n\r\n<b>Gruppbeskriving</b>\r\nEn kort beskrivning av vilken typ av bilder denna gruppen �r avsedd f�r.',1032256078);
INSERT INTO international VALUES (640,'WebGUI',6,'Det �r inte en god id� att ta bort mallar eftersom du inte vet vilka f�ljdverkningar det kan f� p� din webbplats (vissa sidor kan fortfarande anv�nda mallen). Om du verkligen vill ta bort en mall kommer alla sidor som anv�nder den att byta till standard-mallen',1032255575);
INSERT INTO international VALUES (639,'WebGUI',6,'<b>Mallnamn</b>\r\nGe den h�r mallen ett beskrivande namn s� att du vet hur den ser ut n�r du applicerar den p� en sida.\r\n\r\n<b>Mall</b>\r\nSkapa en mall genom att placera special macron ^0; ^1; ^2; osv p� de positioner du vill ska ha inneh�ll. Vanligtvis s� anv�nds en tabell f�r att positionera inneh�llet. Titta g�rna p� mallarna som kommer med WebGUI f�r id�er.',1032255389);
INSERT INTO international VALUES (638,'WebGUI',6,'Mallar anv�nds f�r att p�verka hur sidor ser ut i WebGUI. Till exempel s� har de flesta webbplatser idag mer �n bara en meny och ett stort textf�lt. M�nga anv�nder tre eller fyra kolumner som b�rjar med kolumnhuvuden och/eller banners. WebGUI till�ter mycket komplexa designer genom att anv�nda mallar. Det finns flera mallar med WebGUI som kan hj�lpa dig komma ig�ng, men du kan �ven skapa hur m�nga egna du vill.',1032255225);
INSERT INTO international VALUES (637,'WebGUI',6,'<b>F�rnamn</b>\r\nSj�lvf�rklarande.\r\n\r\n<b>Mellannamn</b>\r\nSj�lvf�rklarande.\r\n\r\n<b>Efternamn</b>\r\nSj�lvf�rklarande.\r\n\r\n<b>E-postadress</b>\r\nAnv�ndarens e-postadress. Beh�vs bara matas in om anv�ndaren kommer delta i funktioner som kr�ver e-post.\r\n\r\n<b>ICQ UIN</b>\r\nUnikt nummer f�r att kontakta en person via <a href=\"http://www.icq.com/\">ICQ</a>.\r\n\r\n<b>AIM Id</b>\r\nKonto-ID f�r <a href=\"http://www.aim.com/\">AOL Instant Messenger</a>.\r\n\r\n<b>MSN Messenger Id</b>\r\nKonto-ID f�r <a href=\"http://messenger.msn.com/\">Microsoft Network Instant Messenger</a>.\r\n\r\n<b>Yahoo! Messenger Id</b>\r\nKonto-ID f�r <a href=\"http://messenger.yahoo.com/\">Yahoo! Instant Messenger</a>.\r\n\r\n<b>Mobiltelefon</b>\r\nNumret till anv�ndarens mobiltelefon.\r\n\r\n<b>S�kare</b>\r\nNumret till anv�ndarens s�kare.\r\n\r\n<b>E-post till s�kar-gateway</b>\r\nE-postadress f�r anv�ndarens texts�kare.\r\n\r\n<b>Heminformation</b>\r\nPost- eller gatuadress till anv�ndaren.\r\n\r\n<b>Arbetsplatsinformation</b>\r\nPost- eller gatuadress till anv�ndarens arbetsplats.\r\n\r\n<b>K�n</b>\r\nMan, kvinna eller annat?\r\n\r\n<b>F�delsedatum</b>\r\nN�r �r anv�ndaren f�dd?\r\n\r\n<b>Spr�k</b>\r\nVilket spr�k skall anv�ndas i WebGUI?\r\n\r\n<b>Tidsoffset</b>\r\nAntal timmar (plus eller minus) som anv�ndaren befinner sig relativt till tidszonen servern befinner sig i. Detta anv�nds f�r tidszon-justeringar.\r\n\r\n<b>F�rsta dag i veckan</b>\r\nVilken r�knas som veckans f�rsta dag enligt denna anv�ndarens kalender? Till exempel s� b�rjar veckan p� en S�ndag i F�renta Staterna, medan i Europa den oftast b�rjar p� M�ndag.\r\n\r\n<b>Datumformat</b>\r\nVilket format ska datum synas p�?\r\n\r\n<b>Tidsformat</b>\r\nVilket format ska tiden synas p�?\r\n\r\n<b>Diskussionsforumslayout</b>\r\nSka diskussionsgrupper synas som platta eller tr�dade? Platta visar alla svar p� inl�gg i en l�ng lista efter n�r de skapades. En tr�dad visar en hierarkisk lista med svar sorterad efter inl�ggstiden.\r\n\r\n<b>Inkorgsnotifikation</b>\r\nHur ska en anv�ndare bli meddelad n�r de f�r ett nytt WebGUI-meddelande?\r\n',1032254909);
INSERT INTO international VALUES (636,'WebGUI',6,'F�r att skapa ett nytt paket kan du f�lja dessa enkla steg:\r\n<ol type=\"1\">\r\n  <li>Fr�n administrationsmenyn v�ljer du \"Hantera paket\"</li>\r\n  <li>L�gg till en sida och ge den ett namn. Namnet p� sidan kommer ocks� ge namn till paketet.</li>\r\n  <li>G� till den nya sidan du skapade och l�gg till sidor och wobjects. Alla sidor och wobjects du skapar kommer skapas p� nytt n�r du drifts�tter paketet.</li>\r\n</ol>\r\n\r\n<b>Note:</b> F�r att l�gga till, redigera eller ta bort paket m�ste du vara medlem i pakethantereringsgruppen eller administrat�rsgruppen. \r\n\r\nOm du l�gger till inneh�ll i wobjects kommer dessa automatiskt att kopieras �ver till nya paket.\r\n\r\nPrivilegier och stilar p� sidor i paketet kommer inte kopieras n�r paketet tas i drift. Ist�llet kommer sidorna f� �rva r�ttigheter och stil beroende p� platsen de l�ggs p�.',1032252658);
INSERT INTO international VALUES (635,'WebGUI',6,'Paket �r grupper av sidor och wobjects som �r f�rvalda att s�ttas i drift tillsammans, som en enhet. En pakethanterare kan se nyttan att skapa ett paket med ett flertal sidor med funktioner som meddelandeforum, FAQ, r�stning, eftersom detta g�rs ganska ofta. Paket anv�nds ofta f�r att minska problem med upprepande jobb.\r\n\r\nEtt paket som m�nga anv�ndare skapar �r Sida/Artikel-paket. Det �r ofta s� att du l�gger till en sida och d�refter en artikel f�r inneh�ll. Ist�llet f�r att g� alla steg f�r att skapa en sida, g� till sidan och sedan l�gga till en artikel till sidan kan du skapa ett paket f�r att g�ra alla steg p� en g�ng.',1032251795);
INSERT INTO international VALUES (634,'WebGUI',6,'<b>Standard startsida</b>\r\nM�nga sm� webbplatser har inte en dedikerad startsida utan anv�nder en av deras underliggande sidor som \"Om oss\" eller \"F�retagsinformation\". P� grund av detta kan du sj�lv s�tta startsidan till vilken sida som helst inom webbplatsen. Det �r den sidan bes�karna kommer till om de skriver in http://www.minwebplats.nu eller om de klickar p� en l�nk genererad av ^H; macrot.\r\n\r\n<b>Not Found sida</b>\r\nOm en sida som bes�karen efterfr�gar inte finns i systemet kan anv�ndaren bli omdirigerad till startsidan eller till en felsida d�r de kan f�rs�ka hitta det de letar efter. Du v�ljer sj�lv hur du tror dina bes�kare vill ha det.\r\n\r\n<b>Dokumenttypsdeklaration</b>\r\nIdag finns det en m�ngd olika webbl�sare som kan bes�ka din webbplats. �ven automatiserade webbl�sare som s�kmotorssprindlar. M�nga webbl�sare vill veta vilken typ av dokument du skickar och i dokumenttypsdeklarationen kan du skriva ut just detta. Som standard genererar WebGUI HTML 4.0 inneh�ll.\r\n\r\n<b>L�gg till redigeringsm�rkning p� inl�gg</b>\r\nVanligtvis n�r en anv�ndare redigerar ett inl�gg p� ett meddelandeforum s� l�ggs det till en m�rkning som visar vem som redigerade och vilken tid. P� vissa webbplatser �r s�n information inte viktig och kan d�rf�r st�ngas av h�r.\r\n\r\n<b>Filtrera bidragen HTML</b>\r\nOm du har en publik webbplats d�r vem som helst kan posta meddelanden till meddelandeforum och dylikt s� �r det ofta en god id� att filtrera deras inneh�ll fr�n \"elak\" data. Elak data kan vara s�nt som hindrar eller f�rsv�rar f�r andra bes�kare att bes�ka din webbplats och ta del av dess inneh�ll. Anv�nd detta val f�r att v�lja en filtreringsniv�.\r\n\r\n<b>Maximal bilagestorlek</b>\r\nStorlek (i kilobyte) f�r maximal bilaga.\r\n\r\n<b>Maximal bildstorlek</b>\r\nOm bilder laddas upp till din webbplats som �r st�rre �n maximal bildstorlek kommer dessa att skalas ner. Bildstorleken m�ts i pixlar och anv�nder den l�ngsta sidan p� bilden f�r att avg�ra om gr�nsen �r n�dd.\r\n\r\n<b>Miniatyrbildsstorlek</b>\r\nN�r bilder laddas upp till webbplatsen kommer det automatiskt att skapas miniatyrbilder av dessa i storleken du v�ljer h�r. Storleken m�ts i pixlar och den l�ngsta sidan kommer aldrig vara st�rre �n du anger h�r.\r\n\r\n<b>Textomr�de, antal rader</b>\r\nVissa webbplatser vill kontrollera storleken p� formul�r som WebGUI genererar. Det �r just vad du kan g�ra h�r. V�lj hur m�nga rader text som skall visas.\r\n\r\n<b>Textomr�de, antal kolumner</b>\r\nPrecis som innan, fast h�r v�ljer du antal tecken p� varje rad (kolumner).\r\n\r\n<b>Textrutestorlek</b>\r\nSamma som ovan, fast med textrutor.\r\n\r\n<b>Editor att anv�nda</b>\r\nWebGUI har en mycket sofistikerad \"Rich Editor\" som l�ter anv�ndare formatera inneh�ll som i Microsoft Word, eller annan likv�rdig ordbehandlare. F�r att anv�nda den funktionalliteten v�ljer du \"Inbyggd redigerare\". Vissa webbplatser kan ha behov av en mer komplett redigerare med st�d f�r saker som r�ttstavning osv. D�rf�r kan du installera en tredjeparts editor som heter Real Objects Edit-On Pro�. Efter den �r installerad kan du �ndra det h�r valet. Vill du ha mer detaljerade instruktioner p� hur du integrerar Edit-On Pro� kan du hitta information i online-boken \"Ruling WebGUI\".',1032251553);
INSERT INTO international VALUES (633,'WebGUI',6,'F�r att uttrycka det enkelt s� �r r�tter hemsidor utan f�r�ldrar (utan ovanliggande sidor). Den viktigaste sidan i WebGUI �r helt klart \"Hem\"-sidan. M�nga m�nniskor kommer aldrig att l�gga till fler r�tter till sina hemsidor och det g�r helt klart att klara sig med en rot. Vissa skapar r�tter f�r inneh�llshanterare, eller kanske en g�mt omr�de f�r administrationsverktig. ',1032189185);
INSERT INTO international VALUES (632,'WebGUI',6,'Du kan l�gga till wobjects genom att v�lja <i>L�gg till inneh�ll...</i> fr�n menyn l�ngst upp p� sidan (adminstrationsmenyn). Du kan redigera dom genom att klicka p� <i>Redigera</i>-knappen som finns strax �ver wobjectet du vill redigera.\r\n\r\nN�stan alla wobject delar p� vissa egenskaper:\r\n\r\n<b>Wobject-ID</b>\r\nDetta �r en unik identifierare f�r ett wobject. Normalt beh�ver inte anv�ndare bry sig om detta, men avancerade anv�ndare kan anv�nda id-numret f�r SQL-rapporter och annat.\r\n\r\n<b>Titel</b>\r\nTitel p� wobject. Detta visas vanligtvis ovanf�r varje wobject.\r\n\r\n<i>Note:</i> Du ska alltid v�lja en titel �ven om du inte ska visa den eftersom det �r genom titeln du kan identifiera inneh�ll i skr�pkorgen och klippbordet.\r\n\r\n<b>Visa titel?</b>\r\nVill du visa titeln du valt? Detta �r inte n�dv�ndigt p� alla webbplatser.\r\n\r\n<b>K�r macros?</b>\r\nVill du k�ra macros p� inneh�llet i detta wobject? Ibland vill du g�ra detta, men vet du om att du inte har macros i texten eller p� andra st�llen i ditt wobject s� kan du st�nga av denna funktionen f�r att sidorna ska laddas snabbare.\r\n\r\n<b>Mallposition</b>\r\nMallpositionen varierar mellan 0 (null) och upp�t. Hur m�nga som finns beror p� vilken mall som anv�nds p� sidan. Standardmallen har bara en position, andra kan ha fler. Genom att v�lja en mallposition s� v�ljer du var p� mallen du vill att wobjectet skall hamna.\r\n\r\n<b>Startdatum</b>\r\nP� vilket datum ska inneh�llet visas f�r anv�ndaren? Innan detta datum kommer objektet bara vara synligt f�r inneh�llshanterare.\r\n\r\n<b>Slutdatum</b>\r\nVilket datum ska sidan inte l�ngre vara synlig f�r anv�ndarna. Efter detta datum kommer objektet bara vara synligt f�r inneh�llshanterarna.\r\n\r\n<b>Beskrivning</b>\r\nEtt inneh�llsomr�de som du kan fylla med valfritt omr�de. Till exempel kan en f�rklaring av vad en FAQ �r i b�rjan p� en FAQ vara en bra id�.',1032187841);
INSERT INTO international VALUES (631,'WebGUI',6,'Du kan anv�nda WebGUI\'s inbyggda bildhanterare f�r att ladda upp bilder till en central plats p� servern eller p� annat st�lle p� webbplatsen utan n�gon speciell programvara eller kunskap. Du kan ocks� skapa bildgrupper f�r att organisera bilderna. F�r att g�ra s� klickar du p� \"Skapa ny grupp\".\r\n\r\nF�r att placera bilder du laddat upp kan du anv�nda macron som ^I(); samt ^i();. Mer information om dessa kan f�s i macro-hj�lpen.\r\n\r\n<i>Tip:</i> Du kan anv�nda ^I(); macrot p� platser du annars inte t�nkt p�. Till exempel kan du placera bilder i titeln p� dina wobejts. Eller i wobjects som l�nklista och webbplatskarta kan du anv�nda egna bilder fr�n bildhanteraren som kulor.',1032186885);
INSERT INTO international VALUES (630,'WebGUI',6,'WebGUI har en liten men p�litlig s�kmotor inbyggt. Vill du anv�nda den interna s�kmotor anv�nder du ^?; macrot eller genom att l�gg till <i>?op=search</i> p� slutet p� varje URL, eller g�ra din egen sida f�r att komma �t den.\r\n\r\nM�nga installationer beh�ver en s�kmotor f�r att indexera deras WebGUI webbplats eller har krav p� funktioner som inte WebGUI\'s s�kmotor st�djer. F�r dessa rekommenderar vi <a href=\"http://www.mnogosearch.org/\">MnoGo Search</a> eller <a href=\"http://www.htdig.org/\">ht://Dig</a>.',1032185821);
INSERT INTO international VALUES (629,'WebGUI',6,'<b>F�rhindra proxy-cachning</b>\r\nVisa f�retag har proxy-servrar som kan orsaka problem med WebGUI. Om du m�rker att du f�r problem med WebGUI, s� som att sidor inte uppdateras som dom ska, och du har en proxy-server s� kan du st�lla det h�r alternativet till Ja. WebGUI kommer inte vara lika anv�ndarv�nlig n�r du sl�r p� den h�r funktionen.\r\n\r\n<b>Vid kritiskt fel</b>\r\nVad vill du g�ra om ett kritiskt fel uppst�r. Det kan vara en s�kerhetsrisk att visa fels�kningsinformation, men du kan visa det s� l�nge systemet �r i utveckling.',1032185342);
INSERT INTO international VALUES (628,'WebGUI',6,'N�r du tar bort en bild kommer denna �ven tas bort fr�n servern och kan d�rf�r inte h�mtas tillbaka. Var mycket s�ker p� att du verkligen vill ta bort bilden innan du bekr�ftar att du vill forts�tta med borttagningen.',1032184610);
INSERT INTO international VALUES (627,'WebGUI',6,'Profiler anv�nds f�r att spara ut�kad information om en anv�ndare. I vissa fall kan profiler vara n�dv�ndiga f�r en webbplast, ibland inte. Profilsystemet �r fullst�ndigt utbyggbart med ny f�lt och grupperingar. Du kan l�gg till s� mycket information du vill om en anv�ndare.',1032184553);
INSERT INTO international VALUES (626,'WebGUI',6,'Wobjects (tidigare k�nda som Widgets) �r sj�lva styrkan i WebGUI. Wobjects �r sm� applikationer som g�r att plugga in i WebGUI. Meddelandeforum och r�stningar �r tv� exempel p� wobjects.\r\n\r\nF�r att l�agg till ett wobject till en sida s� g�r du f�rst till den sidan du vill att wobjecten ska synas p�. D�refter v�ljer du <i>L�gg till inneh�ll...</i> fr�n menyn l�ngst upp p� sk�rmen. Varje wobject har sin egen hj�lp-sida, s� �r det n�got du beh�ver hj�lp med s� �r det d�r du b�rjar leta.\r\n\r\n<i>Stilmallar:</i> Alla wobjects har en stilmallsklass och ID kopplat till sig.\r\n\r\nStilmallsklassen har order \"wobject\" i b�rjan plus vilken typ av wobject det �r. S� f�r en r�stning skulle stilmallen blir \"wobjectR�stning\". Stilen g�ller f�r samtliga wobject av den typen p� hela webbplatsen.\r\n\r\nStilmalls id kan anv�ndas f�r att bara p�verka ett viss wobject med en stilmallsklass. Formatet ska vara \"wobjectId\" plus Id f�r objektet i fr�ga. Om du har en artikel med wobject-id 94 s� ska en stilmallsklass se ut s�h�r: \"wobjectId94\". Detta p�verkar bara wobject med r�tt id-nummer.\r\n',1032184320);
INSERT INTO international VALUES (625,'WebGUI',6,'<b>Namn</b>\r\nEn etikett f�r denna bild som kommer anv�ndas f�r att h�mta bilden fr�n andra sidor.\r\n\r\n<b>Fil</b>\r\nV�lj en fil fr�n din lokala h�rddisk f�r uppladdning till servern.\r\n\r\n<b>Parametrar</b>\r\nL�gg till s� m�nga HTML img-tagg parametrar som du vill ha f�r denna bild.\r\n\r\n<i>Exempel:</i>\r\nalign=\"right\"\r\nalt=\"Bild p� hunden\"',1032183285);
INSERT INTO international VALUES (624,'WebGUI',6,'WebGUI macros anv�nds f�r att skapa dynamiskt inneh�ll bland statiskt inneh�ll. Till exempel s� kan anv�ndarnamnet f�r inloggad anv�ndare visas p� varje sida.\r\n\r\nMacros b�rjar alltid med \"^\", f�ljs alltid med minst ett tecken och avslutas alltid med \";\". Vissa macron kan konfigureras genom att man l�gger in en parameter. Ett vanlig macro kan skrivas: ^x; men med en paramater ser det ut som: ^x(\"parameter, vad du vill\");\r\n\r\nH�r f�ljer en beskrivning av samtliga macron i WebGUI.\r\n\r\n<b>^a; eller ^a(); - Mitt konto-l�nk</b>\r\nEn l�nk f�r att se din kontoinformation. Du kan �ndra l�nktexten genom att skriva macrot som <b>^a(\"Kontoinformation\");</b>.\r\n\r\n<i>Note:</i> Du kan anv�nda specialparametern linkonly (^a(linkonly)) f�r att bara skapa en URL till kontosidan och inget mer. .myAccountLink stilmallen �r knuten till detta macro.\r\n\r\n<b>^AdminBar;</b>\r\nPlacerar administrativa menyn p� sidan. Detta �r ett obligatoriskt macro i \"body\"-delen av stilhanteraren.\r\n\r\n<b>^AdminText();</b>\r\nVisar ett litet textmeddelande om en anv�ndare �r i administrationsl�ge. Exempel: ^AdminText(\"Du �r nu i administrationsl�ge\");.\r\n\r\n<b>^AdminToggle; eller ^AdminToggle();</b>\r\nPlacerar en l�nk p� sidan som bara �r synlig f�r inneh�llshanterare och administrat�rer. L�nken s�tter p�/st�nger av administrationsl�get. Du kan �ven v�lja andra namn p� l�nkarna genom att skriva ^AdminToggle(\"Redigera\",\"Visa\");.\r\n\r\n<b>^C; eller ^C(); - V�gsp�rning</b>\r\nVisar vilken v�g man g�tt genom webbplatsen i en hierarkisk struktur. Du kan sj�lv v�lja vilken avgr�nsare du vill ha mellan de olika sidorna genom att skriva ^C(::). Standard avgr�nsare �r \">\". \r\n\r\n<i>Note:</i> .crumbTrail stilklass anger hur den ser ut.\r\n\r\n<b>^c; - F�retagsnamn</b>\r\nNamnet p� ditt f�retag, angett av administrat�ren.\r\n\r\n<b>^D; eller ^D(); - Datum</b>\r\nTid just nu.\r\n\r\nDu kan sj�lv v�lja datumformat genom att anv�nda vissa symboler. ^D(\"%c %D, %y\"); skulle generera September 26, 2001. F�ljande format och symboler finns tillg�ngliga: \r\n\r\n%% % \r\n%y 4-siffrigt �rtal\r\n%Y 2-siffrigt �rtal\r\n%m 2-siffrig m�nad\r\n%M m�nad\r\n%c m�nadsnamn\r\n%d 2-siffrig m�nadsdag\r\n%D m�nadsdag\r\n%w namn p� veckodag\r\n%h 2-siffrig klocka bas 12 timmar\r\n%H klocka bas 12 timmar\r\n%j 2-siffrig klocka bas 24 timmar\r\n%J klocka bas 12 timmar\r\n%p gemen am/pm\r\n%P versal AM/PM\r\n%z anv�ndarinst�llt datumformat\r\n%Z anv�ndarinst�llt tidsformat\r\n\r\n<b>^e; - F�retagets e-postadress</b>\r\nE-postadressen som inst�lld av adminstrat�ren.\r\n\r\n<b>^Env();</b>\r\nAnv�nds f�r att visa serverns variabler. Du kan se alla serverns variabler genom att g� till \"www.dinwebplats.tld/env.pl\". Macrot ska skrivas som ^Env(\"REMOTE_ADDR\");.\r\n\r\n<b>^Execute();</b>\r\nTill�ter inneh�llshanterare eller administrat�r att k�ra ett externt program. Anv�nds vanligtvis som ^Execute(\"/this/file.sh\").\r\n\r\n<b>^Extras;</b>\r\nReturnera s�kv�gen till WebGUI \"extras\" mapp som inneh�ller saker som WebGUI ikoner.\r\n\r\n<b>^FlexMenu;</b>\r\nSkapar en expanderbar meny. Fungerar ungerf�r som tr�dstrukturen i Utforskaren p� en Windows-dator.\r\n\r\n<b>^FormParam();</b>\r\nAnv�nds oftast f�r att skapa dynamiska fr�gor genom SQL-rapporter. Genom att anv�nda det h�r macrot kan du f� v�rdet fr�n valfritt formul�rf�lt bara genom att anv�nda f�ltets namn. Exempel: ^FormParam(\"telefonnummer\"); \r\n\r\n<b>^GroupText();</b>\r\nVisar en kort text f�r anv�ndare som �r medlemmar i en specifik grupp. Exempel: ^GroupText(\"Visitors\",\"Du beh�ver ett konto f�r att anv�nda den h�r webbplatsen!\"); \r\n\r\n<b>^H; or ^H(); - Home Link</b>\r\nEn l�nk till webbplatsens f�rstasida. Du kan sj�lv v�lja l�nktexten genom att skicka med den som en parameter. Exempel: ^H(\"Hem\");. \r\n\r\n<i>Note:</i> Du kan �ven skriva ^H(linkonly); f�r att bara f� en URL till f�rstasidan. .homeLink stilklassen anv�nds f�r att �ndra utseende p� l�nken.\r\n\r\n<b>^I(); - Bild-tagg fr�n bildhanteraren</b>\r\nReturnerar en image-tag (HTML) till en bild definierad i bildhanteraren. V�lj vilken bild du vill ha genom att skicka namnet som parameter. Exempel: ^I(\"bildnamn\");. \r\n\r\n<b>^i(); - Image Manager Image Path</b>\r\nReturnera s�kv�gen till en bild som �r uppladdad via bildhanteraren. V�lj vilken bild du vill ha s�kv�gen till genom att skicka namnet som parameter. Exempel: ^i(\"bildnamn\");.\r\n\r\n<b>^Include();</b>\r\nL�ter administrat�r eller inneh�llshanterare att inkludera filer fr�n lokala filsystemet i HTML-dokumenten. Skicka dokumentets plats som parameter. Exempel: ^Include(\"/denna/filen.html\"); \r\n\r\n<b>^L; or ^L(); - Login</b>\r\nEtt litet inloggningsformul�r. Du kan best�mma hur bred rutan ska vara och �ven ett meddelande som ska visas efter anv�ndaren loggat in. F�r att best�mma storleken s� skriver man: ^L(20);. F�r att skriva ett meddelande som visas f�r anv�ndaren s� skriver man: ^L(20,Hej ^a(^@;);. Klicka %here% om du vill logga ut!) \r\n\r\n<i>Note:</i> .loginBox stilklassen best�mmer utseendet.\r\n\r\n<b>^LoginToggle; or ^LoginToggle();</b>\r\nVisar ett \"Logga in\"- eller \"Logga ut\"-meddelande beroende p� om man �r ut- eller inloggad. Du kan �ven v�lja andra texter genom att skriva s�h�r: ^LoginToggle(\"Klicka h�r f�r att logga in.\",\"Klicka h�r f�r att logga ut.\"); \r\n\r\n<b>^M; or ^M(); - Nuvarande meny (vertikal)</b>\r\nEn vertikal meny som visar de underalternativ som finns tillg�ngliga fr�n nuvarande sida och ner�t. Som standard s� visar den bara de menyalternativ som leder ner en niv�, men du kan sj�lv v�lja hur m�nga niv�er ner som ska visas. F�r att g� tre niv�er ner kan du skriva s�h�r: ^M(3);. Byter du 3\'an mot en 0\'a (noll) s� visas hela webbplatsens undersidor.\r\n\r\n<b>^m; - Nuvarande meny (horisontell)</b>\r\nEn horisontell meny som inneh�ller undersidorna r�knat fr�n nuvarande niv�. Du kan sj�lv v�lja en avgr�nsare genom att skriva ^m(:--:);. Standard avgr�nsare �r �. \r\n\r\n<b>^P; or ^P(); - Tidigare meny (vertikal)</b>\r\nEn vertikal meny som inneh�ller l�nkar till sidorna innan nuvarande niv�. Som standard s� visar den bara de menyalternativ som leder ner en niv�, men du kan sj�lv v�lja hur m�nga niv�er ner som ska visas. F�r att g� tre niv�er ner kan du skriva s�h�r: ^P(3);. Byter du 3\'an mot en 0\'a (noll) s� visas hela webbplatsens undersidor.\r\n\r\n<b>^p; - Tidigare meny (horisontell)</b>\r\nEn horisontell meny som inneh�ller l�nkar till sidorna innan nuvarande niv�. Du kan sj�lv v�lja en avgr�nsare genom att skriva ^m(:--:);. Standard avgr�nsare �r �. \r\n\r\n<b>^Page();</b>\r\nKan anv�ndas f�r att h�mta information om aktuell sida. Till exempel s� kan macrot anv�ndas f�r att h�mta sidans URL s�h�r: ^Page(\"urlizedTitle\"); eller sidans title s�h�r: ^Page(\"menuTitle\");. \r\n\r\n<b>^PageTitle;</b>\r\nVisar titeln p� aktuell sida.\r\n\r\n<i>Note:</i> Om du anv�nder administrat�rsfunktioner eller \"indepth\"-funktioner i wobjects s� kommer sidans titel bli en l�nk som tar dig tillbaka till sidan.\r\n\r\n<b>^r; or ^r(); - Utskriftsbar version</b>\r\nSkapar en l�nk som visar aktuell sida, men med annan design. Du kan �ndra text p� l�nken genom att skriva s�h�r: ^r(\"Skriv ut\");. \r\n\r\nN�r en anv�ndare klickar p� l�nken kommer sidans stil att bytas ut mot \"Make Page Printable\"-stilen i stilhanteraren. Detta kan dock �ndras till vilken stil som helst genom att skicka med stilen som paramter. Exempel: ^r(\"Print!\",\"WebGUI\");. Utrskriftssidan kommer d� f� WebGUI-stilen.\r\n\r\n<i>Note:</i> Du kan �ven anv�nda specialmacrot ^r(linkonly); f�r att f� en URL till utskriftsbar version. .makePrintableLink stilmallen best�mmer utseende p� l�nken.\r\n\r\n<b>^rootmenu; eller ^rootmenu(); (horisontell)</b>\r\nSkapar en horisontell meny med r�tterna i WebGUI (f�rutom system-menyer). Du kan v�lja menyavgr�nsare genom att skriva s�h�r: ^rootmenu(|); \r\n\r\n<b>^RootTitle;</b>\r\nReturnerar titlen p� roten till nuvarande sida. Till exempel �r roten till WebGUI \"Hem\"-sidan\r\nAvancerade sidor kan ha flera r�tter och beh�ver s�ledes ett s�tt att beskriva f�r anv�ndaren vilken rot denna befinner sig i.\r\n\r\n<b>^S(); - Specifik undermeny (vertikal)</b>\r\nDetta macro ger dig en vertikal undermeny fr�n vilken sida som helst. Undermenyn startar fr�n sidan du anger som parameter till macrot. Till exempel kan du f� en undermeny till alla sidor under \"Hem\" genom att skriva ^S(\"hem\",0);. Det f�rsta v�rdet �r URL\'iserade titeln av sidan och den andra paramtern �r hur djup du vill att tr�dstrukturen ska vara. Standardinst�llningen �r att bara visa en niv�. F�r att g� tre niv�er ner skriver du: ^S(\"hem\",3);. \r\n\r\n<b>^s(); - Specifik undermeny (horisontell)</b>\r\nDetta macro ger dig en horisontell undermeny fr�n vilken sida som helst. Undermenyn startar fr�n sidan du anger som parameter till macrot. Till exempel kan du f� en undermeny till alla sidor under \"Hem\" genom att skriva ^s(\"hem\");. Parametern �r den URL\'iserade titeln av sidan. Du kan �ven sj�lv v�lja en avgr�nsare genom att skriva ^s(\"hem\", \":--:\");. Standard avgr�nsare �r �. \r\n\r\n<b>^SQL();</b>\r\nEn en-rads-SQL-rapport. Ibland vill bara bara ha lite snabba data fr�n databasen och d� kan du anv�nda detta macro. Det h�r macrot kan ocks� anv�ndas f�r att ut�ka ett. Detta macro anv�nder de numeriska macrona (^0; ^1; ^2; etc) f�r att positionera data. Macrot ^rownum; f�r att f� fram radnummer kan ocks� anv�ndas h�r. Exempel:\r\n\r\n^SQL(\"select count(*) from users\",\"Det finns ^0; anv�ndare p� det h�r systemet.\"); \r\n\r\n^SQL(\"select userId,username from users order by username\",\"<a href=\'^/;?op=viewProfile&uid=^0;\'>^1;</a><br>\"); \r\n\r\n<b>^Synopsis; eller ^Synopsis(); Meny</b>\r\nDetta macro ger dig en undermeny till sidor under en viss sida, tillsammans med kort beskrivning av respektive l�nk. Du kan s�tta ett heltal som parameter f�r att v�lja hur m�nga niv�er djup menyn ska vara.\r\n\r\n<b>Note:</b> .synopsis_sub, .synopsis_summary, och .synopsis_title stilklasser anv�nds av detta macro. \r\n\r\n<b>^T; eller ^T(); - Toppniv�meny (vertikal)</b>\r\nEn vertikal meny som inneh�ller alla huvudsidor p� webbplatsen, dvs undersidor fr�n hemsidan. Du kan sj�lv v�lja hur djup du vill ha tr�dstrukturen genom att skriva ett heltal som parameter. Som standard visar den bara f�rsta niv�n. F�r att g� ner tre niv�er skriver du ^T(3). Om du skickar \"0\" (noll) s� kommer hela webbplatsen tr�dstruktur visas. \r\n\r\n<b>^t; - Toppniv�meny (horisontell)</b>\r\nEn vertikal meny som inneh�ller alla huvudsidor p� webbplatsen, dvs undersidor fr�n hemsidan. Du kan sj�lv v�lja en avgr�nsare mellan sidnamnen genom att skriva ^t(:--:);. Standard avgr�nsare �r �. \r\n\r\n<b>^Thumbnail();</b>\r\nReturnerar en URL av en minitayrbild av en bild fr�n bildhanteraren. V�lj vilken bild du vill ha genom att skicka med namnet p� bilden som parameter: ^Thumbnail(\"bildnamn\");. \r\n\r\n<b>^ThumbnailLinker();</b>\r\nDu kan anv�nda detta macro f�r att enkelt g�ra en sida med sk�rmdumpar eller ett fotogalleri. Skicka med namnet p� en bild i bildhanteraren som parameter till macrot: ^ThumbnailLinker(\"Min hund\"); och p� sidan kommer det visas en miniatyrbild men l�nk under som l�nkar till bilden i full storlek.\r\n\r\n<b>^u; - F�retags-URL</b>\r\nURL till ditt f�retag, som det �r inst�llt av administrat�ren.\r\n\r\n<b>^URLEncode();</b>\r\nDetta macro �r mest anv�ndbart i SQL-rapporter, men kan sj�lvklart anv�ndas p� andra st�llen ocks�. Macrot tar en str�ng som parametera och kodar om den i URL-format s� man kan anv�nda den i just en URL. S� h�r kan du anv�nda den: ^URLEncode(\"Detta �r en str�ng med tecken!\"); \r\n\r\n<b>^User();</b>\r\nAnv�nd detta macro f�r att visa information om en anv�ndare fr�n dennes kontouppgifter eller profil. Om du vill visa anv�ndaren dennes e-postadress skriver du: ^User(\"email\");.\r\n\r\n<b>^/; - System-URL</b>\r\nURL till WebGUI-scriptet (exempel: /index.pl/). \r\n\r\n<b>^\\; - Sid-URL</b>\r\nURL till nuvarande sida (exempel: /index.pl/pagename).\r\n\r\n<b>^@; - Anv�ndarnamn</b>\r\nAnv�ndarnamnet p� nu inloggad anv�ndare.\r\n\r\n<b>^?; - S�k</b>\r\nEn s�kbox p� sidan. Knuten till WebGUI\'s inbyggda s�kmotor.\r\n\r\n<b>Note:</b> .searchBox stilklass anv�nds av detta macrot. \r\n\r\n<b>^#; - Anv�ndar-ID</b>\r\nAnv�ndar-ID f�r nu inloggad anv�ndare.\r\n\r\n<b>^*; or ^*(); - Slumpm�ssigt nummer</b>\r\nSlumpm�ssigt genererat nummer. Kan anv�ndas f�r att rotera banners eller andra typer av bilder. Du kan �ven v�lja h�gsta nummer f�r slumptalsfunktionen s�h�r: ^*(100) f�r att skapa ett slumptal mellan 0 och 100.\r\n\r\n<b>^-;,^0;,^1;,^2;,^3;, etc.</b>\r\nDessa macros �r reserverade f�r system/wobject-specifika funktioner som i SQL-rapporten och Body i stilhanteraren.',1032183175);
INSERT INTO international VALUES (623,'WebGUI',6,'<a href=\"http://www.w3.org/Style/CSS/\">Cascading Style Sheets (CSS)</a> �r ett v�ldigt bra s�tt att hantera utseendet p� webbplasen. CSS anv�nds mycket i WebGUI.\r\n\r\nOm du �r obekant till hur man anv�nder CSS kan <a href=\"http://www.rit.se/\">RIT AB</a> hj�lpa dig med att skapa dessa. Alternativt kan du anv�nda en CSS-redigerare som heter <a href=\"http://www.bradsoft.com/topstyle/index.asp\">Top Style</a>.\r\n\r\nF�ljande lista p� klasser anv�nds f�r att kontrollera utseendet p� WebGUI:\r\n\r\n<b>A</b>\r\nL�nkar.\r\n\r\n<b>BODY</b>\r\nSj�lva dokumentets kropp.\r\n\r\n<b>H1</b>\r\nRubriker p� webbplatsen (varje sida).\r\n\r\n<b>.accountOptions</b>\r\nL�nkar som visas under inloggning och konto-uppdateringsformul�r.\r\n\r\n<b>.adminBar</b>\r\nListen som finns l�ngst upp p� sidan n�r du �r i administrationsl�ge.\r\n\r\n<b>.content</b>\r\nInneh�llsdelen p� samtliga sidor.\r\n\r\n<b>.formDescription</b>\r\nBeskrivningen av alla formul�rf�lt.\r\n\r\n<b>.formSubtext</b>\r\nTexten som st�r inder vissa formul�rf�lt.\r\n\r\n<b>.highlight</b>\r\nHur varje valt element ser ut, t.ex. f�r att markera vilket meddelande det �r du tittar p� i en lista.\r\n\r\n<b>.horizontalMenu</b>\r\nDen horisontella menyn (om du anv�nder det macrot).\r\n\r\n<b>.pagination</b>\r\nFram�t- och Bak�t-l�nkarna som visas p� sidor som �r indelade i flera.\r\n\r\n<b>.selectedMenuItem</b>\r\nVisar vilken som �r den aktuella sidan (sidan som visas nu) p� samtliga meny-macron.\r\n\r\n<b>.tableData</b>\r\nRaderna p� till exempel meddelandesystemet.\r\n\r\n<b>.tableHeader</b>\r\n�versta raden p� en tabell, i till exempel meddelandesystemet.\r\n\r\n<b>.tableMenu</b>\r\nMenyn f�r funktioner som p� meddelandesystem.\r\n\r\n<b>.verticalMenu</b>\r\nDen vertikala menyn (om du anv�nder den).\r\n\r\n<i><b>Note:</b></i> Vissa wobjects och macron har sina egna stilar som dokumenteras i deras respektive hj�lpfiler.',1031919778);
INSERT INTO international VALUES (622,'WebGUI',6,'Se <i>Hantera grupper</i> f�r en beskrivning av gruppering av funktioner och standardgrupper.\r\n\r\n<b>Gruppnamn</b>\r\nNamnet p� gruppen. Anv�nd ett s� beskrivande namn som m�jligt.\r\n\r\n<b>Beskrivning</b>\r\nEn l�ngre beskrivning av gruppen s� att andra kan veta vad gruppen �r avsedd f�r och vilka typer av anv�ndare som skall tillh�ra den.\r\n\r\n<b>B�st f�re</b>\r\nHur l�ng tid kan en anv�ndare vara medlem i denna gruppen innan han tas bort fr�n den? Detta �r mycket anv�ndbart p� webbplatser d�r man kan s�lja medlemskap t.ex. �rsvis.\r\n\r\n<i>Note:</i> B�st-f�re kan st�llas in individuellt p� respektive anv�ndare.\r\n\r\n<b>Karma-gr�ns</b>\r\nOm du har karma p�slaget s� �r detta en indikator p� hur mycket karma anv�ndaren m�ste ha f�r att anses som medlem i gruppen.',1031918601);
INSERT INTO international VALUES (621,'WebGUI',6,'I stilar kan du anv�nda macros. Se <i>Anv�nd Macros</i> f�r mer information.\r\n\r\n<b>Stilnamn</b>\r\nEtt unikt namn som beskriver vad stilen ser ut som. Namnet p�verkar inte hur stilen ser ut i �vrigt.\r\n\r\n<b>Body</b>\r\nBodyn som �r precis samma som body-taggen i HTML. D�r kan du definiera hur hela sidan ser ut, inklusive navigering, logotyper, coppyright osv. Som minimum b�r bodyn inneh�lla n�gra macron som ^Adminbar; (f�r att visa administrationsmenyn) och ^-; (avdelare) macrot. ^-; visar var WebGUI kommer l�gga webbplatsens inneh�ll.\r\n\r\nOm du beh�ver hj�lp att skapa en design p� din webbplats eller bara hj�lp att skapa en stil i WebGUI �r du v�lkommen att kontakta <a href=\"http://www.rit.se\">RIT AB</a>.\r\n\r\nM�nga l�gger in WebGUI macros f�r att autmatiskt sk�ta navigeringen p� webbplatsen och andra egenskaper.\r\n\r\n<b>Stilmall (style sheet)</b>\r\nH�r l�gger du dina stilmallsdefinitioner. Stilmallar anv�nds f�r att kontrollera f�rger, storlekar och andra egenskaper f�r de olika elementen p� webbplatsen. Se <i>Anv�nd stilmallar</i> f�r mer information.\r\n\r\n<i>Avancerade anv�ndare:</i> f�r att �ka prestandan kan du skapa en extern stilmall och l�gga p� servern. F�r att l�nka till den skriver du:\r\n&lt;link href=\"/webgui.css\" rel=\"stylesheet\" rev=\"stylesheet\" type=\"text/css\"&gt;',1031918359);
INSERT INTO international VALUES (620,'WebGUI',6,'Som funktionen l�ter kommer du att ta bort en grupp och ta bort alla anv�ndarna fr�n gruppen. Var f�rsiktig s� inte sidor som har gruppen som redigerare inte blir oredigeringsbara.\r\n\r\nSom alla borttagningsoperationer kommer du f� bekr�fta borttagningen. Svara Ja s� kommer gruppen tas bort och det g�r inte att �ngra sig. Svara du Nej kommer du tas till f�reg�ende sida.',1031917538);
INSERT INTO international VALUES (619,'WebGUI',6,'Den h�r funktionen raderar valt wobject fr�n sidan, utan m�jlighet att �ngra sig. Om du �r os�ker p� om du vill ta bort detta inneh�ll kan du ist�llet klippa ut det och l�ta det ligga i klippbordet tills dess du vill anv�nda det igen eller �r s�ker p� att du vill ta bort det.\r\n\r\nPrecis som med alla borttagningsoperationer kommer du f� bekr�fta borttagninen. V�lj Ja och objektet tas bort och kan inte bli �terskapat. V�lj Nej och du tas till sidan du var p� tidigare.',1031917136);
INSERT INTO international VALUES (618,'WebGUI',6,'<b>\"�terh�mta l�senord\"-meddelande</b>\r\nMeddelande som skickas till anv�ndaren d� personen anv�nder \"�terh�mta l�senords\"-funktionen.\r\n\r\n<b>SMTP server</b>\r\nDetta �r adressen till din lokala mailserver. Den beh�vs f�r alla wobject som anv�nder e-post (som l�senords�terh�mningen).\r\n\r\nOm du k�r sendmail p� samma server som WebGUI kan du �ven skriva in s�kv�gen till ditt sendmail-program. P� de flesta system ligger den i \"/usr/lib/sendmail\" eller \"/usr/sbin/sendmail\".',1031916978);
INSERT INTO international VALUES (617,'WebGUI',6,'Inst�llningar f�r anpassning av WebGUI till dina f�rh�llanden.\r\n\r\n<b>Redigera f�retagsinformation</b>\r\nInformation specifikt f�r f�retaget eller personen som kontrollerar installationen av WebGUI (�gare av webbplatsen).\r\n\r\n<b>Redigera inneh�llsinst�llningar</b>\r\nInst�llningar relaterat till inneh�ll och inneh�llshantering.\r\n\r\n<b>Redigera e-postinst�llningar</b>\r\nInst�llningar som r�r e-post och liknande funktioner.\r\n\r\n<b>Redigera �vriga inst�llningar</b>\r\nInst�llningar som inte platsar under n�gon av de andra grupperna.\r\n\r\n<b>Redigera profilinst�llningar</b>\r\nBest�m hur anv�ndarprofilerna ska se ut och vad anv�ndaren sj�lv kan �ndra.\r\n\r\n<b>Redigera anv�ndarinst�llningar</b>\r\nInst�llningar som ber�r anv�ndare (ut�ver profilinst�llningar), som autenciering och registreringsm�jligheter.',1031916710);
INSERT INTO international VALUES (616,'WebGUI',6,'<b>S�kv�g till WebGUI Extras</b>\r\nWebadressen till katalogen som inneh�ller WebGUI-bilder och JavaScript-filer.\r\n\r\n<b>Maximal bilagsstorlek</b>\r\nMaximal storlek p� filer som laddas upp. Det g�ller f�r samtliga wobjects som till�ter filuppladdning och bilder. Storleken m�ts i kilobyte.\r\n\r\n<b>Minatyrbildsstorlek</b>\r\nStorleken p� den l�ngsta sidan av minityrbilder. Miniatyrvyen beh�ller proportionerna p� bilden. Om du s�tter detta v�rde till 100 och har en bild som �r 400 pixlar bred, 200 pixlar h�g s� kommer miniatyrbilden bli 100 pixlar bred, 50 pixlar h�g.\r\n\r\n<i>Note:</i> Miniatyrbilder skapas autmatiskt n�r bilder laddas upp.\r\n\r\n<b>Bilageplats, URL</b>\r\nS�kv�gen fr�n webbplatsen dit bifogade filer sparas.\r\n\r\n<b>Bilageplats, p� servern</b>\r\nDen lokala s�kv�gen till bilagor p� servern. Kontrollera att webbservern har r�ttigheter att skriva till katalogen.',1031916437);
INSERT INTO international VALUES (615,'WebGUI',6,'Grupper anv�nds f�r att f�rdela r�ttigheter och ansvarsomr�den i WebGUI-systemet. Till exempel s� kanske du vill bygga en webbplats f�r ett skola. Varje klass kan f� sin egen grupp med b�de elever och l�rare. De kan d�refter f� sin egen sida att redigera som dom vill. L�rarna kan ligga i en egen grupp och ha mer r�ttigheter �n eleverna.\r\n\r\nDet finns flera redan inbyggda grupper i WebGUI som har redan definierade betydelser. De f�ljer:\r\n\r\n<b>Admins</b>\r\nAdmins �r personer med oinskr�nkt makt �ver systemet. Vanligtvis �r det en till tre personer i denna gruppen som har ett �vergripande ansvar f�r allt inneh�ll.\r\n\r\n<b>Inneh�llshanterare</b>\r\nInneh�llshanterare �r anv�ndare som har r�ttigheter att l�gga till, redigera och ta bort inneh�ll fr�n olika delar av webbplatsen. Inneh�llshanterarna ska inte som grupp anv�ndas f�r att dela ut r�ttigheter till specifika delar av webbplatsen, utan bara anv�ndas f�r att definiera vilka anv�ndare som har r�ttigheter att redigera sidor. Skapa individuella grupper f�r varje del av webbplatsen.\r\n\r\n<b>Alla</b>\r\nAlla �r en magisk grupp som ingen l�ggs till i. Alla �r alla. Om du vill ha en �ppen webbplatsen f�r b�de bes�kare och anv�ndare ska du anv�nda denna gruppen.\r\n\r\n<b>Packethanterare</b>\r\nAnv�ndare som har r�ttigheter att l�gga till, redigera och ta bort paket med wobjects och sidor.\r\n\r\n<b>Registrerade anv�ndare</b>\r\nN�r anv�ndare l�ggs till systemet hamnar dom i denna gruppen. En anv�ndare ska bara tas bort fr�n gruppen om deras konto ska tas bort eller om du vill straffa en br�kmakare.\r\n\r\n<b>Stilhanterare</b>\r\nAnv�ndare som har r�ttighet att �ndra p� webbplatsens stilar. Denna r�ttighet inneb�r inte att de kan �ndra r�ttigheter p� sidor, utan bara definiera de r�ttigheter som kan anv�ndas.\r\n\r\n<b>Mallhanterare</b>\r\nAnv�ndare som har r�ttighet att �ndra mallarna p� webbplatsen.\r\n\r\n<b>Bes�kare</b>\r\nEn bes�kare �r en anv�ndare som inte loggat in �nnu. Om du vill straffa en anv�ndare kan du ta bort personen fr�n Registrerade anv�ndare och l�gga in honom i denna gruppen ist�llet.',1031911632);
INSERT INTO international VALUES (614,'WebGUI',6,'Stilar anv�nds f�r att hantera det visuella i WebGUI-sidor. Du kan ha obegr�nsat med stilar och endast din fantasi s�tter gr�nserna. \r\n\r\nDet finns ett flertal stilar inbyggda i WebGUI. De f�rsta av dessa anv�nds av WebGUI och b�r inte �ndras eller tas bort. De sista �r exempel-stilar som du kan experimentera med fritt.\r\n\r\n<b>Klippbord</b>\r\nDen h�r stilen anv�nds i klippbords-systemet.\r\n\r\n<b>Fels�ker</b>\r\nOm du tar bort en stil som anv�nds av sidor kommer de ist�llet att f� denna stilen. Vit bakgrund och enkel navigering.\r\n\r\n<b>G�r sidor utskriftsbara</b>\r\nDen h�r stilen anv�nds om du placerar ett <b>^r;</b> macro p� n�gon annan sida och anv�ndaren klicka p� den. Den h�r stilen ska vara en enkel stil utan mycket grafik f�r att passa skrivare.\r\n\r\n<b>Packet</b>\r\nDen h�r stilen anv�nds av packethanteringssystemet.\r\n\r\n<b>Skr�pkorg</b>\r\nDen h�r stilen anv�nds f�r att hantera skr�p (borttagna wobjects).\r\n\r\n<hr>\r\n\r\n<b>Demostil</b>\r\nDetta �r en demonstration som anv�nder en mall fr�n <a href=\"http://www.freewebtemplates.com\">www.freewebtemplates.com</a>.\r\n\r\n<b>Plain Black Software (black) & (white)</b>\r\nDessa designer anv�nds av Plain Black webbplats.\r\n\r\n<b>Yahoo!�</b>\r\nDesign anv�nd av Yahoo!.\r\n\r\n<b>WebGUI</b>\r\nEnkel WebGUI-design.\r\n\r\n<b>WebGUI 4.0</b>\r\nVid version 4 kom den nya designen och har ersatt den gamla som bara heter WebGUI.',1031910524);
INSERT INTO international VALUES (613,'WebGUI',6,'Anv�ndare �r konton i som till�ts g�ra olika saker. Det finns tv� standard-anv�ndare i systemet: Admin och Visitor.\r\n\r\n<b>Admin</b>\r\nAdmin �r precis som det l�ter, en administrat�r. Har obegr�nsade r�ttigheter och kan g�ra allt som g�r.\r\n\r\n<b>Visitor</b>\r\nBes�kskontot. Inga r�ttigheter alls, f�rrutom att titta p� sidor. Alla anv�ndare som inte �r inloggade f�r identiteten Visitor.\r\n\r\n<b>L�gg till ny anv�ndare</b>\r\nKlicka h�r f�r att l�gga till en ny anv�ndare.\r\n\r\n<b>S�k</b>\r\nDu kan s�ka i anv�ndarlistan baserat p� anv�ndarnamn och e-postadress. ',1031909288);
INSERT INTO international VALUES (612,'WebGUI',6,'Det finns egentligen ingen anledning att ta bort en anv�ndare. Vill du l�sa ut en person kan du helt enkelt �ndra deras l�senord. Om du �r helt s�ker p� att du vill ta bort en anv�ndare b�r du t�nka p� konsekvenserna. Om du tar bort en anv�ndare s� kommer inneh�ll de bidragit med p� webbplatsen att finnas kvar, men om andra anv�ndare f�rs�ker titta p� anv�ndarens profil kommer de att f� ett felmeddelande. Om den borttagna anv�ndaren �terv�nder till webbplatsen och vill komma �t och �ndra sina gamla bidrag s� kan man inte enklet g�ra det genom att l�gga till en ny anv�ndare med samma anv�ndarnamn som f�rr, utan m�ste g� in direkt i tabellerna via SQL och l�gg till honom den v�gen.\r\n\r\nPrecis som med alla borttagningsoperationer kommer du att f� bekr�fta att du vill forts�tta. Svara Ja och anv�ndaren kommer tas bort. Svara Nej och du kommer tillbaka till senaste sidan du var p�.',1031909117);
INSERT INTO international VALUES (611,'WebGUI',6,'<b>F�retagsnamn</b>\r\nNamnet p� f�retaget. Det kommer synas p� all e-post och alla st�llen du anv�nder f�retagsnamnsmacrot.\r\n\r\n<b>F�retagets e-postadress</b>\r\nEn generell e-postadress f�r ditt f�retag. Det �r fr�n den h�r adressen alla automatiserade meddelanden kommer komma fr�n. Det kan ocks� anv�ndas via WebGUI macro-system.\r\n\r\n<b>F�retags-URL</b>\r\nDen prim�ra URL\'en f�r ditt f�retag. Kommer ocks� visas p� alla automatiserade e-postmeddelanden som skickas via WebGUI. Det finns ocks� tillg�ngligt via WebGUI macro-system.',1031908216);
INSERT INTO international VALUES (610,'WebGUI',6,'Se <b>Hantera anv�ndare</b> f�r mer detaljer.\r\n\r\n<b>Anv�ndarnamn</b>\r\nEtt anv�ndarnamn �r en unik identifierare f�r en anv�ndare. Det �r under det h�r namnet personen kommer bli k�nd p� webbplatsen. \r\n\r\n<i><b>Note:</b></i> Administrat�rer har obegr�nsat inflytande �ver WebGUI och kan f�rbig� reglerna. Om du d�per om eller skapar en anv�ndare s� kontrollera att det inte redan finns en anv�ndare med det anv�ndarnamnet.\r\n\r\n<b>L�senord</b>\r\nEtt l�senord beh�vs f�r att anv�ndaren ska bevisa att dom �r den dom utger sig f�r att vara.\r\n\r\n<b>Autencieringsmetod</b>\r\nSee <i>Redigera inst�llningar</i> f�r detaljer.\r\n\r\n<b>LDAP URL</b>\r\nSee <i>Redigera inst�llningar</i> f�r detaljer.\r\n\r\n<b>Anslutnings-DN</b>\r\nAnslutnings-DN �r cn (common name) f�r en anv�ndare i LDAP-databasen. Det ska specifieras som <b>cn=Sven Svensson</b>. Det �r anv�ndarnamnet som kommer att anv�ndas f�r autenciering mot LDAP-servern.',1031908076);
INSERT INTO international VALUES (609,'WebGUI',6,'N�r du tar bort en stil kommer alla sidor som anv�nder den stilen att byta till fels�ker (standard) stil. F�r att garantera oavbruten visning av sidor b�r du se till att inga sidor anv�nder stilen innan du tar bort den.\r\n\r\nPrecis som med alla borttagningsoperationer kommer du att f� bekr�fta innan operationen forts�tter. Svarar du Ja kommer borttagningen forts�tta och du kommer inte kunna �ngra dig. Svara du Nej kommer du tas tillbaka till f�reg�ende sida.',1031907542);
INSERT INTO international VALUES (606,'WebGUI',6,'T�nk p� sidor som platsh�llare f�r inneh�ll. Skapa sidan f�rst och fyll den sedan med allt du vill att den ska inneh�lla.\r\n\r\n<b>Titel</b>\r\nSidans titel. Den anv�nds i navigeringen. Titlar ska vara beskrivande, men inte f�r l�nga.\r\n\r\n<b>Menytitel</b>\r\nEn f�rkortad eller �ndrad titel som visas i navigeringsmenyer. Om f�ltet �r tomt kommer titeln att visas.\r\n\r\n<b>Sid-URL</b>\r\nN�r du skapar en sida kommer en URL att genereras baserad p� sidans titel. Om du �r missn�jd med URL\'en den skapar automatiskt kan du v�lja en egen h�r.\r\n\r\n<b>Omdirigerings-URL</b>\r\nN�r den h�r sidan bes�ks kommer anv�ndaren bli omdirigerad till en URL du fyller i h�r. F�r att redigera den h�r sidan i forts�ttningen m�ste du g� till den via \"Hantera tr�d-vy\" under \"Administrativa funktioner...\".\r\n\r\n<b>Mall</b>\r\nSom standard har WebGUI en stort omr�de d�r du kan placera wobjects. Du kan v�lja en annan f�r att dela upp sidan i mindre omr�den.\r\n\r\n<b>Beskrivning</b>\r\nKort beskrivning av sidan. Anv�nds f�r att skapa META-taggar och beskrivningar p� webbplatskartan.\r\n\r\n<b>META-taggar</b>\r\nMETA-taggar anv�nds av vissa s�kmotorer f�r att associera nyckelord med inneh�llet i texten p� sidan. Det finns en bra webbplats som heter <a href=\"http://www.metatagbuilder.com/\">Meta Tag Builder</a> som hj�lper dig skapa META-taggar om du aldrig gjort det f�rrut.\r\n\r\n<i>Avancerade anv�ndare:</i> Om du har andra saker som JavaScript kan du l�gga in det h�r.\r\n\r\n<b>Anv�nd standard META-taggar?</b>\r\nOm du inte vill v�lja META-taggar sj�lv s� kan WebGUI generera dessa f�r dig, baserat p� sidans titel och ditt f�retagsnamn. Bocka i denna rutan f�r att till�ta WebGUI att g�ra detta.\r\n\r\n<b>Stil</b>\r\nSom standard s� �rver en ny sida vissa egenskaper fr�n sidan ovanf�r. En av dessa egenskaper �r stilen. V�lj fr�n en lista av stilar om du vill �ndra utseendet p� just denna sidan. \r\n\r\nV�ljer du Ja p� fr�gan under s� kommer alla sidor under denna sida att �rva stilen.\r\n\r\n<b>Startdatum</b>\r\nDatum d� sidan kommer b�rja visas f�r anv�ndarna. Innan dess kommer sidan bara visas f�r personer med r�ttighet att �ndra sidor.\r\n\r\n<b>Slutdatum</b>\r\nDatum d� sidan kommer sluta synas. Efter detta kommer sidan bara visas f�r personer med r�ttighet att �ndra sidor.\r\n\r\n<b>�gare</b>\r\nVem �ger sidan? Vanligtvis personen som skapade den.\r\n\r\n<b>�garen kan se sidan?</b>\r\nKan �garen se sin egen sida?\r\n\r\n<b>�garen kan redigera sidan?</b>\r\nKan �garen redigera sidan? Var f�rsiktig med att st�nga av denna funktion eftersom om �garen inte �r i sidgruppen s� kommer han inte l�ngre kunna redigera sin egen sida.\r\n\r\n<b>Grupp</b>\r\nV�lj vilken grupp som ska �ga sidan.\r\n\r\n<b>Grupp kan se sidan?</b>\r\nKan medlemmar i gruppen se sidan?\r\n\r\n<b>Grupp kan redigera sidan?</b>\r\nKan medlemmar i gruppen redgiera sidan?\r\n\r\n<b>Vem som helst kan se?</b>\r\nVem som helst kan se sidan, medlemskap eller inte?\r\n\r\n<b>Vem som helst kan redigera sidan?</b>\r\nKan vem som helst redigera sidan?\r\n\r\n<b>Note:</b> Du kan ge samtliga r�ttigheter rekursivt, s� att de �ven g�ller f�r undersidor.',1031905607);
INSERT INTO international VALUES (71,'Article',6,'Artiklar �r den \"schweiziska arm�kniven\" f�r WebGUI. De flesta delar av statiskt inneh�ll kan l�ggas till via en artikel.\r\n\r\n<b>Bild</b>\r\nV�lj en bild (.jpg, .gif, .png) fr�n h�rddisken. Filen kommer att laddas upp till servern och visas i artikeln.\r\n\r\n<b>Positionera bild</b>\r\nV�lj var du vill positionera bilden ovan.\r\n\r\n<b>Bilaga</b>\r\nOm du vill bifoga en Word-fil, zip-fil eller n�gon annan typ av fil f�r nerladdning v�ljer du en fr�n h�rddisken.\r\n\r\n<b>L�nktitel</b>\r\nOm du vill ha en l�nk till din artikel skriver du in titeln i det h�r f�ltet.\r\n\r\n<i>Exempel:</i> Google\r\n\r\n<b>L�nk URL</b>\r\nOm du skrev in en l�nk ovan kan du l�gga till en URL h�r.\r\n\r\n<i>Exempel:</i> http://www.google.com\r\n\r\n<b>Konvertera radmatningar</b>\r\nOm du publicerar HTML beh�ver du generellt sett inte kryssa f�r det h�r alternativet, men om du inte anv�nder HTML och du vill ha en radmatning p� varje st�lle du tryckt p� \"Enter\"-tangenten s� ska du kryssa f�r detta.\r\n\r\n<b>Till�t diskussion</b>\r\nKryssa i den h�r rutan f�r att till�ta diskussion runt artikeln. F�r exempel p� hur det kan se ut titta p� <a href=\"http://www.slashdot.org\">slashdot</a>\r\n\r\n<b>Vem kan g�ra inl�gg?</b>\r\nV�lj vilken grupp som har till�telse att g�ra inl�gg.\r\n\r\n<b>Time-out f�r redigering</b>\r\nHur l�ng tid ska anv�ndaren ha p� sig att �ndra sitt inl�gg innan det l�ses.\r\n\r\n<i>Note:</i> S�tt inte den h�r gr�nsen f�r h�gt. En av f�rdelarna med en diskussionsforum �r att det finns svart p� vitt vem som sa vad. Om du till�ter att anv�ndare kan g� tillbaka och �ndra efter en l�ng tid, s� kan anv�ndaren �ndra det som sades l�ngt tillbaka i tiden och p� s� s�tt g�ra diskussionen f�rvirrande. \r\n\r\n<b>Karma per inl�gg</b>\r\nHur mycket karma ska ges till anv�ndaren f�r ett inl�gg?\r\n\r\n<b>Vem kan moderera?</b>\r\nV�lj vilken grupp som modererar inl�ggen.\r\n\r\n<b>Modereringstyp</b>\r\nDu kan v�lja vilken typ av moderering du vill ha f�r dina anv�ndare. <i>Efterhand</i> betyder att n�r en anv�ndare g�r ett inl�gg s� visas det direkt och kan d�refter plockas bort av modereringsgruppen (se ovan). <i>F�rhand</i> betyder att modereringsgruppen m�ste godk�nna inl�gget innan det visas f�r allm�nheten.\r\n\r\n<i>Note:</i> I b�da fallen kan modereringsgruppen g� in och redigera eller ta bort inl�gg fr�n anv�ndarna.',1031842118);
INSERT INTO international VALUES (642,'WebGUI',6,'Sida, l�gg till/redigera',1031841770);
INSERT INTO international VALUES (655,'WebGUI',6,'Anv�ndare, l�gg till/redigera',1031841753);
INSERT INTO international VALUES (653,'WebGUI',6,'Sida, radera',1031841741);
INSERT INTO international VALUES (656,'WebGUI',6,'F�retagsinformation, redigera',1031841724);
INSERT INTO international VALUES (657,'WebGUI',6,'Anv�ndare, radera',1031841708);
INSERT INTO international VALUES (658,'WebGUI',6,'Anv�ndare, hantera',1031841696);
INSERT INTO international VALUES (659,'WebGUI',6,'Stilar, hantera',1031841685);
INSERT INTO international VALUES (660,'WebGUI',6,'Grupper, hantera',1031841674);
INSERT INTO international VALUES (661,'WebGUI',6,'Filinst�llningar, redigera',1031841664);
INSERT INTO international VALUES (662,'WebGUI',6,'Inst�llningar, hantera',1031841649);
INSERT INTO international VALUES (663,'WebGUI',6,'E-postinst�llningar, redigera',1031841636);
INSERT INTO international VALUES (664,'WebGUI',6,'Wobject, radera',1031841613);
INSERT INTO international VALUES (665,'WebGUI',6,'Grupp, radera',1031841586);
INSERT INTO international VALUES (666,'WebGUI',6,'Stil, l�gg till/redigera',1031841553);
INSERT INTO international VALUES (667,'WebGUI',6,'Grupp, l�gg till/redigera',1031841539);
INSERT INTO international VALUES (668,'WebGUI',6,'Stilmallar, anv�nder',1031841526);
INSERT INTO international VALUES (671,'WebGUI',6,'Wobjects, anv�nder',1031841502);
INSERT INTO international VALUES (677,'WebGUI',6,'Wobject, l�gg till/redigera',1031841488);
INSERT INTO international VALUES (721,'WebGUI',6,'Namnrymd',1031841468);
INSERT INTO international VALUES (669,'WebGUI',6,'Macros, anv�nder',1031841455);
INSERT INTO international VALUES (670,'WebGUI',6,'Bild, l�gg till/redigera',1031841435);
INSERT INTO international VALUES (672,'WebGUI',6,'Profilinst�llningar, redigera',1031841417);
INSERT INTO international VALUES (673,'WebGUI',6,'Bild, radera',1031841399);
INSERT INTO international VALUES (674,'WebGUI',6,'Blandade inst�llningar, redigera',1031841383);
INSERT INTO international VALUES (675,'WebGUI',6,'S�kmotor, anv�nder',1031841354);
INSERT INTO international VALUES (676,'WebGUI',6,'Bilder, hantera',1031841315);
INSERT INTO international VALUES (679,'WebGUI',6,'Inneh�llsinst�llningar, redigera',1031841268);
INSERT INTO international VALUES (680,'WebGUI',6,'Paket, l�gg till',1031841250);
INSERT INTO international VALUES (681,'WebGUI',6,'Paket, skapa',1031841235);
INSERT INTO international VALUES (608,'WebGUI',6,'Att ta bort en sida kan skapa stor oreda om du �r os�ker p� vad du g�r. Tas en sida bort tas �ven allt inneh�ll, alla undersidor samt allt innh�ll undersidorna inneh�ller bort. Var s�ker p� att du redan flyttat �ver inneh�ll du vill spara till andra sidor innan du tar bort n�got.\r\n\r\nPrecis som �vriga borttagningsfunktioner, s� kommer du att bli fr�gad om du �r s�ker och kunna v�lja om du vill forts�tta borttagningen, eller avbryta. Om du forts�tter kommer borttagningen att fortg� utan m�jlighet att �ngra sig. Om du avbryter kommer du tillbaka till f�reg�ende sida.',1031841222);
INSERT INTO international VALUES (682,'WebGUI',6,'Anv�ndarprofil, redigera',1031841215);
INSERT INTO international VALUES (683,'WebGUI',6,'Mallar, hantera',1031841199);
INSERT INTO international VALUES (684,'WebGUI',6,'Mall, l�gg till/redigera',1031841184);
INSERT INTO international VALUES (696,'WebGUI',6,'Papperskorg, t�m',1031841167);
INSERT INTO international VALUES (685,'WebGUI',6,'Mall, radera',1031841131);
INSERT INTO international VALUES (686,'WebGUI',6,'Bildgrupp, l�gg till',1031841119);
INSERT INTO international VALUES (697,'WebGUI',6,'Karma, anv�nder',1031841097);
INSERT INTO international VALUES (699,'WebGUI',6,'F�rsta dagen i veckan',1031840984);
INSERT INTO international VALUES (713,'WebGUI',6,'Stilhanteringsgrupp',1031840911);
INSERT INTO international VALUES (714,'WebGUI',6,'Mallhanteringsgrupp',1031840891);
INSERT INTO international VALUES (715,'WebGUI',6,'Ompeknings-URL',1031840875);
INSERT INTO international VALUES (716,'WebGUI',6,'Logga in',1031840859);
INSERT INTO international VALUES (717,'WebGUI',6,'Logga ut',1031840849);
INSERT INTO international VALUES (718,'WebGUI',6,'Exportera �vers�ttning.',1031840838);
INSERT INTO international VALUES (719,'WebGUI',6,'Utg�ngen',1031840824);
INSERT INTO international VALUES (601,'WebGUI',6,'Internationell-ID',1031840751);
INSERT INTO international VALUES (592,'WebGUI',6,'Teckenupps�ttning',1031840733);
INSERT INTO international VALUES (720,'WebGUI',6,'OK',1031840711);
INSERT INTO international VALUES (589,'WebGUI',6,'Redigera spr�k',1031840686);
INSERT INTO international VALUES (722,'WebGUI',6,'ID',1031840678);
INSERT INTO international VALUES (583,'WebGUI',6,'Max bildstorlek',1031840677);
INSERT INTO international VALUES (569,'WebGUI',6,'Modereringstyp',1031840667);
INSERT INTO international VALUES (568,'WebGUI',6,'Efterhand',1031840659);
INSERT INTO international VALUES (559,'WebGUI',6,'K�r vid registrering',1031840650);
INSERT INTO international VALUES (711,'WebGUI',6,'Bildhanteringsgrupp',1031840616);
INSERT INTO international VALUES (710,'WebGUI',6,'Redigera privilege-inst�llningar',1031840588);
INSERT INTO international VALUES (708,'WebGUI',6,'Privilege-inst�llningar, hantera',1031840562);
INSERT INTO international VALUES (554,'WebGUI',6,'Behandla',1031840452);
INSERT INTO international VALUES (551,'WebGUI',6,'P�minnelse',1031840439);
INSERT INTO international VALUES (552,'WebGUI',6,'V�ntande',1031840427);
INSERT INTO international VALUES (550,'WebGUI',6,'Visa bildgrupp',1031840410);
INSERT INTO international VALUES (549,'WebGUI',6,'Gruppbeskrivning',1031840401);
INSERT INTO international VALUES (707,'WebGUI',6,'Visa fels�kningsinformation?',1031840397);
INSERT INTO international VALUES (548,'WebGUI',6,'Gruppnamn',1031840392);
INSERT INTO international VALUES (706,'WebGUI',6,'Timma(r)',1031840361);
INSERT INTO international VALUES (705,'WebGUI',6,'Minut(er)',1031840344);
INSERT INTO international VALUES (704,'WebGUI',6,'Sekund(er)',1031840333);
INSERT INTO international VALUES (703,'WebGUI',6,'�r',1031840321);
INSERT INTO international VALUES (702,'WebGUI',6,'M�nad(er)',1031840312);
INSERT INTO international VALUES (547,'WebGUI',6,'�gargrupp',1031840271);
INSERT INTO international VALUES (546,'WebGUI',6,'Grupp-ID',1031840264);
INSERT INTO international VALUES (545,'WebGUI',6,'Redigera bildgrupp',1031840258);
INSERT INTO international VALUES (544,'WebGUI',6,'�r du s�ker p� att du vill ta bort denna grupp?',1031840174);
INSERT INTO international VALUES (512,'WebGUI',6,'N�sta tr�d',1031840161);
INSERT INTO international VALUES (509,'WebGUI',6,'Diskussionsdesign',1031840153);
INSERT INTO international VALUES (508,'WebGUI',6,'Hantera mallar.',1031840138);
INSERT INTO international VALUES (506,'WebGUI',6,'Hantera mallar',1031840127);
INSERT INTO international VALUES (505,'WebGUI',6,'L�gg till ny mall.',1031840119);
INSERT INTO international VALUES (502,'WebGUI',6,'�r du s�ker p� att du vill ta bort den h�r mallen och l�ta alla sidor som anv�nde den att byta till standardmallen?',1031840100);
INSERT INTO international VALUES (500,'WebGUI',6,'Sid-ID',1031839975);
INSERT INTO international VALUES (499,'WebGUI',6,'Wobject-ID',1031839351);
INSERT INTO international VALUES (498,'WebGUI',6,'Slutdatum',1031839341);
INSERT INTO international VALUES (496,'WebGUI',6,'Anv�nd redigerare',1031839332);
INSERT INTO international VALUES (495,'WebGUI',6,'Inbyggd redigerare',1031839316);
INSERT INTO international VALUES (494,'WebGUI',6,'Real Objects Edit-On Pro',1031839302);
INSERT INTO international VALUES (406,'WebGUI',6,'Miniatyrbildsstorlek',1031839235);
INSERT INTO international VALUES (382,'WebGUI',6,'Redigera bild',1031839224);
INSERT INTO international VALUES (71,'USS',6,'Anv�ndarinl�ggsystem �r ett bra s�tt att bygga upp en community p� webbplatsen och f� gratis inneh�ll fr�n dina anv�ndare.\r\n\r\n<b>Design</b>\r\nVad ska inl�ggsystemet se ut som? Dessa olika vyer finns tillg�ngliga:\r\n<lu>\r\n <li><b>Traditionell</b> - Skapar en enkel kalkylarksliknande lista av varje inl�gg och sorterar efter datum.</li>\r\n <li><b>Webbok</b> - Skapar en vy som liknar nyhetswebbplatsen <a href=\"http://www.slashdot.org\">Slashdot</a>. F�r att begr�nsa antalet artiklar p� f�rstasidan kan du anv�nda macrot ^-; d�r du vill att f�rstasidans inneh�ll ska sluta.</li>\r\n <li><b>Fotogalleri</b> - skapar en matris av miniatyrbilder som kan klickas p� f�r att �ppna bilden i full storlek.</li>\r\n\r\n<b>Vem kan godk�nna?</b>\r\nV�lj en grupp som ska godk�nna eller refusera inl�gg.\r\n\r\n<b>Vem kan bidra?</b>\r\nV�lj en grupp som kan bidra med inneh�ll.\r\n\r\n<b>Inl�gg per sida?</b>\r\nHur m�nga inl�gg ska visas per sida i inl�ggsindexet?\r\n\r\n<b>Standardstatus</b>\r\nSka inl�gg s�ttas till <i>godk�nd</i>, <i>v�ntande</i> eller <i>refuserad</i> som standard.\r\n\r\n<i>Note:</i> Om du s�tter standardstatus till v�ntande s� m�ste du sj�lv �vervaka meddelandeloggen och godk�nna/refusera inl�gg.\r\n\r\n<b>Karma per inl�gg</b>\r\nHur mycket karma ges till en anv�ndare n�r de bidrar med inl�gg?\r\n\r\n<b>Visa miniatyrbilder?</b>\r\nOm det finns en bild med i inl�gget kommer denna att visas som en miniatyrbild i designen (se ovan).\r\n\r\n<b>Till�t diskussion?</b>\r\nVill du koppla ett diskussionsforum till inl�ggen? Om du g�r det s� kommer anv�ndarna att kunna kommentera inl�ggen.\r\n\r\n<b>Vem kan skicka?</b>\r\nV�lj en grupp som kan skicka kommentarer till inl�ggen.\r\n\r\n<b>Redigeringstimeout</b>\r\nHur l�ng tid har en anv�ndare p� sig att redigera dennes inl�gg innan det blir l�st? \r\n\r\n<i>Note:</i> S�tt inte denna gr�nsen f�r h�gt. Om anv�ndarna till�ts g� tillbaka och �ndra l�ngt bak i tiden kan det bli f�rvirrande n�r man l�ser kommentarer till en borttagen text. \r\n\r\n<b>Karma per kommentar</b>\r\nHur mycket karma ges till anv�ndare som g�r kommentarer till inl�gget?\r\n\r\n<b>Vem kan moderera?</b>\r\nV�lj en grupp som modererar kommentarerna.\r\n\r\n<b>Modereringstyp</b>\r\nDu kan v�lja vilken typ av moderering du vill ha p� kommentarerna. <i>Efterhand</i> menar att kommentarerna publiceras direkt och tas bort/redigeras i efterhand. <i>F�rhand</i> menas att kommentarerna m�ste godk�nnas av n�gon i modereringsgruppen innan dom visas p� webbplatsen.\r\n\r\n<b><i>Note:</i><b> oavsett modereringstyp kan modererarna alltid g� in och redigera/ta bort kommentarer och inl�gg.',1031839167);
INSERT INTO international VALUES (567,'WebGUI',6,'F�rhand',1031837015);
INSERT INTO international VALUES (582,'WebGUI',6,'L�mna tom',1031836927);
INSERT INTO international VALUES (581,'WebGUI',6,'L�gg till nytt v�rde',1031836912);
INSERT INTO international VALUES (578,'WebGUI',6,'Du har ett meddelande att godk�nna v�ntandes.',1031836898);
INSERT INTO international VALUES (576,'WebGUI',6,'Radera',1031836869);
INSERT INTO international VALUES (575,'WebGUI',6,'Redigera',1031836853);
INSERT INTO international VALUES (571,'WebGUI',6,'L�s upp tr�d',1031836840);
INSERT INTO international VALUES (570,'WebGUI',6,'L�s tr�d',1031836826);
INSERT INTO international VALUES (516,'WebGUI',6,'Sl� p� Admin!',1031836796);
INSERT INTO international VALUES (522,'WebGUI',6,'Jag skulle vilja bli p�mind via ICQ.',1031836777);
INSERT INTO international VALUES (524,'WebGUI',6,'L�gg till redigerad-st�mpel p� inl�gg?',1031836642);
INSERT INTO international VALUES (542,'WebGUI',6,'F�reg�ende..',1031836615);
INSERT INTO international VALUES (543,'WebGUI',6,'L�gg till en ny bildgrupp.',1031836602);
INSERT INTO international VALUES (527,'WebGUI',6,'Startsida',1031836587);
INSERT INTO international VALUES (538,'WebGUI',6,'Karma-tr�skel',1031836567);
INSERT INTO international VALUES (540,'WebGUI',6,'Karma per inloggning',1031836552);
INSERT INTO international VALUES (513,'WebGUI',6,'F�reg�ende tr�d',1031836539);
INSERT INTO international VALUES (533,'WebGUI',6,'<b>utan</b> orden',1031836528);
INSERT INTO international VALUES (541,'WebGUI',6,'Karma per inl�gg',1031836516);
INSERT INTO international VALUES (517,'WebGUI',6,'Sl� av Admin!',1031836504);
INSERT INTO international VALUES (514,'WebGUI',6,'Vyer',1031836491);
INSERT INTO international VALUES (511,'WebGUI',6,'Tr�dad',1031836478);
INSERT INTO international VALUES (515,'WebGUI',6,'L�gg till redigerad-st�mpel p� inl�gg?',1031836467);
INSERT INTO international VALUES (531,'WebGUI',6,'med den <b>exakta frasen</b>',1031836437);
INSERT INTO international VALUES (521,'WebGUI',6,'Jag skulle vilja bli p�mind via e-post till persons�kare.',1031836411);
INSERT INTO international VALUES (532,'WebGUI',6,'med <b>�tminstone ett</b> av orden',1031836371);
INSERT INTO international VALUES (526,'WebGUI',6,'Ta bort bara JavaScript.',1031836348);
INSERT INTO international VALUES (530,'WebGUI',6,'med <b>alla</b> orden',1031836324);
INSERT INTO international VALUES (528,'WebGUI',6,'Mallnamn',1031836303);
INSERT INTO international VALUES (529,'WebGUI',6,'resultat',1031836291);
INSERT INTO international VALUES (525,'WebGUI',6,'Redigera inneh�llsinst�llningar',1031836278);
INSERT INTO international VALUES (537,'WebGUI',6,'Karma',1031836256);
INSERT INTO international VALUES (536,'WebGUI',6,'En ny anv�ndare kallad ^@; har anslutit till webbplatsen.',1031836246);
INSERT INTO international VALUES (535,'WebGUI',6,'Grupp att varna vid ny anv�ndare',1031836219);
INSERT INTO international VALUES (523,'WebGUI',6,'P�minnelse',1031836205);
INSERT INTO international VALUES (558,'WebGUI',6,'Redigera anv�ndarens karma',1031836195);
INSERT INTO international VALUES (539,'WebGUI',6,'Anv�nd karma?',1031836178);
INSERT INTO international VALUES (534,'WebGUI',6,'Varna vid ny anv�ndare?',1031836166);
INSERT INTO international VALUES (556,'WebGUI',6,'Antal',1031836143);
INSERT INTO international VALUES (607,'WebGUI',6,'<b>Anonyma registreringar</b>\r\nVill Du till�ta bes�kare till din webbplats att registrera sig?\r\n\r\n<b>K�r vid registrering</b>\r\nOm det �terfinns en kommandorad h�r, kommer den att k�ras varje g�ng en anv�ndare registrerar sig anonymt.\r\n\r\n<b>Varning vid ny anv�ndare?</b>\r\nSkall n�gon f� en varning n�r en anv�ndare registrerar sig anonymt?\r\n\r\n<b>Grupp att varna vid ny anv�ndare</b>\r\nVilken grupp skall bli varnad n�r en ny anv�ndare registreras?\r\n\r\n<b>Anv�nd Karma?</b>\r\nSkall karma anv�ndas?\r\n\r\n<b>Karma per inloggning</b>\r\nDen m�ngd karma en anv�ndare skall f� n�r dom loggar in. Denna inst�llning anv�nds bara om karma anv�nds.\r\n\r\n<b>Sessionstimeout</b>\r\nDen m�ngd tid som en session forts�tter vara aktiv (innan man beh�ver logga in p� nytt). Timeoutv�rdet nollst�lls varje g�ng en anv�ndare laddar en sida. D�rf�r, om Du s�tter detta v�rde till �tta timmar, anv�ndaren skulle bli tvungen att logga in p� nytt om han/hon inte be�kt sidan p� �tta timmar.\r\n\r\n<b>Authenticeringsmetod (standard)</b>\r\nVad skall standard-autheticeringsmetoden f�r nya konton vara? De tv� tillg�ngliga alternativen �r WebGUI och LDAP. WebGUI authenticering betyder att anv�ndare authenticeras mot det anv�ndarnamn och l�senord som finns sparat i WebGUI\'s databas. LDAP authenticering betyder att anv�ndare authenticeras mot en extern LDAP server.\r\n\r\n<i>Note:</i> Authenticeringsinst�llningar kan s�ttas per anv�ndare.\r\n\r\n<b>Bindning till anv�ndarnamn</b>\r\nBind WebGUI-anv�ndarnamn till en LDAP-identitet. Detta kr�ver att anv�ndaren har samma anv�ndarnamn i WebGUI som det dom angav i den anonyma registreringsprocessen. Det betyder ocks� att dom inte kan �ndra sitt anv�ndarnamn senare. Denna inst�llning tr�der enbart i kraft om anv�ndaren authenticerar mot LDAP.\r\n\r\n<b>URL till LDAP (standard)</b>\r\nStandards�kv�gen till din LDAP-server. En LDAP-URL skall se ut p� f�ljande s�tt, <b>ldap://[server]:[port]/[base DN]</b>.\r\n\r\n<i>Exempel:</i> ldap://ldap.mittforetag.se:389/o=MittForetag.\r\n\r\n---\r\n\r\nLDAP Identity\r\nThe LDAP Identity is the unique identifier in the LDAP server that the user will be identified against. Often this field is shortname, which takes the form of first initial + last name. Example: jdoe. Therefore if you specify the LDAP identity to be shortname then Jon Doe would enter jdoe during the registration process. \r\n\r\nLDAP Identity Name\r\nThe label used to describe the LDAP Identity to the user. For instance, some companies use an LDAP server for their proxy server users to authenticate against. In the documentation or training already provided to their users, the LDAP identity is known as their Web Username. So you could enter that label here for consitency. \r\n\r\nLDAP Password Name\r\nJust as the LDAP Identity Name is a label, so is the LDAP Password Name. Use this label as you would LDAP Identity Name.',1031836131);
INSERT INTO international VALUES (61,'USS',6,'Anv�ndarinl�ggsystem, l�gg till/redigera',1031834839);
INSERT INTO international VALUES (59,'USS',6,'N�sta inl�gg',1031834797);
INSERT INTO international VALUES (58,'USS',6,'Tidigare inl�gg',1031834779);
INSERT INTO international VALUES (57,'USS',6,'Svar',1031834770);
INSERT INTO international VALUES (53,'USS',6,'Design',1031834723);
INSERT INTO international VALUES (52,'USS',6,'Miniatyrbild',1031834714);
INSERT INTO international VALUES (51,'USS',6,'Visa miniatyrbilder?',1031834699);
INSERT INTO international VALUES (48,'USS',6,'Till�t diskussion?',1031834689);
INSERT INTO international VALUES (47,'USS',6,'Skicka ett svar',1031834680);
INSERT INTO international VALUES (46,'USS',6,'L�s mer...',1031834609);
INSERT INTO international VALUES (45,'USS',6,'�terv�nd till inl�gg',1031834595);
INSERT INTO international VALUES (41,'USS',6,'Datum',1031834546);
INSERT INTO international VALUES (39,'USS',6,'Skicka ett svar',1031834531);
INSERT INTO international VALUES (38,'USS',6,'(V�lj \"Nej\" om du skriver ett HTML/Rich Edit inl�gg)',1031834517);
INSERT INTO international VALUES (590,'WebGUI',6,'Spr�k-ID',1031834347);
INSERT INTO international VALUES (595,'WebGUI',6,'Internationella meddelanden',1031834336);
INSERT INTO international VALUES (598,'WebGUI',6,'Redigera spr�k.',1031834318);
INSERT INTO international VALUES (594,'WebGUI',6,'�vers�tt meddelanden.',1031834291);
INSERT INTO international VALUES (605,'WebGUI',6,'L�gg till grupper',1032434647);
INSERT INTO international VALUES (597,'WebGUI',6,'Redigera Internationella Meddelanden',1031834246);
INSERT INTO international VALUES (596,'WebGUI',6,'SAKNAS',1031834211);
INSERT INTO international VALUES (585,'WebGUI',6,'Hantera �vers�ttningar.',1031834200);
INSERT INTO international VALUES (586,'WebGUI',6,'Spr�k',1031834183);
INSERT INTO international VALUES (591,'WebGUI',6,'Spr�k',1031834175);
INSERT INTO international VALUES (593,'WebGUI',6,'Skicka �vers�ttning.',1031834162);
INSERT INTO international VALUES (587,'WebGUI',6,'�r Du s�ker p� att Du vill ta bort det h�r spr�ket, inklusive all hj�lp och internationella meddelanden som h�r till det?',1031834148);
INSERT INTO international VALUES (553,'WebGUI',6,'Status',1031834095);
INSERT INTO international VALUES (555,'WebGUI',6,'Redigera den h�r anv�ndarens karma.',1031834086);
INSERT INTO international VALUES (501,'WebGUI',6,'Inneh�ll',1031834057);
INSERT INTO international VALUES (30,'USS',6,'Karma per inl�gg',1031834054);
INSERT INTO international VALUES (520,'WebGUI',6,'Jag vill bli p�mind via e-post.',1031834042);
INSERT INTO international VALUES (71,'SyndicatedContent',6,'Syndikatinneh�ll �r inneh�ll som tas fr�n extern webbplats. Formatet p� inneh�llet �r RDF/RSS. Denna teknik anv�nds ofta f�r att dra nyhetsrubriker fr�n webplatser som <a href=\"http://www.cnn.com/\">CNN</a> och <a href=\"http://slashdot.org/\">Slashdot</a>. Det kan sj�lvklart anv�ndas f�r andra saker som sportresultat och aktiekurser.\r\n\r\n<b>URL till RSS-fil</b>\r\nSkriv in exakt URL till (inled med http://) till inneh�llets RDF eller RSS-fil. Inneh�ller kommer laddas ner varje timme.\r\n\r\nDu kan hitta inneh�ll p� f�ljande webbplatser:\r\n\r\n<ul>\r\n<li><a href=\"http://www.newsisfree.com\">http://www.newsisfree.com</a></li>\r\n<li><a href=\"http://www.syndic8.com\">http://www.syndic8.com</a></li>\r\n<li><a href=\"http://www.voidstar.com/node.php?id=144\">http://www.voidstar.com/node.php?id=144</a></li>\r\n<li><a href=\"http://my.userland.com\">http://my.userland.com</a></li>\r\n<li><a href=\"http://www.webreference.com/services/news/\">http://www.webreference.com/services/news/</a></li>\r\n<li><a href=\"http://www.xmltree.com\">http://www.xmltree.com</a></li>\r\n<li><a href=\"http://w.moreover.com/\">http://w.moreover.com/</a></li>\r\n</ul>',1031834039);
INSERT INTO international VALUES (580,'WebGUI',6,'Ditt meddelande har blivit nekat.',1031834021);
INSERT INTO international VALUES (584,'WebGUI',6,'L�gg till ett nytt spr�k.',1031833978);
INSERT INTO international VALUES (579,'WebGUI',6,'Ditt meddelande har blivit godk�nt.',1031833963);
INSERT INTO international VALUES (588,'WebGUI',6,'�r du s�ker p� att du vill skicka denna �vers�ttning till Plain Black f�r inkludering i den officiella distributionen av WebGUI? Genom att klicka p� Ja-l�nken �r du underf�rst�dd med att du ger Plain Black ohindrad tillg�ng till att anv�nda �vers�ttningen i sina mjukvaror.',1032859216);
INSERT INTO international VALUES (507,'WebGUI',6,'Redigera Mall',1031833730);
INSERT INTO international VALUES (519,'WebGUI',6,'Jag vill inte bli p�mind.',1031833690);
INSERT INTO international VALUES (518,'WebGUI',6,'Inkorgsnotifikationer',1031833674);
INSERT INTO international VALUES (504,'WebGUI',6,'Mall',1031833582);
INSERT INTO international VALUES (503,'WebGUI',6,'Mall-ID\r\n',1031833573);
INSERT INTO international VALUES (510,'WebGUI',6,'Platt',1031833536);
INSERT INTO international VALUES (61,'SyndicatedContent',6,'Syndikatinneh�ll, l�gg till/redigera',1031832804);
INSERT INTO international VALUES (71,'SiteMap',6,'Webbplatskartor anv�nds som alternativ navigering i WebGUI. Du kan s�tta upp en traditionell webbplatskarta som visar en hierarkisk vy av webbplatsen, eller bara anv�nda den som extra navigering p� vissa niv�er i webbplatsen.\r\n\r\n<b>Visa beskrivning?</b>\r\nOm du vill visa respektive sidas beskrivning bredvid l�nkar. F�r att det h�r alternativet ska fungera b�r samtliga sidor ha en beskrivning.\r\n\r\n<b>B�rja fr�n denna niv�n?</b>\r\nIf du vill att webbplatskartan ska b�rja fr�n den niv�n du befinner dig p� nu s� bocka h�r. Om du vill att webbplatskartan ska b�rja fr�n f�rstasidan s� bockar du inte i den.\r\n\r\n<b>Djup</b>\r\nHur m�nga niv�er ner ska webbplatskartan g�? Om du s�tter 0 (noll) h�r s� visas samtliga niv�er.\r\n\r\n<b>Indrag</b>\r\nHur m�nga tecken ska indentera varje niv�?\r\n\r\n<b>Kula</b>\r\nV�lj vilken kula som ska vara f�re varje rad. Du kan l�mna det h�r f�ltet blankt om du vill. Du kan �ven v�lja HTML-kulor som � som �. Du kan �ven anv�nda bilder fr�n bildhanteraren genom att anv�nda macrot ^I(kula);\r\n\r\n<b>Linjeh�jd</b>\r\nV�lj hur m�nga radbrytningar som ska vara mellan varje rad. Detta v�rdet b�r vara 1 eller h�gre.\r\n\r\n',1031832684);
INSERT INTO international VALUES (61,'SiteMap',6,'Webbplatskarta, l�gg till/redigera',1031818471);
INSERT INTO international VALUES (71,'SQLReport',6,'SQL-rapporter �n n�got av det mest kraftfulla vapnet i WebGUI\'s arsenal. Den till�ter dig att g�ra sql-fr�gor direkt mot en databas du har tillg�ng till. Kan anv�ndas f�r att integrera en m�ngd olika data i WebGUI.\r\n\r\n<b>K�r macros p� fr�gan</b>\r\nOm du anv�nder macros i din fr�ga s� kryssa i denna ruta.\r\n\r\n<b>Debug?</b>\r\nVill du visa avlusnings- och felmeddelanden p� sidan kryssa i denna ruta.\r\n\r\n<b>Fr�ga</b>\r\nDetta �r en standard SQL-fr�ga. Du kan g�ra fr�gorna med dynamiska genom att anv�nda ^FormParam(); macrot.\r\n\r\n<b>Rapportmall</b>\r\nEn mall f�r hur resultatet kommer presenteras. Normalt anv�nds HTML-tabeller f�r att skapa en snygg rapport. Om du l�mnar f�ltet tomt kommer en standardmall anv�ndas, baserat p� resultatet fr�n SQL-fr�gan.\r\n\r\nDet finns special-macros f�r anv�ndning i SQL-rapporter. Det �r ^-;, ^0;, ^1;, ^2;, ^3; och s� vidare. Dessa macros behandlas oavsett om du kryssat f�r K�r macros tidigare. \"^-;\"-macrot �r en avgr�nsare f�r att visa var loopande material b�rjar och slutar. Det mellan \"^-;\" kommer att visas f�r varje rad av resultatet. De numeriska macron representerar dataf�lten som returneras av fr�gan (^0; �r f�rsta kolumnen osv). Det finns ett extra macro, ^rownum; som r�knar vilken rad loopen �r p� (startar p� 1).\r\n\r\n<b>DSN</b>\r\nData Source Name �r den unika identifieraren som Perl anv�nder sig av f�r att beskriva drivrutin, v�rddator samt databas du vill st�lla fr�gan till. Formatet �r som f�ljer: DBI:[drivrutin]:[databasnamn]:[v�rd].\r\n\r\n<i>Example:</i> DBI:mysql:WebGUI:localhost\r\n\r\n<b>Databasanv�ndare</b>\r\nAnv�ndarnamn f�r din DSN.\r\n\r\n<b>Databasl�senord</b>\r\nL�senorder till din DSN.\r\n\r\n<b>Sidbryt efter</b>\r\nHur m�nga rader kommer visas innan resultatet delas upp i fler sidor? \r\n\r\n<b>Konvertera radbrytning</b>\r\nVill du konvertera radbrytningar i resultatet till HTML-brytningar?',1031818311);
INSERT INTO international VALUES (61,'SQLReport',6,'SQL-rapport, l�gg till/redigera',1031754304);
INSERT INTO international VALUES (9,'Product',6,'Produktbild 3',1031754258);
INSERT INTO international VALUES (8,'Product',6,'Produktbild 2',1031754246);
INSERT INTO international VALUES (7,'Product',6,'Produktbild 1',1031754236);
INSERT INTO international VALUES (557,'WebGUI',6,'Beskrivning',1031752171);
INSERT INTO international VALUES (62,'Product',6,'Produktmall, l�gg till/redigera',1031752165);
INSERT INTO international VALUES (61,'Product',6,'Produktmall',1031752154);
INSERT INTO international VALUES (60,'Product',6,'Mall',1031752147);
INSERT INTO international VALUES (6,'Product',6,'Redigera produkt',1031752141);
INSERT INTO international VALUES (59,'Product',6,'Namn',1031752134);
INSERT INTO international VALUES (58,'Product',6,'Redigera produktmall',1031752128);
INSERT INTO international VALUES (57,'Product',6,'�r du s�ker p� att du vill ta bort denna mallen och l�ta alla produkter anv�nda standardmallen.',1031752119);
INSERT INTO international VALUES (56,'Product',6,'L�gg till en produktmall.',1031752065);
INSERT INTO international VALUES (55,'Product',6,'L�gg till f�rdel',1031752048);
INSERT INTO international VALUES (54,'Product',6,'F�rdelar',1031752039);
INSERT INTO international VALUES (53,'Product',6,'Redigera f�rdel',1031752033);
INSERT INTO international VALUES (52,'Product',6,'L�gg till fler f�rdelar?',1031751996);
INSERT INTO international VALUES (51,'Product',6,'F�rdel',1031751984);
INSERT INTO international VALUES (50,'Product',6,'F�rdelar �r ett resultat av produktens egenskaper. De f�rklara varf�r din produkt �r den b�sta. L�gger du till f�rdelar b�r du ocks� l�gga till egenskaper.\r\n\r\n<b>F�rdel</b>\r\nDu kan l�gga till en ny f�rdel eller anv�nda en du redan skrivit in.\r\n\r\n<b>Forts�tt att l�gga till f�rdelar?</b>\r\nVill du l�gga till fler f�rdelar v�ljer du Ja h�r.',1031751977);
INSERT INTO international VALUES (5,'Product',6,'�r du s�ker p� att du vill ta bort denna produktspecifikation?',1031751821);
INSERT INTO international VALUES (49,'Product',6,'Produktf�rdel, l�gg till/redigera',1031751804);
INSERT INTO international VALUES (48,'Product',6,'�r du s�ker p� att du vill ta bort denna f�rdelen? Den kan inte tas tillbaka efter borttagning.',1031751703);
INSERT INTO international VALUES (47,'Product',6,'Relaterade produkter �r produkter som �r likv�rdiga eller som kompletterar varandra.\r\n\r\n<b>Relaterade produkter</b>\r\nV�lj en produkt fr�n listan med tidigare skapade produkter.\r\n\r\n<b>Forts�tt l�gga till relaterad produkt?</b>\r\nV�lj Ja om du har ytterligare relaterade produkter.',1031751664);
INSERT INTO international VALUES (46,'Product',6,'Produkt (relaterad), l�gg till/redigera',1031750934);
INSERT INTO international VALUES (45,'Product',6,'Tillbeh�r �r produkter som kan ut�ka och/eller f�rb�ttra andra produkter.\r\n\r\n<b>Tillbeh�r</b>\r\nV�lj fr�n en lista med redan upplagda produkter.\r\n\r\n<b>Forts�tt med att l�gga till tillbeh�r?</b>\r\nV�lj Ja om du vill forts�tta l�gga till tillbeh�r.',1031750754);
INSERT INTO international VALUES (44,'Product',6,'Produktillbeh�r, l�gg till/redigera',1031750680);
INSERT INTO international VALUES (43,'Product',6,'Specifikationer �r den tekniska beskrivningen av produkten.\r\n\r\n<b>Etikett</b>\r\nTyp av specifikation. Till exempel h�jd, bredd, vikt eller f�rg. Du kan v�lja en du valt till andra produkter eller skriva in en nya.\r\n\r\n<b>Specifikation</b>\r\nDet faktiska v�rdet p� etiketten. Valde du till exempel vikt som etikett s� s�tter du specifikationen till 18 (om din produkt v�ger 18 kilo).\r\n\r\n<b>Enheter</b>\r\nI vilken enhet m�ts etiketten? Valde du vikt ovan som exempel s� skriver du \"kg\" eller \"kilo\" h�r.\r\n\r\n<b>L�gg till fler specifikationer?</b>\r\nV�lj Ja om du vill l�gga till fler.',1031750622);
INSERT INTO international VALUES (42,'Product',6,'Produktspecifikation, l�gg till/redigera',1031749830);
INSERT INTO international VALUES (41,'Product',6,'Egenskaper �r s�ljande fraser f�r produkten. Anv�nds som f�rs�ljningsargument f�r �kad f�rs�ljning.\r\n\r\n<b>Egenskap</b>\r\nDu kan l�gga till en ny egenskap eller v�lja en som du skrivit p� en tidigare inlagd produkt.\r\n\r\n<b>Forts�tt med att l�gga till egenskaper?</b>\r\nSvara Ja om du vill forts�tta l�gga till egenskaper.',1031749794);
INSERT INTO international VALUES (40,'Product',6,'Produktegenskap, l�gg till/redigera',1031749653);
INSERT INTO international VALUES (4,'Product',6,'�r du s�ker p� att du vill ta bort relationen mellan produkterna?',1031749639);
INSERT INTO international VALUES (39,'Product',6,'WebGUI har inbyggt produkthanteringssystem som g�r det enkelt f�r dig att publicera dina produkter och tj�nster p� webben.\r\n\r\n<b>Pris</b>\r\nProduktens pris. Du kan �ven skriva in text som till exempel \"ring f�r offert\", eller l�mna f�ltet tomt.\r\n\r\n<b>Produktnummer</b>\r\nProduktens nummer, SKU, ISBN, eller annan identifiering av denna produkt.\r\n\r\n<b>Produkt bild 1</b>\r\nEn bild p� produkten.\r\n\r\n<b>Produkt bild 2</b>\r\nEn bild p� produkten.\r\n\r\n<b>Produkt bild 3</b>\r\nEn bild p� produkten.\r\n\r\n<b>Broschyr</b>\r\nProduktens broschyr.\r\n\r\n<b>Manual</b>\r\nProdukt-, anv�ndar- eller servicemanual f�r produkten.\r\n\r\n<b>Garanti</b>\r\nProduktens garantivillkor.',1031749615);
INSERT INTO international VALUES (38,'Product',6,'Produkt, l�gg till/redigera',1031749311);
INSERT INTO international VALUES (37,'Product',6,'L�gg till relaterad produkt.',1031749300);
INSERT INTO international VALUES (36,'Product',6,'L�gg till tillbeh�r.',1031749290);
INSERT INTO international VALUES (35,'Product',6,'L�gg till specifikation.',1031749281);
INSERT INTO international VALUES (34,'Product',6,'L�gg till egenskap.',1031749269);
INSERT INTO international VALUES (33,'Product',6,'Relaterade produkter',1031749259);
INSERT INTO international VALUES (32,'Product',6,'Tillbeh�r',1031749251);
INSERT INTO international VALUES (31,'Product',6,'Specifikationer',1031749242);
INSERT INTO international VALUES (30,'Product',6,'Egenskaper',1031749232);
INSERT INTO international VALUES (3,'Product',6,'�r du s�ker p� att du vill ta bort denna egenskapen?',1031749225);
INSERT INTO international VALUES (29,'Product',6,'Enheter',1031749207);
INSERT INTO international VALUES (28,'Product',6,'L�gg till ytterligare specifikation?',1031749200);
INSERT INTO international VALUES (27,'Product',6,'Specifikation',1031749186);
INSERT INTO international VALUES (26,'Product',6,'Etikett',1031749176);
INSERT INTO international VALUES (25,'Product',6,'Redigera specifikation',1031748562);
INSERT INTO international VALUES (24,'Product',6,'L�gg till fler egenskaper?',1031748550);
INSERT INTO international VALUES (23,'Product',6,'Egenskap',1031748540);
INSERT INTO international VALUES (22,'Product',6,'Redigera egenskap',1031748534);
INSERT INTO international VALUES (21,'Product',6,'L�gg till mer relaterade produkter?',1031748521);
INSERT INTO international VALUES (20,'Product',6,'Relaterad produkt',1031748509);
INSERT INTO international VALUES (2,'Product',6,'�r du s�ker p� att du vill ta bort produktens relation med detta tillbeh�r?',1031748500);
INSERT INTO international VALUES (19,'Product',6,'L�gg till relaterad produkt',1031748475);
INSERT INTO international VALUES (18,'Product',6,'L�gg till fler tillbeh�r?',1031748465);
INSERT INTO international VALUES (17,'Product',6,'Tillbeh�r',1031748453);
INSERT INTO international VALUES (16,'Product',6,'L�gg till tillbeh�r',1031748445);
INSERT INTO international VALUES (15,'Product',6,'Garanti',1031748436);
INSERT INTO international VALUES (14,'Product',6,'Manual',1031748429);
INSERT INTO international VALUES (13,'Product',6,'Broschyr',1031748371);
INSERT INTO international VALUES (728,'WebGUI',6,'�r du s�ker p� att du vill ta bort denna filen?',1031748345);
INSERT INTO international VALUES (11,'Product',6,'Produktnummer',1031748332);
INSERT INTO international VALUES (10,'Product',6,'Pris',1031748322);
INSERT INTO international VALUES (1,'Product',6,'Produkt',1031748316);
INSERT INTO international VALUES (72,'Poll',6,'Slumpa svaren?',1031748307);
INSERT INTO international VALUES (71,'Poll',6,'R�stningar kan hj�lpa dig g�ra unders�kningar om hur hur dina anv�ndare t�nker samt vilka synpunkter dom har. \r\n\r\n<b>Aktiv</b>\r\nOm den �r kryssad s� kan anv�ndarna r�sta, annars ser de bara resultatet av r�stningen.\r\n\r\n<b>Vem kan r�sta?</b>\r\nV�lj en grupp som kan r�sta.\r\n\r\n<b>Karma per r�st</b>\r\nHur mycket karma ges till en anv�ndare som r�star.\r\n\r\n<b>Bredd p� graf</b>\r\nBredden p� grafen som visar resultatet. Bredden m�ts i pixlar.\r\n\r\n<b>Fr�ga</b>\r\nVad �r fr�gan du vill st�lla?\r\n\r\n<b>Svar</b>\r\nSkriv ner de m�jliga svarsalternativen p� fr�gan, ett svar per rad. En r�stning kan som mest inneh�lla 20 svar.\r\n\r\n<b>Slumpa svar</b>\r\nF�r att vara s�ker p� att svarens ordning inte p�verkar r�starna svara Ja h�r. Svarens ordning kommer slumpas fram f�r varje g�ng sidan visas.\r\n\r\n<b>Nollst�ll svar</b>\r\nNollst�ller r�stningen.\r\n\r\n<hr>\r\n\r\n<b><i>Note:</i></b> F�ljande stilmallar anv�nds p� r�stnings wobjektet.\r\n\r\n<b>.pollAnswer</b>\r\nSvaret p� en r�stning.\r\n\r\n<b>.pollColor</b>\r\nF�rgen p� procent-m�taren.\r\n\r\n<b>.pollQuestion</b>\r\nFr�gan p� r�stningen.',1031748292);
INSERT INTO international VALUES (61,'Poll',6,'R�stning, l�gg till/redigera',1031745609);
INSERT INTO international VALUES (20,'Poll',6,'Karma per r�st',1031745596);
INSERT INTO international VALUES (71,'MessageBoard',6,'Meddelandeforum, �ven kallat diskussionsgrupper, �r ett enkelt s�tt att skapa en interaktiv och levande webbplats. Meddelandeforumen kan �ven vara av intern karakt�r.\r\n\r\n<b>Meddelanden per sida</b>\r\nN�r en bes�kare f�rst kommer till meddelandeforumet kommer denna att presenteras en lista med alla �mnen (�ven kallat tr�dar). Meddelanden per sida anger hur m�nga �mnen som kommer visas p� varje sida.\r\n\r\n<b>Vem kan skicka inl�gg?</b>\r\nV�lj en grupp som till�ts skicka inl�gg.\r\n\r\n<b>Redigerings-timeout</b>\r\nHur l�ng tid har en anv�ndare p� sig att redigera dennes inl�gg innan det blir l�st?\r\n\r\n<i>Note:</i> S�tt inte denna gr�nsen f�r h�gt. En av de bra sakerna med diskussionsforum �r att de �r en komplett historik �ver vad som sagts. Om anv�ndarna till�ts g� tillbaka och �ndra l�ngt bak i tiden kan det f�rvirra.\r\n\r\n<b>Karma per inl�gg</b>\r\nHur mycket karma ska ges till anv�ndaren f�r ett inl�gg?\r\n\r\n<b>Vem kan moderera?</b>\r\nV�lj en grupp som modererar forumet.\r\n\r\n<b>Modereringstyp?</b>\r\nDu kan v�lja vilken typ av moderering av anv�ndarnas inl�gg. <i>Efterhand</i> menar att inl�gget visas f�r alla direkt och att moderatorn kan ta bort det i efterhand. <i>F�rhand</i> menas att moderatorn m�ste godk�nna inl�gget innan det publiceras f�r allm�nheten.\r\n\r\n<i>Note:</i> Moderatorerna kan alltid g� in och redigera och ta bort inl�gg, oavsett modereringstyp.',1031745585);
INSERT INTO international VALUES (61,'MessageBoard',6,'Meddelandeforum, l�gg till/redigera',1031743614);
INSERT INTO international VALUES (9,'MailForm',6,'L�gg till f�lt',1031743583);
INSERT INTO international VALUES (8,'MailForm',6,'Bredd',1031743574);
INSERT INTO international VALUES (72,'MailForm',6,'Du kan l�gga till s� m�nga extra f�lt du vill.\r\n\r\n<b>F�ltnamn</b>\r\nNamnet p� f�ltet. M�ste vara unikt bland samtliga f�lt p� formul�ret.\r\n\r\n<b>Status</b>\r\nG�mda f�lt kommer inte vara synliga f�r anv�ndaren, men kommer �nd� skickas med i e-postmeddelandet. Visade v�lt �r synliga f�r anv�ndaren, men inte modifierbara. �ndringsbara f�lt fylls i av anv�ndaren. Om du v�ljer g�md eller visad s� gl�m inte att fylla i ett standardv�rde.\r\n\r\n<b>Typ</b>\r\nV�lj en typ av formul�relement f�r detta f�lt. F�ljande element st�ds:\r\n<b>URL:</b> En textruta som automatiskt formaterar URL\'er.\r\n<b>Textbox:</b> En textruta.\r\n<b>Datum:</b> En textruta med knapp som �ppnar en kalender i vilken du kan v�lja datum.\r\n<b>Ja/Nej:</b> Ja/Nej-valsknappar.\r\n<b>E-postadress:</b> En textruta som kr�ver att anv�ndaren skriver in en giltig e-postadress.\r\n<b>Textarea:</b> En textruta med flera rader.\r\n<b>Kryssruta:</b> En ruta som kan vara bockad eller inte.\r\n<b>Drop-down:</b> En textruta f�r f�rinst�llda alternativ och utan m�jlighet att skriva sj�lv. L�gg till de f�rinst�llda alternativen genom att skriva dom en p� varje rad i rutan M�jliga val.\r\n\r\n<b>M�jliga val</b>\r\nDetta f�ltet anv�nds enbart f�r drop-down. Skriv in vilka alternativ du vill ha, en per rad.\r\n\r\n<b>Standardv�rde</b>\r\nV�lj standardv�rdet f�r f�ltet. Kan �ven l�mnas tom. F�r Ja/Nej-f�lt skriv ja f�r att v�lja Ja och nej f�r Nej. F�r kryssrutor skriver du \"checked\" f�r att kryssa f�r rutan.\r\n\r\n<b>Forts�tt med att l�gga till fler f�lt?</b>\r\nL�t denna vara bockad om du vill l�gga till fler f�lt.',1031743559);
INSERT INTO international VALUES (71,'MailForm',6,'Detta wobjekt skapar ett enkelt formul�r som skickas till vald e-postadress.\r\n\r\n<b>Bredd</b>\r\nBredden p� alla f�lt i formul�ret. Standardv�rdet �r 45.\r\n\r\n<b>Fr�n, Till, Cc, Bcc, �mne</b>\r\nDessa f�lt kontrollerar hur e-postmeddelandet kommer se ut och vem det kommer komma till. Du kan ge bes�karna valfrihet att sj�lva v�lja vilka f�lt som ska vara redigeringsbara, men vanligtvis �r de �r endast Fr�n och �mne m�jliga att �ndra. Anv�nd drop-down f�lten vid varje f�lt f�r att v�lja om de ska vara redigeringsbara.\r\n\r\nDu kan �ven anv�nda ett WebGUI anv�ndarnamn eller grupp i Till-f�ltet f�r att skicka till den anv�ndaren/gruppen.\r\n\r\n<b>Bekr�ftelse</b>\r\nDetta meddelande kommer visas f�r anv�ndaren efter de klickar p� \"Skicka\".\r\n\r\n<b>Spara mail?</b>\r\nOm du v�ljer \"Ja\" h�r kommer e-postmeddelanden som postas sparas i en databas. Ett verktyg f�r att se e-posten i databasen �r under utveckling.\r\n\r\n<b>Forts�tt med att l�gga till f�lt?</b>\r\nL�t denna vara bockad f�r att l�gga till f�lt direkt.',1031737418);
INSERT INTO international VALUES (26,'MailForm',6,'Spara mail?',1031735211);
INSERT INTO international VALUES (7,'MailForm',6,'Redigera e-postformul�r',1031735170);
INSERT INTO international VALUES (62,'MailForm',6,'E-postformul�rf�lt, l�gg till/redigera',1031735145);
INSERT INTO international VALUES (61,'MailForm',6,'E-postformul�r, l�gg till/redigera',1031733901);
INSERT INTO international VALUES (6,'MailForm',6,'�ndringsbar',1031733885);
INSERT INTO international VALUES (5,'MailForm',6,'Visad',1031733868);
INSERT INTO international VALUES (4,'MailForm',6,'G�mt',1031733861);
INSERT INTO international VALUES (3,'MailForm',6,'Tack f�r ditt mail!',1031733849);
INSERT INTO international VALUES (25,'MailForm',6,'Standardv�rde (valfritt)',1031733356);
INSERT INTO international VALUES (24,'MailForm',6,'M�jliga v�rden (endast drop-down)',1031733343);
INSERT INTO international VALUES (23,'MailForm',6,'Typ',1031733323);
INSERT INTO international VALUES (22,'MailForm',6,'Status',1031733317);
INSERT INTO international VALUES (21,'MailForm',6,'F�ltnamn',1031733311);
INSERT INTO international VALUES (20,'MailForm',6,'Redigeringsf�lt',1031733304);
INSERT INTO international VALUES (2,'MailForm',6,'Ditt �mne h�r',1031733291);
INSERT INTO international VALUES (19,'MailForm',6,'�r du s�ker p� att du vill ta bort detta f�lt?',1031733279);
INSERT INTO international VALUES (18,'MailForm',6,'G� tillbaka!',1031733218);
INSERT INTO international VALUES (17,'MailForm',6,'E-post skickad',1031733209);
INSERT INTO international VALUES (16,'MailForm',6,'Bekr�ftelse',1031733188);
INSERT INTO international VALUES (15,'MailForm',6,'Forts�tt med att l�gga till fler f�lt?',1031733154);
INSERT INTO international VALUES (14,'MailForm',6,'�mne',1031733136);
INSERT INTO international VALUES (13,'MailForm',6,'Bcc',1031733130);
INSERT INTO international VALUES (12,'MailForm',6,'Cc',1031733124);
INSERT INTO international VALUES (11,'MailForm',6,'Till (e-postadress, anv�ndarnamn eller gruppnamn)',1031733109);
INSERT INTO international VALUES (10,'MailForm',6,'Fr�n',1031733088);
INSERT INTO international VALUES (1,'MailForm',6,'E-postformul�r',1031733080);
INSERT INTO international VALUES (73,'LinkList',6,'<b>Titel</b>\r\nText som kommer bli l�nkad.\r\n\r\n<b>URL</b>\r\nWebbplats l�nken leder till. <i>Exempel:</i> http://www.google.com.\r\n\r\n<b>�ppna i nytt f�nster</b>\r\nV�lj \"Ja\" om du vill att l�nken ska �ppna ett nytt f�nster.\r\n\r\n<b>Beskrivning</b>\r\nKort beskrivning av webbplatsen l�nken g�r till. Du kan l�mna det h�r f�ltet tomt.\r\n\r\n<b>Forts�tt med att l�gga till l�nk?</b>\r\nOm du har fler l�nkar att l�gga till v�ljer du \"Ja\".',1031732803);
INSERT INTO international VALUES (72,'LinkList',6,'L�nk, l�gg till/redigera',1031732662);
INSERT INTO international VALUES (71,'LinkList',6,'L�nklistor �r precis vad det l�ter som, en lista med l�nkar. M�nga webbplatser har en l�nksektion och det h�r wobjektet hj�lper dig skapa en s�dan.\r\n\r\n<b>Indentering</b>\r\nHur m�nga bokst�vers indentering f�r varje l�nk?\r\n\r\n<b>Linjeavst�nd</b>\r\nHur m�nga radbrytningar mellan varje l�nk?\r\n\r\n<b>Kula</b>\r\nV�lj vilken typ av kula som ska anv�ndas i b�rjan p� varje rad. Du kan l�mna det h�r f�ltet tomt om du vill. Du kan �ven v�lja HTML-kulor som � och �. Du kan �ven anv�nda bilder fr�n bildhanteraren genom att anv�nda ett macro typ ^I(bullet);.\r\n\r\n<b>Forts�tt med att l�gga till l�nk?</b>\r\nL�t den h�r st� p� \"Ja\" f�r att l�gga till l�nkar direkt.\r\n\r\n<b>Stilmall</b>\r\nEn extra stilmallsklass har lagts till f�r l�nklistan.\r\n<b>.linkTitle</b> Anv�nd denna f�r att manipulera utseendet f�r titeln p� varje l�nk.',1031732417);
INSERT INTO international VALUES (61,'LinkList',6,'L�nklista, l�gg till/redigera',1031732010);
INSERT INTO international VALUES (61,'Item',6,'Objekt, l�gg till/redigera',1031731997);
INSERT INTO international VALUES (6,'Item',6,'Redigera objekt',1031731985);
INSERT INTO international VALUES (3,'Item',6,'Ta bort bilaga',1031731976);
INSERT INTO international VALUES (73,'FAQ',6,'<b>Fr�ga</b>\r\nSkriv in fr�gan du vill ha i din FAQ.\r\n\r\n<b>Svar</b>\r\nSkriv in svaret p� fr�gan ovan.\r\n\r\n<b>Forts�tt med att l�gga till fr�gor?</b>\r\nOm du har fler fr�gor att l�gga till v�ljer du \"Ja\".',1031731966);
INSERT INTO international VALUES (72,'FAQ',6,'Fr�ga, l�gga till/redigera',1031731897);
INSERT INTO international VALUES (71,'FAQ',6,'Det verkar som i princip varenda webbplats har en \"Frequently Asked Questions\"-sektion (ofta st�llda fr�gor). Det h�r �r ett wobject som hj�lper dig bygga din egen.<p><b>S�tt p� inneh�llsf�rteckning?</b><br>Om du vill visa en inneh�llsf�rteckning f�r din FAQ. En inneh�llsf�rteckning listar l�nkar till alla fr�gor i FAQ\'n l�ngst upp p� sidan.<p><b>S�tt p� Q/A?</b><br>V�lj om du vill att det ska st� ett Q: framf�r varje fr�n och ett A: framf�r varje svar.<p><b>S�tt p� [top]-l�nk?</b><br>[top] kommer visas varje fr�ga och svar. Klickar man p� den l�nken s� kommer man l�ngst upp p� sidan. Anv�nds oftast i samband med en inneh�llsf�rteckning.<p><b>Forts�tt med att l�gga till fr�gor?</b><br>L�t den vara bockad om du vill l�gga till fr�gor direkt efter du skapat din FAQ.<p><hr><p><b><i>Note:</i></b> F�ljande stilar �r specifika f�r FAQ.<p><b>.faqQuestion</b><br>En FAQ-fr�ga. F�r att s�rskilja den fr�n ett svar.',1032859954);
INSERT INTO international VALUES (61,'FAQ',6,'FAQ, l�gg till/redigera',1031669931);
INSERT INTO international VALUES (13,'FAQ',6,'S�tt p� [top] l�nk?',1031669852);
INSERT INTO international VALUES (12,'FAQ',6,'S�tt p� Q/A?',1031669840);
INSERT INTO international VALUES (11,'FAQ',6,'S�tt p� inneh�llsf�rteckning?',1031669826);
INSERT INTO international VALUES (71,'ExtraColumn',6,'Extra kolumner l�ter dig �ndra layout p� endast en sida. Om du vill ha fler kolumner p� samtliga sidor b�r du �verv�ga att �ndra p� stilen som s�tts p� dina sidor eller anv�nda en <i>mall</i> ist�llet f�r en extra kolumn.\r\n\r\nKolumner l�ggs alltid till fr�n v�nster till h�ger. Tidigare material kommer flyttas till v�nster om den nya kolumnen.\r\n\r\n<b>Mellanrum</b>\r\nMellanrum �r avst�ndet mellan existerande inneh�ll och din nya kolumn. M�ts i antalet pixlar.\r\n\r\n<b>Bredd</b>\r\nHur bred vill du att kolumnen ska vara? M�ts i antalet pixlar.\r\n\r\n<b>Stilmallsklass (style sheet class)</b>\r\nStandard anv�nds <i>content</i>-stilen (samma som �vrig text p� hemsidan). Om du har skapat en egen stil f�r kolumner s� kan du �ndra till den h�r.',1031669809);
INSERT INTO international VALUES (61,'ExtraColumn',6,'Extra kolumn, l�gg till/redigera',1031667836);
INSERT INTO international VALUES (78,'EventsCalendar',6,'Ta inte bort n�got, jag klickade fel.',1031667821);
INSERT INTO international VALUES (77,'EventsCalendar',6,'Ta bort denna h�ndelse <b>och</b> alla av dess �terkommande h�ndelser.',1031667806);
INSERT INTO international VALUES (76,'EventsCalendar',6,'Ta enbart bort denna h�ndelse.',1031667761);
INSERT INTO international VALUES (75,'EventsCalendar',6,'Vilket vill du g�ra?',1031667747);
INSERT INTO international VALUES (74,'EventsCalendar',6,'Kalender, m�nad (liten)',1031667730);
INSERT INTO international VALUES (73,'EventsCalendar',6,'<b>Titel</b>\r\nTiteln f�r denna h�ndelse.\r\n\r\n<b>Beskrivning</b>\r\nBeskrivning av aktiviteter f�r denna h�ndelse eller �vrig information om aktiviteten.\r\n\r\n<b>Start datum</b>\r\nVilket datum kommer det b�rja?\r\n\r\n<b>Slut datum</b>\r\nVilket datum slutar det p�?\r\n\r\n<b>�terkommer varje</b>\r\nV�lj ett �terkomstintervall f�r denna h�ndelse.\r\n\r\n<b>Forts�tt med att l�gga till h�ndelse?</b>\r\nOm du vill forts�tta l�gga till h�ndelser l�ter du \"Ja\" vara valt.',1031667712);
INSERT INTO international VALUES (71,'EventsCalendar',6,'H�ndelsekalendrar anv�nds p� m�nga intran�t f�r att h�lla reda p� interna datum som p�verkar hela organisationen. Kalendrar p� handelsinriktade webbplatser �r ett bra s�tt att l�ta kunderna veta bl.a. vilka m�ssor/utst�llningar du kommer att medverka p�.\r\n\r\n<b>Visningsformat</b>\r\nDetta kan s�ttas till <i>Lista</i> eller <i>kalender</i>. N�r du v�ljer <i>lista</i> kommer h�ndelserna vara listade efter datum (h�ndelser som redan intr�ffat kommer inte att visas). Den h�r typen passar b�st n�r det inte h�nder mer �n ett par saker varje m�nad. Om du v�ljer <i>kalender</i> s� kommer h�ndelserna visas p� en m�nadskalender som det g�r att bl�ddra i. Den h�r formatet passar sig b�st vid m�nga h�ndelser varje m�nad.\r\n\r\n<b>Radbryt efter</b>\r\nN�r du anv�nder <i>list</i>-formatet s� anger du h�r hur m�nga h�ndelser som kommer visas per sida.\r\n\r\n<b>Forts�tt med att l�gga till h�ndelse?</b>\r\nL�t den h�r vara inst�lld p� \"Ja\" f�r att direkt kunna l�gga in h�ndelser.\r\n\r\n<hr>\r\n<b><i>Note:</i></b> F�ljande stil �r specifik f�r h�ndelsekalendern.\r\n\r\n<b>.eventTitle</b>\r\nTiteln f�r en enskild h�ndelse.',1031667571);
INSERT INTO international VALUES (72,'EventsCalendar',6,'H�ndelse, l�gg till/redigera',1031666394);
INSERT INTO international VALUES (61,'EventsCalendar',6,'H�ndelsekalender, l�gg till/redigera',1031666373);
INSERT INTO international VALUES (21,'EventsCalendar',6,'Forts�tt att l�gga till h�ndelse?',1031666359);
INSERT INTO international VALUES (20,'EventsCalendar',6,'L�gg till en h�ndelse.',1031666339);
INSERT INTO international VALUES (73,'FileManager',6,'<b>Filtitel</b>\r\nTitel som kommer visas f�r denna nerladdning.\r\n\r\n<b>Fil</b>\r\nV�lj en fil fr�n din h�rddisk som kommer laddas upp till nerladdningshanteraren.\r\n\r\n<b>Alternativ version #1</b>\r\nEn alternativ version till filen ovan. �r filen ovan t.ex. en JPEG s� kan alternativet vara samma bild fast i TIFF-format.\r\n\r\n<b>Alternativ version #2</b>\r\nEn alternativ version till filen ovan. �r filen ovan t.ex. en JPEG s� kan alternativet vara samma bild fast i TIFF-format.\r\n\r\n<b>Kort beskrivning</b>\r\nKort beskrivning av filen. Kom ih�g att anv�nda nyckelord som anv�ndaren kan t�nkas anv�nda n�r denne s�ker p� webbplatsen.\r\n\r\n<b>Nerladdningsgrupp</b>\r\nAvgr�nsa m�jligheten att ladda ner filen till denna gruppen.\r\n\r\n<b>Forts�tt med att ladda upp mer filer f�r nerladdning?</b>\r\nV�lj \"Ja\" om du har mer filer att ladda upp.',1031665984);
INSERT INTO international VALUES (72,'FileManager',6,'Nerladdning, l�gg till/redigera',1031664814);
INSERT INTO international VALUES (71,'FileManager',6,'Nerladdningshanteraren �r designad f�r att hj�lpa dig hantera distrubitionen av filer p� din site. Den hj�lper dig v�lja vilka som ska ha tilltr�de till filerna.\r\n\r\n<b>Radbryt efter</b>\r\nHur m�nga filer ska visas innan resultatet delas upp i sidor? Med andra ord, hur m�nga filer per sida?\r\n\r\n<b>Visa miniatyrbilder?</b>\r\nKlicka f�r denna och du vill att anv�ndaren ska se miniatyrbilder av bilder du laddat upp. Notera att miniatyrbilden endast syns f�r huvudfilen. F�r alternativa versioner visas inga miniatyrbilder.\r\n\r\n<b>Forts�tt med att l�gga upp filer?</b>\r\nOm du vill b�rja l�gga upp filer direkt s� l�t denna vara kryssad.',1031664796);
INSERT INTO international VALUES (61,'FileManager',6,'Nerladdningshanteraren, l�gg till/redigera',1031664577);
INSERT INTO international VALUES (22,'FileManager',6,'Forts�tt med att l�gga till fil f�r nerladdning?',1031664251);
INSERT INTO international VALUES (21,'FileManager',6,'Visa miniatyrbilder?',1031664210);
INSERT INTO international VALUES (71,'Item',6,'Precis som artiklar �r objekt den Schweiziska Arm�kniven f�r WebGUI. De flesta delar av statiskt inneh�ll kan l�ggas till via ett objekt, men objekt anv�nds oftast f�r mindre inneh�ll �n artiklar.\r\n\r\n<b>L�nk URL</b>\r\nDenna URL kommer anslutas till titeln p� objektet.\r\n\r\n<i>Exempel:</i> http://www.google.com\r\n\r\n<b>Bilaga</b>\r\nOm du vill bifoga en Word-fil, zip-fil eller n�gon annan typ av fil f�r nerladdning v�ljer du fr�n h�rddisken.\r\n',1031663580);
INSERT INTO international VALUES (61,'Article',6,'Artikel, L�gg till/Redigera',1031652255);
INSERT INTO international VALUES (654,'WebGUI',6,'Stilar, ta bort',1031651503);
INSERT INTO international VALUES (652,'WebGUI',6,'Anv�ndarinst�llningar, redigera',1031651489);
INSERT INTO international VALUES (739,'WebGUI',1,'UI Level',1033832377);
INSERT INTO international VALUES (738,'WebGUI',1,'9 Guru',1033836704);
INSERT INTO international VALUES (737,'WebGUI',1,'8 Master',1033836698);
INSERT INTO international VALUES (736,'WebGUI',1,'7 Expert',1033836692);
INSERT INTO international VALUES (735,'WebGUI',1,'6 Professional',1033836686);
INSERT INTO international VALUES (734,'WebGUI',1,'5 Adept',1033836678);
INSERT INTO international VALUES (733,'WebGUI',1,'4 Skilled',1033836668);
INSERT INTO international VALUES (732,'WebGUI',1,'3 Rookie',1033836660);
INSERT INTO international VALUES (731,'WebGUI',1,'2 Trained',1033836651);
INSERT INTO international VALUES (730,'WebGUI',1,'1 Novice',1033836642);
INSERT INTO international VALUES (729,'WebGUI',1,'0 Beginner',1033836631);
INSERT INTO international VALUES (106,'WebGUI',11,'\"���� \"\"���\"\" ������ ���� ������� ���� ������� ��� ������ ��� ��� �������\"',1031514049);
INSERT INTO international VALUES (105,'WebGUI',11,'�����. ����',1031514049);
INSERT INTO international VALUES (104,'WebGUI',11,'����� ������ ������',1031514049);
INSERT INTO international VALUES (103,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (102,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (101,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� ������ � ���������ǡ ��� �� ���� �� ���Ͽ',1031514049);
INSERT INTO international VALUES (100,'WebGUI',11,'������ �����',1031514049);
INSERT INTO international VALUES (99,'WebGUI',11,'���   (�����)',1031514049);
INSERT INTO international VALUES (95,'WebGUI',11,'���� ��������',1031514049);
INSERT INTO international VALUES (94,'WebGUI',11,'���� �����',1031514049);
INSERT INTO international VALUES (93,'WebGUI',11,'������  (�������)',1031514049);
INSERT INTO international VALUES (92,'WebGUI',11,'������ �������',1031514049);
INSERT INTO international VALUES (91,'WebGUI',11,'������ �������',1031514049);
INSERT INTO international VALUES (90,'WebGUI',11,'����� ������ �����',1031514049);
INSERT INTO international VALUES (89,'WebGUI',11,'���������',1031514049);
INSERT INTO international VALUES (88,'WebGUI',11,'������ ����������',1031514049);
INSERT INTO international VALUES (87,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (86,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� �������ɿ ���� ������� ��� ��� �� ������ ����� ������ǡ ������ �� ���������� �������� ���� ��������.',1031514049);
INSERT INTO international VALUES (85,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (84,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (82,'WebGUI',11,'����� ������...',1031514049);
INSERT INTO international VALUES (81,'WebGUI',11,'�� ����� ������ ����� !',1031514049);
INSERT INTO international VALUES (80,'WebGUI',11,'�� ����� ������ ����� !',1031514049);
INSERT INTO international VALUES (79,'WebGUI',11,'���� ������� �������LDAP',1031514049);
INSERT INTO international VALUES (78,'WebGUI',11,'���� ���� �� �����. ���� ����� ��������',1031514049);
INSERT INTO international VALUES (77,'WebGUI',11,'��� ��� ������ ���� ������ ������ ��� ��� ���� ������. ���� ������ ��� ������ ���. ����� ���� ��������� ������:',1031514049);
INSERT INTO international VALUES (76,'WebGUI',11,'����� ��� ������ ���������� ��� ����� ������ ��������',1031514049);
INSERT INTO international VALUES (75,'WebGUI',11,'�� ����� ������ ����� ��� ������',1031514049);
INSERT INTO international VALUES (74,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (73,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (72,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (71,'WebGUI',11,'������� ���� ����',1031514049);
INSERT INTO international VALUES (70,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (69,'WebGUI',11,'���� ������� ����� ������ ����� �� ��������',1031514049);
INSERT INTO international VALUES (68,'WebGUI',11,'�� ���� ������ ��� ������ ��� ������. ��� �� ������ ��� ����� �� �� ������ (��� ��������/���� ����) ��� �����',1031514049);
INSERT INTO international VALUES (67,'WebGUI',11,'����� ���� ����',1031514049);
INSERT INTO international VALUES (66,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (65,'WebGUI',11,'����� ����� ����� �������',1031514049);
INSERT INTO international VALUES (64,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (63,'WebGUI',11,'����� ������� (admin)',1031514049);
INSERT INTO international VALUES (62,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (61,'WebGUI',11,'����� ������ ������',1031514049);
INSERT INTO international VALUES (60,'WebGUI',11,'�� ��� ����� ��� ���� ����� �����. ��� ������ʡ ��� ������ ����� ����� �������',1031514049);
INSERT INTO international VALUES (59,'WebGUI',11,'���� ���� ����.',1031514049);
INSERT INTO international VALUES (58,'WebGUI',11,'���  ���� ������.',1031514049);
INSERT INTO international VALUES (57,'WebGUI',11,'��� ����� ��� �� ���� ������ �� ������� ����� ����� ������ ����������.',1031514049);
INSERT INTO international VALUES (56,'WebGUI',11,'����� ������ ����������',1031514049);
INSERT INTO international VALUES (55,'WebGUI',11,'���� ���� (�����)',1031514049);
INSERT INTO international VALUES (54,'WebGUI',11,'����� ���� (����)',1031514049);
INSERT INTO international VALUES (53,'WebGUI',11,'����� ������ �������',1031514049);
INSERT INTO international VALUES (52,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (51,'WebGUI',11,'���� ����',1031514049);
INSERT INTO international VALUES (50,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (49,'WebGUI',11,'?op=logout\"\">here</a> to log out.\"',0);
INSERT INTO international VALUES (48,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (47,'WebGUI',11,'������ ��������',1031514049);
INSERT INTO international VALUES (46,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (45,'WebGUI',11,'��ǡ ��� �����',1031514049);
INSERT INTO international VALUES (44,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (43,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� �������',1031514049);
INSERT INTO international VALUES (42,'WebGUI',11,'���� �������',1031514049);
INSERT INTO international VALUES (41,'WebGUI',11,'��� ����� ����� ���� ���� �� ���� ���webGUI. ��� ��� ������� �� ���������ѡ ��� ���webGUI ������ �������� �� ���� �����.',1031514049);
INSERT INTO international VALUES (40,'WebGUI',11,'���� ����',1031514049);
INSERT INTO international VALUES (39,'WebGUI',11,'��� ���� ������  ������ ���� ������',1031514049);
INSERT INTO international VALUES (38,'WebGUI',11,' that has sufficient privileges before attempting this operation.\"',0);
INSERT INTO international VALUES (37,'WebGUI',11,'�� ���� ������ �� ��� !',1031514049);
INSERT INTO international VALUES (36,'WebGUI',11,'���� �� ���� ������� ��� ���� ��� ������ɡ ���� ������� ���� ����� ��� ������ ��������� �� ������� �������:',1031514049);
INSERT INTO international VALUES (35,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (34,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (33,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (32,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (31,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (30,'WebGUI',11,'��������',1031514049);
INSERT INTO international VALUES (29,'WebGUI',11,'��������',1031514049);
INSERT INTO international VALUES (28,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (27,'WebGUI',11,'����� ',1031514049);
INSERT INTO international VALUES (26,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (25,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (24,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (23,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (22,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (21,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (20,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (19,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (17,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (18,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (16,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (15,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (14,'WebGUI',11,'������� ������� ������� (��������)',1031514049);
INSERT INTO international VALUES (13,'WebGUI',11,'������� ���� ��������� (��������)',1031514049);
INSERT INTO international VALUES (12,'WebGUI',11,'����� �������  (admin)',1031514049);
INSERT INTO international VALUES (11,'WebGUI',11,'����� ��� ��������',1031514049);
INSERT INTO international VALUES (10,'WebGUI',11,'����� ��� ��������',1031514049);
INSERT INTO international VALUES (9,'WebGUI',11,'������� ���� �����',1031514049);
INSERT INTO international VALUES (8,'WebGUI',11,'��� �������� ��� ������',1031514049);
INSERT INTO international VALUES (7,'WebGUI',11,'����� ����������',1031514049);
INSERT INTO international VALUES (6,'WebGUI',11,'����� ���������',1031514049);
INSERT INTO international VALUES (5,'WebGUI',11,'����� ���������',1031514049);
INSERT INTO international VALUES (4,'WebGUI',11,'����� ���������',1031514049);
INSERT INTO international VALUES (3,'WebGUI',11,'���� �� ���� �����',1031514049);
INSERT INTO international VALUES (2,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (1,'WebGUI',11,'����� �����..',1031514049);
INSERT INTO international VALUES (61,'UserSubmission',11,'�����/����� ���� ������ �����',1031517089);
INSERT INTO international VALUES (59,'UserSubmission',11,'����� ������',1031514049);
INSERT INTO international VALUES (58,'UserSubmission',11,'����� ������',1031514049);
INSERT INTO international VALUES (57,'UserSubmission',11,'��������  (����)',1031514049);
INSERT INTO international VALUES (56,'UserSubmission',11,'���� �����',1031514049);
INSERT INTO international VALUES (55,'UserSubmission',11,'������',1031514049);
INSERT INTO international VALUES (54,'UserSubmission',11,'����� ���',1031514049);
INSERT INTO international VALUES (53,'UserSubmission',11,'�����',1031514049);
INSERT INTO international VALUES (52,'UserSubmission',11,'�����',1031514049);
INSERT INTO international VALUES (51,'UserSubmission',11,'��� �������ɿ',1031514049);
INSERT INTO international VALUES (48,'UserSubmission',11,'��� ������ʿ',1031514049);
INSERT INTO international VALUES (47,'UserSubmission',11,'����� �������',1031514049);
INSERT INTO international VALUES (46,'UserSubmission',11,'���� �����...',1031514049);
INSERT INTO international VALUES (45,'UserSubmission',11,'���� ��� �������',1031514049);
INSERT INTO international VALUES (41,'UserSubmission',11,'�������',1031514049);
INSERT INTO international VALUES (40,'UserSubmission',11,'�� ������ ������',1031514049);
INSERT INTO international VALUES (39,'UserSubmission',11,'����� ��',1031514049);
INSERT INTO international VALUES (38,'UserSubmission',11,'\"���� \"\"��\"\"��� ��� ���� ����� ��� HTML/RICH\"',1031514049);
INSERT INTO international VALUES (37,'UserSubmission',11,'���',1031514049);
INSERT INTO international VALUES (35,'UserSubmission',11,'�����',1031514049);
INSERT INTO international VALUES (34,'UserSubmission',11,'�� ���� �� ����� ������ �������',1031514049);
INSERT INTO international VALUES (33,'UserSubmission',11,'������',1031514049);
INSERT INTO international VALUES (32,'UserSubmission',11,'����',1031514049);
INSERT INTO international VALUES (31,'UserSubmission',11,'����� �������  (�������)',1031514049);
INSERT INTO international VALUES (30,'UserSubmission',11,'������� ���� �� ���',1031514049);
INSERT INTO international VALUES (29,'UserSubmission',11,'���� ������ �����',1031514049);
INSERT INTO international VALUES (28,'UserSubmission',11,'���� ��� ����� �������',1031514049);
INSERT INTO international VALUES (27,'UserSubmission',11,'�����',1031514049);
INSERT INTO international VALUES (23,'UserSubmission',11,'����� �������:',1031514049);
INSERT INTO international VALUES (22,'UserSubmission',11,'�����:',1031514049);
INSERT INTO international VALUES (21,'UserSubmission',11,'�����',1031514049);
INSERT INTO international VALUES (20,'UserSubmission',11,'����� ��� ����',1031514049);
INSERT INTO international VALUES (19,'UserSubmission',11,'����� �����',1031514049);
INSERT INTO international VALUES (18,'UserSubmission',11,'����� ���� ������ ����� ',1031514049);
INSERT INTO international VALUES (17,'UserSubmission',11,'�� ��� ����� ��� ���� ��� ��� ����ȿ',1031514049);
INSERT INTO international VALUES (16,'UserSubmission',11,'��� ����',1031514049);
INSERT INTO international VALUES (15,'UserSubmission',11,'�����/�����',1031514049);
INSERT INTO international VALUES (14,'UserSubmission',11,'������',1031514049);
INSERT INTO international VALUES (13,'UserSubmission',11,'����� �������',1031514049);
INSERT INTO international VALUES (12,'UserSubmission',11,'������ ��� ��� ���� ����� HTML',1031514049);
INSERT INTO international VALUES (6,'UserSubmission',11,'��� ������� ���� �����',1031514049);
INSERT INTO international VALUES (5,'UserSubmission',11,'���� �����',1031514049);
INSERT INTO international VALUES (4,'UserSubmission',11,'�� ���� ����',1031514049);
INSERT INTO international VALUES (3,'UserSubmission',11,' ���� ��� ������ ���� ����� �������� ����',1031514049);
INSERT INTO international VALUES (2,'UserSubmission',11,'�� ����� �������ɿ',1031514049);
INSERT INTO international VALUES (1,'UserSubmission',11,'�� ����� ������  (��������)�',1031514049);
INSERT INTO international VALUES (61,'SyndicatedContent',11,'�����/����� ����� �������',1031514049);
INSERT INTO international VALUES (6,'SyndicatedContent',11,'������� ������',1031514049);
INSERT INTO international VALUES (5,'SyndicatedContent',11,'��� �� �� ������',1031514049);
INSERT INTO international VALUES (4,'SyndicatedContent',11,'����� ����� �������',1031514049);
INSERT INTO international VALUES (2,'SyndicatedContent',11,'����� �������  (�������)',1031514049);
INSERT INTO international VALUES (1,'SyndicatedContent',11,'�� URL ��� ��� RSS ',1031514049);
INSERT INTO international VALUES (61,'SQLReport',11,'�����/����� ����� ���SQL',1031514049);
INSERT INTO international VALUES (18,'SQLReport',11,'���� ���� ����� ���� ���������',1031514049);
INSERT INTO international VALUES (17,'SQLReport',11,'����� <b>: ������� <b/>:',1031514049);
INSERT INTO international VALUES (16,'SQLReport',11,'�����',1031514049);
INSERT INTO international VALUES (15,'SQLReport',11,'��� (�����) ������ ���� �������� ��� ���������',1031514049);
INSERT INTO international VALUES (14,'SQLReport',11,'����� �������',1031514049);
INSERT INTO international VALUES (13,'SQLReport',11,'�� ���� �� ����� ������ �������',1031514049);
INSERT INTO international VALUES (12,'SQLReport',11,'����� <b>: ��� <b/>: �� ����� �� ������� ������ ��������',1031514049);
INSERT INTO international VALUES (11,'SQLReport',11,'����� <b>: ��� <b/>: ���� ����� �� ���������',1031514049);
INSERT INTO international VALUES (10,'SQLReport',11,'����� <b>: ��� <b/>: ���� ��SQL ������� ��� �����',1031514049);
INSERT INTO international VALUES (9,'SQLReport',11,'����� <b>: ��� <b/>: ���� ��DSN ������� ��� �����',1031514049);
INSERT INTO international VALUES (8,'SQLReport',11,'����� ����� SQL',1031514049);
INSERT INTO international VALUES (6,'SQLReport',11,'������ ����� ��������',1031514049);
INSERT INTO international VALUES (7,'SQLReport',11,'���� �� ����� ��������',1031514049);
INSERT INTO international VALUES (5,'SQLReport',11,'DSN',1031514049);
INSERT INTO international VALUES (4,'SQLReport',11,'�������',1031514049);
INSERT INTO international VALUES (3,'SQLReport',11,'���� �������',1031514049);
INSERT INTO international VALUES (1,'SQLReport',11,'����� SQL (��� ��������� ��������)',1031514049);
INSERT INTO international VALUES (61,'SiteMap',11,'�����/����� ����� ������',1031514049);
INSERT INTO international VALUES (9,'SiteMap',11,'��� ������',1031514049);
INSERT INTO international VALUES (8,'SiteMap',11,'������ ���',1031514049);
INSERT INTO international VALUES (7,'SiteMap',11,'��� �����',1031514049);
INSERT INTO international VALUES (6,'SiteMap',11,'���� ��� �����',1031514049);
INSERT INTO international VALUES (5,'SiteMap',11,'����� ����� ������',1031514049);
INSERT INTO international VALUES (4,'SiteMap',11,'�� ����� ��� �����',1031514049);
INSERT INTO international VALUES (3,'SiteMap',11,'������� �� ��� �������',1031514049);
INSERT INTO international VALUES (2,'SiteMap',11,'����� ������',1031514049);
INSERT INTO international VALUES (62,'Product',11,'�����/����� ���� ������',1031514049);
INSERT INTO international VALUES (61,'Product',11,'���� ������',1031514049);
INSERT INTO international VALUES (60,'Product',11,'������',1031514049);
INSERT INTO international VALUES (59,'Product',11,'�����',1031514049);
INSERT INTO international VALUES (58,'Product',11,'����� ���� ������',1031514049);
INSERT INTO international VALUES (57,'Product',11,'�� ��� ����� ��� ���� ��� ��� ������ ������ �� �������� �������� ������ ����������',1031514049);
INSERT INTO international VALUES (56,'Product',11,'����� ���� ����',1031514049);
INSERT INTO international VALUES (55,'Product',11,'����� ����',1031514049);
INSERT INTO international VALUES (54,'Product',11,'�����',1031514049);
INSERT INTO international VALUES (53,'Product',11,'����� ����',1031514049);
INSERT INTO international VALUES (52,'Product',11,'����� ���� ����',1031514049);
INSERT INTO international VALUES (51,'Product',11,'����',1031514049);
INSERT INTO international VALUES (49,'Product',11,'�����/����� ����� ������',1031514049);
INSERT INTO international VALUES (48,'Product',11,'�� ��� ����� ��� ���� ��� ��� �����ɿ �� ����� ��������� ��� �� ����',1031514049);
INSERT INTO international VALUES (46,'Product',11,'�����/����� ����  (�� �����)',1031514049);
INSERT INTO international VALUES (44,'Product',11,'�����/����� ���� ����',1031514049);
INSERT INTO international VALUES (42,'Product',11,'�����/����� ������ ����',1031514049);
INSERT INTO international VALUES (38,'Product',11,'�����/����� ���� �� �����',1031514049);
INSERT INTO international VALUES (40,'Product',11,'�����/����� ��� ����',1031514049);
INSERT INTO international VALUES (37,'Product',11,'����� ���� �� �����',1031514049);
INSERT INTO international VALUES (36,'Product',11,'����� ����',1031514049);
INSERT INTO international VALUES (35,'Product',11,'����� ������',1031514049);
INSERT INTO international VALUES (34,'Product',11,'����� ���',1031514049);
INSERT INTO international VALUES (33,'Product',11,'������ ��� �����',1031514049);
INSERT INTO international VALUES (31,'Product',11,'�������',1031514049);
INSERT INTO international VALUES (32,'Product',11,'������ ������ (���)',1031514049);
INSERT INTO international VALUES (30,'Product',11,'�����',1031514049);
INSERT INTO international VALUES (29,'Product',11,'�����',1031514049);
INSERT INTO international VALUES (28,'Product',11,'����� ������� ����',1031514049);
INSERT INTO international VALUES (27,'Product',11,'������',1031514049);
INSERT INTO international VALUES (26,'Product',11,'���� �����   (����)',1031514049);
INSERT INTO international VALUES (25,'Product',11,'����� ���������',1031514049);
INSERT INTO international VALUES (24,'Product',11,'����ɿ',1031514049);
INSERT INTO international VALUES (23,'Product',11,'���',1031514049);
INSERT INTO international VALUES (22,'Product',11,'����� �����',1031514049);
INSERT INTO international VALUES (21,'Product',11,'����� ����  �� ����� ��ѿ',1031514049);
INSERT INTO international VALUES (20,'Product',11,'����  �� �����',1031514049);
INSERT INTO international VALUES (19,'Product',11,'����� ����  �� �����',1031514049);
INSERT INTO international VALUES (18,'Product',11,'����� ���� ����',1031514049);
INSERT INTO international VALUES (17,'Product',11,'����',1031514049);
INSERT INTO international VALUES (16,'Product',11,'����� ����',1031514049);
INSERT INTO international VALUES (15,'Product',11,'����',1031514049);
INSERT INTO international VALUES (14,'Product',11,'����',1031514049);
INSERT INTO international VALUES (13,'Product',11,'����� ���   (��� ������)',1031514049);
INSERT INTO international VALUES (12,'Product',11,'�� ��� ����� ��� ���� ��� ��� ����ݿ',1031514049);
INSERT INTO international VALUES (11,'Product',11,'��� ������',1031514049);
INSERT INTO international VALUES (10,'Product',11,'�����',1031514049);
INSERT INTO international VALUES (9,'Product',11,'���� ���� ��� 3',1031514049);
INSERT INTO international VALUES (8,'Product',11,'���� ���� ��� 2',1031514049);
INSERT INTO international VALUES (7,'Product',11,'���� ���� ��� 1',1031514049);
INSERT INTO international VALUES (6,'Product',11,'����� ����',1031514049);
INSERT INTO international VALUES (5,'Product',11,'�� ��� ����� ��� ���� ��� ��� ��������ʿ',1031514049);
INSERT INTO international VALUES (4,'Product',11,'�� ��� ����� ��� ���� ��� ��� �������  ������ ���� ������ �',1031514049);
INSERT INTO international VALUES (3,'Product',11,'�� ��� ����� ��� ���� ��� ��� �����',1031514049);
INSERT INTO international VALUES (2,'Product',11,'�� ��� ����� ��� ���� ��� ��� �������  ���� �����ɿ',1031514049);
INSERT INTO international VALUES (1,'Product',11,'����',1031514049);
INSERT INTO international VALUES (72,'Poll',11,'������� �������ʿ',1031514049);
INSERT INTO international VALUES (61,'Poll',11,'�����/����� �����',1031514049);
INSERT INTO international VALUES (20,'Poll',11,'������� ���� �� ���',1031514049);
INSERT INTO international VALUES (12,'Poll',11,'����� �������:',1031514049);
INSERT INTO international VALUES (11,'Poll',11,'����� !',1031514049);
INSERT INTO international VALUES (10,'Poll',11,'�����  ����� �������',1031514049);
INSERT INTO international VALUES (9,'Poll',11,'����� �����',1031514049);
INSERT INTO international VALUES (8,'Poll',11,'(���� ����� ����� ��� ���. ��� ���� 20)',1031514049);
INSERT INTO international VALUES (7,'Poll',11,'����',1031514049);
INSERT INTO international VALUES (6,'Poll',11,'����',1031514049);
INSERT INTO international VALUES (5,'Poll',11,'����� ����� �������',1031514049);
INSERT INTO international VALUES (4,'Poll',11,'�� ����� �������ڿ',1031514049);
INSERT INTO international VALUES (61,'MessageBoard',11,'�����/����� ���� �������',1031514049);
INSERT INTO international VALUES (1,'Poll',11,'���',1031514049);
INSERT INTO international VALUES (3,'Poll',11,'���',1031514049);
INSERT INTO international VALUES (22,'MessageBoard',11,'��� �����',1031514049);
INSERT INTO international VALUES (20,'MessageBoard',11,'��� ��',1031514049);
INSERT INTO international VALUES (19,'MessageBoard',11,'����',1031514049);
INSERT INTO international VALUES (18,'MessageBoard',11,'���� ������',1031514049);
INSERT INTO international VALUES (17,'MessageBoard',11,'����� ����� �����',1031514049);
INSERT INTO international VALUES (16,'MessageBoard',11,'�������',1031514049);
INSERT INTO international VALUES (15,'MessageBoard',11,'������',1031514049);
INSERT INTO international VALUES (12,'MessageBoard',11,'����� �������',1031514049);
INSERT INTO international VALUES (11,'MessageBoard',11,'���� ��� ����� �������',1031514049);
INSERT INTO international VALUES (9,'MessageBoard',11,'���� �������:',1031514049);
INSERT INTO international VALUES (8,'MessageBoard',11,'�������:',1031514049);
INSERT INTO international VALUES (7,'MessageBoard',11,'������:',1031514049);
INSERT INTO international VALUES (6,'MessageBoard',11,'����� ���� �������',1031514049);
INSERT INTO international VALUES (4,'MessageBoard',11,'���� ������� ��� ����',1031514049);
INSERT INTO international VALUES (61,'MailForm',11,'�����/����� ����� ������',1031514049);
INSERT INTO international VALUES (62,'MailForm',11,'�����/����� ���� ����� ������',1031514049);
INSERT INTO international VALUES (2,'MessageBoard',11,'���� �������',1031514049);
INSERT INTO international VALUES (26,'MailForm',11,'����� �������',1031514049);
INSERT INTO international VALUES (25,'MailForm',11,'��� �����  �� �������� (�������)',1031514049);
INSERT INTO international VALUES (23,'MailForm',11,'�����',1031514049);
INSERT INTO international VALUES (24,'MailForm',11,'��� ������  (����� ������� ���)',1031514049);
INSERT INTO international VALUES (22,'MailForm',11,'������',1031514049);
INSERT INTO international VALUES (21,'MailForm',11,'��� �����',1031514049);
INSERT INTO international VALUES (20,'MailForm',11,'����� �����',1031514049);
INSERT INTO international VALUES (19,'MailForm',11,'�� ��� ����� ��� ���� ��� ��� �����',1031514049);
INSERT INTO international VALUES (18,'MailForm',11,'���� !',1031514049);
INSERT INTO international VALUES (17,'MailForm',11,'�� ����� ������',1031514049);
INSERT INTO international VALUES (16,'MailForm',11,'���',1031514049);
INSERT INTO international VALUES (15,'MailForm',11,'������� ������ ����',1031514049);
INSERT INTO international VALUES (14,'MailForm',11,'�������',1031514049);
INSERT INTO international VALUES (13,'MailForm',11,'���� ����� ���',1031514049);
INSERT INTO international VALUES (12,'MailForm',11,'���� ���',1031514049);
INSERT INTO international VALUES (11,'MailForm',11,'��� (����� ������ �����������  ��� �������� �� ��� ��������)',1031514049);
INSERT INTO international VALUES (10,'MailForm',11,'�����',1031514049);
INSERT INTO international VALUES (9,'MailForm',11,'����� ���',1031514049);
INSERT INTO international VALUES (8,'MailForm',11,'�����',1031514049);
INSERT INTO international VALUES (7,'MailForm',11,'����� ����� ������',1031514049);
INSERT INTO international VALUES (6,'MailForm',11,'���� �������',1031514049);
INSERT INTO international VALUES (5,'MailForm',11,'����',1031514049);
INSERT INTO international VALUES (4,'MailForm',11,'���',1031514049);
INSERT INTO international VALUES (3,'MailForm',11,'����� ���� !',1031514049);
INSERT INTO international VALUES (2,'MailForm',11,'���� ����� ����� ���',1031514049);
INSERT INTO international VALUES (1,'MailForm',11,'����� ����',1031514049);
INSERT INTO international VALUES (72,'LinkList',11,'�����/����� ����',1031514049);
INSERT INTO international VALUES (61,'LinkList',11,'�����/����� ����� ������',1031514049);
INSERT INTO international VALUES (13,'LinkList',11,'����� ���� �����',1031514049);
INSERT INTO international VALUES (12,'LinkList',11,'����� ����',1031514049);
INSERT INTO international VALUES (10,'LinkList',11,'�����/����� ����',1031514049);
INSERT INTO international VALUES (9,'LinkList',11,'�� ��� ����� ��� ���� ��� ��� �����ɿ',1031514049);
INSERT INTO international VALUES (8,'LinkList',11,'����� ������',1031514049);
INSERT INTO international VALUES (6,'LinkList',11,'����� ������',1031514049);
INSERT INTO international VALUES (5,'LinkList',11,'������� ������ ���ɿ',1031514049);
INSERT INTO international VALUES (4,'LinkList',11,'��� �����',1031514049);
INSERT INTO international VALUES (3,'LinkList',11,'��� �� ���� ����ɿ',1031514049);
INSERT INTO international VALUES (2,'LinkList',11,'������ ���',1031514049);
INSERT INTO international VALUES (1,'LinkList',11,'���� ��� ������',1031514049);
INSERT INTO international VALUES (61,'Item',11,'�����/����� ���',1031514049);
INSERT INTO international VALUES (6,'Item',11,'����� ���',1031514049);
INSERT INTO international VALUES (5,'Item',11,'����� ������',1031514049);
INSERT INTO international VALUES (4,'Item',11,'���',1031514049);
INSERT INTO international VALUES (3,'Item',11,'��� ������',1031514049);
INSERT INTO international VALUES (2,'Item',11,'������',1031514049);
INSERT INTO international VALUES (72,'FAQ',11,'�����/����� ����',1031514049);
INSERT INTO international VALUES (1,'Item',11,'���� ���',1031514049);
INSERT INTO international VALUES (61,'FAQ',11,'�����/����� ������� ������',1031514049);
INSERT INTO international VALUES (13,'FAQ',11,'����� ���� [����]�',1031514049);
INSERT INTO international VALUES (12,'FAQ',11,'����� �/̿',1031514049);
INSERT INTO international VALUES (11,'FAQ',11,'',1031514049);
INSERT INTO international VALUES (10,'FAQ',11,'����� ����',1031514049);
INSERT INTO international VALUES (9,'FAQ',11,'����� ���� ����',1031514049);
INSERT INTO international VALUES (8,'FAQ',11,'����� �����',1031514049);
INSERT INTO international VALUES (6,'FAQ',11,'����',1031514049);
INSERT INTO international VALUES (7,'FAQ',11,'�� ��� ����� ��� ���� ��� ��� ������',1031514049);
INSERT INTO international VALUES (5,'FAQ',11,'����',1031514049);
INSERT INTO international VALUES (2,'FAQ',11,'������� ������',1031514049);
INSERT INTO international VALUES (75,'FAQ',1,'Add a question.',1036260753);
INSERT INTO international VALUES (61,'ExtraColumn',11,'�����/����� ���� �����',1031514049);
INSERT INTO international VALUES (6,'ExtraColumn',11,'����� ���� �����',1031514049);
INSERT INTO international VALUES (5,'ExtraColumn',11,'����� ����� ������',1031514049);
INSERT INTO international VALUES (4,'ExtraColumn',11,'�����',1031514049);
INSERT INTO international VALUES (3,'ExtraColumn',11,'������',1031514049);
INSERT INTO international VALUES (1,'ExtraColumn',11,'���� �����',1031514049);
INSERT INTO international VALUES (78,'EventsCalendar',11,'�� ���� ����.. ��� �����    (����� �� �����)',1031514049);
INSERT INTO international VALUES (77,'EventsCalendar',11,'��� ��� �����<�> � </�> ����� ���������',1031514049);
INSERT INTO international VALUES (76,'EventsCalendar',11,'��� ��� ����� ���',1031514049);
INSERT INTO international VALUES (75,'EventsCalendar',11,'�� �������� ����',1031514049);
INSERT INTO international VALUES (74,'EventsCalendar',11,'��� ������� (����)',1031514049);
INSERT INTO international VALUES (72,'EventsCalendar',11,'�����/����� �����',1031514049);
INSERT INTO international VALUES (61,'EventsCalendar',11,'�����/����� ����� �������',1031514049);
INSERT INTO international VALUES (21,'EventsCalendar',11,'������� ������ ��˿',1031514049);
INSERT INTO international VALUES (20,'EventsCalendar',11,'����� ���',1031514049);
INSERT INTO international VALUES (19,'EventsCalendar',11,'����� �������',1031514049);
INSERT INTO international VALUES (18,'EventsCalendar',11,'��� �������',1031514049);
INSERT INTO international VALUES (17,'EventsCalendar',11,'�����',1031514049);
INSERT INTO international VALUES (16,'EventsCalendar',11,'����� �������',1031514049);
INSERT INTO international VALUES (15,'EventsCalendar',11,'����� ��������',1031514049);
INSERT INTO international VALUES (14,'EventsCalendar',11,'����� �����',1031514049);
INSERT INTO international VALUES (13,'EventsCalendar',11,'����� �����',1031514049);
INSERT INTO international VALUES (12,'EventsCalendar',11,'����� ����� �������',1031514049);
INSERT INTO international VALUES (9,'EventsCalendar',11,'���',1031514049);
INSERT INTO international VALUES (8,'EventsCalendar',11,'����� ��',1031514049);
INSERT INTO international VALUES (4,'EventsCalendar',11,'���� ��� �����',1031514049);
INSERT INTO international VALUES (2,'EventsCalendar',11,'����� �������',1031514049);
INSERT INTO international VALUES (72,'DownloadManager',11,'�����/����� �����',1031514049);
INSERT INTO international VALUES (1,'EventsCalendar',11,'������� ������ ��˿',1031514049);
INSERT INTO international VALUES (61,'DownloadManager',11,'�����/����� ���� �������',1031514049);
INSERT INTO international VALUES (22,'DownloadManager',11,'������� ������ �����',1031514049);
INSERT INTO international VALUES (21,'DownloadManager',11,'��� �������ɿ',1031514049);
INSERT INTO international VALUES (20,'DownloadManager',11,'����� �������',1031514049);
INSERT INTO international VALUES (19,'DownloadManager',11,'��� ������ ����� ����� �������',1031514049);
INSERT INTO international VALUES (18,'DownloadManager',11,'���� ����� ��� 2',1031514049);
INSERT INTO international VALUES (17,'DownloadManager',11,'���� ����� ��� 1',1031514049);
INSERT INTO international VALUES (16,'DownloadManager',11,'����� ��������',1031514049);
INSERT INTO international VALUES (15,'DownloadManager',11,'�����',1031514049);
INSERT INTO international VALUES (14,'DownloadManager',11,'���',1031514049);
INSERT INTO international VALUES (12,'DownloadManager',11,'�� ��� ����� ��� ���� ��� ��� �������',1031514049);
INSERT INTO international VALUES (11,'DownloadManager',11,'����� ����� ����',1031514049);
INSERT INTO international VALUES (10,'DownloadManager',11,'����� �������',1031514049);
INSERT INTO international VALUES (9,'DownloadManager',11,'����� ��� �������',1031514049);
INSERT INTO international VALUES (8,'DownloadManager',11,'���� �����',1031514049);
INSERT INTO international VALUES (7,'DownloadManager',11,'����� ���� �������',1031514049);
INSERT INTO international VALUES (6,'DownloadManager',11,'����� ���',1031514049);
INSERT INTO international VALUES (5,'DownloadManager',11,'��� �����',1031514049);
INSERT INTO international VALUES (3,'DownloadManager',11,'������� ������ ��ݿ',1031514049);
INSERT INTO international VALUES (1,'DownloadManager',11,'���� �������',1031514049);
INSERT INTO international VALUES (61,'Article',11,'�����/����� ����',1031514049);
INSERT INTO international VALUES (28,'Article',11,'��� ������',1031514049);
INSERT INTO international VALUES (27,'Article',11,'���� ��� ������',1031514049);
INSERT INTO international VALUES (24,'Article',11,'����� ����',1031514049);
INSERT INTO international VALUES (23,'Article',11,'������� (�����)',1031514049);
INSERT INTO international VALUES (22,'Article',11,'������',1031514049);
INSERT INTO international VALUES (18,'Article',11,'��� ������ʿ',1031514049);
INSERT INTO international VALUES (17,'Article',11,'�����',1031514049);
INSERT INTO international VALUES (16,'Article',11,'����',1031514049);
INSERT INTO international VALUES (15,'Article',11,'����',1031514049);
INSERT INTO international VALUES (14,'Article',11,'����� ���� ������',1031514049);
INSERT INTO international VALUES (13,'Article',11,'���',1031514049);
INSERT INTO international VALUES (12,'Article',11,'����� ������',1031514049);
INSERT INTO international VALUES (11,'Article',11,'br&gt',0);
INSERT INTO international VALUES (10,'Article',11,'�� ���� �� ����� ������ �������',1031514049);
INSERT INTO international VALUES (9,'Article',11,'������',1031514049);
INSERT INTO international VALUES (8,'Article',11,'����� ������ ���������',1031514049);
INSERT INTO international VALUES (7,'Article',11,'��� ������',1031514049);
INSERT INTO international VALUES (6,'Article',11,'���� ',1031514049);
INSERT INTO international VALUES (4,'Article',11,'����� ��������',1031514049);
INSERT INTO international VALUES (3,'Article',11,'����� �����',1031514049);
INSERT INTO international VALUES (1,'Article',11,'����',1031514049);
INSERT INTO international VALUES (107,'WebGUI',11,'��������',1031514049);
INSERT INTO international VALUES (108,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (109,'WebGUI',11,'�� ���� ������ �� �����ֿ',1031514049);
INSERT INTO international VALUES (110,'WebGUI',11,'�� ���� ������ �� ����',1031514049);
INSERT INTO international VALUES (111,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (112,'WebGUI',11,'�� ���� �������� �� �����ֿ',1031514049);
INSERT INTO international VALUES (113,'WebGUI',11,'�� ���� �������� �� ����',1031514049);
INSERT INTO international VALUES (114,'WebGUI',11,'�� ���� ��� ��� �� �����ֿ',1031514049);
INSERT INTO international VALUES (115,'WebGUI',11,'�� ���� ��� ��� �� ����',1031514049);
INSERT INTO international VALUES (116,'WebGUI',11,'\"���� \"\"���\"\" ������ �������� �� ������� ���� ������� ��� ������ ��� ��� ����������\"',1031514049);
INSERT INTO international VALUES (117,'WebGUI',11,'����� ������� ��������',1031514049);
INSERT INTO international VALUES (118,'WebGUI',11,'����� ���� ���',1031514049);
INSERT INTO international VALUES (119,'WebGUI',11,'����� ������� (�������)',1031514049);
INSERT INTO international VALUES (120,'WebGUI',11,'����� LDAP URL  (�������)',1031514049);
INSERT INTO international VALUES (121,'WebGUI',11,'���� LDAP (�������)',1031514049);
INSERT INTO international VALUES (122,'WebGUI',11,'����� ����  LDAP',1031514049);
INSERT INTO international VALUES (123,'WebGUI',11,'����� ���� ���� ������ �� LDAP',1031514049);
INSERT INTO international VALUES (124,'WebGUI',11,'����� ������ ������',1031514049);
INSERT INTO international VALUES (125,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (126,'WebGUI',11,'����� ������ ������� ����������',1031514049);
INSERT INTO international VALUES (127,'WebGUI',11,'���� ������ ������',1031514049);
INSERT INTO international VALUES (130,'WebGUI',11,'���� ������ ��������',1031514049);
INSERT INTO international VALUES (133,'WebGUI',11,'����� ������� ������',1031514049);
INSERT INTO international VALUES (134,'WebGUI',11,'����� ������� ���� ����',1031514049);
INSERT INTO international VALUES (135,'WebGUI',11,'����� (����) SMPT',1031514049);
INSERT INTO international VALUES (138,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (139,'WebGUI',11,'��',1031514049);
INSERT INTO international VALUES (140,'WebGUI',11,'����� ������� ������',1031514049);
INSERT INTO international VALUES (141,'WebGUI',11,'���� ��� ������',1031514049);
INSERT INTO international VALUES (142,'WebGUI',11,'������ ������ ������� ������',1031514049);
INSERT INTO international VALUES (143,'WebGUI',11,'����� ���������',1031514049);
INSERT INTO international VALUES (144,'WebGUI',11,'������� ����������',1031514049);
INSERT INTO international VALUES (145,'WebGUI',11,'���� webGUI Build',1031514049);
INSERT INTO international VALUES (146,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (147,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (148,'WebGUI',11,'������� �����',1031514049);
INSERT INTO international VALUES (149,'WebGUI',11,'��������',1031514049);
INSERT INTO international VALUES (151,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (154,'WebGUI',11,'���� �������',1031514049);
INSERT INTO international VALUES (155,'WebGUI',11,'\"�� ��� ���� ��� ���� ��� ��� ������� ������� ���� ������� ���� ������ ��� ������� ��� ����� \"\"���� ���\"\"�\"',1031514049);
INSERT INTO international VALUES (156,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (157,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (158,'WebGUI',11,'����� ����� ����',1031514049);
INSERT INTO international VALUES (159,'WebGUI',11,'���� ����',1031514049);
INSERT INTO international VALUES (160,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (161,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (162,'WebGUI',11,'�� ��� ����� ��� ���� ����� ���� ������� �������� ����� ���� �������ʿ',1031514049);
INSERT INTO international VALUES (163,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (164,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (165,'WebGUI',11,'LDAP URL',1031514049);
INSERT INTO international VALUES (166,'WebGUI',11,'����� �� DN',1031514049);
INSERT INTO international VALUES (167,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� �������� ���� ����� �� ��� ����� ���� ������ ��� �������� ������� ��� ���� ���������',1031514049);
INSERT INTO international VALUES (168,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (169,'WebGUI',11,'����� ������ ����',1031514049);
INSERT INTO international VALUES (170,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (171,'WebGUI',11,'����� ����',1031514049);
INSERT INTO international VALUES (174,'WebGUI',11,'��� �����  (�������)�',1031514049);
INSERT INTO international VALUES (175,'WebGUI',11,'����� ��������ʿ',1031514049);
INSERT INTO international VALUES (228,'WebGUI',11,'���� ����� �������...',1031514049);
INSERT INTO international VALUES (229,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (230,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (231,'WebGUI',11,'����� ����� �����',1031514049);
INSERT INTO international VALUES (232,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (233,'WebGUI',11,'(eom)',1031514049);
INSERT INTO international VALUES (234,'WebGUI',11,'����� ��',1031514049);
INSERT INTO international VALUES (237,'WebGUI',11,'�������:',1031514049);
INSERT INTO international VALUES (238,'WebGUI',11,'������:',1031514049);
INSERT INTO international VALUES (239,'WebGUI',11,'�������:',1031514049);
INSERT INTO international VALUES (240,'WebGUI',11,'���� �������:',1031514049);
INSERT INTO international VALUES (244,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (245,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (304,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (306,'WebGUI',11,'����� ��� ��������',1031514049);
INSERT INTO international VALUES (307,'WebGUI',11,'������� ������ ����� ��������',1031514049);
INSERT INTO international VALUES (308,'WebGUI',11,'����� ������� �������� ������',1031514049);
INSERT INTO international VALUES (309,'WebGUI',11,'��� ����� ��������',1031514049);
INSERT INTO international VALUES (310,'WebGUI',11,'��� ������ ����� ������ �',1031514049);
INSERT INTO international VALUES (311,'WebGUI',11,'��� ������ ������',1031514049);
INSERT INTO international VALUES (312,'WebGUI',11,'��� ������ �����',1031514049);
INSERT INTO international VALUES (313,'WebGUI',11,'��� ������ �����ɿ',1031514049);
INSERT INTO international VALUES (314,'WebGUI',11,'����� �����',1031514049);
INSERT INTO international VALUES (315,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (316,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (317,'WebGUI',11,'',1031514049);
INSERT INTO international VALUES (318,'WebGUI',11,'',1031514049);
INSERT INTO international VALUES (319,'WebGUI',11,'',1031514049);
INSERT INTO international VALUES (320,'WebGUI',11,'',1031514049);
INSERT INTO international VALUES (321,'WebGUI',11,'���� ���� (�����)',1031514049);
INSERT INTO international VALUES (322,'WebGUI',11,'����� (����� )',1031514049);
INSERT INTO international VALUES (323,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (324,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (325,'WebGUI',11,'������ (�����) ������',1031514049);
INSERT INTO international VALUES (326,'WebGUI',11,'����� ������� ������',1031514049);
INSERT INTO international VALUES (327,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (328,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (329,'WebGUI',11,'����� ��� �����',1031514049);
INSERT INTO international VALUES (330,'WebGUI',11,'����� ��� �����',1031514049);
INSERT INTO international VALUES (331,'WebGUI',11,'������ (�����) ��� �����',1031514049);
INSERT INTO international VALUES (332,'WebGUI',11,'����� ������� ���� �����',1031514049);
INSERT INTO international VALUES (333,'WebGUI',11,'��� ��� �����',1031514049);
INSERT INTO international VALUES (334,'WebGUI',11,'������ ��� �����',1031514049);
INSERT INTO international VALUES (335,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (336,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (337,'WebGUI',11,'���� ������ ������� ���������',1031514049);
INSERT INTO international VALUES (338,'WebGUI',11,'�����  �������� ������',1031514049);
INSERT INTO international VALUES (339,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (340,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (341,'WebGUI',11,'����� �������� ������.',1031514049);
INSERT INTO international VALUES (342,'WebGUI',11,'����� ������ ������.',1031514049);
INSERT INTO international VALUES (343,'WebGUI',11,'������� �������� ������.',1031514049);
INSERT INTO international VALUES (345,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (346,'WebGUI',11,'��� �������� ��� �� ����� ������ǡ ���� �����  ������� ������ ���.',1031514049);
INSERT INTO international VALUES (347,'WebGUI',11,'������� �������� ������ �� ���',1031514049);
INSERT INTO international VALUES (348,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (349,'WebGUI',11,'��� ���� �����',1031514049);
INSERT INTO international VALUES (350,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (351,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (352,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (353,'WebGUI',11,'��� ���� ����� ������ ������ �� ��� �����',1031514049);
INSERT INTO international VALUES (354,'WebGUI',11,'������� ������ ������',1031514049);
INSERT INTO international VALUES (355,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (356,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (357,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (358,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (359,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (360,'WebGUI',11,'���� ��� �����',1031514049);
INSERT INTO international VALUES (361,'WebGUI',11,'����� ��� ����',1031514049);
INSERT INTO international VALUES (362,'WebGUI',11,'����� ��� ���',1031514049);
INSERT INTO international VALUES (363,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (364,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (365,'WebGUI',11,'����� �����...',1031514049);
INSERT INTO international VALUES (366,'WebGUI',11,'�� ��� ������ ��� ����� ����� ��������',1031514049);
INSERT INTO international VALUES (367,'WebGUI',11,'����� ������ ���',1031514049);
INSERT INTO international VALUES (368,'WebGUI',11,'����� ������ ����� ��� ��� ��������',1031514049);
INSERT INTO international VALUES (369,'WebGUI',11,'����� ��������',1031514049);
INSERT INTO international VALUES (370,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (371,'WebGUI',11,'����� �����',1031514049);
INSERT INTO international VALUES (372,'WebGUI',11,'����� ������� ��������',1031514049);
INSERT INTO international VALUES (374,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (375,'WebGUI',11,'���� ����  �����',1031514049);
INSERT INTO international VALUES (376,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (377,'WebGUI',11,'���� ���� �� ����� �����  �� ������ ����� (������) ',1031514049);
INSERT INTO international VALUES (378,'WebGUI',11,'���� ��������',1031514049);
INSERT INTO international VALUES (379,'WebGUI',11,'���� ��������',1031514049);
INSERT INTO international VALUES (380,'WebGUI',11,'���� �������',1031514049);
INSERT INTO international VALUES (381,'WebGUI',11,'���� WebGUI ����� ������ ��� ����� �� ���������. ���� ��� ��� ��� ����� ����� ������� ���� ��� �����. �� ���� �� ���� ������ ����� ����� �����ڡ �� ���� ��� �����.',1031514049);
INSERT INTO international VALUES (382,'WebGUI',11,'����� ����',1031514049);
INSERT INTO international VALUES (383,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (384,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (385,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (386,'WebGUI',11,'����� ����',1031514049);
INSERT INTO international VALUES (387,'WebGUI',11,'�� ������ ������',1031514049);
INSERT INTO international VALUES (388,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (389,'WebGUI',11,'���� ������',1031514049);
INSERT INTO international VALUES (390,'WebGUI',11,'����� �����Ʌ',1031514049);
INSERT INTO international VALUES (391,'WebGUI',11,'��� ��� ����.',1031514049);
INSERT INTO international VALUES (392,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� �����ɿ',1031514049);
INSERT INTO international VALUES (393,'WebGUI',11,'����� �����',1031514049);
INSERT INTO international VALUES (394,'WebGUI',11,'����� �����',1031514049);
INSERT INTO international VALUES (395,'WebGUI',11,'����� ���� �����',1031514049);
INSERT INTO international VALUES (396,'WebGUI',11,'������� ����',1031514049);
INSERT INTO international VALUES (397,'WebGUI',11,'���� ��� ����� �����',1031514049);
INSERT INTO international VALUES (398,'WebGUI',11,'����� ��� �������',1031514049);
INSERT INTO international VALUES (399,'WebGUI',11,'���� ��� ������ ����� ������',1031514049);
INSERT INTO international VALUES (400,'WebGUI',11,'����  ������ �� �������',1031514049);
INSERT INTO international VALUES (401,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� ������� ����� ������� ���� ����� �� ��� ���ؿ',1031514049);
INSERT INTO international VALUES (402,'WebGUI',11,'������� ���� ������ ��� ������',1031514049);
INSERT INTO international VALUES (403,'WebGUI',11,'���� ��� ����',1031514049);
INSERT INTO international VALUES (404,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (405,'WebGUI',11,'������ �������',1031514049);
INSERT INTO international VALUES (406,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (407,'WebGUI',11,'���� ��� �������',1031514049);
INSERT INTO international VALUES (408,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (409,'WebGUI',11,'����� ��� ����',1031514049);
INSERT INTO international VALUES (410,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (411,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (412,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (416,'WebGUI',11,'����� ����� ����� <h1> ������� ����� ����� ���� </h1>. �� ���� ������ �� ������ �� ���� �����. ��� ������ ������ɡ ���� ������� ��� �������� ��� ��� ����� ���� ����� ��� ������ ���� ��� �������.',1031514049);
INSERT INTO international VALUES (417,'WebGUI',11,'������ ������ <h1> ��� ����� �� ���� ��� ������ ��� ��� ��� ����� ���� ������ </h1>. �� ����� ����� ���� �������.',1031514049);
INSERT INTO international VALUES (418,'WebGUI',11,'����  HTML',1031514049);
INSERT INTO international VALUES (419,'WebGUI',11,'��� ���� �������� ',1031514049);
INSERT INTO international VALUES (420,'WebGUI',11,'���� ��� ��',1031514049);
INSERT INTO international VALUES (421,'WebGUI',11,'��� ���� �� ��� ��������� ��������',1031514049);
INSERT INTO international VALUES (422,'WebGUI',11,'���� ������ <h1> ��������� ������� �� ����� ��� ������ </h1>.',1031514049);
INSERT INTO international VALUES (423,'WebGUI',11,'������� ������� ������',1031514049);
INSERT INTO international VALUES (424,'WebGUI',11,'������� ����� ������',1031514049);
INSERT INTO international VALUES (425,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (426,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (427,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (428,'WebGUI',11,'�������� (����)',1031514049);
INSERT INTO international VALUES (429,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (430,'WebGUI',11,'������� ������ �������',1031514049);
INSERT INTO international VALUES (431,'WebGUI',11,'����� ��������',1031514049);
INSERT INTO international VALUES (432,'WebGUI',11,'����� �������� ',1031514049);
INSERT INTO international VALUES (433,'WebGUI',11,'���� ��������',1031514049);
INSERT INTO international VALUES (434,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (435,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (436,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (437,'WebGUI',11,'��������',1031514049);
INSERT INTO international VALUES (438,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (439,'WebGUI',11,'������ �����',1031514049);
INSERT INTO international VALUES (440,'WebGUI',11,'������ �������',1031514049);
INSERT INTO international VALUES (441,'WebGUI',11,'���� ������ ��� ����� ����� (�����)',1031514049);
INSERT INTO international VALUES (442,'WebGUI',11,'������ �����',1031514049);
INSERT INTO international VALUES (443,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (444,'WebGUI',11,'�������� ��������',1031514049);
INSERT INTO international VALUES (445,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (446,'WebGUI',11,'���� ����� ��� ��������',1031514049);
INSERT INTO international VALUES (447,'WebGUI',11,'����� ���� ������',1031514049);
INSERT INTO international VALUES (448,'WebGUI',11,'���� ������',1031514049);
INSERT INTO international VALUES (449,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (450,'WebGUI',11,'��� ����� (��� ������)',1031514049);
INSERT INTO international VALUES (451,'WebGUI',11,'��� �����.',1031514049);
INSERT INTO international VALUES (452,'WebGUI',11,'����� �� ���߅',1031514049);
INSERT INTO international VALUES (453,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (454,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (455,'WebGUI',11,'����� ������ �������� ������',1031514049);
INSERT INTO international VALUES (456,'WebGUI',11,'���� ��� ����� ��������',1031514049);
INSERT INTO international VALUES (457,'WebGUI',11,'����� ���� ��� ��������',1031514049);
INSERT INTO international VALUES (458,'WebGUI',11,'����� ������� ��� ��������',1031514049);
INSERT INTO international VALUES (459,'WebGUI',11,'����� �������� ������ ���� ��������',1031514049);
INSERT INTO international VALUES (460,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (461,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (462,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (463,'WebGUI',11,'���� ����� ����',1031514049);
INSERT INTO international VALUES (464,'WebGUI',11,'����� ����� ����',1031514049);
INSERT INTO international VALUES (465,'WebGUI',11,'��� ���� ����',1031514049);
INSERT INTO international VALUES (466,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� ����� ���� ���� ������ ��� ���� �����ɿ',1031514049);
INSERT INTO international VALUES (467,'WebGUI',11,'�� ��� ����� ��� ���� ��� �� ����� ����� ������ �������� ������� ��',1031514049);
INSERT INTO international VALUES (468,'WebGUI',11,'����� ��� ������ �������� ������',1031514049);
INSERT INTO international VALUES (469,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (470,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (471,'WebGUI',11,'����� ��� ������ �������� ������',1031514049);
INSERT INTO international VALUES (472,'WebGUI',11,'����. ����',1031514049);
INSERT INTO international VALUES (473,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (474,'WebGUI',11,'����ȿ',1031514049);
INSERT INTO international VALUES (475,'WebGUI',11,'��',1031514049);
INSERT INTO international VALUES (476,'WebGUI',11,'����� ����',1031514049);
INSERT INTO international VALUES (477,'WebGUI',11,'����� HTML',1031514049);
INSERT INTO international VALUES (478,'WebGUI',11,'����� ������ ���������',1031514049);
INSERT INTO international VALUES (479,'WebGUI',11,'�������',1031514049);
INSERT INTO international VALUES (480,'WebGUI',11,'����� ������ ����������',1031514049);
INSERT INTO international VALUES (481,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (482,'WebGUI',11,'��� (����� �����)',1031514049);
INSERT INTO international VALUES (483,'WebGUI',11,'��� �� ��',1031514049);
INSERT INTO international VALUES (484,'WebGUI',11,'���� �����',1031514049);
INSERT INTO international VALUES (485,'WebGUI',11,'����� (�� ����� ��������)',1031514049);
INSERT INTO international VALUES (486,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (487,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (488,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (489,'WebGUI',11,'��� �������� ������',1031514049);
INSERT INTO international VALUES (490,'WebGUI',11,'����� ��� ������ ����',1031514049);
INSERT INTO international VALUES (491,'WebGUI',11,'����� ��� ������ ����',1031514049);
INSERT INTO international VALUES (492,'WebGUI',11,'����� ����� ������ ����',1031514049);
INSERT INTO international VALUES (493,'WebGUI',11,'���� ��� ������',1031514049);
INSERT INTO international VALUES (494,'WebGUI',11,'����� ��������� �������� ����� ������',1031514049);
INSERT INTO international VALUES (495,'WebGUI',11,'���� ����� �������',1031514049);
INSERT INTO international VALUES (496,'WebGUI',11,'������ ���� �������',1031514049);
INSERT INTO international VALUES (497,'WebGUI',11,'����� �����',1031514049);
INSERT INTO international VALUES (498,'WebGUI',11,'����� ��������',1031514049);
INSERT INTO international VALUES (499,'WebGUI',11,'���� ����� ��������',1031514049);
INSERT INTO international VALUES (500,'WebGUI',11,'���� ������',1031514049);
INSERT INTO international VALUES (501,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (502,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� ������ ������ ���� ������� ���� ������ ��� ������ ������ �������ɿ',1031514049);
INSERT INTO international VALUES (503,'WebGUI',11,'���� ������',1031514049);
INSERT INTO international VALUES (504,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (505,'WebGUI',11,'����� ���� ����',1031514049);
INSERT INTO international VALUES (506,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (507,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (508,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (509,'WebGUI',11,'��� ��� ��������',1031514049);
INSERT INTO international VALUES (510,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (511,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (512,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (513,'WebGUI',11,'����� ������',1031514049);
INSERT INTO international VALUES (514,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (515,'WebGUI',11,'�����  ����� ���� �����',1031514049);
INSERT INTO international VALUES (516,'WebGUI',11,'����� ������� !',1031514049);
INSERT INTO international VALUES (517,'WebGUI',11,'����� ������� !',1031514049);
INSERT INTO international VALUES (518,'WebGUI',11,'�������  ������ ������',1031514049);
INSERT INTO international VALUES (519,'WebGUI',11,'�� ��� �� ��� ������',1031514049);
INSERT INTO international VALUES (520,'WebGUI',11,'��� �� ��� ������ ��� ������ ����������',1031514049);
INSERT INTO international VALUES (521,'WebGUI',11,'��� �� ��� ������ �� ���� ������ ���������� ��� �������',1031514049);
INSERT INTO international VALUES (522,'WebGUI',11,'��� �� ��� ������ ������ ���ICQ',1031514049);
INSERT INTO international VALUES (523,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (524,'WebGUI',11,'����� ����� ���� �����',1031514049);
INSERT INTO international VALUES (525,'WebGUI',11,'����� ����� ���������',1031514049);
INSERT INTO international VALUES (526,'WebGUI',11,'��� �� ���JAVA ���',1031514049);
INSERT INTO international VALUES (527,'WebGUI',11,'����� ���� ������� ������ ��������',1031514049);
INSERT INTO international VALUES (528,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (529,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (530,'WebGUI',11,'��  <b> ����  </b> �������',1031514049);
INSERT INTO international VALUES (531,'WebGUI',11,'��  ��� <b> ������� ������  </b>',1031514049);
INSERT INTO international VALUES (532,'WebGUI',11,'��  <b> ��� ����� �����  </b> �� �������',1031514049);
INSERT INTO international VALUES (533,'WebGUI',11,'  <b> ����  </b> �������',1031514049);
INSERT INTO international VALUES (534,'WebGUI',11,'����� ��� ������ ���Ͽ',1031514049);
INSERT INTO international VALUES (535,'WebGUI',11,'����� ������� ��� ������ ���Ͽ',1031514049);
INSERT INTO international VALUES (536,'WebGUI',11,' has joined the site.\"',0);
INSERT INTO international VALUES (537,'WebGUI',11,'�������. ������',1031514049);
INSERT INTO international VALUES (538,'WebGUI',11,'�� �������',1031514049);
INSERT INTO international VALUES (539,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (540,'WebGUI',11,'������� ���� ���� ������',1031514049);
INSERT INTO international VALUES (541,'WebGUI',11,'������� ���� ���� �������',1031514049);
INSERT INTO international VALUES (542,'WebGUI',11,'������..',1031514049);
INSERT INTO international VALUES (543,'WebGUI',11,'����� ������ ��� �����',1031514049);
INSERT INTO international VALUES (544,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� �������ɿ',1031514049);
INSERT INTO international VALUES (545,'WebGUI',11,'����� ������ �����',1031514049);
INSERT INTO international VALUES (546,'WebGUI',11,'���� ��������',1031514049);
INSERT INTO international VALUES (547,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (548,'WebGUI',11,'��� ��������',1031514049);
INSERT INTO international VALUES (549,'WebGUI',11,'����� ��������',1031514049);
INSERT INTO international VALUES (550,'WebGUI',11,'������� ������ �����',1031514049);
INSERT INTO international VALUES (551,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (552,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (553,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (554,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (555,'WebGUI',11,'�����  ������ ��� ��������',1031514049);
INSERT INTO international VALUES (556,'WebGUI',11,'������. �������',1031514049);
INSERT INTO international VALUES (557,'WebGUI',11,'����� ',1031514049);
INSERT INTO international VALUES (558,'WebGUI',11,'����� ������ ��������',1031514049);
INSERT INTO international VALUES (559,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (560,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (561,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (562,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (563,'WebGUI',11,'���� ��������',1031514049);
INSERT INTO international VALUES (564,'WebGUI',11,'�� ����� �������',1031514049);
INSERT INTO international VALUES (565,'WebGUI',11,'�� ����� �������',1031514049);
INSERT INTO international VALUES (566,'WebGUI',11,'�����  ����� ��������',1031514049);
INSERT INTO international VALUES (567,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (568,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (569,'WebGUI',11,'��� �������',1031514049);
INSERT INTO international VALUES (570,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (571,'WebGUI',11,'��� �����',1031514049);
INSERT INTO international VALUES (572,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (573,'WebGUI',11,'��� ������',1031514049);
INSERT INTO international VALUES (574,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (575,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (576,'WebGUI',11,'���',1031514049);
INSERT INTO international VALUES (577,'WebGUI',11,'����� ��',1031514049);
INSERT INTO international VALUES (578,'WebGUI',11,'���� ����� ����� ������� ��������',1031514049);
INSERT INTO international VALUES (579,'WebGUI',11,'��� �������� ��� ������',1031514049);
INSERT INTO international VALUES (580,'WebGUI',11,'������ ������',1031514049);
INSERT INTO international VALUES (581,'WebGUI',11,'����� ���� �����',1031514049);
INSERT INTO international VALUES (582,'WebGUI',11,'������ �����',1031514049);
INSERT INTO international VALUES (583,'WebGUI',11,'����� ��� ������',1031514049);
INSERT INTO international VALUES (584,'WebGUI',11,'����� ��� �����',1031514049);
INSERT INTO international VALUES (585,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (586,'WebGUI',11,'������',1031514049);
INSERT INTO international VALUES (587,'WebGUI',11,'�� ��� ����� ��� ���� ��� ��� ����� ��������� ������� ������� ���� ���� ���ǿ',1031514049);
INSERT INTO international VALUES (588,'WebGUI',11,'�� ��� ����� ��� ���� �� ����� ��� ������� ��� ����� ���� ���� ���� ������� �� ������� ������ ����� ��������� (webGUI)� ������ ��� ���� ���.. ���� ���� ��� ���� ������ ���� ���� ���� ��� ������ �������� ������� �� ������� �������.',1031514630);
INSERT INTO international VALUES (589,'WebGUI',11,'����� ���',1031514049);
INSERT INTO international VALUES (590,'WebGUI',11,'���� �����',1031514049);
INSERT INTO international VALUES (591,'WebGUI',11,'�����',1031514049);
INSERT INTO international VALUES (592,'WebGUI',11,'������ �������',1031514049);
INSERT INTO international VALUES (593,'WebGUI',11,'����� �������',1031514223);
INSERT INTO international VALUES (594,'WebGUI',11,'���� �����',1031514314);
INSERT INTO international VALUES (595,'WebGUI',11,'����� �����',1031514049);
INSERT INTO international VALUES (596,'WebGUI',11,'�����(�)',1031514049);
INSERT INTO international VALUES (597,'WebGUI',11,'����� ����� �����',1031514049);
INSERT INTO international VALUES (598,'WebGUI',11,'����� ���',1031514049);
INSERT INTO international VALUES (601,'WebGUI',11,'���� �����',1031514049);
INSERT INTO international VALUES (605,'WebGUI',11,'����� �������',1031514049);
INSERT INTO international VALUES (642,'WebGUI',11,'�����/����� ����',1031514049);
INSERT INTO international VALUES (652,'WebGUI',11,'������� �������� �����',1031514049);
INSERT INTO international VALUES (653,'WebGUI',11,'���ɡ ���',1031514049);
INSERT INTO international VALUES (654,'WebGUI',11,'����� ���',1031514049);
INSERT INTO international VALUES (655,'WebGUI',11,'������ �����/���',1031514049);
INSERT INTO international VALUES (656,'WebGUI',11,'������ �����ɡ �����',1031514049);
INSERT INTO international VALUES (657,'WebGUI',11,'������ ���',1031514049);
INSERT INTO international VALUES (658,'WebGUI',11,'�������� �����',1031514049);
INSERT INTO international VALUES (659,'WebGUI',11,'������ʡ �����',1031514049);
INSERT INTO international VALUES (660,'WebGUI',11,'������ʡ �����',1031514049);
INSERT INTO international VALUES (661,'WebGUI',11,'������� ����ݡ �����',1031514049);
INSERT INTO international VALUES (662,'WebGUI',11,'������ʡ �����',1031514049);
INSERT INTO international VALUES (663,'WebGUI',11,'������� �����ϡ �����',1031514049);
INSERT INTO international VALUES (664,'WebGUI',11,'������� �������ʡ ���',1031514049);
INSERT INTO international VALUES (665,'WebGUI',11,'�����ɡ ���',1031514049);
INSERT INTO international VALUES (666,'WebGUI',11,'����� �����/�����',1031514049);
INSERT INTO international VALUES (667,'WebGUI',11,'�����ɡ �����/���',1031514049);
INSERT INTO international VALUES (668,'WebGUI',11,'����� ������� �����',1031514049);
INSERT INTO international VALUES (669,'WebGUI',11,'������ʡ  �����',1031514049);
INSERT INTO international VALUES (670,'WebGUI',11,'���ɡ �����/���',1031514049);
INSERT INTO international VALUES (671,'WebGUI',11,'������� �������ʡ �����',1031514049);
INSERT INTO international VALUES (672,'WebGUI',11,'������� �������� �����ɡ �����',1031514049);
INSERT INTO international VALUES (673,'WebGUI',11,'���ɡ ���',1031514049);
INSERT INTO international VALUES (674,'WebGUI',11,'������� �����ɡ �����',1031514049);
INSERT INTO international VALUES (675,'WebGUI',11,'���� ����ˡ �������',1031514049);
INSERT INTO international VALUES (676,'WebGUI',11,'��ѡ �����',1031514049);
INSERT INTO international VALUES (677,'WebGUI',11,'������� �������ʡ �����/���',1031514049);
INSERT INTO international VALUES (678,'WebGUI',11,'��ѡ �����',1031514049);
INSERT INTO international VALUES (679,'WebGUI',11,'������� ������� �����',1031514049);
INSERT INTO international VALUES (680,'WebGUI',11,'���ɡ �����',1031514049);
INSERT INTO international VALUES (681,'WebGUI',11,'����ʡ �����',1031514049);
INSERT INTO international VALUES (682,'WebGUI',11,'������ �������� �����ɡ �����',1031514049);
INSERT INTO international VALUES (683,'WebGUI',11,'����ȡ �����',1031514049);
INSERT INTO international VALUES (684,'WebGUI',11,'���ȡ �����/�����',1031514049);
INSERT INTO international VALUES (685,'WebGUI',11,'���ȡ ���',1031514049);
INSERT INTO international VALUES (686,'WebGUI',11,'������ ��ѡ �����',1031514049);
INSERT INTO international VALUES (696,'WebGUI',11,'��� �������ʡ �����',1031514049);
INSERT INTO international VALUES (697,'WebGUI',11,'�������. �����ߡ �����',1031514049);
INSERT INTO international VALUES (699,'WebGUI',11,'��� ���� �������',1031514049);
INSERT INTO international VALUES (700,'WebGUI',11,'����� (������)',1031514049);
INSERT INTO international VALUES (701,'WebGUI',11,'������� (��������)',1031514049);
INSERT INTO international VALUES (702,'WebGUI',11,'����� (������)',1031514049);
INSERT INTO international VALUES (703,'WebGUI',11,'����� (�������)',1031514049);
INSERT INTO international VALUES (704,'WebGUI',11,'������� (�������)',1031514049);
INSERT INTO international VALUES (705,'WebGUI',11,'������� (�������)',1031514049);
INSERT INTO international VALUES (706,'WebGUI',11,'������ (�������)',1031514049);
INSERT INTO international VALUES (707,'WebGUI',11,'������� ������Ϳ',1031514049);
INSERT INTO international VALUES (708,'WebGUI',11,'������� �������ҡ �����',1031514049);
INSERT INTO international VALUES (710,'WebGUI',11,'����� ������� ��������',1031514049);
INSERT INTO international VALUES (711,'WebGUI',11,'����� ����� ������',1031514049);
INSERT INTO international VALUES (713,'WebGUI',11,'����� ����� �������',1031514049);
INSERT INTO international VALUES (714,'WebGUI',11,'����� ����� ������',1031514049);
INSERT INTO international VALUES (715,'WebGUI',11,'����� ����� ������ ���������',1031514049);
INSERT INTO international VALUES (716,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (717,'WebGUI',11,'����',1031514049);
INSERT INTO international VALUES (718,'WebGUI',11,'����� �����',1031514184);
INSERT INTO international VALUES (719,'WebGUI',11,'����� �������',1031514679);
INSERT INTO international VALUES (720,'WebGUI',11,'������',1031514777);
INSERT INTO international VALUES (721,'WebGUI',11,'���� �����',1031515005);
INSERT INTO international VALUES (722,'WebGUI',11,'����',1031517195);
INSERT INTO international VALUES (723,'WebGUI',11,'������',1031800566);
INSERT INTO international VALUES (724,'WebGUI',11,'������ ����� �������� �� ���� �� ����� ������',1031879593);
INSERT INTO international VALUES (725,'WebGUI',11,'������ ����� �������� �� ���� ������',1031879612);
INSERT INTO international VALUES (726,'WebGUI',11,'������ ������ ������ �� ���� �����',1031879567);
INSERT INTO international VALUES (727,'WebGUI',11,'\"������ ������ ������ �� ���� \"\"���� ����\"\"\"',1031880154);
INSERT INTO international VALUES (1,'WobjectProxy',11,'������� ��� ������',1031514049);
INSERT INTO international VALUES (2,'WobjectProxy',11,'����� ������� ������',1031514049);
INSERT INTO international VALUES (3,'WobjectProxy',11,'������� ������',1031514049);
INSERT INTO international VALUES (4,'WobjectProxy',11,'���� ����� �� �������� ��� ������.  ���� ��� ��� ��� ���������',1031514049);
INSERT INTO international VALUES (5,'WobjectProxy',11,'������� ������� �����/�����',1031514049);
INSERT INTO international VALUES (746,'WebGUI',1,'Toolbar Icon Set',1036046598);
INSERT INTO international VALUES (45,'Survey',1,'Are you certain you wish to delete this answer and its responses?',1035951913);
INSERT INTO international VALUES (44,'Survey',1,'Are you certain you wish to delete this question, its answers and responses?',1035951626);
INSERT INTO international VALUES (34,'Survey',1,'Agree.',1035948150);
INSERT INTO international VALUES (33,'Survey',1,'Strongly agree.',1035948137);
INSERT INTO international VALUES (32,'Survey',1,'False.',1035948033);
INSERT INTO international VALUES (31,'Survey',1,'True.',1035948023);
INSERT INTO international VALUES (27,'Survey',1,'Add an opinion (agree/disagree) answer scale.',1035948010);
INSERT INTO international VALUES (25,'Survey',1,'Add a true/false answer.',1035947960);
INSERT INTO international VALUES (26,'Survey',1,'Add a frequency (always/never) answer scale.',1035947924);
INSERT INTO international VALUES (43,'Survey',1,'Never.',1035947630);
INSERT INTO international VALUES (42,'Survey',1,'Occasionally.',1035947620);
INSERT INTO international VALUES (41,'Survey',1,'Frequently.',1035947594);
INSERT INTO international VALUES (40,'Survey',1,'Always.',1035947586);
INSERT INTO international VALUES (39,'Survey',1,'Not applicable.',1035947497);
INSERT INTO international VALUES (38,'Survey',1,'Strongly disagree.',1035947488);
INSERT INTO international VALUES (37,'Survey',1,'Disagree.',1035947477);
INSERT INTO international VALUES (36,'Survey',1,'Somewhat disagree.',1035947465);
INSERT INTO international VALUES (35,'Survey',1,'Somewhat agree.',1035947450);
INSERT INTO international VALUES (30,'Survey',1,'Add a new question.',1035944708);
INSERT INTO international VALUES (29,'Survey',1,'Add a text answer.',1035874640);
INSERT INTO international VALUES (24,'Survey',1,'Add a multiple choice answer.',1035874502);
INSERT INTO international VALUES (745,'WebGUI',1,'Go back to the page.',1035872437);
INSERT INTO international VALUES (28,'Survey',1,'Add a question.',1035872173);
INSERT INTO international VALUES (744,'WebGUI',1,'What next?',1035864828);
INSERT INTO international VALUES (23,'Survey',1,'Add a new answer.',1035864494);
INSERT INTO international VALUES (22,'Survey',1,'Answer Type',1035864413);
INSERT INTO international VALUES (21,'Survey',1,'Go To',1035506057);
INSERT INTO international VALUES (20,'Survey',1,'Is this answer correct?',1035436321);
INSERT INTO international VALUES (19,'Survey',1,'Answer',1035436296);
INSERT INTO international VALUES (18,'Survey',1,'Edit Answer',1035436102);
INSERT INTO international VALUES (17,'Survey',1,'Edit Question',1035436091);
INSERT INTO international VALUES (16,'Survey',1,'Randomize answers?',1035429242);
INSERT INTO international VALUES (15,'Survey',1,'Allow comment?',1035429212);
INSERT INTO international VALUES (14,'Survey',1,'Question',1035428770);
INSERT INTO international VALUES (743,'WebGUI',1,'You must specify a valid email address in order to attempt to recover your password.',1035246389);
INSERT INTO international VALUES (13,'Survey',1,'Who can view reports?',1033949863);
INSERT INTO international VALUES (12,'Survey',1,'Who can take the survey?',1033949789);
INSERT INTO international VALUES (11,'Survey',1,'Mode',1033949647);
INSERT INTO international VALUES (10,'Survey',1,'Quiz',1033949566);
INSERT INTO international VALUES (9,'Survey',1,'Survey',1033949540);
INSERT INTO international VALUES (8,'Survey',1,'Question Order',1033949393);
INSERT INTO international VALUES (7,'Survey',1,'Response Driven',1033944729);
INSERT INTO international VALUES (6,'Survey',1,'Random',1033944643);
INSERT INTO international VALUES (5,'Survey',1,'Sequential',1033944535);
INSERT INTO international VALUES (3,'Survey',1,'Survey, Add/Edit',1033944306);
INSERT INTO international VALUES (4,'Survey',1,'',1033944306);
INSERT INTO international VALUES (2,'Survey',1,'Edit Survey',1033943825);
INSERT INTO international VALUES (1,'Survey',1,'Survey',1033942924);

--
-- Table structure for table 'karmaLog'
--

CREATE TABLE karmaLog (
  userId int(11) NOT NULL default '0',
  amount int(11) NOT NULL default '1',
  source varchar(255) default NULL,
  description text,
  dateModified int(11) NOT NULL default '1026097656'
) TYPE=MyISAM;

--
-- Dumping data for table 'karmaLog'
--



--
-- Table structure for table 'language'
--

CREATE TABLE language (
  languageId int(11) NOT NULL default '0',
  language varchar(255) default NULL,
  characterSet varchar(255) default NULL,
  toolbar varchar(35) NOT NULL default 'default',
  PRIMARY KEY  (languageId)
) TYPE=MyISAM;

--
-- Dumping data for table 'language'
--


INSERT INTO language VALUES (1,'English','ISO-8859-1','default');
INSERT INTO language VALUES (2,'Deutsch','ISO-8859-1','default');
INSERT INTO language VALUES (3,'Nederlands','ISO-8859-1','default');
INSERT INTO language VALUES (4,'Espa�ol','ISO-8859-1','default');
INSERT INTO language VALUES (5,'Portugu�s','ISO-8859-1','default');
INSERT INTO language VALUES (6,'Svenska','ISO-8859-1','default');
INSERT INTO language VALUES (7,'�������� (Chinese Simple)','gb2312','default');
INSERT INTO language VALUES (8,'Italiano','ISO-8859-1','default');
INSERT INTO language VALUES (9,'�c�^���� (Chinese Traditional)','BIG5','default');
INSERT INTO language VALUES (10,'Dansk','ISO-8859-1','default');
INSERT INTO language VALUES (11,'Arabic','ISO-8859-6','default');

--
-- Table structure for table 'messageLog'
--

CREATE TABLE messageLog (
  messageLogId int(11) NOT NULL default '0',
  userId int(11) NOT NULL default '0',
  message text,
  url text,
  dateOfEntry int(11) default NULL,
  subject varchar(255) default NULL,
  status varchar(30) default 'notice',
  PRIMARY KEY  (messageLogId,userId)
) TYPE=MyISAM;

--
-- Dumping data for table 'messageLog'
--



--
-- Table structure for table 'page'
--

CREATE TABLE page (
  pageId int(11) NOT NULL default '0',
  parentId int(11) NOT NULL default '0',
  title varchar(255) default NULL,
  styleId int(11) NOT NULL default '0',
  ownerId int(11) NOT NULL default '0',
  ownerView int(11) NOT NULL default '1',
  ownerEdit int(11) NOT NULL default '1',
  groupId int(11) default NULL,
  groupView int(11) NOT NULL default '1',
  groupEdit int(11) NOT NULL default '0',
  worldView int(11) NOT NULL default '1',
  worldEdit int(11) NOT NULL default '0',
  sequenceNumber int(11) NOT NULL default '1',
  metaTags text,
  urlizedTitle varchar(255) default NULL,
  defaultMetaTags int(11) NOT NULL default '0',
  menuTitle varchar(128) default NULL,
  synopsis text,
  templateId int(11) NOT NULL default '1',
  startDate int(11) NOT NULL default '946710000',
  endDate int(11) NOT NULL default '2082783600',
  redirectURL text,
  PRIMARY KEY  (pageId)
) TYPE=MyISAM;

--
-- Dumping data for table 'page'
--


INSERT INTO page VALUES (1,0,'Home',-6,3,1,1,1,1,0,1,0,0,'','home',1,'Home',NULL,1,946710000,2082783600,NULL);
INSERT INTO page VALUES (4,0,'Page Not Found',-6,3,1,1,1,1,0,1,0,21,'','page_not_found',0,'Page Not Found',NULL,1,946710000,2082783600,NULL);
INSERT INTO page VALUES (3,0,'Trash',5,3,1,1,3,1,1,0,0,22,'','trash',0,'Trash',NULL,1,946710000,2082783600,NULL);
INSERT INTO page VALUES (2,0,'Clipboard',4,3,1,1,4,1,1,0,0,23,'','clipboard',0,'Clipboard',NULL,1,946710000,2082783600,NULL);
INSERT INTO page VALUES (5,0,'Packages',1,3,0,0,6,1,1,0,0,24,'','packages',0,'Packages',NULL,1,946710000,2082783600,NULL);

--
-- Table structure for table 'settings'
--

CREATE TABLE settings (
  name varchar(255) NOT NULL default '',
  value text,
  PRIMARY KEY  (name)
) TYPE=MyISAM;

--
-- Dumping data for table 'settings'
--


INSERT INTO settings VALUES ('maxAttachmentSize','300');
INSERT INTO settings VALUES ('sessionTimeout','28000');
INSERT INTO settings VALUES ('smtpServer','localhost');
INSERT INTO settings VALUES ('companyEmail','info@mycompany.com');
INSERT INTO settings VALUES ('ldapURL','ldap://ldap.mycompany.com:389/o=MyCompany');
INSERT INTO settings VALUES ('companyName','My Company');
INSERT INTO settings VALUES ('companyURL','http://www.mycompany.com');
INSERT INTO settings VALUES ('ldapId','shortname');
INSERT INTO settings VALUES ('ldapIdName','LDAP Shortname');
INSERT INTO settings VALUES ('ldapPasswordName','LDAP Password');
INSERT INTO settings VALUES ('authMethod','WebGUI');
INSERT INTO settings VALUES ('anonymousRegistration','1');
INSERT INTO settings VALUES ('notFoundPage','1');
INSERT INTO settings VALUES ('recoverPasswordEmail','Someone (probably you) requested your account information be sent. Your password has been reset. The following represents your new account information:');
INSERT INTO settings VALUES ('usernameBinding','0');
INSERT INTO settings VALUES ('profileName','1');
INSERT INTO settings VALUES ('profileExtraContact','1');
INSERT INTO settings VALUES ('profileMisc','1');
INSERT INTO settings VALUES ('profileHome','0');
INSERT INTO settings VALUES ('profileWork','0');
INSERT INTO settings VALUES ('docTypeDec','<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">');
INSERT INTO settings VALUES ('preventProxyCache','0');
INSERT INTO settings VALUES ('thumbnailSize','50');
INSERT INTO settings VALUES ('filterContributedHTML','most');
INSERT INTO settings VALUES ('textAreaRows','5');
INSERT INTO settings VALUES ('textAreaCols','50');
INSERT INTO settings VALUES ('textBoxSize','30');
INSERT INTO settings VALUES ('richEditor','built-in');
INSERT INTO settings VALUES ('addEditStampToPosts','1');
INSERT INTO settings VALUES ('defaultPage','1');
INSERT INTO settings VALUES ('onNewUserAlertGroup','3');
INSERT INTO settings VALUES ('alertOnNewUser','0');
INSERT INTO settings VALUES ('useKarma','0');
INSERT INTO settings VALUES ('karmaPerLogin','1');
INSERT INTO settings VALUES ('runOnRegistration','');
INSERT INTO settings VALUES ('maxImageSize','100000');
INSERT INTO settings VALUES ('imageManagersGroup','9');
INSERT INTO settings VALUES ('showDebug','0');
INSERT INTO settings VALUES ('styleManagersGroup','5');
INSERT INTO settings VALUES ('templateManagersGroup','8');

--
-- Table structure for table 'style'
--

CREATE TABLE style (
  styleId int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  styleSheet text,
  body text,
  PRIMARY KEY  (styleId)
) TYPE=MyISAM;

--
-- Dumping data for table 'style'
--


INSERT INTO style VALUES (-3,'WebGUI','<style>\r\n\r\n.content, body {\r\n  background-color: #000000;\r\n  color: #C9E200;\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  scrollbar-base-color: #000000;\r\n  scrollbar-track-color: #444444;\r\n  scrollbar-face-color: #000000;\r\n  scrollbar-highlight-color: #555555;\r\n  scrollbar-3dlight-color: #444444;\r\n  scrollbar-darkshadow-color: #222222;\r\n  scrollbar-shadow-color: #333333;\r\n  scrollbar-arrow-color: #ED4400;\r\n}\r\n\r\nselect, input, textarea {\r\n  color: #000000;\r\n  background-color: #C9E200;\r\n}\r\n\r\nA {\r\n  color: #ED4400;\r\n}\r\n\r\nA:visited {\r\n  color: #ffffff;\r\n}\r\n\r\n.verticalMenu {\r\n  font-size: 10pt;\r\n}\r\n\r\n.verticalMenu A, .verticalMenu A:visited {\r\n  color: #000000;\r\n}\r\n\r\n.verticalMenu A:hover {\r\n  color: #ED4400;\r\n}\r\n\r\n.selectedMenuItem A,.selectedMenuItem A:visited {\r\n  color: #ED4400;\r\n}\r\n\r\n.loginBox {\r\n  font-size: 10pt;\r\n}\r\n\r\nH1 {\r\n  font-family: helvetica, arial;\r\n  font-size: 16pt;\r\n}\r\n\r\nsearchBox {\r\n  font-size: 10pt;\r\n}\r\n\r\n.pagination {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n  text-align: center;\r\n}\r\n\r\n.adminBar {\r\n        background-color: #dddddd;\r\n        font-size: 8pt;\r\n        font-family: helvetica, arial;\r\n        color: #000055;\r\n}\r\n\r\n.formDescription {\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  font-weight: bold;\r\n}\r\n\r\n.formSubtext {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.highlight {\r\n  background-color: #444444;\r\n}\r\n\r\n.tableMenu {\r\n  background-color: #444444;\r\n  font-size: 8pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableMenu a {\r\n  text-decoration: none;\r\n}\r\n\r\n.tableHeader {\r\n  background-color: #555555;\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableData {\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.pollAnswer {\r\n  font-family: Helvetica, Arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.pollColor {\r\n  background-color: #C9E200;\r\n}\r\n\r\n.pollQuestion {\r\n  font-face: Helvetica, Arial;\r\n  font-weight: bold;\r\n}\r\n\r\n.faqQuestion {\r\n  font-size: 12pt;\r\n  color: #aaaaaa;\r\n}\r\n</style>','^AdminBar;\r\n\r\n<body bgcolor=\"#000000\" text=\"#C9E200\" link=\"#ED4400\" marginwidth=\"0\" leftmargin=\"0\">\r\n<table width=\"100%\" cellpadding=0 cellspacing=0 border=0>\r\n<tr><td valign=\"top\" width=\"200\">\r\n<a href=\"/\"><img src=\"^Extras;styles/webgui/logo.gif\" border=0></a>\r\n<table cellpadding=0 border=0 cellspacing=0>\r\n<tr><td colspan=3><img src=\"^Extras;styles/webgui/menuTop.gif\" width=\"200\"></td></tr>\r\n<tr>\r\n  <td bgcolor=\"#C9E200\"><img src=\"^Extras;spacer.gif\" width=5></td>\r\n  <td bgcolor=\"#C9E200\">^FlexMenu;</td>\r\n  <td bgcolor=\"#C9E200\"><img src=\"^Extras;spacer.gif\" width=5></td>\r\n</tr>\r\n<tr><td colspan=3><img src=\"^Extras;styles/webgui/menuBottom.gif\" width=\"200\"></td></tr>\r\n</table>\r\n^L;\r\n</td>\r\n<td><img src=\"^Extras;spacer.gif\" width=20></td>\r\n<td valign=\"top\" width=\"100%\">\r\n\r\n\r\n\r\n^-;\r\n\r\n</td></tr></table>\r\n<p>\r\n<div align=\"center\">\r\n<a href=\"/\"><img src=\"^Extras;styles/webgui/icon.gif\" border=0></a><br>\r\n�2001-2002 Plain Black Software<br>\r\n</div>\r\n</body>');
INSERT INTO style VALUES (2,'Fail Safe','<style>\r\n.adminBar {\r\n        background-color: #dddddd;\r\n        font-size: 8pt;\r\n        font-family: helvetica, arial;\r\n        color: #000055;\r\n}\r\n</style>','^AdminBar;\n\n<body>\r\n^H; / ^t; / ^m; / ^a;\r\n<hr>\n\n^-;\n\n<hr>\r\n^H; / ^t; / ^m; / ^a;\r\n</body>');
INSERT INTO style VALUES (-2,'Plain Black Software (black)','<style>\r\n\r\n.content{\r\n  background-color: #000000;\r\n  color: #ffffff;\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  padding: 10pt;\r\n}\r\n\r\n.sideMenu {\r\n  filter:DropShadow(OffX=2,OffY=2,color:#000000);\r\n  font-size: 10pt;\r\n  padding: 5pt;\r\n  font-family: helvetica, arial;\r\n  color: #000000;\r\n}\r\n\r\n.sideMenu A {\r\n  text-decoration: none;\r\n  color: #ffffff;\r\n}\r\n\r\n.sideMenu A:hover {\r\n  color: #EF4200;\r\n  text-decoration: underline;\r\n}\r\n\r\nH1 {\r\n  font-family: helvetica, arial;\r\n  font-size: 16pt;\r\n  color: #cee700;\r\n}\r\n\r\nsearchBox {\r\n  font-size: 10pt;\r\n}\r\n\r\nA {\r\n  color: #EF4200;\r\n}\r\n\r\n.pagination {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n  text-align: center;\r\n}\r\n\r\n.adminBar {\r\n  background-color: #dddddd;\r\n  font-size: 8pt;\r\n  font-family: helvetica, arial;\r\n  color: #000055;\r\n}\r\n\r\n.crumbTrail {\r\n  font-family: helvetica, arial;\r\n  color: #cee700;\r\n  font-size: 8pt;\r\n}\r\n\r\n.crumbTrail A,.crumbTrail A:visited {\r\n  color: #ffffff;\r\n}\r\n\r\n.formDescription {\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  font-weight: bold;\r\n}\r\n\r\n.formSubtext {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.highlight {\r\n  background-color: #535558;\r\n}\r\n\r\n.tableMenu {\r\n  background-color: #38393C;\r\n  font-size: 8pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableMenu a {\r\n  text-decoration: none;\r\n}\r\n\r\n.tableHeader {\r\n  background-color: #38393C;\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableData {\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.pollAnswer {\r\n  font-family: Helvetica, Arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.pollColor {\r\n  background-color: #cee700;\r\n  border: thin solid #ffffff;\r\n}\r\n\r\n.pollQuestion {\r\n  font-face: Helvetica, Arial;\r\n  font-weight: bold;\r\n}\r\n\r\n.faqQuestion {\r\n  font-size: 12pt;\r\n  color: #cee700;\r\n}\r\n\r\n</style>','^AdminBar;\n\n<body text=\"#ffffff\" link=\"#EF4200\" vlink=\"#EF4200\" bgcolor=\"#535558\" marginwidth=0 marginheight=0 leftmargin=0 rightmargin=0 topmargin=0 bottommargin=0>\r\n\r\n<table cellspacing=0 cellpadding=0 border=0 width=\"100%\">\r\n<tr>\r\n	<td width=\"200\" rowspan=\"2\" bgcolor=\"#ffffff\"><a href=\"/\"><img src=\"^Extras;styles/plainblack/logo-white.gif\" width=\"200\" height=\"50\" alt=\"Plain Black Software\" border=\"0\"></a></td>\r\n	<td width=\"70%\" bgcolor=\"#38393C\" valign=\"bottom\"><img src=\"^Extras;spacer.gif\" width=\"5\"><img src=\"^Extras;styles/plainblack/user.gif\" width=\"41\" height=\"25\" alt=\"User:\" border=\"0\"> <a href=\"^\\;?op=displayAccount\" style=\"font-family: courier; color: #cee700; text-decoration: none; vertical-align: middle;\">^@;</a></td>\r\n	<td width=\"30%\" align=\"right\" bgcolor=\"#38393C\" valign=\"bottom\"><a href=\"^\\;?op=displayAccount\"><img src=\"^Extras;styles/plainblack/myaccount.gif\" width=\"84\" height=\"25\" alt=\"My Account\" border=\"0\"></a><img src=\"^Extras;styles/plainblack/darkbar.gif\" width=\"11\" height=\"25\" alt=\"|\" border=\"0\"><a href=\"^/;/download\"><img src=\"^Extras;styles/plainblack/download.gif\" width=\"75\" height=\"25\" alt=\"Download\" border=\"0\"></a><img src=\"^Extras;styles/plainblack/darkbar.gif\" width=\"11\" height=\"25\" alt=\"|\" border=\"0\"><a href=\"/\"><img src=\"^Extras;styles/plainblack/home.gif\" width=\"40\" height=\"25\" alt=\"Home\" border=\"0\"></a><img src=\"^Extras;spacer.gif\" width=\"5\"></td>\r\n</tr>\r\n<tr>\r\n	<td width=\"70%\" bgcolor=\"#535558\"><img src=\"^Extras;spacer.gif\" width=\"5\">^C;</td>\r\n	<td width=\"30%\" align=\"right\" bgcolor=\"#535558\" style=\"font-family: courier; color: #cee700;\">^D(\"%c %D, %y\");<img src=\"^Extras;spacer.gif\" width=\"5\"></td>\r\n</tr>\r\n</table>\r\n<table cellspacing=0 cellpadding=0 border=0 width=\"100%\" bgcolor=\"#38393C\">\r\n<tr>\r\n	<td width=\"200\" valign=\"top\" class=\"sideMenu\">^T(2);</td>\r\n	<td width=\"100%\" bgcolor=\"#000000\" rowspan=\"2\" valign=\"top\">\n\n^-;\n\n</td>\r\n</tr>\r\n<tr>\r\n	<td width=\"200\" bgcolor=\"#38393C\" align=\"center\" valign=\"bottom\"><p><img src=\"^Extras;styles/plainblack/webgui.gif\" width=\"200\" height=\"84\" alt=\"\" border=\"0\"><p></td>\r\n</tr>\r\n</table>\r\n<table cellspacing=0 cellpadding=0 border=0 width=\"100%\">\r\n<tr>\r\n	<td width=\"50%\" bgcolor=\"#535558\"><img src=\"^Extras;styles/plainblack/copyright.gif\" width=\"223\" height=\"25\" alt=\"Copyright 2001-2002 Plain Black Software\" border=\"0\"></td>\r\n	<td width=\"50%\" align=\"right\" bgcolor=\"#535558\"><a href=\"^r(linkonly);\"><img src=\"^Extras;styles/plainblack/makepageprintable.gif\" width=\"149\" height=\"25\" alt=\"Make Page Printable\" border=\"0\"></a></td>\r\n</tr>\r\n</table>\r\n</body>\r\n');
INSERT INTO style VALUES (4,'Clipboard','<style>\r\n.adminBar {\r\n        background-color: #dddddd;\r\n        font-size: 8pt;\r\n        font-family: helvetica, arial;\r\n        color: #000055;\r\n}\r\n</style>','^AdminBar;\n\n<body>\r\n<table width=\"100%\">\r\n<tr><td><span style=\"font-size: 36pt;\">Clipboard</span>\r\n</td>\r\n<td align=\"right\">^H; / ^a;</td></tr>\r\n<tr><td bgcolor=\"#000000\" colspan=\"2\"><img src=\"^Extras;spacer.gif\" height=\"1\"></td></tr>\r\n</table>\r\n<table width=\"100%\"><tr><td valign=\"top\" width=\"30%\"><b>PAGES</b><br>^FlexMenu;</td><td width=\"1\" bgcolor=\"#000000\"><img src=\"^Extras;spacer.gif\" width=\"1\"></td><td valign=\"top\" width=\"70%\"><b>CONTENT</b><br>\n\n^-;\n\n</td></tr></table>\r\n<table width=\"100%\">\r\n<tr><td bgcolor=\"#000000\" colspan=\"2\"><img src=\"^Extras;spacer.gif\" height=\"1\"></td></tr>\r\n</table>\r\n^H; / ^a;\r\n</body>');
INSERT INTO style VALUES (-1,'Yahoo!','','^AdminBar;\n\n<html><head><title>Yahoo!</title><meta http-equiv=\"PICS-Label\" content=\'(PICS-1.1 \"http://www.rsac.org/ratingsv01.html\" l gen true for \"http://www.yahoo.com\" r (n 0 s 0 v 0 l 0))\'></head><body>\r\n<script language=javascript><!--\r\nfunction f(){\r\nvar f,m,p,a,i,k,o,e,l,c,d;\r\nf=\"0123456789abcdefghijklmnopqrstuvwxyz\";\r\nm=new Array;\r\np=\"claim-your-name\";\r\na=10;\r\nfor(i=0;i<36;i++){\r\n if(i==26)a=-26;\r\n m[f.charAt(i)]=f.charAt(i+a);\r\n}\r\nk=document.cookie;\r\nif((o=k.indexOf(\"Y=\"))==-1)return p;\r\nif((o=k.indexOf(\"l=\",o+2))==-1)return p;\r\nif((e=k.indexOf(\"/\",o+2))==-1)return p;\r\nif(e>o+18)e=o+18;\r\nl=k.substring(o+2,e);\r\np=\"\";\r\nfor(i=0;i<l.length;i++){\r\n c=l.charAt(i);\r\n if(m[c])p+=m[c];else p+=\'-\';\r\n}\r\nreturn p;\r\n}\r\nd=f();//-->\r\n</script>\r\n<center><form name=f action=http://search.yahoo.com/bin/search><map name=m><area coords=\"0,0,52,52\" href=r/c1><area coords=\"53,0,121,52\" href=r/p1><area coords=\"122,0,191,52\" href=r/m1><area coords=\"441,0,510,52\" href=r/wn><area coords=\"511,0,579,52\" href=r/i1><area coords=\"580,0,637,52\" href=r/hw></map><img width=638 height=53 border=0 usemap=\"#m\" src=http://us.a1.yimg.com/us.yimg.com/i/ww/m5v5.gif alt=Yahoo><br><table border=0 cellspacing=0 cellpadding=3 width=640><tr><td align=center width=205>\r\n<font color=ff0020>new!</font> <a href=\"http://www.yahoo.com/homet/?http://new.domains.yahoo.com\"><b>Y! Domains</b></a><br><small>reserve .biz & .info domains</small></td><td align=center><a href=\"http://rd.yahoo.com/M=77122.1317476.2909345.220161/D=yahoo_top/S=2716149:NP/A=656341/?http://website.yahoo.com/\" target=\"_top\"><img width=230 height=33 src=\"http://us.a1.yimg.com/us.yimg.com/a/pr/promo/anchor/hp_website2.gif\" alt=\"\" border=0></a></td><td align=center width=205><a href=\"http://www.yahoo.com//homet/?http://mail.yahoo.com\"><b>Yahoo! Mail</b></a><br>you@yahoo.com</td></tr><tr><td colspan=3 align=center><input size=30 name=p>\r\n<input type=submit value=Search> <a href=http://www.yahoo.com/r/so>advanced search</a></td></tr></table>\r\n</form>\r\n<div align=\"left\">\r\n\n\n^-;\n\n</div>\r\n<hr noshade size=1 width=640><small><a href=http://www.yahoo.com/r/ad>How to Suggest a Site</a> -\r\n<a href=http://www.yahoo.com/r/cp>Company Info</a> -\r\n<a href=http://www.yahoo.com/r/cy>Copyright Policy</a> -\r\n<a href=http://www.yahoo.com/r/ts>Terms of Service</a> -\r\n<a href=http://www.yahoo.com/r/cb>Contributors</a> -\r\n<a href=http://www.yahoo.com/r/hr>Jobs</a> -\r\n<a href=http://www.yahoo.com/r/ao>Advertising</a><p>Copyright � 2001 Yahoo! Inc. All rights reserved.</small><br><a href=http://www.yahoo.com/r/pv>Privacy Policy</a></form></center></body></html>\r\n');
INSERT INTO style VALUES (-4,'Demo Style','<style>\r\n\r\n.homeLink, .myAccountLink, {\r\n  color: #ffffff;\r\n  font-size: 8pt;\r\n}\r\n\r\n.verticalMenu A, .verticalMenu A:visited {\r\n  color: #ffffff;\r\n  font-weight: bold;\r\n}\r\n\r\nbody {\r\n  font-family:arial; \r\n  font-size: 12px; \r\n  color: black;\r\n  background: #666666;\r\n}\r\n\r\ntd { \r\n  font-size: 11px;\r\n}\r\n\r\nH1 {\r\n  MARGIN-TOP: 3px;\r\n  MARGIN-BOTTOM: 3px;\r\n  font-size: 16pt;\r\n}\r\n\r\nH3 {\r\n  MARGIN-TOP: 3px;\r\n  MARGIN-BOTTOM: 3px;\r\n}\r\n\r\nH4 {\r\n  MARGIN-TOP: 3px;\r\n  MARGIN-BOTTOM: 3px;\r\n}\r\n\r\nH5 {\r\n  MARGIN-TOP: 3px;\r\n  MARGIN-BOTTOM: 3px;\r\n}\r\n\r\nul { \r\n  MARGIN-TOP: 3px; \r\n  MARGIN-BOTTOM: 3px \r\n}\r\n\r\nA {\r\n  color: #800000;\r\n  TEXT-DECORATION: underline\r\n}\r\n\r\nA:hover {\r\n  color: #990000;\r\n  TEXT-DECORATION: none;\r\n}\r\n\r\n.pagination {\r\n  font-family: helvetica, arial;\r\n  text-align: center;\r\n  font-size: 8pt;\r\n}\r\n\r\n.horizontalMenu {\r\n  font-size: 8pt;\r\n  padding: 5px;\r\n  font-weight: bold;\r\n  color: #aaaaaa;\r\n}\r\n\r\n.horizontalMenu A, .horizontalMenu A:visited {\r\n  color: #ffffff;\r\n}\r\n\r\n.adminBar {\r\n        background-color: #dddddd;\r\n        font-size: 8pt;\r\n        font-family: helvetica, arial;\r\n        color: #000055;\r\n}\r\n\r\n.highlight {\r\n  background-color: #EAEAEA;\r\n}\r\n\r\n.formDescription {\r\n  font-size: 10pt;\r\n}\r\n\r\n.formSubtext {\r\n  font-size: 8pt;\r\n}\r\n\r\n.tableMenu {\r\n  font-size: 8pt;\r\n  background-color: #F5DFDF;\r\n}\r\n.tableMenu a {\r\n  text-decoration: none;\r\n}\r\n\r\n.tableHeader {\r\n  background-color: #F5DFDF;\r\n  font-size: 10pt;\r\n}\r\n\r\n.tableData {\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.pollAnswer {\r\n  font-family: Helvetica, Arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.pollColor {\r\n  background-color: #ffddbb;\r\n}\r\n\r\n.pollQuestion {\r\n  font-face: Helvetica, Arial;\r\n  font-weight: bold;\r\n}\r\n\r\n.faqQuestion {\r\n  color: #000000;\r\n  font-weight: bold;\r\n  text-decoration: none;\r\n}\r\n\r\n</style>','^AdminBar;\n\n<body bgcolor=\"#666666\">\r\n\r\n<table border=\"0\" width=\"700\" background=\"^Extras;styles/demo/topbg-3.gif\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tr>\r\n    <td width=\"324\" height=\"80\"><img src=\"^Extras;styles/demo/top-3.jpg\" border=0 width=\"324\"></td>\r\n    <td width=\"100%\"><h3 style=\"color:white\">Your Company Name Here</h3><div style=\"color:white\">Address: 1903 Sunrise St. City, State 65977<br>\r\nTel: 915.888.8888<br>\r\nEmail: service@company.com</div></td>\r\n  </tr>\r\n</table>\r\n<table border=\"0\" width=\"700\"  height=\"21\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#000000\" align=center>\r\n  <tr>\r\n    <td><img src=\"^Extras;styles/demo/mid-3.jpg\" border=0 width=\"140\" height=\"21\"></td>\r\n    <td width=\"100%\">^t;</td>\r\n  </tr>\r\n</table>\r\n<table border=\"0\" width=\"700\"  height=\"500\" cellspacing=\"0\" cellpadding=\"0\" align=center>\r\n  <tr>\r\n    <td bgcolor=\"#990000\" width=\"140\" style=\"background-image: url(\'^Extras;styles/demo/leftbg-3.jpg\'); background-repeat: no-repeat; background-position: left top\" valign=\"top\"><img src=\"^Extras;spacer.gif\" height=\"10\" width=\"140\" border=0>\r\n<table cellpadding=4><tr><td>\r\n^M;\r\n</td></tr></table>\r\n    </td>\r\n    <td width=\"100%\" align=\"right\" height=\"100%\" valign=\"top\"><img src=\"^Extras;styles/demo/x.gif\" height=\"4\" width=\"560\"><br>\r\n    <table  width=\"99%\" height=\"99%\" border=\"0\" bgcolor=\"black\" cellpadding=\"3\" cellspacing=\"1\">\r\n    	<tr><td bgcolor=\"#f9ecec\" style=\"background-image: url(\'^Extras;styles/demo/contentbg-3.gif\'); background-repeat: no-repeat; background-position: right bottom\" height=\"100%\" valign=\"top\">\r\n    	\n\n^-;\n\n	</td></tr>\r\n    </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n<table border=\"0\" width=\"700\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tr><td align=\"right\">^H; � ^a;</td></tr>\r\n</table>\r\n\r\n\r\n</body>\r\n');
INSERT INTO style VALUES (3,'Make Page Printable','<style>\r\n\r\n.content{\r\n  background-color: #ffffff;\r\n  color: #000000;\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  padding: 10pt;\r\n}\r\n\r\nH1 {\r\n  font-family: helvetica, arial;\r\n  font-size: 16pt;\r\n}\r\n\r\nA {\r\n  color: #EF4200;\r\n}\r\n\r\n.pagination {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n  text-align: center;\r\n}\r\n\r\n.formDescription {\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  font-weight: bold;\r\n}\r\n\r\n.formSubtext {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.highlight {\r\n  background-color: #dddddd;\r\n}\r\n\r\n.tableMenu {\r\n  background-color: #cccccc;\r\n  font-size: 8pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableMenu a {\r\n  text-decoration: none;\r\n}\r\n\r\n.tableHeader {\r\n  background-color: #cccccc;\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableData {\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.pollAnswer {\r\n  font-family: Helvetica, Arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.pollColor {\r\n  background-color: #444444;\r\n}\r\n\r\n.pollQuestion {\r\n  font-face: Helvetica, Arial;\r\n  font-weight: bold;\r\n}\r\n\r\n.faqQuestion {\r\n  font-size: 12pt;\r\n  font-weight: bold;\r\n  color: #000000;\r\n}\r\n\r\n</style>','^AdminBar;\n\n<body onLoad=\"window.print()\">\r\n<div align=\"center\"><a href=\"^\\;\"><img src=\"^Extras;styles/plainblack/logo-white.gif\" border=\"0\"></a></div>\n\n^-;\n\n<div align=\"center\">� 2001-2002 Plain Black Software</div>\r\n</body>');
INSERT INTO style VALUES (-5,'Plain Black Software (white)','<style>\r\n\r\n.content{\r\n  background-color: #ffffff;\r\n  color: #000000;\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  padding: 10pt;\r\n}\r\n\r\n.sideMenu {\r\n  filter:DropShadow(OffX=2,OffY=2,color:#000000);\r\n  font-size: 10pt;\r\n  padding: 5pt;\r\n  font-family: helvetica, arial;\r\n  color: #000000;\r\n}\r\n\r\n.sideMenu A {\r\n  text-decoration: none;\r\n  color: #ffffff;\r\n}\r\n\r\n.sideMenu A:hover {\r\n  color: #EF4200;\r\n  text-decoration: underline;\r\n}\r\n\r\nH1 {\r\n  font-family: helvetica, arial;\r\n  font-size: 16pt;\r\n  color: #38393C;\r\n}\r\n\r\nsearchBox {\r\n  font-size: 10pt;\r\n}\r\n\r\nA {\r\n  color: #EF4200;\r\n}\r\n\r\n.pagination {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n  text-align: center;\r\n}\r\n\r\n.adminBar {\r\n  background-color: #dddddd;\r\n  font-size: 8pt;\r\n  font-family: helvetica, arial;\r\n  color: #000055;\r\n}\r\n\r\n.crumbTrail {\r\n  font-family: helvetica, arial;\r\n  color: #cee700;\r\n  font-size: 8pt;\r\n}\r\n\r\n.crumbTrail A,.crumbTrail A:visited {\r\n  color: #ffffff;\r\n}\r\n\r\n.formDescription {\r\n  font-family: helvetica, arial;\r\n  font-size: 10pt;\r\n  font-weight: bold;\r\n}\r\n\r\n.formSubtext {\r\n  font-family: helvetica, arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.highlight {\r\n  background-color: #cccccc;\r\n}\r\n\r\n.tableMenu {\r\n  background-color: #cee700;\r\n  font-size: 8pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableMenu a {\r\n  text-decoration: none;\r\n}\r\n\r\n.tableHeader {\r\n  background-color: #cee700;\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.tableData {\r\n  font-size: 10pt;\r\n  font-family: Helvetica, Arial;\r\n}\r\n\r\n.pollAnswer {\r\n  font-family: Helvetica, Arial;\r\n  font-size: 8pt;\r\n}\r\n\r\n.pollColor {\r\n  background-color: #cee700;\r\n  border: thin solid #000000;\r\n}\r\n\r\n.pollQuestion {\r\n  font-face: Helvetica, Arial;\r\n  font-weight: bold;\r\n}\r\n\r\n.faqQuestion {\r\n  font-size: 12pt;\r\n  color: #38393C;\r\n  font-weight: bold;\r\n}\r\n\r\n</style>','^AdminBar;\n\n<body text=\"#000000\" link=\"#EF4200\" vlink=\"#EF4200\" bgcolor=\"#535558\" marginwidth=0 marginheight=0 leftmargin=0 rightmargin=0 topmargin=0 bottommargin=0>\r\n\r\n<table cellspacing=0 cellpadding=0 border=0 width=\"100%\">\r\n<tr>\r\n	<td width=\"200\" rowspan=\"2\" bgcolor=\"#000000\"><a href=\"/\"><img src=\"^Extras;styles/plainblack/logo-black.gif\" width=\"200\" height=\"50\" alt=\"Plain Black Software\" border=\"0\"></a></td>\r\n	<td width=\"70%\" bgcolor=\"#38393C\" valign=\"bottom\"><img src=\"^Extras;spacer.gif\" width=\"5\"><img src=\"^Extras;styles/plainblack/user.gif\" width=\"41\" height=\"25\" alt=\"User:\" border=\"0\"> <a href=\"^\\;?op=displayAccount\" style=\"font-family: courier; color: #cee700; text-decoration: none; vertical-align: middle;\">^@;</a></td>\r\n	<td width=\"30%\" align=\"right\" bgcolor=\"#38393C\" valign=\"bottom\"><a href=\"^\\;?op=displayAccount\"><img src=\"^Extras;styles/plainblack/myaccount.gif\" width=\"84\" height=\"25\" alt=\"My Account\" border=\"0\"></a><img src=\"^Extras;styles/plainblack/darkbar.gif\" width=\"11\" height=\"25\" alt=\"|\" border=\"0\"><a href=\"^/;/download\"><img src=\"^Extras;styles/plainblack/download.gif\" width=\"75\" height=\"25\" alt=\"Download\" border=\"0\"></a><img src=\"^Extras;styles/plainblack/darkbar.gif\" width=\"11\" height=\"25\" alt=\"|\" border=\"0\"><a href=\"/\"><img src=\"^Extras;styles/plainblack/home.gif\" width=\"40\" height=\"25\" alt=\"Home\" border=\"0\"></a><img src=\"^Extras;spacer.gif\" width=\"5\"></td>\r\n</tr>\r\n<tr>\r\n	<td width=\"70%\" bgcolor=\"#535558\"><img src=\"^Extras;spacer.gif\" width=\"5\">^C;</td>\r\n	<td width=\"30%\" align=\"right\" bgcolor=\"#535558\" style=\"font-family: courier; color: #cee700;\">^D(\"%c %D, %y\");<img src=\"^Extras;spacer.gif\" width=\"5\"></td>\r\n</tr>\r\n</table>\r\n<table cellspacing=0 cellpadding=0 border=0 width=\"100%\" bgcolor=\"#38393C\">\r\n<tr>\r\n	<td width=\"200\" valign=\"top\" class=\"sideMenu\">^T(2);</td>\r\n	<td width=\"100%\" bgcolor=\"#ffffff\" rowspan=\"2\" valign=\"top\">\n\n^-;\n\n</td>\r\n</tr>\r\n<tr>\r\n	<td width=\"200\" bgcolor=\"#38393C\" align=\"center\" valign=\"bottom\"><p><img src=\"^Extras;styles/plainblack/webgui.gif\" width=\"200\" height=\"84\" alt=\"\" border=\"0\"><p></td>\r\n</tr>\r\n</table>\r\n<table cellspacing=0 cellpadding=0 border=0 width=\"100%\">\r\n<tr>\r\n	<td width=\"50%\" bgcolor=\"#535558\"><img src=\"^Extras;styles/plainblack/copyright.gif\" width=\"223\" height=\"25\" alt=\"Copyright 2001-2002 Plain Black Software\" border=\"0\"></td>\r\n	<td width=\"50%\" align=\"right\" bgcolor=\"#535558\"><a href=\"^r(linkonly);\"><img src=\"^Extras;styles/plainblack/makepageprintable.gif\" width=\"149\" height=\"25\" alt=\"Make Page Printable\" border=\"0\"></a></td>\r\n</tr>\r\n</table>\r\n</body>\r\n');
INSERT INTO style VALUES (5,'Trash','<style>\r\n.adminBar {\r\n        background-color: #dddddd;\r\n        font-size: 8pt;\r\n        font-family: helvetica, arial;\r\n        color: #000055;\r\n}\r\n</style>','^AdminBar;\n\n<body>\r\n<table width=\"100%\">\r\n<tr><td><span style=\"font-size: 36pt;\">Trash</span>\r\n</td>\r\n<td align=\"right\">^H; / ^a; / <a href=\"^\\;?op=purgeTrash\">Empty Trash</a></td></tr>\r\n<tr><td bgcolor=\"#000000\" colspan=\"2\"><img src=\"^Extras;spacer.gif\" height=\"1\"></td></tr>\r\n</table>\r\n<table width=\"100%\"><tr><td valign=\"top\" width=\"30%\"><b>PAGES</b><br>^FlexMenu;</td><td width=\"1\" bgcolor=\"#000000\"><img src=\"^Extras;spacer.gif\" width=\"1\"></td><td valign=\"top\" width=\"70%\"><b>CONTENT</b><br>\n\n^-;\n\n</td></tr></table>\r\n<table width=\"100%\">\r\n<tr><td bgcolor=\"#000000\" colspan=\"2\"><img src=\"^Extras;spacer.gif\" height=\"1\"></td></tr>\r\n</table>\r\n^H; / ^a; / <a href=\"^\\;?op=purgeTrash\">Empty Trash</a>\r\n</body>');
INSERT INTO style VALUES (1,'Packages','<style>\r\n.adminBar {\r\n        background-color: #dddddd;\r\n        font-size: 8pt;\r\n        font-family: helvetica, arial;\r\n        color: #000055;\r\n}\r\n</style>','^AdminBar;\n\n<body>\r\n<table width=\"100%\">\r\n<tr><td><span style=\"font-size: 36pt;\">Packages</span>\r\n</td>\r\n<td align=\"right\">^H; / ^a;</td></tr>\r\n<tr><td bgcolor=\"#000000\" colspan=\"2\"><img src=\"^Extras;spacer.gif\" height=\"1\"></td></tr>\r\n</table>\r\n<table width=\"100%\"><tr><td valign=\"top\" width=\"30%\"><b>PACKAGES</b><br>^FlexMenu;</td><td width=\"1\" bgcolor=\"#000000\"><img src=\"^Extras;spacer.gif\" width=\"1\"></td><td valign=\"top\" width=\"70%\"><b>CONTENT</b><br>\n\n^-;\n\n</td></tr></table>\r\n<table width=\"100%\">\r\n<tr><td bgcolor=\"#000000\" colspan=\"2\"><img src=\"^Extras;spacer.gif\" height=\"1\"></td></tr>\r\n</table>\r\n^H; / ^a;\r\n</body>');
INSERT INTO style VALUES (-6,'WebGUI 4','<META NAME=\"Keywords\" CONTENT=\"WebGUI Content Management System\">\r\n<style>\r\n<!--\r\nbody {font-family: Arial, Helvetica, sans-serif; }\r\na:active {color: #00CCCC; text-decoration: none; background-color: #FFFFCC; }\r\na:visited {color: #003399; text-decoration: none; }\r\na:link {color: #003399; text-decoration: none; }\r\n.myAccountLink {font-weight: bold; }\r\n.verticalMenu, .tableMenu {font-family: \"Times New Roman\", Times, serif; font-style: italic; }\r\n.crumbTrail {color: #990000; font-weight: bold; }\r\nh1 {color: #990000; }\r\nh2 {color: #990000; }\r\nh3 {color: #990000; }\r\nhr {size: 2px; color: #003399;}\r\n\r\n\r\n.highlight {\r\n  background-color: #cccccc;\r\n}\r\n\r\n.tableHeader {\r\n  background-color: #eeeeee;\r\n  font-size: 13px;\r\n}\r\n\r\n.tableData {\r\n  font-size: 13px;\r\n  background-color: #fafafa;\r\n}\r\n\r\n.pollAnswer {\r\n  font-family: Helvetica, Arial;\r\n  font-size: 11px;\r\n}\r\n\r\n.pollColor {\r\n  background-color: #ae2155;\r\n  border: thin solid #000000;\r\n}\r\n\r\n.pollQuestion {\r\n  font-weight: bold;\r\n}\r\n\r\n.faqQuestion {\r\n  font-size: 12pt;\r\n  font-weight: bold;\r\n}\r\n.faqQuestion A {\r\n  text-decoration: none;\r\n  color: black;\r\n}\r\n\r\n-->\r\n</style>','<body bgcolor=\"#FFFFFF\" text=\"#000000\" leftmargin=\"0\" topmargin=\"0\">\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tr><!-- top row -->\r\n<td align=\"left\" valign=\"top\"><a href=\"^H(linkonly);\"><img\r\n\r\n    src=\"^Extras;styles/webgui/webgui4.jpg\"\r\n    width=\"142\"\r\n    height=\"48\"\r\n    alt=\"WebGUI\" border=\"0\"></a></td>\r\n<td valign=\"top\">^AdminBar;</td>\r\n<td align=\"right\">\r\n<a href=\"^r(linkonly);\"><img src=\"^Extras;styles/webgui/print.png\" border=\"0\" alt=\"Print!\"></a>\r\n</td>\r\n</tr><tr>\r\n</tr>\r\n</table>\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tr>\r\n <td colspan=\"2\" height=\"1\"\r\n     background=\"^Extras;styles/webgui/purplepixel.jpg\">\r\n </td>\r\n</tr>\r\n<tr><!-- row for username and crumbtrail -->\r\n <td width=\"120\"\r\n     height=\"20\"\r\n     align=\"left\"\r\n     valign=\"middle\"><table border=\"0\"><tr><td><strong>User:</strong>\r\n     ^a(^@;);</td></tr></table></td>\r\n <td align=\"left\"\r\n     valign=\"middle\"><strong>Location:</strong> ^C;</td>\r\n</tr>\r\n<tr>\r\n <td colspan=\"2\" height=\"1\"\r\n     background=\"^Extras;styles/webgui/purplepixel.jpg\">\r\n </td>\r\n</tr>\r\n</table>\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" height=\"50%\" cellpadding=\"0\" align=\"center\">\r\n<tr><!-- row for verticalmenu and content -->\r\n <td width=\"120\"\r\n     align=\"left\"\r\n     valign=\"top\">\r\n   <!-- extra table -->\r\n   <table border=\"0\">\r\n   <tr><td>^FlexMenu;</td></tr>\r\n   <tr><td height=\"30\"></td></tr>\r\n   </table>\r\n   <!-- /extra table -->\r\n </td>\r\n <td align=\"left\"\r\n     valign=\"top\">\r\n\r\n\r\n^-;\r\n\r\n\r\n\r\n<p>\r\n</td>\r\n</tr>\r\n<tr>\r\n <td colspan=\"2\" height=\"1\"\r\n     background=\"^Extras;styles/webgui/purplepixel.jpg\">\r\n </td>\r\n</tr>\r\n<tr><!-- row for date, printable and WebGUI link -->\r\n <td height=\"20\"\r\n     align=\"center\">^D(\"%c %D %y\");</td><td align=\"center\">Powered by <a href=\"http://www.plainblack.com/webgui\">WebGUI</a></td>\r\n</tr>\r\n</table>\r\n</body>\r\n\r\n');
INSERT INTO style VALUES (-7,'Smooth Blues','<style>\r\n.pageBorder {\r\n	background-color: #FFFFFF;\r\n	border: 10px #98AAB1 solid\r\n}\r\n.myBorder {\r\n	border: #000000;\r\n	border-type: solid;\r\n	border-width: 1px 1px 1px 1px\r\n}\r\n.homeLink, .myAccountLink, {\r\n	color: #ffffff;\r\n	font-size: 8pt;\r\n}\r\n.verticalMenu A, .verticalMenu A:visited {\r\n	color: #0055AA;\r\n	font-weight: bold;\r\n}\r\n.verticalMenu A:hover {\r\n	color: #CC7744;\r\n	font-weight: bold;\r\n}\r\nbody {\r\n	font-family:arial, helvetica;\r\n	font-size: 12px;\r\n	color: #004499;\r\n	background: #E5E5E5;\r\n}\r\ntd { \r\n	font-size: 14px;\r\n}\r\nH1 {\r\n	MARGIN-TOP: 3px;\r\n	MARGIN-BOTTOM: 3px;\r\n	font-size: 14pt;\r\n}\r\nH3 {\r\n	MARGIN-TOP: 3px;\r\n	MARGIN-BOTTOM: 3px;\r\n}\r\nH4 {\r\n	MARGIN-TOP: 3px;\r\n	MARGIN-BOTTOM: 3px;\r\n}\r\nH5 {\r\n	MARGIN-TOP: 3px;\r\n	MARGIN-BOTTOM: 3px;\r\n}\r\nul { \r\n	MARGIN-TOP: 3px;\r\n	MARGIN-BOTTOM: 3px;\r\n}\r\nA {\r\n	color: #0077CC;\r\n	TEXT-DECORATION: none;\r\n}\r\nA:hover {\r\n	color: #997722;\r\n	TEXT-DECORATION: none;\r\n}\r\n.pagination {\r\n	font-family: helvetica, arial;\r\n	text-align: center;\r\n	font-size: 8pt;\r\n}\r\n.horizontalMenu {\r\n	font-size: 8pt;\r\n	padding: 5px;\r\n	font-weight: bold;\r\n	color: #0055AA;\r\n}\r\n.horizontalMenu A, .horizontalMenu A:visited {\r\n	color: #0055AA;\r\n}\r\n.adminBar {\r\n	background-color: #cccccc;\r\n	font-size: 8pt;\r\n	font-family: helvetica, arial;\r\n	color: #000022;\r\n}\r\n.highlight {\r\n	background-color: #EAEAEA;\r\n}\r\n.formDescription {\r\n	font-size: 10pt;\r\n}\r\n.formSubtext {\r\n	font-size: 8pt;\r\n}\r\n.tableMenu {\r\n	font-size: 8pt;\r\n	background-color: #d1dfe8;\r\n}\r\n.tableMenu a {\r\n	text-decoration: none;\r\n}\r\n.tableHeader {\r\n	background-color: #d1dfe8;\r\n	font-size: 10pt;\r\n}\r\n.tableData {\r\n	font-size: 10pt;\r\n	font-family: Helvetica, Arial;\r\n}\r\n.pollAnswer {\r\n	font-family: Helvetica, Arial;\r\n	font-size: 8pt;\r\n}\r\n.pollColor {\r\n	background-color: #00ddbb;\r\n}\r\n.pollQuestion {\r\n	font-face: Helvetica, Arial;\r\n	font-weight: bold;\r\n}\r\n.faqQuestion {\r\n	color: #000000;\r\n	font-weight: bold;\r\n	text-decoration: none;\r\n}\r\n</style>\r\n','^AdminBar;\r\n\r\n<script LANGUAGE=\"JavaScript\" type=\"text/javascript\">\r\n<!--\r\n    buttonOff = new Image;\r\n    buttonOff.src = \"^Extras;styles/smoothblues/button_off.gif\";\r\n    buttonOn = new Image;\r\n    buttonOn.src = \"^Extras;/styles/smoothblues/button_on.gif\";\r\nfunction on(imgName) {\r\n  document [imgName].src = eval(\"buttonOn.src\");\r\n  }\r\n function off(imgName) {\r\n  document [imgName].src = eval(\"buttonOff.src\");\r\n  }\r\n//-->\r\n</script>\r\n\r\n<body>\r\n\r\n<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"2\">\r\n\r\n<tr><td style=\"background-color: #FFFFFF; border: 1px #98AAB1 solid\">\r\n\r\n<table border=\"0\" width=\"100%\" background=\"^Extras;styles/smoothblues/top_gradient.gif\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"background-repeat: repeat-x\" >\r\n<tr><td height=\"2\"></td></tr>\r\n<tr>   \r\n    <td><img src=\"^Extras;styles/smoothblues/mainlogo.gif\" border=0></td>\r\n    <td width=\"100%\" valign=\"center\">\r\n   <table width=\"100%\">\r\n     <tr><td height=\"24\"></td></tr>\r\n     <tr align=\"center\">\r\n    <td width=\"34%\" valign=\"center\">\r\n      <a href=\"^H(linkonly);\" onMouseOver=\"on(\'button\')\" onMouseOut=\"off(\'button\')\">  \r\n     <img name=\"button\" src=\"^Extras;styles/smoothblues/button_off.gif\" border=0>\r\n     <BR>Home\r\n      </a>\r\n     </td>\r\n     <td width=\"33%\" valign=\"center\">\r\n      <a href=\"^r(linkonly);\" onMouseOver=\"on(\'button2\')\" onMouseOut=\"off(\'button2\')\">  \r\n      <img name=\"button2\" src=\"^Extras;styles/smoothblues/button_off.gif\" border=0> \r\n     <BR>Print!\r\n      </a>\r\n     </td>\r\n     <td width=\"33%\" valign=\"center\">\r\n      <a href=\"^a(linkonly);\" onMouseOver=\"on(\'button3\')\" onMouseOut=\"off(\'button3\')\">   \r\n      <img name=\"button3\" src=\"^Extras;styles/smoothblues/button_off.gif\" border=0>\r\n      <BR>My Account\r\n      </a>\r\n     </td>\r\n     </tr>\r\n    </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n\r\n<table border=\"0\" width=\"100%\"  height=\"21\" cellspacing=\"0\" cellpadding=\"3\" bgcolor=\"#ffffff\" align=\"center\">\r\n  <tr>\r\n    <td width=\"60%\" align=\"left\">^C;</td>\r\n    <td width=\"40%\" align=\"right\">^?;</td>\r\n  </tr>\r\n</table>\r\n\r\n<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=center>\r\n  <tr>\r\n    <td width=\"1%\"></td>\r\n    <td style=\"border: #a1bfc8 solid; border-width: 1px 1px 1px 1px\" bgcolor=\"#dae1e9\" width=\"140\" valign=\"top\">\r\n     <table width=\"100%\" background=\"^Extras;styles/smoothblues/header_gradient.gif\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"background-repeat: repeat-x; border: #ffffff; border-style: solid; border-width: 1px 1px 1px 1px\" >\r\n     <tr><td>\r\n      <h3 align=\"center\" style=\"color:#002266\">Site Navigation</h3>\r\n     </td></tr></table>\r\n    <img src=\"^Extras;spacer.gif\" height=\"20\" width=\"140\" border=0>\r\n    <table cellpadding=4>\r\n     <tr><td> ^T(0); </td></tr>\r\n     <tr height=\"300\"><td> ^L; </td></tr>\r\n    </table>\r\n    </td>\r\n\r\n    <td width=\"100%\" align=\"right\" height=\"100%\" valign=\"top\">\r\n\r\n    <table width=\"99%\" height=\"99%\" border=\"0\" bgcolor=\"white\" cellpadding=\"3\" cellspacing=\"1\">\r\n\r\n    	<tr><td bgcolor=\"#FFFFFF\" height=\"100%\" valign=\"top\">\r\n    	\r\n\r\n^-;\r\n\r\n\r\n	</td></tr>\r\n    </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\r\n<tr><td align=\"right\" style=\"color:#0055AA\"><BR><BR><a href=\"http://www.openserve.org\" target=\"_blank\">This Design �2002 OpenServe</a></td></tr>\r\n</table>\r\n\r\n</td></tr></table>\r\n\r\n</body>');

--
-- Table structure for table 'template'
--

CREATE TABLE template (
  templateId int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  template text,
  namespace varchar(35) NOT NULL default 'Page',
  PRIMARY KEY  (templateId,namespace)
) TYPE=MyISAM;

--
-- Dumping data for table 'template'
--


INSERT INTO template VALUES (5,'Left Column','<table cellpadding=\"3\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" width=\"34%\"><tmpl_var template.position1></td>\r\n  <td valign=\"top\" class=\"content\" width=\"66%\"><tmpl_var template.position2></td>\r\n</tr>\r\n</table>','Page');
INSERT INTO template VALUES (4,'Three Over One','<table cellpadding=\"3\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" width=\"33%\"><tmpl_var template.position1></td>\r\n  <td valign=\"top\" class=\"content\" width=\"34%\"><tmpl_var template.position2></td>\r\n  <td valign=\"top\" class=\"content\" width=\"33%\"><tmpl_var template.position3></td>\r\n</tr>\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" colspan=\"3\"><tmpl_var template.position4></td>\r\n</tr>\r\n</table>','Page');
INSERT INTO template VALUES (3,'One Over Three','<table cellpadding=\"3\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" colspan=\"3\"><tmpl_var template.position1></td>\r\n</tr>\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" width=\"33%\"><tmpl_var template.position2></td>\r\n  <td valign=\"top\" class=\"content\" width=\"34%\"><tmpl_var template.position3></td>\r\n  <td valign=\"top\" class=\"content\" width=\"33%\"><tmpl_var template.position4></td>\r\n</tr>\r\n</table>','Page');
INSERT INTO template VALUES (1,'Default Page','<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n<td valign=\"top\" class=\"content\"><tmpl_var template.position1></td>\r\n</tr>\r\n</table>\r\n','Page');
INSERT INTO template VALUES (2,'News','<table cellpadding=\"3\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" colspan=\"2\" width=\"100%\"><tmpl_var template.position1></td></tr>\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" width=\"50%\"><tmpl_var template.position2></td>\r\n  <td valign=\"top\" class=\"content\" width=\"50%\"><tmpl_var template.position3></td>\r\n</tr>\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" colspan=\"2\" width=\"100%\"><tmpl_var template.position4></td>\r\n</tr>\r\n</table>\r\n','Page');
INSERT INTO template VALUES (6,'Right Column','<table cellpadding=\"3\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" width=\"66%\"><tmpl_var template.position1></td>\r\n  <td valign=\"top\" class=\"content\" width=\"34%\"><tmpl_var template.position2></td>\r\n</tr>\r\n</table>\r\n','Page');
INSERT INTO template VALUES (7,'Side By Side','<table cellpadding=\"3\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"content\" width=\"50%\"><tmpl_var template.position1></td>\r\n  <td valign=\"top\" class=\"content\" width=\"50%\"><tmpl_var template.position2></td>\r\n</tr>\r\n</table>\r\n','Page');
INSERT INTO template VALUES (1,'Default Product','<style>\r\n.productFeatureHeader,.productSpecificationHeader,.productRelatedHeader,.productAccessoryHeader, .productBenefitHeader  {\r\n    font-weight: bold;\r\n    font-size: 15px;\r\n}\r\n.productFeature,.productSpecification,.productRelated,.productAccessory, .productBenefit {\r\n    font-size: 12px;\r\n}\r\n.productAttributeSeperator {\r\n    background-color: black;\r\n}\r\n</style>\r\n\r\n<table width=\"100%\" cellpadding=\"3\" cellspacing=\"0\" border=\"0\">\r\n<tr>\r\n  <td class=\"content\" valign=\"top\">\r\n\r\n<tmpl_if description>\r\n   <tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n<tmpl_if price>\r\n    <b>Price:</b> <tmpl_var price><br>\r\n</tmpl_if>\r\n\r\n<tmpl_if productnumber>\r\n    <b>Product Number:</b> <tmpl_var productNumber><br>\r\n</tmpl_if>\r\n\r\n<br>\r\n\r\n<tmpl_if brochure.url>\r\n    <a href=\"<tmpl_var brochure.url>\"><img src=\"<tmpl_var brochure.icon>\" border=0 align=\"absmiddle\"><tmpl_var brochure.label></a><br>\r\n</tmpl_if>\r\n\r\n<tmpl_if manual.url>\r\n    <a href=\"<tmpl_var manual.url>\"><img src=\"<tmpl_var manual.icon>\" border=0 align=\"absmiddle\"><tmpl_var manual.label></a><br>\r\n</tmpl_if>\r\n\r\n<tmpl_if warranty.url>\r\n    <a href=\"<tmpl_var warranty.url>\"><img src=\"<tmpl_var warranty.icon>\" border=0 align=\"absmiddle\"><tmpl_var warranty.label></a><br>\r\n</tmpl_if>\r\n\r\n  </td>\r\n\r\n<td valign=\"top\">\r\n<tmpl_if thumbnail1>\r\n    <a href=\"<tmpl_var image1>\"><img src=\"<tmpl_var thumbnail1>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n<tmpl_if thumbnail2>\r\n    <a href=\"<tmpl_var image2>\"><img src=\"<tmpl_var thumbnail2>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n<tmpl_if thumbnail3>\r\n    <a href=\"<tmpl_var image3>\"><img src=\"<tmpl_var thumbnail3>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n  </td>\r\n</tr>\r\n</table>\r\n\r\n\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\">\r\n<tr>\r\n<td valign=\"top\" class=\"productFeature\"><div class=\"productFeatureHeader\">Features</div>\r\n<tmpl_if addFeature>\r\n  <tmpl_var addFeature><p>\r\n</tmpl_if>\r\n<tmpl_loop feature_loop>\r\n  �<tmpl_var feature.controls><tmpl_var feature.feature><br>\r\n</tmpl_loop>\r\n<p/>\r\n</td>\r\n\r\n  <td class=\"productAttributeSeperator\"><img src=\"^Extras;spacer.gif\" width=\"1\" height=\"1\"></td>\r\n\r\n  <td valign=\"top\" class=\"productBenefit\"><div class=\"productBenefitHeader\">Benefits</div>\r\n<tmpl_if addBenefit>\r\n  <tmpl_var addbenefit><p>\r\n</tmpl_if>\r\n<tmpl_loop benefit_loop>\r\n  �<tmpl_var benefit.controls><tmpl_var benefit.benefit><br>\r\n</tmpl_loop>\r\n<p/></td>\r\n\r\n  <td class=\"productAttributeSeperator\"><img src=\"^Extras;spacer.gif\" width=\"1\" height=\"1\"></td>\r\n\r\n  <td valign=\"top\" class=\"productSpecification\"><div class=\"productSpecificationHeader\">Specifications</div>\r\n<tmpl_if addspecification>\r\n  <tmpl_var addspecification><p>\r\n</tmpl_if>\r\n<tmpl_loop specification_loop>\r\n  �<tmpl_var specification.controls><b><tmpl_var specification.label>:</b> <tmpl_var specification.specification> <tmpl_var specification.units><br>\r\n</tmpl_loop>\r\n<p/></td>\r\n\r\n  <td class=\"productAttributeSeperator\"><img src=\"^Extras;spacer.gif\" width=\"1\" height=\"1\"></td>\r\n\r\n  <td valign=\"top\" class=\"productAccessory\"><div class=\"productAccessoryHeader\">Accessories</div>\r\n<tmpl_if addAccessory>\r\n  <tmpl_var addAccessory><p>\r\n</tmpl_if>\r\n<tmpl_loop accessory_loop>\r\n  �<tmpl_var accessory.controls><a href=\"<tmpl_var accessory.url>\"><tmpl_var accessory.title></a><br>\r\n</tmpl_loop>\r\n<p/></td>\r\n\r\n  <td class=\"productAttributeSeperator\"><img src=\"^Extras;spacer.gif\" width=\"1\" height=\"1\"></td>\r\n\r\n  <td valign=\"top\" class=\"productRelated\"><div class=\"productRelatedHeader\">Related Products</div>\r\n<tmpl_if addRelatedProduct>\r\n  <tmpl_var addRelatedProduct><p>\r\n</tmpl_if>\r\n<tmpl_loop relatedproduct_loop>\r\n  �<tmpl_var relatedproduct.controls><a href=\"<tmpl_var relatedproduct.url>\"><tmpl_var relatedproduct.title></a><br>\r\n</tmpl_loop>\r\n</td>\r\n\r\n</tr>\r\n</table>\r\n\r\n','Product');
INSERT INTO template VALUES (2,'Benefits Showcase','<style>\r\n.productOptions {\r\n  font-family: Helvetica, Arial, sans-serif;\r\n  font-size: 11px;\r\n}\r\n</style>\r\n\r\n<tmpl_if image1>\r\n    <img src=\"<tmpl_var image1>\" border=\"0\" /><p>\r\n</tmpl_if>\r\n<table width=\"100%\" cellpadding=\"3\" cellspacing=\"0\" border=\"0\">\r\n<tr>\r\n  <td class=\"content\" valign=\"top\" width=\"66%\"><tmpl_if description>\r\n<tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n  <b>Benefits</b><br>\r\n<tmpl_if addBenefit>\r\n  <tmpl_var addbenefit><p>\r\n</tmpl_if>\r\n<tmpl_loop benefit_loop>\r\n  �<tmpl_var benefit.controls><tmpl_var benefit.benefit><br>\r\n</tmpl_loop>\r\n\r\n  </td>\r\n  <td valign=\"top\" width=\"34%\" class=\"productOptions\">\r\n\r\n<tmpl_if thumbnail2>\r\n    <a href=\"<tmpl_var image2>\"><img src=\"<tmpl_var thumbnail2>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n\r\n<b>Specifications</b><br>\r\n<tmpl_if addspecification>\r\n  <tmpl_var addspecification><p>\r\n</tmpl_if>\r\n<tmpl_loop specification_loop>\r\n  �<tmpl_var specification.controls><b><tmpl_var specification.label>:</b> <tmpl_var specification.specification> <tmpl_var specification.units><br>\r\n</tmpl_loop>\r\n\r\n<b>Options</b><br>\r\n<tmpl_if addAccessory>\r\n  <tmpl_var addAccessory><p>\r\n</tmpl_if>\r\n<tmpl_loop accessory_loop>\r\n  �<tmpl_var accessory.controls><a href=\"<tmpl_var accessory.url>\"><tmpl_var accessory.title></a><br>\r\n</tmpl_loop>\r\n\r\n<b>Other Products</b><br>\r\n<tmpl_if addRelatedProduct>\r\n  <tmpl_var addRelatedProduct><p>\r\n</tmpl_if>\r\n<tmpl_loop relatedproduct_loop>\r\n  �<tmpl_var relatedproduct.controls><a href=\"<tmpl_var relatedproduct.url>\"><tmpl_var relatedproduct.title></a><br>\r\n</tmpl_loop>\r\n\r\n  </td>\r\n</tr>\r\n</table>\r\n\r\n','Product');
INSERT INTO template VALUES (3,'Three Columns','<style>\r\n.productFeatureHeader,.productSpecificationHeader,.productRelatedHeader,.productAccessoryHeader, .productBenefitHeader  {\r\n   font-weight: bold;\r\n   font-size: 15px;\r\n}\r\n.productFeature,.productSpecification,.productRelated,.productAccessory, .productBenefit {\r\n   font-size: 12px;\r\n}\r\n\r\n</style>\r\n\r\n\r\n<tmpl_if description>\r\n<tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n<table width=\"100%\" cellpadding=\"3\" cellspacing=\"0\" border=\"0\">\r\n<tr>\r\n  <td align=\"center\">\r\n<tmpl_if thumbnail1>\r\n    <a href=\"<tmpl_var image1>\"><img src=\"<tmpl_var thumbnail1>\" border=\"0\" /></a>\r\n</tmpl_if>\r\n</td>\r\n   <td align=\"center\">\r\n<tmpl_if thumbnail2>\r\n    <a href=\"<tmpl_var image2>\"><img src=\"<tmpl_var thumbnail2>\" border=\"0\" /></a>\r\n</tmpl_if>\r\n</td>\r\n  <td align=\"center\">\r\n<tmpl_if thumbnail3>\r\n    <a href=\"<tmpl_var image3>\"><img src=\"<tmpl_var thumbnail3>\" border=\"0\" /></a>\r\n</tmpl_if>\r\n</td>\r\n</tr>\r\n</table>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"5\" width=\"100%\">\r\n<tr>\r\n  <td valign=\"top\" class=\"tableData\" width=\"35%\">\r\n\r\n<b>Features</b><br>\r\n<tmpl_if addFeature>\r\n  <tmpl_var addFeature><p>\r\n</tmpl_if>\r\n<tmpl_loop feature_loop>\r\n  �<tmpl_var feature.controls><tmpl_var feature.feature><br>\r\n</tmpl_loop>\r\n<p/>\r\n\r\n<b>Benefits</b><br>\r\n<tmpl_if addBenefit>\r\n  <tmpl_var addbenefit><p>\r\n</tmpl_if>\r\n<tmpl_loop benefit_loop>\r\n  �<tmpl_var benefit.controls><tmpl_var benefit.benefit><br>\r\n</tmpl_loop>\r\n<p/>\r\n\r\n</td>\r\n  <td valign=\"top\" class=\"tableData\" width=\"35%\">\r\n\r\n<b>Specifications</b><br>\r\n<tmpl_if addspecification>\r\n  <tmpl_var addspecification><p>\r\n</tmpl_if>\r\n<tmpl_loop specification_loop>\r\n  �<tmpl_var specification.controls><b><tmpl_var specification.label>:</b> <tmpl_var specification.specification> <tmpl_var specification.units><br>\r\n</tmpl_loop>\r\n<p/>\r\n\r\n<b>Accessories</b><br>\r\n<tmpl_if addAccessory>\r\n  <tmpl_var addAccessory><p>\r\n</tmpl_if>\r\n<tmpl_loop accessory_loop>\r\n  �<tmpl_var accessory.controls><a href=\"<tmpl_var accessory.url>\"><tmpl_var accessory.title></a><br>\r\n</tmpl_loop>\r\n<p/>\r\n\r\n<b>Related Products</b><br>\r\n<tmpl_if addRelatedProduct>\r\n  <tmpl_var addRelatedProduct><p>\r\n</tmpl_if>\r\n<tmpl_loop relatedproduct_loop>\r\n   �<tmpl_var relatedproduct.controls><a href=\"<tmpl_var relatedproduct.url>\"><tmpl_var relatedproduct.title></a><br>\r\n</tmpl_loop>\r\n<p/>\r\n</td>\r\n  <td class=\"tableData\" valign=\"top\" width=\"30%\">\r\n    <tmpl_if price> \r\n    <b>Price:</b> <tmpl_var price><br>\r\n</tmpl_if>\r\n\r\n<tmpl_if productnumber>\r\n    <b>Product Number:</b> <tmpl_var productNumber><br>\r\n</tmpl_if>\r\n<br>\r\n<tmpl_if brochure.url>\r\n    <a href=\"<tmpl_var brochure.url>\"><img src=\"<tmpl_var brochure.icon>\" border=0 align=\"absmiddle\"><tmpl_var brochure.label></a><br>\r\n</tmpl_if>\r\n<tmpl_if manual.url>\r\n    <a href=\"<tmpl_var manual.url>\"><img src=\"<tmpl_var manual.icon>\" border=0 align=\"absmiddle\"><tmpl_var manual.label></a><br>\r\n</tmpl_if>\r\n<tmpl_if warranty.url>\r\n    <a href=\"<tmpl_var warranty.url>\"><img src=\"<tmpl_var warranty.icon>\" border=0 align=\"absmiddle\"><tmpl_var warranty.label></a><br>\r\n</tmpl_if>\r\n  </td>\r\n</tr>\r\n</table>\r\n\r\n\r\n','Product');
INSERT INTO template VALUES (4,'Left Column Collateral','<style>\r\n.productCollateral {\r\n   font-size: 11px;\r\n}\r\n</style>\r\n\r\n\r\n<table width=\"100%\">\r\n<tr><td valign=\"top\" class=\"productCollateral\" width=\"100\">\r\n<img src=\"^Extras;spacer.gif\" width=\"100\" height=\"1\"><br>\r\n<tmpl_if brochure.url>\r\n    <a href=\"<tmpl_var brochure.url>\"><img src=\"<tmpl_var brochure.icon>\" border=0 align=\"absmiddle\"><tmpl_var brochure.label></a><br>\r\n</tmpl_if>\r\n<tmpl_if manual.url>\r\n    <a href=\"<tmpl_var manual.url>\"><img src=\"<tmpl_var manual.icon>\" border=0 align=\"absmiddle\"><tmpl_var manual.label></a><br>\r\n</tmpl_if>\r\n<tmpl_if warranty.url>\r\n    <a href=\"<tmpl_var warranty.url>\"><img src=\"<tmpl_var warranty.icon>\" border=0 align=\"absmiddle\"><tmpl_var warranty.label></a><br>\r\n</tmpl_if>\r\n<br>\r\n<div align=\"center\">\r\n<tmpl_if thumbnail1>\r\n    <a href=\"<tmpl_var image1>\"><img src=\"<tmpl_var thumbnail1>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n<tmpl_if thumbnail2>\r\n    <a href=\"<tmpl_var image2>\"><img src=\"<tmpl_var thumbnail2>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n<tmpl_if thumbnail3>\r\n    <a href=\"<tmpl_var image3>\"><img src=\"<tmpl_var thumbnail3>\" border=\"0\" /></a><p>\r\n</tmpl_if>\r\n</div>\r\n</td><td valign=\"top\" class=\"content\" width=\"100%\">\r\n<tmpl_if description>\r\n<tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n<b>Specs:</b><br>\r\n<tmpl_if addspecification>\r\n  <tmpl_var addspecification><p>\r\n</tmpl_if>\r\n<tmpl_loop specification_loop>\r\n  �<tmpl_var specification.controls><b><tmpl_var specification.label>:</b> <tmpl_var specification.specification> <tmpl_var specification.units><br>\r\n</tmpl_loop>\r\n<p>\r\n\r\n<b>Features:</b><br>\r\n<tmpl_if addFeature>\r\n  <tmpl_var addFeature><p>\r\n</tmpl_if>\r\n<tmpl_loop feature_loop>\r\n  �<tmpl_var feature.controls><tmpl_var feature.feature><br>\r\n</tmpl_loop>\r\n<p>\r\n\r\n<b>Options:</b><br>\r\n<tmpl_if addAccessory>\r\n  <tmpl_var addAccessory><p>\r\n</tmpl_if>\r\n<tmpl_loop accessory_loop>\r\n  �<tmpl_var accessory.controls><a href=\"<tmpl_var accessory.url>\"><tmpl_var accessory.title></a><br>\r\n</tmpl_loop>\r\n\r\n</td></tr>\r\n</table>\r\n','Product');
INSERT INTO template VALUES (1,'Default FAQ','<a name=\"top\"></a>\r\n\r\n<tmpl_if description>\r\n<tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n<tmpl_var addquestion><p>\r\n\r\n<ul>\r\n<tmpl_loop qa_loop>\r\n<li><a href=\"#<tmpl_var qa.id>\"><span class=\"faqQuestion\"><tmpl_var qa.question></span></a>\r\n</tmpl_loop>\r\n</ul>\r\n<p>\r\n\r\n\r\n<tmpl_loop qa_loop>\r\n  <tmpl_var qa.controls><a name=\"<tmpl_var qa.id>\"><span class=\"faqQuestion\"><tmpl_var qa.question></span></a><br>\r\n  <tmpl_var qa.answer>\r\n  <p/><a href=\"#top\">[top]</a><p/>\r\n</tmpl_loop>\r\n\r\n','FAQ');
INSERT INTO template VALUES (2,'Q and A','<tmpl_if description>\r\n<tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n<tmpl_var addquestion><p>\r\n\r\n<tmpl_loop qa_loop>\r\n<tmpl_var qa.controls><b>Q: <tmpl_var qa.question></b><br>\r\nA: <tmpl_var qa.answer>\r\n<p/>\r\n</tmpl_loop>\r\n\r\n','FAQ');
INSERT INTO template VALUES (3,'Topics','<tmpl_if description>\r\n<tmpl_var description><p>\r\n</tmpl_if>\r\n\r\n<tmpl_var addquestion><p>\r\n\r\n<tmpl_loop qa_loop>\r\n<tmpl_var qa.controls>\r\n<h2><tmpl_var qa.question></h2>\r\n<tmpl_var qa.answer>\r\n<p/>\r\n</tmpl_loop>\r\n\r\n','FAQ');
INSERT INTO template VALUES (1,'Default Item','<tmpl_if displaytitle>\r\n   <tmpl_if linkurl>\r\n       <a href=\"<tmpl_var linkurl>\">\r\n    </tmpl_if>\r\n     <span class=\"itemTitle\"><tmpl_var title></span>\r\n   <tmpl_if linkurl>\r\n      </a>\r\n    </tmpl_if>\r\n</tmpl_if>\r\n\r\n<tmpl_if attachment>\r\n   <tmpl_if displaytitle> - </tmpl_if>\r\n   <a href=\"<tmpl_var attachmenturl>\"><img src=\"<tmpl_var attachmentIcon>\" border=0 alt=\"<tmpl_var attachment>\" width=16 height=16 border=0 align=\"middle\"></a>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  - <tmpl_var description>\r\n</tmpl_if>','Item');
INSERT INTO template VALUES (1,'Default USS','<tmpl_var searchForm>\r\n\r\n<table width=\"100%\" cellpadding=2 cellspacing=1 border=0><tr>\r\n<td align=\"right\" class=\"tableMenu\">\r\n\r\n<tmpl_if post>\r\n   <tmpl_var post> &middot;\r\n</tmpl_if>\r\n\r\n<tmpl_var search>\r\n\r\n</td></tr></table>\r\n\r\n<table width=\"100%\" cellspacing=1 cellpadding=2 border=0>\r\n<tr>\r\n<td class=\"tableHeader\"><tmpl_var label.title></td>\r\n<td class=\"tableHeader\"><tmpl_var label.date></td>\r\n<td class=\"tableHeader\"><tmpl_var label.by></td>\r\n</tr>\r\n\r\n<tmpl_loop submissions_loop>\r\n\r\n<tr>\r\n<td class=\"tableData\">\r\n     <a href=\"<tmpl_var submission.URL>\">  <tmpl_var submission.title>\r\n    <tmpl_if submission.currentUser>\r\n        (<tmpl_var submission.status>)\r\n     </tmpl_if>\r\n</td>\r\n<td class=\"tableData\"><tmpl_var submission.date></td>\r\n<td class=\"tableData\"><a href=\"<tmpl_var submission.userProfile>\"><tmpl_var submission.username></a></td>\r\n</tr>\r\n\r\n</tmpl_loop>\r\n\r\n</table>\r\n\r\n<tmpl_if multiplePages>\r\n  <div class=\"pagination\">\r\n    <tmpl_var previousPage>  &middot; <tmpl_var pageList> &middot; <tmpl_var nextPage>\r\n  </div>\r\n</tmpl_if>\r\n','USS');
INSERT INTO template VALUES (1,'Default Submission','<h1><tmpl_var title></h1>\r\n<table width=\"100%\" cellpadding=2 cellspacing=1 border=0>\r\n<tr><td valign=\"top\" class=\"tableHeader\" width=\"100%\">\r\n<b><tmpl_var label.by>:</b> <a href=\"<tmpl_var userProfile>\"><tmpl_var username></a><br>\r\n<b><tmpl_var label.date>:</b> <tmpl_var date><br>\r\n<b><tmpl_var label.status>:</b> <tmpl_var status><br>\r\n<b><tmpl_var label.views>:</b> <tmpl_var views><br>\r\n</td>\r\n<td rowspan=\"2\" class=\"tableMenu\" nowrap=\"1\" valign=\"top\">\r\n\r\n<tmpl_if previousSubmission>\r\n   <tmpl_var previousSubmission><br>\r\n</tmpl_if>\r\n<tmpl_if nextSubmission>\r\n   <tmpl_var nextSubmission><br>\r\n</tmpl_if>\r\n<tmpl_if deleteSubmission>\r\n   <tmpl_var deleteSubmission><br>\r\n</tmpl_if>\r\n<tmpl_if editSubmission>\r\n   <tmpl_var editSubmission><br>\r\n</tmpl_if>\r\n<tmpl_if approveSubmission>\r\n   <tmpl_var approveSubmission><br>\r\n</tmpl_if>\r\n<tmpl_if leaveSubmission>\r\n   <tmpl_var leaveSubmission><br>\r\n</tmpl_if>\r\n<tmpl_if denySubmission>\r\n   <tmpl_var denySubmission><br>\r\n</tmpl_if>\r\n<tmpl_if postReply>\r\n   <tmpl_var postReply><br>\r\n</tmpl_if>\r\n<tmpl_var search><br>\r\n<tmpl_var backToList><br>\r\n\r\n</td</tr><tr><td class=\"tableData\">\r\n<tmpl_if image>\r\n  <img src=\"<tmpl_var image>\" border=\"0\"><p/>\r\n</tmpl_if>\r\n<tmpl_var content><p/>\r\n<tmpl_var attachment><br>\r\n\r\n</td></tr></table>','USS/Submission');
INSERT INTO template VALUES (2,'Traditional with Thumbnails','<tmpl_var searchForm>\r\n\r\n\r\n<table width=\"100%\" cellpadding=2 cellspacing=1 border=0><tr>\r\n<td align=\"right\" class=\"tableMenu\">\r\n\r\n<tmpl_if post>\r\n   <tmpl_var post> &middot;\r\n</tmpl_if>\r\n\r\n<tmpl_var search>\r\n\r\n</td></tr></table>\r\n\r\n<table width=\"100%\" cellspacing=1 cellpadding=2 border=0>\r\n<tr>\r\n<td class=\"tableHeader\"><tmpl_var label.title></td>\r\n<td class=\"tableHeader\"><tmpl_var label.thumbnail></td>\r\n<td class=\"tableHeader\"><tmpl_var label.date></td>\r\n<td class=\"tableHeader\"><tmpl_var label.by></td>\r\n</tr>\r\n\r\n<tmpl_loop submissions_loop>\r\n\r\n<tr>\r\n<td class=\"tableData\">\r\n     <a href=\"<tmpl_var submission.URL>\">  <tmpl_var submission.title>\r\n    <tmpl_if submission.currentUser>\r\n        (<tmpl_var submission.status>)\r\n     </tmpl_if>\r\n</td>\r\n   <td class=\"tableData\">\r\n      <tmpl_if submission.thumbnail>\r\n             <a href=\"<tmpl_var submission.url>\"><img src=\"<tmpl_var submission.thumbnail>\" border=\"0\"></a>\r\n      </tmpl_if>\r\n  </td>\r\n\r\n<td class=\"tableData\"><tmpl_var submission.date></td>\r\n<td class=\"tableData\"><a href=\"<tmpl_var submission.userProfile>\"><tmpl_var submission.username></a></td>\r\n</tr>\r\n\r\n</tmpl_loop>\r\n\r\n</table>\r\n\r\n<tmpl_if multiplePages>\r\n  <div class=\"pagination\">\r\n    <tmpl_var previousPage>  &middot; <tmpl_var pageList> &middot; <tmpl_var nextPage>\r\n  </div>\r\n</tmpl_if>\r\n\r\n','USS');
INSERT INTO template VALUES (3,'Weblog','<tmpl_var searchForm>\r\n\r\n<tmpl_if description>\r\n   <tmpl_var description><p/>\r\n</tmpl_if>\r\n\r\n<tmpl_if post>\r\n   <tmpl_var post> &middot;\r\n</tmpl_if>\r\n\r\n<tmpl_var search>\r\n<p/>\r\n<table width=\"100%\" cellpadding=2 cellspacing=1 border=0>\r\n\r\n<tmpl_loop submissions_loop>\r\n\r\n<tr><td class=\"tableHeader\"><tmpl_var submission.title>\r\n  <tmpl_if submission.currentUser>\r\n            (<tmpl_var submission.status>)\r\n  </tmpl_if>\r\n</td></tr><tr><td class=\"tableData\"><b>\r\n  <tmpl_if submission.thumbnail>\r\n    <a href=\"<tmpl_var submission.url>\"><img src=\"<tmpl_var submission.thumbnail>\" border=\"0\" align=\"right\"/></a>\r\n   </tmpl_if>\r\n <tmpl_var label.by> <a href=\"<tmpl_var submission.userProfile>\"><tmpl_var submission.username></a>  - <tmpl_var submission.date></b><br/>\r\n<tmpl_var submission.content>\r\n<p/> ( <a href=\"<tmpl_var submission.url>\"><tmpl_var label.readmore></a>\r\n                <tmpl_if submission.responses>\r\n                         | <tmpl_var submission.responses> <tmpl_var label.responses>\r\n                </tmpl_if>\r\n         )<p/>\r\n</td></tr>\r\n\r\n</tmpl_loop>\r\n\r\n</table>\r\n\r\n<tmpl_if multiplePages>\r\n  <div class=\"pagination\">\r\n    <tmpl_var previousPage>  &middot; <tmpl_var nextPage>\r\n  </div>\r\n</tmpl_if>\r\n','USS');
INSERT INTO template VALUES (4,'Photo Gallery','<tmpl_var searchForm>\r\n\r\n<tmpl_if post>\r\n    <tmpl_var post> &middot;\r\n</tmpl_if>\r\n<tmpl_var search><p/>\r\n\r\n<table width=\"100%\" cellpadding=2 cellspacing=1 border=0>\r\n<tr>\r\n<tmpl_loop submissions_loop>\r\n\r\n<td align=\"center\" class=\"tableData\">\r\n  \r\n  <tmpl_if submission.thumbnail>\r\n       <a href=\"<tmpl_var submission.url>\"><img src=\"<tmpl_var submission.thumbnail>\" border=\"0\"/></a><br/>\r\n  </tmpl_if>\r\n  <a href=\"<tmpl_var submission.url>\"><tmpl_var submission.title></a>\r\n  <tmpl_if submission.currentUser>\r\n    (<tmpl_var submission.status>)\r\n  </tmpl_if>\r\n</td>\r\n\r\n<tmpl_if submission.thirdColumn>\r\n  </tr><tr>\r\n</tmpl_if>\r\n\r\n</tmpl_loop>\r\n</tr>\r\n</table>\r\n\r\n<tmpl_if multiplePages>\r\n  <div class=\"pagination\">\r\n    <tmpl_var previousPage>  &middot; <tmpl_var pageList> &middot; <tmpl_var nextPage>\r\n  </div>\r\n</tmpl_if>\r\n','USS');
INSERT INTO template VALUES (2,'Item w/pop-up Links','<tmpl_if displaytitle>\r\n   <tmpl_if linkurl>\r\n       <a href=\"<tmpl_var linkurl>\">\r\n    </tmpl_if>\r\n     <span class=\"itemTitle\"><tmpl_var title></span>\r\n   <tmpl_if linkurl>\r\n      </a>\r\n    </tmpl_if>\r\n</tmpl_if>\r\n\r\n<tmpl_if attachment>\r\n   <tmpl_if displaytitle> - </tmpl_if>\r\n   <a href=\"<tmpl_var attachmenturl>\" target=\"_blank\"><img src=\"<tmpl_var attachmentIcon>\" border=0 alt=\"<tmpl_var attachment>\" width=16 height=16 border=0 align=\"middle\"></a>\r\n</tmpl_if>\r\n\r\n<tmpl_if description>\r\n  - <tmpl_var description>\r\n</tmpl_if>','Item');

--
-- Table structure for table 'userLoginLog'
--

CREATE TABLE userLoginLog (
  userId int(11) default NULL,
  status varchar(30) default NULL,
  timeStamp int(11) default NULL,
  ipAddress varchar(128) default NULL,
  userAgent text
) TYPE=MyISAM;

--
-- Dumping data for table 'userLoginLog'
--



--
-- Table structure for table 'userProfileCategory'
--

CREATE TABLE userProfileCategory (
  profileCategoryId int(11) NOT NULL default '0',
  categoryName varchar(255) default NULL,
  sequenceNumber int(11) NOT NULL default '1',
  PRIMARY KEY  (profileCategoryId)
) TYPE=MyISAM;

--
-- Dumping data for table 'userProfileCategory'
--


INSERT INTO userProfileCategory VALUES (1,'WebGUI::International::get(449,\"WebGUI\");',6);
INSERT INTO userProfileCategory VALUES (2,'WebGUI::International::get(440,\"WebGUI\");',2);
INSERT INTO userProfileCategory VALUES (3,'WebGUI::International::get(439,\"WebGUI\");',1);
INSERT INTO userProfileCategory VALUES (4,'WebGUI::International::get(445,\"WebGUI\");',7);
INSERT INTO userProfileCategory VALUES (5,'WebGUI::International::get(443,\"WebGUI\");',3);
INSERT INTO userProfileCategory VALUES (6,'WebGUI::International::get(442,\"WebGUI\");',4);
INSERT INTO userProfileCategory VALUES (7,'WebGUI::International::get(444,\"WebGUI\");',5);

--
-- Table structure for table 'userProfileData'
--

CREATE TABLE userProfileData (
  userId int(11) NOT NULL default '0',
  fieldName varchar(128) NOT NULL default '',
  fieldData text,
  PRIMARY KEY  (userId,fieldName)
) TYPE=MyISAM;

--
-- Dumping data for table 'userProfileData'
--


INSERT INTO userProfileData VALUES (1,'language','1');
INSERT INTO userProfileData VALUES (3,'language','1');
INSERT INTO userProfileData VALUES (3,'uiLevel','9');

--
-- Table structure for table 'userProfileField'
--

CREATE TABLE userProfileField (
  fieldName varchar(128) NOT NULL default '',
  fieldLabel varchar(255) default NULL,
  visible int(11) NOT NULL default '0',
  required int(11) NOT NULL default '0',
  dataType varchar(128) NOT NULL default 'text',
  dataValues text,
  dataDefault text,
  sequenceNumber int(11) NOT NULL default '1',
  profileCategoryId int(11) NOT NULL default '1',
  protected int(11) NOT NULL default '0',
  PRIMARY KEY  (fieldName)
) TYPE=MyISAM;

--
-- Dumping data for table 'userProfileField'
--


INSERT INTO userProfileField VALUES ('email','WebGUI::International::get(56,\"WebGUI\");',1,1,'email',NULL,NULL,1,2,1);
INSERT INTO userProfileField VALUES ('firstName','WebGUI::International::get(314,\"WebGUI\");',1,0,'text',NULL,NULL,1,3,1);
INSERT INTO userProfileField VALUES ('middleName','WebGUI::International::get(315,\"WebGUI\");',1,0,'text',NULL,NULL,2,3,1);
INSERT INTO userProfileField VALUES ('lastName','WebGUI::International::get(316,\"WebGUI\");',1,0,'text',NULL,NULL,3,3,1);
INSERT INTO userProfileField VALUES ('icq','WebGUI::International::get(317,\"WebGUI\");',1,0,'text',NULL,NULL,2,2,1);
INSERT INTO userProfileField VALUES ('aim','WebGUI::International::get(318,\"WebGUI\");',1,0,'text',NULL,NULL,3,2,1);
INSERT INTO userProfileField VALUES ('msnIM','WebGUI::International::get(319,\"WebGUI\");',1,0,'text',NULL,NULL,4,2,1);
INSERT INTO userProfileField VALUES ('yahooIM','WebGUI::International::get(320,\"WebGUI\");',1,0,'text',NULL,NULL,5,2,1);
INSERT INTO userProfileField VALUES ('cellPhone','WebGUI::International::get(321,\"WebGUI\");',1,0,'phone',NULL,NULL,6,2,1);
INSERT INTO userProfileField VALUES ('pager','WebGUI::International::get(322,\"WebGUI\");',1,0,'phone',NULL,NULL,7,2,1);
INSERT INTO userProfileField VALUES ('emailToPager','WebGUI::International::get(441,\"WebGUI\");',1,0,'email',NULL,NULL,8,2,1);
INSERT INTO userProfileField VALUES ('language','WebGUI::International::get(304,\"WebGUI\");',1,0,'select','WebGUI::International::getLanguages()','[1]',1,4,1);
INSERT INTO userProfileField VALUES ('homeAddress','WebGUI::International::get(323,\"WebGUI\");',1,0,'text',NULL,NULL,1,5,1);
INSERT INTO userProfileField VALUES ('homeCity','WebGUI::International::get(324,\"WebGUI\");',1,0,'text',NULL,NULL,2,5,1);
INSERT INTO userProfileField VALUES ('homeState','WebGUI::International::get(325,\"WebGUI\");',1,0,'text',NULL,NULL,3,5,1);
INSERT INTO userProfileField VALUES ('homeZip','WebGUI::International::get(326,\"WebGUI\");',1,0,'zipcode',NULL,NULL,4,5,1);
INSERT INTO userProfileField VALUES ('homeCountry','WebGUI::International::get(327,\"WebGUI\");',1,0,'text',NULL,NULL,5,5,1);
INSERT INTO userProfileField VALUES ('homePhone','WebGUI::International::get(328,\"WebGUI\");',1,0,'phone',NULL,NULL,6,5,1);
INSERT INTO userProfileField VALUES ('workAddress','WebGUI::International::get(329,\"WebGUI\");',1,0,'text',NULL,NULL,2,6,1);
INSERT INTO userProfileField VALUES ('workCity','WebGUI::International::get(330,\"WebGUI\");',1,0,'text',NULL,NULL,3,6,1);
INSERT INTO userProfileField VALUES ('workState','WebGUI::International::get(331,\"WebGUI\");',1,0,'text',NULL,NULL,4,6,1);
INSERT INTO userProfileField VALUES ('workZip','WebGUI::International::get(332,\"WebGUI\");',1,0,'zipcode',NULL,NULL,5,6,1);
INSERT INTO userProfileField VALUES ('workCountry','WebGUI::International::get(333,\"WebGUI\");',1,0,'text',NULL,NULL,6,6,1);
INSERT INTO userProfileField VALUES ('workPhone','WebGUI::International::get(334,\"WebGUI\");',1,0,'phone',NULL,NULL,7,6,1);
INSERT INTO userProfileField VALUES ('gender','WebGUI::International::get(335,\"WebGUI\");',1,0,'select','{\r\n  \'neuter\'=>WebGUI::International::get(403),\r\n  \'male\'=>WebGUI::International::get(339),\r\n  \'female\'=>WebGUI::International::get(340)\r\n}','[\'neuter\']',1,7,1);
INSERT INTO userProfileField VALUES ('birthdate','WebGUI::International::get(336,\"WebGUI\");',1,0,'text',NULL,NULL,2,7,1);
INSERT INTO userProfileField VALUES ('homeURL','WebGUI::International::get(337,\"WebGUI\");',1,0,'url',NULL,NULL,7,5,1);
INSERT INTO userProfileField VALUES ('workURL','WebGUI::International::get(446,\"WebGUI\");',1,0,'url',NULL,NULL,8,6,1);
INSERT INTO userProfileField VALUES ('workName','WebGUI::International::get(450,\"WebGUI\");',1,0,'text',NULL,NULL,1,6,1);
INSERT INTO userProfileField VALUES ('timeOffset','WebGUI::International::get(460,\"WebGUI\");',1,0,'text',NULL,'\'0\'',3,4,1);
INSERT INTO userProfileField VALUES ('dateFormat','WebGUI::International::get(461,\"WebGUI\");',1,0,'select','{\r\n \'%M/%D/%y\'=>WebGUI::DateTime::epochToHuman(\"\",\"%M/%D/%y\"),\r\n \'%y-%m-%d\'=>WebGUI::DateTime::epochToHuman(\"\",\"%y-%m-%d\"),\r\n \'%D-%c-%y\'=>WebGUI::DateTime::epochToHuman(\"\",\"%D-%c-%y\"),\r\n \'%c %D, %y\'=>WebGUI::DateTime::epochToHuman(\"\",\"%c %D, %y\")\r\n}\r\n','[\'%M/%D/%y\']',4,4,1);
INSERT INTO userProfileField VALUES ('timeFormat','WebGUI::International::get(462,\"WebGUI\");',1,0,'select','{\r\n \'%H:%n %p\'=>WebGUI::DateTime::epochToHuman(\"\",\"%H:%n %p\"),\r\n \'%H:%n:%s %p\'=>WebGUI::DateTime::epochToHuman(\"\",\"%H:%n:%s %p\"),\r\n \'%j:%n\'=>WebGUI::DateTime::epochToHuman(\"\",\"%j:%n\"),\r\n \'%j:%n:%s\'=>WebGUI::DateTime::epochToHuman(\"\",\"%j:%n:%s\")\r\n}\r\n','[\'%H:%n %p\']',5,4,1);
INSERT INTO userProfileField VALUES ('discussionLayout','WebGUI::International::get(509)',1,0,'select','{\r\n  threaded=>WebGUI::International::get(511),\r\n  flat=>WebGUI::International::get(510)\r\n}','[\'threaded\']',6,4,0);
INSERT INTO userProfileField VALUES ('INBOXNotifications','WebGUI::International::get(518)',1,0,'select','{ \r\n  none=>WebGUI::International::get(519),\r\n email=>WebGUI::International::get(520),\r\n  emailToPager=>WebGUI::International::get(521),\r\n  icq=>WebGUI::International::get(522)\r\n}','[\'email\']',7,4,0);
INSERT INTO userProfileField VALUES ('firstDayOfWeek','WebGUI::International::get(699,\"WebGUI\");',1,0,'select','{0=>WebGUI::International::get(27,\"WebGUI\"),1=>WebGUI::International::get(28,\"WebGUI\")}','[0]',3,4,1);
INSERT INTO userProfileField VALUES ('uiLevel','WebGUI::International::get(739,\"WebGUI\");',0,0,'select','{\r\n0=>WebGUI::International::get(729,\"WebGUI\"),\r\n1=>WebGUI::International::get(730,\"WebGUI\"),\r\n2=>WebGUI::International::get(731,\"WebGUI\"),\r\n3=>WebGUI::International::get(732,\"WebGUI\"),\r\n4=>WebGUI::International::get(733,\"WebGUI\"),\r\n5=>WebGUI::International::get(734,\"WebGUI\"),\r\n6=>WebGUI::International::get(735,\"WebGUI\"),\r\n7=>WebGUI::International::get(736,\"WebGUI\"),\r\n8=>WebGUI::International::get(737,\"WebGUI\"),\r\n9=>WebGUI::International::get(738,\"WebGUI\")\r\n}','[5]',8,4,1);

--
-- Table structure for table 'userSession'
--

CREATE TABLE userSession (
  sessionId varchar(60) NOT NULL default '',
  expires int(11) default NULL,
  lastPageView int(11) default NULL,
  adminOn int(11) NOT NULL default '0',
  lastIP varchar(50) default NULL,
  userId int(11) default NULL,
  PRIMARY KEY  (sessionId)
) TYPE=MyISAM;

--
-- Dumping data for table 'userSession'
--



--
-- Table structure for table 'users'
--

CREATE TABLE users (
  userId int(11) NOT NULL default '0',
  username varchar(35) default NULL,
  identifier varchar(128) default NULL,
  authMethod varchar(30) NOT NULL default 'WebGUI',
  ldapURL text,
  connectDN varchar(255) default NULL,
  dateCreated int(11) NOT NULL default '1019867418',
  lastUpdated int(11) NOT NULL default '1019867418',
  karma int(11) NOT NULL default '0',
  PRIMARY KEY  (userId)
) TYPE=MyISAM;

--
-- Dumping data for table 'users'
--


INSERT INTO users VALUES (1,'Visitor','No Login','WebGUI',NULL,NULL,1019867418,1019867418,0);
INSERT INTO users VALUES (3,'Admin','RvlMjeFPs2aAhQdo/xt/Kg','WebGUI','','',1019867418,1019935552,0);

--
-- Table structure for table 'webguiVersion'
--

CREATE TABLE webguiVersion (
  webguiVersion varchar(10) default NULL,
  versionType varchar(30) default NULL,
  dateApplied int(11) default NULL
) TYPE=MyISAM;

--
-- Dumping data for table 'webguiVersion'
--


INSERT INTO webguiVersion VALUES ('4.7.0','initial install',unix_timestamp());

--
-- Table structure for table 'wobject'
--

CREATE TABLE wobject (
  wobjectId int(11) NOT NULL default '0',
  pageId int(11) default NULL,
  namespace varchar(35) default NULL,
  sequenceNumber int(11) NOT NULL default '1',
  title varchar(255) default NULL,
  displayTitle int(11) NOT NULL default '1',
  description mediumtext,
  processMacros int(11) NOT NULL default '0',
  dateAdded int(11) default NULL,
  addedBy int(11) default NULL,
  lastEdited int(11) default NULL,
  editedBy int(11) default NULL,
  templatePosition int(11) NOT NULL default '0',
  startDate int(11) default NULL,
  endDate int(11) default NULL,
  groupToPost int(11) NOT NULL default '2',
  editTimeout int(11) NOT NULL default '1',
  groupToModerate int(11) NOT NULL default '4',
  karmaPerPost int(11) NOT NULL default '0',
  moderationType varchar(30) NOT NULL default 'after',
  userDefined1 varchar(255) default NULL,
  userDefined2 varchar(255) default NULL,
  userDefined3 varchar(255) default NULL,
  userDefined4 varchar(255) default NULL,
  userDefined5 varchar(255) default NULL,
  PRIMARY KEY  (wobjectId)
) TYPE=MyISAM;

--
-- Dumping data for table 'wobject'
--


INSERT INTO wobject VALUES (-1,4,'SiteMap',0,'Page Not Found',1,'The page you were looking for could not be found on this system. Perhaps it has been deleted or renamed. The following list is a site map of this site. If you don\'t find what you\'re looking for on the site map, you can always start from the <a href=\"^/;\">Home Page</a>.',1,1001744792,3,1016077239,3,1,1001744792,1336444487,2,3600,4,0,'after',NULL,NULL,NULL,NULL,NULL);
INSERT INTO wobject VALUES (-2,1,'Article',1,'Welcome to WebGUI!',1,'<DIV>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">If you�re reading this message it means that you�ve got WebGUI up and running. Good job! The installation is not trivial.</P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">�<?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /><o:p></o:p></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">In order to do anything useful with your new installation you�ll need to log in as the default administrator account. Follow these steps to get started:</P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">�<o:p></o:p></P>\r\n<OL style=\"MARGIN-TOP: 0in\" type=1>\r\n<LI class=MsoNormal style=\"MARGIN: 0in 0in 0pt; mso-list: l1 level1 lfo2; tab-stops: list .5in\"><A href=\"^\\;?op=displayLogin\">Click here to log in.</A> (username: Admin password: 123qwe) \r\n<LI class=MsoNormal style=\"MARGIN: 0in 0in 0pt; mso-list: l1 level1 lfo2; tab-stops: list .5in\"><A href=\"^\\;?op=switchOnAdmin\">Click here to turn the administrative interface on.</A></LI></OL>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">�Now that you�re in as the administrator, you should <A href=\"^\\;?op=displayAccount\">change your password</A> so no one else can log in and mess with your site. You might also want to <A href=\"^\\;?op=addUser\">create another account </A>for yourself with Administrative privileges in case you can\'t log in with the Admin account for some reason.</P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">�<o:p></o:p></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">You�ll notice three menus at the top of your screen. Those are your administrative menus. Going from left to right they are <I>Content</I>, <I>Clipboard</I>, and <I>Admin</I>. The content menu allows you to add new pages and content to your site. The clipboard menu is currently empty, but if you cut or copy anything from any of your pages, it will end up there. The admin menu controls things like system settings and users.</P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">�<o:p></o:p></P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">For more information about how to administer WebGUI consider getting a copy of <I><A href=\"http://www.plainblack.com/ruling_webgui\">Ruling WebGUI</A></I>. Plain Black Software also provides several <A href=\"http://www.plainblack.com/support_programs\">Support Programs </A>for WebGUI if you run into trouble.</P>\r\n<P class=MsoNormal style=\"MARGIN: 0in 0in 0pt\">�<o:p></o:p></P>Enjoy your new WebGUI site!\r\n</DIV>',1,1023555430,3,1023555630,3,1,1023512400,1338872400,2,3600,4,0,'after',NULL,NULL,NULL,NULL,NULL);

