-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2018 at 04:54 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parkirarea`
--

-- --------------------------------------------------------

--
-- Table structure for table `catat_keluar`
--

CREATE TABLE `catat_keluar` (
  `id_keluar` int(3) NOT NULL,
  `id_masuk` int(3) NOT NULL,
  `waktu_keluar` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `biaya` decimal(10,0) NOT NULL,
  `pembayaran` enum('Cash','Langganan','Denda') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_petugas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catat_keluar`
--

INSERT INTO `catat_keluar` (`id_keluar`, `id_masuk`, `waktu_keluar`, `biaya`, `pembayaran`, `id_petugas`) VALUES
(1, 183, '2018-04-17 22:23:39', '2000', 'Cash', 2);

-- --------------------------------------------------------

--
-- Table structure for table `catat_masuk`
--

CREATE TABLE `catat_masuk` (
  `id_masuk` int(3) NOT NULL,
  `kode_unik` bigint(100) DEFAULT NULL,
  `waktu_masuk` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nopol` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_petugas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catat_masuk`
--

INSERT INTO `catat_masuk` (`id_masuk`, `kode_unik`, `waktu_masuk`, `nopol`, `id_petugas`) VALUES
(182, 620180320, '2018-03-20 18:28:06', 'DA 7777 N', 2),
(183, 120180417, '2018-04-17 22:23:12', 'DA 2002 GMA', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jumlah_kendaraan`
-- (See below for the actual view)
--
CREATE TABLE `jumlah_kendaraan` (
`id_masuk` int(3)
,`kode_unik` bigint(100)
,`nopol` varchar(100)
,`waktu_masuk` datetime
,`nama_petugas` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `kendaraan_bayar`
-- (See below for the actual view)
--
CREATE TABLE `kendaraan_bayar` (
`id_masuk` int(3)
,`kode_unik` bigint(100)
,`nopol` varchar(100)
,`waktu_masuk` datetime
,`waktu_keluar` datetime
,`nama_petugas` varchar(25)
,`biaya` decimal(10,0)
,`pembayaran` enum('Cash','Langganan','Denda')
);

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(3) NOT NULL,
  `nama_petugas` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('E','D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `status`) VALUES
(1, 'Muliana', 'muliana', 'a3dcc16aaca31f8ec845dbb2fc1cd2ae', 'E'),
(2, 'Muslih', 'muslih', '82c8b45ed8a25cf38b41e88fb0d22078', 'E'),
(3, 'Adinistrator', 'admin', '0192023a7bbd73250516f069df18b500', 'E');

-- --------------------------------------------------------

--
-- Structure for view `jumlah_kendaraan`
--
DROP TABLE IF EXISTS `jumlah_kendaraan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jumlah_kendaraan`  AS  select `cm`.`id_masuk` AS `id_masuk`,`cm`.`kode_unik` AS `kode_unik`,`cm`.`nopol` AS `nopol`,`cm`.`waktu_masuk` AS `waktu_masuk`,`p`.`nama_petugas` AS `nama_petugas` from ((`catat_masuk` `cm` left join `catat_keluar` `ck` on((`cm`.`id_masuk` = `ck`.`id_masuk`))) left join `petugas` `p` on((`p`.`id_petugas` = `cm`.`id_petugas`))) where isnull(`ck`.`id_masuk`) ;

-- --------------------------------------------------------

--
-- Structure for view `kendaraan_bayar`
--
DROP TABLE IF EXISTS `kendaraan_bayar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kendaraan_bayar`  AS  select `cm`.`id_masuk` AS `id_masuk`,`cm`.`kode_unik` AS `kode_unik`,`cm`.`nopol` AS `nopol`,`cm`.`waktu_masuk` AS `waktu_masuk`,`ck`.`waktu_keluar` AS `waktu_keluar`,`p`.`nama_petugas` AS `nama_petugas`,`ck`.`biaya` AS `biaya`,`ck`.`pembayaran` AS `pembayaran` from ((`catat_keluar` `ck` left join `catat_masuk` `cm` on((`cm`.`id_masuk` = `ck`.`id_masuk`))) left join `petugas` `p` on((`p`.`id_petugas` = `ck`.`id_petugas`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catat_keluar`
--
ALTER TABLE `catat_keluar`
  ADD PRIMARY KEY (`id_keluar`),
  ADD KEY `id_masuk` (`id_masuk`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `catat_masuk`
--
ALTER TABLE `catat_masuk`
  ADD PRIMARY KEY (`id_masuk`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catat_keluar`
--
ALTER TABLE `catat_keluar`
  MODIFY `id_keluar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `catat_masuk`
--
ALTER TABLE `catat_masuk`
  MODIFY `id_masuk` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catat_keluar`
--
ALTER TABLE `catat_keluar`
  ADD CONSTRAINT `catat_keluar_ibfk_1` FOREIGN KEY (`id_masuk`) REFERENCES `catat_masuk` (`id_masuk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catat_keluar_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catat_masuk`
--
ALTER TABLE `catat_masuk`
  ADD CONSTRAINT `catat_masuk_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
