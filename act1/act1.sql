-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 05:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `act1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_form`
--

CREATE TABLE `tbl_contact_form` (
  `contact_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `contact_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_contact_form`
--

INSERT INTO `tbl_contact_form` (`contact_id`, `name`, `email`, `subject`, `message`, `contact_date`) VALUES
(1, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'DASDAFS', '2024-09-24 07:54:56'),
(2, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'DASDAFS', '2024-09-24 11:54:31'),
(3, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'DASDAFS', '2024-09-24 11:54:38'),
(4, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'dsdssf', '2024-09-24 11:54:42'),
(5, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'dsdssf', '2024-09-24 12:04:18'),
(6, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'dsdssf', '2024-09-24 12:26:03'),
(7, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'dsdssf', '2024-09-24 13:00:07'),
(8, 'DSAD', 'facilitator@gmail.com', 'fsdfs', 'dsdssf', '2024-09-24 13:03:59'),
(9, 'ds', 'dasd@gmail.com', 'dasd', 'dsad', '2024-09-24 13:04:17'),
(10, 'dsad', 'facilitator@gmail.com', 'dsa', 'dsasad', '2024-09-24 13:04:25'),
(11, 'dsad', 'facilitator@gmail.com', 'dsa', 'dsasad', '2024-09-24 13:05:13'),
(12, 'sadsa', 'dasdsad@gmail.com', 'dasda', 'dsad', '2024-09-24 13:05:29'),
(13, 'sadsa', 'dasdsad@gmail.com', 'dasda', 'dsad', '2024-09-24 15:52:21'),
(14, 'sadsa', 'dasdsad@gmail.com', 'dasda', 'dsad', '2024-09-24 16:01:01'),
(15, 'DSF', 'dasdsad@gmail.com', 'dasda', 'FDS', '2024-09-24 16:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_admin`
--

CREATE TABLE `tbl_user_admin` (
  `employee_id` int(11) NOT NULL,
  `emp_username` varchar(50) NOT NULL,
  `emp_pwd` varchar(255) NOT NULL,
  `emp_Fname` varchar(50) NOT NULL,
  `emp_Mname` varchar(50) DEFAULT NULL,
  `emp_Lname` varchar(50) NOT NULL,
  `emp_pic` varchar(255) DEFAULT NULL,
  `emp_email` varchar(100) NOT NULL,
  `emp_contact` varchar(20) DEFAULT NULL,
  `emp_role` varchar(20) NOT NULL,
  `emp_status` varchar(20) NOT NULL,
  `emp_reg_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_admin`
--

INSERT INTO `tbl_user_admin` (`employee_id`, `emp_username`, `emp_pwd`, `emp_Fname`, `emp_Mname`, `emp_Lname`, `emp_pic`, `emp_email`, `emp_contact`, `emp_role`, `emp_status`, `emp_reg_date`) VALUES
(1, 'earl', '123', 'earl', 'paragas', 'maratas', NULL, 'maratasearlvincent@gmail.com', '09915327742', 'Admin', 'Active', '2024-09-24 13:06:40'),
(2, 'denden', '$2y$10$6TSOT/4LbK78JLE86fSsAeWQ.RIRi5VSWhirwT8VB/DQg9ELPfflC', 'denmark', 'paragas', 'maratas', 'Bell Church.jpg', 'denden@gmail.com', '09915327742', 'Admin', 'Active', '2024-09-24 07:45:01'),
(3, 'early', '$2y$10$G91STvOd4zUylF/.EEpkFu6juzBK9snABsKPLVkfv451gaIFGO1oW', 'Earl', 'Vincent Paragas', 'maratas', 'Bell Church.jpg', 'maratasearlvincent@gmail.com', '09915327742', 'Admin', 'Active', '2024-09-24 16:31:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_contact_form`
--
ALTER TABLE `tbl_contact_form`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_user_admin`
--
ALTER TABLE `tbl_user_admin`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_contact_form`
--
ALTER TABLE `tbl_contact_form`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user_admin`
--
ALTER TABLE `tbl_user_admin`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
