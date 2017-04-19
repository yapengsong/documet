ALTER TABLE `sys_selfcustomer`
ADD COLUMN `credit_lines` decimal(16,3) NOT NULL DEFAULT '0.000' COMMENT '信用额度',
ADD COLUMN `expire_keep_time` int(11) NOT NULL DEFAULT '72' COMMENT '到期或欠费资源保留时长',
ADD COLUMN `over_credit_time` datetime DEFAULT NULL COMMENT '欠费达信用额度时间';