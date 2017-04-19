-- 删除 512MB的内存
delete from sys_data_tree where node_id='0007002001001001';
-- 云主机状态  错误 -- 故障
update sys_data_tree set node_name='故障' where node_id='0007002004006' and node_name='错误';
-- 云主机状态  关机  已关机
update sys_data_tree set node_name='已关机' where node_id='0007002004008' and node_name='关机';
-- 云主机状态  软重启中  重启中
update sys_data_tree set node_name='重启中' where node_id='0007002004012' and node_name='软重启中';
-- 预处理中、待确定、确认调整中 修改为  升级中
update sys_data_tree set node_name='升级中' where node_id in ('0007002004014','0007002004015','0007002004016') and node_name<>'升级中'; 
-- 删除硬重启
delete from sys_data_tree where node_id='0007002004013';
-- 删除取消调整中
delete from sys_data_tree where node_id='0007002004017';
	