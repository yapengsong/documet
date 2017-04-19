/*
新增ecmc负载均衡解绑健康检查权限
曹翔宇
Date: 2017-03-16 15:31:15
*/
DELETE FROM ecmc_sys_authority WHERE id = '4028908f5460970c015460bdcd3c0012';
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460bdcd3c0012', '负载均衡器健康检查', '', '2016-04-29 14:38:52', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_hm;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/getMonitorListByPool.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/bindHealthMonitor.do;\nhttp:/ecmc/virtual/loadbalance/healthmonitor/unBindHealthMonitor.do;', 'ff8080815438ac44015438bf1f390003', '0');
