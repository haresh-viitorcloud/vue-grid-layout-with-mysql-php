-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 17, 2019 at 11:58 AM
-- Server version: 5.7.21-1ubuntu1
-- PHP Version: 7.2.19-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tempDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `vue_grid_layout`
--

CREATE TABLE `vue_grid_layout` (
  `id` int(11) NOT NULL,
  `grid_json_data` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vue_grid_layout`
--

INSERT INTO `vue_grid_layout` (`id`, `grid_json_data`, `created_at`, `update_at`) VALUES
(1, '{\"grid_json_data\":[{\"x\":0,\"y\":0,\"w\":2,\"h\":2,\"i\":\"0\",\"moved\":false},{\"x\":2,\"y\":0,\"w\":2,\"h\":4,\"i\":\"1\",\"moved\":false},{\"x\":4,\"y\":0,\"w\":3,\"h\":15,\"i\":\"2\",\"moved\":false},{\"x\":8,\"y\":0,\"w\":2,\"h\":3,\"i\":\"3\",\"moved\":false}]}', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vue_grid_layout`
--
ALTER TABLE `vue_grid_layout`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vue_grid_layout`
--
ALTER TABLE `vue_grid_layout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
