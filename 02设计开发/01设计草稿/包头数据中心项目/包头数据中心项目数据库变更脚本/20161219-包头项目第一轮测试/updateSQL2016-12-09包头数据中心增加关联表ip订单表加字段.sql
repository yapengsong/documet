/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : eayuncloud_baotou

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-09 10:24:42
*/
-- 包头数据中心新增客户项目与外部网络的关联表，同时，公网IP订单表加字段外部网络id
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloud_prj_outnet
-- ----------------------------
DROP TABLE IF EXISTS `cloud_prj_outnet`;
CREATE TABLE `cloud_prj_outnet` (
  `id` varchar(36) NOT NULL,
  `cus_id` varchar(36) DEFAULT NULL,
  `prj_id` varchar(36) DEFAULT NULL,
  `dc_id` varchar(36) DEFAULT NULL,
  `outnet_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE cloudorder_floatip ADD COLUMN outnet_id VARCHAR(36) default NULL;