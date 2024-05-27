-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2024 at 05:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ordering_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `product_names` text NOT NULL,
  `total_due` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `product_names`, `total_due`, `order_date`) VALUES
(1, 'Tteokbokki - Price: ₱200.00', 0.00, '2024-05-26 16:46:30'),
(2, 'Bulgogi - Price: ₱450.00, Jajangmyeon - Price: ₱320.00', 0.00, '2024-05-26 16:47:20'),
(3, 'Tteokbokki', 0.00, '2024-05-26 16:58:33'),
(4, 'Bulgogi', 0.00, '2024-05-26 16:59:55'),
(5, 'Samgyeopsal, Galbi, Bibim Naengmyeon, Bibimbap, Kimchi, Tteokbokki, Bulgogi, Jajangmyeon, Japchae, Kimchi Jjigae', 0.00, '2024-05-26 17:00:52'),
(6, 'Tteokbokki, Bulgogi, Jajangmyeon, Bibim Naengmyeon, Bibimbap', 0.00, '2024-05-26 17:02:20'),
(7, 'Tteokbokki, Bulgogi, Jajangmyeon, Bibim Naengmyeon, Bibimbap, Kimchi, Bibim Naengmyeon, Samgyeopsal, Kimchi Jjigae, Japchae, Galbi', 0.00, '2024-05-27 10:14:50'),
(8, 'Kimchi, Tteokbokki', 450.00, '2024-05-27 10:26:42'),
(9, 'Jajangmyeon, Japchae', 620.00, '2024-05-27 10:39:11'),
(10, 'Bulgogi, Jajangmyeon, Japchae', 1070.00, '2024-05-27 10:43:12'),
(11, 'Galbi, Bulgogi', 950.00, '2024-05-27 10:46:37'),
(12, 'Jajangmyeon, Bulgogi', 770.00, '2024-05-27 10:49:00'),
(13, 'Tteokbokki, Bulgogi', 650.00, '2024-05-27 10:53:35'),
(14, 'Bulgogi, Jajangmyeon', 770.00, '2024-05-27 10:55:56'),
(15, 'Tteokbokki, Bulgogi', 650.00, '2024-05-27 10:56:23'),
(16, 'Jajangmyeon, Japchae', 620.00, '2024-05-27 10:56:39'),
(17, 'Bulgogi, Jajangmyeon', 770.00, '2024-05-27 10:56:56'),
(18, 'Kimchi, Tteokbokki, Bibimbap, Bulgogi, Bibim Naengmyeon, Jajangmyeon, Japchae, Galbi, Samgyeopsal, Kimchi Jjigae', 0.00, '2024-05-27 14:16:16'),
(19, 'Bibimbap, Kimchi, Galbi', 0.00, '2024-05-27 14:19:09'),
(20, 'Bibimbap, Kimchi, Galbi', 0.00, '2024-05-27 14:19:10'),
(21, 'Bulgogi, Jajangmyeon', 0.00, '2024-05-27 14:20:20'),
(22, 'Jajangmyeon, Bulgogi', 770.00, '2024-05-27 14:23:51'),
(23, 'Kimchi', 250.00, '2024-05-27 14:30:39'),
(24, 'Jajangmyeon, Bulgogi, Bibim Naengmyeon', 1150.00, '2024-05-27 14:32:45'),
(25, 'Bibimbap, Bulgogi, Jajangmyeon, Galbi, Japchae', 1920.00, '2024-05-27 14:33:25'),
(26, 'Bibimbap, Bulgogi, Jajangmyeon, Galbi, Japchae', 1920.00, '2024-05-27 14:33:28'),
(27, 'Tteokbokki, Bulgogi', 650.00, '2024-05-27 14:45:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
(1, 'Kimchi', 250.00),
(2, 'Bibimbap', 350.00),
(3, 'Bulgogi', 450.00),
(4, 'Japchae', 300.00),
(5, 'Tteokbokki', 200.00),
(6, 'Samgyeopsal', 400.00),
(7, 'Galbi', 500.00),
(8, 'Kimchi Jjigae', 280.00),
(9, 'Jajangmyeon', 320.00),
(10, 'Bibim Naengmyeon', 380.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
