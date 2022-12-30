-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21.12.2022 klo 09:28
-- Palvelimen versio: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuotteet`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `tuote`
--

CREATE TABLE `tuote` (
  `tuoteid` int(255) NOT NULL,
  `tuotenimi` varchar(40) NOT NULL,
  `hinta` decimal(5,2) DEFAULT NULL,
  `tarjoushinta` decimal(5,2) DEFAULT NULL,
  `saldo` smallint(5) DEFAULT NULL,
  `trnro` smallint(6) DEFAULT NULL,
  `tuotekuvaus` text DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `tuote`
--

INSERT INTO `tuote` (`tuoteid`, `tuotenimi`, `hinta`, `tarjoushinta`, `saldo`, `trnro`, `tuotekuvaus`, `img`) VALUES
(1, 'Afrikan tähti', '13.99', NULL, 250, 1, 'Pelaajien lukumäärä:2 - 6 pelaajaa, Ikäsuositus: 5+, Pelin kesto n. 15-60 min, Kielet: Suomi, ruotsi, viro, englanti', 'lautapelit/Afrikan tähti.png'),
(2, 'Kimble', '14.95', NULL, 250, 1, 'Pelaajien lukumäärä: 2 - 4 pelaajaa, Pelityyppi: Lasten peli, Tyyppi: Klassisia pelejä', 'lautapelit/kimble.png'),
(3, 'Monopoli', '32.90', NULL, 150, 1, 'Pelaajien lukumäärä: 2 - 8 pelaajaa, Ikäsuositus: 8 - 99 vuotta, Pelityyppi: Vuoroihin perustuva, Perhepeli, Survival', 'lautapelit/monopoly.png'),
(4, 'Trivial Pursuit', '39.95', NULL, 150, 1, 'Pelaajien lukumäärä: 2 - 6 pelaajaa, Ikäsuositus: 16 - 99 vuotta, Pelityyppi: Vuoroihin perustuva, Perhepeli, Juhlapelit, Tietokilpailu, Lasten peli', 'lautapelit/Trivial Pursuit.png'),
(5, 'Tammi', '17.90', NULL, 100, 1, 'Klassinen Tammi peli puisena, taitettavana pelinä. Näppärä koko, n 20x20cm.', 'lautapelit/tammi.png'),
(6, 'Tetris', '19.90', NULL, 50, 2, 'Tetriksen Game Boy versio. Tämä klassikko on yksi maailman myydyimmistä pelisarjoista', 'Konsolipelit/Tetris.jpg'),
(7, 'Donkey Kong', '19.90', NULL, 50, 2, 'Donkey Kong-peli Nintendolle', 'Konsolipelit/Donkey Kong.jpg'),
(8, 'The Legend of Zelda', '19.90', NULL, 50, 2, 'Zelda-peli Golden Edition Nintendolle', 'Konsolipelit/Legend of Zelda.png'),
(9, 'Super Mario 3', '19.90', '12.90', 50, 2, 'Super Mario 3-peli Nintendo Game Boy Advancelle', 'Konsolipelit/Super Mario 3.jpg'),
(10, 'Duck Hunt', '19.90', NULL, 50, 2, 'Duck Hunt-peli Nintendolle', 'Konsolipelit/DuckHunt.jpg'),
(11, 'Pac-Man', '10.90', NULL, 100, 3, 'Pac-Man original Japan edition', 'Tietokonepelit/Pac-Man original.jpg'),
(12, 'Duke Nukem 3D', '10.90', NULL, 20, 3, 'Duke Nukem 3D 1996', 'Tietokonepelit/Duke Nukem 3D.jpg'),
(13, 'Prince of Persia 2', '10.90', NULL, 100, 3, 'Prince of Persia 2 1993', 'Tietokonepelit/Prince of Persia 2.jpg'),
(14, 'Lemmings', '10.90', NULL, 100, 3, 'Lemmings-peli tietokoneelle', 'Tietokonepelit/Lemmings.jpg'),
(15, 'Hugo-peikkopeli', '10.90', '6.90', 100, 3, 'Hugo Peikko-peli tietokoneelle', 'Tietokonepelit/Hugo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tuote`
--
ALTER TABLE `tuote`
  ADD PRIMARY KEY (`tuoteid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tuote`
--
ALTER TABLE `tuote`
  MODIFY `tuoteid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE users (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    session VARCHAR(255) NOT NULL
);
