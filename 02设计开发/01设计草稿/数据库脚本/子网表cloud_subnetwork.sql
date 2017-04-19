/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-10-14 13:47:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloud_subnetwork
-- ----------------------------
DROP TABLE IF EXISTS `cloud_subnetwork`;
CREATE TABLE `cloud_subnetwork` (
  `subnet_id` varchar(100) NOT NULL,
  `subnet_name` varchar(100) DEFAULT NULL,
  `create_name` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `net_id` varchar(100) DEFAULT NULL,
  `route_id` varchar(100) DEFAULT NULL,
  `ip_version` char(1) DEFAULT NULL,
  `cidr` varchar(100) DEFAULT NULL,
  `gateway_ip` varchar(100) DEFAULT NULL,
  `is_shared` char(1) DEFAULT NULL,
  `pooldata` varchar(100) DEFAULT NULL,
  `is_forbiddengw` char(1) DEFAULT NULL,
  `is_default` char(1) DEFAULT NULL COMMENT '是否默认',
  `reserve1` varchar(100) DEFAULT NULL,
  `reserve2` varchar(100) DEFAULT NULL,
  `reserve3` varchar(100) DEFAULT NULL,
  `reserve4` varchar(100) DEFAULT NULL,
  `reserve5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subnet_id`),
  KEY `AK_Identifier_2` (`prj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
