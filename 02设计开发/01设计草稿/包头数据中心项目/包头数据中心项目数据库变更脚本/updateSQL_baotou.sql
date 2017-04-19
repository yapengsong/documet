-- 1.updateSQL2016-12-09包头数据中心增加关联表ip订单表加字段
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cloud_prj_outnet
-- ----------------------------
DROP TABLE IF EXISTS `cloud_prj_outnet`;
CREATE TABLE `cloud_prj_outnet` (
  `id` varchar(36) NOT NULL,
  `cus_id` varchar(36) DEFAULT NULL,
  `prj_id` varchar(36) DEFAULT NULL,
  `dc_id` varchar(36) DEFAULT NULL,
  `outnet_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE cloudorder_floatip ADD COLUMN outnet_id VARCHAR(36) default NULL;

-- 2.updateSQL2016-12-13包头数据中心删除cloud_outip表的ip唯一索引
alter table cloud_outip drop index idx_ipaddress;

-- 3.updateSQL2016-12-19ECMC权限ecmc_sys_authority
-- ----------------------------
-- Table structure for ecmc_sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_authority`;
CREATE TABLE `ecmc_sys_authority` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  `permission` text NOT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  `lock` char(1) DEFAULT '0' COMMENT '是否加锁，0:false 可被分配分配给角色、删除;1：true 不可被分配给角色、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_authority
-- ----------------------------
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f79d5b10001', '查询客户', '搜索客户', '2016-04-29 08:45:00', 'ff808081543cbe2701543cceba910000', '1', 'ui:customer_query;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7aa40d0003', '创建客户', null, '2016-04-29 08:45:53', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_create;\nui:customer_create;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/project/createproject.do;\nhttp:/ecmc/project/createprojectonly.do;\nhttp://ecmc/quota/template/getallquotatemplate.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyprj.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyoutprj.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7b1fde0005', '编辑客户', null, '2016-04-29 08:46:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:customer_modify;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/customer/modifycustomer.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyprj.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyoutprj.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7bc0ae0007', '编辑项目', null, '2016-04-29 08:47:06', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_modify;\nhttp:/ecmc/project/getprojectbyid.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/modifyproject.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyprj.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyoutprj.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7c3e5c0009', '删除项目', null, '2016-04-29 08:47:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_delete;\nhttp:/ecmc/project/deleteproject.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7f8d66000b', '查询权限', '列表展示、查询和查看详情', '2016-04-29 08:51:15', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_query;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/findauthoritylist.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7ff16c000d', '创建权限', null, '2016-04-29 08:51:41', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_create;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/createauthority.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8079ed000f', '编辑权限', null, '2016-04-29 08:52:15', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_modify;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/modifyauthority.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f80d1980011', '删除权限', null, '2016-04-29 08:52:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_auth_delete;\nhttp:/ecmc/system/authority/deleteauthority.do;', 'ff8080815438ac44015438dace02001e', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f826e99004f', '查询机构', '列表展示、查询和查看详情', '2016-04-29 08:54:24', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_query;\nhttp:/ecmc/system/depart/getdeparttreegrid.do;\nhttp:/ecmc/system/depart/getdeparttree.do;\nhttp:/ecmc/system/depart/getdepartbyid.do', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f82c4d50051', '创建机构', null, '2016-04-29 08:54:46', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_create;\nhttp:/ecmc/system/depart/createdepart.do;\nhttp:/ecmc/system/depart/checkdepartcode.do;', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f83259c0053', '编辑机构', null, '2016-04-29 08:55:11', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_modify;\nhttp:/ecmc/system/depart/modifydepart.do;\nhttp:/ecmc/system/depart/checkdepartcode.do;', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8377fe0055', '删除机构', null, '2016-04-29 08:55:32', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_depart_delete;\nhttp:/ecmc/system/depart/deldepart.do;', 'ff8080815438ac44015438d93963001a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f840aaf0057', '查询菜单', '列表展示、查询和查看详情', '2016-04-29 08:56:09', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_query;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8470cc0059', '创建菜单', null, '2016-04-29 08:56:35', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_create;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/menu/createmenu.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8703f0005b', '编辑菜单', null, '2016-04-29 08:59:24', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_modify;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/menu/modifymenu.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f877367005d', '删除菜单', null, '2016-04-29 08:59:53', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_menu_delete;\nhttp:/ecmc/system/menu/checkfordel.do;\nhttp:/ecmc/system/menu/deletemenu.do;\nhttp:/ecmc/system/menu/getmenubyid.do;', 'ff8080815438ac44015438d98eea001c', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f880c13005f', '查询角色', null, '2016-04-29 09:00:32', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_query;\nhttp:/ecmc/system/role/findrolelist.do;\nhttp:/ecmc/system/role/findroleselectlist.do;\nhttp:/ecmc/system/role/getroledetail.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8873d60061', '创建角色', null, '2016-04-29 09:00:58', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_create;\nhttp:/ecmc/system/role/checkrolename.do;\nhttp:/ecmc/system/role/createrole.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f88bdaa0063', '编辑角色', null, '2016-04-29 09:01:17', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_modify;\nhttp:/ecmc/system/role/checkrolename.do;\nhttp:/ecmc/system/role/modifyrole.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f89384c0065', '删除角色', null, '2016-04-29 09:01:49', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_delete;\nhttp:/ecmc/system/role/deleterole.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f89e5230067', '配置权限', '配置角色拥有哪些权限', '2016-04-29 09:02:33', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_role_distributeAuth;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/getallenableauth.do;\nhttp:/ecmc/system/role/getroledetail.do;\nhttp:/ecmc/system/role/saveroleauth.do', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8ae39a0069', '查询用户', '列表展示、查询和查看详情', '2016-04-29 09:03:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_query;\nhttp:/ecmc/system/user/finduserlist.do;\nhttp:/ecmc/system/user/getuserdetail.do;\nhttp:/ecmc/system/depart/getdeparttreegrid.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8b47c3006b', '创建用户', null, '2016-04-29 09:04:04', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_create;\nhttp:/ecmc/system/user/checkaccount.do;\nhttp:/ecmc/system/user/createuser.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8be3b7006d', '编辑用户', null, '2016-04-29 09:04:43', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_modify;\nhttp:/ecmc/system/user/checkaccount.do;\nhttp:/ecmc/system/user/modifyuser.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f8c52b7006f', '删除用户', null, '2016-04-29 09:05:12', 'ff808081543cbe2701543cceba910000', '1', 'ui:sys_user_delete;\nhttp:/ecmc/system/user/deleteuser.do;', 'ff8080815438ac44015438dbb92e001f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee555a461290155a46d9f1d0001', '历史记录', '查看任务历史记录', '2016-07-01 11:08:15', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:history_task;\nhttp:/ecmc/system/schedule/log/getloglist.do;\nhttp:/ecmc/system/schedule/gettaskname.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee555a461290155a46efb0a0003', '数据统计', '统计任务数据', '2016-07-01 11:09:44', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:statistics_task;\nhttp:/ecmc/system/schedule/statistics/getstatisticslist.do;\nhttp:/ecmc/system/schedule/statistics/getchartdata.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eea53c15b650153c15cadb70000', '创建云主机', '创建云主机3', '2016-03-30 17:32:44', 'dev', '1', 'ui:addVm; http:/ecmc/vm/createVm.do', 'menuId111', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fd895390015', '消息查询', '消息管理的查询', '2016-04-29 10:28:30', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_query;http:/ecmc/system/news/getnewslist.do;http:/ecmc/system/news/getCount.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fd941540017', '创建消息', '消息管理创建消息', '2016-04-29 10:29:14', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_create;http:/ecmc/system/news/createnews.do;\nhttp:/ecmc/system/news/getList.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fd9ac380019', '修改消息', '消息管理-修改消息', '2016-04-29 10:29:41', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_modify;http:/ecmc/system/news/getTimeFlag.do;\nhttp:/ecmc/system/news/updateNewsSendVOE.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fda1beb001b', '删除消息', '消息管理-删除消息', '2016-04-29 10:30:10', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_message_delete;http:/ecmc/system/news/getTimeFlag.do;\nhttp:/ecmc/system/news/deleteById.do;', 'ff8080815438ac44015438c33c7b0009', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe68b600055', '公告查询', '公告管理查询', '2016-04-29 10:43:45', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_query;http:/ecmc/system/notice/listNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe723ef0057', '创建公告', '公告管理-创建公告', '2016-04-29 10:44:24', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_create;http:/ecmc/system/notice/createNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe792b50059', '修改公告', '公告管理-修改公告', '2016-04-29 10:44:52', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_modify;http:/ecmc/system/notice/modifyNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fe7fccd005b', '删除公告', '公告管理-删除公告', '2016-04-29 10:45:19', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_notice_delete;http:/ecmc/system/notice/deleteNotice.do;', 'ff8080815438ac44015438c8999a000a', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545feb3301005f', '数据字典查询', '数据管理', '2016-04-29 10:48:50', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_query;http:/ecmc/system/enum/getdatatreenav.do;\nhttp:/ecmc/system/enum/getdatatreelist.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545febaaf80061', '创建数据字典', '数据管理-创建数据字典', '2016-04-29 10:49:20', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_create;http:/ecmc/system/enum/createdatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fec16a20063', '编辑数据字典', '数据管理-编辑数据字典', '2016-04-29 10:49:48', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_modify;http:/ecmc/system/enum/modifydatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fec79ae0065', '删除数据字典', '数据管理-删除数据字典', '2016-04-29 10:50:13', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_delete;http:/ecmc/system/enum/deletedatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fece84a0067', '缓存同步', '数据字典-缓存同步', '2016-04-29 10:50:42', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_syncCache;http:/ecmc/system/enum/syncdatatree.do;\nhttp:/ecmc/virtual/tag/syncRedisWithDB.do;\nhttp:/ecmc/monitor/alarm/resyncsmsquotacache.do;\nhttp:/ecmc/ecmc/obs/obsview/syncobsuser.do;\nhttp:/ecmc/system/log/syncLog.do;\nhttp:/ecmc/system/log/syncEcmcLog.do;\nhttp:/billing/factor/syncfactorprice.do;\nhttp:/ecmc/customer/synccustomer.do;\nhttp:/monitor/alarm/syncEcscMonitor.do;\nhttp:/ecmc/monitor/alarm/syncEcmcMonitor.do;\nhttp:/ecmc/system/api/synchronizeBlack.do;\nhttp:/ecmc/system/apicount/syncapicount.do', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fed7a6c0069', '节点排序', '数据管理-节点排序', '2016-04-29 10:51:19', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_orderBy;\nhttp:/ecmc/system/enum/getdatatreechildren.do;\nhttp:/ecmc/system/enum/sortdatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545ff66b01546011b98a0020', '日志查询', '日志管理-列表', '2016-04-29 11:30:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_log_query;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/system/log/getecmcloglist.do;\nhttp:/ecmc/system/log/getOperLog.do;\nhttp:/ecmc/system/log/getecscLogList.do;\nhttp:/ecmc/system/log/getecmcloglistbymongon.do;\nhttp:/ecmc/system/log/getOperLogFromMongo.do;\nhttp:/ecmc/system/log/getecscloglistbymongon.do;\nhttp:/ecmc/system/api/log/fetchApiNamesAndResourceTypes.do;\nhttp:/ecmc/api/overview/getcuslistbyorg.do;\nhttp:/ecmc/system/api/log/getloglist.do;\nhttp:/ecmc/system/api/log/getApiNamesByVersion.do;', 'ff8080815438ac44015438dc6dfa0020', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fe908d50016', '查询', '查询，详情。', '2016-04-29 10:46:28', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_query;\nhttp:/ecmc/physical/datacenter/querydatacenter.do;\nhttp:/ecmc/physical/datacenter/querybyid.do;\nhttp:/ecmc/virtual/securitygrouprule/getCloudhostlist.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fe9d58c0018', '编辑', '编辑', '2016-04-29 10:47:20', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_modify;\nhttp:/ecmc/physical/datacenter/querybyid.do;\nhttp:/ecmc/physical/datacenter/updatedatacenter.do;\nhttp:/ecmc/physical/datacenter/checkNameExistOfEdit.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fea5416001a', '创建', '创建数据中心', '2016-04-29 10:47:53', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_create;\nhttp:/ecmc/physical/datacenter/createdatacenter.do;\nhttp:/ecmc/physical/datacenter/checkNameExist.do;\nhttp:/ecmc/physical/datacenter/checkCabinetNum.do;\nhttp:/ecmc/physical/datacenter/checkDcAddressExist.do;\nhttp:/ecmc/physical/datacenter/checkapidccode.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545feb443f001d', '删除', '删除数据中心', '2016-04-29 10:48:54', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_delete;\nhttp:/ecmc/physical/datacenter/checkcannotdelete.do;\nhttp:/ecmc/physical/datacenter/deletedatacenter.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545febd38d001f', '同步数据中心', '同步数据中心', '2016-04-29 10:49:31', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_sync;\nhttp:/ecmc/physical/datacenter/syndatacenter.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600583400015', '查询服务器', '查询，详情', '2016-04-29 11:17:34', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_query;\nhttp:/ecmc/physical/server/queryserver.do;\nhttp:/ecmc/physical/server/getByDcServerId.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600795750018', '编辑服务器', '编辑服务器，编辑前查询', '2016-04-29 11:19:50', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_modify;\nhttp:/ecmc/physical/server/checkNameExist.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/getByServerModelId.do;\nhttp:/ecmc/physical/server/updateserver.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff284015460082bb7001a', '新增服务器', '新增服务器，及数据验证', '2016-04-29 11:20:28', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_create;\nhttp:/ecmc/physical/server/checkNameExist.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/queryByServerModel.do;\nhttp:/ecmc/physical/server/getByServerModelId.do;\nhttp:/ecmc/physical/server/saveserver.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600abc0a001e', '删除服务器', '删除服务器验证', '2016-04-29 11:23:16', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_server_delete;\nhttp:/ecmc/physical/server/deleteserver.do;', 'ff8080815438ac44015438cf239e000d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff2840154600cf4880021', '新增机柜', '新增机柜', '2016-04-29 11:25:42', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_create;\nhttp:/ecmc/physical/cabinet/addcabinet.do;\nhttp:/ecmc/physical/cabinet/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/checkDataCenter.do;\nhttp:/ecmc/physical/cabinet/getcanUseCabinet.do;\nhttp:/ecmc/physical/cabinet/checkTotalCapacity.do;\nhttp:/ecmc/physical/cabinet/getStateByCabinet.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff28401546010327d0024', '编辑机柜', '编辑机柜', '2016-04-29 11:29:14', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_modify;\nhttp:/ecmc/physical/cabinet/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/checkDataCenter.do;\nhttp:/ecmc/physical/cabinet/getcanUseCabinet.do;\nhttp:/ecmc/physical/cabinet/checkTotalCapacity.do;\nhttp:/ecmc/physical/cabinet/getStateByCabinet.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/cabinet/updatecabinet.do;\nhttp:/ecmc/physical/cabinet/queryById.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545ff28401546021065d0026', '查看机柜', '查看，详情', '2016-04-29 11:47:37', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_query;\nhttp:/ecmc/physical/cabinet/querycabinet.do;\nhttp:/ecmc/physical/cabinet/queryEquById.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eef54745b0301547460906e0004', 'IP查看', 'IP-IP查看', '2016-05-03 10:09:26', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:phy_outip_query;http:/ecmc/overview/getallcustomerlist.do;http:/ecmc/virtual/cloudoutip/outiplist.do;http:/ecmc/virtual/cloudoutip/getOutip.do;', 'ff8080815438ac44015438d3aa7a0013', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609040600001', '删除机柜', '删除', '2016-04-29 13:49:07', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_cabinet_delete;\nhttp:/ecmc/physical/cabinet/deletecabinet.do;', 'ff8080815438ac44015438cfcf98000e', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609110f80004', '查询交换机', '查询，详情', '2016-04-29 13:50:00', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_query;\nhttp:/ecmc/physical/switch/queryswitch.do;\nhttp:/ecmc/physical/switch/queryById.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e1301546093b4ad0007', '新增交换机', '新增交换机', '2016-04-29 13:52:53', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_create;\nhttp:/ecmc/physical/switch/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/physical/switch/addswitch.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e1301546096ee16000b', '编辑交换机', '编辑交换机', '2016-04-29 13:56:24', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_modify;\nhttp:/ecmc/physical/switch/checkNameExist.do;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/physical/switch/updateswitch.do;\nhttp:/ecmc/physical/switch/queryById.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460978752000d', '删除交换机', '删除', '2016-04-29 13:57:03', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_switch_delete;\nhttp:/ecmc/physical/switch/deleteswitch.do;', 'ff8080815438ac44015438d03f87000f', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609a88070010', '新增存储', '新增存储', '2016-04-29 14:00:20', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_create;\nhttp:/ecmc/physical/cabinet/getcabinet.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/physical/storage/queryDcStorageCreate.do;\nhttp:/ecmc/physical/storage/checkNameExist.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609b23ab0012', '查询存储', '查询，详情', '2016-04-29 14:01:00', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_query;\nhttp:/ecmc/physical/storage/queryDcStorage.do;\nhttp:/ecmc/physical/storage/queryDcStorageById.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609d629b0015', '编辑存储', '编辑存储', '2016-04-29 14:03:27', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_modify;\nhttp:/ecmc/physical/storage/queryDcStorageById.do;\nhttp:/ecmc/physical/storage/queryDcStorageUpdate.do;\nhttp:/ecmc/physical/storage/checkNameExistOfEdit.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609e2b450017', '删除存储', '删除', '2016-04-29 14:04:19', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_storage_delete;\nhttp:/ecmc/physical/storage/queryDcStorageDel.do;', 'ff8080815438ac44015438d1075f0010', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e130154609fd4be001b', '查询防火墙', '查询，详情', '2016-04-29 14:06:08', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_query;\nhttp:/ecmc/physical/firewall/queryfirewall.do;\nhttp:/ecmc/physical/firewall/queryById.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a114ab001d', '新增防火墙', '新增防火墙', '2016-04-29 14:07:29', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_create;\nhttp:/ecmc/physical/firewall/createfirewall.do;\nhttp:/ecmc/physical/firewall/checkNameExist.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a233de001f', '编辑防火墙', '编辑防火墙', '2016-04-29 14:08:43', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_modify;\nhttp:/ecmc/physical/firewall/checkNameExistOfEdit.do;\nhttp:/ecmc/physical/firewall/queryById.do;\nhttp:/ecmc/physical/firewall/updatefirewall.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a2988b0021', '删除防火墙', '删除防火墙', '2016-04-29 14:09:09', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_firewall_delete;\nhttp:/ecmc/physical/firewall/deletefirewall.do;', 'ff8080815438ac44015438d199e40011', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a473cf0024', '查询型号维护', '查询，详情', '2016-04-29 14:11:10', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_query;\nhttp:/ecmc/physical/servermodel/querylist.do;\n\nhttp:/ecmc/physical/servermodel/getDcServerOne.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a76d310026', '新增型号维护', '新增型号维护', '2016-04-29 14:14:25', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_create;\nhttp:/ecmc/physical/servermodel/createModel.do;\nhttp:/ecmc/physical/servermodel/checkNameExist.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a7dfd60028', '编辑型号维护', '编辑型号维护', '2016-04-29 14:14:55', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_modify;\n http:/ecmc/physical/servermodel/getDcServerOne.do;\n http:/ecmc/physical/servermodel/checkNameExistOfEdit.do;\n http:/ecmc/physical/servermodel/updateModel.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef354608e13015460a98624002b', '删除型号维护', '删除型号维护', '2016-04-29 14:16:43', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_servermodel_delete;\n http:/ecmc/physical/servermodel/checkUseOrNo.do;\n http:/ecmc/physical/servermodel/deleteModel.do;', 'ff8080815438ac44015438d2dc4a0012', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c121201557c13b5730001', '查询', null, '2016-06-23 15:05:14', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:task_query;\nhttp:/ecmc/system/schedule/gettasklist.do;\nhttp:/ecmc/system/schedule/gettask.do;\nhttp:/ecmc/system/schedule/checkbeanname.do;\nhttp:/ecmc/system/schedule/checkmethodname.do;\nhttp:/ecmc/system/schedule/checkcronexpression.do;\nhttp:/ecmc/system/schedule/log/getloglist.do;\nhttp:/ecmc/system/schedule/statistics/getstatisticslist.do;\nhttp:/ecmc/system/schedule/statistics/getchartdata.do;\nhttp:/ecmc/system/schedule/getalltaskid.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c121201557c21c18000d7', '添加', null, '2016-06-23 15:20:34', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:task_add;\nhttp:/ecmc/system/schedule/addtask.do', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c2fe201557c4a12db0005', '修改', null, '2016-06-23 16:04:37', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:modify_task;\nhttp:/ecmc/system/schedule/modifytask.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c2fe201557c4b326a0007', '删除', null, '2016-06-23 16:05:50', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:delete_task;\nhttp:/ecmc/system/schedule/deletetask.do', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c2fe201557c4c66930009', '触发任务', null, '2016-06-23 16:07:09', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:trigger_task;\nhttp:/ecmc/system/schedule/triggertask.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c2fe201557c4d2eb4000b', '恢复任务', null, '2016-06-23 16:08:00', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:resume_task;\nhttp:/ecmc/system/schedule/resumetask.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ef3557c2fe201557c4e2173000d', '暂停任务', null, '2016-06-23 16:09:03', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:pause_task;\nhttp:/ecmc/system/schedule/pausetask.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460a057880009', '负载均衡', '负载均衡一级菜单是否可见', '2016-04-29 14:06:41', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460a26b7c000a', '负载均衡-负载均衡器', '负载均衡器是否可见', '2016-04-29 14:08:57', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460a34c75000b', '负载均衡-健康检查', '健康检查是否可见', '2016-04-29 14:09:55', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460a6814c000c', '负载均衡器创建', '创建负载均衡器', '2016-04-29 14:13:25', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_c;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/virtual/floatip/getNetworkByPrj.do;\nhttp:/ecmc/virtual/floatip/getSubnetByNetwork.do;\nhttp:/ecmc/virtual/loadbalance/pool/checkpoolname.do;\nhttp:/ecmc/virtual/loadbalance/pool/createBalancer.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460ac65b6000d', '负载均衡器查询', '查询负载均衡器列表', '2016-04-29 14:19:51', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_r;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/virtual/loadbalance/pool/querypool.do;\nhttp:/ecmc/virtual/loadbalance/pool/getLoadBalanceById.do;\nhttp:/ecmc/virtual/loadbalance/member/getMemberList.do;\nhttp:/ecmc/virtual/networkout/selectoutnet.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460b43a81000e', '负载均衡器编辑', '编辑负载均衡器', '2016-04-29 14:28:24', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_u;\nhttp:/ecmc/virtual/loadbalance/pool/checkpoolname.do;\nhttp:/ecmc/virtual/loadbalance/pool/updateBalancer.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460b56dd1000f', '负载均衡器删除', '删除负载均衡器', '2016-04-29 14:29:43', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_d;\nhttp:/ecmc/virtual/loadbalance/pool/deleteBalancer.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bb30970010', '负载均衡器绑定公网IP', '', '2016-04-29 14:36:01', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_bindfloip;\nhttp:/ecmc/virtual/floatip/getUnBindFloatIp.do;\nhttp:/ecmc/virtual/floatip/bindResource.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bbbafe0011', '负载均衡器解绑公网IP', '', '2016-04-29 14:36:36', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_unbindfloip;\nhttp:/ecmc/virtual/floatip/unbundingResource.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bdcd3c0012', '负载均衡器健康检查', '', '2016-04-29 14:38:52', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_hm;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/getMonitorListByPool.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/bindHealthMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bea2d40013', '负载均衡器添加成员', null, '2016-04-29 14:39:46', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_addmember;\nhttp:/ecmc/virtual/loadbalance/member/getMemeberListBySubnet.do;\nhttp:/ecmc/virtual/loadbalance/member/checkMemberExsit.do;\nhttp:/ecmc/virtual/loadbalance/member/addMember.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bf305c0014', '负载均衡器编辑成员', null, '2016-04-29 14:40:23', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_editmember;\nhttp:/ecmc/virtual/loadbalance/member/updateMember.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bfab040015', '负载均衡器删除成员', null, '2016-04-29 14:40:54', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_deletemember;\nhttp:/ecmc/virtual/loadbalance/member/deleteMember.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c0b52f0016', '健康检查查询', null, '2016-04-29 14:42:02', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_r;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/listmonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c111230017', '健康检查创建', null, '2016-04-29 14:42:26', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_c;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/checkhealthmonitorname.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/createMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c1753c0018', '健康检查编辑', null, '2016-04-29 14:42:51', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_u;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/checkhealthmonitorname.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/updatemonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460c1b04d0019', '健康检查删除', null, '2016-04-29 14:43:06', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_hm_d;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/deleteHealthMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe510154600f2ecf00c7', '创建安全组', '创建安全组', '2016-04-29 11:28:08', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_create;\nhttp:/ecmc/virtual/securitygroup/createsecuritygroup.do;\nhttp:/ecmc/virtual/securitygroup/checksecuritygroupname.do;\nhttp:/ecmc/virtual/securitygroup/updateecscsecuritygroup.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546086b8c8019e', '管理规则', '安全组管理规则：添加和删除规则', '2016-04-29 13:38:42', 'ff808081543cbe2701543cceba910000', '0', 'ui:securitygroup_managerule;\nhttp:/ecmc/virtual/securitygrouprule/createrule.do;\nhttp:/ecmc/virtual/securitygrouprule/deleterulebyid.do;\nhttp:/ecmc/virtual/securitygroup/listallgroups.do;\nhttp:/ecmc/virtual/cloudfirewall/getFwByIdDetail.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe510154608878dc01a1', '删除安全组', '删除安全组', '2016-04-29 13:40:37', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_delete;\nhttp:/ecmc/virtual/securitygroup/deletesecuritygroup.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe510154608fbe0401a5', '查看防火墙', '查看防火墙：防火墙、防火墙策略和防火墙规则都可查看、查询及查看相关详情', '2016-04-29 13:48:33', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_query;\nhttp:/ecmc/virtual/cloudfirewall/list.do;\nhttp:/ecmc/virtual/cloudfwpoliy/querylist.do;\nhttp:/ecmc/virtual/cloudfwrule/list.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getByFwrIdList.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getByFwrId.do;\nhttp:/ecmc/virtual/cloudfwpoliy/editFwRule.do;\nhttp:/ecmc/virtual/cloudfirewall/getById.do;\nhttp:/ecmc/virtual/cloudfwpoliy/queryById.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546092b20a01a7', '创建防火墙', '创建防火墙 ：防火墙、防火墙策略和防火墙规则都可创建', '2016-04-29 13:51:47', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_create;\nhttp:/ecmc/virtual/cloudfirewall/createFireWall.do;\nhttp:/ecmc/virtual/cloudfwpoliy/createPolicy.do;\nhttp:/ecmc/virtual/cloudfwrule/createfwRule.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getFwpListByPrjId.do;\nhttp:/ecmc/virtual/cloudfirewall/getById.do;\nhttp:/ecmc/virtual/cloudfirewall/createFwAndPoliyAndRule.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546094514001a9', '编辑防火墙', '编辑防火墙：编辑防火墙、防火墙策略和防火墙规则', '2016-04-29 13:53:33', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_modify;\nhttp:/ecmc/virtual/cloudfirewall/updateFireWall.do;\nhttp:/ecmc/virtual/cloudfwpoliy/updatePolicy.do;\nhttp:/ecmc/virtual/cloudfwrule/updatefwRule.do;\nhttp:/ecmc/virtual/cloudfwrule/checkFwRuleName.do;\nhttp:/ecmc/virtual/cloudfwpoliy/queryIdandName.do;\nhttp:/ecmc/virtual/cloudfirewall/checkFirewallName.do;\nhttp:/ecmc/virtual/cloudfwpoliy/checkFwPolicyName.do;\nhttp:/ecmc/virtual/cloudfwpoliy/getPolicyListByDcIdPrjId.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe5101546095699801ab', '删除防火墙', '删除防火墙：删除和修改防火墙、防火墙策略和防火墙规则', '2016-04-29 13:54:45', 'ff808081543cbe2701543cceba910000', '1', 'ui:firewall_delete;\nhttp:/ecmc/virtual/cloudfirewall/deleteFireWall.do;\nhttp:/ecmc/virtual/cloudfwpoliy/deletePolicy.do;\nhttp:/ecmc/virtual/cloudfirewall/deleteFwAndPoliyAndRule.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090545fbe51015460c63b250318', '查看安全组', '查看安全组：没有此权限则此页签不展示', '2016-04-29 14:48:04', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_qurey;\nhttp:/ecmc/virtual/securitygroup/querysecuritygroup.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/virtual/securitygroup/getsecuritygroupbyid.do;\nhttp:/ecmc/virtual/securitygroup/getrulesbysgid.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909054754fc4015475ce5a4a0126', '编辑安全组', '编辑安全组', '2016-05-03 16:48:58', 'ff808081543cbe2701543cceba910000', '1', 'ui:securitygroup_modify;\nhtttp:/ecmc/virtual/securitygroup/checksecuritygroupname.do;\nhttp:/ecmc/virtual/securitygroup/updatesecuritygroup.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090564a2c2801564a40aa5d0000', '冻结账户', 'ecmc管理员有权限冻结客户账户', '2016-08-02 15:56:07', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:customer_block;\nhttp:/ecmc/customer/blockCustomer.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090564a2c2801564a4660de0001', '解冻账户', 'ecmc管理员有权限冻结客户账户', '2016-08-02 16:02:21', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:customer_unblock;\nhttp:/ecmc/customer/unblockCustomer.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289090564a2c2801564a4b4eae0002', '调整账户金额', '管理员和财务人员拥有调整账户余额的权限', '2016-08-02 16:07:44', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:customer_adjustmoney;\nhttp:/ecmc/costcenter/accountoverview/getaccountbalance.do;\nhttp:/ecmc/customer/changeBalance.do;\nhttp:/ecmc/customer/testCustomer.do', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547af70d5a0004', '云硬盘_查看', '查看云硬盘，包含云硬盘列表、查询及详情。三个一体化', '2016-05-04 16:51:31', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_query;\nhttp:/ecmc/cloud/volume/getvolumelist.do;\nhttp:/ecmc/cloud/volume/getvolumebyid.do;\nhttp:/ecmc/cloud/snapshot/getsnaplistbyvolid.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b05cb5a00b9', '云硬盘_创建', '用于云硬盘创建的权限', '2016-05-04 17:07:37', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_create;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getprojectlistbydcid.do;\nhttp:/ecmc/cloud/volume/getvolumebyname.do;\nhttp:/ecmc/cloud/snapshot/addvolume.do;\nhttp:/ecmc/cloud/volume/addvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b0d78f002c1', '云硬盘_删除', '用于云硬盘删除的权限', '2016-05-04 17:16:01', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_delete;\nhttp:/ecmc/cloud/volume/deletevolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b1ba72b037d', '云硬盘_编辑', '用于云硬盘编辑的权限', '2016-05-04 17:31:30', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_modify;\nhttp:/ecmc/cloud/volume/getvolumebyname.do;\nhttp:/ecmc/cloud/volume/updatevolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b2d463b0439', '云硬盘_挂载', '用于云硬盘挂载的权限', '2016-05-04 17:50:45', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_bind;\nhttp:/ecmc/cloud/vm/getcanbindcloudvmList.do;\nhttp:/ecmc/cloud/vm/getdiskcountbyvm.do;\nhttp:/ecmc/cloud/volume/bindvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b3bb16a04f0', '云硬盘_解绑', '用于云硬盘解绑的权限', '2016-05-04 18:06:30', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_debind;\nhttp:/ecmc/cloud/volume/debindvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b46bc8105ab', '云硬盘_创建快照', '用于云硬盘创建快照的权限', '2016-05-04 18:18:33', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_cresnap;\nhttp:/ecmc/cloud/snapshot/getsnapbyname.do;\nhttp:/ecmc/cloud/snapshot/addsnapshot.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b4c16560666', '云硬盘快照_查看', '用于云硬盘快照查看权限', '2016-05-04 18:24:24', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_volume_snapshot;\nhttp:/ecmc/cloud/snapshot/getsnapshotlist.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b5454420723', '云硬盘快照_编辑', '用于硬盘快照编辑的权限', '2016-05-04 18:33:24', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:snapshot_modify;\nhttp:/ecmc/cloud/snapshot/getsnapbyname.do;\nhttp:/ecmc/cloud/snapshot/updatesnapshot.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289091547ae92201547b5b42d607e8', '云硬盘快照_删除', '用于硬盘快照删除的权限', '2016-05-04 18:40:59', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:snapshot_delete;\nhttp:/ecmc/cloud/snapshot/deletesnap.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bf9c69d0006', '工单邮件_接受所有工单', '新建任何工单时可以接收邮件的人', '2016-05-09 11:43:25', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptAllOrder;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bfba88c0007', '工单邮件_接受普通类工单', '有普通工单权限的人（新建，取消，超时时接受邮件的权限）', '2016-05-09 11:42:29', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptMormalOrder;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bfccdf00008', '工单邮件_接受特殊类工单', '特殊类别工单权限的人（新建，取消，超时时接受邮件的权限）', '2016-05-09 11:40:44', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptSpecialOrder;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092543bd6a801543bfde6460009', '工单邮件_接受未按时受理或响应的工单', '未按时受理或响应的工单发送邮件能接受的人', '2016-05-09 11:41:55', '40289092543bcc8c01543bd161c40000', '1', 'java:acceptOrderIfNoOneProcess;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092544c795d01544ca94fe60000', '工单_修改别人创建的工单', '修改ecmc用户创建的工单', '2016-05-09 11:36:05', '40289092543bd6a801543c8a2fd7002a', '1', 'ui:workorder_update;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/updateecmcworkorder.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547a07b201547a5098d50009', '外网-删除子网', '删除外部网络子网', '2016-05-04 13:49:42', '40289092543bcc8c01543bd161c40000', '1', 'ui:outsubnet_delete;\nhttp:/ecmc/virtual/outsubnetwork/deletesubnetwork.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f8f52290243', '外网-查看', '查看网布网络', '2016-05-05 14:16:19', '40289092543bcc8c01543bd161c40000', '1', 'ui:outnetwork_query;\nhttp:/ecmc/virtual/networkout/queryoutnetwork.do;\nhttp:/ecmc/virtual/networkout/getoutnetworkdetail.do;\nhttp:/ecmc/virtual/outsubnetwork/querysubnetwork.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f8fde830245', '外网-添加子网', '添加子网外网', '2016-05-05 14:16:55', '40289092543bcc8c01543bd161c40000', '1', 'ui:outsubnet_add;\nhttp:/ecmc/virtual/outsubnetwork/addsubnetwork.do;\nhttp:/ecmc/virtual/outsubnetwork/checkoutsubnetname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f9086650247', '外网-编辑子网', '编辑外网子网', '2016-05-05 14:17:38', '40289092543bcc8c01543bd161c40000', '1', 'ui:outsubnet_edit;\nhttp:/ecmc/virtual/outsubnetwork/updatesubnetwork.do;\nhttp:/ecmc/virtual/outsubnetwork/checkoutsubnetname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092547e8e3e01547f91499d0249', '外网-编辑网络', '编辑外部网络', '2016-05-05 14:18:28', '40289092543bcc8c01543bd161c40000', '1', 'ui:outnetwork_edit;\nhttp:/ecmc/virtual/networkout/modoutnetwork.do;\nhttp:/ecmc/virtual/networkout/checknetname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909254958b4901549596b3a30112', '工单参与人查询_工单参与人员', '参与工单流程的人员', '2016-05-09 11:44:02', '40289092543bcc8c01543bd161c40000', '1', 'java:WorkorderAllUser', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909254c171590154c172f4f00001', '工单_可被求助', '可以被求助的工程师', '2016-05-18 09:20:17', '40289092543bcc8c01543bd161c40000', '1', 'java:trueToOtherUser', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092559069cd01559073979f0008', '邮件查询', '邮件查询', '2016-06-27 14:02:22', '40289092543bcc8c01543bd161c40000', '1', 'ui:mail_find;\nhttp://ecmc/mailbll/getmaillist.do;\nhttp:///ecmc/mailbll/getmailstatuslist.do;', '40289092559069cd0155907110460006', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289092559069cd01559074c804000a', '邮件重发', '邮件的重新发送', '2016-06-27 14:03:40', '40289092543bcc8c01543bd161c40000', '1', 'ui:mail_retry;\nhttp://ecmc/mailbll/sendmailbyuser.do', '40289092559069cd0155907110460006', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890955460f136015460f8d07b0001', '资源总览查看', '总览-资源总览查询', '2016-04-29 15:43:19', 'ff808081543cbe2701543cceba910000', '1', 'ui:ecmc_overview_dcList;http:/ecmc/overview/getdcresourcelist.do;http:/ecmc/overview/getresourcetypelist.do;', 'ff8080815438ac44015438bb40b20000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890955460f136015460fdea770006', '项目总览查看', '总览-项目总览-查看', '2016-04-29 15:48:54', 'ff808081543cbe2701543cceba910000', '1', 'ui:ecmc_overview_prjList;http:/ecmc/overview/getprjresourcelist.do;http:/ecmc/overview/getallcustomerlist.do;http:/ecmc/overview/getallprojectlist.do;', 'ff8080815438ac44015438bb40b20000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909556c1614f0156c19753710000', '云主机_修改子网', '云主机修改子网功能', '2016-08-25 20:05:35', '40289095547ea16201547ea5b79a0001', '1', 'ui:vir_vm_modify_subnet;\nhttp:/ecmc/cloud/vm/querySubnetByNet.do;\nhttp:/ecmc/cloud/vm/checkVmIpUsed.do;\nhttp:/ecmc/cloud/vm/modifysubnet.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909556d54c4a0156d550a0130000', '回收站-云主机列表', null, '2016-08-29 16:00:46', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_host_list;\nhttp:/ecmc/cloud/vm/getrecyclevmpagelist.do', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909556d54c4a0156d551f3d40001', '回收站-云主机详情', null, '2016-08-29 16:02:13', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_host_detail', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909556d54c4a0156d552850a0002', '回收站-删除云主机', null, '2016-08-29 16:02:50', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_host_delete', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909557758eff01577596b5760000', '云主机_状态同步', null, '2016-09-29 18:56:33', '2c91808256f81c44015702bbf9510000', '1', 'ui:vm_refresh_status;\nhttp:/ecmc/cloud/vm/refreshstatus.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995475666c0154756ae2d50003', '自定义镜像_查看', '查看自定义镜像，包含自定义镜像列表、查询及详情。三个一体化', '2016-05-03 15:00:19', 'ff808081543cbe2701543cceba910000', '1', 'ui:image_customimage;\nhttp:/ecmc/cloud/image/getimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995475666c0154756f31760006', '自定义镜像_编辑', '编辑自定义镜像', '2016-05-03 15:05:02', 'ff808081543cbe2701543cceba910000', '1', 'ui:customimage_edit;\nhttp:/ecmc/cloud/image/updatepersonimage.do;\nhttp:/ecmc/cloud/image/checkimagename.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890995475666c0154757016ab0009', '自定义镜像_删除', null, '2016-05-03 15:06:00', 'ff808081543cbe2701543cceba910000', '1', 'ui:customimage_delete;\nhttp:/ecmc/cloud/image/deleteimage.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b427a1f0008', '公共镜像_查看', '查看、查询、详情', '2016-05-04 18:13:54', 'ff808081543cbe2701543cceba910000', '1', 'ui:image_publicimage;\nhttp:/ecmc/cloud/image/getconimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/vm/getallvmsyslist.do;\nhttp:/ecmc/cloud/image/checksavingcount.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b43be70000a', '公共镜像_编辑', null, '2016-05-04 18:15:17', 'ff808081543cbe2701543cceba910000', '1', 'ui:publicimage_edit;\nhttp:/ecmc/cloud/image/updatepublicimage.do;\nhttp:/ecmc/cloud/image/checkimagename.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b44b481000c', '公共镜像_上传', null, '2016-05-04 18:16:20', 'ff808081543cbe2701543cceba910000', '1', 'ui:publicimage_add;\nhttp:/ecmc/cloud/image/createpublicimage.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/image/checkimagename.do;\nhttp:/ecmc/cloud/vm/getoslist.do;\nhttp:/ecmc/cloud/vm/getsystypelistbyos.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099547b104601547b456b78000e', '公共镜像_删除', null, '2016-05-04 18:17:07', 'ff808081543cbe2701543cceba910000', '1', 'ui:publicimage_delete;\nhttp:/ecmc/cloud/image/deleteimage.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909955a082c90155a08fcbe80003', 'CDN服务', null, '2016-06-30 17:07:06', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:obs_cdn;\nhttp:/ecmc/obs/cdn/getobscdncustomer.do;\nhttp:/ecmc/obs/cdn/getdomaindata.do;\nhttp:/ecmc/obs/cdn/getmonthdomaindata.do;\nhttp:/ecmc/obs/cdn/getmonthdomainpage.do;\nhttp:/ecmc/obs/cdn/getalldomainlist.do;', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099562538b00156253dfa450001', '价格配置列表查看', '查看列表', '2016-07-26 11:27:13', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:price_config;\nhttp:/billing/factor/getfactorsbytypedcid.do;\nhttp:/billing/factor/getpricesbypaytype.do;\nhttp:/billing/factor/getallresourcestype.do;\nhttp:/ecmc/overview/getalldclist.do;', '402890995621747901562187c9ad0001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099567cb38a01567cbd08700001', '查询在线人数', null, '2016-08-12 11:12:58', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:cusonline_query;\nhttp:/ecmc/syssetup/ol/getpagedolcuslist.do;\nhttp:/ecmc/syssetup/ol/getolcusamount.do;', '40289099567cb38a01567cb80d6e0000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099567cb38a01567cbdd5e90002', '导出统计', null, '2016-08-12 11:13:51', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:cusonline_export;\nhttp:/ecmc/syssetup/ol/exportolstatistics2excel.do;', '40289099567cb38a01567cb80d6e0000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099576f8d2501576fa1deea0000', '查看物理服务器', '查看物理服务器监控，功能暂未实现', '2016-09-28 15:11:01', '2c91808256f81c44015702bbf9510000', '1', 'ui:mon_server', 'ff8080815438ac44015438d660ff0015', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099576f8d2501576fd663ef043b', '配置预付费价格', '包含添加、编辑和删除', '2016-09-28 16:08:23', '2c91808256f81c44015702bbf9510000', '1', 'ui:price_pay_before;\nhttp:/billing/factor/editfactorprice.do;\nhttp:/billing/factor/addfactorprice.do;\nhttp:/billing/factor/deletefactorprice.do;', '402890995621747901562187c9ad0001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289099576f8d2501576fd71e9c043c', '配置后付费价格', '包含添加、编辑和删除', '2016-09-28 16:09:11', '2c91808256f81c44015702bbf9510000', '1', 'ui:price_pay_after;\nhttp:/billing/factor/editfactorprice.do;\nhttp:/billing/factor/addfactorprice.do;\nhttp:/billing/factor/deletefactorprice.do;', '402890995621747901562187c9ad0001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909958ccf5680158ce08eaf20001', '限制管理', null, '2016-12-05 16:10:40', '2c91808256f81c44015702bbf9510000', '1', 'http:/ecmc/system/api/getBlackCustomer.do;\nhttp:/ecmc/system/api/getBlackIp.do;\nhttp:/ecmc/system/api/deleteBlack.do;\nhttp:/ecmc/customer/getCustExceptBlackCus.do;\nhttp:/ecmc/system/api/addBlack.do;\nhttp:/ecmc/system/api/checkBlackIpExist.do;\nhttp:/ecmc/api/switch/getapiswitch.do;\nhttp:/ecmc/api/switch/getcodeforapiswitch.do;\nhttp:/ecmc/api/switch/operationapiswitch.do;\nhttp:/ecmc/api/switch/getapiswitchphone.do;\nhttp:/ecmc/system/apicount/getdefaultapicount.do', '4028909958be99a30158bea03b880002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909958ccf5680158ce21762b0002', '查看', null, '2016-12-05 16:37:29', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_switch_phone;\nhttp:/ecmc/api/switch/getapiswitchphone.do;', '4028909958be99a30158bea8df9a0003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909958ccf5680158ce22c9a20003', '修改', null, '2016-12-05 16:38:56', '2c91808256f81c44015702bbf9510000', '1', 'ui:edit_api_phone;\nhttp:/ecmc/api/switch/sendapiphonecode.do;\nhttp:/ecmc/api/switch/verifyapiphonecode.do;\nhttp:/ecmc/api/switch/editapiswitchphone.do;', '4028909958be99a30158bea8df9a0003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028909958d6f6850158d70252590000', 'API概览', null, '2016-12-07 10:00:03', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_overview;\nhttp:/ecmc/api/overview/getcuslistbyorg.do;\nhttp:/ecmc/api/overview/getapioverviewdetails.do;\nhttp:/ecmc/api/overview/getapidetailspage.do;', '4028909958be99a30158bea006250001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154760f6fdf0030', '消除报警', '消除报警', '2016-05-03 18:00:03', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_alarm_remove;\nhttp:/ecmc/monitor/alarm/eraseecmcmsgbyids.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154761e15f000eb', '修改报警规则', '修改规则', '2016-05-03 18:16:03', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_alarm_modify;\nhttp:/ecmc/monitor/alarm/getjsonforecmcruleparams.do;\nhttp:/ecmc/monitor/alarm/getecmctriggeroperator.do;\nhttp:/ecmc/monitor/alarm/getecmctriggertimes.do;\nhttp:/ecmc/monitor/alarm/getzblistbyitem.do;\nhttp:/ecmc/monitor/alarm/updateecmcrule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154762212950193', '创建报警规则', '创建和复制规则、管理报警对象和报警联系人', '2016-05-03 18:20:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_alarm_create;\nhttp:/ecmc/monitor/alarm/addecmcalarmrule.do;\nhttp:/ecmc/monitor/alarm/copyecmcalarmrule.do;\nhttp:/ecmc/monitor/alarm/getecmcobjlistoutrule.do;\nhttp:/ecmc/monitor/alarm/getallconsgroupby.do;\nhttp:/ecmc/monitor/alarm/addecmcobjtorule.do;\nhttp:/ecmc/monitor/alarm/addecmcconstorule.do;\nhttp:/ecmc/monitor/alarm/removeecmcobjfromrule.do;\nhttp:/ecmc/monitor/alarm/removeecmcconfromrule.do;\nhttp:/ecmc/monitor/alarm/getallalarmcontacts.do;\nhttp:/ecmc/monitor/alarm/addAllecmcobjtorule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba01547627e4a30242', '删除报警规则', '删除报警规则', '2016-05-03 18:26:46', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_alarm_delete;\nhttp:/ecmc/monitor/alarm/deleteecmcalarmrule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154764060810311', '管理联系人_创建', '创建联系人', '2016-05-03 18:53:31', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_create;\nhttp:/ecmc/monitor/contact/checkecmcconname.do;\nhttp:/ecmc/monitor/contact/addecmccontact.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba015476458aed03c0', '管理联系人_编辑', '编辑联系人', '2016-05-03 18:59:09', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_modify;\nhttp:/ecmc/monitor/contact/editecmccontact.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154766216ae046a', '管理联系人_更新通知方式', '更新通知方式', '2016-05-03 19:30:20', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_change;\nhttp:/ecmc/monitor/contact/updateecmcselection.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154766358c0046d', '管理联系人_删除', '删除联系人', '2016-05-03 19:31:42', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_delete;\nhttp:/ecmc/monitor/contact/deleteecmccontact.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a85475fcba0154766585e80515', '管理联系组_查看', '查看联系组', '2016-05-03 19:34:05', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group;\nhttp:/ecmc/monitor/contact/getecmcgrouplist.do;\nhttp:/ecmc/monitor/contact/getecmcconpageingroup.do;\nhttp:/ecmc/monitor/contact/getecmcconlistoutgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476a3a9d20005', '管理联系组_添加', '创建联系组', '2016-05-03 20:41:57', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_create;\nhttp:/ecmc/monitor/contact/checkecmcgroupname.do;\nhttp:/ecmc/monitor/contact/addecmcgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476a64fb200b3', '管理联系组_编辑', '编辑联系组', '2016-05-03 20:44:51', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_modify;\nhttp:/ecmc/monitor/contact/editecmcgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476a95021015e', '管理联系组_添加/移除联系人', '添加/移除联系人', '2016-05-03 20:48:08', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_detail;\nhttp:/ecmc/monitor/contact/getecmcconlistoutgroup;\nhttp:/ecmc/monitor/contact/getecmcconlistoutgroup.do;\nhttp:/ecmc/monitor/contact/removeecmcconfromgroup.do;\nhttp:/ecmc/monitor/contact/addecmccontogroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b003e4021a', '管理联系组_删除', '删除联系组', '2016-05-03 20:55:27', 'ff808081543cbe2701543cceba910000', '1', 'ui:mon_contact_group_delete;\nhttp:/ecmc/monitor/contact/deleteecmcgroup.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b3d19c02ca', '对象存储查看', '查看对象存储', '2016-05-03 20:59:36', 'ff808081543cbe2701543cceba910000', '1', 'ui:vir_obs;\nhttp:/ecmc/obs/obsview/getObs24View.do;\nhttp:/ecmc/obs/obsview/getTop10.do;\nhttp:/ecmc/obs/obsview/getObsView.do;\nhttp:/ecmc/obs/obsview/getChart.do;\nhttp:/ecmc/obs/obscustomer/getObsCustomer.do;\nhttp:/ecmc/obs/obscustomer/getObsInMonthUsed.do;\nhttp:/ecmc/obs/obscustomer/getAllBucketsByCusId.do;\nhttp:/ecmc/obs/obscustomer/getObsHistoryResources.do;\nhttp:/ecmc/obs/obscustomer/getObsUsedView.do;\nhttp:/ecmc/obs/obscustomer/getObsResources.do;', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b5dfd80379', '阈值设置', '阈值设置', '2016-05-03 21:01:51', 'ff808081543cbe2701543cceba910000', '1', 'ui:obs_threshold;\nhttp:/ecmc/obs/obsview/getThreshold.do;\nhttp:/ecmc/obs/obsview/setThreshold.do', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a854769f83015476b8cebd042e', '配额设置', '配额设置', '2016-05-03 21:05:03', 'ff808081543cbe2701543cceba910000', '1', 'ui:obs_quota;\nhttp:/ecmc/obs/obscustomer/getQuota.do;\nhttp:/ecmc/obs/obscustomer/setQuota.do', 'ff8080815438ac44015438c05a8b0005', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b2204b6001e', '浮动ip查看', '列表展示和查询', '2016-05-04 17:38:27', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_query;\nhttp:/ecmc/virtual/floatip/getFloatIpList.do;\nhttp:/ecmc/virtual/networkout/selectoutnet.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b27e43600d0', '公网IP分配', '分配公网IP', '2016-05-04 17:44:52', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_for;\nhttp:/ecmc/virtual/floatip/remainnum.do;\nhttp:/ecmc/virtual/floatip/checkeIpNow.do;\nhttp:/ecmc/virtual/floatip/allocateIptonum.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b3490c0018d', '浮动IP绑定/解除绑定', '绑定/解除绑定', '2016-05-04 17:58:43', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_bind;\nhttp:/ecmc/virtual/network/getnetworklistbyprjid.do;\nhttp:/ecmc/virtual/subnetwork/getsubnetlistbynetid.do;\nhttp:/ecmc/virtual/floatip/getVmBySubNetWork.do;\nhttp:/ecmc/virtual/loadbalance/pool/getnotbindfloatippools.do;\nhttp:/ecmc/virtual/floatip/binDingVm.do;\nhttp:/ecmc/virtual/floatip/unBinDingVm.do;\nhttp:/ecmc/virtual/floatip/getNetworkByPrj.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b3ed0fb024d', '公网IP释放', '释放公网IP', '2016-05-04 18:09:54', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_release;\nhttp:/ecmc/virtual/floatip/deallocateFloatIp.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8576fad3001576fbc58760000', '短信服务查看', '短信服务查看', '2016-09-28 15:39:56', '2c91808256f81c44015702bbf9510000', '1', 'ui:mon_resource_sms;\nhttp:/ecmc/system/sms/getsmslist.do;\nhttp:/ecmc/system/sms/createsms.do;\nhttp:/ecmc/system/sms/resendsms.do;', '40289092559069cd0155907110460006', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a858d1e1a40158d22b68460000', 'API访问限制', null, '2016-12-06 11:26:49', '2c91808256f81c44015702bbf9510000', '1', 'http:/ecmc/customer/getapitype.do;\nhttp:/ecmc/customer/getrestrictrequestcount.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547e722201547eaa93350005', '云主机_创建', '创建云主机相关的后台接口', '2016-05-05 10:06:28', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_vm_create;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/cloud/vm/getprolistbydcid.do;\nhttp:/ecmc/cloud/vm/getsubnetlistbyprjid.do;\nhttp:/ecmc/syssetup/getmodellistbycustomer.do;\nhttp:/ecmc/cloud/vm/checkvmname.do;\nhttp:/ecmc/cloud/vm/getcpulist.do;\nhttp:/ecmc/cloud/vm/getramlistbycpu.do;\nhttp:/ecmc/cloud/vm/getimagelist.do;\nhttp:/ecmc/cloud/vm/createvm.do;\n\nhttp:/ecmc/cloud/vm/getoslist.do;\nhttp:/ecmc/cloud/vm/getsystypelistbyos.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547eb40e01547eb7ecb10179', '云主机_查看', '查看云主机相关的后台接口', '2016-05-05 10:21:03', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_query;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/cloud/vm/getvmpagelist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/cloud/vm/getallvmsyslist.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547eb40e01547eb94081017b', '云主机_删除', '删除云主机相关的后台接口', '2016-05-05 10:22:30', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_delete;\nhttp:/ecmc/cloud/vm/get.do;\nhttp:/ecmc/cloud/vm/deletevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547eb40e01547ebf5f78024b', '云主机_详情', null, '2016-05-05 10:29:11', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_detail;\nhttp:/ecmc/cloud/vm/getvmbyid.do;\nhttp:/ecmc/cloud/volume/queryvolumesbyvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547ee7ef7a0003', '云主机_操作_云主机控制台', null, '2016-05-05 11:13:29', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_console;\nhttp:/ecmc/cloud/vm/consolevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547eee9ef700d6', '云主机_操作_查看监控', null, '2016-05-05 11:20:48', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_monitor;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0114bb01a6', '云主机_操作_启动云主机', null, '2016-05-05 11:40:57', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_startvm;\nhttp:/ecmc/cloud/vm/startvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f020df40275', '云主机_操作_关闭云主机', null, '2016-05-05 11:42:01', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_shutdownvm;\nhttp:/ecmc/cloud/vm/shutdownvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f02ed0d0277', '云主机_操作_重启云主机', null, '2016-05-05 11:42:58', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_restartvm;\nhttp:/ecmc/cloud/vm/restartvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f03cd210279', '云主机_操作_挂起云主机', '', '2016-05-05 11:43:56', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_suspendvm;\nhttp:/ecmc/cloud/vm/suspendvm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f049ad2027b', '云主机_操作_恢复云主机', null, '2016-05-05 11:44:48', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_resumevm;\nhttp:/ecmc/cloud/vm/resumevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f063a8b027d', '云主机_操作_挂载云硬盘', null, '2016-05-05 11:46:35', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_mountdisk;\nhttp:/ecmc/cloud/volume/getunbinddisk.do;\nhttp:/ecmc/cloud/vm/getdiskcountbyvm.do;\nhttp:/ecmc/cloud/vm/bindbatchvolume.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f07abaa027f', '云主机_操作_绑定公网IP', null, '2016-05-05 11:48:09', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_bindfloatip;\nhttp:/ecmc/virtual/floatip/getUnBindFloatIp.do;\nhttp:/ecmc/virtual/floatip/binDingVm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0912ba0281', '云主机_操作_解绑公网IP', null, '2016-05-05 11:49:41', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_unbindfloatip;\nhttp:/ecmc/cloud/vm/unbindipbyvmid.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0b07200283', '云主机_操作_创建自定义镜像', null, '2016-05-05 11:51:49', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_createsnapshot;\nhttp:/ecmc/cloud/image/getimagecountbyprjid.do;\nhttp:/ecmc/cloud/image/checkimagename.do;\nhttp:/ecmc/cloud/vm/createsnapshot.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f0c93800286', '云主机_操作_升级配置', null, '2016-05-05 11:53:31', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_upgradevm;\nhttp:/ecmc/cloud/vm/getcpulist.do;\nhttp:/ecmc/cloud/vm/getramlistbycpu.do;\nhttp:/ecmc/cloud/vm/upgradevm.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f3e175f0289', '云主机_操作_编辑安全组', null, '2016-05-05 12:47:36', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_editvmsecuritygroup;\nhttp:/ecmc/cloud/vm/getsecuritybyprjnovm.do;\nhttp:/ecmc/cloud/vm/getsecuritygroupbyvm.do;\nhttp:/ecmc/cloud/vm/editvmsecuritygroup.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f3ee4e2028b', '云主机_操作_查看日志', null, '2016-05-05 12:48:28', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_log;\nhttp:/ecmc/cloud/vm/getvmlog.do;', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ab547ed5e301547f40a3a3028d', '云主机_编辑云主机名称或描述', null, '2016-05-05 12:50:23', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_vm_edit;\nhttp:/ecmc/cloud/vm/updatevm.do;\nhttp:/ecmc/cloud/vm/checkvmname.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eacb2640002', '路由-查看', '查看路由', '2016-05-05 10:08:47', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_query;\nhttp:/ecmc/virtual/route/queryroute.do;\nhttp:/ecmc/virtual/route/getroutedetailbyid.do;\nhttp:/ecmc/virtual/route/queryroutesubnetwork.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547ead84660004', '路由-创建', '创建路由', '2016-05-05 10:09:41', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_create;\nhttp:/ecmc/virtual/route/addroute.do;\nhttp:/ecmc/virtual/route/checkrouterate.do;\nhttp:/ecmc/virtual/network/getnotbindroutenetwork.do;\nhttp:/ecmc/virtual/route/checkroutename.do;\nhttp:/ecmc/virtual/subnetwork/getnotbinroutesubnetlist.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eadee590006', '路由-编辑', '编辑路由', '2016-05-05 10:10:08', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_modify;\nhttp:/ecmc/virtual/route/updateroute.do;\nhttp:/ecmc/virtual/route/checkrouterate.do;\nhttp:/ecmc/virtual/route/checkroutename.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eaef1430008', '路由-设置/清除网关', '绑定或者解绑网关', '2016-05-05 10:11:14', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_setGateway;\nhttp:/ecmc/virtual/route/setgateway.do;\nhttp:/ecmc/virtual/route/removegateway.do;\nhttp:/ecmc/virtual/route/checkforclear.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eb0ea62000a', '路由-关联子网', '路由绑定子网', '2016-05-05 10:13:24', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_attachSubnet;\nhttp:/ecmc/virtual/route/attachsubnet.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547e8de301547eb16a5a000c', '路由-删除', '删除路由', '2016-05-05 10:13:56', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_delete;\nhttp:/ecmc/virtual/route/deleteroute.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547ede622e00d6', '路由-解绑子网', '路由解绑子网', '2016-05-05 11:03:03', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_route_detachSubnet;\nhttp:/ecmc/virtual/route/detachsubnet.do;\nhttp:/ecmc/virtual/route/checkDetachSubnet.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547eec02b801aa', '私有网络-查看', '私有网络列表', '2016-05-05 11:17:57', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_query;\nhttp:/ecmc/virtual/network/querynetwork.do;\nhttp:/ecmc/virtual/subnetwork/getsubnetlistbynetid.do;\nhttp:/ecmc/virtual/network/getnetworkbyid.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547ef5c49201ac', '私有网络-创建', '创建私有网络', '2016-05-05 11:28:36', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_create;\nhttp:/ecmc/virtual/network/addnetwork.do;\nhttp:/ecmc/virtual/network/checknetworkname.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547ef8aabd01ae', '私有网络-编辑', '编辑私有网络', '2016-05-05 11:31:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_modify;\nhttp:/ecmc/virtual/network/modnetwork.do;\nhttp:/ecmc/virtual/network/checknetworkname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f02ce7101b6', '私有网络-增加子网', '添加子网', '2016-05-05 11:42:50', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_createSubnet;\nhttp:/ecmc/virtual/subnetwork/addsubnetwork.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetipbynet.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetworkname.do;\nhttp:/ecmc/virtual/subnetwork/getdatacenter.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f03a68101b8', '私有网络-编辑子网', '编辑子网', '2016-05-05 11:43:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_modifySubnet;\nhttp:/ecmc/virtual/subnetwork/updatesubnetwork.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetipbynet.do;\nhttp:/ecmc/virtual/subnetwork/checksubnetworkname.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f07cd7201ba', '私有网络-删除子网', '删除子网', '2016-05-05 11:48:18', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_deleteSubnet;\nhttp:/ecmc/virtual/subnetwork/deletesubnetwork.do;\nhttp:/ecmc/virtual/subnetwork/checkfordel.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f0afb0801be', '私有网络-设置/清除网关', '网络设置或者清除网关', '2016-05-05 11:51:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_setGateway;\nhttp:/ecmc/virtual/route/setgateway.do;\nhttp:/ecmc/virtual/route/removegateway.do;\nhttp:/ecmc/virtual/networkout/getoutnetbyprj.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f0c3c1801c3', '私有网络-删除', '删除私有网络', '2016-05-05 11:53:08', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_delete;\nhttp:/ecmc/virtual/network/deletenetwork.do;\nhttp:/ecmc/virtual/network/checkfordel.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890ba576ec7c001576ed6556f0000', '漏跑任务', '漏跑任务统计', '2016-09-28 11:28:42', '2c91808256f81c44015702bbf9510000', '1', 'ui:task_lost;\nhttp:/ecmc/system/schedule/getLeakageTaskList.do;', '40288eef55775e060155775f66160002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056afe5ff0156b1211c360000', '路由-创建端口映射', '路由详情页面添加端口映射', '2016-08-22 15:22:32', '40289095547ea16201547ea5b79a0001', '1', 'ui:vir_route_addPM;\nhttp:/ecmc/cloud/netWork/portmapping/add.do;\nhttp:/ecmc/cloud/subnetwork/getSubnetWorksByRouteId.do;\nhttp:/ecmc/cloud/vm/queryVmListBySubnetId.do;\nhttp:/ecmc/cloud/netWork/portmapping/checkresourceport.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056afe5ff0156b1b0430300e7', '路由-删除端口映射', '路由详情页面中删除端口映射', '2016-08-22 17:58:53', '40289095547ea16201547ea5b79a0001', '1', 'ui:vir_route_deletePM;\nhttp:/ecmc/cloud/netWork/portmapping/delete.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056afe5ff0156b20d8df701cf', '路由-编辑端口映射', '路由详情页面编辑端口映射', '2016-08-22 19:40:47', '40289095547ea16201547ea5b79a0001', '1', 'ui:vir_route_editPM;\nhttp:/ecmc/cloud/netWork/portmapping/update.do;\nhttp:/ecmc/cloud/subnetwork/getSubnetWorksByRouteId.do;\nhttp:/ecmc/cloud/vm/queryVmListBySubnetId.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056b62e520156b6ab8b140000', 'VPN查询', 'VPN查询', '2016-08-23 17:11:50', '40289095547ea16201547ea5b79a0001', '1', 'http:/ecmc/cloud/vpn/getvpnlist.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d505490156d590e6db0001', '云硬盘_回滚', '用于云硬盘详情页的云硬盘回滚权限', '2016-08-29 17:10:58', '40289095547ea16201547ea5b79a0001', '1', 'ui:vir_volume_rollback;\nhttp:/ecmc/cloud/volume/getvolumebyid.do;\nhttp:/ecmc/cloud/snapshot/rollbackvolume.do', 'ff8080815438ac44015438be965d0002', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d940490156d95eeb1b0000', '回收站_云硬盘列表', null, '2016-08-30 10:54:51', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_volume_list;\nhttp:/ecmc/cloud/volume/getRecycleVolList.do', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d940490156d95f94ca0001', '回收站_云硬盘详情', null, '2016-08-30 10:55:35', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_volume_detail', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d940490156d9600d210002', '回收站_删除云硬盘', null, '2016-08-30 10:56:05', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_volume_delete', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d9ee920156d9ff3c610000', '回收站_云硬盘快照列表', null, '2016-08-30 13:49:58', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_snapshot_list;\nhttp:/ecmc/cloud/snapshot/getRecycleSnapList.do;\nhttp:/ecmc/cloud/vm/getRecycleVmById.do', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d9ee920156d9fff9c90001', '回收站_云硬盘快照详情', null, '2016-08-30 13:50:46', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_snapshot_detail', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c056d9ee920156da0086790002', '回收站_云硬盘快照删除', null, '2016-08-30 13:51:22', '40289095547ea16201547ea5b79a0001', '1', 'ui:recycle_snapshot_delete;\nhttp:/ecmc/cloud/snapshot/deletesnap.do', '4028909556c4f2440156c5db2f8700ea', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c0576641eb01576661917e014e', '路由-查看端口映射', '路由详情页，查看端口映射', '2016-09-26 20:04:12', '2c91808256f81c44015702bbf9510000', '1', 'http:/ecmc/cloud/netWork/portmapping/list.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c0576641eb0157666320e6014f', 'VPN删除', 'VPN删除', '2016-09-26 20:05:55', '2c91808256f81c44015702bbf9510000', '1', 'ui:vir_vpn_delete;\nhttp:/ecmc/cloud/vpn/deletevpn.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890c0576641eb01576664aa540150', 'VPN修改', 'VPN修改', '2016-09-26 20:07:35', '2c91808256f81c44015702bbf9510000', '1', 'ui:vir_vpn_update;\nhttp:/ecmc/cloud/vpn/getvpninfo.do;\nhttp:/ecmc/cloud/vpn/updatevpn.do;\nhttp:/ecmc/cloud/vpn/checkvpnnameexist.do', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028930056e4bc630156e51b51450000', '待创建客户', null, '2016-09-01 17:36:27', '40288ef054a94b120154a94f953c0001', '1', 'ui:customer_uncreated;\nhttp://ecmc/customer/getuncreatedcuslist.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893035865ea70015866fc21290005', '查看项目资源信息', '限制客户详情页面项目列表中的列（云主机数量，子网数量，报警数量）的字体颜色，以及是否可点击，需搭配响应的云资源权限，才可实现跳转', '2016-11-15 15:55:46', '2c91808256f81c44015702bbf9510000', '1', 'ui:project_resource_info;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289321562afe3e01562b0e849c0003', '管理云主机', '查询，新增', '2016-07-27 14:33:06', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:securitygroup_manageaddcloudhost;\nhttp:/ecmc/virtual/securitygrouprule/queryCloudHostList.do;\nhttp:/ecmc/virtual/securitygrouprule/getaddcloudhostlist.do;\nhttp:/ecmc/virtual/securitygrouprule/securitygroupaddcloudHost.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893225766121d01576615c45c0000', '移除云主机', '安全组移除云主机', '2016-09-26 18:41:25', '2c91808256f81c44015702bbf9510000', '1', 'ui:securitygroup_managedeletecloudhost;\nhttp:/ecmc/virtual/securitygrouprule/securityGroupRemoveCloudHost.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932356a0d1e90156a0d3ffbb0000', '查看订单', null, '2016-08-19 11:24:23', '40288ef054a94b120154a94f953c0001', '1', 'ui:order_info;\nhttp://ecmc/order/getorderbyno.do;\nhttp://ecmc/order/getorder.do;\nhttp://ecmc/order/getorderresource.do;', '4028936f567dd77101567ddad4b00000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893235765a3ae015765dfafa50000', '查看权限', '查看角色拥有哪些权限', '2016-09-26 17:42:20', '2c91808256f81c44015702bbf9510000', '1', 'ui:sys_role_viewAuth;\nhttp:/ecmc/system/menu/getmenutreegrid.do;\nhttp:/ecmc/system/authority/getallenableauth.do;\nhttp:/ecmc/system/role/getroledetail.do;', 'ff8080815438ac44015438da284a001d', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576accd0800000', '查看客户信息', null, '2016-09-27 16:39:50', '2c91808256f81c44015702bbf9510000', '1', 'ui:customer_info;\nhttp:/ecmc/project/getprojectbycustomer.do;\nhttp:/ecmc/customer/getcustomerlist.do;\nhttp:/ecmc/customer/customeroverview.do;\nhttp://ecmc/customer/getexpireresourcelist.do;\nhttp://ecmc/customer/getcusworkordernum.do;\nhttp://ecmc/customer/getuncreatedcuslist.do;\nhttp://ecmc/customer/getuncreatedcusnum.do;\nhttp://ecmc/customer/getcuswithadminbyid.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576acd89770001', '重置密码', null, '2016-09-27 16:40:37', '2c91808256f81c44015702bbf9510000', '1', 'ui:customer_reset_pwd;\nhttp:/ecmc/customer/resetcusadminpass.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576ace34f50002', '设置信用额度', null, '2016-09-27 16:41:21', '2c91808256f81c44015702bbf9510000', '1', 'ui:customer_credit_lines;\nhttp://ecmc/customer/modifycreditlines.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576ace8b130003', '创建项目', null, '2016-09-27 16:41:43', '2c91808256f81c44015702bbf9510000', '1', 'ui:project_create;\nhttp:/ecmc/project/hasprjbycusanddc.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/generateprojectname.do;\nhttp://ecmc/quota/template/getallquotatemplate.do;\nhttp://ecmc/quota/template/getquotatemplate.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576aced07d0004', '查看资源池', null, '2016-09-27 16:42:01', '2c91808256f81c44015702bbf9510000', '1', 'ui:project_resource_pool;\nhttp:/ecmc/project/getprojectpool.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576acf10d00005', '查看数据统计', null, '2016-09-27 16:42:17', '2c91808256f81c44015702bbf9510000', '1', 'ui:project_statistic;\nhttp:/ecmc/project/getvmresource.do;\nhttp:/ecmc/project/getvolumeresource.do;\nhttp:/ecmc/project/getnetresource.do;\nhttp:/ecmc/project/getresourcesforexcel.do;\nhttp:/ecmc/project/createexcel.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576acf5be10006', '查看费用报表', null, '2016-09-27 16:42:36', '2c91808256f81c44015702bbf9510000', '1', 'ui:customer_report;\nhttp://ecmc/customer/getpostpaydetail.do;\nhttp://ecmc/customer/getcusreport.do;\nhttp://ecmc/customer/gettotalcost.do;\nhttp://ecmc/customer/createpostpaidexcel.do;\nhttp://ecmc/customer/createprepaidexcel.do;\nhttp://ecmc/order/getorderbyno.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('4028932b576abcd301576acfb9cc0007', '查看交易记录', null, '2016-09-27 16:43:00', '2c91808256f81c44015702bbf9510000', '1', 'ui:customer_record;\nhttp://ecmc/customer/getcusrecords.do;\nhttp://ecmc/customer/createrecordexcel.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289334576e7fc801576e8777df0000', '防火墙创建规则', '创建防火墙的规则', '2016-09-28 10:02:34', '2c91808256f81c44015702bbf9510000', '1', 'ui:rule_create;\nhttp:/ecmc/virtual/cloudfwrule/createfwRule.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289334576e7fc801576e8a059e0001', '防火墙规则禁用启用', '防火墙规则的禁用启用', '2016-09-28 10:05:21', '2c91808256f81c44015702bbf9510000', '1', 'ui:rule_isEnabled;\nhttp:/ecmc/virtual/cloudfwrule/updateIsEnabled.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289334576e7fc801576e8bf46e0002', '防火墙规则调整优先级', '调整防火墙规则的优先级', '2016-09-28 10:07:28', '2c91808256f81c44015702bbf9510000', '1', 'ui:rule_sequence;\nhttp:/ecmc/virtual/cloudfwpoliy/updateRuleSequence.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289334576e7fc801576e9455740103', '防火墙删除规则', '删除防火墙规则', '2016-09-28 10:16:37', '2c91808256f81c44015702bbf9510000', '1', 'ui:rule_delete;\nhttp:/ecmc/virtual/cloudfwrule/deletefwRule.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289335576ebf9101576ec205b70000', '安全组规则添加', '安全组规则添加', '2016-09-28 11:06:31', '2c91808256f81c44015702bbf9510000', '1', 'ui:securitygroup_manageaddrule;\nhttp:/ecmc/virtual/securitygrouprule/createrule.do;\n\nhttp:/ecmc/virtual/securitygroup/listallgroups.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289335576ebf9101576ec69aa30001', '安全组规则删除', '安全组规则删除', '2016-09-28 11:11:32', '2c91808256f81c44015702bbf9510000', '1', 'ui:securitygroup_managedelrule;\nhttp:/ecmc/virtual/securitygrouprule/deleterulebyid.do;', 'ff8080815438ac44015438bfc39a0004', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40289355583de08b01583df1f9f90000', '客户统计查看', '客户统计', '2016-11-07 16:40:18', '2c91808256f81c44015702bbf9510000', '1', 'ui:ecmc_overview_cus;\nhttp:/ecmc/overview/getAllPrjsToCusType.do;\nhttp:/ecmc/overview/getMonthsNewCus.do;\nhttp:/ecmc/overview/getYears.do;', 'ff8080815438ac44015438bb40b20000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893e656de3e910156df63bf3501ec', '查询订单', null, '2016-08-31 14:57:51', '40288ef054a94b120154a94f953c0001', '1', 'ui:order_search;\nhttp://ecmc/order/getorderlist.do;', '4028936f567dd77101567ddad4b00000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893f956dfa84c0156dfb5109a0000', '查看配额模板', null, '2016-08-31 16:26:40', '40288ef054a94b120154a94f953c0001', '1', 'ui:template_info;\nhttp://ecmc/quota/template/getquotatemplate.do;\nhttp://ecmc/quota/template/getquotatemplatelist.do;\nhttp://ecmc/quota/template/checkquotatemplatename.do;', '4028936f567dd77101567dde38270001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893f956dfa84c0156dfb573810001', '增加配额模板', null, '2016-08-31 16:27:05', '40288ef054a94b120154a94f953c0001', '1', 'ui:template_add;\nhttp://ecmc/quota/template/addquotatemplate.do;', '4028936f567dd77101567dde38270001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893f956dfa84c0156dfb5cd1d0002', '编辑配额模板', null, '2016-08-31 16:27:28', '40288ef054a94b120154a94f953c0001', '1', 'ui:template_modify;\nhttp://ecmc/quota/template/modifyquotatemplate.do;\nhttp://ecmc/quota/template/getquotatemplate.do;', '4028936f567dd77101567dde38270001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893f956dfa84c0156dfb60f7f0003', '删除配额模板', null, '2016-08-31 16:27:45', '40288ef054a94b120154a94f953c0001', '1', 'ui:template_del;\nhttp://ecmc/quota/template/delquotatemplate.do;', '4028936f567dd77101567dde38270001', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081542eb06e01542f1fd83c0002', '134', '1', '2016-04-19 23:24:56', '402890bc540ad19801540ad1fc300000', null, '1', null, '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081543367ef0154336da7b80000', '云主机权限', null, '2016-04-20 19:28:25', '402890bc540ad19801540ad1fc300000', null, '1', null, '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081543367ef01543411cf650008', '测试权限', null, '2016-04-20 22:27:43', '402890bc540ad19801540ad1fc300000', null, '123', null, '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545c627b93000a', '监控管理模块展示', '监控管理模块的显示', '2016-04-28 18:20:38', '402890bc540ad19801540ad1fc300000', '1', 'ui:monitor', 'ff8080815438ac44015438d5fe9c0014', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545ca2b3f300aa', '报警信息查看', '报警信息查看', '2016-04-28 19:30:47', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_alarm;\nhttp:/ecmc/monitor/alarm/getecmcpagemsglist.do;\nhttp:/ecmc/monitor/alarm/getecmcitemlist.do;\nhttp:/ecmc/monitor/alarm/exportmsgexcel.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545ca352f300ab', '联系人管理_查看', '查看运维自建的联系人和客户创建的联系人', '2016-04-28 19:31:28', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_contact;\nhttp:/ecmc/monitor/contact/getecmcpagecontactlist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;', 'ff8080815438ac44015438d7fbd50017', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545caca1a100ea', '查看云主机', '查看云主机监控', '2016-04-28 19:41:38', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_resource_cloudhost;\nhttp:/ecmc/monitor/resource/getvmlistforecmclive.do;\nhttp:/ecmc/monitor/resource/getinterval.do;\nhttp:/ecmc/monitor/resource/getvmlistforecmclast.do;\nhttp:/ecmc/monitor/resource/getcharttimes.do;\nhttp:/ecmc/monitor/resource/getvmdetailbyid.do;\nhttp:/ecmc/monitor/resource/getmonitordatabyid.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/test/detail/jsonlist.do;\nhttp:/test/detail/mongo.do;', 'ff8080815438ac44015438d660ff0015', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081545a6f9d01545cb308d3012c', '报警规则查看', '查看报警规则及详情', '2016-04-28 19:48:37', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:mon_alarm_tab_rule;\nhttp:/ecmc/monitor/alarm/getecmcpagerulelist.do;\nhttp:/ecmc/monitor/alarm/getecmcrulebyid.do;\nhttp:/ecmc/monitor/alarm/getecmcobjlistinrule.do;\nhttp:/ecmc/monitor/alarm/getecmcconsbyrule.do;\nhttp:/ecmc/monitor/alarm/getecmcobjpageinrule.do;', 'ff8080815438ac44015438d721300016', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154944657ea0c72', '工单_添加', '添加工单', '2016-05-09 11:28:38', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_save;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/addworkorder.do;\nhttp:/ecmc/workorder/finduserbyuserid.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549447167f0c76', '工单_查看全部', '查看所有类型的工单', '2016-05-09 11:30:27', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_find_all;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/file/down.do;\nhttp:/ecmc/customer/getuseraccountbycusid.do;\nhttp:/ecmc/customer/getcustomerbyid;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/getnotdoneworklist.do;\nhttp:/ecmc/workorder/getdoneworklist.do;\nhttp:/ecmc/workorder/getnodoneflaglist.do;\nhttp:/ecmc/workorder/getdoneflaglist.do;\nhttp:/ecmc/workorder/getworkflaglistforordinary.do;\nhttp:/ecmc/workorder/getworkheadlist.do;\nhttp:/ecmc/workorder/findworkbyworkid.do;\nhttp:/ecmc/workorder/getworkopinionlist.do;\nhttp:/ecmc/workorder/countalluseracceptworkorder.do;\nhttp:/ecmc/workorder/countuseracceptworkorder.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;\nhttp:/ecmc/customer/getcustomerbyid.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549447e08f0c78', '工单_编辑', '编辑工单', '2016-05-09 11:26:19', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_edit;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/updateecmcworkorder.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549449684c0c7c', '工单_受理', '受理工单', '2016-05-09 11:34:59', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_accept;\nhttp:/ecmc/workorder/acceptancework.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154944b04d30c7e', '工单_更改级别', '更改工单级别', '2016-05-09 11:31:45', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_editworklevel;\nhttp:/ecmc/workorder/updateecmcworkforworklevel.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154944bfc490c80', '工单_求助', '求助其他工程师', '2016-05-09 11:29:48', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_trun;\nhttp:/ecmc/workorder/truntootheruser.do;\nhttp:/ecmc/workorder/gettruetoother.do.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154945036120c83', '工单_审核', '审核工单', '2016-05-09 11:37:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_audit;\nhttp:/ecmc/workorder/auditpasswork.do;\nhttp:/ecmc/workorder/auditnotpasswork.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549450eace0c85', '工单_创建项目', '创建项目', '2016-05-09 11:38:11', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_creprj;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/project/createproject.do;\nhttp:/ecmc/project/createprojectonly.do;\nhttp:/ecmc/customer/checkcusorg.do', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549451694c0c87', '工单_修改项目', '修改项目配额', '2016-05-09 11:39:43', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_editprj;\nhttp:/ecmc/project/getprojectbyid.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/modifyproject.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154945444ec0c8a', '工单_取消', '取消工单(客服取消普通类工单)', '2016-05-09 11:35:51', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_cancel;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549454d9630c8c', '工单_完成', '确认工单完成', '2016-05-09 11:33:29', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_end;\nhttp:/ecmc/workorder/addecmcworkopinion.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff808081548580220154946736af0cae', '工单_普通查看', '查看普通类型的工单', '2016-05-09 11:32:32', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_find_common;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/file/down.do;\nhttp:/ecmc/customer/getuseraccountbycusid.do;\nhttp:/ecmc/customer/getcustomerbyid;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/getnotdoneworklist.do;\nhttp:/ecmc/workorder/getdoneworklist.do;\nhttp:/ecmc/workorder/getnodoneflaglist.do;\nhttp:/ecmc/workorder/getdoneflaglist.do;\nhttp:/ecmc/workorder/getworkflaglistforordinary.do;\nhttp:/ecmc/workorder/getworkheadlist.do;\nhttp:/ecmc/workorder/findworkbyworkid.do;\nhttp:/ecmc/workorder/getworkopinionlist.do;\nhttp:/ecmc/workorder/countalluseracceptworkorder.do;\nhttp:/ecmc/workorder/countuseracceptworkorder.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;\nhttp:/ecmc/customer/getcustomerbyid.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('ff8080815485802201549467f0ce0cb1', '工单_特殊查看', '查看特殊类工单', '2016-05-09 11:27:20', 'ff808081543cbe2701543cceba910000', '1', 'ui:workorder_find_special;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/file/down.do;\nhttp:/ecmc/customer/getuseraccountbycusid.do;\nhttp:/ecmc/customer/getcustomerbyid;\nhttp:/ecmc/workorder/getdatatree.do;\nhttp:/ecmc/workorder/getnotdoneworklist.do;\nhttp:/ecmc/workorder/getdoneworklist.do;\nhttp:/ecmc/workorder/getnodoneflaglist.do;\nhttp:/ecmc/workorder/getdoneflaglist.do;\nhttp:/ecmc/workorder/getworkflaglistforordinary.do;\nhttp:/ecmc/workorder/getworkheadlist.do;\nhttp:/ecmc/workorder/findworkbyworkid.do;\nhttp:/ecmc/workorder/getworkopinionlist.do;\nhttp:/ecmc/workorder/countalluseracceptworkorder.do;\nhttp:/ecmc/workorder/countuseracceptworkorder.do;\nhttp:/ecmc/workorder/addecmcworkopinion.do;\nhttp:/ecmc/customer/getcustomerbyid.do;', 'ff8080815438ac44015438c2e0dc0008', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('test01', '权限01', '权限描述', '2016-03-29 11:51:26', 'dev', '1', 'ui:test;', 'test', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('test02', '权限2', '权限描述', '2016-03-29 11:51:23', 'dev', '1', 'ui:test;', 'test', '0');

-- ----------------------------
-- Table structure for ecmc_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_menu`;
CREATE TABLE `ecmc_sys_menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `orderno` int(11) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `lock` char(1) DEFAULT '0' COMMENT '是否加锁，0:false 可被分配分配给角色、删除;1：true 不可被分配给角色、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_menu
-- ----------------------------
INSERT INTO `ecmc_sys_menu` VALUES ('2', '主菜单', '123', '123', '2', '1', '2016-03-29 11:42:39', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('3', '二级菜单', '1', '1', '2', '0', '2016-03-30 11:12:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4', '二级菜单2', null, null, '1', '2', null, 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eeb545f98a801545fea5a8a005d', '数据管理', '数据管理', 'app.sysdatatree', 'ff8080815438ac44015438d8d5000018', '80', '2016-04-29 10:47:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'eayunfont ef-data', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eee54eacc470154eb01c0980010', '开发测试', '123', null, '40288eee54eacc470154eb0042e4000d', '1', '2016-05-26 11:00:41', '40288ee4545b5b5001545b901fac0007', null, null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eee54eacc470154eb0825bb001b', '开发测试', '123', null, '40288eee54eacc470154eb065d590018', '1', '2016-05-26 11:07:40', '40288ee4545b5b5001545b901fac0007', null, null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c66cb1f40000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:28:45', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c670d16f0001', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:33:15', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef55775e060155775f66160002', '定时任务', null, 'app.task', 'ff8080815438ac44015438d8d5000018', '100', '2016-06-22 17:09:48', '40288eee545fc01a01545fe4cd06000f', '1', 'eayunfont ef-task', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40289092559069cd0155907110460006', '邮件短信', '邮件短信', 'app.mailsms', 'ff8080815438ac44015438d8d5000018', '90', '2016-06-27 13:59:36', '40289092543bcc8c01543bd161c40000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909556c4f2440156c5db2f8700ea', '回收站', '回收站资源', 'app.recycle', 'ff8080815438ac44015438bcfb260001', '50', '2016-08-26 15:58:11', '40289095547ea16201547ea5b79a0001', '1', 'eayunfont ef-recovery', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890995621747901562187c9ad0001', '价格配置', null, 'app.price', 'ff8080815438ac44015438c14b110006', '50', '2016-07-25 18:09:22', 'ff808081545a6f9d01545c5f4a480007', '1', 'eayunfont ef-cost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40289099567cb38a01567cb80d6e0000', '在线统计', null, 'app.cusonline', 'ff8080815438ac44015438d8d5000018', '90', '2016-08-12 11:07:32', 'ff808081545a6f9d01545c5f4a480007', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158be9e0d350000', 'API管理', null, null, '', '60', '2016-12-02 16:19:38', '2c91808256f81c44015702bbf9510000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea006250001', 'API概览', '暂用了云主机的图标', 'app.apioverview', '4028909958be99a30158be9e0d350000', '10', '2016-12-02 16:21:48', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea03b880002', '限制管理', '暂用了网络的图标', 'app.apilimit', '4028909958be99a30158be9e0d350000', '20', '2016-12-02 16:22:01', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea8df9a0003', 'API管理', '暂用了组织机构的图标', 'app.apimanage', 'ff8080815438ac44015438d8d5000018', '110', '2016-12-02 16:31:28', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890bb5413eb6a01541402ce910000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', null, null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028936f567dd77101567ddad4b00000', '订单管理', null, 'app.order', 'ff8080815438ac44015438c14b110006', '20', '2016-08-12 16:25:08', '40288ef054a94b120154a94f953c0001', '1', 'eayunfont ef-order', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028936f567dd77101567dde38270001', '配额模板', null, 'app.quotatemp', 'ff8080815438ac44015438c14b110006', '70', '2016-08-12 16:28:50', '40288ef054a94b120154a94f953c0001', '1', 'eayunfont ef-quota', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('5', '二级菜单1', null, null, '1', '0', '2016-03-30 11:14:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bb40b20000', '总览', '', 'app.overview', null, '10', '2016-04-21 20:11:16', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-overview', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bcfb260001', '公有云资源管理', null, '', null, '20', '2016-04-21 20:13:09', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438be965d0002', '云主机', null, 'app.cloudhost', 'ff8080815438ac44015438bcfb260001', '10', '2016-04-21 20:14:55', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bf1f390003', '网络', 'VPC', 'app.net', 'ff8080815438ac44015438bcfb260001', '20', '2016-04-21 20:15:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bfc39a0004', '安全', null, 'app.safe', 'ff8080815438ac44015438bcfb260001', '30', '2016-04-21 20:16:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-safe', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c05a8b0005', '对象存储', 'OBS', 'app.obs', 'ff8080815438ac44015438bcfb260001', '40', '2016-04-21 20:16:50', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-obs', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c14b110006', '公有云业务管理', null, '', null, '30', '2016-04-21 20:17:52', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c27e5d0007', '客户管理', null, 'app.customer', 'ff8080815438ac44015438c14b110006', '10', '2016-04-21 20:19:11', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c2e0dc0008', '工单管理', null, 'app.workorder', 'ff8080815438ac44015438c14b110006', '30', '2016-04-21 20:19:36', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-workorder', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c33c7b0009', '消息管理', null, 'app.message', 'ff8080815438ac44015438c14b110006', '40', '2016-04-21 20:19:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c8999a000a', '公告管理', null, 'app.notice', 'ff8080815438ac44015438c14b110006', '50', '2016-04-21 20:25:51', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-contacts', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce0059000b', '数据中心管理', null, '', null, '40', '2016-04-21 20:31:45', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce7e8e000c', '数据中心', null, 'app.center', 'ff8080815438ac44015438ce0059000b', '10', '2016-04-21 20:32:17', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-center', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cf239e000d', '服务器', null, 'app.server', 'ff8080815438ac44015438ce0059000b', '20', '2016-04-21 20:32:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-server', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cfcf98000e', '机柜', null, 'app.cabinet', 'ff8080815438ac44015438ce0059000b', '30', '2016-04-21 20:33:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cabinet', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d03f87000f', '交换机', null, 'app.switch', 'ff8080815438ac44015438ce0059000b', '40', '2016-04-21 20:34:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-switch', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d1075f0010', '存储', null, 'app.storage', 'ff8080815438ac44015438ce0059000b', '50', '2016-04-21 20:35:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-storage', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d199e40011', '防火墙', null, 'app.firewall', 'ff8080815438ac44015438ce0059000b', '60', '2016-04-21 20:35:41', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-firewall', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d2dc4a0012', '型号维护', null, 'app.model', 'ff8080815438ac44015438ce0059000b', '70', '2016-04-21 20:37:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-xinghaoweihu', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d3aa7a0013', 'IP', null, 'app.ip', 'ff8080815438ac44015438ce0059000b', '80', '2016-04-21 20:37:56', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-IP', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d5fe9c0014', '监控管理', null, '', null, '50', '2016-04-21 20:40:29', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d660ff0015', '资源监控', null, 'app.monitor', 'ff8080815438ac44015438d5fe9c0014', '10', '2016-04-21 20:40:54', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-monitor', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d721300016', '报警管理', null, 'app.warning', 'ff8080815438ac44015438d5fe9c0014', '20', '2016-04-21 20:41:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-warning', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d7fbd50017', '联系人管理', null, 'app.contacts', 'ff8080815438ac44015438d5fe9c0014', '30', '2016-04-21 20:42:39', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d8d5000018', '系统管理', null, '', null, '60', '2016-04-21 20:43:35', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d93963001a', '组织机构', null, 'app.department', 'ff8080815438ac44015438d8d5000018', '10', '2016-04-21 20:44:00', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d98eea001c', '菜单管理', null, 'app.menu', 'ff8080815438ac44015438d8d5000018', '20', '2016-04-21 20:44:22', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-menu', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438da284a001d', '角色管理', null, 'app.role', 'ff8080815438ac44015438d8d5000018', '30', '2016-04-21 20:45:01', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-role', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dace02001e', '权限管理', null, 'app.authority', 'ff8080815438ac44015438d8d5000018', '40', '2016-04-21 20:45:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-forbid', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dbb92e001f', '用户管理', null, 'app.user', 'ff8080815438ac44015438d8d5000018', '50', '2016-04-21 20:46:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dc6dfa0020', '日志管理', '', 'app.log', 'ff8080815438ac44015438d8d5000018', '60', '2016-04-21 20:47:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-log', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dccfb40021', '数据管理', null, '#/sysdatatree/sysdatatree', 'ff8080815438ac44015438dccfb40021', '70', '2016-04-21 20:47:55', '402890bc540ad19801540ad1fc300000', '1', null, '0');

-- ----------------------------
-- Table structure for ecmc_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_role`;
CREATE TABLE `ecmc_sys_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `protect` char(1) DEFAULT '0' COMMENT '是否受保护，0:false 可配置权限、删除;1：true 受保护，不可配置权限、删除',
  `hide` char(1) DEFAULT '0' COMMENT '是否隐藏，0:否，不隐藏;1：是，隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_role
-- ----------------------------
INSERT INTO `ecmc_sys_role` VALUES ('40288ee75456549a015456b8df2e000d', '超级管理员', '有所有权限（别删，系统初始角色）', '2016-04-27 15:57:16', 'ff808081543cbe2701543cceba910000', '1', '1', '1');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfeb3fa000a', '客服人员', '系统初始角色', '2016-04-22 11:23:48', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfee6a8000b', '运维工程师', '系统初始角色', '2016-04-22 11:24:01', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff30f2000c', '管理员', '系统初始角色', '2016-04-22 11:24:20', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff655b000d', '商务', '系统初始角色', '2016-04-22 11:24:34', 'ff808081543cbe2701543cceba910000', '1', '0', '0');

-- ----------------------------
-- Table structure for ecmc_sys_roleauth
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_roleauth`;
CREATE TABLE `ecmc_sys_roleauth` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `auth_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidauthid` (`role_id`,`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_roleauth
-- ----------------------------
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f8000d', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7f8d66000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f8000e', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7ff16c000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f8000f', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8079ed000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80010', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f80d1980011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80011', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80012', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80013', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90014', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90015', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f840aaf0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90016', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8470cc0059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90017', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8703f0005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90018', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f877367005d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90019', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001a', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001b', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001c', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001d', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa001e', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa001f', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0020', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0021', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0022', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545feb3301005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0023', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545febaaf80061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0024', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec16a20063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0025', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec79ae0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0026', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fece84a0067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0027', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fed7a6c0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0028', '40288ee75456549a015456b8df2e000d', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa002a', '40288ee75456549a015456b8df2e000d', '4028909958ccf5680158ce21762b0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa002b', '40288ee75456549a015456b8df2e000d', '4028909958ccf5680158ce22c9a20003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0029', '40288ee75456549a015456b8df2e000d', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a2', '40289092543bd6a801543bfeb3fa000a', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a3', '40289092543bd6a801543bfeb3fa000a', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a4', '40289092543bd6a801543bfeb3fa000a', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a5', '40289092543bd6a801543bfeb3fa000a', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a6', '40289092543bd6a801543bfeb3fa000a', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02ae', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02af', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02b0', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02b1', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02b2', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a7', '40289092543bd6a801543bfeb3fa000a', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a8', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a9', '40289092543bd6a801543bfeb3fa000a', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02aa', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02ab', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154945444ec0c8a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02ac', '40289092543bd6a801543bfeb3fa000a', 'ff8080815485802201549454d9630c8c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02ad', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0024', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0025', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0026', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0027', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0028', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0029', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002a', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002b', '40289092543bd6a801543bfee6a8000b', '40288ee555a461290155a46d9f1d0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002c', '40289092543bd6a801543bfee6a8000b', '40288ee555a461290155a46efb0a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002d', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002e', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002f', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0030', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0031', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0032', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0033', '40289092543bd6a801543bfee6a8000b', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0034', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0035', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0036', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0037', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0038', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0039', '40289092543bd6a801543bfee6a8000b', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003a', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003b', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003c', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003d', '40289092543bd6a801543bfee6a8000b', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003e', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003f', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0040', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0041', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0042', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0043', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0044', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0045', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500046', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500047', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500048', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500049', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004a', '40289092543bd6a801543bfee6a8000b', '40288ef3557c121201557c13b5730001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004b', '40289092543bd6a801543bfee6a8000b', '40288ef3557c121201557c21c18000d7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004c', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4a12db0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004d', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4b326a0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004e', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4c66930009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004f', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4d2eb4000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500050', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4e2173000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500051', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500052', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a26b7c000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500053', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a34c75000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500054', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500055', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510056', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510057', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510058', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510059', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005a', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005b', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005c', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005d', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005e', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52005f', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520060', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520061', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520062', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520063', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520064', '40289092543bd6a801543bfee6a8000b', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520065', '40289092543bd6a801543bfee6a8000b', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520066', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520067', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520068', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520069', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52006a', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52006b', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52006c', '40289092543bd6a801543bfee6a8000b', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53006d', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53006e', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53006f', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530070', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530071', '40289092543bd6a801543bfee6a8000b', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530072', '40289092543bd6a801543bfee6a8000b', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530073', '40289092543bd6a801543bfee6a8000b', '40289092559069cd01559073979f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530074', '40289092543bd6a801543bfee6a8000b', '40289092559069cd01559074c804000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530075', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530076', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530077', '40289092543bd6a801543bfee6a8000b', '4028909556c1614f0156c19753710000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530078', '40289092543bd6a801543bfee6a8000b', '4028909556d54c4a0156d550a0130000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530079', '40289092543bd6a801543bfee6a8000b', '4028909556d54c4a0156d551f3d40001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53007a', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53007b', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007c', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007d', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007e', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007f', '40289092543bd6a801543bfee6a8000b', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540080', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cbd08700001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540081', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cbdd5e90002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540082', '40289092543bd6a801543bfee6a8000b', '40289099576f8d2501576fa1deea0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900d0', '40289092543bd6a801543bfee6a8000b', '4028909958ccf5680158ce08eaf20001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540083', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540084', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540085', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540086', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540087', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540088', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540089', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54008a', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008b', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008c', '40289092543bd6a801543bfee6a8000b', '402890a8576fad3001576fbc58760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008d', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008e', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008f', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550090', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550091', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550092', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550093', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550094', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550095', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550096', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550097', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550098', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e560099', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009a', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009b', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009c', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009d', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009e', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009f', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a0', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a1', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a2', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a3', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a4', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef5c49201ac');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a5', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a6', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a7', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700a8', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700a9', '40289092543bd6a801543bfee6a8000b', '402890ba576ec7c001576ed6556f0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700aa', '40289092543bd6a801543bfee6a8000b', '402890c056afe5ff0156b1211c360000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ab', '40289092543bd6a801543bfee6a8000b', '402890c056afe5ff0156b20d8df701cf');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ac', '40289092543bd6a801543bfee6a8000b', '402890c056b62e520156b6ab8b140000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ad', '40289092543bd6a801543bfee6a8000b', '402890c056d505490156d590e6db0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ae', '40289092543bd6a801543bfee6a8000b', '402890c056d940490156d95eeb1b0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700af', '40289092543bd6a801543bfee6a8000b', '402890c056d940490156d95f94ca0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b0', '40289092543bd6a801543bfee6a8000b', '402890c056d9ee920156d9ff3c610000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b1', '40289092543bd6a801543bfee6a8000b', '402890c056d9ee920156d9fff9c90001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b2', '40289092543bd6a801543bfee6a8000b', '402890c0576641eb01576661917e014e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b3', '40289092543bd6a801543bfee6a8000b', '402890c0576641eb01576664aa540150');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b4', '40289092543bd6a801543bfee6a8000b', '402893035865ea70015866fc21290005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b5', '40289092543bd6a801543bfee6a8000b', '40289321562afe3e01562b0e849c0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b6', '40289092543bd6a801543bfee6a8000b', '402893225766121d01576615c45c0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800b7', '40289092543bd6a801543bfee6a8000b', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800b8', '40289092543bd6a801543bfee6a8000b', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800b9', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800ba', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bb', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bc', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bd', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8777df0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800be', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8a059e0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bf', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8bf46e0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c0', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e9455740103');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c1', '40289092543bd6a801543bfee6a8000b', '40289335576ebf9101576ec205b70000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c2', '40289092543bd6a801543bfee6a8000b', '40289335576ebf9101576ec69aa30001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c3', '40289092543bd6a801543bfee6a8000b', '40289355583de08b01583df1f9f90000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c4', '40289092543bd6a801543bfee6a8000b', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c5', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c6', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900c7', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900c8', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900c9', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900ca', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cb', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cc', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cd', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900ce', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cf', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad10028', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad10029', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002a', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002b', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002c', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7c3e5c0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002d', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002e', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002f', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20030', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20031', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20032', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20033', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20034', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20035', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20036', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad30037', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad30038', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad30039', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003a', '40289092543bd6a801543bff30f2000c', '40288ee555a461290155a46d9f1d0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003b', '40289092543bd6a801543bff30f2000c', '40288ee555a461290155a46efb0a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003c', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003d', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003e', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003f', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fda1beb001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40040', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40041', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40042', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40043', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe7fccd005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40044', '40289092543bd6a801543bff30f2000c', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40045', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40046', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40047', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40048', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545feb443f001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40049', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545febd38d001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad4004a', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad4004b', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004c', '40289092543bd6a801543bff30f2000c', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004d', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600abc0a001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004e', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004f', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50050', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50051', '40289092543bd6a801543bff30f2000c', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50052', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609040600001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50053', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50054', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50055', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50056', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460978752000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50057', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60058', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60059', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005a', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609e2b450017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005b', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005c', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005d', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005e', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a2988b0021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005f', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60060', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60061', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60062', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a98624002b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60063', '40289092543bd6a801543bff30f2000c', '40288ef3557c121201557c13b5730001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70064', '40289092543bd6a801543bff30f2000c', '40288ef3557c121201557c21c18000d7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70065', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4a12db0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70066', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4b326a0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70067', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4c66930009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70068', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4d2eb4000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70069', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4e2173000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006a', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006b', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a26b7c000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006c', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a34c75000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006d', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006e', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006f', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b56dd1000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80070', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80071', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80072', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80073', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80074', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80075', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80076', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80077', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80078', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80079', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1b04d0019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad8007a', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad8007b', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007c', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608878dc01a1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007d', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007e', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007f', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90080', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546095699801ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90081', '40289092543bd6a801543bff30f2000c', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90082', '40289092543bd6a801543bff30f2000c', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90083', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a40aa5d0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90084', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a4660de0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90085', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a4b4eae0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90086', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90087', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b0d78f002c1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0088', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0089', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008a', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008b', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008c', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008d', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5b42d607e8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008e', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bf9c69d0006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008f', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bfde6460009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0090', '40289092543bd6a801543bff30f2000c', '40289092544c795d01544ca94fe60000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0091', '40289092543bd6a801543bff30f2000c', '40289092547a07b201547a5098d50009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0092', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0093', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0094', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0095', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0096', '40289092543bd6a801543bff30f2000c', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0097', '40289092543bd6a801543bff30f2000c', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0098', '40289092543bd6a801543bff30f2000c', '40289092559069cd01559073979f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0099', '40289092543bd6a801543bff30f2000c', '40289092559069cd01559074c804000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009a', '40289092543bd6a801543bff30f2000c', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009b', '40289092543bd6a801543bff30f2000c', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009c', '40289092543bd6a801543bff30f2000c', '4028909556c1614f0156c19753710000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009d', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d550a0130000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009e', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d551f3d40001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc009f', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d552850a0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a0', '40289092543bd6a801543bff30f2000c', '4028909557758eff01577596b5760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a1', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a2', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a3', '40289092543bd6a801543bff30f2000c', '402890995475666c0154757016ab0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a4', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a5', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a6', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a7', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b456b78000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a8', '40289092543bd6a801543bff30f2000c', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a9', '40289092543bd6a801543bff30f2000c', '40289099562538b00156253dfa450001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00aa', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cbd08700001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ab', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cbdd5e90002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ac', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fa1deea0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ad', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fd663ef043b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ae', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fd71e9c043c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00af', '40289092543bd6a801543bff30f2000c', '4028909958ccf5680158ce08eaf20001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae7011b', '40289092543bd6a801543bff30f2000c', '4028909958d6f6850158d70252590000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b0', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b1', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b2', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b3', '40289092543bd6a801543bff30f2000c', '402890a85475fcba01547627e4a30242');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b4', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154764060810311');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b5', '40289092543bd6a801543bff30f2000c', '402890a85475fcba015476458aed03c0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b6', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766216ae046a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b7', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766358c0046d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b8', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b9', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a3a9d20005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00ba', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a64fb200b3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bb', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a95021015e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bc', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b003e4021a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bd', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00be', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bf', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00c0', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00c1', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c2', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3ed0fb024d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c3', '40289092543bd6a801543bff30f2000c', '402890a8576fad3001576fbc58760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c4', '40289092543bd6a801543bff30f2000c', '402890a858d1e1a40158d22b68460000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c5', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c6', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb94081017b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c7', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c8', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000c9', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000ca', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cb', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cc', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cd', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000ce', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cf', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d0', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d1', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d2', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d3', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d4', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d5', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d6', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d7', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d8', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d9', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100da', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100db', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb16a5a000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100dc', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100dd', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100de', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100df', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e0', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e1', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f07cd7201ba');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e2', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e3', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0c3c1801c3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e4', '40289092543bd6a801543bff30f2000c', '402890ba576ec7c001576ed6556f0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e5', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b1211c360000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e6', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b1b0430300e7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e7', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b20d8df701cf');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e8', '40289092543bd6a801543bff30f2000c', '402890c056b62e520156b6ab8b140000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e9', '40289092543bd6a801543bff30f2000c', '402890c056d505490156d590e6db0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200ea', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d95eeb1b0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200eb', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d95f94ca0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ec', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d9600d210002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ed', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156d9ff3c610000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ee', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156d9fff9c90001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ef', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156da0086790002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f0', '40289092543bd6a801543bff30f2000c', '402890c0576641eb01576661917e014e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f1', '40289092543bd6a801543bff30f2000c', '402890c0576641eb0157666320e6014f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f2', '40289092543bd6a801543bff30f2000c', '402890c0576641eb01576664aa540150');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f3', '40289092543bd6a801543bff30f2000c', '4028930056e4bc630156e51b51450000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f4', '40289092543bd6a801543bff30f2000c', '402893035865ea70015866fc21290005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f5', '40289092543bd6a801543bff30f2000c', '40289321562afe3e01562b0e849c0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f6', '40289092543bd6a801543bff30f2000c', '402893225766121d01576615c45c0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f7', '40289092543bd6a801543bff30f2000c', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400f8', '40289092543bd6a801543bff30f2000c', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400f9', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fa', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acd89770001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fb', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576ace34f50002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fc', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fd', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fe', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400ff', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae40100', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae40101', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8777df0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae40102', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8a059e0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50103', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8bf46e0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50104', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e9455740103');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50105', '40289092543bd6a801543bff30f2000c', '40289335576ebf9101576ec205b70000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50106', '40289092543bd6a801543bff30f2000c', '40289335576ebf9101576ec69aa30001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50107', '40289092543bd6a801543bff30f2000c', '40289355583de08b01583df1f9f90000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50108', '40289092543bd6a801543bff30f2000c', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50109', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb5109a0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010a', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb573810001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010b', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb5cd1d0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010c', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb60f7f0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010d', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010e', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae6010f', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60110', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60111', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60112', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60113', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447167f0c76');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60114', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60115', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60116', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60117', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60118', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60119', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae7011a', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549451694c0c87');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285d0648', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285d0649', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285d064a', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064b', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064c', '40289092543bd6a801543bff655b000d', '40289092543bd6a801543bfccdf00008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064d', '40289092543bd6a801543bff655b000d', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064e', '40289092543bd6a801543bff655b000d', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064f', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0650', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0651', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0652', '40289092543bd6a801543bff655b000d', '4028930056e4bc630156e51b51450000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600663', '40289092543bd6a801543bff655b000d', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0653', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0654', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0655', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0656', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0657', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0658', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600664', '40289092543bd6a801543bff655b000d', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0659', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb5109a0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f065a', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb573810001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f065b', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb5cd1d0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f065c', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb60f7f0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd2860065d', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd2860065e', '40289092543bd6a801543bff655b000d', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd2860065f', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600660', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549451694c0c87');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600661', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549454d9630c8c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600662', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549467f0ce0cb1');

