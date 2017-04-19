-- ecmc 监控管理模块新建表 段彬彬2016-03-29
-- 4.18.1	运维联系人表
DROP TABLE IF EXISTS `ecmc_contact`;  
CREATE TABLE `ecmc_contact` (  
  `mc_id` varchar(32) NOT NULL,  
  `mc_name` varchar(64) DEFAULT NULL COMMENT '运维联系人名称', 
  `mc_phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `mc_email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `mc_smsnotify`  char(1) DEFAULT '1' COMMENT '短信',  
  `mc_mailnotify`  char(1) DEFAULT '1' COMMENT '邮件',  
  PRIMARY KEY (`mc_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;  

-- 4.18.2	运维联系组表
DROP TABLE IF EXISTS `ecmc_contactgroup`;  
CREATE TABLE `ecmc_contactgroup` (  
  `mg_id` varchar(32) NOT NULL,  
  `mg_name` varchar(64) DEFAULT NULL COMMENT '运维联系组名称',
  PRIMARY KEY (`mg_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;  

-- 4.18.3	运维联系人-组关联表--
DROP TABLE IF EXISTS `ecmc_contactgroupdetail`;  
CREATE TABLE `ecmc_contactgroupdetail` (  
  `mgd_id` varchar(32) NOT NULL,  
  `mgd_groupid` varchar(32) DEFAULT NULL COMMENT '运维联系组id',
	`mgd_contactid` varchar(32) DEFAULT NULL COMMENT '运维联系人id',
  PRIMARY KEY (`mgd_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 
ALTER TABLE `ecmc_contactgroupdetail` ADD INDEX `idx_mgdgroupid` (`mgd_groupid` ASC);
ALTER TABLE `ecmc_contactgroupdetail` ADD INDEX `idx_mgdcontactid` (`mgd_contactid` ASC);

-- 4.18.4	运维报警规则表
DROP TABLE IF EXISTS `ecmc_alarmrule`;  
CREATE TABLE `ecmc_alarmrule` (  
  `ar_id` varchar(32) NOT NULL,  
  `ar_name` varchar(64) DEFAULT NULL COMMENT '运维报警规则名称',
	`ar_mtime` datetime DEFAULT NULL COMMENT '记录的最后修改时间',
	`ar_monitoritem` varchar(32) DEFAULT NULL COMMENT '监控项nodeId',
  PRIMARY KEY (`ar_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8; 

-- 4.18.5	运维触发条件表--
DROP TABLE IF EXISTS `ecmc_alarmtrigger`;  
CREATE TABLE `ecmc_alarmtrigger` (  
  `at_id` varchar(32) NOT NULL,  
  `at_alarmruleid` varchar(32) DEFAULT NULL COMMENT '所属规则id', 
  `at_zb` varchar(32) DEFAULT NULL COMMENT '监控指标nodeId',
  `at_operator` varchar(32) DEFAULT NULL COMMENT '运算符',
  `at_threshold`  float DEFAULT NULL COMMENT '阈值',  
  `at_lasttime`  int DEFAULT NULL COMMENT '持续时间秒数',  
	`at_istriggered`  char(1) DEFAULT NULL COMMENT '是否已触发', 
	`at_unit`  varchar(32) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`at_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE `ecmc_alarmtrigger` ADD INDEX `idx_atalarmruleid` (`at_alarmruleid` ASC); 

-- 4.17.7	运维报警对象表--
DROP TABLE IF EXISTS `ecmc_alarmobject`;  
CREATE TABLE `ecmc_alarmobject` (  
  `ao_id` varchar(32) NOT NULL,  
  `ao_alarmruleid` varchar(32) DEFAULT NULL COMMENT '所属规则id', 
  `ao_type` varchar(32) DEFAULT NULL COMMENT '对象类型',
  `ao_objectid` varchar(32) DEFAULT NULL COMMENT '所属对象id',
  PRIMARY KEY (`ao_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE `ecmc_alarmobject` ADD INDEX `idx_aoalarmruleid` (`ao_alarmruleid` ASC); 

--  4.18.9	运维监控报警项表----
DROP TABLE IF EXISTS `ecmc_monitoralarmitem`;  
CREATE TABLE `ecmc_monitoralarmitem` (  
  `mai_id` varchar(32) NOT NULL,  
  `mai_objectid` varchar(32) DEFAULT NULL COMMENT '报警对象id', 
  `mai_type` varchar(32) DEFAULT NULL COMMENT '报警对象类型',
  `mai_triggerid` varchar(32) DEFAULT NULL COMMENT '触发条件id',
  `mai_isnotified`  char(1) DEFAULT NULL COMMENT '是否已产成报警',  
  `mai_modifiedTime`  datetime DEFAULT NULL COMMENT '上次修改时间',  
	`mai_alarmruleid`  varchar(32) DEFAULT NULL COMMENT '报警规则id',
  PRIMARY KEY (`mai_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE `ecmc_monitoralarmitem` ADD INDEX `idx_maiobjectid` (`mai_objectid` ASC); 
ALTER TABLE `ecmc_monitoralarmitem` ADD INDEX `idx_maitriggerid` (`mai_triggerid` ASC); 
ALTER TABLE `ecmc_monitoralarmitem` ADD INDEX `idx_maialarmruleid` (`mai_alarmruleid` ASC); 

-- 4.18.11	运维报警信息表 --
DROP TABLE IF EXISTS `ecmc_alarmmessage`;  
CREATE TABLE `ecmc_alarmmessage` (  
  `am_id` varchar(32) NOT NULL,  
  `am_objectid` varchar(32) DEFAULT NULL COMMENT '报警对象id', 
  `am_monitortype` varchar(32) DEFAULT NULL COMMENT '监控（对象）类型',
  `am_alarmtype` varchar(32) DEFAULT NULL COMMENT '报警（指标）类型id',
  `am_detail`  varchar(500) DEFAULT NULL COMMENT '报警详情',  
  `am_time`  datetime DEFAULT NULL COMMENT '报警时间',  
	`am_isprocessed`  char(1) DEFAULT NULL COMMENT '报警标示（是否已处理）',
	`am_monitoralarmitemid` varchar(32) DEFAULT NULL COMMENT '监控报警项id',
	`am_alarmruleid` varchar(32) DEFAULT NULL COMMENT '报警规则id',
  PRIMARY KEY (`am_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE `ecmc_alarmmessage` ADD INDEX `idx_ammonitoralarmitemid` (`am_monitoralarmitemid` ASC); 
ALTER TABLE `ecmc_alarmmessage` ADD INDEX `idx_amalarmruleid` (`am_alarmruleid` ASC); 

-- 4.18.12	运维报警规则-联系人表 
DROP TABLE IF EXISTS `ecmc_alarmcontact`;  
CREATE TABLE `ecmc_alarmcontact` (  
  `ac_id` varchar(32) NOT NULL,  
  `ac_alarmruleid` varchar(32) DEFAULT NULL COMMENT '所属报警规则id', 
  `ac_contactid` varchar(32) DEFAULT NULL COMMENT '运维联系人id',
  PRIMARY KEY (`ac_id`)  
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
