-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2024 at 07:56 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pct_v301`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `admin_user_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `password` varchar(500) NOT NULL,
  `show_password` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `username` varchar(500) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `address3` varchar(500) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `alt_mobile_no` varchar(50) DEFAULT NULL,
  `fax_no` varchar(50) DEFAULT NULL,
  `data_view` int(11) NOT NULL DEFAULT 0,
  `approval_access` int(11) NOT NULL DEFAULT 0,
  `user_image` varchar(250) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_loginip` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`admin_user_id`, `user_role_id`, `designation_id`, `name`, `first_name`, `last_name`, `password`, `show_password`, `email`, `username`, `country_id`, `state_id`, `city_id`, `address1`, `address2`, `address3`, `pincode`, `mobile_no`, `alt_mobile_no`, `fax_no`, `data_view`, `approval_access`, `user_image`, `added_by`, `added_on`, `updated_by`, `updated_on`, `status`, `last_login`, `last_loginip`, `joining_date`, `termination_date`) VALUES
(1, 1, 1, 'Krishna', 'Krishna', '', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'krishna@prachitours.in', 'admin', 1, 1, 8, 'Tumkuru', '', '', '560069', '9886551433', '', '', 1, 0, NULL, 1, '2022-11-21 00:00:00', 1, '2024-06-26 17:10:26', 1, '2024-08-07 16:52:20', '::1', '2022-03-11', '1970-01-01'),
(3, 0, 1, 'ramesh h', 'ramesh', 'h', 'edb43a6f411d80717742583ce13af55b', 'saitarun@annadatha', 'saitarun999@gmail.com', NULL, 1, 29, 1123, 'RAMAYAMPET', '', 'MEDAK DIST', '502101', '8555863004', '', '', 0, 0, NULL, 1, '2023-12-21 18:19:52', 1, '2024-06-19 16:57:47', 1, '2023-12-21 18:21:21', '49.249.163.201', '2023-12-21', NULL),
(4, 0, 1, 'ram gurav', 'ram', 'gurav', '6a204bd89f3c8348afd5c77c717a097a', 'asdfasdf', 'ramkumarsgurav@gmail.com', NULL, 1, 1, 2, 'chandra layout', 'bengaluru,560060', '', '560060', '8549065626', '', '', 1, 0, NULL, 1, '2024-06-23 12:52:15', NULL, NULL, 1, '2024-06-23 18:38:16', '::1', '2024-06-23', '2024-06-23');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_file`
--

