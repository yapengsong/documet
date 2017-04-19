-- 总览资源类型的数据字典维护 by zhouhaitao  2016-03-25
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015', '总览资源类型', '0007002', '15', '0', NULL, '1', NULL, NULL, NULL, 'dcResourceType', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015001', '物理服务器', '0007002015', '1', '0', NULL, '1', NULL, NULL, NULL, 'serverCount', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015002', 'cpu', '0007002015', '2', '0', NULL, '1', NULL, NULL, NULL, 'cpuQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015003', '内存', '0007002015', '3', '0', NULL, '1', NULL, NULL, NULL, 'memoryQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015004', '硬盘', '0007002015', '4', '0', NULL, '1', NULL, NULL, NULL, 'dataCapacityQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015005', '网络带宽', '0007002015', '5', '0', NULL, '1', NULL, NULL, NULL, 'bandWidthQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015006', '公网IP', '0007002015', '6', '0', NULL, '1', NULL, NULL, NULL, 'floatIpCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015007', '云主机', '0007002015', '7', '0', NULL, '1', NULL, NULL, NULL, 'vmCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015008', '快照', '0007002015', '8', '0', NULL, '1', NULL, NULL, NULL, 'volSnapshotCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015009', '镜像', '0007002015', '9', '0', NULL, '1', NULL, NULL, NULL, 'imageCount', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015010', '云硬盘', '0007002015', '10', '0', NULL, '1', NULL, NULL, NULL, 'volumeCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015011', '网络', '0007002015', '11', '0', NULL, '1', NULL, NULL, NULL, 'networkCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015012', '子网', '0007002015', '12', '0', NULL, '1', NULL, NULL, NULL, 'subnetCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015013', '负载均衡', '0007002015', '13', '0', NULL, '1', NULL, NULL, NULL, 'poolCountQuato', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015014', '防火墙', '0007002015', '14', '0', NULL, '1', NULL, NULL, NULL, 'firewallCount', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002015015', '安全组', '0007002015', '15', '0', NULL, '1', NULL, NULL, NULL, 'safeGroupCountQuato', NULL);
-- ecmc 监控管理下用到的一些基础数据 段彬彬 2016-03-28

INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010', '监控管理数据', '0', 1, '0', '监控管理下用到的一些基础数据', '1', NULL, NULL, NULL, 'Monitor_Mng', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001', '云主机监控列表历史时间', '0010', 1, '0', '云监控显示历史数据的时间区间段', '1', '01', '02', NULL, 'History_Time', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001001', '30分钟', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '30', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001002', '1小时', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '60', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001003', '6小时', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '360', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001004', '12小时', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '720', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001005', '1天', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '1440', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001006', '7天', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '10080', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001007', '15天', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '21600', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010001008', '30天', '0010001', 1, '0', '英文值表示时间段分钟数', '1', '', '', NULL, '43200', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003', '运维云监控项类别', '0010', 1, '0', '运维创建的报警规则可以关联主机、物理服务器等。。。', '1', NULL, NULL, NULL, 'Ecmc_Monitor', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001', '云主机', '0010003', 1, '0', '监控项', '1', NULL, NULL, NULL, 'VM_Monitor', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001001', 'CPU利用率', '0010003001', 1, '0', '监控指标：CPU使用率。单位：%', '1', '%', '', NULL, 'Monitor_CPU', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001002', '内存占用率', '0010003001', 1, '0', '监控指标：内存使用率。单位：%', '1', '%', '', NULL, 'Monitor_RAM', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001003', '磁盘读吞吐', '0010003001', 1, '0', '监控指标：磁盘读速度。单位：MB/s', '1', 'MB/s', '', NULL, 'Monitor_READ', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001004', '磁盘写吞吐', '0010003001', 1, '0', '监控指标：磁盘写速度。单位：MB/s', '1', 'MB/s', '', NULL, 'Monitor_WRITE', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001005', '网卡下行速率', '0010003001', 1, '0', '监控指标：网卡入流量。单位：Mb/s', '1', 'Mb/s', '', NULL, 'Monitor_NETOUT', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003001006', '网卡上行速率', '0010003001', 1, '0', '监控指标：网卡出流量。单位：Mb/s', '1', 'Mb/s', '', NULL, 'Monitor_NETIN', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003002', '物理服务器', '0010003', 1, '0', '运维云监控监控项，暂时先不考虑物理服务器', '1', NULL, NULL, NULL, 'Server_Monitor', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010004', '触发条件操作符', '0010', 1, '0', '触发条件操作符，如<、>、=、......', '1', NULL, NULL, NULL, 'Operator', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010004001', '>', '0010004', 1, '0', '大于', '1', '', '', NULL, 'gt', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010004002', '<', '0010004', 1, '0', '小于', '1', '', '', NULL, 'lt', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010004003', '=', '0010004', 1, '0', '等于', '1', '', '', NULL, 'eq', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010005', '触发条件持续时间', '0010', 1, '0', '单位：秒数', '1', '', '', NULL, 'Trigger_Times', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010005001', '1分钟', '0010005', 1, '0', NULL, '1', NULL, NULL, NULL, '60', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010005002', '5分钟', '0010005', 1, '0', NULL, '1', NULL, NULL, NULL, '300', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010005003', '15分钟', '0010005', 1, '0', NULL, '1', NULL, NULL, NULL, '900', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010005004', '30分钟', '0010005', 1, '0', NULL, '1', NULL, NULL, NULL, '1800', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010005005', '1小时', '0010005', 1, '0', NULL, '1', NULL, NULL, NULL, '3600', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010006', '主机监控详情图表类别', '0010', 1, '0', '共四种，CPU，内存，硬盘，网络。目前内存无数据', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010006001', 'CPU', '0010006', 1, '0', '英文值可用来区分路由地址', '1', NULL, NULL, NULL, 'monitorCPU', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010006002', '内存', '0010006', 1, '0', '英文值可用来区分路由地址', '1', NULL, NULL, NULL, 'monitorRam', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010006003', '硬盘', '0010006', 1, '0', '英文值可用来区分路由地址', '1', NULL, NULL, NULL, 'monitorDisk', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010006004', '网络', '0010006', 1, '0', '英文值可用来区分路由地址', '1', NULL, NULL, NULL, 'monitorNet', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007', '主机监控详情图表时间范围', '0010', 1, '0', '数值表示该时间范围一个点数据代表的时间段的分钟数，如7天时，共13个点，每个点表示前12个小时的值，分钟数为720', '1', NULL, NULL, NULL, 'echart_times', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007001', '30分钟', '0010007', 1, '0', '英文值表示该时间范围一个点数据代表的时间段的分钟数', '1', NULL, NULL, NULL, '3', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007002', '1小时', '0010007', 1, '0', '英文值表示该时间范围一个点数据代表的时间段的分钟数', '1', NULL, NULL, NULL, '5', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007003', '6小时', '0010007', 1, '0', '英文值表示该时间范围一个点数据代表的时间段的分钟数', '1', NULL, NULL, NULL, '30', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007004', '12小时', '0010007', 1, '0', '英文值表示该时间范围一个点数据代表的时间段的分钟数', '1', NULL, NULL, NULL, '60', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007005', '1天', '0010007', 1, '0', '英文值表示该时间范围一个点数据代表的时间段的分钟数', '1', NULL, NULL, NULL, '120', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007006', '7天', '0010007', 1, '0', '英文值表示该时间范围一个点数据代表的时间段的分钟数', '1', NULL, NULL, NULL, '720', NULL);

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
-- 主机监控详情时间范围增加两个，15天和30天，对应数据字典也增加两条，段彬彬
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007007', '15天', '0010007', 1, '0', '新增，每天一个点，取自一天计划任务', '1', '15', 'd', NULL, '1440', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007008', '一个月', '0010007', 1, '0', '新增，每天一个点，取自一天计划任务，显示为一个月，实际处理为31个点', '1', '30', 'd', NULL, '2880', '');

-- 2016-04-06 09:29:03 已执行，增加三个字段及索引
ALTER TABLE `sys_sms` ADD `sms_cust` varchar(32);
ALTER TABLE `sys_sms` ADD `sms_proj` varchar(32);
ALTER TABLE `sys_sms` ADD `sms_biz` varchar(100);

ALTER TABLE `sys_sms` ADD INDEX `idx_smscustid` (`sms_cust` ASC);
ALTER TABLE `sys_sms` ADD INDEX `idx_smsprojid` (`sms_proj` ASC);


-- 2016-04-13 14:51:07 添加配额内正常发送短信数量字段和超过配额发送的短信数量字段。
ALTER TABLE `sys_sms` ADD `sms_sent` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '配额内正常发送的短信数目' ;
ALTER TABLE `sys_sms` ADD `sms_oversent` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '超过配额发送的短信数目' ;

-- 2016-04-05 段彬彬
-- 运维报警信息表增加四个字段
alter table ecmc_alarmmessage add cus_id varchar(32);
alter table ecmc_alarmmessage add prj_id varchar(32);
alter table ecmc_alarmmessage add dc_id varchar(32);
alter table ecmc_alarmmessage add obj_name varchar(100);
-- 运维报警对象表增加一个字段
alter table ecmc_alarmobject add cus_id varchar(32);
alter table ecmc_alarmobject add prj_id varchar(32);
alter table ecmc_alarmobject add dc_id varchar(32);
alter table ecmc_alarmobject add obj_name varchar(100);

-- 菜单表增加图标字段  --杨方军
ALTER TABLE `ecmc_sys_menu` ADD `icon`  varchar(100) NULL ;

-- 刘金钢20160330

ALTER TABLE `sys_oper_log`
MODIFY COLUMN `temp5`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问路径' AFTER `temp4`,
MODIFY COLUMN `temp6`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返回结果' AFTER `temp5`,
ADD COLUMN `resource_type`  varchar(64) NULL AFTER `temp6`,
ADD COLUMN `resource_name`  varchar(64) NULL AFTER `resource_type`,
ADD COLUMN `log_prjid`  varchar(100) NULL AFTER `resource_name`,
ADD COLUMN `resource_id`  varchar(100) NULL AFTER `log_prjid`;

-- 项目表增加机柜位置字段  --曾波
ALTER TABLE `cloud_project`
ADD COLUMN `cabinet_id`  varchar(100) NULL COMMENT '机柜ID',
ADD COLUMN `sms_count`  int(10) default 0 NULL COMMENT '短信数量' ;

-- 监控指标正则判断
-- 段彬彬
UPDATE  sys_data_tree SET para2 = '/^(?:0|[1-9][0-9]?|100)$/' WHERE node_id = '0010003001001' OR node_id ='0010003001002';

UPDATE  sys_data_tree SET para2 = '/^(0|([1-9][0-9]{0,4}))$/' WHERE node_id in ('0010003001003','0010003001004','0010003001005','0010003001006');


-- 修改运维报警管理中与云主机id相关的表字段长度，段彬彬
alter table ecmc_alarmmessage modify am_objectid varchar(36) ;
alter table ecmc_alarmobject modify ao_objectid varchar(36) ;

-- 将镜像格式存入数据字典 -段彬彬
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016', '镜像格式', '0007002', 1, '0', NULL, '1', NULL, NULL, NULL, 'ImageFormat', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016001', 'AKI-亚马逊内核镜像', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'AKI', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016002', 'AMI-Amazon Machine镜像', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'AMI', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016003', 'ARI-Amazon Ramdisk镜像', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'ARI', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016004', 'ISO-光盘镜像', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'ISO', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016005', 'QCOW2-QEMU模拟器', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'QCOW2', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016006', 'RAW', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'RAW', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016007', 'VDI', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'VDI', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016008', 'VHD', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'VHD', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007002016009', 'VMDK', '0007002016', 1, '0', NULL, '1', NULL, NULL, NULL, 'VMDK', NULL);

