-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2019 at 01:23 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_jamie_slaats_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `carclassprice`
--

CREATE TABLE `carclassprice` (
  `Class_ID` int(11) NOT NULL,
  `Class_name` varchar(255) DEFAULT NULL,
  `Car_price_perday` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carclassprice`
--

INSERT INTO `carclassprice` (`Class_ID`, `Class_name`, `Car_price_perday`) VALUES
(1, 'Mini', 10),
(2, 'Economy', 18),
(3, 'Compact', 20),
(4, 'Compact Wagon', 25),
(5, 'Intermediate Wagon', 28),
(6, 'Intermediate', 30),
(7, 'Standard', 32),
(8, 'Standard Wagon', 37),
(9, 'Full Size', 32),
(10, 'Premium', 37),
(11, 'Luxury', 46),
(12, 'Convertible', 55);

-- --------------------------------------------------------

--
-- Table structure for table `custcreditcard`
--

CREATE TABLE `custcreditcard` (
  `Custcreditcard_ID` int(11) NOT NULL,
  `Card_num` varchar(16) DEFAULT NULL,
  `Expire_date` date DEFAULT NULL,
  `CCC_num` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custcreditcard`
--

INSERT INTO `custcreditcard` (`Custcreditcard_ID`, `Card_num`, `Expire_date`, `CCC_num`) VALUES
(1, '1111222233334444', '2019-09-18', '434'),
(2, '2222222222222222', '2020-03-18', '565'),
(3, '3333333333333333', '2021-06-09', '111'),
(4, '9898767654543232', '2023-01-01', '999'),
(5, '1234098765435678', '2020-05-10', '343');

-- --------------------------------------------------------

--
-- Table structure for table `custcreditnum`
--

CREATE TABLE `custcreditnum` (
  `Custcreditnum_ID` int(11) NOT NULL,
  `fk_Customer_ID` int(11) DEFAULT NULL,
  `fk_Custcreditcard_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custcreditnum`
--

INSERT INTO `custcreditnum` (`Custcreditnum_ID`, `fk_Customer_ID`, `fk_Custcreditcard_ID`) VALUES
(1, 4, 1),
(2, 3, 3),
(3, 2, 5),
(4, 1, 2),
(5, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `First_name` varchar(255) DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Street_address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Post_code` varchar(50) DEFAULT NULL,
  `Country` varchar(60) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Drivers_lic_num` varchar(12) DEFAULT NULL,
  `Backup_driver` varchar(100) DEFAULT NULL,
  `fk_Custcreditnum_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `First_name`, `Last_name`, `Street_address`, `City`, `Post_code`, `Country`, `Date_of_birth`, `Drivers_lic_num`, `Backup_driver`, `fk_Custcreditnum_ID`) VALUES
(1, 'John', 'Doe', '43 Strasse Strasse', 'Lutz', '3404', 'Austria', '1977-11-01', 'B578939X55', NULL, 1),
(2, 'Jane', 'Seymour', '23 Route de la France', 'Paris', '232345', 'France', '1955-05-05', 'A45454X888', 'Fanze Firdinand', 2),
(3, 'George', 'Stopolopolous', '2 Crazy Avenue', 'Cluj', '98282', 'Romania', '1990-10-10', 'C45454T9F', NULL, 5),
(4, 'Gavin', 'Marshall', '23 Wilmington Lane', 'Oxford', 'U89T 3RT', 'Great Britian', '1975-05-02', '04545445454', 'Cyan Marshall', 4),
(5, 'Ricardo', 'Taveres', '233 London Street', 'London', 'ON', 'Canada', '1977-11-30', 'RT48049F3333', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dropoff`
--

CREATE TABLE `dropoff` (
  `Dropoff_ID` int(11) NOT NULL,
  `fk_Locations_ID` int(11) DEFAULT NULL,
  `fk_Employee_active_ID` int(11) DEFAULT NULL,
  `Date_dropoff` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dropoff`
--

INSERT INTO `dropoff` (`Dropoff_ID`, `fk_Locations_ID`, `fk_Employee_active_ID`, `Date_dropoff`) VALUES
(1, 11, 3, '2019-02-27 14:00:00'),
(2, 12, 1, '2019-01-31 10:00:00'),
(3, 16, 4, '2019-05-22 09:00:00'),
(4, 10, 2, '2018-11-18 18:00:00'),
(5, 9, 1, '2019-01-22 12:00:00'),
(6, 6, 1, '2019-03-04 08:00:00'),
(7, 17, 1, '2019-06-25 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employeeactive`
--

CREATE TABLE `employeeactive` (
  `Employee_active_ID` int(11) NOT NULL,
  `First_name` varchar(255) DEFAULT NULL,
  `Last_name` varchar(255) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Shift_start` datetime DEFAULT NULL,
  `Shift_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeeactive`
--

INSERT INTO `employeeactive` (`Employee_active_ID`, `First_name`, `Last_name`, `Employee_ID`, `Shift_start`, `Shift_end`) VALUES
(1, 'Johnny', 'Cash', 123456789, '2019-01-01 07:00:00', '2019-12-31 23:00:00'),
(2, 'Georgina', 'Francesco', 987654321, '2018-12-25 15:00:00', '2019-06-26 18:00:00'),
(3, 'Oscar', 'Delawild', 837883763, '2019-03-01 11:00:00', '2019-11-27 12:00:00'),
(4, 'Olli', 'Jaymalla', 3843434, '2019-01-30 10:00:00', '2019-07-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `Locations_ID` int(11) NOT NULL,
  `Street_address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Province_State` varchar(255) DEFAULT NULL,
  `Post_code` varchar(50) DEFAULT NULL,
  `Country` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`Locations_ID`, `Street_address`, `City`, `Province_State`, `Post_code`, `Country`) VALUES
(1, '32 Leopold Avenue', 'Vienna', NULL, '1030', 'Austria'),
(2, '45 Harbour Road', 'London', NULL, 'Y789 L56', 'Great Britain'),
(3, '45 Route de Main', 'Paris', NULL, '878780', 'France'),
(4, '45 Friedriech Strasse', 'Berlin', NULL, '89280', 'Germany'),
(5, '29 Roto Tondo', 'Barcelona', NULL, 'H3 54040', 'Spain'),
(6, '98 Ruski Skoe', 'St. Petersburg', NULL, '190003', 'Russia'),
(7, '1 Rockerfeller Avenue', 'New York', 'NY', '787383', 'United States of America'),
(8, '9 Harbour Road', 'Toronto', 'ON', 'N9I 4Y9', 'Canada'),
(9, '67 Feilitzschstrasse', 'Munich', NULL, '81009', 'Germany'),
(10, '38 Bulevardul Carol 1', 'Bucharest', NULL, '020922', 'Romania'),
(11, '156 Salzburger Strasse', 'Salzburg', NULL, '3456', 'Austria'),
(12, '900 Landstreet Lane', 'Manchester', NULL, 'N98T 5RG', 'Great Britain'),
(13, '3 Lada Lada Route', 'Leon', NULL, '89898', 'France'),
(14, '67 Jamies Strada', 'Madrid', NULL, '34356', 'Spain'),
(15, '500 Why-Me-Skoe', 'Moscow', NULL, '230345', 'Russia'),
(16, '34 Chicago Lane', 'Chicago', 'IL', '23233', 'United States of America'),
(17, '344 Wellington Avenue', 'London', 'ON', 'N9U 3R5', 'Canada'),
(18, '2 Piata Cluj', 'Sibiu', NULL, '550130', 'Romania');

-- --------------------------------------------------------

--
-- Table structure for table `onlineportals`
--

CREATE TABLE `onlineportals` (
  `Online_portals_ID` int(11) NOT NULL,
  `Legal_name` text,
  `OEM_ID` int(11) DEFAULT NULL,
  `Website_address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `onlineportals`
--

INSERT INTO `onlineportals` (`Online_portals_ID`, `Legal_name`, `OEM_ID`, `Website_address`) VALUES
(1, 'Bookings Management N.V.', 1, 'www.bookings.com'),
(2, 'Skyscanner Ltd', 2, 'www.skyscanner.net'),
(3, 'Travelpedia N.V. ', 3, 'www.travelpedia.com, www.travelpedia.nl, www.travelpedia.fr, www.travelpedia.ro'),
(4, 'KAYAK Europe GmbH', 4, 'www.kayak.de');

-- --------------------------------------------------------

--
-- Table structure for table `pickup`
--

CREATE TABLE `pickup` (
  `Pickup_ID` int(11) NOT NULL,
  `fk_Locations_ID` int(11) DEFAULT NULL,
  `fk_Employee_active_ID` int(11) DEFAULT NULL,
  `Date_pickup` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pickup`
--

INSERT INTO `pickup` (`Pickup_ID`, `fk_Locations_ID`, `fk_Employee_active_ID`, `Date_pickup`) VALUES
(1, 11, 1, '2019-02-12 07:00:00'),
(2, 2, 3, '2019-01-08 16:00:00'),
(3, 16, 4, '2019-05-15 08:00:00'),
(4, 18, 2, '2018-11-13 11:15:00'),
(5, 9, 1, '2019-01-15 13:00:00'),
(6, 6, 1, '2019-03-01 12:00:00'),
(7, 8, 3, '2019-06-20 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rentaladdons`
--

CREATE TABLE `rentaladdons` (
  `Rental_addons_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Price_perday` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentaladdons`
--

INSERT INTO `rentaladdons` (`Rental_addons_ID`, `Name`, `Type`, `Price_perday`) VALUES
(1, 'Additional Driver', 'Driver', 4),
(2, 'GPS Navigation', 'Navigation', 4),
(3, 'Winter Tires/Snow Chains', 'Winter Gear', 5),
(4, 'Safety Vest', 'Safety', 2),
(5, 'Baby Seats', 'Safety', 4);

-- --------------------------------------------------------

--
-- Table structure for table `rentalcars`
--

CREATE TABLE `rentalcars` (
  `Rental_car_ID` int(11) NOT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `Model_num` varchar(255) DEFAULT NULL,
  `Production_year` date DEFAULT NULL,
  `Colour` varchar(60) DEFAULT NULL,
  `KM_stand` int(11) DEFAULT NULL,
  `Last_serv_date` datetime DEFAULT NULL,
  `fk_Class_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentalcars`
--

INSERT INTO `rentalcars` (`Rental_car_ID`, `Brand`, `Model_num`, `Production_year`, `Colour`, `KM_stand`, `Last_serv_date`, `fk_Class_ID`) VALUES
(1, 'Skoda', 'Citigo', '2019-01-01', 'Yellow', 10000, '2019-03-08 00:00:00', 1),
(2, 'VW', 'Polo', '2018-07-09', 'Blue', 20000, '2019-01-31 00:00:00', 2),
(3, 'Opel', 'Astra', '2017-11-08', 'Red', 30000, '2019-02-26 00:00:00', 3),
(4, 'Opel', 'Astra ST', '2019-01-01', 'Purple', 2000, '2019-01-01 00:00:00', 4),
(5, 'Skoda', 'Octavia', '2018-11-12', 'Black', 10000, '2018-11-12 00:00:00', 5),
(6, 'Mercedes Benz', 'B180', '2018-01-01', 'Grey', 20000, '2019-01-01 00:00:00', 6),
(7, 'Volkswagon', 'Passat', '2018-08-01', 'Black', 14000, '2019-02-28 00:00:00', 7),
(8, 'Volkswagon', 'Passat ST', '2018-01-17', 'White', 15000, '2018-12-14 08:00:00', 8),
(9, 'BMW', '330i', '2018-09-01', 'Red', 10000, '2019-01-04 16:30:00', 9),
(10, 'BMW', 'X5', '2018-03-16', 'Grey', 15550, '2019-02-27 05:30:00', 10),
(11, 'Landrover', 'Discovery', '2019-02-28', 'Army Green', 3000, '2019-02-28 00:00:00', 11),
(12, 'Porsche', '911', '2018-07-11', 'Yellow', 5000, '2019-03-28 11:29:00', 12);

-- --------------------------------------------------------

--
-- Table structure for table `rentalcolegalname`
--

CREATE TABLE `rentalcolegalname` (
  `Legal_entity_ID` int(11) NOT NULL,
  `Legal_name` varchar(255) DEFAULT NULL,
  `fk_Locations_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentalcolegalname`
--

INSERT INTO `rentalcolegalname` (`Legal_entity_ID`, `Legal_name`, `fk_Locations_ID`) VALUES
(1, 'ST Auto Mietung GmbH', 1),
(2, 'ST Car Rental IK Ltd', 2),
(3, 'ST Autoloyer Sarl', 3),
(4, 'ST Auto Mietung Deutschland GmbH', 4),
(5, 'ST AutoAlquiler S.L.', 5),
(6, 'ST prokat avtomobiley OOO', 6),
(7, 'ST Car Rental USA Ltd', 7),
(8, 'ST Car Rental Canada Ltd', 8),
(9, 'ST închirieri maşini SRL', 10);

-- --------------------------------------------------------

--
-- Table structure for table `rentalcoportals`
--

CREATE TABLE `rentalcoportals` (
  `Rental_co_portals_ID` int(11) NOT NULL,
  `Website_address` text,
  `fk_Legal_entity_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentalcoportals`
--

INSERT INTO `rentalcoportals` (`Rental_co_portals_ID`, `Website_address`, `fk_Legal_entity_ID`) VALUES
(1, 'www.stautomietung.at', 1),
(2, 'www.stcarrental.co.uk', 2),
(3, 'www.stautoloyer.fr', 3),
(4, 'www.stautomietung.de', 4),
(5, 'www.stautoalquiler.es', 5),
(6, 'www.stprokatavtomobiley.ru', 6),
(7, 'www.stcarrental.com', 7),
(8, 'www.stcarrental.ca', 8),
(9, 'www.stinchirierimasini.ro', 9);

-- --------------------------------------------------------

--
-- Table structure for table `rentalinsurance`
--

CREATE TABLE `rentalinsurance` (
  `Rental_insurance_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Price_perday` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentalinsurance`
--

INSERT INTO `rentalinsurance` (`Rental_insurance_ID`, `Name`, `Type`, `Price_perday`) VALUES
(1, 'Damage Waiver (DW) ', 'Waiver', 8),
(2, 'Personal Accident Insurance (PAI)', 'Accident', 5),
(3, 'Personal Effects Coverage (PEC)', 'Theft', 3),
(4, 'Supplemental Liability Protection (SLP)', 'Liability', 10),
(5, 'Roadside Assistance Protection (RAP)', 'Accident', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rentalreservation`
--

CREATE TABLE `rentalreservation` (
  `Rental_reservation_ID` int(11) NOT NULL,
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
  `fk_return_extracharge_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentalreservation`
--

INSERT INTO `rentalreservation` (`Rental_reservation_ID`, `fk_Customer_ID`, `fk_Rental_source_ID`, `fk_Legal_entity_ID`, `fk_Pickup_ID`, `fk_Dropoff_ID`, `fk_Rental_addons_ID`, `fk_Rental_insurance_ID`, `fk_Rental_Car_ID`, `Return_actual_KM_stand`, `Return_actual_date`, `fk_return_extracharge_ID`) VALUES
(1, 1, 1, 1, 1, 1, 3, 1, 3, 31000, '2019-02-27 09:00:00', 1),
(2, 4, 6, 2, 2, 2, 1, 5, 12, 5100, '2019-01-31 10:00:00', 3),
(3, 3, 4, 7, 3, 3, NULL, 4, 5, NULL, NULL, NULL),
(6, 3, 5, 9, 4, 4, 5, 3, 9, 12000, '2018-11-18 18:00:00', 3),
(7, 2, 6, 4, 5, 5, NULL, NULL, 7, 14100, '2019-01-22 12:00:00', NULL),
(8, 1, 4, 6, 6, 6, 1, 2, 3, 30100, '2019-03-04 08:00:00', NULL),
(9, 5, 3, 8, 7, 7, 3, 1, 11, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rentalsource`
--

CREATE TABLE `rentalsource` (
  `Rental_source_ID` int(11) NOT NULL,
  `fk_Online_portals_ID` int(11) DEFAULT NULL,
  `fk_Rental_co_portals_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentalsource`
--

INSERT INTO `rentalsource` (`Rental_source_ID`, `fk_Online_portals_ID`, `fk_Rental_co_portals_ID`) VALUES
(1, 1, NULL),
(2, 4, NULL),
(3, NULL, 8),
(4, 2, NULL),
(5, NULL, 9),
(6, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `returnextracharge`
--

CREATE TABLE `returnextracharge` (
  `Return_extracharge_ID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `returnextracharge`
--

INSERT INTO `returnextracharge` (`Return_extracharge_ID`, `Name`, `Type`, `Price`) VALUES
(1, 'Tank Refill', 'Petrol Usage', 40),
(2, 'Car Damage', 'Damage', 300),
(3, 'Alternative Location Return', 'Location Status', 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carclassprice`
--
ALTER TABLE `carclassprice`
  ADD PRIMARY KEY (`Class_ID`);

--
-- Indexes for table `custcreditcard`
--
ALTER TABLE `custcreditcard`
  ADD PRIMARY KEY (`Custcreditcard_ID`);

--
-- Indexes for table `custcreditnum`
--
ALTER TABLE `custcreditnum`
  ADD PRIMARY KEY (`Custcreditnum_ID`),
  ADD KEY `custcreditnum_ibfk_1` (`fk_Customer_ID`),
  ADD KEY `custcreditnum_ibfk_2` (`fk_Custcreditcard_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `customer_ibfk_1` (`fk_Custcreditnum_ID`);

--
-- Indexes for table `dropoff`
--
ALTER TABLE `dropoff`
  ADD PRIMARY KEY (`Dropoff_ID`),
  ADD KEY `dropoff_ibfk_1` (`fk_Locations_ID`),
  ADD KEY `dropoff_ibfk_2` (`fk_Employee_active_ID`);

--
-- Indexes for table `employeeactive`
--
ALTER TABLE `employeeactive`
  ADD PRIMARY KEY (`Employee_active_ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`Locations_ID`);

--
-- Indexes for table `onlineportals`
--
ALTER TABLE `onlineportals`
  ADD PRIMARY KEY (`Online_portals_ID`);

--
-- Indexes for table `pickup`
--
ALTER TABLE `pickup`
  ADD PRIMARY KEY (`Pickup_ID`),
  ADD KEY `pickup_ibfk_1` (`fk_Locations_ID`),
  ADD KEY `pickup_ibfk_2` (`fk_Employee_active_ID`);

--
-- Indexes for table `rentaladdons`
--
ALTER TABLE `rentaladdons`
  ADD PRIMARY KEY (`Rental_addons_ID`);

--
-- Indexes for table `rentalcars`
--
ALTER TABLE `rentalcars`
  ADD PRIMARY KEY (`Rental_car_ID`),
  ADD KEY `rentalcars_ibfk_1` (`fk_Class_ID`);

--
-- Indexes for table `rentalcolegalname`
--
ALTER TABLE `rentalcolegalname`
  ADD PRIMARY KEY (`Legal_entity_ID`),
  ADD KEY `rentalcolegalname_ibfk_1` (`fk_Locations_ID`);

--
-- Indexes for table `rentalcoportals`
--
ALTER TABLE `rentalcoportals`
  ADD PRIMARY KEY (`Rental_co_portals_ID`),
  ADD KEY `rentalcoportals_ibfk_1` (`fk_Legal_entity_ID`);

--
-- Indexes for table `rentalinsurance`
--
ALTER TABLE `rentalinsurance`
  ADD PRIMARY KEY (`Rental_insurance_ID`);

--
-- Indexes for table `rentalreservation`
--
ALTER TABLE `rentalreservation`
  ADD PRIMARY KEY (`Rental_reservation_ID`),
  ADD KEY `rentalreservation_ibfk_1` (`fk_Customer_ID`),
  ADD KEY `rentalreservation_ibfk_2` (`fk_Rental_source_ID`),
  ADD KEY `rentalreservation_ibfk_3` (`fk_Legal_entity_ID`),
  ADD KEY `rentalreservation_ibfk_4` (`fk_Pickup_ID`),
  ADD KEY `rentalreservation_ibfk_5` (`fk_Dropoff_ID`),
  ADD KEY `rentalreservation_ibfk_6` (`fk_Rental_addons_ID`),
  ADD KEY `rentalreservation_ibfk_7` (`fk_Rental_insurance_ID`),
  ADD KEY `rentalreservation_ibfk_8` (`fk_Rental_Car_ID`),
  ADD KEY `rentalreservation_ibfk_9` (`fk_return_extracharge_ID`);

--
-- Indexes for table `rentalsource`
--
ALTER TABLE `rentalsource`
  ADD PRIMARY KEY (`Rental_source_ID`),
  ADD KEY `rentalsource_ibfk_1` (`fk_Online_portals_ID`),
  ADD KEY `rentalsource_ibfk_2` (`fk_Rental_co_portals_ID`);

--
-- Indexes for table `returnextracharge`
--
ALTER TABLE `returnextracharge`
  ADD PRIMARY KEY (`Return_extracharge_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carclassprice`
--
ALTER TABLE `carclassprice`
  MODIFY `Class_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `custcreditcard`
--
ALTER TABLE `custcreditcard`
  MODIFY `Custcreditcard_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custcreditnum`
--
ALTER TABLE `custcreditnum`
  MODIFY `Custcreditnum_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dropoff`
--
ALTER TABLE `dropoff`
  MODIFY `Dropoff_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employeeactive`
--
ALTER TABLE `employeeactive`
  MODIFY `Employee_active_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `Locations_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `onlineportals`
--
ALTER TABLE `onlineportals`
  MODIFY `Online_portals_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pickup`
--
ALTER TABLE `pickup`
  MODIFY `Pickup_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rentaladdons`
--
ALTER TABLE `rentaladdons`
  MODIFY `Rental_addons_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rentalcars`
--
ALTER TABLE `rentalcars`
  MODIFY `Rental_car_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rentalcolegalname`
--
ALTER TABLE `rentalcolegalname`
  MODIFY `Legal_entity_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rentalcoportals`
--
ALTER TABLE `rentalcoportals`
  MODIFY `Rental_co_portals_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rentalinsurance`
--
ALTER TABLE `rentalinsurance`
  MODIFY `Rental_insurance_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rentalreservation`
--
ALTER TABLE `rentalreservation`
  MODIFY `Rental_reservation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rentalsource`
--
ALTER TABLE `rentalsource`
  MODIFY `Rental_source_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `returnextracharge`
--
ALTER TABLE `returnextracharge`
  MODIFY `Return_extracharge_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custcreditnum`
--
ALTER TABLE `custcreditnum`
  ADD CONSTRAINT `custcreditnum_ibfk_1` FOREIGN KEY (`fk_Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `custcreditnum_ibfk_2` FOREIGN KEY (`fk_Custcreditcard_ID`) REFERENCES `custcreditcard` (`Custcreditcard_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_Custcreditnum_ID`) REFERENCES `custcreditnum` (`Custcreditnum_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `dropoff`
--
ALTER TABLE `dropoff`
  ADD CONSTRAINT `dropoff_ibfk_1` FOREIGN KEY (`fk_Locations_ID`) REFERENCES `locations` (`Locations_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dropoff_ibfk_2` FOREIGN KEY (`fk_Employee_active_ID`) REFERENCES `employeeactive` (`Employee_active_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `pickup`
--
ALTER TABLE `pickup`
  ADD CONSTRAINT `pickup_ibfk_1` FOREIGN KEY (`fk_Locations_ID`) REFERENCES `locations` (`Locations_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pickup_ibfk_2` FOREIGN KEY (`fk_Employee_active_ID`) REFERENCES `employeeactive` (`Employee_active_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `rentalcars`
--
ALTER TABLE `rentalcars`
  ADD CONSTRAINT `rentalcars_ibfk_1` FOREIGN KEY (`fk_Class_ID`) REFERENCES `carclassprice` (`Class_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `rentalcolegalname`
--
ALTER TABLE `rentalcolegalname`
  ADD CONSTRAINT `rentalcolegalname_ibfk_1` FOREIGN KEY (`fk_Locations_ID`) REFERENCES `locations` (`Locations_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `rentalcoportals`
--
ALTER TABLE `rentalcoportals`
  ADD CONSTRAINT `rentalcoportals_ibfk_1` FOREIGN KEY (`fk_Legal_entity_ID`) REFERENCES `rentalcolegalname` (`Legal_entity_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `rentalreservation`
--
ALTER TABLE `rentalreservation`
  ADD CONSTRAINT `rentalreservation_ibfk_1` FOREIGN KEY (`fk_Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_2` FOREIGN KEY (`fk_Rental_source_ID`) REFERENCES `rentalsource` (`Rental_source_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_3` FOREIGN KEY (`fk_Legal_entity_ID`) REFERENCES `rentalcolegalname` (`Legal_entity_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_4` FOREIGN KEY (`fk_Pickup_ID`) REFERENCES `pickup` (`Pickup_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_5` FOREIGN KEY (`fk_Dropoff_ID`) REFERENCES `dropoff` (`Dropoff_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_6` FOREIGN KEY (`fk_Rental_addons_ID`) REFERENCES `rentaladdons` (`Rental_addons_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_7` FOREIGN KEY (`fk_Rental_insurance_ID`) REFERENCES `rentalinsurance` (`Rental_insurance_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_8` FOREIGN KEY (`fk_Rental_Car_ID`) REFERENCES `rentalcars` (`Rental_car_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalreservation_ibfk_9` FOREIGN KEY (`fk_return_extracharge_ID`) REFERENCES `returnextracharge` (`Return_extracharge_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `rentalsource`
--
ALTER TABLE `rentalsource`
  ADD CONSTRAINT `rentalsource_ibfk_1` FOREIGN KEY (`fk_Online_portals_ID`) REFERENCES `onlineportals` (`Online_portals_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rentalsource_ibfk_2` FOREIGN KEY (`fk_Rental_co_portals_ID`) REFERENCES `rentalcoportals` (`Rental_co_portals_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
