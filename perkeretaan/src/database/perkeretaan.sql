-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 06:02 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perkeretaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` varchar(5) NOT NULL,
  `id_keretaFK` varchar(5) NOT NULL,
  `id_stasiunFK` varchar(5) NOT NULL,
  `tanggal_berangkat` datetime NOT NULL,
  `harga_tiket` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_keretaFK`, `id_stasiunFK`, `tanggal_berangkat`, `harga_tiket`) VALUES
('J1', 'K1', 'S1', '2023-06-28 17:55:00', 180000),
('J2', 'K2', 'S2', '2023-07-06 20:18:00', 3500000);

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--

CREATE TABLE `kereta` (
  `id_kereta` varchar(5) NOT NULL,
  `nama_kereta` varchar(45) NOT NULL,
  `kelas_kereta` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kereta`
--

INSERT INTO `kereta` (`id_kereta`, `nama_kereta`, `kelas_kereta`) VALUES
('K1', 'Batik', 'Eksekutif'),
('K2', 'Shinkansen', 'VIP');

-- --------------------------------------------------------

--
-- Table structure for table `kereta_has_stasiun`
--

CREATE TABLE `kereta_has_stasiun` (
  `id_keretaFK` varchar(5) NOT NULL,
  `id_stasiunFK` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penumpang`
--

CREATE TABLE `penumpang` (
  `no_telp` varchar(12) NOT NULL,
  `nama_penumpang` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stasiun`
--

CREATE TABLE `stasiun` (
  `id_stasiun` varchar(5) NOT NULL,
  `nama_stasiun` varchar(45) NOT NULL,
  `kota_stasiun` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stasiun`
--

INSERT INTO `stasiun` (`id_stasiun`, `nama_stasiun`, `kota_stasiun`) VALUES
('S1', 'Tugu', 'Jogja'),
('S2', 'Shinjuku', 'Tokyo');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(5) NOT NULL,
  `no_telpFK` varchar(12) NOT NULL,
  `id_keretaFK` varchar(5) NOT NULL,
  `id_jadwalFK` varchar(5) NOT NULL,
  `id_stasiunFK` varchar(5) NOT NULL,
  `jumlah_tiket` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `nama`, `status`) VALUES
('admin', '1234', 'Admin Aplikasi', 'Administrator'),
('arnold', 'arnold123', 'Urjel Arnold B', 'Penumpang'),
('nendra', 'nendra123', 'Nendra Atvirya I', 'Penumpang'),
('raihan', 'raihan123', 'Raihan Rafi R', 'Penumpang'),
('zolla', 'zolla123', 'Zolla Humicha R', 'Penumpang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `kereta`
--
ALTER TABLE `kereta`
  ADD PRIMARY KEY (`id_kereta`);

--
-- Indexes for table `kereta_has_stasiun`
--
ALTER TABLE `kereta_has_stasiun`
  ADD KEY `id_keretaFK` (`id_keretaFK`),
  ADD KEY `id_stasiunFK` (`id_stasiunFK`);

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`no_telp`);

--
-- Indexes for table `stasiun`
--
ALTER TABLE `stasiun`
  ADD PRIMARY KEY (`id_stasiun`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `no_telpFK` (`no_telpFK`),
  ADD KEY `id_keretaFK` (`id_keretaFK`),
  ADD KEY `id_jadwalFK` (`id_jadwalFK`),
  ADD KEY `id_stasiunFK` (`id_stasiunFK`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kereta_has_stasiun`
--
ALTER TABLE `kereta_has_stasiun`
  ADD CONSTRAINT `kereta_has_stasiun_ibfk_1` FOREIGN KEY (`id_keretaFK`) REFERENCES `kereta` (`id_kereta`),
  ADD CONSTRAINT `kereta_has_stasiun_ibfk_2` FOREIGN KEY (`id_stasiunFK`) REFERENCES `stasiun` (`id_stasiun`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`no_telpFK`) REFERENCES `penumpang` (`no_telp`),
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`id_keretaFK`) REFERENCES `kereta` (`id_kereta`),
  ADD CONSTRAINT `tiket_ibfk_3` FOREIGN KEY (`id_jadwalFK`) REFERENCES `jadwal` (`id_jadwal`),
  ADD CONSTRAINT `tiket_ibfk_4` FOREIGN KEY (`id_stasiunFK`) REFERENCES `stasiun` (`id_stasiun`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
