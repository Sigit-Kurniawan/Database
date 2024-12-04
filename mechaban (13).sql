-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2024 at 12:32 AM
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
('Naraya Albani', 'naraya.albani@gmail.com', '83832566069', 'Asd123@#', 'customer', NULL),
('Rahayu', 'rahayu@gmail.com', '098765', '$2y$10$Vs4zTq4GKjKnlCxNJco5WuJBGSX./tyAHSsXPy30opR91qYEdlca2', 'customer', NULL),
('Rayhan', 'rayhan@gmail.com', '0091891818', 'rayhan12', 'montir', NULL),
('Sigit Bebas', 'sigit@g.com', '8523645879', 'Asd123@#', 'customer', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `anggota_montir`
--

CREATE TABLE `anggota_montir` (
  `id_detail_montir` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_anggota_montir` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id_booking` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tgl_booking` datetime NOT NULL,
  `total_biaya` int DEFAULT NULL,
  `nopol` varchar(9) NOT NULL,
  `status` enum('pending','diterima','dikerjakan','selesai','batal') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
  `latitude` double(9,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id_booking`, `tgl_booking`, `total_biaya`, `nopol`, `status`, `latitude`, `longitude`) VALUES
('20241201210238AB1244O', '2024-12-01 21:02:38', 144400, 'A126P', 'selesai', -8.156525, 113.714762),
('20241201223129KL0988J', '2024-12-01 22:31:29', 12346, 'KL0988J', 'selesai', -8.161224, 113.723284),
('20241201230658PO78U9UK', '2024-12-01 23:06:58', 144400, 'PO78U9UK', 'selesai', -8.161224, 113.723284),
('20241203130719AB1244P', '2024-12-03 13:07:19', 144400, 'KC7890M', 'batal', -8.161224, 113.723282),
('20241204000125ES4679U', '2024-12-04 00:01:25', 12346, 'S466Y', 'diterima', -8.161224, 113.723283);

--
-- Triggers `booking`
--
DELIMITER $$
CREATE TRIGGER `reset_car_status` AFTER DELETE ON `booking` FOR EACH ROW BEGIN
    -- Periksa apakah nopol yang dihapus masih ada di tabel booking
    IF NOT EXISTS (
        SELECT 1 
        FROM booking 
        WHERE nopol = OLD.nopol
    ) THEN
        -- Jika tidak ada, kembalikan status ke 0
        UPDATE car
        SET status = 0
        WHERE nopol = OLD.nopol;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_car_status` AFTER INSERT ON `booking` FOR EACH ROW BEGIN
    UPDATE car
    SET status = 1
    WHERE nopol = NEW.nopol;
END
$$
DELIMITER ;

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
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `email_customer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`created`, `nopol`, `merk`, `type`, `transmition`, `year`, `status`, `email_customer`) VALUES
('2024-11-16 02:18:36', 'A126P', 'Honda', 'Honda', 'manual', 2011, 1, 'rahayu@gmail.com'),
('2024-11-21 11:18:21', 'GE5669SD', 'Suzuki', 'Vario', 'auto', 1998, 0, 'naraya.albani@gmail.com'),
('2024-11-28 00:26:47', 'H8K', 'Hai', 'halo', 'manual', 2021, 0, 'naraya.albani@gmail.com'),
('2024-11-29 07:42:31', 'HS9H', 'Sevia', 'Ayu', 'auto', 2019, 0, 'naraya.albani@gmail.com'),
('2024-11-25 22:41:53', 'JP969VHN', 'Jerman', 'guy', 'auto', 2019, 0, 'naraya.albani@gmail.com'),
('2024-11-16 02:18:45', 'KC7890M', 'Honda', 'Honda', 'auto', 2017, 1, 'rahayu@gmail.com'),
('2024-12-01 15:31:13', 'KL0988J', 'Honda', 'Suzuki', 'manual', 2019, 1, 'lili@gmail.com'),
('2024-11-28 00:26:15', 'OS698KD', 'Geng', 'mobil', 'auto', 2019, 0, 'naraya.albani@gmail.com'),
('2024-12-01 16:06:41', 'PO78U9UK', 'Fanta', 'Honda', 'manual', 2011, 1, 'lili@gmail.com'),
('2024-11-21 07:50:25', 'S1164GHJ', 'Honda', 'Sedan', 'auto', 2019, 0, 'naraya.albani@gmail.com'),
('2024-12-03 16:48:21', 'S466Y', 'Fanta', 'fanta', 'auto', 2020, 1, 'rahayu@gmail.com'),
('2024-11-28 00:27:28', 'SK94KD', 'Jangek', 'hantu', 'manual', 2019, 0, 'naraya.albani@gmail.com'),
('2024-11-25 22:48:24', 'TY965HN', 'Wondra', 'hem', 'auto', 2011, 0, 'naraya.albani@gmail.com'),
('2024-11-24 06:29:05', 'WE2005TER', 'Naraya', 'hindua', 'auto', 2014, 0, 'naraya.albani@gmail.com'),
('2024-11-17 07:44:26', 'YT6654K', 'Honda', 'Honda', 'manual', 2011, 0, 'rahayu@gmail.com');

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
('DK12ack', 'Ban'),
('DK39iop', 'Oli');

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
('DS12utr', 'Ganti ban', 12346, 'DK12ack'),
('DS44ctp', 'Tambah oli', 132400, 'DK39iop'),
('DS90mch', 'Ganti oli', 12000, 'DK39iop');

