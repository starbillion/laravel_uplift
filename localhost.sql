-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 27, 2018 at 05:41 AM
-- Server version: 5.6.36-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `admin_taxiapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE IF NOT EXISTS `availability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sunday_from` time DEFAULT NULL,
  `sunday_to` time DEFAULT NULL,
  `monday_from` time DEFAULT NULL,
  `monday_to` time DEFAULT NULL,
  `tuesday_from` time DEFAULT NULL,
  `tuesday_to` time DEFAULT NULL,
  `wednesday_from` time DEFAULT NULL,
  `wednesday_to` time DEFAULT NULL,
  `thursday_from` time DEFAULT NULL,
  `thursday_to` time DEFAULT NULL,
  `friday_from` time DEFAULT NULL,
  `friday_to` time DEFAULT NULL,
  `saturday_from` time DEFAULT NULL,
  `saturday_to` time DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`id`, `sunday_from`, `sunday_to`, `monday_from`, `monday_to`, `tuesday_from`, `tuesday_to`, `wednesday_from`, `wednesday_to`, `thursday_from`, `thursday_to`, `friday_from`, `friday_to`, `saturday_from`, `saturday_to`, `users_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '22:30:00', '22:30:00', '03:00:00', '01:30:00', '05:00:00', '02:30:00', '05:00:00', '02:30:00', '03:00:00', '01:00:00', '02:30:00', '00:30:00', '04:30:00', '02:00:00', 1, '2018-02-25 05:27:18', '2018-02-25 13:27:18', NULL),
