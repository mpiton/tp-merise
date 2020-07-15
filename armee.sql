-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 13 juil. 2020 à 08:50
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `armee`
--

-- --------------------------------------------------------

--
-- Structure de la table `caserne`
--

DROP TABLE IF EXISTS `caserne`;
CREATE TABLE IF NOT EXISTS `caserne` (
  `caserne_id` int(11) NOT NULL AUTO_INCREMENT,
  `caserne_nom` varchar(50) DEFAULT NULL,
  `caserne_ref` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`caserne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `caserne`
--

INSERT INTO `caserne` (`caserne_id`, `caserne_nom`, `caserne_ref`) VALUES
(1, 'Suippes', '132GCAT'),
(2, 'Calvi', '2RIMA'),
(3, 'Cognin', '3RCA');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`cat_id`, `cat_nom`) VALUES
(1, 'Militaire du rang'),
(2, 'Sous-Officiers'),
(3, 'Officiers');

-- --------------------------------------------------------

--
-- Structure de la table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_nom` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `Grade_categorie_FK` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `grade`
--

INSERT INTO `grade` (`grade_id`, `grade_nom`, `cat_id`) VALUES
(1, 'soldat', 1),
(2, 'caporal', 1),
(3, 'sergent', 2),
(4, 'adjudant', 2),
(5, 'lieutenant', 3),
(6, 'capitaine', 3),
(7, 'commandant', 3),
(8, 'colonel', 3);

-- --------------------------------------------------------

--
-- Structure de la table `militaire`
--

DROP TABLE IF EXISTS `militaire`;
CREATE TABLE IF NOT EXISTS `militaire` (
  `mili_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de la table militaire',
  `mili_prenom` varchar(50) NOT NULL COMMENT 'prénom du militaire',
  `mili_nom` varchar(50) NOT NULL COMMENT 'Nom du militaire',
  `mili_matricule` varchar(50) NOT NULL COMMENT 'Numero matricule du militaire',
  `obgrade_date` date NOT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `caserne_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mili_id`),
  KEY `militaire_Caserne0_FK` (`caserne_id`),
  KEY `militaire_Grade_FK` (`grade_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `militaire`
--

INSERT INTO `militaire` (`mili_id`, `mili_prenom`, `mili_nom`, `mili_matricule`, `obgrade_date`, `grade_id`, `caserne_id`) VALUES
(1, 'John', 'Rambo', '123ABC', '1975-01-01', 2, 1),
(2, 'John', 'Rambo', '123ABC', '1975-02-01', 3, 1),
(3, 'Samuel', 'Trautman', '456DEF', '1972-12-31', 8, 1),
(4, 'Albert', 'King', '444AAA', '1980-01-01', 1, 2),
(5, 'Bob', 'Hopper', '789CLU', '1990-02-02', 6, 3),
(6, 'Carl', 'Lewis', '852FST', '1991-03-03', 1, 1),
(7, 'Dan', 'Brown', '471TER', '1998-04-04', 2, 3),
(8, 'Ethan', 'Hunt', '666XXX', '2010-05-05', 3, 3),
(9, 'Pete', 'Seck', '999ZZZ', '2011-06-06', 7, 2);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `Grade_categorie_FK` FOREIGN KEY (`cat_id`) REFERENCES `categorie` (`cat_id`);

--
-- Contraintes pour la table `militaire`
--
ALTER TABLE `militaire`
  ADD CONSTRAINT `militaire_Caserne0_FK` FOREIGN KEY (`caserne_id`) REFERENCES `caserne` (`caserne_id`),
  ADD CONSTRAINT `militaire_Grade_FK` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`grade_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
