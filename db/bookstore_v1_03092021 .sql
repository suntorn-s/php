-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2021 at 05:21 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--
CREATE DATABASE IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `bookstore`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `book_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `type_id` char(3) COLLATE utf8mb4_bin NOT NULL,
  `status_id` char(2) COLLATE utf8mb4_bin NOT NULL,
  `publish` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `unit_price` int(4) NOT NULL,
  `unit_rent` int(2) NOT NULL,
  `day_amount` int(2) DEFAULT NULL,
  `picture` mediumblob,
  `book_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`),
  KEY `status_id` (`status_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `book`
--

TRUNCATE TABLE `book`;
-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `customer_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `customer_surname` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `customer_addr` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `customer`
--

TRUNCATE TABLE `customer`;
-- --------------------------------------------------------

--
-- Table structure for table `statusbook`
--

DROP TABLE IF EXISTS `statusbook`;
CREATE TABLE IF NOT EXISTS `statusbook` (
  `status_id` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `status_name` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `statusbook`
--

TRUNCATE TABLE `statusbook`;
-- --------------------------------------------------------

--
-- Table structure for table `typebook`
--

DROP TABLE IF EXISTS `typebook`;
CREATE TABLE IF NOT EXISTS `typebook` (
  `type_id` char(3) COLLATE utf8mb4_bin NOT NULL,
  `type_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `typebook`
--

TRUNCATE TABLE `typebook`;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `typebook` (`type_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `statusbook` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
