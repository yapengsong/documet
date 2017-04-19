/*
曹翔宇
新增obs1.2.1中cdn历史账单和资源详情权限

Date: 2017-03-08 11:26:32
*/

DELETE FROM ecmc_sys_authority WHERE id = '4028909955a082c90155a08fcbe80003';
INSERT INTO `ecmc_sys_authority` VALUES ('4028909955a082c90155a08fcbe80003', 'CDN服务', null, '2016-06-30 17:07:06', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:obs_cdn;\nhttp:/ecmc/obs/cdn/getobscdncustomer.do;\nhttp:/ecmc/obs/cdn/getdomaindata.do;\nhttp:/ecmc/obs/cdn/getmonthdomaindata.do;\nhttp:/ecmc/obs/cdn/getmonthdomainpage.do;\nhttp:/ecmc/obs/cdn/getalldomainlist.do;\nhttp:/ecmc/obs/cdn/getCDNResources.do;\nhttp:/ecmc/obs/cdn/getCdnHistoryResources.do;', 'ff8080815438ac44015438c05a8b0005', '0');
