/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-07-29 11:03:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for money_billing_factor
-- ----------------------------
DROP TABLE IF EXISTS `money_billing_factor`;
CREATE TABLE `money_billing_factor` (
  `id` varchar(36) NOT NULL,
  `resources_type` varchar(36) DEFAULT NULL,
  `billing_factor` varchar(36) DEFAULT NULL,
  `factor_unit` varchar(36) DEFAULT NULL,
  `start_num` bigint(20) DEFAULT NULL,
  `end_num` bigint(20) DEFAULT NULL,
  `pay_type` varchar(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `dc_id` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
