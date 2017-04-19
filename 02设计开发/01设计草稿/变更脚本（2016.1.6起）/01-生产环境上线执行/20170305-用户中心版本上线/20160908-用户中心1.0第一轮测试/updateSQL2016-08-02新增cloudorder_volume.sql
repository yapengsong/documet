/*
Navicat MySQL Data Transfer

Source Server         : 研发新库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-09-08 10:06:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloudorder_volume
-- ----------------------------
DROP TABLE IF EXISTS `cloudorder_volume`;
CREATE TABLE `cloudorder_volume` (
  `ordervol_id` varchar(100) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `vol_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `disk_from` varchar(50) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `vol_type` char(1) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `buy_cycle` int(10) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `from_snapid` varchar(100) DEFAULT NULL,
  `vol_size` decimal(20,0) DEFAULT NULL,
  `vol_number` decimal(10,0) DEFAULT NULL,
  `vol_name` varchar(100) DEFAULT NULL,
  `vol_description` varchar(1000) DEFAULT NULL,
  `order_resources` varchar(2000) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_orderdate` datetime DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ordervol_id`)
) ENGINE=InnoDB;
