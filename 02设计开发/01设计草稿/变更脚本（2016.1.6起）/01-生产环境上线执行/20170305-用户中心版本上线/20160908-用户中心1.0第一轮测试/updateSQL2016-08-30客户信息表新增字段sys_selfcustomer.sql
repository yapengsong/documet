ALTER TABLE `sys_selfcustomer`
ADD COLUMN `credit_lines` decimal(16,3) NOT NULL DEFAULT '0.000' COMMENT '���ö��',
ADD COLUMN `expire_keep_time` int(11) NOT NULL DEFAULT '72' COMMENT '���ڻ�Ƿ����Դ����ʱ��',
ADD COLUMN `over_credit_time` datetime DEFAULT NULL COMMENT 'Ƿ�Ѵ����ö��ʱ��';