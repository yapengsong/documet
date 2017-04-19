-- by 杨方军
-- 新增财务角色
INSERT INTO `ecmc_sys_role` VALUES ('402899065aab8bc6015aab95d38e0000', '财务', '系统初始角色', '2017-3-8 09:43:27', '2c91808256f81c44015702bbf9510000', '1', '1', '0');

-- 发票菜单
INSERT INTO `ecmc_sys_menu` VALUES ('402899045ab23d04015ab2442edf0000', '发票管理', NULL, 'app.invoice', 'ff8080815438ac44015438c14b110006', 15, '2017-3-9 16:51:37', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-invoice', '0');

-- 发票权限

INSERT INTO `ecmc_sys_authority` VALUES ('4028990b5ab61ce4015ab629ee990000', '查看发票', NULL, '2017-3-10 11:01:25', '2c91808256f81c44015702bbf9510000', '1', 'ui:invoice_list;\nhttp:/ecmc/invoice/queryinvoiceapplys.do;\nhttp:/ecmc/invoice/getinvoiceapplydetail.do;\nhttp:/invoice/info/image.do;\nhttp:/ecmc/invoice/download.do;', '402899045ab23d04015ab2442edf0000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028990b5ab61ce4015ab62ab6890001', '更改发票状态', NULL, '2017-3-10 11:02:16', '2c91808256f81c44015702bbf9510000', '1', 'ui:invoice_change_status;\nhttp:/ecmc/invoice/getexpressnames.do;\nhttp:/ecmc/invoice/changetoprocessing.do;\nhttp:/ecmc/invoice/changetoinvoiced.do;', '402899045ab23d04015ab2442edf0000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028990b5ab61ce4015ab62b20ae0002', '取消发票', NULL, '2017-3-10 11:02:44', '2c91808256f81c44015702bbf9510000', '1', 'ui:invoice_cancel;\nui:invoice_list;\nhttp:/ecmc/invoice/queryinvoiceapplys.do;\nhttp:/ecmc/invoice/cancelapply.do;\nhttp:/ecmc/invoice/getcancelreasons.do;', '402899045ab23d04015ab2442edf0000', '0');

-- 发票相关的角色菜单
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028994d5ad4d5ce015ad4d9dbb00017', '40289092543bd6a801543bfeb3fa000a', '402899045ab23d04015ab2442edf0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402890ba5ac70011015ac709754d0010', '40289092543bd6a801543bff30f2000c', '402899045ab23d04015ab2442edf0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028994d5ad4d5ce015ad4da84c40037', '40289092543bd6a801543bff655b000d', '402899045ab23d04015ab2442edf0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028994d5ad4d5ce015ad4d98d860003', '402899065aab8bc6015aab95d38e0000', '402899045ab23d04015ab2442edf0000');

-- 财务相关的角色菜单（排除了发票菜单）
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028994d5ad4d5ce015ad4d98d740000', '402899065aab8bc6015aab95d38e0000', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028994d5ad4d5ce015ad4d98d860001', '402899065aab8bc6015aab95d38e0000', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028994d5ad4d5ce015ad4d98d860002', '402899065aab8bc6015aab95d38e0000', 'ff8080815438ac44015438c27e5d0007');

-- 财务相关的角色权限（排除了发票权限）
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d880004', '402899065aab8bc6015aab95d38e0000', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d890005', '402899065aab8bc6015aab95d38e0000', '40289090564a2c2801564a4b4eae0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d890006', '402899065aab8bc6015aab95d38e0000', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d890007', '402899065aab8bc6015aab95d38e0000', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a0008', '402899065aab8bc6015aab95d38e0000', '4028932b576abcd301576ace34f50002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a0009', '402899065aab8bc6015aab95d38e0000', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a000a', '402899065aab8bc6015aab95d38e0000', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a000b', '402899065aab8bc6015aab95d38e0000', '402893e656de3e910156df63bf3501ec');

-- 发票相关的角色权限
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d9dbb3002c', '40289092543bd6a801543bfeb3fa000a', '4028990b5ab61ce4015ab629ee990000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709756a0138', '40289092543bd6a801543bff30f2000c', '4028990b5ab61ce4015ab629ee990000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4da84c80056', '40289092543bd6a801543bff655b000d', '4028990b5ab61ce4015ab629ee990000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a000c', '402899065aab8bc6015aab95d38e0000', '4028990b5ab61ce4015ab629ee990000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709756a0139', '40289092543bd6a801543bff30f2000c', '4028990b5ab61ce4015ab62ab6890001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a000e', '402899065aab8bc6015aab95d38e0000', '4028990b5ab61ce4015ab62ab6890001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402890ba5ac70011015ac709756a013a', '40289092543bd6a801543bff30f2000c', '4028990b5ab61ce4015ab62b20ae0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028994d5ad4d5ce015ad4d98d8a000d', '402899065aab8bc6015aab95d38e0000', '4028990b5ab61ce4015ab62b20ae0002');










