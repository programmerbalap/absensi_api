-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Feb 2024 pada 07.50
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
('12a9b66e-d53b-4537-80da-550575342574', 'Muhammad Subhan', 'subhan@gmail.com', '$2b$10$wAY9O0mXdHTkE4Fnq1AcXODXzoAYdGWCWxyvSHJPUpqe9/ewZdYSG', '3511021210000003', 'Laki-laki', 1, '3511', '2000-10-12', '3511', '81249700284', '98878867878', 'Aktif', 1, 0, '2023-12-02 03:58:01', '2024-01-21 08:24:54'),
('26c107e5-950c-4034-bbe9-c83e74471a49', 'Wafi', 'wafi@gmail.com', '$2b$10$0wjElHEYZ7tKy8CU6datjuz6xyc2ENw8cetYzNqRAJuSbXGO8t7Q6', '3511021210000003', 'Laki-laki', 4, '3510', '2023-12-12', '3510', '81249700284', '12987381312', 'Aktif', 1, 0, '2023-12-04 11:43:26', '2024-01-21 08:24:54'),
('4ba242d9-b53a-4497-bea0-8f1f854cd09c', 'Gigih', 'gigih@gmail.com', '$2b$10$RRffQgT0Ve.hcvx9SeRav.9bVGIOf7zx/DDBMaR.ICEIoZFiWssgu', '3511021210000003', 'Laki-laki', 3, '3511', '2000-10-12', '3511', '81249700284', '87979789718', 'Aktif', 1, 0, '2023-12-04 07:57:19', '2024-01-21 08:24:54'),
('4ec0d2d8-12dd-48eb-aedf-f10e142fb887', 'Muhammad Ainul', 'ainul@gmail.com', '$2b$10$w9m.iCkLIeH/3PtbDYoKd.lCRBpXTsLSJNoeCcMIAUHc/sXgkbbz2', '2198732198371293', 'Laki-laki', 4, '3511', '2000-10-12', '3511', '08326563232', '2187923872198', 'Aktif', 3, 0, '2024-01-07 18:15:57', '2024-01-21 08:24:54'),
('52eef27f-09a4-4906-b3f8-8916885500a1', 'Muhammad Alif', 'alif@gmail.com', '$2b$10$XQV17nKt2b/vDKAloXk0KOIMG88WdG6xJmHXE8XLanxZPOHlaeyhi', '1328739812379139', 'Laki-laki', 4, '3511', '2000-10-12', '3511', '08217739127', '89191726716211', 'Aktif', 4, 0, '2024-01-07 07:00:26', '2024-01-21 08:24:54'),
('7aae7922-bb88-463d-95b5-43d5944526dc', 'Agung', 'agung@gmail.com', '$2b$10$5up82wOmf9CtAwa9GECX0.anwAYXLS5iizIe0sM3z2twL3smUcyg6', '3511021210000003', 'Laki-laki', 4, '3511', '2023-12-12', '3511', '81249700284', '21865387131', 'Aktif', 3, 0, '2023-12-04 11:39:29', '2024-01-21 08:24:54'),
('8361979b-8610-40d1-a14b-ef5e21224b20', 'Sugik', 'sugik@gmail.com', '$2b$10$menUWekBrKZC6aGQ1jBGbO/THNx.J/d1ALL9lxruBWioyiByEkc7G', '3511021210000003', 'Laki-laki', 2, '3511', '2000-10-12', '3511', '81249700284', '81287632187', 'Aktif', 1, 0, '2023-12-04 07:54:09', '2024-01-21 08:24:54'),
('b497cfbf-e313-44c5-9dc5-ebe7edf1267e', 'Andika', 'andika@gmail.com', '$2b$10$/1Q/3trWGTXjMtcRtBfC6eZOsJtsCcOtIqn2qF6SET2OFVfzQUn1q', '3511021210000003', 'Laki-laki', 4, '3511', '2000-10-12', '3511', '81249700284', '81763813131', 'Aktif', 2, 0, '2023-12-04 11:41:20', '2024-01-21 08:24:54');

--
-- Indexes for dumped tables
--

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
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`),
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`tmp_lhr`) REFERENCES `kabupaten` (`id`),
  ADD CONSTRAINT `karyawan_ibfk_3` FOREIGN KEY (`id_kab`) REFERENCES `kabupaten` (`id`),
  ADD CONSTRAINT `karyawan_ibfk_4` FOREIGN KEY (`id_kemampuan`) REFERENCES `kemampuan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
