/*
SQLyog Ultimate - MySQL GUI v8.22 
MySQL - 5.5.9 : Database - bb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bb`;

/*Table structure for table `admin_master` */

DROP TABLE IF EXISTS `admin_master`;

CREATE TABLE `admin_master` (
  `username` varchar(20) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_master` */

insert  into `admin_master`(`username`,`password`) values ('dhruvsheth7@gmail.co','blackboard');

/*Table structure for table `course_master` */

DROP TABLE IF EXISTS `course_master`;

CREATE TABLE `course_master` (
  `subject_id` int(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  `sub_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `course_master` */

insert  into `course_master`(`subject_id`,`category_name`,`sub_name`) values (1,'Computer','Os'),(2,'Computer','Parallel Processors'),(3,'Computer','Distributed Systems'),(4,'Computer','SOC'),(5,'Computer','CN'),(6,'Computer','SP'),(7,'Computer','C/C++'),(8,'Computer','Core Java'),(9,'Electronics','x86 Processors'),(10,'Electronics','IP'),(11,'Mechanical','MOS'),(12,'Mechanical','CPE'),(13,'Information Technolo','ERP'),(14,'Mechanical','Machine Design 2'),(15,'Mechanical','Theory Of Machines'),(16,'Computer','Compiler Design'),(17,'Information Technolo','Cryptography'),(18,'Mobile Technology','Iphone Programming'),(19,'Mobile Technology','Android');

/*Table structure for table `details_master` */

DROP TABLE IF EXISTS `details_master`;

CREATE TABLE `details_master` (
  `discussion_id` int(20) NOT NULL AUTO_INCREMENT,
  `discussion_title` varchar(200) DEFAULT NULL,
  `discussion_details` longtext,
  `discussion_postedby` varchar(100) DEFAULT NULL,
  `discussion_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discussion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `details_master` */

insert  into `details_master`(`discussion_id`,`discussion_title`,`discussion_details`,`discussion_postedby`,`discussion_date`) values (1,'Android how to pass object','i want to pass custom class\'s  object from activity to  service\r\n\r\nfor example,\r\n\r\nCustomclass c=new Customclass();\r\n\r\nnow i want to pass object - \" c \" from activity to service. \r\n\r\nplz tell me how it is possible.\r\n','admin','2012-03-01 12:57:53'),(2,'integrate google SSO in Android','can anybody tell what is google SSO and how can i integrate in Android????','admin','2012-03-01 12:57:53'),(3,'DatabaseHelper','When i make DatabaseHelper class in Src public DatabaseHelper(Context context)\r\n    {\r\n        this.context = context;\r\n        OpenHelper openHelper = new OpenHelper(this.context);\r\n        this.db = openHelper.getWritableDatabase();\r\n        //this.insertStmt = this.db.compileStatement(INSERT);\r\n    }\r\n\r\nOpenHelper openhelper= new OpenHelper(this.context); i cant get the openHelper From Eclipse inteligance.... they tell me that create class for OpenHelper..\r\n','admin','2012-03-01 14:10:10'),(4,'How to make operating system?','Hey guys everyday in so many computers n lappies we see microsofts operating systems generally n not others why this is so?\r\n\r\nIs there any huge problem cause of which other companies do not make operating systems or make their os popular?\r\n','admin','2012-03-01 15:10:34'),(5,'Importance of Computer Graphics with ,c/c++, java and OpenGL','I want to know about this As I got some sort of interest in this and using the Computer graphics resources the application can be more eye catching. Please tell me about this what is the scope and try to make a group on the Computer Graphics and OpenGL as very less content is on the web and that is only the assignment of the student nothing new.','admin','2012-03-01 15:15:15'),(6,'binary conversion','how to get a binary format of  a double value?\r\n\r\ne.g double x=35\r\n\r\nI have to represent  this in binary form and store,but  in which data type?\r\n','admin','2012-03-01 15:15:16'),(7,'File sharing application','I want to make a File Sharing Application. I know few ways of doing it, but looking for something interesting. I know my question is vague, but I think I can get some interesting ideas. \r\n\r\n \r\n\r\nThanks\r\n','admin','2012-03-01 15:18:23'),(8,'Jqueries','http://jqueryui.com/demos/droppable/\r\n\r\nTake A Look Just want to add a form having field username and password and want to submit it.! HLP ME ','admin','2012-03-01 15:18:45'),(9,'How to increase web traffic?','Here’s your ultimate “how to” guide to creating content that attracts links and drives traffic in the social media environment:\r\n\r\n \r\n\r\nhttp://www.copyblogger.com/increase-web-traffic/\r\n','admin','2012-03-01 16:00:00'),(10,'Web Designing','\r\nI am very much interested in Web designing and want to learn it in a proper way. Being a beginner in this field i wanted to know how should i start and from where also i don\'t have any knowledge of Java at  present so is it possible for me to design a website without knowing java.  And as i am beginning now should i focus only on HTML5 or any other as well????????????????????','admin','2012-03-01 16:04:34'),(11,'MyHome project','Hello Every One\r\n\r\n \r\n\r\nI wont make some Home project in JSP/servelet on My self for my Practice so Give me\r\n\r\nyour Suggetion which kind of  project i should make .It is better to  do unique project \r\n','admin','2012-03-01 16:15:47'),(12,'My project','I have to do a project for a subject Software Engineering and Development.\r\n\r\nWe are 10 people in a group.\r\n\r\nWe have decided some projects which we can do.\r\n\r\nI am listing them here. Do give your view that which can be the best one..\r\n\r\n1> Content Management System\r\n\r\n2> Wats app concept ( name for our application is not yet decided)\r\n\r\n3> file sharing through cloud\r\n\r\n4> Entry exit registration of a person , his/her laptop and vehicle at college gate by using fingerprint. this fingerprint can be used any where in college where authentication is required. ( library n all).\r\n\r\n5> Android app for traditional Indian games.\r\n\r\n ','admin','2012-03-01 16:20:23'),(13,'C, C++ Or Java','1. Kingdom of Raigadh is a beautiful country comprising of a lot of small islands of different areas. All the islands are in a straight row. King Ramchandra getting old and has decided to divide the islands among his two sons - Mohan and Shyam. Luckily, the total number of islands is even. He has also decided a few rules for the division of islands:\r\n\r\ni) Mohan and Shyam will be given alternate turns to choose the islands.\r\n\r\nii) They can only choose one island at a time from either the beginning or the end of the row of islands.\r\n\r\niii) Once an island is chosen by someone, it cannot be chosen by other person.\r\n\r\n \r\n\r\nSuppose you are Mohan and you are given the first choice. Find out the maximum area you are sure you can pick.\r\n\r\n \r\n\r\nusing c ,c++ or java\r\n','admin','2012-03-01 16:25:45'),(14,'Unable to save all JInternalFrames in JDesktopPane','I have made an application using netbeans that uses JDesktopPane to view multiple windows in the JDesktopPane . But now I want to save all the windows in my own application extension How can I do that please help guys ....','admin','2012-03-01 16:35:23'),(15,'Unable to establish Open file dialogue using netbeans','Hello guys As I am new to netbeans IDE. I am unable to establish the open file dialogue in the IDE and for this reson lot of my work is pending . I tried to make File dialogue accessible through Browse button where I gave the actionPerformed as \r\n\r\nOpen.AccessibleJFrame();\r\n\r\nthis would open the file dialogue but I am blank with how to select a file from there and how to define file extensions there . I need to show .png file for signature and passport sized photos Please help me out.\r\n','admin','2012-03-01 16:45:23'),(16,'Sending Image from client to server database','i have to send image files from client to server .\r\n\r\nbut i am new to java so plz let me know how to do that.\r\n\r\nthnx','admin','2012-03-01 16:46:24'),(17,'Do I need to learn .net after java or the java alone is enough for softwares and web applications development.','I am currently learning java but it is been told some of my freinds that I may need .net so please suggest me better.','admin','2012-03-01 16:48:24'),(18,'Applet Elimination','why Applet Elemented from html5?\r\n\r\nI love to do programming of Applet ?\r\n\r\nWhat is the future of Applet?','admin','2012-03-01 16:50:23'),(19,'Email Client Application','Sir, we are making this project on Java. Which IDE we should use for coding? \r\n\r\nWhich of the Java related things or tools we need to develope this project?\r\n\r\nCan we have any new features in our project compared to current email clients such as MS outlook, Thunderbird?\r\n\r\nPlease reply us as soon as possible... Thanking you..','admin','2012-03-01 16:50:50'),(20,'How can I encrypt a Java Applet?','Hello Java lovers , \r\n\r\n \r\n\r\nPlease help me! \r\n\r\n \r\n\r\nHow can the code for a Java Applet be encrypted or obfuscated so that it cannot be read by tools such JAD, Mocha and other Java decompilers?\r\n\r\n \r\n\r\nThanks in advance :-) \r\n','admin','2012-03-01 17:06:23'),(21,'Should Source Code be submitted with project in college?','No we shoul not','admin','2012-03-05 12:07:47'),(29,'Is Submission of project a problem for student?','yes','Darshan Dagli','2012-03-06 22:08:54'),(30,'Hi','2day is  inspection!!!','admin','2012-03-23 11:25:18'),(31,'hello','ssup','manushi doshi','2012-03-23 11:45:29'),(32,'hi','heloo world','dhrumit sheth','2012-03-23 13:42:56');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `user_id` int(20) NOT NULL,
  `feed_subject` varchar(100) DEFAULT NULL,
  `feed_findus` char(1) DEFAULT NULL,
  `feed_often` char(1) DEFAULT NULL,
  `feed_navigation` int(1) DEFAULT NULL,
  `feed_contentquality` int(1) DEFAULT NULL,
  `feed_favourite` longtext,
  `feed_other` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`user_id`,`feed_subject`,`feed_findus`,`feed_often`,`feed_navigation`,`feed_contentquality`,`feed_favourite`,`feed_other`) values (1,'hi','a','a',5,5,'Very Nice','Awesome'),(2,'dhrumit','c','c',3,3,'Perfect','Helpful');

/*Table structure for table `material_master` */

DROP TABLE IF EXISTS `material_master`;

CREATE TABLE `material_master` (
  `mat_id` int(20) NOT NULL AUTO_INCREMENT,
  `mat_title` varchar(200) DEFAULT NULL,
  `mat_file` varchar(40) DEFAULT NULL,
  `mat_postby` varchar(100) DEFAULT NULL,
  `mat_datestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subject_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`mat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

/*Data for the table `material_master` */

insert  into `material_master`(`mat_id`,`mat_title`,`mat_file`,`mat_postby`,`mat_datestamp`,`subject_id`) values (33,'C presentation','c_tutorial.ppt','dhrumit sheth','2012-03-06 21:51:18',1),(34,'Networking','cn.pdf','dhrumit sheth','2012-03-06 21:51:36',5),(35,'Presentation','bb.rtf','dhrumit sheth','2012-03-06 21:52:29',1),(36,'ECE','ce152_DMD.ppt','dhrumit sheth','2012-03-06 21:58:52',1),(37,'CE','da06-Introduction.ppt','dhrumit sheth','2012-03-06 21:59:16',1),(38,'DS PPT1','chap-01.ppt','dhrumit sheth','2012-03-06 21:59:45',3),(39,'Mos','Mos.ppt','admin','2012-03-06 22:03:05',11),(40,'Image Processing','IP.ppt','Darshan Dagli','2012-03-06 22:10:10',14),(41,'Process','os-ch3-Processes-2.pdf','admin','2012-03-23 11:26:51',1),(42,'Virtual Memory','os-ch9-Virtual_Memory-2.pdf','admin','2012-03-23 11:32:35',1),(43,'deadlock','os-ch7-Deadlocks-2.pdf','admin','2012-03-23 11:34:59',1),(44,'c++','C++ Classes Tutorials.ppt','admin','2012-03-23 11:37:54',7),(45,'IC','Introduction_to_IC.pdf','manushi doshi','2012-03-23 11:47:27',5),(46,'CN','cn.pdf','dhrumit sheth','2012-03-23 13:46:24',1),(47,'DAA','da06-Introduction.ppt','admin','2012-04-16 12:37:01',3);

/*Table structure for table `news_master` */

DROP TABLE IF EXISTS `news_master`;

CREATE TABLE `news_master` (
  `news_id` int(20) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(200) DEFAULT NULL,
  `news_date` date DEFAULT NULL,
  `news_details` longtext,
  `news_postedby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `news_master` */

insert  into `news_master`(`news_id`,`news_title`,`news_date`,`news_details`,`news_postedby`) values (1,'Social Media Optimization','2012-03-02','The best place of discussions for Social Media enthusiasts. A lot to discuss, a lot to learn & a lot to understand. Way to future - Social Media!','admin'),(2,'High global ranking by alexa but less local ranking','2012-02-21','Hi,I am working on a project of maintenance of a website and its SEO. Now the website has got over 500 linkings and also it has a very high global rank by alexa of about 500000 but its Indian Rank is only 80000 what could be the issue ?What steps should i take ?Besides this the views from India according to analytics is pretty high and it is an India based company !!','admin'),(3,' iPhone Learning Group','2012-02-22','hi, I think what you are trying to say is whenever a person selects a item from picker it should be shown in the table view but then what is the use of text view ? Also are you planning to go for a database because using that it will be easily…','admin'),(4,'Java Learning Group','2012-02-12','Welcome to group of people who share a common interest in Java technology and meet on a regular basis to share technical ideas and information.','admin'),(5,'iPhone Learning Group','2012-02-13','A group to learn A-Z of iPhone programming and application development. Learn from basics of OOP concept, Objective C, UI Elements and much more.','admin'),(6,'Ethical Hacking','2012-02-18','The practice of breaking into computers without malicious intent, simply to find security hazards and report them to the people responsible.','admin'),(7,'Exam Support','2012-02-11','We will clear your doubts - both technical as well as general in this group. Ask us questions, and you will get a quick reply.','admin'),(8,'Learn Joomla','2012-02-15','Joomla is a free, open-source content management system (CMS) and application framework that powers 2.7% of the entire web. With a vibrant volunteer community, user-friendly features and plenty of power','admin'),(9,'Learn Drupal','2012-02-12','Drupal is a free software package that allows anyone to easily publish, manage and organize a wide variety of content on a website. Hundreds of thousands of people and organizations are using Drupal to power an endless variety of sites.','admin'),(10,'how to develope an facebook app?','2012-02-21','can any one tell me that how to develope facebook apps? And it is coded in which language? and how can I learn that??','admin'),(11,'Linux Group','2012-03-01','A group for Open Source enthusiasts. We support discussions on all the Linux flavors - be it Ubuntu, Fedora or any other great product.','admin'),(12,'HTML5','2012-03-01','HTML5 is a language for structuring and presenting content for the world wide web,core technology of the internet. It is the fifth revision of the HTML standard.','admin'),(13,'Computer Security','2012-02-23','Computer security is a branch of computer technology known as information security as applied to computers and networks. The objective includes protection of information and property from theft, corruption, or natural disaster.','admin'),(14,'My BLog','2012-02-25','.Net With C# CornerThis Blog Is Help To Create Windows Application and Web Application In .Net With C# Technology..Net With C# Corner','admin'),(15,'How to protect your iPhone from loss?','2012-02-26','By Jason D. O\'Grady | December 8, 2010, 12:01am PST.Summary: After successfully recovering my lost iPhone I wanted to share some tips on how to protect your iPhone from loss and how to get it back if you do. In case you haven’t been following the drama, on Saturday I lost my iPhone and on Monday I got it back.','admin');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(20) DEFAULT NULL,
  `user_lname` varchar(20) DEFAULT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(30) DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_gender` varchar(2) DEFAULT NULL,
  `user_address` tinytext,
  `user_occupation` varchar(20) DEFAULT NULL,
  `user_status` char(1) DEFAULT NULL,
  `user_profilepic` varchar(30) DEFAULT NULL,
  `user_qualifications` tinytext,
  `user_about` longtext,
  `user_created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`user_id`,`user_fname`,`user_lname`,`user_email`,`user_password`,`user_birthdate`,`user_gender`,`user_address`,`user_occupation`,`user_status`,`user_profilepic`,`user_qualifications`,`user_about`,`user_created_date`) values (1,'vrajesh','trivedi','vrajeshtrivedi7@gmail.com','123456','1991-08-31','m',NULL,'s','n',NULL,NULL,NULL,'2012-02-29 11:05:39'),(2,'rushabh','shah','rushabh780@gmail.com','485153','1990-02-06','m',NULL,'s','y',NULL,NULL,NULL,'2012-02-29 00:18:42'),(3,'dhrumit','sheth','dhruvsheth7@gmail.com','741001','1990-07-08','m',NULL,'s','n',NULL,NULL,NULL,'2012-02-29 00:27:00'),(4,'manushi','doshi','manushidoshi@gmail.com','333333','1990-08-21','f',NULL,'s','n',NULL,NULL,NULL,'2012-02-29 11:07:22'),(5,'vrushit','sheth','adinathoffset@gmail.com','923975','1987-01-11','m',NULL,'s',NULL,NULL,NULL,NULL,'2012-02-29 11:09:45'),(6,'rushabh','shah','rushabh780@gmail.com','485153','2012-02-29','m',NULL,'s','y',NULL,NULL,NULL,'2012-02-29 23:33:42'),(7,'rushabh','shah','rushabh780@gmail.com','485153','2012-03-01','m',NULL,'s','y',NULL,NULL,NULL,'2012-03-01 00:03:03'),(8,'prushni','joshi','jprushni@gmail.com','223345','1990-10-17','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 14:42:06'),(9,'prushni','joshi','j.prushni@yahoo.com','111111','1990-10-17','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 14:52:09'),(10,'manushi','doshi','doshi_mili@yahoo.com','123456','1990-08-21','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 15:04:09'),(11,'shweta','pathak','jaigirirajcotton@gmail.com','234123','1990-02-16','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 15:34:08'),(12,'mansi','kalaria','kalariamansi@gmail.com','456345','1990-03-27','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 15:35:10'),(13,'mili','doshi','md2108@rediffmail.com','467234','1994-10-30','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 15:59:23'),(14,'prushni','joshi','jprushni@gmail.com','678563','1990-10-17','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 16:02:02'),(15,'manushi','doshi','manushidoshi@gmail.com','236785','1990-08-21','f',NULL,'s','n',NULL,NULL,NULL,'2012-03-01 16:05:45'),(16,'rushabh','shah','rushabh780@gmail.com','485153','2012-03-05','m',NULL,'s','y',NULL,NULL,NULL,'2012-03-05 13:29:03'),(17,'rushabh','shah','rushabh780@gmail.com','485153','2012-03-05','m',NULL,'s','y',NULL,NULL,NULL,'2012-03-05 13:32:07'),(18,'rus','dsf','rushabh780@gmail.com','485153','2012-03-05','m',NULL,'s','y',NULL,NULL,NULL,'2012-03-05 13:35:57'),(19,'Jay','Mehta','dhruvsheth7@gmail.com','741001','2012-03-06','m',NULL,'s','n',NULL,NULL,NULL,'2012-03-05 14:12:35'),(20,'Pratik','Thacker','pratik.thacker1@gmail.com','316428','2012-02-28','m',NULL,'s','y',NULL,NULL,NULL,'2012-03-05 15:03:49'),(21,'Darshan','Dagli','deep_thinker007@yahoo.com','834648','2012-03-05','m',NULL,'p','y',NULL,NULL,NULL,'2012-03-06 22:04:39'),(22,'Jigar','Parmar','daglidd@gmail.com','35818','1990-11-28','m',NULL,'s','y',NULL,NULL,NULL,'2012-03-06 22:22:51'),(23,'Dhruv','Sheth','vishal90.ce@gmail.com','498222','2012-03-06','m',NULL,'s','n',NULL,NULL,NULL,'2012-03-23 13:40:06'),(24,'Dhruv','Sheth','vishal90.ce@gmail.com','498222','2012-03-06','m',NULL,'s','n',NULL,NULL,NULL,'2012-03-23 13:40:35'),(25,'Dhruv','Sheth','dhruvsheth7@gmail.com','741001','2012-03-07','m',NULL,'s','n',NULL,NULL,NULL,'2012-03-23 13:50:32'),(26,'Dhruv','Sheth','dhruvsheth7@gmail.com','741001','2012-03-07','m',NULL,'s','n',NULL,NULL,NULL,'2012-03-23 13:51:38');

/*Table structure for table `user_subject` */

DROP TABLE IF EXISTS `user_subject`;

CREATE TABLE `user_subject` (
  `subject_id` int(20) NOT NULL AUTO_INCREMENT,
  `course_id` int(20) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_subject` */

/*Table structure for table `video_master` */

DROP TABLE IF EXISTS `video_master`;

CREATE TABLE `video_master` (
  `vid_id` int(20) NOT NULL AUTO_INCREMENT,
  `vid_title` varchar(200) DEFAULT NULL,
  `vid_file` varchar(50) DEFAULT NULL,
  `vid_postedby` varchar(100) DEFAULT NULL,
  `vid_datestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `subject_id` int(20) NOT NULL,
  PRIMARY KEY (`vid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `video_master` */

insert  into `video_master`(`vid_id`,`vid_title`,`vid_file`,`vid_postedby`,`vid_datestamp`,`subject_id`) values (21,'Sehwag','sehwag.flv','dhrumit sheth','2012-03-06 21:54:13',1),(22,'Race','race.3gp','dhrumit sheth','2012-03-06 21:56:27',1),(23,'Dil Le Gayi','Dil Le Gai.mp4','Darshan Dagli','2012-03-06 22:13:46',1),(24,'','3 Idiots - Give Me Some Sunshine.mkv','dhrumit sheth','2012-03-06 22:37:09',14),(25,'Change window title','Change Internet Explorer Window.wmv','dhrumit sheth','2012-03-06 22:38:32',1),(26,'ABc','Abc.wmv','dhrumit sheth','2012-03-07 10:55:55',1),(27,'FB','Facebook.mp4','admin','2012-03-23 11:39:06',1),(28,'FB','Facebook.mp4','admin','2012-03-23 11:42:58',4),(29,'Kur','Kurbaan-Shukran.mp4','admin','2012-04-16 12:39:22',1),(30,'abc','Do Dhaari.mp4','admin','2012-04-16 12:40:54',1),(31,'','','manushi doshi','2012-04-16 12:42:17',1),(32,'IR','Iishq Rish.mp4','manushi doshi','2012-04-16 12:43:21',1),(33,'ac','POc.mp4','manushi doshi','2012-04-16 12:45:23',1),(34,'pirates','POc.mp4','manushi doshi','2012-04-16 12:47:14',11);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
