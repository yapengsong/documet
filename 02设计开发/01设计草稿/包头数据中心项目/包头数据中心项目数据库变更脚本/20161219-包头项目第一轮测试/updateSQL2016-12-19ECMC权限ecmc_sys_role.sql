/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : eayuncloud_baotou

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-19 14:08:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ecmc_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_role`;
CREATE TABLE `ecmc_sys_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `protect` char(1) DEFAULT '0' COMMENT '是否受保护，0:false 可配置权限、删除;1：true 受保护，不可配置权限、删除',
  `hide` char(1) DEFAULT '0' COMMENT '是否隐藏，0:否，不隐藏;1：是，隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_role
-- ----------------------------
INSERT INTO `ecmc_sys_role` VALUES ('40288ee75456549a015456b8df2e000d', '超级管理员', '有所有权限（别删，系统初始角色）', '2016-04-27 15:57:16', 'ff808081543cbe2701543cceba910000', '1', '1', '1');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfeb3fa000a', '客服人员', '系统初始角色', '2016-04-22 11:23:48', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfee6a8000b', '运维工程师', '系统初始角色', '2016-04-22 11:24:01', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff30f2000c', '管理员', '系统初始角色', '2016-04-22 11:24:20', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff655b000d', '商务', '系统初始角色', '2016-04-22 11:24:34', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
