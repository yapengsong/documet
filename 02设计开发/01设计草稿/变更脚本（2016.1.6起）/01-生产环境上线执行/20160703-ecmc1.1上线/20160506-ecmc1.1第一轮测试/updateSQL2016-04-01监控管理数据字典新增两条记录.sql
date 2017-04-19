-- 主机监控详情时间范围增加两个，15天和30天，对应数据字典也增加两条，段彬彬
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007007', '15天', '0010007', 1, '0', '新增，每天一个点，取自一天计划任务', '1', '15', 'd', NULL, '1440', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0010007008', '一个月', '0010007', 1, '0', '新增，每天一个点，取自一天计划任务，显示为一个月，实际处理为31个点', '1', '30', 'd', NULL, '2880', '');
