-- ������Դ���͵���20160506 �ܺ���
update sys_data_tree set node_name ='����ڵ�' where node_id='0007002015001';
update sys_data_tree set node_name ='CPU' where node_id='0007002015002';
update sys_data_tree set node_name ='�Զ��徵��' where node_id='0007002015009';
update sys_data_tree set node_name ='˽������' where node_id='0007002015011';
delete from sys_data_tree where node_id= '0007002015014';

-- Ȼ���������ֵ� ����ͬ��

-- ͬ��OutIp�����ݽṹ����
ALTER TABLE `cloud_route`
ADD COLUMN `gateway_ip`  varchar(100) NULL AFTER `network_id`;
ALTER TABLE `cloud_outip`
CHANGE COLUMN `route_id` `used_type`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ʹ������' AFTER `subnet_id`;