CREATE TABLE `admin_user_file` (
  `admin_user_file_id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_file`
--

INSERT INTO `admin_user_file` (`admin_user_file_id`, `admin_user_id`, `file_title`, `file_name`) VALUES
(7, 3, 'prachi1', 'prachi_3_1.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_role`
--

CREATE TABLE `admin_user_role` (
  `admin_user_role` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `company_profile_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_role`
--

INSERT INTO `admin_user_role` (`admin_user_role`, `admin_user_id`, `user_role_id`, `company_profile_id`) VALUES
(16, 1, 1, 1),
(14, 3, 4, 1),
(15, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `position` int(11) DEFAULT 1,
  `banner_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `title1` varchar(255) DEFAULT NULL,
  `title2` varchar(255) DEFAULT NULL,
  `title3` varchar(255) DEFAULT NULL,
  `title4` varchar(255) DEFAULT NULL,
  `banner_for` char(1) DEFAULT '1',
  `status` char(1) DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `position`, `banner_name`, `image`, `link`, `title1`, `title2`, `title3`, `title4`, `banner_for`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(1, 4, 'test banner', 'banner_1.png', 'www.test-banner.com', 'test banner', '', '', '', '1', '0', '2024-07-01 12:23:11', 1, '2024-07-01 12:53:00', 1, '0', NULL, NULL),
(2, 1, 'first banner', 'banner_2.png', 'www.fist-banner.com', 'Mountain Serenity: Finding', 'Peace', 'Amidst Alpine Majesty', 'A picturesque picnic for two, basking in nature\'s                                  serenity, forging memories to last a lifetime.', '1', '1', '2024-07-01 12:36:28', 1, '2024-07-01 13:01:09', 1, '0', NULL, NULL),
(3, 2, 'second banner', 'banner_3.png', 'www.second-banner.com', 'Conquering the Waves:', 'Thrilling', 'Water Mount  Adventure', 'Riding the waves: A man finds joy and adventure on his water mount.', '1', '1', '2024-07-01 12:38:20', 1, '2024-07-01 12:53:04', 1, '0', NULL, NULL),
(4, 3, 'third banner', 'banner_4.png', 'www.third-banner.com', 'Glide into Adventure: Couples', 'Water', 'Skating Delight', 'Embrace the thrill as couples glide together, savoring                                  the joy of water skating delightfully.', '1', '1', '2024-07-01 12:38:59', 1, '2024-07-01 12:53:00', 1, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carousel_image`
--

CREATE TABLE `carousel_image` (
  `carousel_image_id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `position` int(10) DEFAULT 1,
  `file` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carousel_image`
--

INSERT INTO `carousel_image` (`carousel_image_id`, `tour_id`, `position`, `file`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(15, 10, 1, 'carousel_image_15.png', '1', '2024-06-22 17:07:47', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(16, 10, 1, 'carousel_image_16.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(17, 10, 1, 'carousel_image_17.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(18, 11, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(19, 11, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(20, 11, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(21, 12, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(22, 12, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(23, 12, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(25, 13, 1, 'carousel_image_16.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(27, 14, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(28, 14, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(29, 14, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(30, 15, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(31, 15, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(32, 15, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(34, 16, 1, 'carousel_image_16.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(36, 17, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(37, 17, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(38, 17, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(40, 18, 1, 'carousel_image_16.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(42, 21, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(43, 21, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(44, 21, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(45, 22, 1, 'carousel_image_15.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(46, 22, 1, 'carousel_image_16.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(47, 22, 1, 'carousel_image_17.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(48, 19, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(49, 19, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(50, 19, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(51, 20, 1, 'carousel_image_15.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(52, 20, 1, 'carousel_image_16.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(53, 20, 1, 'carousel_image_17.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(54, 22, 1, 'carousel_image_12.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(55, 22, 1, 'carousel_image_13.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(56, 22, 1, 'carousel_image_14.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(58, 24, 1, 'carousel_image_16.png', '1', '2024-06-22 15:28:16', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(60, 25, 1, 'carousel_image_60.png', '1', '2024-06-24 15:34:37', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(61, 25, 1, 'carousel_image_61.png', '1', '2024-06-24 15:34:37', 1, '2024-06-24 16:53:15', NULL, '0', NULL, NULL),
(64, 24, 5, 'carousel_image_64.png', '1', '2024-06-24 17:11:18', 1, '2024-06-24 17:11:18', NULL, '0', NULL, NULL),
(72, 24, 1, 'carousel_image_72.png', '1', '2024-06-26 14:48:50', 1, '2024-06-26 14:48:50', NULL, '0', NULL, NULL),
(73, 18, 1, 'carousel_image_73.png', '1', '2024-06-26 15:10:59', 1, '2024-06-26 15:10:59', NULL, '0', NULL, NULL),
(74, 18, 1, 'carousel_image_74.png', '1', '2024-06-26 15:10:59', 1, '2024-06-26 15:10:59', NULL, '0', NULL, NULL),
(75, 16, 1, 'carousel_image_75.png', '1', '2024-06-26 15:12:33', 1, '2024-06-26 15:12:33', NULL, '0', NULL, NULL),
(76, 16, 1, 'carousel_image_76.png', '1', '2024-06-26 15:12:33', 1, '2024-06-26 15:12:33', NULL, '0', NULL, NULL),
(77, 13, 1, 'carousel_image_77.png', '1', '2024-06-26 15:13:37', 1, '2024-06-26 15:13:37', NULL, '0', NULL, NULL),
(78, 13, 1, 'carousel_image_78.png', '1', '2024-06-26 15:13:37', 1, '2024-06-26 15:13:37', NULL, '0', NULL, NULL),
(79, 24, 1, 'carousel_image_79.png', '1', '2024-06-27 14:46:56', 1, '2024-06-27 14:46:56', NULL, '0', NULL, NULL),
(83, 1, 1, 'carousel_image_83.png', '1', '2024-06-29 11:31:26', 1, '2024-06-29 11:31:26', NULL, '0', NULL, NULL),
(84, 1, 1, 'carousel_image_84.png', '1', '2024-06-29 11:31:26', 1, '2024-06-29 11:31:26', NULL, '0', NULL, NULL),
(85, 1, 1, 'carousel_image_85.png', '1', '2024-06-29 11:31:26', 1, '2024-06-29 11:31:26', NULL, '0', NULL, NULL),
(86, 27, 1, 'carousel_image_86.png', '1', '2024-06-29 17:26:00', 1, '2024-06-29 17:26:00', NULL, '0', NULL, NULL),
(87, 27, 1, 'carousel_image_87.png', '1', '2024-06-29 17:26:00', 1, '2024-06-29 17:26:00', NULL, '0', NULL, NULL),
(88, 27, 1, 'carousel_image_88.png', '1', '2024-06-29 17:26:00', 1, '2024-06-29 17:26:00', NULL, '0', NULL, NULL),
(89, 26, 1, 'carousel_image_89.png', '1', '2024-06-29 19:05:49', 1, '2024-06-29 19:05:49', NULL, '0', NULL, NULL),
(90, 26, 1, 'carousel_image_90.png', '1', '2024-06-29 19:05:49', 1, '2024-06-29 19:05:49', NULL, '0', NULL, NULL),
(91, 26, 1, 'carousel_image_91.png', '1', '2024-06-29 19:05:49', 1, '2024-06-29 19:05:49', NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `city_code` varchar(255) DEFAULT NULL,
  `is_display` int(11) NOT NULL DEFAULT 1,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `country_id`, `state_id`, `city_name`, `city_code`, `is_display`, `added_on`, `added_by`, `updated_on`, `updated_by`, `status`) VALUES
(1, 1, 1, 'Dharwad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(2, 1, 1, 'Hubli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(3, 1, 1, 'Belagavi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(4, 1, 1, 'Mangaluru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(5, 1, 1, 'Davanagere', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(6, 1, 1, 'Ballari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(7, 1, 1, 'Mysore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(8, 1, 1, 'Tumkur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(9, 1, 1, 'Kolar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(10, 1, 1, 'Mandya', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(11, 1, 1, 'Udupi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(12, 1, 1, 'Chikkamagaluru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(13, 1, 1, 'Karwar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(14, 1, 1, 'Gokak', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(15, 1, 1, 'Yadgir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(16, 1, 1, 'Tiptur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(17, 1, 1, 'Arsikere', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(18, 1, 1, 'Nanjangud', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(19, 1, 1, 'Athni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(20, 1, 1, 'Wadi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(21, 1, 1, 'Nelamangala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(22, 1, 1, 'Lakshmeshwar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(23, 1, 1, 'Nargund', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(24, 1, 1, 'Tarikere', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(25, 1, 1, 'Lingsugur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(26, 1, 1, 'Vijayapura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(27, 1, 1, 'Talikota', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(28, 1, 1, 'Afzalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(29, 1, 1, 'Tekkalakote', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(30, 1, 1, 'Terdal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(31, 1, 1, 'Navalgund', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(32, 1, 2, 'Port Blair', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(33, 1, 3, 'Visakhapatnam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(34, 1, 3, 'Vijayawada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(35, 1, 3, 'Guntur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(36, 1, 3, 'Nellore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(37, 1, 3, 'Kurnool', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(38, 1, 3, 'Kakinada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(39, 1, 3, 'Tirupati', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(40, 1, 3, 'Anantapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(41, 1, 3, 'Kadapa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(42, 1, 3, 'Vizianagaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(43, 1, 3, 'Eluru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(44, 1, 3, 'Ongole', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(45, 1, 3, 'Nandyal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(46, 1, 3, 'Machilipatnam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(47, 1, 3, 'Adoni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(48, 1, 3, 'Tenali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(49, 1, 3, 'Chittoor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(50, 1, 3, 'Hindupur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(51, 1, 3, 'Bhimavaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(52, 1, 3, 'Madanapalle', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(53, 1, 3, 'Guntakal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(54, 1, 3, 'Dharmavaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(55, 1, 3, 'Gudivada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(56, 1, 3, 'Narasaraopet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(57, 1, 3, 'Tadpatri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(58, 1, 3, 'Tadepalligudem', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(59, 1, 3, 'Chilakaluripet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(60, 1, 3, 'Yemmiganur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(61, 1, 3, 'Kadiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(62, 1, 3, 'Chirala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(63, 1, 3, 'Anakapalle', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(64, 1, 3, 'Kavali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(65, 1, 3, 'Tanuku', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(66, 1, 3, 'Bapatla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(67, 1, 3, 'Naidupet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(68, 1, 3, 'Nagari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(69, 1, 3, 'Gudur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(70, 1, 3, 'Vinukonda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(71, 1, 3, 'Narasapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(72, 1, 3, 'Nuzvid', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(73, 1, 3, 'Kandukur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(74, 1, 3, 'Bobbili', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(75, 1, 3, 'Jaggaiahpet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(76, 1, 3, 'Tuni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(77, 1, 3, 'Amalapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(78, 1, 3, 'Bheemunipatnam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(79, 1, 3, 'Venkatagiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(80, 1, 3, 'Gooty', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(81, 1, 3, 'Jammalamadugu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(82, 1, 3, 'Nidadavole', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(83, 1, 3, 'Kovvur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(84, 1, 3, 'Tiruvuru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(85, 1, 3, 'Uravakonda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(86, 1, 3, 'Narsipatnam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(87, 1, 3, 'Yerraguntla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(88, 1, 4, 'Naharlagun', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(89, 1, 5, 'Guwahati', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(90, 1, 5, 'Dibrugarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(91, 1, 5, 'Nagaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(92, 1, 5, 'Tinsukia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(93, 1, 5, 'Jorhat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(94, 1, 5, 'Bongaigaon City', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(95, 1, 5, 'Dhubri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(96, 1, 5, 'Diphu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(97, 1, 5, 'North Lakhimpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(98, 1, 5, 'Tezpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(99, 1, 5, 'Karimganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(100, 1, 5, 'Goalpara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(101, 1, 5, 'Barpeta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(102, 1, 5, 'Lanka', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(103, 1, 5, 'Lumding', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(104, 1, 5, 'Nalbari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(105, 1, 6, 'Gaya', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(106, 1, 6, 'Bhagalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(107, 1, 6, 'Muzaffarpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(108, 1, 6, 'Darbhanga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(109, 1, 6, 'Arrah', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(110, 1, 6, 'Begusarai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(111, 1, 6, 'Chhapra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(112, 1, 6, 'Katihar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(113, 1, 6, 'Munger', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(114, 1, 6, 'Saharsa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(115, 1, 6, 'Sasaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(116, 1, 6, 'Hajipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(117, 1, 6, 'Dehri-on-Sone', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(118, 1, 6, 'Bettiah', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(119, 1, 6, 'Motihari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(120, 1, 6, 'Bagaha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(121, 1, 6, 'Kishanganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(122, 1, 6, 'Jamalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(123, 1, 6, 'Buxar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(124, 1, 6, 'Jehanabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(125, 1, 6, 'Aurangabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(126, 1, 6, 'Lakhisarai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(127, 1, 6, 'Nawada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(128, 1, 6, 'Jamui', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(129, 1, 6, 'Araria', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(130, 1, 6, 'Gopalganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(131, 1, 6, 'Dumraon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(132, 1, 6, 'Arwal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(133, 1, 6, 'Forbesganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(134, 1, 6, 'BhabUrban Agglomeration', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(135, 1, 6, 'Narkatiaganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(136, 1, 6, 'Naugachhia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(137, 1, 6, 'Warisaliganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(138, 1, 6, 'Nokha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(139, 1, 6, 'Lalganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(140, 1, 7, 'Chandigarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(141, 1, 8, 'Bhilai Nagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(142, 1, 8, 'Korba', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(143, 1, 8, 'Bilaspur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(144, 1, 8, 'Durg', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(145, 1, 8, 'Jagdalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(146, 1, 8, 'Ambikapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(147, 1, 8, 'Mahasamund', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(148, 1, 8, 'Dhamtari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(149, 1, 8, 'Chirmiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(150, 1, 8, 'Bhatapara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(151, 1, 8, 'Dalli-Rajhara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(152, 1, 8, 'Naila Janjgir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(153, 1, 8, 'Tilda Newra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(154, 1, 19, 'Silvassa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(155, 1, 10, 'Delhi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(156, 1, 10, 'New Delhi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(157, 1, 11, 'Marmagao', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(158, 1, 11, 'Panaji', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(159, 1, 11, 'Margao', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(160, 1, 11, 'Mapusa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(161, 1, 12, 'Ahmedabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(162, 1, 12, 'Vadodara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(163, 1, 12, 'Bhavnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(164, 1, 12, 'Jamnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(165, 1, 12, 'Nadiad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(166, 1, 12, 'Anand', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(167, 1, 12, 'Morvi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(168, 1, 12, 'Mahesana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(169, 1, 12, 'Bharuch', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(170, 1, 12, 'Vapi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(171, 1, 12, 'Navsari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(172, 1, 12, 'Veraval', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(173, 1, 12, 'Bhuj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(174, 1, 12, 'Godhra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(175, 1, 12, 'Palanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(176, 1, 12, 'Valsad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(177, 1, 12, 'Deesa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(178, 1, 12, 'Amreli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(179, 1, 12, 'Anjar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(180, 1, 12, 'Dhoraji', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(181, 1, 12, 'Khambhat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(182, 1, 12, 'Keshod', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(183, 1, 12, 'Wadhwan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(184, 1, 12, 'Ankleshwar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(185, 1, 12, 'Kadi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(186, 1, 12, 'Visnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(187, 1, 12, 'Upleta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(188, 1, 12, 'Una', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(189, 1, 12, 'Unjha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(190, 1, 12, 'Viramgam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(191, 1, 12, 'Kapadvanj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(192, 1, 12, 'Kalavad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(193, 1, 12, 'Wankaner', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(194, 1, 12, 'Limbdi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(195, 1, 12, 'Thangadh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(196, 1, 12, 'Vyara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(197, 1, 12, 'Lunawada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(198, 1, 12, 'Vapi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(199, 1, 12, 'Umreth', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(200, 1, 12, 'Tharad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(201, 1, 12, 'Umbergaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(202, 1, 12, 'Talaja', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(203, 1, 12, 'Vadnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(204, 1, 12, 'Vijapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(205, 1, 12, 'Lathi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(206, 1, 13, 'Faridabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(207, 1, 13, 'Gurgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(208, 1, 13, 'Hisar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(209, 1, 13, 'Panipat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(210, 1, 13, 'Karnal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(211, 1, 13, 'Yamunanagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(212, 1, 13, 'Panchkula', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(213, 1, 13, 'Bhiwani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(214, 1, 13, 'Bahadurgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(215, 1, 13, 'Jind', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(216, 1, 13, 'Thanesar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(217, 1, 13, 'Kaithal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(218, 1, 13, 'Palwal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(219, 1, 13, 'Hansi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(220, 1, 13, 'Narnaul', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(221, 1, 13, 'Fatehabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(222, 1, 13, 'Gohana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(223, 1, 13, 'Tohana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(224, 1, 13, 'Narwana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(225, 1, 13, 'Charkhi Dadri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(226, 1, 13, 'Ladwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(227, 1, 13, 'Taraori', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(228, 1, 14, 'Nahan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(229, 1, 15, 'Jammu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(230, 1, 15, 'Baramula', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(231, 1, 15, 'Anantnag', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(232, 1, 15, 'KathUrban Agglomeration', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(233, 1, 15, 'Udhampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(234, 1, 16, 'Dhanbad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(235, 1, 16, 'Jamshedpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(236, 1, 16, 'Bokaro Steel City', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(237, 1, 16, 'Deoghar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(238, 1, 16, 'Adityapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(239, 1, 16, 'Hazaribag', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(240, 1, 16, 'Giridih', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(241, 1, 16, 'Jhumri Tilaiya', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(242, 1, 16, 'Medininagar (Daltonganj)', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(243, 1, 16, 'Chaibasa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(244, 1, 16, 'Chatra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(245, 1, 16, 'Gumia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(246, 1, 16, 'Dumka', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(247, 1, 16, 'Chirkunda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(248, 1, 16, 'Lohardaga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(249, 1, 16, 'Tenu dam-cum-Kathhara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(250, 1, 17, 'Thiruvananthapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(251, 1, 17, 'Kochi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(252, 1, 17, 'Kozhikode', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(253, 1, 17, 'Kollam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(254, 1, 17, 'Thrissur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(255, 1, 17, 'Alappuzha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(256, 1, 17, 'Malappuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(257, 1, 17, 'Vatakara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(258, 1, 17, 'Kanhangad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(259, 1, 17, 'Taliparamba', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(260, 1, 17, 'Koyilandy', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(261, 1, 17, 'Neyyattinkara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(262, 1, 17, 'Kayamkulam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(263, 1, 17, 'Nedumangad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(264, 1, 17, 'Kannur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(265, 1, 17, 'Tirur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(266, 1, 17, 'Kottayam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(267, 1, 17, 'Kasaragod', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(268, 1, 17, 'Kunnamkulam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(269, 1, 17, 'Ottappalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(270, 1, 17, 'Thiruvalla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(271, 1, 17, 'Thodupuzha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(272, 1, 17, 'Chalakudy', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(273, 1, 17, 'Changanassery', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(274, 1, 17, 'Nilambur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(275, 1, 17, 'Cherthala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(276, 1, 17, 'Varkala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(277, 1, 17, 'Attingal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(278, 1, 17, 'Kodungallur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(279, 1, 17, 'Chittur-Thathamangalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(280, 1, 17, 'Adoor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(281, 1, 17, 'Vaikom', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(282, 1, 17, 'Guruvayoor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(283, 1, 18, 'Indore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(284, 1, 18, 'Bhopal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(285, 1, 18, 'Jabalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(286, 1, 18, 'Gwalior', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(287, 1, 18, 'Ujjain', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(288, 1, 18, 'Murwara (Katni)', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(289, 1, 18, 'Morena', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(290, 1, 18, 'Vidisha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(291, 1, 18, 'Ganjbasoda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(292, 1, 18, 'Mandsaur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(293, 1, 18, 'Neemuch', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(294, 1, 18, 'Nagda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(295, 1, 18, 'Itarsi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(296, 1, 18, 'Balaghat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(297, 1, 18, 'Ashok Nagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(298, 1, 18, 'Tikamgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(299, 1, 18, 'Alirajpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(300, 1, 18, 'Nowgong', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(301, 1, 18, 'Lahar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(302, 1, 18, 'Umaria', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(303, 1, 18, 'Narsinghgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(304, 1, 18, 'Nepanagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(305, 1, 18, 'Wara Seoni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(306, 1, 18, 'Tarana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(307, 1, 18, 'Niwari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(308, 1, 18, 'Nainpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(309, 1, 18, 'Nowrozabad (Khodargama)', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(310, 1, 19, 'Mumbai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(311, 1, 19, 'Nagpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(312, 1, 19, 'Thane', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(313, 1, 19, 'Nashik', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(314, 1, 19, 'Kalyan-Dombivali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(315, 1, 19, 'Vasai-Virar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(316, 1, 19, 'Mira-Bhayandar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(317, 1, 19, 'Bhiwandi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(318, 1, 19, 'Amravati', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(319, 1, 19, 'Nanded-Waghala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(320, 1, 19, 'Malegaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(321, 1, 19, 'Akola', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(322, 1, 19, 'Latur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(323, 1, 19, 'Dhule', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(324, 1, 19, 'Ahmednagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(325, 1, 19, 'Ichalkaranji', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(326, 1, 19, 'Yavatmal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(327, 1, 19, 'Achalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(328, 1, 19, 'Osmanabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(329, 1, 19, 'Nandurbar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(330, 1, 19, 'Wardha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(331, 1, 19, 'Udgir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(332, 1, 19, 'Aurangabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(333, 1, 19, 'Amalner', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(334, 1, 19, 'Akot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(335, 1, 19, 'Washim', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(336, 1, 19, 'Ambejogai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(337, 1, 19, 'Uran Islampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(338, 1, 19, 'Wani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(339, 1, 19, 'Lonavla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(340, 1, 19, 'Talegaon Dabhade', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(341, 1, 19, 'Anjangaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(342, 1, 19, 'Umred', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(343, 1, 19, 'Ozar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(344, 1, 19, 'Yevla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(345, 1, 19, 'Vita', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(346, 1, 19, 'Umarkhed', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(347, 1, 19, 'Warora', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(348, 1, 19, 'Tumsar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(349, 1, 19, 'Arvi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(350, 1, 19, 'Nandura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(351, 1, 19, 'Vaijapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(352, 1, 19, 'Wadgaon Road', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(353, 1, 19, 'Tasgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(354, 1, 19, 'Yawal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(355, 1, 19, 'Nilanga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(356, 1, 19, 'Wai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(357, 1, 19, 'Umarga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(358, 1, 19, 'Nawapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(359, 1, 19, 'Tuljapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(360, 1, 19, 'Uchgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(361, 1, 19, 'Uran', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(362, 1, 19, 'Karjat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(363, 1, 19, 'Talode', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(364, 1, 19, 'Vadgaon Kasba', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(365, 1, 19, 'Tirora', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(366, 1, 19, 'Lonar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(367, 1, 19, 'Narkhed', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(368, 1, 19, 'Loha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(369, 1, 20, 'Imphal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(370, 1, 20, 'Thoubal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(371, 1, 20, 'Lilong', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(372, 1, 21, 'Tura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(373, 1, 21, 'Nongstoin', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(374, 1, 22, 'Aizawl', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(375, 1, 22, 'Lunglei', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(376, 1, 23, 'Dimapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(377, 1, 23, 'Kohima', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(378, 1, 23, 'Zunheboto', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(379, 1, 23, 'Tuensang', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(380, 1, 23, 'Wokha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(381, 1, 24, 'Bhubaneswar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(382, 1, 24, 'Cuttack', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(383, 1, 24, 'Brahmapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(384, 1, 24, 'Sambalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(385, 1, 24, 'Baleshwar Town', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(386, 1, 24, 'Baripada Town', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(387, 1, 24, 'Bhadrak', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(388, 1, 24, 'Balangir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(389, 1, 24, 'Jharsuguda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(390, 1, 24, 'Bargarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(391, 1, 24, 'Bhawanipatna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(392, 1, 24, 'Dhenkanal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(393, 1, 24, 'Barbil', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(394, 1, 24, 'Kendujhar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(395, 1, 24, 'Jatani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(396, 1, 24, 'Byasanagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(397, 1, 24, 'Kendrapara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(398, 1, 24, 'Talcher', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(399, 1, 24, 'Titlagarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(400, 1, 24, 'Nabarangapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(401, 1, 25, 'Karaikal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(402, 1, 25, 'Yanam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(403, 1, 26, 'Ludhiana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(404, 1, 26, 'Amritsar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(405, 1, 26, 'Jalandhar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(406, 1, 26, 'Bathinda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(407, 1, 26, 'Hoshiarpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(408, 1, 26, 'Batala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(409, 1, 26, 'Moga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(410, 1, 26, 'Malerkotla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(411, 1, 26, 'Khanna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(412, 1, 26, 'Barnala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(413, 1, 26, 'Firozpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(414, 1, 26, 'Kapurthala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(415, 1, 26, 'Zirakpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(416, 1, 26, 'Kot Kapura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(417, 1, 26, 'Faridkot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(418, 1, 26, 'Fazilka', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(419, 1, 26, 'Gurdaspur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(420, 1, 26, 'Kharar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(421, 1, 26, 'Gobindgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(422, 1, 26, 'Nabha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(423, 1, 26, 'Tarn Taran', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(424, 1, 26, 'Jagraon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(425, 1, 26, 'Dhuri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(426, 1, 26, 'Firozpur Cantt.', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(427, 1, 26, 'Jalandhar Cantt.', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(428, 1, 26, 'Nawanshahr', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(429, 1, 26, 'Nangal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(430, 1, 26, 'Nakodar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(431, 1, 26, 'Zira', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(432, 1, 26, 'Longowal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(433, 1, 26, 'Urmar Tanda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(434, 1, 26, 'Qadian', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(435, 1, 27, 'Jaipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(436, 1, 27, 'Jodhpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(437, 1, 27, 'Bikaner', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(438, 1, 27, 'Udaipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(439, 1, 27, 'Ajmer', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(440, 1, 27, 'Bhilwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(441, 1, 27, 'Alwar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(442, 1, 27, 'Bharatpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(443, 1, 27, 'Pali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(444, 1, 27, 'Barmer', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(445, 1, 27, 'Tonk', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(446, 1, 27, 'Nagaur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(447, 1, 27, 'Ladnu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(448, 1, 27, 'Nokha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(449, 1, 27, 'Nimbahera', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(450, 1, 27, 'Lachhmangarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(451, 1, 27, 'Nasirabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(452, 1, 27, 'Nohar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(453, 1, 27, 'Nathdwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(454, 1, 27, 'Neem-Ka-Thana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(455, 1, 27, 'Lalsot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(456, 1, 27, 'Taranagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(457, 1, 27, 'Vijainagar, Ajmer', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(458, 1, 27, 'Lakheri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(459, 1, 27, 'Udaipurwati', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(460, 1, 27, 'Losal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(461, 1, 27, 'Nadbai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(462, 1, 27, 'Nagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(463, 1, 27, 'Todaraisingh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(464, 1, 27, 'Todabhim', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(465, 1, 28, 'Chennai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(466, 1, 28, 'Coimbatore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(467, 1, 28, 'Madurai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(468, 1, 28, 'Tiruchirappalli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(469, 1, 28, 'Salem', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(470, 1, 28, 'Tirunelveli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(471, 1, 28, 'Tiruppur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(472, 1, 28, 'Nagercoil', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(473, 1, 28, 'Thanjavur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(474, 1, 28, 'Vellore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(475, 1, 28, 'Kancheepuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(476, 1, 28, 'Erode', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(477, 1, 28, 'Tiruvannamalai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(478, 1, 28, 'Neyveli (TS)', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(479, 1, 28, 'Nagapattinam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(480, 1, 28, 'Viluppuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(481, 1, 28, 'Tiruchengode', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(482, 1, 28, 'Vaniyambadi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(483, 1, 28, 'Theni Allinagaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(484, 1, 28, 'Udhagamandalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(485, 1, 28, 'Aruppukkottai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(486, 1, 28, 'Arakkonam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(487, 1, 28, 'Virudhachalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(488, 1, 28, 'Tindivanam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(489, 1, 28, 'Virudhunagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(490, 1, 28, 'Karur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(491, 1, 28, 'Valparai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(492, 1, 28, 'Sankarankovil', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(493, 1, 28, 'Tenkasi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(494, 1, 28, 'Tirupathur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(495, 1, 28, 'Udumalaipettai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(496, 1, 28, 'Gobichettipalayam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(497, 1, 28, 'Thiruvarur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(498, 1, 28, 'Thiruvallur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(499, 1, 28, 'Namakkal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(500, 1, 28, 'Thirumangalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(501, 1, 28, 'Vikramasingapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(502, 1, 28, 'Nellikuppam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(503, 1, 28, 'Tiruttani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(504, 1, 28, 'Nandivaram-Guduvancheri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(505, 1, 28, 'Vellakoil', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(506, 1, 28, 'Vadalur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(507, 1, 28, 'Tiruvethipuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(508, 1, 28, 'Usilampatti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(509, 1, 28, 'Vedaranyam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(510, 1, 28, 'Nanjikottai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(511, 1, 28, 'Thuraiyur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(512, 1, 28, 'Tiruchendur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(513, 1, 28, 'Vandavasi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(514, 1, 28, 'Tharamangalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(515, 1, 28, 'Tirukkoyilur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(516, 1, 28, 'Oddanchatram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(517, 1, 28, 'Vadakkuvalliyur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(518, 1, 28, 'Tirukalukundram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(519, 1, 28, 'Uthamapalayam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(520, 1, 28, 'Vadipatti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(521, 1, 28, 'Tirupathur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(522, 1, 28, 'Viswanatham', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(523, 1, 28, 'Uthiramerur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(524, 1, 28, 'Thiruthuraipoondi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(525, 1, 28, 'Lalgudi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(526, 1, 28, 'Natham', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(527, 1, 28, 'Unnamalaikadai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(528, 1, 28, 'Tharangambadi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(529, 1, 28, 'Tittakudi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(530, 1, 28, 'O\' Valley', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(531, 1, 28, 'Thammampatti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(532, 1, 28, 'Namagiripettai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(533, 1, 29, 'Hyderabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(534, 1, 29, 'Warangal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(535, 1, 29, 'Nizamabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(536, 1, 29, 'Karimnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(537, 1, 29, 'Khammam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(538, 1, 29, 'Mahbubnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(539, 1, 29, 'Adilabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(540, 1, 29, 'Jagtial', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(541, 1, 29, 'Nirmal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(542, 1, 29, 'Kamareddy', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(543, 1, 29, 'Kothagudem', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(544, 1, 29, 'Bodhan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(545, 1, 29, 'Koratla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(546, 1, 29, 'Tandur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(547, 1, 29, 'Wanaparthy', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(548, 1, 29, 'Kagaznagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(549, 1, 29, 'Gadwal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(550, 1, 29, 'Bellampalle', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(551, 1, 29, 'Bhongir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(552, 1, 29, 'Vikarabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(553, 1, 29, 'Jangaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(554, 1, 29, 'Bhadrachalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(555, 1, 29, 'Bhainsa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(556, 1, 29, 'Farooqnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(557, 1, 29, 'Narayanpet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(558, 1, 29, 'Yellandu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(559, 1, 29, 'Kyathampalle', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(560, 1, 29, 'Nagarkurnool', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(561, 1, 30, 'Agartala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(562, 1, 30, 'Udaipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(563, 1, 30, 'Dharmanagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(564, 1, 30, 'Kailasahar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(565, 1, 31, 'Lucknow', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(566, 1, 31, 'Kanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(567, 1, 31, 'Firozabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(568, 1, 31, 'Agra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(569, 1, 31, 'Meerut', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(570, 1, 31, 'Varanasi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(571, 1, 31, 'Allahabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(572, 1, 31, 'Amroha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(573, 1, 31, 'Moradabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(574, 1, 31, 'Aligarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(575, 1, 31, 'Saharanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(576, 1, 31, 'Noida', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(577, 1, 31, 'Loni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(578, 1, 31, 'Jhansi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(579, 1, 31, 'Hapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(580, 1, 31, 'Etawah', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(581, 1, 31, 'Sambhal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(582, 1, 31, 'Orai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(583, 1, 31, 'Bahraich', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(584, 1, 31, 'Unnao', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(585, 1, 31, 'Lakhimpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(586, 1, 31, 'Lalitpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(587, 1, 31, 'Chandausi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(588, 1, 31, 'Hardoi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(589, 1, 31, 'Azamgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(590, 1, 31, 'Khair', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(591, 1, 31, 'Tanda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(592, 1, 31, 'Nagina', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(593, 1, 31, 'Najibabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(594, 1, 31, 'Vrindavan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(595, 1, 31, 'Ujhani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(596, 1, 31, 'Laharpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(597, 1, 31, 'Tilhar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(598, 1, 31, 'Kalpi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(599, 1, 31, 'Tundla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(600, 1, 31, 'Nanpara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(601, 1, 31, 'Nehtaur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(602, 1, 31, 'Thakurdwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(603, 1, 31, 'Nawabganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(604, 1, 31, 'Noorpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(605, 1, 31, 'Thana Bhawan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(606, 1, 31, 'Zaidpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(607, 1, 31, 'Nautanwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(608, 1, 31, 'Zamania', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(609, 1, 31, 'Naugawan Sadat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(610, 1, 31, 'Fatehpur Sikri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(611, 1, 31, 'Utraula', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(612, 1, 31, 'Lar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(613, 1, 31, 'Lal Gopalganj Nindaura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(614, 1, 31, 'Tulsipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(615, 1, 31, 'Tirwaganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(616, 1, 31, 'Warhapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(617, 1, 31, 'Achhnera', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(618, 1, 31, 'Naraura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(619, 1, 31, 'Nakur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(620, 1, 31, 'Lalganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(621, 1, 32, 'Dehradun', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(622, 1, 32, 'Hardwar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(623, 1, 32, 'Haldwani-cum-Kathgodam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(624, 1, 32, 'Kashipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(625, 1, 32, 'Nainital', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(626, 1, 32, 'Tehri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(627, 1, 32, 'Nagla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(628, 1, 33, 'Kolkata', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(629, 1, 33, 'Asansol', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(630, 1, 33, 'Kharagpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(631, 1, 33, 'Naihati', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(632, 1, 33, 'English Bazar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(633, 1, 33, 'Baharampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(634, 1, 33, 'Hugli-Chinsurah', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(635, 1, 33, 'Jalpaiguri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(636, 1, 33, 'Santipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(637, 1, 33, 'Balurghat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(638, 1, 33, 'Habra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(639, 1, 33, 'Bankura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(640, 1, 33, 'Nabadwip', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(641, 1, 33, 'Darjiling', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(642, 1, 33, 'Arambagh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(643, 1, 33, 'Tamluk', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(644, 1, 33, 'AlipurdUrban Agglomeratio', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(645, 1, 33, 'Jhargram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(646, 1, 33, 'Gangarampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(647, 1, 33, 'Kalimpong', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(648, 1, 33, 'Taki', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(649, 1, 33, 'Tarakeswar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(650, 1, 19, 'Parli Vaijnath', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(651, 1, 1, 'Bangalore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(652, 1, 16, 'Pakur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(653, 1, 19, 'Pune', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(654, 1, 31, 'Ballia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(655, 1, 28, 'Tambaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(656, 1, 27, 'Suratgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(657, 1, 27, 'Mount Abu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(658, 1, 1, 'Bidar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(659, 1, 31, 'Ghaziabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(660, 1, 19, 'Chiplun', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(661, 1, 15, 'Srinagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(662, 1, 3, 'Rajahmundry', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(663, 1, 3, 'Proddatur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(664, 1, 3, 'Srikakulam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(665, 1, 3, 'Rajampet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(666, 1, 3, 'Palacole', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(667, 1, 3, 'Sullurpeta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(668, 1, 3, 'Rayachoti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(669, 1, 3, 'Srikalahasti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(670, 1, 3, 'Markapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(671, 1, 3, 'Ponnur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(672, 1, 3, 'Rayadurg', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(673, 1, 3, 'Samalkot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(674, 1, 3, 'Sattenapalle', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(675, 1, 3, 'Pithapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(676, 1, 3, 'Palasa Kasibugga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(677, 1, 3, 'Parvathipuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(678, 1, 3, 'Macherla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(679, 1, 3, 'Salur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(680, 1, 3, 'Mandapeta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(681, 1, 3, 'Peddapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(682, 1, 3, 'Punganur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(683, 1, 3, 'Repalle', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(684, 1, 3, 'Ramachandrapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(685, 1, 3, 'Pedana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(686, 1, 3, 'Puttur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(687, 1, 3, 'Renigunta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(688, 1, 3, 'Rajam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(689, 1, 3, 'Srisailam Project (Right ', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(690, 1, 4, 'Pasighat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(691, 1, 5, 'Silchar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1);
INSERT INTO `city` (`city_id`, `country_id`, `state_id`, `city_name`, `city_code`, `is_display`, `added_on`, `added_by`, `updated_on`, `updated_by`, `status`) VALUES
(692, 1, 5, 'Sibsagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(693, 1, 5, 'Mankachar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(694, 1, 5, 'Rangia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(695, 1, 5, 'Margherita', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(696, 1, 5, 'Mangaldoi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(697, 1, 5, 'Silapathar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(698, 1, 5, 'Mariani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(699, 1, 5, 'Marigaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(700, 1, 6, 'Patna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(701, 1, 6, 'Purnia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(702, 1, 6, 'Siwan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(703, 1, 6, 'Sitamarhi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(704, 1, 6, 'Madhubani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(705, 1, 6, 'Masaurhi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(706, 1, 6, 'Samastipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(707, 1, 6, 'Mokameh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(708, 1, 6, 'Supaul', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(709, 1, 6, 'Madhepura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(710, 1, 6, 'Sheikhpura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(711, 1, 6, 'Sultanganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(712, 1, 6, 'Raxaul Bazar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(713, 1, 6, 'Ramnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(714, 1, 6, 'Mahnar Bazar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(715, 1, 6, 'Revelganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(716, 1, 6, 'Rajgir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(717, 1, 6, 'Sonepur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(718, 1, 6, 'Sherghati', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(719, 1, 6, 'Sugauli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(720, 1, 6, 'Makhdumpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(721, 1, 6, 'Maner', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(722, 1, 6, 'Rosera', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(723, 1, 6, 'Piro', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(724, 1, 6, 'Rafiganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(725, 1, 6, 'Marhaura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(726, 1, 6, 'Mirganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(727, 1, 6, 'Murliganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(728, 1, 6, 'Motipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(729, 1, 6, 'Manihari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(730, 1, 6, 'Sheohar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(731, 1, 6, 'Maharajganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(732, 1, 6, 'Silao', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(733, 1, 6, 'Barh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(734, 1, 6, 'Asarganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(735, 1, 8, 'Raipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(736, 1, 8, 'Rajnandgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(737, 1, 8, 'Raigarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(738, 1, 8, 'Mungeli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(739, 1, 8, 'Manendragarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(740, 1, 8, 'Sakti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(741, 1, 12, 'Surat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(742, 1, 12, 'Rajkot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(743, 1, 12, 'Porbandar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(744, 1, 12, 'Patan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(745, 1, 12, 'Mahuva', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(746, 1, 12, 'Savarkundla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(747, 1, 12, 'Sidhpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(748, 1, 12, 'Mangrol', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(749, 1, 12, 'Modasa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(750, 1, 12, 'Palitana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(751, 1, 12, 'Petlad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(752, 1, 12, 'Sihor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(753, 1, 12, 'Mandvi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(754, 1, 12, 'Padra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(755, 1, 12, 'Rajpipla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(756, 1, 12, 'Sanand', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(757, 1, 12, 'Rajula', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(758, 1, 12, 'Radhanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(759, 1, 12, 'Mahemdabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(760, 1, 12, 'Ranavav', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(761, 1, 12, 'Mansa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(762, 1, 12, 'Manavadar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(763, 1, 12, 'Salaya', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(764, 1, 12, 'Pardi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(765, 1, 12, 'Rapar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(766, 1, 12, 'Songadh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(767, 1, 12, 'Adalaj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(768, 1, 13, 'Rohtak', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(769, 1, 13, 'Sonipat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(770, 1, 13, 'Sirsa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(771, 1, 13, 'Rewari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(772, 1, 13, 'Mandi Dabwali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(773, 1, 13, 'Shahbad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(774, 1, 13, 'Pehowa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(775, 1, 13, 'Samalkha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(776, 1, 13, 'Pinjore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(777, 1, 13, 'Sohna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(778, 1, 13, 'Safidon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(779, 1, 13, 'Mahendragarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(780, 1, 13, 'Ratia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(781, 1, 13, 'Rania', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(782, 1, 13, 'Sarsod', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(783, 1, 14, 'Shimla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(784, 1, 14, 'Mandi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(785, 1, 14, 'Solan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(786, 1, 14, 'Sundarnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(787, 1, 14, 'Palampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(788, 1, 15, 'Srinagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(789, 1, 15, 'Sopore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(790, 1, 15, 'Rajauri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(791, 1, 15, 'Poonch', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(792, 1, 16, 'Ranchi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(793, 1, 16, 'Phusro', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(794, 1, 16, 'Ramgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(795, 1, 16, 'Saunda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(796, 1, 16, 'Sahibganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(797, 1, 16, 'Madhupur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(798, 1, 16, 'Pakaur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(799, 1, 16, 'Simdega', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(800, 1, 16, 'Musabani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(801, 1, 16, 'Mihijam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(802, 1, 16, 'Patratu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(803, 1, 1, 'Shivamogga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(804, 1, 1, 'Raayachuru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(805, 1, 1, 'Robertson Pet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(806, 1, 1, 'Ranebennuru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(807, 1, 1, 'Ranibennur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(808, 1, 1, 'Ramanagaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(809, 1, 1, 'Rabkavi Banhatti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(810, 1, 1, 'Shahabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(811, 1, 1, 'Sirsi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(812, 1, 1, 'Sindhnur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(813, 1, 1, 'Sagara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(814, 1, 1, 'Sira', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(815, 1, 1, 'Puttur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(816, 1, 1, 'Mulbagal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(817, 1, 1, 'Surapura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(818, 1, 1, 'Siruguppa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(819, 1, 1, 'Mudhol', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(820, 1, 1, 'Sidlaghatta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(821, 1, 1, 'Shahpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(822, 1, 1, 'Saundatti-Yellamma', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(823, 1, 1, 'Manvi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(824, 1, 1, 'Ramdurg', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(825, 1, 1, 'Malavalli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(826, 1, 1, 'Savanur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(827, 1, 1, 'Sankeshwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(828, 1, 1, 'Madikeri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(829, 1, 1, 'Sedam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(830, 1, 1, 'Shikaripur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(831, 1, 1, 'Mahalingapura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(832, 1, 1, 'Mudalagi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(833, 1, 1, 'Muddebihal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(834, 1, 1, 'Pavagada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(835, 1, 1, 'Malur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(836, 1, 1, 'Sindhagi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(837, 1, 1, 'Sanduru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(838, 1, 1, 'Maddur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(839, 1, 1, 'Madhugiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(840, 1, 1, 'Mudabidri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(841, 1, 1, 'Magadi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(842, 1, 1, 'Shiggaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(843, 1, 1, 'Shrirangapattana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(844, 1, 1, 'Sindagi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(845, 1, 1, 'Sakaleshapura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(846, 1, 1, 'Srinivaspur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(847, 1, 1, 'Ron', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(848, 1, 1, 'Mundargi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(849, 1, 1, 'Sadalagi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(850, 1, 1, 'Piriyapatna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(851, 1, 1, 'Adyar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(852, 1, 17, 'Palakkad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(853, 1, 17, 'Ponnani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(854, 1, 17, 'Punalur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(855, 1, 17, 'Perinthalmanna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(856, 1, 17, 'Mattannur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(857, 1, 17, 'Shoranur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(858, 1, 17, 'Paravoor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(859, 1, 17, 'Pathanamthitta', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(860, 1, 17, 'Peringathur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(861, 1, 17, 'Pappinisseri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(862, 1, 17, 'Muvattupuzha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(863, 1, 17, 'Mavelikkara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(864, 1, 17, 'Mavoor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(865, 1, 17, 'Perumbavoor', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(866, 1, 17, 'Palai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(867, 1, 17, 'Panniyannur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(868, 1, 17, 'Puthuppally', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(869, 1, 17, 'Panamattom', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(870, 1, 18, 'Sagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(871, 1, 18, 'Ratlam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(872, 1, 18, 'Satna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(873, 1, 18, 'Singrauli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(874, 1, 18, 'Rewa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(875, 1, 18, 'Shivpuri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(876, 1, 18, 'Sarni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(877, 1, 18, 'Sehore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(878, 1, 18, 'Mhow Cantonment', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(879, 1, 18, 'Seoni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(880, 1, 18, 'Shahdol', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(881, 1, 18, 'Pithampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(882, 1, 18, 'Mandla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(883, 1, 18, 'Sheopur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(884, 1, 18, 'Shajapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(885, 1, 18, 'Panna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(886, 1, 18, 'Raghogarh-Vijaypur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(887, 1, 18, 'Sendhwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(888, 1, 18, 'Sidhi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(889, 1, 18, 'Pipariya', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(890, 1, 18, 'Shujalpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(891, 1, 18, 'Sironj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(892, 1, 18, 'Pandhurna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(893, 1, 18, 'Mandideep', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(894, 1, 18, 'Sihora', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(895, 1, 18, 'Raisen', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(896, 1, 18, 'Maihar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(897, 1, 18, 'Sanawad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(898, 1, 18, 'Sabalgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(899, 1, 18, 'Porsa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(900, 1, 18, 'Malaj Khand', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(901, 1, 18, 'Sarangpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(902, 1, 18, 'Mundi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(903, 1, 18, 'Pasan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(904, 1, 18, 'Mahidpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(905, 1, 18, 'Seoni-Malwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(906, 1, 18, 'Rehli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(907, 1, 18, 'Manawar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(908, 1, 18, 'Rahatgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(909, 1, 18, 'Panagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(910, 1, 18, 'Sausar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(911, 1, 18, 'Rajgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(912, 1, 18, 'Mauganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(913, 1, 18, 'Manasa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(914, 1, 18, 'Prithvipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(915, 1, 18, 'Sohagpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(916, 1, 18, 'Shamgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(917, 1, 18, 'Maharajpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(918, 1, 18, 'Multai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(919, 1, 18, 'Pachore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(920, 1, 18, 'Rau', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(921, 1, 18, 'Mhowgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(922, 1, 18, 'Vijaypur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(923, 1, 19, 'Solapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(924, 1, 19, 'Sangli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(925, 1, 19, 'Parbhani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(926, 1, 19, 'Panvel', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(927, 1, 19, 'Satara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(928, 1, 19, 'Pandharpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(929, 1, 19, 'Shrirampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(930, 1, 19, 'Parli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(931, 1, 19, 'Manmad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(932, 1, 19, 'Ratnagiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(933, 1, 19, 'Pusad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(934, 1, 19, 'Sangamner', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(935, 1, 19, 'Shirpur-Warwade', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(936, 1, 19, 'Malkapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(937, 1, 19, 'Palghar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(938, 1, 19, 'Shegaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(939, 1, 19, 'Phaltan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(940, 1, 19, 'Shahade', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(941, 1, 19, 'Pachora', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(942, 1, 19, 'Manjlegaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(943, 1, 19, 'Sillod', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(944, 1, 19, 'Sailu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(945, 1, 19, 'Murtijapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(946, 1, 19, 'Mehkar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(947, 1, 19, 'Pulgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(948, 1, 19, 'Paithan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(949, 1, 19, 'Rahuri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(950, 1, 19, 'Morshi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(951, 1, 19, 'Purna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(952, 1, 19, 'Satana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(953, 1, 19, 'Pathri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(954, 1, 19, 'Sinnar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(955, 1, 19, 'Pen', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(956, 1, 19, 'Manwath', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(957, 1, 19, 'Partur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(958, 1, 19, 'Sangole', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(959, 1, 19, 'Mangrulpir', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(960, 1, 19, 'Risod', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(961, 1, 19, 'Shirur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(962, 1, 19, 'Savner', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(963, 1, 19, 'Sasvad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(964, 1, 19, 'Pandharkaoda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(965, 1, 19, 'Shrigonda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(966, 1, 19, 'Shirdi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(967, 1, 19, 'Raver', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(968, 1, 19, 'Mukhed', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(969, 1, 19, 'Rajura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(970, 1, 19, 'Mahad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(971, 1, 19, 'Sawantwadi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(972, 1, 19, 'Pathardi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(973, 1, 19, 'Pauni', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(974, 1, 19, 'Ramtek', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(975, 1, 19, 'Mul', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(976, 1, 19, 'Soyagaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(977, 1, 19, 'Mangalvedhe', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(978, 1, 19, 'Shendurjana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(979, 1, 19, 'Patur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(980, 1, 19, 'Mhaswad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(981, 1, 19, 'Nandgaon', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(982, 1, 19, 'Warud', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(983, 1, 20, 'Mayang Imphal', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(984, 1, 21, 'Shillong', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(985, 1, 22, 'Saiha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(986, 1, 23, 'Mokokchung', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(987, 1, 24, 'Raurkela', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(988, 1, 24, 'Puri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(989, 1, 24, 'Paradip', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(990, 1, 24, 'Sunabeda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(991, 1, 24, 'Rayagada', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(992, 1, 24, 'Rajagangapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(993, 1, 24, 'Parlakhemundi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(994, 1, 24, 'Sundargarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(995, 1, 24, 'Phulabani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(996, 1, 24, 'Pattamundai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(997, 1, 24, 'Soro', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(998, 1, 24, 'Malkangiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(999, 1, 24, 'Rairangpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1000, 1, 24, 'Tarbha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1001, 1, 25, 'Pondicherry', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1002, 1, 25, 'Mahe', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1003, 1, 26, 'Patiala', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1004, 1, 26, 'Pathankot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1005, 1, 26, 'Mohali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1006, 1, 26, 'Phagwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1007, 1, 26, 'Muktsar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1008, 1, 26, 'Rajpura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1009, 1, 26, 'Sangrur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1010, 1, 26, 'Mansa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1011, 1, 26, 'Malout', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1012, 1, 26, 'Sunam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1013, 1, 26, 'Sirhind Fatehgarh Sahib', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1014, 1, 26, 'Rupnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1015, 1, 26, 'Samana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1016, 1, 26, 'Rampura Phul', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1017, 1, 26, 'Patti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1018, 1, 26, 'Raikot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1019, 1, 26, 'Morinda, India', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1020, 1, 26, 'Phillaur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1021, 1, 26, 'Pattran', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1022, 1, 26, 'Sujanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1023, 1, 26, 'Mukerian', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1024, 1, 26, 'Talwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1025, 1, 27, 'Sikar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1026, 1, 27, 'Sadulpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1027, 1, 27, 'Sawai Madhopur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1028, 1, 27, 'Makrana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1029, 1, 27, 'Sujangarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1030, 1, 27, 'Sardarshahar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1031, 1, 27, 'Ratangarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1032, 1, 27, 'Rajsamand', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1033, 1, 27, 'Rajgarh (Churu)', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1034, 1, 27, 'Phalodi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1035, 1, 27, 'Pilani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1036, 1, 27, 'Merta City', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1037, 1, 27, 'Sojat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1038, 1, 27, 'Sirohi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1039, 1, 27, 'Pratapgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1040, 1, 27, 'Rawatbhata', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1041, 1, 27, 'Sangaria', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1042, 1, 27, 'Pilibanga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1043, 1, 27, 'Pipar City', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1044, 1, 27, 'Sumerpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1045, 1, 27, 'Sagwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1046, 1, 27, 'Ramganj Mandi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1047, 1, 27, 'Sri Madhopur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1048, 1, 27, 'Ramngarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1049, 1, 27, 'Rawatsar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1050, 1, 27, 'Rajakhera', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1051, 1, 27, 'Shahpura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1052, 1, 27, 'Shahpura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1053, 1, 27, 'Raisinghnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1054, 1, 27, 'Malpura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1055, 1, 27, 'Sanchore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1056, 1, 27, 'Rajgarh (Alwar)', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1057, 1, 27, 'Sheoganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1058, 1, 27, 'Sadri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1059, 1, 27, 'Reengus', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1060, 1, 27, 'Rajaldesar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1061, 1, 27, 'Sadulshahar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1062, 1, 27, 'Sambhar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1063, 1, 27, 'Prantij', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1064, 1, 27, 'Mangrol', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1065, 1, 27, 'Phulera', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1066, 1, 27, 'Mandawa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1067, 1, 27, 'Pindwara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1068, 1, 27, 'Mandalgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1069, 1, 27, 'Takhatgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1070, 1, 28, 'Ranipet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1071, 1, 28, 'Pollachi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1072, 1, 28, 'Rajapalayam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1073, 1, 28, 'Sivakasi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1074, 1, 28, 'Pudukkottai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1075, 1, 28, 'Paramakudi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1076, 1, 28, 'Srivilliputhur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1077, 1, 28, 'Palani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1078, 1, 28, 'Pattukkottai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1079, 1, 28, 'Ramanathapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1080, 1, 28, 'Panruti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1081, 1, 28, 'Rasipuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1082, 1, 28, 'Periyakulam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1083, 1, 28, 'Pernampattu', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1084, 1, 28, 'Sivaganga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1085, 1, 28, 'Rameshwaram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1086, 1, 28, 'Perambalur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1087, 1, 28, 'Sathyamangalam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1088, 1, 28, 'Puliyankudi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1089, 1, 28, 'Sirkali', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1090, 1, 28, 'Periyasemur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1091, 1, 28, 'Sattur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1092, 1, 28, 'Palladam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1093, 1, 28, 'Surandai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1094, 1, 28, 'Sankari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1095, 1, 28, 'Shenkottai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1096, 1, 28, 'Sholingur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1097, 1, 28, 'Manachanallur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1098, 1, 28, 'Polur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1099, 1, 28, 'Panagudi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1100, 1, 28, 'Pallapatti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1101, 1, 28, 'Ponneri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1102, 1, 28, 'P.N.Patti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1103, 1, 28, 'Pacode', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1104, 1, 28, 'Suriyampalayam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1105, 1, 28, 'Sholavandan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1106, 1, 28, 'Peravurani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1107, 1, 28, 'Parangipettai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1108, 1, 28, 'Pudupattinam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1109, 1, 28, 'Pallikonda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1110, 1, 28, 'Sivagiri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1111, 1, 28, 'Punjaipugalur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1112, 1, 28, 'Padmanabhapuram', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1113, 1, 28, 'Thirupuvanam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1114, 1, 29, 'Ramagundam', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1115, 1, 29, 'Mancherial', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1116, 1, 29, 'Suryapet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1117, 1, 29, 'Miryalaguda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1118, 1, 29, 'Palwancha', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1119, 1, 29, 'Mandamarri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1120, 1, 29, 'Sircilla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1121, 1, 29, 'Siddipet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1122, 1, 29, 'Sangareddy', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1123, 1, 29, 'Medak', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1124, 1, 29, 'Sadasivpet', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1125, 1, 29, 'Manuguru', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1126, 1, 30, 'Pratapgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1127, 1, 30, 'Belonia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1128, 1, 30, 'Khowai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1129, 1, 31, 'Shahjahanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1130, 1, 31, 'Rampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1131, 1, 31, 'Modinagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1132, 1, 31, 'Rae Bareli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1133, 1, 31, 'Sitapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1134, 1, 31, 'Pilibhit', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1135, 1, 31, 'Hardoi ', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1136, 1, 31, 'Sultanpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1137, 1, 31, 'Shamli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1138, 1, 31, 'Shikohabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1139, 1, 31, 'Sikandrabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1140, 1, 31, 'Shahabad, Hardoi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1141, 1, 31, 'Pilkhuwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1142, 1, 31, 'Renukoot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1143, 1, 31, 'Sahaswan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1144, 1, 31, 'Rath', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1145, 1, 31, 'Sherkot', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1146, 1, 31, 'Sandila', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1147, 1, 31, 'Sardhana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1148, 1, 31, 'Seohara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1149, 1, 31, 'Padrauna', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1150, 1, 31, 'Mathura', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1151, 1, 31, 'Siana', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1152, 1, 31, 'Sikandra Rao', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1153, 1, 31, 'Puranpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1154, 1, 31, 'Rudauli', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1155, 1, 31, 'Palia Kalan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1156, 1, 31, 'Shikarpur, Bulandshahr', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1157, 1, 31, 'Shahabad, Rampur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1158, 1, 31, 'Robertsganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1159, 1, 31, 'Sadabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1160, 1, 31, 'Rasra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1161, 1, 31, 'Sirsaganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1162, 1, 31, 'Pihani', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1163, 1, 31, 'Shamsabad, Agra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1164, 1, 31, 'Rudrapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1165, 1, 31, 'Soron', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1166, 1, 31, 'SUrban Agglomerationr', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1167, 1, 31, 'Samdhan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1168, 1, 31, 'Sahjanwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1169, 1, 31, 'Rampur Maniharan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1170, 1, 31, 'Sumerpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1171, 1, 31, 'Shahganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1172, 1, 31, 'PurqUrban Agglomerationzi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1173, 1, 31, 'Shamsabad, Farrukhabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1174, 1, 31, 'Powayan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1175, 1, 31, 'Sandi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1176, 1, 31, 'Sahaspur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1177, 1, 31, 'Safipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1178, 1, 31, 'Reoti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1179, 1, 31, 'Sikanderpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1180, 1, 31, 'Saidpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1181, 1, 31, 'Sirsi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1182, 1, 31, 'Purwa', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1183, 1, 31, 'Parasi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1184, 1, 31, 'Phulpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1185, 1, 31, 'Shishgarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1186, 1, 31, 'Sahawar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1187, 1, 31, 'Samthar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1188, 1, 31, 'Pukhrayan', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1189, 1, 31, 'Obra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1190, 1, 31, 'Niwai', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1191, 1, 32, 'Srinagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1192, 1, 32, 'Roorkee', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1193, 1, 32, 'Rudrapur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1194, 1, 32, 'Rishikesh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1195, 1, 32, 'Ramnagar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1196, 1, 32, 'Pithoragarh', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1197, 1, 32, 'Manglaur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1198, 1, 32, 'Mussoorie', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1199, 1, 32, 'Pauri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1200, 1, 32, 'Sitarganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1201, 1, 32, 'Bageshwar', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1202, 1, 33, 'Siliguri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1203, 1, 33, 'Raghunathganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1204, 1, 33, 'Raiganj', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1205, 1, 33, 'Medinipur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1206, 1, 33, 'Ranaghat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1207, 1, 33, 'Purulia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1208, 1, 33, 'AlipurdUrban Agglomeratio', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1209, 1, 33, 'Suri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1210, 1, 33, 'Rampurhat', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1211, 1, 33, 'Sainthia', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1212, 1, 33, 'Murshidabad', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1213, 1, 33, 'Memari', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1214, 1, 33, 'Paschim Punropara', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1215, 1, 33, 'Sonamukhi', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1216, 1, 33, 'PandUrban Agglomeration', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1217, 1, 33, 'Mainaguri', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1218, 1, 33, 'Malda', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1219, 1, 33, 'Panchla', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1220, 1, 33, 'Raghunathpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1221, 1, 33, 'Mathabhanga', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1222, 1, 33, 'Monoharpur', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1223, 1, 33, 'Srirampore', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1224, 1, 33, 'Adra', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1),
(1225, 1, 31, 'Shravasti', '', 1, '0000-00-00 00:00:00', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_profile`
--

CREATE TABLE `company_profile` (
  `company_profile_id` int(11) NOT NULL,
  `company_unique_name` varchar(1200) NOT NULL,
  `company_name` varchar(1200) NOT NULL,
  `company_email` varchar(500) DEFAULT NULL,
  `company_website` varchar(500) DEFAULT NULL,
  `letterhead_header_image` varchar(255) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address1` varchar(500) NOT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `address3` varchar(500) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `alt_mobile_no` varchar(50) DEFAULT NULL,
  `gst_no` varchar(15) DEFAULT NULL,
  `user_image` varchar(250) DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_profile`
--

INSERT INTO `company_profile` (`company_profile_id`, `company_unique_name`, `company_name`, `company_email`, `company_website`, `letterhead_header_image`, `name`, `first_name`, `last_name`, `email`, `logo`, `country_id`, `state_id`, `city_id`, `address1`, `address2`, `address3`, `pincode`, `mobile_no`, `alt_mobile_no`, `gst_no`, `user_image`, `added_by`, `added_on`, `updated_by`, `updated_on`, `status`) VALUES
(1, 'Prachi Tours', 'Prachi Toursim', 'info@prachitours.in', 'www.prachitours.in', 'letterhead_1.png', 'Krishna', 'Krishna', '', 'info@prachitours.in', 'logo_1.png', 1, 1, 8, 'Tumkuru', 'Ramayampet Medak', '', '502101', '9666364912', '', '29AASFM3822G1ZY', NULL, 1, '2022-11-21 15:17:21', 1, '2024-06-26 17:09:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_short_name` varchar(255) NOT NULL,
  `dial_code` varchar(255) NOT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_short_name`, `dial_code`, `country_code`, `added_on`, `added_by`, `updated_on`, `updated_by`, `status`) VALUES
(1, 'India', 'IN', '0', '91', '2022-11-21 20:26:13', 1, '2023-01-06 10:46:38', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `currency_name` varchar(500) NOT NULL,
  `currency_code` varchar(500) NOT NULL,
  `currency_rate` varchar(100) NOT NULL,
  `symbol` varchar(225) NOT NULL,
  `added_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `defaults` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `country_id`, `currency_name`, `currency_code`, `currency_rate`, `symbol`, `added_on`, `updated_on`, `added_by`, `updated_by`, `status`, `defaults`) VALUES
(1, 1, 'Indian Rupee', 'INR', '1', '<i class=\'fa fa-inr\'></i>', '2019-01-31 11:15:18', '2019-10-26 17:36:12', 1, 1, 1, 1),
(2, 1, 'US Dollar', 'USD', '0.014', '$', '2019-01-31 11:47:06', '2019-10-26 17:36:45', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `designation_master`
--

CREATE TABLE `designation_master` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation_master`
--

INSERT INTO `designation_master` (`designation_id`, `designation_name`, `added_on`, `added_by`, `updated_on`, `updated_by`, `status`) VALUES
(1, 'Product Manager', '2022-11-21 20:27:11', 1, NULL, NULL, 1),
(2, 'Store Manager', '2024-06-19 12:32:44', 1, NULL, NULL, 1),
(3, 'Sales', '2024-06-26 16:38:52', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `di_tour`
--

CREATE TABLE `di_tour` (
  `di_tour_id` int(11) NOT NULL,
  `di_tour_variant` char(1) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `inclusion` longtext DEFAULT NULL,
  `exclusion` longtext DEFAULT NULL,
  `important_notes` longtext DEFAULT NULL,
  `additional_info` longtext DEFAULT NULL,
  `available_slots` int(4) DEFAULT 0,
  `duration_day` int(4) DEFAULT 0,
  `duration_night` int(4) DEFAULT 0,
  `tour_type` varchar(255) DEFAULT NULL,
  `minimum_age` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `google_map_address` text DEFAULT NULL,
  `google_map_url` text DEFAULT NULL,
  `cover_image` varchar(100) DEFAULT NULL,
  `banner_image` varchar(100) DEFAULT NULL,
  `is_discount` char(1) DEFAULT '1',
  `actual_price` decimal(10,2) DEFAULT 0.00,
  `discounted_price` decimal(10,2) DEFAULT 0.00,
  `status` char(1) DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `di_tour`
--

INSERT INTO `di_tour` (`di_tour_id`, `di_tour_variant`, `name`, `description`, `inclusion`, `exclusion`, `important_notes`, `additional_info`, `available_slots`, `duration_day`, `duration_night`, `tour_type`, `minimum_age`, `location`, `google_map_address`, `google_map_url`, `cover_image`, `banner_image`, `is_discount`, `actual_price`, `discounted_price`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(4, '1', 'Kerala tour(2d+1n)', '<p>Kerala Description</p>\r\n', '<p>kerala Inclusion</p>\r\n', '<p>Kerala Exclusilon</p>\r\n', '<p>Keral important notes</p>\r\n', '<p>kerala additonal info&nbsp;</p>\r\n', NULL, 2, 1, 'adventure, food, beach', '10 years+', 'Kerala', 'Kerala, India', 'https://maps.google.com/?q=Kerala,+India&ftid=0x3b0812ffd49cf55b:0x64bd90fbed387c99', 'di_tour_cover_image_4.png', 'di_tour_banner_image_4.png', '1', '20000.00', '15000.00', '1', '2024-06-29 13:50:52', 1, '2024-07-01 16:44:14', 1, '0', NULL, NULL),
(5, '2', 'Europe Tour (5D+4N)', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', NULL, 5, 4, 'adventure, food, beach', '10 years+', 'Europe', 'Europe', 'https://maps.google.com/?q=Europe&ftid=0x46ed8886cfadda85:0x72ef99e6b3fcf079', 'di_tour_cover_image_5.png', 'di_tour_banner_image_5.png', '1', '200000.00', '150000.00', '1', '2024-06-29 17:33:05', 1, '2024-07-01 16:44:14', 1, '0', NULL, NULL),
(6, '1', 'Karnataka Tour', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', NULL, 3, 2, 'adventure, food', '10 years+', 'Karnataka', 'Karnataka, India', 'https://maps.google.com/?q=Karnataka,+India&ftid=0x3ba35a4c37bf488f:0x41f1d28cd1757cd5', 'di_tour_cover_image_6.png', 'di_tour_banner_image_6.png', '1', '12000.00', '11000.00', '1', '2024-07-01 11:40:55', 1, '2024-07-01 18:23:38', 1, '0', NULL, NULL),
(7, '2', 'Australia Tour', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', 0, 3, 2, 'adventure , food', '10 years+', 'Australia', 'Australia', 'https://maps.google.com/?q=Australia&ftid=0x2b2bfd076787c5df:0x538267a1955b1352', 'di_tour_cover_image_7.png', 'di_tour_banner_image_7.png', '0', '150999.00', '0.00', '1', '2024-07-01 17:52:20', 1, '2024-07-01 17:52:20', NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `di_tour_booking_enquiry`
--

CREATE TABLE `di_tour_booking_enquiry` (
  `di_tour_booking_enquiry_id` int(11) NOT NULL,
  `di_tour_id` int(11) DEFAULT NULL,
  `start_date_time` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `di_tour_booking_enquiry`
--

INSERT INTO `di_tour_booking_enquiry` (`di_tour_booking_enquiry_id`, `di_tour_id`, `start_date_time`, `end_date`, `name`, `email`, `contactno`, `subject`, `description`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(1, 4, '2024-06-29', '2024-06-30', 'ramkumar gurav', 'ramkumarsgurav@gmail.com', '08549065626', 'domestic tours booking', 'asdf', '1', '2024-06-29 16:15:52', NULL, NULL, NULL, '0', NULL, NULL),
(2, 5, '2024-07-06', '2024-07-10', 'ramkumar gurav', 'ramkumarsgurav@gmail.com', '08549065626', 'international tours booking', 'asdf', '1', '2024-06-29 17:34:30', NULL, NULL, NULL, '0', NULL, NULL),
(3, 0, '', '2024-07-07', '', '', '', 'international tours booking', '', '1', '2024-07-04 17:16:06', NULL, NULL, NULL, '0', NULL, NULL),
(4, 0, '2024-07-05', '2024-07-07', 'asdf', 'asdf', 'asdf', 'international tours booking', 'asdf', '1', '2024-07-04 17:16:22', NULL, NULL, NULL, '0', NULL, NULL),
(5, 0, '', '2024-07-07', 'ramkumar gurav', 'ramkumarsgurav@gmail.com', '8549065626', 'international tours booking', 'sadf asdf asdf', '1', '2024-07-04 17:43:43', NULL, NULL, NULL, '0', NULL, NULL),
(6, 0, '2024-07-05', '2024-07-07', 'ramkumar gurav', 'ramkumarsgurav@gmail.com', '8549065626', 'international tours booking', 'asdf asdf asdf', '1', '2024-07-04 18:34:47', NULL, NULL, NULL, '0', NULL, NULL),
(7, 7, '2024-07-05', '2024-07-07', 'australia1 gurav', 'ramkumarsgurav@gmail.com', '8549065626', 'international tours booking', 'asdf asdfa ds', '1', '2024-07-04 18:36:33', NULL, NULL, NULL, '0', NULL, NULL),
(8, 4, '2024-07-05', '2024-07-06', 'kerala Tour', 'ramkumarsgurav@gmail.com', '8549065626', 'domestic tours booking', 'asdf asdf asdf', '1', '2024-07-04 18:43:01', NULL, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `di_tour_carousel_image`
--

CREATE TABLE `di_tour_carousel_image` (
  `di_tour_carousel_image_id` int(11) NOT NULL,
  `di_tour_id` int(11) NOT NULL,
  `position` int(11) DEFAULT 1,
  `file` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `di_tour_carousel_image`
--

INSERT INTO `di_tour_carousel_image` (`di_tour_carousel_image_id`, `di_tour_id`, `position`, `file`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(10, 4, 1, 'di_tour_carousel_image_10.png', '1', '2024-06-29 13:50:52', 1, '2024-06-29 13:50:52', NULL, '0', NULL, NULL),
(11, 4, 1, 'di_tour_carousel_image_11.png', '1', '2024-06-29 13:50:52', 1, '2024-06-29 13:50:52', NULL, '0', NULL, NULL),
(12, 4, 1, 'di_tour_carousel_image_12.png', '1', '2024-06-29 13:50:52', 1, '2024-06-29 13:50:52', NULL, '0', NULL, NULL),
(13, 5, 1, 'di_tour_carousel_image_13.png', '1', '2024-06-29 17:33:05', 1, '2024-06-29 17:33:05', NULL, '0', NULL, NULL),
(14, 5, 1, 'di_tour_carousel_image_14.png', '1', '2024-06-29 17:33:05', 1, '2024-06-29 17:33:05', NULL, '0', NULL, NULL),
(15, 5, 1, 'di_tour_carousel_image_15.png', '1', '2024-06-29 17:33:05', 1, '2024-06-29 17:33:05', NULL, '0', NULL, NULL),
(16, 6, 1, 'di_tour_carousel_image_16.png', '1', '2024-07-01 11:40:55', 1, '2024-07-01 11:40:55', NULL, '0', NULL, NULL),
(17, 6, 1, 'di_tour_carousel_image_17.png', '1', '2024-07-01 11:40:55', 1, '2024-07-01 11:40:55', NULL, '0', NULL, NULL),
(18, 6, 1, 'di_tour_carousel_image_18.png', '1', '2024-07-01 11:40:55', 1, '2024-07-01 11:40:55', NULL, '0', NULL, NULL),
(19, 7, 1, 'di_tour_carousel_image_19.png', '1', '2024-07-01 17:52:21', 1, '2024-07-01 17:52:21', NULL, '0', NULL, NULL),
(20, 7, 1, 'di_tour_carousel_image_20.png', '1', '2024-07-01 17:52:21', 1, '2024-07-01 17:52:21', NULL, '0', NULL, NULL),
(21, 7, 1, 'di_tour_carousel_image_21.png', '1', '2024-07-01 17:52:21', 1, '2024-07-01 17:52:21', NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `di_tour_gallery_image`
--

CREATE TABLE `di_tour_gallery_image` (
  `di_tour_gallery_image_id` int(11) NOT NULL,
  `di_tour_id` int(11) NOT NULL,
  `position` int(11) DEFAULT 1,
  `file` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `di_tour_gallery_image`
--

INSERT INTO `di_tour_gallery_image` (`di_tour_gallery_image_id`, `di_tour_id`, `position`, `file`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(10, 4, 1, 'di_tour_gallery_image_10.png', '1', '2024-06-29 13:50:52', 1, '2024-06-29 13:50:52', NULL, '0', NULL, NULL),
(11, 4, 10, 'di_tour_gallery_image_11.png', '1', '2024-06-29 13:50:52', 1, '2024-06-29 13:50:52', NULL, '0', NULL, NULL),
(12, 4, 1, 'di_tour_gallery_image_12.png', '1', '2024-06-29 13:50:52', 1, '2024-06-29 13:50:52', NULL, '0', NULL, NULL),
(13, 5, 1, 'di_tour_gallery_image_13.png', '1', '2024-06-29 17:33:05', 1, '2024-06-29 17:33:05', NULL, '0', NULL, NULL),
(14, 5, 1, 'di_tour_gallery_image_14.png', '1', '2024-06-29 17:33:05', 1, '2024-06-29 17:33:05', NULL, '0', NULL, NULL),
(15, 5, 1, 'di_tour_gallery_image_15.png', '1', '2024-06-29 17:33:05', 1, '2024-06-29 17:33:05', NULL, '0', NULL, NULL),
(16, 6, 1, 'di_tour_gallery_image_16.png', '1', '2024-07-01 11:40:55', 1, '2024-07-01 11:40:55', NULL, '0', NULL, NULL),
(17, 6, 1, 'di_tour_gallery_image_17.png', '1', '2024-07-01 11:40:55', 1, '2024-07-01 11:40:55', NULL, '0', NULL, NULL),
(18, 6, 1, 'di_tour_gallery_image_18.png', '1', '2024-07-01 11:40:55', 1, '2024-07-01 11:40:55', NULL, '0', NULL, NULL),
(19, 7, 1, 'di_tour_gallery_image_19.png', '1', '2024-07-01 17:52:21', 1, '2024-07-01 17:52:21', NULL, '0', NULL, NULL),
(20, 7, 1, 'di_tour_gallery_image_20.png', '1', '2024-07-01 17:52:21', 1, '2024-07-01 17:52:21', NULL, '0', NULL, NULL),
(21, 7, 4, 'di_tour_gallery_image_21.png', '1', '2024-07-01 17:52:21', 1, '2024-07-01 17:52:21', NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `di_tour_plan`
--

CREATE TABLE `di_tour_plan` (
  `di_tour_plan_id` int(11) NOT NULL,
  `di_tour_id` int(11) DEFAULT NULL,
  `day_number` int(4) DEFAULT 0,
  `day_name` varchar(255) DEFAULT NULL,
  `day_plan` longtext DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `di_tour_plan`
--

INSERT INTO `di_tour_plan` (`di_tour_plan_id`, `di_tour_id`, `day_number`, `day_name`, `day_plan`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(5, 4, 0, 'dayo', '<p>plano</p>\r\n', '1', '2024-06-29 13:50:52', 1, NULL, NULL, '0', NULL, NULL),
(6, 4, 1, 'day1', '<p>plan1</p>\r\n', '1', '2024-06-29 13:50:52', 1, NULL, NULL, '0', NULL, NULL),
(7, 4, 2, 'day2', '<p>plan2</p>\r\n', '1', '2024-06-29 13:50:52', 1, NULL, NULL, '0', NULL, NULL),
(8, 5, 0, 'asdf1', '<p>asdf0</p>\r\n', '1', '2024-06-29 17:33:05', 1, NULL, NULL, '0', NULL, NULL),
(9, 5, 1, 'asdf1', '<p>asdf1</p>\r\n', '1', '2024-06-29 17:33:05', 1, NULL, NULL, '0', NULL, NULL),
(10, 6, 0, 'asd0', '<p>asdf0</p>\r\n', '1', '2024-07-01 11:40:55', 1, NULL, NULL, '0', NULL, NULL),
(11, 7, 0, 'asdf1', '<p>asdf1</p>\r\n', '1', '2024-07-01 17:52:21', 1, NULL, NULL, '0', NULL, NULL),
(12, 7, 1, 'asdf2', '<p>asdf2</p>\r\n', '1', '2024-07-01 17:52:21', 1, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `di_tour_things_to_carry`
--

CREATE TABLE `di_tour_things_to_carry` (
  `di_tour_things_to_carry_id` int(11) NOT NULL,
  `di_tour_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `di_tour_things_to_carry`
--

INSERT INTO `di_tour_things_to_carry` (`di_tour_things_to_carry_id`, `di_tour_id`, `name`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(6, 4, 'thing to carray1', '1', '2024-06-29 13:50:52', 1, NULL, NULL, '0', NULL, NULL),
(7, 4, 'things to carry 2', '1', '2024-06-29 13:50:52', 1, NULL, NULL, '0', NULL, NULL),
(8, 4, 'things t carry 3', '1', '2024-06-29 13:50:52', 1, NULL, NULL, '0', NULL, NULL),
(9, 5, 'asdf1', '1', '2024-06-29 17:33:05', 1, NULL, NULL, '0', NULL, NULL),
(10, 5, 'asdf2', '1', '2024-06-29 17:33:05', 1, NULL, NULL, '0', NULL, NULL),
(11, 5, 'asdf3', '1', '2024-06-29 17:33:05', 1, NULL, NULL, '0', NULL, NULL),
(12, 6, 'asdf1', '1', '2024-07-01 11:40:55', 1, NULL, NULL, '0', NULL, NULL),
(13, 6, 'asdf2', '1', '2024-07-01 11:40:55', 1, NULL, NULL, '0', NULL, NULL),
(14, 7, 'asdf1', '1', '2024-07-01 17:52:21', 1, NULL, NULL, '0', NULL, NULL),
(15, 7, 'asdf2', '1', '2024-07-01 17:52:21', 1, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `enquiry_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`enquiry_id`, `name`, `email`, `contactno`, `subject`, `description`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(1, 'ramkumar gurav', 'ramkumarsgurav@gmail.com', '8549065626', 'Others', 'test enquiry', '1', '2024-07-01 13:39:29', NULL, NULL, NULL, '0', NULL, NULL),
(2, 'sham  gurav', 'ramkumarsgurav@gmail.com', '08549065626', 'normal enquiry', 'asdf asdf asdf', '1', '2024-07-01 13:43:21', NULL, NULL, NULL, '0', NULL, NULL),
(3, 'Guru', 'ramkumarsgurav@gmail.com', '08549065626', 'Normal Enquiry', 'asdf', '1', '2024-07-01 15:12:52', NULL, '2024-07-01 15:13:11', 1, '0', NULL, NULL),
(4, 'gurux', 'ramkumarsgurav@gmail.com', '8549065626', 'asdf', 'asdf', '1', '2024-07-01 16:32:48', NULL, NULL, NULL, '0', NULL, NULL),
(5, 'new ramkumar gurav', 'ramkumarsgurav@gmail.com', '+918549065626', 'normal enquiry', 'sdaf', '1', '2024-07-01 16:35:45', NULL, NULL, NULL, '0', NULL, NULL),
(6, '', '', '', 'normal enquiry', '', '1', '2024-07-01 18:54:53', NULL, NULL, NULL, '0', NULL, NULL),
(7, '', '', '', 'normal enquiry', '', '1', '2024-07-01 18:55:57', NULL, NULL, NULL, '0', NULL, NULL),
(8, '', '', '', 'normal enquiry', '', '1', '2024-07-01 18:56:02', NULL, NULL, NULL, '0', NULL, NULL),
(9, '', '', '', 'normal enquiry', '', '1', '2024-07-01 18:58:08', NULL, NULL, NULL, '0', NULL, NULL),
(10, '', '', '', 'normal enquiry', '', '1', '2024-07-02 11:05:06', NULL, NULL, NULL, '0', NULL, NULL),
(11, '', '', '', 'normal enquiry', '', '1', '2024-07-02 11:05:19', NULL, NULL, NULL, '0', NULL, NULL),
(12, '', '', '', 'normal enquiry', '', '1', '2024-07-02 11:06:52', NULL, NULL, NULL, '0', NULL, NULL),
(13, 'ramkumar gurav1', 'ramkumarsgurav@gmail.com', '8549065626', 'normal enquiry', 'sdfgsdf gsd sfgd', '1', '2024-07-02 11:16:25', NULL, NULL, NULL, '0', NULL, NULL),
(14, '', '', '', 'normal enquiry', '', '1', '2024-07-02 11:46:56', NULL, NULL, NULL, '0', NULL, NULL),
(15, 'asdf', '', '', 'normal enquiry', '', '1', '2024-07-02 11:47:04', NULL, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year`
--

CREATE TABLE `fiscal_year` (
  `fiscal_year_id` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `short_start` int(11) NOT NULL,
  `short_end` int(11) NOT NULL,
  `financial_year` varchar(255) NOT NULL,
  `short_financial_year` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fiscal_year`
--

INSERT INTO `fiscal_year` (`fiscal_year_id`, `start`, `end`, `short_start`, `short_end`, `financial_year`, `short_financial_year`) VALUES
(1, 2022, 2023, 22, 23, '2023', '22-23'),
(2, 2022, 2023, 22, 23, '2022', '22-23'),
(3, 2023, 2024, 23, 24, '2024', '23-24');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `file_type` char(1) DEFAULT '1',
  `position` int(10) DEFAULT 1,
  `file_title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`gallery_id`, `file_type`, `position`, `file_title`, `file`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(7, '1', 1, 'asdf', 'main_gallery_7.png', '1', '2024-06-28 12:17:53', 1, '2024-06-28 12:57:10', 1, '0', NULL, NULL),
(8, '1', 1, 'asdfasdf', 'main_gallery_8.png', '1', '2024-06-28 12:17:53', 1, '2024-06-28 12:57:10', 1, '0', NULL, NULL),
(9, '1', 11, 'asdf', 'main_gallery_9.png', '1', '2024-06-28 12:17:53', 1, '2024-06-28 12:57:02', 1, '0', NULL, NULL),
(10, '1', 2, 'asdf', 'main_gallery_10.png', '1', '2024-06-28 13:13:39', 1, '2024-06-28 15:52:08', 1, '0', NULL, NULL),
(11, '1', 1, 'asdf', 'main_gallery_11.png', '0', '2024-06-28 16:57:40', 1, '2024-06-28 16:57:40', NULL, '0', NULL, NULL),
(12, '1', 1, 'asdfsdf', 'main_gallery_12.png', '0', '2024-06-28 16:57:40', 1, '2024-06-28 16:57:40', NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gallery_image`
--

CREATE TABLE `gallery_image` (
  `gallery_image_id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `position` int(10) DEFAULT 1,
  `file` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gallery_image`
--

INSERT INTO `gallery_image` (`gallery_image_id`, `tour_id`, `position`, `file`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(7, 1, 1, 'gallery_image_7.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(8, 1, 1, 'gallery_image_8.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(9, 1, 1, 'gallery_image_9.png', '1', '2024-06-22 15:28:17', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(10, 10, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(11, 10, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(12, 10, 1, 'gallery_image_12.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(13, 11, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(14, 11, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(16, 12, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(17, 12, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(19, 13, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(20, 13, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(22, 14, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(23, 14, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(25, 15, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(26, 15, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(28, 16, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(29, 16, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(31, 17, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(32, 17, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(34, 18, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(35, 18, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(37, 19, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(38, 19, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(39, 19, 1, 'gallery_image_12.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(40, 20, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(41, 20, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(42, 20, 1, 'gallery_image_12.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(43, 21, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(44, 21, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(45, 21, 1, 'gallery_image_12.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(46, 22, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(47, 22, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(48, 22, 1, 'gallery_image_12.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(49, 23, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(50, 23, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(51, 23, 1, 'gallery_image_12.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(52, 24, 1, 'gallery_image_10.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(53, 24, 1, 'gallery_image_11.png', '1', '2024-06-22 17:07:48', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(55, 25, 1, 'gallery_image_55.png', '1', '2024-06-24 15:34:37', 1, '2024-06-24 16:53:37', NULL, '0', NULL, NULL),
(56, 24, 11, 'gallery_image_56.png', '1', '2024-06-24 17:27:02', 1, '2024-06-24 17:27:02', NULL, '0', NULL, NULL),
(58, 14, 1, 'gallery_image_58.png', '1', '2024-06-26 15:09:31', 1, '2024-06-26 15:09:32', NULL, '0', NULL, NULL),
(59, 11, 1, 'gallery_image_59.png', '1', '2024-06-26 15:09:56', 1, '2024-06-26 15:09:56', NULL, '0', NULL, NULL),
(60, 18, 12, 'gallery_image_60.png', '1', '2024-06-26 15:10:59', 1, '2024-06-26 15:10:59', NULL, '0', NULL, NULL),
(61, 17, 1, 'gallery_image_61.png', '1', '2024-06-26 15:11:43', 1, '2024-06-26 15:11:43', NULL, '0', NULL, NULL),
(62, 16, 11, 'gallery_image_62.png', '1', '2024-06-26 15:12:33', 1, '2024-06-26 15:12:33', NULL, '0', NULL, NULL),
(63, 15, 1, 'gallery_image_63.png', '1', '2024-06-26 15:13:01', 1, '2024-06-26 15:13:01', NULL, '0', NULL, NULL),
(64, 13, 1, 'gallery_image_64.png', '1', '2024-06-26 15:13:37', 1, '2024-06-26 15:13:37', NULL, '0', NULL, NULL),
(65, 12, 1, 'gallery_image_65.png', '1', '2024-06-26 15:14:02', 1, '2024-06-26 15:14:02', NULL, '0', NULL, NULL),
(66, 1, 1, 'gallery_image_66.png', '1', '2024-06-29 11:03:55', 1, '2024-06-29 11:03:55', NULL, '0', NULL, NULL),
(67, 1, 1, 'gallery_image_67.png', '1', '2024-06-29 11:03:55', 1, '2024-06-29 11:03:55', NULL, '0', NULL, NULL),
(68, 1, 1, 'gallery_image_68.png', '1', '2024-06-29 11:03:55', 1, '2024-06-29 11:03:55', NULL, '0', NULL, NULL),
(69, 27, 1, 'gallery_image_69.png', '1', '2024-06-29 17:26:00', 1, '2024-06-29 17:26:00', NULL, '0', NULL, NULL),
(70, 27, 1, 'gallery_image_70.png', '1', '2024-06-29 17:26:00', 1, '2024-06-29 17:26:00', NULL, '0', NULL, NULL),
(71, 27, 1, 'gallery_image_71.png', '1', '2024-06-29 17:26:00', 1, '2024-06-29 17:26:00', NULL, '0', NULL, NULL),
(72, 26, 1, 'gallery_image_72.png', '1', '2024-06-29 19:05:49', 1, '2024-06-29 19:05:49', NULL, '0', NULL, NULL),
(73, 26, 1, 'gallery_image_73.png', '1', '2024-06-29 19:05:50', 1, '2024-06-29 19:05:50', NULL, '0', NULL, NULL),
(74, 26, 1, 'gallery_image_74.png', '1', '2024-06-29 19:05:50', 1, '2024-06-29 19:05:50', NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_master`
--

CREATE TABLE `module_master` (
  `module_id` int(11) NOT NULL,
  `module_name` varchar(500) NOT NULL,
  `is_master` int(11) NOT NULL,
  `parent_module_id` int(11) NOT NULL,
  `class_name` varchar(500) DEFAULT NULL,
  `function_name` varchar(500) DEFAULT NULL,
  `count_function_name` varchar(200) DEFAULT NULL,
  `is_company_profile_id` int(11) NOT NULL DEFAULT 0 COMMENT 'count according to company_profile_id 1=yes , 0=no',
  `direct_db_count` int(11) DEFAULT NULL,
  `table_name` varchar(500) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `is_display` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `icon` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_master`
--

INSERT INTO `module_master` (`module_id`, `module_name`, `is_master`, `parent_module_id`, `class_name`, `function_name`, `count_function_name`, `is_company_profile_id`, `direct_db_count`, `table_name`, `position`, `added_on`, `is_display`, `status`, `icon`) VALUES
(1, 'Role Manager', 1, 0, 'master/Role-Manager-Module', 'role-manager-list', '', 0, 1, 'users_role_master', 1, '2020-04-20 12:44:42', 1, 1, NULL),
(2, 'Country', 1, 0, 'master/Country-Module', 'country-list', '', 0, 1, 'country', 2, '2020-04-20 12:44:42', 1, 1, NULL),
(3, 'State', 1, 0, 'master/State-Module', 'state-list', '', 0, 1, 'state', 3, '2020-04-20 12:44:42', 1, 1, NULL),
(4, 'City', 1, 0, 'master/City-Module', 'city-list', '', 0, 1, 'city', 4, '2020-04-20 12:44:42', 1, 1, NULL),
(7, 'Designation', 1, 0, 'master/Designation-Module', 'designation-list', '', 0, 1, 'designation_master', 7, '2020-04-20 12:44:42', 1, 1, NULL),
(12, 'Employee', 2, 0, 'human_resource/Employee-Module', 'employee-list', '', 0, 1, 'admin_user', 11, '2022-03-11 00:00:00', 1, 1, NULL),
(14, 'Company Profile', 3, 0, 'company_profile/Company-Profile-Module', 'company-profile-list', '', 0, 1, 'company_profile', 1, '2020-04-20 12:44:42', 1, 1, NULL),
(195, 'Escape From Reality', 4, 0, 'catalog/Tour-Module', 'tour-list', '', 0, 1, 'tour', 4, '0000-00-00 00:00:00', 1, 1, NULL),
(196, 'Enquiry', 5, 0, 'enquiry/Enquiry-Module', 'listings', '', 0, 1, 'enquiry', 4, '2020-04-20 12:44:42', 1, 1, NULL),
(197, 'Escape From Reality', 10, 0, 'booking/Tour-Booking-Enquiry-Module', 'listings', '', 0, 1, 'tour_booking_enquiry', 4, '2020-04-20 12:44:42', 1, 1, NULL),
(198, 'Gallery', 11, 0, 'media/Gallery-Module', 'gallery-list', '', 0, 1, 'gallery', 4, '2020-04-20 12:44:42', 1, 1, NULL),
(199, 'Videos', 11, 0, 'media/Video-Module', 'video-list', '', 0, 1, 'video', 4, '2020-04-20 12:44:42', 1, 1, NULL),
(201, 'Domestic & Int Tours', 4, 0, 'catalog/Di-Tour-Module', 'di-tour-list', '', 0, 1, 'di_tour', 4, '0000-00-00 00:00:00', 1, 1, NULL),
(202, 'Domestic & Int Tours', 10, 0, 'booking/Di-Tour-Booking-Enquiry-Module', 'listings', '', 0, 1, 'di_tour_booking_enquiry', 4, '2020-04-20 12:44:42', 1, 1, NULL),
(203, 'Banner', 6, 0, 'banner/Banner-Module', 'listing', '', 0, 1, 'banner', 4, '2020-04-20 12:44:42', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_permissions`
--

CREATE TABLE `module_permissions` (
  `permission_id` bigint(20) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `view_module` tinyint(4) NOT NULL,
  `add_module` tinyint(4) NOT NULL,
  `update_module` tinyint(4) NOT NULL,
  `delete_module` tinyint(4) NOT NULL,
  `approval_module` tinyint(4) NOT NULL DEFAULT 0,
  `import_data` tinyint(4) NOT NULL,
  `export_data` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_permissions`
--

INSERT INTO `module_permissions` (`permission_id`, `module_id`, `user_role_id`, `view_module`, `add_module`, `update_module`, `delete_module`, `approval_module`, `import_data`, `export_data`) VALUES
(196, 44, 1, 1, 1, 1, 0, 0, 1, 1),
(195, 193, 1, 1, 1, 1, 0, 0, 1, 1),
(194, 192, 1, 1, 1, 1, 0, 0, 1, 1),
(193, 25, 1, 1, 1, 1, 0, 0, 1, 1),
(192, 24, 1, 1, 1, 1, 0, 0, 1, 1),
(191, 23, 1, 1, 1, 1, 0, 0, 1, 1),
(190, 22, 1, 1, 1, 1, 0, 0, 1, 1),
(189, 21, 1, 1, 1, 1, 0, 0, 1, 1),
(188, 20, 1, 1, 1, 1, 0, 0, 1, 1),
(187, 19, 1, 1, 1, 1, 0, 0, 1, 1),
(186, 10, 1, 1, 1, 1, 0, 0, 1, 1),
(185, 18, 1, 1, 1, 1, 0, 0, 1, 1),
(184, 16, 1, 1, 1, 1, 0, 0, 1, 1),
(183, 17, 1, 1, 1, 1, 0, 0, 1, 1),
(182, 15, 1, 1, 1, 1, 0, 0, 1, 1),
(16, 9, 3, 1, 1, 1, 0, 0, 0, 0),
(17, 15, 3, 1, 1, 1, 0, 0, 0, 0),
(18, 17, 3, 1, 1, 1, 0, 0, 0, 0),
(19, 16, 3, 1, 1, 1, 0, 0, 0, 0),
(181, 14, 1, 1, 1, 1, 0, 0, 1, 1),
(180, 13, 1, 1, 1, 1, 0, 0, 1, 1),
(179, 11, 1, 1, 1, 1, 0, 0, 1, 1),
(178, 8, 1, 1, 1, 1, 0, 0, 1, 1),
(177, 9, 1, 1, 1, 1, 0, 0, 1, 1),
(176, 12, 1, 1, 1, 1, 0, 0, 1, 1),
(175, 7, 1, 1, 1, 1, 0, 0, 1, 1),
(174, 6, 1, 1, 1, 1, 0, 0, 1, 1),
(173, 5, 1, 1, 1, 1, 0, 0, 1, 1),
(172, 4, 1, 1, 1, 1, 0, 0, 1, 1),
(171, 3, 1, 1, 1, 1, 0, 0, 1, 1),
(170, 2, 1, 1, 1, 1, 0, 0, 1, 1),
(169, 1, 1, 1, 1, 1, 0, 0, 1, 1),
(197, 194, 1, 1, 1, 1, 0, 0, 1, 1),
(198, 9, 4, 1, 1, 1, 0, 0, 1, 1),
(199, 15, 4, 1, 1, 1, 0, 0, 1, 1),
(200, 17, 4, 1, 1, 1, 0, 0, 1, 1),
(201, 16, 4, 1, 1, 1, 0, 0, 1, 1),
(202, 18, 4, 1, 1, 1, 0, 0, 1, 1),
(203, 195, 1, 1, 1, 1, 0, 0, 1, 1),
(204, 196, 1, 1, 1, 1, 0, 0, 1, 1),
(205, 197, 1, 1, 1, 1, 0, 0, 1, 1),
(206, 195, 5, 1, 1, 1, 0, 0, 1, 1),
(207, 196, 5, 1, 1, 1, 0, 0, 1, 1),
(208, 197, 5, 1, 1, 1, 0, 0, 1, 1),
(209, 198, 1, 1, 1, 1, 0, 0, 1, 1),
(210, 199, 1, 1, 1, 1, 0, 0, 1, 1),
(211, 201, 1, 1, 1, 1, 0, 0, 1, 1),
(212, 202, 1, 1, 1, 1, 0, 0, 1, 1),
(213, 203, 1, 1, 1, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_code` varchar(255) DEFAULT NULL,
  `is_display` int(11) NOT NULL DEFAULT 1,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `province_code` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `country_id`, `state_name`, `state_code`, `is_display`, `added_on`, `added_by`, `updated_on`, `updated_by`, `status`, `province_code`) VALUES
(1, 1, 'Karnataka', '29', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(2, 1, 'Andaman and Nicobar Islan', '35', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(3, 1, 'Andhra Pradesh', '28', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(4, 1, 'Arunachal Pradesh', '12', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(5, 1, 'Assam', '18', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(6, 1, 'Bihar', '10', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(7, 1, 'Chandigarh', '4', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(8, 1, 'Chhattisgarh', '22', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(9, 1, 'Dadra and Nagar Haveli', '26', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(10, 1, 'Delhi', '7', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(11, 1, 'Goa', '30', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(12, 1, 'Gujarat', '24', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(13, 1, 'Haryana', '6', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(14, 1, 'Himachal Pradesh', '2', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(15, 1, 'Jammu and Kashmir', '1', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(16, 1, 'Jharkhand', '20', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(17, 1, 'Kerala', '32', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(18, 1, 'Madhya Pradesh', '23', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(19, 1, 'Maharashtra', '27', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(20, 1, 'Manipur', '14', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(21, 1, 'Meghalaya', '17', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(22, 1, 'Mizoram', '15', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(23, 1, 'Nagaland', '13', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(24, 1, 'Odisha', '21', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(25, 1, 'Puducherry', '34', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(26, 1, 'Punjab', '3', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(27, 1, 'Rajasthan', '8', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(28, 1, 'Tamil Nadu', '33', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(29, 1, 'Telangana', '36', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(30, 1, 'Tripura', '16', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(31, 1, 'Uttar Pradesh', '9', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(32, 1, 'Uttarakhand', '5', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL),
(33, 1, 'West Bengal', '19', 1, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `things_to_carry`
--

CREATE TABLE `things_to_carry` (
  `things_to_carry_id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `things_to_carry`
--

INSERT INTO `things_to_carry` (`things_to_carry_id`, `tour_id`, `name`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(1, 1, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:14', NULL, NULL, NULL, '0', NULL, NULL),
(3, 1, 'Power Bank', '1', '2024-06-21 15:38:34', 1, NULL, NULL, '0', NULL, NULL),
(4, 1, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(5, 1, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(6, 1, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(7, 1, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(8, 1, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(9, 1, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(13, 1, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(14, 1, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id, or Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(15, 11, 'Small backpack to carry your essentials during the trek', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:13:07', NULL, '0', NULL, NULL),
(16, 11, 'Power Bank', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:13:05', NULL, '0', NULL, NULL),
(17, 11, 'Water bottles - 2 (1 liter each)', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:13:01', NULL, '0', NULL, NULL),
(18, 11, ' Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:57', NULL, '0', NULL, NULL),
(19, 11, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:54', NULL, '0', NULL, NULL),
(20, 11, ' Flip-flops for lazing around the campsite', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:46', NULL, '0', NULL, NULL),
(21, 11, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:43', NULL, '0', NULL, NULL),
(22, 11, 'Extra pair of clothes to change into once wet', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:51', NULL, '0', NULL, NULL),
(23, 11, 'Polybags to pack your wet clothes', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:41', NULL, '0', NULL, NULL),
(24, 11, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id, or Aadhar card)', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:12:39', NULL, '0', NULL, NULL),
(25, 10, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:14', NULL, '2024-06-23 16:13:42', NULL, '0', NULL, NULL),
(26, 10, 'Power Bank', '1', '2024-06-21 15:38:34', 1, '2024-06-23 16:13:45', NULL, '0', NULL, NULL),
(27, 10, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 15:40:22', 1, '2024-06-23 16:13:47', NULL, '0', NULL, NULL),
(28, 10, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 15:40:22', 1, '2024-06-23 16:13:49', NULL, '0', NULL, NULL),
(29, 10, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 15:40:22', 1, '2024-06-23 16:13:51', NULL, '0', NULL, NULL),
(30, 10, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 15:40:22', 1, '2024-06-23 16:13:53', NULL, '0', NULL, NULL),
(31, 10, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 15:40:22', 1, '2024-06-23 16:13:23', NULL, '0', NULL, NULL),
(32, 10, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 15:40:22', 1, '2024-06-23 16:13:22', NULL, '0', NULL, NULL),
(33, 10, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, '2024-06-23 16:13:28', NULL, '0', NULL, NULL),
(34, 10, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id, or Aadhar card)', '1', '2024-06-21 18:06:18', 1, '2024-06-23 16:13:18', NULL, '0', NULL, NULL),
(35, 12, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:14', NULL, NULL, NULL, '0', NULL, NULL),
(36, 12, 'Power Bank', '1', '2024-06-21 15:38:34', 1, NULL, NULL, '0', NULL, NULL),
(37, 12, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(38, 12, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(39, 12, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(40, 12, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(41, 12, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(42, 12, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(43, 12, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(44, 12, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id, or Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(45, 13, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:14', NULL, NULL, NULL, '0', NULL, NULL),
(46, 13, 'Power Bank', '1', '2024-06-21 15:38:34', 1, NULL, NULL, '0', NULL, NULL),
(47, 13, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(48, 13, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(49, 13, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(50, 13, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(51, 13, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(52, 13, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(53, 13, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(54, 13, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id, or Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(55, 14, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:14', NULL, NULL, NULL, '0', NULL, NULL),
(56, 14, 'Power Bank', '1', '2024-06-21 15:38:34', 1, NULL, NULL, '0', NULL, NULL),
(57, 14, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(58, 14, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(59, 14, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(60, 14, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(61, 14, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(62, 14, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(63, 14, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(64, 14, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(65, 15, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:15', NULL, NULL, NULL, '0', NULL, NULL),
(66, 15, 'Power Bank', '1', '2024-06-21 15:38:34', 1, NULL, NULL, '0', NULL, NULL),
(67, 15, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(68, 15, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(69, 15, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(70, 15, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(71, 15, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(72, 15, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 15:40:22', 1, NULL, NULL, '0', NULL, NULL),
(73, 15, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(74, 15, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(75, 16, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:16', NULL, NULL, NULL, '0', NULL, NULL),
(76, 16, 'Power Bank', '1', '2024-06-21 16:38:34', 1, NULL, NULL, '0', NULL, NULL),
(77, 16, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 16:40:22', 1, NULL, NULL, '0', NULL, NULL),
(78, 16, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 16:40:22', 1, NULL, NULL, '0', NULL, NULL),
(79, 16, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 16:40:22', 1, NULL, NULL, '0', NULL, NULL),
(80, 16, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 16:40:22', 1, NULL, NULL, '0', NULL, NULL),
(81, 16, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 16:40:22', 1, NULL, NULL, '0', NULL, NULL),
(82, 16, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 16:40:22', 1, NULL, NULL, '0', NULL, NULL),
(83, 16, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(84, 16, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(85, 17, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:17', NULL, NULL, NULL, '0', NULL, NULL),
(86, 17, 'Power Bank', '1', '2024-06-21 17:38:34', 1, NULL, NULL, '0', NULL, NULL),
(87, 17, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 17:40:22', 1, NULL, NULL, '0', NULL, NULL),
(88, 17, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 17:40:22', 1, NULL, NULL, '0', NULL, NULL),
(89, 17, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 17:40:22', 1, NULL, NULL, '0', NULL, NULL),
(90, 17, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 17:40:22', 1, NULL, NULL, '0', NULL, NULL),
(91, 17, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 17:40:22', 1, NULL, NULL, '0', NULL, NULL),
(92, 17, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 17:40:22', 1, NULL, NULL, '0', NULL, NULL),
(93, 17, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(94, 17, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(95, 18, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:18', NULL, NULL, NULL, '0', NULL, NULL),
(96, 18, 'Power Bank', '1', '2024-06-21 18:38:34', 1, NULL, NULL, '0', NULL, NULL),
(97, 18, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 18:40:22', 1, NULL, NULL, '0', NULL, NULL),
(98, 18, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 18:40:22', 1, NULL, NULL, '0', NULL, NULL),
(99, 18, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 18:40:22', 1, NULL, NULL, '0', NULL, NULL),
(100, 18, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 18:40:22', 1, NULL, NULL, '0', NULL, NULL),
(101, 18, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 18:40:22', 1, NULL, NULL, '0', NULL, NULL),
(102, 18, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 18:40:22', 1, NULL, NULL, '0', NULL, NULL),
(103, 18, 'Polybags to pack your wet clothes', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(104, 18, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 18:06:18', 1, NULL, NULL, '0', NULL, NULL),
(105, 19, ' Small backpack to carry your essentials during the trek', '1', '2024-06-19 19:09:19', NULL, NULL, NULL, '0', NULL, NULL),
(106, 19, 'Power Bank', '1', '2024-06-21 19:38:34', 1, NULL, NULL, '0', NULL, NULL),
(107, 19, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 19:40:22', 1, NULL, NULL, '0', NULL, NULL),
(108, 19, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 19:40:22', 1, NULL, NULL, '0', NULL, NULL),
(109, 19, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 19:40:22', 1, NULL, NULL, '0', NULL, NULL),
(110, 19, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 19:40:22', 1, NULL, NULL, '0', NULL, NULL),
(111, 19, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 19:40:22', 1, NULL, NULL, '0', NULL, NULL),
(112, 19, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 19:40:22', 1, NULL, NULL, '0', NULL, NULL),
(113, 19, 'Polybags to pack your wet clothes', '1', '2024-06-21 19:06:19', 1, NULL, NULL, '0', NULL, NULL),
(114, 19, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 19:06:19', 1, NULL, NULL, '0', NULL, NULL),
(115, 20, ' Small backpack to carry your essentials during the trek', '1', '2024-06-20 20:09:20', NULL, NULL, NULL, '0', NULL, NULL),
(116, 20, 'Power Bank', '1', '2024-06-21 20:38:34', 1, NULL, NULL, '0', NULL, NULL),
(117, 20, 'Water bottles - 2 (1 liter each)', '1', '2024-06-21 20:40:22', 1, NULL, NULL, '0', NULL, NULL),
(118, 20, 'Lunch Box & Spoon to carry your packed lunch', '1', '2024-06-21 20:40:22', 1, NULL, NULL, '0', NULL, NULL),
(119, 20, ' A comfortable pair of shoes with good grip for trekking', '1', '2024-06-21 20:40:22', 1, NULL, NULL, '0', NULL, NULL),
(120, 20, ' Flip-flops for lazing around the campsite', '1', '2024-06-21 20:40:22', 1, NULL, NULL, '0', NULL, NULL),
(121, 20, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2024-06-21 20:40:22', 1, NULL, NULL, '0', NULL, NULL),
(122, 20, 'Extra pair of clothes to change into once wet', '1', '2024-06-21 20:40:22', 1, NULL, NULL, '0', NULL, NULL),
(123, 20, 'Polybags to pack your wet clothes', '1', '2024-06-21 20:06:20', 1, NULL, NULL, '0', NULL, NULL),
(124, 20, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2024-06-21 20:06:20', 1, NULL, NULL, '0', NULL, NULL),
(125, 21, ' Small backpack to carry your essentials during the trek', '1', '2124-06-21 21:09:21', NULL, NULL, NULL, '0', NULL, NULL),
(126, 21, 'Power Bank', '1', '2124-06-21 21:38:34', 1, NULL, NULL, '0', NULL, NULL),
(127, 21, 'Water bottles - 2 (1 liter each)', '1', '2124-06-21 21:40:22', 1, NULL, NULL, '0', NULL, NULL),
(128, 21, 'Lunch Box & Spoon to carry your packed lunch', '1', '2124-06-21 21:40:22', 1, NULL, NULL, '0', NULL, NULL),
(129, 21, ' A comfortable pair of shoes with good grip for trekking', '1', '2124-06-21 21:40:22', 1, NULL, NULL, '0', NULL, NULL),
(130, 21, ' Flip-flops for lazing around the campsite', '1', '2124-06-21 21:40:22', 1, NULL, NULL, '0', NULL, NULL),
(131, 21, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2124-06-21 21:40:22', 1, NULL, NULL, '0', NULL, NULL),
(132, 21, 'Extra pair of clothes to change into once wet', '1', '2124-06-21 21:40:22', 1, NULL, NULL, '0', NULL, NULL),
(133, 21, 'Polybags to pack your wet clothes', '1', '2124-06-21 21:06:21', 1, NULL, NULL, '0', NULL, NULL),
(134, 21, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2124-06-21 21:06:21', 1, NULL, NULL, '0', NULL, NULL),
(135, 22, ' Small backpack to carry your essentials during the trek', '1', '2224-06-22 22:09:22', NULL, NULL, NULL, '0', NULL, NULL),
(136, 22, 'Power Bank', '1', '2224-06-22 22:38:34', 1, NULL, NULL, '0', NULL, NULL),
(137, 22, 'Water bottles - 2 (1 liter each)', '1', '2224-06-22 22:40:22', 1, NULL, NULL, '0', NULL, NULL),
(138, 22, 'Lunch Box & Spoon to carry your packed lunch', '1', '2224-06-22 22:40:22', 1, NULL, NULL, '0', NULL, NULL),
(139, 22, ' A comfortable pair of shoes with good grip for trekking', '1', '2224-06-22 22:40:22', 1, NULL, NULL, '0', NULL, NULL),
(140, 22, ' Flip-flops for lazing around the campsite', '1', '2224-06-22 22:40:22', 1, NULL, NULL, '0', NULL, NULL),
(141, 22, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2224-06-22 22:40:22', 1, NULL, NULL, '0', NULL, NULL),
(142, 22, 'Extra pair of clothes to change into once wet', '1', '2224-06-22 22:40:22', 1, NULL, NULL, '0', NULL, NULL),
(143, 22, 'Polybags to pack your wet clothes', '1', '2224-06-22 22:06:22', 1, NULL, NULL, '0', NULL, NULL),
(144, 22, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2224-06-22 22:06:22', 1, NULL, NULL, '0', NULL, NULL),
(145, 23, ' Small backpack to carry your essentials during the trek', '1', '2324-06-23 23:09:23', NULL, NULL, NULL, '0', NULL, NULL),
(146, 23, 'Power Bank', '1', '2324-06-23 23:38:34', 1, NULL, NULL, '0', NULL, NULL),
(147, 23, 'Water bottles - 2 (1 liter each)', '1', '2324-06-23 23:40:23', 1, NULL, NULL, '0', NULL, NULL),
(148, 23, 'Lunch Box & Spoon to carry your packed lunch', '1', '2324-06-23 23:40:23', 1, NULL, NULL, '0', NULL, NULL),
(149, 23, ' A comfortable pair of shoes with good grip for trekking', '1', '2324-06-23 23:40:23', 1, NULL, NULL, '0', NULL, NULL),
(150, 23, ' Flip-flops for lazing around the campsite', '1', '2324-06-23 23:40:23', 1, NULL, NULL, '0', NULL, NULL),
(151, 23, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '2324-06-23 23:40:23', 1, NULL, NULL, '0', NULL, NULL),
(152, 23, 'Extra pair of clothes to change into once wet', '1', '2324-06-23 23:40:23', 1, NULL, NULL, '0', NULL, NULL),
(153, 23, 'Polybags to pack your wet clothes', '1', '2324-06-23 23:06:23', 1, NULL, NULL, '0', NULL, NULL),
(154, 23, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '2324-06-23 23:06:23', 1, NULL, NULL, '0', NULL, NULL),
(155, 24, ' Small backpack to carry your essentials during the trek', '1', '0000-00-00 00:00:00', NULL, NULL, NULL, '0', NULL, NULL),
(156, 24, 'Power Bank', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(157, 24, 'Water bottles - 2 (1 liter each)', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(158, 24, 'Lunch Box & Spoon to carry your packed lunch', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(159, 24, ' A comfortable pair of shoes with good grip for trekking', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(160, 24, ' Flip-flops for lazing around the campsite', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(161, 24, 'Torch/Headlamp to be used at night Portable chargers for your electronics', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(162, 24, 'Extra pair of clothes to change into once wet', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(163, 24, 'Polybags to pack your wet clothes', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(164, 24, 'Extra cash for meals not included in the itinerary Carry at least one Id proof (Driving License, Voter Id,\r\nor Aadhar card)', '1', '0000-00-00 00:00:00', 1, NULL, NULL, '0', NULL, NULL),
(165, 1, 'Small backpack to carry your essentials during the trek', '1', '2024-06-29 11:03:55', 1, NULL, NULL, '0', NULL, NULL),
(166, 1, 'Power Bank', '1', '2024-06-29 11:03:55', 1, NULL, NULL, '0', NULL, NULL),
(167, 1, 'Water bottles - 2 (1 liter each)', '1', '2024-06-29 11:03:55', 1, NULL, NULL, '0', NULL, NULL),
(168, 27, 'asdf1', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(169, 27, 'adsf2', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(170, 27, 'asdf3', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(171, 26, 'asdf1', '1', '2024-06-29 19:05:50', 1, NULL, NULL, '0', NULL, NULL),
(172, 26, 'asdf2', '1', '2024-06-29 19:05:50', 1, NULL, NULL, '0', NULL, NULL),
(173, 26, 'asdf3', '1', '2024-06-29 19:05:50', 1, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE `tour` (
  `tour_id` int(11) NOT NULL,
  `tour_variant` char(1) DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `inclusion` longtext DEFAULT NULL,
  `exclusion` longtext DEFAULT NULL,
  `important_notes` longtext DEFAULT NULL,
  `additional_info` longtext DEFAULT NULL,
  `available_slots` int(4) NOT NULL DEFAULT 0,
  `duration_day` int(4) NOT NULL DEFAULT 0,
  `duration_night` int(4) NOT NULL DEFAULT 0,
  `tour_type` varchar(255) NOT NULL,
  `minimum_age` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `google_map_url` text DEFAULT NULL,
  `google_map_address` text DEFAULT NULL,
  `banner_image` varchar(100) NOT NULL,
  `cover_image` varchar(100) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`tour_id`, `tour_variant`, `name`, `description`, `inclusion`, `exclusion`, `important_notes`, `additional_info`, `available_slots`, `duration_day`, `duration_night`, `tour_type`, `minimum_age`, `location`, `google_map_url`, `google_map_address`, `banner_image`, `cover_image`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(11, '3', 'Mangolore Activities', '<p>About Malvanthige Adventure Tour: A Thrilling Off-Beat Experience Embark on a two-day escapade with Malvanthige Adventure Tour, designed to transport you to a realm of absolute thrills and off-beat wonders. This Malvanthige Adventure Tour promises not just excitement but a tapestry of memories etched in the landscapes of TB Beach, the thrill of water parks, the serenity of tea estates, and the breathtaking vistas of Elneer Falls and Kyathanmakki View Point.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices Maecenas</p>\r\n', NULL, NULL, NULL, NULL, 4, 2, 1, 'adventure, food, beach', '10 years+', 'Mysore', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_10.png', 'cover_image_10.png', '1', '2024-06-22 17:07:47', 1, '2024-06-26 15:33:41', 1, '0', NULL, NULL),
(12, '3', 'Hubli  Activities', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 15:14:02', 1, '0', NULL, NULL),
(13, '3', 'Goa  Activities', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 15:13:37', 1, '0', NULL, NULL),
(14, '1', 'Delhi Adventure', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 15:09:31', 1, '0', NULL, NULL),
(15, '1', 'Hyderabad Adventure', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 15:13:01', 1, '0', NULL, NULL),
(16, '1', 'Punjab Adventure', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 15:12:33', 1, '0', NULL, NULL),
(17, '2', 'Assam Tour', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 15:11:43', 1, '0', NULL, NULL),
(18, '2', 'Meghalaya Tour', '<p><strong>New&nbsp;</strong>Greenfield Veggie Mix is pH neutral (6.5-7.5) and rich in organic carbon, nitrogen, phosphorus, potassium, silica, magnesium, calcium, iron, aluminium, sulphur and other essential micro-nutrients. Recommended for: Tomato, cucumber, capsicum, chillies, bell pepper, lettuce, broccoli, basil, parsley, etc</p>\r\n', NULL, NULL, NULL, NULL, 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_1.png', '1', '2024-06-19 19:04:13', 1, '2024-06-26 16:11:49', 1, '0', NULL, NULL),
(24, '2', 'Bengaluru Tour', '<p><strong>About Malvanthige</strong> Adventure Tour: A Thrilling Off-Beat Experience Embark on a two-day escapade with Malvanthige Adventure Tour, designed to transport you to a realm of absolute thrills and off-beat wonders. This Malvanthige Adventure Tour promises not just excitement but a tapestry of memories etched in the landscapes of TB Beach, the thrill of water parks, the serenity of tea estates, and the breathtaking vistas of Elneer Falls and Kyathanmakki View Point.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices Maecenas</p>\r\n', '<ul>\r\n	<li>Travel from Bangalore To Kodachadri&nbsp; In Non AC sit-in coach Bus/TT</li>\r\n	<li>4 meals: 2 breakfasts (Day 1 &amp; 2), 2 Lunch (Day 1),and 1 Dinner (Day 1)</li>\r\n	<li>Accommodation in tents or rooms or dormitories on multiple sharing basis</li>\r\n	<li>Off-Road Jeep Ride To the Homestay.</li>\r\n	<li>Local Guide and Outdoor trek leader from Adventure Buddha</li>\r\n	<li>Entry charges</li>\r\n	<li>&nbsp;Forest Permits</li>\r\n</ul>\r\n', '<ul>\r\n	<li>Meals other than mentioned in the itinerary</li>\r\n	<li>GST</li>\r\n	<li>Any Kind of Personal Expenses</li>\r\n	<li>Any kind of Insurances (health, life, accidental, medical, etc)</li>\r\n	<li>Anything that is not included in the above list</li>\r\n</ul>\r\n', '<ul>\r\n	<li><strong>No Luxury.</strong>&nbsp;We assure awesome memories in every trip, but not awesome facilities! We provide basic facilities in terms of food, travel &amp; accommodation.</li>\r\n	<li><strong>No alcohol &amp; Drugs</strong>&nbsp;<strong>during Treks &amp; adventure activities</strong></li>\r\n	<li>The itinerary is fixed. No special requests to change itinerary/schedule are permitted</li>\r\n</ul>\r\n\r\n<p>Please go through the Terms &amp; Conditions before booking:&nbsp;<a href=\"https://adventurebuddha.com/terms-and-conditions/\">Adventure Buddha Terms &amp; Conditions</a></p>\r\n\r\n<p><strong>About Trip</strong></p>\r\n\r\n<p><strong>Travel:</strong></p>\r\n\r\n<ul>\r\n	<li>This trip involves&nbsp;<strong>basic facilities</strong>&nbsp;in terms of food, travel, and stay without any luxury, whatsoever.</li>\r\n	<li>This is a group trip with a shared model. It may not suit everyone &ndash; especially those expecting privacy, Luxury, and comfort.</li>\r\n	<li>Homestay with cots &amp; beds/ floor mattresses(sharing basis, separate for boys &amp; girls), clean washrooms</li>\r\n	<li>Homestays with Tent stay.</li>\r\n	<li><strong>Please do not book this trip if you are not okay with the above points.</strong></li>\r\n	<li>Tempo Traveller or Mini Bus (with push-back seats) depending on the number of participants and Availability</li>\r\n	<li><strong>Note:</strong>&nbsp;This trip involves an overnight journey on a push-back Seater (Not sleeper or semis-sleeper).</li>\r\n	<li><strong>We request you to book this trip only if you can handle slight discomfort (especially the last row of the vehicle).</strong></li>\r\n	<li><strong>Seats are allotted on a first come first serve basis to the pickup point</strong></li>\r\n</ul>\r\n', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>ACCOMODATION TYPE</th>\r\n			<td>Rooms with cots and Floor Mattress, Tent Stay</td>\r\n		</tr>\r\n		<tr>\r\n			<th>FOOD</th>\r\n			<td>Non-Veg, Veg</td>\r\n		</tr>\r\n		<tr>\r\n			<th>TRANSPORT</th>\r\n			<td>Non Ac Coach</td>\r\n		</tr>\r\n		<tr>\r\n			<th>TREK DIFFICULTY</th>\r\n			<td>Moderate</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 3, 2, 1, 'adventure , food', '10 years+', 'Bengaluru New', 'https://maps.google.com/?q=Mysuru,+Karnataka,+India&ftid=0x3baf70381d572ef9:0x2b89ece8c0f8396d', 'Mysore, Karnataka, India', 'banner_image_1.png', 'cover_image_24.png', '1', '2024-06-19 19:04:13', 1, '2024-07-01 11:16:28', 1, '0', NULL, NULL),
(26, '1', 'Assam Adventure', '<p>About Malvanthige Adventure Tour: A Thrilling Off-Beat Experience Embark on a two-day escapade with Malvanthige Adventure Tour, designed to transport you to a realm of absolute thrills and off-beat wonders. This Malvanthige Adventure Tour promises not just excitement but a tapestry of memories etched in the landscapes of TB Beach, the thrill of water parks, the serenity of tea estates, and the breathtaking vistas of Elneer Falls and Kyathanmakki View Point.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices Maecenas</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', 3, 2, 2, 'adventure, food, beach', '10 years+', 'Assam', 'https://maps.google.com/?q=Assam,+Sikkim+737135,+India&ftid=0x39e6af3d9216e749:0x10e5baa02b84c09', 'Assam, Sikkim, India', 'banner_image_26.png', 'cover_image_26.png', '1', '2024-06-27 13:17:25', 1, '2024-07-01 10:57:04', 1, '0', NULL, NULL),
(27, '2', 'Masori Tour', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', '<p>asdf</p>\r\n', 10, 2, 1, 'adventure, food, beach', '10 years+', 'Masouri', 'https://maps.google.com/?q=Mussoorie,+Uttarakhand,+India&ftid=0x3908d0cfa61cda5b:0x197fd47d980e85b1', 'Masouri, Uttarakhand, India', 'banner_image_27.png', 'cover_image_27.png', '0', '2024-06-29 17:26:00', 1, '2024-06-29 17:27:16', 1, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tour_booking_enquiry`
--

CREATE TABLE `tour_booking_enquiry` (
  `tour_booking_enquiry_id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `tour_date_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contactno` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tour_booking_enquiry`
--

INSERT INTO `tour_booking_enquiry` (`tour_booking_enquiry_id`, `tour_id`, `tour_date_id`, `name`, `contactno`, `email`, `subject`, `description`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(1, 24, '18', 'ramkumar gurav', '08549065626', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'asdf', '0', '2024-06-26 12:34:53', NULL, '2024-06-27 15:09:12', 1, '0', NULL, NULL),
(2, 24, '9', 'Shan', '8549065626', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'asdf', '0', '2024-06-26 13:16:35', NULL, '2024-06-27 15:09:12', 1, '0', NULL, NULL),
(3, 24, '8', 'tours ram', '08549065626', 'ramkumarsgurav@gmail.com', 'upcoming tours booking', 'asdfasdf', '0', '2024-06-26 15:53:45', NULL, '2024-06-27 15:09:12', 1, '0', NULL, NULL),
(4, 16, '26', 'adventure ram', '08549065626', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'asdf', '1', '2024-06-26 15:54:16', NULL, NULL, NULL, '0', NULL, NULL),
(5, 13, '20', 'activities gurav', '08549065626', 'ramkumarsgurav@gmail.com', 'Activities booking', 'asdf', '1', '2024-06-26 15:55:26', NULL, '2024-06-26 16:09:39', 1, '0', NULL, NULL),
(6, 16, '26', 'ramkumar gurav', '8549065626', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'sdfg', '1', '2024-06-26 16:16:23', NULL, NULL, NULL, '0', NULL, NULL),
(7, 16, '26', 'ramkumar gurav', '1243', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'asdf', '0', '2024-06-26 16:37:19', NULL, '2024-06-29 17:14:57', 1, '0', NULL, NULL),
(8, 24, '', '', '', '', '', '', '1', '2024-07-02 11:44:15', NULL, NULL, NULL, '0', NULL, NULL),
(9, 24, '', '', '', '', '', '', '1', '2024-07-02 11:44:28', NULL, NULL, NULL, '0', NULL, NULL),
(10, 24, '', 'ramkumar gurav', '', 'ramkumarsgurav@gmail.com', '', '', '1', '2024-07-02 11:44:42', NULL, NULL, NULL, '0', NULL, NULL),
(11, 24, '', 'ramkumar gurav', '8549065626', 'ramkumarsgurav@gmail.com', '', '', '1', '2024-07-02 11:44:48', NULL, NULL, NULL, '0', NULL, NULL),
(12, 26, '66', 'Mahesh gurav', '8549065626', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'asdfasdfasdf', '1', '2024-07-04 17:59:16', NULL, NULL, NULL, '0', NULL, NULL),
(13, 26, '67', 'girish gurav', '8549065626', 'ramkumarsgurav@gmail.com', 'upcoming adventures booking', 'asdf asdf a ssfd', '1', '2024-07-04 18:00:07', NULL, NULL, NULL, '0', NULL, NULL),
(14, 13, '20', 'activities gurav', '8549065626', 'ramkumarsgurav@gmail.com', 'activities booking', 'asdf asdf asdf', '1', '2024-07-04 18:00:48', NULL, NULL, NULL, '0', NULL, NULL),
(15, 18, '22', 'tours1 gour', '8549065626', 'ramkumarsgurav@gmail.com', 'upcoming tours booking', 'asd asd dsaf', '1', '2024-07-04 18:03:00', NULL, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tour_date`
--

CREATE TABLE `tour_date` (
  `tour_date_id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `is_discount` char(1) DEFAULT '1',
  `actual_price` decimal(10,2) DEFAULT 0.00,
  `discounted_price` decimal(10,2) DEFAULT 0.00,
  `start_date_time` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tour_date`
--

INSERT INTO `tour_date` (`tour_date_id`, `tour_id`, `is_discount`, `actual_price`, `discounted_price`, `start_date_time`, `end_date`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(10, 23, '0', '100.00', '0.00', '23/06/24 02PM', '24/06/24', '1', '2024-06-24 14:49:02', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(11, 23, '0', '100.00', '0.00', '09/06/24 02PM', '24/06/24', '1', '2024-06-24 14:49:02', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(12, 22, '0', '100.00', '0.00', '10/06/24 02PM', '19/06/24', '1', '2024-06-24 14:49:26', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(13, 22, '0', '100.00', '0.00', '16/06/24 02PM', '24/06/24', '1', '2024-06-24 14:49:26', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(14, 22, '0', '100.00', '0.00', '12/06/24 02PM', '24/06/24', '1', '2024-06-24 14:49:26', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(15, 25, '0', '100.00', '0.00', '16/06/24 03PM', '24/06/24', '1', '2024-06-24 15:34:37', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(20, 13, '1', '100.00', '80.00', '25/06/24  02:PM', '27/06/24', '1', '2024-06-26 14:52:22', 1, '2024-06-26 19:21:26', NULL, '0', NULL, NULL),
(21, 13, '0', '100.00', '0.00', '23/06/24  07:PM', '29/06/24', '1', '2024-06-26 14:52:22', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(22, 18, '1', '100.00', '70.00', '26/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:53:05', 1, '2024-06-26 19:08:19', NULL, '0', NULL, NULL),
(23, 18, '0', '100.00', '0.00', '25/06/24  02:PM', '27/06/24', '1', '2024-06-26 14:53:06', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(24, 17, '1', '100.00', '80.00', '26/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:53:41', 1, '2024-06-26 19:08:23', NULL, '0', NULL, NULL),
(25, 17, '0', '100.00', '0.00', '25/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:53:41', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(26, 16, '1', '100.00', '85.00', '25/06/24  02:PM', '27/06/24', '1', '2024-06-26 14:54:32', 1, '2024-06-26 19:19:00', NULL, '0', NULL, NULL),
(27, 16, '0', '100.00', '50.00', '27/06/24  02:PM', '27/06/24', '1', '2024-06-26 14:54:32', 1, '2024-06-26 19:19:38', NULL, '0', NULL, NULL),
(28, 15, '0', '100.00', '0.00', '26/06/24  02:PM', '29/06/24', '1', '2024-06-26 14:55:08', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(29, 15, '0', '100.00', '0.00', '25/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:55:08', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(30, 14, '0', '100.00', '0.00', '25/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:56:09', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(31, 14, '0', '100.00', '0.00', '26/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:56:09', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(32, 14, '0', '100.00', '0.00', '26/06/24  02:PM', '28/06/24', '1', '2024-06-26 14:56:09', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(33, 12, '0', '100.00', '0.00', '26/06/24  02:PM', '27/06/24', '1', '2024-06-26 14:57:15', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(34, 12, '0', '100.00', '0.00', '26/07/24  02:PM', '27/07/24', '1', '2024-06-26 14:57:15', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(35, 11, '0', '100.00', '0.00', '25/06/24  03:PM', '26/06/24', '1', '2024-06-26 15:33:41', 1, '2024-06-26 18:29:20', NULL, '0', NULL, NULL),
(61, 24, '1', '500.00', '400.00', '27/06/24  03:PM', '28/06/24', '1', '2024-06-27 15:12:27', 1, NULL, NULL, '0', NULL, NULL),
(62, 24, '0', '600.00', '0.00', '28/06/24  03:PM', '29/06/24', '1', '2024-06-27 15:12:27', 1, NULL, NULL, '0', NULL, NULL),
(63, 27, '1', '10000.00', '7000.00', '29/06/24  05:PM', '30/06/24', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(65, 27, '0', '9000.00', '0.00', '29/06/24  05:PM', '30/06/24', '1', '2024-06-29 17:27:16', 1, NULL, NULL, '0', NULL, NULL),
(66, 26, '1', '5000.00', '4000.00', '26/06/24  05:PM', '27/06/24', '1', '2024-06-29 17:59:57', 1, NULL, NULL, '0', NULL, NULL),
(67, 26, '1', '20000.00', '18997.00', '01/07/24  10:AM', '02/07/24', '1', '2024-07-01 10:57:04', 1, NULL, NULL, '0', NULL, NULL),
(68, 24, '1', '15000.00', '14000.00', '01/07/24  11:AM', '02/07/24', '1', '2024-07-01 11:16:28', 1, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tour_plan`
--

CREATE TABLE `tour_plan` (
  `tour_plan_id` int(11) NOT NULL,
  `tour_id` int(11) DEFAULT NULL,
  `day_number` int(2) DEFAULT 0,
  `day_name` varchar(255) DEFAULT NULL,
  `day_plan` longtext NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tour_plan`
--

INSERT INTO `tour_plan` (`tour_plan_id`, `tour_id`, `day_number`, `day_name`, `day_plan`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(30, 1, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 16:58:36', 1, NULL, NULL, '0', NULL, NULL),
(31, 1, 1, 'TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p><strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.</p>\r\n\r\n<p><strong>9:00 AM :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the day in the cozy tents.</p>\r\n', '1', '2024-06-22 16:58:36', 1, NULL, NULL, '0', NULL, NULL),
(32, 1, 2, 'Tea Estate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn, freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p><strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.</p>\r\n', '1', '2024-06-22 16:58:36', 1, NULL, NULL, '0', NULL, NULL),
(33, 10, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(34, 10, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p><strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.</p>\r\n\r\n<p><strong>9:00 AM :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(35, 10, 2, 'Tea Estate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn, freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p><strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(36, 11, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:24:39', NULL, '0', NULL, NULL),
(37, 11, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p><strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.</p>\r\n\r\n<p><strong>9:00 AM :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:24:42', NULL, '0', NULL, NULL),
(38, 11, 2, 'Tea Estate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn, freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p><strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.</p>\r\n', '1', '2024-06-22 17:07:48', 1, '2024-06-23 16:24:44', NULL, '0', NULL, NULL),
(39, 12, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(40, 12, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(41, 12, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(42, 13, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(43, 13, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(44, 13, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(45, 14, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(46, 14, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(47, 14, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(48, 15, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(49, 15, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(50, 15, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(51, 16, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(52, 16, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(53, 16, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(54, 17, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(55, 17, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(56, 17, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(57, 18, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(58, 18, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(59, 18, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(60, 19, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(61, 19, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(62, 19, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(63, 20, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(64, 20, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(65, 20, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(66, 21, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(67, 21, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(68, 21, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(69, 22, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(70, 22, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(71, 22, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(72, 23, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(73, 23, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(74, 23, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(75, 24, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.\r\n</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(76, 24, 1, ' TB Beach - Amusement Park - Malvanthige Estate', '<p><strong>6:00 AM\r\n    :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p>\r\n  <strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.\r\n</p>\r\n\r\n<p><strong>9:00 AM\r\n    :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM\r\n    :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige\r\n  Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.\r\n</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and\r\n  unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the\r\n  day in the cozy tents.</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(77, 24, 2, 'Tea\r\nEstate Walk - Elneer Falls - Kyathanmakki View Point', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn,\r\n  freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk\r\n  to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for\r\n  breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM\r\n    :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p>\r\n  <strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.\r\n</p>\r\n', '1', '2024-06-22 17:07:48', 1, NULL, NULL, '0', NULL, NULL),
(78, 25, 1, 'Overnight Journey from Bangalore to TB Beach', '', '1', '2024-06-24 15:34:37', 1, NULL, NULL, '0', NULL, NULL),
(79, 1, 0, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>7:00 PM :&nbsp;</strong>Depart from Bangalore for TB Beach.</p>\r\n\r\n<p>Enjoy a road trip filled with lively music and cool breeze.</p>\r\n', '1', '2024-06-29 11:03:55', 1, NULL, NULL, '0', NULL, NULL),
(80, 1, 1, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>6:00 AM :</strong>&nbsp;Arrive at TB Beach. Coffee or tea with tasty bites while enjoying the sunrise.</p>\r\n\r\n<p><strong>8:00 AM :</strong>&nbsp;Freshen up and have a hearty breakfast.</p>\r\n\r\n<p><strong>9:00 AM :</strong>&nbsp;Head to the Amusement Park for a day of water activities and fun.</p>\r\n\r\n<p><strong>1:00 PM :</strong>&nbsp;Lunch at the amusement park.</p>\r\n\r\n<p><strong>2:30 PM :</strong>&nbsp;Depart for Malvanthige Estate, a 3-hour journey through scenic ghat roads. Enjoy old songs and stunning views of the Western Ghats.</p>\r\n\r\n<p><strong>6:00 PM :</strong>&nbsp;Arrival at the campsite. Welcome with a refreshing drink and time to refresh.</p>\r\n\r\n<p><strong>7:00 PM :</strong>&nbsp;B.B.Q. session with a choice of marinations. Bonfire, music, dance, and unlimited fun. Local cuisine dinner under the stars</p>\r\n\r\n<p><strong>10:00 PM :</strong>&nbsp;Sign off for the day in the cozy tents.</p>\r\n', '1', '2024-06-29 11:03:55', 1, NULL, NULL, '0', NULL, NULL),
(81, 1, 2, 'Overnight Journey from Bangalore to TB Beach', '<p><strong>Early Morning :&nbsp;</strong>Wake up to the dawn, freshen up, and energize with a coffee shot.</p>\r\n\r\n<p><strong>7:00 AM :&nbsp;</strong>Embark on a tea estate walk to absorb the fantastic views of the tea estate mountains.</p>\r\n\r\n<p><strong>9:00 AM :&nbsp;</strong>Return for breakfast and prepare for a thrilling jeep ride towards Elneer Falls.</p>\r\n\r\n<p><strong>12:00 PM :&nbsp;</strong>Enjoy the refreshing waterfalls and proceed to an off-road ride to Kyathanmakki View Point.</p>\r\n\r\n<p><strong>Afternoon :&nbsp;</strong>Have lunch on the way, capturing the essence of the journey.</p>\r\n\r\n<p><strong>Evening :&nbsp;</strong>Head back to Bangalore, concluding an unforgettable adventure.</p>\r\n', '1', '2024-06-29 11:03:55', 1, NULL, NULL, '0', NULL, NULL),
(82, 27, 0, 'asdf1', '<p>asdf</p>\r\n', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(83, 27, 1, 'asdf2', '<p>asdf</p>\r\n', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(84, 27, 2, 'asdf2', '<p>asdf</p>\r\n', '1', '2024-06-29 17:26:00', 1, NULL, NULL, '0', NULL, NULL),
(85, 26, 0, 'asdf0', '<p>asdf0</p>\r\n', '1', '2024-06-29 19:05:50', 1, NULL, NULL, '0', NULL, NULL),
(86, 26, 1, 'asdf1a', '<p>asdf1</p>\r\n', '1', '2024-06-29 19:05:50', 1, NULL, NULL, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_role_master`
--

CREATE TABLE `users_role_master` (
  `user_role_id` int(11) NOT NULL,
  `user_role_name` varchar(255) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role_master`
--

INSERT INTO `users_role_master` (`user_role_id`, `user_role_name`, `added_on`, `added_by`, `updated_on`, `updated_by`, `status`) VALUES
(1, 'Super User', '2020-04-20 13:02:15', 1, '2023-11-22 19:27:00', 1, 1),
(3, 'Product Data Entry', '2022-11-26 18:14:31', 1, NULL, NULL, 1),
(4, 'products manager', '2023-12-21 18:18:17', 1, NULL, NULL, 1),
(5, 'Sale Executive', '2024-06-26 16:38:26', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `position` int(10) DEFAULT 1,
  `file_title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `added_on` datetime DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT '0',
  `is_deleted_on` datetime DEFAULT NULL,
  `is_deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`video_id`, `position`, `file_title`, `file`, `status`, `added_on`, `added_by`, `updated_on`, `updated_by`, `is_deleted`, `is_deleted_on`, `is_deleted_by`) VALUES
(1, 1, 'Bengaluru Tour', 'XwvjYf7Za9w', '1', '2024-06-28 16:37:03', 1, NULL, NULL, '0', NULL, NULL),
(2, 2, 'Mangalore Tour', 'XwvjYf7Za9w', '1', '2024-06-28 16:37:03', 1, '2024-06-28 17:43:25', 1, '0', NULL, NULL),
(17, 1, 'XwvjYf7Za9w', 'XwvjYf7Za9w', '1', '2024-06-28 17:30:49', 1, '2024-06-28 17:49:44', 1, '0', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`admin_user_id`);

--
-- Indexes for table `admin_user_file`
--
ALTER TABLE `admin_user_file`
  ADD PRIMARY KEY (`admin_user_file_id`);

--
-- Indexes for table `admin_user_role`
--
ALTER TABLE `admin_user_role`
  ADD PRIMARY KEY (`admin_user_role`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `carousel_image`
--
ALTER TABLE `carousel_image`
  ADD PRIMARY KEY (`carousel_image_id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `company_profile`
--
ALTER TABLE `company_profile`
  ADD PRIMARY KEY (`company_profile_id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `designation_master`
--
ALTER TABLE `designation_master`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `di_tour`
--
ALTER TABLE `di_tour`
  ADD PRIMARY KEY (`di_tour_id`);

--
-- Indexes for table `di_tour_booking_enquiry`
--
ALTER TABLE `di_tour_booking_enquiry`
  ADD PRIMARY KEY (`di_tour_booking_enquiry_id`);

--
-- Indexes for table `di_tour_carousel_image`
--
ALTER TABLE `di_tour_carousel_image`
  ADD PRIMARY KEY (`di_tour_carousel_image_id`);

--
-- Indexes for table `di_tour_gallery_image`
--
ALTER TABLE `di_tour_gallery_image`
  ADD PRIMARY KEY (`di_tour_gallery_image_id`);

--
-- Indexes for table `di_tour_plan`
--
ALTER TABLE `di_tour_plan`
  ADD PRIMARY KEY (`di_tour_plan_id`);

--
-- Indexes for table `di_tour_things_to_carry`
--
ALTER TABLE `di_tour_things_to_carry`
  ADD PRIMARY KEY (`di_tour_things_to_carry_id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  ADD PRIMARY KEY (`fiscal_year_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `gallery_image`
--
ALTER TABLE `gallery_image`
  ADD PRIMARY KEY (`gallery_image_id`);

--
-- Indexes for table `module_master`
--
ALTER TABLE `module_master`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `module_permissions`
--
ALTER TABLE `module_permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `things_to_carry`
--
ALTER TABLE `things_to_carry`
  ADD PRIMARY KEY (`things_to_carry_id`);

--
-- Indexes for table `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`tour_id`);

--
-- Indexes for table `tour_booking_enquiry`
--
ALTER TABLE `tour_booking_enquiry`
  ADD PRIMARY KEY (`tour_booking_enquiry_id`);

--
-- Indexes for table `tour_date`
--
ALTER TABLE `tour_date`
  ADD PRIMARY KEY (`tour_date_id`);

--
-- Indexes for table `tour_plan`
--
ALTER TABLE `tour_plan`
  ADD PRIMARY KEY (`tour_plan_id`);

--
-- Indexes for table `users_role_master`
--
ALTER TABLE `users_role_master`
  ADD PRIMARY KEY (`user_role_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `admin_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_user_file`
--
ALTER TABLE `admin_user_file`
  MODIFY `admin_user_file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `admin_user_role`
--
ALTER TABLE `admin_user_role`
  MODIFY `admin_user_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carousel_image`
--
ALTER TABLE `carousel_image`
  MODIFY `carousel_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1226;

--
-- AUTO_INCREMENT for table `company_profile`
--
ALTER TABLE `company_profile`
  MODIFY `company_profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `designation_master`
--
ALTER TABLE `designation_master`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `di_tour`
--
ALTER TABLE `di_tour`
  MODIFY `di_tour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `di_tour_booking_enquiry`
--
ALTER TABLE `di_tour_booking_enquiry`
  MODIFY `di_tour_booking_enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `di_tour_carousel_image`
--
ALTER TABLE `di_tour_carousel_image`
  MODIFY `di_tour_carousel_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `di_tour_gallery_image`
--
ALTER TABLE `di_tour_gallery_image`
  MODIFY `di_tour_gallery_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `di_tour_plan`
--
ALTER TABLE `di_tour_plan`
  MODIFY `di_tour_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `di_tour_things_to_carry`
--
ALTER TABLE `di_tour_things_to_carry`
  MODIFY `di_tour_things_to_carry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  MODIFY `fiscal_year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gallery_image`
--
ALTER TABLE `gallery_image`
  MODIFY `gallery_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `module_master`
--
ALTER TABLE `module_master`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `module_permissions`
--
ALTER TABLE `module_permissions`
  MODIFY `permission_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `things_to_carry`
--
ALTER TABLE `things_to_carry`
  MODIFY `things_to_carry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `tour`
--
ALTER TABLE `tour`
  MODIFY `tour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tour_booking_enquiry`
--
ALTER TABLE `tour_booking_enquiry`
  MODIFY `tour_booking_enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tour_date`
--
ALTER TABLE `tour_date`
  MODIFY `tour_date_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tour_plan`
--
ALTER TABLE `tour_plan`
  MODIFY `tour_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `users_role_master`
--
ALTER TABLE `users_role_master`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
