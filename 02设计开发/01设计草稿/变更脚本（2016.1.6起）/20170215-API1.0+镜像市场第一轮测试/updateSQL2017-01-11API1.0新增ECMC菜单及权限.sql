-- API1.0新增了一个一级菜单：API管理，下有API概览和限制管理两个子菜单，在系统管理下新增了一个二级菜单：API管理
-- 新增菜单
INSERT INTO `ecmc_sys_menu` (`id`, `name`, `description`, `url`, `parentid`, `orderno`, `createtime`, `createdby`, `enableflag`, `icon`, `lock`) VALUES ('4028909958be99a30158be9e0d350000', 'API管理', NULL, NULL, '', 45, '2016-12-2 16:19:38', '2c91808256f81c44015702bbf9510000', '1', NULL, '0');
INSERT INTO `ecmc_sys_menu` (`id`, `name`, `description`, `url`, `parentid`, `orderno`, `createtime`, `createdby`, `enableflag`, `icon`, `lock`) VALUES ('4028909958be99a30158bea006250001', 'API概览', '图标已定，与系统管理出API管理相同', 'app.apioverview', '4028909958be99a30158be9e0d350000', 10, '2016-12-2 16:21:48', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-api', '0');
INSERT INTO `ecmc_sys_menu` (`id`, `name`, `description`, `url`, `parentid`, `orderno`, `createtime`, `createdby`, `enableflag`, `icon`, `lock`) VALUES ('4028909958be99a30158bea03b880002', '限制管理', '图标已定', 'app.apilimit', '4028909958be99a30158be9e0d350000', 20, '2016-12-2 16:22:01', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-prohibit', '0');
INSERT INTO `ecmc_sys_menu` (`id`, `name`, `description`, `url`, `parentid`, `orderno`, `createtime`, `createdby`, `enableflag`, `icon`, `lock`) VALUES ('4028909958be99a30158bea8df9a0003', 'API管理', '图标已定，与API概览处相同', 'app.apimanage', 'ff8080815438ac44015438d8d5000018', 110, '2016-12-2 16:31:28', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-api', '0');


-- 添加角色和菜单关联记录
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('4028909958ccf5680158ce23d5f60005', '40288ee75456549a015456b8df2e000d', '4028909958be99a30158bea8df9a0003');
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('40289099598b685b01598c5113a10004', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158be9e0d350000');
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('40289099598b685b01598c5113a80026', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158bea006250001');
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('40289099598b685b01598c5113a10005', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158bea03b880002');
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('4028909159874a4c0159875b0ef50007', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158be9e0d350000');
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('4028909159874a4c0159875b0ef50008', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158bea006250001');
INSERT INTO `ecmc_sys_rolemenu` (`id`, `role_id`, `menu_id`) VALUES ('4028909159874a4c0159875b0ef50009', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158bea03b880002');

-- 在新增的菜单下添加权限
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('4028909058f0b66d0158f0c13d4d0000', 'API黑名单', NULL, '2016-12-12 09:59:05', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_black;\nhttp:/ecmc/system/api/getBlackCustomer.do;\nhttp:/ecmc/system/api/getBlackIp.do;\nhttp:/ecmc/system/api/deleteBlack.do;\nhttp:/ecmc/customer/getCustExceptBlackCus.do;\nhttp:/ecmc/system/api/addBlack.do;\nhttp:/ecmc/system/api/checkBlackIpExist.do;', '4028909958be99a30158bea03b880002', '0');
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('4028909958ccf5680158ce21762b0002', '查看', NULL, '2016-12-5 16:37:29', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_switch_phone;\nhttp:/ecmc/api/switch/getapiswitchphone.do;', '4028909958be99a30158bea8df9a0003', '0');
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('4028909958ccf5680158ce22c9a20003', '修改', NULL, '2016-12-5 16:38:56', '2c91808256f81c44015702bbf9510000', '1', 'ui:edit_api_phone;\nhttp:/ecmc/api/switch/sendapiphonecode.do;\nhttp:/ecmc/api/switch/verifyapiphonecode.do;\nhttp:/ecmc/api/switch/editapiswitchphone.do;', '4028909958be99a30158bea8df9a0003', '0');
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('4028909958d6f6850158d70252590000', 'API概览', NULL, '2016-12-7 10:00:03', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_overview;\nhttp:/ecmc/api/overview/getcuslistbyorg.do;\nhttp:/ecmc/api/overview/getapioverviewdetails.do;\nhttp:/ecmc/api/overview/getapidetailspage.do;', '4028909958be99a30158bea006250001', '0');
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('40289099591661400159167207f30000', 'API总开关', NULL, '2016-12-19 17:38:08', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_switch;\nhttp:/ecmc/api/switch/getapiswitch.do;\nhttp:/ecmc/api/switch/getcodeforapiswitch.do;\nhttp:/ecmc/api/switch/operationapiswitch.do;\nhttp:/ecmc/api/switch/getapiswitchphone.do;', '4028909958be99a30158bea03b880002', '0');
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('402890a8590113620159011548a10000', 'API访问次数(默认)', NULL, '2016-12-15 14:04:49', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_restrict_default;\nhttp:/ecmc/system/apicount/getdefaultapicount.do;\nhttp:/ecmc/system/apicount/getdefaultapicountlist.do;\nhttp:/ecmc/system/apicount/updatedefaultapicount.do;', '4028909958be99a30158bea03b880002', '0');


-- 添加角色和权限关联记录
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('4028909958ccf5680158ce23d5fa002a', '40288ee75456549a015456b8df2e000d', '4028909958ccf5680158ce21762b0002');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('4028909958ccf5680158ce23d5fa002b', '40288ee75456549a015456b8df2e000d', '4028909958ccf5680158ce22c9a20003');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('40289099598b685b01598c5113ba006a', '40289092543bd6a801543bfee6a8000b', '4028909058f0b66d0158f0c13d4d0000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('40289099598b685b01598c5113cc00da', '40289092543bd6a801543bfee6a8000b', '4028909958d6f6850158d70252590000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('40289099598b685b01598c5113c10088', '40289092543bd6a801543bfee6a8000b', '40289099591661400159167207f30000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('40289099598b685b01598c5113c60094', '40289092543bd6a801543bfee6a8000b', '402890a8590113620159011548a10000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('4028909159874a4c0159875b0f00008b', '40289092543bd6a801543bff30f2000c', '4028909058f0b66d0158f0c13d4d0000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('4028909159874a4c0159875b0f0400bc', '40289092543bd6a801543bff30f2000c', '4028909958d6f6850158d70252590000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('4028909159874a4c0159875b0f0400bd', '40289092543bd6a801543bff30f2000c', '40289099591661400159167207f30000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('4028909159874a4c0159875b0f0500d4', '40289092543bd6a801543bff30f2000c', '402890a8590113620159011548a10000');
