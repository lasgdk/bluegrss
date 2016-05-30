DROP TABLE IF EXISTS  channels ;
		CREATE TABLE  channels  (
			id bigint(11) NOT NULL auto_increment,
  			title varchar(255) NOT NULL default '',
  			url varchar(255) NOT NULL default '',
  			siteurl varchar(255) default NULL,
  			parent tinyint(4) default '0',
  			descr varchar(255) default NULL,
  			dateadded datetime default NULL,
			daterefreshed datetime default NULL,
			refreshinterval int(16) NOT NULL default '60',
			itemsincache text default NULL,
			etag varchar(255) default NULL,
			lastmodified varchar(255) default NULL,
  			icon varchar(255) default NULL,
  			position int(11) NOT NULL default '0',
			mode int(16) NOT NULL default '1',
  			PRIMARY KEY  (id),
			KEY url (url)
		) ENGINE=MyISAM;    ;
DROP TABLE IF EXISTS  config ;
		CREATE TABLE  config  (
			     key_ varchar(127) NOT NULL default '',
			     value_ text NOT NULL,
			     default_ text NOT NULL,
			     type_ enum('string','num','boolean','array','enum') NOT NULL default 'string',
			     desc_ text,
			     export_ varchar(127) default NULL,
			     PRIMARY KEY  (key_)
			     ) ENGINE=MyISAM;;
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.encoding','UTF-8','UTF-8','string','Output encoding for the PHP XML parser.','MAGPIE_OUTPUT_ENCODING');
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.itemsinchannelview','10','10','num','Number of read items shown on for a single channel.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.showfavicons','true','true','boolean','Display the favicon for the channels that have one. Due to a IE bug, some icons do not render correctly. You can either change the URL to the icon in the admin screen, or turn the display of favicons off globally here.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.usemodrewrite','true','true','boolean','Make use of apache\'s mod_rewrite module to return sexy urls. Turn this off if your host doesn\'t allow you to change this apache setting.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.dateformat','F jS, Y, g:ia T','F jS, Y, g:ia T','string','Format to use when displaying dates. See here for help on the format: http://php.net/date Note that direct access to a given feed\'s month and day archives more or less depends on the fact that this date format contains the  \"F\" (Month) and \"jS\" (day) elements in this form. So feel free to change the order of the elements, but better leave those two tokens in :)',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.meta.debug','false','false','boolean',' When in debug mode some extra debug info is shown and the error reporting is a bit more verbose.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.compression','true','true','boolean','This variable turns output compression on and off. Output compression is handled by most browsers.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.channelcollapse','true','true','boolean','Allow collapsing of channels on the main page. ',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.channelcollapsedefault','false','false','boolean','Collapse the channels on the main page by default',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.usepermalinks','true','true','boolean','Display a permalink icon and allow linking a given item directly.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.markreadonupdate','false','false','boolean','Mark all old unread feeds as read when updating if new unread feeds are found.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.lang','en_US,zh_CN,de,da,es,fr,he,it,ja,pt_BR,pt,ru,sv,0','en_US,zh_CN,de,da,es,fr,he,it,ja,pt_BR,pt,ru,sv,0','enum','Language pack to use.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.lang.force','false','false','boolean','When false, Gregarius will negotiate the display language with the browser and will fall back to the language defined in rss.output.lang if the negotiation fails. When true, Gregarius won\'t negotiate and will always use the language defined in rss.output.lang.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.absoluteordering','true','true','boolean','Allow feeds and folders to be ordered by their order in the admin section. If this option is set to false, channels and folders will be organized alphabetically by their titles.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.robotsmeta','noindex,follow','noindex,follow','string','How should spiders crawl us? (see http://www.robotstxt.org/wc/meta-user.html for more info).',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.serverpush','true','true','boolean','Use the server push method when updating your feeds in the browser. The browsers that support this (Mozilla and Opera) will be autodetected. Turn this option off if you do not use one of these browsers or if you would like to use the Ajax update method',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.refreshafter','45','45','num','If this option is set the feeds will be updated after keeping the browser open for x minutes. Please respect the feed providers by not setting this value to anything lower than thirty minutes. Set this variable to 0 turn this option off.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.input.allowed','a:21:{s:1:"a";a:2:{s:4:"href";i:1;s:5:"title";i:1;}s:1:"b";a:0:{}s:10:"blockquote";a:0:{}s:2:"br";a:0:{}s:4:"code";a:0:{}s:3:"del";a:0:{}s:2:"em";a:0:{}s:1:"i";a:0:{}s:3:"img";a:2:{s:3:"src";i:1;s:3:"alt";i:1;}s:3:"ins";a:0:{}s:2:"li";a:0:{}s:2:"ol";a:0:{}s:1:"p";a:0:{}s:3:"pre";a:0:{}s:3:"sup";a:0:{}s:5:"table";a:0:{}s:2:"td";a:0:{}s:2:"th";a:0:{}s:2:"tr";a:0:{}s:2:"tt";a:0:{}s:2:"ul";a:0:{}}','a:21:{s:1:"a";a:2:{s:4:"href";i:1;s:5:"title";i:1;}s:1:"b";a:0:{}s:10:"blockquote";a:0:{}s:2:"br";a:0:{}s:4:"code";a:0:{}s:3:"del";a:0:{}s:2:"em";a:0:{}s:1:"i";a:0:{}s:3:"img";a:2:{s:3:"src";i:1;s:3:"alt";i:1;}s:3:"ins";a:0:{}s:2:"li";a:0:{}s:2:"ol";a:0:{}s:1:"p";a:0:{}s:3:"pre";a:0:{}s:3:"sup";a:0:{}s:5:"table";a:0:{}s:2:"td";a:0:{}s:2:"th";a:0:{}s:2:"tr";a:0:{}s:2:"tt";a:0:{}s:2:"ul";a:0:{}}','array','This variable controls input filtering. HTML tags and their attributes, which are not in this list, get filtered out when new RSS items are imported.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.showfeedmeta','false','false','boolean','Display meta-information (like a web- and rss/rdf/xml url) about each feed in the feed side-column.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.frontpage.numitems','100','100','num','Maximum number of items displayed on the main page. Set this variable to 0 to show no items on the main page.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.frontpage.mixeditems','true','true','boolean','Show read items along with unread items on the front page?',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.frontpage.numreaditems','-1','-1','num','If there are no unread items then how many items to show on the frontpage. Set this to -1 if you want it to be the same as rss.output.numitemsonmainpage',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.theme','default','default','string','The theme to use. Download more themes from the <a href=\"http://themes.gregarius.net/\">Gregarius Themes Repository</a>.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.cachecontrol','false','false','boolean','If true, Gregarius will negotiate with the browser and check whether it should get a fresh document or not.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.plugins','a:2:{i:0;s:13:"urlfilter.php";i:1;s:18:"roundedcorners.php";}','a:2:{i:0;s:13:"urlfilter.php";i:1;s:18:"roundedcorners.php";}','array','Plugins are third-party scripts that offer extended functionalities. More plugins can be found at the <a href=\"http://plugins.gregarius.net/\">Plugin Repository</a>.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.input.allowupdates','true','true','boolean','Allow Gregarius to see if new items are updates of existing items.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.titleunreadcnt','false','false','boolean','Display unread count in the document title.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.tzoffset','0','0','num','Timezone offset, in hours, between your local time and server time. Valid range: \"-12\" through \"12\"',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.feedgrouping','false','false','boolean','When true, Gregarius groups unread items per feed and sorts the feeds according to the <code>rss.config.absoluteordering</code> configuration switch. When false, unread items are not grouped by feed, but are sorted by date instead.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.datedesc.unread','true','true','boolean','When true, Gregarius displays newer <strong>unread</strong> items first. If false, Gregarius will display older unread items first.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.datedesc.read','true','true','boolean','When true, Gregarius displays newer <strong>read</strong> items first. If false, Gregarius will display older read items first.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.autologout','false','false','boolean','When true, Gregarius will automatically remove the \"admin cookie\" when the browser window is closed, effectively logging you out.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.publictagging','false','false','boolean','When true, every visitor to your Gregarius site will be allowed to tag items, when false only the Administrator (you) is allowed to tag.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.rating','true','true','boolean','Enable the item rating system.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.barefrontpage','false','false','boolean','Suppress the output of any read item on the front page.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.title','Gregarius','Gregarius','string','Sets the title of this feedreader.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.ajaxparallelsize','3','3','num','Sets the number of feeds to update in parallel. Remember to set rss.config.serverpush to false.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.ajaxbatchsize','3','3','num','Sets the number of feeds in a batch when using the ajax updater. Remember to set rss.config.serverpush to false.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.defaultdashboard','true','true','boolean','If the first page seen when entering the admin section should be the dashboard',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.deadthreshhold','24','24','num','Sets the threshold for when a feed is marked as dead, in hours',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.search.maxitems','500','500','num','Sets the maximum number of items returned on a search',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.config.restrictrefresh','false','false','boolean','Restrict refresh to command line only (eg php -f update.php). Useful for busy sites with multiple users.',null);
insert into  config (key_,value_,default_,type_,desc_,export_) VALUES ('rss.output.minimalchannellist','false','false','boolean','Exclude folders and channels without unread items in channel list?',null);
DROP TABLE IF EXISTS  folders ;
		CREATE TABLE  folders  (
		  id tinyint(11) NOT NULL auto_increment,
		  name varchar(127) NOT NULL default '',
		  position int(11) NOT NULL default '0',    
		  PRIMARY KEY  (id),
		  UNIQUE KEY name (name)
		) ENGINE=MyISAM;    ;
