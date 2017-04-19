/*
-- vpn资源状态添加的insert语句 
-- Author: 高翔
-- Date: 2016-09-08 11:41
*/
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018','VPN状态','0007002',17,'0',NULL,'1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018001','创建中','0007002018',1,'0',NULL,'1',NULL,NULL,NULL,'PENDING_CREATE',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018002','正常','0007002018',2,'0',NULL,'1',NULL,NULL,NULL,'ACTIVE',NULL);