/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-11-17 14:54:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_eayunfile
-- ----------------------------
DROP TABLE IF EXISTS `sys_eayunfile`;
CREATE TABLE `sys_eayunfile` (
  `file_id` varchar(32) NOT NULL,
  `file_createdate` datetime DEFAULT NULL COMMENT '上传时间',
  `file_md5` varchar(32) DEFAULT NULL COMMENT '文件MD5码',
  `file_groupname` varchar(200) DEFAULT NULL COMMENT 'group目录',
  `file_path` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '原文件名',
  `file_type` varchar(200) DEFAULT NULL COMMENT '文件类型',
  `file_username` varchar(200) DEFAULT NULL COMMENT '上传人账户名',
  `file_size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`file_id`),
  KEY `idx_filemd5` (`file_md5`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
