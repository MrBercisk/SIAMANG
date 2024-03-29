-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jul 2023 pada 16.59
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diskominfosan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `pengirim` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `waktu_kirim` timestamp NOT NULL DEFAULT current_timestamp(),
  `dibaca` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id`, `pengirim`, `kategori_id`, `pesan`, `waktu_kirim`, `dibaca`) VALUES
(1, 23, 4, 'tesss', '2023-07-19 12:30:56', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_bidang`
--

CREATE TABLE `tbl_bidang` (
  `id` int(11) NOT NULL,
  `nama_bidang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_bidang`
--

INSERT INTO `tbl_bidang` (`id`, `nama_bidang`) VALUES
(1, 'Sistem Informasi Dan Statistik'),
(2, 'Infrastruktur Telematika'),
(3, 'Persandian Dan Telekomunikasi'),
(4, 'Informasi Dan Komunikasi Publik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_informasi`
--

CREATE TABLE `tbl_informasi` (
  `id` int(11) NOT NULL,
  `tgl_buka` date NOT NULL,
  `tgl_tutup` date NOT NULL,
  `tgl_pengumuman` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_informasi`
--

INSERT INTO `tbl_informasi` (`id`, `tgl_buka`, `tgl_tutup`, `tgl_pengumuman`) VALUES
(1, '2023-05-10', '2023-05-10', '2023-05-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jadwal`
--

CREATE TABLE `tbl_jadwal` (
  `id` int(11) NOT NULL,
  `pendaftaran_id` int(11) NOT NULL,
  `tanggal_mulai` date NOT NULL DEFAULT current_timestamp(),
  `tanggal_selesai` date NOT NULL DEFAULT current_timestamp(),
  `tanggal_bimbingan` date NOT NULL DEFAULT current_timestamp(),
  `jam_bimbingan` time NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id`, `pendaftaran_id`, `tanggal_mulai`, `tanggal_selesai`, `tanggal_bimbingan`, `jam_bimbingan`, `updated_at`) VALUES
(1, 2, '2023-05-24', '2023-07-23', '2023-06-06', '08:00:00', '2023-07-24 14:04:27'),
(2, 2, '2023-05-24', '2023-07-23', '2023-06-20', '09:00:00', '2023-07-24 14:08:26'),
(3, 2, '2023-05-24', '2023-07-23', '2023-07-04', '09:00:00', '2023-07-24 14:16:11'),
(4, 2, '2023-05-24', '2023-07-23', '2023-07-18', '09:00:00', '2023-07-24 14:21:35'),
(5, 3, '2023-05-24', '2023-07-23', '2023-06-22', '08:30:00', '2023-07-24 14:12:26'),
(6, 3, '2023-05-24', '2023-07-23', '2023-06-29', '08:30:00', '2023-07-24 14:12:26'),
(7, 3, '2023-05-24', '2023-07-23', '2023-07-06', '08:30:00', '2023-07-24 14:25:10'),
(8, 3, '2023-05-24', '2023-07-23', '2023-07-20', '08:30:00', '2023-07-24 14:26:44'),
(9, 5, '2023-05-24', '2023-07-23', '2023-06-05', '07:30:00', '2023-07-24 14:52:45'),
(10, 5, '2023-05-24', '2023-07-23', '2023-06-17', '07:30:00', '2023-07-24 14:52:45'),
(11, 5, '2023-05-24', '2023-07-23', '2023-07-05', '07:30:00', '2023-07-24 14:52:45'),
(12, 5, '2023-05-24', '2023-07-23', '2023-07-19', '07:30:00', '2023-07-24 14:55:01'),
(13, 6, '2023-05-24', '2023-07-20', '2023-07-19', '07:30:00', '2023-07-24 14:55:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kampus`
--

CREATE TABLE `tbl_kampus` (
  `id` int(11) NOT NULL,
  `nama_kampus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kampus`
--

INSERT INTO `tbl_kampus` (`id`, `nama_kampus`) VALUES
(1, 'UBSI'),
(2, 'UGM'),
(3, 'UMY'),
(4, 'UNY'),
(5, 'UAD'),
(6, 'UPN'),
(7, 'STPMD'),
(8, 'AMIKOM'),
(9, 'UMBY');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `syarat` varchar(60) NOT NULL,
  `tugas` varchar(60) NOT NULL,
  `fitur` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id`, `bidang_id`, `nama_kategori`, `syarat`, `tugas`, `fitur`) VALUES
(1, 1, 'Pengembangan Perangkat Lunak', 'SIM CUTI', 'Aplikasi Pengajuan Cuti', 'Pengajuan Cuti, Verifikasi Permohonan Cuti, Laporan Rekap Permhonan Cuti ( Slot, Terpakai, Sisa, Akumulasi )'),
(2, 1, 'Aplikasi', 'Kalender Event', 'Aplikasi Kalender Event', 'Pendaftaran Event, Verifikasi Pendaftaran Event, Pendaftaran Pengunjung Event, Verifikasi Pendaftarab Pengunjung Event, Tiketing'),
(3, 1, 'Desain Grafis', 'Panduan Ubah No. Whatsapp Di Akun Jss', 'Desain Dan Grafis Pendukung Jss', 'Sesuai Kebutuhan'),
(4, 1, 'Aplikasi2', 'Aplikasi Pengjuan Cuti', 'Aplikasi Pengelolaan Pengajuan Cuti', 'Pengajuan Cuti, Verifikasi Permohonan Cuti, Rekap Permohonan Cuti (Slot Terpakai, Sisa, Akumulasi)'),
(5, 2, 'Pengelola Server', '', '', ''),
(6, 2, 'Jaringan', '', '', ''),
(7, 3, 'Operasional Persandian Dan Telekomunikasi', '', '', ''),
(8, 3, 'Pengamanan Informasi', '', '', ''),
(9, 3, 'Pengawasan Pengendalian Persandian Dan Telematika', '', '', ''),
(10, 4, 'Layanan Informasi Dan Pengaduan', '', '', ''),
(11, 4, 'Humas Dan Publikasi', '', '', ''),
(12, 4, 'Pengelolaan Informasi', '', '', ''),
(13, 1, 'Video', 'Panduan Ubah No. Whatsapp Di Akun Jss', 'Video Tutorial', 'Resolisi Full HD, Penyampaian Informasi Yang Jelas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_laporan`
--

CREATE TABLE `tbl_laporan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `judul_laporan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_drive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_nilai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surat_selesai_magang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tbl_laporan`
--

INSERT INTO `tbl_laporan` (`id`, `user_id`, `judul_laporan`, `link_drive`, `form_nilai`, `surat_selesai_magang`, `created_at`, `updated_at`) VALUES
(1, 17, 'Aplikasi Magang', 'https://drive.google.com/drive/u/1/folders/1oyKP3iPH8rU9007pw33v5s78S_nEotdU', '17_BIMO_Laporan_Magang.pdf', '', '2023-07-24 15:35:43', '2023-07-24 16:14:39'),
(2, 18, 'Laporan Akhir SIM Cuti', 'https://drive.google.com/drive/u/1/folders/1oyKP3iPH8rU9007pw33v5s78S_nEotdU', '19_SARA_Laporan_Magang.pdf', '', '2023-07-24 16:09:15', '2023-07-24 16:14:43'),
(3, 20, 'Aplikasi data dan statistik', 'https://drive.google.com/drive/u/1/folders/1oyKP3iPH8rU9007pw33v5s78S_nEotdU', '20_ANTO_Laporan_Magang.pdf', '', '2023-07-24 16:40:59', '2023-07-24 16:40:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_nilai`
--

CREATE TABLE `tbl_nilai` (
  `id` int(11) NOT NULL,
  `pendaftaran_id` int(11) NOT NULL,
  `ketepatan_waktu` int(11) NOT NULL,
  `tanggung_jawab` int(11) NOT NULL,
  `kehadiran` int(11) NOT NULL,
  `kemampuan_kerja` int(11) NOT NULL,
  `kualitas_kerja` int(11) NOT NULL,
  `kerjasama` int(11) NOT NULL,
  `inisiatif` int(11) NOT NULL,
  `rasa_percaya` int(11) NOT NULL,
  `penampilan` int(11) NOT NULL,
  `patuh_aturan_pkl` int(11) NOT NULL,
  `rata_rata` int(11) NOT NULL,
  `tanda_tangan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pendaftaran`
--

CREATE TABLE `tbl_pendaftaran` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nomor_pendaftaran` int(11) NOT NULL,
  `nama_peserta` varchar(80) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `jenis_permohonan` varchar(30) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `alamat_peserta` text NOT NULL,
  `nama_kampus` varchar(10) NOT NULL,
  `prodi` varchar(60) NOT NULL,
  `keahlian` text NOT NULL,
  `tools` text NOT NULL,
  `judul` varchar(500) NOT NULL,
  `surat_permohonan` varchar(128) NOT NULL,
  `status_permohonan` varchar(128) NOT NULL,
  `nama_anggota_1` varchar(80) NOT NULL,
  `nama_anggota_2` varchar(80) NOT NULL,
  `video_perkenalan` varchar(128) NOT NULL,
  `foto` text NOT NULL,
  `berkas` text NOT NULL,
  `nda` text NOT NULL,
  `tahap_satu` varchar(128) NOT NULL,
  `tahap_dua` varchar(128) NOT NULL,
  `tahap_tiga` varchar(128) NOT NULL,
  `tanggal_pendaftaran` date NOT NULL,
  `status_pendaftaran` varchar(128) NOT NULL,
  `status_verifikasi` varchar(128) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pendaftaran`
--

INSERT INTO `tbl_pendaftaran` (`id`, `user_id`, `bidang_id`, `kategori_id`, `nomor_pendaftaran`, `nama_peserta`, `nim`, `jenis_permohonan`, `no_hp`, `alamat_peserta`, `nama_kampus`, `prodi`, `keahlian`, `tools`, `judul`, `surat_permohonan`, `status_permohonan`, `nama_anggota_1`, `nama_anggota_2`, `video_perkenalan`, `foto`, `berkas`, `nda`, `tahap_satu`, `tahap_dua`, `tahap_tiga`, `tanggal_pendaftaran`, `status_pendaftaran`, `status_verifikasi`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 16, 1, 4, 202212002, 'BEKTI WINDU PRATIWI', '12200270', 'Kerja Praktek', '082241143101', 'Girimulyo, Kulon Progo, Yogyakarta', 'UGM', 'Sistem Informasi', 'Frontend & Backend', 'React JS, AXIOS, Codeignitier, Laravel, API', 'Aplikasi Magang', '1686121125_873b3388d0426df3b35a.pdf', 'Individu', '', '', '1686121125_e57a1bb86ee5265a2b3c.mp4', '1686121125_730c9509373ead060ec7.jpg', '1686121125_36a83adde87c379c8846.pdf', '1686121125_3794bf172630843b6fd8.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-06-07', 'Selesai', 'Belum Verifikasi', '', '2023-06-07 13:37:50', '2023-07-24 12:47:00'),
(2, 17, 1, 2, 202212005, 'BIMO SATRIO', '12201086', 'Kerja Praktek', '081225771001', 'Purworejo, Jawa Tengah', 'UBSI', 'Sistem Informasi', 'Full stack Developer.', 'Codeignitier, PHP, Javascript, Boostrap, Git, React JS, Node Js, Mysql, Xampp', 'Aplikasi Magang', '1690175821_827b2f99eeae0940858f.pdf', 'Kelompok', 'DANI RIYANTO', 'ERWIN KURNIAWAN', '1690175821_1bac2f034bc91be0c63d.mp4', '1690175821_76d40888f71a628e6cf8.jpg', '1690175821_cbbb483d0385c990f96e.pdf', '1690175821_4caf5b50ca0adc1b3fc2.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-05-24', 'Selesai', 'Diterima', '', '2023-07-24 12:11:24', '2023-07-24 12:46:26'),
(3, 18, 1, 2, 202212007, 'SARA PUJA', '12201505', 'Kerja Praktek', '08221678000', 'Sleman, Yogyakarta', 'UBSI', 'Sistem Informasi', 'Frontend, Backend, backend, desain', 'codeignitier, bootstrap, canva, figma, Mysql, Javascript', 'SIM Cuti', '1690176501_57a3c5a98532d71f0b83.pdf', 'Kelompok', 'ANGGI NUR ANGGRAENI', 'MAULIDYA CAHYA DININGRUM', '1690176501_66842a8d36b4f7560711.mp4', '1690176501_aa51429abaaa2dabced1.jpg', '1690176501_e8cc2b8147f53d497378.pdf', '1690176501_c8aa7c2ffa7602b237a6.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-05-11', 'Selesai', 'Diterima', '', '2023-07-24 12:23:24', '2023-07-24 12:46:15'),
(4, 19, 1, 2, 202212009, 'ADINDA NUR AFIFA', '12112001', 'Kerja Praktek', '082216780008', 'Bantul, Yogyakarta', 'UGM', 'Ilmu Komunikasi', 'Frontend, desain', 'React Js, Figma, Axios, boostrap, git', 'Data dan statistik', '1690177440_8427a919c29e0335c2ae.pdf', 'Individu', '', '', '1690177440_dc0c368eeb7697ca2904.mp4', '1690177440_17d0626097928ba87b7f.jpg', '1690177440_a2d72328e0474421356c.pdf', '1690177440_4e6725f416cf8cbaa5ff.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-05-20', 'Selesai', 'Tidak Diterima', 'Keahlian/Tools Yang Dikuasai Peserta Belum Memenuhi Syarat', '2023-07-24 12:38:07', '2023-07-24 12:45:36'),
(5, 20, 1, 2, 202212010, 'DARMA', '12200270', 'Kerja Praktek', '082241143101', 'Kulon Progo, Yogyakarta', 'UBSI', 'Sistem Informasi', 'Frontend, Backend, Desain', 'Codeignitier, PHP, Jvascript, React Js, Git, Boostrap, Tailwind, Figma, Mysql', 'Aplikasi Data dan Statistik', '1690184093_2faea90670aaa6485bb8.pdf', 'Kelompok', 'DINDA KARUNIA', 'DANIA', '1690184093_3ba58ad7722b28e97a50.mp4', '1690184093_925987e9721bb67d3239.jpg', '1690184093_8fc8765030b39da69d21.pdf', '1690184093_23ec3cce8008c3f3e1af.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-05-18', 'Selesai', 'Diterima', '', '2023-07-24 14:31:45', '2023-07-24 14:46:05'),
(6, 21, 1, 13, 202212012, 'DIMAS PRASETYO', '20022211', 'Kerja Praktek', '081225789100', 'Gunung Kidul, Yogyakarta', 'UNY', 'Multimedia', 'Videography, Desain, Fotography', 'Adobe Photoshop, Adobe XD, Adobe Premier, Kamera DSLR', 'Video Promosi dan cara pengaduan JSS', '1690184729_84ddcd96974ae4c46713.pdf', 'Individu', '', '', '1690184729_a727fc788f8209ca7612.mp4', '1690184729_8200e47a1c4e5a150f51.jpg', '1690184729_aa0345cd65405a13af85.pdf', '1690184729_2420737ea709bdbebcff.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-05-20', 'Selesai', 'Diterima', '', '2023-07-24 14:40:26', '2023-07-24 14:46:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_presensi`
--

CREATE TABLE `tbl_presensi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal_presensi` date NOT NULL DEFAULT current_timestamp(),
  `jam` time NOT NULL,
  `keterangan_presensi` text NOT NULL,
  `status_presensi` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_progresmagang`
--

CREATE TABLE `tbl_progresmagang` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tgl_bimbingan` date NOT NULL,
  `pencapaian` text NOT NULL,
  `file_presentasi` varchar(255) NOT NULL,
  `catatan` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_progresmagang`
--

INSERT INTO `tbl_progresmagang` (`id`, `user_id`, `tgl_bimbingan`, `pencapaian`, `file_presentasi`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 17, '2023-06-06', 'Halaman Utama Aplikasi', '17_BIMO_Progress_Magang.pdf', 'Tambahkan info lowongan', '2023-07-24 14:12:33', '2023-07-24 16:13:30'),
(2, 17, '2023-06-20', 'Halaman pendaftaran magang', '17_BIMO_Progress_Magang.pdf', 'Tambahkan NDA pada upload dokumen', '2023-07-24 14:14:26', '2023-07-24 16:13:33'),
(3, 17, '2023-07-04', 'Halaman admin dan mentor magang', '17_BIMO_Progress_Magang.pdf', 'Tambahkan grafik presentase diterima dan tidak diterima mahasiswa berdasarkan nama kampus', '2023-07-24 14:15:41', '2023-07-24 16:13:36'),
(4, 17, '2023-07-18', 'Halaman mahasiswa dan menu download dokumen akhir', '17_BIMO_Progress_Magang.pdf', 'Fitur nilai by sistem dari mentor', '2023-07-24 14:17:02', '2023-07-24 16:13:39'),
(5, 18, '2023-06-22', 'Progress pertemuan 1 perancangan UI', '19_SARA_Progress_Magang.pdf', '', '2023-07-24 16:01:23', '2023-07-24 16:13:44'),
(6, 18, '2023-07-06', 'Halaman Utama Website dan Login', '19_SARA_Progress_Magang.pdf', 'Tambahkan fitur forgot password', '2023-07-24 16:05:36', '2023-07-24 16:13:48'),
(7, 18, '2023-06-29', 'Penambahan menu pada halaman utama', '19_SARA_Progress_Magang.pdf', '', '2023-07-24 16:07:05', '2023-07-24 16:13:51'),
(8, 18, '2023-07-20', 'Halaman SIM Cuti karyawan', '19_SARA_Progress_Magang.pdf', '', '2023-07-24 16:08:13', '2023-07-24 16:13:56'),
(9, 20, '2023-06-05', 'Analisa kebutuhan User', '20_ANTO_Progress_Magang.pdf', '', '2023-07-24 16:30:05', '2023-07-24 16:30:05'),
(10, 20, '2023-06-17', 'Membuat halaman utama aplikasi, admin', '20_ANTO_Progress_Magang.pdf', 'Pada login tambahkan fitur recaptcha untuk meningkatkan keamanan', '2023-07-24 16:35:11', '2023-07-24 16:35:11'),
(11, 20, '2023-07-05', 'Penambahan beberapa grafik dan statistik', '20_ANTO_Progress_Magang.pdf', 'Tambahkan fitur filter data berdasarkan tahun', '2023-07-24 16:37:35', '2023-07-24 16:37:35'),
(12, 20, '2023-07-19', 'Penambahan keunggulan aplikasi berupa chat dengan admin', '20_ANTO_Progress_Magang.pdf', 'Ubah tanggal ke format Indonesia', '2023-07-24 16:39:51', '2023-07-24 16:39:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `bidang_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` text NOT NULL,
  `token` varchar(255) NOT NULL,
  `reset_token_created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `bidang_id`, `kategori_id`, `role_id`, `nama`, `email`, `password`, `token`, `reset_token_created_at`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 1, 'admin', 'admin@diskominfosan.ac.id', 'g3c2qQEPMVvJ3uuuDdtd5YaxV1H+WbD6r1UzcjQqxtf3JqYGdQD8emmBgneScdvFDFHWPNXfpWGKHenH+Or+uOIHC4OgJCbn1uNuf0kHtkum5fBDeV3fuQ==', '', '2023-04-14 10:48:14', '2022-09-03 09:04:07', '2022-09-03 09:04:07'),
(2, 1, 2, 2, 'Mentor Aplikasi', 'mentorapk@diskominfosan.ac.id', 'hcJdk+Zs/DcAdyeLgJqxLsHOjzydN+rPOmunNmGEzsquMDb//CxFIueoa7x1dluEx0QiGnhAcL+86QszoLXtMxdhlLM83keRso7Mq/DULzCi/lVv0hIm/i8=', '', '2023-04-23 13:28:33', '2023-04-23 01:28:33', '2023-04-23 01:28:33'),
(3, 1, 4, 2, 'Mentor Multimedia', 'mentormultimedia@diskominfosan.ac.id', 'BHQ6s1wSL8bVUAtww6sxaYYJ6dkAk28BJdNyWolgk24WRDRo9Z5MtiHcYkExFN8tHMrg2EdOt1q59+mretib8rsitZQzwhuPerfVwaDR2T30Ti6q59qkH/s=', '', '2023-04-27 05:11:49', '2023-04-26 17:11:49', '2023-04-26 17:11:49'),
(4, 1, 1, 2, 'Mentor Perangkat Lunak', 'mentorperangkatlunak@diskominfosan.ac.id', 'yhO5Ij84E8j5J1MwqawZdkVg1QI9WPY43SMNBzOUDoLfKexPcKdJ2CLc4Gxkib6If6fr5nEfmbKcop0txjph2Q0ml1Q60bs/ny+xrB8J/zD9V/nj6OXEY+A=', '', '2023-05-03 13:19:13', '2023-05-03 01:19:13', '2023-05-03 01:19:13'),
(5, 1, 3, 2, 'Mentor Analisis', 'mentoranalisis@diskominfosan.ac.id', 'bQkRup50jqCyFPU7F6kXtA1JKb6k8wN9+IMGYRVtwj4UCXO1/5yn6TUMCFG2G4co1n5PGULcC0lVacsAyHJPqU3Qx6AQGK2cyhJv7SY78rR8tQCjhq1wCaU=', '', '2023-05-08 14:18:29', '2023-05-08 02:18:29', '2023-05-08 02:18:29'),
(6, 2, 6, 2, 'Mentor Jaringan', 'mentorjaringan@diskominfosan.ac.id', 'fNjT6LsqWpt0yRwEskUJLzH5QHhdCaFojNgeBbNA5Yy2WPeZpnDSXiDRtjFEOuKtmD/wsOto61tuSPqhTTcdmEtEY0F8UsECF6caO3Di8hQyo/ASPYcxtlQ=', '', '2023-05-24 18:55:26', '2023-05-24 06:55:26', '2023-05-24 06:55:26'),
(7, 2, 5, 2, 'Mentor Server', 'mentorserver@diskominfosan.ac.id', 'K9+u43PB5aeiX0knacGl0pHiwKwxC+OhX4ByNKDRkUF4q6qUtCZavtutBF5imITUZLkqr6s3vL8EGWLVv2TYMShE3B5dYS+iHaZkM5lHFhrDunl2OTjid8g=', '', '2023-05-24 18:58:13', '2023-05-24 06:58:13', '2023-05-24 06:58:13'),
(8, 3, 7, 2, 'Mentor Operasional Persandian dan Telekomunikasi', 'mentoroperasional@diskominfosan.ac.id', '8yuv5GU/Ouo28fzl7iO8dHp0pXHgh3HHxrUPwudmg5GgLEOZ1nR4uJ13HB+oFmTqCaE2cYxguyJuSKG8h66QZ59MjPP31LPejSYbXgN0NHhwL/8nCjclijo=', '', '2023-06-01 18:32:38', '2023-06-01 18:32:38', '2023-06-01 18:32:38'),
(9, 3, 8, 2, 'Mentor Pengamanan Informasi', 'mentorpengamanan@diskominfosan.ac.id', 'OJl6oFxBtq7qzj+CD8FZ/BJUW6BMzax6RZ9AYKV/ybsWWxf3l+s9a+qCWekMTTOZoXQ9WLqnM/UmwYCY8OyQTe/N4vRyeD6+Uq0hhR937lmYdPhfy+tIIbs=', '', '2023-06-01 18:34:23', '2023-06-01 18:34:23', '2023-06-01 18:34:23'),
(10, 3, 9, 2, 'Mentor Pengawasan Pengendalian Persandian Dan Telematika', 'mentorpengawasan@diskominfosan.ac.id', '4uu1h2RG11uUNDolEBorXmKSLRdhurz5NAdZrC8WJEbvAA75bgyzHGvQWoOz0Guu1wF9BYXBoBAw5rUb8HT0RUx8ihRuf6vvOa1iRLspE6nhxvN5YeLYo60=', '', '2023-06-01 18:39:12', '2023-06-01 18:39:12', '2023-06-01 18:39:12'),
(11, 4, 10, 2, 'Mentor Layanan Informasi Dan Pengaduan', 'mentorlayanan@diskominfosan.ac.id', 'MNjW9csmbhs3bRuTbj1fuQ5ZfUaEsRw5DzkqvfDFhTomXQqU86t14dlCeACgJeJpFUa70aJ5rfAlF17d9rPXFBIyvl2THdBTjPKCUgFbGMmXXbHHRagtesE=', '', '2023-06-01 18:40:25', '2023-06-01 18:40:25', '2023-06-01 18:40:25'),
(12, 4, 11, 2, 'Mentor Humas Dan Publikasi', 'mentorhumas@diskominfosan.ac.id', 'UkzRHYN7thNs7jcgNZsVxzDvZYaAKqlGhRrJrIxx7NvTdaNAUyptvVploXcSbEBTo2z1SkD3Ve6A529XdM7oIn/vdoQ9/julloJH9fCsviO8nkPH8bfeFYQ=', '', '2023-06-01 18:41:20', '2023-06-01 18:41:20', '2023-06-01 18:41:20'),
(13, 4, 12, 2, 'Mentor Pengelolaan Informasi', 'mentorpengelolaan@diskominfosan.ac.id', '3IgUvF7NS5SbeHGS2qE6KMlq5fJ96Q+48MuoFeNnHurdsT/nntzsgYDQn9UPKuUz4sKRVHliWY1yG99lemY3wkfrIpLgtRjwGoz2M1Wg8YRI2gH/QB2bdZU=', '', '2023-06-01 18:43:25', '2023-06-01 18:43:25', '2023-06-01 18:43:25'),
(14, 1, 3, 2, 'mentortesting1', 'mentortes@diskominfosan.ac.id', 'D7XeGowjTQhe2EFhrubmMEw0BgS6paFRx5WtUGisbL9Rjod2wVIzzq25c+1M7iwrtlA7XnAh60dMEyWn68I1Ui5ULpf5y4qIvxKnd+4YUkW0uRnROJcyCks=', '', '2023-06-02 13:08:34', '2023-06-02 13:08:34', '2023-06-07 10:56:25'),
(16, 1, 4, 3, 'BEKTI WINDU PRASTIWI', 'bektiwindu47@gmail.com', '9gUAdPBkPde1ol5qEmrKTtxAwKPMpqIN/5D9fjFa+Vc5VrN3asRLEFgqSahvV3ipeD/D4CHY4ylVLYH/UNHcw8k0PCrDFG9BBJKMZX0q4RkQ+ZBnMZjC6dXd', '', '2023-06-07 13:37:50', '2023-06-07 13:37:50', '2023-06-07 13:58:01'),
(17, 1, 2, 3, 'BIMO', 'bimo@gmail.com', 'w33xJxywMsq8+bJ8XGwyAmHA7LPYHB/YNwlf1YTqIBfqLx6Op36pMtqpUr/esCfwjbK8pODL79Nh44HMYlPD+ljfjXN6CYfQxgEZ2RkA1zq7N490B46BDQ==', '', '2023-07-24 12:11:24', '2023-07-24 12:11:24', '2023-07-24 12:16:40'),
(18, 1, 2, 3, 'SARA', 'sara@gmail.com', 'jqKVtD6R6g/Sy3LJpF3dIIXJfLfKN/oEaU+ShNuzTsEFlnmO9sJQ4KHqJ07vV9yZyWBjEBReetwsX+DpsobtoRwNJYzEu1AaSuQaELWZZCiqUfvm1I0u5A==', '', '2023-07-24 12:23:24', '2023-07-24 12:23:24', '2023-07-24 12:27:59'),
(19, 1, 2, 3, 'ADINDA', 'adinda@gmail.com', 'pg6Yrhem45P4lTJBktoHEV2t1yR6xL+mk1I4NaJlpY1bGC9rnpsp1JqhK1QMNKWJbUPTbuSUkyrz01gVH6a4DJB1Y+YTivXXDlR1pCg8tRKyag1KD/kMghzf', '', '2023-07-24 12:38:07', '2023-07-24 12:38:07', '2023-07-24 12:43:37'),
(20, 1, 2, 3, 'ANTO', 'anto@gmail.com', 'pWJsTBXGz+KbsdA4x/Gqx1GJlzll5Br0K3ORdaZ5TUY6PDL5J9IdkB0M8izLAL0e3k8bvBQbv/Jh5W2H2hJYSM3zG+weKVZ7zb3YLKVpZsvpU6sVKcCd2w==', '', '2023-07-24 14:31:45', '2023-07-24 14:31:45', '2023-07-24 14:34:32'),
(21, 1, 13, 3, 'DIMAS', 'dimaspras@gmail.com', '7HmlG3ERY4KxIF9NY5vU9JzXOU5KTcyS0lVObOKaJ88I1h1Dcm0ij7bBDNPyDuLUxFaG7prjJGn+/vg0n1/6oDUdwA3uS9y4lOrP+U0EaY+tOJWLRR2iqQU=', '', '2023-07-24 14:40:26', '2023-07-24 14:40:26', '2023-07-24 14:45:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_role`
--

CREATE TABLE `tbl_user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_role`
--

INSERT INTO `tbl_user_role` (`id`, `role`) VALUES
(1, 'Superadmin'),
(2, 'Mentor'),
(3, 'Mahasiswa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_informasi`
--
ALTER TABLE `tbl_informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_id` (`pendaftaran_id`);

--
-- Indeks untuk tabel `tbl_kampus`
--
ALTER TABLE `tbl_kampus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fakultas_id` (`bidang_id`);

--
-- Indeks untuk tabel `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_id` (`pendaftaran_id`);

--
-- Indeks untuk tabel `tbl_pendaftaran`
--
ALTER TABLE `tbl_pendaftaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_id` (`user_id`);

--
-- Indeks untuk tabel `tbl_progresmagang`
--
ALTER TABLE `tbl_progresmagang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indeks untuk tabel `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_bidang`
--
ALTER TABLE `tbl_bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_informasi`
--
ALTER TABLE `tbl_informasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tbl_kampus`
--
ALTER TABLE `tbl_kampus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pendaftaran`
--
ALTER TABLE `tbl_pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_progresmagang`
--
ALTER TABLE `tbl_progresmagang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_jadwal`
--
ALTER TABLE `tbl_jadwal`
  ADD CONSTRAINT `tbl_jadwal_ibfk_1` FOREIGN KEY (`pendaftaran_id`) REFERENCES `tbl_pendaftaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD CONSTRAINT `tbl_kategori_ibfk_1` FOREIGN KEY (`bidang_id`) REFERENCES `tbl_bidang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  ADD CONSTRAINT `tbl_laporan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD CONSTRAINT `tbl_nilai_ibfk_1` FOREIGN KEY (`pendaftaran_id`) REFERENCES `tbl_pendaftaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_pendaftaran`
--
ALTER TABLE `tbl_pendaftaran`
  ADD CONSTRAINT `tbl_pendaftaran_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_progresmagang`
--
ALTER TABLE `tbl_progresmagang`
  ADD CONSTRAINT `tbl_progresmagang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tbl_user_role` (`id`);

--
-- Ketidakleluasaan untuk tabel `tbl_user_role`
--
ALTER TABLE `tbl_user_role`
  ADD CONSTRAINT `tbl_user_role_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
