/*
Navicat MySQL Data Transfer

Source Server         : 北京研发库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-08-30 10:57:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` varchar(32) NOT NULL COMMENT '主键UUID',
  `order_no` varchar(18) NOT NULL COMMENT '订单编号（订单标识号+日期+当前时间平台交易次数8位）',
  `order_type` char(1) NOT NULL COMMENT '订单类型（0-新购；1-续费；2-升级）',
  `user_id` varchar(32) NOT NULL COMMENT '提交订单用户ID',
  `cus_id` varchar(32) NOT NULL COMMENT '客户ID',
  `prod_name` varchar(200) NOT NULL COMMENT '产品名称',
  `prod_count` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `prod_config` varchar(2000) DEFAULT NULL COMMENT '产品配置',
  `create_time` datetime NOT NULL COMMENT '订单生成时间',
  `complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `canceled_time` datetime DEFAULT NULL COMMENT '取消时间',
  `audit_pass_time` datetime DEFAULT NULL COMMENT '审核通过时间（目前无审核流程，该字段暂时无用）',
  `dc_id` varchar(32) DEFAULT NULL COMMENT '数据中心ID',
  `pay_type` char(1) NOT NULL COMMENT '付款类型（1-预付费；2-后付费）',
  `buy_cycle` int(11) DEFAULT NULL COMMENT '购买周期',
  `pay_expire_time` datetime DEFAULT NULL COMMENT '支付过期时间（待支付状态24小时）',
  `unit_price` decimal(16,3) DEFAULT '0.000' COMMENT '单价',
  `audit_flag` char(1) DEFAULT NULL COMMENT '审核标识（目前无审核流程，该字段暂时无用）',
  `billing_cycle` char(1) DEFAULT NULL COMMENT '计费周期（0-小时；1-天；2-其他）',
  `order_state` char(1) NOT NULL COMMENT '订单状态（1-待支付；2-资源创建中；3-资源创建失败-已取消；4-已完成；5-已取消）',
  `resource_type` char(1) NOT NULL COMMENT '资源类型（0-云主机；1-云硬盘；2-云硬盘快照；3-私有网络VPC；4-负载均衡；5-弹性公网IP；6-对象存储；7-VPN）',
  `payment_amount` decimal(16,3) DEFAULT '0.000' COMMENT '付费总金额',
  `account_payment` decimal(16,3) DEFAULT '0.000' COMMENT '账户支付金额',
  `third_part_payment` decimal(16,3) DEFAULT '0.000' COMMENT '第三方支付金额',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `third_part_type` char(1) DEFAULT NULL COMMENT '第三方支付类型（0-支付宝）',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁标识字段',
  `resource_begin_time` datetime DEFAULT NULL COMMENT '资源起始时间',
  `resource_expire_time` datetime DEFAULT NULL COMMENT '资源到期时间',
  `params` mediumtext COMMENT '业务参数',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB COMMENT='订单信息表';
