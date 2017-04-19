/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-03 15:54:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `unit_info`
-- ----------------------------
DROP TABLE IF EXISTS `unit_info`;
CREATE TABLE `unit_info` (
  `unit_id` varchar(32) NOT NULL COMMENT 'ID',
  `unit_name` varchar(100) NOT NULL COMMENT '主办单位名称',
  `unit_nature` char(1) NOT NULL COMMENT '1个人、\r\n2企业、\r\n3政府机关、\r\n4事业单位、\r\n5社会群体、\r\n6军队',
  `head_name` varchar(100) NOT NULL COMMENT '法人名称',
  `unit_area` varchar(32) NOT NULL COMMENT '所属行政区域',
  `unit_address` varchar(100) NOT NULL COMMENT '主办单位通讯地址',
  `certificate_type` char(1) NOT NULL COMMENT '主办单位证件类型1工商营业执照、\r\n2组织机构代码证书、',
  `certificate_no` varchar(32) NOT NULL COMMENT '证件号',
  `certificate_address` varchar(32) NOT NULL COMMENT '证件所在地',
  `duty_name` varchar(100) NOT NULL COMMENT '主体负责人姓名',
  `duty_certificate_type` char(1) NOT NULL COMMENT '1身份证、\r\n2护照、\r\n3台胞证、\r\n4军官证',
  `duty_certificate_no` varchar(100) NOT NULL COMMENT '负责人证件号码',
  `phone` varchar(32) NOT NULL COMMENT '办公室电话',
  `duty_phone` varchar(11) NOT NULL COMMENT '负责人手机',
  `duty_email` varchar(32) NOT NULL COMMENT '负责人邮箱',
  `duty_qq` varchar(20) DEFAULT NULL COMMENT '负责人QQ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '上次修改时间',
  `record_type` char(1) NOT NULL COMMENT '1 首次备案、\r\n2 新增网站、\r\n3 新增接入、\r\n4 变更备案',
  `record_no` varchar(100) DEFAULT NULL COMMENT '主体备案号',
  `record_password` varchar(100) DEFAULT NULL COMMENT '管局密码',
  `cus_id` varchar(32) NOT NULL COMMENT '所属客户ID',
  `cus_org` varchar(32) NOT NULL COMMENT '客户名称',
  `business_fileId` varchar(32) NOT NULL COMMENT '营业执照',
  `duty_fileId` varchar(32) NOT NULL COMMENT '负责人证件照',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit_info
-- ----------------------------
