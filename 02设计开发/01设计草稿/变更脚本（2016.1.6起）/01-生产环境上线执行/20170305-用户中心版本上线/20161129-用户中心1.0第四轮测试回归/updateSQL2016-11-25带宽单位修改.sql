-- 根据罗蕾、慧敏确定，带宽原单位Mb改为Mbps
UPDATE sys_data_tree SET para1 = 'Mbps' WHERE node_name_en = 'bandValue';