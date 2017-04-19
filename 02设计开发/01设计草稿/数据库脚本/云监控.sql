/*联系人*/
drop table if exists ecsc_contact;

CREATE TABLE `ecsc_contact` (
  `c_id` varchar(32) NOT NULL,
  `c_cusid` varchar(32) DEFAULT NULL,
  `c_name` varchar(64) DEFAULT NULL,
  `c_phone` varchar(11) DEFAULT NULL,
  `c_email` varchar(100) DEFAULT NULL,
  `c_smsnotify` char(1) DEFAULT NULL,
  `c_mailnotify` char(1) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_contact` ADD INDEX `idx_ccusid` (`c_cusid` ASC);
ALTER TABLE `ecsc_contact` ADD `c_isadmin` char(1);

/*联系组主表*/
drop table if exists ecsc_contactgroup;

CREATE TABLE `ecsc_contactgroup` (
  `cg_id` varchar(32) NOT NULL,
  `cg_cusid` varchar(32) DEFAULT NULL,
  `cg_name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_contactgroup` ADD INDEX `idx_cgcustomerid` (`cg_cusid` ASC);

/*联系组子表*/
drop table if exists ecsc_contactgroupdetail;

CREATE TABLE `ecsc_contactgroupdetail` (
  `cgd_id` varchar(32) NOT NULL,
  `cgd_groupid` varchar(32) DEFAULT NULL,
  `cgd_contactid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`cgd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_contactgroupdetail` ADD INDEX `idx_cgdgroupid` (`cgd_groupid` ASC);
ALTER TABLE `ecsc_contactgroupdetail` ADD INDEX `idx_cgdcontactid` (`cgd_contactid` ASC);

/*报警联系人*/
drop table if exists ecsc_alarmcontact;

CREATE TABLE `ecsc_alarmcontact` (
  `ac_id` varchar(32) NOT NULL,
  `ac_alarmruleid` varchar(32) DEFAULT NULL,
  `ac_contactid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_alarmcontact` ADD INDEX `idx_acalarmruleid` (`ac_alarmruleid` ASC);
ALTER TABLE `ecsc_alarmcontact` ADD INDEX `idx_accontactid` (`ac_contactid` ASC);


/*报警规则*/
drop table if exists ecsc_alarmrule;

CREATE TABLE `ecsc_alarmrule` (
  `ar_id` varchar(32) NOT NULL,
  `ar_cusid` varchar(32) DEFAULT NULL,
  `ar_name` varchar(64) DEFAULT NULL,
  `ar_modifytime` datetime DEFAULT NULL,
  `ar_monitoritem` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecsc_alarmrule` ADD INDEX `idx_arcusid` (`ar_cusid` ASC);

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


ALTER TABLE `ecsc_alarmmessage` ADD `am_monitoralarmitemid` varchar(32);
ALTER TABLE `ecsc_alarmmessage` ADD INDEX `idx_amvmid` (`am_vmid` ASC);
ALTER TABLE `ecsc_alarmmessage` ADD INDEX `idx_ammonitoralarmitemid` (`am_monitoralarmitemid` ASC);
ALTER TABLE `ecsc_alarmmessage` ADD `am_alarmruleid` varchar(32);
ALTER TABLE `ecsc_alarmmessage` ADD INDEX `idx_amalarmruleid` (`am_alarmruleid` ASC);