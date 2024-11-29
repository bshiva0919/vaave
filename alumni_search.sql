-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2024 at 01:43 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni_search`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_alumni_networks`
--

CREATE TABLE `tbl_alumni_networks` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_alumni_networks`
--

INSERT INTO `tbl_alumni_networks` (`id`, `name`) VALUES
(1, 'BlackRock'),
(4, 'Marks and Spencer'),
(3, 'McKinsey'),
(2, 'PwC');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `email`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'Banoth Shiva', 'bshiva0919@gmail.com', 17.406500, 78.477200, '2024-11-28 16:43:37'),
(2, 'Banoth Siva', 'bsiva0919@gmail.com', 13.084300, 13.084300, '2024-11-28 17:28:37'),
(3, 'Shiva Banoth', 'bsiva09@gmail.com', 12.971600, 77.594600, '2024-11-28 17:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_networks`
--

CREATE TABLE `tbl_user_networks` (
  `user_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_networks`
--

INSERT INTO `tbl_user_networks` (`user_id`, `network_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_alumni_networks`
--
ALTER TABLE `tbl_alumni_networks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_user_networks`
--
ALTER TABLE `tbl_user_networks`
  ADD PRIMARY KEY (`user_id`,`network_id`),
  ADD KEY `network_id` (`network_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_alumni_networks`
--
ALTER TABLE `tbl_alumni_networks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_user_networks`
--
ALTER TABLE `tbl_user_networks`
  ADD CONSTRAINT `tbl_user_networks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_user_networks_ibfk_2` FOREIGN KEY (`network_id`) REFERENCES `tbl_alumni_networks` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