-- ----------------------------
-- Table structure for ecmc_sys_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_rolemenu`;
CREATE TABLE `ecmc_sys_rolemenu` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidmenuid` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_rolemenu
-- ----------------------------
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5b00004', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fea5a8a005d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60005', '40288ee75456549a015456b8df2e000d', '4028909958be99a30158bea8df9a0003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60006', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60007', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60008', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d98eea001c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f70009', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f7000a', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dace02001e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f7000b', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f7000c', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029c', '40289092543bd6a801543bfeb3fa000a', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029d', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029e', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029f', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c02a0', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c02a1', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e3d0000', '40289092543bd6a801543bfee6a8000b', '40288eef55775e060155775f66160002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0001', '40289092543bd6a801543bfee6a8000b', '40289092559069cd0155907110460006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0002', '40289092543bd6a801543bfee6a8000b', '4028909556c4f2440156c5db2f8700ea');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0003', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cb80d6e0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0022', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158be9e0d350000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0023', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158bea03b880002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0004', '40289092543bd6a801543bfee6a8000b', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0005', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0006', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0007', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0008', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0009', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000a', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0010', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0011', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0012', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0013', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0014', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0015', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0016', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0017', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0018', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0019', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001a', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0020', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0021', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bac90001', '40289092543bd6a801543bff30f2000c', '40288eef55775e060155775f66160002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0002', '40289092543bd6a801543bff30f2000c', '40289092559069cd0155907110460006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0003', '40289092543bd6a801543bff30f2000c', '4028909556c4f2440156c5db2f8700ea');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0004', '40289092543bd6a801543bff30f2000c', '402890995621747901562187c9ad0001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0005', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cb80d6e0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0006', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158be9e0d350000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0007', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158bea006250001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd0008', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158bea03b880002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd0009', '40289092543bd6a801543bff30f2000c', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000a', '40289092543bd6a801543bff30f2000c', '4028936f567dd77101567dde38270001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000b', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000c', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000d', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000e', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000f', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0010', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0011', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0012', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0013', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0014', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0015', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0016', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0017', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0018', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0019', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001a', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001b', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001c', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001d', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001e', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001f', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0020', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0021', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0022', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0023', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00024', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00025', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00026', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00027', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285d0647', '40289092543bd6a801543bff655b000d', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0641', '40289092543bd6a801543bff655b000d', '4028936f567dd77101567dde38270001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0642', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0643', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0644', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0645', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0646', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c2e0dc0008');

