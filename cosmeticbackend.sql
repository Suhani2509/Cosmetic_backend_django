-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2025 at 03:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosmeticbackend`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add contact data', 8, 'add_contactdata'),
(30, 'Can change contact data', 8, 'change_contactdata'),
(31, 'Can delete contact data', 8, 'delete_contactdata'),
(32, 'Can view contact data', 8, 'view_contactdata');

-- --------------------------------------------------------

--
-- Table structure for table `contact_contactdata`
--

CREATE TABLE `contact_contactdata` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `subject` longtext NOT NULL,
  `message` longtext NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_contactdata`
--

INSERT INTO `contact_contactdata` (`id`, `fullname`, `email`, `contact`, `subject`, `message`, `date`) VALUES
(1, 'Suhani', 'suhani25@gmail.com', '8788994706', 'Hii', 'Hello world', '2025-08-16 08:58:37.086957'),
(2, 'Tanvi', 'suhani25@gmail.com', '8788994706', 'Hii', 'Hello world', '2025-08-16 08:59:56.234611'),
(3, 'SUHANI', 'user@example.com', '7896541236', 'HERO', 'DONT KNOW', '2025-08-16 09:48:40.386177');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(8, 'contact', 'contactdata'),
(4, 'contenttypes', 'contenttype'),
(7, 'product', 'product'),
(5, 'sessions', 'session'),
(6, 'user', 'customuser');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-08-15 10:15:04.624949'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-08-15 10:15:04.821476'),
(3, 'auth', '0001_initial', '2025-08-15 10:15:05.472342'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-08-15 10:15:05.598252'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-08-15 10:15:05.608233'),
(6, 'auth', '0004_alter_user_username_opts', '2025-08-15 10:15:05.628357'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-08-15 10:15:05.638214'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-08-15 10:15:05.658072'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-08-15 10:15:05.674520'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-08-15 10:15:05.688195'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-08-15 10:15:05.698117'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-08-15 10:15:05.728097'),
(13, 'auth', '0011_update_proxy_permissions', '2025-08-15 10:15:05.745569'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-08-15 10:15:05.757993'),
(15, 'user', '0001_initial', '2025-08-15 10:15:06.594294'),
(16, 'admin', '0001_initial', '2025-08-15 10:15:06.918051'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-08-15 10:15:06.937988'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-15 10:15:06.947962'),
(19, 'sessions', '0001_initial', '2025-08-15 10:15:07.021366'),
(20, 'user', '0002_alter_customuser_gender', '2025-08-15 11:02:41.997417'),
(21, 'product', '0001_initial', '2025-08-16 06:48:52.901259'),
(22, 'contact', '0001_initial', '2025-08-16 08:54:48.832862');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_product`
--

CREATE TABLE `product_product` (
  `id` bigint(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_product`
--

INSERT INTO `product_product` (`id`, `category`, `image`, `description`, `price`, `original_price`, `discount`, `user_id`) VALUES
(1, 'foundation', 'foundation/django.png', 'gsg', 200.00, 350.00, 10, 1),
(2, 'foundation', 'foundation/cb_WUkqQQq.png', 'dskf', 520.00, 630.00, 10, 1),
(3, 'foundation', 'foundation/cb_3H7SjXi.png', 'ffdff', 520.00, 620.00, 10, 1),
(4, 'foundation', 'foundation/pubg.webp', 'ffdff', 520.00, 620.00, 10, 1),
(5, 'lipstick', 'lipstick/pubg.webp', 'ffdff', 520.00, 620.00, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_customuser`
--

CREATE TABLE `user_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `address` longtext DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_customuser`
--

INSERT INTO `user_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `address`, `contact`, `gender`) VALUES
(1, 'suhani@123', NULL, 1, 'suhani@123', '', '', 'user@example.com', 0, 1, '2025-08-15 10:57:13.448627', 'pune', '7896541223', 'female'),
(2, 'suhani123', NULL, 0, 'Suhani', '', '', 'suhani@gmail.com', 0, 1, '2025-08-15 11:10:24.958540', 'Pune', '8788994706', 'female'),
(3, 'pbkdf2_sha256$260000$c4BuM7xaSUwd21BZFZ0Ieq$SUKoTr0j3Wk58K23ZtaKp/dpgGwmseLSeXBCi1sTALM=', NULL, 0, 'Tanvi', '', '', 'tanvi@gmail.com', 0, 1, '2025-08-16 17:14:36.986235', 'wagholi', '6789064213', 'female');

-- --------------------------------------------------------

--
-- Table structure for table `user_customuser_groups`
--

CREATE TABLE `user_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_customuser_user_permissions`
--

CREATE TABLE `user_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `contact_contactdata`
--
ALTER TABLE `contact_contactdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `product_product`
--
ALTER TABLE `product_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_product_user_id_0d8fb375_fk_user_customuser_id` (`user_id`);

--
-- Indexes for table `user_customuser`
--
ALTER TABLE `user_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_customuser_groups`
--
ALTER TABLE `user_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_customuser_groups_customuser_id_group_id_e0a2f621_uniq` (`customuser_id`,`group_id`),
  ADD KEY `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `user_customuser_user_permissions`
--
ALTER TABLE `user_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_customuser_user_per_customuser_id_permission_a5da865d_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `contact_contactdata`
--
ALTER TABLE `contact_contactdata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_product`
--
ALTER TABLE `product_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_customuser`
--
ALTER TABLE `user_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_customuser_groups`
--
ALTER TABLE `user_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_customuser_user_permissions`
--
ALTER TABLE `user_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);

--
-- Constraints for table `product_product`
--
ALTER TABLE `product_product`
  ADD CONSTRAINT `product_product_user_id_0d8fb375_fk_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_customuser` (`id`);

--
-- Constraints for table `user_customuser_groups`
--
ALTER TABLE `user_customuser_groups`
  ADD CONSTRAINT `user_customuser_grou_customuser_id_192632a7_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  ADD CONSTRAINT `user_customuser_groups_group_id_bcbc9e48_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `user_customuser_user_permissions`
--
ALTER TABLE `user_customuser_user_permissions`
  ADD CONSTRAINT `user_customuser_user_customuser_id_4552d9cc_fk_user_cust` FOREIGN KEY (`customuser_id`) REFERENCES `user_customuser` (`id`),
  ADD CONSTRAINT `user_customuser_user_permission_id_e57e8b9a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
