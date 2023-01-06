-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: c1545778c_humano
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_transactionindex_abd45f20-090f-4515-85a3-89cffd54c92c`
--

DROP TABLE IF EXISTS `_transactionindex_abd45f20-090f-4515-85a3-89cffd54c92c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_transactionindex_abd45f20-090f-4515-85a3-89cffd54c92c` (
  `Id` varchar(64) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absences` (
  `UR_USERID` int NOT NULL,
  `AB_DATE` datetime(6) DEFAULT NULL,
  `AB_REASON` varchar(500) DEFAULT NULL,
  `AB_ABSENCEID` int NOT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `AB_APPROVED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AB_ABSENCEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `AT_ACTIVITYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CT_CATEGORYID` int DEFAULT NULL,
  `AT_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AT_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  `AT_NAME` varchar(4000) DEFAULT NULL,
  `AT_DESCRIPTION` varchar(4000) DEFAULT NULL,
  `AT_LANGUAGE` varchar(2) NOT NULL,
  `AT_COST` float(24,0) DEFAULT NULL,
  `AT_PLACE` varchar(100) DEFAULT NULL,
  `AT_DURATION` varchar(100) DEFAULT NULL,
  `AT_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AT_ACTIVITYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applications_settings`
--

DROP TABLE IF EXISTS `applications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications_settings` (
  `AS_SETTINGID` int NOT NULL AUTO_INCREMENT,
  `AS_NAMEFR` varchar(100) NOT NULL,
  `AS_NAMEEN` varchar(100) NOT NULL,
  `AS_STATUS` int NOT NULL DEFAULT '1',
  `AS_PATH` varchar(255) DEFAULT NULL,
  `AS_CODE` varchar(50) DEFAULT NULL,
  `AS_ORDER` int DEFAULT NULL,
  `AS_TYPEID` int DEFAULT NULL,
  `AS_ALWAYSCHECKED` tinyint(1) NOT NULL DEFAULT '1',
  `AS_VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`AS_SETTINGID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `applications_settings_types`
--

DROP TABLE IF EXISTS `applications_settings_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications_settings_types` (
  `ST_TYPEID` int NOT NULL,
  `ST_NAMEFR` varchar(50) DEFAULT NULL,
  `ST_NAMEEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ST_TYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int NOT NULL,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` varchar(0) DEFAULT NULL,
  `ClaimValue` varchar(0) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` varchar(0) DEFAULT NULL,
  `SecurityStamp` varchar(0) DEFAULT NULL,
  `PhoneNumber` varchar(0) DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  `UserName` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aspnetusers_humanousers`
--

DROP TABLE IF EXISTS `aspnetusers_humanousers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspnetusers_humanousers` (
  `AspNetUserId` varchar(128) NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`AspNetUserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assistants_users`
--

DROP TABLE IF EXISTS `assistants_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistants_users` (
  `AU_REFERENCEUSERID` int NOT NULL,
  `AU_ASSISTANTUSERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `AU_LASTUPDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`AU_REFERENCEUSERID`,`AU_ASSISTANTUSERID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CT_CATEGORYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CT_NAMEEN` varchar(2018) NOT NULL,
  `CT_NAMEFR` varchar(2048) NOT NULL,
  `CT_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CT_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  `CT_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CT_CATEGORYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checkpoints`
--

DROP TABLE IF EXISTS `checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoints` (
  `CP_CHECKPOINTID` int NOT NULL,
  `CP_NAMEFR` varchar(500) NOT NULL,
  `CP_NAMEEN` varchar(500) NOT NULL,
  `CP_CODE` int NOT NULL,
  `CP_DESCRIPTIONFR` varchar(5000) NOT NULL,
  `CP_DESCRIPTIONEN` varchar(5000) NOT NULL,
  `CP_STATUS` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`CP_CHECKPOINTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classifications`
--

DROP TABLE IF EXISTS `classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classifications` (
  `CL_CLASSIFICATIONID` int NOT NULL,
  `CL_CODE` varchar(50) NOT NULL,
  `CL_NAME` varchar(255) NOT NULL,
  `CL_PARENTCODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CL_CLASSIFICATIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `classifications_`
--

DROP TABLE IF EXISTS `classifications_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classifications_` (
  `CL_CLASSIFICATIONID` int NOT NULL,
  `CL_NAME` varchar(255) DEFAULT NULL,
  `CL_CODE` varchar(20) DEFAULT NULL,
  `CL_PARENTCODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CL_CLASSIFICATIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communication_preferences`
--

DROP TABLE IF EXISTS `communication_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communication_preferences` (
  `CP_PREFERENCEID` int NOT NULL,
  `CP_NAMEFR` varchar(500) DEFAULT NULL,
  `CP_NAMEEN` varchar(500) DEFAULT NULL,
  `CP_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`CP_PREFERENCEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_applications_settings`
--

DROP TABLE IF EXISTS `companies_applications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_applications_settings` (
  `AS_SETTINGID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CA_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`AS_SETTINGID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_logo_croppedpictures`
--

DROP TABLE IF EXISTS `companies_logo_croppedpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_logo_croppedpictures` (
  `FileGUID` varchar(64) NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_logo_pictures`
--

DROP TABLE IF EXISTS `companies_logo_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies_logo_pictures` (
  `FileGUID` varchar(64) NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_help_files`
--

DROP TABLE IF EXISTS `company_help_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_help_files` (
  `FileGUID` varchar(64) NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CHF_DESCRIPTION` varchar(500) DEFAULT NULL,
  `CHF_SOLUTION` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`FileGUID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_topsitesections`
--

DROP TABLE IF EXISTS `company_topsitesections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_topsitesections` (
  `SS_SECTIONCODE` varchar(50) NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CTSS_NAMEFR` varchar(100) DEFAULT NULL,
  `CTSS_NAMEEN` varchar(100) DEFAULT NULL,
  `CTSS_DESCRIPTIONFR` varchar(100) DEFAULT NULL,
  `CTSS_DESCRIPTIONEN` varchar(100) DEFAULT NULL,
  `CTSS_ORDER` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`SS_SECTIONCODE`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencies_activities`
--

DROP TABLE IF EXISTS `competencies_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies_activities` (
  `CP_COMPETENCYID` int NOT NULL,
  `AT_ACTIVITYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CA_STATUS` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`CP_COMPETENCYID`,`AT_ACTIVITYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencies_behaviors`
--

DROP TABLE IF EXISTS `competencies_behaviors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies_behaviors` (
  `CP_COMPETENCYID` int NOT NULL,
  `BE_BEHAVIORID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CH_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`CP_COMPETENCYID`,`BE_BEHAVIORID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencies_keyactions`
--

DROP TABLE IF EXISTS `competencies_keyactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies_keyactions` (
  `CP_COMPETENCYID` int NOT NULL,
  `KA_KEYACTIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CK_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`CP_COMPETENCYID`,`KA_KEYACTIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencies_observeddifficulties`
--

DROP TABLE IF EXISTS `competencies_observeddifficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies_observeddifficulties` (
  `CP_COMPETENCYID` int NOT NULL,
  `OD_DIFFICULTYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `COD_STATUS` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`CP_COMPETENCYID`,`OD_DIFFICULTYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `competencies_types`
--

DROP TABLE IF EXISTS `competencies_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competencies_types` (
  `CT_TYPEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL DEFAULT '3',
  `CT_NAMEFR` varchar(250) NOT NULL,
  `CT_NAMEEN` varchar(250) NOT NULL,
  `CT_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `CT_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `CT_STATUS` int NOT NULL DEFAULT '1',
  `CT_POTORDER` int DEFAULT NULL,
  `LT_LEADERSHIPTHEMEID` int DEFAULT NULL,
  PRIMARY KEY (`CT_TYPEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DP_DEPARTMENTID` int NOT NULL AUTO_INCREMENT,
  `CO_COMPANYID` int NOT NULL,
  `DP_NAMEEN` varchar(100) NOT NULL,
  `DP_NAMEFR` varchar(100) NOT NULL,
  `DP_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DP_STATUS` smallint DEFAULT '1',
  `DP_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `DP_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `DP_TYPE` int DEFAULT NULL,
  `UR_MANAGERID` int DEFAULT NULL,
  `DI_DIVISIONID` int DEFAULT NULL,
  `DP_DEPARTMENTCODE` varchar(30) DEFAULT NULL,
  `DP_ADDRESS` varchar(500) DEFAULT NULL,
  `DP_PHONE` char(20) DEFAULT NULL,
  `DP_WEBSITE` varchar(255) DEFAULT NULL,
  `DP_OURROLE` varchar(2048) DEFAULT NULL,
  `DP_OURSLOGAN` varchar(2048) DEFAULT NULL,
  `DP_OURMOOD` varchar(2048) DEFAULT NULL,
  `DP_OURVALUES` varchar(2048) DEFAULT NULL,
  `DP_CANEDITPROJECT` tinyint(1) NOT NULL DEFAULT '0',
  `DP_REGISTRATION_REQUEST_DATE` timestamp NULL DEFAULT NULL,
  `DP_INVITED_BY` varchar(255) DEFAULT NULL,
  `DP_RR_LASTUPDATED_BY` varchar(255) DEFAULT NULL,
  `RE_REGIONID` int DEFAULT NULL,
  PRIMARY KEY (`DP_DEPARTMENTID`,`CO_COMPANYID`),
  UNIQUE KEY `DP_NAMEFR` (`DP_NAMEFR`),
  KEY `FK_DEPARTMENTS_REGIONS` (`RE_REGIONID`)
) ENGINE=MyISAM AUTO_INCREMENT=1432 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_collaborators_preferences`
--

DROP TABLE IF EXISTS `departments_collaborators_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_collaborators_preferences` (
  `DEPARTMENTID` int NOT NULL,
  `COLLABORATORID` int NOT NULL,
  PRIMARY KEY (`DEPARTMENTID`,`COLLABORATORID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_divisions`
--

DROP TABLE IF EXISTS `departments_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_divisions` (
  `DP_DEPARTMENTID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  PRIMARY KEY (`DP_DEPARTMENTID`,`DI_DIVISIONID`),
  KEY `FK_DEPARTMENTS_REGIONS_REGIONS` (`DI_DIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_regions`
--

DROP TABLE IF EXISTS `departments_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_regions` (
  `DP_DEPARTMENTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `RE_REGIONID` int NOT NULL,
  `Note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DP_DEPARTMENTID`,`CO_COMPANYID`,`RE_REGIONID`),
  KEY `FK_DEPARTMENTS_REGIONS_REGIONS` (`RE_REGIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departments_temp`
--

DROP TABLE IF EXISTS `departments_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_temp` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DP_DEPARTMENTID` int NOT NULL,
  `DP_NAMEEN` varchar(100) DEFAULT NULL,
  `DP_NAMEFR` varchar(100) DEFAULT NULL,
  `DP_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS` smallint NOT NULL DEFAULT '0',
  `DP_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `DP_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `DP_TYPE` int DEFAULT NULL,
  `UR_MANAGERID` int DEFAULT NULL,
  `DI_DIVISIONID` int DEFAULT NULL,
  `DP_DEPARTMENTCODE` varchar(30) DEFAULT NULL,
  `DP_ADDRESS` varchar(500) DEFAULT NULL,
  `DP_PHONE` char(20) DEFAULT NULL,
  `DP_OURROLE` varchar(2048) DEFAULT NULL,
  `DP_OURSLOGAN` varchar(2048) DEFAULT NULL,
  `DP_OURMOOD` varchar(2048) DEFAULT NULL,
  `DP_OURVALUES` varchar(2048) DEFAULT NULL,
  `DP_CANEDITPROJECT` tinyint(1) NOT NULL DEFAULT '0',
  `RE_REGIONID` int DEFAULT NULL,
  `BUSINESS_REGION_IDS` varchar(256) DEFAULT NULL,
  `SUPPLIER_DIVISION_IDS` varchar(255) DEFAULT NULL,
  `WEBSITE` varchar(256) DEFAULT NULL,
  `UR_FIRSTNAME` varchar(256) DEFAULT NULL,
  `UR_LASTNAME` varchar(256) DEFAULT NULL,
  `UR_EMAIL` varchar(256) DEFAULT NULL,
  `UR_PHONE` varchar(20) DEFAULT NULL,
  `UR_OFFICE_PHONE` varchar(20) DEFAULT NULL,
  `UR_MYROLE` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `diplomatypes`
--

DROP TABLE IF EXISTS `diplomatypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diplomatypes` (
  `DT_DIPLOMATYPEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `DT_NAMEFR` varchar(100) NOT NULL,
  `DT_NAMEEN` varchar(100) NOT NULL,
  `DT_STATUS` int NOT NULL DEFAULT '1',
  `DT_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`DT_DIPLOMATYPEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disponibility_options`
--

DROP TABLE IF EXISTS `disponibility_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibility_options` (
  `DO_DISPONIBILITYOPTIONID` int NOT NULL,
  `DO_NAMEFR` varchar(500) DEFAULT NULL,
  `DO_NAMEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`DO_DISPONIBILITYOPTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `DI_DIVISIONID` int NOT NULL AUTO_INCREMENT,
  `CO_COMPANYID` int NOT NULL DEFAULT '9',
  `DI_NAMEEN` varchar(100) NOT NULL,
  `DI_NAMEFR` varchar(100) NOT NULL,
  `DI_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DI_STATUS` smallint NOT NULL DEFAULT '1',
  `DI_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `DI_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `DI_TYPE` int DEFAULT '0',
  `UR_MANAGERID` int DEFAULT NULL,
  `DI_DIVISIONCODE` varchar(30) DEFAULT NULL,
  `DI_CANEDITPROJECT` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DI_DIVISIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `divisions_`
--

DROP TABLE IF EXISTS `divisions_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions_` (
  `DI_DIVISIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `DI_NAMEEN` varchar(100) NOT NULL,
  `DI_NAMEFR` varchar(100) NOT NULL,
  `DI_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DI_STATUS` smallint NOT NULL DEFAULT '1',
  `DI_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `DI_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `DI_TYPE` int DEFAULT '0',
  `UR_MANAGERID` int DEFAULT NULL,
  `DI_DIVISIONCODE` varchar(30) DEFAULT NULL,
  `DI_CANEDITPROJECT` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`DI_DIVISIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `divisions_jobresponsibilities`
--

DROP TABLE IF EXISTS `divisions_jobresponsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions_jobresponsibilities` (
  `JR_RESPONSIBILITYID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `Weight` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`JR_RESPONSIBILITYID`,`DI_DIVISIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_preferences`
--

DROP TABLE IF EXISTS `employee_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_preferences` (
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EPO_OPTIONID` int NOT NULL,
  `EO_DETAILS` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`EPO_OPTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeepreference_option_types`
--

DROP TABLE IF EXISTS `employeepreference_option_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeepreference_option_types` (
  `EPOT_CODE` varchar(10) NOT NULL,
  `NAMEFR` varchar(500) DEFAULT NULL,
  `NAMEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`EPOT_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeepreference_options`
--

DROP TABLE IF EXISTS `employeepreference_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeepreference_options` (
  `EPO_OPTIONID` int NOT NULL,
  `EPO_NAMEFR` varchar(500) DEFAULT NULL,
  `EPO_NAMEN` varchar(500) DEFAULT NULL,
  `EPOT_CODE` varchar(10) DEFAULT NULL,
  `EPO_VALUE` int DEFAULT NULL,
  PRIMARY KEY (`EPO_OPTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(100) NOT NULL COMMENT 'Name',
  `email` varchar(255) NOT NULL COMMENT 'Email Address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='datatable demo table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employeetypes`
--

DROP TABLE IF EXISTS `employeetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetypes` (
  `ET_EMPLOYEETYPEID` int NOT NULL,
  `ET_CODE` varchar(10) DEFAULT NULL,
  `ET_NAMEFR` varchar(500) DEFAULT NULL,
  `ET_NAMEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ET_EMPLOYEETYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluation_companytemplates`
--

DROP TABLE IF EXISTS `evaluation_companytemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation_companytemplates` (
  `CO_COMPANYID` int NOT NULL,
  `ECT_TEMPLATEID` int NOT NULL,
  `ECT_NAMEFR` varchar(500) DEFAULT NULL,
  `ECT_NAMEEN` varchar(500) DEFAULT NULL,
  `ECT_COMPETENCY_SCALETYPEID` int DEFAULT NULL,
  `ECT_OBJECTIVE_SCALETYPEID` int DEFAULT NULL,
  `ECT_RESPONSABILITY_SCALETYPEID` int DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`ECT_TEMPLATEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluationprocess_steps`
--

DROP TABLE IF EXISTS `evaluationprocess_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluationprocess_steps` (
  `EPS_STEPID` int NOT NULL,
  `EPS_STEPNUMBER` int NOT NULL,
  `EPS_NAMEFR` varchar(500) DEFAULT NULL,
  `EPS_NAMEEN` varchar(500) DEFAULT NULL,
  `EPS_DESCRIPTIONFR` varchar(2000) DEFAULT NULL,
  `EPS_DESCRIPTIONEN` varchar(2000) DEFAULT NULL,
  `EPS_LIMITDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`EPS_STEPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluationprocess_steps_logs`
--

DROP TABLE IF EXISTS `evaluationprocess_steps_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluationprocess_steps_logs` (
  `EPSL_LOGID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `EPSL_DATEDONE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EV_STEPBEFORE` int NOT NULL,
  `EV_STEPAFTER` int NOT NULL,
  `UR_DONEBYUSERID` int DEFAULT NULL,
  PRIMARY KEY (`EPSL_LOGID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations` (
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EV_STARTDATE` datetime(6) DEFAULT NULL,
  `EV_ENDDATE` datetime(6) DEFAULT NULL,
  `EV_FOLLOWUPDATE` datetime(6) DEFAULT NULL,
  `UR_USERID` int NOT NULL,
  `EV_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EV_CURRENTSTEP` int DEFAULT '0',
  `PF_PROFILEID` int DEFAULT '1',
  `EV_STARTDATE_FINALE` datetime(6) DEFAULT NULL,
  `EC_CYCLEID` int DEFAULT NULL,
  `JP_JOBPOSITIONID_HISTORY` int DEFAULT NULL,
  `UR_SUPERIORID_HISTORY` int DEFAULT NULL,
  `UR_HIER_SUPID_HISTORY` int DEFAULT NULL,
  `DP_DEPARTMENTID_HISTORY` int DEFAULT NULL,
  `EV_STEP_WHENQUIT` int DEFAULT NULL,
  `EV_COMPLETESTATUS` int NOT NULL DEFAULT '1',
  `EV_ISTRYOUT` tinyint(1) DEFAULT NULL,
  `ECT_TEMPLATEID` int DEFAULT NULL,
  `EV_EMPLOYEE_DRAFTMODE` tinyint(1) NOT NULL DEFAULT '1',
  `EV_MANAGER_DRAFTMODE` tinyint(1) NOT NULL DEFAULT '1',
  `EV_SPECIFIC_SUPERIORID` int DEFAULT NULL,
  `EV_AUTOEVAL_OBJECTIVE_CONFIRMED` tinyint(1) NOT NULL DEFAULT '0',
  `EV_AUTOEVAL_COMPETENCY_CONFIRMED` tinyint(1) NOT NULL DEFAULT '0',
  `EV_AUTOEVAL_RESPONSIBILITY_CONFIRMED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EV_EVALUATIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_behaviors`
--

DROP TABLE IF EXISTS `evaluations_behaviors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_behaviors` (
  `CO_COMPANYID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `BE_BEHAVIORID` int NOT NULL,
  `EC_DRAFT` int NOT NULL,
  `SC_SUPERIORSCALEID` int DEFAULT NULL,
  `SC_EMPLOYESCALEID` int DEFAULT NULL,
  `EC_WEIGHT` smallint DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`EV_EVALUATIONID`,`CP_COMPETENCYID`,`BE_BEHAVIORID`,`EC_DRAFT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_competencies`
--

DROP TABLE IF EXISTS `evaluations_competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_competencies` (
  `CO_COMPANYID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `EC_DRAFT` int NOT NULL,
  `LV_LEVELID` int DEFAULT NULL,
  `EC_EMPLOYECOMMENT` varchar(2048) DEFAULT NULL,
  `EC_SUPERIORCOMMENT` varchar(2048) DEFAULT NULL,
  `EC_PRIORITY` tinyint unsigned DEFAULT NULL,
  `EC_EMPLOYELASTUPDATE` datetime(6) DEFAULT NULL,
  `EC_SUPERIORLASTUPDATE` datetime(6) DEFAULT NULL,
  `EC_WEIGHT` smallint DEFAULT NULL,
  `SC_EMPLOYEEMASTERING_SCALEID` int DEFAULT NULL,
  `SC_EMPLOYEEINTEREST_SCALEID` int DEFAULT NULL,
  `SC_EMPLOYEEDEVELOPMENTNEED_SCALEID` int DEFAULT NULL,
  `SC_SUPERIORMASTERING_SCALEID` int DEFAULT NULL,
  `EC_DONOTEVALUATE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CO_COMPANYID`,`EV_EVALUATIONID`,`CP_COMPETENCYID`,`EC_DRAFT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_consultations`
--

DROP TABLE IF EXISTS `evaluations_consultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_consultations` (
  `EC_CONSULTATIONID` int NOT NULL,
  `UL_LOGID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `EC_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EV_CURRENTSTEP` int NOT NULL,
  PRIMARY KEY (`EC_CONSULTATIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_cycles`
--

DROP TABLE IF EXISTS `evaluations_cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_cycles` (
  `EC_CYCLEID` int NOT NULL,
  `EC_STARTDATE` datetime(6) NOT NULL,
  `EC_ENDDATE` datetime(6) NOT NULL,
  `EC_DESCRIPTIONFR` varchar(2048) NOT NULL,
  `EC_DESCRIPTIONEN` varchar(2048) NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EC_STATUS` int DEFAULT NULL,
  `EC_NAMEFR` varchar(100) DEFAULT NULL,
  `EC_NAMEEN` varchar(100) DEFAULT NULL,
  `EC_FollowupDate` datetime(6) DEFAULT NULL,
  `EC_ISOPEN` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`EC_CYCLEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_endyear_files`
--

DROP TABLE IF EXISTS `evaluations_endyear_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_endyear_files` (
  `FileGUID` varchar(64) NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`EV_EVALUATIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_genericevalstatements`
--

DROP TABLE IF EXISTS `evaluations_genericevalstatements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_genericevalstatements` (
  `CO_COMPANYID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `GET_GENERICSTATEMENTID` int NOT NULL,
  `EGET_EMPLOYEECOMMENT` varchar(8000) DEFAULT NULL,
  `EGET_MANAGERCOMMENT` varchar(8000) DEFAULT NULL,
  `SC_MANAGERSCALEID` int DEFAULT NULL,
  `SC_EMPLOYEESCALEID` int DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`EV_EVALUATIONID`,`GET_GENERICSTATEMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_knowledges`
--

DROP TABLE IF EXISTS `evaluations_knowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_knowledges` (
  `CO_COMPANYID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `KN_KNOWLEDGEID` int NOT NULL,
  `LV_LEVELID` int DEFAULT NULL,
  `EC_EMPLOYECOMMENT` varchar(2048) DEFAULT NULL,
  `EC_SUPERIORCOMMENT` varchar(2048) DEFAULT NULL,
  `EC_PRIORITY` tinyint unsigned DEFAULT NULL,
  `EC_EMPLOYELASTUPDATE` datetime(6) DEFAULT NULL,
  `EC_SUPERIORLASTUPDATE` datetime(6) DEFAULT NULL,
  `EC_WEIGHT` smallint DEFAULT NULL,
  `SC_EMPLOYEEMASTERING_SCALEID` int DEFAULT NULL,
  `SC_EMPLOYEEINTEREST_SCALEID` int DEFAULT NULL,
  `SC_EMPLOYEEDEVELOPMENTNEED_SCALEID` int DEFAULT NULL,
  `SC_SUPERIORMASTERING_SCALEID` int DEFAULT NULL,
  `EC_DONOTEVALUATE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CO_COMPANYID`,`EV_EVALUATIONID`,`KN_KNOWLEDGEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_midyear_files`
--

DROP TABLE IF EXISTS `evaluations_midyear_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_midyear_files` (
  `FileGUID` varchar(64) NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`EV_EVALUATIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_responsibilities`
--

DROP TABLE IF EXISTS `evaluations_responsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_responsibilities` (
  `CO_COMPANYID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `JR_RESPONSIBILITYID` int NOT NULL,
  `LV_LEVELID` int DEFAULT NULL,
  `EC_EMPLOYECOMMENT` varchar(2048) DEFAULT NULL,
  `EC_SUPERIORCOMMENT` varchar(2048) DEFAULT NULL,
  `EC_PRIORITY` tinyint unsigned DEFAULT NULL,
  `EC_EMPLOYELASTUPDATE` datetime(6) DEFAULT NULL,
  `EC_SUPERIORLASTUPDATE` datetime(6) DEFAULT NULL,
  `EC_WEIGHT` smallint DEFAULT NULL,
  `SC_EMPLOYEEMASTERING_SCALEID` int DEFAULT NULL,
  `SC_EMPLOYEEINTEREST_SCALEID` int DEFAULT NULL,
  `SC_EMPLOYEEDEVELOPMENTNEED_SCALEID` int DEFAULT NULL,
  `SC_SUPERIORMASTERING_SCALEID` int DEFAULT NULL,
  `EC_DONOTEVALUATE` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CO_COMPANYID`,`EV_EVALUATIONID`,`JR_RESPONSIBILITYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluations_uploadeddevplan_files`
--

DROP TABLE IF EXISTS `evaluations_uploadeddevplan_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluations_uploadeddevplan_files` (
  `FileGUID` varchar(64) NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`EV_EVALUATIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `files_types`
--

DROP TABLE IF EXISTS `files_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_types` (
  `FILETYPEID` int NOT NULL,
  `TYPEID` int NOT NULL,
  `PARENT_TYPEID` int NOT NULL,
  `NAMEFR` varchar(100) NOT NULL,
  `NAMEEN` varchar(100) NOT NULL,
  `DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`FILETYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `generalcontractor_submissions`
--

DROP TABLE IF EXISTS `generalcontractor_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generalcontractor_submissions` (
  `PROJECTID` int NOT NULL,
  `GENERALCONTRACTORID` int NOT NULL,
  `MY_AMOUNT` float NOT NULL,
  `IS_CHOSEN` tinyint(1) NOT NULL,
  `COMMENT` text NOT NULL,
  PRIMARY KEY (`PROJECTID`,`GENERALCONTRACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genericevalstatements`
--

DROP TABLE IF EXISTS `genericevalstatements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genericevalstatements` (
  `GET_ID` int NOT NULL,
  `GET_LABEL` varchar(8000) NOT NULL,
  `GET_ORDER` int DEFAULT NULL,
  `GET_LASTUPDATE` datetime(6) DEFAULT NULL,
  `GETS_STATEMENTTYPEID` int NOT NULL,
  `GSTG_STATEMENTGROUPID` int NOT NULL,
  PRIMARY KEY (`GET_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genericevalstatements_groups`
--

DROP TABLE IF EXISTS `genericevalstatements_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genericevalstatements_groups` (
  `GSTG_ID` int NOT NULL,
  `GSTG_LABEL` varchar(8000) NOT NULL,
  `GET_ORDER` int DEFAULT NULL,
  `GET_LASTUPDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GSTG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genericevalstatements_jobpositions`
--

DROP TABLE IF EXISTS `genericevalstatements_jobpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genericevalstatements_jobpositions` (
  `GET_ID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `GEVSJ_STATUS` tinyint unsigned NOT NULL,
  PRIMARY KEY (`GET_ID`,`CO_COMPANYID`,`JP_JOBPOSITIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `genericevalstatements_types`
--

DROP TABLE IF EXISTS `genericevalstatements_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genericevalstatements_types` (
  `GET_ID` int NOT NULL,
  `GET_NAME` varchar(100) NOT NULL,
  `GET_DESCRIPTION` varchar(500) NOT NULL,
  PRIMARY KEY (`GET_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hr_notes`
--

DROP TABLE IF EXISTS `hr_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr_notes` (
  `UR_USERID` int DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `UR_AUTHORUSERID` int DEFAULT NULL,
  `HN_NOTE` varchar(5000) DEFAULT NULL,
  `HN_DATE` datetime(6) DEFAULT NULL,
  `HN_HRNOTEID` int NOT NULL,
  `NHT_TYPEID` int DEFAULT NULL,
  PRIMARY KEY (`HN_HRNOTEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hr_notes_files`
--

DROP TABLE IF EXISTS `hr_notes_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr_notes_files` (
  `HN_HRNOTEID` int NOT NULL,
  `FileGUID` varchar(64) NOT NULL,
  PRIMARY KEY (`HN_HRNOTEID`,`FileGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hr_notetypes`
--

DROP TABLE IF EXISTS `hr_notetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr_notetypes` (
  `NHT_TYPEID` int NOT NULL,
  `NHT_NAMEFR` varchar(500) DEFAULT NULL,
  `NHT_NAMEEN` varchar(500) DEFAULT NULL,
  `NHT_STATUS` int DEFAULT NULL,
  PRIMARY KEY (`NHT_TYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humano_surveys`
--

DROP TABLE IF EXISTS `humano_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humano_surveys` (
  `HS_SURVEYID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `HST_TEMPLATEID` int NOT NULL,
  `HS_CREATIONDATE` datetime(6) DEFAULT NULL,
  `HS_STARTDATE` datetime(6) DEFAULT NULL,
  `HS_ENDDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`HS_SURVEYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humanosurvey_gradations`
--

DROP TABLE IF EXISTS `humanosurvey_gradations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanosurvey_gradations` (
  `HSG_GRADATIONID` int NOT NULL,
  `HSG_NAMEFR` varchar(500) DEFAULT NULL,
  `HSG_NAMEEN` varchar(500) DEFAULT NULL,
  `HSG_MINIMUMNUMERICVALUE` int DEFAULT NULL,
  `HSG_MINIMUMTEXTVALUE` varchar(500) DEFAULT NULL,
  `HSG_MAXIMUMNUMERICVALUE` int DEFAULT NULL,
  `HSG_MAXIMUMTEXTVALUE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`HSG_GRADATIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humanosurvey_questions`
--

DROP TABLE IF EXISTS `humanosurvey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanosurvey_questions` (
  `HSQ_QUESTIONID` int NOT NULL,
  `HST_TEMPLATEID` int NOT NULL,
  `HSG_GRADATIONID` int NOT NULL,
  `HSQ_QUESTIONFR` varchar(5000) DEFAULT NULL,
  `HSQ_QUESTIONEN` varchar(5000) DEFAULT NULL,
  `HSQ_PICTURESOURCE` varchar(500) DEFAULT NULL,
  `HSQ_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`HSQ_QUESTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humanosurvey_results`
--

DROP TABLE IF EXISTS `humanosurvey_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanosurvey_results` (
  `HS_SURVEYID` int NOT NULL,
  `HSQ_QUESTIONID` int NOT NULL,
  `HSR_NUMERICRESULT` int DEFAULT NULL,
  `HSR_TEXTRESULT` varchar(8000) DEFAULT NULL,
  `HSR_RESULTDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`HS_SURVEYID`,`HSQ_QUESTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `humanosurvey_templates`
--

DROP TABLE IF EXISTS `humanosurvey_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humanosurvey_templates` (
  `HST_TEMPLATEID` int NOT NULL,
  `HST_TITLEFR` varchar(500) DEFAULT NULL,
  `HST_TITLEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`HST_TEMPLATEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `IMAGEID` int NOT NULL AUTO_INCREMENT,
  `UploadDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NAME` varchar(200) NOT NULL,
  `Size` int NOT NULL DEFAULT '0',
  `LINK` varchar(256) NOT NULL,
  `DeletionDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`IMAGEID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobcriterias`
--

DROP TABLE IF EXISTS `jobcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobcriterias` (
  `CO_COMPANYID` int NOT NULL,
  `JC_CRITERIAID` int NOT NULL,
  `JC_NAMEFR` varchar(500) DEFAULT NULL,
  `JC_NAMEEN` varchar(500) DEFAULT NULL,
  `JC_DESCRIPTIONFR` varchar(2000) DEFAULT NULL,
  `JC_DESCRIPTIONEN` varchar(2000) DEFAULT NULL,
  `JC_STATUS` char(1) NOT NULL DEFAULT 'A',
  `JC_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`JC_CRITERIAID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobcriterias_assessments`
--

DROP TABLE IF EXISTS `jobcriterias_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobcriterias_assessments` (
  `CO_COMPANYID` int NOT NULL,
  `JCA_ASSESSMENTID` int NOT NULL,
  `JC_CRITERIAID` int DEFAULT NULL,
  `UR_USERID` int DEFAULT NULL,
  `JP_JOBPOSITIONID` int DEFAULT NULL,
  `JCA_STARTDATE` datetime(6) DEFAULT NULL,
  `JCA_ENDDATE` datetime(6) DEFAULT NULL,
  `JCA_CREATIONDATE` datetime(6) DEFAULT NULL,
  `UR_CREATORID` datetime(6) DEFAULT NULL,
  `AS_ISCOMPLETE` int DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`JCA_ASSESSMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobcriterias_results`
--

DROP TABLE IF EXISTS `jobcriterias_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobcriterias_results` (
  `CO_COMPANYID` int NOT NULL,
  `JCA_ASSESSMENTID` int NOT NULL,
  `UR_ASSESSORID` int NOT NULL,
  `JC_CRITERIAID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `RE_DATE` datetime(6) DEFAULT NULL,
  `RE_VALUE` int DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`JCA_ASSESSMENTID`,`UR_ASSESSORID`,`JC_CRITERIAID`,`JP_JOBPOSITIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobhistory`
--

DROP TABLE IF EXISTS `jobhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobhistory` (
  `JH_JOBHISTORYID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `JH_JOBNAME` varchar(200) DEFAULT NULL,
  `JH_FROMDATE` datetime(6) DEFAULT NULL,
  `JH_TODATE` datetime(6) DEFAULT NULL,
  `JH_COMPANYNAME` varchar(200) DEFAULT NULL,
  `JP_JOBPOSITIONID` int DEFAULT NULL,
  `DP_DEPARTMENTID` int DEFAULT NULL,
  `JH_ISEXTERNFLAG` int DEFAULT NULL,
  `JH_FROMYEAR` int DEFAULT NULL,
  `JH_DEPARTMENTNAME` varchar(200) DEFAULT NULL,
  `JH_DIVISIONNAME` varchar(200) DEFAULT NULL,
  `JH_TOYEAR` int DEFAULT NULL,
  PRIMARY KEY (`JH_JOBHISTORYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `joblevels`
--

DROP TABLE IF EXISTS `joblevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joblevels` (
  `JL_JOBLEVELID` int NOT NULL,
  `JL_DESCRIPTIONFR` varchar(200) NOT NULL,
  `JL_DESCRIPTIONEN` varchar(200) NOT NULL,
  `JL_STATUS` int NOT NULL,
  PRIMARY KEY (`JL_JOBLEVELID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobpositions`
--

DROP TABLE IF EXISTS `jobpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpositions` (
  `CO_COMPANYID` int NOT NULL,
  `JP_NAMEEN` varchar(100) NOT NULL,
  `JP_NAMEFR` varchar(100) NOT NULL,
  `JP_DESCRIPTIONEN` longtext,
  `JP_DESCRIPTIONFR` varchar(0) DEFAULT NULL,
  `JP_SUPERIORJOBID` int DEFAULT NULL,
  `JP_LEVEL` int NOT NULL,
  `JP_STATUS` smallint NOT NULL DEFAULT '-1',
  `JP_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JP_JOBPOSITIONID` int NOT NULL,
  `PF_PROFILEID` int DEFAULT '1',
  `JP_CODE` varchar(30) DEFAULT NULL,
  `JP_MPOPERSONNALITY_IMAGEFILEPATH` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`JP_JOBPOSITIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobpositions_competencies`
--

DROP TABLE IF EXISTS `jobpositions_competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpositions_competencies` (
  `JP_JOBPOSITIONID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `JC_STATUS` smallint NOT NULL DEFAULT '1',
  `JC_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`JP_JOBPOSITIONID`,`CP_COMPETENCYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobpositions_files`
--

DROP TABLE IF EXISTS `jobpositions_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpositions_files` (
  `FileGUID` varchar(64) NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`JP_JOBPOSITIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobpositions_jobcriterias`
--

DROP TABLE IF EXISTS `jobpositions_jobcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpositions_jobcriterias` (
  `CO_COMPANYID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `JC_CRITERIAID` int NOT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`JP_JOBPOSITIONID`,`JC_CRITERIAID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobpositions_jobresponsibilities`
--

DROP TABLE IF EXISTS `jobpositions_jobresponsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpositions_jobresponsibilities` (
  `JR_RESPONSIBILITYID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `JPR_WEIGHT` int DEFAULT NULL,
  PRIMARY KEY (`JR_RESPONSIBILITYID`,`JP_JOBPOSITIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobreadiness`
--

DROP TABLE IF EXISTS `jobreadiness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobreadiness` (
  `JR_JOBREADINESSID` int NOT NULL,
  `JR_DESCRIPTIONFR` varchar(200) NOT NULL,
  `JR_DESCRIPTIONEN` varchar(200) NOT NULL,
  `JR_STATUS` int NOT NULL,
  PRIMARY KEY (`JR_JOBREADINESSID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobresponsibilities`
--

DROP TABLE IF EXISTS `jobresponsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobresponsibilities` (
  `JR_RESPONSIBILITYID` int NOT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `JR_CODE` varchar(20) DEFAULT NULL,
  `JR_NAMEFR` varchar(500) DEFAULT NULL,
  `JR_NAMEEN` varchar(500) DEFAULT NULL,
  `JR_DESCRIPTIONFR` varchar(1000) DEFAULT NULL,
  `JR_DESCRIPTIONEN` varchar(1000) DEFAULT NULL,
  `JR_STATUS` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`JR_RESPONSIBILITYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyactions`
--

DROP TABLE IF EXISTS `keyactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyactions` (
  `KA_KEYACTIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `KA_NAMEEN` varchar(2048) NOT NULL,
  `KA_NAMEFR` varchar(2048) NOT NULL,
  `KA_DESCRIPTIONEN` varchar(4000) DEFAULT NULL,
  `KA_DESCRIPTIONFR` varchar(4000) DEFAULT NULL,
  `KA_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `KA_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  `KA_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`KA_KEYACTIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knowledges`
--

DROP TABLE IF EXISTS `knowledges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledges` (
  `KN_KNOWLEDGEID` int NOT NULL,
  `KN_NAMEFR` varchar(1000) DEFAULT NULL,
  `KN_NAMEEN` varchar(1000) DEFAULT NULL,
  `KN_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `KN_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `KN_STATUS` tinyint unsigned DEFAULT NULL,
  `KN_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`KN_KNOWLEDGEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knowledges_jobs`
--

DROP TABLE IF EXISTS `knowledges_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledges_jobs` (
  `CO_COMPANYID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `KN_KNOWLEDGEID` int NOT NULL,
  `KJ_NOTES` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`JP_JOBPOSITIONID`,`KN_KNOWLEDGEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knowledges_users`
--

DROP TABLE IF EXISTS `knowledges_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledges_users` (
  `CO_COMPANYID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `KN_KNOWLEDGEID` int NOT NULL,
  PRIMARY KEY (`CO_COMPANYID`,`UR_USERID`,`KN_KNOWLEDGEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knowledgeuser_historylogs`
--

DROP TABLE IF EXISTS `knowledgeuser_historylogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledgeuser_historylogs` (
  `KUH_HISTORYID` int NOT NULL,
  `UR_USER` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `KUH_DATE` datetime(6) DEFAULT NULL,
  `KUH_DESCRIPTIONFR` longtext,
  `KUH_DESCRIPTIONEN` longtext,
  PRIMARY KEY (`KUH_HISTORYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leadership_themes`
--

DROP TABLE IF EXISTS `leadership_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leadership_themes` (
  `LT_THEMEID` int NOT NULL,
  `LT_NAMEFR` varchar(200) NOT NULL,
  `LT_NAMEEN` varchar(200) NOT NULL,
  `LT_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`LT_THEMEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `learningdifficulties_types`
--

DROP TABLE IF EXISTS `learningdifficulties_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learningdifficulties_types` (
  `LDT_TYPEID` int NOT NULL,
  `LDT_NAMEFR` varchar(50) DEFAULT NULL,
  `LDT_NAMEEN` varchar(50) DEFAULT NULL,
  `LDT_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  `LDT_CODE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LDT_TYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `managers_notes`
--

DROP TABLE IF EXISTS `managers_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers_notes` (
  `UR_USERID` int DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `UR_SUPERIORID` int DEFAULT NULL,
  `MN_NOTE` varchar(5000) DEFAULT NULL,
  `MN_DATE` datetime(6) DEFAULT NULL,
  `MN_MANAGERNOTEID` int NOT NULL,
  `MN_DELETEDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`MN_MANAGERNOTEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_types`
--

DROP TABLE IF EXISTS `message_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_types` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `CO_COMPANYID` int NOT NULL,
  `ME_MESSAGEID` int NOT NULL AUTO_INCREMENT,
  `ME_CODE` varchar(20) NOT NULL,
  `ME_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `ME_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `ME_SUBJECTFR` varchar(500) DEFAULT NULL,
  `ME_SUBJECTEN` varchar(500) DEFAULT NULL,
  `ME_TYPEFR` varchar(500) NOT NULL,
  `ME_TYPEEN` varchar(500) NOT NULL,
  `ME_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CO_COMPANYID`,`ME_MESSAGEID`),
  UNIQUE KEY `ME_CODE` (`ME_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_choiceanswers`
--

DROP TABLE IF EXISTS `mywine_choiceanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_choiceanswers` (
  `MWQ_QUESTIONID` int NOT NULL,
  `MWC_COLORID` int NOT NULL,
  `MWCA_CHOICEANSWERLABELFR` varchar(1000) DEFAULT NULL,
  `MWCA_CHOICEANSWERLABELEN` varchar(1000) DEFAULT NULL,
  `MWCA_DISPLAYORDER` tinyint unsigned DEFAULT NULL,
  `MWCA_LETTER` char(1) DEFAULT NULL,
  PRIMARY KEY (`MWQ_QUESTIONID`,`MWC_COLORID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_colors`
--

DROP TABLE IF EXISTS `mywine_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_colors` (
  `MWC_COLORID` int NOT NULL,
  `MWC_NAMEFR` varchar(500) DEFAULT NULL,
  `MWC_NAMEEN` varchar(500) DEFAULT NULL,
  `MWC_HEXCOLOR` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`MWC_COLORID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_feedbackquestions`
--

DROP TABLE IF EXISTS `mywine_feedbackquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_feedbackquestions` (
  `MWFQ_QUESTIONID` int NOT NULL,
  `MWFQ_NAMEFR` varchar(1000) DEFAULT NULL,
  `MWFQ_NAMEEN` varchar(1000) DEFAULT NULL,
  `MWFW_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`MWFQ_QUESTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_feedbackresults`
--

DROP TABLE IF EXISTS `mywine_feedbackresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_feedbackresults` (
  `MWS_SURVEYID` int NOT NULL,
  `MWFQ_QUESTIONID` int NOT NULL,
  `MWFR_ANSWERVALUE` int DEFAULT NULL,
  PRIMARY KEY (`MWS_SURVEYID`,`MWFQ_QUESTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_groupreports_files`
--

DROP TABLE IF EXISTS `mywine_groupreports_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_groupreports_files` (
  `FileGUID` varchar(64) NOT NULL,
  `MWG_GROUPID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`MWG_GROUPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_groups`
--

DROP TABLE IF EXISTS `mywine_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_groups` (
  `MWG_GROUPID` int NOT NULL,
  `MWG_NAMEFR` varchar(1000) DEFAULT NULL,
  `MWG_NAMEEN` varchar(1000) DEFAULT NULL,
  `MWG_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `MWG_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `MWM_MESSAGEID` int DEFAULT NULL,
  PRIMARY KEY (`MWG_GROUPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_importanceclasses`
--

DROP TABLE IF EXISTS `mywine_importanceclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_importanceclasses` (
  `MWI_IMPORTANCECLASSID` int NOT NULL,
  `MWI_NAMEFR` varchar(500) DEFAULT NULL,
  `MWI_NAMEEN` varchar(500) DEFAULT NULL,
  `MWI_PRIORITY` tinyint unsigned NOT NULL,
  PRIMARY KEY (`MWI_IMPORTANCECLASSID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_messages`
--

DROP TABLE IF EXISTS `mywine_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_messages` (
  `MWM_MESSAGEID` int NOT NULL,
  `MWM_SUBJECT` varchar(1000) DEFAULT NULL,
  `MWM_BODY` varchar(8000) DEFAULT NULL,
  `MWM_NAMEFR` varchar(1000) DEFAULT NULL,
  `MWM_NAMEEN` varchar(1000) DEFAULT NULL,
  `MWM_TYPE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`MWM_MESSAGEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_questions`
--

DROP TABLE IF EXISTS `mywine_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_questions` (
  `MWQ_QUESTIONID` int NOT NULL,
  `MWQ_DESCRIPTIONFR` varchar(1000) DEFAULT NULL,
  `MWQ_DESCRIPTIONEN` varchar(1000) DEFAULT NULL,
  `MWQ_DISPLAYORDER` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`MWQ_QUESTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_results`
--

DROP TABLE IF EXISTS `mywine_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_results` (
  `MWS_SURVEYID` int NOT NULL,
  `MWQ_QUESTIONID` int NOT NULL,
  `MWC_COLORID` int NOT NULL,
  `MWI_IMPORTANCECLASSID` int NOT NULL,
  PRIMARY KEY (`MWS_SURVEYID`,`MWQ_QUESTIONID`,`MWC_COLORID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_surveys`
--

DROP TABLE IF EXISTS `mywine_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_surveys` (
  `MWS_SURVEYID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `MWS_COMPLETED` tinyint(1) NOT NULL DEFAULT '0',
  `MWS_STARTDATETIME` datetime(6) DEFAULT NULL,
  `MWS_ENDDATETIME` datetime(6) DEFAULT NULL,
  `MYG_GROUPID` int DEFAULT NULL,
  `MWS_LASTSENTLINKDATE` datetime(6) DEFAULT NULL,
  `MWS_FEEDBACKCOMMENTS` varchar(8000) DEFAULT NULL,
  `MWS_LASTSENTFEEDBACKLINKDATE` datetime(6) DEFAULT NULL,
  `MWS_FEEDBACKQUESTIONNAIRECOMPLETED` tinyint(1) NOT NULL DEFAULT '0',
  `MWS_DOMINANTCOLORID` int DEFAULT NULL,
  `MWS_ASCENDINGCOLORID` int DEFAULT NULL,
  `MWS_CREATIONDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`MWS_SURVEYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mywine_surveys_files`
--

DROP TABLE IF EXISTS `mywine_surveys_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mywine_surveys_files` (
  `FileGUID` varchar(64) NOT NULL,
  `MWS_SURVEYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`MWS_SURVEYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `naics_classifications`
--

DROP TABLE IF EXISTS `naics_classifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `naics_classifications` (
  `NAICS_CODE` varchar(6) NOT NULL,
  `NAICS_TITLEFR` varchar(500) DEFAULT NULL,
  `NAICS_TITLEEN` varchar(500) DEFAULT NULL,
  `NAICS_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `NAICS_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `NAICS_LEVEL` smallint DEFAULT NULL,
  `NAICS_HIERARCHICALSTRUCTURE` varchar(100) DEFAULT NULL,
  `NAICS_PARENTCODE` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`NAICS_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `NT_NOTIFICATIONTEMPLATEID` int NOT NULL,
  `NT_MESSAGETEMPLATEFR` varchar(1000) DEFAULT NULL,
  `NT_MESSAGETEMPLATEEN` varchar(1000) DEFAULT NULL,
  `NT_TITLETEMPLATEFR` varchar(100) DEFAULT NULL,
  `NT_TITLETEMPLATEEN` varchar(100) DEFAULT NULL,
  `NT_DEFAULTIMAGEPATH` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`NT_NOTIFICATIONTEMPLATEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications_batchs`
--

DROP TABLE IF EXISTS `notifications_batchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_batchs` (
  `NB_BATCHID` int NOT NULL,
  `NB_BATCHDATE` datetime(6) NOT NULL,
  `NB_TRIGGERUSERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `NB_BATCHNOTE` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`NB_BATCHID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications_users`
--

DROP TABLE IF EXISTS `notifications_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications_users` (
  `NU_NOTIFICATIONID` int NOT NULL,
  `NU_TARGETUSERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `NT_NOTIFICATIONTEMPLATEID` int NOT NULL,
  `UR_CONCERNEDUSERID` int DEFAULT NULL,
  `NU_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NU_IMAGEPATH` varchar(1000) DEFAULT NULL,
  `NU_URL` varchar(1000) DEFAULT NULL,
  `NU_WEBSITEISREADED` tinyint(1) DEFAULT '0',
  `NU_WEBSITEADDITIONALMESSAGEFR` varchar(1000) DEFAULT NULL,
  `NU_WEBSITEADDITIONALMESSAGEEN` varchar(1000) DEFAULT NULL,
  `NU_WEBSITENOTIFICATIONTYPE` tinyint(1) NOT NULL DEFAULT '0',
  `NU_EMAILNOTIFICATIONTYPE` tinyint(1) NOT NULL DEFAULT '0',
  `NU_EMAILTITLE` varchar(500) DEFAULT NULL,
  `NU_EMAILCONTENT` varchar(8000) DEFAULT NULL,
  `NU_SMSNOTIFICATIONTYPE` tinyint(1) NOT NULL DEFAULT '0',
  `NU_SMSCONTENT` varchar(500) DEFAULT NULL,
  `NU_TRIGGEREDBYUSERID` int DEFAULT NULL,
  `NB_BATCHID` int DEFAULT NULL,
  PRIMARY KEY (`NU_NOTIFICATIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objective_autopush_groups`
--

DROP TABLE IF EXISTS `objective_autopush_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective_autopush_groups` (
  `OAG_GROUPID` int NOT NULL,
  `OAG_CODE` varchar(50) DEFAULT NULL,
  `OAG_NAMEFR` varchar(500) DEFAULT NULL,
  `OAG_NAMEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`OAG_GROUPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objective_autopush_templates`
--

DROP TABLE IF EXISTS `objective_autopush_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective_autopush_templates` (
  `OAT_TEMPLATEID` int NOT NULL,
  `OAT_CODE` varchar(50) NOT NULL,
  `OAT_NAMEFR` varchar(500) NOT NULL,
  `OAT_NAMEEN` varchar(500) NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EO_DRAFT` int NOT NULL,
  `EO_DESCRIPTION` varchar(5000) DEFAULT NULL,
  `EO_WEIGHT` int DEFAULT NULL,
  `EO_LASTUPDATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `EO_SUPERIORPERCENTAGEACHIEVED` int DEFAULT '0',
  `EO_ACHIEVEMENTDATE` datetime(6) DEFAULT NULL,
  `OT_TYPEID` int DEFAULT NULL,
  `EO_ISAPPROVED` tinyint(1) NOT NULL DEFAULT '0',
  `EO_CREATIONDATE` datetime(6) DEFAULT NULL,
  `OAG_GROUPID` int DEFAULT NULL,
  `OAT_DISPLAYORDER` int NOT NULL DEFAULT '1',
  `EC_CYCLEID` int DEFAULT NULL,
  PRIMARY KEY (`OAT_TEMPLATEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectiveautopushgroups_jobpositions`
--

DROP TABLE IF EXISTS `objectiveautopushgroups_jobpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectiveautopushgroups_jobpositions` (
  `OAG_GROUPID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  PRIMARY KEY (`OAG_GROUPID`,`CO_COMPANYID`,`JP_JOBPOSITIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectives_achievements`
--

DROP TABLE IF EXISTS `objectives_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives_achievements` (
  `OA_OBJECTIVEACHIEVEMENTID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EO_OBJECTIVEID` int NOT NULL,
  `OA_DESCRIPTION` varchar(8000) DEFAULT NULL,
  `EO_DRAFT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`OA_OBJECTIVEACHIEVEMENTID`,`EV_EVALUATIONID`,`CO_COMPANYID`,`EO_DRAFT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectives_actionplans`
--

DROP TABLE IF EXISTS `objectives_actionplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives_actionplans` (
  `OAP_ACTIONID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `EO_OBJECTIVEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `OAP_ACTIONDESC` varchar(2048) NOT NULL,
  `OAP_RESSOURCESDESC` varchar(2048) DEFAULT NULL,
  `OAP_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`OAP_ACTIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectives_difficulties`
--

DROP TABLE IF EXISTS `objectives_difficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives_difficulties` (
  `OD_OBJECTIVEDIFFICULTYID` int NOT NULL,
  `OD_DESCRIPTION` varchar(2048) DEFAULT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EO_OBJECTIVEID` int NOT NULL,
  `EO_DRAFT` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`OD_OBJECTIVEDIFFICULTYID`,`EV_EVALUATIONID`,`CO_COMPANYID`,`EO_DRAFT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectives_modificationlogs`
--

DROP TABLE IF EXISTS `objectives_modificationlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives_modificationlogs` (
  `OML_MODIFICATIONLOGID` int NOT NULL,
  `EV_EVALUATIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `EO_OBJECTIVEID` int DEFAULT NULL,
  `UR_USERID` int NOT NULL,
  `OML_MODIFICATIONDATE` datetime(6) DEFAULT NULL,
  `EO_BEFORE_DESCRIPTION` varchar(8000) DEFAULT NULL,
  `EO_BEFORE_WEIGHT` int DEFAULT NULL,
  `EO_BEFORE_ACHIEVEMENTDATE` datetime(6) DEFAULT NULL,
  `EO_AFTER_DESCRIPTION` varchar(8000) DEFAULT NULL,
  `EO_AFTER_WEIGHT` int DEFAULT NULL,
  `EO_AFTER_ACHIEVEMENTDATE` datetime(6) DEFAULT NULL,
  `OML_TOKEN` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`OML_MODIFICATIONLOGID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectives_themes`
--

DROP TABLE IF EXISTS `objectives_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives_themes` (
  `OT_OBJECTIVETHEMEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `OT_THEMEDESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `OT_THEMEDESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `OT_THEMEDESCRIPTION` varchar(2048) DEFAULT NULL,
  `OT_STATUS` int DEFAULT NULL,
  PRIMARY KEY (`OT_OBJECTIVETHEMEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objectives_types`
--

DROP TABLE IF EXISTS `objectives_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objectives_types` (
  `OT_TYPEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `OT_TYPENAMEFR` varchar(50) DEFAULT NULL,
  `OT_TYPENAMEEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`OT_TYPEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `observeddifficulties`
--

DROP TABLE IF EXISTS `observeddifficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `observeddifficulties` (
  `OD_DIFFICULTYID` int NOT NULL,
  `OD_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `OD_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `OD_TYPE` char(1) DEFAULT NULL COMMENT 'I=Insuffisant, E=Excessif',
  `OD_CODE` varchar(20) DEFAULT NULL,
  `OD_STATUS` int NOT NULL DEFAULT '1',
  `OD_NAMEFR` varchar(2048) DEFAULT NULL,
  `OD_NAMEEN` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`OD_DIFFICULTYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organisation_values`
--

DROP TABLE IF EXISTS `organisation_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisation_values` (
  `OV_VALUEID` int NOT NULL,
  `OV_NAMEFR` varchar(500) DEFAULT NULL,
  `OV_NAMEEN` varchar(500) DEFAULT NULL,
  `OV_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `OV_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `OV_STATUS` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`OV_VALUEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_template_divisions`
--

DROP TABLE IF EXISTS `p_template_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_template_divisions` (
  `PJ_P_TEMPLATEID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `NOTE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PJ_P_TEMPLATEID`,`DI_DIVISIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_template_step_maintasks`
--

DROP TABLE IF EXISTS `p_template_step_maintasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_template_step_maintasks` (
  `PMT_MAINTASKID` int NOT NULL,
  `PS_STEPID` int NOT NULL,
  `PMT_DESCRIPTION` varchar(5000) NOT NULL,
  `PMT_COMMENT` varchar(5000) DEFAULT NULL,
  `PMT_DELETEROWDATE` datetime(6) DEFAULT NULL,
  `PMT_DISPLAYORDER` int NOT NULL,
  PRIMARY KEY (`PMT_MAINTASKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_template_step_subtasks`
--

DROP TABLE IF EXISTS `p_template_step_subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_template_step_subtasks` (
  `PST_SUBTASKID` int NOT NULL,
  `PMT_MAINTASKID` int NOT NULL,
  `PST_DESCRIPTION` varchar(5000) NOT NULL,
  `PST_COMMENT` varchar(5000) DEFAULT NULL,
  `PST_DELETEROWDATE` datetime(6) DEFAULT NULL,
  `PST_DISPLAYORDER` int NOT NULL,
  PRIMARY KEY (`PST_SUBTASKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_template_steps`
--

DROP TABLE IF EXISTS `p_template_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_template_steps` (
  `PS_STEPID` int NOT NULL,
  `PT_P_TEMPLATEID` int NOT NULL,
  `PS_NUMBER` int NOT NULL,
  `PS_DESCRIPTION` varchar(5000) NOT NULL,
  `PS_DELETEROWDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PS_STEPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_template_steps_checkpoint`
--

DROP TABLE IF EXISTS `p_template_steps_checkpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_template_steps_checkpoint` (
  `PS_STEPID` int NOT NULL,
  `CP_CHECKPOINTID` int NOT NULL,
  `Note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PS_STEPID`,`CP_CHECKPOINTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_template_steps_division`
--

DROP TABLE IF EXISTS `p_template_steps_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_template_steps_division` (
  `PS_STEPID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `Note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PS_STEPID`,`DI_DIVISIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_templates`
--

DROP TABLE IF EXISTS `p_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_templates` (
  `PT_P_TEMPLATEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PT_CODE` varchar(50) DEFAULT NULL,
  `PT_TITLE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PT_P_TEMPLATEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passions`
--

DROP TABLE IF EXISTS `passions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passions` (
  `PA_PASSIONID` int NOT NULL,
  `PA_NAMEFR` varchar(500) DEFAULT NULL,
  `PA_NAMEEN` varchar(500) DEFAULT NULL,
  `PA_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `PA_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `PA_STATUS` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`PA_PASSIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `PE_PERMISSIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PE_NAME` varchar(100) NOT NULL,
  `PE_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `PE_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `PE_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PE_PERMISSIONID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personalmoods`
--

DROP TABLE IF EXISTS `personalmoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalmoods` (
  `PM_MOODID` int NOT NULL,
  `PM_NAMEFR` varchar(500) DEFAULT NULL,
  `PM_NAMEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PM_MOODID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities` (
  `PR_PRIORITYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PR_NAMEFR` varchar(2048) DEFAULT NULL,
  `PR_NAMEEN` varchar(2048) DEFAULT NULL,
  `PR_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `PR_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `PR_STATUS` int DEFAULT NULL,
  `PR_ORDER` int DEFAULT NULL,
  `EC_CYCLEID` int DEFAULT NULL,
  PRIMARY KEY (`PR_PRIORITYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priorities_companies`
--

DROP TABLE IF EXISTS `priorities_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities_companies` (
  `PR_PRIORITYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`PR_PRIORITYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priorities_departments`
--

DROP TABLE IF EXISTS `priorities_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities_departments` (
  `PR_PRIORITYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `DP_DEPARTMENTID` int NOT NULL,
  PRIMARY KEY (`PR_PRIORITYID`,`CO_COMPANYID`,`DP_DEPARTMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `priorities_divisions`
--

DROP TABLE IF EXISTS `priorities_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities_divisions` (
  `PR_PRIORITYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  PRIMARY KEY (`PR_PRIORITYID`,`CO_COMPANYID`,`DI_DIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocument_historylogs`
--

DROP TABLE IF EXISTS `proceduredocument_historylogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocument_historylogs` (
  `PDH_HISTORYID` int NOT NULL,
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  `PDH_DATE` datetime(6) DEFAULT NULL,
  `PDH_DESCRIPTIONFR` longtext,
  `PDH_DESCRIPTIONEN` longtext,
  PRIMARY KEY (`PDH_HISTORYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocument_types`
--

DROP TABLE IF EXISTS `proceduredocument_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocument_types` (
  `PDT_TYPEID` int NOT NULL,
  `PDT_NAMEFR` varchar(500) DEFAULT NULL,
  `PDT_NAMEEN` varchar(500) DEFAULT NULL,
  `PDT_DESCRIPTIONFR` varchar(500) DEFAULT NULL,
  `PDT_DESCRIPTIONEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PDT_TYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocuments`
--

DROP TABLE IF EXISTS `proceduredocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocuments` (
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  `PD_CODE` varchar(10) DEFAULT NULL,
  `UR_DEFAULTAPPROVINGUSERID` int NOT NULL,
  `UR_CREATIONUSERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PD_CREATIONDATE` datetime(6) NOT NULL,
  `PD_NAMEFR` varchar(1000) DEFAULT NULL,
  `PD_NAMEEN` varchar(1000) DEFAULT NULL,
  `PD_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `PD_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  `PDT_TYPEID` int NOT NULL,
  `PD_STATUS` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`PD_PROCEDUREDOCUMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocuments_departments`
--

DROP TABLE IF EXISTS `proceduredocuments_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocuments_departments` (
  `DP_DEPARTMENTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  PRIMARY KEY (`DP_DEPARTMENTID`,`CO_COMPANYID`,`PD_PROCEDUREDOCUMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocuments_divisions`
--

DROP TABLE IF EXISTS `proceduredocuments_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocuments_divisions` (
  `DI_DIVIDIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  PRIMARY KEY (`DI_DIVIDIONID`,`CO_COMPANYID`,`PD_PROCEDUREDOCUMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocuments_files`
--

DROP TABLE IF EXISTS `proceduredocuments_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocuments_files` (
  `FileGUID` varchar(64) NOT NULL,
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  `UR_APPROVALUSERID` int NOT NULL,
  `UR_UPLOADUSERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PDF_UPLOADUSERCOMMENT` varchar(5000) DEFAULT NULL,
  `PDF_VERSIONNUMBER` int DEFAULT NULL,
  `PDF_APPROVALDATE` datetime(6) DEFAULT NULL,
  `PDF_FIRSTAPPROVALEMAIL_SENT` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FileGUID`,`PD_PROCEDUREDOCUMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocuments_files_consultations`
--

DROP TABLE IF EXISTS `proceduredocuments_files_consultations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocuments_files_consultations` (
  `FileGUID` varchar(64) NOT NULL,
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  `PDFC_CONSULTATIONDATE` datetime(6) DEFAULT NULL,
  `UR_CONCERNEDUSERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proceduredocuments_jobpositions`
--

DROP TABLE IF EXISTS `proceduredocuments_jobpositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceduredocuments_jobpositions` (
  `JP_JOBPOSITIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PD_PROCEDUREDOCUMENTID` int NOT NULL,
  PRIMARY KEY (`JP_JOBPOSITIONID`,`CO_COMPANYID`,`PD_PROCEDUREDOCUMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `PF_PROFILEID` int NOT NULL,
  `PF_NAMEEN` varchar(100) NOT NULL,
  `PF_NAMEFR` varchar(100) NOT NULL,
  `PF_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `PF_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `PF_TYPE` tinyint unsigned NOT NULL,
  `PF_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PF_STATUS` int NOT NULL DEFAULT '1',
  `PF_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PF_PROFILEID`),
  UNIQUE KEY `PF_PROFILEID` (`PF_PROFILEID`),
  UNIQUE KEY `PF_CODE` (`PF_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_competencies`
--

DROP TABLE IF EXISTS `profiles_competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_competencies` (
  `PF_PROFILEID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PC_STATUS` smallint NOT NULL DEFAULT '1',
  `CT_TYPEID` int NOT NULL DEFAULT '1',
  `PC_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`PF_PROFILEID`,`CP_COMPETENCYID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_comptypes_weights`
--

DROP TABLE IF EXISTS `profiles_comptypes_weights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_comptypes_weights` (
  `PF_PROFILEID` int NOT NULL,
  `CT_TYPEID` int NOT NULL,
  `PCW_PERCENT_WEIGHT` int DEFAULT NULL,
  PRIMARY KEY (`PF_PROFILEID`,`CT_TYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_divisions`
--

DROP TABLE IF EXISTS `profiles_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_divisions` (
  `PF_PROFILEID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  `PC_STATUS` smallint NOT NULL DEFAULT '1',
  `CT_TYPEID` int NOT NULL DEFAULT '1',
  `PC_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`PF_PROFILEID`,`DI_DIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profiles_scales`
--

DROP TABLE IF EXISTS `profiles_scales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_scales` (
  `PF_PROFILEID` int NOT NULL,
  `SC_SCALEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PS_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`PF_PROFILEID`,`SC_SCALEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_collaborators`
--

DROP TABLE IF EXISTS `project_collaborators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_collaborators` (
  `PJ_PROJECTID` int NOT NULL,
  `DIVISION_ID` int NOT NULL,
  `PC_DEPARTMENTID` int NOT NULL,
  `GENERALCONTRACTORID` int NOT NULL,
  PRIMARY KEY (`PJ_PROJECTID`,`DIVISION_ID`,`PC_DEPARTMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_collaborators_suppliers`
--

DROP TABLE IF EXISTS `project_collaborators_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_collaborators_suppliers` (
  `PJ_PROJECTID` int NOT NULL,
  `SUBCONTRACTORID` int NOT NULL,
  `SUBDIVISIONID` int NOT NULL,
  `PC_DEPARTMENTID` int NOT NULL,
  PRIMARY KEY (`PJ_PROJECTID`,`SUBDIVISIONID`,`PC_DEPARTMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_companytemplates`
--

DROP TABLE IF EXISTS `project_companytemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_companytemplates` (
  `PCT_TEMPLATEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PCT_SCALETYPEID` int NOT NULL,
  `PCT_NAMEFR` varchar(500) NOT NULL,
  `PCT_NAMEEN` varchar(500) NOT NULL,
  PRIMARY KEY (`PCT_TEMPLATEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_division_subdivisions`
--

DROP TABLE IF EXISTS `project_division_subdivisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_division_subdivisions` (
  `PROJECTID` int NOT NULL,
  `DIVISIONID` int NOT NULL,
  `DIVISIONCODE` varchar(11) NOT NULL,
  `SUBDIVISIONID` int NOT NULL,
  PRIMARY KEY (`PROJECTID`,`DIVISIONID`,`DIVISIONCODE`,`SUBDIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_divisions`
--

DROP TABLE IF EXISTS `project_divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_divisions` (
  `PJ_PROJECTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  `NOTE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PJ_PROJECTID`,`CO_COMPANYID`,`DI_DIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_files` (
  `FileGUID` varchar(64) NOT NULL,
  `PJ_PROJECTID` int NOT NULL,
  `DI_DIVISIONID` int DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `PS_STEPID` int DEFAULT NULL,
  `Note` varchar(0) DEFAULT NULL,
  `UR_USERID` int DEFAULT NULL,
  PRIMARY KEY (`FileGUID`,`PJ_PROJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_files_`
--

DROP TABLE IF EXISTS `project_files_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_files_` (
  `FileGUID` varchar(64) NOT NULL,
  `PJ_PROJECTID` int NOT NULL,
  `DI_DIVISIONID` int DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `PS_STEPID` int DEFAULT NULL,
  `Note` varchar(0) DEFAULT NULL,
  `DP_DEPARTMENTID` int DEFAULT NULL,
  PRIMARY KEY (`FileGUID`,`PJ_PROJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_groups`
--

DROP TABLE IF EXISTS `project_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_groups` (
  `PG_GROUPID` int NOT NULL,
  `PG_NAMEFR` varchar(500) DEFAULT NULL,
  `PG_NAMEEN` varchar(500) DEFAULT NULL,
  `PG_DESCRIPTIONFR` varchar(500) DEFAULT NULL,
  `PG_DESCRIPTIONEN` varchar(500) DEFAULT NULL,
  `PG_STARTDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PG_GROUPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_historylogs`
--

DROP TABLE IF EXISTS `project_historylogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_historylogs` (
  `PJH_HISTORYID` int NOT NULL,
  `PJ_PROJECTID` int NOT NULL,
  `PJH_DATE` datetime(6) DEFAULT NULL,
  `PJH_DESCRIPTIONFR` longtext,
  `PJH_DESCRIPTIONEN` longtext,
  `PLT_LOGTYPEID` int DEFAULT NULL,
  `UR_LOGBYUSERID` int DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `PMT_MAINTASKID` int DEFAULT NULL,
  `PST_SUBTASKID` int DEFAULT NULL,
  PRIMARY KEY (`PJH_HISTORYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_images`
--

DROP TABLE IF EXISTS `project_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_images` (
  `IMAGEID` int NOT NULL,
  `PJ_PROJECTID` int NOT NULL,
  PRIMARY KEY (`IMAGEID`,`PJ_PROJECTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_quotegroup`
--

DROP TABLE IF EXISTS `project_quotegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_quotegroup` (
  `PJ_PROJECTID` int NOT NULL,
  `CL_CLASSIFICATIONIDS` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_secondarymanagers`
--

DROP TABLE IF EXISTS `project_secondarymanagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_secondarymanagers` (
  `PJ_PROJECTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PSM_SECONDARYMANAGER_USERID` int NOT NULL,
  `NOTE` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`PJ_PROJECTID`,`CO_COMPANYID`,`PSM_SECONDARYMANAGER_USERID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_steps`
--

DROP TABLE IF EXISTS `project_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_steps` (
  `PS_STEPID` int NOT NULL,
  `PJ_PROJECTID` int NOT NULL,
  `PS_NUMBER` int NOT NULL,
  `PS_DESCRIPTION` varchar(5000) NOT NULL,
  `PS_DELETEROWDATE` datetime(6) DEFAULT NULL,
  `PS_DUE_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PS_STEPID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_steps_checkpoint`
--

DROP TABLE IF EXISTS `project_steps_checkpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_steps_checkpoint` (
  `PS_STEPID` int NOT NULL,
  `CP_CHECKPOINTID` int NOT NULL,
  `Note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PS_STEPID`,`CP_CHECKPOINTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_steps_division`
--

DROP TABLE IF EXISTS `project_steps_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_steps_division` (
  `PS_STEPID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `DI_DIVISIONID` int NOT NULL,
  `Note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PS_STEPID`,`CO_COMPANYID`,`DI_DIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_types`
--

DROP TABLE IF EXISTS `project_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_types` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ACRONYM` varchar(5) NOT NULL,
  `TYPE_NAME` varchar(256) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projecthistory_logtypes`
--

DROP TABLE IF EXISTS `projecthistory_logtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projecthistory_logtypes` (
  `PLT_LOGTYPEID` int NOT NULL,
  `PLT_NAMEFR` varchar(500) DEFAULT NULL,
  `PLT_NAMEEN` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`PLT_LOGTYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `PJ_PROJECTID` int NOT NULL AUTO_INCREMENT,
  `PJ_CODE` varchar(50) DEFAULT NULL,
  `PJ_TITLE` varchar(1000) DEFAULT NULL,
  `PJ_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `PJ_TYPEID` int NOT NULL,
  `PJ_ADDRESS` varchar(256) DEFAULT NULL,
  `PJ_POSTAL_CODE` varchar(50) DEFAULT NULL,
  `RE_REGIONID` int DEFAULT NULL,
  `CP_CHECKPOINTID` int DEFAULT NULL,
  `PJ_MANAGER_USERID` int NOT NULL,
  `PJ_ARCHITECTID` int NOT NULL,
  `PJ_START_DATE` datetime(6) DEFAULT NULL,
  `PJ_SUBMISSION_START_DATE` datetime NOT NULL,
  `PJ_SUBMISSION_END_DATE` datetime NOT NULL,
  `PJ_IS_OPEN` tinyint(1) NOT NULL DEFAULT '1',
  `PJ_IS_PUBLIC` tinyint(1) NOT NULL DEFAULT '1',
  `GC_IS_CHOSEN` tinyint(1) NOT NULL,
  `GC_IS_PUBLIC` tinyint(1) NOT NULL,
  `GC_GENERALCONTRACTORID` int NOT NULL,
  `PJ_DELETEROWDATE` datetime(6) DEFAULT NULL,
  `PG_GROUPID` int DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `PJ_OBJECTIVE` varchar(1000) DEFAULT NULL,
  `PJ_BUDGETNOTE` varchar(1000) DEFAULT NULL,
  `PJ_EXPECTEDRESULT` varchar(5000) DEFAULT NULL,
  `PJ_PERCENTAGE` int NOT NULL DEFAULT '0',
  `PJ_SCALERESULT` int DEFAULT NULL,
  `PJ_CREATEDATE` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `PJ_CREATEBY` varchar(255) NOT NULL,
  `PJ_LASTUPDATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PJ_PROJECTID`),
  KEY `FK_PROJECTS_REGIONS` (`RE_REGIONID`),
  KEY `FK_PROJECTS_CHECKPOINTS` (`CP_CHECKPOINTID`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectstep_maintasks`
--

DROP TABLE IF EXISTS `projectstep_maintasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectstep_maintasks` (
  `PMT_MAINTASKID` int NOT NULL,
  `PS_STEPID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PMT_DESCRIPTION` varchar(5000) NOT NULL,
  `PMT_INCHARGE_USERID` int NOT NULL,
  `PMT_DUEDATE` datetime(6) DEFAULT NULL,
  `PMT_COMPLETEDATE` datetime(6) DEFAULT NULL,
  `PMT_COMMENT` varchar(5000) DEFAULT NULL,
  `PMT_PERCENTAGE` int NOT NULL DEFAULT '0',
  `PMT_SCALERESULT` int DEFAULT NULL,
  `PMT_DELETEROWDATE` datetime(6) DEFAULT NULL,
  `PMT_DISPLAYORDER` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`PMT_MAINTASKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectstep_maintasks_files`
--

DROP TABLE IF EXISTS `projectstep_maintasks_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectstep_maintasks_files` (
  `FileGUID` varchar(64) NOT NULL,
  `PMT_MAINTASKID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`PMT_MAINTASKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectstep_subtasks`
--

DROP TABLE IF EXISTS `projectstep_subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectstep_subtasks` (
  `PST_SUBTASKID` int NOT NULL,
  `PMT_MAINTASKID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PST_DESCRIPTION` varchar(5000) NOT NULL,
  `PST_INCHARGE_USERID` int NOT NULL,
  `PST_DUEDATE` datetime(6) DEFAULT NULL,
  `PST_COMPLETEDATE` datetime(6) DEFAULT NULL,
  `PST_COMMENT` varchar(5000) DEFAULT NULL,
  `PST_SCALERESULT` int DEFAULT NULL,
  `PST_PERCENTAGE` int NOT NULL DEFAULT '0',
  `PST_DELETEROWDATE` datetime(6) DEFAULT NULL,
  `PST_DISPLAYORDER` int NOT NULL DEFAULT '0',
  `DI_DIVISIONID` int DEFAULT NULL,
  `DP_DEPARTMENTID` int DEFAULT NULL,
  PRIMARY KEY (`PST_SUBTASKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectstep_subtasks_files`
--

DROP TABLE IF EXISTS `projectstep_subtasks_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectstep_subtasks_files` (
  `FileGUID` varchar(64) NOT NULL,
  `PST_SUBTASKID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`PST_SUBTASKID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectstepmaintasks_comments`
--

DROP TABLE IF EXISTS `projectstepmaintasks_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectstepmaintasks_comments` (
  `PMC_COMMENTID` int NOT NULL,
  `PMT_MAINTASKID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PMC_COMMENT` varchar(5000) DEFAULT NULL,
  `PMC_DATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`PMC_COMMENTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `RE_REGIONID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `RE_CODE` varchar(5) NOT NULL,
  `RE_NAMEFR` varchar(50) NOT NULL,
  `RE_NAMEEN` varchar(50) NOT NULL,
  `RE_STATUS` smallint NOT NULL,
  PRIMARY KEY (`RE_REGIONID`),
  KEY `FK_REGIONS_COMPANIES` (`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RO_ROLEID` int NOT NULL AUTO_INCREMENT,
  `RO_CODE` varchar(20) NOT NULL,
  `RO_LEVEL` int NOT NULL,
  `RO_NAME` varchar(256) NOT NULL,
  PRIMARY KEY (`RO_ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scales`
--

DROP TABLE IF EXISTS `scales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scales` (
  `SC_SCALEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `SC_VALUE` int NOT NULL,
  `SC_NAMEEN` varchar(201) NOT NULL,
  `SC_NAMEFR` varchar(201) NOT NULL,
  `SC_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SC_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  `SC_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `SC_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `SC_SCALETYPEID` int NOT NULL DEFAULT '1',
  `SC_DISPLAYORDER` smallint DEFAULT NULL,
  `SC_ABBREVIATIONEN` varchar(200) DEFAULT NULL,
  `SC_ABBREVIATIONFR` varchar(200) DEFAULT NULL,
  `SC_HEXCOLOR` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`SC_SCALEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scales_expectedglbperf`
--

DROP TABLE IF EXISTS `scales_expectedglbperf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scales_expectedglbperf` (
  `SC_SCALEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `SC_VALUE` int NOT NULL,
  `SC_NAMEEN` varchar(201) NOT NULL,
  `SC_NAMEFR` varchar(201) NOT NULL,
  `SC_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SC_STATUS` tinyint unsigned NOT NULL DEFAULT '1',
  `SC_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `SC_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `SC_SCALETYPEID` int NOT NULL DEFAULT '1',
  `SC_OTHERNAME` varchar(200) DEFAULT NULL,
  `SC_OTHERDESC` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scales_types`
--

DROP TABLE IF EXISTS `scales_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scales_types` (
  `ST_SCALETYPEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `ST_NAMEFR` varchar(100) NOT NULL,
  `ST_NAMEEN` varchar(100) NOT NULL,
  `ST_DESCRIPTIONFR` varchar(2048) DEFAULT NULL,
  `ST_DESCRIPTIONEN` varchar(2048) DEFAULT NULL,
  `ST_STATUS` int DEFAULT '1',
  PRIMARY KEY (`ST_SCALETYPEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sent_emails`
--

DROP TABLE IF EXISTS `sent_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sent_emails` (
  `SE_SENTEMAILID` int NOT NULL,
  `SE_DESTINATOR` varchar(100) DEFAULT NULL,
  `SE_SUBJECT` varchar(500) DEFAULT NULL,
  `SE_BODY` longtext,
  `SE_DATE` datetime(6) DEFAULT NULL,
  `SE_SENTCORRECTLY` tinyint(1) DEFAULT NULL,
  `SE_LOGGEDIN_USERID` int DEFAULT NULL,
  `SE_SENDER` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SE_SENTEMAILID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `username` varchar(256) NOT NULL,
  `token` varchar(500) NOT NULL,
  PRIMARY KEY (`username`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_sections`
--

DROP TABLE IF EXISTS `site_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_sections` (
  `SS_SECTIONCODE` varchar(50) NOT NULL,
  `SS_NAMEFR` varchar(100) DEFAULT NULL,
  `SS_NAMEEN` varchar(100) DEFAULT NULL,
  `SS_DESCRIPTIONFR` varchar(1000) DEFAULT NULL,
  `SS_DESCRIPTIONEN` varchar(1000) DEFAULT NULL,
  `SS_COLOR` varchar(50) DEFAULT NULL,
  `SS_CSSCLASS` varchar(50) DEFAULT NULL,
  `SSG_GROUPCODE` varchar(50) DEFAULT NULL,
  `SS_PATH` varchar(500) DEFAULT NULL,
  `SS_IMAGE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SS_SECTIONCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitesection_groups`
--

DROP TABLE IF EXISTS `sitesection_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitesection_groups` (
  `SSG_GROUPCODE` varchar(50) NOT NULL,
  `SSG_NAMEFR` varchar(100) DEFAULT NULL,
  `SSG_NAMEEN` varchar(100) DEFAULT NULL,
  `SSG_DESCRIPTIONFR` varchar(100) DEFAULT NULL,
  `SSG_DESCRIPTIONEN` varchar(100) DEFAULT NULL,
  `SSG_ORDER` int DEFAULT '1',
  `SSG_COLOR` varchar(50) DEFAULT NULL,
  `SSG_CSSCLASS` varchar(50) DEFAULT NULL,
  `SSS_SCOPECODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SSG_GROUPCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitesectiongroup_scopes`
--

DROP TABLE IF EXISTS `sitesectiongroup_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitesectiongroup_scopes` (
  `SSS_SCOPECODE` varchar(50) NOT NULL,
  `SSS_NAMEFR` varchar(100) DEFAULT NULL,
  `SSS_NAMEEN` varchar(100) DEFAULT NULL,
  `SSS_DESCRIPTIONFR` varchar(100) DEFAULT NULL,
  `SSS_DESCRIPTIONEN` varchar(100) DEFAULT NULL,
  `SSS_BASEPATH` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SSS_SCOPECODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storedfiles`
--

DROP TABLE IF EXISTS `storedfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storedfiles` (
  `GUID` varchar(64) NOT NULL,
  `UploadDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(200) NOT NULL,
  `Size` int DEFAULT NULL,
  `Type` int NOT NULL,
  `Link` varchar(256) NOT NULL,
  `Blob` longblob,
  `DeletionDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storedpictures`
--

DROP TABLE IF EXISTS `storedpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storedpictures` (
  `GUID` varchar(64) NOT NULL,
  `UploadDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Name` varchar(200) NOT NULL,
  `Size` int NOT NULL DEFAULT '0',
  `Blob` longblob,
  `DeletionDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`GUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `study_areas`
--

DROP TABLE IF EXISTS `study_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_areas` (
  `SA_AREAID` int NOT NULL,
  `SA_NAMEFR` varchar(500) DEFAULT NULL,
  `SA_NAMEEN` varchar(500) DEFAULT NULL,
  `SA_DESCRIPTIONFR` varchar(5000) DEFAULT NULL,
  `SA_DESCRIPTIONEN` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`SA_AREAID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcontractor_submissions`
--

DROP TABLE IF EXISTS `subcontractor_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcontractor_submissions` (
  `PROJECTID` int NOT NULL,
  `GENERALCONTRACTORID` int NOT NULL,
  `SUBCONTRACTORID` int NOT NULL,
  `TOTAL_AMOUNT` float NOT NULL,
  `IS_CHOSEN` tinyint(1) NOT NULL,
  `COMMENT` text NOT NULL,
  PRIMARY KEY (`PROJECTID`,`GENERALCONTRACTORID`,`SUBCONTRACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcontractor_submissions_details`
--

DROP TABLE IF EXISTS `subcontractor_submissions_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcontractor_submissions_details` (
  `PROJECTID` int NOT NULL,
  `GENERALCONTRACTORID` int NOT NULL,
  `SUBDIVISIONID` int NOT NULL,
  `SUBCONTRACTORID` int NOT NULL,
  `AMOUNT` float NOT NULL,
  PRIMARY KEY (`PROJECTID`,`GENERALCONTRACTORID`,`SUBDIVISIONID`,`SUBCONTRACTORID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subdivisions`
--

DROP TABLE IF EXISTS `subdivisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subdivisions` (
  `SUBDIVISIONID` int NOT NULL,
  `CODE` varchar(50) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PARENTCODE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SUBDIVISIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECTID` int NOT NULL,
  `SUBCONTRACTORID` int NOT NULL,
  `SUBDIVISIONID` int NOT NULL,
  `SUPPLIERID` int NOT NULL,
  `AMOUNT` float NOT NULL,
  PRIMARY KEY (`ID`,`PROJECTID`,`SUBCONTRACTORID`,`SUBDIVISIONID`,`SUPPLIERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_submissions`
--

DROP TABLE IF EXISTS `supplier_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_submissions` (
  `PROJECTID` int NOT NULL,
  `SUBCONTRACTORID` int NOT NULL,
  `SUPPLIERID` int NOT NULL,
  `TOTAL_AMOUNT` float NOT NULL,
  `COMMENT` text NOT NULL,
  PRIMARY KEY (`PROJECTID`,`SUBCONTRACTORID`,`SUPPLIERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supplier_submissions_details`
--

DROP TABLE IF EXISTS `supplier_submissions_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_submissions_details` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROJECTID` int NOT NULL,
  `SUBCONTRACTORID` int NOT NULL,
  `SUBDIVISIONID` int NOT NULL,
  `SUPPLIERID` int NOT NULL,
  `AMOUNT` float NOT NULL,
  PRIMARY KEY (`ID`,`PROJECTID`,`SUBCONTRACTORID`,`SUBDIVISIONID`,`SUPPLIERID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_languages`
--

DROP TABLE IF EXISTS `system_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_languages` (
  `SL_TWOLETTER_ISO` varchar(2) NOT NULL,
  `SL_NATIVENAME` varchar(50) DEFAULT NULL,
  `SL_NAMEFR` varchar(50) DEFAULT NULL,
  `SL_NAMEEN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SL_TWOLETTER_ISO`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_logs`
--

DROP TABLE IF EXISTS `system_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_logs` (
  `SL_LOGID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UR_USERID` int DEFAULT NULL,
  `SL_TIMESTAMP` datetime(6) DEFAULT NULL,
  `SL_TYPEID` int DEFAULT NULL,
  `SL_DESCRIPTION` varchar(2048) DEFAULT NULL,
  `SL_IPADDRESS` varchar(16) DEFAULT NULL,
  `SL_CONCERNED_EVALUATIONID` int DEFAULT NULL,
  `SL_CONCERNED_USERID` int DEFAULT NULL,
  PRIMARY KEY (`SL_LOGID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_logs_types`
--

DROP TABLE IF EXISTS `system_logs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_logs_types` (
  `SLT_TYPEID` int NOT NULL,
  `SLT_NAMEFR` varchar(200) DEFAULT NULL,
  `SLT_NAMEEN` varchar(200) DEFAULT NULL,
  `CO_COMPANYID` int DEFAULT NULL,
  `SLT_CODE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`SLT_TYPEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_answerconfidence_options`
--

DROP TABLE IF EXISTS `threesixty_answerconfidence_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_answerconfidence_options` (
  `TAO_OPTIONID` int NOT NULL,
  `TAO_NAMEFR` varchar(500) DEFAULT NULL,
  `TAO_NAMEEN` varchar(500) DEFAULT NULL,
  `TAO_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`TAO_OPTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_assessments`
--

DROP TABLE IF EXISTS `threesixty_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_assessments` (
  `AS_ASSESSMENTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `PF_PROFILEID` int NOT NULL,
  `UR_SUPERIORID` int DEFAULT NULL,
  `UR_CREATORID` int DEFAULT NULL,
  `AS_CREATEDATE` datetime(6) DEFAULT NULL,
  `AS_STARTDATE` datetime(6) DEFAULT NULL,
  `AS_ENDDATE` datetime(6) DEFAULT NULL,
  `AS_STATUS` char(1) DEFAULT '1',
  `AS_LASTUPDATE` datetime(6) DEFAULT NULL,
  `RP_REPORTID` int DEFAULT NULL,
  `EC_CYCLEID` int DEFAULT NULL,
  `AS_GUIID` varchar(64) NOT NULL,
  `AS_ISAUTOCOMPLETE` tinyint(1) DEFAULT NULL,
  `TRANSFERTKEY` varchar(64) DEFAULT NULL,
  `TCT_TEMPLATEID` int DEFAULT NULL,
  `AS_SELFLAUNCHEMAILSENT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AS_ASSESSMENTID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_assessments_assessors`
--

DROP TABLE IF EXISTS `threesixty_assessments_assessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_assessments_assessors` (
  `AS_ASSESSMENTID` int NOT NULL,
  `UR_ASSESSORID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `AA_WEIGHT` int NOT NULL,
  `TAT_TYPEID` int DEFAULT NULL,
  `AA_ISCOMPLETE` tinyint(1) DEFAULT '0',
  `TAO_ANSWERCONFIDENCEOPTIONID` int DEFAULT NULL,
  `TKO_KNOWINGOPTIONID` int DEFAULT NULL,
  `CP_SPECIFYBESTCOMPETENCYID` int DEFAULT NULL,
  `CP_SPECIFYLACKINGCOMPETENCYID` int DEFAULT NULL,
  `AA_LAUNCHEMAILSENT` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`AS_ASSESSMENTID`,`UR_ASSESSORID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_assessments_files`
--

DROP TABLE IF EXISTS `threesixty_assessments_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_assessments_files` (
  `FileGUID` varchar(64) NOT NULL,
  `AS_ASSESSMENTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`AS_ASSESSMENTID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_assessments_filtered_comments`
--

DROP TABLE IF EXISTS `threesixty_assessments_filtered_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_assessments_filtered_comments` (
  `AS_ASSESSMENTID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `UR_ADMINUSERID` int DEFAULT NULL,
  `TAC_FILTEREDCOMMENTS` varchar(8000) DEFAULT NULL,
  `TAC_ISFILTERED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AS_ASSESSMENTID`,`CO_COMPANYID`,`CP_COMPETENCYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_assessortypes`
--

DROP TABLE IF EXISTS `threesixty_assessortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_assessortypes` (
  `TAT_TYPEID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `TAT_DESCRIPTIONFR` varchar(500) DEFAULT NULL,
  `TAT_DESCRIPTIONEN` varchar(500) DEFAULT NULL,
  `TAT_NAMEFR` varchar(100) DEFAULT NULL,
  `TAT_NAME_EN` varchar(100) DEFAULT NULL,
  `TAT_STATUS` char(1) DEFAULT '1',
  PRIMARY KEY (`TAT_TYPEID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_knowing_options`
--

DROP TABLE IF EXISTS `threesixty_knowing_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_knowing_options` (
  `TKO_OPTIONID` int NOT NULL,
  `TKO_NAMEFR` varchar(500) DEFAULT NULL,
  `TKO_NAMEEN` varchar(500) DEFAULT NULL,
  `TKO_ORDER` int DEFAULT NULL,
  PRIMARY KEY (`TKO_OPTIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_results`
--

DROP TABLE IF EXISTS `threesixty_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_results` (
  `AS_ASSESSMENTID` int NOT NULL,
  `UR_ASSESSORID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `PF_PROFILEID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `BE_BEHAVIORID` int NOT NULL,
  `RE_ASSESSMENTDATE` datetime(6) DEFAULT NULL,
  `RE_VALUE` int DEFAULT NULL,
  `SC_SCALEID` int DEFAULT NULL,
  PRIMARY KEY (`AS_ASSESSMENTID`,`UR_ASSESSORID`,`CO_COMPANYID`,`PF_PROFILEID`,`CP_COMPETENCYID`,`BE_BEHAVIORID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_results_comments`
--

DROP TABLE IF EXISTS `threesixty_results_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_results_comments` (
  `AS_ASSESSMENTID` int NOT NULL,
  `UR_ASSESSORID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `RE_COMMENT` varchar(5000) NOT NULL,
  `RE_ASSESSMENTDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`AS_ASSESSMENTID`,`UR_ASSESSORID`,`CO_COMPANYID`,`CP_COMPETENCYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threesixty_users_assessors`
--

DROP TABLE IF EXISTS `threesixty_users_assessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threesixty_users_assessors` (
  `UR_USERID` int NOT NULL,
  `UR_ASSESSORID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UA_SUPERIOR` int NOT NULL DEFAULT '0',
  `TAT_TYPEID` int DEFAULT NULL,
  PRIMARY KEY (`UR_USERID`,`UR_ASSESSORID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UR_USERID` int NOT NULL AUTO_INCREMENT,
  `CO_COMPANYID` int NOT NULL,
  `UR_EMAIL` varchar(255) NOT NULL,
  `UR_LASTNAME` varchar(50) DEFAULT NULL,
  `UR_FIRSTNAME` varchar(50) DEFAULT NULL,
  `UR_LASTLOGIN` datetime(6) DEFAULT NULL,
  `UR_LANGUAGE` char(2) NOT NULL DEFAULT 'FR',
  `UR_ADDRESS` varchar(150) DEFAULT NULL,
  `UR_PHONE` char(20) DEFAULT NULL,
  `UR_OFFICE_PHONE` char(20) DEFAULT NULL,
  `UR_EMPLOYEEID` varchar(12) DEFAULT NULL,
  `UR_HIRINGDATE` datetime(6) DEFAULT NULL,
  `UR_OFFICEID` varchar(12) DEFAULT NULL,
  `UR_CREATEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UR_SUPERIORID` int DEFAULT NULL,
  `UR_STATUS` int NOT NULL DEFAULT '1',
  `UR_LASTUPDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `JP_JOBPOSITIONID` int DEFAULT NULL,
  `DP_DEPARTMENTID` int DEFAULT NULL,
  `TRANSFERTKEY` varchar(64) DEFAULT NULL,
  `CHANGEPASSWORDKEY` varchar(64) DEFAULT NULL,
  `UR_PASSWORD` varchar(255) NOT NULL DEFAULT '$2y$10$MNmYA5A.EbNQ/pERSe1dUuMZq8gsFCS1PXGj7vi0ZQi/8QZUxEPXq',
  `ET_EMPLOYEETYPEID` int DEFAULT NULL,
  `DO_DISPONIBILITYOPTIONID` int DEFAULT NULL,
  `UR_MYROLE` varchar(500) DEFAULT NULL,
  `UR_MYSLOGAN` varchar(500) DEFAULT NULL,
  `UR_MYDESCRIBTIVEWORD` varchar(500) DEFAULT NULL,
  `PM_CURRENTMOODID` int DEFAULT NULL,
  `UR_ALLOWEMAILNOTIFICATIONS` tinyint(1) NOT NULL DEFAULT '1',
  `UR_ALLOWSMSNOTIFICATIONS` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`UR_EMAIL`),
  UNIQUE KEY `UR_EMAIL` (`UR_EMAIL`)
) ENGINE=MyISAM AUTO_INCREMENT=759 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_avatar_croppedpictures`
--

DROP TABLE IF EXISTS `users_avatar_croppedpictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_avatar_croppedpictures` (
  `FileGUID` varchar(64) NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`UR_USERID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_avatar_pictures`
--

DROP TABLE IF EXISTS `users_avatar_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_avatar_pictures` (
  `FileGUID` varchar(64) NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`UR_USERID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_careerplan`
--

DROP TABLE IF EXISTS `users_careerplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_careerplan` (
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `JP_JOBPOSITIONID` int NOT NULL,
  `UCP_DETAILS` varchar(8000) DEFAULT NULL,
  `UCP_DATEADDED` datetime(6) DEFAULT NULL,
  `UCP_PRIORITY` int DEFAULT '1',
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`JP_JOBPOSITIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_communicationpreferences`
--

DROP TABLE IF EXISTS `users_communicationpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communicationpreferences` (
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CP_PREFERENCEID` int NOT NULL,
  `UCP_LASTUPDATE` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`CP_PREFERENCEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_cv_competencies`
--

DROP TABLE IF EXISTS `users_cv_competencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cv_competencies` (
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  `UCC_DETAILS` int DEFAULT NULL,
  `SC_SCALEID` int DEFAULT NULL,
  `UCC_ADDEDDATE` datetime(6) DEFAULT NULL,
  `UCC_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`CP_COMPETENCYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_cv_experiences`
--

DROP TABLE IF EXISTS `users_cv_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cv_experiences` (
  `UCE_EXPERIENCEID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `NAICS_CODE` varchar(6) DEFAULT NULL,
  `UCE_DETAILS` varchar(500) DEFAULT NULL,
  `UCE_NBYEARS` int DEFAULT NULL,
  `UCE_CREATIONDATE` datetime(6) DEFAULT NULL,
  `UCE_LASTUPDATE` datetime(6) DEFAULT NULL,
  `UCE_CLASSIFICATIONSPECIFY` varchar(500) DEFAULT NULL,
  `UCE_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`UCE_EXPERIENCEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_cv_files`
--

DROP TABLE IF EXISTS `users_cv_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cv_files` (
  `FileGUID` varchar(64) NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`UR_USERID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_cv_formations`
--

DROP TABLE IF EXISTS `users_cv_formations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cv_formations` (
  `UCF_FORMATIONID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `SA_AREAID` int DEFAULT NULL,
  `DT_DIPLOMATYPEID` int DEFAULT NULL,
  `UCF_DETAILS` varchar(500) DEFAULT NULL,
  `UCF_YEAR` int DEFAULT NULL,
  `UCF_CREATIONDATE` datetime(6) DEFAULT NULL,
  `UCF_LASTUPDATE` datetime(6) DEFAULT NULL,
  `UCF_STUDYAREASPECIFY` varchar(500) DEFAULT NULL,
  `UCF_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`UCF_FORMATIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_cv_passions`
--

DROP TABLE IF EXISTS `users_cv_passions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cv_passions` (
  `UCP_USERPASSIONID` int NOT NULL,
  `PA_PASSIONID` int DEFAULT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UCP_SPECIFY` varchar(500) DEFAULT NULL,
  `UCP_CREATIONDATE` datetime(6) DEFAULT NULL,
  `UCP_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`UCP_USERPASSIONID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_cv_values`
--

DROP TABLE IF EXISTS `users_cv_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_cv_values` (
  `UCV_USERVALUEID` int NOT NULL,
  `OV_VALUEID` int DEFAULT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UCV_ADDEDDATE` datetime(6) NOT NULL,
  `UCV_SPECIFY` varchar(500) DEFAULT NULL,
  `UCV_DISPLAYORDER` int DEFAULT NULL,
  PRIMARY KEY (`UCV_USERVALUEID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_forgotpassword_logs`
--

DROP TABLE IF EXISTS `users_forgotpassword_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_forgotpassword_logs` (
  `UFL_LOGID` int NOT NULL,
  `UFL_EMAIL` varchar(500) NOT NULL,
  `UFL_DATE` datetime(6) NOT NULL,
  `UFL_IPADDRESS` varchar(15) DEFAULT NULL,
  `UFL_BROWSERAGENT` varchar(500) DEFAULT NULL,
  `UFL_BROWSERVERSION` varchar(500) DEFAULT NULL,
  `UFL_SUCCESS` tinyint(1) DEFAULT '0',
  `UFL_DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`UFL_LOGID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_logs`
--

DROP TABLE IF EXISTS `users_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_logs` (
  `UL_LOGID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UR_USERID` int NOT NULL,
  `UL_DATE` datetime(6) NOT NULL,
  `UL_IPADDRESS` varchar(15) DEFAULT NULL,
  `UL_SESSIONID` varchar(500) DEFAULT NULL,
  `UL_BROWSERAGENT` varchar(500) DEFAULT 'n/a',
  `UL_BROWSERVERSION` varchar(500) DEFAULT 'n/a',
  `UL_NOTE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`UL_LOGID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_masteredcompetencies`
--

DROP TABLE IF EXISTS `users_masteredcompetencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_masteredcompetencies` (
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `CP_COMPETENCYID` int NOT NULL,
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`CP_COMPETENCYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_mywinechart_pictures`
--

DROP TABLE IF EXISTS `users_mywinechart_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_mywinechart_pictures` (
  `FileGUID` varchar(64) NOT NULL,
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  PRIMARY KEY (`FileGUID`,`UR_USERID`,`CO_COMPANYID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_preferences`
--

DROP TABLE IF EXISTS `users_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_preferences` (
  `UR_USERID` int NOT NULL,
  `CO_COMPANYID` int NOT NULL,
  `UP_PREFERENCECODE` varchar(100) NOT NULL,
  `UP_STRINGVALUE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`UR_USERID`,`CO_COMPANYID`,`UP_PREFERENCECODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 17:51:47
