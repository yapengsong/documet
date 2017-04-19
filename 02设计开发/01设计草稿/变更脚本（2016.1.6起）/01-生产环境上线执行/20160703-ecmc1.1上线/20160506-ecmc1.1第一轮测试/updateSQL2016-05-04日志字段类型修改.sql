/** 20160504 update temp6 类型为text */
ALTER TABLE `sys_oper_log` MODIFY COLUMN `temp6`  text NULL DEFAULT NULL COMMENT '异常信息' AFTER `temp5`;