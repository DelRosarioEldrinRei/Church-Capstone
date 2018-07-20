-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2018 at 04:56 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sad_church`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment`
--

CREATE TABLE `tbl_appointment` (
  `char_appointstatus` char(20) NOT NULL,
  `int_userID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_baptism`
--

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
  `char_baptismtype` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_baptism`
--

INSERT INTO `tbl_baptism` (`int_eventinfoID`, `var_parentmarriageadd`, `var_fatherbplace`, `var_motherbplace`, `var_fathername`, `var_mothername`, `var_contactnum`, `date_desireddate`, `time_desiredtime`, `char_baptismtype`) VALUES
(6, 'heree', 'Quezon City', 'Quezon City', 'Ebrada, Fidel', 'Ebrada, Josephine', '09277475753', '2018-06-19', '10:00:00', 'Special'),
(7, 'asfdasdfadsf', 'Quezon City', 'Quezon City', 'Ebrada, Fidel', 'Ebrada, Josephine', '09277475711', '2018-06-19', '10:00:00', 'Special'),
(10, 'thereeee', 'Quezon City', 'Quezon City', 'Ebrada, Fidel', 'Ebrada, Josephine', '09277475753', '2018-07-15', '11:00:00', 'Regular'),
(12, 'asdfasdfasdfasdfee', 'Quezon City', 'Quezon City', 'Canhuli, Juan', 'Canhuli. Jenuaaaa', '09277475753', '2018-07-15', '11:00:00', 'Regular');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_blessing`
--

CREATE TABLE `tbl_blessing` (
  `int_eventinfoID` int(11) NOT NULL,
  `var_blessingvenue` varchar(100) NOT NULL,
  `var_blessingdetails` varchar(100) NOT NULL,
  `date_desireddate1` date NOT NULL,
  `date_desireddate2` date NOT NULL,
  `time_desiredtime1` time NOT NULL,
  `time_desiredtime2` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_blessing`
--

INSERT INTO `tbl_blessing` (`int_eventinfoID`, `var_blessingvenue`, `var_blessingdetails`, `date_desireddate1`, `date_desireddate2`, `time_desiredtime1`, `time_desiredtime2`) VALUES
(1, 'here', 'Surgery', '2018-05-29', '2018-05-29', '11:28:21', '04:17:28'),
(2, 'there', 'surgeryyy', '2018-06-27', '2018-06-28', '13:19:45', '04:24:10'),
(3, 'hereeeee', 'surgery nga', '2018-06-03', '2018-06-03', '11:58:00', '12:59:00'),
(4, 'there na lang', '', '2018-06-11', '2018-06-13', '09:06:00', '02:06:00'),
(5, 'asdf', 'asdf', '2018-06-03', '2018-06-03', '01:11:00', '01:11:00'),
(11, 'Ina ng Lupang Pangako Parish', 'Capstone', '2018-07-07', '2018-07-24', '01:51:00', '06:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_document`
--

CREATE TABLE `tbl_document` (
  `int_documentID` int(11) NOT NULL,
  `var_documenttype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_document`
--

INSERT INTO `tbl_document` (`int_documentID`, `var_documenttype`) VALUES
(1, 'Baptismal Certificate'),
(2, 'Confirmation Certificate'),
(3, 'First Communion Certificate'),
(4, 'Facility Permit'),
(5, 'Voucher');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_documentrequest`
--

CREATE TABLE `tbl_documentrequest` (
  `int_requestID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL,
  `int_documentID` int(11) NOT NULL,
  `int_eventinfoID` int(11) DEFAULT NULL,
  `var_doclastname` varchar(50) NOT NULL,
  `var_docfirstname` varchar(50) NOT NULL,
  `text_purpose` text NOT NULL,
  `date_docurequested` date NOT NULL,
  `date_docureleased` date DEFAULT NULL,
  `date_docureceived` int(11) DEFAULT NULL,
  `char_docustatus` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_documentrequest`
--

INSERT INTO `tbl_documentrequest` (`int_requestID`, `int_userID`, `int_documentID`, `int_eventinfoID`, `var_doclastname`, `var_docfirstname`, `text_purpose`, `date_docurequested`, `date_docureleased`, `date_docureceived`, `char_docustatus`) VALUES
(1, 11, 1, NULL, 'Ebrada', 'Jonalyn Fe', 'wala lang hahaha', '2018-07-04', NULL, NULL, 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event`
--

CREATE TABLE `tbl_event` (
  `int_eventID` int(10) NOT NULL,
  `var_eventname` varchar(50) NOT NULL,
  `var_eventdesc` text NOT NULL,
  `var_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_event`
--

INSERT INTO `tbl_event` (`int_eventID`, `var_eventname`, `var_eventdesc`, `var_type`) VALUES
(1, 'Anointing of the sick', 'The anointing of the sick is administered to bring spiritual and even physical strength during an illness, especially near the time of death. It is most likely one of the last sacraments one will receive. A sacrament is an outward sign established by Jesus Christ to confer inward grace. In more basic terms, it is a rite that is performed to convey God’s grace to the recipient, through the power of the Holy Spirit.', 'Sacrament'),
(2, 'Confirmation', 'The sacrament of confirmation completes the sacrament of baptism. If baptism is the sacrament of re-birth to a new and supernatural life, confir- mation is the sacrament of maturity and coming of age. The real confession of Christ consist in this ''that the whole man submits himself to Truth, in the judgment of his understanding, in the submission of his will and in the consecration of his whole power of love . . . To do this, poor-spirited man is only able when he has been confirmed by God''s grace''\r\n\r\nThis confirmation in the power of the Holy Spirit leading to a firm profession of faith has always been the particular effect which Catholic tradition has ascribed to the sacrament. It is effect which complements and completes that of baptism.\r\n\r\nTHE CHURCH TEACHES\r\nConfirmation is a true sacrament instituted by Christ and different from baptism. It is administered by laying-on of hands and anointing with chrism accompanied by prayer. The chrism is blessed by the bishop and the bishop administers the sacrament. All baptized persons can and should be confirmed. The effect of the sacrament of confirmation is to give strength in faith and for the confession of faith and to impress an indelible character.', 'Sacrament'),
(3, 'Baptism', 'The sacrament of Baptism is the beginning of life—supernatural life. Because of original sin, we come into the world with a soul which is supernaturally dead. We come into the world with only the natural endowments of human nature. The supernatural life which is the result of God’s personal and intimate indwelling, is absent from the soul.\r\n\r\nOriginal sin is not, in the strict sense, a “blot” upon the soul. Indeed, original sin is not a “something” at all. It is the absence of something that should be there. It is a darkness where there ought to be light.\r\n\r\nJesus instituted the sacrament of Baptism to apply to each individual soul the atonement which He made on the Cross for original sin.\r\n\r\nJesus will not force His gift upon us, the gift of supernatural life for which He paid. He holds the gift out to us hopefully, but each of us must freely accept it. We make that acceptance by receiving the sacrament of Baptism.\r\n\r\nWhen the sacrament of Baptism is administered, the spiritual vacuum which we call original sin disappears as God becomes present in the soul, and the soul is caught up into that sharing of God’s own life which we call sanctifying grace.\r\n\r\n(c) http://www.beginningcatholic.com/baptism', 'Sacrament'),
(4, 'Funeral Service', 'The rite of committal, the conclusion of the funeral rites, is the final act of the community of faith in caring for the body of its deceased member. It may be celebrated at the grave, tomb, or crematorium and may be used for burial at sea. Whenever possible, the rite of committal is to be celebrated at the site of committal, that is, beside the open grave or place of internment, rather than at a cemetery chapel.\r\n\r\n(c) http://www.ibreviary.com/m/preghiere.php?tipo=Rito&id=417', 'Special Service'),
(5, 'Marriage', 'When the Catholic Church teaches that marriage between two baptized persons is a sacrament, it is saying that the couple’s relationship expresses in a unique way the unbreakable bond of love between Christ and his people. Like the other six sacraments of the Church, marriage is a sign or symbol which reveals the Lord Jesus and through which his divine life and love are communicated. All seven sacraments were instituted by Christ and were entrusted to the Church to be celebrated in faith within and for the community of believers. The rituals and prayers by which a sacrament is celebrated serve to express visibly what God is doing invisibly.\r\n\r\nIn a sacramental marriage, God’s love becomes present to the spouses in their total union and also flows through them to their family and community. By their permanent, faithful and exclusive giving to each other, symbolized in sexual intercourse, the couple reveals something of God’s unconditional love. The sacrament of Christian marriage involves their entire life as they journey together through the ups and downs of marriage and become more able to give to and receive from each other. Their life becomes sacramental to the extent that the couple cooperates with God’s action in their life and sees themselves as living “in Christ” and Christ living and acting in their relationship, attitudes and actions.\r\n\r\nCatholic teaching holds that sacraments bring grace to those who receive them with the proper disposition. Grace is a way of describing how God shares the divine life with us and gives us the help we need to live as followers of Christ. In marriage, the grace of this sacrament brings to the spouses the particular help they need to be faithful and to be good parents. It also helps a couple to serve others beyond their immediate family and to show the community that a loving and lasting marriage is both desirable and possible.\r\n\r\n(C) http://www.foryourmarriage.org/marriage-as-sacrament/', 'Sacrament'),
(6, 'First Communion', 'first communion', 'Sacrament'),
(7, 'Funeral Mass', 'wala malagay si jonaaa', 'Sacrament'),
(9, 'Special Baptism', 'It includes adult baptism and special baptism.\r\ntuesday-sat', 'Special Service'),
(10, 'Establishment Blessing', 'House blessing belongs to the special services that our parish offers. ', 'Special Service'),
(11, 'Special Confirmation', 'espesyal na konpirmasyon', 'Special Service'),
(13, 'Facility Reservation', 'facility reservation', 'Special Service'),
(14, 'Document Request', 'Document Request', 'Special Service');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eventapplication`
--

CREATE TABLE `tbl_eventapplication` (
  `int_eventapplicationID` int(10) NOT NULL,
  `int_eventinfoID` int(10) NOT NULL,
  `int_paymentID` int(10) DEFAULT NULL,
  `char_approvalstatus` char(20) NOT NULL,
  `char_feestatus` char(15) NOT NULL,
  `char_reqstatus` char(15) NOT NULL,
  `var_remarks` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_eventapplication`
--

INSERT INTO `tbl_eventapplication` (`int_eventapplicationID`, `int_eventinfoID`, `int_paymentID`, `char_approvalstatus`, `char_feestatus`, `char_reqstatus`, `var_remarks`) VALUES
(1, 1, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(2, 2, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(3, 3, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(4, 4, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(5, 5, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(6, 6, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(7, 7, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(8, 8, NULL, 'Pending', 'No payment', 'No Requirements', ''),
(9, 9, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(10, 10, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(11, 11, NULL, 'Pending', 'Unpaid', 'Incomplete', ''),
(12, 12, NULL, 'Pending', 'Unpaid', 'Incomplete', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eventinfo`
--

CREATE TABLE `tbl_eventinfo` (
  `int_eventinfoID` int(10) NOT NULL,
  `int_userID` int(10) NOT NULL,
  `int_eventID` int(10) NOT NULL,
  `date_approveddate` date DEFAULT NULL,
  `time_approvedstart` time DEFAULT NULL,
  `time_approvedend` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_eventinfo`
--

INSERT INTO `tbl_eventinfo` (`int_eventinfoID`, `int_userID`, `int_eventID`, `date_approveddate`, `time_approvedstart`, `time_approvedend`) VALUES
(1, 11, 1, NULL, NULL, NULL),
(2, 11, 1, NULL, NULL, NULL),
(3, 11, 1, NULL, NULL, NULL),
(4, 11, 1, NULL, NULL, NULL),
(5, 11, 1, NULL, NULL, NULL),
(6, 11, 3, NULL, NULL, NULL),
(7, 11, 9, NULL, NULL, NULL),
(8, 11, 10, NULL, NULL, NULL),
(9, 11, 5, NULL, NULL, NULL),
(10, 11, 3, NULL, NULL, NULL),
(11, 11, 7, NULL, NULL, NULL),
(12, 11, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facility`
--

CREATE TABLE `tbl_facility` (
  `int_facilityID` int(11) NOT NULL,
  `var_facilityname` varchar(50) NOT NULL,
  `flt_rentfee` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_facility`
--

INSERT INTO `tbl_facility` (`int_facilityID`, `var_facilityname`, `flt_rentfee`) VALUES
(1, 'Bro. Roqueto 2nd floor', 1200),
(2, 'Bro. Roqueto 3rd floor', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facilityreservation`
--

CREATE TABLE `tbl_facilityreservation` (
  `int_reservationID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL,
  `int_facilityID` int(11) NOT NULL,
  `var_event` varchar(100) NOT NULL,
  `date_reservedate` date NOT NULL,
  `time_reservestart` time NOT NULL,
  `time_reserveend` time NOT NULL,
  `char_reservestatus` char(50) NOT NULL,
  `int_paymentID` int(11) DEFAULT NULL,
  `var_requirementID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_facilityreservation`
--

INSERT INTO `tbl_facilityreservation` (`int_reservationID`, `int_userID`, `int_facilityID`, `var_event`, `date_reservedate`, `time_reservestart`, `time_reserveend`, `char_reservestatus`, `int_paymentID`, `var_requirementID`) VALUES
(1, 11, 1, 'bday', '2018-07-04', '08:00:00', '10:00:00', 'Pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grd3students`
--

CREATE TABLE `tbl_grd3students` (
  `int_studentID` int(10) NOT NULL,
  `int_relationID` int(10) NOT NULL,
  `var_school` varchar(100) NOT NULL,
  `var_batch` varchar(20) NOT NULL,
  `var_section` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_houseblessing`
--

CREATE TABLE `tbl_houseblessing` (
  `int_eventinfoID` int(11) NOT NULL,
  `var_owner` varchar(100) NOT NULL,
  `var_estloc` varchar(100) NOT NULL,
  `var_ownercontactnum` varchar(13) NOT NULL,
  `var_owneremailadd` varchar(50) NOT NULL,
  `date_desireddate1` date NOT NULL,
  `date_desireddate2` date NOT NULL,
  `time_desiredtime1` time NOT NULL,
  `time_desiredtime2` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_houseblessing`
--

INSERT INTO `tbl_houseblessing` (`int_eventinfoID`, `var_owner`, `var_estloc`, `var_ownercontactnum`, `var_owneremailadd`, `date_desireddate1`, `date_desireddate2`, `time_desiredtime1`, `time_desiredtime2`) VALUES
(8, 'Ebrada, Jonalyn Fe', 'Payatas B Quezon City', '09277475753', 'jonalynfeebrada11@gmail.com', '2018-06-03', '2018-06-03', '03:11:00', '03:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

CREATE TABLE `tbl_message` (
  `int_messageID` int(10) NOT NULL,
  `int_senderID` int(10) NOT NULL,
  `int_receiverID` int(10) NOT NULL,
  `text_message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ministry`
--

CREATE TABLE `tbl_ministry` (
  `int_ministryID` int(10) NOT NULL,
  `int_userID` int(10) NOT NULL,
  `var_ministryname` varchar(30) NOT NULL,
  `var_position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `int_notifID` int(10) NOT NULL,
  `int_userID` int(10) NOT NULL,
  `var_notifdesc` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `int_paymentID` int(10) NOT NULL,
  `dbl_amount` double NOT NULL,
  `char_paymentstatus` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relation`
--

CREATE TABLE `tbl_relation` (
  `int_relationID` int(10) NOT NULL,
  `int_eventinfoID` int(10) NOT NULL,
  `var_relation` varchar(20) DEFAULT NULL,
  `var_lname` varchar(50) NOT NULL,
  `var_fname` varchar(50) NOT NULL,
  `var_mname` varchar(50) DEFAULT NULL,
  `char_gender` varchar(10) NOT NULL,
  `var_address` varchar(100) NOT NULL,
  `date_birthday` date NOT NULL,
  `var_birthplace` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_relation`
--

INSERT INTO `tbl_relation` (`int_relationID`, `int_eventinfoID`, `var_relation`, `var_lname`, `var_fname`, `var_mname`, `char_gender`, `var_address`, `date_birthday`, `var_birthplace`) VALUES
(1, 1, 'Spouse', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'here', '1998-11-11', 'Quezon City'),
(2, 2, 'Spouse', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'there', '2018-04-11', 'Quezon City'),
(3, 3, 'Spouse', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'hereeeee', '1998-11-11', 'Quezon City'),
(4, 4, 'Spouse', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'there na lang', '1998-11-11', 'Quezon City'),
(5, 5, 'Spouse', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'asdf', '2018-06-03', 'Quezon City'),
(6, 6, 'Parent', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'here', '2018-06-03', 'Quezon City'),
(7, 7, 'Parent', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'asdf', '2018-01-03', 'Quezon City'),
(8, 9, NULL, 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Male', 'herer', '2018-06-03', 'Quezon Citya'),
(9, 10, 'Parent', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'there', '1998-11-11', 'Quezon City'),
(10, 11, 'Spouse', 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', 'sa bahay namin ', '1998-11-11', 'Quezon City'),
(11, 12, 'Parent', 'Ebrada', 'Jonalyn Fe', 'Cruz', 'Female', 'jasdf', '2018-07-01', 'Quezon City');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requirements`
--

CREATE TABLE `tbl_requirements` (
  `int_requirementID` int(10) NOT NULL,
  `int_eventinfoID` int(10) NOT NULL,
  `var_reqpath` varchar(300) DEFAULT NULL,
  `var_reqloc` varchar(100) DEFAULT NULL,
  `var_reqtype` text NOT NULL,
  `date_reqreceived` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requirementtype`
--

CREATE TABLE `tbl_requirementtype` (
  `int_reqtypeID` int(11) NOT NULL,
  `int_eventID` int(11) NOT NULL,
  `var_reqname` varchar(100) NOT NULL,
  `var_reqdesc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_requirementtype`
--

INSERT INTO `tbl_requirementtype` (`int_reqtypeID`, `int_eventID`, `var_reqname`, `var_reqdesc`) VALUES
(1, 3, 'Birth Certificate', 'Birth Certificate'),
(2, 9, 'Birth Certificate', 'Birth Certificate'),
(3, 2, 'Birth Certificate', 'Birth Certificate'),
(4, 2, ' Baptismal Certificate', 'Baptismal Certificate'),
(5, 10, 'Valid ID  ', 'Valid ID of the owner'),
(6, 6, 'Birth Certificate', 'Birth Certificate'),
(7, 7, 'Birth Certificate', 'Birth Certificate'),
(8, 7, 'Death Certificate', 'Death Certificate'),
(9, 11, 'Birth Certificate', 'Birth Certificate'),
(10, 11, 'Baptismal Certificate', 'Baptismal Certificate'),
(11, 14, 'Valid ID', 'Valid ID of the person in the certificate'),
(12, 13, 'Valid ID', 'Valid ID of the person reserving the facility'),
(13, 5, 'Birth Certificate of the Groom', 'Birth Certificate of the Groom'),
(14, 5, 'Birth Certificate of the Bride', 'Birth Certificate of the Bride'),
(15, 5, 'Baptismal Certificate of the Groom', 'Baptismal Certificate of the groom with FOR MARRIAGE PUSPOSES ONLY annoitation'),
(16, 5, 'Confirmation Certificate of the Groom', 'Confirmation Certificate of the groom with FOR MARRIAGE PURPOSES ONLY annoitatio'),
(17, 5, 'Baptismal Certificate of the Bride', 'Baptismal Certificate of the bride with FOR MARRIAGE PURPOSES ONLY '),
(18, 5, 'Confirmation Certificate of the Bride', 'Confirmation Certificate of the bride with FOR MARRIAGE PURPOSES ONLY '),
(19, 5, 'Canonical Interview', 'Interview with the priest'),
(20, 5, 'Pre-Cana Seminar', 'Pre-wedding seminar'),
(21, 5, 'Marriage Banns', 'banns'),
(22, 5, 'Permission from Bride''s Parish', 'Permission/ Letter from the bride''s parish'),
(23, 5, 'Marriage License', 'License'),
(24, 5, 'Marriage Contract', 'contract'),
(25, 5, 'NSO CENOMAR', 'NSO Certification of No Marriage'),
(26, 5, 'Clearance from Chancery Office', 'Clearance (form 3)'),
(27, 5, 'Certification of Freedom to Marry from Embassy', 'Certification for foreigner'),
(28, 5, 'Certification of Freedom to Marry from Chancery', 'certification, for different cases'),
(29, 5, 'Permission for Mixed Marriage from Chancery', 'Permission for non-catholic'),
(30, 5, 'Affidavit or Co-habitation', 'for couple living in for more than 5 months'),
(31, 5, 'Affidavit by the applicant with 2 witnesses', 'for no religion'),
(32, 5, 'Dispensation from Chancery', 'Dispensation from Chancery for different cases'),
(33, 5, 'Decree of Divorced', 'for divorced'),
(34, 5, 'Civil Annulment Decision with Certification of Finality', 'for divorced'),
(35, 5, 'Declaration of Nullity by Catholic Matrimonial Tribunal', 'for divorced'),
(36, 5, 'Copy of marriage cert', 'for divorced'),
(37, 5, 'New copy of Marriage Contract', 'for renewal'),
(38, 5, 'Copy of Death Certificate', 'for widow/widower'),
(39, 5, 'Copy of Marriage Contract', 'for widow/widower'),
(40, 5, 'Military Clearance from Immediate Commanding Office', 'for military '),
(44, 1, 'Birth Certificate', 'Birth Certificate888');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `int_scheduleID` int(10) NOT NULL,
  `int_userID` int(10) NOT NULL,
  `int_eventinfoID` int(10) NOT NULL,
  `text_schedulenote` text NOT NULL,
  `var_venue` varchar(100) NOT NULL,
  `time_schedstart` time NOT NULL,
  `time_schedend` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_specialevent`
--

CREATE TABLE `tbl_specialevent` (
  `int_specialeventID` int(11) NOT NULL,
  `int_userID` int(11) NOT NULL,
  `var_spceventname` varchar(50) NOT NULL,
  `text_eventdesc` text NOT NULL,
  `time_eventstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_eventend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `var_eventvenue` varchar(200) NOT NULL,
  `char_eventtype` char(25) NOT NULL,
  `var_approvalstatus` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_specialevent`
--

INSERT INTO `tbl_specialevent` (`int_specialeventID`, `int_userID`, `var_spceventname`, `text_eventdesc`, `time_eventstart`, `time_eventend`, `var_eventvenue`, `char_eventtype`, `var_approvalstatus`) VALUES
(1, 5, 'LAKAD sa Summer', '', '2018-06-30 04:00:00', '2018-06-30 05:00:00', 'Bro. Roqueto', 'Open for everyone', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sponsors`
--

CREATE TABLE `tbl_sponsors` (
  `int_sponsorID` int(10) NOT NULL,
  `int_eventinfoID` int(10) NOT NULL,
  `var_sponsorname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sponsors`
--

INSERT INTO `tbl_sponsors` (`int_sponsorID`, `int_eventinfoID`, `var_sponsorname`) VALUES
(1, 6, 'Juan Dela Cruz'),
(2, 6, 'Juan Dela Cruz'),
(3, 6, 'Juan Dela Cruz'),
(4, 6, 'Juan Dela Cruz'),
(5, 6, 'Juan Dela Cruz'),
(6, 6, 'Juan Dela Cruz'),
(7, 6, 'Juan Dela Cruz'),
(8, 6, 'Juan Dela Cruz'),
(9, 7, 'Juan Dela Cruz'),
(10, 7, 'Juan Dela Cruz'),
(11, 7, 'Juan Dela Cruz'),
(12, 7, 'Juan Dela Cruz'),
(13, 7, 'Juan Dela Cruz'),
(14, 7, 'Juan Dela Cruz'),
(15, 7, 'Juan Dela Cruz'),
(16, 7, 'Juan Dela Cruz'),
(17, 9, 'Juan Dela Cruz'),
(18, 9, 'Juan Dela Cruz'),
(19, 9, 'Juan Dela Cruz'),
(20, 9, 'Juan Dela Cruz'),
(21, 9, 'Juan Dela Cruz'),
(22, 9, 'Juan Dela Cruz'),
(23, 9, 'Juan Dela Cruz'),
(24, 9, 'Juan Dela Cruz'),
(25, 10, 'Juan Dela Cruz'),
(26, 10, 'Juan Dela Cruzz'),
(27, 10, 'Juan Dela Cruz'),
(28, 10, 'Juan Dela Cruzzzz'),
(29, 10, 'Juan Dela Cruztt'),
(30, 10, 'Juan Dela Cruzoo'),
(31, 12, 'Juan Dela Cruz'),
(32, 12, 'Juan Dela Cruz'),
(33, 12, ''),
(34, 12, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `int_userID` int(10) NOT NULL,
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
  `char_usertype` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`int_userID`, `var_userlname`, `var_userfname`, `var_usermname`, `char_usergender`, `date_userbirthday`, `var_useraddress`, `var_usercontactnum`, `var_username`, `var_useremail`, `var_password`, `char_usertype`) VALUES
(5, 'Admin', 'admin', 'admin', 'Female', '1980-01-01', 'Anywhere', '09123456789', 'admin', 'admin@gmail.com', 'admin', 'Admin'),
(6, 'Secretariat', 'Secretariat', 'Secretariat', 'Female', '1980-04-01', 'Anywhere', '09999999999', 'secretariat', 'secretariat@gmail.com', 'secretariat', 'Secretariat'),
(7, 'Coordinator', 'Coordinator', 'Coordinator', 'Male', '1990-04-02', 'Anywhere', '09999999999', 'coordinator', 'coordinator@gmail.com', 'coordinator', 'Coordinator'),
(8, 'Catechist', 'Catechist', 'Catechist', 'Female', '1970-04-03', 'Anywhere', '0999999999', 'catechist', 'catechist', 'catechist', 'Catechist'),
(10, 'Priest', 'Priest', 'Priest', 'Male', '1970-04-04', 'Anyhwere', '09123456789', 'priest', 'priest@gmail.com', 'priest', 'Priest'),
(11, 'Ebrada', 'Jonalyn Fe', 'Desalisa', 'Female', '1998-11-11', 'Payatas B Quezon City', '09277475753', 'jonalynfe11', 'jonalynfeebrada11@gmail.com', '123jona', 'Guest'),
(12, 'Macaya', 'Joshua Rae', '', 'Male', '1998-12-22', 'Caloocan CIty', '09277475711', 'joshuarae', 'joshuarae@gmail.com', '123rae', 'Guest'),
(13, 'Del Rosario', 'Eldrin Rei', 'Dikolam', 'Male', '1998-01-01', 'Valenzuela City', '09277475742', 'eldrinrei', 'asdfwe', '123eldrin', 'Guest'),
(14, 'Peñaverde', 'Norme Ann Joyce', 'dunno', 'Female', '1999-07-06', 'Infanta Quezon', '09277475733', 'normeann', 'normeann', '123norme', 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wedbride`
--

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
  `var_bconplace` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wedbride`
--

INSERT INTO `tbl_wedbride` (`int_eventinfoID`, `var_blname`, `var_bfname`, `var_bmname`, `char_bgender`, `var_baddress`, `date_bbirthday`, `var_bbirthplace`, `var_bnationality`, `var_bcivilstatus`, `var_breligion`, `var_boccupation`, `bool_bpregnant`, `var_bfathername`, `var_bfatherbplace`, `var_bfatherreligion`, `var_bmothername`, `var_bmotherbplace`, `var_bmotherreligion`, `var_bcurrparish`, `bool_bbaptized`, `date_bbapdate`, `var_bbapplace`, `bool_bconfirmed`, `date_bcondate`, `var_bconplace`) VALUES
(9, 'Ebrada', 'Jonalyn Fe ', 'Desalisa', 'Female', 'asdfasdfasdfa', '2018-06-03', '', 'Filipino', 'Single', 'Catholic', 'IT', 0, 'Fidel Ebrada', 'Catholic', 'Quezon City', 'Josephine Ebrada', 'Catholic', 'Quezon City', 'INLPP', 0, '0000-00-00', '', 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wedcouple`
--

CREATE TABLE `tbl_wedcouple` (
  `int_eventinfoID` int(20) NOT NULL,
  `bool_livingin` tinyint(1) NOT NULL,
  `bool_married` tinyint(1) NOT NULL,
  `date_cprevweddate` date DEFAULT NULL,
  `var_cprevwedplace` varchar(100) DEFAULT NULL,
  `date_desireddate` date NOT NULL,
  `time_desiredtime` time NOT NULL,
  `char_weddingtype` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wedcouple`
--

INSERT INTO `tbl_wedcouple` (`int_eventinfoID`, `bool_livingin`, `bool_married`, `date_cprevweddate`, `var_cprevwedplace`, `date_desireddate`, `time_desiredtime`, `char_weddingtype`) VALUES
(9, 0, 0, NULL, NULL, '2018-06-03', '10:00:00', 'Ordinary');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wedgroom`
--

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
  `var_gconplace` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_wedgroom`
--

INSERT INTO `tbl_wedgroom` (`int_eventinfoID`, `var_gnationality`, `var_gcivilstatus`, `var_greligion`, `var_goccupation`, `var_gfathername`, `var_gfatherreligion`, `var_gfatherbplace`, `var_gmothername`, `var_gmotherreligion`, `var_gmotherbplace`, `var_gcurrparish`, `bool_gbaptized`, `date_gbapdate`, `var_gbapplace`, `bool_gconfirmed`, `date_gcondate`, `var_gconplace`) VALUES
(9, 'Filipino', 'Single', 'Catholic', 'IT professional', 'Fidel Ebrada', 'Catholic', 'Quezon City', 'Josephine Ebrada', 'Catholic', 'Quezon City', 'INLPP', 1, '2018-06-03', 'INLPP', 0, '0000-00-00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  ADD KEY `int_userID` (`int_userID`);

--
-- Indexes for table `tbl_baptism`
--
ALTER TABLE `tbl_baptism`
  ADD UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE;

--
-- Indexes for table `tbl_blessing`
--
ALTER TABLE `tbl_blessing`
  ADD UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`);

--
-- Indexes for table `tbl_document`
--
ALTER TABLE `tbl_document`
  ADD PRIMARY KEY (`int_documentID`);

--
-- Indexes for table `tbl_documentrequest`
--
ALTER TABLE `tbl_documentrequest`
  ADD PRIMARY KEY (`int_requestID`),
  ADD KEY `int_documentID` (`int_documentID`),
  ADD KEY `int_eventinfoID` (`int_eventinfoID`),
  ADD KEY `int_userID` (`int_userID`);

--
-- Indexes for table `tbl_event`
--
ALTER TABLE `tbl_event`
  ADD PRIMARY KEY (`int_eventID`);

--
-- Indexes for table `tbl_eventapplication`
--
ALTER TABLE `tbl_eventapplication`
  ADD PRIMARY KEY (`int_eventapplicationID`),
  ADD KEY `int_eventinfoID` (`int_eventinfoID`),
  ADD KEY `int_paymentID` (`int_paymentID`);

--
-- Indexes for table `tbl_eventinfo`
--
ALTER TABLE `tbl_eventinfo`
  ADD PRIMARY KEY (`int_eventinfoID`),
  ADD KEY `int_userID` (`int_userID`),
  ADD KEY `int_eventID` (`int_eventID`);

--
-- Indexes for table `tbl_facility`
--
ALTER TABLE `tbl_facility`
  ADD PRIMARY KEY (`int_facilityID`);

--
-- Indexes for table `tbl_facilityreservation`
--
ALTER TABLE `tbl_facilityreservation`
  ADD PRIMARY KEY (`int_reservationID`),
  ADD KEY `int_userID` (`int_userID`),
  ADD KEY `int_facilityID` (`int_facilityID`);

--
-- Indexes for table `tbl_grd3students`
--
ALTER TABLE `tbl_grd3students`
  ADD PRIMARY KEY (`int_studentID`),
  ADD KEY `int_relationID` (`int_relationID`);

--
-- Indexes for table `tbl_houseblessing`
--
ALTER TABLE `tbl_houseblessing`
  ADD UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`);

--
-- Indexes for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD PRIMARY KEY (`int_messageID`),
  ADD KEY `int_senderID` (`int_senderID`),
  ADD KEY `int_receiverID` (`int_receiverID`);

--
-- Indexes for table `tbl_ministry`
--
ALTER TABLE `tbl_ministry`
  ADD PRIMARY KEY (`int_ministryID`),
  ADD KEY `int_userID` (`int_userID`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`int_notifID`),
  ADD KEY `int_userID` (`int_userID`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`int_paymentID`);

--
-- Indexes for table `tbl_relation`
--
ALTER TABLE `tbl_relation`
  ADD PRIMARY KEY (`int_relationID`),
  ADD KEY `int_eventinfoID` (`int_eventinfoID`);

--
-- Indexes for table `tbl_requirements`
--
ALTER TABLE `tbl_requirements`
  ADD PRIMARY KEY (`int_requirementID`),
  ADD KEY `int_eventinfoID` (`int_eventinfoID`);

--
-- Indexes for table `tbl_requirementtype`
--
ALTER TABLE `tbl_requirementtype`
  ADD PRIMARY KEY (`int_reqtypeID`),
  ADD KEY `int_eventID` (`int_eventID`);

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`int_scheduleID`),
  ADD KEY `int_userID` (`int_userID`),
  ADD KEY `int_eventID` (`int_eventinfoID`);

--
-- Indexes for table `tbl_specialevent`
--
ALTER TABLE `tbl_specialevent`
  ADD PRIMARY KEY (`int_specialeventID`),
  ADD KEY `int_userID` (`int_userID`);

--
-- Indexes for table `tbl_sponsors`
--
ALTER TABLE `tbl_sponsors`
  ADD PRIMARY KEY (`int_sponsorID`),
  ADD KEY `int_eventinfoID` (`int_eventinfoID`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`int_userID`);

--
-- Indexes for table `tbl_wedbride`
--
ALTER TABLE `tbl_wedbride`
  ADD UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE;

--
-- Indexes for table `tbl_wedcouple`
--
ALTER TABLE `tbl_wedcouple`
  ADD UNIQUE KEY `int_eventinfoID` (`int_eventinfoID`) USING BTREE;

--
-- Indexes for table `tbl_wedgroom`
--
ALTER TABLE `tbl_wedgroom`
  ADD UNIQUE KEY `int_eventinfoID_2` (`int_eventinfoID`),
  ADD KEY `int_eventinfoID` (`int_eventinfoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_document`
--
ALTER TABLE `tbl_document`
  MODIFY `int_documentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_documentrequest`
--
ALTER TABLE `tbl_documentrequest`
  MODIFY `int_requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_event`
--
ALTER TABLE `tbl_event`
  MODIFY `int_eventID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_eventapplication`
--
ALTER TABLE `tbl_eventapplication`
  MODIFY `int_eventapplicationID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_eventinfo`
--
ALTER TABLE `tbl_eventinfo`
  MODIFY `int_eventinfoID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_facility`
--
ALTER TABLE `tbl_facility`
  MODIFY `int_facilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_facilityreservation`
--
ALTER TABLE `tbl_facilityreservation`
  MODIFY `int_reservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_grd3students`
--
ALTER TABLE `tbl_grd3students`
  MODIFY `int_studentID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_message`
--
ALTER TABLE `tbl_message`
  MODIFY `int_messageID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_ministry`
--
ALTER TABLE `tbl_ministry`
  MODIFY `int_ministryID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `int_notifID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_relation`
--
ALTER TABLE `tbl_relation`
  MODIFY `int_relationID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_requirements`
--
ALTER TABLE `tbl_requirements`
  MODIFY `int_requirementID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_requirementtype`
--
ALTER TABLE `tbl_requirementtype`
  MODIFY `int_reqtypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `int_scheduleID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_specialevent`
--
ALTER TABLE `tbl_specialevent`
  MODIFY `int_specialeventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_sponsors`
--
ALTER TABLE `tbl_sponsors`
  MODIFY `int_sponsorID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `int_userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  ADD CONSTRAINT `tbl_appointment_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`);

--
-- Constraints for table `tbl_baptism`
--
ALTER TABLE `tbl_baptism`
  ADD CONSTRAINT `tbl_baptism_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_blessing`
--
ALTER TABLE `tbl_blessing`
  ADD CONSTRAINT `tbl_blessing_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_documentrequest`
--
ALTER TABLE `tbl_documentrequest`
  ADD CONSTRAINT `tbl_documentrequest_ibfk_1` FOREIGN KEY (`int_documentID`) REFERENCES `tbl_document` (`int_documentID`),
  ADD CONSTRAINT `tbl_documentrequest_ibfk_2` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  ADD CONSTRAINT `tbl_documentrequest_ibfk_3` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`);

--
-- Constraints for table `tbl_eventapplication`
--
ALTER TABLE `tbl_eventapplication`
  ADD CONSTRAINT `tbl_eventapplication_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`),
  ADD CONSTRAINT `tbl_eventapplication_ibfk_2` FOREIGN KEY (`int_paymentID`) REFERENCES `tbl_payment` (`int_paymentID`);

--
-- Constraints for table `tbl_eventinfo`
--
ALTER TABLE `tbl_eventinfo`
  ADD CONSTRAINT `tbl_eventinfo_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`),
  ADD CONSTRAINT `tbl_eventinfo_ibfk_2` FOREIGN KEY (`int_eventID`) REFERENCES `tbl_event` (`int_eventID`) ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_facilityreservation`
--
ALTER TABLE `tbl_facilityreservation`
  ADD CONSTRAINT `tbl_facilityreservation_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`),
  ADD CONSTRAINT `tbl_facilityreservation_ibfk_2` FOREIGN KEY (`int_facilityID`) REFERENCES `tbl_facility` (`int_facilityID`);

--
-- Constraints for table `tbl_grd3students`
--
ALTER TABLE `tbl_grd3students`
  ADD CONSTRAINT `tbl_grd3students_ibfk_1` FOREIGN KEY (`int_relationID`) REFERENCES `tbl_relation` (`int_relationID`);

--
-- Constraints for table `tbl_houseblessing`
--
ALTER TABLE `tbl_houseblessing`
  ADD CONSTRAINT `tbl_houseblessing_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD CONSTRAINT `tbl_message_ibfk_1` FOREIGN KEY (`int_senderID`) REFERENCES `tbl_user` (`int_userID`),
  ADD CONSTRAINT `tbl_message_ibfk_2` FOREIGN KEY (`int_receiverID`) REFERENCES `tbl_user` (`int_userID`);

--
-- Constraints for table `tbl_ministry`
--
ALTER TABLE `tbl_ministry`
  ADD CONSTRAINT `tbl_ministry_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`);

--
-- Constraints for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD CONSTRAINT `tbl_notification_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`);

--
-- Constraints for table `tbl_relation`
--
ALTER TABLE `tbl_relation`
  ADD CONSTRAINT `tbl_relation_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_requirements`
--
ALTER TABLE `tbl_requirements`
  ADD CONSTRAINT `tbl_requirements_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_requirementtype`
--
ALTER TABLE `tbl_requirementtype`
  ADD CONSTRAINT `tbl_requirementtype_ibfk_1` FOREIGN KEY (`int_eventID`) REFERENCES `tbl_event` (`int_eventID`);

--
-- Constraints for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD CONSTRAINT `tbl_schedule_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`),
  ADD CONSTRAINT `tbl_schedule_ibfk_2` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_specialevent`
--
ALTER TABLE `tbl_specialevent`
  ADD CONSTRAINT `tbl_specialevent_ibfk_1` FOREIGN KEY (`int_userID`) REFERENCES `tbl_user` (`int_userID`);

--
-- Constraints for table `tbl_sponsors`
--
ALTER TABLE `tbl_sponsors`
  ADD CONSTRAINT `tbl_sponsors_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_wedbride`
--
ALTER TABLE `tbl_wedbride`
  ADD CONSTRAINT `tbl_wedbride_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_wedcouple`
--
ALTER TABLE `tbl_wedcouple`
  ADD CONSTRAINT `tbl_wedcouple_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

--
-- Constraints for table `tbl_wedgroom`
--
ALTER TABLE `tbl_wedgroom`
  ADD CONSTRAINT `tbl_wedgroom_ibfk_1` FOREIGN KEY (`int_eventinfoID`) REFERENCES `tbl_eventinfo` (`int_eventinfoID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
