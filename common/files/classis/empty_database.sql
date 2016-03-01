-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 01, 2016 at 10:21 AM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `empty_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE IF NOT EXISTS `accomodation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `community_id` int(10) unsigned NOT NULL,
  `roomcategory` char(2) NOT NULL DEFAULT '',
  `building` char(2) NOT NULL DEFAULT '',
  `room` varchar(4) NOT NULL DEFAULT '',
  `bed` varchar(4) NOT NULL DEFAULT '',
  `invoice` varchar(80) DEFAULT NULL,
  `bookingdate` date DEFAULT NULL,
  `arrivaldate` date DEFAULT NULL,
  `arrivaltime` time DEFAULT NULL,
  `arrivalairport` varchar(240) NOT NULL DEFAULT '',
  `arrivalflight` varchar(240) NOT NULL DEFAULT '',
  `departuredate` date DEFAULT NULL,
  `departuretime` time DEFAULT NULL,
  `departureairport` varchar(240) NOT NULL DEFAULT '',
  `departureflight` varchar(240) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_student` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(160) NOT NULL DEFAULT '',
  `neighbourhood` varchar(160) NOT NULL DEFAULT '',
  `region` varchar(160) NOT NULL DEFAULT '',
  `postcode` varchar(8) NOT NULL DEFAULT '',
  `country` varchar(40) NOT NULL DEFAULT '',
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_address` (`region`(5))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE IF NOT EXISTS `assessment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(10) NOT NULL DEFAULT '%',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `method` char(3) NOT NULL DEFAULT '',
  `element` char(3) NOT NULL DEFAULT '',
  `description` varchar(60) NOT NULL DEFAULT '',
  `label` varchar(40) NOT NULL DEFAULT '',
  `resultqualifier` char(2) NOT NULL DEFAULT '',
  `resultstatus` enum('R','T','E','S') NOT NULL DEFAULT 'R',
  `outoftotal` smallint(5) unsigned NOT NULL DEFAULT '0',
  `derivation` varchar(60) NOT NULL DEFAULT '',
  `statistics` enum('N','Y') NOT NULL,
  `grading_name` varchar(20) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '%',
  `component_status` enum('None','N','V','O','AV','A') NOT NULL DEFAULT 'None',
  `strand_status` enum('None','N','V','O','AV','A') NOT NULL DEFAULT 'None',
  `year` year(4) NOT NULL DEFAULT '0000',
  `season` enum('','S','W','M','1','2','3','4','5','6','7','8','9','a','b','c') NOT NULL,
  `creation` date NOT NULL DEFAULT '0000-00-00',
  `deadline` date NOT NULL DEFAULT '0000-00-00',
  `profile_name` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_subject` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `event_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('a','p') NOT NULL DEFAULT 'a',
  `code` char(2) NOT NULL DEFAULT '',
  `late` enum('0','1','2','3','4','5','U') NOT NULL DEFAULT '0',
  `comment` text,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_booking`
--

