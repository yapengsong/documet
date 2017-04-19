/*
-- Query: SELECT * FROM ecmc01.sys_data_tree where node_id = 0014 or parent_id = 0014
LIMIT 0, 1000

-- Date: 2016-10-19 16:05
*/
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0014','计划任务名称(被监测计划任务)','0',10,'1','管理员可以手动配置被监测的计划任务项，因系统中存在比较多的计划任务，加入此项的目的是为了更有针对性','1',NULL,NULL,NULL,'monitorScheduledTask',NULL);
