-- MySQL dump 10.13  Distrib 5.1.45, for Win32 (ia32)
--
-- Host: localhost    Database: mifos
-- ------------------------------------------------------
-- Server version	5.1.45-community

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
-- Table structure for table `accepted_payment_type`
--

DROP TABLE IF EXISTS `accepted_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accepted_payment_type` (
  `accepted_payment_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `transaction_id` smallint(6) NOT NULL,
  `payment_type_id` smallint(6) NOT NULL,
  PRIMARY KEY (`accepted_payment_type_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_type_id` (`payment_type_id`),
  CONSTRAINT `accepted_payment_type_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_type` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `accepted_payment_type_ibfk_2` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accepted_payment_type`
--

LOCK TABLES `accepted_payment_type` WRITE;
/*!40000 ALTER TABLE `accepted_payment_type` DISABLE KEYS */;
INSERT INTO `accepted_payment_type` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1);
/*!40000 ALTER TABLE `accepted_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `global_account_num` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_state_id` smallint(6) DEFAULT NULL,
  `account_type_id` smallint(6) NOT NULL,
  `office_id` smallint(6) DEFAULT NULL,
  `personnel_id` smallint(6) DEFAULT NULL,
  `created_by` smallint(6) NOT NULL,
  `created_date` date NOT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  `offsetting_allowable` smallint(6) NOT NULL,
  `external_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_global_idx` (`global_account_num`),
  KEY `account_state_id` (`account_state_id`),
  KEY `account_type_id` (`account_type_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `office_id` (`office_id`),
  KEY `customer_id_account_idx` (`customer_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`account_state_id`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`account_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_ibfk_4` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_ibfk_5` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'000100000000001',1,11,3,3,3,1,'2010-07-01',NULL,NULL,NULL,1,1,NULL),(2,'000100000000002',2,11,3,3,3,1,'2010-07-02',NULL,NULL,NULL,2,1,NULL),(3,'000100000000003',3,11,3,3,3,1,'2010-07-02',NULL,NULL,NULL,2,1,NULL),(4,'000100000000004',3,7,1,3,3,1,'2010-07-02',1,'2010-07-18','2010-07-18',8,1,''),(5,'000100000000005',4,11,3,3,3,1,'2010-07-02',NULL,NULL,NULL,2,1,NULL),(6,'000100000000006',4,16,2,3,3,1,'2010-07-02',NULL,NULL,NULL,9,1,NULL),(7,'000100000000007',3,17,2,3,3,1,'2010-07-02',1,'2010-07-21','2010-07-21',4,1,NULL),(8,'000100000000008',4,3,1,3,3,1,'2010-07-02',1,'2010-07-02',NULL,2,1,''),(9,'000100000000009',5,11,3,3,3,1,'2010-07-02',NULL,NULL,NULL,2,1,NULL),(10,'000100000000010',6,11,3,3,3,1,'2010-07-03',NULL,NULL,NULL,2,1,NULL),(11,'000100000000011',6,16,2,3,3,1,'2010-07-03',1,'2010-07-03',NULL,13,1,NULL),(12,'000100000000012',7,11,3,3,3,1,'2010-07-03',NULL,NULL,NULL,2,1,NULL),(13,'000100000000013',7,16,2,3,3,1,'2010-07-03',NULL,NULL,NULL,8,1,NULL),(14,'000100000000014',7,16,2,3,3,1,'2010-07-03',NULL,NULL,NULL,9,1,NULL),(15,'000100000000015',6,3,1,3,3,1,'2010-07-04',1,'2010-07-04',NULL,2,1,''),(16,'000100000000016',7,3,1,3,3,1,'2010-07-04',1,'2010-07-05',NULL,2,1,''),(17,'000100000000017',3,17,2,3,3,1,'2010-07-05',1,'2010-07-05','2010-07-05',4,1,NULL),(18,'000100000000018',8,11,3,3,3,1,'2010-07-05',NULL,NULL,NULL,2,1,NULL),(19,'000100000000019',9,11,3,3,3,1,'2010-07-05',NULL,NULL,NULL,2,1,NULL),(20,'000100000000020',9,17,2,3,3,1,'2010-07-05',1,'2010-07-05','2010-07-05',9,1,NULL),(21,'000100000000021',3,10,1,3,3,1,'2010-07-18',1,'2010-07-18','2010-07-18',8,1,''),(22,'000100000000022',10,11,3,3,4,1,'2010-07-18',NULL,NULL,NULL,2,1,NULL),(23,'000100000000023',10,3,1,3,4,1,'2010-07-18',1,'2010-07-18',NULL,2,1,''),(24,'000100000000024',10,18,2,3,4,1,'2010-07-18',1,'2010-07-18',NULL,11,1,NULL),(25,'000100000000025',11,11,3,4,5,1,'2010-07-20',NULL,NULL,NULL,1,1,NULL),(26,'000100000000026',12,11,3,4,5,1,'2010-07-20',NULL,NULL,NULL,2,1,NULL),(27,'000100000000027',13,11,3,4,5,1,'2010-07-20',NULL,NULL,NULL,2,1,NULL),(28,'000100000000028',14,11,3,4,5,1,'2010-07-20',NULL,NULL,NULL,2,1,NULL),(29,'000100000000029',15,11,3,4,5,1,'2010-07-20',NULL,NULL,NULL,2,1,NULL),(30,'000100000000030',13,16,2,4,5,1,'2010-07-21',1,'2010-07-21',NULL,11,1,NULL),(31,'000100000000031',13,14,2,4,5,1,'2010-07-21',NULL,NULL,NULL,1,1,NULL),(32,'000100000000032',13,5,1,4,5,1,'2010-07-21',1,'2010-07-21',NULL,4,1,''),(33,'000100000000033',16,11,3,3,3,1,'2010-07-21',NULL,NULL,NULL,2,1,NULL),(34,'000100000000034',16,17,2,3,3,1,'2010-07-21',1,'2010-07-21','2010-07-21',3,1,NULL),(35,'000100000000035',17,11,3,3,3,1,'2010-07-21',NULL,NULL,NULL,2,1,NULL),(36,'000100000000036',17,17,2,3,3,1,'2010-07-21',1,'2010-07-21','2010-07-21',3,1,NULL),(37,'000100000000037',18,11,3,3,5,1,'2010-07-22',NULL,NULL,NULL,3,1,NULL),(38,'000100000000038',18,6,1,3,5,1,'2010-07-22',1,'2010-07-24','2010-07-24',5,1,''),(39,'000100000000039',19,11,3,3,4,1,'2010-07-22',NULL,NULL,NULL,1,1,NULL),(40,'000100000000040',20,11,3,3,4,1,'2010-07-22',NULL,NULL,NULL,2,1,NULL),(41,'000100000000041',21,11,3,3,4,1,'2010-07-22',NULL,NULL,NULL,2,1,NULL),(42,'000100000000042',22,11,3,3,4,1,'2010-07-22',NULL,NULL,NULL,2,1,NULL),(43,'000100000000043',23,11,3,3,3,1,'2010-07-22',NULL,NULL,NULL,2,1,NULL),(44,'000100000000044',23,7,1,3,3,1,'2010-07-22',1,'2010-07-23','2010-07-23',4,1,''),(45,'000100000000045',24,11,3,3,3,1,'2010-07-22',NULL,NULL,NULL,2,1,NULL),(46,'000100000000046',24,17,2,3,3,1,'2010-07-22',1,'2010-07-23','2010-07-23',4,1,NULL),(47,'000100000000047',18,17,2,3,5,1,'2010-07-25',1,'2010-07-25','2010-07-25',4,1,NULL),(48,'000100000000048',25,11,3,3,3,1,'2010-07-25',NULL,NULL,NULL,1,1,NULL),(49,'000100000000049',26,11,3,3,3,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(50,'000100000000050',27,11,3,3,4,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(51,'000100000000051',28,11,3,3,3,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(52,'000100000000052',28,16,2,3,3,1,'2010-07-25',NULL,NULL,NULL,9,1,NULL),(53,'000100000000053',28,3,1,3,3,1,'2010-07-25',1,'2010-07-25',NULL,2,1,''),(54,'000100000000054',29,11,3,4,5,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(55,'000100000000055',29,3,1,4,5,1,'2010-07-25',1,'2010-07-25',NULL,2,1,''),(56,'000100000000056',29,16,2,4,5,1,'2010-07-25',1,'2010-07-25',NULL,10,1,NULL),(57,'000100000000057',30,11,3,4,5,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(58,'000100000000058',30,16,2,4,5,1,'2010-07-25',1,'2010-07-25',NULL,10,1,NULL),(59,'000100000000059',30,3,1,4,5,1,'2010-07-25',1,'2010-07-25',NULL,2,1,''),(60,'000100000000060',31,11,3,4,5,1,'2010-07-25',NULL,NULL,NULL,1,1,NULL),(61,'000100000000061',31,16,2,4,5,1,'2010-07-25',1,'2010-07-25',NULL,5,1,NULL),(62,'000100000000062',32,11,3,3,3,1,'2010-07-25',NULL,NULL,NULL,1,1,NULL),(63,'000100000000063',33,11,3,3,6,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(64,'000100000000064',33,16,2,3,6,1,'2010-07-25',1,'2010-07-25',NULL,10,1,NULL),(65,'000100000000065',34,11,3,3,6,1,'2010-07-25',NULL,NULL,NULL,2,1,NULL),(66,'000100000000066',34,3,1,3,6,1,'2010-07-25',1,'2010-07-25',NULL,2,1,''),(67,'000100000000067',32,16,2,3,4,1,'2010-07-28',1,'2010-07-28',NULL,5,1,NULL),(68,'000100000000068',35,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(69,'000100000000069',36,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(70,'000100000000070',37,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(71,'000100000000071',38,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(72,'000100000000072',39,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(73,'000100000000073',40,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(74,'000100000000074',41,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,1,1,NULL),(75,'000100000000075',42,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(76,'000100000000076',42,16,2,3,3,1,'2010-07-29',1,'2010-07-29',NULL,7,1,NULL),(77,'000100000000077',43,11,3,3,4,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(78,'000100000000078',43,3,1,3,4,1,'2010-07-29',1,'2010-07-29',NULL,2,1,''),(79,'000100000000079',44,11,3,3,4,1,'2010-07-29',NULL,NULL,NULL,3,1,NULL),(80,'000100000000080',44,16,2,3,4,1,'2010-07-29',1,'2010-07-29',NULL,7,1,NULL),(81,'000100000000081',45,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(82,'000100000000082',45,16,2,3,3,1,'2010-07-29',1,'2010-07-29',NULL,8,1,NULL),(83,'000100000000083',46,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(84,'000100000000084',46,17,2,3,3,1,'2010-07-29',1,'2010-07-31','2010-07-31',3,1,NULL),(85,'000100000000085',47,11,3,3,3,1,'2010-07-29',NULL,NULL,NULL,2,1,NULL),(86,'000100000000086',47,10,1,3,3,1,'2010-07-29',1,'2010-07-31','2010-07-31',3,1,''),(87,'000100000000087',48,11,3,3,3,1,'2010-07-31',NULL,NULL,NULL,2,1,NULL),(88,'000100000000088',48,16,2,3,3,1,'2010-07-31',1,'2010-07-31',NULL,4,1,NULL),(89,'000100000000089',49,11,3,3,3,1,'2010-08-01',NULL,NULL,NULL,2,1,NULL),(90,'000100000000090',50,11,3,3,3,1,'2010-08-01',NULL,NULL,NULL,2,1,NULL),(91,'000100000000091',50,3,1,3,3,1,'2010-08-01',1,'2010-08-01',NULL,2,1,''),(92,'000100000000092',51,11,3,3,3,1,'2010-08-01',NULL,NULL,NULL,2,1,NULL),(93,'000100000000093',51,17,2,3,3,1,'2010-08-01',1,'2010-08-03','2010-08-03',2,1,NULL),(94,'000100000000094',52,11,3,3,6,1,'2010-08-01',NULL,NULL,NULL,2,1,NULL),(95,'000100000000095',52,17,2,3,6,1,'2010-08-01',1,'2010-08-07','2010-08-07',4,1,NULL),(96,'000100000000096',53,11,3,3,3,1,'2010-08-04',NULL,NULL,NULL,2,1,NULL),(97,'000100000000097',54,11,3,3,3,1,'2010-08-04',NULL,NULL,NULL,2,1,NULL),(98,'000100000000098',55,11,3,3,3,1,'2010-08-07',NULL,NULL,NULL,1,1,NULL),(99,'000100000000099',56,11,3,3,3,1,'2010-08-07',NULL,NULL,NULL,2,1,NULL),(100,'000100000000100',56,17,2,3,3,1,'2010-08-07',1,'2010-08-10','2010-08-10',3,1,NULL),(101,'000100000000101',57,11,3,3,3,1,'2010-08-07',NULL,NULL,NULL,2,1,NULL),(102,'000100000000102',57,17,2,3,3,1,'2010-08-07',1,'2010-08-10','2010-08-10',3,1,NULL),(103,'000100000000103',58,11,3,3,3,1,'2010-08-20',NULL,NULL,NULL,2,1,NULL),(104,'000100000000104',59,11,3,3,3,1,'2010-08-20',NULL,NULL,NULL,2,1,NULL),(105,'000100000000105',60,11,3,6,7,1,'2010-08-27',NULL,NULL,NULL,1,1,NULL),(106,'000100000000106',61,11,3,6,7,1,'2010-08-27',NULL,NULL,NULL,2,1,NULL),(107,'000100000000107',62,11,3,6,7,1,'2010-08-27',1,'2010-08-27',NULL,9,1,NULL),(108,'000100000000108',63,11,3,6,7,1,'2010-08-27',NULL,NULL,NULL,2,1,NULL),(109,'000100000000109',63,16,2,6,7,1,'2010-08-27',1,'2010-08-27',NULL,3,1,NULL),(110,'000100000000110',64,11,3,6,7,1,'2010-08-28',NULL,NULL,NULL,1,1,NULL),(111,'000100000000111',65,11,3,6,7,1,'2010-08-28',NULL,NULL,NULL,2,1,NULL),(112,'000100000000112',65,10,1,6,7,1,'2010-08-28',1,'2010-08-28','2010-08-28',9,1,'');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_action`
--

DROP TABLE IF EXISTS `account_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_action` (
  `account_action_id` smallint(6) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`account_action_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `account_action_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_action`
--

LOCK TABLES `account_action` WRITE;
/*!40000 ALTER TABLE `account_action` DISABLE KEYS */;
INSERT INTO `account_action` VALUES (1,167),(2,168),(3,169),(4,170),(5,171),(6,172),(7,173),(8,191),(9,192),(10,193),(11,214),(12,362),(13,364),(14,366),(15,547),(16,548),(17,549),(18,572),(19,573),(20,610);
/*!40000 ALTER TABLE `account_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_activity`
--

DROP TABLE IF EXISTS `account_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `personnel_id` smallint(6) NOT NULL,
  `activity_name` varchar(50) NOT NULL,
  `principal` decimal(21,4) DEFAULT NULL,
  `principal_currency_id` smallint(6) DEFAULT NULL,
  `principal_outstanding` decimal(21,4) DEFAULT NULL,
  `principal_outstanding_currency_id` smallint(6) DEFAULT NULL,
  `interest` decimal(13,10) DEFAULT NULL,
  `interest_currency_id` smallint(6) DEFAULT NULL,
  `interest_outstanding` decimal(13,10) DEFAULT NULL,
  `interest_outstanding_currency_id` smallint(6) DEFAULT NULL,
  `fee` decimal(13,2) DEFAULT NULL,
  `fee_currency_id` smallint(6) DEFAULT NULL,
  `fee_outstanding` decimal(13,2) DEFAULT NULL,
  `fee_outstanding_currency_id` smallint(6) DEFAULT NULL,
  `penalty` decimal(13,10) DEFAULT NULL,
  `penalty_currency_id` smallint(6) DEFAULT NULL,
  `penalty_outstanding` decimal(13,10) DEFAULT NULL,
  `penalty_outstanding_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `account_id` (`account_id`),
  KEY `principal_currency_id` (`principal_currency_id`),
  KEY `principal_outstanding_currency_id` (`principal_outstanding_currency_id`),
  KEY `interest_currency_id` (`interest_currency_id`),
  KEY `interest_outstanding_currency_id` (`interest_outstanding_currency_id`),
  KEY `fee_currency_id` (`fee_currency_id`),
  KEY `fee_outstanding_currency_id` (`fee_outstanding_currency_id`),
  KEY `penalty_currency_id` (`penalty_currency_id`),
  KEY `penalty_outstanding_currency_id` (`penalty_outstanding_currency_id`),
  CONSTRAINT `account_activity_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_2` FOREIGN KEY (`principal_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_3` FOREIGN KEY (`principal_outstanding_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_4` FOREIGN KEY (`interest_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_5` FOREIGN KEY (`interest_outstanding_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_6` FOREIGN KEY (`fee_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_7` FOREIGN KEY (`fee_outstanding_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_8` FOREIGN KEY (`penalty_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_activity_ibfk_9` FOREIGN KEY (`penalty_outstanding_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_activity`
--

LOCK TABLES `account_activity` WRITE;
/*!40000 ALTER TABLE `account_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_custom_field`
--

DROP TABLE IF EXISTS `account_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_custom_field` (
  `account_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `field_id` smallint(6) NOT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`account_custom_field_id`),
  KEY `field_id` (`field_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `account_custom_field_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `custom_field_definition` (`field_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_custom_field_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_custom_field`
--

LOCK TABLES `account_custom_field` WRITE;
/*!40000 ALTER TABLE `account_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_fees`
--

DROP TABLE IF EXISTS `account_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_fees` (
  `account_fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `fee_id` smallint(6) NOT NULL,
  `fee_frequency` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `inherited_flag` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `account_fee_amnt` decimal(21,4) NOT NULL,
  `account_fee_amnt_currency_id` smallint(6) DEFAULT NULL,
  `fee_amnt` decimal(21,4) NOT NULL,
  `fee_status` smallint(6) DEFAULT NULL,
  `status_change_date` date DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  `last_applied_date` date DEFAULT NULL,
  PRIMARY KEY (`account_fee_id`),
  KEY `fee_id` (`fee_id`),
  KEY `account_fee_amnt_currency_id` (`account_fee_amnt_currency_id`),
  KEY `fee_frequency` (`fee_frequency`),
  KEY `account_fees_id_idx` (`account_id`,`fee_id`),
  CONSTRAINT `account_fees_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_fees_ibfk_2` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_fees_ibfk_3` FOREIGN KEY (`account_fee_amnt_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_fees_ibfk_4` FOREIGN KEY (`fee_frequency`) REFERENCES `recurrence_detail` (`details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_fees`
--

LOCK TABLES `account_fees` WRITE;
/*!40000 ALTER TABLE `account_fees` DISABLE KEYS */;
INSERT INTO `account_fees` VALUES (1,106,1,NULL,NULL,NULL,NULL,NULL,'10.0000',2,'10.0000',NULL,NULL,0,'2010-10-29'),(2,107,4,NULL,NULL,NULL,NULL,NULL,'40.0000',2,'40.0000',NULL,NULL,1,'2010-10-29'),(3,107,3,NULL,NULL,NULL,NULL,NULL,'30.0000',2,'30.0000',NULL,NULL,1,'2010-08-27'),(4,107,2,NULL,NULL,NULL,NULL,NULL,'20.0000',2,'20.0000',NULL,NULL,1,'2010-10-29'),(5,107,3,NULL,NULL,NULL,NULL,NULL,'33.0000',2,'33.0000',1,'2010-08-27',0,'2010-08-27'),(6,111,4,NULL,NULL,NULL,NULL,NULL,'40.0000',2,'40.0000',NULL,NULL,1,'2010-10-30'),(7,112,8,NULL,NULL,NULL,NULL,NULL,'90.0000',2,'90.0000',NULL,NULL,0,NULL),(8,112,5,NULL,NULL,NULL,NULL,NULL,'60.0000',2,'60.0000',NULL,NULL,0,NULL),(9,112,7,NULL,NULL,NULL,NULL,NULL,'80.0000',2,'80.0000',NULL,NULL,0,NULL),(10,112,6,NULL,NULL,NULL,NULL,NULL,'70.0000',2,'70.0000',NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `account_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_flag_detail`
--

DROP TABLE IF EXISTS `account_flag_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_flag_detail` (
  `account_flag_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `flag_id` smallint(6) NOT NULL,
  `created_by` smallint(6) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`account_flag_id`),
  KEY `account_id` (`account_id`),
  KEY `flag_id` (`flag_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `account_flag_detail_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_flag_detail_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `account_state_flag` (`flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_flag_detail_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_flag_detail`
--

LOCK TABLES `account_flag_detail` WRITE;
/*!40000 ALTER TABLE `account_flag_detail` DISABLE KEYS */;
INSERT INTO `account_flag_detail` VALUES (1,21,7,1,'2010-07-18'),(2,86,1,1,'2010-07-31'),(3,112,7,1,'2010-08-28');
/*!40000 ALTER TABLE `account_flag_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_notes`
--

DROP TABLE IF EXISTS `account_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_notes` (
  `account_notes_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `note` varchar(500) NOT NULL,
  `comment_date` date NOT NULL,
  `officer_id` smallint(6) NOT NULL,
  PRIMARY KEY (`account_notes_id`),
  KEY `account_id` (`account_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `account_notes_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_notes_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_notes`
--

LOCK TABLES `account_notes` WRITE;
/*!40000 ALTER TABLE `account_notes` DISABLE KEYS */;
INSERT INTO `account_notes` VALUES (1,4,'asdf','2010-07-02',1),(2,7,'asd','2010-07-02',1),(3,8,'df','2010-07-02',1),(4,11,'asf','2010-07-03',1),(5,15,'asf','2010-07-04',1),(6,16,'asdf','2010-07-05',1),(7,17,'fdf','2010-07-05',1),(8,17,'test close','2010-07-05',1),(9,20,'asdf','2010-07-05',1),(10,20,'asd','2010-07-05',1),(11,20,'Account Made Active Due to Payment','2010-07-05',1),(12,20,'ff','2010-07-05',1),(13,20,'Account Made Active Due to Payment','2010-07-05',1),(14,20,'xc','2010-07-05',1),(15,20,'ff','2010-07-05',1),(16,4,'go','2010-07-18',1),(17,21,'a','2010-07-18',1),(18,21,'sss','2010-07-18',1),(19,23,'asdf','2010-07-18',1),(20,24,'sdf','2010-07-18',1),(21,24,'f','2010-07-18',1),(22,32,'sdf','2010-07-21',1),(23,30,'asdf','2010-07-21',1),(24,7,'f','2010-07-21',1),(25,7,'df','2010-07-21',1),(26,34,'fff','2010-07-21',1),(27,34,'d','2010-07-21',1),(28,36,'df','2010-07-21',1),(29,38,'df','2010-07-22',1),(30,44,'asdf','2010-07-22',1),(31,46,'f','2010-07-22',1),(32,44,'asdf','2010-07-23',1),(33,46,'f','2010-07-23',1),(34,46,'df','2010-07-23',1),(35,47,'hjhj','2010-07-25',1),(36,47,'d','2010-07-25',1),(37,53,'ff','2010-07-25',1),(38,55,'asdf','2010-07-25',1),(39,56,'asdf','2010-07-25',1),(40,58,'asdf','2010-07-25',1),(41,59,'d','2010-07-25',1),(42,61,'df','2010-07-25',1),(43,64,'dd','2010-07-25',1),(44,66,'gggg','2010-07-25',1),(45,67,'g','2010-07-28',1),(46,76,'asd','2010-07-29',1),(47,78,'gg','2010-07-29',1),(48,80,'aa','2010-07-29',1),(49,82,'asdf','2010-07-29',1),(50,84,'asdf','2010-07-29',1),(51,86,'fdf','2010-07-29',1),(52,84,'d','2010-07-31',1),(53,86,'asdf','2010-07-31',1),(54,88,'sadf','2010-07-31',1),(55,91,'d','2010-08-01',1),(56,95,'asdffd','2010-08-01',1),(57,93,'d','2010-08-03',1),(58,95,'dfd','2010-08-07',1),(59,100,'asf','2010-08-07',1),(60,102,'g','2010-08-07',1),(61,100,'asdf','2010-08-10',1),(62,102,'f','2010-08-10',1),(63,109,'dfdf','2010-08-27',1),(64,112,'asdf','2010-08-28',1),(65,112,'asf','2010-08-28',1);
/*!40000 ALTER TABLE `account_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_payment`
--

DROP TABLE IF EXISTS `account_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `payment_type_id` smallint(6) NOT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `amount` decimal(21,4) NOT NULL,
  `receipt_number` varchar(25) DEFAULT NULL,
  `voucher_number` varchar(50) DEFAULT NULL,
  `check_number` varchar(50) DEFAULT NULL,
  `payment_date` date NOT NULL,
  `receipt_date` date DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `comment` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `currency_id` (`currency_id`),
  KEY `payment_type_id` (`payment_type_id`),
  KEY `account_id_account_payment_idx` (`account_id`),
  CONSTRAINT `account_payment_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_payment_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_payment_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_payment`
--

LOCK TABLES `account_payment` WRITE;
/*!40000 ALTER TABLE `account_payment` DISABLE KEYS */;
INSERT INTO `account_payment` VALUES (1,11,1,2,'0.0000','',NULL,NULL,'2010-07-03',NULL,NULL,NULL),(2,11,1,2,'50.0000',NULL,NULL,NULL,'2010-07-03',NULL,NULL,NULL),(3,17,1,2,'100.0000','',NULL,NULL,'2010-07-05',NULL,NULL,NULL),(4,17,1,2,'100.0000','',NULL,NULL,'2010-07-05',NULL,NULL,NULL),(5,20,1,2,'1.0000','',NULL,NULL,'2010-07-05',NULL,NULL,NULL),(6,20,1,2,'2.0000','',NULL,NULL,'2010-07-05',NULL,NULL,NULL),(7,20,1,2,'3.0000','',NULL,NULL,'2010-07-05',NULL,NULL,NULL),(8,20,1,2,'6.0000','',NULL,NULL,'2010-07-05',NULL,NULL,NULL),(9,4,1,2,'3000.0000','',NULL,NULL,'2010-07-16','2010-07-18',NULL,NULL),(10,4,1,2,'100.0000','',NULL,NULL,'2010-07-18',NULL,NULL,''),(11,4,1,2,'150.0000','',NULL,NULL,'2010-07-18',NULL,NULL,''),(12,4,1,2,'0.0000','',NULL,NULL,'2010-07-18',NULL,NULL,NULL),(13,4,1,2,'3000.0000',NULL,NULL,NULL,'2010-07-18',NULL,NULL,NULL),(14,21,1,2,'0.0000','',NULL,NULL,'2010-07-18','2010-07-18',NULL,NULL),(15,21,1,2,'0.0000','',NULL,NULL,'2010-07-18',NULL,NULL,''),(16,21,1,2,'0.0000','',NULL,NULL,'2010-07-18',NULL,NULL,''),(17,21,1,2,'0.0000','',NULL,NULL,'2010-07-18',NULL,NULL,''),(18,24,1,2,'666.0000','',NULL,NULL,'2010-07-18',NULL,NULL,NULL),(19,32,1,2,'3000.0000','',NULL,NULL,'2010-07-21','2010-07-21',NULL,NULL),(20,30,1,2,'1200.0000','',NULL,NULL,'2010-07-21',NULL,NULL,NULL),(21,32,1,2,'78.0000','',NULL,NULL,'2010-07-21',NULL,NULL,''),(22,36,1,2,'235.0000','',NULL,NULL,'2010-07-21',NULL,NULL,NULL),(23,36,1,2,'235.0000','',NULL,NULL,'2010-07-21',NULL,NULL,NULL),(24,38,1,2,'3000.0000','',NULL,NULL,'2010-07-22','2010-07-22',NULL,NULL),(25,44,1,2,'6000.0000','',NULL,NULL,'2010-07-22','2010-07-22',NULL,NULL),(26,44,1,2,'6000.0000',NULL,NULL,NULL,'2010-07-23',NULL,NULL,NULL),(27,38,1,2,'3002.9000','',NULL,NULL,'2010-07-24',NULL,NULL,NULL),(28,61,1,2,'777.0000','',NULL,NULL,'2010-07-25',NULL,NULL,NULL),(29,67,1,2,'90.0000','',NULL,NULL,'2010-07-28',NULL,NULL,NULL),(30,82,1,2,'15.0000','',NULL,NULL,'2010-07-31',NULL,NULL,NULL),(31,6,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(32,11,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(33,14,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(34,30,1,2,'0.1000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(35,52,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(36,56,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(37,58,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(38,61,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(39,64,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(40,67,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(41,76,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(42,82,1,2,'0.0000',NULL,NULL,NULL,'2010-07-31',NULL,NULL,NULL),(43,106,2,2,'10.0000','',NULL,NULL,'2010-08-27',NULL,NULL,NULL),(44,107,1,2,'0.0000','',NULL,NULL,'2010-08-27',NULL,NULL,NULL),(45,109,1,2,'20.0000','',NULL,NULL,'2010-08-27',NULL,NULL,NULL),(46,107,2,2,'129.0000','',NULL,NULL,'2010-08-27',NULL,NULL,NULL),(47,112,1,2,'0.0000','',NULL,NULL,'2010-08-28','2010-08-28',NULL,NULL),(48,112,1,2,'0.0000','',NULL,NULL,'2010-08-28',NULL,NULL,''),(49,112,1,2,'0.0000','',NULL,NULL,'2010-08-28',NULL,NULL,'');
/*!40000 ALTER TABLE `account_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_state`
--

DROP TABLE IF EXISTS `account_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_state` (
  `account_state_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  `prd_type_id` smallint(6) NOT NULL,
  `currently_in_use` smallint(6) NOT NULL,
  `status_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`account_state_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `account_state_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_state`
--

LOCK TABLES `account_state` WRITE;
/*!40000 ALTER TABLE `account_state` DISABLE KEYS */;
INSERT INTO `account_state` VALUES (1,17,1,1,'Partial application'),(2,18,1,1,'Application pending approval'),(3,19,1,1,'Application approved'),(4,20,1,0,'Disbursed to loan officer'),(5,21,1,1,'Active in good standing'),(6,22,1,1,'Closed - obligation met'),(7,23,1,1,'Closed - written off'),(8,24,1,1,'Closed - rescheduled'),(9,25,1,1,'Active in bad standing'),(10,141,1,1,'Canceled'),(11,142,1,1,'Customer Account Active'),(12,143,1,1,'Customer Account Inactive'),(13,181,2,1,'Partial application'),(14,182,2,1,'Application pending approval'),(15,183,2,1,'Canceled'),(16,184,2,1,'Active'),(17,185,2,1,'Closed'),(18,210,2,1,'Inactive');
/*!40000 ALTER TABLE `account_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_state_flag`
--

DROP TABLE IF EXISTS `account_state_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_state_flag` (
  `flag_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  `status_id` smallint(6) NOT NULL,
  `flag_description` varchar(200) DEFAULT NULL,
  `retain_flag` smallint(6) NOT NULL,
  PRIMARY KEY (`flag_id`),
  KEY `status_id` (`status_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `account_state_flag_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_state_flag_ibfk_2` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_state_flag`
--

LOCK TABLES `account_state_flag` WRITE;
/*!40000 ALTER TABLE `account_state_flag` DISABLE KEYS */;
INSERT INTO `account_state_flag` VALUES (1,174,10,'Withdraw',0),(2,175,10,'Rejected',0),(3,176,10,'Other',0),(4,211,15,'Withdraw',0),(5,212,15,'Rejected',0),(6,213,15,'Blacklisted',1),(7,571,10,'Loan reversal',0);
/*!40000 ALTER TABLE `account_state_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_status_change_history`
--

DROP TABLE IF EXISTS `account_status_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_status_change_history` (
  `account_status_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `old_status` smallint(6) DEFAULT NULL,
  `new_status` smallint(6) NOT NULL,
  `changed_by` smallint(6) NOT NULL,
  `changed_date` date NOT NULL,
  PRIMARY KEY (`account_status_change_id`),
  KEY `account_id` (`account_id`),
  KEY `old_status` (`old_status`),
  KEY `new_status` (`new_status`),
  KEY `changed_by` (`changed_by`),
  CONSTRAINT `account_status_change_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_status_change_history_ibfk_2` FOREIGN KEY (`old_status`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_status_change_history_ibfk_3` FOREIGN KEY (`new_status`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_status_change_history_ibfk_4` FOREIGN KEY (`changed_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_status_change_history`
--

LOCK TABLES `account_status_change_history` WRITE;
/*!40000 ALTER TABLE `account_status_change_history` DISABLE KEYS */;
INSERT INTO `account_status_change_history` VALUES (1,4,2,2,1,'2010-07-02'),(2,6,16,16,1,'2010-07-02'),(3,4,2,3,1,'2010-07-02'),(4,7,14,14,1,'2010-07-02'),(5,7,14,16,1,'2010-07-02'),(6,8,2,2,1,'2010-07-02'),(7,8,2,3,1,'2010-07-02'),(8,11,14,14,1,'2010-07-03'),(9,11,14,16,1,'2010-07-03'),(10,14,16,16,1,'2010-07-03'),(11,13,16,16,1,'2010-07-03'),(12,15,2,2,1,'2010-07-04'),(13,15,2,3,1,'2010-07-04'),(14,16,2,2,1,'2010-07-04'),(15,16,2,3,1,'2010-07-05'),(16,17,14,14,1,'2010-07-05'),(17,17,14,16,1,'2010-07-05'),(18,17,16,17,1,'2010-07-05'),(19,20,14,14,1,'2010-07-05'),(20,20,14,16,1,'2010-07-05'),(21,20,16,18,1,'2010-07-05'),(22,20,18,16,1,'2010-07-05'),(23,20,16,18,1,'2010-07-05'),(24,20,18,16,1,'2010-07-05'),(25,20,16,18,1,'2010-07-05'),(26,20,18,17,1,'2010-07-05'),(27,4,3,5,1,'2010-07-18'),(28,4,5,6,1,'2010-07-18'),(29,4,5,7,1,'2010-07-18'),(30,21,2,2,1,'2010-07-18'),(31,21,2,3,1,'2010-07-18'),(32,21,3,5,1,'2010-07-18'),(33,21,5,10,1,'2010-07-18'),(34,23,2,2,1,'2010-07-18'),(35,23,2,3,1,'2010-07-18'),(36,24,14,14,1,'2010-07-18'),(37,24,14,16,1,'2010-07-18'),(38,24,16,18,1,'2010-07-18'),(39,30,14,14,1,'2010-07-21'),(40,31,14,14,1,'2010-07-21'),(41,32,2,2,1,'2010-07-21'),(42,32,2,3,1,'2010-07-21'),(43,32,3,5,1,'2010-07-21'),(44,30,14,16,1,'2010-07-21'),(45,7,16,18,1,'2010-07-21'),(46,7,18,17,1,'2010-07-21'),(47,34,14,14,1,'2010-07-21'),(48,34,14,16,1,'2010-07-21'),(49,34,16,17,1,'2010-07-21'),(50,36,16,16,1,'2010-07-21'),(51,36,16,17,1,'2010-07-21'),(52,38,2,2,1,'2010-07-22'),(53,38,2,3,1,'2010-07-22'),(54,38,3,5,1,'2010-07-22'),(55,44,2,2,1,'2010-07-22'),(56,44,2,3,1,'2010-07-22'),(57,44,3,5,1,'2010-07-22'),(58,46,14,14,1,'2010-07-22'),(59,46,14,16,1,'2010-07-22'),(60,44,5,7,1,'2010-07-23'),(61,46,16,18,1,'2010-07-23'),(62,46,18,17,1,'2010-07-23'),(63,38,5,6,1,'2010-07-24'),(64,47,14,14,1,'2010-07-25'),(65,47,14,16,1,'2010-07-25'),(66,47,16,17,1,'2010-07-25'),(67,52,16,16,1,'2010-07-25'),(68,53,2,2,1,'2010-07-25'),(69,53,2,3,1,'2010-07-25'),(70,55,2,2,1,'2010-07-25'),(71,55,2,3,1,'2010-07-25'),(72,56,14,14,1,'2010-07-25'),(73,56,14,16,1,'2010-07-25'),(74,58,14,14,1,'2010-07-25'),(75,58,14,16,1,'2010-07-25'),(76,59,2,2,1,'2010-07-25'),(77,59,2,3,1,'2010-07-25'),(78,61,14,14,1,'2010-07-25'),(79,61,14,16,1,'2010-07-25'),(80,64,14,14,1,'2010-07-25'),(81,64,14,16,1,'2010-07-25'),(82,66,2,2,1,'2010-07-25'),(83,66,2,3,1,'2010-07-25'),(84,67,14,14,1,'2010-07-28'),(85,67,14,16,1,'2010-07-28'),(86,76,14,14,1,'2010-07-29'),(87,76,14,16,1,'2010-07-29'),(88,78,2,2,1,'2010-07-29'),(89,78,2,3,1,'2010-07-29'),(90,80,14,14,1,'2010-07-29'),(91,80,14,16,1,'2010-07-29'),(92,82,14,14,1,'2010-07-29'),(93,82,14,16,1,'2010-07-29'),(94,84,14,14,1,'2010-07-29'),(95,84,14,16,1,'2010-07-29'),(96,86,2,2,1,'2010-07-29'),(97,86,2,3,1,'2010-07-29'),(98,84,16,17,1,'2010-07-31'),(99,86,3,10,1,'2010-07-31'),(100,88,14,14,1,'2010-07-31'),(101,88,14,16,1,'2010-07-31'),(102,91,2,2,1,'2010-08-01'),(103,91,2,3,1,'2010-08-01'),(104,93,16,16,1,'2010-08-01'),(105,95,14,14,1,'2010-08-01'),(106,95,14,16,1,'2010-08-01'),(107,93,16,17,1,'2010-08-03'),(108,95,16,17,1,'2010-08-07'),(109,100,14,14,1,'2010-08-07'),(110,100,14,16,1,'2010-08-07'),(111,102,14,14,1,'2010-08-07'),(112,102,14,16,1,'2010-08-07'),(113,100,16,17,1,'2010-08-10'),(114,102,16,17,1,'2010-08-10'),(115,109,14,14,1,'2010-08-27'),(116,109,14,16,1,'2010-08-27'),(117,112,2,2,1,'2010-08-28'),(118,112,2,3,1,'2010-08-28'),(119,112,3,5,1,'2010-08-28'),(120,112,5,10,1,'2010-08-28');
/*!40000 ALTER TABLE `account_status_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_trxn`
--

DROP TABLE IF EXISTS `account_trxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_trxn` (
  `account_trxn_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `personnel_id` int(11) DEFAULT NULL,
  `account_action_id` smallint(6) NOT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `amount_currency_id` smallint(6) DEFAULT NULL,
  `amount` decimal(21,4) NOT NULL,
  `due_date` date DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `action_date` date NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_id` int(11) DEFAULT NULL,
  `installment_id` smallint(6) DEFAULT NULL,
  `related_trxn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_trxn_id`),
  KEY `account_action_id` (`account_action_id`),
  KEY `payment_id` (`payment_id`),
  KEY `currency_id` (`currency_id`),
  KEY `amount_currency_id` (`amount_currency_id`),
  KEY `customer_id` (`customer_id`),
  KEY `account_id_account_trxn_idx` (`account_id`),
  CONSTRAINT `account_trxn_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_trxn_ibfk_2` FOREIGN KEY (`account_action_id`) REFERENCES `account_action` (`account_action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_trxn_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `account_payment` (`payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_trxn_ibfk_4` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_trxn_ibfk_5` FOREIGN KEY (`amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `account_trxn_ibfk_6` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_trxn`
--

LOCK TABLES `account_trxn` WRITE;
/*!40000 ALTER TABLE `account_trxn` DISABLE KEYS */;
INSERT INTO `account_trxn` VALUES (1,11,1,1,6,NULL,2,'67.0000','2010-07-03','','2010-07-03','2010-07-02 15:17:55',6,NULL,NULL),(2,11,2,1,6,NULL,2,'50.0000',NULL,'','2010-07-03','2010-07-02 15:18:15',6,NULL,NULL),(3,11,1,1,14,NULL,2,'-67.0000','2010-07-03','wrong number','2010-07-03','2010-07-02 15:18:15',6,NULL,1),(4,17,3,1,6,NULL,2,'100.0000','2010-07-05','','2010-07-05','2010-07-05 01:29:20',3,NULL,NULL),(5,17,4,1,7,NULL,2,'100.0000',NULL,'','2010-07-05','2010-07-04 14:00:00',3,NULL,NULL),(6,20,5,1,6,NULL,2,'1.0000','2010-07-05','','2010-07-05','2010-07-05 02:36:02',9,NULL,NULL),(7,20,6,1,6,NULL,2,'2.0000','2010-07-05','','2010-07-05','2010-07-05 02:36:45',9,NULL,NULL),(8,20,7,1,6,NULL,2,'3.0000','2010-07-05','','2010-07-05','2010-07-05 02:37:11',9,NULL,NULL),(9,20,8,1,7,NULL,2,'6.0000',NULL,'','2010-07-05','2010-07-04 14:00:00',9,NULL,NULL),(10,4,9,1,10,NULL,2,'3000.0000','2010-07-16','-','2010-07-16','2010-07-18 04:42:38',3,0,NULL),(11,4,10,1,1,NULL,2,'100.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 04:45:59',3,1,NULL),(12,4,11,1,1,NULL,2,'150.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 06:12:29',3,1,NULL),(13,4,12,1,1,NULL,2,'181.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,1,NULL),(14,4,12,1,1,NULL,2,'428.1000','2010-08-05','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,2,NULL),(15,4,12,1,1,NULL,2,'428.1000','2010-08-12','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,3,NULL),(16,4,12,1,1,NULL,2,'428.1000','2010-08-19','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,4,NULL),(17,4,12,1,1,NULL,2,'428.1000','2010-08-26','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,5,NULL),(18,4,12,1,1,NULL,2,'428.1000','2010-09-02','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,6,NULL),(19,4,12,1,1,NULL,2,'431.4000','2010-09-09','Payment rcvd.','2010-07-18','2010-07-18 06:12:59',3,7,NULL),(20,4,12,1,9,NULL,2,'-428.1000','2010-08-05','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,2,14),(21,4,12,1,9,NULL,2,'-431.4000','2010-09-09','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,7,19),(22,4,12,1,9,NULL,2,'-428.1000','2010-08-12','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,3,15),(23,4,12,1,9,NULL,2,'-428.1000','2010-08-26','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,5,17),(24,4,12,1,9,NULL,2,'-181.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,1,13),(25,4,12,1,9,NULL,2,'-428.1000','2010-08-19','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,4,16),(26,4,12,1,9,NULL,2,'-428.1000','2010-09-02','Payment rcvd.','2010-07-18','2010-07-18 06:35:22',3,6,18),(27,4,13,1,15,NULL,2,'181.0000','2010-07-29','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,1,NULL),(28,4,13,1,15,NULL,2,'428.1000','2010-08-05','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,2,NULL),(29,4,13,1,15,NULL,2,'428.1000','2010-08-12','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,3,NULL),(30,4,13,1,15,NULL,2,'428.1000','2010-08-19','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,4,NULL),(31,4,13,1,15,NULL,2,'428.1000','2010-08-26','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,5,NULL),(32,4,13,1,15,NULL,2,'428.1000','2010-09-02','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,6,NULL),(33,4,13,1,15,NULL,2,'431.4000','2010-09-09','Loan Written Off','2010-07-18','2010-07-18 06:48:59',3,7,NULL),(34,21,14,1,10,NULL,2,'3000.0000','2010-07-18','-','2010-07-18','2010-07-18 07:01:50',3,0,NULL),(35,21,15,1,1,NULL,2,'431.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 07:02:02',3,1,NULL),(36,21,15,1,1,NULL,2,'219.0000','2010-08-05','Payment rcvd.','2010-07-18','2010-07-18 07:02:02',3,2,NULL),(37,21,15,1,9,NULL,2,'-219.0000','2010-08-05','v','2010-07-18','2010-07-18 07:02:48',3,2,36),(38,21,15,1,9,NULL,2,'-431.0000','2010-07-29','v','2010-07-18','2010-07-18 07:02:48',3,1,35),(39,21,16,1,1,NULL,2,'230.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 07:05:28',3,1,NULL),(40,21,17,1,1,NULL,2,'43.0000','2010-07-29','Payment rcvd.','2010-07-18','2010-07-18 07:06:14',3,1,NULL),(41,21,17,1,18,NULL,2,'-43.0000','2010-07-29','sss','2010-07-18','2010-07-18 07:09:54',3,1,40),(42,21,16,1,18,NULL,2,'-230.0000','2010-07-29','sss','2010-07-18','2010-07-18 07:09:54',3,1,39),(43,21,14,1,19,NULL,2,'-3000.0000','2010-07-18','sss','2010-07-18','2010-07-18 07:09:54',3,0,34),(44,24,18,1,6,NULL,2,'666.0000','2010-07-18','','2010-07-18','2010-07-18 08:07:24',10,NULL,NULL),(45,32,19,1,10,NULL,2,'3000.0000','2010-07-21','-','2010-07-21','2010-07-21 02:18:56',13,0,NULL),(46,30,20,1,6,NULL,2,'1200.0000','2010-07-21','','2010-07-21','2010-07-21 02:19:30',13,NULL,NULL),(47,32,21,1,1,NULL,2,'78.0000','2010-08-03','Payment rcvd.','2010-07-21','2010-07-21 02:19:44',13,1,NULL),(48,36,22,1,6,NULL,2,'235.0000','2010-07-21','','2010-07-21','2010-07-21 03:52:59',17,NULL,NULL),(49,36,23,1,7,NULL,2,'235.0000',NULL,'','2010-07-21','2010-07-20 14:00:00',17,NULL,NULL),(50,38,24,1,10,NULL,2,'3000.0000','2010-07-22','-','2010-07-22','2010-07-22 04:03:52',18,0,NULL),(51,44,25,1,10,NULL,2,'6000.0000','2010-07-22','-','2010-07-22','2010-07-22 04:12:56',23,0,NULL),(52,44,26,1,15,NULL,2,'672.0000','2010-07-29','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,1,NULL),(53,44,26,1,15,NULL,2,'666.2000','2010-08-05','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,2,NULL),(54,44,26,1,15,NULL,2,'666.2000','2010-08-12','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,3,NULL),(55,44,26,1,15,NULL,2,'666.2000','2010-08-19','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,4,NULL),(56,44,26,1,15,NULL,2,'666.2000','2010-08-26','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,5,NULL),(57,44,26,1,15,NULL,2,'666.2000','2010-09-02','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,6,NULL),(58,44,26,1,15,NULL,2,'666.2000','2010-09-09','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,7,NULL),(59,44,26,1,15,NULL,2,'666.2000','2010-09-16','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,8,NULL),(60,44,26,1,15,NULL,2,'670.4000','2010-09-23','Loan Written Off','2010-07-23','2010-07-23 04:26:12',23,9,NULL),(61,38,27,1,1,NULL,2,'431.0000','2010-07-29','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,1,NULL),(62,38,27,1,1,NULL,2,'428.1000','2010-08-05','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,2,NULL),(63,38,27,1,1,NULL,2,'428.1000','2010-08-12','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,3,NULL),(64,38,27,1,1,NULL,2,'428.1000','2010-08-19','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,4,NULL),(65,38,27,1,1,NULL,2,'428.1000','2010-08-26','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,5,NULL),(66,38,27,1,1,NULL,2,'428.1000','2010-09-02','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,6,NULL),(67,38,27,1,1,NULL,2,'431.4000','2010-09-09','Payment rcvd.','2010-07-24','2010-07-24 08:23:07',18,7,NULL),(68,61,28,1,6,NULL,2,'777.0000','2010-07-25','','2010-07-25','2010-07-25 09:57:11',31,NULL,NULL),(69,67,29,1,6,NULL,2,'90.0000','2010-07-28','','2010-07-28','2010-07-27 14:02:45',34,1,NULL),(70,82,30,1,6,NULL,2,'15.0000','2010-07-31','','2010-07-31','2010-07-31 07:36:43',45,NULL,NULL),(71,6,31,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',4,NULL,NULL),(72,11,32,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',6,NULL,NULL),(73,14,33,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',7,NULL,NULL),(74,30,34,NULL,11,NULL,2,'0.1000',NULL,'','2010-08-04','2010-07-30 14:00:00',13,NULL,NULL),(75,52,35,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',28,NULL,NULL),(76,56,36,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',29,NULL,NULL),(77,58,37,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',30,NULL,NULL),(78,61,38,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',31,NULL,NULL),(79,64,39,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',33,NULL,NULL),(80,67,40,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',32,NULL,NULL),(81,76,41,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',42,NULL,NULL),(82,82,42,NULL,11,NULL,2,'0.0000',NULL,'','2010-08-04','2010-07-30 14:00:00',45,NULL,NULL),(83,106,43,1,12,NULL,2,'0.0000','2010-08-27','Payment rcvd.','2010-08-27','2010-08-27 05:47:57',61,1,NULL),(84,107,44,1,12,NULL,2,'0.0000','2010-08-27','Payment rcvd.','2010-08-27','2010-08-27 06:14:39',62,1,NULL),(85,109,45,1,6,NULL,2,'20.0000','2010-08-27','','2010-08-27','2010-08-27 06:14:39',63,1,NULL),(86,107,44,1,13,NULL,2,'0.0000','2010-08-27','fdsf','2010-08-27','2010-08-27 06:19:08',62,1,84),(87,107,46,1,12,NULL,2,'6.0000','2010-08-27','Payment rcvd.','2010-08-27','2010-08-27 06:31:51',62,1,NULL),(88,112,47,1,4,NULL,2,'70.0000','2010-08-28','-','2010-08-28','2010-08-28 11:04:15',65,0,NULL),(89,112,47,1,10,NULL,2,'5000.0000','2010-08-28','-','2010-08-28','2010-08-28 11:04:15',65,0,NULL),(90,112,48,1,1,NULL,2,'1100.0000','2010-09-04','Payment rcvd.','2010-08-28','2010-08-28 11:11:35',65,1,NULL),(91,112,48,1,9,NULL,2,'-1100.0000','2010-09-04','asdf','2010-08-28','2010-08-28 11:20:58',65,1,90),(92,112,49,1,1,NULL,2,'1414.0000','2010-09-04','Payment rcvd.','2010-08-28','2010-08-28 11:22:39',65,1,NULL),(93,112,49,1,1,NULL,2,'1.0000','2010-09-11','Payment rcvd.','2010-08-28','2010-08-28 11:22:39',65,2,NULL),(94,112,49,1,18,NULL,2,'-1.0000','2010-09-11','asf','2010-08-28','2010-08-28 11:26:09',65,2,93),(95,112,49,1,18,NULL,2,'-1414.0000','2010-09-04','asf','2010-08-28','2010-08-28 11:26:09',65,1,92),(96,112,47,1,19,NULL,2,'-5000.0000','2010-08-28','asf','2010-08-28','2010-08-28 11:26:09',65,0,89),(97,112,47,1,18,NULL,2,'-70.0000','2010-08-28','asf','2010-08-28','2010-08-28 11:26:09',65,0,88);
/*!40000 ALTER TABLE `account_trxn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `account_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`account_type_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `account_type_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,126,'Loan Account'),(2,127,'Savings Account'),(3,140,'Customer Account'),(4,126,'Individual Loan Account');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activity_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) DEFAULT NULL,
  `activity_name_lookup_id` int(11) NOT NULL,
  `description_lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`activity_id`),
  KEY `parent_id` (`parent_id`),
  KEY `activity_name_lookup_id` (`activity_name_lookup_id`),
  KEY `description_lookup_id` (`description_lookup_id`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`activity_name_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `activity_ibfk_3` FOREIGN KEY (`description_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,NULL,371,371),(2,1,372,372),(3,2,373,373),(4,2,374,374),(5,1,375,375),(6,5,376,376),(7,5,377,377),(8,1,378,378),(9,8,379,379),(10,8,380,380),(13,NULL,381,381),(14,13,382,382),(15,14,383,383),(16,14,384,384),(17,NULL,385,385),(18,17,386,386),(19,18,387,387),(20,18,388,388),(21,18,389,389),(22,17,390,390),(23,22,391,391),(24,22,392,392),(25,22,393,393),(33,NULL,394,394),(34,33,395,395),(35,34,396,396),(36,34,397,397),(37,34,398,398),(38,34,399,399),(39,34,400,400),(40,34,401,401),(41,34,402,402),(42,34,403,403),(43,34,404,404),(44,34,405,405),(46,34,407,407),(47,34,408,408),(48,34,409,409),(49,34,410,410),(50,34,411,411),(51,34,412,412),(52,34,413,413),(53,34,414,414),(54,34,415,415),(55,34,416,416),(56,33,417,417),(57,56,418,418),(58,56,419,419),(59,56,420,420),(60,56,421,421),(61,56,422,422),(62,56,423,423),(63,56,424,424),(64,56,425,425),(65,56,426,426),(66,56,427,427),(68,56,429,429),(69,56,430,430),(70,56,431,431),(71,56,432,432),(72,56,433,433),(73,56,434,434),(74,56,435,435),(75,56,436,436),(76,56,437,437),(77,56,438,438),(78,33,439,439),(79,78,440,440),(80,78,441,441),(81,78,442,442),(82,78,443,443),(83,78,444,444),(85,78,446,446),(86,78,447,447),(87,78,448,438),(88,78,449,449),(89,NULL,450,450),(90,89,451,451),(91,90,452,452),(92,90,453,453),(93,89,454,454),(94,93,455,455),(95,93,456,456),(96,89,457,457),(97,96,458,458),(98,96,459,459),(99,NULL,460,460),(100,99,461,461),(101,100,462,462),(102,100,463,463),(103,100,464,464),(104,100,465,465),(105,100,466,466),(106,100,467,467),(108,100,469,469),(109,100,470,470),(110,100,471,471),(113,99,474,474),(115,113,475,475),(116,113,476,476),(118,113,478,478),(119,113,479,479),(120,113,480,480),(121,34,481,481),(122,56,482,482),(126,34,483,483),(127,78,484,484),(128,78,485,485),(129,100,486,486),(131,113,487,487),(135,18,488,488),(136,NULL,489,489),(137,136,490,490),(138,136,491,491),(139,136,492,492),(140,136,493,493),(141,NULL,494,494),(145,141,498,498),(146,141,499,499),(147,141,500,500),(148,141,501,501),(149,141,502,502),(150,141,503,503),(151,141,504,504),(178,113,531,531),(179,100,532,532),(180,136,533,533),(181,136,534,534),(182,136,535,535),(183,136,536,536),(184,136,537,537),(185,136,538,538),(186,136,546,546),(187,136,551,551),(188,136,552,552),(189,113,553,553),(190,136,554,554),(191,136,555,555),(192,196,560,560),(193,13,562,562),(194,18,563,563),(195,90,561,561),(196,NULL,564,564),(197,196,565,565),(198,34,566,566),(199,56,567,567),(200,78,568,568),(201,196,569,569),(202,99,570,570),(203,NULL,574,574),(204,203,575,575),(205,203,579,579),(206,34,580,580),(208,34,582,582),(209,89,583,583),(210,209,584,584),(211,209,585,585),(213,203,587,587),(214,141,588,588),(215,141,589,589),(216,141,590,590),(217,113,591,591),(218,99,592,592),(219,1,593,593),(220,141,594,594),(221,141,595,595),(222,141,596,596),(223,141,597,597),(224,203,598,598),(225,141,602,602),(226,141,603,603),(227,NULL,605,605),(228,227,606,606),(229,145,607,607),(230,203,608,608),(231,150,611,611),(232,150,612,612),(233,196,619,619),(234,227,625,625),(235,1,627,627),(236,150,628,628),(237,150,629,629);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_document`
--

DROP TABLE IF EXISTS `admin_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_document` (
  `admin_document_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_document_name` varchar(200) DEFAULT NULL,
  `admin_document_identifier` varchar(100) DEFAULT NULL,
  `admin_document_active` smallint(6) DEFAULT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_document`
--

LOCK TABLES `admin_document` WRITE;
/*!40000 ALTER TABLE `admin_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_document_acc_state_mix`
--

DROP TABLE IF EXISTS `admin_document_acc_state_mix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_document_acc_state_mix` (
  `admin_doc_acc_state_mix_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_state_id` smallint(6) NOT NULL,
  `admin_document_id` int(11) NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_doc_acc_state_mix_id`),
  KEY `admin_document_acc_state_mix_fk` (`account_state_id`),
  KEY `admin_document_acc_state_mix_fk1` (`admin_document_id`),
  CONSTRAINT `admin_document_acc_state_mix_fk` FOREIGN KEY (`account_state_id`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `admin_document_acc_state_mix_fk1` FOREIGN KEY (`admin_document_id`) REFERENCES `admin_document` (`admin_document_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_document_acc_state_mix`
--

LOCK TABLES `admin_document_acc_state_mix` WRITE;
/*!40000 ALTER TABLE `admin_document_acc_state_mix` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_document_acc_state_mix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `meeting_id` int(11) NOT NULL,
  `meeting_date` date NOT NULL,
  `attendance` smallint(6) DEFAULT NULL,
  `notes` varchar(200) NOT NULL,
  PRIMARY KEY (`meeting_id`,`meeting_date`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `customer_meeting` (`customer_meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_branch_cash_confirmation_report`
--

DROP TABLE IF EXISTS `batch_branch_cash_confirmation_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_branch_cash_confirmation_report` (
  `branch_cash_confirmation_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` smallint(6) NOT NULL,
  `run_date` date NOT NULL,
  PRIMARY KEY (`branch_cash_confirmation_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_branch_cash_confirmation_report`
--

LOCK TABLES `batch_branch_cash_confirmation_report` WRITE;
/*!40000 ALTER TABLE `batch_branch_cash_confirmation_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_branch_cash_confirmation_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_branch_confirmation_disbursement`
--

DROP TABLE IF EXISTS `batch_branch_confirmation_disbursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_branch_confirmation_disbursement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_cash_confirmation_report_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `actual` decimal(21,4) NOT NULL,
  `actual_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_cash_confirmation_report_id` (`branch_cash_confirmation_report_id`),
  CONSTRAINT `batch_branch_confirmation_disbursement_ibfk_1` FOREIGN KEY (`branch_cash_confirmation_report_id`) REFERENCES `batch_branch_cash_confirmation_report` (`branch_cash_confirmation_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_branch_confirmation_disbursement`
--

LOCK TABLES `batch_branch_confirmation_disbursement` WRITE;
/*!40000 ALTER TABLE `batch_branch_confirmation_disbursement` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_branch_confirmation_disbursement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_branch_confirmation_issue`
--

DROP TABLE IF EXISTS `batch_branch_confirmation_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_branch_confirmation_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_cash_confirmation_report_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `actual` decimal(21,4) NOT NULL,
  `actual_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_cash_confirmation_report_id` (`branch_cash_confirmation_report_id`),
  CONSTRAINT `batch_branch_confirmation_issue_ibfk_1` FOREIGN KEY (`branch_cash_confirmation_report_id`) REFERENCES `batch_branch_cash_confirmation_report` (`branch_cash_confirmation_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_branch_confirmation_issue`
--

LOCK TABLES `batch_branch_confirmation_issue` WRITE;
/*!40000 ALTER TABLE `batch_branch_confirmation_issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_branch_confirmation_issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_branch_confirmation_recovery`
--

DROP TABLE IF EXISTS `batch_branch_confirmation_recovery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_branch_confirmation_recovery` (
  `recovery_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_cash_confirmation_report_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `due` decimal(21,4) NOT NULL,
  `due_currency_id` smallint(6) NOT NULL,
  `actual` decimal(21,4) NOT NULL,
  `actual_currency_id` smallint(6) NOT NULL,
  `arrears` decimal(21,4) NOT NULL,
  `arrears_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`recovery_id`),
  KEY `branch_cash_confirmation_report_id` (`branch_cash_confirmation_report_id`),
  CONSTRAINT `batch_branch_confirmation_recovery_ibfk_1` FOREIGN KEY (`branch_cash_confirmation_report_id`) REFERENCES `batch_branch_cash_confirmation_report` (`branch_cash_confirmation_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_branch_confirmation_recovery`
--

LOCK TABLES `batch_branch_confirmation_recovery` WRITE;
/*!40000 ALTER TABLE `batch_branch_confirmation_recovery` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_branch_confirmation_recovery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_branch_report`
--

DROP TABLE IF EXISTS `batch_branch_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_branch_report` (
  `branch_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` smallint(6) NOT NULL,
  `run_date` date NOT NULL,
  PRIMARY KEY (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_branch_report`
--

LOCK TABLES `batch_branch_report` WRITE;
/*!40000 ALTER TABLE `batch_branch_report` DISABLE KEYS */;
INSERT INTO `batch_branch_report` VALUES (1,4,'2010-07-28'),(2,6,'2010-07-28'),(3,3,'2010-07-28'),(4,5,'2010-07-28'),(5,4,'2010-07-29'),(6,6,'2010-07-29'),(7,3,'2010-07-29'),(8,5,'2010-07-29'),(9,4,'2010-07-30'),(10,6,'2010-07-30'),(11,3,'2010-07-30'),(12,5,'2010-07-30'),(13,4,'2010-07-31'),(14,6,'2010-07-31'),(15,3,'2010-07-31'),(16,5,'2010-07-31'),(17,4,'2010-08-01'),(18,6,'2010-08-01'),(19,3,'2010-08-01'),(20,5,'2010-08-01'),(21,4,'2010-08-02'),(22,6,'2010-08-02'),(23,3,'2010-08-02'),(24,5,'2010-08-02'),(25,4,'2010-08-03'),(26,6,'2010-08-03'),(27,3,'2010-08-03'),(28,5,'2010-08-03');
/*!40000 ALTER TABLE `batch_branch_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_client_summary`
--

DROP TABLE IF EXISTS `batch_client_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_client_summary` (
  `client_summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_report_id` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `total` varchar(50) DEFAULT NULL,
  `vpoor_total` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_summary_id`),
  KEY `branch_report_id` (`branch_report_id`),
  CONSTRAINT `batch_client_summary_ibfk_1` FOREIGN KEY (`branch_report_id`) REFERENCES `batch_branch_report` (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_client_summary`
--

LOCK TABLES `batch_client_summary` WRITE;
/*!40000 ALTER TABLE `batch_client_summary` DISABLE KEYS */;
INSERT INTO `batch_client_summary` VALUES (1,1,'replacements.count','0','0'),(2,1,'loan.account.dormant.count','0','0'),(3,1,'active.savers.count','2','1'),(4,1,'group.count','3',''),(5,1,'onholds.count','0','0'),(6,1,'saving.account.dormant.count','0','0'),(7,1,'portfolio.at.risk','0.00',NULL),(8,1,'active.members.count','4','1'),(9,1,'dropouts.count','0','0'),(10,1,'center.count','2',''),(11,1,'dropout.rate','0.00','0.00'),(12,1,'active.borrowers.count','1','0'),(13,2,'active.members.count','0','0'),(14,2,'active.savers.count','0','0'),(15,2,'replacements.count','0','0'),(16,2,'loan.account.dormant.count','0','0'),(17,2,'group.count','0',''),(18,2,'onholds.count','0','0'),(19,2,'saving.account.dormant.count','0','0'),(20,2,'portfolio.at.risk','0.00',NULL),(21,2,'center.count','0',''),(22,2,'active.borrowers.count','0','0'),(23,2,'dropouts.count','0','0'),(24,2,'dropout.rate','0.00','0.00'),(25,3,'active.savers.count','5','0'),(26,3,'replacements.count','0','0'),(27,3,'loan.account.dormant.count','0','0'),(28,3,'onholds.count','0','0'),(29,3,'center.count','4',''),(30,3,'saving.account.dormant.count','0','0'),(31,3,'portfolio.at.risk','0.00',NULL),(32,3,'active.borrowers.count','0','0'),(33,3,'dropouts.count','0','0'),(34,3,'dropout.rate','0.00','0.00'),(35,3,'active.members.count','12','3'),(36,3,'group.count','9',''),(37,4,'active.members.count','0','0'),(38,4,'active.savers.count','0','0'),(39,4,'replacements.count','0','0'),(40,4,'loan.account.dormant.count','0','0'),(41,4,'group.count','0',''),(42,4,'onholds.count','0','0'),(43,4,'saving.account.dormant.count','0','0'),(44,4,'portfolio.at.risk','0.00',NULL),(45,4,'center.count','0',''),(46,4,'active.borrowers.count','0','0'),(47,4,'dropouts.count','0','0'),(48,4,'dropout.rate','0.00','0.00'),(49,5,'replacements.count','0','0'),(50,5,'loan.account.dormant.count','0','0'),(51,5,'active.savers.count','2','1'),(52,5,'group.count','3',''),(53,5,'saving.account.dormant.count','0','0'),(54,5,'portfolio.at.risk','0.00',NULL),(55,5,'active.members.count','4','1'),(56,5,'dropouts.count','0','0'),(57,5,'center.count','2',''),(58,5,'dropout.rate','0.00','0.00'),(59,5,'active.borrowers.count','1','0'),(60,5,'onholds.count','3','2'),(61,6,'active.members.count','0','0'),(62,6,'active.savers.count','0','0'),(63,6,'replacements.count','0','0'),(64,6,'loan.account.dormant.count','0','0'),(65,6,'group.count','0',''),(66,6,'onholds.count','0','0'),(67,6,'saving.account.dormant.count','0','0'),(68,6,'portfolio.at.risk','0.00',NULL),(69,6,'center.count','0',''),(70,6,'active.borrowers.count','0','0'),(71,6,'dropouts.count','0','0'),(72,6,'dropout.rate','0.00','0.00'),(73,7,'group.count','15',''),(74,7,'replacements.count','0','0'),(75,7,'loan.account.dormant.count','0','0'),(76,7,'onholds.count','0','0'),(77,7,'center.count','4',''),(78,7,'saving.account.dormant.count','0','0'),(79,7,'active.savers.count','6','1'),(80,7,'portfolio.at.risk','0.00',NULL),(81,7,'active.borrowers.count','0','0'),(82,7,'dropouts.count','0','0'),(83,7,'dropout.rate','0.00','0.00'),(84,7,'active.members.count','18','7'),(85,8,'active.members.count','0','0'),(86,8,'active.savers.count','0','0'),(87,8,'replacements.count','0','0'),(88,8,'loan.account.dormant.count','0','0'),(89,8,'group.count','0',''),(90,8,'onholds.count','0','0'),(91,8,'saving.account.dormant.count','0','0'),(92,8,'portfolio.at.risk','0.00',NULL),(93,8,'center.count','0',''),(94,8,'active.borrowers.count','0','0'),(95,8,'dropouts.count','0','0'),(96,8,'dropout.rate','0.00','0.00'),(97,9,'replacements.count','0','0'),(98,9,'loan.account.dormant.count','0','0'),(99,9,'active.savers.count','2','1'),(100,9,'group.count','3',''),(101,9,'saving.account.dormant.count','0','0'),(102,9,'portfolio.at.risk','0.00',NULL),(103,9,'active.members.count','4','1'),(104,9,'dropouts.count','0','0'),(105,9,'center.count','2',''),(106,9,'dropout.rate','0.00','0.00'),(107,9,'active.borrowers.count','1','0'),(108,9,'onholds.count','3','2'),(109,10,'active.members.count','0','0'),(110,10,'active.savers.count','0','0'),(111,10,'replacements.count','0','0'),(112,10,'loan.account.dormant.count','0','0'),(113,10,'group.count','0',''),(114,10,'onholds.count','0','0'),(115,10,'saving.account.dormant.count','0','0'),(116,10,'portfolio.at.risk','0.00',NULL),(117,10,'center.count','0',''),(118,10,'active.borrowers.count','0','0'),(119,10,'dropouts.count','0','0'),(120,10,'dropout.rate','0.00','0.00'),(121,11,'group.count','15',''),(122,11,'replacements.count','0','0'),(123,11,'loan.account.dormant.count','0','0'),(124,11,'onholds.count','0','0'),(125,11,'center.count','4',''),(126,11,'saving.account.dormant.count','0','0'),(127,11,'active.savers.count','6','1'),(128,11,'portfolio.at.risk','0.00',NULL),(129,11,'active.borrowers.count','0','0'),(130,11,'dropouts.count','0','0'),(131,11,'dropout.rate','0.00','0.00'),(132,11,'active.members.count','18','7'),(133,12,'active.members.count','0','0'),(134,12,'active.savers.count','0','0'),(135,12,'replacements.count','0','0'),(136,12,'loan.account.dormant.count','0','0'),(137,12,'group.count','0',''),(138,12,'onholds.count','0','0'),(139,12,'saving.account.dormant.count','0','0'),(140,12,'portfolio.at.risk','0.00',NULL),(141,12,'center.count','0',''),(142,12,'active.borrowers.count','0','0'),(143,12,'dropouts.count','0','0'),(144,12,'dropout.rate','0.00','0.00'),(145,13,'replacements.count','0','0'),(146,13,'loan.account.dormant.count','0','0'),(147,13,'active.savers.count','2','1'),(148,13,'group.count','3',''),(149,13,'saving.account.dormant.count','0','0'),(150,13,'portfolio.at.risk','0.00',NULL),(151,13,'active.members.count','4','1'),(152,13,'dropouts.count','0','0'),(153,13,'center.count','2',''),(154,13,'dropout.rate','0.00','0.00'),(155,13,'active.borrowers.count','1','0'),(156,13,'onholds.count','3','2'),(157,14,'active.members.count','0','0'),(158,14,'active.savers.count','0','0'),(159,14,'replacements.count','0','0'),(160,14,'loan.account.dormant.count','0','0'),(161,14,'group.count','0',''),(162,14,'onholds.count','0','0'),(163,14,'saving.account.dormant.count','0','0'),(164,14,'portfolio.at.risk','0.00',NULL),(165,14,'center.count','0',''),(166,14,'active.borrowers.count','0','0'),(167,14,'dropouts.count','0','0'),(168,14,'dropout.rate','0.00','0.00'),(169,15,'group.count','15',''),(170,15,'replacements.count','0','0'),(171,15,'loan.account.dormant.count','0','0'),(172,15,'onholds.count','0','0'),(173,15,'center.count','4',''),(174,15,'saving.account.dormant.count','0','0'),(175,15,'active.savers.count','6','1'),(176,15,'portfolio.at.risk','0.00',NULL),(177,15,'active.borrowers.count','0','0'),(178,15,'dropouts.count','0','0'),(179,15,'dropout.rate','0.00','0.00'),(180,15,'active.members.count','18','7'),(181,16,'active.members.count','0','0'),(182,16,'active.savers.count','0','0'),(183,16,'replacements.count','0','0'),(184,16,'loan.account.dormant.count','0','0'),(185,16,'group.count','0',''),(186,16,'onholds.count','0','0'),(187,16,'saving.account.dormant.count','0','0'),(188,16,'portfolio.at.risk','0.00',NULL),(189,16,'center.count','0',''),(190,16,'active.borrowers.count','0','0'),(191,16,'dropouts.count','0','0'),(192,16,'dropout.rate','0.00','0.00'),(193,17,'replacements.count','0','0'),(194,17,'loan.account.dormant.count','0','0'),(195,17,'active.savers.count','2','1'),(196,17,'group.count','3',''),(197,17,'saving.account.dormant.count','0','0'),(198,17,'portfolio.at.risk','0.00',NULL),(199,17,'active.members.count','4','1'),(200,17,'dropouts.count','0','0'),(201,17,'center.count','2',''),(202,17,'dropout.rate','0.00','0.00'),(203,17,'active.borrowers.count','1','0'),(204,17,'onholds.count','3','2'),(205,18,'active.members.count','0','0'),(206,18,'active.savers.count','0','0'),(207,18,'replacements.count','0','0'),(208,18,'loan.account.dormant.count','0','0'),(209,18,'group.count','0',''),(210,18,'onholds.count','0','0'),(211,18,'saving.account.dormant.count','0','0'),(212,18,'portfolio.at.risk','0.00',NULL),(213,18,'center.count','0',''),(214,18,'active.borrowers.count','0','0'),(215,18,'dropouts.count','0','0'),(216,18,'dropout.rate','0.00','0.00'),(217,19,'group.count','15',''),(218,19,'replacements.count','0','0'),(219,19,'loan.account.dormant.count','0','0'),(220,19,'onholds.count','0','0'),(221,19,'center.count','4',''),(222,19,'saving.account.dormant.count','0','0'),(223,19,'active.savers.count','6','1'),(224,19,'portfolio.at.risk','0.00',NULL),(225,19,'active.borrowers.count','0','0'),(226,19,'dropouts.count','0','0'),(227,19,'dropout.rate','0.00','0.00'),(228,19,'active.members.count','18','7'),(229,20,'active.members.count','0','0'),(230,20,'active.savers.count','0','0'),(231,20,'replacements.count','0','0'),(232,20,'loan.account.dormant.count','0','0'),(233,20,'group.count','0',''),(234,20,'onholds.count','0','0'),(235,20,'saving.account.dormant.count','0','0'),(236,20,'portfolio.at.risk','0.00',NULL),(237,20,'center.count','0',''),(238,20,'active.borrowers.count','0','0'),(239,20,'dropouts.count','0','0'),(240,20,'dropout.rate','0.00','0.00'),(241,21,'replacements.count','0','0'),(242,21,'loan.account.dormant.count','0','0'),(243,21,'active.savers.count','2','1'),(244,21,'group.count','3',''),(245,21,'saving.account.dormant.count','0','0'),(246,21,'portfolio.at.risk','0.00',NULL),(247,21,'active.members.count','4','1'),(248,21,'dropouts.count','0','0'),(249,21,'center.count','2',''),(250,21,'dropout.rate','0.00','0.00'),(251,21,'active.borrowers.count','1','0'),(252,21,'onholds.count','3','2'),(253,22,'active.members.count','0','0'),(254,22,'active.savers.count','0','0'),(255,22,'replacements.count','0','0'),(256,22,'loan.account.dormant.count','0','0'),(257,22,'group.count','0',''),(258,22,'onholds.count','0','0'),(259,22,'saving.account.dormant.count','0','0'),(260,22,'portfolio.at.risk','0.00',NULL),(261,22,'center.count','0',''),(262,22,'active.borrowers.count','0','0'),(263,22,'dropouts.count','0','0'),(264,22,'dropout.rate','0.00','0.00'),(265,23,'group.count','15',''),(266,23,'replacements.count','0','0'),(267,23,'loan.account.dormant.count','0','0'),(268,23,'onholds.count','0','0'),(269,23,'center.count','4',''),(270,23,'saving.account.dormant.count','0','0'),(271,23,'active.savers.count','6','1'),(272,23,'portfolio.at.risk','0.00',NULL),(273,23,'active.borrowers.count','0','0'),(274,23,'dropouts.count','0','0'),(275,23,'dropout.rate','0.00','0.00'),(276,23,'active.members.count','18','7'),(277,24,'active.members.count','0','0'),(278,24,'active.savers.count','0','0'),(279,24,'replacements.count','0','0'),(280,24,'loan.account.dormant.count','0','0'),(281,24,'group.count','0',''),(282,24,'onholds.count','0','0'),(283,24,'saving.account.dormant.count','0','0'),(284,24,'portfolio.at.risk','0.00',NULL),(285,24,'center.count','0',''),(286,24,'active.borrowers.count','0','0'),(287,24,'dropouts.count','0','0'),(288,24,'dropout.rate','0.00','0.00'),(289,25,'replacements.count','0','0'),(290,25,'loan.account.dormant.count','0','0'),(291,25,'active.savers.count','2','1'),(292,25,'group.count','3',''),(293,25,'saving.account.dormant.count','0','0'),(294,25,'portfolio.at.risk','0.00',NULL),(295,25,'active.members.count','4','1'),(296,25,'dropouts.count','0','0'),(297,25,'center.count','2',''),(298,25,'dropout.rate','0.00','0.00'),(299,25,'active.borrowers.count','1','0'),(300,25,'onholds.count','3','2'),(301,26,'active.members.count','0','0'),(302,26,'active.savers.count','0','0'),(303,26,'replacements.count','0','0'),(304,26,'loan.account.dormant.count','0','0'),(305,26,'group.count','0',''),(306,26,'onholds.count','0','0'),(307,26,'saving.account.dormant.count','0','0'),(308,26,'portfolio.at.risk','0.00',NULL),(309,26,'center.count','0',''),(310,26,'active.borrowers.count','0','0'),(311,26,'dropouts.count','0','0'),(312,26,'dropout.rate','0.00','0.00'),(313,27,'group.count','15',''),(314,27,'replacements.count','0','0'),(315,27,'loan.account.dormant.count','0','0'),(316,27,'onholds.count','0','0'),(317,27,'center.count','4',''),(318,27,'saving.account.dormant.count','0','0'),(319,27,'active.savers.count','6','1'),(320,27,'portfolio.at.risk','0.00',NULL),(321,27,'active.borrowers.count','0','0'),(322,27,'dropouts.count','0','0'),(323,27,'dropout.rate','0.00','0.00'),(324,27,'active.members.count','18','7'),(325,28,'active.members.count','0','0'),(326,28,'active.savers.count','0','0'),(327,28,'replacements.count','0','0'),(328,28,'loan.account.dormant.count','0','0'),(329,28,'group.count','0',''),(330,28,'onholds.count','0','0'),(331,28,'saving.account.dormant.count','0','0'),(332,28,'portfolio.at.risk','0.00',NULL),(333,28,'center.count','0',''),(334,28,'active.borrowers.count','0','0'),(335,28,'dropouts.count','0','0'),(336,28,'dropout.rate','0.00','0.00');
/*!40000 ALTER TABLE `batch_client_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_loan_arrears_aging`
--

DROP TABLE IF EXISTS `batch_loan_arrears_aging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_loan_arrears_aging` (
  `loan_arrears_aging_id` int(11) NOT NULL AUTO_INCREMENT,
  `aging_period_id` int(11) NOT NULL,
  `branch_report_id` int(11) NOT NULL,
  `clients_aging` int(11) NOT NULL,
  `loans_aging` int(11) NOT NULL,
  `amount_aging` decimal(21,4) NOT NULL,
  `amount_aging_currency_id` smallint(6) NOT NULL,
  `amount_outstanding_aging` decimal(21,4) NOT NULL,
  `amount_outstanding_aging_currency_id` smallint(6) NOT NULL,
  `interest_aging` decimal(21,4) NOT NULL,
  `interest_aging_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`loan_arrears_aging_id`),
  KEY `branch_report_id` (`branch_report_id`),
  CONSTRAINT `batch_loan_arrears_aging_ibfk_1` FOREIGN KEY (`branch_report_id`) REFERENCES `batch_branch_report` (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_loan_arrears_aging`
--

LOCK TABLES `batch_loan_arrears_aging` WRITE;
/*!40000 ALTER TABLE `batch_loan_arrears_aging` DISABLE KEYS */;
INSERT INTO `batch_loan_arrears_aging` VALUES (1,2,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(2,1,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(3,6,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(4,5,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(5,3,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(6,0,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(7,4,1,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(8,3,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(9,2,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(10,0,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(11,4,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(12,5,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(13,6,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(14,1,2,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(15,2,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(16,6,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(17,4,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(18,1,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(19,0,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(20,5,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(21,3,3,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(22,4,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(23,3,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(24,6,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(25,1,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(26,2,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(27,0,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(28,5,4,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(29,5,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(30,2,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(31,0,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(32,1,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(33,6,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(34,3,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(35,4,5,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(36,2,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(37,4,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(38,5,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(39,3,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(40,0,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(41,6,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(42,1,6,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(43,0,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(44,3,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(45,1,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(46,4,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(47,6,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(48,2,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(49,5,7,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(50,0,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(51,5,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(52,3,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(53,4,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(54,1,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(55,6,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(56,2,8,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(57,1,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(58,6,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(59,5,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(60,3,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(61,4,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(62,0,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(63,2,9,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(64,6,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(65,4,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(66,2,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(67,1,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(68,0,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(69,5,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(70,3,10,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(71,6,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(72,3,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(73,5,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(74,4,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(75,2,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(76,1,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(77,0,11,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(78,4,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(79,0,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(80,1,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(81,6,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(82,3,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(83,5,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(84,2,12,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(85,3,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(86,5,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(87,4,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(88,2,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(89,1,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(90,6,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(91,0,13,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(92,4,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(93,2,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(94,3,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(95,0,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(96,6,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(97,1,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(98,5,14,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(99,1,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(100,0,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(101,5,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(102,3,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(103,2,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(104,6,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(105,4,15,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(106,3,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(107,6,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(108,2,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(109,0,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(110,4,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(111,5,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(112,1,16,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(113,1,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(114,2,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(115,3,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(116,6,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(117,4,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(118,5,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(119,0,17,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(120,5,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(121,4,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(122,3,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(123,1,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(124,2,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(125,6,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(126,0,18,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(127,0,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(128,6,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(129,5,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(130,3,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(131,2,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(132,1,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(133,4,19,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(134,4,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(135,3,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(136,5,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(137,0,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(138,2,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(139,6,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(140,1,20,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(141,5,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(142,2,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(143,6,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(144,1,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(145,0,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(146,3,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(147,4,21,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(148,1,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(149,0,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(150,2,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(151,4,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(152,5,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(153,3,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(154,6,22,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(155,2,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(156,0,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(157,6,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(158,4,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(159,5,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(160,1,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(161,3,23,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(162,4,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(163,0,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(164,6,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(165,3,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(166,2,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(167,5,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(168,1,24,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(169,1,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(170,4,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(171,5,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(172,3,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(173,6,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(174,0,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(175,2,25,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(176,2,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(177,6,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(178,5,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(179,3,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(180,0,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(181,4,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(182,1,26,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(183,4,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(184,2,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(185,1,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(186,0,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(187,6,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(188,3,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(189,5,27,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(190,5,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(191,2,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(192,6,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(193,0,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(194,4,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(195,1,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2),(196,3,28,0,0,'0.0000',2,'0.0000',2,'0.0000',2);
/*!40000 ALTER TABLE `batch_loan_arrears_aging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_loan_arrears_profile`
--

DROP TABLE IF EXISTS `batch_loan_arrears_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_loan_arrears_profile` (
  `loan_arrears_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_report_id` int(11) NOT NULL,
  `loans_in_arrears` int(11) NOT NULL,
  `clients_in_arrears` int(11) NOT NULL,
  `overdue_balance` decimal(21,4) NOT NULL,
  `overdue_balance_currency_id` smallint(6) NOT NULL,
  `unpaid_balance` decimal(21,4) NOT NULL,
  `unpaid_balance_currency_id` smallint(6) NOT NULL,
  `loans_at_risk` int(11) NOT NULL,
  `outstanding_amount_at_risk` decimal(21,4) NOT NULL,
  `outstanding_amount_at_risk_currency_id` smallint(6) NOT NULL,
  `overdue_amount_at_risk` decimal(21,4) NOT NULL,
  `overdue_amount_at_risk_currency_id` smallint(6) NOT NULL,
  `clients_at_risk` int(11) NOT NULL,
  PRIMARY KEY (`loan_arrears_profile_id`),
  KEY `branch_report_id` (`branch_report_id`),
  CONSTRAINT `batch_loan_arrears_profile_ibfk_1` FOREIGN KEY (`branch_report_id`) REFERENCES `batch_branch_report` (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_loan_arrears_profile`
--

LOCK TABLES `batch_loan_arrears_profile` WRITE;
/*!40000 ALTER TABLE `batch_loan_arrears_profile` DISABLE KEYS */;
INSERT INTO `batch_loan_arrears_profile` VALUES (1,1,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(2,2,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(3,3,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(4,4,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(5,5,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(6,6,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(7,7,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(8,8,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(9,9,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(10,10,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(11,11,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(12,12,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(13,13,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(14,14,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(15,15,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(16,16,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(17,17,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(18,18,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(19,19,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(20,20,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(21,21,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(22,22,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(23,23,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(24,24,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(25,25,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(26,26,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(27,27,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0),(28,28,0,0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2,0);
/*!40000 ALTER TABLE `batch_loan_arrears_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_loan_details`
--

DROP TABLE IF EXISTS `batch_loan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_loan_details` (
  `loan_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_report_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `number_of_loans_issued` int(11) NOT NULL,
  `loan_amount_issued` decimal(21,4) NOT NULL,
  `loan_amount_issued_currency_id` smallint(6) NOT NULL,
  `loan_interest_issued` decimal(21,4) NOT NULL,
  `loan_interest_issued_currency_id` smallint(6) NOT NULL,
  `number_of_loans_outstanding` int(11) NOT NULL,
  `loan_outstanding_amount` decimal(21,4) NOT NULL,
  `loan_outstanding_amount_currency_id` smallint(6) NOT NULL,
  `loan_outstanding_interest` decimal(21,4) NOT NULL,
  `loan_outstanding_interest_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`loan_details_id`),
  KEY `branch_report_id` (`branch_report_id`),
  CONSTRAINT `batch_loan_details_ibfk_1` FOREIGN KEY (`branch_report_id`) REFERENCES `batch_branch_report` (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_loan_details`
--

LOCK TABLES `batch_loan_details` WRITE;
/*!40000 ALTER TABLE `batch_loan_details` DISABLE KEYS */;
INSERT INTO `batch_loan_details` VALUES (1,1,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(2,1,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(3,1,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(4,2,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(5,2,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(6,2,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(7,3,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(8,3,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(9,3,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(10,4,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(11,4,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(12,4,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(13,5,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(14,5,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(15,5,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(16,6,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(17,6,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(18,6,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(19,7,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(20,7,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(21,7,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(22,8,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(23,8,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(24,8,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(25,9,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(26,9,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(27,9,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(28,10,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(29,10,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(30,10,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(31,11,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(32,11,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(33,11,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(34,12,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(35,12,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(36,12,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(37,13,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(38,13,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(39,13,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(40,14,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(41,14,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(42,14,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(43,15,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(44,15,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(45,15,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(46,16,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(47,16,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(48,16,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(49,17,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(50,17,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(51,17,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(52,18,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(53,18,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(54,18,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(55,19,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(56,19,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(57,19,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(58,20,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(59,20,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(60,20,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(61,21,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(62,21,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(63,21,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(64,22,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(65,22,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(66,22,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(67,23,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(68,23,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(69,23,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(70,24,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(71,24,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(72,24,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(73,25,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(74,25,'loan prod 1',1,'3000.0000',2,'21.0000',2,1,'2924.9000',2,'18.1000',2),(75,25,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(76,26,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(77,26,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(78,26,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(79,27,'loan prod 2',1,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(80,27,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(81,27,'loan prod 1',2,'6000.0000',2,'5.8000',2,0,'0.0000',2,'0.0000',2),(82,28,'loan prod 1',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(83,28,'loan prod 2',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2),(84,28,'group load',0,'0.0000',2,'0.0000',2,0,'0.0000',2,'0.0000',2);
/*!40000 ALTER TABLE `batch_loan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_staff_summary`
--

DROP TABLE IF EXISTS `batch_staff_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_staff_summary` (
  `staff_summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_report_id` int(11) NOT NULL,
  `personnel_id` smallint(6) NOT NULL,
  `personnel_name` varchar(50) NOT NULL,
  `joining_date` date DEFAULT NULL,
  `active_borrowers` int(11) NOT NULL,
  `active_loans` int(11) NOT NULL,
  `center_count` int(11) NOT NULL,
  `client_count` int(11) NOT NULL,
  `loan_amount_outstanding` decimal(21,4) NOT NULL,
  `loan_amount_outstanding_currency_id` smallint(6) NOT NULL,
  `interest_fees_outstanding` decimal(21,4) NOT NULL,
  `interest_fees_outstanding_currency_id` smallint(6) NOT NULL,
  `portfolio_at_risk` decimal(21,4) NOT NULL,
  `total_clients_enrolled` int(11) NOT NULL,
  `clients_enrolled_this_month` int(11) NOT NULL,
  `loan_arrears_amount` decimal(21,4) NOT NULL,
  `loan_arrears_amount_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`staff_summary_id`),
  KEY `branch_report_id` (`branch_report_id`),
  CONSTRAINT `batch_staff_summary_ibfk_1` FOREIGN KEY (`branch_report_id`) REFERENCES `batch_branch_report` (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_staff_summary`
--

LOCK TABLES `batch_staff_summary` WRITE;
/*!40000 ALTER TABLE `batch_staff_summary` DISABLE KEYS */;
INSERT INTO `batch_staff_summary` VALUES (1,1,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,3,'0.0000',2),(2,3,4,'br1 lo 2 xxx','2010-07-04',0,0,2,3,'0.0000',2,'0.0000',2,'0.0000',2,2,'0.0000',2),(3,3,3,'br1 lo 1 smith','2010-06-20',0,0,2,9,'0.0000',2,'0.0000',2,'0.0000',11,11,'0.0000',2),(4,5,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,0,'0.0000',2),(5,7,3,'br1 lo 1 smith','2010-06-20',0,0,2,12,'0.0000',2,'0.0000',2,'0.0000',20,2,'0.0000',2),(6,7,6,'br1 lo3 Sturty xxx','2010-07-29',0,0,1,1,'0.0000',2,'0.0000',2,'0.0000',0,0,'0.0000',2),(7,7,4,'br1 lo 2 xxx','2010-07-04',0,0,1,5,'0.0000',2,'0.0000',2,'0.0000',2,0,'0.0000',2),(8,9,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,0,'0.0000',2),(9,11,3,'br1 lo 1 smith','2010-06-20',0,0,2,12,'0.0000',2,'0.0000',2,'0.0000',20,2,'0.0000',2),(10,11,4,'br1 lo 2 xxx','2010-07-04',0,0,1,5,'0.0000',2,'0.0000',2,'0.0000',2,0,'0.0000',2),(11,11,6,'br1 lo3 Sturty xxx','2010-07-29',0,0,1,1,'0.0000',2,'0.0000',2,'0.0000',0,0,'0.0000',2),(12,13,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,0,'0.0000',2),(13,15,3,'br1 lo 1 smith','2010-06-20',0,0,2,12,'0.0000',2,'0.0000',2,'0.0000',20,2,'0.0000',2),(14,15,4,'br1 lo 2 xxx','2010-07-04',0,0,1,5,'0.0000',2,'0.0000',2,'0.0000',2,0,'0.0000',2),(15,15,6,'br1 lo3 Sturty xxx','2010-07-29',0,0,1,1,'0.0000',2,'0.0000',2,'0.0000',0,0,'0.0000',2),(16,17,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,0,'0.0000',2),(17,19,3,'br1 lo 1 smith','2010-06-20',0,0,2,12,'0.0000',2,'0.0000',2,'0.0000',20,2,'0.0000',2),(18,19,4,'br1 lo 2 xxx','2010-07-04',0,0,1,5,'0.0000',2,'0.0000',2,'0.0000',2,0,'0.0000',2),(19,19,6,'br1 lo3 Sturty xxx','2010-07-29',0,0,1,1,'0.0000',2,'0.0000',2,'0.0000',0,0,'0.0000',2),(20,21,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,0,'0.0000',2),(21,23,4,'br1 lo 2 xxx','2010-07-04',0,0,1,5,'0.0000',2,'0.0000',2,'0.0000',2,0,'0.0000',2),(22,23,6,'br1 lo3 Sturty xxx','2010-07-29',0,0,1,1,'0.0000',2,'0.0000',2,'0.0000',0,0,'0.0000',2),(23,23,3,'br1 lo 1 smith','2010-06-20',0,0,2,12,'0.0000',2,'0.0000',2,'0.0000',20,2,'0.0000',2),(24,25,5,'br2 LO xxx','2010-07-20',1,1,2,4,'2924.9000',2,'18.1000',2,'0.0000',3,0,'0.0000',2),(25,27,6,'br1 lo3 Sturty xxx','2010-07-29',0,0,1,1,'0.0000',2,'0.0000',2,'0.0000',0,0,'0.0000',2),(26,27,4,'br1 lo 2 xxx','2010-07-04',0,0,1,5,'0.0000',2,'0.0000',2,'0.0000',2,0,'0.0000',2),(27,27,3,'br1 lo 1 smith','2010-06-20',0,0,2,12,'0.0000',2,'0.0000',2,'0.0000',20,2,'0.0000',2);
/*!40000 ALTER TABLE `batch_staff_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_staffing_level_summary`
--

DROP TABLE IF EXISTS `batch_staffing_level_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_staffing_level_summary` (
  `staffing_level_summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_report_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `personnel_count` int(11) NOT NULL,
  PRIMARY KEY (`staffing_level_summary_id`),
  KEY `branch_report_id` (`branch_report_id`),
  CONSTRAINT `batch_staffing_level_summary_ibfk_1` FOREIGN KEY (`branch_report_id`) REFERENCES `batch_branch_report` (`branch_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_staffing_level_summary`
--

LOCK TABLES `batch_staffing_level_summary` WRITE;
/*!40000 ALTER TABLE `batch_staffing_level_summary` DISABLE KEYS */;
INSERT INTO `batch_staffing_level_summary` VALUES (1,1,-1,'Total Staff',1),(2,1,1,'No Title',1),(3,2,-1,'Total Staff',0),(4,3,-1,'Total Staff',2),(5,3,1,'big user',1),(6,3,1,'No Title',1),(7,4,-1,'Total Staff',0),(8,5,-1,'Total Staff',1),(9,5,1,'No Title',1),(10,6,-1,'Total Staff',0),(11,7,1,'No Title',2),(12,7,-1,'Total Staff',3),(13,7,1,'big user',1),(14,8,-1,'Total Staff',0),(15,9,-1,'Total Staff',1),(16,9,1,'No Title',1),(17,10,-1,'Total Staff',0),(18,11,1,'No Title',2),(19,11,-1,'Total Staff',3),(20,11,1,'big user',1),(21,12,-1,'Total Staff',0),(22,13,-1,'Total Staff',1),(23,13,1,'No Title',1),(24,14,-1,'Total Staff',0),(25,15,1,'No Title',2),(26,15,-1,'Total Staff',3),(27,15,1,'big user',1),(28,16,-1,'Total Staff',0),(29,17,-1,'Total Staff',1),(30,17,1,'No Title',1),(31,18,-1,'Total Staff',0),(32,19,1,'No Title',2),(33,19,-1,'Total Staff',3),(34,19,1,'big user',1),(35,20,-1,'Total Staff',0),(36,21,-1,'Total Staff',1),(37,21,1,'No Title',1),(38,22,-1,'Total Staff',0),(39,23,1,'No Title',2),(40,23,-1,'Total Staff',3),(41,23,1,'big user',1),(42,24,-1,'Total Staff',0),(43,25,-1,'Total Staff',1),(44,25,1,'No Title',1),(45,26,-1,'Total Staff',0),(46,27,1,'No Title',2),(47,27,-1,'Total Staff',3),(48,27,1,'big user',1),(49,28,-1,'Total Staff',0);
/*!40000 ALTER TABLE `batch_staffing_level_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_ho_update`
--

DROP TABLE IF EXISTS `branch_ho_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_ho_update` (
  `office_id` smallint(6) NOT NULL,
  `last_updated_date` date DEFAULT NULL,
  PRIMARY KEY (`office_id`),
  CONSTRAINT `branch_ho_update_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_ho_update`
--

LOCK TABLES `branch_ho_update` WRITE;
/*!40000 ALTER TABLE `branch_ho_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_ho_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_type`
--

DROP TABLE IF EXISTS `category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_type` (
  `category_id` smallint(6) NOT NULL,
  `category_lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_lookup_id` (`category_lookup_id`),
  CONSTRAINT `category_type_ibfk_1` FOREIGN KEY (`category_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type`
--

LOCK TABLES `category_type` WRITE;
/*!40000 ALTER TABLE `category_type` DISABLE KEYS */;
INSERT INTO `category_type` VALUES (1,81),(2,82),(3,83),(4,84),(5,86);
/*!40000 ALTER TABLE `category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_log`
--

DROP TABLE IF EXISTS `change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_log` (
  `change_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `changed_by` smallint(6) NOT NULL,
  `modifier_name` varchar(50) NOT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` smallint(6) DEFAULT NULL,
  `changed_date` date DEFAULT NULL,
  `fields_changed` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`change_log_id`),
  KEY `changed_by` (`changed_by`),
  KEY `change_log_idx` (`entity_type`,`entity_id`,`changed_date`),
  CONSTRAINT `change_log_ibfk_1` FOREIGN KEY (`changed_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_log`
--

LOCK TABLES `change_log` WRITE;
/*!40000 ALTER TABLE `change_log` DISABLE KEYS */;
INSERT INTO `change_log` VALUES (1,1,'mifos',2,12,'2010-07-02',NULL),(2,1,'mifos',3,1,'2010-07-02',NULL),(3,1,'mifos',4,1,'2010-07-02',NULL),(4,1,'mifos',4,22,'2010-07-02',NULL),(5,1,'mifos',7,21,'2010-07-02',NULL),(6,1,'mifos',8,22,'2010-07-02',NULL),(7,1,'mifos',5,12,'2010-07-03',NULL),(8,1,'mifos',6,1,'2010-07-03',NULL),(9,1,'mifos',11,21,'2010-07-03',NULL),(10,1,'mifos',7,1,'2010-07-03',NULL),(11,1,'mifos',15,22,'2010-07-04',NULL),(12,1,'mifos',16,22,'2010-07-05',NULL),(13,1,'mifos',17,21,'2010-07-05',NULL),(14,1,'mifos',8,12,'2010-07-05',NULL),(15,1,'mifos',9,1,'2010-07-05',NULL),(16,1,'mifos',20,21,'2010-07-05',NULL),(17,1,'mifos',20,21,'2010-07-05',NULL),(18,1,'mifos',20,21,'2010-07-05',NULL),(19,1,'mifos',20,21,'2010-07-05',NULL),(20,1,'mifos',4,22,'2010-07-18',NULL),(21,1,'mifos',21,22,'2010-07-18',NULL),(22,1,'mifos',10,1,'2010-07-18',NULL),(23,1,'mifos',23,22,'2010-07-18',NULL),(24,1,'mifos',24,21,'2010-07-18',NULL),(25,1,'mifos',24,21,'2010-07-18',NULL),(26,1,'mifos',12,12,'2010-07-20',NULL),(27,1,'mifos',13,1,'2010-07-20',NULL),(28,1,'mifos',14,1,'2010-07-21',NULL),(29,1,'mifos',15,12,'2010-07-21',NULL),(30,1,'mifos',32,22,'2010-07-21',NULL),(31,1,'mifos',30,21,'2010-07-21',NULL),(32,1,'mifos',7,21,'2010-07-21',NULL),(33,1,'mifos',16,1,'2010-07-21',NULL),(34,1,'mifos',34,21,'2010-07-21',NULL),(35,1,'mifos',16,1,'2010-07-21',NULL),(36,1,'mifos',17,1,'2010-07-21',NULL),(37,1,'mifos',18,1,'2010-07-22',NULL),(38,1,'mifos',38,22,'2010-07-22',NULL),(39,1,'mifos',20,12,'2010-07-22',NULL),(40,1,'mifos',21,12,'2010-07-22',NULL),(41,1,'mifos',22,12,'2010-07-22',NULL),(42,1,'mifos',23,1,'2010-07-22',NULL),(43,1,'mifos',44,22,'2010-07-22',NULL),(44,1,'mifos',24,1,'2010-07-22',NULL),(45,1,'mifos',46,21,'2010-07-22',NULL),(46,1,'mifos',44,22,'2010-07-23',NULL),(47,1,'mifos',46,21,'2010-07-23',NULL),(48,1,'mifos',18,1,'2010-07-25',NULL),(49,1,'mifos',47,21,'2010-07-25',NULL),(50,1,'mifos',18,1,'2010-07-25',NULL),(51,1,'mifos',18,1,'2010-07-25',NULL),(52,1,'mifos',18,1,'2010-07-25',NULL),(53,1,'mifos',26,12,'2010-07-25',NULL),(54,1,'mifos',27,12,'2010-07-25',NULL),(55,1,'mifos',28,1,'2010-07-25',NULL),(56,1,'mifos',53,22,'2010-07-25',NULL),(57,1,'mifos',29,12,'2010-07-25',NULL),(58,1,'mifos',55,22,'2010-07-25',NULL),(59,1,'mifos',56,21,'2010-07-25',NULL),(60,1,'mifos',30,1,'2010-07-25',NULL),(61,1,'mifos',58,21,'2010-07-25',NULL),(62,1,'mifos',59,22,'2010-07-25',NULL),(63,1,'mifos',61,21,'2010-07-25',NULL),(64,1,'mifos',33,12,'2010-07-25',NULL),(65,1,'mifos',64,21,'2010-07-25',NULL),(66,1,'mifos',34,1,'2010-07-25',NULL),(67,1,'mifos',66,22,'2010-07-25',NULL),(68,1,'mifos',32,20,'2010-07-27',NULL),(69,1,'mifos',67,21,'2010-07-28',NULL),(70,1,'mifos',32,20,'2010-07-29',NULL),(71,1,'mifos',35,12,'2010-07-29',NULL),(72,1,'mifos',36,1,'2010-07-29',NULL),(73,1,'mifos',37,12,'2010-07-29',NULL),(74,1,'mifos',38,1,'2010-07-29',NULL),(75,1,'mifos',39,12,'2010-07-29',NULL),(76,1,'mifos',40,1,'2010-07-29',NULL),(77,1,'mifos',22,12,'2010-07-29',NULL),(78,1,'mifos',42,12,'2010-07-29',NULL),(79,1,'mifos',76,21,'2010-07-29',NULL),(80,1,'mifos',43,1,'2010-07-29',NULL),(81,1,'mifos',78,22,'2010-07-29',NULL),(82,1,'mifos',44,1,'2010-07-29',NULL),(83,1,'mifos',80,21,'2010-07-29',NULL),(84,1,'mifos',44,1,'2010-07-29',NULL),(85,1,'mifos',42,12,'2010-07-29',NULL),(86,1,'mifos',45,1,'2010-07-29',NULL),(87,1,'mifos',82,21,'2010-07-29',NULL),(88,1,'mifos',46,12,'2010-07-29',NULL),(89,1,'mifos',84,21,'2010-07-29',NULL),(90,1,'mifos',47,1,'2010-07-29',NULL),(91,1,'mifos',86,22,'2010-07-29',NULL),(92,1,'mifos',45,1,'2010-07-31',NULL),(93,1,'mifos',86,22,'2010-07-31',NULL),(94,1,'mifos',48,12,'2010-07-31',NULL),(95,1,'mifos',88,21,'2010-07-31',NULL),(96,1,'mifos',18,1,'2010-08-01',NULL),(97,1,'mifos',49,12,'2010-08-01',NULL),(98,1,'mifos',50,1,'2010-08-01',NULL),(99,1,'mifos',91,22,'2010-08-01',NULL),(100,1,'mifos',51,1,'2010-08-01',NULL),(101,1,'mifos',51,1,'2010-08-01',NULL),(102,1,'mifos',52,12,'2010-08-01',NULL),(103,1,'mifos',95,21,'2010-08-01',NULL),(104,1,'mifos',50,1,'2010-08-04',NULL),(105,1,'mifos',53,12,'2010-08-04',NULL),(106,1,'mifos',54,1,'2010-08-04',NULL),(107,1,'mifos',54,1,'2010-08-06',NULL),(108,1,'mifos',56,12,'2010-08-07',NULL),(109,1,'mifos',100,21,'2010-08-07',NULL),(110,1,'mifos',56,12,'2010-08-07',NULL),(111,1,'mifos',56,12,'2010-08-07',NULL),(112,1,'mifos',56,12,'2010-08-07',NULL),(113,1,'mifos',57,12,'2010-08-07',NULL),(114,1,'mifos',102,21,'2010-08-07',NULL),(115,1,'mifos',58,12,'2010-08-20',NULL),(116,1,'mifos',59,1,'2010-08-20',NULL),(117,1,'mifos',62,12,'2010-08-27',NULL),(118,1,'mifos',63,1,'2010-08-27',NULL),(119,1,'mifos',109,21,'2010-08-27',NULL),(120,1,'mifos',65,12,'2010-08-28',NULL),(121,1,'mifos',5,2,'2010-08-28',NULL),(122,1,'mifos',1,2,'2010-08-28',NULL),(123,1,'mifos',4,2,'2010-08-28',NULL),(124,1,'mifos',112,22,'2010-08-28',NULL);
/*!40000 ALTER TABLE `change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_log_detail`
--

DROP TABLE IF EXISTS `change_log_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_log_detail` (
  `sequence_num` int(11) NOT NULL AUTO_INCREMENT,
  `change_log_id` int(11) NOT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `old_value` varchar(200) DEFAULT NULL,
  `new_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sequence_num`),
  KEY `change_log_id` (`change_log_id`),
  CONSTRAINT `change_log_detail_ibfk_1` FOREIGN KEY (`change_log_id`) REFERENCES `change_log` (`change_log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_log_detail`
--

LOCK TABLES `change_log_detail` WRITE;
/*!40000 ALTER TABLE `change_log_detail` DISABLE KEYS */;
INSERT INTO `change_log_detail` VALUES (1,1,'Status','Application Pending Approval','Active'),(2,2,'Status','Application Pending Approval','Active'),(3,3,'Status','Application Pending Approval','Active'),(4,4,'Status','Application Pending Approval','Application Approved'),(5,5,'activationDate','-','02/07/2010'),(6,5,'Status','Application Pending Approval','Active'),(7,6,'Status','Application Pending Approval','Application Approved'),(8,7,'Status','Application Pending Approval','Active'),(9,8,'Status','Application Pending Approval','Active'),(10,9,'Status','Application Pending Approval','Active'),(11,9,'activationDate','-','03/07/2010'),(12,10,'Status','Application Pending Approval','Active'),(13,11,'Status','Application Pending Approval','Application Approved'),(14,12,'Status','Application Pending Approval','Application Approved'),(15,13,'activationDate','-','05/07/2010'),(16,13,'Status','Application Pending Approval','Active'),(17,14,'Status','Application Pending Approval','Active'),(18,15,'Status','Application Pending Approval','Active'),(19,16,'activationDate','-','05/07/2010'),(20,16,'Status','Application Pending Approval','Active'),(21,17,'Status','Active','Inactive'),(22,18,'Status','Active','Inactive'),(23,19,'Status','Active','Inactive'),(24,20,'Status','Active in Good Standing','Closed- Written Off'),(25,21,'Status','Application Pending Approval','Application Approved'),(26,22,'Status','Application Pending Approval','Active'),(27,23,'Status','Application Pending Approval','Application Approved'),(28,24,'Status','Application Pending Approval','Active'),(29,24,'activationDate','-','18/07/2010'),(30,25,'Status','Active','Inactive'),(31,26,'Status','Application Pending Approval','Active'),(32,27,'Status','Application Pending Approval','Active'),(33,28,'Status','Application Pending Approval','Active'),(34,29,'Status','Application Pending Approval','Active'),(35,30,'Status','Application Pending Approval','Application Approved'),(36,31,'Status','Application Pending Approval','Active'),(37,31,'activationDate','-','21/07/2010'),(38,32,'Status','Active','Inactive'),(39,33,'Status','Application Pending Approval','Active'),(40,34,'Status','Application Pending Approval','Active'),(41,34,'activationDate','-','21/07/2010'),(42,35,'First Name','d,xfer to gr in center','d,xfer to gr in center (if on same day)'),(43,36,'Status','Application Pending Approval','Active'),(44,37,'Status','Application Pending Approval','Active'),(45,38,'Status','Application Pending Approval','Application Approved'),(46,39,'Status','Application Pending Approval','Active'),(47,40,'Status','Application Pending Approval','Active'),(48,41,'Status','Application Pending Approval','Active'),(49,42,'Status','Application Pending Approval','Active'),(50,43,'Status','Application Pending Approval','Application Approved'),(51,44,'Status','Application Pending Approval','Active'),(52,45,'activationDate','-','22/07/2010'),(53,45,'Status','Application Pending Approval','Active'),(54,46,'Status','Active in Good Standing','Closed- Written Off'),(55,47,'Status','Active','Inactive'),(56,48,'groupFlag','1','0'),(57,48,'Group Name','group dw1 1','-'),(58,49,'activationDate','-','25/07/2010'),(59,49,'Status','Application Pending Approval','Active'),(60,50,'Status','Active','On Hold'),(61,50,'Loan Officer Assigned','br1 lo 1 smith','-'),(62,50,'Branch membership','BO 1','br2'),(63,51,'Loan Officer Assigned','-','br2 LO xxx'),(64,52,'Status','On Hold','Active'),(65,53,'Status','Application Pending Approval','Active'),(66,54,'Status','Application Pending Approval','Active'),(67,55,'Status','Application Pending Approval','Active'),(68,56,'Status','Application Pending Approval','Application Approved'),(69,57,'Status','Application Pending Approval','Active'),(70,58,'Status','Application Pending Approval','Application Approved'),(71,59,'activationDate','-','25/07/2010'),(72,59,'Status','Application Pending Approval','Active'),(73,60,'Status','Application Pending Approval','Active'),(74,61,'activationDate','-','25/07/2010'),(75,61,'Status','Application Pending Approval','Active'),(76,62,'Status','Application Pending Approval','Application Approved'),(77,63,'activationDate','-','25/07/2010'),(78,63,'Status','Application Pending Approval','Active'),(79,64,'Status','Application Pending Approval','Active'),(80,65,'activationDate','-','25/07/2010'),(81,65,'Status','Application Pending Approval','Active'),(82,66,'Status','Application Pending Approval','Active'),(83,67,'Status','Application Pending Approval','Application Approved'),(84,68,'Loan Officer Assigned','br1 lo 1 smith','br1 lo 2 xxx'),(85,69,'Status','Application Pending Approval','Active'),(86,69,'activationDate','-','28/07/2010'),(87,70,'Loan Officer Assigned','br1 lo 2 xxx','br1 lo3 Sturty xxx'),(88,71,'Status','Application Pending Approval','Active'),(89,72,'Status','Application Pending Approval','Active'),(90,73,'Status','Application Pending Approval','Active'),(91,74,'Status','Application Pending Approval','Active'),(92,75,'Status','Application Pending Approval','Active'),(93,76,'Status','Application Pending Approval','Active'),(94,77,'Name','group 3 for center 2','group 3 for switch LOs'),(95,77,'Loan Officer Assigned','br1 lo 2 xxx','br1 lo3 Sturty xxx'),(96,78,'Status','Application Pending Approval','Active'),(97,79,'Status','Application Pending Approval','Active'),(98,79,'activationDate','-','29/07/2010'),(99,80,'Status','Application Pending Approval','Active'),(100,81,'Status','Application Pending Approval','Application Approved'),(101,82,'Status','Application Pending Approval','Active'),(102,83,'Status','Application Pending Approval','Active'),(103,83,'activationDate','-','29/07/2010'),(104,84,'Loan Officer Assigned','br1 lo 1 smith','br1 lo 2 xxx'),(105,85,'Loan Officer Assigned','br1 lo 1 smith','br1 lo 2 xxx'),(106,86,'Status','Application Pending Approval','Active'),(107,87,'activationDate','-','29/07/2010'),(108,87,'Status','Application Pending Approval','Active'),(109,88,'Status','Application Pending Approval','Active'),(110,89,'activationDate','-','29/07/2010'),(111,89,'Status','Application Pending Approval','Active'),(112,90,'Status','Application Pending Approval','Active'),(113,91,'Status','Application Pending Approval','Application Approved'),(114,92,'Status','Active','On Hold'),(115,92,'Loan Officer Assigned','br1 lo 1 smith','-'),(116,92,'Branch membership','BO 1','br2'),(117,93,'Status','Application Approved','Cancel'),(118,93,'_org.mifos.accounts.business.AccountBO.accountFlagsBackref','-','<unknown>'),(119,93,'Explanation','-','Withdraw'),(120,94,'Status','Application Pending Approval','Active'),(121,95,'activationDate','-','31/07/2010'),(122,95,'Status','Application Pending Approval','Active'),(123,96,'groupFlag','1','0'),(124,96,'Loan Officer Assigned','br1 lo 1 smith','br1 lo3 Sturty xxx'),(125,96,'Group Name','group dw1 1','-'),(126,97,'Status','Application Pending Approval','Active'),(127,98,'Status','Application Pending Approval','Active'),(128,99,'Status','Application Pending Approval','Application Approved'),(129,100,'Status','Application Pending Approval','Active'),(130,101,'groupFlag','1','0'),(131,101,'Loan Officer Assigned','br1 lo 1 smith','br1 lo 2 xxx'),(132,101,'Group Name','group whatever','-'),(133,102,'Status','Application Pending Approval','Active'),(134,103,'activationDate','-','01/08/2010'),(135,103,'Status','Application Pending Approval','Active'),(136,104,'groupFlag','1','0'),(137,104,'Group Name','group whatever','-'),(138,104,'Loan Officer Assigned','br1 lo 1 smith','br1 lo3 Sturty xxx'),(139,105,'Status','Application Pending Approval','Active'),(140,106,'Status','Application Pending Approval','Active'),(141,107,'Group Name','generic group','-'),(142,107,'Loan Officer Assigned','br1 lo 1 smith','br1 lo3 Sturty xxx'),(143,107,'groupFlag','1','0'),(144,108,'Status','Application Pending Approval','Active'),(145,109,'activationDate','-','07/08/2010'),(146,109,'Status','Application Pending Approval','Active'),(147,110,'Name','group for center change to diff branch','group for change to diff center'),(148,111,'Name','group for change to diff center','group for change to diff center in same branch'),(149,112,'Name','group for change to diff center in same branch','group for change to center in same branch'),(150,113,'Status','Application Pending Approval','Active'),(151,114,'activationDate','-','07/08/2010'),(152,114,'Status','Application Pending Approval','Active'),(153,115,'Status','Application Pending Approval','Active'),(154,116,'Status','Application Pending Approval','Active'),(155,117,'Status','Application Pending Approval','Active'),(156,118,'Status','Application Pending Approval','Active'),(157,119,'Status','Application Pending Approval','Active'),(158,119,'activationDate','-','27/08/2010'),(159,120,'Status','Application Pending Approval','Active'),(160,121,'Fee Types','-','loan fee one time time of 1st loan repayment 80,loan fee one time upfront 60,loan fee periodic 90,loan fee one time time of disb 70'),(161,121,'Product Instance Name','group load','group loan'),(162,122,'Fee Types','-','loan fee one time time of 1st loan repayment 80,loan fee one time upfront 60,loan fee one time time of disb 70,loan fee periodic 90'),(163,123,'Fee Types','-','loan fee one time time of disb 70,loan fee periodic 90,loan fee one time upfront 60,loan fee one time time of 1st loan repayment 80'),(164,124,'Status','Application Pending Approval','Application Approved');
/*!40000 ALTER TABLE `change_log_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist`
--

DROP TABLE IF EXISTS `checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist` (
  `checklist_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `checklist_name` varchar(100) DEFAULT NULL,
  `checklist_status` smallint(6) NOT NULL DEFAULT '1',
  `locale_id` smallint(6) NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`checklist_id`),
  KEY `locale_id` (`locale_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `checklist_ibfk_1` FOREIGN KEY (`locale_id`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `checklist_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `checklist_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist`
--

LOCK TABLES `checklist` WRITE;
/*!40000 ALTER TABLE `checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checklist_detail`
--

DROP TABLE IF EXISTS `checklist_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checklist_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `checklist_id` smallint(6) DEFAULT NULL,
  `locale_id` smallint(6) DEFAULT NULL,
  `detail_text` varchar(250) DEFAULT NULL,
  `answer_type` smallint(6) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `locale_id` (`locale_id`),
  KEY `chk_detail_idx` (`checklist_id`,`locale_id`),
  CONSTRAINT `checklist_detail_ibfk_1` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`checklist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `checklist_detail_ibfk_2` FOREIGN KEY (`locale_id`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checklist_detail`
--

LOCK TABLES `checklist_detail` WRITE;
/*!40000 ALTER TABLE `checklist_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `checklist_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_initial_savings_offering`
--

DROP TABLE IF EXISTS `client_initial_savings_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_initial_savings_offering` (
  `client_offering_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `prd_offering_id` smallint(6) NOT NULL,
  PRIMARY KEY (`client_offering_id`),
  KEY `customer_id` (`customer_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `client_initial_savings_offering_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `client_initial_savings_offering_ibfk_2` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_initial_savings_offering`
--

LOCK TABLES `client_initial_savings_offering` WRITE;
/*!40000 ALTER TABLE `client_initial_savings_offering` DISABLE KEYS */;
INSERT INTO `client_initial_savings_offering` VALUES (1,4,2),(2,7,3),(3,7,2),(4,17,2),(5,28,2),(6,51,2);
/*!40000 ALTER TABLE `client_initial_savings_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_perf_history`
--

DROP TABLE IF EXISTS `client_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_perf_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `last_loan_amnt` decimal(21,4) DEFAULT NULL,
  `last_loan_amnt_currency_id` smallint(6) DEFAULT NULL,
  `total_active_loans` smallint(6) DEFAULT NULL,
  `total_savings_amnt` decimal(21,4) DEFAULT NULL,
  `total_savings_amnt_currency_id` smallint(6) DEFAULT NULL,
  `delinquint_portfolio` decimal(21,4) DEFAULT NULL,
  `delinquint_portfolio_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `client_perf_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_perf_history`
--

LOCK TABLES `client_perf_history` WRITE;
/*!40000 ALTER TABLE `client_perf_history` DISABLE KEYS */;
INSERT INTO `client_perf_history` VALUES (1,3,'0.0000',2,0,'0.0000',2,'0.0000',2),(2,4,'0.0000',2,0,'0.0000',2,'0.0000',2),(3,6,'0.0000',2,0,'0.0000',2,'0.0000',2),(4,7,'0.0000',2,0,'0.0000',2,'0.0000',2),(5,9,'0.0000',2,0,'0.0000',2,'0.0000',2),(6,10,'0.0000',2,0,'0.0000',2,'0.0000',2),(7,13,'0.0000',2,1,'0.0000',2,'0.0000',2),(8,14,'0.0000',2,0,'0.0000',2,'0.0000',2),(9,16,'0.0000',2,0,'0.0000',2,'0.0000',2),(10,17,'0.0000',2,0,'0.0000',2,'0.0000',2),(11,18,'3000.0000',2,0,'0.0000',2,'0.0000',2),(12,23,'0.0000',2,0,'0.0000',2,'0.0000',2),(13,24,'0.0000',2,0,'0.0000',2,'0.0000',2),(14,28,'0.0000',2,0,'0.0000',2,'0.0000',2),(15,30,'0.0000',2,0,'0.0000',2,'0.0000',2),(16,34,'0.0000',2,0,'0.0000',2,'0.0000',2),(17,36,'0.0000',2,0,'0.0000',2,'0.0000',2),(18,38,'0.0000',2,0,'0.0000',2,'0.0000',2),(19,40,'0.0000',2,0,'0.0000',2,'0.0000',2),(20,43,'0.0000',2,0,'0.0000',2,'0.0000',2),(21,44,'0.0000',2,0,'0.0000',2,'0.0000',2),(22,45,'0.0000',2,0,'0.0000',2,'0.0000',2),(23,47,'0.0000',2,0,'0.0000',2,'0.0000',2),(24,50,'0.0000',2,0,'0.0000',2,'0.0000',2),(25,51,'0.0000',2,0,'0.0000',2,'0.0000',2),(26,54,'0.0000',2,0,'0.0000',2,'0.0000',2),(27,59,'0.0000',2,0,'0.0000',2,'0.0000',2),(28,63,'0.0000',2,0,'0.0000',2,'0.0000',2);
/*!40000 ALTER TABLE `client_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coa`
--

DROP TABLE IF EXISTS `coa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coa` (
  `coa_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `coa_name` varchar(150) NOT NULL,
  `glcode_id` smallint(6) NOT NULL,
  `category_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`coa_id`),
  KEY `glcode_id` (`glcode_id`),
  CONSTRAINT `coa_ibfk_1` FOREIGN KEY (`glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coa`
--

LOCK TABLES `coa` WRITE;
/*!40000 ALTER TABLE `coa` DISABLE KEYS */;
INSERT INTO `coa` VALUES (1,'ASSETS',1,'ASSET'),(2,'Cash and bank balances',2,NULL),(3,'Petty Cash Accounts',3,NULL),(4,'Cash 1',4,NULL),(5,'Cash 2',5,NULL),(6,'Bank Balances',6,NULL),(7,'Bank Account 1',7,NULL),(8,'Bank Account 2',8,NULL),(9,'Loan Portfolio',9,NULL),(10,'Loans and Advances',10,NULL),(11,'IGLoan',11,NULL),(12,'ManagedICICI-IGLoan',12,NULL),(13,'SPLoan',13,NULL),(14,'ManagedICICI-SPLoan',14,NULL),(15,'WFLoan',15,NULL),(16,'Managed WFLoan',16,NULL),(17,'Emergency Loans',17,NULL),(18,'Special Loans',18,NULL),(19,'Micro Enterprises Loans',19,NULL),(20,'Loans to clients',20,NULL),(21,'Loan Loss Provisions',21,NULL),(22,'Write-offs',22,NULL),(23,'LIABILITIES',23,'LIABILITY'),(24,'Interest Payable',24,NULL),(25,'Interest payable on clients savings',25,NULL),(26,'Interest on mandatory savings',26,NULL),(27,'Clients Deposits',27,NULL),(28,'Clients Deposits',28,NULL),(29,'Emergency Fund',29,NULL),(30,'Margin Money-1',30,NULL),(31,'Margin Money-2',31,NULL),(32,'Village Development Fund',32,NULL),(33,'Savings accounts',33,NULL),(34,'Mandatory Savings',34,NULL),(35,'Mandatory Savings',35,NULL),(36,'Mandatory Savings Accounts',36,NULL),(37,'INCOME',37,'INCOME'),(38,'Direct Income',38,NULL),(39,'Interest income from loans',39,NULL),(40,'Interest',40,NULL),(41,'Interest on loans',41,NULL),(42,'Penalty',42,NULL),(43,'Income from micro credit & lending activities',43,NULL),(44,'Processing Fees',44,NULL),(45,'Annual Subscription Fee',45,NULL),(46,'Emergency Loan Documentation Fee',46,NULL),(47,'Sale of Publication',47,NULL),(48,'Fines & Penalties',48,NULL),(49,'Miscelleneous Income',49,NULL),(50,'Fees',50,NULL),(51,'Income from 999 Account',51,NULL),(52,'EXPENDITURE',52,'EXPENDITURE'),(53,'Direct Expenditure',53,NULL),(54,'Cost of Funds',54,NULL),(55,'Interest on clients voluntary savings',55,NULL),(56,'Interest on clients mandatory savings',56,NULL);
/*!40000 ALTER TABLE `coa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coa_idmapper`
--

DROP TABLE IF EXISTS `coa_idmapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coa_idmapper` (
  `constant_id` smallint(6) NOT NULL,
  `coa_id` smallint(6) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`constant_id`),
  KEY `coa_id` (`coa_id`),
  CONSTRAINT `coa_idmapper_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`coa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coa_idmapper`
--

LOCK TABLES `coa_idmapper` WRITE;
/*!40000 ALTER TABLE `coa_idmapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `coa_idmapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coahierarchy`
--

DROP TABLE IF EXISTS `coahierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coahierarchy` (
  `coa_id` smallint(6) NOT NULL,
  `parent_coaid` smallint(6) DEFAULT NULL,
  KEY `coa_id` (`coa_id`),
  KEY `parent_coaid` (`parent_coaid`),
  CONSTRAINT `coahierarchy_ibfk_1` FOREIGN KEY (`coa_id`) REFERENCES `coa` (`coa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coahierarchy_ibfk_2` FOREIGN KEY (`parent_coaid`) REFERENCES `coa` (`coa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coahierarchy`
--

LOCK TABLES `coahierarchy` WRITE;
/*!40000 ALTER TABLE `coahierarchy` DISABLE KEYS */;
INSERT INTO `coahierarchy` VALUES (1,NULL),(2,1),(3,2),(4,3),(5,3),(6,2),(7,6),(8,6),(9,1),(10,9),(11,10),(12,10),(13,10),(14,10),(15,10),(16,10),(17,10),(18,10),(19,10),(20,10),(21,9),(22,21),(23,NULL),(24,23),(25,24),(26,25),(27,23),(28,27),(29,28),(30,28),(31,28),(32,28),(33,28),(34,23),(35,34),(36,35),(37,NULL),(38,37),(39,38),(40,39),(41,39),(42,39),(43,38),(44,43),(45,43),(46,43),(47,43),(48,43),(49,43),(50,43),(51,37),(52,NULL),(53,52),(54,53),(55,54),(56,54);
/*!40000 ALTER TABLE `coahierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_key_value_integer`
--

DROP TABLE IF EXISTS `config_key_value_integer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_key_value_integer` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_key` varchar(100) NOT NULL,
  `configuration_value` int(11) NOT NULL,
  PRIMARY KEY (`configuration_id`),
  UNIQUE KEY `configuration_key` (`configuration_key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_key_value_integer`
--

LOCK TABLES `config_key_value_integer` WRITE;
/*!40000 ALTER TABLE `config_key_value_integer` DISABLE KEYS */;
INSERT INTO `config_key_value_integer` VALUES (1,'x',0),(2,' ',0),(3,'jasperReportIsHidden',1),(4,'loanIndividualMonitoringIsEnabled',0),(5,'repaymentSchedulesIndependentOfMeetingIsEnabled',0),(6,'CenterHierarchyExists',1),(7,'ClientCanExistOutsideGroup',1),(8,'GroupCanApplyLoans',1),(9,'minDaysBetweenDisbursalAndFirstRepaymentDay',1),(10,'maxDaysBetweenDisbursalAndFirstRepaymentDay',365),(11,'AdministrativeDocumentsIsEnabled',1),(12,'Recurring fees cleanup done for MIFOS-3712',1);
/*!40000 ALTER TABLE `config_key_value_integer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` smallint(6) NOT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `country_short_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'America','US'),(2,'India','IN'),(3,'Spain','ES'),(4,'England','ENG'),(5,'South Africa','SA'),(6,'United Kingdom','GB'),(7,'Iceland','IS'),(8,'Spain','ES'),(9,'France','FR'),(10,'China','CN'),(11,'Kenya','KE'),(12,'Tanzania','TZ'),(13,'Uganda','UG'),(14,'Algeria','DZ'),(15,'Bahrain','BH'),(16,'Comoros','KM'),(17,'Chad','TD'),(18,'Djibouti','DJ'),(19,'Egypt','EG'),(20,'Eritrea','ER'),(21,'Iraq','IQ'),(22,'Israel','IL'),(23,'Jordan','JO'),(24,'Kuwait','KW'),(25,'Lebanon','LB'),(26,'Libyan Arab Rebublic','LY'),(27,'Mauritania','MR'),(28,'Morocco','MA'),(29,'Oman','OM'),(30,'Qatar','QA'),(31,'Saudi Arabia','SA'),(32,'Somalia','SO'),(33,'Sudan','SD'),(34,'Syrian Arab Republic','SY'),(35,'Tunisia','TN'),(36,'United Arab Emirates','AE'),(37,'Yemen','YE'),(38,'Palestinian Territory, Occupied','PS'),(39,'Western Sahara','EH'),(40,'Angola','AO'),(41,'Brazil','BR'),(42,'Cape Verde','CV'),(43,'Guinea-Bissau','GW'),(44,'Equatorial Guinea','GQ'),(45,'Macau','MO'),(46,'Mozambique','MZ'),(47,'Portugal','PT'),(48,'Sao Tome and Principe','ST'),(49,'Cambodia','KH'),(50,'Laos','LA'),(51,'Hungary','HU');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currency_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) DEFAULT NULL,
  `rounding_amount` decimal(6,3) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'US Dollar','1.000','USD'),(2,'Indian Rupee','1.000','INR'),(3,'Euro','1.000','EUR'),(4,'Pound Sterling','1.000','GBP'),(5,'United Arab Emirates dirham','1.000','AED'),(6,'Afghani','1.000','AFN'),(7,'Lek','1.000','ALL'),(8,'Armenian dram','1.000','AMD'),(9,'Netherlands Antillean guilder','1.000','ANG'),(10,'Kwanza','1.000','AOA'),(11,'Argentine peso','1.000','ARS'),(12,'Australian dollar','1.000','AUD'),(13,'Aruban guilder','1.000','AWG'),(14,'Azerbaijanian manat','1.000','AZN'),(15,'Convertible marks','1.000','BAM'),(16,'Barbados dollar','1.000','BBD'),(17,'Bangladeshi taka','1.000','BDT'),(18,'Bulgarian lev','1.000','BGN'),(19,'Bahraini dinar','1.000','BHD'),(20,'Burundian franc','1.000','BIF'),(21,'Bermudian dollar','1.000','BMD'),(22,'Brunei dollar','1.000','BND'),(23,'Boliviano','1.000','BOB'),(24,'Bolivian Mvdol','1.000','BOV'),(25,'Brazilian real','1.000','BRL'),(26,'Bahamian dollar','1.000','BSD'),(27,'Ngultrum','1.000','BTN'),(28,'Pula','1.000','BWP'),(29,'Belarussian ruble','1.000','BYR'),(30,'Belize dollar','1.000','BZD'),(31,'Canadian dollar','1.000','CAD'),(32,'Franc Congolais','1.000','CDF'),(33,'WIR euro','1.000','CHE'),(34,'Swiss franc','1.000','CHF'),(35,'WIR franc','1.000','CHW'),(36,'Unidad de Fomento','1.000','CLF'),(37,'Chilean peso','1.000','CLP'),(38,'Renminbi','1.000','CNY'),(39,'Colombian peso','1.000','COP'),(40,'Unidad de Valor Real','1.000','COU'),(41,'Costa Rican colon','1.000','CRC'),(42,'Cuban peso','1.000','CUP'),(43,'Cape Verde escudo','1.000','CVE'),(44,'Czech koruna','1.000','CZK'),(45,'Djibouti franc','1.000','DJF'),(46,'Danish krone','1.000','DKK'),(47,'Dominican peso','1.000','DOP'),(48,'Algerian dinar','1.000','DZD'),(49,'Kroon','1.000','EEK'),(50,'Egyptian pound','1.000','EGP'),(51,'Nakfa','1.000','ERN'),(52,'Ethiopian birr','1.000','ETB'),(53,'Fiji dollar','1.000','FJD'),(54,'Falkland Islands pound','1.000','FKP'),(55,'Lari','1.000','GEL'),(56,'Cedi','1.000','GHS'),(57,'Gibraltar pound','1.000','GIP'),(58,'Dalasi','1.000','GMD'),(59,'Guinea franc','1.000','GNF'),(60,'Quetzal','1.000','GTQ'),(61,'Guyana dollar','1.000','GYD'),(62,'Hong Kong dollar','1.000','HKD'),(63,'Lempira','1.000','HNL'),(64,'Croatian kuna','1.000','HRK'),(65,'Haiti gourde','1.000','HTG'),(66,'Forint','1.000','HUF'),(67,'Rupiah','1.000','IDR'),(68,'Israeli new sheqel','1.000','ILS'),(69,'Iraqi dinar','1.000','IQD'),(70,'Iranian rial','1.000','IRR'),(71,'Iceland krona','1.000','ISK'),(72,'Jamaican dollar','1.000','JMD'),(73,'Jordanian dinar','1.000','JOD'),(74,'Japanese yen','1.000','JPY'),(75,'Kenyan shilling','1.000','KES'),(76,'Som','1.000','KGS'),(77,'Riel','1.000','KHR'),(78,'Comoro franc','1.000','KMF'),(79,'North Korean won','1.000','KPW'),(80,'South Korean won','1.000','KRW'),(81,'Kuwaiti dinar','1.000','KWD'),(82,'Cayman Islands dollar','1.000','KYD'),(83,'Tenge','1.000','KZT'),(84,'Kip','1.000','LAK'),(85,'Lebanese pound','1.000','LBP'),(86,'Sri Lanka rupee','1.000','LKR'),(87,'Liberian dollar','1.000','LRD'),(88,'Loti','1.000','LSL'),(89,'Lithuanian litas','1.000','LTL'),(90,'Latvian lats','1.000','LVL'),(91,'Libyan dinar','1.000','LYD'),(92,'Moroccan dirham','1.000','MAD'),(93,'Moldovan leu','1.000','MDL'),(94,'Malagasy ariary','1.000','MGA'),(95,'Denar','1.000','MKD'),(96,'Kyat','1.000','MMK'),(97,'Tugrik','1.000','MNT'),(98,'Pataca','1.000','MOP'),(99,'Ouguiya','1.000','MRO'),(100,'Mauritius rupee','1.000','MUR'),(101,'Rufiyaa','1.000','MVR'),(102,'Kwacha','1.000','MWK'),(103,'Mexican peso','1.000','MXN'),(104,'Mexican Unidad de Inversion','1.000','MXV'),(105,'Malaysian ringgit','1.000','MYR'),(106,'Metical','1.000','MZN'),(107,'Namibian dollar','1.000','NAD'),(108,'Naira','1.000','NGN'),(109,'Cordoba oro','1.000','NIO'),(110,'Norwegian krone','1.000','NOK'),(111,'Nepalese rupee','1.000','NPR'),(112,'New Zealand dollar','1.000','NZD'),(113,'Rial Omani','1.000','OMR'),(114,'Balboa','1.000','PAB'),(115,'Nuevo sol','1.000','PEN'),(116,'Kina','1.000','PGK'),(117,'Philippine peso','1.000','PHP'),(118,'Pakistan rupee','1.000','PKR'),(119,'Zloty','1.000','PLN'),(120,'Guarani','1.000','PYG'),(121,'Qatari rial','1.000','QAR'),(122,'Romanian new leu','1.000','RON'),(123,'Serbian dinar','1.000','RSD'),(124,'Russian rouble','1.000','RUB'),(125,'Rwanda franc','1.000','RWF'),(126,'Saudi riyal','1.000','SAR'),(127,'Solomon Islands dollar','1.000','SBD'),(128,'Seychelles rupee','1.000','SCR'),(129,'Sudanese pound','1.000','SDG'),(130,'Swedish krona','1.000','SEK'),(131,'Singapore dollar','1.000','SGD'),(132,'Saint Helena pound','1.000','SHP'),(133,'Slovak koruna','1.000','SKK'),(134,'Leone','1.000','SLL'),(135,'Somali shilling','1.000','SOS'),(136,'Surinam dollar','1.000','SRD'),(137,'Dobra','1.000','STD'),(138,'Syrian pound','1.000','SYP'),(139,'Lilangeni','1.000','SZL'),(140,'Baht','1.000','THB'),(141,'Somoni','1.000','TJS'),(142,'Manat','1.000','TMM'),(143,'Tunisian dinar','1.000','TND'),(144,'Pa\'anga','1.000','TOP'),(145,'New Turkish lira','1.000','TRY'),(146,'Trinidad and Tobago dollar','1.000','TTD'),(147,'New Taiwan dollar','1.000','TWD'),(148,'Tanzanian shilling','1.000','TZS'),(149,'Hryvnia','1.000','UAH'),(150,'Uganda shilling','1.000','UGX'),(151,'US dollar (next day)','1.000','USN'),(152,'US dollar (same day)','1.000','USS'),(153,'Peso Uruguayo','1.000','UYU'),(154,'Uzbekistan som','1.000','UZS'),(155,'Venezuelan Bolivares Fuertes','1.000','VEF'),(156,'Vietnamese Dong','1.000','VND'),(157,'Vatu','1.000','VUV'),(158,'Samoan tala','1.000','WST'),(159,'CFA franc BEAC','1.000','XAF'),(160,'Silver','1.000','XAG'),(161,'Gold','1.000','XAU'),(162,'European Composite Unit','1.000','XBA'),(163,'European Monetary Unit','1.000','XBB'),(164,'European Unit of Account 9','1.000','XBC'),(165,'European Unit of Account 17','1.000','XBD'),(166,'East Caribbean dollar','1.000','XCD'),(167,'Special Drawing Rights','1.000','XDR'),(168,'UIC franc','1.000','XFU'),(169,'CFA Franc BCEAO','1.000','XOF'),(170,'Palladium','1.000','XPD'),(171,'CFP franc','1.000','XPF'),(172,'Platinum','1.000','XPT'),(173,'Code reserved for testing purposes','1.000','XTS'),(174,'No currency','1.000','XXX'),(175,'Yemeni rial','1.000','YER'),(176,'South African rand','1.000','ZAR'),(177,'Kwacha','1.000','ZMK'),(178,'Zimbabwe dollar','1.000','ZWD');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_perf_history`
--

DROP TABLE IF EXISTS `cust_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_perf_history` (
  `customer_id` int(11) NOT NULL,
  `loan_cycle_counter` smallint(6) DEFAULT NULL,
  `last_loan_amnt` decimal(21,4) DEFAULT NULL,
  `active_loans_count` smallint(6) DEFAULT NULL,
  `total_savings_amnt` decimal(21,4) DEFAULT NULL,
  `delinquint_portfolio` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `cust_perf_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_perf_history`
--

LOCK TABLES `cust_perf_history` WRITE;
/*!40000 ALTER TABLE `cust_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cust_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_definition`
--

DROP TABLE IF EXISTS `custom_field_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_definition` (
  `field_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `entity_id` smallint(6) NOT NULL,
  `level_id` smallint(6) DEFAULT NULL,
  `field_type` smallint(6) DEFAULT NULL,
  `entity_type` smallint(6) NOT NULL,
  `mandatory_flag` smallint(6) NOT NULL,
  `default_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  KEY `level_id` (`level_id`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  CONSTRAINT `custom_field_definition_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `customer_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `custom_field_definition_ibfk_2` FOREIGN KEY (`entity_id`) REFERENCES `lookup_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `custom_field_definition_ibfk_3` FOREIGN KEY (`entity_type`) REFERENCES `entity_master` (`entity_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_definition`
--

LOCK TABLES `custom_field_definition` WRITE;
/*!40000 ALTER TABLE `custom_field_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_level_id` smallint(6) NOT NULL,
  `global_cust_num` varchar(100) DEFAULT NULL,
  `loan_officer_id` smallint(6) DEFAULT NULL,
  `customer_formedby_id` smallint(6) DEFAULT NULL,
  `status_id` smallint(6) DEFAULT NULL,
  `branch_id` smallint(6) DEFAULT NULL,
  `display_name` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `second_last_name` varchar(200) DEFAULT NULL,
  `display_address` varchar(500) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `group_flag` smallint(6) DEFAULT NULL,
  `trained` smallint(6) DEFAULT NULL,
  `trained_date` date DEFAULT NULL,
  `parent_customer_id` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `search_id` varchar(100) DEFAULT NULL,
  `max_child_count` int(11) DEFAULT NULL,
  `ho_updated` smallint(6) DEFAULT NULL,
  `client_confidential` smallint(6) DEFAULT NULL,
  `mfi_joining_date` date DEFAULT NULL,
  `government_id` varchar(50) DEFAULT NULL,
  `customer_activation_date` date DEFAULT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `blacklisted` smallint(6) DEFAULT NULL,
  `discriminator` varchar(20) DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `cust_global_idx` (`global_cust_num`),
  KEY `status_id` (`status_id`),
  KEY `customer_formedby_id` (`customer_formedby_id`),
  KEY `parent_customer_id` (`parent_customer_id`),
  KEY `cust_search_idx` (`search_id`),
  KEY `cust_government_idx` (`government_id`),
  KEY `cust_lo_idx` (`loan_officer_id`,`branch_id`),
  KEY `customer_lo_name_idx` (`loan_officer_id`,`customer_level_id`,`display_name`(15),`first_name`(15),`last_name`(15),`second_last_name`(15)),
  KEY `customer_name_idx` (`customer_level_id`,`first_name`(15),`last_name`(15),`second_last_name`(15)),
  KEY `customer_branch_search_idx` (`branch_id`,`search_id`),
  KEY `customer_dob_status_idx` (`date_of_birth`,`status_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_level_id`) REFERENCES `customer_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `customer_state` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`branch_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_ibfk_4` FOREIGN KEY (`loan_officer_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_ibfk_5` FOREIGN KEY (`customer_formedby_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_ibfk_6` FOREIGN KEY (`parent_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,3,'0003-000000001',3,NULL,13,3,'center dw1',NULL,NULL,NULL,NULL,'well no center',NULL,NULL,0,NULL,NULL,'2010-07-01','2010-08-07','1.1',4,NULL,NULL,'2010-06-01',NULL,'2010-07-01',1,1,0,'CENTER',6),(2,2,'0003-000000002',3,3,9,3,'group dw1 1',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,1,'2010-07-02','2010-08-04','1.1.1',9,NULL,NULL,'2010-07-02',NULL,'2010-07-02',1,1,0,'GROUP',18),(3,1,'0003-000000003',3,3,3,3,'client dw1 1 1 zeppelin','client dw1 1 1','zeppelin','',NULL,'','1987-08-08',1,0,NULL,5,'2010-07-02','2010-07-21','1.1.2.3',0,NULL,NULL,'2010-07-02','','2010-07-02',1,1,0,'CLIENT',5),(4,1,'0003-000000004',3,3,3,3,'client dw1 1 2 another','client dw1 1 2','another','',NULL,'','1976-04-04',1,0,NULL,2,'2010-07-02','2010-07-02','1.1.1.2',0,NULL,NULL,'2010-07-02','','2010-07-02',1,1,0,'CLIENT',4),(5,2,'0003-000000005',3,3,9,3,'group dw1 2',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,1,'2010-07-02','2010-08-04','1.1.2',6,NULL,NULL,'2010-07-02',NULL,'2010-07-03',1,1,0,'GROUP',9),(6,1,'0003-000000006',3,3,3,3,'client dw1 2 1 xxx','client dw1 2 1','xxx','',NULL,'','1987-07-07',1,0,NULL,5,'2010-07-03','2010-07-03','1.1.2.1',0,NULL,NULL,'2010-07-03','','2010-07-03',1,1,0,'CLIENT',4),(7,1,'0003-000000007',3,3,3,3,'client dw1 2 2 xxx','client dw1 2 2','xxx','',NULL,'','1977-08-08',1,0,NULL,5,'2010-07-03','2010-07-03','1.1.2.2',0,NULL,NULL,'2010-07-03','','2010-07-03',1,1,0,'CLIENT',4),(8,2,'0003-000000008',3,4,9,3,'group dw1 3',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,1,'2010-07-05','2010-08-04','1.1.3',1,NULL,NULL,'2010-07-05',NULL,'2010-07-05',1,1,0,'GROUP',4),(9,1,'0003-000000009',3,3,3,3,'client dw1 3 1 xxx','client dw1 3 1','xxx','',NULL,'','1976-07-08',1,0,NULL,8,'2010-07-05','2010-07-05','1.1.3.1',0,NULL,NULL,'2010-07-05','','2010-07-05',1,1,0,'CLIENT',4),(10,1,'0003-000000010',4,4,3,3,'br1 no group memb 1 xxx','br1 no group memb 1','xxx','',NULL,'','1987-07-03',0,0,NULL,NULL,'2010-07-18','2010-07-18','1.2',0,NULL,NULL,'2010-07-18','','2010-07-18',1,1,0,'CLIENT',3),(11,3,'0004-000000011',5,NULL,13,4,'br2 center 1',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-20',NULL,'1.1',2,NULL,NULL,'2010-06-20',NULL,'2010-07-20',1,NULL,0,'CENTER',4),(12,2,'0004-000000012',5,5,9,4,'br2 group 1',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,11,'2010-07-20','2010-08-04','1.1.1',3,NULL,NULL,'2010-07-20',NULL,'2010-07-20',1,1,0,'GROUP',6),(13,1,'0004-000000013',5,5,3,4,'br2 client 1 xxx','br2 client 1','xxx','',NULL,'','1988-12-12',1,0,NULL,12,'2010-07-20','2010-07-20','1.1.1.1',0,NULL,NULL,'2010-07-20','','2010-07-20',1,1,0,'CLIENT',4),(14,1,'0004-000000014',5,5,3,4,'br2 client 2 xxx','br2 client 2','xxx','',NULL,'','1967-09-09',1,0,NULL,12,'2010-07-20','2010-07-21','1.1.1.2',0,NULL,NULL,'2010-07-20','xxx','2010-07-21',1,1,0,'CLIENT',4),(15,2,'0004-000000015',5,5,9,4,'br2 group 2',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,11,'2010-07-20','2010-08-04','1.1.2',0,NULL,NULL,'2010-07-20',NULL,'2010-07-21',1,1,0,'GROUP',3),(16,1,'0003-000000016',3,3,3,3,'xfer to gr in center (if on same day) xxx','xfer to gr in center (if on same day)','xxx','',NULL,'','2009-07-06',1,0,NULL,5,'2010-07-21','2010-07-21','1.1.2.4',0,NULL,NULL,'2010-07-21','','2010-07-21',1,1,0,'CLIENT',6),(17,1,'0003-000000017',3,3,3,3,'xfer to gr in center xxx','xfer to gr in center','xxx','',NULL,'','2009-07-03',1,0,NULL,5,'2010-07-21','2010-07-22','1.1.2.5',0,NULL,NULL,'2010-07-21','','2010-07-21',1,1,0,'CLIENT',5),(18,1,'0003-000000018',3,3,3,3,'lose group membership xxx','lose group membership','xxx','',NULL,'','1976-09-09',1,0,NULL,2,'2010-07-22','2010-08-01','1.1.1.9',0,NULL,NULL,'2010-07-22','','2010-07-22',1,1,0,'CLIENT',11),(19,3,'0003-000000019',4,NULL,13,3,'center 2',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-22','2010-08-10','1.3',5,NULL,NULL,'2010-07-22',NULL,'2010-07-22',1,1,0,'CENTER',7),(20,2,'0003-000000020',4,4,9,3,'group 1 for center 2',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,19,'2010-07-22','2010-08-04','1.3.1',1,NULL,NULL,'2010-07-22',NULL,'2010-07-22',1,1,0,'GROUP',4),(21,2,'0003-000000021',4,4,9,3,'group 2 for center 2',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,19,'2010-07-22','2010-08-04','1.3.2',0,NULL,NULL,'2010-07-22',NULL,'2010-07-22',1,1,0,'GROUP',3),(22,2,'0003-000000022',6,3,9,3,'group 3 for switch LOs',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,19,'2010-07-22','2010-08-04','1.3.3',0,NULL,NULL,'2010-07-22',NULL,'2010-07-22',1,1,0,'GROUP',5),(23,1,'0003-000000023',4,3,3,3,'xfer to gr in same branch xxx','xfer to gr in same branch','xxx','',NULL,'','1988-03-03',1,0,NULL,20,'2010-07-22','2010-07-23','1.3.1.1',0,NULL,NULL,'2010-07-22','','2010-07-22',1,1,0,'CLIENT',5),(24,1,'0003-000000024',5,3,3,4,'xfer to gr in different branch xxx','xfer to gr in different branch','xxx','',NULL,'','1977-08-08',1,0,NULL,12,'2010-07-22','2010-07-24','1.1.1.3',0,NULL,NULL,'2010-07-22','','2010-07-22',1,1,0,'CLIENT',5),(25,3,'0003-000000025',3,NULL,13,3,'center 3',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-25',NULL,'1.4',2,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,NULL,0,'CENTER',4),(26,2,'0003-000000026',3,3,9,3,'BO1 group 1 toh',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-25','2010-08-04','1.5',0,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,1,0,'GROUP',3),(27,2,'0003-000000027',4,3,9,3,'BO1 group 2 toh',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-25','2010-08-04','1.6',0,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,1,0,'GROUP',3),(28,1,'0003-000000028',3,4,3,3,'client w/o group mem xxx','client w/o group mem','xxx','',NULL,'','1977-08-08',0,0,NULL,NULL,'2010-07-25','2010-07-25','1.7',0,NULL,NULL,'2010-07-25','','2010-07-25',1,1,0,'CLIENT',3),(29,2,'0004-000000029',5,5,9,4,'group w/o center hierarchy',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-25','2010-08-04','1.2',1,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,1,0,'GROUP',4),(30,1,'0004-000000030',5,5,3,4,'client of group w/o center xxx','client of group w/o center','xxx','',NULL,'','1877-08-08',1,0,NULL,29,'2010-07-25','2010-07-25','1.2.1',0,NULL,NULL,'2010-07-25','xxxzzzzzzzzzz','2010-07-25',1,1,0,'CLIENT',4),(31,3,'0004-000000031',5,NULL,13,4,'center with savings a/c',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-25','2010-08-10','1.3',1,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,1,0,'CENTER',3),(32,3,'0003-000000032',6,NULL,13,3,'center with a LO change',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-25','2010-07-29','1.8',1,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,1,0,'CENTER',7),(33,2,'0003-000000033',6,3,9,3,'group for center LO change',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,32,'2010-07-25','2010-08-04','1.8.1',1,NULL,NULL,'2010-07-25',NULL,'2010-07-25',1,1,0,'GROUP',4),(34,1,'0003-000000034',6,3,3,3,'client for center LO change xxx','client for center LO change','xxx','',NULL,'','1977-07-07',1,0,NULL,33,'2010-07-25','2010-07-25','1.8.1.1',0,NULL,NULL,'2010-07-25','','2010-07-25',1,1,0,'CLIENT',4),(35,2,'0003-000000035',3,3,9,3,'group move out of center?',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,25,'2010-07-29','2010-08-04','1.4.1',1,NULL,NULL,'2010-07-29',NULL,'2010-07-29',1,1,0,'GROUP',4),(36,1,'0003-000000036',3,3,3,3,'client group move out of center? xxx','client group move out of center?','xxx','',NULL,'','2006-08-08',1,0,NULL,35,'2010-07-29','2010-07-29','1.4.1.1',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',4),(37,2,'0003-000000037',4,3,9,3,'group standalone',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,19,'2010-07-29','2010-08-04','1.3.4',1,NULL,NULL,'2010-07-29',NULL,'2010-07-29',1,1,0,'GROUP',5),(38,1,'0003-000000038',4,3,3,3,'client group standalone xxx','client group standalone','xxx','',NULL,'','1988-08-08',1,0,NULL,37,'2010-07-29','2010-07-29','1.3.4.1',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',5),(39,2,'0003-000000039',NULL,3,10,3,'group xfer another branch',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-29','2010-08-04','1.4',1,NULL,NULL,'2010-07-29',NULL,'2010-07-29',1,1,0,'GROUP',5),(40,1,'0003-000000040',NULL,3,4,4,'client xfer to another branch xxx','client xfer to another branch','xxx','',NULL,'','1988-09-09',1,0,NULL,39,'2010-07-29','2010-07-29','1.4.1',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',5),(41,2,'0003-000000041',3,3,8,3,'can I take this off',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-29',NULL,'1.9',0,NULL,NULL,'2010-07-29',NULL,NULL,1,NULL,0,'GROUP',2),(42,2,'0003-000000042',4,3,9,3,'group w/o center hier LO change',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-29','2010-08-04','1.10',1,NULL,NULL,'2010-07-29',NULL,'2010-07-29',1,1,0,'GROUP',5),(43,1,'0003-000000043',4,3,3,3,'client for group w/o center hier LO change xxx','client for group w/o center hier LO change ','xxx','',NULL,'','1955-07-07',1,0,NULL,42,'2010-07-29','2010-07-29','1.10.1',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',4),(44,1,'0003-000000044',4,3,3,3,'client w/o grp memb hier LO change xxx','client w/o grp memb hier LO change ','xxx','',NULL,'','1988-08-08',0,0,NULL,NULL,'2010-07-29','2010-07-29','1.11',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',4),(45,1,'0003-000000045',NULL,3,4,4,'client w/o gr memb xfer to branch xxx','client w/o gr memb xfer to branch','xxx','',NULL,'','1988-08-08',0,0,NULL,NULL,'2010-07-29','2010-07-31','1.4',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',4),(46,2,'0003-000000046',NULL,3,10,4,'group w/o center hier xfer branch',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-29','2010-08-04','1.5',1,NULL,NULL,'2010-07-29',NULL,'2010-07-29',1,1,0,'GROUP',5),(47,1,'0003-000000047',NULL,3,4,4,'client of group w/o center hier xfer branch xxx','client of group w/o center hier xfer branch ','xxx','',NULL,'','1990-04-04',1,0,NULL,46,'2010-07-29','2010-07-31','1.5.1',0,NULL,NULL,'2010-07-29','','2010-07-29',1,1,0,'CLIENT',5),(48,2,'0003-000000048',3,3,9,3,'group to be added back into center hierarchy',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-07-31','2010-08-04','1.12',0,NULL,NULL,'2010-07-31',NULL,'2010-07-31',1,1,0,'GROUP',3),(49,2,'0003-000000049',3,3,9,3,'group whatever',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-08-01','2010-08-04','1.13',2,NULL,NULL,'2010-08-01',NULL,'2010-08-01',1,1,0,'GROUP',5),(50,1,'0003-000000050',6,3,3,3,'client remove group membership xxx','client remove group membership','xxx','',NULL,'','1990-05-07',0,0,NULL,NULL,'2010-08-01','2010-08-04','1.16',0,NULL,NULL,'2010-08-01','','2010-08-01',1,1,0,'CLIENT',5),(51,1,'0003-000000051',3,3,3,3,'client add back to group hierarchy after xxx','client add back to group hierarchy after','xxx','',NULL,'','1988-08-08',1,0,NULL,5,'2010-08-01','2010-08-03','1.1.2.6',0,NULL,NULL,'2010-08-01','','2010-08-01',1,1,0,'CLIENT',6),(52,2,'0003-000000052',3,6,9,3,'group going back to a center hier',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,1,'2010-08-01','2010-08-07','1.1.4',0,NULL,NULL,'2010-08-01',NULL,'2010-08-01',1,1,0,'GROUP',4),(53,2,'0003-000000053',3,3,9,3,'generic group',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-08-04','2010-08-06','1.16',1,NULL,NULL,'2010-08-04',NULL,'2010-08-04',1,1,0,'GROUP',5),(54,1,'0003-000000054',6,3,3,3,'remove group membership xxx','remove group membership','xxx','',NULL,'','1990-06-07',0,0,NULL,NULL,'2010-08-04','2010-08-06','1.17',0,NULL,NULL,'2010-08-04','','2010-08-04',1,1,0,'CLIENT',5),(55,3,'0003-000000055',3,NULL,13,3,'center change to diff branch',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-08-07','2010-08-10','1.18',3,NULL,NULL,'2010-08-07',NULL,'2010-08-07',1,1,0,'CENTER',5),(56,2,'0003-000000056',4,3,9,3,'group for change to center in same branch',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,19,'2010-08-07','2010-08-10','1.3.5',0,NULL,NULL,'2010-08-07',NULL,'2010-08-07',1,1,0,'GROUP',8),(57,2,'0003-000000057',5,3,10,4,'group for change to center in diff branch',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,31,'2010-08-07','2010-08-10','1.3.1',0,NULL,NULL,'2010-08-07',NULL,'2010-08-07',1,1,0,'GROUP',4),(58,2,'0003-000000058',3,3,9,3,'group redo loans',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,25,'2010-08-20','2010-08-20','1.4.2',1,NULL,NULL,'2010-08-20',NULL,'2010-08-20',1,1,0,'GROUP',4),(59,1,'0003-000000059',3,3,3,3,'client redo loans xxx','client redo loans','xxx','',NULL,'','1990-08-08',1,0,NULL,58,'2010-08-20','2010-08-20','1.4.2.1',0,NULL,NULL,'2010-08-20','','2010-08-20',1,1,0,'CLIENT',4),(60,3,'0006-000000060',7,NULL,13,6,'Fee and Charge Testing Center',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-08-27',NULL,'1.1',1,NULL,NULL,'2010-08-27',NULL,'2010-08-27',1,NULL,0,'CENTER',3),(61,3,'0006-000000061',7,NULL,13,6,'any old center with a periodic center fee',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-08-27',NULL,'1.2',0,NULL,NULL,'2010-08-27',NULL,'2010-08-27',1,NULL,0,'CENTER',2),(62,2,'0006-000000062',7,7,9,6,'Group with lots of fees',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,60,'2010-08-27','2010-08-27','1.1.1',1,NULL,NULL,'2010-08-27',NULL,'2010-08-27',1,1,0,'GROUP',4),(63,1,'0006-000000063',7,7,3,6,'client charge anyone xxx','client charge anyone','xxx','',NULL,'','1977-08-08',1,0,NULL,62,'2010-08-27','2010-08-27','1.1.1.1',0,NULL,NULL,'2010-08-27','','2010-08-27',1,1,0,'CLIENT',4),(64,3,'0006-000000064',7,NULL,13,6,'center loan fees',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,NULL,'2010-08-28',NULL,'1.3',1,NULL,NULL,'2010-08-28',NULL,'2010-08-28',1,NULL,0,'CENTER',3),(65,2,'0006-000000065',7,7,9,6,'group for loan fees',NULL,NULL,NULL,NULL,'',NULL,NULL,0,NULL,64,'2010-08-28','2010-08-28','1.3.1',0,NULL,NULL,'2010-08-28',NULL,'2010-08-28',1,1,0,'GROUP',3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account`
--

DROP TABLE IF EXISTS `customer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account` (
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  CONSTRAINT `customer_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account`
--

LOCK TABLES `customer_account` WRITE;
/*!40000 ALTER TABLE `customer_account` DISABLE KEYS */;
INSERT INTO `customer_account` VALUES (1),(2),(3),(5),(9),(10),(12),(18),(19),(22),(25),(26),(27),(28),(29),(33),(35),(37),(39),(40),(41),(42),(43),(45),(48),(49),(50),(51),(54),(57),(60),(62),(63),(65),(68),(69),(70),(71),(72),(73),(74),(75),(77),(79),(81),(83),(85),(87),(89),(90),(92),(94),(96),(97),(98),(99),(101),(103),(104),(105),(106),(107),(108),(110),(111);
/*!40000 ALTER TABLE `customer_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_account_activity`
--

DROP TABLE IF EXISTS `customer_account_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_account_activity` (
  `customer_account_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` decimal(21,4) DEFAULT NULL,
  `fee_amount_currency_id` smallint(6) DEFAULT NULL,
  `created_date` date NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`customer_account_activity_id`),
  KEY `account_id` (`account_id`),
  KEY `fee_amount_currency_id` (`fee_amount_currency_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `customer_account_activity_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_account_activity_ibfk_2` FOREIGN KEY (`fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_account_activity_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_account_activity`
--

LOCK TABLES `customer_account_activity` WRITE;
/*!40000 ALTER TABLE `customer_account_activity` DISABLE KEYS */;
INSERT INTO `customer_account_activity` VALUES (1,106,'Payment rcvd.','10.0000',2,'2010-08-27',1),(2,107,'Payment rcvd.','90.0000',2,'2010-08-27',1),(3,107,'Amnt waived','60.0000',2,'2010-08-27',1),(4,107,'Amnt Adjusted','90.0000',2,'2010-08-27',1),(5,107,'Misc fees applied','2.0000',2,'2010-08-27',1),(6,107,'Misc penalty applied','4.0000',2,'2010-08-27',1),(7,107,'Group Fee One Time Upfront 30 applied','33.0000',2,'2010-08-27',1),(8,107,'Payment rcvd.','129.0000',2,'2010-08-27',1);
/*!40000 ALTER TABLE `customer_account_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address_detail`
--

DROP TABLE IF EXISTS `customer_address_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address_detail` (
  `customer_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `locale_id` smallint(6) DEFAULT NULL,
  `address_name` varchar(100) DEFAULT NULL,
  `line_1` varchar(200) DEFAULT NULL,
  `line_2` varchar(200) DEFAULT NULL,
  `line_3` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `address_status` smallint(6) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_address_id`),
  KEY `locale_id` (`locale_id`),
  KEY `cust_address_idx` (`customer_id`),
  CONSTRAINT `customer_address_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_address_detail_ibfk_2` FOREIGN KEY (`locale_id`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_detail`
--

LOCK TABLES `customer_address_detail` WRITE;
/*!40000 ALTER TABLE `customer_address_detail` DISABLE KEYS */;
INSERT INTO `customer_address_detail` VALUES (1,1,NULL,NULL,'center road','','','','','','',NULL,''),(2,2,NULL,NULL,'','','','','','','',NULL,''),(3,3,NULL,NULL,'','','','','','','',NULL,''),(4,4,NULL,NULL,'','','','','','','',NULL,''),(5,5,NULL,NULL,'','','','','','','',NULL,''),(6,6,NULL,NULL,'','','','','','','',NULL,''),(7,7,NULL,NULL,'','','','','','','',NULL,''),(8,8,NULL,NULL,'','','','','','','',NULL,''),(9,9,NULL,NULL,'','','','','','','',NULL,''),(10,10,NULL,NULL,'','','','','','','',NULL,''),(11,11,NULL,NULL,'','','','','','','',NULL,''),(12,12,NULL,NULL,'','','','','','','',NULL,''),(13,13,NULL,NULL,'','','','','','','',NULL,''),(14,14,NULL,NULL,'','','','','','','',NULL,''),(15,15,NULL,NULL,'','','','','','','',NULL,''),(16,16,NULL,NULL,'','','','','','','',NULL,''),(17,17,NULL,NULL,'','','','','','','',NULL,''),(18,18,NULL,NULL,'','','','','','','',NULL,''),(19,19,NULL,NULL,'','','','','','','',NULL,''),(20,20,NULL,NULL,'','','','','','','',NULL,''),(21,21,NULL,NULL,'','','','','','','',NULL,''),(22,22,NULL,NULL,'','','','','','','',NULL,''),(23,23,NULL,NULL,'','','','','','','',NULL,''),(24,24,NULL,NULL,'','','','','','','',NULL,''),(25,25,NULL,NULL,'','','','','','','',NULL,''),(26,26,NULL,NULL,'','','','','','','',NULL,''),(27,27,NULL,NULL,'','','','','','','',NULL,''),(28,28,NULL,NULL,'','','','','','','',NULL,''),(29,29,NULL,NULL,'','','','','','','',NULL,''),(30,30,NULL,NULL,'','','','','','','',NULL,''),(31,31,NULL,NULL,'','','','','','','',NULL,''),(32,32,NULL,NULL,'','','','','','','',NULL,''),(33,33,NULL,NULL,'','','','','','','',NULL,''),(34,34,NULL,NULL,'','','','','','','',NULL,''),(35,35,NULL,NULL,'','','','','','','',NULL,''),(36,36,NULL,NULL,'','','','','','','',NULL,''),(37,37,NULL,NULL,'','','','','','','',NULL,''),(38,38,NULL,NULL,'','','','','','','',NULL,''),(39,39,NULL,NULL,'','','','','','','',NULL,''),(40,40,NULL,NULL,'','','','','','','',NULL,''),(41,41,NULL,NULL,'','','','','','','',NULL,''),(42,42,NULL,NULL,'','','','','','','',NULL,''),(43,43,NULL,NULL,'','','','','','','',NULL,''),(44,44,NULL,NULL,'','','','','','','',NULL,''),(45,45,NULL,NULL,'','','','','','','',NULL,''),(46,46,NULL,NULL,'','','','','','','',NULL,''),(47,47,NULL,NULL,'','','','','','','',NULL,''),(48,48,NULL,NULL,'','','','','','','',NULL,''),(49,49,NULL,NULL,'','','','','','','',NULL,''),(50,50,NULL,NULL,'','','','','','','',NULL,''),(51,51,NULL,NULL,'','','','','','','',NULL,''),(52,52,NULL,NULL,'','','','','','','',NULL,''),(53,53,NULL,NULL,'','','','','','','',NULL,''),(54,54,NULL,NULL,'','','','','','','',NULL,''),(55,55,NULL,NULL,'','','','','','','',NULL,''),(56,56,NULL,NULL,'','','','','','','',NULL,''),(57,57,NULL,NULL,'','','','','','','',NULL,''),(58,58,NULL,NULL,'','','','','','','',NULL,''),(59,59,NULL,NULL,'','','','','','','',NULL,''),(60,60,NULL,NULL,'','','','','','','',NULL,''),(61,61,NULL,NULL,'','','','','','','',NULL,''),(62,62,NULL,NULL,'','','','','','','',NULL,''),(63,63,NULL,NULL,'','','','','','','',NULL,''),(64,64,NULL,NULL,'','','','','','','',NULL,''),(65,65,NULL,NULL,'','','','','','','',NULL,'');
/*!40000 ALTER TABLE `customer_address_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_attendance`
--

DROP TABLE IF EXISTS `customer_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `attendance` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_attendance_meeting_date_idx` (`meeting_date`,`customer_id`),
  CONSTRAINT `customer_attendance_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_attendance`
--

LOCK TABLES `customer_attendance` WRITE;
/*!40000 ALTER TABLE `customer_attendance` DISABLE KEYS */;
INSERT INTO `customer_attendance` VALUES (1,'2010-08-27',63,1);
/*!40000 ALTER TABLE `customer_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_attendance_types`
--

DROP TABLE IF EXISTS `customer_attendance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_attendance_types` (
  `attendance_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `attendance_lookup_id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `attendance_lookup_id` (`attendance_lookup_id`),
  CONSTRAINT `customer_attendance_types_ibfk_1` FOREIGN KEY (`attendance_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_attendance_types`
--

LOCK TABLES `customer_attendance_types` WRITE;
/*!40000 ALTER TABLE `customer_attendance_types` DISABLE KEYS */;
INSERT INTO `customer_attendance_types` VALUES (1,194,'Present'),(2,195,'Absent'),(3,196,'Approved leave'),(4,197,'Late');
/*!40000 ALTER TABLE `customer_attendance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_checklist`
--

DROP TABLE IF EXISTS `customer_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_checklist` (
  `checklist_id` smallint(6) NOT NULL,
  `level_id` smallint(6) NOT NULL,
  `customer_status_id` smallint(6) NOT NULL,
  PRIMARY KEY (`checklist_id`),
  KEY `level_id` (`level_id`),
  KEY `customer_status_id` (`customer_status_id`),
  CONSTRAINT `customer_checklist_ibfk_1` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`checklist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_checklist_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `customer_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_checklist_ibfk_3` FOREIGN KEY (`customer_status_id`) REFERENCES `customer_state` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_checklist`
--

LOCK TABLES `customer_checklist` WRITE;
/*!40000 ALTER TABLE `customer_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_custom_field`
--

DROP TABLE IF EXISTS `customer_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_custom_field` (
  `customer_customfield_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `field_id` smallint(6) NOT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customer_customfield_id`),
  KEY `field_id` (`field_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_custom_field_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `custom_field_definition` (`field_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_custom_field_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_custom_field`
--

LOCK TABLES `customer_custom_field` WRITE;
/*!40000 ALTER TABLE `customer_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_detail`
--

DROP TABLE IF EXISTS `customer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_detail` (
  `customer_id` int(11) NOT NULL,
  `ethinicity` int(11) DEFAULT NULL,
  `citizenship` int(11) DEFAULT NULL,
  `handicapped` int(11) DEFAULT NULL,
  `business_activities` int(11) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `education_level` int(11) DEFAULT NULL,
  `num_children` smallint(6) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `handicapped_details` varchar(200) DEFAULT NULL,
  `poverty_status` int(11) DEFAULT NULL,
  `poverty_lhood_pct` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `citizenship` (`citizenship`),
  KEY `education_level` (`education_level`),
  KEY `ethinicity` (`ethinicity`),
  KEY `handicapped` (`handicapped`),
  KEY `marital_status` (`marital_status`),
  KEY `poverty_status` (`poverty_status`),
  CONSTRAINT `customer_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_detail_ibfk_2` FOREIGN KEY (`citizenship`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_detail_ibfk_3` FOREIGN KEY (`education_level`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_detail_ibfk_4` FOREIGN KEY (`ethinicity`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_detail_ibfk_5` FOREIGN KEY (`handicapped`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_detail_ibfk_6` FOREIGN KEY (`marital_status`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_detail_ibfk_7` FOREIGN KEY (`poverty_status`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_detail`
--

LOCK TABLES `customer_detail` WRITE;
/*!40000 ALTER TABLE `customer_detail` DISABLE KEYS */;
INSERT INTO `customer_detail` VALUES (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL),(14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL),(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,43,NULL),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,41,NULL),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL),(44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,42,NULL),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(59,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,41,NULL),(63,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,42,NULL);
/*!40000 ALTER TABLE `customer_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_family_detail`
--

DROP TABLE IF EXISTS `customer_family_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_family_detail` (
  `customer_family_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `customer_name_id` int(11) DEFAULT NULL,
  `relationship` smallint(6) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `living_status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`customer_family_id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_name_id` (`customer_name_id`),
  CONSTRAINT `customer_family_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_family_detail_ibfk_2` FOREIGN KEY (`customer_name_id`) REFERENCES `customer_name_detail` (`customer_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_family_detail`
--

LOCK TABLES `customer_family_detail` WRITE;
/*!40000 ALTER TABLE `customer_family_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_family_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_fee_schedule`
--

DROP TABLE IF EXISTS `customer_fee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_fee_schedule` (
  `account_fees_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `installment_id` int(11) NOT NULL,
  `fee_id` smallint(6) NOT NULL,
  `account_fee_id` int(11) NOT NULL,
  `amount` decimal(21,4) DEFAULT NULL,
  `amount_currency_id` smallint(6) DEFAULT NULL,
  `amount_paid` decimal(21,4) DEFAULT NULL,
  `amount_paid_currency_id` smallint(6) DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`account_fees_detail_id`),
  KEY `id` (`id`),
  KEY `amount_currency_id` (`amount_currency_id`),
  KEY `amount_paid_currency_id` (`amount_paid_currency_id`),
  KEY `fee_id` (`fee_id`),
  KEY `account_fee_id` (`account_fee_id`),
  CONSTRAINT `customer_fee_schedule_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer_schedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_fee_schedule_ibfk_2` FOREIGN KEY (`amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_fee_schedule_ibfk_3` FOREIGN KEY (`amount_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_fee_schedule_ibfk_4` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`),
  CONSTRAINT `customer_fee_schedule_ibfk_5` FOREIGN KEY (`account_fee_id`) REFERENCES `account_fees` (`account_fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_fee_schedule`
--

LOCK TABLES `customer_fee_schedule` WRITE;
/*!40000 ALTER TABLE `customer_fee_schedule` DISABLE KEYS */;
INSERT INTO `customer_fee_schedule` VALUES (1,591,1,1,1,'10.0000',2,'10.0000',2,1),(2,592,2,1,1,'10.0000',2,'0.0000',2,0),(3,593,3,1,1,'10.0000',2,'0.0000',2,0),(4,594,4,1,1,'10.0000',2,'0.0000',2,0),(5,595,5,1,1,'10.0000',2,'0.0000',2,0),(6,596,6,1,1,'10.0000',2,'0.0000',2,0),(7,597,7,1,1,'10.0000',2,'0.0000',2,0),(8,598,8,1,1,'10.0000',2,'0.0000',2,0),(9,599,9,1,1,'10.0000',2,'0.0000',2,0),(10,600,10,1,1,'10.0000',2,'0.0000',2,0),(11,601,1,2,4,'20.0000',2,'20.0000',2,3),(12,601,1,3,3,'30.0000',2,'30.0000',2,3),(13,601,1,4,2,'40.0000',2,'40.0000',2,3),(14,602,2,4,2,'0.0000',2,'0.0000',2,1),(15,602,2,2,4,'0.0000',2,'0.0000',2,1),(16,603,3,2,4,'20.0000',2,'0.0000',2,0),(17,603,3,4,2,'40.0000',2,'0.0000',2,0),(18,604,4,2,4,'20.0000',2,'0.0000',2,0),(19,604,4,4,2,'40.0000',2,'0.0000',2,0),(20,605,5,2,4,'20.0000',2,'0.0000',2,0),(21,605,5,4,2,'40.0000',2,'0.0000',2,0),(22,606,6,4,2,'40.0000',2,'0.0000',2,0),(23,606,6,2,4,'20.0000',2,'0.0000',2,0),(24,607,7,2,4,'20.0000',2,'0.0000',2,0),(25,607,7,4,2,'40.0000',2,'0.0000',2,0),(26,608,8,4,2,'40.0000',2,'0.0000',2,0),(27,608,8,2,4,'20.0000',2,'0.0000',2,0),(28,609,9,2,4,'20.0000',2,'0.0000',2,0),(29,609,9,4,2,'40.0000',2,'0.0000',2,0),(30,610,10,2,4,'20.0000',2,'0.0000',2,0),(31,610,10,4,2,'40.0000',2,'0.0000',2,0),(32,601,1,3,5,'33.0000',2,'33.0000',2,1),(33,631,1,4,6,'40.0000',2,'0.0000',2,0),(34,632,2,4,6,'40.0000',2,'0.0000',2,0),(35,633,3,4,6,'40.0000',2,'0.0000',2,0),(36,634,4,4,6,'40.0000',2,'0.0000',2,0),(37,635,5,4,6,'40.0000',2,'0.0000',2,0),(38,636,6,4,6,'40.0000',2,'0.0000',2,0),(39,637,7,4,6,'40.0000',2,'0.0000',2,0),(40,638,8,4,6,'40.0000',2,'0.0000',2,0),(41,639,9,4,6,'40.0000',2,'0.0000',2,0),(42,640,10,4,6,'40.0000',2,'0.0000',2,0);
/*!40000 ALTER TABLE `customer_fee_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_flag_detail`
--

DROP TABLE IF EXISTS `customer_flag_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_flag_detail` (
  `customer_flag_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `flag_id` smallint(6) NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_flag_id`),
  KEY `customer_id` (`customer_id`),
  KEY `flag_id` (`flag_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `customer_flag_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_flag_detail_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `customer_state_flag` (`flag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_flag_detail_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_flag_detail`
--

LOCK TABLES `customer_flag_detail` WRITE;
/*!40000 ALTER TABLE `customer_flag_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_flag_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_hierarchy`
--

DROP TABLE IF EXISTS `customer_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_hierarchy` (
  `hierarchy_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`hierarchy_id`),
  KEY `parent_id` (`parent_id`),
  KEY `updated_by` (`updated_by`),
  KEY `cust_hierarchy_idx` (`customer_id`,`status`),
  CONSTRAINT `customer_hierarchy_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_hierarchy_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_hierarchy_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_hierarchy`
--

LOCK TABLES `customer_hierarchy` WRITE;
/*!40000 ALTER TABLE `customer_hierarchy` DISABLE KEYS */;
INSERT INTO `customer_hierarchy` VALUES (1,1,2,1,'2010-07-02',NULL,NULL,NULL),(2,2,3,0,'2010-07-02','2010-07-21',1,'2010-07-21'),(3,2,4,1,'2010-07-02',NULL,NULL,NULL),(4,1,5,1,'2010-07-03',NULL,NULL,NULL),(5,5,6,1,'2010-07-03',NULL,NULL,NULL),(6,5,7,1,'2010-07-03',NULL,NULL,NULL),(7,1,8,1,'2010-07-05',NULL,NULL,NULL),(8,8,9,1,'2010-07-05',NULL,NULL,NULL),(9,11,12,1,'2010-07-20',NULL,NULL,NULL),(10,12,13,1,'2010-07-20',NULL,NULL,NULL),(11,12,14,1,'2010-07-21',NULL,NULL,NULL),(12,11,15,1,'2010-07-21',NULL,NULL,NULL),(13,5,3,1,'2010-07-21',NULL,NULL,NULL),(14,2,16,0,'2010-07-21','2010-07-21',1,'2010-07-21'),(15,5,16,1,'2010-07-21',NULL,NULL,NULL),(16,2,17,0,'2010-07-21','2010-07-22',1,'2010-07-22'),(17,5,17,1,'2010-07-22',NULL,NULL,NULL),(18,2,18,0,'2010-07-22','2010-07-25',1,'2010-07-25'),(19,19,20,1,'2010-07-22',NULL,NULL,NULL),(20,19,21,1,'2010-07-22',NULL,NULL,NULL),(21,19,22,1,'2010-07-22',NULL,NULL,NULL),(22,2,23,0,'2010-07-22','2010-07-23',1,'2010-07-23'),(23,2,24,0,'2010-07-22','2010-07-24',1,'2010-07-24'),(24,20,23,1,'2010-07-23',NULL,NULL,NULL),(25,12,24,1,'2010-07-24',NULL,NULL,NULL),(26,2,18,0,'2010-07-25','2010-08-01',1,'2010-08-01'),(27,29,30,1,'2010-07-25',NULL,NULL,NULL),(28,32,33,1,'2010-07-25',NULL,NULL,NULL),(29,33,34,1,'2010-07-25',NULL,NULL,NULL),(30,25,35,1,'2010-07-29',NULL,NULL,NULL),(31,35,36,1,'2010-07-29',NULL,NULL,NULL),(32,37,38,1,'2010-07-29',NULL,NULL,NULL),(33,19,37,1,'2010-07-29',NULL,NULL,NULL),(34,39,40,1,'2010-07-29',NULL,NULL,NULL),(35,42,43,1,'2010-07-29',NULL,NULL,NULL),(36,46,47,1,'2010-07-29',NULL,NULL,NULL),(37,2,18,1,'2010-08-01',NULL,NULL,NULL),(38,49,50,1,'2010-08-01',NULL,NULL,NULL),(39,49,51,0,'2010-08-01','2010-08-03',1,'2010-08-03'),(40,5,51,1,'2010-08-03',NULL,NULL,NULL),(41,53,54,1,'2010-08-04',NULL,NULL,NULL),(42,1,52,1,'2010-08-07',NULL,NULL,NULL),(43,55,56,0,'2010-08-07','2010-08-10',1,'2010-08-10'),(44,55,57,0,'2010-08-07','2010-08-10',1,'2010-08-10'),(45,19,56,1,'2010-08-10',NULL,NULL,NULL),(46,31,57,1,'2010-08-10',NULL,NULL,NULL),(47,25,58,1,'2010-08-20',NULL,NULL,NULL),(48,58,59,1,'2010-08-20',NULL,NULL,NULL),(49,60,62,1,'2010-08-27',NULL,NULL,NULL),(50,62,63,1,'2010-08-27',NULL,NULL,NULL),(51,64,65,1,'2010-08-28',NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_historical_data`
--

DROP TABLE IF EXISTS `customer_historical_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_historical_data` (
  `historical_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `loan_amount` decimal(21,4) DEFAULT NULL,
  `loan_amount_currency_id` smallint(6) DEFAULT NULL,
  `total_amount_paid` decimal(21,4) DEFAULT NULL,
  `total_amount_paid_currency_id` smallint(6) DEFAULT NULL,
  `interest_paid` decimal(21,4) DEFAULT NULL,
  `interest_paid_currency_id` smallint(6) DEFAULT NULL,
  `missed_payments_count` int(11) DEFAULT NULL,
  `total_payments_count` int(11) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `loan_cycle_number` int(11) DEFAULT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`historical_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_historical_data_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_historical_data`
--

LOCK TABLES `customer_historical_data` WRITE;
/*!40000 ALTER TABLE `customer_historical_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_historical_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_level`
--

DROP TABLE IF EXISTS `customer_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_level` (
  `level_id` smallint(6) NOT NULL,
  `parent_level_id` smallint(6) DEFAULT NULL,
  `level_name_id` smallint(6) NOT NULL,
  `interaction_flag` smallint(6) DEFAULT NULL,
  `max_child_count` smallint(6) NOT NULL,
  `max_instance_count` smallint(6) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `parent_level_id` (`parent_level_id`),
  KEY `level_name_id` (`level_name_id`),
  CONSTRAINT `customer_level_ibfk_1` FOREIGN KEY (`parent_level_id`) REFERENCES `customer_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_level_ibfk_2` FOREIGN KEY (`level_name_id`) REFERENCES `lookup_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_level`
--

LOCK TABLES `customer_level` WRITE;
/*!40000 ALTER TABLE `customer_level` DISABLE KEYS */;
INSERT INTO `customer_level` VALUES (1,2,13,NULL,1,30),(2,3,12,NULL,2,12),(3,NULL,11,NULL,4,10);
/*!40000 ALTER TABLE `customer_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_loan_account_detail`
--

DROP TABLE IF EXISTS `customer_loan_account_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_loan_account_detail` (
  `account_trxn_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `installment_number` smallint(6) NOT NULL,
  `due_date` date NOT NULL,
  `principal` decimal(21,4) NOT NULL,
  `principal_currency_id` smallint(6) NOT NULL,
  `interest` decimal(21,4) NOT NULL,
  `interest_currency_id` smallint(6) NOT NULL,
  `penalty` decimal(21,4) NOT NULL,
  `penalty_currency_id` smallint(6) NOT NULL,
  KEY `account_trxn_id` (`account_trxn_id`),
  KEY `currency_id` (`currency_id`),
  KEY `principal_currency_id` (`principal_currency_id`),
  KEY `interest_currency_id` (`interest_currency_id`),
  KEY `penalty_currency_id` (`penalty_currency_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `customer_loan_account_detail_ibfk_1` FOREIGN KEY (`account_trxn_id`) REFERENCES `account_trxn` (`account_trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_loan_account_detail_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_loan_account_detail_ibfk_3` FOREIGN KEY (`principal_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_loan_account_detail_ibfk_4` FOREIGN KEY (`interest_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_loan_account_detail_ibfk_5` FOREIGN KEY (`penalty_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_loan_account_detail_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_loan_account_detail`
--

LOCK TABLES `customer_loan_account_detail` WRITE;
/*!40000 ALTER TABLE `customer_loan_account_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_loan_account_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_meeting`
--

DROP TABLE IF EXISTS `customer_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_meeting` (
  `customer_meeting_id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_meeting_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `customer_meeting_idx` (`customer_id`),
  CONSTRAINT `customer_meeting_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_meeting_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_meeting`
--

LOCK TABLES `customer_meeting` WRITE;
/*!40000 ALTER TABLE `customer_meeting` DISABLE KEYS */;
INSERT INTO `customer_meeting` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,20,10),(11,23,11),(12,23,12),(13,23,13),(14,23,14),(15,23,15),(16,1,16),(17,1,17),(18,1,18),(19,30,19),(20,30,20),(21,30,21),(22,30,22),(23,30,23),(24,23,24),(25,34,25),(26,35,26),(27,36,27),(28,37,28),(29,40,29),(30,40,30),(31,50,31),(32,52,32),(33,52,33),(34,52,34),(35,34,35),(36,34,36),(37,56,37),(38,56,38),(39,57,39),(40,57,40),(41,58,42),(42,58,43),(43,61,44),(44,63,45),(45,65,46),(46,65,47),(47,68,48),(48,70,49),(49,70,50),(50,1,51),(51,73,52),(52,75,53),(53,75,54),(54,76,55),(55,76,56),(56,76,57),(57,34,58),(58,34,59),(59,80,60),(60,81,61),(61,80,62),(62,80,63),(63,85,64),(64,85,65);
/*!40000 ALTER TABLE `customer_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_meeting_detail`
--

DROP TABLE IF EXISTS `customer_meeting_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_meeting_detail` (
  `meeting_id` int(11) NOT NULL,
  `details_id` int(11) NOT NULL,
  PRIMARY KEY (`meeting_id`,`details_id`),
  KEY `details_id` (`details_id`),
  CONSTRAINT `customer_meeting_detail_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `customer_meeting` (`customer_meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_meeting_detail_ibfk_2` FOREIGN KEY (`details_id`) REFERENCES `recurrence_detail` (`details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_meeting_detail`
--

LOCK TABLES `customer_meeting_detail` WRITE;
/*!40000 ALTER TABLE `customer_meeting_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_meeting_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_movement`
--

DROP TABLE IF EXISTS `customer_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_movement` (
  `customer_movement_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `personnel_id` smallint(6) DEFAULT NULL,
  `office_id` smallint(6) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_movement_id`),
  KEY `office_id` (`office_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `updated_by` (`updated_by`),
  KEY `cust_movement_idx` (`customer_id`,`status`),
  CONSTRAINT `customer_movement_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_movement_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_movement_ibfk_3` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_movement_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_movement`
--

LOCK TABLES `customer_movement` WRITE;
/*!40000 ALTER TABLE `customer_movement` DISABLE KEYS */;
INSERT INTO `customer_movement` VALUES (1,24,NULL,3,0,'2010-07-22','2010-07-24',1,'2010-07-24'),(2,24,NULL,4,1,'2010-07-24',NULL,NULL,NULL),(3,18,NULL,4,0,'2010-07-25','2010-07-25',1,'2010-07-25'),(4,18,NULL,3,0,'2010-07-22','2010-07-25',1,'2010-07-25'),(5,18,NULL,3,1,'2010-07-25',NULL,NULL,NULL),(6,39,NULL,4,1,'2010-07-29',NULL,NULL,NULL),(7,39,NULL,3,0,'2010-07-29','2010-07-29',1,'2010-07-29'),(8,40,NULL,4,1,'2010-07-29',NULL,NULL,NULL),(9,40,NULL,3,0,'2010-07-29','2010-07-29',1,'2010-07-29'),(10,45,NULL,3,0,'2010-07-29','2010-07-31',1,'2010-07-31'),(11,45,NULL,4,1,'2010-07-31',NULL,NULL,NULL),(12,46,NULL,4,1,'2010-07-31',NULL,NULL,NULL),(13,46,NULL,3,0,'2010-07-29','2010-07-31',1,'2010-07-31'),(14,47,NULL,4,1,'2010-07-31',NULL,NULL,NULL),(15,47,NULL,3,0,'2010-07-29','2010-07-31',1,'2010-07-31'),(16,57,NULL,3,0,'2010-08-07','2010-08-10',1,'2010-08-10'),(17,57,NULL,4,1,'2010-08-10',NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_name_detail`
--

DROP TABLE IF EXISTS `customer_name_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_name_detail` (
  `customer_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `name_type` smallint(6) DEFAULT NULL,
  `locale_id` smallint(6) DEFAULT NULL,
  `salutation` int(11) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `second_last_name` varchar(100) DEFAULT NULL,
  `second_middle_name` varchar(100) DEFAULT NULL,
  `display_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customer_name_id`),
  KEY `salutation` (`salutation`),
  KEY `locale_id` (`locale_id`),
  KEY `cust_name_idx` (`customer_id`),
  CONSTRAINT `customer_name_detail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_name_detail_ibfk_2` FOREIGN KEY (`salutation`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_name_detail_ibfk_3` FOREIGN KEY (`locale_id`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_name_detail`
--

LOCK TABLES `customer_name_detail` WRITE;
/*!40000 ALTER TABLE `customer_name_detail` DISABLE KEYS */;
INSERT INTO `customer_name_detail` VALUES (1,3,3,NULL,630,'client dw1 1 1','','zeppelin','',NULL,'client dw1 1 1 zeppelin'),(2,3,1,NULL,NULL,'d','','d','',NULL,'d d'),(3,4,1,NULL,NULL,'d','','d','',NULL,'d d'),(4,4,3,NULL,630,'client dw1 1 2','','another','',NULL,'client dw1 1 2 another'),(5,6,3,NULL,631,'client dw1 2 1','','xxx','',NULL,'client dw1 2 1 xxx'),(6,6,1,NULL,NULL,'d','','d','',NULL,'d d'),(7,7,3,NULL,630,'client dw1 2 2','','xxx','',NULL,'client dw1 2 2 xxx'),(8,7,1,NULL,NULL,'d','','d','',NULL,'d d'),(9,9,1,NULL,NULL,'d','','d','',NULL,'d d'),(10,9,3,NULL,631,'client dw1 3 1','','xxx','',NULL,'client dw1 3 1 xxx'),(11,10,1,NULL,NULL,'s','','s','',NULL,'s s'),(12,10,3,NULL,630,'br1 no group memb 1','','xxx','',NULL,'br1 no group memb 1 xxx'),(13,13,3,NULL,631,'br2 client 1','','xxx','',NULL,'br2 client 1 xxx'),(14,13,1,NULL,NULL,'d','','d','',NULL,'d d'),(15,14,3,NULL,631,'br2 client 2','','xxx','',NULL,'br2 client 2 xxx'),(16,14,1,NULL,NULL,'d','','d','',NULL,'d d'),(17,16,3,NULL,631,'xfer to gr in center (if on same day)','','xxx','',NULL,'xfer to gr in center (if on same day) xxx'),(18,16,1,NULL,NULL,'d','','d','',NULL,'d d'),(19,17,3,NULL,631,'xfer to gr in center','','xxx','',NULL,'xfer to gr in center xxx'),(20,17,1,NULL,NULL,'d','','d','',NULL,'d d'),(21,18,1,NULL,NULL,'d','','d','',NULL,'d d'),(22,18,3,NULL,631,'lose group membership','','xxx','',NULL,'lose group membership xxx'),(23,23,1,NULL,NULL,'d','','d','',NULL,'d d'),(24,23,3,NULL,631,'xfer to gr in same branch','','xxx','',NULL,'xfer to gr in same branch xxx'),(25,24,1,NULL,NULL,'d','','d','',NULL,'d d'),(26,24,3,NULL,630,'xfer to gr in different branch','','xxx','',NULL,'xfer to gr in different branch xxx'),(27,28,1,NULL,NULL,'d','','d','',NULL,'d d'),(28,28,3,NULL,630,'client w/o group mem','','xxx','',NULL,'client w/o group mem xxx'),(29,30,1,NULL,NULL,'d','','d','',NULL,'d d'),(30,30,3,NULL,630,'client of group w/o center','','xxx','',NULL,'client of group w/o center xxx'),(31,34,1,NULL,NULL,'d','','d','',NULL,'d d'),(32,34,3,NULL,631,'client for center LO change','','xxx','',NULL,'client for center LO change xxx'),(33,36,3,NULL,631,'client group move out of center?','','xxx','',NULL,'client group move out of center? xxx'),(34,36,1,NULL,NULL,'d','','d','',NULL,'d d'),(35,38,3,NULL,630,'client group standalone','','xxx','',NULL,'client group standalone xxx'),(36,38,1,NULL,NULL,'d','','d','',NULL,'d d'),(37,40,1,NULL,NULL,'d','','d','',NULL,'d d'),(38,40,3,NULL,631,'client xfer to another branch','','xxx','',NULL,'client xfer to another branch xxx'),(39,43,3,NULL,631,'client for group w/o center hier LO change ','','xxx','',NULL,'client for group w/o center hier LO change xxx'),(40,43,1,NULL,NULL,'s','','s','',NULL,'s s'),(41,44,1,NULL,NULL,'a','','a','',NULL,'a a'),(42,44,3,NULL,631,'client w/o grp memb hier LO change ','','xxx','',NULL,'client w/o grp memb hier LO change xxx'),(43,45,1,NULL,NULL,'d','','d','',NULL,'d d'),(44,45,3,NULL,631,'client w/o gr memb xfer to branch','','xxx','',NULL,'client w/o gr memb xfer to branch xxx'),(45,47,1,NULL,NULL,'d','','d','',NULL,'d d'),(46,47,3,NULL,631,'client of group w/o center hier xfer branch ','','xxx','',NULL,'client of group w/o center hier xfer branch xxx'),(47,50,3,NULL,630,'client remove group membership','','xxx','',NULL,'client remove group membership xxx'),(48,50,1,NULL,NULL,'a','','a','',NULL,'a a'),(49,51,3,NULL,631,'client add back to group hierarchy after','','xxx','',NULL,'client add back to group hierarchy after xxx'),(50,51,1,NULL,NULL,'d','','d','',NULL,'d d'),(51,54,3,NULL,631,'remove group membership','','xxx','',NULL,'remove group membership xxx'),(52,54,1,NULL,NULL,'d','','d','',NULL,'d d'),(53,59,3,NULL,631,'client redo loans','','xxx','',NULL,'client redo loans xxx'),(54,59,1,NULL,NULL,'d','','d','',NULL,'d d'),(55,63,3,NULL,631,'client charge anyone','','xxx','',NULL,'client charge anyone xxx'),(56,63,1,NULL,NULL,'dff','','dfdf','',NULL,'dff dfdf');
/*!40000 ALTER TABLE `customer_name_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_note`
--

DROP TABLE IF EXISTS `customer_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_note` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `field_officer_id` smallint(6) NOT NULL,
  `comment_date` date NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `field_officer_id` (`field_officer_id`),
  KEY `cust_note_idx` (`customer_id`),
  CONSTRAINT `customer_note_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_note_ibfk_2` FOREIGN KEY (`field_officer_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_note`
--

LOCK TABLES `customer_note` WRITE;
/*!40000 ALTER TABLE `customer_note` DISABLE KEYS */;
INSERT INTO `customer_note` VALUES (1,2,1,'2010-07-02','asf'),(2,3,1,'2010-07-02','dfdf'),(3,4,1,'2010-07-02','a'),(4,5,1,'2010-07-03','sdf'),(5,6,1,'2010-07-03','fdfd'),(6,7,1,'2010-07-03','as'),(7,8,1,'2010-07-05','ff'),(8,9,1,'2010-07-05','adsf'),(9,10,1,'2010-07-18','h'),(10,12,1,'2010-07-20','f'),(11,13,1,'2010-07-20','f'),(12,14,1,'2010-07-21','d'),(13,15,1,'2010-07-21','asf'),(14,16,1,'2010-07-21','dfdf'),(15,17,1,'2010-07-21','d'),(16,18,1,'2010-07-22','dfdff'),(17,20,1,'2010-07-22','asdf'),(18,21,1,'2010-07-22','asdf'),(19,22,1,'2010-07-22','asf'),(20,23,1,'2010-07-22','asdf'),(21,24,1,'2010-07-22','sdfdf'),(22,18,1,'2010-07-25',''),(23,18,1,'2010-07-25','df'),(24,26,1,'2010-07-25','dfdf'),(25,27,1,'2010-07-25',' d'),(26,28,1,'2010-07-25','dd'),(27,29,1,'2010-07-25','asdf'),(28,30,1,'2010-07-25','d'),(29,33,1,'2010-07-25','f'),(30,34,1,'2010-07-25','f'),(31,35,1,'2010-07-29','asdf'),(32,36,1,'2010-07-29','asf'),(33,37,1,'2010-07-29','fdfd'),(34,38,1,'2010-07-29','dfd'),(35,39,1,'2010-07-29','ff'),(36,40,1,'2010-07-29','df'),(37,42,1,'2010-07-29','fgfgfg'),(38,43,1,'2010-07-29','asf'),(39,44,1,'2010-07-29','qq'),(40,45,1,'2010-07-29','asdf'),(41,46,1,'2010-07-29','asdf'),(42,47,1,'2010-07-29','asf'),(43,48,1,'2010-07-31','sdf'),(44,18,1,'2010-08-01','sdfdfdf'),(45,49,1,'2010-08-01','a'),(46,50,1,'2010-08-01','asdf'),(47,51,1,'2010-08-01','f'),(48,51,1,'2010-08-01','dddd'),(49,52,1,'2010-08-01','asdf'),(50,50,1,'2010-08-04','d'),(51,53,1,'2010-08-04','asdf'),(52,54,1,'2010-08-04','d'),(53,54,1,'2010-08-06','dddd'),(54,56,1,'2010-08-07','fdf'),(55,57,1,'2010-08-07','asf'),(56,58,1,'2010-08-20','asf'),(57,59,1,'2010-08-20','dd'),(58,62,1,'2010-08-27','ff'),(59,63,1,'2010-08-27','kjkj'),(60,65,1,'2010-08-28','zxcv');
/*!40000 ALTER TABLE `customer_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_picture`
--

DROP TABLE IF EXISTS `customer_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_picture` (
  `picture_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `picture` blob,
  PRIMARY KEY (`picture_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_picture_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_picture`
--

LOCK TABLES `customer_picture` WRITE;
/*!40000 ALTER TABLE `customer_picture` DISABLE KEYS */;
INSERT INTO `customer_picture` VALUES (1,3,NULL),(2,4,NULL),(3,6,NULL),(4,7,NULL),(5,9,NULL),(6,10,NULL),(7,13,NULL),(8,14,NULL),(9,16,NULL),(10,17,NULL),(11,18,NULL),(12,23,NULL),(13,24,NULL),(14,28,NULL),(15,30,NULL),(16,34,NULL),(17,36,NULL),(18,38,NULL),(19,40,NULL),(20,43,NULL),(21,44,NULL),(22,45,NULL),(23,47,NULL),(24,50,NULL),(25,51,NULL),(26,54,NULL),(27,59,NULL),(28,63,NULL);
/*!40000 ALTER TABLE `customer_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_position`
--

DROP TABLE IF EXISTS `customer_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_position` (
  `customer_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `parent_customer_id` int(11) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_position_id`),
  UNIQUE KEY `cust_position_idx` (`customer_id`,`position_id`),
  KEY `parent_customer_id` (`parent_customer_id`),
  CONSTRAINT `customer_position_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_position_ibfk_2` FOREIGN KEY (`parent_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_position`
--

LOCK TABLES `customer_position` WRITE;
/*!40000 ALTER TABLE `customer_position` DISABLE KEYS */;
INSERT INTO `customer_position` VALUES (1,4,NULL,32,NULL),(2,2,NULL,32,NULL),(3,1,NULL,32,NULL),(4,3,NULL,32,NULL),(5,4,NULL,22,NULL),(6,3,NULL,22,NULL),(7,4,NULL,42,NULL),(8,3,NULL,42,NULL),(9,3,NULL,56,NULL),(10,1,NULL,56,NULL),(11,4,NULL,56,NULL),(12,2,NULL,56,NULL);
/*!40000 ALTER TABLE `customer_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_program`
--

DROP TABLE IF EXISTS `customer_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_program` (
  `program_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`program_id`,`customer_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_program_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_program_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_program`
--

LOCK TABLES `customer_program` WRITE;
/*!40000 ALTER TABLE `customer_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_schedule`
--

DROP TABLE IF EXISTS `customer_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `misc_fees` decimal(21,4) DEFAULT NULL,
  `misc_fees_currency_id` smallint(6) DEFAULT NULL,
  `misc_fees_paid` decimal(21,4) DEFAULT NULL,
  `misc_fees_paid_currency_id` smallint(6) DEFAULT NULL,
  `misc_penalty` decimal(21,4) DEFAULT NULL,
  `misc_penalty_currency_id` smallint(6) DEFAULT NULL,
  `misc_penalty_paid` decimal(21,4) DEFAULT NULL,
  `misc_penalty_paid_currency_id` smallint(6) DEFAULT NULL,
  `payment_status` smallint(6) NOT NULL,
  `installment_id` smallint(6) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `parent_flag` smallint(6) DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `currency_id` (`currency_id`),
  KEY `customer_schedule_action_date_idx` (`customer_id`,`action_date`,`payment_status`),
  CONSTRAINT `customer_schedule_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_schedule_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_schedule_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_schedule`
--

LOCK TABLES `customer_schedule` WRITE;
/*!40000 ALTER TABLE `customer_schedule` DISABLE KEYS */;
INSERT INTO `customer_schedule` VALUES (1,1,1,NULL,'2010-07-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(2,1,1,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(3,1,1,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(4,1,1,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(5,1,1,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(6,1,1,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(7,1,1,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(8,1,1,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(9,1,1,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(10,1,1,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(11,2,2,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(12,2,2,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(13,2,2,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(14,2,2,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(15,2,2,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(16,2,2,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(17,2,2,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(18,2,2,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(19,2,2,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(20,2,2,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(21,3,3,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(22,3,3,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(23,3,3,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(24,3,3,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(25,3,3,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(26,3,3,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(27,3,3,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(28,3,3,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(29,3,3,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(30,3,3,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(31,5,4,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(32,5,4,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(33,5,4,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(34,5,4,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(35,5,4,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(36,5,4,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(37,5,4,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(38,5,4,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(39,5,4,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(40,5,4,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(41,9,5,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(42,9,5,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(43,9,5,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(44,9,5,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(45,9,5,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(46,9,5,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(47,9,5,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(48,9,5,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(49,9,5,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(50,9,5,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(51,10,6,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(52,10,6,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(53,10,6,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(54,10,6,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(55,10,6,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(56,10,6,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(57,10,6,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(58,10,6,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(59,10,6,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(60,10,6,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(61,12,7,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(62,12,7,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(63,12,7,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(64,12,7,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(65,12,7,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(66,12,7,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(67,12,7,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(68,12,7,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(69,12,7,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(70,12,7,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(71,18,8,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(72,18,8,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(73,18,8,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(74,18,8,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(75,18,8,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(76,18,8,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(77,18,8,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(78,18,8,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(79,18,8,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(80,18,8,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(81,19,9,NULL,'2010-07-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(82,19,9,NULL,'2010-07-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(83,19,9,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(84,19,9,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(85,19,9,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(86,19,9,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(87,19,9,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(88,19,9,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(89,19,9,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(90,19,9,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(91,22,10,NULL,'2010-07-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(92,22,10,NULL,'2010-07-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(93,22,10,NULL,'2010-08-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(94,22,10,NULL,'2010-08-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(95,22,10,NULL,'2010-08-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(96,22,10,NULL,'2010-08-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(97,22,10,NULL,'2010-09-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(98,22,10,NULL,'2010-09-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(99,22,10,NULL,'2010-09-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(100,22,10,NULL,'2010-09-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(101,25,11,NULL,'2010-07-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(102,25,11,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(103,25,11,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(104,25,11,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(105,25,11,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(106,25,11,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(107,25,11,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(108,25,11,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(109,25,11,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(110,25,11,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(111,26,12,NULL,'2010-07-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(112,26,12,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(113,26,12,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(114,26,12,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(115,26,12,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(116,26,12,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(117,26,12,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(118,26,12,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(119,26,12,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(120,26,12,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(121,27,13,NULL,'2010-07-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(122,27,13,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(123,27,13,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(124,27,13,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(125,27,13,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(126,27,13,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(127,27,13,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(128,27,13,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(129,27,13,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(130,27,13,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(131,28,14,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(132,28,14,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(133,28,14,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(134,28,14,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(135,28,14,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(136,28,14,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(137,28,14,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(138,28,14,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(139,28,14,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(140,28,14,NULL,'2010-09-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(141,29,15,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(142,29,15,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(143,29,15,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(144,29,15,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(145,29,15,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(146,29,15,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(147,29,15,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(148,29,15,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(149,29,15,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(150,29,15,NULL,'2010-09-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(151,33,16,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(152,33,16,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(153,33,16,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(154,33,16,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(155,33,16,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(156,33,16,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(157,33,16,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(158,33,16,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(159,33,16,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(160,33,16,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(161,35,17,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(162,35,17,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(163,35,17,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(164,35,17,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(165,35,17,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(166,35,17,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(167,35,17,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(168,35,17,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(169,35,17,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(170,35,17,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(171,37,18,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(172,37,18,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(173,37,18,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(174,37,18,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(175,37,18,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(176,37,18,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(177,37,18,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(178,37,18,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(179,37,18,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(180,37,18,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(181,39,19,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(182,39,19,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(183,39,19,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(184,39,19,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(185,39,19,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(186,39,19,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(187,39,19,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(188,39,19,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(189,39,19,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(190,39,19,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(191,40,20,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(192,40,20,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(193,40,20,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(194,40,20,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(195,40,20,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(196,40,20,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(197,40,20,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(198,40,20,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(199,40,20,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(200,40,20,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(201,41,21,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(202,41,21,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(203,41,21,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(204,41,21,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(205,41,21,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(206,41,21,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(207,41,21,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(208,41,21,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(209,41,21,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(210,41,21,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(211,42,22,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(212,42,22,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(213,42,22,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(214,42,22,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(215,42,22,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(216,42,22,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(217,42,22,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(218,42,22,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(219,42,22,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(220,42,22,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(221,43,23,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(222,43,23,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(223,43,23,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(224,43,23,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(225,43,23,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(226,43,23,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(227,43,23,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(228,43,23,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(229,43,23,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(230,43,23,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(231,45,24,NULL,'2010-07-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(232,45,24,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(233,45,24,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(234,45,24,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(235,45,24,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(236,45,24,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(237,45,24,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(238,45,24,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(239,45,24,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(240,45,24,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(241,48,25,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(242,48,25,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(243,48,25,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(244,48,25,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(245,48,25,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(246,48,25,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(247,48,25,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(248,48,25,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(249,48,25,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(250,48,25,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(251,49,26,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(252,49,26,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(253,49,26,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(254,49,26,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(255,49,26,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(256,49,26,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(257,49,26,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(258,49,26,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(259,49,26,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(260,49,26,NULL,'2010-09-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(261,50,27,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(262,50,27,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(263,50,27,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(264,50,27,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(265,50,27,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(266,50,27,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(267,50,27,NULL,'2010-10-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(268,50,27,NULL,'2010-11-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(269,50,27,NULL,'2010-11-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(270,50,27,NULL,'2010-12-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(271,51,28,NULL,'2010-07-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(272,51,28,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(273,51,28,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(274,51,28,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(275,51,28,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(276,51,28,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(277,51,28,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(278,51,28,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(279,51,28,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(280,51,28,NULL,'2010-09-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(281,54,29,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(282,54,29,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(283,54,29,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(284,54,29,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(285,54,29,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(286,54,29,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(287,54,29,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(288,54,29,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(289,54,29,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(290,54,29,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(291,57,30,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(292,57,30,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(293,57,30,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(294,57,30,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(295,57,30,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(296,57,30,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(297,57,30,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(298,57,30,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(299,57,30,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(300,57,30,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(301,60,31,NULL,'2010-07-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(302,60,31,NULL,'2010-08-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(303,60,31,NULL,'2010-08-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(304,60,31,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(305,60,31,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(306,60,31,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(307,60,31,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(308,60,31,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(309,60,31,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(310,60,31,NULL,'2010-09-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(311,62,32,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(312,62,32,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(313,62,32,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(314,62,32,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(315,62,32,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(316,62,32,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(317,62,32,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(318,62,32,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(319,62,32,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(320,62,32,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(321,63,33,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(322,63,33,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(323,63,33,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(324,63,33,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(325,63,33,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(326,63,33,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(327,63,33,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(328,63,33,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(329,63,33,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(330,63,33,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(331,65,34,NULL,'2010-07-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(332,65,34,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(333,65,34,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(334,65,34,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(335,65,34,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(336,65,34,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(337,65,34,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(338,65,34,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(339,65,34,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(340,65,34,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(341,68,35,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(342,68,35,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(343,68,35,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(344,68,35,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(345,68,35,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(346,68,35,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(347,68,35,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(348,68,35,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(349,68,35,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(350,68,35,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(351,69,36,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(352,69,36,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(353,69,36,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(354,69,36,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(355,69,36,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(356,69,36,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(357,69,36,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(358,69,36,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(359,69,36,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(360,69,36,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(361,70,37,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,1),(362,70,37,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(363,70,37,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(364,70,37,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(365,70,37,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(366,70,37,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(367,70,37,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(368,70,37,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(369,70,37,NULL,'2010-09-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(370,70,37,NULL,'2010-10-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(371,71,38,NULL,'2010-08-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,1),(372,71,38,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(373,71,38,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(374,71,38,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(375,71,38,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(376,71,38,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(377,71,38,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(378,71,38,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(379,71,38,NULL,'2010-09-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(380,71,38,NULL,'2010-10-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(381,72,39,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(382,72,39,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(383,72,39,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(384,72,39,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(385,72,39,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(386,72,39,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(387,72,39,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(388,72,39,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(389,72,39,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(390,72,39,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(391,73,40,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(392,73,40,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(393,73,40,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(394,73,40,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(395,73,40,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(396,73,40,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(397,73,40,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(398,73,40,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(399,73,40,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(400,73,40,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(401,75,42,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(402,75,42,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(403,75,42,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(404,75,42,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(405,75,42,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(406,75,42,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(407,75,42,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(408,75,42,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(409,75,42,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(410,75,42,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(411,77,43,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(412,77,43,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(413,77,43,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(414,77,43,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(415,77,43,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(416,77,43,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(417,77,43,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(418,77,43,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(419,77,43,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(420,77,43,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(421,79,44,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(422,79,44,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(423,79,44,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(424,79,44,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(425,79,44,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(426,79,44,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(427,79,44,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(428,79,44,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(429,79,44,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(430,79,44,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(431,81,45,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(432,81,45,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(433,81,45,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(434,81,45,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(435,81,45,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(436,81,45,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(437,81,45,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(438,81,45,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(439,81,45,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(440,81,45,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(441,83,46,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,1),(442,83,46,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(443,83,46,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(444,83,46,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(445,83,46,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(446,83,46,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(447,83,46,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(448,83,46,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(449,83,46,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(450,83,46,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(451,85,47,NULL,'2010-08-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,1),(452,85,47,NULL,'2010-08-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(453,85,47,NULL,'2010-08-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(454,85,47,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(455,85,47,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(456,85,47,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(457,85,47,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(458,85,47,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(459,85,47,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(460,85,47,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(461,87,48,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(462,87,48,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(463,87,48,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(464,87,48,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(465,87,48,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(466,87,48,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(467,87,48,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(468,87,48,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(469,87,48,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(470,87,48,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(471,89,49,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(472,89,49,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(473,89,49,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(474,89,49,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(475,89,49,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(476,89,49,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(477,89,49,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(478,89,49,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(479,89,49,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(480,89,49,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(481,90,50,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(482,90,50,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(483,90,50,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(484,90,50,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(485,90,50,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(486,90,50,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(487,90,50,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(488,90,50,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(489,90,50,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(490,90,50,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(491,92,51,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(492,92,51,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(493,92,51,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(494,92,51,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(495,92,51,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(496,92,51,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(497,92,51,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(498,92,51,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(499,92,51,NULL,'2010-09-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(500,92,51,NULL,'2010-10-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(501,94,52,NULL,'2010-08-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(502,94,52,NULL,'2010-08-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(503,94,52,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(504,94,52,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(505,94,52,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(506,94,52,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(507,94,52,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(508,94,52,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(509,94,52,NULL,'2010-09-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(510,94,52,NULL,'2010-10-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(511,96,53,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(512,96,53,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(513,96,53,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(514,96,53,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(515,96,53,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(516,96,53,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(517,96,53,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(518,96,53,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(519,96,53,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(520,96,53,NULL,'2010-10-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(521,97,54,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(522,97,54,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(523,97,54,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(524,97,54,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(525,97,54,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(526,97,54,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(527,97,54,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(528,97,54,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(529,97,54,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(530,97,54,NULL,'2010-10-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(531,98,55,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(532,98,55,NULL,'2010-08-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(533,98,55,NULL,'2010-08-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(534,98,55,NULL,'2010-08-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(535,98,55,NULL,'2010-09-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(536,98,55,NULL,'2010-09-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(537,98,55,NULL,'2010-09-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(538,98,55,NULL,'2010-09-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(539,98,55,NULL,'2010-10-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(540,98,55,NULL,'2010-10-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(541,99,56,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(542,99,56,NULL,'2010-08-19','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(543,99,56,NULL,'2010-08-26','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(544,99,56,NULL,'2010-09-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(545,99,56,NULL,'2010-09-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(546,99,56,NULL,'2010-09-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(547,99,56,NULL,'2010-09-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(548,99,56,NULL,'2010-09-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(549,99,56,NULL,'2010-10-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(550,99,56,NULL,'2010-10-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(551,101,57,NULL,'2010-08-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(552,101,57,NULL,'2010-08-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(553,101,57,NULL,'2010-08-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(554,101,57,NULL,'2010-08-31','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(555,101,57,NULL,'2010-09-07','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(556,101,57,NULL,'2010-09-14','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(557,101,57,NULL,'2010-09-21','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(558,101,57,NULL,'2010-09-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(559,101,57,NULL,'2010-10-05','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(560,101,57,NULL,'2010-10-12','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(561,103,58,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(562,103,58,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(563,103,58,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(564,103,58,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(565,103,58,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(566,103,58,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(567,103,58,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(568,103,58,NULL,'2010-10-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(569,103,58,NULL,'2010-10-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(570,103,58,NULL,'2010-10-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(571,104,59,NULL,'2010-08-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(572,104,59,NULL,'2010-09-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(573,104,59,NULL,'2010-09-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(574,104,59,NULL,'2010-09-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(575,104,59,NULL,'2010-09-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(576,104,59,NULL,'2010-09-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(577,104,59,NULL,'2010-10-06','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(578,104,59,NULL,'2010-10-13','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(579,104,59,NULL,'2010-10-20','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(580,104,59,NULL,'2010-10-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(581,105,60,NULL,'2010-08-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(582,105,60,NULL,'2010-09-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(583,105,60,NULL,'2010-09-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(584,105,60,NULL,'2010-09-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(585,105,60,NULL,'2010-09-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(586,105,60,NULL,'2010-10-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(587,105,60,NULL,'2010-10-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(588,105,60,NULL,'2010-10-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(589,105,60,NULL,'2010-10-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(590,105,60,NULL,'2010-10-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(591,106,61,NULL,'2010-08-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,1,1,'2010-08-27',NULL,1),(592,106,61,NULL,'2010-09-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(593,106,61,NULL,'2010-09-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(594,106,61,NULL,'2010-09-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(595,106,61,NULL,'2010-09-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(596,106,61,NULL,'2010-10-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(597,106,61,NULL,'2010-10-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(598,106,61,NULL,'2010-10-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(599,106,61,NULL,'2010-10-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(600,106,61,NULL,'2010-10-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(601,107,62,NULL,'2010-08-27','2.0000',2,'2.0000',2,'4.0000',2,'4.0000',2,1,1,'2010-08-27',NULL,6),(602,107,62,NULL,'2010-09-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(603,107,62,NULL,'2010-09-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(604,107,62,NULL,'2010-09-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(605,107,62,NULL,'2010-09-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(606,107,62,NULL,'2010-10-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(607,107,62,NULL,'2010-10-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(608,107,62,NULL,'2010-10-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(609,107,62,NULL,'2010-10-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(610,107,62,NULL,'2010-10-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(611,108,63,NULL,'2010-08-27','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(612,108,63,NULL,'2010-09-03','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(613,108,63,NULL,'2010-09-10','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(614,108,63,NULL,'2010-09-17','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(615,108,63,NULL,'2010-09-24','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(616,108,63,NULL,'2010-10-01','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(617,108,63,NULL,'2010-10-08','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(618,108,63,NULL,'2010-10-15','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(619,108,63,NULL,'2010-10-22','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(620,108,63,NULL,'2010-10-29','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(621,110,64,NULL,'2010-08-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(622,110,64,NULL,'2010-09-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(623,110,64,NULL,'2010-09-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(624,110,64,NULL,'2010-09-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(625,110,64,NULL,'2010-09-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(626,110,64,NULL,'2010-10-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(627,110,64,NULL,'2010-10-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(628,110,64,NULL,'2010-10-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(629,110,64,NULL,'2010-10-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(630,110,64,NULL,'2010-10-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0),(631,111,65,NULL,'2010-08-28','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(632,111,65,NULL,'2010-09-04','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(633,111,65,NULL,'2010-09-11','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(634,111,65,NULL,'2010-09-18','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(635,111,65,NULL,'2010-09-25','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(636,111,65,NULL,'2010-10-02','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(637,111,65,NULL,'2010-10-09','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(638,111,65,NULL,'2010-10-16','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(639,111,65,NULL,'2010-10-23','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(640,111,65,NULL,'2010-10-30','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,10,NULL,NULL,0);
/*!40000 ALTER TABLE `customer_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_state`
--

DROP TABLE IF EXISTS `customer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_state` (
  `status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `status_lookup_id` int(11) NOT NULL,
  `level_id` smallint(6) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `currently_in_use` smallint(6) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `level_id` (`level_id`),
  KEY `status_lookup_id` (`status_lookup_id`),
  CONSTRAINT `customer_state_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `customer_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_state_ibfk_2` FOREIGN KEY (`status_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_state`
--

LOCK TABLES `customer_state` WRITE;
/*!40000 ALTER TABLE `customer_state` DISABLE KEYS */;
INSERT INTO `customer_state` VALUES (1,1,1,'Customer Was Partial',1),(2,2,1,'Customer Was Pending',1),(3,3,1,'Customer Was Active',1),(4,4,1,'Customer Was Hold',1),(5,5,1,'Customer Was Cancel',1),(6,6,1,'Customer Was Close',1),(7,7,2,'Customer Was Partial',1),(8,8,2,'Customer Was Pending',1),(9,9,2,'Customer Was Active',1),(10,10,2,'Customer Was Hold',1),(11,11,2,'Customer Was Cancel',1),(12,12,2,'Customer Was Close',1),(13,13,3,'Customer Was Active',1),(14,14,3,'Customer Was Inactive',1);
/*!40000 ALTER TABLE `customer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_state_flag`
--

DROP TABLE IF EXISTS `customer_state_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_state_flag` (
  `flag_id` smallint(6) NOT NULL,
  `flag_lookup_id` int(11) NOT NULL,
  `status_id` smallint(6) NOT NULL,
  `flag_description` varchar(200) NOT NULL,
  `isblacklisted` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`flag_id`),
  KEY `status_id` (`status_id`),
  KEY `flag_lookup_id` (`flag_lookup_id`),
  CONSTRAINT `customer_state_flag_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `customer_state` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_state_flag_ibfk_2` FOREIGN KEY (`flag_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_state_flag`
--

LOCK TABLES `customer_state_flag` WRITE;
/*!40000 ALTER TABLE `customer_state_flag` DISABLE KEYS */;
INSERT INTO `customer_state_flag` VALUES (1,28,5,'Withdraw',0),(2,29,5,'Rejected',0),(3,30,5,'Blacklisted',1),(4,31,5,'Duplicate',0),(5,34,5,'Other',0),(6,32,6,'Transferred',0),(7,31,6,'Duplicate',0),(8,30,6,'Blacklisted',1),(9,33,6,'Left program',0),(10,34,6,'Other',0),(11,28,11,'Withdraw',0),(12,29,11,'Rejected',0),(13,30,11,'Blacklisted',1),(14,31,11,'Duplicate',0),(15,34,11,'Other',0),(16,32,12,'Transferred',0),(17,31,12,'Duplicate',0),(18,30,12,'Blacklisted',1),(19,33,12,'Left program',0),(20,34,12,'Other',0);
/*!40000 ALTER TABLE `customer_state_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_trxn_detail`
--

DROP TABLE IF EXISTS `customer_trxn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_trxn_detail` (
  `account_trxn_id` int(11) NOT NULL,
  `total_amount` decimal(21,4) DEFAULT NULL,
  `total_amount_currency_id` smallint(6) DEFAULT NULL,
  `misc_fee_amount` decimal(21,4) DEFAULT NULL,
  `misc_fee_amount_currency_id` smallint(6) DEFAULT NULL,
  `misc_penalty_amount` decimal(21,4) DEFAULT NULL,
  `misc_penalty_amount_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`account_trxn_id`),
  KEY `total_amount_currency_id` (`total_amount_currency_id`),
  KEY `misc_penalty_amount_currency_id` (`misc_penalty_amount_currency_id`),
  KEY `misc_fee_amount_currency_id` (`misc_fee_amount_currency_id`),
  CONSTRAINT `customer_trxn_detail_ibfk_1` FOREIGN KEY (`total_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_trxn_detail_ibfk_2` FOREIGN KEY (`misc_penalty_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_trxn_detail_ibfk_3` FOREIGN KEY (`misc_fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `customer_trxn_detail_ibfk_4` FOREIGN KEY (`account_trxn_id`) REFERENCES `account_trxn` (`account_trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_trxn_detail`
--

LOCK TABLES `customer_trxn_detail` WRITE;
/*!40000 ALTER TABLE `customer_trxn_detail` DISABLE KEYS */;
INSERT INTO `customer_trxn_detail` VALUES (83,'0.0000',2,'0.0000',2,'0.0000',2),(84,'0.0000',2,'0.0000',2,'0.0000',2),(86,'0.0000',2,'0.0000',2,'0.0000',2),(87,'6.0000',2,'2.0000',2,'4.0000',2);
/*!40000 ALTER TABLE `customer_trxn_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_version`
--

DROP TABLE IF EXISTS `database_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `database_version` (
  `database_version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_version`
--

LOCK TABLES `database_version` WRITE;
/*!40000 ALTER TABLE `database_version` DISABLE KEYS */;
INSERT INTO `database_version` VALUES (257);
/*!40000 ALTER TABLE `database_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_master`
--

DROP TABLE IF EXISTS `entity_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_master` (
  `entity_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(100) NOT NULL,
  PRIMARY KEY (`entity_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_master`
--

LOCK TABLES `entity_master` WRITE;
/*!40000 ALTER TABLE `entity_master` DISABLE KEYS */;
INSERT INTO `entity_master` VALUES (1,'Client'),(2,'LoanProduct'),(3,'SavingsProduct'),(4,'ProductCategory'),(5,'ProductConfiguration'),(6,'Fees'),(7,'Accounts'),(8,'Admin'),(9,'Checklist'),(10,'Configuration'),(11,'Customer'),(12,'Group'),(13,'Login'),(14,'Meeting'),(15,'Office'),(16,'Penalty'),(17,'Personnel'),(19,'Roleandpermission'),(20,'Center'),(21,'Savings'),(22,'Loan'),(23,'BulkEntry');
/*!40000 ALTER TABLE `entity_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_formula_master`
--

DROP TABLE IF EXISTS `fee_formula_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_formula_master` (
  `formulaid` smallint(6) NOT NULL AUTO_INCREMENT,
  `forumla_lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`formulaid`),
  KEY `forumla_lookup_id` (`forumla_lookup_id`),
  CONSTRAINT `fee_formula_master_ibfk_1` FOREIGN KEY (`forumla_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_formula_master`
--

LOCK TABLES `fee_formula_master` WRITE;
/*!40000 ALTER TABLE `fee_formula_master` DISABLE KEYS */;
INSERT INTO `fee_formula_master` VALUES (1,149),(2,150),(3,151);
/*!40000 ALTER TABLE `fee_formula_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_frequency`
--

DROP TABLE IF EXISTS `fee_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_frequency` (
  `fee_frequency_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fee_id` smallint(6) NOT NULL,
  `fee_frequencytype_id` smallint(6) NOT NULL,
  `frequency_payment_id` smallint(6) DEFAULT NULL,
  `frequency_meeting_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fee_frequency_id`),
  KEY `fee_id` (`fee_id`),
  KEY `fee_frequencytype_id` (`fee_frequencytype_id`),
  KEY `frequency_payment_id` (`frequency_payment_id`),
  KEY `frequency_meeting_id` (`frequency_meeting_id`),
  CONSTRAINT `fee_frequency_ibfk_1` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_frequency_ibfk_2` FOREIGN KEY (`fee_frequencytype_id`) REFERENCES `fee_frequency_type` (`fee_frequency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_frequency_ibfk_3` FOREIGN KEY (`frequency_payment_id`) REFERENCES `fee_payment` (`fee_payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_frequency_ibfk_4` FOREIGN KEY (`frequency_meeting_id`) REFERENCES `meeting` (`meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_frequency`
--

LOCK TABLES `fee_frequency` WRITE;
/*!40000 ALTER TABLE `fee_frequency` DISABLE KEYS */;
INSERT INTO `fee_frequency` VALUES (1,1,1,NULL,79),(2,2,1,NULL,82),(3,3,2,1,NULL),(4,4,1,NULL,83),(5,5,2,1,NULL),(6,6,2,2,NULL),(7,7,2,3,NULL),(8,8,1,NULL,86);
/*!40000 ALTER TABLE `fee_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_frequency_type`
--

DROP TABLE IF EXISTS `fee_frequency_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_frequency_type` (
  `fee_frequency_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`fee_frequency_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `fee_frequency_type_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_frequency_type`
--

LOCK TABLES `fee_frequency_type` WRITE;
/*!40000 ALTER TABLE `fee_frequency_type` DISABLE KEYS */;
INSERT INTO `fee_frequency_type` VALUES (1,558),(2,559);
/*!40000 ALTER TABLE `fee_frequency_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_payment`
--

DROP TABLE IF EXISTS `fee_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_payment` (
  `fee_payment_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fee_payment_lookup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fee_payment_id`),
  KEY `fee_payment_lookup_id` (`fee_payment_lookup_id`),
  CONSTRAINT `fee_payment_ibfk_1` FOREIGN KEY (`fee_payment_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_payment`
--

LOCK TABLES `fee_payment` WRITE;
/*!40000 ALTER TABLE `fee_payment` DISABLE KEYS */;
INSERT INTO `fee_payment` VALUES (1,146),(2,147),(3,148);
/*!40000 ALTER TABLE `fee_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_payments_categories_type`
--

DROP TABLE IF EXISTS `fee_payments_categories_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_payments_categories_type` (
  `fee_payments_category_type_id` smallint(6) NOT NULL,
  `fee_payment_id` smallint(6) DEFAULT NULL,
  `category_id` smallint(6) DEFAULT NULL,
  `fee_type_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`fee_payments_category_type_id`),
  KEY `category_id` (`category_id`),
  KEY `fee_payment_id` (`fee_payment_id`),
  KEY `fee_type_id` (`fee_type_id`),
  CONSTRAINT `fee_payments_categories_type_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_type` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_payments_categories_type_ibfk_2` FOREIGN KEY (`fee_payment_id`) REFERENCES `fee_payment` (`fee_payment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_payments_categories_type_ibfk_3` FOREIGN KEY (`fee_type_id`) REFERENCES `fee_type` (`fee_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_payments_categories_type`
--

LOCK TABLES `fee_payments_categories_type` WRITE;
/*!40000 ALTER TABLE `fee_payments_categories_type` DISABLE KEYS */;
INSERT INTO `fee_payments_categories_type` VALUES (1,1,1,1),(2,1,1,1),(3,1,1,1);
/*!40000 ALTER TABLE `fee_payments_categories_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_status`
--

DROP TABLE IF EXISTS `fee_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_status` (
  `status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `status_lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `status_lookup_id` (`status_lookup_id`),
  CONSTRAINT `fee_status_ibfk_1` FOREIGN KEY (`status_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_status`
--

LOCK TABLES `fee_status` WRITE;
/*!40000 ALTER TABLE `fee_status` DISABLE KEYS */;
INSERT INTO `fee_status` VALUES (1,165),(2,166);
/*!40000 ALTER TABLE `fee_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_trxn_detail`
--

DROP TABLE IF EXISTS `fee_trxn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_trxn_detail` (
  `fee_trxn_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_trxn_id` int(11) NOT NULL,
  `account_fee_id` int(11) DEFAULT NULL,
  `fee_amount_currency_id` smallint(6) DEFAULT NULL,
  `fee_amount` decimal(21,4) NOT NULL,
  PRIMARY KEY (`fee_trxn_detail_id`),
  KEY `account_fee_id` (`account_fee_id`),
  KEY `fee_amount_currency_id` (`fee_amount_currency_id`),
  KEY `fee_account_trxn_idx` (`account_trxn_id`),
  CONSTRAINT `fee_trxn_detail_ibfk_1` FOREIGN KEY (`account_fee_id`) REFERENCES `account_fees` (`account_fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_trxn_detail_ibfk_2` FOREIGN KEY (`fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fee_trxn_detail_ibfk_3` FOREIGN KEY (`account_trxn_id`) REFERENCES `account_trxn` (`account_trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_trxn_detail`
--

LOCK TABLES `fee_trxn_detail` WRITE;
/*!40000 ALTER TABLE `fee_trxn_detail` DISABLE KEYS */;
INSERT INTO `fee_trxn_detail` VALUES (1,83,1,2,'10.0000'),(2,84,3,2,'30.0000'),(3,84,4,2,'20.0000'),(4,84,2,2,'40.0000'),(5,86,4,2,'-20.0000'),(6,86,2,2,'-40.0000'),(7,86,3,2,'-30.0000'),(8,87,4,2,'20.0000'),(9,87,2,2,'40.0000'),(10,87,3,2,'30.0000'),(11,87,5,2,'33.0000'),(12,88,10,2,'70.0000'),(13,90,7,2,'90.0000'),(14,90,9,2,'80.0000'),(15,90,8,2,'60.0000'),(16,91,9,2,'-80.0000'),(17,91,8,2,'-60.0000'),(18,91,7,2,'-90.0000'),(19,92,9,2,'80.0000'),(20,92,8,2,'60.0000'),(21,92,7,2,'90.0000'),(22,93,7,2,'1.0000'),(23,94,7,2,'-1.0000'),(24,95,7,2,'-90.0000'),(25,95,8,2,'-60.0000'),(26,95,9,2,'-80.0000'),(27,97,10,2,'-70.0000');
/*!40000 ALTER TABLE `fee_trxn_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_type`
--

DROP TABLE IF EXISTS `fee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_type` (
  `fee_type_id` smallint(6) NOT NULL,
  `fee_lookup_id` smallint(6) DEFAULT NULL,
  `flat_or_rate` smallint(6) DEFAULT NULL,
  `formula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fee_type_id`),
  KEY `fee_lookup_id` (`fee_lookup_id`),
  CONSTRAINT `fee_type_ibfk_1` FOREIGN KEY (`fee_lookup_id`) REFERENCES `lookup_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_type`
--

LOCK TABLES `fee_type` WRITE;
/*!40000 ALTER TABLE `fee_type` DISABLE KEYS */;
INSERT INTO `fee_type` VALUES (1,1,NULL,NULL),(2,1,NULL,NULL),(3,2,NULL,NULL),(4,3,NULL,NULL),(5,3,NULL,NULL);
/*!40000 ALTER TABLE `fee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_update_type`
--

DROP TABLE IF EXISTS `fee_update_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee_update_type` (
  `fee_update_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`fee_update_type_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `fee_update_type_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_update_type`
--

LOCK TABLES `fee_update_type` WRITE;
/*!40000 ALTER TABLE `fee_update_type` DISABLE KEYS */;
INSERT INTO `fee_update_type` VALUES (1,556),(2,557);
/*!40000 ALTER TABLE `fee_update_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feelevel`
--

DROP TABLE IF EXISTS `feelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feelevel` (
  `feelevel_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fee_id` smallint(6) NOT NULL,
  `level_id` smallint(6) NOT NULL,
  PRIMARY KEY (`feelevel_id`),
  KEY `fee_id` (`fee_id`),
  CONSTRAINT `feelevel_ibfk_1` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feelevel`
--

LOCK TABLES `feelevel` WRITE;
/*!40000 ALTER TABLE `feelevel` DISABLE KEYS */;
INSERT INTO `feelevel` VALUES (1,4,2);
/*!40000 ALTER TABLE `feelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees` (
  `fee_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `global_fee_num` varchar(50) DEFAULT NULL,
  `fee_name` varchar(50) NOT NULL,
  `fee_payments_category_type_id` smallint(6) DEFAULT NULL,
  `office_id` smallint(6) NOT NULL,
  `glcode_id` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `rate_or_amount` decimal(16,5) DEFAULT NULL,
  `rate_or_amount_currency_id` smallint(6) DEFAULT NULL,
  `rate_flat_falg` smallint(6) DEFAULT NULL,
  `created_date` date NOT NULL,
  `created_by` smallint(6) NOT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `update_flag` smallint(6) DEFAULT NULL,
  `formula_id` smallint(6) DEFAULT NULL,
  `default_admin_fee` varchar(10) DEFAULT NULL,
  `fee_amount` decimal(21,4) DEFAULT NULL,
  `fee_amount_currency_id` smallint(6) DEFAULT NULL,
  `rate` decimal(16,5) DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  `discriminator` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  UNIQUE KEY `fee_global_idx` (`global_fee_num`),
  KEY `glcode_id` (`glcode_id`),
  KEY `category_id` (`category_id`),
  KEY `status` (`status`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `formula_id` (`formula_id`),
  KEY `rate_or_amount_currency_id` (`rate_or_amount_currency_id`),
  KEY `fee_amount_currency_id` (`fee_amount_currency_id`),
  KEY `fee_pmnt_catg_idx` (`fee_payments_category_type_id`),
  KEY `fee_office_idx` (`office_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_type` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_3` FOREIGN KEY (`status`) REFERENCES `fee_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_4` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_7` FOREIGN KEY (`formula_id`) REFERENCES `fee_formula_master` (`formulaid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_8` FOREIGN KEY (`rate_or_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fees_ibfk_9` FOREIGN KEY (`fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,NULL,'Center Fee',NULL,1,50,1,4,NULL,NULL,NULL,'2010-08-27',1,NULL,NULL,0,NULL,NULL,'10.0000',2,NULL,0,'AMOUNT'),(2,NULL,'Group Fee Periodic 20',NULL,1,50,1,3,NULL,NULL,NULL,'2010-08-27',1,NULL,NULL,0,NULL,NULL,'20.0000',2,NULL,0,'AMOUNT'),(3,NULL,'Group Fee One Time Upfront 30',NULL,1,50,1,3,NULL,NULL,NULL,'2010-08-27',1,NULL,NULL,0,NULL,NULL,'30.0000',2,NULL,0,'AMOUNT'),(4,NULL,'Group Fee Default Periodic 40',NULL,1,50,1,3,NULL,NULL,NULL,'2010-08-27',1,NULL,NULL,0,NULL,NULL,'40.0000',2,NULL,0,'AMOUNT'),(5,NULL,'loan fee one time upfront 60',NULL,1,50,1,5,NULL,NULL,NULL,'2010-08-28',1,NULL,NULL,0,NULL,NULL,'60.0000',2,NULL,0,'AMOUNT'),(6,NULL,'loan fee one time time of disb 70',NULL,1,50,1,5,NULL,NULL,NULL,'2010-08-28',1,NULL,NULL,0,NULL,NULL,'70.0000',2,NULL,0,'AMOUNT'),(7,NULL,'loan fee one time time of 1st loan repayment 80',NULL,1,50,1,5,NULL,NULL,NULL,'2010-08-28',1,NULL,NULL,0,NULL,NULL,'80.0000',2,NULL,0,'AMOUNT'),(8,NULL,'loan fee periodic 90',NULL,1,50,1,5,NULL,NULL,NULL,'2010-08-28',1,NULL,NULL,0,NULL,NULL,'90.0000',2,NULL,0,'AMOUNT');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_configuration`
--

DROP TABLE IF EXISTS `field_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_configuration` (
  `field_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(100) NOT NULL,
  `entity_id` smallint(6) NOT NULL,
  `mandatory_flag` smallint(6) NOT NULL,
  `hidden_flag` smallint(6) NOT NULL,
  `parent_field_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`field_config_id`),
  KEY `entity_id` (`entity_id`),
  KEY `parent_field_config_id` (`parent_field_config_id`),
  CONSTRAINT `field_configuration_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `entity_master` (`entity_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `field_configuration_ibfk_2` FOREIGN KEY (`parent_field_config_id`) REFERENCES `field_configuration` (`field_config_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_configuration`
--

LOCK TABLES `field_configuration` WRITE;
/*!40000 ALTER TABLE `field_configuration` DISABLE KEYS */;
INSERT INTO `field_configuration` VALUES (1,'MiddleName',1,0,0,NULL),(2,'MiddleName',17,0,0,NULL),(3,'SecondLastName',1,0,0,NULL),(4,'SecondLastName',17,0,0,NULL),(5,'GovernmentId',1,0,0,NULL),(6,'GovernmentId',17,0,0,NULL),(7,'ExternalId',1,0,0,NULL),(8,'ExternalId',12,0,0,NULL),(9,'ExternalId',20,0,0,NULL),(10,'Ethinicity',1,0,0,NULL),(11,'Citizenship',1,0,0,NULL),(12,'Handicapped',1,0,0,NULL),(13,'BusinessActivities',1,0,0,NULL),(14,'EducationLevel',1,0,0,NULL),(15,'Photo',1,0,0,NULL),(16,'SpouseFatherMiddleName',1,0,0,NULL),(17,'SpouseFatherSecondLastName',1,0,0,NULL),(18,'Trained',1,0,0,NULL),(19,'Trained',12,0,0,NULL),(20,'TrainedDate',1,0,0,NULL),(21,'TrainedDate',12,0,0,NULL),(22,'Address',1,0,0,NULL),(23,'Address',12,0,0,NULL),(24,'Address',20,0,0,NULL),(25,'Address1',1,0,0,22),(26,'Address1',12,0,0,23),(27,'Address1',20,0,0,24),(28,'Address2',1,0,0,22),(29,'Address2',12,0,0,23),(30,'Address2',20,0,0,24),(31,'Address3',1,0,0,22),(32,'Address3',12,0,0,23),(33,'Address3',20,0,0,24),(34,'Address3',15,0,0,NULL),(35,'Address3',17,0,0,NULL),(36,'City',1,0,0,22),(37,'City',12,0,0,23),(38,'City',20,0,0,24),(39,'State',1,0,0,22),(40,'State',12,0,0,23),(41,'State',20,0,0,24),(42,'State',15,0,0,NULL),(43,'State',17,0,0,NULL),(44,'Country',1,0,0,22),(45,'Country',12,0,0,23),(46,'Country',20,0,0,24),(47,'Country',15,0,0,NULL),(48,'Country',17,0,0,NULL),(49,'PostalCode',1,0,0,22),(50,'PostalCode',12,0,0,23),(51,'PostalCode',20,0,0,24),(52,'PostalCode',15,0,0,NULL),(53,'PostalCode',17,0,0,NULL),(54,'PhoneNumber',1,0,0,NULL),(55,'PhoneNumber',12,0,0,NULL),(56,'PhoneNumber',20,0,0,NULL),(57,'PhoneNumber',17,0,0,NULL),(58,'PurposeOfLoan',22,0,0,NULL),(59,'CollateralType',22,0,0,NULL),(60,'CollateralNotes',22,0,0,NULL),(61,'ReceiptId',1,0,0,NULL),(62,'ReceiptId',12,0,0,NULL),(63,'ReceiptId',20,0,0,NULL),(64,'ReceiptId',21,0,0,NULL),(65,'ReceiptId',22,0,0,NULL),(66,'ReceiptId',23,0,0,NULL),(67,'ReceiptDate',1,0,0,NULL),(68,'ReceiptDate',12,0,0,NULL),(69,'ReceiptDate',20,0,0,NULL),(70,'ReceiptDate',21,0,0,NULL),(71,'ReceiptDate',22,0,0,NULL),(72,'ReceiptDate',23,0,0,NULL),(73,'PovertyStatus',1,1,0,NULL),(74,'AssignClients',1,0,0,NULL),(75,'Address2',15,0,0,NULL),(76,'Address2',17,0,0,NULL),(77,'Address1',15,0,0,NULL),(78,'Address1',17,0,0,NULL),(79,'City',15,0,0,NULL),(80,'SourceOfFund',22,0,0,NULL),(81,'MaritalStatus',1,0,0,NULL),(82,'NumberOfChildren',1,0,0,NULL),(83,'ExternalId',22,0,0,NULL),(84,'SpouseFatherInformation',1,1,0,NULL),(85,'FamilyDetails',1,1,0,NULL);
/*!40000 ALTER TABLE `field_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_action`
--

DROP TABLE IF EXISTS `financial_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_action` (
  `fin_action_id` smallint(6) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`fin_action_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `financial_action_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value_locale` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_action`
--

LOCK TABLES `financial_action` WRITE;
/*!40000 ALTER TABLE `financial_action` DISABLE KEYS */;
INSERT INTO `financial_action` VALUES (1,198),(2,199),(3,200),(5,201),(8,202),(9,203),(10,204),(11,205),(12,206),(13,207),(14,208),(15,209),(7,215),(4,229),(6,361),(16,363),(17,365),(18,367),(19,368),(20,369),(21,370),(22,550),(23,609);
/*!40000 ALTER TABLE `financial_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financial_trxn`
--

DROP TABLE IF EXISTS `financial_trxn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `financial_trxn` (
  `trxn_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_trxn_id` int(11) NOT NULL,
  `related_fin_trxn` int(11) DEFAULT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `fin_action_id` smallint(6) DEFAULT NULL,
  `glcode_id` smallint(6) NOT NULL,
  `posted_amount` decimal(21,4) NOT NULL,
  `posted_amount_currency_id` smallint(6) DEFAULT NULL,
  `balance_amount` decimal(21,4) NOT NULL,
  `balance_amount_currency_id` smallint(6) DEFAULT NULL,
  `action_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `posted_by` smallint(6) DEFAULT NULL,
  `accounting_updated` smallint(6) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `debit_credit_flag` smallint(6) NOT NULL,
  PRIMARY KEY (`trxn_id`),
  KEY `account_trxn_id` (`account_trxn_id`),
  KEY `posted_amount_currency_id` (`posted_amount_currency_id`),
  KEY `balance_amount_currency_id` (`balance_amount_currency_id`),
  KEY `currency_id` (`currency_id`),
  KEY `related_fin_trxn` (`related_fin_trxn`),
  KEY `fin_action_id` (`fin_action_id`),
  KEY `posted_by` (`posted_by`),
  KEY `glcode_id` (`glcode_id`),
  CONSTRAINT `financial_trxn_ibfk_1` FOREIGN KEY (`account_trxn_id`) REFERENCES `account_trxn` (`account_trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_3` FOREIGN KEY (`posted_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_4` FOREIGN KEY (`balance_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_5` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_6` FOREIGN KEY (`related_fin_trxn`) REFERENCES `financial_trxn` (`trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_7` FOREIGN KEY (`fin_action_id`) REFERENCES `financial_action` (`fin_action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_8` FOREIGN KEY (`posted_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `financial_trxn_ibfk_9` FOREIGN KEY (`glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_trxn`
--

LOCK TABLES `financial_trxn` WRITE;
/*!40000 ALTER TABLE `financial_trxn` DISABLE KEYS */;
INSERT INTO `financial_trxn` VALUES (1,1,NULL,NULL,9,7,'67.0000',2,'67.0000',2,'2010-07-03','2010-07-03',1,1,'',0),(2,1,NULL,NULL,9,36,'67.0000',2,'67.0000',2,'2010-07-03','2010-07-03',1,1,'',1),(3,2,NULL,NULL,9,7,'50.0000',2,'50.0000',2,'2010-07-03','2010-07-03',1,1,'',0),(4,2,NULL,NULL,9,36,'50.0000',2,'50.0000',2,'2010-07-03','2010-07-03',1,1,'',1),(5,3,NULL,NULL,18,36,'67.0000',2,'67.0000',2,'2010-07-03','2010-07-03',1,1,'wrong number',0),(6,3,NULL,NULL,18,7,'67.0000',2,'67.0000',2,'2010-07-03','2010-07-03',1,1,'wrong number',1),(7,4,NULL,NULL,10,7,'100.0000',2,'100.0000',2,'2010-07-05','2010-07-05',1,1,'',0),(8,4,NULL,NULL,10,36,'100.0000',2,'100.0000',2,'2010-07-05','2010-07-05',1,1,'',1),(9,5,NULL,NULL,12,36,'100.0000',2,'100.0000',2,'2010-07-05','2010-07-05',1,1,'',0),(10,5,NULL,NULL,12,7,'100.0000',2,'100.0000',2,'2010-07-05','2010-07-05',1,1,'',1),(11,6,NULL,NULL,9,7,'1.0000',2,'1.0000',2,'2010-07-05','2010-07-05',1,1,'',0),(12,6,NULL,NULL,9,36,'1.0000',2,'1.0000',2,'2010-07-05','2010-07-05',1,1,'',1),(13,7,NULL,NULL,9,36,'2.0000',2,'2.0000',2,'2010-07-05','2010-07-05',1,1,'',1),(14,7,NULL,NULL,9,7,'2.0000',2,'2.0000',2,'2010-07-05','2010-07-05',1,1,'',0),(15,8,NULL,NULL,9,36,'3.0000',2,'3.0000',2,'2010-07-05','2010-07-05',1,1,'',1),(16,8,NULL,NULL,9,7,'3.0000',2,'3.0000',2,'2010-07-05','2010-07-05',1,1,'',0),(17,9,NULL,NULL,11,7,'6.0000',2,'6.0000',2,'2010-07-05','2010-07-05',1,1,'',1),(18,9,NULL,NULL,11,36,'6.0000',2,'6.0000',2,'2010-07-05','2010-07-05',1,1,'',0),(19,10,NULL,NULL,7,7,'3000.0000',2,'3000.0000',2,'2010-07-16','2010-07-18',1,1,'-',1),(20,10,NULL,NULL,7,19,'3000.0000',2,'3000.0000',2,'2010-07-16','2010-07-18',1,1,'-',0),(21,11,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(22,11,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(23,11,NULL,NULL,1,7,'97.1000',2,'97.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(24,11,NULL,NULL,1,19,'97.1000',2,'97.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(25,12,NULL,NULL,1,19,'150.0000',2,'150.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(26,12,NULL,NULL,1,7,'150.0000',2,'150.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(27,13,NULL,NULL,1,19,'181.0000',2,'181.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(28,13,NULL,NULL,1,7,'181.0000',2,'181.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(29,14,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(30,14,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(31,15,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(32,15,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(33,16,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(34,16,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(35,17,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(36,17,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(37,18,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(38,18,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(39,19,NULL,NULL,1,7,'431.0000',2,'431.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(40,19,NULL,NULL,1,19,'431.0000',2,'431.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(41,20,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(42,20,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(43,21,NULL,NULL,1,7,'431.4000',2,'431.4000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(44,21,NULL,NULL,1,19,'431.4000',2,'431.4000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(45,22,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(46,22,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(47,23,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(48,23,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(49,24,NULL,NULL,1,19,'181.0000',2,'181.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(50,24,NULL,NULL,1,7,'181.0000',2,'181.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(51,25,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(52,25,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(53,26,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(54,26,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(55,27,NULL,NULL,22,22,'181.0000',2,'181.0000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(56,27,NULL,NULL,22,19,'181.0000',2,'181.0000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(57,28,NULL,NULL,22,22,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(58,28,NULL,NULL,22,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(59,29,NULL,NULL,22,22,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(60,29,NULL,NULL,22,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(61,30,NULL,NULL,22,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(62,30,NULL,NULL,22,22,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(63,31,NULL,NULL,22,22,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(64,31,NULL,NULL,22,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(65,32,NULL,NULL,22,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(66,32,NULL,NULL,22,22,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(67,33,NULL,NULL,22,22,'431.4000',2,'431.4000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',0),(68,33,NULL,NULL,22,19,'431.4000',2,'431.4000',2,'2010-07-18','2010-07-18',1,1,'Loan Written Off',1),(69,34,NULL,NULL,7,7,'3000.0000',2,'3000.0000',2,'2010-07-18','2010-07-18',1,1,'-',1),(70,34,NULL,NULL,7,19,'3000.0000',2,'3000.0000',2,'2010-07-18','2010-07-18',1,1,'-',0),(71,35,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(72,35,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(73,35,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(74,35,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(75,36,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(76,36,NULL,NULL,1,7,'216.1000',2,'216.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(77,36,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(78,36,NULL,NULL,1,19,'216.1000',2,'216.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(79,37,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'v',1),(80,37,NULL,NULL,1,7,'216.1000',2,'216.1000',2,'2010-07-18','2010-07-18',1,1,'v',1),(81,37,NULL,NULL,1,19,'216.1000',2,'216.1000',2,'2010-07-18','2010-07-18',1,1,'v',0),(82,37,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'v',0),(83,38,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'v',0),(84,38,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'v',0),(85,38,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-18','2010-07-18',1,1,'v',1),(86,38,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'v',1),(87,39,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(88,39,NULL,NULL,1,19,'227.1000',2,'227.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(89,39,NULL,NULL,1,7,'227.1000',2,'227.1000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(90,39,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(91,40,NULL,NULL,1,19,'43.0000',2,'43.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',1),(92,40,NULL,NULL,1,7,'43.0000',2,'43.0000',2,'2010-07-18','2010-07-18',1,1,'Payment rcvd.',0),(93,41,NULL,NULL,1,7,'43.0000',2,'43.0000',2,'2010-07-18','2010-07-18',1,1,'sss',1),(94,41,NULL,NULL,1,19,'43.0000',2,'43.0000',2,'2010-07-18','2010-07-18',1,1,'sss',0),(95,42,NULL,NULL,1,19,'227.1000',2,'227.1000',2,'2010-07-18','2010-07-18',1,1,'sss',0),(96,42,NULL,NULL,1,7,'227.1000',2,'227.1000',2,'2010-07-18','2010-07-18',1,1,'sss',1),(97,42,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'sss',0),(98,42,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-18','2010-07-18',1,1,'sss',1),(99,43,NULL,NULL,7,19,'3000.0000',2,'3000.0000',2,'2010-07-18','2010-07-18',1,1,'sss',1),(100,43,NULL,NULL,7,7,'3000.0000',2,'3000.0000',2,'2010-07-18','2010-07-18',1,1,'sss',0),(101,44,NULL,NULL,10,36,'666.0000',2,'666.0000',2,'2010-07-18','2010-07-18',1,1,'',1),(102,44,NULL,NULL,10,7,'666.0000',2,'666.0000',2,'2010-07-18','2010-07-18',1,1,'',0),(103,45,NULL,NULL,7,7,'3000.0000',2,'3000.0000',2,'2010-07-21','2010-07-21',1,1,'-',1),(104,45,NULL,NULL,7,19,'3000.0000',2,'3000.0000',2,'2010-07-21','2010-07-21',1,1,'-',0),(105,46,NULL,NULL,9,36,'1200.0000',2,'1200.0000',2,'2010-07-21','2010-07-21',1,1,'',1),(106,46,NULL,NULL,9,7,'1200.0000',2,'1200.0000',2,'2010-07-21','2010-07-21',1,1,'',0),(107,47,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-21','2010-07-21',1,1,'Payment rcvd.',0),(108,47,NULL,NULL,1,19,'75.1000',2,'75.1000',2,'2010-07-21','2010-07-21',1,1,'Payment rcvd.',1),(109,47,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-21','2010-07-21',1,1,'Payment rcvd.',1),(110,47,NULL,NULL,1,7,'75.1000',2,'75.1000',2,'2010-07-21','2010-07-21',1,1,'Payment rcvd.',0),(111,48,NULL,NULL,9,7,'235.0000',2,'235.0000',2,'2010-07-21','2010-07-21',1,1,'',0),(112,48,NULL,NULL,9,36,'235.0000',2,'235.0000',2,'2010-07-21','2010-07-21',1,1,'',1),(113,49,NULL,NULL,11,7,'235.0000',2,'235.0000',2,'2010-07-21','2010-07-21',1,1,'',1),(114,49,NULL,NULL,11,36,'235.0000',2,'235.0000',2,'2010-07-21','2010-07-21',1,1,'',0),(115,50,NULL,NULL,7,7,'3000.0000',2,'3000.0000',2,'2010-07-22','2010-07-22',1,1,'-',1),(116,50,NULL,NULL,7,19,'3000.0000',2,'3000.0000',2,'2010-07-22','2010-07-22',1,1,'-',0),(117,51,NULL,NULL,7,19,'6000.0000',2,'6000.0000',2,'2010-07-22','2010-07-22',1,1,'-',0),(118,51,NULL,NULL,7,7,'6000.0000',2,'6000.0000',2,'2010-07-22','2010-07-22',1,1,'-',1),(119,52,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(120,52,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(121,53,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(122,53,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(123,54,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(124,54,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(125,55,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(126,55,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(127,56,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(128,56,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(129,57,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(130,57,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(131,58,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(132,58,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(133,59,NULL,NULL,22,19,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(134,59,NULL,NULL,22,22,'666.2000',2,'666.2000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(135,60,NULL,NULL,22,22,'670.4000',2,'670.4000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',0),(136,60,NULL,NULL,22,19,'670.4000',2,'670.4000',2,'2010-07-23','2010-07-23',1,1,'Loan Written Off',1),(137,61,NULL,NULL,2,7,'2.9000',2,'2.9000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(138,61,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(139,61,NULL,NULL,2,40,'2.9000',2,'2.9000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(140,61,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(141,62,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(142,62,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(143,63,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(144,63,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(145,64,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(146,64,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(147,65,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(148,65,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(149,66,NULL,NULL,1,7,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(150,66,NULL,NULL,1,19,'428.1000',2,'428.1000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(151,67,NULL,NULL,1,19,'431.0000',2,'431.0000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',1),(152,67,NULL,NULL,1,7,'431.0000',2,'431.0000',2,'2010-07-24','2010-07-24',1,1,'Payment rcvd.',0),(153,68,NULL,NULL,10,33,'777.0000',2,'777.0000',2,'2010-07-25','2010-07-25',1,1,'',1),(154,68,NULL,NULL,10,7,'777.0000',2,'777.0000',2,'2010-07-25','2010-07-25',1,1,'',0),(155,69,NULL,NULL,10,7,'90.0000',2,'90.0000',2,'2010-07-28','2010-07-28',1,1,'',0),(156,69,NULL,NULL,10,33,'90.0000',2,'90.0000',2,'2010-07-28','2010-07-28',1,1,'',1),(157,70,NULL,NULL,9,7,'15.0000',2,'15.0000',2,'2010-07-31','2010-07-31',1,1,'',0),(158,70,NULL,NULL,9,36,'15.0000',2,'15.0000',2,'2010-07-31','2010-07-31',1,1,'',1),(159,74,NULL,NULL,14,56,'0.1000',2,'0.1000',2,'2010-08-04','2010-07-31',NULL,1,'',0),(160,74,NULL,NULL,14,36,'0.1000',2,'0.1000',2,'2010-08-04','2010-07-31',NULL,1,'',1),(161,83,NULL,NULL,3,50,'10.0000',2,'10.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(162,83,NULL,NULL,3,7,'10.0000',2,'10.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(163,84,NULL,NULL,3,50,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(164,84,NULL,NULL,3,50,'30.0000',2,'30.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(165,84,NULL,NULL,3,50,'40.0000',2,'40.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(166,84,NULL,NULL,3,7,'40.0000',2,'40.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(167,84,NULL,NULL,3,7,'30.0000',2,'30.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(168,84,NULL,NULL,3,7,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(169,85,NULL,NULL,9,7,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'',0),(170,85,NULL,NULL,9,36,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'',1),(171,86,NULL,NULL,3,7,'40.0000',2,'40.0000',2,'2010-08-27','2010-08-27',1,1,'fdsf',1),(172,86,NULL,NULL,3,50,'40.0000',2,'40.0000',2,'2010-08-27','2010-08-27',1,1,'fdsf',0),(173,86,NULL,NULL,3,7,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'fdsf',1),(174,86,NULL,NULL,3,7,'30.0000',2,'30.0000',2,'2010-08-27','2010-08-27',1,1,'fdsf',1),(175,86,NULL,NULL,3,50,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'fdsf',0),(176,86,NULL,NULL,3,50,'30.0000',2,'30.0000',2,'2010-08-27','2010-08-27',1,1,'fdsf',0),(177,87,NULL,NULL,16,50,'2.0000',2,'2.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(178,87,NULL,NULL,3,7,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(179,87,NULL,NULL,3,50,'20.0000',2,'20.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(180,87,NULL,NULL,3,7,'33.0000',2,'33.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(181,87,NULL,NULL,3,50,'30.0000',2,'30.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(182,87,NULL,NULL,6,42,'4.0000',2,'4.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(183,87,NULL,NULL,6,7,'4.0000',2,'4.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(184,87,NULL,NULL,16,7,'2.0000',2,'2.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(185,87,NULL,NULL,3,50,'33.0000',2,'33.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(186,87,NULL,NULL,3,7,'30.0000',2,'30.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(187,87,NULL,NULL,3,50,'40.0000',2,'40.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',1),(188,87,NULL,NULL,3,7,'40.0000',2,'40.0000',2,'2010-08-27','2010-08-27',1,1,'Payment rcvd.',0),(189,88,NULL,NULL,3,50,'70.0000',2,'70.0000',2,'2010-08-28','2010-08-28',1,1,'-',1),(190,88,NULL,NULL,3,7,'70.0000',2,'70.0000',2,'2010-08-28','2010-08-28',1,1,'-',0),(191,89,NULL,NULL,7,7,'5000.0000',2,'5000.0000',2,'2010-08-28','2010-08-28',1,1,'-',1),(192,89,NULL,NULL,7,13,'5000.0000',2,'5000.0000',2,'2010-08-28','2010-08-28',1,1,'-',0),(193,90,NULL,NULL,3,7,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(194,90,NULL,NULL,3,50,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(195,90,NULL,NULL,1,13,'307.3000',2,'307.3000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(196,90,NULL,NULL,2,7,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(197,90,NULL,NULL,6,42,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(198,90,NULL,NULL,3,50,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(199,90,NULL,NULL,4,7,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(200,90,NULL,NULL,3,7,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(201,90,NULL,NULL,2,40,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(202,90,NULL,NULL,3,50,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(203,90,NULL,NULL,4,50,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(204,90,NULL,NULL,1,7,'307.3000',2,'307.3000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(205,90,NULL,NULL,3,7,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(206,90,NULL,NULL,6,7,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(207,91,NULL,NULL,3,50,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(208,91,NULL,NULL,2,40,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(209,91,NULL,NULL,1,7,'307.3000',2,'307.3000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(210,91,NULL,NULL,3,50,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(211,91,NULL,NULL,4,7,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(212,91,NULL,NULL,1,13,'307.3000',2,'307.3000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(213,91,NULL,NULL,3,7,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(214,91,NULL,NULL,6,42,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(215,91,NULL,NULL,4,50,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(216,91,NULL,NULL,6,7,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(217,91,NULL,NULL,2,7,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(218,91,NULL,NULL,3,7,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(219,91,NULL,NULL,3,7,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',1),(220,91,NULL,NULL,3,50,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'asdf',0),(221,92,NULL,NULL,2,40,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(222,92,NULL,NULL,6,7,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(223,92,NULL,NULL,3,7,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(224,92,NULL,NULL,6,42,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(225,92,NULL,NULL,3,50,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(226,92,NULL,NULL,3,50,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(227,92,NULL,NULL,2,7,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(228,92,NULL,NULL,3,7,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(229,92,NULL,NULL,4,7,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(230,92,NULL,NULL,1,13,'621.3000',2,'621.3000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(231,92,NULL,NULL,1,7,'621.3000',2,'621.3000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(232,92,NULL,NULL,3,50,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(233,92,NULL,NULL,3,7,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(234,92,NULL,NULL,4,50,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(235,93,NULL,NULL,3,50,'1.0000',2,'1.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',1),(236,93,NULL,NULL,3,7,'1.0000',2,'1.0000',2,'2010-08-28','2010-08-28',1,1,'Payment rcvd.',0),(237,94,NULL,NULL,3,7,'1.0000',2,'1.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(238,94,NULL,NULL,3,50,'1.0000',2,'1.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(239,95,NULL,NULL,2,7,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(240,95,NULL,NULL,3,50,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(241,95,NULL,NULL,2,40,'7.7000',2,'7.7000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(242,95,NULL,NULL,3,7,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(243,95,NULL,NULL,3,50,'90.0000',2,'90.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(244,95,NULL,NULL,1,13,'621.3000',2,'621.3000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(245,95,NULL,NULL,6,42,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(246,95,NULL,NULL,4,7,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(247,95,NULL,NULL,3,50,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(248,95,NULL,NULL,3,7,'60.0000',2,'60.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(249,95,NULL,NULL,4,50,'222.0000',2,'222.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(250,95,NULL,NULL,6,7,'333.0000',2,'333.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(251,95,NULL,NULL,3,7,'80.0000',2,'80.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(252,95,NULL,NULL,1,7,'621.3000',2,'621.3000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(253,96,NULL,NULL,7,7,'5000.0000',2,'5000.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(254,96,NULL,NULL,7,13,'5000.0000',2,'5000.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1),(255,97,NULL,NULL,3,50,'70.0000',2,'70.0000',2,'2010-08-28','2010-08-28',1,1,'asf',0),(256,97,NULL,NULL,3,7,'70.0000',2,'70.0000',2,'2010-08-28','2010-08-28',1,1,'asf',1);
/*!40000 ALTER TABLE `financial_trxn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freq_of_deposits`
--

DROP TABLE IF EXISTS `freq_of_deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freq_of_deposits` (
  `freq_of_deposits_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`freq_of_deposits_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `freq_of_deposits_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freq_of_deposits`
--

LOCK TABLES `freq_of_deposits` WRITE;
/*!40000 ALTER TABLE `freq_of_deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `freq_of_deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund` (
  `fund_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fund_name` varchar(100) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  `fundcode_id` smallint(6) NOT NULL,
  PRIMARY KEY (`fund_id`),
  KEY `fundcode_id` (`fundcode_id`),
  CONSTRAINT `fund_ibfk_1` FOREIGN KEY (`fundcode_id`) REFERENCES `fund_code` (`fundcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
INSERT INTO `fund` VALUES (1,'Non Donor',0,1),(2,'Funding Org A',0,1),(3,'Funding Org B',0,1),(4,'Funding Org C',0,1),(5,'Funding Org D',0,1);
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_code`
--

DROP TABLE IF EXISTS `fund_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_code` (
  `fundcode_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fundcode_value` varchar(50) NOT NULL,
  PRIMARY KEY (`fundcode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_code`
--

LOCK TABLES `fund_code` WRITE;
/*!40000 ALTER TABLE `fund_code` DISABLE KEYS */;
INSERT INTO `fund_code` VALUES (1,'00'),(2,'01'),(3,'02'),(4,'03'),(5,'04');
/*!40000 ALTER TABLE `fund_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gl_code`
--

DROP TABLE IF EXISTS `gl_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gl_code` (
  `glcode_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `glcode_value` varchar(50) NOT NULL,
  PRIMARY KEY (`glcode_id`),
  UNIQUE KEY `glcode_value_idx` (`glcode_value`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gl_code`
--

LOCK TABLES `gl_code` WRITE;
/*!40000 ALTER TABLE `gl_code` DISABLE KEYS */;
INSERT INTO `gl_code` VALUES (1,'10000'),(2,'11000'),(3,'11100'),(4,'11101'),(5,'11102'),(6,'11200'),(7,'11201'),(8,'11202'),(9,'13000'),(10,'13100'),(20,'13101'),(21,'13200'),(22,'13201'),(11,'1501'),(12,'1502'),(13,'1503'),(14,'1504'),(15,'1505'),(16,'1506'),(17,'1507'),(18,'1508'),(19,'1509'),(23,'20000'),(24,'22000'),(25,'22100'),(26,'22101'),(27,'23000'),(28,'23100'),(33,'23101'),(34,'24000'),(35,'24100'),(36,'24101'),(37,'30000'),(38,'31000'),(39,'31100'),(41,'31101'),(42,'31102'),(43,'31300'),(50,'31301'),(51,'31401'),(52,'40000'),(53,'41000'),(54,'41100'),(55,'41101'),(56,'41102'),(29,'4601'),(30,'4602'),(31,'4603'),(32,'4606'),(40,'5001'),(44,'5201'),(45,'5202'),(46,'5203'),(47,'5204'),(48,'5205'),(49,'6201');
/*!40000 ALTER TABLE `gl_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grace_period_type`
--

DROP TABLE IF EXISTS `grace_period_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grace_period_type` (
  `grace_period_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`grace_period_type_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `grace_period_type_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grace_period_type`
--

LOCK TABLES `grace_period_type` WRITE;
/*!40000 ALTER TABLE `grace_period_type` DISABLE KEYS */;
INSERT INTO `grace_period_type` VALUES (1,96),(2,97),(3,98);
/*!40000 ALTER TABLE `grace_period_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_loan_counter`
--

DROP TABLE IF EXISTS `group_loan_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_loan_counter` (
  `group_loan_counter_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_perf_id` int(11) NOT NULL,
  `loan_offering_id` smallint(6) NOT NULL,
  `loan_cycle_counter` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_loan_counter_id`),
  KEY `group_perf_id` (`group_perf_id`),
  CONSTRAINT `group_loan_counter_ibfk_1` FOREIGN KEY (`group_perf_id`) REFERENCES `group_perf_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_loan_counter`
--

LOCK TABLES `group_loan_counter` WRITE;
/*!40000 ALTER TABLE `group_loan_counter` DISABLE KEYS */;
INSERT INTO `group_loan_counter` VALUES (1,27,5,0);
/*!40000 ALTER TABLE `group_loan_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_perf_history`
--

DROP TABLE IF EXISTS `group_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_perf_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `no_of_clients` smallint(6) DEFAULT NULL,
  `last_group_loan_amnt_disb` decimal(21,4) DEFAULT NULL,
  `last_group_loan_amnt_disb_currency_id` smallint(6) DEFAULT NULL,
  `avg_loan_size` decimal(21,4) DEFAULT NULL,
  `avg_loan_size_currency_id` smallint(6) DEFAULT NULL,
  `total_outstand_loan_amnt` decimal(21,4) DEFAULT NULL,
  `total_outstand_loan_amnt_currency_id` smallint(6) DEFAULT NULL,
  `portfolio_at_risk` decimal(21,4) DEFAULT NULL,
  `portfolio_at_risk_currency_id` smallint(6) DEFAULT NULL,
  `total_savings_amnt` decimal(21,4) DEFAULT NULL,
  `total_savings_amnt_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `group_perf_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_perf_history`
--

LOCK TABLES `group_perf_history` WRITE;
/*!40000 ALTER TABLE `group_perf_history` DISABLE KEYS */;
INSERT INTO `group_perf_history` VALUES (1,2,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(2,5,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(3,8,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(4,12,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(5,15,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(6,20,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(7,21,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(8,22,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(9,26,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(10,27,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(11,29,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(12,33,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(13,35,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(14,37,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(15,39,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(16,41,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,42,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(18,46,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(19,48,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(20,49,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(21,52,0,NULL,NULL,NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL),(22,53,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(23,56,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,57,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,58,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(26,62,0,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(27,65,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `group_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `holiday_from_date` date NOT NULL,
  `holiday_thru_date` date DEFAULT NULL,
  `holiday_name` varchar(100) DEFAULT NULL,
  `repayment_rule_id` smallint(6) NOT NULL,
  `holiday_changes_applied_flag` smallint(6) DEFAULT '1',
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`holiday_id`),
  KEY `repayment_rule_id` (`repayment_rule_id`),
  CONSTRAINT `holiday_ibfk_2` FOREIGN KEY (`repayment_rule_id`) REFERENCES `repayment_rule` (`repayment_rule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imported_transactions_files`
--

DROP TABLE IF EXISTS `imported_transactions_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imported_transactions_files` (
  `file_name` varchar(100) NOT NULL,
  `submitted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `submitted_by` smallint(6) NOT NULL,
  PRIMARY KEY (`file_name`),
  KEY `submitted_by` (`submitted_by`),
  CONSTRAINT `imported_transactions_files_ibfk_1` FOREIGN KEY (`submitted_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imported_transactions_files`
--

LOCK TABLES `imported_transactions_files` WRITE;
/*!40000 ALTER TABLE `imported_transactions_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `imported_transactions_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inherited_meeting`
--

DROP TABLE IF EXISTS `inherited_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inherited_meeting` (
  `meeting_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `meeting_id` (`meeting_id`),
  CONSTRAINT `inherited_meeting_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `inherited_meeting_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `customer_meeting` (`customer_meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inherited_meeting`
--

LOCK TABLES `inherited_meeting` WRITE;
/*!40000 ALTER TABLE `inherited_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `inherited_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_offering`
--

DROP TABLE IF EXISTS `insurance_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_offering` (
  `prd_offering_id` smallint(6) NOT NULL,
  PRIMARY KEY (`prd_offering_id`),
  CONSTRAINT `insurance_offering_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_offering`
--

LOCK TABLES `insurance_offering` WRITE;
/*!40000 ALTER TABLE `insurance_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_calc_rule`
--

DROP TABLE IF EXISTS `interest_calc_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_calc_rule` (
  `interest_calc_rule_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`interest_calc_rule_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `interest_calc_rule_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_calc_rule`
--

LOCK TABLES `interest_calc_rule` WRITE;
/*!40000 ALTER TABLE `interest_calc_rule` DISABLE KEYS */;
INSERT INTO `interest_calc_rule` VALUES (1,88),(2,89);
/*!40000 ALTER TABLE `interest_calc_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_calculation_types`
--

DROP TABLE IF EXISTS `interest_calculation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_calculation_types` (
  `interest_calculation_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `interest_calculation_lookup_id` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`interest_calculation_type_id`),
  KEY `interest_calculation_lookup_id` (`interest_calculation_lookup_id`),
  CONSTRAINT `interest_calculation_types_ibfk_1` FOREIGN KEY (`interest_calculation_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_calculation_types`
--

LOCK TABLES `interest_calculation_types` WRITE;
/*!40000 ALTER TABLE `interest_calculation_types` DISABLE KEYS */;
INSERT INTO `interest_calculation_types` VALUES (1,122,NULL),(2,123,NULL);
/*!40000 ALTER TABLE `interest_calculation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_types`
--

DROP TABLE IF EXISTS `interest_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_types` (
  `interest_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  `category_id` smallint(6) NOT NULL,
  `descripton` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`interest_type_id`),
  KEY `category_id` (`category_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `interest_types_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `prd_type` (`prd_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `interest_types_ibfk_2` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_types`
--

LOCK TABLES `interest_types` WRITE;
/*!40000 ALTER TABLE `interest_types` DISABLE KEYS */;
INSERT INTO `interest_types` VALUES (1,79,1,'Flat'),(2,80,1,'Declining'),(4,604,1,'Declining Balance-Equal Principal Installment');
/*!40000 ALTER TABLE `interest_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `lang_id` smallint(6) NOT NULL,
  `lang_name` varchar(100) DEFAULT NULL,
  `lang_short_name` varchar(10) DEFAULT NULL,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`lang_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `language_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English','EN',189),(2,'Icelandic','is',599),(3,'Spanish','es',600),(4,'French','fr',601),(5,'Chinese','zh',613),(6,'Swahili','sw',614),(7,'Arabic','ar',615),(8,'Portuguese','pt',616),(9,'Khmer','km',617),(10,'Lao','lo',618),(11,'Hungarian','hu',624);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_account`
--

DROP TABLE IF EXISTS `loan_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_account` (
  `account_id` int(11) NOT NULL,
  `business_activities_id` int(11) DEFAULT NULL,
  `collateral_type_id` int(11) DEFAULT NULL,
  `grace_period_type_id` smallint(6) NOT NULL,
  `group_flag` smallint(6) DEFAULT NULL,
  `loan_amount` decimal(21,4) DEFAULT NULL,
  `loan_amount_currency_id` smallint(6) DEFAULT NULL,
  `loan_balance` decimal(21,4) DEFAULT NULL,
  `loan_balance_currency_id` smallint(6) DEFAULT NULL,
  `interest_type_id` smallint(6) DEFAULT NULL,
  `interest_rate` decimal(13,10) DEFAULT NULL,
  `fund_id` smallint(6) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `no_of_installments` smallint(6) NOT NULL,
  `disbursement_date` date DEFAULT NULL,
  `collateral_note` varchar(500) DEFAULT NULL,
  `grace_period_duration` smallint(6) DEFAULT NULL,
  `interest_at_disb` smallint(6) DEFAULT NULL,
  `grace_period_penalty` smallint(6) DEFAULT NULL,
  `prd_offering_id` smallint(6) DEFAULT NULL,
  `redone` smallint(6) NOT NULL,
  `parent_account_id` int(11) DEFAULT NULL,
  `month_rank` smallint(6) DEFAULT NULL,
  `month_week` smallint(6) DEFAULT NULL,
  `recur_month` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `currency_id` (`currency_id`),
  KEY `loan_amount_currency_id` (`loan_amount_currency_id`),
  KEY `loan_balance_currency_id` (`loan_balance_currency_id`),
  KEY `fund_id` (`fund_id`),
  KEY `grace_period_type_id` (`grace_period_type_id`),
  KEY `interest_type_id` (`interest_type_id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `fk_loan_col_type_id` (`collateral_type_id`),
  KEY `fk_loan_bus_act_id` (`business_activities_id`),
  KEY `fk_loan_prd_off_id` (`prd_offering_id`),
  KEY `fk_loan_account` (`parent_account_id`),
  CONSTRAINT `fk_loan_account` FOREIGN KEY (`parent_account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_acc_id` FOREIGN KEY (`parent_account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_bus_act_id` FOREIGN KEY (`business_activities_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_col_type_id` FOREIGN KEY (`collateral_type_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_loan_prd_off_id` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_3` FOREIGN KEY (`loan_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_4` FOREIGN KEY (`loan_balance_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_5` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_6` FOREIGN KEY (`grace_period_type_id`) REFERENCES `grace_period_type` (`grace_period_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_7` FOREIGN KEY (`interest_type_id`) REFERENCES `interest_types` (`interest_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_account_ibfk_8` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_account`
--

LOCK TABLES `loan_account` WRITE;
/*!40000 ALTER TABLE `loan_account` DISABLE KEYS */;
INSERT INTO `loan_account` VALUES (4,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,7,NULL,7,'2010-07-16','',0,0,0,1,0,NULL,NULL,NULL,NULL),(8,NULL,NULL,1,NULL,'6000.0000',2,'6000.0000',2,1,'5.0000000000',3,11,NULL,9,'2010-07-08','',0,0,0,4,0,NULL,NULL,NULL,NULL),(15,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,15,NULL,7,'2010-07-08','',0,0,0,1,0,NULL,NULL,NULL,NULL),(16,NULL,NULL,1,NULL,'6000.0000',2,'6000.0000',2,1,'5.0000000000',3,16,NULL,9,'2010-07-08','',0,0,0,4,0,NULL,NULL,NULL,NULL),(21,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,19,NULL,7,'2010-07-18','',0,0,0,1,0,NULL,NULL,NULL,NULL),(23,NULL,NULL,1,NULL,'6000.0000',2,'6000.0000',2,1,'5.0000000000',3,21,NULL,9,'2010-07-24','',0,0,0,4,0,NULL,NULL,NULL,NULL),(32,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',NULL,26,NULL,7,'2010-07-21','',0,0,0,1,0,NULL,NULL,NULL,NULL),(38,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',NULL,29,NULL,7,'2010-07-22','',0,0,0,1,0,NULL,NULL,NULL,NULL),(44,NULL,NULL,1,NULL,'6000.0000',2,'6000.0000',2,1,'5.0000000000',NULL,31,NULL,9,'2010-07-22','',0,0,0,4,0,NULL,NULL,NULL,NULL),(53,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',NULL,39,NULL,7,'2010-07-29','',0,0,0,1,0,NULL,NULL,NULL,NULL),(55,NULL,NULL,1,NULL,'5000.0000',2,'5000.0000',2,2,'8.0000000000',5,46,NULL,8,'2010-07-28','',0,0,0,5,0,NULL,NULL,NULL,NULL),(59,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,49,NULL,7,'2010-07-28','',0,0,0,1,0,NULL,NULL,NULL,NULL),(66,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,54,NULL,7,'2010-07-28','',0,0,0,1,0,NULL,NULL,NULL,NULL),(78,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,60,NULL,7,'2010-08-02','',0,0,0,1,0,NULL,NULL,NULL,NULL),(86,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',2,67,NULL,7,'2010-08-02','',0,0,0,1,0,NULL,NULL,NULL,NULL),(91,NULL,NULL,1,NULL,'3000.0000',2,'3000.0000',2,1,'5.0000000000',NULL,71,NULL,7,'2010-08-02','',0,0,0,1,0,NULL,NULL,NULL,NULL),(112,NULL,NULL,1,NULL,'5000.0000',2,'5000.0000',2,2,'8.0000000000',5,87,NULL,8,'2010-08-28','',0,0,0,5,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `loan_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_activity_details`
--

DROP TABLE IF EXISTS `loan_activity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_activity_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` smallint(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comments` varchar(100) NOT NULL,
  `principal_amount` decimal(21,4) DEFAULT NULL,
  `principal_amount_currency_id` smallint(6) DEFAULT NULL,
  `interest_amount` decimal(21,4) DEFAULT NULL,
  `interest_amount_currency_id` smallint(6) DEFAULT NULL,
  `penalty_amount` decimal(21,4) DEFAULT NULL,
  `penalty_amount_currency_id` smallint(6) DEFAULT NULL,
  `fee_amount` decimal(21,4) DEFAULT NULL,
  `fee_amount_currency_id` smallint(6) DEFAULT NULL,
  `balance_principal_amount` decimal(21,4) DEFAULT NULL,
  `balance_principal_amount_currency_id` smallint(6) DEFAULT NULL,
  `balance_interest_amount` decimal(21,4) DEFAULT NULL,
  `balance_interest_amount_currency_id` smallint(6) DEFAULT NULL,
  `balance_penalty_amount` decimal(21,4) DEFAULT NULL,
  `balance_penalty_amount_currency_id` smallint(6) DEFAULT NULL,
  `balance_fee_amount` decimal(21,4) DEFAULT NULL,
  `balance_fee_amount_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `account_id` (`account_id`),
  KEY `principal_amount_currency_id` (`principal_amount_currency_id`),
  KEY `interest_amount_currency_id` (`interest_amount_currency_id`),
  KEY `fee_amount_currency_id` (`fee_amount_currency_id`),
  KEY `penalty_amount_currency_id` (`penalty_amount_currency_id`),
  KEY `balance_principal_amount_currency_id` (`balance_principal_amount_currency_id`),
  KEY `balance_interest_amount_currency_id` (`balance_interest_amount_currency_id`),
  KEY `balance_penalty_amount_currency_id` (`balance_penalty_amount_currency_id`),
  KEY `balance_fee_amount_currency_id` (`balance_fee_amount_currency_id`),
  CONSTRAINT `loan_activity_details_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_10` FOREIGN KEY (`balance_fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_3` FOREIGN KEY (`principal_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_4` FOREIGN KEY (`interest_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_5` FOREIGN KEY (`fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_6` FOREIGN KEY (`penalty_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_7` FOREIGN KEY (`balance_principal_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_8` FOREIGN KEY (`balance_interest_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_activity_details_ibfk_9` FOREIGN KEY (`balance_penalty_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_activity_details`
--

LOCK TABLES `loan_activity_details` WRITE;
/*!40000 ALTER TABLE `loan_activity_details` DISABLE KEYS */;
INSERT INTO `loan_activity_details` VALUES (1,1,4,'2010-07-15 14:00:00','Loan Disbursal','3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(2,1,4,'2010-07-17 14:00:00','Payment rcvd.','97.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'2902.9000',2,'18.1000',2,'0.0000',2,'0.0000',2),(3,1,4,'2010-07-17 14:00:00','Payment rcvd.','150.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'2752.9000',2,'18.1000',2,'0.0000',2,'0.0000',2),(4,1,4,'2010-07-18 06:12:59','Loan Repayment','2752.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(5,1,4,'2010-07-17 14:00:00','Loan Adjusted','2752.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'2752.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(6,1,4,'2010-07-18 06:48:59','Loan Written Off','2752.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'2752.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(7,1,21,'2010-07-17 14:00:00','Loan Disbursal','3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(8,1,21,'2010-07-17 14:00:00','Payment rcvd.','644.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'2355.8000',2,'15.2000',2,'0.0000',2,'0.0000',2),(9,1,21,'2010-07-17 14:00:00','Loan Adjusted','644.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(10,1,21,'2010-07-17 14:00:00','Payment rcvd.','227.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'2772.9000',2,'18.1000',2,'0.0000',2,'0.0000',2),(11,1,21,'2010-07-17 14:00:00','Payment rcvd.','43.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'2729.9000',2,'18.1000',2,'0.0000',2,'0.0000',2),(12,1,21,'2010-07-17 14:00:00','Loan Reversal','43.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'2772.9000',2,'18.1000',2,'0.0000',2,'0.0000',2),(13,1,21,'2010-07-17 14:00:00','Loan Reversal','227.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(14,1,21,'2010-07-17 14:00:00','Loan Reversal','0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(15,1,21,'2010-07-17 14:00:00','Disbursal Adjusted','3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(16,1,32,'2010-07-20 14:00:00','Loan Disbursal','3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(17,1,32,'2010-07-20 14:00:00','Payment rcvd.','75.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'2924.9000',2,'18.1000',2,'0.0000',2,'0.0000',2),(18,1,38,'2010-07-21 14:00:00','Loan Disbursal','3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2),(19,1,44,'2010-07-21 14:00:00','Loan Disbursal','6000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'6000.0000',2,'52.0000',2,'0.0000',2,'0.0000',2),(20,1,44,'2010-07-23 04:26:12','Loan Written Off','6000.0000',2,'5.8000',2,'0.0000',2,'0.0000',2,'6000.0000',2,'5.8000',2,'0.0000',2,'0.0000',2),(21,1,38,'2010-07-24 08:23:07','Loan Repayment','3000.0000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(22,1,112,'2010-08-28 11:03:13','Misc fees applied','0.0000',2,'0.0000',2,'0.0000',2,'222.0000',2,'5000.0000',2,'35.0000',2,'0.0000',2,'1152.0000',2),(23,1,112,'2010-08-28 11:03:25','Misc penalty applied','0.0000',2,'0.0000',2,'333.0000',2,'0.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1152.0000',2),(24,1,112,'2010-08-27 14:00:00','Loan Disbursal','5000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1152.0000',2),(25,1,112,'2010-08-27 14:00:00','Payment rcvd.','0.0000',2,'0.0000',2,'0.0000',2,'70.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1082.0000',2),(26,1,112,'2010-08-27 14:00:00','Payment rcvd.','307.3000',2,'7.7000',2,'333.0000',2,'452.0000',2,'4692.7000',2,'27.3000',2,'0.0000',2,'630.0000',2),(27,1,112,'2010-08-27 14:00:00','Loan Adjusted','307.3000',2,'7.7000',2,'333.0000',2,'452.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1082.0000',2),(28,1,112,'2010-08-27 14:00:00','Payment rcvd.','621.3000',2,'7.7000',2,'333.0000',2,'453.0000',2,'4378.7000',2,'27.3000',2,'0.0000',2,'629.0000',2),(29,1,112,'2010-08-27 14:00:00','Loan Reversal','621.3000',2,'7.7000',2,'333.0000',2,'453.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1082.0000',2),(30,1,112,'2010-08-27 14:00:00','Loan Reversal','0.0000',2,'0.0000',2,'0.0000',2,'70.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1152.0000',2),(31,1,112,'2010-08-27 14:00:00','Disbursal Adjusted','5000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'5000.0000',2,'35.0000',2,'333.0000',2,'1152.0000',2);
/*!40000 ALTER TABLE `loan_activity_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_amount_from_last_loan`
--

DROP TABLE IF EXISTS `loan_amount_from_last_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_amount_from_last_loan` (
  `loan_amount_from_last_loan_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `start_range` decimal(21,4) NOT NULL,
  `end_range` decimal(21,4) NOT NULL,
  `min_loan_amount` decimal(21,4) NOT NULL,
  `max_loan_amnt` decimal(21,4) NOT NULL,
  `default_loan_amount` decimal(21,4) NOT NULL,
  PRIMARY KEY (`loan_amount_from_last_loan_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `loan_amount_from_last_loan_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_amount_from_last_loan`
--

LOCK TABLES `loan_amount_from_last_loan` WRITE;
/*!40000 ALTER TABLE `loan_amount_from_last_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_amount_from_last_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_amount_from_loan_cycle`
--

DROP TABLE IF EXISTS `loan_amount_from_loan_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_amount_from_loan_cycle` (
  `loan_amount_from_loan_cycle_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `min_loan_amount` decimal(21,4) NOT NULL,
  `max_loan_amnt` decimal(21,4) NOT NULL,
  `default_loan_amount` decimal(21,4) NOT NULL,
  `range_index` smallint(6) NOT NULL,
  PRIMARY KEY (`loan_amount_from_loan_cycle_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `loan_amount_from_loan_cycle_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_amount_from_loan_cycle`
--

LOCK TABLES `loan_amount_from_loan_cycle` WRITE;
/*!40000 ALTER TABLE `loan_amount_from_loan_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_amount_from_loan_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_amount_same_for_all_loan`
--

DROP TABLE IF EXISTS `loan_amount_same_for_all_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_amount_same_for_all_loan` (
  `loan_amount_same_for_all_loan_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `min_loan_amount` decimal(21,4) NOT NULL,
  `max_loan_amnt` decimal(21,4) NOT NULL,
  `default_loan_amount` decimal(21,4) NOT NULL,
  PRIMARY KEY (`loan_amount_same_for_all_loan_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `loan_amount_same_for_all_loan_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_amount_same_for_all_loan`
--

LOCK TABLES `loan_amount_same_for_all_loan` WRITE;
/*!40000 ALTER TABLE `loan_amount_same_for_all_loan` DISABLE KEYS */;
INSERT INTO `loan_amount_same_for_all_loan` VALUES (4,5,'2345.0000','6000.0000','5000.0000'),(5,1,'1000.0000','5000.0000','3000.0000'),(6,4,'2000.0000','6000.0000','6000.0000');
/*!40000 ALTER TABLE `loan_amount_same_for_all_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_arrears_aging`
--

DROP TABLE IF EXISTS `loan_arrears_aging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_arrears_aging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `parent_customer_id` int(11) DEFAULT NULL,
  `office_id` smallint(6) NOT NULL,
  `days_in_arrears` smallint(6) NOT NULL,
  `overdue_principal` decimal(21,4) DEFAULT NULL,
  `overdue_principal_currency_id` smallint(6) DEFAULT NULL,
  `overdue_interest` decimal(21,4) DEFAULT NULL,
  `overdue_interest_currency_id` smallint(6) DEFAULT NULL,
  `overdue_balance` decimal(21,4) DEFAULT NULL,
  `overdue_balance_currency_id` smallint(6) DEFAULT NULL,
  `unpaid_principal` decimal(21,4) DEFAULT NULL,
  `unpaid_principal_currency_id` smallint(6) DEFAULT NULL,
  `unpaid_interest` decimal(21,4) DEFAULT NULL,
  `unpaid_interest_currency_id` smallint(6) DEFAULT NULL,
  `unpaid_balance` decimal(21,4) DEFAULT NULL,
  `unpaid_balance_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `customer_id` (`customer_id`),
  KEY `parent_customer_id` (`parent_customer_id`),
  KEY `office_id` (`office_id`),
  KEY `overdue_principal_currency_id` (`overdue_principal_currency_id`),
  KEY `overdue_interest_currency_id` (`overdue_interest_currency_id`),
  KEY `overdue_balance_currency_id` (`overdue_balance_currency_id`),
  KEY `unpaid_principal_currency_id` (`unpaid_principal_currency_id`),
  KEY `unpaid_interest_currency_id` (`unpaid_interest_currency_id`),
  KEY `unpaid_balance_currency_id` (`unpaid_balance_currency_id`),
  CONSTRAINT `loan_arrears_aging_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_10` FOREIGN KEY (`unpaid_balance_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_3` FOREIGN KEY (`parent_customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_4` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_5` FOREIGN KEY (`overdue_principal_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_6` FOREIGN KEY (`overdue_interest_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_7` FOREIGN KEY (`overdue_balance_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_8` FOREIGN KEY (`unpaid_principal_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_arrears_aging_ibfk_9` FOREIGN KEY (`unpaid_interest_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_arrears_aging`
--

LOCK TABLES `loan_arrears_aging` WRITE;
/*!40000 ALTER TABLE `loan_arrears_aging` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_arrears_aging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_counter`
--

DROP TABLE IF EXISTS `loan_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_counter` (
  `loan_counter_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_perf_id` int(11) NOT NULL,
  `loan_offering_id` smallint(6) NOT NULL,
  `loan_cycle_counter` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`loan_counter_id`),
  KEY `loan_counter_client_perf_idx` (`client_perf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_counter`
--

LOCK TABLES `loan_counter` WRITE;
/*!40000 ALTER TABLE `loan_counter` DISABLE KEYS */;
INSERT INTO `loan_counter` VALUES (1,1,1,0),(2,7,1,1),(3,11,1,1),(4,12,4,0);
/*!40000 ALTER TABLE `loan_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_fee_schedule`
--

DROP TABLE IF EXISTS `loan_fee_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_fee_schedule` (
  `account_fees_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `installment_id` int(11) NOT NULL,
  `fee_id` smallint(6) NOT NULL,
  `account_fee_id` int(11) NOT NULL,
  `amount` decimal(21,4) DEFAULT NULL,
  `amount_currency_id` smallint(6) DEFAULT NULL,
  `amount_paid` decimal(21,4) NOT NULL,
  `amount_paid_currency_id` smallint(6) NOT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`account_fees_detail_id`),
  KEY `id` (`id`),
  KEY `amount_currency_id` (`amount_currency_id`),
  KEY `amount_paid_currency_id` (`amount_paid_currency_id`),
  KEY `fee_id` (`fee_id`),
  KEY `account_fee_id` (`account_fee_id`),
  CONSTRAINT `loan_fee_schedule_ibfk_1` FOREIGN KEY (`id`) REFERENCES `loan_schedule` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_fee_schedule_ibfk_2` FOREIGN KEY (`amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_fee_schedule_ibfk_3` FOREIGN KEY (`amount_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_fee_schedule_ibfk_4` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`),
  CONSTRAINT `loan_fee_schedule_ibfk_5` FOREIGN KEY (`account_fee_id`) REFERENCES `account_fees` (`account_fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_fee_schedule`
--

LOCK TABLES `loan_fee_schedule` WRITE;
/*!40000 ALTER TABLE `loan_fee_schedule` DISABLE KEYS */;
INSERT INTO `loan_fee_schedule` VALUES (1,143,1,5,8,'60.0000',2,'0.0000',2,4),(2,143,1,8,7,'90.0000',2,'0.0000',2,4),(3,143,1,7,9,'80.0000',2,'0.0000',2,4),(4,144,2,8,7,'90.0000',2,'0.0000',2,2),(5,145,3,8,7,'90.0000',2,'0.0000',2,0),(6,146,4,8,7,'90.0000',2,'0.0000',2,0),(7,147,5,8,7,'90.0000',2,'0.0000',2,0),(8,148,6,8,7,'90.0000',2,'0.0000',2,0),(9,149,7,8,7,'90.0000',2,'0.0000',2,0),(10,150,8,8,7,'90.0000',2,'0.0000',2,0);
/*!40000 ALTER TABLE `loan_fee_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_offering`
--

DROP TABLE IF EXISTS `loan_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_offering` (
  `prd_offering_id` smallint(6) NOT NULL,
  `interest_type_id` smallint(6) NOT NULL,
  `interest_calc_rule_id` smallint(6) DEFAULT NULL,
  `penalty_id` smallint(6) DEFAULT NULL,
  `min_loan_amount` decimal(21,4) DEFAULT NULL,
  `min_loan_amount_currency_id` smallint(6) DEFAULT NULL,
  `max_loan_amnt` decimal(21,4) DEFAULT NULL,
  `max_loan_amnt_currency_id` smallint(6) DEFAULT NULL,
  `default_loan_amount` decimal(21,4) DEFAULT NULL,
  `default_loan_amount_currency_id` smallint(6) DEFAULT NULL,
  `graceperiod_type_id` smallint(6) DEFAULT NULL,
  `max_interest_rate` decimal(13,10) NOT NULL,
  `min_interest_rate` decimal(13,10) NOT NULL,
  `def_interest_rate` decimal(13,10) NOT NULL,
  `max_no_installments` smallint(6) DEFAULT NULL,
  `min_no_installments` smallint(6) DEFAULT NULL,
  `def_no_installments` smallint(6) DEFAULT NULL,
  `penalty_grace` smallint(6) DEFAULT NULL,
  `loan_counter_flag` smallint(6) DEFAULT NULL,
  `int_ded_disbursement_flag` smallint(6) NOT NULL,
  `prin_due_last_inst_flag` smallint(6) NOT NULL,
  `penalty_rate` decimal(13,10) DEFAULT NULL,
  `grace_period_duration` smallint(6) DEFAULT NULL,
  `principal_glcode_id` smallint(6) NOT NULL,
  `interest_glcode_id` smallint(6) NOT NULL,
  `penalties_glcode_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`prd_offering_id`),
  KEY `principal_glcode_id` (`principal_glcode_id`),
  KEY `interest_glcode_id` (`interest_glcode_id`),
  KEY `loan_offering_penalty_glcode` (`penalties_glcode_id`),
  KEY `graceperiod_type_id` (`graceperiod_type_id`),
  KEY `loan_offering_penalty` (`penalty_id`),
  KEY `loan_offering_interest_calc_rule` (`interest_calc_rule_id`),
  KEY `interest_type_id` (`interest_type_id`),
  KEY `min_loan_amount_currency_id` (`min_loan_amount_currency_id`),
  KEY `max_loan_amnt_currency_id` (`max_loan_amnt_currency_id`),
  KEY `default_loan_amount_currency_id` (`default_loan_amount_currency_id`),
  CONSTRAINT `loan_offering_ibfk_1` FOREIGN KEY (`principal_glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_2` FOREIGN KEY (`interest_glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_3` FOREIGN KEY (`graceperiod_type_id`) REFERENCES `grace_period_type` (`grace_period_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_4` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_5` FOREIGN KEY (`interest_type_id`) REFERENCES `interest_types` (`interest_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_6` FOREIGN KEY (`min_loan_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_7` FOREIGN KEY (`max_loan_amnt_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_ibfk_8` FOREIGN KEY (`default_loan_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_interest_calc_rule` FOREIGN KEY (`interest_calc_rule_id`) REFERENCES `interest_calc_rule` (`interest_calc_rule_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_penalty` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_penalty_glcode` FOREIGN KEY (`penalties_glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_offering`
--

LOCK TABLES `loan_offering` WRITE;
/*!40000 ALTER TABLE `loan_offering` DISABLE KEYS */;
INSERT INTO `loan_offering` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'8.0000000000','3.0000000000','5.0000000000',NULL,NULL,NULL,NULL,1,0,0,NULL,0,19,40,NULL),(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'9.0000000000','5.0000000000','5.0000000000',NULL,NULL,NULL,NULL,1,0,0,NULL,0,19,40,NULL),(5,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'9.0000000000','7.0000000000','8.0000000000',NULL,NULL,NULL,NULL,1,0,0,NULL,0,13,40,NULL);
/*!40000 ALTER TABLE `loan_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_offering_fund`
--

DROP TABLE IF EXISTS `loan_offering_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_offering_fund` (
  `loan_offering_fund_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fund_id` smallint(6) NOT NULL,
  `prd_offering_id` smallint(6) NOT NULL,
  PRIMARY KEY (`loan_offering_fund_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  KEY `fund_id` (`fund_id`),
  CONSTRAINT `loan_offering_fund_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_offering_fund_ibfk_2` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_offering_fund`
--

LOCK TABLES `loan_offering_fund` WRITE;
/*!40000 ALTER TABLE `loan_offering_fund` DISABLE KEYS */;
INSERT INTO `loan_offering_fund` VALUES (5,4,5),(6,5,5),(7,2,1),(8,3,4);
/*!40000 ALTER TABLE `loan_offering_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_penalty`
--

DROP TABLE IF EXISTS `loan_penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_penalty` (
  `loan_penalty_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `penalty_id` smallint(6) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `penalty_type` varchar(200) DEFAULT NULL,
  `penalty_rate` decimal(13,10) DEFAULT NULL,
  PRIMARY KEY (`loan_penalty_id`),
  KEY `account_id` (`account_id`),
  KEY `penalty_id` (`penalty_id`),
  CONSTRAINT `loan_penalty_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_penalty_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_penalty`
--

LOCK TABLES `loan_penalty` WRITE;
/*!40000 ALTER TABLE `loan_penalty` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_perf_history`
--

DROP TABLE IF EXISTS `loan_perf_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_perf_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `no_of_payments` smallint(6) DEFAULT NULL,
  `no_of_missed_payments` smallint(6) DEFAULT NULL,
  `days_in_arrears` smallint(6) DEFAULT NULL,
  `loan_maturity_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `loan_perf_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_perf_history`
--

LOCK TABLES `loan_perf_history` WRITE;
/*!40000 ALTER TABLE `loan_perf_history` DISABLE KEYS */;
INSERT INTO `loan_perf_history` VALUES (1,4,0,NULL,NULL,'2010-09-09'),(2,8,0,NULL,NULL,NULL),(3,15,0,NULL,NULL,NULL),(4,16,0,NULL,NULL,NULL),(5,21,0,NULL,NULL,'2010-09-09'),(6,23,0,NULL,NULL,NULL),(7,32,0,NULL,NULL,'2010-09-14'),(8,38,1,NULL,NULL,'2010-09-09'),(9,44,0,NULL,NULL,'2010-09-23'),(10,53,0,NULL,NULL,NULL),(11,55,0,NULL,NULL,NULL),(12,59,0,NULL,NULL,NULL),(13,66,0,NULL,NULL,NULL),(14,78,0,NULL,NULL,NULL),(15,86,0,NULL,NULL,NULL),(16,91,0,NULL,NULL,NULL),(17,112,0,NULL,NULL,'2010-10-23');
/*!40000 ALTER TABLE `loan_perf_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_schedule`
--

DROP TABLE IF EXISTS `loan_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `principal` decimal(21,4) NOT NULL,
  `principal_currency_id` smallint(6) DEFAULT NULL,
  `interest` decimal(21,4) NOT NULL,
  `interest_currency_id` smallint(6) DEFAULT NULL,
  `penalty` decimal(21,4) NOT NULL,
  `penalty_currency_id` smallint(6) DEFAULT NULL,
  `misc_fees` decimal(21,4) DEFAULT NULL,
  `misc_fees_currency_id` smallint(6) DEFAULT NULL,
  `misc_fees_paid` decimal(21,4) DEFAULT NULL,
  `misc_fees_paid_currency_id` smallint(6) DEFAULT NULL,
  `misc_penalty` decimal(21,4) DEFAULT NULL,
  `misc_penalty_currency_id` smallint(6) DEFAULT NULL,
  `misc_penalty_paid` decimal(21,4) DEFAULT NULL,
  `misc_penalty_paid_currency_id` smallint(6) DEFAULT NULL,
  `principal_paid` decimal(21,4) DEFAULT NULL,
  `principal_paid_currency_id` smallint(6) DEFAULT NULL,
  `interest_paid` decimal(21,4) DEFAULT NULL,
  `interest_paid_currency_id` smallint(6) DEFAULT NULL,
  `penalty_paid` decimal(21,4) DEFAULT NULL,
  `penalty_paid_currency_id` smallint(6) DEFAULT NULL,
  `payment_status` smallint(6) NOT NULL,
  `installment_id` smallint(6) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `parent_flag` smallint(6) DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `currency_id` (`currency_id`),
  KEY `principal_currency_id` (`principal_currency_id`),
  KEY `interest_currency_id` (`interest_currency_id`),
  KEY `penalty_currency_id` (`penalty_currency_id`),
  KEY `misc_fees_currency_id` (`misc_fees_currency_id`),
  KEY `misc_fees_paid_currency_id` (`misc_fees_paid_currency_id`),
  KEY `misc_penalty_currency_id` (`misc_penalty_currency_id`),
  KEY `principal_paid_currency_id` (`principal_paid_currency_id`),
  KEY `interest_paid_currency_id` (`interest_paid_currency_id`),
  KEY `penalty_paid_currency_id` (`penalty_paid_currency_id`),
  KEY `misc_penalty_paid_currency_id` (`misc_penalty_paid_currency_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `loan_schedule_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_10` FOREIGN KEY (`interest_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_11` FOREIGN KEY (`penalty_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_12` FOREIGN KEY (`misc_penalty_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_13` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_3` FOREIGN KEY (`principal_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_4` FOREIGN KEY (`interest_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_5` FOREIGN KEY (`penalty_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_6` FOREIGN KEY (`misc_fees_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_7` FOREIGN KEY (`misc_fees_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_8` FOREIGN KEY (`misc_penalty_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_schedule_ibfk_9` FOREIGN KEY (`principal_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_schedule`
--

LOCK TABLES `loan_schedule` WRITE;
/*!40000 ALTER TABLE `loan_schedule` DISABLE KEYS */;
INSERT INTO `loan_schedule` VALUES (8,8,4,NULL,'2010-07-15','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(9,8,4,NULL,'2010-07-22','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(10,8,4,NULL,'2010-07-29','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(11,8,4,NULL,'2010-08-05','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(12,8,4,NULL,'2010-08-12','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(13,8,4,NULL,'2010-08-19','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(14,8,4,NULL,'2010-08-26','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(15,8,4,NULL,'2010-09-02','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(16,8,4,NULL,'2010-09-09','670.4000',2,'5.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(17,15,6,NULL,'2010-07-15','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(18,15,6,NULL,'2010-07-22','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(19,15,6,NULL,'2010-07-29','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(20,15,6,NULL,'2010-08-05','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(21,15,6,NULL,'2010-08-12','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(22,15,6,NULL,'2010-08-19','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(23,15,6,NULL,'2010-08-26','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(24,16,7,NULL,'2010-07-15','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(25,16,7,NULL,'2010-07-22','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(26,16,7,NULL,'2010-07-29','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(27,16,7,NULL,'2010-08-05','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(28,16,7,NULL,'2010-08-12','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(29,16,7,NULL,'2010-08-19','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(30,16,7,NULL,'2010-08-26','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(31,16,7,NULL,'2010-09-02','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(32,16,7,NULL,'2010-09-09','670.4000',2,'5.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(33,4,3,NULL,'2010-07-29','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'2.9000',2,'0.0000',2,1,1,'2010-07-18',NULL,5),(34,4,3,NULL,'2010-08-05','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,2,'2010-07-18',NULL,3),(35,4,3,NULL,'2010-08-12','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,3,'2010-07-18',NULL,3),(36,4,3,NULL,'2010-08-19','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,4,'2010-07-18',NULL,3),(37,4,3,NULL,'2010-08-26','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,5,'2010-07-18',NULL,3),(38,4,3,NULL,'2010-09-02','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,6,'2010-07-18',NULL,3),(39,4,3,NULL,'2010-09-09','431.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'431.4000',2,'0.0000',2,'0.0000',2,1,7,'2010-07-18',NULL,3),(47,21,3,NULL,'2010-07-29','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,5),(48,21,3,NULL,'2010-08-05','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,2),(49,21,3,NULL,'2010-08-12','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(50,21,3,NULL,'2010-08-19','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(51,21,3,NULL,'2010-08-26','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(52,21,3,NULL,'2010-09-02','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(53,21,3,NULL,'2010-09-09','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(54,23,10,NULL,'2010-07-31','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(55,23,10,NULL,'2010-08-07','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(56,23,10,NULL,'2010-08-14','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(57,23,10,NULL,'2010-08-21','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(58,23,10,NULL,'2010-08-28','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(59,23,10,NULL,'2010-09-04','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(60,23,10,NULL,'2010-09-11','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(61,23,10,NULL,'2010-09-18','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(62,23,10,NULL,'2010-09-25','670.4000',2,'5.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,9,NULL,NULL,0),(70,32,13,NULL,'2010-08-03','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'75.1000',2,'2.9000',2,'0.0000',2,0,1,'2010-07-21',NULL,1),(71,32,13,NULL,'2010-08-10','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(72,32,13,NULL,'2010-08-17','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(73,32,13,NULL,'2010-08-24','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(74,32,13,NULL,'2010-08-31','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(75,32,13,NULL,'2010-09-07','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(76,32,13,NULL,'2010-09-14','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(77,38,18,NULL,'2010-07-29','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'2.9000',2,'0.0000',2,1,1,'2010-07-24',NULL,1),(78,38,18,NULL,'2010-08-05','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,2,'2010-07-24',NULL,1),(79,38,18,NULL,'2010-08-12','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,3,'2010-07-24',NULL,1),(80,38,18,NULL,'2010-08-19','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,4,'2010-07-24',NULL,1),(81,38,18,NULL,'2010-08-26','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,5,'2010-07-24',NULL,1),(82,38,18,NULL,'2010-09-02','428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'428.1000',2,'0.0000',2,'0.0000',2,1,6,'2010-07-24',NULL,1),(83,38,18,NULL,'2010-09-09','431.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'431.4000',2,'0.0000',2,'0.0000',2,1,7,'2010-07-24',NULL,1),(84,44,23,NULL,'2010-07-29','666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'5.8000',2,'0.0000',2,1,1,'2010-07-23',NULL,1),(85,44,23,NULL,'2010-08-05','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,2,'2010-07-23',NULL,1),(86,44,23,NULL,'2010-08-12','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,3,'2010-07-23',NULL,1),(87,44,23,NULL,'2010-08-19','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,4,'2010-07-23',NULL,1),(88,44,23,NULL,'2010-08-26','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,5,'2010-07-23',NULL,1),(89,44,23,NULL,'2010-09-02','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,6,'2010-07-23',NULL,1),(90,44,23,NULL,'2010-09-09','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,7,'2010-07-23',NULL,1),(91,44,23,NULL,'2010-09-16','666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'666.2000',2,'0.0000',2,'0.0000',2,1,8,'2010-07-23',NULL,1),(92,44,23,NULL,'2010-09-23','670.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'670.4000',2,'0.0000',2,'0.0000',2,1,9,'2010-07-23',NULL,1),(93,53,28,NULL,'2010-08-05','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(94,53,28,NULL,'2010-08-12','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(95,53,28,NULL,'2010-08-19','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(96,53,28,NULL,'2010-08-26','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(97,53,28,NULL,'2010-09-02','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(98,53,28,NULL,'2010-09-09','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(99,53,28,NULL,'2010-09-16','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(100,55,29,NULL,'2010-08-04','621.3000',2,'7.7000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(101,55,29,NULL,'2010-08-11','622.3000',2,'6.7000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(102,55,29,NULL,'2010-08-18','623.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(103,55,29,NULL,'2010-08-25','624.2000',2,'4.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(104,55,29,NULL,'2010-09-01','625.2000',2,'3.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(105,55,29,NULL,'2010-09-08','626.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(106,55,29,NULL,'2010-09-15','627.1000',2,'1.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(107,55,29,NULL,'2010-09-22','630.6000',2,'1.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0),(108,59,30,NULL,'2010-08-04','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(109,59,30,NULL,'2010-08-11','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(110,59,30,NULL,'2010-08-18','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(111,59,30,NULL,'2010-08-25','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(112,59,30,NULL,'2010-09-01','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(113,59,30,NULL,'2010-09-08','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(114,59,30,NULL,'2010-09-15','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(115,66,34,NULL,'2010-08-04','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(116,66,34,NULL,'2010-08-11','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(117,66,34,NULL,'2010-08-18','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(118,66,34,NULL,'2010-08-25','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(119,66,34,NULL,'2010-09-01','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(120,66,34,NULL,'2010-09-08','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(121,66,34,NULL,'2010-09-15','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(122,78,43,NULL,'2010-08-09','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(123,78,43,NULL,'2010-08-16','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(124,78,43,NULL,'2010-08-23','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(125,78,43,NULL,'2010-08-30','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(126,78,43,NULL,'2010-09-06','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(127,78,43,NULL,'2010-09-13','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(128,78,43,NULL,'2010-09-20','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(129,86,47,NULL,'2010-08-04','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,1),(130,86,47,NULL,'2010-08-11','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(131,86,47,NULL,'2010-08-18','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(132,86,47,NULL,'2010-08-25','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(133,86,47,NULL,'2010-09-01','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(134,86,47,NULL,'2010-09-08','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(135,86,47,NULL,'2010-09-15','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(136,91,50,NULL,'2010-08-09','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,0),(137,91,50,NULL,'2010-08-16','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,0),(138,91,50,NULL,'2010-08-23','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(139,91,50,NULL,'2010-08-30','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(140,91,50,NULL,'2010-09-06','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(141,91,50,NULL,'2010-09-13','428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(142,91,50,NULL,'2010-09-20','431.4000',2,'3.6000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(143,112,65,NULL,'2010-09-04','621.3000',2,'7.7000',2,'0.0000',2,'222.0000',2,'0.0000',2,'333.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,1,NULL,NULL,6),(144,112,65,NULL,'2010-09-11','622.3000',2,'6.7000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,2,NULL,NULL,2),(145,112,65,NULL,'2010-09-18','623.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,3,NULL,NULL,0),(146,112,65,NULL,'2010-09-25','624.2000',2,'4.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,4,NULL,NULL,0),(147,112,65,NULL,'2010-10-02','625.2000',2,'3.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,5,NULL,NULL,0),(148,112,65,NULL,'2010-10-09','626.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,6,NULL,NULL,0),(149,112,65,NULL,'2010-10-16','627.1000',2,'1.9000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,7,NULL,NULL,0),(150,112,65,NULL,'2010-10-23','630.6000',2,'1.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,0,8,NULL,NULL,0);
/*!40000 ALTER TABLE `loan_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_summary`
--

DROP TABLE IF EXISTS `loan_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_summary` (
  `account_id` int(11) NOT NULL,
  `orig_principal` decimal(21,4) DEFAULT NULL,
  `orig_principal_currency_id` smallint(6) DEFAULT NULL,
  `orig_interest` decimal(21,4) DEFAULT NULL,
  `orig_interest_currency_id` smallint(6) DEFAULT NULL,
  `orig_fees` decimal(21,4) DEFAULT NULL,
  `orig_fees_currency_id` smallint(6) DEFAULT NULL,
  `orig_penalty` decimal(21,4) DEFAULT NULL,
  `orig_penalty_currency_id` smallint(6) DEFAULT NULL,
  `principal_paid` decimal(21,4) DEFAULT NULL,
  `principal_paid_currency_id` smallint(6) DEFAULT NULL,
  `interest_paid` decimal(21,4) DEFAULT NULL,
  `interest_paid_currency_id` smallint(6) DEFAULT NULL,
  `fees_paid` decimal(21,4) DEFAULT NULL,
  `fees_paid_currency_id` smallint(6) DEFAULT NULL,
  `penalty_paid` decimal(21,4) DEFAULT NULL,
  `penalty_paid_currency_id` smallint(6) DEFAULT NULL,
  `raw_amount_total` decimal(21,4) DEFAULT NULL,
  `raw_amount_total_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `orig_principal_currency_id` (`orig_principal_currency_id`),
  KEY `orig_interest_currency_id` (`orig_interest_currency_id`),
  KEY `orig_fees_currency_id` (`orig_fees_currency_id`),
  KEY `orig_penalty_currency_id` (`orig_penalty_currency_id`),
  KEY `principal_paid_currency_id` (`principal_paid_currency_id`),
  KEY `interest_paid_currency_id` (`interest_paid_currency_id`),
  KEY `fees_paid_currency_id` (`fees_paid_currency_id`),
  KEY `penalty_paid_currency_id` (`penalty_paid_currency_id`),
  KEY `fk_loan_summary_raw_amount_total` (`raw_amount_total_currency_id`),
  CONSTRAINT `fk_loan_summary_raw_amount_total` FOREIGN KEY (`raw_amount_total_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_1` FOREIGN KEY (`orig_principal_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_2` FOREIGN KEY (`orig_interest_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_3` FOREIGN KEY (`orig_fees_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_4` FOREIGN KEY (`orig_penalty_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_5` FOREIGN KEY (`principal_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_6` FOREIGN KEY (`interest_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_7` FOREIGN KEY (`fees_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_8` FOREIGN KEY (`penalty_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_summary_ibfk_9` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_summary`
--

LOCK TABLES `loan_summary` WRITE;
/*!40000 ALTER TABLE `loan_summary` DISABLE KEYS */;
INSERT INTO `loan_summary` VALUES (4,'3000.0000',2,'2.9000',2,'0.0000',2,'0.0000',2,'247.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'2.0000',2),(8,'6000.0000',2,'52.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'51.8000',2),(15,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(16,'6000.0000',2,'52.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'51.8000',2),(21,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(23,'6000.0000',2,'52.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'51.8000',2),(32,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'75.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'20.1000',2),(38,'3000.0000',2,'2.9000',2,'0.0000',2,'0.0000',2,'3000.0000',2,'2.9000',2,'0.0000',2,'0.0000',2,'2.0000',2),(44,'6000.0000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'5.6000',2),(53,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(55,'5000.0000',2,'35.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'34.6000',2),(59,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(66,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(78,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(86,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(91,'3000.0000',2,'21.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'20.1000',2),(112,'5000.0000',2,'35.0000',2,'1152.0000',2,'333.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'1186.6000',2);
/*!40000 ALTER TABLE `loan_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_trxn_detail`
--

DROP TABLE IF EXISTS `loan_trxn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_trxn_detail` (
  `account_trxn_id` int(11) NOT NULL,
  `principal_amount` decimal(21,4) DEFAULT NULL,
  `principal_amount_currency_id` smallint(6) DEFAULT NULL,
  `interest_amount` decimal(21,4) DEFAULT NULL,
  `interest_amount_currency_id` smallint(6) DEFAULT NULL,
  `penalty_amount` decimal(21,4) DEFAULT NULL,
  `penalty_amount_currency_id` smallint(6) DEFAULT NULL,
  `misc_fee_amount` decimal(21,4) DEFAULT NULL,
  `misc_fee_amount_currency_id` smallint(6) DEFAULT NULL,
  `misc_penalty_amount` decimal(21,4) DEFAULT NULL,
  `misc_penalty_amount_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`account_trxn_id`),
  KEY `principal_amount_currency_id` (`principal_amount_currency_id`),
  KEY `interest_amount_currency_id` (`interest_amount_currency_id`),
  KEY `penalty_amount_currency_id` (`penalty_amount_currency_id`),
  KEY `misc_penalty_amount_currency_id` (`misc_penalty_amount_currency_id`),
  KEY `misc_fee_amount_currency_id` (`misc_fee_amount_currency_id`),
  KEY `loan_account_trxn_idx` (`account_trxn_id`),
  CONSTRAINT `loan_trxn_detail_ibfk_1` FOREIGN KEY (`principal_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_trxn_detail_ibfk_2` FOREIGN KEY (`interest_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_trxn_detail_ibfk_3` FOREIGN KEY (`penalty_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_trxn_detail_ibfk_4` FOREIGN KEY (`misc_penalty_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_trxn_detail_ibfk_5` FOREIGN KEY (`misc_fee_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `loan_trxn_detail_ibfk_6` FOREIGN KEY (`account_trxn_id`) REFERENCES `account_trxn` (`account_trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_trxn_detail`
--

LOCK TABLES `loan_trxn_detail` WRITE;
/*!40000 ALTER TABLE `loan_trxn_detail` DISABLE KEYS */;
INSERT INTO `loan_trxn_detail` VALUES (10,'3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(11,'97.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(12,'150.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(13,'181.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(14,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(15,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(16,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(17,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(18,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(19,'431.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(20,'-428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(21,'-431.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(22,'-428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(23,'-428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(24,'-181.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(25,'-428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(26,'-428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(27,'181.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(28,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(29,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(30,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(31,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(32,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(33,'431.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(34,'3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(35,'428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(36,'216.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(37,'-216.1000',2,'-2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(38,'-428.1000',2,'-2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(39,'227.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(40,'43.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(41,'-43.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(42,'-227.1000',2,'-2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(43,'-3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(45,'3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(47,'75.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(50,'3000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(51,'6000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(52,'666.2000',2,'5.8000',2,'0.0000',2,'0.0000',2,'0.0000',2),(53,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(54,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(55,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(56,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(57,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(58,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(59,'666.2000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(60,'670.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(61,'428.1000',2,'2.9000',2,'0.0000',2,'0.0000',2,'0.0000',2),(62,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(63,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(64,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(65,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(66,'428.1000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(67,'431.4000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(88,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(89,'5000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(90,'307.3000',2,'7.7000',2,'0.0000',2,'222.0000',2,'333.0000',2),(91,'-307.3000',2,'-7.7000',2,'0.0000',2,'-222.0000',2,'-333.0000',2),(92,'621.3000',2,'7.7000',2,'0.0000',2,'222.0000',2,'333.0000',2),(93,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(94,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(95,'-621.3000',2,'-7.7000',2,'0.0000',2,'-222.0000',2,'-333.0000',2),(96,'-5000.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(97,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2);
/*!40000 ALTER TABLE `loan_trxn_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_entity`
--

DROP TABLE IF EXISTS `lookup_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_entity` (
  `entity_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`entity_id`),
  KEY `lookup_entityname_idx` (`entity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_entity`
--

LOCK TABLES `lookup_entity` WRITE;
/*!40000 ALTER TABLE `lookup_entity` DISABLE KEYS */;
INSERT INTO `lookup_entity` VALUES (1,'ClientStatus','Client Status'),(2,'GroupStatus','Group Status'),(3,'CenterStatus','Center Status'),(4,'OfficeStatus','Office Status'),(5,'AccountState','Account States'),(6,'PersonnelStatusUnused','Personnel Status (Unused)'),(7,'GroupFlag','Group Flag'),(8,'FeeType','Fee Type'),(9,'Titles','Customer Position'),(10,'PovertyStatus','Poverty Status For Client'),(11,'Center','Center VALUES'),(12,'Group','Group VALUES'),(13,'Client','Client VALUES'),(14,'Office','Office'),(15,'Salutation','Mr/Mrs'),(16,'Gender','Male/Female'),(17,'MaritalStatus','Married/UnMarried'),(18,'Citizenship','Citizenship'),(19,'Ethinicity','Ethnicity'),(20,'EducationLevel','EducationLevel'),(21,'BusinessActivities','BusinessActivities'),(22,'Handicapped','Handicaped'),(23,'ClientFormedBy','CustomField ClientFormedBy for client'),(24,'PostalCode','ZipCode'),(25,'ProductState','Product State'),(26,'Loan','Loan'),(27,'Savings','Savings'),(29,'PersonnelTitles','CFO/Accountant'),(30,'PersonnelLevels','LoanOfficer/NonLoanOfficer'),(34,'OfficeLevels','Head Office/Regional Office/Sub Regional Office/Area Office/BranchOffice'),(35,'PrdApplicableMaster','Ceratin product categories applicable to certain types of clients'),(36,'WeekDays','Week Days List'),(37,'InterestTypes','Interest Types for PrdOfferings and Accounts'),(38,'CategoryType','This is mainly used in fees to show the categories where this fee is applicable'),(39,'InterestCalcRule','Interest calculation rule for loan prd offerings'),(41,'GracePeriodTypes','Grace Period Types for loan products'),(42,'DayRank','Day Rank'),(43,'CollateralTypes','Collateral Types for loan accounts'),(44,'OfficeCode','Office Code'),(45,'ProductCategoryStatus','ProductCategoryStatus'),(46,'ProductStatus','ProductStatus'),(47,'SavingsType','SavingsType'),(48,'RecommendedAmtUnit','RecommendedAmtUnit'),(49,'IntCalTypes','IntCalTypes'),(50,'YESNO','YESNO'),(51,'AccountType','AccountType'),(52,'SpouseFather','SpouseFather'),(53,'CustomerStatus','CustomerStatus'),(54,'FeePayment','FeePayment'),(55,'FeeFormulaMaster','FeeFormulaMaster'),(56,'PersonnelStatus','PersonnelStatus'),(57,'Personnel','Personnel'),(62,'ExternalId','External ID'),(68,'FeeStatus','FeeStatus'),(69,'AccountAction','AccountAction'),(70,'AccountFlags','AccountFlags'),(71,'PaymentType','PaymentType'),(72,'SavingsStatus','Saving Status'),(73,'Position','Position'),(74,'Language','Language'),(75,'CustomerAttendanceType','CustomerAttendanceType'),(76,'FinancialAction','Financial Action'),(77,'BulkEntry','BulkEntry'),(78,'SavingsAccountFlag','SavingsAccountFlag'),(79,'Address3','Address3'),(80,'City','City'),(81,'Interest','Interest'),(82,'LoanPurposes','Loan Purposes'),(83,'State','State'),(84,'Address1','Address1'),(85,'Address2','Address2'),(86,'GovernmentId','GovernmentId'),(87,'Permissions','Permissions'),(88,'ServiceCharge','Interest'),(89,'feeUpdationType',' fee updation can to applied to existing accounts or future accounts'),(90,'FeeFrequency','Fee Frequency'),(91,'RepaymentRule','Repayment Rule Types'),(92,'LivingStatus','This entity is used to track whether the family member is living together with the client or not');
/*!40000 ALTER TABLE `lookup_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_label`
--

DROP TABLE IF EXISTS `lookup_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` smallint(6) DEFAULT NULL,
  `locale_id` smallint(6) DEFAULT NULL,
  `entity_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`label_id`),
  KEY `entity_id` (`entity_id`),
  KEY `locale_id` (`locale_id`),
  CONSTRAINT `lookup_label_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `lookup_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lookup_label_ibfk_2` FOREIGN KEY (`locale_id`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_label`
--

LOCK TABLES `lookup_label` WRITE;
/*!40000 ALTER TABLE `lookup_label` DISABLE KEYS */;
INSERT INTO `lookup_label` VALUES (1,1,1,NULL),(3,2,1,NULL),(5,3,1,NULL),(7,4,1,NULL),(9,5,1,NULL),(11,6,1,NULL),(13,7,1,NULL),(15,8,1,NULL),(17,9,1,NULL),(19,10,1,NULL),(21,11,1,NULL),(23,12,1,NULL),(25,13,1,NULL),(27,14,1,NULL),(29,15,1,NULL),(31,16,1,NULL),(33,17,1,NULL),(35,18,1,NULL),(37,19,1,NULL),(39,20,1,NULL),(41,21,1,NULL),(43,22,1,NULL),(47,24,1,NULL),(49,25,1,NULL),(51,26,1,NULL),(53,27,1,NULL),(57,29,1,NULL),(59,30,1,NULL),(67,34,1,NULL),(69,35,1,NULL),(71,36,1,NULL),(73,42,1,NULL),(75,37,1,NULL),(76,38,1,NULL),(77,39,1,NULL),(79,41,1,NULL),(80,43,1,NULL),(81,44,1,NULL),(83,45,1,NULL),(85,46,1,NULL),(87,47,1,NULL),(89,48,1,NULL),(91,49,1,NULL),(93,50,1,NULL),(95,51,1,NULL),(97,52,1,NULL),(99,53,1,NULL),(100,54,1,NULL),(102,55,1,NULL),(104,56,1,NULL),(106,57,1,NULL),(116,62,1,NULL),(128,68,1,NULL),(130,69,1,NULL),(132,70,1,NULL),(134,71,1,NULL),(136,72,1,NULL),(151,74,1,NULL),(154,75,1,NULL),(156,76,1,NULL),(158,77,1,NULL),(160,79,1,NULL),(162,80,1,NULL),(164,81,1,NULL),(166,82,1,NULL),(167,83,1,NULL),(168,84,1,NULL),(169,85,1,NULL),(170,86,1,NULL),(171,87,1,NULL),(172,88,1,NULL);
/*!40000 ALTER TABLE `lookup_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_value`
--

DROP TABLE IF EXISTS `lookup_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_value` (
  `lookup_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` smallint(6) DEFAULT NULL,
  `lookup_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lookup_id`),
  UNIQUE KEY `lookup_name_idx` (`lookup_name`),
  KEY `lookup_value_idx` (`entity_id`),
  CONSTRAINT `lookup_value_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `lookup_entity` (`entity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=635 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_value`
--

LOCK TABLES `lookup_value` WRITE;
/*!40000 ALTER TABLE `lookup_value` DISABLE KEYS */;
INSERT INTO `lookup_value` VALUES (1,1,'ClientStatus-PartialApplication'),(2,1,'ClientStatus-ApplicationPendingApproval'),(3,1,'ClientStatus-Active'),(4,1,'ClientStatus-OnHold'),(5,1,'ClientStatus-Cancelled'),(6,1,'ClientStatus-Closed'),(7,2,'GroupStatus-PartialApplication'),(8,2,'GroupStatus-ApplicationPendingApproval'),(9,2,'GroupStatus-Active'),(10,2,'GroupStatus-OnHold'),(11,2,'GroupStatus-Cancelled'),(12,2,'GroupStatus-Closed'),(13,3,'CenterStatus-Active'),(14,3,'CenterStatus-Inactive'),(15,4,'OfficeStatus-Active'),(16,4,'OfficeStatus-Inactive'),(17,5,'AccountState-PartialApplication'),(18,5,'AccountState-ApplicationPendingApproval'),(19,5,'AccountState-ApplicationApproved'),(20,5,'AccountState-DisbursedToLo'),(21,5,'AccountState-ActiveInGoodStanding'),(22,5,'AccountState-ClosedObligationMet'),(23,5,'AccountState-ClosedWrittenOff'),(24,5,'AccountState-ClosedRescheduled'),(25,5,'AccountState-ActiveInBadStanding'),(26,6,'PersonnelStatusUnused-Active'),(27,6,'PersonnelStatusUnused-Inactive'),(28,7,'GroupFlag-Withdraw'),(29,7,'GroupFlag-Rejected'),(30,7,'GroupFlag-Blacklisted'),(31,7,'GroupFlag-Duplicate'),(32,7,'GroupFlag-Transferred'),(33,7,'GroupFlag-LeftProgram'),(34,7,'GroupFlag-Other'),(35,8,'FeeType-MaintenanceFee'),(36,8,'FeeType-ConsultancyFee'),(37,8,'FeeType-TrainingFee'),(38,8,'FeeType-MeetingCharges'),(41,10,'PovertyStatus-VeryPoor'),(42,10,'PovertyStatus-Poor'),(43,10,'PovertyStatus-NonPoor'),(49,16,'Gender-Male'),(50,16,'Gender-Female'),(51,25,'ProductState-Active'),(52,25,'ProductState-Inactive'),(53,25,'ProductState-Close'),(54,26,'Loan-Loan'),(55,27,'Savings-Savings'),(60,30,'PersonnelLevels-LoanOfficer'),(61,30,'PersonnelLevels-NonLoanOfficer'),(68,35,'PrdApplicableMaster-Clients'),(69,35,'PrdApplicableMaster-Groups'),(70,35,'PrdApplicableMaster-Centers'),(79,37,'InterestTypes-Flat'),(80,37,'InterestTypes-DecliningBalance'),(81,38,'CategoryType-AllCustomers'),(82,38,'CategoryType-Client'),(83,38,'CategoryType-Group'),(84,38,'CategoryType-Center'),(85,38,'CategoryType-AllProductTypes'),(86,38,'CategoryType-Loans'),(87,38,'CategoryType-Savings'),(88,39,'InterestCalcRule-AlwaysRecalculate'),(89,39,'InterestCalcRule-NeverRecalculate'),(96,41,'GracePeriodTypes-None'),(97,41,'GracePeriodTypes-GraceOnAllRepayments'),(98,41,'GracePeriodTypes-PrincipalOnlyGrace'),(104,34,'OfficeLevels-HeadOffice'),(105,34,'OfficeLevels-RegionalOffice'),(106,34,'OfficeLevels-DivisionalOffice'),(107,34,'OfficeLevels-AreaOffice'),(108,34,'OfficeLevels-BranchOffice'),(111,44,'OfficeCode-Code1'),(112,44,'OfficeCode-Code2'),(113,45,'ProductCategoryStatus-Inactive'),(114,45,'ProductCategoryStatus-Active'),(115,46,'ProductStatus-Active'),(116,46,'ProductStatus-Inactive'),(117,46,'ProductStatus-Closed'),(118,47,'SavingsType-Mandatory'),(119,47,'SavingsType-Voluntary'),(120,48,'RecommendedAmtUnit-PerIndividual'),(121,48,'RecommendedAmtUnit-CompleteGroup'),(122,49,'IntCalTypes-MinimumBalance'),(123,49,'IntCalTypes-AverageBalance'),(124,50,'YESNO-Yes'),(125,50,'YESNO-No'),(126,51,'AccountType-Loan'),(127,51,'AccountType-Saving'),(128,52,'SpouseFather-Spouse'),(129,52,'SpouseFather-Father'),(140,51,'AccountType-Customer'),(141,5,'AccountState-Cancel'),(142,53,'CustomerStatus-CustomerAccountActive'),(143,53,'CustomerStatus-CustomerAccountInactive'),(146,54,'FeePayment-Upfront'),(147,54,'FeePayment-TimeOfDisburstment'),(148,54,'FeePayment-TimeOfFirstLoanRepayment'),(149,55,'FeeFormulaMaster-LoanAmount'),(150,55,'FeeFormulaMaster-LoanAmountInterest'),(151,55,'FeeFormulaMaster-Interest'),(152,56,'PersonnelStatus-Active'),(153,56,'PersonnelStatus-Inactive'),(154,57,'Personnel-Personnel'),(165,68,'FeeStatus-Active'),(166,68,'FeeStatus-Inactive'),(167,69,'AccountAction-LoanRepayment'),(168,69,'AccountAction-Penalty'),(169,69,'AccountAction-MiscellenousPenalty'),(170,69,'AccountAction-Fee'),(171,69,'AccountAction-MiscellenousFee'),(172,69,'AccountAction-Deposit'),(173,69,'AccountAction-Withdrawal'),(174,70,'AccountFlags-Withdraw'),(175,70,'AccountFlags-Rejected'),(176,70,'AccountFlags-Other'),(177,71,'PaymentType-Cash'),(179,71,'PaymentType-Voucher'),(180,71,'PaymentType-Cheque'),(181,72,'SavingsStatus-PartialApplication'),(182,72,'SavingsStatus-ApplicationPendingApproval'),(183,72,'SavingsStatus-Cancelled'),(184,72,'SavingsStatus-Active'),(185,72,'SavingsStatus-Closed'),(186,73,'Position-CenterLeader'),(187,73,'Position-CenterSecretary'),(188,73,'Position-GroupLeader'),(189,74,'Language-English'),(191,69,'AccountAction-Payment'),(192,69,'AccountAction-Adjustment'),(193,69,'AccountAction-Disbursal'),(194,75,'CustomerAttendance-P'),(195,75,'CustomerAttendance-Ab'),(196,75,'CustomerAttendance-Al'),(197,75,'CustomerAttendance-L'),(198,76,'FinancialAction-Principal'),(199,76,'FinancialAction-Interest'),(200,76,'FinancialAction-Fees'),(201,76,'FinancialAction-Penalty'),(202,76,'FinancialAction-RoundingAdjustments'),(203,76,'FinancialAction-MandatoryDeposit'),(204,76,'FinancialAction-VoluntoryDeposit'),(205,76,'FinancialAction-MandatoryWithdrawal'),(206,76,'FinancialAction-VoluntoryWithdrawal'),(207,76,'FinancialAction-ReversalAdjustment'),(208,76,'FinancialAction-SavingsInterestPosting'),(209,76,'FinancialAction-Interest_posting'),(210,72,'SavingsStatus-Inactive'),(211,78,'SavingsAccountFlag-Withdraw'),(212,78,'SavingsAccountFlag-Rejected'),(213,78,'SavingsAccountFlag-Blacklisted'),(214,69,'AccountAction-Interest_posting'),(215,76,'FinancialAction-LoanDisbursement'),(216,73,'Position-GroupSecretary'),(229,76,'FinancialAction-MiscFee'),(361,76,'FinancialAction-MiscPenalty'),(362,69,'AccountAction-CustomerAccountRepayment'),(363,76,'FinancialAction-CustomerAccountFeesPosting'),(364,69,'AccountAction-CustomerAdjustment'),(365,76,'FinancialAction-CustomerAdjustment'),(366,69,'AccountAction-SavingsAdjustment'),(367,76,'FinancialAction-MandatoryDepositAdjustment'),(368,76,'FinancialAction-VoluntoryDepositAdjustment'),(369,76,'FinancialAction-MandatoryWithdrawalAdjustment'),(370,76,'FinancialAction-VoluntoryWithdrawalAdjustment'),(371,87,'Permissions-OrganizationManagement'),(372,87,'Permissions-Funds'),(373,87,'Permissions-CanCreateFunds'),(374,87,'Permissions-CanModifyFunds'),(375,87,'Permissions-Fees'),(376,87,'Permissions-CanDefineNewFeeType'),(377,87,'Permissions-CanModifyFeeInformation'),(378,87,'Permissions-Checklists'),(379,87,'Permissions-CanDefineNewChecklistType'),(380,87,'Permissions-CanModifyChecklistInformation'),(381,87,'Permissions-OfficeManagement'),(382,87,'Permissions-Offices'),(383,87,'Permissions-CanCreateNewOffice'),(384,87,'Permissions-CanModifyOfficeInformation'),(385,87,'Permissions-UserManagement'),(386,87,'Permissions-Personnel'),(387,87,'Permissions-CanCreateNewSystemUsers'),(388,87,'Permissions-CanModifyUserInformation'),(389,87,'Permissions-CanUnlockAUser'),(390,87,'Permissions-Roles'),(391,87,'Permissions-CanCreateNewRole'),(392,87,'Permissions-CanModifyARole'),(393,87,'Permissions-CanDeleteARole'),(394,87,'Permissions-ClientManagement'),(395,87,'Permissions-Clients'),(396,87,'Permissions-Clients-CanCreateNewClientInSaveForLaterState'),(397,87,'Permissions-Clients-CanCreateNewClientInSubmitForApprovalState'),(398,87,'Permissions-Clients-CanChangeStateToPartialApplication'),(399,87,'Permissions-Clients-CanChangeStateToActive'),(400,87,'Permissions-Clients-CanChangeStateToCancelled'),(401,87,'Permissions-Clients-CanChangeStateToOnHold'),(402,87,'Permissions-Clients-CanChangeStateToClosed'),(403,87,'Permissions-Clients-CanChangeStateToApplicationPendingApproval'),(404,87,'Permissions-Clients-CanMakePaymentsToClientAccounts'),(405,87,'Permissions-Clients-CanMakeAdjustmentEntriesToClientAccount'),(407,87,'Permissions-Clients-CanWaiveADueAmount'),(408,87,'Permissions-Clients-CanRemoveFeeTypesFromClientAccount'),(409,87,'Permissions-Clients-CanAddNotesToClient'),(410,87,'Permissions-Clients-CanEditMfiInformation'),(411,87,'Permissions-Clients-CanEditGroupMembership'),(412,87,'Permissions-Clients-CanEditOfficeMembership'),(413,87,'Permissions-Clients-CanEditMeetingSchedule'),(414,87,'Permissions-Clients-CanAddEditHistoricalData'),(415,87,'Permissions-Clients-CanEditFeeAmountAttachedToTheAccount'),(416,87,'Permissions-Clients-CanBlacklistAClient'),(417,87,'Permissions-Groups'),(418,87,'Permissions-Groups-CanCreateNewGroupInSaveForLaterState'),(419,87,'Permissions-Groups-CanCreateNewGroupInSubmitForApprovalState'),(420,87,'Permissions-Groups-CanChangeStateToPartialApplication'),(421,87,'Permissions-Groups-CanChangeStateToActive'),(422,87,'Permissions-Groups-CanChangeStateToCancelled'),(423,87,'Permissions-Groups-CanChangeStateToOnHold'),(424,87,'Permissions-Groups-CanChangeStateToClosed'),(425,87,'Permissions-Groups-CanChangeStateToApplicationPendingApproval'),(426,87,'Permissions-Groups-CanMakePaymentsToGroupAccounts'),(427,87,'Permissions-Groups-CanMakeAdjustmentEntriesToGroupAccount'),(429,87,'Permissions-Groups-CanWaiveADueAmount'),(430,87,'Permissions-Groups-CanRemoveFeeTypesFromGroupAccount'),(431,87,'Permissions-Groups-CanAddNotesToGroup'),(432,87,'Permissions-Groups-CanEditGroupInformation'),(433,87,'Permissions-Groups-CanEditCenterClientship'),(434,87,'Permissions-Groups-CanEditOfficeMembership'),(435,87,'Permissions-Groups-CanEditMeetingSchedule'),(436,87,'Permissions-Groups-CanAddEditHistoricalData'),(437,87,'Permissions-Groups-CanEditFeeAmountAttachedToTheAccount'),(438,87,'Permissions-Groups-CanBlacklistAGroup'),(439,87,'Permissions-Centers'),(440,87,'Permissions-Centers-CanCreateNewCenter'),(441,87,'Permissions-Centers-CanModifyCenterInformation'),(442,87,'Permissions-Centers-CanEditCenterStatus'),(443,87,'Permissions-Centers-CanMakePaymentsToCenterAccounts'),(444,87,'Permissions-Centers-CanMakeAdjustmentEntriesToCenterAccount'),(446,87,'Permissions-Centers-CanWaiveADueAmount'),(447,87,'Permissions-Centers-CanRemoveFeeTypesFromCenterAccount'),(448,87,'Permissions-Centers-CanAddNotesToCenterRecords'),(449,87,'Permissions-Centers-CanEditFeeAmountAttachedToTheAccount'),(450,87,'Permissions-ProductDefinition'),(451,87,'Permissions-ProductCategories'),(452,87,'Permissions-CanDefineNewProductCategories'),(453,87,'Permissions-CanEditProductCategoryInformation'),(454,87,'Permissions-LoanProducts'),(455,87,'Permissions-CanDefineNewLoanProductInstance'),(456,87,'Permissions-CanEditLoanProductInstances'),(457,87,'Permissions-SavingsProducts'),(458,87,'Permissions-CanDefineNewSavingsProductInstance'),(459,87,'Permissions-CanEditSavingsProductInstances'),(460,87,'Permissions-LoanManagement'),(461,87,'Permissions-LoanProcessing'),(462,87,'Permissions-CanCreateNewLoanAccountInSaveForLaterState'),(463,87,'Permissions-CanCreateNewLoanAccountInSubmitForApprovalState'),(464,87,'Permissions-LoanProcessing-CanChangeStateToPartialApplication'),(465,87,'Permissions-LoanProcessing-CanChangeStateToApproved'),(466,87,'Permissions-LoanProcessing-CanChangeStateToCancelled'),(467,87,'Permissions-LoanProcessing-CanChangeStateToDisbursedToLo'),(469,87,'Permissions-LoanProcessing-CanChangeStateToPendingApproval'),(470,87,'Permissions-LoanProcessing-CanChangeStateToClosedWrittenOff'),(471,87,'Permissions-LoanProcessing-CanChangeStateToClosedRescheduled'),(474,87,'Permissions-LoanTransactions'),(475,87,'Permissions-CanMakePaymentToTheAccount'),(476,87,'Permissions-CanMakeAdjustmentEntryToTheAccount'),(478,87,'Permissions-CanWaivePenalty'),(479,87,'Permissions-CanWaiveAFeeInstallment'),(480,87,'Permissions-CanRemoveFeeTypesAttachedToTheAccount'),(481,87,'Permissions-Clients-CanSpecifyMeetingSchedule'),(482,87,'Permissions-Groups-CanSpecifyMeetingSchedule'),(483,87,'Permissions-Clients-CanEditPersonalInformation'),(484,87,'Permissions-Centers-CanEditMeetingSchedule'),(485,87,'Permissions-Centers-CanSpecifyMeetingSchedule'),(486,87,'Permissions-CanEditLoanAccountInformation'),(487,87,'Permissions-CanApplyChargesToLoans'),(488,87,'Permissions-CanEditSelfInformation'),(489,87,'Permissions-SavingsManagement'),(490,87,'Permissions-CanCreateNewSavingsAccountInSaveForLaterState'),(491,87,'Permissions-CanUpdateSavingsAccount'),(492,87,'Permissions-CanCloseSavingsAccount'),(493,87,'Permissions-SavingsManagement-CanChangeStateToPartialApplication'),(494,87,'Permissions-ReportsManagement'),(495,87,'Permissions-CanAdministerReports'),(496,87,'Permissions-CanPreviewReports'),(497,87,'Permissions-CanUploadNewReports'),(498,87,'Permissions-ClientDetail'),(499,87,'Permissions-Center'),(500,87,'Permissions-Status'),(501,87,'Permissions-Performance'),(502,87,'Permissions-LoanProductDetail'),(503,87,'Permissions-Analysis'),(504,87,'Permissions-Miscellaneous'),(531,87,'Permissions-CanRepayLoan'),(532,87,'Permissions-CanAddNotesToLoanAccount'),(533,87,'Permissions-SavingsManagement-CanChangeStateToPendingApproval'),(534,87,'Permissions-SavingsManagement-CanChangeStateToCancel'),(535,87,'Permissions-SavingsManagement-CanChangeStateToActive'),(536,87,'Permissions-SavingsManagement-CanChangeStateToInactive'),(537,87,'Permissions-CanBlacklistSavingsAccount'),(538,87,'Permissions-CanCreateNewSavingsAccountInSubmitForApprovalState'),(539,87,'Permissions-NotImplemented'),(546,87,'Permissions-CanDoAdjustmentsForSavingsAccount'),(547,69,'AccountAction-LoanWrittenOff'),(548,69,'AccountAction-WaiveOffDue'),(549,69,'AccountAction-WaiveOffOverDue'),(550,76,'FinancialAction-LoanWrittenOff'),(551,87,'Permissions-CanWaiveDueDepositsForSavingsAccount'),(552,87,'Permissions-CanWaiveOverDueDepositsForSavingsAccount'),(553,87,'Permissions-CanDisburseLoan'),(554,87,'Permissions-CanMakeDepositWithdrawalToSavingsAccount'),(555,87,'Permissions-CanAddNotesToSavingsAccount'),(556,89,'feeUpdationType-AppliesToExistingFutureAccounts'),(557,89,'feeUpdationType-AppliesToFutureAccounts'),(558,90,'FeeFrequency-Periodic'),(559,90,'FeeFrequency-OneTime'),(560,87,'Permissions-CanApproveLoansInBulk'),(561,87,'Permissions-CanModifyLatenessDormancyDefinition'),(562,87,'Permissions-CanModifyOfficeHierarchy'),(563,87,'Permissions-CanAddNotesToPersonnel'),(564,87,'Permissions-Bulk'),(565,87,'Permissions-CanEnterCollectionSheetData'),(566,87,'Permissions-Clients-CanApplyChargesToClientAccounts'),(567,87,'Permissions-Groups-CanApplyChargesToGroupAccounts'),(568,87,'Permissions-Centers-CanApplyChargesToCenterAccounts'),(569,87,'Permissions-CanCreateMultipleLoanAccounts'),(570,87,'Permissions-CanReverseLoanDisbursals'),(571,70,'AccountFlags-LoanReversal'),(572,69,'AccountAction-LoanReversal'),(573,69,'AccountAction-DisrbursalAmountReversal'),(574,87,'Permissions-ConfigurationManagement'),(575,87,'Permissions-CanDefineLabels'),(576,91,'RepaymentRule-SameDay'),(577,91,'RepaymentRule-NextMeetingRepayment'),(578,91,'RepaymentRule-NextWorkingDay'),(579,87,'Permissions-CanDefineHiddenMandatoryFields'),(580,87,'Permissions-Clients-CanRemoveClientsFromGroups'),(581,87,'Permissions-CanViewDetailedAgingOfPortfolioAtRisk'),(582,87,'Permissions-Clients-CanAddAnExistingClientToAGroup'),(583,87,'Permissions-ProductMix'),(584,87,'Permissions-CanDefineProductMix'),(585,87,'Permissions-CanEditProductMix'),(586,87,'Permissions-CanViewActiveLoansByLoanOfficer'),(587,87,'Permissions-CanDefineLookupValues'),(588,87,'Permissions-CanUploadReportTemplate'),(589,87,'Permissions-CanViewReports'),(590,87,'Permissions-CanEditReportInformation'),(591,87,'Permissions-CanAdjustPaymentWhenAccountStatusIsClosedObligationMet'),(592,87,'Permissions-CanRedoLoanDisbursals'),(593,87,'Permissions-CanDefineAcceptedPaymentType'),(594,87,'Permissions-CanDefineNewReportCategory'),(595,87,'Permissions-CanViewReportCategory'),(596,87,'Permissions-CanDeleteReportCategory'),(597,87,'Permissions-CanDownloadReportTemplate'),(598,87,'Permissions-CanDefineCustomFields'),(599,74,'Language-Icelandic'),(600,74,'Language-Spanish'),(601,74,'Language-French'),(602,87,'Permissions-CanUploadAdminDocuments'),(603,87,'Permissions-CanViewAdminDocuments'),(604,37,'InterestTypes-DecliningBalance-EqualPrincipalInstallment'),(605,87,'Permissions-SystemInformation'),(606,87,'Permissions-CanViewSystemInformation'),(607,87,'Permissions-CanViewCollectionSheetReport'),(608,87,'Permissions-CanViewOrganizationSettings'),(609,76,'FinancialAction-LoanRescheduled'),(610,69,'AccountAction-LoanRescheduled'),(611,87,'Permissions-CanViewBranchCashConfirmationReport'),(612,87,'Permissions-CanViewBranchProgressReport'),(613,74,'Language-Chinese'),(614,74,'Language-Swahili'),(615,74,'Language-Arabic'),(616,74,'Language-Portuguese'),(617,74,'Language-Khmer'),(618,74,'Language-Lao'),(619,87,'Permissions-CanImportTransactions'),(620,92,'Together'),(621,92,'NotTogether'),(622,52,'Mother'),(623,52,'Child'),(624,74,'Language-Hungarian'),(625,87,'Permissions-CanShutdownMifos'),(626,91,'RepaymentRule-RepaymentMoratorium'),(627,87,'Permissions-CanDefineHoliday'),(628,87,'Permissions.CanViewDetailedAgingOfPortfolioAtRiskReport'),(629,87,'Permissions.CanViewGeneralLedgerReport'),(630,15,'LookUpOption.Mr.1277994941878'),(631,15,'LookUpOption.Mrs.1277994946980'),(632,29,'LookUpOption.BigUser.1277994955809'),(633,17,'LookUpOption.Married.1277994974233'),(634,17,'LookUpOption.Single.1277994980488');
/*!40000 ALTER TABLE `lookup_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_value_locale`
--

DROP TABLE IF EXISTS `lookup_value_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_value_locale` (
  `lookup_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `locale_id` smallint(6) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  `lookup_value` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`lookup_value_id`),
  KEY `lookup_id` (`lookup_id`),
  KEY `locale_id` (`locale_id`),
  CONSTRAINT `lookup_value_locale_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lookup_value_locale_ibfk_2` FOREIGN KEY (`locale_id`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_value_locale`
--

LOCK TABLES `lookup_value_locale` WRITE;
/*!40000 ALTER TABLE `lookup_value_locale` DISABLE KEYS */;
INSERT INTO `lookup_value_locale` VALUES (1,1,1,NULL),(3,1,2,NULL),(5,1,3,NULL),(7,1,4,NULL),(9,1,5,NULL),(11,1,6,NULL),(13,1,7,NULL),(15,1,8,NULL),(17,1,9,NULL),(19,1,10,NULL),(21,1,11,NULL),(23,1,12,NULL),(25,1,13,NULL),(27,1,14,NULL),(29,1,15,NULL),(31,1,16,NULL),(33,1,17,NULL),(35,1,18,NULL),(37,1,19,NULL),(39,1,20,NULL),(41,1,21,NULL),(43,1,22,NULL),(45,1,23,NULL),(47,1,24,NULL),(49,1,25,NULL),(51,1,26,NULL),(53,1,27,NULL),(55,1,28,NULL),(57,1,29,NULL),(59,1,30,NULL),(61,1,31,NULL),(63,1,32,NULL),(65,1,33,NULL),(67,1,34,NULL),(69,1,35,NULL),(71,1,36,NULL),(73,1,37,NULL),(75,1,38,NULL),(81,1,41,NULL),(83,1,42,NULL),(85,1,43,NULL),(97,1,49,NULL),(99,1,50,NULL),(101,1,51,NULL),(103,1,52,NULL),(105,1,53,NULL),(107,1,54,NULL),(109,1,55,NULL),(119,1,60,NULL),(120,1,61,NULL),(135,1,68,NULL),(136,1,69,NULL),(137,1,70,NULL),(157,1,79,NULL),(158,1,80,NULL),(161,1,81,NULL),(162,1,82,NULL),(163,1,83,NULL),(164,1,84,NULL),(165,1,85,NULL),(166,1,86,NULL),(167,1,87,NULL),(168,1,88,NULL),(169,1,89,NULL),(176,1,96,NULL),(177,1,97,NULL),(178,1,98,NULL),(189,1,104,NULL),(191,1,105,NULL),(193,1,106,NULL),(195,1,107,NULL),(197,1,108,NULL),(201,1,111,NULL),(203,1,112,NULL),(205,1,113,NULL),(207,1,114,NULL),(209,1,115,NULL),(211,1,116,NULL),(213,1,117,NULL),(215,1,118,NULL),(217,1,119,NULL),(219,1,120,NULL),(221,1,121,NULL),(223,1,122,NULL),(225,1,123,NULL),(227,1,124,NULL),(229,1,125,NULL),(231,1,126,NULL),(233,1,127,NULL),(235,1,128,NULL),(237,1,129,NULL),(259,1,140,NULL),(261,1,141,NULL),(263,1,142,NULL),(264,1,143,NULL),(267,1,146,NULL),(269,1,147,NULL),(271,1,148,NULL),(273,1,149,NULL),(275,1,150,NULL),(277,1,151,NULL),(279,1,152,NULL),(281,1,153,NULL),(283,1,154,NULL),(305,1,165,NULL),(307,1,166,NULL),(309,1,167,NULL),(311,1,168,NULL),(313,1,169,NULL),(315,1,170,NULL),(317,1,171,NULL),(319,1,172,NULL),(321,1,173,NULL),(323,1,174,NULL),(325,1,175,NULL),(327,1,176,NULL),(329,1,177,NULL),(337,1,181,NULL),(339,1,182,NULL),(341,1,183,NULL),(343,1,184,NULL),(345,1,185,NULL),(347,1,186,NULL),(349,1,187,NULL),(351,1,188,NULL),(376,1,189,NULL),(380,1,191,NULL),(382,1,192,NULL),(384,1,193,NULL),(386,1,194,NULL),(388,1,195,NULL),(390,1,196,NULL),(392,1,197,NULL),(394,1,198,NULL),(395,1,199,NULL),(396,1,200,NULL),(397,1,201,NULL),(398,1,202,NULL),(399,1,203,NULL),(400,1,204,NULL),(401,1,205,NULL),(402,1,206,NULL),(403,1,207,NULL),(404,1,208,NULL),(405,1,209,NULL),(407,1,210,NULL),(409,1,211,NULL),(411,1,212,NULL),(413,1,213,NULL),(415,1,214,NULL),(417,1,215,NULL),(418,1,216,NULL),(440,1,229,NULL),(699,1,361,NULL),(700,1,362,NULL),(701,1,363,NULL),(702,1,364,NULL),(703,1,365,NULL),(704,1,366,NULL),(705,1,367,NULL),(706,1,368,NULL),(707,1,369,NULL),(708,1,370,NULL),(709,1,371,NULL),(710,1,372,NULL),(711,1,373,NULL),(712,1,374,NULL),(713,1,375,NULL),(714,1,376,NULL),(715,1,377,NULL),(716,1,378,NULL),(717,1,379,NULL),(718,1,380,NULL),(719,1,381,NULL),(720,1,382,NULL),(721,1,383,NULL),(722,1,384,NULL),(723,1,385,NULL),(724,1,386,NULL),(725,1,387,NULL),(726,1,388,NULL),(727,1,389,NULL),(728,1,390,NULL),(729,1,391,NULL),(730,1,392,NULL),(731,1,393,NULL),(732,1,394,NULL),(733,1,395,NULL),(734,1,396,NULL),(735,1,397,NULL),(736,1,398,NULL),(737,1,399,NULL),(738,1,400,NULL),(739,1,401,NULL),(740,1,402,NULL),(741,1,403,NULL),(742,1,404,NULL),(743,1,405,NULL),(745,1,407,NULL),(746,1,408,NULL),(747,1,409,NULL),(748,1,410,NULL),(749,1,411,NULL),(750,1,412,NULL),(751,1,413,NULL),(752,1,414,NULL),(753,1,415,NULL),(754,1,416,NULL),(755,1,417,NULL),(756,1,418,NULL),(757,1,419,NULL),(758,1,420,NULL),(759,1,421,NULL),(760,1,422,NULL),(761,1,423,NULL),(762,1,424,NULL),(763,1,425,NULL),(764,1,426,NULL),(765,1,427,NULL),(767,1,429,NULL),(768,1,430,NULL),(769,1,431,NULL),(770,1,432,NULL),(771,1,433,NULL),(772,1,434,NULL),(773,1,435,NULL),(774,1,436,NULL),(775,1,437,NULL),(776,1,438,NULL),(777,1,439,NULL),(778,1,440,NULL),(779,1,441,NULL),(780,1,442,NULL),(781,1,443,NULL),(782,1,444,NULL),(784,1,446,NULL),(785,1,447,NULL),(786,1,448,NULL),(787,1,449,NULL),(788,1,450,NULL),(789,1,451,NULL),(790,1,452,NULL),(791,1,453,NULL),(792,1,454,NULL),(793,1,455,NULL),(794,1,456,NULL),(795,1,457,NULL),(796,1,458,NULL),(797,1,459,NULL),(798,1,460,NULL),(799,1,461,NULL),(800,1,462,NULL),(801,1,463,NULL),(802,1,464,NULL),(803,1,465,NULL),(804,1,466,NULL),(805,1,467,NULL),(807,1,469,NULL),(808,1,470,NULL),(809,1,471,NULL),(812,1,474,NULL),(813,1,475,NULL),(814,1,476,NULL),(816,1,478,NULL),(817,1,479,NULL),(818,1,480,NULL),(819,1,481,NULL),(820,1,482,NULL),(821,1,483,NULL),(822,1,484,NULL),(823,1,485,NULL),(824,1,486,NULL),(825,1,487,NULL),(826,1,488,NULL),(827,1,489,NULL),(828,1,490,NULL),(829,1,491,NULL),(830,1,492,NULL),(831,1,493,NULL),(832,1,494,NULL),(833,1,495,NULL),(834,1,496,NULL),(835,1,497,NULL),(836,1,498,NULL),(837,1,499,NULL),(838,1,500,NULL),(839,1,501,NULL),(840,1,502,NULL),(841,1,503,NULL),(842,1,504,NULL),(869,1,531,NULL),(870,1,532,NULL),(871,1,533,NULL),(872,1,534,NULL),(873,1,535,NULL),(874,1,536,NULL),(875,1,537,NULL),(876,1,538,NULL),(877,1,539,NULL),(884,1,546,NULL),(885,1,547,NULL),(886,1,548,NULL),(887,1,549,NULL),(888,1,550,NULL),(889,1,551,NULL),(890,1,552,NULL),(891,1,553,NULL),(892,1,554,NULL),(893,1,555,NULL),(894,1,556,NULL),(895,1,557,NULL),(896,1,558,NULL),(897,1,559,NULL),(898,1,560,NULL),(899,1,561,NULL),(900,1,562,NULL),(901,1,563,NULL),(902,1,564,NULL),(903,1,565,NULL),(904,1,566,NULL),(905,1,567,NULL),(906,1,568,NULL),(912,1,179,NULL),(913,1,180,NULL),(914,1,569,NULL),(915,1,570,NULL),(916,1,571,NULL),(917,1,572,NULL),(918,1,573,NULL),(919,1,574,NULL),(920,1,575,NULL),(921,1,576,NULL),(922,1,577,NULL),(923,1,578,NULL),(924,1,579,NULL),(925,1,580,NULL),(926,1,581,NULL),(927,1,582,NULL),(928,1,583,NULL),(929,1,584,NULL),(930,1,585,NULL),(931,1,586,NULL),(932,1,587,NULL),(933,1,588,NULL),(934,1,589,NULL),(935,1,590,NULL),(936,1,591,NULL),(937,1,592,NULL),(938,1,593,NULL),(939,1,594,NULL),(940,1,595,NULL),(941,1,596,NULL),(942,1,597,NULL),(943,1,598,NULL),(944,1,602,NULL),(945,1,603,NULL),(946,1,604,NULL),(947,1,605,NULL),(948,1,606,NULL),(949,1,607,NULL),(950,1,608,NULL),(951,1,609,NULL),(952,1,610,NULL),(953,1,611,NULL),(954,1,612,NULL),(955,1,619,NULL),(956,1,625,NULL),(957,1,627,NULL),(958,1,628,'Can View Detailed Aging Of Portfolio At Risk Report'),(959,1,629,'Can View General Ledger Report'),(960,1,630,'Mr'),(961,1,631,'Mrs'),(962,1,632,'big user'),(963,1,633,'married'),(964,1,634,'single');
/*!40000 ALTER TABLE `lookup_value_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `max_min_interest_rate`
--

DROP TABLE IF EXISTS `max_min_interest_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `max_min_interest_rate` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `min_interest_rate` decimal(21,4) NOT NULL,
  `max_interest_rate` decimal(21,4) NOT NULL,
  PRIMARY KEY (`account_id`),
  CONSTRAINT `max_min_interest_rate_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `max_min_interest_rate`
--

LOCK TABLES `max_min_interest_rate` WRITE;
/*!40000 ALTER TABLE `max_min_interest_rate` DISABLE KEYS */;
INSERT INTO `max_min_interest_rate` VALUES (4,'3.0000','8.0000'),(8,'5.0000','9.0000'),(15,'3.0000','8.0000'),(16,'5.0000','9.0000'),(21,'3.0000','8.0000'),(23,'5.0000','9.0000'),(32,'3.0000','8.0000'),(38,'3.0000','8.0000'),(44,'5.0000','9.0000'),(53,'3.0000','8.0000'),(55,'7.0000','9.0000'),(59,'3.0000','8.0000'),(66,'3.0000','8.0000'),(78,'3.0000','8.0000'),(86,'3.0000','8.0000'),(91,'3.0000','8.0000'),(112,'7.0000','9.0000');
/*!40000 ALTER TABLE `max_min_interest_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `max_min_loan_amount`
--

DROP TABLE IF EXISTS `max_min_loan_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `max_min_loan_amount` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `min_loan_amount` decimal(21,4) NOT NULL,
  `max_loan_amount` decimal(21,4) NOT NULL,
  PRIMARY KEY (`account_id`),
  CONSTRAINT `max_min_loan_amount_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `max_min_loan_amount`
--

LOCK TABLES `max_min_loan_amount` WRITE;
/*!40000 ALTER TABLE `max_min_loan_amount` DISABLE KEYS */;
INSERT INTO `max_min_loan_amount` VALUES (4,'1000.0000','5000.0000'),(8,'2000.0000','6000.0000'),(15,'1000.0000','5000.0000'),(16,'2000.0000','6000.0000'),(21,'1000.0000','5000.0000'),(23,'2000.0000','6000.0000'),(32,'1000.0000','5000.0000'),(38,'1000.0000','5000.0000'),(44,'2000.0000','6000.0000'),(53,'1000.0000','5000.0000'),(55,'2345.0000','6000.0000'),(59,'1000.0000','5000.0000'),(66,'1000.0000','5000.0000'),(78,'1000.0000','5000.0000'),(86,'1000.0000','5000.0000'),(91,'1000.0000','5000.0000'),(112,'2345.0000','6000.0000');
/*!40000 ALTER TABLE `max_min_loan_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `max_min_no_of_install`
--

DROP TABLE IF EXISTS `max_min_no_of_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `max_min_no_of_install` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `min_no_install` decimal(21,4) NOT NULL,
  `max_no_install` decimal(21,4) NOT NULL,
  PRIMARY KEY (`account_id`),
  CONSTRAINT `max_min_no_of_install_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `max_min_no_of_install`
--

LOCK TABLES `max_min_no_of_install` WRITE;
/*!40000 ALTER TABLE `max_min_no_of_install` DISABLE KEYS */;
INSERT INTO `max_min_no_of_install` VALUES (4,'1.0000','15.0000'),(8,'1.0000','15.0000'),(15,'1.0000','15.0000'),(16,'1.0000','15.0000'),(21,'1.0000','15.0000'),(23,'1.0000','15.0000'),(32,'1.0000','15.0000'),(38,'1.0000','15.0000'),(44,'1.0000','15.0000'),(53,'1.0000','15.0000'),(55,'1.0000','12.0000'),(59,'1.0000','15.0000'),(66,'1.0000','15.0000'),(78,'1.0000','15.0000'),(86,'1.0000','15.0000'),(91,'1.0000','15.0000'),(112,'1.0000','12.0000');
/*!40000 ALTER TABLE `max_min_no_of_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting` (
  `meeting_id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_type_id` smallint(6) NOT NULL,
  `meeting_place` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`meeting_id`),
  KEY `meeting_type_id` (`meeting_type_id`),
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`meeting_type_id`) REFERENCES `meeting_type` (`meeting_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` VALUES (1,4,'after it','2010-07-01',NULL,NULL,NULL,13),(2,1,'meetingPlace','2010-07-02',NULL,NULL,NULL,0),(3,3,'meetingPlace','2010-07-02',NULL,NULL,NULL,0),(4,2,'meetingPlace','2010-07-02',NULL,NULL,NULL,0),(5,2,'meetingPlace','2010-07-02',NULL,NULL,NULL,0),(6,3,'meetingPlace','2010-07-02',NULL,NULL,NULL,0),(7,4,'after it','2010-07-16',NULL,NULL,NULL,1),(8,1,'meetingPlace','2010-07-02',NULL,NULL,NULL,0),(9,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(10,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(11,4,'after it','2010-07-08',NULL,NULL,NULL,0),(12,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(13,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(14,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(15,4,'after it','2010-07-08',NULL,NULL,NULL,0),(16,4,'after it','2010-07-08',NULL,NULL,NULL,0),(17,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(18,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(19,4,'after it','2010-07-18',NULL,NULL,NULL,1),(20,4,'branch hall','2010-07-18',NULL,NULL,NULL,0),(21,4,'branch hall','2010-07-24',NULL,NULL,NULL,0),(22,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(23,4,'xxxx','2010-07-20',NULL,NULL,NULL,4),(24,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(25,2,'meetingPlace','2006-01-01',NULL,NULL,NULL,0),(26,4,'xxxx','2010-07-21',NULL,NULL,NULL,1),(27,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(28,2,'meetingPlace','2006-01-01',NULL,NULL,NULL,0),(29,4,'after it','2010-07-22',NULL,NULL,NULL,0),(30,4,'aaaa','2010-07-22',NULL,NULL,NULL,3),(31,4,'after it','2010-07-22',NULL,NULL,NULL,0),(32,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(33,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(34,4,'ww','2010-07-25',NULL,NULL,NULL,4),(35,4,'dfdf','2010-07-25',NULL,NULL,NULL,0),(36,4,'22','2010-07-25',NULL,NULL,NULL,0),(37,4,'asdf','2010-07-25',NULL,NULL,NULL,0),(38,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(39,4,'asdf','2010-07-29',NULL,NULL,NULL,0),(40,4,'asdf','2010-07-25',NULL,NULL,NULL,1),(41,1,'meetingPlace','2010-07-25',NULL,NULL,NULL,0),(42,3,'meetingPlace','2010-07-25',NULL,NULL,NULL,0),(43,2,'meetingPlace','2010-07-25',NULL,NULL,NULL,0),(44,3,'meetingPlace','2010-07-25',NULL,NULL,NULL,0),(45,2,'meetingPlace','2010-07-25',NULL,NULL,NULL,0),(46,4,'asdf','2010-07-28',NULL,NULL,NULL,0),(47,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(48,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(49,4,'asdf','2010-07-28',NULL,NULL,NULL,0),(50,4,'fdfd','2010-07-25',NULL,NULL,NULL,0),(51,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(52,4,'asdf','2010-07-25',NULL,NULL,NULL,2),(53,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(54,4,'asdf','2010-07-28',NULL,NULL,NULL,0),(55,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(56,4,'asdf','2010-07-29',NULL,NULL,NULL,1),(57,4,'asdf','2010-07-29',NULL,NULL,NULL,1),(58,4,'fff','2010-07-29',NULL,NULL,NULL,1),(59,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(60,4,'fff','2010-08-02',NULL,NULL,NULL,0),(61,4,'qqq','2010-07-29',NULL,NULL,NULL,0),(62,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(63,4,'asdf','2010-07-29',NULL,NULL,NULL,0),(64,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(65,4,'asdf','2010-07-29',NULL,NULL,NULL,1),(66,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(67,4,'asdf','2010-08-02',NULL,NULL,NULL,0),(68,4,'asdf','2010-07-31',NULL,NULL,NULL,0),(69,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(70,4,'df','2010-08-01',NULL,NULL,NULL,2),(71,4,'df','2010-08-02',NULL,NULL,NULL,0),(72,2,'meetingPlace','2006-01-01',NULL,NULL,NULL,0),(73,4,'asf','2010-08-01',NULL,NULL,NULL,0),(74,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(75,4,'fdf','2010-08-04',NULL,NULL,NULL,1),(76,4,'asdf','2010-08-07',NULL,NULL,NULL,2),(77,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(78,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(79,5,'meetingPlace','2010-08-27',NULL,NULL,NULL,0),(80,4,'zxc','2010-08-27',NULL,NULL,NULL,2),(81,4,'asdf','2010-08-27',NULL,NULL,NULL,0),(82,5,'meetingPlace','2010-08-27',NULL,NULL,NULL,0),(83,5,'meetingPlace','2010-08-27',NULL,NULL,NULL,0),(84,2,'meetingPlace',NULL,NULL,NULL,NULL,1),(85,4,'asf','2010-08-28',NULL,NULL,NULL,1),(86,5,'meetingPlace','2010-08-28',NULL,NULL,NULL,0),(87,4,'asf','2010-08-28',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_type`
--

DROP TABLE IF EXISTS `meeting_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_type` (
  `meeting_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `meeting_purpose` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`meeting_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_type`
--

LOCK TABLES `meeting_type` WRITE;
/*!40000 ALTER TABLE `meeting_type` DISABLE KEYS */;
INSERT INTO `meeting_type` VALUES (1,'LOANFREQUENCYOFINSTALLMENTS','Loan Frequency of istalments'),(2,'SAVINGSTIMEPERFORINTCALC','Savings Time Period for Interest Calculation'),(3,'SAVINGSFRQINTPOSTACC','Savings Frequency of Interest Posting to Accounts'),(4,'CUSTOMERMEETING','Customer Meeting'),(5,'FEEMEETING','Fees Meetings');
/*!40000 ALTER TABLE `meeting_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mfi_attribute`
--

DROP TABLE IF EXISTS `mfi_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mfi_attribute` (
  `attribute_id` smallint(6) NOT NULL,
  `office_id` smallint(6) NOT NULL,
  `attribute_name` varchar(100) NOT NULL,
  `attribute_value` varchar(200) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `mfi_attribute_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfi_attribute`
--

LOCK TABLES `mfi_attribute` WRITE;
/*!40000 ALTER TABLE `mfi_attribute` DISABLE KEYS */;
INSERT INTO `mfi_attribute` VALUES (1,1,'CENTER','GROUP'),(2,1,'CENTER','GROUP'),(3,1,'CENTER','GROUP'),(4,1,'CENTER','GROUP'),(5,1,'CENTER','GROUP');
/*!40000 ALTER TABLE `mfi_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_install_from_last_loan`
--

DROP TABLE IF EXISTS `no_of_install_from_last_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_install_from_last_loan` (
  `no_of_install_from_last_loan_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `start_range` decimal(21,4) NOT NULL,
  `end_range` decimal(21,4) NOT NULL,
  `min_no_install` decimal(21,4) NOT NULL,
  `max_no_install` decimal(21,4) NOT NULL,
  `default_no_install` decimal(21,4) NOT NULL,
  PRIMARY KEY (`no_of_install_from_last_loan_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `no_of_install_from_last_loan_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_install_from_last_loan`
--

LOCK TABLES `no_of_install_from_last_loan` WRITE;
/*!40000 ALTER TABLE `no_of_install_from_last_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_of_install_from_last_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_install_from_loan_cycle`
--

DROP TABLE IF EXISTS `no_of_install_from_loan_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_install_from_loan_cycle` (
  `no_of_install_from_loan_cycle_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `min_no_install` decimal(21,4) NOT NULL,
  `max_no_install` decimal(21,4) NOT NULL,
  `default_no_install` decimal(21,4) NOT NULL,
  `range_index` decimal(21,4) NOT NULL,
  PRIMARY KEY (`no_of_install_from_loan_cycle_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `no_of_install_from_loan_cycle_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_install_from_loan_cycle`
--

LOCK TABLES `no_of_install_from_loan_cycle` WRITE;
/*!40000 ALTER TABLE `no_of_install_from_loan_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_of_install_from_loan_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_of_install_same_for_all_loan`
--

DROP TABLE IF EXISTS `no_of_install_same_for_all_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `no_of_install_same_for_all_loan` (
  `no_of_install_same_for_all_loan_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `min_no_install` decimal(21,4) NOT NULL,
  `max_no_install` decimal(21,4) NOT NULL,
  `default_no_install` decimal(21,4) NOT NULL,
  PRIMARY KEY (`no_of_install_same_for_all_loan_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `no_of_install_same_for_all_loan_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `loan_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_of_install_same_for_all_loan`
--

LOCK TABLES `no_of_install_same_for_all_loan` WRITE;
/*!40000 ALTER TABLE `no_of_install_same_for_all_loan` DISABLE KEYS */;
INSERT INTO `no_of_install_same_for_all_loan` VALUES (4,5,'1.0000','12.0000','8.0000'),(5,1,'1.0000','15.0000','7.0000'),(6,4,'1.0000','15.0000','9.0000');
/*!40000 ALTER TABLE `no_of_install_same_for_all_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offering_fund`
--

DROP TABLE IF EXISTS `offering_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offering_fund` (
  `offering_fund_id` smallint(6) NOT NULL,
  `fund_id` smallint(6) DEFAULT NULL,
  `prd_offering_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`offering_fund_id`),
  KEY `fund_id` (`fund_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `offering_fund_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `offering_fund_ibfk_2` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering_fund`
--

LOCK TABLES `offering_fund` WRITE;
/*!40000 ALTER TABLE `offering_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `offering_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office` (
  `office_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `global_office_num` varchar(100) NOT NULL,
  `office_level_id` smallint(6) NOT NULL,
  `search_id` varchar(100) NOT NULL,
  `max_child_count` int(11) NOT NULL,
  `local_remote_flag` smallint(6) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `office_short_name` varchar(4) NOT NULL,
  `parent_office_id` smallint(6) DEFAULT NULL,
  `status_id` smallint(6) NOT NULL,
  `version_no` int(11) NOT NULL,
  `office_code_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`office_id`),
  UNIQUE KEY `global_office_num` (`global_office_num`),
  UNIQUE KEY `office_global_idx` (`global_office_num`),
  KEY `office_level_id` (`office_level_id`),
  KEY `parent_office_id` (`parent_office_id`),
  KEY `status_id` (`status_id`),
  KEY `office_code_id` (`office_code_id`),
  CONSTRAINT `office_ibfk_1` FOREIGN KEY (`office_level_id`) REFERENCES `office_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_ibfk_2` FOREIGN KEY (`parent_office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `office_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_ibfk_4` FOREIGN KEY (`office_code_id`) REFERENCES `office_code` (`code_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'0001',1,'1.1.',2,1,'Mifos HO ',NULL,NULL,NULL,NULL,'MIF1',NULL,1,2,NULL),(2,'0002',2,'1.1.3.',0,1,'RO dw1',1,'2010-07-01',NULL,NULL,'ro1',1,1,1,NULL),(3,'0003',5,'1.1.3.2.',0,1,'BO 1',1,'2010-07-01',NULL,NULL,'BO1',2,1,1,NULL),(4,'0004',5,'1.1.1.',0,1,'br2',1,'2010-07-04',NULL,NULL,'br2',1,1,1,NULL),(5,'0005',5,'1.1.3.1.',0,1,'br3',1,'2010-07-04',1,'2010-07-31','br3',2,1,3,NULL),(6,'0006',5,'1.1.2.',0,1,'br4',1,'2010-07-04',1,'2010-07-04','br4',1,1,1,NULL);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_action_payment_type`
--

DROP TABLE IF EXISTS `office_action_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_action_payment_type` (
  `office_id` smallint(6) DEFAULT NULL,
  `prd_type_id` smallint(6) DEFAULT NULL,
  `account_action_id` smallint(6) NOT NULL,
  `payment_type_id` smallint(6) DEFAULT NULL,
  KEY `account_action_id` (`account_action_id`),
  KEY `office_id` (`office_id`),
  KEY `payment_type_id` (`payment_type_id`),
  KEY `prd_type_id` (`prd_type_id`),
  CONSTRAINT `office_action_payment_type_ibfk_1` FOREIGN KEY (`account_action_id`) REFERENCES `account_action` (`account_action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_action_payment_type_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_action_payment_type_ibfk_3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_action_payment_type_ibfk_4` FOREIGN KEY (`prd_type_id`) REFERENCES `prd_type` (`prd_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_action_payment_type`
--

LOCK TABLES `office_action_payment_type` WRITE;
/*!40000 ALTER TABLE `office_action_payment_type` DISABLE KEYS */;
INSERT INTO `office_action_payment_type` VALUES (NULL,NULL,1,NULL),(NULL,NULL,2,NULL),(NULL,NULL,3,NULL),(NULL,NULL,4,NULL),(NULL,NULL,5,NULL);
/*!40000 ALTER TABLE `office_action_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_address`
--

DROP TABLE IF EXISTS `office_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_address` (
  `office_address_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `office_id` smallint(6) NOT NULL,
  `address_1` varchar(200) DEFAULT NULL,
  `address_2` varchar(200) DEFAULT NULL,
  `address_3` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`office_address_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `office_address_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_address`
--

LOCK TABLES `office_address` WRITE;
/*!40000 ALTER TABLE `office_address` DISABLE KEYS */;
INSERT INTO `office_address` VALUES (1,2,'main road','','','','','','',''),(2,3,'Branch St','','','','','','',''),(3,4,'','','','','','','',''),(4,5,'','','','','','','',''),(5,6,'','','','','','','','');
/*!40000 ALTER TABLE `office_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_code`
--

DROP TABLE IF EXISTS `office_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_code` (
  `code_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`code_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `office_code_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_code`
--

LOCK TABLES `office_code` WRITE;
/*!40000 ALTER TABLE `office_code` DISABLE KEYS */;
INSERT INTO `office_code` VALUES (1,111),(2,112);
/*!40000 ALTER TABLE `office_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_custom_field`
--

DROP TABLE IF EXISTS `office_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_custom_field` (
  `office_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` smallint(6) NOT NULL,
  `field_id` smallint(6) NOT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`office_custom_field_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `office_custom_field_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_custom_field`
--

LOCK TABLES `office_custom_field` WRITE;
/*!40000 ALTER TABLE `office_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `office_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_hierarchy`
--

DROP TABLE IF EXISTS `office_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_hierarchy` (
  `hierarchy_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL,
  `office_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`hierarchy_id`),
  KEY `parent_id` (`parent_id`),
  KEY `updated_by` (`updated_by`),
  KEY `office_hierarchy_idx` (`office_id`,`status`),
  CONSTRAINT `office_hierarchy_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_hierarchy_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_hierarchy_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_hierarchy`
--

LOCK TABLES `office_hierarchy` WRITE;
/*!40000 ALTER TABLE `office_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `office_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_holiday`
--

DROP TABLE IF EXISTS `office_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_holiday` (
  `office_id` smallint(6) NOT NULL DEFAULT '0',
  `holiday_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`office_id`,`holiday_id`),
  KEY `holiday_id` (`holiday_id`),
  CONSTRAINT `office_holiday_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `office_holiday_ibfk_2` FOREIGN KEY (`holiday_id`) REFERENCES `holiday` (`holiday_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_holiday`
--

LOCK TABLES `office_holiday` WRITE;
/*!40000 ALTER TABLE `office_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `office_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_level`
--

DROP TABLE IF EXISTS `office_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_level` (
  `level_id` smallint(6) NOT NULL,
  `parent_level_id` smallint(6) DEFAULT NULL,
  `level_name_id` smallint(6) DEFAULT NULL,
  `interaction_flag` smallint(6) DEFAULT NULL,
  `configured` smallint(6) NOT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`level_id`),
  KEY `parent_level_id` (`parent_level_id`),
  CONSTRAINT `office_level_ibfk_1` FOREIGN KEY (`parent_level_id`) REFERENCES `office_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_level`
--

LOCK TABLES `office_level` WRITE;
/*!40000 ALTER TABLE `office_level` DISABLE KEYS */;
INSERT INTO `office_level` VALUES (1,NULL,104,0,1,NULL),(2,1,105,0,1,NULL),(3,2,106,0,1,NULL),(4,3,107,0,1,NULL),(5,4,108,1,1,NULL);
/*!40000 ALTER TABLE `office_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_status`
--

DROP TABLE IF EXISTS `office_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office_status` (
  `status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `office_status_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_status`
--

LOCK TABLES `office_status` WRITE;
/*!40000 ALTER TABLE `office_status` DISABLE KEYS */;
INSERT INTO `office_status` VALUES (1,15),(2,16);
/*!40000 ALTER TABLE `office_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `payment_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `payment_type_lookup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`),
  KEY `payment_type_lookup_id` (`payment_type_lookup_id`),
  CONSTRAINT `payment_type_ibfk_1` FOREIGN KEY (`payment_type_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,177),(2,179),(3,180);
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty` (
  `penalty_id` smallint(6) NOT NULL,
  `global_penalty_num` varchar(100) DEFAULT NULL,
  `penalty_type` varchar(100) DEFAULT NULL,
  `office_id` smallint(6) DEFAULT NULL,
  `category_id` smallint(6) DEFAULT NULL,
  `glcode_id` smallint(6) NOT NULL,
  `lookup_id` int(11) DEFAULT NULL,
  `rate` decimal(13,10) NOT NULL,
  `formula` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`penalty_id`),
  KEY `category_id` (`category_id`),
  KEY `glcode_id` (`glcode_id`),
  KEY `lookup_id` (`lookup_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_type` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `penalty_ibfk_2` FOREIGN KEY (`glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `penalty_ibfk_3` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `penalty_ibfk_4` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel` (
  `personnel_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `level_id` smallint(6) NOT NULL,
  `global_personnel_num` varchar(100) DEFAULT NULL,
  `office_id` smallint(6) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `personnel_status` smallint(6) DEFAULT NULL,
  `preferred_locale` smallint(6) DEFAULT NULL,
  `search_id` varchar(100) DEFAULT NULL,
  `max_child_count` int(11) DEFAULT NULL,
  `password` tinyblob,
  `login_name` varchar(200) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `password_changed` smallint(6) NOT NULL,
  `display_name` varchar(200) DEFAULT NULL,
  `created_by` smallint(6) NOT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `locked` smallint(6) NOT NULL,
  `no_of_tries` smallint(6) NOT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`personnel_id`),
  UNIQUE KEY `personnel_global_idx` (`global_personnel_num`),
  UNIQUE KEY `personnel_search_idx` (`search_id`),
  UNIQUE KEY `personnel_login_idx` (`login_name`),
  KEY `created_by` (`created_by`),
  KEY `level_id` (`level_id`),
  KEY `preferred_locale` (`preferred_locale`),
  KEY `title` (`title`),
  KEY `updated_by` (`updated_by`),
  KEY `personnel_office_idx` (`office_id`),
  CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `personnel_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_ibfk_4` FOREIGN KEY (`preferred_locale`) REFERENCES `supported_locale` (`locale_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_ibfk_5` FOREIGN KEY (`title`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,2,'1',1,1,1,1,NULL,1,'\"då§#0•añMæ2ıNj§ùÚ d≤QS8Ÿ','mifos',NULL,1,'mifos',1,NULL,1,NULL,'2010-08-28',0,0,25),(2,2,'0002-00002',2,NULL,1,1,NULL,NULL,'’L∂a∏ŸÌ}õê$π\"UíÙahú','ROadminperson','',0,'RO admin person now',1,'2010-07-01',NULL,NULL,NULL,0,0,1),(3,1,'0003-00003',3,NULL,1,1,NULL,NULL,'|™ﬁSõ*å°ùíΩ°û˙ (Ωˇ8@¿vƒÎ€','br1lo1','',0,'br1 lo 1 smith',1,'2010-07-01',NULL,NULL,NULL,0,0,1),(4,1,'0003-00004',3,632,1,1,NULL,NULL,'≥]g°ô-]`É t!wÍı≈ETCÜ;ywá','br1lo2','',0,'br1 lo 2 xxx',1,'2010-07-04',NULL,NULL,NULL,0,0,1),(5,1,'0004-00005',4,NULL,1,1,NULL,NULL,'Ï>ø%):[ÄÔL,ìU_I>çHJTiX9ı','br2LOxx','',0,'br2 LO xxx',1,'2010-07-20',NULL,NULL,NULL,0,0,1),(6,1,'0003-00006',3,NULL,1,1,NULL,NULL,'©Ï¡„∫ãêYWJãûr]Çˇ__Ø»DfYT´','br1lo3Sturty','',0,'br1 lo3 Sturty xxx',1,'2010-07-29',NULL,NULL,NULL,0,0,1),(7,1,'0006-00007',6,632,1,1,NULL,NULL,'tQ$–ìÄÊ“%*¢•Få≈”7Yc_7	$u»','mahfees','',0,'Fees LO xxx',1,'2010-08-27',NULL,NULL,NULL,0,0,1);
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_custom_field`
--

DROP TABLE IF EXISTS `personnel_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_custom_field` (
  `personnel_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` smallint(6) NOT NULL,
  `personnel_id` smallint(6) NOT NULL,
  `field_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`personnel_custom_field_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `personnel_custom_field_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_custom_field_ibfk_2` FOREIGN KEY (`field_id`) REFERENCES `custom_field_definition` (`field_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_custom_field`
--

LOCK TABLES `personnel_custom_field` WRITE;
/*!40000 ALTER TABLE `personnel_custom_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_details`
--

DROP TABLE IF EXISTS `personnel_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_details` (
  `personnel_id` smallint(6) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `second_last_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `government_id_number` varchar(50) DEFAULT NULL,
  `dob` date NOT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `date_of_joining_mfi` date DEFAULT NULL,
  `date_of_joining_branch` date DEFAULT NULL,
  `date_of_leaving_branch` date DEFAULT NULL,
  `address_1` varchar(200) DEFAULT NULL,
  `address_2` varchar(200) DEFAULT NULL,
  `address_3` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  KEY `personnel_id` (`personnel_id`),
  KEY `gender` (`gender`),
  KEY `marital_status` (`marital_status`),
  CONSTRAINT `personnel_details_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_details_ibfk_2` FOREIGN KEY (`gender`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_details_ibfk_3` FOREIGN KEY (`marital_status`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_details`
--

LOCK TABLES `personnel_details` WRITE;
/*!40000 ALTER TABLE `personnel_details` DISABLE KEYS */;
INSERT INTO `personnel_details` VALUES (1,'Mifos',NULL,NULL,'MFI','123','1979-12-12',NULL,50,NULL,NULL,NULL,'Bangalore',NULL,NULL,'Bangalore','Bangalore','Bangalore',NULL,NULL),(2,'RO admin person','','','now','','1988-07-09',NULL,50,'2009-04-01','2010-07-01',NULL,'','','','','','','',''),(3,'br1 lo 1','','','smith','','1984-06-07',NULL,50,'2010-06-20','2010-07-01',NULL,'','','','','','','',''),(4,'br1 lo 2','','','xxx','','1966-07-09',NULL,49,'2010-07-04','2010-07-04',NULL,'','','','','','','',''),(5,'br2 LO','','','xxx','','1976-10-03',NULL,50,'2010-07-20','2010-07-20',NULL,'','','','','','','',''),(6,'br1 lo3 Sturty','','','xxx','','1977-08-08',NULL,50,'2010-07-29','2010-07-29',NULL,'','','','','','','',''),(7,'Fees LO','','','xxx','','1986-09-09',633,50,'2010-04-27','2010-08-27',NULL,'','','','','','','','');
/*!40000 ALTER TABLE `personnel_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_hierarchy`
--

DROP TABLE IF EXISTS `personnel_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_hierarchy` (
  `hierarchy_id` int(11) NOT NULL,
  `parent_id` smallint(6) NOT NULL,
  `personnel_id` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`hierarchy_id`),
  KEY `parent_id` (`parent_id`),
  KEY `updated_by` (`updated_by`),
  KEY `personnel_hierarchy_idx` (`personnel_id`,`status`),
  CONSTRAINT `personnel_hierarchy_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_hierarchy_ibfk_2` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_hierarchy_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_hierarchy`
--

LOCK TABLES `personnel_hierarchy` WRITE;
/*!40000 ALTER TABLE `personnel_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_level`
--

DROP TABLE IF EXISTS `personnel_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_level` (
  `level_id` smallint(6) NOT NULL,
  `level_name_id` int(11) NOT NULL,
  `parent_level_id` smallint(6) DEFAULT NULL,
  `interaction_flag` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`level_id`),
  KEY `parent_level_id` (`parent_level_id`),
  KEY `level_name_id` (`level_name_id`),
  CONSTRAINT `personnel_level_ibfk_1` FOREIGN KEY (`parent_level_id`) REFERENCES `personnel_level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_level_ibfk_2` FOREIGN KEY (`level_name_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_level`
--

LOCK TABLES `personnel_level` WRITE;
/*!40000 ALTER TABLE `personnel_level` DISABLE KEYS */;
INSERT INTO `personnel_level` VALUES (1,60,1,0),(2,61,1,0);
/*!40000 ALTER TABLE `personnel_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_movement`
--

DROP TABLE IF EXISTS `personnel_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_movement` (
  `personnel_movement_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `personnel_id` smallint(6) DEFAULT NULL,
  `office_id` smallint(6) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`personnel_movement_id`),
  KEY `updated_by` (`updated_by`),
  KEY `office_id` (`office_id`),
  KEY `personnel_movement_idx` (`personnel_id`),
  CONSTRAINT `personnel_movement_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_movement_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_movement_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_movement`
--

LOCK TABLES `personnel_movement` WRITE;
/*!40000 ALTER TABLE `personnel_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_notes`
--

DROP TABLE IF EXISTS `personnel_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_notes` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `personnel_id` smallint(6) NOT NULL,
  `comment_date` date NOT NULL,
  `comments` varchar(500) NOT NULL,
  `officer_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `personnel_notes_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_notes_ibfk_2` FOREIGN KEY (`officer_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_notes`
--

LOCK TABLES `personnel_notes` WRITE;
/*!40000 ALTER TABLE `personnel_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_role`
--

DROP TABLE IF EXISTS `personnel_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_role` (
  `personnel_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` smallint(6) NOT NULL,
  `personnel_id` smallint(6) NOT NULL,
  PRIMARY KEY (`personnel_role_id`),
  KEY `personnel_id` (`personnel_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `personnel_role_ibfk_1` FOREIGN KEY (`personnel_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personnel_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_role`
--

LOCK TABLES `personnel_role` WRITE;
/*!40000 ALTER TABLE `personnel_role` DISABLE KEYS */;
INSERT INTO `personnel_role` VALUES (1,1,1);
/*!40000 ALTER TABLE `personnel_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_status`
--

DROP TABLE IF EXISTS `personnel_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel_status` (
  `personnel_status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`personnel_status_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `personnel_status_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel_status`
--

LOCK TABLES `personnel_status` WRITE;
/*!40000 ALTER TABLE `personnel_status` DISABLE KEYS */;
INSERT INTO `personnel_status` VALUES (1,152),(2,153);
/*!40000 ALTER TABLE `personnel_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`position_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,186),(2,187),(3,188),(4,216);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppi_likelihoods`
--

DROP TABLE IF EXISTS `ppi_likelihoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppi_likelihoods` (
  `likelihood_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `score_from` int(11) NOT NULL,
  `score_to` int(11) NOT NULL,
  `bottom_half_below` decimal(21,4) NOT NULL,
  `top_half_below` decimal(21,4) NOT NULL,
  `likelihood_order` int(11) NOT NULL,
  PRIMARY KEY (`likelihood_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `ppi_likelihoods_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppi_likelihoods`
--

LOCK TABLES `ppi_likelihoods` WRITE;
/*!40000 ALTER TABLE `ppi_likelihoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppi_likelihoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppi_survey`
--

DROP TABLE IF EXISTS `ppi_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppi_survey` (
  `country_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `very_poor_min` int(11) NOT NULL,
  `very_poor_max` int(11) NOT NULL,
  `poor_min` int(11) NOT NULL,
  `poor_max` int(11) NOT NULL,
  `at_risk_min` int(11) NOT NULL,
  `at_risk_max` int(11) NOT NULL,
  `non_poor_min` int(11) NOT NULL,
  `non_poor_max` int(11) NOT NULL,
  PRIMARY KEY (`country_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `ppi_survey_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppi_survey`
--

LOCK TABLES `ppi_survey` WRITE;
/*!40000 ALTER TABLE `ppi_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppi_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ppi_survey_instance`
--

DROP TABLE IF EXISTS `ppi_survey_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ppi_survey_instance` (
  `instance_id` int(11) NOT NULL,
  `bottom_half_below` decimal(21,4) DEFAULT NULL,
  `top_half_below` decimal(21,4) DEFAULT NULL,
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ppi_survey_instance`
--

LOCK TABLES `ppi_survey_instance` WRITE;
/*!40000 ALTER TABLE `ppi_survey_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `ppi_survey_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_applicable_master`
--

DROP TABLE IF EXISTS `prd_applicable_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_applicable_master` (
  `prd_applicable_master_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`prd_applicable_master_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `prd_applicable_master_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_applicable_master`
--

LOCK TABLES `prd_applicable_master` WRITE;
/*!40000 ALTER TABLE `prd_applicable_master` DISABLE KEYS */;
INSERT INTO `prd_applicable_master` VALUES (1,68),(2,69),(3,70);
/*!40000 ALTER TABLE `prd_applicable_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_category`
--

DROP TABLE IF EXISTS `prd_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_category` (
  `prd_category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_type_id` smallint(6) NOT NULL,
  `global_prd_offering_num` varchar(50) NOT NULL,
  `prd_category_name` varchar(100) NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `office_id` smallint(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `udpated_date` date DEFAULT NULL,
  `state` smallint(6) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`prd_category_id`),
  KEY `prd_type_id` (`prd_type_id`),
  CONSTRAINT `prd_category_ibfk_1` FOREIGN KEY (`prd_type_id`) REFERENCES `prd_type` (`prd_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_category`
--

LOCK TABLES `prd_category` WRITE;
/*!40000 ALTER TABLE `prd_category` DISABLE KEYS */;
INSERT INTO `prd_category` VALUES (1,1,'1-1','Other',NULL,NULL,NULL,NULL,NULL,1,NULL,1),(2,2,'1-2','Other',NULL,NULL,NULL,NULL,NULL,1,NULL,1);
/*!40000 ALTER TABLE `prd_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_category_status`
--

DROP TABLE IF EXISTS `prd_category_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_category_status` (
  `prd_category_status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`prd_category_status_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `prd_category_status_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_category_status`
--

LOCK TABLES `prd_category_status` WRITE;
/*!40000 ALTER TABLE `prd_category_status` DISABLE KEYS */;
INSERT INTO `prd_category_status` VALUES (2,113),(1,114);
/*!40000 ALTER TABLE `prd_category_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_checklist`
--

DROP TABLE IF EXISTS `prd_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_checklist` (
  `checklist_id` smallint(6) NOT NULL,
  `prd_type_id` smallint(6) DEFAULT NULL,
  `account_status` smallint(6) NOT NULL,
  PRIMARY KEY (`checklist_id`),
  KEY `account_status` (`account_status`),
  KEY `prd_type_id` (`prd_type_id`),
  CONSTRAINT `prd_checklist_ibfk_1` FOREIGN KEY (`account_status`) REFERENCES `account_state` (`account_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_checklist_ibfk_2` FOREIGN KEY (`checklist_id`) REFERENCES `checklist` (`checklist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_checklist_ibfk_3` FOREIGN KEY (`prd_type_id`) REFERENCES `prd_type` (`prd_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_checklist`
--

LOCK TABLES `prd_checklist` WRITE;
/*!40000 ALTER TABLE `prd_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `prd_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_fee_frequency`
--

DROP TABLE IF EXISTS `prd_fee_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_fee_frequency` (
  `prdoffering_fee_id` smallint(6) NOT NULL,
  `fee_id` smallint(6) DEFAULT NULL,
  `frequency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`prdoffering_fee_id`),
  KEY `fee_id` (`fee_id`),
  KEY `frequency_id` (`frequency_id`),
  CONSTRAINT `prd_fee_frequency_ibfk_1` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_fee_frequency_ibfk_2` FOREIGN KEY (`prdoffering_fee_id`) REFERENCES `prd_offering_fees` (`prd_offering_fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_fee_frequency_ibfk_3` FOREIGN KEY (`frequency_id`) REFERENCES `recurrence_type` (`recurrence_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_fee_frequency`
--

LOCK TABLES `prd_fee_frequency` WRITE;
/*!40000 ALTER TABLE `prd_fee_frequency` DISABLE KEYS */;
/*!40000 ALTER TABLE `prd_fee_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_offering`
--

DROP TABLE IF EXISTS `prd_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_offering` (
  `prd_offering_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_applicable_master_id` smallint(6) NOT NULL,
  `global_prd_offering_num` varchar(50) NOT NULL,
  `prd_category_id` smallint(6) NOT NULL,
  `prd_type_id` smallint(6) DEFAULT NULL,
  `office_id` smallint(6) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `glcode_id` smallint(6) DEFAULT NULL,
  `prd_offering_name` varchar(50) NOT NULL,
  `prd_offering_short_name` varchar(50) NOT NULL,
  `offering_status_id` smallint(6) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  `prd_mix_flag` smallint(6) DEFAULT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`prd_offering_id`),
  UNIQUE KEY `prd_offering_global_idx` (`global_prd_offering_num`),
  UNIQUE KEY `prd_offering_name_idx` (`prd_offering_name`),
  UNIQUE KEY `prd_offering_short_name_idx` (`prd_offering_short_name`),
  KEY `glcode_id` (`glcode_id`),
  KEY `prd_category_id` (`prd_category_id`),
  KEY `offering_status_id` (`offering_status_id`),
  KEY `prd_applicable_master_id` (`prd_applicable_master_id`),
  KEY `currency_id` (`currency_id`),
  KEY `prd_offering_office_idx` (`office_id`),
  KEY `prd_type_idx` (`prd_type_id`),
  CONSTRAINT `prd_offering_ibfk_1` FOREIGN KEY (`glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_ibfk_3` FOREIGN KEY (`prd_category_id`) REFERENCES `prd_category` (`prd_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_ibfk_4` FOREIGN KEY (`offering_status_id`) REFERENCES `prd_status` (`offering_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_ibfk_5` FOREIGN KEY (`prd_type_id`) REFERENCES `prd_type` (`prd_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_ibfk_6` FOREIGN KEY (`prd_applicable_master_id`) REFERENCES `prd_applicable_master` (`prd_applicable_master_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_ibfk_7` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_offering`
--

LOCK TABLES `prd_offering` WRITE;
/*!40000 ALTER TABLE `prd_offering` DISABLE KEYS */;
INSERT INTO `prd_offering` VALUES (1,1,'1-001',1,1,1,'2010-07-02',NULL,NULL,'loan prod 1','lp1',1,'','2010-07-02',1,'2010-08-28',1,1,NULL,2),(2,1,'1-002',2,2,1,'2010-07-02',NULL,NULL,'savings product 1','sp1',2,'','2010-07-02',1,NULL,NULL,0,NULL,NULL),(3,1,'1-003',2,2,1,'2010-07-02',NULL,NULL,'savings product 2','sp2',2,'','2010-07-02',1,NULL,NULL,0,NULL,NULL),(4,1,'1-004',1,1,1,'2010-07-02',NULL,NULL,'loan prod 2','lp2',1,'','2010-07-02',1,'2010-08-28',1,1,NULL,2),(5,2,'1-005',1,1,1,'2010-07-25',NULL,NULL,'group loan','gl',1,'','2010-07-25',1,'2010-08-28',1,1,NULL,2),(6,2,'1-006',2,2,1,'2010-07-25',NULL,NULL,'group savings product','gsp',2,'','2010-07-25',1,NULL,NULL,0,NULL,NULL),(7,3,'1-007',2,2,1,'2010-07-25',NULL,NULL,'center savings','cs1a',2,'','2010-07-25',1,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `prd_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_offering_fees`
--

DROP TABLE IF EXISTS `prd_offering_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_offering_fees` (
  `prd_offering_fee_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fee_id` smallint(6) DEFAULT NULL,
  `prd_offering_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`prd_offering_fee_id`),
  KEY `fee_id` (`fee_id`),
  KEY `prd_offering_fee_idx` (`prd_offering_id`,`fee_id`),
  CONSTRAINT `prd_offering_fees_ibfk_1` FOREIGN KEY (`fee_id`) REFERENCES `fees` (`fee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_fees_ibfk_2` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_offering_fees`
--

LOCK TABLES `prd_offering_fees` WRITE;
/*!40000 ALTER TABLE `prd_offering_fees` DISABLE KEYS */;
INSERT INTO `prd_offering_fees` VALUES (7,5,1),(6,6,1),(8,7,1),(5,8,1),(10,5,4),(12,6,4),(9,7,4),(11,8,4),(3,5,5),(1,6,5),(4,7,5),(2,8,5);
/*!40000 ALTER TABLE `prd_offering_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_offering_meeting`
--

DROP TABLE IF EXISTS `prd_offering_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_offering_meeting` (
  `prd_offering_meeting_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `prd_meeting_id` int(11) DEFAULT NULL,
  `prd_offering_meeting_type_id` smallint(6) NOT NULL,
  PRIMARY KEY (`prd_offering_meeting_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  KEY `prd_meeting_id` (`prd_meeting_id`),
  KEY `prd_offering_meeting_type_id` (`prd_offering_meeting_type_id`),
  CONSTRAINT `prd_offering_meeting_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`),
  CONSTRAINT `prd_offering_meeting_ibfk_2` FOREIGN KEY (`prd_meeting_id`) REFERENCES `meeting` (`meeting_id`),
  CONSTRAINT `prd_offering_meeting_ibfk_3` FOREIGN KEY (`prd_offering_meeting_type_id`) REFERENCES `meeting_type` (`meeting_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_offering_meeting`
--

LOCK TABLES `prd_offering_meeting` WRITE;
/*!40000 ALTER TABLE `prd_offering_meeting` DISABLE KEYS */;
INSERT INTO `prd_offering_meeting` VALUES (1,1,2,1),(2,2,3,3),(3,2,4,2),(4,3,5,2),(5,3,6,3),(6,4,8,1),(7,5,41,1),(8,6,42,3),(9,6,43,2),(10,7,44,3),(11,7,45,2);
/*!40000 ALTER TABLE `prd_offering_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_offering_mix`
--

DROP TABLE IF EXISTS `prd_offering_mix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_offering_mix` (
  `prd_offering_mix_id` int(11) NOT NULL AUTO_INCREMENT,
  `prd_offering_id` smallint(6) NOT NULL,
  `prd_offering_not_allowed_id` smallint(6) NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`prd_offering_mix_id`),
  KEY `prd_offering_mix_prd_offering_id_1` (`prd_offering_id`),
  KEY `prd_offering_mix_prd_offering_id_2` (`prd_offering_not_allowed_id`),
  CONSTRAINT `prd_offering_mix_prd_offering_id_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_offering_mix_prd_offering_id_2` FOREIGN KEY (`prd_offering_not_allowed_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_offering_mix`
--

LOCK TABLES `prd_offering_mix` WRITE;
/*!40000 ALTER TABLE `prd_offering_mix` DISABLE KEYS */;
/*!40000 ALTER TABLE `prd_offering_mix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_state`
--

DROP TABLE IF EXISTS `prd_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_state` (
  `prd_state_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_state_lookup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prd_state_id`),
  KEY `prd_state_lookup_id` (`prd_state_lookup_id`),
  CONSTRAINT `prd_state_ibfk_1` FOREIGN KEY (`prd_state_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_state`
--

LOCK TABLES `prd_state` WRITE;
/*!40000 ALTER TABLE `prd_state` DISABLE KEYS */;
INSERT INTO `prd_state` VALUES (1,115),(2,116);
/*!40000 ALTER TABLE `prd_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_status`
--

DROP TABLE IF EXISTS `prd_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_status` (
  `offering_status_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_state_id` smallint(6) NOT NULL,
  `prd_type_id` smallint(6) NOT NULL,
  `currently_in_use` smallint(6) NOT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`offering_status_id`),
  KEY `prd_type_id` (`prd_type_id`),
  KEY `prd_state_id` (`prd_state_id`),
  CONSTRAINT `prd_status_ibfk_1` FOREIGN KEY (`prd_type_id`) REFERENCES `prd_type` (`prd_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prd_status_ibfk_2` FOREIGN KEY (`prd_state_id`) REFERENCES `prd_state` (`prd_state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_status`
--

LOCK TABLES `prd_status` WRITE;
/*!40000 ALTER TABLE `prd_status` DISABLE KEYS */;
INSERT INTO `prd_status` VALUES (1,1,1,1,1),(2,1,2,1,1),(4,2,1,1,1),(5,2,2,1,1);
/*!40000 ALTER TABLE `prd_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prd_type`
--

DROP TABLE IF EXISTS `prd_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prd_type` (
  `prd_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `prd_type_lookup_id` int(11) NOT NULL,
  `lateness_days` smallint(6) DEFAULT NULL,
  `dormancy_days` smallint(6) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`prd_type_id`),
  KEY `prd_type_lookup_id` (`prd_type_lookup_id`),
  CONSTRAINT `prd_type_ibfk_1` FOREIGN KEY (`prd_type_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prd_type`
--

LOCK TABLES `prd_type` WRITE;
/*!40000 ALTER TABLE `prd_type` DISABLE KEYS */;
INSERT INTO `prd_type` VALUES (1,54,10,1,1),(2,55,12,30,1);
/*!40000 ALTER TABLE `prd_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_offering_mandatory_savings`
--

DROP TABLE IF EXISTS `product_offering_mandatory_savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_offering_mandatory_savings` (
  `product_offering_mandatory_savings_id` smallint(6) NOT NULL,
  `product_offering_mandatory_savings_type` smallint(6) DEFAULT NULL,
  `prd_offering_id` smallint(6) DEFAULT NULL,
  `product_offering_mandatory_savings_value` smallint(6) DEFAULT NULL,
  `product_offering_mandatory_savings_range` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`product_offering_mandatory_savings_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  CONSTRAINT `product_offering_mandatory_savings_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_offering_mandatory_savings`
--

LOCK TABLES `product_offering_mandatory_savings` WRITE;
/*!40000 ALTER TABLE `product_offering_mandatory_savings` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_offering_mandatory_savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` smallint(6) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  `glcode_id` smallint(6) DEFAULT NULL,
  `program_name` varchar(100) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `confidentiality` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  KEY `glcode_id` (`glcode_id`),
  KEY `lookup_id` (`lookup_id`),
  KEY `office_id` (`office_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `program_ibfk_2` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `program_ibfk_3` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_fund`
--

DROP TABLE IF EXISTS `program_fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_fund` (
  `program_fund_id` smallint(6) NOT NULL,
  `fund_id` smallint(6) DEFAULT NULL,
  `program_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`program_fund_id`),
  KEY `fund_id` (`fund_id`),
  KEY `program_id` (`program_id`),
  CONSTRAINT `program_fund_ibfk_1` FOREIGN KEY (`fund_id`) REFERENCES `fund` (`fund_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `program_fund_ibfk_2` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_fund`
--

LOCK TABLES `program_fund` WRITE;
/*!40000 ALTER TABLE `program_fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_choices`
--

DROP TABLE IF EXISTS `question_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_choices` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `choice_text` varchar(200) NOT NULL,
  `choice_order` int(11) NOT NULL,
  `ppi` varchar(1) NOT NULL,
  `ppi_points` int(11) DEFAULT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_choices`
--

LOCK TABLES `question_choices` WRITE;
/*!40000 ALTER TABLE `question_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_group`
--

DROP TABLE IF EXISTS `question_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `date_of_creation` date NOT NULL,
  `state` int(11) NOT NULL,
  `is_editable` tinyint(4) NOT NULL DEFAULT '0',
  `is_ppi` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_group`
--

LOCK TABLES `question_group` WRITE;
/*!40000 ALTER TABLE `question_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_group_instance`
--

DROP TABLE IF EXISTS `question_group_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_group_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_group_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `date_conducted` date NOT NULL,
  `completed_status` smallint(6) NOT NULL,
  `created_by` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_group_id` (`question_group_id`),
  CONSTRAINT `question_group_instance_ibfk_1` FOREIGN KEY (`question_group_id`) REFERENCES `question_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_group_instance`
--

LOCK TABLES `question_group_instance` WRITE;
/*!40000 ALTER TABLE `question_group_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_group_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_group_response`
--

DROP TABLE IF EXISTS `question_group_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_group_response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_group_instance_id` int(11) NOT NULL,
  `sections_questions_id` int(11) NOT NULL,
  `response` varchar(200) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_questions_id` (`sections_questions_id`),
  KEY `question_group_instance_id` (`question_group_instance_id`),
  CONSTRAINT `question_group_response_ibfk_1` FOREIGN KEY (`sections_questions_id`) REFERENCES `sections_questions` (`id`),
  CONSTRAINT `question_group_response_ibfk_2` FOREIGN KEY (`question_group_instance_id`) REFERENCES `question_group_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_group_response`
--

LOCK TABLES `question_group_response` WRITE;
/*!40000 ALTER TABLE `question_group_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_group_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_type` int(11) NOT NULL,
  `question_state` int(11) NOT NULL,
  `question_text` varchar(1000) NOT NULL,
  `numeric_min` int(11) DEFAULT NULL,
  `numeric_max` int(11) DEFAULT NULL,
  `short_name` varchar(50) NOT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `short_name` (`short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommended_amnt_unit`
--

DROP TABLE IF EXISTS `recommended_amnt_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommended_amnt_unit` (
  `recommended_amnt_unit_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`recommended_amnt_unit_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `recommended_amnt_unit_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommended_amnt_unit`
--

LOCK TABLES `recommended_amnt_unit` WRITE;
/*!40000 ALTER TABLE `recommended_amnt_unit` DISABLE KEYS */;
INSERT INTO `recommended_amnt_unit` VALUES (1,120),(2,121);
/*!40000 ALTER TABLE `recommended_amnt_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recur_on_day`
--

DROP TABLE IF EXISTS `recur_on_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recur_on_day` (
  `recur_on_day_id` int(11) NOT NULL AUTO_INCREMENT,
  `details_id` int(11) NOT NULL,
  `days` smallint(6) DEFAULT NULL,
  `rank_of_days` smallint(6) DEFAULT NULL,
  `day_number` smallint(6) DEFAULT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`recur_on_day_id`),
  KEY `details_id` (`details_id`),
  CONSTRAINT `recur_on_day_ibfk_1` FOREIGN KEY (`details_id`) REFERENCES `recurrence_detail` (`details_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recur_on_day`
--

LOCK TABLES `recur_on_day` WRITE;
/*!40000 ALTER TABLE `recur_on_day` DISABLE KEYS */;
INSERT INTO `recur_on_day` VALUES (1,1,5,NULL,NULL,13),(2,2,2,NULL,NULL,0),(3,3,NULL,NULL,1,0),(4,4,NULL,NULL,NULL,0),(5,5,NULL,NULL,NULL,0),(6,6,NULL,NULL,1,0),(7,7,5,NULL,NULL,0),(8,8,2,NULL,NULL,0),(9,9,NULL,NULL,NULL,0),(10,10,NULL,NULL,NULL,0),(11,11,5,NULL,NULL,0),(12,12,NULL,NULL,NULL,0),(13,13,NULL,NULL,NULL,0),(14,14,NULL,NULL,NULL,0),(15,15,5,NULL,NULL,0),(16,16,5,NULL,NULL,0),(17,17,NULL,NULL,NULL,0),(18,18,NULL,NULL,NULL,0),(19,19,5,NULL,NULL,0),(20,20,7,NULL,NULL,0),(21,21,7,NULL,NULL,0),(22,22,NULL,NULL,NULL,0),(23,23,3,NULL,NULL,4),(24,24,NULL,NULL,NULL,0),(25,25,NULL,NULL,NULL,0),(26,26,3,NULL,NULL,0),(27,27,NULL,NULL,NULL,0),(28,28,NULL,NULL,NULL,0),(29,29,5,NULL,NULL,0),(30,30,5,NULL,NULL,3),(31,31,5,NULL,NULL,0),(32,32,NULL,NULL,NULL,0),(33,33,NULL,NULL,NULL,0),(34,34,4,NULL,NULL,4),(35,35,3,NULL,NULL,0),(36,36,4,NULL,NULL,0),(37,37,5,NULL,NULL,0),(38,38,NULL,NULL,NULL,0),(39,39,5,NULL,NULL,0),(40,40,4,NULL,NULL,1),(41,41,2,NULL,NULL,0),(42,42,NULL,NULL,1,0),(43,43,NULL,NULL,NULL,0),(44,44,NULL,NULL,1,0),(45,45,NULL,NULL,NULL,0),(46,46,4,NULL,NULL,0),(47,47,NULL,NULL,NULL,0),(48,48,NULL,NULL,NULL,0),(49,49,4,NULL,NULL,0),(50,50,3,NULL,NULL,0),(51,51,NULL,NULL,NULL,0),(52,52,4,NULL,NULL,2),(53,53,NULL,NULL,NULL,0),(54,54,4,NULL,NULL,0),(55,55,NULL,NULL,NULL,0),(56,56,2,NULL,NULL,1),(57,57,4,NULL,NULL,1),(58,58,2,NULL,NULL,1),(59,59,NULL,NULL,NULL,0),(60,60,2,NULL,NULL,0),(61,61,4,NULL,NULL,0),(62,62,NULL,NULL,NULL,0),(63,63,4,NULL,NULL,0),(64,64,NULL,NULL,NULL,0),(65,65,4,NULL,NULL,2),(66,66,NULL,NULL,NULL,0),(67,67,2,NULL,NULL,0),(68,68,2,NULL,NULL,0),(69,69,NULL,NULL,NULL,0),(70,70,2,NULL,NULL,2),(71,71,2,NULL,NULL,0),(72,72,NULL,NULL,NULL,0),(73,73,2,NULL,NULL,0),(74,74,NULL,NULL,NULL,0),(75,75,2,NULL,NULL,1),(76,76,2,NULL,NULL,2),(77,77,NULL,NULL,NULL,0),(78,78,NULL,NULL,NULL,0),(79,79,2,NULL,NULL,0),(80,80,6,NULL,NULL,2),(81,81,6,NULL,NULL,0),(82,82,2,NULL,NULL,0),(83,83,2,NULL,NULL,0),(84,84,NULL,NULL,NULL,0),(85,85,7,NULL,NULL,1),(86,86,2,NULL,NULL,0),(87,87,7,NULL,NULL,0);
/*!40000 ALTER TABLE `recur_on_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurrence_detail`
--

DROP TABLE IF EXISTS `recurrence_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurrence_detail` (
  `details_id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `recurrence_id` smallint(6) DEFAULT NULL,
  `recur_after` smallint(6) NOT NULL,
  `version_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`details_id`),
  KEY `recurrence_id` (`recurrence_id`),
  KEY `meeting_id` (`meeting_id`),
  CONSTRAINT `recurrence_detail_ibfk_1` FOREIGN KEY (`recurrence_id`) REFERENCES `recurrence_type` (`recurrence_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recurrence_detail_ibfk_2` FOREIGN KEY (`meeting_id`) REFERENCES `meeting` (`meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurrence_detail`
--

LOCK TABLES `recurrence_detail` WRITE;
/*!40000 ALTER TABLE `recurrence_detail` DISABLE KEYS */;
INSERT INTO `recurrence_detail` VALUES (1,1,1,1,13),(2,2,1,1,0),(3,3,2,1,0),(4,4,3,1,0),(5,5,3,1,0),(6,6,2,3,0),(7,7,1,1,0),(8,8,1,1,0),(9,9,3,1,0),(10,10,3,1,0),(11,11,1,1,0),(12,12,3,1,0),(13,13,3,1,0),(14,14,3,1,0),(15,15,1,1,0),(16,16,1,1,0),(17,17,3,1,0),(18,18,3,1,0),(19,19,1,1,0),(20,20,1,1,0),(21,21,1,1,0),(22,22,3,1,0),(23,23,1,1,4),(24,24,3,1,0),(25,25,3,1,0),(26,26,1,1,0),(27,27,3,1,0),(28,28,3,1,0),(29,29,1,1,0),(30,30,1,1,3),(31,31,1,1,0),(32,32,3,1,0),(33,33,3,1,0),(34,34,1,1,4),(35,35,1,1,0),(36,36,1,2,0),(37,37,1,1,0),(38,38,3,1,0),(39,39,1,1,0),(40,40,1,1,1),(41,41,1,1,0),(42,42,2,1,0),(43,43,3,1,0),(44,44,2,1,0),(45,45,3,7,0),(46,46,1,1,0),(47,47,3,1,0),(48,48,3,1,0),(49,49,1,1,0),(50,50,1,1,0),(51,51,3,7,0),(52,52,1,1,2),(53,53,3,1,0),(54,54,1,1,0),(55,55,3,7,0),(56,56,1,3,1),(57,57,1,1,1),(58,58,1,1,1),(59,59,3,1,0),(60,60,1,1,0),(61,61,1,1,0),(62,62,3,1,0),(63,63,1,1,0),(64,64,3,1,0),(65,65,1,1,1),(66,66,3,1,0),(67,67,1,1,0),(68,68,1,1,0),(69,69,3,1,0),(70,70,1,1,2),(71,71,1,1,0),(72,72,3,1,0),(73,73,1,1,0),(74,74,3,1,0),(75,75,1,1,1),(76,76,1,1,2),(77,77,3,1,0),(78,78,3,1,0),(79,79,1,1,0),(80,80,1,1,2),(81,81,1,1,0),(82,82,1,1,0),(83,83,1,1,0),(84,84,3,1,0),(85,85,1,1,1),(86,86,1,1,0),(87,87,1,1,0);
/*!40000 ALTER TABLE `recurrence_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurrence_type`
--

DROP TABLE IF EXISTS `recurrence_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurrence_type` (
  `recurrence_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `recurrence_name` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`recurrence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurrence_type`
--

LOCK TABLES `recurrence_type` WRITE;
/*!40000 ALTER TABLE `recurrence_type` DISABLE KEYS */;
INSERT INTO `recurrence_type` VALUES (1,'Week(s)','Weekly Recurrence'),(2,'Month(s)','Monthly Recurrence'),(3,'Day(s)','Daily Recurrence');
/*!40000 ALTER TABLE `recurrence_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repayment_rule`
--

DROP TABLE IF EXISTS `repayment_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repayment_rule` (
  `repayment_rule_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `repayment_rule_lookup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`repayment_rule_id`),
  KEY `repayment_rule_lookup_id` (`repayment_rule_lookup_id`),
  CONSTRAINT `repayment_rule_ibfk_1` FOREIGN KEY (`repayment_rule_lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment_rule`
--

LOCK TABLES `repayment_rule` WRITE;
/*!40000 ALTER TABLE `repayment_rule` DISABLE KEYS */;
INSERT INTO `repayment_rule` VALUES (1,576),(2,577),(3,578),(4,626);
/*!40000 ALTER TABLE `repayment_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `report_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `report_category_id` smallint(6) DEFAULT NULL,
  `report_name` varchar(100) DEFAULT NULL,
  `report_identifier` varchar(100) DEFAULT NULL,
  `activity_id` smallint(6) DEFAULT NULL,
  `report_active` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_category_id` (`report_category_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`report_category_id`) REFERENCES `report_category` (`report_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `report_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (1,1,'Collection Sheet Report','collection_sheet_report',229,1),(2,6,'Branch Cash Confirmation Report','branch_cash_confirmation_report',231,1),(3,6,'Branch Progress Report','branch_progress_report',232,1),(4,6,'Detailed Aging Of Portfolio At Risk Report','detailed_aging_of_portfolio_at_risk_report',236,1),(5,6,'General Ledger Report','general_ledger_report',237,1);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_category`
--

DROP TABLE IF EXISTS `report_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_category` (
  `report_category_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `report_category_value` varchar(100) DEFAULT NULL,
  `activity_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`report_category_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `report_category_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_category`
--

LOCK TABLES `report_category` WRITE;
/*!40000 ALTER TABLE `report_category` DISABLE KEYS */;
INSERT INTO `report_category` VALUES (1,'Client Detail',145),(2,'Performance',148),(3,'Center',146),(4,'Loan Product Detail',149),(5,'Status',147),(6,'Analysis',150),(7,'Miscellaneous',151);
/*!40000 ALTER TABLE `report_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_datasource`
--

DROP TABLE IF EXISTS `report_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_datasource` (
  `datasource_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `driver` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `max_idle` int(11) DEFAULT NULL,
  `max_active` int(11) DEFAULT NULL,
  `max_wait` bigint(20) DEFAULT NULL,
  `validation_query` varchar(255) DEFAULT NULL,
  `jndi` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`datasource_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_datasource`
--

LOCK TABLES `report_datasource` WRITE;
/*!40000 ALTER TABLE `report_datasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_datasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_jasper_map`
--

DROP TABLE IF EXISTS `report_jasper_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_jasper_map` (
  `report_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `report_category_id` smallint(6) DEFAULT NULL,
  `report_name` varchar(100) DEFAULT NULL,
  `report_identifier` varchar(100) DEFAULT NULL,
  `report_jasper` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_category_id` (`report_category_id`),
  CONSTRAINT `report_jasper_map_ibfk_1` FOREIGN KEY (`report_category_id`) REFERENCES `report_category` (`report_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_jasper_map`
--

LOCK TABLES `report_jasper_map` WRITE;
/*!40000 ALTER TABLE `report_jasper_map` DISABLE KEYS */;
INSERT INTO `report_jasper_map` VALUES (1,1,'Collection Sheet Report','collection_sheet_report','CollectionSheetReport.rptdesign'),(2,6,'Branch Cash Confirmation Report','branch_cash_confirmation_report','BranchCashConfirmationReport.rptdesign'),(3,6,'Branch Progress Report','branch_progress_report','ProgressReport.rptdesign'),(4,6,'Detailed Aging Of Portfolio At Risk Report','detailed_aging_of_portfolio_at_risk_report','DetailedAgingPortfolioAtRiskReport.rptdesign'),(5,6,'General Ledger Report','general_ledger_report','GeneralLedgerReport.rptdesign');
/*!40000 ALTER TABLE `report_jasper_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_parameter`
--

DROP TABLE IF EXISTS `report_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_parameter` (
  `parameter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `datasource_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`parameter_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  KEY `datasource_id` (`datasource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_parameter`
--

LOCK TABLES `report_parameter` WRITE;
/*!40000 ALTER TABLE `report_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_parameter_map`
--

DROP TABLE IF EXISTS `report_parameter_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_parameter_map` (
  `report_id` int(11) NOT NULL DEFAULT '0',
  `parameter_id` int(11) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `map_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`map_id`),
  KEY `report_id` (`report_id`),
  KEY `parameter_id` (`parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_parameter_map`
--

LOCK TABLES `report_parameter_map` WRITE;
/*!40000 ALTER TABLE `report_parameter_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_parameter_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` smallint(6) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `version_no` int(11) NOT NULL,
  `created_by` smallint(6) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` smallint(6) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_activity`
--

DROP TABLE IF EXISTS `roles_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_activity` (
  `activity_id` smallint(6) NOT NULL,
  `role_id` smallint(6) NOT NULL,
  PRIMARY KEY (`activity_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `roles_activity_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activity_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `roles_activity_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_activity`
--

LOCK TABLES `roles_activity` WRITE;
/*!40000 ALTER TABLE `roles_activity` DISABLE KEYS */;
INSERT INTO `roles_activity` VALUES (3,1),(4,1),(6,1),(7,1),(9,1),(10,1),(15,1),(16,1),(19,1),(20,1),(21,1),(23,1),(24,1),(25,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(79,1),(80,1),(81,1),(82,1),(83,1),(85,1),(86,1),(87,1),(88,1),(91,1),(92,1),(94,1),(95,1),(97,1),(98,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(108,1),(109,1),(110,1),(115,1),(116,1),(118,1),(119,1),(120,1),(121,1),(122,1),(126,1),(127,1),(128,1),(129,1),(131,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(208,1),(209,1),(210,1),(211,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1);
/*!40000 ALTER TABLE `roles_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saving_schedule`
--

DROP TABLE IF EXISTS `saving_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saving_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `currency_id` smallint(6) DEFAULT NULL,
  `action_date` date DEFAULT NULL,
  `deposit` decimal(21,4) NOT NULL,
  `deposit_currency_id` smallint(6) DEFAULT NULL,
  `deposit_paid` decimal(21,4) DEFAULT NULL,
  `deposit_paid_currency_id` smallint(6) DEFAULT NULL,
  `payment_status` smallint(6) NOT NULL,
  `installment_id` smallint(6) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `parent_flag` smallint(6) DEFAULT NULL,
  `version_no` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `currency_id` (`currency_id`),
  KEY `deposit_currency_id` (`deposit_currency_id`),
  KEY `deposit_paid_currency_id` (`deposit_paid_currency_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `saving_schedule_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `saving_schedule_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `saving_schedule_ibfk_3` FOREIGN KEY (`deposit_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `saving_schedule_ibfk_4` FOREIGN KEY (`deposit_paid_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `saving_schedule_ibfk_5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving_schedule`
--

LOCK TABLES `saving_schedule` WRITE;
/*!40000 ALTER TABLE `saving_schedule` DISABLE KEYS */;
INSERT INTO `saving_schedule` VALUES (1,6,4,NULL,'2010-07-08','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(2,6,4,NULL,'2010-07-15','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(3,6,4,NULL,'2010-07-22','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(4,6,4,NULL,'2010-07-29','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(5,6,4,NULL,'2010-08-05','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(6,6,4,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(7,6,4,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(8,6,4,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(9,6,4,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(10,6,4,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(11,7,3,NULL,'2010-07-08','60.0000',2,'0.0000',2,0,1,NULL,NULL,0),(12,7,3,NULL,'2010-07-15','60.0000',2,'0.0000',2,0,2,NULL,NULL,0),(13,7,3,NULL,'2010-07-22','0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(14,7,3,NULL,'2010-07-29','0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(15,7,3,NULL,'2010-08-05','0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(16,7,3,NULL,'2010-08-12','0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(17,7,3,NULL,'2010-08-19','0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(18,7,3,NULL,'2010-08-26','0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(19,7,3,NULL,'2010-09-02','0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(20,7,3,NULL,'2010-09-09','0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(21,11,6,NULL,'2010-07-08','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(22,11,6,NULL,'2010-07-15','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(23,11,6,NULL,'2010-07-22','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(24,11,6,NULL,'2010-07-29','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(25,11,6,NULL,'2010-08-05','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(26,11,6,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(27,11,6,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(28,11,6,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(29,11,6,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(30,11,6,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(31,13,7,NULL,'2010-07-08','60.0000',2,'0.0000',2,0,1,NULL,NULL,0),(32,13,7,NULL,'2010-07-15','60.0000',2,'0.0000',2,0,2,NULL,NULL,0),(33,13,7,NULL,'2010-07-22','60.0000',2,'0.0000',2,0,3,NULL,NULL,0),(34,13,7,NULL,'2010-07-29','60.0000',2,'0.0000',2,0,4,NULL,NULL,0),(35,13,7,NULL,'2010-08-05','60.0000',2,'0.0000',2,0,5,NULL,NULL,0),(36,13,7,NULL,'2010-08-12','60.0000',2,'0.0000',2,0,6,NULL,NULL,0),(37,13,7,NULL,'2010-08-19','60.0000',2,'0.0000',2,0,7,NULL,NULL,0),(38,13,7,NULL,'2010-08-26','60.0000',2,'0.0000',2,0,8,NULL,NULL,0),(39,13,7,NULL,'2010-09-02','60.0000',2,'0.0000',2,0,9,NULL,NULL,0),(40,13,7,NULL,'2010-09-09','60.0000',2,'0.0000',2,0,10,NULL,NULL,0),(41,14,7,NULL,'2010-07-08','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(42,14,7,NULL,'2010-07-15','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(43,14,7,NULL,'2010-07-22','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(44,14,7,NULL,'2010-07-29','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(45,14,7,NULL,'2010-08-05','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(46,14,7,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(47,14,7,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(48,14,7,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(49,14,7,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(50,14,7,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(51,17,3,NULL,'2010-07-08','100.0000',2,'0.0000',2,0,1,NULL,NULL,0),(52,17,3,NULL,'2010-07-15','100.0000',2,'0.0000',2,0,2,NULL,NULL,0),(53,17,3,NULL,'2010-07-22','100.0000',2,'0.0000',2,0,3,NULL,NULL,0),(54,17,3,NULL,'2010-07-29','100.0000',2,'0.0000',2,0,4,NULL,NULL,0),(55,17,3,NULL,'2010-08-05','100.0000',2,'0.0000',2,0,5,NULL,NULL,0),(56,17,3,NULL,'2010-08-12','100.0000',2,'0.0000',2,0,6,NULL,NULL,0),(57,17,3,NULL,'2010-08-19','100.0000',2,'0.0000',2,0,7,NULL,NULL,0),(58,17,3,NULL,'2010-08-26','100.0000',2,'0.0000',2,0,8,NULL,NULL,0),(59,17,3,NULL,'2010-09-02','100.0000',2,'0.0000',2,0,9,NULL,NULL,0),(60,17,3,NULL,'2010-09-09','100.0000',2,'0.0000',2,0,10,NULL,NULL,0),(61,20,9,NULL,'2010-07-08','0.0000',2,'0.0000',2,0,1,NULL,NULL,5),(62,20,9,NULL,'2010-07-15','0.0000',2,'0.0000',2,0,2,NULL,NULL,5),(63,20,9,NULL,'2010-07-22','0.0000',2,'0.0000',2,0,3,NULL,NULL,5),(64,20,9,NULL,'2010-07-29','0.0000',2,'0.0000',2,0,4,NULL,NULL,5),(65,20,9,NULL,'2010-08-05','0.0000',2,'0.0000',2,0,5,NULL,NULL,5),(66,20,9,NULL,'2010-08-12','0.0000',2,'0.0000',2,0,6,NULL,NULL,5),(67,20,9,NULL,'2010-08-19','0.0000',2,'0.0000',2,0,7,NULL,NULL,5),(68,20,9,NULL,'2010-08-26','0.0000',2,'0.0000',2,0,8,NULL,NULL,5),(69,20,9,NULL,'2010-09-02','0.0000',2,'0.0000',2,0,9,NULL,NULL,5),(70,20,9,NULL,'2010-09-09','0.0000',2,'0.0000',2,0,10,NULL,NULL,5),(71,24,10,NULL,'2010-07-24','0.0000',2,'0.0000',2,0,1,NULL,NULL,1),(72,24,10,NULL,'2010-07-31','0.0000',2,'0.0000',2,0,2,NULL,NULL,1),(73,24,10,NULL,'2010-08-07','0.0000',2,'0.0000',2,0,3,NULL,NULL,1),(74,24,10,NULL,'2010-08-14','0.0000',2,'0.0000',2,0,4,NULL,NULL,1),(75,24,10,NULL,'2010-08-21','0.0000',2,'0.0000',2,0,5,NULL,NULL,1),(76,24,10,NULL,'2010-08-28','0.0000',2,'0.0000',2,0,6,NULL,NULL,1),(77,24,10,NULL,'2010-09-04','0.0000',2,'0.0000',2,0,7,NULL,NULL,1),(78,24,10,NULL,'2010-09-11','0.0000',2,'0.0000',2,0,8,NULL,NULL,1),(79,24,10,NULL,'2010-09-18','0.0000',2,'0.0000',2,0,9,NULL,NULL,1),(80,24,10,NULL,'2010-09-25','0.0000',2,'0.0000',2,0,10,NULL,NULL,1),(81,30,13,NULL,'2010-07-27','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(82,30,13,NULL,'2010-08-03','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(83,30,13,NULL,'2010-08-10','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(84,30,13,NULL,'2010-08-17','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(85,30,13,NULL,'2010-08-24','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(86,30,13,NULL,'2010-08-31','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(87,30,13,NULL,'2010-09-07','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(88,30,13,NULL,'2010-09-14','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(89,30,13,NULL,'2010-09-21','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(90,30,13,NULL,'2010-09-28','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(91,34,16,NULL,'2010-07-22','60.0000',2,'0.0000',2,0,1,NULL,NULL,0),(92,34,16,NULL,'2010-07-29','60.0000',2,'0.0000',2,0,2,NULL,NULL,0),(93,34,16,NULL,'2010-08-05','60.0000',2,'0.0000',2,0,3,NULL,NULL,0),(94,34,16,NULL,'2010-08-12','60.0000',2,'0.0000',2,0,4,NULL,NULL,0),(95,34,16,NULL,'2010-08-19','60.0000',2,'0.0000',2,0,5,NULL,NULL,0),(96,34,16,NULL,'2010-08-26','60.0000',2,'0.0000',2,0,6,NULL,NULL,0),(97,34,16,NULL,'2010-09-02','60.0000',2,'0.0000',2,0,7,NULL,NULL,0),(98,34,16,NULL,'2010-09-09','60.0000',2,'0.0000',2,0,8,NULL,NULL,0),(99,34,16,NULL,'2010-09-16','60.0000',2,'0.0000',2,0,9,NULL,NULL,0),(100,34,16,NULL,'2010-09-23','60.0000',2,'0.0000',2,0,10,NULL,NULL,0),(101,36,17,NULL,'2010-07-22','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(102,36,17,NULL,'2010-07-29','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(103,36,17,NULL,'2010-08-05','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(104,36,17,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(105,36,17,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(106,36,17,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(107,36,17,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(108,36,17,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(109,36,17,NULL,'2010-09-16','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(110,36,17,NULL,'2010-09-23','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(111,46,24,NULL,'2010-07-22','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(112,46,24,NULL,'2010-07-27','0.0000',2,'0.0000',2,0,2,NULL,NULL,2),(113,46,24,NULL,'2010-08-03','0.0000',2,'0.0000',2,0,3,NULL,NULL,2),(114,46,24,NULL,'2010-08-10','0.0000',2,'0.0000',2,0,4,NULL,NULL,2),(115,46,24,NULL,'2010-08-17','0.0000',2,'0.0000',2,0,5,NULL,NULL,2),(116,46,24,NULL,'2010-08-24','0.0000',2,'0.0000',2,0,6,NULL,NULL,2),(117,46,24,NULL,'2010-08-31','0.0000',2,'0.0000',2,0,7,NULL,NULL,2),(118,46,24,NULL,'2010-09-07','0.0000',2,'0.0000',2,0,8,NULL,NULL,2),(119,46,24,NULL,'2010-09-14','0.0000',2,'0.0000',2,0,9,NULL,NULL,2),(120,46,24,NULL,'2010-09-21','0.0000',2,'0.0000',2,0,10,NULL,NULL,2),(121,47,18,NULL,'2010-07-29','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(122,47,18,NULL,'2010-08-05','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(123,47,18,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(124,47,18,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(125,47,18,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(126,47,18,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(127,47,18,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(128,47,18,NULL,'2010-09-16','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(129,47,18,NULL,'2010-09-23','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(130,47,18,NULL,'2010-09-30','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(131,52,28,NULL,'2010-07-29','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(132,52,28,NULL,'2010-08-05','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(133,52,28,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(134,52,28,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(135,52,28,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(136,52,28,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(137,52,28,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(138,52,28,NULL,'2010-09-16','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(139,52,28,NULL,'2010-09-23','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(140,52,28,NULL,'2010-09-30','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(141,56,29,NULL,'2010-07-28','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(142,56,29,NULL,'2010-08-04','120.0000',2,'0.0000',2,0,2,NULL,NULL,0),(143,56,29,NULL,'2010-08-11','120.0000',2,'0.0000',2,0,3,NULL,NULL,0),(144,56,29,NULL,'2010-08-18','120.0000',2,'0.0000',2,0,4,NULL,NULL,0),(145,56,29,NULL,'2010-08-25','120.0000',2,'0.0000',2,0,5,NULL,NULL,0),(146,56,29,NULL,'2010-09-01','120.0000',2,'0.0000',2,0,6,NULL,NULL,0),(147,56,29,NULL,'2010-09-08','120.0000',2,'0.0000',2,0,7,NULL,NULL,0),(148,56,29,NULL,'2010-09-15','120.0000',2,'0.0000',2,0,8,NULL,NULL,0),(149,56,29,NULL,'2010-09-22','120.0000',2,'0.0000',2,0,9,NULL,NULL,0),(150,56,29,NULL,'2010-09-29','120.0000',2,'0.0000',2,0,10,NULL,NULL,0),(151,58,30,NULL,'2010-07-28','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(152,58,30,NULL,'2010-08-04','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(153,58,30,NULL,'2010-08-11','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(154,58,30,NULL,'2010-08-18','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(155,58,30,NULL,'2010-08-25','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(156,58,30,NULL,'2010-09-01','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(157,58,30,NULL,'2010-09-08','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(158,58,30,NULL,'2010-09-15','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(159,58,30,NULL,'2010-09-22','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(160,58,30,NULL,'2010-09-29','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(161,64,33,NULL,'2010-07-28','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(162,64,33,NULL,'2010-08-04','120.0000',2,'0.0000',2,0,2,NULL,NULL,0),(163,64,33,NULL,'2010-08-11','120.0000',2,'0.0000',2,0,3,NULL,NULL,0),(164,64,33,NULL,'2010-08-18','120.0000',2,'0.0000',2,0,4,NULL,NULL,0),(165,64,33,NULL,'2010-08-25','120.0000',2,'0.0000',2,0,5,NULL,NULL,0),(166,64,33,NULL,'2010-09-01','120.0000',2,'0.0000',2,0,6,NULL,NULL,0),(167,64,33,NULL,'2010-09-08','120.0000',2,'0.0000',2,0,7,NULL,NULL,0),(168,64,33,NULL,'2010-09-15','120.0000',2,'0.0000',2,0,8,NULL,NULL,0),(169,64,33,NULL,'2010-09-22','120.0000',2,'0.0000',2,0,9,NULL,NULL,0),(170,64,33,NULL,'2010-09-29','120.0000',2,'0.0000',2,0,10,NULL,NULL,0),(171,67,34,NULL,'2010-07-28','90.0000',2,'90.0000',2,1,1,'2010-07-28',NULL,1),(172,67,34,NULL,'2010-08-04','90.0000',2,'0.0000',2,0,2,NULL,NULL,0),(173,67,34,NULL,'2010-08-11','90.0000',2,'0.0000',2,0,3,NULL,NULL,0),(174,67,34,NULL,'2010-08-18','90.0000',2,'0.0000',2,0,4,NULL,NULL,0),(175,67,34,NULL,'2010-08-25','90.0000',2,'0.0000',2,0,5,NULL,NULL,0),(176,67,34,NULL,'2010-09-01','90.0000',2,'0.0000',2,0,6,NULL,NULL,0),(177,67,34,NULL,'2010-09-08','90.0000',2,'0.0000',2,0,7,NULL,NULL,0),(178,67,34,NULL,'2010-09-15','90.0000',2,'0.0000',2,0,8,NULL,NULL,0),(179,67,34,NULL,'2010-09-22','90.0000',2,'0.0000',2,0,9,NULL,NULL,0),(180,67,34,NULL,'2010-09-29','90.0000',2,'0.0000',2,0,10,NULL,NULL,0),(181,76,42,NULL,'2010-08-02','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(182,76,42,NULL,'2010-08-09','120.0000',2,'0.0000',2,0,2,NULL,NULL,0),(183,76,42,NULL,'2010-08-16','120.0000',2,'0.0000',2,0,3,NULL,NULL,0),(184,76,42,NULL,'2010-08-23','120.0000',2,'0.0000',2,0,4,NULL,NULL,0),(185,76,42,NULL,'2010-08-30','120.0000',2,'0.0000',2,0,5,NULL,NULL,0),(186,76,42,NULL,'2010-09-06','120.0000',2,'0.0000',2,0,6,NULL,NULL,0),(187,76,42,NULL,'2010-09-13','120.0000',2,'0.0000',2,0,7,NULL,NULL,0),(188,76,42,NULL,'2010-09-20','120.0000',2,'0.0000',2,0,8,NULL,NULL,0),(189,76,42,NULL,'2010-09-27','120.0000',2,'0.0000',2,0,9,NULL,NULL,0),(190,76,42,NULL,'2010-10-04','120.0000',2,'0.0000',2,0,10,NULL,NULL,0),(191,80,44,NULL,'2010-08-04','60.0000',2,'0.0000',2,0,1,NULL,NULL,0),(192,80,44,NULL,'2010-08-11','60.0000',2,'0.0000',2,0,2,NULL,NULL,0),(193,80,44,NULL,'2010-08-18','60.0000',2,'0.0000',2,0,3,NULL,NULL,0),(194,80,44,NULL,'2010-08-25','60.0000',2,'0.0000',2,0,4,NULL,NULL,0),(195,80,44,NULL,'2010-09-01','60.0000',2,'0.0000',2,0,5,NULL,NULL,0),(196,80,44,NULL,'2010-09-08','60.0000',2,'0.0000',2,0,6,NULL,NULL,0),(197,80,44,NULL,'2010-09-15','60.0000',2,'0.0000',2,0,7,NULL,NULL,0),(198,80,44,NULL,'2010-09-22','60.0000',2,'0.0000',2,0,8,NULL,NULL,0),(199,80,44,NULL,'2010-09-29','60.0000',2,'0.0000',2,0,9,NULL,NULL,0),(200,80,44,NULL,'2010-10-06','60.0000',2,'0.0000',2,0,10,NULL,NULL,0),(201,82,45,NULL,'2010-08-04','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(202,82,45,NULL,'2010-08-11','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(203,82,45,NULL,'2010-08-18','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(204,82,45,NULL,'2010-08-25','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(205,82,45,NULL,'2010-09-01','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(206,82,45,NULL,'2010-09-08','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(207,82,45,NULL,'2010-09-15','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(208,82,45,NULL,'2010-09-22','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(209,82,45,NULL,'2010-09-29','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(210,82,45,NULL,'2010-10-06','20.0000',2,'0.0000',2,0,10,NULL,NULL,0),(211,84,46,NULL,'2010-08-04','120.0000',2,'0.0000',2,0,1,NULL,NULL,1),(212,84,46,NULL,'2010-08-11','120.0000',2,'0.0000',2,0,2,NULL,NULL,1),(213,84,46,NULL,'2010-08-18','120.0000',2,'0.0000',2,0,3,NULL,NULL,1),(214,84,46,NULL,'2010-08-25','120.0000',2,'0.0000',2,0,4,NULL,NULL,1),(215,84,46,NULL,'2010-09-01','120.0000',2,'0.0000',2,0,5,NULL,NULL,1),(216,84,46,NULL,'2010-09-08','120.0000',2,'0.0000',2,0,6,NULL,NULL,1),(217,84,46,NULL,'2010-09-15','120.0000',2,'0.0000',2,0,7,NULL,NULL,1),(218,84,46,NULL,'2010-09-22','120.0000',2,'0.0000',2,0,8,NULL,NULL,1),(219,84,46,NULL,'2010-09-29','120.0000',2,'0.0000',2,0,9,NULL,NULL,1),(220,84,46,NULL,'2010-10-06','120.0000',2,'0.0000',2,0,10,NULL,NULL,1),(221,88,48,NULL,'2010-08-02','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(222,88,48,NULL,'2010-08-09','120.0000',2,'0.0000',2,0,2,NULL,NULL,0),(223,88,48,NULL,'2010-08-16','120.0000',2,'0.0000',2,0,3,NULL,NULL,0),(224,88,48,NULL,'2010-08-23','120.0000',2,'0.0000',2,0,4,NULL,NULL,0),(225,88,48,NULL,'2010-08-30','120.0000',2,'0.0000',2,0,5,NULL,NULL,0),(226,88,48,NULL,'2010-09-06','120.0000',2,'0.0000',2,0,6,NULL,NULL,0),(227,88,48,NULL,'2010-09-13','120.0000',2,'0.0000',2,0,7,NULL,NULL,0),(228,88,48,NULL,'2010-09-20','120.0000',2,'0.0000',2,0,8,NULL,NULL,0),(229,88,48,NULL,'2010-09-27','120.0000',2,'0.0000',2,0,9,NULL,NULL,0),(230,88,48,NULL,'2010-10-04','120.0000',2,'0.0000',2,0,10,NULL,NULL,0),(231,93,51,NULL,'2010-08-02','20.0000',2,'0.0000',2,0,1,NULL,NULL,0),(232,93,51,NULL,'2010-08-12','20.0000',2,'0.0000',2,0,2,NULL,NULL,1),(233,93,51,NULL,'2010-08-19','20.0000',2,'0.0000',2,0,3,NULL,NULL,1),(234,93,51,NULL,'2010-08-26','20.0000',2,'0.0000',2,0,4,NULL,NULL,1),(235,93,51,NULL,'2010-09-02','20.0000',2,'0.0000',2,0,5,NULL,NULL,1),(236,93,51,NULL,'2010-09-09','20.0000',2,'0.0000',2,0,6,NULL,NULL,1),(237,93,51,NULL,'2010-09-16','20.0000',2,'0.0000',2,0,7,NULL,NULL,1),(238,93,51,NULL,'2010-09-23','20.0000',2,'0.0000',2,0,8,NULL,NULL,1),(239,93,51,NULL,'2010-09-30','20.0000',2,'0.0000',2,0,9,NULL,NULL,1),(240,93,51,NULL,'2010-10-07','20.0000',2,'0.0000',2,0,10,NULL,NULL,1),(241,95,52,NULL,'2010-08-02','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(242,95,52,NULL,'2010-08-12','120.0000',2,'0.0000',2,0,2,NULL,NULL,1),(243,95,52,NULL,'2010-08-19','120.0000',2,'0.0000',2,0,3,NULL,NULL,1),(244,95,52,NULL,'2010-08-26','120.0000',2,'0.0000',2,0,4,NULL,NULL,1),(245,95,52,NULL,'2010-09-02','120.0000',2,'0.0000',2,0,5,NULL,NULL,1),(246,95,52,NULL,'2010-09-09','120.0000',2,'0.0000',2,0,6,NULL,NULL,1),(247,95,52,NULL,'2010-09-16','120.0000',2,'0.0000',2,0,7,NULL,NULL,1),(248,95,52,NULL,'2010-09-23','120.0000',2,'0.0000',2,0,8,NULL,NULL,1),(249,95,52,NULL,'2010-09-30','120.0000',2,'0.0000',2,0,9,NULL,NULL,1),(250,95,52,NULL,'2010-10-07','120.0000',2,'0.0000',2,0,10,NULL,NULL,1),(251,100,56,NULL,'2010-08-09','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(252,100,56,NULL,'2010-08-19','120.0000',2,'0.0000',2,0,2,NULL,NULL,1),(253,100,56,NULL,'2010-08-26','120.0000',2,'0.0000',2,0,3,NULL,NULL,1),(254,100,56,NULL,'2010-09-02','120.0000',2,'0.0000',2,0,4,NULL,NULL,1),(255,100,56,NULL,'2010-09-09','120.0000',2,'0.0000',2,0,5,NULL,NULL,1),(256,100,56,NULL,'2010-09-16','120.0000',2,'0.0000',2,0,6,NULL,NULL,1),(257,100,56,NULL,'2010-09-23','120.0000',2,'0.0000',2,0,7,NULL,NULL,1),(258,100,56,NULL,'2010-09-30','120.0000',2,'0.0000',2,0,8,NULL,NULL,1),(259,100,56,NULL,'2010-10-07','120.0000',2,'0.0000',2,0,9,NULL,NULL,1),(260,100,56,NULL,'2010-10-14','120.0000',2,'0.0000',2,0,10,NULL,NULL,1),(261,102,57,NULL,'2010-08-09','120.0000',2,'0.0000',2,0,1,NULL,NULL,0),(262,102,57,NULL,'2010-08-17','120.0000',2,'0.0000',2,0,2,NULL,NULL,1),(263,102,57,NULL,'2010-08-24','120.0000',2,'0.0000',2,0,3,NULL,NULL,1),(264,102,57,NULL,'2010-08-31','120.0000',2,'0.0000',2,0,4,NULL,NULL,1),(265,102,57,NULL,'2010-09-07','120.0000',2,'0.0000',2,0,5,NULL,NULL,1),(266,102,57,NULL,'2010-09-14','120.0000',2,'0.0000',2,0,6,NULL,NULL,1),(267,102,57,NULL,'2010-09-21','120.0000',2,'0.0000',2,0,7,NULL,NULL,1),(268,102,57,NULL,'2010-09-28','120.0000',2,'0.0000',2,0,8,NULL,NULL,1),(269,102,57,NULL,'2010-10-05','120.0000',2,'0.0000',2,0,9,NULL,NULL,1),(270,102,57,NULL,'2010-10-12','120.0000',2,'0.0000',2,0,10,NULL,NULL,1),(271,109,63,NULL,'2010-08-27','20.0000',2,'20.0000',2,1,1,'2010-08-27',NULL,1),(272,109,63,NULL,'2010-09-03','20.0000',2,'0.0000',2,0,2,NULL,NULL,0),(273,109,63,NULL,'2010-09-10','20.0000',2,'0.0000',2,0,3,NULL,NULL,0),(274,109,63,NULL,'2010-09-17','20.0000',2,'0.0000',2,0,4,NULL,NULL,0),(275,109,63,NULL,'2010-09-24','20.0000',2,'0.0000',2,0,5,NULL,NULL,0),(276,109,63,NULL,'2010-10-01','20.0000',2,'0.0000',2,0,6,NULL,NULL,0),(277,109,63,NULL,'2010-10-08','20.0000',2,'0.0000',2,0,7,NULL,NULL,0),(278,109,63,NULL,'2010-10-15','20.0000',2,'0.0000',2,0,8,NULL,NULL,0),(279,109,63,NULL,'2010-10-22','20.0000',2,'0.0000',2,0,9,NULL,NULL,0),(280,109,63,NULL,'2010-10-29','20.0000',2,'0.0000',2,0,10,NULL,NULL,0);
/*!40000 ALTER TABLE `saving_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_account`
--

DROP TABLE IF EXISTS `savings_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savings_account` (
  `account_id` int(11) NOT NULL,
  `activation_date` date DEFAULT NULL,
  `savings_balance` decimal(21,4) DEFAULT NULL,
  `savings_balance_currency_id` smallint(6) DEFAULT NULL,
  `recommended_amount` decimal(21,4) DEFAULT NULL,
  `recommended_amount_currency_id` smallint(6) DEFAULT NULL,
  `recommended_amnt_unit_id` smallint(6) DEFAULT NULL,
  `savings_type_id` smallint(6) NOT NULL,
  `int_to_be_posted` decimal(21,4) DEFAULT NULL,
  `int_to_be_posted_currency_id` smallint(6) DEFAULT NULL,
  `last_int_calc_date` date DEFAULT NULL,
  `last_int_post_date` date DEFAULT NULL,
  `next_int_calc_date` date DEFAULT NULL,
  `next_int_post_date` date DEFAULT NULL,
  `inter_int_calc_date` date DEFAULT NULL,
  `prd_offering_id` smallint(6) NOT NULL,
  `interest_rate` decimal(13,10) NOT NULL,
  `interest_calculation_type_id` smallint(6) NOT NULL,
  `time_per_for_int_calc` int(11) DEFAULT NULL,
  `min_amnt_for_int` decimal(21,4) DEFAULT NULL,
  `min_amnt_for_int_currency_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `savings_balance_currency_id` (`savings_balance_currency_id`),
  KEY `recommended_amount_currency_id` (`recommended_amount_currency_id`),
  KEY `int_to_be_posted_currency_id` (`int_to_be_posted_currency_id`),
  KEY `recommended_amnt_unit_id` (`recommended_amnt_unit_id`),
  KEY `savings_type_id` (`savings_type_id`),
  KEY `prd_offering_id` (`prd_offering_id`),
  KEY `interest_calculation_type_id` (`interest_calculation_type_id`),
  KEY `time_per_for_int_calc` (`time_per_for_int_calc`),
  KEY `min_amnt_for_int_currency_id` (`min_amnt_for_int_currency_id`),
  CONSTRAINT `savings_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_10` FOREIGN KEY (`min_amnt_for_int_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_2` FOREIGN KEY (`savings_balance_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_3` FOREIGN KEY (`recommended_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_4` FOREIGN KEY (`int_to_be_posted_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_5` FOREIGN KEY (`recommended_amnt_unit_id`) REFERENCES `recommended_amnt_unit` (`recommended_amnt_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_6` FOREIGN KEY (`savings_type_id`) REFERENCES `savings_type` (`savings_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_7` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_8` FOREIGN KEY (`interest_calculation_type_id`) REFERENCES `interest_calculation_types` (`interest_calculation_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_account_ibfk_9` FOREIGN KEY (`time_per_for_int_calc`) REFERENCES `meeting` (`meeting_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_account`
--

LOCK TABLES `savings_account` WRITE;
/*!40000 ALTER TABLE `savings_account` DISABLE KEYS */;
INSERT INTO `savings_account` VALUES (6,'2010-07-02','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-09','2010-07-31','2010-07-10','2010-08-31',NULL,2,'4.0000000000',1,9,'0.0000',2),(7,'2010-07-02','0.0000',2,'60.0000',2,NULL,2,'0.0000',2,'2010-07-21','2010-07-21','2010-07-03','2010-09-30',NULL,3,'4.0000000000',1,10,'0.0000',2),(11,'2010-07-03','50.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-10','2010-07-31','2010-07-11','2010-08-31',NULL,2,'4.0000000000',1,12,'0.0000',2),(13,'2010-07-03','0.0000',2,'60.0000',2,NULL,2,'0.0000',2,'2010-07-10',NULL,'2010-07-11','2010-09-30',NULL,3,'4.0000000000',1,13,'0.0000',2),(14,'2010-07-03','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-10','2010-07-31','2010-07-11','2010-08-31',NULL,2,'4.0000000000',1,14,'0.0000',2),(17,'2010-07-05','0.0000',2,'100.0000',2,NULL,2,'0.0000',2,'2010-07-05','2010-07-05','2010-07-06','2010-09-30',NULL,3,'4.0000000000',1,17,'0.0000',2),(20,'2010-07-05','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-05','2010-07-05','2010-07-06','2010-07-31',NULL,2,'4.0000000000',1,18,'0.0000',2),(24,'2010-07-18','666.0000',2,'60.0000',2,NULL,2,'0.7000',2,'2010-07-25',NULL,'2010-07-26','2010-09-30',NULL,3,'4.0000000000',1,22,'0.0000',2),(30,'2010-07-21','1200.1000',2,'20.0000',2,NULL,1,'0.6000',2,'2010-07-28','2010-07-31','2010-07-29','2010-08-31',NULL,2,'4.0000000000',1,24,'0.0000',2),(31,NULL,'0.0000',2,'20.0000',2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'4.0000000000',1,25,'0.0000',2),(34,'2010-07-21','0.0000',2,'60.0000',2,NULL,2,'0.0000',2,'2010-07-21','2010-07-21','2010-07-22','2010-09-30',NULL,3,'4.0000000000',1,27,'0.0000',2),(36,'2010-07-21','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-21','2010-07-21','2010-07-22','2010-07-31',NULL,2,'4.0000000000',1,28,'0.0000',2),(46,'2010-07-22','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-23','2010-07-23','2010-07-23','2010-07-31',NULL,2,'4.0000000000',1,32,'0.0000',2),(47,'2010-07-25','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-07-25','2010-07-25','2010-07-26','2010-07-31',NULL,2,'4.0000000000',1,33,'0.0000',2),(52,'2010-07-25','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-08-01','2010-07-31','2010-08-02','2010-08-31',NULL,2,'4.0000000000',1,38,'0.0000',2),(56,'2010-07-25','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-01','2010-07-31','2010-08-02','2010-08-31',NULL,6,'5.0000000000',1,47,'0.0000',2),(58,'2010-07-25','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-08-01','2010-07-31','2010-08-02','2010-08-31',NULL,2,'4.0000000000',1,48,'0.0000',2),(61,'2010-07-25','777.0000',2,'90.0000',2,NULL,2,'1.8000',2,'2010-08-01','2010-07-31','2010-08-08','2010-08-31',NULL,7,'12.0000000000',2,51,'0.0000',2),(64,'2010-07-25','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-01','2010-07-31','2010-08-02','2010-08-31',NULL,6,'5.0000000000',1,53,'0.0000',2),(67,'2010-07-28','90.0000',2,'90.0000',2,NULL,2,'0.1000',2,'2010-08-01','2010-07-31','2010-08-08','2010-08-31',NULL,7,'12.0000000000',2,55,'0.0000',2),(76,'2010-07-29','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-02','2010-07-31','2010-08-03','2010-08-31',NULL,6,'5.0000000000',1,59,'0.0000',2),(80,'2010-07-29','0.0000',2,'60.0000',2,NULL,2,'0.0000',2,'2010-08-02',NULL,'2010-08-03','2010-09-30',NULL,3,'4.0000000000',1,62,'0.0000',2),(82,'2010-07-29','15.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-08-02','2010-07-31','2010-08-03','2010-08-31',NULL,2,'4.0000000000',1,64,'0.0000',2),(84,'2010-07-29','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-07-31','2010-07-31','2010-07-30','2010-07-31',NULL,6,'5.0000000000',1,66,'0.0000',2),(88,'2010-07-31','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-02',NULL,'2010-08-03','2010-08-31',NULL,6,'5.0000000000',1,69,'0.0000',2),(93,'2010-08-01','0.0000',2,'20.0000',2,NULL,1,'0.0000',2,'2010-08-03','2010-08-03','2010-08-02','2010-08-31',NULL,2,'4.0000000000',1,72,'0.0000',2),(95,'2010-08-01','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-07','2010-08-07','2010-08-03','2010-08-31',NULL,6,'5.0000000000',1,74,'0.0000',2),(100,'2010-08-07','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-10','2010-08-10','2010-08-08','2010-08-31',NULL,6,'5.0000000000',1,77,'0.0000',2),(102,'2010-08-07','0.0000',2,'120.0000',2,2,1,'0.0000',2,'2010-08-10','2010-08-10','2010-08-08','2010-08-31',NULL,6,'5.0000000000',1,78,'0.0000',2),(109,'2010-08-27','20.0000',2,'20.0000',2,NULL,1,'0.0000',2,NULL,NULL,'2010-08-28','2010-08-31',NULL,2,'4.0000000000',1,84,'0.0000',2);
/*!40000 ALTER TABLE `savings_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_activity_details`
--

DROP TABLE IF EXISTS `savings_activity_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savings_activity_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` smallint(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `account_action_id` smallint(6) NOT NULL,
  `amount` decimal(21,4) NOT NULL,
  `amount_currency_id` smallint(6) NOT NULL,
  `balance_amount` decimal(21,4) NOT NULL,
  `balance_amount_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `account_id` (`account_id`),
  KEY `account_action_id` (`account_action_id`),
  KEY `amount_currency_id` (`amount_currency_id`),
  KEY `balance_amount_currency_id` (`balance_amount_currency_id`),
  CONSTRAINT `savings_activity_details_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_activity_details_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_activity_details_ibfk_3` FOREIGN KEY (`account_action_id`) REFERENCES `account_action` (`account_action_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_activity_details_ibfk_4` FOREIGN KEY (`amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_activity_details_ibfk_5` FOREIGN KEY (`balance_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_activity_details`
--

LOCK TABLES `savings_activity_details` WRITE;
/*!40000 ALTER TABLE `savings_activity_details` DISABLE KEYS */;
INSERT INTO `savings_activity_details` VALUES (1,1,11,'2010-07-02 14:00:00',6,'67.0000',2,'67.0000',2),(2,1,11,'2010-07-02 15:18:15',14,'67.0000',2,'0.0000',2),(3,1,11,'2010-07-02 14:00:00',6,'50.0000',2,'50.0000',2),(4,1,17,'2010-07-04 14:00:00',6,'100.0000',2,'100.0000',2),(5,1,17,'2010-07-05 01:29:32',7,'100.0000',2,'0.0000',2),(6,1,20,'2010-07-04 14:00:00',6,'1.0000',2,'1.0000',2),(7,1,20,'2010-07-04 14:00:00',6,'2.0000',2,'3.0000',2),(8,1,20,'2010-07-04 14:00:00',6,'3.0000',2,'6.0000',2),(9,1,20,'2010-07-05 02:44:07',7,'6.0000',2,'0.0000',2),(10,1,24,'2010-07-17 14:00:00',6,'666.0000',2,'666.0000',2),(11,1,30,'2010-07-20 14:00:00',6,'1200.0000',2,'1200.0000',2),(12,1,36,'2010-07-20 14:00:00',6,'235.0000',2,'235.0000',2),(13,1,36,'2010-07-21 03:53:06',7,'235.0000',2,'0.0000',2),(14,1,61,'2010-07-24 14:00:00',6,'777.0000',2,'777.0000',2),(15,1,67,'2010-07-27 14:00:00',6,'90.0000',2,'90.0000',2),(16,1,82,'2010-07-30 14:00:00',6,'15.0000',2,'15.0000',2),(17,NULL,6,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(18,NULL,11,'2010-07-30 14:00:00',11,'0.0000',2,'50.0000',2),(19,NULL,14,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(20,NULL,30,'2010-07-30 14:00:00',11,'0.1000',2,'1200.1000',2),(21,NULL,52,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(22,NULL,56,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(23,NULL,58,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(24,NULL,61,'2010-07-30 14:00:00',11,'0.0000',2,'777.0000',2),(25,NULL,64,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(26,NULL,67,'2010-07-30 14:00:00',11,'0.0000',2,'90.0000',2),(27,NULL,76,'2010-07-30 14:00:00',11,'0.0000',2,'0.0000',2),(28,NULL,82,'2010-07-30 14:00:00',11,'0.0000',2,'15.0000',2),(29,1,109,'2010-08-26 14:00:00',6,'20.0000',2,'20.0000',2);
/*!40000 ALTER TABLE `savings_activity_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_offering`
--

DROP TABLE IF EXISTS `savings_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savings_offering` (
  `prd_offering_id` smallint(6) NOT NULL,
  `interest_calculation_type_id` smallint(6) NOT NULL,
  `savings_type_id` smallint(6) NOT NULL,
  `recommended_amnt_unit_id` smallint(6) DEFAULT NULL,
  `recommended_amount` decimal(21,4) DEFAULT NULL,
  `recommended_amount_currency_id` smallint(6) DEFAULT NULL,
  `interest_rate` decimal(13,10) NOT NULL,
  `max_amnt_withdrawl` decimal(21,4) DEFAULT NULL,
  `max_amnt_withdrawl_currency_id` smallint(6) DEFAULT NULL,
  `min_amnt_for_int` decimal(21,4) DEFAULT NULL,
  `min_amnt_for_int_currency_id` smallint(6) DEFAULT NULL,
  `deposit_glcode_id` smallint(6) NOT NULL,
  `interest_glcode_id` smallint(6) NOT NULL,
  PRIMARY KEY (`prd_offering_id`),
  KEY `recommended_amnt_unit_id` (`recommended_amnt_unit_id`),
  KEY `savings_type_id` (`savings_type_id`),
  KEY `interest_calculation_type_id` (`interest_calculation_type_id`),
  KEY `recommended_amount_currency_id` (`recommended_amount_currency_id`),
  KEY `max_amnt_withdrawl_currency_id` (`max_amnt_withdrawl_currency_id`),
  KEY `min_amnt_for_int_currency_id` (`min_amnt_for_int_currency_id`),
  KEY `deposit_glcode_id` (`deposit_glcode_id`),
  KEY `interest_glcode_id` (`interest_glcode_id`),
  CONSTRAINT `savings_offering_ibfk_1` FOREIGN KEY (`prd_offering_id`) REFERENCES `prd_offering` (`prd_offering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_2` FOREIGN KEY (`recommended_amnt_unit_id`) REFERENCES `recommended_amnt_unit` (`recommended_amnt_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_3` FOREIGN KEY (`savings_type_id`) REFERENCES `savings_type` (`savings_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_4` FOREIGN KEY (`interest_calculation_type_id`) REFERENCES `interest_calculation_types` (`interest_calculation_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_5` FOREIGN KEY (`recommended_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_6` FOREIGN KEY (`max_amnt_withdrawl_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_7` FOREIGN KEY (`min_amnt_for_int_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_8` FOREIGN KEY (`deposit_glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_offering_ibfk_9` FOREIGN KEY (`interest_glcode_id`) REFERENCES `gl_code` (`glcode_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_offering`
--

LOCK TABLES `savings_offering` WRITE;
/*!40000 ALTER TABLE `savings_offering` DISABLE KEYS */;
INSERT INTO `savings_offering` VALUES (2,1,1,NULL,'20.0000',2,'4.0000000000','0.0000',2,'0.0000',2,36,56),(3,1,2,NULL,'60.0000',2,'4.0000000000','0.0000',2,'0.0000',2,36,56),(6,1,1,2,'120.0000',2,'5.0000000000','0.0000',2,'0.0000',2,36,56),(7,2,2,NULL,'90.0000',2,'12.0000000000','0.0000',2,'0.0000',2,33,56);
/*!40000 ALTER TABLE `savings_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_performance`
--

DROP TABLE IF EXISTS `savings_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savings_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `total_deposits` decimal(21,4) DEFAULT NULL,
  `total_deposits_currency_id` smallint(6) DEFAULT NULL,
  `total_withdrawals` decimal(21,4) DEFAULT NULL,
  `total_withdrawals_currency_id` smallint(6) DEFAULT NULL,
  `total_interest_earned` decimal(21,4) DEFAULT NULL,
  `total_interest_earned_currency_id` smallint(6) DEFAULT NULL,
  `missed_deposits` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `total_deposits_currency_id` (`total_deposits_currency_id`),
  KEY `total_withdrawals_currency_id` (`total_withdrawals_currency_id`),
  KEY `total_interest_earned_currency_id` (`total_interest_earned_currency_id`),
  CONSTRAINT `savings_performance_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_performance_ibfk_2` FOREIGN KEY (`total_deposits_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_performance_ibfk_3` FOREIGN KEY (`total_withdrawals_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_performance_ibfk_4` FOREIGN KEY (`total_interest_earned_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_performance`
--

LOCK TABLES `savings_performance` WRITE;
/*!40000 ALTER TABLE `savings_performance` DISABLE KEYS */;
INSERT INTO `savings_performance` VALUES (1,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,11,'50.0000',2,'0.0000',2,'0.0000',2,NULL),(4,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,17,'100.0000',2,'100.0000',2,'0.0000',2,NULL),(7,20,'6.0000',2,'6.0000',2,'0.0000',2,NULL),(8,24,'666.0000',2,'0.0000',2,'0.0000',2,NULL),(9,30,'1200.0000',2,'0.0000',2,'0.1000',2,NULL),(10,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,34,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,36,'235.0000',2,'235.0000',2,'0.0000',2,NULL),(13,46,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,47,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,52,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,56,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,58,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,61,'777.0000',2,'0.0000',2,'0.0000',2,NULL),(19,64,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,67,'90.0000',2,'0.0000',2,'0.0000',2,NULL),(21,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,80,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,82,'15.0000',2,'0.0000',2,'0.0000',2,NULL),(24,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,88,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,95,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,102,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,109,'20.0000',2,'0.0000',2,'0.0000',2,NULL);
/*!40000 ALTER TABLE `savings_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_trxn_detail`
--

DROP TABLE IF EXISTS `savings_trxn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savings_trxn_detail` (
  `account_trxn_id` int(11) NOT NULL,
  `deposit_amount` decimal(21,4) DEFAULT NULL,
  `deposit_amount_currency_id` smallint(6) DEFAULT NULL,
  `withdrawal_amount` decimal(21,4) DEFAULT NULL,
  `withdrawal_amount_currency_id` smallint(6) DEFAULT NULL,
  `interest_amount` decimal(21,4) DEFAULT NULL,
  `interest_amount_currency_id` smallint(6) DEFAULT NULL,
  `balance` decimal(21,4) DEFAULT NULL,
  `balance_currency_id` smallint(6) NOT NULL,
  PRIMARY KEY (`account_trxn_id`),
  KEY `deposit_amount_currency_id` (`deposit_amount_currency_id`),
  KEY `withdrawal_amount_currency_id` (`withdrawal_amount_currency_id`),
  KEY `interest_amount_currency_id` (`interest_amount_currency_id`),
  KEY `balance_currency_id` (`balance_currency_id`),
  CONSTRAINT `savings_trxn_detail_ibfk_1` FOREIGN KEY (`account_trxn_id`) REFERENCES `account_trxn` (`account_trxn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_trxn_detail_ibfk_2` FOREIGN KEY (`deposit_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_trxn_detail_ibfk_3` FOREIGN KEY (`withdrawal_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_trxn_detail_ibfk_4` FOREIGN KEY (`interest_amount_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `savings_trxn_detail_ibfk_5` FOREIGN KEY (`balance_currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_trxn_detail`
--

LOCK TABLES `savings_trxn_detail` WRITE;
/*!40000 ALTER TABLE `savings_trxn_detail` DISABLE KEYS */;
INSERT INTO `savings_trxn_detail` VALUES (1,'67.0000',2,'0.0000',2,'0.0000',2,'67.0000',2),(2,'50.0000',2,'0.0000',2,'0.0000',2,'50.0000',2),(3,'-67.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(4,'100.0000',2,'0.0000',2,'0.0000',2,'100.0000',2),(5,'0.0000',2,'100.0000',2,'0.0000',2,'0.0000',2),(6,'1.0000',2,'0.0000',2,'0.0000',2,'1.0000',2),(7,'2.0000',2,'0.0000',2,'0.0000',2,'3.0000',2),(8,'3.0000',2,'0.0000',2,'0.0000',2,'6.0000',2),(9,'0.0000',2,'6.0000',2,'0.0000',2,'0.0000',2),(44,'666.0000',2,'0.0000',2,'0.0000',2,'666.0000',2),(46,'1200.0000',2,'0.0000',2,'0.0000',2,'1200.0000',2),(48,'235.0000',2,'0.0000',2,'0.0000',2,'235.0000',2),(49,'0.0000',2,'235.0000',2,'0.0000',2,'0.0000',2),(68,'777.0000',2,'0.0000',2,'0.0000',2,'777.0000',2),(69,'90.0000',2,'0.0000',2,'0.0000',2,'90.0000',2),(70,'15.0000',2,'0.0000',2,'0.0000',2,'15.0000',2),(71,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(72,'0.0000',2,'0.0000',2,'0.0000',2,'50.0000',2),(73,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(74,'0.0000',2,'0.0000',2,'0.1000',2,'1200.1000',2),(75,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(76,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(77,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(78,'0.0000',2,'0.0000',2,'0.0000',2,'777.0000',2),(79,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(80,'0.0000',2,'0.0000',2,'0.0000',2,'90.0000',2),(81,'0.0000',2,'0.0000',2,'0.0000',2,'0.0000',2),(82,'0.0000',2,'0.0000',2,'0.0000',2,'15.0000',2),(85,'20.0000',2,'0.0000',2,'0.0000',2,'20.0000',2);
/*!40000 ALTER TABLE `savings_trxn_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings_type`
--

DROP TABLE IF EXISTS `savings_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savings_type` (
  `savings_type_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`savings_type_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `savings_type_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings_type`
--

LOCK TABLES `savings_type` WRITE;
/*!40000 ALTER TABLE `savings_type` DISABLE KEYS */;
INSERT INTO `savings_type` VALUES (1,118),(2,119);
/*!40000 ALTER TABLE `savings_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `taskid` int(11) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`taskid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES (1,'ProductStatus','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(2,'LoanArrearsTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(3,'SavingsIntCalcTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(4,'SavingsIntPostingTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(5,'ApplyCustomerFeeChangesTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(6,'LoanArrearsAgingTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(7,'GenerateMeetingsForCustomerAndSavingsTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(8,'ApplyHolidayChangesTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:00',1),(9,'PortfolioAtRiskTask','Finished Successfully','2010-07-27 14:00:00','2010-07-27 14:00:01',1),(10,'BranchReportTask','Finished Successfully','2010-07-27 14:00:01','2010-07-27 14:00:01',1),(11,'ProductStatus','Finished Successfully','2010-07-28 14:00:00','2010-08-03 14:00:00',1),(12,'ProductStatus','Finished Successfully','2010-07-29 14:00:00','2010-08-03 14:00:00',1),(13,'ProductStatus','Finished Successfully','2010-07-30 14:00:00','2010-08-03 14:00:00',1),(14,'ProductStatus','Finished Successfully','2010-07-31 14:00:00','2010-08-03 14:00:01',1),(15,'ProductStatus','Finished Successfully','2010-08-01 14:00:00','2010-08-03 14:00:01',1),(16,'ProductStatus','Finished Successfully','2010-08-02 14:00:00','2010-08-03 14:00:01',1),(17,'LoanArrearsTask','Finished Successfully','2010-08-03 14:00:01','2010-08-03 14:00:01',1),(18,'SavingsIntPostingTask','Finished Successfully','2010-07-28 14:00:00','2010-08-03 14:00:01',1),(19,'SavingsIntPostingTask','Finished Successfully','2010-07-29 14:00:00','2010-08-03 14:00:01',1),(20,'SavingsIntPostingTask','Finished Successfully','2010-07-30 14:00:00','2010-08-03 14:00:01',1),(21,'SavingsIntPostingTask','Finished Successfully','2010-07-31 14:00:00','2010-08-03 14:00:01',1),(22,'SavingsIntPostingTask','Finished Successfully','2010-08-01 14:00:00','2010-08-03 14:00:01',1),(23,'SavingsIntPostingTask','Finished Successfully','2010-08-02 14:00:00','2010-08-03 14:00:01',1),(24,'ApplyCustomerFeeChangesTask','Finished Successfully','2010-08-03 14:00:01','2010-08-03 14:00:01',1),(25,'SavingsIntCalcTask','Finished Successfully','2010-07-28 14:00:00','2010-08-03 14:00:02',1),(26,'SavingsIntCalcTask','Finished Successfully','2010-07-29 14:00:00','2010-08-03 14:00:02',1),(27,'SavingsIntCalcTask','Finished Successfully','2010-07-30 14:00:00','2010-08-03 14:00:02',1),(28,'SavingsIntCalcTask','Finished Successfully','2010-07-31 14:00:00','2010-08-03 14:00:02',1),(29,'SavingsIntCalcTask','Finished Successfully','2010-08-01 14:00:00','2010-08-03 14:00:02',1),(30,'SavingsIntCalcTask','Finished Successfully','2010-08-02 14:00:00','2010-08-03 14:00:03',1),(31,'LoanArrearsAgingTask','Finished Successfully','2010-08-03 14:00:03','2010-08-03 14:00:03',1),(32,'GenerateMeetingsForCustomerAndSavingsTask','Finished Successfully','2010-08-03 14:00:03','2010-08-03 14:00:03',1),(33,'ApplyHolidayChangesTask','Finished Successfully','2010-08-03 14:00:03','2010-08-03 14:00:03',1),(34,'PortfolioAtRiskTask','Finished Successfully','2010-08-03 14:00:03','2010-08-03 14:00:03',1),(35,'BranchReportTask','Finished Successfully','2010-07-28 14:00:01','2010-08-03 14:00:04',1),(36,'BranchReportTask','Finished Successfully','2010-07-29 14:00:01','2010-08-03 14:00:04',1),(37,'BranchReportTask','Finished Successfully','2010-07-30 14:00:01','2010-08-03 14:00:04',1),(38,'BranchReportTask','Finished Successfully','2010-07-31 14:00:01','2010-08-03 14:00:04',1),(39,'BranchReportTask','Finished Successfully','2010-08-01 14:00:01','2010-08-03 14:00:04',1),(40,'BranchReportTask','Finished Successfully','2010-08-02 14:00:01','2010-08-03 14:00:04',1);
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_group_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sequence_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_group_id` (`question_group_id`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`question_group_id`) REFERENCES `question_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_questions`
--

DROP TABLE IF EXISTS `sections_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `is_required` tinyint(4) DEFAULT '0',
  `sequence_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `sections_questions_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `sections_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_questions`
--

LOCK TABLES `sections_questions` WRITE;
/*!40000 ALTER TABLE `sections_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spouse_father_lookup`
--

DROP TABLE IF EXISTS `spouse_father_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spouse_father_lookup` (
  `spouse_father_id` int(11) NOT NULL,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`spouse_father_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `spouse_father_lookup_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spouse_father_lookup`
--

LOCK TABLES `spouse_father_lookup` WRITE;
/*!40000 ALTER TABLE `spouse_father_lookup` DISABLE KEYS */;
INSERT INTO `spouse_father_lookup` VALUES (1,128),(2,129),(4,622),(5,623);
/*!40000 ALTER TABLE `spouse_father_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supported_locale`
--

DROP TABLE IF EXISTS `supported_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supported_locale` (
  `locale_id` smallint(6) NOT NULL,
  `country_id` smallint(6) DEFAULT NULL,
  `lang_id` smallint(6) DEFAULT NULL,
  `locale_name` varchar(50) DEFAULT NULL,
  `default_locale` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`locale_id`),
  KEY `country_id` (`country_id`),
  KEY `lang_id` (`lang_id`),
  CONSTRAINT `supported_locale_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supported_locale_ibfk_2` FOREIGN KEY (`lang_id`) REFERENCES `language` (`lang_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supported_locale`
--

LOCK TABLES `supported_locale` WRITE;
/*!40000 ALTER TABLE `supported_locale` DISABLE KEYS */;
INSERT INTO `supported_locale` VALUES (1,6,1,'EN',1),(2,7,2,'Icelandic',0),(3,8,3,'Spanish',0),(4,9,4,'French',0),(5,10,5,'Chinese-China',0),(6,11,6,'Swahili-Kenya',0),(7,12,6,'Swahili-Tanzania',0),(8,13,6,'Swahili-Uganda',0),(9,14,7,'Arabic-Algeria',0),(10,15,7,'Arabic-Bahrain',0),(11,16,7,'Arabic-Comoros',0),(12,17,7,'Arabic-Chad',0),(13,18,7,'Arabic-Djibouti',0),(14,19,7,'Arabic-Egypt',0),(15,20,7,'Arabic-Eritrea',0),(16,21,7,'Arabic-Iraq',0),(17,22,7,'Arabic-Israel',0),(18,23,7,'Arabic-Jordan',0),(19,24,7,'Arabic-Kuwait',0),(20,25,7,'Arabic-Lebanon',0),(21,26,7,'Arabic-Libyan Arab Rebublic',0),(22,27,7,'Arabic-Mauritania',0),(23,28,7,'Arabic-Morocco',0),(24,29,7,'Arabic-Oman',0),(25,30,7,'Arabic-Qatar',0),(26,31,7,'Arabic-Saudi Arabia',0),(27,32,7,'Arabic-Somalia',0),(28,33,7,'Arabic-Sudan',0),(29,34,7,'Arabic-Syrian Arab Republic',0),(30,35,7,'Arabic-Tunisia',0),(31,36,7,'Arabic-United Arab Emirates',0),(32,37,7,'Arabic-Yemen',0),(33,38,7,'Arabic-Palestinian Territory, Occupied',0),(34,39,7,'Arabic-Western Sahara',0),(35,40,8,'Portuguese-Angola',0),(36,41,8,'Portuguese-Brazil',0),(37,42,8,'Portuguese-Cape Verde',0),(38,43,8,'Portuguese-Guinea-Bissau',0),(39,44,8,'Portuguese-Equatorial Guinea',0),(40,45,8,'Portuguese-Macau',0),(41,46,8,'Portuguese-Mozambique',0),(42,47,8,'Portuguese-Portugal',0),(43,48,8,'Portuguese-Sao Tome and Principe',0),(44,49,9,'Khmer-Cambodia',0),(45,50,10,'Lao-Laos',0),(46,25,1,'English-Lebanon-AlMajmoua',0),(47,51,11,'Hungarian-Hungary',0);
/*!40000 ALTER TABLE `supported_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_name` varchar(200) NOT NULL,
  `survey_applies_to` varchar(200) NOT NULL,
  `date_of_creation` date NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_instance`
--

DROP TABLE IF EXISTS `survey_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_instance` (
  `instance_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `officer_id` smallint(6) DEFAULT NULL,
  `date_conducted` date NOT NULL,
  `completed_status` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `creating_officer_id` smallint(6) NOT NULL,
  PRIMARY KEY (`instance_id`),
  KEY `survey_id` (`survey_id`),
  KEY `customer_id` (`customer_id`),
  KEY `officer_id` (`officer_id`),
  KEY `account_id` (`account_id`),
  KEY `creating_officer_id` (`creating_officer_id`),
  CONSTRAINT `survey_instance_ibfk_1` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_instance_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_instance_ibfk_3` FOREIGN KEY (`officer_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_instance_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_instance_ibfk_5` FOREIGN KEY (`creating_officer_id`) REFERENCES `personnel` (`personnel_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_instance`
--

LOCK TABLES `survey_instance` WRITE;
/*!40000 ALTER TABLE `survey_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questions`
--

DROP TABLE IF EXISTS `survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questions` (
  `surveyquestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_order` int(11) NOT NULL,
  `mandatory` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`surveyquestion_id`),
  KEY `question_id` (`question_id`),
  KEY `survey_id` (`survey_id`),
  CONSTRAINT `survey_questions_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_questions_ibfk_2` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questions`
--

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_response`
--

DROP TABLE IF EXISTS `survey_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_response` (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL,
  `survey_question_id` int(11) NOT NULL,
  `freetext_value` text,
  `choice_value` int(11) DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `number_value` decimal(16,5) DEFAULT NULL,
  `multi_select_value` text,
  PRIMARY KEY (`response_id`),
  UNIQUE KEY `instance_id` (`instance_id`,`survey_question_id`),
  KEY `survey_question_id` (`survey_question_id`),
  KEY `choice_value` (`choice_value`),
  CONSTRAINT `survey_response_ibfk_1` FOREIGN KEY (`survey_question_id`) REFERENCES `survey_questions` (`surveyquestion_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_response_ibfk_2` FOREIGN KEY (`instance_id`) REFERENCES `survey_instance` (`instance_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `survey_response_ibfk_3` FOREIGN KEY (`choice_value`) REFERENCES `question_choices` (`choice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_response`
--

LOCK TABLES `survey_response` WRITE;
/*!40000 ALTER TABLE `survey_response` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_id`
--

DROP TABLE IF EXISTS `temp_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_id` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `tempid` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_id`
--

LOCK TABLES `temp_id` WRITE;
/*!40000 ALTER TABLE `temp_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_type` (
  `transaction_id` smallint(6) NOT NULL,
  `transaction_name` varchar(100) NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_type`
--

LOCK TABLES `transaction_type` WRITE;
/*!40000 ALTER TABLE `transaction_type` DISABLE KEYS */;
INSERT INTO `transaction_type` VALUES (1,'Loan Disbursement'),(2,'Loan Repayment'),(3,'Savings Deposit'),(4,'Savings Withdrawals'),(5,'Client Fees/penalty payments');
/*!40000 ALTER TABLE `transaction_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waive_off_history`
--

DROP TABLE IF EXISTS `waive_off_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waive_off_history` (
  `waive_off_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `waive_off_date` date NOT NULL,
  `waive_off_type` varchar(20) NOT NULL,
  PRIMARY KEY (`waive_off_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `waive_off_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `loan_account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waive_off_history`
--

LOCK TABLES `waive_off_history` WRITE;
/*!40000 ALTER TABLE `waive_off_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `waive_off_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yes_no_master`
--

DROP TABLE IF EXISTS `yes_no_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yes_no_master` (
  `yes_no_master_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `lookup_id` int(11) NOT NULL,
  PRIMARY KEY (`yes_no_master_id`),
  KEY `lookup_id` (`lookup_id`),
  CONSTRAINT `yes_no_master_ibfk_1` FOREIGN KEY (`lookup_id`) REFERENCES `lookup_value` (`lookup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yes_no_master`
--

LOCK TABLES `yes_no_master` WRITE;
/*!40000 ALTER TABLE `yes_no_master` DISABLE KEYS */;
INSERT INTO `yes_no_master` VALUES (1,124),(2,125);
/*!40000 ALTER TABLE `yes_no_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-10-28 10:45:53
