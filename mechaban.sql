-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 27, 2024 at 05:53 PM
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
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_hp` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('Admin','Montir','Customer','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `email`, `no_hp`, `password`, `role`, `photo`) VALUES
('Citra', 'citra@gmail.com', '1234567890', '$2y$10$7cXK7T5GaFHzTQeldeVvquI03Flmd.79u4kX17VW9d1M/.wo8ysmS', 'Admin', NULL),
('Meigita', 'meigita@gmail.com', '777777777777', 'Meigita66', 'Montir', NULL),
('Rahayu', 'rahayu@gmail.com', '1234567999', '$2y$10$22lY5AGyDamPds9bah1mZOsCEbgYF1GJaL.fxoGp6N8gdUxtpZTFK', 'Customer', NULL),
('Sigit Bebas', 'sigit@g.com', '8523645879', 'Asd123@#', 'Customer', NULL),
('Naraya Albani', 'v@g.com', '0852336124', 'Asd123@#', 'Customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `anggota_montir`
--

CREATE TABLE `anggota_montir` (
  `id_anggota_montir` char(5) NOT NULL,
  `nama_anggota_montir` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `anggota_montir`
--

INSERT INTO `anggota_montir` (`id_anggota_montir`, `nama_anggota_montir`, `no_hp`) VALUES
('am001', 'dara', '222222222'),
('am002', 'novia', '888888888'),
('am003', 'nandita', '444444444');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`) VALUES
('bar01', 'x', 15000),
('bar02', 'y', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` char(5) NOT NULL,
  `tgl_booking` date NOT NULL,
  `total_biaya` int DEFAULT NULL,
  `metode_bayar` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nopol` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `total_biaya`, `metode_bayar`, `nopol`) VALUES
('b1101', '2024-10-17', 35000, 'Tunai', 'A 1234 BC'),
('b1102', '2024-10-17', 25000, 'Tunai', 'A 1234 BC'),
('b1103', '2024-10-19', 70000, 'Tunai', 'A 1234 BC');

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
  `email_customer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`nopol`, `merk`, `type`, `transmition`, `year`, `email_customer`) VALUES
('A 1234 BC', 'Honda', '-', 'manual', 2010, 'rahayu@gmail.com'),
('T1234RE', 'Honda', 'Civic', 'auto', 2005, 'sigit@g.com');

-- --------------------------------------------------------

--
-- Table structure for table `detail_booking`
--

CREATE TABLE `detail_booking` (
  `id_detail_booking` char(5) NOT NULL,
  `id_booking` char(5) NOT NULL,
  `id_layanan_servis` char(5) NOT NULL,
  `id_barang` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `subtotal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_booking`
--

INSERT INTO `detail_booking` (`id_detail_booking`, `id_booking`, `id_layanan_servis`, `id_barang`, `subtotal`) VALUES
('db001', 'b1101', 'LV001', 'bar01', 35000),
('db002', 'b1102', 'LV002', NULL, 25000),
('db003', 'b1103', 'LV002', 'bar01', 40000),
('db004', 'b1103', 'LV003', NULL, 30000);

--
-- Triggers `detail_booking`
--
DELIMITER $$
CREATE TRIGGER `jumlahkan_subtotal_dan_harga_barang` BEFORE INSERT ON `detail_booking` FOR EACH ROW BEGIN
	DECLARE v_harga_layanan INT;
    DECLARE v_harga_barang INT;
    
    -- Mengambil harga layanan
    SELECT harga_layanan INTO v_harga_layanan
    FROM layanan_servis 
    WHERE id_layanan_servis = NEW.id_layanan_servis;
    
    -- Mengambil harga barang jika ada
    IF NEW.id_barang IS NOT NULL THEN
        SELECT harga INTO v_harga_barang
        FROM barang 
        WHERE id_barang = NEW.id_barang;
    ELSE
        SET v_harga_barang = 0;
    END IF;
    
    -- Set subtotal sebelum data diinsert
    SET NEW.subtotal = v_harga_layanan + v_harga_barang;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_total_biaya` AFTER INSERT ON `detail_booking` FOR EACH ROW BEGIN
    DECLARE total INT;

    -- Hitung total biaya dari semua subtotal berdasarkan id_booking terkait
    SELECT SUM(subtotal) INTO total
    FROM detail_booking
    WHERE id_booking = NEW.id_booking;

    -- Update kolom total_biaya di tabel booking
    UPDATE booking
    SET total_biaya = total
    WHERE id_booking = NEW.id_booking;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis_montir`
--

CREATE TABLE `detail_servis_montir` (
  `id_det_servis_montir` char(7) NOT NULL,
  `id_booking` char(5) NOT NULL,
  `id_ketua_montir` char(5) NOT NULL,
  `id_anggota_montir` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_servis_montir`
--

INSERT INTO `detail_servis_montir` (`id_det_servis_montir`, `id_booking`, `id_ketua_montir`, `id_anggota_montir`) VALUES
('mont01', 'b1101', 'mon01', 'am001'),
('mont02', 'b1101', 'mon01', 'am002'),
('mont03', 'b1102', 'mon01', 'am003'),
('mont04', 'b1102', 'mon01', 'am002'),
('mont05', 'b1103', 'mon01', 'am001'),
('mont06', 'b1103', 'mon01', 'am003');

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
-- Table structure for table `ketua_montir`
--

