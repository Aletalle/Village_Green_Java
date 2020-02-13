-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour makingticket
CREATE DATABASE IF NOT EXISTS `makingticket` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `makingticket`;

-- Listage de la structure de la table makingticket. description
CREATE TABLE IF NOT EXISTS `description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.description : ~0 rows (environ)
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
/*!40000 ALTER TABLE `description` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. event
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_event` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description_event` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description_event` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_provider_event` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_price_event` decimal(6,2) NOT NULL,
  `start_date_event` date NOT NULL,
  `end_date_event` date NOT NULL,
  `festival_place_event` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.event : ~1 rows (environ)
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`id`, `name_event`, `short_description_event`, `long_description_event`, `ref_provider_event`, `purchase_price_event`, `start_date_event`, `end_date_event`, `festival_place_event`) VALUES
	(1, 'Burning Man', 'Festival', 'Festival ou l\'on brule un homme de bois', '67765', 78.00, '2019-12-04', '2019-12-06', 234),
	(2, 'Lollapaloza', 'Festival electro', 'Festival cool, rigolo et pas chère', '78988', 80.00, '2014-01-01', '2014-01-04', 12),
	(3, 'Les vieilles charue', 'festival', 'Festival super cool!', '67890', 24.00, '2014-08-04', '2014-09-29', 123);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. fiche_artiste
CREATE TABLE IF NOT EXISTS `fiche_artiste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_artiste` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_artiste` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.fiche_artiste : ~0 rows (environ)
/*!40000 ALTER TABLE `fiche_artiste` DISABLE KEYS */;
INSERT INTO `fiche_artiste` (`id`, `name_artiste`, `description_artiste`) VALUES
	(1, 'Rihanna', 'artiste international'),
	(2, 'Drake', 'Artiste Américain');
/*!40000 ALTER TABLE `fiche_artiste` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. migration_versions
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.migration_versions : ~10 rows (environ)
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
	('20191129112512', '2019-11-29 11:25:40'),
	('20191129112931', '2019-11-29 11:29:41'),
	('20191129113218', '2019-11-29 11:32:26'),
	('20191209122436', '2019-12-09 12:25:59'),
	('20191209122957', '2019-12-09 12:30:57'),
	('20191209123003', '2019-12-09 12:37:36'),
	('20191209123606', '2019-12-09 12:38:36'),
	('20191209123707', '2019-12-09 12:40:09'),
	('20191213091346', '2019-12-13 09:15:34'),
	('20191213092119', '2019-12-13 09:22:21');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. place
CREATE TABLE IF NOT EXISTS `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `artist` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remaining_quantity` int(11) NOT NULL,
  `availibility` date NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.place : ~0 rows (environ)
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. role
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.role : ~0 rows (environ)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. type_event
CREATE TABLE IF NOT EXISTS `type_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_type_event` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.type_event : ~0 rows (environ)
/*!40000 ALTER TABLE `type_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_event` ENABLE KEYS */;

-- Listage de la structure de la table makingticket. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_users` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname_users` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number_users` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_users` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table makingticket.users : ~2 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name_users`, `firstname_users`, `phone_number_users`, `mail`, `password_users`, `role`) VALUES
	(2, 'lebon', 'typhanie', '108203034', 'lebontyphanie59224@hotmail.fr', '$2y$12$.WOBlStICwUMw780581KYu5yO6wxkYQ5L2RhClnRU10NRWCaqz.XG', 4),
	(7, 'Lebon', 'florence', '0634606033', 'carlierflorence@hotmail.fr', 'demo', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
