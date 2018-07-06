-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sad_church(1)
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_appointment`
--

DROP TABLE IF EXISTS `tbl_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_appointment` (
  `char_appointstatus` char(20) NOT NULL,
  `int_userID` int(10) NOT NULL,
  KEY `int_userID` (`int_userID`),
  CONSTRAINT `tbl_appointment_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_appointment`
--

LOCK TABLES `tbl_appointment` WRITE;
/*!40000 ALTER TABLE `tbl_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_baptism`
--

DROP TABLE IF EXISTS `tbl_baptism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_baptism` (
  `int_eventinfoID` int(10) NOT NULL,
  `var_parentmarriageadd` varchar(100) NOT NULL,
  `var_fatherbplace` varchar(100) NOT NULL,
  `var_motherbplace` varchar(100) NOT NULL,
  `var_fathername` varchar(100) NOT NULL,
  `var_mothername` varchar(100) NOT NULL,
  `var_contactnum` varchar(13) NOT NULL,
  `date_desireddate` date DEFAULT NULL,
  `time_desiredtime` time DEFAULT NULL,
  UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE,
  CONSTRAINT `tbl_baptism_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baptism`
--

LOCK TABLES `tbl_baptism` WRITE;
/*!40000 ALTER TABLE `tbl_baptism` DISABLE KEYS */;
INSERT INTO `tbl_baptism` VALUES (6,'heree','Quezon City','Quezon City','Ebrada, Fidel','Ebrada, Josephine','09277475753','2018-06-19','10:00:00'),(7,'asfdasdfadsf','Quezon City','Quezon City','Ebrada, Fidel','Ebrada, Josephine','09277475711','2018-06-19','10:00:00'),(10,'thereeee','Quezon City','Quezon City','Ebrada, Fidel','Ebrada, Josephine','09277475753','2018-07-15','11:00:00'),(12,'Manila','Manila','Manila','Julius Ignacio','Raquel Macaya','0905 257 3106','2018-07-15','11:00:00'),(13,'Manila','Manila','Manila','Julius Ignacio','Raquel Macaya','0905 257 3106','2018-07-15','11:00:00'),(21,'Manila','Manila','Manila','Julius Ignacio','Raquel Macaya','0905 257 3106','2018-07-15','11:00:00'),(24,'Manila','Manila','Manila','Luigi Lacsina','Gracia Lacsina','09066565747','2018-07-15','11:00:00');
/*!40000 ALTER TABLE `tbl_baptism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_blessing`
--

DROP TABLE IF EXISTS `tbl_blessing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_blessing` (
  `int_eventinfoID` int(11) NOT NULL,
  `var_blessingvenue` varchar(100) NOT NULL,
  `var_blessingdetails` varchar(100) NOT NULL,
  `date_desireddate1` date NOT NULL,
  `date_desireddate2` date NOT NULL,
  `time_desiredtime1` time NOT NULL,
  `time_desiredtime2` time NOT NULL,
  UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`),
  CONSTRAINT `tbl_blessing_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_blessing`
--

