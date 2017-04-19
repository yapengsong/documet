-- 刘金钢20160330

ALTER TABLE `sys_oper_log`
MODIFY COLUMN `temp5`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问路径' AFTER `temp4`,
MODIFY COLUMN `temp6`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返回结果' AFTER `temp5`,
ADD COLUMN `resource_type`  varchar(64) NULL AFTER `temp6`,
ADD COLUMN `resource_name`  varchar(64) NULL AFTER `resource_type`,
ADD COLUMN `log_prjid`  varchar(100) NULL AFTER `resource_name`,
ADD COLUMN `resource_id`  varchar(100) NULL AFTER `log_prjid`;