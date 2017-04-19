/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34_3306
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-03-16 14:44:17
*/
-- ----------------------------
-- Table structure for `cloud_rdsinstance`
-- ----------------------------
DROP TABLE IF EXISTS `cloud_rdsinstance`;
CREATE TABLE `cloud_rdsinstance` (
  `rds_id` varchar(100) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_name` varchar(50) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `delete_user` varchar(50) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `charge_state` char(1) DEFAULT NULL,
  `is_visible` char(1) DEFAULT NULL,
  `rds_name` varchar(100) DEFAULT NULL,
  `rds_description` varchar(1000) DEFAULT NULL,
  `rds_status` varchar(50) DEFAULT NULL,
  `is_master` char(1) DEFAULT NULL,
  `master_id` varchar(100) DEFAULT NULL,
  `net_id` varchar(100) DEFAULT NULL,
  `subnet_id` varchar(100) DEFAULT NULL,
  `rds_ip` varchar(150) DEFAULT NULL,
  `port_id` varchar(100) DEFAULT NULL,
  `version_id` varchar(100) DEFAULT NULL,
  `config_id` varchar(100) DEFAULT NULL,
  `flavor_id` varchar(100) DEFAULT NULL,
  `volume_size` decimal(20,0) DEFAULT NULL,
  `volume_type` varchar(100) DEFAULT NULL,
  `is_deleted` char(1) DEFAULT NULL,
  `vm_id` varchar(100) DEFAULT NULL,
  `reserve1` varchar(100) DEFAULT NULL,
  `reserve2` varchar(100) DEFAULT NULL,
  `reserve3` varchar(100) DEFAULT NULL,
  `reserve4` varchar(100) DEFAULT NULL,
  `reserve5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rds_id`),
  KEY `idx_rdsid` (`rds_id`) USING BTREE,
  KEY `idx_prjid` (`prj_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `cloudorder_rdsinstance`
-- ----------------------------
DROP TABLE IF EXISTS `cloudorder_rdsinstance`;
CREATE TABLE `cloudorder_rdsinstance` (
  `orderrds_id` varchar(100) NOT NULL,
  `rds_id` varchar(100) DEFAULT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `create_orderdate` datetime DEFAULT NULL,
  `create_user` varchar(100) DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `net_id` varchar(100) DEFAULT NULL,
  `subnet_id` varchar(100) DEFAULT NULL,
  `version_id` varchar(100) DEFAULT NULL,
  `config_id` varchar(100) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `ram` int(11) DEFAULT NULL,
  `volume_size` int(11) DEFAULT NULL,
  `volume_type` varchar(100) DEFAULT NULL,
  `rds_name` varchar(100) DEFAULT NULL,
  `backup_id` varchar(100) DEFAULT NULL,
  `master_id` varchar(100) DEFAULT NULL,
  `is_master` char(1) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `reserve1` varchar(100) DEFAULT NULL,
  `reserve2` varchar(100) DEFAULT NULL,
  `reserve3` varchar(100) DEFAULT NULL,
  `reserve4` varchar(100) DEFAULT NULL,
  `reserve5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderrds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `cloud_datastoreversion`
-- ----------------------------
DROP TABLE IF EXISTS `cloud_datastoreversion`;
CREATE TABLE `cloud_datastoreversion` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `datastore_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `cloud_datastore`
-- ----------------------------
DROP TABLE IF EXISTS `cloud_datastore`;
CREATE TABLE `cloud_datastore` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dc_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;