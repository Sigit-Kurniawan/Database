-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2024 at 08:16 AM
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
  `role` enum('customer','montir','admin','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `photo` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`name`, `email`, `no_hp`, `password`, `role`, `photo`) VALUES
('citra', 'citra@gmail.com', '098765', '$2y$10$08XDnAW1SkafxrVENiNOY.LEbcapRxD1cRfMsjAcM8tFs9PJNR71y', 'customer', NULL),
('Danial', 'danial@gmail.com', '666666666', '$2y$10$b1xTQu64w6ORKa4bRGDPaOuRx0gmRZXqs9c137H4IJa/CmeEHqBYy', 'admin', NULL),
('lili', 'lili@gmail.com', '88888888', '$2y$10$xqJfo4r8KA5kyHKj1F/NYeJ8ZEYY9GPAB0BiCCh92mQLpW.KU.MUi', 'customer', NULL),
('Naraya', 'naraya@gmail.com', '23456789', '$2y$10$FNirsullykq.5ZmOS0j0BurkzPbxFjr4s0yEBFlA44uG1HTNtJtDm', 'customer', NULL),
('Rahayu', 'rahayu@gmail.com', '098765', '$2y$10$Vs4zTq4GKjKnlCxNJco5WuJBGSX./tyAHSsXPy30opR91qYEdlca2', 'customer', NULL),
('Sigit Bebas', 'sigit@g.com', '8523645879', 'Asd123@#', 'customer', NULL),
('Naraya Albani', 'v@g.com', '0852336124', 'Asd123@#', 'customer', NULL);

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
('T1234RE', 'Honda', 'Civic', 'auto', 2005, 'sigit@g.com');

-- --------------------------------------------------------

--
-- Table structure for table `data_komponen`
--

CREATE TABLE `data_komponen` (
  `id_data_komponen` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_komponen` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_data_servis` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_servis`
--

CREATE TABLE `data_servis` (
  `id_data_servis` char(7) NOT NULL,
  `nama_servis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Triggers `detail_booking`
--
DELIMITER $$
CREATE TRIGGER `jumlahkan_subtotal_dan_harga_barang` BEFORE INSERT ON `detail_booking` FOR EACH ROW BEGIN
	DECLARE v_harga_layanan INT;
    DECLARE v_harga_barang INT;
    
    SELECT harga_layanan INTO v_harga_layanan
    FROM layanan_servis 
    WHERE id_layanan_servis = NEW.id_layanan_servis;
    
    IF NEW.id_barang IS NOT NULL THEN
        SELECT harga INTO v_harga_barang
        FROM barang 
        WHERE id_barang = NEW.id_barang;
    ELSE
        SET v_harga_barang = 0;
    END IF;
    
    SET NEW.subtotal = v_harga_layanan + v_harga_barang;

END
$$
DELIMITER ;
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
-- Table structure for table `detail_servis_montir`
--

CREATE TABLE `detail_servis_montir` (
  `id_det_servis_montir` char(7) NOT NULL,
  `id_detail_booking` char(5) NOT NULL,
  `id_ketua_montir` char(5) NOT NULL,
  `id_anggota_montir` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Stand-in structure for view `view_montir_orders`
-- (See below for the actual view)
--
CREATE TABLE `view_montir_orders` (
`tgl_booking` date
,`id_montir` char(5)
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
-- Stand-in structure for view `view_riwayat`
-- (See below for the actual view)
--
CREATE TABLE `view_riwayat` (
`tgl_booking` date
,`nama_customer` varchar(40)
,`total_booking` bigint
,`total` decimal(32,0)
,`layanan` text
,`barang` text
);

-- --------------------------------------------------------

--
-- Structure for view `view_montir_orders`
--
DROP TABLE IF EXISTS `view_montir_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_montir_orders`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `km`.`id_ketua_montir` AS `id_montir`, `km`.`nama_ketua_montir` AS `nama_montir`, 'Ketua' AS `status_montir`, count(distinct `db`.`id_detail_booking`) AS `total_order` FROM (((`detail_booking` `db` join `booking` `b` on((`db`.`id_booking` = `b`.`id_booking`))) join `detail_servis_montir` `ds` on((`db`.`id_detail_booking` = `ds`.`id_detail_booking`))) join `ketua_montir` `km` on((`ds`.`id_ketua_montir` = `km`.`id_ketua_montir`))) GROUP BY `b`.`tgl_booking`, `km`.`id_ketua_montir`, `km`.`nama_ketua_montir` union all select `b`.`tgl_booking` AS `tgl_booking`,`am`.`id_anggota_montir` AS `id_montir`,`am`.`nama_anggota_montir` AS `nama_montir`,'Anggota' AS `status_montir`,count(distinct `db`.`id_detail_booking`) AS `total_order` from (((`detail_booking` `db` join `booking` `b` on((`db`.`id_booking` = `b`.`id_booking`))) join `detail_servis_montir` `ds` on((`db`.`id_detail_booking` = `ds`.`id_detail_booking`))) join `anggota_montir` `am` on((`ds`.`id_anggota_montir` = `am`.`id_anggota_montir`))) group by `b`.`tgl_booking`,`am`.`id_anggota_montir`,`am`.`nama_anggota_montir` order by `tgl_booking` desc  ;

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
-- Indexes for table `data_komponen`
--
ALTER TABLE `data_komponen`
  ADD PRIMARY KEY (`id_data_komponen`),
  ADD KEY `fk_data_servis` (`id_data_servis`);

--
-- Indexes for table `data_servis`
--
ALTER TABLE `data_servis`
  ADD PRIMARY KEY (`id_data_servis`);

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
  ADD KEY `fk_det_booking` (`id_detail_booking`),
  ADD KEY `fk_ketua` (`id_ketua_montir`),
  ADD KEY `fk_anggota` (`id_anggota_montir`);

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
-- Indexes for table `review_customer`
--
ALTER TABLE `review_customer`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `fk_email_cus` (`email_customer`);

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
-- Constraints for table `data_komponen`
--
ALTER TABLE `data_komponen`
  ADD CONSTRAINT `fk_data_servis` FOREIGN KEY (`id_data_servis`) REFERENCES `data_servis` (`id_data_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_det_booking` FOREIGN KEY (`id_detail_booking`) REFERENCES `detail_booking` (`id_detail_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
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

--
-- Constraints for table `review_customer`
--
ALTER TABLE `review_customer`
  ADD CONSTRAINT `fk_email_cus` FOREIGN KEY (`email_customer`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
