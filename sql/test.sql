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
INSERT INTO `pictures` VALUES (1,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0F\0\0\0m�U\0\0\0	pHYs\0\0\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0�IDATx��]�o�ֵ昲�#��ʈ\0ϛIh�,\Z�F^�K�\r�����\0�=@�$t�E\"�e��u�Z�A���Ȫ�0)����=ς�1ǒE�6eu�e�cH��~y<��V2������s��ug4\Zq��0�b```����������#,FX��a10000�b``�X�ɕk���͏n�k���Ӛ�i��k$��8�a8��N�7��\\9A�fF6�\r>������|Dg�,K�^��N�Ǒ$Iũ�V�e`lY�#��J�|�E1H:�i����%���%���.�M$�L��fR��{D���O���\',���T��>�~}}�u]�q�Oڶ�8�|8\Z��J�\\׍& b�l6�5:Pb\"��V%������q��a���З����v���ޞ�l\'\nK}��	�FT��u\'�((�Hxe�8.�Ju�]A�$����<AH$��^6$��<�<�YA?�T��\',%��Ɔ�aL.f`.a,X��c����^�2�Hy�Tj����]��m�(�~�o�����G�����{{{���N�ٳg>f���8���Ͻ��!�������|V��l���ijkY�lޢ��NYQM�@n�#��#��m����|	�B�81���:�� x(��TJI��	�h/B��`����^\'�iY���&u�41�;������<�-a�8���Aj����ym���<�\'d�u:�l6@E�QV�|p]6�(�Ϟ=������쾰^�{�\n@3�(E�mێS1Q{�G06M�EUE��nonn�\r8�cY��y����ÇT��Հ���?#��\"�\r��xG0�ǲ�{���l��逆&Aƺ\'�M��]ׅ���<�uf�7�)1ݗ�QR�p��?A�\\��v�� x��Akb�ܛg.f`���������oUYN��}U�(���e鍆�juu���\"�Ln(JZ�7U�`�FQ۶���D�2[������=��2�\"HR2��:��Cp\"�q/����_�$��a�ߟ�<���ξ����������~&�\"l�����;�	�5j��}�H�R>\n��M���0����&r�m�3��b���F�q������,�[���|X����9�b������|�8�W_}�N��	1���P� �2�NGtΞa���o_����vw7Uնm˲���z=�ú��W_}��dx��,ΝcY�#�/^ ������Z(�7bUʷi�v�N���uu��d�+W��\\`���K˲��^Κ8M��`�`�\r��eY�$e2�0z��o�����6h¶�L&F�\n>;D��`�~��N����<U��;Kh�v�ӑ$��lä3�=���ka=մǕ\n�I���j�����e�}V*��j�禪�,���\Z1����`�`E��l6��=q ���o���c>�9(�%�\"�5��޿�}�V#��8�޽{�1���󛛛(�۵\r���L��T�o}�D\"z���f2�$�����M����>(�C���i*B�e��T����T�����~?�Y���Vl+�~�\\~�X_�6P��h|�ia��SM[	��n���X��lN���ة�8�����ڂ$�k�y��N�s��f���b���d��`��iN3�\\a��{��o/a9��Y���?����\r��w��GŢ�P>�4t�vw���8���@t�X|�iז����+�͉a]3X����b�a��j�/�|>�V��PB؊(9�_7�n6�F��w����C��^\ra��e��ry6������\n̷�]^r�W@XJey6��,�^xH~�ث��V���V�?9ë!,Zo5sP���j5�mj3�q�O�9�����P�9�300�2�Z�C�����r���X65�}�j�;�y5Or�ٰ�YBxFp	g��r���X��R�{���r9~l+$c�����V�3�y��d��TÆ�d%�*FX����f�~����e�t���g���6mńw-��\'����[�e�^��IR���.�����	h�w[[d�E��1�{�\"�-e���I�MU�������r���200ºAe��;;?���������v|�ɢ1��W���G�vw?����ɓ���j\n�4�8FX7��h�R)���y^��8�tߐ��ȗ(˴�{�X�d`XaQ��.zz2�2�쬞7y)�7\"���a��E�����d\\�ٌ(b�\"����f	g^���������f��.���˨��J��pX��wp\rLľ։Q��+k��q@E�e�㰀e\r4ϵ<� ���̔�200�F��B,�ܫՖ���γ�>ڕk7� �G�\"J�5g�)�ׇ�a���^��pD��гVp�;�q����/�q�b�s&�Z����!�Y��X�Y�ǕJXh�V]�e���)÷���������a`X.aq��;;t�§��{�\Z�r0[������툍͏+��mm=�4\n����%�ߍc��j�g�n��C9�x\n�,@���� �vw����N�0S±�`��Z��8,��d\\ |��n�K�#��j�����m�oQ��sw�3����l�&��9�ql���\"����o��\r�­Haw\Z-r�{FQ�[j|��������#��c�S��bQl�q���d�:�����0)6UջDvZ�aƳg��^h<��[�g�@��t?s�s~��!��v��Z��2���S\r�eY��{�<�������E���n��\\s=\'�\Z�qxxxxxhF�&S�+ΧI��7Q.�^B���V���I��(qb�HE񬘩��W��og�S��s���eY��/L9��+�����\\�u�G.�NxH���3���W��U���+gng��G����{z�n���t�FՠD�l����BPH\"���ԅ���\'�7��m���3���V�4Mh�4M\\I1X��:_��~�!��k9О�Π.(���8N�ף�&��尔��I�Q3�h�p�\n�^4�JE���lb��(�S����(��1�n�F�F�&�e}}=L���u� ���5��d�N�	.�\r&���X���ma�Q��,+�N۶��vgPW�������É\'@�>Z������=y�u�;h��eY�(�E���%��\\a�7��:�N�����}�!�n���n�jb/�S�E�ٳgѽz�U�y���S��M��,�\"�D�υ�GXd*��&pR@�ˋy�� aј�V\np��,�\";Ŷm ���CwE���0�X8::\n^+��akDܿ����J�R�3�\r8z��*%]��i|u}�*ml�ܤna�����;�N/�O[���u㽃N���D��+�VةO _2\0ɠ]��H&R|uٶ��|��LC�DZ����+��\'F��6-D���!�H`�[��k*�9B3��m\',�wH��^/��]�(\n��7��6A������q�VS	+Gqzc*�B��ێAE����J&��\n�W� 4O3Z�l6��v��6�i�E$2�\\�lss���a���,�m�Ƹ5���ǰ`����}�����=z��կ~uK��q�4���{�����`0H�R+++�����^]]AY��ܽ{wQ�^^^�F�����Z\r���5۶OOO///�޽���vrrrqqẮeY���w��M&��i�999y�7VVV�I���+A��˲��h�����ֱ��ŋn�{~~N�\n���9�O��:;;C��F��\"�4���F�Q*�J&�\'\'\'������4��p���_]kkk�ib>���F��pm8�^M�\\YY����iv�]o��8���|0�a:|�����_~��ߏ.�TdF��[]]][[���@۰m���dmm-�H\\^^b�6~��x{�`0����DbZu���ܽ{w�\Z����������|uu�KXo������Rf	_G.�Ή,q��P��[�\\���m��s�i\"\Zc\'����M[�vIL�%��Iե�kΪbF�8FXK�\r_�����kFX��a1000�bX��f��FEQ��:�JӴ�3��B�V+ޤ3H���j�VSUU��䵩�j���&�q�|��\n}}��T�lȲ�(J�RQ%�E���oƐ���c��NDe�K�^�Z�%�w�<)�W]�E��j���A�*�\Z��������h4J�\Z�5�.�\\�yk..a��E탗e�w��u]�u˲��&Z� ����	ڶ���G�%�NɃ#��5ꁭV��>���*������,����A��VV�\\����H�S�0�,��5G��A�.�e��<��Z�Z�����畗�h}���7XJ���\0ޱ,����\\�Fӌ���%z�8N���>���n�{~��aI�p8��td\n��{���J�R*���������ϓ�$Z�%~��F����\n�f��i\Z�W*�J�R��jmoo�^��i\Z\noY���V*jmoo���`���Z-���lH����+�ǆ�5V�����$c.�k4\Z�fs{{�0��J��iZ��BI���XӴZ�I��h�C˲r�\\�Vk�Z�Z�:|�V+\n�6�,UU�R����V��,�B:+�h�;+�&Q�T���J���i0��g��r�����6��������������htzzz|||vvv|||zzJo��������}zx||<\Z����F#�u�����\Z�F�~���I���O��j�X,������?����\0�M�uNOO;��/�ˇR���|��\'������SI�NOO�R��j�Z�ⷪ�������ɓ\'�,��RX����B�(��W.��a𕵻��+,�W���]UU}/��ez!B��hT�ב���XUU������e������T�e<���\'q\"��$�X,R>;;;�|���-k���V��H]���Z�vYX�(bmn&���\rڹ.�b6�%�KE콠98�j�yl�đ��$aQ;�G�c#P�޹s�{���t�߿/Iv������<����//^�$IQ���൉�45��y\"�޲`��)1O��j�6]�5M����eY��\n2.ǹ��\"�LUU�e��f�R��r�DUUUUa���K�P(�r9�M:�ry�)�\\�V#m�-+L�c+@��6�Ţ��[[[AC���7���^�\\f�6�N���̿�rn�^]]���f�ߚ���+��l��&����r9I����DF��r��R��WWW�\n�Յm�x�l�V��b\n��Q�$Y�w_\"�,�$I;;;DC�$��y8�DXc�\n�-~$I�k�$����b}}=�Hd=��?X�I��\'T�/\n��_���?n4\Zx\r�1F`����?x�jޠO��?�)TU�������P+�\\q�2�ۺ����D��j��Ţ,��� �D�\"z�l\Z�E����\"L��EA©d\'�%�j�3���rMU2����<3�׆[t�nI��z��qDB�𹗳L�L&��^��+�;�m�D�TڶM��%4M���%�L&�����O?�x����������)���_�z{{�������?���p�8����t]�\'?�I�\\�)aYV�^Gڝ��B��(�����y_��*dY���)�Jȡ\\.�T����mY���b\r��uJ^�Vg�}e��劘e�aR��QUUEA��|�۱�r���Л^?K��B���:�1\\�\\.������^(�a�椙J��1CQ�j��TY�OV�T��+uCq���y�\n4\Z\r0#\nU���`G�1���\\{XB�x�Nk�j�s�$v�r�����������.����0��ۥ�X� IR�etk�`*``���e��>fa1000�b````����������#,�[�\0*��\0\0\0\0IEND�B`�','mime/png'),(2,'�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0F\0\0\0m�U\0\0\0	pHYs\0\0\0\0\0��\0\0\0gAMA\0\0��|�Q�\0\0\0 cHRM\0\0z%\0\0��\0\0��\0\0��\0\0u0\0\0�`\0\0:�\0\0o�_�F\0\0�IDATx��]�o�ֵ昲�#��ʈ\0ϛIh�,\Z�F^�K�\r�����\0�=@�$t�E\"�e��u�Z�A���Ȫ�0)����=ς�1ǒE�6eu�e�cH��~y<��V2������s��ug4\Zq��0�b```����������#,FX��a10000�b``�X�ɕk���͏n�k���Ӛ�i��k$��8�a8��N�7��\\9A�fF6�\r>������|Dg�,K�^��N�Ǒ$Iũ�V�e`lY�#��J�|�E1H:�i����%���%���.�M$�L��fR��{D���O���\',���T��>�~}}�u]�q�Oڶ�8�|8\Z��J�\\׍& b�l6�5:Pb\"��V%������q��a���З����v���ޞ�l\'\nK}��	�FT��u\'�((�Hxe�8.�Ju�]A�$����<AH$��^6$��<�<�YA?�T��\',%��Ɔ�aL.f`.a,X��c����^�2�Hy�Tj����]��m�(�~�o�����G�����{{{���N�ٳg>f���8���Ͻ��!�������|V��l���ijkY�lޢ��NYQM�@n�#��#��m����|	�B�81���:�� x(��TJI��	�h/B��`����^\'�iY���&u�41�;������<�-a�8���Aj����ym���<�\'d�u:�l6@E�QV�|p]6�(�Ϟ=������쾰^�{�\n@3�(E�mێS1Q{�G06M�EUE��nonn�\r8�cY��y����ÇT��Հ���?#��\"�\r��xG0�ǲ�{���l��逆&Aƺ\'�M��]ׅ���<�uf�7�)1ݗ�QR�p��?A�\\��v�� x��Akb�ܛg.f`���������oUYN��}U�(���e鍆�juu���\"�Ln(JZ�7U�`�FQ۶���D�2[������=��2�\"HR2��:��Cp\"�q/����_�$��a�ߟ�<���ξ����������~&�\"l�����;�	�5j��}�H�R>\n��M���0����&r�m�3��b���F�q������,�[���|X����9�b������|�8�W_}�N��	1���P� �2�NGtΞa���o_����vw7Uնm˲���z=�ú��W_}��dx��,ΝcY�#�/^ ������Z(�7bUʷi�v�N���uu��d�+W��\\`���K˲��^Κ8M��`�`�\r��eY�$e2�0z��o�����6h¶�L&F�\n>;D��`�~��N����<U��;Kh�v�ӑ$��lä3�=���ka=մǕ\n�I���j�����e�}V*��j�禪�,���\Z1����`�`E��l6��=q ���o���c>�9(�%�\"�5��޿�}�V#��8�޽{�1���󛛛(�۵\r���L��T�o}�D\"z���f2�$�����M����>(�C���i*B�e��T����T�����~?�Y���Vl+�~�\\~�X_�6P��h|�ia��SM[	��n���X��lN���ة�8�����ڂ$�k�y��N�s��f���b���d��`��iN3�\\a��{��o/a9��Y���?����\r��w��GŢ�P>�4t�vw���8���@t�X|�iז����+�͉a]3X����b�a��j�/�|>�V��PB؊(9�_7�n6�F��w����C��^\ra��e��ry6������\n̷�]^r�W@XJey6��,�^xH~�ث��V���V�?9ë!,Zo5sP���j5�mj3�q�O�9�����P�9�300�2�Z�C�����r���X65�}�j�;�y5Or�ٰ�YBxFp	g��r���X��R�{���r9~l+$c�����V�3�y��d��TÆ�d%�*FX����f�~����e�t���g���6mńw-��\'����[�e�^��IR���.�����	h�w[[d�E��1�{�\"�-e���I�MU�������r���200ºAe��;;?���������v|�ɢ1��W���G�vw?����ɓ���j\n�4�8FX7��h�R)���y^��8�tߐ��ȗ(˴�{�X�d`XaQ��.zz2�2�쬞7y)�7\"���a��E�����d\\�ٌ(b�\"����f	g^���������f��.���˨��J��pX��wp\rLľ։Q��+k��q@E�e�㰀e\r4ϵ<� ���̔�200�F��B,�ܫՖ���γ�>ڕk7� �G�\"J�5g�)�ׇ�a���^��pD��гVp�;�q����/�q�b�s&�Z����!�Y��X�Y�ǕJXh�V]�e���)÷���������a`X.aq��;;t�§��{�\Z�r0[������툍͏+��mm=�4\n����%�ߍc��j�g�n��C9�x\n�,@���� �vw����N�0S±�`��Z��8,��d\\ |��n�K�#��j�����m�oQ��sw�3����l�&��9�ql���\"����o��\r�­Haw\Z-r�{FQ�[j|��������#��c�S��bQl�q���d�:�����0)6UջDvZ�aƳg��^h<��[�g�@��t?s�s~��!��v��Z��2���S\r�eY��{�<�������E���n��\\s=\'�\Z�qxxxxxhF�&S�+ΧI��7Q.�^B���V���I��(qb�HE񬘩��W��og�S��s���eY��/L9��+�����\\�u�G.�NxH���3���W��U���+gng��G����{z�n���t�FՠD�l����BPH\"���ԅ���\'�7��m���3���V�4Mh�4M\\I1X��:_��~�!��k9О�Π.(���8N�ף�&��尔��I�Q3�h�p�\n�^4�JE���lb��(�S����(��1�n�F�F�&�e}}=L���u� ���5��d�N�	.�\r&���X���ma�Q��,+�N۶��vgPW�������É\'@�>Z������=y�u�;h��eY�(�E���%��\\a�7��:�N�����}�!�n���n�jb/�S�E�ٳgѽz�U�y���S��M��,�\"�D�υ�GXd*��&pR@�ˋy�� aј�V\np��,�\";Ŷm ���CwE���0�X8::\n^+��akDܿ����J�R�3�\r8z��*%]��i|u}�*ml�ܤna�����;�N/�O[���u㽃N���D��+�VةO _2\0ɠ]��H&R|uٶ��|��LC�DZ����+��\'F��6-D���!�H`�[��k*�9B3��m\',�wH��^/��]�(\n��7��6A������q�VS	+Gqzc*�B��ێAE����J&��\n�W� 4O3Z�l6��v��6�i�E$2�\\�lss���a���,�m�Ƹ5���ǰ`����}�����=z��կ~uK��q�4���{�����`0H�R+++�����^]]AY��ܽ{wQ�^^^�F�����Z\r���5۶OOO///�޽���vrrrqqẮeY���w��M&��i�999y�7VVV�I���+A��˲��h�����ֱ��ŋn�{~~N�\n���9�O��:;;C��F��\"�4���F�Q*�J&�\'\'\'������4��p���_]kkk�ib>���F��pm8�^M�\\YY����iv�]o��8���|0�a:|�����_~��ߏ.�TdF��[]]][[���@۰m���dmm-�H\\^^b�6~��x{�`0����DbZu���ܽ{w�\Z����������|uu�KXo������Rf	_G.�Ή,q��P��[�\\���m��s�i\"\Zc\'����M[�vIL�%��Iե�kΪbF�8FXK�\r_�����kFX��a1000�bX��f��FEQ��:�JӴ�3��B�V+ޤ3H���j�VSUU��䵩�j���&�q�|��\n}}��T�lȲ�(J�RQ%�E���oƐ���c��NDe�K�^�Z�%�w�<)�W]�E��j���A�*�\Z��������h4J�\Z�5�.�\\�yk..a��E탗e�w��u]�u˲��&Z� ����	ڶ���G�%�NɃ#��5ꁭV��>���*������,����A��VV�\\����H�S�0�,��5G��A�.�e��<��Z�Z�����畗�h}���7XJ���\0ޱ,����\\�Fӌ���%z�8N���>���n�{~��aI�p8��td\n��{���J�R*���������ϓ�$Z�%~��F����\n�f��i\Z�W*�J�R��jmoo�^��i\Z\noY���V*jmoo���`���Z-���lH����+�ǆ�5V�����$c.�k4\Z�fs{{�0��J��iZ��BI���XӴZ�I��h�C˲r�\\�Vk�Z�Z�:|�V+\n�6�,UU�R����V��,�B:+�h�;+�&Q�T���J���i0��g��r�����6��������������htzzz|||vvv|||zzJo��������}zx||<\Z����F#�u�����\Z�F�~���I���O��j�X,������?����\0�M�uNOO;��/�ˇR���|��\'������SI�NOO�R��j�Z�ⷪ�������ɓ\'�,��RX����B�(��W.��a𕵻��+,�W���]UU}/��ez!B��hT�ב���XUU������e������T�e<���\'q\"��$�X,R>;;;�|���-k���V��H]���Z�vYX�(bmn&���\rڹ.�b6�%�KE콠98�j�yl�đ��$aQ;�G�c#P�޹s�{���t�߿/Iv������<����//^�$IQ���൉�45��y\"�޲`��)1O��j�6]�5M����eY��\n2.ǹ��\"�LUU�e��f�R��r�DUUUUa���K�P(�r9�M:�ry�)�\\�V#m�-+L�c+@��6�Ţ��[[[AC���7���^�\\f�6�N���̿�rn�^]]���f�ߚ���+��l��&����r9I����DF��r��R��WWW�\n�Յm�x�l�V��b\n��Q�$Y�w_\"�,�$I;;;DC�$��y8�DXc�\n�-~$I�k�$����b}}=�Hd=��?X�I��\'T�/\n��_���?n4\Zx\r�1F`����?x�jޠO��?�)TU�������P+�\\q�2�ۺ����D��j��Ţ,��� �D�\"z�l\Z�E����\"L��EA©d\'�%�j�3���rMU2����<3�׆[t�nI��z��qDB�𹗳L�L&��^��+�;�m�D�TڶM��%4M���%�L&�����O?�x����������)���_�z{{�������?���p�8����t]�\'?�I�\\�)aYV�^Gڝ��B��(�����y_��*dY���)�Jȡ\\.�T����mY���b\r��uJ^�Vg�}e��劘e�aR��QUUEA��|�۱�r���Л^?K��B���:�1\\�\\.������^(�a�椙J��1CQ�j��TY�OV�T��+uCq���y�\n4\Z\r0#\nU���`G�1���\\{XB�x�Nk�j�s�$v�r�����������.����0��ۥ�X� IR�etk�`*``���e��>fa1000�b````����������#,�[�\0*��\0\0\0\0IEND�B`�','mime/png'),(3,'����\0JFIF\0\0\0\0\0\0��\0�\0\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||�\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||���\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0;��DH�R\"\" �� �@$�ipg%��ջ\0\0\0\0\01��ʩkEU��U�X���A\0&ZH��d��fgvwg�ǳ���\0\0\0\0\09wΞJ$��+\"�B��,�$��,��-3-����\0\0\0\0\0�|��*����*��LEi4��L�I3/2�L�m]k��\0\0\0\03��_X�`�Aab !V��y��fba�i�v����\0\0\0\0�|��$*���B��@A,�H��-,�-$*	\r��_W�\0\0\0\0\0\09��^$\nH�����\n,���9Z�X�cH����0�0WX��\0\0\0\0�~q�!aaaaaaaV!aaab��f{��\\T{�v���j@Q�H���w�\0\0\0\0\0��8xk[S,*���z��B�d��ْ�;��e���e��bb�����{�\0\0\0\0\0sO��=�?\np�Z�DD)_T����ٮ���[m��nVS�\r^7���΁7R�\0\0\0\0ξn�c7连r<�5�XX��f ����.�O�x���)��e��~M��d4�~v�椐�N�\0\0\0\0ξo�#;m���XXXX���GB�8�}\Z�W����	y�ۯȶ�m������y�\n�!����\0\0\0\0\0��\ra}^�Íd�����u�\"\"<���q��vm�m\Z�\n���Ǜ���.e��W	����\0\0\0\0\0��-]}��xʰ���n��\n`{���=�����ɾ���������NŦ�a�y�B-~�O�@\0\0\0\0��x�c���`��V#{ڳ<͇V��j��i��NV��m7]u�7��_��d���z�F#ߕ4��X�M��w�\0\0\0\0\0�8j����5^V:�����;����������w]��kr22.��܏J����̰��~e�kD�����\0\0\0\0\0�_8걝ӹ��R,,*ǧּ�:�Q5��ٓ3R�vL������^�J�]��̶��˾ߓ�E�g���\0\0\0\0\09��\Z�z�B�\n��U���C�h�}������޽h����~n[Ye�����c��z6�~FVS��\n��t��\0\0\0\0\0��M}�O��aaaa��\Z1}��������\Z���[��k�e���]�k���ee]�gɈ���?L�`\0\0\0\0Ͼo����:���V:Gi�~@�ýj�;�9����sL̺�l����S��w�*}1���\\$۳���\0\0\0\0\0��F-��!V�w�/�b~��|n��{F���~}�6��-���l�>˭fU�������@�R\r��w�\0\0\0\0\0�8�1����y𰰰���N������6F~�m��e�m�g�m�n����/�5��u�\0\0\0\0\0��-F27]/�F�As��ȅ������ik��{m��{l���\0o�k�r�r���6>��@\0\0\0\0�|�G��xw��5���JbG�������؞_J�w�x_��x�;��X�[g����?���k[k��(��ײ���\0\0\0\0\0��BR6o��}��W��u��L]��᝻�-g������,���Ƿ\"��k\\H�L�@\0\0\0\0��ݨ.F=k׿��}9��������������_m�m�*<=��m&\rT�k�<�U_���\0\0\0\0\0�~n�+���\Z�XX\\��X��� #b���ly�{�k]��Ȳ�����x�l]7��\0\0\0\0��v��[����j���b�{����]��ʸy͌䅶ۑ�u�]m��ed��g���Td��\0\0\0\0\09�\0�\Z|{ݯ��������ǡ�s>����ʏKO�fgg���2��뭶ۮ�<�ʩX6N��\0\0\0\0\0B��N�ͣW�Vc`��{j��s�=�5��t�S1�ݬ����^�m�e1�01�X\0}��w�\0\0\0\0\0�>o��1aaaV7=��]�\r�׳<�[114�_-��i������a1�HZ�	�g���\0\0\0\0\09��^�?��R�ۇ\\,n����g�W����v�����.��位`�;YvEֳUEk\nV�,�?Q�`\0\0\0\0�|ۧ�_g�)C�׋J�lN6���~�7���|�ܛ�鷵��-c��Yl��UB͵�$4�OS�`\0\0\0\0����cy�Q\n���^����p�K���\0/��-,�kX�$�*�ͩ2����;�\0\0\0\0\0h5��c�ְ����^�`j��h���]�3�|�d��K�30�,\nL̴�D�m]W�\0\0\0\0\0��>���ߋaO��\n��n]{��۶Ѷb�zw/}Zy�v�əl\ZY��gں�|\0\0\0\0\0\r�}Us7�\'Ă6��!6�@��dfy^�2�/\0�#3��̴��_�\0\0\0\0\0�����w�%B�*�N�>^��!ε���4�HI2�--,���T�z��>\'��յ���\0\0\0\0\0H��Ƴ���+!#!b\'P�/w_�\Zϕ��\0��fZZZZ^Y�����=[|�\0{\'�w�\0\0\0\0\0�>h\\l|z)������U�\"�	\0&I������w������22w��\0\0\0\0\0\Zg�鏏�E4SUu�*��DA\0F���~I3#L�3���m�_m�ߓ��w�\0\0\0\0\0�~e\\|v�â���+�U���\0�^�uh��I2KK3;��e��}��~FFN��@\0\0\0\0H��1�袊i���!Ub\" �\0\0\0$�&ZZY��w�ۯ��������\0\0\0\02�%���\ZLWy�y�\Zmn�r�Z�Yʪ��j.),X���K�\'Ժ��z�\0Ҁ\0\0\0\0��։��^~��%�Nu1���n��U���^�J_�v6^���_NN%�+Z�Mk�c�����Ԁ\0\0\0\0���N����R1�q�s��Ǳ��?\Z�|�Y�7*�%b��KѪ[Q�%�U�\"�S��v�w \0\0\0>�<�k�i��[�����z\Z���^Z &�T�+[r1�L��h�e�ښ�k��Og�������\0\0\09/�YƢ��ab\"0`\"B	`��	n�$�ffe���n���/����\0\0\04_�+��Ǧ��b!b\0!h�	 � \0	��I��\ZY���\0Sӵ����\0\0��\0\0��$ 	��`\0p�	$�$d�򾭴\0\0\05�7AֱQUb\0	�ɩ@\0\0��@2� fY���s�\r�w�\0\0\0\0�À\0$\0\0\0$\0@\0`\0\0�\0\0�e�\\\0\0��\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0@\0\0H\0tn��S\"R�X�e� ��Je6�-3b#:D!y�\0;:S2L�k^��i��*V(�?� $\rdRm���[�Ҝ�9�No2@i��a쵷�t�qvM���m,����~D���~|>�ԙ���~w�=K�Sk�g.>)��H\0��o��߫���<>ӽ�&3���;��/,�|I\0\\:�����\0���7��y��O?�q��.O \0#������>ϧ���{=v��3��^]�7� 7��p���\0����;������^�^,s����> \0\"k`��}��:�߭��9�//Lx�{qǓ�\0��=�q�k�����k1̧rʬ���H\0���۟�-��^���ak9��l��Y\0�����]�_���m���a���^O \0\"0�s��>w��ö��M����ÆY�$\0#�N���~ϧ�v^mmo9���#�ːj��vq�#칼^����b)�\"y�\0#�����}3��g�2�b���\0$:��.\0\0B@	�	\0D��\0��\0���L�H\0\0\0A\0E4\0\0\0�`\nF�\0\0\0��I\0\0�\0 \0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0@\0\0\0\0&�Q!!��S2f�\0�A�C�F1�s$ͻ�\0N���LD�8��	���~�\0�+�$��ׅx���g3���\0K\n�-Ɋ���{Q�WU8ś�K\'-��\0���#͌p��}���N1�M}���u`\0��#�\Z�ipm��ny^F���[�ȷk?Cf{�X\0%���ջ�������<�Z����[�6oڲݎ�\0���Cn�o���͜�N�u�]N�;{ۛ6gwN\0	S��m�s=���zߓsj����ы�v�;�P\0\'\n�&k�ַg�s)�\n�;�{]ˬ�g�\0��`=g�<�;CW�˦����E�Wt��o�\0�ڃ��Gk�YE>{�Ve�cmM�݌�z�\0Jޏ 0���L���c�EXa�S�߻-��\0	��0�����:���ׅ8c���_fs@\02�C���\0��V�����8al[9e���\0�?Skݼ^�sG_�S9��f��\0G�>�>��z[\Z\"&S�YM��\0&\0�V��\0P\0, B\0�)\0� 	@&@0\0\0\0\01\0M�\0\0\0H�@,�a\0\0\0L�� \0@I�b\0\0\0\0\0\0��\0:\0\0\0\0!126@ 05A\"34#7BQ$R`%Pa��\0\0\0�\0���L.\"�N����-�=~�qwO���[���<D]��\Z�����w���Z�w�_�c�M~�˯�y���>�]��˽\Z�w�_����ޭ~�ѯ�z���V�]��˽z�w�^��k���|�ׯ�z���N�]�׋�z�w�_.�����|�ׯP�V�]���q�_��k�ޝ}�w�_.�k�ލ~�ѯ�z8�����ͯ�y������N ��qw��K�<B]����\0Q���\0�ž\"!Ş\"��qwS��\0�t����ĵ��&.��0��q9w��@kh�f*yg�~4����fC\rNv���ߕ��\0&�יq]g�(��d\\�D�V�\r�踮e̹�.(��r���u\\��]W.��Uˬ��r�9	J��+�WU�J��z�=u޺�^a�̽y��z�r/9\"dB�^��~T2!����egC-:�f�!���~��d%��̜q\Z�T0}�\Z�\Z\n����|��^�o����>�ס\\��w���l�[-����l���r�ʹW*�[-��d�l���l�[x\r3�[\\��S��\Z��l+�\0�9z\"�t���ɺ�s-�Qh�б�c��m�˕l�[-�˕r�T�.EʹV�e�l�o\r�����_%��וּG�q��;j��\0��D�>��[~C�|w[�J�G���O��ȴ�p���P�r�Eȹ\nA��l�b�[ \0 Ϧ�Kk��Xꟸ�g���\0���Q[-�;#�|O�ȏ���c>��cǷ#���\0�[ �\Z�W\"\\���b�+�.UʋPe����4ϫ..�5��?q�v������W+�iE�\\�\\�E�\\�\\�]7#�c�#�c�+�c�#�#�#�k�#�c�#�#�#�#�#�#�#�#�#�#�)� Jk�\0�7{�v�k�=�=�@ 5.B�\n,]4cF%�W*�tZ�W*�m����m�~K���Xj���K@��E_���r�+r�+r�(��+r�+r�+r�+r�+r�+r�+r�+r�+r�+r�+r�+r��w�<\ZHA�����U��5e��v��\Z�WMtWA:�I�\"�B���(�\r[-��e��K���Xj���_��ҫ�}����]�����y&��f1t�$�$3FȞ�\0т��%���W�r��r��9Tq9Tq9U����FY|#,���>v@��\Z�\r1�	�G��J����V(ݬֺ�oX܂�@ &����\0�E���?\'������X�I��O��FB-[ j�\\�x�Zk䶸=��g�q��p�\0\"���T6,Ws���;��%��G%q��aC��Q�dW/۹�����Nɲ�*�ߡK�\\Z�^(��)����`\"�T��N�V���gzT���� *\0�@ M@ B51�	��� ����\0��ҷ�D� �U�IL�i�� -(�r�dZ\"�+��:6m���]]�>�?��Q_���8�[z\"!ј��D��Lrd��OGOc\r��e���\r$��2`r�Gl�#g��r��ǎ|����ͪϫ(��4~��*\"�znl��VO�$c�p��5����Y�5�n�L�\r#��b5����te\r�ǃSP	�4 Bjjja#��W��o$����3���O�q�kX�\"%��-�\\�d�>��\0ٶ����qƯ��(����[eu�DF<�3�l��7�i=��,��&K]�r�W>8C�H�h���D�4U�i��%9lh�\ny����\\�,�1���ڏ����w��]�\r���\0P�嗖r�9\Z�>�N5��U�t%��֠�֦���\nMxL�(�M|n�������7f�8y��y`�M��c����|6��|�W���W��\Z\0��Q_�������}���:*��J�s��7�t�����|�ҟ޼��Mߜ��\0xƭc}[uΧ��Ȗ#=X>�9�2���;�����	a�����~�\0�b�o%i��7��5���1����!t6M�d#�yhϸ�\Z?�V�.�ǻb(�A(S�}����\n��[�zc�M��˶[�c�ݨV^Ė2d��j��)\r�;\r�ն�~���\0q�p2���n���d�@��{,j���A#rf �Z�1��?��m\n��z:��7`5���J��6�i٪-pk�7A�3��\0ZstT�Z��ё�ul���қP���Y���;Z�,�j;�<�/��Bژ�*�4���צ�6WfZ�&�;8\n��lU��Q�B�\r�/�_�3!��)T�\0�\n�6���&��ڹ�\"�[�4�d��(C��~C����y�r�#=���\0j������2>���ȴ��ߖ����X���ܺ��Q���2��\Z�2�H�_7�E��-��k�{��A^�й_��.��3��װasq��e�,��%�`����=�dry�f��,f�E�A~��}h���`�*L�tZI�vw�e ��onq�oY��|�fc^�r�\Z7��hl&���צ�u�M�uN�M�ɳ��fz�^�^�d.���9I��/���\0���qO�\0�<V�t����\\$)�܄M�o�݊hMs��V�/�p���7�H��3���Ȃ�!s�u�+��\\��X�����+ߵS\"~B-}B��,�sb�әư<Y�=Y�o���:ŋ4�BB��dm�%8�\"�+W�d�15mU�:���!��G~=!f�j���~���{\"��H5�l�c#��Ut4+]��g����l�쾚�c���V���X�S�P>�z�\ZǦ�z }�O�F���-�d+ϕ� �iQ�����}q�Q[�����\\�c梓��<cϨ��w���? �O�\0�oFǒ��\\G�[���i����՚��8�o�j��G�,q_��A���.t9�B�JI��,�ݞ�����L�Þb2���ݒ��8L�kօ��0�[f!A�2��ç��0:2���u��.g����<Y�wV%�6D���w�Y<v3=�F��X���*�k��(,�gMA0����	��z��\0�k�(&�,i��t��-A\0��A��I�(A54���Ӝ��sJ%��[�E�G�Z\\��Y��������I���2�ȇIW}�9�ɳQ�����>�*�1�s?Ca�3d�Ơ3WvW�9J��qc�/�$9O)/Y���3n�3}��/�i�^fK���P3A���{�?���[;;q��dt%fZl��K*i~�.�N�I����F�?R��\0�M@��SO�	�c}n�>V���[�ϮbM�	���S�3b���:;-��Ez��j���-.�Y�~����U^������@a��w�ga��\0JSE(�YY���k+���nM���׮E<�#I�1�2v%�K�������\'\"馳��ѩB��b����/�&_��K�	~\"�/�X5�2���鲮�lSn٢�6X�QK1)�1s� ��Az�O�d Q=��� ��F���di�͓Be\Z��k����U���\0%����f~㌿��Y^����v��n,�#���a�?N����K���2���~\Z�\0��T���>Hsm|x̴n;�WJR}4i�\0Zң���S2+9���^�n�l]��q�j��Y�n�l��P#�od�W������>��c%WJ��$�, �{��\ZkC$���R�O�h\\Cqu�1���_M��M�d1�1��2k��:�������KP�OP�SQ![Q�����5Q�VrǯS���W��*�����\nO>��#��_:rs\"Ȃ��\0ǪV~K+�_T�?��@��]]���^�զl��{*�Z���Y�\0!��6�\0/.�����}kY���姟����X��{���,� ��7\\q��u�O��3SR����B��g�gTi�p�,{�.G��ZZ,N.+�ܽ<�tY_@_��v\"僨��p�Sև��g��Q����PMA�\Zv�ҙ�A����<��&�C�54�(�a\n�-&��E��!l��iح<��Zۃ_T�O��Cxy�W�jw�1T�h�\'\r3�*in�Z�3�\\S�?���ᤝ����U�u��A4}e���#��{�|w\"�w A\n��a�&|$���题� �/�90��,�J�/�y������v0?ڝ�o�G9L)� �A?0���|�!n��lSvML��F�59ڥ���-N�Eޞ�o���V��-�\r��6���147��u{��xҬ-Z�4�a3G���-�\Z��7Q��ې�۶띄��}�p|q�/�d[K�\0�o���p\0t�C�d�ɥ4���?���AS,�W���;�\n\0��k}�E�G�#S�J�X}Q�iѳ-��Q�>�cn�»�S�p�|�p�j��Z8ۓ2�P��}��.Z˂݆��2��/��Ii2礚���(nM\0\rm�O�c.���ޒ�g�\'L��KOЫF���[CY�г\'b4\n���i�GJ�(�c���{2�&\\K[��\\7���x��b�.K�f>|��mma��Qv@#�}\0�|����Cf�o���Zk��JjX�N���	�z�Ђ&���3y�MAAţt\\_�3j:�$ە��ϔ�?�	1��m�[P�U �I�\0�rQ���H؈[x��᧾[K�?T�_��	߇ق�����a�ˑ�����i�� ����9�qY�n\"C$�U�i�A���Y�<[��ڟ%���n�}����f�7�O����k�ح\'&�zӦ��xTm�+���A��fe�+��iL41r���px�~W�l^-`1ιN�&5&ƛ\Z�	M�Sk�\n��6�č�����?)��c�)1����3�aڼ�9�!�L�#5�nV�~������n�4���s~�>c���o����f�1��A[ `���ipk�}k�c�\0o3*��.�40Z�i�1$1��#Z��]?�\\Z���X�r�p�u1�+K������jMES!S!���AZ���������?�xF���>G��>ή�yh��\0���\Z��<\r\\5�\Z�\0L�mc��Y�T�����eC�M����#�:�}Ŋ��ax�9N_c��>A���̆_$��\'y����	��@SC��EcW���w�vT�������\'�\0�Ʒ��MA����V��8���l�}O���_��i\\���4Z�Z�;���k���J[Fԁ�w0e�N�]�,n�Y#磏�}�X��\06[`��|R�ކ��!4���P��-͟�͕�I]bSe!6a��F�J�܃��(�62{\r?�-�?3$\'�oD��+��Riە��O?��0���_f!X��dj2�ῆ䴸/�6���0\08u�\n��.�H�f�5���Am�V�-.�]t�\\�9�����0�E5L�Ʊ���dR��il�c�C�\Z� �Z�pk^�;�`oѽ=9۠53�犺?7j�b�\r��5��b�3Oe����Y��X�2��N�ɀ7���M�|�ӴR&�! L��uWX.�Bd%r��&<&�twM(&�К��LcS\ZCTo��r5jMݹN �g\"8�[�W���O��^���Z|�\0E�������qy�p�4�o��x�o��\'U���u/��R�m�i�=�\n�k���ba��J\"�w�M	���ܗ9���������EA]�gQ�3}aSJYa�dH�>v\n��Պ��;J�l�����:w&�dy�OS=���f�O!��3��.�b)oZc��۞���&�J$�T�N�7� BB�ܹ�s-�(\niLLAɯMp@�Pr	����Y��\0Ьe����|���I(�tJ�n�G�O贸0@Ժ��8÷os*���y����g�K+�~J�?��q����H�_�/�\0����r_�{�d���k�c[��`��lz�[i��ꌦf{q_�:A�Ć����c��~�:G�\\B�-��K�D�hg0�T�x�k[T�\0��\n�@�P(�iM)�Lw�Mz6T&%/0u��-����\\��������-.\n�M��㋡����o����jȔ���cz���Py����`U�=���,dz�FWql��;�#�䧃�F(��:�Ɩ|x�m���y�:c	��\\���f-^+���%�������ӚJ�@ӵ��U��2\nmϋN�VVj+�YQ�1;����^ȶ���Mo)V�wW?�\n�\n���̃�\\���.b���џd�Ӭ#:|��I[��`���[�\n���-.\n�K��� v�8�~�V<�C$�3$�A(�5��{t1�{�*�6I2�!B�Z���/�N�|���87u��c�{��\0ɢ%���ԸzP�#/fv~���f*P�b$��&�����j��r�o�ݫum�d訜�Ž�Ѵ�6������a.���jbr�~:g|\053#^�D��}�@ wZ��f���YY����@�P(\n�n�\\�s���=5��t��ң*t�ʺ�ȃ�Pr.E�s�|�-:���Ժ��8��8{�V�h>8�5�as��t��⁽rHrj����gɖ�\'L��\'�(r�*�c fF�r�X�[I4���٬E-����s��#r��FWXj\\�\n4\r�t��1���壘8.%��.W��\"|n������]�[MU�Ŭijj�|T���z�Z���i�����I�K�x�(�]e��^:�f���[�P+u̹�2A�r��\\��e]T&FTeFD^��2�@�d�P+�o��s-8we��O�u��qwn��U��\n�CRi��c��\0��\Z١�����\0�{����/�|�K�e�V++�U�/�������\'=\'�F�ۦT\"���n�[�P+� �xBEκ����2%s�t��2[�V�U����-�\n}I�>�1�����AD6;\0��F�Zۜ\\$�H��\'�i?�^���y�P�r�~�h�*�g��)u>\n05~�J#���\\��eQ�4��m�?\\�X짗��tXA���\\Y�4F7B�_�\0\"�3M&|�n�[�����z\\�=�uι�2�\"�̷(���@������-�\n��&���+��c�UZ�w�kP$\rn�-QU�2m<���,f��!�\0M��m-.aL����޽ᦵ���Q���~\';��Z��g��+z79>O9m���g~Y)霶.=,���:���=*�|m�#��~�|\n(_m������\n���u��\r��n���u̹�2���e��@�|�\0�ǈ[�5�[\\��\\}���5��IQO$..d��3����ۑ�����3�b[��b(�W#�#�c�#�#�#�#�#֕��n�s�s�s�u�\\6�Jq3���|w�;�_��1^�c\'�XUX�r� ���]��yά+P�7W�˸�p�8.`���j����.p����.p���\\�s̷[��r�-��9s V��n��-�	�I��㊬��ޠVgrӺv֠�j5N��Mނ��\Z0ڨ�lڣ��5�h�c�\'^�|�<�im�4#R�;	#�>^}�ܭ�ܭ�>��\r��h��8�p�\'\"���(��>^��;:Lt0���W�~GNb�;�Z��+�im83�7��UÊ��/_Q�D�#P\0{}�j�m9̀4���+�5>��~8�#��X����9�����f~�m�mĂ�%6�B��X����6Ɨ=R��?����qY��=�\npN ����ps�>7Pg�ڊ���<������F�nf�O%�>vNp��\Z���z�5�7\'?Zf�u�Fx�ׁu�U2���|S[�C+�R�n/�[�Y����g����eW�F\Zx�&՚���TOjvg�Qq,Ǝ����z�z�U�[�^��lW�ح�ح���\0V�lPr�r�r��r�[ʹf��3]�X���������Y�k.��x���ǲ��� �4�J���[W��>\r=��濂Q����{�T?�WOqN%9998\'#�vȄ@D�D�D�[��ۯ_\rφ�r�&�z�V��nV��|A( P(\n�JiA�7t�SIM%4��S����\0q���P�Ů����S��r(��(����8�	Q�w�\rW\n�N�$��Ǥ��y,���|���\0� �&������Ҙ�W~���\0q�o��P�Ʈ�����s�jFK<�c���E|O�8n���,�a�CY���o��X9iߥb�SIC���7E1r����A�AA������ҚS\n���z��8��^j	�b��������(����\0��xAA555555551pI�vZJ>߉���\'\rf��|�0�\ŕ�6n�\0>ns��6���|l7�����ֺ�9���F3$�̀W��a&��#�2�������� ���s��n��l�79=�7T��GG����!kKe��\\��q-1�2F���//\rd��=W�{[T�A�1�#]��=&��	E�n�cN�q���i���7�I�r�p�k��#�K&�Ɂa�S\r��!��͔�����eC#��ʅ���|�\0�q���*�J���]�9�J�g2};���Y^w��pX�7H�R���O%TJb���@��S\'���jŽW��cw�e�r�%>l�o-��d���A s��NG$�C���5��>5����ʦ\"	qv��Q��`�ϳ&zݛ�݋.��O(h!W�H�g��6��A#����X�g���e�}����ldOc\\�ҍ�9L��m�9f8�0G>Z��\n��v>L}����aϧ���w�Z�f��,l/�K,p����)�e��� �ڂy�d�*D��tr�hs�^�uzg�\\��\r�$t���nƭ��虛f���e��I*���d��E̽�b���asO(�L<l�C���Ƕ��R�أg]�{���=�KO���D�Z�h%��T�\'\'�~�ǐ�V�6��;h+�-��\"�����%���2H����V�RXG2���D��el�G^�2K\'���.a��c�2\rt܏��YDRNד����[��Lˇz��#���K��P�5�:�;k7��Թ����SI��S�w;%kCC̠s�?�!$��5�al�ؖ@�*=���Iok�SI��1��7�2\"��1��N���;�=�9��<�:z\"7�ћ��I�֞�)��l�idn|u�\r����\\N�L�į#ʙdk]5���V����e�����������d/�d��k�~X[4���]Oe_1<Q��-�F<5����IR�4s����F7�J̅��Czz�X�ۧ���E1#i��/��~B��)�.�A�	��:@:Ή�&{{K�#���D�fQ�!�/s�fO���o;����n\0�\0�g��k�#�@�)a?�V`FɅb��Σ��s^�\r��n����D�	:�U|bߕ���|���V���b���Q,ݫ��G;��#\\��cKj���$�C\'T��>b�z֥3�t�zϣ-Q$m��\0I�������]��Ol;�귕�y{6�s�G��yHW��\Z�+YyZ�V�=��u�//Ytk!uҮB��^^�뮄��uЁ:\'���,��/�B0��\"�nTP�燰Dָ&>�//�@c��͝+�;�\"��%DYA���l�V�m�����ܓ$����4\\����y�s*E��f҃�x�V<�Q^V���@����&*7mQ���cRS��D���uPL=2��1[sLN	����|v[-����쏠Gԓ��l�[-�Oe��l�[-� ��o��e��m�� �zk��q\n���2F ����marܭ��T���S��Ư�����t�<�8�\np�X�kw)�	�N��х���a�td]FUЙt%]	���yy���yy���yy���sHB���������,�!ey+���������,�!ay�Y^B��W������,�!ey+�Y^B��6W������v\Z�WBUЕt%]	WFUѕte]WFEёtd]\'���L�j����%Q�v<͖����Ik��n��5�{C���T�CQf1�&�sv��F�9��U��K��h1��8��B�v�\n�I�]�������m8�O��i���F�]���\Z]v�K���e�},�O��j4��>�]���\ZYv�K&p�L���},�O��j4��>�]����]_�f(C��̮ٕ�e�?��Yv�K����]0�K�Wit��&�L�����+�zev�M.���-4�C��h4���]�Ӌ��mvN.�i���:�9��g4���vk��K�8%ٜ\Z��vc�/�]��.��eq(pS�\'�S�$1֨�u���sZ���)�t�Df�4������MY�9�A<������S#�=N�G��h�:��]���Z�v�S.�ju�L�A��g�*���]�ԋ�ڏ���yv{8���%��$��a�&>��gsk��������mvw6�9�]�ͮ�f�g3k�y�ټ���mvk6�5�]�ͮ�f�f�k�Y�٬���mvk6�5�]��.��fsK�9�ٜ���m^�Ň��ٌ���ug�f5�Ƣ]��K�\Z�v_Q.�j�}B�/�e�����\\��q	f���ifU^O�<��\r���^��y�Z4iF\"��S#�\0тg��\0��\0P\0\0\0!1AQR���\"02@Saq��� BT���#r���3Pb��CU`cs��$t�4�����\0\0	?\0�\0�\r��D�yM��&���stB���5���S���	�T�n�|�>��-O����Ը~�-K���SA�O�����-I��G�Ը~�-IU>Z��|�4H�Z��-IR?�����SAԎ���KQ*h:���u#�`�%IQ*H:�OQ*X:�԰u���KU*X��R�Ԏ���IR:��u,H�X:�԰u#�`�GR�Ԏ���KR:��u,H�X:�SAԎ���KQ*X:�԰u#���GSa����~�u6�K��GR�����n�u6�K����Ըn�-M������^��Z�	��S�:#�j|\'D-bp}�������Pp8�,�*�_Q����Z�*�`wq\nD���iV�P��C�;�@P@P(�(\n�@P(���R�U�ZE�ZE�ZE�J�*4�������(�\0:�?Ρ��\"���:D\\��e�nh\"c�z������>zvWݓ�8�0W1?������e}�?8���u�O�碏xq�Ӳ�~q���������E5kC����\\PE����ʔҚS�Jz)OE)�=��ҚS�JiE)�=����R��SJz)OE)�=���R��SJz)M)�4�Zj\0��zvW���=4z8�\0�D�4MD�4MD�4MD�4MD�4MD�4MD�4MD�5��^ ^����G�;�����I�\n�Q�\0*x��{��Ga����m�v\n�����y�3�+1g\nP\'0p\n�ܠ�P�H66BlokTN�&l���d66��T]�������X	�����X	�����X	�����X	�����X	̮�Ȁj�7�쭍��V���E`�e$�@�Cc[>~��Ice,7���\0/�������Ϫ<=;+�E�����U+#bE��J]�k�n�*�*����<��^]M�^�A��ޤ���\nm�77�Rpq1�d~j��5�S0Ңa����l��\"K���x����b�ϘY�V\\��$�ݸԑ�b��n[P4�R<�J���\Z�j-�28E�\\<�-�������\ZR=���i:5����N��qyǤ��z(�\0�x�XLL�}$�~���#�i��$Yۚ�[]���ٽVҧ�\n������ĐH�\'p�Ԋ�.2��ǅ��t�BIA6\'5��	����ff���5*�1$�H ��n3H���@��w�)l����z��>��\'�ٙ�ɨnM9fʪ.nB��V��F�)\"�mC��5�,IQ%��k��9�k��Q@�cYM!��M(5u�S�R\Z(P�ý�^�������c�]���+$.��9�������D$�~>/vH���X�@�7&��-�is���{w��e!���-�bݬ�@��~AX�.���Ԋĵ���֥2\\xw���Mp8��Dr��m]�,��H�;Xq�V���5�2������P�r!\n�S��况m\"��$Ǜ�+<�NkHo��(���(O�+)���\ZPi�XT�5�\raX�0f�!ƅN������d>qσ�z�\0���\Z��0^h��q|�6�B��$,�%�5S�5�fα���[n7.>�$ѹ��4��?6���A��wlH�盀�Kpy��C��gG�L���X�Y�+�H�%O��Y\'����F��o�<!:X0pk>�-�����j�X�ϴY�¡jR=��xPQ\"��P4��+\r/�vҪ��\n�?���`���M\"�:���V2kp��g;�Q͟)�c�\"���-rC��?PW���w�x��ᡳ\r*}�`h�A&e�D9Y�nԒ��8�[W$�i@�SfR,A�\"�\0�����c�2�M!M�r���E�c��S�#i�|�>j��K�4���?�K�)1A�$�@��{���{��� �\" �b���bHH�p/��p���-b.�v:������Y���nke�&\",���\\��5>Ԋ6\0ad 8�mK!\"vv��xմ��z����Bi��TT+�iAǰԇ��n�џc��L�ݔf�#C�\0Q�i��\Z�㢋\Z��7�A�U?C����ԮM��\'��u��jh�ۥBH�]iX{E���>!\\S����Z��9�~��C��<�I��kfFd\\3�3��g�5a�mi՞$�����\n��&_Y�z��4c�]r.]mm|O��E�8��[�*S(����O��%K�ꥊ�RT�ut\\��+T�LS�����sj���gV%rySf���(Y0���4o�����r`���Te�\"�F0��&����c[|M#@ZX$D/l���\"��\r�= T��%�j��=���e�a�H����[3j�b�lN� O+�`*ue`\n�� ��j$�\0�[�J��=�S8��،���^���O߉Ml��̕*?ݐ7�+*ԋ�5�·���bɀA���Va�4�R=������Xx���?�,���~��y,\Zμ�~*�R��o��Z��9�|U�#�]����J�pl+����WN�.˜%Ge� J:O%`$e\"୍&I��pmq}�����_�u�B�r!����\r�;����) -k-H���G�u��f�Kp��`zho�1z�yqF@�E�����XQ��F\"ߠ���O�3�d\')}Yt��H�Q&t\\;{�\n�\\�&��.\'�V�8ϣO���L�ĸ�f#Pfa��XL?�;G.I���0QJb�)�*�X8��1���&.W���`�S,��s$�[)0��������S4i�#N�H5���+Ҏ��o�� ��[=?A�W\ZqR���k	�o�`vV/�9���\Z����GeK{ݵ�E����n�#�sֹ!�|_z�\0�|1P�X�-�]�����9��xͫ�[��JQ�X�th7XS&ړs��Ć�V��$R�	Z�G{ôJ�&-����zV�B�\\�M�iJ���\"�\r�,.6c3�P���ֳV��{��o�H��ہ��[NDS��$!G%�my}�u�i���2*��skg�?�!���xD�g<�\"�ha�Ќ&;i�i���bMV��+��Ä���b�l�nI��36��.f�1O�	����c1�,q�����^�vw��?��	�O�ų?�c\\�\\�\0�~�<g��ҹ!�|_z�x���|<7�*�(9rԼ\Z<p�}�A�j�	9�	�����fBm�4� UR8Cp2\')>%��po��AL��\Zx�D����(mR�$k-�C��~==u,�^4:��\0CGA���	��K\0]���7,���{q�!D�l�6R�<\"��/��G+��h�դ���k`�_�Q�G�����sr�+����!$��MN�՝�yzg+�0�\r�*��R2gPU2p@\\.�sx?�P�I,���!��5�}M*��Nr���ץ�{ܷ�?��Mr�ų?�o蟳�sֹa�t_z�~5yk+6Pt�\Z�\0���TI�i�g�����ȏ���!�cj�xv���Of\0+gG�f�9��cu:���F�f�m����Q}5�nJ��m��R3f�V܄F[>FB��Z�0�)��|\0i�Տ�f�S����j.���rNrI5�N\r!�{6���m��VЏ���m��VЏ��\0ұ++$��\0\"�/�S�A��R/MH�4��N�\"�zE0�/D}NI>Dn[�f�冢;��z\'����X|��W���w��Z�H�:�xE�{�x�R�D,�t%hJ�K�F�!���Ը�qeF�PA���AI �\rK�I7��<G���4�2�`�!`��[�5\\4�\"�:��C����qW2��(��,Q�K���<�!�4�b|�@�ьJ�l��r�.I5>vw��9l@,55��9���&�(ܖ���y#�i�a) pnZ�\0H7��	e2�.l�mkh��A��r˕I\ZYI�o\\K��jB�~/eaߢ���Xg�3����z�N��N��N�#��p�ܕ���,	$ﭭ��\Z�����1�*c�1늘u�b����~Z��6�����D\\A~+[-m,~���V2�_-c\"���\0J�G�c���O}�����?������Zڋ�!��x�^�EV�(��-r����b���u�����N�ӆ|�\\h<_���5�_��CM�G��X�\0�p����82G�����)��U�gE�=��5��\'�Mbqm>�dn\r�&_��`�J�e\\��lԮ�g���(E�֙2T��DC��QЇ3���qA0��c\'����aK��H��E�;�&6b��/��-�5���ϟ(�l���*as�L,fVkfmm�V����`MzQ��8�O��n1Cv˗�W�z�|G%s��XPW�Ӱw��ek��cm����:�	-���\rI���dk~ӂ�Wq&�4�x.eg7���ŧ�12*���Sqj|\'��\\���րf��j�֫]Ŏ\n�]J1j�(Ǖ*�.l(�ԣxՕ|\r,���ԣR�9��w:��A�Ǖ��L��j�������$�O��`+��7���>����O��N��C�������`�\\��z��鎃($�$�`	��g���ksťi}�ҝzi\Z��;�k��\Za~��Z=�(R�#h�r�ڒ�j�X�ێ!����\Z��J���R|\'�s�����qa��k�>�=+����A_wN����:EBK�\Z�̋��2�;�x�:���q;\0��гv�(�#\0-\"�e�q�\r��n�&��6��2��T_+���V�h�WX՝�ma\'+�X�a0�F�C\Z-�N��������F�����f�g��I��M��\".@@�-{����dE#+e�k	�=�I:K�C�ޠ�pEG��6\Z)\Zا��\rG��\0V�1	vk�<��q&Z�x�V\0���XV���;�YI��σ�Ir�g���Q_�����4�D3s�&Ըӆ��q��|I&��cI�?�=&��\0T������IG��Ɩ`��<��z����qa�?���\0�r��T.}�MG���^���S� \'�cC~�1��`U�?�\'��!_���\0S����k�;��s����������t�YF�~��u�O�S����c�>�p�l��F֕D�Ea�6�N�$�+��7�p��l����-a$�ᄒZx#WSp���Z����$/`�	��&%�U����I(�*�oe!8��2�ʺ.bO��	���}F\0��e��a�6���X��#0�9���2�EpBi�R�y\ra�1\"�#���h�`�Y�\'R�Z��FL���Np���c�	� n��[q������^�vx�B�F��+	)�\0��o�r�+\n�Y-�j�`���cз���D��j8��\"̚��޹&=�`���\Z��5�vL��<\ZV.f�\09�}����N���	�-PXI�bnE�� ���|>q�\0\'�}�;~2Fs���n\r�Z!rP1�t��3��B�[�4qJ����M.���/\Z(͠�(��\0OI�G��ŕ�3V;4X�T�M2�Q��H�9EC�y0�8��$�\"\r��٘�P���K�lׂ�y�d�V�j��ڟ�h�s��NXs<��_��>x�gn<��m^�~\Z�B�G�S%9>�HƢ�5�Q�+X�o���NG#9��\"s�c[�V�:�c�*�!�LG�Mb >���G��D*A�E�\'�B*�YW�*g�OxW�� ����Z���������`�#]���uni;[r�&氥������V�B+\nO�M��I��z�hݑ�n.����p~\0R�� ����D\r�Xho��=�(�좀z��a�Ҥc���x�����4��Ƥ���\rC���9��֌��\0���`Ec\n�L	.�t�\r	toQT/���\\�|��O���v�;�|���a1@0�n�)e���!�F��5���nFs����$2\rNl�Z��$�rO�\r`�Y�+n7�Y��G��($�A��Xљ�=@Z�Π�7���\0�-a�@�)�� �ú�h�͸;Qa��Y��E�74j�yll�0����Gt�%œ}�#fceUk�y\0�P�x�D���$b���k�K3Xek�+�Ϭj�;�|x�F��bZ��SK�f��O��-zH{[�?�����\'`��kjBTq���/�qr͡�V/���VX��Տĩd�2�f!�@5-9x��\rȱe�$�ª��q\0�Ո��p1���Q���ΞMbN.6ز��B�\"�X�ZI�ǜ�<���&����.�<A%��Z�G4X�b��T��Pag;Cr%��[�_쨥�LXW\03��N*d�pB�69K~�9+H�G�Usf#��㨋KX�t]lA����@����X��\"�X��H���QX�����H��c�D��2�c�ke)�n���˾h�0=��jo�Z�������Q_vN�ߌ;G{)6�ճ���Q,d��U$��ǘ�17���4pr�A\"����W���jEi[f��B�\r\"*/8�\Z�vUkڝ�<�up� �/�6�K{�\r�\n�I�;DV<�����88��U�b&�-f�\Z�h5�Nc	�&M��S]\\0w$\\�6:q�X�G\n��28�e�#Dn��mc���9_�z�*Cý�q����^`{��>/����!�o8��E}�;a䗃B�Iʪ.I�!]s!�/(��<\"�ߖ��L!�����>3��C@I%�%`�m��B6��/X�\\��s�BA\Z֗�aΜ��E��\0��r\0�`Uxޛ#�͉�c6M	�\r�iPM$�}4�F�Ĵ���jH^)6F.w�	L�\ZH���j��2Ě;���zXARD�18�� �T9s�5��o�0�	Z# �w|��$jH����.tEʦ�rX�b�\Z���*�dlH�br�1`|3>x\0�XX2�RNS���I��{��4\\�\0����4|w9k����q��-}�;A�3N��Xd*QЎR���GhT���3\08�4.�M��*yxS\r���k����v1g	}tԝk	1Ck0C�PH\n!v�l�.N���7!������uF[n]N��	�ѣ*Hb\n�F���7��{A��qG�\Z�F�<�<�	p�f9��o.dQP�ǌ|<�P��#z���8<*�$l�s\0P0�dH���!�\r�Ks��ydUE�  �#�X\"g�	K&f©q�H�(�n�Q5&�W\0f0>dtʚ�� EE�\0\"�\n:�^gR�Ɇ�xQ9H�&��q�K���4���\\/�[�D4��B����^�\"H\0��.{���ӕ��n����a�x�eҐ��������ezH{[�9�~���S�w�\0	�>�ǯ�>��-��嵯SY���]�V5���@�.�uLIA(��7Ab��M�c�ܰ���rk�@�-�����b]\\�d,7� *r�Hٝ��~��%�YW.���O�G[*d2��Ȅ�ղDX|*E��1��\Zd�KV�ړ�޸y��7�َj�2S:Bg�\n����䗮徙W+��b (	�Z�11�t\n1}���D����A\'��p,X��v.4wRPcpȅ7��Z�\0���xRX�0[�+dKº��ĩ�\'%lII�\0��M+a4�)�6.�Cm�k����\0͂�#ҕ��G%�-ϑ\\�\0��\'̹��^���d_�+��)U� 1�k��`�F`7\nTPs������$�\0RI���l�pl�ӷ��\0������bVq3�D�O)���G�V]w��\\Sa�g0J�5���kNT�l�\r�;Wu\\T�M\n��h\"Y$�$�V2�篾��u��_�|��Kk�ǣ���Ꝃ�=��*�d�.n5����ET{\0�H�wم���i�����`�$u&T�<��hE�(�Gx���!�9xA$��\\F�@�=�����2��d�8u\'@54����!��)9M���D��1g����s�qcX�d��J5�&S�[[8��C��J�0;��`�E�yi�h���\n�ұ���4ϡ�B8���8Y�f�r�X,�F���g}wݵ����U��_�|��Kk�Ǣ��V�꽂�ƹxI��G�I�D�˙fRH�w+��\Zˆ�ς�,��5�L��*��9\0���K���duV�!s��C�khA�eUб\"���ܕ2K��\Zy\'��=\Zv����W�aI8x�F2&Al�w��o��Q�0mUw\0^D	�m\"C�$�,�&%�.Dɑrjb�bRY�|ʊLE��e�k���8��1��9��E�)��	C�*LO�z��ޱ�B(��H�r��`S[Sj���V.oڵ�Ӽ�i��W?�q�Ӳ�,���?�Z���\"��\n0 2���`w� ��@\0\0��P7Q�`M���t�4���[�P7�ѓ\"��Q�Dz���4��i��7A�~��~��n��~��񧕧:��:��:�.��.O��r��u�����[W�Ҷ�ߧ�������k�S���mp�4}qM���\n����E+<R�cSG��ߵm���\"��(�\"��(�#�EG�|Ϟ��`�8�1����W�V+�fw��\n��\\���:SK�g��+o\n�x��\\(�r�3��*��f&�%H����gQ.�\":XH�����!{\\�lY\r�]Ƣ|�	Q�@���sHN���e���4MD�=�G*��k_y\n;hj���ɥIH��l\"�X�&<D%�A���o`r��*(Ǭ�a�5�ī�s�-�x6�\\�����Tؘ1X�$S4��\0\\\\�\Z���F0K�:\"ۂ�2�0a��xN#4����6�:�յ`�`�a1�G,S�i)~���˕:�=B��\r慘�K,I��`R(�1*��JY��.V���^��ݕ���mOy��8�P�ٵ�I28�6���΃���m�G�`W�p���M�[0�ץ��������@�p�`?tT�A$�pR�6d�bQM\n2E��\0��\n�&�l?���H!7�ƪ���X/�a�E�l򙥕�����U��V ��6�n��SX�\\^Ƨ\Z�$�_Czċ���Pu��\'y5*tԩ�*u�L�aS\'XT��2u�M�fW�)�X�g`Ē��|��+�������8f�@�[���h����F@B��8�_v��v	�sL�J���o�\0�G�d9˳��z�a�I��6x1*�7��?� �u��b�E(M�9�EЗ�;��4\r@�4x\Z��h\Z��@�4\rJiM)�k\\kk�ƃ��k{�b�2#J�	$G]������b��\\CD#�¶�-�Z���pl����r��$ t��/��� ���6��ʊ��r�\n\0\Z��Q`�mp�\' \"�u�`�8�	��^�>F���~���@����S��+k�\\DA�Ђ��H�]Z<<H�,��7dQ�*h�\0x���3�±*��0�$��7�?�>���@��B���L�k���Rtu�O�y�/�>P+6\n@��O����;��2ap��Ch]�0�۞Mb1�E�l�r� q�E4�\r��%�������x|��/�+Ч��\0\0K\n��0�b��B��I�$m�f�d�YT`+?H�����+(���X�,��ɯ��T�}�\0��X��3-�Z��$\n�r�l\0 �}Bյu�}7^۷�2|���@n}GZ�r,�_++iə�\0F����i9���߹����*o-�{kiHM�����پѸ��k-�����cY���я�N?Um7�؃`EmK݅�q�k� �*�@�\'Mk-���ߚ�q�Б.78�G�X���\'A��+h�����cQn+��c����������-|��Տ�C0\r�8ڶ��˫�%��\'m\r�̎�(���X��(�O�X�W7�u��3C��9п�|����*�	&��GkX�Z�中�w��\"��[Dg]AJ��S�[@�c���5���_tw�F���\Z[Y�5>�rV8��𐅽m�b\0��khd�0�[��sǘ{Ec� \\X���\0\"���k�\'.Q{�l�Ӿ�C/���ǌ�^�\n�\\m\0�{+�f˼ߌ\\n�R�+��Q�.RmX�׽�m�)�\0ϫv��0o�V6 [�+[�nZƠ���Q}±�t�cb��`>�+Rl\0P\Z�$�b<E���\n�\n-bݭbb�B�Q��-�@��bK�:��I��i[��.{�\0A�R�V���{��YJ�pO١	̶ ���àf�W��Q�5����ok�ny\0Qz�G�\"H3�A�a�e#B$�B!G�6Q˞�ޞ)�h�2���T\n$CpC��z�$[�ȮW5���kS.[G�כ`t��5�w�,Y���P!�\"K��C�Nf}.2�x�qV0#C�o���F,&�\0�sc��FV�E�tu�#����\r$rL����d���\\4d����m�4���ɓ.Kz����Xu��=���G�&l��� �hs�\0�Q +�3��}�6}{�4rN�0_�CXxK�ŮJ��Oa�{��*�L������oS����Da����|�bu�\0)����bnx�\'SI$\\����\"��Q	�\Z�˖��^�$�?��`�p͜{X�z��!N��^�RĨHAQo��ے�����r\0<��j,;�l3�Ƣ����R�� �����Z�~5�BU� 3B/�.�s��0��\'�7�\r��#N�����L��)�Cg$؂n-aL�)�\\��M$y�%�$\0������\rOᲷe�X#�a��\n��sk\Z�6T[!�\\J���[�����F62-�);��奊VV�,�B�������Ϳp���a�Vaqq��\\@���	\nm�Iҡ�t��E:��{�֟��Y9�?ٟ5�$Q-٫�A�1s��>�\0�YNS�77裆 \rk��&�7-�u��XPr����Vj,t���*F��=���{���-ɨQ�T1:.sPő���搠ް�#���d2H��\0�}�\0k}��t�\n�Fa��k�o�@�!�YX��������`dզ��IV�b����k\n����K�\n�|�6���V����DE�܂�t�\0	�.c�.���Kȁ��m{�f۷���ʳڐE�$;)�s	QM���Յ�+�T� F>�kq-a�bk���,2Ix�le��ϩ��i\0Y2�����R�0ǒ5���-m-}M:��-�)�(� \\�V%!P�pl\Z@��:.Z�Y�\Z�4W���;�;ְ���s���p��$�\0�>6lâ��RS���U��-}m�G�2�Ρ���[�\r(y^ږ7j�-���~�L��9Ԕ����Xx���\04�EH�i{�\"hz�E\r���h>S��%�\03��:�B�\'�4�����a���l@��U�,o�jR���,@���{{B�?��2f\Zf;����x�A�����\"����[���H�4��Qa�M�l4��ti��M\0��;�=ᾉVR\n�6 �A�F:\03��*�Ǚ����\0�s���_���E� V\ZĨ66��sX}��t����?�&�{)q~u+�-a�pH��߼�7B� ��mM.��\"ưlU��11gA���Z�{)�^0�L�7��scJs��~T5�����ڰ����O���Q�\"��Q��V�(+��l\n�\0�?�|iW�����;uҤn�T���#u�����=t�=t��5��kD�֋uү�JS���\0�iP/ڼ�����\r�n�����}-�H�-f�%��loJ2��+k� �@ߍ�I�X4{�\0\0)6���u�)G�{�.��Pުr�I�#s�򽆰�u�����x*_Q`nj��ժ\"ɜI�T$��[[�]�˭A�ݻNJ�K�@�j����*)Yx�`	�> �;8�.%�S亍x����J Q \n�ߐ�4M�vQ��d��!���\0)�)5݊�~�����q�,i�A�(��{^)#;�N54��Q�9Hާ��0�F��J1\"�/X�%�%��I<f�1u�ba늞?��0�;▖���\ZCHi\rFj3Q���f�5Tf��������������������/e--%%%%%%%%-.����!��!�4���\ZCHiiihwȢ:iצ�^��D=�c �������+�J@�\Z�����(0�,#&i��|:�e�\Z��ٝC�Wv[3�~j��f���Wv�;ݟ��������ݮ����l����껷���������p^�|��������{����wu��B�����]��}Ю����Wwxot+��/�Z���ֻ����]��}Ю�0��Wwx_t����\n���w{��K�Ww�_t����\n��\r�����Wwx_t+��/�_�����$ϪI���kol��1����c��6Z!a��\"6*����/�]�a�������-ww��K]��������/�]��}������\0�O�����������k��7�_����{�����~j��\r�������~j��\r����p��>j��\r����p��>j��\r����p��~j��\r����0��~j��\r����0��~j������0��~j��\r������~j�����p��~z����]�a}���ݦݯ�]�a}���ݦݯ�]�A��y�vn�4�J�B�PA��lhs����7JS�	�>���4��c5� oz+k��e��L�� 閶�2Vч�J���[B�+hC�\0�X����c��:���u�!�:��\0c��:���u�����\rS�����`V1x��մ��h\'CV�N����\r[A:\Z��t5m�j�	�մ��h\'CV�N����\r[E:��t5m�j�)�մS��h�CV�N����\r[I:\Z��t5m$�z�I������i\'C��N����[I:��6���~�i�C��N����[N>���C�ԇ��j����a�mhz�Vև�%mxz�Vׇ�%m�z�Vڇ�%m�z�V܇�%m�z�Wt�%���K]ҿ���L+im)�d��y^_ɍa!�1�c@���\0����\0C\0\0\0\0\0\0!1AQR�0a� \"2q�#$3BPS�4Tr���5@bds�����\0?\0������������1�i��hC(Z�����.@�1r���-L\\�j\"�Q Z�y��r���-D<�j!����g��.� ]���A�avh?,.� ]�@�4<�vx���r���-D\\�j\"�Q Z���E��.@�����5�oq�H�n�X|V�\0���+j-V��>���\n����YY[� ��ӹ��N�°#\Z1�ŅaV�Y�>��<��\n�`����CI�T�D��Wf���_�+����/��jw��\n1��A����&�+͛�x��OP�\\�$\0m%�G�;:��Aú�Q��R�U�Z�S��|$nE�\"dB�B�hw�1���8���s�C� ����d\n\nReÛ�Z����1�� A\0������[����n�=K�ڪ;W�]n���[`w���G�]K>kR��7К�h��ի	�0��o�!s	,(��U��?���AR�:���4|��Q�R�-(����hq}�o���E�b�MǴ}S�Y3�k�%>\Z��0�>�:?,��$*���)�-��h�^�H��\02�.�� oٚWeo\0�3x����#!��q\n�	�\'a!K\rU�/��c���)X/�������<��B�\0�S����5�\Z{.������?�Si)�da����8��CM�F.\r~��6���x�\" �\\4���.sETE��5�.�#Y|��k���{^ �-��4}uE0�	A��\\Ӵ�\r�U�r����Zv7��\\�5M�dx,	�3�����S^��)̛��:��ubBߢ 4�^���[ ��A�3�����7U.c���l���Z� #ؒ�\0tfx�Wj��|�5p�A$e�\'8��HU�`��hw� &7����C��Loh�̃oZ��1�\0�S6�c��dŕ��ćlށ���2�`���G��\"�ȵ�@�S��-�ĭ7+F������bFY��[�z�6ğ#]{�I��=|�}B>����2�*�e!�\0��>(��4�E�{���HNt�d��b��\\f��9��D���w��6��<%g�҅����#�+H��G���D�3q��J1�6c�C~�G�0=�;yQ���Oj�<]��,N�V�ߡh��6��3_�7��D�-�01��?��*�������s�e���P���F�����w�̣��_�\0fO��Ӷ�m(�*�\0gO4;��G<2:�k��o�k��|l2�q�@\0���YH�5;j^Z�\r�q��k��\r����ʏ���G%A��4��kme�@�e�nU`v�_�U����d���,TL��pj��ocq�H�ibqq��n����h�y܆����QE��)#y˳7X}��B1���E��w�T4[	�<�/�����9����$����\'QUG�����РI>��Ťz������)�{��Z	P�A\0\"��M�k���psIl+���s�hK(����2�Os\ZGi�c��D������}����1k�ó?�5�yON\"�;$��\n�}�y��4���(�� 4�����2��\0[g�Z:�,��v���y��)�[�66R��\0H]��#4�HgM�[M����c����\nx�JY�m8e���2�E�=|�ZSZ������5����\Zv\\�\ZO�.y���y��C�n�^	-��V�c��	����\Z6��wS�`;u#,�S�(���jw��C��cu�C�|Dci..=g�F��G#6���=��aF�\"nK�T����}O$.e�E�R��K��6;l��&�È��|�1�iB�pZ��Z�,l?t/�;���+��,\Z�\\�������g\n�\Z���u<�6N��1���5���Vӿ���SHc�W�|,&�\0�t��u8%co�������G\r/el�/�A \r�*�\n�����T#�l܌H[l>5Lyx{�A	��C���.lp�ɵ��8݅��k��#�5�7����55O��s[�����,}|Йk��x��1�>��\Z=�){+]v���g�$.7%�Ug������5�s. �\r,�A���s�RQ�5 Gc�5�q������Ɵd��Oqq&���[�檴L0ρ�A��p%�c�Y�vd�([G ��v��no�Q��3ڬ<<TL`�����ѷ��?W�����rk�_e�	��N�>��\'s��Q%+�T~���}�c�iD�-30:����\"sC��T\rcۤ�iά0�wa��T��#t�1�{���6�iZq3�[��dVs�o��F�8�Hf }��֪��#�,!�Y�m�憍�������W9�<V��i4�l�hdń4��r��M��`0?s��|U=<��� �!�u�@��,E5�J��:o�J/(9��MI��C���72�:z��6��\0QM����Æ+��7��Zs�6_�g����ߚ�Gk�o�ha)�n���;􅧄�*-f�ɷ����DMv`�n�*S�@�U�+\ZƵ��z.X���*����*Sj�s�Vy�\'!4�#�y�m�E��m\n�4t9���E3F�2���x˽�V�p::\\Ǽ�4�v4�	��vvq#g�-��uELs�,�A�\\@Fz�7�b����wT�#ȹ�$�T�Z�+�+ⱎ+ⱎ+X8���cV1�bV!�b�*r5N��F^����+��=h!k߮�T�>R�L���%�xm{\ZZ�1����!|���\n����xO�w���+�nښo�q��?�YYY[�oſ��\0D\0	\0\0\0\0\0!1AQR\"0q�� #23SaBP����$4r��@Cb��������\0?\0���U��������������������������������P�{��c�kd�+Z�b��s����l��kd�+[\'1Z�y��K�V�^b��s�����t��k��+_/9Z�y����V�^r�D��t����s��%�+_/9Z�y��I�V�Ne���k��Z�9���̵�s���E#��%�*�xwv�Y�_E�z	WWX�%�bA�9��C�\Z�hG�;�7W�(�Nѐ�Xӽ]�,h=���bW�]�j=�G�tд�Ұ�.�O���t����S���\00]\"������e��gX.�Ok��A6x@lђv\0�J���D��?D^��]�-k9�5�!6t�Aރ�@�J���G�QOv9�*9^^\Z�pO���kj\0f,��V�NR�r�(�\r���+�?�ܞF�^���<�nr���Q�Cv��o�V�S ��Z֝�x�J(�Jr7	X��m	�vޡ�m�Jd�x�+bTμ��G�����Ṏ?�ey�\r.��2z��z�W����!b�\"�D�P���,A�A���hv����B׵��%�ꦣ���,���ZRv6�`o��}51�ߒ�\n�D!Y�\05\'�@����Ӽ,M���i�sY�`��SOv�������l1mX�T��>H��RH�����%��:P����+X����<R]$����7d������ÈUz\"�\ny%RZ/b�?d[k\\i�\r;?�Q���@�\\C^��+A��B���Hi�V�?gX�Be|T�v���;�\0�{瑭s\Z>��,��M���N��:.�c1L.g�s�m�\0u��F�-˜6���+XӲKw��WXK�J��l?��G�F9�j!�o}��L�\\��dɜw޲�;h	� �T��>H��j*�Ѷ���%aq;,wZRxd�sEE4�X��n,��| e�P�;h<Q�8�]��m����j�m�\Z���Um�=��٘j|���x~+�a���F�����8^���d�����i\'&��9\'=���	��c��|<�Ӯ���\0q���!��W�G	c>j9�m����!w��;���2m��HAO��\\2��ЀT��(��j*�^�q�7y-ҁk�FA����8z�Tj�p�	C�/̟���s�*��\\Kr\0\\���y�\r4���3��r6O�V�-�&w�q�_>㒣�fR�N�i�-<�Z_��\0)P�Ms	��-$K�.JF���(��5����:3�w�3�MpQ��!�⚇�����mEN�$2�ms!RQ��{�`��I���\Z��%Gl2[���w\'� �Yo�/�j���iv��+ ��j۴�]�zHÛ�-پ�UMW&��׵�aK����HU::�\Z\Z\r��_\'#Q��5!/+Q�����I����0��3\'r��Q~U���������k@{GT[h\'�]9��~\"�D�\0���Q���ӑ�@��ݞ(�����;\0�Q��#���6��Y�F�r�Jk\Z�u�\"�\\-D?-���a+�,q��r0=�NeR�ԏs�ɉ�%���ұ̒�W4�Ă���v_$S�(���;ϧF�觏He�\0+��0�	�������o�=�EJ�doe퉤~)�K�7>P����i�ϭC4e4�Q�#�$$���/����E=<��\r��nȀ;�u�\"�m\'I�c��0V����s����I�N��S�E��yyuD�y�,`%�#��iȣ���d\0��3�Wn�/�����M���9�9��\Z����&8F�	v��Z�8[���\'{�?�\n�\rcd�_�0�����\"{������``�$�Y2�M��G�sȱ����6T��7��#�\'DZ�[~���}�jM7]Ia�W����s����5�c��veMQ%5Ds�ll7�&�\0i7#�kx<Ӣ���H�OO�\r}�\r�Qh�x�kێ�e�ґ��ɰ��3���{�4���G޺����v\\#�!E샆�D��Ч�n�y@1�`,mP��K\rq��2U��BkJ©G�g�=�ڊ��K<1�loko�l�t-5�\'�����7����]^��m�.�6�l��B��3 d�q����w&NKC�D���6������ћ�i�EE͚-s�_IHXa�9�f~�紣����\0��\0%t���X\0�y��%V��2xy#���\"М�AD\"\n!ȱ�2�W�O�_+��\r��(�\r\0\0�@*o��{@�c�ǵ�6sH �B�����&�����=gi�(4��4�%�G1��	n�Y��t�!|T������Y�d�<4��!M�f�;d�x|�\r���vF\r�mǊ���4trB�:�v܊U.�{�/�7���Ucۿ���D\"�Z�Ł֪�m=�)G�Cw eN=�|Q���\'W!p�\'a���ă\rߙ=oZ�χIO(lnkA�i�*�F�ʇ<�$�����k��1\r��g�Z�\\�%.�d#�t����#3��Y(�\r<O{:�\0�3>�FQO$m��	v0I�N<ɷz�I�LN	�qf���U1�\'4��G�z!�(�aE�ƵE6$����=0j�{@��=� �}m/�|���!:�fǬ-6����k-�|��$(k�����^�\n45�Ŧ�lCh�V�1\r$�e��o�І3-f�e���MxoX�\n�{W\"����`A�1�ՅYY\0����G�*�^�a�7y-�*XC\Z-��������r������O� `��;����}�y)��\\���l}F��v�y4�^e͍�� ܇b��+I>AP0��5�a��t��E��uTA�<�M�\'��{W++	ఞ���Xo�aXJ�XJ�V�T �\Z�j}��*�\\���pj�m�\0���7�^�@���s��`%����6��~�=�����˳�\0r������+�������������WW��]_պ����������\'�O��','mime/jpeg');
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
