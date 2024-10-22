-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2024 at 05:24 PM
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
  `id_account` char(5) NOT NULL,
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

INSERT INTO `account` (`id_account`, `name`, `email`, `no_hp`, `password`, `role`, `photo`) VALUES
('ACBY', 'Rahayu', 'rahayu@gmail.com', '034567899', 'rahayuu', 'montir', NULL),
('KAEUZ', 'Citra', 'citra@gmail.com', '12345678', '123', 'customer', NULL),
('QOSGN', 'Dara', 'dara@gmail.com', '098765', 'daradara', 'customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` char(5) NOT NULL,
  `tgl_booking` date NOT NULL,
  `total_biaya` int NOT NULL,
  `metode_bayar` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nopol` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `total_biaya`, `metode_bayar`, `nopol`) VALUES
('b1102', '2024-10-17', 45000, 'Tunai', 'A 1234 BC');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `nopol` varchar(9) NOT NULL,
  `merk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `transmition` enum('manual','auto') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` year NOT NULL,
  `id_account` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`nopol`, `merk`, `type`, `transmition`, `year`, `id_account`) VALUES
('A 1234 BC', 'Honda', '-', 'manual', 2018, 'KAEUZ');

-- --------------------------------------------------------

--
-- Table structure for table `detail_booking`
--

CREATE TABLE `detail_booking` (
  `id_detail_booking` char(5) NOT NULL,
  `id_booking` char(5) NOT NULL,
  `id_montir` char(5) NOT NULL,
  `id_layanan_servis` char(5) NOT NULL,
  `id_barang` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `subtotal` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_booking`
--

INSERT INTO `detail_booking` (`id_detail_booking`, `id_booking`, `id_montir`, `id_layanan_servis`, `id_barang`, `subtotal`) VALUES
('BK001', 'b1102', 'MON01', 'LV001', NULL, 20000),
('BK002', 'b1102', 'MON01', 'LV002', NULL, 25000);

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
('SV111', 'LV001', 'Tambal Ban', 20000),
('SV111', 'LV002', 'Gant Ban', 25000),
('SV112', 'LV003', 'Ganti Oli', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `montir`
--

CREATE TABLE `montir` (
  `id_montir` char(5) NOT NULL,
  `id_account` char(5) NOT NULL,
  `nama_montir` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `password` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `montir`
--

INSERT INTO `montir` (`id_montir`, `id_account`, `nama_montir`, `email`, `no_hp`, `password`) VALUES
('MON01', 'ACBY', 'Rahayu', 'rahayu@gmail.com', '09876543', 'rahayuu');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_montir`
-- (See below for the actual view)
--
CREATE TABLE `view_montir` (
`id_montir` char(5)
,`nama_montir` tinytext
,`tgl_booking` date
,`total_order` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_penghasilan_perhari`
-- (See below for the actual view)
--
CREATE TABLE `view_penghasilan_perhari` (
`tgl_booking` date
,`total_penghasilan` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_riwayat_customer`
-- (See below for the actual view)
--
CREATE TABLE `view_riwayat_customer` (
`id_customer` char(5)
,`merk` varchar(20)
,`nama_customer` tinytext
,`nama_layanan` varchar(30)
,`nopol` varchar(9)
,`subtotal` int
,`tgl_booking` date
,`type` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `view_montir`
--
DROP TABLE IF EXISTS `view_montir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_montir`  AS SELECT `m`.`id_montir` AS `id_montir`, `m`.`nama_montir` AS `nama_montir`, `b`.`tgl_booking` AS `tgl_booking`, count(`b`.`id_booking`) AS `total_order` FROM ((`montir` `m` join `detail_booking` `db` on((`m`.`id_montir` = `db`.`id_montir`))) join `booking` `b` on((`db`.`id_booking` = `b`.`id_booking`))) GROUP BY `m`.`id_montir`, `m`.`nama_montir`, `b`.`tgl_booking``tgl_booking`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_penghasilan_perhari`
--
DROP TABLE IF EXISTS `view_penghasilan_perhari`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_penghasilan_perhari`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, sum(`db`.`subtotal`) AS `total_penghasilan` FROM (`booking` `b` join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) GROUP BY `b`.`tgl_booking``tgl_booking`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_riwayat_customer`
--
DROP TABLE IF EXISTS `view_riwayat_customer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_riwayat_customer`  AS SELECT `a`.`id_account` AS `id_customer`, `a`.`name` AS `nama_customer`, `b`.`tgl_booking` AS `tgl_booking`, `b`.`nopol` AS `nopol`, `c`.`merk` AS `merk`, `c`.`type` AS `type`, `ls`.`nama_layanan` AS `nama_layanan`, `db`.`subtotal` AS `subtotal` FROM ((((`account` `a` join `car` `c` on((`a`.`id_account` = `c`.`id_account`))) join `booking` `b` on((`c`.`nopol` = `b`.`nopol`))) join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) join `layanan_servis` `ls` on((`db`.`id_layanan_servis` = `ls`.`id_layanan_servis`))) WHERE (`a`.`role` = 'customer')  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `nopol` (`nopol`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`nopol`),
  ADD KEY `id_account` (`id_account`);

--
-- Indexes for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD PRIMARY KEY (`id_detail_booking`),
  ADD KEY `id_booking` (`id_booking`,`id_montir`,`id_layanan_servis`,`id_barang`),
  ADD KEY `fk_layanan` (`id_layanan_servis`),
  ADD KEY `fk_barang` (`id_barang`),
  ADD KEY `fk_montir` (`id_montir`);

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
-- Indexes for table `montir`
--
ALTER TABLE `montir`
  ADD PRIMARY KEY (`id_montir`),
  ADD KEY `fk_akun` (`id_account`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `fk_nopol` FOREIGN KEY (`nopol`) REFERENCES `car` (`nopol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_layanan` FOREIGN KEY (`id_layanan_servis`) REFERENCES `layanan_servis` (`id_layanan_servis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_montir` FOREIGN KEY (`id_montir`) REFERENCES `montir` (`id_montir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `layanan_servis`
--
ALTER TABLE `layanan_servis`
  ADD CONSTRAINT `fk_jenis_servis` FOREIGN KEY (`id_jenis_servis`) REFERENCES `jenis_servis` (`id_jenis_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `montir`
--
ALTER TABLE `montir`
  ADD CONSTRAINT `fk_akun` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
