/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-03-17 10:39:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `unit_web_datacenter`
-- ----------------------------
DROP TABLE IF EXISTS `unit_web_datacenter`;
CREATE TABLE `unit_web_datacenter` (
  `id` varchar(32) NOT NULL,
  `web_id` varchar(32) NOT NULL,
  `dc_id` varchar(32) NOT NULL,
  `webservice` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit_web_datacenter
-- ----------------------------