LOCK TABLES `tbl_blessing` WRITE;
/*!40000 ALTER TABLE `tbl_blessing` DISABLE KEYS */;
INSERT INTO `tbl_blessing` VALUES (1,'here','Surgery','2018-05-29','2018-05-29','11:28:21','04:17:28'),(2,'there','surgeryyy','2018-06-27','2018-06-28','13:19:45','04:24:10'),(3,'hereeeee','surgery nga','2018-06-03','2018-06-03','11:58:00','12:59:00'),(4,'there na lang','','2018-06-11','2018-06-13','09:06:00','02:06:00'),(5,'asdf','asdf','2018-06-03','2018-06-03','01:11:00','01:11:00');
/*!40000 ALTER TABLE `tbl_blessing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_document`
--

DROP TABLE IF EXISTS `tbl_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_document` (
  `int_documentID` int(11) NOT NULL AUTO_INCREMENT,
  `var_documenttype` varchar(50) NOT NULL,
  PRIMARY KEY (`int_documentID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_document`
--

LOCK TABLES `tbl_document` WRITE;
/*!40000 ALTER TABLE `tbl_document` DISABLE KEYS */;
INSERT INTO `tbl_document` VALUES (1,'Baptismal Certificate'),(2,'Confirmation Certificate'),(3,'First Communion Certificate'),(4,'Facility Permit'),(5,'Voucher');
/*!40000 ALTER TABLE `tbl_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_documentrequest`
--

DROP TABLE IF EXISTS `tbl_documentrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_documentrequest` (
  `int_requestID` int(11) NOT NULL AUTO_INCREMENT,
  `int_userID` int(11) NOT NULL,
  `int_documentID` int(11) NOT NULL,
  `int_eventinfoID` int(11) DEFAULT NULL,
  `var_doclastname` varchar(50) NOT NULL,
  `var_docfirstname` varchar(50) NOT NULL,
  `text_purpose` text NOT NULL,
  `date_docurequested` date NOT NULL,
  `date_docureleased` date DEFAULT NULL,
  `date_docureceived` int(11) DEFAULT NULL,
  PRIMARY KEY (`int_requestID`),
  KEY `int_documentID` (`int_documentID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  KEY `int_userID` (`int_userID`),
  CONSTRAINT `tbl_documentrequest_ibfk_1` FOREIGN KEY (`int_documentID`) REFERENCES `tbl_document` (`int_documentID`),
  CONSTRAINT `tbl_documentrequest_ibfk_2` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  CONSTRAINT `tbl_documentrequest_ibfk_3` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_documentrequest`
--

LOCK TABLES `tbl_documentrequest` WRITE;
/*!40000 ALTER TABLE `tbl_documentrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_documentrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_event`
--

DROP TABLE IF EXISTS `tbl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_event` (
  `int_eventID` int(10) NOT NULL AUTO_INCREMENT,
  `var_eventname` varchar(50) NOT NULL,
  `var_eventdesc` text NOT NULL,
  PRIMARY KEY (`int_eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_event`
--

LOCK TABLES `tbl_event` WRITE;
/*!40000 ALTER TABLE `tbl_event` DISABLE KEYS */;
INSERT INTO `tbl_event` VALUES (1,'Anointing of the sick','The anointing of the sick is administered to bring spiritual and even physical strength during an illness, especially near the time of death. It is most likely one of the last sacraments one will receive. A sacrament is an outward sign established by Jesus Christ to confer inward grace. In more basic terms, it is a rite that is performed to convey God’s grace to the recipient, through the power of the Holy Spirit.'),(2,'Confirmation','The sacrament of confirmation completes the sacrament of baptism. If baptism is the sacrament of re-birth to a new and supernatural life, confir- mation is the sacrament of maturity and coming of age. The real confession of Christ consist in this \'that the whole man submits himself to Truth, in the judgment of his understanding, in the submission of his will and in the consecration of his whole power of love . . . To do this, poor-spirited man is only able when he has been confirmed by God\'s grace\'\r\n\r\nThis confirmation in the power of the Holy Spirit leading to a firm profession of faith has always been the particular effect which Catholic tradition has ascribed to the sacrament. It is effect which complements and completes that of baptism.\r\n\r\nTHE CHURCH TEACHES\r\nConfirmation is a true sacrament instituted by Christ and different from baptism. It is administered by laying-on of hands and anointing with chrism accompanied by prayer. The chrism is blessed by the bishop and the bishop administers the sacrament. All baptized persons can and should be confirmed. The effect of the sacrament of confirmation is to give strength in faith and for the confession of faith and to impress an indelible character.'),(3,'Baptism','The sacrament of Baptism is the beginning of life—supernatural life. Because of original sin, we come into the world with a soul which is supernaturally dead. We come into the world with only the natural endowments of human nature. The supernatural life which is the result of God’s personal and intimate indwelling, is absent from the soul.\r\n\r\nOriginal sin is not, in the strict sense, a “blot” upon the soul. Indeed, original sin is not a “something” at all. It is the absence of something that should be there. It is a darkness where there ought to be light.\r\n\r\nJesus instituted the sacrament of Baptism to apply to each individual soul the atonement which He made on the Cross for original sin.\r\n\r\nJesus will not force His gift upon us, the gift of supernatural life for which He paid. He holds the gift out to us hopefully, but each of us must freely accept it. We make that acceptance by receiving the sacrament of Baptism.\r\n\r\nWhen the sacrament of Baptism is administered, the spiritual vacuum which we call original sin disappears as God becomes present in the soul, and the soul is caught up into that sharing of God’s own life which we call sanctifying grace.\r\n\r\n(c) http://www.beginningcatholic.com/baptism'),(4,'Funeral Service','The rite of committal, the conclusion of the funeral rites, is the final act of the community of faith in caring for the body of its deceased member. It may be celebrated at the grave, tomb, or crematorium and may be used for burial at sea. Whenever possible, the rite of committal is to be celebrated at the site of committal, that is, beside the open grave or place of internment, rather than at a cemetery chapel.\r\n\r\n(c) http://www.ibreviary.com/m/preghiere.php?tipo=Rito&id=417'),(5,'Marriage','When the Catholic Church teaches that marriage between two baptized persons is a sacrament, it is saying that the couple’s relationship expresses in a unique way the unbreakable bond of love between Christ and his people. Like the other six sacraments of the Church, marriage is a sign or symbol which reveals the Lord Jesus and through which his divine life and love are communicated. All seven sacraments were instituted by Christ and were entrusted to the Church to be celebrated in faith within and for the community of believers. The rituals and prayers by which a sacrament is celebrated serve to express visibly what God is doing invisibly.\r\n\r\nIn a sacramental marriage, God’s love becomes present to the spouses in their total union and also flows through them to their family and community. By their permanent, faithful and exclusive giving to each other, symbolized in sexual intercourse, the couple reveals something of God’s unconditional love. The sacrament of Christian marriage involves their entire life as they journey together through the ups and downs of marriage and become more able to give to and receive from each other. Their life becomes sacramental to the extent that the couple cooperates with God’s action in their life and sees themselves as living “in Christ” and Christ living and acting in their relationship, attitudes and actions.\r\n\r\nCatholic teaching holds that sacraments bring grace to those who receive them with the proper disposition. Grace is a way of describing how God shares the divine life with us and gives us the help we need to live as followers of Christ. In marriage, the grace of this sacrament brings to the spouses the particular help they need to be faithful and to be good parents. It also helps a couple to serve others beyond their immediate family and to show the community that a loving and lasting marriage is both desirable and possible.\r\n\r\n(C) http://www.foryourmarriage.org/marriage-as-sacrament/'),(6,'Eucharist','first communion'),(7,'Funeral Mass','wala malagay si jonaaa'),(8,'RCIA','Rite of Christian Initiation for Adults'),(9,'Special Baptism','It includes adult baptism and special baptism.\r\ntuesday-sat'),(10,'Establishment Blessing','House blessing belongs to the special services that our parish offers. ');
/*!40000 ALTER TABLE `tbl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventapplication`
--

DROP TABLE IF EXISTS `tbl_eventapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_eventapplication` (
  `int_eventapplicationID` int(10) NOT NULL AUTO_INCREMENT,
  `int_eventinfoID` int(10) NOT NULL,
  `int_paymentID` int(10) DEFAULT NULL,
  `char_approvalstatus` char(20) NOT NULL,
  `char_feestatus` char(15) NOT NULL,
  `char_reqstatus` char(15) NOT NULL,
  `var_remarks` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`int_eventapplicationID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  KEY `int_paymentID` (`int_paymentID`),
  CONSTRAINT `tbl_eventapplication_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  CONSTRAINT `tbl_eventapplication_ibfk_2` FOREIGN KEY (`int_paymentID`) REFERENCES `tbl_payment` (`int_paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventapplication`
--

LOCK TABLES `tbl_eventapplication` WRITE;
/*!40000 ALTER TABLE `tbl_eventapplication` DISABLE KEYS */;
INSERT INTO `tbl_eventapplication` VALUES (1,1,NULL,'Pending','Unpaid','Incomplete',''),(2,2,NULL,'Pending','Unpaid','Incomplete',''),(3,3,NULL,'Pending','Unpaid','Incomplete',''),(4,4,NULL,'Pending','Unpaid','Incomplete',''),(5,5,NULL,'Pending','Unpaid','Incomplete',''),(6,6,NULL,'Pending','Unpaid','Incomplete',''),(7,7,NULL,'Pending','Unpaid','Incomplete',''),(8,8,NULL,'Pending','No payment','No Requirements',''),(9,9,NULL,'Pending','Unpaid','Incomplete',''),(10,10,NULL,'Pending','Unpaid','Incomplete',''),(11,12,NULL,'Pending','Unpaid','Incomplete',NULL),(12,13,NULL,'Pending','Unpaid','Incomplete',NULL),(13,14,NULL,'Pending','Unpaid','Incomplete',NULL),(14,15,NULL,'Pending','Unpaid','Incomplete',NULL),(15,16,NULL,'Pending','Unpaid','Incomplete',NULL),(16,17,NULL,'Pending','Unpaid','Incomplete',NULL),(17,18,NULL,'Pending','Unpaid','Incomplete',NULL),(18,19,NULL,'Pending','Unpaid','Incomplete',NULL),(19,20,NULL,'Pending','Unpaid','Incomplete',NULL),(20,21,NULL,'Pending','Unpaid','Incomplete',NULL),(21,22,NULL,'Pending','Unpaid','Incomplete',NULL),(22,23,NULL,'Pending','Unpaid','Incomplete',NULL),(23,24,NULL,'Pending','Unpaid','Incomplete',NULL),(24,25,NULL,'Pending','Unpaid','Incomplete',NULL),(25,26,NULL,'Pending','Unpaid','Incomplete',NULL),(26,27,NULL,'Pending','Unpaid','Incomplete',NULL),(27,28,NULL,'Pending','Unpaid','Incomplete',NULL),(28,29,NULL,'Pending','Unpaid','Incomplete',NULL);
/*!40000 ALTER TABLE `tbl_eventapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_eventinfo`
--

DROP TABLE IF EXISTS `tbl_eventinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_eventinfo` (
  `int_eventinfoID` int(10) NOT NULL AUTO_INCREMENT,
  `int_userID` int(10) NOT NULL,
  `int_eventID` int(10) NOT NULL,
  `date_approveddate` date DEFAULT NULL,
  `time_approvedstart` time DEFAULT NULL,
  `time_approvedend` time DEFAULT NULL,
  PRIMARY KEY (`int_eventinfoID`),
  KEY `int_userID` (`int_userID`),
  KEY `int_eventID` (`int_eventID`),
  CONSTRAINT `tbl_eventinfo_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`),
  CONSTRAINT `tbl_eventinfo_ibfk_2` FOREIGN KEY (`int_eventID`) REFERENCES `tbl_event` (`int_eventID`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventinfo`
--

LOCK TABLES `tbl_eventinfo` WRITE;
/*!40000 ALTER TABLE `tbl_eventinfo` DISABLE KEYS */;
INSERT INTO `tbl_eventinfo` VALUES (1,11,1,NULL,NULL,NULL),(2,11,1,NULL,NULL,NULL),(3,11,1,NULL,NULL,NULL),(4,11,1,NULL,NULL,NULL),(5,11,1,NULL,NULL,NULL),(6,11,3,NULL,NULL,NULL),(7,11,3,NULL,NULL,NULL),(8,11,10,NULL,NULL,NULL),(9,11,5,NULL,NULL,NULL),(10,11,3,NULL,NULL,NULL),(11,12,3,NULL,NULL,NULL),(12,12,3,NULL,NULL,NULL),(13,12,3,NULL,NULL,NULL),(14,12,3,NULL,NULL,NULL),(15,12,3,NULL,NULL,NULL),(16,12,3,NULL,NULL,NULL),(17,12,3,NULL,NULL,NULL),(18,12,3,NULL,NULL,NULL),(19,12,3,NULL,NULL,NULL),(20,12,3,NULL,NULL,NULL),(21,12,3,NULL,NULL,NULL),(22,12,2,NULL,NULL,NULL),(23,12,2,NULL,NULL,NULL),(24,12,3,NULL,NULL,NULL),(25,12,2,NULL,NULL,NULL),(26,12,2,NULL,NULL,NULL),(27,12,2,NULL,NULL,NULL),(28,12,2,NULL,NULL,NULL),(29,12,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_eventinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facility`
--

DROP TABLE IF EXISTS `tbl_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_facility` (
  `int_facilityID` int(11) NOT NULL AUTO_INCREMENT,
  `var_facilityname` varchar(50) NOT NULL,
  `flt_rentfee` float NOT NULL,
  PRIMARY KEY (`int_facilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facility`
--

LOCK TABLES `tbl_facility` WRITE;
/*!40000 ALTER TABLE `tbl_facility` DISABLE KEYS */;
INSERT INTO `tbl_facility` VALUES (1,'Bro. Roqueto 2nd floor',1200),(2,'Bro. Roqueto 3rd floor',1200);
/*!40000 ALTER TABLE `tbl_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facilityreservation`
--

DROP TABLE IF EXISTS `tbl_facilityreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_facilityreservation` (
  `int_reservationID` int(11) NOT NULL AUTO_INCREMENT,
  `int_userID` int(11) NOT NULL,
  `int_facilityID` int(11) NOT NULL,
  `var_event` varchar(100) NOT NULL,
  `date_reservedate` date NOT NULL,
  `time_reservestart` time NOT NULL,
  `time_reserveend` time NOT NULL,
  `char_reservestatus` char(50) NOT NULL,
  `int_paymentID` int(11) DEFAULT NULL,
  `var_requirementID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`int_reservationID`),
  KEY `int_userID` (`int_userID`),
  KEY `int_facilityID` (`int_facilityID`),
  CONSTRAINT `tbl_facilityreservation_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`),
  CONSTRAINT `tbl_facilityreservation_ibfk_2` FOREIGN KEY (`int_facilityID`) REFERENCES `tbl_facility` (`int_facilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facilityreservation`
--

LOCK TABLES `tbl_facilityreservation` WRITE;
/*!40000 ALTER TABLE `tbl_facilityreservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facilityreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grd3students`
--

DROP TABLE IF EXISTS `tbl_grd3students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_grd3students` (
  `int_studentID` int(10) NOT NULL AUTO_INCREMENT,
  `int_relationID` int(10) NOT NULL,
  `var_school` varchar(100) NOT NULL,
  `var_batch` varchar(20) NOT NULL,
  `var_section` varchar(20) NOT NULL,
  PRIMARY KEY (`int_studentID`),
  KEY `int_relationID` (`int_relationID`),
  CONSTRAINT `tbl_grd3students_ibfk_1` FOREIGN KEY (`int_relationID`) REFERENCES `tbl_relation` (`int_relationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grd3students`
--

LOCK TABLES `tbl_grd3students` WRITE;
/*!40000 ALTER TABLE `tbl_grd3students` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_grd3students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_houseblessing`
--

DROP TABLE IF EXISTS `tbl_houseblessing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_houseblessing` (
  `int_eventinfoID` int(11) NOT NULL,
  `var_owner` varchar(100) NOT NULL,
  `var_estloc` varchar(100) NOT NULL,
  `var_ownercontactnum` varchar(13) NOT NULL,
  `var_owneremailadd` varchar(50) NOT NULL,
  `date_desireddate1` date NOT NULL,
  `date_desireddate2` date NOT NULL,
  `time_desiredtime1` time NOT NULL,
  `time_desiredtime2` time NOT NULL,
  UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`),
  CONSTRAINT `tbl_houseblessing_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_houseblessing`
--

LOCK TABLES `tbl_houseblessing` WRITE;
/*!40000 ALTER TABLE `tbl_houseblessing` DISABLE KEYS */;
INSERT INTO `tbl_houseblessing` VALUES (8,'Ebrada, Jonalyn Fe','Payatas B Quezon City','09277475753','jonalynfeebrada11@gmail.com','2018-06-03','2018-06-03','03:11:00','03:11:00');
/*!40000 ALTER TABLE `tbl_houseblessing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_members`
--

DROP TABLE IF EXISTS `tbl_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_members` (
  `int_members_ID` int(11) NOT NULL AUTO_INCREMENT,
  `int_user_ID` int(11) NOT NULL,
  `int_ministry_ID` int(11) NOT NULL,
  `var_position` varchar(45) NOT NULL,
  PRIMARY KEY (`int_members_ID`),
  KEY `tbl_ibfk_1_idx` (`int_user_ID`),
  KEY `tbl_ibfk_w_idx` (`int_ministry_ID`),
  CONSTRAINT `tbl_ibfk_1` FOREIGN KEY (`int_user_ID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_ibfk_w` FOREIGN KEY (`int_ministry_ID`) REFERENCES `tbl_ministry` (`int_ministry_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_members`
--

LOCK TABLES `tbl_members` WRITE;
/*!40000 ALTER TABLE `tbl_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_message`
--

DROP TABLE IF EXISTS `tbl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_message` (
  `int_messageID` int(10) NOT NULL AUTO_INCREMENT,
  `int_senderID` int(10) NOT NULL,
  `int_receiverID` int(10) NOT NULL,
  `text_message` text NOT NULL,
  PRIMARY KEY (`int_messageID`),
  KEY `int_senderID` (`int_senderID`),
  KEY `int_receiverID` (`int_receiverID`),
  CONSTRAINT `tbl_message_ibfk_1` FOREIGN KEY (`int_senderID`) REFERENCES `tbl_user` (`int_userID`),
  CONSTRAINT `tbl_message_ibfk_2` FOREIGN KEY (`int_receiverID`) REFERENCES `tbl_user` (`int_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_message`
--

LOCK TABLES `tbl_message` WRITE;
/*!40000 ALTER TABLE `tbl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ministry`
--

DROP TABLE IF EXISTS `tbl_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ministry` (
  `int_ministry_ID` int(11) NOT NULL AUTO_INCREMENT,
  `var_ministry_name` varchar(45) NOT NULL,
  `var_ministry_desc` varchar(45) NOT NULL,
  PRIMARY KEY (`int_ministry_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ministry`
--

LOCK TABLES `tbl_ministry` WRITE;
/*!40000 ALTER TABLE `tbl_ministry` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_notification`
--

DROP TABLE IF EXISTS `tbl_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_notification` (
  `int_notifID` int(10) NOT NULL AUTO_INCREMENT,
  `int_userID` int(10) NOT NULL,
  `var_notifdesc` varchar(55) NOT NULL,
  PRIMARY KEY (`int_notifID`),
  KEY `int_userID` (`int_userID`),
  CONSTRAINT `tbl_notification_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_notification`
--

LOCK TABLES `tbl_notification` WRITE;
/*!40000 ALTER TABLE `tbl_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_payment`
--

DROP TABLE IF EXISTS `tbl_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_payment` (
  `int_paymentID` int(10) NOT NULL,
  `dbl_amount` double NOT NULL,
  `char_paymentstatus` char(10) NOT NULL,
  PRIMARY KEY (`int_paymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_payment`
--

LOCK TABLES `tbl_payment` WRITE;
/*!40000 ALTER TABLE `tbl_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_relation`
--

DROP TABLE IF EXISTS `tbl_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_relation` (
  `int_relationID` int(10) NOT NULL AUTO_INCREMENT,
  `int_eventinfoID` int(10) NOT NULL,
  `var_relation` varchar(20) DEFAULT NULL,
  `var_lname` varchar(50) NOT NULL,
  `var_fname` varchar(50) NOT NULL,
  `var_mname` varchar(50) DEFAULT NULL,
  `char_gender` varchar(10) NOT NULL,
  `var_address` varchar(100) NOT NULL,
  `date_birthday` date NOT NULL,
  `var_birthplace` varchar(100) NOT NULL,
  PRIMARY KEY (`int_relationID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  CONSTRAINT `tbl_relation_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_relation`
--

LOCK TABLES `tbl_relation` WRITE;
/*!40000 ALTER TABLE `tbl_relation` DISABLE KEYS */;
INSERT INTO `tbl_relation` VALUES (1,1,'Spouse','Ebrada','Jonalyn Fe','Desalisa','Female','here','1998-11-11','Quezon City'),(2,2,'Spouse','Ebrada','Jonalyn Fe','Desalisa','Female','there','2018-04-11','Quezon City'),(3,3,'Spouse','Ebrada','Jonalyn Fe','Desalisa','Female','hereeeee','1998-11-11','Quezon City'),(4,4,'Spouse','Ebrada','Jonalyn Fe','Desalisa','Female','there na lang','1998-11-11','Quezon City'),(5,5,'Spouse','Ebrada','Jonalyn Fe','Desalisa','Female','asdf','2018-06-03','Quezon City'),(6,6,'Parent','Ebrada','Jonalyn Fe','Desalisa','Female','here','2018-06-03','Quezon City'),(7,7,'Parent','Ebrada','Jonalyn Fe','Desalisa','Female','asdf','2018-01-03','Quezon City'),(8,9,NULL,'Ebrada','Jonalyn Fe','Desalisa','Male','herer','2018-06-03','Quezon Citya'),(9,10,'Parent','Ebrada','Jonalyn Fe','Desalisa','Female','there','1998-11-11','Quezon City'),(10,12,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(11,13,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(12,14,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(13,15,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(14,17,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(15,18,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(16,19,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(17,20,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(18,21,'Parent','Macaya','Joshua Rae','','Male','Manila','2018-07-01','Manila'),(19,22,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(20,23,'Parent','Macaya','Joshua Rae','','Male','Manila','1998-12-22','Manila'),(21,24,'Parent','Lacsina','Gramar','Desuyo','Female','Manila','1999-11-12','Manila'),(22,25,'Parent','Lacsina','Gramar','','Female','Manila','1998-11-12','Manila'),(23,26,'Parent','Lacsina','Gramar','Desuyo','Female','Manila','1999-11-11','Manila'),(24,27,'Parent','asd','asd','we','Female','Manila','2001-02-11','Manila'),(25,28,'Parent','Lacsina','Gramar','Desuyo','Female','Manila','1999-11-12','Manila'),(26,29,'Parent','Lacsina','Gramar','Desuyo','Female','Manila','1999-11-12','Manila');
/*!40000 ALTER TABLE `tbl_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_requirements`
--

DROP TABLE IF EXISTS `tbl_requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_requirements` (
  `int_requirementID` int(10) NOT NULL AUTO_INCREMENT,
  `int_eventinfoID` int(10) DEFAULT NULL,
  `var_reqpath` varchar(300) NOT NULL,
  `var_reqloc` varchar(100) DEFAULT NULL,
  `var_reqtype` text,
  `date_reqreceived` date NOT NULL,
  `int_requirementtype_ID` int(11) NOT NULL,
  `int_facilityreservation_ID` int(11) DEFAULT NULL,
  `int_documentrequest_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`int_requirementID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  KEY `tbl_requirements_ibfk_2_idx` (`int_requirementtype_ID`),
  KEY `tbl_requirements_ibfk_3_idx` (`int_facilityreservation_ID`),
  KEY `tbl_requirements_ibfk_3_idx1` (`int_documentrequest_ID`),
  CONSTRAINT `tbl_requirements_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  CONSTRAINT `tbl_requirements_ibfk_2` FOREIGN KEY (`int_requirementtype_ID`) REFERENCES `tbl_requirementtype` (`int_reqtypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_requirements_ibfk_3` FOREIGN KEY (`int_facilityreservation_ID`) REFERENCES `tbl_facilityreservation` (`int_reservationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_requirements_ibfk_4` FOREIGN KEY (`int_documentrequest_ID`) REFERENCES `tbl_documentrequest` (`int_requestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_requirements`
--

LOCK TABLES `tbl_requirements` WRITE;
/*!40000 ALTER TABLE `tbl_requirements` DISABLE KEYS */;
INSERT INTO `tbl_requirements` VALUES (1,21,'image-1530446079556.jpeg',NULL,NULL,'2018-07-01',1,NULL,NULL),(2,22,'36427886_1780757578658008_8779133192788508672_n.png',NULL,NULL,'2018-07-01',1,NULL,NULL),(3,23,'36427886_1780757578658008_8779133192788508672_n.png',NULL,NULL,'2018-07-01',1,NULL,NULL),(4,24,'/img/req/image-1530458592096.jpg',NULL,NULL,'2018-07-01',1,NULL,NULL),(5,28,'/img/birthCertificate-1530461914455.jpg',NULL,NULL,'2018-07-02',1,NULL,NULL),(6,28,'/img/baptismalCertificate-1530461914457.jpg',NULL,NULL,'2018-07-02',2,NULL,NULL),(7,29,'/img/birthCertificate-1530461994585.jpg',NULL,NULL,'2018-07-02',1,NULL,NULL),(8,29,'/img/baptismalCertificate-1530461994586.jpg',NULL,NULL,'2018-07-02',2,NULL,NULL);
/*!40000 ALTER TABLE `tbl_requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_requirementtype`
--

DROP TABLE IF EXISTS `tbl_requirementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_requirementtype` (
  `int_reqtypeID` int(11) NOT NULL AUTO_INCREMENT,
  `int_eventID` int(11) DEFAULT NULL,
  `var_reqname` varchar(50) NOT NULL,
  `var_reqdesc` varchar(100) NOT NULL,
  `int_facility_ID` int(11) DEFAULT NULL,
  `int_document_ID` int(11) DEFAULT NULL,
  `char_req_mode` char(1) NOT NULL,
  `varchar_case` varchar(45) NOT NULL,
  `char_reqtype` varchar(45) NOT NULL,
  PRIMARY KEY (`int_reqtypeID`),
  KEY `int_eventID` (`int_eventID`),
  KEY `tbl_requirementtype_ibfk_2_idx` (`int_facility_ID`),
  KEY `tbl_requirementtype_ibfk_3_idx` (`int_document_ID`),
  CONSTRAINT `tbl_requirementtype_ibfk_1` FOREIGN KEY (`int_eventID`) REFERENCES `tbl_event` (`int_eventID`),
  CONSTRAINT `tbl_requirementtype_ibfk_2` FOREIGN KEY (`int_facility_ID`) REFERENCES `tbl_facility` (`int_facilityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_requirementtype_ibfk_3` FOREIGN KEY (`int_document_ID`) REFERENCES `tbl_document` (`int_documentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_requirementtype`
--

LOCK TABLES `tbl_requirementtype` WRITE;
/*!40000 ALTER TABLE `tbl_requirementtype` DISABLE KEYS */;
INSERT INTO `tbl_requirementtype` VALUES (1,3,'Birth Certificate','Personal Information',NULL,NULL,'','',''),(2,2,'Baptismal Certificate','Certification of Baptism',NULL,NULL,'','',''),(3,4,'Death Certificate','Certification of Death',NULL,NULL,'','',''),(4,NULL,'Valid ID','Idetification for the one who will rent/reserve the facility',1,NULL,'','',''),(5,NULL,'Valid ID','Idetification for the one who will rent/reserve the facility',NULL,1,'','',''),(6,10,'Valid ID','Idetification for the one who will rent/reserve the facility',NULL,NULL,'','','');
/*!40000 ALTER TABLE `tbl_requirementtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_schedule`
--

DROP TABLE IF EXISTS `tbl_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_schedule` (
  `int_scheduleID` int(10) NOT NULL AUTO_INCREMENT,
  `int_userID` int(10) NOT NULL,
  `int_eventinfoID` int(10) NOT NULL,
  `text_schedulenote` text NOT NULL,
  `var_venue` varchar(100) NOT NULL,
  `time_schedstart` time NOT NULL,
  `time_schedend` time NOT NULL,
  PRIMARY KEY (`int_scheduleID`),
  KEY `int_userID` (`int_userID`),
  KEY `int_eventID` (`int_eventinfoID`),
  CONSTRAINT `tbl_schedule_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`),
  CONSTRAINT `tbl_schedule_ibfk_2` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_schedule`
--

LOCK TABLES `tbl_schedule` WRITE;
/*!40000 ALTER TABLE `tbl_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_specialevent`
--

DROP TABLE IF EXISTS `tbl_specialevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_specialevent` (
  `int_specialeventID` int(11) NOT NULL AUTO_INCREMENT,
  `int_userID` int(11) NOT NULL,
  `var_spceventname` varchar(50) NOT NULL,
  `text_eventdesc` text NOT NULL,
  `time_eventstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_eventend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `var_eventvenue` varchar(200) NOT NULL,
  `char_eventtype` char(25) NOT NULL,
  `var_approvalstatus` varchar(25) NOT NULL,
  PRIMARY KEY (`int_specialeventID`),
  KEY `int_userID` (`int_userID`),
  CONSTRAINT `tbl_specialevent_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_specialevent`
--

LOCK TABLES `tbl_specialevent` WRITE;
/*!40000 ALTER TABLE `tbl_specialevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_specialevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sponsors`
--

DROP TABLE IF EXISTS `tbl_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_sponsors` (
  `int_sponsorID` int(10) NOT NULL AUTO_INCREMENT,
  `int_eventinfoID` int(10) NOT NULL,
  `var_sponsorname` varchar(50) NOT NULL,
  PRIMARY KEY (`int_sponsorID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  CONSTRAINT `tbl_sponsors_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sponsors`
--

LOCK TABLES `tbl_sponsors` WRITE;
/*!40000 ALTER TABLE `tbl_sponsors` DISABLE KEYS */;
INSERT INTO `tbl_sponsors` VALUES (1,6,'Juan Dela Cruz'),(2,6,'Juan Dela Cruz'),(3,6,'Juan Dela Cruz'),(4,6,'Juan Dela Cruz'),(5,6,'Juan Dela Cruz'),(6,6,'Juan Dela Cruz'),(7,6,'Juan Dela Cruz'),(8,6,'Juan Dela Cruz'),(9,7,'Juan Dela Cruz'),(10,7,'Juan Dela Cruz'),(11,7,'Juan Dela Cruz'),(12,7,'Juan Dela Cruz'),(13,7,'Juan Dela Cruz'),(14,7,'Juan Dela Cruz'),(15,7,'Juan Dela Cruz'),(16,7,'Juan Dela Cruz'),(17,9,'Juan Dela Cruz'),(18,9,'Juan Dela Cruz'),(19,9,'Juan Dela Cruz'),(20,9,'Juan Dela Cruz'),(21,9,'Juan Dela Cruz'),(22,9,'Juan Dela Cruz'),(23,9,'Juan Dela Cruz'),(24,9,'Juan Dela Cruz'),(25,10,'Juan Dela Cruz'),(26,10,'Juan Dela Cruzz'),(27,10,'Juan Dela Cruz'),(28,10,'Juan Dela Cruzzzz'),(29,10,'Juan Dela Cruztt'),(30,10,'Juan Dela Cruzoo'),(31,13,'Gramar Lacsina'),(32,12,''),(33,12,''),(34,12,'Gramar Lacsina'),(35,13,''),(36,12,''),(37,13,''),(38,13,''),(39,21,'Gramar Lacsina'),(40,21,''),(41,21,''),(42,21,''),(43,24,'Joshua Rae Macaya'),(44,24,''),(45,24,''),(46,24,'');
/*!40000 ALTER TABLE `tbl_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `int_userID` int(10) NOT NULL AUTO_INCREMENT,
  `var_userlname` varchar(55) NOT NULL,
  `var_userfname` varchar(55) NOT NULL,
  `var_usermname` varchar(55) NOT NULL,
  `char_usergender` char(10) NOT NULL,
  `date_userbirthday` date NOT NULL,
  `var_useraddress` varchar(100) NOT NULL,
  `var_usercontactnum` varchar(13) NOT NULL,
  `var_username` varchar(55) NOT NULL,
  `var_useremail` varchar(55) NOT NULL,
  `var_password` varchar(80) NOT NULL,
  `char_usertype` char(20) NOT NULL,
  PRIMARY KEY (`int_userID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (5,'Admin','admin','admin','Female','1980-01-01','Anywhere','09123456789','admin','admin@gmail.com','admin','Admin'),(6,'Secretariat','Secretariat','Secretariat','Female','1980-04-01','Anywhere','09999999999','secretariat','secretariat@gmail.com','secretariat','Secretariat'),(7,'Coordinator','Coordinator','Coordinator','Male','1990-04-02','Anywhere','09999999999','coordinator','coordinator@gmail.com','coordinator','Coordinator'),(8,'Catechist','Catechist','Catechist','Female','1970-04-03','Anywhere','0999999999','catechist','catechist','catechist','Catechist'),(10,'Priest','Priest','Priest','Male','1970-04-04','Anyhwere','09123456789','priest','priest@gmail.com','priest','Priest'),(11,'Ebrada','Jonalyn Fe','Desalisa','Female','1998-11-11','Payatas B Quezon City','09277475753','jonalynfe11','jonalynfeebrada11@gmail.com','123jona','Guest'),(12,'Macaya','Joshua Rae','','Male','1998-12-22','Caloocan CIty','09277475711','joshuarae','joshuarae@gmail.com','123rae','Guest'),(13,'Del Rosario','Eldrin Rei','Dikolam','Male','1998-01-01','Valenzuela City','09277475742','eldrinrei','asdfwe','123eldrin','Guest'),(14,'Peñaverde','Norme Ann Joyce','dunno','Female','1999-07-06','Infanta Quezon','09277475733','normeann','normeann','123norme','Guest');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_utilities`
--

DROP TABLE IF EXISTS `tbl_utilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_utilities` (
  `int_utilities_ID` int(11) NOT NULL AUTO_INCREMENT,
  `int_reservation_days` int(11) NOT NULL,
  `int_payment_days` int(11) DEFAULT NULL,
  `int_requirements_days` int(11) NOT NULL,
  `int_refund_days` int(11) DEFAULT NULL,
  `double_refund_percent` double DEFAULT NULL,
  `int_age_limit` int(11) DEFAULT NULL,
  `double_fee` double DEFAULT NULL,
  `time_duration` time NOT NULL,
  `double_add_rate` double NOT NULL,
  `int_event_ID` int(11) NOT NULL,
  PRIMARY KEY (`int_utilities_ID`),
  KEY `tbl_ibfk1_idx` (`int_event_ID`),
  CONSTRAINT `tbl_ibfk1` FOREIGN KEY (`int_event_ID`) REFERENCES `tbl_event` (`int_eventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_utilities`
--

LOCK TABLES `tbl_utilities` WRITE;
/*!40000 ALTER TABLE `tbl_utilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_utilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wedbride`
--

DROP TABLE IF EXISTS `tbl_wedbride`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_wedbride` (
  `int_eventinfoID` int(10) NOT NULL,
  `var_blname` varchar(30) NOT NULL,
  `var_bfname` varchar(30) NOT NULL,
  `var_bmname` varchar(30) DEFAULT NULL,
  `char_bgender` char(10) NOT NULL,
  `var_baddress` varchar(100) NOT NULL,
  `date_bbirthday` date NOT NULL,
  `var_bbirthplace` varchar(100) NOT NULL,
  `var_bnationality` varchar(20) NOT NULL,
  `var_bcivilstatus` varchar(50) NOT NULL,
  `var_breligion` varchar(20) NOT NULL,
  `var_boccupation` varchar(50) NOT NULL,
  `bool_bpregnant` tinyint(1) NOT NULL,
  `var_bfathername` varchar(100) NOT NULL,
  `var_bfatherbplace` varchar(100) NOT NULL,
  `var_bfatherreligion` varchar(20) NOT NULL,
  `var_bmothername` varchar(100) NOT NULL,
  `var_bmotherbplace` varchar(100) NOT NULL,
  `var_bmotherreligion` varchar(20) NOT NULL,
  `var_bcurrparish` varchar(100) NOT NULL,
  `bool_bbaptized` tinyint(1) NOT NULL,
  `date_bbapdate` date DEFAULT NULL,
  `var_bbapplace` varchar(100) DEFAULT NULL,
  `bool_bconfirmed` tinyint(1) NOT NULL,
  `date_bcondate` date DEFAULT NULL,
  `var_bconplace` varchar(100) DEFAULT NULL,
  UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE,
  CONSTRAINT `tbl_wedbride_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wedbride`
--

LOCK TABLES `tbl_wedbride` WRITE;
/*!40000 ALTER TABLE `tbl_wedbride` DISABLE KEYS */;
INSERT INTO `tbl_wedbride` VALUES (9,'Ebrada','Jonalyn Fe ','Desalisa','Female','asdfasdfasdfa','2018-06-03','','Filipino','Single','Catholic','IT',0,'Fidel Ebrada','Catholic','Quezon City','Josephine Ebrada','Catholic','Quezon City','INLPP',0,'0000-00-00','',0,'0000-00-00','');
/*!40000 ALTER TABLE `tbl_wedbride` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wedcouple`
--

DROP TABLE IF EXISTS `tbl_wedcouple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_wedcouple` (
  `int_eventinfoID` int(20) NOT NULL,
  `bool_livingin` tinyint(1) NOT NULL,
  `bool_married` tinyint(1) NOT NULL,
  `date_cprevweddate` date DEFAULT NULL,
  `var_cprevwedplace` varchar(100) DEFAULT NULL,
  `date_desireddate` date NOT NULL,
  `time_desiredtime` time NOT NULL,
  UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE,
  CONSTRAINT `tbl_wedcouple_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wedcouple`
--

LOCK TABLES `tbl_wedcouple` WRITE;
/*!40000 ALTER TABLE `tbl_wedcouple` DISABLE KEYS */;
INSERT INTO `tbl_wedcouple` VALUES (9,0,0,NULL,NULL,'2018-06-03','10:00:00');
/*!40000 ALTER TABLE `tbl_wedcouple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_wedgroom`
--

DROP TABLE IF EXISTS `tbl_wedgroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_wedgroom` (
  `int_eventinfoID` int(10) NOT NULL,
  `var_gnationality` varchar(20) NOT NULL,
  `var_gcivilstatus` varchar(50) NOT NULL,
  `var_greligion` varchar(20) NOT NULL,
  `var_goccupation` varchar(50) NOT NULL,
  `var_gfathername` varchar(100) NOT NULL,
  `var_gfatherreligion` varchar(20) NOT NULL,
  `var_gfatherbplace` varchar(100) NOT NULL,
  `var_gmothername` varchar(100) NOT NULL,
  `var_gmotherreligion` varchar(20) NOT NULL,
  `var_gmotherbplace` varchar(100) NOT NULL,
  `var_gcurrparish` varchar(100) NOT NULL,
  `bool_gbaptized` tinyint(1) NOT NULL,
  `date_gbapdate` date DEFAULT NULL,
  `var_gbapplace` varchar(100) DEFAULT NULL,
  `bool_gconfirmed` tinyint(1) NOT NULL,
  `date_gcondate` date DEFAULT NULL,
  `var_gconplace` varchar(100) DEFAULT NULL,
  UNIQUE KEY `int_eventinfoID_2` (`int_eventinfoID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  CONSTRAINT `tbl_wedgroom_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wedgroom`
--

LOCK TABLES `tbl_wedgroom` WRITE;
/*!40000 ALTER TABLE `tbl_wedgroom` DISABLE KEYS */;
INSERT INTO `tbl_wedgroom` VALUES (9,'Filipino','Single','Catholic','IT professional','Fidel Ebrada','Catholic','Quezon City','Josephine Ebrada','Catholic','Quezon City','INLPP',1,'2018-06-03','INLPP',0,'0000-00-00','');
/*!40000 ALTER TABLE `tbl_wedgroom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-06 17:40:01
