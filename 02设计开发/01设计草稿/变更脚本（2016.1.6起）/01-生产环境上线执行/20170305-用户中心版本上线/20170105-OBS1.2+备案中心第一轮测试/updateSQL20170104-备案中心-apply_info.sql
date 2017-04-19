/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-03 15:53:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `apply_info`
-- ----------------------------
DROP TABLE IF EXISTS `apply_info`;
CREATE TABLE `apply_info` (
  `apply_id` varchar(32) NOT NULL COMMENT 'ID',
  `unit_id` varchar(32) DEFAULT NULL COMMENT '���쵥λID',
  `web_id` varchar(32) DEFAULT NULL COMMENT '��վID',
  `status` char(1) DEFAULT NULL COMMENT '����״̬',
  `record_type` char(1) DEFAULT NULL COMMENT '��������',
  `create_time` datetime DEFAULT NULL,
  `return_type` char(1) DEFAULT NULL COMMENT '�ַܾ���״̬',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_info
-- ----------------------------
