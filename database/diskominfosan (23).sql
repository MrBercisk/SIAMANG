-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2023 pada 09.10
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
(1, 17, 4, 'tes', '2023-06-07 04:39:50', 1),
(2, 18, 4, 'Halo', '2023-06-07 07:04:34', 1),
(3, 2, 4, 'Halo', '2023-06-07 07:05:34', 1),
(4, 17, 4, 'halo', '2023-06-11 04:38:40', 1),
(5, 2, 4, 'Halo', '2023-06-11 04:41:17', 1),
(6, 2, 4, 'halo', '2023-06-11 04:44:28', 1),
(7, 17, 4, 'Tes', '2023-06-11 04:44:38', 1),
(8, 2, 4, 'halo', '2023-06-11 04:48:26', 1),
(9, 17, 4, 'tes', '2023-06-11 04:49:27', 1);

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
(1, '2023-06-14', '2023-06-16', '2023-06-14');

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
  `jam_bimbingan` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jadwal`
--

INSERT INTO `tbl_jadwal` (`id`, `pendaftaran_id`, `tanggal_mulai`, `tanggal_selesai`, `tanggal_bimbingan`, `jam_bimbingan`) VALUES
(7, 1, '2023-06-01', '2023-08-01', '2023-06-07', '08:30:00'),
(8, 2, '2023-04-01', '2023-06-01', '2023-06-07', '08:30:00');

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
(8, 'AMIKOM');

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
(2, 1, 'Multimedia', 'Jurusan Multimedia', 'Membuat Video Animasi', ''),
(3, 1, 'Analisis Data', 'Jurusan Sistem Informasi Atau Teknik Informatika, Dapat Meng', 'Menganalisa Sistem ', ''),
(4, 1, 'Aplikasi', 'Blog Jss', 'Aplikasi', 'Jss'),
(5, 2, 'Pengelola Server', '', '', ''),
(6, 2, 'Jaringan', '', '', ''),
(7, 3, 'Operasional Persandian Dan Telekomunikasi', '', '', ''),
(8, 3, 'Pengamanan Informasi', '', '', ''),
(9, 3, 'Pengawasan Pengendalian Persandian Dan Telematika', '', '', ''),
(10, 4, 'Layanan Informasi Dan Pengaduan', '', '', ''),
(11, 4, 'Humas Dan Publikasi', '', '', ''),
(12, 4, 'Pengelolaan Informasi', '', '', '');

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
(1, 17, 'Tes', 'http://elearning.bsi.ac.id/login', '17_BIMO SATRIO PUTRA PRADANA_Laporan_Magang.pdf', '', '2023-06-11 04:36:06', '2023-06-11 04:36:06');

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
  `tanda_tangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_nilai`
--

INSERT INTO `tbl_nilai` (`id`, `pendaftaran_id`, `ketepatan_waktu`, `tanggung_jawab`, `kehadiran`, `kemampuan_kerja`, `kualitas_kerja`, `kerjasama`, `inisiatif`, `rasa_percaya`, `penampilan`, `patuh_aturan_pkl`, `rata_rata`, `tanda_tangan`) VALUES
(6, 1, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZAAAADICAYAAADGFbfiAAAAAXNSR0IArs4c6QAAIABJREFUeF7tnQW0LEe1hj8kD3cJrsHdg7tDcA8S3N0t6MMJDg+Cewju+vDgwf3hHiS4w1sfqV50hnPPmenp7mn591pZJ/eerqpdX83tPVW15QhEQiAEQiAEQqABgSM0aJMmIRACIRACIUAMSD4EIRACIRACjQjEgDTClkYhEAIhEAIxIPkMhEAIhEAINCIQA9IIWxqFQAiEQAjEgOQzEAIhEAIh0IhADEgjbGkUAiEQAiEQA5LPQAiEQAiEQCMCMSCNsKVRCIRACIRADEg+AyEQAiEQAo0IxIA0wpZGIRACIRACMSD5DEyJwGmA70xpQplLCAyZQAzIkFcnui1LYA/gYOCYwIuAfZZtmOdCIASaE4gBac4uLYdD4KfAiWvqnDY7keEsTjSZLoEYkOmu7VxmthvwZzhcYtBbAC+eC4DMMwQ2RSAGZFPkM25bBDQgvwf8WckdgOe0NUD6CYEQ2JpADEg+GVMgcAhwwtpEHgo8cgoTyxxCYMgEYkCGvDrRbVkCHwMuVHv4ecBtl22c50IgBJoRiAFpxi2thkXgjcBeNZUOBK43LBWjTQhMj0AMyPTWdI4zeiVww9rEPwJcbI4gMucQ6JNADEiftDNWVwT2A+5e6/z7wKm6Giz9hkAIHEYgBiSfhCkQuD/wmNpE/gAcYwoTyxxCYMgEYkCGvDrRbVkCtwSeX3v4H8WA/GnZDvJcCITA6gRiQFZnlhbDI3BF4B0Lah0X+PXwVI1GITAdAjEg01nLOc/kfMCnFgCcDPjxnKFk7iHQNYEYkK4Jp/8+CBwHOHRhoFsBL+hj8IwRAnMlEAMy15Wf1rz9HP8K0JBUYiS6EemREAiBjgjEgHQENt32TuAgYM/aqJ8BPNqKhEAIdEQgBqQjsOm2dwJ6YemNVZd8vntfhgw4JwL5Bzan1Z72XO8NPGFhitcETHMSCYEQ6IBADEgHUNPlRghcBXjrwshPB+66EW0yaAjMgEAMyAwWeSZTNHXJdxfm6u7DXUgkBEKgAwIxIB1ATZcbIXCkEvdxooXRLw28fyMaZdAQmDiBGJCJL/DMpvd24EplztZJ3x24H/D4mXHIdEOgFwIxIL1gziA9EXgScM8y1peAswGvBa7b0/gZJgRmRSAGZFbLPfnJaiheU2b5euBawC+BM5SfkweQCYZAnwRiQPqknbG6JmBd9J8A3oeY4v2xZcDcg3RNPv3PkkAMyCyX/T8mfSngjMDXgc9ukVdqLJSODPy8pDS5PXCbEo3+FOAeY5lE9AyBsRCIARnLSrWjpx5KGovLAZ8G7gica4uufeH+AnhUO8P22ouuvLr0PhH4BvA/wA+AU/aqRQYLgRkQiAGZwSIDxy8BdRqMRTfX7Qjo/vrwkbnBvg/wyOpA4JnA/5YJOo+HzWO5M8sQ6IdADEg/nDc5ymmAFwOXWEMJa45X3k1rdNNL02cDHl8551sABwDXAz4KXLQXDTJICMyEQAzItBfa4ypTeeiNtCgfKkc7fgY85vltOda6S7k7OMdCg+vXPJyGTO3J5b7j8+V47rZlfuqcz/uQVy66jY5A/kGNbsmWVvjCwEuAPWotfgP4gn0WcMgOPZ0buNnC5fN5gYOX1mAzD2oAnwZYD/3owD+B7wOnKLsod1OREAiBFgjEgLQAcWBdeMdxJ2DfBb2MjzA24pUr6GtfHy4eWjZ7HuA3+iHLXrUMvCcBjEj37kMexoScYMjKR7cQGBOBGJAxrdZyur6wnP3Xn9Z4eJRljMSq4k7G+4NKfAH7Ih6q6FWmK7JyTuALgJl6TWdiZHpiQoa6ctFrdARiQEa3ZNsq7GWxl8Z1eRGwz5rTfAtw1dKHx1ovXbO/LpufuOw6HOMKwLvLYF8FzlS8s+QUCYEQWJNADMiaAAfU3LuOTwDHq+nUlutq/SK6DYPUJbajAb8DjgjsDby8DCYLa6T/ETh9ydzbpR7pOwQmTyAGZDpLXLmrVjNq02tKb64qnsLYEI+BhizVpfmDgUcXRTUaHm0dE6j//ZDnEd1CYNAEYkAGvTxLK3dl4G21p+9TIrGX7mCHB8dmQA4C9gQWd0vvLMda3y67ED20IiEQAg0JxIA0BDegZq7hx4ALFp28MHf30aaMzYCYwv3awHtL2paKxR2KC7N/ltcn24SUvkJgbgRiQMa/4hcBPlKbRldeRtW39ceVTLdDJmcur7uV5JBenFfiMdY3yx+eD9x6yJOIbiEwdAIxIENfoZ31exNw9fKYgYM337lJoycqA/Iu4IqNeuivkWlXLC7lhbnBhHXxDueSJdBQjy0j8CMhEAINCMSANIA2oCbXAN5Q9PlhOZb5UQf6nRWwwp8ydC8sdawXlqqCCSssuiGbJ0txB+JOJBICIdCAQAxIA2gDalJdFv8VeGT5ryv16hfOQ//cnAf4TAGxmH7lGMB3AItPfQq4EPCPrqCl3xCYMoGhvwimzH7duXls5fGV4gvRY5nvrdvpNu3HZEBOClQ7MTkZCFmXRwD3A/6rXLJ72R4JgRBYkUAMyIrABvL4bsDXgNMCfwB8IXq53aXUDUhXF/Vt6X8U4NeAP+8OPHWh48sD3uUo5ga7cVsDp58QmBOBGJBxrvaNgFcU1b8CmK/KF2aXUs+xdf6S+r3L8dbt+1vFwJp9+F5bdGZWYTMO/wU4C+DzkRAIgRUIxICsAGsgjx4J+HItQ651v/fvQTdrhlSZeIe+AxGHx1KXqRWWWkTkBbrZhRU9tu7dA8MMEQKTIhADMr7lrKcrt2iSQX6/6mEa9R2I6eKtKTJk0VtMl+YPFEaLuppVWEOsK691Us6c/FhDXs7oNkQCMSBDXJXtdXprSU/+N8DiSc/paQrmwtJYKWPYgTyk3A39ADjlLhg9oDxzZMDnH9UTywwTApMgEAMyrmW0qp4eVx5jWaPDF7ln+H3I2AzILUuMx++B4wB/3wLSyUq9kOOXqoXWEuljN9fHemWMEOicQAxI54hbHcAkiRZGMu7Dc3u/QfclY3LjlYluzUadG+PhcdWhuwCl95qeWrr0tp2Esq+1yTghsBECMSAbwd54UHcdelx5Zm8AnEWS+pAzFrdhx2qrxkjXeru7MDpf2c5rbPdy91H9W8i/ia5XJv1PhkD+sYxnKY8LHAJ4Xu/lr+VZ+5L71uJMngvcrq+B1xjHWBlzYXnct1UwYb3rewC6+47JQK6BJk1DoB0CMSDtcOyjF0vKVhHVRlF7lNWX1F14vSfQ+2sMYuZdM/B6H6IX2a5E54CXAScvD5hjrIryH8M8o2MIbIRADMhGsDca9P7AY0pLcz1ZXa8vMWfU+UrwoMdBY5F3lMzBViW0CuF2Uq8nv53n1ljmHj1DoHMCMSCdI25tAHcf7kJ+Cpjrqa9qevuVS2Yn0kWxqtYAbdGRgYIGDL4AuNUSA1V3TD7qvE0LHwmBENgFgRiQcXw09BD6OXCsEnVu9HlfUtUXd7yxfV6MLn9CSXl/rSWA1Ssv+vhdgacv0S6PhMAsCYzthTDLRQLOCXyuTN5dSL3+eZdMDgA82lF0iTXuZExSHUt5Z+PdzTJSP8oao9FcZo55JgRaIRAD0grGxp2cpgQG7tTB7YFnF7dU2xiF3rU8E7hjGUTvL1N+jE28t/H+5meA7rrLysOAfcvDY/E6W3ZueS4EWiMQA9IaypU6ckfhN/rjlRrdptF41TY9WEHPSnp91fG+88LRjS7Dug6PTeT7yxJ4qRu0qe+XkT2Ab9QeHEPqlmXmlWdCoFUCMSCt4ly6s8qrqd7g5SXtuJfki2L6klOXHYE7kS7FexYDFSsZ+8vzF4CpSkwDUwUWLsOvfh8Sr6xliOWZ2RGIAel/yf1WbDGoE+1i6CsA7679zpeftSr+XKLQu6xbUa99rgqm+dB9eMzysRK1b0JFDcEq8rSSsNI2xt0YfxMJgRAoBGJA+v8oXG7BQFi7+81lh3Fd4Jil1kd1hHIVwAy8/tmUIl3JogeSO6K9uxqsx36tOHjDJaLRt1JJ4+0OppKxHuX1iDtDzYlADEj/q21RJiO7K6kXM6ruOozx8IX+wZJiw1QbXbqULu48NGjWHZmCPLbsHIwDMR5kVamnORmjJ9qq883zIbA0gRiQpVG19mDdu8lOr18C9KoBqhee2WMtXWv0uS9463a/tjUt/t1R/ZjGvx1bsOBOSCoPtgcB/73Tw1v83rsTd4A6PihmQHaNIiEwewIxIP1/BOp1NRx9q0tq8zLdpAQPWsvCeucXq2XEbUvrapyqv6kZD+flndI7AQ3l3RqCq4xQ1dygxDc07CvNQmAyBGJA+l/KZQzIUUsqDV9cil5Yp2sxfcnikZVjjCVN+6orVrnkHlgLily1D5//Yi0Dco6ymhBMm8kRiAHpf0nrtcV/Cxx7GxUqDyIfMSjOC/d1ZdF4fAkw7sOX4hTliKVq40HAxdeYoEeIOhZUsnj0uEbXaRoC4yQQA9L/utWjnI0HucA2KnwEuEj5/U9KLfSD11DZxIImGKxkLlHWerBZF8Rd3DriLuY6pQN3haddp7O0DYGxE4gB6X8F60dYLwL22YUKFo4yitrAPs/b9YoyGtxSrf79qrJ4WT7VI6utuLjrM8eVLNfJYnxZ4D21AW5a6oisuhZ5PgQmQSAGpP9lNBracqvKdpfWxhx47m5Nb9O3m87d3UqTdCb1glA7jds/ke5HfBZgBuMTFoeEdUasfwHIXcg6JNN29ARiQPpfwnoaE0vDeoy0lRhUqIH5dKnpfQzgC+XYxGOU1y2pev3IzCZzPLv3/kKPMw23R4HriMGVLy0dmPLFS3qTTUZCYHYEYkD6X3LTaVSlUz8JXHAXKjwCMMmi357vVJ7Rldc0J9b6PjfwvR3UX9x5TCW6fNVV8+jJFPgXaqmSY/0YbE5Hgatyz/MTJxAD0v8CW5viHGVY7zJOsAsVXg9cc4vANQsc6TW101HWkwGjqCuZ84uuqqdytRIUuO6q1w3z/uV4bN0+0z4ERkcgBqT/JXsO4NFVJWfeRYCgNc8tgmQep1fXnrcux3uBs5eLddOO1MXIab2F/LYd43EYASs6mtPqgS1VGPQIUcaKx1cmajTZZSQEZkUgBqT/5fbF73GKLx3FXcJTtlDDGBETK3pUVVUjrB7TE8s7EMvNeqz1O8DgQ8/nLeN6phiP/yDq3ZNpZPTIWlcWY2l059WtNxICsyIQA7KZ5bZCXpXOXRfdxXrdR6/V5PC5X22hpnVBTHeyX/HWuiVwpdpzfjM2IeMYC0F1sSoaD41IGwZE/eredHN0TOhijdLnyAjEgGxmwaw+eIMytMbBe5D6xazFo/xGawU9dyFbxS64du48jgYsrqOeXcaYGH0dOYyAXlju0vRuW1d0q/5RrZMYkHWJpv0oCcSAbGbZTOpXP7byWMuUIpVU+Zu+UjLx1rU0pcnNgSsXF9LFGeilZQLByOEJXLUkrvSIb12xLv23a53kCGtdomk/SgIxIJtZtvMDuvBW4rfieqp2L8+9RH9fiUL/e3HZvcyCZ1Vd+9+XqPZ3AN6fRA5PwKzHpnLx2G9dWYytyb+jdYmm/SgJ5IO/mWUzgaIuvOZnUjyf1zW3ksrLR8NRPbOMpubNyrHV1qSs7KjnlPdL60oMyLoE034SBGJANreMHy01ztVAt1xL3VbihbhxHsuI0epGRr+p7FJ0CzbQMHJ4AqcCPlyYewG+jphX64DSgUePHkFGQmB2BGJANrfkjwPuW4b/a/lm/Lfy5/sAj99BNV9cJkisUqFUwW2WbbV8a+TwBIwFMRHitUuhrnX43L14v9nHN4EzrNNZ2obAWAnEgGxu5S4PvKs2/J7Ax8ufNSwamK3EwEF3HO486uK3YL9hW8HQIMJPbG5qgxzZuiDfKoGZ1llZR+4JWMte0U3axJeREJgdgRiQzS25LqVfBXTZVXwhVR5CjyrlV/3W7H+KmV9NY7JdEkUjrR9dLuh3lWNrczPe/Mi+7M0t9ow1Val7YaUuyJow03y8BGJANrt2HlN5XKUY06Ex8XL9CYDHJBcGflziF/5vCVX9lv2hUoRqMQXKEs0n/8gTS1XHV6w5U4M7DQatDLseXpEQmB2BGJDNLrnfZD1Drzyt9O4x6aEXtF7UWv/D6OlVRG+jNxbDY//WE4kcRsDdmazv3wIQ08LvXgI+U5mwBaDpYnwEYkA2v2YajIfW1DAZojsQAwUtwbpVGpPttPYFqYeXR1h3AEzeGDmMgHcXcnF3to6csZYAcy5lgdfhlbYTJRADsvmFtVCUsRtVincDDM3s6nGWSfs82lpVzlsKUX0NOMuaZVxXHXvIz1tX5Y4tXHrr8FDF25hRoJ42f8jzj24h0CqBGJBWcTbu7OLAi0u1QTsxB5YBb16g6+LbRKrSq/HI+je9toIJq0BCd4fHb7I4aRMCUyAQAzKcVfQ83WJT1vtQvDw3J5bGpIn4bVtvo7lWIdyK2ekBDasFpg5tANWkiebUullpm8j/BhDTZDoEYkCGtZbW7DZW4ShFLd1yvQ+pAgxX0dbdi8GGGiRL6DY5CltlvDE8a4yMrrx6t+1UDrg+n0sAdwVMMWMSRf/dmL/MevWREJgtgRiQ4S29KTe+W1PL2A9fXk3EmiG3B24MvLJJBxNs83XgRku8/E2Tb9ZkveG8U9KIvwSQ6aqecRPEmCmFwH/WkQiTzRNwx/BTwOy6XrAr7krMj/WBFdUz2t2CVcaG1ItNrdjNpB73mNCgTe+cthLvNDS6uvwq5hV7KmAMiWVxIyEQAoVAdiDD+yjojeVL7i3lgtZz9kosEuXLzFTvy4guvV8o1Q8tc2uQ4tzlrSVlzCMWQGisvRw3gPPIJb7j9YBZAcJt7p+azH9LAjEgw/tgeN7uTsP4DV9mTwZuW15qlbYecfkiPLgYm+3yXhmncJtyfr9dGpThkehGI5NO+rmXqWLxLY/4LNKlmJrEHYpJKZs6MHSjeXoNgYERiAEZ2IIAe5VI8scCDyjqXQ3Yu5zHm65kKzGRokkCNT5e9FYVDs9dzuythbFuAN3waK2u0b7A1UtKEw1HdUxo8KVG211HHA5W55oWMyQQAzK8RddQmG3XdBuLGXkNCvT3Fyv/bWVMrJ/uuho/YknczwFWMjSu5BZl52KhqjmIgZi/AUzpIgNzVl2qNnHZWEfFGvV6Z0VCIARWIBADsgKsnh41/YgZY43j8OeuRFdfI6KPV9JzWCbXeul+o67cgHfV1gv6twEaICOqvbj3RWuMxAmBv9Si142K1+DoheRPc2v9CbAo06ppVrpAqIuyOukCbZoSOaizQYNVpuNq3B8AJqV0V2YsyCquvF3onj5DYNQEYkCGt3xVsSJ3GgYBrip6EZ2nGBNrq3spX6VJWbWv7Z7XmPyo7Gz8f7/NW1jJnY6XzrsBxyo1SiqDpMGq/jNQ0qM2L/r9uyqhpDso/1zFvvjT32kULll2VxqMixaD5nxNjV+XtxcDaFoY9foi8I3ygEbmI8Bxi6dbm0zSVwjMikAMyPCW+zHl+KrN2I1jAn77NrhQ91RfnhqZk5Z8W+tQ+HW5zPengXoaLXdFXYuuyR7T6UCgcTGrsYZiJw81k1VqTEyI+P2ulUz/ITBlAjEgw1vd/Yr31TXK+XxbGj4PuDVwxYVKiPX+TwmY7qMSU5Zb9KpNWRzDvt2pePy2ldR1cKej4VhHPN4zzsY7kc+s01HahsDcCcSADO8TYJyHkeeXA97bono3KcFzzwdu12K/Y+xKV12PCg2yjIRACDQkEAPSEFyHzaq4jcsC72txHC+bfXF6b7F4udziMKPo6oPAa0tQ5igUjpIhMEQCMSDDW5XqqMkLY190bYlr7f2A3kdm+V2mRG5bYw+tH/OCaUyrOJuh6Rd9QmAUBGJAhrdMuu7qyquXkcFtbUp1PGY8yK5yQbU53lD70rtN764q+nyoekavEBg0gRiQ4S2PaTQsvWqMx8dbVs/Msr48vQfRSM1V9ETTC81YkUgIhEBDAjEgDcF12Kxy4+1iB3KB4vZqfITxEHMVgzR1VDDBZCQEQqAhgRiQhuA6bFYZEPM1mZG3TTEO5LclMM96F03L5bap0yb6ujZgZmPjYQxKjIRACDQgEAPSAFrHTfxm7F2FtTze08FY5nwyp5ZR4wbfzVGMOTHxZKLR57j6mXNrBGJAWkPZWkcG++mJ1TSVyU6KGPtgkKKJBd+/08MT/b0R+Loznxn42kTnmGmFQOcEYkA6R7zyANcHXl2q4lm7om15GnCXkpl3rp5YFozy+G7ORrTtz1X6myGBGJDhLbpHV+8C7lPKqLatYXXHcl/gCW13PqL+LMqlt5sBhZEQCIEGBGJAGkDruEnlKfVI4KEdjKUH0jOAB9fqfncwzOC7tKKj6eutdR4JgRBoQCAGpAG0jpucrkSJP724mrY9nFUJjcS2VO692u58RP2ZMkaPtDkzGNFyRdUhEogBGd6qWBDKNCNWyqvqdreppcFzfvu25vet2ux4ZH09qHiiGZUfCYEQaEAgBqQBtB6aeMFrbW4v1NuWi5SCSp79X7ftzkfUn8b5BoBJKyMhEAINCMSANIDWQxNzYFnV72odjKXrqrXSTRVvyvi5inmw3IVYWCoSAiHQgEAMSANoPTSxXrlBbu4W2pYTAD8H5p7OxFQu7wTkkWj0tj9l6W8WBGJAhrnMHygp163h0baYwuQPwNdnngvKYEJL25648Gibc/oLgckTiAEZ5hLrIXSlUvjpny2raD6sQwHLw1pKdq5yVOCQkvX4S3OFkHmHwDoEYkDWodddW+uiW3ZWj6y2DYha/ww4Uenf3chcRW83U8cYDxIJgRBYkUAMyIrAenr8scD9gN3Ly77tYfXwuibgEZk5oeYqVmg0Gt8aKZEQCIEVCcSArAisp8fvUQL9zlo8ptoe1jsWL5HPD8z5+OYlwBeBx7cNOP2FwBwIxIAMc5VvCvhyu1ApANW2lnp5XRm4DvC6tjsfUX/PBP4CaLAjIRACKxKIAVkRWE+P7wW8EbgC8O4OxnxziTHxmGzO376NAzk3YKnfSAiEwIoEYkBWBNbT41W0+I1L3qq2h30ZcJOSSNCsv3MVPd2MSLdCYSQEQmBFAjEgKwLr6XGjoy10ZHVCkyq2La8AblSOyYzInqucE9Bles+5Asi8Q2AdAjEg69Drru3xSiqTRwEP6WAYX5q3STqTf7kyfxDQkMy1PnwHH690ORcCMSDDXGkr5v25ZMz1Rd+2mIl3H+A7wGnb7nxE/fn5NyLfHcgvRqR3VA2BQRCIARnEMmyphEFuJj3sIqHic0qgoh5IRxkugl40MyeYd02mNYmEQAisQCAGZAVYPT9qrMbZS7K/tod+XonAtl+TCZr5d67yBuBxwEFzBZB5h0BTAjEgTcl13656yZ8C+GHLw1nS1tK2ihUQv91y/2Pqzvug9wAHjEnp6BoCQyAQAzKEVdhahyoa3ZgQ4zbalGcDty8dngcwpcdcZd9y/6FRjYRACKxAIAZkBVg9P3phwMJST+kgUrq+A7lYqVDY8/QGM5z3H0b8320wGkWREBgJgRiQ4S7UbiXtupe7Rku3KS8CqviPqwKmNpmrGLR5f8CdXiQEQmAFAjEgK8DawKOvLnXR287K+0rghmU+1wDetIG5DWVIC0sZsPmAoSgUPUJgLARiQIa9UrcA9i/HKyb+a0sOLIkU7e8qwNvb6niE/Ri06T3I3Ueoe1QOgY0SiAHZKP4dB9+j1C5/K7D3jk8v/4BeR5ctj8/dgIjBY0Kj0f+4PMI8GQIhEAMy/M/AT4Cjl4jxtqKlPwxctEzdn17Wz1msSKhXmvnHIiEQAksSiAFZEtQGH3sScM9SQdAU722IRaQsVqXEgMC9Svr8b7YBN32EwFwIxIAMf6XPBnweeFVJwd6Gxt8FTlU6MvPv3NN4XBf4aqlO2Abf9BECsyAQAzL8ZT5SyZp7JsCX/W9bUPlQ4Diln7nXRRfDHYD/Ap7aAtt0EQKzIRADMo6ltibInQELIL1zTZV9UWqE/KnohaRBiYRACITASgRiQFbCtbGHrwi8A3gpcLM1tTg28OvSx99KNt5/rNlnmodACMyQQAzIeBZdDyFrd5xkzey5xwcOAY4I/Bz+VVQpEgIhEAIrE4gBWRnZxhpYmfARgDXMn7iGFh5ZaTg0IBZT8m4lEgIhEAIrE4gBWRnZxhqYdv3LgIWmrBPyz4aanKuWfdeCVZU7b8Pu0iwEQmCuBGJAxrXy7wIuD6yTANH29qN8CLjEuBBE2xAIgaEQiAEZykosp4eJD19fqudVkeTLtfz3U9WFvH/zQuCWq3aQ50MgBEJAAjEg4/scVHmsmuawshJhVTzp08D5x4cgGodACAyBQAzIEFZhNR2uA5jm3buQJhfgBs09qwxpksarrTZ8ng6BEAiBwwjEgIzvk2AA4McAS9GaI2u/Fadg4sBLlTbvBy69Yvs8HgIhEAIxICP+DJwFOLhEkOuRpVvuslL33ooBWZZanguBEPgPAtmBjPdDUZWl9Tirqi6402wMGvxZ7SH72GenRvl9CIRACGxFIAZkvJ8LjcHnAEuyeiT1gSWmYoVDPa8quR3w3CXa5ZEQCIEQyA5kYp8BDcCzS9VC4zn+vMP8Fg2IHlh6YkVCIARCYGUC2YGsjGxQDXYDdOvVeBjPUd9dbKVo/QLd32f9B7WcUSYExkUgL5BxrddW2u4JWKLW0rd6ZpkocVeSC/Txr3dmEAKDIRADMpilWEuRlwA3BR4DPHAXPT0M2Lf2u4cD/l0kBEIgBBoRiAFphG1wjbzLeAuwO3BK4AdbaPg64Fq1v3e38tnBzSQKhUAIjIZADMholmpHRatdyK52Fr8s1Qft6Pu1mug7dpwHQiAEQmArAjEg0/lcmJb9S2U6i+uqm68X6JW4Q3GnEgmBEAiBxgRiQBqjG2TDlwE3ARZ3IV8EzlbT+DXA9Qc5gygVAiEwGgIxIKNZqqUUvRWwf3lSY6LM4l/HAAABeUlEQVRH1rWBUy+0NqV7VRNkqY7zUAiEQAgsEogBmd5nYnG3sTjD7D6mt+aZUQhshEAMyEawdzqoQYXbpTXJ7qNT/Ok8BOZDIAZkmmt9YcDCUccBLgCcADgy8HJg72lOObMKgRDom0AMSN/ENzfeyYEfbm74jBwCITA1AjEgU1vRzCcEQiAEeiIQA9IT6AwTAiEQAlMjEAMytRXNfEIgBEKgJwIxID2BzjAhEAIhMDUCMSBTW9HMJwRCIAR6IhAD0hPoDBMCIRACUyMQAzK1Fc18QiAEQqAnAjEgPYHOMCEQAiEwNQIxIFNb0cwnBEIgBHoiEAPSE+gMEwIhEAJTIxADMrUVzXxCIARCoCcCMSA9gc4wIRACITA1AjEgU1vRzCcEQiAEeiIQA9IT6AwTAiEQAlMjEAMytRXNfEIgBEKgJwIxID2BzjAhEAIhMDUCMSBTW9HMJwRCIAR6IhAD0hPoDBMCIRACUyMQAzK1Fc18QiAEQqAnAv8PvaCjBV+yWt8AAAAASUVORK5CYII=');

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
(1, 17, 1, 4, 202212001, 'BIMO SATRIO PUTRA PRADANA', '12201068', 'Kerja Praktek', '081291204919', 'DS. Geparang RT 001 RW 001 Geparang Purwodadi', 'UBSI', 'Sistem Informasi', 'Fullstack Developer', 'Codeigniter 4', 'Perancangan SIAKAD', '1685692018_c37161074fd220592cd1.pdf', 'Kelompok', 'SARA PUJA KESUMA', 'DARMANTO', '1685692018_0c3b40abf17ad6100e16.mp4', '1685692018_92586f9181320d5f7b70.jpg', '1685692018_b59935441cac6a2cecba.pdf', '1685692018_5da4be6ce06557b60a68.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-06-02', 'Selesai', 'Diterima', '', '2023-06-02 14:34:09', '2023-06-02 15:03:31'),
(2, 18, 1, 4, 202212002, 'SARA PUJA KESUMA', '12201505', 'Kerja Praktek', '082242249295', 'Gamping Sleman Yogyakarta', 'UBSI', 'Sistem Informasi', 'Front End Developer', 'Codeigniter', 'UI UX design interface SIAMANG', '1686121158_6021b9489b0192006793.pdf', 'Individu', '', '', '1686121158_28978978b659f9292e83.mp4', '1686121379_553cc9d793b463953fb1.jpg', '1686121158_aaa1db3d2e524da66af2.pdf', '1686121158_30c446c2ff211fd79941.pdf', 'Selesai', 'Selesai', 'Selesai', '2023-06-07', 'Selesai', 'Diterima', '', '2023-06-07 13:41:36', '2023-06-07 14:02:59'),
(4, 20, 0, 0, 202212003, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Belum', 'Belum', 'Belum', '0000-00-00', 'Belum Selesai', '', '', '2023-06-14 09:53:14', '2023-06-14 09:53:14');

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
(1, 18, '2023-06-07', 'Tes', '18_SARA PUJA KESUMA_Progress_Magang.pdf', 'Tes', '2023-06-07 07:07:31', '2023-06-07 07:07:31'),
(2, 17, '2023-06-11', 'Progress Minggu 1', '17_BIMO SATRIO PUTRA PRADANA_Progress_Magang.pdf', 'Tambahkan fitur forgot password', '2023-06-11 04:01:14', '2023-06-11 04:01:14'),
(3, 17, '0000-00-00', '', '17_BIMO SATRIO PUTRA PRADANA_Progress_Magang.pdf', '', '2023-06-11 04:28:25', '2023-06-11 04:28:25'),
(4, 17, '2023-06-12', 'tes', '17_BIMO SATRIO PUTRA PRADANA_Progress_Magang.pdf', 'tes', '2023-06-11 04:30:40', '2023-06-11 04:30:40'),
(5, 17, '2023-06-13', 'ddyu', '17_BIMO SATRIO PUTRA PRADANA_Progress_Magang.pdf', 'bkbkbk', '2023-06-11 04:33:49', '2023-06-11 04:33:49'),
(6, 17, '2023-06-17', 'gvvj', '17_BIMO SATRIO PUTRA PRADANA_Progress_Magang.pdf', 'mmdmdmd', '2023-06-11 04:35:06', '2023-06-11 04:35:06');

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
(2, 1, 4, 2, 'Mentor Aplikasi', 'mentorapk@diskominfosan.ac.id', 'hcJdk+Zs/DcAdyeLgJqxLsHOjzydN+rPOmunNmGEzsquMDb//CxFIueoa7x1dluEx0QiGnhAcL+86QszoLXtMxdhlLM83keRso7Mq/DULzCi/lVv0hIm/i8=', '', '2023-04-23 13:28:33', '2023-04-23 01:28:33', '2023-04-23 01:28:33'),
(3, 1, 2, 2, 'Mentor Multimedia', 'mentormultimedia@diskominfosan.ac.id', 'BHQ6s1wSL8bVUAtww6sxaYYJ6dkAk28BJdNyWolgk24WRDRo9Z5MtiHcYkExFN8tHMrg2EdOt1q59+mretib8rsitZQzwhuPerfVwaDR2T30Ti6q59qkH/s=', '', '2023-04-27 05:11:49', '2023-04-26 17:11:49', '2023-04-26 17:11:49'),
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
(15, 1, 3, 2, 'mentortesting1', 'mentortes@diskominfosan.ac.id', 'D7XeGowjTQhe2EFhrubmMEw0BgS6paFRx5WtUGisbL9Rjod2wVIzzq25c+1M7iwrtlA7XnAh60dMEyWn68I1Ui5ULpf5y4qIvxKnd+4YUkW0uRnROJcyCks=', '', '2023-06-02 13:08:34', '2023-06-02 13:08:34', '2023-06-07 10:56:25'),
(17, 1, 4, 3, 'BIMO SATRIO PUTRA PRADANA', 'bimosatrio814@gmail.com', 'qgkNkApyzbwuhsiBT2raCz/BJZEjGa1AStRfqh2sI8+HkNbnovbkPEeAyw/gZneHokEexXlcnejrdOfurWyR5VNCI4MMUxvQQ+Dxh8fOe7MPb1SbhudAiw==', '', '2023-06-02 14:33:57', '2023-06-02 14:33:57', '2023-06-02 14:45:45'),
(18, 1, 4, 3, 'SARA PUJA KESUMA', 'sarapuja3109@gmail.com', 'X/adL7taglLRUmiKQV4rRXOp2Mmo4nZhnS/ceCZsk+YY8SHSxaGMjQjohiNHBLP/EqtpVOh3xZVGTb1T7j3YoF3vUEiimmm10hRiXCR6l2Lz+uxvTzJV2w==', '', '2023-06-07 13:41:36', '2023-06-07 13:41:36', '2023-06-07 13:56:25'),
(20, 0, 0, 3, 'MICHAEL SCOFIELD', 'scofield@gmail.com', 'PgnrRFEo09c7zCsEyU2/CHcjbqhDhIAAbYVM1Wc06YkMU3YmugLo1Yta+zODbyp/LYJpcEG3hx1EUxEtVZ/CHNy+yRbUjyNF3Fcdp8nuRNnbZCNoRPBw/Q==', '', '2023-06-14 09:53:14', '2023-06-14 09:53:14', '2023-06-14 09:53:14');

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
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_kampus`
--
ALTER TABLE `tbl_kampus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_laporan`
--
ALTER TABLE `tbl_laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_pendaftaran`
--
ALTER TABLE `tbl_pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_progresmagang`
--
ALTER TABLE `tbl_progresmagang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
-- Ketidakleluasaan untuk tabel `tbl_presensi`
--
ALTER TABLE `tbl_presensi`
  ADD CONSTRAINT `tbl_presensi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`);

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