CREATE TABLE IF NOT EXISTS `attendance_booking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` enum('1','2','3','4','5','6','7','%') NOT NULL DEFAULT '%',
  `session` enum('AM','PM') NOT NULL DEFAULT 'AM',
  `status` enum('a','p') NOT NULL DEFAULT 'p',
  `code` char(2) NOT NULL DEFAULT '',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `indexsidcomid` (`student_id`,`community_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `background`
--

CREATE TABLE IF NOT EXISTS `background` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `type` char(3) NOT NULL DEFAULT '',
  `entrydate` date DEFAULT NULL,
  `yeargroup_id` smallint(6) NOT NULL DEFAULT '0',
  `detail` text NOT NULL,
  `category` varchar(100) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_student` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categorydef`
--

CREATE TABLE IF NOT EXISTS `categorydef` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(240) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT '',
  `subtype` varchar(20) NOT NULL DEFAULT '',
  `rating` smallint(6) NOT NULL DEFAULT '0',
  `rating_name` varchar(30) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `section_id` smallint(6) NOT NULL DEFAULT '0',
  `othertype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cidsid`
--

CREATE TABLE IF NOT EXISTS `cidsid` (
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `detail` varchar(240) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `cohort_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bid` (`subject_id`),
  KEY `index_crid` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `generate` enum('','forms','sets','none') NOT NULL DEFAULT '',
  `naming` varchar(40) NOT NULL DEFAULT '',
  `many` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dp` smallint(5) unsigned NOT NULL DEFAULT '0',
  `block` char(3) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `formgroup` enum('N','Y') NOT NULL,
  PRIMARY KEY (`course_id`,`subject_id`,`stage`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cohidcomid`
--

CREATE TABLE IF NOT EXISTS `cohidcomid` (
  `cohort_id` int(10) unsigned NOT NULL DEFAULT '0',
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cohort_id`,`community_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cohort`
--

CREATE TABLE IF NOT EXISTS `cohort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  `season` enum('','S','W','M','1','2','3','4','5','6','7','8','9','a','b','c') NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexcohort` (`course_id`,`stage`,`year`,`season`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comidsid`
--

CREATE TABLE IF NOT EXISTS `comidsid` (
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `joiningdate` date DEFAULT NULL,
  `leavingdate` date DEFAULT NULL,
  `special` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`community_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `entrydate` date DEFAULT NULL,
  `yeargroup_id` smallint(6) NOT NULL DEFAULT '0',
  `category` varchar(100) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `guardians` enum('0','1') NOT NULL DEFAULT '0',
  `incident_id` int(10) unsigned NOT NULL DEFAULT '0',
  `merit_id` int(10) unsigned NOT NULL DEFAULT '0',
  `eidsid_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_student` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE IF NOT EXISTS `community` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `type` enum('','academic','family','form','year','tutor','alumni','enquired','applied','accepted','trip','reg','transport','extra','house','accomodation') NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  `season` enum('','S','W','M','1','2','3','4','5','6','7','8','9','a','b','c') NOT NULL DEFAULT '',
  `capacity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `detail` varchar(240) NOT NULL DEFAULT '',
  `charge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `chargetype` enum('0','1','2') DEFAULT NULL,
  `sessions` varchar(240) NOT NULL DEFAULT '',
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indexcom` (`type`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE IF NOT EXISTS `component` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `status` enum('N','V','U') NOT NULL DEFAULT 'N',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(5) unsigned NOT NULL DEFAULT '1',
  `year` year(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`,`course_id`,`subject_id`,`year`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  `generate` enum('','forms','sets','none') NOT NULL DEFAULT '',
  `naming` varchar(40) NOT NULL DEFAULT '',
  `many` smallint(5) unsigned NOT NULL DEFAULT '4',
  `nextcourse_id` varchar(10) NOT NULL DEFAULT '',
  `endmonth` enum('','1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `derivation`
--

CREATE TABLE IF NOT EXISTS `derivation` (
  `resultid` int(10) unsigned NOT NULL DEFAULT '0',
  `operandid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('A','M','R','S') NOT NULL DEFAULT 'A',
  `element` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`resultid`,`operandid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eidmid`
--

CREATE TABLE IF NOT EXISTS `eidmid` (
  `assessment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `resultstatus` enum('I','R','T','P','E') NOT NULL,
  `result` char(3) NOT NULL DEFAULT '',
  `examboard` char(3) NOT NULL DEFAULT '',
  `examsyllabus` char(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`assessment_id`,`mark_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eidsid`
--

CREATE TABLE IF NOT EXISTS `eidsid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `assessment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `resultstatus` enum('','I','P') NOT NULL,
  `result` varchar(30) NOT NULL DEFAULT '',
  `value` float NOT NULL DEFAULT '0',
  `weight` smallint(5) unsigned NOT NULL DEFAULT '1',
  `examboard` char(3) NOT NULL DEFAULT '',
  `examsyllabus` char(6) NOT NULL DEFAULT '',
  `examcenter` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_result` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `session` enum('AM','PM') NOT NULL DEFAULT 'AM',
  `period` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexeve` (`date`,`session`,`period`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_notice`
--

CREATE TABLE IF NOT EXISTS `event_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `session` enum('AM','PM') NOT NULL DEFAULT 'AM',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_notidcomid`
--

CREATE TABLE IF NOT EXISTS `event_notidcomid` (
  `notice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  `yeargroup_id` smallint(6) NOT NULL DEFAULT '0',
  `seen` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`notice_id`,`community_id`,`yeargroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exclusions`
--

CREATE TABLE IF NOT EXISTS `exclusions` (
  `student_id` int(10) unsigned NOT NULL,
  `category` enum('F','P','L') NOT NULL DEFAULT 'F',
  `reason` text NOT NULL,
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `session` enum('NA','AM','PM') NOT NULL,
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `appeal` enum('N','Y') NOT NULL,
  `appealdate` date NOT NULL DEFAULT '0000-00-00',
  `appealresult` enum('','R','S') NOT NULL DEFAULT '',
  PRIMARY KEY (`student_id`,`startdate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fees_account`
--

CREATE TABLE IF NOT EXISTS `fees_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guardian_id` int(10) unsigned NOT NULL DEFAULT '0',
  `accountname` varbinary(120) NOT NULL DEFAULT '',
  `bankname` varbinary(120) NOT NULL DEFAULT '',
  `bankcountry` varbinary(20) NOT NULL DEFAULT '',
  `bankcode` varbinary(40) NOT NULL DEFAULT '',
  `bankbranch` varbinary(40) NOT NULL DEFAULT '',
  `bankcontrol` varbinary(20) NOT NULL DEFAULT '',
  `banknumber` varbinary(60) NOT NULL DEFAULT '',
  `valid` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gid` (`guardian_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_applied`
--

CREATE TABLE IF NOT EXISTS `fees_applied` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(240) NOT NULL DEFAULT '',
  `tarif_id` int(10) unsigned NOT NULL DEFAULT '0',
  `paymenttype` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_sid` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_charge`
--

CREATE TABLE IF NOT EXISTS `fees_charge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `note` varchar(240) NOT NULL DEFAULT '',
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `catalogue_id` int(10) unsigned NOT NULL DEFAULT '0',
  `budget_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tarif_id` int(10) unsigned NOT NULL DEFAULT '0',
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  `paymenttype` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  `payment` enum('0','1','2') NOT NULL DEFAULT '0',
  `paymentdate` date NOT NULL DEFAULT '0000-00-00',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remittance_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_sid` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_concept`
--

CREATE TABLE IF NOT EXISTS `fees_concept` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(240) NOT NULL DEFAULT '',
  `inactive` enum('0','1') NOT NULL DEFAULT '0',
  `community_type` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_invoice`
--

CREATE TABLE IF NOT EXISTS `fees_invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series` varchar(8) NOT NULL DEFAULT '0',
  `reference` varchar(240) NOT NULL DEFAULT '',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remittance_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `refno` (`series`,`reference`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_remittance`
--

CREATE TABLE IF NOT EXISTS `fees_remittance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(240) NOT NULL DEFAULT '',
  `concepts` varchar(240) NOT NULL DEFAULT '',
  `yeargroups` varchar(240) NOT NULL DEFAULT '',
  `enrolstatus` char(3) NOT NULL DEFAULT 'C',
  `duedate` date NOT NULL DEFAULT '0000-00-00',
  `issuedate` date NOT NULL DEFAULT '0000-00-00',
  `year` year(4) NOT NULL DEFAULT '0000',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_tarif`
--

CREATE TABLE IF NOT EXISTS `fees_tarif` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(240) NOT NULL DEFAULT '',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` enum('s','g','u','c') NOT NULL,
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `originalname` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `access` varchar(20) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT '0',
  `other_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fileowner` (`owner`,`owner_id`,`folder_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `file_folder`
--

CREATE TABLE IF NOT EXISTS `file_folder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` enum('s','g','u') NOT NULL,
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `access` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `folderowner` (`owner`,`owner_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gidaid`
--

CREATE TABLE IF NOT EXISTS `gidaid` (
  `guardian_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `priority` smallint(5) unsigned NOT NULL,
  `addresstype` enum('H','W','V','O') NOT NULL,
  PRIMARY KEY (`guardian_id`,`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gidsid`
--

CREATE TABLE IF NOT EXISTS `gidsid` (
  `guardian_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `priority` enum('0','1','2','3','4') NOT NULL,
  `mailing` enum('0','1','2','3','4') NOT NULL,
  `relationship` enum('NOT','CAR','DOC','FAM','OTH','PAM','PAF','STP','REL','SWR','HFA','AGN','GRM','GRF','TUT') NOT NULL,
  `responsibility` enum('N','Y') NOT NULL,
  `paymenttype` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  PRIMARY KEY (`guardian_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `grading`
--

CREATE TABLE IF NOT EXISTS `grading` (
  `name` varchar(20) NOT NULL DEFAULT '',
  `grades` text NOT NULL,
  `comment` text NOT NULL,
  `author` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `yeargroup_id` smallint(6) DEFAULT NULL,
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('a','p','b','s','u','c') NOT NULL DEFAULT 'a',
  PRIMARY KEY (`gid`),
  KEY `index_crid` (`course_id`),
  KEY `index_bid` (`subject_id`),
  KEY `index_yid` (`yeargroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `guardian`
--

CREATE TABLE IF NOT EXISTS `guardian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(120) NOT NULL DEFAULT '',
  `forename` varchar(120) NOT NULL DEFAULT '',
  `middlenames` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `addresstitle` varchar(120) NOT NULL DEFAULT '',
  `gender` enum('F','M') NOT NULL,
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `translator` enum('N','Y') NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  `nationality` char(2) NOT NULL DEFAULT '',
  `email` varchar(240) NOT NULL DEFAULT '',
  `epfusername` varchar(128) NOT NULL DEFAULT '',
  `profession` varchar(120) NOT NULL DEFAULT '',
  `companyname` varchar(240) NOT NULL DEFAULT '',
  `education` varchar(240) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `code` varchar(120) NOT NULL DEFAULT '',
  `private` enum('N','Y') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`surname`(5),`forename`(5)),
  KEY `index_forename` (`forename`(5))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(10) unsigned DEFAULT NULL,
  `page` varchar(60) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE IF NOT EXISTS `homework` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `refs` text NOT NULL,
  `def_name` varchar(20) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `author` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_crid` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `incidenthistory`
--

CREATE TABLE IF NOT EXISTS `incidenthistory` (
  `incident_id` int(10) unsigned NOT NULL,
  `entryn` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `category` varchar(30) NOT NULL DEFAULT '',
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `entrydate` date NOT NULL,
  PRIMARY KEY (`incident_id`,`entryn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE IF NOT EXISTS `incidents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `entrydate` date DEFAULT NULL,
  `yeargroup_id` smallint(6) NOT NULL DEFAULT '0',
  `category` varchar(30) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `closed` enum('N','Y') NOT NULL,
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_student` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE IF NOT EXISTS `info` (
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `upn` char(20) NOT NULL DEFAULT '',
  `formerupn` char(20) NOT NULL DEFAULT '',
  `otherpn1` varchar(40) NOT NULL DEFAULT '',
  `otherpn2` varchar(40) NOT NULL DEFAULT '',
  `enrolstatus` enum('EN','AP','AT','ATD','ACP','AC','RE','CA','WL','C','P','G','S','M') NOT NULL DEFAULT 'C',
  `entrydate` date DEFAULT NULL,
  `leavingdate` date DEFAULT NULL,
  `email` varchar(240) NOT NULL DEFAULT '',
  `epfusername` varchar(128) NOT NULL DEFAULT '',
  `phonenumber` varchar(22) NOT NULL DEFAULT '',
  `parttime` enum('N','Y') NOT NULL,
  `boarder` char(2) NOT NULL DEFAULT 'N',
  `nationality` char(2) NOT NULL DEFAULT '',
  `secondnationality` char(2) NOT NULL DEFAULT '',
  `birthplace` varchar(240) NOT NULL DEFAULT '',
  `countryoforigin` char(2) NOT NULL DEFAULT '',
  `ethnicity` char(4) NOT NULL DEFAULT '',
  `language` char(4) NOT NULL DEFAULT '',
  `languagetype` enum('NOT','F','M','H','T','S','C') NOT NULL,
  `religion` enum('NOT','NO','BU','CH','HI','JE','MU','SI','OT') NOT NULL,
  `reledu` enum('A','W') NOT NULL,
  `relwor` enum('A','W') NOT NULL,
  `sen` enum('N','Y') NOT NULL,
  `medical` enum('N','Y') NOT NULL,
  `incare` enum('N','Y') NOT NULL,
  `transportmode` enum('NOT','F','C','T','B','S') NOT NULL,
  `staffchild` enum('N','Y') NOT NULL,
  `appnotes` text NOT NULL,
  `appcategory` varchar(240) NOT NULL DEFAULT '',
  `appdate` date DEFAULT NULL,
  `siblings` enum('N','Y') NOT NULL,
  `passportdate` date NOT NULL DEFAULT '0000-00-00',
  `candidaten1` varchar(40) NOT NULL DEFAULT '',
  `candidaten2` varchar(40) NOT NULL DEFAULT '',
  `language2` char(4) NOT NULL DEFAULT '',
  `languagetype2` enum('NOT','F','M','H','T','S','C') NOT NULL,
  `language3` char(4) NOT NULL DEFAULT '',
  `languagetype3` enum('NOT','F','M','H','T','S','C') NOT NULL,
  `previousschool` varchar(240) NOT NULL DEFAULT '',
  `leavingreason` varchar(240) NOT NULL DEFAULT '',
  PRIMARY KEY (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `levelling`
--

CREATE TABLE IF NOT EXISTS `levelling` (
  `name` varchar(20) NOT NULL DEFAULT '',
  `levels` varchar(200) NOT NULL DEFAULT '',
  `grading_name` varchar(20) NOT NULL DEFAULT '',
  `comment` text,
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `author` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`course_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE IF NOT EXISTS `mark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entrydate` date NOT NULL DEFAULT '0000-00-00',
  `marktype` enum('score','sum','average','level','dif','compound','report','hw') NOT NULL,
  `topic` varchar(60) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `def_name` varchar(20) NOT NULL DEFAULT '',
  `midlist` text,
  `levelling_name` varchar(20) NOT NULL DEFAULT '',
  `total` smallint(5) unsigned NOT NULL DEFAULT '0',
  `assessment` enum('no','yes','other') NOT NULL,
  `author` varchar(14) NOT NULL DEFAULT '',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `markdef`
--

CREATE TABLE IF NOT EXISTS `markdef` (
  `name` varchar(20) NOT NULL DEFAULT '',
  `scoretype` enum('value','grade','percentage','comment') NOT NULL DEFAULT 'value',
  `outoftotal` smallint(5) unsigned NOT NULL DEFAULT '0',
  `grading_name` varchar(20) NOT NULL DEFAULT '',
  `comment` text,
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `author` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`course_id`,`name`),
  KEY `index_bid` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meals_booking`
--

CREATE TABLE IF NOT EXISTS `meals_booking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `meal_id` int(10) unsigned NOT NULL DEFAULT '0',
  `day` enum('1','2','3','4','5','6','7','%') NOT NULL DEFAULT '%',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `indexsidmid` (`student_id`,`meal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `meals_list`
--

CREATE TABLE IF NOT EXISTS `meals_list` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `time` varchar(14) NOT NULL DEFAULT '',
  `day` enum('1','2','3','4','5','6','7','%') NOT NULL DEFAULT '%',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `merits`
--

CREATE TABLE IF NOT EXISTS `merits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `year` year(4) NOT NULL DEFAULT '0000',
  `activity` varchar(100) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `result` varchar(30) NOT NULL DEFAULT '',
  `value` smallint(6) NOT NULL DEFAULT '0',
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_result` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_event`
--

CREATE TABLE IF NOT EXISTS `message_event` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_to_send` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sent_time` datetime DEFAULT NULL,
  `id_user` bigint(20) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT 'unknown',
  `sender` varchar(50) NOT NULL DEFAULT '',
  `recipient` text NOT NULL,
  `headers` text NOT NULL,
  `body` longtext NOT NULL,
  `try_sent` tinyint(4) NOT NULL DEFAULT '0',
  `delete_after_send` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `time_to_send` (`time_to_send`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_text_event`
--

CREATE TABLE IF NOT EXISTS `message_text_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `some_id` int(10) unsigned NOT NULL DEFAULT '0',
  `texttype` enum('s','g','u') NOT NULL,
  `phonenumber` varchar(22) NOT NULL DEFAULT '',
  `textbody` text NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `success` enum('0','1') NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `try` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `midcid`
--

CREATE TABLE IF NOT EXISTS `midcid` (
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `mark_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_id`,`mark_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderaction`
--

CREATE TABLE IF NOT EXISTS `orderaction` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entryn` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action` enum('1','2','3','4','5') NOT NULL,
  `detail` text NOT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `actiondate` date NOT NULL,
  PRIMARY KEY (`order_id`,`entryn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderbudget`
--

CREATE TABLE IF NOT EXISTS `orderbudget` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL DEFAULT '0',
  `code` varchar(8) NOT NULL DEFAULT '',
  `yearcode` char(2) NOT NULL DEFAULT '',
  `name` varchar(160) NOT NULL DEFAULT '',
  `costlimit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `section_id` smallint(6) NOT NULL DEFAULT '0',
  `overbudget_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexbudget` (`code`,`yearcode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ordercatalogue`
--

CREATE TABLE IF NOT EXISTS `ordercatalogue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalogue_id` int(10) unsigned NOT NULL DEFAULT '0',
  `unitcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `currency` enum('0','1','2','3','4') NOT NULL,
  `detail` text NOT NULL,
  `refno` varchar(240) NOT NULL DEFAULT '',
  `isbn` varchar(240) NOT NULL DEFAULT '',
  `materialtype` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_mat` (`materialtype`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderinvoice`
--

CREATE TABLE IF NOT EXISTS `orderinvoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoicedate` date NOT NULL,
  `reference` varchar(40) NOT NULL DEFAULT '',
  `deliverycost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `taxcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `discountcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `totalcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `debitcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `currency` enum('0','1','2','3','4') NOT NULL,
  `credit` tinyint(1) NOT NULL DEFAULT '0',
  `exchange` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ordermaterial`
--

CREATE TABLE IF NOT EXISTS `ordermaterial` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entryn` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `unitcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `refno` varchar(240) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `materialtype` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalogue_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`entryn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orderorder`
--

CREATE TABLE IF NOT EXISTS `orderorder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalogue_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entrydate` date NOT NULL,
  `ordertype` enum('0','1','2','3','4','5') NOT NULL,
  `currency` enum('0','1','2','3','4') NOT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ordersupplier`
--

CREATE TABLE IF NOT EXISTS `ordersupplier` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL DEFAULT '',
  `phonenumber1` varchar(22) NOT NULL DEFAULT '',
  `phonenumber2` varchar(22) NOT NULL DEFAULT '',
  `phonenumber3` varchar(22) NOT NULL DEFAULT '',
  `email` varchar(240) NOT NULL DEFAULT '',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `specialaction` enum('0','1','2') NOT NULL DEFAULT '0',
  `inactive` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `perms`
--

CREATE TABLE IF NOT EXISTS `perms` (
  `uid` int(10) NOT NULL DEFAULT '0',
  `gid` int(10) NOT NULL DEFAULT '0',
  `r` set('0','1') NOT NULL DEFAULT '0',
  `w` set('0','1') NOT NULL DEFAULT '0',
  `x` set('0','1') NOT NULL DEFAULT '0',
  `e` set('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `some_id` int(10) unsigned NOT NULL DEFAULT '0',
  `number` varchar(22) NOT NULL DEFAULT '',
  `phonetype` enum('H','M','W','F','O','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_id` (`some_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `descriptor` varchar(30) NOT NULL DEFAULT '',
  `longdescriptor` varchar(250) NOT NULL DEFAULT '',
  `value` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `deadline` date NOT NULL DEFAULT '0000-00-00',
  `comment` text,
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `subject_status` enum('None','N','V','O','AV','A') NOT NULL DEFAULT 'None',
  `component_status` enum('None','N','V','O','AV','A') NOT NULL DEFAULT 'None',
  `addcomment` enum('no','yes') NOT NULL DEFAULT 'no',
  `commentlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `commentcomp` enum('no','yes') NOT NULL DEFAULT 'no',
  `addcategory` enum('no','yes') NOT NULL DEFAULT 'no',
  `style` varchar(60) NOT NULL DEFAULT '',
  `transform` varchar(60) NOT NULL DEFAULT '',
  `rating_name` text NOT NULL,
  `year` year(4) NOT NULL DEFAULT '0000',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reportentry`
--

CREATE TABLE IF NOT EXISTS `reportentry` (
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `entryn` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `component_id` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(60) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `category` text NOT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`report_id`,`student_id`,`subject_id`,`component_id`,`entryn`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

CREATE TABLE IF NOT EXISTS `report_event` (
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `success` enum('0','1') NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `try` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`report_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_skill`
--

CREATE TABLE IF NOT EXISTS `report_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `subtype` varchar(20) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_profile` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_skill_log`
--

CREATE TABLE IF NOT EXISTS `report_skill_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `skill_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `value` smallint(6) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_skill` (`skill_id`),
  KEY `index_student` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ridcatid`
--

CREATE TABLE IF NOT EXISTS `ridcatid` (
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `categorydef_id` int(10) unsigned NOT NULL DEFAULT '0',
  `subject_id` varchar(10) NOT NULL DEFAULT '%',
  PRIMARY KEY (`report_id`,`categorydef_id`,`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rideid`
--

CREATE TABLE IF NOT EXISTS `rideid` (
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `assessment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`report_id`,`assessment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE IF NOT EXISTS `score` (
  `mark_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grade` smallint(6) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `comment` text,
  `outoftotal` smallint(5) unsigned NOT NULL DEFAULT '0',
  `extra` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  PRIMARY KEY (`mark_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(240) NOT NULL DEFAULT '',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sencurriculum`
--

CREATE TABLE IF NOT EXISTS `sencurriculum` (
  `senhistory_id` int(10) unsigned NOT NULL,
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `curriculum` enum('A','M','D') NOT NULL,
  `categorydef_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` text NOT NULL,
  `targets` text NOT NULL,
  `outcome` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`senhistory_id`,`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `senhistory`
--

CREATE TABLE IF NOT EXISTS `senhistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL,
  `senprovision` enum('N','A','P','Q','S') NOT NULL,
  `startdate` date DEFAULT NULL,
  `reviewdate` date DEFAULT NULL,
  `assessmentdate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_student` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sentype`
--

CREATE TABLE IF NOT EXISTS `sentype` (
  `student_id` int(10) unsigned NOT NULL,
  `entryn` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `senranking` enum('1','2','3') NOT NULL,
  `sentype` char(4) NOT NULL DEFAULT '',
  `senassessment` enum('I','E') NOT NULL,
  PRIMARY KEY (`student_id`,`entryn`,`senassessment`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(60) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '%',
  `assone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `asstwo_id` int(10) unsigned NOT NULL DEFAULT '0',
  `profile_name` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `statvalues`
--

CREATE TABLE IF NOT EXISTS `statvalues` (
  `stats_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stage` char(3) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '%',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  `m` float NOT NULL DEFAULT '0',
  `c` float NOT NULL DEFAULT '0',
  `error` float NOT NULL DEFAULT '0',
  `sd` float NOT NULL DEFAULT '0',
  `weight` float NOT NULL DEFAULT '0',
  `value1` float NOT NULL DEFAULT '0',
  `value2` float NOT NULL DEFAULT '0',
  `value3` float NOT NULL DEFAULT '0',
  `value4` float NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`stats_id`,`stage`,`subject_id`,`component_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(120) NOT NULL DEFAULT '',
  `forename` varchar(120) NOT NULL DEFAULT '',
  `middlenames` varchar(120) NOT NULL DEFAULT '',
  `surnamefirst` enum('Y','N') NOT NULL DEFAULT 'N',
  `middlenamelast` enum('Y','N') NOT NULL DEFAULT 'N',
  `preferredforename` varchar(30) NOT NULL DEFAULT '',
  `formersurname` varchar(120) NOT NULL DEFAULT '',
  `gender` enum('','M','F') NOT NULL DEFAULT '',
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `form_id` varchar(10) NOT NULL DEFAULT '',
  `yeargroup_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`surname`(5),`forename`(5)),
  KEY `index_forename` (`forename`(5))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tidcid`
--

CREATE TABLE IF NOT EXISTS `tidcid` (
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`teacher_id`,`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transport_booking`
--

CREATE TABLE IF NOT EXISTS `transport_booking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `journey_id` int(10) unsigned NOT NULL DEFAULT '0',
  `direction` enum('I','O') NOT NULL,
  `day` enum('1','2','3','4','5','6','7','%') NOT NULL DEFAULT '%',
  `status` enum('a','p') NOT NULL DEFAULT 'p',
  `startdate` date NOT NULL DEFAULT '0000-00-00',
  `enddate` date NOT NULL DEFAULT '0000-00-00',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `indexsidjid` (`student_id`,`journey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transport_bus`
--

CREATE TABLE IF NOT EXISTS `transport_bus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  `route_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `direction` enum('I','O') NOT NULL,
  `day` enum('1','2','3','4','5','6','7','%') NOT NULL DEFAULT '%',
  `departuretime` time DEFAULT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transport_journey`
--

CREATE TABLE IF NOT EXISTS `transport_journey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bus_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stop_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexjourney` (`bus_id`,`stop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transport_route`
--

CREATE TABLE IF NOT EXISTS `transport_route` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `transport_rtidstid`
--

CREATE TABLE IF NOT EXISTS `transport_rtidstid` (
  `route_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stop_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  `traveltime` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`route_id`,`stop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transport_stop`
--

CREATE TABLE IF NOT EXISTS `transport_stop` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL,
  `name` varchar(120) NOT NULL DEFAULT '',
  `detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `update_event`
--

CREATE TABLE IF NOT EXISTS `update_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  `export` enum('0','1') NOT NULL,
  `exportdate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(14) NOT NULL DEFAULT '',
  `passwd` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cookie` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `session` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `forename` varchar(50) NOT NULL DEFAULT '',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `emailuser` varchar(60) NOT NULL DEFAULT '',
  `emailpasswd` char(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `epfusername` varchar(128) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `firstbookpref` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `senrole` enum('0','1') NOT NULL,
  `medrole` enum('0','1') NOT NULL,
  `worklevel` enum('-1','0','1','2') NOT NULL DEFAULT '0',
  `nologin` tinyint(1) NOT NULL DEFAULT '0',
  `jobtitle` varchar(240) NOT NULL DEFAULT '',
  `personalemail` varchar(200) NOT NULL DEFAULT '',
  `homephone` varchar(22) NOT NULL DEFAULT '',
  `mobilephone` varchar(22) NOT NULL DEFAULT '',
  `personalcode` varchar(120) NOT NULL DEFAULT '',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `contractdate` date NOT NULL DEFAULT '0000-00-00',
  `education` varchar(240) NOT NULL DEFAULT '',
  `education2` varchar(240) NOT NULL DEFAULT '',
  `logcount` int(10) unsigned NOT NULL DEFAULT '0',
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  KEY `index_name` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yeargroup`
--

CREATE TABLE IF NOT EXISTS `yeargroup` (
  `id` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(20) NOT NULL DEFAULT '',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  `section_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
