
-- MySQL dump 10.13  Distrib 5.7.25, for macos10.14 (x86_64)
--
-- Host: localhost    Database: smart_manage
-- ------------------------------------------------------
-- Server version	8.0.15

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `street1` varchar(200) NOT NULL,
  `street 2` varchar(200) DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  `state` char(20) NOT NULL,
  `zip` char(5) NOT NULL,
  `geo_location` varchar(255) NOT NULL,
  PRIMARY KEY (`geo_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES ('360 Huntington','','Boston','MA','02115','20458c5e-ac4e-490e-80c4-cb6d6d048b24'),('800 Boylston St','#19','Boston','MA','02199','42.346682,-71.083496'),('292 Western Ave','#2','Cambridge','MA','02139','42.364508,-71.1126431'),('189 Charles St','','Cambridge','MA','02141','42.3680576,-71.083528'),('150 Berkshire St','#150','Cambridge','MA','02141','42.3718369,-71.0898745'),('262 Monsignor Obrien Hwy','#102','Cambridge','MA','02141','42.373589,-71.082075'),('35 Magnolia Ave','APT 4','Cambridge','MA','02138','42.37669,-71.106752'),('26 Adrian St','#28','Somerville','MA','02143','42.3771431,-71.0989952'),('8 Avon St','APT 2','Cambridge','MA','02138','42.381715,-71.1221288'),('130 Walnut St','#2','Somerville','MA','02145','42.3864694,-71.093478'),('461 Concord Avenue','#2','Cambridge','MA','02138','42.3865247,-71.1399213'),('14 Stickney Ave','','Somerville','MA','02145','42.3892946,-71.0966778'),('242 Broadway','','Somerville','MA','02145','42.3909462,-71.0903852'),('18 Prichard Ave','#18','Somerville','MA','02144','42.3953309,-71.1117454'),('1 Vinal St','','Somerville','MA','02145','42.3957985,-71.1054068'),('261 Highland Ave','#1','Somerville','MA','02143','42.3960546,-71.1212999'),('4 Cameron Ave','APT 2','Somerville','MA','02144','42.3975069,-71.130002'),('24 Hall Ave','','Somerville','MA','02144','42.3983843,-71.1198644'),('18 Glendale Ave','','Somerville','MA','02144','42.3993197,-71.128628'),('9 Joseph St','','Medford','MA','02155','42.399806,-71.099737'),('88-1 Irving St','#1','Somerville','MA','02144','42.4009477,-71.1218943'),('71 School St','','Somerville','MA','02143','42.40875080000001,-71.0765112'),('46 High St','#48','Somerville','MA','02144','42.4100154,-71.1298491');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contract` (
  `property_manager_id` varchar(60) NOT NULL,
  `property_owner_id` varchar(60) NOT NULL,
  `signed_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `details` varchar(20000) NOT NULL,
  `payment_amount` float(12,2) NOT NULL,
  PRIMARY KEY (`property_manager_id`,`property_owner_id`),
  KEY `owner_idx` (`property_owner_id`),
  CONSTRAINT `manager_fk` FOREIGN KEY (`property_manager_id`) REFERENCES `property_manager` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `owner_fk` FOREIGN KEY (`property_owner_id`) REFERENCES `property_owner` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES ('f9a88fd7-8341-4355-a460-bbc0e79cb104','055c804c-c9e6-4759-aa74-5b547a3bff95','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','081e3bb5-5491-47c0-b445-65ffd64d7f60','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','17b56085-c090-4755-8f54-9d6dbeae1f46','2019-04-01 00:00:00','2020-04-01 00:00:00','',400.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','323f586b-b1d8-4926-a65d-9b9c4e7b6194','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','3c017815-814e-439e-ae14-3de4e263abe8','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','57189b7d-ef51-49c5-9ed2-9c1f8ec20b23','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','5cc6c450-e26e-4829-9712-c62fa7844d80','2019-04-01 00:00:00','2020-04-01 00:00:00','',600.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','709fd42d-560f-4557-9bc9-608a8f508166','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','87fd1763-38eb-4b59-a0ae-65e9a4daaf10','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','8bc72926-b130-4a23-9416-a1a188ab546d','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','a1342590-6d8b-411d-9a25-e5d65a0d94b1','2019-04-01 00:00:00','2020-04-01 00:00:00','',400.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','c1fb3de0-8709-42f8-9802-4db45549f843','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','e08e36a5-ab2e-4b6c-873d-4c384bb78b83','2019-04-01 00:00:00','2020-04-01 00:00:00','',400.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','e5d57f8a-7fae-41ca-bc97-89d8e8be9522','2019-04-01 00:00:00','2020-04-01 00:00:00','',200.00),('f9a88fd7-8341-4355-a460-bbc0e79cb104','eaa5f156-8a7e-4f12-9b6c-050f7369e93c','2019-04-01 00:00:00','2020-04-01 00:00:00','',400.00);
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Managed_property`
--

DROP TABLE IF EXISTS `Managed_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Managed_property` (
  `id` varchar(60) NOT NULL,
  `location` varchar(45) NOT NULL,
  `property_type` enum('SFH','MFH','CONDO') CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `managed_by` varchar(60) NOT NULL,
  `owned_by` varchar(60) NOT NULL,
  `last_maintenance` datetime DEFAULT NULL,
  `last_visited` datetime DEFAULT NULL,
  `value` float(12,2) NOT NULL,
  `tax_amount` float(12,2) NOT NULL,
  `rent_due` datetime DEFAULT NULL,
  `total_spending` float(12,2) NOT NULL,
  `rent_amount` float(12,2) NOT NULL,
  `status` enum('VACANT','OCCUPIED') NOT NULL,
  `rooms` int(11) NOT NULL,
  `bathrooms` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `managed_by_idx` (`managed_by`),
  KEY `address_idx` (`location`),
  KEY `owned_by_idx` (`owned_by`),
  CONSTRAINT `managed_fk` FOREIGN KEY (`managed_by`) REFERENCES `property_manager` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `owned_fk` FOREIGN KEY (`owned_by`) REFERENCES `property_owner` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `property_address_fk` FOREIGN KEY (`location`) REFERENCES `address` (`geo_location`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Managed_property`
--

LOCK TABLES `Managed_property` WRITE;
/*!40000 ALTER TABLE `Managed_property` DISABLE KEYS */;
INSERT INTO `Managed_property` VALUES ('0341ed25-266a-420f-a34a-387257a50aba','42.364508,-71.1126431','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','e08e36a5-ab2e-4b6c-873d-4c384bb78b83','2019-02-05 00:00:00','2019-01-09 00:00:00',805000.00,4054.00,'2019-05-02 00:00:00',4910.00,4700.00,'OCCUPIED',2,2),('07cfb301-6285-4065-811c-5a33156ae403','42.3975069,-71.130002','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','e08e36a5-ab2e-4b6c-873d-4c384bb78b83','2018-05-10 00:00:00',NULL,679000.00,6493.00,'2019-05-05 00:00:00',23015.00,2600.00,'OCCUPIED',1,2),('09b55c33-d3d0-4a5c-b195-f7f0ff752534','42.3865247,-71.1399213','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','e5d57f8a-7fae-41ca-bc97-89d8e8be9522','2018-10-24 00:00:00',NULL,879000.00,4500.00,'2019-04-28 00:00:00',6910.00,4300.00,'OCCUPIED',3,3),('2eb72a84-d51c-4da0-887e-eef07373fc25','42.4100154,-71.1298491','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','57189b7d-ef51-49c5-9ed2-9c1f8ec20b23',NULL,'2018-10-03 00:00:00',1295000.00,10943.00,'2019-05-01 00:00:00',0.00,6200.00,'OCCUPIED',5,3),('571d0a0d-7c91-4528-93b7-754c8fc5db2f','42.37669,-71.106752','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','5cc6c450-e26e-4829-9712-c62fa7844d80','2018-10-24 00:00:00','2018-11-25 00:00:00',715000.00,3811.00,'2019-04-29 00:00:00',10325.00,3900.00,'OCCUPIED',2,2),('576c8038-2a0e-4e7a-b9ab-f6cdf9ff79f6','42.3957985,-71.1054068','SFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','c1fb3de0-8709-42f8-9802-4db45549f843',NULL,NULL,650000.00,6554.00,'2019-04-28 00:00:00',0.00,4300.00,'OCCUPIED',3,2),('5a5ed68b-ef82-48f8-875c-535af9109397','42.3983843,-71.1198644','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','17b56085-c090-4755-8f54-9d6dbeae1f46','2019-01-31 00:00:00',NULL,2099000.00,18995.00,NULL,10000.00,8900.00,'VACANT',9,3),('5abea403-327a-4650-9f3b-45fb8ee4516d','42.3909462,-71.0903852','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','081e3bb5-5491-47c0-b445-65ffd64d7f60','2019-03-25 00:00:00',NULL,1649999.00,12551.00,NULL,5910.00,10000.00,'VACANT',9,5),('78d04b72-9bcc-49b5-a58d-3276f0f46b14','42.3771431,-71.0989952','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','87fd1763-38eb-4b59-a0ae-65e9a4daaf10','2018-07-21 00:00:00',NULL,1650000.00,12790.00,'2019-05-01 00:00:00',4932.00,10800.00,'OCCUPIED',9,3),('8595e756-18e1-4a16-b5b4-036a744dfc76','42.3953309,-71.1117454','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','a1342590-6d8b-411d-9a25-e5d65a0d94b1','2018-11-02 00:00:00',NULL,1100000.00,8590.00,'2019-05-04 00:00:00',6630.00,5000.00,'OCCUPIED',3,3),('8b156dfd-c461-46bc-b0d8-38433f6a2a8b','42.3993197,-71.128628','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','a1342590-6d8b-411d-9a25-e5d65a0d94b1','2019-03-25 00:00:00','2018-05-17 00:00:00',1049999.00,8962.00,'2019-05-01 00:00:00',6000.00,4500.00,'OCCUPIED',4,3),('90ad01e3-2c3d-466c-961c-291f73851f69','20458c5e-ac4e-490e-80c4-cb6d6d048b24','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','aa99c159-5de2-4214-8235-15c21dbc4f4b','2019-04-09 00:00:00','2019-04-09 00:00:00',4500000.00,1200000.00,'2019-04-09 00:00:00',800000.00,50000.00,'OCCUPIED',10,2),('a2b48f8e-dc07-45b7-b150-0b923fd84fc1','42.3718369,-71.0898745','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','8bc72926-b130-4a23-9416-a1a188ab546d',NULL,'2018-06-01 00:00:00',379000.00,4016.00,'2019-04-28 00:00:00',0.00,2200.00,'OCCUPIED',0,1),('aa7a351e-5789-4813-86b7-073fa80a0b9c','42.3864694,-71.093478','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','5cc6c450-e26e-4829-9712-c62fa7844d80','2019-03-03 00:00:00','2018-10-18 00:00:00',869000.00,6912.00,'2019-05-12 00:00:00',5000.00,5000.00,'OCCUPIED',2,3),('b6f46fda-1444-416f-9af4-b71455de0068','42.3680576,-71.083528','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','055c804c-c9e6-4759-aa74-5b547a3bff95','2018-12-20 00:00:00','2019-04-10 00:00:00',2100000.00,22650.00,'2019-04-28 00:00:00',39102.00,6600.00,'OCCUPIED',6,4),('bf1a423e-0515-4135-aae1-c76d69f6ca4f','42.3960546,-71.1212999','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','709fd42d-560f-4557-9bc9-608a8f508166','2018-08-07 00:00:00','2019-04-14 00:00:00',339000.00,2831.00,'2019-05-14 00:00:00',2340.00,2300.00,'OCCUPIED',1,1),('cb1b42cc-cbdb-4ad2-85f9-5720acc932b1','42.40875080000001,-71.0765112','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','eaa5f156-8a7e-4f12-9b6c-050f7369e93c','2018-07-15 00:00:00','2018-11-25 00:00:00',1100000.00,8260.00,'2019-04-28 00:00:00',32000.00,7000.00,'OCCUPIED',6,2),('d48e29d7-f28e-42ef-8eaa-daeefbfbefe5','42.373589,-71.082075','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','17b56085-c090-4755-8f54-9d6dbeae1f46','2018-08-12 00:00:00',NULL,989000.00,9482.00,'2019-05-23 00:00:00',2310.00,4200.00,'OCCUPIED',2,2),('d5d1931e-3a3a-4fa6-b007-00bb781a0472','42.381715,-71.1221288','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','eaa5f156-8a7e-4f12-9b6c-050f7369e93c','2019-02-13 00:00:00','2018-05-09 00:00:00',625000.00,4056.00,'2019-05-04 00:00:00',150.00,2100.00,'OCCUPIED',1,1),('eb789100-9b57-4bd4-8900-8fe2aa81a97f','42.3892946,-71.0966778','MFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','3c017815-814e-439e-ae14-3de4e263abe8',NULL,NULL,1800000.00,14291.00,NULL,534.00,12000.00,'VACANT',9,4),('f1e0e405-496c-43c3-9044-9899934bb3df','42.4009477,-71.1218943','CONDO','f9a88fd7-8341-4355-a460-bbc0e79cb104','5cc6c450-e26e-4829-9712-c62fa7844d80',NULL,'2018-08-14 00:00:00',1299900.00,11831.00,'2019-05-01 00:00:00',0.00,4400.00,'OCCUPIED',2,3),('f745a9b4-42f6-473f-a94a-4aec6a7172f7','42.399806,-71.099737','SFH','f9a88fd7-8341-4355-a460-bbc0e79cb104','323f586b-b1d8-4926-a65d-9b9c4e7b6194','2019-04-05 00:00:00','2018-06-01 00:00:00',750000.00,3525.00,'2019-05-03 00:00:00',4600.00,2600.00,'OCCUPIED',2,1);
/*!40000 ALTER TABLE `Managed_property` ENABLE KEYS */;
UNLOCK TABLES;
--


--
-- Table structure for table `management_company`
--

DROP TABLE IF EXISTS `management_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `management_company` (
  `id` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_geo_idx` (`location`),
  CONSTRAINT `address_geo` FOREIGN KEY (`location`) REFERENCES `address` (`geo_location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_company`
--

LOCK TABLES `management_company` WRITE;
/*!40000 ALTER TABLE `management_company` DISABLE KEYS */;
INSERT INTO `management_company` VALUES ('a6c402f8-5027-11e9-8647-d663bd873d93','Shadoworks','Aran Knight','42.346682,-71.083496');
/*!40000 ALTER TABLE `management_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Property_manager`
--

DROP TABLE IF EXISTS `Property_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Property_manager` (
  `id` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_company` varchar(60) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `company_idx` (`parent_company`),
  CONSTRAINT `parent_company_fk` FOREIGN KEY (`parent_company`) REFERENCES `management_company` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Property_manager`
--

LOCK TABLES `Property_manager` WRITE;
/*!40000 ALTER TABLE `Property_manager` DISABLE KEYS */;
INSERT INTO `Property_manager` VALUES ('f9a88fd7-8341-4355-a460-bbc0e79cb104','Andrew L. Carillo','a6c402f8-5027-11e9-8647-d663bd873d93','admin','admin');
/*!40000 ALTER TABLE `Property_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Property_owner`
--

DROP TABLE IF EXISTS `Property_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Property_owner` (
  `id` varchar(60) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_num` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Property_owner`
--

LOCK TABLES `Property_owner` WRITE;
/*!40000 ALTER TABLE `Property_owner` DISABLE KEYS */;
INSERT INTO `Property_owner` VALUES ('055c804c-c9e6-4759-aa74-5b547a3bff95','Pauletta Adkisson','508-233-2199','zynniddaqyw-3655@encryptedemail.com'),('081e3bb5-5491-47c0-b445-65ffd64d7f60','Wade Hochman','413-441-3458','appojaty-2883@encryptedemail.com'),('17b56085-c090-4755-8f54-9d6dbeae1f46','Tyree Rone','774-306-2634','rossemmuze-2253@encryptedemail.com'),('323f586b-b1d8-4926-a65d-9b9c4e7b6194','Grady Rawlinson','978-279-1049','iraniqix-0680@encryptedemail.com'),('3c017815-814e-439e-ae14-3de4e263abe8','Kenneth Galles','857-453-1990','ammuzore-0326@encryptedemail.com'),('57189b7d-ef51-49c5-9ed2-9c1f8ec20b23','Terese Taitt','508-552-5187','omumupoc-9565@encryptedemail.com'),('5cc6c450-e26e-4829-9712-c62fa7844d80','Lavinia Caudillo','978-607-4594','ottediffopp-4358@encryptedemail.com'),('709fd42d-560f-4557-9bc9-608a8f508166','Sandy Ollie','617-477-9200','poxorittyss-0988@encryptedemail.com'),('87fd1763-38eb-4b59-a0ae-65e9a4daaf10','Elwood Honig','413-752-5104','nydessace-3973@encryptedemail.com'),('8bc72926-b130-4a23-9416-a1a188ab546d','Carlo Santibanez','781-981-3041','lofobimmi-6488@encryptedemail.com'),('a1342590-6d8b-411d-9a25-e5d65a0d94b1','Fredric Lentini','978-791-6570','riqerevig-1765@encryptedemail.com'),('aa99c159-5de2-4214-8235-15c21dbc4f4b','Jin','1234567891','jin@admin.com'),('c1fb3de0-8709-42f8-9802-4db45549f843','Zana Issa','781-842-8595','tewugiddilo-5029@encryptedemail.com'),('e08e36a5-ab2e-4b6c-873d-4c384bb78b83','Tod Matthew','781-502-9729','qejahice-2599@encryptedemail.com'),('e5d57f8a-7fae-41ca-bc97-89d8e8be9522','Emmitt Verrill','508-922-9407','ebogosess-6200@encryptedemail.com'),('eaa5f156-8a7e-4f12-9b6c-050f7369e93c','Ethyl Ahmad','617-692-6997','odduttowixa-3931@encryptedemail.com');
/*!40000 ALTER TABLE `Property_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Task` (
  `id` varchar(60) NOT NULL,
  `body` varchar(20000) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` varchar(60) NOT NULL,
  `updated` datetime NOT NULL,
  `done` tinyint(4) NOT NULL,
  `property_id` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_idx` (`created_by`),
  KEY `property_idx` (`property_id`),
  CONSTRAINT `creator_fk` FOREIGN KEY (`created_by`) REFERENCES `property_manager` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `property_fk` FOREIGN KEY (`property_id`) REFERENCES `managed_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
INSERT INTO `Task` VALUES ('961c442f-4033-42b8-8580-11e309222ddf','new task','2019-04-01 12:21:04','f9a88fd7-8341-4355-a460-bbc0e79cb104','2019-04-01 12:21:04',0,NULL),('c5a8cd86-1d46-4b84-bf21-8a963e99cf56','hey','2019-04-10 11:34:11','f9a88fd7-8341-4355-a460-bbc0e79cb104','2019-04-10 11:34:11',0,'aa7a351e-5789-4813-86b7-073fa80a0b9c');
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tenant`
--

DROP TABLE IF EXISTS `Tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tenant` (
  `id` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_paid` datetime NOT NULL,
  `living_location` varchar(60) NOT NULL,
  `credit_score` int(11) NOT NULL,
  `contract_expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `living_in_idx` (`living_location`),
  CONSTRAINT `living_in` FOREIGN KEY (`living_location`) REFERENCES `managed_property` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tenant`
--

LOCK TABLES `Tenant` WRITE;
/*!40000 ALTER TABLE `Tenant` DISABLE KEYS */;
INSERT INTO `Tenant` VALUES ('1aad6882-c341-45c9-8f0f-13d54efa7812','Jean W. Mullen','2019-03-29 00:00:00','571d0a0d-7c91-4528-93b7-754c8fc5db2f',757,'2019-07-29 00:00:00'),('2e328e5a-5db7-464f-a782-b91a9b4d6ab9','Jessica','2019-04-09 00:00:00','90ad01e3-2c3d-466c-961c-291f73851f69',683,'2019-04-09 00:00:00'),('2f19cc81-9c85-4a95-96fd-388bf54ff6a1','Tain Ho','2019-04-01 00:00:00','f1e0e405-496c-43c3-9044-9899934bb3df',676,'2020-04-01 00:00:00'),('5d05c67b-051d-4a96-9396-6edee17169d7','Angie D. Jones','2019-04-04 00:00:00','d5d1931e-3a3a-4fa6-b007-00bb781a0472',716,'2019-08-04 00:00:00'),('64ea4ea5-c2e3-4371-bb48-0a68a6a4f4ce','Lelia Cocci','2019-04-02 00:00:00','0341ed25-266a-420f-a34a-387257a50aba',729,'2020-01-02 00:00:00'),('66024bb9-bb44-48c2-910e-1965e9cb17ee','Shannon L. Daley','2019-04-01 00:00:00','78d04b72-9bcc-49b5-a58d-3276f0f46b14',671,'2019-11-01 00:00:00'),('6a83b3ff-a177-47c1-b1b1-64c4dd0c9414','Marilee W. Anderson','2019-04-03 00:00:00','8b156dfd-c461-46bc-b0d8-38433f6a2a8b',707,'2019-09-01 00:00:00'),('6d765b46-60cc-400e-8756-a6334a12ed2f','Ronald K. Payton','2019-04-12 00:00:00','f745a9b4-42f6-473f-a94a-4aec6a7172f7',749,'2019-12-03 00:00:00'),('8973c218-01b7-4eb4-8bea-8129e0fec3ed','Robert E. Madewell','2018-04-14 00:00:00','bf1a423e-0515-4135-aae1-c76d69f6ca4f',727,'2019-11-14 00:00:00'),('8fcc1996-f7a2-4ada-8d7c-a2af4daa450f','Cai Pan','2019-04-13 00:00:00','aa7a351e-5789-4813-86b7-073fa80a0b9c',722,'2019-12-12 00:00:00'),('a112df0a-bb4f-4d87-a874-2856c0e851f9','Dorothy H. Kirkendall','2019-04-04 00:00:00','07cfb301-6285-4065-811c-5a33156ae403',667,'2019-09-01 00:00:00'),('a62d7188-1217-4da4-b965-1e65c97158d7','Michele D. Meader','2019-04-20 00:00:00','d48e29d7-f28e-42ef-8eaa-daeefbfbefe5',719,'2019-11-23 00:00:00'),('acf02176-a4e9-4b00-81ac-f02747b103e1','Victoria A. Camacho','2019-03-29 00:00:00','a2b48f8e-dc07-45b7-b150-0b923fd84fc1',735,'2019-09-28 00:00:00'),('ad4cabfe-ea7f-4d07-9549-d2260bd06fce','Alice H. Engel','2019-03-29 00:00:00','b6f46fda-1444-416f-9af4-b71455de0068',738,'2019-11-28 00:00:00'),('b0f99053-42da-4392-90ac-ac9c90b18151','Ina D. Sanders','2019-04-02 00:00:00','09b55c33-d3d0-4a5c-b195-f7f0ff752534',6692,'2020-02-28 00:00:00'),('c1a64c01-62d4-4e47-9f45-19d329a70003','Steve M. Pierson','2019-04-10 00:00:00','2eb72a84-d51c-4da0-887e-eef07373fc25',760,'2020-01-01 00:00:00'),('c734dbc3-4d39-48ac-8848-f2f62a115029','Steven M. Shields','2019-04-05 00:00:00','8595e756-18e1-4a16-b5b4-036a744dfc76',701,'2019-07-04 00:00:00'),('fda4d558-0a1e-434f-94a4-11c663422648','Eric R. Andrzejewski','2019-03-28 00:00:00','cb1b42cc-cbdb-4ad2-85f9-5720acc932b1',677,'2019-10-28 00:00:00'),('ffafa2d2-7de4-4398-8223-61d1bf428ad4','Aron Adamski','2019-03-30 00:00:00','576c8038-2a0e-4e7a-b9ab-f6cdf9ff79f6',684,'2019-10-28 00:00:00');
/*!40000 ALTER TABLE `Tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'smart_manage'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_property` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `delete_property`(
property_id VARCHAR(60)
)
BEGIN 
	DECLARE tenant_id VARCHAR(60);
	DECLARE owner_id VARCHAR(60);
	DECLARE address_id VARCHAR(255);
    
	SET tenant_id = (SELECT id FROM `smart_manage`.`tenant` WHERE living_location = property_id);
    DELETE FROM `smart_manage`.`tenant` WHERE id = tenant_id;
    SET owner_id = (SELECT owned_by FROM `smart_manage`.`Managed_Property` WHERE id = property_id);
	SET address_id = (SELECT location FROM `smart_manage`.`Managed_Property` WHERE id = property_id);
    DELETE t FROM `smart_manage`.`Task` t WHERE t.property_id = property_id; 
    DELETE FROM `smart_manage`.`Managed_property` WHERE id = property_id;
    DELETE FROM `smart_manage`.`Property_owner` WHERE id = owner_id;
    DELETE FROM `smart_manage`.`Address` WHERE geo_location = address_id;
END ;;
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

-- WARNING: old server version. The following dump may be incomplete.
--
DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50003 TRIGGER `set_null_datetime` BEFORE INSERT ON `Managed_property` FOR EACH ROW BEGIN
	IF NEW.last_visited = '1000-01-01' THEN SET NEW.last_visited = null; END IF;
	IF NEW.last_maintenance = '1000-01-01' THEN SET NEW.last_maintenance = null; END IF;
	IF NEW.rent_due = '1000-01-01' THEN SET NEW.rent_due = null; END IF;
END */;;
DELIMITER ;

-- Dump completed on 2019-04-10 11:43:31