(4, '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', '00:00:10', 3, '2018-02-25 05:04:42', '2018-02-25 05:04:42', NULL),
(5, '01:30:00', '01:00:00', '04:00:00', '01:30:00', '06:30:00', '04:00:00', '11:00:00', '02:00:00', '20:00:00', '16:00:00', '11:00:00', '09:00:00', '21:30:00', '07:00:00', 5, '2018-02-25 05:32:59', '2018-02-25 13:32:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `backups`
--

CREATE TABLE IF NOT EXISTS `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backup_size` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `backups_name_unique` (`name`),
  UNIQUE KEY `backups_file_name_unique` (`file_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_name` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `deleted_at`, `category_name`, `created_at`, `updated_at`) VALUES
(1, '2018-02-21 23:50:38', 'Audi', '2018-02-21 16:50:38', '2018-02-26 23:50:38'),
(2, '2018-02-21 23:50:43', 'BMW', '2018-02-21 16:50:43', '2018-02-26 23:50:43'),
(3, NULL, 'Uplift_X', '2018-02-21 23:50:56', '2018-02-26 23:50:56'),
(4, NULL, 'Uplift_Lux', '2018-02-21 23:51:06', '2018-02-26 23:51:06'),
(5, '2018-02-23 00:48:38', 'Uplift_Suv', '2018-02-22 17:48:38', '2018-02-27 00:48:38'),
(6, NULL, 'Uplift_XL', '2018-02-23 00:48:53', '2018-02-27 00:48:53'),
(7, NULL, 'Uplift_Exec', '2018-02-23 00:49:08', '2018-02-27 00:49:08'),
(8, NULL, 'Uplift_WAV', '2018-02-23 00:49:30', '2018-02-27 00:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE IF NOT EXISTS `client_details` (
  `client_id` int(255) NOT NULL,
  `client_first_name` varchar(255) DEFAULT NULL,
  `client_last_name` varchar(255) DEFAULT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_phone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`client_id`, `client_first_name`, `client_last_name`, `client_email`, `client_phone`, `country_code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(0, NULL, NULL, NULL, NULL, NULL, '2018-02-21 17:12:58', '2018-02-22 01:12:58', '2018-02-22 01:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `colours`
--

CREATE TABLE IF NOT EXISTS `colours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colour_name` varchar(256) DEFAULT NULL,
  `make_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=344 ;

--
-- Dumping data for table `colours`
--

INSERT INTO `colours` (`id`, `colour_name`, `make_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'green', 4, '2018-02-22 17:53:31', '2018-02-23 00:53:31', '2018-02-23 00:53:31'),
(2, 'blue', 4, '2018-02-22 17:53:37', '2018-02-23 00:53:37', '2018-02-23 00:53:37'),
(3, 'white', 4, '2018-02-22 17:53:42', '2018-02-23 00:53:42', '2018-02-23 00:53:42'),
(4, 'Pink', 5, '2018-02-22 17:53:47', '2018-02-23 00:53:47', '2018-02-23 00:53:47'),
(5, 'Tst_coor', 5, '2018-02-22 17:53:51', '2018-02-23 00:53:51', '2018-02-23 00:53:51'),
(6, 'Ibis White', 5, '2018-02-26 10:36:55', '2018-02-26 17:36:55', NULL),
(7, 'Mythos Black Metallic', 4, '2018-02-23 00:54:23', '2018-02-23 00:54:23', NULL),
(8, 'Floret Silver Metallic', 4, '2018-02-23 01:00:21', '2018-02-23 01:00:21', NULL),
(9, 'Brilliant Black', 4, '2018-02-23 17:10:07', '2018-02-23 17:10:07', NULL),
(10, 'Argus Brown', 4, '2018-02-23 17:10:27', '2018-02-23 17:10:27', NULL),
(11, 'Cuvée Silver', 4, '2018-02-23 17:10:43', '2018-02-23 17:10:43', NULL),
(12, 'Glacier White', 4, '2018-02-23 17:10:59', '2018-02-23 17:10:59', NULL),
(13, 'Gotland Green', 4, '2018-02-23 17:11:15', '2018-02-23 17:11:15', NULL),
(14, 'Manhattan Grey', 4, '2018-02-23 17:11:27', '2018-02-23 17:11:27', NULL),
(15, 'Matador Red', 4, '2018-02-23 17:11:39', '2018-02-23 17:11:39', NULL),
(16, 'Monsoon Grey', 4, '2018-02-23 17:12:02', '2018-02-23 17:12:02', NULL),
(17, 'Moonlight Blue', 4, '2018-02-23 17:12:16', '2018-02-23 17:12:16', NULL),
(18, 'Scuba Blue', 4, '2018-02-23 17:12:43', '2018-02-23 17:12:43', NULL),
(19, 'Tango Red', 4, '2018-02-23 17:12:56', '2018-02-23 17:12:56', NULL),
(20, 'Daytona Grey Pearl', 4, '2018-02-23 17:13:11', '2018-02-23 17:13:11', NULL),
(21, 'Black', 42, '2018-02-23 17:14:26', '2018-02-23 17:14:26', NULL),
(22, 'Polar White', 42, '2018-02-23 17:14:46', '2018-02-23 17:14:46', NULL),
(23, 'Tenorite Grey', 42, '2018-02-23 17:15:04', '2018-02-23 17:15:04', NULL),
(24, 'Obsidian Black', 42, '2018-02-23 17:15:19', '2018-02-23 17:15:19', NULL),
(25, 'Diamond Silver', 42, '2018-02-23 17:15:37', '2018-02-23 17:15:37', NULL),
(26, 'Palladium Silver', 42, '2018-02-23 17:15:52', '2018-02-23 17:15:52', NULL),
(27, 'Iridium Silver', 42, '2018-02-23 17:16:07', '2018-02-23 17:16:07', NULL),
(28, 'Cavansite Blue', 42, '2018-02-23 17:16:25', '2018-02-23 17:16:25', NULL),
(29, 'Hyacinth Red ‘Designo’ ', 42, '2018-02-23 17:16:41', '2018-02-23 17:16:41', NULL),
(30, 'Diamond White', 42, '2018-02-23 17:16:59', '2018-02-23 17:16:59', NULL),
(31, 'Anthracite', 7, '2018-02-23 17:51:15', '2018-02-23 17:51:15', NULL),
(32, 'Anthracite Satin', 7, '2018-02-23 17:51:37', '2018-02-23 17:51:37', NULL),
(33, 'Beluga (Solid)', 7, '2018-02-23 17:52:00', '2018-02-23 17:52:00', NULL),
(34, 'Black Crystal', 7, '2018-02-23 17:52:20', '2018-02-23 17:52:20', NULL),
(35, 'Light Onyx', 7, '2018-02-24 13:27:29', '2018-02-24 13:27:29', NULL),
(36, 'Onyx', 7, '2018-02-24 13:27:46', '2018-02-24 13:27:46', NULL),
(37, 'Royal Ebony', 7, '2018-02-24 13:28:01', '2018-02-24 13:28:01', NULL),
(38, 'Spectre', 7, '2018-02-24 13:28:15', '2018-02-24 13:28:15', NULL),
(39, 'Storm Grey', 7, '2018-02-24 13:28:30', '2018-02-24 13:28:30', NULL),
(40, 'Titan Grey', 7, '2018-02-24 13:28:44', '2018-02-24 13:28:44', NULL),
(41, 'Aquamarine', 7, '2018-02-24 13:29:08', '2018-02-24 13:29:08', NULL),
(42, 'Black Sapphire', 7, '2018-02-24 13:29:35', '2018-02-24 13:29:35', NULL),
(43, 'Blue Crystal', 7, '2018-02-24 13:29:49', '2018-02-24 13:29:49', NULL),
(44, 'Dark Sapphire', 7, '2018-02-24 13:30:10', '2018-02-24 13:30:10', NULL),
(45, 'Fountain Blue', 7, '2018-02-24 13:30:31', '2018-02-24 13:30:31', NULL),
(46, 'Glacier Blue (Solid)', 7, '2018-02-24 13:30:47', '2018-02-24 13:30:47', NULL),
(47, 'Jetstream II', 7, '2018-02-24 13:31:14', '2018-02-24 13:31:14', NULL),
(48, 'Kingfisher', 7, '2018-02-24 13:31:37', '2018-02-24 13:31:37', NULL),
(49, 'Light Sapphire', 7, '2018-02-24 13:32:02', '2018-02-24 13:32:02', NULL),
(50, 'Light Windsor Blue', 7, '2018-02-24 13:33:56', '2018-02-24 13:33:56', NULL),
(51, 'Marlin', 7, '2018-02-24 13:34:10', '2018-02-24 13:34:10', NULL),
(52, 'Meteor', 7, '2018-02-24 13:34:24', '2018-02-24 13:34:24', NULL),
(53, 'Moroccan Blue', 7, '2018-02-24 13:34:38', '2018-02-24 13:34:38', NULL),
(54, 'Neptune', 7, '2018-02-24 13:34:55', '2018-02-24 13:34:55', NULL),
(55, 'Oxford Blue (Solid)', 7, '2018-02-24 13:35:11', '2018-02-24 13:35:11', NULL),
(56, 'Pale Sapphire', 7, '2018-02-24 13:35:31', '2018-02-24 13:35:31', NULL),
(57, 'Peacock', 7, '2018-02-24 13:35:50', '2018-02-24 13:35:50', NULL),
(58, 'Portofino', 7, '2018-02-24 13:38:03', '2018-02-24 13:38:03', NULL),
(59, 'Sequin Blue', 7, '2018-02-24 13:38:21', '2018-02-24 13:38:21', NULL),
(60, 'Silverlake', 7, '2018-02-24 13:38:36', '2018-02-24 13:38:36', NULL),
(61, 'Thunder', 7, '2018-02-24 13:38:57', '2018-02-24 13:38:57', NULL),
(62, 'Windsor Blue', 7, '2018-02-24 13:39:12', '2018-02-24 13:39:12', NULL),
(63, 'Amber', 7, '2018-02-24 13:39:36', '2018-02-24 13:39:36', NULL),
(64, 'Arabica', 7, '2018-02-24 13:39:52', '2018-02-24 13:39:52', NULL),
(65, 'Bentayga Bronze', 7, '2018-02-24 13:40:09', '2018-02-24 13:40:09', NULL),
(66, 'Brodgar', 7, '2018-02-24 13:40:25', '2018-02-24 13:40:25', NULL),
(67, 'Bronze', 7, '2018-02-24 13:40:44', '2018-02-24 13:40:44', NULL),
(68, 'Burnt Oak', 7, '2018-02-24 13:40:59', '2018-02-24 13:40:59', NULL),
(69, 'Burnt Orange', 7, '2018-02-24 13:41:13', '2018-02-24 13:41:13', NULL),
(70, 'Camel', 7, '2018-02-24 13:41:36', '2018-02-24 13:41:36', NULL),
(71, 'Dark Cashmere', 7, '2018-02-24 13:41:53', '2018-02-24 13:41:53', NULL),
(72, 'Gazelle', 7, '2018-02-24 13:42:10', '2018-02-24 13:42:10', NULL),
(73, 'Havana', 7, '2018-02-24 13:42:25', '2018-02-24 13:42:25', NULL),
(74, 'Khamun', 7, '2018-02-24 13:42:44', '2018-02-24 13:42:44', NULL),
(75, 'Light Gazelle', 7, '2018-02-24 13:42:59', '2018-02-24 13:42:59', NULL),
(76, 'Orange Flame', 7, '2018-02-24 13:43:15', '2018-02-24 13:43:15', NULL),
(77, 'Pale Brodgar', 7, '2018-02-24 13:43:29', '2018-02-24 13:43:29', NULL),
(78, 'Rose Gold', 7, '2018-02-24 13:43:50', '2018-02-24 13:43:50', NULL),
(79, 'Sandstone', 7, '2018-02-24 13:44:11', '2018-02-24 13:44:11', NULL),
(80, 'Sunburst Gold', 7, '2018-02-24 13:44:39', '2018-02-24 13:44:39', NULL),
(81, 'Alpine Green', 7, '2018-02-24 13:45:07', '2018-02-24 13:45:07', NULL),
(82, 'Apple Green', 7, '2018-02-24 13:45:21', '2018-02-24 13:45:21', NULL),
(83, 'Barnato (Solid)', 7, '2018-02-24 13:45:35', '2018-02-24 13:45:35', NULL),
(84, 'British Racing Green 4 (Solid)', 7, '2018-02-24 13:45:51', '2018-02-24 13:45:51', NULL),
(85, 'Cumbrian Green', 7, '2018-02-24 13:46:19', '2018-02-24 13:46:19', NULL),
(86, 'Cypress', 7, '2018-02-24 13:46:42', '2018-02-24 13:46:42', NULL),
(87, 'Light Emerald', 7, '2018-02-24 13:46:57', '2018-02-24 13:46:57', NULL),
(88, 'Midnight Emerald', 7, '2018-02-24 13:47:11', '2018-02-24 13:47:11', NULL),
(89, 'Radium', 7, '2018-02-24 13:47:32', '2018-02-24 13:47:32', NULL),
(90, 'Spruce', 7, '2018-02-24 13:47:45', '2018-02-24 13:47:45', NULL),
(91, 'Verdant', 7, '2018-02-24 13:48:06', '2018-02-24 13:48:06', NULL),
(92, 'Azure Purple', 7, '2018-02-24 14:08:36', '2018-02-24 14:08:36', NULL),
(93, 'Black Velvet', 7, '2018-02-24 14:08:55', '2018-02-24 14:08:55', NULL),
(94, 'Burgundy', 7, '2018-02-24 14:09:08', '2018-02-24 14:09:08', NULL),
(95, 'Candy Red', 7, '2018-02-24 14:09:22', '2018-02-24 14:09:22', NULL),
(96, 'Claret', 7, '2018-02-24 14:09:35', '2018-02-24 14:09:35', NULL),
(97, 'Damson', 7, '2018-02-24 14:10:05', '2018-02-24 14:10:05', NULL),
(98, 'Dragon Red II', 7, '2018-02-24 14:10:20', '2018-02-24 14:10:20', NULL),
(99, 'Grey Violet', 7, '2018-02-24 14:10:37', '2018-02-24 14:10:37', NULL),
(100, 'Magenta', 7, '2018-02-24 14:10:55', '2018-02-24 14:10:55', NULL),
(101, 'Pale Velvet', 7, '2018-02-24 14:11:12', '2018-02-24 14:11:12', NULL),
(102, 'Passion Pink', 7, '2018-02-24 14:11:27', '2018-02-24 14:11:27', NULL),
(103, 'Rubino Red', 7, '2018-02-24 14:11:41', '2018-02-24 14:11:41', NULL),
(104, 'St James Red (Pearlescent)', 7, '2018-02-24 14:11:57', '2018-02-24 14:11:57', NULL),
(105, 'St James Red (Solid)', 7, '2018-02-24 14:12:11', '2018-02-24 14:12:11', NULL),
(106, 'Sunset', 7, '2018-02-24 14:12:26', '2018-02-24 14:12:26', NULL),
(107, 'Violette', 7, '2018-02-24 14:12:43', '2018-02-24 14:12:43', NULL),
(108, 'Breeze', 7, '2018-02-24 14:13:22', '2018-02-24 14:13:22', NULL),
(109, 'Extreme Silver', 7, '2018-02-24 14:14:08', '2018-02-24 14:14:08', NULL),
(110, 'Extreme Silver Satin', 7, '2018-02-24 14:14:24', '2018-02-24 14:14:24', NULL),
(111, 'Dark Grey Satin', 7, '2018-02-24 14:14:43', '2018-02-24 14:14:43', NULL),
(112, 'Granite', 7, '2018-02-24 14:14:58', '2018-02-24 14:14:58', NULL),
(113, 'Hallmark', 7, '2018-02-24 14:15:14', '2018-02-24 14:15:14', NULL),
(114, 'Ice', 7, '2018-02-24 14:15:27', '2018-02-24 14:15:27', NULL),
(115, 'Light Grey Satin', 7, '2018-02-24 14:15:41', '2018-02-24 14:15:41', NULL),
(116, 'Magnetic', 7, '2018-02-24 14:16:09', '2018-02-24 14:16:09', NULL),
(117, 'Moonbeam', 7, '2018-02-24 14:16:30', '2018-02-24 14:16:30', NULL),
(118, 'Silver Frost', 7, '2018-02-24 14:16:46', '2018-02-24 14:16:46', NULL),
(119, 'Silver Storm', 7, '2018-02-24 14:17:02', '2018-02-24 14:17:02', NULL),
(120, 'Silver Taupe', 7, '2018-02-24 14:17:16', '2018-02-24 14:17:16', NULL),
(121, 'Tungsten', 7, '2018-02-24 14:17:29', '2018-02-24 14:17:29', NULL),
(122, 'Venusian Grey', 7, '2018-02-24 14:17:42', '2018-02-24 14:17:42', NULL),
(123, 'Arctica (Solid)', 7, '2018-02-24 14:18:02', '2018-02-24 14:18:02', NULL),
(124, 'Dove Grey (Solid)', 7, '2018-02-24 14:18:16', '2018-02-24 14:18:16', NULL),
(125, 'Glacier White (Solid)', 7, '2018-02-24 14:18:32', '2018-02-24 14:18:32', NULL),
(126, 'Ghost White (Pearlescent)', 7, '2018-02-24 14:18:52', '2018-02-24 14:18:52', NULL),
(127, 'Julep', 7, '2018-02-24 14:19:06', '2018-02-24 14:19:06', NULL),
(128, 'Magnolia (Solid)', 7, '2018-02-24 14:19:19', '2018-02-24 14:19:19', NULL),
(129, 'Monaco Yellow (Solid)', 7, '2018-02-24 14:19:33', '2018-02-24 14:19:33', NULL),
(130, 'Old English White (Solid)', 7, '2018-02-24 14:19:48', '2018-02-24 14:19:48', NULL),
(131, 'Porcelain', 7, '2018-02-24 14:20:06', '2018-02-24 14:20:06', NULL),
(132, 'Special Magnolia (Pearlescent)', 7, '2018-02-24 14:20:21', '2018-02-24 14:20:21', NULL),
(133, 'Special Magnolia (Solid)', 7, '2018-02-24 14:20:57', '2018-02-24 14:20:57', NULL),
(134, 'White Sand', 7, '2018-02-24 14:21:12', '2018-02-24 14:21:12', NULL),
(135, 'White Satin', 7, '2018-02-24 14:21:27', '2018-02-24 14:21:27', NULL),
(136, 'Billet Silver Metallic ', 16, '2018-02-24 14:40:17', '2018-02-24 14:40:17', NULL),
(137, 'Jazz Blue Pearl', 16, '2018-02-24 14:40:33', '2018-02-24 14:40:33', NULL),
(138, 'Molten Silver', 16, '2018-02-24 14:40:47', '2018-02-24 14:40:47', NULL),
(139, 'Bright White Clear Coat', 16, '2018-02-24 14:41:11', '2018-02-24 14:41:11', NULL),
(140, 'Brilliant Black Crystal Pearl', 16, '2018-02-24 14:42:02', '2018-02-24 14:42:02', NULL),
(141, 'Granite Crystal Metallic', 16, '2018-02-24 14:42:17', '2018-02-24 14:42:17', NULL),
(142, 'Velvet Red', 16, '2018-02-24 14:42:39', '2018-02-24 14:42:39', NULL),
(143, 'Dark Cordovan', 16, '2018-02-24 14:42:57', '2018-02-24 14:42:57', NULL),
(144, 'Tusk White Pearl Coat', 16, '2018-02-24 14:43:12', '2018-02-24 14:43:12', NULL),
(145, 'Alpine White', 6, '2018-02-24 14:45:08', '2018-02-24 14:45:08', NULL),
(146, 'Jet Black', 6, '2018-02-24 14:45:28', '2018-02-24 14:45:28', NULL),
(147, 'Mineral White', 6, '2018-02-24 14:45:44', '2018-02-24 14:45:44', NULL),
(148, 'Black Sapphire', 6, '2018-02-24 14:45:58', '2018-02-24 14:45:58', NULL),
(149, 'Glacier Silver', 6, '2018-02-24 14:46:14', '2018-02-24 14:46:14', NULL),
(150, 'Mineral Grey', 6, '2018-02-24 14:46:30', '2018-02-24 14:46:30', NULL),
(151, 'Melbourne Red Metallic', 6, '2018-02-24 14:46:44', '2018-02-24 14:46:44', NULL),
(152, 'Imperial Blue Xirallic', 6, '2018-02-24 14:46:58', '2018-02-24 14:46:58', NULL),
(153, 'Jatoba', 6, '2018-02-24 14:47:13', '2018-02-24 14:47:13', NULL),
(154, 'Platinum Silver', 6, '2018-02-24 14:47:28', '2018-02-24 14:47:28', NULL),
(155, 'Mediterranean Blue', 6, '2018-02-24 14:47:42', '2018-02-24 14:47:42', NULL),
(156, 'Estoril Blue', 6, '2018-02-24 14:47:58', '2018-02-24 14:47:58', NULL),
(157, 'Citrine black', 6, '2018-02-24 14:48:14', '2018-02-24 14:48:14', NULL),
(158, 'Champagne Quartz', 6, '2018-02-24 14:48:29', '2018-02-24 14:48:29', NULL),
(159, 'Tanzanite Blue', 6, '2018-02-24 14:48:45', '2018-02-24 14:48:45', NULL),
(160, 'Smoked Topaz', 6, '2018-02-24 14:49:00', '2018-02-24 14:49:00', NULL),
(161, 'Polar White', 50, '2018-02-24 14:59:47', '2018-02-24 14:59:47', NULL),
(162, 'Onyx Black', 50, '2018-02-24 15:00:03', '2018-02-24 15:00:03', NULL),
(163, 'Ruby Red', 50, '2018-02-24 15:00:20', '2018-02-24 15:00:20', NULL),
(164, 'Cumulus Grey', 50, '2018-02-24 15:00:36', '2018-02-24 15:00:36', NULL),
(165, 'Lazuli Blue', 50, '2018-02-24 15:00:52', '2018-02-24 15:00:52', NULL),
(166, 'Soft Sand', 50, '2018-02-24 15:01:10', '2018-02-24 15:01:10', NULL),
(167, 'Shark Grey Metallic', 50, '2018-02-24 15:01:28', '2018-02-24 15:01:28', NULL),
(168, 'Glacier White', 51, '2018-02-24 15:03:09', '2018-02-24 15:03:09', NULL),
(169, 'Azurite Blue', 51, '2018-02-24 15:03:26', '2018-02-24 15:03:26', NULL),
(170, 'Cinder Red', 51, '2018-02-24 15:03:42', '2018-02-24 15:03:42', NULL),
(171, 'Pearl Black', 51, '2018-02-24 15:03:59', '2018-02-24 15:03:59', NULL),
(172, 'Mercury Grey', 51, '2018-02-24 15:04:15', '2018-02-24 15:04:15', NULL),
(173, 'Cosmos Blue', 51, '2018-02-24 15:04:31', '2018-02-24 15:04:31', NULL),
(174, 'Stone', 51, '2018-02-24 15:04:46', '2018-02-24 15:04:46', NULL),
(175, 'Blazer Blue', 18, '2018-02-24 15:26:23', '2018-02-24 15:26:23', NULL),
(176, 'Race Red', 18, '2018-02-24 15:26:45', '2018-02-24 15:26:45', NULL),
(177, 'Frozen White', 18, '2018-02-24 15:27:03', '2018-02-24 15:27:03', NULL),
(178, 'Deep Impact Blue', 18, '2018-02-24 15:27:21', '2018-02-24 15:27:21', NULL),
(179, 'Moondust Silver', 18, '2018-02-24 15:27:48', '2018-02-24 15:27:48', NULL),
(180, 'Magnetic', 18, '2018-02-24 15:28:39', '2018-02-24 15:28:39', NULL),
(181, 'Shadow Black', 18, '2018-02-24 15:28:57', '2018-02-24 15:28:57', NULL),
(182, 'Blue Wave', 18, '2018-02-24 15:29:19', '2018-02-24 15:29:19', NULL),
(183, 'Ruby Red', 18, '2018-02-24 15:29:45', '2018-02-24 15:29:45', NULL),
(184, 'Chrome Copper', 18, '2018-02-24 15:30:03', '2018-02-24 15:30:03', NULL),
(185, 'Bohai Bay Mint', 18, '2018-02-24 15:30:22', '2018-02-24 15:30:22', NULL),
(186, 'Deep Ocean Blue', 20, '2018-02-24 21:36:33', '2018-02-24 21:36:33', NULL),
(187, 'Alabaster Silver', 20, '2018-02-24 23:38:17', '2018-02-25 06:38:17', NULL),
(188, 'Golden Bronze', 20, '2018-02-24 21:37:06', '2018-02-24 21:37:06', NULL),
(189, 'Polished Metal', 20, '2018-02-24 21:37:22', '2018-02-24 21:37:22', NULL),
(190, 'Twilight Blue', 20, '2018-02-24 21:37:39', '2018-02-24 21:37:39', NULL),
(191, 'Urban Titanium', 20, '2018-02-24 21:37:57', '2018-02-24 21:37:57', NULL),
(192, 'Crystal Black', 20, '2018-02-24 21:38:15', '2018-02-24 21:38:15', NULL),
(193, 'Passion Red', 20, '2018-02-24 21:38:31', '2018-02-24 21:38:31', NULL),
(194, 'White Orchid', 20, '2018-02-24 21:38:48', '2018-02-24 21:38:48', NULL),
(195, 'Polar White', 21, '2018-02-24 21:42:23', '2018-02-24 21:42:23', NULL),
(196, 'Ara Blue', 21, '2018-02-24 21:42:39', '2018-02-24 21:42:39', NULL),
(197, 'Platinum Silver', 21, '2018-02-24 21:42:56', '2018-02-24 21:42:56', NULL),
(198, 'White Sand', 21, '2018-02-24 21:43:14', '2018-02-24 21:43:14', NULL),
(199, 'Ash Blue', 21, '2018-02-24 21:43:34', '2018-02-24 21:43:34', NULL),
(200, 'Ultimate Red', 21, '2018-02-24 21:43:52', '2018-02-24 21:43:52', NULL),
(201, 'Ruby Wine', 21, '2018-02-24 21:44:08', '2018-02-24 21:44:08', NULL),
(202, 'Moon Rock', 21, '2018-02-24 21:44:24', '2018-02-24 21:44:24', NULL),
(203, 'Thunder Grey', 21, '2018-02-24 21:44:44', '2018-02-24 21:44:44', NULL),
(204, 'Phantom Black', 21, '2018-02-24 21:45:00', '2018-02-24 21:45:00', NULL),
(205, 'Pure White', 21, '2018-02-24 21:45:32', '2018-02-24 21:45:32', NULL),
(206, 'Morning Blue', 21, '2018-02-24 21:46:13', '2018-02-24 21:46:13', NULL),
(207, 'Sleek Silver', 21, '2018-02-24 21:46:29', '2018-02-24 21:46:29', NULL),
(208, 'Stardust Grey', 21, '2018-02-24 21:46:45', '2018-02-24 21:46:45', NULL),
(209, 'Black Diamond', 21, '2018-02-24 21:47:00', '2018-02-24 21:47:00', NULL),
(210, 'Aqua sparkling', 21, '2018-02-24 21:47:19', '2018-02-24 21:47:19', NULL),
(211, 'Iced coffee', 21, '2018-02-24 21:47:36', '2018-02-24 21:47:36', NULL),
(212, 'Passion red', 21, '2018-02-24 21:48:52', '2018-02-24 21:48:52', NULL),
(213, 'Phantom black', 21, '2018-02-24 21:49:13', '2018-02-24 21:49:13', NULL),
(214, ' MOONLIGHT WHITE', 22, '2018-02-24 21:53:51', '2018-02-24 21:53:51', NULL),
(215, 'BLADE SILVER', 22, '2018-02-24 21:54:08', '2018-02-24 21:54:08', NULL),
(216, 'GRAPHITE SHADOW', 22, '2018-02-24 21:54:22', '2018-02-24 21:54:22', NULL),
(217, 'MALBEC BLACK', 22, '2018-02-24 21:54:37', '2018-02-24 21:54:37', NULL),
(218, 'MAGNETIC RED', 22, '2018-02-24 21:54:52', '2018-02-24 21:54:52', NULL),
(219, 'CHESTNUT BRONZE', 22, '2018-02-24 21:55:06', '2018-02-24 21:55:06', NULL),
(220, 'INK BLUE', 22, '2018-02-24 21:55:21', '2018-02-24 21:55:21', NULL),
(221, 'LIQUID COPPER', 22, '2018-02-24 21:55:35', '2018-02-24 21:55:35', NULL),
(222, 'BLACK OBSIDIAN', 22, '2018-02-24 21:55:49', '2018-02-24 21:55:49', NULL),
(223, 'Ebony Black', 25, '2018-02-24 22:11:04', '2018-02-24 22:11:04', NULL),
(224, 'Horizon Blue', 25, '2018-02-24 22:15:15', '2018-02-24 22:15:15', NULL),
(225, ' Remington Red', 25, '2018-02-24 22:15:31', '2018-02-24 22:15:31', NULL),
(226, 'Sangria', 25, '2018-02-24 22:15:47', '2018-02-24 22:15:47', NULL),
(227, 'Smokey Blue', 25, '2018-02-24 22:16:12', '2018-02-24 22:16:12', NULL),
(228, 'Snow White Pearl', 25, '2018-02-24 22:17:12', '2018-02-24 22:17:12', NULL),
(229, 'Sparkling Silver', 25, '2018-02-24 22:17:48', '2018-02-24 22:17:48', NULL),
(230, 'Titanium Silver', 25, '2018-02-24 22:18:13', '2018-02-24 22:18:13', NULL),
(231, 'Clear White', 25, '2018-02-24 22:19:40', '2018-02-24 22:19:40', NULL),
(232, 'Hyper Red', 25, '2018-02-24 22:20:34', '2018-02-24 22:20:34', NULL),
(233, 'Burnished Copper', 25, '2018-02-24 22:21:25', '2018-02-24 22:21:25', NULL),
(234, 'Pacific Blue', 25, '2018-02-24 22:23:17', '2018-02-24 22:23:17', NULL),
(235, 'Mineral Silver', 25, '2018-02-24 22:23:38', '2018-02-24 22:23:38', NULL),
(236, ' Black Cherry', 25, '2018-02-24 22:23:55', '2018-02-24 22:23:55', NULL),
(237, 'Appletree Green', 5, '2018-02-25 06:46:14', '2018-02-25 06:46:14', NULL),
(238, 'Concours Blue', 5, '2018-02-25 06:46:41', '2018-02-25 06:46:41', NULL),
(239, 'Kopi Bronze', 5, '2018-02-25 06:47:03', '2018-02-25 06:47:03', NULL),
(240, 'Hammerhead Silver', 5, '2018-02-25 06:47:17', '2018-02-25 06:47:17', NULL),
(241, 'Selene Bronze', 5, '2018-02-25 06:47:56', '2018-02-25 06:47:56', NULL),
(242, 'Lightning Silver', 5, '2018-02-25 06:48:16', '2018-02-25 06:48:16', NULL),
(243, 'Mariana Blue', 5, '2018-02-25 06:48:28', '2018-02-25 06:48:28', NULL),
(244, 'Marron Black', 5, '2018-02-25 06:48:50', '2018-02-25 06:48:50', NULL),
(245, 'Onyx Black', 5, '2018-02-25 06:49:03', '2018-02-25 06:49:03', NULL),
(246, 'Quantum Silver', 5, '2018-02-25 06:49:22', '2018-02-25 06:49:22', NULL),
(247, 'Silver Blonde', 5, '2018-02-25 06:49:42', '2018-02-25 06:49:42', NULL),
(248, 'Stratus White', 5, '2018-02-25 06:49:54', '2018-02-25 06:49:54', NULL),
(249, 'Volcano Red', 5, '2018-02-25 06:50:14', '2018-02-25 06:50:14', NULL),
(250, 'Arizona Bronze', 5, '2018-02-25 06:50:30', '2018-02-25 06:50:30', NULL),
(251, 'Ocellus Teal', 5, '2018-02-25 06:50:49', '2018-02-25 06:50:49', NULL),
(252, 'Divine Red', 5, '2018-02-25 06:51:05', '2018-02-25 06:51:05', NULL),
(253, 'Sea Storm', 5, '2018-02-25 06:51:23', '2018-02-25 06:51:23', NULL),
(254, 'Arden Green', 5, '2018-02-25 06:51:34', '2018-02-25 06:51:34', NULL),
(255, 'Intense Blue', 5, '2018-02-25 06:51:48', '2018-02-25 06:51:48', NULL),
(256, 'Jet Black', 5, '2018-02-25 06:52:15', '2018-02-25 06:52:15', NULL),
(257, 'Midnight Blue', 5, '2018-02-25 06:52:27', '2018-02-25 06:52:27', NULL),
(258, 'Silver Fox', 5, '2018-02-25 06:52:38', '2018-02-25 06:52:38', NULL),
(259, 'China Grey', 5, '2018-02-25 06:52:48', '2018-02-25 06:52:48', NULL),
(260, 'Magnetic Silver', 5, '2018-02-25 06:53:01', '2018-02-25 06:53:01', NULL),
(261, 'Lunar White', 5, '2018-02-25 06:53:13', '2018-02-25 06:53:13', NULL),
(262, 'Morning Frost White', 5, '2018-02-25 06:53:33', '2018-02-25 06:53:33', NULL),
(263, 'Skyfall Silver', 5, '2018-02-25 06:53:49', '2018-02-25 06:53:49', NULL),
(264, 'Ultramarine Black', 5, '2018-02-25 06:54:11', '2018-02-25 06:54:11', NULL),
(265, 'Sunburst Yellow', 5, '2018-02-25 06:54:26', '2018-02-25 06:54:26', NULL),
(266, 'Yellow Tang', 5, '2018-02-25 06:54:40', '2018-02-25 06:54:40', NULL),
(267, 'Diavolo Red', 5, '2018-02-25 06:54:57', '2018-02-25 06:54:57', NULL),
(271, 'Narvik Black', 26, '2018-02-26 20:29:21', '2018-02-26 20:29:21', NULL),
(272, 'Fuji White', 26, '2018-02-26 20:29:25', '2018-02-26 20:29:25', NULL),
(273, 'Santorini Black', 26, '2018-02-26 20:29:28', '2018-02-26 20:29:28', NULL),
(274, 'Yulong White', 26, '2018-02-26 20:29:12', '2018-02-26 20:29:12', NULL),
(275, 'Corris Grey', 26, '2018-02-26 20:29:10', '2018-02-26 20:29:10', NULL),
(276, 'Indus Silver', 26, '2018-02-26 20:29:07', '2018-02-26 20:29:07', NULL),
(277, 'Loire Blue', 26, '2018-02-26 20:29:05', '2018-02-26 20:29:05', NULL),
(278, 'Rossello Red', 26, '2018-02-26 20:29:02', '2018-02-26 20:29:02', NULL),
(279, 'Byron Blue', 26, '2018-02-26 20:29:00', '2018-02-26 20:29:00', NULL),
(280, 'Aruba', 26, '2018-02-26 20:28:58', '2018-02-26 20:28:58', NULL),
(281, 'Carpathian Grey', 26, '2018-02-26 20:28:54', '2018-02-26 20:28:54', NULL),
(282, 'Silicon Silver', 26, '2018-02-26 20:28:51', '2018-02-26 20:28:51', NULL),
(283, 'Borealis Black - Ultra Metallic', 26, '2018-02-26 20:28:49', '2018-02-26 20:28:49', NULL),
(284, 'Bosphorus Grey - Ultra Metallic', 26, '2018-02-26 20:28:47', '2018-02-26 20:28:47', NULL),
(285, 'British Racing Green - Ultra Metallic', 26, '2018-02-26 20:28:44', '2018-02-26 20:28:44', NULL),
(286, 'Ligurian Black - Ultra Metallic', 26, '2018-02-26 20:28:42', '2018-02-26 20:28:42', NULL),
(287, 'Desire - Ultra Metallic', 26, '2018-02-26 20:28:40', '2018-02-26 20:28:40', NULL),
(288, 'Ethereal - Ultra Metallic', 26, '2018-02-26 20:28:36', '2018-02-26 20:28:36', NULL),
(289, 'Flux - Ultra Metallic', 26, '2018-02-26 20:28:34', '2018-02-26 20:28:34', NULL),
(290, 'Verbier Silver - Ultra Metallic', 26, '2018-02-26 20:28:31', '2018-02-26 20:28:31', NULL),
(291, 'Windward Grey - Ultra Metallic', 26, '2018-02-26 20:28:29', '2018-02-26 20:28:29', NULL),
(292, 'Mescalito Black - Ultra Metallic', 26, '2018-02-26 20:28:26', '2018-02-26 20:28:26', NULL),
(293, 'Rio Gold - Ultra Metallic', 26, '2018-02-26 20:28:24', '2018-02-26 20:28:24', NULL),
(294, 'Scafell Grey - Ultra Metallic', 26, '2018-02-26 20:28:21', '2018-02-26 20:28:21', NULL),
(295, 'Madagascar Orange - Ultra Metallic', 26, '2018-02-26 20:28:19', '2018-02-26 20:28:19', NULL),
(296, 'Balmoral Blue - Ultra Metallic', 26, '2018-02-26 20:28:16', '2018-02-26 20:28:16', NULL),
(297, 'Velocity - Ultra Metallic', 26, '2018-02-26 20:28:13', '2018-02-26 20:28:13', NULL),
(298, 'Meribel White Pearl - Pearlescent', 26, '2018-02-26 20:28:11', '2018-02-26 20:28:11', NULL),
(299, 'Valloire White Pearl - Pearlescent', 26, '2018-02-26 20:28:08', '2018-02-26 20:28:08', NULL),
(300, 'Spectral Blue - ChromaFlair', 26, '2018-02-26 20:28:05', '2018-02-26 20:28:05', NULL),
(301, 'test', 5, '2018-02-26 10:37:19', '2018-02-26 17:37:19', '2018-02-26 17:37:19'),
(302, 'Spectral British Racing Green - ChromaFlair', 26, '2018-02-27 11:58:18', '2018-02-27 11:58:18', NULL),
(303, 'Spectral Racing Red - ChromaFlair', 26, '2018-02-27 11:59:29', '2018-02-27 11:59:29', NULL),
(304, 'STORM WHITE', 32, '2018-02-27 12:30:41', '2018-02-27 12:30:41', NULL),
(305, 'UNIVERSAL SILVER', 32, '2018-02-27 12:30:58', '2018-02-27 12:30:58', NULL),
(306, 'GUN METALLIC', 32, '2018-02-27 12:31:18', '2018-02-27 12:31:18', NULL),
(307, 'EBISU BLACK', 32, '2018-02-27 12:31:35', '2018-02-27 12:31:35', NULL),
(308, 'PALATIAL RUBY', 32, '2018-02-27 12:32:02', '2018-02-27 12:32:02', NULL),
(309, 'TITANIUM OLIVE', 32, '2018-02-27 12:32:22', '2018-02-27 12:32:22', NULL),
(310, 'PICADOR BROWN', 32, '2018-02-27 12:32:55', '2018-02-27 12:32:55', NULL),
(311, 'SAPPHIRE BLUE', 32, '2018-02-27 12:33:10', '2018-02-27 12:33:10', NULL),
(312, 'MONARCH ORANGE', 32, '2018-02-27 12:33:26', '2018-02-27 12:33:26', NULL),
(313, 'CHILLI PEPPER', 32, '2018-02-27 12:33:44', '2018-02-27 12:33:44', NULL),
(314, 'ARCTIC WHITE', 32, '2018-02-27 12:36:17', '2018-02-27 12:36:17', NULL),
(315, 'CHESTNUT BRONZE', 32, '2018-02-27 12:37:28', '2018-02-27 12:37:28', NULL),
(316, 'BLADE SILVER', 32, '2018-02-27 12:39:19', '2018-02-27 12:39:19', NULL),
(317, 'MAGNETIC RED', 32, '2018-02-27 12:39:38', '2018-02-27 12:39:38', NULL),
(318, 'FLAME RED', 32, '2018-02-27 12:41:52', '2018-02-27 12:41:52', NULL),
(319, 'VIVID BLUE', 32, '2018-02-27 12:42:15', '2018-02-27 12:42:15', NULL),
(320, 'PEARL BLACK', 32, '2018-02-27 12:42:41', '2018-02-27 12:42:41', NULL),
(321, 'INK BLUE', 32, '2018-02-27 12:43:19', '2018-02-27 12:43:19', NULL),
(322, 'NIGHTSHADE', 32, '2018-02-27 12:43:45', '2018-02-27 12:43:45', NULL),
(323, 'SUNRISE ORANGE', 31, '2018-02-27 12:51:23', '2018-02-27 12:51:23', NULL),
(324, 'WHITE', 31, '2018-02-27 12:51:44', '2018-02-27 12:51:44', NULL),
(325, 'WINE RED', 31, '2018-02-27 12:52:02', '2018-02-27 12:52:02', NULL),
(326, 'CYBER BLUE', 31, '2018-02-27 12:52:17', '2018-02-27 12:52:17', NULL),
(327, 'RED PLANET', 31, '2018-02-27 12:52:33', '2018-02-27 12:52:33', NULL),
(328, 'BLACK', 31, '2018-02-27 12:52:51', '2018-02-27 12:52:51', NULL),
(329, 'WHITE SOLID', 31, '2018-02-27 12:53:32', '2018-02-27 12:53:32', NULL),
(330, 'STARLIGHT', 31, '2018-02-27 12:53:48', '2018-02-27 12:53:48', NULL),
(331, 'STERLING SILVER', 31, '2018-02-27 12:54:03', '2018-02-27 12:54:03', NULL),
(332, 'RED', 31, '2018-02-27 12:54:21', '2018-02-27 12:54:21', NULL),
(333, 'IRONBARK', 31, '2018-02-27 12:54:40', '2018-02-27 12:54:40', NULL),
(334, 'TITANIUM', 31, '2018-02-27 12:54:59', '2018-02-27 12:54:59', NULL),
(335, 'Frost White', 32, '2018-02-27 06:35:13', '2018-02-27 13:35:13', '2018-02-27 13:35:13'),
(336, 'Frost White', 31, '2018-02-27 13:35:35', '2018-02-27 13:35:35', NULL),
(337, 'Cool Silver', 31, '2018-02-27 13:36:01', '2018-02-27 13:36:01', NULL),
(338, 'Granite Brown', 31, '2018-02-27 13:36:18', '2018-02-27 13:36:18', NULL),
(339, 'Orient Red', 31, '2018-02-27 13:36:38', '2018-02-27 13:36:38', NULL),
(340, 'Atlantic Grey', 31, '2018-02-27 13:36:58', '2018-02-27 13:36:58', NULL),
(341, 'White Pearl', 31, '2018-02-27 13:37:21', '2018-02-27 13:37:21', NULL),
(342, 'Amethyst Black', 31, '2018-02-27 13:37:44', '2018-02-27 13:37:44', NULL),
(343, 'Frost WhiteTanzanite Blue', 31, '2018-02-27 13:39:00', '2018-02-27 13:39:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tags` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `color` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departments_name_unique` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `tags`, `color`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Administration', '[]', '#000', NULL, '2018-01-30 14:40:22', '2018-01-30 14:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE IF NOT EXISTS `drivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` int(10) unsigned NOT NULL,
  `mobile_number` int(10) unsigned NOT NULL,
  `profile_pic` int(11) NOT NULL,
  `make` int(10) unsigned NOT NULL DEFAULT '1',
  `model` int(10) unsigned NOT NULL DEFAULT '1',
  `colour` int(11) NOT NULL,
  `registration` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `upload_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `upload_mot_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `license` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `pco_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `insurance_doc` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_3` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `town` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` decimal(50,0) DEFAULT NULL,
  `country_code` decimal(50,0) DEFAULT NULL,
  `phv_expire_date` date DEFAULT NULL,
  `mot_issue_date` date DEFAULT NULL,
  `license_expire_date` date DEFAULT NULL,
  `pco_expire_date` date DEFAULT NULL,
  `insurance_expire_date` date DEFAULT NULL,
  `license_pic` int(11) DEFAULT NULL,
  `county` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypt_user_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`profile_pic`),
  UNIQUE KEY `drivers_email_unique` (`email`),
  KEY `drivers_make_foreign` (`make`),
  KEY `drivers_model_foreign` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Male',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_birth` date NOT NULL DEFAULT '1990-01-01',
  `date_hire` date NOT NULL,
  `date_left` date NOT NULL DEFAULT '1990-01-01',
  `salary_cur` decimal(15,3) NOT NULL DEFAULT '0.000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`),
  KEY `employees_dept_foreign` (`dept`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `designation`, `gender`, `mobile`, `mobile2`, `email`, `dept`, `city`, `address`, `about`, `date_birth`, `date_hire`, `date_left`, `salary_cur`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Marc Francis', 'Super Admin', 'Male', '8888888888', '', 'marc.francis@uplift.vip', 1, 'Pune', 'Karve nagar, Pune 411030', 'About user / biography', '2018-01-30', '2018-01-30', '2018-01-30', '0.000', NULL, '2018-01-30 15:30:57', '2018-01-30 15:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `fare`
--

CREATE TABLE IF NOT EXISTS `fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `fare_name` varchar(256) DEFAULT NULL,
  `fare_price` decimal(10,0) DEFAULT NULL,
  `fare_duration` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fare_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `fare`
--

INSERT INTO `fare` (`id`, `users_id`, `is_deleted`, `plan_id`, `fare_name`, `fare_price`, `fare_duration`, `fare_status`) VALUES
(1, 1, 0, 1, 'Plane', '500', '2018-02-25 05:34:13', 'Tpe'),
(2, 5, 0, 2, 'Plane', '1231', '2018-02-25 05:34:15', 'Tpe'),
(3, 7, 0, 3, 'Plane', '500', '2018-02-25 05:45:07', 'Tpe'),
(4, 10, 0, 4, 'Plane', '1231', '2018-02-25 05:45:09', 'Tpe'),
(5, 16, 0, 5, 'Plane', '500', '2018-02-25 05:45:10', 'Tpe'),
(6, 12, 0, 2, 'Plane', '1231', '2018-02-25 05:34:44', 'Tpe'),
(7, 14, 0, 1, 'Plane', '500', '2018-02-25 05:34:45', 'Tpe'),
(8, 15, 0, 2, 'Plane', '1231', '2018-02-25 05:34:46', 'Tpe'),
(9, 11, 0, 1, 'Plane', '500', '2018-02-25 05:34:48', 'Tpe'),
(10, 9, 0, 2, 'Plane', '1231', '2018-02-25 05:34:50', 'Tpe'),
(11, 5, 0, 1, 'Plan', '50', '2018-02-25 05:34:57', 'Type');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_messages`
--

CREATE TABLE IF NOT EXISTS `home_page_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `welcome_title` varchar(500) DEFAULT NULL,
  `welcome_message` varchar(5000) DEFAULT NULL,
  `quote_title` varchar(500) DEFAULT NULL,
  `update_title` varchar(500) DEFAULT NULL,
  `update_message` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `quote_message` varchar(500) DEFAULT NULL,
  `welcome_logo` varchar(11) DEFAULT NULL,
  `quote_logo` varchar(11) DEFAULT NULL,
  `welcome_footer` varchar(50) DEFAULT NULL,
  `update_footer` varchar(50) DEFAULT NULL,
  `quote_footer` varchar(50) DEFAULT NULL,
  `update_logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `home_page_messages`
--

INSERT INTO `home_page_messages` (`id`, `welcome_title`, `welcome_message`, `quote_title`, `update_title`, `update_message`, `created_at`, `updated_at`, `deleted_at`, `quote_message`, `welcome_logo`, `quote_logo`, `welcome_footer`, `update_footer`, `quote_footer`, `update_logo`) VALUES
(1, 'welcomeTitle123', 'welcome message1', 'quote title1', 'update title1', 'update message1', '2018-02-23 18:48:20', '2018-02-23 18:48:20', NULL, 'qutoe message1', '0', '0', '', '', 'quote_footer', ''),
(2, 'welcome title', 'welcome message', 'quote title', 'update title', 'update message', '2018-02-24 02:50:41', '2018-02-24 02:50:41', NULL, 'quote message', 'new welcome', 'quote logo', 'welcome footer', 'update footer', 'new quote', 'update logo');

-- --------------------------------------------------------

--
-- Table structure for table `information_cards`
--

CREATE TABLE IF NOT EXISTS `information_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_subject` varchar(256) DEFAULT NULL,
  `card_message` varchar(256) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `information_cards`
--

INSERT INTO `information_cards` (`id`, `card_subject`, `card_message`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 'a', 'asd', '2018-02-23 07:05:14', '2018-02-22 23:05:14', '2018-02-23 07:05:14'),
(2, 'corve', 'enter', '2018-02-24 00:44:16', '2018-02-23 16:44:16', '2018-02-24 00:44:16'),
(3, 'asd', 'asdasdasd', '2018-02-24 00:44:29', '2018-02-24 00:44:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `la_configs`
--

CREATE TABLE IF NOT EXISTS `la_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `la_configs`
--

INSERT INTO `la_configs` (`id`, `key`, `section`, `value`, `created_at`, `updated_at`) VALUES
(1, 'sitename', '', 'Uplift 1.0', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(2, 'sitename_part1', '', 'Lara', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(3, 'sitename_part2', '', 'Admin 1.0', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(4, 'sitename_short', '', 'LA', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(5, 'site_description', '', 'LaraAdmin is a open-source Laravel Admin Panel for quick-start Admin based applications and boilerplate for CRM or CMS systems.', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(6, 'sidebar_search', '', '1', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(7, 'show_messages', '', '1', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(8, 'show_notifications', '', '1', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(9, 'show_tasks', '', '1', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(10, 'show_rightsidebar', '', '1', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(11, 'skin', '', 'skin-white', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(12, 'layout', '', 'fixed', '2018-01-30 14:40:23', '2018-01-30 14:40:23'),
(13, 'default_email', '', 'test@example.com', '2018-01-30 14:40:23', '2018-01-30 14:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `la_menus`
--

CREATE TABLE IF NOT EXISTS `la_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'module',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `hierarchy` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `la_menus`
--

INSERT INTO `la_menus` (`id`, `name`, `url`, `icon`, `type`, `parent`, `hierarchy`, `created_at`, `updated_at`) VALUES
(1, 'Team', '#', 'fa-group', 'custom', 0, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(2, 'Users', 'users', 'fa-group', 'module', 1, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(3, 'Uploads', 'uploads', 'fa-files-o', 'module', 0, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(4, 'Departments', 'departments', 'fa-tags', 'module', 1, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(5, 'Employees', 'employees', 'fa-group', 'module', 1, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(6, 'Roles', 'roles', 'fa-user-plus', 'module', 1, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(7, 'Organizations', 'organizations', 'fa-university', 'module', 0, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(8, 'Permissions', 'permissions', 'fa-magic', 'module', 1, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(9, 'Drivers', 'drivers', 'fa-cube', 'module', 0, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(10, 'Plans_names', 'plans_names', 'fa-cube', 'module', 0, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(11, 'User_roles', 'user_roles', 'fa-cube', 'module', 0, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(12, 'User_registrations', 'user_registrations', 'fa-cube', 'module', 0, 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(13, 'Categories', 'categories', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:24'),
(14, 'Models', 'modelns', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:45'),
(15, 'Makes', 'makes', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(16, 'Home_Page_Messages', 'home_page_messages', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(17, 'Passengers', 'passengers', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(18, 'Information_Cards', 'information_cards', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(19, 'Colours', 'colours', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(20, 'Overtime_Hourly_Fares', 'overtime_hourly_fares', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(21, 'Passenger_Subscriptions', 'passenger_subscriptions', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(22, 'Passenger_Taxes', 'passenger_taxes', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20'),
(23, 'Subcriptions', 'subcriptions', 'fa-cube', 'module', 0, 0, '2018-02-19 05:54:20', '2018-02-19 05:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE IF NOT EXISTS `make` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `make_name` varchar(256) DEFAULT NULL,
  `make_value` varchar(256) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`id`, `make_name`, `make_value`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 'asdf1', 'asdasdads', '2018-02-21 23:51:30', '2018-02-21 16:51:30', '2018-02-21 23:51:30'),
(2, 'sadf', '1234', '2018-02-21 23:51:35', '2018-02-21 16:51:35', '2018-02-21 23:51:35'),
(3, 'asd', 'asda', '2018-02-21 23:51:40', '2018-02-21 16:51:40', '2018-02-21 23:51:40'),
(4, 'AUDI', '1', '2018-02-26 12:14:40', '2018-02-26 12:14:40', NULL),
(5, 'ASTON MARTIN', '2', '2018-02-21 23:52:11', '2018-02-21 23:52:11', NULL),
(6, 'BMW', '3', '2018-02-21 23:52:26', '2018-02-21 23:52:26', NULL),
(7, 'BENTLEY', '4', '2018-02-21 23:52:43', '2018-02-21 23:52:43', NULL),
(8, 'BUGATTI', '5', '2018-02-24 01:00:21', '2018-02-23 18:00:21', '2018-02-23 18:00:21'),
(9, 'CADILLAC', '6', '2018-02-24 14:27:48', '2018-02-24 07:27:48', '2018-02-24 07:27:48'),
(10, 'CHEVROLET', '7', '2018-02-24 01:02:04', '2018-02-23 18:02:04', '2018-02-23 18:02:04'),
(11, 'Jaguar', '8', '2018-02-23 17:00:17', '2018-02-23 17:00:17', NULL),
(12, 'ROLLS ROYCE', '9', '2018-02-23 17:00:47', '2018-02-23 17:00:47', NULL),
(13, 'MCLAREN', '10', '2018-02-23 17:01:09', '2018-02-23 17:01:09', NULL),
(14, 'Dodge', '11', '2018-02-23 17:01:35', '2018-02-23 17:01:35', NULL),
(15, 'Ferrari', '12', '2018-02-23 17:01:53', '2018-02-23 17:01:53', NULL),
(16, 'Chrysler', '13', '2018-02-23 17:02:16', '2018-02-23 17:02:16', NULL),
(17, 'FIAT', '14', '2018-02-24 15:12:05', '2018-02-24 08:12:05', '2018-02-24 08:12:05'),
(18, 'Ford', '14', '2018-02-23 17:02:50', '2018-02-23 17:02:50', NULL),
(19, 'GMC', '', '2018-02-23 17:03:20', '2018-02-23 17:03:20', NULL),
(20, 'Honda', '', '2018-02-23 17:03:42', '2018-02-23 17:03:42', NULL),
(21, 'Hyundai', '', '2018-02-23 17:03:54', '2018-02-23 17:03:54', NULL),
(22, 'Infiniti', '', '2018-02-23 17:04:05', '2018-02-23 17:04:05', NULL),
(23, 'Jeep', '', '2018-02-23 17:04:15', '2018-02-23 17:04:15', NULL),
(24, 'Lamborghini', '', '2018-02-23 17:04:25', '2018-02-23 17:04:25', NULL),
(25, 'Kia', '', '2018-02-23 17:04:35', '2018-02-23 17:04:35', NULL),
(26, 'Land Rover', '', '2018-02-23 17:04:46', '2018-02-23 17:04:46', NULL),
(27, 'Lexus', '', '2018-02-23 17:04:58', '2018-02-23 17:04:58', NULL),
(28, 'Maserati', '', '2018-02-23 17:05:08', '2018-02-23 17:05:08', NULL),
(29, 'Mazda', '', '2018-02-23 17:05:18', '2018-02-23 17:05:18', NULL),
(30, 'Mini', '', '2018-02-23 17:05:29', '2018-02-23 17:05:29', NULL),
(31, 'Mitsubishi', '', '2018-02-23 17:05:41', '2018-02-23 17:05:41', NULL),
(32, 'Nissan', '', '2018-02-23 17:05:51', '2018-02-23 17:05:51', NULL),
(33, 'Peugeot', '', '2018-02-23 17:06:03', '2018-02-23 17:06:03', NULL),
(34, 'Porsche', '', '2018-02-23 17:06:13', '2018-02-23 17:06:13', NULL),
(35, 'Renault', '', '2018-02-23 17:06:25', '2018-02-23 17:06:25', NULL),
(36, 'Saab', '', '2018-02-23 17:06:33', '2018-02-23 17:06:33', NULL),
(37, 'Suzuki', '', '2018-02-23 17:06:44', '2018-02-23 17:06:44', NULL),
(38, 'Toyota', '', '2018-02-23 17:06:54', '2018-02-23 17:06:54', NULL),
(39, 'Volkswagen', '', '2018-02-23 17:07:02', '2018-02-23 17:07:02', NULL),
(40, 'Volvo', '', '2018-02-23 17:07:12', '2018-02-23 17:07:12', NULL),
(41, 'Tesla', '', '2018-02-23 17:07:28', '2018-02-23 17:07:28', NULL),
(42, 'Mercedes', '', '2018-02-23 17:14:07', '2018-02-23 17:14:07', NULL),
(43, 'SUBARU', '', '2018-02-23 18:07:45', '2018-02-23 18:07:45', NULL),
(44, 'VAUXHALL', '', '2018-02-23 18:09:39', '2018-02-23 18:09:39', NULL),
(45, 'SSANGYONG', '', '2018-02-23 18:16:09', '2018-02-23 18:16:09', NULL),
(46, 'SKODA', '', '2018-02-23 18:19:05', '2018-02-23 18:19:05', NULL),
(47, 'SEAT', '', '2018-02-23 18:22:04', '2018-02-23 18:22:04', NULL),
(48, 'ROVER', '', '2018-02-23 18:26:24', '2018-02-23 18:26:24', NULL),
(49, 'PROTON', '', '2018-02-23 18:40:12', '2018-02-23 18:40:12', NULL),
(50, 'CITROEN', '', '2018-02-24 14:59:22', '2018-02-24 14:59:22', NULL),
(51, 'DACIA', '', '2018-02-24 15:02:12', '2018-02-24 15:02:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_05_26_050000_create_modules_table', 1),
('2014_05_26_055000_create_module_field_types_table', 1),
('2014_05_26_060000_create_module_fields_table', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2014_12_01_000000_create_uploads_table', 1),
('2016_05_26_064006_create_departments_table', 1),
('2016_05_26_064007_create_employees_table', 1),
('2016_05_26_064446_create_roles_table', 1),
('2016_07_05_115343_create_role_user_table', 1),
('2016_07_06_140637_create_organizations_table', 1),
('2016_07_07_134058_create_backups_table', 1),
('2016_07_07_134058_create_menus_table', 1),
('2016_09_10_163337_create_permissions_table', 1),
('2016_09_10_163520_create_permission_role_table', 1),
('2016_09_22_105958_role_module_fields_table', 1),
('2016_09_22_110008_role_module_table', 1),
('2016_10_06_115413_create_la_configs_table', 1),
('2017_07_25_070930_create_drivers_table', 1),
('2017_09_05_122711_create_plans_names_table', 1),
('2017_09_08_093033_create_user_roles_table', 1),
('2017_09_08_114420_create_user_registrations_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `model_id` int(255) NOT NULL AUTO_INCREMENT,
  `make_id` int(255) DEFAULT NULL,
  `category` varchar(256) DEFAULT NULL,
  `model_value` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`model_id`, `make_id`, `category`, `model_value`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 4, '4', 'Audi A1', '2018-02-23 03:00:57', '2018-02-23 10:00:57', '2018-02-23 10:00:57'),
(7, 4, '4', 'Audi A1 Sports ', '2018-02-23 03:01:03', '2018-02-23 10:01:03', '2018-02-23 10:01:03'),
(8, 6, '5', 'X5', '2018-02-23 17:22:30', '2018-02-24 00:22:30', '2018-02-24 00:22:30'),
(9, 7, '4', 'FLYING SPUR', '2018-02-23 17:22:38', '2018-02-24 00:22:38', '2018-02-24 00:22:38'),
(10, 7, '4', 'MULSANNE', '2018-02-23 17:22:47', '2018-02-24 00:22:47', '2018-02-24 00:22:47'),
(11, 6, '3', '2 SERIES ACTIVE TOURER', '2018-02-23 03:13:33', '2018-02-23 10:13:33', '2018-02-23 03:13:33'),
(12, 6, '3', '2 SERIES GRAN TOURER', '2018-02-23 03:12:39', '2018-02-23 10:12:39', '2018-02-23 03:12:39'),
(13, 10, '3', 'CAPTIVA', '2018-02-23 17:22:23', '2018-02-24 00:22:23', '2018-02-24 00:22:23'),
(14, 5, '3', 'A4', '2018-02-26 10:34:31', '2018-02-26 17:34:31', NULL),
(15, 4, '3', 'A5 Sportback', '2018-02-23 10:04:12', '2018-02-23 10:04:12', NULL),
(16, 4, '7', 'A6', '2018-02-23 10:04:37', '2018-02-23 10:04:37', NULL),
(17, 4, '7', 'A7', '2018-02-23 10:06:43', '2018-02-23 10:06:43', NULL),
(18, 4, '4', 'A8', '2018-02-23 10:07:25', '2018-02-23 10:07:25', NULL),
(19, 4, '3', 'Q3', '2018-02-23 10:08:42', '2018-02-23 10:08:42', NULL),
(20, 4, '3', 'Q5', '2018-02-23 10:09:15', '2018-02-23 10:09:15', NULL),
(21, 4, '3', 'Q7', '2018-02-23 10:09:52', '2018-02-23 10:09:52', NULL),
(22, 6, '3', '3 Series', '2018-02-23 10:11:18', '2018-02-23 10:11:18', NULL),
(23, 6, '3', '4 Series', '2018-02-23 10:11:42', '2018-02-23 10:11:42', NULL),
(24, 6, '7', '5 Series', '2018-02-23 10:12:05', '2018-02-23 10:12:05', NULL),
(25, 6, '3', '2 SERIES ACTIVE TOURER', '2018-02-23 10:14:34', '2018-02-23 10:14:34', NULL),
(26, 6, '3', '2 SERIES GRAN TOURER', '2018-02-23 10:14:54', '2018-02-23 10:14:54', NULL),
(27, 6, '7', '6 Series', '2018-02-23 10:16:02', '2018-02-23 10:16:02', NULL),
(28, 6, '4', '7 Series', '2018-02-23 10:16:19', '2018-02-23 10:16:19', NULL),
(29, 4, '3', 'Q5', '2018-02-24 00:22:06', '2018-02-24 00:22:06', NULL),
(30, 7, '4', 'FLYING SPUR', '2018-02-24 00:24:46', '2018-02-24 00:24:46', NULL),
(31, 7, '4', 'MULSANNE', '2018-02-24 00:25:04', '2018-02-24 00:25:04', NULL),
(32, 6, '3', 'X1', '2018-02-24 00:26:31', '2018-02-24 00:26:31', NULL),
(33, 6, '3', 'X3', '2018-02-24 00:32:07', '2018-02-24 00:32:07', NULL),
(34, 6, '6', 'X5', '2018-02-24 00:32:26', '2018-02-24 00:32:26', NULL),
(35, 6, '7', 'X6', '2018-02-24 00:35:46', '2018-02-24 00:35:46', NULL),
(36, 10, '3', 'CAPTIVA', '2018-02-24 00:36:16', '2018-02-24 00:36:16', NULL),
(37, 10, '3', 'CRUZE', '2018-02-24 00:36:38', '2018-02-24 00:36:38', NULL),
(38, 10, '3', 'EPICA', '2018-02-24 00:37:06', '2018-02-24 00:37:06', NULL),
(39, 10, '6', 'ORLANDO', '2018-02-24 00:37:37', '2018-02-24 00:37:37', NULL),
(40, 16, '6', 'GRAND VOYAGER', '2018-02-24 00:38:30', '2018-02-24 00:38:30', NULL),
(41, 40, '3', 'XC90', '2018-02-24 00:42:22', '2018-02-24 00:42:22', NULL),
(42, 40, '3', 'XC60', '2018-02-24 00:43:12', '2018-02-24 00:43:12', NULL),
(43, 40, '4', 'V90', '2018-02-24 00:43:49', '2018-02-24 00:43:49', NULL),
(44, 40, '7', 'V60', '2018-02-24 00:44:31', '2018-02-24 00:44:31', NULL),
(45, 40, '3', 'V50', '2018-02-24 00:45:06', '2018-02-24 00:45:06', NULL),
(46, 40, '3', 'V40', '2018-02-24 00:45:28', '2018-02-24 00:45:28', NULL),
(47, 40, '4', 'S90', '2018-02-24 00:46:06', '2018-02-24 00:46:06', NULL),
(48, 40, '7', 'S80', '2018-02-24 00:46:38', '2018-02-24 00:46:38', NULL),
(49, 40, '3', 'S60', '2018-02-24 00:47:10', '2018-02-24 00:47:10', NULL),
(50, 40, '3', 'S40', '2018-02-24 00:47:35', '2018-02-24 00:47:35', NULL),
(51, 39, '6', 'TRANSPORTER', '2018-02-24 00:48:03', '2018-02-24 00:48:03', NULL),
(52, 39, '6', 'TOURAN', '2018-02-24 00:48:35', '2018-02-24 00:48:35', NULL),
(53, 39, '3', 'TOUAREG', '2018-02-24 00:49:24', '2018-02-24 00:49:24', NULL),
(54, 39, '3', 'TIGUAN', '2018-02-24 00:49:52', '2018-02-24 00:49:52', NULL),
(55, 39, '6', 'SURAN', '2018-02-24 00:50:19', '2018-02-24 00:50:19', NULL),
(56, 39, '6', 'SHARAN', '2018-02-24 00:50:44', '2018-02-24 00:50:44', NULL),
(57, 39, '4', 'PHAETON', '2018-02-24 00:51:05', '2018-02-24 00:51:05', NULL),
(58, 39, '7', 'PASSAT ', '2018-02-24 00:52:02', '2018-02-24 00:52:02', NULL),
(59, 39, '3', 'JETTA', '2018-02-24 00:52:35', '2018-02-24 00:52:35', NULL),
(60, 39, '3', 'GOLF SPORTWAGEN', '2018-02-24 00:53:14', '2018-02-24 00:53:14', NULL),
(61, 39, '3', 'GOLF ESTATE', '2018-02-24 00:53:45', '2018-02-24 00:53:45', NULL),
(62, 39, '7', 'CC', '2018-02-24 00:54:06', '2018-02-24 00:54:06', NULL),
(63, 39, '6', 'CARAVELLE', '2018-02-24 00:54:49', '2018-02-24 00:54:49', NULL),
(64, 39, '8', 'CADDY', '2018-02-24 00:55:09', '2018-02-24 00:55:09', NULL),
(65, 39, '3', 'BORA', '2018-02-24 00:55:36', '2018-02-24 00:55:36', NULL),
(66, 38, '3', 'VERSO', '2018-02-24 00:56:43', '2018-02-24 00:56:43', NULL),
(67, 38, '3', 'RAV4', '2018-02-24 00:57:08', '2018-02-24 00:57:08', NULL),
(68, 38, '6', 'PROACE', '2018-02-24 00:57:39', '2018-02-24 00:57:39', NULL),
(69, 38, '3', 'PRIUS+', '2018-02-24 00:58:13', '2018-02-24 00:58:13', NULL),
(70, 38, '3', 'PRIUS', '2018-02-24 00:58:35', '2018-02-24 00:58:35', NULL),
(71, 38, '6', 'PREVIA', '2018-02-24 00:58:56', '2018-02-24 00:58:56', NULL),
(72, 38, '6', 'ESTIMA', '2018-02-24 00:59:21', '2018-02-24 00:59:21', NULL),
(73, 38, '3', 'CAMRY', '2018-02-24 00:59:41', '2018-02-24 00:59:41', NULL),
(74, 38, '3', 'AVENSIS', '2018-02-24 01:00:07', '2018-02-24 01:00:07', NULL),
(75, 38, '3', 'AURIS TOURING SPORTS', '2018-02-24 01:00:31', '2018-02-24 01:00:31', NULL),
(76, 38, '3', 'AURIS ', '2018-02-24 01:01:37', '2018-02-24 01:01:37', NULL),
(77, 41, '6', 'MODEL X', '2018-02-24 01:02:17', '2018-02-24 01:02:17', NULL),
(78, 41, '3', 'MODEL 3', '2018-02-24 01:04:01', '2018-02-24 01:04:01', NULL),
(79, 41, '7', 'MODEL S', '2018-02-24 01:04:53', '2018-02-24 01:04:53', NULL),
(80, 43, '3', 'LEGACY', '2018-02-24 01:10:42', '2018-02-24 01:10:42', NULL),
(81, 44, '3', 'ANTARA', '2018-02-24 01:12:09', '2018-02-24 01:12:09', NULL),
(82, 44, '3', 'ASTRA', '2018-02-24 01:12:35', '2018-02-24 01:12:35', NULL),
(83, 44, '3', 'SIGNUM', '2018-02-24 01:13:36', '2018-02-24 01:13:36', NULL),
(84, 44, '3', 'VECTRA', '2018-02-24 01:13:54', '2018-02-24 01:13:54', NULL),
(85, 44, '6', 'VIVARO', '2018-02-24 01:14:28', '2018-02-24 01:14:28', NULL),
(86, 44, '6', 'ZAFIRA', '2018-02-24 01:14:47', '2018-02-24 01:14:47', NULL),
(87, 45, '6', 'TURISMO', '2018-02-24 01:16:43', '2018-02-24 01:16:43', NULL),
(88, 45, '6', 'RODIUS', '2018-02-24 01:17:54', '2018-02-24 01:17:54', NULL),
(89, 46, '7', 'SUPERB', '2018-02-24 01:19:26', '2018-02-24 01:19:26', NULL),
(90, 46, '3', 'RAPID SPACEBACK', '2018-02-24 01:20:08', '2018-02-24 01:20:08', NULL),
(91, 46, '3', 'RAPID', '2018-02-24 01:20:33', '2018-02-24 01:20:33', NULL),
(92, 46, '3', 'OCTAVIA', '2018-02-24 01:20:55', '2018-02-24 01:20:55', NULL),
(93, 46, '3', 'KODIAQ', '2018-02-24 01:21:28', '2018-02-24 01:21:28', NULL),
(94, 47, '6', 'X-PERIENCE', '2018-02-24 01:22:41', '2018-02-24 01:22:41', NULL),
(95, 47, '6', 'TOLEDO', '2018-02-24 01:23:06', '2018-02-24 01:23:06', NULL),
(96, 47, '3', 'LEON ST', '2018-02-24 01:23:47', '2018-02-24 01:23:47', NULL),
(97, 47, '6', 'EXEO', '2018-02-24 01:24:12', '2018-02-24 01:24:12', NULL),
(98, 47, '3', 'ALTEA XL', '2018-02-24 01:24:59', '2018-02-24 01:24:59', NULL),
(99, 47, '6', 'ALHAMBRA', '2018-02-24 01:25:17', '2018-02-24 01:25:17', NULL),
(100, 48, '3', '75', '2018-02-24 01:27:29', '2018-02-24 01:27:29', NULL),
(101, 12, '4', 'PHANTOM', '2018-02-24 01:27:52', '2018-02-24 01:27:52', NULL),
(102, 12, '4', 'GHOST', '2018-02-24 01:28:12', '2018-02-24 01:28:12', NULL),
(103, 35, '6', 'TRAFIC', '2018-02-24 01:29:06', '2018-02-24 01:29:06', NULL),
(104, 35, '3', 'MEGANE ESTATE', '2018-02-24 01:30:01', '2018-02-24 01:30:01', NULL),
(105, 35, '3', 'MEGANE ESTATE', '2018-02-23 18:32:03', '2018-02-24 01:32:03', '2018-02-24 01:32:03'),
(106, 35, '3', 'MEGANE ESTATE', '2018-02-23 18:31:48', '2018-02-24 01:31:48', '2018-02-24 01:31:48'),
(107, 35, '3', 'MEGANE', '2018-02-24 01:31:17', '2018-02-24 01:31:17', NULL),
(108, 35, '3', 'LAGUNA', '2018-02-24 01:33:24', '2018-02-24 01:33:24', NULL),
(109, 35, '6', 'GRAND SCENIC', '2018-02-24 01:35:33', '2018-02-24 01:35:33', NULL),
(110, 35, '3', 'FLUENCE', '2018-02-24 01:38:40', '2018-02-24 01:38:40', NULL),
(111, 35, '6', 'ESPACE', '2018-02-24 01:39:03', '2018-02-24 01:39:03', NULL),
(112, 49, '3', 'PERSONA', '2018-02-24 01:40:42', '2018-02-24 01:40:42', NULL),
(113, 49, '3', 'GEN-2', '2018-02-24 01:41:17', '2018-02-24 01:41:17', NULL),
(114, 34, '4', 'PANAMERA', '2018-02-24 01:41:54', '2018-02-24 01:41:54', NULL),
(115, 34, '3', 'MACAN', '2018-02-24 01:42:40', '2018-02-24 01:42:40', NULL),
(116, 34, '3', 'CAYENNE', '2018-02-24 01:43:16', '2018-02-24 01:43:16', NULL),
(117, 33, '6', 'TRAVELLER', '2018-02-24 01:43:46', '2018-02-24 01:43:46', NULL),
(118, 33, '8', 'PARTNER', '2018-02-24 01:44:52', '2018-02-24 01:44:52', NULL),
(119, 33, '6', 'EXPERT TEPEE', '2018-02-24 01:45:30', '2018-02-24 01:45:30', NULL),
(120, 33, '6', 'EXPERT', '2018-02-24 01:46:00', '2018-02-24 01:46:00', NULL),
(121, 33, '6', 'EUROBUS', '2018-02-24 01:46:15', '2018-02-24 01:46:15', NULL),
(122, 33, '8', 'E7', '2018-02-24 01:46:46', '2018-02-24 01:46:46', NULL),
(123, 33, '8', 'BIPPER', '2018-02-24 01:47:06', '2018-02-24 01:47:06', NULL),
(124, 33, '6', '807', '2018-02-24 01:47:29', '2018-02-24 01:47:29', NULL),
(125, 33, '7', '607', '2018-02-24 01:47:54', '2018-02-24 01:47:54', NULL),
(126, 33, '3', '508 SW', '2018-02-24 01:48:25', '2018-02-24 01:48:25', NULL),
(127, 33, '7', '508', '2018-02-24 01:49:01', '2018-02-24 01:49:01', NULL),
(128, 33, '6', '5008', '2018-02-24 01:49:23', '2018-02-24 01:49:23', NULL),
(129, 33, '3', '407', '2018-02-24 01:49:53', '2018-02-24 01:49:53', NULL),
(130, 33, '3', '4007', '2018-02-24 01:50:19', '2018-02-24 01:50:19', NULL),
(131, 33, '3', '308 SW', '2018-02-24 01:50:38', '2018-02-24 01:50:38', NULL),
(132, 33, '3', '308', '2018-02-24 01:51:03', '2018-02-24 01:51:03', NULL),
(133, 33, '3', '3008', '2018-02-24 01:51:20', '2018-02-24 01:51:20', NULL),
(134, 5, '4', 'Rapide S', '2018-02-25 13:44:31', '2018-02-25 13:44:31', NULL),
(135, 5, '6', 'test', '2018-02-26 10:36:16', '2018-02-26 17:36:16', '2018-02-26 17:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `module_field_types`
--

CREATE TABLE IF NOT EXISTS `module_field_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `module_field_types`
--

INSERT INTO `module_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Address', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(2, 'Checkbox', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(3, 'Currency', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(4, 'Date', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(5, 'Datetime', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(6, 'Decimal', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(7, 'Dropdown', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(8, 'Email', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(9, 'File', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(10, 'Float', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(11, 'HTML', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(12, 'Image', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(13, 'Integer', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(14, 'Mobile', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(15, 'Multiselect', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(16, 'Name', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(17, 'Password', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(18, 'Radio', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(19, 'String', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(20, 'Taginput', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(21, 'Textarea', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(22, 'TextField', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(23, 'URL', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(24, 'Files', '2018-01-30 14:40:22', '2018-01-30 14:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `module_fields`
--

CREATE TABLE IF NOT EXISTS `module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `colname` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module` int(10) unsigned NOT NULL,
  `field_type` int(10) unsigned NOT NULL,
  `unique` tinyint(1) NOT NULL DEFAULT '0',
  `defaultvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `popup_vals` text COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_fields_module_foreign` (`module`),
  KEY `module_fields_field_type_foreign` (`field_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=176 ;

--
-- Dumping data for table `module_fields`
--

INSERT INTO `module_fields` (`id`, `colname`, `label`, `module`, `field_type`, `unique`, `defaultvalue`, `minlength`, `maxlength`, `required`, `popup_vals`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'name', 'Name', 1, 16, 0, '', 5, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(2, 'context_id', 'Context', 1, 13, 0, '0', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(3, 'email', 'Email', 1, 8, 1, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(4, 'password', 'Password', 1, 17, 0, '', 6, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(5, 'type', 'User Type', 1, 7, 0, 'Employee', 0, 0, 0, '["Employee","Client"]', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(6, 'name', 'Name', 2, 16, 0, '', 5, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(7, 'path', 'Path', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(8, 'extension', 'Extension', 2, 19, 0, '', 0, 20, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(9, 'caption', 'Caption', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(10, 'user_id', 'Owner', 2, 7, 0, '1', 0, 0, 0, '@users', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(11, 'hash', 'Hash', 2, 19, 0, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(12, 'public', 'Is Public', 2, 2, 0, '0', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(13, 'name', 'Name', 3, 16, 1, '', 1, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(14, 'tags', 'Tags', 3, 20, 0, '[]', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(15, 'color', 'Color', 3, 19, 0, '', 0, 50, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(16, 'name', 'Name', 4, 16, 0, '', 5, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(17, 'designation', 'Designation', 4, 19, 0, '', 0, 50, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(18, 'gender', 'Gender', 4, 18, 0, 'Male', 0, 0, 1, '["Male","Female"]', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(19, 'mobile', 'Mobile', 4, 14, 0, '', 10, 20, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(20, 'mobile2', 'Alternative Mobile', 4, 14, 0, '', 10, 20, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(21, 'email', 'Email', 4, 8, 1, '', 5, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(22, 'dept', 'Department', 4, 7, 0, '0', 0, 0, 1, '@departments', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(23, 'city', 'City', 4, 19, 0, '', 0, 50, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(24, 'address', 'Address', 4, 1, 0, '', 0, 1000, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(25, 'about', 'About', 4, 19, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(26, 'date_birth', 'Date of Birth', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(27, 'date_hire', 'Hiring Date', 4, 4, 0, 'date(''Y-m-d'')', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(28, 'date_left', 'Resignation Date', 4, 4, 0, '1990-01-01', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(29, 'salary_cur', 'Current Salary', 4, 6, 0, '0.0', 0, 2, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(30, 'name', 'Name', 5, 16, 1, '', 1, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(31, 'display_name', 'Display Name', 5, 19, 0, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(32, 'description', 'Description', 5, 21, 0, '', 0, 1000, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(33, 'parent', 'Parent Role', 5, 7, 0, '1', 0, 0, 0, '@roles', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(34, 'dept', 'Department', 5, 7, 0, '1', 0, 0, 0, '@departments', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(35, 'name', 'Name', 6, 16, 1, '', 5, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(36, 'email', 'Email', 6, 8, 1, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(37, 'phone', 'Phone', 6, 14, 0, '', 0, 20, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(38, 'website', 'Website', 6, 23, 0, 'http://', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(39, 'assigned_to', 'Assigned to', 6, 7, 0, '0', 0, 0, 0, '@employees', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(40, 'connect_since', 'Connected Since', 6, 4, 0, 'date(''Y-m-d'')', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(41, 'address', 'Address', 6, 1, 0, '', 0, 1000, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(42, 'city', 'City', 6, 19, 0, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(43, 'description', 'Description', 6, 21, 0, '', 0, 1000, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(44, 'profile_image', 'Profile Image', 6, 12, 0, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(45, 'profile', 'Company Profile', 6, 9, 0, '', 0, 250, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(46, 'name', 'Name', 7, 16, 1, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(47, 'file_name', 'File Name', 7, 19, 1, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(48, 'backup_size', 'File Size', 7, 19, 0, '0', 0, 10, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(49, 'name', 'Name', 8, 16, 1, '', 1, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(50, 'display_name', 'Display Name', 8, 19, 0, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(51, 'description', 'Description', 8, 21, 0, '', 0, 1000, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(52, 'first_name', 'FirstName', 9, 22, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(53, 'email', 'Email', 9, 8, 1, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(54, 'country', 'Country', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(55, 'telephone', 'Telephone Number', 9, 13, 0, '', 0, 11, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(56, 'mobile_number', 'Mobile Number', 9, 13, 0, '', 0, 11, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(57, 'profile_pic', 'Upload Photo', 9, 12, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(58, 'make', 'Make', 9, 7, 0, '', 0, 0, 1, '@make', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(59, 'model', 'Model', 9, 7, 0, '', 0, 0, 1, '@model', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(60, 'colour', 'Colour\r\n\r\n\r\n', 9, 7, 0, '', 0, 0, 1, '@colours', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(61, 'registration', 'Registration', 9, 22, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(62, 'upload_doc', 'Upload PHV Doc', 9, 24, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(63, 'upload_mot_doc', 'Upload M.O.T. Doc', 9, 24, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(64, 'license', 'Driver''s Licence', 9, 24, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(65, 'pco_doc', 'Driver', 9, 24, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(66, 'insurance_doc', 'Driver insurance doc', 9, 24, 0, '', 0, 0, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(67, 'last_name', 'LastName', 9, 22, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(68, 'password', 'Password', 9, 17, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(69, 'plan_name', 'Plan Name', 10, 22, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(70, 'hour_ride', 'Hourly Ride', 10, 22, 0, '', 0, 11, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(71, 'type', 'Type', 10, 7, 0, '', 0, 0, 1, '["duration","mile"]', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(72, 'plan_price', 'Price', 10, 3, 0, '', 0, 11, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(73, 'user_role', 'Name', 11, 19, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(74, 'first_name', 'First Name', 12, 19, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(75, 'last_name', 'Last Name', 12, 19, 0, '', 0, 256, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(76, 'email', 'Email', 12, 19, 1, '', 0, 250, 1, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(77, 'phone', 'Phone', 12, 13, 0, '', 0, 11, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(78, 'user_role', 'User Role', 12, 7, 0, '', 0, 0, 1, '@user_roles', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(79, 'password', 'Password', 12, 17, 0, '', 0, 256, 0, '', 0, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(80, 'status', 'Status', 9, 7, 0, 'Reject', 0, 256, 0, '["Approved","Reject","Suspend"]', 0, '2018-02-18 18:52:33', '2018-02-18 18:52:39'),
(81, 'address_line_1', 'Address_Line_1', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:25'),
(82, 'address_line_2', 'Address_Line_2', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:25'),
(83, 'address_line_3', 'Address_Line_3', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(84, 'town', 'Town', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(85, 'city', 'City', 9, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(86, 'postcode', 'PostCode', 9, 6, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(87, 'country_code', 'CountryCode', 9, 6, 0, '', 0, 5, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(88, 'phv_expire_date', 'ExpireDate', 9, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(89, 'mot_issue_date', 'IssueDate', 9, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(90, 'license_expire_date', 'LicenseExpireDate', 9, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(91, 'pco_expire_date', 'PCOExpireDate', 9, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(92, 'insurance_expire_date', 'InsuranceExpireDate', 9, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(93, 'license_pic', 'LicensePic', 9, 12, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(94, 'name', 'Name', 9, 22, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(95, 'category_name', 'CategoryName', 13, 22, 0, '', 1, 256, 1, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(96, 'model_value', 'Model Name', 14, 22, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(164, 'quote_footer', 'Quote Footer', 16, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(98, 'category', 'Category', 14, 7, 0, '', 0, 0, 0, '@categories', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(99, 'category', 'Category', 10, 7, 0, '', 0, 0, 0, '@categories', 1, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(100, 'hour_ride', 'Hour_ride', 10, 22, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(167, 'license', 'Driver''s License', 1, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(102, 'type', 'Type', 10, 7, 0, '', 0, 256, 0, '["duration","mile"]', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(103, 'make_id', 'Make ', 14, 7, 0, '', 0, 256, 0, '@make', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(160, 'welcome_logo', 'Welcome Logo', 16, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(106, 'make_name', 'MakeName', 15, 22, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(162, 'welcome_footer', 'WelcomeFooter', 16, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(111, 'welcome_title', 'Welcome Title', 16, 22, 0, '', 0, 500, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(112, 'welcome_message', 'Welcome Message', 16, 22, 0, '', 0, 5000, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(113, 'quote_title', 'Quote_title', 16, 22, 0, '', 0, 500, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(114, 'quote_message', 'Quote_Message', 16, 22, 0, '', 0, 500, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(115, 'update_title', 'Update Title', 16, 22, 0, '', 0, 500, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(116, 'update_message', 'Update Message', 16, 22, 0, '', 0, 500, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(117, 'client_first_name', 'First name', 17, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(118, 'client_last_name', 'Client_Last_Name', 17, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(119, 'client_email', 'Client_Email', 17, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(120, 'client_phone', 'Client_Phone', 17, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(122, 'country_code', 'Country_Code', 17, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(123, 'status', 'Status', 1, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(124, 'county', 'County', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(125, 'county', 'County', 9, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(126, 'encrypt_user_id', 'EncryptUserID', 9, 19, 0, '', 0, 256, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(127, 'address_line_1', 'Address_Line_1', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(128, 'address_line_2', 'Address_Line_2', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(129, 'address_line_3', 'Address_Line_3', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(130, 'country', 'Country', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(131, 'first_name', 'FirstName', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(132, 'last_name', 'LastName', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(133, 'town', 'Town', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(134, 'city', 'City', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(135, 'postcode', 'PostCode', 1, 6, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(136, 'telephone', 'Telephone Number', 1, 13, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(137, 'mobile_number', 'MobileNumber', 1, 13, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(138, 'country_code', 'CountryCode', 1, 6, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(139, 'profile_pic', 'UploadPhoto', 1, 12, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(140, 'make', 'Make', 1, 7, 0, '', 0, 50, 0, '@make', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(141, 'model', 'Model', 1, 7, 0, '', 0, 50, 0, '@model', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(142, 'colour', 'Colour', 1, 7, 0, '', 0, 50, 0, '@colours', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(143, 'registration', 'Registration', 1, 19, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(144, 'upload_doc', 'Upload PHV Doc', 1, 9, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(145, 'upload_mot_doc', 'Upload M.O.T. Doc', 1, 24, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(146, 'licence', 'Driver''s Licence', 1, 24, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(147, 'pco_doc', 'Driver', 1, 24, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(148, 'insurance_doc', 'Driver insurance doc', 1, 24, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(149, 'license_pic', 'LicensePic', 1, 12, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(150, 'phv_expire_date', 'ExpireDate', 1, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(151, 'mot_issue_date', 'IssueDate', 1, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(152, 'license_expire_date', 'LicenseExpireDate', 1, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(153, 'pco_expire_date', 'PCOExpireDate', 1, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(154, 'insurance_expire_date', 'InsuranceExpireDate', 1, 4, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(156, 'card_subject', 'Subject', 18, 22, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(157, 'card_message', 'Message', 18, 22, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(158, 'colour_name', 'Colour', 19, 22, 0, '', 0, 50, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(159, 'make_id', 'Make', 19, 7, 0, '', 0, 50, 0, '@make', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(163, 'quote_logo', 'Quote Logo', 16, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(165, 'update_logo', 'Update Logo', 16, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(166, 'update_footer', 'Update Footer', 16, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(168, 'overtime_hourly_fare', 'Overtime_Hourly_Fare', 20, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(169, 'overtime_price', 'Overtime_Price', 20, 10, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(170, 'subscription_price', 'Subscription_Price', 21, 6, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(171, 'subscription_driver', 'Subscription_Driver', 21, 6, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(172, 'vat', 'Vat(%)', 22, 10, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(173, 'subscription_name', 'Subscription_Name', 23, 22, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(174, 'commission', 'Commission', 23, 10, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22'),
(175, 'subscription_amount', 'Subscription_Amount', 23, 10, 0, '', 0, 0, 0, '', 0, '2018-02-19 06:00:22', '2018-02-19 06:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_db` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `view_col` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fa_icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa-cube',
  `is_gen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `label`, `name_db`, `view_col`, `model`, `controller`, `fa_icon`, `is_gen`, `created_at`, `updated_at`) VALUES
(1, 'Users', 'Users', 'users', 'name', 'User', 'UsersController', 'fa-group', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(2, 'Uploads', 'Uploads', 'uploads', 'name', 'Upload', 'UploadsController', 'fa-files-o', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(3, 'Departments', 'Departments', 'departments', 'name', 'Department', 'DepartmentsController', 'fa-tags', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(4, 'Employees', 'Employees', 'employees', 'name', 'Employee', 'EmployeesController', 'fa-group', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(5, 'Roles', 'Roles', 'roles', 'name', 'Role', 'RolesController', 'fa-user-plus', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(6, 'Organizations', 'Organizations', 'organizations', 'name', 'Organization', 'OrganizationsController', 'fa-university', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(7, 'Backups', 'Backups', 'backups', 'name', 'Backup', 'BackupsController', 'fa-hdd-o', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(8, 'Permissions', 'Permissions', 'permissions', 'name', 'Permission', 'PermissionsController', 'fa-magic', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(9, 'Drivers', 'Drivers', 'drivers', 'password', 'Driver', 'DriversController', 'fa-cube', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(10, 'Plans_names', 'Plans_names', 'plans_names', 'plan_price', 'Plans_name', 'Plans_namesController', 'fa-cube', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(11, 'User_roles', 'User_roles', 'user_roles', 'name', 'User_role', 'User_rolesController', 'fa-cube', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(12, 'User_registrations', 'User_registrations', 'user_registrations', 'password', 'User_registration', 'User_registrationsController', 'fa-cube', 1, '2018-01-30 14:40:22', '2018-01-30 14:40:23'),
(13, 'Categories', 'Categories', 'categories', 'password', 'Category', 'CategoriesController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:51'),
(14, 'Modelns', 'Modelns', 'model', 'name', 'Modeln', 'ModelnsController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:51'),
(15, 'Makes', 'Makes', 'make', 'name', 'Make', 'MakesController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:51'),
(16, 'Home_Page_Messages', 'Home_Page_Messages', 'home_page_messages', 'name', 'Home_Page_Message', 'Home_Page_MessagesController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:51'),
(17, 'Passengers', 'Passengers', 'client_details', 'name', 'Passenger', 'PassengersController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42'),
(18, 'Information_Cards', 'Information_Cards', 'information_cards', 'name', 'Information_card', 'Information_cardsController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42'),
(19, 'Colours', 'Colours', 'colours', 'name', 'Colour', 'ColoursController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42'),
(20, 'Overtime_Hourly_Fares', 'Overtime_Hourly_Fares', 'overtime_hourly_fares', 'overtime_price', 'Overtime_Hourly_fare', 'Overtime_Hourly_faresController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42'),
(21, 'Passenger_Subscriptions', 'Passenger_Subscriptions', 'passenger_subscriptions', 'subscription_driver', 'Passenger_Subscription', 'Passenger_SubscriptionsController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42'),
(22, 'Passenger_Taxes', 'Passenger_Taxes', 'passenger_taxes', 'vat', 'Passenger_Tax', 'Passenger_TaxesController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42'),
(23, 'Subcriptions', 'Subcriptions', 'subcriptions', 'subscription_name', 'Subscription', 'SubcriptionsController', 'fa-cube', 1, '2018-02-19 04:55:42', '2018-02-19 04:55:42');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE IF NOT EXISTS `organizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://',
  `assigned_to` int(10) unsigned NOT NULL DEFAULT '1',
  `connect_since` date NOT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `profile` blob NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_name_unique` (`name`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  KEY `organizations_assigned_to_foreign` (`assigned_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `email`, `phone`, `website`, `assigned_to`, `connect_since`, `address`, `city`, `description`, `profile_image`, `profile`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'aasdasd', 'asd@asdasd.coim', '123123123', 'http://www.www', 1, '2018-02-19', 'asdasdasdasd', 'asdasdasd', 'asdasdasd', 'Penguins.jpg', 0x30, NULL, '2018-02-20 04:11:16', '2018-02-25 06:03:57'),
(2, 'asdasd', 'asd@a', '123123', 'http://wwww.asdasd', 1, '2018-02-19', 'asdasd', 'asdasd', 'asdasdasd', 'Koala.jpg', 0x30, '2018-02-25 06:04:03', '2018-02-20 08:55:54', '2018-02-25 06:04:03'),
(3, 'name123', 'email@email', '123456', 'http://www.www', 1, '2018-02-09', 'addressadsf', 'city', 'asdf', 'Koala.jpg', 0x30, NULL, '2018-02-24 02:51:57', '2018-02-24 02:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `overtime_hourly_fares`
--

CREATE TABLE IF NOT EXISTS `overtime_hourly_fares` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `overtime_hourly_fare` int(20) NOT NULL,
  `overtime_price` float(20,2) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `overtime_hourly_fares`
--

INSERT INTO `overtime_hourly_fares` (`id`, `overtime_hourly_fare`, `overtime_price`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 1, 2.00, '2018-02-24 17:07:35', '2018-02-24 17:07:35', NULL),
(2, 1, 2.00, '2018-02-25 01:12:09', '2018-02-25 01:12:09', NULL),
(3, 123, 123.00, '2018-02-25 01:16:56', '2018-02-24 17:16:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_subscriptions`
--

CREATE TABLE IF NOT EXISTS `passenger_subscriptions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `subscription_price` float(20,2) NOT NULL,
  `subscription_driver` int(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `passenger_subscriptions`
--

INSERT INTO `passenger_subscriptions` (`id`, `subscription_price`, `subscription_driver`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 123.00, 1, '2018-02-25 05:18:21', '2018-02-24 21:18:21', NULL),
(2, 3.00, 3, '2018-02-26 10:25:25', '2018-02-26 10:25:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passenger_taxes`
--

CREATE TABLE IF NOT EXISTS `passenger_taxes` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `vat` float(20,2) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `passenger_taxes`
--

INSERT INTO `passenger_taxes` (`id`, `vat`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 35.00, '2018-02-25 21:05:28', '2018-02-25 14:05:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN_PANEL', 'Admin Panel', 'Admin Panel Permission', NULL, '2018-01-30 14:40:23', '2018-01-30 14:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `plans_names`
--

CREATE TABLE IF NOT EXISTS `plans_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hour_ride` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plan_price` double(15,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `plans_names`
--

INSERT INTO `plans_names` (`id`, `plan_name`, `hour_ride`, `type`, `plan_price`, `deleted_at`, `created_at`, `updated_at`, `category`) VALUES
(1, 'Plan', '1000', 'duration', 50.00, NULL, '2018-02-20 04:46:12', '2018-02-24 16:12:22', 4),
(2, 'vacation', '160', 'mile', 120.00, NULL, '2018-02-20 04:49:13', '2018-02-24 07:07:59', 6),
(3, 'business', '10', 'mile', 15.00, NULL, '2018-02-24 07:09:05', '2018-02-24 07:09:05', 6),
(4, 'plan_test', '20', 'duration', 10.00, NULL, '2018-02-24 07:52:51', '2018-02-25 04:31:24', 3),
(5, 'New Plan', '1000', 'duration', 30.00, NULL, '2018-02-25 04:32:37', '2018-02-25 04:33:10', 4),
(6, 'test', '12', 'duration', 12.00, NULL, '2018-02-25 14:13:06', '2018-02-25 14:13:16', 6);

-- --------------------------------------------------------

--
-- Table structure for table `role_module`
--

CREATE TABLE IF NOT EXISTS `role_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `acc_view` tinyint(1) NOT NULL,
  `acc_create` tinyint(1) NOT NULL,
  `acc_edit` tinyint(1) NOT NULL,
  `acc_delete` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_role_id_foreign` (`role_id`),
  KEY `role_module_module_id_foreign` (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `role_module`
--

INSERT INTO `role_module` (`id`, `role_id`, `module_id`, `acc_view`, `acc_create`, `acc_edit`, `acc_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(2, 1, 2, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(3, 1, 3, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(4, 1, 4, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(5, 1, 5, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(6, 1, 6, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(7, 1, 7, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(8, 1, 8, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(9, 1, 9, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(10, 1, 10, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(11, 1, 11, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(12, 1, 12, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(13, 1, 13, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(14, 1, 14, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(15, 1, 15, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(16, 1, 16, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(17, 1, 17, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(18, 1, 18, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(19, 1, 19, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(20, 1, 20, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(21, 1, 21, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(22, 1, 22, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(23, 1, 23, 1, 1, 1, 1, '2018-01-30 14:40:22', '2018-01-30 14:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_module_fields`
--

CREATE TABLE IF NOT EXISTS `role_module_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `field_id` int(10) unsigned NOT NULL,
  `access` enum('invisible','readonly','write') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_module_fields_role_id_foreign` (`role_id`),
  KEY `role_module_fields_field_id_foreign` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=259 ;

--
-- Dumping data for table `role_module_fields`
--

INSERT INTO `role_module_fields` (`id`, `role_id`, `field_id`, `access`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(2, 1, 2, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(3, 1, 3, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(4, 1, 4, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(5, 1, 5, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(6, 1, 6, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(7, 1, 7, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(8, 1, 8, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(9, 1, 9, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(10, 1, 10, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(11, 1, 11, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(12, 1, 12, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(13, 1, 13, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(14, 1, 14, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(15, 1, 15, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(16, 1, 16, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(17, 1, 17, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(18, 1, 18, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(19, 1, 19, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(20, 1, 20, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(21, 1, 21, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(22, 1, 22, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(23, 1, 23, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(24, 1, 24, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(25, 1, 25, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(26, 1, 26, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(27, 1, 27, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(28, 1, 28, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(29, 1, 29, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(30, 1, 30, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(31, 1, 31, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(32, 1, 32, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(33, 1, 33, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(34, 1, 34, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(35, 1, 35, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(36, 1, 36, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(37, 1, 37, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(38, 1, 38, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(39, 1, 39, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(40, 1, 40, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(41, 1, 41, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(42, 1, 42, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(43, 1, 43, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(44, 1, 44, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(45, 1, 45, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(46, 1, 46, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(47, 1, 47, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(48, 1, 48, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(49, 1, 49, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(50, 1, 50, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(51, 1, 51, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(52, 1, 52, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(53, 1, 53, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(54, 1, 54, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(55, 1, 55, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(56, 1, 56, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(57, 1, 57, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(58, 1, 58, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(59, 1, 59, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(60, 1, 60, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(61, 1, 61, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(62, 1, 62, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(63, 1, 63, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(64, 1, 64, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(65, 1, 65, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(66, 1, 66, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(67, 1, 67, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(68, 1, 68, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(69, 1, 69, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(70, 1, 70, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(71, 1, 71, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(72, 1, 72, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(73, 1, 73, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(74, 1, 74, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(75, 1, 75, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(76, 1, 76, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(77, 1, 77, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(78, 1, 78, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(79, 1, 79, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(80, 1, 95, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(81, 1, 99, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(82, 1, 100, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(84, 1, 102, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(85, 1, 103, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(242, 1, 98, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(87, 1, 105, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(88, 1, 106, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(89, 1, 96, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(91, 1, 110, 'write', '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(92, 2, 1, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(93, 2, 2, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(94, 2, 3, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(95, 2, 4, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(96, 2, 5, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(97, 2, 6, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(98, 2, 7, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(99, 2, 8, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(100, 2, 9, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(101, 2, 10, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(102, 2, 11, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(103, 2, 12, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(104, 2, 13, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(105, 2, 14, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(106, 2, 15, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(107, 2, 16, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(108, 2, 17, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(109, 2, 18, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(110, 2, 19, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(111, 2, 20, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(112, 2, 21, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(113, 2, 22, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(114, 2, 23, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(115, 2, 24, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(116, 2, 25, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(117, 2, 26, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(118, 2, 27, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(119, 2, 28, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(120, 2, 29, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(121, 2, 30, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(251, 1, 168, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(252, 1, 169, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(253, 1, 170, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(254, 1, 171, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(255, 1, 172, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(256, 1, 173, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(257, 1, 174, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(258, 1, 175, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(144, 2, 53, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(243, 1, 160, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(250, 1, 167, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(160, 1, 80, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(161, 1, 81, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(162, 1, 82, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(163, 1, 83, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(164, 1, 84, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(165, 1, 85, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(166, 1, 86, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(167, 1, 87, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(168, 1, 88, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(169, 1, 89, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(170, 1, 90, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(171, 1, 91, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(172, 1, 92, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(173, 1, 93, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(174, 1, 94, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(176, 2, 100, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(177, 1, 102, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(178, 1, 101, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(179, 1, 99, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(187, 1, 95, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(188, 1, 96, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(189, 1, 103, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(190, 1, 105, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(191, 1, 104, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(192, 1, 106, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(193, 1, 110, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(194, 1, 111, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(195, 1, 112, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(196, 1, 113, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(197, 1, 114, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(198, 1, 115, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(199, 1, 116, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(201, 1, 117, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(202, 1, 118, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(203, 1, 119, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(204, 1, 120, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(205, 1, 121, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(206, 1, 123, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(207, 1, 124, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(208, 1, 125, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(209, 1, 126, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(210, 1, 127, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(211, 1, 128, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(212, 1, 129, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(213, 1, 130, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(214, 1, 131, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(215, 1, 132, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(216, 1, 133, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(217, 1, 134, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(218, 1, 135, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(219, 1, 136, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(220, 1, 137, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(221, 1, 138, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(222, 1, 139, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(223, 1, 140, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(224, 1, 141, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(225, 1, 142, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(226, 1, 143, 'write', '0000-00-00 00:00:00', '2018-02-20 08:58:19'),
(227, 1, 144, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(228, 1, 145, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(229, 1, 146, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(230, 1, 147, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(231, 1, 148, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(232, 1, 149, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(233, 1, 150, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(234, 1, 151, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(235, 1, 152, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(236, 1, 153, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(237, 1, 156, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(238, 1, 157, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(240, 1, 158, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(241, 1, 159, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(244, 1, 161, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(245, 1, 162, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(246, 1, 163, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(247, 1, 164, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(248, 1, 165, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19'),
(249, 1, 166, 'write', '2018-02-20 08:58:19', '2018-02-20 08:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  KEY `role_user_user_id_foreign` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(10) unsigned NOT NULL DEFAULT '1',
  `dept` int(10) unsigned NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`),
  KEY `roles_parent_foreign` (`parent`),
  KEY `roles_dept_foreign` (`dept`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `parent`, `dept`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMIN', 'Super Admin', 'Full Access Role', 1, 1, NULL, '2018-01-30 14:40:22', '2018-01-30 14:40:22'),
(2, 'ASDASD', 'asd', 'asd', 1, 1, NULL, '2018-02-20 08:58:19', '2018-02-20 08:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `set_availabilities`
--

CREATE TABLE IF NOT EXISTS `set_availabilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sunday_to` time DEFAULT NULL,
  `sunday_from` time DEFAULT NULL,
  `monday_to` time DEFAULT NULL,
  `monday_from` time DEFAULT NULL,
  `tuesday_to` time DEFAULT NULL,
  `tuesday_from` time DEFAULT NULL,
  `wednesday_to` time DEFAULT NULL,
  `wednesday_from` time DEFAULT NULL,
  `thursday_to` time DEFAULT NULL,
  `thursday_from` time DEFAULT NULL,
  `friday_to` time DEFAULT NULL,
  `friday_from` time DEFAULT NULL,
  `saturday_to` time DEFAULT NULL,
  `saturday_from` time DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subcriptions`
--

CREATE TABLE IF NOT EXISTS `subcriptions` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_name` varchar(256) NOT NULL,
  `commission` int(20) NOT NULL,
  `subscription_amount` int(20) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `subcriptions`
--

INSERT INTO `subcriptions` (`id`, `subscription_name`, `commission`, `subscription_amount`, `updated_at`, `created_at`, `deleted_at`) VALUES
(1, 'qwa', 20, 123, '2018-02-25 03:16:34', '2018-02-24 19:16:34', '2018-02-24 19:16:34'),
(2, 'Name', 12, 12, '2018-02-26 20:17:50', '2018-02-26 13:17:50', '2018-02-26 20:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `caption` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `hash` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploads_user_id_foreign` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `name`, `path`, `extension`, `caption`, `user_id`, `hash`, `public`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Koala.jpg', 'D:\\xampp\\htdocs\\uplift\\storage\\uploads\\2018-02-19-090442-Koala.jpg', 'jpg', '', 1, 'ohrzqxqyqmszne200qcn', 0, NULL, '2018-02-19 16:04:42', '2018-02-19 16:04:42'),
(2, 'Penguins.jpg', 'D:\\xampp\\htdocs\\uplift\\storage\\uploads\\2018-02-21-194648-Penguins.jpg', 'jpg', '', 1, 'wdlhpyioineunruwb33v', 0, NULL, '2018-02-22 02:46:48', '2018-02-22 02:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_amount`
--

CREATE TABLE IF NOT EXISTS `user_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `amount` float(10,0) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_amount`
--

INSERT INTO `user_amount` (`id`, `user_id`, `amount`, `plan_name`, `plan_id`, `status`) VALUES
(4, 12, 12, 'Basic', 1, 0),
(5, 15, 24, 'Standard', 2, 0),
(6, 16, 12, 'Basic', 1, 0),
(7, 18, 24, 'Standard', 2, 0),
(8, 19, 12, 'Basic', 1, 0),
(9, 25, 24, 'Standard', 2, 0),
(10, 26, 36, 'Platinum', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_registrations`
--

CREATE TABLE IF NOT EXISTS `user_registrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_mobile` int(10) unsigned NOT NULL,
  `user_role` int(10) unsigned NOT NULL DEFAULT '1',
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_registrations_email_unique` (`email`),
  KEY `user_registrations_user_role_foreign` (`user_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_registrations`
--

INSERT INTO `user_registrations` (`id`, `first_name`, `last_name`, `email`, `password_mobile`, `user_role`, `password`, `deleted_at`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'adsfad', 'adfasdf', 'asdf@asdf1', 0, 2, '$2y$10$uCC4Flll1KXfIgbgKm26zer0u8moC/qvElXsaJID5QevGN0RQOupq', NULL, '2018-02-20 04:56:58', '2018-02-20 04:57:21', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_role` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `user_role`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'asdasd', NULL, '2018-02-20 04:19:39', '2018-02-20 04:19:44'),
(2, 'aSD', NULL, '2018-02-20 04:53:48', '2018-02-20 04:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `make` int(200) DEFAULT NULL,
  `model` int(200) DEFAULT NULL,
  `colour` int(11) DEFAULT NULL,
  `registration` varchar(255) DEFAULT NULL,
  `upload_doc` varchar(255) DEFAULT NULL,
  `phv_expire_date` date DEFAULT NULL,
  `upload_mot_doc` varchar(255) DEFAULT NULL,
  `mot_expire_date` date DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `license_expire_date` date DEFAULT NULL,
  `pco_doc` varchar(255) DEFAULT NULL,
  `pco_expire_date` date DEFAULT NULL,
  `insurance_doc` varchar(255) DEFAULT NULL,
  `insurance_expire_date` date DEFAULT NULL,
  `license_pic` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `encrypt_user_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(256) DEFAULT NULL,
  `mot_issue_date` timestamp NULL DEFAULT NULL,
  `password_mobile` varchar(50) DEFAULT NULL,
  `registrationId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `address_line_1`, `address_line_2`, `address_line_3`, `town`, `city`, `county`, `postcode`, `telephone`, `country_code`, `mobile_number`, `profile_pic`, `make`, `model`, `colour`, `registration`, `upload_doc`, `phv_expire_date`, `upload_mot_doc`, `mot_expire_date`, `license`, `license_expire_date`, `pco_doc`, `pco_expire_date`, `insurance_doc`, `insurance_expire_date`, `license_pic`, `name`, `password`, `users_id`, `country`, `status`, `encrypt_user_id`, `deleted_at`, `updated_at`, `created_at`, `remember_token`, `mot_issue_date`, `password_mobile`, `registrationId`) VALUES
(1, 'Marc', 'Francis', 'marc.francis@uplift.vip', '76 Garth Close', 'Morden', '', 'Morden', 'London', 'Surrey', '', '', '44', '', 'Chewie.PNG', 4, 6, 2, 'KV64 HMF', '[]', '2022-03-07', '[]', '2022-03-07', '[]', '2018-05-07', '[]', '0000-00-00', '[]', '0000-00-00', 'Map_13.PNG', 'Uplift', '$2y$10$GBdsGPhdtZZzwo/ZzL5aueoCp6Huzy7JURAqln78lKcXIswqnRXNq', NULL, '123', 'Approved', '12312', '2018-02-23 04:27:42', '2018-02-27 10:59:59', '2018-02-27 03:59:59', 'h0LEGGKdn11oceWNepjJfOU3FfO7wArgwyOHbXJrxqBw9F5S2E8B2DeczZbV', '2018-02-22 07:00:00', NULL, NULL),
(5, 'demo', 'demo', 'demo@demo.com', 'Demo_address_line_1', '', '', 'London', 'London', 'demo_uk', '123456', '000000000', '44', '000000000', 'Koala.jpg', 5, 9, 5, '12345-33444555', '[]', '0000-00-00', '[]', '2018-02-21', '[]', '2022-09-09', '[]', '0000-00-00', '[]', '0000-00-00', '', 'demo_name', '$2y$10$HN78j6isz3fprVv.9GAl9.h/cpTGTM1vid2Z8vwkzDKlnRtqrO81K', NULL, 'dfads', 'Suspend', '123123', '2018-02-23 04:13:57', '2018-02-24 16:00:57', '2018-02-24 08:00:57', NULL, '2018-02-22 07:00:00', '1234567890', NULL),
(7, 'hello_first', 'hello_last', 'hello@email.com', '123, hello', 'line2_hello', 'line3_hello', 'hello_town', 'hello_city', 'hello_uk', '012345', '123456789', '42', '789456123', 'Koala.jpg', 2, 6, 7, '654321', '[]', '2018-02-01', '[]', '2018-02-24', '[]', '2019-02-01', '[]', '2018-02-01', '[]', '2018-02-01', 'Koala.jpg', 'hello_name', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'hello_country', 'Suspend', '12312', '2018-02-23 04:29:08', '2018-02-24 12:39:59', '2018-02-24 04:39:59', NULL, '2018-02-22 07:00:00', NULL, NULL),
(9, 'ccc', 'bbb', 'aaa@gmail.com', 'asdfasdfsadf', '', '', '', '', '', '', '', '44', '', 'car12.jpg', 2, 6, 4, 'aaaaaaaaaaaaa', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2018-02-06', '[]', '0000-00-00', '[]', '0000-00-00', '', 'admin', '31e9fb146377ca1ec73f07bf68382acb', NULL, 'asdfa', 'Reject', '2312', '2018-02-23 03:55:29', '2018-02-24 13:40:22', '2018-02-24 05:40:22', NULL, '2018-02-22 07:00:00', NULL, NULL),
(10, 'name', 'name', 'name@name.com', '123, demo test ', '', '', 'london', 'london', '', '123456', '', '44', '', '', 2, 6, 7, '123456', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '1970-01-01', '[]', '0000-00-00', '[]', '0000-00-00', '', 'hello', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'adsfa', 'Approved', '12312321', '2018-02-23 03:55:29', '2018-02-24 13:37:46', '2018-02-24 05:37:46', NULL, '2018-02-22 07:00:00', NULL, NULL),
(11, 'ccc', 'vvv', 'ccc@gmail.com', 'asdf', '', '', '', '', 'country', '', '', '44', '', 'car4.jpg', 1, 13, 8, 'adfasdf', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2018-02-09', '[]', '0000-00-00', '[]', '0000-00-00', '', 'name_updated', 'c1f68ec06b490b3ecb4066b1b13a9ee9', NULL, 'asdfas', 'Approved', '123', '2018-02-23 03:55:32', '2018-02-24 15:13:05', '2018-02-24 07:13:05', NULL, '2018-02-22 07:00:00', NULL, NULL),
(12, 'sdf', 'aaaaaa', 'dd@gmail.com', 'sdf', '', '', '', '', '', '', '', '44', '', '', 2, 11, 7, 'asdfdsf', '[]', '0000-00-00', '[]', '2018-02-23', '[]', '2018-02-03', '[]', '0000-00-00', '[]', '0000-00-00', 'background1.jpg', 'ddd6876876', '980ac217c6b51e7dc41040bec1edfec8', NULL, 'asdf', 'Approved', '1231', '2018-02-23 03:55:30', '2018-02-24 15:08:32', '2018-02-24 07:08:32', NULL, '2018-02-22 07:00:00', NULL, NULL),
(13, 'helll', 'helllo', 'helloo@hello.com', '123, demo test ', '', '', '', '', '', '123456', '', '44', '', '', 2, 4, 2, '123456', '[]', '0000-00-00', '[]', '2018-02-23', '112.png', '1970-01-01', '[]', '0000-00-00', '[]', '0000-00-00', '', 'demo1', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'asdf', 'asdf', '23123', '2018-02-23 03:55:30', '2018-02-23 03:55:30', '2018-02-23 03:55:30', NULL, '2018-02-23 03:55:30', NULL, NULL),
(14, 'Han', 'Solo', 'han@uplift.vip', '76', 'Garth Close', '', 'Morden', 'Surrey', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Han_Solo.PNG', 2, 4, 2, 'KV64HMF', 'Uplift_Summary_Booking_Screen.PNG', '0000-00-00', 'Uplift_Summary_Booking_Screen1.PNG', '2018-02-23', 'Uplift_Summary_Booking_Screen2.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen3.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen4.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen5.PNG', 'Han', '1cde4d8666b28f667ceb4c1945de8417', NULL, 'asdf', 'asdf', '1231', '2018-02-23 03:55:30', '2018-02-23 03:55:30', '2018-02-23 03:55:30', NULL, '2018-02-23 03:55:30', NULL, NULL),
(15, 'hello', 'hello', 'helloo@helloo.com', '123, hello ', '', '', 'london', 'london', '', '123456', '', '44', '', '', 2, 4, 2, '123456', '[]', '0000-00-00', '[]', '2018-02-23', '113.png', '1970-01-01', '[]', '0000-00-00', '[]', '0000-00-00', '', 'helloo', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'asdf', 'asdf', '1231', '2018-02-23 03:55:32', '2018-02-23 03:55:32', '2018-02-23 03:55:32', NULL, '2018-02-23 03:55:32', NULL, NULL),
(16, 'Luke', 'Skywalker', 'luke@uplift.vip', '76', 'Garth Close', '', 'Morden', 'London', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Luke.PNG', 1, 4, 2, 'KV64 HMF', 'Uplift_Calendar_Screen.PNG', '2020-02-10', 'Uplift_Calendar_Screen1.PNG', '2018-02-23', 'Uplift_Calendar_Screen2.PNG', '2019-02-10', 'Uplift_Calendar_Screen3.PNG', '2019-02-10', 'Uplift_Calendar_Screen4.PNG', '2019-02-10', 'Uplift_Calendar_Screen5.PNG', 'Luke', '43d1d16186fc5752e1b04afa71ae450a', NULL, 'adf', 'asdf', '123', '2018-02-23 03:55:33', '2018-02-23 03:55:33', '2018-02-23 03:55:33', NULL, '2018-02-23 03:55:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_old`
--

CREATE TABLE IF NOT EXISTS `users_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `context_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Employee',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `mobile_number` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypt_user_id` int(11) DEFAULT NULL,
  `country` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users_old`
--

INSERT INTO `users_old` (`id`, `first_name`, `context_id`, `email`, `password`, `type`, `remember_token`, `deleted_at`, `created_at`, `updated_at`, `last_name`, `users_id`, `mobile_number`, `status`, `encrypt_user_id`, `country`) VALUES
(1, 'Marc Francis', 1, 'marc.francis@uplift.vip', '$2y$10$GBdsGPhdtZZzwo/ZzL5aueoCp6Huzy7JURAqln78lKcXIswqnRXNq', 'Employee', 'WXzEHpjGmkkVxUq8eaCzaS7xm6gxVqfjFHDWhff0WGPTk5qSR2CaF94BQkTx', NULL, '2018-01-30 15:30:57', '2018-02-20 13:42:12', NULL, NULL, NULL, NULL, NULL, NULL),
(2, '', 0, '', '', 'Employee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
--
-- Database: `drive_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `dri_admin`
--

CREATE TABLE IF NOT EXISTS `dri_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `basic_pwd` varchar(255) DEFAULT NULL,
  `right` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dri_admin`
--

INSERT INTO `dri_admin` (`id`, `email`, `name`, `pwd`, `basic_pwd`, `right`) VALUES
(1, 'aaa@gmail.com', 'James', '31e9fb146377ca1ec73f07bf68382acb', 'admin1987', 2);

-- --------------------------------------------------------

--
-- Table structure for table `dri_user_amount`
--

CREATE TABLE IF NOT EXISTS `dri_user_amount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `amount` float(10,0) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `dri_user_amount`
--

INSERT INTO `dri_user_amount` (`id`, `user_id`, `amount`, `plan_name`, `plan_id`, `status`) VALUES
(4, 12, 12, 'Basic', 1, 0),
(5, 15, 24, 'Standard', 2, 0),
(6, 16, 12, 'Basic', 1, 0),
(7, 18, 24, 'Standard', 2, 0),
(8, 21, 12, 'Basic', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dri_users`
--

CREATE TABLE IF NOT EXISTS `dri_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `address_line_3` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `colour` varchar(255) DEFAULT NULL,
  `registration` varchar(255) DEFAULT NULL,
  `upload_doc` varchar(255) DEFAULT NULL,
  `phv_expire_date` date DEFAULT NULL,
  `upload_mot_doc` varchar(255) DEFAULT NULL,
  `mot_expire_date` date DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `license_expire_date` date DEFAULT NULL,
  `pco_doc` varchar(255) DEFAULT NULL,
  `pco_expire_date` date DEFAULT NULL,
  `insurance_doc` varchar(255) DEFAULT NULL,
  `insurance_expire_date` date DEFAULT NULL,
  `license_pic` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `dri_users`
--

INSERT INTO `dri_users` (`id`, `first_name`, `last_name`, `email`, `address_line_1`, `address_line_2`, `address_line_3`, `town`, `city`, `county`, `postcode`, `telephone`, `country_code`, `mobile_number`, `profile_pic`, `make`, `model`, `colour`, `registration`, `upload_doc`, `phv_expire_date`, `upload_mot_doc`, `mot_expire_date`, `license`, `license_expire_date`, `pco_doc`, `pco_expire_date`, `insurance_doc`, `insurance_expire_date`, `license_pic`, `name`, `password`) VALUES
(5, 'demo', 'demo', 'demo@demo.com', '123, demo test ', '', '', 'London', 'London', 'UK ', '123456', '123 4567 8901', '44', '123 4567 8901', NULL, '1', 'Select', 'red', '12345-33444555', NULL, '0000-00-00', NULL, '0000-00-00', 'UPLIFT_logo_white_SML.png', '2022-09-09', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'demo', 'e10adc3949ba59abbe56e057f20f883e'),
(7, 'hello', 'hello', 'helo@hello.com', '123, hello', '', '', 'london', 'london', 'UK ', '123456', '123 4567 8901', '44', '123 4568 7890', NULL, '1', 'Select', 'black', '123456', NULL, '0000-00-00', NULL, '0000-00-00', '11.png', '2019-02-14', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'demo', 'e10adc3949ba59abbe56e057f20f883e'),
(8, 'Marc', 'Francis', 'marc.francis@uplft.com', '76 Garth Close', 'Morden', '', 'Morden', 'London', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Chewie.PNG', '1', 'Select', 'Silver', 'KV64 HMF', 'Screenshot_20170714-150308.png', '2022-03-07', 'Screenshot_20170714-1503081.png', '2022-03-07', 'Map_1.PNG', '2018-05-07', 'Map_11.PNG', '0000-00-00', 'Map_12.PNG', '0000-00-00', 'Map_13.PNG', 'Chewie', 'b5ea768836b9af523455d374ca897e07'),
(9, 'ccc', 'bbb', 'aaa@gmail.com', 'asdfasdfsadf', '', '', '', '', '', 'sdf', '', '44', '123 4562 1354', 'car12.jpg', '1', 'Select', 'red', 'aaaaaaaaaaaaa', NULL, '0000-00-00', NULL, '0000-00-00', 'car3.jpg', '2018-02-06', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'admin', '31e9fb146377ca1ec73f07bf68382acb'),
(10, 'name', 'name', 'name@name.com', '123, demo test ', '', '', 'london', 'london', '', '123456', '123 4567 8901', '44', '123 4567 8901', NULL, '1', 'Select', 'black', '123456', NULL, '0000-00-00', NULL, '0000-00-00', '111.png', '2222-02-04', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'hello', 'e10adc3949ba59abbe56e057f20f883e'),
(11, 'ccc', 'vvv', 'ccc@gmail.com', 'asdf', '', '', '', '', '', 'dsf', '', '44', '123 4562 1354', 'car4.jpg', '1', 'Select', 'red', 'adfasdf', NULL, '0000-00-00', NULL, '0000-00-00', '175422122.jpg', '2018-02-09', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'ccc', 'c1f68ec06b490b3ecb4066b1b13a9ee9'),
(12, 'sdf', 'aaaaaa', 'dd@gmail.com', 'sdf', '', '', '', '', '', 'sdf', '', '44', '234 5678 6543', NULL, '3', 'Select', 'red', 'asdfdsf', NULL, '0000-00-00', NULL, '0000-00-00', 'car6.jpg', '2018-02-03', NULL, '0000-00-00', NULL, '0000-00-00', 'background1.jpg', 'ddd', '980ac217c6b51e7dc41040bec1edfec8'),
(13, 'helllo', 'helllo', 'helloo@hello.com', '123, demo test ', '', '', '', '', '', '123456', '123 4567 8901', '44', '123 4567 8901', NULL, '2', 'Select', 'red', '123456', NULL, '0000-00-00', NULL, '0000-00-00', '112.png', '2222-11-12', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'demo1', 'e10adc3949ba59abbe56e057f20f883e'),
(14, 'Han', 'Solo', 'han@uplift.vip', '76', 'Garth Close', '', 'Morden', 'Surrey', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Han_Solo.PNG', '2', 'Select', 'Silver', 'KV64HMF', 'Uplift_Summary_Booking_Screen.PNG', '0000-00-00', 'Uplift_Summary_Booking_Screen1.PNG', '0000-00-00', 'Uplift_Summary_Booking_Screen2.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen3.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen4.PNG', '2020-02-08', 'Uplift_Summary_Booking_Screen5.PNG', 'Han', '1cde4d8666b28f667ceb4c1945de8417'),
(15, 'helloo', 'helloo', 'helloo@helloo.com', '123, hello ', '', '', 'london', 'london', '', '123456', '123 4567 8901', '44', '123 4567 8901', NULL, '2', 'Select', 'white', '123456', NULL, '0000-00-00', NULL, '0000-00-00', '113.png', '2222-12-11', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'helloo', 'e10adc3949ba59abbe56e057f20f883e'),
(16, 'Luke', 'Skywalker', 'luke@uplift.vip', '76', 'Garth Close', '', 'Morden', 'London', 'Surrey', 'SM4 4NN', '', '44', '077 3917 5985', 'Luke.PNG', '1', 'Select', 'White', 'KV64 HMF', 'Uplift_Calendar_Screen.PNG', '2020-02-10', 'Uplift_Calendar_Screen1.PNG', '2020-02-10', 'Uplift_Calendar_Screen2.PNG', '2019-02-10', 'Uplift_Calendar_Screen3.PNG', '2019-02-10', 'Uplift_Calendar_Screen4.PNG', '2019-02-10', 'Uplift_Calendar_Screen5.PNG', 'Luke', '43d1d16186fc5752e1b04afa71ae450a'),
(18, 'first ', 'last', 'demo1@demo.com', '123, demo test ', '', '', 'London', 'london', 'UK ', '12345', '123 4567 8901', '44', '123 4567 8901', '114.png', '1', 'Select', 'black', '123456', NULL, '0000-00-00', NULL, '0000-00-00', '1111.png', '2222-01-01', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'hello', 'e10adc3949ba59abbe56e057f20f883e'),
(20, 'd', 'd', 'demo1@demo.com', 'd', '', '', 'd', 'd', 'd', '222222', '', '44', '123 4567 8901', NULL, '2', 'Select', 'grey', '123456', NULL, '0000-00-00', NULL, '0000-00-00', '11111.png', '2222-11-02', NULL, '0000-00-00', NULL, '0000-00-00', NULL, 'd', '13e7dc1e3cace50a7ef377856b95206e'),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e');
--
-- Database: `local_uplift`
--

-- --------------------------------------------------------

--
-- Table structure for table `submit_user`
--

CREATE TABLE IF NOT EXISTS `submit_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `submit_user`
--

INSERT INTO `submit_user` (`id`, `fname`, `lname`, `email`, `subject`, `message`) VALUES
(4, 'aaa', 'aaa', 'aaa@gmail.com', 'test', 'this is the test message. Thanks'),
(5, 'Marc', 'Francis', 'marc.francis@uplift.vip', 'Test', 'test'),
(6, 'iflkjhgfq', 'kjhgf', 'lkjhg@uytgrfds.com', 'pliufyctx', 'gffffffffhh'),
(7, 'demo', 'demo', 'netappmaker@gmail.com', 'hello ', 'Test message '),
(8, 'sam', 'sam', 'sales@raadharani.com', 'hello ', 'test'),
(9, 'Luke', 'Skywalker', 'luke@skywalker.com', 'Luke test ', 'Luke test 1'),
(10, 'Johanna', 'Aalto', 'johanna_aalto81@hotmail.com', 'Marvelous marketing message', 'Hi Marc, Iâ€™m Johanna and I saw your message on Entrepreneurs in London. I work in marketing and would be interested in hearing what kind of assistance you are currently searching? Especially if youâ€™re looking for someone to write a capturing marketing copy, I believe I could help you...\n\nLooking forward to hearing from you \n\nJohanna\n\nPS. Congratulations on your amazing Uber rating ðŸ†'),
(11, 'RAJESH', 'MALHOTRA', 'raj024malhotra@gmail.com', 'RE:Marketing', 'Hi Mark, \nHow are you? I do trust that you are well and I am very impressed with what you have achieved with your start up business so far?\n I saw your message on Meetups about being Passionate about Marketing.I have a background in sales,marketing,customer service and having worked previously in "Estate Agency"."Retail", "Accountancy" and "Hospitality" I am currently looking for another opportunity on a part time or consultancy basis.\n What help and assistance do you need with your Sales and Marketing? If you can please email me above and I can see where I can add value. You can see my personal profile on Linkedin and Meetups. I look forward to hearing from you. In the meantime I wish you all the best with your start up business venture.\nKind Regards\nRajesh Malhotra\nR.S.V.P.');

-- --------------------------------------------------------

--
-- Table structure for table `update_me`
--

CREATE TABLE IF NOT EXISTS `update_me` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `update_me`
--

INSERT INTO `update_me` (`id`, `fname`, `lname`, `email`, `message`) VALUES
(2, 'an', 'mike', 'bbb@gmail.com', 'test message'),
(3, 'Marc', 'Francis', 'sicnarfcram@gmail.com', 'fgfgdfdf'),
(4, 'jcuttc', 'ufuftx', 'vjgcgcg@yuucutcuc.com', 'hjcxxjyrxr'),
(5, 'Sam', 'sam', 'netappmaker@gmail.com', 'Hello '),
(6, 'Han', 'Solo', 'han@solo.com', 'Han test 1'),
(7, 'Md', 'Vazir', 'rz_ventures@hotmail.com', 'Hi\r\nUpdate me');
--
-- Database: `upliftadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_auth`
--

CREATE TABLE IF NOT EXISTS `admin_auth` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `google` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_auth`
--

INSERT INTO `admin_auth` (`id`, `name`, `email`, `username`, `password`, `phone`, `address`, `latitude`, `longitude`, `profile_image`, `facebook`, `google`, `twitter`, `instagram`) VALUES
(1, 'Company Name', 'parthasamanta1993@gmail.com', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '9609353800', '', 0, 0, 'logo_light.png', 'facebook.com', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `arrange` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent`, `arrange`) VALUES
(1, 'Bottoms', NULL, 4),
(2, 'Tops & Shirts', NULL, 3),
(3, 'All Clothing', NULL, 1),
(4, 'Dresses', NULL, 2),
(5, 'Footwear', NULL, 5),
(6, 'Skirt', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE IF NOT EXISTS `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`id`, `name`, `status`) VALUES
(1, 'By the lake side', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `contact_dt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`, `contact_dt`) VALUES
(1, 'Partha Samanta', 'parthasamanta9609@gmail.com', 9609353800, 'Test message', 1512111371);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=247 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `sortname`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'AS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua And Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas The'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CG', 'Congo'),
(50, 'CD', 'Congo The Democratic Republic Of The'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'CI', 'Cote D''Ivoire (Ivory Coast)'),
(54, 'HR', 'Croatia (Hrvatska)'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'DK', 'Denmark'),
(59, 'DJ', 'Djibouti'),
(60, 'DM', 'Dominica'),
(61, 'DO', 'Dominican Republic'),
(62, 'TP', 'East Timor'),
(63, 'EC', 'Ecuador'),
(64, 'EG', 'Egypt'),
(65, 'SV', 'El Salvador'),
(66, 'GQ', 'Equatorial Guinea'),
(67, 'ER', 'Eritrea'),
(68, 'EE', 'Estonia'),
(69, 'ET', 'Ethiopia'),
(70, 'XA', 'External Territories of Australia'),
(71, 'FK', 'Falkland Islands'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji Islands'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'GF', 'French Guiana'),
(77, 'PF', 'French Polynesia'),
(78, 'TF', 'French Southern Territories'),
(79, 'GA', 'Gabon'),
(80, 'GM', 'Gambia The'),
(81, 'GE', 'Georgia'),
(82, 'DE', 'Germany'),
(83, 'GH', 'Ghana'),
(84, 'GI', 'Gibraltar'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'XU', 'Guernsey and Alderney'),
(92, 'GN', 'Guinea'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HT', 'Haiti'),
(96, 'HM', 'Heard and McDonald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HK', 'Hong Kong S.A.R.'),
(99, 'HU', 'Hungary'),
(100, 'IS', 'Iceland'),
(101, 'IN', 'India'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'JM', 'Jamaica'),
(109, 'JP', 'Japan'),
(110, 'XJ', 'Jersey'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea North'),
(116, 'KR', 'Korea South'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Laos'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau S.A.R.'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'XM', 'Man (Isle of)'),
(137, 'MH', 'Marshall Islands'),
(138, 'MQ', 'Martinique'),
(139, 'MR', 'Mauritania'),
(140, 'MU', 'Mauritius'),
(141, 'YT', 'Mayotte'),
(142, 'MX', 'Mexico'),
(143, 'FM', 'Micronesia'),
(144, 'MD', 'Moldova'),
(145, 'MC', 'Monaco'),
(146, 'MN', 'Mongolia'),
(147, 'MS', 'Montserrat'),
(148, 'MA', 'Morocco'),
(149, 'MZ', 'Mozambique'),
(150, 'MM', 'Myanmar'),
(151, 'NA', 'Namibia'),
(152, 'NR', 'Nauru'),
(153, 'NP', 'Nepal'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NL', 'Netherlands The'),
(156, 'NC', 'New Caledonia'),
(157, 'NZ', 'New Zealand'),
(158, 'NI', 'Nicaragua'),
(159, 'NE', 'Niger'),
(160, 'NG', 'Nigeria'),
(161, 'NU', 'Niue'),
(162, 'NF', 'Norfolk Island'),
(163, 'MP', 'Northern Mariana Islands'),
(164, 'NO', 'Norway'),
(165, 'OM', 'Oman'),
(166, 'PK', 'Pakistan'),
(167, 'PW', 'Palau'),
(168, 'PS', 'Palestinian Territory Occupied'),
(169, 'PA', 'Panama'),
(170, 'PG', 'Papua new Guinea'),
(171, 'PY', 'Paraguay'),
(172, 'PE', 'Peru'),
(173, 'PH', 'Philippines'),
(174, 'PN', 'Pitcairn Island'),
(175, 'PL', 'Poland'),
(176, 'PT', 'Portugal'),
(177, 'PR', 'Puerto Rico'),
(178, 'QA', 'Qatar'),
(179, 'RE', 'Reunion'),
(180, 'RO', 'Romania'),
(181, 'RU', 'Russia'),
(182, 'RW', 'Rwanda'),
(183, 'SH', 'Saint Helena'),
(184, 'KN', 'Saint Kitts And Nevis'),
(185, 'LC', 'Saint Lucia'),
(186, 'PM', 'Saint Pierre and Miquelon'),
(187, 'VC', 'Saint Vincent And The Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'XG', 'Smaller Territories of the UK'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia'),
(204, 'SS', 'South Sudan'),
(205, 'ES', 'Spain'),
(206, 'LK', 'Sri Lanka'),
(207, 'SD', 'Sudan'),
(208, 'SR', 'Suriname'),
(209, 'SJ', 'Svalbard And Jan Mayen Islands'),
(210, 'SZ', 'Swaziland'),
(211, 'SE', 'Sweden'),
(212, 'CH', 'Switzerland'),
(213, 'SY', 'Syria'),
(214, 'TW', 'Taiwan'),
(215, 'TJ', 'Tajikistan'),
(216, 'TZ', 'Tanzania'),
(217, 'TH', 'Thailand'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad And Tobago'),
(222, 'TN', 'Tunisia'),
(223, 'TR', 'Turkey'),
(224, 'TM', 'Turkmenistan'),
(225, 'TC', 'Turks And Caicos Islands'),
(226, 'TV', 'Tuvalu'),
(227, 'UG', 'Uganda'),
(228, 'UA', 'Ukraine'),
(229, 'AE', 'United Arab Emirates'),
(230, 'GB', 'United Kingdom'),
(231, 'US', 'United States'),
(232, 'UM', 'United States Minor Outlying Islands'),
(233, 'UY', 'Uruguay'),
(234, 'UZ', 'Uzbekistan'),
(235, 'VU', 'Vanuatu'),
(236, 'VA', 'Vatican City State (Holy See)'),
(237, 'VE', 'Venezuela'),
(238, 'VN', 'Vietnam'),
(239, 'VG', 'Virgin Islands (British)'),
(240, 'VI', 'Virgin Islands (US)'),
(241, 'WF', 'Wallis And Futuna Islands'),
(242, 'EH', 'Western Sahara'),
(243, 'YE', 'Yemen'),
(244, 'YU', 'Yugoslavia'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `discount` float NOT NULL,
  `is_coupon` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount`, `is_coupon`) VALUES
(4, 'test101', 2500, 'cash'),
(6, 'test10', 49, 'percentage');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `rate` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `rate`) VALUES
(1, 'usd', 60),
(2, 'inr', 1),
(3, 'eur', 75);

-- --------------------------------------------------------

--
-- Table structure for table `home_banner`
--

CREATE TABLE IF NOT EXISTS `home_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `home_banner`
--

INSERT INTO `home_banner` (`id`, `image`, `redirect_link`, `created_date`, `status`) VALUES
(1, '1516296419-5891x2790.jpeg', 'http://blankstudio.in/collection/1', '2018-01-18 17:24:32', 1),
(3, '1516296329-5646x2771.jpeg', 'http://blankstudio.in/collection/1', '2018-01-18 17:25:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_email` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `newsletter`
--

INSERT INTO `newsletter` (`id`, `newsletter_email`, `status`, `creation_date`) VALUES
(18, 'parthasamanta9609@gmail.com', 1, '2018-01-23 05:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_sendmail`
--

CREATE TABLE IF NOT EXISTS `newsletter_sendmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `template` longtext NOT NULL,
  `recipient` longtext NOT NULL,
  `sending_date` date NOT NULL,
  `last_sending_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `newsletter_sendmail`
--

INSERT INTO `newsletter_sendmail` (`id`, `subject`, `template`, `recipient`, `sending_date`, `last_sending_date`) VALUES
(1, 'TEST MOOBAAA', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n		<html xmlns="http://www.w3.org/1999/xhtml">\r\n		<head>\r\n		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n		<title>Newsletter Subscription</title>\r\n		</head><body>\r\n            <div id='':1rg'' class=''ii gt adP adO getnContent''>\r\n   <div id='':1rf'' class=''a3s aXjCH m15c775245f10ca9f''>\r\n      <div class=''adM''></div>\r\n      <u></u>\r\n      <div bgcolor=''#ffffff'' style=''background-color:#ffffff;width:100%!important;margin:0;padding:0''>\r\n         <img src='''' class=''CToWUd''>\r\n         <table id=''m_3684269869287162945table-background'' align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''background-color:#ffffff;border-collapse:collapse;margin:0;padding:0''>\r\n            <tbody>\r\n               <tr>\r\n                  <td align=''center'' valign=''top'' bgcolor=''#ffffff''>\r\n                     <table id=''m_3684269869287162945table-main-content'' align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''border-collapse:collapse;width:100%;max-width:640px''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td align=''center'' valign=''top''>\r\n                                 <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td height=''7'' style=''height:7px''></td>\r\n                                       </tr>\r\n\r\n                                       <tr>\r\n                                          <td height=''15'' style=''height:15px''></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''center'' valign=''top''>\r\n                                             <table id=''m_3684269869287162945table-header-orange-bar'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' bgcolor=''#CC0000'' style=''height:6px;background-color:#CC0000;width:100%''>\r\n                                                <tbody>\r\n                                                   <tr>\r\n                                                      <td height=''6'' width=''100%'' style=''height:6px;width:100%''>\r\n                                                      </td>\r\n                                                   </tr>\r\n                                                </tbody>\r\n                                             </table>\r\n                                          </td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td align=''center'' valign=''top''>\r\n                                             <table align=''center'' border=''0'' cellspacing=''0'' cellpadding=''0'' width=''100%'' class=''m_3684269869287162945inl-device-width'' style=''text-align:center''>\r\n                                                <tbody>\r\n                                                   <tr>\r\n                                                      <td align=''center'' valign=''middle'' style=''display:inline-block;vertical-align:middle''>\r\n                                                         <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''315'' style=''width:315px;border-collapse:collapse;vertical-align:middle''>\r\n                                                            <tbody>\r\n                                                               <tr>\r\n                                                                  <td align=''center'' valign=''middle''>\r\n                                                                     <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                                                        <tbody>\r\n                                                                           <tr>\r\n                                                                               \r\n                                                                              <td align=''left'' valign=''middle'' style=''padding:10px''>\r\n                                                                                 <a href=''#'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 <img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.temow.in//frontend_includes/images/logo.png'' alt=''playmusicindia.com'' hspace=''0'' vspace=''0'' border=''0'' height=''45'' width=''150'' style=''width:150px;height:45px''>\r\n                                                                                 </a>\r\n                                                                              </td>\r\n                                                                               \r\n                                                                           </tr>\r\n                                                                        </tbody>\r\n                                                                     </table>\r\n                                                                  </td>\r\n                                                               </tr>\r\n                                                            </tbody>\r\n                                                         </table>\r\n                                                      </td>\r\n                                                      <td align=''center'' valign=''middle'' style=''display:inline-block;vertical-align:middle''>\r\n                                                         <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''315'' style=''width:315px;border-collapse:collapse;vertical-align:middle''>\r\n                                                            <tbody>\r\n                                                               <tr>\r\n                                                                  <td align=''center'' valign=''middle''>\r\n                                                                     <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                                                        <tbody>\r\n                                                                           <tr>\r\n                                                                              <td height=''2'' style=''height:2px''>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                           <tr>\r\n                                                                              <td align=''center'' valign=''middle'' style=''color:#101010''>\r\n                                                                                 <a href=''http://playmusicindia.com'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 Playmusicindia.com\r\n                                                                                 </a>\r\n                                                                                 &nbsp;|&nbsp;\r\n                                                                                 <a href=''http://playmusicindia.com/about_us.php'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 About us\r\n                                                                                 </a>\r\n                                                                                 &nbsp;|&nbsp;\r\n                                                                                 <a href=''http://playmusicindia.com/contact_us.php'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 Contact Us\r\n                                                                                 </a>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                           <tr>\r\n                                                                              <td height=''5'' style=''height:5px''>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                        </tbody>\r\n                                                                     </table>\r\n                                                                  </td>\r\n                                                               </tr>\r\n                                                            </tbody>\r\n                                                         </table>\r\n                                                      </td>\r\n                                                   </tr>\r\n                                                </tbody>\r\n                                             </table>\r\n                                          </td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td bgcolor=''#ffffff'' height=''1'' style=''background-color:#ffffff;height:1px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td height=''16'' style=''height:16px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                           \r\n                                          <td align=''center'' valign=''middle''><a align=''center'' href=''#'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src='''' alt=''Play Music India'' hspace=''0'' vspace=''0'' border=''0'' align=''top'' width=''100%'' style=''max-width:640px;max-height:400px;width:100%''></a></td>\r\n                                           \r\n                                       </tr>\r\n                                        <tr>\r\n                                            <td align=''left'' width=''100%'' style=''font: 13px/18px Arial,Helvetica,sans-serif; padding-left: 10px; padding-right: 10px''>\r\n                                            <br>\r\n                                           <p>\r\n	HI</p>\r\n                                            </td>\r\n                                        </tr>\r\n\r\n                                       <tr>\r\n                                          <td height=''16'' style=''height:16px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td bgcolor=''#ffffff'' height=''1'' style=''background-color:#ffffff;height:1px''></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 \r\n                              </td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n                     <table border=''0'' align=''center'' cellpadding=''10'' cellspacing=''0'' width=''100%'' style=''max-width:640px!important''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td align=''left'' valign=''middle''>\r\n                                 <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''left'' valign=''top''><a href=''#'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.temow.in//frontend_includes/images/logo.png'' height=''45'' width=''150'' alt=''www.playmusicindia.com'' align=''left'' hspace=''0'' vspace=''0'' border=''0'' style=''width:150px;height:45px''></a></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                              </td>\r\n                              <td align=''right'' valign=''middle''>\r\n                                 <table border=''0'' cellpadding=''6'' cellspacing=''0''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''right''><span style=''font-family:Arial,Helvetica,sans-serif;font-size:10px;line-height:10px;color:#666666''>Connect with us</span></td>\r\n                                          <td><a href=''https://www.facebook.com/playmusicin'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.com/admin/img/newsletter/fb.gif'' alt=''Facebook'' border=''0'' height=''30'' hspace=''0'' vspace=''0'' width=''30'' style=''width:30px;height:30px''></a></td>\r\n\r\n                                           <td><a href=''https://www.linkedin.com/company/play-music-india?report%2Esuccess=KJ_KkFGTDCfMt-A7wV3Fn9Yvgwr02Kd6AZHGx4bQCDiP6-2rfP2oxyVoEQiPrcAQ7Bf'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.com/admin/img/newsletter/ld.gif'' alt=''Facebook'' border=''0'' height=''30'' hspace=''0'' vspace=''0'' width=''30'' style=''width:30px;height:30px''></a></td>\r\n\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                              </td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n                     <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td height=''3'' style=''height:3px''></td>\r\n                           </tr>\r\n                           <tr>\r\n                              <td height=''3'' bgcolor=''#666666'' style=''background-color:#666666;height:3px''></td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n\r\n                  </td>\r\n               </tr>\r\n            </tbody>\r\n         </table>\r\n         <img src=''http://playmusicindia.com/admin/img/newsletter/dot.gif'' class=''CToWUd''>\r\n      </div>\r\n      <div class=''yj6qo''></div>\r\n      <div class=''adL''>\r\n      </div>\r\n   </div>\r\n</div></body></html>', '["parthasamanta1993@gmail.com"]', '2017-11-10', '2017-11-10'),
(2, 'Test 2.12.2017', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n		<html xmlns="http://www.w3.org/1999/xhtml">\r\n		<head>\r\n		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n		<title>Newsletter Subscription</title>\r\n		</head><body>\r\n            <div id='':1rg'' class=''ii gt adP adO getnContent''>\r\n   <div id='':1rf'' class=''a3s aXjCH m15c775245f10ca9f''>\r\n      <div class=''adM''></div>\r\n      <u></u>\r\n      <div bgcolor=''#ffffff'' style=''background-color:#ffffff;width:100%!important;margin:0;padding:0''>\r\n         <img src='''' class=''CToWUd''>\r\n         <table id=''m_3684269869287162945table-background'' align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''background-color:#ffffff;border-collapse:collapse;margin:0;padding:0''>\r\n            <tbody>\r\n               <tr>\r\n                  <td align=''center'' valign=''top'' bgcolor=''#ffffff''>\r\n                     <table id=''m_3684269869287162945table-main-content'' align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''border-collapse:collapse;width:100%;max-width:640px''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td align=''center'' valign=''top''>\r\n                                 <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td height=''7'' style=''height:7px''></td>\r\n                                       </tr>\r\n\r\n                                       <tr>\r\n                                          <td height=''15'' style=''height:15px''></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''center'' valign=''top''>\r\n                                             <table id=''m_3684269869287162945table-header-orange-bar'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' bgcolor=''#CC0000'' style=''height:6px;background-color:#CC0000;width:100%''>\r\n                                                <tbody>\r\n                                                   <tr>\r\n                                                      <td height=''6'' width=''100%'' style=''height:6px;width:100%''>\r\n                                                      </td>\r\n                                                   </tr>\r\n                                                </tbody>\r\n                                             </table>\r\n                                          </td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td align=''center'' valign=''top''>\r\n                                             <table align=''center'' border=''0'' cellspacing=''0'' cellpadding=''0'' width=''100%'' class=''m_3684269869287162945inl-device-width'' style=''text-align:center''>\r\n                                                <tbody>\r\n                                                   <tr>\r\n                                                      <td align=''center'' valign=''middle'' style=''display:inline-block;vertical-align:middle''>\r\n                                                         <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''315'' style=''width:315px;border-collapse:collapse;vertical-align:middle''>\r\n                                                            <tbody>\r\n                                                               <tr>\r\n                                                                  <td align=''center'' valign=''middle''>\r\n                                                                     <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                                                        <tbody>\r\n                                                                           <tr>\r\n                                                                               \r\n                                                                              <td align=''left'' valign=''middle'' style=''padding:10px''>\r\n                                                                                 <a href=''#'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 <img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.temow.in//frontend_includes/images/logo.png'' alt=''playmusicindia.com'' hspace=''0'' vspace=''0'' border=''0'' height=''45'' width=''150'' style=''width:150px;height:45px''>\r\n                                                                                 </a>\r\n                                                                              </td>\r\n                                                                               \r\n                                                                           </tr>\r\n                                                                        </tbody>\r\n                                                                     </table>\r\n                                                                  </td>\r\n                                                               </tr>\r\n                                                            </tbody>\r\n                                                         </table>\r\n                                                      </td>\r\n                                                      <td align=''center'' valign=''middle'' style=''display:inline-block;vertical-align:middle''>\r\n                                                         <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''315'' style=''width:315px;border-collapse:collapse;vertical-align:middle''>\r\n                                                            <tbody>\r\n                                                               <tr>\r\n                                                                  <td align=''center'' valign=''middle''>\r\n                                                                     <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                                                        <tbody>\r\n                                                                           <tr>\r\n                                                                              <td height=''2'' style=''height:2px''>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                           <tr>\r\n                                                                              <td align=''center'' valign=''middle'' style=''color:#101010''>\r\n                                                                                 <a href=''http://playmusicindia.com'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 Playmusicindia.com\r\n                                                                                 </a>\r\n                                                                                 &nbsp;|&nbsp;\r\n                                                                                 <a href=''http://playmusicindia.com/about_us.php'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 About us\r\n                                                                                 </a>\r\n                                                                                 &nbsp;|&nbsp;\r\n                                                                                 <a href=''http://playmusicindia.com/contact_us.php'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 Contact Us\r\n                                                                                 </a>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                           <tr>\r\n                                                                              <td height=''5'' style=''height:5px''>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                        </tbody>\r\n                                                                     </table>\r\n                                                                  </td>\r\n                                                               </tr>\r\n                                                            </tbody>\r\n                                                         </table>\r\n                                                      </td>\r\n                                                   </tr>\r\n                                                </tbody>\r\n                                             </table>\r\n                                          </td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td bgcolor=''#ffffff'' height=''1'' style=''background-color:#ffffff;height:1px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td height=''16'' style=''height:16px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                           \r\n                                          <td align=''center'' valign=''middle''><a align=''center'' href=''#'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src='''' alt=''Play Music India'' hspace=''0'' vspace=''0'' border=''0'' align=''top'' width=''100%'' style=''max-width:640px;max-height:400px;width:100%''></a></td>\r\n                                           \r\n                                       </tr>\r\n                                        <tr>\r\n                                            <td align=''left'' width=''100%'' style=''font: 13px/18px Arial,Helvetica,sans-serif; padding-left: 10px; padding-right: 10px''>\r\n                                            <br>\r\n                                           <p>\r\n	HI</p>\r\n                                            </td>\r\n                                        </tr>\r\n\r\n                                       <tr>\r\n                                          <td height=''16'' style=''height:16px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td bgcolor=''#ffffff'' height=''1'' style=''background-color:#ffffff;height:1px''></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 \r\n                              </td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n                     <table border=''0'' align=''center'' cellpadding=''10'' cellspacing=''0'' width=''100%'' style=''max-width:640px!important''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td align=''left'' valign=''middle''>\r\n                                 <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''left'' valign=''top''><a href=''#'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.temow.in//frontend_includes/images/logo.png'' height=''45'' width=''150'' alt=''www.playmusicindia.com'' align=''left'' hspace=''0'' vspace=''0'' border=''0'' style=''width:150px;height:45px''></a></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                              </td>\r\n                              <td align=''right'' valign=''middle''>\r\n                                 <table border=''0'' cellpadding=''6'' cellspacing=''0''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''right''><span style=''font-family:Arial,Helvetica,sans-serif;font-size:10px;line-height:10px;color:#666666''>Connect with us</span></td>\r\n                                          <td><a href=''https://www.facebook.com/playmusicin'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.com/admin/img/newsletter/fb.gif'' alt=''Facebook'' border=''0'' height=''30'' hspace=''0'' vspace=''0'' width=''30'' style=''width:30px;height:30px''></a></td>\r\n\r\n                                           <td><a href=''https://www.linkedin.com/company/play-music-india?report%2Esuccess=KJ_KkFGTDCfMt-A7wV3Fn9Yvgwr02Kd6AZHGx4bQCDiP6-2rfP2oxyVoEQiPrcAQ7Bf'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.com/admin/img/newsletter/ld.gif'' alt=''Facebook'' border=''0'' height=''30'' hspace=''0'' vspace=''0'' width=''30'' style=''width:30px;height:30px''></a></td>\r\n\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                              </td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n                     <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td height=''3'' style=''height:3px''></td>\r\n                           </tr>\r\n                           <tr>\r\n                              <td height=''3'' bgcolor=''#666666'' style=''background-color:#666666;height:3px''></td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n\r\n                  </td>\r\n               </tr>\r\n            </tbody>\r\n         </table>\r\n         <img src=''http://playmusicindia.com/admin/img/newsletter/dot.gif'' class=''CToWUd''>\r\n      </div>\r\n      <div class=''yj6qo''></div>\r\n      <div class=''adL''>\r\n      </div>\r\n   </div>\r\n</div></body></html>', '["parthasamanta1993@gmail.com"]', '2017-12-02', '0000-00-00');
INSERT INTO `newsletter_sendmail` (`id`, `subject`, `template`, `recipient`, `sending_date`, `last_sending_date`) VALUES
(3, 'testing', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n		<html xmlns="http://www.w3.org/1999/xhtml">\r\n		<head>\r\n		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n		<title>Newsletter Subscription</title>\r\n		</head><body>\r\n            <div id='':1rg'' class=''ii gt adP adO getnContent''>\r\n   <div id='':1rf'' class=''a3s aXjCH m15c775245f10ca9f''>\r\n      <div class=''adM''></div>\r\n      <u></u>\r\n      <div bgcolor=''#ffffff'' style=''background-color:#ffffff;width:100%!important;margin:0;padding:0''>\r\n         <img src='''' class=''CToWUd''>\r\n         <table id=''m_3684269869287162945table-background'' align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''background-color:#ffffff;border-collapse:collapse;margin:0;padding:0''>\r\n            <tbody>\r\n               <tr>\r\n                  <td align=''center'' valign=''top'' bgcolor=''#ffffff''>\r\n                     <table id=''m_3684269869287162945table-main-content'' align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''border-collapse:collapse;width:100%;max-width:640px''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td align=''center'' valign=''top''>\r\n                                 <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td height=''7'' style=''height:7px''></td>\r\n                                       </tr>\r\n\r\n                                       <tr>\r\n                                          <td height=''15'' style=''height:15px''></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''center'' valign=''top''>\r\n                                             <table id=''m_3684269869287162945table-header-orange-bar'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' bgcolor=''#CC0000'' style=''height:6px;background-color:#CC0000;width:100%''>\r\n                                                <tbody>\r\n                                                   <tr>\r\n                                                      <td height=''6'' width=''100%'' style=''height:6px;width:100%''>\r\n                                                      </td>\r\n                                                   </tr>\r\n                                                </tbody>\r\n                                             </table>\r\n                                          </td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td align=''center'' valign=''top''>\r\n                                             <table align=''center'' border=''0'' cellspacing=''0'' cellpadding=''0'' width=''100%'' class=''m_3684269869287162945inl-device-width'' style=''text-align:center''>\r\n                                                <tbody>\r\n                                                   <tr>\r\n                                                      <td align=''center'' valign=''middle'' style=''display:inline-block;vertical-align:middle''>\r\n                                                         <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''315'' style=''width:315px;border-collapse:collapse;vertical-align:middle''>\r\n                                                            <tbody>\r\n                                                               <tr>\r\n                                                                  <td align=''center'' valign=''middle''>\r\n                                                                     <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                                                        <tbody>\r\n                                                                           <tr>\r\n                                                                               \r\n                                                                              <td align=''left'' valign=''middle'' style=''padding:10px''>\r\n                                                                                 <a href=''#'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 <img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.temow.in//frontend_includes/images/logo.png'' alt=''playmusicindia.com'' hspace=''0'' vspace=''0'' border=''0'' height=''45'' width=''150'' style=''width:150px;height:45px''>\r\n                                                                                 </a>\r\n                                                                              </td>\r\n                                                                               \r\n                                                                           </tr>\r\n                                                                        </tbody>\r\n                                                                     </table>\r\n                                                                  </td>\r\n                                                               </tr>\r\n                                                            </tbody>\r\n                                                         </table>\r\n                                                      </td>\r\n                                                      <td align=''center'' valign=''middle'' style=''display:inline-block;vertical-align:middle''>\r\n                                                         <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''315'' style=''width:315px;border-collapse:collapse;vertical-align:middle''>\r\n                                                            <tbody>\r\n                                                               <tr>\r\n                                                                  <td align=''center'' valign=''middle''>\r\n                                                                     <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                                                        <tbody>\r\n                                                                           <tr>\r\n                                                                              <td height=''2'' style=''height:2px''>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                           <tr>\r\n                                                                              <td align=''center'' valign=''middle'' style=''color:#101010''>\r\n                                                                                 <a href=''http://playmusicindia.com'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 Playmusicindia.com\r\n                                                                                 </a>\r\n                                                                                 &nbsp;|&nbsp;\r\n                                                                                 <a href=''http://playmusicindia.com/about_us.php'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 About us\r\n                                                                                 </a>\r\n                                                                                 &nbsp;|&nbsp;\r\n                                                                                 <a href=''http://playmusicindia.com/contact_us.php'' style=''font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#1a76b9;line-height:14px;text-decoration:none'' target=''_blank'' data-saferedirecturl=''''>\r\n                                                                                 Contact Us\r\n                                                                                 </a>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                           <tr>\r\n                                                                              <td height=''5'' style=''height:5px''>\r\n                                                                              </td>\r\n                                                                           </tr>\r\n                                                                        </tbody>\r\n                                                                     </table>\r\n                                                                  </td>\r\n                                                               </tr>\r\n                                                            </tbody>\r\n                                                         </table>\r\n                                                      </td>\r\n                                                   </tr>\r\n                                                </tbody>\r\n                                             </table>\r\n                                          </td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 <table align=''center'' border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td bgcolor=''#ffffff'' height=''1'' style=''background-color:#ffffff;height:1px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td height=''16'' style=''height:16px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                           \r\n                                          <td align=''center'' valign=''middle''><a align=''center'' href=''#'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src='''' alt=''Play Music India'' hspace=''0'' vspace=''0'' border=''0'' align=''top'' width=''100%'' style=''max-width:640px;max-height:400px;width:100%''></a></td>\r\n                                           \r\n                                       </tr>\r\n                                        <tr>\r\n                                            <td align=''left'' width=''100%'' style=''font: 13px/18px Arial,Helvetica,sans-serif; padding-left: 10px; padding-right: 10px''>\r\n                                            <br>\r\n                                           <p>\r\n	hi</p>\r\n                                            </td>\r\n                                        </tr>\r\n\r\n                                       <tr>\r\n                                          <td height=''16'' style=''height:16px''></td>\r\n                                       </tr>\r\n                                       <tr>\r\n                                          <td bgcolor=''#ffffff'' height=''1'' style=''background-color:#ffffff;height:1px''></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                                 \r\n                              </td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n                     <table border=''0'' align=''center'' cellpadding=''10'' cellspacing=''0'' width=''100%'' style=''max-width:640px!important''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td align=''left'' valign=''middle''>\r\n                                 <table border=''0'' cellpadding=''0'' cellspacing=''0'' width=''100%''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''left'' valign=''top''><a href=''#'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.temow.in//frontend_includes/images/logo.png'' height=''45'' width=''150'' alt=''www.playmusicindia.com'' align=''left'' hspace=''0'' vspace=''0'' border=''0'' style=''width:150px;height:45px''></a></td>\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                              </td>\r\n                              <td align=''right'' valign=''middle''>\r\n                                 <table border=''0'' cellpadding=''6'' cellspacing=''0''>\r\n                                    <tbody>\r\n                                       <tr>\r\n                                          <td align=''right''><span style=''font-family:Arial,Helvetica,sans-serif;font-size:10px;line-height:10px;color:#666666''>Connect with us</span></td>\r\n                                          <td><a href=''https://www.facebook.com/playmusicin'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.com/admin/img/newsletter/fb.gif'' alt=''Facebook'' border=''0'' height=''30'' hspace=''0'' vspace=''0'' width=''30'' style=''width:30px;height:30px''></a></td>\r\n\r\n                                           <td><a href=''https://www.linkedin.com/company/play-music-india?report%2Esuccess=KJ_KkFGTDCfMt-A7wV3Fn9Yvgwr02Kd6AZHGx4bQCDiP6-2rfP2oxyVoEQiPrcAQ7Bf'' target=''_blank'' data-saferedirecturl=''''><img class=''m_3684269869287162945imageFix CToWUd'' src=''http://playmusicindia.com/admin/img/newsletter/ld.gif'' alt=''Facebook'' border=''0'' height=''30'' hspace=''0'' vspace=''0'' width=''30'' style=''width:30px;height:30px''></a></td>\r\n\r\n                                       </tr>\r\n                                    </tbody>\r\n                                 </table>\r\n                              </td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n                     <table border=''0'' align=''center'' cellpadding=''0'' cellspacing=''0'' width=''100%'' style=''width:100%!important''>\r\n                        <tbody>\r\n                           <tr>\r\n                              <td height=''3'' style=''height:3px''></td>\r\n                           </tr>\r\n                           <tr>\r\n                              <td height=''3'' bgcolor=''#666666'' style=''background-color:#666666;height:3px''></td>\r\n                           </tr>\r\n                        </tbody>\r\n                     </table>\r\n\r\n                  </td>\r\n               </tr>\r\n            </tbody>\r\n         </table>\r\n         <img src=''http://playmusicindia.com/admin/img/newsletter/dot.gif'' class=''CToWUd''>\r\n      </div>\r\n      <div class=''yj6qo''></div>\r\n      <div class=''adL''>\r\n      </div>\r\n   </div>\r\n</div></body></html>', '["parthasamanta1993@gmail.com"]', '2017-12-19', '2017-12-19');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `color`) VALUES
(1, 'Preparing', '#fa661e'),
(2, 'In Transit', '#842abf'),
(3, 'Delivered', '#02b21f');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `tracking_id` bigint(20) NOT NULL,
  `bank_ref_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `order_status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `failure_message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `card_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status_message` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `oda_charges` int(11) NOT NULL,
  `billing_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_tel` double NOT NULL,
  `billing_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_tel` double NOT NULL,
  `merchant_param1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vault` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `offer_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null',
  `offer_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'null',
  `discount_value` double DEFAULT '0',
  `mer_amount` double NOT NULL,
  `billing_notes` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_order_status` int(11) NOT NULL DEFAULT '0',
  `payment_method` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` int(11) NOT NULL,
  `trans_date` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `cancelled_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `tracking_id`, `bank_ref_no`, `order_status`, `failure_message`, `payment_mode`, `card_name`, `status_code`, `status_message`, `currency`, `amount`, `oda_charges`, `billing_name`, `billing_address`, `billing_city`, `billing_state`, `billing_zip`, `billing_country`, `billing_tel`, `billing_email`, `delivery_name`, `delivery_address`, `delivery_city`, `delivery_state`, `delivery_zip`, `delivery_country`, `delivery_tel`, `merchant_param1`, `vault`, `offer_type`, `offer_code`, `discount_value`, `mer_amount`, `billing_notes`, `user_id`, `admin_order_status`, `payment_method`, `payment_status`, `trans_date`, `order_date`, `cancelled_by`) VALUES
(1, 1516872864, 0, '', '0', '', '', '', '', '', 'INR', 10500, 0, 'Partha Samanta', 'Temow IT Solutions', 'Kolkata', 'West Bengal', '700010', 'India', 9609353800, 'parthasamanta1993@gmail.com', 'Partha Samanta', 'Temow IT Solutions', 'Kolkata', 'West Bengal', '700010', 'India', 9609353800, '20,1,1,23,2,1,', 'N', 'null', 'null', NULL, 0, '', 0, 0, 'ccavenue', 0, '', '2018-01-25 00:00:00', 0),
(4, 1517211600, 0, '', '4', '', '', '', '', '', 'INR', 3500, 0, 'Partha Samanta', 'Temow IT Solutions', 'Kolkata', 'West Bengal', '700010', 'India', 9609353800, 'parthasamanta1993@gmail.com', 'Partha Samanta', 'Temow IT Solutions', 'Kolkata', 'West Bengal', '700010', 'India', 9609353800, '15,1,1,', 'N', 'null', 'null', NULL, 0, '', 0, 0, 'ccavenue', 0, '', '2018-01-29 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_autologin`
--

CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_autologin`
--

INSERT INTO `user_autologin` (`key_id`, `user_id`, `user_agent`, `last_ip`, `last_login`) VALUES
('3eff0f1795e4ec409dcee4579caaeb7b', 2, 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '14.195.230.147', '2017-12-02 06:36:46'),
('94763556a98446731e1e8a76639f8e8c', 27, 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '1.23.160.16', '2018-01-25 11:51:12'),
('a102db516e5aaa4a3d5ff60c5baa4155', 3, 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '14.195.227.4', '2017-12-04 06:07:11'),
('c31bcec465e26acaddb8d915f3e458bb', 1, 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36', '14.195.227.227', '2017-11-30 13:03:18'),
('c8af1384e7541db3b5cfed13a98234d0', 8, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36', '122.172.147.50', '2018-01-16 18:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `country`, `website`) VALUES
(1, 1, NULL, NULL),
(2, 3, NULL, NULL),
(3, 1, NULL, NULL),
(4, 2, NULL, NULL),
(5, 3, NULL, NULL),
(6, 4, NULL, NULL),
(7, 7, NULL, NULL),
(8, 8, NULL, NULL),
(9, 9, NULL, NULL),
(10, 25, NULL, NULL),
(11, 26, NULL, NULL),
(12, 27, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` varchar(250) COLLATE utf8_bin NOT NULL,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=27 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `username`, `password`, `email`, `activated`, `banned`, `ban_reason`, `new_password_key`, `new_password_requested`, `new_email`, `new_email_key`, `last_ip`, `last_login`, `created`, `modified`) VALUES
(26, 'Partha', 'Samanta', '9609353800', 'partha', '$2a$08$NZw0Bf/8frhHFxOYco301OlEHS2YqUSoeI14lXDZVKNpWx4dO4epO', 'parthasamanta1993@gmail.com', 1, 0, NULL, NULL, NULL, NULL, NULL, '1.23.160.212', '2018-02-02 06:38:47', '2018-01-25 10:42:40', '2018-02-06 15:22:49');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
