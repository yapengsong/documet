/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-03-08 17:22:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `secretkey_vm`
-- ----------------------------
DROP TABLE IF EXISTS `secretkey_vm`;
CREATE TABLE `secretkey_vm` (
  `sv_id` varchar(32) NOT NULL,
  `vm_id` varchar(36) NOT NULL,
  `secretkey_id` varchar(32) NOT NULL,
  PRIMARY KEY (`sv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secretkey_vm
-- ----------------------------

