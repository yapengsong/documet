/*
-- Query: select * from sys_data_tree where node_name like '%CDN访问令牌%'
LIMIT 0, 1000
-- 导出CDN访问令牌的insert语句 
-- Author: 张帆
-- Date: 2016-06-22 15:34
*/
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0009007','CDN访问令牌','0009',7,'0','Param1 CDN Access Token\nParam2 DNS Access Token','1','a1ce4419-86d9-4d05-a1fe-7abadb52a2e9','14528,85c43feb6d8978901ab82374898a979a',NULL,'CDN Access Token',NULL);
