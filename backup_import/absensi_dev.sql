-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Mar 2024 pada 19.13
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
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `uuid_karyawan` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `hadir` enum('Hadir','Izin','Tidak Hadir') DEFAULT 'Tidak Hadir',
  `keterangan` varchar(255) DEFAULT NULL,
  `nama_lokasi` varchar(100) NOT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `shift` enum('Normal','Lembur') DEFAULT 'Normal',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `bonus` tinyint(1) DEFAULT 0,
  `nominal_bonus` int(11) DEFAULT NULL,
  `nominal_gaji` int(11) DEFAULT NULL,
  `kemampuan` varchar(255) DEFAULT NULL,
  `jabatan` varchar(200) DEFAULT NULL,
  `penjab` varchar(200) DEFAULT NULL,
  `exp` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `uuid_karyawan`, `tanggal`, `hadir`, `keterangan`, `nama_lokasi`, `time_start`, `time_end`, `shift`, `latitude`, `longitude`, `bonus`, `nominal_bonus`, `nominal_gaji`, `kemampuan`, `jabatan`, `penjab`, `exp`, `createdAt`, `updatedAt`) VALUES
(28, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-01-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '15:24:53', 'Normal', -7.7114157, 113.4975077, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-01-21 06:18:55', '2024-01-21 08:24:54'),
(29, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-01-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '15:24:53', 'Normal', -7.7114157, 113.4975077, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-01-21 06:19:05', '2024-01-21 08:24:54'),
(30, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-01-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '15:24:53', 'Normal', -7.7114157, 113.4975077, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-01-21 06:19:11', '2024-01-21 08:24:54'),
(31, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-01-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '15:24:53', 'Normal', -7.7114157, 113.4975077, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-01-21 06:19:16', '2024-01-21 08:24:54'),
(32, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-01-21 00:00:00', 'Izin', 'Sakit', 'Kantor Bumpes', '13:19:25', '15:24:53', 'Normal', -7.7114157, 113.4975077, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-01-21 06:19:27', '2024-01-21 08:24:54'),
(33, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-01-21 00:00:00', 'Tidak Hadir', 'Alpha', 'Kantor Bumpes', '13:19:38', '15:24:53', 'Normal', -7.7114157, 113.4975077, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-01-21 06:19:39', '2024-01-21 08:24:54'),
(34, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-15 00:00:00', 'Hadir', 'Hadir', 'Default', '08:00:00', '13:07:18', 'Normal', -7.7195395, 113.489504, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-15 06:01:56', '2024-02-15 06:07:22'),
(35, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-15 00:00:00', 'Hadir', 'Hadir', 'Default', '08:00:00', '13:07:18', 'Normal', -7.7195395, 113.489504, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-15 06:01:56', '2024-02-15 06:07:22'),
(36, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-15 00:00:00', 'Hadir', 'Hadir', 'Default', '08:00:00', '13:07:18', 'Normal', -7.7195395, 113.489504, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-15 06:01:56', '2024-02-15 06:07:22'),
(37, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-15 00:00:00', 'Hadir', 'Hadir', 'Default', '08:00:00', '13:07:18', 'Normal', -7.7195395, 113.489504, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-15 06:01:56', '2024-02-15 06:07:22'),
(38, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-15 00:00:00', 'Hadir', 'Hadir', 'Default', '08:00:00', '13:07:18', 'Normal', -7.7195395, 113.489504, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-15 06:01:56', '2024-02-15 06:07:22'),
(39, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-15 00:00:00', 'Hadir', 'Hadir', 'Default', '08:00:00', '13:07:18', 'Normal', -7.7195395, 113.489504, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-15 06:01:56', '2024-02-15 06:07:22'),
(40, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-17 00:00:00', 'Hadir', 'Hadir', 'Default', '16:00:00', '18:30:30', 'Lembur', -7.7195395, 113.489504, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-17 04:06:47', '2024-02-17 04:07:00'),
(41, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-17 00:00:00', 'Hadir', 'Hadir', 'Default', '16:00:00', '17:00:00', 'Lembur', -7.7195395, 113.489504, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-17 04:06:47', '2024-02-17 04:07:00'),
(42, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-17 00:00:00', 'Hadir', 'Hadir', 'Default', '16:00:00', '16:30:00', 'Lembur', -7.7195395, 113.489504, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-17 04:06:47', '2024-02-17 04:07:00'),
(43, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-17 00:00:00', 'Hadir', 'Hadir', 'Default', '16:00:00', '19:40:40', 'Lembur', -7.7195395, 113.489504, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-17 04:06:47', '2024-02-17 04:07:00'),
(44, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-17 00:00:00', 'Hadir', 'Hadir', 'Default', '16:00:00', '18:30:00', 'Lembur', -7.7195395, 113.489504, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-17 04:06:47', '2024-02-17 04:07:00'),
(45, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-17 00:00:00', 'Hadir', 'Hadir', 'Default', '16:00:00', '16:25:00', 'Lembur', -7.7195395, 113.489504, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-17 04:06:47', '2024-02-17 04:07:00'),
(46, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '21:10:52', 'Normal', -7.7114159, 113.4975235, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-21 06:34:22', '2024-02-21 14:10:54'),
(47, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '21:11:08', 'Normal', -7.7114159, 113.4975235, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-21 06:34:22', '2024-02-21 14:11:10'),
(48, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', '21:11:14', 'Normal', -7.7114159, 113.4975235, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-21 06:34:22', '2024-02-21 14:11:16'),
(49, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', NULL, 'Normal', -7.7114159, 113.4975235, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 1, '2024-02-21 06:34:22', '2024-02-26 21:46:42'),
(50, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', NULL, 'Normal', -7.7114159, 113.4975235, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-21 06:34:22', '2024-02-26 21:46:42'),
(51, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '08:00:00', NULL, 'Normal', -7.7114159, 113.4975235, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 1, '2024-02-21 06:34:22', '2024-02-26 21:46:42'),
(52, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '21:17:22', NULL, 'Normal', -7.7109102, 113.4943518, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 1, '2024-02-21 14:17:23', '2024-02-26 21:46:42'),
(53, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '21:17:28', NULL, 'Normal', -7.7109102, 113.4943518, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 1, '2024-02-21 14:17:30', '2024-02-26 21:46:42'),
(54, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-21 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '21:17:32', NULL, 'Normal', -7.7109102, 113.4943518, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-21 14:17:33', '2024-02-26 21:46:42'),
(55, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-22 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '05:03:29', NULL, 'Normal', -7.7109202, 113.4943603, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-21 22:03:31', '2024-02-26 21:46:42'),
(56, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-22 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '05:03:46', NULL, 'Normal', -7.7109202, 113.4943603, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 1, '2024-02-21 22:03:48', '2024-02-26 21:46:42'),
(57, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-22 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '05:20:58', '05:49:03', 'Normal', -7.7110055, 113.494214, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-21 22:21:00', '2024-02-21 22:49:04'),
(58, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-22 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '05:22:29', NULL, 'Normal', -7.7110374, 113.4943588, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 1, '2024-02-21 22:22:30', '2024-02-26 21:46:42'),
(59, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-22 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '05:23:40', NULL, 'Normal', -7.7109124, 113.494391, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-21 22:23:41', '2024-02-26 21:46:42'),
(60, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-22 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '05:24:25', '06:14:21', 'Normal', -7.7109789, 113.4942931, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-21 22:24:27', '2024-02-21 23:14:22'),
(61, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-23 00:00:00', 'Hadir', 'Hadir', 'Default', '05:15:22', '05:34:22', 'Normal', -7.7195395, 113.489504, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-22 22:15:24', '2024-02-22 22:34:23'),
(62, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-23 00:00:00', 'Hadir', 'Hadir', 'Default', '05:34:29', '05:40:04', 'Normal', -7.7195395, 113.489504, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-22 22:34:30', '2024-02-22 22:40:05'),
(63, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-23 00:00:00', 'Hadir', 'Hadir', 'Default', '05:40:30', NULL, 'Normal', -7.7195395, 113.489504, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-22 22:40:32', '2024-02-26 21:46:42'),
(64, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-23 00:00:00', 'Tidak Hadir', 'Alpha', 'Default', '05:44:34', NULL, 'Normal', -7.7195395, 113.489504, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 1, '2024-02-22 22:44:36', '2024-02-26 21:46:42'),
(65, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-23 00:00:00', 'Izin', 'Bepergian', 'Default', '05:44:53', NULL, 'Normal', -7.7195395, 113.489504, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 1, '2024-02-22 22:44:55', '2024-02-26 21:46:42'),
(66, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-23 00:00:00', 'Hadir', 'Hadir', 'Default', '05:45:05', NULL, 'Normal', -7.7195395, 113.489504, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-22 22:45:07', '2024-02-26 21:46:42'),
(67, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-23 00:00:00', 'Hadir', 'Hadir', 'Default', '05:45:12', NULL, 'Normal', -7.7195395, 113.489504, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 1, '2024-02-22 22:45:14', '2024-02-26 21:46:42'),
(68, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-23 00:00:00', 'Tidak Hadir', 'Alpha', 'Default', '05:45:18', NULL, 'Normal', -7.7195395, 113.489504, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 1, '2024-02-22 22:45:20', '2024-02-26 21:46:42'),
(72, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-25 00:00:00', 'Izin', 'Bepergian ke Luar Kota', '', '16:35:48', NULL, 'Lembur', NULL, NULL, 0, NULL, NULL, 'Pemula', NULL, NULL, 1, '2024-02-25 09:35:49', '2024-02-26 21:46:42'),
(74, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-26 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '16:56:14', '17:15:12', 'Lembur', -7.7114025, 113.4975217, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-26 09:56:15', '2024-02-26 10:15:14'),
(75, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-26 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '17:00:24', '17:15:12', 'Lembur', -7.7114058, 113.4975121, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-26 10:00:26', '2024-02-26 10:15:14'),
(76, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-26 00:00:00', 'Izin', 'Sakit kepala ', 'Kantor Bumpes', '17:04:02', '17:15:12', 'Lembur', -7.7114026, 113.4975201, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-26 10:04:03', '2024-02-26 10:15:14'),
(77, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-26 00:00:00', 'Izin', 'Sakit Kepala', 'Kantor Bumpes', '17:04:26', '17:15:12', 'Lembur', -7.7114056, 113.4975167, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-26 10:04:28', '2024-02-26 10:15:14'),
(78, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-26 00:00:00', 'Izin', 'Sakit Gigi', 'Kantor Bumpes', '17:04:49', '17:15:12', 'Lembur', -7.7114079, 113.4975133, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-26 10:04:52', '2024-02-26 10:15:14'),
(79, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-26 00:00:00', 'Tidak Hadir', 'Alpha', 'Kantor Bumpes', '17:14:36', '17:15:12', 'Lembur', -7.7114016, 113.4975183, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-26 10:14:40', '2024-02-26 10:15:14'),
(80, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-26 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '17:16:06', '17:29:52', 'Lembur', -7.7114016, 113.4975183, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-26 10:16:08', '2024-02-26 10:29:54'),
(81, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-26 00:00:00', 'Izin', 'Sakit kepala', 'Kantor Bumpes', '17:24:25', '17:29:52', 'Lembur', -7.7114297, 113.4975016, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-26 10:24:27', '2024-02-26 10:29:54'),
(82, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-26 00:00:00', 'Izin', 'Sakit Kepalaaa', 'Kantor Bumpes', '17:25:26', '17:29:52', 'Lembur', -7.7114297, 113.4975016, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-26 10:25:28', '2024-02-26 10:29:54'),
(83, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-26 00:00:00', 'Izin', 'Sakit kepala', 'Kantor Bumpes', '17:25:38', '17:29:52', 'Lembur', -7.7114047, 113.4975077, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-26 10:25:39', '2024-02-26 10:29:54'),
(84, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-26 00:00:00', 'Izin', 'sakit kepala', 'Kantor Bumpes', '17:26:07', '17:29:52', 'Lembur', -7.7114047, 113.4975077, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-26 10:26:09', '2024-02-26 10:29:54'),
(85, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-26 00:00:00', 'Izin', 'Skky', 'Kantor Bumpes', '17:28:48', '17:29:52', 'Lembur', -7.7114035, 113.4975077, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-26 10:28:49', '2024-02-26 10:29:54'),
(86, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-26 00:00:00', 'Izin', 'sakit', 'Kantor Bumpes', '17:30:25', NULL, 'Lembur', -7.7114025, 113.4975233, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-26 10:30:26', '2024-02-26 21:46:42'),
(87, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-26 00:00:00', 'Hadir', 'Hadir', 'Kantor Bumpes', '17:30:44', NULL, 'Lembur', -7.7114025, 113.4975233, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 1, '2024-02-26 10:30:48', '2024-02-26 21:46:42'),
(88, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-26 00:00:00', 'Tidak Hadir', 'Alpha', 'Kantor Bumpes', '17:30:54', NULL, 'Lembur', -7.7114002, 113.4975222, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 1, '2024-02-26 10:30:56', '2024-02-26 21:46:42'),
(89, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-26 00:00:00', 'Izin', 'sakit', 'Kantor Bumpes', '17:38:19', NULL, 'Lembur', -7.7114018, 113.4975126, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 1, '2024-02-26 10:38:21', '2024-02-26 21:46:42'),
(90, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-26 00:00:00', 'Izin', 'Sakit', 'Kantor Bumpes', '17:38:38', NULL, 'Lembur', -7.7114018, 113.4975126, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 1, '2024-02-26 10:38:40', '2024-02-26 21:46:42'),
(91, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-26 00:00:00', 'Tidak Hadir', 'Alpha', 'Kantor Bumpes', '17:38:45', NULL, 'Lembur', -7.7114018, 113.4975126, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 1, '2024-02-26 10:38:46', '2024-02-26 21:46:42'),
(92, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-27 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:22:58', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-27 07:40:06', '2024-02-27 08:23:00'),
(93, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-27 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:23:08', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-27 07:40:06', '2024-02-27 08:23:10'),
(96, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-27 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:23:16', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-27 07:40:06', '2024-02-27 08:23:17'),
(97, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-27 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:23:16', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-27 07:40:06', '2024-02-27 08:23:17'),
(98, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:21:38', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-28 12:21:18', '2024-02-28 12:21:39'),
(99, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:21:38', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-28 12:21:18', '2024-02-28 12:21:39'),
(100, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:21:38', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:21:18', '2024-02-28 12:21:39'),
(101, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:21:38', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-28 12:21:18', '2024-02-28 12:21:39'),
(102, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:21:38', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:21:18', '2024-02-28 12:21:39'),
(103, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:21:38', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-28 12:21:18', '2024-02-28 12:21:39'),
(104, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:29:10', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-28 12:28:58', '2024-02-28 12:29:12'),
(105, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:29:10', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-28 12:28:58', '2024-02-28 12:29:12'),
(106, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:29:10', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:28:58', '2024-02-28 12:29:12'),
(107, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:29:10', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-28 12:28:58', '2024-02-28 12:29:12'),
(108, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:29:10', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:28:58', '2024-02-28 12:29:12'),
(109, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:29:10', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-28 12:28:58', '2024-02-28 12:29:12'),
(110, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:32:10', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-28 12:31:57', '2024-02-28 12:32:12'),
(111, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:32:10', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-28 12:31:57', '2024-02-28 12:32:12'),
(112, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:32:10', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:31:57', '2024-02-28 12:32:12'),
(113, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:32:10', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-28 12:31:57', '2024-02-28 12:32:12'),
(114, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:32:10', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:31:57', '2024-02-28 12:32:12'),
(115, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:32:10', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-28 12:31:57', '2024-02-28 12:32:12'),
(116, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:39:48', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-02-28 12:36:08', '2024-02-28 12:39:49'),
(117, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:39:48', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-02-28 12:36:08', '2024-02-28 12:39:49'),
(118, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:39:48', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:36:08', '2024-02-28 12:39:49'),
(119, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:39:48', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-02-28 12:36:08', '2024-02-28 12:39:49'),
(120, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:39:48', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-02-28 12:36:08', '2024-02-28 12:39:49'),
(121, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-28 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '19:39:48', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-02-28 12:36:08', '2024-02-28 12:39:49'),
(122, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:19:00', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-01 08:18:35', '2024-03-01 08:19:02'),
(123, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:19:00', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-03-01 08:18:35', '2024-03-01 08:19:02'),
(124, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:19:00', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-01 08:18:35', '2024-03-01 08:19:02'),
(125, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:19:00', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-01 08:18:35', '2024-03-01 08:19:02'),
(126, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:19:00', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-01 08:18:35', '2024-03-01 08:19:02'),
(127, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:19:00', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-03-01 08:18:35', '2024-03-01 08:19:02'),
(132, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '18:32:34', '21:32:41', 'Lembur', 0, 0, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-01 14:32:57', '2024-03-01 14:32:57'),
(134, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-01 00:00:00', 'Hadir', 'Hadir', '-', '21:34:21', '23:36:22', 'Lembur', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-01 14:36:30', '2024-03-01 17:26:50'),
(137, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '13:16:16', '13:35:49', 'Normal', 0, 0, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-03-02 06:16:18', '2024-03-02 06:35:50'),
(138, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '13:35:53', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-02 06:32:06', '2024-03-02 06:35:55'),
(139, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '13:35:57', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-02 06:34:37', '2024-03-02 06:35:59'),
(140, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '13:35:41', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-02 06:34:44', '2024-03-02 06:35:46'),
(141, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '13:36:02', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-02 06:34:52', '2024-03-02 06:36:03'),
(142, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '13:36:05', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-03-02 06:34:58', '2024-03-02 06:36:06'),
(143, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '13:36:11', '13:36:17', 'Normal', 0, 0, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-02 06:36:13', '2024-03-02 06:36:20'),
(144, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '15:24:42', '15:44:47', 'Normal', 0, 0, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-02 08:24:44', '2024-03-02 08:44:48'),
(145, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-02 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '15:25:50', '15:44:47', 'Normal', -7.7109221, 113.4943549, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-02 08:25:52', '2024-03-02 08:44:48'),
(146, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-02 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '15:25:57', '15:44:47', 'Normal', -7.7109221, 113.4943549, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-03-02 08:25:58', '2024-03-02 08:44:48'),
(147, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-02 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '15:26:02', '15:44:47', 'Normal', -7.7109139, 113.4943493, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-02 08:26:03', '2024-03-02 08:44:48'),
(148, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-02 00:00:00', 'Hadir', 'Hadir', 'Asrama F', '15:26:07', '15:44:47', 'Normal', -7.7109139, 113.4943493, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-02 08:26:08', '2024-03-02 08:44:48'),
(149, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-02 00:00:00', 'Izin', 'Sakit Kepala', 'Asrama F', '15:26:22', '15:44:47', 'Normal', -7.7109139, 113.4943493, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-03-02 08:26:23', '2024-03-02 08:44:48'),
(150, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:49:14', 'Normal', 0, 0, 1, NULL, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-02 08:47:17', '2024-03-02 08:49:16'),
(151, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:49:14', 'Normal', 0, 0, 1, NULL, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-03-02 08:47:17', '2024-03-02 08:49:16'),
(152, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:49:14', 'Normal', 0, 0, 1, NULL, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-02 08:47:17', '2024-03-02 08:49:16'),
(153, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:49:14', 'Normal', 0, 0, 1, NULL, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-02 08:47:17', '2024-03-02 08:49:16'),
(154, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:49:14', 'Normal', 0, 0, 1, NULL, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-02 08:47:17', '2024-03-02 08:49:16'),
(155, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-02 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '15:49:14', 'Normal', 0, 0, 1, NULL, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-03-02 08:47:17', '2024-03-02 08:49:16'),
(156, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-05 00:00:00', 'Hadir', 'Hadir', '-', '02:37:24', '05:34:42', 'Normal', 0, 0, 0, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-04 19:37:24', '2024-03-04 22:34:44'),
(157, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-05 00:00:00', 'Hadir', 'Hadir', '-', '02:37:24', '05:34:42', 'Normal', 0, 0, 0, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-03-04 19:37:24', '2024-03-04 22:34:44'),
(158, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-05 00:00:00', 'Hadir', 'Hadir', '-', '02:37:24', '05:34:42', 'Normal', 0, 0, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-04 19:37:24', '2024-03-04 22:34:44'),
(159, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-05 00:00:00', 'Hadir', 'Hadir', '-', '02:37:24', '05:34:42', 'Normal', 0, 0, 0, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-04 19:37:24', '2024-03-04 22:34:44'),
(160, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-05 00:00:00', 'Hadir', 'Hadir', '-', '02:37:24', '05:34:42', 'Normal', 0, 0, 0, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-04 19:37:24', '2024-03-04 22:34:44'),
(161, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-05 00:00:00', 'Hadir', 'Hadir', '-', '02:37:24', '05:34:42', 'Normal', 0, 0, 0, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-03-04 19:37:24', '2024-03-04 22:34:44'),
(162, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-08 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '12:36:08', 'Normal', 0, 0, 1, 200000, 8000, 'Pemula', 'Produksi', 'Gigih', 0, '2024-03-08 03:09:56', '2024-03-08 05:36:16'),
(163, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-08 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '12:36:08', 'Normal', 0, 0, 1, 200000, 10000, 'Pemula', 'Supervisor', 'Gigih', 0, '2024-03-08 03:09:56', '2024-03-08 05:36:16'),
(164, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-08 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '12:36:08', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-08 03:09:56', '2024-03-08 05:36:16'),
(165, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-08 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '12:36:08', 'Normal', 0, 0, 1, 200000, 11000, 'Ahli', 'Produksi', 'Gigih', 0, '2024-03-08 03:09:56', '2024-03-08 05:36:16'),
(166, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-08 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '12:36:08', 'Normal', 0, 0, 1, 200000, 10000, 'Mahir', 'Produksi', 'Gigih', 0, '2024-03-08 03:09:56', '2024-03-08 05:36:16'),
(167, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-08 00:00:00', 'Hadir', 'Hadir', '-', '08:00:00', '12:36:08', 'Normal', 0, 0, 1, 200000, 9000, 'Menengah', 'Produksi', 'Gigih', 0, '2024-03-08 03:09:56', '2024-03-08 05:36:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `akses`
--

CREATE TABLE `akses` (
  `uuid_karyawan` varchar(255) NOT NULL,
  `hk_karyawan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `hk_lokasi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hk_lokasi`)),
  `hk_absensi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hk_absensi`)),
  `hk_produksi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hk_produksi`)),
  `hk_produk` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hk_produk`)),
  `hk_shift` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`hk_shift`)),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akses`
--

INSERT INTO `akses` (`uuid_karyawan`, `hk_karyawan`, `hk_lokasi`, `hk_absensi`, `hk_produksi`, `hk_produk`, `hk_shift`, `createdAt`, `updatedAt`) VALUES
('12a9b66e-d53b-4537-80da-550575342574', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:19:49', '2024-03-02 18:19:49'),
('26c107e5-950c-4034-bbe9-c83e74471a49', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":true}', '{\"edit\":false,\"tambah\":false,\"hapus\":true,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":true,\"lihat\":false}', '{\"edit\":true,\"tambah\":false,\"hapus\":false,\"lihat\":true}', '{\"edit\":true,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:21:31', '2024-03-06 00:47:44'),
('4ba242d9-b53a-4497-bea0-8f1f854cd09c', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:21:55', '2024-03-02 18:21:55'),
('4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":true}', '{\"edit\":false,\"tambah\":false,\"hapus\":true,\"lihat\":false}', '{\"edit\":false,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":true,\"lihat\":false}', '{\"edit\":false,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":true,\"hapus\":true,\"lihat\":false}', '2024-03-02 18:22:15', '2024-03-06 00:48:28'),
('52eef27f-09a4-4906-b3f8-8916885500a1', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":true,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '{\"edit\":true,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:22:44', '2024-03-06 00:47:11'),
('7aae7922-bb88-463d-95b5-43d5944526dc', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:22:59', '2024-03-02 18:22:59'),
('8361979b-8610-40d1-a14b-ef5e21224b20', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:23:15', '2024-03-02 18:23:15'),
('b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '{\"edit\":false,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '{\"edit\":true,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '{\"edit\":true,\"tambah\":false,\"hapus\":true,\"lihat\":false}', '{\"edit\":false,\"tambah\":false,\"hapus\":true,\"lihat\":true}', '{\"edit\":false,\"tambah\":false,\"hapus\":true,\"lihat\":false}', '{\"edit\":false,\"tambah\":true,\"hapus\":false,\"lihat\":false}', '2024-03-02 18:23:37', '2024-03-06 00:48:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doc`
--

CREATE TABLE `doc` (
  `uuid_karyawan` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `doc`
--

INSERT INTO `doc` (`uuid_karyawan`, `foto`, `createdAt`, `updatedAt`) VALUES
('12a9b66e-d53b-4537-80da-550575342574', 'STG-17084689053401708468905320.png', '2023-12-02 03:58:01', '2024-02-20 22:41:45'),
('8361979b-8610-40d1-a14b-ef5e21224b20', 'STG-17039153381001703915338080.jpg', '2023-12-04 07:54:09', '2023-12-30 05:48:58'),
('4ba242d9-b53a-4497-bea0-8f1f854cd09c', 'STG-17084646427551708464642735.png', '2023-12-04 07:57:19', '2024-02-20 21:30:42'),
('7aae7922-bb88-463d-95b5-43d5944526dc', 'STG-17039153043021703915304282.jpg', '2023-12-04 11:39:29', '2023-12-30 05:48:24'),
('b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 'STG-17039154160171703915415997.jpg', '2023-12-04 11:41:20', '2023-12-30 05:50:16'),
('26c107e5-950c-4034-bbe9-c83e74471a49', 'STG-17084688647901708468864770.png', '2023-12-04 11:43:26', '2024-02-20 22:41:04'),
('52eef27f-09a4-4906-b3f8-8916885500a1', 'STG-17046508335101704650833490.jpg', '2024-01-07 07:00:26', '2024-01-07 18:07:13'),
('4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 'STG-17084687413881708468741368.png', '2024-01-07 18:15:57', '2024-02-20 22:39:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `id` int(11) NOT NULL,
  `nominal` float NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_kemampuan` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`id`, `nominal`, `id_jabatan`, `id_kemampuan`, `createdAt`, `updatedAt`) VALUES
(1, 10000, 3, 1, '2023-11-29 05:15:34', '2024-02-17 15:23:13'),
(2, 11000, 3, 2, '2023-11-29 05:15:58', '2023-11-29 05:15:58'),
(3, 12000, 3, 3, '2023-11-29 05:16:13', '2023-11-29 05:16:13'),
(4, 13000, 3, 4, '2023-11-29 05:16:23', '2023-11-29 05:16:23'),
(5, 8000, 4, 1, '2023-11-29 05:16:37', '2024-01-30 15:00:31'),
(6, 9000, 4, 2, '2023-11-29 05:18:44', '2023-11-29 05:18:44'),
(7, 10000, 4, 3, '2023-11-29 05:18:54', '2023-11-29 05:18:54'),
(8, 11000, 4, 4, '2023-11-29 05:19:06', '2023-11-29 05:19:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hak_akses`
--

CREATE TABLE `hak_akses` (
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

INSERT INTO `hak_akses` (`uuid_karyawan`, `hk_gaji`, `hk_absensi`, `hk_kemampuan`, `hk_keterlambatan`, `hk_notifikasi`, `hk_hak_akses`, `hk_jabatan`, `hk_bonus`, `hk_produksi`, `hk_karyawan`, `createdAt`, `updatedAt`) VALUES
('4ba242d9-b53a-4497-bea0-8f1f854cd09c', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 17:48:58', '2024-01-05 17:54:26'),
('7aae7922-bb88-463d-95b5-43d5944526dc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 17:48:58', '2024-01-05 17:48:58'),
('12a9b66e-d53b-4537-80da-550575342574', 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
('26c107e5-950c-4034-bbe9-c83e74471a49', 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
('8361979b-8610-40d1-a14b-ef5e21224b20', 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
('b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-05 17:49:38', '2024-01-05 17:49:38'),
('52eef27f-09a4-4906-b3f8-8916885500a1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-07 07:00:26', '2024-01-07 07:00:26'),
('4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-01-07 18:15:57', '2024-01-07 18:15:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2023-11-29 04:50:17', '2024-02-17 15:22:57'),
(2, 'Manajer', '2023-11-29 04:50:38', '2023-11-29 04:53:10'),
(3, 'Supervisor', '2023-11-29 04:50:55', '2023-11-29 04:53:23'),
(4, 'Produksi', '2023-11-29 04:53:33', '2024-01-30 14:43:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `nama`, `createdAt`, `updatedAt`) VALUES
('1101', 'Kabupaten Simeulue', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1102', 'Kabupaten Aceh Singkil', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1103', 'Kabupaten Aceh Selatan', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1104', 'Kabupaten Aceh Tenggara', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1105', 'Kabupaten Aceh Timur', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1106', 'Kabupaten Aceh Tengah', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1107', 'Kabupaten Aceh Barat', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1108', 'Kabupaten Aceh Besar', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1109', 'Kabupaten Pidie', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1110', 'Kabupaten Bireuen', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1111', 'Kabupaten Aceh Utara', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1112', 'Kabupaten Aceh Barat Daya', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1113', 'Kabupaten Gayo Lues', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1114', 'Kabupaten Aceh Tamiang', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1115', 'Kabupaten Nagan Raya', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1116', 'Kabupaten Aceh Jaya', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1117', 'Kabupaten Bener Meriah', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1118', 'Kabupaten Pidie Jaya', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1171', 'Kota Banda Aceh', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1172', 'Kota Sabang', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1173', 'Kota Langsa', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1174', 'Kota Lhokseumawe', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1175', 'Kota Subulussalam', '2023-11-16 15:24:01', '2023-11-16 15:24:01'),
('1201', 'Kabupaten Nias', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1202', 'Kabupaten Mandailing Natal', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1203', 'Kabupaten Tapanuli Selatan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1204', 'Kabupaten Tapanuli Tengah', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1205', 'Kabupaten Tapanuli Utara', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1206', 'Kabupaten Toba Samosir', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1207', 'Kabupaten Labuhan Batu', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1208', 'Kabupaten Asahan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1209', 'Kabupaten Simalungun', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1210', 'Kabupaten Dairi', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1211', 'Kabupaten Karo', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1212', 'Kabupaten Deli Serdang', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1213', 'Kabupaten Langkat', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1214', 'Kabupaten Nias Selatan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1215', 'Kabupaten Humbang Hasundutan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1216', 'Kabupaten Pakpak Bharat', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1217', 'Kabupaten Samosir', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1218', 'Kabupaten Serdang Bedagai', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1219', 'Kabupaten Batu Bara', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1220', 'Kabupaten Padang Lawas Utara', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1221', 'Kabupaten Padang Lawas', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1222', 'Kabupaten Labuhan Batu Selatan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1223', 'Kabupaten Labuhan Batu Utara', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1224', 'Kabupaten Nias Utara', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1225', 'Kabupaten Nias Barat', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1271', 'Kota Sibolga', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1272', 'Kota Tanjung Balai', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1273', 'Kota Pematang Siantar', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1274', 'Kota Tebing Tinggi', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1275', 'Kota Medan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1276', 'Kota Binjai', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1277', 'Kota Padangsidimpuan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1278', 'Kota Gunungsitoli', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1301', 'Kabupaten Kepulauan Mentawai', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1302', 'Kabupaten Pesisir Selatan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1303', 'Kabupaten Solok', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1304', 'Kabupaten Sijunjung', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1305', 'Kabupaten Tanah Datar', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1306', 'Kabupaten Padang Pariaman', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1307', 'Kabupaten Agam', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1308', 'Kabupaten Lima Puluh Kota', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1309', 'Kabupaten Pasaman', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1310', 'Kabupaten Solok Selatan', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1311', 'Kabupaten Dharmasraya', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1312', 'Kabupaten Pasaman Barat', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1371', 'Kota Padang', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1372', 'Kota Solok', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1373', 'Kota Sawah Lunto', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1374', 'Kota Padang Panjang', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1375', 'Kota Bukittinggi', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1376', 'Kota Payakumbuh', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1377', 'Kota Pariaman', '2023-11-16 15:24:02', '2023-11-16 15:24:02'),
('1401', 'Kabupaten Kuantan Singingi', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1402', 'Kabupaten Indragiri Hulu', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1403', 'Kabupaten Indragiri Hilir', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1404', 'Kabupaten Pelalawan', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1405', 'Kabupaten S I A K', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1406', 'Kabupaten Kampar', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1407', 'Kabupaten Rokan Hulu', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1408', 'Kabupaten Bengkalis', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1409', 'Kabupaten Rokan Hilir', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1410', 'Kabupaten Kepulauan Meranti', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1471', 'Kota Pekanbaru', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1473', 'Kota D U M A I', '2023-11-16 15:24:03', '2023-11-16 15:24:03'),
('1501', 'Kabupaten Kerinci', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1502', 'Kabupaten Merangin', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1503', 'Kabupaten Sarolangun', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1504', 'Kabupaten Batang Hari', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1505', 'Kabupaten Muaro Jambi', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1506', 'Kabupaten Tanjung Jabung Timur', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1507', 'Kabupaten Tanjung Jabung Barat', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1508', 'Kabupaten Tebo', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1509', 'Kabupaten Bungo', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1571', 'Kota Jambi', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1572', 'Kota Sungai Penuh', '2023-11-16 15:24:04', '2023-11-16 15:24:04'),
('1601', 'Kabupaten Ogan Komering Ulu', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1602', 'Kabupaten Ogan Komering Ilir', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1603', 'Kabupaten Muara Enim', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1604', 'Kabupaten Lahat', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1605', 'Kabupaten Musi Rawas', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1606', 'Kabupaten Musi Banyuasin', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1607', 'Kabupaten Banyu Asin', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1608', 'Kabupaten Ogan Komering Ulu Selatan', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1609', 'Kabupaten Ogan Komering Ulu Timur', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1610', 'Kabupaten Ogan Ilir', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1611', 'Kabupaten Empat Lawang', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1612', 'Kabupaten Penukal Abab Lematang Ilir', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1613', 'Kabupaten Musi Rawas Utara', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1671', 'Kota Palembang', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1672', 'Kota Prabumulih', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1673', 'Kota Pagar Alam', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1674', 'Kota Lubuklinggau', '2023-11-16 15:24:05', '2023-11-16 15:24:05'),
('1701', 'Kabupaten Bengkulu Selatan', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1702', 'Kabupaten Rejang Lebong', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1703', 'Kabupaten Bengkulu Utara', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1704', 'Kabupaten Kaur', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1705', 'Kabupaten Seluma', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1706', 'Kabupaten Mukomuko', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1707', 'Kabupaten Lebong', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1708', 'Kabupaten Kepahiang', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1709', 'Kabupaten Bengkulu Tengah', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1771', 'Kota Bengkulu', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1801', 'Kabupaten Lampung Barat', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1802', 'Kabupaten Tanggamus', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1803', 'Kabupaten Lampung Selatan', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1804', 'Kabupaten Lampung Timur', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1805', 'Kabupaten Lampung Tengah', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1806', 'Kabupaten Lampung Utara', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1807', 'Kabupaten Way Kanan', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1808', 'Kabupaten Tulangbawang', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1809', 'Kabupaten Pesawaran', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1810', 'Kabupaten Pringsewu', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1811', 'Kabupaten Mesuji', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1812', 'Kabupaten Tulang Bawang Barat', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1813', 'Kabupaten Pesisir Barat', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1871', 'Kota Bandar Lampung', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1872', 'Kota Metro', '2023-11-16 15:24:07', '2023-11-16 15:24:07'),
('1901', 'Kabupaten Bangka', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('1902', 'Kabupaten Belitung', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('1903', 'Kabupaten Bangka Barat', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('1904', 'Kabupaten Bangka Tengah', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('1905', 'Kabupaten Bangka Selatan', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('1906', 'Kabupaten Belitung Timur', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('1971', 'Kota Pangkal Pinang', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('2101', 'Kabupaten Karimun', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('2102', 'Kabupaten Bintan', '2023-11-16 15:24:08', '2023-11-16 15:24:08'),
('2103', 'Kabupaten Natuna', '2023-11-16 15:24:09', '2023-11-16 15:24:09'),
('2104', 'Kabupaten Lingga', '2023-11-16 15:24:09', '2023-11-16 15:24:09'),
('2105', 'Kabupaten Kepulauan Anambas', '2023-11-16 15:24:09', '2023-11-16 15:24:09'),
('2171', 'Kota B A T A M', '2023-11-16 15:24:09', '2023-11-16 15:24:09'),
('2172', 'Kota Tanjung Pinang', '2023-11-16 15:24:09', '2023-11-16 15:24:09'),
('3101', 'Kabupaten Kepulauan Seribu', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3171', 'Kota Jakarta Selatan', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3172', 'Kota Jakarta Timur', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3173', 'Kota Jakarta Pusat', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3174', 'Kota Jakarta Barat', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3175', 'Kota Jakarta Utara', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3201', 'Kabupaten Bogor', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3202', 'Kabupaten Sukabumi', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3203', 'Kabupaten Cianjur', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3204', 'Kabupaten Bandung', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3205', 'Kabupaten Garut', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3206', 'Kabupaten Tasikmalaya', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3207', 'Kabupaten Ciamis', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3208', 'Kabupaten Kuningan', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3209', 'Kabupaten Cirebon', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3210', 'Kabupaten Majalengka', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3211', 'Kabupaten Sumedang', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3212', 'Kabupaten Indramayu', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3213', 'Kabupaten Subang', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3214', 'Kabupaten Purwakarta', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3215', 'Kabupaten Karawang', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3216', 'Kabupaten Bekasi', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3217', 'Kabupaten Bandung Barat', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3218', 'Kabupaten Pangandaran', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3271', 'Kota Bogor', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3272', 'Kota Sukabumi', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3273', 'Kota Bandung', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3274', 'Kota Cirebon', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3275', 'Kota Bekasi', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3276', 'Kota Depok', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3277', 'Kota Cimahi', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3278', 'Kota Tasikmalaya', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3279', 'Kota Banjar', '2023-11-16 15:24:10', '2023-11-16 15:24:10'),
('3301', 'Kabupaten Cilacap', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3302', 'Kabupaten Banyumas', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3303', 'Kabupaten Purbalingga', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3304', 'Kabupaten Banjarnegara', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3305', 'Kabupaten Kebumen', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3306', 'Kabupaten Purworejo', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3307', 'Kabupaten Wonosobo', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3308', 'Kabupaten Magelang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3309', 'Kabupaten Boyolali', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3310', 'Kabupaten Klaten', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3311', 'Kabupaten Sukoharjo', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3312', 'Kabupaten Wonogiri', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3313', 'Kabupaten Karanganyar', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3314', 'Kabupaten Sragen', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3315', 'Kabupaten Grobogan', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3316', 'Kabupaten Blora', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3317', 'Kabupaten Rembang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3318', 'Kabupaten Pati', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3319', 'Kabupaten Kudus', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3320', 'Kabupaten Jepara', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3321', 'Kabupaten Demak', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3322', 'Kabupaten Semarang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3323', 'Kabupaten Temanggung', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3324', 'Kabupaten Kendal', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3325', 'Kabupaten Batang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3326', 'Kabupaten Pekalongan', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3327', 'Kabupaten Pemalang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3328', 'Kabupaten Tegal', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3329', 'Kabupaten Brebes', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3371', 'Kota Magelang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3372', 'Kota Surakarta', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3373', 'Kota Salatiga', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3374', 'Kota Semarang', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3375', 'Kota Pekalongan', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3376', 'Kota Tegal', '2023-11-16 15:24:11', '2023-11-16 15:24:11'),
('3401', 'Kabupaten Kulon Progo', '2023-11-16 15:24:12', '2023-11-16 15:24:12'),
('3402', 'Kabupaten Bantul', '2023-11-16 15:24:12', '2023-11-16 15:24:12'),
('3403', 'Kabupaten Gunung Kidul', '2023-11-16 15:24:12', '2023-11-16 15:24:12'),
('3404', 'Kabupaten Sleman', '2023-11-16 15:24:12', '2023-11-16 15:24:12'),
('3471', 'Kota Yogyakarta', '2023-11-16 15:24:12', '2023-11-16 15:24:12'),
('3501', 'Kabupaten Pacitan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3502', 'Kabupaten Ponorogo', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3503', 'Kabupaten Trenggalek', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3504', 'Kabupaten Tulungagung', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3505', 'Kabupaten Blitar', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3506', 'Kabupaten Kediri', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3507', 'Kabupaten Malang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3508', 'Kabupaten Lumajang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3509', 'Kabupaten Jember', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3510', 'Kabupaten Banyuwangi', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3511', 'Kabupaten Bondowoso', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3512', 'Kabupaten Situbondo', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3513', 'Kabupaten Probolinggo', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3514', 'Kabupaten Pasuruan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3515', 'Kabupaten Sidoarjo', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3516', 'Kabupaten Mojokerto', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3517', 'Kabupaten Jombang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3518', 'Kabupaten Nganjuk', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3519', 'Kabupaten Madiun', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3520', 'Kabupaten Magetan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3521', 'Kabupaten Ngawi', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3522', 'Kabupaten Bojonegoro', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3523', 'Kabupaten Tuban', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3524', 'Kabupaten Lamongan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3525', 'Kabupaten Gresik', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3526', 'Kabupaten Bangkalan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3527', 'Kabupaten Sampang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3528', 'Kabupaten Pamekasan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3529', 'Kabupaten Sumenep', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3571', 'Kota Kediri', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3572', 'Kota Blitar', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3573', 'Kota Malang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3574', 'Kota Probolinggo', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3575', 'Kota Pasuruan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3576', 'Kota Mojokerto', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3577', 'Kota Madiun', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3578', 'Kota Surabaya', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3579', 'Kota Batu', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3601', 'Kabupaten Pandeglang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3602', 'Kabupaten Lebak', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3603', 'Kabupaten Tangerang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3604', 'Kabupaten Serang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3671', 'Kota Tangerang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3672', 'Kota Cilegon', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3673', 'Kota Serang', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('3674', 'Kota Tangerang Selatan', '2023-11-16 15:24:13', '2023-11-16 15:24:13'),
('5101', 'Kabupaten Jembrana', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5102', 'Kabupaten Tabanan', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5103', 'Kabupaten Badung', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5104', 'Kabupaten Gianyar', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5105', 'Kabupaten Klungkung', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5106', 'Kabupaten Bangli', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5107', 'Kabupaten Karang Asem', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5108', 'Kabupaten Buleleng', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5171', 'Kota Denpasar', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5201', 'Kabupaten Lombok Barat', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5202', 'Kabupaten Lombok Tengah', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5203', 'Kabupaten Lombok Timur', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5204', 'Kabupaten Sumbawa', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5205', 'Kabupaten Dompu', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5206', 'Kabupaten Bima', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5207', 'Kabupaten Sumbawa Barat', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5208', 'Kabupaten Lombok Utara', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5271', 'Kota Mataram', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5272', 'Kota Bima', '2023-11-16 15:24:14', '2023-11-16 15:24:14'),
('5301', 'Kabupaten Sumba Barat', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5302', 'Kabupaten Sumba Timur', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5303', 'Kabupaten Kupang', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5304', 'Kabupaten Timor Tengah Selatan', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5305', 'Kabupaten Timor Tengah Utara', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5306', 'Kabupaten Belu', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5307', 'Kabupaten Alor', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5308', 'Kabupaten Lembata', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5309', 'Kabupaten Flores Timur', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5310', 'Kabupaten Sikka', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5311', 'Kabupaten Ende', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5312', 'Kabupaten Ngada', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5313', 'Kabupaten Manggarai', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5314', 'Kabupaten Rote Ndao', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5315', 'Kabupaten Manggarai Barat', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5316', 'Kabupaten Sumba Tengah', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5317', 'Kabupaten Sumba Barat Daya', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5318', 'Kabupaten Nagekeo', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5319', 'Kabupaten Manggarai Timur', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5320', 'Kabupaten Sabu Raijua', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5321', 'Kabupaten Malaka', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('5371', 'Kota Kupang', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6101', 'Kabupaten Sambas', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6102', 'Kabupaten Bengkayang', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6103', 'Kabupaten Landak', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6104', 'Kabupaten Mempawah', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6105', 'Kabupaten Sanggau', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6106', 'Kabupaten Ketapang', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6107', 'Kabupaten Sintang', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6108', 'Kabupaten Kapuas Hulu', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6109', 'Kabupaten Sekadau', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6110', 'Kabupaten Melawi', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6111', 'Kabupaten Kayong Utara', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6112', 'Kabupaten Kubu Raya', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6171', 'Kota Pontianak', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6172', 'Kota Singkawang', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6201', 'Kabupaten Kotawaringin Barat', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6202', 'Kabupaten Kotawaringin Timur', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6203', 'Kabupaten Kapuas', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6204', 'Kabupaten Barito Selatan', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6205', 'Kabupaten Barito Utara', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6206', 'Kabupaten Sukamara', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6207', 'Kabupaten Lamandau', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6208', 'Kabupaten Seruyan', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6209', 'Kabupaten Katingan', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6210', 'Kabupaten Pulang Pisau', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6211', 'Kabupaten Gunung Mas', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6212', 'Kabupaten Barito Timur', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6213', 'Kabupaten Murung Raya', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6271', 'Kota Palangka Raya', '2023-11-16 15:24:15', '2023-11-16 15:24:15'),
('6301', 'Kabupaten Tanah Laut', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6302', 'Kabupaten Kota Baru', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6303', 'Kabupaten Banjar', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6304', 'Kabupaten Barito Kuala', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6305', 'Kabupaten Tapin', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6306', 'Kabupaten Hulu Sungai Selatan', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6307', 'Kabupaten Hulu Sungai Tengah', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6308', 'Kabupaten Hulu Sungai Utara', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6309', 'Kabupaten Tabalong', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6310', 'Kabupaten Tanah Bumbu', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6311', 'Kabupaten Balangan', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6371', 'Kota Banjarmasin', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6372', 'Kota Banjar Baru', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6401', 'Kabupaten Paser', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6402', 'Kabupaten Kutai Barat', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6403', 'Kabupaten Kutai Kartanegara', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6404', 'Kabupaten Kutai Timur', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6405', 'Kabupaten Berau', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6409', 'Kabupaten Penajam Paser Utara', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6411', 'Kabupaten Mahakam Hulu', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6471', 'Kota Balikpapan', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6472', 'Kota Samarinda', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6474', 'Kota Bontang', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6501', 'Kabupaten Malinau', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6502', 'Kabupaten Bulungan', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6503', 'Kabupaten Tana Tidung', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6504', 'Kabupaten Nunukan', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('6571', 'Kota Tarakan', '2023-11-16 15:24:16', '2023-11-16 15:24:16'),
('7101', 'Kabupaten Bolaang Mongondow', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7102', 'Kabupaten Minahasa', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7103', 'Kabupaten Kepulauan Sangihe', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7104', 'Kabupaten Kepulauan Talaud', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7105', 'Kabupaten Minahasa Selatan', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7106', 'Kabupaten Minahasa Utara', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7107', 'Kabupaten Bolaang Mongondow Utara', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7108', 'Kabupaten Siau Tagulandang Biaro', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7109', 'Kabupaten Minahasa Tenggara', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7110', 'Kabupaten Bolaang Mongondow Selatan', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7111', 'Kabupaten Bolaang Mongondow Timur', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7171', 'Kota Manado', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7172', 'Kota Bitung', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7173', 'Kota Tomohon', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7174', 'Kota Kotamobagu', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7201', 'Kabupaten Banggai Kepulauan', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7202', 'Kabupaten Banggai', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7203', 'Kabupaten Morowali', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7204', 'Kabupaten Poso', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7205', 'Kabupaten Donggala', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7206', 'Kabupaten Toli-toli', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7207', 'Kabupaten Buol', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7208', 'Kabupaten Parigi Moutong', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7209', 'Kabupaten Tojo Una-una', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7210', 'Kabupaten Sigi', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7211', 'Kabupaten Banggai Laut', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7212', 'Kabupaten Morowali Utara', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7271', 'Kota Palu', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7301', 'Kabupaten Kepulauan Selayar', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7302', 'Kabupaten Bulukumba', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7303', 'Kabupaten Bantaeng', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7304', 'Kabupaten Jeneponto', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7305', 'Kabupaten Takalar', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7306', 'Kabupaten Gowa', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7307', 'Kabupaten Sinjai', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7308', 'Kabupaten Maros', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7309', 'Kabupaten Pangkajene Dan Kepulauan', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7310', 'Kabupaten Barru', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7311', 'Kabupaten Bone', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7312', 'Kabupaten Soppeng', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7313', 'Kabupaten Wajo', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7314', 'Kabupaten Sidenreng Rappang', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7315', 'Kabupaten Pinrang', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7316', 'Kabupaten Enrekang', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7317', 'Kabupaten Luwu', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7318', 'Kabupaten Tana Toraja', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7322', 'Kabupaten Luwu Utara', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7325', 'Kabupaten Luwu Timur', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7326', 'Kabupaten Toraja Utara', '2023-11-16 15:24:17', '2023-11-16 15:24:17'),
('7371', 'Kota Makassar', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7372', 'Kota Parepare', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7373', 'Kota Palopo', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7401', 'Kabupaten Buton', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7402', 'Kabupaten Muna', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7403', 'Kabupaten Konawe', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7404', 'Kabupaten Kolaka', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7405', 'Kabupaten Konawe Selatan', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7406', 'Kabupaten Bombana', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7407', 'Kabupaten Wakatobi', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7408', 'Kabupaten Kolaka Utara', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7409', 'Kabupaten Buton Utara', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7410', 'Kabupaten Konawe Utara', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7411', 'Kabupaten Kolaka Timur', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7412', 'Kabupaten Konawe Kepulauan', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7413', 'Kabupaten Muna Barat', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7414', 'Kabupaten Buton Tengah', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7415', 'Kabupaten Buton Selatan', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7471', 'Kota Kendari', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7472', 'Kota Baubau', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7501', 'Kabupaten Boalemo', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7502', 'Kabupaten Gorontalo', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7503', 'Kabupaten Pohuwato', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7504', 'Kabupaten Bone Bolango', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7505', 'Kabupaten Gorontalo Utara', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7571', 'Kota Gorontalo', '2023-11-16 15:24:18', '2023-11-16 15:24:18'),
('7601', 'Kabupaten Majene', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('7602', 'Kabupaten Polewali Mandar', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('7603', 'Kabupaten Mamasa', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('7604', 'Kabupaten Mamuju', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('7605', 'Kabupaten Mamuju Utara', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('7606', 'Kabupaten Mamuju Tengah', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8101', 'Kabupaten Maluku Tenggara Barat', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8102', 'Kabupaten Maluku Tenggara', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8103', 'Kabupaten Maluku Tengah', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8104', 'Kabupaten Buru', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8105', 'Kabupaten Kepulauan Aru', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8106', 'Kabupaten Seram Bagian Barat', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8107', 'Kabupaten Seram Bagian Timur', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8108', 'Kabupaten Maluku Barat Daya', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8109', 'Kabupaten Buru Selatan', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8171', 'Kota Ambon', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8172', 'Kota Tual', '2023-11-16 15:24:19', '2023-11-16 15:24:19'),
('8201', 'Kabupaten Halmahera Barat', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8202', 'Kabupaten Halmahera Tengah', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8203', 'Kabupaten Kepulauan Sula', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8204', 'Kabupaten Halmahera Selatan', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8205', 'Kabupaten Halmahera Utara', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8206', 'Kabupaten Halmahera Timur', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8207', 'Kabupaten Pulau Morotai', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8208', 'Kabupaten Pulau Taliabu', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8271', 'Kota Ternate', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('8272', 'Kota Tidore Kepulauan', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9101', 'Kabupaten Fakfak', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9102', 'Kabupaten Kaimana', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9103', 'Kabupaten Teluk Wondama', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9104', 'Kabupaten Teluk Bintuni', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9105', 'Kabupaten Manokwari', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9106', 'Kabupaten Sorong Selatan', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9107', 'Kabupaten Sorong', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9108', 'Kabupaten Raja Ampat', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9109', 'Kabupaten Tambrauw', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9110', 'Kabupaten Maybrat', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9111', 'Kabupaten Manokwari Selatan', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9112', 'Kabupaten Pegunungan Arfak', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9171', 'Kota Sorong', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9401', 'Kabupaten Merauke', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9402', 'Kabupaten Jayawijaya', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9403', 'Kabupaten Jayapura', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9404', 'Kabupaten Nabire', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9408', 'Kabupaten Kepulauan Yapen', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9409', 'Kabupaten Biak Numfor', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9410', 'Kabupaten Paniai', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9411', 'Kabupaten Puncak Jaya', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9412', 'Kabupaten Mimika', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9413', 'Kabupaten Boven Digoel', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9414', 'Kabupaten Mappi', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9415', 'Kabupaten Asmat', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9416', 'Kabupaten Yahukimo', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9417', 'Kabupaten Pegunungan Bintang', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9418', 'Kabupaten Tolikara', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9419', 'Kabupaten Sarmi', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9420', 'Kabupaten Keerom', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9426', 'Kabupaten Waropen', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9427', 'Kabupaten Supiori', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9428', 'Kabupaten Mamberamo Raya', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9429', 'Kabupaten Nduga', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9430', 'Kabupaten Lanny Jaya', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9431', 'Kabupaten Mamberamo Tengah', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9432', 'Kabupaten Yalimo', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9433', 'Kabupaten Puncak', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9434', 'Kabupaten Dogiyai', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9435', 'Kabupaten Intan Jaya', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9436', 'Kabupaten Deiyai', '2023-11-16 15:24:20', '2023-11-16 15:24:20'),
('9471', 'Kota Jayapura', '2023-11-16 15:24:20', '2023-11-16 15:24:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `uuid` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_nik` varchar(255) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') NOT NULL DEFAULT 'Laki-laki',
  `id_jabatan` int(11) NOT NULL,
  `tmp_lhr` varchar(255) NOT NULL,
  `tgl_lhr` date NOT NULL,
  `id_kab` varchar(255) NOT NULL,
  `no_telepon` varchar(255) NOT NULL,
  `no_rekening` varchar(255) DEFAULT NULL,
  `status_karyawan` enum('Aktif','Non Aktif') DEFAULT 'Aktif',
  `id_kemampuan` int(11) DEFAULT NULL,
  `on` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`uuid`, `nama`, `email`, `password`, `no_nik`, `jk`, `id_jabatan`, `tmp_lhr`, `tgl_lhr`, `id_kab`, `no_telepon`, `no_rekening`, `status_karyawan`, `id_kemampuan`, `on`, `createdAt`, `updatedAt`) VALUES
('12a9b66e-d53b-4537-80da-550575342574', 'Muhammad Subhan', 'subhan@gmail.com', '$2b$10$wAY9O0mXdHTkE4Fnq1AcXODXzoAYdGWCWxyvSHJPUpqe9/ewZdYSG', '3511021210000003', 'Laki-laki', 1, '3511', '2000-10-12', '3511', '81249700284', '98878867878', 'Aktif', 1, 0, '2023-12-02 03:58:01', '2024-02-28 12:21:39'),
('26c107e5-950c-4034-bbe9-c83e74471a49', 'Wafi', 'wafi@gmail.com', '$2b$10$0wjElHEYZ7tKy8CU6datjuz6xyc2ENw8cetYzNqRAJuSbXGO8t7Q6', '3511021210000003', 'Laki-laki', 4, '3510', '2023-12-12', '3510', '81249700284', '12987381312', 'Aktif', 1, 0, '2023-12-04 11:43:26', '2024-03-08 05:36:16'),
('4ba242d9-b53a-4497-bea0-8f1f854cd09c', 'Gigih', 'gigih@gmail.com', '$2b$10$WX70xVhWDio0Q4OOdowHv.mvZ2XXN2cQubvM7MO1EnBsXz9cq36BW', '3511021210000003', 'Laki-laki', 3, '3511', '2000-10-12', '3511', '81249700284', '87979789718', 'Aktif', 1, 0, '2023-12-04 07:57:19', '2024-03-08 05:36:16'),
('4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 'Muhammad Ainul', 'ainul@gmail.com', '$2b$10$w9m.iCkLIeH/3PtbDYoKd.lCRBpXTsLSJNoeCcMIAUHc/sXgkbbz2', '2198732198371293', 'Laki-laki', 4, '3511', '2000-10-12', '3511', '08326563232', '2187923872198', 'Aktif', 3, 0, '2024-01-07 18:15:57', '2024-03-08 05:36:16'),
('52eef27f-09a4-4906-b3f8-8916885500a1', 'Muhammad Alif', 'alif@gmail.com', '$2b$10$XQV17nKt2b/vDKAloXk0KOIMG88WdG6xJmHXE8XLanxZPOHlaeyhi', '1328739812379139', 'Laki-laki', 4, '3511', '2000-10-12', '3511', '08217739127', '89191726716211', 'Aktif', 4, 0, '2024-01-07 07:00:26', '2024-03-08 05:36:16'),
('7aae7922-bb88-463d-95b5-43d5944526dc', 'Agung', 'agung@gmail.com', '$2b$10$5up82wOmf9CtAwa9GECX0.anwAYXLS5iizIe0sM3z2twL3smUcyg6', '3511021210000003', 'Laki-laki', 4, '3511', '2023-12-12', '3511', '81249700284', '21865387131', 'Aktif', 3, 0, '2023-12-04 11:39:29', '2024-03-08 05:36:16'),
('8361979b-8610-40d1-a14b-ef5e21224b20', 'Sugik', 'sugik@gmail.com', '$2b$10$menUWekBrKZC6aGQ1jBGbO/THNx.J/d1ALL9lxruBWioyiByEkc7G', '3511021210000003', 'Laki-laki', 2, '3511', '2000-10-12', '3511', '81249700284', '81287632187', 'Aktif', 1, 0, '2023-12-04 07:54:09', '2024-02-28 12:21:39'),
('b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 'Andika', 'andika@gmail.com', '$2b$10$/1Q/3trWGTXjMtcRtBfC6eZOsJtsCcOtIqn2qF6SET2OFVfzQUn1q', '3511021210000003', 'Laki-laki', 4, '3511', '2000-10-12', '3511', '81249700284', '81763813131', 'Aktif', 2, 0, '2023-12-04 11:41:20', '2024-03-08 05:36:16');

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
(1, 'Pemula', '2023-11-29 05:04:19', '2024-02-17 15:23:05'),
(2, 'Menengah', '2023-11-29 05:04:29', '2023-11-29 05:04:29'),
(3, 'Mahir', '2023-11-29 05:04:36', '2023-11-29 05:04:36'),
(4, 'Ahli', '2023-11-29 05:04:44', '2023-11-29 05:04:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL,
  `uuid_karyawan` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` text NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `max_jarak` int(11) DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id`, `uuid_karyawan`, `nama`, `alamat`, `latitude`, `longitude`, `max_jarak`, `aktif`, `createdAt`, `updatedAt`) VALUES
(1, '26c107e5-950c-4034-bbe9-c83e74471a49', 'Default', 'Probolinggo', -7.7195395, 113.489504, 20, 0, '2023-12-19 14:18:19', '2024-01-21 05:42:44'),
(2, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 'Default', 'Probolinggo', -7.7195395, 113.489504, 20, 0, '2023-12-19 14:18:45', '2024-01-21 05:42:52'),
(3, '7aae7922-bb88-463d-95b5-43d5944526dc', 'Default', 'Probolinggo', -7.7195395, 113.489504, 19, 0, '2023-12-19 14:19:27', '2024-01-21 05:42:57'),
(4, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', 'Default', 'Probolinggo', -7.7195395, 113.489504, 20, 0, '2023-12-19 14:20:02', '2024-03-02 08:25:35'),
(5, '8361979b-8610-40d1-a14b-ef5e21224b20', 'Default NJ', 'PP. Nurul Jadid', -7.7109347, 113.4943495, 20, 0, '2023-12-19 14:20:40', '2023-12-28 04:57:50'),
(6, '12a9b66e-d53b-4537-80da-550575342574', 'Default NJ', 'PP. Nurul Jadid', -7.7109347, 113.4943495, 20, 0, '2023-12-19 14:21:02', '2023-12-28 04:58:25'),
(7, '26c107e5-950c-4034-bbe9-c83e74471a49', 'Kantor Bumpes', 'Jl. KH. Zaini Mun\'im Paiton Probolinggo', -7.7113933, 113.4975225, 20, 1, '2023-12-28 04:54:24', '2024-01-21 05:42:44'),
(8, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 'Kantor Bumpes', 'Jl. KH. Zaini Mun\'im Paiton Probolinggo', -7.7113933, 113.4975225, 20, 1, '2023-12-28 04:55:36', '2024-01-21 05:42:52'),
(9, '7aae7922-bb88-463d-95b5-43d5944526dc', 'Kantor Bumpes', 'Jl. KH. Zaini Mun\'im Paiton Probolinggo', -7.7113933, 113.4975225, 20, 1, '2023-12-28 04:56:14', '2024-01-21 05:42:57'),
(10, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', 'Kantor Bumpes', 'Jl. KH. Zaini Mun\'im', -7.7113933, 113.4975225, 20, 0, '2023-12-28 04:56:54', '2024-03-02 08:25:35'),
(11, '8361979b-8610-40d1-a14b-ef5e21224b20', 'Kantor Bumpes', 'Jl. KH. Zaini Mun\'im Paiton Probolinggo', -7.7113933, 113.4975289, 20, 1, '2023-12-28 04:57:50', '2023-12-28 04:57:50'),
(12, '12a9b66e-d53b-4537-80da-550575342574', 'Kantor Bumpes', 'Jl. KH. Zaini Mun\'im Paiton Probolinggo', -7.7113934, 113.49753, 20, 1, '2023-12-28 04:58:25', '2023-12-28 04:58:25'),
(13, '26c107e5-950c-4034-bbe9-c83e74471a49', 'Kantor LP3MM', 'kuhuhhkhkj', -7.7094385, 113.4984468, 20, 0, '2023-12-28 08:04:12', '2024-01-21 05:42:44'),
(16, '26c107e5-950c-4034-bbe9-c83e74471a49', 'Asrama F', 'JL. KH. Zaini Mun\'im Paiton Probolinggo', -7.7109104, 113.494337, 20, 0, '2024-01-05 07:15:49', '2024-01-21 05:42:44'),
(17, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 'Asrama F', 'Jl. KH. Zaini Mun\'im', -7.7109104, 113.494337, 20, 0, '2024-01-05 07:18:54', '2024-01-21 05:42:52'),
(18, '7aae7922-bb88-463d-95b5-43d5944526dc', 'Asrama F', 'Jl. KH. Zaini Mun\'im', -7.7109347, 113.4943495, 20, 0, '2024-01-05 07:20:45', '2024-01-21 05:42:57'),
(19, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', 'Asrama F', 'JL. KH. Zaini Mun\'im Paiton Probolinggo', -7.7109047, 113.4943437, 20, 1, '2024-01-05 07:27:59', '2024-03-02 08:25:35'),
(20, '52eef27f-09a4-4906-b3f8-8916885500a1', 'Default', 'Probolinggo', -7.7195395, 113.489504, 20, 0, '2024-01-07 07:00:26', '2024-01-21 05:42:39'),
(21, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 'Default', 'Probolinggo', -7.7195395, 113.489504, 20, 1, '2024-01-07 18:15:57', '2024-03-04 20:34:41'),
(22, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 'Kantor Bumpes', 'JL. KH. Zaini Mun\'im Paiton Probolinggo', -7.7113903, 113.4975343, 20, 0, '2024-01-11 08:18:52', '2024-03-04 20:34:41'),
(23, '52eef27f-09a4-4906-b3f8-8916885500a1', 'Kantor Bumpes', 'JL. KH. Zaini Mun\'im', -7.7113903, 113.4975343, 20, 1, '2024-01-11 08:19:18', '2024-01-21 05:42:39'),
(24, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 'Asrama F', 'JL. KH. Zaini Mun\'im Paiton Probolinggo', -7.7109151, 113.4943579, 20, 0, '2024-01-12 02:56:43', '2024-03-04 20:34:41'),
(25, '52eef27f-09a4-4906-b3f8-8916885500a1', 'Random', 'JL. KH. Zaini Mun\'im Paiton Probolinggo', -7.7195395, 113.489504, 20, 0, '2024-01-12 02:58:54', '2024-03-04 21:48:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_absensi` int(11) NOT NULL,
  `notif_satu` tinyint(1) DEFAULT 0,
  `notif_dua` tinyint(1) DEFAULT 0,
  `notif_tiga` tinyint(1) DEFAULT 0,
  `notif_empat` tinyint(1) DEFAULT 0,
  `notif_lima` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `notifikasi`
--

INSERT INTO `notifikasi` (`id_absensi`, `notif_satu`, `notif_dua`, `notif_tiga`, `notif_empat`, `notif_lima`, `createdAt`, `updatedAt`) VALUES
(28, 0, 0, 0, 0, 0, '2024-01-21 06:18:55', '2024-01-21 06:18:55'),
(29, 0, 0, 0, 0, 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(30, 0, 0, 0, 0, 0, '2024-01-21 06:19:11', '2024-01-21 06:19:11'),
(31, 0, 0, 0, 0, 0, '2024-01-21 06:19:16', '2024-01-21 06:19:16'),
(32, 0, 0, 0, 0, 0, '2024-01-21 06:19:27', '2024-01-21 06:19:27'),
(33, 0, 0, 0, 0, 0, '2024-01-21 06:19:39', '2024-01-21 06:19:39'),
(34, 0, 0, 0, 0, 0, '2024-02-15 06:01:56', '2024-02-15 06:01:56'),
(35, 0, 0, 0, 0, 0, '2024-02-15 06:01:56', '2024-02-15 06:01:56'),
(36, 0, 0, 0, 0, 0, '2024-02-15 06:01:56', '2024-02-15 06:01:56'),
(37, 0, 0, 0, 0, 0, '2024-02-15 06:01:56', '2024-02-15 06:01:56'),
(38, 0, 0, 0, 0, 0, '2024-02-15 06:01:56', '2024-02-15 06:01:56'),
(39, 0, 0, 0, 0, 0, '2024-02-15 06:01:56', '2024-02-15 06:01:56'),
(40, 0, 0, 0, 0, 0, '2024-02-17 04:06:47', '2024-02-17 04:06:47'),
(41, 0, 0, 0, 0, 0, '2024-02-17 04:06:47', '2024-02-17 04:06:47'),
(42, 0, 0, 0, 0, 0, '2024-02-17 04:06:47', '2024-02-17 04:06:47'),
(43, 0, 0, 0, 0, 0, '2024-02-17 04:06:47', '2024-02-17 04:06:47'),
(44, 0, 0, 0, 0, 0, '2024-02-17 04:06:47', '2024-02-17 04:06:47'),
(45, 0, 0, 0, 0, 0, '2024-02-17 04:06:47', '2024-02-17 04:06:47'),
(46, 0, 0, 0, 0, 0, '2024-02-21 06:34:22', '2024-02-21 14:10:54'),
(47, 0, 0, 0, 0, 0, '2024-02-21 06:34:22', '2024-02-21 14:11:10'),
(48, 0, 0, 0, 0, 0, '2024-02-21 06:34:22', '2024-02-21 14:11:16'),
(49, 0, 0, 0, 0, 0, '2024-02-21 06:34:22', '2024-02-21 06:34:22'),
(50, 0, 0, 0, 0, 0, '2024-02-21 06:34:22', '2024-02-21 06:34:22'),
(51, 0, 0, 0, 0, 0, '2024-02-21 06:34:22', '2024-02-21 06:34:22'),
(52, 0, 0, 0, 0, 0, '2024-02-21 14:17:23', '2024-02-21 14:17:23'),
(53, 0, 0, 0, 0, 0, '2024-02-21 14:17:30', '2024-02-21 14:17:30'),
(54, 0, 0, 0, 0, 0, '2024-02-21 14:17:33', '2024-02-21 14:17:33'),
(55, 0, 0, 0, 0, 0, '2024-02-21 22:03:31', '2024-02-21 22:03:31'),
(56, 0, 0, 0, 0, 0, '2024-02-21 22:03:48', '2024-02-21 22:03:48'),
(57, 0, 0, 0, 0, 0, '2024-02-21 22:21:00', '2024-02-21 22:49:05'),
(58, 0, 0, 0, 0, 0, '2024-02-21 22:22:30', '2024-02-21 22:22:30'),
(59, 0, 0, 0, 0, 0, '2024-02-21 22:23:41', '2024-02-21 22:23:41'),
(60, 0, 0, 0, 0, 0, '2024-02-21 22:24:27', '2024-02-21 23:14:22'),
(61, 0, 0, 0, 0, 0, '2024-02-22 22:15:24', '2024-02-22 22:34:23'),
(62, 0, 0, 0, 0, 0, '2024-02-22 22:34:30', '2024-02-22 22:40:05'),
(63, 0, 0, 0, 0, 0, '2024-02-22 22:40:32', '2024-02-22 22:40:32'),
(64, 0, 0, 0, 0, 0, '2024-02-22 22:44:36', '2024-02-22 22:44:36'),
(65, 0, 0, 0, 0, 0, '2024-02-22 22:44:55', '2024-02-22 22:44:55'),
(66, 0, 0, 0, 0, 0, '2024-02-22 22:45:07', '2024-02-22 22:45:07'),
(67, 0, 0, 0, 0, 0, '2024-02-22 22:45:14', '2024-02-22 22:45:14'),
(68, 0, 0, 0, 0, 0, '2024-02-22 22:45:20', '2024-02-22 22:45:20'),
(72, 0, 0, 0, 0, 0, '2024-02-25 09:35:49', '2024-02-25 09:35:49'),
(74, 0, 0, 0, 0, 0, '2024-02-26 09:56:15', '2024-02-26 09:56:15'),
(75, 0, 0, 0, 0, 0, '2024-02-26 10:00:26', '2024-02-26 10:00:26'),
(76, 0, 0, 0, 0, 0, '2024-02-26 10:04:03', '2024-02-26 10:04:03'),
(77, 0, 0, 0, 0, 0, '2024-02-26 10:04:28', '2024-02-26 10:04:28'),
(78, 0, 0, 0, 0, 0, '2024-02-26 10:04:52', '2024-02-26 10:04:52'),
(79, 0, 0, 0, 0, 0, '2024-02-26 10:14:40', '2024-02-26 10:14:40'),
(80, 0, 0, 0, 0, 0, '2024-02-26 10:16:08', '2024-02-26 10:16:08'),
(81, 0, 0, 0, 0, 0, '2024-02-26 10:24:27', '2024-02-26 10:24:27'),
(82, 0, 0, 0, 0, 0, '2024-02-26 10:25:28', '2024-02-26 10:25:28'),
(83, 0, 0, 0, 0, 0, '2024-02-26 10:25:39', '2024-02-26 10:25:39'),
(84, 0, 0, 0, 0, 0, '2024-02-26 10:26:09', '2024-02-26 10:26:09'),
(85, 0, 0, 0, 0, 0, '2024-02-26 10:28:50', '2024-02-26 10:28:50'),
(86, 0, 0, 0, 0, 0, '2024-02-26 10:30:26', '2024-02-26 10:30:26'),
(87, 0, 0, 0, 0, 0, '2024-02-26 10:30:48', '2024-02-26 10:30:48'),
(88, 0, 0, 0, 0, 0, '2024-02-26 10:30:56', '2024-02-26 10:30:56'),
(89, 0, 0, 0, 0, 0, '2024-02-26 10:38:21', '2024-02-26 10:38:21'),
(90, 0, 0, 0, 0, 0, '2024-02-26 10:38:40', '2024-02-26 10:38:40'),
(91, 0, 0, 0, 0, 0, '2024-02-26 10:38:46', '2024-02-26 10:38:46'),
(92, 0, 0, 0, 0, 0, '2024-02-27 07:40:06', '2024-02-27 08:23:00'),
(93, 0, 0, 0, 0, 0, '2024-02-27 07:40:06', '2024-02-27 08:23:10'),
(96, 0, 0, 0, 0, 0, '2024-02-27 07:40:06', '2024-02-27 07:40:06'),
(97, 0, 0, 0, 0, 0, '2024-02-27 07:40:06', '2024-02-27 07:40:06'),
(98, 0, 0, 0, 0, 0, '2024-02-28 12:21:18', '2024-02-28 12:21:18'),
(99, 0, 0, 0, 0, 0, '2024-02-28 12:21:18', '2024-02-28 12:21:18'),
(100, 0, 0, 0, 0, 0, '2024-02-28 12:21:18', '2024-02-28 12:21:18'),
(101, 0, 0, 0, 0, 0, '2024-02-28 12:21:18', '2024-02-28 12:21:18'),
(102, 0, 0, 0, 0, 0, '2024-02-28 12:21:18', '2024-02-28 12:21:18'),
(103, 0, 0, 0, 0, 0, '2024-02-28 12:21:18', '2024-02-28 12:21:18'),
(104, 0, 0, 0, 0, 0, '2024-02-28 12:28:58', '2024-02-28 12:28:58'),
(105, 0, 0, 0, 0, 0, '2024-02-28 12:28:58', '2024-02-28 12:28:58'),
(106, 0, 0, 0, 0, 0, '2024-02-28 12:28:58', '2024-02-28 12:28:58'),
(107, 0, 0, 0, 0, 0, '2024-02-28 12:28:58', '2024-02-28 12:28:58'),
(108, 0, 0, 0, 0, 0, '2024-02-28 12:28:58', '2024-02-28 12:28:58'),
(109, 0, 0, 0, 0, 0, '2024-02-28 12:28:58', '2024-02-28 12:28:58'),
(110, 0, 0, 0, 0, 0, '2024-02-28 12:31:57', '2024-02-28 12:31:57'),
(111, 0, 0, 0, 0, 0, '2024-02-28 12:31:57', '2024-02-28 12:31:57'),
(112, 0, 0, 0, 0, 0, '2024-02-28 12:31:57', '2024-02-28 12:31:57'),
(113, 0, 0, 0, 0, 0, '2024-02-28 12:31:57', '2024-02-28 12:31:57'),
(114, 0, 0, 0, 0, 0, '2024-02-28 12:31:57', '2024-02-28 12:31:57'),
(115, 0, 0, 0, 0, 0, '2024-02-28 12:31:57', '2024-02-28 12:31:57'),
(116, 0, 0, 0, 0, 0, '2024-02-28 12:36:08', '2024-02-28 12:36:08'),
(117, 0, 0, 0, 0, 0, '2024-02-28 12:36:08', '2024-02-28 12:36:08'),
(118, 0, 0, 0, 0, 0, '2024-02-28 12:36:08', '2024-02-28 12:36:08'),
(119, 0, 0, 0, 0, 0, '2024-02-28 12:36:08', '2024-02-28 12:36:08'),
(120, 0, 0, 0, 0, 0, '2024-02-28 12:36:08', '2024-02-28 12:36:08'),
(121, 0, 0, 0, 0, 0, '2024-02-28 12:36:08', '2024-02-28 12:36:08'),
(122, 0, 0, 0, 0, 0, '2024-03-01 08:18:35', '2024-03-01 08:18:35'),
(123, 0, 0, 0, 0, 0, '2024-03-01 08:18:35', '2024-03-01 08:18:35'),
(124, 0, 0, 0, 0, 0, '2024-03-01 08:18:35', '2024-03-01 08:18:35'),
(125, 0, 0, 0, 0, 0, '2024-03-01 08:18:35', '2024-03-01 08:18:35'),
(126, 0, 0, 0, 0, 0, '2024-03-01 08:18:35', '2024-03-01 08:18:35'),
(127, 0, 0, 0, 0, 0, '2024-03-01 08:18:35', '2024-03-01 08:18:35'),
(132, 0, 0, 0, 0, 0, '2024-03-01 14:32:57', '2024-03-01 14:32:57'),
(134, 0, 0, 0, 0, 0, '2024-03-01 14:36:30', '2024-03-01 14:36:30'),
(137, 0, 0, 0, 0, 0, '2024-03-02 06:16:18', '2024-03-02 06:35:50'),
(138, 0, 0, 0, 0, 0, '2024-03-02 06:32:06', '2024-03-02 06:35:55'),
(139, 0, 0, 0, 0, 0, '2024-03-02 06:34:37', '2024-03-02 06:35:59'),
(140, 0, 0, 0, 0, 0, '2024-03-02 06:34:44', '2024-03-02 06:35:46'),
(141, 0, 0, 0, 0, 0, '2024-03-02 06:34:52', '2024-03-02 06:36:03'),
(142, 0, 0, 0, 0, 0, '2024-03-02 06:34:58', '2024-03-02 06:36:06'),
(143, 0, 0, 0, 0, 0, '2024-03-02 06:36:13', '2024-03-02 06:36:13'),
(144, 0, 0, 0, 0, 0, '2024-03-02 08:24:44', '2024-03-02 08:24:44'),
(145, 0, 0, 0, 0, 0, '2024-03-02 08:25:52', '2024-03-02 08:25:52'),
(146, 0, 0, 0, 0, 0, '2024-03-02 08:25:58', '2024-03-02 08:25:58'),
(147, 0, 0, 0, 0, 0, '2024-03-02 08:26:03', '2024-03-02 08:26:03'),
(148, 0, 0, 0, 0, 0, '2024-03-02 08:26:08', '2024-03-02 08:26:08'),
(149, 0, 0, 0, 0, 0, '2024-03-02 08:26:23', '2024-03-02 08:26:23'),
(150, 0, 0, 0, 0, 0, '2024-03-02 08:47:17', '2024-03-02 08:47:17'),
(151, 0, 0, 0, 0, 0, '2024-03-02 08:47:17', '2024-03-02 08:47:17'),
(152, 0, 0, 0, 0, 0, '2024-03-02 08:47:17', '2024-03-02 08:47:17'),
(153, 0, 0, 0, 0, 0, '2024-03-02 08:47:17', '2024-03-02 08:47:17'),
(154, 0, 0, 0, 0, 0, '2024-03-02 08:47:17', '2024-03-02 08:47:17'),
(155, 0, 0, 0, 0, 0, '2024-03-02 08:47:17', '2024-03-02 08:47:17'),
(156, 0, 0, 0, 0, 0, '2024-03-04 19:37:24', '2024-03-04 19:37:24'),
(157, 0, 0, 0, 0, 0, '2024-03-04 19:37:24', '2024-03-04 19:37:24'),
(158, 0, 0, 0, 0, 0, '2024-03-04 19:37:24', '2024-03-04 19:37:24'),
(159, 0, 0, 0, 0, 0, '2024-03-04 19:37:24', '2024-03-04 19:37:24'),
(160, 0, 0, 0, 0, 0, '2024-03-04 19:37:24', '2024-03-04 19:37:24'),
(161, 0, 0, 0, 0, 0, '2024-03-04 19:37:24', '2024-03-04 19:37:24'),
(162, 0, 0, 0, 0, 0, '2024-03-08 03:09:56', '2024-03-08 03:09:56'),
(163, 0, 0, 0, 0, 0, '2024-03-08 03:09:56', '2024-03-08 03:09:56'),
(164, 0, 0, 0, 0, 0, '2024-03-08 03:09:56', '2024-03-08 03:09:56'),
(165, 0, 0, 0, 0, 0, '2024-03-08 03:09:56', '2024-03-08 03:09:56'),
(166, 0, 0, 0, 0, 0, '2024-03-08 03:09:56', '2024-03-08 03:09:56'),
(167, 0, 0, 0, 0, 0, '2024-03-08 03:09:56', '2024-03-08 03:09:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama`, `createdAt`, `updatedAt`) VALUES
(1, 'Jaket', '2024-02-05 19:08:45', '2024-02-23 03:30:20'),
(2, 'Baju', '2024-02-05 19:08:45', '2024-02-05 19:08:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produksi`
--

CREATE TABLE `produksi` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kualitas` enum('Baik','Sangat Baik','Cukup','Buruk') NOT NULL DEFAULT 'Cukup',
  `setujui` tinyint(1) NOT NULL DEFAULT 0,
  `uuid_karyawan` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produksi`
--

INSERT INTO `produksi` (`id`, `id_produk`, `jumlah`, `kualitas`, `setujui`, `uuid_karyawan`, `tanggal`, `createdAt`, `updatedAt`) VALUES
(1, 1, 10, 'Sangat Baik', 1, '8361979b-8610-40d1-a14b-ef5e21224b20', '2024-02-06 01:10:37', '2024-02-05 19:09:30', '2024-03-05 08:12:11'),
(2, 2, 15, 'Baik', 1, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-02-06 01:10:37', '2024-02-05 19:09:30', '2024-03-05 08:12:14'),
(3, 2, 10, 'Sangat Baik', 1, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-02-28 00:00:00', '2024-02-28 07:04:39', '2024-03-05 08:12:06'),
(4, 1, 20, 'Cukup', 1, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-02-28 00:00:00', '2024-02-28 09:48:20', '2024-03-05 08:12:02'),
(5, 1, 10, 'Cukup', 1, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-02-28 00:00:00', '2024-02-28 09:51:36', '2024-03-05 08:11:56'),
(6, 2, 20, 'Sangat Baik', 1, '8361979b-8610-40d1-a14b-ef5e21224b20', '2024-02-28 00:00:00', '2024-02-28 09:57:17', '2024-03-05 08:11:51'),
(7, 2, 10, 'Sangat Baik', 1, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-02-28 00:00:00', '2024-02-28 09:58:20', '2024-03-05 08:11:46'),
(10, 1, 19, 'Sangat Baik', 1, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-02-28 00:00:00', '2024-02-28 11:16:21', '2024-03-05 08:11:42'),
(11, 1, 10, 'Cukup', 1, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-01 00:00:00', '2024-03-01 08:19:34', '2024-03-05 08:11:36'),
(12, 2, 15, 'Cukup', 1, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-01 00:00:00', '2024-03-01 08:19:57', '2024-03-05 08:11:31'),
(13, 1, 10, 'Baik', 1, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-01 00:00:00', '2024-03-01 08:20:30', '2024-03-05 08:11:24'),
(14, 1, 23, 'Cukup', 1, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-01 00:00:00', '2024-03-01 08:20:53', '2024-03-05 08:11:18'),
(16, 1, 20, 'Sangat Baik', 1, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-05 00:00:00', '2024-03-04 22:37:19', '2024-03-05 08:11:12'),
(17, 1, 10, 'Baik', 1, '26c107e5-950c-4034-bbe9-c83e74471a49', '2024-03-05 00:00:00', '2024-03-04 22:37:35', '2024-03-05 08:11:02'),
(18, 2, 30, 'Baik', 1, '52eef27f-09a4-4906-b3f8-8916885500a1', '2024-03-05 00:00:00', '2024-03-04 22:37:49', '2024-03-05 08:11:00'),
(19, 2, 30, 'Baik', 1, 'b497cfbf-e313-44c5-9dc5-ebe7edf1267e', '2024-03-05 00:00:00', '2024-03-04 22:38:04', '2024-03-05 08:10:57'),
(20, 1, 14, 'Baik', 1, '7aae7922-bb88-463d-95b5-43d5944526dc', '2024-03-05 00:00:00', '2024-03-04 22:38:19', '2024-03-05 08:10:54'),
(21, 1, 16, 'Baik', 1, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-05 00:00:00', '2024-03-04 22:38:36', '2024-03-05 08:10:52'),
(22, 1, 10, 'Baik', 1, '8361979b-8610-40d1-a14b-ef5e21224b20', '2024-03-05 00:00:00', '2024-03-04 22:39:04', '2024-03-05 08:10:49'),
(23, 2, 16, 'Sangat Baik', 1, '12a9b66e-d53b-4537-80da-550575342574', '2024-03-05 00:00:00', '2024-03-04 22:39:18', '2024-03-05 07:52:52'),
(24, 1, 15, '', 0, '4ec0d2d8-12dd-48eb-aedf-f10e142fb887', '2024-03-06 00:00:00', '2024-03-05 14:29:18', '2024-03-05 14:29:18'),
(25, 2, 20, '', 0, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-06 00:00:00', '2024-03-05 14:29:47', '2024-03-05 16:10:11'),
(26, 1, 17, '', 0, '4ba242d9-b53a-4497-bea0-8f1f854cd09c', '2024-03-07 00:00:00', '2024-03-05 16:55:04', '2024-03-05 16:55:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `nama_perusahaan` varchar(255) NOT NULL,
  `nama_alias` varchar(255) NOT NULL,
  `jenis_usaha` varchar(255) NOT NULL,
  `profil_perusahaan` text NOT NULL,
  `pimpinan` varchar(255) NOT NULL,
  `nomor_telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `informasi` text DEFAULT NULL,
  `lokasi` tinyint(1) NOT NULL DEFAULT 0,
  `nominal_bonus` float NOT NULL,
  `min_efektif_start` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `profil`
--

INSERT INTO `profil` (`id`, `logo`, `nama_perusahaan`, `nama_alias`, `jenis_usaha`, `profil_perusahaan`, `pimpinan`, `nomor_telepon`, `email`, `website`, `alamat`, `informasi`, `lokasi`, `nominal_bonus`, `min_efektif_start`, `createdAt`, `updatedAt`) VALUES
(1, 'STG-17084644908811708464490861.png', 'Sinar Tanjung Group', 'S.T.G.', 'Produsen Garmen', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nLorem Ipsum adalah teks dummy yang sering digunakan dalam industri percetakan dan desain grafis sebagai contoh teks placeholder. Ini digunakan untuk menunjukkan bagaimana teks akan terlihat dalam tata letak atau desain tanpa terganggu oleh isinya. Lorem Ipsum memiliki asal-usul dari bagian-bagian dari karya-karya klasik Latin klasik, ditemukan oleh Richard McClintock, seorang profesor Bahasa Latin di Hampden-Sydney College di Virginia, pada tahun 15.', 'AHMAD FUADI', '081121876521', 'sinar.tanjung.group@gmail.com', 'sinartanjunggroup.com', 'Jl. Kh. Zaini Mun\'im Dsn. Tj. Lor RT.17/RW.04 Des. Karanganyar Kec. Paiton Kab. Probolinggo Jawa Timur 89126', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\nLorem Ipsum adalah teks dummy yang sering digunakan dalam industri percetakan dan desain grafis sebagai contoh teks placeholder. Ini digunakan untuk menunjukkan bagaimana teks akan terlihat dalam tata letak atau desain tanpa terganggu oleh isinya. Lorem Ipsum memiliki asal-usul dari bagian-bagian dari karya-karya klasik Latin klasik, ditemukan oleh Richard McClintock, seorang profesor Bahasa Latin di Hampden-Sydney College di Virginia, pada tahun 15.', 0, 200000, 15, '2024-02-17 08:11:00', '2024-03-04 22:34:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `statis`
--

CREATE TABLE `statis` (
  `id` int(11) NOT NULL,
  `jam_start` time NOT NULL,
  `jam_end` time NOT NULL,
  `shift` varchar(20) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `statis`
--

INSERT INTO `statis` (`id`, `jam_start`, `jam_end`, `shift`, `aktif`, `createdAt`, `updatedAt`) VALUES
(1, '08:00:00', '15:00:00', 'Normal', 0, '2023-12-14 06:14:02', '2024-03-08 08:11:59'),
(2, '16:00:00', '20:00:00', 'Lembur', 1, '2023-12-16 11:27:11', '2024-03-08 08:11:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid_karyawan` (`uuid_karyawan`);

--
-- Indeks untuk tabel `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`uuid_karyawan`);

--
-- Indeks untuk tabel `doc`
--
ALTER TABLE `doc`
  ADD KEY `uuid_karyawan` (`uuid_karyawan`);

--
-- Indeks untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `id_kemampuan` (`id_kemampuan`);

--
-- Indeks untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD KEY `uuid_karyawan` (`uuid_karyawan`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `tmp_lhr` (`tmp_lhr`),
  ADD KEY `id_kab` (`id_kab`),
  ADD KEY `id_kemampuan` (`id_kemampuan`);

--
-- Indeks untuk tabel `kemampuan`
--
ALTER TABLE `kemampuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid_karyawan` (`uuid_karyawan`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD KEY `id_absensi` (`id_absensi`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `uuid_karyawan` (`uuid_karyawan`);

--
-- Indeks untuk tabel `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `statis`
--
ALTER TABLE `statis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT untuk tabel `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `kemampuan`
--
ALTER TABLE `kemampuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `produksi`
--
ALTER TABLE `produksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `statis`
--
ALTER TABLE `statis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `akses`
--
ALTER TABLE `akses`
  ADD CONSTRAINT `akses_ibfk_1` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `doc`
--
ALTER TABLE `doc`
  ADD CONSTRAINT `doc_ibfk_1` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`id_kemampuan`) REFERENCES `kemampuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD CONSTRAINT `hak_akses_ibfk_1` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`),
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`tmp_lhr`) REFERENCES `kabupaten` (`id`),
  ADD CONSTRAINT `karyawan_ibfk_3` FOREIGN KEY (`id_kab`) REFERENCES `kabupaten` (`id`),
  ADD CONSTRAINT `karyawan_ibfk_4` FOREIGN KEY (`id_kemampuan`) REFERENCES `kemampuan` (`id`);

--
-- Ketidakleluasaan untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD CONSTRAINT `lokasi_ibfk_1` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`id_absensi`) REFERENCES `absensi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produksi`
--
ALTER TABLE `produksi`
  ADD CONSTRAINT `produksi_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produksi_ibfk_2` FOREIGN KEY (`uuid_karyawan`) REFERENCES `karyawan` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
