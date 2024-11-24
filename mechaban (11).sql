-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2024 at 09:03 AM
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
  `role` enum('customer','montir','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `email`, `no_hp`, `password`, `role`, `photo`) VALUES
('Aza', 'aza@gmail.com', '23456', '3333', 'montir', NULL),
('citra', 'citra@gmail.com', '098765', '$2y$10$08XDnAW1SkafxrVENiNOY.LEbcapRxD1cRfMsjAcM8tFs9PJNR71y', 'montir', NULL),
('Danial', 'danial@gmail.com', '666666666', '$2y$10$b1xTQu64w6ORKa4bRGDPaOuRx0gmRZXqs9c137H4IJa/CmeEHqBYy', 'admin', NULL),
('Keke', 'keke@gmail.com', '098765', '1234', 'montir', NULL),
('lili', 'lili@gmail.com', '88888888', '$2y$10$xqJfo4r8KA5kyHKj1F/NYeJ8ZEYY9GPAB0BiCCh92mQLpW.KU.MUi', 'customer', NULL),
('Naila', 'naila@gmail.com', '1234567', '2222', 'montir', NULL),
('Naraya Albani', 'naraya.albani@gmail.com', '83832566069', 'Asd123@#', 'customer', 'naraya_albani.jpg'),
('Rahayu', 'rahayu@gmail.com', '098765', '$2y$10$Vs4zTq4GKjKnlCxNJco5WuJBGSX./tyAHSsXPy30opR91qYEdlca2', 'customer', NULL),
('Sigit Bebas', 'sigit@g.com', '8523645879', 'Asd123@#', 'customer', NULL),
('Naraya Albani', 'v@g.com', '0852336124', 'Asd123@#', 'customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `anggota_montir`
--

CREATE TABLE `anggota_montir` (
  `id_det_servis_montir` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_anggota_montir` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `anggota_montir`
--

INSERT INTO `anggota_montir` (`id_det_servis_montir`, `email_anggota_montir`) VALUES
('DSMjan2966', 'citra@gmail.com'),
('DSMkiw1627', 'aza@gmail.com'),
('DSMkiw1627', 'citra@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `harga` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`) VALUES
('BRalz1092', 'barang 2', 15000),
('BRqiy1734', 'barang 1', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tgl_booking` datetime NOT NULL,
  `total_biaya` int DEFAULT NULL,
  `metode_bayar` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nopol` varchar(9) NOT NULL,
  `status_bayar` enum('belum','sudah') NOT NULL,
  `status_pengerjaan` enum('pending','diterima','dikerjakan','selesai') NOT NULL,
  `latitude` double(9,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `total_biaya`, `metode_bayar`, `nopol`, `status_bayar`, `status_pengerjaan`, `latitude`, `longitude`) VALUES
('20241124145629AB1244O', '2024-11-24 14:56:29', 62346, 'Tunai', 'AB1244O', 'belum', 'pending', -8.161064, 113.723329),
('20241124154435N1567WR', '2024-11-24 15:44:35', 27346, 'Tunai', 'N1567WR', 'belum', 'pending', -8.161138, 113.723308),
('20241124160147K9967RT', '2024-11-24 16:01:47', 132400, 'Tunai', 'K9967RT', 'belum', 'pending', -8.161138, 113.723308);

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nopol` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `merk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `transmition` enum('manual','auto') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` year NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `email_customer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`created`, `nopol`, `merk`, `type`, `transmition`, `year`, `status`, `email_customer`) VALUES
('2024-11-16 02:18:36', 'AB1244O', 'Honda', 'Honda', 'manual', 2011, 0, 'rahayu@gmail.com'),
('2024-11-17 07:44:26', 'AB2346K', 'Honda', 'Honda', 'manual', 2011, 0, 'rahayu@gmail.com'),
('2024-11-21 11:18:21', 'GE5669SD', 'Suzuki', 'Vario', 'auto', 1998, 0, 'naraya.albani@gmail.com'),
('2024-11-24 09:01:10', 'K9967RT', 'Fanta', 'fanta', 'manual', 2018, NULL, 'rahayu@gmail.com'),
('2024-11-24 08:44:11', 'N1567WR', 'Honda', 'honda', 'auto', 2019, NULL, 'lili@gmail.com'),
('2024-11-24 08:43:34', 'P8712FK', 'Fanta', 'fanta', 'auto', 2007, NULL, 'lili@gmail.com'),
('2024-11-21 07:50:25', 'S1164GHJ', 'Honda', 'Sedan', 'auto', 2019, 0, 'naraya.albani@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `data_komponen`
--

CREATE TABLE `data_komponen` (
  `id_data_komponen` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_komponen` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data_komponen`
--

INSERT INTO `data_komponen` (`id_data_komponen`, `nama_komponen`) VALUES
('DWI123', 'Ban'),
('SDW143', 'Oli');

-- --------------------------------------------------------

--
-- Table structure for table `data_servis`
--

CREATE TABLE `data_servis` (
  `id_data_servis` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_servis` varchar(30) NOT NULL,
  `harga_servis` int NOT NULL,
  `id_data_komponen` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data_servis`
--

INSERT INTO `data_servis` (`id_data_servis`, `nama_servis`, `harga_servis`, `id_data_komponen`) VALUES
('DSerq1775', 'Ganti ban', 12346, 'DWI123'),
('DSwkp9617', 'Tambah oli', 132400, 'SDW143'),
('DSxye3340', 'Ganti oli', 12000, 'SDW143');

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang_booking`
--

CREATE TABLE `detail_barang_booking` (
  `id_det_barang_booking` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_detail_booking` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_barang` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jumlah_barang` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_barang_booking`
--

INSERT INTO `detail_barang_booking` (`id_det_barang_booking`, `id_detail_booking`, `id_barang`, `jumlah_barang`) VALUES
('BRqwu1690', '154435N1567WR', 'BRalz1092', 1),
('BRtie1589', '145629AB1244O', 'BRalz1092', 2),
('BRtsu5622', '145629AB1244O', 'BRqiy1734', 2);

--
-- Triggers `detail_barang_booking`
--
DELIMITER $$
CREATE TRIGGER `trg_update_subtotal_after_barang` AFTER INSERT ON `detail_barang_booking` FOR EACH ROW BEGIN
    DECLARE total_barang DECIMAL(10, 2);
    DECLARE total_servis DECIMAL(10, 2);
    
    -- Hitung total harga barang berdasarkan id_detail_booking
    SELECT COALESCE(SUM(b.harga * dbb.jumlah_barang), 0)
    INTO total_barang
    FROM detail_barang_booking dbb
    JOIN barang b ON dbb.id_barang = b.id_barang
    WHERE dbb.id_detail_booking = NEW.id_detail_booking;
    
    -- Hitung total harga servis berdasarkan id_detail_booking
    SELECT COALESCE(SUM(ds.harga_servis), 0)
    INTO total_servis
    FROM detail_servis_booking dsb
    JOIN data_servis ds ON dsb.id_data_servis = ds.id_data_servis
    WHERE dsb.id_detail_booking = NEW.id_detail_booking;
    
    -- Update subtotal di tabel detail_booking setelah semua barang dan servis dihitung
    UPDATE detail_booking
    SET subtotal = total_barang + total_servis
    WHERE id_detail_booking = NEW.id_detail_booking;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_booking`
--

CREATE TABLE `detail_booking` (
  `id_detail_booking` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_booking` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subtotal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_booking`
--

INSERT INTO `detail_booking` (`id_detail_booking`, `id_booking`, `subtotal`) VALUES
('145629AB1244O', '20241124145629AB1244O', 62346),
('154435N1567WR', '20241124154435N1567WR', 27346),
('160147K9967RT', '20241124160147K9967RT', 132400);

--
-- Triggers `detail_booking`
--
DELIMITER $$
CREATE TRIGGER `trg_update_total_biaya` AFTER UPDATE ON `detail_booking` FOR EACH ROW BEGIN
    DECLARE total DECIMAL(10, 2);
    
    -- Hitung total biaya berdasarkan subtotal di detail_booking
    SELECT COALESCE(SUM(subtotal), 0)
    INTO total
    FROM detail_booking
    WHERE id_booking = NEW.id_booking;
    
    -- Update total_biaya di tabel booking
    UPDATE booking
    SET total_biaya = total
    WHERE id_booking = NEW.id_booking;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis_booking`
--

CREATE TABLE `detail_servis_booking` (
  `id_detail_booking` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_data_servis` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_servis_booking`
--

INSERT INTO `detail_servis_booking` (`id_detail_booking`, `id_data_servis`) VALUES
('145629AB1244O', 'DSerq1775'),
('154435N1567WR', 'DSerq1775'),
('160147K9967RT', 'DSwkp9617');

--
-- Triggers `detail_servis_booking`
--
DELIMITER $$
CREATE TRIGGER `trg_update_subtotal_after_servis` AFTER INSERT ON `detail_servis_booking` FOR EACH ROW BEGIN
    DECLARE total_barang DECIMAL(10, 2);
    DECLARE total_servis DECIMAL(10, 2);
    
    -- Hitung total harga barang berdasarkan id_detail_booking
    SELECT COALESCE(SUM(b.harga * dbb.jumlah_barang), 0)
    INTO total_barang
    FROM detail_barang_booking dbb
    JOIN barang b ON dbb.id_barang = b.id_barang
    WHERE dbb.id_detail_booking = NEW.id_detail_booking;
    
    -- Hitung total harga servis berdasarkan id_detail_booking
    SELECT COALESCE(SUM(ds.harga_servis), 0)
    INTO total_servis
    FROM detail_servis_booking dsb
    JOIN data_servis ds ON dsb.id_data_servis = ds.id_data_servis
    WHERE dsb.id_detail_booking = NEW.id_detail_booking;
    
    -- Update subtotal di tabel detail_booking setelah semua barang dan servis dihitung
    UPDATE detail_booking
    SET subtotal = total_barang + total_servis
    WHERE id_detail_booking = NEW.id_detail_booking;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis_montir`
--

CREATE TABLE `detail_servis_montir` (
  `id_det_servis_montir` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_detail_booking` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_ketua_montir` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_servis_montir`
--

INSERT INTO `detail_servis_montir` (`id_det_servis_montir`, `id_detail_booking`, `email_ketua_montir`) VALUES
('DSMjan2966', '145629AB1244O', 'aza@gmail.com'),
('DSMkiw1627', '154435N1567WR', 'naila@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `email` varchar(100) NOT NULL,
  `otp_code` char(4) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_customer`
--

CREATE TABLE `review_customer` (
  `id_review` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_customer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teks_review` varchar(500) NOT NULL,
  `rating` int NOT NULL,
  `tgl_review` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `riwayatbooking`
-- (See below for the actual view)
--
CREATE TABLE `riwayatbooking` (
`barang` text
,`jumlah_barang` decimal(32,0)
,`merk_mobil` varchar(20)
,`nama_customer` varchar(40)
,`nopol` varchar(9)
,`servis` text
,`tgl_booking` datetime
,`total_biaya` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_booking_details`
-- (See below for the actual view)
--
CREATE TABLE `view_booking_details` (
`email` varchar(30)
,`harga_servis` int
,`id_booking` char(23)
,`latitude` double(9,6)
,`longitude` double(9,6)
,`merk` varchar(20)
,`metode_bayar` varchar(15)
,`nama_servis` varchar(30)
,`name` varchar(40)
,`no_hp` varchar(13)
,`nopol` varchar(9)
,`status_bayar` enum('belum','sudah')
,`status_pengerjaan` enum('pending','diterima','dikerjakan','selesai')
,`subtotal` int
,`tgl_booking` datetime
,`total_biaya` int
,`transmition` enum('manual','auto')
,`type` varchar(20)
,`year` year
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_booking_servis`
-- (See below for the actual view)
--
CREATE TABLE `view_booking_servis` (
`id_booking` char(23)
,`id_data_servis` text
,`latitude` double(9,6)
,`longitude` double(9,6)
,`nama_customer` varchar(40)
,`nopol` varchar(9)
,`tgl_booking` datetime
,`total_harga` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_order_montir`
-- (See below for the actual view)
--
CREATE TABLE `view_order_montir` (
`email_montir` varchar(30)
,`nama_montir` varchar(40)
,`status_montir` varchar(7)
,`tgl_booking` datetime
,`total_order` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_pemasukan`
-- (See below for the actual view)
--
CREATE TABLE `view_pemasukan` (
`tgl_booking` datetime
,`total_pemasukan` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_servis`
-- (See below for the actual view)
--
CREATE TABLE `view_servis` (
`harga_servis` int
,`id_data_servis` char(9)
,`nama_komponen` varchar(30)
,`nama_servis` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `riwayatbooking`
--
DROP TABLE IF EXISTS `riwayatbooking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `riwayatbooking`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `a`.`name` AS `nama_customer`, `c`.`nopol` AS `nopol`, `c`.`merk` AS `merk_mobil`, group_concat(distinct `bar`.`nama_barang` order by `bar`.`nama_barang` ASC separator ', ') AS `barang`, sum(`dbb`.`jumlah_barang`) AS `jumlah_barang`, group_concat(distinct `ds`.`nama_servis` order by `ds`.`nama_servis` ASC separator ', ') AS `servis`, sum(`db`.`subtotal`) AS `total_biaya` FROM (((((((`booking` `b` join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) join `account` `a` on((`c`.`email_customer` = `a`.`email`))) join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) left join `detail_barang_booking` `dbb` on((`db`.`id_detail_booking` = `dbb`.`id_detail_booking`))) left join `barang` `bar` on((`dbb`.`id_barang` = `bar`.`id_barang`))) left join `detail_servis_booking` `dsb` on((`db`.`id_detail_booking` = `dsb`.`id_detail_booking`))) left join `data_servis` `ds` on((`dsb`.`id_data_servis` = `ds`.`id_data_servis`))) WHERE (`a`.`role` = 'Customer') GROUP BY `b`.`tgl_booking`, `a`.`name`, `c`.`nopol`, `c`.`merk` ORDER BY `b`.`tgl_booking` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_booking_details`
--
DROP TABLE IF EXISTS `view_booking_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_booking_details`  AS SELECT `b`.`id_booking` AS `id_booking`, `b`.`tgl_booking` AS `tgl_booking`, `a`.`name` AS `name`, `a`.`email` AS `email`, `a`.`no_hp` AS `no_hp`, `b`.`nopol` AS `nopol`, `c`.`merk` AS `merk`, `c`.`type` AS `type`, `c`.`transmition` AS `transmition`, `c`.`year` AS `year`, `b`.`metode_bayar` AS `metode_bayar`, `b`.`status_bayar` AS `status_bayar`, `b`.`status_pengerjaan` AS `status_pengerjaan`, `b`.`latitude` AS `latitude`, `b`.`longitude` AS `longitude`, `ds`.`nama_servis` AS `nama_servis`, `ds`.`harga_servis` AS `harga_servis`, `db`.`subtotal` AS `subtotal`, `b`.`total_biaya` AS `total_biaya` FROM (((((`booking` `b` join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) join `detail_servis_booking` `dsb` on((`db`.`id_detail_booking` = `dsb`.`id_detail_booking`))) join `data_servis` `ds` on((`dsb`.`id_data_servis` = `ds`.`id_data_servis`))) join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) join `account` `a` on((`c`.`email_customer` = `a`.`email`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_booking_servis`
--
DROP TABLE IF EXISTS `view_booking_servis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_booking_servis`  AS SELECT `b`.`id_booking` AS `id_booking`, `b`.`tgl_booking` AS `tgl_booking`, `b`.`nopol` AS `nopol`, `a`.`name` AS `nama_customer`, group_concat(`dsb`.`id_data_servis` order by `dsb`.`id_data_servis` ASC separator ', ') AS `id_data_servis`, coalesce(sum(`ds`.`harga_servis`),0) AS `total_harga`, `b`.`latitude` AS `latitude`, `b`.`longitude` AS `longitude` FROM (((((`booking` `b` join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) join `account` `a` on((`c`.`email_customer` = `a`.`email`))) join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) join `detail_servis_booking` `dsb` on((`db`.`id_detail_booking` = `dsb`.`id_detail_booking`))) join `data_servis` `ds` on((`dsb`.`id_data_servis` = `ds`.`id_data_servis`))) GROUP BY `b`.`id_booking`, `b`.`tgl_booking`, `b`.`nopol`, `a`.`name`, `b`.`latitude`, `b`.`longitude``longitude`  ;

-- --------------------------------------------------------

--
-- Structure for view `view_order_montir`
--
DROP TABLE IF EXISTS `view_order_montir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_montir`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `dsm`.`email_ketua_montir` AS `email_montir`, `a`.`name` AS `nama_montir`, 'Ketua' AS `status_montir`, count(distinct `db`.`id_detail_booking`) AS `total_order` FROM (((`detail_booking` `db` join `booking` `b` on((`db`.`id_booking` = `b`.`id_booking`))) join `detail_servis_montir` `dsm` on((`db`.`id_detail_booking` = `dsm`.`id_detail_booking`))) join `account` `a` on((`a`.`email` = `dsm`.`email_ketua_montir`))) GROUP BY `b`.`tgl_booking`, `dsm`.`email_ketua_montir`, `a`.`name` union all select `b`.`tgl_booking` AS `tgl_booking`,`am`.`email_anggota_montir` AS `email_montir`,`a`.`name` AS `nama_montir`,'Anggota' AS `status_montir`,count(distinct `db`.`id_detail_booking`) AS `total_order` from ((((`detail_booking` `db` join `booking` `b` on((`db`.`id_booking` = `b`.`id_booking`))) join `detail_servis_montir` `dsm` on((`db`.`id_detail_booking` = `dsm`.`id_detail_booking`))) join `anggota_montir` `am` on((`dsm`.`id_det_servis_montir` = `am`.`id_det_servis_montir`))) join `account` `a` on((`a`.`email` = `am`.`email_anggota_montir`))) group by `b`.`tgl_booking`,`am`.`email_anggota_montir`,`a`.`name` order by `tgl_booking` desc  ;

-- --------------------------------------------------------

--
-- Structure for view `view_pemasukan`
--
DROP TABLE IF EXISTS `view_pemasukan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pemasukan`  AS SELECT `booking`.`tgl_booking` AS `tgl_booking`, sum(`booking`.`total_biaya`) AS `total_pemasukan` FROM `booking` GROUP BY `booking`.`tgl_booking` ORDER BY `booking`.`tgl_booking` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_servis`
--
DROP TABLE IF EXISTS `view_servis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_servis`  AS SELECT `s`.`id_data_servis` AS `id_data_servis`, `s`.`nama_servis` AS `nama_servis`, `s`.`harga_servis` AS `harga_servis`, `k`.`nama_komponen` AS `nama_komponen` FROM (`data_servis` `s` join `data_komponen` `k` on((`s`.`id_data_komponen` = `k`.`id_data_komponen`)))  ;

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
  ADD KEY `email_anggota_montir` (`email_anggota_montir`),
  ADD KEY `id_det_servis_montir` (`id_det_servis_montir`);

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
-- Indexes for table `data_komponen`
--
ALTER TABLE `data_komponen`
  ADD PRIMARY KEY (`id_data_komponen`);

--
-- Indexes for table `data_servis`
--
ALTER TABLE `data_servis`
  ADD PRIMARY KEY (`id_data_servis`),
  ADD KEY `id_data_komponen` (`id_data_komponen`);

--
-- Indexes for table `detail_barang_booking`
--
ALTER TABLE `detail_barang_booking`
  ADD PRIMARY KEY (`id_det_barang_booking`),
  ADD KEY `fk_booking_det` (`id_detail_booking`),
  ADD KEY `fk_barang` (`id_barang`);

--
-- Indexes for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD PRIMARY KEY (`id_detail_booking`),
  ADD KEY `id_booking` (`id_booking`);

--
-- Indexes for table `detail_servis_booking`
--
ALTER TABLE `detail_servis_booking`
  ADD KEY `id_detail_booking` (`id_detail_booking`,`id_data_servis`),
  ADD KEY `id_data_servis` (`id_data_servis`);

--
-- Indexes for table `detail_servis_montir`
--
ALTER TABLE `detail_servis_montir`
  ADD PRIMARY KEY (`id_det_servis_montir`),
  ADD KEY `fk_det_booking` (`id_detail_booking`),
  ADD KEY `fk_ketua_montir` (`email_ketua_montir`);

--
-- Indexes for table `review_customer`
--
ALTER TABLE `review_customer`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `fk_email_cus` (`email_customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_montir`
--
ALTER TABLE `anggota_montir`
  ADD CONSTRAINT `anggota_montir_ibfk_2` FOREIGN KEY (`email_anggota_montir`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_det_servis_montir` FOREIGN KEY (`id_det_servis_montir`) REFERENCES `detail_servis_montir` (`id_det_servis_montir`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `data_servis`
--
ALTER TABLE `data_servis`
  ADD CONSTRAINT `fk_komponen` FOREIGN KEY (`id_data_komponen`) REFERENCES `data_komponen` (`id_data_komponen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_barang_booking`
--
ALTER TABLE `detail_barang_booking`
  ADD CONSTRAINT `detail_barang_booking_ibfk_1` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD CONSTRAINT `detail_booking_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_servis_booking`
--
ALTER TABLE `detail_servis_booking`
  ADD CONSTRAINT `detail_servis_booking_ibfk_3` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servis` FOREIGN KEY (`id_data_servis`) REFERENCES `data_servis` (`id_data_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_servis_montir`
--
ALTER TABLE `detail_servis_montir`
  ADD CONSTRAINT `detail_servis_montir_ibfk_1` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ketua_montir` FOREIGN KEY (`email_ketua_montir`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_customer`
--
ALTER TABLE `review_customer`
  ADD CONSTRAINT `fk_email_cus` FOREIGN KEY (`email_customer`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
