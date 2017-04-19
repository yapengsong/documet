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
-- Table structure for `money_record`
-- ----------------------------
DROP TABLE IF EXISTS `money_record`;
CREATE TABLE `money_record` (
  `mon_id` varchar(32) NOT NULL,
  `serial_number` varchar(20) DEFAULT NULL,
  `mon_time` datetime DEFAULT NULL,
  `income_type` char(1) DEFAULT NULL,
  `mon_ecscremark` varchar(200) DEFAULT NULL,
  `mon_ecmcremark` varchar(200) DEFAULT NULL,
  `mon_money` decimal(16,3) DEFAULT NULL,
  `account_balance` decimal(16,3) DEFAULT NULL,
  `mon_contract` varchar(50) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `pay_state` char(1) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `mon_start` datetime DEFAULT NULL,
  `mon_end` datetime DEFAULT NULL,
  `order_no` varchar(20) DEFAULT NULL,
  `resource_id` varchar(100) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `resource_name` varchar(100) DEFAULT NULL,
  `mon_paymonth` varchar(10) DEFAULT NULL,
  `mon_realpay` decimal(16,3) DEFAULT NULL,
  `mon_configure` text,
  `oper_type` char(1) DEFAULT NULL,
  `resource_type` char(1) DEFAULT NULL,
  `dc_id` varchar(32) DEFAULT NULL,
  `is_success` char(1) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  KEY `idx_moncusid` (`cus_id`) USING BTREE,
  KEY `idx_montime` (`mon_time`) USING BTREE
) ENGINE=InnoDB;

