-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 09:19 PM
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
-- Database: `user_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospital_procedures`
--

CREATE TABLE `hospital_procedures` (
  `id` int(11) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `hospital_type` enum('Short Term Acute Care','General','Specialty') NOT NULL,
  `procedure_code` varchar(50) NOT NULL,
  `procedure_name` varchar(255) NOT NULL,
  `procedure_description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital_procedures`
--

INSERT INTO `hospital_procedures` (`id`, `hospital_name`, `location`, `city`, `state`, `zip_code`, `rating`, `hospital_type`, `procedure_code`, `procedure_name`, `procedure_description`, `price`, `created_at`) VALUES
(1, 'Washington Hospital', 'Fremont, CA', 'Fremont', 'CA', '94538', 4.2, 'Short Term Acute Care', 'GA002', 'Colonoscopy', 'A medical examination of the large bowel using a colonoscope.', 2801.00, '2025-02-07 16:34:57'),
(2, 'Alameda Hospital', 'Alameda, CA', 'Alameda', 'CA', '94501', 4.5, 'Short Term Acute Care', 'GA002', 'Colonoscopy', 'A medical examination of the large bowel using a colonoscope.', 2828.00, '2025-02-07 16:34:57'),
(3, 'San Francisco General Hospital', 'San Francisco, CA', 'San Francisco', 'CA', '94107', 4.8, 'General', 'GA002', 'Colonoscopy', 'A medical examination of the large bowel using a colonoscope.', 2750.00, '2025-02-07 16:34:57'),
(4, 'Stanford Health Care', 'Palo Alto, CA', 'Palo Alto', 'CA', '94304', 4.9, 'Specialty', 'GA002', 'Colonoscopy', 'A medical examination of the large bowel using a colonoscope.', 3100.00, '2025-02-07 16:34:57'),
(5, 'Kaiser Permanente Oakland', 'Oakland, CA', 'Oakland', 'CA', '94612', 4.6, 'General', 'GA002', 'Colonoscopy', 'A medical examination of the large bowel using a colonoscope.', 2900.00, '2025-02-07 16:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `deductible` int(11) NOT NULL,
  `outOfPocket` int(11) NOT NULL,
  `healthSpending` int(11) NOT NULL,
  `fsaHsa` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `phone`, `password`, `age`, `gender`, `deductible`, `outOfPocket`, `healthSpending`, `fsaHsa`, `created_at`) VALUES
(1, 'test@example.com', '123456789', '$2a$10$QJ3IvKNrSJrkbkGthjJuZuvkE8wMuUa7KwMusmaLyIU3bSiazdbqa', 30, 'Male', 500, 1000, 200, 3000, '2025-02-07 09:00:37'),
(2, 'takvir.alam@gmail.com', '01682456258', '$2a$10$S4nf47bfVukFnDnj0dceXOM0Md2ASA/pqsSAVqwASyQ1y7HBQ6YU2', 32, 'Male', 100, 500, 600, 30000, '2025-02-07 09:03:45'),
(3, 'takvir.alam1@gmail.com', '01992708084', '$2a$10$O8.a82NVhv9bFRbUjRfB8eQ7.JLAVf5z365YhYipM9onwKCPsdDQO', 50, 'Male', 20, 30, 50, 40, '2025-02-07 09:46:05'),
(4, 'takvir.alam2@gmail.com', '01682456258', '$2a$10$W.C1CNAiw2p/eqhp/Zwuze7B19gWKQEz4fwRitOhvi63SvQcUdaoa', 20, 'Male', 20, 30, 45, 50, '2025-02-07 09:49:14'),
(5, 'takvirlikhon@gmail.com', '01682456258', '$2a$10$daN2jYRc8/8RePjyl2ITveFW7.xCKbm.56XYL7QzbCeSt826tiXau', 30, 'Male', 50, 60, 100, 1500, '2025-02-07 10:09:32'),
(6, 'takvir.alam5@gmail.com', '01682456258', '$2a$10$jl629YMfZGzYm2/sa9.9r.ftY6cO6hxVZd4t8vuxdDkgZzPu0Ufxe', 20, 'Male', 50, 60, 40, 55, '2025-02-07 10:13:50'),
(7, 'test2@gmail.com', '01992708084', '$2a$10$vgBznQ4jJrgtn5UrdkHAHuaW585ez4Jo0LuRyECzGeZOi.OuzEhXq', 35, 'Male', 100, 800, 40, 50, '2025-02-07 17:50:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospital_procedures`
--
ALTER TABLE `hospital_procedures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospital_procedures`
--
ALTER TABLE `hospital_procedures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
