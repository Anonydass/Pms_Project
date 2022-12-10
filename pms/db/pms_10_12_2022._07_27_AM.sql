-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2022 at 03:55 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pms`
--

-- --------------------------------------------------------

--
-- Table structure for table `menusetting`
--

CREATE TABLE `menusetting` (
  `id` int(12) NOT NULL,
  `menucode` varchar(10) NOT NULL,
  `menuname` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menusetting`
--

INSERT INTO `menusetting` (`id`, `menucode`, `menuname`) VALUES
(1, '001', 'Resume Management'),
(3, '002', 'Health Management');

-- --------------------------------------------------------

--
-- Table structure for table `prs_technical`
--

CREATE TABLE `prs_technical` (
  `id` int(25) NOT NULL,
  `usercode` varchar(25) NOT NULL,
  `type` varchar(30) NOT NULL,
  `description` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prs_technical`
--

INSERT INTO `prs_technical` (`id`, `usercode`, `type`, `description`) VALUES
(2, '7356372974', 'Number', 'Its Not A Mobile Number');

-- --------------------------------------------------------

--
-- Table structure for table `submenusetting`
--

CREATE TABLE `submenusetting` (
  `id` int(12) NOT NULL,
  `menucode` varchar(10) NOT NULL,
  `submenuname` varchar(500) NOT NULL,
  `url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenusetting`
--

INSERT INTO `submenusetting` (`id`, `menucode`, `submenuname`, `url`) VALUES
(1, '001', 'Experience/profile Entry', 'prs_technical.jsp?option=view&id=0');

-- --------------------------------------------------------

--
-- Table structure for table `usersetting`
--

CREATE TABLE `usersetting` (
  `id` int(12) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobileno` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usersetting`
--

INSERT INTO `usersetting` (`id`, `username`, `password`, `email`, `mobileno`) VALUES
(6, 'GAVASKAR S', 'welcome', 'gavaskar07@gmail.com', '944315724612');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menusetting`
--
ALTER TABLE `menusetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prs_technical`
--
ALTER TABLE `prs_technical`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenusetting`
--
ALTER TABLE `submenusetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersetting`
--
ALTER TABLE `usersetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menusetting`
--
ALTER TABLE `menusetting`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prs_technical`
--
ALTER TABLE `prs_technical`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submenusetting`
--
ALTER TABLE `submenusetting`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usersetting`
--
ALTER TABLE `usersetting`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
