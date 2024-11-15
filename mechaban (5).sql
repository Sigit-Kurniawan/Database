-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 15, 2024 at 10:30 PM
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
('Naraya Albani', 'albani@gmail.com', '08123123123', '$2y$10$my8fPqd4z5piw5LXP5rsT.TED3z4JU2O/ooUtQY7.1dnhLmOwPFy2', 'customer', NULL),
('citra', 'citra@gmail.com', '098765', '$2y$10$08XDnAW1SkafxrVENiNOY.LEbcapRxD1cRfMsjAcM8tFs9PJNR71y', 'customer', NULL),
('Danial', 'danial@gmail.com', '666666666', '$2y$10$b1xTQu64w6ORKa4bRGDPaOuRx0gmRZXqs9c137H4IJa/CmeEHqBYy', 'admin', NULL),
('lili', 'lili@gmail.com', '88888888', '$2y$10$xqJfo4r8KA5kyHKj1F/NYeJ8ZEYY9GPAB0BiCCh92mQLpW.KU.MUi', 'customer', NULL),
('tes', 'n@gmail.com', '123', '$2y$10$ODyMI5nh0rqNiHkDuny9Pep.VcDoLoy4qRWNHJGTgjj1sjwZNVB12', 'customer', NULL),
('Naraya Albani', 'naraya.albani@gmail.com', '83832566069', '', 'customer', 'naraya_albani.jpg'),
('Naraya', 'naraya@gmail.com', '23456789', '$2y$10$FNirsullykq.5ZmOS0j0BurkzPbxFjr4s0yEBFlA44uG1HTNtJtDm', 'customer', NULL),
('Rahayu', 'rahayu@gmail.com', '098765', '$2y$10$Vs4zTq4GKjKnlCxNJco5WuJBGSX./tyAHSsXPy30opR91qYEdlca2', 'customer', NULL),
('Sigit Bebas', 'sigit@g.com', '8523645879', 'Asd123@#', 'customer', NULL),
('Naraya Albani', 'v@g.com', '0852336124', 'Asd123@#', 'customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `anggota_montir`
--

CREATE TABLE `anggota_montir` (
  `id_det_servis_montir` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_anggota_montir` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `nopol` varchar(9) NOT NULL,
  `status_bayar` enum('belum','sudah') NOT NULL,
  `status_pengerjaan` enum('pending','diterima','dikerjakan','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `email_customer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`created`, `nopol`, `merk`, `type`, `transmition`, `year`, `email_customer`) VALUES
('2024-11-12 11:04:45', 'AS1234ASD', 'Suzuki', 'Kawasaki', 'manual', 2008, 'naraya.albani@gmail.com'),
('2024-11-12 11:04:13', 'QW1234QWE', 'Honda', 'Civic', 'auto', 2019, 'naraya.albani@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `data_komponen`
--

CREATE TABLE `data_komponen` (
  `id_data_komponen` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
  `id_data_servis` char(7) NOT NULL,
  `nama_servis` varchar(30) NOT NULL,
  `harga_servis` int NOT NULL,
  `id_data_komponen` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `data_servis`
--

INSERT INTO `data_servis` (`id_data_servis`, `nama_servis`, `harga_servis`, `id_data_komponen`) VALUES
('GTS534', 'Tambah oli', 132400, 'SDW143'),
('SWE235', 'Ganti ban', 12346, 'DWI123'),
('TES123', 'Ganti oli', 12000, 'SDW143');

-- --------------------------------------------------------

--
-- Table structure for table `detail_booking`
--

CREATE TABLE `detail_booking` (
  `id_detail_booking` char(5) NOT NULL,
  `id_booking` char(5) NOT NULL,
  `id_barang` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `subtotal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `detail_booking`
--
DELIMITER $$
CREATE TRIGGER `update_total_biaya` AFTER INSERT ON `detail_booking` FOR EACH ROW BEGIN
    DECLARE total INT;
    
    SELECT SUM(subtotal) INTO total
    FROM detail_booking
    WHERE id_booking = NEW.id_booking;

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
  `id_detail_booking` char(5) NOT NULL,
  `id_data_servis` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis_montir`
--

CREATE TABLE `detail_servis_montir` (
  `id_det_servis_montir` char(7) NOT NULL,
  `id_detail_booking` char(5) NOT NULL,
  `email_ketua_montir` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_review` char(7) NOT NULL,
  `email_customer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `teks_review` varchar(500) NOT NULL,
  `rating` int NOT NULL,
  `tgl_review` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `riwayat`
-- (See below for the actual view)
--
CREATE TABLE `riwayat` (
`barang` text
,`nama_customer` varchar(40)
,`servis` text
,`tgl_booking` date
,`total` decimal(32,0)
,`total_booking` bigint
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
-- Stand-in structure for view `view_servis`
-- (See below for the actual view)
--
CREATE TABLE `view_servis` (
`harga_servis` int
,`id_data_servis` char(7)
,`nama_komponen` varchar(30)
,`nama_servis` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `riwayat`
--
DROP TABLE IF EXISTS `riwayat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `riwayat`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `a`.`name` AS `nama_customer`, count(distinct `b`.`id_booking`) AS `total_booking`, sum(`db`.`subtotal`) AS `total`, group_concat(distinct `ds`.`nama_servis` order by `ds`.`nama_servis` ASC separator ', ') AS `servis`, group_concat(distinct `bar`.`nama_barang` order by `bar`.`nama_barang` ASC separator ', ') AS `barang` FROM ((((((`booking` `b` join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) join `account` `a` on((`c`.`email_customer` = `a`.`email`))) join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) join `detail_servis_booking` `dsb` on((`db`.`id_detail_booking` = `dsb`.`id_detail_booking`))) join `data_servis` `ds` on((`dsb`.`id_data_servis` = `ds`.`id_data_servis`))) left join `barang` `bar` on((`db`.`id_barang` = `bar`.`id_barang`))) WHERE (`a`.`role` = 'Customer') GROUP BY `b`.`tgl_booking`, `a`.`name` ORDER BY `b`.`tgl_booking` AS `DESCdesc` ASC  ;

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
-- Indexes for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD PRIMARY KEY (`id_detail_booking`),
  ADD KEY `id_booking` (`id_booking`,`id_barang`),
  ADD KEY `fk_barang` (`id_barang`);

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
  ADD CONSTRAINT `anggota_montir_ibfk_1` FOREIGN KEY (`id_det_servis_montir`) REFERENCES `detail_servis_montir` (`id_det_servis_montir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggota_montir_ibfk_2` FOREIGN KEY (`email_anggota_montir`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `data_servis_ibfk_1` FOREIGN KEY (`id_data_komponen`) REFERENCES `data_komponen` (`id_data_komponen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_booking`
--
ALTER TABLE `detail_booking`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_servis_booking`
--
ALTER TABLE `detail_servis_booking`
  ADD CONSTRAINT `detail_servis_booking_ibfk_1` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_servis_booking_ibfk_2` FOREIGN KEY (`id_data_servis`) REFERENCES `data_servis` (`id_data_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_servis_montir`
--
ALTER TABLE `detail_servis_montir`
  ADD CONSTRAINT `fk_det_booking` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
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
