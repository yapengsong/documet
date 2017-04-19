/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-08-29 16:01:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `pay_orderrecord`
-- ----------------------------
DROP TABLE IF EXISTS `pay_orderrecord`;
CREATE TABLE `pay_orderrecord` (
  `trade_no` varchar(18) DEFAULT NULL,
  `order_no` varchar(18) DEFAULT NULL
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `pay_record`
-- ----------------------------
DROP TABLE IF EXISTS `pay_record`;
CREATE TABLE `pay_record` (
  `pay_id` varchar(32) NOT NULL DEFAULT '',
  `third_id` varchar(50) DEFAULT NULL,
  `pay_type` char(1) NOT NULL COMMENT '0:余额支付\r\n1:支付宝',
  `trade_type` char(1) NOT NULL COMMENT '1:订单支付 2:充值',
  `trade_no` varchar(18) NOT NULL,
  `pay_amount` decimal(16,3) NOT NULL,
  `pay_status` char(1) NOT NULL COMMENT '0:支付中 1:支付成功 2: 支付失败',
  `create_time` datetime NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `third_result` varchar(1000) DEFAULT NULL,
  `prod_name` varchar(256) DEFAULT NULL,
  `prod_desc` varchar(1000) DEFAULT NULL,
  `cus_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `pay_refundrecord`
-- ----------------------------
DROP TABLE IF EXISTS `pay_refundrecord`;
CREATE TABLE `pay_refundrecord` (
  `refund_id` varchar(32) NOT NULL DEFAULT '',
  `refund_amount` decimal(16,3) NOT NULL,
  `refund_type` char(1) NOT NULL COMMENT '0: 余额退款 1: 支付宝退款',
  `batch_no` varchar(64) DEFAULT NULL,
  `batch_num` int(11) DEFAULT NULL,
  `detail_data` varchar(4000) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `refund_status` char(1) NOT NULL COMMENT '0:退款中 1: 退款成功 2: 退款失败',
  `order_no` varchar(18) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB;

