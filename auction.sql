-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 05:31 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--
CREATE DATABASE IF NOT EXISTS `auction` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `auction`;

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `time` time NOT NULL DEFAULT current_timestamp(),
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bid_id`, `date`, `time`, `amount`) VALUES
(1, '2020-07-08', '14:41:56', 200),
(2, '2020-07-08', '14:41:56', 400);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `password`, `bid_id`) VALUES
(3, 'john', 'john@gmail.com', '123', 1),
(4, 'chris', 'chris@gmail.com', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `photo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `NAME`, `description`, `photo`) VALUES
(1, 'tv', '43 inches Ultra HD', '1.jpg'),
(2, 'laptop', 'i7 ', '2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `productsets`
--

CREATE TABLE `productsets` (
  `productSets_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productsets`
--

INSERT INTO `productsets` (`productSets_id`, `product_id`, `set_id`) VALUES
(1, 2, 3),
(2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sets`
--

CREATE TABLE `sets` (
  `set_id` int(11) NOT NULL,
  `startPrice` float NOT NULL,
  `heighstBid` float NOT NULL,
  `remainingTime` time NOT NULL,
  `bid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sets`
--

INSERT INTO `sets` (`set_id`, `startPrice`, `heighstBid`, `remainingTime`, `bid_id`) VALUES
(3, 200, 1000, '00:12:00', NULL),
(4, 100, 700, '00:04:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `bid_id` (`bid_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `productsets`
--
ALTER TABLE `productsets`
  ADD PRIMARY KEY (`productSets_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `bid_id` (`bid_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productsets`
--
ALTER TABLE `productsets`
  MODIFY `productSets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sets`
--
ALTER TABLE `sets`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`bid_id`) REFERENCES `bids` (`bid_id`);

--
-- Constraints for table `productsets`
--
ALTER TABLE `productsets`
  ADD CONSTRAINT `productsets_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `productsets_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `productsets_ibfk_3` FOREIGN KEY (`set_id`) REFERENCES `sets` (`set_id`);

--
-- Constraints for table `sets`
--
ALTER TABLE `sets`
  ADD CONSTRAINT `sets_ibfk_2` FOREIGN KEY (`bid_id`) REFERENCES `bids` (`bid_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
