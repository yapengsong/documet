ALTER TABLE `schedule_info`
ADD COLUMN `task_name`  varchar(200) NOT NULL DEFAULT '' COMMENT 'ÈÎÎñÃû³Æ' AFTER `trigger_name`;

DROP TABLE `schedule_log`;

DROP TABLE `schedule_info`;