/** 20160504 update temp6 类型为text */
ALTER TABLE `sys_oper_log` MODIFY COLUMN `temp6`  text NULL DEFAULT NULL COMMENT '异常信息' AFTER `temp5`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cloud_outip`
--

DROP TABLE IF EXISTS `cloud_outip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_outip` (
  `ip_id` varchar(100) NOT NULL COMMENT 'IP编号',
  `dc_id` varchar(100) DEFAULT NULL COMMENT '数据中心ID',
  `net_id` varchar(100) DEFAULT NULL COMMENT '网络ID',
  `subnet_id` varchar(100) DEFAULT NULL COMMENT '子网ID',
  `route_id` varchar(100) DEFAULT NULL COMMENT '路由ID',
  `ip_version` char(1) DEFAULT NULL COMMENT 'IP版本4或6',
  `ip_address` varchar(100) DEFAULT NULL COMMENT 'IP地址',
  `create_name` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ip_id`),
  UNIQUE KEY `idx_ipaddress` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ecmc01'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-06 15:08:05


-- 云主机的权限调整
update sys_selfpower set power_name ='重启云主机',power_desc='重启云主机' where power_id ='18b111e2998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='升级配置',power_desc='升级配置' where power_id ='292e1b46998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='绑定公网IP',power_desc='绑定公网IP' where power_id ='36ce9848998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='解绑公网IP',power_desc='解绑公网IP' where power_id ='3a053652998511e5a260001a4a7ae4d4';

delete from sys_selfpower where power_id ='1c5b70f8998511e5a260001a4a7ae4d4';
delete from sys_selfpower where power_id ='221a95e6998511e5a260001a4a7ae4d4';

INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)VALUES(REPLACE (uuid(), '-', ''),'挂载云硬盘','host_bindVolume',111028,'87bdd9c67c5711e58542001a4a7ae4d4','挂载云硬盘');
INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)VALUES(REPLACE (uuid(), '-', ''),'查看监控','host_showMonitor',111029,'87bdd9c67c5711e58542001a4a7ae4d4','查看监控');

INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state)(SELECT REPLACE (uuid(), '-', '') AS rp_id,r.role_id AS role_id,p.power_id AS power_id,'1' AS rp_state FROM sys_selfrole r, sys_selfpower p WHERE (r.role_name = '超级管理员' or r.role_name ='管理员')AND p.power_route IN ('host_bindVolume','host_showMonitor'));
INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state)(SELECT REPLACE (uuid(), '-', '') AS rp_id,r.role_id AS role_id,p.power_id AS power_id,'1' AS rp_state FROM sys_selfrole r, sys_selfpower p WHERE (r.role_name = '普通用户')AND p.power_route IN ('host_showMonitor'));

delete from sys_selfrolepower where power_id ='1c5b70f8998511e5a260001a4a7ae4d4';
delete from sys_selfrolepower where power_id ='221a95e6998511e5a260001a4a7ae4d4';

-- 云硬盘的权限调整
INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state) (SELECT REPLACE (uuid(), '-', '') as rp_id,r.role_id as role_id,p.power_id as power_id,'1' as rp_state FROM sys_selfrole r,sys_selfpower p WHERE r.role_name = '普通用户' AND p.power_route IN ('disk_view','disk_addSnap','snap_view'));

-- 删除 512MB的内存
delete from sys_data_tree where node_id='0007002001001001';
-- 云主机状态  错误 -- 故障
update sys_data_tree set node_name='故障' where node_id='0007002004006' and node_name='错误';
-- 云主机状态  关机  已关机
update sys_data_tree set node_name='已关机' where node_id='0007002004008' and node_name='关机';
-- 云主机状态  软重启中  重启中
update sys_data_tree set node_name='重启中' where node_id='0007002004012' and node_name='软重启中';
-- 预处理中、待确定、确认调整中 修改为  升级中
update sys_data_tree set node_name='升级中' where node_id in ('0007002004014','0007002004015','0007002004016') and node_name<>'升级中'; 
-- 删除硬重启
delete from sys_data_tree where node_id='0007002004013';
-- 删除取消调整中
delete from sys_data_tree where node_id='0007002004017';
	
-- 总览资源类型调整20160506 周海涛
update sys_data_tree set node_name ='计算节点' where node_id='0007002015001';
update sys_data_tree set node_name ='CPU' where node_id='0007002015002';
update sys_data_tree set node_name ='自定义镜像' where node_id='0007002015009';
update sys_data_tree set node_name ='私有网络' where node_id='0007002015011';
delete from sys_data_tree where node_id= '0007002015014';

-- 然后点击数据字典 缓存同步

