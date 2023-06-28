-- MariaDB dump 10.19  Distrib 10.5.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: chadd_test
-- ------------------------------------------------------
-- Server version	10.5.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `A`
--

DROP TABLE IF EXISTS `A`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `A` (
  `AID` int(11) NOT NULL AUTO_INCREMENT,
  `CID` int(11) NOT NULL,
  PRIMARY KEY (`AID`),
  KEY `A_CID_FK` (`CID`),
  CONSTRAINT `A_CID_FK` FOREIGN KEY (`CID`) REFERENCES `C` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `A`
--

LOCK TABLES `A` WRITE;
/*!40000 ALTER TABLE `A` DISABLE KEYS */;
/*!40000 ALTER TABLE `A` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Raghu','Ramakrishnan');
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `B`
--

DROP TABLE IF EXISTS `B`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `B` (
  `BID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `B`
--

LOCK TABLES `B` WRITE;
/*!40000 ALTER TABLE `B` DISABLE KEYS */;
/*!40000 ALTER TABLE `B` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` char(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `Books` VALUES (1,'Database Management Systems');
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C`
--

DROP TABLE IF EXISTS `C`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C`
--

LOCK TABLES `C` WRITE;
/*!40000 ALTER TABLE `C` DISABLE KEYS */;
/*!40000 ALTER TABLE `C` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MaxSize` int(11) DEFAULT 24,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,'CS150 Intro to Computer Science',24),(2,'CS250 Intro to Computer Science II',24),(3,'CS300 Datastructures',15),(4,'CS445 Databases',5),(5,'CS493 Software Engineering',3);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CurrentlyEnrolled`
--

DROP TABLE IF EXISTS `CurrentlyEnrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CurrentlyEnrolled` (
  `CourseID` int(11) NOT NULL,
  `StudentID` int(11) NOT NULL,
  `Grade` float DEFAULT 100,
  PRIMARY KEY (`CourseID`,`StudentID`),
  KEY `CurrentlyEnrolled_StudentID_IDX` (`StudentID`),
  CONSTRAINT `CurrentlyEnrolled_CourseID_FK` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`) ON DELETE CASCADE,
  CONSTRAINT `CurrentlyEnrolled_StudentID_FK` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CurrentlyEnrolled`
--

LOCK TABLES `CurrentlyEnrolled` WRITE;
/*!40000 ALTER TABLE `CurrentlyEnrolled` DISABLE KEYS */;
INSERT INTO `CurrentlyEnrolled` VALUES (1,6,100),(1,7,100),(1,8,88),(2,5,100),(3,9,100),(3,11,78),(4,11,78),(4,12,99),(4,13,100),(4,14,32),(4,15,85),(5,11,78),(5,12,98),(5,13,100);
/*!40000 ALTER TABLE `CurrentlyEnrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CurrentlyTeaching`
--

DROP TABLE IF EXISTS `CurrentlyTeaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CurrentlyTeaching` (
  `CourseID` int(11) NOT NULL,
  `ProfID` int(11) NOT NULL,
  `Section` int(11) NOT NULL,
  PRIMARY KEY (`CourseID`,`ProfID`),
  UNIQUE KEY `CurrentlyTeaching_CourseIDSection_U` (`CourseID`,`Section`),
  KEY `CurrentlyTeaching_ProfID_IDX` (`ProfID`),
  CONSTRAINT `CurrentlyTeaching_CourseID_FK` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`) ON DELETE CASCADE,
  CONSTRAINT `CurrentlyTeaching_ProfID_FK` FOREIGN KEY (`ProfID`) REFERENCES `Professors` (`ProfID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CurrentlyTeaching`
--

LOCK TABLES `CurrentlyTeaching` WRITE;
/*!40000 ALTER TABLE `CurrentlyTeaching` DISABLE KEYS */;
INSERT INTO `CurrentlyTeaching` VALUES (1,3,1),(1,2,2),(2,1,1),(3,1,2),(5,2,1);
/*!40000 ALTER TABLE `CurrentlyTeaching` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `D`
--

DROP TABLE IF EXISTS `D`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `D` (
  `DID` int(11) NOT NULL AUTO_INCREMENT,
  `AID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  PRIMARY KEY (`DID`),
  UNIQUE KEY `D_CID_U` (`CID`),
  KEY `D_AID_BID_FK` (`AID`,`BID`),
  CONSTRAINT `D_AID_BID_FK` FOREIGN KEY (`AID`, `BID`) REFERENCES `R1` (`AID`, `BID`),
  CONSTRAINT `D_CID_FK` FOREIGN KEY (`CID`) REFERENCES `C` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `D`
--

LOCK TABLES `D` WRITE;
/*!40000 ALTER TABLE `D` DISABLE KEYS */;
/*!40000 ALTER TABLE `D` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobStatus`
--

DROP TABLE IF EXISTS `JobStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobStatus` (
  `StatusID` int(11) NOT NULL AUTO_INCREMENT,
  `JobName` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `PayBonus` int(11) NOT NULL DEFAULT 0,
  `Tenure` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobStatus`
--

LOCK TABLES `JobStatus` WRITE;
/*!40000 ALTER TABLE `JobStatus` DISABLE KEYS */;
INSERT INTO `JobStatus` VALUES (1,'Professor',10000,1),(2,'Associate',1000,1),(3,'Assistant',0,0);
/*!40000 ALTER TABLE `JobStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OneRow`
--

DROP TABLE IF EXISTS `OneRow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OneRow` (
  `OneRowID` int(11) NOT NULL AUTO_INCREMENT,
  `OneRowName` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OneRowID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OneRow`
--

LOCK TABLES `OneRow` WRITE;
/*!40000 ALTER TABLE `OneRow` DISABLE KEYS */;
INSERT INTO `OneRow` VALUES (1,'Databases');
/*!40000 ALTER TABLE `OneRow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `LName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Login` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `People_Login_U` (`Login`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
INSERT INTO `People` VALUES (1,'Chadd','Williams','chadd'),(2,'Doug','Ryan','ryand'),(3,'Shereen','Khoja','shereen'),(4,'Chris','Lane','lanec'),(5,'Bart','Simpson','bart'),(6,'Maggie','Simpson','maggie'),(7,'Lisa','Simpson','lisa'),(8,'Homer','Simpson','homer'),(9,'Marge','Simpson','marge'),(10,'Grandpa','Simpson','onion'),(11,'Krusty','Clown','krusty'),(12,'Comic','BookGuy','jeff'),(13,'Disco','Stu','leisure'),(14,'Nick','Riviera','everybody'),(15,'Otto','Mann','fing');
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prof_Ex`
--

DROP TABLE IF EXISTS `Prof_Ex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prof_Ex` (
  `ProfID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `LName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `StatusID` int(11) NOT NULL,
  `StartDate` date DEFAULT NULL,
  PRIMARY KEY (`ProfID`),
  KEY `Prof_EX_StartDate_IDX` (`StartDate`),
  KEY `Prof_Ex_StatusID_FK` (`StatusID`),
  CONSTRAINT `Prof_Ex_StatusID_FK` FOREIGN KEY (`StatusID`) REFERENCES `JobStatus` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prof_Ex`
--

LOCK TABLES `Prof_Ex` WRITE;
/*!40000 ALTER TABLE `Prof_Ex` DISABLE KEYS */;
INSERT INTO `Prof_Ex` VALUES (1,'D','R',3,'1990-08-01'),(2,'S','K',3,'2002-08-01'),(3,'C','W',2,'2006-08-01'),(4,'C','L',2,'1999-08-01');
/*!40000 ALTER TABLE `Prof_Ex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professors`
--

DROP TABLE IF EXISTS `Professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professors` (
  `ProfID` int(11) NOT NULL,
  `Rank` enum('Assistant','Associate','Full','Emeritus') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ProfID`),
  CONSTRAINT `Professors_ProfID_FK` FOREIGN KEY (`ProfID`) REFERENCES `People` (`PersonID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professors`
--

LOCK TABLES `Professors` WRITE;
/*!40000 ALTER TABLE `Professors` DISABLE KEYS */;
INSERT INTO `Professors` VALUES (1,'Associate'),(2,'Full'),(3,'Associate'),(4,'Associate');
/*!40000 ALTER TABLE `Professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `R1`
--

DROP TABLE IF EXISTS `R1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `R1` (
  `AID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  PRIMARY KEY (`AID`,`BID`),
  KEY `R1_BID_FK` (`BID`),
  CONSTRAINT `R1_AID_FK` FOREIGN KEY (`AID`) REFERENCES `A` (`AID`),
  CONSTRAINT `R1_BID_FK` FOREIGN KEY (`BID`) REFERENCES `B` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `R1`
--

LOCK TABLES `R1` WRITE;
/*!40000 ALTER TABLE `R1` DISABLE KEYS */;
/*!40000 ALTER TABLE `R1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `StudentID` int(11) NOT NULL,
  `GPA` float DEFAULT 0,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `Students_StudentID_FK` FOREIGN KEY (`StudentID`) REFERENCES `People` (`PersonID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (5,0.1),(6,0),(7,4),(8,1),(9,2.9),(10,3.89),(11,1.2),(12,3.99),(13,1.973),(14,1.823),(15,0.42);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wrote`
--

DROP TABLE IF EXISTS `Wrote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wrote` (
  `BookID` int(11) NOT NULL,
  `AuthorID` int(11) NOT NULL,
  PRIMARY KEY (`BookID`,`AuthorID`),
  KEY `Wrote_AuthorID_FK` (`AuthorID`),
  CONSTRAINT `Wrote_AuthorID_FK` FOREIGN KEY (`AuthorID`) REFERENCES `Authors` (`AuthorID`) ON DELETE CASCADE,
  CONSTRAINT `Wrote_BookID_FK` FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wrote`
--

LOCK TABLES `Wrote` WRITE;
/*!40000 ALTER TABLE `Wrote` DISABLE KEYS */;
INSERT INTO `Wrote` VALUES (1,1);
/*!40000 ALTER TABLE `Wrote` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`chadd`@`%`*/ /*!50003 Trigger BoldLine BEFORE DELETE ON  Wrote
For each row
Begin
  	declare homeRowCount INTEGER;
	declare rowCount INTEGER;

	SELECT COUNT(*) FROM Books WHERE
		BookID=OLD.BookID into homeRowCount;

	SELECT Count(*) from Wrote Where 		
		Wrote.BookID=OLD.BookID into rowCount;
		
	If homeRowCount > 0 and rowCount = 1 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Bold Line';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `PicID` int(11) NOT NULL AUTO_INCREMENT,
  `image` mediumblob NOT NULL,
  `type` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`PicID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0F\0\0\0mÍU\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0¬IDATxÚì]ÏoãÖµæ˜²Ë#¶œÊˆ\0Ï›IhÈ,\Z€F^ßKû\rµÊêÐ\0Ý=@ú$tÕE\"ÐeÀÚuõZé¡AÝÔºÈªƒ0)¸éÀ„=Ï‚‹1Ç’Eˆ6euñeÎcH‘¢~y<ñýV2ÍûãÞûÝsÎýug4\Zq¯î0Âb```„ÅÀÀÀÀ‹#,FXŒ°a10000Âb``¸X¹É•k·ÛìÍn·kÆØçÓš¦iÛök$¬ã8†a8ŽýNô7‰›\\9Aâ¼fF6›\r>‡Žã‚Àó|Dg¶,K„^¯—N§Ç‘$IÅ©êVe`lYà#ˆJ¥|õE1H:¦i¦Óé‰Å%“Éí½%˜¦éº.„M$™LÆ×fR©¾{D»ºÎOÆðÝ\',Œ©TÊË>ý~}}Ýu]Çq¨OÚ¶í8ô|8\Z†‘J¥\\×& b¨l6ë5:Pb\"‘ðV%º®»¾¾ÎqÏóa€ÃáÐ—Ù«Ôív‰ÏóÞž†l\'\nK}Ï×	¡FTÕ×u\'Ž((‘Hxeç8.•Ju»]A$¢ŠÑó°<AH$øš^6$Åò<<½YA?©TŠÊ\',%‰ÙÆ†ÃaL.f`.a,X–åcŠÃÃÃ^¯2šHy©Tj¢¹äë]ô§mÛ(‚~oâèè¨ßïG×áùóç{{{¾‡NçÙ³g>f„óë8ÎóçÏ½‡Ã!ý˜ÁŽŽ|VüÜlÛö‰ijkYÖlÞ¢®ëNYQMÃ@nô#øõ#Š³mûèè©|	ÇBÅ81³°â:ƒ‚ x(Ïó©TJI’È	Âh/B•`öãåø^\'ýiYÖææ&uÓ41°;Ž³±±Áó<™-aà8îÁƒAjØØØðymŽãð<\'dŽu:l6@EüQVÐ|p]6ˆ(ŠÏž=óþ·ßïûì¾°^í{‚\n@3¢(Â†EåmÛŽS1Q{½G06MÓEUE±Ýnonn¢\r8ŽcYÞ÷y¾±íáÃ‡T«‰Õ€‘Èú?#¬å\"¾\rŽxG0¬Ç²ð¶{êÞÙl¶Óé€†&AÆº\'ÄMÞÌ]×…¹Áó<²ufÈ7ß)1Ý—òQRœpÕÂ?Aü\\×ív»Ä xœ‚AkbŒÜ›g.f`„å±ù®®·›ÍoUYNËò}UÍ(Êäè•eé†Ùjuuýââ\"™Ln(JZ–7U•`ÃFQÛ¶‡ÃáD¶2[­ÎþþðÞ=Žã2Š\"HR2™ò:ž‡Cp\"Çq/þö·á_à$ˆaýßŸÿ<¼ÏÎÎ¾÷½ïá÷‹óóÔÏ~&Š\"lÉøÖ××;	î5j‚ÿ}åH¥R>\n•„Mêåî0‹Òû™&r–mÛ3ë–ábÁë°ôFãq¥ÒÕõñî€,¿[­Êù|Xò§šö¹¦9ãbé·Þú¿ü|á8ÎW_}•N§Ñ	1ƒžˆPÃ §2NGtÎžaüïÛo_žáÏvw7UÕ¶mË²àïôz=„ÃºÝîW_}•Édxž·,ÎcYÿ#Ë/^ ù¿ÿþ÷ÿZ(à7bUÊ·iºvçN´ÿÛuu†ÉdÒ+W˜°\\`–¬KË²À›^Îš8M†‚`Ú`ê\r¾›eY’$e2Ã0z½Þo¼âÚí6hÂ¶íL&F”\n>;D ß`®~¿ÿN×õ‡ò<UÀÁ;KhÛv§Ó‘$‰êŒlÃ¤3®=£€Ûka=Õ´Ç•\nýI¶†ÙjƒººÆeÇ}V*íÕjôç¦ªâ,µû¹\Z1ú—€``EµÑl6‹Ž=q Ýÿío‰­¼c>…9(˜%Š\"‚5®ëÞ¿Í}¯V#¶â8îÞ½{Ñ1¬˜Ïó›››(ËÛµÂ„\rº¨™L³„TÕo}øD\"zîÂúf2ï$·ÄÍÍMŸºÆÂ›Š>(CŽã¤Ói*B–e¯€T‡ °©Têþýûý~?¾YÊØêVl+ü~§\\~»X_¶6P•Þh|®iaæÕSM[	’ônµú¨Xô¹lNäÔÏØ©ô8±Œ®®£Ú‚$‹k—y³NÑs‹–f´Ñëb¾™Éd°Â`iN3¾\\a³ {Öùo/a9–õY©„ß?ÝÙñÑ\rœÁwÊåGÅ¢ÒP>×4tûvwƒ¡®8Á¯Ù@tó¨X|ªi×–ü›¨Ü+ÅÍ‰a]3XôêõÅbÖaíÕj°/ä|>ÈVÿßPBØŠ(9Ÿ_7Ñn6õFƒã¸w«ÕäôCîœÉ^\raýýeìéry6ìŽëþ¯•\nÌ·’]^r†W@XJey6ûˆ,¯^xH~áØ«ÕÌV‹ã¸«V¯?9Ã«!,Zo5sP†æ÷j5Êmj3ÍqâOÉ9–…ð“œÏÏPí9“300¼2ÂZˆC÷£—¾äŸr¹‚ßX65•}„j¿;«y5Or†Ù°€YBxFp	gÎär¹§ëXÙð¸Rù{­ö£r9~l+$c®¬¡µïV«3ÔyÎäd–ÒTÃ†¢d%Î*FX³°„ùfÊ~º³“–e¬tïêúg¥Òçš6mÅ„w-Âõ\'÷ùÑô[”eµ^¿ÎIR†Ûè.ï”Ëÿõä	hëw[[dÄE¸„1·{×\"ó-e˜ IºMUÝôì¯ìêúŸr¹‰’200ÂºAeù§;;?ßß÷ÒÖ¶·½»v|ÀÉ¢1ýÁW¾”ÒG£vw?ØÝýðÉ“Ÿïïƒ¶Ëj\nÎ4Á8FX7ˆ¶hî³R)Ìúày^’¤8§tß¥¾È—(Ë´¾{˜X»d`XaQ÷ë.zz2Ù2õì¬ž7y)ƒ7\"Æ‹a‰„E«–äËÐd\\»ÙŒ(bâ\"¬¾”f	g^‰ÆÀðÇÎÃÒf¡€.§ÖëË¨åãJ‹³pXÕØwp\rLÄ¾Ö‰Qùà+kÎäq@EÙe‘ã°€e\r4Ïµ<Ó ÎÖâÌ”ç‘200ÜFÂÂB,ƒÜ«Õ–±˜öÎ³˜>Ú•k7› ÜGÅ\"Jñ•5gò‰ )¶×‡a‰„…^Šó°pDŸ°Ð³VpÊ;˜qÎÅôÑ/€qÂbês&ŸZ·Á‹!‹YÖð¨X¤YùÇ•JXhœV]Že¥°Ì)Ã·¿»§¸˜­¸Ê«a`X.aq÷Ÿ;;tâÂ§ÛÛ{µ\Z­r0[­§šö‡ííˆÍ+•ßmm=Õ4\n„ÁÁ¤%£ßc§žjÚg¥nÂ“®®C9äx\nì,@†¥º„ ”vwÿ”ËÑNÀ0SÂ±¬`Ÿì´Z´©8,ó…ôd\\ |ún·K‡#Ô¶jìéÒ©€mÛoQœ×swÜ3ôºŸ¼lš&·Ð9ÇqlÛö\"çÊoû¹\rêÂ­Haw\Z-r¥{FQ¼[j|€³óóýý±¼#çócãS¸“bQlÅqÏóÉdò:¿¨÷þê0)6UÕ»DvZ†aÆ³gÏÃ^h<±¹[–gŸ@´Œt?sœs~†Ã!®ŒvÎîZ¬º2™ŒëºS\rÑeY–å{<›ÍÆÑüÅÅEðˆÐn·ã\\s=\'Û\Z†qxxxxxhF°&S©+Î§I§Ó7Q.ø^BòæÌV«ãÙI³¡(qbÉHEñ¬˜©¦êW®ëogÁS¸¹s±–ˆeY¸Ô/L9£«+é½÷þå½÷\\×uÇG.èNxH•ÄÈ3ûý¾W–àUƒñå¢+gng”ÍG³•÷Ž{zÞn·ÓétðFÕ D¸lûö­BPH\"‘ÀÃÔ…æËî\'ª7éÒm‰ñõ3­ºÆVÕ4MhÉ4M\\I1XâÂ:_³‡~è!Éîk9Ðž·Î .(âÀé8N¯×£‹&½žå°”›ŸIÂQ3Øh×p¾\nÙ^4•JEïÁÑlb³Þ(åSÚýáá¡(Š¸1”n–F¯F›&ãe}}=L±¦u¹ •ˆ†5ƒ°dÃNÔ	.¦\r&ŒãûX–…«ma¦Qû¶,+NÛ¶ÝívgPW»ÝçùÃÃÃ‰\'@·>Z’ºÆ÷”—=y¢uƒ;hÓé´eY¢(¢EÁ²Ã%»à\\aµ7º:N»Ýþáý}Ç!ï‡nõåànèjb/÷SËEñÙ³gÑ½záUây·½¢S»‡M„Ö,Š\"þDÏ…ðGXd*¹¨&pR@šË‹yážç aÑ˜V\npº,Ë\";Å¶m ñÕ²CwEñðð0ÂX8::\n^+½ìakDÜ¿‰¦ÍÀJ¥RÐ3µ\r8z¸Ê*%]…‘i|u}ã*mlÌÜ¤naÑï÷½ß;N/ÖÂŠO[ÁÞëuã½ƒN¯öD¦’+ïœVØ©O _2\0É ]Š¢H&R|uÙ¶í­ð·|ðê¢LCÈDZ÷õÀå©+š¾\'F»Ç6-D¦Æê!‘H`—[„â«k*Û9B3”Ãm\',ÄwH›½^/¢]ç(\n›Ë7ŒÃ6Aû€©¿¹¸q“VS	+Gqzc*•BÐÝÛŽAE–ÿ´êJ&“Á\nÇW— 4O3ZØl6ÛívÛí6ì¸iÕE$2ç\\ÇlssëëëaíÁ²,¼mÛÆ¸5¿ºâÇ°`îÑØé}ÿðð°×ë=zôˆÿÕ¯~uK¸ÉqÓ4ÏÏÏ{½Þååå`0H¥R+++ƒÁ Ûí^]]AYŽãÜ½{wQ…^^^ŽF£ÕÕÕèZ\rƒµµ5Û¶OOO///ïÞ½»¶¶vrrrqqáº®eYçççwïÞM&“¦iÂ999yã7VVVÐI®««+A¦’Ë²¬Ñh´±±óÔÖ±ôâÅ‹n·{~~Nµ\nÃùù9ôO­Š:;;C†åF¬¤\"Ó4ÏÎÎF£Q*•J&“\'\'\'ÃáðòòÒ4Íáp¸¶¶_]kkk¦ib>®ÓéŒF£ápm8€^MÓ\\YY‰ø¾¦iv»]o“ã8÷üü|0Äa:|ý ½ÿå—_~ÿûß.TdF¯×[]]][[»¸¸@Û°mûäädmm-‘H\\^^b6~ðƒx{Í`0«««‰DbZuœœÜ½{wâ\ZŽ•••¯¿þúüü|uuÕKXo¾ùæÚÚÚRf	_G.óÎ‰,q¦œÂ€PèÌ[ª\\óÀ¶mžçƒsµi\"\Zc\'³¦ÕöM[ôvIL³%Úê¡IÕ¥ªkÎªbF‘8FXKÇ\r_øÇÀÚÏkFXŒ°a1000ÂbXšÍfëåFEQÔë:îJÓ´ò¤3¼¦B­V+Þ¤3H±‹Õj­VSUUžãäµ©ÐjµšÍ&Çqù|þÚ\n}}±ÂT°lÈ²¬(J¥RQ%¢E¶ÛíoÆÀáñc÷èNDeÖK†î„œ^ßZÂ%¯w¦<)ßW]×E©Õj¥ÓA¦*ë‰\Z†¾èûŸÂÐh4J¥\Z†5ë.¹\\®yk..a„ŠEíƒ—eã¿wÜÖu]×uË²šÍ&Zª ø¶ƒ·	Ú¶½··Gÿ%èºNÉƒ#¶÷5ê­VËû>ò¤÷Ã*€‚òù¼¯,¼ïíÞA¹ÂVV˜\\º­×ëHâSå0±,ˆ€5GÞçA›.øeùØ<¦µZ­Z­ªªšÏç•—»h}š÷ª7XJñÉ¬\0Þ±,¹ù¤€\\×FÓŒ°â‚Á%zî8N·Ûõ>ÁŸÝn×{~½ƒaI÷p8¤çtd\nöš{“‡ÖJ¥R*•šÍæÖÖÖóçÏ“É$ZÚ%~ ôF£ññÇ\n…f³©i\ZÎW*•J¥R©Õjmoo×^°¥i\Z\noY—½V*jîš¦moo£­ã…`¨õ·Z-äìílHŽšŒ•+¢Ç†•5V®‰Èçó$c.—k4\ZÍfs{{0¬¬J¥¢iZ«ÕBI’°—XÓ´Z­I¶ÑhÐCË²r¹\\­VkµZµZ:|­V+\nÈ6Ú,UUµR©ø˜¢V«‘,…B:+‹hÈ;+€&Q©T¶¶¶J¥’¦i0À¡g r¸æÍÂè6áìììèèèøø¸ÓéƒÑhtzzz|||vvv|||zzJoœõû}zx||<\Zƒ’ŒF#×u‘íÑÑ²\ZFý~ÿèèIúý¾OÕÕjµX,â÷ûï¿ÿÇ?þñàà\0âM×uNOO;Î/ùË‡RÝþñ|òÉ\'Š¢àÏÓÓSI’NOOéR‰ÕjµZ­â·ªª»»»£ÑèÉ“\'²,ÕRX« ´ÞBñ§¢(ø—W.ïûað•µ»»”+,­W®ÝÝ]UU}/”Ëez!B®ÑhT¯×‘üøøXUU¯ºêõºïeµõÕðôôT–e<Üßß\'q\"¤$©X,R>;;;ù|Éé-k¬žÇV€‰H]ÞïõZàvYX¢(bmn&“ÁŽ\rÚ¹.Šb6›%ËKEì½ 98ÏjïylËÄ‘ž’$aQ;í’G¶c#PäÞ¹sï{ÿÛétîß¿/Iv«ýâ¿ í»<øúë¯ó//^•$IQØŠ¢àµ‰‡45›Íy\"èÞ²`à)1Oä¸Õjåš6]×5MƒÑý¦eYš¦\n2.Ç¹ºº\"ïLUU²ešÍf¥RÉårôDUUUUa³“K§P(är9ŸM:åryÆ)Þ\\­V#mŒ-+L‡c+@ËÛ6ŠÅ¢®ë[[[AC¹„7þãô^î\\fÎ6Nû¶¿Ì¿†rn^]]õ…¢fÈßšï¦îù+°Àl›Í&…º®çr9I’êõúDFÎårÇÁR£‡WWWÁ\nÀÕ…m¥xŽl«V«°b\n…øQ’$Y–w_\"Î,¼$I;;;DC’$åóy8†DXcË\nË-~$IÂk’$‘Íëæb}}=‘Hd=˜¸?XêI¾è\'T„/\nöÅ_üøÇ?n4\Zx\r£1F`ŠÑø¢?xÓjÞ OØø?‘)TU¥ÀÏ˜‡¡P+Ÿ\\qì2êÛº®ÃÃËDËÕjµŠÅ¢,Ëô¦ ‰D‚\"zÞl\Z÷EÁÐç‹Å\"LŽãEAÂ©d\'Â%õjš3¢¬±rMU2ŠËåò<3•×†[t¼nIèõzôíqDB‚ð¹—³LÓL&“½^Ž+Ã;¶mƒDàTÚ¶MÙÂ%4M³×ë%‰L&ó›ßüæÓO?ÅxžÏçƒÃþåååéé)åðë_ÿz{{û­·ÞúðÃ?úè£ápè8¶×Ã÷t]÷\'?ùI¹\\†)aYV½^GÚB¡ (Š·¡çóy_½ë*dYÞÙÙ)•JÈ¡\\.ãT«ÕíímY–‹Åb\rÕëuJ^­Vgó}e¡çåŠ˜eƒaR¯×QUUEAžù|ÞÛ±ƒríììÐ›^?K’¤B¡ ë:º1\\§\\.—Ëå°æÙêº^(àa¡æ¤™J¥‚1CQ”jø¼TYÞOV©T¼Ê+uCqªªâyü\n4\Z\r0#\nU–Þïœ`G¿1—Æî\\{XBðxì¥Nkúj…s$vØršÁÂõŸ÷îÝÃÄû.Œ°ÆÀ0Œ°Û¥®X» IR„etk‘`*``ðºó¯–eùœ>fa1000Âb````„ÅÀÀÀÀ‹#,†[‹\0*§Ž\0\0\0\0IEND®B`‚','mime/png'),(2,'‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0\0F\0\0\0mÍU\0\0\0	pHYs\0\0\0\0\0šœ\0\0\0gAMA\0\0±Ž|ûQ“\0\0\0 cHRM\0\0z%\0\0€ƒ\0\0ùÿ\0\0€é\0\0u0\0\0ê`\0\0:˜\0\0o’_ÅF\0\0¬IDATxÚì]ÏoãÖµæ˜²Ë#¶œÊˆ\0Ï›IhÈ,\Z€F^ßKû\rµÊêÐ\0Ý=@ú$tÕE\"ÐeÀÚuõZé¡AÝÔºÈªƒ0)¸éÀ„=Ï‚‹1Ç’Eˆ6euñeÎcH‘¢~y<ñýV2ÍûãÞûÝsÎýug4\Zq¯î0Âb```„ÅÀÀÀÀ‹#,FXŒ°a10000Âb``¸X¹É•k·ÛìÍn·kÆØçÓš¦iÛök$¬ã8†a8ŽýNô7‰›\\9Aâ¼fF6›\r>‡Žã‚Àó|Dg¶,K„^¯—N§Ç‘$IÅ©êVe`lYà#ˆJ¥|õE1H:¦i¦Óé‰Å%“Éí½%˜¦éº.„M$™LÆ×fR©¾{D»ºÎOÆðÝ\',Œ©TÊË>ý~}}Ýu]Çq¨OÚ¶í8ô|8\Z†‘J¥\\×& b¨l6ë5:Pb\"‘ðV%º®»¾¾ÎqÏóa€ÃáÐ—Ù«Ôív‰ÏóÞž†l\'\nK}Ï×	¡FTÕ×u\'Ž((‘Hxeç8.•Ju»]A$¢ŠÑó°<AH$øš^6$Åò<<½YA?©TŠÊ\',%‰ÙÆ†ÃaL.f`.a,X–åcŠÃÃÃ^¯2šHy©Tj¢¹äë]ô§mÛ(‚~oâèè¨ßïG×áùóç{{{¾‡NçÙ³g>f„óë8ÎóçÏ½‡Ã!ý˜ÁŽŽ|VüÜlÛö‰ijkYÖlÞ¢®ëNYQMÃ@nô#øõ#Š³mûèè©|	ÇBÅ81³°â:ƒ‚ x(Ïó©TJI’È	Âh/B•`öãåø^\'ýiYÖææ&uÓ41°;Ž³±±Áó<™-aà8îÁƒAjØØØðymŽãð<\'dŽu:l6@EüQVÐ|p]6ˆ(ŠÏž=óþ·ßïûì¾°^í{‚\n@3¢(Â†EåmÛŽS1Q{½G06MÓEUE±Ýnonn¢\r8ŽcYÞ÷y¾±íáÃ‡T«‰Õ€‘Èú?#¬å\"¾\rŽxG0¬Ç²ð¶{êÞÙl¶Óé€†&AÆº\'ÄMÞÌ]×…¹Áó<²ufÈ7ß)1Ý—òQRœpÕÂ?Aü\\×ív»Ä xœ‚AkbŒÜ›g.f`„å±ù®®·›ÍoUYNËò}UÍ(Êäè•eé†Ùjuuýââ\"™Ln(JZ–7U•`ÃFQÛ¶‡ÃáD¶2[­ÎþþðÞ=Žã2Š\"HR2™ò:ž‡Cp\"Çq/þö·á_à$ˆaýßŸÿ<¼ÏÎÎ¾÷½ïá÷‹óóÔÏ~&Š\"lÉøÖ××;	î5j‚ÿ}åH¥R>\n•„Mêåî0‹Òû™&r–mÛ3ë–ábÁë°ôFãq¥ÒÕõñî€,¿[­Êù|Xò§šö¹¦9ãbé·Þú¿ü|á8ÎW_}•N§Ñ	1ƒžˆPÃ §2NGtÎžaüïÛo_žáÏvw7UÕ¶mË²àïôz=„ÃºÝîW_}•Édxž·,ÎcYÿ#Ë/^ ù¿ÿþ÷ÿZ(à7bUÊ·iºvçN´ÿÛuu†ÉdÒ+W˜°\\`–¬KË²À›^Îš8M†‚`Ú`ê\r¾›eY’$e2Ã0z½Þo¼âÚí6hÂ¶íL&F”\n>;D ß`®~¿ÿN×õ‡ò<UÀÁ;KhÛv§Ó‘$‰êŒlÃ¤3®=£€Ûka=Õ´Ç•\nýI¶†ÙjƒººÆeÇ}V*íÕjôç¦ªâ,µû¹\Z1ú—€``EµÑl6‹Ž=q Ýÿío‰­¼c>…9(˜%Š\"‚5®ëÞ¿Í}¯V#¶â8îÞ½{Ñ1¬˜Ïó›››(ËÛµÂ„\rº¨™L³„TÕo}øD\"zîÂúf2ï$·ÄÍÍMŸºÆÂ›Š>(CŽã¤Ói*B–e¯€T‡ °©Têþýûý~?¾YÊØêVl+ü~§\\~»X_¶6P•Þh|®iaæÕSM[	’ônµú¨Xô¹lNäÔÏØ©ô8±Œ®®£Ú‚$‹k—y³NÑs‹–f´Ñëb¾™Éd°Â`iN3¾\\a³ {Öùo/a9–õY©„ß?ÝÙñÑ\rœÁwÊåGÅ¢ÒP>×4tûvwƒ¡®8Á¯Ù@tó¨X|ªi×–ü›¨Ü+ÅÍ‰a]3XôêõÅbÖaíÕj°/ä|>ÈVÿßPBØŠ(9Ÿ_7Ñn6õFƒã¸w«ÕäôCîœÉ^\raýýeìéry6ìŽëþ¯•\nÌ·’]^r†W@XJey6ûˆ,¯^xH~áØ«ÕÌV‹ã¸«V¯?9Ã«!,Zo5sP†æ÷j5Êmj3ÍqâOÉ9–…ð“œÏÏPí9“300¼2ÂZˆC÷£—¾äŸr¹‚ßX65•}„j¿;«y5Or†Ù°€YBxFp	gÎär¹§ëXÙð¸Rù{­ö£r9~l+$c®¬¡µïV«3ÔyÎäd–ÒTÃ†¢d%Î*FX³°„ùfÊ~º³“–e¬tïêúg¥Òçš6mÅ„w-Âõ\'÷ùÑô[”eµ^¿ÎIR†Ûè.ï”Ëÿõä	hëw[[dÄE¸„1·{×\"ó-e˜ IºMUÝôì¯ìêúŸr¹‰’200ÂºAeù§;;?ßß÷ÒÖ¶·½»v|ÀÉ¢1ýÁW¾”ÒG£vw?ØÝýðÉ“Ÿïïƒ¶Ëj\nÎ4Á8FX7ˆ¶hî³R)Ìúày^’¤8§tß¥¾È—(Ë´¾{˜X»d`XaQ÷ë.zz2Ù2õì¬ž7y)ƒ7\"Æ‹a‰„E«–äËÐd\\»ÙŒ(bâ\"¬¾”f	g^‰ÆÀðÇÎÃÒf¡€.§ÖëË¨åãJ‹³pXÕØwp\rLÄ¾Ö‰Qùà+kÎäq@EÙe‘ã°€e\r4Ïµ<Ó ÎÖâÌ”ç‘200ÜFÂÂB,ƒÜ«Õ–±˜öÎ³˜>Ú•k7› ÜGÅ\"Jñ•5gò‰ )¶×‡a‰„…^Šó°pDŸ°Ð³VpÊ;˜qÎÅôÑ/€qÂbês&ŸZ·Á‹!‹YÖð¨X¤YùÇ•JXhœV]Že¥°Ì)Ã·¿»§¸˜­¸Ê«a`X.aq÷Ÿ;;tâÂ§ÛÛ{µ\Z­r0[­§šö‡ííˆÍ+•ßmm=Õ4\n„ÁÁ¤%£ßc§žjÚg¥nÂ“®®C9äx\nì,@†¥º„ ”vwÿ”ËÑNÀ0SÂ±¬`Ÿì´Z´©8,ó…ôd\\ |ún·K‡#Ô¶jìéÒ©€mÛoQœ×swÜ3ôºŸ¼lš&·Ð9ÇqlÛö\"çÊoû¹\rêÂ­Haw\Z-r¥{FQ¼[j|€³óóýý±¼#çócãS¸“bQlÅqÏóÉdò:¿¨÷þê0)6UÕ»DvZ†aÆ³gÏÃ^h<±¹[–gŸ@´Œt?sœs~†Ã!®ŒvÎîZ¬º2™ŒëºS\rÑeY–å{<›ÍÆÑüÅÅEðˆÐn·ã\\s=\'Û\Z†qxxxxxhF°&S©+Î§I§Ó7Q.ø^BòæÌV«ãÙI³¡(qbÉHEñ¬˜©¦êW®ëogÁS¸¹s±–ˆeY¸Ô/L9£«+é½÷þå½÷\\×uÇG.èNxH•ÄÈ3ûý¾W–àUƒñå¢+gng”ÍG³•÷Ž{zÞn·ÓétðFÕ D¸lûö­BPH\"‘ÀÃÔ…æËî\'ª7éÒm‰ñõ3­ºÆVÕ4MhÉ4M\\I1XâÂ:_³‡~è!Éîk9Ðž·Î .(âÀé8N¯×£‹&½žå°”›ŸIÂQ3Øh×p¾\nÙ^4•JEïÁÑlb³Þ(åSÚýáá¡(Š¸1”n–F¯F›&ãe}}=L±¦u¹ •ˆ†5ƒ°dÃNÔ	.¦\r&ŒãûX–…«ma¦Qû¶,+NÛ¶ÝívgPW»ÝçùÃÃÃ‰\'@·>Z’ºÆ÷”—=y¢uƒ;hÓé´eY¢(¢EÁ²Ã%»à\\aµ7º:N»Ýþáý}Ç!ï‡nõåànèjb/÷SËEñÙ³gÑ½záUây·½¢S»‡M„Ö,Š\"þDÏ…ðGXd*¹¨&pR@šË‹yážç aÑ˜V\npº,Ë\";Å¶m ñÕ²CwEñðð0ÂX8::\n^+½ìakDÜ¿‰¦ÍÀJ¥RÐ3µ\r8z¸Ê*%]…‘i|u}ã*mlÌÜ¤naÑï÷½ß;N/ÖÂŠO[ÁÞëuã½ƒN¯öD¦’+ïœVØ©O _2\0É ]Š¢H&R|uÙ¶í­ð·|ðê¢LCÈDZ÷õÀå©+š¾\'F»Ç6-D¦Æê!‘H`—[„â«k*Û9B3”Ãm\',ÄwH›½^/¢]ç(\n›Ë7ŒÃ6Aû€©¿¹¸q“VS	+Gqzc*•BÐÝÛŽAE–ÿ´êJ&“Á\nÇW— 4O3ZØl6ÛívÛí6ì¸iÕE$2ç\\ÇlssëëëaíÁ²,¼mÛÆ¸5¿ºâÇ°`îÑØé}ÿðð°×ë=zôˆÿÕ¯~uK¸ÉqÓ4ÏÏÏ{½Þååå`0H¥R+++ƒÁ Ûí^]]AYŽãÜ½{wQ…^^^ŽF£ÕÕÕèZ\rƒµµ5Û¶OOO///ïÞ½»¶¶vrrrqqáº®eYçççwïÞM&“¦iÂ999yã7VVVÐI®««+A¦’Ë²¬Ñh´±±óÔÖ±ôâÅ‹n·{~~Nµ\nÃùù9ôO­Š:;;C†åF¬¤\"Ó4ÏÎÎF£Q*•J&“\'\'\'ÃáðòòÒ4Íáp¸¶¶_]kkk¦ib>®ÓéŒF£ápm8€^MÓ\\YY‰ø¾¦iv»]o“ã8÷üü|0Äa:|ý ½ÿå—_~ÿûß.TdF¯×[]]][[»¸¸@Û°mûäädmm-‘H\\^^b6~ðƒx{Í`0«««‰DbZuœœÜ½{wâ\ZŽ•••¯¿þúüü|uuÕKXo¾ùæÚÚÚRf	_G.óÎ‰,q¦œÂ€PèÌ[ª\\óÀ¶mžçƒsµi\"\Zc\'³¦ÕöM[ôvIL³%Úê¡IÕ¥ªkÎªbF‘8FXKÇ\r_øÇÀÚÏkFXŒ°a1000ÂbXšÍfëåFEQÔë:îJÓ´ò¤3¼¦B­V+Þ¤3H±‹Õj­VSUUžãäµ©ÐjµšÍ&Çqù|þÚ\n}}±ÂT°lÈ²¬(J¥RQ%¢E¶ÛíoÆÀáñc÷èNDeÖK†î„œ^ßZÂ%¯w¦<)ßW]×E©Õj¥ÓA¦*ë‰\Z†¾èûŸÂÐh4J¥\Z†5ë.¹\\®yk..a„ŠEíƒ—eã¿wÜÖu]×uË²šÍ&Zª ø¶ƒ·	Ú¶½··Gÿ%èºNÉƒ#¶÷5ê­VËû>ò¤÷Ã*€‚òù¼¯,¼ïíÞA¹ÂVV˜\\º­×ëHâSå0±,ˆ€5GÞçA›.øeùØ<¦µZ­Z­ªªšÏç•—»h}š÷ª7XJñÉ¬\0Þ±,¹ù¤€\\×FÓŒ°â‚Á%zî8N·Ûõ>ÁŸÝn×{~½ƒaI÷p8¤çtd\nöš{“‡ÖJ¥R*•šÍæÖÖÖóçÏ“É$ZÚ%~ ôF£ññÇ\n…f³©i\ZÎW*•J¥R©Õjmoo×^°¥i\Z\noY—½V*jîš¦moo£­ã…`¨õ·Z-äìílHŽšŒ•+¢Ç†•5V®‰Èçó$c.—k4\ZÍfs{{0¬¬J¥¢iZ«ÕBI’°—XÓ´Z­I¶ÑhÐCË²r¹\\­VkµZµZ:|­V+\nÈ6Ú,UUµR©ø˜¢V«‘,…B:+‹hÈ;+€&Q©T¶¶¶J¥’¦i0À¡g r¸æÍÂè6áìììèèèøø¸ÓéƒÑhtzzz|||vvv|||zzJoœõû}zx||<\Zƒ’ŒF#×u‘íÑÑ²\ZFý~ÿèèIúý¾OÕÕjµX,â÷ûï¿ÿÇ?þñàà\0âM×uNOO;Î/ùË‡RÝþñ|òÉ\'Š¢àÏÓÓSI’NOOéR‰ÕjµZ­â·ªª»»»£ÑèÉ“\'²,ÕRX« ´ÞBñ§¢(ø—W.ïûað•µ»»”+,­W®ÝÝ]UU}/”Ëez!B®ÑhT¯×‘üøøXUU¯ºêõºïeµõÕðôôT–e<Üßß\'q\"¤$©X,R>;;;ù|Éé-k¬žÇV€‰H]ÞïõZàvYX¢(bmn&“ÁŽ\rÚ¹.Šb6›%ËKEì½ 98ÏjïylËÄ‘ž’$aQ;í’G¶c#PäÞ¹sï{ÿÛétîß¿/Iv«ýâ¿ í»<øúë¯ó//^•$IQØŠ¢àµ‰‡45›Íy\"èÞ²`à)1Oä¸Õjåš6]×5MƒÑý¦eYš¦\n2.Ç¹ºº\"ïLUU²ešÍf¥RÉårôDUUUUa³“K§P(är9ŸM:åryÆ)Þ\\­V#mŒ-+L‡c+@ËÛ6ŠÅ¢®ë[[[AC¹„7þãô^î\\fÎ6Nû¶¿Ì¿†rn^]]õ…¢fÈßšï¦îù+°Àl›Í&…º®çr9I’êõúDFÎårÇÁR£‡WWWÁ\nÀÕ…m¥xŽl«V«°b\n…øQ’$Y–w_\"Î,¼$I;;;DC’$åóy8†DXcË\nË-~$IÂk’$‘Íëæb}}=‘Hd=˜¸?XêI¾è\'T„/\nöÅ_üøÇ?n4\Zx\r£1F`ŠÑø¢?xÓjÞ OØø?‘)TU¥ÀÏ˜‡¡P+Ÿ\\qì2êÛº®ÃÃËDËÕjµŠÅ¢,Ëô¦ ‰D‚\"zÞl\Z÷EÁÐç‹Å\"LŽãEAÂ©d\'Â%õjš3¢¬±rMU2ŠËåò<3•×†[t¼nIèõzôíqDB‚ð¹—³LÓL&“½^Ž+Ã;¶mƒDàTÚ¶MÙÂ%4M³×ë%‰L&ó›ßüæÓO?ÅxžÏçƒÃþåååéé)åðë_ÿz{{û­·ÞúðÃ?úè£ápè8¶×Ã÷t]÷\'?ùI¹\\†)aYV½^GÚB¡ (Š·¡çóy_½ë*dYÞÙÙ)•JÈ¡\\.ãT«ÕíímY–‹Åb\rÕëuJ^­Vgó}e¡çåŠ˜eƒaR¯×QUUEAžù|ÞÛ±ƒríììÐ›^?K’¤B¡ ë:º1\\§\\.—Ëå°æÙêº^(àa¡æ¤™J¥‚1CQ”jø¼TYÞOV©T¼Ê+uCqªªâyü\n4\Z\r0#\nU–Þïœ`G¿1—Æî\\{XBðxì¥Nkúj…s$vØršÁÂõŸ÷îÝÃÄû.Œ°ÆÀ0Œ°Û¥®X» IR„etk‘`*``ðºó¯–eùœ>fa1000Âb````„ÅÀÀÀÀ‹#,†[‹\0*§Ž\0\0\0\0IEND®B`‚','mime/png'),(3,'ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||§\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||§ÿÂ\0¡ä\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0ú¤\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;æÄDH…R\"\" € @$Éipg%åìžÕ»\0\0\0\0\01ù×Ê©kEU„…UˆX…ˆA\0&ZH™‚d™™fgvwg²Ç³Þé½ü\0\0\0\0\09wÎžJ$À©+\"¬BÁ,Á$“,òÍ-3-µõ¯ \0\0\0\0\0˜|åà*ª¤À¤*©±LEi4ÈÒLƒI3/2ãLËm]k¿€\0\0\0\03ùÃ_X®`…Aab !V¥¤y–’fbaå˜i’v¾³ßÀ\0\0\0\0›|Ýàª$*„ªªBª¬@A,ÖHªÍ-,í-$*	\rÒÒ_Wú\0\0\0\0\0\09ŸÎ^$\nHŠ‹ °‹\n,ÒÌ×9ZËXÍcH•¬Ä0£0WXïÀ\0\0\0\0Í~q×!aaaaaaaV!aaabÌÊf{šË\\T{¬v˜ªªj@QšH««wà\0\0\0\0\0æß8xk[S,*ÂÂÝzÂÄBÄdÆÐÙ’ö;»Ûe÷³‘e¯ãbbÕÌÆÓÕ{è\0\0\0\0\0sOœü=Œ?\npêZ¼DD)_TÆä½êÙ®Òö»[m¶ßnVS“\r^7Ÿæâ’Î7Rï \0\0\0\0Î¾nÖc7è¿žr<Œ5…XXÚúf ƒ‹½.ŽOÕx—…ì¢)ÖÝe×Û~M÷äd4Å~v½æ¤ò»Nï \0\0\0\0Î¾oÖ#;mÔü˜XXXXÚ÷äGB¼8ò}\ZôWÁ†Ë	y¾Û¯È¶ÛmÉÌËÌÉÖyî\n³!°ô¾ú\0\0\0\0\0çç\ra}^óÃd………«uª\"\"<¾³­q­Ævm²m\ZË\nÑíÞÇ›ï¾ëý.eâÖW	°ôÞö\0\0\0\0\0ãç-]}… xÊ°°«²n¯äµ\n`{¸ô¿=ö¶ì‹ïÉÉ¾ËÔÇÀºü¬ýÏNÅ¦¬aóyîB-~÷Oï@\0\0\0\0ÌþxÕcÔíÜ`Àò¡V#{Ú³<Í‡V÷üj·Ži²áNV™¯m7]uÙ7½—_îâd­–äzžF#ß•4¯ÇX•M‡§w \0\0\0\0\0ç8j±ŸØù5^V:ÂÂÂûÝ;Äóú–«¾òüíŽÍw]Öökr22.—ºÜJ«í¿ÓÎÌ°±ž~e­kD“§÷ \0\0\0\0\0ç_8ê±Ó¹§›R,,*Ç§Ö¼Ï:¿Q5ŒÄÙ“3RÖvLŒŒ›¬¶ë^ßJ»]ì³ÐÌ¶ûïË¾ß“…Eƒgéýè\0\0\0\0\09çÎ\Z¤zŸBð\nÓÃU……C¥hþï¶}¨òþ…ËèÞ½häúÆÅ~n[Ye¶µ¾’ÝcËçz6Û~FVSü™\n‘´tÎø\0\0\0\0\0óçM}ÇOñáaaaaöï\Z1}¾£‹¢äâû\Z¯‹±[™›kÝe–¿§]ïkž·ee]—gÉˆ°®Û?Lï`\0\0\0\0Ï¾oÔ×Öï:™òðV:Gi×~@Ã½jø;‡9èšòïüsLÌºËl²ÛïºïSÒÄw»*}1î²×ä\\$Û³ôÞò\0\0\0\0\0÷çF-Ïó±–!V¤wí/åb~•Ô|n‰Æ{F›‹Õ~}ð6›²-µÞÛl·>Ë­fUžûòòòìù@¥R\r«¨w\0\0\0\0\0ç¿8ê1‘í×äyð°°°¾··N‚¾‡¦µ½6F~Ïm—ßem–gßm¯n·å½ù¹/ò«¥5©³uô\0\0\0\0\0óç-F27]/ÏFªAsóõÈ………ˆ€—ikü‡{m·Ò{l²Üÿ\0oÎk²ròrãå•´6>£Þ@\0\0\0\0Ÿ|ã¨G£ßxw¨¾5¸ÚþJbG·²ùÝóÔâØž_JÖw½x_­¨x›;ÜùX÷[g®¶Øö?¹‘—k[kÕó(’´×²ôîô\0\0\0\0\0ûçBR6o§´}òþWÙþuÝöL]ËÑá»æ-gºûï¶Ûï¶í‹,“ÖÄÇ·\"â¤âk\\H›Lï@\0\0\0\0 üÝ¨.F=k×¿‡Þ}9äøý‡Îô¶ó†úº—‘¶æ_m¯m®*<=¶äm&\rTÕkú<½U_¦÷\0\0\0\0\0Ð~nÔ+¤óæ\Z¨XX\\ÅÁX……… #bØÂËly™{­k]™îÈ²û­»ÚãxÑl]7¼€\0\0\0\0ƒóv ¹[–Šøj«‘êbä{¾‹ìá]æÖÊ¸yÍŒä…¶Û‘“uÖ]m¶äedäågëóÍTdéì\0\0\0\0\09ÿ\0Î\Z|{Ý¯‘ù‡…êý«Ç¡³s>Ÿ«ûÜÊKOò½fggºÛò2¯ºë­¶Û®±<ÝÊ©X6N›ß\0\0\0\0\0Bù»NŒÍ£WóVc`è{jç¼Ësó=5®štíS1ÝÝ¬µíºü»^ëm¶e1ð01éX\0}—§w°\0\0\0\0\0Ð>oÕñ­1aaaV7=Çè]æ\r«×³<[114­_-ÞÇi¹Þëï¹Þëa1è§HZâ	³géýì\0\0\0\0\09ïÎ^?œáRôÛ‡\\,n»¯‹ôgÌW·»ûþv­æìØþ.£©ä½`Ö;YvEÖ³UEk\nV³,Û?Qï`\0\0\0\0¡|Û§®_gä)Cã×‹JÄlN6Ããí~†7¿É|‰Ü›é·µŒÓ-c½¶YlÊ×UBÍµ“$4›OSï`\0\0\0\0¢üÓäcyÅQ\n°°»^ã·ÐÀpýK°é˜ÿ\0/ÜÍ-,ÏkXÓ$Ä*ÂÍ©2ÍÎÕÕ;à\0\0\0\0\0h5éëcãÖ°°°°»^ã»`j»·hªôåš]£3š|Åd´³KË30Ò,\nLÌ´³D³m]W¾\0\0\0\0\0ó>²™½ß‹aO\n±µn]{ÇæÛ¶Ñ¶bùzw/}Zy™vÉ™l\ZY¥‰gÚº·|\0\0\0\0\0\ræ}Us7­\'Ä‚6Â!6ï£@ùó•dfy^±2Í/\0À#3´´Ì´³í_¾\0\0\0\0\0‘ó–þÖw—%BÄ*ÙNŸ>^ã¤ý!Îµ½«—4€HI2Ó--,ÒÒÙTízËû>\'«Õµ®·ß\0\0\0\0\0HùÆ³ÚÎó+!#!b\'Pœ/w_ë\ZÏ•·ó\0’fZZZZ^Y³©œº=[|ÿ\0{\'ªwÐ\0\0\0\0\0Ó>h\\l|z)¢šª®´…Uˆ\"€	\0&I‘¥¥ìw¶Ûï¶ü‹ò22wŽø\0\0\0\0\0\ZgÌéE4SUu¢*ªÄDA\0Fõ„˜~I3#L³3»½m·_mùß““½wÀ\0\0\0\0\0Ó~e\\|vÄÃ¢š«­+…Uˆˆ‚\0€^›uh¸ÒI2KK3;µe¶Û}·ß~FFN÷ß@\0\0\0\0Hù©1ñè¢Ši¦´­!Ub\" ˆ\0\0\0$™&ZZYÝìw¶Û¯¶ûï¾ü­û½€\0\0\0\02ù%–»Û\ZLWyÆy³\ZmnÇrÊZÄYÊªˆ½j.),X›¡ÕKš\'Ôº§›zÿ\0Ò€\0\0\0\0ƒòÖ‰…^~Ÿ–%©Nu1›näÒU›ŒÔ^—J_‡v6^•µµ_NN%¤+Z¾Mkèc×èßïýÔ€\0\0\0\0ÇùŸNÔðü¿R1ŠqÕs±¬Ç±£?\ZÌ|„Y«7*›%bœ¬KÑª[Qéµ%ôU‹\"üSÔ÷v£w \0\0\0>Ð<kÈiÆÅ[¬§Üüýz\ZúñÚ^Z &‘T+[r1êL¬Šh´e£Úšðk¾÷OgÛ÷³¾öÀ\0\0\09/«YÆ¢š‘ab\"0`\"B	`ˆ€	nÉ$’ffe™žÛn¿×÷/öþ ¸\0\0\04_Ÿ+«ÀÇ¦š•b!b\0!h€	  \0	œ‚I–\ZYí¶ÿ\0SÓµö¿§À\0\0Šó¶\0\0$ 	ÈË`\0p™	$€$d™ò¾­´\0\0\05Í7AÖ±QUb\0	´É©@\0\0@2± fY™ÞËs÷\rÇw¼\0\0\0\0ÃÃ€\0$\0\0\0$\0@\0`\0\0\0\0’e²\\\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0@\0\0H\0tn™’S\"R±X¬eÇ ¯¦Je6™-3b#:D!yÒ\0;:S2L“k^÷±i˜Ë*V(¯? $\rdRmëöß[ÞÒœ¹9©No2@iÑÈaìµ·ÈtôqvM¯¶»m,¸ü¼«~D€èö~|>ÛÔ™ÓÈñ~wî=KÍSkÍg.>)ÅâH\0ŽŸoçÖß«ÛÇæ<>Ó½&3Âôó;¦¯/,ø|I\0\\:ƒõ¾¦ÿ\0çáú7±Ñyœ«O?›qéË.O \0#§ÛùÀ®Ý>Ï§ðž¿¥{=v™Ê3âÇ^]ó§7 7ô¼pø®ÿ\0¯ö¼ï;ÉæýÕÚú^³^,sææèÇ> \0\"k`åÓ}óÏ:ýß­®³9×//Lxù{qÇ“É\0µ¨=ÙqökßÕíúûk1Ì§rÊ¬©ÁãH\0‰¥ÃÛŸ¿-·ú^÷ˆ™ak9ü¾løüY\0Ÿ¦‡´ù]ç_¸ï´Ûmö¼Ìaåòá^O \0\"0és—–>w£¾Ã¶ö×MµµéÏÃ†Y×$\0#¯NúÊù~Ï§Öv^mmo9óã­#ŸËj‡Üvqü#ì¹¼^¾©´Úb)\"y²\0#£Ýù°û}3øŸgÑ2…b•Œ¸\0$:üí.\0\0B@		\0DÀ™\0„¤\0„€‰L€H\0\0\0A\0E4\0\0\0ï`\nF€\0\0\0›I\0\0À\0 \0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0@\0\0\0\0&šQ!!¥–S2fÌ\0­AˆC„F1åžs$Í»°\0N¶¹ŒLDá†8Äã	²Üòœ“~ì\0€+ˆ$åê×…xÄììg3•ûð\0K\n¯-ÉŠñÝÃ{QŽWU8Å›½K\'-ž”\0£—Ú#ÍŒpèõ}æáN1ŽM}Ýùíu`\0–¿#¼\ZôipmÛëny^F¾¶³[©È·k?Cf{X\0%±ÚóÕ»âíëö´ø<­Z«®ºÝ[¶6oÚ²ÝŽœ\0×ä÷Cn¾o—ž–ÍœŽN¥uá]N¦;{Û›6gwN\0	S¡Ôm×s=§—ëzß“sj®ªª¡Ñ‹·ví»;úP\0\'\n¯&kÛÖ·gÃs)§\nê¦;š{]Ë¬·g¥\0««`=gê<·;CW•Ë¦š«šç¥EÛWtìÏo©\0¢Úƒ¯­GkÍYE>{•VeœcmMÝÝŒöz°\0JÞ 0ÞæáLäæéc×EXa…SÝß»-Žœ\0	­0âï¨Ðôý:¼ž¦×…8c…—î_fs@\02«CÍÆÿ\0µ«Vúü¶¶Ž8al[9ešýø\0ä?SkÝ¼^ÏsG_ŒS9çœÊfíØ\0G¾>»>Žñz[\Z\"&S–YM›\0&\0“Vù\0P\0, B\0”)\0Ê 	@&@0\0\0\0\01\0M˜\0\0\0HÏ@,œa\0\0\0LÕÀ \0@Ib\0\0\0\0\0\0ÿÄ\0:\0\0\0\0!126@ 05A\"34#7BQ$R`%PaÿÚ\0\0\0ÿ\0í¼­L.\"îNÛø­¯-“=~èqwOˆ¨ñ[ˆ«»<D]Üâ\Zîïžïñw‡ˆ¼Zýw_cÆM~»Ë¯—yµòï>¿]è×Ë½\Zõw£_®ôëõÞ­~»Ñ¯×zµúïV¿]ë×Ë½zùw³^®ökÕÞÍ|»×¯—zõòïN¼]é×‹½zõw¯_.õëÕÞÍ|»×¯PãV½]ê×Èq«_®õkåÞ}üw§_.ôkåÞ~»Ñ¯×z8€‡¸€»Í¯×y¸€»ËÄÞN ®ñqw‹ˆK¼<B]àâîÿ\0Qâïÿ\0Å¾\"!Åž\"®ìqwSˆÿ\0Çt¸»£ÄµÜÞ&.äñ0®ãq9wŠã@khµf*ygû~4“ºÑfC\rNvœ„¨ß•’ÿ\0&Ó×™q]gÕ(¼®d\\·D¢Vë\rüè¸®eÌ¹Š.(¼®r¹Êê¹u\\º®]W.«—UË¬åÖrë9	JêÔ+¨WUÈJåÕzë=uÞºî^aëÌ½y™šzór/9\"dBì¨^‘ò¡~T2!‘™œèegC-:‹f¬!²†~ÒÄd%ºÙÌœq\ZÃT0}¿\Z€\Z\nÊÈ€ä|ÅÍ^Áoùñ>­×¡\\¡”wñßól¶[-–È²Ùl¶ðÙr…Ê¹W*å[-–ËdÙl¶ñÙl€[x\r3ò[\\úÏSýÇ\Zöül+ÿ\0à9z\"ËtáúòŸÉºÝs-šQhÛÐ±Ëcüþm–Ë•l¶[-–Ë•r®TØ.EÊ¹VËe²l‚o\r–È·äÓ_%µÁï¬µGÜq·è;jøÿ\0ñîDº>ò‘ù[~Câ|w[ JæG®“O±…È´p€ñƒP•r®EÈ¹\nA‹•l‹bå[ \0 Ï¦¾Kkƒ¿XêŸ¸ãgÐ•ÿ\0ÛÝàQ[-‘;#à|OŽÈÔ â¹c>ýŸcÇ·#‡¸•\0¶[ Ô\Z¹W\"\\‹‘Ñbå+•.UÊ‹Pe²öðù4Ï«..5†«?qÆvíÃÛêðßW+‘iE®\\¯\\®EŽ\\\\]7#‘c—#Ñc×+Ñc—#—#—#‘k×#‘c×#×#×#×#×#×#—#—#—#—#—)è Jkÿ\0ï–7{ùvèkÈ=¹=À@ 5.B¹\n,]4cF%ÈW*ÛtZ¹W*ômÖÈ²Ùmá¦~K‹ƒ¿Xj¿¸ãK@áöE_ý¹Ër·+r·+r·(’·+r·+r·+r‰+r·+r·+r·+r‰+r·+r·+r·+r·+r«Ówˆ<\ZHAçùä…ÞþU‡å5evµ„\ZƒWMtWA:ŒIÑ\"ÄBõðå(²\r[-–Ëe¦¾K‹ƒßXj¿¸ã_ÐöÒ«Ö}‡¹¬±]õÞø¡šy&Îf1t¦$$3FÈžÿ\0Ñ‚­«%Â„åWÂr¨âr«á9Tq9Tq9UðŒ²øFY|#,›ˆË>v@ÏÃ\Z‘\r1©	ØGŒÉJÀøþ—V(Ý¬ÖºÅoXÜ‚Ù@ &¦’ƒÿ\0ìEýü˜?\'”™«§·»XƒIë§×O€§FB-[ jä\\»xì¶Zkä¶¸=é«õgÜq¡»pÿ\0\"¯þÚT6,WsóÏ;Ãæ­%ˆ¬G%q–ÔaC›ÌQådW/Û¹Òó££ïNÉ²¹*äŒß¡Kê\\Z©^(œÇ)ëÀÃ‘`\"ëT«üNÌV«ÔÕgzTŠ©ý· *\0€@ M@ B51Î	¯æÔ ËÉÿ\0ñòÒ·ÜDº §UÝIL©iû© -(±r dZ\"ä+­:6mµÁï]]«>ã?íîQ_ý±Þ8Â[z\"!Ñ˜™¨DçäLrdâëOGOc\rèªÃeÑÕý\r$žà2`r­GlÊ#gÁïrÈöÇŽ|­ƒêÍªÏ«(‰þ4~¦Å*\"Ãznl¢ÏVO†$càpÈêœ5ø§¶íYþ5‰nñLº\r#ÔÕb5ëÊÉüte\r½ÇƒSP	¡4 Bjjja#Øï˜W®ïo$ïøš¯3¨µáOˆqßkXé\"%öÝ-¶\\«dÖ>›¬\0Ù¶—¾¯ÕqÆ¯öó(¯þØï[euøDF<Á3™lì¾á7éi=Œ÷,ªç&K]ÎrîW>8C’H h“—¥D¸4Uãiåð¶%9lhŠ\ny›ˆ«ò\\û,ô1îåñÚŽ†üùw—Á]Ã\rý©\0P„å—–rè9\ZÍ>þN5ä¿èU™t%á¿öÖ ÔÖ¦„ÔÔ\nMxL”(æM|nù£†£×á¸î7få8y™‡y`µMõžc…²þ|6ðÁ|–W†ú·WýÇ\Z\0íîQ_ý°øà÷ø­}¡·¥:*ïËJØs°Ë7Ätðµ †€|æÒŸÞ¼Ÿ¬Mßœ©ÿ\0xÆ­c}[uÎ§±œÈ–#=X>û9Û2”®ž;Î£Ž˜†	aµÕúŽù~ÿ\0Äbìo%i¾â7·Ü5§ßË1ËÉàÔ!t6Md#ÝyhÏ¸©\Z?èV.ƒÇ»b(ÄA(S¸}¼¥‘ó\nÏþ[»zcØMËìË¶[òcò™Ý¨V^Ä–2d‘Ìjé×)\rõ;\r–Õ¶—~­Õÿ\0qÆp2ª÷ínñÃÆdÉ@Áø{,j¶ÐÍA#rf àZç1Ä°?¡¦m\nÓÚz:™ñ7`5„»óµ™JÅÝ6ŒiÙª-pk¾7AÝ3¸÷\0ZstT¹Z¯ÉÑ‘´uløçóÒ›P²ÄÝYôõý;Z”,Êj;˜<ä/ÓBÚ˜È*4í¡´šô×¦½6WfZ&Ø;8\nÎ÷lUŠàQ†B¿\rÍ/¬_†3!á¢Î)Tÿ\0ì\nî6¿ý¶&±ƒÚ¹í\"È[«4ád‘Ã(C®~CŒ›þ¡yƒrá#=šò©¿ÿ\0j²¸ñæ­¿‡2>«•¾È´…€ß–Öüú·XýÇÛÜº½ûQñÁ2µÉ\Z—2­Hó_7ñE©²-òýkÙ{·«A^ÐÐ¹_†».ö»3–¼×°asq’Ûe©,åò%÷`Äêöü=ðdry®fñÆ,fþE†A~µº}h§Ñõ`»*LÒtZIŽvwäe êÙonq¶oY¢Þ|‹fc^Írç\Z7ÓÇhl&½ ô×¦»u¶M•uNèM¶É³ÓfzÀ^±^™d.±å9IÝé/˜¦ÿ\0£ïqOÿ\0’<Vät®È÷ë\\$)øÜ„Må®oÌÝŠhMs¿—V«/ÎpØ÷û7ÖHÇÅ3¹¦È‚‰!s®uÎ+òÚ\\ú·XýÇþ€É+ßµS\"~B-}BËåŽ,­sbœÓ™Æ°<Y¯=Yä‚oÐÓð:Å‹4ÁBBÃádm“%8¸\"É+Wµdã15mU‡:Ëú«!ñÆG~=!f½jØ÷Ø~¡Åâ{\"¹¼H5°lžc#’ÈUt4+]Éâg™š‚­lÕì¾šÃc­ÐÍV×àÐX´S P>¡zì\ZÇ¦úz }‘O³FÈÓè-Ûd+Ï•¨ ‚iQ¸µÀ§¿}q‹Q[¼¬Ê\\Ûcæ¢“û¢<cÏ¨¥‹w·Âà? ÄOÿ\0ãoFÇ’ãÌ\\G[…ºÝiï’ÒàçÕšÇî8Îo²jïíGÇ,q_…òA¯îÖ.t9«BÆJIÙæ,ìÝž÷½ÅÏýLí‚Ãžb2ÍËÌÝ’“÷8L“kÖ…³Ë0¶[f!A÷2´˜Ã§­©0:2•Œ«uøÊ.g“¾ªÃ<YìwV%¡6D¬­ûwñY<v3=¼F‹ÊX÷Å*ñkð(,ögMA0–ÃÓ	ÛÔz¦ÿ\0ýk(&û,iÚõtÃý-A\0ôAÛëšI¿(A54¦¦ÝÓœáûsJ%’·[¯E§GôZ\\ú³YýÇ¿Ûü¢½ûIñÁ’2µÈ‡IW}¥9 É³Q‰Š¥Ó>Î*œ1Øs?Ca¡3d²Æ 3WvWâ9J¯°qc±/µ$9O)/Y˜ñä3nš3}õñ/«iÁ^fK”‚©P3A¦óÛ{›?ÄóË[;;q„ødt%fZl†óK*i~¨.×Næ¥IËý©ÓFÊ?R›ÿ\0 M@ÓSO¢	¥c}nÂ>V ‡€[úÏ®bMö	¥ÝÓSÙ3b¥ô¯:;-ÑõEz­ÊjÓçú-.ýY¬~ãŒßíöU^ý¤øâÍÉ@aëåwÙgaÙÿ\0JSE(“YY•›Ëk+†ÌnMµ×®E<Ï#Iä1ô2v%³Kˆú˜ëäõÆ\'\"é¦³ˆÍÑ©B€ÎbœâçÆ/ã&_ˆðKñ	~\"Á/ÄX5«2˜û´é²®ílSnÙ¢Ù6XÁQK1)²1s± „ò€Az¬Oõd Q=¥Ø ‚ÙF•€ë‰di×Í“Be\Z›ük£ºßÀUî‚Óÿ\0%¥Á×êf~ãŒ¿íîY^ý¤øàv®¡n,é£#³†œaœ?Nô¿¯›KˆÞãŽ2·Èþ~\Zÿ\0——Tðù‘>Hsm|xÌ´n;îWJR}4iÿ\0ZÒ£ÃìµÌS2+9„Èá^Ènél]¼»qÔjßÐYºnälŽÉP#¢od¨Wº®âíÐß>Ž¡c%WJ¼Ú$ß, Ö{Š•\ZkC$‘»R´O£h\\CquÔ1·Æ_MÆßMÇd1ù1ùá´2kÎ:ô½Šº‘ÞþKP¡OP¡SQ![Q¨ ÔÀú5QÕVrÇ¯S ×ÈWâð*ñøø“ü\nO>ÃÅ#ìì_:rs\"È‚Žÿ\0ÇªV~K+ƒ_Të?¸ã@áî]]ý¨ø^ÄÕ¦lÐü{*­ZžÔÆYÿ\0!üÜ6ÿ\0/.°úÉÕ}kYûÚÇå§Ÿž¿ŒŠX«{¨¼Ë, âû7\\qÝÊu¬O¬ó´3SR’ž‰¿B„”g¿gTiºp²,{Ç.GœÔZZ,N.+¹Ü½<„tY_@_¯Žv\"åƒ¨´p’SÖ‡šµgö§Qš™î›ºêPMAº\Zv¶Ò™ìA²äÜŒ<šï&¶CÝ54¦(Êa\nñ-&ÀE©Í!lˆðiØ­<àæZÛƒ_TëO¸ãCxy—W¿jw1TØh³\'\r3˜*in£Z¯3Á\\Sñ?›Èá¤ô»©Uu¨¬A4}eðêË#±Î{«|w\"Žw A\nÕøaŽ&|$š¼é¢˜þ É/Ä90ªê,Jì‚/Åy•ÌÞÈÇv0?Ú°oèG9L)¨ A?0š‚¥|ì!n¼ËlSvML”ÀFÊ59Ú¥¤Áý-NôEÞž®o¾Å‹Vœù-®\rµ6´ûŽ147‡™u{ö§xÒ¬-ZŽ4™a3G©å-˜\Zâ·7Q‹•Û‹Û¶ë„íà}çp|qß/˜d[Kÿ\0Äo°ßõp\0t§CÓdÝÉ¥4øÔÔ?ûåÔAS,ÌWÜ®ó;˜\n\0¦˜k} E…G·#S½JÙX}QÑiÑ³-®ýQ­>ãŒcnåÂ»ûS¼pÃ|p¬jçÉZ8Û“2³PÁÐ}¬Ù.ZË‚Ý†¤Ê2ÌÓ/ÄöIi2ç¤š•šó(nM\0\rm«O²c.ðÁãªÞ’Ëgü\'LÆKOÐ«Fì­Æð[CYÅÐ³\'b4\nâ‡ÀiÝGJ…(øcš•Œ{2š&\\K[çñ\\7áØÑxŒöb½.K–f>|—ômma¦±Qv@#À}\0ß|ÀÞÅCfÇoôÒÖZk†¥JjXíNšíÐ	¨z”Ð‚&¡î‚Æ3yäMAAÅ£t\\_®3j:–$Û•˜»Ï”Ž?î	1¬÷mÌ[PÉU ÊIÿ\0™rQ¸ÒÏHØˆ[xáéá§¾[Kƒ?Të_¸ã	ß‡Ù‚®þÒï¶a¶Ë‘«•¿œøiŸŸ ¢±œ“9˜qYn\"C$‡U†i³A²ñžYï<[–ÄÚŸ%‹ùìn}ìö¡ËfÀ7ÙOÎéþÁkŠØ­\'&‘zÓ¦çÅxTmä+êÈò¹A§¬fe·+®èiL41r‹Òápx›~W‰l^-`1Î¹Nà&5&Æ›\Z¡	M®Sk¹\n¯Ý6œÄ°¸›òÏ?)Ääcª)1¿ÜäÇ3æaÚ¼þ9¿!ÊLÉ#5®nVÉ~ô¿ÜùŽînÁ4 ös~£>cœ¤ßoõÃàfû1¨”A[ `Ù¬Ëipkê}k÷cÿ\0o3*ïí.ñ§40Z†i¥1$1þž#Z„–]?â\\Z¿žÇX¡rñœpÑu1´+KßÝµöºÁjMES!S!®¥ÉAZ¯Îã‹Šú®Ãá²?xFüˆ»>G‹ú>Î®Óyh»ÿ\0 ×ô\ZÁë<\r\\5§\Zÿ\0Lmc©±YšT¡§§¿±eC÷Mˆ¦Âä#Ü:»}ÅŠaxú9N_c™²>A”»ÍÌ†_$Èä\'yÝí¶Ïù	ê”×@SC´ÓEcWæÓôwçvTÄä­•Öí¿æõ\'Ô\0‚Æ·žäMA»µ¨„VÅ¿8Ùùl®}O­¾ãŒ_íæi\\ý¥Þ4Z×ZŒ;¤«äkÌöÏJ[FÔÚw0e£Næ]Ë,nŠY#ç£³}ò¶Xëõ\06[`Áû|RÖÞ†ý·!4®ùšP•¡-ÍŸãÍ•æI]bSe!6aü‰FÈJƒÜƒœ(½62{\r?Ò-Ú?3$\'æoDûˆ+»ØRiÛ•¸«O?éá0¹‰À_f!X˜Üdj2çá¿†ä´¸/õ6¶ûŽ0\08uš\nçí.ñ¢H·fò5ë¾¯¾AmÄVˆ-.È]tÀ\\ç9ÅÎüõà±0”E5LÝÆ±“¿dRÊæiläc™C‡\Z· þZòpk^Å;ï`oÑ½=9Û 53˜çŠº?7j¬bü\r¨Í5•¥b¼3Oeö±ÓYˆÞXó§2ÀìNŸÉ€7¹µMŒ|ØÓ´R&¸! L„ÅuWX.¸Bd%rî×&<&¿twM(& ÐšÀ™LcS\ZCTo§r5jMÝ¹N æg\"8­[’W»˜”O¢ô^ˆ­öZ|ÿ\0E¥Á©µ·Üqy pó4Õoö—xéoßé\'U¯»¹u/’üRãmÑi‡=á\nÚk§ä²ØbaçÄJ\"’wºM	‹…óÜ—9€¯„¿š®Ú¶ìEA]ºgQæ3}aSJYaÊdH±>v\nöèÕŠ¥†;JâlÝÒøùá:w&ØdyÖOS=ôf¿O!š·3™™.Ëb)oZcª´Ûžý€Ù&ÏJ$«TŠNÚ7¡ BBƒÜ¹Ês-Ð(\niLLAÉ¯Mp@ Pr	²€„èYÝù\0Ð¬e®Óß|„§ÌI(¿tJÝnGÃOè´¸0@Ôºßî8Ã·os*ßíÇyøûÐÚgã‹K+‘~Jë­?ô°qÂú™—HÍ_¨/Ï\0±›Íår_»{ƒd¸úÑk¥c[Æ«`“Žlz›[i£ÄêŒ¦f{q_À:A€Ä†õíó‡¬ðc³Ø~®:GÅ\\Bé-à®ÑK–Dé…hg0·TÅxÌk[Tÿ\0¦ä\n@ P(ºiM)®Lw¢Mz6T&%îº€/0u°î-²¤œ”\\‹–å·ðŸù-.\nýM­¾ã‹¡½¼Ííoö‚ ©jÈ”Á³¹cz­ÐóPy‹‚°·`Uý=Æä,dzÆFWql¹;§#Âä§ƒøF(³‰:úÆ–|xÜm«Ù“yË:c	“Í\\®ø´f-^+“éÍ%„³§±—­ÛÓšJŽ@Óµ“ÃUÁç¨2\nmÏ‹N«VVj+½YQ‹1;²Ž¦æ^È¶¥ˆµMo)VwW?é”\nÀ\nÝšåÌƒ“\\šäÙ.bšôƒÑŸdéÓ¬#:|èÈI[£ì¶`¢ç[ø\nÓÇú-.\nýK­¾ã‹ vó8­~ÐV<ìC$ä·3$žA(™5¨£{t1Ú{â*Æ6I2­!Bó¢ZÈç´/¾N›|µ‚Ö87uÌçcã{˜ÿ\0É¢%ÚÈ†Ô¸zPü#/fv~Ìôêf*PÂb$¹­&±ªµ…ë°jñær–oäÝ«umŒdè¨œæŒÅ½ìÑ´™6€ÂÀïÁøa.ìÖÔjbrº~:g|\053#^ÄDíÚ}¦@ wZËäf­Ž“YYõáþÙ@ P(\nÝn\\Ás¦¼¦=5á®tº‰Ò£*tÈÊºˆÈƒýPr.Eás¢|ð-:¢Òà¯Ôºßî8¸Ð8{œV¿h>8÷5—as™ªtøÒâ½rHrjÏÏæîgÉ–¿\'L¼ç³\'œ(r¹*ìc fFürºXçž[I4¨øéÙ¬E-³¿‘ßsŸ#r­ˆFWXj\\\n4\r×t›1…½Ëï¥Š8.%ÐÍ.WÅì¬\"|n¯¡‚Çâì]‡[MUðÅ¬ijjù|T—©Ëz«Z×ÏËi§ŠÖÙÜIèK x‡(Þ]e¦õ^:’fâþÙ[ P+uÌ¹—2AËrƒ“\\¹Óe]T&FTeFD^‹—2æ@®dçP+™oãºÝs-8weµÁO©u¿ÜqwnÞçUŸÚ\nÃCRi¦åc¯ç²\0Òâ\ZÙ¡’¿§¤ÿ\0½{òð³ëé¿/¿|ÒK‰e†V++‹U¼/í–¶ž¬Õ´î\'=\'þFþÛ¦T\"Ý¹Šn[ P+™ ôxBEÎº‹¨¹×2%s®t‹×2[ VëU¿Žšù-®\n}I®>ã‹1íÃÌò³ûAD6;\0³FèZÛœ\\$ŽHÝË\'éi?ï^ðÆéy­P­r¾~hŸ*ág×Ó)u>\n05~«J#ŽÔø\\‹ eQ«4öñmÆ?\\æ“Xì§—Žå½tXAƒÝÃ\\Y¤4F7BŸ_ÿ\0\"¶3M&|žn·[­Öè¹z\\è=®uÎ¹—2ê\"õÌ·(ºÝ@­Öè†šù-®\nõ&¸ûŽ+°êc×UZâwžkP$\rnÓ-QUÀ2m<ì‘ÍÂ,fƒì!ÿ\0M£àm-.aLø‡çÒÞ½á¦µî‚ÇQµ­µ~\';Ž«Z’ág×Ó+z79>O9mŒÂåg~Y)éœ¶.=,úÌÓ:Š­­=*ã|m›#¤Ø~ø|\n(_mŠý¥¨„½\nÅãäuºÀ\rÖë™nƒ–ëuÌ¹—2ç¼®eºæ@ |ð\0­Çˆ[­5ò[\\ú“\\}Ç™·5±ûIQO$..dóÉ3ùäÄõÛ‘¬è…ìèŒÆ3Þb[ûÌb(ÄW#×#Ñc×#×#×#×#×#Ö•þ™nós±s±s±u \\6¹Jq3æøî|w¾;ƒ_Á®1^£c\'¥XUXrÃ ¯’Å]ÅòyÎ¬+P¾7W­Ë¸äp·8.`ƒ‚æjæ™«˜.p¹Âçœ.p¹Âç\\ÁsÌ·[­ÐrÜ-Öè9s Vèºnšù-®	ýI­þãŠ¬åáÞ VgrÓºvÖ µj5N™›MÞ‚œ¸\Z0Ú¨ùlÚ£ŠŸ5ìh«c’\'^É|Œ<Ìim—4#RÐ;	#š>^}ÊÜ­ÊÜ­Ê>¾û\r•ÎhùÌ8ìp»\'\"±Œ®(²Ü>^’£;:Lt0†¸¬W´~GNb­;ˆZ£Î+Êim83Ù7ÀíUÃŠ¸­/_QÒD§#P\0{}Åj–m9Í€4—µ‹+¢5>‘»~8ß#ÚÆX‰õ¤’9¥Ó÷¡¬f~ãmÔmÄ‚Ó%6àBÈöXÞ›øÚ6Æ—=RõÁ?¨õ¿ÜqY¼=Ô\npN ‡ËçpsÏ>7PgóÚŠÔ²˜<¡¹•¨êFnfûO%Î>vNpõçž\Zà×zƒ5Ñ7\'?Zf…uàFxž×uàU2‚œ®|S[ŠC+ßRåšn/‚[ÖYµ‚óg…¦É·eWŠF\Zxè&ÕšÁúŽTOjvg‹Qq,ÆŽ¯¦ëøzøz¯U±[±^«ÕlWªØ­ŠØ­†Å\0VÅlPr¹r¹r¹½rÈ[Ê¹fææ3]ËXÑÏ·­–¼Üò¾Yk.øáŠxå‰é³îÇ²Ñ¼ö ±4òJÊú‹[WÇü>\r=Âæ¿‚Që¸â¿û{¨T?ãWOqN%9998\'#²vÈ„@D°D°D°[°üÛ¯_\rÏ†ër½&åz VþønVþ |A( P(\nšJiAÅ7tÒSIM%4”ÒS¾£Öÿ\0qÅö÷P¨Å®œœœœS“Šr(¢Š(û¢Ø8ì	QèwÉ\rW\nºNÏ$¯ÈÇ¤îŠÙy,ÖÁ¾|¼¿ë\0‚ ‚&¦¦¦¦”ÔÒ˜˜W~¢Öÿ\0qÅoö÷P¨Æ®žœœªÍsÉjFK<c““‘E|OØ8n×ñý,öaç±CYãí¶ËoÔÕX9iß¥b¦SIC‹½‹7E1rÀ§°ýAàAAÔÔÔÔÔÔÒšS\nàŸÔzÓî8¤Î^j	­bœœœœœœœŠ(¢ÿ\0ôÀxAA555555551pIvZJ>ß‰š®¦\'\rf‚Š|„0Ç\rÌ÷6nÿ\0>nsîß6ã‚ø|l7¢½‘À÷ÖºÀ9€ìF3$øÌ€W”Ìa&#Ž2Ïú‰˜Œ„‘É Š£åsÚºnˆølÝ79=°7T´–GG¨÷µ£!kKeÄÏ\\äÜq-1Ð2F÷·á//\rd´=Wœ{[TÅA²1Ž#]ÍË=&Àæ	E¬nècNñ‚qïÜìiµ²²7ËI±r‚pïkÜÙ#ÅK&ËÉaðS\r•‘!‹•Í”µ¸ÙÞÞeC#žÀÊ…óšÌ|Ž\0™q–âš*²JÒæÃ]ó9ážJÈg2};Œ¨Y^wÆÙpX’7HÇR¸ˆ³O%TJb¸Öó@ÆÑS\'¾ÂÄjÅ½Wœœcwòeöræ€%>lÄo-·—dê‡åA sæ›èNG$ÂC›”Ê5”þ>5™õƒÚÊ¦\"	qvþÛQçë`±Ï³&zÝ›¢Ý‹.‰ÁO(h!WˆHîg±½6¼¶A#ÃöŽƒXîgÚÐe©}õ§ŽÌldOc\\ÖÒÆ9LµâmÉ9f8¬0G>ZÍÇ\nòŠí›v>L}°¸¸ÅaÏ§˜šwôZÞfµÂ,l/ŒK,p–¸•â)Áeœ„ù ÌÚ‚yãd¶*DØátrâhsŽ^Äuzg¤\\ÍÛ\rô$t°±ìnÆ­ã¥è™›fÄÎ³e‘½I*Á†˜d‘EÌ½™b‰¶¤asO(§L<lÐCéäå¬Ç¶¥‚RðØ£g]®{£‰“=ÈKOÂîDÊZûh%¼²TÆ\'\'ú~€ÇVè6¢˜;h+Ó-Ó\"åõÛË%¦µí2HÀâš¥VÇRXG2’üÓDÀèelñ—G^Œ2K\'‰³×.a–Ñc˜2\rtÜ‡–YDRN×“³¢˜Ê[êšúLË‡zÀÊ#ÃÞûK÷ëP©5«:‡;k7‘’Ô¹žƒ“÷SIÈÒS¯w;%kCCÌ sé?¤!$þ¤5®al°Ø–@â*=¥¥²IokòSI¬÷1ü¤7á‘2\"÷²1Ÿ×Nñ„½õß;î=Ó9´Ý< :z\"7ÇÑ›£ÂI²ÖžéŸ)‰ûlidn|uä\rþº—™\\NØL¢Ä¯#Ê™dk]5’VÄÁ¼’e¬–¼¿–‚Úø¨¤d/–d®k™~X[4ºôö]Oe_1<QÊú-è¾F<5€¹íÊIRò4s·Œ§F7ºJÌ…ü±Czz¦XážÛ§±¼ÒE1#ië”/Œó¹~BÄñ³š)Ì.ŽA	™‘:@:Î‰ì&{{KÍ#ã˜ì©DúfQË!Ù/s‚fOÍËÐo;¹ ‰Ñn\0ÿ\0ãg‘²k#½@À)a?ÒV`FÉ…bŸËÎ£•Ís^Ý\r«†n§–±öD€	:ÛU|bß•®÷…|““ÁV¡´þbØÚÖQ,Ý«¦¬G;¿¢#\\´·cKjþˆÇ$¦C\'T½â>bîzÖ¥3¤t™zÏ£-Q$måÿ\0I¬‘ò†Å™ž]­åOl;£ê·•íy{6Ôs¹G•…yHW–‰\Z°+YyZÈV¬=¼½uå«//Ytk!uÒ®BèÖ^^²ë®„ËÁî¼½uÐ:\'‡³¥,Âß/ÞB0Àê\"çnTPç‡°DÖ¸&>¨//˜@cÅÎÍ+†;¬\"«ë¿%DYAèô¥lÂVÇmŒ¬úå¶ãÜ“$±ÈÀÓ4\\ü¡­ªyÈs*EÎÞfÒƒÓx¨V<ÂQ^V†ÂÙ@Øàðç&*7mQ·ªÚcRSÎãDñýuPL=2æç1[sLN	éÉÉÁ|v[-†Çóì GÔ“á²Ùl¶[-¿Oe²Ùl¶[-¼ ôæoŽËe²Ùmá·ä ‚zkžq\nƒ¶Ý2F øÊÀçmarÜ­‡ÉTÊãà¹SõõÆ¯­¨ÊÌtñ<—8ô\npX¤kw)Ì	ÌNŒ£Ñ…èÂôa‘td]FUÐ™t%]	——™yy——™yy——yyÓêØsHBÊò—´¼…¥ä,¯!ey+áö—²¼…•ä,¯!ayÈY^BÊòW²¼…•ä,¯!ey+ÈY^BÊò6W‘²¼”Êv\ZðWBUÐ•t%]	WFUÑ•te]WFEÑ‘td]\'®›—L Âƒj©¼‰¦%Qõv<Í–’ÒÌÒIkºšnþó5Í{C›úÜTÑCQf1³&ðsv®ÎF»9ìíUÙêK³ôh1«´8¥ÚBív“\n»Iƒ]¥À®ÒéåÚm8»O¦—iôÊíF™]¨Óµ\Z]vŸK®ÓéeÚ},»O¥×j4ºí>—]¨Òëµ\ZYv£K&pŸLúïÚ},»O¥—j4ºí>˜]§Ó´ú]_áf(C¨öÌ®Ù•šeŒ?´ÚYv›K®Òé…Ú]0»K¦WitÂí&˜Lá›ý¤Ó+´zevM.Ñé¥Ú-4»C¦—h4Úíœ] Ó‹³úmvN.ÏiÕÙÝ:»9§—g4úìÞvk‡°K³8%Ùœ\ZìÆvc»/‡]–Ä.Êâeq(pS»\'ŠSðšƒ$1Ö¨Êu˜ïÖsZö–»)¢tŽDf÷4„€¾ÞÂMY¸9¨A< Ôèð‹S#Â=N»G©—hõ:í§]£Õ´Zv‹S.ÑjuÚL»A©—gõ*ìþ¥]ŸÔ‹³Úùìöyv{8ªð‡%¡Ö$àþaÏ&>Îçgsk³¹ÅÙÜÚìîmvw6»9›]œÍ®Îf×g3k³yµÙ¼ÚìÞmvk6»5›]šÍ®Íf×fók³YµÙ¬ÚìÖmvk6»5›]šÍ.Ìæ—fsK³9¥ÙœÚìÎm^òÅ‡³ÅÙŒâìÆug—f5ìÆ¢]˜ÔK³\Z‰v_Q.ÌjÙ}B»/¨eóë²ÙåÙ\\êìžq	fÐà†ifU^OÌ<Åé–\rìÐá^„¤y…Z4iF\"©öS#ÿ\0Ñ‚géÿ\0ÿÄ\0P\0\0\0!1AQR‘’±\"02@Saq“²Ò BT¡³#r¢ÁÑ3Pb‚”CU`csƒá$t£4ÂÄâÿÚ\0\0	?\0ÿ\0Š\r¡ÃDÎyM·ë&£Âá¡stB¿ˆ5ˆÂõSä©ðÝ	òTønª|•>ªŸ-O†êÇòÔ¸~¬-K‡ê§ËSAÕO–¥ƒªŸ-I‡êGòÔ¸~¤-IU>Z–ª|µ4HþZ–¤-IR?–¥ƒ©ËSAÔŽ¥ƒ©KQ*h:‘ÔÐu#©`ê%IQ*H:‰OQ*X:‘Ô°u¥ƒ©KU*Xº©RÁÔŽ¥ƒ©IR:–¤u,HêX:‘Ô°u#©`êGRÁÔŽ¤ƒ©KR:–¤u,HêX:‰SAÔŽ¥ƒ©KQ*X:‘Ô°u#© êGSaú‘ÔØ~¤u6©K‡êGRáú‘ÔØn¤u6«K†êÇòÔ¸n¬-M…êÇòÔØ^ˆþZ›	ÑËSá:#ùj|\'D-bp}üµˆÁ·ªÉPp8ü,œ*Æ_QóƒåÏ·Zô*‰`wq\nDüé‘iV”PðñC¼;â…@P@P( (\n…@P(¥¢”RŠU¥ZE¤ZE¤ZE¤J*4¨Óó¨Óó¨£üê(ÿ\0:†?Î¡ó¨\"üê¿:D\\Œ e¿nh\"cçz†¹‰ü¿à>zvWÝ“Î8±0W1?—ðþçç§e}Þ?8ôÐüuÌOåç¢xqóÓ²½~qéàøëÑÇü¿¸E5kCÏùéÙ\\PEçšŽ½Ê”ÒšSÑJz)OE)è¥=¦”ÒšSÑJiE)è¥=§¢”ôRžŠSJz)OE)¥=¦”ôRžŠSJz)M)¥4ÕZj\0Ðó¾zvW¡‹Î=4z8ÿ\0•DÑ4MDÑ4MDÑ4MDÑ4MDÑ4MDÑ4MDÑ4MDÑ5Ïþ^ ^–Ôô G‰;ž•è¢óIê\nôQÿ\0*x”{ÈÙGa§‰¼m˜v\n¤‘¯•yÊ3€+1g\nP\'0p\nÚÜ ƒPÈH66BlokTN«&l……³d66öÈT]²‹Úõ€Ÿ«X	úµ€Ÿ«X	úµ€Ÿ«X	úµ€Ÿ«X	úµ€Ÿ«X	Ì®¬È€jÁ7‘ì­‹êVÆÅõE`¥e$€@ÓCc[>~ŠÃIce,7šçÿ\0/¥·²Ÿ¦–þÏª<=;+ÑEç’Ôè£þU+#bEµJ]­k›nü*ü*›¥…Í<·×^]Mê^«AšäÞ¤ÏÁ†\nmÎ77ñRpq1…d~j—±5²S0Ò¢a¤–íl¤±\"K¯…˜xŸºâûbàÏ˜YÖV\\¡£$Ý¸Ô‘–bÌå™n[P4å©R<óJä á\Zìj-¯28EŸ\\<ç˜-¸×çá®òñæ”\ZR=”àûi:5ú‚…ÏNÊôqyÇ¤ƒõz(ÿ\0—xÙXLL}$Ï~˜³ø#‰i²£$YÛšá[]ì€¥Ù½VÒ§á£\n¿´½îÖ×ÄHÁ\'p·ÔŠÙ.2³ÛÇ…ºÚtÖBIA6\'5òû	õÀ²¢ff µ5*ç1$H û€n3H™ÛÉ@à’wÓ)l œ¦àz¯õ>ë‹ì\'ìÙ™ŠÉ¨nM9fÊª.nB®€Võ–FÑ)\"ŸmC‘5‚,IQ%­˜kº½9økÒÊQ@ŠcYM!¡ãM(5u¦SùR\Z(PúÃ½Ï^ÊæÅç’Ôècþ]ð…ü+$.êú9Âœë‚àÓD$‹~>/vHïìÍXÉ@å7&±’-ƒis­Ž€{wÔòe!µ¿³-ÅbÝ¬ù@½¯~AXÆ.·°¹ÔŠÄµ¹ýßÖ¥2\\xw¯ßÄMp8ÚDr¾á¥m]±,–¾HŸ;XqÙV¶æÔ5ˆ2‹ƒøŠÚÀPÈr!\nƒS¥í¼ï©±m\"´…$Ç›œ+<ÊNkHo–â½(ìúè(OÒ+)¨ÛÆ\ZPiÙXT‘5ù\raXÏ0f¥!Æ…Nñíúüõ®d>qÏƒõzÿ\0—‘þ\Z”å0^hŽîq|¡6ñ­B²ª$,ñŸ%ì5Sê5²fÎ±„Œç[n7.>Ñ$Ñ¹Äú4í¨Ø?6ÚøŸA‰ìwlHç›€¨Kpy†·CáÓgG…LþXËYÌ+ŒHâ«%OŽàY\'»ÈÊFŠÀo¥<!:X0pk>“-²ŸðÔòjƒXˆÏ´YØÂ¡jR=¢‡xPïŠŒQ\"Ÿ¤P4§¼+\r/â„vÒªþó\n•?š”Ÿ`þ´ûM\"þ:ÓåöV2kpÑÜg;³QÍŸ)écÞ\"‡Ôç-rCçø?PW¡ùwåxÉÍá¡³\r*}¢`hÞA&e¶D9Y·nÔ’Ìæ8ì[W$ñi@†SfR,Aä\"\0‹ñƒ¸ø˜çc–2¼M!MîrÖ³¦E¹c˜ÔSÙ#iƒ|ª>jÃãKäŒ4…«´?ÒKý)1Aˆ$‚@¤Å{‡¤Å{‡¡‰ î\" Òb½ÃÒbHH§p/›Âp©¶Œ-b.¸v:ûÁ¯§Èä’Y°ïÆnkeÍ&\",ÅàÞ\\¤±5>ÔŠ6\0ad 8ÜmK!\"vv‘¢xÕ´°¶zô«ðýBiéûTT+øiAÇ°Ô‡ññn”ÑŸcŠÀL÷Ý”f¬#Cÿ\0Q•iãü\Zôã¢‹\Z¦‘7óAí¤U?C¹°µÏÔ®M·ç\'¶¤uö€jhÛÛ¥BHå]iX{E»þ™>!\\SÉñ¯ÏZäƒÎ9ð~ ¯Còï<­I°òkfFd\\3Ã3¼‰gÎ5aþmiÕž$‰•¼¡˜\nàæ&_Y˜zÈã4cÉ]r.]mm|Oö²EÄ8®’[Ô*S(¿–ÆÁOªŠ%KÈê¥ŠõRTïut\\¡¡+TòLSŒö³‹ƒsj‘Ï³gV%rySfŠÂá£(Y0„·4o·®…›‚r`èÂÇTe¸\"±F0Á™&—š‘®c[|M#@ZX$D/lÂìÚ\"‰×\r‰= T ©%­jÀí= ¬eÂaÞH¯ûæË[3jàb¸lN– O+®`*ue`\n²¸ ƒÉj$ÿ\0î[à¯J¿‰=ãS8˜˜ØŒ†±¸^æýµOß‰MlèÈÌ•*?Ý7Ä+*Ô‹å5Â·´”íbÉ€A¦ “Va§4šR=¢Ýö¸õëXx®Ö?•,‰û­~ÚÅy,\ZÎ¼Ó~*ûR¹éo¯ÏZä‡Î9ñ|Uè#þ]øÕÒÎJ‘pl+³Œ‘•WNø.Ëœ%Geò J:O%`$e\"à­&I€Ëpmq}ãÄÈ˜‹_÷uµBÌr!‚ØÛÖ\rê;´œç) -k-H‘ÞÈG…uõÐf–KpŒì`zhoÁ1zîyqF@¦EàÞâà‘XQ†ŽF\"ß ¹¾€O–3€d\')}Yt¸ˆHãQ&t\\;{¡\nå\\¶&·Œ.\'°VÏ8Ï£O‚ÙØLÄ¸¬f#Pfa¹°XL?€;G.I¾´0QJb™)€*ëX8ñÇ1“ìü&.W€À`ˆS,±Ås$¯[)0Áµ¿ô½¡‚ŽS4i¢#N¹H5÷–ø+ÒŽÏÎo„× úÜ[=?AªW\ZqR–â»k	†oû`vV/î9øˆú\Z±£üèGeK{Ýµ’EŽ‚ÚnÚ#ësÖ¹!óŽ|_zÿ\0—|1PªXê- ]­þ…á9’ìxÍ«„[ªùJQ¯X‰th7XS&Ú“s¦ƒÄ†¹VÛÁ$RŽ	ZòG{Ã´J’&-´ÔñëzV‘B€\\öMûiJéÁ•\"þ\rë,.6c3¸PäþÒÖ³VÝÄ{ˆëoâHà˜ÛŽÄ[NDS‚$!G%Ímy}Ìu‹iï‡ÄÛ2*åÐskgý?´!ŽÁ‰xDg<Å\"ÖhaŽÐŒ&;iíiÄø¹bMVÂ•+‹ÅÃ„‘¦ÁbölânI´‰36­.fá1O‹	ˆ›‡Æc1Ž,q—¯¼·Á^”vw÷ž?Êß	®O­Å³?þc\\Ÿ\\ÿ\0²~Ê<gëóÒ¹!óŽ|_zûxð×Ò|<7ô*ä(9rÔ¼\Z<p‡}ùAëjÁ	9­	ý³­€fBmœ4­ UR8Cp2\')>%² poë¯AL€×\ZxD‰Ê¨Ô(mRÇ$k-ŽCœä~==u,¡^4:›ÿ\0CGA³˜Æ	’±K\0]¢Ö7,¶{q¥!DÅló6R¹<\"¦ç/øÅG+Ç‡hâÕ¤Øäük`à_žQÂˆ£GÈë†¯£âsrî+¼ÊË!$ÎÃMN¢Õñyzg+û0ì–\rþ*…øR2gPU2p@\\.ðsx?»P¿I,™àé”!¿5Í}M*­ñNr®áà×¥”{Ü·ñ?âøMr­Å³?þoèŸ³ÄsÖ¹aóŽt_zû~5yk+6Ptå¬\Zÿ\0üüTIðià«göø´ÍÁÈ–ÆÇ!ÍcjÙxvšàð¹Of\0+gG†f—9•Ýcu:®´àFÄfèmºôå–÷Q}5ßnJÄÇm…ÊR3fÚVÜ„F[>FBê”ZÛ0É)…‘|\0i ÕàfŽS”²²›j.µ“rNrI5ŒN\r!Ä{6…ÀµmúúVÐ¡¿¥múúVÐªÿ\0Ò±++$ìÌ\0\"Ã/¬SûA¿ÙR/MH½4ëÓN½\"zE0é¢/D}NI>Dn[‹f·å†¢;çêz\'ìñåì®X|ã–ŒW °wùá¬ZŒHÀ:ˆxE±{›xóR³D,át%hJÓK”FŽ!®ÉÔ¸¦qeF±PAÞí®þAI Œ\rK’I7â¾à<G ‹ã4ˆ2‘`ç!`Â÷[ï5\\4Ê\":šŠC­¼“¼qW2±Ø(£’,Q’KµÅÀ<”!Í4èb|ê@ÐÑŒJølÀÈr¨.I5>vw™Â9l@,55¸Ã9¶–š&’(Ü–™‚Üy#÷i a) pnZÄ\0H7–Š	e2….lºmkhììAšùrË•I\ZYIòo\\KƒíjBÖ~/eaß¢°ïÑXg¬3Öëõ‡z‚Nš†NšŠNµ#õ«pòÜ••žÁ,	$ï­­£•\Zßþ‚§þ1ý*c×1ëŠ˜u…b°ã÷Ù~ZÄÂ6šÄÌóÝD\\A~+[-m,~ëÃòV2¼_-c\"÷‘ÿ\0JÆGïcþ•ŽO}ô­ ¾ú?–¶šûøþZÚ‹—!Íûxþ^ñEV¢(Šç-rÃç°üb¾îƒ¾Öu½¯¾§N¢Ó†| \\h<_ ‹ã5•_¥òžCMšGÂÊXÿ\0“p¥€†—82G™•·¾Ð)ðâU’gEÇ=ƒü5½\'ÚMbqm>Ìdn\rÊ&_„ù`ÂJŽe\\¤–lÔ®ØgÙòÃ(EÌÖ™2Tø¬DC‰‰QÐ‡3’–ä½qA0ü…c\'‡ÁâaK¡àHœ’EÀ;ë„&6bÙÓ/”ª-ü5Ÿ‚ŒÏŸ(Ìlù–¯*as’L,fVkfmm«VæÅÈÝ`MzQÙã8’O€ýn1CvË—ôWÄzø|G%s¡óŽXPWÝÓ°wïÁek›‘cm•´å:€	-¼ˆ\rI­«Šdk~Ó‚ÊWq&Õ4’x.eg7ÍàéÅ§Š12*¿™ôSqj|\'¸ø\\’ÆÈÖ€f ýjÏÖ«]ÅŽ\nŒ]J1jò(Ç•*Ý.l(ÃÔ£xÕ•|\r,ûèÃÔ£RŒ9ö¼w:›ÓAî¨Ç•²åLº‘jô£³¾§Äó$øOÖã`+ýÓ7À£¼>· “á®O¯ÏNÊçCç°þ ¯»§`ï±\\×Ôz…ëéŽƒ($À$ë`	¹¦g²©ÔksÅ¥i}×Òzi\Z÷±;è‹k¯š\Za~öîZ=ó(Rª#hîrœÚ’ñjÚXËÛŽ!—Éåº\ZøïJ¿ŒôR|\'ës…º¦øÄqaäøkš>¿=+œÉýA_wNÁßãÌ:EBK¦\ZÁÌ‹¤Ù2±;—xµ:¬ªøq;\0ª÷Ð³vš(Ú#\0-\"ÙeßqË\rÍËn½&ÉÌ6Á2­øT_+þŽžVêhÚWXÕ†ma\'+X½a0àF€C\Z-‘N€¹¾¹ˆ‡ŽïF¡‚ÀœÜfßg¼€I³‚M¿¥\".@@Ê-{›ëßÏdE#+eÞk	=éI:KÝC±Þ ‘pEGŽÏ6\Z)\ZØ§Þê\rGÿ\0Vô1	vkâ<¥Îq&ZØxöV\0©ºƒXVº¹;ùYIŒˆÏƒ†Irâg‘ÆäQ_úÖ½²Í4äD3sÈ&Ô¸Ó†ÇáqÒÍ|I&ðÉcI´?Õ=&Ðÿ\0Tô¸ž¤˜³IGŒ÷Æ–`òâ<™ôzô£³Æqa¦?Ãõÿ\0ÝrþšT.}ŠMG—÷ˆ^ÚÅáSÛ \'ò½cC~â1¡ˆ`U¬?¿\'ô¨!_òæí©\0S‡ª™kš;çês—²¹ðùÇü¯Ô÷tìYFë~”£u¿OèS¶¢àcƒ>Áp®l–±FÖ•DŸEa¿6èN—$’+…ú7Ðp¶Él™²ŒÜ-a$Æá„’Zx#WSp ±ÔZ°ü­°$/`ù	–±&%–U²„Š§I(‡*°oe!8³â2Êº.bOîÖ	ô˜Ê}F\0Ëìe¬âa±6óï¶X²Ö#0‡9‰Çí2æEpBi˜R¹y\rañ1\"á#Œ«¹hÚ`îYâ\'R¤ZÄÔFL˜¹ÎNpáÞâ•c“	Ž nÙØ[q½€¯½¿Á^”vxB…FÇØ+	)ÿ\0ÙÏoêrè+\nñY-ÅjÇ`ÓþècÐ·­ îDÍÛj8¹¨\"ÌšÙÌÞ¹&=Š`ð‰§\Zø5vLŒâ<\ZV.fÿ\09­}º÷ÈÒNŸ½	Ø-PXI©bnEÔ× úüå®|>qÿ\0\'õ}Ý;~2FsŽŠän\rþZ!rP1ÔtÙã3ÙÑBå[î4qJá³Ëˆ·M.ÂÕÒ/\Z(Í æ(Ôÿ\0OIŠG³žÅ•³3V;4XìTÆM2ñQ–åHò9ECy0¸8¢“$\"\rêÕÙ˜¨P±¼ƒKl×‚Ïyòd·V“j¥¤ÚŸéhâs«ÌNXs<…Å_¸£>x§gn<‚Åm^•~\Zã¡B™GãS%9>ÁHÆ¢é5”Q§+X™oÊŠÇNG#9Šô\"sÊc[þV¬:Ÿc¡*þ!…LGµMb >¬öí§G²äD*AÙE¨\'åB*“YWØ*g¢OxW€× ú‡¿ÎZçÃçþ¨¯»§`ï¨#]²¥‰uni;[r‚&æ°¥ƒª²øïV×B+\nO„MÀÎI·ƒz¶hÝ‘¬n.¦ÆÇÄp~\0RÅÛ ³¢°²D\r¬XhoºÞ=¯(ßì¢€z–¦aìÒ¤cø÷xÑú‡êø4ƒüÆ¤ÏûÊ\rC–Çò¬9ºßÖŒ‹í\0ÔËþ`Ec\nÁL	.Ùtò\r	toQT/õ¹Ë\\ø|ãþOêŠû²vú;|˜éÄa1@0¶nî)eˆ˜À!F·ô5ˆ”‚nFs¿–±‘$2\rNläZäÑ$“rOñ\r`¡Yü+n7¦Y³ÞG»”($žA ¡XÑ™¼=@ZÃÎ ‹7…†ÿ\0â“-a°@ò)¡á ËÃº¹hâÍ¸;Qa¬ŸY€ÑEÍ74jéyllÔ0¾ú„æGtË%Å“}é#fceUk’y\0 PÃx½D ò¥$bââíkÖK3Xekê+ÒÏ¬jô;Ì|x½F¥…bZòSKÓfõO×ç-zH{[Î?äþ¨¯»\'`ïžÂkjBTqÀš/ôqrÍ¡°V/Š±®VXï™†„ÕÄ©d“2¢f!“@5-9xƒž\rÈ±eâ$Âª’‡q\0ÞÕˆÚ’p1â¥à„Q¦æòÎžMbN.6Ø²âÙBë\"‘XüZIÀÇœ€<œ¢Ö&¶¯ì¡.Ò<A%²äZÆG4XÖbßTåÏPag;Cr%Œ™[÷_ì¨¥‘LXW\03ÞöN*d¼pB†69K~Ï9+H£GÆUsf#« ã¨‹KX”t]lA–…ƒ‰@º¸æõXØÒ\"£XøíHü‘âQX¨°ÓHïcë½Dìè2…cke)µnÊôŸË¾hŸ0=óÞjoÏZôö·œÉýQ_vNÁßŒ;G{)6âÕ³¡÷Q,d¢®U$ÅÇ˜¤17µ®ö4prÅA\"Í¬‹¨W±—ÔjEi[fÉÑBŠ\r\"*/8„\ZÔvUkÚÇ<ªupš ¬/‰6²K{³\rÄ\n…I“;DV<™’¦€88´ÃUµb&Ì-fá\Zúh5½Nc	‹&MæúS]\\0w$\\©6:qXÃG\n£ìž28«eï#Dn‡ˆmcä–èÄ9_ÛzÈ*CÃ½Øq‚µÏþ^`{Ãêš>/ž½•é!ío8ä‡õE}Ù;aä—ƒBï‘IÊª.I¥!]s!ç/(«ð<\"ð–ß–úî¢L!à‰½òþ>3²ªC@I%%`ãmšÆB6ìÄ/XÁ\\¯‡s¨BA\ZÖ—ÂaÎœ¼¤EÇÍ\0ñr\0É`UxÞ›#â®Í‰Äc6M	ñ\rÚiPM$“}4¡F°Ä´¦ñjH^)6F.w–	L\ZHì¤ïj‰ï2Äš;‹³ézXARDå18ƒˆ ØT9sÃ5Ã×o©0Ç	Z# Ïw|ì×$jH°º…É.tEÊ¦ÙrXëbµ\Zòâñ*ÉdlHõbrÖ1`|3>x\0¨XX2¸RNSº˜çIšë{ª‚4\\ÿ\0åãÏÕ4|w9kÒÃÚÞqÉê-}Õ;AÂ3N¯åXd*QÐŽR†ŒGhTŒ¹‡3\084.¬MÆî*yxS\r¿ÀËkä¶ûúêv1g	}tÔk	1Ck0CÇPH\n!v¥lª.NµƒŸ7!…å¾ê…ÈuF[n]Nœµ	þÑ£*Hb\nF”ŒŒ7«¤{Aú¼qGñ\Z€FÃ<ï<±	póf9•Øo.dQPÉÇŒ|<¼P½Ê#zÀ§Ž8<*‰$l«s\0P0dHáÏà!Ž\rÎKs©žydUEŽ  …#ŒX\"g¹	K&fÂ©qÇH²(ÑnÞQ5&›W\0f0>dtÊš°å EEÃ\0\"ö\n:Ô^gRÒÉ†xQ9Hï&‚Ãq¬KÏÂâ4’‰Ü\\/‚[ÕD4£ûBšŒ”Ù^û\"H\0Ïå«.{ž­£Ó•¨ðn”ðš ëaÊx©eÒÙÚú®òþãç§ezH{[Î9±~¢×ÝS°wØ\0	¹>ÊÇ¯Ò>‰“-³åµ¯SY¸¹—]„V5ÉÈö@Ó.ƒuLIA(¹×7Ab×ÞM…cå³Ü°¾„“rkñ„@ƒ-‡‚»åµb]\\Èd,7ç *rÒHÙŽò~®æ%áYW.¾ºÙOÚG[*d2Äé˜È„ÂÕ²DX|*EÁ¨1±Ï\ZdÌKVÉÚ“¹Þ¸y¡Œ7­ÙŽjî2S:BgŽ\n€äÌîä—®å¾™W+‡Åb (	ãZ¶11„t\n1}½õÜD˜†A\'‡¶p,XÕÜv.4wRPcpÈ…7•ðZ¶\0Áæ‡˜xRX›0[Õ+dKÂº”‘Ä©á\'%lII”\0¿¶M+a4˜)£6.¸CmÌk¹¬Íÿ\0Í‚°#Ò•†ÓG%Ø-Ï‘\\ÿ\0åæ\'Ì¹éÙ^–×óŽd_¨+î©Ø)Uœ 1«k§Û`§F`7\nTPs¢ªÉÆôâ¥$’\0RI¤ÊêlËplèÓ·êÿ\0¸ßõ×êúbVq3âDÏO)†¡ƒG–V]wî«\\Sa§Â†g0J£5³·–kNTýl¤\rÇ;Wu\\T³M\n¾Éh\"Y$á$ÈV2šç¯¾ÍúuÏþ_Ü|ôì¯KkùÇ£õ¾ê‚€=ìÜ*°dÊ.n5¬­Íò¤ET{\0ÝHÈwÙ…‹ôiÛÞØØÌ`–$u&TŽ<àøhEÁ(ÜGx­‚˜!¸9xA$˜\\Fä@â=ï÷þºÖ2ÆdÁ8u\'@54êø«ð!°ó)9MŽõ¬DŒó‡1g‰ãÎÅsqcXÍd°J5ä&S[[8±¯CìJ¤0;¶†`“EÂyiáhÈÕË\nÊÒ±•³Ë4Ï¡–B8í Šç8Y‚fÝríX,»FÁñ±Ãg}wÝµ¯¾ÍúUÏþ_Ü|ôì¯KkùÇ¢õV¾ê½‚¥Æ¹xI¶ÁGâI©DˆË™fRHÜw+•¾\ZË†‘Ï‚×,·Ô5íLßþ*³9\0œ‹›KšÆÀduVÊ!sîßCÄkhA«eUÐ±\"ÁŽýÜ•2K–Þ\Zy\'Ùâ=\Zv÷“ÂÁWÉaI8xñF2&Al¤w¿ÜoúëQ0mUw\0^D	m\"Cô$Æ,‰&%±.DÉ‘rjb±bRYß|ÊŠLEÐeÑk©²ñ8™È1³°9é¡ÍEÀ)Žò	C¹*LO¾z“ïÞ±ÛB(×ÉHñr¢`S[Sj­›æ¬V.oÚµ„Ó¼ÀiÄ›W?ùqóÓ²½,¯ç†?ÕZûªü\"ˆÕ\n0 2²¶õ`wŠ œ¡@\0\0ªºP7Q†`Mƒœªtã4ˆíª[è¨P7‚Ñ“\"ÛÛQ­Dz´Õ4Ði Ò7A¤~©¤~©¤n©¤~©¯ñ§•§:õ…:õ…:ôŠž.ºÖ.OýÆrêøu­«ƒ÷é[WïÒ¶®ß§õ­­‚÷éýkS˜¤Šmp•4}qMÈû‡\n‹ù±„E+<RÔcSG×èßµmÌµÞ\"ˆ¢(Š\"ˆ¢(Š#¼EG¼|Ïž•é`í8ô1þª×ÝW°V+ƒfwœ\nÞÖ\\ ÜÖ:SK‡g„ +o\n¦x°¸\\(–rƒ3µÛ*¢¦f&Ž%HÓ‡ÄägQ.‰\":XH±¾‚àŽ!{\\ÔlY\r›]Æ¢|Ì	QÆ@¨ØÝsHN€‹¥e¾ëÑ4MDÑ=áG*¨¹k_y\n;hj¹ÔéÉ¥IHª»l\"XÖ&<D%¬AˆÄêo`rµî*(Ç¬aë5…Ä«˜s¦-Õx6¾\\»Åê¸ˆTØ˜1Xœ$S4Ã\0\\\\Ù\Z±ÒâF0K›:\"Û‚·2±0a°øxN#4¤€°«6°:’Õµ`Å`åa1ŸG,SÀi)~¢€ó˜Ë•:€=BçŒñ\ræ…˜¸K,Iµ`R(¼1*µïJY˜è.VÊš^žì€Ý•¹‡×mOy¯û8ÉPæÙµÎI28Ž6«µÎƒî±ïmµGÄ`WÁpä¥¬Mè[0¤×¥ƒµüãÐÇú‹@’p©`?tT’A$ÑpRž6dßbQM\n2EÁø\0–Ô\n&†l?‰ÃÈH!7µÆªÀ‹ƒX/¢aÞE’lò™¥•“ÉÌæÖU¾€V ôî°¶•6¬nÆãSXŸ\\^Æ§\Z°$Ü_CzÄ‹úŠ•Pu¸¹\'y5*tÔ©Ö*u…LaS\'XTÉÖ2u…M«fW³)±X„g`Ä’Âäš|¥—+‚¡•—‘®8fà£@Š[”÷¶h—±ÄÂF@B‹Ê8Å_vúîv	ÎsLÁJÇö÷o¬\0ÃGd9Ë³ðÄzÁa±IˆÃ6x1*Æ7˜?Ù ƒu®çbÀE(Mš9ÚEÐ—°;àÐ4\r@Ð4x\Z h\Zïƒ@Ð4\rJiM)¥k\\kkÆƒæ½ók{ï½b±2#J»	$G]Ì¢•ÝÛÊb»ê\\CD#àÂ¶ -óZ …plûÚÖÎrŽ×$ t¾þ/ò­’Î©  ð‡6ªÁÊŠÆùrî­£´\n\0\Zý•Q`Šmpµ\' \"Üué`í8ô	ú‹^…>FÞ~–×ó@Ÿ¨µèSáÄ+ká–\\DAâ‰Ð‚×µHØ]Z<<H¼,ÓÊ7dQ½*há—\0x‡íÝ3èÂ±*«•0å$µ¬7þ?Ü>’×ó@Ÿ¯BŸúƒL¤kØÒåRtuÉOŠyð/‰>P+6\n@ÁO­ý•;ÃÔ2ap¯àCh]Ê0ðÛžMb1ŸEšlÊrö qûE4‡\rœð%ü²¿âþàãx|ãÐ/Æ+Ð§Ãÿ\0\0K\nßÎ0±b§ÅBÈÑIä$m¦f¬dáYT`+?Hþ•ŒŸ¬+(ö½¯XÆ,û”É¯°òT’}ÿ\0ŽáX³Ž3-ÝZãð$\nÚrêl\0 ’}BÕµuï}7^Û·Ö2|¹­©@n}GZÚr,€_++iÉ™·\0Fƒ”ú«i9ËÅÆß¹¦µ‰œ*o-•{kiHMŠµ­¦Ù¾Ñ¸²ûk-Á™øÅcYô½‘Ñ³N?Um7ÐØƒ`EmKÝ…­qökå‰ ©*¹@¹\'Mk-¼åØßšûqÖÐ‘.78ÊG´XùŠ\'Aáû+h“à“™™cQn+·¬c…½ˆ…‡¬¨­¤ù-|ÖÒÕ•C0\r‡8Ú¶€°Ë«º%ïÈ\'m\rˆÌŽ’(·ËÅXù(ÌO°XÙW7•u¶±3CàÖ9Ð¿“|¦ý´³*€	&±òGkXºZ÷ä¸­¡wô’\"ÛÛ[Dg]AJ°åSÇ[@–c¸ å5Œ•²_tw¿Fëúë\Z[YÞ5>ÛrV8«¡ð…½m•b\0²ûkhdõ0‹[ÞÅsÇ˜{Ec÷ \\Xû…ì\0\"ü•Œkå\'.Q{ƒl¾Ó¾±C/©šÇŒ¤^ä\nÇ\\m\0»{+fË¼ßŒ\\n¬R…+šêQì.RmXô×½…mÈ)˜\0Ï«vúÚ0oõV6 [“+[ÛnZÆ µ‹Q}Â±‘tµcb¹Ý`>Í+Rl\0P\Z¥$ƒb<E‡µ±\nÞ\n-bÝ­bb÷B±Q©å-Å@ˆ“bK¾:ú—Iæöi[Á†.{ÿ\0AÇR–VÌíÊ{çÛYJ‘pOÙ¡	Ì¶ ’–úÃ fûW¿åQ«5î‚ Ìok‚ny\0QzÁGž\"H3íAµa£e#B$¬B!G“6QËžúÞž)Ôhû2ã–ÄÜT\n$CpC¶„zÅ$[‰È®W5ùÚëkS.[G…×›`töÖ5…w˜,Y‡µ­P!å\"KÜûC£Nf}.2ßxÔqV0#CÂoüë¢F,&Ù\0Üscš¢FVÑEÔtu¨#Ï¾¥¬\r$rL‘…òÈd“©¦\\4dœòåám§4š‘³É“.KzØØßÕXuþ¡=†£ˆG&líš×å¬ Ôhsÿ\0æ¥Q +–3Ëß}ˆ6}{ê4rN‡0_ÃCXxKÊÅ®JëöOa {º¡*°L¨ƒŠÁÅúoS£­ˆòDaúÆô©|Öbuÿ\0)¬…·–bnxÉ\'SI$\\àöšÇ\"ŽûQ	Ì\Z×Ë–üº^„$î¹’×?¨`±pÍœ{Xßzú©!N ±^ÓRÄ¨HAQo©úÛ’¥”±¶r\0<‡Ôj,;Ýl3Æ¢€››¸R“Î ÜÓÀ§•Zú~5ŒBU¸ 3B/¥.às·Ô0¬Þ\'Ó7ï\rÁ©#N¡˜©üÍL¡ô)•Cg$Ø‚n-aL³)¶\\à¿M$y%ê$\0ý«µ…Àä\rOá²·eðX#Íaº \n»ïsk\Z‚6T[!»\\J£ˆø[°š•ãF62-›);‰îå¥ŠVV·,ÊBëêõñŠÂÀÍ¿p¸±½a¡VaqqËÉ\\@ßöŒ	\nm§IÒ¡tµîE:±ì{öÖŸÃØY9ê?ÙŸ5$Q-Ù«ÁA¤1súž>ÿ\0áYNS¨77è£† \rkö­&7-®uäËXPr‚œºòVj,tºµ†*Fâ‚=†Ë{²Ÿ·-É¨Q¼T1:.sPÅ‘¼”ˆæ Þ°Ä#žö¬d2HÂˆÚÿ\0»}Õ\0k}¬Ùtö\nFa•ŽkÜoû@Ô!ØYX‡Ëäè…©–í®`dÕ¦ºÑIV×b«“ðð¬k\nûÐKÎ\nÈ|›6ñ¢éøVÆÚö¬DEŠÜ‚tÿ\0	å¬.cÊ.œ–†KÈ–Ìm{ØfÛ·ŠÃãÊ³ÚEÚ$;)£s	QM­ûÆÕ…Ê+šT³ F>«kq-aíbk‡ä,2Ixìleª¢Ï©±òi\0Y2™ûò®¤R‡0Ç’5½¬—-m-}M:áâ-á»)(å \\ôV%!P±pl\Z@Ûõ:.ZÂYê\Z†4W€Äö;â;Ö°À©ÜsšÅ‹p‘ð$ä\0ø>6lÃ¢¤úRS”ÄUˆÕ-}mËGƒ2…Î¡„æ[û\r(y^Ú–7j„-·‹ƒ~“LáÉ9Ô”ÒÞÃÑXxÀ—ÿ\04âEHÄi{›\"hz…E\rÇÕÒh>S½—%ÿ\03º—:ßBö\'ò4ˆ­˜öa¥Œ’l@¹¤Uì,oÒjR“¬ ,@¯„§{{B½?ù«2f\Zf;Çô¤—xÌA±ÔîÕ\"²ÀØ[¢•ãH4‹ÓQa—Mål4¥ÀtiÉÉM\0ãÌ;ê=á¾‰VR\n°6 A™F:\03Ü*óÇ™›¼Óÿ\0ì s–ßí_ŸòýE¿ V\ZÄ¨66·¬sX}ÞÝtýêÏÐ?­&‡{)q~u+ô-a×pHâãß¼Ò7BÒ ÒËmM.ƒÉ\"Æ°lUÖÁ11gA®ð—ZØ{)¡^0ÀL·7º±scJsŠÀ~T5½‚ô®²Ú°êÚÞìŠO²÷ÝQÐ\"ªŠQøV½(+ö®l\nÿ\0¼?¥|iWë¥ë¥ë¥ë¥ë¥;uÒ¤nºT‡®•#u’œõ’¤=t§=t¦þ5£ükDõÖ‹uÒ¯×JSï“ÿ\0±iP/Ú¼€šà®\rØn«õ’°ø}-¦Hí§-fë%ËöloJ2Üå+kþ Ô@ß•IÃX4{©\0\0)6´ßýu¬)GÍ{™.¶êPÞªÂ—r„I”#s´ò½†°ìuðÀ°ã…x*_Q`nj˜ðÕª\"ÉœIðT$ƒí[[Ô]öË­A Ý»NJ‹Kù@jŠÛÊ*)YxÀ`	¬> Ž;8¬.%ÁSäºx‰½ô¨J Q \nßßÇ4M™vQ¡–d²â!¾ªÿ\0)ó)5ÝŠ~ŸÍýçËqæ,iAÞ(÷{^)#;¤N54÷ŽQ¯9HÞ§0ÄF˜ÜJ1\"î/X”%‰%‹‚I<f±1uÅbaëŠž?Á…0é¢;â–––Ò\ZCHi\rFj3QšŒÔf¢5Tf’’’’’’’’’“²—ó½”¿˜¥üÅ/e--%%%%%%%%-.–±¨Í!¨Í!¤4†Ò\ZCHiiihwÈ¢:i×¦¤^šÄD=¬c ëŠÆÁ×Œ‡®+ÁJ@\ZúÅ‚Çí(0¢,#&i|:î·eõ\Z»°ÙCóWv[3¨~jîÏfû³óWv›;ÝŸš»µÙþèüÕÝ®Ýþ«»lº®íðê»·Àûªîßî«»Œº®îp^è|ÕÝÖÝš»ºÂ{ªîëî…wu…÷B»ºÂû¡]Ýá}Ð®îðÞèWwxot+»¼/»ZîóîÖ»¼Âû±]Ýá}Ð®ï0¾èWwx_tµÝæÝ\nîïî…w{†÷KóWw˜_tµÝæÝ\nîï\rî—æ®îð¾èWwx_t+»Ì/º_š»°Àâ$ÏªI’—”kol¿õ1ÖÞÙêc®è6Z!aÆ\"6*µÝæÝ/Í]Þa½ÒüÕÝæÝ-ww†÷K]Ýá½ÒüÕÝÖÝ/Í]Ýá}ÒüÕÝîÿ\0ÚOš»ºÂûµ®îðÞík»¬7»_š»ºÃ{µ®î°Þí~jîï\rî×æ®îðÞí~jîë\rî×æ®îpÞí>jîë\rîÓæ®îpþí>jîç\rî×æ®îpÞí~jîç\rî×æ®î0Þí~jîç\rî×æ®î0Þí~jîßîÓæ®î0Þí~jîß\rî×æ®íð¾í~jîÛî—æ®íp¾í~zî×î‡Í]Úa}ÚüõÝ¦Ý¯Ï]Úa}ÒüõÝ¦Ý¯Ï]ÕA‰˜yÅvn©4¹JÂ€ŽBPAÞ½lhs¶öŽñ7JSí	Ü>’îµÝ4ÞÉc5· oz+káúe­­Lµµ é–¶”2VÑ‡¦JÚôÉ[B™+hCÿ\0ÙXøŽ±ðcáþ:ÇÁüu´!þ:Úÿ\0cáþ:ÇÃüuøë\rS¬ÉÌñþ`V1x–îÕ´¡«h\'CVÐN†­ \r[A:\Z¶‚t5mèjÚ	ÐÕ´¡«h\'CVÑN†­¢\r[E:¶Št5mèjÚ)ÐÕ´S¡«h§CVÒN‡­¤\r[I:\Z¶’t5m$èzÚIÐõ´“¡ëi\'CÖÒN‡­¤[I:±›6’ç’À~í«i§CÖÓN‡­¦[N>‡­©CÖÔ‡¡ëjÃÐõµaê½mhz²VÖ‡«%mxz²V×‡«%mˆz²VÚ‡©%m¸z’VÜ‡©%mèz’Wtõ%®è¡êK]Ò¿ý¸üL+im)Ïïˆ«dðç–y^_Éa!‚1¹c@ƒòÿ\0‰¿ÿÄ\0C\0\0\0\0\0\0!1AQR0a± \"2q‘#$3BPS²4Tr’ÁÑ5@bds¡áâÿÚ\0?\0õ®¯þîêþ‹««÷Ð1Ži¸¾hC(Z˜ùÅÈ¦.@µ1r©‹-L\\j\"äQ Zˆyìñr¨‡-D<j!ä³ÃÈg‡.Ï ]žË³Aùavh?,.Í ]š@»4<vx¹ìñr¨‹-D\\j\"äQ Zˆ¹ÔEÈ¦.@¦‰Ä5ðªoqßHîn²X|Vè\0¬°¬+Â‹j-Võª>ÅÝï\n¥÷ñôYY[¹ ‚ÂÓ¹†âµN–Â°#\Z1¢Å…aVôYª>ÅÝ<Ðï\nÃ`™âí‰îCI³TþD¿ÈWf©ýÞ_ä+²Ôþï/òÙjw—ù\n1ÈÒAÀÄ&Ã+Í›Üx’OPÀ\\è$\0m%¤Gû;:ù AÃºËQÁËRþU«ZS©Ê|$nE¤\"dB©Bîžhw…1ÈÆó8š–›sâC€ ¿ÖÑd\n\nReÃ›¿ZÖÇÎ¶1µà A\0ƒèÒ¶Ôü[úÐ×ínÏ=K¼Úª;Wù]n¼ºø[`w‹ØïGÂ]K>kRñ¹Ü7Ðš€hºÀÕ«	Ð0©¨oî©!s	,(…U¶Ð?§šáAR´:ªò4|ÊÒQ´RÊ-(Þûƒëhq}µoõ‡þEžbƒMÇ´}SY3àkÜ%>\Z´Û0Ñ>œ:?,ƒ»$*ª¥¶)ä-Þ‰h˜^êH¶ÿ\02„.ÞÔ oÙšWeo\0…3x•¨¶ô#!«ˆq\nþ	Ì\'a!K\rU‰/Íc¿Ì)X/’ÀŠ­ýý<ÐïB¤\0ÕSƒ°ÊÏ5¥\Z{.Œ´‰€Þã?ëSi)à§da±¶öÄ8›ñCMÔF.\r~ýÕ6•®šxâ\" ë\\4Ÿêƒå.sETEÍÚ5ý.Õ#Y|íÌk²…Ä{^ ­-§«4}uE0Š	AÂâ\\Ó´´\r—UÚr®¹±²Zv7ð†\\Õ5Mädx,	â´3­£àëæS^®¬)Ì›îÈ:‹¬ubBß¢ 4„^äøž[ ÛèAó²3µ²—ý7U.cÞâ×l§šýZ™ #Ø’ÿ\0tfxàWj¶Ö|Š5pA$e¼\'8¢äHU¿`þžhw… &7´´ÙCÚðLoh±ÌƒoZ¥î1¹\0÷S6Ãc®´dÅ• µÄ‡lÞ…Ö2š`ë¸æàGµ·\"äÈµ±@çSÍö-í³Ä­7+FŸ™ÒËÆÑbFY¾“[‹zÌ6ÄŸ#]{´IúŒ=|Ó}B>•ßÀß2Š*¨e!ÿ\0§•>(ÎÖ4ôE€{¥ÃàHNt£d®ëbŒ³\\fÓÑ9ÉÎDª³õwôóï‚¤6«§<%gšÒ…ýŒ‡É#¯+HÅšG¬øD†3q–ÐJ1Œ6cÃC~ïG«0=Ä;yQ¢”¸Ojä<]×â›,N†VÀß¡h³ˆ6Ëâ3_â7é‰ßDŒ-01‡­?ää*²öˆ‰ˆ´sÃe¢ˆìPçÇÍFáÅôŸ´wð·Ì£è«÷_ÿ\0fOèœÓÓ¶§m(ú*ÿ\0gO4;Â‚§G<2:ökÚão«k©æ§|l2éqû@\0­¤YHý5;j^ZÌ\rÌqÀøkª¯\rðë¯¶Êö¨‰G%A”‡4áÏkmeŠ@„e„nU`v—_€UÁ…‘‡dÊÛü,TL…µpjÈÚocqî­HÉibqq¿šn‹ÈhèyÜ†‹èQEÌä)#yË³7X}£“B1÷ÝóEŸòwÍT4[	Õ<æ/°…©‡É9‰ãÁ¿$çû¬ù\'QUGêïéçßÐ I>ãÇÅ¤zÒÐÑÌòù)ã{ŽÒZ	PÓA\0\"˜ÀMÎk¦¹ÍpsIl+µÔþsþhK(Øòí»2ŸOs\ZGi cƒ›D¨Ã×ÍÓê}óð¢ª1kßÃ³?õ5’yON\"á;$ìÑ\n¬}úy÷Á4ÙÀð(–á 4‹›íõ¤2žŽ\0[gˆZ:Ï,‘ºv¶Ùây°È)Ü[È66R¸Æ\0H]Âê#4“HgM†[M¯èÑìcå“€Œ\nx‚JYäm8e­„Û2´Eû=|ÓZSZ¬¬®ðµðëž5ØÝá\Zv\\ü\ZO’.yÙÏÈyªCînË^	-Ÿ‹V¢cµí	þÈÓò» \Z6ÏwSý`;u#,îS‘(‹ªÁjwôóC½cuÓC˜|Dci..=gÓF÷ÝG#6ù§´=¥§aF’\"nKÏTÉæŒÉà}O$.e®E³R×ÔK˜ì6;lˆ–&ÐÃˆ›€|Ê1îiB pZöñZæ,l?t/£;š…·+ø•,\ZÇ\\ºÇ›³˜ƒýg\n°\Z‹€Ûu<Ñ6N±¹1Ûü 5Äç‰VÓ¿§šèSHc†W|,&ß\0©t¤õu8%co‚øƒ¯îåëG\r/el/ÆA \rö*\n‰ª˜ÖßT#ßlÜŒH[l>5Lyx{àA	ÕúC°ÆÒ.lpÉµ•†8Ý…¹kÀâ#Š5µ7È—þÔ55O™­s[†ùåšÑïµ,}|Ð™kŠÖx¦¹1Å>’ž\Z=ç){+]vÄÒîg©$.7%‰Ugêïéçßö5ís. …\r,ÇA®µ¯sëRQÍ5 Gcˆ5Îqœè¤Ñó¾å ÌÆŸdßÝOqq&Êðð[¸æª´L0ÏÚA¥îp%­cŽYævdª([G ¦–vœØnoýQŠ—3Ú¬<<TL`™…²ÙÞÑ·‚£?W¯šƒrk“_e	·‰N¨>¬©\'s·§Q%+•T~®þž}ýc«iD–-30:û¸½Ô\"sC¥T\rcÛ¤‹iÎ¬0˜wa°µTóè˜#t²1í{ÍÛÜ6žiZq3é[•ÍdVsŒoÛòFš8ŠHf }âÒÖªÙê#Ä,!€Y¸mÔæ†¥§š¶±¸å–W9æ<Vœìi4lÊhdÅ„4µ£rãÁM¢ë`0?s…¶|U=<¬•® €!úuó@ å‰,E5èJµ¡:oùJ/(9¢ïMIúôC½‚Ç72Â:zÚý6‹ÿ\0QM«…ÒêÃ†+‘ï7Ê÷Zsý6_âgšÖÇÎßšÖGkãoÍha)ÑnÕí×;ô…§„‚*-fÛÉ·¢¬’ÈDMv`ÜnÈ*Sô@ UÐ+\ZÆµˆ½z.X•ÕÑ*ê£ìÑô*SjªsÂVy­\'!4’#ÝymØE‡ým\nà4t9¯ýE3FÑ2§´ìxË½ì®Vœp::\\Ç¼Ï4Úv4’	ÌÝvvq#gþ-ý•uELsÇ,A³\\@Fzç7–bû’¤–wTÄ#È¹¸$ðTÄZ±+â±+â±Ž+â±Ž+X8¢ñÅcV1ÅbV!Åbâ±*r5NéßF^µ‚°à¬+©Æ=h!kß®ÀTÑ>RËLøÀ¹% xm{\ZZé1ÙÎö¶!|¾í\n‡ÃÇxOàwÎÝÙ+ànÚšoøq¬Ð?„YYY[ÑoÅ¿ÿÄ\0D\0	\0\0\0\0\0!1AQR\"0q± #23SaBP‘’²Á$4r‚¡@Cb¢ÂÑÒáâÿÚ\0?\0õ¬¬U•••••••••••••••••••••••••••••••»P¦{šác¹kdæ+ZþbŒ²s­“˜­lœÅkdæ+[\'1ZéyŠ×KÎVº^bµòs•®—œ­t¼åkåç+_/9ZùyÊ×ËÎV¾^rºDÜåt‰¹Êés•Ò%ç+_/9ZùyÊ×IÌVºNe®“™k¤æZé9ŠÖÉÌµ²s­“™E#ËÀ%Ð*xwv–Y¬_Eˆz	WWX–%‰bAÈ9¯ëCñ\ZhG¼;½7WìŠ(¬NÑïXÓ½]±,h= õ‰bWô]Äj= G°tÐ´ÙÒ°À.‘Oó£üÁtŠŸæ¤Süøÿ\00]\"ŸçÇùÂéeí£ÏgX.‘Okëã·A6x@lÑ’v\0àJ«øïD¢Š?D^ñ¾ë]Ä-k9–5®!6tÉAÞƒ@¬Jèö­G´QOv9Ü*9^^\ZæpO­¤®kj\0f,›úV®NRµr(‚\r¡¶+û?úÜžF¦^­†¶<¶nrƒ£‰QêCvºäoÉVÊS îòZÖëx„J(”Jr7	Xðµäm	µvÞ¡¯mìJd­x¸+bTÎ¼ÍñG´ª‡ÓÌá¹Ž?è¨ey©\r.ŒÞ2z»¶zÚWúé²åý!bú\"ï DŽPŠ‡Í,AøAŒîí¹hv‰¥ªŽB×µ¥¶%£ê¦£§Í,…€ñ°¸ZRv6¶`o•·}51óß’é\néD!Yÿ\05\'èº@Þ™¨ÈÓ¼,M½®ˆi²sYÅ`±ÉSOvÁÀÀ¨žl1mXT¿ž>HöRH¦œ–ï%£Ü:PáÞÈß+Xåô³´<R]$ÎÜÒ7dðü²óºÃˆUz\"Ž\ny%RZ/bà?d[k\\i¤\r;?þQ§Œº@È\\C^æç+AËèB†žžHiäVœ?gXýBe|Tïv°—ç³;‹\0º{ç‘­s\Z> ­,Û×Máä£Nˆ¡:.„c1L.g½sÜmÿ\0u¬€F×-Ëœ6‚€ú+XÓ²Kw¶ÞWXK¶JÃþl?ªËG²F9»j!Âo}„”Lñž»\\ÞñdÉœwÞ²Õ;h	  ÔTŸž>Höƒj*Ñ¶²™Ò%aq;,wZRxd¤sEE4‡XÂÑn,Å| eëP–;h<Q’8ê]ˆím–™Àêj²mµ\ZöÝUmš=ÇÕÙ˜j|š¹¦x~+Ža÷ÛôF˜ãŠ¼À8^Þñãdú˜®æ±öi\'&öï9\'=®ª	ºÒcùÉ|<“Ó®ˆ§ÿ\0q¿Üï!éÑWÆG	c>j9æm°Èáâ›!w¼Ö;½ ¦2mžHAO„õ\\2âšÔÐ€Tßž(öƒj*¤^šqÆ7y-ÒkÛFA³Úëæ8zÐTj£pã½	C‰/ÌŸ´´ s¨*˜À\\Kr\0\\œÔæy \r4µú–3…¸r6OŠVÍ-é&wµq¸_>ã’£ŽfRÀN¸i¸-<ÅZ_•ÿ\0)P¶Ms	Œ€-$K—.JFž‚Š(§‹5îý½:3ßw÷3÷MpQ›¦!îâš‡¢›ã³ÅÐmENÃ$2°ms!RQÍÍ{õ`ðõIÌúÓ\Z—›%Gl2[Š¨øw\'² ŒYoº/˜jÃÆ¹ivÄí+ ‹jÛ´Ù]•zHÃ›…-Ù¾åUMW&Š®×µÀaK™€ûëHU::™\Z\Z\r­ä_\'#QÒò5!/+Q¯—‘ˆ×IÈÄúÙ0Ž£3\'ré¯ùQ~UÓò¢üª‚¡ÏÅÔk@{GT[h\'ö]9äç~\"é•Dÿ\0»ðQË²ÔÓ‘î@¡è§Ýž(öçµÎ;\0¹QÔÃ#°µ×6¾ÏYÑFãrÀJk\Zßu \"\\-D?-¿‚a+¿,qÌür0=ÜNeR¹ÔséÉ‰Î%™•õÒ±Ì’¦W4íÄ‚´¡þv_$S‚(¢¤Ø;Ï§Fáè§Heÿ\0+ê0£	 †žâ‚©µoŠ= EJÍdoeí‰¤~)‘KŽ7>PàÆ´Ûi½Ï­C4e4’QÃ#œ$$¾Àœ/°ŽÕüE=<ÑÏ\rƒÚnÈ€;íu¢\"Žm\'Ic¤±0V•¯s¢¨ÙI°NÑÕSÅEŽ¥yyuD×yë,`%¶#‰ôiÈ£ÀòÒd\0£3ÇWn©/½ñä”·M—ÃÉ9Á9áé\Zµâ†&8Fâ	vãôZ©8[¼æµ\'{Ø?ä\n \rcdë_Ú0›£ª§\"{»ÜûÚáö``ï$ùY2¾MØùGî…sÈ±•ÙðÉ6T§Û7ÅÐ#è–\'DZæ’[~«·}½jM7]Ia‹W·µÛs™º®Ò5Ïc¦ÁveMQ%5DsÇll7Ì&ÿ\0i7#¦kx<Ó¢ÄÀHôOOì\r}ì\ròQhúx¤kÛŽãeÊÒ‘ÊêÉ°»3Ü¦“{‚4§œ£GÞºà…¹Ëv\\#µ!Eìƒ†ÜDàýÐ§Œn¿y@1¿`,mP±ÒK\rq»Ú2UÄÐBkJÂ©G¶gŠ= ÚŠ§ˆK<1“lokoÞl«t-5š\'¸—È®Ì7¸õ©Ü]^Èåm¡.ž6€l´ßB¡è†3 d­qÄëØäw&NKCµD²Þñ6ºª”ÆØÝÑ›íiEEÍš-s¹_IHXa„9¤f~ ç´£šÎÔÿ\0§ÿ\0%t¨‘¦X\0yËö%V²õ2xy#Õ«°\"ÐœÔAD\"\n!È±å2–W•Oá˜_+­Ê\r‡ú(ã\r\0\0€@*oŒß{@ŠcÜÇµì6sH ýBž¾²¡˜&˜¹·½¬=gi¨(4¦Á4Ø%ŽG1­€	nÕY¦©të!|T…”ä·ˆûYådÖ<4‹í!MÝfÚÍ¾d­x|\r†¤ævF\rìmÇŠÐóë4trBÇ:îvÜŠU.¦{Ì/Œ7«ñUcÛ¿ÃÉˆD\"ÔZœÅÖªûm=Ó)GÈCw eN=³|Qí¹¥\'W!p›\'aÖÁÄƒ\rß™=oZ©Ï‡IO(lnkAíiÈ*‚FÀÊ‡<Æ$˜°‡²Þk¤Ë1\rñgöZð\\´%.…dî­–#‰tÁåùÖ#3¼ªY(Ù\r<O{:€\0ò3>«FQO$m¬	v0IÂN<É·z‹IÑLN	£qfö›íU1¾\'4’ªG¶z!¬(µaEˆÆµE6$ØÂµ =0jÔ{@ =§ à}m/ý|½Íý!:–fÇ¬-6µýÓçk-ý|Úï$(kˆ¸¥˜‹^ø\n45¡Å¦–lChÀV•1\r$Ýe­ªošÐ†3-f¯e£ýÔMxoXî\n {W\"••–`Aˆ1 Õ…YY\0¬ øGµ*¤^žaÆ7y-À*XC\Z-ÎçÃÖÒÀôùrÜßÒëêÝO¨ `Â³;¡Áñä}×y)´Õ\\­®l}F´€v–y4Õ^eÍÄâ¹ Ü‡b¿ë+I>AP0’±5õa¥Ít¶ÞEì¨æ¨uTAÒ<‚MÁ\'‚œ{W++	à°žà°€ðXoÑaXJ±XJÂV¬T ë\Zj}ú×*å\\ª†ÎpjÉmÿ\0²Þö7©^â@³Žé®s˜Ç`% –Þö6Ì²~ï=¨û¸¸ÈË³ÿ\0ráÙ¹ ŽÀ+«««««««««««ú—WWôÝ]_Õººººººººººº\'ïOÿÙ','mime/jpeg');
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` char(20) COLLATE utf8_bin DEFAULT NULL,
  `last_name` char(20) COLLATE utf8_bin DEFAULT NULL,
  `email` char(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`chadd`@`%`*/ /*!50003 TRIGGER validateEmail
  BEFORE INSERT ON user
  FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '_%@_%.__%' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email field is not valid';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 15:13:43
