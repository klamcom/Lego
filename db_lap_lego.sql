-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Jul 2023 um 19:52
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_lap_lego`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bauteil`
--

CREATE TABLE `tbl_bauteil` (
  `IDBauteil` int(10) UNSIGNED NOT NULL,
  `FIDArt` int(10) UNSIGNED NOT NULL,
  `FIDTeilung` int(10) UNSIGNED NOT NULL,
  `FIDFarbe` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_bauteil`
--

INSERT INTO `tbl_bauteil` (`IDBauteil`, `FIDArt`, `FIDTeilung`, `FIDFarbe`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bauteil_art`
--

CREATE TABLE `tbl_bauteil_art` (
  `IDBauteil_art` int(10) UNSIGNED NOT NULL,
  `Art` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_bauteil_art`
--

INSERT INTO `tbl_bauteil_art` (`IDBauteil_art`, `Art`) VALUES
(1, 'Plättchen'),
(2, 'Steine');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bauteil_farbe`
--

CREATE TABLE `tbl_bauteil_farbe` (
  `IDBauteil_farbe` int(10) UNSIGNED NOT NULL,
  `Farbe` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_bauteil_farbe`
--

INSERT INTO `tbl_bauteil_farbe` (`IDBauteil_farbe`, `Farbe`) VALUES
(1, 'grau'),
(2, 'blau'),
(3, 'rot');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_bauteil_teilung`
--

CREATE TABLE `tbl_bauteil_teilung` (
  `IDBauteil_teilung` int(10) UNSIGNED NOT NULL,
  `Teilung` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_bauteil_teilung`
--

INSERT INTO `tbl_bauteil_teilung` (`IDBauteil_teilung`, `Teilung`) VALUES
(1, '2x3'),
(2, '1x4'),
(3, '2x2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_modell`
--

CREATE TABLE `tbl_modell` (
  `IDModell` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(64) NOT NULL,
  `Seriennummer` varchar(20) DEFAULT NULL,
  `Beschreibung` varchar(128) DEFAULT NULL,
  `Markteinführung` varchar(4) DEFAULT NULL,
  `FIDUserAddedBy` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_modell`
--

INSERT INTO `tbl_modell` (`IDModell`, `Bezeichnung`, `Seriennummer`, `Beschreibung`, `Markteinführung`, `FIDUserAddedBy`) VALUES
(1, 'Modell 23', '12345678901234567890', 'testbeschreibung', '2004', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_modell_bauteilliste`
--

CREATE TABLE `tbl_modell_bauteilliste` (
  `IDModell_bauteilliste` int(10) UNSIGNED NOT NULL,
  `FIDModell` int(10) UNSIGNED NOT NULL,
  `FIDBauteil` int(10) UNSIGNED NOT NULL,
  `Anzahl` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_modell_bauteilliste`
--

INSERT INTO `tbl_modell_bauteilliste` (`IDModell_bauteilliste`, `FIDModell`, `FIDBauteil`, `Anzahl`) VALUES
(1, 1, 1, 15),
(2, 1, 2, 37),
(3, 1, 3, 27);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `IDUser` int(10) UNSIGNED NOT NULL,
  `Vorname` varchar(32) NOT NULL,
  `Nachname` varchar(64) NOT NULL,
  `GebDatum` date DEFAULT NULL,
  `Email` varchar(64) NOT NULL,
  `Passwort` varchar(255) NOT NULL,
  `Profilbild` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_user`
--

INSERT INTO `tbl_user` (`IDUser`, `Vorname`, `Nachname`, `GebDatum`, `Email`, `Passwort`, `Profilbild`) VALUES
(1, 'Markus', 'Klausriegler', '1979-06-22', 'markus@klausriegler.org', 'test123', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user_bauteil`
--

CREATE TABLE `tbl_user_bauteil` (
  `IDUser_bauteil` int(10) UNSIGNED NOT NULL,
  `FIDUser` int(10) UNSIGNED NOT NULL,
  `FIDBauteil` int(10) UNSIGNED NOT NULL,
  `Anzahl` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tbl_user_bauteil`
--

INSERT INTO `tbl_user_bauteil` (`IDUser_bauteil`, `FIDUser`, `FIDBauteil`, `Anzahl`) VALUES
(1, 1, 2, 10);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_bauteil`
--
ALTER TABLE `tbl_bauteil`
  ADD PRIMARY KEY (`IDBauteil`),
  ADD KEY `FIDArt` (`FIDArt`),
  ADD KEY `FIDTeilung` (`FIDTeilung`),
  ADD KEY `FIDFarbe` (`FIDFarbe`);

--
-- Indizes für die Tabelle `tbl_bauteil_art`
--
ALTER TABLE `tbl_bauteil_art`
  ADD PRIMARY KEY (`IDBauteil_art`);

--
-- Indizes für die Tabelle `tbl_bauteil_farbe`
--
ALTER TABLE `tbl_bauteil_farbe`
  ADD PRIMARY KEY (`IDBauteil_farbe`);

--
-- Indizes für die Tabelle `tbl_bauteil_teilung`
--
ALTER TABLE `tbl_bauteil_teilung`
  ADD PRIMARY KEY (`IDBauteil_teilung`);

--
-- Indizes für die Tabelle `tbl_modell`
--
ALTER TABLE `tbl_modell`
  ADD PRIMARY KEY (`IDModell`),
  ADD KEY `FIDUserAddedBy` (`FIDUserAddedBy`);

--
-- Indizes für die Tabelle `tbl_modell_bauteilliste`
--
ALTER TABLE `tbl_modell_bauteilliste`
  ADD PRIMARY KEY (`IDModell_bauteilliste`),
  ADD KEY `FIDModell` (`FIDModell`),
  ADD KEY `FIDBauteil` (`FIDBauteil`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`IDUser`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indizes für die Tabelle `tbl_user_bauteil`
--
ALTER TABLE `tbl_user_bauteil`
  ADD PRIMARY KEY (`IDUser_bauteil`),
  ADD KEY `FIDUser` (`FIDUser`),
  ADD KEY `FIDBauteil` (`FIDBauteil`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_bauteil`
--
ALTER TABLE `tbl_bauteil`
  MODIFY `IDBauteil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tbl_bauteil_art`
--
ALTER TABLE `tbl_bauteil_art`
  MODIFY `IDBauteil_art` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tbl_bauteil_farbe`
--
ALTER TABLE `tbl_bauteil_farbe`
  MODIFY `IDBauteil_farbe` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tbl_bauteil_teilung`
--
ALTER TABLE `tbl_bauteil_teilung`
  MODIFY `IDBauteil_teilung` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tbl_modell`
--
ALTER TABLE `tbl_modell`
  MODIFY `IDModell` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `tbl_modell_bauteilliste`
--
ALTER TABLE `tbl_modell_bauteilliste`
  MODIFY `IDModell_bauteilliste` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `IDUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `tbl_user_bauteil`
--
ALTER TABLE `tbl_user_bauteil`
  MODIFY `IDUser_bauteil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_bauteil`
--
ALTER TABLE `tbl_bauteil`
  ADD CONSTRAINT `tbl_bauteil_ibfk_1` FOREIGN KEY (`FIDArt`) REFERENCES `tbl_bauteil_art` (`IDBauteil_art`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bauteil_ibfk_2` FOREIGN KEY (`FIDTeilung`) REFERENCES `tbl_bauteil_teilung` (`IDBauteil_teilung`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_bauteil_ibfk_3` FOREIGN KEY (`FIDFarbe`) REFERENCES `tbl_bauteil_farbe` (`IDBauteil_farbe`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_modell`
--
ALTER TABLE `tbl_modell`
  ADD CONSTRAINT `tbl_modell_ibfk_1` FOREIGN KEY (`FIDUserAddedBy`) REFERENCES `tbl_user` (`IDUser`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_modell_bauteilliste`
--
ALTER TABLE `tbl_modell_bauteilliste`
  ADD CONSTRAINT `tbl_modell_bauteilliste_ibfk_1` FOREIGN KEY (`FIDModell`) REFERENCES `tbl_modell` (`IDModell`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_modell_bauteilliste_ibfk_2` FOREIGN KEY (`FIDBauteil`) REFERENCES `tbl_bauteil` (`IDBauteil`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_user_bauteil`
--
ALTER TABLE `tbl_user_bauteil`
  ADD CONSTRAINT `tbl_user_bauteil_ibfk_1` FOREIGN KEY (`FIDUser`) REFERENCES `tbl_user` (`IDUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_user_bauteil_ibfk_2` FOREIGN KEY (`FIDBauteil`) REFERENCES `tbl_bauteil` (`IDBauteil`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
