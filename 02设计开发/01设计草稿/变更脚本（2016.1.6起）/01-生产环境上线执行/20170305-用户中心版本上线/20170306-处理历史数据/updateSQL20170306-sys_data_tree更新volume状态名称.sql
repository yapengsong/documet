/*
-- volume资源状态更新的语句 
-- Author: 程晓东
-- Date: 2017-03-06
*/

UPDATE sys_data_tree SET node_name = '空闲中' WHERE  node_id = '0007002005003' AND node_name_en='AVAILABLE';

UPDATE sys_data_tree SET node_name = '正常' WHERE  node_id = '0007002006002' AND node_name_en='AVAILABLE';