/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-03-08 17:22:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `cloud_secretkey`
-- ----------------------------
DROP TABLE IF EXISTS `cloud_secretkey`;
CREATE TABLE `cloud_secretkey` (
  `secretkey_id` varchar(32) NOT NULL COMMENT 'ID',
  `secretkey_name` varchar(200) DEFAULT NULL COMMENT '密钥名称',
  `secretkey_desc` varchar(1000) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `prj_id` varchar(32) NOT NULL COMMENT '项目ID',
  `dc_id` varchar(32) NOT NULL COMMENT '数据中心ID',
  `fingerprint` varchar(200) NOT NULL,
  `public_key` varchar(2000) NOT NULL,
  PRIMARY KEY (`secretkey_id`),
  UNIQUE KEY `Idx_secretkeyid` (`secretkey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_secretkey
-- ----------------------------