INSERT INTO  folders  (id,name) VALUES (0,'');
update  folders  set id=0 where id=1;
DROP TABLE IF EXISTS  item ;
		CREATE TABLE  item  (
		  id bigint(16) NOT NULL auto_increment,
		  cid bigint(11) NOT NULL default '0',
		  md5sum varchar(32) default NULL,
		  guid text default NULL,
		  added datetime NOT NULL default '0000-00-00 00:00:00',
		  title varchar(255) default NULL,
		  url varchar(255) default NULL,
		  enclosure varchar(255) default NULL,
		  description text,
		  unread tinyint(4) default '1',
		  pubdate datetime default NULL,
		  author varchar(255) default NULL,		  
		  PRIMARY KEY  (id),
		  KEY url (url),
		  KEY guid(guid(10)),
		  KEY cid (cid),
		  KEY author (author)
		) ENGINE=MyISAM;    ;
DROP TABLE IF EXISTS  metatag ;
		CREATE TABLE  metatag  (
			fid bigint(16) NOT NULL default '0',                    
			tid bigint(16) NOT NULL default '0', 
			ttype enum('item','folder','channel') NOT NULL default 'item', 
			KEY fid (fid), 
			KEY tid (tid),
			KEY ttype (ttype)
		) ENGINE=MyISAM;    ;
