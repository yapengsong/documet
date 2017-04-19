/*
Navicat MySQL Data Transfer

Source Server         : 研发新库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-03-23 17:08:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloud_volumetype
-- ----------------------------
DROP TABLE IF EXISTS `cloud_volumetype`;
CREATE TABLE `cloud_volumetype` (
  `id` varchar(100) NOT NULL,
  `type_id` varchar(100) DEFAULT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `volume_type` char(1) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `max_size` decimal(20,0) DEFAULT NULL,
  `max_iops` decimal(20,0) DEFAULT NULL,
  `max_throughput` decimal(20,0) DEFAULT NULL,
  `qos_id` varchar(100) DEFAULT NULL,
  `is_use` char(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dc_id` (`dc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