-- 同步OutIp的数据结构调整
ALTER TABLE `cloud_route`
ADD COLUMN `gateway_ip`  varchar(100) NULL AFTER `network_id`;
ALTER TABLE `cloud_outip`
CHANGE COLUMN `route_id` `used_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用类型' AFTER `subnet_id`;

-- 添加dns字段
ALTER TABLE cloud_subnetwork ADD COLUMN dns  varchar(100) NULL AFTER out_label_rule_id;

update cloud_subnetwork set dns = '114.114.114.114' ;

-- ecmc镜像--
ALTER TABLE cloud_image MODIFY image_name VARCHAR (100) BINARY;

-- 代码中，该字段放置的是公司中文名称，在客户表中，公司中文名称长度为255，而display_name长度为50.
-- 修改到255，以防止某些客户公司中文名称过长（>50）点击开通时插入数据库异常。 张帆 2016-05-24 14:44:21
ALTER TABLE `obs_user` modify column `display_name` varchar(255);

-- 工单新增配额，短信条数配额 陈鹏飞
alter   table   work_quota   add   quota_sms_num  int(11) DEFAULT 0;

alter   table   work_opinion   add   is_ecmc_cre  varchar(32) DEFAULT 0;
UPDATE work_opinion wo SET wo.is_ecmc_cre = '1' WHERE wo.cre_user_id IN ( SELECT ssu.user_id FROM sys_selfuser ssu );


-- 2016/05/31  刘金钢 outip查询优化，新增索引--
-- cloud_outip: 

ALTER TABLE `cloud_outip` ADD INDEX idx_ip_id(`ip_id`);

ALTER TABLE `cloud_outip` ADD INDEX idx_used_type(`used_type`);

ALTER TABLE `cloud_outip` ADD INDEX idx_dc_id(`dc_id`);

ALTER TABLE `cloud_outip` ADD INDEX idx_net_id(`net_id`);


-- cloud_floatip

ALTER TABLE `cloud_floatip` ADD INDEX idx_resource_id(`resource_id`);

ALTER TABLE `cloud_floatip` ADD INDEX idx_flo_ip(`flo_ip`);

ALTER TABLE `cloud_floatip` ADD INDEX idx_net_id(`net_id`);

ALTER TABLE `cloud_floatip` ADD INDEX idx_dc_id(`dc_id`);


-- cloud_project

ALTER TABLE `cloud_project` ADD INDEX idx_prj_name(`prj_name`);

ALTER TABLE `cloud_project` ADD INDEX idx_project_id(`prj_id`);


-- sys_selfcustomer

ALTER TABLE `sys_selfcustomer` ADD INDEX idx_cus_org(`cus_org`);


-- cloud_vm

ALTER TABLE `cloud_vm` ADD INDEX idx_vm_id(`vm_id`);

-- dc_datacenter

ALTER TABLE `dc_datacenter` ADD INDEX idx_datacenter_id(`id`);

/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc_sys_init_test

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-06-08 13:32:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ecmc_sys_authority`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_authority`;
CREATE TABLE `ecmc_sys_authority` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  `permission` text NOT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  `lock` char(1) DEFAULT '0' COMMENT '是否加锁，0:false 可被分配分配给角色、删除;1：true 不可被分配给角色、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_authority
-- ----------------------------
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f79d5b10001', '查询客户', '列表展示、查询和查看详情', '2016-04-29 08:45:00', 'ff808081543cbe2701543cceba910000', '1', 'ui:customer_query;\nhttp:/ecmc/customer/customeroverview.do;\nhttp:/ecmc/customer/getcustomerlist.do;\nhttp:/ecmc/project/getprojectbycustomer.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/generateprojectname.do;\nhttp:/ecmc/project/hasprjbycusanddc.do;\nhttp:/ecmc/customer/resetcusadminpass.do;\nhttp:/ecmc/project/getprojectpool.do;\nhttp:/ecmc/project/getvmresource.do;\nhttp:/ecmc/project/getvolumeresource.do;\nhttp:/ecmc/project/getnetresource.do;\nhttp:/ecmc/project/getresourcesforexcel.do;\nhttp:/ecmc/project/createexcel.do;\nhttp:/ecmc/customer/getcuswithadminbyid.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7aa40d0003', '创建客户', null, '2016-04-29 08:45:53', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_create;\nui:customer_create;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/project/createproject.do;\nhttp:/ecmc/project/createprojectonly.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7b1fde0005', '编辑客户', null, '2016-04-29 08:46:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:customer_modify;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/customer/modifycustomer.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7bc0ae0007', '编辑项目', null, '2016-04-29 08:47:06', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_modify;\nhttp:/ecmc/project/getprojectbyid.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/modifyproject.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7c3e5c0009', '删除项目', null, '2016-04-29 08:47:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_delete;\nhttp:/ecmc/project/deleteproject.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7f8d66000b', '查询权限', '列表展示、查询和查看详情', '2016-04-29 08:51:15', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_query;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/findauthoritylist.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7ff16c000d', '创建权限', null, '2016-04-29 08:51:41', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_create;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/createauthority.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8079ed000f', '编辑权限', null, '2016-04-29 08:52:15', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_modify;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/modifyauthority.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f80d1980011', '删除权限', null, '2016-04-29 08:52:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_delete;\nhttp:/ecmc/system/authority/deleteauthority.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f826e99004f', '查询机构', '列表展示、查询和查看详情', '2016-04-29 08:54:24', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_query;\nhttp:/ecmc/system/depart/getdeparttreegrid.do;\nhttp:/ecmc/system/depart/getdeparttree.do;\nhttp:/ecmc/system/depart/getdepartbyid.do', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f82c4d50051', '创建机构', null, '2016-04-29 08:54:46', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_create;\nhttp:/ecmc/system/depart/createdepart.do;\nhttp:/ecmc/system/depart/checkdepartcode.do;', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f83259c0053', '编辑机构', null, '2016-04-29 08:55:11', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_modify;\nhttp:/ecmc/system/depart/modifydepart.do;\nhttp:/ecmc/system/depart/checkdepartcode.do;', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8377fe0055', '删除机构', null, '2016-04-29 08:55:32', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_delete;\nhttp:/ecmc/system/depart/deldepart.do;', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f840aaf0057', '查询菜单', '列表展示、查询和查看详情', '2016-04-29 08:56:09', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_query;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8470cc0059', '创建菜单', null, '2016-04-29 08:56:35', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_create;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/menu/createmenu.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8703f0005b', '编辑菜单', null, '2016-04-29 08:59:24', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_modify;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/menu/modifymenu.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f877367005d', '删除菜单', null, '2016-04-29 08:59:53', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_delete;\nhttp:/ecmc/system/menu/checkfordel.do;\nhttp:/ecmc/system/menu/deletemenu.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f880c13005f', '查询角色', null, '2016-04-29 09:00:32', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_query;\nhttp:/ecmc/system/role/findrolelist.do;\nhttp:/ecmc/system/role/findroleselectlist.do;\nhttp:/ecmc/system/role/getroledetail.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8873d60061', '创建角色', null, '2016-04-29 09:00:58', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_create;\nhttp:/ecmc/system/role/checkrolename.do;\nhttp:/ecmc/system/role/createrole.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f88bdaa0063', '编辑角色', null, '2016-04-29 09:01:17', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_modify;\nhttp:/ecmc/system/role/checkrolename.do;\nhttp:/ecmc/system/role/modifyrole.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f89384c0065', '删除角色', null, '2016-04-29 09:01:49', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_delete;\nhttp:/ecmc/system/role/deleterole.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f89e5230067', '配置权限', '配置角色拥有哪些权限', '2016-04-29 09:02:33', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_distributeAuth;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/getallenableauth.do;\nhttp:/ecmc/system/role/getroledetail.do;\nhttp:/ecmc/system/role/saveroleauth.do', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8ae39a0069', '查询用户', '列表展示、查询和查看详情', '2016-04-29 09:03:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_query;\nhttp:/ecmc/system/user/finduserlist.do;\nhttp:/ecmc/system/user/getuserdetail.do;\nhttp:/ecmc/system/depart/getdeparttreegrid.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8b47c3006b', '创建用户', null, '2016-04-29 09:04:04', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_create;\nhttp:/ecmc/system/user/checkaccount.do;\nhttp:/ecmc/system/user/createuser.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8be3b7006d', '编辑用户', null, '2016-04-29 09:04:43', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_modify;\nhttp:/ecmc/system/user/checkaccount.do;\nhttp:/ecmc/system/user/modifyuser.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8c52b7006f', '删除用户', null, '2016-04-29 09:05:12', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_delete;\nhttp:/ecmc/system/user/deleteuser.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eea53c15b650153c15cadb70000', '创建云主机', '创建云主机3', '2016-03-30 17:32:44', 'dev', '1', 'ui:addVm; http:/ecmc/vm/createVm.do', 'menuId111', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fd895390015', '消息查询', '消息管理的查询', '2016-04-29 10:28:30', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_query;http:/ecmc/system/news/getnewslist.do;http:/ecmc/system/news/getCount.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fd941540017', '创建消息', '消息管理创建消息', '2016-04-29 10:29:14', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_create;http:/ecmc/system/news/createnews.do;\nhttp:/ecmc/system/news/getList.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fd9ac380019', '修改消息', '消息管理-修改消息', '2016-04-29 10:29:41', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_modify;http:/ecmc/system/news/getTimeFlag.do;\nhttp:/ecmc/system/news/updateNewsSendVOE.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fda1beb001b', '删除消息', '消息管理-删除消息', '2016-04-29 10:30:10', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_delete;http:/ecmc/system/news/getTimeFlag.do;\nhttp:/ecmc/system/news/deleteById.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe68b600055', '公告查询', '公告管理查询', '2016-04-29 10:43:45', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_query;http:/ecmc/system/notice/listNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe723ef0057', '创建公告', '公告管理-创建公告', '2016-04-29 10:44:24', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_create;http:/ecmc/system/notice/createNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe792b50059', '修改公告', '公告管理-修改公告', '2016-04-29 10:44:52', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_modify;http:/ecmc/system/notice/modifyNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe7fccd005b', '删除公告', '公告管理-删除公告', '2016-04-29 10:45:19', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_delete;http:/ecmc/system/notice/deleteNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545feb3301005f', '数据字典查询', '数据管理', '2016-04-29 10:48:50', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_query;http:/ecmc/system/enum/getdatatreenav.do;\nhttp:/ecmc/system/enum/getdatatreelist.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545febaaf80061', '创建数据字典', '数据管理-创建数据字典', '2016-04-29 10:49:20', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_create;http:/ecmc/system/enum/createdatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fec16a20063', '编辑数据字典', '数据管理-编辑数据字典', '2016-04-29 10:49:48', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_modify;http:/ecmc/system/enum/modifydatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fec79ae0065', '删除数据字典', '数据管理-删除数据字典', '2016-04-29 10:50:13', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_delete;http:/ecmc/system/enum/deletedatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fece84a0067', '缓存同步', '数据字典-缓存同步', '2016-04-29 10:50:42', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_syncCache;http:/ecmc/system/enum/syncdatatree.do;\nhttp:/ecmc/virtual/tag/syncRedisWithDB.do;\nhttp:/ecmc/monitor/alarm/resyncsmsquotacache.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fed7a6c0069', '节点排序', '数据管理-节点排序', '2016-04-29 10:51:19', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_orderBy;\nhttp:/ecmc/system/enum/getdatatreechildren.do;\nhttp:/ecmc/system/enum/sortdatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545ff66b01546011b98a0020', '日志查询', '日志管理-列表', '2016-04-29 11:30:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_log_query;http:/ecmc/overview/getallprojectlist.do;http:/ecmc/system/log/getecmcloglist.do;http:/ecmc/system/log/getOperLog.do;http:/ecmc/system/log/getecscLogList.do;\nhttp:/ecmc/obs/obsview/syncobsuser.do;', 'ff8080815438ac44015438dc6dfa0020', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fe908d50016', '查询', '查询，详情。', '2016-04-29 10:46:28', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_query;\nhttp:/ecmc/physical/datacenter/querydatacenter.do;\nhttp:/ecmc/physical/datacenter/querybyid.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fe9d58c0018', '编辑', '编辑', '2016-04-29 10:47:20', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_modify;\nhttp:/ecmc/physical/datacenter/querybyid.do;\nhttp:/ecmc/physical/datacenter/updatedatacenter.do;\nhttp:/ecmc/physical/datacenter/checkNameExistOfEdit.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fea5416001a', '创建', '创建数据中心', '2016-04-29 10:47:53', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_create;\nhttp:/ecmc/physical/datacenter/createdatacenter.do;\nhttp:/ecmc/physical/datacenter/checkNameExist.do;\nhttp:/ecmc/physical/datacenter/checkCabinetNum.do;\nhttp:/ecmc/physical/datacenter/checkDcAddressExist.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545feb443f001d', '删除', '删除数据中心', '2016-04-29 10:48:54', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_delete;\nhttp:/ecmc/physical/datacenter/checkcannotdelete.do;\nhttp:/ecmc/physical/datacenter/deletedatacenter.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545febd38d001f', '同步数据中心', '同步数据中心', '2016-04-29 10:49:31', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_sync;\nhttp:/ecmc/physical/datacenter/syndatacenter.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600583400015', '查询服务器', '查询，详情', '2016-04-29 11:17:34', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_query;\nhttp:/ecmc/physical/server/queryserver.do;\nhttp:/ecmc/physical/server/getByDcServerId.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600795750018', '编辑服务器', '编辑服务器，编辑前查询', '2016-04-29 11:19:50', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_modify;\nhttp:/ecmc/physical/server/checkNameExist.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/getByServerModelId.do;\nhttp:/ecmc/physical/server/updateserver.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff284015460082bb7001a', '新增服务器', '新增服务器，及数据验证', '2016-04-29 11:20:28', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_create;\nhttp:/ecmc/physical/server/checkNameExist.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/getByServerModelId.do;\nhttp:/ecmc/physical/server/saveserver.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600abc0a001e', '删除服务器', '删除服务器验证', '2016-04-29 11:23:16', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_delete;\nhttp:/ecmc/physical/server/deleteserver.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600cf4880021', '新增机柜', '新增机柜', '2016-04-29 11:25:42', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_create;\nhttp:/ecmc/physical/cabinet/addcabinet.do;\nhttp:/ecmc/physical/cabinet/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/checkDataCenter.do;\nhttp:/ecmc/physical/cabinet/getcanUseCabinet.do;\nhttp:/ecmc/physical/cabinet/checkTotalCapacity.do;\nhttp:/ecmc/physical/cabinet/getStateByCabinet.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff28401546010327d0024', '编辑机柜', '编辑机柜', '2016-04-29 11:29:14', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_modify;\nhttp:/ecmc/physical/cabinet/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/checkDataCenter.do;\nhttp:/ecmc/physical/cabinet/getcanUseCabinet.do;\nhttp:/ecmc/physical/cabinet/checkTotalCapacity.do;\nhttp:/ecmc/physical/cabinet/getStateByCabinet.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/cabinet/updatecabinet.do;\nhttp:/ecmc/physical/cabinet/queryById.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff28401546021065d0026', '查看机柜', '查看，详情', '2016-04-29 11:47:37', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_query;\nhttp:/ecmc/physical/cabinet/querycabinet.do;\nhttp:/ecmc/physical/cabinet/queryEquById.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eef54745b0301547460906e0004', 'IP查看', 'IP-IP查看', '2016-05-03 10:09:26', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:phy_outip_query;http:/ecmc/overview/getallcustomerlist.do;http:/ecmc/virtual/cloudoutip/outiplist.do;http:/ecmc/virtual/cloudoutip/getOutip.do;', 'ff8080815438ac44015438d3aa7a0013', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609040600001', '删除机柜', '删除', '2016-04-29 13:49:07', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_delete;\nhttp:/ecmc/physical/cabinet/deletecabinet.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609110f80004', '查询交换机', '查询，详情', '2016-04-29 13:50:00', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_query;\nhttp:/ecmc/physical/switch/queryswitch.do;\nhttp:/ecmc/physical/switch/queryById.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e1301546093b4ad0007', '新增交换机', '新增交换机', '2016-04-29 13:52:53', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_create;\nhttp:/ecmc/physical/switch/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/physical/switch/addswitch.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e1301546096ee16000b', '编辑交换机', '编辑交换机', '2016-04-29 13:56:24', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_modify;\nhttp:/ecmc/physical/switch/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/physical/switch/updateswitch.do;\nhttp:/ecmc/physical/switch/queryById.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460978752000d', '删除交换机', '删除', '2016-04-29 13:57:03', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_delete;\nhttp:/ecmc/physical/switch/deleteswitch.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609a88070010', '新增存储', '新增存储', '2016-04-29 14:00:20', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_create;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/physical/storage/queryDcStorageCreate.do;\nhttp:/ecmc/physical/storage/checkNameExist.do;\nhttp:/ecmc/physical/storage/getcanUseCabinet.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609b23ab0012', '查询存储', '查询，详情', '2016-04-29 14:01:00', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_query;\nhttp:/ecmc/physical/storage/queryDcStorage.do;\nhttp:/ecmc/physical/storage/queryDcStorageById.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609d629b0015', '编辑存储', '编辑存储', '2016-04-29 14:03:27', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_modify;\nhttp:/ecmc/physical/storage/queryDcStorageById.do;\nhttp:/ecmc/physical/storage/queryDcStorageUpdate.do;\nhttp:/ecmc/physical/storage/checkNameExistOfEdit.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609fd4be001b', '查询防火墙', '查询，详情', '2016-04-29 14:06:08', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_query;\nhttp:/ecmc/physical/firewall/queryfirewall.do;\nhttp:/ecmc/physical/firewall/queryById.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a114ab001d', '新增防火墙', '新增防火墙', '2016-04-29 14:07:29', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_create;\nhttp:/ecmc/physical/firewall/createfirewall.do;\nhttp:/ecmc/physical/firewall/checkNameExist.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a233de001f', '编辑防火墙', '编辑防火墙', '2016-04-29 14:08:43', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_modify;\nhttp:/ecmc/physical/firewall/checkNameExistOfEdit.do;\nhttp:/ecmc/physical/firewall/queryById.do;\nhttp:/ecmc/physical/firewall/updatefirewall.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a2988b0021', '删除防火墙', '删除防火墙', '2016-04-29 14:09:09', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_delete;\nhttp:/ecmc/physical/firewall/deletefirewall.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a473cf0024', '查询型号维护', '查询，详情', '2016-04-29 14:11:10', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_query;\nhttp:/ecmc/physical/servermodel/querylist.do;\n\nhttp:/ecmc/physical/servermodel/getDcServerOne.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a76d310026', '新增型号维护', '新增型号维护', '2016-04-29 14:14:25', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_create;\nhttp:/ecmc/physical/servermodel/createModel.do;\nhttp:/ecmc/physical/servermodel/checkNameExist.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a7dfd60028', '编辑型号维护', '编辑型号维护', '2016-04-29 14:14:55', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_modify;\n http:/ecmc/physical/servermodel/getDcServerOne.do;\n http:/ecmc/physical/servermodel/checkNameExistOfEdit.do;\n http:/ecmc/physical/servermodel/updateModel.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a98624002b', '删除型号维护', '删除型号维护', '2016-04-29 14:16:43', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_delete;\n http:/ecmc/physical/servermodel/checkUseOrNo.do;\n http:/ecmc/physical/servermodel/deleteModel.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460a057880009', '负载均衡', '负载均衡一级菜单是否可见\n负载均衡器是否可见\n健康检查是否可见', '2016-04-29 14:06:41', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460a6814c000c', '负载均衡器创建', '创建负载均衡器', '2016-04-29 14:13:25', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_c;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/virtual/floatip/getNetworkByPrj.do;\nhttp:/ecmc/virtual/floatip/getSubnetByNetwork.do;\nhttp:/ecmc/virtual/loadbalance/pool/checkpoolname.do;\nhttp:/ecmc/virtual/loadbalance/pool/createBalancer.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460ac65b6000d', '负载均衡器查询', '查询负载均衡器列表', '2016-04-29 14:19:51', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_r;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/virtual/loadbalance/pool/querypool.do;\nhttp:/ecmc/virtual/loadbalance/pool/getLoadBalanceById.do;\nhttp:/ecmc/virtual/loadbalance/member/getMemberList.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460b43a81000e', '负载均衡器编辑', '编辑负载均衡器', '2016-04-29 14:28:24', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_u;\nhttp:/ecmc/virtual/loadbalance/pool/checkpoolname.do;\nhttp:/ecmc/virtual/loadbalance/pool/updateBalancer.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460b56dd1000f', '负载均衡器删除', '删除负载均衡器', '2016-04-29 14:29:43', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_d;\nhttp:/ecmc/virtual/loadbalance/pool/deleteBalancer.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bb30970010', '负载均衡器绑定公网IP', '', '2016-04-29 14:36:01', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_bindfloip;\nhttp:/ecmc/virtual/floatip/getUnBindFloatIp.do;\nhttp:/ecmc/virtual/floatip/bindResource.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bbbafe0011', '负载均衡器解绑公网IP', '', '2016-04-29 14:36:36', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_unbindfloip;\nhttp:/ecmc/virtual/floatip/unbundingResource.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bdcd3c0012', '负载均衡器健康检查', '', '2016-04-29 14:38:52', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_hm;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/getMonitorListByPool.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/bindHealthMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bea2d40013', '负载均衡器添加成员', null, '2016-04-29 14:39:46', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_addmember;\nhttp:/ecmc/virtual/loadbalance/member/getMemeberListBySubnet.do;\nhttp:/ecmc/virtual/loadbalance/member/checkMemberExsit.do;\nhttp:/ecmc/virtual/loadbalance/member/addMember.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bf305c0014', '负载均衡器编辑成员', null, '2016-04-29 14:40:23', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_editmember;\nhttp:/ecmc/virtual/loadbalance/member/updateMember.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bfab040015', '负载均衡器删除成员', null, '2016-04-29 14:40:54', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_deletemember;\nhttp:/ecmc/virtual/loadbalance/member/deleteMember.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c0b52f0016', '健康检查查询', null, '2016-04-29 14:42:02', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_r;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/listmonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c111230017', '健康检查创建', null, '2016-04-29 14:42:26', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_c;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/checkhealthmonitorname.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/createMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c1753c0018', '健康检查编辑', null, '2016-04-29 14:42:51', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_u;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/checkhealthmonitorname.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/updatemonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c1b04d0019', '健康检查删除', null, '2016-04-29 14:43:06', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_d;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/deleteHealthMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe510154600f2ecf00c7', '创建安全组', '创建安全组', '2016-04-29 11:28:08', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_create;\nhttp:/ecmc/virtual/securitygroup/createsecuritygroup.do;\nhttp:/ecmc/virtual/securitygroup/checksecuritygroupname.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546086b8c8019e', '管理规则', '安全组管理规则：添加和删除规则', '2016-04-29 13:38:42', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_managerule;\nhttp:/ecmc/virtual/securitygrouprule/createrule.do;\nhttp:/ecmc/virtual/securitygrouprule/deleterulebyid.do;\nhttp:/ecmc/virtual/securitygroup/listallgroups.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe510154608878dc01a1', '删除安全组', '删除安全组', '2016-04-29 13:40:37', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_delete;\nhttp:/ecmc/virtual/securitygroup/deletesecuritygroup.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe510154608fbe0401a5', '查看防火墙', '查看防火墙：防火墙、防火墙策略和防火墙规则都可查看、查询及查看相关详情', '2016-04-29 13:48:33', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_query;\nhttp:/ecmc/virtual/cloudfirewall/list.do;\nhttp:/ecmc/virtual/cloudfwpoliy/querylist.do;\nhttp:/ecmc/virtual/cloudfwrule/list.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getByFwrIdList.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getByFwrId.do;\nhttp:/ecmc/virtual/cloudfwpoliy/editFwRule.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546092b20a01a7', '创建防火墙', '创建防火墙 ：防火墙、防火墙策略和防火墙规则都可创建', '2016-04-29 13:51:47', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_create;\nhttp:/ecmc/virtual/cloudfirewall/createFireWall.do;\nhttp:/ecmc/virtual/cloudfwpoliy/createPolicy.do;\nhttp:/ecmc/virtual/cloudfwrule/createfwRule.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getFwpListByPrjId.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546094514001a9', '编辑防火墙', '编辑防火墙：编辑防火墙、防火墙策略和防火墙规则', '2016-04-29 13:53:33', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_modify;\nhttp:/ecmc/virtual/cloudfirewall/updateFireWall.do;\nhttp:/ecmc/virtual/cloudfwpoliy/updatePolicy.do;\nhttp:/ecmc/virtual/cloudfwrule/updatefwRule.do;\nhttp:/ecmc/virtual/cloudfwrule/checkFwRuleName.do;\nhttp:/ecmc/virtual/cloudfwpoliy/queryIdandName.do;\nhttp:/ecmc/virtual/cloudfirewall/checkFirewallName.do;\nhttp:/ecmc/virtual/cloudfwpoliy/checkFwPolicyName.do;\nhttp://ecmc/virtual/cloudfwpoliy/getPolicyListByDcIdPrjId.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546095699801ab', '删除防火墙', '删除防火墙：删除和修改防火墙、防火墙策略和防火墙规则', '2016-04-29 13:54:45', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_delete;\nhttp:/ecmc/virtual/cloudfirewall/deleteFireWall.do;\nhttp:/ecmc/virtual/cloudfwpoliy/deletePolicy.do;\nhttp:/ecmc/virtual/cloudfwrule/deletefwRule.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe51015460c63b250318', '查看安全组', '查看安全组：没有此权限则此页签不展示', '2016-04-29 14:48:04', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_qurey;\nhttp:/ecmc/virtual/securitygroup/querysecuritygroup.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/securitygroup/getsecuritygroupbyid.do;\nhttp:/ecmc/virtual/securitygroup/getrulesbysgid.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909054754fc4015475ce5a4a0126', '编辑安全组', '编辑安全组', '2016-05-03 16:48:58', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_modify;\nhtttp:/ecmc/virtual/securitygroup/checksecuritygroupname.do;\nhttp:/ecmc/virtual/securitygroup/updatesecuritygroup.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547af70d5a0004', '云硬盘_查看', '查看云硬盘，包含云硬盘列表、查询及详情。三个一体化', '2016-05-04 16:51:31', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_query;\nhttp:/ecmc/cloud/volume/getvolumelist.do;\nhttp:/ecmc/cloud/volume/getvolumebyid.do;\nhttp:/ecmc/cloud/snapshot/getsnaplistbyvolid.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b05cb5a00b9', '云硬盘_创建', '用于云硬盘创建的权限', '2016-05-04 17:07:37', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_create;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/cloud/volume/getvolumebyname.do;\nhttp:/ecmc/cloud/snapshot/addvolume.do;\nhttp:/ecmc/cloud/volume/addvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b0d78f002c1', '云硬盘_删除', '用于云硬盘删除的权限', '2016-05-04 17:16:01', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_delete;\nhttp:/ecmc/cloud/volume/deletevolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b1ba72b037d', '云硬盘_编辑', '用于云硬盘编辑的权限', '2016-05-04 17:31:30', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_modify;\nhttp:/ecmc/cloud/volume/getvolumebyname.do;\nhttp:/ecmc/cloud/volume/updatevolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b2d463b0439', '云硬盘_挂载', '用于云硬盘挂载的权限', '2016-05-04 17:50:45', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_bind;\nhttp:/ecmc/cloud/vm/getcanbindcloudvmList.do;\nhttp:/ecmc/cloud/vm/getdiskcountbyvm.do;\nhttp:/ecmc/cloud/volume/bindvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b3bb16a04f0', '云硬盘_解绑', '用于云硬盘解绑的权限', '2016-05-04 18:06:30', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_debind;\nhttp:/ecmc/cloud/volume/debindvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b46bc8105ab', '云硬盘_创建快照', '用于云硬盘创建快照的权限', '2016-05-04 18:18:33', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_cresnap;\nhttp:/ecmc/cloud/snapshot/getsnapbyname.do;\nhttp:/ecmc/cloud/snapshot/addsnapshot.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b4c16560666', '云硬盘快照_查看', '用于云硬盘快照查看权限', '2016-05-04 18:24:24', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_snapshot;\nhttp:/ecmc/cloud/snapshot/getsnapshotlist.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b5454420723', '云硬盘快照_编辑', '用于硬盘快照编辑的权限', '2016-05-04 18:33:24', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:snapshot_modify;\nhttp:/ecmc/cloud/snapshot/getsnapbyname.do;\nhttp:/ecmc/cloud/snapshot/updatesnapshot.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b5b42d607e8', '云硬盘快照_删除', '用于硬盘快照删除的权限', '2016-05-04 18:40:59', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:snapshot_delete;\nhttp:/ecmc/cloud/snapshot/deletesnap.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bf9c69d0006', '工单邮件_接受所有工单', '新建任何工单时可以接收邮件的人', '2016-05-09 11:43:25', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptAllOrder;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bfba88c0007', '工单邮件_接受普通类工单', '有普通工单权限的人（新建，取消，超时时接受邮件的权限）', '2016-05-09 11:42:29', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptMormalOrder;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bfccdf00008', '工单邮件_接受特殊类工单', '特殊类别工单权限的人（新建，取消，超时时接受邮件的权限）', '2016-05-09 11:40:44', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptSpecialOrder;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bfde6460009', '工单邮件_接受未按时受理或响应的工单', '未按时受理或响应的工单发送邮件能接受的人', '2016-05-09 11:41:55', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptOrderIfNoOneProcess;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092544c795d01544ca94fe60000', '工单_修改别人创建的工单', '修改ecmc用户创建的工单', '2016-05-09 11:36:05', '40289092543bd6a801543c8a2fd7002a', '1', 'ui:workorder_update;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/updateecmcworkorder.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547a07b201547a5098d50009', '外网-删除子网', '删除外部网络子网', '2016-05-04 13:49:42', '40289092543bcc8c01543bd161c40000', '1', 'ui:outsubnet_delete;\nhttp:/ecmc/virtual/outsubnetwork/deletesubnetwork.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f8f52290243', '外网-查看', '查看网布网络', '2016-05-05 14:16:19', '40289092543bcc8c01543bd161c40000', '1', 'ui:outnetwork_query;\nhttp:/ecmc/virtual/networkout/queryoutnetwork.do;\nhttp:/ecmc/virtual/networkout/getoutnetworkdetail.do;\nhttp:/ecmc/virtual/outsubnetwork/querysubnetwork.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f8fde830245', '外网-添加子网', '添加子网外网', '2016-05-05 14:16:55', '40289092543bcc8c01543bd161c40000', '1', 'ui:outsubnet_add;\nhttp:/ecmc/virtual/outsubnetwork/addsubnetwork.do;\nhttp:/ecmc/virtual/outsubnetwork/checkoutsubnetname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f9086650247', '外网-编辑子网', '编辑外网子网', '2016-05-05 14:17:38', '40289092543bcc8c01543bd161c40000', '1', 'ui:outsubnet_edit;\nhttp:/ecmc/virtual/outsubnetwork/updatesubnetwork.do;\nhttp:/ecmc/virtual/outsubnetwork/checkoutsubnetname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f91499d0249', '外网-编辑网络', '编辑外部网络', '2016-05-05 14:18:28', '40289092543bcc8c01543bd161c40000', '1', 'ui:outnetwork_edit;\nhttp:/ecmc/virtual/networkout/modoutnetwork.do;\nhttp:/ecmc/virtual/networkout/checknetname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909254958b4901549596b3a30112', '工单参与人查询_工单参与人员', '参与工单流程的人员', '2016-05-09 11:44:02', '40289092543bcc8c01543bd161c40000', '1', 'java:WorkorderAllUser', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909254c171590154c172f4f00001', '工单_可被求助', '可以被求助的工程师', '2016-05-18 09:20:17', '40289092543bcc8c01543bd161c40000', '1', 'java:trueToOtherUser', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890955460f136015460f8d07b0001', '资源总览查看', '总览-资源总览查询', '2016-04-29 15:43:19', 'ff808081543cbe2701543cceba910000', '1', 'ui:ecmc_overview_dcList;\nhttp:/ecmc/overview/getdcresourcelist.do;\nhttp:/ecmc/overview/getresourcetypelist.do;', 'ff8080815438ac44015438bb40b20000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890955460f136015460fdea770006', '项目总览查看', '总览-项目总览-查看', '2016-04-29 15:48:54', 'ff808081543cbe2701543cceba910000', '1', 'ui:ecmc_overview_prjList;\nhttp:/ecmc/overview/getprjresourcelist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;', 'ff8080815438ac44015438bb40b20000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995475666c0154756ae2d50003', '自定义镜像_查看', '查看自定义镜像，包含自定义镜像列表、查询及详情。三个一体化', '2016-05-03 15:00:19', 'ff808081543cbe2701543cceba910000', '1', 'ui:image_customimage;\nhttp:/ecmc/cloud/image/getimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995475666c0154756f31760006', '自定义镜像_编辑', '编辑自定义镜像', '2016-05-03 15:05:02', 'ff808081543cbe2701543cceba910000', '1', 'ui:customimage_edit;\nhttp:/ecmc/cloud/image/updatepersonimage.do;\nhttp:/ecmc/cloud/image/checkimagename.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995475666c0154757016ab0009', '自定义镜像_删除', null, '2016-05-03 15:06:00', 'ff808081543cbe2701543cceba910000', '1', 'ui:customimage_delete;\nhttp:/ecmc/cloud/image/deleteimage.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b427a1f0008', '公共镜像_查看', '查看、查询、详情', '2016-05-04 18:13:54', 'ff808081543cbe2701543cceba910000', '1', 'ui:image_publicimage;\nhttp:/ecmc/cloud/image/getconimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/vm/getallvmsyslist.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b43be70000a', '公共镜像_编辑', null, '2016-05-04 18:15:17', 'ff808081543cbe2701543cceba910000', '1', 'ui:publicimage_edit;\nhttp:/ecmc/cloud/image/updatepublicimage.do;\nhttp:/ecmc/cloud/image/checkimagename.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b44b481000c', '公共镜像_上传', null, '2016-05-04 18:16:20', 'ff808081543cbe2701543cceba910000', '1', 'ui:publicimage_add;\nhttp:/ecmc/cloud/image/createpublicimage.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/image/checkimagename.do;\nhttp:/ecmc/cloud/vm/getoslist.do;\nhttp:/ecmc/cloud/vm/getsystypelistbyos.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b456b78000e', '公共镜像_删除', null, '2016-05-04 18:17:07', 'ff808081543cbe2701543cceba910000', '1', 'ui:publicimage_delete;\nhttp:/ecmc/cloud/image/deleteimage.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154760f6fdf0030', '消除报警', '消除报警', '2016-05-03 18:00:03', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_alarm_remove;\nhttp:/ecmc/monitor/alarm/eraseecmcmsgbyids.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154761e15f000eb', '修改报警规则', '修改规则', '2016-05-03 18:16:03', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_alarm_modify;\nhttp:/ecmc/monitor/alarm/getjsonforecmcruleparams.do;\nhttp:/ecmc/monitor/alarm/getecmctriggeroperator.do;\nhttp:/ecmc/monitor/alarm/getecmctriggertimes.do;\nhttp:/ecmc/monitor/alarm/getzblistbyitem.do;\nhttp:/ecmc/monitor/alarm/updateecmcrule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154762212950193', '创建报警规则', '创建和复制规则、管理报警对象和报警联系人', '2016-05-03 18:20:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_alarm_create;\nhttp:/ecmc/monitor/alarm/addecmcalarmrule.do;\nhttp:/ecmc/monitor/alarm/copyecmcalarmrule.do;\nhttp:/ecmc/monitor/alarm/getecmcobjlistoutrule.do;\nhttp:/ecmc/monitor/alarm/getallconsgroupby.do;\nhttp:/ecmc/monitor/alarm/addecmcobjtorule.do;\nhttp:/ecmc/monitor/alarm/addecmcconstorule.do;\nhttp:/ecmc/monitor/alarm/removeecmcobjfromrule.do;\nhttp:/ecmc/monitor/alarm/removeecmcconfromrule.do;\nhttp:/ecmc/monitor/alarm/getallalarmcontacts.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba01547627e4a30242', '删除报警规则', '删除报警规则', '2016-05-03 18:26:46', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_alarm_delete;\nhttp:/ecmc/monitor/alarm/deleteecmcalarmrule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154764060810311', '创建联系人', '创建联系人', '2016-05-03 18:53:31', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_create;\nhttp:/ecmc/monitor/contact/checkecmcconname.do;\nhttp:/ecmc/monitor/contact/addecmccontact.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba015476458aed03c0', '编辑联系人', '编辑联系人', '2016-05-03 18:59:09', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_modify;\nhttp:/ecmc/monitor/contact/editecmccontact.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154766216ae046a', '更新通知方式', '更新通知方式', '2016-05-03 19:30:20', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_change;\nhttp:/ecmc/monitor/contact/updateecmcselection.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154766358c0046d', '删除联系人', '删除联系人', '2016-05-03 19:31:42', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_delete;\nhttp:/ecmc/monitor/contact/deleteecmccontact.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154766585e80515', '联系组查看', '查看联系组', '2016-05-03 19:34:05', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group;\nhttp:/ecmc/monitor/contact/getecmcgrouplist.do;\nhttp:/ecmc/monitor/contact/getecmcconpageingroup.do;\nhttp:/ecmc/monitor/contact/getecmcconlistoutgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476a3a9d20005', '创建联系组', '创建联系组', '2016-05-03 20:41:57', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_create;\nhttp:/ecmc/monitor/contact/checkecmcgroupname.do;\nhttp:/ecmc/monitor/contact/addecmcgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476a64fb200b3', '编辑联系组', '编辑联系组', '2016-05-03 20:44:51', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_modify;\nhttp:/ecmc/monitor/contact/editecmcgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476a95021015e', '添加/移除联系人', '添加/移除联系人', '2016-05-03 20:48:08', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_detail;\nhttp:/ecmc/monitor/contact/getecmcconlistoutgroup;\nhttp:/ecmc/monitor/contact/getecmcconlistoutgroup.do;\nhttp:/ecmc/monitor/contact/removeecmcconfromgroup.do;\nhttp:/ecmc/monitor/contact/addecmccontogroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b003e4021a', '删除联系组', null, '2016-05-03 20:55:27', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_delete;\nhttp:/ecmc/monitor/contact/deleteecmcgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b3d19c02ca', '对象存储查看', '查看对象存储', '2016-05-03 20:59:36', 'ff808081543cbe2701543cceba910000', '1', 'ui:vir_obs;\nhttp:/ecmc/obs/obsview/getObs24View.do;\nhttp:/ecmc/obs/obsview/getTop10.do;\nhttp:/ecmc/obs/obsview/getObsView.do;\nhttp:/ecmc/obs/obsview/getChart.do;\nhttp:/ecmc/obs/obscustomer/getObsCustomer.do;\nhttp:/ecmc/obs/obscustomer/getObsInMonthUsed.do;\nhttp:/ecmc/obs/obscustomer/getAllBucketsByCusId.do;\nhttp:/ecmc/obs/obscustomer/getObsHistoryResources.do;\nhttp:/ecmc/obs/obscustomer/getObsUsedView.do;\nhttp:/ecmc/obs/obscustomer/getObsResources.do;', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b5dfd80379', '阈值设置', '阈值设置', '2016-05-03 21:01:51', 'ff808081543cbe2701543cceba910000', '1', 'ui:obs_threshold;\nhttp:/ecmc/obs/obsview/getThreshold.do;\nhttp:/ecmc/obs/obsview/setThreshold.do', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b8cebd042e', '配额设置', '配额设置', '2016-05-03 21:05:03', 'ff808081543cbe2701543cceba910000', '1', 'ui:obs_quota;\nhttp:/ecmc/obs/obscustomer/getQuota.do;\nhttp:/ecmc/obs/obscustomer/setQuota.do', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b2204b6001e', '公网ip查看', '列表展示和查询', '2016-05-04 17:38:27', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_query;\nhttp:/ecmc/virtual/floatip/getFloatIpList.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b27e43600d0', '公网IP分配', '分配公网IP', '2016-05-04 17:44:52', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_for;\nhttp:/ecmc/virtual/floatip/remainnum.do;\nhttp:/ecmc/virtual/floatip/checkeIpNow.do;\nhttp:/ecmc/virtual/floatip/allocateIptonum.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b3490c0018d', '公网IP绑定/解除绑定', '绑定/解除绑定', '2016-05-04 17:58:43', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_bind;\nhttp:/ecmc/virtual/network/getnetworklistbyprjid.do;\nhttp:/ecmc/virtual/subnetwork/getsubnetlistbynetid.do;\nhttp:/ecmc/virtual/floatip/getVmBySubNetWork.do;\nhttp:/ecmc/virtual/loadbalance/pool/getnotbindfloatippools.do;\nhttp:/ecmc/virtual/floatip/binDingVm.do;\nhttp:/ecmc/virtual/floatip/unBinDingVm.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b3ed0fb024d', '公网IP释放', '释放公网IP', '2016-05-04 18:09:54', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_release;\nhttp:/ecmc/virtual/floatip/deallocateFloatIp.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547e722201547eaa93350005', '云主机_创建', '创建云主机相关的后台接口', '2016-05-05 10:06:28', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_vm_create;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/cloud/vm/getprolistbydcid.do;\nhttp:/ecmc/cloud/vm/getsubnetlistbyprjid.do;\nhttp:/ecmc/syssetup/getmodellistbycustomer.do;\nhttp:/ecmc/cloud/vm/checkvmname.do;\nhttp:/ecmc/cloud/vm/getcpulist.do;\nhttp:/ecmc/cloud/vm/getramlistbycpu.do;\nhttp:/ecmc/cloud/vm/getimagelist.do;\nhttp:/ecmc/cloud/vm/createvm.do;\n\nhttp:/ecmc/cloud/vm/getoslist.do;\nhttp:/ecmc/cloud/vm/getsystypelistbyos.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547eb40e01547eb7ecb10179', '云主机_查看', '查看云主机相关的后台接口', '2016-05-05 10:21:03', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_query;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/cloud/vm/getvmpagelist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/cloud/vm/getallvmsyslist.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547eb40e01547eb94081017b', '云主机_删除', '删除云主机相关的后台接口', '2016-05-05 10:22:30', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_delete;\nhttp:/ecmc/cloud/vm/getimagebyid.do;\nhttp:/ecmc/cloud/vm/deletevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547eb40e01547ebf5f78024b', '云主机_详情', null, '2016-05-05 10:29:11', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_detail;\nhttp:/ecmc/cloud/vm/getvmbyid.do;\nhttp:/ecmc/cloud/volume/queryvolumesbyvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547ee7ef7a0003', '云主机_操作_云主机控制台', null, '2016-05-05 11:13:29', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_console;\nhttp:/ecmc/cloud/vm/consolevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547eee9ef700d6', '云主机_操作_查看监控', null, '2016-05-05 11:20:48', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_monitor;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0114bb01a6', '云主机_操作_启动云主机', null, '2016-05-05 11:40:57', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_startvm;\nhttp:/ecmc/cloud/vm/startvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f020df40275', '云主机_操作_关闭云主机', null, '2016-05-05 11:42:01', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_shutdownvm;\nhttp:/ecmc/cloud/vm/shutdownvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f02ed0d0277', '云主机_操作_重启云主机', null, '2016-05-05 11:42:58', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_restartvm;\nhttp:/ecmc/cloud/vm/restartvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f03cd210279', '云主机_操作_挂起云主机', '', '2016-05-05 11:43:56', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_suspendvm;\nhttp:/ecmc/cloud/vm/suspendvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f049ad2027b', '云主机_操作_恢复云主机', null, '2016-05-05 11:44:48', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_resumevm;\nhttp:/ecmc/cloud/vm/resumevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f063a8b027d', '云主机_操作_挂载云硬盘', null, '2016-05-05 11:46:35', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_mountdisk;\nhttp:/ecmc/cloud/volume/getunbinddisk.do;\nhttp:/ecmc/cloud/vm/getdiskcountbyvm.do;\nhttp:/ecmc/cloud/vm/bindbatchvolume.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f07abaa027f', '云主机_操作_绑定公网IP', null, '2016-05-05 11:48:09', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_bindfloatip;\nhttp:/ecmc/virtual/floatip/getUnBindFloatIp.do;\nhttp:/ecmc/virtual/floatip/binDingVm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0912ba0281', '云主机_操作_解绑公网IP', null, '2016-05-05 11:49:41', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_unbindfloatip;\nhttp:/ecmc/cloud/vm/unbindipbyvmid.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0b07200283', '云主机_操作_创建自定义镜像', null, '2016-05-05 11:51:49', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_createsnapshot;\nhttp:/ecmc/cloud/image/checkimagename.do;\nhttp:/ecmc/cloud/image/getimagecountbyprjid.do;\nhttp:/ecmc/cloud/vm/createsnapshot.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0c93800286', '云主机_操作_升级配置', null, '2016-05-05 11:53:31', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_upgradevm;\nhttp:/ecmc/cloud/vm/getcpulist.do;\nhttp:/ecmc/cloud/vm/getramlistbycpu.do;\nhttp:/ecmc/cloud/vm/upgradevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f3e175f0289', '云主机_操作_编辑安全组', null, '2016-05-05 12:47:36', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_editvmsecuritygroup;\nhttp:/ecmc/cloud/vm/getsecuritybyprjnovm.do;\nhttp:/ecmc/cloud/vm/getsecuritygroupbyvm.do;\nhttp:/ecmc/cloud/vm/editvmsecuritygroup.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f3ee4e2028b', '云主机_操作_查看日志', null, '2016-05-05 12:48:28', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_log;\nhttp:/ecmc/cloud/vm/getvmlog.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f40a3a3028d', '云主机_编辑云主机名称或描述', null, '2016-05-05 12:50:23', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_edit;\nhttp:/ecmc/cloud/vm/updatevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eacb2640002', '路由-查看', '查看路由', '2016-05-05 10:08:47', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_query;\nhttp:/ecmc/virtual/route/queryroute.do;\nhttp:/ecmc/virtual/route/getroutedetailbyid.do;\nhttp:/ecmc/virtual/route/queryroutesubnetwork.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547ead84660004', '路由-创建', '创建路由', '2016-05-05 10:09:41', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_create;\nhttp:/ecmc/virtual/route/addroute.do;\nhttp:/ecmc/virtual/route/checkrouterate.do;\nhttp:/ecmc/virtual/route/checkroutename.do;\nhttp:/ecmc/virtual/subnetwork/getnotbinroutesubnetlist.do;\nhttp:/ecmc/virtual/network/getnotbindroutenetwork.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eadee590006', '路由-编辑', '编辑路由', '2016-05-05 10:10:08', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_modify;\nhttp:/ecmc/virtual/route/updateroute.do;\nhttp:/ecmc/virtual/route/checkrouterate.do;\nhttp:/ecmc/virtual/route/checkroutename.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eaef1430008', '路由-设置/清除网关', '绑定或者解绑网关', '2016-05-05 10:11:14', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_setGateway;\nhttp:/ecmc/virtual/route/setgateway.do;\nhttp:/ecmc/virtual/route/removegateway.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eb0ea62000a', '路由-关联子网', '路由绑定子网', '2016-05-05 10:13:24', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_attachSubnet;\nhttp:/ecmc/virtual/route/attachsubnet.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eb16a5a000c', '路由-删除', '删除路由', '2016-05-05 10:13:56', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_delete;\nhttp:/ecmc/virtual/route/deleteroute.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547ede622e00d6', '路由-解绑子网', '路由解绑子网', '2016-05-05 11:03:03', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_detachSubnet;\nhttp:/ecmc/virtual/route/detachsubnet.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547eec02b801aa', '私有网络-查看', '私有网络列表', '2016-05-05 11:17:57', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_query;\nhttp:/ecmc/virtual/network/querynetwork.do;\nhttp:/ecmc/virtual/subnetwork/getsubnetlistbynetid.do;\nhttp:/ecmc/virtual/network/getnetworkbyid.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547ef5c49201ac', '私有网络-创建', '创建私有网络', '2016-05-05 11:28:36', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_create;\nhttp:/ecmc/virtual/network/addnetwork.do;\nhttp:/ecmc/virtual/network/checknetworkname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547ef8aabd01ae', '私有网络-编辑', '编辑私有网络', '2016-05-05 11:31:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_modify;\nhttp:/ecmc/virtual/network/modnetwork.do;\nhttp:/ecmc/virtual/network/checknetworkname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f02ce7101b6', '私有网络-增加子网', '添加子网', '2016-05-05 11:42:50', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_createSubnet;\nhttp:/ecmc/virtual/subnetwork/addsubnetwork.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetipbynet.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetworkname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f03a68101b8', '私有网络-编辑子网', '编辑子网', '2016-05-05 11:43:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_modifySubnet;\nhttp:/ecmc/virtual/subnetwork/updatesubnetwork.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetipbynet.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetworkname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f07cd7201ba', '私有网络-删除子网', '删除子网', '2016-05-05 11:48:18', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_deleteSubnet;\nhttp:/ecmc/virtual/subnetwork/deletesubnetwork.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f0afb0801be', '私有网络-设置/清除网关', '网络设置或者清除网关', '2016-05-05 11:51:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_setGateway;\nhttp:/ecmc/virtual/route/setgateway.do;\nhttp:/ecmc/virtual/route/removegateway.do;\nhttp:/ecmc/virtual/networkout/selectoutnet.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f0c3c1801c3', '私有网络-删除', '删除私有网络', '2016-05-05 11:53:08', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_delete;\nhttp:/ecmc/virtual/network/deletenetwork.do;\nhttp:/ecmc/virtual/network/checkfordel.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545c627b93000a', '监控管理模块展示', '监控管理模块的显示', '2016-04-28 18:20:38', '402890bc540ad19801540ad1fc300000', '1', 'ui:monitor', 'ff8080815438ac44015438d5fe9c0014', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545ca2b3f300aa', '报警信息查看', '报警信息查看', '2016-04-28 19:30:47', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_alarm;\nhttp:/ecmc/monitor/alarm/getecmcpagemsglist.do;\nhttp:/ecmc/monitor/alarm/getecmcitemlist.do;\nhttp:/ecmc/monitor/alarm/exportmsgexcel.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545ca352f300ab', '联系人管理展示', '查看运维自建的联系人和客户创建的联系人', '2016-04-28 19:31:28', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_contact;\nhttp:/ecmc/monitor/contact/getecmcpagecontactlist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545caca1a100ea', '云主机监控查看', '查看云主机监控', '2016-04-28 19:41:38', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_resource_cloudhost;\nhttp:/ecmc/monitor/resource/getvmlistforecmclive.do;\nhttp:/ecmc/monitor/resource/getinterval.do;\nhttp:/ecmc/monitor/resource/getvmlistforecmclast.do;\nhttp:/ecmc/monitor/resource/getcharttimes.do;\nhttp:/ecmc/monitor/resource/getvmdetailbyid.do;\nhttp:/ecmc/monitor/resource/getmonitordatabyid.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;', 'ff8080815438ac44015438d660ff0015', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545cb308d3012c', '报警规则查看', '查看报警规则及详情', '2016-04-28 19:48:37', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_alarm_tab_rule;\nhttp:/ecmc/monitor/alarm/getecmcpagerulelist.do;\nhttp:/ecmc/monitor/alarm/getecmcrulebyid.do;\nhttp:/ecmc/monitor/alarm/getecmcobjlistinrule.do;\nhttp:/ecmc/monitor/alarm/getecmcconsbyrule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154944657ea0c72', '工单_添加', '添加工单', '2016-05-09 11:28:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_save;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/addworkorder.do;\nhttp:/ecmc/workorder/finduserbyuserid.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549447167f0c76', '工单_查看全部', '查看所有类型的工单', '2016-05-09 11:30:27', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_find_all;\nhttp:/ecmc/file/down.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/finduserbyuserid.do;\nhttp:/ecmc/customer/getuseraccountbycusid.do;\nhttp:/ecmc/customer/getcustomerbyid.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/getnotdoneworklist.do;\nhttp:/ecmc/workorder/getdoneworklist.do;\nhttp:/ecmc/workorder/getnodoneflaglist.do;\nhttp:/ecmc/workorder/getdoneflaglist.do;\nhttp:/ecmc/workorder/getworkflaglistforordinary.do;\nhttp:/ecmc/workorder/getworkheadlist.do;\nhttp:/ecmc/workorder/findworkbyworkid.do;\nhttp:/ecmc/workorder/getworkopinionlist.do;\nhttp:/ecmc/workorder/countalluseracceptworkorder.do;\nhttp:/ecmc/workorder/countuseracceptworkorder.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549447e08f0c78', '工单_编辑', '编辑工单', '2016-05-09 11:26:19', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_edit;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/finduserbyuserid.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/updateecmcworkorder.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549449684c0c7c', '工单_受理', '受理工单', '2016-05-09 11:34:59', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_accept;\nhttp:/ecmc/workorder/acceptancework.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154944b04d30c7e', '工单_更改级别', '更改工单级别', '2016-05-09 11:31:45', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_editworklevel;\nhttp:/ecmc/workorder/updateecmcworkforworklevel.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154944bfc490c80', '工单_求助', '求助其他工程师', '2016-05-09 11:29:48', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_trun;\nhttp:/ecmc/workorder/truntootheruser.do;\nhttp/ecmc/workorder/gettruetoother.do;\nhttp:/ecmc/workorder/getecmcadminandcpis.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154945036120c83', '工单_审核', '审核工单', '2016-05-09 11:37:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_audit;\nhttp:/ecmc/workorder/auditpasswork.do;\nhttp:/ecmc/workorder/auditnotpasswork.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549450eace0c85', '工单_创建项目', '创建项目', '2016-05-09 11:38:11', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_creprj;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/project/createproject.do;\nhttp:/ecmc/project/createprojectonly.do;\nhttp:/ecmc/customer/checkcusorg.do', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549451694c0c87', '工单_修改项目', '修改项目配额', '2016-05-09 11:39:43', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_editprj;\nhttp:/ecmc/project/getprojectbyid.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/modifyproject.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154945444ec0c8a', '工单_取消', '取消工单(客服取消普通类工单)', '2016-05-09 11:35:51', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_cancel;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549454d9630c8c', '工单_完结', '确认工单完成', '2016-05-09 11:33:29', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_end;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154946736af0cae', '工单_普通查看', '查看普通类型的工单', '2016-05-09 11:32:32', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_find_common;\nhttp:/ecmc/file/down.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getuseraccountbycusid.do;\nhttp:/ecmc/customer/getcustomerbyid.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/getnotdoneworklist.do;\nhttp:/ecmc/workorder/getdoneworklist.do;\nhttp:/ecmc/workorder/getnodoneflaglist.do;\nhttp:/ecmc/workorder/getdoneflaglist.do;\nhttp:/ecmc/workorder/getworkflaglistforordinary.do;\nhttp:/ecmc/workorder/getworkheadlist.do;\nhttp:/ecmc/workorder/findworkbyworkid.do;\nhttp:/ecmc/workorder/getworkopinionlist.do;\nhttp:/ecmc/workorder/countalluseracceptworkorder.do;\nhttp:/ecmc/workorder/countuseracceptworkorder.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549467f0ce0cb1', '工单_特殊查看', '查看特殊类工单', '2016-05-09 11:27:20', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_find_special;\nhttp:/ecmc/file/down.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getuseraccountbycusid.do;\nhttp:/ecmc/customer/getcustomerbyid.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/getnotdoneworklist.do;\nhttp:/ecmc/workorder/getdoneworklist.do;\nhttp:/ecmc/workorder/getnodoneflaglist.do;\nhttp:/ecmc/workorder/getdoneflaglist.do;\nhttp:/ecmc/workorder/getworkflaglistforordinary.do;\nhttp:/ecmc/workorder/getworkheadlist.do;\nhttp:/ecmc/workorder/findworkbyworkid.do;\nhttp:/ecmc/workorder/getworkopinionlist.do;\nhttp:/ecmc/workorder/countalluseracceptworkorder.do;\nhttp:/ecmc/workorder/countuseracceptworkorder.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff80808154b741a70154b83d55e9032b', '删除存储', '删除存储', '2016-05-16 14:25:08', 'ff808081543cbe2701543cceba910000', '1', 'ui:phy_storage_delete;\nhttp:/ecmc/physical/storage/queryDcStorageDel.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff80808154c6bf460154c6cf0cd7000f', '重置密码', '重置客户密码（仅限管理员）', '2016-05-19 10:18:58', 'ff80808154b8e8ac0154bcab766b081c', '1', 'ui:customer_resetpwd;', 'ff8080815438ac44015438c27e5d0007', '0');

-- ----------------------------
-- Table structure for `ecmc_sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_department`;
CREATE TABLE `ecmc_sys_department` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_department
-- ----------------------------
INSERT INTO `ecmc_sys_department` VALUES ('ff808081540d352401540e4d9e0e0002', '易云捷讯', '最高部门', null, null, null, '', '2016-04-13 15:14:24', null, '1', '000', '');

-- ----------------------------
-- Table structure for `ecmc_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_menu`;
CREATE TABLE `ecmc_sys_menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `orderno` int(11) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `lock` char(1) DEFAULT '0' COMMENT '是否加锁，0:false 可被分配分配给角色、删除;1：true 不可被分配给角色、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_menu
-- ----------------------------
INSERT INTO `ecmc_sys_menu` VALUES ('40288eeb545f98a801545fea5a8a005d', '数据管理', '数据管理', 'app.sysdatatree', 'ff8080815438ac44015438d8d5000018', '80', '2016-04-29 10:47:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'eayunfont ef-data', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c66cb1f40000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:28:45', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c670d16f0001', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:33:15', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890bb5413eb6a01541402ce910000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', null, null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('5', '二级菜单1', null, null, '1', '0', '2016-03-30 11:14:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bb40b20000', '总览', null, 'app.overview', null, '10', '2016-04-21 20:11:16', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-overview', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bcfb260001', '公有云资源管理', null, '', null, '20', '2016-04-21 20:13:09', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438be965d0002', '云主机', null, 'app.cloudhost', 'ff8080815438ac44015438bcfb260001', '10', '2016-04-21 20:14:55', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bf1f390003', '网络', 'VPC', 'app.net', 'ff8080815438ac44015438bcfb260001', '20', '2016-04-21 20:15:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bfc39a0004', '安全', null, 'app.safe', 'ff8080815438ac44015438bcfb260001', '30', '2016-04-21 20:16:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-safe', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c05a8b0005', '对象存储', 'OBS', 'app.obs', 'ff8080815438ac44015438bcfb260001', '40', '2016-04-21 20:16:50', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-obs', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c14b110006', '公有云业务管理', null, '', null, '30', '2016-04-21 20:17:52', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c27e5d0007', '客户管理', null, 'app.customer', 'ff8080815438ac44015438c14b110006', '10', '2016-04-21 20:19:11', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c2e0dc0008', '工单管理', null, 'app.workorder', 'ff8080815438ac44015438c14b110006', '20', '2016-04-21 20:19:36', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-workorder', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c33c7b0009', '消息管理', null, 'app.message', 'ff8080815438ac44015438c14b110006', '30', '2016-04-21 20:19:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c8999a000a', '公告管理', null, 'app.notice', 'ff8080815438ac44015438c14b110006', '40', '2016-04-21 20:25:51', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-contacts', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce0059000b', '数据中心管理', null, '', null, '40', '2016-04-21 20:31:45', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce7e8e000c', '数据中心', null, 'app.center', 'ff8080815438ac44015438ce0059000b', '10', '2016-04-21 20:32:17', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-center', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cf239e000d', '服务器', null, 'app.server', 'ff8080815438ac44015438ce0059000b', '20', '2016-04-21 20:32:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-server', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cfcf98000e', '机柜', null, 'app.cabinet', 'ff8080815438ac44015438ce0059000b', '30', '2016-04-21 20:33:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cabinet', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d03f87000f', '交换机', null, 'app.switch', 'ff8080815438ac44015438ce0059000b', '40', '2016-04-21 20:34:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-switch', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d1075f0010', '存储', null, 'app.storage', 'ff8080815438ac44015438ce0059000b', '50', '2016-04-21 20:35:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-storage', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d199e40011', '防火墙', null, 'app.firewall', 'ff8080815438ac44015438ce0059000b', '60', '2016-04-21 20:35:41', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-firewall', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d2dc4a0012', '型号维护', null, 'app.model', 'ff8080815438ac44015438ce0059000b', '70', '2016-04-21 20:37:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-xinghaoweihu', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d3aa7a0013', 'IP', null, 'app.ip', 'ff8080815438ac44015438ce0059000b', '80', '2016-04-21 20:37:56', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-IP', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d5fe9c0014', '监控管理', null, '', null, '50', '2016-04-21 20:40:29', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d660ff0015', '资源监控', null, 'app.monitor', 'ff8080815438ac44015438d5fe9c0014', '10', '2016-04-21 20:40:54', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-monitor', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d721300016', '报警管理', null, 'app.warning', 'ff8080815438ac44015438d5fe9c0014', '20', '2016-04-21 20:41:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-warning', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d7fbd50017', '联系人管理', null, 'app.contacts', 'ff8080815438ac44015438d5fe9c0014', '30', '2016-04-21 20:42:39', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d8d5000018', '系统管理', null, '', null, '60', '2016-04-21 20:43:35', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d93963001a', '组织机构', null, 'app.department', 'ff8080815438ac44015438d8d5000018', '10', '2016-04-21 20:44:00', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d98eea001c', '菜单管理', null, 'app.menu', 'ff8080815438ac44015438d8d5000018', '20', '2016-04-21 20:44:22', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-menu', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438da284a001d', '角色管理', null, 'app.role', 'ff8080815438ac44015438d8d5000018', '30', '2016-04-21 20:45:01', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-role', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dace02001e', '权限管理', null, 'app.authority', 'ff8080815438ac44015438d8d5000018', '40', '2016-04-21 20:45:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-forbid', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dbb92e001f', '用户管理', null, 'app.user', 'ff8080815438ac44015438d8d5000018', '50', '2016-04-21 20:46:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dc6dfa0020', '日志管理', '', 'app.log', 'ff8080815438ac44015438d8d5000018', '60', '2016-04-21 20:47:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-log', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dccfb40021', '数据管理', null, '#/sysdatatree/sysdatatree', 'ff8080815438ac44015438dccfb40021', '70', '2016-04-21 20:47:55', '402890bc540ad19801540ad1fc300000', '1', null, '0');

-- ----------------------------
-- Table structure for `ecmc_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_role`;
CREATE TABLE `ecmc_sys_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `protect` char(1) DEFAULT '0' COMMENT '是否受保护，0:false 可配置权限、删除;1：true 受保护，不可配置权限、删除',
  `hide` char(1) DEFAULT '0' COMMENT '是否隐藏，0:否，不隐藏;1：是，隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_role
-- ----------------------------
INSERT INTO `ecmc_sys_role` VALUES ('40288ee75456549a015456b8df2e000d', '超级管理员', '有所有权限（别删）', '2016-04-27 15:57:16', 'ff808081543cbe2701543cceba910000', '1', '0', '1');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfeb3fa000a', '客服人员', '', '2016-04-22 11:23:48', 'ff808081543cbe2701543cceba910000', '1', '1', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfee6a8000b', '运维工程师', '', '2016-04-22 11:24:01', 'ff808081543cbe2701543cceba910000', '1', '1', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff30f2000c', '管理员', '', '2016-04-22 11:24:20', 'ff808081543cbe2701543cceba910000', '1', '1', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff655b000d', '商务', '', '2016-04-22 11:24:34', 'ff808081543cbe2701543cceba910000', '1', '1', '0');

-- ----------------------------
-- Table structure for `ecmc_sys_roleauth`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_roleauth`;
CREATE TABLE `ecmc_sys_roleauth` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `auth_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidauthid` (`role_id`,`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_roleauth
-- ----------------------------
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7a0035', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7f8d66000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7a0034', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7ff16c000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7b0036', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8079ed000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf790033', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f80d1980011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf700021', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf700022', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf710023', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf710024', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf770030', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f840aaf0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf780032', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8470cc0059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf76002f', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8703f0005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf770031', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f877367005d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf710025', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf720026', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf720027', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf730028', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf730029', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf74002a', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf74002b', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf75002c', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf75002d', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7c0039', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545feb3301005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7e003c', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545febaaf80061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7c0038', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec16a20063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7d003b', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec79ae0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7b0037', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fece84a0067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf7d003a', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fed7a6c0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40288ee854a923100154a92fdf76002e', '40288ee75456549a015456b8df2e000d', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b11474', '40289092543bd6a801543bfeb3fa000a', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b11475', '40289092543bd6a801543bfeb3fa000a', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b11476', '40289092543bd6a801543bfeb3fa000a', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b11477', '40289092543bd6a801543bfeb3fa000a', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b11478', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b11479', '40289092543bd6a801543bfeb3fa000a', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b1147a', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b1147b', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154945444ec0c8a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b1147c', '40289092543bd6a801543bfeb3fa000a', 'ff8080815485802201549454d9630c8c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff808081550ae638015514c599b2147d', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dc2e17', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dc2e18', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dc2e19', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dc2e1a', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e1b', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e1c', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e1d', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e1e', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e1f', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e20', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e21', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7dd2e22', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e23', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e24', '40289092543bd6a801543bfee6a8000b', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e25', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e26', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e27', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e28', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e29', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e2a', '40289092543bd6a801543bfee6a8000b', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7de2e2b', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e2c', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e2d', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e2e', '40289092543bd6a801543bfee6a8000b', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e2f', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e30', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e31', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e32', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e33', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7df2e34', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e35', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e36', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e37', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e38', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e39', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e3a', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e3b', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e3c', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a6814c000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e02e3d', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e3e', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e3f', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e40', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e41', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e42', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e43', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e44', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e12e45', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e46', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e47', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e48', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e49', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e4a', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e4b', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e4c', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e22e4d', '40289092543bd6a801543bfee6a8000b', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e4e', '40289092543bd6a801543bfee6a8000b', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e4f', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e50', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b05cb5a00b9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e51', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e52', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e53', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e54', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b46bc8105ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e55', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e32e56', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e57', '40289092543bd6a801543bfee6a8000b', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e58', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e59', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e5a', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e5b', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e5c', '40289092543bd6a801543bfee6a8000b', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e5d', '40289092543bd6a801543bfee6a8000b', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e5e', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e42e5f', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460fb37d90004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e60', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e61', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e62', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e63', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e64', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e65', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e66', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e67', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e52e68', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e69', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e6a', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e6b', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e6c', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e6d', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e6e', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b27e43600d0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e6f', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e70', '40289092543bd6a801543bfee6a8000b', '402890ab547e722201547eaa93350005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e62e71', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e72', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e73', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e74', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e75', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e76', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e77', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e78', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e79', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e72e7a', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e7b', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e7c', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e7d', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e7e', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0c93800286');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e7f', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e80', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e81', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e82', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e82e83', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e84', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e85', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e86', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e87', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e88', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e89', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef5c49201ac');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7e92e8a', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e8b', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e8c', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e8d', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e8e', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e8f', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e90', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e91', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e92', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7ea2e93', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7eb2e94', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7eb2e95', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7eb2e96', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7eb2e97', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154e5bed7eb2e98', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb2380a', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb2380b', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb2380c', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb2380d', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb2380e', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7c3e5c0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33813', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33814', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33815', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33816', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33817', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33818', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33819', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3381a', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3381b', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3381c', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3381d', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3381e', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3381f', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33820', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33821', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33822', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33823', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fda1beb001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33824', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33825', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33826', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33827', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe7fccd005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33828', '40289092543bd6a801543bff30f2000c', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33829', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3382a', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3382b', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3382c', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545feb443f001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3382d', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545febd38d001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3382e', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb3382f', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33830', '40289092543bd6a801543bff30f2000c', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33831', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600abc0a001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33832', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb33833', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43834', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43835', '40289092543bd6a801543bff30f2000c', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43836', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609040600001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43837', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43838', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43839', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4383a', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460978752000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4383b', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4383c', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4383d', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4383e', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4383f', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43840', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43841', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a2988b0021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43842', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43843', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43844', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43845', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a98624002b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43846', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43847', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a6814c000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43848', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43849', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4384a', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b56dd1000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4384b', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4384c', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4384d', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4384e', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4384f', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43850', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43851', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43852', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43853', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43854', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1b04d0019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43855', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43856', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43857', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608878dc01a1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43858', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb43859', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb4385a', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5385b', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546095699801ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5385c', '40289092543bd6a801543bff30f2000c', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5385d', '40289092543bd6a801543bff30f2000c', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5385e', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5385f', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b05cb5a00b9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53860', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b0d78f002c1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53861', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53862', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53863', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53864', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b46bc8105ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53865', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53866', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53867', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5b42d607e8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53868', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bf9c69d0006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53869', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bfde6460009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5386a', '40289092543bd6a801543bff30f2000c', '40289092544c795d01544ca94fe60000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5386b', '40289092543bd6a801543bff30f2000c', '40289092547a07b201547a5098d50009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5386c', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5386d', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5386e', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5386f', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53870', '40289092543bd6a801543bff30f2000c', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53871', '40289092543bd6a801543bff30f2000c', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53872', '40289092543bd6a801543bff30f2000c', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53873', '40289092543bd6a801543bff30f2000c', '402890955460f136015460fb37d90004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53874', '40289092543bd6a801543bff30f2000c', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53875', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53876', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53877', '40289092543bd6a801543bff30f2000c', '402890995475666c0154757016ab0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53878', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb53879', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5387a', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5387b', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b456b78000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5387c', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5387d', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb5387e', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6387f', '40289092543bd6a801543bff30f2000c', '402890a85475fcba01547627e4a30242');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63880', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154764060810311');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63881', '40289092543bd6a801543bff30f2000c', '402890a85475fcba015476458aed03c0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63882', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766216ae046a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63883', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766358c0046d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63884', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63885', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a3a9d20005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63886', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a64fb200b3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63887', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a95021015e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63888', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b003e4021a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63889', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6388a', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6388b', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6388c', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6388d', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b27e43600d0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6388e', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6388f', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3ed0fb024d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63890', '40289092543bd6a801543bff30f2000c', '402890ab547e722201547eaa93350005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63891', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63892', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb94081017b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63893', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63894', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63895', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63896', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63897', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63898', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb63899', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6389a', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6389b', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6389c', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6389d', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6389e', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb6389f', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0c93800286');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb638a0', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb638a1', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb638a2', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb638a3', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb638a4', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb638a5', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738a6', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738a7', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738a8', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb16a5a000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738a9', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738aa', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738ab', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ef5c49201ac');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738ac', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738ad', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738ae', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738af', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f07cd7201ba');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b0', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b1', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0c3c1801c3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b2', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b3', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b4', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b5', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b6', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b7', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b8', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447167f0c76');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738b9', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738ba', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738bb', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738bc', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738bd', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738be', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738bf', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549451694c0c87');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738c0', '40289092543bd6a801543bff30f2000c', 'ff80808154b741a70154b83d55e9032b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c85cf60154ebb25bb738c1', '40289092543bd6a801543bff30f2000c', 'ff80808154c6bf460154c6cf0cd7000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08d9', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08da', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08db', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08dc', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08dd', '40289092543bd6a801543bff655b000d', '40289092543bd6a801543bfccdf00008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08de', '40289092543bd6a801543bff655b000d', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08df', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d4f08e0', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e1', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e2', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e3', '40289092543bd6a801543bff655b000d', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e4', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e5', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549451694c0c87');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e6', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549454d9630c8c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('ff80808154c1a6fa0154c3400d5008e7', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549467f0ce0cb1');

-- ----------------------------
-- Table structure for `ecmc_sys_rolemenu`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_rolemenu`;
CREATE TABLE `ecmc_sys_rolemenu` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidmenuid` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_rolemenu
-- ----------------------------
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6e0020', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fea5a8a005d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6b0019', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6b001a', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6e001f', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d98eea001c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6c001b', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6d001e', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dace02001e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6c001c', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40288ee854a923100154a92fdf6d001d', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff808081550ae638015514c599b01470', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff808081550ae638015514c599b01471', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff808081550ae638015514c599b01472', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff808081550ae638015514c599b01473', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92dfa', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92dfb', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92dfc', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92dfd', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92dfe', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92dff', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7d92e00', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e01', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e02', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e03', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e04', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e05', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e06', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e07', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e08', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7da2e09', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e0a', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e0b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e0c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e0d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e0e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e0f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e10', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e11', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7dc2e16', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7db2e12', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7dc2e13', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7dc2e14', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154e5bed7dc2e15', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb137ec', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb137ed', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb137ee', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb137ef', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f0', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f1', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f2', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f3', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f4', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f5', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f6', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f7', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f8', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237f9', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237fa', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237fb', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237fc', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237fd', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237fe', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb237ff', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23800', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23801', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23802', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23803', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23809', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23804', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23805', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23807', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c85cf60154ebb25bb23808', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c1a6fa0154c3400d4e08d4', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c1a6fa0154c3400d4e08d5', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c1a6fa0154c3400d4e08d6', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c1a6fa0154c3400d4e08d7', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('ff80808154c1a6fa0154c3400d4e08d8', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c2e0dc0008');

-- ----------------------------
-- Table structure for `ecmc_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_user`;
CREATE TABLE `ecmc_sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `account` varchar(32) NOT NULL COMMENT '登录帐号',
  `name` varchar(50) NOT NULL COMMENT '名称、姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `tel` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `depart_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `salt` varchar(20) DEFAULT NULL COMMENT '密码干扰串',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_useraccount` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_user
-- ----------------------------
INSERT INTO `ecmc_sys_user` VALUES ('ff808081543cbe2701543cceba910000', 'root', '超级管理员', 'C7AA26A6F8E1DD6BF017B7DDB89B4DAE', '111111', 'ecmcroot@eayun.com', 'ff808081540d352401540e4d9e0e0002', '2016-04-22 15:11:01', null, '1', '466525', null);

-- ----------------------------
-- Table structure for `ecmc_sys_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_userrole`;
CREATE TABLE `ecmc_sys_userrole` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_useridroleid` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_userrole
-- ----------------------------
INSERT INTO `ecmc_sys_userrole` VALUES ('4028909054754fc4015475e36c2e01d1', 'ff808081543cbe2701543cceba910000', '40288ee75456549a015456b8df2e000d');



/*
ecmc1.1用户数据迁移

回退：
delete from ecmc_sys_user where id in (select user_id from sys_user where user_id <> 'root');
delete from ecmc_sys_userrole where user_id in (select user_id from sys_user where user_id <> 'root');
*/

-- 从sys_user导入数据到ecmc_sys_user
insert into ecmc_sys_user(id, account, name, password, tel, mail, depart_id, createtime, enableflag, salt)
select user_id, user_id, user_name, user_passwd, user_mobile, user_mail, 'ff808081540d352401540e4d9e0e0002', createtime, '1', FLOOR(RAND() * 1000000) salt
from sys_user where user_id <> 'root';

-- 处理老用户密码
update ecmc_sys_user set `password` = UPPER(convert(MD5(CONCAT(`password`, salt)) using latin1)) where id in (select user_id from sys_user where user_id <> 'root');

-- 处理老用户角色
insert into ecmc_sys_userrole(id, user_id, role_id)
select UUID(), u.user_id, 
	case roleid 
	when 'admin' then '40289092543bd6a801543bff30f2000c' --  管理员
	when '1511251031560' then '40289092543bd6a801543bff655b000d' --  商务
	when '1505181604430' then '40289092543bd6a801543bfee6a8000b' --  运维
	when '1503251002230' then '40289092543bd6a801543bfeb3fa000a' --  客服
	else 'temp_for_delete'
	end as newRoleId
from userrole ur inner join sys_user u on ur.operid = u.user_id where u.user_id <> 'root';
delete from ecmc_sys_userrole where role_id = 'temp_for_delete';