DROP TABLE IF EXISTS  tag ;
		CREATE TABLE  tag  (
			id bigint(16) NOT NULL auto_increment,
			tag varchar(63) NOT NULL default '',                    
			PRIMARY KEY  (id),
		 	UNIQUE KEY tag (tag),
			KEY id (id)
		) ENGINE=MyISAM;    ;
DROP TABLE IF EXISTS  rating ;
		CREATE TABLE  rating  (
			iid bigint(16)  NOT NULL,
  			rating tinyint(4) default '0'
		) ENGINE=MyISAM;;
DROP TABLE IF EXISTS  cache ;
		CREATE TABLE  cache  (
		cachekey VARCHAR( 128 ) NOT NULL ,
		timestamp DATETIME NOT NULL ,
		cachetype ENUM( 'ts', 'icon', 'feed' ) NOT NULL ,
		data BLOB,
		PRIMARY KEY ( cachekey )
		) ENGINE=MYISAM;;
INSERT INTO  cache  (cachekey,timestamp,cachetype,data) VALUES ('data_ts',now(),'ts',null);
DROP TABLE IF EXISTS  users ;
		CREATE TABLE  users  (
		  uid bigint(16) NOT NULL auto_increment,
		  uname varchar(255) NOT NULL,		  
		  password varchar(255) NOT NULL,		  
		  ulevel bigint(11) NOT NULL default '1',		  
		  realname varchar(255) default NULL,		  		  
		  lastip varchar(255) default NULL,		  		  		  
		  userips TEXT default '',		  
		  lastlogin datetime NULL default '0000-00-00 00:00:00',
		  PRIMARY KEY  (uid),
		  KEY (uname)
		) ENGINE=MyISAM;  ;
INSERT INTO  users  (uname,password,ulevel,realname) VALUES ('admin','',99,'Administrator');
DROP TABLE IF EXISTS  dashboard ;
		CREATE TABLE  dashboard  (
			id bigint(11) NOT NULL auto_increment,
  			title text NOT NULL default '',
  			url text NOT NULL default '',
  			position tinyint(1) NOT NULL default 0,
  			obj text not NULL default '',
  			daterefreshed datetime default NULL,
  			itemcount tinyint(1) NOT NULL default 3,
  			PRIMARY KEY  (id)
		) ENGINE=MyISAM;    ;
INSERT INTO  dashboard  (title, url, position, obj, daterefreshed, itemcount) VALUES  ('Latest Gregarius News', 'http://devlog.gregarius.net/feed/?db=', '0', '', null, 3);
INSERT INTO  dashboard  (title, url, position, obj, daterefreshed, itemcount) VALUES  ('Latest Plugins', 'http://plugins.gregarius.net/rss.php?db=', '1', '', null, 5);
INSERT INTO  dashboard  (title, url, position, obj, daterefreshed, itemcount) VALUES  ('Latest Themes', 'http://themes.gregarius.net/rss.php?db=', '1', '', null, 5);
INSERT INTO  dashboard  (title, url, position, obj, daterefreshed, itemcount) VALUES  ('Latest Forum posts', 'http://forums.gregarius.net/feeds/?Type=rss2&db=', '1', '', null, 5);
DROP TABLE IF EXISTS  properties ;
		CREATE TABLE  properties  (
		  fk_ref_object_id text NOT NULL,
		  proptype enum('item','feed','folder','category','plugin','tag','theme','misc') NOT NULL default 'item',
		  property varchar(128) NOT NULL default '',
		  value text NOT NULL
		) ENGINE=MyISAM;
		;
alter table  properties  add UNIQUE KEY uniq (fk_ref_object_id(180),property,proptype);
