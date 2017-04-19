/*
Navicat MySQL Data Transfer

Source Server         : 北京研发库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-08-30 11:00:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_state_record
-- ----------------------------
DROP TABLE IF EXISTS `order_state_record`;
CREATE TABLE `order_state_record` (
  `record_id` varchar(32) NOT NULL COMMENT '主键UUID',
  `order_no` varchar(18) NOT NULL COMMENT '订单编号',
  `origin_state` char(1) DEFAULT NULL COMMENT '原始状态（1-待支付；2-资源创建中；3-资源创建失败-已取消；4-已完成；5-已取消）',
  `to_state` char(1) NOT NULL COMMENT '变更状态（1-待支付；2-资源创建中；3-资源创建失败-已取消；4-已完成；5-已取消）',
  `change_time` datetime NOT NULL COMMENT '变更时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB COMMENT='订单状态变更表';
