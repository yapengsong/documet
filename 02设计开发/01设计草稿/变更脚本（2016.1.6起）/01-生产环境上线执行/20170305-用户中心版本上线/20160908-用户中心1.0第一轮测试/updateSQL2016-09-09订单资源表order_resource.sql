/*
Navicat MySQL Data Transfer

Source Server         : �����з���
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
  `id` varchar(32) NOT NULL COMMENT 'ID��������',
  `order_no` varchar(18) NOT NULL COMMENT '�������',
  `resource_id` varchar(100) NOT NULL COMMENT '��ԴID',
  `resource_name` varchar(64) NOT NULL COMMENT '��Դ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
