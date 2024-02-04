-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Feb 2024 pada 06.57
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_dev`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `statis`
--

CREATE TABLE `statis` (
  `id` int(11) NOT NULL,
  `jam_start` time NOT NULL,
  `jam_end` time NOT NULL,
  `min_efektif_start` int(11) NOT NULL,
  `shift` varchar(20) NOT NULL,
  `nominal_bonus` float NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `statis`
--

INSERT INTO `statis` (`id`, `jam_start`, `jam_end`, `min_efektif_start`, `shift`, `nominal_bonus`, `aktif`, `createdAt`, `updatedAt`) VALUES
(1, '08:00:00', '15:00:00', 15, 'Normal', 200000, 1, '2023-12-14 06:14:02', '2024-01-30 16:25:45'),
(2, '16:00:00', '20:00:00', 20, 'Lembur', 200000, 0, '2023-12-16 11:27:11', '2024-01-30 16:49:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `statis`
--
-- ALTER TABLE `statis`
--   ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `statis`
--
ALTER TABLE `statis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
