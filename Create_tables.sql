/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : test_runoob

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 09/06/2019 14:16:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_log
-- ----------------------------
DROP TABLE IF EXISTS `access_log`;
CREATE TABLE `access_log` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT '0' COMMENT '网站id',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of access_log
-- ----------------------------
BEGIN;
INSERT INTO `access_log` VALUES (1, 1, 45, '2016-05-10');
INSERT INTO `access_log` VALUES (2, 3, 100, NULL);
INSERT INTO `access_log` VALUES (3, 1, 233, '2016-05-14');
INSERT INTO `access_log` VALUES (4, 2, 10, '2016-05-14');
INSERT INTO `access_log` VALUES (5, 5, NULL, '2016-05-14');
INSERT INTO `access_log` VALUES (6, 4, 13, '2016-05-15');
INSERT INTO `access_log` VALUES (7, NULL, 220, '2016-05-15');
INSERT INTO `access_log` VALUES (8, 5, 545, '2016-05-16');
INSERT INTO `access_log` VALUES (9, 3, 201, '2016-05-17');
INSERT INTO `access_log` VALUES (10, 6, 233, '2016-06-13');
INSERT INTO `access_log` VALUES (11, 6, 23, '2016-06-14');
INSERT INTO `access_log` VALUES (12, 1, 23333, '2016-06-13');
INSERT INTO `access_log` VALUES (13, 3, 23, NULL);
COMMIT;

-- ----------------------------
-- Table structure for apps
-- ----------------------------
DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` char(20) NOT NULL DEFAULT '' COMMENT '站点名称',
  `url` varchar(255) NOT NULL DEFAULT '',
  `country` char(10) NOT NULL DEFAULT '' COMMENT '国家',
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apps
-- ----------------------------
BEGIN;
INSERT INTO `apps` VALUES (1, 'QQ APP', 'http://im.qq.com/', 'CN', 7);
INSERT INTO `apps` VALUES (2, '微博 APP', 'http://weibo.com/', 'CN', 4);
INSERT INTO `apps` VALUES (3, '淘宝 APP', 'https://www.taobao.com/', 'CN', 2);
COMMIT;

-- ----------------------------
-- Table structure for websites
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '站点名称',
  `url` varchar(255) NOT NULL DEFAULT '',
  `alexa` int(11) NOT NULL DEFAULT '0' COMMENT 'Alexa 排名',
  `country` char(10) NOT NULL DEFAULT '' COMMENT '国家',
  `net_value` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of websites
-- ----------------------------
BEGIN;
INSERT INTO `websites` VALUES (1, 'Google', 'https://www.google.cm/', 1, 'USA', 2394.43);
INSERT INTO `websites` VALUES (2, '淘宝', 'https://www.taobao.com/', 13, 'CN', 1685.32);
INSERT INTO `websites` VALUES (3, '菜鸟教程', 'http://www.runoob.com/', 4689, 'IND', 0.84);
INSERT INTO `websites` VALUES (4, '微博', 'http://weibo.com/', 20, 'CN', 30.85);
INSERT INTO `websites` VALUES (5, 'Facebook', 'https://www.facebook.com/', 3, 'USA', 1200);
INSERT INTO `websites` VALUES (7, 'QQ', 'http://www.qq.com', 100000, 'CN', 809.3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
