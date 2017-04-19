/*
Navicat MySQL Data Transfer

Source Server         : ecmcbj
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-03 15:54:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `website_info`
-- ----------------------------
DROP TABLE IF EXISTS `website_info`;
CREATE TABLE `website_info` (
  `web_id` varchar(32) NOT NULL COMMENT 'ID',
  `web_name` varchar(100) DEFAULT NULL,
  `domain_name` varchar(100) DEFAULT NULL,
  `domain_url` varchar(100) DEFAULT NULL,
  `web_service` varchar(32) DEFAULT NULL,
  `service_ip` varchar(20) DEFAULT NULL,
  `service_content` varchar(1000) DEFAULT NULL,
  `web_language` varchar(1000) DEFAULT NULL,
  `web_special` char(1) DEFAULT NULL COMMENT '1���š�2���桢3������4ҽ�Ʊ�����5ҩƷ��ҽ����е��6�Ļ���7�㲥��Ӱ���ӽ�Ŀ',
  `special_no` varchar(32) DEFAULT NULL COMMENT 'ǰ',
  `web_duty_name` varchar(100) DEFAULT NULL,
  `duty_certificate_type` char(1) DEFAULT NULL,
  `duty_certificate_no` varchar(100) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `duty_phone` varchar(11) DEFAULT NULL,
  `duty_email` varchar(32) DEFAULT NULL,
  `duty_qq` varchar(20) DEFAULT NULL COMMENT '������QQ',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '�ϴ��޸�ʱ��',
  `progress` char(1) DEFAULT NULL,
  `web_record_no` varchar(100) DEFAULT NULL COMMENT '������',
  `unit_id` varchar(32) DEFAULT NULL,
  `duty_fileId` varchar(32) DEFAULT NULL,
  `domain_fileId` varchar(32) DEFAULT NULL,
  `special_fileId` varchar(32) DEFAULT NULL,
  `dc_id` varchar(32) NOT NULL,
  `isChange` char(1) DEFAULT '1' COMMENT '是否变更，1否，2是',
  PRIMARY KEY (`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website_info
-- ----------------------------
