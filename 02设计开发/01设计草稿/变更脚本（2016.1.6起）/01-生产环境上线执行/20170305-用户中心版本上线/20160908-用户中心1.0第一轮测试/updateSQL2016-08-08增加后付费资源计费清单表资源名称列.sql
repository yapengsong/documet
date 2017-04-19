--
-- Table structure for table `money_chargerecord`
-- Author: fan.zhang
-- Date: 2016-08-08 19:59
--
ALTER TABLE `money_chargerecord` ADD COLUMN `cr_resourcename` VARCHAR(100) NULL COMMENT '资源名称，仅用于删除资源发送消息中使用。' AFTER `cr_changetime`;
