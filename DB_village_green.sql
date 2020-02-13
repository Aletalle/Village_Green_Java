-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 13 fév. 2020 à 14:49
-- Version du serveur :  5.7.26-log
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `village_green`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_cli` int(11) NOT NULL,
  `nom_cli` varchar(50) NOT NULL,
  `prenom_cli` varchar(50) NOT NULL,
  `ville_cli` varchar(100) NOT NULL,
  `mail_cli` varchar(50) NOT NULL,
  `phone_cli` varchar(10) NOT NULL,
  `adresse_cli` varchar(150) NOT NULL,
  `login_cli` varchar(100) DEFAULT NULL,
  `mdp_cli` varchar(100) NOT NULL,
  `inscription_cli` varchar(100) NOT NULL,
  `connexion_cli` varchar(100) NOT NULL,
  `zip_cli` int(11) NOT NULL,
  `id_com` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id_cli`),
  KEY `id_com` (`id_com`),
  KEY `id_role` (`id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_cmd` int(11) NOT NULL,
  `date_cmd` date DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `detail_id` int(11) NOT NULL,
  PRIMARY KEY (`id_cmd`),
  KEY `detail_id` (`detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

DROP TABLE IF EXISTS `commercial`;
CREATE TABLE IF NOT EXISTS `commercial` (
  `id_com` int(11) NOT NULL,
  `nom_com` varchar(50) NOT NULL,
  `login_com` varchar(100) NOT NULL,
  `mdp_com` varchar(100) NOT NULL,
  `mail_com` varchar(100) NOT NULL,
  `statut_com` varchar(50) NOT NULL,
  PRIMARY KEY (`id_com`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detail`
--

DROP TABLE IF EXISTS `detail`;
CREATE TABLE IF NOT EXISTS `detail` (
  `detail_id` int(11) NOT NULL,
  `detail_qte` int(11) DEFAULT NULL,
  `detail_total` int(11) DEFAULT NULL,
  `pro_id` int(11) NOT NULL,
  `id_cli` int(11) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `pro_id` (`pro_id`),
  KEY `id_cli` (`id_cli`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fourni`
--

DROP TABLE IF EXISTS `fourni`;
CREATE TABLE IF NOT EXISTS `fourni` (
  `pro_id` int(11) NOT NULL,
  `id_fou` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`,`id_fou`),
  KEY `id_fou` (`id_fou`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fou` int(11) NOT NULL,
  `adresse_fou` varchar(255) NOT NULL,
  `name_fou` varchar(100) NOT NULL,
  `phone_fou` varchar(10) NOT NULL,
  PRIMARY KEY (`id_fou`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_ref` varchar(50) DEFAULT NULL,
  `pro_libelle` varchar(50) DEFAULT NULL,
  `pro_description` varchar(255) NOT NULL,
  `pro_achat` int(11) DEFAULT NULL,
  `pro_vente` int(11) NOT NULL,
  `pro_stock` int(11) DEFAULT NULL,
  `pro_couleur` varchar(50) DEFAULT NULL,
  `pro_photo` varchar(50) DEFAULT NULL,
  `pro_d_ajout` date DEFAULT NULL,
  `pro_d_modif` date DEFAULT NULL,
  `pro_bloque` varchar(50) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `pro_ref` (`pro_ref`),
  UNIQUE KEY `pro_libelle` (`pro_libelle`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`pro_id`, `pro_ref`, `pro_libelle`, `pro_description`, `pro_achat`, `pro_vente`, `pro_stock`, `pro_couleur`, `pro_photo`, `pro_d_ajout`, `pro_d_modif`, `pro_bloque`, `cat_id`) VALUES
(13, 'jlmkù', 'jvghkbl', 'v', 85, 74, 74, NULL, NULL, NULL, NULL, NULL, 0),
(17, 'bjjb', 'hjkl', ' bcn vb', 45, 45, 45, NULL, NULL, NULL, NULL, NULL, 0),
(14, 'azeaze', 'ezerzer', 'v', 85, 74, 74, NULL, NULL, NULL, NULL, NULL, 0),
(15, 'zrzer', 'zerzer', 'zerze', 12312, 2435, 4534, NULL, NULL, NULL, NULL, NULL, 0),
(16, 'jlmkùqsdqsd', 'jvghkblqsdqsd', 'vqsdqsdqsd', 85, 74, 74, NULL, NULL, NULL, NULL, NULL, 0),
(18, 'sdfsdf', 'sdfsdf', 'sdfsdf', 41541541, 245324, 452452, NULL, NULL, NULL, NULL, NULL, 0),
(20, 'zrzerkhljmk', 'zerzerkjlml', 'zerzejklmù', 12312, 2435, 4534, NULL, NULL, NULL, NULL, NULL, 0),
(21, 'zrzeriojp', 'zerzerhiop^$', 'zerzeûoip', 12312, 2435, 4534, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL,
  `nom_role` varchar(50) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
