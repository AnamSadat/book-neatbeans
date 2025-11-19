-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 12, 2025 at 06:49 AM
-- Server version: 9.4.0
-- PHP Version: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasipembelian`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabelbarang`
--

CREATE TABLE `tabelbarang` (
  `Kode` varchar(100) NOT NULL,
  `NamaBarang` varchar(50) DEFAULT NULL,
  `HargaBeli` int DEFAULT NULL,
  `HargaJual` int DEFAULT NULL,
  `Stok` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelbarang`
--

INSERT INTO `tabelbarang` (`Kode`, `NamaBarang`, `HargaBeli`, `HargaJual`, `Stok`) VALUES
('B1', 'nama', 187, 1837, 387),
('B2', 'oke', 81, 837, 87),
('B4', 'Variabel', 12000, 12000, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tabelpembelian`
--

CREATE TABLE `tabelpembelian` (
  `NoTransaksi` varchar(100) NOT NULL,
  `Tgl` date DEFAULT NULL,
  `KodeSupp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelpembelian`
--

INSERT INTO `tabelpembelian` (`NoTransaksi`, `Tgl`, `KodeSupp`) VALUES
('sas', '1290-12-31', 'saya'),
('T1', '2024-12-29', 'saya');

-- --------------------------------------------------------

--
-- Table structure for table `tabelpembeliandetail`
--

CREATE TABLE `tabelpembeliandetail` (
  `NoTransaksi` varchar(100) NOT NULL,
  `KodeBarang` varchar(100) NOT NULL,
  `Jumlah` int DEFAULT NULL,
  `TotalHarga` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelpembeliandetail`
--

INSERT INTO `tabelpembeliandetail` (`NoTransaksi`, `KodeBarang`, `Jumlah`, `TotalHarga`) VALUES
('sas', 'b1', 12, 2244),
('T1', 'B1', 10, 1870),
('T1', 'B2', 5, 405);

-- --------------------------------------------------------

--
-- Table structure for table `tabelsuplier`
--

CREATE TABLE `tabelsuplier` (
  `KodeSuplier` varchar(60) NOT NULL,
  `NamaSuplier` varchar(60) DEFAULT NULL,
  `Kontak` varchar(60) DEFAULT NULL,
  `Telpon` int DEFAULT NULL,
  `Fax` varchar(60) DEFAULT NULL,
  `Alamat` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tabelsuplier`
--

INSERT INTO `tabelsuplier` (`KodeSuplier`, `NamaSuplier`, `Kontak`, `Telpon`, `Fax`, `Alamat`) VALUES
('qd', 'qqe', 'eqe', 4242, 'fgdf', 'fwrwdw'),
('saya', 'nama', 'oke', 193, 'ska', 'daj');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_tabelpembelian`
-- (See below for the actual view)
--
CREATE TABLE `view_tabelpembelian` (
`HargaBeli` int
,`Jumlah` int
,`Kode` varchar(100)
,`NamaBarang` varchar(50)
,`NoTransaksi` varchar(100)
,`TotalHarga` int
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabelbarang`
--
ALTER TABLE `tabelbarang`
  ADD PRIMARY KEY (`Kode`);

--
-- Indexes for table `tabelpembelian`
--
ALTER TABLE `tabelpembelian`
  ADD KEY `fk_tabelpembelian_tabelsuplier` (`KodeSupp`);

--
-- Indexes for table `tabelpembeliandetail`
--
ALTER TABLE `tabelpembeliandetail`
  ADD KEY `fk_tabelpembeliandetail_tabelbarang` (`KodeBarang`);

--
-- Indexes for table `tabelsuplier`
--
ALTER TABLE `tabelsuplier`
  ADD PRIMARY KEY (`KodeSuplier`);

-- --------------------------------------------------------

--
-- Structure for view `view_tabelpembelian`
--
DROP TABLE IF EXISTS `view_tabelpembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_tabelpembelian`  AS SELECT `tabelpembelian`.`NoTransaksi` AS `NoTransaksi`, `tabelbarang`.`Kode` AS `Kode`, `tabelbarang`.`NamaBarang` AS `NamaBarang`, `tabelbarang`.`HargaBeli` AS `HargaBeli`, `tabelpembeliandetail`.`Jumlah` AS `Jumlah`, `tabelpembeliandetail`.`TotalHarga` AS `TotalHarga` FROM ((`tabelpembelian` join `tabelpembeliandetail` on((`tabelpembelian`.`NoTransaksi` = `tabelpembeliandetail`.`NoTransaksi`))) join `tabelbarang` on((`tabelpembeliandetail`.`KodeBarang` = `tabelbarang`.`Kode`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabelpembelian`
--
ALTER TABLE `tabelpembelian`
  ADD CONSTRAINT `fk_tabelpembelian_tabelsuplier` FOREIGN KEY (`KodeSupp`) REFERENCES `tabelsuplier` (`KodeSuplier`);

--
-- Constraints for table `tabelpembeliandetail`
--
ALTER TABLE `tabelpembeliandetail`
  ADD CONSTRAINT `fk_tabelpembeliandetail_tabelbarang` FOREIGN KEY (`KodeBarang`) REFERENCES `tabelbarang` (`Kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
