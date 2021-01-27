-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Jan-2021 às 04:06
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `b2_media`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_01_25_233549_create_table_products', 1),
(5, '2021_01_25_235700_create_table_product_suppliers', 1),
(6, '2021_01_26_000300_create_table_suppliers', 1),
(7, '2021_01_26_001638_create_table_sales', 1),
(8, '2021_01_26_003129_create_table_sale_products', 1),
(9, '2021_01_26_130139_create_table_sale_adres', 1),
(10, '2021_01_26_195538_create_table_carts', 2),
(11, '2021_01_26_202337_create_table_cart_products', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `reference`, `created_at`, `updated_at`) VALUES
(1, 'Product One', '34.90', '91827', '2021-01-26 22:20:16', NULL),
(2, 'Product Two', '24.00', '89128', '2021-01-26 22:20:15', NULL),
(3, 'Product Four', '22.00', '8178', '2021-01-27 02:20:05', NULL),
(4, 'Product Five', '128.00', '91872', '2021-01-27 02:20:21', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_suppliers`
--

CREATE TABLE `product_suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_suppliers`
--

INSERT INTO `product_suppliers` (`id`, `supplier_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-01-26 19:09:38', NULL),
(2, 1, 2, '2021-01-27 02:20:39', NULL),
(3, 2, 2, '2021-01-27 02:20:40', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 1, '2021-01-27 04:46:07', '2021-01-27 04:46:07'),
(4, 1, '2021-01-27 04:46:38', '2021-01-27 04:46:38'),
(5, 1, '2021-01-27 04:49:57', '2021-01-27 04:49:57'),
(6, 1, '2021-01-27 04:50:55', '2021-01-27 04:50:55'),
(7, 1, '2021-01-27 04:50:58', '2021-01-27 04:50:58'),
(8, 1, '2021-01-27 04:51:52', '2021-01-27 04:51:52'),
(9, 1, '2021-01-27 04:52:52', '2021-01-27 04:52:52'),
(10, 1, '2021-01-27 04:53:09', '2021-01-27 04:53:09'),
(11, 1, '2021-01-27 04:54:23', '2021-01-27 04:54:23'),
(12, 1, '2021-01-27 04:58:10', '2021-01-27 04:58:10'),
(13, 1, '2021-01-27 05:03:11', '2021-01-27 05:03:11'),
(14, 1, '2021-01-27 05:05:19', '2021-01-27 05:05:19'),
(15, 1, '2021-01-27 05:10:15', '2021-01-27 05:10:15'),
(16, 1, '2021-01-27 05:29:06', '2021-01-27 05:29:06'),
(17, 1, '2021-01-27 05:29:45', '2021-01-27 05:29:45'),
(18, 1, '2021-01-27 05:30:18', '2021-01-27 05:30:18'),
(19, 1, '2021-01-27 05:57:49', '2021-01-27 05:57:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sale_adres`
--

CREATE TABLE `sale_adres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sale_adres`
--

INSERT INTO `sale_adres` (`id`, `sale_id`, `zip_code`, `street`, `number`, `city`, `state`, `district`, `created_at`, `updated_at`) VALUES
(1, 11, '07131170', 'Rua Ilha Comprida', '1298', 'Guarulhos', 'SP', 'Jardim São Paulo', '2021-01-27 04:54:23', '2021-01-27 04:54:23'),
(2, 12, '07131170', 'Rua Ilha Comprida', '1298', 'Guarulhos', 'SP', 'Jardim São Paulo', '2021-01-27 04:58:10', '2021-01-27 04:58:10'),
(3, 13, '07131170', 'Rua Ilha Comprida', '172', 'Guarulhos', 'SP', 'Jardim São Paulo', '2021-01-27 05:03:11', '2021-01-27 05:03:11'),
(4, 14, '07131170', 'Rua Ilha Comprida', '172', 'Guarulhos', 'SP', 'Jardim São Paulo', '2021-01-27 05:05:19', '2021-01-27 05:05:19'),
(5, 15, '07131170', 'Rua Ilha Comprida', '297', 'Guarulhos', 'SP', 'Jardim São Paulo', '2021-01-27 05:10:15', '2021-01-27 05:10:15'),
(6, 19, '07131170', 'Rua Ilha Comprida', '298', 'Guarulhos', 'SP', 'Jardim São Paulo', '2021-01-27 05:57:49', '2021-01-27 05:57:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sale_products`
--

CREATE TABLE `sale_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sale_products`
--

INSERT INTO `sale_products` (`id`, `product_id`, `sale_id`, `price`, `created_at`, `updated_at`) VALUES
(1, 2, 12, '24.00', '2021-01-27 04:58:11', '2021-01-27 04:58:11'),
(2, 1, 12, '34.90', '2021-01-27 04:58:11', '2021-01-27 04:58:11'),
(3, 1, 12, '34.90', '2021-01-27 04:58:11', '2021-01-27 04:58:11'),
(4, 2, 12, '24.00', '2021-01-27 04:58:11', '2021-01-27 04:58:11'),
(5, 1, 12, '34.90', '2021-01-27 04:58:11', '2021-01-27 04:58:11'),
(6, 2, 13, '24.00', '2021-01-27 05:03:11', '2021-01-27 05:03:11'),
(7, 1, 13, '34.90', '2021-01-27 05:03:11', '2021-01-27 05:03:11'),
(8, 2, 14, '24.00', '2021-01-27 05:05:19', '2021-01-27 05:05:19'),
(9, 1, 14, '34.90', '2021-01-27 05:05:19', '2021-01-27 05:05:19'),
(10, 2, 15, '24.00', '2021-01-27 05:10:15', '2021-01-27 05:10:15'),
(11, 1, 19, '34.90', '2021-01-27 05:57:49', '2021-01-27 05:57:49'),
(12, 3, 19, '22.00', '2021-01-27 05:57:49', '2021-01-27 05:57:49'),
(13, 2, 19, '24.00', '2021-01-27 05:57:49', '2021-01-27 05:57:49'),
(14, 4, 19, '128.00', '2021-01-27 05:57:49', '2021-01-27 05:57:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Forn One', '2021-01-26 19:09:20', NULL),
(2, 'Forn Two', '2021-01-27 02:28:52', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ronaldo Novaes', 'emporio.rony@gmail.com', NULL, '$2y$10$fsELjXnB82Yn2CWGXQpEdeSqL6IKcQibcmAO5d3MWlQwcrmVLzmFC', NULL, '2021-01-26 21:31:36', '2021-01-26 21:31:36');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_reference_unique` (`reference`);

--
-- Índices para tabela `product_suppliers`
--
ALTER TABLE `product_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sale_adres`
--
ALTER TABLE `sale_adres`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sale_products`
--
ALTER TABLE `sale_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `product_suppliers`
--
ALTER TABLE `product_suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `sale_adres`
--
ALTER TABLE `sale_adres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
