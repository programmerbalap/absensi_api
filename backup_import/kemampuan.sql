-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Feb 2024 pada 07.49
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
-- Struktur dari tabel `kemampuan`
--

CREATE TABLE `kemampuan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kemampuan`
--

INSERT INTO `kemampuan` (`id`, `nama`, `createdAt`, `updatedAt`) VALUES
(1, 'Pemula', '2023-11-29 05:04:19', '2024-01-30 14:45:22'),
(2, 'Menengah', '2023-11-29 05:04:29', '2023-11-29 05:04:29'),
(3, 'Mahir', '2023-11-29 05:04:36', '2023-11-29 05:04:36'),
(4, 'Ahli', '2023-11-29 05:04:44', '2023-11-29 05:04:44');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kemampuan`
--
ALTER TABLE `kemampuan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kemampuan`
--
ALTER TABLE `kemampuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
