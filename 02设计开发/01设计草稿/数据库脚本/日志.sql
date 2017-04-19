CREATE TABLE `sys_log` (
  `log_id` varchar(32) NOT NULL,
  `act_person` varchar(32) DEFAULT NULL,
  `act_item` varchar(32) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `resource_name` varchar(64) DEFAULT NULL,
  `act_time` datetime DEFAULT NULL,
  `statu` char(1) DEFAULT NULL,
  `log_prjid` varchar(100) DEFAULT NULL,
  `log_cusid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sys_log` ADD INDEX `idx_logcusid` (`log_cusid` ASC);
ALTER TABLE `sys_log` ADD INDEX `idx_logacttime` (`act_time` ASC);

ALTER TABLE `sys_log` 
ADD COLUMN `log_ip` VARCHAR(100) NULL AFTER `log_cusid`,
ADD COLUMN `log_detail` VARCHAR(1000) NULL AFTER `log_ip`;



