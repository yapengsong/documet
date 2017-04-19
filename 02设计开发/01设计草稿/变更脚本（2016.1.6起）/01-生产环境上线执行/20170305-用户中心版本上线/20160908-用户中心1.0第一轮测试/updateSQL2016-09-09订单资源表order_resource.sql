/*
Navicat MySQL Data Transfer

Source Server         : 北京研发库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-09-09 15:40:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_resource
-- ----------------------------
DROP TABLE IF EXISTS `order_resource`;
CREATE TABLE `order_resource` (
  `id` varchar(32) NOT NULL COMMENT 'ID（主键）',
  `order_no` varchar(18) NOT NULL COMMENT '订单编号',
  `resource_id` varchar(100) NOT NULL COMMENT '资源ID',
  `resource_name` varchar(64) NOT NULL COMMENT '资源名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
