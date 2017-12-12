-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 12, 2017 at 08:56 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Keepa_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2017-12-11 12:18:11', '2017-12-11 12:18:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_grants`
--

CREATE TABLE `oauth_access_grants` (
  `id` bigint(20) NOT NULL,
  `resource_owner_id` int(11) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_in` int(11) NOT NULL,
  `redirect_uri` text NOT NULL,
  `created_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `scopes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_access_grants`
--

INSERT INTO `oauth_access_grants` (`id`, `resource_owner_id`, `application_id`, `token`, `expires_in`, `redirect_uri`, `created_at`, `revoked_at`, `scopes`) VALUES
(1, 2, 1, '282f0e9f15609b80c09f6c2bff85cd911eaa717507ed6bf12eebc628a7eaa05a', 600, 'urn:ietf:wg:oauth:2.0:oob', '2017-12-11 12:39:09', NULL, ''),
(2, 2, 1, 'd56a8ace08dca7d4104d33dc75e6ffe4b9c50f375e584742393e993766e424ef', 600, 'urn:ietf:wg:oauth:2.0:oob', '2017-12-11 12:47:29', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` bigint(20) NOT NULL,
  `resource_owner_id` int(11) DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `expires_in` int(11) DEFAULT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `scopes` varchar(255) DEFAULT NULL,
  `previous_refresh_token` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_applications`
--

CREATE TABLE `oauth_applications` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `redirect_uri` text NOT NULL,
  `scopes` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_applications`
--

INSERT INTO `oauth_applications` (`id`, `name`, `uid`, `secret`, `redirect_uri`, `scopes`, `created_at`, `updated_at`) VALUES
(1, 'abutours web', '31aa5c07db6553ebf004df9e30c95b92673773044cae19fb711303930a51e083', 'd1baebc55348c5303dbc22a99badc21c8ccea1dfb77edfc227a0e78eb35b95c7', 'urn:ietf:wg:oauth:2.0:oob', '', '2017-12-11 12:26:23', '2017-12-11 12:26:23');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20171211121633'),
('20171211122417');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_digest`, `created_at`, `updated_at`) VALUES
(1, 'ri.ganjil@gmail.com', '$2a$10$ALwkgRF5/DErXGZSILnm5ew2d3BTegeJIAarnl5wZYMV68AvxzIPy', '2017-12-11 12:31:07', '2017-12-11 12:31:07'),
(2, 'gustang@gmail.com', '$2a$10$aSNun7TW4vnbeNXTvTpm6O70pTMXZPe80JzRCR.TTkCg4EnK7u2Pi', '2017-12-11 12:38:46', '2017-12-11 12:38:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `oauth_access_grants`
--
ALTER TABLE `oauth_access_grants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_oauth_access_grants_on_token` (`token`),
  ADD KEY `index_oauth_access_grants_on_application_id` (`application_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_oauth_access_tokens_on_token` (`token`),
  ADD UNIQUE KEY `index_oauth_access_tokens_on_refresh_token` (`refresh_token`),
  ADD KEY `index_oauth_access_tokens_on_application_id` (`application_id`),
  ADD KEY `index_oauth_access_tokens_on_resource_owner_id` (`resource_owner_id`);

--
-- Indexes for table `oauth_applications`
--
ALTER TABLE `oauth_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_oauth_applications_on_uid` (`uid`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_users_on_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oauth_access_grants`
--
ALTER TABLE `oauth_access_grants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oauth_applications`
--
ALTER TABLE `oauth_applications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oauth_access_grants`
--
ALTER TABLE `oauth_access_grants`
  ADD CONSTRAINT `fk_rails_b4b53e07b8` FOREIGN KEY (`application_id`) REFERENCES `oauth_applications` (`id`);

--
-- Constraints for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD CONSTRAINT `fk_rails_732cb83ab7` FOREIGN KEY (`application_id`) REFERENCES `oauth_applications` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
