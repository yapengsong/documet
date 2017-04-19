-- 总览资源类型调整20160506 周海涛
update sys_data_tree set node_name ='计算节点' where node_id='0007002015001';
update sys_data_tree set node_name ='CPU' where node_id='0007002015002';
update sys_data_tree set node_name ='自定义镜像' where node_id='0007002015009';
update sys_data_tree set node_name ='私有网络' where node_id='0007002015011';
delete from sys_data_tree where node_id= '0007002015014';

-- 然后点击数据字典 缓存同步

-- 同步OutIp的数据结构调整
ALTER TABLE `cloud_route`
ADD COLUMN `gateway_ip`  varchar(100) NULL AFTER `network_id`;
ALTER TABLE `cloud_outip`
CHANGE COLUMN `route_id` `used_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用类型' AFTER `subnet_id`;