CREATE TABLE `ketua_montir` (
  `id_ketua_montir` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_ketua_montir` varchar(40) NOT NULL,
  `email_ketua_montir` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ketua_montir`
--

INSERT INTO `ketua_montir` (`id_ketua_montir`, `nama_ketua_montir`, `email_ketua_montir`, `no_hp`) VALUES
('mon01', 'Meigita', 'meigita@gmail.com', '');

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
-- Stand-in structure for view `view_montir_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_montir_orders` (
`id_montir` char(5)
,`nama_montir` varchar(40)
,`status_montir` varchar(7)
,`tgl_booking` date
,`total_order` bigint
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
-- Stand-in structure for view `view_riwayat`
-- (See below for the actual view)
--
CREATE TABLE `view_riwayat` (
`barang` text
,`layanan` text
,`nama_customer` varchar(40)
,`tgl_booking` date
,`total` decimal(32,0)
,`total_booking` bigint
);

-- --------------------------------------------------------

--
-- Structure for view `view_montir_orders`
--
DROP TABLE IF EXISTS `view_montir_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_montir_orders`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `km`.`id_ketua_montir` AS `id_montir`, `km`.`nama_ketua_montir` AS `nama_montir`, 'ketua' AS `status_montir`, count(distinct `b`.`id_booking`) AS `total_order` FROM ((`booking` `b` join `detail_servis_montir` `ds` on((`b`.`id_booking` = `ds`.`id_booking`))) join `ketua_montir` `km` on((`ds`.`id_ketua_montir` = `km`.`id_ketua_montir`))) GROUP BY `b`.`tgl_booking`, `km`.`id_ketua_montir`, `km`.`nama_ketua_montir` union all select `b`.`tgl_booking` AS `tgl_booking`,`am`.`id_anggota_montir` AS `id_montir`,`am`.`nama_anggota_montir` AS `nama_montir`,'anggota' AS `status_montir`,count(distinct `b`.`id_booking`) AS `total_order` from ((`booking` `b` join `detail_servis_montir` `ds` on((`b`.`id_booking` = `ds`.`id_booking`))) join `anggota_montir` `am` on((`ds`.`id_anggota_montir` = `am`.`id_anggota_montir`))) group by `b`.`tgl_booking`,`am`.`id_anggota_montir`,`am`.`nama_anggota_montir` order by `tgl_booking` desc  ;

-- --------------------------------------------------------

--
-- Structure for view `view_pemasukan`
--
DROP TABLE IF EXISTS `view_pemasukan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pemasukan`  AS SELECT `booking`.`tgl_booking` AS `tgl_booking`, sum(`booking`.`total_biaya`) AS `total_pemasukan` FROM `booking` GROUP BY `booking`.`tgl_booking` ORDER BY `booking`.`tgl_booking` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_riwayat`
--
DROP TABLE IF EXISTS `view_riwayat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_riwayat`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `a`.`name` AS `nama_customer`, count(`b`.`id_booking`) AS `total_booking`, sum(`db`.`subtotal`) AS `total`, group_concat(distinct `lv`.`nama_layanan` order by `lv`.`nama_layanan` ASC separator ', ') AS `layanan`, group_concat(distinct `bar`.`nama_barang` order by `bar`.`nama_barang` ASC separator ', ') AS `barang` FROM (((((`booking` `b` join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) join `account` `a` on((`c`.`email_customer` = `a`.`email`))) join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) join `layanan_servis` `lv` on((`db`.`id_layanan_servis` = `lv`.`id_layanan_servis`))) left join `barang` `bar` on((`db`.`id_barang` = `bar`.`id_barang`))) WHERE (`a`.`role` = 'Customer') GROUP BY `b`.`tgl_booking`, `a`.`name` ORDER BY `b`.`tgl_booking` AS `DESCdesc` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `anggota_montir`
--
ALTER TABLE `anggota_montir`
  ADD PRIMARY KEY (`id_anggota_montir`);

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
  ADD KEY `id_account` (`email_customer`);

--
-- Indexes for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD PRIMARY KEY (`id_detail_booking`),
  ADD KEY `id_booking` (`id_booking`,`id_layanan_servis`,`id_barang`),
  ADD KEY `fk_layanan` (`id_layanan_servis`),
  ADD KEY `fk_barang` (`id_barang`);

--
-- Indexes for table `detail_servis_montir`
--
ALTER TABLE `detail_servis_montir`
  ADD PRIMARY KEY (`id_det_servis_montir`),
  ADD KEY `fk_ketua` (`id_ketua_montir`),
  ADD KEY `fk_anggota` (`id_anggota_montir`),
  ADD KEY `fk_id_booking` (`id_booking`);

--
-- Indexes for table `jenis_servis`
--
ALTER TABLE `jenis_servis`
  ADD PRIMARY KEY (`id_jenis_servis`);

--
-- Indexes for table `ketua_montir`
--
ALTER TABLE `ketua_montir`
  ADD PRIMARY KEY (`id_ketua_montir`),
  ADD KEY `email` (`email_ketua_montir`);

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
  ADD CONSTRAINT `fk_nopol` FOREIGN KEY (`nopol`) REFERENCES `car` (`nopol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `fk_account_car` FOREIGN KEY (`email_customer`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_layanan` FOREIGN KEY (`id_layanan_servis`) REFERENCES `layanan_servis` (`id_layanan_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_servis_montir`
--
ALTER TABLE `detail_servis_montir`
  ADD CONSTRAINT `fk_anggota` FOREIGN KEY (`id_anggota_montir`) REFERENCES `anggota_montir` (`id_anggota_montir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ketua` FOREIGN KEY (`id_ketua_montir`) REFERENCES `ketua_montir` (`id_ketua_montir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ketua_montir`
--
ALTER TABLE `ketua_montir`
  ADD CONSTRAINT `fk_account_montir` FOREIGN KEY (`email_ketua_montir`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `layanan_servis`
--
ALTER TABLE `layanan_servis`
  ADD CONSTRAINT `fk_jenis_servis` FOREIGN KEY (`id_jenis_servis`) REFERENCES `jenis_servis` (`id_jenis_servis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
