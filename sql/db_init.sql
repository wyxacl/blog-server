-- WORDPRESS datebase description
-- https://codex.wordpress.org/Database_Description
-- https://core.trac.wordpress.org/browser/tags/5.3/src/wp-admin/includes/schema.php#L0

/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.7.241
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : 192.168.7.241:3306
 Source Schema         : wp

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 27/12/2019 17:06:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wp_commentmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `comment_id`(`comment_id`) USING BTREE,
  INDEX `meta_key`(`meta_key`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_comments
-- ----------------------------
DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments`  (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment_date` datetime(0) NOT NULL,
  `comment_date_gmt` datetime(0) NOT NULL,
  `comment_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`comment_ID`) USING BTREE,
  INDEX `comment_post_ID`(`comment_post_ID`) USING BTREE,
  INDEX `comment_approved_date_gmt`(`comment_approved`, `comment_date_gmt`) USING BTREE,
  INDEX `comment_date_gmt`(`comment_date_gmt`) USING BTREE,
  INDEX `comment_parent`(`comment_parent`) USING BTREE,
  INDEX `comment_author_email`(`comment_author_email`(10)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_links
-- ----------------------------
DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links`  (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime(0) NOT NULL,
  `link_rel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`link_id`) USING BTREE,
  INDEX `link_visible`(`link_visible`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_blog_versions
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_blog_versions`;
CREATE TABLE `wp_multi_blog_versions`  (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `db_version` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_updated` datetime(0) NOT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`blog_id`) USING BTREE,
  INDEX `lang_id`(`db_version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_blogmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_blogmeta`;
CREATE TABLE `wp_multi_blogmeta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `meta_key`(`meta_key`(191)) USING BTREE,
  INDEX `blog_id`(`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_blogs
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_blogs`;
CREATE TABLE `wp_multi_blogs`  (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT 0,
  `domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `registered` datetime(0) NOT NULL,
  `last_updated` datetime(0) NOT NULL,
  `public` tinyint(2) NOT NULL DEFAULT 1,
  `archived` tinyint(2) NOT NULL DEFAULT 0,
  `mature` tinyint(2) NOT NULL DEFAULT 0,
  `spam` tinyint(2) NOT NULL DEFAULT 0,
  `deleted` tinyint(2) NOT NULL DEFAULT 0,
  `lang_id` int(11) NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`blog_id`) USING BTREE,
  INDEX `domain`(`domain`(50), `path`(5)) USING BTREE,
  INDEX `lang_id`(`lang_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_registration_log
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_registration_log`;
CREATE TABLE `wp_multi_registration_log`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `IP` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `blog_id` bigint(20) NOT NULL DEFAULT 0,
  `date_registered` datetime(0) NOT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `IP`(`IP`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_signups
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_signups`;
CREATE TABLE `wp_multi_signups`  (
  `signup_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `registered` datetime(0) NOT NULL,
  `activated` datetime(0) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `activation_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `meta` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`signup_id`) USING BTREE,
  INDEX `activation_key`(`activation_key`) USING BTREE,
  INDEX `user_email`(`user_email`) USING BTREE,
  INDEX `user_login_email`(`user_login`, `user_email`) USING BTREE,
  INDEX `domain_path`(`domain`(140), `path`(51)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_site
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_site`;
CREATE TABLE `wp_multi_site`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `domain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `domain`(`domain`(140), `path`(51)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_multi_sitemeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_multi_sitemeta`;
CREATE TABLE `wp_multi_sitemeta`  (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_id` bigint(20) NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `meta_key`(`meta_key`(191)) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_options
-- ----------------------------
DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options`  (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`option_id`) USING BTREE,
  UNIQUE INDEX `option_name`(`option_name`) USING BTREE,
  INDEX `autoload`(`autoload`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `post_id`(`post_id`) USING BTREE,
  INDEX `meta_key`(`meta_key`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_posts
-- ----------------------------
DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts`  (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime(0) NOT NULL,
  `post_date_gmt` datetime(0) NOT NULL,
  `post_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pinged` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_modified` datetime(0) NOT NULL,
  `post_modified_gmt` datetime(0) NOT NULL,
  `post_content_filtered` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `post_name`(`post_name`(191)) USING BTREE,
  INDEX `type_status_date`(`post_type`, `post_status`, `post_date`, `ID`) USING BTREE,
  INDEX `post_parent`(`post_parent`) USING BTREE,
  INDEX `post_author`(`post_author`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_share_usermeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_share_usermeta`;
CREATE TABLE `wp_share_usermeta`  (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`umeta_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `meta_key`(`meta_key`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_share_users
-- ----------------------------
DROP TABLE IF EXISTS `wp_share_users`;
CREATE TABLE `wp_share_users`  (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_registered` datetime(0) NOT NULL,
  `user_activation_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `spam` tinyint(2) NOT NULL DEFAULT 0,
  `deleted` tinyint(2) NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `user_login_key`(`user_login`) USING BTREE,
  INDEX `user_nicename`(`user_nicename`) USING BTREE,
  INDEX `user_email`(`user_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships`  (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`object_id`, `term_taxonomy_id`) USING BTREE,
  INDEX `term_taxonomy_id`(`term_taxonomy_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy`  (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`term_taxonomy_id`) USING BTREE,
  UNIQUE INDEX `term_id_taxonomy`(`term_id`, `taxonomy`) USING BTREE,
  INDEX `taxonomy`(`taxonomy`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_termmeta
-- ----------------------------
DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `term_id`(`term_id`) USING BTREE,
  INDEX `meta_key`(`meta_key`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wp_terms
-- ----------------------------
DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms`  (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`term_id`) USING BTREE,
  INDEX `slug`(`slug`(191)) USING BTREE,
  INDEX `name`(`name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
