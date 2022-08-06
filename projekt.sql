-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Sty 2022, 13:13
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kasy`
--

CREATE TABLE `kasy` (
  `id` int(2) NOT NULL,
  `data_fisk` date NOT NULL,
  `kontrahent` int(2) DEFAULT NULL,
  `nr_unikatowy` varchar(12) NOT NULL,
  `model` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kasy`
--

INSERT INTO `kasy` (`id`, `data_fisk`, `kontrahent`, `nr_unikatowy`, `model`) VALUES
(1, '2021-10-19', 1, 'AEC 15343534', 'Mini'),
(2, '2021-09-17', 2, 'AED 73453524', 'Mini E'),
(3, '2021-11-09', 3, 'AEB 74937402', 'Mini LT Online'),
(4, '2021-08-18', 4, 'AED 82649106', 'K10'),
(5, '2021-04-13', 5, 'AEC 63824857', 'Mini Online'),
(6, '2021-09-03', 6, 'BCE 92749527', 'Mera'),
(7, '2021-04-05', 7, 'BDA 85937589', 'Jota E'),
(8, '2021-12-08', 8, 'ABE 84796724', 'Zeta Online'),
(9, '2021-02-16', 9, 'BAC 83869205', 'Mera Online'),
(10, '2021-09-29', 10, 'CEB 81067361', 'K10 Online');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(2) NOT NULL,
  `nip` varchar(13) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `adres` varchar(15) NOT NULL,
  `miejscowosc` varchar(25) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id`, `nip`, `nazwa`, `adres`, `miejscowosc`, `telefon`, `email`) VALUES
(1, '845-326-64-25', 'Marcin Piotrowski', 'Zakopianska 15', 'Kraków', '756274366', 'piotro131@onet.pl'),
(2, '763-174-89-47', 'Ewelina Kowal', 'Lwowska 7', 'Wadowice', '567857856', 'kowal5233@wp.pl'),
(3, '125-523-41-63', 'Piotr Ostrowski', 'Kolejowa 20', 'Skawina', '782834646', 'ostrow6421@gmail.com'),
(4, '642-515-75-35', 'Gabriela Porzeczka', 'Floriańska 22', 'Andrychów', '489248725', 'porze754@o2.pl'),
(5, '593-248-42-36', 'Wiktor Olechowski', 'Piastowska 8', 'Zator', '582648560', 'olec234@interia.pl'),
(6, '425-642-15-23', 'Mateusz Wiśniewski', 'Słowackiego 19', 'Myślenice', '639273947', 'wisni213@gmail.com'),
(7, '534-174-32-26', 'Igor Walczak', 'Jagiellońska 27', 'Kalwaria Zebrzydowska', '592758395', 'walcza5234@o2.pl'),
(8, '314-215-21-46', 'Adam Zawadzki', 'Złota 32', 'Kraków', '858275925', 'zawad24@onet.pl'),
(9, '514-632-37-25', 'Urszula Andrzejewska', 'Zielona 8', 'Sucha Beskidzka', '853928548', 'urszuand321@wp.pl'),
(10, '327-324-65-21', 'Maciej Nowak', 'Spadzista 17', 'Wadowice', '829473183', 'nowa412@interia.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przeglady`
--

CREATE TABLE `przeglady` (
  `id` int(2) NOT NULL,
  `data` date NOT NULL,
  `nr_kasy` varchar(12) NOT NULL,
  `klient` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `przeglady`
--

INSERT INTO `przeglady` (`id`, `data`, `nr_kasy`, `klient`) VALUES
(1, '2022-10-19', 'KF001', 1),
(2, '2022-09-17', 'KF002', 2),
(3, '2022-11-09', 'KF003', 3),
(4, '2022-08-18', 'KF004', 4),
(5, '2022-04-13', 'KF005', 5),
(6, '2022-09-03', 'KF006', 6),
(7, '2022-04-05', 'KF007', 7),
(8, '2022-12-08', 'KF008', 8),
(9, '2022-02-16', 'KF009', 9),
(10, '2022-09-29', 'KF010', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `serwisanci`
--

CREATE TABLE `serwisanci` (
  `id` int(2) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `nr_kasy` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `serwisanci`
--

INSERT INTO `serwisanci` (`id`, `imie`, `nazwisko`, `telefon`, `nr_kasy`) VALUES
(1, 'Tomasz', 'Kowalski', '423151357', 'KF001'),
(2, 'Wiktoria', 'Orzechowska', '624624629', 'KF002'),
(3, 'Patrycja', 'Nowak', '785346125', 'KF003'),
(4, 'Piotr', 'Szewczyk', '626546462', 'KF004'),
(5, 'Robert', 'Szymański', '743462565', 'KF005'),
(6, 'Marcin', 'Wiśniewski', '248463561', 'KF006'),
(7, 'Alicja', 'Kowalczyk', '273456738', 'KF007'),
(8, 'Katarzyna', 'Zalewska', '412554535', 'KF008'),
(9, 'Marcin', 'Ostrowski', '436726462', 'KF009'),
(10, 'Kamil', 'Nowakowski', '645624626', 'KF010');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(2) NOT NULL,
  `imie` varchar(15) DEFAULT NULL,
  `nazwisko` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `haslo` varchar(20) DEFAULT NULL,
  `administrator` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `imie`, `nazwisko`, `email`, `login`, `haslo`, `administrator`) VALUES
(1, 'Grzegorz', 'Kowalski', 'grze326@interia.pl', 'grzegorzk', 'gjd83kf9', 0),
(2, 'Alicja', 'Kwiatkowska', 'alikwi613@wp.pl', 'kwiatk135', 'gj48fj39d', 0),
(3, 'Robert', 'Nowak', 'nowro533@onet.pl', 'nowak12351', 'f34h893', 1),
(4, 'Gabriela', 'Piotrkowska', 'piotra32@gmail.com', 'gabipiotr1314', '3c525vb5', 0),
(5, 'Ewelina', 'Korzeniowska', 'korze533@wp.pl', 'korz515', 'gv34mi9', 0),
(6, 'Damian', 'Zieliński', 'ziela254@gmail.com', 'zieldam2341', '54ybwwb46', 0),
(7, 'Karolina', 'Pocztowska', 'karpocz131@interia.pl', 'poczt4144', '523b5v35', 0),
(8, 'Kamil', 'Michalski', 'michal43@o2.pl', 'michkam413', 'gbj903ge54y', 0),
(9, 'Justyna', 'Jaworska', 'jawor32@onet.pl', 'justynaj21', 'f344v6364', 0),
(10, 'Emil', 'Malinowski', 'malina52@gmail.com', 'emilmal51', 'v535b533', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kasy`
--
ALTER TABLE `kasy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kontrahent` (`kontrahent`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `przeglady`
--
ALTER TABLE `przeglady`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klient` (`klient`);

--
-- Indeksy dla tabeli `serwisanci`
--
ALTER TABLE `serwisanci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kasy`
--
ALTER TABLE `kasy`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `przeglady`
--
ALTER TABLE `przeglady`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `serwisanci`
--
ALTER TABLE `serwisanci`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `kasy`
--
ALTER TABLE `kasy`
  ADD CONSTRAINT `kasy_ibfk_1` FOREIGN KEY (`kontrahent`) REFERENCES `klienci` (`id`);

--
-- Ograniczenia dla tabeli `przeglady`
--
ALTER TABLE `przeglady`
  ADD CONSTRAINT `przeglady_ibfk_1` FOREIGN KEY (`klient`) REFERENCES `klienci` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
