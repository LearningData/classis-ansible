-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2016 at 05:03 PM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `classis`
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `privateaddress` enum('N','Y') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_address` (`region`(5))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admission_stats`
--

CREATE TABLE IF NOT EXISTS `admission_stats` (
  `name` varchar(40) NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  `count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  PRIMARY KEY (`name`,`year`,`date`),
  KEY `indexname` (`year`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE IF NOT EXISTS `api` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `device` varchar(130) NOT NULL DEFAULT '',
  `register_status` enum('0','1') NOT NULL DEFAULT '0',
  `register_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(100) NOT NULL DEFAULT '',
  `last_use` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `expire` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
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
  `label` varchar(12) NOT NULL DEFAULT '',
  `resultqualifier` char(2) NOT NULL DEFAULT '',
  `resultstatus` enum('R','T','E','S') NOT NULL DEFAULT 'R',
  `outoftotal` smallint(5) unsigned NOT NULL DEFAULT '0',
  `derivation` varchar(60) NOT NULL DEFAULT '',
  `statistics` enum('N','Y') NOT NULL,
  `grading_name` varchar(20) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '%',
  `component_status` enum('None','N','V','A') NOT NULL DEFAULT 'None',
  `strand_status` enum('None','N','V','A') NOT NULL DEFAULT 'None',
  `year` year(4) NOT NULL DEFAULT '0000',
  `season` enum('','S','W','M','1','2','3','4','5','6','7','8','9','a','b','c') NOT NULL,
  `creation` date NOT NULL DEFAULT '0000-00-00',
  `deadline` date NOT NULL DEFAULT '0000-00-00',
  `profile_name` varchar(60) NOT NULL DEFAULT '',
  `lock_level` enum('0','1','2') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_subject` (`subject_id`),
  KEY `indexcrid` (`course_id`),
  KEY `indexstage` (`stage`),
  KEY `indexyear` (`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `class_id` int(10) unsigned NOT NULL,
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categorydef`
--

CREATE TABLE IF NOT EXISTS `categorydef` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(720) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1132 ;

--
-- Dumping data for table `categorydef`
--

INSERT INTO `categorydef` (`id`, `name`, `type`, `subtype`, `rating`, `rating_name`, `comment`, `subject_id`, `course_id`, `stage`, `section_id`, `othertype`) VALUES
(1, 'current installed version', 'rel', '', 0, '', '2.0.27', '', '', '', 0, ''),
(2, 'previous installed version', 'rel', '', 0, '', '2.0.26', '', '', '', 0, ''),
(3, 'Attitude', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(4, 'Behaviour', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(5, 'Social', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(6, 'Organisation', 'rep', '', 0, 'simple three', '', '%', '%', '', 0, ''),
(7, 'Punctuality', 'rep', '', 0, 'simple three', '', '%', '%', '', 0, ''),
(8, 'Quality of Homework', 'rep', '', 0, 'simple three', '', '%', '%', '', 0, ''),
(9, 'Punctuality of Homework', 'rep', '', 0, 'simple three', '', '%', '%', '', 0, ''),
(10, 'Contributing to Class', 'rep', '', 0, 'simple three', '', '%', '%', '', 0, ''),
(11, 'Working to Potential', 'rep', '', 0, 'simple three', '', '%', '%', '', 0, ''),
(12, 'Telephone call', 'bac', '', 0, 'private', '', '%', '%', '', 0, ''),
(13, 'Email', 'bac', '', 0, 'private', '', '%', '%', '', 0, ''),
(14, 'Letter', 'bac', '', 0, 'private', '', '%', '%', '', 0, ''),
(15, 'Unknown', 'bac', '', 0, 'private', '', '%', '%', '', 0, ''),
(16, 'Form tutor', 'sig', 'form', 0, '', '', '%', '%', '', 0, ''),
(17, 'Year coordinator', 'sig', 'year', 1, '', '', '%', '%', '', 0, ''),
(18, 'Head of secondary', 'sig', 'section', 2, '', '', '%', '%', '', 0, ''),
(19, 'Attendance percentage', 'att', 'attendance', 0, '', '', '%', '%', '', 0, ''),
(23, 'background', 'ent', 'bac', 1, '', '', '%', '%', '', 0, ''),
(24, 'AS Level', 'met', 'AS', 0, '', '', '', 'AS', '', 0, ''),
(25, 'Examination/Post-14 Grade', 'rsq', 'EG', 0, '', '', '', 'AS', '', 0, ''),
(26, 'A2 Level', 'met', 'A2', 0, '', '', '', 'A2', '', 0, ''),
(27, 'Disapplied', 'met', 'DD', 0, '', '', '', 'KS2', '', 0, ''),
(28, 'Not Assessed', 'met', 'NA', 0, '', '', '', 'KS2', '', 0, ''),
(29, 'Teacher Assessment', 'met', 'TA', 0, '', '', '', 'KS2', '', 0, ''),
(30, 'Task/Test', 'met', 'TT', 0, '', '', '', 'KS2', '', 0, ''),
(31, 'National Curriculum Age Standardised Score', 'rsq', 'NA', 0, '', '', '', 'KS2', '', 0, ''),
(32, 'National Curriculum Level with Fine Grading', 'rsq', 'NF', 0, '', '', '', 'KS2', '', 0, ''),
(33, 'National Curriculum Level', 'rsq', 'NL', 0, '', '', '', 'KS2', '', 0, ''),
(34, 'National Curriculum Task/Test Mark', 'rsq', 'NM', 0, '', '', '', 'KS2', '', 0, ''),
(35, 'National Curriculum Test Raw Score', 'rsq', 'NR', 0, '', '', '', 'KS2', '', 0, ''),
(36, 'National Curriculum Summary (Aggregate) Mark', 'rsq', 'NS', 0, '', '', '', 'KS2', '', 0, ''),
(37, 'Disapplied', 'met', 'DD', 0, '', '', '', 'KS1', '', 0, ''),
(38, 'Not Assessed', 'met', 'NA', 0, '', '', '', 'KS1', '', 0, ''),
(39, 'Teacher Assessment', 'met', 'TA', 0, '', '', '', 'KS1', '', 0, ''),
(40, 'Task/Test', 'met', 'TT', 0, '', '', '', 'KS1', '', 0, ''),
(41, 'National Curriculum Age Standardised Score', 'rsq', 'NA', 0, '', '', '', 'KS1', '', 0, ''),
(42, 'National Curriculum Level with Fine Grading', 'rsq', 'NF', 0, '', '', '', 'KS1', '', 0, ''),
(43, 'National Curriculum Level', 'rsq', 'NL', 0, '', '', '', 'KS1', '', 0, ''),
(44, 'National Curriculum Task/Test Mark', 'rsq', 'NM', 0, '', '', '', 'KS1', '', 0, ''),
(45, 'National Curriculum Test Raw Score', 'rsq', 'NR', 0, '', '', '', 'KS1', '', 0, ''),
(46, 'National Curriculum Summary (Aggregate) Mark', 'rsq', 'NS', 0, '', '', '', 'KS1', '', 0, ''),
(47, 'Merit', 'mer', 'teacher', 1, 'meritpoints', '', '%', '%', '', 1, ''),
(48, 'Academic Performance', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(49, 'Completion of Class / Homework', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(50, 'Warning', 'inc', 'teacher', 0, 'none', '', '%', '%', '', 4, ''),
(51, 'Relocated in class', 'inc', 'teacher', 1, 'none', '', '%', '%', '', 4, ''),
(52, 'Written work', 'inc', 'teacher', 2, 'none', '', '%', '%', '', 4, ''),
(53, 'Detention with teacher', 'inc', 'teacher', 3, 'none', '', '%', '%', '', 4, ''),
(54, 'Interview with tutor', 'inc', 'tutor', 3, 'none', '', '%', '%', '', 4, ''),
(55, 'Interview with year coord.', 'inc', 'year', 3, 'none', '', '%', '%', '', 4, ''),
(56, 'Interview with head of subject', 'inc', 'year', 3, 'none', '', '%', '%', '', 4, ''),
(57, 'Weekly report', 'inc', 'section', 3, 'none', '', '%', '%', '', 4, ''),
(58, 'Detention with head of subject', 'inc', 'teacher', 3, 'none', '', '%', '%', '', 4, ''),
(59, 'Detention with year coord.', 'inc', 'year', 3, 'none', '', '%', '%', '', 4, ''),
(60, 'Interview with head', 'inc', 'section', 3, 'none', '', '%', '%', '', 4, ''),
(61, 'Formal school detention', 'inc', 'section', 4, 'none', '', '%', '%', '', 4, ''),
(62, 'Isolation', 'inc', 'section', 5, 'none', '', '%', '%', '', 4, ''),
(63, 'Internal suspension', 'inc', 'section', 5, 'none', '', '%', '%', '', 4, ''),
(64, 'External suspension', 'inc', 'section', 5, 'none', '', '%', '%', '', 4, ''),
(65, 'Interview with parents', 'inc', 'section', 5, 'none', '', '%', '%', '', 4, ''),
(66, 'Contract', 'inc', 'section', 5, 'none', '', '%', '%', '', 4, ''),
(67, 'Warning', 'inc', 'teacher', 0, 'none', '', '%', '%', '', 5, ''),
(68, 'Relocated in class', 'inc', 'teacher', 1, 'none', '', '%', '%', '', 5, ''),
(69, 'Written work', 'inc', 'teacher', 2, 'none', '', '%', '%', '', 5, ''),
(70, 'Detention with teacher', 'inc', 'teacher', 3, 'none', '', '%', '%', '', 5, ''),
(71, 'Interview with tutor', 'inc', 'tutor', 3, 'none', '', '%', '%', '', 5, ''),
(72, 'Interview with year coord.', 'inc', 'year', 3, 'none', '', '%', '%', '', 5, ''),
(73, 'Interview with head of subject', 'inc', 'year', 3, 'none', '', '%', '%', '', 5, ''),
(74, 'Weekly report', 'inc', 'section', 3, 'none', '', '%', '%', '', 5, ''),
(75, 'Detention with head of subject', 'inc', 'teacher', 3, 'none', '', '%', '%', '', 5, ''),
(76, 'Detention with year coord.', 'inc', 'year', 3, 'none', '', '%', '%', '', 5, ''),
(77, 'Interview with head', 'inc', 'section', 3, 'none', '', '%', '%', '', 5, ''),
(78, 'Formal school detention', 'inc', 'section', 4, 'none', '', '%', '%', '', 5, ''),
(79, 'Isolation', 'inc', 'section', 5, 'none', '', '%', '%', '', 5, ''),
(80, 'Internal suspension', 'inc', 'section', 5, 'none', '', '%', '%', '', 5, ''),
(81, 'External suspension', 'inc', 'section', 5, 'none', '', '%', '%', '', 5, ''),
(82, 'Interview with parents', 'inc', 'section', 5, 'none', '', '%', '%', '', 5, ''),
(83, 'Contract', 'inc', 'section', 5, 'none', '', '%', '%', '', 5, ''),
(84, 'Warning', 'inc', 'teacher', 0, 'none', '', '%', '%', '', 6, ''),
(85, 'Relocated in class', 'inc', 'teacher', 1, 'none', '', '%', '%', '', 6, ''),
(86, 'Written work', 'inc', 'teacher', 2, 'none', '', '%', '%', '', 6, ''),
(87, 'Detention with teacher', 'inc', 'teacher', 3, 'none', '', '%', '%', '', 6, ''),
(88, 'Interview with tutor', 'inc', 'tutor', 3, 'none', '', '%', '%', '', 6, ''),
(89, 'Interview with year coord.', 'inc', 'year', 3, 'none', '', '%', '%', '', 6, ''),
(90, 'Interview with head of subject', 'inc', 'year', 3, 'none', '', '%', '%', '', 6, ''),
(91, 'Weekly report', 'inc', 'section', 3, 'none', '', '%', '%', '', 6, ''),
(92, 'Detention with head of subject', 'inc', 'teacher', 3, 'none', '', '%', '%', '', 6, ''),
(93, 'Detention with year coord.', 'inc', 'year', 3, 'none', '', '%', '%', '', 6, ''),
(94, 'Interview with head', 'inc', 'section', 3, 'none', '', '%', '%', '', 6, ''),
(95, 'Formal school detention', 'inc', 'section', 4, 'none', '', '%', '%', '', 6, ''),
(96, 'Isolation', 'inc', 'section', 5, 'none', '', '%', '%', '', 6, ''),
(97, 'Internal suspension', 'inc', 'section', 5, 'none', '', '%', '%', '', 6, ''),
(98, 'External suspension', 'inc', 'section', 5, 'none', '', '%', '%', '', 6, ''),
(99, 'Interview with parents', 'inc', 'section', 5, 'none', '', '%', '%', '', 6, ''),
(100, 'Contract', 'inc', 'section', 5, 'none', '', '%', '%', '', 6, ''),
(101, 'Meeting', 'bac', '', 0, 'private', '', '%', '%', '', 0, ''),
(103, 'Form tutor', 'com', 'form', 0, '', '', '%', '%', '', 0, ''),
(104, 'Year Coordinator', 'com', 'year', 2, '', '', '%', '%', '', 0, ''),
(105, 'Tracking', 'pro', 'average', 0, 'none', 'tracking_1to5', '%', 'KS3', '', 0, ''),
(106, 'Tracking', 'pro', 'average', 0, 'none', 'tracking_1to5', '%', 'GCSE', '', 0, ''),
(107, 'Tracking', 'pro', 'average', 0, 'none', 'tracking_1to5', '%', 'AS', '', 0, ''),
(108, 'Tracking', 'pro', 'average', 0, 'none', 'tracking_1to5', '%', 'A2', '', 0, ''),
(110, 'Tracking', 'pro', 'average', 0, 'none', 'tracking_1to5', '%', 'HND', '', 0, ''),
(111, 'Observations', 'sub', '', 1, '', '', '%', '%', '', 0, ''),
(112, 'Targets', 'sub', '', 3, '', '', '%', '%', '', 0, ''),
(113, 'Parent email addresses', 'col', '', 0, '', 'FirstContact:::FirstContactEmailAddress:::SecondContact:::SecondContactEmailAddress', '', '', '', 0, ''),
(114, 'Term 1', 'tar', 'ta1', 4, 'none', '', '%', '%', '', 4, ''),
(115, 'Term 2', 'tar', 'ta2', 3, 'none', '', '%', '%', '', 4, ''),
(116, 'Key Stage Coordinator Meeting', 'tar', 'ta7', 1, 'none', '', '%', '%', '', 4, ''),
(117, 'Term 1', 'tar', 'ta4', 4, 'none', '', '%', '%', '', 5, ''),
(118, 'Term 2', 'tar', 'ta5', 3, 'none', '', '%', '%', '', 5, ''),
(119, 'Key Stage Coordinator Meeting', 'tar', 'ta8', 1, 'none', '', '%', '%', '', 5, ''),
(120, 'Head of School', 'com', 'section', 4, '', '', '%', '%', '', 0, ''),
(122, 'Allergies', 'med', 'md1', 1, '', '', '', '', '', 0, ''),
(123, 'Special Diet', 'med', 'md2', 1, '', '', '', '', '', 0, ''),
(124, 'Regular medication', 'med', 'md3', 0, '', '', '', '', '', 0, ''),
(125, 'Medical problems 	', 'med', 'md4', 0, '', '', '', '', '', 0, ''),
(177, 'General Information', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(178, 'End of Year Comment', 'con', '', 0, 'con', '', '%', '%', '', 0, ''),
(179, 'Other Information', 'med', 'md5', 1, '', '', '', '', '', 0, ''),
(180, 'Term 3', 'tar', 'ta3', 2, '', '', '%', '%', '', 4, ''),
(181, 'Term 3', 'tar', 'ta6', 2, '', '', '%', '%', '', 5, ''),
(360, 'Comment', 'sub', '', 2, '', '', '%', '%', '', 0, ''),
(1124, 'Attainment Levels', 'pro', 'dif', 0, 'none', '', '%', 'FS', '', 0, ''),
(1125, 'Attainment Levels', 'pro', 'dif', 0, 'none', '', '%', 'KS1', '', 0, ''),
(1126, 'Attainment Levels', 'pro', 'dif', 0, 'none', '', '%', 'KS2', '', 0, ''),
(1127, 'Phones', 'col', '', 0, '', 'FirstContact:::FirstContactPhone:::SecondContact:::SecondContactPhone', '', '', '', 0, ''),
(1128, 'Primary Curriculum Profile', 'pro', '', 0, '', '', '%', 'KS2', '%', 0, ''),
(1129, 'Primary Curriculum Profile', 'pro', '', 0, '', '', '%', 'KS1', '%', 0, ''),
(1131, 'Term Comment', 'sub', '', 1, '', '', '%', '%', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cidsid`
--

CREATE TABLE IF NOT EXISTS `cidsid` (
  `class_id` int(10) unsigned NOT NULL,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `detail` varchar(240) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `cohort_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bid` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cohidcomid`
--

CREATE TABLE IF NOT EXISTS `cohidcomid` (
  `cohort_id` int(10) unsigned NOT NULL DEFAULT '0',
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cohort_id`,`community_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `cohort`
--

INSERT INTO `cohort` (`id`, `course_id`, `stage`, `year`, `season`) VALUES
(16, 'HND', 'Y14', 2016, 'S'),
(15, 'A2', 'Y13', 2016, 'S'),
(14, 'AS', 'Y12', 2016, 'S'),
(13, 'GCSE', 'Y11', 2016, 'S'),
(12, 'GCSE', 'Y10', 2016, 'S'),
(11, 'KS3', 'Y09', 2016, 'S'),
(10, 'KS3', 'Y08', 2016, 'S'),
(9, 'KS3', 'Y07', 2016, 'S'),
(8, 'KS2', 'Y06', 2016, 'S'),
(7, 'KS2', 'Y05', 2016, 'S'),
(6, 'KS2', 'Y04', 2016, 'S'),
(5, 'KS2', 'Y03', 2016, 'S'),
(4, 'KS1', 'Y02', 2016, 'S'),
(3, 'KS1', 'Y01', 2016, 'S'),
(2, 'FS', 'R', 2016, 'S'),
(1, 'FS', 'N', 2016, 'S'),
(20, 'KS3', '%', 2016, 'S'),
(21, 'GCSE', '%', 2016, 'S'),
(22, 'AS', '%', 2016, 'S'),
(23, 'A2', '%', 2016, 'S'),
(19, 'KS2', '%', 2016, 'S'),
(18, 'KS1', '%', 2016, 'S'),
(17, 'FS', '%', 2016, 'S'),
(24, 'HND', '%', 2016, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `comidsid`
--

CREATE TABLE IF NOT EXISTS `comidsid` (
  `memberid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_id` int(10) unsigned NOT NULL DEFAULT '0',
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `joiningdate` date DEFAULT NULL,
  `leavingdate` date DEFAULT NULL,
  `special` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`memberid`),
  KEY `indexmember` (`community_id`,`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `incident_id` int(10) unsigned NOT NULL,
  `merit_id` int(10) unsigned NOT NULL,
  `eidsid_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_student` (`student_id`),
  KEY `index_eidsidid` (`eidsid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE IF NOT EXISTS `community` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `type` enum('','academic','family','form','year','tutor','alumni','enquired','applied','accepted','trip','reg','transport','extra','house','accomodation','new','transfer') NOT NULL DEFAULT '',
  `year` year(4) NOT NULL DEFAULT '0000',
  `season` enum('','S','W','M','1','2','3','4','5','6','7','8','9','a','b','c') NOT NULL DEFAULT '',
  `capacity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `detail` varchar(240) NOT NULL DEFAULT '',
  `charge` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `chargetype` enum('0','1','2') NOT NULL,
  `sessions` varchar(240) NOT NULL DEFAULT '',
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `indexcom` (`type`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `component`
--

CREATE TABLE IF NOT EXISTS `component` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `status` enum('N','V','O','U') NOT NULL DEFAULT 'N',
  `sequence` smallint(5) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(5) unsigned NOT NULL DEFAULT '1',
  `year` year(4) NOT NULL DEFAULT '0000',
  PRIMARY KEY (`id`,`course_id`,`subject_id`,`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `component`
--

INSERT INTO `component` (`id`, `course_id`, `subject_id`, `status`, `sequence`, `weight`, `year`) VALUES
('', 'GCSE', 'Phy', 'N', 0, 1, 2016),
('', 'GCSE', 'Bio', 'N', 0, 1, 2016),
('', 'GCSE', 'Che', 'N', 0, 1, 2016),
('', 'KS3', 'Phy', 'V', 0, 1, 2016),
('', 'KS3', 'Che', 'V', 0, 1, 2016),
('', 'KS3', 'Bio', 'V', 0, 1, 2016),
('', 'AS', 'Eng', 'N', 0, 1, 2016),
('', 'AS', 'Mat', 'N', 0, 1, 2016),
('', 'AS', 'Bio', 'N', 0, 1, 2016),
('', 'AS', 'Phy', 'N', 0, 1, 2016),
('', 'AS', 'His', 'N', 0, 1, 2016),
('', 'AS', 'Art', 'N', 0, 1, 2016),
('', 'AS', 'PE', 'N', 0, 1, 2016),
('', 'AS', 'IT', 'N', 0, 1, 2016),
('', 'AS', 'Mus', 'N', 0, 1, 2016),
('', 'AS', 'Eco', 'N', 0, 1, 2016),
('', 'A2', 'Eng', 'N', 0, 1, 2016),
('', 'A2', 'Mat', 'N', 0, 1, 2016),
('', 'A2', 'Bio', 'N', 0, 1, 2016),
('', 'A2', 'Phy', 'N', 0, 1, 2016),
('', 'A2', 'His', 'N', 0, 1, 2016),
('', 'A2', 'Art', 'N', 0, 1, 2016),
('', 'A2', 'PE', 'N', 0, 1, 2016),
('', 'A2', 'IT', 'N', 0, 1, 2016),
('', 'A2', 'Mus', 'N', 0, 1, 2016),
('', 'A2', 'Eco', 'N', 0, 1, 2016),
('', 'AS', 'Che', 'N', 0, 1, 2016),
('', 'AS', 'Fre', 'N', 0, 1, 2016),
('', 'AS', 'Spa', 'N', 0, 1, 2016),
('', 'AS', 'Geo', 'N', 0, 1, 2016),
('', 'A2', 'Che', 'N', 0, 1, 2016),
('', 'A2', 'Fre', 'N', 0, 1, 2016),
('', 'A2', 'Geo', 'N', 0, 1, 2016),
('', 'KS3', 'Eng', 'V', 0, 1, 2016),
('', 'KS3', 'Mat', 'V', 0, 1, 2016),
('', 'KS3', 'Fre', 'N', 0, 1, 2016),
('', 'KS3', 'Geo', 'N', 0, 1, 2016),
('', 'KS3', 'His', 'N', 0, 1, 2016),
('', 'KS3', 'Mus', 'N', 0, 1, 2016),
('', 'KS3', 'PE', 'N', 0, 1, 2016),
('', 'GCSE', 'Geo', 'N', 0, 1, 2016),
('', 'GCSE', 'IT', 'N', 0, 1, 2016),
('', 'GCSE', 'Art', 'N', 0, 1, 2016),
('', 'GCSE', 'His', 'N', 0, 1, 2016),
('', 'GCSE', 'PE', 'N', 0, 1, 2016),
('', 'GCSE', 'Mus', 'N', 0, 1, 2016),
('', 'GCSE', 'Mat', 'V', 0, 1, 2016),
('', 'GCSE', 'Eng', 'V', 0, 1, 2016),
('', 'KS3', 'Art', 'N', 0, 1, 2016),
('', 'HND', 'Spa', 'N', 0, 1, 2016),
('', 'FS', 'Spa', 'N', 0, 1, 2016),
('', 'KS2', 'Spa', 'V', 0, 1, 2016),
('', 'KS1', 'Spa', 'V', 0, 1, 2016),
('', 'HND', 'PE', 'N', 0, 1, 2016),
('', 'HND', 'Fre', 'N', 0, 1, 2016),
('', 'HND', 'Eng', 'N', 0, 1, 2016);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `sequence`, `generate`, `naming`, `many`, `nextcourse_id`, `endmonth`) VALUES
('AS', 'AS Level', 5, 'sets', 'subject;/;year;', 1, 'A2', '6'),
('A2', 'A2 Level', 6, 'sets', 'subject;/;year;', 1, '', '6'),
('KS2', 'Key Stage 2', 2, 'forms', 'subject;/;year;', 3, 'KS3', '6'),
('KS1', 'Key Stage 1', 1, 'forms', 'subject;/;year;', 3, 'KS2', '6'),
('FS', 'Foundation Stage', 0, 'forms', 'subject;/;year;', 3, 'KS1', '6'),
('KS3', 'Key Stage 3', 3, 'forms', 'subject;/;year;', 4, 'GCSE', '6'),
('GCSE', 'GCSE', 4, 'sets', 'subject;/;year;', 4, 'AS', '6'),
('HND', 'HND', 13, 'sets', 'subject;stage;/;', 2, '', '6');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `session` enum('AM','PM') NOT NULL DEFAULT 'AM',
  `period` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','lunch') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexeve` (`date`,`session`,`period`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `iban` varbinary(50) NOT NULL,
  `bic` varbinary(40) NOT NULL,
  `code` varbinary(40) NOT NULL,
  `valid` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_gid` (`guardian_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fees_account`
--

INSERT INTO `fees_account` (`id`, `guardian_id`, `accountname`, `bankname`, `bankcountry`, `bankcode`, `bankbranch`, `bankcontrol`, `banknumber`, `iban`, `bic`, `code`, `valid`) VALUES
(1, 0, '', '64656D6F', '', '', '', '', '', '', '', '', '1');

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
  KEY `index_sid` (`student_id`),
  KEY `index_tarifid` (`tarif_id`)
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
  KEY `index_sid` (`student_id`),
  KEY `index_invoid` (`invoice_id`),
  KEY `index_remid` (`remittance_id`),
  KEY `index_tarifid` (`tarif_id`),
  KEY `index_payment` (`payment`),
  KEY `index_paymenttype` (`paymenttype`)
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
  KEY `refno` (`series`,`reference`),
  KEY `index_accountid` (`account_id`),
  KEY `index_remid` (`remittance_id`)
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
  PRIMARY KEY (`id`),
  KEY `index_accountid` (`account_id`),
  KEY `index_year` (`year`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees_tarif`
--

CREATE TABLE IF NOT EXISTS `fees_tarif` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `concept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(240) NOT NULL DEFAULT '',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `index_conceptid` (`concept_id`)
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grading`
--

INSERT INTO `grading` (`name`, `grades`, `comment`, `author`) VALUES
('FS steps', '1Au:1;1Sp:2;1Su:3;2Au:4;2Sp:5;2Su:6', 'Foundation stage profile steps', 'ClaSS'),
('broad NC levels', 'A:0;D:0.001;W:0.002;1:1;2:2;3:3;4:4;5:5;6:6;7:7;8:8;E:9', 'full range of national curriculum levels', 'ClaSS'),
('Infant NC levels', '3050c:1;3050b:2;3050a:3;ELGc:4;ELGb:5;ELGa:6;1c:7;1b:8;1a:9;2c:10;2b:11;2a:12;3c:13;3b:14;3a:15;4c:16;4b:17;4a:18;5c:19;5b:20;5a:21', 'Infant attainment levels with discrete abc steps', 'ClaSS'),
('Junior NC levels', 'w:0;1c:1;1b:2;1a:3;2c:4;2b:5;2a:6;3c:7;3b:8;3a:9;4c:10;4b:11;4a:12;5c:13;5b:14;5a:15', 'Levels w to 5 with discrete abc steps', 'ClaSS'),
('OneToTen', '1:1;2:2;3:3;4:4;5:5;6:6;7:7;8:8;9:9;10:10', 'Simple grade scheme using scale of 1-10', 'ClaSS'),
('GCSE', 'U:0;G:1;F:2;E:3;D:4;C:5;B:6;A:7;A*:8', 'GCSE grade scheme', 'ClaSS'),
('IGCSE Exam Tier', 'Core:0;Extended:1', 'Tiers for IGCSE exam entries', 'ClaSS'),
('ABCD_Bands', 'D:1;C:2;B:3;A:4', 'ABCD bands used by MIDYIS', 'ClaSS'),
('EtoA', 'E:0;D:1;C:2;B:3;A:4', 'General E to A grades', 'ClaSS'),
('A Level', 'U:-1;N:0;E:1;D:2;C:3;B:4;A:5;A*:6', 'General A Level grades', 'ClaSS'),
('Re-enrolmentStatus', 'C:0;P:1;L:2;R:7', 'Student re-enrolment for the next year', 'ClaSS'),
('OneToFive', '1:1;2:2;3:3;4:4;5:5', 'Simple 1 to 5 score', 'ClaSS'),
('Special Curriculum', 'GT:1;S:2', 'Tracking special needs', 'ClaSS'),
('YesNo', 'no:0;yes:1', 'A logical yes or no statement.', 'ClaSS'),
('Quality', 'Poor:-1;Okay:0;Good:1', 'Simple quality scale', 'ClaSS'),
('Secondary NC Levels', '1c:-6;1b:-5;1a:-4;2c:-3;2b:-2;2a:-1;w:0;3c:1;3b:2;3a:3;4c:4;4b:5;4a:6;5c:7;5b:8;5a:9;6c:10;6b:11;6a:12;7c:13;7b:14;7a:15;8c:16;8b:17;8a:18;E:19', 'National Curriculum Levels with fine grading', 'ClaSS'),
('NSGVE', 'Needs to Improve:0;Satisfactory:1;Good:2;Very Good:3;Excellent:4', 'Excellent to Needs to Improve', 'ClaSS'),
('Traffic Lights', 'Red:-1;Yellow:0;Green:1', 'Red / Yellow / Green', 'ClaSS'),
('Primary Observations', 'No:0;With Support:1;Achieved:2', 'Early Year''s observations', 'ClaSS'),
('Examplusminus', 'U:0;E-:7;E:8;E+:9;D-:10;D:11;D+:12;C-:13;C:14;C+:15;B-:16;B:17;B+:18;A-:19;A:20;A+:21', 'A Level grades with plus/minus fine grading', 'ClaSS'),
('IGCSEplusminus', 'U:0;G:2;F:5;E:8;D-:10;D:11;D+:12;C-:13;C:14;C+:15;B-:16;B:17;B+:18;A-:19;A:20;A+:21', 'IGCSE exam grades with plus minus fine grading', 'ClaSS'),
('AS Level', 'U:-1;N:0;E:1;D:2;C:3;B:4;A:5', 'General AS Level grades', 'ClaSS'),
('RPMD', 'Referral:0;Pass:1;Merit:2;Distinction:3', 'Referral to distinction', 'ClaSS');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `yeargroup_id` smallint(6) DEFAULT NULL,
  `community_id` int(10) NOT NULL DEFAULT '0',
  `type` enum('a','p','b','s','u','c') NOT NULL DEFAULT 'a',
  PRIMARY KEY (`gid`),
  KEY `index_crid` (`course_id`),
  KEY `index_bid` (`subject_id`),
  KEY `index_yid` (`yeargroup_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`gid`, `subject_id`, `course_id`, `yeargroup_id`, `community_id`, `type`) VALUES
(9, '', '', -9999, 0, 'a'),
(11, '', '', -9999, 0, 'u'),
(3, '%', 'KS3', NULL, 0, 'a'),
(4, '%', 'AS', NULL, 0, 'a'),
(5, '%', 'A2', NULL, 0, 'a'),
(20, '', '', 7, 0, 'p'),
(24, '', '', 10, 0, 'p'),
(25, '', '', 11, 0, 'p'),
(7, '%', 'KS2', NULL, 0, 'a'),
(6, '%', 'KS1', NULL, 0, 'a'),
(2, '%', 'FS', NULL, 0, 'a'),
(21, '', '', 8, 0, 'p'),
(16, '', '', 3, 0, 'p'),
(18, '', '', 5, 0, 'p'),
(22, '', '', 9, 0, 'p'),
(27, '', '', 13, 0, 'p'),
(12, '', '', -1, 0, 'p'),
(14, '', '', 1, 0, 'p'),
(17, '', '', 4, 0, 'p'),
(19, '', '', 6, 0, 'p'),
(15, '', '', 2, 0, 'p'),
(23, '', '', 9, 0, 'p'),
(26, '', '', 12, 0, 'p'),
(8, '%', 'GCSE', NULL, 0, 'a'),
(28, '', '', 14, 0, 'p'),
(1, '%', 'HND', NULL, 0, 'a'),
(10, '', '', -9999, 0, 's'),
(13, '', '', 0, 0, 'p');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `uid` int(10) unsigned DEFAULT NULL,
  `page` varchar(60) NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `classis_version` varchar(10) NOT NULL,
  `browser_version` varchar(150) NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  KEY `uid` (`uid`),
  KEY `classis_version` (`classis_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `appmethod` enum('','W','E','IP','T','P') NOT NULL DEFAULT '',
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info_extra`
--

CREATE TABLE IF NOT EXISTS `info_extra` (
  `user_id` int(10) unsigned NOT NULL,
  `catdef_id` int(10) unsigned NOT NULL,
  `value` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`catdef_id`)
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `elgg_weblog_post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meals_attendance`
--

CREATE TABLE IF NOT EXISTS `meals_attendance` (
  `booking_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `status` enum('a','p') NOT NULL DEFAULT 'a',
  `comment` text,
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`,`event_id`)
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
-- Table structure for table `medical_log`
--

CREATE TABLE IF NOT EXISTS `medical_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `category` varchar(10) NOT NULL DEFAULT '',
  `details` text NOT NULL,
  `user_id` varchar(14) NOT NULL DEFAULT '',
  `time` time NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_sid` (`student_id`),
  KEY `index_uid` (`user_id`)
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
  `core_value` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_result` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message_event_seq`
--

CREATE TABLE IF NOT EXISTS `message_event_seq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `class_id` int(10) unsigned NOT NULL,
  `mark_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_id`,`mark_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ordermaterial`
--

CREATE TABLE IF NOT EXISTS `ordermaterial` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `entryn` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `unitcost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `detail` text NOT NULL,
  `materialtype` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalogue_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`entryn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perms`
--

INSERT INTO `perms` (`uid`, `gid`, `r`, `w`, `x`, `e`) VALUES
(1, 1, '1', '1', '1', '0'),
(1, 2, '1', '1', '1', '0'),
(1, 3, '1', '1', '1', '0'),
(1, 4, '1', '1', '1', '0'),
(1, 5, '1', '1', '1', '0'),
(1, 6, '1', '1', '1', '0'),
(1, 7, '1', '1', '1', '0'),
(1, 8, '1', '1', '1', '0'),
(1, 9, '1', '1', '1', '0'),
(1, 10, '1', '1', '1', '0'),
(1, 11, '1', '1', '1', '0'),
(1, 12, '1', '1', '1', '0'),
(1, 13, '1', '1', '1', '0'),
(1, 14, '1', '1', '1', '0'),
(1, 15, '1', '1', '1', '0'),
(1, 16, '1', '1', '1', '0'),
(1, 17, '1', '1', '1', '0'),
(1, 18, '1', '1', '1', '0'),
(1, 19, '1', '1', '1', '0'),
(1, 20, '1', '1', '1', '0'),
(1, 21, '1', '1', '1', '0'),
(1, 22, '1', '1', '1', '0'),
(1, 23, '1', '1', '1', '0'),
(1, 24, '1', '1', '1', '0'),
(1, 25, '1', '1', '1', '0'),
(1, 26, '1', '1', '1', '0'),
(1, 27, '1', '1', '1', '0'),
(1, 28, '1', '1', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `some_id` int(10) unsigned NOT NULL DEFAULT '0',
  `number` varchar(22) NOT NULL DEFAULT '',
  `phonetype` enum('H','M','W','F','O','N') NOT NULL,
  `privatephone` enum('N','Y') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_id` (`some_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `descriptor` varchar(30) NOT NULL DEFAULT '',
  `longdescriptor` varchar(250) NOT NULL DEFAULT '',
  `value` smallint(6) NOT NULL DEFAULT '0',
  `test` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`name`, `descriptor`, `longdescriptor`, `value`, `test`) VALUES
('simple three', 'Poor', 'Poor', -1, 0),
('simple three', 'Satisfactory', 'Satisfactory', 0, 0),
('simple three', 'Good', 'Good', 1, 0),
('private', 'confidential', 'restricted access', -1, 0),
('private', 'not confidential', 'shared with staff', 1, 0),
('con', 'Negative', 'Negative', -1, 0),
('con', 'Positive', 'Positive', 1, 0),
('fivegrade', 'Poor', '', 1, 0),
('fivegrade', 'Satisfactory', '', 2, 0),
('fivegrade', 'Good', '', 3, 0),
('fivegrade', 'Very Good', '', 4, 0),
('fivegrade', 'Excellent', '', 5, 0),
('meritpoints', '1', '', 1, 0),
('meritpoints', '2', '', 2, 0),
('meritpoints', '3', '', 3, 0),
('meritpoints', '4', '', 4, 0),
('meritpoints', '5', '', 5, 0),
('KS2Progress', 'Good', '', 2, 0),
('KS2Progress', 'Satisfactory', '', 1, 0),
('KS2Progress', 'With support', '', 0, 0),
('KS2Progress', 'Very Good', 'Very Good', 3, 0),
('con', 'General', 'General', 0, 0),
('EEE', 'Emerging', 'Emerging', -1, 0),
('EEE', 'Expected', 'Expected', 0, 0),
('EEE', 'Exceeding', 'Exceeding', 1, 0),
('meritpoints', '6', '6', 6, 0),
('meritpoints', '7', '7', 7, 0),
('meritpoints', '8', '8', 8, 0),
('meritpoints', '9', '9', 9, 0),
('meritpoints', '10', '10', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE IF NOT EXISTS `report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `attendancestartdate` date NOT NULL,
  `deadline` date NOT NULL DEFAULT '0000-00-00',
  `comment` text,
  `course_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL DEFAULT '',
  `subject_status` enum('None','N','V','O','AV','A') NOT NULL DEFAULT 'A',
  `component_status` enum('None','N','V','AV','A') NOT NULL DEFAULT 'None',
  `addcomment` enum('no','yes') NOT NULL DEFAULT 'no',
  `commentlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `commentcomp` enum('no','yes') NOT NULL DEFAULT 'no',
  `addcategory` enum('no','yes') NOT NULL DEFAULT 'no',
  `addphotos` enum('no','yes') NOT NULL,
  `style` varchar(60) NOT NULL DEFAULT '',
  `transform` varchar(60) NOT NULL DEFAULT '',
  `rating_name` text NOT NULL,
  `year` year(4) NOT NULL DEFAULT '0000',
  `nextsubject_id` varchar(10) NOT NULL DEFAULT '',
  `type` enum('wrapper','subject','profile') NOT NULL DEFAULT 'wrapper',
  `splitsubjectdescription` enum('no','yes') DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `comment` text,
  `category` text NOT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  PRIMARY KEY (`report_id`,`student_id`,`subject_id`,`component_id`,`entryn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_comments_length`
--

CREATE TABLE IF NOT EXISTS `report_comments_length` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL,
  `subject_id` varchar(10) NOT NULL,
  `component_id` varchar(10) NOT NULL,
  `comment_length` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_result` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_skill`
--

CREATE TABLE IF NOT EXISTS `report_skill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `subtype` varchar(20) NOT NULL DEFAULT '',
  `profile_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `subject_id` varchar(10) NOT NULL DEFAULT '',
  `component_id` varchar(10) NOT NULL DEFAULT '',
  `stage` char(3) NOT NULL,
  `rating` smallint(6) NOT NULL,
  `rating_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profile` (`profile_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_skill_log`
--

CREATE TABLE IF NOT EXISTS `report_skill_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_id` int(10) unsigned NOT NULL DEFAULT '0',
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(6) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rideid`
--

CREATE TABLE IF NOT EXISTS `rideid` (
  `report_id` int(10) unsigned NOT NULL DEFAULT '0',
  `assessment_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`report_id`,`assessment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `sequence`, `address_id`, `gid`) VALUES
(1, 'Whole School', 0, 0, 633),
(2, 'Infants', 1, 0, 382),
(3, 'Junior', 2, 0, 383),
(4, 'Secondary', 3, 0, 384),
(5, 'Sixth Form', 4, 0, 385),
(6, 'HND', 4, 0, 386);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student_event`
--

CREATE TABLE IF NOT EXISTS `student_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(10) NOT NULL,
  `event` varchar(100) DEFAULT NULL,
  `catid` varchar(10) NOT NULL DEFAULT '',
  `type` varchar(15) NOT NULL DEFAULT '',
  `file` varchar(100) NOT NULL DEFAULT '',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '000.000.000.000',
  `user_id` varchar(20) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_sid` (`student_id`),
  KEY `index_uid` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `id` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`) VALUES
('Eng', 'English'),
('Mat', 'Maths'),
('Bio', 'Biology'),
('Phy', 'Physics'),
('His', 'History'),
('Art', 'Art'),
('PE', 'Physical Education'),
('IT', 'Information Technology'),
('Mus', 'Music'),
('Eco', 'Economics'),
('Sci', 'Science'),
('Geo', 'Geography'),
('Che', 'Chemistry'),
('Fre', 'French'),
('Spa', 'Spanish');

-- --------------------------------------------------------

--
-- Table structure for table `tidcid`
--

CREATE TABLE IF NOT EXISTS `tidcid` (
  `teacher_id` varchar(14) NOT NULL DEFAULT '',
  `class_id` int(10) unsigned NOT NULL,
  `component_id` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`teacher_id`,`class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1003 ;

--
-- Dumping data for table `transport_bus`
--

INSERT INTO `transport_bus` (`id`, `name`, `detail`, `route_id`, `direction`, `day`, `departuretime`, `teacher_id`) VALUES
(1002, 'NOT OUT', '', 0, 'O', '%', NULL, ''),
(6, 'Bus 3', '', 6, 'O', '%', '16:40:00', ''),
(1001, 'NOT IN', '', 0, 'I', '%', NULL, ''),
(5, 'Bus 3', '', 5, 'I', '%', '08:07:00', ''),
(4, 'Bus 2', '', 4, 'O', '%', '16:58:00', ''),
(3, 'Bus 2', '', 3, 'I', '%', '08:02:00', ''),
(2, 'Bus 1', '', 2, 'O', '%', '16:58:00', ''),
(1, 'Bus 1', '', 1, 'I', '%', '08:10:00', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `transport_route`
--

INSERT INTO `transport_route` (`id`, `name`, `detail`) VALUES
(1, 'Bus 1 AM', 'AM route B1'),
(2, 'Bus 1 PM', 'PM route B1'),
(3, 'Bus 2 AM', 'AM route B2'),
(4, 'Bus 2 PM', 'PM route B2'),
(5, 'Bus 3 AM', 'AM route B3'),
(6, 'Bus 3 PM', 'PM route B3');

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
  `import` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(15) NOT NULL DEFAULT '000.000.000.000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(14) NOT NULL DEFAULT '',
  `passwd` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `cookie` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `session` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `forename` varchar(50) NOT NULL DEFAULT '',
  `surname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `emailuser` varchar(60) NOT NULL DEFAULT '',
  `emailpasswd` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
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
  `street` varchar(160) NOT NULL DEFAULT '',
  `region` varchar(160) NOT NULL DEFAULT '',
  `postcode` varchar(8) NOT NULL DEFAULT '',
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `username`, `passwd`, `cookie`, `session`, `ip`, `forename`, `surname`, `title`, `email`, `emailuser`, `emailpasswd`, `epfusername`, `language`, `firstbookpref`, `role`, `senrole`, `medrole`, `worklevel`, `nologin`, `jobtitle`, `personalemail`, `homephone`, `mobilephone`, `street`, `region`, `postcode`, `personalcode`, `address_id`, `dob`, `contractdate`, `education`, `education2`, `logcount`, `logtime`) VALUES
(1, 'administrator', '084e0343a0486ff05530df6c705c8bb4', '', '', '', '', 'Administrator', '0', '', '', '', 'administrator', 'en', 'admin', 'admin', '1', '1', '1', 0, '', '', '', '', '', '', '', '', 0, '0000-00-00', '0000-00-00', '', '', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_attendance`
--

CREATE TABLE IF NOT EXISTS `user_attendance` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `status` enum('a','p') NOT NULL DEFAULT 'a',
  `comment` varchar(100) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `session` enum('','AM','PM') NOT NULL DEFAULT '',
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `yeargroup`
--

INSERT INTO `yeargroup` (`id`, `name`, `sequence`, `section_id`) VALUES
(-1, 'Nursery', 2, 2),
(0, 'Reception', 3, 2),
(1, 'Year 1', 4, 2),
(2, 'Year 2', 5, 2),
(3, 'Year 3', 6, 3),
(4, 'Year 4', 7, 3),
(5, 'Year 5', 8, 3),
(6, 'Year 6', 9, 3),
(7, 'Year 7', 10, 4),
(8, 'Year 8', 11, 4),
(9, 'Year 9', 12, 4),
(10, 'Year 10', 13, 4),
(11, 'Year 11', 14, 4),
(12, 'Year 12', 15, 5),
(13, 'Year 13', 16, 5),
(14, 'HND', 18, 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
