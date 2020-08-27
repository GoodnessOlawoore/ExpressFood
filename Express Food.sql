-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2020 at 12:42 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express_food`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `first_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `first_name`, `last_name`, `phone`) VALUES
(1, 'Goodness', 'Olawoore', '08134512001'),
(2, 'Johnny', 'Drille', '09011223344');

-- --------------------------------------------------------

--
-- Table structure for table `client_address`
--

CREATE TABLE `client_address` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `address_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_mark` int(11) NOT NULL,
  `road_number` int(11) NOT NULL,
  `apartment_number` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_address`
--

INSERT INTO `client_address` (`id`, `client_id`, `address_type`, `line_mark`, `road_number`, `apartment_number`, `city`, `state`, `postal_id`) VALUES
(1, 1, 'School', 234, 12, '43AZ', 'Ado', 'Ekiti', 360001),
(2, 2, 'Home', 172, 53, '872JI', 'Ado ', 'Ekiti', 360001);

-- --------------------------------------------------------

--
-- Table structure for table `daily_menu`
--

CREATE TABLE `daily_menu` (
  `id` int(11) NOT NULL,
  `main_dish` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_dessert` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_menu`
--

INSERT INTO `daily_menu` (`id`, `main_dish`, `main_dessert`, `date`) VALUES
(1, 'rice', 'cake', '2020-07-28'),
(2, 'yam porridge', 'yogurt ', '2020-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man`
--

CREATE TABLE `delivery_man` (
  `id` int(11) NOT NULL,
  `first_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_man`
--

INSERT INTO `delivery_man` (`id`, `first_name`, `last_name`, `phone`) VALUES
(1, 'Aliyu', 'Danjuma', '08198230716'),
(2, 'James', 'Doro', '09076897654');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item`
--

CREATE TABLE `menu_item` (
  `id` int(11) NOT NULL,
  `item_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item`
--

INSERT INTO `menu_item` (`id`, `item_type`, `item_name`) VALUES
(1, 'Main Dish', 'rice'),
(2, 'Dessert', 'cake');

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_daily_menu`
--

CREATE TABLE `menu_item_daily_menu` (
  `id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  `daily_menu_id` int(11) NOT NULL,
  `item_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_daily_menu`
--

INSERT INTO `menu_item_daily_menu` (`id`, `menu_item_id`, `daily_menu_id`, `item_price`) VALUES
(1, 1, 1, '4592.00'),
(2, 2, 2, '1443.00'),
(3, 1, 2, '2392.00'),
(4, 1, 1, '3000.30'),
(5, 1, 2, '1500.00'),
(6, 1, 1, '1250.12'),
(7, 2, 2, '2300.72');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_address_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `date_and_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `client_id`, `client_address_id`, `order_status_id`, `date_and_time`) VALUES
(1, 1, 2, 2, '2020-07-28 10:43:30'),
(2, 2, 1, 1, '2020-07-29 13:14:32'),
(3, 2, 1, 2, '2020-07-30 17:29:11'),
(4, 1, 2, 2, '2020-07-30 17:45:05'),
(5, 2, 2, 2, '2020-07-31 11:03:05'),
(6, 1, 2, 2, '2020-08-01 12:00:00'),
(7, 1, 2, 2, '2020-08-02 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_menu_item`
--

CREATE TABLE `order_menu_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_menu_item`
--

INSERT INTO `order_menu_item` (`id`, `order_id`, `menu_item_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 1),
(7, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `estimated_journey_time` time NOT NULL,
  `status` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `estimated_journey_time`, `status`) VALUES
(1, '00:05:04', 'On transit'),
(2, '00:15:21', 'Delivered');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_address`
--
ALTER TABLE `client_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `daily_menu`
--
ALTER TABLE `daily_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_item_daily_menu`
--
ALTER TABLE `menu_item_daily_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_id` (`menu_item_id`),
  ADD KEY `daily_menu_id` (`daily_menu_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `client_address_id` (`client_address_id`),
  ADD KEY `order_status_id` (`order_status_id`);

--
-- Indexes for table `order_menu_item`
--
ALTER TABLE `order_menu_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `menu_item_id` (`menu_item_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client_address`
--
ALTER TABLE `client_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `daily_menu`
--
ALTER TABLE `daily_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_man`
--
ALTER TABLE `delivery_man`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_item_daily_menu`
--
ALTER TABLE `menu_item_daily_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_menu_item`
--
ALTER TABLE `order_menu_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_address`
--
ALTER TABLE `client_address`
  ADD CONSTRAINT `client_address_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_item_daily_menu`
--
ALTER TABLE `menu_item_daily_menu`
  ADD CONSTRAINT `menu_item_daily_menu_ibfk_1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_item_daily_menu_ibfk_2` FOREIGN KEY (`daily_menu_id`) REFERENCES `daily_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`client_address_id`) REFERENCES `client_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_menu_item`
--
ALTER TABLE `order_menu_item`
  ADD CONSTRAINT `order_menu_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_menu_item_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
