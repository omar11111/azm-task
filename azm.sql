-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 21, 2023 at 10:09 PM
-- Server version: 5.7.33
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azm`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'blog4', 'description4', NULL, '2012-06-01 02:12:30', '2015-04-11 04:11:12', NULL),
(5, 'omar', 'description', NULL, '2012-06-01 02:12:30', '2023-10-21 23:44:01', NULL),
(6, 'blog6', 'description6', NULL, '2012-06-01 02:12:30', '2017-01-10 06:40:10', NULL),
(7, 'blog7', 'description7', NULL, '2012-06-01 02:12:30', '2017-05-02 02:20:30', NULL),
(8, 'blog8', 'description8', NULL, '2012-06-01 02:12:30', '2018-01-04 05:15:35', NULL),
(9, 'blog9', 'description9', NULL, '2012-06-01 02:12:30', '2019-01-02 02:20:30', NULL),
(10, 'blog10', 'description10', NULL, '2012-06-01 02:12:30', '2020-02-01 06:22:50', NULL),
(29, 'new blog', 'new blog description', NULL, '2023-10-21 12:46:50', '2023-10-21 12:50:26', '2023-10-21 16:01:00'),
(30, 'new blog', 'new blog description', NULL, '2023-10-21 15:58:45', '2023-10-21 15:58:45', NULL),
(31, 'new blog', 'new blog description', NULL, '2023-10-21 19:08:59', '2023-10-21 19:08:59', '2023-10-21 23:43:04'),
(32, 'new blog', 'new blog description', NULL, '2023-10-21 23:17:49', '2023-10-21 23:17:49', '2023-10-21 23:45:37'),
(33, 'new blog', 'new blog description', NULL, '2023-10-21 23:19:34', '2023-10-21 23:19:34', '2023-10-21 23:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `post_id`) VALUES
(1, 'fff', 1, 29);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'omar', 'algalfy71@gmail.com', '$2y$10$eJuGIzoFlTe4zWTcURN/Z.Q8IPrfoGUgn9ej5YwyWhLe7sSP8Txae'),
(3, 'omar', 'algalfy@gmail.com', '$2y$10$KOn4QK3W5qecj.TlOOp/H.A/E4mg3JMXc.EccMpWir/RDfD9qfmFi'),
(8, 'omar', 'trer@gmail.com', '$2y$10$h09sbm9rPGFAPiT6hxuszO9R43pwROBunUXEPjC96BT6ojTKSYBdm'),
(10, 'omar', 'trer@y.com', '$2y$10$l2PWa.NXj2e07FDiljobe./6ZC8sktZ7TFf5tdIwnL1raFma/4FHW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `users_fk_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `post_fk_id` FOREIGN KEY (`post_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_fk_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
