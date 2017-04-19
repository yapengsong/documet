/* 添加数据字典obs- 2016-02-24 15:29:38 By 曹翔宇*/
INSERT INTO `sys_data_tree` VALUES ('0009', '对象存储基础数据', '0', '1', '0', '对象存储 阀值设置', '1', null, null, null, 'Obs', null);
INSERT INTO `sys_data_tree` VALUES ('0009001', '对象存储阈值设置', '0009', '1', '0', '对象存储阀值设置', '1', '', '', null, 'ObsThreshold', '');
INSERT INTO `sys_data_tree` VALUES ('0009001001', '存储量', '0009001', '1', '0', '0.8', '1', '', '', null, 'ObsStorage', '');
INSERT INTO `sys_data_tree` VALUES ('0009001002', '下载量', '0009001', '1', '0', '200', '1', '', '', null, 'ObsFlow', '');
INSERT INTO `sys_data_tree` VALUES ('0009001003', '请求次数', '0009001', '1', '0', '200', '1', '', '', null, 'ObsRequestCount', '');
INSERT INTO `sys_data_tree` VALUES ('0009002', '对象存储总存储量', '0009', '1', '0', '500', '1', null, null, null, 'ObsTotalStorage', null);