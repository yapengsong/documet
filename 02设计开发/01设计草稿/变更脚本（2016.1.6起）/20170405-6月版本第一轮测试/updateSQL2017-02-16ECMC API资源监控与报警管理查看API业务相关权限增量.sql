INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('402890ba58f0a74a0158f745bfe701ff','查看API服务','查看API服务','2016-12-13 16:21:33','2c91808256f81c44015702bbf9510000','1','ui:mon_api_service;\nhttp:/ecmc/monitor/resource/getApiIndicatorData.do;','ff8080815438ac44015438d660ff0015','0');



INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('4028909159af5e910159b065dec500b3','40289092543bd6a801543bfee6a8000b','402890ba58f0a74a0158f745bfe701ff');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('4028909159874a4c0159875b0f0800f5','40289092543bd6a801543bff30f2000c','402890ba58f0a74a0158f745bfe701ff');


INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0010003003','API','0010003',2,'0','监控项API','1',NULL,NULL,NULL,'API_Monitor',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0010003003001','正确率','0010003003',1,'0','API资源监控，正确率表示','1','%','/^(?:0|[1-9][0-9]?|100)$/',NULL,'Monitor_right_rate',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0010003003002','可用率','0010003003',2,'0','API资源监控，可用率指标','1','%','/^(?:0|[1-9][0-9]?|100)$/',NULL,'Monitor_available',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0010003003003','请求次数','0010003003',3,'0','API资源管理监控项，次数标识','1','次','/^(0|([1-9][0-9]{0,4}))$/',NULL,'Monitor_RequestNumber',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0010003003004','处理时间','0010003003',4,'0','API资源监控，处理时间对应指标','1','ms','/^(0|([1-9][0-9]{0,4}))$/',NULL,'Monitor_dealTime',NULL);

UPDATE `ecmc_sys_authority` SET permission = 'ui:sys_log_query;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/system/log/getecmcloglist.do;\nhttp:/ecmc/system/log/getOperLog.do;\nhttp:/ecmc/system/log/getecscLogList.do;\nhttp:/ecmc/system/log/getecmcloglistbymongon.do;\nhttp:/ecmc/system/log/getOperLogFromMongo.do;\nhttp:/ecmc/system/log/getecscloglistbymongon.do;\nhttp:/ecmc/system/api/log/fetchApiNamesAndResourceTypes.do;\nhttp:/ecmc/api/overview/getcuslistbyorg.do;\nhttp:/ecmc/system/api/log/getloglist.do;\nhttp:/ecmc/system/api/log/getApiNamesByVersion.do;\nhttp:/ecmc/system/api/ecmc/overview/getalldclist.do;' WHERE id = '40288eeb545ff66b01546011b98a0020';