-- --------------------------------------------------------

--
-- Table structure for table `detail_montir`
--

CREATE TABLE `detail_montir` (
  `id_detail_montir` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_booking` char(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_ketua_montir` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis`
--

CREATE TABLE `detail_servis` (
  `id_booking` char(23) NOT NULL,
  `id_data_servis` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `detail_servis`
--

INSERT INTO `detail_servis` (`id_booking`, `id_data_servis`) VALUES
('20241201210238AB1244O', 'DS44ctp'),
('20241201210238AB1244O', 'DS90mch'),
('20241201223129KL0988J', 'DS12utr'),
('20241201230658PO78U9UK', 'DS44ctp'),
('20241201230658PO78U9UK', 'DS90mch'),
('20241203130719AB1244P', 'DS44ctp'),
('20241203130719AB1244P', 'DS90mch'),
('20241204000125ES4679U', 'DS12utr');

--
-- Triggers `detail_servis`
--
DELIMITER $$
CREATE TRIGGER `update_total_biaya` AFTER INSERT ON `detail_servis` FOR EACH ROW BEGIN
    DECLARE total_biaya DECIMAL(10, 2) DEFAULT 0;

    -- Menghitung total biaya berdasarkan servis yang dipilih
    SELECT SUM(s.harga_servis)
    INTO total_biaya
    FROM detail_servis ds
    JOIN data_servis s ON ds.id_data_servis = s.id_data_servis
    WHERE ds.id_booking = NEW.id_booking;

    -- Update total_biaya di tabel booking
    UPDATE booking
    SET total_biaya = total_biaya
    WHERE id_booking = NEW.id_booking;
END
$$
DELIMITER ;

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
  `id_booking` char(23) NOT NULL,
  `teks_review` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `tgl_review` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `review_customer`
--

INSERT INTO `review_customer` (`id_review`, `id_booking`, `teks_review`, `rating`, `tgl_review`) VALUES
('RC71658a7', '20241201210238AB1244O', 'pp', '4', '2024-12-03 12:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `updated` timestamp NOT NULL,
  `status_bengkel` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`updated`, `status_bengkel`) VALUES
('2024-11-27 13:54:54', 1);

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
-- Stand-in structure for view `view_rincian_booking`
-- (See below for the actual view)
--
CREATE TABLE `view_rincian_booking` (
`anggota_montir` text
,`email_customer` varchar(30)
,`harga_servis` text
,`id_booking` char(23)
,`ketua_montir` text
,`latitude` double(9,6)
,`longitude` double(9,6)
,`nopol` varchar(9)
,`rating` enum('1','2','3','4','5')
,`review` varchar(500)
,`servis` text
,`status` enum('pending','diterima','dikerjakan','selesai','batal')
,`tgl_booking` datetime
,`total_biaya` int
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
-- Stand-in structure for view `view_total_order_montir`
-- (See below for the actual view)
--
CREATE TABLE `view_total_order_montir` (
`email_montir` varchar(30)
,`total_order` bigint
);

-- --------------------------------------------------------

--
-- Structure for view `view_pemasukan`
--
DROP TABLE IF EXISTS `view_pemasukan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pemasukan`  AS SELECT `booking`.`tgl_booking` AS `tgl_booking`, sum(`booking`.`total_biaya`) AS `total_pemasukan` FROM `booking` GROUP BY `booking`.`tgl_booking` ORDER BY `booking`.`tgl_booking` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_rincian_booking`
--
DROP TABLE IF EXISTS `view_rincian_booking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_rincian_booking`  AS SELECT `b`.`tgl_booking` AS `tgl_booking`, `b`.`id_booking` AS `id_booking`, `a`.`email` AS `email_customer`, `b`.`nopol` AS `nopol`, `b`.`latitude` AS `latitude`, `b`.`longitude` AS `longitude`, group_concat(distinct `s`.`nama_servis` order by `s`.`nama_servis` ASC separator ', ') AS `servis`, group_concat(distinct `s`.`harga_servis` order by `s`.`nama_servis` ASC separator ', ') AS `harga_servis`, `b`.`total_biaya` AS `total_biaya`, `b`.`status` AS `status`, group_concat(distinct `km`.`name` order by `km`.`name` ASC separator ', ') AS `ketua_montir`, group_concat(distinct `am_montir`.`name` order by `am_montir`.`name` ASC separator ', ') AS `anggota_montir`, `rc`.`teks_review` AS `review`, `rc`.`rating` AS `rating` FROM (((((((((`booking` `b` left join `detail_servis` `ds` on((`b`.`id_booking` = `ds`.`id_booking`))) left join `car` `c` on((`b`.`nopol` = `c`.`nopol`))) left join `account` `a` on((`c`.`email_customer` = `a`.`email`))) left join `data_servis` `s` on((`ds`.`id_data_servis` = `s`.`id_data_servis`))) left join `detail_montir` `dm` on((`b`.`id_booking` = `dm`.`id_booking`))) left join `account` `km` on(((`km`.`email` = `dm`.`email_ketua_montir`) and (`km`.`role` = 'montir')))) left join `anggota_montir` `am` on((`dm`.`id_detail_montir` = `am`.`id_detail_montir`))) left join `account` `am_montir` on(((`am`.`email_anggota_montir` = `am_montir`.`email`) and (`am_montir`.`role` = 'montir')))) left join `review_customer` `rc` on((`b`.`id_booking` = `rc`.`id_booking`))) GROUP BY `b`.`id_booking`, `b`.`tgl_booking`, `b`.`nopol`, `b`.`latitude`, `b`.`longitude`, `b`.`total_biaya`, `b`.`status`, `a`.`email`, `rc`.`teks_review`, `rc`.`rating` ORDER BY `b`.`tgl_booking` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `view_servis`
--
DROP TABLE IF EXISTS `view_servis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_servis`  AS SELECT `s`.`id_data_servis` AS `id_data_servis`, `s`.`nama_servis` AS `nama_servis`, `s`.`harga_servis` AS `harga_servis`, `k`.`nama_komponen` AS `nama_komponen` FROM (`data_servis` `s` join `data_komponen` `k` on((`s`.`id_data_komponen` = `k`.`id_data_komponen`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_total_order_montir`
--
DROP TABLE IF EXISTS `view_total_order_montir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_total_order_montir`  AS SELECT `montir`.`email_montir` AS `email_montir`, count(distinct `montir`.`id_booking`) AS `total_order` FROM (select `dm`.`id_booking` AS `id_booking`,`dm`.`email_ketua_montir` AS `email_montir` from (`detail_montir` `dm` join `booking` `b` on((`dm`.`id_booking` = `b`.`id_booking`))) where (`b`.`status` = 'selesai') union all select `am`.`id_detail_montir` AS `id_booking`,`am`.`email_anggota_montir` AS `email_montir` from ((`anggota_montir` `am` join `detail_montir` `dm` on((`am`.`id_detail_montir` = `dm`.`id_detail_montir`))) join `booking` `b` on((`dm`.`id_booking` = `b`.`id_booking`))) where (`b`.`status` = 'selesai')) AS `montir` GROUP BY `montir`.`email_montir``email_montir`  ;

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
  ADD KEY `id_detail_montir` (`id_detail_montir`);

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
-- Indexes for table `detail_montir`
--
ALTER TABLE `detail_montir`
  ADD PRIMARY KEY (`id_detail_montir`),
  ADD KEY `fk_ketua_montir` (`email_ketua_montir`),
  ADD KEY `id_booking` (`id_booking`);

--
-- Indexes for table `detail_servis`
--
ALTER TABLE `detail_servis`
  ADD KEY `fk_booking` (`id_booking`),
  ADD KEY `fk_data_sevis` (`id_data_servis`);

--
-- Indexes for table `review_customer`
--
ALTER TABLE `review_customer`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `fk_review_booking` (`id_booking`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota_montir`
--
ALTER TABLE `anggota_montir`
  ADD CONSTRAINT `anggota_montir_ibfk_1` FOREIGN KEY (`id_detail_montir`) REFERENCES `detail_montir` (`id_detail_montir`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Constraints for table `detail_montir`
--
ALTER TABLE `detail_montir`
  ADD CONSTRAINT `detail_montir_ibfk_1` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ketua_montir` FOREIGN KEY (`email_ketua_montir`) REFERENCES `account` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_servis`
--
ALTER TABLE `detail_servis`
  ADD CONSTRAINT `fk_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_data_sevis` FOREIGN KEY (`id_data_servis`) REFERENCES `data_servis` (`id_data_servis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_customer`
--
ALTER TABLE `review_customer`
  ADD CONSTRAINT `fk_review_booking` FOREIGN KEY (`id_booking`) REFERENCES `booking` (`id_booking`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_expired_otp` ON SCHEDULE EVERY 30 SECOND STARTS '2024-11-29 16:49:32' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM otp WHERE `time` < NOW() - INTERVAL 5 MINUTE$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
