-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2024 at 02:56 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mechaban`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `username` varchar(15) NOT NULL,
  `name` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('customer','montir','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`username`, `name`, `email`, `no_hp`, `password`, `role`, `photo`) VALUES
('citra', 'Citra Rahayu', 'citra@gmail.com', '1234567890', '2222', 'customer', NULL),
('dara', 'Dara Novia', 'dara@gmail.com', '09876543', 'daradara', 'customer', NULL),
('evan', 'Evan\r\n', 'evan@gmail.com', '123450987', 'leeevan', 'montir', NULL),
('jake', 'Jake Sim', 'simjake@gmail.com', '567890234', 'jakeyjakey', 'montir', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` char(5) NOT NULL,
  `tgl_booking` date NOT NULL,
  `username_pelanggan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username_montir` varchar(15) NOT NULL,
  `nopol` varchar(9) NOT NULL,
  `total_biaya` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `username_pelanggan`, `username_montir`, `nopol`, `total_biaya`) VALUES
('b1101', '2024-10-17', 'citra', 'evan', 'A 1234 BC', 45000),
('b1102', '2024-10-17', 'dara', 'evan', 'D 4567 EF', 50000),
('b1103', '2024-10-18', 'dara', 'evan', 'D 4567 EF', 25000),
('b1104', '2024-10-19', 'citra', 'jake', 'A 1234 BC', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `nopol` varchar(9) NOT NULL,
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `merk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) NOT NULL,
  `transmition` enum('manual','auto') NOT NULL,
  `year` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`nopol`, `username`, `merk`, `type`, `transmition`, `year`) VALUES
('A 1234 BC', 'citra', 'Honda', '-', 'manual', 2018),
('D 4567 EF', 'dara', 'Honda', '-', 'manual', 2019);

-- --------------------------------------------------------

--
-- Table structure for table `detail_booking`
--

CREATE TABLE `detail_booking` (
  `id_booking` char(5) NOT NULL,
  `name_pelanggan` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_montir` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `merk` varchar(15) NOT NULL,
  `id_layanan_servis` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_layanan` varchar(50) NOT NULL,
  `subtotal` int NOT NULL,
  `metode_bayar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_booking`
--

INSERT INTO `detail_booking` (`id_booking`, `name_pelanggan`, `nama_montir`, `no_hp`, `merk`, `id_layanan_servis`, `nama_layanan`, `subtotal`, `metode_bayar`) VALUES
('b1101', 'Citra Rahayu', 'Evan', '1234567890', 'Honda', 'LV001', 'Tambal Ban', 25000, 'Tunai'),
('b1101', 'Citra Rahayu', 'Evan', '1234567890', 'Honda', 'LV003', 'Ganti Oli', 20000, 'Tunai'),
('b1103', 'Dara Novia', 'Evan', '09876543', 'Honda', 'LV001', 'Tambal Ban', 25000, 'Transfer'),
('b1102', 'Dara Novia', 'Evan', '09876543', 'Honda', 'LV002', 'Ganti Ban', 50000, 'Transfer'),
('b1104', 'Citra Rahayu', 'Jake Sim', '1234567890', 'Honda', 'LV002', 'Ganti Ban', 50000, 'Tunai');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_servis`
--

CREATE TABLE `jenis_servis` (
  `id_jenis_servis` char(5) NOT NULL,
  `nama_servis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_servis`
--

INSERT INTO `jenis_servis` (`id_jenis_servis`, `nama_servis`) VALUES
('SV111', 'Ban'),
('SV112', 'Oli');

-- --------------------------------------------------------

--
-- Table structure for table `layanan_servis`
--

CREATE TABLE `layanan_servis` (
  `id_jenis_servis` char(5) NOT NULL,
  `id_layanan_servis` char(5) NOT NULL,
  `nama_layanan` varchar(30) NOT NULL,
  `harga_layanan` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `layanan_servis`
--

INSERT INTO `layanan_servis` (`id_jenis_servis`, `id_layanan_servis`, `nama_layanan`, `harga_layanan`) VALUES
('SV111', 'LV001', 'Tambal Ban', 25000),
('SV111', 'LV002', 'Ganti Ban', 50000),
('SV112', 'LV003', 'Ganti Oli', 20000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_montir`
-- (See below for the actual view)
--
CREATE TABLE `view_montir` (
`username_montir` varchar(15)
,`name_montir` tinytext
,`tgl_booking` date
,`total_orders_per_day` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pemasukan`
-- (See below for the actual view)
--
CREATE TABLE `view_pemasukan` (
`tgl_booking` date
,`total_pemasukan` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_riwayat_servis`
-- (See below for the actual view)
--
CREATE TABLE `view_riwayat_servis` (
`username_pelanggan` varchar(15)
,`name_pelanggan` tinytext
,`tgl_booking` date
,`no_hp` varchar(13)
,`merk` varchar(15)
,`nama_layanan` varchar(50)
,`total_biaya` int
,`metode_bayar` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `view_montir`
--
DROP TABLE IF EXISTS `view_montir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_montir`  AS SELECT `a`.`username` AS `username_montir`, `a`.`name` AS `name_montir`, `b`.`tgl_booking` AS `tgl_booking`, count(`b`.`id_booking`) AS `total_orders_per_day` FROM (`account` `a` join `booking` `b` on((`a`.`username` = `b`.`username_montir`))) WHERE (`a`.`role` = 'montir') GROUP BY `a`.`username`, `a`.`name`, `b`.`tgl_booking` ORDER BY `b`.`tgl_booking` DESC, `a`.`username` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_pemasukan`
--
DROP TABLE IF EXISTS `view_pemasukan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pemasukan`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, sum(`b`.`total_biaya`) AS `total_pemasukan` FROM `booking` AS `b` GROUP BY `b`.`tgl_booking` ORDER BY `b`.`tgl_booking` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_riwayat_servis`
--
DROP TABLE IF EXISTS `view_riwayat_servis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_riwayat_servis`  AS SELECT `b`.`username_pelanggan` AS `username_pelanggan`, `d`.`name_pelanggan` AS `name_pelanggan`, `b`.`tgl_booking` AS `tgl_booking`, `d`.`no_hp` AS `no_hp`, `d`.`merk` AS `merk`, `d`.`nama_layanan` AS `nama_layanan`, `b`.`total_biaya` AS `total_biaya`, `d`.`metode_bayar` AS `metode_bayar` FROM (`booking` `b` join `detail_booking` `d` on((`b`.`id_booking` = `d`.`id_booking`))) ORDER BY `b`.`tgl_booking` AS `DESCdesc` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `fk_fpelanggan` (`username_pelanggan`),
  ADD KEY `fk_montir` (`username_montir`),
  ADD KEY `fk_nopol` (`nopol`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`nopol`),
  ADD KEY `fk_akun` (`username`);

--
-- Indexes for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD KEY `fk_id_booking` (`id_booking`),
  ADD KEY `fk_layanan` (`id_layanan_servis`);

--
-- Indexes for table `jenis_servis`
--
ALTER TABLE `jenis_servis`
  ADD PRIMARY KEY (`id_jenis_servis`);

--
-- Indexes for table `layanan_servis`
--
ALTER TABLE `layanan_servis`
  ADD PRIMARY KEY (`id_layanan_servis`),
  ADD KEY `fk_jenis_servis` (`id_jenis_servis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_fpelanggan` FOREIGN KEY (`username_pelanggan`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_montir` FOREIGN KEY (`username_montir`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nopol` FOREIGN KEY (`nopol`) REFERENCES `car` (`nopol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fk_akun` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD CONSTRAINT `fk_id_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_layanan` FOREIGN KEY (`id_layanan_servis`) REFERENCES `layanan_servis` (`id_layanan_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `layanan_servis`
--
ALTER TABLE `layanan_servis`
  ADD CONSTRAINT `fk_jenis_servis` FOREIGN KEY (`id_jenis_servis`) REFERENCES `jenis_servis` (`id_jenis_servis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
