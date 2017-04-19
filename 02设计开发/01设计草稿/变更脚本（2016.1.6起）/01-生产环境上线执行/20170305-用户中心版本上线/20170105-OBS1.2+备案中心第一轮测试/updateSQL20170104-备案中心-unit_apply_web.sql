/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-03 15:54:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `unit_apply_web`
-- ----------------------------
DROP TABLE IF EXISTS `unit_apply_web`;
CREATE TABLE `unit_apply_web` (
  `apply_id` varchar(32) NOT NULL COMMENT 'ID',
  `web_id` varchar(32) NOT NULL COMMENT 'webID',
  `old_webId` varchar(32) DEFAULT NULL COMMENT '变更备案时记录旧的网站ID',
  PRIMARY KEY (`apply_id`,`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit_apply_web
-- ----------------------------
