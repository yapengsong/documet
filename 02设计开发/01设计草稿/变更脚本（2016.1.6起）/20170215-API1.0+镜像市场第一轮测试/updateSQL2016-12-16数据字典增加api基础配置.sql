/*
数据字典增加api基础配置
曹翔宇
Date: 2016-12-16 10:25:01
*/



-- ----------------------------
-- Records of sys_data_tree
-- ----------------------------

INSERT INTO `sys_data_tree` VALUES ('0016', 'API基础配置', '0', '12', '0', null, '1', null, null, null, 'API', null);
INSERT INTO `sys_data_tree` VALUES ('0016001', 'Actions', '0016', '1', '0', null, '1', null, null, null, 'Actions', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001', 'V1', '0016001', '1', '0', null, '1', null, null, null, 'V1', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001', '云主机', '0016001001', '1', '0', null, '1', null, null, null, 'Instance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001001', '创建云主机', '0016001001001', '1', '0', null, '1', '', null, null, 'CreateInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001002', '查询云主机', '0016001001001', '2', '0', null, '1', '', null, null, 'DescribeInstances', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001004', '关闭云主机', '0016001001001', '4', '0', null, '1', '', null, null, 'ShutdownInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001005', '启动云主机', '0016001001001', '5', '0', null, '1', '', null, null, 'StartInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001006', '删除云主机', '0016001001001', '6', '0', null, '1', '', null, null, 'DeleteInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001007', '重启云主机', '0016001001001', '7', '0', null, '1', '', null, null, 'RebootInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001008', '调整云主机配置', '0016001001001', '8', '0', null, '1', '', null, null, 'ResizeInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001009', '修改云主机信息', '0016001001001', '9', '0', null, '1', '', null, null, 'ModifyInstance', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001010', '修改云主机子网', '0016001001001', '10', '0', null, '1', '', null, null, 'ModifyInstanceSubnet', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001011', '云主机加入安全组', '0016001001001', '11', '0', null, '1', '', null, null, 'InstanceJoinSecurityGroup', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001013', '云主机离开安全组', '0016001001001', '13', '0', null, '1', '', null, null, 'InstanceLeaveSecurityGroup', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001001014', '查询安全组', '0016001001001', '14', '0', null, '1', null, null, null, 'DescribeSecurityGroups', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001002', '日志', '0016001001', '2', '0', null, '1', null, null, null, 'Log', null);
INSERT INTO `sys_data_tree` VALUES ('0016001001002001', '操作日志', '0016001001002', '1', '0', null, '1', '', null, null, 'OperationLog', null);
