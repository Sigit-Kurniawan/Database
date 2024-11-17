-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2024 at 03:14 PM
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
('citra', 'citra@gmail.com', '098765', '$2y$10$08XDnAW1SkafxrVENiNOY.LEbcapRxD1cRfMsjAcM8tFs9PJNR71y', 'customer', NULL),
('Danial', 'danial@gmail.com', '666666666', '$2y$10$b1xTQu64w6ORKa4bRGDPaOuRx0gmRZXqs9c137H4IJa/CmeEHqBYy', 'admin', NULL),
('Keke', 'keke@gmail.com', '098765', '1234', 'montir', NULL),
('lili', 'lili@gmail.com', '88888888', '$2y$10$xqJfo4r8KA5kyHKj1F/NYeJ8ZEYY9GPAB0BiCCh92mQLpW.KU.MUi', 'customer', NULL),
('Naila', 'naila@gmail.com', '1234567', '2222', 'montir', NULL),
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

--
-- Dumping data for table `anggota_montir`
--

INSERT INTO `anggota_montir` (`id_det_servis_montir`, `email_anggota_montir`) VALUES
('dsm1', 'aza@gmail.com'),
('dsm1', 'naila@gmail.com'),
('dsm2', 'keke@gmail.com'),
('dsm2', 'keke@gmail.com');

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
  `status_pengerjaan` enum('pending','diterima','dikerjakan','selesai') NOT NULL,
  `latitude` double(9,6) NOT NULL,
  `longitude` double(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `total_biaya`, `metode_bayar`, `nopol`, `status_bayar`, `status_pengerjaan`, `latitude`, `longitude`) VALUES
('B001', '2024-11-07', 162400, 'Tunai', 'AB1244O', 'belum', 'diterima', 12.345678, 93.123456),
('B002', '2024-11-08', 74346, 'Tunai', 'AB1244P', 'belum', 'dikerjakan', 12.345678, 93.123456);

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
('2024-11-16 02:18:36', 'AB1244O', 'Honda', 'Honda', 'manual', 2011, 'rahayu@gmail.com'),
('2024-11-16 02:18:45', 'AB1244P', 'Honda', 'Honda', 'manual', 2011, 'rahayu@gmail.com'),
('2024-11-17 07:44:26', 'AB2346K', 'Honda', 'Honda', 'manual', 2011, 'rahayu@gmail.com');

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
-- Table structure for table `detail_barang_booking`
--

CREATE TABLE `detail_barang_booking` (
  `id_det_barang_booking` char(5) NOT NULL,
  `id_detail_booking` char(5) NOT NULL,
  `id_barang` char(5) NOT NULL,
  `jumlah_barang` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_barang_booking`
--

INSERT INTO `detail_barang_booking` (`id_det_barang_booking`, `id_detail_booking`, `id_barang`, `jumlah_barang`) VALUES
('dbr01', 'db001', 'bar01', 2),
('dbr02', 'db002', 'bar02', 5);

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
  `id_detail_booking` char(5) NOT NULL,
  `id_booking` char(5) NOT NULL,
  `subtotal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_booking`
--

INSERT INTO `detail_booking` (`id_detail_booking`, `id_booking`, `subtotal`) VALUES
('db001', 'B001', 162400),
('db002', 'B002', 74346),
('db003', 'B002', NULL);

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
  `id_detail_booking` char(5) NOT NULL,
  `id_data_servis` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_servis_booking`
--

INSERT INTO `detail_servis_booking` (`id_detail_booking`, `id_data_servis`) VALUES
('db001', 'GTS534'),
('db002', 'SWE235'),
('db002', 'TES123');

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
  `id_det_servis_montir` char(7) NOT NULL,
  `id_detail_booking` char(5) NOT NULL,
  `email_ketua_montir` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_servis_montir`
--

INSERT INTO `detail_servis_montir` (`id_det_servis_montir`, `id_detail_booking`, `email_ketua_montir`) VALUES
('dsm1', 'db001', 'keke@gmail.com'),
('dsm2', 'db002', 'aza@gmail.com'),
('dsm3', 'db003', 'aza@gmail.com');

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
-- Stand-in structure for view `riwayatbooking`
-- (See below for the actual view)
--
CREATE TABLE `riwayatbooking` (
`tgl_booking` date
,`nama_customer` varchar(40)
,`nopol` varchar(9)
,`merk_mobil` varchar(20)
,`barang` text
,`jumlah_barang` decimal(32,0)
,`servis` text
,`total_biaya` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_order_montir`
-- (See below for the actual view)
--
CREATE TABLE `view_order_montir` (
`tgl_booking` date
,`email_montir` varchar(30)
,`nama_montir` varchar(40)
,`status_montir` varchar(7)
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
`id_data_servis` char(7)
,`nama_servis` varchar(30)
,`harga_servis` int
,`nama_komponen` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `riwayatbooking`
--
DROP TABLE IF EXISTS `riwayatbooking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `riwayatbooking`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `a`.`name` AS `nama_customer`, `c`.`nopol` AS `nopol`, `c`.`merk` AS `merk_mobil`, group_concat(distinct `bar`.`nama_barang` order by `bar`.`nama_barang` ASC separator ', ') AS `barang`, sum(`dbb`.`jumlah_barang`) AS `jumlah_barang`, group_concat(distinct `ds`.`nama_servis` order by `ds`.`nama_servis` ASC separator ', ') AS `servis`, sum(`db`.`subtotal`) AS `total_biaya` FROM (((((((`booking` `b` join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) join `account` `a` on((`c`.`email_customer` = `a`.`email`))) join `detail_booking` `db` on((`b`.`id_booking` = `db`.`id_booking`))) left join `detail_barang_booking` `dbb` on((`db`.`id_detail_booking` = `dbb`.`id_detail_booking`))) left join `barang` `bar` on((`dbb`.`id_barang` = `bar`.`id_barang`))) left join `detail_servis_booking` `dsb` on((`db`.`id_detail_booking` = `dsb`.`id_detail_booking`))) left join `data_servis` `ds` on((`dsb`.`id_data_servis` = `ds`.`id_data_servis`))) WHERE (`a`.`role` = 'Customer') GROUP BY `b`.`tgl_booking`, `a`.`name`, `c`.`nopol`, `c`.`merk` ORDER BY `b`.`tgl_booking` AS `DESCdesc` ASC  ;

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
-- Constraints for table `detail_barang_booking`
--
ALTER TABLE `detail_barang_booking`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_booking_det` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_booking`
--
ALTER TABLE `detail_booking`
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