-- 4.updateSQL2016-12-19ECMC权限ecmc_sys_menu

-- ----------------------------
-- Table structure for ecmc_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_menu`;
CREATE TABLE `ecmc_sys_menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `orderno` int(11) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `lock` char(1) DEFAULT '0' COMMENT '是否加锁，0:false 可被分配分配给角色、删除;1：true 不可被分配给角色、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_menu
-- ----------------------------
INSERT INTO `ecmc_sys_menu` VALUES ('2', '主菜单', '123', '123', '2', '1', '2016-03-29 11:42:39', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('3', '二级菜单', '1', '1', '2', '0', '2016-03-30 11:12:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4', '二级菜单2', null, null, '1', '2', null, 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eeb545f98a801545fea5a8a005d', '数据管理', '数据管理', 'app.sysdatatree', 'ff8080815438ac44015438d8d5000018', '80', '2016-04-29 10:47:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'eayunfont ef-data', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eee54eacc470154eb01c0980010', '开发测试', '123', null, '40288eee54eacc470154eb0042e4000d', '1', '2016-05-26 11:00:41', '40288ee4545b5b5001545b901fac0007', null, null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eee54eacc470154eb0825bb001b', '开发测试', '123', null, '40288eee54eacc470154eb065d590018', '1', '2016-05-26 11:07:40', '40288ee4545b5b5001545b901fac0007', null, null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c66cb1f40000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:28:45', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c670d16f0001', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:33:15', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef55775e060155775f66160002', '定时任务', null, 'app.task', 'ff8080815438ac44015438d8d5000018', '100', '2016-06-22 17:09:48', '40288eee545fc01a01545fe4cd06000f', '1', 'eayunfont ef-task', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40289092559069cd0155907110460006', '邮件短信', '邮件短信', 'app.mailsms', 'ff8080815438ac44015438d8d5000018', '90', '2016-06-27 13:59:36', '40289092543bcc8c01543bd161c40000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909556c4f2440156c5db2f8700ea', '回收站', '回收站资源', 'app.recycle', 'ff8080815438ac44015438bcfb260001', '50', '2016-08-26 15:58:11', '40289095547ea16201547ea5b79a0001', '1', 'eayunfont ef-recovery', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890995621747901562187c9ad0001', '价格配置', null, 'app.price', 'ff8080815438ac44015438c14b110006', '50', '2016-07-25 18:09:22', 'ff808081545a6f9d01545c5f4a480007', '1', 'eayunfont ef-cost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40289099567cb38a01567cb80d6e0000', '在线统计', null, 'app.cusonline', 'ff8080815438ac44015438d8d5000018', '90', '2016-08-12 11:07:32', 'ff808081545a6f9d01545c5f4a480007', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158be9e0d350000', 'API管理', null, null, '', '60', '2016-12-02 16:19:38', '2c91808256f81c44015702bbf9510000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea006250001', 'API概览', '暂用了云主机的图标', 'app.apioverview', '4028909958be99a30158be9e0d350000', '10', '2016-12-02 16:21:48', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea03b880002', '限制管理', '暂用了网络的图标', 'app.apilimit', '4028909958be99a30158be9e0d350000', '20', '2016-12-02 16:22:01', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea8df9a0003', 'API管理', '暂用了组织机构的图标', 'app.apimanage', 'ff8080815438ac44015438d8d5000018', '110', '2016-12-02 16:31:28', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890bb5413eb6a01541402ce910000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', null, null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028936f567dd77101567ddad4b00000', '订单管理', null, 'app.order', 'ff8080815438ac44015438c14b110006', '20', '2016-08-12 16:25:08', '40288ef054a94b120154a94f953c0001', '1', 'eayunfont ef-order', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028936f567dd77101567dde38270001', '配额模板', null, 'app.quotatemp', 'ff8080815438ac44015438c14b110006', '70', '2016-08-12 16:28:50', '40288ef054a94b120154a94f953c0001', '1', 'eayunfont ef-quota', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('5', '二级菜单1', null, null, '1', '0', '2016-03-30 11:14:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bb40b20000', '总览', '', 'app.overview', null, '10', '2016-04-21 20:11:16', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-overview', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bcfb260001', '公有云资源管理', null, '', null, '20', '2016-04-21 20:13:09', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438be965d0002', '云主机', null, 'app.cloudhost', 'ff8080815438ac44015438bcfb260001', '10', '2016-04-21 20:14:55', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bf1f390003', '网络', 'VPC', 'app.net', 'ff8080815438ac44015438bcfb260001', '20', '2016-04-21 20:15:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bfc39a0004', '安全', null, 'app.safe', 'ff8080815438ac44015438bcfb260001', '30', '2016-04-21 20:16:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-safe', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c05a8b0005', '对象存储', 'OBS', 'app.obs', 'ff8080815438ac44015438bcfb260001', '40', '2016-04-21 20:16:50', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-obs', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c14b110006', '公有云业务管理', null, '', null, '30', '2016-04-21 20:17:52', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c27e5d0007', '客户管理', null, 'app.customer', 'ff8080815438ac44015438c14b110006', '10', '2016-04-21 20:19:11', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c2e0dc0008', '工单管理', null, 'app.workorder', 'ff8080815438ac44015438c14b110006', '30', '2016-04-21 20:19:36', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-workorder', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c33c7b0009', '消息管理', null, 'app.message', 'ff8080815438ac44015438c14b110006', '40', '2016-04-21 20:19:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c8999a000a', '公告管理', null, 'app.notice', 'ff8080815438ac44015438c14b110006', '50', '2016-04-21 20:25:51', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-contacts', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce0059000b', '数据中心管理', null, '', null, '40', '2016-04-21 20:31:45', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce7e8e000c', '数据中心', null, 'app.center', 'ff8080815438ac44015438ce0059000b', '10', '2016-04-21 20:32:17', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-center', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cf239e000d', '服务器', null, 'app.server', 'ff8080815438ac44015438ce0059000b', '20', '2016-04-21 20:32:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-server', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cfcf98000e', '机柜', null, 'app.cabinet', 'ff8080815438ac44015438ce0059000b', '30', '2016-04-21 20:33:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cabinet', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d03f87000f', '交换机', null, 'app.switch', 'ff8080815438ac44015438ce0059000b', '40', '2016-04-21 20:34:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-switch', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d1075f0010', '存储', null, 'app.storage', 'ff8080815438ac44015438ce0059000b', '50', '2016-04-21 20:35:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-storage', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d199e40011', '防火墙', null, 'app.firewall', 'ff8080815438ac44015438ce0059000b', '60', '2016-04-21 20:35:41', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-firewall', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d2dc4a0012', '型号维护', null, 'app.model', 'ff8080815438ac44015438ce0059000b', '70', '2016-04-21 20:37:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-xinghaoweihu', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d3aa7a0013', 'IP', null, 'app.ip', 'ff8080815438ac44015438ce0059000b', '80', '2016-04-21 20:37:56', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-IP', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d5fe9c0014', '监控管理', null, '', null, '50', '2016-04-21 20:40:29', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d660ff0015', '资源监控', null, 'app.monitor', 'ff8080815438ac44015438d5fe9c0014', '10', '2016-04-21 20:40:54', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-monitor', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d721300016', '报警管理', null, 'app.warning', 'ff8080815438ac44015438d5fe9c0014', '20', '2016-04-21 20:41:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-warning', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d7fbd50017', '联系人管理', null, 'app.contacts', 'ff8080815438ac44015438d5fe9c0014', '30', '2016-04-21 20:42:39', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d8d5000018', '系统管理', null, '', null, '60', '2016-04-21 20:43:35', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d93963001a', '组织机构', null, 'app.department', 'ff8080815438ac44015438d8d5000018', '10', '2016-04-21 20:44:00', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d98eea001c', '菜单管理', null, 'app.menu', 'ff8080815438ac44015438d8d5000018', '20', '2016-04-21 20:44:22', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-menu', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438da284a001d', '角色管理', null, 'app.role', 'ff8080815438ac44015438d8d5000018', '30', '2016-04-21 20:45:01', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-role', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dace02001e', '权限管理', null, 'app.authority', 'ff8080815438ac44015438d8d5000018', '40', '2016-04-21 20:45:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-forbid', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dbb92e001f', '用户管理', null, 'app.user', 'ff8080815438ac44015438d8d5000018', '50', '2016-04-21 20:46:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dc6dfa0020', '日志管理', '', 'app.log', 'ff8080815438ac44015438d8d5000018', '60', '2016-04-21 20:47:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-log', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dccfb40021', '数据管理', null, '#/sysdatatree/sysdatatree', 'ff8080815438ac44015438dccfb40021', '70', '2016-04-21 20:47:55', '402890bc540ad19801540ad1fc300000', '1', null, '0');


-- 5.updateSQL2016-12-19ECMC权限ecmc_sys_role
-- ----------------------------
-- Table structure for ecmc_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_role`;
CREATE TABLE `ecmc_sys_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `protect` char(1) DEFAULT '0' COMMENT '是否受保护，0:false 可配置权限、删除;1：true 受保护，不可配置权限、删除',
  `hide` char(1) DEFAULT '0' COMMENT '是否隐藏，0:否，不隐藏;1：是，隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_role
-- ----------------------------
INSERT INTO `ecmc_sys_role` VALUES ('40288ee75456549a015456b8df2e000d', '超级管理员', '有所有权限（别删，系统初始角色）', '2016-04-27 15:57:16', 'ff808081543cbe2701543cceba910000', '1', '1', '1');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfeb3fa000a', '客服人员', '系统初始角色', '2016-04-22 11:23:48', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfee6a8000b', '运维工程师', '系统初始角色', '2016-04-22 11:24:01', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff30f2000c', '管理员', '系统初始角色', '2016-04-22 11:24:20', 'ff808081543cbe2701543cceba910000', '1', '0', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff655b000d', '商务', '系统初始角色', '2016-04-22 11:24:34', 'ff808081543cbe2701543cceba910000', '1', '0', '0');


-- 6.updateSQL2016-12-19ECMC权限ecmc_sys_roleauth

-- ----------------------------
-- Table structure for ecmc_sys_roleauth
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_roleauth`;
CREATE TABLE `ecmc_sys_roleauth` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `auth_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidauthid` (`role_id`,`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_roleauth
-- ----------------------------
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f8000d', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7f8d66000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f8000e', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7ff16c000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f8000f', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8079ed000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80010', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f80d1980011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80011', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80012', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f80013', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90014', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90015', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f840aaf0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90016', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8470cc0059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90017', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8703f0005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90018', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f877367005d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f90019', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001a', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001b', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001c', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5f9001d', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa001e', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa001f', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0020', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0021', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0022', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545feb3301005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0023', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545febaaf80061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0024', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec16a20063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0025', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec79ae0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0026', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fece84a0067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0027', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fed7a6c0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0028', '40288ee75456549a015456b8df2e000d', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa002a', '40288ee75456549a015456b8df2e000d', '4028909958ccf5680158ce21762b0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa002b', '40288ee75456549a015456b8df2e000d', '4028909958ccf5680158ce22c9a20003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958ccf5680158ce23d5fa0029', '40288ee75456549a015456b8df2e000d', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a2', '40289092543bd6a801543bfeb3fa000a', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a3', '40289092543bd6a801543bfeb3fa000a', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a4', '40289092543bd6a801543bfeb3fa000a', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a5', '40289092543bd6a801543bfeb3fa000a', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a6', '40289092543bd6a801543bfeb3fa000a', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02ae', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02af', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02b0', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02b1', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02b2', '40289092543bd6a801543bfeb3fa000a', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a7', '40289092543bd6a801543bfeb3fa000a', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a8', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02a9', '40289092543bd6a801543bfeb3fa000a', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02aa', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6d02ab', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154945444ec0c8a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02ac', '40289092543bd6a801543bfeb3fa000a', 'ff8080815485802201549454d9630c8c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028932b576abcd301576b028c6e02ad', '40289092543bd6a801543bfeb3fa000a', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0024', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0025', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0026', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0027', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0028', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4d0029', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002a', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002b', '40289092543bd6a801543bfee6a8000b', '40288ee555a461290155a46d9f1d0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002c', '40289092543bd6a801543bfee6a8000b', '40288ee555a461290155a46efb0a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002d', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002e', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e002f', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0030', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0031', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0032', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0033', '40289092543bd6a801543bfee6a8000b', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0034', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0035', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4e0036', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0037', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0038', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0039', '40289092543bd6a801543bfee6a8000b', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003a', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003b', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003c', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003d', '40289092543bd6a801543bfee6a8000b', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003e', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f003f', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0040', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0041', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0042', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0043', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0044', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e4f0045', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500046', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500047', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500048', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500049', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004a', '40289092543bd6a801543bfee6a8000b', '40288ef3557c121201557c13b5730001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004b', '40289092543bd6a801543bfee6a8000b', '40288ef3557c121201557c21c18000d7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004c', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4a12db0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004d', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4b326a0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004e', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4c66930009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e50004f', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4d2eb4000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500050', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4e2173000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500051', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500052', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a26b7c000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500053', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a34c75000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500054', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e500055', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510056', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510057', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510058', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e510059', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005a', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005b', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005c', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005d', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e51005e', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52005f', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520060', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520061', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520062', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520063', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520064', '40289092543bd6a801543bfee6a8000b', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520065', '40289092543bd6a801543bfee6a8000b', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520066', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520067', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520068', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e520069', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52006a', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52006b', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e52006c', '40289092543bd6a801543bfee6a8000b', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53006d', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53006e', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53006f', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530070', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530071', '40289092543bd6a801543bfee6a8000b', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530072', '40289092543bd6a801543bfee6a8000b', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530073', '40289092543bd6a801543bfee6a8000b', '40289092559069cd01559073979f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530074', '40289092543bd6a801543bfee6a8000b', '40289092559069cd01559074c804000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530075', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530076', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530077', '40289092543bd6a801543bfee6a8000b', '4028909556c1614f0156c19753710000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530078', '40289092543bd6a801543bfee6a8000b', '4028909556d54c4a0156d550a0130000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e530079', '40289092543bd6a801543bfee6a8000b', '4028909556d54c4a0156d551f3d40001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53007a', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e53007b', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007c', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007d', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007e', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54007f', '40289092543bd6a801543bfee6a8000b', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540080', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cbd08700001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540081', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cbdd5e90002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540082', '40289092543bd6a801543bfee6a8000b', '40289099576f8d2501576fa1deea0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900d0', '40289092543bd6a801543bfee6a8000b', '4028909958ccf5680158ce08eaf20001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540083', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540084', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540085', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540086', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540087', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540088', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e540089', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e54008a', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008b', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008c', '40289092543bd6a801543bfee6a8000b', '402890a8576fad3001576fbc58760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008d', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008e', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e55008f', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550090', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550091', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550092', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550093', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550094', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550095', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550096', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550097', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e550098', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e560099', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009a', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009b', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009c', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009d', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009e', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e56009f', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a0', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a1', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a2', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a3', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a4', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef5c49201ac');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a5', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a6', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5600a7', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700a8', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700a9', '40289092543bd6a801543bfee6a8000b', '402890ba576ec7c001576ed6556f0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700aa', '40289092543bd6a801543bfee6a8000b', '402890c056afe5ff0156b1211c360000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ab', '40289092543bd6a801543bfee6a8000b', '402890c056afe5ff0156b20d8df701cf');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ac', '40289092543bd6a801543bfee6a8000b', '402890c056b62e520156b6ab8b140000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ad', '40289092543bd6a801543bfee6a8000b', '402890c056d505490156d590e6db0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700ae', '40289092543bd6a801543bfee6a8000b', '402890c056d940490156d95eeb1b0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700af', '40289092543bd6a801543bfee6a8000b', '402890c056d940490156d95f94ca0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b0', '40289092543bd6a801543bfee6a8000b', '402890c056d9ee920156d9ff3c610000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b1', '40289092543bd6a801543bfee6a8000b', '402890c056d9ee920156d9fff9c90001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b2', '40289092543bd6a801543bfee6a8000b', '402890c0576641eb01576661917e014e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b3', '40289092543bd6a801543bfee6a8000b', '402890c0576641eb01576664aa540150');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b4', '40289092543bd6a801543bfee6a8000b', '402893035865ea70015866fc21290005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b5', '40289092543bd6a801543bfee6a8000b', '40289321562afe3e01562b0e849c0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5700b6', '40289092543bd6a801543bfee6a8000b', '402893225766121d01576615c45c0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800b7', '40289092543bd6a801543bfee6a8000b', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800b8', '40289092543bd6a801543bfee6a8000b', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800b9', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800ba', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bb', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bc', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bd', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8777df0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800be', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8a059e0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800bf', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8bf46e0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c0', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e9455740103');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c1', '40289092543bd6a801543bfee6a8000b', '40289335576ebf9101576ec205b70000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c2', '40289092543bd6a801543bfee6a8000b', '40289335576ebf9101576ec69aa30001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c3', '40289092543bd6a801543bfee6a8000b', '40289355583de08b01583df1f9f90000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c4', '40289092543bd6a801543bfee6a8000b', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c5', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5800c6', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900c7', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900c8', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900c9', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900ca', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cb', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cc', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cd', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900ce', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909058ce0c030158ce0e8e5900cf', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad10028', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad10029', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002a', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002b', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002c', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7c3e5c0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002d', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002e', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad1002f', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20030', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20031', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20032', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20033', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20034', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20035', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad20036', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad30037', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad30038', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad30039', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003a', '40289092543bd6a801543bff30f2000c', '40288ee555a461290155a46d9f1d0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003b', '40289092543bd6a801543bff30f2000c', '40288ee555a461290155a46efb0a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003c', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003d', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003e', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad3003f', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fda1beb001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40040', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40041', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40042', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40043', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe7fccd005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40044', '40289092543bd6a801543bff30f2000c', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40045', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40046', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40047', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40048', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545feb443f001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad40049', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545febd38d001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad4004a', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad4004b', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004c', '40289092543bd6a801543bff30f2000c', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004d', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600abc0a001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004e', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad5004f', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50050', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50051', '40289092543bd6a801543bff30f2000c', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50052', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609040600001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50053', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50054', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50055', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50056', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460978752000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad50057', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60058', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60059', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005a', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609e2b450017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005b', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005c', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005d', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005e', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a2988b0021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad6005f', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60060', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60061', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60062', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a98624002b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad60063', '40289092543bd6a801543bff30f2000c', '40288ef3557c121201557c13b5730001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70064', '40289092543bd6a801543bff30f2000c', '40288ef3557c121201557c21c18000d7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70065', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4a12db0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70066', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4b326a0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70067', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4c66930009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70068', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4d2eb4000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad70069', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4e2173000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006a', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006b', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a26b7c000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006c', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a34c75000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006d', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006e', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad7006f', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b56dd1000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80070', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80071', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80072', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80073', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80074', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80075', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80076', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80077', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80078', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad80079', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1b04d0019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad8007a', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad8007b', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007c', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608878dc01a1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007d', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007e', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad9007f', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90080', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546095699801ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90081', '40289092543bd6a801543bff30f2000c', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90082', '40289092543bd6a801543bff30f2000c', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90083', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a40aa5d0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90084', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a4660de0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90085', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a4b4eae0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90086', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bad90087', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b0d78f002c1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0088', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0089', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008a', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008b', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008c', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008d', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5b42d607e8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008e', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bf9c69d0006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada008f', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bfde6460009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0090', '40289092543bd6a801543bff30f2000c', '40289092544c795d01544ca94fe60000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0091', '40289092543bd6a801543bff30f2000c', '40289092547a07b201547a5098d50009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bada0092', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0093', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0094', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0095', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0096', '40289092543bd6a801543bff30f2000c', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0097', '40289092543bd6a801543bff30f2000c', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0098', '40289092543bd6a801543bff30f2000c', '40289092559069cd01559073979f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb0099', '40289092543bd6a801543bff30f2000c', '40289092559069cd01559074c804000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009a', '40289092543bd6a801543bff30f2000c', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009b', '40289092543bd6a801543bff30f2000c', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009c', '40289092543bd6a801543bff30f2000c', '4028909556c1614f0156c19753710000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009d', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d550a0130000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badb009e', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d551f3d40001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc009f', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d552850a0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a0', '40289092543bd6a801543bff30f2000c', '4028909557758eff01577596b5760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a1', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a2', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a3', '40289092543bd6a801543bff30f2000c', '402890995475666c0154757016ab0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a4', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a5', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a6', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a7', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b456b78000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a8', '40289092543bd6a801543bff30f2000c', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badc00a9', '40289092543bd6a801543bff30f2000c', '40289099562538b00156253dfa450001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00aa', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cbd08700001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ab', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cbdd5e90002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ac', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fa1deea0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ad', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fd663ef043b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00ae', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fd71e9c043c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00af', '40289092543bd6a801543bff30f2000c', '4028909958ccf5680158ce08eaf20001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae7011b', '40289092543bd6a801543bff30f2000c', '4028909958d6f6850158d70252590000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b0', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b1', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b2', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b3', '40289092543bd6a801543bff30f2000c', '402890a85475fcba01547627e4a30242');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b4', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154764060810311');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badd00b5', '40289092543bd6a801543bff30f2000c', '402890a85475fcba015476458aed03c0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b6', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766216ae046a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b7', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766358c0046d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b8', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00b9', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a3a9d20005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00ba', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a64fb200b3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bb', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a95021015e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bc', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b003e4021a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bd', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00be', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00bf', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00c0', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bade00c1', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c2', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3ed0fb024d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c3', '40289092543bd6a801543bff30f2000c', '402890a8576fad3001576fbc58760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c4', '40289092543bd6a801543bff30f2000c', '402890a858d1e1a40158d22b68460000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c5', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c6', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb94081017b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c7', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702badf00c8', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000c9', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000ca', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cb', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cc', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cd', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000ce', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000cf', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d0', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d1', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d2', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae000d3', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d4', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d5', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d6', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d7', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d8', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100d9', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100da', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100db', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb16a5a000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100dc', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100dd', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100de', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae100df', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e0', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e1', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f07cd7201ba');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e2', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e3', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0c3c1801c3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e4', '40289092543bd6a801543bff30f2000c', '402890ba576ec7c001576ed6556f0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e5', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b1211c360000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e6', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b1b0430300e7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e7', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b20d8df701cf');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e8', '40289092543bd6a801543bff30f2000c', '402890c056b62e520156b6ab8b140000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200e9', '40289092543bd6a801543bff30f2000c', '402890c056d505490156d590e6db0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200ea', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d95eeb1b0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae200eb', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d95f94ca0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ec', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d9600d210002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ed', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156d9ff3c610000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ee', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156d9fff9c90001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300ef', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156da0086790002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f0', '40289092543bd6a801543bff30f2000c', '402890c0576641eb01576661917e014e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f1', '40289092543bd6a801543bff30f2000c', '402890c0576641eb0157666320e6014f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f2', '40289092543bd6a801543bff30f2000c', '402890c0576641eb01576664aa540150');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f3', '40289092543bd6a801543bff30f2000c', '4028930056e4bc630156e51b51450000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f4', '40289092543bd6a801543bff30f2000c', '402893035865ea70015866fc21290005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f5', '40289092543bd6a801543bff30f2000c', '40289321562afe3e01562b0e849c0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f6', '40289092543bd6a801543bff30f2000c', '402893225766121d01576615c45c0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae300f7', '40289092543bd6a801543bff30f2000c', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400f8', '40289092543bd6a801543bff30f2000c', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400f9', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fa', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acd89770001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fb', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576ace34f50002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fc', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fd', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400fe', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae400ff', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae40100', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae40101', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8777df0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae40102', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8a059e0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50103', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8bf46e0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50104', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e9455740103');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50105', '40289092543bd6a801543bff30f2000c', '40289335576ebf9101576ec205b70000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50106', '40289092543bd6a801543bff30f2000c', '40289335576ebf9101576ec69aa30001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50107', '40289092543bd6a801543bff30f2000c', '40289355583de08b01583df1f9f90000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50108', '40289092543bd6a801543bff30f2000c', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae50109', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb5109a0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010a', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb573810001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010b', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb5cd1d0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010c', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb60f7f0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010d', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae5010e', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae6010f', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60110', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60111', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60112', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60113', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447167f0c76');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60114', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60115', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60116', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60117', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60118', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae60119', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909958d6f6850158d702bae7011a', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549451694c0c87');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285d0648', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285d0649', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285d064a', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064b', '40289092543bd6a801543bff655b000d', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064c', '40289092543bd6a801543bff655b000d', '40289092543bd6a801543bfccdf00008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064d', '40289092543bd6a801543bff655b000d', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064e', '40289092543bd6a801543bff655b000d', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e064f', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0650', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0651', '40289092543bd6a801543bff655b000d', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0652', '40289092543bd6a801543bff655b000d', '4028930056e4bc630156e51b51450000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600663', '40289092543bd6a801543bff655b000d', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285e0653', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0654', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0655', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0656', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0657', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0658', '40289092543bd6a801543bff655b000d', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600664', '40289092543bd6a801543bff655b000d', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f0659', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb5109a0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f065a', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb573810001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f065b', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb5cd1d0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd285f065c', '40289092543bd6a801543bff655b000d', '402893f956dfa84c0156dfb60f7f0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd2860065d', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd2860065e', '40289092543bd6a801543bff655b000d', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd2860065f', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600660', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549451694c0c87');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600661', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549454d9630c8c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028934b576e677901576fcd28600662', '40289092543bd6a801543bff655b000d', 'ff8080815485802201549467f0ce0cb1');

