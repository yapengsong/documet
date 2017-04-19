/*
Navicat MySQL Data Transfer

Source Server         : 开发数据库192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-07-21 16:56:04
*/



-- ----------------------------
-- Table structure for cus_blockresource
-- ----------------------------
DROP TABLE IF EXISTS `cus_blockresource`;
CREATE TABLE `cus_blockresource` (
  `block_id` varchar(32) NOT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `is_blocked` char(1) DEFAULT NULL,
  `block_opstatus` char(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `block_account` mediumtext,
  `unblock_account` mediumtext,
  `block_cloudresource` mediumtext,
  `unblock_cloudresource` mediumtext,
  `block_obs` mediumtext,
  `unblock_obs` mediumtext,
  PRIMARY KEY (`block_id`),
  KEY `idx_cusblockrescusid` (`cus_id`) USING BTREE
) ENGINE=InnoDB;
