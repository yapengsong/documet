-- 工单新增配额，短信条数配额 陈鹏飞
alter   table   work_quota   add   quota_sms_num  int(11) DEFAULT 0;

alter   table   work_opinion   add   is_ecmc_cre  varchar(32) DEFAULT 0;
UPDATE work_opinion wo SET wo.is_ecmc_cre = '1' WHERE wo.cre_user_id IN ( SELECT ssu.user_id FROM sys_selfuser ssu );