
-- 新增表字段
-- ecsc_alarmobject表新增ao_monitortype监控项字段，历史数据全部为云主机类型
ALTER TABLE `ecsc_alarmobject`
ADD COLUMN `ao_monitortype`  VARCHAR(100) default NULL NULL COMMENT '监控项类型';
UPDATE ecsc_alarmobject SET ao_monitortype = '0008001';
-- ecsc_monitoralarmitem表新增mai_monitortype监控项字段，历史数据全部为云主机类型
ALTER TABLE `ecsc_monitoralarmitem`
ADD COLUMN `mai_monitortype`  VARCHAR(100) default NULL NULL COMMENT '监控项类型';
UPDATE ecsc_monitoralarmitem SET mai_monitortype = '0008001';

-- 新增表数据
-- 新增云数据库和负载均衡的监控项和指标类型
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002', '云数据库', '0008', 2, '0', NULL, '1', NULL, NULL, NULL, 'cloudDatabase', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002001', 'CPU利用率', '0008002', 1, '0', NULL, '1', '%', NULL, NULL, 'cloudCPURatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002002', '内存占用率', '0008002', 2, '0', NULL, '1', '%', NULL, NULL, 'cloudRAMRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002003', '磁盘读吞吐', '0008002', 3, '0', NULL, '1', 'MB/s', NULL, NULL, 'cloudReadRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002004', '磁盘写吞吐', '0008002', 4, '0', NULL, '1', 'MB/s', NULL, NULL, 'cloudWriteRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002005', '网卡下行速率', '0008002', 5, '0', NULL, '1', 'Mb/s', NULL, NULL, 'cloudDownRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002006', '网卡上行速率', '0008002', 6, '0', NULL, '1', 'Mb/s', NULL, NULL, 'cloudUpRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008002007', '磁盘使用率', '0008002', 7, '0', NULL, '1', '%', NULL, NULL, 'cloudVolRatio', NULL);

INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008003', '负载均衡（普通模式）', '0008', 3, '0', NULL, '1', NULL, NULL, NULL, 'commonLdPool', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008003001', '不活跃成员百分比', '0008003', 1, '0', NULL, '1', '%', NULL, NULL, 'expMemRatio', NULL);

INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008004', '负载均衡（主备模式）', '0008', 4, '0', NULL, '1', NULL, NULL, NULL, 'masterLdPool', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008004001', '不活跃节点百分比', '0008004', 1, '0', NULL, '1', '%', NULL, NULL, 'expNodeRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008004002', '不活跃主节点百分比', '0008004', 2, '0', NULL, '1', '%', NULL, NULL, 'expMasterNodeRatio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0008004003', '不活跃从节点百分比', '0008004', 3, '0', NULL, '1', '%', NULL, NULL, 'expSalveNodeRatio', NULL);

INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004', '云数据库', '0010003', 3, '0', NULL, '1', NULL, NULL, NULL, 'cloudData_Monitor', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004001', 'CPU利用率', '0010003004', 1, '0', NULL, '1', '%', NULL, NULL, 'cloudCPU_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004002', '内存占用率', '0010003004', 2, '0', NULL, '1', '%', NULL, NULL, 'cloudRAM_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004003', '磁盘读吞吐', '0010003004', 3, '0', NULL, '1', 'MB/s', NULL, NULL, 'cloudRead_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004004', '磁盘写吞吐', '0010003004', 4, '0', NULL, '1', 'MB/s', NULL, NULL, 'cloudWrite_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004005', '网卡下行速率', '0010003004', 5, '0', NULL, '1', 'Mb/s', NULL, NULL, 'cloudDown_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004006', '网卡上行速率', '0010003004', 6, '0', NULL, '1', 'Mb/s', NULL, NULL, 'cloudUp_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003004007', '磁盘使用率', '0010003004', 7, '0', NULL, '1', '%', NULL, NULL, 'cloudVol_Ratio', NULL);

INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003005', '负载均衡（普通模式）', '0010003', 4, '0', NULL, '1', NULL, NULL, NULL, 'poolCommon_Monitor', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003005001', '不活跃成员百分比', '0010003005', 1, '0', NULL, '1', '%', NULL, NULL, 'expMem_Ratio', NULL);

INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003006', '负载均衡（主备模式）', '0010003', 5, '0', NULL, '1', NULL, NULL, NULL, 'poolMaster_Monitor', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003006001', '不活跃节点百分比', '0010003006', 1, '0', NULL, '1', '%', NULL, NULL, 'expNode_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003006002', '不活跃主节点百分比', '0010003006', 2, '0', NULL, '1', '%', NULL, NULL, 'expMasterNode_Ratio', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010003006003', '不活跃从节点百分比', '0010003006', 3, '0', NULL, '1', '%', NULL, NULL, 'expSalveNode_Ratio', NULL);


-- 新增ecsc的内存占用率
INSERT INTO `sys_data_tree` VALUES ('0008001003', '内存占用率', '0008001', 1, '0', '监控指标：内存使用率。单位：%', '1', '', '', NULL, 'MemoryUsage', '');


-- 新增加报警类型及其下的监控项和具体的报警类型
INSERT INTO `sys_data_tree` VALUES ('0010008', '监控报警类型', '0010', 2, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008001', '云主机', '0010008', 1, '0', '这里记录为下属的报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008001001', 'CPU', '0010008001', 1, '0', '云主机报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008001002', '内存', '0010008001', 2, '0', '云主机报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008001003', '磁盘', '0010008001', 3, '0', '云主机报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008001004', '网络', '0010008001', 4, '0', '云主机报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008002', '云数据库', '0010008', 2, '0', '这里记录为下属的报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008002001', 'CPU利用率', '0010008002', 1, '0', '云数据库报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008002002', '内存占用率', '0010008002', 2, '0', '云数据库报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008002003', '磁盘速率', '0010008002', 3, '0', '云数据库报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008002004', '网卡速率', '0010008002', 4, '0', '云数据库报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008002005', '磁盘使用率', '0010008002', 5, '0', '云数据库报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008003', '负载均衡（普通模式）', '0010008', 3, '0', '这里记录为下属的报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008003001', '后端不活跃成员', '0010008003', 1, '0', '普通模式报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008004', '负载均衡（主备模式）', '0010008', 4, '0', '这里记录为下属的报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008004001', '后端不活跃节点', '0010008004', 1, '0', '主备模式报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008004002', '后端不活跃主节点', '0010008004', 2, '0', '主备模式报警类型', '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0010008004003', '后端不活跃从节点', '0010008004', 3, '0', '主备模式报警类型', '1', NULL, NULL, NULL, NULL, NULL);


-- 删除表数据
-- 删除ECMC物理服务器监控项
DELETE FROM sys_data_tree WHERE node_id = '0010003002';
DELETE FROM ecmc_alarmrule WHERE ar_monitoritem = '0010003002';

-- 历史表数据处理
-- 报警信息am_monitortype字段由存储中文改为存储监控项类型nodeId
	UPDATE ecmc_alarmmessage SET am_monitortype = '0010003001' WHERE am_monitortype = '云主机';
	UPDATE ecmc_alarmmessage SET am_monitortype = '0010003003' WHERE am_monitortype = 'API';

	UPDATE ecsc_alarmmessage SET am_monitortype = '0008001' WHERE am_monitortype = '云主机';

	-- 报警类型am_alarmtype由存储特定中文改为存储nodeId
	UPDATE ecsc_alarmmessage SET am_alarmtype = '0010008001001' WHERE am_alarmtype = 'CPU';
	UPDATE ecsc_alarmmessage SET am_alarmtype = '0010008001002' WHERE am_alarmtype = '内存';
	UPDATE ecsc_alarmmessage SET am_alarmtype = '0010008001003' WHERE am_alarmtype = '磁盘';
	UPDATE ecsc_alarmmessage SET am_alarmtype = '0010008001004' WHERE am_alarmtype = '网络';

	UPDATE ecmc_alarmmessage SET am_alarmtype = '0010008001001' WHERE am_alarmtype = 'CPU';
	UPDATE ecmc_alarmmessage SET am_alarmtype = '0010008001002' WHERE am_alarmtype = '内存';
	UPDATE ecmc_alarmmessage SET am_alarmtype = '0010008001003' WHERE am_alarmtype = '磁盘';
	UPDATE ecmc_alarmmessage SET am_alarmtype = '0010008001004' WHERE am_alarmtype = '网络';
	
	-- 注意.历史数据的SQL处理完成后，需要在运维中心执行报警缓存的同步操作

-- ECMC权限及URL修改

-- 删除物理服务器菜单
DELETE FROM ecmc_sys_authority WHERE id='40289099576f8d2501576fa1deea0000';
DELETE FROM ecmc_sys_roleauth WHERE auth_id='40289099576f8d2501576fa1deea0000';

-- 新增三项权限
INSERT INTO `ecmc_sys_authority` VALUES ('402890995ab63bae015ab64ce3950000', '云数据库', '资源监控处云数据库及负载均衡新增权限全部与原云主机保持一致', '2017-3-10 11:39:36', '2c91808256f81c44015702bbf9510000', '1', 'ui:mon_resource_clouddata;\nhttp:/ecmc/monitor/instance/getinstancelistforecmclive.do;\nhttp:/ecmc/monitor/instance/getinstancelistforecmclast.do;\nhttp:/ecmc/monitor/instance/getinstancedetailbyid.do;\nhttp:/monitor/instance/getdataversionlist.do;\nhttp:/ecmc/monitor/resource/getinterval.do;\nhttp:/ecmc/monitor/resource/getcharttimes.do;\nhttp:/ecmc/monitor/resource/getmonitordatabyid.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;', 'ff8080815438ac44015438d660ff0015', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995ab63bae015ab64d8b7f0001', '负载均衡（普通模式）', '资源监控处云数据库及负载均衡新增权限全部与原云主机保持一致', '2017-3-10 11:40:19', '2c91808256f81c44015702bbf9510000', '1', 'ui:mon_resource_ldpoolcommon;\nhttp:/ecmc/monitor/ldpool/getecmcldpoolmonitorlist.do;\nhttp:/ecmc/monitor/ldpool/getecmcldpoolexplist.do;\nhttp:/ecmc/monitor/ldpool/getLdPoolDetailById.do;\nhttp:/ecmc/monitor/ldpool/getmemandheanamebyid.do;', 'ff8080815438ac44015438d660ff0015', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995ab63bae015ab64e44640002', '负载均衡（主备模式）', '资源监控处云数据库及负载均衡新增权限全部与原云主机保持一致', '2017-3-10 11:41:07', '2c91808256f81c44015702bbf9510000', '1', 'ui:mon_resource_ldpoolmaster;\nhttp:/ecmc/monitor/ldpool/getecmcldpoolmonitorlist.do;\nhttp:/ecmc/monitor/ldpool/getecmcldpoolexplist.do;\nhttp:/ecmc/monitor/ldpool/getLdPoolDetailById.do;\nhttp:/ecmc/monitor/ldpool/getmemandheanamebyid.do;', 'ff8080815438ac44015438d660ff0015', '0');

-- 运维、管理员有新加的三个权限
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709d1a601e9', '40289092543bd6a801543bfee6a8000b', '402890995ab63bae015ab64ce3950000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709756200c9', '40289092543bd6a801543bff30f2000c', '402890995ab63bae015ab64ce3950000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709756200ca', '40289092543bd6a801543bff30f2000c', '402890995ab63bae015ab64d8b7f0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709d1a601ea', '40289092543bd6a801543bfee6a8000b', '402890995ab63bae015ab64d8b7f0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709d1a601eb', '40289092543bd6a801543bfee6a8000b', '402890995ab63bae015ab64e44640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709756200cb', '40289092543bd6a801543bff30f2000c', '402890995ab63bae015ab64e44640002');






















