-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2018 at 02:38 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

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
(1, 1, '2018-02-09 09:31:02', '4000', 'Cash', 2),
(2, 2, '2018-02-09 09:48:55', '2000', 'Langganan', 2);

-- --------------------------------------------------------

--
-- Table structure for table `catat_masuk`
--

CREATE TABLE `catat_masuk` (
  `id_masuk` int(3) NOT NULL,
  `kode_unik` bigint(100) DEFAULT NULL,
  `waktu_masuk` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nopol` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_petugas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catat_masuk`
--

INSERT INTO `catat_masuk` (`id_masuk`, `kode_unik`, `waktu_masuk`, `nopol`, `id_petugas`) VALUES
(1, 201802090926, '2018-02-09 09:26:36', 'DA 4004 GA', 1),
(2, 201802090944, '2018-02-09 09:44:51', 'DA 6014 FB', 1),
(3, 201802090949, '2018-02-09 09:50:10', 'DA 2669 KB', 1),
(7, NULL, '2018-02-09 20:39:58', '', 1),
(8, NULL, '2018-02-09 20:40:37', '', 1),
(10, NULL, '2018-02-09 20:53:19', 'DA 2009 AA', 1),
(11, NULL, '2018-02-09 20:54:32', 'DA 2009 AA', 1),
(12, NULL, '2018-02-10 00:27:22', '', 1),
(17, NULL, '2018-02-10 00:30:34', 'DA 4444 G', 1),
(25, NULL, '2018-02-10 00:38:24', '123', 1),
(26, NULL, '2018-02-10 00:38:51', 'da1234', 1),
(27, NULL, '2018-02-10 09:22:52', 'da1234', 1),
(28, NULL, '2018-02-10 09:23:08', 'da1234', 1),
(29, NULL, '2018-02-10 09:26:19', '', 1),
(30, NULL, '2018-02-10 09:26:35', '', 1),
(31, NULL, '2018-02-10 09:26:37', '', 1),
(32, NULL, '2018-02-10 09:27:02', '', 1),
(33, NULL, '2018-02-10 09:27:04', '', 1),
(34, NULL, '2018-02-10 10:04:10', 'as', 1),
(35, NULL, '2018-02-10 10:04:21', 'as', 1),
(36, NULL, '2018-02-10 10:09:07', 'as', 1),
(37, NULL, '2018-02-10 10:09:38', 'as', 1),
(38, NULL, '2018-02-10 10:09:59', 'as', 1),
(39, NULL, '2018-02-10 10:12:27', 'as', 1),
(40, NULL, '2018-02-10 10:12:47', 'as', 1),
(41, NULL, '2018-02-10 10:25:29', 'as', 1),
(42, NULL, '2018-02-10 10:25:42', 'as', 1),
(43, NULL, '2018-02-10 10:26:03', 'as', 1),
(44, NULL, '2018-02-10 10:42:07', 'as', 1),
(45, NULL, '2018-02-10 10:44:06', 'as', 1),
(46, NULL, '2018-02-10 10:44:24', 'as', 1),
(47, NULL, '2018-02-10 10:44:46', '123', 1),
(48, NULL, '2018-02-10 11:19:07', '123', 1),
(49, NULL, '2018-02-10 11:19:42', '123', 1),
(50, NULL, '2018-02-10 11:20:13', '123', 1),
(51, NULL, '2018-02-10 11:20:22', '123', 1),
(52, NULL, '2018-02-10 11:20:40', '123', 1),
(54, NULL, '2018-02-10 11:27:31', 'DA 4001 GM', 1),
(55, NULL, '2018-02-10 11:33:27', 'DA 4001 GM', 1),
(56, NULL, '2018-02-10 11:33:34', 'DA 1212 FF', 1),
(57, NULL, '2018-02-10 11:34:05', 'DA 1212 FF', 1),
(58, NULL, '2018-02-10 11:34:47', 'DA 1212 FF', 1),
(59, NULL, '2018-02-10 11:35:21', 'DA 1212 FF', 1),
(60, NULL, '2018-02-10 11:35:41', 'DA 1212 FF', 1),
(61, NULL, '2018-02-10 11:35:48', 'DA 1212 FF', 1),
(62, NULL, '2018-02-10 11:36:03', 'DA 1212 FF', 1),
(63, NULL, '2018-02-10 11:36:15', 'DA 1212 FF', 1),
(64, NULL, '2018-02-10 11:37:08', 'DA 1212 FF', 1),
(65, NULL, '2018-02-10 11:37:37', 'DA 1212 FF', 1),
(66, NULL, '2018-02-10 11:37:48', 'DA 1212 FF', 1),
(67, NULL, '2018-02-10 11:48:27', 'DA 1212 FF', 1),
(68, NULL, '2018-02-10 11:53:09', 'DA 1212 FF', 1),
(69, NULL, '2018-02-10 15:05:52', 'DA 1111 GM', 1),
(70, NULL, '2018-02-10 15:06:15', 'DA 1111 GM', 1),
(71, NULL, '2018-02-10 15:20:34', 'DA 6006 GM', 1),
(72, NULL, '2018-02-10 15:27:49', 'DA 6006 GM', 1),
(73, NULL, '2018-02-10 15:28:05', 'DA 6006 GM', 1),
(74, NULL, '2018-02-10 20:01:47', 'qwerty', 1),
(75, NULL, '2018-02-10 21:03:47', 'DA 6006 GM', 1),
(76, NULL, '2018-02-18 23:22:04', 'DA 4001 GM', 1),
(77, NULL, '2018-02-18 23:24:42', 'DA 4001 GM', 1),
(78, NULL, '2018-02-18 23:24:44', 'DA 4001 GM', 1),
(79, NULL, '2018-02-18 23:24:45', 'DA 4001 GM', 1),
(80, NULL, '2018-02-18 23:24:54', 'DA 8890 GB', 1),
(81, NULL, '2018-02-18 23:31:23', 'DA 8890 GB', 1),
(82, NULL, '2018-02-20 12:42:08', 'Da 7888 BG', 2),
(83, NULL, '2018-02-20 13:35:40', 'Da 7888 BG', 2),
(84, NULL, '2018-02-20 13:36:33', 'Da 9999 GM', 2),
(85, NULL, '2018-02-20 13:37:07', 'Da 9999 GM', 2),
(86, NULL, '2018-02-20 13:37:17', 'Da 9999 GM', 2),
(87, NULL, '2018-02-20 13:38:18', 'DA 9090 KO', 2),
(88, NULL, '2018-02-20 13:39:03', 'DA 9090 KO', 2),
(89, NULL, '2018-02-20 13:39:08', 'bgfhgvh', 2),
(90, NULL, '2018-02-20 13:40:01', 'bgfhgvh', 2),
(91, NULL, '2018-02-20 13:40:04', 'Tes', 2),
(92, NULL, '2018-02-20 13:40:13', 'Tes', 2),
(93, NULL, '2018-02-20 13:40:26', 'DA 8989 FF', 2),
(94, NULL, '2018-02-26 20:21:06', 'DA 4000 S', 2),
(95, NULL, '2018-02-26 20:24:40', 'ada', 2),
(96, NULL, '2018-02-26 20:25:05', 'ada', 2),
(97, NULL, '2018-02-26 20:25:35', 'ada', 2),
(98, NULL, '2018-02-26 20:26:07', 'ada', 2),
(99, NULL, '2018-02-26 20:26:11', '', 2),
(100, NULL, '2018-02-26 20:26:29', '', 2),
(101, NULL, '2018-02-26 20:26:55', '', 2),
(102, NULL, '2018-02-26 20:27:55', '', 2),
(103, NULL, '2018-02-26 20:28:12', 'DA 0000 L', 2),
(104, NULL, '2018-02-26 20:36:35', 'DA 0000 L', 2),
(105, NULL, '2018-02-26 20:36:53', 'DA 0000 L', 2),
(106, NULL, '2018-02-26 20:37:07', 'DA 0000 L', 2),
(107, NULL, '2018-02-26 20:38:05', 'DA 0000 L', 2),
(108, NULL, '2018-02-26 20:39:37', 'DA 0000 L', 2),
(109, NULL, '2018-02-26 20:39:55', 'DA 0000 L', 2),
(110, NULL, '2018-02-26 20:40:18', 'DA 0000 L', 2),
(111, NULL, '2018-02-26 20:40:59', 'DA 0000 L', 2),
(112, NULL, '2018-02-26 20:41:15', 'DA 0000 L', 2),
(113, NULL, '2018-02-26 20:41:44', 'DA 0000 L', 2),
(114, NULL, '2018-02-26 20:41:59', 'DA 0000 L', 2),
(115, NULL, '2018-02-26 20:42:09', 'DA 0000 L', 2),
(116, NULL, '2018-02-26 20:42:34', 'DA 0000 L', 2),
(117, NULL, '2018-02-26 20:42:50', 'DA 0000 L', 2),
(118, NULL, '2018-02-26 20:43:04', 'DA 0000 L', 2),
(119, NULL, '2018-02-26 20:43:23', 'DA 0000 L', 2),
(120, NULL, '2018-02-26 20:43:35', 'DA 0000 L', 2),
(121, NULL, '2018-02-26 20:43:48', 'DA 0000 L', 2),
(122, NULL, '2018-02-26 20:44:19', 'DA 0000 L', 2),
(123, NULL, '2018-02-26 20:44:36', 'DA 0000 L', 2),
(124, NULL, '2018-02-26 20:45:57', 'DA 0000 L', 2),
(125, NULL, '2018-02-26 20:46:22', 'DA 0000 L', 2),
(126, NULL, '2018-02-26 20:49:33', 'DA 0000 L', 2),
(127, NULL, '2018-02-26 20:49:58', 'DA 0000 L', 2),
(128, NULL, '2018-02-26 20:50:10', 'DA 0000 L', 2),
(129, NULL, '2018-02-26 21:19:30', '', 2),
(130, NULL, '2018-02-26 21:22:24', '', 2),
(131, NULL, '2018-02-26 21:22:27', '', 2),
(132, NULL, '2018-02-26 21:22:41', '', 2),
(133, NULL, '2018-02-26 21:23:32', 's', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `jumlah_kendaraan`
-- (See below for the actual view)
--
CREATE TABLE `jumlah_kendaraan` (
`id_masuk` int(3)
,`kode_unik` bigint(100)
,`nopol` varchar(10)
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
,`nopol` varchar(10)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kendaraan_bayar`  AS  select `cm`.`id_masuk` AS `id_masuk`,`cm`.`kode_unik` AS `kode_unik`,`cm`.`nopol` AS `nopol`,`cm`.`waktu_masuk` AS `waktu_masuk`,`ck`.`waktu_keluar` AS `waktu_keluar`,`p`.`nama_petugas` AS `nama_petugas`,`ck`.`biaya` AS `biaya`,`ck`.`pembayaran` AS `pembayaran` from ((`catat_keluar` `ck` left join `catat_masuk` `cm` on((`cm`.`id_masuk` = `ck`.`id_keluar`))) left join `petugas` `p` on((`p`.`id_petugas` = `ck`.`id_petugas`))) ;

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
  MODIFY `id_keluar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catat_masuk`
--
ALTER TABLE `catat_masuk`
  MODIFY `id_masuk` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

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