-- 7.updateSQL2016-12-19ECMC权限ecmc_sys_rolemenu

-- ----------------------------
-- Table structure for ecmc_sys_rolemenu
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_rolemenu`;
CREATE TABLE `ecmc_sys_rolemenu` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidmenuid` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_rolemenu
-- ----------------------------
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5b00004', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fea5a8a005d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60005', '40288ee75456549a015456b8df2e000d', '4028909958be99a30158bea8df9a0003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60006', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60007', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f60008', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d98eea001c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f70009', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f7000a', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dace02001e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f7000b', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958ccf5680158ce23d5f7000c', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029c', '40289092543bd6a801543bfeb3fa000a', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029d', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029e', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029f', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c02a0', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c02a1', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e3d0000', '40289092543bd6a801543bfee6a8000b', '40288eef55775e060155775f66160002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0001', '40289092543bd6a801543bfee6a8000b', '40289092559069cd0155907110460006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0002', '40289092543bd6a801543bfee6a8000b', '4028909556c4f2440156c5db2f8700ea');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0003', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cb80d6e0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0022', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158be9e0d350000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0023', '40289092543bd6a801543bfee6a8000b', '4028909958be99a30158bea03b880002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0004', '40289092543bd6a801543bfee6a8000b', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0005', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0006', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0007', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4a0008', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0009', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000a', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b000f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0010', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0011', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0012', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0013', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0014', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4b0015', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0016', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0017', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0018', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0019', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001a', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c001f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0020', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909058ce0c030158ce0e8e4c0021', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bac90001', '40289092543bd6a801543bff30f2000c', '40288eef55775e060155775f66160002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0002', '40289092543bd6a801543bff30f2000c', '40289092559069cd0155907110460006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0003', '40289092543bd6a801543bff30f2000c', '4028909556c4f2440156c5db2f8700ea');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0004', '40289092543bd6a801543bff30f2000c', '402890995621747901562187c9ad0001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0005', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cb80d6e0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0006', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158be9e0d350000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacc0007', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158bea006250001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd0008', '40289092543bd6a801543bff30f2000c', '4028909958be99a30158bea03b880002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd0009', '40289092543bd6a801543bff30f2000c', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000a', '40289092543bd6a801543bff30f2000c', '4028936f567dd77101567dde38270001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000b', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000c', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000d', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000e', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacd000f', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0010', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0011', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0012', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0013', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0014', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0015', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0016', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0017', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0018', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bace0019', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001a', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001b', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001c', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001d', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001e', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf001f', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0020', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0021', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0022', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bacf0023', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00024', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00025', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00026', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028909958d6f6850158d702bad00027', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285d0647', '40289092543bd6a801543bff655b000d', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0641', '40289092543bd6a801543bff655b000d', '4028936f567dd77101567dde38270001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0642', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0643', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0644', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0645', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0646', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c2e0dc0008');


