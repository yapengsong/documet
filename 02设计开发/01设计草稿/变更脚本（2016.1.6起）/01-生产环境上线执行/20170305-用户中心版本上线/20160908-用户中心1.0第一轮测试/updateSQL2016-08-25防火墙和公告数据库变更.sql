alter table notice_info modify column notice_url varchar(1024) ;
alter table notice_info modify column memo varchar(200) ;
ALTER TABLE notice_info ADD COLUMN `title` varchar(100) NULL AFTER `notice_url`;
ALTER TABLE notice_info ADD COLUMN `content` varchar(2000) NULL AFTER `title`;

ALTER TABLE `cloud_fwrule` CHANGE reserve1 fwr_priority int(11);