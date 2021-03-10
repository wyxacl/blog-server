-- WORDPRESS database description
-- http://wpdocs.osdn.jp/%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E6%A7%8B%E9%80%A0
-- https://codex.wordpress.org/Database_Description
-- https://core.trac.wordpress.org/browser/tags/5.3/src/wp-admin/includes/schema.php#L0

-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: wp
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_blog_versions`
--

DROP TABLE IF EXISTS `wp_blog_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_blog_versions` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `db_version` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`blog_id`) USING BTREE,
  KEY `lang_id` (`db_version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='The current database version status of each site is maintained in the wp_blogs_versions table and is updated as each site is upgraded.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_blog_versions`
--

LOCK TABLES `wp_blog_versions` WRITE;
/*!40000 ALTER TABLE `wp_blog_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_blog_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_blogmeta`
--

DROP TABLE IF EXISTS `wp_blogmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_blogmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`meta_id`) USING BTREE,
  KEY `meta_key` (`meta_key`(191)) USING BTREE,
  KEY `blog_id` (`blog_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_blogmeta`
--

LOCK TABLES `wp_blogmeta` WRITE;
/*!40000 ALTER TABLE `wp_blogmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_blogmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_blogs`
--

DROP TABLE IF EXISTS `wp_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_blogs` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `public` tinyint(2) NOT NULL DEFAULT '1',
  `archived` tinyint(2) NOT NULL DEFAULT '0',
  `mature` tinyint(2) NOT NULL DEFAULT '0',
  `spam` tinyint(2) NOT NULL DEFAULT '0',
  `deleted` tinyint(2) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`blog_id`) USING BTREE,
  KEY `domain` (`domain`(50),`path`(5)) USING BTREE,
  KEY `lang_id` (`lang_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_blogs`
--

LOCK TABLES `wp_blogs` WRITE;
/*!40000 ALTER TABLE `wp_blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_registration_log`
--

DROP TABLE IF EXISTS `wp_registration_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_registration_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `IP` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `blog_id` bigint(20) NOT NULL DEFAULT '0',
  `date_registered` datetime NOT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IP` (`IP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_registration_log`
--

LOCK TABLES `wp_registration_log` WRITE;
/*!40000 ALTER TABLE `wp_registration_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_registration_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_signups`
--

DROP TABLE IF EXISTS `wp_signups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_signups` (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL,
  `activated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `meta` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`signup_id`) USING BTREE,
  KEY `activation_key` (`activation_key`) USING BTREE,
  KEY `user_email` (`user_email`) USING BTREE,
  KEY `user_login_email` (`user_login`,`user_email`) USING BTREE,
  KEY `domain_path` (`domain`(140),`path`(51)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_signups`
--

LOCK TABLES `wp_signups` WRITE;
/*!40000 ALTER TABLE `wp_signups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_signups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_site`
--

DROP TABLE IF EXISTS `wp_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `domain` (`domain`(140),`path`(51)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_site`
--

LOCK TABLES `wp_site` WRITE;
/*!40000 ALTER TABLE `wp_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_sitemeta`
--

DROP TABLE IF EXISTS `wp_sitemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_sitemeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`meta_id`) USING BTREE,
  KEY `meta_key` (`meta_key`(191)) USING BTREE,
  KEY `site_id` (`site_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_sitemeta`
--

LOCK TABLES `wp_sitemeta` WRITE;
/*!40000 ALTER TABLE `wp_sitemeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_sitemeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wp'
--

--
-- Dumping routines for database 'wp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-30 15:28:14