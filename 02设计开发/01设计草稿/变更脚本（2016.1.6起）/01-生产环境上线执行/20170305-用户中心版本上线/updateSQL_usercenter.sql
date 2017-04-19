-- 1.updateSQL2016-06-22数据字典中增加CDN所需访问令牌记录
/*
-- Query: select * from sys_data_tree where node_name like '%CDN访问令牌%'
LIMIT 0, 1000
-- 导出CDN访问令牌的insert语句 
-- Author: 张帆
-- Date: 2016-06-22 15:34
*/
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0009007','CDN访问令牌','0009',7,'0','Param1 CDN Access Token\nParam2 DNS Access Token','1','a1ce4419-86d9-4d05-a1fe-7abadb52a2e9','14528,85c43feb6d8978901ab82374898a979a',NULL,'CDN Access Token',NULL);


-- 2.updateSQL2016-06-22添加bucket关联记录表及权限

-- 增加bucket和cdn的关联表 段彬彬 2016.06.16
DROP TABLE IF EXISTS `cdn_bucket`;
CREATE TABLE `cdn_bucket` (
  `id` varchar(36) NOT NULL,
  `cdn_provider` varchar(36) DEFAULT NULL,
  `cus_id` varchar(36) DEFAULT NULL,
  `bucket_name` varchar(64) DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
	`delete_time` datetime DEFAULT NULL,
  `is_opencdn` varchar(10) DEFAULT '0',
  `cdn_status` varchar(10) DEFAULT '0',
  `cdn_path` varchar(255) DEFAULT NULL,
  `domain_id` varchar(36) DEFAULT NULL,
  
  `record_id` varchar(36) DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


-- OBS1.1CDN加速地址前缀和缓存规则
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0009005', 'CDN加速地址', '0009', 5, '0', '线上环境用和测试环境用', '1', 'file.eayun.com', '', NULL, 'cdn.eayunCDNHost', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0009006', 'CDN加速缓存配置', '0009', 6, '0', 'para1：缓存资源\npara2：缓存时间', '1', NULL, NULL, NULL, 'CDNCACHE', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0009006001', '缓存规则1', '0009006', 1, '0', '缓存30天', '1', '/*', '2592000', NULL, NULL, NULL);

-- 添加CDN设置权限
INSERT INTO `sys_selfpower` (`power_id`, `power_name`, `power_url`, `power_route`, `power_sort`, `parent_id`, `power_desc`, `power_icon`) VALUES ('5438cb44385711e69ea0001a4a7ae4d4', 'CDN设置', NULL, 'bucket_cdnconfig', 231018, '40289099531765a6015317cdd318000a', '包括开启和关闭', NULL);

-- 添加CDN设置权限-角色关联记录，超级管理员和管理员有权限，普通用户无权限
INSERT INTO sys_selfrolepower (
	rp_id,
	role_id,
	power_id,
	rp_state
)(
	SELECT
		REPLACE (uuid(), '-', '') AS rp_id,
		r.role_id AS role_id,
		p.power_id AS power_id,
		'1' AS rp_state
	FROM
		sys_selfrole r,
		sys_selfpower p
	WHERE
		r.role_name LIKE '%管理员'
	AND p.power_route = 'bucket_cdnconfig'
);

-- 3.updateSQL2016-07-18冻结解冻对客户表与用户表新增字段

ALTER TABLE sys_selfcustomer 
ADD COLUMN is_blocked CHAR(1) default 0;

ALTER TABLE sys_selfcustomer 
ADD COLUMN block_opstatus CHAR(1);

ALTER TABLE sys_selfuser 
ADD COLUMN is_blocked CHAR(1) default 0;



-- 4.updateSQL2016-07-21冻结解冻资源新增表cus_blockresource
DROP TABLE IF EXISTS `cus_blockresource`;
CREATE TABLE `cus_blockresource` (
  `block_id` varchar(32) NOT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `is_blocked` char(1) DEFAULT NULL,
  `block_opstatus` char(1) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `block_account` mediumtext,
  `unblock_account` mediumtext,
  `block_cloudresource` mediumtext,
  `unblock_cloudresource` mediumtext,
  `block_obs` mediumtext,
  `unblock_obs` mediumtext,
  PRIMARY KEY (`block_id`),
  KEY `idx_cusblockrescusid` (`cus_id`) USING BTREE
) ENGINE=InnoDB;


-- 5.updateSQL2016-07-28obs_accesskey增加暂停服务字段
ALTER TABLE obs_accesskey 
ADD COLUMN is_stopservice CHAR(1) default 0;


-- 6.updateSQL2016-07-29计费因子价格配置表money_billing_factor
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `money_billing_factor`;
CREATE TABLE `money_billing_factor` (
  `id` varchar(36) NOT NULL,
  `resources_type` varchar(36) DEFAULT NULL,
  `billing_factor` varchar(36) DEFAULT NULL,
  `factor_unit` varchar(36) DEFAULT NULL,
  `start_num` bigint(20) DEFAULT NULL,
  `end_num` bigint(20) DEFAULT NULL,
  `pay_type` varchar(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `dc_id` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


-- 7.updateSQL2016-07-29新添价格配置资源类型数据字典
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004', '价格配置', '0007', 2, '0', NULL, '1', NULL, NULL, NULL, 'priceConfig', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004001', '云主机', '0007004', 1, '0', NULL, '1', NULL, NULL, NULL, 'billingVM', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004001001', 'CPU', '0007004001', 1, '0', NULL, '1', NULL, NULL, NULL, 'vmCPU', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004001001001', '核数', '0007004001001', 1, '0', NULL, '1', '核', '单价计价', NULL, 'cpuSize', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004001002', '内存', '0007004001', 2, '0', NULL, '1', NULL, NULL, NULL, 'vmRAM', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004001002001', '容量', '0007004001002', 1, '0', NULL, '1', 'GB', '单价计价', NULL, 'ramCapacity', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004002', '云硬盘', '0007004', 2, '0', NULL, '1', NULL, NULL, NULL, 'billingVOL', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004002001', '数据盘', '0007004002', 1, '0', NULL, '1', NULL, NULL, NULL, 'volDataDisk', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004002001001', '容量', '0007004002001', 1, '0', NULL, '1', 'GB', '单价计价', NULL, 'dataDiskCapacity', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004002002', '系统盘', '0007004002', 2, '0', NULL, '1', NULL, NULL, NULL, 'volSysDisk', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004002002001', '容量', '0007004002002', 1, '0', NULL, '1', 'GB', '区间计价', NULL, 'sysDiskCapacity', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004003', '云硬盘快照', '0007004', 3, '0', NULL, '1', NULL, NULL, NULL, 'billingShot', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004003001', '快照大小', '0007004003', 1, '0', NULL, '1', NULL, NULL, NULL, 'shotShotSize', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004003001001', '容量', '0007004003001', 1, '0', NULL, '1', 'GB', '单价计价', NULL, 'snapshotSize', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004', '镜像', '0007004', 4, '0', '这里一般是指windows镜像因激活系统需单独收的费用', '1', NULL, NULL, NULL, 'billingImage', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004001', 'Windows 2012 标准版', '0007004004', 1, '0', NULL, '1', NULL, NULL, NULL, 'image2012Standard', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004001001', '个数', '0007004004001', 1, '0', NULL, '1', '个', '单价计价', NULL, '2012StandardCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004002', 'Windows 2012 企业版', '0007004004', 2, '0', NULL, '1', NULL, NULL, NULL, 'image2012Enterprise', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004002001', '个数', '0007004004002', 1, '0', NULL, '1', '个', '单价计价', NULL, '2012EnterpriseCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004003', 'Windows 2012 数据中心版', '0007004004', 3, '0', NULL, '1', NULL, NULL, NULL, 'image2012DC', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004003001', '个数', '0007004004003', 1, '0', NULL, '1', '个', '单价计价', NULL, '2012DCCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004004', 'Windows 2008 标准版', '0007004004', 4, '0', NULL, '1', NULL, NULL, NULL, 'image2008Standard', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004004001', '个数', '0007004004004', 1, '0', NULL, '1', '个', '单价计价', NULL, '2008StandardCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004005', 'Windows 2008 企业版', '0007004004', 5, '0', NULL, '1', NULL, NULL, NULL, 'image2008Enterprise', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004005001', '个数', '0007004004005', 1, '0', NULL, '1', '个', '单价计价', NULL, '2008EnterpriseCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004006', 'Windows 2008 数据中心版', '0007004004', 6, '0', NULL, '1', NULL, NULL, NULL, 'image2008DC', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004004006001', '个数', '0007004004006', 1, '0', NULL, '1', '个', '单价计价', NULL, '2008DCCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004005', '自定义镜像', '0007004', 5, '0', NULL, '1', NULL, NULL, NULL, 'billingCusImage', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004005001', '自定义镜像大小', '0007004005', 1, '0', NULL, '1', NULL, NULL, NULL, 'cusImageCusSize', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004005001001', '容量', '0007004005001', 1, '0', NULL, '1', 'GB', '区间计价', NULL, 'cusImageSize', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004006', '私有网络', '0007004', 6, '0', NULL, '1', NULL, NULL, NULL, 'billingPriNet', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004006001', '带宽', '0007004006', 1, '0', NULL, '1', NULL, NULL, NULL, 'priNetBand', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004006001001', '带宽值', '0007004006001', 1, '0', NULL, '1', 'Mb', '单价计价', NULL, 'bandValue', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004007', '负载均衡', '0007004', 7, '0', NULL, '1', NULL, NULL, NULL, 'billingPool', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004007001', '连接数', '0007004007', 1, '0', NULL, '1', NULL, NULL, NULL, 'poolConn', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004007001001', '个数', '0007004007001', 1, '0', NULL, '1', '个', '区间计价', NULL, 'connCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004008', 'VPN', '0007004', 8, '0', NULL, '1', NULL, NULL, NULL, 'billingVPN', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004008001', 'VPN', '0007004008', 1, '0', NULL, '1', NULL, NULL, NULL, 'vpnVPN', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004008001001', '个数', '0007004008001', 1, '0', NULL, '1', '个', '单价计价', NULL, 'vpnCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004009', '弹性公网IP', '0007004', 9, '0', NULL, '1', NULL, NULL, NULL, 'billingIP', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004009001', '弹性公网IP', '0007004009', 1, '0', NULL, '1', NULL, NULL, NULL, 'ipIP', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004009001001', '个数', '0007004009001', 1, '0', NULL, '1', '个', '单价计价', NULL, 'ipCount', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010', '对象存储', '0007004', 10, '0', NULL, '1', NULL, NULL, NULL, 'billingOBS', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010001', '存储空间', '0007004010', 1, '0', NULL, '1', NULL, NULL, NULL, 'obsSpace', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010001001', '容量', '0007004010001', 1, '0', '这里为传统阶梯计价', '1', 'GB', '阶梯计价', NULL, 'spaceCapacity', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010002', '流量', '0007004010', 2, '0', NULL, '1', NULL, NULL, NULL, 'obsDown', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010002001', '下行流量', '0007004010002', 1, '0', '这里为差值阶梯计价', '1', 'GB', '阶梯计价', NULL, 'downValue', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010003', '请求次数', '0007004010', 3, '0', NULL, '1', NULL, NULL, NULL, 'obsRequest', NULL);
INSERT INTO sys_data_tree  (node_id, node_name, parent_id, sort, is_root, memo, flag, para1, para2, image_path, node_name_en, icon) VALUES ('0007004010003001', '次数', '0007004010003', 1, '0', '这里为差值阶梯计价', '1', '万次', '阶梯计价', NULL, 'requestCount', NULL);

-- 8.updateSQL2016-08-1数据字典维护
-- 购买周期的维护
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017', '云资源包年包月类型', '0007002', '16', '0','1', 'PayBefore');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002', '年付', '0007002017', '2', '0','1', 'yearly');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002001', '1年', '0007002017002', '1', '0','1','12');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002002', '2年', '0007002017002', '2', '0', '1', '24');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002003', '3年', '0007002017002', '3', '0', '1', '36');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017001', '月付', '0007002017', '1', '0', '1', 'monthly');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001001','1个月','0007002017001','1','0','1','1');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001002','2个月','0007002017001','2','0','1','2');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001003','3个月','0007002017001','3','0','1','3');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001004','4个月','0007002017001','4','0','1','4');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001005','5个月','0007002017001','5','0','1','5');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001006','6个月','0007002017001','6','0','1','6');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001007','7个月','0007002017001','7','0','1','7');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001008','8个月','0007002017001','8','0','1','8');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001009','9个月','0007002017001','9','0','1','9');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('00070020170010010','10个月','0007002017001','10','0','1','10');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('00070020170010011','11个月','0007002017001','11','0','1','11');

-- 云主机状态调整
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002004018','删除中','0007002004','18','0','1','SOFT_DELETING');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002004019','恢复中','0007002004','19','0','1','SOFT_RESUME');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002004020','已删除','0007002004','20','0','1','SOFT_DELETED');

update sys_data_tree set node_name = '暂停服务中' where node_id ='0007002004009';
update sys_data_tree set node_name = '暂停服务' where node_id ='0007002004010';


-- 系统图标
update sys_data_tree set icon ='ef-Windows' where node_id='0007002002001';
update sys_data_tree set icon ='ef-CentOS' where node_id='0007002002002001';
update sys_data_tree set icon ='ef-Ubuntu' where node_id='0007002002002002';
update sys_data_tree set icon ='ef-Debian' where node_id='0007002002002004';

-- 云硬盘状态
INSERT INTO `sys_data_tree` VALUES ('0007002005009', '恢复数据中', '0007002005', '2', '0', null, '1', null, null, null, 'RESTORING-BACKUP', null);

-- 云硬盘快照状态
INSERT INTO `sys_data_tree` VALUES ('0007002006005', '回滚中', '0007002006', '3', '0', null, '1', null, null, null, 'RESTORING', null);


-- 9.updateSQL2016-08-01新增后付费资源计费清单表money_chargerecord
DROP TABLE IF EXISTS `money_chargerecord`;

CREATE TABLE `money_chargerecord` (
  `cr_id` varchar(32) NOT NULL COMMENT '主键',
  `cr_ordernumber` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `cr_datacenterid` varchar(100) DEFAULT NULL COMMENT '数据中心ID',
  `cr_cusid` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `cr_resourceid` varchar(100) DEFAULT NULL COMMENT '资源ID',
  `cr_resourcetype` varchar(100) DEFAULT NULL COMMENT '资源类型',
  `cr_factors` mediumtext COMMENT '计费因子',
  `cr_chargefrom` datetime DEFAULT NULL COMMENT '开始计费时间',
  `cr_isvalid` char(1) DEFAULT NULL COMMENT '记录是否生效',
  `cr_resourcestatus` char(1) DEFAULT NULL COMMENT '资源状态（0-正常，1-已删除，2-已变配，3-已放入回收站）',
  `cr_changetime` datetime DEFAULT NULL COMMENT '资源状态变更时间',
  PRIMARY KEY (`cr_id`),
  KEY `idx_crcusid` (`cr_cusid`),
  KEY `idx_crresouceid` (`cr_resourceid`),
  KEY `idx_crchargefrom` (`cr_chargefrom`)
) ENGINE=InnoDB COMMENT='计费清单记录表';

-- 10.updateSQL2016-08-01新增交易记录表
DROP TABLE IF EXISTS `money_record`;
CREATE TABLE `money_record` (
  `mon_id` varchar(32) NOT NULL,
  `serial_number` varchar(20) DEFAULT NULL,
  `mon_time` datetime DEFAULT NULL,
  `income_type` char(1) DEFAULT NULL,
  `mon_ecscremark` varchar(200) DEFAULT NULL,
  `mon_ecmcremark` varchar(200) DEFAULT NULL,
  `mon_money` decimal(16,3) DEFAULT NULL,
  `account_balance` decimal(16,3) DEFAULT NULL,
  `mon_contract` varchar(50) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `pay_state` char(1) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `mon_start` datetime DEFAULT NULL,
  `mon_end` datetime DEFAULT NULL,
  `order_no` varchar(20) DEFAULT NULL,
  `resource_id` varchar(100) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `resource_name` varchar(100) DEFAULT NULL,
  `mon_paymonth` varchar(10) DEFAULT NULL,
  `mon_realpay` decimal(16,3) DEFAULT NULL,
  `mon_configure` text,
  `oper_type` char(1) DEFAULT NULL,
  `resource_type` char(1) DEFAULT NULL,
  `dc_id` varchar(32) DEFAULT NULL,
  `is_success` char(1) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  KEY `idx_moncusid` (`cus_id`) USING BTREE,
  KEY `idx_montime` (`mon_time`) USING BTREE
) ENGINE=InnoDB;

-- 11.updateSQL2016-08-01新增用户余额表
DROP TABLE IF EXISTS `money_account`;
CREATE TABLE `money_account` (
  `mon_id` varchar(32) NOT NULL,
  `mon_money` decimal(16,3) DEFAULT NULL,
  `mon_cusid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`mon_id`),
  KEY `idx_moncusid` (`mon_cusid`)
) ENGINE=InnoDB;

-- 12.updateSQL2016-08-1云主机
-- cloud_vm的字段调整SQL,
ALTER TABLE cloud_vm
ADD COLUMN self_ip  varchar(100) NULL AFTER reserve5,
ADD COLUMN self_subnetid  varchar(100) NULL AFTER self_ip,
ADD COLUMN port_id  varchar(100) NULL AFTER self_subnetid,
ADD COLUMN self_portid  varchar(100) NULL AFTER port_id,
ADD COLUMN pay_type  char(1) NULL AFTER self_portid,
ADD COLUMN charge_state  char(1) NULL AFTER pay_type,
ADD COLUMN is_visable  char(1) NULL AFTER charge_state;

-- 历史数据处理charge_status的值
update cloud_vm set charge_state ='0' where charge_state is null;
-- 历史数据处理is_visable的值
update cloud_vm set is_visable ='1' where is_visable is null;


-- 创建云主机订单表cloud_vmorder
DROP TABLE IF EXISTS `cloudorder_vm`;
CREATE TABLE `cloudorder_vm` (
	`ordervm_id` VARCHAR (100) NOT NULL,
	`vm_id` VARCHAR (100) NULL,
	`order_no` VARCHAR (18) NULL,
	`dc_id` VARCHAR (100) NULL,
	`prj_id` VARCHAR (100) NULL,
	`vm_name` VARCHAR (100) NULL,
	`net_id` VARCHAR (100) NULL,
	`subnet_id` VARCHAR (100) NULL,
	`self_subnetid` VARCHAR (100) NULL,
	`count` INT NULL,
	`os_type` VARCHAR (100) NULL,
	`sys_type` VARCHAR (100) NULL,
	`cpu` INT NULL,
	`ram` INT NULL,
	`disk` INT NULL,
	`image_type` VARCHAR (100) NULL,
	`image_id` VARCHAR (100) NULL,
	`username` VARCHAR (100) NULL,
	`password` VARCHAR (100) NULL,
	`sg_id` VARCHAR (100) NULL,
	`create_orderdate` datetime NULL,
	`create_user` VARCHAR (100) NULL,
	`cus_id` VARCHAR (100) NULL,
	`buy_cycle` INT NULL,
	`price` NUMERIC(16,3) NULL,
	`buy_floatip` CHAR (1) NULL,
	`order_type` CHAR (1) NULL,
	`pay_type` CHAR (1) NULL,
	`order_resources` VARCHAR (2000) NULL,
	PRIMARY KEY (`ordervm_id`)
)ENGINE=InnoDB;

-- 批量创建资源表
DROP TABLE IF EXISTS `cloud_batchresource`;
CREATE TABLE cloud_batchresource (
	resource_id VARCHAR(100) NOT NULL ,
	resource_type VARCHAR(20) NULL,
	order_no VARCHAR(18) NOT NULL 
)ENGINE=InnoDB;

-- 13.updateSQL2016-08-02负载均衡cloud_ldpool添加计费字段
ALTER TABLE cloud_ldpool ADD pay_type CHAR (1) DEFAULT NULL COMMENT '1代表预付费，2代表后付费';
ALTER TABLE cloud_ldpool ADD charge_state CHAR (1) DEFAULT NULL COMMENT '0代表正常，1代表余额不足，2代表已到期，3代表停服务';
ALTER TABLE cloud_ldpool ADD end_time datetime DEFAULT NULL COMMENT '针对预付费的到期时间';
ALTER TABLE cloud_ldpool ADD is_visible CHAR(1) DEFAULT NULL COMMENT '是否展示资源给用户，1展示，0不展示';

-- 14.updateSQL2016-08-02工单与弹性公网ip
ALTER TABLE workorder ADD COLUMN apply_username VARCHAR (32);

ALTER TABLE workorder ADD COLUMN head_username VARCHAR (50);

ALTER TABLE workorder ADD COLUMN cre_username VARCHAR (50);

ALTER TABLE work_opinion ADD COLUMN cre_username VARCHAR (50);

ALTER TABLE work_opinion ADD COLUMN reply_username VARCHAR (50);

UPDATE workorder wo
LEFT JOIN sys_selfuser u ON u.user_id = wo.apply_user
LEFT JOIN ecmc_sys_user eu ON eu.id = wo.head_user
LEFT JOIN sys_selfuser u1 ON u1.user_id = wo.cre_user
SET wo.apply_username = IFNULL(
	u.user_account,
	wo.apply_user
),
 wo.head_username = eu.`name`,
 wo.cre_username = IFNULL(
	u1.user_account,
	(
		SELECT
			eu1.`name`
		FROM
			ecmc_sys_user eu1
		WHERE
			eu1.id = wo.cre_user
	)
);

UPDATE work_opinion wo
LEFT JOIN sys_selfuser u ON u.user_id = wo.cre_user_id
LEFT JOIN ecmc_sys_user eu ON eu.id = wo.reply_user
SET wo.cre_username = IFNULL(
	u.user_account,
	(
		SELECT
			eu1.`name`
		FROM
			ecmc_sys_user eu1
		WHERE
			eu1.id = wo.cre_user_id
	)
),
 wo.reply_username = IFNULL(
	eu.`name`,
	(
		SELECT
			u1.user_account
		FROM
			sys_selfuser u1
		WHERE
			u1.user_id = wo.reply_user
	)
);
/*
 *弹性公网ip
 */
ALTER TABLE cloud_floatip ADD COLUMN end_time DATETIME;
ALTER TABLE cloud_floatip ADD COLUMN charge_state char(1);
ALTER TABLE cloud_floatip ADD COLUMN pay_type char(1);
ALTER TABLE cloud_floatip ADD COLUMN flo_status char(1);

-- 15.updateSQL2016-08-02路由cloud_route添加rate_old字段
ALTER TABLE cloud_route 
ADD rate_old INT (9) DEFAULT NULL COMMENT '存储带宽限制前的值';

-- 16.updateSQL2016-08-02私有网络cloud_network添加计费字段
ALTER TABLE cloud_network ADD pay_type CHAR (1) DEFAULT NULL COMMENT '1代表预付费，2代表后付费';
ALTER TABLE cloud_network ADD charge_state CHAR (1) DEFAULT NULL COMMENT '0代表正常，1代表余额不足，2代表已到期，3代表停服务';
ALTER TABLE cloud_network ADD end_time datetime DEFAULT NULL COMMENT '针对预付费的到期时间';
ALTER TABLE cloud_network ADD is_visible CHAR (1) DEFAULT NULL;

-- 17.updateSQL2016-08-02添加弹性公网IP订单cloudorder_floatip
DROP TABLE IF EXISTS `cloudorder_floatip`;
CREATE TABLE `cloudorder_floatip` (
  `cof_id` varchar(32) NOT NULL,
  `flo_id` varchar(2000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(32) DEFAULT NULL,
  `dc_id` varchar(32) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `cre_user` varchar(32) DEFAULT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cof_id`)
)ENGINE=InnoDB;

-- 18.updateSQL2016-08-02添加负载均衡订单cloudorder_ldpool
DROP TABLE IF EXISTS `cloudorder_ldpool`;
CREATE TABLE `cloudorder_ldpool` (
  `orderpool_id` varchar(32) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) NOT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `pool_id` varchar(100) DEFAULT NULL,
  `pool_name` varchar(100) DEFAULT NULL,
  `connection_limit` decimal(11,0) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `pool_description` varchar(255) DEFAULT NULL,
  `pool_provider` varchar(255) DEFAULT NULL,
  `subnet_id` varchar(200) DEFAULT NULL,
  `pool_protocol` varchar(32) DEFAULT NULL,
  `ld_method` varchar(32) DEFAULT NULL,
  `vip_port` decimal(11,0) DEFAULT NULL,
  `vip_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderpool_id`)
)ENGINE=InnoDB;

-- 19.updateSQL2016-08-02添加私有网络订单cloudorder_network
DROP TABLE IF EXISTS `cloudorder_network`;
CREATE TABLE `cloudorder_network` (
  `ordernetwork_id` varchar(32) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) NOT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `net_id` varchar(100) DEFAULT NULL,
  `net_name` varchar(100) DEFAULT NULL,
  `rate` int(9) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `cus_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`ordernetwork_id`)
)ENGINE=InnoDB;


-- 20.updateSQL2016-08-02新增端口映射cloud_portmapping
DROP TABLE IF EXISTS `cloud_portmapping`;
CREATE TABLE `cloud_portmapping` (
  `pm_id` varchar(100) NOT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  `resource_id` varchar(100) DEFAULT NULL,
  `resource_ip` varchar(50) DEFAULT NULL,
  `resource_port` varchar(10) DEFAULT NULL,
  `destiny_id` varchar(100) DEFAULT NULL,
  `destiny_ip` varchar(50) DEFAULT NULL,
  `destiny_port` varchar(10) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pm_id`)
)ENGINE=InnoDB;

-- 21.updateSQL2016-08-02新增cloud_ikepolicy
DROP TABLE IF EXISTS `cloud_vpnikepolicy`;
CREATE TABLE `cloud_vpnikepolicy` (
  `ike_id` varchar(100) NOT NULL,
  `ike_name` varchar(50) DEFAULT NULL,
  `ike_version` varchar(10) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `auth_algorithm` varchar(10) DEFAULT NULL,
  `encryption_algorithm` varchar(10) DEFAULT NULL,
  `negotiation_mode` varchar(10) DEFAULT NULL,
  `lifetime_value` int(9) DEFAULT NULL,
  `dh_algorithm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ike_id`)
)ENGINE=InnoDB;

-- 22.updateSQL2016-08-02新增cloud_vpnconn
DROP TABLE IF EXISTS `cloud_vpnconn`;
CREATE TABLE `cloud_vpnconn` (
  `vpn_id` varchar(100) NOT NULL,
  `vpn_name` varchar(50) DEFAULT NULL,
  `vpn_status` varchar(50) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `peer_address` varchar(100) DEFAULT NULL,
  `peer_id` varchar(200) DEFAULT NULL,
  `peer_cidrs` varchar(2000) DEFAULT NULL,
  `psk_key` varchar(80) DEFAULT NULL,
  `mtu` int(9) DEFAULT NULL,
  `dpd_action` varchar(50) DEFAULT NULL,
  `dpd_interval` int(9) DEFAULT NULL,
  `dpd_timeout` int(9) DEFAULT NULL,
  `initiator` varchar(20) DEFAULT NULL,
  `vpnservice_id` varchar(100) DEFAULT NULL,
  `ipsec_id` varchar(100) DEFAULT NULL,
  `ike_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `charge_state` char(1) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `is_visible` char(1) DEFAULT NULL,
  PRIMARY KEY (`vpn_id`)
)ENGINE=InnoDB;

-- 23.updateSQL2016-08-02新增cloud_vpnipsecpolicy
DROP TABLE IF EXISTS `cloud_vpnipsecpolicy`;
CREATE TABLE `cloud_vpnipsecpolicy` (
  `ipsec_id` varchar(100) NOT NULL,
  `ipsec_name` varchar(50) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `transform_protocol` varchar(10) DEFAULT NULL,
  `auth_algorithm` varchar(10) DEFAULT NULL,
  `encapsulation_mode` varchar(10) DEFAULT NULL,
  `encryption_algorithm` varchar(10) DEFAULT NULL,
  `lifetime_value` int(9) DEFAULT NULL,
  `dh_algorithm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ipsec_id`)
)ENGINE=InnoDB;

-- 24.updateSQL2016-08-02新增cloud_vpnservice
DROP TABLE IF EXISTS `cloud_vpnservice`;
CREATE TABLE `cloud_vpnservice` (
  `vpnservice_id` varchar(100) NOT NULL,
  `vpnservice_name` varchar(100) DEFAULT NULL,
  `vpn_status` varchar(50) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `network_id` varchar(100) DEFAULT NULL,
  `route_id` varchar(100) DEFAULT NULL,
  `subnet_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vpnservice_id`)
)ENGINE=InnoDB;

-- 25.updateSQL2016-08-02新增cloudorder_snapshot表
DROP TABLE IF EXISTS `cloudorder_snapshot`;
CREATE TABLE `cloudorder_snapshot` (
  `ordersnap_id` varchar(100) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `vol_id` varchar(100) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `snap_size` decimal(20,0) DEFAULT NULL,
  `snap_name` varchar(100) DEFAULT NULL,
  `snap_description` varchar(1000) DEFAULT NULL,
  `snap_type` char(1) DEFAULT NULL,
  `order_resources` varchar(2000) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_orderdate` datetime DEFAULT NULL,
  PRIMARY KEY (`ordersnap_id`)
) ENGINE=InnoDB;

-- 26.updateSQL2016-08-02新增cloudorder_volume
DROP TABLE IF EXISTS `cloudorder_volume`;
CREATE TABLE `cloudorder_volume` (
  `ordervol_id` varchar(100) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `vol_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `disk_from` varchar(50) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `vol_type` char(1) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `buy_cycle` int(10) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `from_snapid` varchar(100) DEFAULT NULL,
  `vol_size` decimal(20,0) DEFAULT NULL,
  `vol_number` decimal(10,0) DEFAULT NULL,
  `vol_name` varchar(100) DEFAULT NULL,
  `vol_description` varchar(1000) DEFAULT NULL,
  `order_resources` varchar(2000) DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  `create_orderdate` datetime DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ordervol_id`)
) ENGINE=InnoDB;

-- 27.updateSQL2016-08-02新增cloudorder_vpn
DROP TABLE IF EXISTS `cloudorder_vpn`;
CREATE TABLE `cloudorder_vpn` (
  `ordervpn_id` varchar(32) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `vpn_id` varchar(100) DEFAULT NULL,
  `vpnservice_id` varchar(100) DEFAULT NULL,
  `ike_id` varchar(100) DEFAULT NULL,
  `ipsec_id` varchar(100) DEFAULT NULL,
  `vpn_name` varchar(50) DEFAULT NULL,
  `route_id` varchar(100) DEFAULT NULL,
  `subnet_id` varchar(100) DEFAULT NULL,
  `peer_address` varchar(100) DEFAULT NULL,
  `peer_id` varchar(200) DEFAULT NULL,
  `peer_cidrs` varchar(2000) DEFAULT NULL,
  `mtu` int(11) DEFAULT NULL,
  `dpd_action` varchar(50) DEFAULT NULL,
  `dpd_interval` int(11) DEFAULT NULL,
  `dpd_timeout` int(11) DEFAULT NULL,
  `psk_key` varchar(80) DEFAULT NULL,
  `initiator` varchar(20) DEFAULT NULL,
  `ike_encryption` varchar(10) DEFAULT NULL,
  `ike_version` varchar(10) DEFAULT NULL,
  `ike_auth` varchar(10) DEFAULT NULL,
  `ike_negotiation` varchar(10) DEFAULT NULL,
  `ike_lifetime` int(11) DEFAULT NULL,
  `ike_dh` varchar(10) DEFAULT NULL,
  `ipsec_encryption` varchar(10) DEFAULT NULL,
  `ipsec_protocol` varchar(10) DEFAULT NULL,
  `ipsec_auth` varchar(10) DEFAULT NULL,
  `ipsec_encapsulation` varchar(10) DEFAULT NULL,
  `ipsec_lifetime` int(11) DEFAULT NULL,
  `ipsec_dh` varchar(10) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  `network_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ordervpn_id`)
)ENGINE=InnoDB;

-- 28.updateSQL2016-08-02修改弹性公网IPcloud_floatip
ALTER TABLE cloud_floatip ADD is_visible char(1) default null;

-- 29.updateSQL2016-08-02修改云硬盘表
-- 云硬盘表增加字段
ALTER TABLE cloud_volume ADD pay_type CHAR(1);
ALTER TABLE cloud_volume ADD end_time datetime;
ALTER TABLE cloud_volume ADD charge_state CHAR(1);
ALTER TABLE cloud_volume ADD is_visable CHAR(1);

-- 30.updateSQL2016-08-02修改云硬盘快照表
-- 云硬盘快照表增加字段
ALTER TABLE cloud_disksnapshot CHANGE reserve1 pay_type CHAR (1);

ALTER TABLE cloud_disksnapshot CHANGE reserve2 charge_state CHAR (1);

ALTER TABLE cloud_disksnapshot CHANGE reserve3 is_deleted CHAR (1);

ALTER TABLE cloud_disksnapshot CHANGE reserve4 delete_time datetime;

ALTER TABLE cloud_disksnapshot CHANGE reserve5 delete_user CHAR (50);

ALTER TABLE cloud_disksnapshot ADD snap_type CHAR (1);

ALTER TABLE cloud_disksnapshot ADD is_visable CHAR (1);

-- 31.updateSQL2016-08-02子网cloud_subnetwork添加子网类型字段
ALTER TABLE cloud_subnetwork 
ADD subnet_type CHAR (1) DEFAULT NULL COMMENT '0代表自管子网，1代表受管子网';

-- 32.updateSQL2016-08-04安全组规则，消息变更
alter table cloud_grouprule add COLUMN icmp VARCHAR(20) DEFAULT '--';

alter table news_sendinfo add COLUMN is_syssend CHAR(1) DEFAULT '0';

alter table news_sendinfo  modify column cus_id mediumtext; 

-- 33.updateSQL2016-08-08增加后付费资源计费清单表资源名称列
ALTER TABLE `money_chargerecord` ADD COLUMN `cr_resourcename` VARCHAR(100) NULL COMMENT '资源名称，仅用于删除资源发送消息中使用。' AFTER `cr_changetime`;

-- 34.updateSQL2016-08-08增加项目表云硬盘大小和云硬盘快照大小字段
ALTER TABLE `cloud_project`
ADD COLUMN `snapshot_size`  decimal(10,0) NULL AFTER `memory`;


/*
   云硬盘快照大小=0
*/
UPDATE cloud_project a SET a.snapshot_size=0;


ALTER TABLE `cloud_project`
ADD COLUMN `vip_count`  decimal(10,0) NULL COMMENT '负载均衡虚拟IP数量' AFTER `snapshot_size`,
ADD COLUMN `portmapping_count`  decimal(10,0) NULL COMMENT '端口映射数量' AFTER `vip_count`;

/*
  负载均衡虚拟IP数量和端口映射数量，端口映射数量=0，负载均衡虚拟IP数量=0
*/
UPDATE cloud_project a SET a.vip_count=0,a.portmapping_count=0;


-- 35.updateSQL2016-08-08增加项目表增加自定义镜像数量字段
ALTER TABLE `cloud_project`
ADD COLUMN `image_count`  decimal(10,0) default 0 AFTER `portmapping_count` ;


/*
   自定义镜像数量=0
*/
UPDATE cloud_project a SET a.snapshot_size=0;

-- 36.updateSQL2016-08-18工单配额表新增字段
-- 段彬彬 2016.08.18
ALTER TABLE `work_quota`
ADD COLUMN `quota_disksize`  int(10) default 0 NULL COMMENT '云硬盘容量配额（GB）',
ADD COLUMN `quota_shotsize`  int(10) default 0 NULL COMMENT '云硬盘快照容量配额（GB）',
ADD COLUMN `quota_portmapping`  int(10) default 0 NULL COMMENT '端口映射' ;

-- 37.updateSQL2016-08-25防火墙和公告数据库变更
alter table notice_info modify column notice_url varchar(1024) ;
alter table notice_info modify column memo varchar(200) ;
ALTER TABLE notice_info ADD COLUMN `title` varchar(100) NULL AFTER `notice_url`;
ALTER TABLE notice_info ADD COLUMN `content` varchar(2000) NULL AFTER `title`;

ALTER TABLE `cloud_fwrule` CHANGE reserve1 fwr_priority int(11);

-- 38.updateSQL2016-08-25镜像表新增最大支持CPU和内存字段
-- 段彬彬 2016.08.25
ALTER TABLE `cloud_image`
ADD COLUMN `max_cpu`  int(5) NULL COMMENT '最大支持CPU（核）',
ADD COLUMN `max_ram`  int(10) NULL COMMENT '最大支持内存（GB）';


-- 39.updateSQL2016-08-29新增支付相关表
DROP TABLE IF EXISTS `pay_orderrecord`;
CREATE TABLE `pay_orderrecord` (
  `trade_no` varchar(18) DEFAULT NULL,
  `order_no` varchar(18) DEFAULT NULL
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `pay_record`
-- ----------------------------
DROP TABLE IF EXISTS `pay_record`;
CREATE TABLE `pay_record` (
  `pay_id` varchar(32) NOT NULL DEFAULT '',
  `third_id` varchar(50) DEFAULT NULL,
  `pay_type` char(1) NOT NULL COMMENT '0:余额支付\r\n1:支付宝',
  `trade_type` char(1) NOT NULL COMMENT '1:订单支付 2:充值',
  `trade_no` varchar(18) NOT NULL,
  `pay_amount` decimal(16,3) NOT NULL,
  `pay_status` char(1) NOT NULL COMMENT '0:支付中 1:支付成功 2: 支付失败',
  `create_time` datetime NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `third_result` varchar(1000) DEFAULT NULL,
  `prod_name` varchar(256) DEFAULT NULL,
  `prod_desc` varchar(1000) DEFAULT NULL,
  `cus_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `pay_refundrecord`
-- ----------------------------
DROP TABLE IF EXISTS `pay_refundrecord`;
CREATE TABLE `pay_refundrecord` (
  `refund_id` varchar(32) NOT NULL DEFAULT '',
  `refund_amount` decimal(16,3) NOT NULL,
  `refund_type` char(1) NOT NULL COMMENT '0: 余额退款 1: 支付宝退款',
  `batch_no` varchar(64) DEFAULT NULL,
  `batch_num` int(11) DEFAULT NULL,
  `detail_data` varchar(4000) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `finish_time` datetime DEFAULT NULL,
  `refund_status` char(1) NOT NULL COMMENT '0:退款中 1: 退款成功 2: 退款失败',
  `order_no` varchar(18) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB;

-- 40.updateSQL2016-08-30客户信息表新增字段sys_selfcustomer
ALTER TABLE `sys_selfcustomer`
ADD COLUMN `credit_lines` decimal(16,3) NOT NULL DEFAULT '0.000' COMMENT '信用额度',
ADD COLUMN `expire_keep_time` int(11) NOT NULL DEFAULT '72' COMMENT '到期或欠费资源保留时长',
ADD COLUMN `over_credit_time` datetime DEFAULT NULL COMMENT '欠费达信用额度时间';

-- 41.updateSQL2016-08-30新建订单信息表order_info
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` varchar(32) NOT NULL COMMENT '主键UUID',
  `order_no` varchar(18) NOT NULL COMMENT '订单编号（订单标识号+日期+当前时间平台交易次数8位）',
  `order_type` char(1) NOT NULL COMMENT '订单类型（0-新购；1-续费；2-升级）',
  `user_id` varchar(32) NOT NULL COMMENT '提交订单用户ID',
  `cus_id` varchar(32) NOT NULL COMMENT '客户ID',
  `prod_name` varchar(200) NOT NULL COMMENT '产品名称',
  `prod_count` int(11) NOT NULL DEFAULT '0' COMMENT '产品数量',
  `prod_config` varchar(2000) DEFAULT NULL COMMENT '产品配置',
  `create_time` datetime NOT NULL COMMENT '订单生成时间',
  `complete_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `canceled_time` datetime DEFAULT NULL COMMENT '取消时间',
  `audit_pass_time` datetime DEFAULT NULL COMMENT '审核通过时间（目前无审核流程，该字段暂时无用）',
  `dc_id` varchar(32) DEFAULT NULL COMMENT '数据中心ID',
  `pay_type` char(1) NOT NULL COMMENT '付款类型（1-预付费；2-后付费）',
  `buy_cycle` int(11) DEFAULT NULL COMMENT '购买周期',
  `pay_expire_time` datetime DEFAULT NULL COMMENT '支付过期时间（待支付状态24小时）',
  `unit_price` decimal(16,3) DEFAULT '0.000' COMMENT '单价',
  `audit_flag` char(1) DEFAULT NULL COMMENT '审核标识（目前无审核流程，该字段暂时无用）',
  `billing_cycle` char(1) DEFAULT NULL COMMENT '计费周期（0-小时；1-天；2-其他）',
  `order_state` char(1) NOT NULL COMMENT '订单状态（1-待支付；2-资源创建中；3-资源创建失败-已取消；4-已完成；5-已取消）',
  `resource_type` char(1) NOT NULL COMMENT '资源类型（0-云主机；1-云硬盘；2-云硬盘快照；3-私有网络VPC；4-负载均衡；5-弹性公网IP；6-对象存储；7-VPN）',
  `payment_amount` decimal(16,3) DEFAULT '0.000' COMMENT '付费总金额',
  `account_payment` decimal(16,3) DEFAULT '0.000' COMMENT '账户支付金额',
  `third_part_payment` decimal(16,3) DEFAULT '0.000' COMMENT '第三方支付金额',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `third_part_type` char(1) DEFAULT NULL COMMENT '第三方支付类型（0-支付宝）',
  `version` int(11) NOT NULL DEFAULT '0' COMMENT '乐观锁标识字段',
  `resource_begin_time` datetime DEFAULT NULL COMMENT '资源起始时间',
  `resource_expire_time` datetime DEFAULT NULL COMMENT '资源到期时间',
  `params` mediumtext COMMENT '业务参数',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB COMMENT='订单信息表';

-- 42.updateSQL2016-08-30新建订单状态变更记录表order_state_record
DROP TABLE IF EXISTS `order_state_record`;
CREATE TABLE `order_state_record` (
  `record_id` varchar(32) NOT NULL COMMENT '主键UUID',
  `order_no` varchar(18) NOT NULL COMMENT '订单编号',
  `origin_state` char(1) DEFAULT NULL COMMENT '原始状态（1-待支付；2-资源创建中；3-资源创建失败-已取消；4-已完成；5-已取消）',
  `to_state` char(1) NOT NULL COMMENT '变更状态（1-待支付；2-资源创建中；3-资源创建失败-已取消；4-已完成；5-已取消）',
  `change_time` datetime NOT NULL COMMENT '变更时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB COMMENT='订单状态变更表';

-- 43.updateSQL2016-08-30新建配额模板表quota_template
DROP TABLE IF EXISTS `quota_template`;
CREATE TABLE `quota_template` (
  `qt_id` varchar(32) NOT NULL COMMENT '主键ID',
  `qt_name` varchar(64) NOT NULL COMMENT '模板名称',
  `cpu_count` int(11) NOT NULL DEFAULT '0' COMMENT 'CPU数量',
  `memory` int(11) NOT NULL DEFAULT '0' COMMENT '内存数量',
  `host_count` int(11) NOT NULL DEFAULT '0' COMMENT '云主机数量',
  `disk_count` int(11) NOT NULL DEFAULT '0' COMMENT '云硬盘数量',
  `disk_snapshot` int(11) NOT NULL DEFAULT '0' COMMENT '云硬盘快照数量',
  `count_band` int(11) NOT NULL DEFAULT '0' COMMENT '带宽大小',
  `net_work` int(11) NOT NULL DEFAULT '0' COMMENT '网络数量',
  `subnet_count` int(11) NOT NULL DEFAULT '0' COMMENT '子网数量',
  `outerip` int(11) NOT NULL DEFAULT '0' COMMENT '公网IP数量',
  `safe_group` int(11) NOT NULL DEFAULT '0' COMMENT '安全组数量',
  `quota_pool` int(11) NOT NULL DEFAULT '0' COMMENT '负载均衡数量',
  `sms_count` int(11) NOT NULL DEFAULT '0' COMMENT '报警短信数量',
  `qt_desc` varchar(2000) DEFAULT '' COMMENT '描述',
  `disk_capacity` int(11) NOT NULL COMMENT '云硬盘大小',
  `snapshot_size` int(11) NOT NULL COMMENT '云快照大小',
  `count_vpn` int(11) NOT NULL COMMENT 'VPN数量',
  `portmapping_count` int(11) NOT NULL COMMENT '端口映射数量',
  `image_count` int(11) NOT NULL COMMENT '镜像数量',
  PRIMARY KEY (`qt_id`)
) ENGINE=InnoDB;

-- 44.updateSQL2016-09-01新增dns字段
ALTER TABLE `dc_datacenter`
ADD COLUMN `dc_dns`  VARCHAR(100) DEFAULT NULL COMMENT 'DNS地址';

-- 45.updateSQL2016-09-01用户中心1.0新加权限
-- 所有语句请从上到下顺序执行，并注意按照注释语句操作！！！


-- 修改原有的名称变化
UPDATE sys_selfpower SET power_name = '标签管理' where power_name = '业务管理';
UPDATE sys_selfpower SET power_name = '基本信息' where power_name = '账号管理';
UPDATE sys_selfpower SET power_name = '公司信息' where power_name = '组织信息';

-- 调整申请配额权限位置开始---------------------
-- 基本信息下新增一个配额信息二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES( 
    '3bc9a5dc6f5811e6aa9a001a4a7ae4d4',
    '配额信息',
    '',
    '',
    151300,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '基本信息' AND ss.parent_id = ''),
    '配额信息（原总览页下面）',
    ''
);

UPDATE sys_selfpower SET parent_id = '3bc9a5dc6f5811e6aa9a001a4a7ae4d4' , power_sort = 151310 where power_name = '申请配额';
-- 调整申请配额权限位置结束---------------------

-- 删除原业务参数配置权限开始---------------------
DELETE FROM sys_selfrolepower WHERE power_id in (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.parent_id = (SELECT par.power_id FROM sys_selfpower par WHERE par.power_name = '业务参数配置'));

-- 此DELETE语句使用的parent_id为紧挨的上一句查询出的power_id
-- DELETE FROM sys_selfpower WHERE parent_id in (SELECT power_id FROM sys_selfpower WHERE power_name = '业务参数配置');

DELETE FROM sys_selfpower WHERE power_name ='业务参数配置';

DELETE FROM sys_selfpower WHERE power_route in('syssetup_mng','syssetup_view');
-- 删除原业务参数配置权限结束---------------------


-- 新增订单部分权限开始---------------------------
-- 新增一级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
    REPLACE (uuid(), '-', ''),
    '订单管理','','',
    250000,
    '',
    '订单管理',
    ''
);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
    REPLACE (uuid(), '-', ''),
    '订单管理',
    '',
    '',
    251000,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '订单管理' AND ss.parent_id = ''),
    '订单管理',
    ''
  );
-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看订单',
    NULL,
    'order_list',
    251010,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
    '查看订单',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查询订单',
    NULL,
    'order_search',
    251011,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
    '查询订单',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '重新下单',
    NULL,
    'order_reorder',
    251012,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
    '重新下单',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '取消订单',
    NULL,
    'order_cancel',
    251013,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
    '取消订单',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '支付订单',
    NULL,
    'order_pay',
    251014,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
    '支付订单',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看资源',
    NULL,
    'order_resource',
    251015,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
    '查看资源',
    NULL
  );
-- 新增订单部分权限结束---------------------------

-- 新增回收站部分权限开始---------------------------
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
    REPLACE (uuid(), '-', ''),
    '回收站','','',
    260000,
    '',
    '回收站',
    ''
);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
    REPLACE (uuid(), '-', ''),
    '云主机',
    '',
    '',
    261000,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '回收站' AND ss.parent_id = ''),
    '回收站里云主机模块',
    ''
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
    REPLACE (uuid(), '-', ''),
    '云硬盘',
    '',
    '',
    261100,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '回收站' AND ss.parent_id = ''),
    '回收站里云硬盘模块',
    ''
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
    REPLACE (uuid(), '-', ''),
    '云硬盘快照',
    '',
    '',
    261200,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '回收站' AND ss.parent_id = ''),
    '回收站里云硬盘快照模块',
    ''
  );
-- 新增三级目录功能权限
-- 云主机
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'recycle_host_view',
    261010,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 261000),
    '回收站查看云主机功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '恢复',
    NULL,
    'recycle_host_reset',
    261011,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 261000),
    '回收站恢复云主机功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除',
    NULL,
    'recycle_host_drop',
    261012,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 261000),
    '回收站删除云主机功能',
    NULL
  );
-- 云硬盘
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'recycle_disk_view',
    261110,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 261100),
    '回收站查看云硬盘功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '恢复',
    NULL,
    'recycle_disk_reset',
    261111,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 261100),
    '回收站恢复云硬盘功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除',
    NULL,
    'recycle_disk_drop',
    261112,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 261100),
    '回收站删除云硬盘功能',
    NULL
  );
-- 云硬盘快照
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'recycle_snap_view',
    261210,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 261200),
    '回收站查看云硬盘快照功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '恢复',
    NULL,
    'recycle_snap_reset',
    261211,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 261200),
    '回收站恢复云硬盘快照功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除',
    NULL,
    'recycle_snap_drop',
    261212,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 261200),
    '回收站删除云硬盘快照功能',
    NULL
  );
-- 新增回收站部分权限结束---------------------------

-- 新增云主机部分权限开始---------------------------

INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '修改子网',
    'host_moreIp',
    111030,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 111000),
    '云主机修改子网'
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '续费',
    NULL,
    'host_renew',
    111029,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 111000),
    '云主机续费功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '续费',
    NULL,
    'disk_renew',
    111118,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 111100),
    '云硬盘续费功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '回滚云硬盘',
    NULL,
    'snap_rollback',
    111215,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 111200),
    '云硬盘快照回滚云硬盘功能',
    NULL
  );
-- 新增云主机部分权限结束---------------------------

-- 新增安全部分权限开始---------------------------
-- 安全组
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '添加规则',
    NULL,
    'group_rule_add',
    131116,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
    '安全组添加规则功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除规则',
    NULL,
    'group_rule_delete',
    131117,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
    '安全组删除规则功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '添加云主机',
    NULL,
    'group_host_add',
    131118,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
    '安全组添加云主机功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '移除规则',
    NULL,
    'group_host_delete',
    131119,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
    '安全组移除规则功能',
    NULL
  );
-- 防火墙
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '禁用规则',
    NULL,
    'firewallrule_enabled',
    131015,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
    '防火墙禁用规则功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '调整优先级',
    NULL,
    'firewall_policy',
    131016,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
    '防火墙调整优先级功能',
    NULL
  );
-- 新增安全部分权限结束---------------------------


-- 新增网络部分权限开始---------------------------
-- 私有网络
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '续费',
    NULL,
    'net_renew',
    121017,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
    '私有网络续费功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看端口映射',
    NULL,
    'net_port_view',
    121018,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
    '私有网络查看端口映射功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '创建端口映射',
    NULL,
    'net_port_add',
    121019,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
    '私有网络创建端口映射功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '编辑端口映射',
    NULL,
    'net_port_edit',
    121020,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
    '私有网络编辑端口映射功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除端口映射',
    NULL,
    'net_port_drop',
    121021,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
    '私有网络删除端口映射功能',
    NULL
  );
-- 子网
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '绑定、解绑路由',
    NULL,
    'subnet_route',
    121115,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '子网' AND ss.parent_id <> '' AND ss.power_sort = 121100),
    '受管子网绑定、解绑路由',
    NULL
  );
-- 公网IP
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '续费',
    NULL,
    'float_renew',
    121416,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '公网IP' AND ss.parent_id <> '' AND ss.power_sort = 121400),
    '弹性公网IP续费功能',
    NULL
  );
-- 负载均衡
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '续费',
    NULL,
    'load_renew',
    121325,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '负载均衡' AND ss.parent_id <> '' AND ss.power_sort = 121300),
    '负载均衡续费功能',
    NULL
  );
-- VPN
-- 二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    'VPN',
    '',
    '',
    121500,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '网络' AND ss.parent_id = ''),
    'VPN',
    ''
  );
-- 添加权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'vpn_view',
    121510,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
    'VPN查看功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '创建',
    NULL,
    'vpn_add',
    121511,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
    'VPN创建功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '编辑',
    NULL,
    'vpn_edit',
    121512,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
    'VPN编辑功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除',
    NULL,
    'vpn_drop',
    121513,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
    'VPN删除功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '续费',
    NULL,
    'vpn_renew',
    121514,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
    'VPN续费功能',
    NULL
  );
-- 新增网络部分权限结束---------------------------

-- 新增费用中心部分权限开始---------------------------
-- 新增一级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '费用中心',
    '',
    '',
    240000,
    '',
    '费用中心',
    ''
  );
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '账户总览',
    '',
    '',
    241000,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '费用中心' AND ss.parent_id = ''),
    '账户总览',
    ''
  );
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '费用报表',
    '',
    '',
    241100,
    (SELECT ss.power_id FROM  sys_selfpower ss  WHERE ss.power_name = '费用中心' AND ss.parent_id = ''),
    '费用报表',
    ''
  );
-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'account_view',
    241010,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '账户总览'),
    '账户总览查看',
    NULL
  );

INSERT INTO `sys_selfpower` (
  `power_id`,
  `power_name`,
  `power_url`,
  `power_route`,
  `power_sort`,
  `parent_id`,
  `power_desc`,
  `power_icon`
)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'report_view',
    241110,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '费用报表'),
    '费用报表查看',
    NULL
  );

INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route IN ('account_view','report_view')
);
-- 新增费用中心部分权限结束---------------------------


-- 增加权限-角色关系
INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route 
  IN 
    ('order_list','order_search','order_reorder','order_cancel','order_pay','order_resource',
      'recycle_host_view','recycle_host_reset','recycle_host_drop','recycle_disk_view','recycle_disk_reset',
      'recycle_disk_drop','recycle_snap_view','recycle_snap_reset','recycle_snap_drop','snap_rollback','group_rule_add',
      'group_rule_delete','group_host_add','group_host_delete','firewallrule_enabled','firewall_policy','net_port_view',
      'net_port_add','net_port_edit','net_port_drop','subnet_route','vpn_renew','vpn_add',
      'vpn_edit','vpn_drop',
      'host_renew','disk_renew','net_renew','float_renew','load_renew'
    )
);

  INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    (
      r.role_name = '超级管理员'
      OR r.role_name = '管理员'
      OR r.role_name = '普通用户'
    )
  AND p.power_route IN (
    'host_moreIp','vpn_view'
  )
);

-- 跟产品确认后修改--------------------------------------------------------------------
UPDATE sys_selfpower SET power_name = '删除防火墙'  where power_route = 'firewall_drop';
UPDATE sys_selfpower SET power_name = '删除安全组'  where power_route = 'group_drop';

-- 删除安全组里面的管理规则权限
DELETE FROM sys_selfrolepower WHERE power_id = (SELECT ss.power_id from sys_selfpower ss WHERE ss.power_name ='管理规则');

DELETE FROM sys_selfpower WHERE power_name ='管理规则';

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '导出',
    NULL,
    'account_excel',
    241011,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '账户总览'),
    '账户总览导出',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '导出',
    NULL,
    'report_excel',
    241111,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '费用报表'),
    '费用报表导出',
    NULL
  );
-- 防火墙
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '添加规则',
    NULL,
    'firewallrule_add',
    131017,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
    '防火墙添加规则功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '删除规则',
    NULL,
    'firewallrule_drop',
    131018,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
    '防火墙删除规则功能',
    NULL
  );

-- 增加权限-角色关系
INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route 
  IN 
    ('account_excel','report_excel','firewallrule_add','firewallrule_drop')
);

UPDATE sys_selfpower SET power_name = '禁用/启用规则'  where power_route = 'firewallrule_enabled';


-- 09.06补充云硬盘扩容权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '扩容',
    NULL,
    'disk_setup',
    111119,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 111100),
    '云硬盘扩容功能',
    NULL
  );
INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route 
  IN 
    ('disk_setup')
);

-- 46.updateSql2016-09-08工单数据字典添加六种工单类别
INSERT INTO `sys_data_tree` VALUES ('0007001002010', '对象存储', '0007001002', '7', '0', null, '1', null, null, null, null, null);
INSERT INTO `sys_data_tree` VALUES ('0007001002011', '镜像', '0007001002', '4', '0', null, '1', null, null, null, null, null);
INSERT INTO `sys_data_tree` VALUES ('0007001002012', '安全', '0007001002', '8', '0', null, '1', null, null, null, null, null);
INSERT INTO `sys_data_tree` VALUES ('0007001002013', '网络', '0007001002', '5', '0', null, '1', null, null, null, null, null);
INSERT INTO `sys_data_tree` VALUES ('0007001002014', '负载均衡', '0007001002', '6', '0', null, '1', null, null, null, null, null);
INSERT INTO `sys_data_tree` VALUES ('0007001002015', '配额类问题咨询', '0007001002', '15', '0', null, '1', null, null, null, null, null);

--  47.updateSQL2016-09-08添加三条vpn状态记录sys_data_tree
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018','VPN状态','0007002',17,'0',NULL,'1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018001','创建中','0007002018',1,'0',NULL,'1',NULL,NULL,NULL,'PENDING_CREATE',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018002','正常','0007002018',2,'0',NULL,'1',NULL,NULL,NULL,'ACTIVE',NULL);

-- 48.updateSQL2016-09-09订单资源表order_resource
DROP TABLE IF EXISTS `order_resource`;
CREATE TABLE `order_resource` (
  `id` varchar(32) NOT NULL COMMENT 'ID（主键）',
  `order_no` varchar(18) NOT NULL COMMENT '订单编号',
  `resource_id` varchar(100) NOT NULL COMMENT '资源ID',
  `resource_name` varchar(64) NOT NULL COMMENT '资源名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 49.updateSQL2016-09-12修改弹性公网IPcloud_floatip
ALTER TABLE cloud_floatip
drop column is_visible;
ALTER table cloud_floatip
add column is_visable char(1) DEFAULT null;

-- 50.updateSQL2016-09-12修改数据字典-系统参数
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0012', '系统参数', '0', '8', '0', NULL, '1', NULL, NULL, NULL, 'SystemParam', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0012001', '按需资源开通限定', '0012', '1', '0', '', '1', '100', NULL, NULL, 'PostPayResourceOpenLimitValue', '');
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0012002', '资源到期、欠费保留时长', '0012', '2', '0', '', '1', '1', NULL, NULL, 'KeepTime', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0012003', '回收站保留时长', '0012', '3', '0', '', '1', '168', NULL, NULL, 'RecycleBinTime', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0012004', '按需服务重新恢复', '0012', '4', '0', '', '1', '0', NULL, NULL, 'RestoreValue', NULL);

-- 51.updateSQL2016-09-12money_record表增加索引idx_paytype
alter table money_record add index idx_paytype(pay_type);

-- 52.updateSQL2016-09-13冻结解冻对客户表与用户表新增字段
ALTER TABLE sys_selfcustomer drop is_blocked ;
ALTER TABLE sys_selfcustomer drop block_opstatus ;
ALTER TABLE sys_selfuser drop is_blocked ;


ALTER TABLE sys_selfcustomer 
ADD COLUMN is_blocked CHAR(1) default '0';

ALTER TABLE sys_selfcustomer 
ADD COLUMN block_opstatus CHAR(1) default '0';

ALTER TABLE sys_selfuser 
ADD COLUMN is_blocked CHAR(1) default '0';


-- 53.updateSQL2016-09-13数据库表统一改为InnoDB
alter table cloud_model engine=innodb;
alter table cloud_outip engine=innodb;
alter table cus_service_state engine=innodb;
alter table obs_accesskey engine=innodb;
alter table obs_user engine=innodb;
-- alter table order_resource engine=innodb;本次新增
alter table sys_eayunfile engine=innodb;
alter table sys_mailverify engine=innodb;
alter table sys_no_send_sms engine=innodb;
alter table sys_phoneverify engine=innodb;
alter table work_file engine=innodb;
alter table work_quota engine=innodb;

-- 54.updateSQL2016-09-13增加更改带宽和更改连接数功能
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '更改带宽',
    NULL,
    'net_bandwidth',
    121022,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
    '私有网络更改带宽功能',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '更改连接数',
    NULL,
    'load_editcount',
    121326,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '负载均衡' AND ss.parent_id <> '' AND ss.power_sort = 121300),
    '负载均衡更改连接数功能',
    NULL
  );

INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route 
  IN 
    ('net_bandwidth','load_editcount')
);

-- 55.updateSQL2016-09-13其他权限调整
-- skip

-- 56.updateSQL2016-10-12sys_data_tree添加一条vpn状态记录
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) 
VALUES ('0007002018003','正常','0007002018',3,'0',NULL,'1',NULL,NULL,NULL,'DOWN',NULL);

-- 57.updateSQL2016-10-18sys_data_tree添加一条volume状态记录

INSERT INTO `sys_data_tree` VALUES ('0007002005010', '备份中', '0007002005', '3', '0', '云硬盘创建快照时状态', '1', null, null, null, 'BACKING-UP', null);

-- 58.updateSQL2016-10-19角色权限名称修改
UPDATE sys_selfpower set power_name = '挂载/解绑云硬盘' WHERE power_route = 'host_bindVolume';

UPDATE sys_selfpower set power_name = '挂载' WHERE power_route = 'disk_bind';

UPDATE sys_selfpower set power_name = '连接/断开路由' WHERE power_route = 'subnet_route';

DELETE FROM sys_selfpower WHERE power_route = 'order_search';

-- 59.updateSQL2016-10-19sys_data_tree添加计划任务白名单检测三条纪录
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0014','计划任务名称(被监测计划任务)','0',10,'1','管理员可以手动配置被监测的计划任务项，因系统中存在比较多的计划任务，加入此项的目的是为了更有针对性','1',NULL,NULL,NULL,'monitorScheduledTask',NULL);

-- 60.updateSQL2016-10-21计费类型名称修改

UPDATE sys_data_tree SET para2='单价计费'WHERE para2 ='单价计价';

UPDATE sys_data_tree SET para2='区间计费'WHERE para2 ='区间计价';

UPDATE sys_data_tree SET para2='差值阶梯计费' WHERE node_name_en ='downValue' or node_name_en ='requestCount';
UPDATE sys_data_tree SET para2='阶梯计费' WHERE node_name_en ='spaceCapacity';

UPDATE sys_data_tree SET node_name='下载流量' WHERE node_name_en ='obsDown';
UPDATE sys_data_tree SET node_name='流量' WHERE node_name_en ='downValue';

-- 61.updateSQL2016-10-21quota_template添加创建时间字段
ALTER TABLE `quota_template`
ADD COLUMN `create_time`  datetime NULL DEFAULT NULL COMMENT '模板创建时间' AFTER `image_count`;

-- 62.updateSQL2016-10-25sys_data_tree变更一条vpn状态记录
UPDATE sys_data_tree set node_name = '异常' WHERE node_id = '0007002018003';

-- 63.2016-11-7ecmc1.2客户表字段新增
alter table sys_selfcustomer add COLUMN cus_type CHAR(1);

-- 64.updateSQL2016-11-24ecmc_权限
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
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7aa40d0003', '创建客户', null, '2016-04-29 08:45:53', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_create;\nui:customer_create;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/customer/getallcustomerorg.do;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/project/createproject.do;\nhttp:/ecmc/project/createprojectonly.do;\nhttp://ecmc/quota/template/getallquotatemplate.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7b1fde0005', '编辑客户', null, '2016-04-29 08:46:25', 'ff808081543cbe2701543cceba910000', '1', 'ui:customer_modify;\nhttp:/ecmc/customer/getcuswithadminbyid.do;\nhttp:/ecmc/customer/checkcusadmin.do;\nhttp:/ecmc/customer/checkcusemail.do;\nhttp:/ecmc/customer/checkcusphone.do;\nhttp:/ecmc/customer/checkcuscpname.do;\nhttp:/ecmc/customer/modifycustomer.do;', 'ff8080815438ac44015438c27e5d0007', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288ee5545f703101545f7bc0ae0007', '编辑项目', null, '2016-04-29 08:47:06', 'ff808081543cbe2701543cceba910000', '1', 'ui:project_modify;\nhttp:/ecmc/project/getprojectbyid.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do;\nhttp:/ecmc/project/modifyproject.do;', 'ff8080815438ac44015438c27e5d0007', '0');
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
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fece84a0067', '缓存同步', '数据字典-缓存同步', '2016-04-29 10:50:42', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_syncCache;http:/ecmc/system/enum/syncdatatree.do;\nhttp:/ecmc/virtual/tag/syncRedisWithDB.do;\nhttp:/ecmc/monitor/alarm/resyncsmsquotacache.do;\nhttp:/ecmc/ecmc/obs/obsview/syncobsuser.do;\nhttp:/ecmc/system/log/syncLog.do;\nhttp:/ecmc/system/log/syncEcmcLog.do;\nhttp:/billing/factor/syncfactorprice.do;\nhttp:/ecmc/customer/synccustomer.do;\nhttp:/monitor/alarm/syncEcscMonitor.do;\nhttp:/ecmc/monitor/alarm/syncEcmcMonitor.do;\nhttp:/ecmc/system/api/synchronizeBlack.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545f98a801545fed7a6c0069', '节点排序', '数据管理-节点排序', '2016-04-29 10:51:19', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_enum_orderBy;\nhttp:/ecmc/system/enum/getdatatreechildren.do;\nhttp:/ecmc/system/enum/sortdatatree.do;', '40288eeb545f98a801545fea5a8a005d', '1');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eeb545ff66b01546011b98a0020', '日志查询', '日志管理-列表', '2016-04-29 11:30:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'ui:sys_log_query;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/system/log/getecmcloglist.do;\nhttp:/ecmc/system/log/getOperLog.do;\nhttp:/ecmc/system/log/getecscLogList.do;\nhttp:/ecmc/system/log/getecmcloglistbymongon.do;\nhttp:/ecmc/system/log/getOperLogFromMongo.do;\nhttp:/ecmc/system/log/getecscloglistbymongon.do;', 'ff8080815438ac44015438dc6dfa0020', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fe908d50016', '查询', '查询，详情。', '2016-04-29 10:46:28', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_query;\nhttp:/ecmc/physical/datacenter/querydatacenter.do;\nhttp:/ecmc/physical/datacenter/querybyid.do;\nhttp:/ecmc/virtual/securitygrouprule/getCloudhostlist.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fe9d58c0018', '编辑', '编辑', '2016-04-29 10:47:20', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_modify;\nhttp:/ecmc/physical/datacenter/querybyid.do;\nhttp:/ecmc/physical/datacenter/updatedatacenter.do;\nhttp:/ecmc/physical/datacenter/checkNameExistOfEdit.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('40288eee545fc01a01545fea5416001a', '创建', '创建数据中心', '2016-04-29 10:47:53', '40288eee545fc01a01545fe4cd06000f', '1', 'ui:phy_datacenter_create;\nhttp:/ecmc/physical/datacenter/createdatacenter.do;\nhttp:/ecmc/physical/datacenter/checkNameExist.do;\nhttp:/ecmc/physical/datacenter/checkCabinetNum.do;\nhttp:/ecmc/physical/datacenter/checkDcAddressExist.do;', 'ff8080815438ac44015438ce7e8e000c', '0');
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
INSERT INTO `ecmc_sys_authority` VALUES ('4028908f5460970c015460ac65b6000d', '负载均衡器查询', '查询负载均衡器列表', '2016-04-29 14:19:51', '402890bc540ad19801540ad1fc300000', '1', 'ui:vir_loadbalance_lb_r;\nhttp:/ecmc/overview/getalldclist.do;\nhttp:/ecmc/overview/getallcustomerlist.do;\nhttp:/ecmc/overview/getallprojectlist.do;\nhttp:/ecmc/virtual/loadbalance/pool/querypool.do;\nhttp:/ecmc/virtual/loadbalance/pool/getLoadBalanceById.do;\nhttp:/ecmc/virtual/loadbalance/member/getMemberList.do;', 'ff8080815438ac44015438bf1f390003', '0');
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
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b2204b6001e', '浮动ip查看', '列表展示和查询', '2016-05-04 17:38:27', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_query;\nhttp:/ecmc/virtual/floatip/getFloatIpList.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b27e43600d0', '公网IP分配', '分配公网IP', '2016-05-04 17:44:52', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_for;\nhttp:/ecmc/virtual/floatip/remainnum.do;\nhttp:/ecmc/virtual/floatip/checkeIpNow.do;\nhttp:/ecmc/virtual/floatip/allocateIptonum.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b3490c0018d', '浮动IP绑定/解除绑定', '绑定/解除绑定', '2016-05-04 17:58:43', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_bind;\nhttp:/ecmc/virtual/network/getnetworklistbyprjid.do;\nhttp:/ecmc/virtual/subnetwork/getsubnetlistbynetid.do;\nhttp:/ecmc/virtual/floatip/getVmBySubNetWork.do;\nhttp:/ecmc/virtual/loadbalance/pool/getnotbindfloatippools.do;\nhttp:/ecmc/virtual/floatip/binDingVm.do;\nhttp:/ecmc/virtual/floatip/unBinDingVm.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8547a95f601547b3ed0fb024d', '公网IP释放', '释放公网IP', '2016-05-04 18:09:54', 'ff808081545a6f9d01545c5f4a480007', '1', 'ui:vir_floatip_release;\nhttp:/ecmc/virtual/floatip/deallocateFloatIp.do;', 'ff8080815438ac44015438bf1f390003', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402890a8576fad3001576fbc58760000', '短信服务查看', '短信服务查看', '2016-09-28 15:39:56', '2c91808256f81c44015702bbf9510000', '1', 'ui:mon_resource_sms;\nhttp:/ecmc/system/sms/getsmslist.do;\nhttp:/ecmc/system/sms/createsms.do;\nhttp:/ecmc/system/sms/resendsms.do;', '40289092559069cd0155907110460006', '0');
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
INSERT INTO `ecmc_sys_authority` VALUES ('402890b3547eb44601547f0afb0801be', '私有网络-设置/清除网关', '网络设置或者清除网关', '2016-05-05 11:51:46', '402890b3546018f5015460d2f74c007c', '1', 'ui:vir_network_setGateway;\nhttp:/ecmc/virtual/route/setgateway.do;\nhttp:/ecmc/virtual/route/removegateway.do;\nhttp:/ecmc/virtual/networkout/selectoutnet.do', 'ff8080815438ac44015438bf1f390003', '0');
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
-- Table structure for `ecmc_sys_menu`
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
-- Table structure for `ecmc_sys_role`
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
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfeb3fa000a', '客服人员', '系统初始角色', '2016-04-22 11:23:48', 'ff808081543cbe2701543cceba910000', '1', '1', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bfee6a8000b', '运维工程师', '系统初始角色', '2016-04-22 11:24:01', 'ff808081543cbe2701543cceba910000', '1', '1', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff30f2000c', '管理员', '系统初始角色', '2016-04-22 11:24:20', 'ff808081543cbe2701543cceba910000', '1', '1', '0');
INSERT INTO `ecmc_sys_role` VALUES ('40289092543bd6a801543bff655b000d', '商务', '系统初始角色', '2016-04-22 11:24:34', 'ff808081543cbe2701543cceba910000', '1', '1', '0');

-- ----------------------------
-- Table structure for `ecmc_sys_roleauth`
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
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d40158941014640008', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7f8d66000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d40158941014660009', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f7ff16c000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d4015894101466000a', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8079ed000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d4015894101466000b', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f80d1980011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d4015894101466000c', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d4015894101466000d', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d4015894101469000e', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d4015894101469000f', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d40158941014690010', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f840aaf0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d40158941014690011', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8470cc0059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d40158941014690012', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8703f0005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d40158941014690013', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f877367005d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a0014', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a0015', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a0016', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a0017', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a0018', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a0019', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a001a', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146a001b', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b001c', '40288ee75456549a015456b8df2e000d', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b001d', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545feb3301005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b001e', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545febaaf80061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b001f', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec16a20063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b0020', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fec79ae0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b0021', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fece84a0067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146b0022', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fed7a6c0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146c0023', '40288ee75456549a015456b8df2e000d', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289352589407d401589410146c0024', '40288ee75456549a015456b8df2e000d', '402893235765a3ae015765dfafa50000');
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
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051770028', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051780029', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005178002a', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005178002b', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005178002c', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005179002d', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005179002e', '40289092543bd6a801543bfee6a8000b', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005179002f', '40289092543bd6a801543bfee6a8000b', '40288ee555a461290155a46d9f1d0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051790030', '40289092543bd6a801543bfee6a8000b', '40288ee555a461290155a46efb0a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517a0031', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517a0032', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517a0033', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517a0034', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517b0035', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517b0036', '40289092543bd6a801543bfee6a8000b', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517b0037', '40289092543bd6a801543bfee6a8000b', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517c0038', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517c0039', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517c003a', '40289092543bd6a801543bfee6a8000b', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517c003b', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517c003c', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517c003d', '40289092543bd6a801543bfee6a8000b', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d003e', '40289092543bd6a801543bfee6a8000b', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d003f', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d0040', '40289092543bd6a801543bfee6a8000b', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d0041', '40289092543bd6a801543bfee6a8000b', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d0042', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d0043', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517d0044', '40289092543bd6a801543bfee6a8000b', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e0045', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e0046', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e0047', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e0048', '40289092543bd6a801543bfee6a8000b', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e0049', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e004a', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517e004b', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f004c', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f004d', '40289092543bd6a801543bfee6a8000b', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f004e', '40289092543bd6a801543bfee6a8000b', '40288ef3557c121201557c13b5730001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f004f', '40289092543bd6a801543bfee6a8000b', '40288ef3557c121201557c21c18000d7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f0050', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4a12db0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f0051', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4b326a0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700517f0052', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4c66930009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800053', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4d2eb4000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800054', '40289092543bd6a801543bfee6a8000b', '40288ef3557c2fe201557c4e2173000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800055', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800056', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a26b7c000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800057', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460a34c75000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800058', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051800059', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005181005a', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005181005b', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005181005c', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005181005d', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005181005e', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005181005f', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051810060', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820061', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820062', '40289092543bd6a801543bfee6a8000b', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820063', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820064', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820065', '40289092543bd6a801543bfee6a8000b', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820066', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051820067', '40289092543bd6a801543bfee6a8000b', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051830068', '40289092543bd6a801543bfee6a8000b', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051830069', '40289092543bd6a801543bfee6a8000b', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005183006a', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005183006b', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005183006c', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005183006d', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005184006e', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005184006f', '40289092543bd6a801543bfee6a8000b', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051840070', '40289092543bd6a801543bfee6a8000b', '40289092543bd6a801543bfba88c0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051840071', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051840072', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051840073', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051840074', '40289092543bd6a801543bfee6a8000b', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051850075', '40289092543bd6a801543bfee6a8000b', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051850076', '40289092543bd6a801543bfee6a8000b', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051850077', '40289092543bd6a801543bfee6a8000b', '40289092559069cd01559073979f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051850078', '40289092543bd6a801543bfee6a8000b', '40289092559069cd01559074c804000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051850079', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005185007a', '40289092543bd6a801543bfee6a8000b', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005185007b', '40289092543bd6a801543bfee6a8000b', '4028909556c1614f0156c19753710000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005186007c', '40289092543bd6a801543bfee6a8000b', '4028909556d54c4a0156d550a0130000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005186007d', '40289092543bd6a801543bfee6a8000b', '4028909556d54c4a0156d551f3d40001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005186007e', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005186007f', '40289092543bd6a801543bfee6a8000b', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051860080', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051860081', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051860082', '40289092543bd6a801543bfee6a8000b', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870083', '40289092543bd6a801543bfee6a8000b', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870084', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cbd08700001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870085', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cbdd5e90002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870086', '40289092543bd6a801543bfee6a8000b', '40289099576f8d2501576fa1deea0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870087', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870088', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051870089', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005188008a', '40289092543bd6a801543bfee6a8000b', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005188008b', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005188008c', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005188008d', '40289092543bd6a801543bfee6a8000b', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005188008e', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea70015867005188008f', '40289092543bd6a801543bfee6a8000b', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051880090', '40289092543bd6a801543bfee6a8000b', '402890a8576fad3001576fbc58760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890091', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890092', '40289092543bd6a801543bfee6a8000b', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890093', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890094', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890095', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890096', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea700158670051890097', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a0098', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a0099', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a009a', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a009b', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a009c', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a009d', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518a009e', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518b009f', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518b00a0', '40289092543bd6a801543bfee6a8000b', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518b00a1', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518b00a2', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518b00a3', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518b00a4', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00a5', '40289092543bd6a801543bfee6a8000b', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00a6', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00a7', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00a8', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef5c49201ac');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00a9', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00aa', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518c00ab', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00ac', '40289092543bd6a801543bfee6a8000b', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00ad', '40289092543bd6a801543bfee6a8000b', '402890ba576ec7c001576ed6556f0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00ae', '40289092543bd6a801543bfee6a8000b', '402890c056afe5ff0156b1211c360000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00af', '40289092543bd6a801543bfee6a8000b', '402890c056afe5ff0156b20d8df701cf');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00b0', '40289092543bd6a801543bfee6a8000b', '402890c056b62e520156b6ab8b140000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00b1', '40289092543bd6a801543bfee6a8000b', '402890c056d505490156d590e6db0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518d00b2', '40289092543bd6a801543bfee6a8000b', '402890c056d940490156d95eeb1b0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b3', '40289092543bd6a801543bfee6a8000b', '402890c056d940490156d95f94ca0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b4', '40289092543bd6a801543bfee6a8000b', '402890c056d9ee920156d9ff3c610000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b5', '40289092543bd6a801543bfee6a8000b', '402890c056d9ee920156d9fff9c90001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b6', '40289092543bd6a801543bfee6a8000b', '402890c0576641eb01576661917e014e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b7', '40289092543bd6a801543bfee6a8000b', '402890c0576641eb01576664aa540150');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519200d3', '40289092543bd6a801543bfee6a8000b', '402893035865ea70015866fc21290005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b8', '40289092543bd6a801543bfee6a8000b', '40289321562afe3e01562b0e849c0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518e00b9', '40289092543bd6a801543bfee6a8000b', '402893225766121d01576615c45c0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00ba', '40289092543bd6a801543bfee6a8000b', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00bb', '40289092543bd6a801543bfee6a8000b', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00bc', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00bd', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00be', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00bf', '40289092543bd6a801543bfee6a8000b', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700518f00c0', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8777df0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519000c1', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8a059e0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519000c2', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e8bf46e0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519000c3', '40289092543bd6a801543bfee6a8000b', '40289334576e7fc801576e9455740103');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519000c4', '40289092543bd6a801543bfee6a8000b', '40289335576ebf9101576ec205b70000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519000c5', '40289092543bd6a801543bfee6a8000b', '40289335576ebf9101576ec69aa30001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519000c6', '40289092543bd6a801543bfee6a8000b', '40289355583de08b01583df1f9f90000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100c7', '40289092543bd6a801543bfee6a8000b', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100c8', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100c9', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100ca', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100cb', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100cc', '40289092543bd6a801543bfee6a8000b', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519100cd', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519200ce', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519200cf', '40289092543bd6a801543bfee6a8000b', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519200d0', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519200d1', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('402893035865ea7001586700519200d2', '40289092543bd6a801543bfee6a8000b', 'ff808081548580220154946736af0cae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee010139', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f79d5b10001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee01013a', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7aa40d0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee01013b', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7b1fde0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee01013c', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7bc0ae0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee01013d', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f7c3e5c0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee01013e', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f826e99004f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee01013f', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f82c4d50051');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee010140', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f83259c0053');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee010141', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8377fe0055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee010142', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f880c13005f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee010143', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8873d60061');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee010144', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f88bdaa0063');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020145', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89384c0065');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020146', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f89e5230067');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020147', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8ae39a0069');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020148', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8b47c3006b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020149', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8be3b7006d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee02014a', '40289092543bd6a801543bff30f2000c', '40288ee5545f703101545f8c52b7006f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee02014b', '40289092543bd6a801543bff30f2000c', '40288ee555a461290155a46d9f1d0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee02014c', '40289092543bd6a801543bff30f2000c', '40288ee555a461290155a46efb0a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee02014d', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd895390015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee02014e', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd941540017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee02014f', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fd9ac380019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020150', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fda1beb001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee020151', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe68b600055');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030152', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe723ef0057');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030153', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe792b50059');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030154', '40289092543bd6a801543bff30f2000c', '40288eeb545f98a801545fe7fccd005b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030155', '40289092543bd6a801543bff30f2000c', '40288eeb545ff66b01546011b98a0020');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030156', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe908d50016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030157', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fe9d58c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030158', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545fea5416001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee030159', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545feb443f001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee03015a', '40289092543bd6a801543bff30f2000c', '40288eee545fc01a01545febd38d001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee03015b', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600583400015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee03015c', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600795750018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee03015d', '40289092543bd6a801543bff30f2000c', '40288eee545ff284015460082bb7001a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee03015e', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600abc0a001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee03015f', '40289092543bd6a801543bff30f2000c', '40288eee545ff2840154600cf4880021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040160', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546010327d0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040161', '40289092543bd6a801543bff30f2000c', '40288eee545ff28401546021065d0026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040162', '40289092543bd6a801543bff30f2000c', '40288eef54745b0301547460906e0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040163', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609040600001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040164', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609110f80004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040165', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546093b4ad0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040166', '40289092543bd6a801543bff30f2000c', '40288ef354608e1301546096ee16000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040167', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460978752000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040168', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609a88070010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee040169', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609b23ab0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee04016a', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609d629b0015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee04016b', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609e2b450017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee04016c', '40289092543bd6a801543bff30f2000c', '40288ef354608e130154609fd4be001b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee04016d', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a114ab001d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee04016e', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a233de001f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee05016f', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a2988b0021');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050170', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a473cf0024');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050171', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a76d310026');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050172', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a7dfd60028');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050173', '40289092543bd6a801543bff30f2000c', '40288ef354608e13015460a98624002b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050174', '40289092543bd6a801543bff30f2000c', '40288ef3557c121201557c13b5730001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050175', '40289092543bd6a801543bff30f2000c', '40288ef3557c121201557c21c18000d7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050176', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4a12db0005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050177', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4b326a0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050178', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4c66930009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee050179', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4d2eb4000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee05017a', '40289092543bd6a801543bff30f2000c', '40288ef3557c2fe201557c4e2173000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee05017b', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a057880009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee05017c', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a26b7c000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee05017d', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460a34c75000b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee06017e', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460ac65b6000d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee06017f', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b43a81000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060180', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460b56dd1000f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060181', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bb30970010');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060182', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bbbafe0011');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060183', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bdcd3c0012');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060184', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bea2d40013');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060185', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bf305c0014');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060186', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460bfab040015');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060187', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c0b52f0016');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060188', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c111230017');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee060189', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1753c0018');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee06018a', '40289092543bd6a801543bff30f2000c', '4028908f5460970c015460c1b04d0019');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee06018b', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154600f2ecf00c7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee06018c', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546086b8c8019e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee06018d', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608878dc01a1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee07018e', '40289092543bd6a801543bff30f2000c', '40289090545fbe510154608fbe0401a5');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee07018f', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546092b20a01a7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070190', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546094514001a9');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070191', '40289092543bd6a801543bff30f2000c', '40289090545fbe5101546095699801ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070192', '40289092543bd6a801543bff30f2000c', '40289090545fbe51015460c63b250318');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070193', '40289092543bd6a801543bff30f2000c', '4028909054754fc4015475ce5a4a0126');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070194', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a40aa5d0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070195', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a4660de0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070196', '40289092543bd6a801543bff30f2000c', '40289090564a2c2801564a4b4eae0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070197', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547af70d5a0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070198', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b0d78f002c1');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee070199', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b1ba72b037d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee07019a', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b2d463b0439');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee07019b', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b3bb16a04f0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee08019c', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b4c16560666');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee08019d', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5454420723');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee08019e', '40289092543bd6a801543bff30f2000c', '40289091547ae92201547b5b42d607e8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee08019f', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bf9c69d0006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a0', '40289092543bd6a801543bff30f2000c', '40289092543bd6a801543bfde6460009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a1', '40289092543bd6a801543bff30f2000c', '40289092544c795d01544ca94fe60000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a2', '40289092543bd6a801543bff30f2000c', '40289092547a07b201547a5098d50009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a3', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8f52290243');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a4', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f8fde830245');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a5', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f9086650247');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a6', '40289092543bd6a801543bff30f2000c', '40289092547e8e3e01547f91499d0249');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a7', '40289092543bd6a801543bff30f2000c', '4028909254958b4901549596b3a30112');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a8', '40289092543bd6a801543bff30f2000c', '4028909254c171590154c172f4f00001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801a9', '40289092543bd6a801543bff30f2000c', '40289092559069cd01559073979f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0801aa', '40289092543bd6a801543bff30f2000c', '40289092559069cd01559074c804000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901ab', '40289092543bd6a801543bff30f2000c', '402890955460f136015460f8d07b0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901ac', '40289092543bd6a801543bff30f2000c', '402890955460f136015460fdea770006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901ad', '40289092543bd6a801543bff30f2000c', '4028909556c1614f0156c19753710000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901ae', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d550a0130000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901af', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d551f3d40001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b0', '40289092543bd6a801543bff30f2000c', '4028909556d54c4a0156d552850a0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b1', '40289092543bd6a801543bff30f2000c', '4028909557758eff01577596b5760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b2', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756ae2d50003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b3', '40289092543bd6a801543bff30f2000c', '402890995475666c0154756f31760006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b4', '40289092543bd6a801543bff30f2000c', '402890995475666c0154757016ab0009');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b5', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b427a1f0008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b6', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b43be70000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0901b7', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b44b481000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01b8', '40289092543bd6a801543bff30f2000c', '40289099547b104601547b456b78000e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01b9', '40289092543bd6a801543bff30f2000c', '4028909955a082c90155a08fcbe80003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01ba', '40289092543bd6a801543bff30f2000c', '40289099562538b00156253dfa450001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01bb', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cbd08700001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01bc', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cbdd5e90002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01bd', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fa1deea0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01be', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fd663ef043b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01bf', '40289092543bd6a801543bff30f2000c', '40289099576f8d2501576fd71e9c043c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c0', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154760f6fdf0030');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c1', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154761e15f000eb');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c2', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154762212950193');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c3', '40289092543bd6a801543bff30f2000c', '402890a85475fcba01547627e4a30242');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c4', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154764060810311');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c5', '40289092543bd6a801543bff30f2000c', '402890a85475fcba015476458aed03c0');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c6', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766216ae046a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0a01c7', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766358c0046d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01c8', '40289092543bd6a801543bff30f2000c', '402890a85475fcba0154766585e80515');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01c9', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a3a9d20005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01ca', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a64fb200b3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01cb', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476a95021015e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01cc', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b003e4021a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01cd', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b3d19c02ca');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01ce', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b5dfd80379');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01cf', '40289092543bd6a801543bff30f2000c', '402890a854769f83015476b8cebd042e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d0', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b2204b6001e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d1', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3490c0018d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d2', '40289092543bd6a801543bff30f2000c', '402890a8547a95f601547b3ed0fb024d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d3', '40289092543bd6a801543bff30f2000c', '402890a8576fad3001576fbc58760000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d4', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb7ecb10179');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d5', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547eb94081017b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d6', '40289092543bd6a801543bff30f2000c', '402890ab547eb40e01547ebf5f78024b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0b01d7', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547ee7ef7a0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01d8', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547eee9ef700d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01d9', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0114bb01a6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01da', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f020df40275');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01db', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f02ed0d0277');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01dc', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f03cd210279');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01dd', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f049ad2027b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01de', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f063a8b027d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01df', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f07abaa027f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e0', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0912ba0281');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e1', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f0b07200283');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e2', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3e175f0289');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e3', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f3ee4e2028b');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e4', '40289092543bd6a801543bff30f2000c', '402890ab547ed5e301547f40a3a3028d');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e5', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eacb2640002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0c01e6', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547ead84660004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01e7', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eadee590006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01e8', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eaef1430008');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01e9', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb0ea62000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01ea', '40289092543bd6a801543bff30f2000c', '402890b3547e8de301547eb16a5a000c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01eb', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ede622e00d6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01ec', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547eec02b801aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01ed', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547ef8aabd01ae');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01ee', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f02ce7101b6');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01ef', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f03a68101b8');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01f0', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f07cd7201ba');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0d01f1', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0afb0801be');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f2', '40289092543bd6a801543bff30f2000c', '402890b3547eb44601547f0c3c1801c3');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f3', '40289092543bd6a801543bff30f2000c', '402890ba576ec7c001576ed6556f0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f4', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b1211c360000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f5', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b1b0430300e7');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f6', '40289092543bd6a801543bff30f2000c', '402890c056afe5ff0156b20d8df701cf');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f7', '40289092543bd6a801543bff30f2000c', '402890c056b62e520156b6ab8b140000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f8', '40289092543bd6a801543bff30f2000c', '402890c056d505490156d590e6db0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01f9', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d95eeb1b0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01fa', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d95f94ca0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01fb', '40289092543bd6a801543bff30f2000c', '402890c056d940490156d9600d210002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01fc', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156d9ff3c610000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01fd', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156d9fff9c90001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01fe', '40289092543bd6a801543bff30f2000c', '402890c056d9ee920156da0086790002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e01ff', '40289092543bd6a801543bff30f2000c', '402890c0576641eb01576661917e014e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0e0200', '40289092543bd6a801543bff30f2000c', '402890c0576641eb0157666320e6014f');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0201', '40289092543bd6a801543bff30f2000c', '402890c0576641eb01576664aa540150');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0202', '40289092543bd6a801543bff30f2000c', '4028930056e4bc630156e51b51450000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0203', '40289092543bd6a801543bff30f2000c', '402893035865ea70015866fc21290005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0204', '40289092543bd6a801543bff30f2000c', '40289321562afe3e01562b0e849c0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0205', '40289092543bd6a801543bff30f2000c', '402893225766121d01576615c45c0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0206', '40289092543bd6a801543bff30f2000c', '4028932356a0d1e90156a0d3ffbb0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0207', '40289092543bd6a801543bff30f2000c', '402893235765a3ae015765dfafa50000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0208', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576accd0800000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0209', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acd89770001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f020a', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576ace34f50002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f020b', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576ace8b130003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f020c', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576aced07d0004');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f020d', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acf10d00005');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f020e', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acf5be10006');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f020f', '40289092543bd6a801543bff30f2000c', '4028932b576abcd301576acfb9cc0007');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee0f0210', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8777df0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100211', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8a059e0001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100212', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e8bf46e0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100213', '40289092543bd6a801543bff30f2000c', '40289334576e7fc801576e9455740103');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100214', '40289092543bd6a801543bff30f2000c', '40289335576ebf9101576ec205b70000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100215', '40289092543bd6a801543bff30f2000c', '40289335576ebf9101576ec69aa30001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110229', '40289092543bd6a801543bff30f2000c', '40289355583de08b01583df1f9f90000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100216', '40289092543bd6a801543bff30f2000c', '402893e656de3e910156df63bf3501ec');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100217', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb5109a0000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100218', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb573810001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee100219', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb5cd1d0002');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee10021a', '40289092543bd6a801543bff30f2000c', '402893f956dfa84c0156dfb60f7f0003');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee10021b', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545c627b93000a');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee10021c', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca2b3f300aa');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee10021d', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545ca352f300ab');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee10021e', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545caca1a100ea');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee10021f', '40289092543bd6a801543bff30f2000c', 'ff808081545a6f9d01545cb308d3012c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110220', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944657ea0c72');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110221', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447167f0c76');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110222', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549447e08f0c78');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110223', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549449684c0c7c');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110224', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944b04d30c7e');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110225', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154944bfc490c80');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110226', '40289092543bd6a801543bff30f2000c', 'ff808081548580220154945036120c83');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110227', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549450eace0c85');
INSERT INTO `ecmc_sys_roleauth` VALUES ('40289318587506e001587530ee110228', '40289092543bd6a801543bff30f2000c', 'ff8080815485802201549451694c0c87');
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
-- Table structure for `ecmc_sys_rolemenu`
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
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d401589410144e0000', '40288ee75456549a015456b8df2e000d', '40288eeb545f98a801545fea5a8a005d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014620001', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014620002', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014620003', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438d98eea001c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014620004', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014620005', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dace02001e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014620006', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289352589407d40158941014630007', '40288ee75456549a015456b8df2e000d', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029c', '40289092543bd6a801543bfeb3fa000a', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029d', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029e', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c029f', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c02a0', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028932b576abcd301576b028c6c02a1', '40289092543bd6a801543bfeb3fa000a', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516c0006', '40289092543bd6a801543bfee6a8000b', '40288eef55775e060155775f66160002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516c0007', '40289092543bd6a801543bfee6a8000b', '40289092559069cd0155907110460006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516d0008', '40289092543bd6a801543bfee6a8000b', '4028909556c4f2440156c5db2f8700ea');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516e0009', '40289092543bd6a801543bfee6a8000b', '40289099567cb38a01567cb80d6e0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516e000a', '40289092543bd6a801543bfee6a8000b', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516e000b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516f000c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516f000d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516f000e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea7001586700516f000f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051700010', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051700011', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051700012', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051700013', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051710014', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051710015', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051720016', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051720017', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051720018', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051720019', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea70015867005173001a', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea70015867005173001b', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea70015867005173001c', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea70015867005173001d', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea70015867005174001e', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea70015867005174001f', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051740020', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051740021', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051740022', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051750023', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051750024', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051750025', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051750026', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('402893035865ea700158670051760027', '40289092543bd6a801543bfee6a8000b', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfd0115', '40289092543bd6a801543bff30f2000c', '40288eef55775e060155775f66160002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe0116', '40289092543bd6a801543bff30f2000c', '40289092559069cd0155907110460006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe0117', '40289092543bd6a801543bff30f2000c', '4028909556c4f2440156c5db2f8700ea');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe0118', '40289092543bd6a801543bff30f2000c', '402890995621747901562187c9ad0001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe0119', '40289092543bd6a801543bff30f2000c', '40289099567cb38a01567cb80d6e0000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe011a', '40289092543bd6a801543bff30f2000c', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe011b', '40289092543bd6a801543bff30f2000c', '4028936f567dd77101567dde38270001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe011c', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bb40b20000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe011d', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe011e', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438be965d0002');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe011f', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bf1f390003');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edfe0120', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438bfc39a0004');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0121', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0122', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0123', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0124', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c2e0dc0008');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0125', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c33c7b0009');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0126', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438c8999a000a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0127', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce0059000b');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0128', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438ce7e8e000c');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff0129', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cf239e000d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530edff012a', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438cfcf98000e');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee00012b', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d03f87000f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee00012c', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d1075f0010');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee00012d', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d199e40011');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee00012e', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d2dc4a0012');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee00012f', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d3aa7a0013');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000130', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d5fe9c0014');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000131', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d660ff0015');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000132', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d721300016');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000133', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d7fbd50017');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000134', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d8d5000018');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000135', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438d93963001a');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000136', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438da284a001d');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000137', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dbb92e001f');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289318587506e001587530ee000138', '40289092543bd6a801543bff30f2000c', 'ff8080815438ac44015438dc6dfa0020');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285d0647', '40289092543bd6a801543bff655b000d', '4028936f567dd77101567ddad4b00000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0641', '40289092543bd6a801543bff655b000d', '4028936f567dd77101567dde38270001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0642', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438bcfb260001');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0643', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c05a8b0005');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0644', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c14b110006');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0645', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c27e5d0007');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028934b576e677901576fcd285c0646', '40289092543bd6a801543bff655b000d', 'ff8080815438ac44015438c2e0dc0008');


-- 65.updateSQL2016-11-25带宽单位修改
-- 根据罗蕾、慧敏确定，带宽原单位Mb改为Mbps
UPDATE sys_data_tree SET para1 = 'Mbps' WHERE node_name_en = 'bandValue';

-- 66.updateSQL2016-12-21初始化全部数据中心的默认DNS为114
UPDATE dc_datacenter SET dc_dns = '114.114.114.114';

-- 67.updateSQL2016-09-13其他权限调整
UPDATE sys_selfpower SET power_name = '移除云主机' where power_name = '移除规则';

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'bucket_view',
    231019,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'Bucket管理' AND ss.parent_id <> '' AND ss.power_sort = 231000),
    'bucket查看',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '下载文件',
    NULL,
    'object_down',
    231020,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'Bucket管理' AND ss.parent_id <> '' AND ss.power_sort = 231000),
    '下载文件',
    NULL
  );

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看',
    NULL,
    'resource_view',
    232010,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '资源报表' AND ss.parent_id <> '' AND ss.power_sort = 232000),
    '资源报表查看',
    NULL
  );


  INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    (
      r.role_name = '超级管理员'
      OR r.role_name = '管理员'
      OR r.role_name = '普通用户'
    )
  AND p.power_route IN (
    'bucket_view','object_down','resource_view'
  )
);


INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '查看交易记录',
    NULL,
    'account_record',
    241012,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '账户总览'),
    '账户总览查看交易记录',
    NULL
  );
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
  (
    REPLACE (uuid(), '-', ''),
    '充值',
    NULL,
    'account_recharge',
    241013,
    (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '账户总览'),
    '账户总览充值',
    NULL
  );

INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route 
  IN 
    ('account_record','account_recharge')
);

DELETE FROM sys_selfrolepower WHERE power_id = (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '创建快照' and ss.power_route = 'disk_addSnap');

INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name LIKE '%管理员'
  AND p.power_route 
  IN 
    ('disk_addSnap')
);
-- bucket详情权限改为YYY
INSERT INTO sys_selfrolepower (
  rp_id,
  role_id,
  power_id,
  rp_state
)(
  SELECT
    REPLACE (uuid(), '-', '') AS rp_id,
    r.role_id AS role_id,
    p.power_id AS power_id,
    '1' AS rp_state
  FROM
    sys_selfrole r,
    sys_selfpower p
  WHERE
    r.role_name = '普通用户'
  AND p.power_route 
  IN 
    ('bucket_details')
);

UPDATE sys_selfpower SET power_name = '查看余额' where power_route = 'account_view';

-- 68.updateSQL2016-12-27用户中心上线镜像类型历史数据处理
-- SELECT * FROM sys_data_tree WHERE parent_id = '0007002002001';
-- 首先，将原来windows下的Windows 2008类型名称改为"Windows 2008 标准版"
-- 再在windows下新增两条记录"Windows 2008 企业版"和"Windows 2008 数据中心版"
UPDATE sys_data_tree SET node_name = 'Windows 2008 标准版' ,node_name_en = '2008StandardCount' WHERE node_id = '0007002002001002' AND parent_id = '0007002002001';
INSERT INTO `sys_data_tree` VALUES ('0007002002001004', 'Windows 2008 企业版', '0007002002001', '4', '0', null, '1', null, null, null, '2008EnterpriseCount', null);
INSERT INTO `sys_data_tree` VALUES ('0007002002001005', 'Windows 2008 数据中心版', '0007002002001', '5', '0', null, '1', null, null, null, '2008DCCount', null);

-- 将原来windows下的Windows 2012类型名称改为"Windows 2012 标准版"
-- 再在windows下新增两条记录"Windows 2012 企业版"和"Windows 2012 数据中心版"
UPDATE sys_data_tree SET node_name = 'Windows 2012 标准版' ,node_name_en = '2012StandardCount' WHERE node_id = '0007002002001003' AND parent_id = '0007002002001';
INSERT INTO `sys_data_tree` VALUES ('0007002002001006', 'Windows 2012 企业版', '0007002002001', '6', '0', null, '1', null, null, null, '2012EnterpriseCount', null);
INSERT INTO `sys_data_tree` VALUES ('0007002002001007', 'Windows 2012 数据中心版', '0007002002001', '7', '0', null, '1', null, null, null, '2012DCCount', null);


-- 历史数据处理
-- 镜像：1：公共镜像;2:自定义镜像
-- 分别查询出原来属于"Windows 2008"和“Windows 2012”的公共镜像
-- SELECT * FROM cloud_image WHERE os_type = '0007002002001' AND sys_type = '0007002002001002' AND image_ispublic = '1';
-- SELECT * FROM cloud_image WHERE os_type = '0007002002001' AND sys_type = '0007002002001003' AND image_ispublic = '1';
-- 有一个08标准版镜像id为“8e8b4949-afc7-49a0-942b-4c813e278f5c”，一个数据中心版id为“fa47341c-3aa3-4a89-bdbd-87303f7f4def”
-- 有一个12标准版镜像id为“82eebb1e-a36c-4868-b111-40ef4c898e82”，一个数据中心版id为“3500d8ae-9982-46fa-885a-56a9cde48a9a”

-- 公共镜像处理
-- 首先标准版的都保持不变，将两个数据中心版的sys_type都改为新的数据中心版的node_id
UPDATE cloud_image SET sys_type = '0007002002001005' WHERE image_id = 'fa47341c-3aa3-4a89-bdbd-87303f7f4def' AND os_type = '0007002002001';
UPDATE cloud_image SET sys_type = '0007002002001007' WHERE image_id = '3500d8ae-9982-46fa-885a-56a9cde48a9a' AND os_type = '0007002002001';

-- 公共镜像创建的云主机处理：将根据以上两个数据中心版的公共镜像创建的云主机的sys_type改为相应的node_id
UPDATE cloud_vm SET sys_type = '0007002002001005' WHERE os_type = '0007002002001' AND from_imageid = 'fa47341c-3aa3-4a89-bdbd-87303f7f4def';
UPDATE cloud_vm SET sys_type = '0007002002001007' WHERE os_type = '0007002002001' AND from_imageid = '3500d8ae-9982-46fa-885a-56a9cde48a9a';



-- 下面的自定义镜像处理和云主机处理需要根据实际情况循环多次

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;


-- SELECT im.image_id, im.image_name,im.image_ispublic,im.from_vmid,im.os_type,im.sys_type ,vm.vm_id,vm.vm_name,vm.sys_type
-- FROM cloud_image im LEFT JOIN cloud_vm vm ON im.from_vmid = vm.vm_id 
--  WHERE im.os_type = '0007002002001' ORDER BY image_ispublic;

-- SELECT vm.vm_id,vm.vm_name,vm.from_imageid,vm.os_type,vm.sys_type ,im.image_id, im.image_name,im.image_ispublic,im.sys_type
-- FROM cloud_vm vm 
-- LEFT JOIN cloud_image im ON vm.from_imageid = im.image_id
-- WHERE vm.os_type = '0007002002001';


-- 69.updateSQL2017-01-04增加cloud_disksnapshot中vol_id的索引
ALTER TABLE `cloud_disksnapshot` ADD INDEX `idx_vol_id` (`vol_id` ASC);

-- 70.updateSQL2017-01-04增加cloud_volume表from_snapid的索引
ALTER TABLE `cloud_volume` ADD INDEX `idx_from_snapid` (`from_snapid` ASC);

-- 71.updateSQL2017-01-06压测参数调优索引添加
ALTER TABLE `cloud_subnetwork` ADD INDEX `idx_net_id` (`net_id` ASC);
ALTER TABLE `cloud_route` ADD INDEX `idx_net_id` (`net_id` ASC);                         
ALTER TABLE `cloud_route` ADD INDEX `idx_network_id` (`network_id` ASC);  
ALTER TABLE `order_info` ADD INDEX `idx_cus_id` (`cus_id` ASC);

-- 72.updateSQL2016-12-16数据字典中新增CDN价格配置参数
/*
-- 数据字典中新增CDN价格配置参数
-- Author: 张帆
-- Date: 2016-12-16 11:23
*/
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010004','CDN下载流量','0007004010',4,'0',NULL,'1',NULL,NULL,NULL,'cdnDownload',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010004001','流量','0007004010004',1,'0',NULL,'1','GB','单价计费',NULL,'cdnDownloadFlow',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010005','CDN动态请求数','0007004010',5,'0',NULL,'1',NULL,NULL,NULL,'cdnDreqs',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010005001','次数','0007004010005',1,'0',NULL,'1','千次','单价计费',NULL,'dreqsCount',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010006','CDN-HTTPS请求数','0007004010',6,'0',NULL,'1',NULL,NULL,NULL,'cdnHreqs',NULL);
INSERT INTO `sys_data_tree` (`node_id`,`node_name`,`parent_id`,`sort`,`is_root`,`memo`,`flag`,`para1`,`para2`,`image_path`,`node_name_en`,`icon`) VALUES ('0007004010006001','次数','0007004010006',1,'0',NULL,'1','万次','单价计费',NULL,'hreqsCount',NULL);

-- 73.updateSQL2017-01-10价格配置
INSERT INTO `money_billing_factor` VALUES ('998083a8591f22e501591ffad1ed029a','0007004001','0007004001001','0007004001001001',1,-1,'1',30.000,'1601281411350','2016-12-21 14:04:08'),('998083a8591f22e501591ffb7840029b','0007004001','0007004001001','0007004001001001',1,-1,'2',0.042,'1601281411350','2016-12-21 14:04:51'),('998083a8591f22e501591ffb9d3f029c','0007004001','0007004001002','0007004001002001',1,-1,'1',28.000,'1601281411350','2016-12-21 14:05:00'),('998083a8591f22e501591ffbd0f5029d','0007004001','0007004001002','0007004001002001',1,-1,'2',0.039,'1601281411350','2016-12-21 14:05:13'),('998083a8591f22e501591ffcbcbe029e','0007004002','0007004002001','0007004002001001',0,-1,'1',0.300,'1601281411350','2016-12-21 14:06:14'),('998083a8591f22e501591ffd328e029f','0007004002','0007004002001','0007004002001001',0,-1,'2',0.001,'1601281411350','2016-12-21 14:06:44'),('998083a8591f22e501591ffd5c4902a0','0007004002','0007004002002','0007004002002001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:06:55'),('998083a8591f22e501591ffd95da02a1','0007004002','0007004002002','0007004002002001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:07:09'),('998083a8591f22e501591ffe502202a2','0007004003','0007004003001','0007004003001001',0,-1,'2',0.001,'1601281411350','2016-12-21 14:07:57'),('998083a8591f22e501591ffea54d02a3','0007004004','0007004004001','0007004004001001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:08:19'),('998083a8591f22e501591ffecad402a4','0007004004','0007004004001','0007004004001001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:08:28'),('998083a8591f22e501591ffef63502a5','0007004004','0007004004002','0007004004002001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:08:39'),('998083a8591f22e501591fff1eb302a6','0007004004','0007004004002','0007004004002001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:08:50'),('998083a8591f22e501592000d1d502a7','0007004004','0007004004003','0007004004003001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:10:41'),('998083a8591f22e50159200100ff02a8','0007004004','0007004004003','0007004004003001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:10:53'),('998083a8591f22e5015920012e3902a9','0007004004','0007004004004','0007004004004001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:11:05'),('998083a8591f22e501592001595902aa','0007004004','0007004004004','0007004004004001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:11:16'),('998083a8591f22e5015920018bf902ab','0007004004','0007004004005','0007004004005001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:11:29'),('998083a8591f22e501592001bd8302ac','0007004004','0007004004005','0007004004005001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:11:42'),('998083a8591f22e501592001e36202ad','0007004004','0007004004006','0007004004006001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:11:51'),('998083a8591f22e5015920020a4502ae','0007004004','0007004004006','0007004004006001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:12:01'),('998083a8591f22e501592003492102af','0007004005','0007004005001','0007004005001001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:13:23'),('998083a8591f22e50159200374d702b0','0007004005','0007004005001','0007004005001001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:13:34'),('998083a8591f22e501592004412c02b2','0007004006','0007004006001','0007004006001001',1,5,'2',0.035,'1601281411350','2016-12-21 14:14:26'),('998083a8591f22e5015920063b9e02b6','0007004009','0007004009001','0007004009001001',1,-1,'1',30.000,'1601281411350','2016-12-21 14:16:36'),('998083a8591f22e501592006699202b7','0007004009','0007004009001','0007004009001001',1,-1,'2',0.042,'1601281411350','2016-12-21 14:16:48'),('998083a8591f22e5015920072d4402b8','0007004008','0007004008001','0007004008001001',0,-1,'1',0.000,'1601281411350','2016-12-21 14:17:38'),('998083a8591f22e50159200755ce02b9','0007004008','0007004008001','0007004008001001',0,-1,'2',0.000,'1601281411350','2016-12-21 14:17:48'),('998083a8591f22e50159200cc963055e','0007004010','0007004010001','0007004010001001',0,1,'2',0.000,'1601281411350','2016-12-21 14:23:46'),('998083a8591f22e50159200d0c2b055f','0007004010','0007004010001','0007004010001001',1,1024,'2',0.158,'1601281411350','2016-12-21 14:24:03'),('998083a8591f22e50159200f467f0560','0007004010','0007004010001','0007004010001001',1024,51200,'2',0.156,'1601281411350','2016-12-21 14:26:29'),('998083a8591f22e50159200fb4580561','0007004010','0007004010001','0007004010001001',51200,-1,'2',0.153,'1601281411350','2016-12-21 14:26:57'),('998083a8591f22e50159201018bb0562','0007004010','0007004010002','0007004010002001',0,1,'2',0.000,'1601281411350','2016-12-21 14:27:22'),('998083a8591f22e50159201043bc0563','0007004010','0007004010002','0007004010002001',1,1024,'2',0.640,'1601281411350','2016-12-21 14:27:33'),('998083a8591f22e501592010a3df0565','0007004010','0007004010002','0007004010002001',1024,10240,'2',0.580,'1601281411350','2016-12-21 14:27:58'),('998083a8591f22e501592010c9cc0566','0007004010','0007004010002','0007004010002001',10240,-1,'2',0.560,'1601281411350','2016-12-21 14:28:08'),('998083a8591f22e50159201137c206b3','0007004010','0007004010003','0007004010003001',0,100000,'2',0.000,'1601281411350','2016-12-21 14:28:36'),('998083a8591f22e5015920119f8f06b5','0007004010','0007004010003','0007004010003001',100001,-1,'2',0.010,'1601281411350','2016-12-21 14:29:02'),('998083a85981248001598251dd52000a','0007004006','0007004006001','0007004006001001',1,5,'1',25.000,'1601281411350','2017-01-09 16:22:00'),('998083a8598124800159825400b6000b','0007004006','0007004006001','0007004006001001',6,6,'1',34.166,'1601281411350','2017-01-09 16:24:20'),('998083a859812480015982544c3e000c','0007004006','0007004006001','0007004006001001',7,7,'1',40.714,'1601281411350','2017-01-09 16:24:39'),('998083a859812480015982548f7b000d','0007004006','0007004006001','0007004006001001',8,8,'1',45.625,'1601281411350','2017-01-09 16:24:56'),('998083a85981248001598254e4ae000e','0007004006','0007004006001','0007004006001001',9,9,'1',49.444,'1601281411350','2017-01-09 16:25:18'),('998083a859812480015982552585000f','0007004006','0007004006001','0007004006001001',10,10,'1',52.500,'1601281411350','2017-01-09 16:25:35'),('998083a8598124800159825558800010','0007004006','0007004006001','0007004006001001',11,11,'1',55.000,'1601281411350','2017-01-09 16:25:48'),('998083a8598124800159825585650011','0007004006','0007004006001','0007004006001001',12,12,'1',57.083,'1601281411350','2017-01-09 16:25:59'),('998083a85981248001598255b5660012','0007004006','0007004006001','0007004006001001',13,13,'1',58.846,'1601281411350','2017-01-09 16:26:12'),('998083a85981248001598255e27c0013','0007004006','0007004006001','0007004006001001',14,14,'1',60.357,'1601281411350','2017-01-09 16:26:23'),('998083a8598124800159825624b60014','0007004006','0007004006001','0007004006001001',15,15,'1',61.666,'1601281411350','2017-01-09 16:26:40'),('998083a85981248001598256606e0015','0007004006','0007004006001','0007004006001001',16,16,'1',62.812,'1601281411350','2017-01-09 16:26:55'),('998083a85981248001598256b2230016','0007004006','0007004006001','0007004006001001',17,17,'1',63.823,'1601281411350','2017-01-09 16:27:16'),('998083a85981248001598256dfd70017','0007004006','0007004006001','0007004006001001',18,18,'1',64.722,'1601281411350','2017-01-09 16:27:28'),('998083a859812480015982570c920018','0007004006','0007004006001','0007004006001001',19,19,'1',65.526,'1601281411350','2017-01-09 16:27:40'),('998083a859812480015982574195001a','0007004006','0007004006001','0007004006001001',20,20,'1',66.250,'1601281411350','2017-01-09 16:27:53'),('998083a8598124800159825778a5001b','0007004006','0007004006001','0007004006001001',21,21,'1',66.904,'1601281411350','2017-01-09 16:28:07'),('998083a85981248001598257ac70001c','0007004006','0007004006001','0007004006001001',22,22,'1',67.500,'1601281411350','2017-01-09 16:28:20'),('998083a85981248001598257fc0f001d','0007004006','0007004006001','0007004006001001',23,23,'1',68.043,'1601281411350','2017-01-09 16:28:41'),('998083a859812480015982582f2c001e','0007004006','0007004006001','0007004006001001',24,24,'1',68.541,'1601281411350','2017-01-09 16:28:54'),('998083a859812480015982586401001f','0007004006','0007004006001','0007004006001001',25,25,'1',69.000,'1601281411350','2017-01-09 16:29:07'),('998083a8598124800159825898f00020','0007004006','0007004006001','0007004006001001',26,26,'1',69.423,'1601281411350','2017-01-09 16:29:21'),('998083a85981248001598258d0240021','0007004006','0007004006001','0007004006001001',27,27,'1',69.814,'1601281411350','2017-01-09 16:29:35'),('998083a85981248001598259023a0022','0007004006','0007004006001','0007004006001001',28,28,'1',70.178,'1601281411350','2017-01-09 16:29:48'),('998083a8598124800159825a14710023','0007004006','0007004006001','0007004006001001',29,29,'1',70.517,'1601281411350','2017-01-09 16:30:58'),('998083a8598124800159825a4b140024','0007004006','0007004006001','0007004006001001',30,30,'1',70.833,'1601281411350','2017-01-09 16:31:12'),('998083a8598124800159825a77c70025','0007004006','0007004006001','0007004006001001',31,31,'1',71.129,'1601281411350','2017-01-09 16:31:24'),('998083a8598124800159825ab8d60026','0007004006','0007004006001','0007004006001001',32,32,'1',71.406,'1601281411350','2017-01-09 16:31:40'),('998083a8598124800159825ae2fd0027','0007004006','0007004006001','0007004006001001',33,33,'1',71.666,'1601281411350','2017-01-09 16:31:51'),('998083a8598124800159825b13540028','0007004006','0007004006001','0007004006001001',34,34,'1',71.911,'1601281411350','2017-01-09 16:32:03'),('998083a8598124800159825b620e0029','0007004006','0007004006001','0007004006001001',35,35,'1',72.142,'1601281411350','2017-01-09 16:32:24'),('998083a8598124800159825bd4bc002a','0007004006','0007004006001','0007004006001001',36,36,'1',72.361,'1601281411350','2017-01-09 16:32:53'),('998083a8598124800159825c0627002b','0007004006','0007004006001','0007004006001001',37,37,'1',72.567,'1601281411350','2017-01-09 16:33:06'),('998083a8598124800159825c39fd002c','0007004006','0007004006001','0007004006001001',38,38,'1',72.763,'1601281411350','2017-01-09 16:33:19'),('998083a8598124800159825c6ef3002d','0007004006','0007004006001','0007004006001001',39,39,'1',72.948,'1601281411350','2017-01-09 16:33:32'),('998083a8598124800159825cb43f002e','0007004006','0007004006001','0007004006001001',40,40,'1',73.125,'1601281411350','2017-01-09 16:33:50'),('998083a8598124800159825ce6c6002f','0007004006','0007004006001','0007004006001001',41,41,'1',73.292,'1601281411350','2017-01-09 16:34:03'),('998083a8598124800159825d12570030','0007004006','0007004006001','0007004006001001',42,42,'1',73.452,'1601281411350','2017-01-09 16:34:14'),('998083a8598124800159825d3c290031','0007004006','0007004006001','0007004006001001',43,43,'1',73.604,'1601281411350','2017-01-09 16:34:25'),('998083a8598124800159825db9700032','0007004006','0007004006001','0007004006001001',44,44,'1',73.750,'1601281411350','2017-01-09 16:34:57'),('998083a8598124800159825df74a0033','0007004006','0007004006001','0007004006001001',45,45,'1',73.888,'1601281411350','2017-01-09 16:35:13'),('998083a8598124800159825e2ea00034','0007004006','0007004006001','0007004006001001',46,46,'1',74.021,'1601281411350','2017-01-09 16:35:27'),('998083a8598124800159825e67580035','0007004006','0007004006001','0007004006001001',47,47,'1',74.148,'1601281411350','2017-01-09 16:35:42'),('998083a8598124800159825ea21a0036','0007004006','0007004006001','0007004006001001',48,48,'1',74.270,'1601281411350','2017-01-09 16:35:57'),('998083a8598124800159825f31d00037','0007004006','0007004006001','0007004006001001',49,49,'1',74.387,'1601281411350','2017-01-09 16:36:33'),('998083a8598124800159825f8c910038','0007004006','0007004006001','0007004006001001',50,50,'1',74.500,'1601281411350','2017-01-09 16:36:57'),('998083a8598124800159825fbcf40039','0007004006','0007004006001','0007004006001001',51,51,'1',74.607,'1601281411350','2017-01-09 16:37:09'),('998083a8598124800159825fee2b003a','0007004006','0007004006001','0007004006001001',52,52,'1',74.711,'1601281411350','2017-01-09 16:37:22'),('998083a8598124800159826023fd003b','0007004006','0007004006001','0007004006001001',53,53,'1',74.811,'1601281411350','2017-01-09 16:37:35'),('998083a85981248001598260679e003c','0007004006','0007004006001','0007004006001001',54,54,'1',74.907,'1601281411350','2017-01-09 16:37:53'),('998083a85981248001598261daee003d','0007004006','0007004006001','0007004006001001',55,55,'1',75.000,'1601281411350','2017-01-09 16:39:28'),('998083a8598124800159826212f6003e','0007004006','0007004006001','0007004006001001',56,56,'1',75.089,'1601281411350','2017-01-09 16:39:42'),('998083a859812480015982624661003f','0007004006','0007004006001','0007004006001001',57,57,'1',75.175,'1601281411350','2017-01-09 16:39:55'),('998083a8598124800159826276cd0040','0007004006','0007004006001','0007004006001001',58,58,'1',75.258,'1601281411350','2017-01-09 16:40:08'),('998083a85981248001598262c5cb0041','0007004006','0007004006001','0007004006001001',59,59,'1',75.338,'1601281411350','2017-01-09 16:40:28'),('998083a8598124800159826539cc0042','0007004006','0007004006001','0007004006001001',60,60,'1',75.416,'1601281411350','2017-01-09 16:43:09'),('998083a85981248001598265c86e0043','0007004006','0007004006001','0007004006001001',61,61,'1',75.491,'1601281411350','2017-01-09 16:43:45'),('998083a8598124800159826603060044','0007004006','0007004006001','0007004006001001',62,62,'1',75.564,'1601281411350','2017-01-09 16:44:00'),('998083a859812480015982664b2f0045','0007004006','0007004006001','0007004006001001',63,63,'1',75.634,'1601281411350','2017-01-09 16:44:19'),('998083a859812480015982667e260046','0007004006','0007004006001','0007004006001001',64,64,'1',75.703,'1601281411350','2017-01-09 16:44:32'),('998083a85981248001598266abb10047','0007004006','0007004006001','0007004006001001',65,65,'1',75.769,'1601281411350','2017-01-09 16:44:43'),('998083a85981248001598266d7940048','0007004006','0007004006001','0007004006001001',66,66,'1',75.833,'1601281411350','2017-01-09 16:44:55'),('998083a859812480015982670aad0049','0007004006','0007004006001','0007004006001001',67,67,'1',75.895,'1601281411350','2017-01-09 16:45:08'),('998083a8598124800159826743ca004a','0007004006','0007004006001','0007004006001001',68,68,'1',75.955,'1601281411350','2017-01-09 16:45:22'),('998083a8598124800159826789ea004b','0007004006','0007004006001','0007004006001001',69,69,'1',76.014,'1601281411350','2017-01-09 16:45:40'),('998083a85981248001598267bdae004c','0007004006','0007004006001','0007004006001001',70,70,'1',76.071,'1601281411350','2017-01-09 16:45:53'),('998083a85981248001598267f303004d','0007004006','0007004006001','0007004006001001',71,71,'1',76.126,'1601281411350','2017-01-09 16:46:07'),('998083a859812480015982684b1f004e','0007004006','0007004006001','0007004006001001',72,72,'1',76.180,'1601281411350','2017-01-09 16:46:30'),('998083a8598124800159826878be004f','0007004006','0007004006001','0007004006001001',73,73,'1',76.232,'1601281411350','2017-01-09 16:46:41'),('998083a85981248001598268d35c0050','0007004006','0007004006001','0007004006001001',74,74,'1',76.283,'1601281411350','2017-01-09 16:47:05'),('998083a859812480015982690d3a0051','0007004006','0007004006001','0007004006001001',75,75,'1',76.333,'1601281411350','2017-01-09 16:47:19'),('998083a8598124800159826939030052','0007004006','0007004006001','0007004006001001',76,76,'1',76.381,'1601281411350','2017-01-09 16:47:31'),('998083a85981248001598269667a0053','0007004006','0007004006001','0007004006001001',77,77,'1',76.428,'1601281411350','2017-01-09 16:47:42'),('998083a8598124800159826992f80054','0007004006','0007004006001','0007004006001001',78,78,'1',76.474,'1601281411350','2017-01-09 16:47:54'),('998083a85981248001598269bfb90055','0007004006','0007004006001','0007004006001001',79,79,'1',76.518,'1601281411350','2017-01-09 16:48:05'),('998083a85981248001598269f2040056','0007004006','0007004006001','0007004006001001',80,80,'1',76.562,'1601281411350','2017-01-09 16:48:18'),('998083a8598124800159826a30cd0057','0007004006','0007004006001','0007004006001001',81,81,'1',76.604,'1601281411350','2017-01-09 16:48:34'),('998083a8598124800159826a610e0058','0007004006','0007004006001','0007004006001001',82,82,'1',76.646,'1601281411350','2017-01-09 16:48:46'),('998083a8598124800159826a912c0059','0007004006','0007004006001','0007004006001001',83,83,'1',76.686,'1601281411350','2017-01-09 16:48:59'),('998083a8598124800159826ac4ac005a','0007004006','0007004006001','0007004006001001',84,84,'1',76.726,'1601281411350','2017-01-09 16:49:12'),('998083a8598124800159826afc90005b','0007004006','0007004006001','0007004006001001',85,85,'1',76.764,'1601281411350','2017-01-09 16:49:26'),('998083a8598124800159826b248e005c','0007004006','0007004006001','0007004006001001',86,86,'1',76.802,'1601281411350','2017-01-09 16:49:36'),('998083a8598124800159826b4d8d005d','0007004006','0007004006001','0007004006001001',87,87,'1',76.839,'1601281411350','2017-01-09 16:49:47'),('998083a8598124800159826b7104005e','0007004006','0007004006001','0007004006001001',88,88,'1',76.875,'1601281411350','2017-01-09 16:49:56'),('998083a8598124800159826ba0a0005f','0007004006','0007004006001','0007004006001001',89,89,'1',76.910,'1601281411350','2017-01-09 16:50:08'),('998083a8598124800159826bc8660060','0007004006','0007004006001','0007004006001001',90,90,'1',76.944,'1601281411350','2017-01-09 16:50:18'),('998083a8598124800159826bf9d20061','0007004006','0007004006001','0007004006001001',91,91,'1',76.978,'1601281411350','2017-01-09 16:50:31'),('998083a8598124800159826c2cdf0062','0007004006','0007004006001','0007004006001001',92,92,'1',77.010,'1601281411350','2017-01-09 16:50:44'),('998083a8598124800159826c5a1e0063','0007004006','0007004006001','0007004006001001',93,93,'1',77.043,'1601281411350','2017-01-09 16:50:56'),('998083a8598124800159826c852e0064','0007004006','0007004006001','0007004006001001',94,94,'1',77.074,'1601281411350','2017-01-09 16:51:07'),('998083a8598124800159826cab6e0065','0007004006','0007004006001','0007004006001001',95,95,'1',77.105,'1601281411350','2017-01-09 16:51:16'),('998083a8598124800159826cdb9e0066','0007004006','0007004006001','0007004006001001',96,96,'1',77.135,'1601281411350','2017-01-09 16:51:29'),('998083a8598124800159826de2570067','0007004006','0007004006001','0007004006001001',97,97,'1',77.164,'1601281411350','2017-01-09 16:52:36'),('998083a8598124800159826e0e7b0068','0007004006','0007004006001','0007004006001001',98,98,'1',77.193,'1601281411350','2017-01-09 16:52:47'),('998083a8598124800159826e54ee0069','0007004006','0007004006001','0007004006001001',99,99,'1',77.222,'1601281411350','2017-01-09 16:53:05'),('998083a8598124800159826e90df006a','0007004006','0007004006001','0007004006001001',100,100,'1',77.250,'1601281411350','2017-01-09 16:53:21'),('998083a85981248001598270fb68006b','0007004006','0007004006001','0007004006001001',6,6,'2',0.047,'1601281411350','2017-01-09 16:55:59'),('998083a859812480015982713b8a006c','0007004006','0007004006001','0007004006001001',7,7,'2',0.057,'1601281411350','2017-01-09 16:56:16'),('998083a8598124800159827167c2006d','0007004006','0007004006001','0007004006001001',8,8,'2',0.063,'1601281411350','2017-01-09 16:56:27'),('998083a85981248001598271956c006e','0007004006','0007004006001','0007004006001001',9,9,'2',0.069,'1601281411350','2017-01-09 16:56:39'),('998083a85981248001598271ca70006f','0007004006','0007004006001','0007004006001001',10,10,'2',0.073,'1601281411350','2017-01-09 16:56:52'),('998083a85981248001598271f74a0070','0007004006','0007004006001','0007004006001001',11,11,'2',0.076,'1601281411350','2017-01-09 16:57:04'),('998083a85981248001598272458e0071','0007004006','0007004006001','0007004006001001',12,12,'2',0.079,'1601281411350','2017-01-09 16:57:24'),('998083a859812480015982728ad40072','0007004006','0007004006001','0007004006001001',13,13,'2',0.082,'1601281411350','2017-01-09 16:57:41'),('998083a85981248001598272c52c0073','0007004006','0007004006001','0007004006001001',14,14,'2',0.084,'1601281411350','2017-01-09 16:57:56'),('998083a85981248001598273021d0074','0007004006','0007004006001','0007004006001001',15,15,'2',0.086,'1601281411350','2017-01-09 16:58:12'),('998083a8598124800159827353370075','0007004006','0007004006001','0007004006001001',16,16,'2',0.087,'1601281411350','2017-01-09 16:58:33'),('998083a8598124800159827393150076','0007004006','0007004006001','0007004006001001',17,17,'2',0.089,'1601281411350','2017-01-09 16:58:49'),('998083a85981248001598273c7240077','0007004006','0007004006001','0007004006001001',18,18,'2',0.090,'1601281411350','2017-01-09 16:59:02'),('998083a85981248001598273fbba0078','0007004006','0007004006001','0007004006001001',19,19,'2',0.091,'1601281411350','2017-01-09 16:59:16'),('998083a85981248001598274323d0079','0007004006','0007004006001','0007004006001001',20,20,'2',0.092,'1601281411350','2017-01-09 16:59:30'),('998083a85981248001598274749f007a','0007004006','0007004006001','0007004006001001',21,21,'2',0.093,'1601281411350','2017-01-09 16:59:47'),('998083a85981248001598274aed4007b','0007004006','0007004006001','0007004006001001',22,22,'2',0.094,'1601281411350','2017-01-09 17:00:02'),('998083a85981248001598283b34200a3','0007004006','0007004006001','0007004006001001',23,24,'2',0.095,'1601281411350','2017-01-09 17:16:26'),('998083a85981248001598284094000a4','0007004006','0007004006001','0007004006001001',25,26,'2',0.096,'1601281411350','2017-01-09 17:16:48'),('998083a859812480015982849c2500a5','0007004006','0007004006001','0007004006001001',27,28,'2',0.097,'1601281411350','2017-01-09 17:17:25'),('998083a85981248001598284ee5e00a6','0007004006','0007004006001','0007004006001001',29,30,'2',0.098,'1601281411350','2017-01-09 17:17:46'),('998083a859812480015982854cf200a7','0007004006','0007004006001','0007004006001001',31,32,'2',0.099,'1601281411350','2017-01-09 17:18:11'),('998083a859812480015982859bb100a8','0007004006','0007004006001','0007004006001001',33,35,'2',0.100,'1601281411350','2017-01-09 17:18:31'),('998083a85981248001598285f43100a9','0007004006','0007004006001','0007004006001001',36,39,'2',0.101,'1601281411350','2017-01-09 17:18:54'),('998083a85981248001598286572e00aa','0007004006','0007004006001','0007004006001001',40,44,'2',0.102,'1601281411350','2017-01-09 17:19:19'),('998083a85981248001598286ae7500ab','0007004006','0007004006001','0007004006001001',45,50,'2',0.103,'1601281411350','2017-01-09 17:19:41'),('998083a85981248001598287076100ac','0007004006','0007004006001','0007004006001001',51,57,'2',0.104,'1601281411350','2017-01-09 17:20:04'),('998083a859812480015982876de400ad','0007004006','0007004006001','0007004006001001',58,68,'2',0.105,'1601281411350','2017-01-09 17:20:30'),('998083a85981248001598287e13b00ae','0007004006','0007004006001','0007004006001001',69,82,'2',0.106,'1601281411350','2017-01-09 17:21:00'),('998083a859812480015982884f5e00af','0007004006','0007004006001','0007004006001001',83,100,'2',0.107,'1601281411350','2017-01-09 17:21:28'),('998083a859812480015982a5660800b0','0007004007','0007004007001','0007004007001001',0,-1,'1',0.000,'1601281411350','2017-01-09 17:53:14'),('998083a859812480015982a5e1fa00b1','0007004007','0007004007001','0007004007001001',0,-1,'2',0.000,'1601281411350','2017-01-09 17:53:46'),('998083a8598124800159861e967800b2','0007004010','0007004010004','0007004010004001',0,-1,'2',0.320,'1601281411350','2017-01-10 10:04:28'),('998083a8598124800159861f3dc200b3','0007004010','0007004010005','0007004010005001',0,-1,'2',0.000,'1601281411350','2017-01-10 10:05:11'),('998083a8598124800159861f8acd00b4','0007004010','0007004010006','0007004010006001',0,-1,'2',0.000,'1601281411350','2017-01-10 10:05:31');


-- 备案中心+obs1.2 升级sql（2017年2月21日后合并）
-- updateSQL2017-01-06-备案中心-ecmc权限.sql
-- #删除之前的权限
DELETE from `ecmc_sys_authority` where  id in('40289305591b912301591bccaebd0246','402893ef592463e9015924711a880000','402893ef592463e901592471f0760001');
DELETE from `ecmc_sys_roleauth` where  id in('4028993d5963351901596337e5b80019','4028993d5963351901596337e5b9001b','4028993d5963351901596337e5b9001a','40289099592525c30159252e2dad00fe','40289099592525c30159252e2daf0114','40289099592525c30159252e2db00115','4028995f596e206a01596e3cd7e0032b','4028995f596e206a01596e3c1c610228','4028995f596e206a01596e3c1c630250','4028995f596e206a01596e3c1c630251','4028995f596e206a01596e3d51b80353','40289091596e3d6801596e4568e90101','40289091596e3d6801596e4568ea0117','40289091596e3d6801596e4568ea0118');
DELETE from `ecmc_sys_menu` where  id in('40289361591b889401591b8ac4a30000');
DELETE from `ecmc_sys_rolemenu` where  id in ('4028993d5963351901596337e5b60007','40289099592525c30159252e2d97000c','4028995f596e206a01596e3cd7d40278','40289091596e3d6801596e4568d7000c','4028995f596e206a01596e3d51b60335');



-- #备案权限
INSERT INTO `ecmc_sys_authority` VALUES ('40289305591b912301591bccaebd0246', '备案查询', NULL, '2016-12-20 18:35:16', '2c91808256f81c44015702bbf9510000', '1', 'ui:unitquery;\nhttp:/ecmc/record/getecmcrecordlist.do;\nhttp:/ecmc/record/getecmcrecordcount.do;\nhttp:/ecmc/record/getrecordByid.do;\nhttp:/ecmc/record/downRecordFile.do;\nhttp:/ecmc/record/downzip.do;\nhttp:/ecmc/physical/datacenter/getlistdatacenter.do', '40289361591b889401591b8ac4a30000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893ef592463e9015924711a880000', '备案修改', NULL, '2016-12-22 10:51:49', '2c91808256f81c44015702bbf9510000', '1', 'ui:updateunit;\nhttp:/ecmc/record/updaterecordstatus.do;\nhttp:/ecmc/record/recordreturn.do;\nhttp:/ecmc/record/updatedetail.do;\nhttp:/ecmc/record/updatedetailbyweb.do;', '40289361591b889401591b8ac4a30000', '0');
INSERT INTO `ecmc_sys_authority` VALUES ('402893ef592463e901592471f0760001', '备案删除', NULL, '2016-12-22 10:52:44', '2c91808256f81c44015702bbf9510000', '1', 'ui:delatedunit;\nhttp:/ecmc/record/deletedrecord.do;', '40289361591b889401591b8ac4a30000', '0');


-- #备案权限与角色关系
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028993d5963351901596337e5b80019', '40289092543bd6a801543bfeb3fa000a', '40289305591b912301591bccaebd0246');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028993d5963351901596337e5b9001b', '40289092543bd6a801543bfeb3fa000a', '402893ef592463e9015924711a880000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028993d5963351901596337e5b9001a', '40289092543bd6a801543bfeb3fa000a', '402893ef592463e901592471f0760001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028995f596e206a01596e3cd7e0032b', '40289092543bd6a801543bfee6a8000b', '40289305591b912301591bccaebd0246');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028995f596e206a01596e3c1c610228', '40289092543bd6a801543bff30f2000c', '40289305591b912301591bccaebd0246');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028995f596e206a01596e3c1c630250', '40289092543bd6a801543bff30f2000c', '402893ef592463e9015924711a880000');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028995f596e206a01596e3c1c630251', '40289092543bd6a801543bff30f2000c', '402893ef592463e901592471f0760001');
INSERT INTO `ecmc_sys_roleauth` VALUES ('4028995f596e206a01596e3d51b80353', '40289092543bd6a801543bff655b000d', '40289305591b912301591bccaebd0246');


-- #备案菜单
INSERT INTO `ecmc_sys_menu` VALUES ('40289361591b889401591b8ac4a30000', '备案管理', '', 'app.unit', 'ff8080815438ac44015438c14b110006', 50, '2016-12-20 17:23:16', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-icp', '0');



-- #备案菜单和角色
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028993d5963351901596337e5b60007', '40289092543bd6a801543bfeb3fa000a', '40289361591b889401591b8ac4a30000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028995f596e206a01596e3cd7d40278', '40289092543bd6a801543bfee6a8000b', '40289361591b889401591b8ac4a30000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('40289091596e3d6801596e4568d7000c', '40289092543bd6a801543bff30f2000c', '40289361591b889401591b8ac4a30000');
INSERT INTO `ecmc_sys_rolemenu` VALUES ('4028995f596e206a01596e3d51b60335', '40289092543bd6a801543bff655b000d', '40289361591b889401591b8ac4a30000');

-- updateSQL20170104-备案中心-website_info.sql
DROP TABLE IF EXISTS `website_info`;
CREATE TABLE `website_info` (
  `web_id` varchar(32) NOT NULL COMMENT 'ID',
  `web_name` varchar(100) DEFAULT NULL,
  `domain_name` varchar(100) DEFAULT NULL,
  `domain_url` varchar(100) DEFAULT NULL,
  `web_service` varchar(32) DEFAULT NULL,
  `service_ip` varchar(20) DEFAULT NULL,
  `service_content` varchar(1000) DEFAULT NULL,
  `web_language` varchar(1000) DEFAULT NULL,
  `web_special` char(1) DEFAULT NULL,
  `special_no` varchar(32) DEFAULT NULL,
  `web_duty_name` varchar(100) DEFAULT NULL,
  `duty_certificate_type` char(1) DEFAULT NULL,
  `duty_certificate_no` varchar(100) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `duty_phone` varchar(11) DEFAULT NULL,
  `duty_email` varchar(32) DEFAULT NULL,
  `duty_qq` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `progress` char(1) DEFAULT NULL,
  `web_record_no` varchar(100) DEFAULT NULL,
  `unit_id` varchar(32) DEFAULT NULL,
  `duty_fileId` varchar(32) DEFAULT NULL,
  `domain_fileId` varchar(32) DEFAULT NULL,
  `special_fileId` varchar(32) DEFAULT NULL,
  `dc_id` varchar(32) NOT NULL,
  `isChange` char(1) DEFAULT '1' COMMENT '是否变更，1否，2是',
  PRIMARY KEY (`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- updateSQL20170104-备案中心-apply_info.sql
DROP TABLE IF EXISTS `apply_info`;
CREATE TABLE `apply_info` (
  `apply_id` varchar(32) NOT NULL COMMENT 'ID',
  `unit_id` varchar(32) DEFAULT NULL,
  `web_id` varchar(32) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `record_type` char(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `return_type` char(1) DEFAULT NULL,
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- updateSQL20170104-备案中心-cloud_area.sql
DROP TABLE IF EXISTS `cloud_area`;
CREATE TABLE `cloud_area` (
  `code` varchar(10) NOT NULL COMMENT '行政区域表',
  `parentcode` varchar(10) DEFAULT NULL,
  `cityname` varchar(64) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_area
-- ----------------------------
INSERT INTO `cloud_area` VALUES ('110000', null, '北京市');
INSERT INTO `cloud_area` VALUES ('110100', 110000, '市辖区');
INSERT INTO `cloud_area` VALUES ('110101', 110100, '东城区');
INSERT INTO `cloud_area` VALUES ('110102', 110100, '西城区');
INSERT INTO `cloud_area` VALUES ('110105', 110100, '朝阳区');
INSERT INTO `cloud_area` VALUES ('110106', 110100, '丰台区');
INSERT INTO `cloud_area` VALUES ('110107', 110100, '石景山区');
INSERT INTO `cloud_area` VALUES ('110108', 110100, '海淀区');
INSERT INTO `cloud_area` VALUES ('110109', 110100, '门头沟区');
INSERT INTO `cloud_area` VALUES ('110111', 110100, '房山区');
INSERT INTO `cloud_area` VALUES ('110112', 110100, '通州区');
INSERT INTO `cloud_area` VALUES ('110113', 110100, '顺义区');
INSERT INTO `cloud_area` VALUES ('110114', 110100, '昌平区');
INSERT INTO `cloud_area` VALUES ('110115', 110100, '大兴区');
INSERT INTO `cloud_area` VALUES ('110116', 110100, '怀柔区');
INSERT INTO `cloud_area` VALUES ('110117', 110100, '平谷区');
INSERT INTO `cloud_area` VALUES ('110200', 110000, '县');
INSERT INTO `cloud_area` VALUES ('110228', 110200, '密云县');
INSERT INTO `cloud_area` VALUES ('110229', 110200, '延庆县');
INSERT INTO `cloud_area` VALUES ('120000', null, '天津市');
INSERT INTO `cloud_area` VALUES ('120100', 120000, '市辖区');
INSERT INTO `cloud_area` VALUES ('120101', 120100, '和平区');
INSERT INTO `cloud_area` VALUES ('120102', 120100, '河东区');
INSERT INTO `cloud_area` VALUES ('120103', 120100, '河西区');
INSERT INTO `cloud_area` VALUES ('120104', 120100, '南开区');
INSERT INTO `cloud_area` VALUES ('120105', 120100, '河北区');
INSERT INTO `cloud_area` VALUES ('120106', 120100, '红桥区');
INSERT INTO `cloud_area` VALUES ('120110', 120100, '东丽区');
INSERT INTO `cloud_area` VALUES ('120111', 120100, '西青区');
INSERT INTO `cloud_area` VALUES ('120112', 120100, '津南区');
INSERT INTO `cloud_area` VALUES ('120113', 120100, '北辰区');
INSERT INTO `cloud_area` VALUES ('120114', 120100, '武清区');
INSERT INTO `cloud_area` VALUES ('120115', 120100, '宝坻区');
INSERT INTO `cloud_area` VALUES ('120116', 120100, '滨海新区');
INSERT INTO `cloud_area` VALUES ('120117', 120100, '宁河区');
INSERT INTO `cloud_area` VALUES ('120118', 120100, '静海区');
INSERT INTO `cloud_area` VALUES ('120200', 120000, '县');
INSERT INTO `cloud_area` VALUES ('120225', 120200, '蓟县');
INSERT INTO `cloud_area` VALUES ('130000', null, '河北省');
INSERT INTO `cloud_area` VALUES ('130100', 130000, '石家庄市');
INSERT INTO `cloud_area` VALUES ('130101', 130100, '市辖区');
INSERT INTO `cloud_area` VALUES ('130102', 130100, '长安区');
INSERT INTO `cloud_area` VALUES ('130104', 130100, '桥西区');
INSERT INTO `cloud_area` VALUES ('130105', 130100, '新华区');
INSERT INTO `cloud_area` VALUES ('130107', 130100, '井陉矿区');
INSERT INTO `cloud_area` VALUES ('130108', 130100, '裕华区');
INSERT INTO `cloud_area` VALUES ('130109', 130100, '藁城区');
INSERT INTO `cloud_area` VALUES ('130110', 130100, '鹿泉区');
INSERT INTO `cloud_area` VALUES ('130111', 130100, '栾城区');
INSERT INTO `cloud_area` VALUES ('130121', 130100, '井陉县');
INSERT INTO `cloud_area` VALUES ('130123', 130100, '正定县');
INSERT INTO `cloud_area` VALUES ('130125', 130100, '行唐县');
INSERT INTO `cloud_area` VALUES ('130126', 130100, '灵寿县');
INSERT INTO `cloud_area` VALUES ('130127', 130100, '高邑县');
INSERT INTO `cloud_area` VALUES ('130128', 130100, '深泽县');
INSERT INTO `cloud_area` VALUES ('130129', 130100, '赞皇县');
INSERT INTO `cloud_area` VALUES ('130130', 130100, '无极县');
INSERT INTO `cloud_area` VALUES ('130131', 130100, '平山县');
INSERT INTO `cloud_area` VALUES ('130132', 130100, '元氏县');
INSERT INTO `cloud_area` VALUES ('130133', 130100, '赵县');
INSERT INTO `cloud_area` VALUES ('130183', 130100, '晋州市');
INSERT INTO `cloud_area` VALUES ('130184', 130100, '新乐市');
INSERT INTO `cloud_area` VALUES ('130200', 130000, '唐山市');
INSERT INTO `cloud_area` VALUES ('130201', 130200, '市辖区');
INSERT INTO `cloud_area` VALUES ('130202', 130200, '路南区');
INSERT INTO `cloud_area` VALUES ('130203', 130200, '路北区');
INSERT INTO `cloud_area` VALUES ('130204', 130200, '古冶区');
INSERT INTO `cloud_area` VALUES ('130205', 130200, '开平区');
INSERT INTO `cloud_area` VALUES ('130207', 130200, '丰南区');
INSERT INTO `cloud_area` VALUES ('130208', 130200, '丰润区');
INSERT INTO `cloud_area` VALUES ('130209', 130200, '曹妃甸区');
INSERT INTO `cloud_area` VALUES ('130223', 130200, '滦县');
INSERT INTO `cloud_area` VALUES ('130224', 130200, '滦南县');
INSERT INTO `cloud_area` VALUES ('130225', 130200, '乐亭县');
INSERT INTO `cloud_area` VALUES ('130227', 130200, '迁西县');
INSERT INTO `cloud_area` VALUES ('130229', 130200, '玉田县');
INSERT INTO `cloud_area` VALUES ('130281', 130200, '遵化市');
INSERT INTO `cloud_area` VALUES ('130283', 130200, '迁安市');
INSERT INTO `cloud_area` VALUES ('130300', 130000, '秦皇岛市');
INSERT INTO `cloud_area` VALUES ('130301', 130300, '市辖区');
INSERT INTO `cloud_area` VALUES ('130302', 130300, '海港区');
INSERT INTO `cloud_area` VALUES ('130303', 130300, '山海关区');
INSERT INTO `cloud_area` VALUES ('130304', 130300, '北戴河区');
INSERT INTO `cloud_area` VALUES ('130306', 130300, '抚宁区');
INSERT INTO `cloud_area` VALUES ('130321', 130300, '青龙满族自治县');
INSERT INTO `cloud_area` VALUES ('130322', 130300, '昌黎县');
INSERT INTO `cloud_area` VALUES ('130324', 130300, '卢龙县');
INSERT INTO `cloud_area` VALUES ('130400', 130000, '邯郸市');
INSERT INTO `cloud_area` VALUES ('130401', 130400, '市辖区');
INSERT INTO `cloud_area` VALUES ('130402', 130400, '邯山区');
INSERT INTO `cloud_area` VALUES ('130403', 130400, '丛台区');
INSERT INTO `cloud_area` VALUES ('130404', 130400, '复兴区');
INSERT INTO `cloud_area` VALUES ('130406', 130400, '峰峰矿区');
INSERT INTO `cloud_area` VALUES ('130421', 130400, '邯郸县');
INSERT INTO `cloud_area` VALUES ('130423', 130400, '临漳县');
INSERT INTO `cloud_area` VALUES ('130424', 130400, '成安县');
INSERT INTO `cloud_area` VALUES ('130425', 130400, '大名县');
INSERT INTO `cloud_area` VALUES ('130426', 130400, '涉县');
INSERT INTO `cloud_area` VALUES ('130427', 130400, '磁县');
INSERT INTO `cloud_area` VALUES ('130428', 130400, '肥乡县');
INSERT INTO `cloud_area` VALUES ('130429', 130400, '永年县');
INSERT INTO `cloud_area` VALUES ('130430', 130400, '邱县');
INSERT INTO `cloud_area` VALUES ('130431', 130400, '鸡泽县');
INSERT INTO `cloud_area` VALUES ('130432', 130400, '广平县');
INSERT INTO `cloud_area` VALUES ('130433', 130400, '馆陶县');
INSERT INTO `cloud_area` VALUES ('130434', 130400, '魏县');
INSERT INTO `cloud_area` VALUES ('130435', 130400, '曲周县');
INSERT INTO `cloud_area` VALUES ('130481', 130400, '武安市');
INSERT INTO `cloud_area` VALUES ('130500', 130000, '邢台市');
INSERT INTO `cloud_area` VALUES ('130501', 130500, '市辖区');
INSERT INTO `cloud_area` VALUES ('130502', 130500, '桥东区');
INSERT INTO `cloud_area` VALUES ('130503', 130500, '桥西区');
INSERT INTO `cloud_area` VALUES ('130521', 130500, '邢台县');
INSERT INTO `cloud_area` VALUES ('130522', 130500, '临城县');
INSERT INTO `cloud_area` VALUES ('130523', 130500, '内丘县');
INSERT INTO `cloud_area` VALUES ('130524', 130500, '柏乡县');
INSERT INTO `cloud_area` VALUES ('130525', 130500, '隆尧县');
INSERT INTO `cloud_area` VALUES ('130526', 130500, '任县');
INSERT INTO `cloud_area` VALUES ('130527', 130500, '南和县');
INSERT INTO `cloud_area` VALUES ('130528', 130500, '宁晋县');
INSERT INTO `cloud_area` VALUES ('130529', 130500, '巨鹿县');
INSERT INTO `cloud_area` VALUES ('130530', 130500, '新河县');
INSERT INTO `cloud_area` VALUES ('130531', 130500, '广宗县');
INSERT INTO `cloud_area` VALUES ('130532', 130500, '平乡县');
INSERT INTO `cloud_area` VALUES ('130533', 130500, '威县');
INSERT INTO `cloud_area` VALUES ('130534', 130500, '清河县');
INSERT INTO `cloud_area` VALUES ('130535', 130500, '临西县');
INSERT INTO `cloud_area` VALUES ('130581', 130500, '南宫市');
INSERT INTO `cloud_area` VALUES ('130582', 130500, '沙河市');
INSERT INTO `cloud_area` VALUES ('130600', 130000, '保定市');
INSERT INTO `cloud_area` VALUES ('130601', 130600, '市辖区');
INSERT INTO `cloud_area` VALUES ('130602', 130600, '竞秀区');
INSERT INTO `cloud_area` VALUES ('130606', 130600, '莲池区');
INSERT INTO `cloud_area` VALUES ('130607', 130600, '满城区');
INSERT INTO `cloud_area` VALUES ('130608', 130600, '清苑区');
INSERT INTO `cloud_area` VALUES ('130609', 130600, '徐水区');
INSERT INTO `cloud_area` VALUES ('130623', 130600, '涞水县');
INSERT INTO `cloud_area` VALUES ('130624', 130600, '阜平县');
INSERT INTO `cloud_area` VALUES ('130626', 130600, '定兴县');
INSERT INTO `cloud_area` VALUES ('130627', 130600, '唐县');
INSERT INTO `cloud_area` VALUES ('130628', 130600, '高阳县');
INSERT INTO `cloud_area` VALUES ('130629', 130600, '容城县');
INSERT INTO `cloud_area` VALUES ('130630', 130600, '涞源县');
INSERT INTO `cloud_area` VALUES ('130631', 130600, '望都县');
INSERT INTO `cloud_area` VALUES ('130632', 130600, '安新县');
INSERT INTO `cloud_area` VALUES ('130633', 130600, '易县');
INSERT INTO `cloud_area` VALUES ('130634', 130600, '曲阳县');
INSERT INTO `cloud_area` VALUES ('130635', 130600, '蠡县');
INSERT INTO `cloud_area` VALUES ('130636', 130600, '顺平县');
INSERT INTO `cloud_area` VALUES ('130637', 130600, '博野县');
INSERT INTO `cloud_area` VALUES ('130638', 130600, '雄县');
INSERT INTO `cloud_area` VALUES ('130681', 130600, '涿州市');
INSERT INTO `cloud_area` VALUES ('130683', 130600, '安国市');
INSERT INTO `cloud_area` VALUES ('130684', 130600, '高碑店市');
INSERT INTO `cloud_area` VALUES ('130700', 130000, '张家口市');
INSERT INTO `cloud_area` VALUES ('130701', 130700, '市辖区');
INSERT INTO `cloud_area` VALUES ('130702', 130700, '桥东区');
INSERT INTO `cloud_area` VALUES ('130703', 130700, '桥西区');
INSERT INTO `cloud_area` VALUES ('130705', 130700, '宣化区');
INSERT INTO `cloud_area` VALUES ('130706', 130700, '下花园区');
INSERT INTO `cloud_area` VALUES ('130721', 130700, '宣化县');
INSERT INTO `cloud_area` VALUES ('130722', 130700, '张北县');
INSERT INTO `cloud_area` VALUES ('130723', 130700, '康保县');
INSERT INTO `cloud_area` VALUES ('130724', 130700, '沽源县');
INSERT INTO `cloud_area` VALUES ('130725', 130700, '尚义县');
INSERT INTO `cloud_area` VALUES ('130726', 130700, '蔚县');
INSERT INTO `cloud_area` VALUES ('130727', 130700, '阳原县');
INSERT INTO `cloud_area` VALUES ('130728', 130700, '怀安县');
INSERT INTO `cloud_area` VALUES ('130729', 130700, '万全县');
INSERT INTO `cloud_area` VALUES ('130730', 130700, '怀来县');
INSERT INTO `cloud_area` VALUES ('130731', 130700, '涿鹿县');
INSERT INTO `cloud_area` VALUES ('130732', 130700, '赤城县');
INSERT INTO `cloud_area` VALUES ('130733', 130700, '崇礼县');
INSERT INTO `cloud_area` VALUES ('130800', 130000, '承德市');
INSERT INTO `cloud_area` VALUES ('130801', 130800, '市辖区');
INSERT INTO `cloud_area` VALUES ('130802', 130800, '双桥区');
INSERT INTO `cloud_area` VALUES ('130803', 130800, '双滦区');
INSERT INTO `cloud_area` VALUES ('130804', 130800, '鹰手营子矿区');
INSERT INTO `cloud_area` VALUES ('130821', 130800, '承德县');
INSERT INTO `cloud_area` VALUES ('130822', 130800, '兴隆县');
INSERT INTO `cloud_area` VALUES ('130823', 130800, '平泉县');
INSERT INTO `cloud_area` VALUES ('130824', 130800, '滦平县');
INSERT INTO `cloud_area` VALUES ('130825', 130800, '隆化县');
INSERT INTO `cloud_area` VALUES ('130826', 130800, '丰宁满族自治县');
INSERT INTO `cloud_area` VALUES ('130827', 130800, '宽城满族自治县');
INSERT INTO `cloud_area` VALUES ('130828', 130800, '围场满族蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('130900', 130000, '沧州市');
INSERT INTO `cloud_area` VALUES ('130901', 130900, '市辖区');
INSERT INTO `cloud_area` VALUES ('130902', 130900, '新华区');
INSERT INTO `cloud_area` VALUES ('130903', 130900, '运河区');
INSERT INTO `cloud_area` VALUES ('130921', 130900, '沧县');
INSERT INTO `cloud_area` VALUES ('130922', 130900, '青县');
INSERT INTO `cloud_area` VALUES ('130923', 130900, '东光县');
INSERT INTO `cloud_area` VALUES ('130924', 130900, '海兴县');
INSERT INTO `cloud_area` VALUES ('130925', 130900, '盐山县');
INSERT INTO `cloud_area` VALUES ('130926', 130900, '肃宁县');
INSERT INTO `cloud_area` VALUES ('130927', 130900, '南皮县');
INSERT INTO `cloud_area` VALUES ('130928', 130900, '吴桥县');
INSERT INTO `cloud_area` VALUES ('130929', 130900, '献县');
INSERT INTO `cloud_area` VALUES ('130930', 130900, '孟村回族自治县');
INSERT INTO `cloud_area` VALUES ('130981', 130900, '泊头市');
INSERT INTO `cloud_area` VALUES ('130982', 130900, '任丘市');
INSERT INTO `cloud_area` VALUES ('130983', 130900, '黄骅市');
INSERT INTO `cloud_area` VALUES ('130984', 130900, '河间市');
INSERT INTO `cloud_area` VALUES ('131000', 130000, '廊坊市');
INSERT INTO `cloud_area` VALUES ('131001', 131000, '市辖区');
INSERT INTO `cloud_area` VALUES ('131002', 131000, '安次区');
INSERT INTO `cloud_area` VALUES ('131003', 131000, '广阳区');
INSERT INTO `cloud_area` VALUES ('131022', 131000, '固安县');
INSERT INTO `cloud_area` VALUES ('131023', 131000, '永清县');
INSERT INTO `cloud_area` VALUES ('131024', 131000, '香河县');
INSERT INTO `cloud_area` VALUES ('131025', 131000, '大城县');
INSERT INTO `cloud_area` VALUES ('131026', 131000, '文安县');
INSERT INTO `cloud_area` VALUES ('131028', 131000, '大厂回族自治县');
INSERT INTO `cloud_area` VALUES ('131081', 131000, '霸州市');
INSERT INTO `cloud_area` VALUES ('131082', 131000, '三河市');
INSERT INTO `cloud_area` VALUES ('131100', 130000, '衡水市');
INSERT INTO `cloud_area` VALUES ('131101', 131100, '市辖区');
INSERT INTO `cloud_area` VALUES ('131102', 131100, '桃城区');
INSERT INTO `cloud_area` VALUES ('131121', 131100, '枣强县');
INSERT INTO `cloud_area` VALUES ('131122', 131100, '武邑县');
INSERT INTO `cloud_area` VALUES ('131123', 131100, '武强县');
INSERT INTO `cloud_area` VALUES ('131124', 131100, '饶阳县');
INSERT INTO `cloud_area` VALUES ('131125', 131100, '安平县');
INSERT INTO `cloud_area` VALUES ('131126', 131100, '故城县');
INSERT INTO `cloud_area` VALUES ('131127', 131100, '景县');
INSERT INTO `cloud_area` VALUES ('131128', 131100, '阜城县');
INSERT INTO `cloud_area` VALUES ('131181', 131100, '冀州市');
INSERT INTO `cloud_area` VALUES ('131182', 131100, '深州市');
INSERT INTO `cloud_area` VALUES ('139000', 130000, '省直辖县级行政区划');
INSERT INTO `cloud_area` VALUES ('139001', 139000, '定州市');
INSERT INTO `cloud_area` VALUES ('139002', 139000, '辛集市');
INSERT INTO `cloud_area` VALUES ('140000', null, '山西省');
INSERT INTO `cloud_area` VALUES ('140100', 140000, '太原市');
INSERT INTO `cloud_area` VALUES ('140101', 140100, '市辖区');
INSERT INTO `cloud_area` VALUES ('140105', 140100, '小店区');
INSERT INTO `cloud_area` VALUES ('140106', 140100, '迎泽区');
INSERT INTO `cloud_area` VALUES ('140107', 140100, '杏花岭区');
INSERT INTO `cloud_area` VALUES ('140108', 140100, '尖草坪区');
INSERT INTO `cloud_area` VALUES ('140109', 140100, '万柏林区');
INSERT INTO `cloud_area` VALUES ('140110', 140100, '晋源区');
INSERT INTO `cloud_area` VALUES ('140121', 140100, '清徐县');
INSERT INTO `cloud_area` VALUES ('140122', 140100, '阳曲县');
INSERT INTO `cloud_area` VALUES ('140123', 140100, '娄烦县');
INSERT INTO `cloud_area` VALUES ('140181', 140100, '古交市');
INSERT INTO `cloud_area` VALUES ('140200', 140000, '大同市');
INSERT INTO `cloud_area` VALUES ('140201', 140200, '市辖区');
INSERT INTO `cloud_area` VALUES ('140202', 140200, '城区');
INSERT INTO `cloud_area` VALUES ('140203', 140200, '矿区');
INSERT INTO `cloud_area` VALUES ('140211', 140200, '南郊区');
INSERT INTO `cloud_area` VALUES ('140212', 140200, '新荣区');
INSERT INTO `cloud_area` VALUES ('140221', 140200, '阳高县');
INSERT INTO `cloud_area` VALUES ('140222', 140200, '天镇县');
INSERT INTO `cloud_area` VALUES ('140223', 140200, '广灵县');
INSERT INTO `cloud_area` VALUES ('140224', 140200, '灵丘县');
INSERT INTO `cloud_area` VALUES ('140225', 140200, '浑源县');
INSERT INTO `cloud_area` VALUES ('140226', 140200, '左云县');
INSERT INTO `cloud_area` VALUES ('140227', 140200, '大同县');
INSERT INTO `cloud_area` VALUES ('140300', 140000, '阳泉市');
INSERT INTO `cloud_area` VALUES ('140301', 140300, '市辖区');
INSERT INTO `cloud_area` VALUES ('140302', 140300, '城区');
INSERT INTO `cloud_area` VALUES ('140303', 140300, '矿区');
INSERT INTO `cloud_area` VALUES ('140311', 140300, '郊区');
INSERT INTO `cloud_area` VALUES ('140321', 140300, '平定县');
INSERT INTO `cloud_area` VALUES ('140322', 140300, '盂县');
INSERT INTO `cloud_area` VALUES ('140400', 140000, '长治市');
INSERT INTO `cloud_area` VALUES ('140401', 140400, '市辖区');
INSERT INTO `cloud_area` VALUES ('140402', 140400, '城区');
INSERT INTO `cloud_area` VALUES ('140411', 140400, '郊区');
INSERT INTO `cloud_area` VALUES ('140421', 140400, '长治县');
INSERT INTO `cloud_area` VALUES ('140423', 140400, '襄垣县');
INSERT INTO `cloud_area` VALUES ('140424', 140400, '屯留县');
INSERT INTO `cloud_area` VALUES ('140425', 140400, '平顺县');
INSERT INTO `cloud_area` VALUES ('140426', 140400, '黎城县');
INSERT INTO `cloud_area` VALUES ('140427', 140400, '壶关县');
INSERT INTO `cloud_area` VALUES ('140428', 140400, '长子县');
INSERT INTO `cloud_area` VALUES ('140429', 140400, '武乡县');
INSERT INTO `cloud_area` VALUES ('140430', 140400, '沁县');
INSERT INTO `cloud_area` VALUES ('140431', 140400, '沁源县');
INSERT INTO `cloud_area` VALUES ('140481', 140400, '潞城市');
INSERT INTO `cloud_area` VALUES ('140500', 140000, '晋城市');
INSERT INTO `cloud_area` VALUES ('140501', 140500, '市辖区');
INSERT INTO `cloud_area` VALUES ('140502', 140500, '城区');
INSERT INTO `cloud_area` VALUES ('140521', 140500, '沁水县');
INSERT INTO `cloud_area` VALUES ('140522', 140500, '阳城县');
INSERT INTO `cloud_area` VALUES ('140524', 140500, '陵川县');
INSERT INTO `cloud_area` VALUES ('140525', 140500, '泽州县');
INSERT INTO `cloud_area` VALUES ('140581', 140500, '高平市');
INSERT INTO `cloud_area` VALUES ('140600', 140000, '朔州市');
INSERT INTO `cloud_area` VALUES ('140601', 140600, '市辖区');
INSERT INTO `cloud_area` VALUES ('140602', 140600, '朔城区');
INSERT INTO `cloud_area` VALUES ('140603', 140600, '平鲁区');
INSERT INTO `cloud_area` VALUES ('140621', 140600, '山阴县');
INSERT INTO `cloud_area` VALUES ('140622', 140600, '应县');
INSERT INTO `cloud_area` VALUES ('140623', 140600, '右玉县');
INSERT INTO `cloud_area` VALUES ('140624', 140600, '怀仁县');
INSERT INTO `cloud_area` VALUES ('140700', 140000, '晋中市');
INSERT INTO `cloud_area` VALUES ('140701', 140700, '市辖区');
INSERT INTO `cloud_area` VALUES ('140702', 140700, '榆次区');
INSERT INTO `cloud_area` VALUES ('140721', 140700, '榆社县');
INSERT INTO `cloud_area` VALUES ('140722', 140700, '左权县');
INSERT INTO `cloud_area` VALUES ('140723', 140700, '和顺县');
INSERT INTO `cloud_area` VALUES ('140724', 140700, '昔阳县');
INSERT INTO `cloud_area` VALUES ('140725', 140700, '寿阳县');
INSERT INTO `cloud_area` VALUES ('140726', 140700, '太谷县');
INSERT INTO `cloud_area` VALUES ('140727', 140700, '祁县');
INSERT INTO `cloud_area` VALUES ('140728', 140700, '平遥县');
INSERT INTO `cloud_area` VALUES ('140729', 140700, '灵石县');
INSERT INTO `cloud_area` VALUES ('140781', 140700, '介休市');
INSERT INTO `cloud_area` VALUES ('140800', 140000, '运城市');
INSERT INTO `cloud_area` VALUES ('140801', 140800, '市辖区');
INSERT INTO `cloud_area` VALUES ('140802', 140800, '盐湖区');
INSERT INTO `cloud_area` VALUES ('140821', 140800, '临猗县');
INSERT INTO `cloud_area` VALUES ('140822', 140800, '万荣县');
INSERT INTO `cloud_area` VALUES ('140823', 140800, '闻喜县');
INSERT INTO `cloud_area` VALUES ('140824', 140800, '稷山县');
INSERT INTO `cloud_area` VALUES ('140825', 140800, '新绛县');
INSERT INTO `cloud_area` VALUES ('140826', 140800, '绛县');
INSERT INTO `cloud_area` VALUES ('140827', 140800, '垣曲县');
INSERT INTO `cloud_area` VALUES ('140828', 140800, '夏县');
INSERT INTO `cloud_area` VALUES ('140829', 140800, '平陆县');
INSERT INTO `cloud_area` VALUES ('140830', 140800, '芮城县');
INSERT INTO `cloud_area` VALUES ('140881', 140800, '永济市');
INSERT INTO `cloud_area` VALUES ('140882', 140800, '河津市');
INSERT INTO `cloud_area` VALUES ('140900', 140000, '忻州市');
INSERT INTO `cloud_area` VALUES ('140901', 140900, '市辖区');
INSERT INTO `cloud_area` VALUES ('140902', 140900, '忻府区');
INSERT INTO `cloud_area` VALUES ('140921', 140900, '定襄县');
INSERT INTO `cloud_area` VALUES ('140922', 140900, '五台县');
INSERT INTO `cloud_area` VALUES ('140923', 140900, '代县');
INSERT INTO `cloud_area` VALUES ('140924', 140900, '繁峙县');
INSERT INTO `cloud_area` VALUES ('140925', 140900, '宁武县');
INSERT INTO `cloud_area` VALUES ('140926', 140900, '静乐县');
INSERT INTO `cloud_area` VALUES ('140927', 140900, '神池县');
INSERT INTO `cloud_area` VALUES ('140928', 140900, '五寨县');
INSERT INTO `cloud_area` VALUES ('140929', 140900, '岢岚县');
INSERT INTO `cloud_area` VALUES ('140930', 140900, '河曲县');
INSERT INTO `cloud_area` VALUES ('140931', 140900, '保德县');
INSERT INTO `cloud_area` VALUES ('140932', 140900, '偏关县');
INSERT INTO `cloud_area` VALUES ('140981', 140900, '原平市');
INSERT INTO `cloud_area` VALUES ('141000', 140000, '临汾市');
INSERT INTO `cloud_area` VALUES ('141001', 141000, '市辖区');
INSERT INTO `cloud_area` VALUES ('141002', 141000, '尧都区');
INSERT INTO `cloud_area` VALUES ('141021', 141000, '曲沃县');
INSERT INTO `cloud_area` VALUES ('141022', 141000, '翼城县');
INSERT INTO `cloud_area` VALUES ('141023', 141000, '襄汾县');
INSERT INTO `cloud_area` VALUES ('141024', 141000, '洪洞县');
INSERT INTO `cloud_area` VALUES ('141025', 141000, '古县');
INSERT INTO `cloud_area` VALUES ('141026', 141000, '安泽县');
INSERT INTO `cloud_area` VALUES ('141027', 141000, '浮山县');
INSERT INTO `cloud_area` VALUES ('141028', 141000, '吉县');
INSERT INTO `cloud_area` VALUES ('141029', 141000, '乡宁县');
INSERT INTO `cloud_area` VALUES ('141030', 141000, '大宁县');
INSERT INTO `cloud_area` VALUES ('141031', 141000, '隰县');
INSERT INTO `cloud_area` VALUES ('141032', 141000, '永和县');
INSERT INTO `cloud_area` VALUES ('141033', 141000, '蒲县');
INSERT INTO `cloud_area` VALUES ('141034', 141000, '汾西县');
INSERT INTO `cloud_area` VALUES ('141081', 141000, '侯马市');
INSERT INTO `cloud_area` VALUES ('141082', 141000, '霍州市');
INSERT INTO `cloud_area` VALUES ('141100', 140000, '吕梁市');
INSERT INTO `cloud_area` VALUES ('141101', 141100, '市辖区');
INSERT INTO `cloud_area` VALUES ('141102', 141100, '离石区');
INSERT INTO `cloud_area` VALUES ('141121', 141100, '文水县');
INSERT INTO `cloud_area` VALUES ('141122', 141100, '交城县');
INSERT INTO `cloud_area` VALUES ('141123', 141100, '兴县');
INSERT INTO `cloud_area` VALUES ('141124', 141100, '临县');
INSERT INTO `cloud_area` VALUES ('141125', 141100, '柳林县');
INSERT INTO `cloud_area` VALUES ('141126', 141100, '石楼县');
INSERT INTO `cloud_area` VALUES ('141127', 141100, '岚县');
INSERT INTO `cloud_area` VALUES ('141128', 141100, '方山县');
INSERT INTO `cloud_area` VALUES ('141129', 141100, '中阳县');
INSERT INTO `cloud_area` VALUES ('141130', 141100, '交口县');
INSERT INTO `cloud_area` VALUES ('141181', 141100, '孝义市');
INSERT INTO `cloud_area` VALUES ('141182', 141100, '汾阳市');
INSERT INTO `cloud_area` VALUES ('150000', null, '内蒙古自治区');
INSERT INTO `cloud_area` VALUES ('150100', 150000, '呼和浩特市');
INSERT INTO `cloud_area` VALUES ('150101', 150100, '市辖区');
INSERT INTO `cloud_area` VALUES ('150102', 150100, '新城区');
INSERT INTO `cloud_area` VALUES ('150103', 150100, '回民区');
INSERT INTO `cloud_area` VALUES ('150104', 150100, '玉泉区');
INSERT INTO `cloud_area` VALUES ('150105', 150100, '赛罕区');
INSERT INTO `cloud_area` VALUES ('150121', 150100, '土默特左旗');
INSERT INTO `cloud_area` VALUES ('150122', 150100, '托克托县');
INSERT INTO `cloud_area` VALUES ('150123', 150100, '和林格尔县');
INSERT INTO `cloud_area` VALUES ('150124', 150100, '清水河县');
INSERT INTO `cloud_area` VALUES ('150125', 150100, '武川县');
INSERT INTO `cloud_area` VALUES ('150200', 150000, '包头市');
INSERT INTO `cloud_area` VALUES ('150201', 150200, '市辖区');
INSERT INTO `cloud_area` VALUES ('150202', 150200, '东河区');
INSERT INTO `cloud_area` VALUES ('150203', 150200, '昆都仑区');
INSERT INTO `cloud_area` VALUES ('150204', 150200, '青山区');
INSERT INTO `cloud_area` VALUES ('150205', 150200, '石拐区');
INSERT INTO `cloud_area` VALUES ('150206', 150200, '白云鄂博矿区');
INSERT INTO `cloud_area` VALUES ('150207', 150200, '九原区');
INSERT INTO `cloud_area` VALUES ('150221', 150200, '土默特右旗');
INSERT INTO `cloud_area` VALUES ('150222', 150200, '固阳县');
INSERT INTO `cloud_area` VALUES ('150223', 150200, '达尔罕茂明安联合旗');
INSERT INTO `cloud_area` VALUES ('150300', 150000, '乌海市');
INSERT INTO `cloud_area` VALUES ('150301', 150300, '市辖区');
INSERT INTO `cloud_area` VALUES ('150302', 150300, '海勃湾区');
INSERT INTO `cloud_area` VALUES ('150303', 150300, '海南区');
INSERT INTO `cloud_area` VALUES ('150304', 150300, '乌达区');
INSERT INTO `cloud_area` VALUES ('150400', 150000, '赤峰市');
INSERT INTO `cloud_area` VALUES ('150401', 150400, '市辖区');
INSERT INTO `cloud_area` VALUES ('150402', 150400, '红山区');
INSERT INTO `cloud_area` VALUES ('150403', 150400, '元宝山区');
INSERT INTO `cloud_area` VALUES ('150404', 150400, '松山区');
INSERT INTO `cloud_area` VALUES ('150421', 150400, '阿鲁科尔沁旗');
INSERT INTO `cloud_area` VALUES ('150422', 150400, '巴林左旗');
INSERT INTO `cloud_area` VALUES ('150423', 150400, '巴林右旗');
INSERT INTO `cloud_area` VALUES ('150424', 150400, '林西县');
INSERT INTO `cloud_area` VALUES ('150425', 150400, '克什克腾旗');
INSERT INTO `cloud_area` VALUES ('150426', 150400, '翁牛特旗');
INSERT INTO `cloud_area` VALUES ('150428', 150400, '喀喇沁旗');
INSERT INTO `cloud_area` VALUES ('150429', 150400, '宁城县');
INSERT INTO `cloud_area` VALUES ('150430', 150400, '敖汉旗');
INSERT INTO `cloud_area` VALUES ('150500', 150000, '通辽市');
INSERT INTO `cloud_area` VALUES ('150501', 150500, '市辖区');
INSERT INTO `cloud_area` VALUES ('150502', 150500, '科尔沁区');
INSERT INTO `cloud_area` VALUES ('150521', 150500, '科尔沁左翼中旗');
INSERT INTO `cloud_area` VALUES ('150522', 150500, '科尔沁左翼后旗');
INSERT INTO `cloud_area` VALUES ('150523', 150500, '开鲁县');
INSERT INTO `cloud_area` VALUES ('150524', 150500, '库伦旗');
INSERT INTO `cloud_area` VALUES ('150525', 150500, '奈曼旗');
INSERT INTO `cloud_area` VALUES ('150526', 150500, '扎鲁特旗');
INSERT INTO `cloud_area` VALUES ('150581', 150500, '霍林郭勒市');
INSERT INTO `cloud_area` VALUES ('150600', 150000, '鄂尔多斯市');
INSERT INTO `cloud_area` VALUES ('150601', 150600, '市辖区');
INSERT INTO `cloud_area` VALUES ('150602', 150600, '东胜区');
INSERT INTO `cloud_area` VALUES ('150621', 150600, '达拉特旗');
INSERT INTO `cloud_area` VALUES ('150622', 150600, '准格尔旗');
INSERT INTO `cloud_area` VALUES ('150623', 150600, '鄂托克前旗');
INSERT INTO `cloud_area` VALUES ('150624', 150600, '鄂托克旗');
INSERT INTO `cloud_area` VALUES ('150625', 150600, '杭锦旗');
INSERT INTO `cloud_area` VALUES ('150626', 150600, '乌审旗');
INSERT INTO `cloud_area` VALUES ('150627', 150600, '伊金霍洛旗');
INSERT INTO `cloud_area` VALUES ('150700', 150000, '呼伦贝尔市');
INSERT INTO `cloud_area` VALUES ('150701', 150700, '市辖区');
INSERT INTO `cloud_area` VALUES ('150702', 150700, '海拉尔区');
INSERT INTO `cloud_area` VALUES ('150703', 150700, '扎赉诺尔区');
INSERT INTO `cloud_area` VALUES ('150721', 150700, '阿荣旗');
INSERT INTO `cloud_area` VALUES ('150722', 150700, '莫力达瓦达斡尔族自治旗');
INSERT INTO `cloud_area` VALUES ('150723', 150700, '鄂伦春自治旗');
INSERT INTO `cloud_area` VALUES ('150724', 150700, '鄂温克族自治旗');
INSERT INTO `cloud_area` VALUES ('150725', 150700, '陈巴尔虎旗');
INSERT INTO `cloud_area` VALUES ('150726', 150700, '新巴尔虎左旗');
INSERT INTO `cloud_area` VALUES ('150727', 150700, '新巴尔虎右旗');
INSERT INTO `cloud_area` VALUES ('150781', 150700, '满洲里市');
INSERT INTO `cloud_area` VALUES ('150782', 150700, '牙克石市');
INSERT INTO `cloud_area` VALUES ('150783', 150700, '扎兰屯市');
INSERT INTO `cloud_area` VALUES ('150784', 150700, '额尔古纳市');
INSERT INTO `cloud_area` VALUES ('150785', 150700, '根河市');
INSERT INTO `cloud_area` VALUES ('150800', 150000, '巴彦淖尔市');
INSERT INTO `cloud_area` VALUES ('150801', 150800, '市辖区');
INSERT INTO `cloud_area` VALUES ('150802', 150800, '临河区');
INSERT INTO `cloud_area` VALUES ('150821', 150800, '五原县');
INSERT INTO `cloud_area` VALUES ('150822', 150800, '磴口县');
INSERT INTO `cloud_area` VALUES ('150823', 150800, '乌拉特前旗');
INSERT INTO `cloud_area` VALUES ('150824', 150800, '乌拉特中旗');
INSERT INTO `cloud_area` VALUES ('150825', 150800, '乌拉特后旗');
INSERT INTO `cloud_area` VALUES ('150826', 150800, '杭锦后旗');
INSERT INTO `cloud_area` VALUES ('150900', 150000, '乌兰察布市');
INSERT INTO `cloud_area` VALUES ('150901', 150900, '市辖区');
INSERT INTO `cloud_area` VALUES ('150902', 150900, '集宁区');
INSERT INTO `cloud_area` VALUES ('150921', 150900, '卓资县');
INSERT INTO `cloud_area` VALUES ('150922', 150900, '化德县');
INSERT INTO `cloud_area` VALUES ('150923', 150900, '商都县');
INSERT INTO `cloud_area` VALUES ('150924', 150900, '兴和县');
INSERT INTO `cloud_area` VALUES ('150925', 150900, '凉城县');
INSERT INTO `cloud_area` VALUES ('150926', 150900, '察哈尔右翼前旗');
INSERT INTO `cloud_area` VALUES ('150927', 150900, '察哈尔右翼中旗');
INSERT INTO `cloud_area` VALUES ('150928', 150900, '察哈尔右翼后旗');
INSERT INTO `cloud_area` VALUES ('150929', 150900, '四子王旗');
INSERT INTO `cloud_area` VALUES ('150981', 150900, '丰镇市');
INSERT INTO `cloud_area` VALUES ('152200', 150000, '兴安盟');
INSERT INTO `cloud_area` VALUES ('152201', 152200, '乌兰浩特市');
INSERT INTO `cloud_area` VALUES ('152202', 152200, '阿尔山市');
INSERT INTO `cloud_area` VALUES ('152221', 152200, '科尔沁右翼前旗');
INSERT INTO `cloud_area` VALUES ('152222', 152200, '科尔沁右翼中旗');
INSERT INTO `cloud_area` VALUES ('152223', 152200, '扎赉特旗');
INSERT INTO `cloud_area` VALUES ('152224', 152200, '突泉县');
INSERT INTO `cloud_area` VALUES ('152500', 150000, '锡林郭勒盟');
INSERT INTO `cloud_area` VALUES ('152501', 152500, '二连浩特市');
INSERT INTO `cloud_area` VALUES ('152502', 152500, '锡林浩特市');
INSERT INTO `cloud_area` VALUES ('152522', 152500, '阿巴嘎旗');
INSERT INTO `cloud_area` VALUES ('152523', 152500, '苏尼特左旗');
INSERT INTO `cloud_area` VALUES ('152524', 152500, '苏尼特右旗');
INSERT INTO `cloud_area` VALUES ('152525', 152500, '东乌珠穆沁旗');
INSERT INTO `cloud_area` VALUES ('152526', 152500, '西乌珠穆沁旗');
INSERT INTO `cloud_area` VALUES ('152527', 152500, '太仆寺旗');
INSERT INTO `cloud_area` VALUES ('152528', 152500, '镶黄旗');
INSERT INTO `cloud_area` VALUES ('152529', 152500, '正镶白旗');
INSERT INTO `cloud_area` VALUES ('152530', 152500, '正蓝旗');
INSERT INTO `cloud_area` VALUES ('152531', 152500, '多伦县');
INSERT INTO `cloud_area` VALUES ('152900', 150000, '阿拉善盟');
INSERT INTO `cloud_area` VALUES ('152921', 152900, '阿拉善左旗');
INSERT INTO `cloud_area` VALUES ('152922', 152900, '阿拉善右旗');
INSERT INTO `cloud_area` VALUES ('152923', 152900, '额济纳旗');
INSERT INTO `cloud_area` VALUES ('210000', null, '辽宁省');
INSERT INTO `cloud_area` VALUES ('210100', 210000, '沈阳市');
INSERT INTO `cloud_area` VALUES ('210101', 210100, '市辖区');
INSERT INTO `cloud_area` VALUES ('210102', 210100, '和平区');
INSERT INTO `cloud_area` VALUES ('210103', 210100, '沈河区');
INSERT INTO `cloud_area` VALUES ('210104', 210100, '大东区');
INSERT INTO `cloud_area` VALUES ('210105', 210100, '皇姑区');
INSERT INTO `cloud_area` VALUES ('210106', 210100, '铁西区');
INSERT INTO `cloud_area` VALUES ('210111', 210100, '苏家屯区');
INSERT INTO `cloud_area` VALUES ('210112', 210100, '浑南区');
INSERT INTO `cloud_area` VALUES ('210113', 210100, '沈北新区');
INSERT INTO `cloud_area` VALUES ('210114', 210100, '于洪区');
INSERT INTO `cloud_area` VALUES ('210122', 210100, '辽中县');
INSERT INTO `cloud_area` VALUES ('210123', 210100, '康平县');
INSERT INTO `cloud_area` VALUES ('210124', 210100, '法库县');
INSERT INTO `cloud_area` VALUES ('210181', 210100, '新民市');
INSERT INTO `cloud_area` VALUES ('210200', 210000, '大连市');
INSERT INTO `cloud_area` VALUES ('210201', 210200, '市辖区');
INSERT INTO `cloud_area` VALUES ('210202', 210200, '中山区');
INSERT INTO `cloud_area` VALUES ('210203', 210200, '西岗区');
INSERT INTO `cloud_area` VALUES ('210204', 210200, '沙河口区');
INSERT INTO `cloud_area` VALUES ('210211', 210200, '甘井子区');
INSERT INTO `cloud_area` VALUES ('210212', 210200, '旅顺口区');
INSERT INTO `cloud_area` VALUES ('210213', 210200, '金州区');
INSERT INTO `cloud_area` VALUES ('210224', 210200, '长海县');
INSERT INTO `cloud_area` VALUES ('210281', 210200, '瓦房店市');
INSERT INTO `cloud_area` VALUES ('210282', 210200, '普兰店市');
INSERT INTO `cloud_area` VALUES ('210283', 210200, '庄河市');
INSERT INTO `cloud_area` VALUES ('210300', 210000, '鞍山市');
INSERT INTO `cloud_area` VALUES ('210301', 210300, '市辖区');
INSERT INTO `cloud_area` VALUES ('210302', 210300, '铁东区');
INSERT INTO `cloud_area` VALUES ('210303', 210300, '铁西区');
INSERT INTO `cloud_area` VALUES ('210304', 210300, '立山区');
INSERT INTO `cloud_area` VALUES ('210311', 210300, '千山区');
INSERT INTO `cloud_area` VALUES ('210321', 210300, '台安县');
INSERT INTO `cloud_area` VALUES ('210323', 210300, '岫岩满族自治县');
INSERT INTO `cloud_area` VALUES ('210381', 210300, '海城市');
INSERT INTO `cloud_area` VALUES ('210400', 210000, '抚顺市');
INSERT INTO `cloud_area` VALUES ('210401', 210400, '市辖区');
INSERT INTO `cloud_area` VALUES ('210402', 210400, '新抚区');
INSERT INTO `cloud_area` VALUES ('210403', 210400, '东洲区');
INSERT INTO `cloud_area` VALUES ('210404', 210400, '望花区');
INSERT INTO `cloud_area` VALUES ('210411', 210400, '顺城区');
INSERT INTO `cloud_area` VALUES ('210421', 210400, '抚顺县');
INSERT INTO `cloud_area` VALUES ('210422', 210400, '新宾满族自治县');
INSERT INTO `cloud_area` VALUES ('210423', 210400, '清原满族自治县');
INSERT INTO `cloud_area` VALUES ('210500', 210000, '本溪市');
INSERT INTO `cloud_area` VALUES ('210501', 210500, '市辖区');
INSERT INTO `cloud_area` VALUES ('210502', 210500, '平山区');
INSERT INTO `cloud_area` VALUES ('210503', 210500, '溪湖区');
INSERT INTO `cloud_area` VALUES ('210504', 210500, '明山区');
INSERT INTO `cloud_area` VALUES ('210505', 210500, '南芬区');
INSERT INTO `cloud_area` VALUES ('210521', 210500, '本溪满族自治县');
INSERT INTO `cloud_area` VALUES ('210522', 210500, '桓仁满族自治县');
INSERT INTO `cloud_area` VALUES ('210600', 210000, '丹东市');
INSERT INTO `cloud_area` VALUES ('210601', 210600, '市辖区');
INSERT INTO `cloud_area` VALUES ('210602', 210600, '元宝区');
INSERT INTO `cloud_area` VALUES ('210603', 210600, '振兴区');
INSERT INTO `cloud_area` VALUES ('210604', 210600, '振安区');
INSERT INTO `cloud_area` VALUES ('210624', 210600, '宽甸满族自治县');
INSERT INTO `cloud_area` VALUES ('210681', 210600, '东港市');
INSERT INTO `cloud_area` VALUES ('210682', 210600, '凤城市');
INSERT INTO `cloud_area` VALUES ('210700', 210000, '锦州市');
INSERT INTO `cloud_area` VALUES ('210701', 210700, '市辖区');
INSERT INTO `cloud_area` VALUES ('210702', 210700, '古塔区');
INSERT INTO `cloud_area` VALUES ('210703', 210700, '凌河区');
INSERT INTO `cloud_area` VALUES ('210711', 210700, '太和区');
INSERT INTO `cloud_area` VALUES ('210726', 210700, '黑山县');
INSERT INTO `cloud_area` VALUES ('210727', 210700, '义县');
INSERT INTO `cloud_area` VALUES ('210781', 210700, '凌海市');
INSERT INTO `cloud_area` VALUES ('210782', 210700, '北镇市');
INSERT INTO `cloud_area` VALUES ('210800', 210000, '营口市');
INSERT INTO `cloud_area` VALUES ('210801', 210800, '市辖区');
INSERT INTO `cloud_area` VALUES ('210802', 210800, '站前区');
INSERT INTO `cloud_area` VALUES ('210803', 210800, '西市区');
INSERT INTO `cloud_area` VALUES ('210804', 210800, '鲅鱼圈区');
INSERT INTO `cloud_area` VALUES ('210811', 210800, '老边区');
INSERT INTO `cloud_area` VALUES ('210881', 210800, '盖州市');
INSERT INTO `cloud_area` VALUES ('210882', 210800, '大石桥市');
INSERT INTO `cloud_area` VALUES ('210900', 210000, '阜新市');
INSERT INTO `cloud_area` VALUES ('210901', 210900, '市辖区');
INSERT INTO `cloud_area` VALUES ('210902', 210900, '海州区');
INSERT INTO `cloud_area` VALUES ('210903', 210900, '新邱区');
INSERT INTO `cloud_area` VALUES ('210904', 210900, '太平区');
INSERT INTO `cloud_area` VALUES ('210905', 210900, '清河门区');
INSERT INTO `cloud_area` VALUES ('210911', 210900, '细河区');
INSERT INTO `cloud_area` VALUES ('210921', 210900, '阜新蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('210922', 210900, '彰武县');
INSERT INTO `cloud_area` VALUES ('211000', 210000, '辽阳市');
INSERT INTO `cloud_area` VALUES ('211001', 211000, '市辖区');
INSERT INTO `cloud_area` VALUES ('211002', 211000, '白塔区');
INSERT INTO `cloud_area` VALUES ('211003', 211000, '文圣区');
INSERT INTO `cloud_area` VALUES ('211004', 211000, '宏伟区');
INSERT INTO `cloud_area` VALUES ('211005', 211000, '弓长岭区');
INSERT INTO `cloud_area` VALUES ('211011', 211000, '太子河区');
INSERT INTO `cloud_area` VALUES ('211021', 211000, '辽阳县');
INSERT INTO `cloud_area` VALUES ('211081', 211000, '灯塔市');
INSERT INTO `cloud_area` VALUES ('211100', 210000, '盘锦市');
INSERT INTO `cloud_area` VALUES ('211101', 211100, '市辖区');
INSERT INTO `cloud_area` VALUES ('211102', 211100, '双台子区');
INSERT INTO `cloud_area` VALUES ('211103', 211100, '兴隆台区');
INSERT INTO `cloud_area` VALUES ('211121', 211100, '大洼县');
INSERT INTO `cloud_area` VALUES ('211122', 211100, '盘山县');
INSERT INTO `cloud_area` VALUES ('211200', 210000, '铁岭市');
INSERT INTO `cloud_area` VALUES ('211201', 211200, '市辖区');
INSERT INTO `cloud_area` VALUES ('211202', 211200, '银州区');
INSERT INTO `cloud_area` VALUES ('211204', 211200, '清河区');
INSERT INTO `cloud_area` VALUES ('211221', 211200, '铁岭县');
INSERT INTO `cloud_area` VALUES ('211223', 211200, '西丰县');
INSERT INTO `cloud_area` VALUES ('211224', 211200, '昌图县');
INSERT INTO `cloud_area` VALUES ('211281', 211200, '调兵山市');
INSERT INTO `cloud_area` VALUES ('211282', 211200, '开原市');
INSERT INTO `cloud_area` VALUES ('211300', 210000, '朝阳市');
INSERT INTO `cloud_area` VALUES ('211301', 211300, '市辖区');
INSERT INTO `cloud_area` VALUES ('211302', 211300, '双塔区');
INSERT INTO `cloud_area` VALUES ('211303', 211300, '龙城区');
INSERT INTO `cloud_area` VALUES ('211321', 211300, '朝阳县');
INSERT INTO `cloud_area` VALUES ('211322', 211300, '建平县');
INSERT INTO `cloud_area` VALUES ('211324', 211300, '喀喇沁左翼蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('211381', 211300, '北票市');
INSERT INTO `cloud_area` VALUES ('211382', 211300, '凌源市');
INSERT INTO `cloud_area` VALUES ('211400', 210000, '葫芦岛市');
INSERT INTO `cloud_area` VALUES ('211401', 211400, '市辖区');
INSERT INTO `cloud_area` VALUES ('211402', 211400, '连山区');
INSERT INTO `cloud_area` VALUES ('211403', 211400, '龙港区');
INSERT INTO `cloud_area` VALUES ('211404', 211400, '南票区');
INSERT INTO `cloud_area` VALUES ('211421', 211400, '绥中县');
INSERT INTO `cloud_area` VALUES ('211422', 211400, '建昌县');
INSERT INTO `cloud_area` VALUES ('211481', 211400, '兴城市');
INSERT INTO `cloud_area` VALUES ('220000', null, '吉林省');
INSERT INTO `cloud_area` VALUES ('220100', 220000, '长春市');
INSERT INTO `cloud_area` VALUES ('220101', 220100, '市辖区');
INSERT INTO `cloud_area` VALUES ('220102', 220100, '南关区');
INSERT INTO `cloud_area` VALUES ('220103', 220100, '宽城区');
INSERT INTO `cloud_area` VALUES ('220104', 220100, '朝阳区');
INSERT INTO `cloud_area` VALUES ('220105', 220100, '二道区');
INSERT INTO `cloud_area` VALUES ('220106', 220100, '绿园区');
INSERT INTO `cloud_area` VALUES ('220112', 220100, '双阳区');
INSERT INTO `cloud_area` VALUES ('220113', 220100, '九台区');
INSERT INTO `cloud_area` VALUES ('220122', 220100, '农安县');
INSERT INTO `cloud_area` VALUES ('220182', 220100, '榆树市');
INSERT INTO `cloud_area` VALUES ('220183', 220100, '德惠市');
INSERT INTO `cloud_area` VALUES ('220200', 220000, '吉林市');
INSERT INTO `cloud_area` VALUES ('220201', 220200, '市辖区');
INSERT INTO `cloud_area` VALUES ('220202', 220200, '昌邑区');
INSERT INTO `cloud_area` VALUES ('220203', 220200, '龙潭区');
INSERT INTO `cloud_area` VALUES ('220204', 220200, '船营区');
INSERT INTO `cloud_area` VALUES ('220211', 220200, '丰满区');
INSERT INTO `cloud_area` VALUES ('220221', 220200, '永吉县');
INSERT INTO `cloud_area` VALUES ('220281', 220200, '蛟河市');
INSERT INTO `cloud_area` VALUES ('220282', 220200, '桦甸市');
INSERT INTO `cloud_area` VALUES ('220283', 220200, '舒兰市');
INSERT INTO `cloud_area` VALUES ('220284', 220200, '磐石市');
INSERT INTO `cloud_area` VALUES ('220300', 220000, '四平市');
INSERT INTO `cloud_area` VALUES ('220301', 220300, '市辖区');
INSERT INTO `cloud_area` VALUES ('220302', 220300, '铁西区');
INSERT INTO `cloud_area` VALUES ('220303', 220300, '铁东区');
INSERT INTO `cloud_area` VALUES ('220322', 220300, '梨树县');
INSERT INTO `cloud_area` VALUES ('220323', 220300, '伊通满族自治县');
INSERT INTO `cloud_area` VALUES ('220381', 220300, '公主岭市');
INSERT INTO `cloud_area` VALUES ('220382', 220300, '双辽市');
INSERT INTO `cloud_area` VALUES ('220400', 220000, '辽源市');
INSERT INTO `cloud_area` VALUES ('220401', 220400, '市辖区');
INSERT INTO `cloud_area` VALUES ('220402', 220400, '龙山区');
INSERT INTO `cloud_area` VALUES ('220403', 220400, '西安区');
INSERT INTO `cloud_area` VALUES ('220421', 220400, '东丰县');
INSERT INTO `cloud_area` VALUES ('220422', 220400, '东辽县');
INSERT INTO `cloud_area` VALUES ('220500', 220000, '通化市');
INSERT INTO `cloud_area` VALUES ('220501', 220500, '市辖区');
INSERT INTO `cloud_area` VALUES ('220502', 220500, '东昌区');
INSERT INTO `cloud_area` VALUES ('220503', 220500, '二道江区');
INSERT INTO `cloud_area` VALUES ('220521', 220500, '通化县');
INSERT INTO `cloud_area` VALUES ('220523', 220500, '辉南县');
INSERT INTO `cloud_area` VALUES ('220524', 220500, '柳河县');
INSERT INTO `cloud_area` VALUES ('220581', 220500, '梅河口市');
INSERT INTO `cloud_area` VALUES ('220582', 220500, '集安市');
INSERT INTO `cloud_area` VALUES ('220600', 220000, '白山市');
INSERT INTO `cloud_area` VALUES ('220601', 220600, '市辖区');
INSERT INTO `cloud_area` VALUES ('220602', 220600, '浑江区');
INSERT INTO `cloud_area` VALUES ('220605', 220600, '江源区');
INSERT INTO `cloud_area` VALUES ('220621', 220600, '抚松县');
INSERT INTO `cloud_area` VALUES ('220622', 220600, '靖宇县');
INSERT INTO `cloud_area` VALUES ('220623', 220600, '长白朝鲜族自治县');
INSERT INTO `cloud_area` VALUES ('220681', 220600, '临江市');
INSERT INTO `cloud_area` VALUES ('220700', 220000, '松原市');
INSERT INTO `cloud_area` VALUES ('220701', 220700, '市辖区');
INSERT INTO `cloud_area` VALUES ('220702', 220700, '宁江区');
INSERT INTO `cloud_area` VALUES ('220721', 220700, '前郭尔罗斯蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('220722', 220700, '长岭县');
INSERT INTO `cloud_area` VALUES ('220723', 220700, '乾安县');
INSERT INTO `cloud_area` VALUES ('220781', 220700, '扶余市');
INSERT INTO `cloud_area` VALUES ('220800', 220000, '白城市');
INSERT INTO `cloud_area` VALUES ('220801', 220800, '市辖区');
INSERT INTO `cloud_area` VALUES ('220802', 220800, '洮北区');
INSERT INTO `cloud_area` VALUES ('220821', 220800, '镇赉县');
INSERT INTO `cloud_area` VALUES ('220822', 220800, '通榆县');
INSERT INTO `cloud_area` VALUES ('220881', 220800, '洮南市');
INSERT INTO `cloud_area` VALUES ('220882', 220800, '大安市');
INSERT INTO `cloud_area` VALUES ('222400', 220000, '延边朝鲜族自治州');
INSERT INTO `cloud_area` VALUES ('222401', 222400, '延吉市');
INSERT INTO `cloud_area` VALUES ('222402', 222400, '图们市');
INSERT INTO `cloud_area` VALUES ('222403', 222400, '敦化市');
INSERT INTO `cloud_area` VALUES ('222404', 222400, '珲春市');
INSERT INTO `cloud_area` VALUES ('222405', 222400, '龙井市');
INSERT INTO `cloud_area` VALUES ('222406', 222400, '和龙市');
INSERT INTO `cloud_area` VALUES ('222424', 222400, '汪清县');
INSERT INTO `cloud_area` VALUES ('222426', 222400, '安图县');
INSERT INTO `cloud_area` VALUES ('230000', null, '黑龙江省');
INSERT INTO `cloud_area` VALUES ('230100', 230000, '哈尔滨市');
INSERT INTO `cloud_area` VALUES ('230101', 230100, '市辖区');
INSERT INTO `cloud_area` VALUES ('230102', 230100, '道里区');
INSERT INTO `cloud_area` VALUES ('230103', 230100, '南岗区');
INSERT INTO `cloud_area` VALUES ('230104', 230100, '道外区');
INSERT INTO `cloud_area` VALUES ('230108', 230100, '平房区');
INSERT INTO `cloud_area` VALUES ('230109', 230100, '松北区');
INSERT INTO `cloud_area` VALUES ('230110', 230100, '香坊区');
INSERT INTO `cloud_area` VALUES ('230111', 230100, '呼兰区');
INSERT INTO `cloud_area` VALUES ('230112', 230100, '阿城区');
INSERT INTO `cloud_area` VALUES ('230113', 230100, '双城区');
INSERT INTO `cloud_area` VALUES ('230123', 230100, '依兰县');
INSERT INTO `cloud_area` VALUES ('230124', 230100, '方正县');
INSERT INTO `cloud_area` VALUES ('230125', 230100, '宾县');
INSERT INTO `cloud_area` VALUES ('230126', 230100, '巴彦县');
INSERT INTO `cloud_area` VALUES ('230127', 230100, '木兰县');
INSERT INTO `cloud_area` VALUES ('230128', 230100, '通河县');
INSERT INTO `cloud_area` VALUES ('230129', 230100, '延寿县');
INSERT INTO `cloud_area` VALUES ('230183', 230100, '尚志市');
INSERT INTO `cloud_area` VALUES ('230184', 230100, '五常市');
INSERT INTO `cloud_area` VALUES ('230200', 230000, '齐齐哈尔市');
INSERT INTO `cloud_area` VALUES ('230201', 230200, '市辖区');
INSERT INTO `cloud_area` VALUES ('230202', 230200, '龙沙区');
INSERT INTO `cloud_area` VALUES ('230203', 230200, '建华区');
INSERT INTO `cloud_area` VALUES ('230204', 230200, '铁锋区');
INSERT INTO `cloud_area` VALUES ('230205', 230200, '昂昂溪区');
INSERT INTO `cloud_area` VALUES ('230206', 230200, '富拉尔基区');
INSERT INTO `cloud_area` VALUES ('230207', 230200, '碾子山区');
INSERT INTO `cloud_area` VALUES ('230208', 230200, '梅里斯达斡尔族区');
INSERT INTO `cloud_area` VALUES ('230221', 230200, '龙江县');
INSERT INTO `cloud_area` VALUES ('230223', 230200, '依安县');
INSERT INTO `cloud_area` VALUES ('230224', 230200, '泰来县');
INSERT INTO `cloud_area` VALUES ('230225', 230200, '甘南县');
INSERT INTO `cloud_area` VALUES ('230227', 230200, '富裕县');
INSERT INTO `cloud_area` VALUES ('230229', 230200, '克山县');
INSERT INTO `cloud_area` VALUES ('230230', 230200, '克东县');
INSERT INTO `cloud_area` VALUES ('230231', 230200, '拜泉县');
INSERT INTO `cloud_area` VALUES ('230281', 230200, '讷河市');
INSERT INTO `cloud_area` VALUES ('230300', 230000, '鸡西市');
INSERT INTO `cloud_area` VALUES ('230301', 230300, '市辖区');
INSERT INTO `cloud_area` VALUES ('230302', 230300, '鸡冠区');
INSERT INTO `cloud_area` VALUES ('230303', 230300, '恒山区');
INSERT INTO `cloud_area` VALUES ('230304', 230300, '滴道区');
INSERT INTO `cloud_area` VALUES ('230305', 230300, '梨树区');
INSERT INTO `cloud_area` VALUES ('230306', 230300, '城子河区');
INSERT INTO `cloud_area` VALUES ('230307', 230300, '麻山区');
INSERT INTO `cloud_area` VALUES ('230321', 230300, '鸡东县');
INSERT INTO `cloud_area` VALUES ('230381', 230300, '虎林市');
INSERT INTO `cloud_area` VALUES ('230382', 230300, '密山市');
INSERT INTO `cloud_area` VALUES ('230400', 230000, '鹤岗市');
INSERT INTO `cloud_area` VALUES ('230401', 230400, '市辖区');
INSERT INTO `cloud_area` VALUES ('230402', 230400, '向阳区');
INSERT INTO `cloud_area` VALUES ('230403', 230400, '工农区');
INSERT INTO `cloud_area` VALUES ('230404', 230400, '南山区');
INSERT INTO `cloud_area` VALUES ('230405', 230400, '兴安区');
INSERT INTO `cloud_area` VALUES ('230406', 230400, '东山区');
INSERT INTO `cloud_area` VALUES ('230407', 230400, '兴山区');
INSERT INTO `cloud_area` VALUES ('230421', 230400, '萝北县');
INSERT INTO `cloud_area` VALUES ('230422', 230400, '绥滨县');
INSERT INTO `cloud_area` VALUES ('230500', 230000, '双鸭山市');
INSERT INTO `cloud_area` VALUES ('230501', 230500, '市辖区');
INSERT INTO `cloud_area` VALUES ('230502', 230500, '尖山区');
INSERT INTO `cloud_area` VALUES ('230503', 230500, '岭东区');
INSERT INTO `cloud_area` VALUES ('230505', 230500, '四方台区');
INSERT INTO `cloud_area` VALUES ('230506', 230500, '宝山区');
INSERT INTO `cloud_area` VALUES ('230521', 230500, '集贤县');
INSERT INTO `cloud_area` VALUES ('230522', 230500, '友谊县');
INSERT INTO `cloud_area` VALUES ('230523', 230500, '宝清县');
INSERT INTO `cloud_area` VALUES ('230524', 230500, '饶河县');
INSERT INTO `cloud_area` VALUES ('230600', 230000, '大庆市');
INSERT INTO `cloud_area` VALUES ('230601', 230600, '市辖区');
INSERT INTO `cloud_area` VALUES ('230602', 230600, '萨尔图区');
INSERT INTO `cloud_area` VALUES ('230603', 230600, '龙凤区');
INSERT INTO `cloud_area` VALUES ('230604', 230600, '让胡路区');
INSERT INTO `cloud_area` VALUES ('230605', 230600, '红岗区');
INSERT INTO `cloud_area` VALUES ('230606', 230600, '大同区');
INSERT INTO `cloud_area` VALUES ('230621', 230600, '肇州县');
INSERT INTO `cloud_area` VALUES ('230622', 230600, '肇源县');
INSERT INTO `cloud_area` VALUES ('230623', 230600, '林甸县');
INSERT INTO `cloud_area` VALUES ('230624', 230600, '杜尔伯特蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('230700', 230000, '伊春市');
INSERT INTO `cloud_area` VALUES ('230701', 230700, '市辖区');
INSERT INTO `cloud_area` VALUES ('230702', 230700, '伊春区');
INSERT INTO `cloud_area` VALUES ('230703', 230700, '南岔区');
INSERT INTO `cloud_area` VALUES ('230704', 230700, '友好区');
INSERT INTO `cloud_area` VALUES ('230705', 230700, '西林区');
INSERT INTO `cloud_area` VALUES ('230706', 230700, '翠峦区');
INSERT INTO `cloud_area` VALUES ('230707', 230700, '新青区');
INSERT INTO `cloud_area` VALUES ('230708', 230700, '美溪区');
INSERT INTO `cloud_area` VALUES ('230709', 230700, '金山屯区');
INSERT INTO `cloud_area` VALUES ('230710', 230700, '五营区');
INSERT INTO `cloud_area` VALUES ('230711', 230700, '乌马河区');
INSERT INTO `cloud_area` VALUES ('230712', 230700, '汤旺河区');
INSERT INTO `cloud_area` VALUES ('230713', 230700, '带岭区');
INSERT INTO `cloud_area` VALUES ('230714', 230700, '乌伊岭区');
INSERT INTO `cloud_area` VALUES ('230715', 230700, '红星区');
INSERT INTO `cloud_area` VALUES ('230716', 230700, '上甘岭区');
INSERT INTO `cloud_area` VALUES ('230722', 230700, '嘉荫县');
INSERT INTO `cloud_area` VALUES ('230781', 230700, '铁力市');
INSERT INTO `cloud_area` VALUES ('230800', 230000, '佳木斯市');
INSERT INTO `cloud_area` VALUES ('230801', 230800, '市辖区');
INSERT INTO `cloud_area` VALUES ('230803', 230800, '向阳区');
INSERT INTO `cloud_area` VALUES ('230804', 230800, '前进区');
INSERT INTO `cloud_area` VALUES ('230805', 230800, '东风区');
INSERT INTO `cloud_area` VALUES ('230811', 230800, '郊区');
INSERT INTO `cloud_area` VALUES ('230822', 230800, '桦南县');
INSERT INTO `cloud_area` VALUES ('230826', 230800, '桦川县');
INSERT INTO `cloud_area` VALUES ('230828', 230800, '汤原县');
INSERT INTO `cloud_area` VALUES ('230833', 230800, '抚远县');
INSERT INTO `cloud_area` VALUES ('230881', 230800, '同江市');
INSERT INTO `cloud_area` VALUES ('230882', 230800, '富锦市');
INSERT INTO `cloud_area` VALUES ('230900', 230000, '七台河市');
INSERT INTO `cloud_area` VALUES ('230901', 230900, '市辖区');
INSERT INTO `cloud_area` VALUES ('230902', 230900, '新兴区');
INSERT INTO `cloud_area` VALUES ('230903', 230900, '桃山区');
INSERT INTO `cloud_area` VALUES ('230904', 230900, '茄子河区');
INSERT INTO `cloud_area` VALUES ('230921', 230900, '勃利县');
INSERT INTO `cloud_area` VALUES ('231000', 230000, '牡丹江市');
INSERT INTO `cloud_area` VALUES ('231001', 231000, '市辖区');
INSERT INTO `cloud_area` VALUES ('231002', 231000, '东安区');
INSERT INTO `cloud_area` VALUES ('231003', 231000, '阳明区');
INSERT INTO `cloud_area` VALUES ('231004', 231000, '爱民区');
INSERT INTO `cloud_area` VALUES ('231005', 231000, '西安区');
INSERT INTO `cloud_area` VALUES ('231024', 231000, '东宁县');
INSERT INTO `cloud_area` VALUES ('231025', 231000, '林口县');
INSERT INTO `cloud_area` VALUES ('231081', 231000, '绥芬河市');
INSERT INTO `cloud_area` VALUES ('231083', 231000, '海林市');
INSERT INTO `cloud_area` VALUES ('231084', 231000, '宁安市');
INSERT INTO `cloud_area` VALUES ('231085', 231000, '穆棱市');
INSERT INTO `cloud_area` VALUES ('231100', 230000, '黑河市');
INSERT INTO `cloud_area` VALUES ('231101', 231100, '市辖区');
INSERT INTO `cloud_area` VALUES ('231102', 231100, '爱辉区');
INSERT INTO `cloud_area` VALUES ('231121', 231100, '嫩江县');
INSERT INTO `cloud_area` VALUES ('231123', 231100, '逊克县');
INSERT INTO `cloud_area` VALUES ('231124', 231100, '孙吴县');
INSERT INTO `cloud_area` VALUES ('231181', 231100, '北安市');
INSERT INTO `cloud_area` VALUES ('231182', 231100, '五大连池市');
INSERT INTO `cloud_area` VALUES ('231200', 230000, '绥化市');
INSERT INTO `cloud_area` VALUES ('231201', 231200, '市辖区');
INSERT INTO `cloud_area` VALUES ('231202', 231200, '北林区');
INSERT INTO `cloud_area` VALUES ('231221', 231200, '望奎县');
INSERT INTO `cloud_area` VALUES ('231222', 231200, '兰西县');
INSERT INTO `cloud_area` VALUES ('231223', 231200, '青冈县');
INSERT INTO `cloud_area` VALUES ('231224', 231200, '庆安县');
INSERT INTO `cloud_area` VALUES ('231225', 231200, '明水县');
INSERT INTO `cloud_area` VALUES ('231226', 231200, '绥棱县');
INSERT INTO `cloud_area` VALUES ('231281', 231200, '安达市');
INSERT INTO `cloud_area` VALUES ('231282', 231200, '肇东市');
INSERT INTO `cloud_area` VALUES ('231283', 231200, '海伦市');
INSERT INTO `cloud_area` VALUES ('232700', 230000, '大兴安岭地区');
INSERT INTO `cloud_area` VALUES ('232721', 232700, '呼玛县');
INSERT INTO `cloud_area` VALUES ('232722', 232700, '塔河县');
INSERT INTO `cloud_area` VALUES ('232723', 232700, '漠河县');
INSERT INTO `cloud_area` VALUES ('310000', null, '上海市');
INSERT INTO `cloud_area` VALUES ('310100', 310000, '市辖区');
INSERT INTO `cloud_area` VALUES ('310101', 310100, '黄浦区');
INSERT INTO `cloud_area` VALUES ('310104', 310100, '徐汇区');
INSERT INTO `cloud_area` VALUES ('310105', 310100, '长宁区');
INSERT INTO `cloud_area` VALUES ('310106', 310100, '静安区');
INSERT INTO `cloud_area` VALUES ('310107', 310100, '普陀区');
INSERT INTO `cloud_area` VALUES ('310108', 310100, '闸北区');
INSERT INTO `cloud_area` VALUES ('310109', 310100, '虹口区');
INSERT INTO `cloud_area` VALUES ('310110', 310100, '杨浦区');
INSERT INTO `cloud_area` VALUES ('310112', 310100, '闵行区');
INSERT INTO `cloud_area` VALUES ('310113', 310100, '宝山区');
INSERT INTO `cloud_area` VALUES ('310114', 310100, '嘉定区');
INSERT INTO `cloud_area` VALUES ('310115', 310100, '浦东新区');
INSERT INTO `cloud_area` VALUES ('310116', 310100, '金山区');
INSERT INTO `cloud_area` VALUES ('310117', 310100, '松江区');
INSERT INTO `cloud_area` VALUES ('310118', 310100, '青浦区');
INSERT INTO `cloud_area` VALUES ('310120', 310100, '奉贤区');
INSERT INTO `cloud_area` VALUES ('310200', 310000, '县');
INSERT INTO `cloud_area` VALUES ('310230', 310200, '崇明县');
INSERT INTO `cloud_area` VALUES ('320000', null, '江苏省');
INSERT INTO `cloud_area` VALUES ('320100', 320000, '南京市');
INSERT INTO `cloud_area` VALUES ('320101', 320100, '市辖区');
INSERT INTO `cloud_area` VALUES ('320102', 320100, '玄武区');
INSERT INTO `cloud_area` VALUES ('320104', 320100, '秦淮区');
INSERT INTO `cloud_area` VALUES ('320105', 320100, '建邺区');
INSERT INTO `cloud_area` VALUES ('320106', 320100, '鼓楼区');
INSERT INTO `cloud_area` VALUES ('320111', 320100, '浦口区');
INSERT INTO `cloud_area` VALUES ('320113', 320100, '栖霞区');
INSERT INTO `cloud_area` VALUES ('320114', 320100, '雨花台区');
INSERT INTO `cloud_area` VALUES ('320115', 320100, '江宁区');
INSERT INTO `cloud_area` VALUES ('320116', 320100, '六合区');
INSERT INTO `cloud_area` VALUES ('320117', 320100, '溧水区');
INSERT INTO `cloud_area` VALUES ('320118', 320100, '高淳区');
INSERT INTO `cloud_area` VALUES ('320200', 320000, '无锡市');
INSERT INTO `cloud_area` VALUES ('320201', 320200, '市辖区');
INSERT INTO `cloud_area` VALUES ('320202', 320200, '崇安区');
INSERT INTO `cloud_area` VALUES ('320203', 320200, '南长区');
INSERT INTO `cloud_area` VALUES ('320204', 320200, '北塘区');
INSERT INTO `cloud_area` VALUES ('320205', 320200, '锡山区');
INSERT INTO `cloud_area` VALUES ('320206', 320200, '惠山区');
INSERT INTO `cloud_area` VALUES ('320211', 320200, '滨湖区');
INSERT INTO `cloud_area` VALUES ('320281', 320200, '江阴市');
INSERT INTO `cloud_area` VALUES ('320282', 320200, '宜兴市');
INSERT INTO `cloud_area` VALUES ('320300', 320000, '徐州市');
INSERT INTO `cloud_area` VALUES ('320301', 320300, '市辖区');
INSERT INTO `cloud_area` VALUES ('320302', 320300, '鼓楼区');
INSERT INTO `cloud_area` VALUES ('320303', 320300, '云龙区');
INSERT INTO `cloud_area` VALUES ('320305', 320300, '贾汪区');
INSERT INTO `cloud_area` VALUES ('320311', 320300, '泉山区');
INSERT INTO `cloud_area` VALUES ('320312', 320300, '铜山区');
INSERT INTO `cloud_area` VALUES ('320321', 320300, '丰县');
INSERT INTO `cloud_area` VALUES ('320322', 320300, '沛县');
INSERT INTO `cloud_area` VALUES ('320324', 320300, '睢宁县');
INSERT INTO `cloud_area` VALUES ('320381', 320300, '新沂市');
INSERT INTO `cloud_area` VALUES ('320382', 320300, '邳州市');
INSERT INTO `cloud_area` VALUES ('320400', 320000, '常州市');
INSERT INTO `cloud_area` VALUES ('320401', 320400, '市辖区');
INSERT INTO `cloud_area` VALUES ('320402', 320400, '天宁区');
INSERT INTO `cloud_area` VALUES ('320404', 320400, '钟楼区');
INSERT INTO `cloud_area` VALUES ('320411', 320400, '新北区');
INSERT INTO `cloud_area` VALUES ('320412', 320400, '武进区');
INSERT INTO `cloud_area` VALUES ('320413', 320400, '金坛区');
INSERT INTO `cloud_area` VALUES ('320481', 320400, '溧阳市');
INSERT INTO `cloud_area` VALUES ('320500', 320000, '苏州市');
INSERT INTO `cloud_area` VALUES ('320501', 320500, '市辖区');
INSERT INTO `cloud_area` VALUES ('320505', 320500, '虎丘区');
INSERT INTO `cloud_area` VALUES ('320506', 320500, '吴中区');
INSERT INTO `cloud_area` VALUES ('320507', 320500, '相城区');
INSERT INTO `cloud_area` VALUES ('320508', 320500, '姑苏区');
INSERT INTO `cloud_area` VALUES ('320509', 320500, '吴江区');
INSERT INTO `cloud_area` VALUES ('320581', 320500, '常熟市');
INSERT INTO `cloud_area` VALUES ('320582', 320500, '张家港市');
INSERT INTO `cloud_area` VALUES ('320583', 320500, '昆山市');
INSERT INTO `cloud_area` VALUES ('320585', 320500, '太仓市');
INSERT INTO `cloud_area` VALUES ('320600', 320000, '南通市');
INSERT INTO `cloud_area` VALUES ('320601', 320600, '市辖区');
INSERT INTO `cloud_area` VALUES ('320602', 320600, '崇川区');
INSERT INTO `cloud_area` VALUES ('320611', 320600, '港闸区');
INSERT INTO `cloud_area` VALUES ('320612', 320600, '通州区');
INSERT INTO `cloud_area` VALUES ('320621', 320600, '海安县');
INSERT INTO `cloud_area` VALUES ('320623', 320600, '如东县');
INSERT INTO `cloud_area` VALUES ('320681', 320600, '启东市');
INSERT INTO `cloud_area` VALUES ('320682', 320600, '如皋市');
INSERT INTO `cloud_area` VALUES ('320684', 320600, '海门市');
INSERT INTO `cloud_area` VALUES ('320700', 320000, '连云港市');
INSERT INTO `cloud_area` VALUES ('320701', 320700, '市辖区');
INSERT INTO `cloud_area` VALUES ('320703', 320700, '连云区');
INSERT INTO `cloud_area` VALUES ('320706', 320700, '海州区');
INSERT INTO `cloud_area` VALUES ('320707', 320700, '赣榆区');
INSERT INTO `cloud_area` VALUES ('320722', 320700, '东海县');
INSERT INTO `cloud_area` VALUES ('320723', 320700, '灌云县');
INSERT INTO `cloud_area` VALUES ('320724', 320700, '灌南县');
INSERT INTO `cloud_area` VALUES ('320800', 320000, '淮安市');
INSERT INTO `cloud_area` VALUES ('320801', 320800, '市辖区');
INSERT INTO `cloud_area` VALUES ('320802', 320800, '清河区');
INSERT INTO `cloud_area` VALUES ('320803', 320800, '淮安区');
INSERT INTO `cloud_area` VALUES ('320804', 320800, '淮阴区');
INSERT INTO `cloud_area` VALUES ('320811', 320800, '清浦区');
INSERT INTO `cloud_area` VALUES ('320826', 320800, '涟水县');
INSERT INTO `cloud_area` VALUES ('320829', 320800, '洪泽县');
INSERT INTO `cloud_area` VALUES ('320830', 320800, '盱眙县');
INSERT INTO `cloud_area` VALUES ('320831', 320800, '金湖县');
INSERT INTO `cloud_area` VALUES ('320900', 320000, '盐城市');
INSERT INTO `cloud_area` VALUES ('320901', 320900, '市辖区');
INSERT INTO `cloud_area` VALUES ('320902', 320900, '亭湖区');
INSERT INTO `cloud_area` VALUES ('320903', 320900, '盐都区');
INSERT INTO `cloud_area` VALUES ('320904', 320900, '大丰区');
INSERT INTO `cloud_area` VALUES ('320921', 320900, '响水县');
INSERT INTO `cloud_area` VALUES ('320922', 320900, '滨海县');
INSERT INTO `cloud_area` VALUES ('320923', 320900, '阜宁县');
INSERT INTO `cloud_area` VALUES ('320924', 320900, '射阳县');
INSERT INTO `cloud_area` VALUES ('320925', 320900, '建湖县');
INSERT INTO `cloud_area` VALUES ('320981', 320900, '东台市');
INSERT INTO `cloud_area` VALUES ('321000', 320000, '扬州市');
INSERT INTO `cloud_area` VALUES ('321001', 321000, '市辖区');
INSERT INTO `cloud_area` VALUES ('321002', 321000, '广陵区');
INSERT INTO `cloud_area` VALUES ('321003', 321000, '邗江区');
INSERT INTO `cloud_area` VALUES ('321012', 321000, '江都区');
INSERT INTO `cloud_area` VALUES ('321023', 321000, '宝应县');
INSERT INTO `cloud_area` VALUES ('321081', 321000, '仪征市');
INSERT INTO `cloud_area` VALUES ('321084', 321000, '高邮市');
INSERT INTO `cloud_area` VALUES ('321100', 320000, '镇江市');
INSERT INTO `cloud_area` VALUES ('321101', 321100, '市辖区');
INSERT INTO `cloud_area` VALUES ('321102', 321100, '京口区');
INSERT INTO `cloud_area` VALUES ('321111', 321100, '润州区');
INSERT INTO `cloud_area` VALUES ('321112', 321100, '丹徒区');
INSERT INTO `cloud_area` VALUES ('321181', 321100, '丹阳市');
INSERT INTO `cloud_area` VALUES ('321182', 321100, '扬中市');
INSERT INTO `cloud_area` VALUES ('321183', 321100, '句容市');
INSERT INTO `cloud_area` VALUES ('321200', 320000, '泰州市');
INSERT INTO `cloud_area` VALUES ('321201', 321200, '市辖区');
INSERT INTO `cloud_area` VALUES ('321202', 321200, '海陵区');
INSERT INTO `cloud_area` VALUES ('321203', 321200, '高港区');
INSERT INTO `cloud_area` VALUES ('321204', 321200, '姜堰区');
INSERT INTO `cloud_area` VALUES ('321281', 321200, '兴化市');
INSERT INTO `cloud_area` VALUES ('321282', 321200, '靖江市');
INSERT INTO `cloud_area` VALUES ('321283', 321200, '泰兴市');
INSERT INTO `cloud_area` VALUES ('321300', 320000, '宿迁市');
INSERT INTO `cloud_area` VALUES ('321301', 321300, '市辖区');
INSERT INTO `cloud_area` VALUES ('321302', 321300, '宿城区');
INSERT INTO `cloud_area` VALUES ('321311', 321300, '宿豫区');
INSERT INTO `cloud_area` VALUES ('321322', 321300, '沭阳县');
INSERT INTO `cloud_area` VALUES ('321323', 321300, '泗阳县');
INSERT INTO `cloud_area` VALUES ('321324', 321300, '泗洪县');
INSERT INTO `cloud_area` VALUES ('330000', null, '浙江省');
INSERT INTO `cloud_area` VALUES ('330100', 330000, '杭州市');
INSERT INTO `cloud_area` VALUES ('330101', 330100, '市辖区');
INSERT INTO `cloud_area` VALUES ('330102', 330100, '上城区');
INSERT INTO `cloud_area` VALUES ('330103', 330100, '下城区');
INSERT INTO `cloud_area` VALUES ('330104', 330100, '江干区');
INSERT INTO `cloud_area` VALUES ('330105', 330100, '拱墅区');
INSERT INTO `cloud_area` VALUES ('330106', 330100, '西湖区');
INSERT INTO `cloud_area` VALUES ('330108', 330100, '滨江区');
INSERT INTO `cloud_area` VALUES ('330109', 330100, '萧山区');
INSERT INTO `cloud_area` VALUES ('330110', 330100, '余杭区');
INSERT INTO `cloud_area` VALUES ('330111', 330100, '富阳区');
INSERT INTO `cloud_area` VALUES ('330122', 330100, '桐庐县');
INSERT INTO `cloud_area` VALUES ('330127', 330100, '淳安县');
INSERT INTO `cloud_area` VALUES ('330182', 330100, '建德市');
INSERT INTO `cloud_area` VALUES ('330185', 330100, '临安市');
INSERT INTO `cloud_area` VALUES ('330200', 330000, '宁波市');
INSERT INTO `cloud_area` VALUES ('330201', 330200, '市辖区');
INSERT INTO `cloud_area` VALUES ('330203', 330200, '海曙区');
INSERT INTO `cloud_area` VALUES ('330204', 330200, '江东区');
INSERT INTO `cloud_area` VALUES ('330205', 330200, '江北区');
INSERT INTO `cloud_area` VALUES ('330206', 330200, '北仑区');
INSERT INTO `cloud_area` VALUES ('330211', 330200, '镇海区');
INSERT INTO `cloud_area` VALUES ('330212', 330200, '鄞州区');
INSERT INTO `cloud_area` VALUES ('330225', 330200, '象山县');
INSERT INTO `cloud_area` VALUES ('330226', 330200, '宁海县');
INSERT INTO `cloud_area` VALUES ('330281', 330200, '余姚市');
INSERT INTO `cloud_area` VALUES ('330282', 330200, '慈溪市');
INSERT INTO `cloud_area` VALUES ('330283', 330200, '奉化市');
INSERT INTO `cloud_area` VALUES ('330300', 330000, '温州市');
INSERT INTO `cloud_area` VALUES ('330301', 330300, '市辖区');
INSERT INTO `cloud_area` VALUES ('330302', 330300, '鹿城区');
INSERT INTO `cloud_area` VALUES ('330303', 330300, '龙湾区');
INSERT INTO `cloud_area` VALUES ('330304', 330300, '瓯海区');
INSERT INTO `cloud_area` VALUES ('330305', 330300, '洞头区');
INSERT INTO `cloud_area` VALUES ('330324', 330300, '永嘉县');
INSERT INTO `cloud_area` VALUES ('330326', 330300, '平阳县');
INSERT INTO `cloud_area` VALUES ('330327', 330300, '苍南县');
INSERT INTO `cloud_area` VALUES ('330328', 330300, '文成县');
INSERT INTO `cloud_area` VALUES ('330329', 330300, '泰顺县');
INSERT INTO `cloud_area` VALUES ('330381', 330300, '瑞安市');
INSERT INTO `cloud_area` VALUES ('330382', 330300, '乐清市');
INSERT INTO `cloud_area` VALUES ('330400', 330000, '嘉兴市');
INSERT INTO `cloud_area` VALUES ('330401', 330400, '市辖区');
INSERT INTO `cloud_area` VALUES ('330402', 330400, '南湖区');
INSERT INTO `cloud_area` VALUES ('330411', 330400, '秀洲区');
INSERT INTO `cloud_area` VALUES ('330421', 330400, '嘉善县');
INSERT INTO `cloud_area` VALUES ('330424', 330400, '海盐县');
INSERT INTO `cloud_area` VALUES ('330481', 330400, '海宁市');
INSERT INTO `cloud_area` VALUES ('330482', 330400, '平湖市');
INSERT INTO `cloud_area` VALUES ('330483', 330400, '桐乡市');
INSERT INTO `cloud_area` VALUES ('330500', 330000, '湖州市');
INSERT INTO `cloud_area` VALUES ('330501', 330500, '市辖区');
INSERT INTO `cloud_area` VALUES ('330502', 330500, '吴兴区');
INSERT INTO `cloud_area` VALUES ('330503', 330500, '南浔区');
INSERT INTO `cloud_area` VALUES ('330521', 330500, '德清县');
INSERT INTO `cloud_area` VALUES ('330522', 330500, '长兴县');
INSERT INTO `cloud_area` VALUES ('330523', 330500, '安吉县');
INSERT INTO `cloud_area` VALUES ('330600', 330000, '绍兴市');
INSERT INTO `cloud_area` VALUES ('330601', 330600, '市辖区');
INSERT INTO `cloud_area` VALUES ('330602', 330600, '越城区');
INSERT INTO `cloud_area` VALUES ('330603', 330600, '柯桥区');
INSERT INTO `cloud_area` VALUES ('330604', 330600, '上虞区');
INSERT INTO `cloud_area` VALUES ('330624', 330600, '新昌县');
INSERT INTO `cloud_area` VALUES ('330681', 330600, '诸暨市');
INSERT INTO `cloud_area` VALUES ('330683', 330600, '嵊州市');
INSERT INTO `cloud_area` VALUES ('330700', 330000, '金华市');
INSERT INTO `cloud_area` VALUES ('330701', 330700, '市辖区');
INSERT INTO `cloud_area` VALUES ('330702', 330700, '婺城区');
INSERT INTO `cloud_area` VALUES ('330703', 330700, '金东区');
INSERT INTO `cloud_area` VALUES ('330723', 330700, '武义县');
INSERT INTO `cloud_area` VALUES ('330726', 330700, '浦江县');
INSERT INTO `cloud_area` VALUES ('330727', 330700, '磐安县');
INSERT INTO `cloud_area` VALUES ('330781', 330700, '兰溪市');
INSERT INTO `cloud_area` VALUES ('330782', 330700, '义乌市');
INSERT INTO `cloud_area` VALUES ('330783', 330700, '东阳市');
INSERT INTO `cloud_area` VALUES ('330784', 330700, '永康市');
INSERT INTO `cloud_area` VALUES ('330800', 330000, '衢州市');
INSERT INTO `cloud_area` VALUES ('330801', 330800, '市辖区');
INSERT INTO `cloud_area` VALUES ('330802', 330800, '柯城区');
INSERT INTO `cloud_area` VALUES ('330803', 330800, '衢江区');
INSERT INTO `cloud_area` VALUES ('330822', 330800, '常山县');
INSERT INTO `cloud_area` VALUES ('330824', 330800, '开化县');
INSERT INTO `cloud_area` VALUES ('330825', 330800, '龙游县');
INSERT INTO `cloud_area` VALUES ('330881', 330800, '江山市');
INSERT INTO `cloud_area` VALUES ('330900', 330000, '舟山市');
INSERT INTO `cloud_area` VALUES ('330901', 330900, '市辖区');
INSERT INTO `cloud_area` VALUES ('330902', 330900, '定海区');
INSERT INTO `cloud_area` VALUES ('330903', 330900, '普陀区');
INSERT INTO `cloud_area` VALUES ('330921', 330900, '岱山县');
INSERT INTO `cloud_area` VALUES ('330922', 330900, '嵊泗县');
INSERT INTO `cloud_area` VALUES ('331000', 330000, '台州市');
INSERT INTO `cloud_area` VALUES ('331001', 331000, '市辖区');
INSERT INTO `cloud_area` VALUES ('331002', 331000, '椒江区');
INSERT INTO `cloud_area` VALUES ('331003', 331000, '黄岩区');
INSERT INTO `cloud_area` VALUES ('331004', 331000, '路桥区');
INSERT INTO `cloud_area` VALUES ('331021', 331000, '玉环县');
INSERT INTO `cloud_area` VALUES ('331022', 331000, '三门县');
INSERT INTO `cloud_area` VALUES ('331023', 331000, '天台县');
INSERT INTO `cloud_area` VALUES ('331024', 331000, '仙居县');
INSERT INTO `cloud_area` VALUES ('331081', 331000, '温岭市');
INSERT INTO `cloud_area` VALUES ('331082', 331000, '临海市');
INSERT INTO `cloud_area` VALUES ('331100', 330000, '丽水市');
INSERT INTO `cloud_area` VALUES ('331101', 331100, '市辖区');
INSERT INTO `cloud_area` VALUES ('331102', 331100, '莲都区');
INSERT INTO `cloud_area` VALUES ('331121', 331100, '青田县');
INSERT INTO `cloud_area` VALUES ('331122', 331100, '缙云县');
INSERT INTO `cloud_area` VALUES ('331123', 331100, '遂昌县');
INSERT INTO `cloud_area` VALUES ('331124', 331100, '松阳县');
INSERT INTO `cloud_area` VALUES ('331125', 331100, '云和县');
INSERT INTO `cloud_area` VALUES ('331126', 331100, '庆元县');
INSERT INTO `cloud_area` VALUES ('331127', 331100, '景宁畲族自治县');
INSERT INTO `cloud_area` VALUES ('331181', 331100, '龙泉市');
INSERT INTO `cloud_area` VALUES ('340000', null, '安徽省');
INSERT INTO `cloud_area` VALUES ('340100', 340000, '合肥市');
INSERT INTO `cloud_area` VALUES ('340101', 340100, '市辖区');
INSERT INTO `cloud_area` VALUES ('340102', 340100, '瑶海区');
INSERT INTO `cloud_area` VALUES ('340103', 340100, '庐阳区');
INSERT INTO `cloud_area` VALUES ('340104', 340100, '蜀山区');
INSERT INTO `cloud_area` VALUES ('340111', 340100, '包河区');
INSERT INTO `cloud_area` VALUES ('340121', 340100, '长丰县');
INSERT INTO `cloud_area` VALUES ('340122', 340100, '肥东县');
INSERT INTO `cloud_area` VALUES ('340123', 340100, '肥西县');
INSERT INTO `cloud_area` VALUES ('340124', 340100, '庐江县');
INSERT INTO `cloud_area` VALUES ('340181', 340100, '巢湖市');
INSERT INTO `cloud_area` VALUES ('340200', 340000, '芜湖市');
INSERT INTO `cloud_area` VALUES ('340201', 340200, '市辖区');
INSERT INTO `cloud_area` VALUES ('340202', 340200, '镜湖区');
INSERT INTO `cloud_area` VALUES ('340203', 340200, '弋江区');
INSERT INTO `cloud_area` VALUES ('340207', 340200, '鸠江区');
INSERT INTO `cloud_area` VALUES ('340208', 340200, '三山区');
INSERT INTO `cloud_area` VALUES ('340221', 340200, '芜湖县');
INSERT INTO `cloud_area` VALUES ('340222', 340200, '繁昌县');
INSERT INTO `cloud_area` VALUES ('340223', 340200, '南陵县');
INSERT INTO `cloud_area` VALUES ('340225', 340200, '无为县');
INSERT INTO `cloud_area` VALUES ('340300', 340000, '蚌埠市');
INSERT INTO `cloud_area` VALUES ('340301', 340300, '市辖区');
INSERT INTO `cloud_area` VALUES ('340302', 340300, '龙子湖区');
INSERT INTO `cloud_area` VALUES ('340303', 340300, '蚌山区');
INSERT INTO `cloud_area` VALUES ('340304', 340300, '禹会区');
INSERT INTO `cloud_area` VALUES ('340311', 340300, '淮上区');
INSERT INTO `cloud_area` VALUES ('340321', 340300, '怀远县');
INSERT INTO `cloud_area` VALUES ('340322', 340300, '五河县');
INSERT INTO `cloud_area` VALUES ('340323', 340300, '固镇县');
INSERT INTO `cloud_area` VALUES ('340400', 340000, '淮南市');
INSERT INTO `cloud_area` VALUES ('340401', 340400, '市辖区');
INSERT INTO `cloud_area` VALUES ('340402', 340400, '大通区');
INSERT INTO `cloud_area` VALUES ('340403', 340400, '田家庵区');
INSERT INTO `cloud_area` VALUES ('340404', 340400, '谢家集区');
INSERT INTO `cloud_area` VALUES ('340405', 340400, '八公山区');
INSERT INTO `cloud_area` VALUES ('340406', 340400, '潘集区');
INSERT INTO `cloud_area` VALUES ('340421', 340400, '凤台县');
INSERT INTO `cloud_area` VALUES ('340500', 340000, '马鞍山市');
INSERT INTO `cloud_area` VALUES ('340501', 340500, '市辖区');
INSERT INTO `cloud_area` VALUES ('340503', 340500, '花山区');
INSERT INTO `cloud_area` VALUES ('340504', 340500, '雨山区');
INSERT INTO `cloud_area` VALUES ('340506', 340500, '博望区');
INSERT INTO `cloud_area` VALUES ('340521', 340500, '当涂县');
INSERT INTO `cloud_area` VALUES ('340522', 340500, '含山县');
INSERT INTO `cloud_area` VALUES ('340523', 340500, '和县');
INSERT INTO `cloud_area` VALUES ('340600', 340000, '淮北市');
INSERT INTO `cloud_area` VALUES ('340601', 340600, '市辖区');
INSERT INTO `cloud_area` VALUES ('340602', 340600, '杜集区');
INSERT INTO `cloud_area` VALUES ('340603', 340600, '相山区');
INSERT INTO `cloud_area` VALUES ('340604', 340600, '烈山区');
INSERT INTO `cloud_area` VALUES ('340621', 340600, '濉溪县');
INSERT INTO `cloud_area` VALUES ('340700', 340000, '铜陵市');
INSERT INTO `cloud_area` VALUES ('340701', 340700, '市辖区');
INSERT INTO `cloud_area` VALUES ('340702', 340700, '铜官山区');
INSERT INTO `cloud_area` VALUES ('340703', 340700, '狮子山区');
INSERT INTO `cloud_area` VALUES ('340711', 340700, '郊区');
INSERT INTO `cloud_area` VALUES ('340721', 340700, '铜陵县');
INSERT INTO `cloud_area` VALUES ('340800', 340000, '安庆市');
INSERT INTO `cloud_area` VALUES ('340801', 340800, '市辖区');
INSERT INTO `cloud_area` VALUES ('340802', 340800, '迎江区');
INSERT INTO `cloud_area` VALUES ('340803', 340800, '大观区');
INSERT INTO `cloud_area` VALUES ('340811', 340800, '宜秀区');
INSERT INTO `cloud_area` VALUES ('340822', 340800, '怀宁县');
INSERT INTO `cloud_area` VALUES ('340823', 340800, '枞阳县');
INSERT INTO `cloud_area` VALUES ('340824', 340800, '潜山县');
INSERT INTO `cloud_area` VALUES ('340825', 340800, '太湖县');
INSERT INTO `cloud_area` VALUES ('340826', 340800, '宿松县');
INSERT INTO `cloud_area` VALUES ('340827', 340800, '望江县');
INSERT INTO `cloud_area` VALUES ('340828', 340800, '岳西县');
INSERT INTO `cloud_area` VALUES ('340881', 340800, '桐城市');
INSERT INTO `cloud_area` VALUES ('341000', 340000, '黄山市');
INSERT INTO `cloud_area` VALUES ('341001', 341000, '市辖区');
INSERT INTO `cloud_area` VALUES ('341002', 341000, '屯溪区');
INSERT INTO `cloud_area` VALUES ('341003', 341000, '黄山区');
INSERT INTO `cloud_area` VALUES ('341004', 341000, '徽州区');
INSERT INTO `cloud_area` VALUES ('341021', 341000, '歙县');
INSERT INTO `cloud_area` VALUES ('341022', 341000, '休宁县');
INSERT INTO `cloud_area` VALUES ('341023', 341000, '黟县');
INSERT INTO `cloud_area` VALUES ('341024', 341000, '祁门县');
INSERT INTO `cloud_area` VALUES ('341100', 340000, '滁州市');
INSERT INTO `cloud_area` VALUES ('341101', 341100, '市辖区');
INSERT INTO `cloud_area` VALUES ('341102', 341100, '琅琊区');
INSERT INTO `cloud_area` VALUES ('341103', 341100, '南谯区');
INSERT INTO `cloud_area` VALUES ('341122', 341100, '来安县');
INSERT INTO `cloud_area` VALUES ('341124', 341100, '全椒县');
INSERT INTO `cloud_area` VALUES ('341125', 341100, '定远县');
INSERT INTO `cloud_area` VALUES ('341126', 341100, '凤阳县');
INSERT INTO `cloud_area` VALUES ('341181', 341100, '天长市');
INSERT INTO `cloud_area` VALUES ('341182', 341100, '明光市');
INSERT INTO `cloud_area` VALUES ('341200', 340000, '阜阳市');
INSERT INTO `cloud_area` VALUES ('341201', 341200, '市辖区');
INSERT INTO `cloud_area` VALUES ('341202', 341200, '颍州区');
INSERT INTO `cloud_area` VALUES ('341203', 341200, '颍东区');
INSERT INTO `cloud_area` VALUES ('341204', 341200, '颍泉区');
INSERT INTO `cloud_area` VALUES ('341221', 341200, '临泉县');
INSERT INTO `cloud_area` VALUES ('341222', 341200, '太和县');
INSERT INTO `cloud_area` VALUES ('341225', 341200, '阜南县');
INSERT INTO `cloud_area` VALUES ('341226', 341200, '颍上县');
INSERT INTO `cloud_area` VALUES ('341282', 341200, '界首市');
INSERT INTO `cloud_area` VALUES ('341300', 340000, '宿州市');
INSERT INTO `cloud_area` VALUES ('341301', 341300, '市辖区');
INSERT INTO `cloud_area` VALUES ('341302', 341300, '??桥区');
INSERT INTO `cloud_area` VALUES ('341321', 341300, '砀山县');
INSERT INTO `cloud_area` VALUES ('341322', 341300, '萧县');
INSERT INTO `cloud_area` VALUES ('341323', 341300, '灵璧县');
INSERT INTO `cloud_area` VALUES ('341324', 341300, '泗县');
INSERT INTO `cloud_area` VALUES ('341500', 340000, '六安市');
INSERT INTO `cloud_area` VALUES ('341501', 341500, '市辖区');
INSERT INTO `cloud_area` VALUES ('341502', 341500, '金安区');
INSERT INTO `cloud_area` VALUES ('341503', 341500, '裕安区');
INSERT INTO `cloud_area` VALUES ('341521', 341500, '寿县');
INSERT INTO `cloud_area` VALUES ('341522', 341500, '霍邱县');
INSERT INTO `cloud_area` VALUES ('341523', 341500, '舒城县');
INSERT INTO `cloud_area` VALUES ('341524', 341500, '金寨县');
INSERT INTO `cloud_area` VALUES ('341525', 341500, '霍山县');
INSERT INTO `cloud_area` VALUES ('341600', 340000, '亳州市');
INSERT INTO `cloud_area` VALUES ('341601', 341600, '市辖区');
INSERT INTO `cloud_area` VALUES ('341602', 341600, '谯城区');
INSERT INTO `cloud_area` VALUES ('341621', 341600, '涡阳县');
INSERT INTO `cloud_area` VALUES ('341622', 341600, '蒙城县');
INSERT INTO `cloud_area` VALUES ('341623', 341600, '利辛县');
INSERT INTO `cloud_area` VALUES ('341700', 340000, '池州市');
INSERT INTO `cloud_area` VALUES ('341701', 341700, '市辖区');
INSERT INTO `cloud_area` VALUES ('341702', 341700, '贵池区');
INSERT INTO `cloud_area` VALUES ('341721', 341700, '东至县');
INSERT INTO `cloud_area` VALUES ('341722', 341700, '石台县');
INSERT INTO `cloud_area` VALUES ('341723', 341700, '青阳县');
INSERT INTO `cloud_area` VALUES ('341800', 340000, '宣城市');
INSERT INTO `cloud_area` VALUES ('341801', 341800, '市辖区');
INSERT INTO `cloud_area` VALUES ('341802', 341800, '宣州区');
INSERT INTO `cloud_area` VALUES ('341821', 341800, '郎溪县');
INSERT INTO `cloud_area` VALUES ('341822', 341800, '广德县');
INSERT INTO `cloud_area` VALUES ('341823', 341800, '泾县');
INSERT INTO `cloud_area` VALUES ('341824', 341800, '绩溪县');
INSERT INTO `cloud_area` VALUES ('341825', 341800, '旌德县');
INSERT INTO `cloud_area` VALUES ('341881', 341800, '宁国市');
INSERT INTO `cloud_area` VALUES ('350000', null, '福建省');
INSERT INTO `cloud_area` VALUES ('350100', 350000, '福州市');
INSERT INTO `cloud_area` VALUES ('350101', 350100, '市辖区');
INSERT INTO `cloud_area` VALUES ('350102', 350100, '鼓楼区');
INSERT INTO `cloud_area` VALUES ('350103', 350100, '台江区');
INSERT INTO `cloud_area` VALUES ('350104', 350100, '仓山区');
INSERT INTO `cloud_area` VALUES ('350105', 350100, '马尾区');
INSERT INTO `cloud_area` VALUES ('350111', 350100, '晋安区');
INSERT INTO `cloud_area` VALUES ('350121', 350100, '闽侯县');
INSERT INTO `cloud_area` VALUES ('350122', 350100, '连江县');
INSERT INTO `cloud_area` VALUES ('350123', 350100, '罗源县');
INSERT INTO `cloud_area` VALUES ('350124', 350100, '闽清县');
INSERT INTO `cloud_area` VALUES ('350125', 350100, '永泰县');
INSERT INTO `cloud_area` VALUES ('350128', 350100, '平潭县');
INSERT INTO `cloud_area` VALUES ('350181', 350100, '福清市');
INSERT INTO `cloud_area` VALUES ('350182', 350100, '长乐市');
INSERT INTO `cloud_area` VALUES ('350200', 350000, '厦门市');
INSERT INTO `cloud_area` VALUES ('350201', 350200, '市辖区');
INSERT INTO `cloud_area` VALUES ('350203', 350200, '思明区');
INSERT INTO `cloud_area` VALUES ('350205', 350200, '海沧区');
INSERT INTO `cloud_area` VALUES ('350206', 350200, '湖里区');
INSERT INTO `cloud_area` VALUES ('350211', 350200, '集美区');
INSERT INTO `cloud_area` VALUES ('350212', 350200, '同安区');
INSERT INTO `cloud_area` VALUES ('350213', 350200, '翔安区');
INSERT INTO `cloud_area` VALUES ('350300', 350000, '莆田市');
INSERT INTO `cloud_area` VALUES ('350301', 350300, '市辖区');
INSERT INTO `cloud_area` VALUES ('350302', 350300, '城厢区');
INSERT INTO `cloud_area` VALUES ('350303', 350300, '涵江区');
INSERT INTO `cloud_area` VALUES ('350304', 350300, '荔城区');
INSERT INTO `cloud_area` VALUES ('350305', 350300, '秀屿区');
INSERT INTO `cloud_area` VALUES ('350322', 350300, '仙游县');
INSERT INTO `cloud_area` VALUES ('350400', 350000, '三明市');
INSERT INTO `cloud_area` VALUES ('350401', 350400, '市辖区');
INSERT INTO `cloud_area` VALUES ('350402', 350400, '梅列区');
INSERT INTO `cloud_area` VALUES ('350403', 350400, '三元区');
INSERT INTO `cloud_area` VALUES ('350421', 350400, '明溪县');
INSERT INTO `cloud_area` VALUES ('350423', 350400, '清流县');
INSERT INTO `cloud_area` VALUES ('350424', 350400, '宁化县');
INSERT INTO `cloud_area` VALUES ('350425', 350400, '大田县');
INSERT INTO `cloud_area` VALUES ('350426', 350400, '尤溪县');
INSERT INTO `cloud_area` VALUES ('350427', 350400, '沙县');
INSERT INTO `cloud_area` VALUES ('350428', 350400, '将乐县');
INSERT INTO `cloud_area` VALUES ('350429', 350400, '泰宁县');
INSERT INTO `cloud_area` VALUES ('350430', 350400, '建宁县');
INSERT INTO `cloud_area` VALUES ('350481', 350400, '永安市');
INSERT INTO `cloud_area` VALUES ('350500', 350000, '泉州市');
INSERT INTO `cloud_area` VALUES ('350501', 350500, '市辖区');
INSERT INTO `cloud_area` VALUES ('350502', 350500, '鲤城区');
INSERT INTO `cloud_area` VALUES ('350503', 350500, '丰泽区');
INSERT INTO `cloud_area` VALUES ('350504', 350500, '洛江区');
INSERT INTO `cloud_area` VALUES ('350505', 350500, '泉港区');
INSERT INTO `cloud_area` VALUES ('350521', 350500, '惠安县');
INSERT INTO `cloud_area` VALUES ('350524', 350500, '安溪县');
INSERT INTO `cloud_area` VALUES ('350525', 350500, '永春县');
INSERT INTO `cloud_area` VALUES ('350526', 350500, '德化县');
INSERT INTO `cloud_area` VALUES ('350527', 350500, '金门县');
INSERT INTO `cloud_area` VALUES ('350581', 350500, '石狮市');
INSERT INTO `cloud_area` VALUES ('350582', 350500, '晋江市');
INSERT INTO `cloud_area` VALUES ('350583', 350500, '南安市');
INSERT INTO `cloud_area` VALUES ('350600', 350000, '漳州市');
INSERT INTO `cloud_area` VALUES ('350601', 350600, '市辖区');
INSERT INTO `cloud_area` VALUES ('350602', 350600, '芗城区');
INSERT INTO `cloud_area` VALUES ('350603', 350600, '龙文区');
INSERT INTO `cloud_area` VALUES ('350622', 350600, '云霄县');
INSERT INTO `cloud_area` VALUES ('350623', 350600, '漳浦县');
INSERT INTO `cloud_area` VALUES ('350624', 350600, '诏安县');
INSERT INTO `cloud_area` VALUES ('350625', 350600, '长泰县');
INSERT INTO `cloud_area` VALUES ('350626', 350600, '东山县');
INSERT INTO `cloud_area` VALUES ('350627', 350600, '南靖县');
INSERT INTO `cloud_area` VALUES ('350628', 350600, '平和县');
INSERT INTO `cloud_area` VALUES ('350629', 350600, '华安县');
INSERT INTO `cloud_area` VALUES ('350681', 350600, '龙海市');
INSERT INTO `cloud_area` VALUES ('350700', 350000, '南平市');
INSERT INTO `cloud_area` VALUES ('350701', 350700, '市辖区');
INSERT INTO `cloud_area` VALUES ('350702', 350700, '延平区');
INSERT INTO `cloud_area` VALUES ('350703', 350700, '建阳区');
INSERT INTO `cloud_area` VALUES ('350721', 350700, '顺昌县');
INSERT INTO `cloud_area` VALUES ('350722', 350700, '浦城县');
INSERT INTO `cloud_area` VALUES ('350723', 350700, '光泽县');
INSERT INTO `cloud_area` VALUES ('350724', 350700, '松溪县');
INSERT INTO `cloud_area` VALUES ('350725', 350700, '政和县');
INSERT INTO `cloud_area` VALUES ('350781', 350700, '邵武市');
INSERT INTO `cloud_area` VALUES ('350782', 350700, '武夷山市');
INSERT INTO `cloud_area` VALUES ('350783', 350700, '建瓯市');
INSERT INTO `cloud_area` VALUES ('350800', 350000, '龙岩市');
INSERT INTO `cloud_area` VALUES ('350801', 350800, '市辖区');
INSERT INTO `cloud_area` VALUES ('350802', 350800, '新罗区');
INSERT INTO `cloud_area` VALUES ('350803', 350800, '永定区');
INSERT INTO `cloud_area` VALUES ('350821', 350800, '长汀县');
INSERT INTO `cloud_area` VALUES ('350823', 350800, '上杭县');
INSERT INTO `cloud_area` VALUES ('350824', 350800, '武平县');
INSERT INTO `cloud_area` VALUES ('350825', 350800, '连城县');
INSERT INTO `cloud_area` VALUES ('350881', 350800, '漳平市');
INSERT INTO `cloud_area` VALUES ('350900', 350000, '宁德市');
INSERT INTO `cloud_area` VALUES ('350901', 350900, '市辖区');
INSERT INTO `cloud_area` VALUES ('350902', 350900, '蕉城区');
INSERT INTO `cloud_area` VALUES ('350921', 350900, '霞浦县');
INSERT INTO `cloud_area` VALUES ('350922', 350900, '古田县');
INSERT INTO `cloud_area` VALUES ('350923', 350900, '屏南县');
INSERT INTO `cloud_area` VALUES ('350924', 350900, '寿宁县');
INSERT INTO `cloud_area` VALUES ('350925', 350900, '周宁县');
INSERT INTO `cloud_area` VALUES ('350926', 350900, '柘荣县');
INSERT INTO `cloud_area` VALUES ('350981', 350900, '福安市');
INSERT INTO `cloud_area` VALUES ('350982', 350900, '福鼎市');
INSERT INTO `cloud_area` VALUES ('360000', null, '江西省');
INSERT INTO `cloud_area` VALUES ('360100', 360000, '南昌市');
INSERT INTO `cloud_area` VALUES ('360101', 360100, '市辖区');
INSERT INTO `cloud_area` VALUES ('360102', 360100, '东湖区');
INSERT INTO `cloud_area` VALUES ('360103', 360100, '西湖区');
INSERT INTO `cloud_area` VALUES ('360104', 360100, '青云谱区');
INSERT INTO `cloud_area` VALUES ('360105', 360100, '湾里区');
INSERT INTO `cloud_area` VALUES ('360111', 360100, '青山湖区');
INSERT INTO `cloud_area` VALUES ('360112', 360100, '新建区');
INSERT INTO `cloud_area` VALUES ('360121', 360100, '南昌县');
INSERT INTO `cloud_area` VALUES ('360123', 360100, '安义县');
INSERT INTO `cloud_area` VALUES ('360124', 360100, '进贤县');
INSERT INTO `cloud_area` VALUES ('360200', 360000, '景德镇市');
INSERT INTO `cloud_area` VALUES ('360201', 360200, '市辖区');
INSERT INTO `cloud_area` VALUES ('360202', 360200, '昌江区');
INSERT INTO `cloud_area` VALUES ('360203', 360200, '珠山区');
INSERT INTO `cloud_area` VALUES ('360222', 360200, '浮梁县');
INSERT INTO `cloud_area` VALUES ('360281', 360200, '乐平市');
INSERT INTO `cloud_area` VALUES ('360300', 360000, '萍乡市');
INSERT INTO `cloud_area` VALUES ('360301', 360300, '市辖区');
INSERT INTO `cloud_area` VALUES ('360302', 360300, '安源区');
INSERT INTO `cloud_area` VALUES ('360313', 360300, '湘东区');
INSERT INTO `cloud_area` VALUES ('360321', 360300, '莲花县');
INSERT INTO `cloud_area` VALUES ('360322', 360300, '上栗县');
INSERT INTO `cloud_area` VALUES ('360323', 360300, '芦溪县');
INSERT INTO `cloud_area` VALUES ('360400', 360000, '九江市');
INSERT INTO `cloud_area` VALUES ('360401', 360400, '市辖区');
INSERT INTO `cloud_area` VALUES ('360402', 360400, '庐山区');
INSERT INTO `cloud_area` VALUES ('360403', 360400, '浔阳区');
INSERT INTO `cloud_area` VALUES ('360421', 360400, '九江县');
INSERT INTO `cloud_area` VALUES ('360423', 360400, '武宁县');
INSERT INTO `cloud_area` VALUES ('360424', 360400, '修水县');
INSERT INTO `cloud_area` VALUES ('360425', 360400, '永修县');
INSERT INTO `cloud_area` VALUES ('360426', 360400, '德安县');
INSERT INTO `cloud_area` VALUES ('360427', 360400, '星子县');
INSERT INTO `cloud_area` VALUES ('360428', 360400, '都昌县');
INSERT INTO `cloud_area` VALUES ('360429', 360400, '湖口县');
INSERT INTO `cloud_area` VALUES ('360430', 360400, '彭泽县');
INSERT INTO `cloud_area` VALUES ('360481', 360400, '瑞昌市');
INSERT INTO `cloud_area` VALUES ('360482', 360400, '共青城市');
INSERT INTO `cloud_area` VALUES ('360500', 360000, '新余市');
INSERT INTO `cloud_area` VALUES ('360501', 360500, '市辖区');
INSERT INTO `cloud_area` VALUES ('360502', 360500, '渝水区');
INSERT INTO `cloud_area` VALUES ('360521', 360500, '分宜县');
INSERT INTO `cloud_area` VALUES ('360600', 360000, '鹰潭市');
INSERT INTO `cloud_area` VALUES ('360601', 360600, '市辖区');
INSERT INTO `cloud_area` VALUES ('360602', 360600, '月湖区');
INSERT INTO `cloud_area` VALUES ('360622', 360600, '余江县');
INSERT INTO `cloud_area` VALUES ('360681', 360600, '贵溪市');
INSERT INTO `cloud_area` VALUES ('360700', 360000, '赣州市');
INSERT INTO `cloud_area` VALUES ('360701', 360700, '市辖区');
INSERT INTO `cloud_area` VALUES ('360702', 360700, '章贡区');
INSERT INTO `cloud_area` VALUES ('360703', 360700, '南康区');
INSERT INTO `cloud_area` VALUES ('360721', 360700, '赣县');
INSERT INTO `cloud_area` VALUES ('360722', 360700, '信丰县');
INSERT INTO `cloud_area` VALUES ('360723', 360700, '大余县');
INSERT INTO `cloud_area` VALUES ('360724', 360700, '上犹县');
INSERT INTO `cloud_area` VALUES ('360725', 360700, '崇义县');
INSERT INTO `cloud_area` VALUES ('360726', 360700, '安远县');
INSERT INTO `cloud_area` VALUES ('360727', 360700, '龙南县');
INSERT INTO `cloud_area` VALUES ('360728', 360700, '定南县');
INSERT INTO `cloud_area` VALUES ('360729', 360700, '全南县');
INSERT INTO `cloud_area` VALUES ('360730', 360700, '宁都县');
INSERT INTO `cloud_area` VALUES ('360731', 360700, '于都县');
INSERT INTO `cloud_area` VALUES ('360732', 360700, '兴国县');
INSERT INTO `cloud_area` VALUES ('360733', 360700, '会昌县');
INSERT INTO `cloud_area` VALUES ('360734', 360700, '寻乌县');
INSERT INTO `cloud_area` VALUES ('360735', 360700, '石城县');
INSERT INTO `cloud_area` VALUES ('360781', 360700, '瑞金市');
INSERT INTO `cloud_area` VALUES ('360800', 360000, '吉安市');
INSERT INTO `cloud_area` VALUES ('360801', 360800, '市辖区');
INSERT INTO `cloud_area` VALUES ('360802', 360800, '吉州区');
INSERT INTO `cloud_area` VALUES ('360803', 360800, '青原区');
INSERT INTO `cloud_area` VALUES ('360821', 360800, '吉安县');
INSERT INTO `cloud_area` VALUES ('360822', 360800, '吉水县');
INSERT INTO `cloud_area` VALUES ('360823', 360800, '峡江县');
INSERT INTO `cloud_area` VALUES ('360824', 360800, '新干县');
INSERT INTO `cloud_area` VALUES ('360825', 360800, '永丰县');
INSERT INTO `cloud_area` VALUES ('360826', 360800, '泰和县');
INSERT INTO `cloud_area` VALUES ('360827', 360800, '遂川县');
INSERT INTO `cloud_area` VALUES ('360828', 360800, '万安县');
INSERT INTO `cloud_area` VALUES ('360829', 360800, '安福县');
INSERT INTO `cloud_area` VALUES ('360830', 360800, '永新县');
INSERT INTO `cloud_area` VALUES ('360881', 360800, '井冈山市');
INSERT INTO `cloud_area` VALUES ('360900', 360000, '宜春市');
INSERT INTO `cloud_area` VALUES ('360901', 360900, '市辖区');
INSERT INTO `cloud_area` VALUES ('360902', 360900, '袁州区');
INSERT INTO `cloud_area` VALUES ('360921', 360900, '奉新县');
INSERT INTO `cloud_area` VALUES ('360922', 360900, '万载县');
INSERT INTO `cloud_area` VALUES ('360923', 360900, '上高县');
INSERT INTO `cloud_area` VALUES ('360924', 360900, '宜丰县');
INSERT INTO `cloud_area` VALUES ('360925', 360900, '靖安县');
INSERT INTO `cloud_area` VALUES ('360926', 360900, '铜鼓县');
INSERT INTO `cloud_area` VALUES ('360981', 360900, '丰城市');
INSERT INTO `cloud_area` VALUES ('360982', 360900, '樟树市');
INSERT INTO `cloud_area` VALUES ('360983', 360900, '高安市');
INSERT INTO `cloud_area` VALUES ('361000', 360000, '抚州市');
INSERT INTO `cloud_area` VALUES ('361001', 361000, '市辖区');
INSERT INTO `cloud_area` VALUES ('361002', 361000, '临川区');
INSERT INTO `cloud_area` VALUES ('361021', 361000, '南城县');
INSERT INTO `cloud_area` VALUES ('361022', 361000, '黎川县');
INSERT INTO `cloud_area` VALUES ('361023', 361000, '南丰县');
INSERT INTO `cloud_area` VALUES ('361024', 361000, '崇仁县');
INSERT INTO `cloud_area` VALUES ('361025', 361000, '乐安县');
INSERT INTO `cloud_area` VALUES ('361026', 361000, '宜黄县');
INSERT INTO `cloud_area` VALUES ('361027', 361000, '金溪县');
INSERT INTO `cloud_area` VALUES ('361028', 361000, '资溪县');
INSERT INTO `cloud_area` VALUES ('361029', 361000, '东乡县');
INSERT INTO `cloud_area` VALUES ('361030', 361000, '广昌县');
INSERT INTO `cloud_area` VALUES ('361100', 360000, '上饶市');
INSERT INTO `cloud_area` VALUES ('361101', 361100, '市辖区');
INSERT INTO `cloud_area` VALUES ('361102', 361100, '信州区');
INSERT INTO `cloud_area` VALUES ('361103', 361100, '广丰区');
INSERT INTO `cloud_area` VALUES ('361121', 361100, '上饶县');
INSERT INTO `cloud_area` VALUES ('361123', 361100, '玉山县');
INSERT INTO `cloud_area` VALUES ('361124', 361100, '铅山县');
INSERT INTO `cloud_area` VALUES ('361125', 361100, '横峰县');
INSERT INTO `cloud_area` VALUES ('361126', 361100, '弋阳县');
INSERT INTO `cloud_area` VALUES ('361127', 361100, '余干县');
INSERT INTO `cloud_area` VALUES ('361128', 361100, '鄱阳县');
INSERT INTO `cloud_area` VALUES ('361129', 361100, '万年县');
INSERT INTO `cloud_area` VALUES ('361130', 361100, '婺源县');
INSERT INTO `cloud_area` VALUES ('361181', 361100, '德兴市');
INSERT INTO `cloud_area` VALUES ('370000', null, '山东省');
INSERT INTO `cloud_area` VALUES ('370100', 370000, '济南市');
INSERT INTO `cloud_area` VALUES ('370101', 370100, '市辖区');
INSERT INTO `cloud_area` VALUES ('370102', 370100, '历下区');
INSERT INTO `cloud_area` VALUES ('370103', 370100, '市中区');
INSERT INTO `cloud_area` VALUES ('370104', 370100, '槐荫区');
INSERT INTO `cloud_area` VALUES ('370105', 370100, '天桥区');
INSERT INTO `cloud_area` VALUES ('370112', 370100, '历城区');
INSERT INTO `cloud_area` VALUES ('370113', 370100, '长清区');
INSERT INTO `cloud_area` VALUES ('370124', 370100, '平阴县');
INSERT INTO `cloud_area` VALUES ('370125', 370100, '济阳县');
INSERT INTO `cloud_area` VALUES ('370126', 370100, '商河县');
INSERT INTO `cloud_area` VALUES ('370181', 370100, '章丘市');
INSERT INTO `cloud_area` VALUES ('370200', 370000, '青岛市');
INSERT INTO `cloud_area` VALUES ('370201', 370200, '市辖区');
INSERT INTO `cloud_area` VALUES ('370202', 370200, '市南区');
INSERT INTO `cloud_area` VALUES ('370203', 370200, '市北区');
INSERT INTO `cloud_area` VALUES ('370211', 370200, '黄岛区');
INSERT INTO `cloud_area` VALUES ('370212', 370200, '崂山区');
INSERT INTO `cloud_area` VALUES ('370213', 370200, '李沧区');
INSERT INTO `cloud_area` VALUES ('370214', 370200, '城阳区');
INSERT INTO `cloud_area` VALUES ('370281', 370200, '胶州市');
INSERT INTO `cloud_area` VALUES ('370282', 370200, '即墨市');
INSERT INTO `cloud_area` VALUES ('370283', 370200, '平度市');
INSERT INTO `cloud_area` VALUES ('370285', 370200, '莱西市');
INSERT INTO `cloud_area` VALUES ('370300', 370000, '淄博市');
INSERT INTO `cloud_area` VALUES ('370301', 370300, '市辖区');
INSERT INTO `cloud_area` VALUES ('370302', 370300, '淄川区');
INSERT INTO `cloud_area` VALUES ('370303', 370300, '张店区');
INSERT INTO `cloud_area` VALUES ('370304', 370300, '博山区');
INSERT INTO `cloud_area` VALUES ('370305', 370300, '临淄区');
INSERT INTO `cloud_area` VALUES ('370306', 370300, '周村区');
INSERT INTO `cloud_area` VALUES ('370321', 370300, '桓台县');
INSERT INTO `cloud_area` VALUES ('370322', 370300, '高青县');
INSERT INTO `cloud_area` VALUES ('370323', 370300, '沂源县');
INSERT INTO `cloud_area` VALUES ('370400', 370000, '枣庄市');
INSERT INTO `cloud_area` VALUES ('370401', 370400, '市辖区');
INSERT INTO `cloud_area` VALUES ('370402', 370400, '市中区');
INSERT INTO `cloud_area` VALUES ('370403', 370400, '薛城区');
INSERT INTO `cloud_area` VALUES ('370404', 370400, '峄城区');
INSERT INTO `cloud_area` VALUES ('370405', 370400, '台儿庄区');
INSERT INTO `cloud_area` VALUES ('370406', 370400, '山亭区');
INSERT INTO `cloud_area` VALUES ('370481', 370400, '滕州市');
INSERT INTO `cloud_area` VALUES ('370500', 370000, '东营市');
INSERT INTO `cloud_area` VALUES ('370501', 370500, '市辖区');
INSERT INTO `cloud_area` VALUES ('370502', 370500, '东营区');
INSERT INTO `cloud_area` VALUES ('370503', 370500, '河口区');
INSERT INTO `cloud_area` VALUES ('370521', 370500, '垦利县');
INSERT INTO `cloud_area` VALUES ('370522', 370500, '利津县');
INSERT INTO `cloud_area` VALUES ('370523', 370500, '广饶县');
INSERT INTO `cloud_area` VALUES ('370600', 370000, '烟台市');
INSERT INTO `cloud_area` VALUES ('370601', 370600, '市辖区');
INSERT INTO `cloud_area` VALUES ('370602', 370600, '芝罘区');
INSERT INTO `cloud_area` VALUES ('370611', 370600, '福山区');
INSERT INTO `cloud_area` VALUES ('370612', 370600, '牟平区');
INSERT INTO `cloud_area` VALUES ('370613', 370600, '莱山区');
INSERT INTO `cloud_area` VALUES ('370634', 370600, '长岛县');
INSERT INTO `cloud_area` VALUES ('370681', 370600, '龙口市');
INSERT INTO `cloud_area` VALUES ('370682', 370600, '莱阳市');
INSERT INTO `cloud_area` VALUES ('370683', 370600, '莱州市');
INSERT INTO `cloud_area` VALUES ('370684', 370600, '蓬莱市');
INSERT INTO `cloud_area` VALUES ('370685', 370600, '招远市');
INSERT INTO `cloud_area` VALUES ('370686', 370600, '栖霞市');
INSERT INTO `cloud_area` VALUES ('370687', 370600, '海阳市');
INSERT INTO `cloud_area` VALUES ('370700', 370000, '潍坊市');
INSERT INTO `cloud_area` VALUES ('370701', 370700, '市辖区');
INSERT INTO `cloud_area` VALUES ('370702', 370700, '潍城区');
INSERT INTO `cloud_area` VALUES ('370703', 370700, '寒亭区');
INSERT INTO `cloud_area` VALUES ('370704', 370700, '坊子区');
INSERT INTO `cloud_area` VALUES ('370705', 370700, '奎文区');
INSERT INTO `cloud_area` VALUES ('370724', 370700, '临朐县');
INSERT INTO `cloud_area` VALUES ('370725', 370700, '昌乐县');
INSERT INTO `cloud_area` VALUES ('370781', 370700, '青州市');
INSERT INTO `cloud_area` VALUES ('370782', 370700, '诸城市');
INSERT INTO `cloud_area` VALUES ('370783', 370700, '寿光市');
INSERT INTO `cloud_area` VALUES ('370784', 370700, '安丘市');
INSERT INTO `cloud_area` VALUES ('370785', 370700, '高密市');
INSERT INTO `cloud_area` VALUES ('370786', 370700, '昌邑市');
INSERT INTO `cloud_area` VALUES ('370800', 370000, '济宁市');
INSERT INTO `cloud_area` VALUES ('370801', 370800, '市辖区');
INSERT INTO `cloud_area` VALUES ('370811', 370800, '任城区');
INSERT INTO `cloud_area` VALUES ('370812', 370800, '兖州区');
INSERT INTO `cloud_area` VALUES ('370826', 370800, '微山县');
INSERT INTO `cloud_area` VALUES ('370827', 370800, '鱼台县');
INSERT INTO `cloud_area` VALUES ('370828', 370800, '金乡县');
INSERT INTO `cloud_area` VALUES ('370829', 370800, '嘉祥县');
INSERT INTO `cloud_area` VALUES ('370830', 370800, '汶上县');
INSERT INTO `cloud_area` VALUES ('370831', 370800, '泗水县');
INSERT INTO `cloud_area` VALUES ('370832', 370800, '梁山县');
INSERT INTO `cloud_area` VALUES ('370881', 370800, '曲阜市');
INSERT INTO `cloud_area` VALUES ('370883', 370800, '邹城市');
INSERT INTO `cloud_area` VALUES ('370900', 370000, '泰安市');
INSERT INTO `cloud_area` VALUES ('370901', 370900, '市辖区');
INSERT INTO `cloud_area` VALUES ('370902', 370900, '泰山区');
INSERT INTO `cloud_area` VALUES ('370911', 370900, '岱岳区');
INSERT INTO `cloud_area` VALUES ('370921', 370900, '宁阳县');
INSERT INTO `cloud_area` VALUES ('370923', 370900, '东平县');
INSERT INTO `cloud_area` VALUES ('370982', 370900, '新泰市');
INSERT INTO `cloud_area` VALUES ('370983', 370900, '肥城市');
INSERT INTO `cloud_area` VALUES ('371000', 370000, '威海市');
INSERT INTO `cloud_area` VALUES ('371001', 371000, '市辖区');
INSERT INTO `cloud_area` VALUES ('371002', 371000, '环翠区');
INSERT INTO `cloud_area` VALUES ('371003', 371000, '文登区');
INSERT INTO `cloud_area` VALUES ('371082', 371000, '荣成市');
INSERT INTO `cloud_area` VALUES ('371083', 371000, '乳山市');
INSERT INTO `cloud_area` VALUES ('371100', 370000, '日照市');
INSERT INTO `cloud_area` VALUES ('371101', 371100, '市辖区');
INSERT INTO `cloud_area` VALUES ('371102', 371100, '东港区');
INSERT INTO `cloud_area` VALUES ('371103', 371100, '岚山区');
INSERT INTO `cloud_area` VALUES ('371121', 371100, '五莲县');
INSERT INTO `cloud_area` VALUES ('371122', 371100, '莒县');
INSERT INTO `cloud_area` VALUES ('371200', 370000, '莱芜市');
INSERT INTO `cloud_area` VALUES ('371201', 371200, '市辖区');
INSERT INTO `cloud_area` VALUES ('371202', 371200, '莱城区');
INSERT INTO `cloud_area` VALUES ('371203', 371200, '钢城区');
INSERT INTO `cloud_area` VALUES ('371300', 370000, '临沂市');
INSERT INTO `cloud_area` VALUES ('371301', 371300, '市辖区');
INSERT INTO `cloud_area` VALUES ('371302', 371300, '兰山区');
INSERT INTO `cloud_area` VALUES ('371311', 371300, '罗庄区');
INSERT INTO `cloud_area` VALUES ('371312', 371300, '河东区');
INSERT INTO `cloud_area` VALUES ('371321', 371300, '沂南县');
INSERT INTO `cloud_area` VALUES ('371322', 371300, '郯城县');
INSERT INTO `cloud_area` VALUES ('371323', 371300, '沂水县');
INSERT INTO `cloud_area` VALUES ('371324', 371300, '兰陵县');
INSERT INTO `cloud_area` VALUES ('371325', 371300, '费县');
INSERT INTO `cloud_area` VALUES ('371326', 371300, '平邑县');
INSERT INTO `cloud_area` VALUES ('371327', 371300, '莒南县');
INSERT INTO `cloud_area` VALUES ('371328', 371300, '蒙阴县');
INSERT INTO `cloud_area` VALUES ('371329', 371300, '临沭县');
INSERT INTO `cloud_area` VALUES ('371400', 370000, '德州市');
INSERT INTO `cloud_area` VALUES ('371401', 371400, '市辖区');
INSERT INTO `cloud_area` VALUES ('371402', 371400, '德城区');
INSERT INTO `cloud_area` VALUES ('371403', 371400, '陵城区');
INSERT INTO `cloud_area` VALUES ('371422', 371400, '宁津县');
INSERT INTO `cloud_area` VALUES ('371423', 371400, '庆云县');
INSERT INTO `cloud_area` VALUES ('371424', 371400, '临邑县');
INSERT INTO `cloud_area` VALUES ('371425', 371400, '齐河县');
INSERT INTO `cloud_area` VALUES ('371426', 371400, '平原县');
INSERT INTO `cloud_area` VALUES ('371427', 371400, '夏津县');
INSERT INTO `cloud_area` VALUES ('371428', 371400, '武城县');
INSERT INTO `cloud_area` VALUES ('371481', 371400, '乐陵市');
INSERT INTO `cloud_area` VALUES ('371482', 371400, '禹城市');
INSERT INTO `cloud_area` VALUES ('371500', 370000, '聊城市');
INSERT INTO `cloud_area` VALUES ('371501', 371500, '市辖区');
INSERT INTO `cloud_area` VALUES ('371502', 371500, '东昌府区');
INSERT INTO `cloud_area` VALUES ('371521', 371500, '阳谷县');
INSERT INTO `cloud_area` VALUES ('371522', 371500, '莘县');
INSERT INTO `cloud_area` VALUES ('371523', 371500, '茌平县');
INSERT INTO `cloud_area` VALUES ('371524', 371500, '东阿县');
INSERT INTO `cloud_area` VALUES ('371525', 371500, '冠县');
INSERT INTO `cloud_area` VALUES ('371526', 371500, '高唐县');
INSERT INTO `cloud_area` VALUES ('371581', 371500, '临清市');
INSERT INTO `cloud_area` VALUES ('371600', 370000, '滨州市');
INSERT INTO `cloud_area` VALUES ('371601', 371600, '市辖区');
INSERT INTO `cloud_area` VALUES ('371602', 371600, '滨城区');
INSERT INTO `cloud_area` VALUES ('371603', 371600, '沾化区');
INSERT INTO `cloud_area` VALUES ('371621', 371600, '惠民县');
INSERT INTO `cloud_area` VALUES ('371622', 371600, '阳信县');
INSERT INTO `cloud_area` VALUES ('371623', 371600, '无棣县');
INSERT INTO `cloud_area` VALUES ('371625', 371600, '博兴县');
INSERT INTO `cloud_area` VALUES ('371626', 371600, '邹平县');
INSERT INTO `cloud_area` VALUES ('371700', 370000, '菏泽市');
INSERT INTO `cloud_area` VALUES ('371701', 371700, '市辖区');
INSERT INTO `cloud_area` VALUES ('371702', 371700, '牡丹区');
INSERT INTO `cloud_area` VALUES ('371721', 371700, '曹县');
INSERT INTO `cloud_area` VALUES ('371722', 371700, '单县');
INSERT INTO `cloud_area` VALUES ('371723', 371700, '成武县');
INSERT INTO `cloud_area` VALUES ('371724', 371700, '巨野县');
INSERT INTO `cloud_area` VALUES ('371725', 371700, '郓城县');
INSERT INTO `cloud_area` VALUES ('371726', 371700, '鄄城县');
INSERT INTO `cloud_area` VALUES ('371727', 371700, '定陶县');
INSERT INTO `cloud_area` VALUES ('371728', 371700, '东明县');
INSERT INTO `cloud_area` VALUES ('410000', null, '河南省');
INSERT INTO `cloud_area` VALUES ('410100', 410000, '郑州市');
INSERT INTO `cloud_area` VALUES ('410101', 410100, '市辖区');
INSERT INTO `cloud_area` VALUES ('410102', 410100, '中原区');
INSERT INTO `cloud_area` VALUES ('410103', 410100, '二七区');
INSERT INTO `cloud_area` VALUES ('410104', 410100, '管城回族区');
INSERT INTO `cloud_area` VALUES ('410105', 410100, '金水区');
INSERT INTO `cloud_area` VALUES ('410106', 410100, '上街区');
INSERT INTO `cloud_area` VALUES ('410108', 410100, '惠济区');
INSERT INTO `cloud_area` VALUES ('410122', 410100, '中牟县');
INSERT INTO `cloud_area` VALUES ('410181', 410100, '巩义市');
INSERT INTO `cloud_area` VALUES ('410182', 410100, '荥阳市');
INSERT INTO `cloud_area` VALUES ('410183', 410100, '新密市');
INSERT INTO `cloud_area` VALUES ('410184', 410100, '新郑市');
INSERT INTO `cloud_area` VALUES ('410185', 410100, '登封市');
INSERT INTO `cloud_area` VALUES ('410200', 410000, '开封市');
INSERT INTO `cloud_area` VALUES ('410201', 410200, '市辖区');
INSERT INTO `cloud_area` VALUES ('410202', 410200, '龙亭区');
INSERT INTO `cloud_area` VALUES ('410203', 410200, '顺河回族区');
INSERT INTO `cloud_area` VALUES ('410204', 410200, '鼓楼区');
INSERT INTO `cloud_area` VALUES ('410205', 410200, '禹王台区');
INSERT INTO `cloud_area` VALUES ('410211', 410200, '金明区');
INSERT INTO `cloud_area` VALUES ('410212', 410200, '祥符区');
INSERT INTO `cloud_area` VALUES ('410221', 410200, '杞县');
INSERT INTO `cloud_area` VALUES ('410222', 410200, '通许县');
INSERT INTO `cloud_area` VALUES ('410223', 410200, '尉氏县');
INSERT INTO `cloud_area` VALUES ('410225', 410200, '兰考县');
INSERT INTO `cloud_area` VALUES ('410300', 410000, '洛阳市');
INSERT INTO `cloud_area` VALUES ('410301', 410300, '市辖区');
INSERT INTO `cloud_area` VALUES ('410302', 410300, '老城区');
INSERT INTO `cloud_area` VALUES ('410303', 410300, '西工区');
INSERT INTO `cloud_area` VALUES ('410304', 410300, '?e河回族区');
INSERT INTO `cloud_area` VALUES ('410305', 410300, '涧西区');
INSERT INTO `cloud_area` VALUES ('410306', 410300, '吉利区');
INSERT INTO `cloud_area` VALUES ('410311', 410300, '洛龙区');
INSERT INTO `cloud_area` VALUES ('410322', 410300, '孟津县');
INSERT INTO `cloud_area` VALUES ('410323', 410300, '新安县');
INSERT INTO `cloud_area` VALUES ('410324', 410300, '栾川县');
INSERT INTO `cloud_area` VALUES ('410325', 410300, '嵩县');
INSERT INTO `cloud_area` VALUES ('410326', 410300, '汝阳县');
INSERT INTO `cloud_area` VALUES ('410327', 410300, '宜阳县');
INSERT INTO `cloud_area` VALUES ('410328', 410300, '洛宁县');
INSERT INTO `cloud_area` VALUES ('410329', 410300, '伊川县');
INSERT INTO `cloud_area` VALUES ('410381', 410300, '偃师市');
INSERT INTO `cloud_area` VALUES ('410400', 410000, '平顶山市');
INSERT INTO `cloud_area` VALUES ('410401', 410400, '市辖区');
INSERT INTO `cloud_area` VALUES ('410402', 410400, '新华区');
INSERT INTO `cloud_area` VALUES ('410403', 410400, '卫东区');
INSERT INTO `cloud_area` VALUES ('410404', 410400, '石龙区');
INSERT INTO `cloud_area` VALUES ('410411', 410400, '湛河区');
INSERT INTO `cloud_area` VALUES ('410421', 410400, '宝丰县');
INSERT INTO `cloud_area` VALUES ('410422', 410400, '叶县');
INSERT INTO `cloud_area` VALUES ('410423', 410400, '鲁山县');
INSERT INTO `cloud_area` VALUES ('410425', 410400, '郏县');
INSERT INTO `cloud_area` VALUES ('410481', 410400, '舞钢市');
INSERT INTO `cloud_area` VALUES ('410482', 410400, '汝州市');
INSERT INTO `cloud_area` VALUES ('410500', 410000, '安阳市');
INSERT INTO `cloud_area` VALUES ('410501', 410500, '市辖区');
INSERT INTO `cloud_area` VALUES ('410502', 410500, '文峰区');
INSERT INTO `cloud_area` VALUES ('410503', 410500, '北关区');
INSERT INTO `cloud_area` VALUES ('410505', 410500, '殷都区');
INSERT INTO `cloud_area` VALUES ('410506', 410500, '龙安区');
INSERT INTO `cloud_area` VALUES ('410522', 410500, '安阳县');
INSERT INTO `cloud_area` VALUES ('410523', 410500, '汤阴县');
INSERT INTO `cloud_area` VALUES ('410526', 410500, '滑县');
INSERT INTO `cloud_area` VALUES ('410527', 410500, '内黄县');
INSERT INTO `cloud_area` VALUES ('410581', 410500, '林州市');
INSERT INTO `cloud_area` VALUES ('410600', 410000, '鹤壁市');
INSERT INTO `cloud_area` VALUES ('410601', 410600, '市辖区');
INSERT INTO `cloud_area` VALUES ('410602', 410600, '鹤山区');
INSERT INTO `cloud_area` VALUES ('410603', 410600, '山城区');
INSERT INTO `cloud_area` VALUES ('410611', 410600, '淇滨区');
INSERT INTO `cloud_area` VALUES ('410621', 410600, '浚县');
INSERT INTO `cloud_area` VALUES ('410622', 410600, '淇县');
INSERT INTO `cloud_area` VALUES ('410700', 410000, '新乡市');
INSERT INTO `cloud_area` VALUES ('410701', 410700, '市辖区');
INSERT INTO `cloud_area` VALUES ('410702', 410700, '红旗区');
INSERT INTO `cloud_area` VALUES ('410703', 410700, '卫滨区');
INSERT INTO `cloud_area` VALUES ('410704', 410700, '凤泉区');
INSERT INTO `cloud_area` VALUES ('410711', 410700, '牧野区');
INSERT INTO `cloud_area` VALUES ('410721', 410700, '新乡县');
INSERT INTO `cloud_area` VALUES ('410724', 410700, '获嘉县');
INSERT INTO `cloud_area` VALUES ('410725', 410700, '原阳县');
INSERT INTO `cloud_area` VALUES ('410726', 410700, '延津县');
INSERT INTO `cloud_area` VALUES ('410727', 410700, '封丘县');
INSERT INTO `cloud_area` VALUES ('410728', 410700, '长垣县');
INSERT INTO `cloud_area` VALUES ('410781', 410700, '卫辉市');
INSERT INTO `cloud_area` VALUES ('410782', 410700, '辉县市');
INSERT INTO `cloud_area` VALUES ('410800', 410000, '焦作市');
INSERT INTO `cloud_area` VALUES ('410801', 410800, '市辖区');
INSERT INTO `cloud_area` VALUES ('410802', 410800, '解放区');
INSERT INTO `cloud_area` VALUES ('410803', 410800, '中站区');
INSERT INTO `cloud_area` VALUES ('410804', 410800, '马村区');
INSERT INTO `cloud_area` VALUES ('410811', 410800, '山阳区');
INSERT INTO `cloud_area` VALUES ('410821', 410800, '修武县');
INSERT INTO `cloud_area` VALUES ('410822', 410800, '博爱县');
INSERT INTO `cloud_area` VALUES ('410823', 410800, '武陟县');
INSERT INTO `cloud_area` VALUES ('410825', 410800, '温县');
INSERT INTO `cloud_area` VALUES ('410882', 410800, '沁阳市');
INSERT INTO `cloud_area` VALUES ('410883', 410800, '孟州市');
INSERT INTO `cloud_area` VALUES ('410900', 410000, '濮阳市');
INSERT INTO `cloud_area` VALUES ('410901', 410900, '市辖区');
INSERT INTO `cloud_area` VALUES ('410902', 410900, '华龙区');
INSERT INTO `cloud_area` VALUES ('410922', 410900, '清丰县');
INSERT INTO `cloud_area` VALUES ('410923', 410900, '南乐县');
INSERT INTO `cloud_area` VALUES ('410926', 410900, '范县');
INSERT INTO `cloud_area` VALUES ('410927', 410900, '台前县');
INSERT INTO `cloud_area` VALUES ('410928', 410900, '濮阳县');
INSERT INTO `cloud_area` VALUES ('411000', 410000, '许昌市');
INSERT INTO `cloud_area` VALUES ('411001', 411000, '市辖区');
INSERT INTO `cloud_area` VALUES ('411002', 411000, '魏都区');
INSERT INTO `cloud_area` VALUES ('411023', 411000, '许昌县');
INSERT INTO `cloud_area` VALUES ('411024', 411000, '鄢陵县');
INSERT INTO `cloud_area` VALUES ('411025', 411000, '襄城县');
INSERT INTO `cloud_area` VALUES ('411081', 411000, '禹州市');
INSERT INTO `cloud_area` VALUES ('411082', 411000, '长葛市');
INSERT INTO `cloud_area` VALUES ('411100', 410000, '漯河市');
INSERT INTO `cloud_area` VALUES ('411101', 411100, '市辖区');
INSERT INTO `cloud_area` VALUES ('411102', 411100, '源汇区');
INSERT INTO `cloud_area` VALUES ('411103', 411100, '郾城区');
INSERT INTO `cloud_area` VALUES ('411104', 411100, '召陵区');
INSERT INTO `cloud_area` VALUES ('411121', 411100, '舞阳县');
INSERT INTO `cloud_area` VALUES ('411122', 411100, '临颍县');
INSERT INTO `cloud_area` VALUES ('411200', 410000, '三门峡市');
INSERT INTO `cloud_area` VALUES ('411201', 411200, '市辖区');
INSERT INTO `cloud_area` VALUES ('411202', 411200, '湖滨区');
INSERT INTO `cloud_area` VALUES ('411221', 411200, '渑池县');
INSERT INTO `cloud_area` VALUES ('411222', 411200, '陕县');
INSERT INTO `cloud_area` VALUES ('411224', 411200, '卢氏县');
INSERT INTO `cloud_area` VALUES ('411281', 411200, '义马市');
INSERT INTO `cloud_area` VALUES ('411282', 411200, '灵宝市');
INSERT INTO `cloud_area` VALUES ('411300', 410000, '南阳市');
INSERT INTO `cloud_area` VALUES ('411301', 411300, '市辖区');
INSERT INTO `cloud_area` VALUES ('411302', 411300, '宛城区');
INSERT INTO `cloud_area` VALUES ('411303', 411300, '卧龙区');
INSERT INTO `cloud_area` VALUES ('411321', 411300, '南召县');
INSERT INTO `cloud_area` VALUES ('411322', 411300, '方城县');
INSERT INTO `cloud_area` VALUES ('411323', 411300, '西峡县');
INSERT INTO `cloud_area` VALUES ('411324', 411300, '镇平县');
INSERT INTO `cloud_area` VALUES ('411325', 411300, '内乡县');
INSERT INTO `cloud_area` VALUES ('411326', 411300, '淅川县');
INSERT INTO `cloud_area` VALUES ('411327', 411300, '社旗县');
INSERT INTO `cloud_area` VALUES ('411328', 411300, '唐河县');
INSERT INTO `cloud_area` VALUES ('411329', 411300, '新野县');
INSERT INTO `cloud_area` VALUES ('411330', 411300, '桐柏县');
INSERT INTO `cloud_area` VALUES ('411381', 411300, '邓州市');
INSERT INTO `cloud_area` VALUES ('411400', 410000, '商丘市');
INSERT INTO `cloud_area` VALUES ('411401', 411400, '市辖区');
INSERT INTO `cloud_area` VALUES ('411402', 411400, '梁园区');
INSERT INTO `cloud_area` VALUES ('411403', 411400, '睢阳区');
INSERT INTO `cloud_area` VALUES ('411421', 411400, '民权县');
INSERT INTO `cloud_area` VALUES ('411422', 411400, '睢县');
INSERT INTO `cloud_area` VALUES ('411423', 411400, '宁陵县');
INSERT INTO `cloud_area` VALUES ('411424', 411400, '柘城县');
INSERT INTO `cloud_area` VALUES ('411425', 411400, '虞城县');
INSERT INTO `cloud_area` VALUES ('411426', 411400, '夏邑县');
INSERT INTO `cloud_area` VALUES ('411481', 411400, '永城市');
INSERT INTO `cloud_area` VALUES ('411500', 410000, '信阳市');
INSERT INTO `cloud_area` VALUES ('411501', 411500, '市辖区');
INSERT INTO `cloud_area` VALUES ('411502', 411500, '?负忧?');
INSERT INTO `cloud_area` VALUES ('411503', 411500, '平桥区');
INSERT INTO `cloud_area` VALUES ('411521', 411500, '罗山县');
INSERT INTO `cloud_area` VALUES ('411522', 411500, '光山县');
INSERT INTO `cloud_area` VALUES ('411523', 411500, '新县');
INSERT INTO `cloud_area` VALUES ('411524', 411500, '商城县');
INSERT INTO `cloud_area` VALUES ('411525', 411500, '固始县');
INSERT INTO `cloud_area` VALUES ('411526', 411500, '潢川县');
INSERT INTO `cloud_area` VALUES ('411527', 411500, '淮滨县');
INSERT INTO `cloud_area` VALUES ('411528', 411500, '息县');
INSERT INTO `cloud_area` VALUES ('411600', 410000, '周口市');
INSERT INTO `cloud_area` VALUES ('411601', 411600, '市辖区');
INSERT INTO `cloud_area` VALUES ('411602', 411600, '川汇区');
INSERT INTO `cloud_area` VALUES ('411621', 411600, '扶沟县');
INSERT INTO `cloud_area` VALUES ('411622', 411600, '西华县');
INSERT INTO `cloud_area` VALUES ('411623', 411600, '商水县');
INSERT INTO `cloud_area` VALUES ('411624', 411600, '沈丘县');
INSERT INTO `cloud_area` VALUES ('411625', 411600, '郸城县');
INSERT INTO `cloud_area` VALUES ('411626', 411600, '淮阳县');
INSERT INTO `cloud_area` VALUES ('411627', 411600, '太康县');
INSERT INTO `cloud_area` VALUES ('411628', 411600, '鹿邑县');
INSERT INTO `cloud_area` VALUES ('411681', 411600, '项城市');
INSERT INTO `cloud_area` VALUES ('411700', 410000, '驻马店市');
INSERT INTO `cloud_area` VALUES ('411701', 411700, '市辖区');
INSERT INTO `cloud_area` VALUES ('411702', 411700, '驿城区');
INSERT INTO `cloud_area` VALUES ('411721', 411700, '西平县');
INSERT INTO `cloud_area` VALUES ('411722', 411700, '上蔡县');
INSERT INTO `cloud_area` VALUES ('411723', 411700, '平舆县');
INSERT INTO `cloud_area` VALUES ('411724', 411700, '正阳县');
INSERT INTO `cloud_area` VALUES ('411725', 411700, '确山县');
INSERT INTO `cloud_area` VALUES ('411726', 411700, '泌阳县');
INSERT INTO `cloud_area` VALUES ('411727', 411700, '汝南县');
INSERT INTO `cloud_area` VALUES ('411728', 411700, '遂平县');
INSERT INTO `cloud_area` VALUES ('411729', 411700, '新蔡县');
INSERT INTO `cloud_area` VALUES ('419000', 410000, '省直辖县级行政区划');
INSERT INTO `cloud_area` VALUES ('419001', 419000, '济源市');
INSERT INTO `cloud_area` VALUES ('420000', null, '湖北省');
INSERT INTO `cloud_area` VALUES ('420100', 420000, '武汉市');
INSERT INTO `cloud_area` VALUES ('420101', 420100, '市辖区');
INSERT INTO `cloud_area` VALUES ('420102', 420100, '江岸区');
INSERT INTO `cloud_area` VALUES ('420103', 420100, '江汉区');
INSERT INTO `cloud_area` VALUES ('420104', 420100, '?~口区');
INSERT INTO `cloud_area` VALUES ('420105', 420100, '汉阳区');
INSERT INTO `cloud_area` VALUES ('420106', 420100, '武昌区');
INSERT INTO `cloud_area` VALUES ('420107', 420100, '青山区');
INSERT INTO `cloud_area` VALUES ('420111', 420100, '洪山区');
INSERT INTO `cloud_area` VALUES ('420112', 420100, '东西湖区');
INSERT INTO `cloud_area` VALUES ('420113', 420100, '汉南区');
INSERT INTO `cloud_area` VALUES ('420114', 420100, '蔡甸区');
INSERT INTO `cloud_area` VALUES ('420115', 420100, '江夏区');
INSERT INTO `cloud_area` VALUES ('420116', 420100, '黄陂区');
INSERT INTO `cloud_area` VALUES ('420117', 420100, '新洲区');
INSERT INTO `cloud_area` VALUES ('420200', 420000, '黄石市');
INSERT INTO `cloud_area` VALUES ('420201', 420200, '市辖区');
INSERT INTO `cloud_area` VALUES ('420202', 420200, '黄石港区');
INSERT INTO `cloud_area` VALUES ('420203', 420200, '西塞山区');
INSERT INTO `cloud_area` VALUES ('420204', 420200, '下陆区');
INSERT INTO `cloud_area` VALUES ('420205', 420200, '铁山区');
INSERT INTO `cloud_area` VALUES ('420222', 420200, '阳新县');
INSERT INTO `cloud_area` VALUES ('420281', 420200, '大冶市');
INSERT INTO `cloud_area` VALUES ('420300', 420000, '十堰市');
INSERT INTO `cloud_area` VALUES ('420301', 420300, '市辖区');
INSERT INTO `cloud_area` VALUES ('420302', 420300, '茅箭区');
INSERT INTO `cloud_area` VALUES ('420303', 420300, '张湾区');
INSERT INTO `cloud_area` VALUES ('420304', 420300, '郧阳区');
INSERT INTO `cloud_area` VALUES ('420322', 420300, '郧西县');
INSERT INTO `cloud_area` VALUES ('420323', 420300, '竹山县');
INSERT INTO `cloud_area` VALUES ('420324', 420300, '竹溪县');
INSERT INTO `cloud_area` VALUES ('420325', 420300, '房县');
INSERT INTO `cloud_area` VALUES ('420381', 420300, '丹江口市');
INSERT INTO `cloud_area` VALUES ('420500', 420000, '宜昌市');
INSERT INTO `cloud_area` VALUES ('420501', 420500, '市辖区');
INSERT INTO `cloud_area` VALUES ('420502', 420500, '西陵区');
INSERT INTO `cloud_area` VALUES ('420503', 420500, '伍家岗区');
INSERT INTO `cloud_area` VALUES ('420504', 420500, '点军区');
INSERT INTO `cloud_area` VALUES ('420505', 420500, '?V亭区');
INSERT INTO `cloud_area` VALUES ('420506', 420500, '夷陵区');
INSERT INTO `cloud_area` VALUES ('420525', 420500, '远安县');
INSERT INTO `cloud_area` VALUES ('420526', 420500, '兴山县');
INSERT INTO `cloud_area` VALUES ('420527', 420500, '秭归县');
INSERT INTO `cloud_area` VALUES ('420528', 420500, '长阳土家族自治县');
INSERT INTO `cloud_area` VALUES ('420529', 420500, '五峰土家族自治县');
INSERT INTO `cloud_area` VALUES ('420581', 420500, '宜都市');
INSERT INTO `cloud_area` VALUES ('420582', 420500, '当阳市');
INSERT INTO `cloud_area` VALUES ('420583', 420500, '枝江市');
INSERT INTO `cloud_area` VALUES ('420600', 420000, '襄阳市');
INSERT INTO `cloud_area` VALUES ('420601', 420600, '市辖区');
INSERT INTO `cloud_area` VALUES ('420602', 420600, '襄城区');
INSERT INTO `cloud_area` VALUES ('420606', 420600, '樊城区');
INSERT INTO `cloud_area` VALUES ('420607', 420600, '襄州区');
INSERT INTO `cloud_area` VALUES ('420624', 420600, '南漳县');
INSERT INTO `cloud_area` VALUES ('420625', 420600, '谷城县');
INSERT INTO `cloud_area` VALUES ('420626', 420600, '保康县');
INSERT INTO `cloud_area` VALUES ('420682', 420600, '老河口市');
INSERT INTO `cloud_area` VALUES ('420683', 420600, '枣阳市');
INSERT INTO `cloud_area` VALUES ('420684', 420600, '宜城市');
INSERT INTO `cloud_area` VALUES ('420700', 420000, '鄂州市');
INSERT INTO `cloud_area` VALUES ('420701', 420700, '市辖区');
INSERT INTO `cloud_area` VALUES ('420702', 420700, '梁子湖区');
INSERT INTO `cloud_area` VALUES ('420703', 420700, '华容区');
INSERT INTO `cloud_area` VALUES ('420704', 420700, '鄂城区');
INSERT INTO `cloud_area` VALUES ('420800', 420000, '荆门市');
INSERT INTO `cloud_area` VALUES ('420801', 420800, '市辖区');
INSERT INTO `cloud_area` VALUES ('420802', 420800, '东宝区');
INSERT INTO `cloud_area` VALUES ('420804', 420800, '掇刀区');
INSERT INTO `cloud_area` VALUES ('420821', 420800, '京山县');
INSERT INTO `cloud_area` VALUES ('420822', 420800, '沙洋县');
INSERT INTO `cloud_area` VALUES ('420881', 420800, '钟祥市');
INSERT INTO `cloud_area` VALUES ('420900', 420000, '孝感市');
INSERT INTO `cloud_area` VALUES ('420901', 420900, '市辖区');
INSERT INTO `cloud_area` VALUES ('420902', 420900, '孝南区');
INSERT INTO `cloud_area` VALUES ('420921', 420900, '孝昌县');
INSERT INTO `cloud_area` VALUES ('420922', 420900, '大悟县');
INSERT INTO `cloud_area` VALUES ('420923', 420900, '云梦县');
INSERT INTO `cloud_area` VALUES ('420981', 420900, '应城市');
INSERT INTO `cloud_area` VALUES ('420982', 420900, '安陆市');
INSERT INTO `cloud_area` VALUES ('420984', 420900, '汉川市');
INSERT INTO `cloud_area` VALUES ('421000', 420000, '荆州市');
INSERT INTO `cloud_area` VALUES ('421001', 421000, '市辖区');
INSERT INTO `cloud_area` VALUES ('421002', 421000, '沙市区');
INSERT INTO `cloud_area` VALUES ('421003', 421000, '荆州区');
INSERT INTO `cloud_area` VALUES ('421022', 421000, '公安县');
INSERT INTO `cloud_area` VALUES ('421023', 421000, '监利县');
INSERT INTO `cloud_area` VALUES ('421024', 421000, '江陵县');
INSERT INTO `cloud_area` VALUES ('421081', 421000, '石首市');
INSERT INTO `cloud_area` VALUES ('421083', 421000, '洪湖市');
INSERT INTO `cloud_area` VALUES ('421087', 421000, '松滋市');
INSERT INTO `cloud_area` VALUES ('421100', 420000, '黄冈市');
INSERT INTO `cloud_area` VALUES ('421101', 421100, '市辖区');
INSERT INTO `cloud_area` VALUES ('421102', 421100, '黄州区');
INSERT INTO `cloud_area` VALUES ('421121', 421100, '团风县');
INSERT INTO `cloud_area` VALUES ('421122', 421100, '红安县');
INSERT INTO `cloud_area` VALUES ('421123', 421100, '罗田县');
INSERT INTO `cloud_area` VALUES ('421124', 421100, '英山县');
INSERT INTO `cloud_area` VALUES ('421125', 421100, '浠水县');
INSERT INTO `cloud_area` VALUES ('421126', 421100, '蕲春县');
INSERT INTO `cloud_area` VALUES ('421127', 421100, '黄梅县');
INSERT INTO `cloud_area` VALUES ('421181', 421100, '麻城市');
INSERT INTO `cloud_area` VALUES ('421182', 421100, '武穴市');
INSERT INTO `cloud_area` VALUES ('421200', 420000, '咸宁市');
INSERT INTO `cloud_area` VALUES ('421201', 421200, '市辖区');
INSERT INTO `cloud_area` VALUES ('421202', 421200, '咸安区');
INSERT INTO `cloud_area` VALUES ('421221', 421200, '嘉鱼县');
INSERT INTO `cloud_area` VALUES ('421222', 421200, '通城县');
INSERT INTO `cloud_area` VALUES ('421223', 421200, '崇阳县');
INSERT INTO `cloud_area` VALUES ('421224', 421200, '通山县');
INSERT INTO `cloud_area` VALUES ('421281', 421200, '赤壁市');
INSERT INTO `cloud_area` VALUES ('421300', 420000, '随州市');
INSERT INTO `cloud_area` VALUES ('421301', 421300, '市辖区');
INSERT INTO `cloud_area` VALUES ('421303', 421300, '曾都区');
INSERT INTO `cloud_area` VALUES ('421321', 421300, '随县');
INSERT INTO `cloud_area` VALUES ('421381', 421300, '广水市');
INSERT INTO `cloud_area` VALUES ('422800', 420000, '恩施土家族苗族自治州');
INSERT INTO `cloud_area` VALUES ('422801', 422800, '恩施市');
INSERT INTO `cloud_area` VALUES ('422802', 422800, '利川市');
INSERT INTO `cloud_area` VALUES ('422822', 422800, '建始县');
INSERT INTO `cloud_area` VALUES ('422823', 422800, '巴东县');
INSERT INTO `cloud_area` VALUES ('422825', 422800, '宣恩县');
INSERT INTO `cloud_area` VALUES ('422826', 422800, '咸丰县');
INSERT INTO `cloud_area` VALUES ('422827', 422800, '来凤县');
INSERT INTO `cloud_area` VALUES ('422828', 422800, '鹤峰县');
INSERT INTO `cloud_area` VALUES ('429000', 420000, '省直辖县级行政区划');
INSERT INTO `cloud_area` VALUES ('429004', 429000, '仙桃市');
INSERT INTO `cloud_area` VALUES ('429005', 429000, '潜江市');
INSERT INTO `cloud_area` VALUES ('429006', 429000, '天门市');
INSERT INTO `cloud_area` VALUES ('429021', 429000, '神农架林区');
INSERT INTO `cloud_area` VALUES ('430000', null, '湖南省');
INSERT INTO `cloud_area` VALUES ('430100', 430000, '长沙市');
INSERT INTO `cloud_area` VALUES ('430101', 430100, '市辖区');
INSERT INTO `cloud_area` VALUES ('430102', 430100, '芙蓉区');
INSERT INTO `cloud_area` VALUES ('430103', 430100, '天心区');
INSERT INTO `cloud_area` VALUES ('430104', 430100, '岳麓区');
INSERT INTO `cloud_area` VALUES ('430105', 430100, '开福区');
INSERT INTO `cloud_area` VALUES ('430111', 430100, '雨花区');
INSERT INTO `cloud_area` VALUES ('430112', 430100, '望城区');
INSERT INTO `cloud_area` VALUES ('430121', 430100, '长沙县');
INSERT INTO `cloud_area` VALUES ('430124', 430100, '宁乡县');
INSERT INTO `cloud_area` VALUES ('430181', 430100, '浏阳市');
INSERT INTO `cloud_area` VALUES ('430200', 430000, '株洲市');
INSERT INTO `cloud_area` VALUES ('430201', 430200, '市辖区');
INSERT INTO `cloud_area` VALUES ('430202', 430200, '荷塘区');
INSERT INTO `cloud_area` VALUES ('430203', 430200, '芦淞区');
INSERT INTO `cloud_area` VALUES ('430204', 430200, '石峰区');
INSERT INTO `cloud_area` VALUES ('430211', 430200, '天元区');
INSERT INTO `cloud_area` VALUES ('430221', 430200, '株洲县');
INSERT INTO `cloud_area` VALUES ('430223', 430200, '攸县');
INSERT INTO `cloud_area` VALUES ('430224', 430200, '茶陵县');
INSERT INTO `cloud_area` VALUES ('430225', 430200, '炎陵县');
INSERT INTO `cloud_area` VALUES ('430281', 430200, '醴陵市');
INSERT INTO `cloud_area` VALUES ('430300', 430000, '湘潭市');
INSERT INTO `cloud_area` VALUES ('430301', 430300, '市辖区');
INSERT INTO `cloud_area` VALUES ('430302', 430300, '雨湖区');
INSERT INTO `cloud_area` VALUES ('430304', 430300, '岳塘区');
INSERT INTO `cloud_area` VALUES ('430321', 430300, '湘潭县');
INSERT INTO `cloud_area` VALUES ('430381', 430300, '湘乡市');
INSERT INTO `cloud_area` VALUES ('430382', 430300, '韶山市');
INSERT INTO `cloud_area` VALUES ('430400', 430000, '衡阳市');
INSERT INTO `cloud_area` VALUES ('430401', 430400, '市辖区');
INSERT INTO `cloud_area` VALUES ('430405', 430400, '珠晖区');
INSERT INTO `cloud_area` VALUES ('430406', 430400, '雁峰区');
INSERT INTO `cloud_area` VALUES ('430407', 430400, '石鼓区');
INSERT INTO `cloud_area` VALUES ('430408', 430400, '蒸湘区');
INSERT INTO `cloud_area` VALUES ('430412', 430400, '南岳区');
INSERT INTO `cloud_area` VALUES ('430421', 430400, '衡阳县');
INSERT INTO `cloud_area` VALUES ('430422', 430400, '衡南县');
INSERT INTO `cloud_area` VALUES ('430423', 430400, '衡山县');
INSERT INTO `cloud_area` VALUES ('430424', 430400, '衡东县');
INSERT INTO `cloud_area` VALUES ('430426', 430400, '祁东县');
INSERT INTO `cloud_area` VALUES ('430481', 430400, '耒阳市');
INSERT INTO `cloud_area` VALUES ('430482', 430400, '常宁市');
INSERT INTO `cloud_area` VALUES ('430500', 430000, '邵阳市');
INSERT INTO `cloud_area` VALUES ('430501', 430500, '市辖区');
INSERT INTO `cloud_area` VALUES ('430502', 430500, '双清区');
INSERT INTO `cloud_area` VALUES ('430503', 430500, '大祥区');
INSERT INTO `cloud_area` VALUES ('430511', 430500, '北塔区');
INSERT INTO `cloud_area` VALUES ('430521', 430500, '邵东县');
INSERT INTO `cloud_area` VALUES ('430522', 430500, '新邵县');
INSERT INTO `cloud_area` VALUES ('430523', 430500, '邵阳县');
INSERT INTO `cloud_area` VALUES ('430524', 430500, '隆回县');
INSERT INTO `cloud_area` VALUES ('430525', 430500, '洞口县');
INSERT INTO `cloud_area` VALUES ('430527', 430500, '绥宁县');
INSERT INTO `cloud_area` VALUES ('430528', 430500, '新宁县');
INSERT INTO `cloud_area` VALUES ('430529', 430500, '城步苗族自治县');
INSERT INTO `cloud_area` VALUES ('430581', 430500, '武冈市');
INSERT INTO `cloud_area` VALUES ('430600', 430000, '岳阳市');
INSERT INTO `cloud_area` VALUES ('430601', 430600, '市辖区');
INSERT INTO `cloud_area` VALUES ('430602', 430600, '岳阳楼区');
INSERT INTO `cloud_area` VALUES ('430603', 430600, '云溪区');
INSERT INTO `cloud_area` VALUES ('430611', 430600, '君山区');
INSERT INTO `cloud_area` VALUES ('430621', 430600, '岳阳县');
INSERT INTO `cloud_area` VALUES ('430623', 430600, '华容县');
INSERT INTO `cloud_area` VALUES ('430624', 430600, '湘阴县');
INSERT INTO `cloud_area` VALUES ('430626', 430600, '平江县');
INSERT INTO `cloud_area` VALUES ('430681', 430600, '汨罗市');
INSERT INTO `cloud_area` VALUES ('430682', 430600, '临湘市');
INSERT INTO `cloud_area` VALUES ('430700', 430000, '常德市');
INSERT INTO `cloud_area` VALUES ('430701', 430700, '市辖区');
INSERT INTO `cloud_area` VALUES ('430702', 430700, '武陵区');
INSERT INTO `cloud_area` VALUES ('430703', 430700, '鼎城区');
INSERT INTO `cloud_area` VALUES ('430721', 430700, '安乡县');
INSERT INTO `cloud_area` VALUES ('430722', 430700, '汉寿县');
INSERT INTO `cloud_area` VALUES ('430723', 430700, '澧县');
INSERT INTO `cloud_area` VALUES ('430724', 430700, '临澧县');
INSERT INTO `cloud_area` VALUES ('430725', 430700, '桃源县');
INSERT INTO `cloud_area` VALUES ('430726', 430700, '石门县');
INSERT INTO `cloud_area` VALUES ('430781', 430700, '津市市');
INSERT INTO `cloud_area` VALUES ('430800', 430000, '张家界市');
INSERT INTO `cloud_area` VALUES ('430801', 430800, '市辖区');
INSERT INTO `cloud_area` VALUES ('430802', 430800, '永定区');
INSERT INTO `cloud_area` VALUES ('430811', 430800, '武陵源区');
INSERT INTO `cloud_area` VALUES ('430821', 430800, '慈利县');
INSERT INTO `cloud_area` VALUES ('430822', 430800, '桑植县');
INSERT INTO `cloud_area` VALUES ('430900', 430000, '益阳市');
INSERT INTO `cloud_area` VALUES ('430901', 430900, '市辖区');
INSERT INTO `cloud_area` VALUES ('430902', 430900, '资阳区');
INSERT INTO `cloud_area` VALUES ('430903', 430900, '赫山区');
INSERT INTO `cloud_area` VALUES ('430921', 430900, '南县');
INSERT INTO `cloud_area` VALUES ('430922', 430900, '桃江县');
INSERT INTO `cloud_area` VALUES ('430923', 430900, '安化县');
INSERT INTO `cloud_area` VALUES ('430981', 430900, '沅江市');
INSERT INTO `cloud_area` VALUES ('431000', 430000, '郴州市');
INSERT INTO `cloud_area` VALUES ('431001', 431000, '市辖区');
INSERT INTO `cloud_area` VALUES ('431002', 431000, '北湖区');
INSERT INTO `cloud_area` VALUES ('431003', 431000, '苏仙区');
INSERT INTO `cloud_area` VALUES ('431021', 431000, '桂阳县');
INSERT INTO `cloud_area` VALUES ('431022', 431000, '宜章县');
INSERT INTO `cloud_area` VALUES ('431023', 431000, '永兴县');
INSERT INTO `cloud_area` VALUES ('431024', 431000, '嘉禾县');
INSERT INTO `cloud_area` VALUES ('431025', 431000, '临武县');
INSERT INTO `cloud_area` VALUES ('431026', 431000, '汝城县');
INSERT INTO `cloud_area` VALUES ('431027', 431000, '桂东县');
INSERT INTO `cloud_area` VALUES ('431028', 431000, '安仁县');
INSERT INTO `cloud_area` VALUES ('431081', 431000, '资兴市');
INSERT INTO `cloud_area` VALUES ('431100', 430000, '永州市');
INSERT INTO `cloud_area` VALUES ('431101', 431100, '市辖区');
INSERT INTO `cloud_area` VALUES ('431102', 431100, '零陵区');
INSERT INTO `cloud_area` VALUES ('431103', 431100, '冷水滩区');
INSERT INTO `cloud_area` VALUES ('431121', 431100, '祁阳县');
INSERT INTO `cloud_area` VALUES ('431122', 431100, '东安县');
INSERT INTO `cloud_area` VALUES ('431123', 431100, '双牌县');
INSERT INTO `cloud_area` VALUES ('431124', 431100, '道县');
INSERT INTO `cloud_area` VALUES ('431125', 431100, '江永县');
INSERT INTO `cloud_area` VALUES ('431126', 431100, '宁远县');
INSERT INTO `cloud_area` VALUES ('431127', 431100, '蓝山县');
INSERT INTO `cloud_area` VALUES ('431128', 431100, '新田县');
INSERT INTO `cloud_area` VALUES ('431129', 431100, '江华瑶族自治县');
INSERT INTO `cloud_area` VALUES ('431200', 430000, '怀化市');
INSERT INTO `cloud_area` VALUES ('431201', 431200, '市辖区');
INSERT INTO `cloud_area` VALUES ('431202', 431200, '鹤城区');
INSERT INTO `cloud_area` VALUES ('431221', 431200, '中方县');
INSERT INTO `cloud_area` VALUES ('431222', 431200, '沅陵县');
INSERT INTO `cloud_area` VALUES ('431223', 431200, '辰溪县');
INSERT INTO `cloud_area` VALUES ('431224', 431200, '溆浦县');
INSERT INTO `cloud_area` VALUES ('431225', 431200, '会同县');
INSERT INTO `cloud_area` VALUES ('431226', 431200, '麻阳苗族自治县');
INSERT INTO `cloud_area` VALUES ('431227', 431200, '新晃侗族自治县');
INSERT INTO `cloud_area` VALUES ('431228', 431200, '芷江侗族自治县');
INSERT INTO `cloud_area` VALUES ('431229', 431200, '靖州苗族侗族自治县');
INSERT INTO `cloud_area` VALUES ('431230', 431200, '通道侗族自治县');
INSERT INTO `cloud_area` VALUES ('431281', 431200, '洪江市');
INSERT INTO `cloud_area` VALUES ('431300', 430000, '娄底市');
INSERT INTO `cloud_area` VALUES ('431301', 431300, '市辖区');
INSERT INTO `cloud_area` VALUES ('431302', 431300, '娄星区');
INSERT INTO `cloud_area` VALUES ('431321', 431300, '双峰县');
INSERT INTO `cloud_area` VALUES ('431322', 431300, '新化县');
INSERT INTO `cloud_area` VALUES ('431381', 431300, '冷水江市');
INSERT INTO `cloud_area` VALUES ('431382', 431300, '涟源市');
INSERT INTO `cloud_area` VALUES ('433100', 430000, '湘西土家族苗族自治州');
INSERT INTO `cloud_area` VALUES ('433101', 433100, '吉首市');
INSERT INTO `cloud_area` VALUES ('433122', 433100, '泸溪县');
INSERT INTO `cloud_area` VALUES ('433123', 433100, '凤凰县');
INSERT INTO `cloud_area` VALUES ('433124', 433100, '花垣县');
INSERT INTO `cloud_area` VALUES ('433125', 433100, '保靖县');
INSERT INTO `cloud_area` VALUES ('433126', 433100, '古丈县');
INSERT INTO `cloud_area` VALUES ('433127', 433100, '永顺县');
INSERT INTO `cloud_area` VALUES ('433130', 433100, '龙山县');
INSERT INTO `cloud_area` VALUES ('440000', null, '广东省');
INSERT INTO `cloud_area` VALUES ('440100', 440000, '广州市');
INSERT INTO `cloud_area` VALUES ('440101', 440100, '市辖区');
INSERT INTO `cloud_area` VALUES ('440103', 440100, '荔湾区');
INSERT INTO `cloud_area` VALUES ('440104', 440100, '越秀区');
INSERT INTO `cloud_area` VALUES ('440105', 440100, '海珠区');
INSERT INTO `cloud_area` VALUES ('440106', 440100, '天河区');
INSERT INTO `cloud_area` VALUES ('440111', 440100, '白云区');
INSERT INTO `cloud_area` VALUES ('440112', 440100, '黄埔区');
INSERT INTO `cloud_area` VALUES ('440113', 440100, '番禺区');
INSERT INTO `cloud_area` VALUES ('440114', 440100, '花都区');
INSERT INTO `cloud_area` VALUES ('440115', 440100, '南沙区');
INSERT INTO `cloud_area` VALUES ('440117', 440100, '从化区');
INSERT INTO `cloud_area` VALUES ('440118', 440100, '增城区');
INSERT INTO `cloud_area` VALUES ('440200', 440000, '韶关市');
INSERT INTO `cloud_area` VALUES ('440201', 440200, '市辖区');
INSERT INTO `cloud_area` VALUES ('440203', 440200, '武江区');
INSERT INTO `cloud_area` VALUES ('440204', 440200, '浈江区');
INSERT INTO `cloud_area` VALUES ('440205', 440200, '曲江区');
INSERT INTO `cloud_area` VALUES ('440222', 440200, '始兴县');
INSERT INTO `cloud_area` VALUES ('440224', 440200, '仁化县');
INSERT INTO `cloud_area` VALUES ('440229', 440200, '翁源县');
INSERT INTO `cloud_area` VALUES ('440232', 440200, '乳源瑶族自治县');
INSERT INTO `cloud_area` VALUES ('440233', 440200, '新丰县');
INSERT INTO `cloud_area` VALUES ('440281', 440200, '乐昌市');
INSERT INTO `cloud_area` VALUES ('440282', 440200, '南雄市');
INSERT INTO `cloud_area` VALUES ('440300', 440000, '深圳市');
INSERT INTO `cloud_area` VALUES ('440301', 440300, '市辖区');
INSERT INTO `cloud_area` VALUES ('440303', 440300, '罗湖区');
INSERT INTO `cloud_area` VALUES ('440304', 440300, '福田区');
INSERT INTO `cloud_area` VALUES ('440305', 440300, '南山区');
INSERT INTO `cloud_area` VALUES ('440306', 440300, '宝安区');
INSERT INTO `cloud_area` VALUES ('440307', 440300, '龙岗区');
INSERT INTO `cloud_area` VALUES ('440308', 440300, '盐田区');
INSERT INTO `cloud_area` VALUES ('440400', 440000, '珠海市');
INSERT INTO `cloud_area` VALUES ('440401', 440400, '市辖区');
INSERT INTO `cloud_area` VALUES ('440402', 440400, '香洲区');
INSERT INTO `cloud_area` VALUES ('440403', 440400, '斗门区');
INSERT INTO `cloud_area` VALUES ('440404', 440400, '金湾区');
INSERT INTO `cloud_area` VALUES ('440500', 440000, '汕头市');
INSERT INTO `cloud_area` VALUES ('440501', 440500, '市辖区');
INSERT INTO `cloud_area` VALUES ('440507', 440500, '龙湖区');
INSERT INTO `cloud_area` VALUES ('440511', 440500, '金平区');
INSERT INTO `cloud_area` VALUES ('440512', 440500, '濠江区');
INSERT INTO `cloud_area` VALUES ('440513', 440500, '潮阳区');
INSERT INTO `cloud_area` VALUES ('440514', 440500, '潮南区');
INSERT INTO `cloud_area` VALUES ('440515', 440500, '澄海区');
INSERT INTO `cloud_area` VALUES ('440523', 440500, '南澳县');
INSERT INTO `cloud_area` VALUES ('440600', 440000, '佛山市');
INSERT INTO `cloud_area` VALUES ('440601', 440600, '市辖区');
INSERT INTO `cloud_area` VALUES ('440604', 440600, '禅城区');
INSERT INTO `cloud_area` VALUES ('440605', 440600, '南海区');
INSERT INTO `cloud_area` VALUES ('440606', 440600, '顺德区');
INSERT INTO `cloud_area` VALUES ('440607', 440600, '三水区');
INSERT INTO `cloud_area` VALUES ('440608', 440600, '高明区');
INSERT INTO `cloud_area` VALUES ('440700', 440000, '江门市');
INSERT INTO `cloud_area` VALUES ('440701', 440700, '市辖区');
INSERT INTO `cloud_area` VALUES ('440703', 440700, '蓬江区');
INSERT INTO `cloud_area` VALUES ('440704', 440700, '江海区');
INSERT INTO `cloud_area` VALUES ('440705', 440700, '新会区');
INSERT INTO `cloud_area` VALUES ('440781', 440700, '台山市');
INSERT INTO `cloud_area` VALUES ('440783', 440700, '开平市');
INSERT INTO `cloud_area` VALUES ('440784', 440700, '鹤山市');
INSERT INTO `cloud_area` VALUES ('440785', 440700, '恩平市');
INSERT INTO `cloud_area` VALUES ('440800', 440000, '湛江市');
INSERT INTO `cloud_area` VALUES ('440801', 440800, '市辖区');
INSERT INTO `cloud_area` VALUES ('440802', 440800, '赤坎区');
INSERT INTO `cloud_area` VALUES ('440803', 440800, '霞山区');
INSERT INTO `cloud_area` VALUES ('440804', 440800, '坡头区');
INSERT INTO `cloud_area` VALUES ('440811', 440800, '麻章区');
INSERT INTO `cloud_area` VALUES ('440823', 440800, '遂溪县');
INSERT INTO `cloud_area` VALUES ('440825', 440800, '徐闻县');
INSERT INTO `cloud_area` VALUES ('440881', 440800, '廉江市');
INSERT INTO `cloud_area` VALUES ('440882', 440800, '雷州市');
INSERT INTO `cloud_area` VALUES ('440883', 440800, '吴川市');
INSERT INTO `cloud_area` VALUES ('440900', 440000, '茂名市');
INSERT INTO `cloud_area` VALUES ('440901', 440900, '市辖区');
INSERT INTO `cloud_area` VALUES ('440902', 440900, '茂南区');
INSERT INTO `cloud_area` VALUES ('440904', 440900, '电白区');
INSERT INTO `cloud_area` VALUES ('440981', 440900, '高州市');
INSERT INTO `cloud_area` VALUES ('440982', 440900, '化州市');
INSERT INTO `cloud_area` VALUES ('440983', 440900, '信宜市');
INSERT INTO `cloud_area` VALUES ('441200', 440000, '肇庆市');
INSERT INTO `cloud_area` VALUES ('441201', 441200, '市辖区');
INSERT INTO `cloud_area` VALUES ('441202', 441200, '端州区');
INSERT INTO `cloud_area` VALUES ('441203', 441200, '鼎湖区');
INSERT INTO `cloud_area` VALUES ('441204', 441200, '高要区');
INSERT INTO `cloud_area` VALUES ('441223', 441200, '广宁县');
INSERT INTO `cloud_area` VALUES ('441224', 441200, '怀集县');
INSERT INTO `cloud_area` VALUES ('441225', 441200, '封开县');
INSERT INTO `cloud_area` VALUES ('441226', 441200, '德庆县');
INSERT INTO `cloud_area` VALUES ('441284', 441200, '四会市');
INSERT INTO `cloud_area` VALUES ('441300', 440000, '惠州市');
INSERT INTO `cloud_area` VALUES ('441301', 441300, '市辖区');
INSERT INTO `cloud_area` VALUES ('441302', 441300, '惠城区');
INSERT INTO `cloud_area` VALUES ('441303', 441300, '惠阳区');
INSERT INTO `cloud_area` VALUES ('441322', 441300, '博罗县');
INSERT INTO `cloud_area` VALUES ('441323', 441300, '惠东县');
INSERT INTO `cloud_area` VALUES ('441324', 441300, '龙门县');
INSERT INTO `cloud_area` VALUES ('441400', 440000, '梅州市');
INSERT INTO `cloud_area` VALUES ('441401', 441400, '市辖区');
INSERT INTO `cloud_area` VALUES ('441402', 441400, '梅江区');
INSERT INTO `cloud_area` VALUES ('441403', 441400, '梅县区');
INSERT INTO `cloud_area` VALUES ('441422', 441400, '大埔县');
INSERT INTO `cloud_area` VALUES ('441423', 441400, '丰顺县');
INSERT INTO `cloud_area` VALUES ('441424', 441400, '五华县');
INSERT INTO `cloud_area` VALUES ('441426', 441400, '平远县');
INSERT INTO `cloud_area` VALUES ('441427', 441400, '蕉岭县');
INSERT INTO `cloud_area` VALUES ('441481', 441400, '兴宁市');
INSERT INTO `cloud_area` VALUES ('441500', 440000, '汕尾市');
INSERT INTO `cloud_area` VALUES ('441501', 441500, '市辖区');
INSERT INTO `cloud_area` VALUES ('441502', 441500, '城区');
INSERT INTO `cloud_area` VALUES ('441521', 441500, '海丰县');
INSERT INTO `cloud_area` VALUES ('441523', 441500, '陆河县');
INSERT INTO `cloud_area` VALUES ('441581', 441500, '陆丰市');
INSERT INTO `cloud_area` VALUES ('441600', 440000, '河源市');
INSERT INTO `cloud_area` VALUES ('441601', 441600, '市辖区');
INSERT INTO `cloud_area` VALUES ('441602', 441600, '源城区');
INSERT INTO `cloud_area` VALUES ('441621', 441600, '紫金县');
INSERT INTO `cloud_area` VALUES ('441622', 441600, '龙川县');
INSERT INTO `cloud_area` VALUES ('441623', 441600, '连平县');
INSERT INTO `cloud_area` VALUES ('441624', 441600, '和平县');
INSERT INTO `cloud_area` VALUES ('441625', 441600, '东源县');
INSERT INTO `cloud_area` VALUES ('441700', 440000, '阳江市');
INSERT INTO `cloud_area` VALUES ('441701', 441700, '市辖区');
INSERT INTO `cloud_area` VALUES ('441702', 441700, '江城区');
INSERT INTO `cloud_area` VALUES ('441704', 441700, '阳东区');
INSERT INTO `cloud_area` VALUES ('441721', 441700, '阳西县');
INSERT INTO `cloud_area` VALUES ('441781', 441700, '阳春市');
INSERT INTO `cloud_area` VALUES ('441800', 440000, '清远市');
INSERT INTO `cloud_area` VALUES ('441801', 441800, '市辖区');
INSERT INTO `cloud_area` VALUES ('441802', 441800, '清城区');
INSERT INTO `cloud_area` VALUES ('441803', 441800, '清新区');
INSERT INTO `cloud_area` VALUES ('441821', 441800, '佛冈县');
INSERT INTO `cloud_area` VALUES ('441823', 441800, '阳山县');
INSERT INTO `cloud_area` VALUES ('441825', 441800, '连山壮族瑶族自治县');
INSERT INTO `cloud_area` VALUES ('441826', 441800, '连南瑶族自治县');
INSERT INTO `cloud_area` VALUES ('441881', 441800, '英德市');
INSERT INTO `cloud_area` VALUES ('441882', 441800, '连州市');
INSERT INTO `cloud_area` VALUES ('441900', 440000, '东莞市');
INSERT INTO `cloud_area` VALUES ('442000', 440000, '中山市');
INSERT INTO `cloud_area` VALUES ('445100', 440000, '潮州市');
INSERT INTO `cloud_area` VALUES ('445101', 445100, '市辖区');
INSERT INTO `cloud_area` VALUES ('445102', 445100, '湘桥区');
INSERT INTO `cloud_area` VALUES ('445103', 445100, '潮安区');
INSERT INTO `cloud_area` VALUES ('445122', 445100, '饶平县');
INSERT INTO `cloud_area` VALUES ('445200', 440000, '揭阳市');
INSERT INTO `cloud_area` VALUES ('445201', 445200, '市辖区');
INSERT INTO `cloud_area` VALUES ('445202', 445200, '榕城区');
INSERT INTO `cloud_area` VALUES ('445203', 445200, '揭东区');
INSERT INTO `cloud_area` VALUES ('445222', 445200, '揭西县');
INSERT INTO `cloud_area` VALUES ('445224', 445200, '惠来县');
INSERT INTO `cloud_area` VALUES ('445281', 445200, '普宁市');
INSERT INTO `cloud_area` VALUES ('445300', 440000, '云浮市');
INSERT INTO `cloud_area` VALUES ('445301', 445300, '市辖区');
INSERT INTO `cloud_area` VALUES ('445302', 445300, '云城区');
INSERT INTO `cloud_area` VALUES ('445303', 445300, '云安区');
INSERT INTO `cloud_area` VALUES ('445321', 445300, '新兴县');
INSERT INTO `cloud_area` VALUES ('445322', 445300, '郁南县');
INSERT INTO `cloud_area` VALUES ('445381', 445300, '罗定市');
INSERT INTO `cloud_area` VALUES ('450000', null, '广西壮族自治区');
INSERT INTO `cloud_area` VALUES ('450100', 450000, '南宁市');
INSERT INTO `cloud_area` VALUES ('450101', 450100, '市辖区');
INSERT INTO `cloud_area` VALUES ('450102', 450100, '兴宁区');
INSERT INTO `cloud_area` VALUES ('450103', 450100, '青秀区');
INSERT INTO `cloud_area` VALUES ('450105', 450100, '江南区');
INSERT INTO `cloud_area` VALUES ('450107', 450100, '西乡塘区');
INSERT INTO `cloud_area` VALUES ('450108', 450100, '良庆区');
INSERT INTO `cloud_area` VALUES ('450109', 450100, '邕宁区');
INSERT INTO `cloud_area` VALUES ('450110', 450100, '武鸣区');
INSERT INTO `cloud_area` VALUES ('450123', 450100, '隆安县');
INSERT INTO `cloud_area` VALUES ('450124', 450100, '马山县');
INSERT INTO `cloud_area` VALUES ('450125', 450100, '上林县');
INSERT INTO `cloud_area` VALUES ('450126', 450100, '宾阳县');
INSERT INTO `cloud_area` VALUES ('450127', 450100, '横县');
INSERT INTO `cloud_area` VALUES ('450200', 450000, '柳州市');
INSERT INTO `cloud_area` VALUES ('450201', 450200, '市辖区');
INSERT INTO `cloud_area` VALUES ('450202', 450200, '城中区');
INSERT INTO `cloud_area` VALUES ('450203', 450200, '鱼峰区');
INSERT INTO `cloud_area` VALUES ('450204', 450200, '柳南区');
INSERT INTO `cloud_area` VALUES ('450205', 450200, '柳北区');
INSERT INTO `cloud_area` VALUES ('450221', 450200, '柳江县');
INSERT INTO `cloud_area` VALUES ('450222', 450200, '柳城县');
INSERT INTO `cloud_area` VALUES ('450223', 450200, '鹿寨县');
INSERT INTO `cloud_area` VALUES ('450224', 450200, '融安县');
INSERT INTO `cloud_area` VALUES ('450225', 450200, '融水苗族自治县');
INSERT INTO `cloud_area` VALUES ('450226', 450200, '三江侗族自治县');
INSERT INTO `cloud_area` VALUES ('450300', 450000, '桂林市');
INSERT INTO `cloud_area` VALUES ('450301', 450300, '市辖区');
INSERT INTO `cloud_area` VALUES ('450302', 450300, '秀峰区');
INSERT INTO `cloud_area` VALUES ('450303', 450300, '叠彩区');
INSERT INTO `cloud_area` VALUES ('450304', 450300, '象山区');
INSERT INTO `cloud_area` VALUES ('450305', 450300, '七星区');
INSERT INTO `cloud_area` VALUES ('450311', 450300, '雁山区');
INSERT INTO `cloud_area` VALUES ('450312', 450300, '临桂区');
INSERT INTO `cloud_area` VALUES ('450321', 450300, '阳朔县');
INSERT INTO `cloud_area` VALUES ('450323', 450300, '灵川县');
INSERT INTO `cloud_area` VALUES ('450324', 450300, '全州县');
INSERT INTO `cloud_area` VALUES ('450325', 450300, '兴安县');
INSERT INTO `cloud_area` VALUES ('450326', 450300, '永福县');
INSERT INTO `cloud_area` VALUES ('450327', 450300, '灌阳县');
INSERT INTO `cloud_area` VALUES ('450328', 450300, '龙胜各族自治县');
INSERT INTO `cloud_area` VALUES ('450329', 450300, '资源县');
INSERT INTO `cloud_area` VALUES ('450330', 450300, '平乐县');
INSERT INTO `cloud_area` VALUES ('450331', 450300, '荔浦县');
INSERT INTO `cloud_area` VALUES ('450332', 450300, '恭城瑶族自治县');
INSERT INTO `cloud_area` VALUES ('450400', 450000, '梧州市');
INSERT INTO `cloud_area` VALUES ('450401', 450400, '市辖区');
INSERT INTO `cloud_area` VALUES ('450403', 450400, '万秀区');
INSERT INTO `cloud_area` VALUES ('450405', 450400, '长洲区');
INSERT INTO `cloud_area` VALUES ('450406', 450400, '龙圩区');
INSERT INTO `cloud_area` VALUES ('450421', 450400, '苍梧县');
INSERT INTO `cloud_area` VALUES ('450422', 450400, '藤县');
INSERT INTO `cloud_area` VALUES ('450423', 450400, '蒙山县');
INSERT INTO `cloud_area` VALUES ('450481', 450400, '岑溪市');
INSERT INTO `cloud_area` VALUES ('450500', 450000, '北海市');
INSERT INTO `cloud_area` VALUES ('450501', 450500, '市辖区');
INSERT INTO `cloud_area` VALUES ('450502', 450500, '海城区');
INSERT INTO `cloud_area` VALUES ('450503', 450500, '银海区');
INSERT INTO `cloud_area` VALUES ('450512', 450500, '铁山港区');
INSERT INTO `cloud_area` VALUES ('450521', 450500, '合浦县');
INSERT INTO `cloud_area` VALUES ('450600', 450000, '防城港市');
INSERT INTO `cloud_area` VALUES ('450601', 450600, '市辖区');
INSERT INTO `cloud_area` VALUES ('450602', 450600, '港口区');
INSERT INTO `cloud_area` VALUES ('450603', 450600, '防城区');
INSERT INTO `cloud_area` VALUES ('450621', 450600, '上思县');
INSERT INTO `cloud_area` VALUES ('450681', 450600, '东兴市');
INSERT INTO `cloud_area` VALUES ('450700', 450000, '钦州市');
INSERT INTO `cloud_area` VALUES ('450701', 450700, '市辖区');
INSERT INTO `cloud_area` VALUES ('450702', 450700, '钦南区');
INSERT INTO `cloud_area` VALUES ('450703', 450700, '钦北区');
INSERT INTO `cloud_area` VALUES ('450721', 450700, '灵山县');
INSERT INTO `cloud_area` VALUES ('450722', 450700, '浦北县');
INSERT INTO `cloud_area` VALUES ('450800', 450000, '贵港市');
INSERT INTO `cloud_area` VALUES ('450801', 450800, '市辖区');
INSERT INTO `cloud_area` VALUES ('450802', 450800, '港北区');
INSERT INTO `cloud_area` VALUES ('450803', 450800, '港南区');
INSERT INTO `cloud_area` VALUES ('450804', 450800, '覃塘区');
INSERT INTO `cloud_area` VALUES ('450821', 450800, '平南县');
INSERT INTO `cloud_area` VALUES ('450881', 450800, '桂平市');
INSERT INTO `cloud_area` VALUES ('450900', 450000, '玉林市');
INSERT INTO `cloud_area` VALUES ('450901', 450900, '市辖区');
INSERT INTO `cloud_area` VALUES ('450902', 450900, '玉州区');
INSERT INTO `cloud_area` VALUES ('450903', 450900, '福绵区');
INSERT INTO `cloud_area` VALUES ('450921', 450900, '容县');
INSERT INTO `cloud_area` VALUES ('450922', 450900, '陆川县');
INSERT INTO `cloud_area` VALUES ('450923', 450900, '博白县');
INSERT INTO `cloud_area` VALUES ('450924', 450900, '兴业县');
INSERT INTO `cloud_area` VALUES ('450981', 450900, '北流市');
INSERT INTO `cloud_area` VALUES ('451000', 450000, '百色市');
INSERT INTO `cloud_area` VALUES ('451001', 451000, '市辖区');
INSERT INTO `cloud_area` VALUES ('451002', 451000, '右江区');
INSERT INTO `cloud_area` VALUES ('451021', 451000, '田阳县');
INSERT INTO `cloud_area` VALUES ('451022', 451000, '田东县');
INSERT INTO `cloud_area` VALUES ('451023', 451000, '平果县');
INSERT INTO `cloud_area` VALUES ('451024', 451000, '德保县');
INSERT INTO `cloud_area` VALUES ('451026', 451000, '那坡县');
INSERT INTO `cloud_area` VALUES ('451027', 451000, '凌云县');
INSERT INTO `cloud_area` VALUES ('451028', 451000, '乐业县');
INSERT INTO `cloud_area` VALUES ('451029', 451000, '田林县');
INSERT INTO `cloud_area` VALUES ('451030', 451000, '西林县');
INSERT INTO `cloud_area` VALUES ('451031', 451000, '隆林各族自治县');
INSERT INTO `cloud_area` VALUES ('451081', 451000, '靖西市');
INSERT INTO `cloud_area` VALUES ('451100', 450000, '贺州市');
INSERT INTO `cloud_area` VALUES ('451101', 451100, '市辖区');
INSERT INTO `cloud_area` VALUES ('451102', 451100, '八步区');
INSERT INTO `cloud_area` VALUES ('451121', 451100, '昭平县');
INSERT INTO `cloud_area` VALUES ('451122', 451100, '钟山县');
INSERT INTO `cloud_area` VALUES ('451123', 451100, '富川瑶族自治县');
INSERT INTO `cloud_area` VALUES ('451200', 450000, '河池市');
INSERT INTO `cloud_area` VALUES ('451201', 451200, '市辖区');
INSERT INTO `cloud_area` VALUES ('451202', 451200, '金城江区');
INSERT INTO `cloud_area` VALUES ('451221', 451200, '南丹县');
INSERT INTO `cloud_area` VALUES ('451222', 451200, '天峨县');
INSERT INTO `cloud_area` VALUES ('451223', 451200, '凤山县');
INSERT INTO `cloud_area` VALUES ('451224', 451200, '东兰县');
INSERT INTO `cloud_area` VALUES ('451225', 451200, '罗城仫佬族自治县');
INSERT INTO `cloud_area` VALUES ('451226', 451200, '环江毛南族自治县');
INSERT INTO `cloud_area` VALUES ('451227', 451200, '巴马瑶族自治县');
INSERT INTO `cloud_area` VALUES ('451228', 451200, '都安瑶族自治县');
INSERT INTO `cloud_area` VALUES ('451229', 451200, '大化瑶族自治县');
INSERT INTO `cloud_area` VALUES ('451281', 451200, '宜州市');
INSERT INTO `cloud_area` VALUES ('451300', 450000, '来宾市');
INSERT INTO `cloud_area` VALUES ('451301', 451300, '市辖区');
INSERT INTO `cloud_area` VALUES ('451302', 451300, '兴宾区');
INSERT INTO `cloud_area` VALUES ('451321', 451300, '忻城县');
INSERT INTO `cloud_area` VALUES ('451322', 451300, '象州县');
INSERT INTO `cloud_area` VALUES ('451323', 451300, '武宣县');
INSERT INTO `cloud_area` VALUES ('451324', 451300, '金秀瑶族自治县');
INSERT INTO `cloud_area` VALUES ('451381', 451300, '合山市');
INSERT INTO `cloud_area` VALUES ('451400', 450000, '崇左市');
INSERT INTO `cloud_area` VALUES ('451401', 451400, '市辖区');
INSERT INTO `cloud_area` VALUES ('451402', 451400, '江州区');
INSERT INTO `cloud_area` VALUES ('451421', 451400, '扶绥县');
INSERT INTO `cloud_area` VALUES ('451422', 451400, '宁明县');
INSERT INTO `cloud_area` VALUES ('451423', 451400, '龙州县');
INSERT INTO `cloud_area` VALUES ('451424', 451400, '大新县');
INSERT INTO `cloud_area` VALUES ('451425', 451400, '天等县');
INSERT INTO `cloud_area` VALUES ('451481', 451400, '凭祥市');
INSERT INTO `cloud_area` VALUES ('460000', null, '海南省');
INSERT INTO `cloud_area` VALUES ('460100', 460000, '海口市');
INSERT INTO `cloud_area` VALUES ('460101', 460100, '市辖区');
INSERT INTO `cloud_area` VALUES ('460105', 460100, '秀英区');
INSERT INTO `cloud_area` VALUES ('460106', 460100, '龙华区');
INSERT INTO `cloud_area` VALUES ('460107', 460100, '琼山区');
INSERT INTO `cloud_area` VALUES ('460108', 460100, '美兰区');
INSERT INTO `cloud_area` VALUES ('460200', 460000, '三亚市');
INSERT INTO `cloud_area` VALUES ('460201', 460200, '市辖区');
INSERT INTO `cloud_area` VALUES ('460202', 460200, '海棠区');
INSERT INTO `cloud_area` VALUES ('460203', 460200, '吉阳区');
INSERT INTO `cloud_area` VALUES ('460204', 460200, '天涯区');
INSERT INTO `cloud_area` VALUES ('460205', 460200, '崖州区');
INSERT INTO `cloud_area` VALUES ('460300', 460000, '三沙市');
INSERT INTO `cloud_area` VALUES ('460321', 460300, '西沙群岛');
INSERT INTO `cloud_area` VALUES ('460322', 460300, '南沙群岛');
INSERT INTO `cloud_area` VALUES ('460323', 460300, '中沙群岛的岛礁及其海域');
INSERT INTO `cloud_area` VALUES ('469000', 460000, '省直辖县级行政区划');
INSERT INTO `cloud_area` VALUES ('469001', 469000, '五指山市');
INSERT INTO `cloud_area` VALUES ('469002', 469000, '琼海市');
INSERT INTO `cloud_area` VALUES ('469003', 469000, '儋州市');
INSERT INTO `cloud_area` VALUES ('469005', 469000, '文昌市');
INSERT INTO `cloud_area` VALUES ('469006', 469000, '万宁市');
INSERT INTO `cloud_area` VALUES ('469007', 469000, '东方市');
INSERT INTO `cloud_area` VALUES ('469021', 469000, '定安县');
INSERT INTO `cloud_area` VALUES ('469022', 469000, '屯昌县');
INSERT INTO `cloud_area` VALUES ('469023', 469000, '澄迈县');
INSERT INTO `cloud_area` VALUES ('469024', 469000, '临高县');
INSERT INTO `cloud_area` VALUES ('469025', 469000, '白沙黎族自治县');
INSERT INTO `cloud_area` VALUES ('469026', 469000, '昌江黎族自治县');
INSERT INTO `cloud_area` VALUES ('469027', 469000, '乐东黎族自治县');
INSERT INTO `cloud_area` VALUES ('469028', 469000, '陵水黎族自治县');
INSERT INTO `cloud_area` VALUES ('469029', 469000, '保亭黎族苗族自治县');
INSERT INTO `cloud_area` VALUES ('469030', 469000, '琼中黎族苗族自治县');
INSERT INTO `cloud_area` VALUES ('500000', null, '重庆市');
INSERT INTO `cloud_area` VALUES ('500100', 500000, '市辖区');
INSERT INTO `cloud_area` VALUES ('500101', 500100, '万州区');
INSERT INTO `cloud_area` VALUES ('500102', 500100, '涪陵区');
INSERT INTO `cloud_area` VALUES ('500103', 500100, '渝中区');
INSERT INTO `cloud_area` VALUES ('500104', 500100, '大渡口区');
INSERT INTO `cloud_area` VALUES ('500105', 500100, '江北区');
INSERT INTO `cloud_area` VALUES ('500106', 500100, '沙坪坝区');
INSERT INTO `cloud_area` VALUES ('500107', 500100, '九龙坡区');
INSERT INTO `cloud_area` VALUES ('500108', 500100, '南岸区');
INSERT INTO `cloud_area` VALUES ('500109', 500100, '北碚区');
INSERT INTO `cloud_area` VALUES ('500110', 500100, '綦江区');
INSERT INTO `cloud_area` VALUES ('500111', 500100, '大足区');
INSERT INTO `cloud_area` VALUES ('500112', 500100, '渝北区');
INSERT INTO `cloud_area` VALUES ('500113', 500100, '巴南区');
INSERT INTO `cloud_area` VALUES ('500114', 500100, '黔江区');
INSERT INTO `cloud_area` VALUES ('500115', 500100, '长寿区');
INSERT INTO `cloud_area` VALUES ('500116', 500100, '江津区');
INSERT INTO `cloud_area` VALUES ('500117', 500100, '合川区');
INSERT INTO `cloud_area` VALUES ('500118', 500100, '永川区');
INSERT INTO `cloud_area` VALUES ('500119', 500100, '南川区');
INSERT INTO `cloud_area` VALUES ('500120', 500100, '璧山区');
INSERT INTO `cloud_area` VALUES ('500151', 500100, '铜梁区');
INSERT INTO `cloud_area` VALUES ('500152', 500100, '潼南区');
INSERT INTO `cloud_area` VALUES ('500153', 500100, '荣昌区');
INSERT INTO `cloud_area` VALUES ('500200', 500000, '县');
INSERT INTO `cloud_area` VALUES ('500228', 500200, '梁平县');
INSERT INTO `cloud_area` VALUES ('500229', 500200, '城口县');
INSERT INTO `cloud_area` VALUES ('500230', 500200, '丰都县');
INSERT INTO `cloud_area` VALUES ('500231', 500200, '垫江县');
INSERT INTO `cloud_area` VALUES ('500232', 500200, '武隆县');
INSERT INTO `cloud_area` VALUES ('500233', 500200, '忠县');
INSERT INTO `cloud_area` VALUES ('500234', 500200, '开县');
INSERT INTO `cloud_area` VALUES ('500235', 500200, '云阳县');
INSERT INTO `cloud_area` VALUES ('500236', 500200, '奉节县');
INSERT INTO `cloud_area` VALUES ('500237', 500200, '巫山县');
INSERT INTO `cloud_area` VALUES ('500238', 500200, '巫溪县');
INSERT INTO `cloud_area` VALUES ('500240', 500200, '石柱土家族自治县');
INSERT INTO `cloud_area` VALUES ('500241', 500200, '秀山土家族苗族自治县');
INSERT INTO `cloud_area` VALUES ('500242', 500200, '酉阳土家族苗族自治县');
INSERT INTO `cloud_area` VALUES ('500243', 500200, '彭水苗族土家族自治县');
INSERT INTO `cloud_area` VALUES ('510000', null, '四川省');
INSERT INTO `cloud_area` VALUES ('510100', 510000, '成都市');
INSERT INTO `cloud_area` VALUES ('510101', 510100, '市辖区');
INSERT INTO `cloud_area` VALUES ('510104', 510100, '锦江区');
INSERT INTO `cloud_area` VALUES ('510105', 510100, '青羊区');
INSERT INTO `cloud_area` VALUES ('510106', 510100, '金牛区');
INSERT INTO `cloud_area` VALUES ('510107', 510100, '武侯区');
INSERT INTO `cloud_area` VALUES ('510108', 510100, '成华区');
INSERT INTO `cloud_area` VALUES ('510112', 510100, '龙泉驿区');
INSERT INTO `cloud_area` VALUES ('510113', 510100, '青白江区');
INSERT INTO `cloud_area` VALUES ('510114', 510100, '新都区');
INSERT INTO `cloud_area` VALUES ('510115', 510100, '温江区');
INSERT INTO `cloud_area` VALUES ('510121', 510100, '金堂县');
INSERT INTO `cloud_area` VALUES ('510122', 510100, '双流县');
INSERT INTO `cloud_area` VALUES ('510124', 510100, '郫县');
INSERT INTO `cloud_area` VALUES ('510129', 510100, '大邑县');
INSERT INTO `cloud_area` VALUES ('510131', 510100, '蒲江县');
INSERT INTO `cloud_area` VALUES ('510132', 510100, '新津县');
INSERT INTO `cloud_area` VALUES ('510181', 510100, '都江堰市');
INSERT INTO `cloud_area` VALUES ('510182', 510100, '彭州市');
INSERT INTO `cloud_area` VALUES ('510183', 510100, '邛崃市');
INSERT INTO `cloud_area` VALUES ('510184', 510100, '崇州市');
INSERT INTO `cloud_area` VALUES ('510300', 510000, '自贡市');
INSERT INTO `cloud_area` VALUES ('510301', 510300, '市辖区');
INSERT INTO `cloud_area` VALUES ('510302', 510300, '自流井区');
INSERT INTO `cloud_area` VALUES ('510303', 510300, '贡井区');
INSERT INTO `cloud_area` VALUES ('510304', 510300, '大安区');
INSERT INTO `cloud_area` VALUES ('510311', 510300, '沿滩区');
INSERT INTO `cloud_area` VALUES ('510321', 510300, '荣县');
INSERT INTO `cloud_area` VALUES ('510322', 510300, '富顺县');
INSERT INTO `cloud_area` VALUES ('510400', 510000, '攀枝花市');
INSERT INTO `cloud_area` VALUES ('510401', 510400, '市辖区');
INSERT INTO `cloud_area` VALUES ('510402', 510400, '东区');
INSERT INTO `cloud_area` VALUES ('510403', 510400, '西区');
INSERT INTO `cloud_area` VALUES ('510411', 510400, '仁和区');
INSERT INTO `cloud_area` VALUES ('510421', 510400, '米易县');
INSERT INTO `cloud_area` VALUES ('510422', 510400, '盐边县');
INSERT INTO `cloud_area` VALUES ('510500', 510000, '泸州市');
INSERT INTO `cloud_area` VALUES ('510501', 510500, '市辖区');
INSERT INTO `cloud_area` VALUES ('510502', 510500, '江阳区');
INSERT INTO `cloud_area` VALUES ('510503', 510500, '纳溪区');
INSERT INTO `cloud_area` VALUES ('510504', 510500, '龙马潭区');
INSERT INTO `cloud_area` VALUES ('510521', 510500, '泸县');
INSERT INTO `cloud_area` VALUES ('510522', 510500, '合江县');
INSERT INTO `cloud_area` VALUES ('510524', 510500, '叙永县');
INSERT INTO `cloud_area` VALUES ('510525', 510500, '古蔺县');
INSERT INTO `cloud_area` VALUES ('510600', 510000, '德阳市');
INSERT INTO `cloud_area` VALUES ('510601', 510600, '市辖区');
INSERT INTO `cloud_area` VALUES ('510603', 510600, '旌阳区');
INSERT INTO `cloud_area` VALUES ('510623', 510600, '中江县');
INSERT INTO `cloud_area` VALUES ('510626', 510600, '罗江县');
INSERT INTO `cloud_area` VALUES ('510681', 510600, '广汉市');
INSERT INTO `cloud_area` VALUES ('510682', 510600, '什邡市');
INSERT INTO `cloud_area` VALUES ('510683', 510600, '绵竹市');
INSERT INTO `cloud_area` VALUES ('510700', 510000, '绵阳市');
INSERT INTO `cloud_area` VALUES ('510701', 510700, '市辖区');
INSERT INTO `cloud_area` VALUES ('510703', 510700, '涪城区');
INSERT INTO `cloud_area` VALUES ('510704', 510700, '游仙区');
INSERT INTO `cloud_area` VALUES ('510722', 510700, '三台县');
INSERT INTO `cloud_area` VALUES ('510723', 510700, '盐亭县');
INSERT INTO `cloud_area` VALUES ('510724', 510700, '安县');
INSERT INTO `cloud_area` VALUES ('510725', 510700, '梓潼县');
INSERT INTO `cloud_area` VALUES ('510726', 510700, '北川羌族自治县');
INSERT INTO `cloud_area` VALUES ('510727', 510700, '平武县');
INSERT INTO `cloud_area` VALUES ('510781', 510700, '江油市');
INSERT INTO `cloud_area` VALUES ('510800', 510000, '广元市');
INSERT INTO `cloud_area` VALUES ('510801', 510800, '市辖区');
INSERT INTO `cloud_area` VALUES ('510802', 510800, '利州区');
INSERT INTO `cloud_area` VALUES ('510811', 510800, '昭化区');
INSERT INTO `cloud_area` VALUES ('510812', 510800, '朝天区');
INSERT INTO `cloud_area` VALUES ('510821', 510800, '旺苍县');
INSERT INTO `cloud_area` VALUES ('510822', 510800, '青川县');
INSERT INTO `cloud_area` VALUES ('510823', 510800, '剑阁县');
INSERT INTO `cloud_area` VALUES ('510824', 510800, '苍溪县');
INSERT INTO `cloud_area` VALUES ('510900', 510000, '遂宁市');
INSERT INTO `cloud_area` VALUES ('510901', 510900, '市辖区');
INSERT INTO `cloud_area` VALUES ('510903', 510900, '船山区');
INSERT INTO `cloud_area` VALUES ('510904', 510900, '安居区');
INSERT INTO `cloud_area` VALUES ('510921', 510900, '蓬溪县');
INSERT INTO `cloud_area` VALUES ('510922', 510900, '射洪县');
INSERT INTO `cloud_area` VALUES ('510923', 510900, '大英县');
INSERT INTO `cloud_area` VALUES ('511000', 510000, '内江市');
INSERT INTO `cloud_area` VALUES ('511001', 511000, '市辖区');
INSERT INTO `cloud_area` VALUES ('511002', 511000, '市中区');
INSERT INTO `cloud_area` VALUES ('511011', 511000, '东兴区');
INSERT INTO `cloud_area` VALUES ('511024', 511000, '威远县');
INSERT INTO `cloud_area` VALUES ('511025', 511000, '资中县');
INSERT INTO `cloud_area` VALUES ('511028', 511000, '隆昌县');
INSERT INTO `cloud_area` VALUES ('511100', 510000, '乐山市');
INSERT INTO `cloud_area` VALUES ('511101', 511100, '市辖区');
INSERT INTO `cloud_area` VALUES ('511102', 511100, '市中区');
INSERT INTO `cloud_area` VALUES ('511111', 511100, '沙湾区');
INSERT INTO `cloud_area` VALUES ('511112', 511100, '五通桥区');
INSERT INTO `cloud_area` VALUES ('511113', 511100, '金口河区');
INSERT INTO `cloud_area` VALUES ('511123', 511100, '犍为县');
INSERT INTO `cloud_area` VALUES ('511124', 511100, '井研县');
INSERT INTO `cloud_area` VALUES ('511126', 511100, '夹江县');
INSERT INTO `cloud_area` VALUES ('511129', 511100, '沐川县');
INSERT INTO `cloud_area` VALUES ('511132', 511100, '峨边彝族自治县');
INSERT INTO `cloud_area` VALUES ('511133', 511100, '马边彝族自治县');
INSERT INTO `cloud_area` VALUES ('511181', 511100, '峨眉山市');
INSERT INTO `cloud_area` VALUES ('511300', 510000, '南充市');
INSERT INTO `cloud_area` VALUES ('511301', 511300, '市辖区');
INSERT INTO `cloud_area` VALUES ('511302', 511300, '顺庆区');
INSERT INTO `cloud_area` VALUES ('511303', 511300, '高坪区');
INSERT INTO `cloud_area` VALUES ('511304', 511300, '嘉陵区');
INSERT INTO `cloud_area` VALUES ('511321', 511300, '南部县');
INSERT INTO `cloud_area` VALUES ('511322', 511300, '营山县');
INSERT INTO `cloud_area` VALUES ('511323', 511300, '蓬安县');
INSERT INTO `cloud_area` VALUES ('511324', 511300, '仪陇县');
INSERT INTO `cloud_area` VALUES ('511325', 511300, '西充县');
INSERT INTO `cloud_area` VALUES ('511381', 511300, '阆中市');
INSERT INTO `cloud_area` VALUES ('511400', 510000, '眉山市');
INSERT INTO `cloud_area` VALUES ('511401', 511400, '市辖区');
INSERT INTO `cloud_area` VALUES ('511402', 511400, '东坡区');
INSERT INTO `cloud_area` VALUES ('511403', 511400, '彭山区');
INSERT INTO `cloud_area` VALUES ('511421', 511400, '仁寿县');
INSERT INTO `cloud_area` VALUES ('511423', 511400, '洪雅县');
INSERT INTO `cloud_area` VALUES ('511424', 511400, '丹棱县');
INSERT INTO `cloud_area` VALUES ('511425', 511400, '青神县');
INSERT INTO `cloud_area` VALUES ('511500', 510000, '宜宾市');
INSERT INTO `cloud_area` VALUES ('511501', 511500, '市辖区');
INSERT INTO `cloud_area` VALUES ('511502', 511500, '翠屏区');
INSERT INTO `cloud_area` VALUES ('511503', 511500, '南溪区');
INSERT INTO `cloud_area` VALUES ('511521', 511500, '宜宾县');
INSERT INTO `cloud_area` VALUES ('511523', 511500, '江安县');
INSERT INTO `cloud_area` VALUES ('511524', 511500, '长宁县');
INSERT INTO `cloud_area` VALUES ('511525', 511500, '高县');
INSERT INTO `cloud_area` VALUES ('511526', 511500, '珙县');
INSERT INTO `cloud_area` VALUES ('511527', 511500, '筠连县');
INSERT INTO `cloud_area` VALUES ('511528', 511500, '兴文县');
INSERT INTO `cloud_area` VALUES ('511529', 511500, '屏山县');
INSERT INTO `cloud_area` VALUES ('511600', 510000, '广安市');
INSERT INTO `cloud_area` VALUES ('511601', 511600, '市辖区');
INSERT INTO `cloud_area` VALUES ('511602', 511600, '广安区');
INSERT INTO `cloud_area` VALUES ('511603', 511600, '前锋区');
INSERT INTO `cloud_area` VALUES ('511621', 511600, '岳池县');
INSERT INTO `cloud_area` VALUES ('511622', 511600, '武胜县');
INSERT INTO `cloud_area` VALUES ('511623', 511600, '邻水县');
INSERT INTO `cloud_area` VALUES ('511681', 511600, '华蓥市');
INSERT INTO `cloud_area` VALUES ('511700', 510000, '达州市');
INSERT INTO `cloud_area` VALUES ('511701', 511700, '市辖区');
INSERT INTO `cloud_area` VALUES ('511702', 511700, '通川区');
INSERT INTO `cloud_area` VALUES ('511703', 511700, '达川区');
INSERT INTO `cloud_area` VALUES ('511722', 511700, '宣汉县');
INSERT INTO `cloud_area` VALUES ('511723', 511700, '开江县');
INSERT INTO `cloud_area` VALUES ('511724', 511700, '大竹县');
INSERT INTO `cloud_area` VALUES ('511725', 511700, '渠县');
INSERT INTO `cloud_area` VALUES ('511781', 511700, '万源市');
INSERT INTO `cloud_area` VALUES ('511800', 510000, '雅安市');
INSERT INTO `cloud_area` VALUES ('511801', 511800, '市辖区');
INSERT INTO `cloud_area` VALUES ('511802', 511800, '雨城区');
INSERT INTO `cloud_area` VALUES ('511803', 511800, '名山区');
INSERT INTO `cloud_area` VALUES ('511822', 511800, '荥经县');
INSERT INTO `cloud_area` VALUES ('511823', 511800, '汉源县');
INSERT INTO `cloud_area` VALUES ('511824', 511800, '石棉县');
INSERT INTO `cloud_area` VALUES ('511825', 511800, '天全县');
INSERT INTO `cloud_area` VALUES ('511826', 511800, '芦山县');
INSERT INTO `cloud_area` VALUES ('511827', 511800, '宝兴县');
INSERT INTO `cloud_area` VALUES ('511900', 510000, '巴中市');
INSERT INTO `cloud_area` VALUES ('511901', 511900, '市辖区');
INSERT INTO `cloud_area` VALUES ('511902', 511900, '巴州区');
INSERT INTO `cloud_area` VALUES ('511903', 511900, '恩阳区');
INSERT INTO `cloud_area` VALUES ('511921', 511900, '通江县');
INSERT INTO `cloud_area` VALUES ('511922', 511900, '南江县');
INSERT INTO `cloud_area` VALUES ('511923', 511900, '平昌县');
INSERT INTO `cloud_area` VALUES ('512000', 510000, '资阳市');
INSERT INTO `cloud_area` VALUES ('512001', 512000, '市辖区');
INSERT INTO `cloud_area` VALUES ('512002', 512000, '雁江区');
INSERT INTO `cloud_area` VALUES ('512021', 512000, '安岳县');
INSERT INTO `cloud_area` VALUES ('512022', 512000, '乐至县');
INSERT INTO `cloud_area` VALUES ('512081', 512000, '简阳市');
INSERT INTO `cloud_area` VALUES ('513200', 510000, '阿坝藏族羌族自治州');
INSERT INTO `cloud_area` VALUES ('513221', 513200, '汶川县');
INSERT INTO `cloud_area` VALUES ('513222', 513200, '理县');
INSERT INTO `cloud_area` VALUES ('513223', 513200, '茂县');
INSERT INTO `cloud_area` VALUES ('513224', 513200, '松潘县');
INSERT INTO `cloud_area` VALUES ('513225', 513200, '九寨沟县');
INSERT INTO `cloud_area` VALUES ('513226', 513200, '金川县');
INSERT INTO `cloud_area` VALUES ('513227', 513200, '小金县');
INSERT INTO `cloud_area` VALUES ('513228', 513200, '黑水县');
INSERT INTO `cloud_area` VALUES ('513229', 513200, '马尔康县');
INSERT INTO `cloud_area` VALUES ('513230', 513200, '壤塘县');
INSERT INTO `cloud_area` VALUES ('513231', 513200, '阿坝县');
INSERT INTO `cloud_area` VALUES ('513232', 513200, '若尔盖县');
INSERT INTO `cloud_area` VALUES ('513233', 513200, '红原县');
INSERT INTO `cloud_area` VALUES ('513300', 510000, '甘孜藏族自治州');
INSERT INTO `cloud_area` VALUES ('513301', 513300, '康定市');
INSERT INTO `cloud_area` VALUES ('513322', 513300, '泸定县');
INSERT INTO `cloud_area` VALUES ('513323', 513300, '丹巴县');
INSERT INTO `cloud_area` VALUES ('513324', 513300, '九龙县');
INSERT INTO `cloud_area` VALUES ('513325', 513300, '雅江县');
INSERT INTO `cloud_area` VALUES ('513326', 513300, '道孚县');
INSERT INTO `cloud_area` VALUES ('513327', 513300, '炉霍县');
INSERT INTO `cloud_area` VALUES ('513328', 513300, '甘孜县');
INSERT INTO `cloud_area` VALUES ('513329', 513300, '新龙县');
INSERT INTO `cloud_area` VALUES ('513330', 513300, '德格县');
INSERT INTO `cloud_area` VALUES ('513331', 513300, '白玉县');
INSERT INTO `cloud_area` VALUES ('513332', 513300, '石渠县');
INSERT INTO `cloud_area` VALUES ('513333', 513300, '色达县');
INSERT INTO `cloud_area` VALUES ('513334', 513300, '理塘县');
INSERT INTO `cloud_area` VALUES ('513335', 513300, '巴塘县');
INSERT INTO `cloud_area` VALUES ('513336', 513300, '乡城县');
INSERT INTO `cloud_area` VALUES ('513337', 513300, '稻城县');
INSERT INTO `cloud_area` VALUES ('513338', 513300, '得荣县');
INSERT INTO `cloud_area` VALUES ('513400', 510000, '凉山彝族自治州');
INSERT INTO `cloud_area` VALUES ('513401', 513400, '西昌市');
INSERT INTO `cloud_area` VALUES ('513422', 513400, '木里藏族自治县');
INSERT INTO `cloud_area` VALUES ('513423', 513400, '盐源县');
INSERT INTO `cloud_area` VALUES ('513424', 513400, '德昌县');
INSERT INTO `cloud_area` VALUES ('513425', 513400, '会理县');
INSERT INTO `cloud_area` VALUES ('513426', 513400, '会东县');
INSERT INTO `cloud_area` VALUES ('513427', 513400, '宁南县');
INSERT INTO `cloud_area` VALUES ('513428', 513400, '普格县');
INSERT INTO `cloud_area` VALUES ('513429', 513400, '布拖县');
INSERT INTO `cloud_area` VALUES ('513430', 513400, '金阳县');
INSERT INTO `cloud_area` VALUES ('513431', 513400, '昭觉县');
INSERT INTO `cloud_area` VALUES ('513432', 513400, '喜德县');
INSERT INTO `cloud_area` VALUES ('513433', 513400, '冕宁县');
INSERT INTO `cloud_area` VALUES ('513434', 513400, '越西县');
INSERT INTO `cloud_area` VALUES ('513435', 513400, '甘洛县');
INSERT INTO `cloud_area` VALUES ('513436', 513400, '美姑县');
INSERT INTO `cloud_area` VALUES ('513437', 513400, '雷波县');
INSERT INTO `cloud_area` VALUES ('520000', null, '贵州省');
INSERT INTO `cloud_area` VALUES ('520100', 520000, '贵阳市');
INSERT INTO `cloud_area` VALUES ('520101', 520100, '市辖区');
INSERT INTO `cloud_area` VALUES ('520102', 520100, '南明区');
INSERT INTO `cloud_area` VALUES ('520103', 520100, '云岩区');
INSERT INTO `cloud_area` VALUES ('520111', 520100, '花溪区');
INSERT INTO `cloud_area` VALUES ('520112', 520100, '乌当区');
INSERT INTO `cloud_area` VALUES ('520113', 520100, '白云区');
INSERT INTO `cloud_area` VALUES ('520115', 520100, '观山湖区');
INSERT INTO `cloud_area` VALUES ('520121', 520100, '开阳县');
INSERT INTO `cloud_area` VALUES ('520122', 520100, '息烽县');
INSERT INTO `cloud_area` VALUES ('520123', 520100, '修文县');
INSERT INTO `cloud_area` VALUES ('520181', 520100, '清镇市');
INSERT INTO `cloud_area` VALUES ('520200', 520000, '六盘水市');
INSERT INTO `cloud_area` VALUES ('520201', 520200, '钟山区');
INSERT INTO `cloud_area` VALUES ('520203', 520200, '六枝特区');
INSERT INTO `cloud_area` VALUES ('520221', 520200, '水城县');
INSERT INTO `cloud_area` VALUES ('520222', 520200, '盘县');
INSERT INTO `cloud_area` VALUES ('520300', 520000, '遵义市');
INSERT INTO `cloud_area` VALUES ('520301', 520300, '市辖区');
INSERT INTO `cloud_area` VALUES ('520302', 520300, '红花岗区');
INSERT INTO `cloud_area` VALUES ('520303', 520300, '汇川区');
INSERT INTO `cloud_area` VALUES ('520321', 520300, '遵义县');
INSERT INTO `cloud_area` VALUES ('520322', 520300, '桐梓县');
INSERT INTO `cloud_area` VALUES ('520323', 520300, '绥阳县');
INSERT INTO `cloud_area` VALUES ('520324', 520300, '正安县');
INSERT INTO `cloud_area` VALUES ('520325', 520300, '道真仡佬族苗族自治县');
INSERT INTO `cloud_area` VALUES ('520326', 520300, '务川仡佬族苗族自治县');
INSERT INTO `cloud_area` VALUES ('520327', 520300, '凤冈县');
INSERT INTO `cloud_area` VALUES ('520328', 520300, '湄潭县');
INSERT INTO `cloud_area` VALUES ('520329', 520300, '余庆县');
INSERT INTO `cloud_area` VALUES ('520330', 520300, '习水县');
INSERT INTO `cloud_area` VALUES ('520381', 520300, '赤水市');
INSERT INTO `cloud_area` VALUES ('520382', 520300, '仁怀市');
INSERT INTO `cloud_area` VALUES ('520400', 520000, '安顺市');
INSERT INTO `cloud_area` VALUES ('520401', 520400, '市辖区');
INSERT INTO `cloud_area` VALUES ('520402', 520400, '西秀区');
INSERT INTO `cloud_area` VALUES ('520403', 520400, '平坝区');
INSERT INTO `cloud_area` VALUES ('520422', 520400, '普定县');
INSERT INTO `cloud_area` VALUES ('520423', 520400, '镇宁布依族苗族自治县');
INSERT INTO `cloud_area` VALUES ('520424', 520400, '关岭布依族苗族自治县');
INSERT INTO `cloud_area` VALUES ('520425', 520400, '紫云苗族布依族自治县');
INSERT INTO `cloud_area` VALUES ('520500', 520000, '毕节市');
INSERT INTO `cloud_area` VALUES ('520501', 520500, '市辖区');
INSERT INTO `cloud_area` VALUES ('520502', 520500, '七星关区');
INSERT INTO `cloud_area` VALUES ('520521', 520500, '大方县');
INSERT INTO `cloud_area` VALUES ('520522', 520500, '黔西县');
INSERT INTO `cloud_area` VALUES ('520523', 520500, '金沙县');
INSERT INTO `cloud_area` VALUES ('520524', 520500, '织金县');
INSERT INTO `cloud_area` VALUES ('520525', 520500, '纳雍县');
INSERT INTO `cloud_area` VALUES ('520526', 520500, '威宁彝族回族苗族自治县');
INSERT INTO `cloud_area` VALUES ('520527', 520500, '赫章县');
INSERT INTO `cloud_area` VALUES ('520600', 520000, '铜仁市');
INSERT INTO `cloud_area` VALUES ('520601', 520600, '市辖区');
INSERT INTO `cloud_area` VALUES ('520602', 520600, '碧江区');
INSERT INTO `cloud_area` VALUES ('520603', 520600, '万山区');
INSERT INTO `cloud_area` VALUES ('520621', 520600, '江口县');
INSERT INTO `cloud_area` VALUES ('520622', 520600, '玉屏侗族自治县');
INSERT INTO `cloud_area` VALUES ('520623', 520600, '石阡县');
INSERT INTO `cloud_area` VALUES ('520624', 520600, '思南县');
INSERT INTO `cloud_area` VALUES ('520625', 520600, '印江土家族苗族自治县');
INSERT INTO `cloud_area` VALUES ('520626', 520600, '德江县');
INSERT INTO `cloud_area` VALUES ('520627', 520600, '沿河土家族自治县');
INSERT INTO `cloud_area` VALUES ('520628', 520600, '松桃苗族自治县');
INSERT INTO `cloud_area` VALUES ('522300', 520000, '黔西南布依族苗族自治州');
INSERT INTO `cloud_area` VALUES ('522301', 522300, '兴义市');
INSERT INTO `cloud_area` VALUES ('522322', 522300, '兴仁县');
INSERT INTO `cloud_area` VALUES ('522323', 522300, '普安县');
INSERT INTO `cloud_area` VALUES ('522324', 522300, '晴隆县');
INSERT INTO `cloud_area` VALUES ('522325', 522300, '贞丰县');
INSERT INTO `cloud_area` VALUES ('522326', 522300, '望谟县');
INSERT INTO `cloud_area` VALUES ('522327', 522300, '册亨县');
INSERT INTO `cloud_area` VALUES ('522328', 522300, '安龙县');
INSERT INTO `cloud_area` VALUES ('522600', 520000, '黔东南苗族侗族自治州');
INSERT INTO `cloud_area` VALUES ('522601', 522600, '凯里市');
INSERT INTO `cloud_area` VALUES ('522622', 522600, '黄平县');
INSERT INTO `cloud_area` VALUES ('522623', 522600, '施秉县');
INSERT INTO `cloud_area` VALUES ('522624', 522600, '三穗县');
INSERT INTO `cloud_area` VALUES ('522625', 522600, '镇远县');
INSERT INTO `cloud_area` VALUES ('522626', 522600, '岑巩县');
INSERT INTO `cloud_area` VALUES ('522627', 522600, '天柱县');
INSERT INTO `cloud_area` VALUES ('522628', 522600, '锦屏县');
INSERT INTO `cloud_area` VALUES ('522629', 522600, '剑河县');
INSERT INTO `cloud_area` VALUES ('522630', 522600, '台江县');
INSERT INTO `cloud_area` VALUES ('522631', 522600, '黎平县');
INSERT INTO `cloud_area` VALUES ('522632', 522600, '榕江县');
INSERT INTO `cloud_area` VALUES ('522633', 522600, '从江县');
INSERT INTO `cloud_area` VALUES ('522634', 522600, '雷山县');
INSERT INTO `cloud_area` VALUES ('522635', 522600, '麻江县');
INSERT INTO `cloud_area` VALUES ('522636', 522600, '丹寨县');
INSERT INTO `cloud_area` VALUES ('522700', 520000, '黔南布依族苗族自治州');
INSERT INTO `cloud_area` VALUES ('522701', 522700, '都匀市');
INSERT INTO `cloud_area` VALUES ('522702', 522700, '福泉市');
INSERT INTO `cloud_area` VALUES ('522722', 522700, '荔波县');
INSERT INTO `cloud_area` VALUES ('522723', 522700, '贵定县');
INSERT INTO `cloud_area` VALUES ('522725', 522700, '瓮安县');
INSERT INTO `cloud_area` VALUES ('522726', 522700, '独山县');
INSERT INTO `cloud_area` VALUES ('522727', 522700, '平塘县');
INSERT INTO `cloud_area` VALUES ('522728', 522700, '罗甸县');
INSERT INTO `cloud_area` VALUES ('522729', 522700, '长顺县');
INSERT INTO `cloud_area` VALUES ('522730', 522700, '龙里县');
INSERT INTO `cloud_area` VALUES ('522731', 522700, '惠水县');
INSERT INTO `cloud_area` VALUES ('522732', 522700, '三都水族自治县');
INSERT INTO `cloud_area` VALUES ('530000', null, '云南省');
INSERT INTO `cloud_area` VALUES ('530100', 530000, '昆明市');
INSERT INTO `cloud_area` VALUES ('530101', 530100, '市辖区');
INSERT INTO `cloud_area` VALUES ('530102', 530100, '五华区');
INSERT INTO `cloud_area` VALUES ('530103', 530100, '盘龙区');
INSERT INTO `cloud_area` VALUES ('530111', 530100, '官渡区');
INSERT INTO `cloud_area` VALUES ('530112', 530100, '西山区');
INSERT INTO `cloud_area` VALUES ('530113', 530100, '东川区');
INSERT INTO `cloud_area` VALUES ('530114', 530100, '呈贡区');
INSERT INTO `cloud_area` VALUES ('530122', 530100, '晋宁县');
INSERT INTO `cloud_area` VALUES ('530124', 530100, '富民县');
INSERT INTO `cloud_area` VALUES ('530125', 530100, '宜良县');
INSERT INTO `cloud_area` VALUES ('530126', 530100, '石林彝族自治县');
INSERT INTO `cloud_area` VALUES ('530127', 530100, '嵩明县');
INSERT INTO `cloud_area` VALUES ('530128', 530100, '禄劝彝族苗族自治县');
INSERT INTO `cloud_area` VALUES ('530129', 530100, '寻甸回族彝族自治县');
INSERT INTO `cloud_area` VALUES ('530181', 530100, '安宁市');
INSERT INTO `cloud_area` VALUES ('530300', 530000, '曲靖市');
INSERT INTO `cloud_area` VALUES ('530301', 530300, '市辖区');
INSERT INTO `cloud_area` VALUES ('530302', 530300, '麒麟区');
INSERT INTO `cloud_area` VALUES ('530321', 530300, '马龙县');
INSERT INTO `cloud_area` VALUES ('530322', 530300, '陆良县');
INSERT INTO `cloud_area` VALUES ('530323', 530300, '师宗县');
INSERT INTO `cloud_area` VALUES ('530324', 530300, '罗平县');
INSERT INTO `cloud_area` VALUES ('530325', 530300, '富源县');
INSERT INTO `cloud_area` VALUES ('530326', 530300, '会泽县');
INSERT INTO `cloud_area` VALUES ('530328', 530300, '沾益县');
INSERT INTO `cloud_area` VALUES ('530381', 530300, '宣威市');
INSERT INTO `cloud_area` VALUES ('530400', 530000, '玉溪市');
INSERT INTO `cloud_area` VALUES ('530401', 530400, '市辖区');
INSERT INTO `cloud_area` VALUES ('530402', 530400, '红塔区');
INSERT INTO `cloud_area` VALUES ('530421', 530400, '江川县');
INSERT INTO `cloud_area` VALUES ('530422', 530400, '澄江县');
INSERT INTO `cloud_area` VALUES ('530423', 530400, '通海县');
INSERT INTO `cloud_area` VALUES ('530424', 530400, '华宁县');
INSERT INTO `cloud_area` VALUES ('530425', 530400, '易门县');
INSERT INTO `cloud_area` VALUES ('530426', 530400, '峨山彝族自治县');
INSERT INTO `cloud_area` VALUES ('530427', 530400, '新平彝族傣族自治县');
INSERT INTO `cloud_area` VALUES ('530428', 530400, '元江哈尼族彝族傣族自治县');
INSERT INTO `cloud_area` VALUES ('530500', 530000, '保山市');
INSERT INTO `cloud_area` VALUES ('530501', 530500, '市辖区');
INSERT INTO `cloud_area` VALUES ('530502', 530500, '隆阳区');
INSERT INTO `cloud_area` VALUES ('530521', 530500, '施甸县');
INSERT INTO `cloud_area` VALUES ('530523', 530500, '龙陵县');
INSERT INTO `cloud_area` VALUES ('530524', 530500, '昌宁县');
INSERT INTO `cloud_area` VALUES ('530581', 530500, '腾冲市');
INSERT INTO `cloud_area` VALUES ('530600', 530000, '昭通市');
INSERT INTO `cloud_area` VALUES ('530601', 530600, '市辖区');
INSERT INTO `cloud_area` VALUES ('530602', 530600, '昭阳区');
INSERT INTO `cloud_area` VALUES ('530621', 530600, '鲁甸县');
INSERT INTO `cloud_area` VALUES ('530622', 530600, '巧家县');
INSERT INTO `cloud_area` VALUES ('530623', 530600, '盐津县');
INSERT INTO `cloud_area` VALUES ('530624', 530600, '大关县');
INSERT INTO `cloud_area` VALUES ('530625', 530600, '永善县');
INSERT INTO `cloud_area` VALUES ('530626', 530600, '绥江县');
INSERT INTO `cloud_area` VALUES ('530627', 530600, '镇雄县');
INSERT INTO `cloud_area` VALUES ('530628', 530600, '彝良县');
INSERT INTO `cloud_area` VALUES ('530629', 530600, '威信县');
INSERT INTO `cloud_area` VALUES ('530630', 530600, '水富县');
INSERT INTO `cloud_area` VALUES ('530700', 530000, '丽江市');
INSERT INTO `cloud_area` VALUES ('530701', 530700, '市辖区');
INSERT INTO `cloud_area` VALUES ('530702', 530700, '古城区');
INSERT INTO `cloud_area` VALUES ('530721', 530700, '玉龙纳西族自治县');
INSERT INTO `cloud_area` VALUES ('530722', 530700, '永胜县');
INSERT INTO `cloud_area` VALUES ('530723', 530700, '华坪县');
INSERT INTO `cloud_area` VALUES ('530724', 530700, '宁蒗彝族自治县');
INSERT INTO `cloud_area` VALUES ('530800', 530000, '普洱市');
INSERT INTO `cloud_area` VALUES ('530801', 530800, '市辖区');
INSERT INTO `cloud_area` VALUES ('530802', 530800, '思茅区');
INSERT INTO `cloud_area` VALUES ('530821', 530800, '宁洱哈尼族彝族自治县');
INSERT INTO `cloud_area` VALUES ('530822', 530800, '墨江哈尼族自治县');
INSERT INTO `cloud_area` VALUES ('530823', 530800, '景东彝族自治县');
INSERT INTO `cloud_area` VALUES ('530824', 530800, '景谷傣族彝族自治县');
INSERT INTO `cloud_area` VALUES ('530825', 530800, '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `cloud_area` VALUES ('530826', 530800, '江城哈尼族彝族自治县');
INSERT INTO `cloud_area` VALUES ('530827', 530800, '孟连傣族拉祜族佤族自治县');
INSERT INTO `cloud_area` VALUES ('530828', 530800, '澜沧拉祜族自治县');
INSERT INTO `cloud_area` VALUES ('530829', 530800, '西盟佤族自治县');
INSERT INTO `cloud_area` VALUES ('530900', 530000, '临沧市');
INSERT INTO `cloud_area` VALUES ('530901', 530900, '市辖区');
INSERT INTO `cloud_area` VALUES ('530902', 530900, '临翔区');
INSERT INTO `cloud_area` VALUES ('530921', 530900, '凤庆县');
INSERT INTO `cloud_area` VALUES ('530922', 530900, '云县');
INSERT INTO `cloud_area` VALUES ('530923', 530900, '永德县');
INSERT INTO `cloud_area` VALUES ('530924', 530900, '镇康县');
INSERT INTO `cloud_area` VALUES ('530925', 530900, '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `cloud_area` VALUES ('530926', 530900, '耿马傣族佤族自治县');
INSERT INTO `cloud_area` VALUES ('530927', 530900, '沧源佤族自治县');
INSERT INTO `cloud_area` VALUES ('532300', 530000, '楚雄彝族自治州');
INSERT INTO `cloud_area` VALUES ('532301', 532300, '楚雄市');
INSERT INTO `cloud_area` VALUES ('532322', 532300, '双柏县');
INSERT INTO `cloud_area` VALUES ('532323', 532300, '牟定县');
INSERT INTO `cloud_area` VALUES ('532324', 532300, '南华县');
INSERT INTO `cloud_area` VALUES ('532325', 532300, '姚安县');
INSERT INTO `cloud_area` VALUES ('532326', 532300, '大姚县');
INSERT INTO `cloud_area` VALUES ('532327', 532300, '永仁县');
INSERT INTO `cloud_area` VALUES ('532328', 532300, '元谋县');
INSERT INTO `cloud_area` VALUES ('532329', 532300, '武定县');
INSERT INTO `cloud_area` VALUES ('532331', 532300, '禄丰县');
INSERT INTO `cloud_area` VALUES ('532500', 530000, '红河哈尼族彝族自治州');
INSERT INTO `cloud_area` VALUES ('532501', 532500, '个旧市');
INSERT INTO `cloud_area` VALUES ('532502', 532500, '开远市');
INSERT INTO `cloud_area` VALUES ('532503', 532500, '蒙自市');
INSERT INTO `cloud_area` VALUES ('532504', 532500, '弥勒市');
INSERT INTO `cloud_area` VALUES ('532523', 532500, '屏边苗族自治县');
INSERT INTO `cloud_area` VALUES ('532524', 532500, '建水县');
INSERT INTO `cloud_area` VALUES ('532525', 532500, '石屏县');
INSERT INTO `cloud_area` VALUES ('532527', 532500, '泸西县');
INSERT INTO `cloud_area` VALUES ('532528', 532500, '元阳县');
INSERT INTO `cloud_area` VALUES ('532529', 532500, '红河县');
INSERT INTO `cloud_area` VALUES ('532530', 532500, '金平苗族瑶族傣族自治县');
INSERT INTO `cloud_area` VALUES ('532531', 532500, '绿春县');
INSERT INTO `cloud_area` VALUES ('532532', 532500, '河口瑶族自治县');
INSERT INTO `cloud_area` VALUES ('532600', 530000, '文山壮族苗族自治州');
INSERT INTO `cloud_area` VALUES ('532601', 532600, '文山市');
INSERT INTO `cloud_area` VALUES ('532622', 532600, '砚山县');
INSERT INTO `cloud_area` VALUES ('532623', 532600, '西畴县');
INSERT INTO `cloud_area` VALUES ('532624', 532600, '麻栗坡县');
INSERT INTO `cloud_area` VALUES ('532625', 532600, '马关县');
INSERT INTO `cloud_area` VALUES ('532626', 532600, '丘北县');
INSERT INTO `cloud_area` VALUES ('532627', 532600, '广南县');
INSERT INTO `cloud_area` VALUES ('532628', 532600, '富宁县');
INSERT INTO `cloud_area` VALUES ('532800', 530000, '西双版纳傣族自治州');
INSERT INTO `cloud_area` VALUES ('532801', 532800, '景洪市');
INSERT INTO `cloud_area` VALUES ('532822', 532800, '勐海县');
INSERT INTO `cloud_area` VALUES ('532823', 532800, '勐腊县');
INSERT INTO `cloud_area` VALUES ('532900', 530000, '大理白族自治州');
INSERT INTO `cloud_area` VALUES ('532901', 532900, '大理市');
INSERT INTO `cloud_area` VALUES ('532922', 532900, '漾濞彝族自治县');
INSERT INTO `cloud_area` VALUES ('532923', 532900, '祥云县');
INSERT INTO `cloud_area` VALUES ('532924', 532900, '宾川县');
INSERT INTO `cloud_area` VALUES ('532925', 532900, '弥渡县');
INSERT INTO `cloud_area` VALUES ('532926', 532900, '南涧彝族自治县');
INSERT INTO `cloud_area` VALUES ('532927', 532900, '巍山彝族回族自治县');
INSERT INTO `cloud_area` VALUES ('532928', 532900, '永平县');
INSERT INTO `cloud_area` VALUES ('532929', 532900, '云龙县');
INSERT INTO `cloud_area` VALUES ('532930', 532900, '洱源县');
INSERT INTO `cloud_area` VALUES ('532931', 532900, '剑川县');
INSERT INTO `cloud_area` VALUES ('532932', 532900, '鹤庆县');
INSERT INTO `cloud_area` VALUES ('533100', 530000, '德宏傣族景颇族自治州');
INSERT INTO `cloud_area` VALUES ('533102', 533100, '瑞丽市');
INSERT INTO `cloud_area` VALUES ('533103', 533100, '芒市');
INSERT INTO `cloud_area` VALUES ('533122', 533100, '梁河县');
INSERT INTO `cloud_area` VALUES ('533123', 533100, '盈江县');
INSERT INTO `cloud_area` VALUES ('533124', 533100, '陇川县');
INSERT INTO `cloud_area` VALUES ('533300', 530000, '怒江傈僳族自治州');
INSERT INTO `cloud_area` VALUES ('533321', 533300, '泸水县');
INSERT INTO `cloud_area` VALUES ('533323', 533300, '福贡县');
INSERT INTO `cloud_area` VALUES ('533324', 533300, '贡山独龙族怒族自治县');
INSERT INTO `cloud_area` VALUES ('533325', 533300, '兰坪白族普米族自治县');
INSERT INTO `cloud_area` VALUES ('533400', 530000, '迪庆藏族自治州');
INSERT INTO `cloud_area` VALUES ('533401', 533400, '香格里拉市');
INSERT INTO `cloud_area` VALUES ('533422', 533400, '德钦县');
INSERT INTO `cloud_area` VALUES ('533423', 533400, '维西傈僳族自治县');
INSERT INTO `cloud_area` VALUES ('540000', null, '西藏自治区');
INSERT INTO `cloud_area` VALUES ('540100', 540000, '拉萨市');
INSERT INTO `cloud_area` VALUES ('540101', 540100, '市辖区');
INSERT INTO `cloud_area` VALUES ('540102', 540100, '城关区');
INSERT INTO `cloud_area` VALUES ('540121', 540100, '林周县');
INSERT INTO `cloud_area` VALUES ('540122', 540100, '当雄县');
INSERT INTO `cloud_area` VALUES ('540123', 540100, '尼木县');
INSERT INTO `cloud_area` VALUES ('540124', 540100, '曲水县');
INSERT INTO `cloud_area` VALUES ('540125', 540100, '堆龙德庆县');
INSERT INTO `cloud_area` VALUES ('540126', 540100, '达孜县');
INSERT INTO `cloud_area` VALUES ('540127', 540100, '墨竹工卡县');
INSERT INTO `cloud_area` VALUES ('540200', 540000, '日喀则市');
INSERT INTO `cloud_area` VALUES ('540202', 540200, '桑珠孜区');
INSERT INTO `cloud_area` VALUES ('540221', 540200, '南木林县');
INSERT INTO `cloud_area` VALUES ('540222', 540200, '江孜县');
INSERT INTO `cloud_area` VALUES ('540223', 540200, '定日县');
INSERT INTO `cloud_area` VALUES ('540224', 540200, '萨迦县');
INSERT INTO `cloud_area` VALUES ('540225', 540200, '拉孜县');
INSERT INTO `cloud_area` VALUES ('540226', 540200, '昂仁县');
INSERT INTO `cloud_area` VALUES ('540227', 540200, '谢通门县');
INSERT INTO `cloud_area` VALUES ('540228', 540200, '白朗县');
INSERT INTO `cloud_area` VALUES ('540229', 540200, '仁布县');
INSERT INTO `cloud_area` VALUES ('540230', 540200, '康马县');
INSERT INTO `cloud_area` VALUES ('540231', 540200, '定结县');
INSERT INTO `cloud_area` VALUES ('540232', 540200, '仲巴县');
INSERT INTO `cloud_area` VALUES ('540233', 540200, '亚东县');
INSERT INTO `cloud_area` VALUES ('540234', 540200, '吉隆县');
INSERT INTO `cloud_area` VALUES ('540235', 540200, '聂拉木县');
INSERT INTO `cloud_area` VALUES ('540236', 540200, '萨嘎县');
INSERT INTO `cloud_area` VALUES ('540237', 540200, '岗巴县');
INSERT INTO `cloud_area` VALUES ('540300', 540000, '昌都市');
INSERT INTO `cloud_area` VALUES ('540302', 540300, '卡若区');
INSERT INTO `cloud_area` VALUES ('540321', 540300, '江达县');
INSERT INTO `cloud_area` VALUES ('540322', 540300, '贡觉县');
INSERT INTO `cloud_area` VALUES ('540323', 540300, '类乌齐县');
INSERT INTO `cloud_area` VALUES ('540324', 540300, '丁青县');
INSERT INTO `cloud_area` VALUES ('540325', 540300, '察雅县');
INSERT INTO `cloud_area` VALUES ('540326', 540300, '八宿县');
INSERT INTO `cloud_area` VALUES ('540327', 540300, '左贡县');
INSERT INTO `cloud_area` VALUES ('540328', 540300, '芒康县');
INSERT INTO `cloud_area` VALUES ('540329', 540300, '洛隆县');
INSERT INTO `cloud_area` VALUES ('540330', 540300, '边坝县');
INSERT INTO `cloud_area` VALUES ('540400', 540000, '林芝市');
INSERT INTO `cloud_area` VALUES ('540402', 540400, '巴宜区');
INSERT INTO `cloud_area` VALUES ('540421', 540400, '工布江达县');
INSERT INTO `cloud_area` VALUES ('540422', 540400, '米林县');
INSERT INTO `cloud_area` VALUES ('540423', 540400, '墨脱县');
INSERT INTO `cloud_area` VALUES ('540424', 540400, '波密县');
INSERT INTO `cloud_area` VALUES ('540425', 540400, '察隅县');
INSERT INTO `cloud_area` VALUES ('540426', 540400, '朗县');
INSERT INTO `cloud_area` VALUES ('542200', 540000, '山南地区');
INSERT INTO `cloud_area` VALUES ('542221', 542200, '乃东县');
INSERT INTO `cloud_area` VALUES ('542222', 542200, '扎囊县');
INSERT INTO `cloud_area` VALUES ('542223', 542200, '贡嘎县');
INSERT INTO `cloud_area` VALUES ('542224', 542200, '桑日县');
INSERT INTO `cloud_area` VALUES ('542225', 542200, '琼结县');
INSERT INTO `cloud_area` VALUES ('542226', 542200, '曲松县');
INSERT INTO `cloud_area` VALUES ('542227', 542200, '措美县');
INSERT INTO `cloud_area` VALUES ('542228', 542200, '洛扎县');
INSERT INTO `cloud_area` VALUES ('542229', 542200, '加查县');
INSERT INTO `cloud_area` VALUES ('542231', 542200, '隆子县');
INSERT INTO `cloud_area` VALUES ('542232', 542200, '错那县');
INSERT INTO `cloud_area` VALUES ('542233', 542200, '浪卡子县');
INSERT INTO `cloud_area` VALUES ('542400', 540000, '那曲地区');
INSERT INTO `cloud_area` VALUES ('542421', 542400, '那曲县');
INSERT INTO `cloud_area` VALUES ('542422', 542400, '嘉黎县');
INSERT INTO `cloud_area` VALUES ('542423', 542400, '比如县');
INSERT INTO `cloud_area` VALUES ('542424', 542400, '聂荣县');
INSERT INTO `cloud_area` VALUES ('542425', 542400, '安多县');
INSERT INTO `cloud_area` VALUES ('542426', 542400, '申扎县');
INSERT INTO `cloud_area` VALUES ('542427', 542400, '索县');
INSERT INTO `cloud_area` VALUES ('542428', 542400, '班戈县');
INSERT INTO `cloud_area` VALUES ('542429', 542400, '巴青县');
INSERT INTO `cloud_area` VALUES ('542430', 542400, '尼玛县');
INSERT INTO `cloud_area` VALUES ('542431', 542400, '双湖县');
INSERT INTO `cloud_area` VALUES ('542500', 540000, '阿里地区');
INSERT INTO `cloud_area` VALUES ('542521', 542500, '普兰县');
INSERT INTO `cloud_area` VALUES ('542522', 542500, '札达县');
INSERT INTO `cloud_area` VALUES ('542523', 542500, '噶尔县');
INSERT INTO `cloud_area` VALUES ('542524', 542500, '日土县');
INSERT INTO `cloud_area` VALUES ('542525', 542500, '革吉县');
INSERT INTO `cloud_area` VALUES ('542526', 542500, '改则县');
INSERT INTO `cloud_area` VALUES ('542527', 542500, '措勤县');
INSERT INTO `cloud_area` VALUES ('610000', null, '陕西省');
INSERT INTO `cloud_area` VALUES ('610100', 610000, '西安市');
INSERT INTO `cloud_area` VALUES ('610101', 610100, '市辖区');
INSERT INTO `cloud_area` VALUES ('610102', 610100, '新城区');
INSERT INTO `cloud_area` VALUES ('610103', 610100, '碑林区');
INSERT INTO `cloud_area` VALUES ('610104', 610100, '莲湖区');
INSERT INTO `cloud_area` VALUES ('610111', 610100, '灞桥区');
INSERT INTO `cloud_area` VALUES ('610112', 610100, '未央区');
INSERT INTO `cloud_area` VALUES ('610113', 610100, '雁塔区');
INSERT INTO `cloud_area` VALUES ('610114', 610100, '阎良区');
INSERT INTO `cloud_area` VALUES ('610115', 610100, '临潼区');
INSERT INTO `cloud_area` VALUES ('610116', 610100, '长安区');
INSERT INTO `cloud_area` VALUES ('610117', 610100, '高陵区');
INSERT INTO `cloud_area` VALUES ('610122', 610100, '蓝田县');
INSERT INTO `cloud_area` VALUES ('610124', 610100, '周至县');
INSERT INTO `cloud_area` VALUES ('610125', 610100, '户县');
INSERT INTO `cloud_area` VALUES ('610200', 610000, '铜川市');
INSERT INTO `cloud_area` VALUES ('610201', 610200, '市辖区');
INSERT INTO `cloud_area` VALUES ('610202', 610200, '王益区');
INSERT INTO `cloud_area` VALUES ('610203', 610200, '印台区');
INSERT INTO `cloud_area` VALUES ('610204', 610200, '耀州区');
INSERT INTO `cloud_area` VALUES ('610222', 610200, '宜君县');
INSERT INTO `cloud_area` VALUES ('610300', 610000, '宝鸡市');
INSERT INTO `cloud_area` VALUES ('610301', 610300, '市辖区');
INSERT INTO `cloud_area` VALUES ('610302', 610300, '渭滨区');
INSERT INTO `cloud_area` VALUES ('610303', 610300, '金台区');
INSERT INTO `cloud_area` VALUES ('610304', 610300, '陈仓区');
INSERT INTO `cloud_area` VALUES ('610322', 610300, '凤翔县');
INSERT INTO `cloud_area` VALUES ('610323', 610300, '岐山县');
INSERT INTO `cloud_area` VALUES ('610324', 610300, '扶风县');
INSERT INTO `cloud_area` VALUES ('610326', 610300, '眉县');
INSERT INTO `cloud_area` VALUES ('610327', 610300, '陇县');
INSERT INTO `cloud_area` VALUES ('610328', 610300, '千阳县');
INSERT INTO `cloud_area` VALUES ('610329', 610300, '麟游县');
INSERT INTO `cloud_area` VALUES ('610330', 610300, '凤县');
INSERT INTO `cloud_area` VALUES ('610331', 610300, '太白县');
INSERT INTO `cloud_area` VALUES ('610400', 610000, '咸阳市');
INSERT INTO `cloud_area` VALUES ('610401', 610400, '市辖区');
INSERT INTO `cloud_area` VALUES ('610402', 610400, '秦都区');
INSERT INTO `cloud_area` VALUES ('610403', 610400, '杨陵区');
INSERT INTO `cloud_area` VALUES ('610404', 610400, '渭城区');
INSERT INTO `cloud_area` VALUES ('610422', 610400, '三原县');
INSERT INTO `cloud_area` VALUES ('610423', 610400, '泾阳县');
INSERT INTO `cloud_area` VALUES ('610424', 610400, '乾县');
INSERT INTO `cloud_area` VALUES ('610425', 610400, '礼泉县');
INSERT INTO `cloud_area` VALUES ('610426', 610400, '永寿县');
INSERT INTO `cloud_area` VALUES ('610427', 610400, '彬县');
INSERT INTO `cloud_area` VALUES ('610428', 610400, '长武县');
INSERT INTO `cloud_area` VALUES ('610429', 610400, '旬邑县');
INSERT INTO `cloud_area` VALUES ('610430', 610400, '淳化县');
INSERT INTO `cloud_area` VALUES ('610431', 610400, '武功县');
INSERT INTO `cloud_area` VALUES ('610481', 610400, '兴平市');
INSERT INTO `cloud_area` VALUES ('610500', 610000, '渭南市');
INSERT INTO `cloud_area` VALUES ('610501', 610500, '市辖区');
INSERT INTO `cloud_area` VALUES ('610502', 610500, '临渭区');
INSERT INTO `cloud_area` VALUES ('610521', 610500, '华县');
INSERT INTO `cloud_area` VALUES ('610522', 610500, '潼关县');
INSERT INTO `cloud_area` VALUES ('610523', 610500, '大荔县');
INSERT INTO `cloud_area` VALUES ('610524', 610500, '合阳县');
INSERT INTO `cloud_area` VALUES ('610525', 610500, '澄城县');
INSERT INTO `cloud_area` VALUES ('610526', 610500, '蒲城县');
INSERT INTO `cloud_area` VALUES ('610527', 610500, '白水县');
INSERT INTO `cloud_area` VALUES ('610528', 610500, '富平县');
INSERT INTO `cloud_area` VALUES ('610581', 610500, '韩城市');
INSERT INTO `cloud_area` VALUES ('610582', 610500, '华阴市');
INSERT INTO `cloud_area` VALUES ('610600', 610000, '延安市');
INSERT INTO `cloud_area` VALUES ('610601', 610600, '市辖区');
INSERT INTO `cloud_area` VALUES ('610602', 610600, '宝塔区');
INSERT INTO `cloud_area` VALUES ('610621', 610600, '延长县');
INSERT INTO `cloud_area` VALUES ('610622', 610600, '延川县');
INSERT INTO `cloud_area` VALUES ('610623', 610600, '子长县');
INSERT INTO `cloud_area` VALUES ('610624', 610600, '安塞县');
INSERT INTO `cloud_area` VALUES ('610625', 610600, '志丹县');
INSERT INTO `cloud_area` VALUES ('610626', 610600, '吴起县');
INSERT INTO `cloud_area` VALUES ('610627', 610600, '甘泉县');
INSERT INTO `cloud_area` VALUES ('610628', 610600, '富县');
INSERT INTO `cloud_area` VALUES ('610629', 610600, '洛川县');
INSERT INTO `cloud_area` VALUES ('610630', 610600, '宜川县');
INSERT INTO `cloud_area` VALUES ('610631', 610600, '黄龙县');
INSERT INTO `cloud_area` VALUES ('610632', 610600, '黄陵县');
INSERT INTO `cloud_area` VALUES ('610700', 610000, '汉中市');
INSERT INTO `cloud_area` VALUES ('610701', 610700, '市辖区');
INSERT INTO `cloud_area` VALUES ('610702', 610700, '汉台区');
INSERT INTO `cloud_area` VALUES ('610721', 610700, '南郑县');
INSERT INTO `cloud_area` VALUES ('610722', 610700, '城固县');
INSERT INTO `cloud_area` VALUES ('610723', 610700, '洋县');
INSERT INTO `cloud_area` VALUES ('610724', 610700, '西乡县');
INSERT INTO `cloud_area` VALUES ('610725', 610700, '勉县');
INSERT INTO `cloud_area` VALUES ('610726', 610700, '宁强县');
INSERT INTO `cloud_area` VALUES ('610727', 610700, '略阳县');
INSERT INTO `cloud_area` VALUES ('610728', 610700, '镇巴县');
INSERT INTO `cloud_area` VALUES ('610729', 610700, '留坝县');
INSERT INTO `cloud_area` VALUES ('610730', 610700, '佛坪县');
INSERT INTO `cloud_area` VALUES ('610800', 610000, '榆林市');
INSERT INTO `cloud_area` VALUES ('610801', 610800, '市辖区');
INSERT INTO `cloud_area` VALUES ('610802', 610800, '榆阳区');
INSERT INTO `cloud_area` VALUES ('610821', 610800, '神木县');
INSERT INTO `cloud_area` VALUES ('610822', 610800, '府谷县');
INSERT INTO `cloud_area` VALUES ('610823', 610800, '横山县');
INSERT INTO `cloud_area` VALUES ('610824', 610800, '靖边县');
INSERT INTO `cloud_area` VALUES ('610825', 610800, '定边县');
INSERT INTO `cloud_area` VALUES ('610826', 610800, '绥德县');
INSERT INTO `cloud_area` VALUES ('610827', 610800, '米脂县');
INSERT INTO `cloud_area` VALUES ('610828', 610800, '佳县');
INSERT INTO `cloud_area` VALUES ('610829', 610800, '吴堡县');
INSERT INTO `cloud_area` VALUES ('610830', 610800, '清涧县');
INSERT INTO `cloud_area` VALUES ('610831', 610800, '子洲县');
INSERT INTO `cloud_area` VALUES ('610900', 610000, '安康市');
INSERT INTO `cloud_area` VALUES ('610901', 610900, '市辖区');
INSERT INTO `cloud_area` VALUES ('610902', 610900, '汉滨区');
INSERT INTO `cloud_area` VALUES ('610921', 610900, '汉阴县');
INSERT INTO `cloud_area` VALUES ('610922', 610900, '石泉县');
INSERT INTO `cloud_area` VALUES ('610923', 610900, '宁陕县');
INSERT INTO `cloud_area` VALUES ('610924', 610900, '紫阳县');
INSERT INTO `cloud_area` VALUES ('610925', 610900, '岚皋县');
INSERT INTO `cloud_area` VALUES ('610926', 610900, '平利县');
INSERT INTO `cloud_area` VALUES ('610927', 610900, '镇坪县');
INSERT INTO `cloud_area` VALUES ('610928', 610900, '旬阳县');
INSERT INTO `cloud_area` VALUES ('610929', 610900, '白河县');
INSERT INTO `cloud_area` VALUES ('611000', 610000, '商洛市');
INSERT INTO `cloud_area` VALUES ('611001', 611000, '市辖区');
INSERT INTO `cloud_area` VALUES ('611002', 611000, '商州区');
INSERT INTO `cloud_area` VALUES ('611021', 611000, '洛南县');
INSERT INTO `cloud_area` VALUES ('611022', 611000, '丹凤县');
INSERT INTO `cloud_area` VALUES ('611023', 611000, '商南县');
INSERT INTO `cloud_area` VALUES ('611024', 611000, '山阳县');
INSERT INTO `cloud_area` VALUES ('611025', 611000, '镇安县');
INSERT INTO `cloud_area` VALUES ('611026', 611000, '柞水县');
INSERT INTO `cloud_area` VALUES ('620000', null, '甘肃省');
INSERT INTO `cloud_area` VALUES ('620100', 620000, '兰州市');
INSERT INTO `cloud_area` VALUES ('620101', 620100, '市辖区');
INSERT INTO `cloud_area` VALUES ('620102', 620100, '城关区');
INSERT INTO `cloud_area` VALUES ('620103', 620100, '七里河区');
INSERT INTO `cloud_area` VALUES ('620104', 620100, '西固区');
INSERT INTO `cloud_area` VALUES ('620105', 620100, '安宁区');
INSERT INTO `cloud_area` VALUES ('620111', 620100, '红古区');
INSERT INTO `cloud_area` VALUES ('620121', 620100, '永登县');
INSERT INTO `cloud_area` VALUES ('620122', 620100, '皋兰县');
INSERT INTO `cloud_area` VALUES ('620123', 620100, '榆中县');
INSERT INTO `cloud_area` VALUES ('620200', 620000, '嘉峪关市');
INSERT INTO `cloud_area` VALUES ('620201', 620200, '市辖区');
INSERT INTO `cloud_area` VALUES ('620300', 620000, '金昌市');
INSERT INTO `cloud_area` VALUES ('620301', 620300, '市辖区');
INSERT INTO `cloud_area` VALUES ('620302', 620300, '金川区');
INSERT INTO `cloud_area` VALUES ('620321', 620300, '永昌县');
INSERT INTO `cloud_area` VALUES ('620400', 620000, '白银市');
INSERT INTO `cloud_area` VALUES ('620401', 620400, '市辖区');
INSERT INTO `cloud_area` VALUES ('620402', 620400, '白银区');
INSERT INTO `cloud_area` VALUES ('620403', 620400, '平川区');
INSERT INTO `cloud_area` VALUES ('620421', 620400, '靖远县');
INSERT INTO `cloud_area` VALUES ('620422', 620400, '会宁县');
INSERT INTO `cloud_area` VALUES ('620423', 620400, '景泰县');
INSERT INTO `cloud_area` VALUES ('620500', 620000, '天水市');
INSERT INTO `cloud_area` VALUES ('620501', 620500, '市辖区');
INSERT INTO `cloud_area` VALUES ('620502', 620500, '秦州区');
INSERT INTO `cloud_area` VALUES ('620503', 620500, '麦积区');
INSERT INTO `cloud_area` VALUES ('620521', 620500, '清水县');
INSERT INTO `cloud_area` VALUES ('620522', 620500, '秦安县');
INSERT INTO `cloud_area` VALUES ('620523', 620500, '甘谷县');
INSERT INTO `cloud_area` VALUES ('620524', 620500, '武山县');
INSERT INTO `cloud_area` VALUES ('620525', 620500, '张家川回族自治县');
INSERT INTO `cloud_area` VALUES ('620600', 620000, '武威市');
INSERT INTO `cloud_area` VALUES ('620601', 620600, '市辖区');
INSERT INTO `cloud_area` VALUES ('620602', 620600, '凉州区');
INSERT INTO `cloud_area` VALUES ('620621', 620600, '民勤县');
INSERT INTO `cloud_area` VALUES ('620622', 620600, '古浪县');
INSERT INTO `cloud_area` VALUES ('620623', 620600, '天祝藏族自治县');
INSERT INTO `cloud_area` VALUES ('620700', 620000, '张掖市');
INSERT INTO `cloud_area` VALUES ('620701', 620700, '市辖区');
INSERT INTO `cloud_area` VALUES ('620702', 620700, '甘州区');
INSERT INTO `cloud_area` VALUES ('620721', 620700, '肃南裕固族自治县');
INSERT INTO `cloud_area` VALUES ('620722', 620700, '民乐县');
INSERT INTO `cloud_area` VALUES ('620723', 620700, '临泽县');
INSERT INTO `cloud_area` VALUES ('620724', 620700, '高台县');
INSERT INTO `cloud_area` VALUES ('620725', 620700, '山丹县');
INSERT INTO `cloud_area` VALUES ('620800', 620000, '平凉市');
INSERT INTO `cloud_area` VALUES ('620801', 620800, '市辖区');
INSERT INTO `cloud_area` VALUES ('620802', 620800, '崆峒区');
INSERT INTO `cloud_area` VALUES ('620821', 620800, '泾川县');
INSERT INTO `cloud_area` VALUES ('620822', 620800, '灵台县');
INSERT INTO `cloud_area` VALUES ('620823', 620800, '崇信县');
INSERT INTO `cloud_area` VALUES ('620824', 620800, '华亭县');
INSERT INTO `cloud_area` VALUES ('620825', 620800, '庄浪县');
INSERT INTO `cloud_area` VALUES ('620826', 620800, '静宁县');
INSERT INTO `cloud_area` VALUES ('620900', 620000, '酒泉市');
INSERT INTO `cloud_area` VALUES ('620901', 620900, '市辖区');
INSERT INTO `cloud_area` VALUES ('620902', 620900, '肃州区');
INSERT INTO `cloud_area` VALUES ('620921', 620900, '金塔县');
INSERT INTO `cloud_area` VALUES ('620922', 620900, '瓜州县');
INSERT INTO `cloud_area` VALUES ('620923', 620900, '肃北蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('620924', 620900, '阿克塞哈萨克族自治县');
INSERT INTO `cloud_area` VALUES ('620981', 620900, '玉门市');
INSERT INTO `cloud_area` VALUES ('620982', 620900, '敦煌市');
INSERT INTO `cloud_area` VALUES ('621000', 620000, '庆阳市');
INSERT INTO `cloud_area` VALUES ('621001', 621000, '市辖区');
INSERT INTO `cloud_area` VALUES ('621002', 621000, '西峰区');
INSERT INTO `cloud_area` VALUES ('621021', 621000, '庆城县');
INSERT INTO `cloud_area` VALUES ('621022', 621000, '环县');
INSERT INTO `cloud_area` VALUES ('621023', 621000, '华池县');
INSERT INTO `cloud_area` VALUES ('621024', 621000, '合水县');
INSERT INTO `cloud_area` VALUES ('621025', 621000, '正宁县');
INSERT INTO `cloud_area` VALUES ('621026', 621000, '宁县');
INSERT INTO `cloud_area` VALUES ('621027', 621000, '镇原县');
INSERT INTO `cloud_area` VALUES ('621100', 620000, '定西市');
INSERT INTO `cloud_area` VALUES ('621101', 621100, '市辖区');
INSERT INTO `cloud_area` VALUES ('621102', 621100, '安定区');
INSERT INTO `cloud_area` VALUES ('621121', 621100, '通渭县');
INSERT INTO `cloud_area` VALUES ('621122', 621100, '陇西县');
INSERT INTO `cloud_area` VALUES ('621123', 621100, '渭源县');
INSERT INTO `cloud_area` VALUES ('621124', 621100, '临洮县');
INSERT INTO `cloud_area` VALUES ('621125', 621100, '漳县');
INSERT INTO `cloud_area` VALUES ('621126', 621100, '岷县');
INSERT INTO `cloud_area` VALUES ('621200', 620000, '陇南市');
INSERT INTO `cloud_area` VALUES ('621201', 621200, '市辖区');
INSERT INTO `cloud_area` VALUES ('621202', 621200, '武都区');
INSERT INTO `cloud_area` VALUES ('621221', 621200, '成县');
INSERT INTO `cloud_area` VALUES ('621222', 621200, '文县');
INSERT INTO `cloud_area` VALUES ('621223', 621200, '宕昌县');
INSERT INTO `cloud_area` VALUES ('621224', 621200, '康县');
INSERT INTO `cloud_area` VALUES ('621225', 621200, '西和县');
INSERT INTO `cloud_area` VALUES ('621226', 621200, '礼县');
INSERT INTO `cloud_area` VALUES ('621227', 621200, '徽县');
INSERT INTO `cloud_area` VALUES ('621228', 621200, '两当县');
INSERT INTO `cloud_area` VALUES ('622900', 620000, '临夏回族自治州');
INSERT INTO `cloud_area` VALUES ('622901', 622900, '临夏市');
INSERT INTO `cloud_area` VALUES ('622921', 622900, '临夏县');
INSERT INTO `cloud_area` VALUES ('622922', 622900, '康乐县');
INSERT INTO `cloud_area` VALUES ('622923', 622900, '永靖县');
INSERT INTO `cloud_area` VALUES ('622924', 622900, '广河县');
INSERT INTO `cloud_area` VALUES ('622925', 622900, '和政县');
INSERT INTO `cloud_area` VALUES ('622926', 622900, '东乡族自治县');
INSERT INTO `cloud_area` VALUES ('622927', 622900, '积石山保安族东乡族撒拉族自治县');
INSERT INTO `cloud_area` VALUES ('623000', 620000, '甘南藏族自治州');
INSERT INTO `cloud_area` VALUES ('623001', 623000, '合作市');
INSERT INTO `cloud_area` VALUES ('623021', 623000, '临潭县');
INSERT INTO `cloud_area` VALUES ('623022', 623000, '卓尼县');
INSERT INTO `cloud_area` VALUES ('623023', 623000, '舟曲县');
INSERT INTO `cloud_area` VALUES ('623024', 623000, '迭部县');
INSERT INTO `cloud_area` VALUES ('623025', 623000, '玛曲县');
INSERT INTO `cloud_area` VALUES ('623026', 623000, '碌曲县');
INSERT INTO `cloud_area` VALUES ('623027', 623000, '夏河县');
INSERT INTO `cloud_area` VALUES ('630000', null, '青海省');
INSERT INTO `cloud_area` VALUES ('630100', 630000, '西宁市');
INSERT INTO `cloud_area` VALUES ('630101', 630100, '市辖区');
INSERT INTO `cloud_area` VALUES ('630102', 630100, '城东区');
INSERT INTO `cloud_area` VALUES ('630103', 630100, '城中区');
INSERT INTO `cloud_area` VALUES ('630104', 630100, '城西区');
INSERT INTO `cloud_area` VALUES ('630105', 630100, '城北区');
INSERT INTO `cloud_area` VALUES ('630121', 630100, '大通回族土族自治县');
INSERT INTO `cloud_area` VALUES ('630122', 630100, '湟中县');
INSERT INTO `cloud_area` VALUES ('630123', 630100, '湟源县');
INSERT INTO `cloud_area` VALUES ('630200', 630000, '海东市');
INSERT INTO `cloud_area` VALUES ('630202', 630200, '乐都区');
INSERT INTO `cloud_area` VALUES ('630203', 630200, '平安区');
INSERT INTO `cloud_area` VALUES ('630222', 630200, '民和回族土族自治县');
INSERT INTO `cloud_area` VALUES ('630223', 630200, '互助土族自治县');
INSERT INTO `cloud_area` VALUES ('630224', 630200, '化隆回族自治县');
INSERT INTO `cloud_area` VALUES ('630225', 630200, '循化撒拉族自治县');
INSERT INTO `cloud_area` VALUES ('632200', 630000, '海北藏族自治州');
INSERT INTO `cloud_area` VALUES ('632221', 632200, '门源回族自治县');
INSERT INTO `cloud_area` VALUES ('632222', 632200, '祁连县');
INSERT INTO `cloud_area` VALUES ('632223', 632200, '海晏县');
INSERT INTO `cloud_area` VALUES ('632224', 632200, '刚察县');
INSERT INTO `cloud_area` VALUES ('632300', 630000, '黄南藏族自治州');
INSERT INTO `cloud_area` VALUES ('632321', 632300, '同仁县');
INSERT INTO `cloud_area` VALUES ('632322', 632300, '尖扎县');
INSERT INTO `cloud_area` VALUES ('632323', 632300, '泽库县');
INSERT INTO `cloud_area` VALUES ('632324', 632300, '河南蒙古族自治县');
INSERT INTO `cloud_area` VALUES ('632500', 630000, '海南藏族自治州');
INSERT INTO `cloud_area` VALUES ('632521', 632500, '共和县');
INSERT INTO `cloud_area` VALUES ('632522', 632500, '同德县');
INSERT INTO `cloud_area` VALUES ('632523', 632500, '贵德县');
INSERT INTO `cloud_area` VALUES ('632524', 632500, '兴海县');
INSERT INTO `cloud_area` VALUES ('632525', 632500, '贵南县');
INSERT INTO `cloud_area` VALUES ('632600', 630000, '果洛藏族自治州');
INSERT INTO `cloud_area` VALUES ('632621', 632600, '玛沁县');
INSERT INTO `cloud_area` VALUES ('632622', 632600, '班玛县');
INSERT INTO `cloud_area` VALUES ('632623', 632600, '甘德县');
INSERT INTO `cloud_area` VALUES ('632624', 632600, '达日县');
INSERT INTO `cloud_area` VALUES ('632625', 632600, '久治县');
INSERT INTO `cloud_area` VALUES ('632626', 632600, '玛多县');
INSERT INTO `cloud_area` VALUES ('632700', 630000, '玉树藏族自治州');
INSERT INTO `cloud_area` VALUES ('632701', 632700, '玉树市');
INSERT INTO `cloud_area` VALUES ('632722', 632700, '杂多县');
INSERT INTO `cloud_area` VALUES ('632723', 632700, '称多县');
INSERT INTO `cloud_area` VALUES ('632724', 632700, '治多县');
INSERT INTO `cloud_area` VALUES ('632725', 632700, '囊谦县');
INSERT INTO `cloud_area` VALUES ('632726', 632700, '曲麻莱县');
INSERT INTO `cloud_area` VALUES ('632800', 630000, '海西蒙古族藏族自治州');
INSERT INTO `cloud_area` VALUES ('632801', 632800, '格尔木市');
INSERT INTO `cloud_area` VALUES ('632802', 632800, '德令哈市');
INSERT INTO `cloud_area` VALUES ('632821', 632800, '乌兰县');
INSERT INTO `cloud_area` VALUES ('632822', 632800, '都兰县');
INSERT INTO `cloud_area` VALUES ('632823', 632800, '天峻县');
INSERT INTO `cloud_area` VALUES ('640000', null, '宁夏回族自治区');
INSERT INTO `cloud_area` VALUES ('640100', 640000, '银川市');
INSERT INTO `cloud_area` VALUES ('640101', 640100, '市辖区');
INSERT INTO `cloud_area` VALUES ('640104', 640100, '兴庆区');
INSERT INTO `cloud_area` VALUES ('640105', 640100, '西夏区');
INSERT INTO `cloud_area` VALUES ('640106', 640100, '金凤区');
INSERT INTO `cloud_area` VALUES ('640121', 640100, '永宁县');
INSERT INTO `cloud_area` VALUES ('640122', 640100, '贺兰县');
INSERT INTO `cloud_area` VALUES ('640181', 640100, '灵武市');
INSERT INTO `cloud_area` VALUES ('640200', 640000, '石嘴山市');
INSERT INTO `cloud_area` VALUES ('640201', 640200, '市辖区');
INSERT INTO `cloud_area` VALUES ('640202', 640200, '大武口区');
INSERT INTO `cloud_area` VALUES ('640205', 640200, '惠农区');
INSERT INTO `cloud_area` VALUES ('640221', 640200, '平罗县');
INSERT INTO `cloud_area` VALUES ('640300', 640000, '吴忠市');
INSERT INTO `cloud_area` VALUES ('640301', 640300, '市辖区');
INSERT INTO `cloud_area` VALUES ('640302', 640300, '利通区');
INSERT INTO `cloud_area` VALUES ('640303', 640300, '红寺堡区');
INSERT INTO `cloud_area` VALUES ('640323', 640300, '盐池县');
INSERT INTO `cloud_area` VALUES ('640324', 640300, '同心县');
INSERT INTO `cloud_area` VALUES ('640381', 640300, '青铜峡市');
INSERT INTO `cloud_area` VALUES ('640400', 640000, '固原市');
INSERT INTO `cloud_area` VALUES ('640401', 640400, '市辖区');
INSERT INTO `cloud_area` VALUES ('640402', 640400, '原州区');
INSERT INTO `cloud_area` VALUES ('640422', 640400, '西吉县');
INSERT INTO `cloud_area` VALUES ('640423', 640400, '隆德县');
INSERT INTO `cloud_area` VALUES ('640424', 640400, '泾源县');
INSERT INTO `cloud_area` VALUES ('640425', 640400, '彭阳县');
INSERT INTO `cloud_area` VALUES ('640500', 640000, '中卫市');
INSERT INTO `cloud_area` VALUES ('640501', 640500, '市辖区');
INSERT INTO `cloud_area` VALUES ('640502', 640500, '沙坡头区');
INSERT INTO `cloud_area` VALUES ('640521', 640500, '中宁县');
INSERT INTO `cloud_area` VALUES ('640522', 640500, '海原县');
INSERT INTO `cloud_area` VALUES ('650000', null, '新疆维吾尔自治区');
INSERT INTO `cloud_area` VALUES ('650100', 650000, '乌鲁木齐市');
INSERT INTO `cloud_area` VALUES ('650101', 650100, '市辖区');
INSERT INTO `cloud_area` VALUES ('650102', 650100, '天山区');
INSERT INTO `cloud_area` VALUES ('650103', 650100, '沙依巴克区');
INSERT INTO `cloud_area` VALUES ('650104', 650100, '新市区');
INSERT INTO `cloud_area` VALUES ('650105', 650100, '水磨沟区');
INSERT INTO `cloud_area` VALUES ('650106', 650100, '头屯河区');
INSERT INTO `cloud_area` VALUES ('650107', 650100, '达坂城区');
INSERT INTO `cloud_area` VALUES ('650109', 650100, '米东区');
INSERT INTO `cloud_area` VALUES ('650121', 650100, '乌鲁木齐县');
INSERT INTO `cloud_area` VALUES ('650200', 650000, '克拉玛依市');
INSERT INTO `cloud_area` VALUES ('650201', 650200, '市辖区');
INSERT INTO `cloud_area` VALUES ('650202', 650200, '独山子区');
INSERT INTO `cloud_area` VALUES ('650203', 650200, '克拉玛依区');
INSERT INTO `cloud_area` VALUES ('650204', 650200, '白碱滩区');
INSERT INTO `cloud_area` VALUES ('650205', 650200, '乌尔禾区');
INSERT INTO `cloud_area` VALUES ('650400', 650000, '吐鲁番市');
INSERT INTO `cloud_area` VALUES ('650402', 650400, '高昌区');
INSERT INTO `cloud_area` VALUES ('650421', 650400, '鄯善县');
INSERT INTO `cloud_area` VALUES ('650422', 650400, '托克逊县');
INSERT INTO `cloud_area` VALUES ('652200', 650000, '哈密地区');
INSERT INTO `cloud_area` VALUES ('652201', 652200, '哈密市');
INSERT INTO `cloud_area` VALUES ('652222', 652200, '巴里坤哈萨克自治县');
INSERT INTO `cloud_area` VALUES ('652223', 652200, '伊吾县');
INSERT INTO `cloud_area` VALUES ('652300', 650000, '昌吉回族自治州');
INSERT INTO `cloud_area` VALUES ('652301', 652300, '昌吉市');
INSERT INTO `cloud_area` VALUES ('652302', 652300, '阜康市');
INSERT INTO `cloud_area` VALUES ('652323', 652300, '呼图壁县');
INSERT INTO `cloud_area` VALUES ('652324', 652300, '玛纳斯县');
INSERT INTO `cloud_area` VALUES ('652325', 652300, '奇台县');
INSERT INTO `cloud_area` VALUES ('652327', 652300, '吉木萨尔县');
INSERT INTO `cloud_area` VALUES ('652328', 652300, '木垒哈萨克自治县');
INSERT INTO `cloud_area` VALUES ('652700', 650000, '博尔塔拉蒙古自治州');
INSERT INTO `cloud_area` VALUES ('652701', 652700, '博乐市');
INSERT INTO `cloud_area` VALUES ('652702', 652700, '阿拉山口市');
INSERT INTO `cloud_area` VALUES ('652722', 652700, '精河县');
INSERT INTO `cloud_area` VALUES ('652723', 652700, '温泉县');
INSERT INTO `cloud_area` VALUES ('652800', 650000, '巴音郭楞蒙古自治州');
INSERT INTO `cloud_area` VALUES ('652801', 652800, '库尔勒市');
INSERT INTO `cloud_area` VALUES ('652822', 652800, '轮台县');
INSERT INTO `cloud_area` VALUES ('652823', 652800, '尉犁县');
INSERT INTO `cloud_area` VALUES ('652824', 652800, '若羌县');
INSERT INTO `cloud_area` VALUES ('652825', 652800, '且末县');
INSERT INTO `cloud_area` VALUES ('652826', 652800, '焉耆回族自治县');
INSERT INTO `cloud_area` VALUES ('652827', 652800, '和静县');
INSERT INTO `cloud_area` VALUES ('652828', 652800, '和硕县');
INSERT INTO `cloud_area` VALUES ('652829', 652800, '博湖县');
INSERT INTO `cloud_area` VALUES ('652900', 650000, '阿克苏地区');
INSERT INTO `cloud_area` VALUES ('652901', 652900, '阿克苏市');
INSERT INTO `cloud_area` VALUES ('652922', 652900, '温宿县');
INSERT INTO `cloud_area` VALUES ('652923', 652900, '库车县');
INSERT INTO `cloud_area` VALUES ('652924', 652900, '沙雅县');
INSERT INTO `cloud_area` VALUES ('652925', 652900, '新和县');
INSERT INTO `cloud_area` VALUES ('652926', 652900, '拜城县');
INSERT INTO `cloud_area` VALUES ('652927', 652900, '乌什县');
INSERT INTO `cloud_area` VALUES ('652928', 652900, '阿瓦提县');
INSERT INTO `cloud_area` VALUES ('652929', 652900, '柯坪县');
INSERT INTO `cloud_area` VALUES ('653000', 650000, '克孜勒苏柯尔克孜自治州');
INSERT INTO `cloud_area` VALUES ('653001', 653000, '阿图什市');
INSERT INTO `cloud_area` VALUES ('653022', 653000, '阿克陶县');
INSERT INTO `cloud_area` VALUES ('653023', 653000, '阿合奇县');
INSERT INTO `cloud_area` VALUES ('653024', 653000, '乌恰县');
INSERT INTO `cloud_area` VALUES ('653100', 650000, '喀什地区');
INSERT INTO `cloud_area` VALUES ('653101', 653100, '喀什市');
INSERT INTO `cloud_area` VALUES ('653121', 653100, '疏附县');
INSERT INTO `cloud_area` VALUES ('653122', 653100, '疏勒县');
INSERT INTO `cloud_area` VALUES ('653123', 653100, '英吉沙县');
INSERT INTO `cloud_area` VALUES ('653124', 653100, '泽普县');
INSERT INTO `cloud_area` VALUES ('653125', 653100, '莎车县');
INSERT INTO `cloud_area` VALUES ('653126', 653100, '叶城县');
INSERT INTO `cloud_area` VALUES ('653127', 653100, '麦盖提县');
INSERT INTO `cloud_area` VALUES ('653128', 653100, '岳普湖县');
INSERT INTO `cloud_area` VALUES ('653129', 653100, '伽师县');
INSERT INTO `cloud_area` VALUES ('653130', 653100, '巴楚县');
INSERT INTO `cloud_area` VALUES ('653131', 653100, '塔什库尔干塔吉克自治县');
INSERT INTO `cloud_area` VALUES ('653200', 650000, '和田地区');
INSERT INTO `cloud_area` VALUES ('653201', 653200, '和田市');
INSERT INTO `cloud_area` VALUES ('653221', 653200, '和田县');
INSERT INTO `cloud_area` VALUES ('653222', 653200, '墨玉县');
INSERT INTO `cloud_area` VALUES ('653223', 653200, '皮山县');
INSERT INTO `cloud_area` VALUES ('653224', 653200, '洛浦县');
INSERT INTO `cloud_area` VALUES ('653225', 653200, '策勒县');
INSERT INTO `cloud_area` VALUES ('653226', 653200, '于田县');
INSERT INTO `cloud_area` VALUES ('653227', 653200, '民丰县');
INSERT INTO `cloud_area` VALUES ('654000', 650000, '伊犁哈萨克自治州');
INSERT INTO `cloud_area` VALUES ('654002', 654000, '伊宁市');
INSERT INTO `cloud_area` VALUES ('654003', 654000, '奎屯市');
INSERT INTO `cloud_area` VALUES ('654004', 654000, '霍尔果斯市');
INSERT INTO `cloud_area` VALUES ('654021', 654000, '伊宁县');
INSERT INTO `cloud_area` VALUES ('654022', 654000, '察布查尔锡伯自治县');
INSERT INTO `cloud_area` VALUES ('654023', 654000, '霍城县');
INSERT INTO `cloud_area` VALUES ('654024', 654000, '巩留县');
INSERT INTO `cloud_area` VALUES ('654025', 654000, '新源县');
INSERT INTO `cloud_area` VALUES ('654026', 654000, '昭苏县');
INSERT INTO `cloud_area` VALUES ('654027', 654000, '特克斯县');
INSERT INTO `cloud_area` VALUES ('654028', 654000, '尼勒克县');
INSERT INTO `cloud_area` VALUES ('654200', 650000, '塔城地区');
INSERT INTO `cloud_area` VALUES ('654201', 654200, '塔城市');
INSERT INTO `cloud_area` VALUES ('654202', 654200, '乌苏市');
INSERT INTO `cloud_area` VALUES ('654221', 654200, '额敏县');
INSERT INTO `cloud_area` VALUES ('654223', 654200, '沙湾县');
INSERT INTO `cloud_area` VALUES ('654224', 654200, '托里县');
INSERT INTO `cloud_area` VALUES ('654225', 654200, '裕民县');
INSERT INTO `cloud_area` VALUES ('654226', 654200, '和布克赛尔蒙古自治县');
INSERT INTO `cloud_area` VALUES ('654300', 650000, '阿勒泰地区');
INSERT INTO `cloud_area` VALUES ('654301', 654300, '阿勒泰市');
INSERT INTO `cloud_area` VALUES ('654321', 654300, '布尔津县');
INSERT INTO `cloud_area` VALUES ('654322', 654300, '富蕴县');
INSERT INTO `cloud_area` VALUES ('654323', 654300, '福海县');
INSERT INTO `cloud_area` VALUES ('654324', 654300, '哈巴河县');
INSERT INTO `cloud_area` VALUES ('654325', 654300, '青河县');
INSERT INTO `cloud_area` VALUES ('654326', 654300, '吉木乃县');
INSERT INTO `cloud_area` VALUES ('659000', 650000, '自治区直辖县级行政区划');
INSERT INTO `cloud_area` VALUES ('659001', 659000, '石河子市');
INSERT INTO `cloud_area` VALUES ('659002', 659000, '阿拉尔市');
INSERT INTO `cloud_area` VALUES ('659003', 659000, '图木舒克市');
INSERT INTO `cloud_area` VALUES ('659004', 659000, '五家渠市');
INSERT INTO `cloud_area` VALUES ('710000', null, '台湾省');
INSERT INTO `cloud_area` VALUES ('810000', null, '香港特别行政区');
INSERT INTO `cloud_area` VALUES ('820000', null, '澳门特别行政区');

-- updateSQL20170104-备案中心-ECSC备案中心新增权限.sql
-- 新增备案中心部分权限开始---------------------------
-- 新增一级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'备案中心','','',
		270000,
		'',
		'备案中心',
		''
);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'开始备案','','',
		271000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '备案中心' AND ss.parent_id = ''),
		'开始备案',''
	);
-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'新增备案',
		NULL,
		'record_add_new',
		271010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'新增备案',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'已备案列表',
		NULL,
		'record_list',
		271011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'已备案列表',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'新增接入',
		NULL,
		'record_add_access',
		271012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'新增接入',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'新增网站',
		NULL,
		'record_add_web',
		271013,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'新增网站',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'变更备案',
		NULL,
		'record_update_web',
		271014,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'变更备案',
		NULL
	);


-- 增加权限-角色关系
INSERT INTO sys_selfrolepower (
	rp_id,
	role_id,
	power_id,
	rp_state
)(
	SELECT
		REPLACE (uuid(), '-', '') AS rp_id,
		r.role_id AS role_id,
		p.power_id AS power_id,
		'1' AS rp_state
	FROM
		sys_selfrole r,
		sys_selfpower p
	WHERE
		r.role_name = '超级管理员'
	AND p.power_route 
	IN 
		('record_add_new','record_list','record_add_access','record_add_web','record_update_web')
);
-- updateSQL20170104-备案中心-unit_apply_web.sql
DROP TABLE IF EXISTS `unit_apply_web`;
CREATE TABLE `unit_apply_web` (
  `apply_id` varchar(32) NOT NULL COMMENT 'ID',
  `web_id` varchar(32) NOT NULL COMMENT 'webID',
  `old_webId` varchar(32) DEFAULT NULL COMMENT '变更备案时记录旧的网站ID',
  PRIMARY KEY (`apply_id`,`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- updateSQL20170104-备案中心-unit_info.sql
DROP TABLE IF EXISTS `unit_info`;
CREATE TABLE `unit_info` (
  `unit_id` varchar(32) NOT NULL COMMENT 'ID',
  `unit_name` varchar(100) NOT NULL COMMENT '主办单位名称',
  `unit_nature` char(1) NOT NULL COMMENT '1个人、\r\n2企业、\r\n3政府机关、\r\n4事业单位、\r\n5社会群体、\r\n6军队',
  `head_name` varchar(100) NOT NULL COMMENT '法人名称',
  `unit_area` varchar(32) NOT NULL COMMENT '所属行政区域',
  `unit_address` varchar(100) NOT NULL COMMENT '主办单位通讯地址',
  `certificate_type` char(1) NOT NULL COMMENT '主办单位证件类型1工商营业执照、\r\n2组织机构代码证书、',
  `certificate_no` varchar(32) NOT NULL COMMENT '证件号',
  `certificate_address` varchar(32) NOT NULL COMMENT '证件所在地',
  `duty_name` varchar(100) NOT NULL COMMENT '主体负责人姓名',
  `duty_certificate_type` char(1) NOT NULL COMMENT '1身份证、\r\n2护照、\r\n3台胞证、\r\n4军官证',
  `duty_certificate_no` varchar(100) NOT NULL COMMENT '负责人证件号码',
  `phone` varchar(32) NOT NULL COMMENT '办公室电话',
  `duty_phone` varchar(11) NOT NULL COMMENT '负责人手机',
  `duty_email` varchar(32) NOT NULL COMMENT '负责人邮箱',
  `duty_qq` varchar(20) DEFAULT NULL COMMENT '负责人QQ',
  `remark` varchar(1000) DEFAULT NULL COMMENT 'remark',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '上次修改时间',
  `record_type` char(1) NOT NULL COMMENT '1 首次备案、\r\n2 新增网站、\r\n3 新增接入、\r\n4 变更备案',
  `record_no` varchar(100) DEFAULT NULL COMMENT '主体备案号',
  `record_password` varchar(100) DEFAULT NULL COMMENT '管局密码',
  `cus_id` varchar(32) NOT NULL COMMENT '所属客户ID',
  `cus_org` varchar(32) NOT NULL COMMENT '客户名称',
  `business_fileId` varchar(32) NOT NULL COMMENT '营业执照',
  `duty_fileId` varchar(32) NOT NULL COMMENT '负责人证件照',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- updateSQL2017-01-16-备案中心-网站表新增ICP管局密码字段.sql
ALTER TABLE `website_info` ADD COLUMN `web_password` VARCHAR(100) NULL ;

ALTER TABLE `website_info` ADD COLUMN `remark` VARCHAR(1000) NULL ;

-- updateSQL2017-01-17-备案中心-数据字段长度修改.sql
alter table unit_info  modify column certificate_no varchar(100);
alter table unit_info  modify column certificate_address varchar(100);
alter table unit_info  modify column duty_email varchar(100);


alter table website_info  modify column special_no varchar(100);
alter table website_info  modify column duty_email varchar(100);

-- updateSQL2017-01-18备案中心ECMC公网IP释放增加校验权限.sql
UPDATE ecmc_sys_authority SET permission = 'ui:vir_floatip_release;
http:/ecmc/virtual/floatip/deallocateFloatIp.do;
http:/ecmc/virtual/floatip/checkflowebsite.do;' WHERE id='402890a8547a95f601547b3ed0fb024d';





