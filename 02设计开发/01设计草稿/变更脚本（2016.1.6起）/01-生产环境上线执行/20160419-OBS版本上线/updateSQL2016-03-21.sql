/*
2016/03/21 19:07 向数据字典中增加是否开通obs服务和是否在白名单内节点 by 曹翔宇
*/

INSERT INTO `sys_data_tree` VALUES ('0009003', '是否开通obs服务', '0009', '1', '0', '0', '1', '', '', null, 'IsOpenObsService', '');
INSERT INTO `sys_data_tree` VALUES ('0009004', '是否在白名单内', '0009', '1', '0', 'root;', '1', '', '', null, 'IsInWhiteList', '');