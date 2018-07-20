-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sad_church(10)
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
INSERT INTO `tbl_baptism` VALUES (26,'jhfskjdfhjkadsh','lkjhkjh','asdfasdfadf','lkjkhlkj','asdf','09488775','2018-07-22','11:00:00'),(28,'asdfasdf','lllpppadsfadsf','kkkkk','llllll','jjjj','123132131231','0000-00-00','11:00:00'),(29,'asdfasdf','lllpppadsfadsf','kkkkk','llllll','jjjj','123132131231','0000-00-00','11:00:00');
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
INSERT INTO `tbl_blessing` VALUES (21,'4-a del rosario st\r\n4-a','oofdfghj','2018-07-07','2018-07-07','01:30:00','01:30:00'),(22,'4-a del rosario st\r\n4-a','kjjhfghjk','2018-07-07','2018-07-07','01:33:00','01:33:00'),(23,'4-a del rosario st\r\n4-a','dhjnvghb ','2018-07-07','2018-07-07','01:51:00','01:51:00');
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
  `char_docustatus` char(20) NOT NULL,
  PRIMARY KEY (`int_requestID`),
  KEY `int_documentID` (`int_documentID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  KEY `int_userID` (`int_userID`),
  CONSTRAINT `tbl_documentrequest_ibfk_1` FOREIGN KEY (`int_documentID`) REFERENCES `tbl_document` (`int_documentID`),
  CONSTRAINT `tbl_documentrequest_ibfk_2` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  CONSTRAINT `tbl_documentrequest_ibfk_3` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_documentrequest`
--

LOCK TABLES `tbl_documentrequest` WRITE;
/*!40000 ALTER TABLE `tbl_documentrequest` DISABLE KEYS */;
INSERT INTO `tbl_documentrequest` VALUES (1,11,1,NULL,'Ebrada','Jonalyn Fe','wala lang hahaha','2018-07-04',NULL,NULL,'Requested'),(2,11,1,NULL,'Macaya','Joshua Rae','SHIT','2018-07-20',NULL,NULL,'Requested');
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
  `char_type` char(15) NOT NULL,
  PRIMARY KEY (`int_eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_event`
--

LOCK TABLES `tbl_event` WRITE;
/*!40000 ALTER TABLE `tbl_event` DISABLE KEYS */;
INSERT INTO `tbl_event` VALUES (1,'Anointing of the sick','The anointing of the sick is administered to bring spiritual and even physical strength during an illness, especially near the time of death. It is most likely one of the last sacraments one will receive. A sacrament is an outward sign established by Jesus Christ to confer inward grace. In more basic terms, it is a rite that is performed to convey God’s grace to the recipient, through the power of the Holy Spirit.','Sacrament'),(2,'Confirmation','The sacrament of confirmation completes the sacrament of baptism. If baptism is the sacrament of re-birth to a new and supernatural life, confir- mation is the sacrament of maturity and coming of age. The real confession of Christ consist in this \'that the whole man submits himself to Truth, in the judgment of his understanding, in the submission of his will and in the consecration of his whole power of love . . . To do this, poor-spirited man is only able when he has been confirmed by God\'s grace\'\r\n\r\nThis confirmation in the power of the Holy Spirit leading to a firm profession of faith has always been the particular effect which Catholic tradition has ascribed to the sacrament. It is effect which complements and completes that of baptism.\r\n\r\nTHE CHURCH TEACHES\r\nConfirmation is a true sacrament instituted by Christ and different from baptism. It is administered by laying-on of hands and anointing with chrism accompanied by prayer. The chrism is blessed by the bishop and the bishop administers the sacrament. All baptized persons can and should be confirmed. The effect of the sacrament of confirmation is to give strength in faith and for the confession of faith and to impress an indelible character.','Sacrament'),(3,'Baptism','The sacrament of Baptism is the beginning of life—supernatural life. Because of original sin, we come into the world with a soul which is supernaturally dead. We come into the world with only the natural endowments of human nature. The supernatural life which is the result of God’s personal and intimate indwelling, is absent from the soul.\r\n\r\nOriginal sin is not, in the strict sense, a “blot” upon the soul. Indeed, original sin is not a “something” at all. It is the absence of something that should be there. It is a darkness where there ought to be light.\r\n\r\nJesus instituted the sacrament of Baptism to apply to each individual soul the atonement which He made on the Cross for original sin.\r\n\r\nJesus will not force His gift upon us, the gift of supernatural life for which He paid. He holds the gift out to us hopefully, but each of us must freely accept it. We make that acceptance by receiving the sacrament of Baptism.\r\n\r\nWhen the sacrament of Baptism is administered, the spiritual vacuum which we call original sin disappears as God becomes present in the soul, and the soul is caught up into that sharing of God’s own life which we call sanctifying grace.\r\n\r\n(c) http://www.beginningcatholic.com/baptism','Sacrament'),(4,'Funeral Service','The rite of committal, the conclusion of the funeral rites, is the final act of the community of faith in caring for the body of its deceased member. It may be celebrated at the grave, tomb, or crematorium and may be used for burial at sea. Whenever possible, the rite of committal is to be celebrated at the site of committal, that is, beside the open grave or place of internment, rather than at a cemetery chapel.\r\n\r\n(c) http://www.ibreviary.com/m/preghiere.php?tipo=Rito&id=417','Special Service'),(5,'Marriage','When the Catholic Church teaches that marriage between two baptized persons is a sacrament, it is saying that the couple’s relationship expresses in a unique way the unbreakable bond of love between Christ and his people. Like the other six sacraments of the Church, marriage is a sign or symbol which reveals the Lord Jesus and through which his divine life and love are communicated. All seven sacraments were instituted by Christ and were entrusted to the Church to be celebrated in faith within and for the community of believers. The rituals and prayers by which a sacrament is celebrated serve to express visibly what God is doing invisibly.\r\n\r\nIn a sacramental marriage, God’s love becomes present to the spouses in their total union and also flows through them to their family and community. By their permanent, faithful and exclusive giving to each other, symbolized in sexual intercourse, the couple reveals something of God’s unconditional love. The sacrament of Christian marriage involves their entire life as they journey together through the ups and downs of marriage and become more able to give to and receive from each other. Their life becomes sacramental to the extent that the couple cooperates with God’s action in their life and sees themselves as living “in Christ” and Christ living and acting in their relationship, attitudes and actions.\r\n\r\nCatholic teaching holds that sacraments bring grace to those who receive them with the proper disposition. Grace is a way of describing how God shares the divine life with us and gives us the help we need to live as followers of Christ. In marriage, the grace of this sacrament brings to the spouses the particular help they need to be faithful and to be good parents. It also helps a couple to serve others beyond their immediate family and to show the community that a loving and lasting marriage is both desirable and possible.\r\n\r\n(C) http://www.foryourmarriage.org/marriage-as-sacrament/','Sacrament'),(6,'First Communion','first communion','Sacrament'),(7,'Funeral Mass','wala malagay si jonaaa','Sacrament'),(9,'Special Baptism','It includes adult baptism and special baptism.\r\ntuesday-sat','Special Service'),(10,'Establishment Blessing','House blessing belongs to the special services that our parish offers. ','Special Service'),(11,'Special Confirmation','espesyal na konpirmasyon','Special Service'),(13,'Facility Reservation','facility reservation','Special Service'),(14,'Document Request','Document Request','Special Service');
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
  `var_remarks` varchar(20) NOT NULL,
  PRIMARY KEY (`int_eventapplicationID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  KEY `int_paymentID` (`int_paymentID`),
  CONSTRAINT `tbl_eventapplication_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  CONSTRAINT `tbl_eventapplication_ibfk_2` FOREIGN KEY (`int_paymentID`) REFERENCES `tbl_payment` (`int_paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventapplication`
--

LOCK TABLES `tbl_eventapplication` WRITE;
/*!40000 ALTER TABLE `tbl_eventapplication` DISABLE KEYS */;
INSERT INTO `tbl_eventapplication` VALUES (20,20,NULL,'Pending','Unpaid','Incomplete',''),(21,21,NULL,'Pending','Unpaid','Incomplete',''),(22,22,NULL,'Pending','Unpaid','Incomplete',''),(23,23,NULL,'Pending','Unpaid','Incomplete',''),(24,24,NULL,'Pending','Unpaid','Incomplete',''),(25,25,NULL,'Pending','Unpaid','Incomplete',''),(26,26,NULL,'Pending','Unpaid','Incomplete',''),(27,27,NULL,'Pending','Unpaid','Incomplete',''),(28,28,NULL,'Pending','Unpaid','Incomplete',''),(29,29,NULL,'Pending','Unpaid','Incomplete','');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_eventinfo`
--

LOCK TABLES `tbl_eventinfo` WRITE;
/*!40000 ALTER TABLE `tbl_eventinfo` DISABLE KEYS */;
INSERT INTO `tbl_eventinfo` VALUES (20,11,1,NULL,NULL,NULL),(21,11,1,NULL,NULL,NULL),(22,11,1,NULL,NULL,NULL),(23,11,1,NULL,NULL,NULL),(24,11,3,NULL,NULL,NULL),(25,11,3,NULL,NULL,NULL),(26,11,3,NULL,NULL,NULL),(27,11,3,NULL,NULL,NULL),(28,11,2,NULL,NULL,NULL),(29,11,2,NULL,NULL,NULL),(30,11,1,NULL,NULL,NULL),(31,11,1,NULL,NULL,NULL);
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
  `var_facilitydesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`int_facilityID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facility`
--

LOCK TABLES `tbl_facility` WRITE;
/*!40000 ALTER TABLE `tbl_facility` DISABLE KEYS */;
INSERT INTO `tbl_facility` VALUES (1,'Bro. Roqueto 2nd floor',NULL),(2,'Bro. Roqueto 3rd floor',NULL),(4,'eyyy',NULL);
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
/*!40000 ALTER TABLE `tbl_houseblessing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_members`
--

DROP TABLE IF EXISTS `tbl_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_members` (
  `int_membersID` int(11) NOT NULL AUTO_INCREMENT,
  `int_userID` int(11) NOT NULL,
  `int_ministryID` int(11) NOT NULL,
  `var_position` varchar(45) NOT NULL,
  PRIMARY KEY (`int_membersID`),
  KEY `tbl_ibfk_1_idx` (`int_userID`),
  KEY `tbl_ibfk_w_idx` (`int_ministryID`),
  CONSTRAINT `tbl_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_ibfk_w` FOREIGN KEY (`int_ministryID`) REFERENCES `tbl_ministry` (`int_ministryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `int_ministryID` int(11) NOT NULL AUTO_INCREMENT,
  `var_ministryname` varchar(45) NOT NULL,
  `var_ministrydesc` varchar(45) NOT NULL,
  PRIMARY KEY (`int_ministryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ministry`
--

LOCK TABLES `tbl_ministry` WRITE;
/*!40000 ALTER TABLE `tbl_ministry` DISABLE KEYS */;
INSERT INTO `tbl_ministry` VALUES (1,'Music Ministry','Music ministry'),(2,'Liturgical Ministry','liturgy'),(3,'asd','ajsidjasid'),(4,'Lekaskjdf','walaaa');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_relation`
--

LOCK TABLES `tbl_relation` WRITE;
/*!40000 ALTER TABLE `tbl_relation` DISABLE KEYS */;
INSERT INTO `tbl_relation` VALUES (19,21,'Spouse','Mouse','Mickey','','Male','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(20,22,'Spouse','Mouse','Mickey','','Female','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(21,23,'Spouse','Mouse','Mickey','','Female','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(22,24,'Parent','','Mickey','','Male','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(23,25,'Parent','asd','asd','asd','Male','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(24,26,'Parent','Mouse','Mickey','','Female','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(25,27,'Parent','Mouse','Mickey','','Male','4-a del rosario st\r\n4-a','2018-07-07','valenzuela'),(26,28,'Parent','Fold','Treat','','Male','dito nga','2018-07-13','therehere'),(27,29,'Parent','Fold','Treat','','Male','dito nga','2018-07-13','therehere');
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
  `var_reqpath` varchar(300) DEFAULT NULL,
  `var_reqloc` varchar(100) DEFAULT NULL,
  `date_reqreceived` date NOT NULL,
  `int_reqtypeID` int(11) DEFAULT NULL,
  `int_reservationID` int(11) DEFAULT NULL,
  `int_requestID` int(11) DEFAULT NULL,
  PRIMARY KEY (`int_requirementID`),
  KEY `int_eventinfoID` (`int_eventinfoID`),
  KEY `int_reqtypeID` (`int_reqtypeID`),
  KEY `int_reservationID` (`int_reservationID`),
  KEY `int_requestID` (`int_requestID`),
  CONSTRAINT `tbl_requirements_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  CONSTRAINT `tbl_requirements_ibfk_2` FOREIGN KEY (`int_reqtypeID`) REFERENCES `tbl_requirementtype` (`int_reqtypeID`),
  CONSTRAINT `tbl_requirements_ibfk_3` FOREIGN KEY (`int_reservationID`) REFERENCES `tbl_facilityreservation` (`int_reservationID`),
  CONSTRAINT `tbl_requirements_ibfk_4` FOREIGN KEY (`int_requestID`) REFERENCES `tbl_documentrequest` (`int_requestID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_requirements`
--

LOCK TABLES `tbl_requirements` WRITE;
/*!40000 ALTER TABLE `tbl_requirements` DISABLE KEYS */;
INSERT INTO `tbl_requirements` VALUES (3,23,'/img/req/image-1530899515882.jpg',NULL,'2018-07-07',44,NULL,NULL),(4,24,'/img/req/image-1530925427624.jpg',NULL,'2018-07-07',1,NULL,NULL),(5,25,'/img/req/image-1530925625911.jpg',NULL,'2018-07-07',1,NULL,NULL),(6,26,'/img/req/image-1530925784822.jpg',NULL,'2018-07-07',1,NULL,NULL),(7,27,'/img/req/image-1530927077375.jpg',NULL,'2018-07-07',1,NULL,NULL),(8,28,'/img/birthCertificate-1531463967712.jpg',NULL,'2018-07-13',1,NULL,NULL),(9,28,'/img/baptismalCertificate-1531463967720.jpg',NULL,'2018-07-13',2,NULL,NULL),(10,29,'/img/birthCertificate-1531463968949.jpg',NULL,'2018-07-13',1,NULL,NULL),(11,29,'/img/baptismalCertificate-1531463968957.jpg',NULL,'2018-07-13',2,NULL,NULL),(12,NULL,'/img/req/image-1531846751594.jpg',NULL,'2018-07-18',5,NULL,1),(13,NULL,'/img/req/image-1532070358293.jpg',NULL,'2018-07-20',5,NULL,1),(14,NULL,'/img/req/image-1532071828650.jpg',NULL,'2018-07-20',5,NULL,2);
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
  `int_eventID` int(11) NOT NULL,
  `var_reqname` varchar(100) NOT NULL,
  `var_reqdesc` varchar(100) NOT NULL,
  `char_reqmode` char(25) NOT NULL,
  `var_case` varchar(25) NOT NULL,
  `char_reqtype` varchar(25) NOT NULL,
  PRIMARY KEY (`int_reqtypeID`),
  KEY `int_eventID` (`int_eventID`),
  CONSTRAINT `tbl_requirementtype_ibfk_1` FOREIGN KEY (`int_eventID`) REFERENCES `tbl_event` (`int_eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_requirementtype`
--

LOCK TABLES `tbl_requirementtype` WRITE;
/*!40000 ALTER TABLE `tbl_requirementtype` DISABLE KEYS */;
INSERT INTO `tbl_requirementtype` VALUES (1,3,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil '),(2,9,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil'),(3,2,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil'),(4,2,' Baptismal Certificate','Baptismal Certificate','Copy or Original','Ordinary','Church'),(5,10,'Valid ID  ','Valid ID of the owner','Copy','Ordinary','Civil'),(6,6,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil'),(7,7,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil'),(8,7,'Death Certificate','Death Certificate','Copy','Ordinary','Civil'),(9,11,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil'),(10,11,'Baptismal Certificate','Baptismal Certificate','Copy or Original','Ordinary','Church'),(11,14,'Valid ID','Valid ID of the person in the certificate','Copy','Ordinary','Civil'),(12,13,'Valid ID','Valid ID of the person reserving the facility','Copy','Ordinary','Civil'),(13,5,'Birth Certificate of the Groom','Birth Certificate of the Groom','Original','Ordinary','Civil'),(14,5,'Birth Certificate of the Bride','Birth Certificate of the Bride','Original','Ordinary','Civil'),(15,5,'Baptismal Certificate of the Groom','Baptismal Certificate of the groom with FOR MARRIAGE PUSPOSES ONLY annoitation','Original','Ordinary','Church'),(16,5,'Confirmation Certificate of the Groom','Confirmation Certificate of the groom with FOR MARRIAGE PURPOSES ONLY annoitatio','Original','Ordinary','Church'),(17,5,'Baptismal Certificate of the Bride','Baptismal Certificate of the bride with FOR MARRIAGE PURPOSES ONLY ','Original','Ordinary','Church'),(18,5,'Confirmation Certificate of the Bride','Confirmation Certificate of the bride with FOR MARRIAGE PURPOSES ONLY ','Original','Ordinary','Church'),(19,5,'Canonical Interview','Interview with the priest','Interview','Ordinary','Church'),(20,5,'Pre-Cana Seminar','Pre-wedding seminar','Seminar','Ordinary','Church'),(21,5,'Marriage Banns','Banns','Banns','Ordinary','Church'),(22,5,'Permission from Bride\'s Parish','Permission/ Letter from the bride\'s parish','Letter','Ordinary','Church'),(23,5,'Marriage License','License','Original','Ordinary','Church'),(24,5,'Marriage Contract','contract','Original','Ordinary','Civil'),(25,5,'NSO CENOMAR','NSO Certification of No Marriage','Original','Ordinary','Civil'),(26,5,'Clearance from Chancery Office','Clearance (form 3)','Clearance','Non-ordinary','Chancery'),(27,5,'Certification of Freedom to Marry from Embassy','Certification for foreigner','Original','Foreigner','Civil'),(28,5,'Certification of Freedom to Marry from Chancery','certification, for different cases','Certification','Non-ordinary','Chancery'),(29,5,'Permission for Mixed Marriage from Chancery','Permission for non-catholic','Original','Mixed Marriage','Chancery'),(30,5,'Affidavit or Co-habitation','for couple living in for more than 5 months','Original','Living-in','Civil'),(31,5,'Affidavit by the applicant with 2 witnesses','for no religion','Original','No religion','Civil'),(32,5,'Dispensation from Chancery','Dispensation from Chancery for different cases','Original','Dispensation','Chancery'),(33,5,'Decree of Divorced','for divorced','Original','Divorced','Civil'),(34,5,'Civil Annulment Decision with Certification of Finality','for divorced','Original','Divorced','Civil'),(35,5,'Declaration of Nullity by Catholic Matrimonial Tribunal','for divorced','Original','Divorced','Civil'),(36,5,'Copy of marriage cert','for divorced','Copy or Original','Dicvorced','Civil'),(37,5,'New copy of Marriage Contract','for renewal','Original','Renewal of vows','Civil'),(38,5,'Copy of Death Certificate','for widow/widower','Original','Widow/widower','Civil'),(39,5,'Copy of Marriage Contract','for widow/widower','Copy or Original','Widow/widower','Civil'),(40,5,'Military Clearance from Immediate Commanding Office','for military ','Original','Military','Civil'),(44,1,'Birth Certificate','Birth Certificate','Copy or Original','Ordinary','Civil');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_specialevent`
--

LOCK TABLES `tbl_specialevent` WRITE;
/*!40000 ALTER TABLE `tbl_specialevent` DISABLE KEYS */;
INSERT INTO `tbl_specialevent` VALUES (1,5,'asdfadfadfadfadf','it\'s a yeah ','2018-07-11 23:27:00','2018-07-11 23:27:00','dito lang','Open for everyone','Approved'),(4,5,'asdfadfadfadfadf','it\'s a yeah ','2018-07-11 23:27:00','2018-07-11 23:27:00','dito lang','Open for everyone','Approved');
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
INSERT INTO `tbl_sponsors` VALUES (35,26,'juan'),(36,26,'juan'),(37,26,'juan'),(38,26,'juan'),(39,28,'juan'),(40,28,'ate'),(41,28,'kuya'),(42,28,'pedro'),(43,29,'juan'),(44,29,'pedro'),(45,29,'kuya'),(46,29,'ate');
/*!40000 ALTER TABLE `tbl_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_steps`
--

DROP TABLE IF EXISTS `tbl_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_steps` (
  `int_weddingsteps` int(11) NOT NULL AUTO_INCREMENT,
  `var_weddingstepname` varchar(45) NOT NULL,
  PRIMARY KEY (`int_weddingsteps`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_steps`
--

LOCK TABLES `tbl_steps` WRITE;
/*!40000 ALTER TABLE `tbl_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_steps` ENABLE KEYS */;
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
  `int_utilitiesID` int(11) NOT NULL AUTO_INCREMENT,
  `int_eventID` int(11) NOT NULL,
  `int_reservationmindays` int(11) NOT NULL,
  `int_reservationmaxdays` int(11) NOT NULL,
  `int_paymentdays` int(11) DEFAULT NULL,
  `int_requirementsdays` int(11) NOT NULL,
  `int_refunddays` int(11) DEFAULT NULL,
  `double_refundpercent` double DEFAULT NULL,
  `int_agelimit` int(11) DEFAULT NULL,
  `double_fee` double DEFAULT NULL,
  `time_duration` time NOT NULL,
  `double_addrate` double NOT NULL,
  `int_facilitypax` int(11) NOT NULL,
  PRIMARY KEY (`int_utilitiesID`),
  KEY `tbl_ibfk1_idx` (`int_eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_utilities`
--

LOCK TABLES `tbl_utilities` WRITE;
/*!40000 ALTER TABLE `tbl_utilities` DISABLE KEYS */;
INSERT INTO `tbl_utilities` VALUES (1,3,14,90,10,7,NULL,NULL,11,300,'01:00:00',50,0),(2,9,14,90,10,7,NULL,NULL,11,1000,'01:00:00',50,0);
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
  `char_weddingtype` char(15) NOT NULL,
  UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE,
  CONSTRAINT `tbl_wedcouple_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_wedcouple`
--

LOCK TABLES `tbl_wedcouple` WRITE;
/*!40000 ALTER TABLE `tbl_wedcouple` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_wedcouple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_weddingcases`
--

DROP TABLE IF EXISTS `tbl_weddingcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_weddingcases` (
  `int_weddingcaseID` int(11) NOT NULL AUTO_INCREMENT,
  `var_casename` varchar(45) NOT NULL,
  `var_casedesc` varchar(100) NOT NULL,
  `var_caseprocess` varchar(100) NOT NULL,
  PRIMARY KEY (`int_weddingcaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_weddingcases`
--

LOCK TABLES `tbl_weddingcases` WRITE;
/*!40000 ALTER TABLE `tbl_weddingcases` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_weddingcases` ENABLE KEYS */;
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

-- Dump completed on 2018-07-20 16:10:08
