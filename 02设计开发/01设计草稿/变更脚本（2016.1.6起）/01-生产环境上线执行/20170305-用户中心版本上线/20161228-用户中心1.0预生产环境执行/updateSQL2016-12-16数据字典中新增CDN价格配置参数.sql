/*
-- 数据字典中新增CDN价格配置参数
-- Author: 张帆
-- Date: 2016-12-16 11:23
*/
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010004','CDN下载流量','0007004010',4,'0',NULL,'1',NULL,NULL,NULL,'cdnDownload',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010004001','流量','0007004010004',1,'0',NULL,'1','GB','单价计费',NULL,'cdnDownloadFlow',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010005','CDN动态请求数','0007004010',5,'0',NULL,'1',NULL,NULL,NULL,'cdnDreqs',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010005001','次数','0007004010005',1,'0',NULL,'1','千次','单价计费',NULL,'dreqsCount',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010006','CDN-HTTPS请求数','0007004010',6,'0',NULL,'1',NULL,NULL,NULL,'cdnHreqs',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010006001','次数','0007004010006',1,'0',NULL,'1','万次','单价计费',NULL,'hreqsCount',NULL);
