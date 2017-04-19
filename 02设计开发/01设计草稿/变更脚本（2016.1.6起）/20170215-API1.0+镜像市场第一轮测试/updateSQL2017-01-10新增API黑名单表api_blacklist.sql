/*
Navicat MySQL Data Transfer

Source Server         : 开发数据库192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-10 15:10:12
*/



-- ----------------------------
-- Table structure for api_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `api_blacklist`;
CREATE TABLE `api_blacklist` (
  `api_id` varchar(32) NOT NULL,
  `api_type` varchar(32) DEFAULT NULL,
  `api_value` varchar(32) DEFAULT NULL,
  `memo` varchar(2000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`api_id`),
  UNIQUE KEY `idx_apiblacklist_apiid` (`api_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
