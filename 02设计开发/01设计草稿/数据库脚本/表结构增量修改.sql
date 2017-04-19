-- sys_selfuser表字段user_explain修改长度
alter table sys_selfuser modify column user_explain varchar(400) ;
-- 修改标签类别和标签描述的长度为200
ALTER TABLE `sys_tag` modify column `tg_description` varchar(200);
ALTER TABLE `sys_taggroup` modify column `tgrp_description` varchar(200) ;

-- 删除报警对象表的字段
/*触发条件*/
drop table if exists ecsc_alarmtrigger;

CREATE TABLE `ecsc_alarmtrigger` (
  `at_id` varchar(32) NOT NULL,
  `at_alarmruleid` varchar(32) DEFAULT NULL,
  `at_zb` varchar(64) DEFAULT NULL,
  `at_operator` varchar(16) DEFAULT NULL,
  `at_threshold` float DEFAULT NULL,
  `at_lasttime` int DEFAULT NULL,
  PRIMARY KEY (`at_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_alarmtrigger` ADD INDEX `idx_atalarmruleid` (`at_alarmruleid` ASC);
ALTER TABLE `ecsc_alarmtrigger` ADD `at_istriggered` char(1);
ALTER TABLE `ecsc_alarmtrigger` ADD `at_unit` varchar(16);

/*报警对象*/
drop table if exists ecsc_alarmobject;

CREATE TABLE `ecsc_alarmobject` (
  `ao_id` varchar(32) NOT NULL,
  `ao_alarmruleid` varchar(32) DEFAULT NULL,
  `ao_vmid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ao_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_alarmobject` ADD INDEX `idx_aoalarmruleid` (`ao_alarmruleid` ASC);

/*监控报警项表*/
drop table if exists ecsc_monitoralarmitem;

CREATE TABLE `ecsc_monitoralarmitem` (
  `mai_id` varchar(32) NOT NULL,
  `mai_objectid` varchar(32) DEFAULT NULL,
  `mai_triggerid` varchar(32) DEFAULT NULL,
  `mai_alarmruleid` varchar(32) DEFAULT NULL,
  `mai_isnotified` char(1) DEFAULT NULL,
  `mai_modifiedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`mai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_monitoralarmitem` ADD INDEX `idx_maiobjectid` (`mai_objectid` ASC);
ALTER TABLE `ecsc_monitoralarmitem` ADD INDEX `idx_maitriggerid` (`mai_triggerid` ASC);
ALTER TABLE `ecsc_monitoralarmitem` ADD INDEX `idx_maialarmruleid` (`mai_alarmruleid` ASC);

/*报警信息表*/
drop table if exists ecsc_alarmmessage;

CREATE TABLE `ecsc_alarmmessage` (
  `am_id` varchar(32) NOT NULL,
  `am_vmid` varchar(64) DEFAULT NULL,
  `am_monitortype` varchar(32) DEFAULT NULL,
  `am_alarmtype` varchar(32) DEFAULT NULL,
  `am_detail` varchar(500) DEFAULT NULL,
  `am_time` datetime DEFAULT NULL,
  `am_isprocessed` char(1) DEFAULT NULL,
  PRIMARY KEY (`am_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



