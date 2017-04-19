/*
增加缺少的api访问限制权限
曹翔宇

Date: 2017-02-15 16:00
*/
DELETE FROM ecmc_sys_authority WHERE id = '40288eeb545f98a801545fece84a0067';
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fece84a0067', '缓存同步', '数据字典-缓存同步', '2016-04-29 10:50:42', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_syncCache;http:/ecmc/system/enum/syncdatatree.do;\nhttp:/ecmc/virtual/tag/syncRedisWithDB.do;\nhttp:/ecmc/monitor/alarm/resyncsmsquotacache.do;\nhttp:/ecmc/ecmc/obs/obsview/syncobsuser.do;\nhttp:/ecmc/system/log/syncLog.do;\nhttp:/ecmc/system/log/syncEcmcLog.do;\nhttp:/billing/factor/syncfactorprice.do;\nhttp:/ecmc/customer/synccustomer.do;\nhttp:/monitor/alarm/syncEcscMonitor.do;\nhttp:/ecmc/monitor/alarm/syncEcmcMonitor.do;\nhttp:/ecmc/system/api/synchronizeBlack.do;\nhttp:/ecmc/system/apicount/syncapicount.do', '40288eeb545f98a801545fea5a8a005d', '1');


INSERT INTO `ecmc_sys_authority` VALUES ('402890a858d1e1a40158d22b68460000', 'API访问限制', null, '2016-12-06 11:26:49', '2c91808256f81c44015702bbf9510000', '1', 'ui:api_restrict_customer;\nhttp:/ecmc/customer/getapitype.do;\nhttp:/ecmc/customer/getrestrictrequestcount.do;\nhttp:/ecmc/customer/updateapirequestcount.do;', 'ff8080815438ac44015438c27e5d0007', '0');



INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909159874a4c0159875b0f0500d3', '40289092543bd6a801543bff30f2000c', '402890a858d1e1a40158d22b68460000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028909159af5e910159b065dec30094', '40289092543bd6a801543bfee6a8000b', '402890a858d1e1a40158d22b68460000');