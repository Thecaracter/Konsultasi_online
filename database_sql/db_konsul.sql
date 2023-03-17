-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 17 Mar 2023 pada 16.20
-- Versi server: 10.3.37-MariaDB-cll-lve
-- Versi PHP: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wsmifbid_mecherateam`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tartikel`
--

CREATE TABLE `tartikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `artikel` text NOT NULL,
  `foto` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tartikel`
--

INSERT INTO `tartikel` (`id`, `judul`, `artikel`, `foto`, `date`) VALUES
(1, 'Jagung itu Sehat', 'Penemuan fakta terbaru dari dokter bahwa jagung itu sehat', 'photos/097414500_1438079406-20150728-Jagung.jpg', '2018-12-26 14:07:01'),
(2, 'Mangga itu Manis', 'Ilmuwan indonesia telah resmi menyatakan bahwa mangga itu manis', 'photos/ilustrasi-mangga_20160325_192256.jpg', '2018-12-26 14:07:12'),
(19, 'Melon itu Hijau', 'Warna hijau ditemukan pada buah melon', 'photos/23079094-cantaloupe-melon-vector-illustration.jpg', '2018-12-26 02:07:59'),
(20, 'Sayur itu Murah', 'Mahasiswa lulusan IPB menemukan bahwa sayur lebih murah daripada ayam goreng', 'photos/sayuran_20180619_101443.jpg', '2018-12-26 14:18:46'),
(21, 'Wortel Bisa Dimakan', 'Hal mengejutkan datang dari para ilmuwan bahwa wortel dapat dimakan ', 'photos/3156f99e74deee890c8db9483e9ef7fd.jpeg', '2018-12-26 02:11:41'),
(22, 'Apel itu segar', 'Siapa yang tak kenal dengan buah apel? Buah yang sangat familiar ini bisa dijumpai di manapun Anda berada, baik di pasar tradisional, swalayan bahkan supermarket. Siapa sangka, di balik rasanya yang memang enak dan segar, ada banyak manfaat buah apel bagi kesehatan yang bisa didapatkan oleh tubuh Anda.\r\nSelain populer, ternyata memang ada banyak manfaat apel bagi kesehatan tubuh. Manfaat apel bagi kesehatan yang bisa didapatkan tubuh antara lain adalah mengobati berbagai macam penyakit dan mengganti sel-sel jaringan tubuh yang rusak. Apakah hanya itu saja manfaat apel bagi kesehatan tubuh?', 'photos/31975142285_c33e90f767.jpg', '2019-01-15 04:00:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tkomentar`
--

CREATE TABLE `tkomentar` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `komentar` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tkomentar`
--

INSERT INTO `tkomentar` (`id`, `nama`, `komentar`, `date`, `post`) VALUES
(16, 'Reza', 'Mangga itu buah ya?', '2018-12-08 13:18:44', 2),
(18, 'Henry', 'Besok mulai nanem jagung ah', '2018-12-08 13:19:17', 1),
(19, 'Dhonny', 'Mantap gan!', '2018-12-08 13:19:39', 1),
(20, 'Reza', 'wah hebat', '2019-01-03 14:36:26', 2),
(21, 'Kevin', 'mantaab', '2019-01-03 14:41:33', 2),
(22, 'Reza', 'kereen', '2019-01-08 13:42:43', 2),
(23, 'Kevin', 'beli lah', '2019-01-08 13:44:26', 2),
(24, 'Reza', 'yoi', '2019-01-09 01:53:22', 2),
(25, 'Kevin', 'emang manis sih', '2019-01-13 14:28:38', 2),
(26, 'Reza', 'buat pulkam', '2019-01-13 14:42:28', 2),
(27, 'steven', 'bermanfaat gan', '2019-01-15 03:57:19', 20),
(28, 'steven', 'wah sangat bermanfaat', '2019-01-15 04:04:52', 22),
(29, 'steven', 'buat mamah dirumah ah', '2019-01-16 03:22:16', 2),
(30, 'steven', 'sama ayah', '2019-01-16 03:23:08', 2),
(31, 'anjay', 'aduh ngab', '2023-03-16 05:10:49', 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tkonsultasi`
--

CREATE TABLE `tkonsultasi` (
  `id_konsultasi` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `topik_konsul` text NOT NULL,
  `konsultasi_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_konsul` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tkonsultasi`
--

INSERT INTO `tkonsultasi` (`id_konsultasi`, `id_dokter`, `id_pasien`, `topik_konsul`, `konsultasi_date`, `status_konsul`) VALUES
(16, 78, 79, 'Anjay', '2023-03-16 05:06:31', 'process');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tpesan`
--

CREATE TABLE `tpesan` (
  `id_pesan` int(11) NOT NULL,
  `id_konsultasi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `pesan_teks` text NOT NULL,
  `pesan_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pesan_attachment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tpesan`
--

INSERT INTO `tpesan` (`id_pesan`, `id_konsultasi`, `id_user`, `pesan_teks`, `pesan_date`, `pesan_attachment`) VALUES
(112, 16, 79, 'woy anjay\r\n', '2023-03-16 05:06:48', ''),
(113, 16, 78, 'apa ngab', '2023-03-16 05:06:58', ''),
(114, 16, 78, 'y\r\n', '2023-03-16 05:07:07', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tspesialisasi`
--

CREATE TABLE `tspesialisasi` (
  `id_spesialisasi` int(11) NOT NULL,
  `kode_spesialisasi` varchar(20) NOT NULL,
  `nama_spesialisasi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tspesialisasi`
--

INSERT INTO `tspesialisasi` (`id_spesialisasi`, `kode_spesialisasi`, `nama_spesialisasi`) VALUES
(12, 'GG', 'Gigi'),
(14, 'THT', 'THT'),
(15, 'PD', 'Penyakit Dalam'),
(16, 'ANK', 'Anak'),
(17, 'KGD', 'Kandungan'),
(18, 'KNK', 'Kanker');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tuser`
--

CREATE TABLE `tuser` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `email_user` varchar(50) NOT NULL,
  `telp_user` varchar(20) NOT NULL,
  `pass_user` varchar(255) NOT NULL,
  `spesialis` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `foto_user` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tuser`
--

INSERT INTO `tuser` (`id_user`, `nama_user`, `email_user`, `telp_user`, `pass_user`, `spesialis`, `role`, `foto_user`, `tgl_lahir`, `jk`) VALUES
(58, 'Goldy', 'goldywidiyanto@gmail.como', '082213525038', '$2y$10$9hD0wcO.Crh/LNsDXP3KDO9ToRYynISRe3L8IwIXAM/RCpBMBtQQ.', 'GG', 'dokter', 'photos/1492186602070.jpg', '2018-12-04', 'Laki-Laki'),
(61, 'Made', 'made@gmail.com', '0823131213', '$2y$10$/YF0AZx.DbLMD8G2DcmnMuf996gNw5qT89jhbDbfwUQuCEeVB7ma2', 'THT', 'dokter', 'photos/1522510426416.jpg', '2018-11-25', 'Laki-Laki'),
(62, 'Leo', 'leo@gmail.com', '082113131313', '$2y$10$cx8PfUcikEesSO9RoFNsnOlIcYF9sYadeRu7M29GA23tZu.TvZW16', 'ANK', 'dokter', 'photos/1522510435196.jpg', '2018-11-26', 'Laki-Laki'),
(69, 'Henry', 'henry@gmail.com', '082213525038', '$2y$10$f4ZRQjizMsU5ucbmRH96Duf2JW/J8TNq9hC0q8TnU/UQwbXW.7zpC', 'PD', 'dokter', 'photos/5c25031507d09.jpg', '2018-12-18', 'Laki-Laki'),
(75, 'Ibnu', 'ibnu@gmail.com', '08843535543', '$2y$10$HlycR.600gtxwQkdzoyMCuNUY/goTO005tKVs6KKhnRfuX0WWM1Tu', 'KGD', 'dokter', 'photos/5c3d60f7bea1f.jpg', '2019-01-11', 'Laki-Laki'),
(76, 'Sigit', 'sigit@gmail.com', '082321313123', '$2y$10$lZNCARxJoM0YDtVLY/Z06.6Fxkrh02oa9xQQ4iGu8Mq6ResySYULa', 'PD', 'dokter', 'photos/5c3e8940876f5.jpg', '1998-01-07', 'Laki-Laki'),
(78, 'rizqi', 'rizqi@gmail.com', '08883662780', '$2y$10$PjOYz5B2zXD5GrMZ65aiT.t.uSxB7J/PHPLKVE9xfAH3u44yEDHkW', 'ANK', 'dokter', 'photos/63fc8a4d68411.jpg', NULL, NULL),
(79, 'anjay', 'anjay@gmail.com', '0873169761', '$2y$10$Kn1wuSRbq24XyXJj/bKxluGPBkC8V3rI64BRBni0.rYD.CseQojF.', NULL, 'user', 'photos/63fc8ad94d2df.jpg', NULL, NULL),
(80, 'admin', 'admin@gmail.com', '0888631976491', '$2y$10$WEnai4y2nDUWQKaw66QMDeDpxyfCpbe1Xa53.ZYIvqSpvA2Yg4/ou', NULL, 'admin', 'photos/640e004687922.jpg', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tartikel`
--
ALTER TABLE `tartikel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tkomentar`
--
ALTER TABLE `tkomentar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tkonsultasi`
--
ALTER TABLE `tkonsultasi`
  ADD PRIMARY KEY (`id_konsultasi`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter_2` (`id_dokter`,`id_pasien`);

--
-- Indeks untuk tabel `tpesan`
--
ALTER TABLE `tpesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_konsultasi` (`id_konsultasi`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `tspesialisasi`
--
ALTER TABLE `tspesialisasi`
  ADD PRIMARY KEY (`id_spesialisasi`),
  ADD UNIQUE KEY `kode_spesialisasi` (`kode_spesialisasi`);

--
-- Indeks untuk tabel `tuser`
--
ALTER TABLE `tuser`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email_user` (`email_user`),
  ADD KEY `spesialis` (`spesialis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tartikel`
--
ALTER TABLE `tartikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tkomentar`
--
ALTER TABLE `tkomentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `tkonsultasi`
--
ALTER TABLE `tkonsultasi`
  MODIFY `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `tpesan`
--
ALTER TABLE `tpesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT untuk tabel `tspesialisasi`
--
ALTER TABLE `tspesialisasi`
  MODIFY `id_spesialisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tuser`
--
ALTER TABLE `tuser`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tkonsultasi`
--
ALTER TABLE `tkonsultasi`
  ADD CONSTRAINT `tkonsultasi_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `tuser` (`id_user`),
  ADD CONSTRAINT `tkonsultasi_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `tuser` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `tpesan`
--
ALTER TABLE `tpesan`
  ADD CONSTRAINT `tpesan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tuser` (`id_user`),
  ADD CONSTRAINT `tpesan_ibfk_2` FOREIGN KEY (`id_konsultasi`) REFERENCES `tkonsultasi` (`id_konsultasi`);

--
-- Ketidakleluasaan untuk tabel `tuser`
--
ALTER TABLE `tuser`
  ADD CONSTRAINT `tuser_ibfk_1` FOREIGN KEY (`spesialis`) REFERENCES `tspesialisasi` (`kode_spesialisasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
