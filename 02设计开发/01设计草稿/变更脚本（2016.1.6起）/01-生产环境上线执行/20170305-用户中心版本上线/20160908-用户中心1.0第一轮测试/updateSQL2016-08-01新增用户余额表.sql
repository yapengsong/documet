/*
Navicat MySQL Data Transfer

Source Server         : 研发192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-08-01 17:11:11
Reason: 新增交易记录表
Author: 曹翔宇
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `money_account`
-- ----------------------------
DROP TABLE IF EXISTS `money_account`;
CREATE TABLE `money_account` (
  `mon_id` varchar(32) NOT NULL,
  `mon_money` decimal(16,3) DEFAULT NULL,
  `mon_cusid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  KEY `idx_moncusid` (`mon_cusid`)
) ENGINE=InnoDB;

