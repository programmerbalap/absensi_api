-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Feb 2024 pada 07.51
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
-- Struktur dari tabel `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id` int(11) NOT NULL,
  `uuid_karyawan` varchar(255) NOT NULL,
  `hk_gaji` tinyint(1) DEFAULT 0,
  `hk_absensi` tinyint(1) DEFAULT 0,
  `hk_kemampuan` tinyint(1) DEFAULT 0,
  `hk_keterlambatan` tinyint(1) DEFAULT 0,
  `hk_notifikasi` tinyint(1) DEFAULT 0,
  `hk_hak_akses` tinyint(1) NOT NULL DEFAULT 0,
  `hk_jabatan` tinyint(1) NOT NULL DEFAULT 0,
  `hk_bonus` tinyint(1) NOT NULL DEFAULT 0,
  `hk_produksi` tinyint(1) NOT NULL DEFAULT 0,
  `hk_karyawan` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `hak_akses`
--

INSERT INTO `hak_akses` (`id`, `uuid_karyawan`, `hk_gaji`, `hk_absensi`, `hk_kemampuan`, `hk_keterlambatan`, `hk_notifikasi`, `hk_hak_akses`, `hk_jabatan`, `hk_bonus`, `hk_produksi`, `hk_karyawan`, `createdAt`, `updatedAt`) VALUES
(3, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 17:48:58', '2024-01-05 17:54:26'),
(4, '7aae7922-bb88-463d-95b5-43d5944526dc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 17:48:58', '2024-01-05 17:48:58'),
(5, '12a9b66e-d53b-4537-80da-550575342574', 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
(6, '26c107e5-950c-4034-bbe9-c83e74471a49', 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
(7, '8361979b-8610-40d1-a14b-ef5e21224b20', 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
(8, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
(9, '52eef27f-09a4-4906-b3f8-8916885500a1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-07 07:00:26', '2024-01-07 07:00:26'),
(10, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-07 18:15:57', '2024-01-07 18:15:57');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid_karyawan` (`uuid_karyawan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD CONSTRAINT `hak_akses_ibfk_1` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
