-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: SES
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assign_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `scheduled_performance_date` date NOT NULL,
  `scheduled_submission_date` date DEFAULT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `fk3` (`sid`),
  CONSTRAINT `fk3` FOREIGN KEY (`sid`) REFERENCES `LTL` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `roll_no` int(11) NOT NULL,
  `attendance` smallint(6) NOT NULL,
  KEY `roll_no` (`roll_no`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticate`
--

DROP TABLE IF EXISTS `authenticate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticate` (
  `tid` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `uname` int(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  KEY `authenticate_fk` (`tid`),
  CONSTRAINT `authenticate_fk` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticate`
--

LOCK TABLES `authenticate` WRITE;
/*!40000 ALTER TABLE `authenticate` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` varchar(20) NOT NULL,
  `strength` smallint(6) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_has_students`
--

DROP TABLE IF EXISTS `batch_has_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_has_students` (
  `roll_no` int(11) NOT NULL,
  `bid` varchar(20) NOT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `bid` (`bid`),
  CONSTRAINT `batch_has_students_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `batch_has_students_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_has_students`
--

LOCK TABLES `batch_has_students` WRITE;
/*!40000 ALTER TABLE `batch_has_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_has_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `cid` varchar(20) NOT NULL,
  `strength` smallint(6) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_coordinator`
--

DROP TABLE IF EXISTS `class_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_coordinator` (
  `tid` varchar(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_coordinator`
--

LOCK TABLES `class_coordinator` WRITE;
/*!40000 ALTER TABLE `class_coordinator` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_has_batch`
--

DROP TABLE IF EXISTS `class_has_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_batch` (
  `cid` varchar(20) DEFAULT NULL,
  `bid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_has_batch`
--

LOCK TABLES `class_has_batch` WRITE;
/*!40000 ALTER TABLE `class_has_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_has_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_has_students`
--

DROP TABLE IF EXISTS `class_has_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_students` (
  `roll_no` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `cid` (`cid`),
  CONSTRAINT `class_has_students_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `class_has_students_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_has_students`
--

LOCK TABLES `class_has_students` WRITE;
/*!40000 ALTER TABLE `class_has_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_has_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `roll_no` int(11) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  PRIMARY KEY (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_gives_UT`
--

DROP TABLE IF EXISTS `student_gives_UT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_gives_UT` (
  `roll_no` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `ut1` int(11) NOT NULL,
  `ut2` int(11) NOT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `sid` (`sid`),
  CONSTRAINT `student_gives_UT_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE,
  CONSTRAINT `student_gives_UT_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `CTL` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gives_UT`
--

LOCK TABLES `student_gives_UT` WRITE;
/*!40000 ALTER TABLE `student_gives_UT` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_gives_UT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_performs_assignment`
--

DROP TABLE IF EXISTS `student_performs_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_performs_assignment` (
  `roll_no` int(11) NOT NULL,
  `assign_id` int(11) NOT NULL,
  `actual_performance_date` date NOT NULL,
  `actual_submission_date` date NOT NULL,
  `rpp` int(11) NOT NULL,
  `spo` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  KEY `roll_no` (`roll_no`),
  KEY `fk6` (`assign_id`),
  CONSTRAINT `fk6` FOREIGN KEY (`assign_id`) REFERENCES `assignment` (`assign_id`),
  CONSTRAINT `student_performs_assignment_ibfk_1` FOREIGN KEY (`roll_no`) REFERENCES `student` (`roll_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_performs_assignment`
--

LOCK TABLES `student_performs_assignment` WRITE;
/*!40000 ALTER TABLE `student_performs_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_performs_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `sid` int(11) NOT NULL,
  `year` varchar(10) NOT NULL,
  `semester` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name` (`name`,`abbrevation`),
  UNIQUE KEY `abbrevation` (`abbrevation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `tid` varchar(20) NOT NULL,
  `tname` varchar(30) NOT NULL,
  `abbrevation` varchar(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teaches_batch`
--

DROP TABLE IF EXISTS `teacher_teaches_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teaches_batch` (
  `bid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `sid` int(11) NOT NULL,
  KEY `bid` (`bid`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_teaches_batch_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `batch` (`bid`),
  CONSTRAINT `teacher_teaches_batch_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_batch_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teaches_batch`
--

LOCK TABLES `teacher_teaches_batch` WRITE;
/*!40000 ALTER TABLE `teacher_teaches_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teaches_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teaches_class`
--

DROP TABLE IF EXISTS `teacher_teaches_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teaches_class` (
  `cid` varchar(20) NOT NULL,
  `tid` varchar(20) NOT NULL,
  `sid` int(11) NOT NULL,
  KEY `cid` (`cid`),
  KEY `tid` (`tid`),
  KEY `sid` (`sid`),
  CONSTRAINT `teacher_teaches_class_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `class` (`cid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_class_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `teacher_teaches_class_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teaches_class`
--

LOCK TABLES `teacher_teaches_class` WRITE;
/*!40000 ALTER TABLE `teacher_teaches_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teaches_class` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-03 15:55:10
