-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2024 at 02:56 PM
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
-- Database: `lab_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `comlab_rooms`
--

CREATE TABLE `comlab_rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_location` varchar(255) NOT NULL,
  `capacity` int(3) NOT NULL,
  `working_computers` int(3) NOT NULL DEFAULT 0,
  `not_working_computers` int(3) NOT NULL DEFAULT 0,
  `room_status` enum('Open','Closed','Under Maintenance') NOT NULL DEFAULT 'Open',
  `last_checked` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comlab_rooms`
--

INSERT INTO `comlab_rooms` (`room_id`, `room_name`, `room_location`, `capacity`, `working_computers`, `not_working_computers`, `room_status`, `last_checked`, `remarks`, `emp_id`) VALUES
(6, 'ComLab1', '2nd floor', 40, 40, 0, 'Open', '2024-10-11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 6),
(7, 'ComLab2', '2nd floor', 40, 40, 0, 'Open', '2024-10-11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 6),
(8, 'ComLab3', '2nd floor', 40, 40, 0, 'Open', '2024-10-11', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `computer_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`attendance_id`, `student_id`, `class_id`, `computer_id`, `date`, `time_in`, `time_out`) VALUES
(1, 1, 1, 1, '2024-10-12', '19:24:00', '19:24:00'),
(2, 1, 1, 1, '2024-10-12', '19:24:00', '19:24:00'),
(3, 17, 2, 6, '2024-10-18', '12:00:00', '20:02:00'),
(4, 17, 2, 6, '2024-10-18', '12:00:00', '20:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_classes`
--

CREATE TABLE `tbl_classes` (
  `class_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `classname` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `class_code` varchar(255) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_classes`
--

INSERT INTO `tbl_classes` (`class_id`, `emp_id`, `room_id`, `classname`, `subject`, `class_code`, `schedule`) VALUES
(1, 6, 6, 'ITS401', 'Capstone2', 'CLASS_6709F6A1C57D7', '2024-10-12 12:10:00'),
(2, 6, 6, 'ITS402', 'SPI', 'CLASS_6709F8007FF18', '2024-10-12 12:15:00'),
(3, 6, 6, 'ITS402', 'SPI', 'CLASS_6709F88E17B70', '2024-10-12 12:15:00'),
(4, 6, 6, 'ITS402', 'SPI', 'CLASS_6709F94DBC5C9', '2024-10-12 12:15:00'),
(5, 6, 6, 'ITS402', 'SPI', 'CLASS_6709F9FC8CBEE', '2024-10-12 12:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_computer`
--

CREATE TABLE `tbl_computer` (
  `computer_id` int(11) NOT NULL,
  `room_id` int(100) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `status` enum('working','not working') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_computer`
--

INSERT INTO `tbl_computer` (`computer_id`, `room_id`, `computer_name`, `status`) VALUES
(1, 0, 'CL-PC1', 'working'),
(2, 0, 'CL-PC2', 'working'),
(3, 0, 'CL-PC3', 'working'),
(4, 0, 'CL-PC4', 'working'),
(5, 0, 'CL-PC5', 'working'),
(6, 0, 'CL-PC6', 'working'),
(7, 0, 'CL-PC7', 'working'),
(8, 0, 'CL-PC8', 'working'),
(9, 0, 'CL-PC9', 'working'),
(10, 0, 'CL-PC10', 'working'),
(11, 0, 'CL-PC10', 'working');

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
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `course` varchar(100) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  `section` varchar(100) DEFAULT NULL,
  `date_registered` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `first_name`, `middle_name`, `last_name`, `student_number`, `password`, `gender`, `course`, `year_level`, `section`, `date_registered`, `status`) VALUES
(1, 'Earl', NULL, 'maratas', '123', '$2y$10$C4IL/FMTAjDTBuX5CxonyeFVK2Euk5j5VnSAMCPzCf8sK6hqI1YJS', 'Male', NULL, NULL, NULL, '2024-10-09 06:09:02', ''),
(3, '', '', '', '32323', '$2y$10$gRS1oJF9GrQFP6Ihjwmjg.KpG1bAXGGsfq1/QPh4uFeO4omaFmNk.', 'Male', 'bsit', 2, '4324242', '2024-10-11 15:28:33', 'active'),
(14, 'dsadsa', 'dsad', 'dsada', 'dsads', 'dsada', 'Male', 'dsada', 0, 'sadsa', '2024-10-10 16:00:00', 'active'),
(17, 'sasay', NULL, 'maratas', '12345678', '$2y$10$JxRzpUoxAZnteIwDrPgbIuGNDvcQD8C20QKSRmh8SigDbdy/qOnKG', 'Male', NULL, NULL, NULL, '2024-10-11 16:09:50', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_admin`
--

CREATE TABLE `tbl_user_admin` (
  `emp_id` int(11) NOT NULL,
  `emp_number` varchar(50) NOT NULL,
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

INSERT INTO `tbl_user_admin` (`emp_id`, `emp_number`, `emp_pwd`, `emp_Fname`, `emp_Mname`, `emp_Lname`, `emp_pic`, `emp_email`, `emp_contact`, `emp_role`, `emp_status`, `emp_reg_date`) VALUES
(1, 'earl', '123', 'earl', 'paragas', 'maratas', NULL, 'maratasearlvincent@gmail.com', '09915327742', 'Admin', 'Active', '2024-09-24 13:06:40'),
(2, 'denden', '$2y$10$6TSOT/4LbK78JLE86fSsAeWQ.RIRi5VSWhirwT8VB/DQg9ELPfflC', 'denmark', 'paragas', 'maratas', 'Bell Church.jpg', 'denden@gmail.com', '09915327742', 'Admin', 'Active', '2024-09-24 07:45:01'),
(3, 'early', '$2y$10$G91STvOd4zUylF/.EEpkFu6juzBK9snABsKPLVkfv451gaIFGO1oW', 'Earl', 'Vincent Paragas', 'maratas', 'Bell Church.jpg', 'maratasearlvincent@gmail.com', '09915327742', 'Admin', 'Active', '2024-09-24 16:31:21'),
(4, 'early077', '$2y$10$FNKmbCebbWwiGOd/R/Yg6eDP4NR2w3iLTUn3pjkPO0nXFEMMQ6rEu', 'Earl', ' Paragas', 'maratas', '459076530_823265743038649_7792226257747353572_n.jpg', 'maratasearlvincent@gmail.com', '09915327742', 'Admin', 'Active', '2024-10-09 07:22:27'),
(5, '123', '$2y$10$6IaCTTdZytXX1Ee/VRAg.OT4BnEi1NJMwTsCUs4SOeMRoFkBlR5Za', 'Earl', ' Paragas', 'maratas', '459076530_823265743038649_7792226257747353572_n.jpg', 'maratasearlvincent@gmail.com', '09915327742', 'Admin', 'Active', '2024-10-09 07:44:32'),
(6, '1234', '$2y$10$JONR/LP3UwyQ/BJ9/E/BrejLIJ4qR0wZ4bZeQuLf8XsHeDEhYmnoK', 'Jerove', 'Bonjayag', 'Jalbay', '373473845_985675302715839_8711572266413017477_n.jpg', 'Jerove@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-10 15:59:38'),
(7, 'DWD', '$2y$10$2CTTZHE2nB9KrRMfEOLVB.IrIDMGzdot.kUlFqt2G1YPi.Hq7BHOi', 'DWADAWD', 'DAWDAW', 'DWADA', 'img/employee/459076530_823265743038649_7792226257747353572_n.jpg', 'Jerove@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-11 21:17:14'),
(8, 'DWD', '$2y$10$0EqckNZcV4mqmliwCXKSXOPWahHkHOiHaUEcEp3V2oL2aRUW2gQPG', 'DWADAWD', 'DAWDAW', 'DWADA', NULL, 'Jerove@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-11 21:21:11'),
(9, '6565656', '$2y$10$6cQdChiB75SHcz2J9ijlS.8pf9jy.03VoU8NWAnhlhLrX/h17dC7G', 'SSSSSSSSSS', 'SSSS', 'SSSSSSSSSS', NULL, 'earl@gmail.com', '991532772', 'Professor', 'Active', '2024-10-11 21:21:30'),
(10, '6565656', '$2y$10$yb.Rasuv6R0jDU4RHkge3uk7mpmfI3hbRlb.355Yr6b3LRfuzpNVO', 'SSSSSSSSSS', 'SSSS', 'SSSSSSSSSS', NULL, 'earl@gmail.com', '991532772', 'Professor', 'Active', '2024-10-11 21:22:13'),
(11, 'ccscscs', '$2y$10$LVzbY9XXxAD.Nn8BQ5rPBOSy49mWcUIm3rEro8IrIzzFOOkwS2.ou', 'ccscscs', 'ccscscs', 'ccscscs', NULL, 'maratasearlvincent@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-11 21:24:37'),
(12, 'ccscscs', '$2y$10$2/7nd2GDuh9oA7kzJA6SdOWEdA7KjMyoEYj6Rt7w0Enwh2KS39r4u', 'ccscscs', 'ccscscs', 'ccscscs', NULL, 'maratasearlvincent@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-11 21:40:08'),
(13, 'ccscscs', '$2y$10$R7B6WrwXO41NEr3JNJApn.1npDvEuHYTNL56TVM3POeHxiGLOnBse', 'ccscscs', 'ccscscs', 'ccscscs', NULL, 'maratasearlvincent@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-11 21:40:45'),
(14, 'ccscscs', '$2y$10$4oOMVizUxpZZieYMDrUHMePencNoIPP17Pz1xRW3U3fUg5kwKjyrW', 'ccscscs', 'ccscscs', 'ccscscs', NULL, 'maratasearlvincent@gmail.com', '09915327742', 'Professor', 'Active', '2024-10-11 21:40:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comlab_rooms`
--
ALTER TABLE `comlab_rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `comlab_rooms_ibfk_1` (`emp_id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `tbl_attendance_ibfk_1` (`student_id`),
  ADD KEY `tbl_attendance_ibfk_2` (`class_id`),
  ADD KEY `tbl_attendance_ibfk_3` (`computer_id`);

--
-- Indexes for table `tbl_classes`
--
ALTER TABLE `tbl_classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `fk_emp_id` (`emp_id`),
  ADD KEY `fk_room_id` (`room_id`);

--
-- Indexes for table `tbl_computer`
--
ALTER TABLE `tbl_computer`
  ADD PRIMARY KEY (`computer_id`);

--
-- Indexes for table `tbl_contact_form`
--
ALTER TABLE `tbl_contact_form`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_number` (`student_number`);

--
-- Indexes for table `tbl_user_admin`
--
ALTER TABLE `tbl_user_admin`
  ADD PRIMARY KEY (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comlab_rooms`
--
ALTER TABLE `comlab_rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_classes`
--
ALTER TABLE `tbl_classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_computer`
--
ALTER TABLE `tbl_computer`
  MODIFY `computer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_contact_form`
--
ALTER TABLE `tbl_contact_form`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_user_admin`
--
ALTER TABLE `tbl_user_admin`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comlab_rooms`
--
ALTER TABLE `comlab_rooms`
  ADD CONSTRAINT `comlab_rooms_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tbl_user_admin` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD CONSTRAINT `tbl_attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `tbl_classes` (`class_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_attendance_ibfk_3` FOREIGN KEY (`computer_id`) REFERENCES `tbl_computer` (`computer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_classes`
--
ALTER TABLE `tbl_classes`
  ADD CONSTRAINT `fk_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `tbl_user_admin` (`emp_id`),
  ADD CONSTRAINT `fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `comlab_rooms` (`room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
