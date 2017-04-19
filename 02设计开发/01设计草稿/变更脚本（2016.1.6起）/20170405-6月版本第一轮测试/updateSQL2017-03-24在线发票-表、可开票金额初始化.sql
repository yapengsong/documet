/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-02-27 10:15:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `invoice_apply`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_apply`;
CREATE TABLE `invoice_apply` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `cus_id` varchar(32) NOT NULL,
  `invoice_title` varchar(500) DEFAULT NULL,
  `invoice_type` char(1) DEFAULT NULL,
  `amount` decimal(16,3) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `status` char(2) DEFAULT NULL COMMENT '0:待开票\r\n10: 处理中\r\n20: 已开票\r\n30: 已取消(用户取消)\r\n31: 已取消(Ecmc取消)',
  `used_express` char(1) DEFAULT NULL COMMENT '0:否\r\n1:是',
  `express_name` varchar(500) DEFAULT NULL,
  `express_no` varchar(500) DEFAULT NULL,
  `cancel_reason` varchar(500) DEFAULT NULL,
  `receiver_name` varchar(20) NOT NULL,
  `receiver_tel` varchar(500) NOT NULL,
  `address` varchar(500) NOT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `base_bankname` varchar(500) DEFAULT NULL,
  `base_bankaccount` varchar(500) DEFAULT NULL,
  `tax_account` varchar(500) DEFAULT NULL,
  `reg_address` varchar(500) DEFAULT NULL,
  `reg_tel` varchar(500) DEFAULT NULL,
  `biz_licensefileid` varchar(32) DEFAULT NULL,
  `taxpayer_licensefileid` varchar(32) DEFAULT NULL,
  `bank_licensefileid` varchar(32) DEFAULT NULL,
  `noexpress_tips` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice_billable_amount`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_billable_amount`;
CREATE TABLE `invoice_billable_amount` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `cus_id` varchar(32) DEFAULT NULL,
  `total_amount` decimal(16,3) DEFAULT NULL,
  `invoiced_amount` decimal(16,3) DEFAULT NULL,
  `frozen_amount` decimal(16,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice_billable_amount
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice_delivery_address`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_delivery_address`;
CREATE TABLE `invoice_delivery_address` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `cus_id` varchar(32) DEFAULT NULL,
  `receiver_name` varchar(20) DEFAULT NULL,
  `receiver_tel` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `zip_code` varchar(500) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `default_item` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice_delivery_address
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice_info`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_info`;
CREATE TABLE `invoice_info` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `cus_id` varchar(32) DEFAULT NULL,
  `invoice_title` varchar(500) NOT NULL,
  `invoice_type` char(1) NOT NULL COMMENT '1:增值税普通发票\r\n2:增值税专用发票',
  `base_bankname` varchar(500) DEFAULT NULL,
  `base_bankaccount` varchar(500) DEFAULT NULL,
  `tax_account` varchar(500) DEFAULT NULL,
  `reg_address` varchar(500) DEFAULT NULL,
  `reg_tel` varchar(500) DEFAULT NULL,
  `biz_licensefileid` varchar(32) DEFAULT NULL,
  `taxpayer_licensefileid` varchar(32) DEFAULT NULL,
  `bank_licensefileid` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `default_item` char(1) NOT NULL COMMENT '1:默认\r\n0:非默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice_info
-- ----------------------------


-- 初始化客户可开票金额
-- 清空表数据
delete from invoice_billable_amount;

-- 初始化所有客户的可开票金额
insert into invoice_billable_amount(id, cus_id, total_amount, invoiced_amount, frozen_amount) SELECT REPLACE(uuid(), '-', ''), cus_id, 0.000, 0.000, 0.000 from sys_selfcustomer;

-- 统计插入ecmc后台实际充值的金额
update invoice_billable_amount a,(select cus_id,sum(mon_money) total from money_record where mon_ecmcremark like '%实际充值' GROUP BY cus_id) b set a.total_amount = a.total_amount + b.total where a.cus_id = b.cus_id;

-- 统计支付宝平台充值的金额（包含ecsc充值和ecsc订单支付）
update invoice_billable_amount a,
	(select p.cus_id,sum(p.pay_amount) total from pay_record p where p.pay_status = '1' and p.pay_type = '1' and p.trade_type in ('1', '2') and p.third_id is not null GROUP BY p.cus_id) b 
	set a.total_amount = a.total_amount + b.total where a.cus_id = b.cus_id;
