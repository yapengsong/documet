
-- 发票的数据字典 by 杨方军
INSERT INTO `sys_data_tree` VALUES ('0019', '发票管理', '0', 15, '0', '发票管理的系统参数配置', '1', NULL, NULL, NULL, 'invoice', NULL);
INSERT INTO `sys_data_tree` VALUES ('0019001', '可开票金额下限', '0019', 1, '0', NULL, '1', '0', NULL, NULL, 'billable_lower_limit', NULL);
INSERT INTO `sys_data_tree` VALUES ('0019002', '取消开票申请原因', '0019', 2, '0', NULL, '1', NULL, NULL, NULL, 'invoice_cancel_reason', NULL);
INSERT INTO `sys_data_tree` VALUES ('0019002001', '证件与开票信息不一致', '0019002', 1, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0019002002', '信息填写有误', '0019002', 2, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0019002003', '已开票', '0019002', 3, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0019003', '快递公司', '0019', 3, '0', NULL, '1', NULL, NULL, NULL, 'invoice_expresses', NULL);
INSERT INTO `sys_data_tree` VALUES ('0019003001', '圆通速递', '0019003', 1, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0019003002', '顺丰速运', '0019003', 2, '0', NULL, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_data_tree` VALUES ('0019004', '不使用快递公司，显示的提示性语句', '0019', 4, '0', NULL, '1', '由相关销售人员送达', NULL, NULL, 'invoice_noexpress_tips', NULL);
