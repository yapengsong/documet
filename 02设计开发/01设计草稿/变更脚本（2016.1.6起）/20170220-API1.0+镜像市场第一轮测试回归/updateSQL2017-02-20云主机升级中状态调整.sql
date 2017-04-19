-- 修改云主机的 升级中--> 调整中
update sys_data_tree set node_name = '调整中' where node_name ='升级中' and parent_id = '0007002004';