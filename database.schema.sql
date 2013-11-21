SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `koffan8_simpleupload` DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;
USE `koffan8_simpleupload`;

DROP TABLE IF EXISTS `folders`;
CREATE TABLE IF NOT EXISTS `folders` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `description` text COLLATE utf8_swedish_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL COMMENT 'user-id of creator',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `uploaded_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `user_set_name` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `uploaded_date` datetime NOT NULL,
  `last_edited` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `images_to_folder`;
CREATE TABLE IF NOT EXISTS `images_to_folder` (
  `i2fid` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  PRIMARY KEY (`i2fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username_2` (`username`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=3 ;

DROP TABLE IF EXISTS `users_to_folders`;
CREATE TABLE IF NOT EXISTS `users_to_folders` (
  `u2fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `owner` int(11) NOT NULL COMMENT 'user id of owner',
  PRIMARY KEY (`u2fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `users_to_images`;
CREATE TABLE IF NOT EXISTS `users_to_images` (
  `u2iid` int(11) NOT NULL AUTO_INCREMENT,
  `iid` int(11) NOT NULL,
  `owner` int(11) NOT NULL COMMENT 'User id of owner of img',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`u2iid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;