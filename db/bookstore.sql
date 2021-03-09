-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2021 at 05:40 AM
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
CREATE TABLE `book` (
  `book_id` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `book_name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `type_id` char(3) COLLATE utf8mb4_bin NOT NULL,
  `status_id` char(2) COLLATE utf8mb4_bin NOT NULL,
  `publish` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `unit_price` int(4) NOT NULL,
  `unit_rent` int(2) NOT NULL,
  `day_amount` int(2) DEFAULT NULL,
  `picture` mediumblob,
  `book_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `book`
--

TRUNCATE TABLE `book`;
--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `type_id`, `status_id`, `publish`, `unit_price`, `unit_rent`, `day_amount`, `picture`, `book_date`) VALUES
('00001', 'Doraemon', '001', '01', 'KPN', 150, 3, 2, NULL, '2021-03-09 11:34:16'),
('00002', 'เก็บตะวัน', '002', '02', 'WRP', 250, 5, 3, NULL, '2021-03-09 11:34:16'),
('00003', 'สิ่งมีชีวิต', '002', '01', 'YPR', 185, 3, 3, NULL, '2021-03-09 11:36:27'),
('00004', 'คู่สร้างคู่สม', '003', '01', 'DDR', 20, 1, 2, NULL, '2021-03-09 11:36:27'),
('00005', 'Konan', '001', '02', 'KPN', 80, 2, 2, NULL, '2021-03-09 11:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` varchar(4) COLLATE utf8mb4_bin NOT NULL,
  `customer_name` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `customer_surname` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `customer_addr` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `customer`
--

TRUNCATE TABLE `customer`;
--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_surname`, `customer_addr`, `customer_phone`) VALUES
('0001', 'สมชัย', 'เชียงพงศ์พันธู์', 'ปราจีนบุรี', '0654879546'),
('0002', 'นพเก้า', 'ทองใบ', 'ปราจีนบุรี', '0648795465');

-- --------------------------------------------------------

--
-- Table structure for table `statusbook`
--

DROP TABLE IF EXISTS `statusbook`;
CREATE TABLE `statusbook` (
  `status_id` varchar(2) COLLATE utf8mb4_bin NOT NULL,
  `status_name` varchar(20) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `statusbook`
--

TRUNCATE TABLE `statusbook`;
--
-- Dumping data for table `statusbook`
--

INSERT INTO `statusbook` (`status_id`, `status_name`) VALUES
('01', 'ปกติ'),
('02', 'ชำรุด'),
('03', 'ส่งซ่อม');

-- --------------------------------------------------------

--
-- Table structure for table `typebook`
--

DROP TABLE IF EXISTS `typebook`;
CREATE TABLE `typebook` (
  `type_id` char(3) COLLATE utf8mb4_bin NOT NULL,
  `type_name` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Truncate table before insert `typebook`
--

TRUNCATE TABLE `typebook`;
--
-- Dumping data for table `typebook`
--

INSERT INTO `typebook` (`type_id`, `type_name`) VALUES
('001', 'การ์ตูน'),
('002', 'นิยาย'),
('003', 'นิตยาสาร');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `statusbook`
--
ALTER TABLE `statusbook`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `typebook`
--
ALTER TABLE `typebook`
  ADD PRIMARY KEY (`type_id`);

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
