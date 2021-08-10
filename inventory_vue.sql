-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2021 at 03:41 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Bag', '2020-09-18 03:25:47', '2020-09-18 03:25:47'),
(2, 'Electronics', '2020-09-18 03:26:01', '2020-09-18 03:26:01'),
(3, 'Cloths', '2020-09-18 03:26:21', '2020-09-18 03:26:21'),
(4, 'Mobile', '2020-09-18 03:26:40', '2020-09-18 03:26:40'),
(5, 'Watch', '2020-09-18 03:29:08', '2020-09-18 03:29:08'),
(6, 'Furniture', '2020-09-18 03:29:21', '2020-09-18 03:29:21'),
(7, 'Shoe', '2020-09-18 03:29:31', '2020-09-18 03:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Solim Ullah', 'solim@gmail.com', '01844455533', 'Kholilabad, Natuwan Bagicha', 'backend/customer/1600790088.jpeg', '2020-09-22 14:24:32', '2020-09-22 14:24:32'),
(2, 'Manna Alam', 'manna@gmail.com', '01845453627', 'Mir bari, Middle Kadalpur', 'backend/customer/1600784750.jpeg', '2020-09-22 14:25:50', '2020-09-22 14:25:50'),
(4, 'Sazzad Hossen', 'sazzad@gmail.com', '01983355325', 'Modina Tower, Prosanti Abasik', 'backend/customer/1600790049.jpeg', '2020-09-22 15:24:31', '2020-09-22 15:24:31'),
(5, 'Md Arman', 'Marman@gmail.com', '01799855325', 'Muradpur, Chattogram', 'backend/customer/1600789322.jpeg', '2020-09-22 15:42:03', '2020-09-22 15:42:03'),
(6, 'jahed H Hossen', 'jahad@gmail.com', '01733455325', 'Prosanti Abasik', 'backend/customer/1600790335.jpeg', '2020-09-22 15:55:08', '2020-09-22 15:55:08'),
(7, 'Afrin Sultana', 'afrinsultana370@gmail.com', '01738055325', 'Muradpur, Chattogram', 'backend/customer/1600790378.jpeg', '2020-09-22 15:59:38', '2020-09-22 15:59:38'),
(14, 'Humaira Khaton', 'humaira@gmail.com', '0186565765', 'Rajshahi', 'backend/customer/1601041879.jpeg', '2020-09-25 13:51:19', '2020-09-25 13:51:19'),
(15, 'Amdad Hossen', 'amdad@gmail.com', '01726262626', 'Pahartoli', 'backend/customer/1601101526.jpeg', '2020-09-26 06:25:26', '2020-09-26 06:25:26');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joining_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `address`, `photo`, `nid`, `salary`, `joining_date`, `created_at`, `updated_at`) VALUES
(3, 'Sazzad Hossen', 'sazzad@gmail.com', '01744455325', 'Modina Tower, 8 no road, Prosanti Abasik', 'backend/employee/1600285639.jpeg', '6663535553435', '26000', '2020-09-12', '2020-09-16 05:26:57', '2020-09-16 05:26:57'),
(4, 'arman', 'arman@gmail.com', '01753455325', 'Muradpur, Chattogram', 'backend/employee/1600285306.jpeg', '667457553477735', '30000', '2020-08-30', '2020-09-16 05:28:48', '2020-09-16 05:28:48'),
(5, 'Azam Khan', 'azam@gmail.com', '01700455325', 'Pahartoli, CUET', 'backend/employee/1600268423.jpeg', '9663535553435', '34000', '2020-09-03', '2020-09-16 09:00:23', '2020-09-16 09:00:23'),
(6, 'Irfan Karim', 'irfan@gmail.com', '01733499925', 'Chawk Bazar, Chattogram', 'backend/employee/1600268515.jpeg', '444457553435', '28000', '2020-09-14', '2020-09-16 09:01:55', '2020-09-16 09:01:55'),
(7, 'Wahim Ahmed', 'wasim@gmail.com', '01733455366', 'Hathhazari, Chattogram', 'backend/employee/1600268715.jpeg', '43474597763435', '34000', '2020-09-05', '2020-09-16 09:05:15', '2020-09-16 09:05:15'),
(8, 'Karim', 'i@gmail.com', '01887499925', 'Chawk Bazar, Chattogram', 'backend/employee/1600270719.png', '666353555435', '24550', '2020-09-04', '2020-09-16 09:38:39', '2020-09-16 09:38:39'),
(9, 'Sazzad Hossen', 'sazzad@gmail.com', '01733455325', 'Prosanti Abasik, Colonel Hat', 'backend/employee/1600270834.png', '65555657547454', '34000', '2020-09-10', '2020-09-16 09:40:34', '2020-09-16 09:40:34'),
(13, 'Kamrul Hasan', 'kh@gmail.com', '01833455325', '8 no road, Onnanna Abasikh', 'backend/employee/1600286039.jpeg', '666353566553435', '28000', '2020-09-04', '2020-09-16 13:53:59', '2020-09-16 13:53:59'),
(14, 'Hisbullah Hasnat', 'hasnat@gmail.com', '017090055325', 'Cox\'s Bazar', 'backend/employee/1601410861.jpeg', '43333000553435', '12000', '2020-09-02', '2020-09-29 20:21:05', '2020-09-29 20:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `details`, `amount`, `expense_date`, `created_at`, `updated_at`) VALUES
(3, 'Telephone Bill', '800', '20/09/2020', '2020-09-19 20:34:18', '2020-09-19 20:34:18'),
(5, 'Office Rent', '20000', '20/09/2020', '2020-09-19 21:05:13', '2020-09-19 21:05:13'),
(6, 'Internet Bill', '1500', '27/09/2020', '2020-09-27 09:30:14', '2020-09-27 09:30:14'),
(7, 'House Rent', '2500', '30/09/2020', '2020-09-30 14:42:15', '2020-09-30 14:42:15'),
(8, 'Wifi Bill', '2000', '01/10/2020', '2020-10-01 13:26:36', '2020-10-01 13:26:36'),
(9, 'Electricity Bill', '500', '26/03/2021', '2021-03-26 13:48:48', '2021-03-26 13:48:48'),
(10, 'Others Cost', '2000', '27/03/2021', '2021-03-26 19:29:17', '2021-03-26 19:29:17'),
(11, 'Water', '50', '03/06/2021', '2021-06-03 06:45:30', '2021-06-03 06:45:30');

-- --------------------------------------------------------

--
-- Table structure for table `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vat` int(11) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extras`
--

INSERT INTO `extras` (`id`, `vat`, `logo`, `favicon`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 4, '', NULL, '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_09_15_105013_create_employees_table', 2),
(4, '2020_09_17_054055_create_suppliers_table', 3),
(5, '2020_09_18_044927_create_categories_table', 4),
(6, '2020_09_18_102558_create_products_table', 5),
(7, '2020_09_19_135626_create_expenses_table', 6),
(8, '2020_09_20_153349_create_salaries_table', 7),
(9, '2020_09_22_200128_create_customers_table', 8),
(10, '2020_09_25_153905_create_pos_table', 9),
(11, '2020_09_25_201002_create_extra_table', 10),
(12, '2020_09_25_214940_create_extras_table', 11),
(13, '2020_09_26_020053_create_orders_table', 12),
(14, '2020_09_26_020334_create_order_details_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payby` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `qty`, `sub_total`, `vat`, `total`, `pay`, `due`, `payby`, `order_date`, `order_month`, `order_year`, `created_at`, `updated_at`) VALUES
(1, 15, '6', '3700', '4', '3848', '3000', '848', 'HandCash', '26/09/2020', 'September', '2020', NULL, NULL),
(2, 5, '2', '1880', '4', '1955.2', '1955.2', '00', 'HandCash', '26/09/2020', 'September', '2020', '2020-09-26 06:58:17', '2020-09-26 06:58:17'),
(3, 4, '3', '1900', '4', '1976', '1900', '976', 'Cheaque', '26/09/2020', 'September', '2020', '2020-09-26 10:13:02', '2020-09-26 10:13:02'),
(4, 2, '4', '18700', '4', '19448', '19000', '448', 'Cheaque', '26/09/2020', 'September', '2020', '2020-09-26 15:03:11', '2020-09-26 15:03:11'),
(5, 7, '4', '6700', '4', '6968', '6968', '00', 'Cheaque', '27/09/2020', 'September', '2020', '2020-09-26 19:10:26', '2020-09-26 19:10:26'),
(6, 6, '2', '2400', '4', '2496', '2496', '00', 'Cheaque', '27/09/2020', 'September', '2020', '2020-09-26 19:25:58', '2020-09-26 19:25:58'),
(7, 5, '1', '250', '4', '260', '200', '60', 'HandCash', '27/09/2020', 'September', '2020', '2020-09-27 07:21:41', '2020-09-27 07:21:41'),
(8, 4, '1', '60000', '4', '62400', '57000', '3000', 'HandCash', '27/09/2020', 'September', '2020', '2020-09-27 10:25:17', '2020-09-27 10:25:17'),
(9, 2, '1', '18000', '4', '18720', '15000', '3720', 'Cheaque', '29/09/2020', 'September', '2020', '2020-09-29 13:52:41', '2020-09-29 13:52:41'),
(10, 7, '1', '180', '4', '187.2', '100', '87.2', 'Cheaque', '30/09/2020', 'September', '2020', '2020-09-30 14:41:48', '2020-09-30 14:41:48'),
(11, 6, '4', '5100', '4', '5304', '5000', '304', 'Cheaque', '01/10/2020', 'October', '2020', '2020-10-01 13:26:10', '2020-10-01 13:26:10'),
(12, 15, '1', '180', '4', '187.2', '100', '80', 'HandCash', '01/10/2020', 'October', '2020', '2020-10-01 14:21:08', '2020-10-01 14:21:08'),
(14, 4, '3', '680', '4', '707.2', '600', '107.20', 'GiftCard', '03/10/2020', 'October', '2020', '2020-10-03 15:00:37', '2020-10-03 15:00:37'),
(15, 14, '3', '25430', '4', '26447.2', '20000', '6447.20', 'HandCash', '03/10/2020', 'October', '2020', '2020-10-03 15:05:09', '2020-10-03 15:05:09'),
(16, 5, '2', '61100', '4', '63544', '60000', '3544.00', 'Cheaque', '03/10/2020', 'October', '2020', '2020-10-03 15:07:53', '2020-10-03 15:07:53'),
(17, 5, '2', '2500', '4', '2600', '1000', '1600.00', 'HandCash', '24/03/2021', 'March', '2021', '2021-03-24 14:01:46', '2021-03-24 14:01:46'),
(18, 6, '1', '1600', '4', '1664', '1111', '553.00', 'HandCash', '26/03/2021', 'March', '2021', '2021-03-26 03:17:00', '2021-03-26 03:17:00'),
(19, 14, '2', '1900', '4', '1976', '1111', '865.00', 'HandCash', '27/03/2021', 'March', '2021', '2021-03-26 19:28:37', '2021-03-26 19:28:37'),
(20, 14, '2', '19600', '4', '20384', '443', '19941.00', 'HandCash', '27/03/2021', 'March', '2021', '2021-03-26 20:46:46', '2021-03-26 20:46:46'),
(21, 14, '2', '3000', '4', '3120', '3000', '120.00', 'Cheaque', '27/03/2021', 'March', '2021', '2021-03-26 20:49:57', '2021-03-26 20:49:57'),
(22, 5, '1', '500', '4', '520', '333', '187.00', 'GiftCard', '27/03/2021', 'March', '2021', '2021-03-26 20:53:25', '2021-03-26 20:53:25'),
(23, 6, '3', '25680', '4', '26707.2', '7777', '18930.20', 'HandCash', '27/03/2021', 'March', '2021', '2021-03-26 20:59:02', '2021-03-26 20:59:02'),
(24, 5, '2', '36000', '4', '37440', '23333', '14107.00', 'HandCash', '03/06/2021', 'June', '2021', '2021-06-03 06:45:01', '2021-06-03 06:45:01'),
(25, 15, '1', '2000', '4', '2080', '2080', '0.00', 'HandCash', '03/06/2021', 'June', '2021', '2021-06-03 10:56:56', '2021-06-03 10:56:56'),
(26, 4, '3', '4100', '4', '4264', '4100', '164.00', 'Cheaque', '04/06/2021', 'June', '2021', '2021-06-04 04:54:25', '2021-06-04 04:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `pro_quantity` int(11) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `pro_quantity`, `product_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 1, 2000, 2000, NULL, NULL),
(2, 1, 4, 2, 250, 500, NULL, NULL),
(3, 1, 9, 2, 500, 1000, NULL, NULL),
(4, 1, 11, 1, 200, 200, NULL, NULL),
(5, 2, 19, 1, 1700, 1700, '2020-09-26 06:58:18', '2020-09-26 06:58:18'),
(6, 2, 5, 1, 180, 180, '2020-09-26 06:58:18', '2020-09-26 06:58:18'),
(7, 3, 11, 2, 200, 400, '2020-09-26 10:13:03', '2020-09-26 10:13:03'),
(8, 3, 16, 1, 1500, 1500, '2020-09-26 10:13:03', '2020-09-26 10:13:03'),
(9, 4, 13, 1, 18000, 18000, '2020-09-26 15:03:11', '2020-09-26 15:03:11'),
(10, 4, 11, 1, 200, 200, '2020-09-26 15:03:12', '2020-09-26 15:03:12'),
(11, 4, 4, 2, 250, 500, '2020-09-26 15:03:12', '2020-09-26 15:03:12'),
(12, 5, 17, 1, 1600, 1600, '2020-09-26 19:10:27', '2020-09-26 19:10:27'),
(13, 5, 16, 1, 1500, 1500, '2020-09-26 19:10:27', '2020-09-26 19:10:27'),
(14, 5, 14, 2, 1800, 3600, '2020-09-26 19:10:27', '2020-09-26 19:10:27'),
(15, 6, 6, 2, 1200, 2400, '2020-09-26 19:25:58', '2020-09-26 19:25:58'),
(16, 7, 4, 1, 250, 250, '2020-09-27 07:21:41', '2020-09-27 07:21:41'),
(17, 8, 20, 1, 60000, 60000, '2020-09-27 10:25:18', '2020-09-27 10:25:18'),
(18, 9, 13, 1, 18000, 18000, '2020-09-29 13:52:42', '2020-09-29 13:52:42'),
(19, 10, 5, 1, 180, 180, '2020-09-30 14:41:48', '2020-09-30 14:41:48'),
(20, 11, 7, 1, 1100, 1100, '2020-10-01 13:26:11', '2020-10-01 13:26:11'),
(21, 11, 6, 2, 1200, 2400, '2020-10-01 13:26:11', '2020-10-01 13:26:11'),
(22, 11, 17, 1, 1600, 1600, '2020-10-01 13:26:11', '2020-10-01 13:26:11'),
(23, 12, 5, 1, 180, 180, '2020-10-01 14:21:09', '2020-10-01 14:21:09'),
(26, 14, 4, 2, 250, 500, '2020-10-03 15:00:37', '2020-10-03 15:00:37'),
(27, 14, 5, 1, 180, 180, '2020-10-03 15:00:37', '2020-10-03 15:00:37'),
(28, 15, 1, 1, 25000, 25000, '2020-10-03 15:05:10', '2020-10-03 15:05:10'),
(29, 15, 4, 1, 250, 250, '2020-10-03 15:05:10', '2020-10-03 15:05:10'),
(30, 15, 5, 1, 180, 180, '2020-10-03 15:05:10', '2020-10-03 15:05:10'),
(31, 16, 2, 1, 60000, 60000, '2020-10-03 15:07:53', '2020-10-03 15:07:53'),
(32, 16, 7, 1, 1100, 1100, '2020-10-03 15:07:53', '2020-10-03 15:07:53'),
(33, 17, 9, 1, 500, 500, '2021-03-24 14:01:46', '2021-03-24 14:01:46'),
(34, 17, 15, 1, 2000, 2000, '2021-03-24 14:01:47', '2021-03-24 14:01:47'),
(35, 18, 17, 1, 1600, 1600, '2021-03-26 03:17:01', '2021-03-26 03:17:01'),
(36, 19, 11, 1, 200, 200, '2021-03-26 19:28:38', '2021-03-26 19:28:38'),
(37, 19, 19, 1, 1700, 1700, '2021-03-26 19:28:38', '2021-03-26 19:28:38'),
(38, 20, 13, 1, 18000, 18000, '2021-03-26 20:46:46', '2021-03-26 20:46:46'),
(39, 20, 17, 1, 1600, 1600, '2021-03-26 20:46:46', '2021-03-26 20:46:46'),
(40, 21, 12, 2, 1500, 3000, '2021-03-26 20:49:57', '2021-03-26 20:49:57'),
(41, 22, 9, 1, 500, 500, '2021-03-26 20:53:26', '2021-03-26 20:53:26'),
(42, 23, 9, 1, 500, 500, '2021-03-26 20:59:02', '2021-03-26 20:59:02'),
(43, 23, 1, 1, 25000, 25000, '2021-03-26 20:59:02', '2021-03-26 20:59:02'),
(44, 23, 5, 1, 180, 180, '2021-03-26 20:59:02', '2021-03-26 20:59:02'),
(45, 24, 13, 2, 18000, 36000, '2021-06-03 06:45:01', '2021-06-03 06:45:01'),
(46, 25, 15, 1, 2000, 2000, '2021-06-03 10:56:58', '2021-06-03 10:56:58'),
(47, 26, 18, 2, 1800, 3600, '2021-06-04 04:54:25', '2021-06-04 04:54:25'),
(48, 26, 9, 1, 500, 500, '2021-06-04 04:54:25', '2021-06-04 04:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pro_quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `pro_id`, `pro_name`, `pro_quantity`, `product_price`, `sub_total`, `created_at`, `updated_at`) VALUES
(109, 21, 'Head Phone', '3', '1000', '3000', '2021-06-04 04:54:48', '2021-06-04 04:54:48'),
(112, 15, 'Nick', '2', '2000', '4000', '2021-06-04 05:22:07', '2021-06-04 05:22:07'),
(113, 11, 'T-Shirt', '1', '200', '200', '2021-06-04 05:22:28', '2021-06-04 05:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `buying_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `buying_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `root`, `buying_price`, `selling_price`, `supplier_id`, `buying_date`, `image`, `product_quantity`, `created_at`, `updated_at`) VALUES
(1, 4, 'Samsung Note 8', '5343', '5', '22000', '25000', 2, '2020-09-12', 'backend/product/1600443470.png', '98', '2020-09-18 09:37:50', '2020-09-18 09:37:50'),
(2, 2, 'DELL Laptop', '3466', '2', '55000', '60000', 5, '2020-09-30', 'backend/product/1600446432.jpeg', '199', '2020-09-18 10:26:34', '2020-09-18 10:26:34'),
(3, 2, 'Head Phone', '2211', 'A', '800', '1000', 1, '2020-09-19', 'backend/product/1600511663.png', '50', '2020-09-19 04:34:24', '2020-09-19 04:34:24'),
(4, 5, 'Men\'s Watch', '5656', 'M5', '200', '250', 3, '2020-09-15', 'backend/product/1600511724.png', '62', '2020-09-19 04:35:24', '2020-09-19 04:35:24'),
(5, 3, 'T-Shirt', '5454', '10', '100', '180', 5, '2020-07-26', 'backend/product/1600511792.jpeg', '191', '2020-09-19 04:36:32', '2020-09-19 04:36:32'),
(6, 6, 'Chair', '4445', '8', '1000', '1200', 6, '2020-10-23', 'backend/product/1600511838.jpeg', '52', '2020-09-19 04:37:18', '2020-09-19 04:37:18'),
(7, 7, 'Men\'s Show', '8787', 'E2', '800', '1100', 2, '2020-09-02', 'backend/product/1600511955.jpeg', '138', '2020-09-19 04:39:15', '2020-09-19 04:39:15'),
(8, 2, 'Toshiba Laptop', '2314', 'A2', '54000', '58000', 1, '2020-05-06', 'backend/product/1600512042.png', '30', '2020-09-19 04:40:42', '2020-09-19 04:40:42'),
(9, 2, 'Mouse', '8899', 'A2', '400', '500', 4, '2020-07-04', 'backend/product/1600512105.jpeg', '75', '2020-09-19 04:41:45', '2020-09-19 04:41:45'),
(10, 4, 'iPad', '3443', '5', '50000', '55000', 6, '2020-11-05', 'backend/product/1600512175.jpeg', '0', '2020-09-19 04:42:55', '2020-09-19 04:42:55'),
(11, 3, 'T-Shirt', '5645', '7', '120', '200', 2, '2020-09-24', 'backend/product/1600513632.jpeg', '144', '2020-09-19 05:07:12', '2020-09-19 05:07:12'),
(12, 7, 'Sports - Shoe', '4431', 'M4', '1000', '1500', 5, '2020-08-31', 'backend/product/1600513717.jpeg', '198', '2020-09-19 05:08:38', '2020-09-19 05:08:38'),
(13, 4, 'Samsung J7 Prime', '5677', '3', '15000', '18000', 3, '2020-03-11', 'backend/product/1600513778.png', '68', '2020-09-19 05:09:38', '2020-09-19 05:09:38'),
(14, 5, 'Rado Watch', '777888', 'A2', '1500', '1800', 2, '2020-09-18', 'backend/product/1601030004.jpeg', '6', '2020-09-25 10:33:24', '2020-09-25 10:33:24'),
(15, 7, 'Nick', '333223', 'S3', '1800', '2000', 4, '2020-11-12', 'backend/product/1601030061.jpeg', '37', '2020-09-25 10:34:21', '2020-09-25 10:34:21'),
(16, 6, 'RFL Chair', '344424', 'D2', '1200', '1500', 6, '2021-01-04', 'backend/product/1601030177.jpeg', '28', '2020-09-25 10:36:17', '2020-09-25 10:36:17'),
(17, 1, 'Ladies Bag', '333456', 'D3', '1200', '1600', 5, '2020-08-30', 'backend/product/1601032333.jpeg', '18', '2020-09-25 11:12:14', '2020-09-25 11:12:14'),
(18, 1, 'Hand Bag', '787878', 'F2', '1700', '1800', 3, '2020-12-18', 'backend/product/1601032376.jpeg', '32', '2020-09-25 11:12:56', '2020-09-25 11:12:56'),
(19, 1, 'Ladies Parse', '456654', 'G1', '1400', '1700', 1, '2020-06-18', 'backend/product/1601032442.jpeg', '20', '2020-09-25 11:14:03', '2020-09-25 11:14:03'),
(20, 2, 'HP Laptop', '757557', 'A7', '55000', '60000', 5, '2020-09-27', 'backend/product/1601202478.png', '0', '2020-09-27 10:24:35', '2020-09-27 10:24:35'),
(21, 2, 'Head Phone', '23422', '3', '800', '1000', 1, '2021-06-03', 'backend/product/1622734282.png', '50', '2021-06-03 15:31:24', '2021-06-03 15:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `amount`, `salary_date`, `salary_month`, `salary_year`, `created_at`, `updated_at`) VALUES
(1, 3, '26000', '20/09/2020', 'March', '2020', NULL, NULL),
(2, 4, '30000', '20/09/2020', 'March', '2020', '2020-09-20 10:38:59', '2020-09-20 10:38:59'),
(3, 8, '24550', '20/09/2020', 'July', '2020', '2020-09-20 10:47:02', '2020-09-20 10:47:02'),
(4, 7, '34000', '20/09/2020', 'May', '2020', '2020-09-20 10:52:29', '2020-09-20 10:52:29'),
(5, 3, '26000', '20/09/2020', 'November', '2020', '2020-09-20 13:19:15', '2020-09-20 13:19:15'),
(6, 4, '30000', '20/09/2020', 'October', '2020', '2020-09-20 13:29:17', '2020-09-20 13:29:17'),
(7, 3, '26000', '20/09/2020', 'December', '2020', '2020-09-20 13:36:05', '2020-09-20 13:36:05'),
(8, 8, '24550', '20/09/2020', 'September', '2020', '2020-09-20 13:44:37', '2020-09-20 13:44:37'),
(9, 4, '30000', '20/09/2020', 'January', '2020', '2020-09-20 14:01:32', '2020-09-20 14:01:32'),
(10, 8, '24550', '30/09/2020', 'December', '2020', '2020-09-30 11:17:16', '2020-09-30 11:17:16'),
(11, 9, '34000', '30/09/2020', 'December', '2020', '2020-09-30 11:17:22', '2020-09-30 11:17:22'),
(12, 4, '30000', '30/09/2020', 'December', '2020', '2020-09-30 11:17:47', '2020-09-30 11:17:47'),
(13, 3, '26000', '30/09/2020', 'January', '2020', '2020-09-30 11:22:21', '2020-09-30 11:22:21'),
(14, 3, '26000', '30/09/2020', 'February', '2020', '2020-09-30 11:22:50', '2020-09-30 11:22:50'),
(15, 3, '26000', '30/09/2020', 'August', '2020', '2020-09-30 11:24:12', '2020-09-30 11:24:12'),
(16, 3, '26000', '03/06/2021', 'September', '2021', '2021-06-03 11:01:16', '2021-06-03 11:01:16'),
(17, 4, '30000', '03/06/2021', 'February', '2021', '2021-06-03 11:42:05', '2021-06-03 11:42:05');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shopname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `photo`, `shopname`, `created_at`, `updated_at`) VALUES
(1, 'Kajem Ali', 'kajem@gmail.com', '01733425325', '7 no road, Kadalpur Abasik', 'backend/supplier/1600360723.jpeg', 'Kajem Telecom', '2020-09-17 10:04:11', '2020-09-17 10:04:11'),
(2, 'Nowshad Alam', 'nowshad33@gmail.com', '01733490325', 'Mishanpur, Barishal.', 'backend/supplier/1600434780.jpeg', 'Missan Traders', '2020-09-17 10:08:17', '2020-09-17 10:08:17'),
(3, 'Nazim Uddin', 'Nazimhabib77@gmail.com', '01833090325', '22 no road, Rangunia', 'backend/supplier/1600360561.jpeg', 'Nazim Store', '2020-09-17 10:09:12', '2020-09-17 10:09:12'),
(4, 'Sazzad Hossen', 'sazzad@gmail.com', '01733455325', 'Modina Tower, Prosanti Abasik', 'backend/supplier/1600360735.png', 'S store', '2020-09-17 10:37:18', '2020-09-17 10:37:18'),
(5, 'Hasan Mehedi', 'hm@gmail.com', '017346465325', 'Jatra Bari, Dhaka', 'backend/supplier/1600404929.png', 'Mehedi Fashion', '2020-09-17 22:55:29', '2020-09-17 22:55:29'),
(6, 'Halima Khaton', 'halima@gmail.com', '01779427019', 'Savar, Dhaka', 'backend/supplier/1600404995.jpeg', 'Khaton\'s Kitchen', '2020-09-17 22:56:35', '2020-09-17 22:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$nQ.J0QlWLynYZOTtZdtePOWSUycOzU1riUXXTBcwUUAXyphSjK5F2', NULL, NULL, NULL),
(2, 'user', 'user@gmail.com', NULL, '$2y$10$MPrQPmM8VC/S9ewdIEHjh.5WtItLldzs9O.7aadhwp0rfl/7eQ73u', NULL, '2020-09-13 11:54:26', '2020-09-13 11:54:26'),
(3, 'demo', 'demo@gmail.com', NULL, '$2y$10$kqvWgjRvkp2j13Rc/J29zeiw3HLlEH.9CBrT7iacPWF85ABRavBAq', NULL, '2020-09-13 11:58:54', '2020-09-13 11:58:54'),
(5, 'arman', 'arman@gmail.com', NULL, '$2y$10$kHsLg1n2NXgvYz3YQQ8e8OJ9lXWHOVZZHLi6lTArdp0bqT7cpUEJu', NULL, '2020-09-14 14:48:20', '2020-09-14 14:48:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
