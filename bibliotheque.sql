-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3310
-- Generation Time: Oct 21, 2022 at 12:52 PM
-- Server version: 8.0.24
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bibliotheque`
--

-- --------------------------------------------------------

--
-- Table structure for table `emprente`
--

CREATE TABLE `emprente` (
  `id` int UNSIGNED NOT NULL,
  `livre_id` int UNSIGNED NOT NULL,
  `lectreur_id` int UNSIGNED NOT NULL,
  `date_get` date NOT NULL,
  `date_return` date DEFAULT NULL,
  `isGoodState` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecteur`
--

CREATE TABLE `lecteur` (
  `id` int UNSIGNED NOT NULL,
  `date_incription` date NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numcart` int UNSIGNED NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_fname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_lname` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cathegory` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dispinible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emprente`
--
ALTER TABLE `emprente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_livre_id` (`livre_id`),
  ADD KEY `fk_lecteur_id` (`lectreur_id`);

--
-- Indexes for table `lecteur`
--
ALTER TABLE `lecteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emprente`
--
ALTER TABLE `emprente`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lecteur`
--
ALTER TABLE `lecteur`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emprente`
--
ALTER TABLE `emprente`
  ADD CONSTRAINT `fk_lecteur_id` FOREIGN KEY (`lectreur_id`) REFERENCES `lecteur` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_livre_id` FOREIGN KEY (`livre_id`) REFERENCES `livre` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
