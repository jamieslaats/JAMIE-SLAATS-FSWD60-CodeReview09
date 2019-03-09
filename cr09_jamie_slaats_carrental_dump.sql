-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cr09_jamie_slaats_carrental
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

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
-- Table structure for table `carclassprice`
--

DROP TABLE IF EXISTS `carclassprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carclassprice` (
  `Class_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class_name` varchar(255) DEFAULT NULL,
  `Car_price_perday` int(11) DEFAULT NULL,
  PRIMARY KEY (`Class_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carclassprice`
--

LOCK TABLES `carclassprice` WRITE;
/*!40000 ALTER TABLE `carclassprice` DISABLE KEYS */;
INSERT INTO `carclassprice` VALUES (1,'Mini',10),(2,'Economy',18),(3,'Compact',20),(4,'Compact Wagon',25),(5,'Intermediate Wagon',28),(6,'Intermediate',30),(7,'Standard',32),(8,'Standard Wagon',37),(9,'Full Size',32),(10,'Premium',37),(11,'Luxury',46),(12,'Convertible',55);
/*!40000 ALTER TABLE `carclassprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custcreditcard`
--

DROP TABLE IF EXISTS `custcreditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custcreditcard` (
  `Custcreditcard_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Card_num` varchar(16) DEFAULT NULL,
  `Expire_date` date DEFAULT NULL,
  `CCC_num` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`Custcreditcard_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custcreditcard`
--

LOCK TABLES `custcreditcard` WRITE;
/*!40000 ALTER TABLE `custcreditcard` DISABLE KEYS */;
INSERT INTO `custcreditcard` VALUES (1,'1111222233334444','2019-09-18','434'),(2,'2222222222222222','2020-03-18','565'),(3,'3333333333333333','2021-06-09','111'),(4,'9898767654543232','2023-01-01','999'),(5,'1234098765435678','2020-05-10','343');
/*!40000 ALTER TABLE `custcreditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custcreditnum`
--

DROP TABLE IF EXISTS `custcreditnum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custcreditnum` (
  `Custcreditnum_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Customer_ID` int(11) DEFAULT NULL,
  `fk_Custcreditcard_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Custcreditnum_ID`),
  KEY `custcreditnum_ibfk_1` (`fk_Customer_ID`),
  KEY `custcreditnum_ibfk_2` (`fk_Custcreditcard_ID`),
  CONSTRAINT `custcreditnum_ibfk_1` FOREIGN KEY (`fk_Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON UPDATE CASCADE,
  CONSTRAINT `custcreditnum_ibfk_2` FOREIGN KEY (`fk_Custcreditcard_ID`) REFERENCES `custcreditcard` (`Custcreditcard_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custcreditnum`
--

LOCK TABLES `custcreditnum` WRITE;
/*!40000 ALTER TABLE `custcreditnum` DISABLE KEYS */;
INSERT INTO `custcreditnum` VALUES (1,4,1),(2,3,3),(3,2,5),(4,1,2),(5,4,4);
/*!40000 ALTER TABLE `custcreditnum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_name` varchar(255) DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Street_address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Post_code` varchar(50) DEFAULT NULL,
  `Country` varchar(60) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Drivers_lic_num` varchar(12) DEFAULT NULL,
  `Backup_driver` varchar(100) DEFAULT NULL,
  `fk_Custcreditnum_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `customer_ibfk_1` (`fk_Custcreditnum_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_Custcreditnum_ID`) REFERENCES `custcreditnum` (`Custcreditnum_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Doe','43 Strasse Strasse','Lutz','3404','Austria','1977-11-01','B578939X55',NULL,1),(2,'Jane','Seymour','23 Route de la France','Paris','232345','France','1955-05-05','A45454X888','Fanze Firdinand',2),(3,'George','Stopolopolous','2 Crazy Avenue','Cluj','98282','Romania','1990-10-10','C45454T9F',NULL,5),(4,'Gavin','Marshall','23 Wilmington Lane','Oxford','U89T 3RT','Great Britian','1975-05-02','04545445454','Cyan Marshall',4),(5,'Ricardo','Taveres','233 London Street','London','ON','Canada','1977-11-30','RT48049F3333',NULL,3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dropoff`
--

DROP TABLE IF EXISTS `dropoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dropoff` (
  `Dropoff_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Locations_ID` int(11) DEFAULT NULL,
  `fk_Employee_active_ID` int(11) DEFAULT NULL,
  `Date_dropoff` datetime DEFAULT NULL,
  PRIMARY KEY (`Dropoff_ID`),
  KEY `dropoff_ibfk_1` (`fk_Locations_ID`),
  KEY `dropoff_ibfk_2` (`fk_Employee_active_ID`),
  CONSTRAINT `dropoff_ibfk_1` FOREIGN KEY (`fk_Locations_ID`) REFERENCES `locations` (`Locations_ID`) ON UPDATE CASCADE,
  CONSTRAINT `dropoff_ibfk_2` FOREIGN KEY (`fk_Employee_active_ID`) REFERENCES `employeeactive` (`Employee_active_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dropoff`
--

LOCK TABLES `dropoff` WRITE;
/*!40000 ALTER TABLE `dropoff` DISABLE KEYS */;
INSERT INTO `dropoff` VALUES (1,11,3,'2019-02-27 14:00:00'),(2,12,1,'2019-01-31 10:00:00'),(3,16,4,'2019-05-22 09:00:00'),(4,10,2,'2018-11-18 18:00:00'),(5,9,1,'2019-01-22 12:00:00'),(6,6,1,'2019-03-04 08:00:00'),(7,17,1,'2019-06-25 11:00:00');
/*!40000 ALTER TABLE `dropoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeactive`
--

DROP TABLE IF EXISTS `employeeactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeactive` (
  `Employee_active_ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_name` varchar(255) DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Shift_start` datetime DEFAULT NULL,
  `Shift_end` datetime DEFAULT NULL,
  PRIMARY KEY (`Employee_active_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeactive`
--

LOCK TABLES `employeeactive` WRITE;
/*!40000 ALTER TABLE `employeeactive` DISABLE KEYS */;
INSERT INTO `employeeactive` VALUES (1,'Johnny','Cash',123456789,'2019-01-01 07:00:00','2019-12-31 23:00:00'),(2,'Georgina','Francesco',987654321,'2018-12-25 15:00:00','2019-06-26 18:00:00'),(3,'Oscar','Delawild',837883763,'2019-03-01 11:00:00','2019-11-27 12:00:00'),(4,'Olli','Jaymalla',3843434,'2019-01-30 10:00:00','2019-07-23 00:00:00');
/*!40000 ALTER TABLE `employeeactive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `Locations_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Street_address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Province_State` varchar(255) DEFAULT NULL,
  `Post_code` varchar(50) DEFAULT NULL,
  `Country` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Locations_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'32 Leopold Avenue','Vienna',NULL,'1030','Austria'),(2,'45 Harbour Road','London',NULL,'Y789 L56','Great Britain'),(3,'45 Route de Main','Paris',NULL,'878780','France'),(4,'45 Friedriech Strasse','Berlin',NULL,'89280','Germany'),(5,'29 Roto Tondo','Barcelona',NULL,'H3 54040','Spain'),(6,'98 Ruski Skoe','St. Petersburg',NULL,'190003','Russia'),(7,'1 Rockerfeller Avenue','New York','NY','787383','United States of America'),(8,'9 Harbour Road','Toronto','ON','N9I 4Y9','Canada'),(9,'67 Feilitzschstrasse','Munich',NULL,'81009','Germany'),(10,'38 Bulevardul Carol 1','Bucharest',NULL,'020922','Romania'),(11,'156 Salzburger Strasse','Salzburg',NULL,'3456','Austria'),(12,'900 Landstreet Lane','Manchester',NULL,'N98T 5RG','Great Britain'),(13,'3 Lada Lada Route','Leon',NULL,'89898','France'),(14,'67 Jamies Strada','Madrid',NULL,'34356','Spain'),(15,'500 Why-Me-Skoe','Moscow',NULL,'230345','Russia'),(16,'34 Chicago Lane','Chicago','IL','23233','United States of America'),(17,'344 Wellington Avenue','London','ON','N9U 3R5','Canada'),(18,'2 Piata Cluj','Sibiu',NULL,'550130','Romania');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlineportals`
--

DROP TABLE IF EXISTS `onlineportals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlineportals` (
  `Online_portals_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Legal_name` text,
  `OEM_ID` int(11) DEFAULT NULL,
  `Website_address` text,
  PRIMARY KEY (`Online_portals_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineportals`
--

LOCK TABLES `onlineportals` WRITE;
/*!40000 ALTER TABLE `onlineportals` DISABLE KEYS */;
INSERT INTO `onlineportals` VALUES (1,'Bookings Management N.V.',1,'www.bookings.com'),(2,'Skyscanner Ltd',2,'www.skyscanner.net'),(3,'Travelpedia N.V. ',3,'www.travelpedia.com, www.travelpedia.nl, www.travelpedia.fr, www.travelpedia.ro'),(4,'KAYAK Europe GmbH',4,'www.kayak.de');
/*!40000 ALTER TABLE `onlineportals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup`
--

DROP TABLE IF EXISTS `pickup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pickup` (
  `Pickup_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Locations_ID` int(11) DEFAULT NULL,
  `fk_Employee_active_ID` int(11) DEFAULT NULL,
  `Date_pickup` datetime DEFAULT NULL,
  PRIMARY KEY (`Pickup_ID`),
  KEY `pickup_ibfk_1` (`fk_Locations_ID`),
  KEY `pickup_ibfk_2` (`fk_Employee_active_ID`),
  CONSTRAINT `pickup_ibfk_1` FOREIGN KEY (`fk_Locations_ID`) REFERENCES `locations` (`Locations_ID`) ON UPDATE CASCADE,
  CONSTRAINT `pickup_ibfk_2` FOREIGN KEY (`fk_Employee_active_ID`) REFERENCES `employeeactive` (`Employee_active_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup`
--

LOCK TABLES `pickup` WRITE;
/*!40000 ALTER TABLE `pickup` DISABLE KEYS */;
INSERT INTO `pickup` VALUES (1,11,1,'2019-02-12 07:00:00'),(2,2,3,'2019-01-08 16:00:00'),(3,16,4,'2019-05-15 08:00:00'),(4,18,2,'2018-11-13 11:15:00'),(5,9,1,'2019-01-15 13:00:00'),(6,6,1,'2019-03-01 12:00:00'),(7,8,3,'2019-06-20 10:00:00');
/*!40000 ALTER TABLE `pickup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentaladdons`
--

DROP TABLE IF EXISTS `rentaladdons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentaladdons` (
  `Rental_addons_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Price_perday` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rental_addons_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentaladdons`
--

LOCK TABLES `rentaladdons` WRITE;
/*!40000 ALTER TABLE `rentaladdons` DISABLE KEYS */;
INSERT INTO `rentaladdons` VALUES (1,'Additional Driver','Driver',4),(2,'GPS Navigation','Navigation',4),(3,'Winter Tires/Snow Chains','Winter Gear',5),(4,'Safety Vest','Safety',2),(5,'Baby Seats','Safety',4);
/*!40000 ALTER TABLE `rentaladdons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalcars`
--

DROP TABLE IF EXISTS `rentalcars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentalcars` (
  `Rental_car_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Brand` varchar(255) DEFAULT NULL,
  `Model_num` varchar(255) DEFAULT NULL,
  `Production_year` date DEFAULT NULL,
  `Colour` varchar(60) DEFAULT NULL,
  `KM_stand` int(11) DEFAULT NULL,
  `Last_serv_date` datetime DEFAULT NULL,
  `fk_Class_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rental_car_ID`),
  KEY `rentalcars_ibfk_1` (`fk_Class_ID`),
  CONSTRAINT `rentalcars_ibfk_1` FOREIGN KEY (`fk_Class_ID`) REFERENCES `carclassprice` (`Class_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalcars`
--

LOCK TABLES `rentalcars` WRITE;
/*!40000 ALTER TABLE `rentalcars` DISABLE KEYS */;
INSERT INTO `rentalcars` VALUES (1,'Skoda','Citigo','2019-01-01','Yellow',10000,'2019-03-08 00:00:00',1),(2,'VW','Polo','2018-07-09','Blue',20000,'2019-01-31 00:00:00',2),(3,'Opel','Astra','2017-11-08','Red',30000,'2019-02-26 00:00:00',3),(4,'Opel','Astra ST','2019-01-01','Purple',2000,'2019-01-01 00:00:00',4),(5,'Skoda','Octavia','2018-11-12','Black',10000,'2018-11-12 00:00:00',5),(6,'Mercedes Benz','B180','2018-01-01','Grey',20000,'2019-01-01 00:00:00',6),(7,'Volkswagon','Passat','2018-08-01','Black',14000,'2019-02-28 00:00:00',7),(8,'Volkswagon','Passat ST','2018-01-17','White',15000,'2018-12-14 08:00:00',8),(9,'BMW','330i','2018-09-01','Red',10000,'2019-01-04 16:30:00',9),(10,'BMW','X5','2018-03-16','Grey',15550,'2019-02-27 05:30:00',10),(11,'Landrover','Discovery','2019-02-28','Army Green',3000,'2019-02-28 00:00:00',11),(12,'Porsche','911','2018-07-11','Yellow',5000,'2019-03-28 11:29:00',12);
/*!40000 ALTER TABLE `rentalcars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalcolegalname`
--

DROP TABLE IF EXISTS `rentalcolegalname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentalcolegalname` (
  `Legal_entity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Legal_name` varchar(255) DEFAULT NULL,
  `fk_Locations_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Legal_entity_ID`),
  KEY `rentalcolegalname_ibfk_1` (`fk_Locations_ID`),
  CONSTRAINT `rentalcolegalname_ibfk_1` FOREIGN KEY (`fk_Locations_ID`) REFERENCES `locations` (`Locations_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalcolegalname`
--

LOCK TABLES `rentalcolegalname` WRITE;
/*!40000 ALTER TABLE `rentalcolegalname` DISABLE KEYS */;
INSERT INTO `rentalcolegalname` VALUES (1,'ST Auto Mietung GmbH',1),(2,'ST Car Rental IK Ltd',2),(3,'ST Autoloyer Sarl',3),(4,'ST Auto Mietung Deutschland GmbH',4),(5,'ST AutoAlquiler S.L.',5),(6,'ST prokat avtomobiley OOO',6),(7,'ST Car Rental USA Ltd',7),(8,'ST Car Rental Canada Ltd',8),(9,'ST închirieri maşini SRL',10);
/*!40000 ALTER TABLE `rentalcolegalname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalcoportals`
--

DROP TABLE IF EXISTS `rentalcoportals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentalcoportals` (
  `Rental_co_portals_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Website_address` text,
  `fk_Legal_entity_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rental_co_portals_ID`),
  KEY `rentalcoportals_ibfk_1` (`fk_Legal_entity_ID`),
  CONSTRAINT `rentalcoportals_ibfk_1` FOREIGN KEY (`fk_Legal_entity_ID`) REFERENCES `rentalcolegalname` (`Legal_entity_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalcoportals`
--

LOCK TABLES `rentalcoportals` WRITE;
/*!40000 ALTER TABLE `rentalcoportals` DISABLE KEYS */;
INSERT INTO `rentalcoportals` VALUES (1,'www.stautomietung.at',1),(2,'www.stcarrental.co.uk',2),(3,'www.stautoloyer.fr',3),(4,'www.stautomietung.de',4),(5,'www.stautoalquiler.es',5),(6,'www.stprokatavtomobiley.ru',6),(7,'www.stcarrental.com',7),(8,'www.stcarrental.ca',8),(9,'www.stinchirierimasini.ro',9);
/*!40000 ALTER TABLE `rentalcoportals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalinsurance`
--

DROP TABLE IF EXISTS `rentalinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentalinsurance` (
  `Rental_insurance_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Price_perday` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rental_insurance_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalinsurance`
--

LOCK TABLES `rentalinsurance` WRITE;
/*!40000 ALTER TABLE `rentalinsurance` DISABLE KEYS */;
INSERT INTO `rentalinsurance` VALUES (1,'Damage Waiver (DW) ','Waiver',8),(2,'Personal Accident Insurance (PAI)','Accident',5),(3,'Personal Effects Coverage (PEC)','Theft',3),(4,'Supplemental Liability Protection (SLP)','Liability',10),(5,'Roadside Assistance Protection (RAP)','Accident',2);
/*!40000 ALTER TABLE `rentalinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalreservation`
--

DROP TABLE IF EXISTS `rentalreservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentalreservation` (
  `Rental_reservation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Customer_ID` int(11) DEFAULT NULL,
  `fk_Rental_source_ID` int(11) DEFAULT NULL,
  `fk_Legal_entity_ID` int(11) DEFAULT NULL,
  `fk_Pickup_ID` int(11) DEFAULT NULL,
  `fk_Dropoff_ID` int(11) DEFAULT NULL,
  `fk_Rental_addons_ID` int(11) DEFAULT NULL,
  `fk_Rental_insurance_ID` int(11) DEFAULT NULL,
  `fk_Rental_Car_ID` int(11) DEFAULT NULL,
  `Return_actual_KM_stand` int(11) DEFAULT NULL,
  `Return_actual_date` datetime DEFAULT NULL,
  `fk_return_extracharge_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rental_reservation_ID`),
  KEY `rentalreservation_ibfk_1` (`fk_Customer_ID`),
  KEY `rentalreservation_ibfk_2` (`fk_Rental_source_ID`),
  KEY `rentalreservation_ibfk_3` (`fk_Legal_entity_ID`),
  KEY `rentalreservation_ibfk_4` (`fk_Pickup_ID`),
  KEY `rentalreservation_ibfk_5` (`fk_Dropoff_ID`),
  KEY `rentalreservation_ibfk_6` (`fk_Rental_addons_ID`),
  KEY `rentalreservation_ibfk_7` (`fk_Rental_insurance_ID`),
  KEY `rentalreservation_ibfk_8` (`fk_Rental_Car_ID`),
  KEY `rentalreservation_ibfk_9` (`fk_return_extracharge_ID`),
  CONSTRAINT `rentalreservation_ibfk_1` FOREIGN KEY (`fk_Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_2` FOREIGN KEY (`fk_Rental_source_ID`) REFERENCES `rentalsource` (`Rental_source_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_3` FOREIGN KEY (`fk_Legal_entity_ID`) REFERENCES `rentalcolegalname` (`Legal_entity_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_4` FOREIGN KEY (`fk_Pickup_ID`) REFERENCES `pickup` (`Pickup_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_5` FOREIGN KEY (`fk_Dropoff_ID`) REFERENCES `dropoff` (`Dropoff_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_6` FOREIGN KEY (`fk_Rental_addons_ID`) REFERENCES `rentaladdons` (`Rental_addons_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_7` FOREIGN KEY (`fk_Rental_insurance_ID`) REFERENCES `rentalinsurance` (`Rental_insurance_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_8` FOREIGN KEY (`fk_Rental_Car_ID`) REFERENCES `rentalcars` (`Rental_car_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalreservation_ibfk_9` FOREIGN KEY (`fk_return_extracharge_ID`) REFERENCES `returnextracharge` (`Return_extracharge_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalreservation`
--

LOCK TABLES `rentalreservation` WRITE;
/*!40000 ALTER TABLE `rentalreservation` DISABLE KEYS */;
INSERT INTO `rentalreservation` VALUES (1,1,1,1,1,1,3,1,3,31000,'2019-02-27 09:00:00',1),(2,4,6,2,2,2,1,5,12,5100,'2019-01-31 10:00:00',3),(3,3,4,7,3,3,NULL,4,5,NULL,NULL,NULL),(6,3,5,9,4,4,5,3,9,12000,'2018-11-18 18:00:00',3),(7,2,6,4,5,5,NULL,NULL,7,14100,'2019-01-22 12:00:00',NULL),(8,1,4,6,6,6,1,2,3,30100,'2019-03-04 08:00:00',NULL),(9,5,3,8,7,7,3,1,11,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rentalreservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentalsource`
--

DROP TABLE IF EXISTS `rentalsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rentalsource` (
  `Rental_source_ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_Online_portals_ID` int(11) DEFAULT NULL,
  `fk_Rental_co_portals_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Rental_source_ID`),
  KEY `rentalsource_ibfk_1` (`fk_Online_portals_ID`),
  KEY `rentalsource_ibfk_2` (`fk_Rental_co_portals_ID`),
  CONSTRAINT `rentalsource_ibfk_1` FOREIGN KEY (`fk_Online_portals_ID`) REFERENCES `onlineportals` (`Online_portals_ID`) ON UPDATE CASCADE,
  CONSTRAINT `rentalsource_ibfk_2` FOREIGN KEY (`fk_Rental_co_portals_ID`) REFERENCES `rentalcoportals` (`Rental_co_portals_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentalsource`
--

LOCK TABLES `rentalsource` WRITE;
/*!40000 ALTER TABLE `rentalsource` DISABLE KEYS */;
INSERT INTO `rentalsource` VALUES (1,1,NULL),(2,4,NULL),(3,NULL,8),(4,2,NULL),(5,NULL,9),(6,NULL,2);
/*!40000 ALTER TABLE `rentalsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnextracharge`
--

DROP TABLE IF EXISTS `returnextracharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnextracharge` (
  `Return_extracharge_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`Return_extracharge_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnextracharge`
--

LOCK TABLES `returnextracharge` WRITE;
/*!40000 ALTER TABLE `returnextracharge` DISABLE KEYS */;
INSERT INTO `returnextracharge` VALUES (1,'Tank Refill','Petrol Usage',40),(2,'Car Damage','Damage',300),(3,'Alternative Location Return','Location Status',50);
/*!40000 ALTER TABLE `returnextracharge` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-09 14:41:19
