/*
Navicat MySQL Data Transfer

Source Server         : 研发新库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-09-08 10:10:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloudorder_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `cloudorder_snapshot`;
CREATE TABLE `cloudorder_snapshot` (
  `ordersnap_id` varchar(100) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `vol_id` varchar(100) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `snap_size` decimal(20,0) DEFAULT NULL,
  `snap_name` varchar(100) DEFAULT NULL,
  `snap_description` varchar(1000) DEFAULT NULL,
  `snap_type` char(1) DEFAULT NULL,
  `order_resources` varchar(2000) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_orderdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ordersnap_id`)
) ENGINE=InnoDB;
