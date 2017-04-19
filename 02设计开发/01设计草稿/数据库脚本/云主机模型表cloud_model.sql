/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-10-14 13:47:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloud_model
-- ----------------------------
DROP TABLE IF EXISTS `cloud_model`;
CREATE TABLE `cloud_model` (
  `model_id` varchar(32) NOT NULL COMMENT '模板id',
  `model_name` varchar(100) NOT NULL COMMENT '模板名称',
  `model_vcpus` int(20) DEFAULT NULL COMMENT 'Cpu核数',
  `model_ram` int(20) DEFAULT NULL COMMENT '内存大小',
  `model_cusid` varchar(32) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`model_id`),
  KEY `idx_modelcusid` (`model_cusid`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
