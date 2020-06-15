-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2020 pada 17.41
-- Versi server: 10.4.6-MariaDB-log
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `break-out`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_order`
--

CREATE TABLE `detail_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_menu` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_order`
--

INSERT INTO `detail_order` (`id`, `id_order`, `id_menu`, `keterangan`, `jumlah_menu`, `status`, `created_at`, `updated_at`) VALUES
(1, 42, 8, 'harus enak', 1, NULL, '2020-04-22 10:08:49', '2020-04-22 10:08:49'),
(2, 43, 8, 'mantap', 1, NULL, '2020-04-22 10:12:24', '2020-04-22 10:12:24'),
(3, 44, 12, 'setengah matang', 1, NULL, '2020-04-22 10:24:11', '2020-04-22 10:24:11'),
(4, 44, 10, 'less sugar okay bro', 1, NULL, '2020-04-22 10:24:11', '2020-04-22 10:24:11'),
(5, 45, 12, 'tambah uyah', 1, NULL, '2020-04-23 06:48:58', '2020-04-23 06:48:58'),
(6, 46, 3, NULL, 1, NULL, '2020-04-23 06:51:08', '2020-04-23 06:51:08'),
(7, 46, 12, 'setengah matang ya mba', 1, NULL, '2020-04-23 06:51:08', '2020-04-23 06:51:08'),
(8, 47, 2, 'jgan banya es', 1, NULL, '2020-04-23 06:54:43', '2020-04-23 06:54:43'),
(9, 48, 10, 'hot ya mba', 1, NULL, '2020-04-23 06:55:50', '2020-04-23 06:55:50'),
(10, 49, 8, 'take away yaaa makasih', 1, NULL, '2020-04-23 06:56:45', '2020-04-23 06:56:45'),
(11, 50, 11, NULL, 1, NULL, '2020-04-23 06:57:19', '2020-04-23 06:57:19'),
(12, 51, 8, 'setengah mateng yaa', 3, NULL, '2020-04-23 09:13:37', '2020-04-23 09:13:37'),
(13, 52, 11, 'wafflenya kering yaa', 2, NULL, '2020-04-23 09:21:33', '2020-04-23 09:21:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategoris`
--

CREATE TABLE `kategoris` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `kategoris`
--

INSERT INTO `kategoris` (`id`, `kategori`, `created_at`, `updated_at`) VALUES
(1, 'Food', '2012-01-10 07:47:30', '2012-01-10 07:47:30'),
(2, 'Drink', '2012-01-10 07:47:35', '2012-01-10 07:47:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `levels`
--

CREATE TABLE `levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` enum('admin','owner','kasir','waiter','meja','koki') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `levels`
--

INSERT INTO `levels` (`id`, `level`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'owner', NULL, NULL),
(3, 'kasir', NULL, NULL),
(4, 'waiter', NULL, NULL),
(5, 'meja', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `kategori` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ready','sold out') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `nama`, `harga`, `kategori`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mie telor', 120000, 2, 'd90195f90b11f810a26871a7eb0dc4e8.jpg', 'ready', '2012-01-10 07:34:15', '2020-04-22 10:19:30'),
(2, 'Strawberry Milk', 8000, 2, '6b2c7c466c27b7857eebd885f60eec5f.jpg', 'ready', '2012-01-10 07:34:42', '2012-01-10 07:34:42'),
(3, 'Original Waffle', 10000, 1, '9a4c6f2f999e97b0d31ceb5fcbeb3ccd.jpg', 'ready', '2012-01-10 07:35:20', '2012-01-10 07:35:20'),
(4, 'Oatmilk Original', 15000, 1, '9a69613ca8e5097b8d0fda2befd85752.jpg', 'sold out', '2012-01-10 07:35:46', '2012-01-10 07:35:46'),
(7, 'Coffee Latte', 8000, 2, '8757f5a1e5967c47471156f3a6d6c8dc.jpg', 'sold out', '2012-01-10 07:38:08', '2012-01-10 07:38:08'),
(8, 'Strawberry Pancake', 12000, 1, 'dbad50d5731290961ae15ebf342229a8.jpg', 'ready', '2012-01-10 07:39:06', '2012-01-10 07:39:06'),
(9, 'Original Milk', 8000, 2, '9883d92a3fc99784248831b378ba1cc1.jpg', 'sold out', '2012-01-10 07:39:36', '2012-01-10 07:39:36'),
(10, 'Rose Tea', 11000, 2, '69223dfa21c411db7ff68f6f5cd01f4e.jpg', 'ready', '2012-01-10 07:40:01', '2012-01-10 07:40:01'),
(11, 'Egg with Waffle', 13000, 1, 'f20fbf903538cb979e82ee048bfbbb8f.jpg', 'ready', '2012-01-10 07:40:23', '2012-01-10 07:40:23'),
(12, 'Egg Bacoon', 20000, 1, '991448f11c28d5b9743621cd728e6d30.jpg', 'ready', '2012-01-10 07:44:19', '2012-01-10 07:45:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_01_09_172029_create_levels_table', 1),
(2, '2012_01_09_172228_create_kategoris_table', 1),
(3, '2012_01_09_172258_create_menus_table', 1),
(4, '2012_01_09_172405_create_detail_orders_table', 1),
(5, '2012_01_09_172430_create_orders_table', 1),
(6, '2012_01_09_172451_create_transaksis_table', 1),
(7, '2012_01_11_063737_create_testis_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('dipesan','belum dibayar','dibayar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `id_meja`, `keterangan`, `status`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 07:53:19', '2012-01-12 07:55:14'),
(2, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 07:53:40', '2012-01-12 07:55:07'),
(3, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 07:54:04', '2012-01-12 08:10:47'),
(4, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 08:13:03', '2012-01-12 08:23:28'),
(5, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 08:24:32', '2012-01-12 09:15:39'),
(6, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 08:24:43', '2012-01-12 08:43:03'),
(7, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 08:24:54', '2012-01-12 09:15:55'),
(8, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 08:43:18', '2012-01-12 08:59:50'),
(9, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 09:16:29', '2012-01-12 09:16:55'),
(10, 12, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 09:20:57', '2012-01-12 09:24:12'),
(11, 9, 18, NULL, 'dibayar', '2012-01-12', '2012-01-12 09:24:36', '2012-01-12 09:27:20'),
(12, 18, 19, NULL, 'dibayar', '2012-01-13', '2012-01-13 09:46:53', '2012-01-13 10:32:44'),
(13, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 09:47:22', '2012-01-13 10:29:20'),
(14, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 09:47:30', '2012-01-13 10:32:31'),
(15, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 10:08:13', '2012-01-13 10:29:01'),
(16, 18, 18, NULL, 'belum dibayar', '2012-01-13', '2012-01-13 10:12:06', '2012-01-13 10:33:55'),
(17, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 10:18:49', '2012-01-13 13:19:03'),
(18, 9, 19, NULL, 'dibayar', '2012-01-13', '2012-01-13 10:28:21', '2012-01-13 13:18:46'),
(19, 18, 18, NULL, 'belum dibayar', '2012-01-13', '2012-01-13 11:06:01', '2012-01-13 13:23:24'),
(20, 9, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 12:41:47', '2012-01-13 13:33:29'),
(21, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 13:11:15', '2012-01-13 13:32:41'),
(22, 18, 18, NULL, 'belum dibayar', '2012-01-13', '2012-01-13 13:13:25', '2012-01-13 13:38:49'),
(23, 9, 18, NULL, 'belum dibayar', '2012-01-13', '2012-01-13 13:23:05', '2012-01-13 13:38:52'),
(24, 9, 19, NULL, 'dibayar', '2012-01-13', '2012-01-13 13:36:20', '2012-01-13 13:39:07'),
(25, 18, 18, NULL, 'belum dibayar', '2012-01-13', '2012-01-13 13:41:09', '2012-01-13 13:41:47'),
(26, 18, 18, NULL, 'belum dibayar', '2012-01-13', '2012-01-13 13:54:57', '2012-01-13 14:23:19'),
(27, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:22:21', '2012-01-13 14:26:32'),
(28, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:22:30', '2012-01-13 19:51:55'),
(29, 12, 19, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:23:50', '2012-01-13 14:25:25'),
(30, 18, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:28:55', '2012-01-13 19:51:42'),
(31, 12, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:29:40', '2012-01-13 14:38:58'),
(32, 12, 19, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:40:37', '2012-01-13 19:13:40'),
(33, 12, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:41:30', '2012-01-13 19:13:26'),
(34, 12, 18, NULL, 'dibayar', '2012-01-13', '2012-01-13 14:42:10', '2012-01-13 14:47:27'),
(35, 18, 18, NULL, 'dibayar', '2012-01-14', '2012-01-13 19:10:13', '2012-01-13 19:13:03'),
(36, 18, 18, NULL, 'dibayar', '2012-01-14', '2012-01-13 19:11:47', '2012-01-13 19:32:06'),
(37, 18, 18, NULL, 'dibayar', '2012-01-14', '2012-01-13 19:20:38', '2012-01-13 19:31:49'),
(38, 12, 19, NULL, 'dipesan', '2012-01-14', '2012-01-13 19:27:25', '2012-01-13 19:27:25'),
(39, 18, 18, NULL, 'dibayar', '2012-01-14', '2012-01-13 19:37:16', '2012-01-13 19:38:55'),
(40, 9, 18, NULL, 'dipesan', '2012-01-14', '2012-01-13 19:50:24', '2012-01-13 19:50:24'),
(41, 9, 18, NULL, 'dibayar', '2012-01-14', '2012-01-13 19:55:31', '2020-04-22 10:30:26'),
(42, 22, 22, NULL, 'dibayar', '2020-04-22', '2020-04-22 10:08:48', '2020-04-22 10:17:09'),
(43, 22, 22, NULL, 'dibayar', '2020-04-22', '2020-04-22 10:12:24', '2020-04-22 10:16:23'),
(44, 22, 22, NULL, 'dibayar', '2020-04-22', '2020-04-22 10:24:11', '2020-04-22 10:25:51'),
(45, 22, 22, NULL, 'belum dibayar', '2020-04-23', '2020-04-23 06:48:58', '2020-04-23 07:01:54'),
(46, 22, 22, NULL, 'belum dibayar', '2020-04-23', '2020-04-23 06:51:08', '2020-04-23 07:02:00'),
(47, 22, 22, NULL, 'belum dibayar', '2020-04-23', '2020-04-23 06:54:43', '2020-04-23 07:02:04'),
(48, 22, 22, NULL, 'belum dibayar', '2020-04-23', '2020-04-23 06:55:50', '2020-04-23 07:02:08'),
(49, 22, 22, NULL, 'dipesan', '2020-04-23', '2020-04-23 06:56:45', '2020-04-23 06:56:45'),
(50, 22, 22, NULL, 'dibayar', '2020-04-23', '2020-04-23 06:57:19', '2020-04-23 07:03:16'),
(51, 22, 22, NULL, 'dipesan', '2020-04-23', '2020-04-23 09:13:37', '2020-04-23 09:13:37'),
(52, 22, 22, NULL, 'dipesan', '2020-04-23', '2020-04-23 09:21:33', '2020-04-23 09:21:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testis`
--

CREATE TABLE `testis` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `testis`
--

INSERT INTO `testis` (`id`, `nama`, `testi`, `status`, `created_at`, `updated_at`) VALUES
(19, 'fikri', 'murah', 'dikirim', '2020-04-22 10:24:34', '2020-04-22 10:24:34'),
(20, 'windu', 'maaciwww mantip ganteng mas nya', 'dikirim', '2020-04-23 06:55:18', '2020-04-23 06:55:18'),
(21, 'irfan', 'nyaman cafenya', 'dikirim', '2020-04-23 06:56:07', '2020-04-23 06:56:07'),
(22, 'deri', 'take away boss', 'dikirim', '2020-04-23 06:56:59', '2020-04-23 06:56:59'),
(23, 'tomy', 'nuju garing dompet boss', 'dikirim', '2020-04-23 06:57:42', '2020-04-23 06:57:42'),
(24, 'Markonah', 'MANTAP EEUUYY', 'dikirim', '2020-04-23 09:14:00', '2020-04-23 09:14:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksis`
--

CREATE TABLE `transaksis` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status` enum('pending','dimasak') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `transaksis`
--

INSERT INTO `transaksis` (`id`, `id_user`, `id_order`, `tanggal`, `total_bayar`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 43, '2020-04-22', 12000, NULL, '2020-04-22 10:16:23', '2020-04-22 10:16:23'),
(2, 9, 42, '2020-04-22', 12000, NULL, '2020-04-22 10:17:09', '2020-04-22 10:17:09'),
(3, 9, 44, '2020-04-22', 31000, NULL, '2020-04-22 10:25:51', '2020-04-22 10:25:51'),
(4, 26, 41, '2020-04-22', 0, NULL, '2020-04-22 10:30:26', '2020-04-22 10:30:26'),
(5, 26, 50, '2020-04-23', 13000, NULL, '2020-04-23 07:03:16', '2020-04-23 07:03:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(9, 'Admin', 'admin@gmail.com', '$2y$10$CKwLu6OQvIn/gQjg2mPCKOuOnqyo3T7.ICKSFma.uerofZQSpVUyy', 1, 'pUJT7RLUYEO4MWlgTXE8JXzMphsQoeCAUFQzBcQhN4VP8N3LWfVQ47NRdl9y', '2012-01-09 10:24:02', '2012-01-09 10:24:02'),
(18, 'Table 1', 'meja@gmail.com', '$2y$10$xQZlTjV2cfGyvDzLOhosQuy8e.xrKOEk2T6EuDA/M8WL6BEsc1IvG', 5, 'TuWDTtvMotlye7XazS5cnGKgYHYpSoeXoQAih4pJitwlyEIoi6J18bK7I5GC', '2012-01-09 10:56:06', '2012-01-09 10:56:06'),
(19, 'Table 2', 'meja2@gmail.com', '$2y$10$nQIRyhwz.u1cimxUIoF6l.PoUs24kzYC5MFf.mZW56qaouLraMsPO', 5, NULL, '2012-01-11 14:24:09', '2012-01-11 14:28:34'),
(22, 'table 3', 'table3@gmail.com', '$2y$10$O1..T5m9wuuodrV0TsGlHuauo7V5FbdF3xdoioixM.Fu9h4/IiJc2', 5, 'mGIiAfL0KUZPirvsLCFPBna61ESN71Ag1OiChTbHc9StofayMGeVO13zImgL', '2020-04-22 10:08:12', '2020-04-22 10:08:12'),
(25, 'owner', NULL, '$2y$10$IUGzCMY8VJPQLoKxoFpyQOWLNBCNeCM.q1utxfXXAAo5O37Zg9lh.', 2, '5wurdYOYRgyYrjkH3Vq2NNZLiFbbDYTAbjVBXD6UXD7UsqK9TDeIPYEu0lGR', '2020-04-22 10:28:17', '2020-04-22 10:28:17'),
(26, 'kasir', NULL, '$2y$10$IWUJtyi9T.cmHJI1iIGJkO3hlTjzJeGOfggW0q7iT9on7h.ejheNm', 3, 'qJ9nLkxl9MjtgskVFpRBm7sSCoXEExqTmCHIOTUekogD08Wh599sDs0ksEto', '2020-04-22 10:29:31', '2020-04-22 10:29:31'),
(28, 'waiter', NULL, '$2y$10$YuDzgFfQlRmcW.5a33l.Ce.mwiXrgnCQE6Ow1xYg7jRbPGwARGSNC', 4, 'abGS9uLuJQ2mV3Ep6j1tCsrNrNoezeCG4B6bLFJKDXhacLf2mjkBVxiIojw8', '2020-04-22 10:33:19', '2020-04-22 10:33:19');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_order`
--
ALTER TABLE `detail_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testis`
--
ALTER TABLE `testis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_order`
--
ALTER TABLE `detail_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kategoris`
--
ALTER TABLE `kategoris`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `testis`
--
ALTER TABLE `testis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
