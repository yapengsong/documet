
UPDATE sys_data_tree SET para2='单价计费'WHERE para2 ='单价计价';

UPDATE sys_data_tree SET para2='区间计费'WHERE para2 ='区间计价';

UPDATE sys_data_tree SET para2='差值阶梯计费' WHERE node_name_en ='downValue' or node_name_en ='requestCount';
UPDATE sys_data_tree SET para2='阶梯计费' WHERE node_name_en ='spaceCapacity';

UPDATE sys_data_tree SET node_name='下载流量' WHERE node_name_en ='obsDown';
UPDATE sys_data_tree SET node_name='流量' WHERE node_name_en ='downValue';

