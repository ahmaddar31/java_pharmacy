-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2023 at 09:04 AM
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
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `ministryEmail` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `pass`, `ministryEmail`) VALUES
(1, 'Ahmad Darwich', 'ahmad123@gmail.com', '123', 'mf@gmail.com'),
(2, 'Hassan Tarhini', 'ht@gmail.com', '123', 'mf@gmail.com'),
(4, 'slayman ch3ayto', 'sc31@gmail.com', '1234', 'mf@gmail.com'),
(5, 'karine', 'kd@gmail.com', '123', 'mf@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `md_id` int(11) NOT NULL,
  `medName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`md_id`, `medName`) VALUES
(2, 'tailanol'),
(20, 'vital'),
(25, 'muscerol'),
(29, 'iboprophine'),
(30, 'profinal'),
(31, 'maurphine'),
(38, 'keflex'),
(39, 'Winstrol'),
(41, 'panadol');

-- --------------------------------------------------------

--
-- Table structure for table `ministry`
--

CREATE TABLE `ministry` (
  `Admin_name` varchar(150) NOT NULL,
  `Admin_email` varchar(150) NOT NULL,
  `Admin_password` varchar(150) NOT NULL,
  `Admin_DOB` datetime NOT NULL DEFAULT current_timestamp(),
  `position` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ministry`
--

INSERT INTO `ministry` (`Admin_name`, `Admin_email`, `Admin_password`, `Admin_DOB`, `position`) VALUES
('Mhamad Fahs', 'mf@gmail.com', '123', '2023-09-02 16:23:45', 'Head'),
('Slayman ch3ayto', 'slayman@gmail.com', '123', '2023-09-02 16:24:27', 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `pharma`
--

CREATE TABLE `pharma` (
  `pharma_id` int(11) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `phName` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharma`
--

INSERT INTO `pharma` (`pharma_id`, `address`, `phName`, `admin_id`) VALUES
(1, 'Al-Kfour', 'pharmaria', 1),
(2, 'Ebba', 'Tarhini pharma', 2),
(4, 'Nabatieh', 'slayman pharmacy', 4),
(5, 'beirut', 'k\'s pharmacy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pharmamed`
--

CREATE TABLE `pharmamed` (
  `ph_id` int(11) NOT NULL,
  `med_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmamed`
--

INSERT INTO `pharmamed` (`ph_id`, `med_id`, `quantity`, `price`) VALUES
(1, 2, 15, 3),
(1, 25, 13, 3),
(2, 29, 6, 3),
(2, 30, 1, 6),
(1, 31, 15, 15),
(1, 38, 12, 4),
(2, 39, 18, 2),
(2, 41, 6, 2),
(2, 25, 8, 4),
(1, 39, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `userID` int(11) NOT NULL,
  `qtyReserved` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `med_ref_id` int(11) NOT NULL,
  `Date_of_rsv` datetime NOT NULL DEFAULT current_timestamp(),
  `p_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  `delivery` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`userID`, `qtyReserved`, `total_price`, `med_ref_id`, `Date_of_rsv`, `p_id`, `r_id`, `delivery`) VALUES
(2, 1, 2, 39, '2023-09-04 16:56:52', 2, 13, 'No'),
(2, 1, 3, 25, '2023-09-05 09:29:34', 1, 15, 'No'),
(2, 3, 6, 39, '2023-09-05 09:59:59', 1, 17, 'Yes'),
(2, 1, 2, 39, '2023-09-05 10:00:09', 2, 18, 'No'),
(2, 3, 6, 41, '2023-09-05 10:00:22', 2, 19, 'No'),
(2, 3, 12, 38, '2023-09-05 10:00:41', 1, 20, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `medication_id` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date_of_sold` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `pharmacy_id`, `medication_id`, `quantity_sold`, `price`, `date_of_sold`) VALUES
(2, 1, 39, 2, 4, '2023-09-05 09:45:49'),
(3, 1, 25, 2, 6, '2023-09-05 09:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `Uname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `DOB` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `Uname`, `email`, `password`, `address`, `DOB`) VALUES
(1, 'ahmad', 'ahmaddar31@outlook.com', '123456789', 'kfour', '2023-06-25 16:44:00'),
(2, 'ahmad', 'ahmad1234@gmail.com', '123456789', 'nabatieg', '2023-08-27 19:45:00'),
(3, 'slayman', 'sc123@gmail.com', '123', 'Zebdine', '2023-08-30 16:24:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ministry_id` (`ministryEmail`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`md_id`);

--
-- Indexes for table `ministry`
--
ALTER TABLE `ministry`
  ADD PRIMARY KEY (`Admin_email`);

--
-- Indexes for table `pharma`
--
ALTER TABLE `pharma`
  ADD PRIMARY KEY (`pharma_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `pharmamed`
--
ALTER TABLE `pharmamed`
  ADD KEY `ph_id` (`ph_id`,`med_id`),
  ADD KEY `med_id` (`med_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `med_ref_id` (`med_ref_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`,`medication_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `DOB` (`DOB`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `md_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `pharma`
--
ALTER TABLE `pharma`
  MODIFY `pharma_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ministryEmail`) REFERENCES `ministry` (`Admin_email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharma`
--
ALTER TABLE `pharma`
  ADD CONSTRAINT `pharma_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pharmamed`
--
ALTER TABLE `pharmamed`
  ADD CONSTRAINT `pharmamed_ibfk_1` FOREIGN KEY (`ph_id`) REFERENCES `pharma` (`pharma_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pharmamed_ibfk_2` FOREIGN KEY (`med_id`) REFERENCES `medication` (`md_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`med_ref_id`) REFERENCES `medication` (`md_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `pharma` (`pharma_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharma` (`pharma_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`md_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
