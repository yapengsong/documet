-- 2016-04-06 09:29:03 已执行，增加三个字段及索引
ALTER TABLE `sys_sms` ADD `sms_cust` varchar(32);
ALTER TABLE `sys_sms` ADD `sms_proj` varchar(32);
ALTER TABLE `sys_sms` ADD `sms_biz` varchar(100);

ALTER TABLE `sys_sms` ADD INDEX `idx_smscustid` (`sms_cust` ASC);
ALTER TABLE `sys_sms` ADD INDEX `idx_smsprojid` (`sms_proj` ASC);


-- 2016-04-13 14:51:07 添加配额内正常发送短信数量字段和超过配额发送的短信数量字段。
ALTER TABLE `sys_sms` ADD `sms_sent` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '配额内正常发送的短信数目' ;
ALTER TABLE `sys_sms` ADD `sms_oversent` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '超过配额发送的短信数目' ;