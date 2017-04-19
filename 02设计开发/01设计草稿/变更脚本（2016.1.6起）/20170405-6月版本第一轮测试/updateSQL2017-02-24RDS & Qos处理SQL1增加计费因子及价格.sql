-- 1.原“价格配置”项名称改为“基础资源价格配置”,快照改为备份,单位改为10GB
UPDATE sys_data_tree SET node_name = '基础资源价格配置' WHERE  node_id = '0007004';
UPDATE sys_data_tree SET node_name = '云硬盘备份'  WHERE  node_id = '0007004003';
UPDATE sys_data_tree SET node_name = '备份大小'  WHERE  node_id = '0007004003001';
UPDATE sys_data_tree SET para1 = '10GB'  WHERE  node_id = '0007004003001001';

-- 2.增加“云数据库价格配置”及其下的计费因子
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005', '云数据库价格配置', '0007', 3, '0', NULL, '1', NULL, NULL, NULL, 'cloudDataPriceConfig', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001', 'MySQL', '0007005', 1, '0', NULL, '1', NULL, NULL, NULL, 'cloudMySQL', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001001', 'CPU', '0007005001', 1, '0', NULL, '1', NULL, NULL, NULL, 'cloudFactorMySQLCPU', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001001001', '核数', '0007005001001', 1, '0', NULL, '1', '核', '单价计费', NULL, 'cloudMySQLCPU', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001002', '内存', '0007005001', 2, '0', NULL, '1', NULL, NULL, NULL, 'cloudFactorMySQLRAM', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001002001', '容量', '0007005001002', 1, '0', NULL, '1', 'GB', '单价计费', NULL, 'cloudMySQLRAM', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001003', '实例存储_普通型', '0007005001', 3, '0', NULL, '1', NULL, NULL, NULL, 'cloudMySQLOrdinary', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001003001', '容量', '0007005001003', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'storageMySQLOrdinary', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001004', '实例存储_性能型', '0007005001', 4, '0', NULL, '1', NULL, NULL, NULL, 'cloudMySQLBetter', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001004001', '容量', '0007005001004', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'storageMySQLBetter', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001005', '实例存储_超高性能型', '0007005001', 5, '0', NULL, '1', NULL, NULL, NULL, 'cloudMySQLBest', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007005001005001', '容量', '0007005001005', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'storageMySQLBest', NULL);


-- 3.原价格配置-云硬盘下增加新的云硬盘计费因子
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002003', '系统盘_普通型', '0007004002', 3, '0', NULL, '1', NULL, NULL, NULL, 'volSysOrdinary', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002003001', '容量', '0007004002003', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'sysDiskOrdinary', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002004', '系统盘_性能型', '0007004002', 4, '0', NULL, '1', NULL, NULL, NULL, 'volSysBetter', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002004001', '容量', '0007004002004', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'sysDiskBetter', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002005', '系统盘_超高性能型', '0007004002', 5, '0', NULL, '1', NULL, NULL, NULL, 'volSysBest', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002005001', '容量', '0007004002005', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'sysDiskBest', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002006', '数据盘_普通型', '0007004002', 6, '0', NULL, '1', NULL, NULL, NULL, 'volDataOrdinary', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002006001', '容量', '0007004002006', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'dataDiskOrdinary', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002007', '数据盘_性能型', '0007004002', 7, '0', NULL, '1', NULL, NULL, NULL, 'volDataBetter', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002007001', '容量', '0007004002007', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'dataDiskBetter', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002008', '数据盘_超高性能型', '0007004002', 8, '0', NULL, '1', NULL, NULL, NULL, 'volDataBest', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0007004002008001', '容量', '0007004002008', 1, '0', NULL, '1', '10GB', '单价计费', NULL, 'dataDiskBest', NULL);


-- 4.RDS1.0&计算1.3ECMC新增权限(价格导入导出)
UPDATE ecmc_sys_authority SET permission = 'ui:price_config;
http:/billing/factor/getfactorsbytypedcid.do;
http:/billing/factor/getpricesbypaytype.do;
http:/billing/factor/getallresourcestype.do;
http:/ecmc/overview/getalldclist.do;
http:/ecmc/cloud/image/getostypelist.do;
http:/ecmc/cloud/image/getmarkettypelist.do;
http:/ecmc/cloud/image/getmarketimagepagelist.do;
http:/ecmc/cloud/image/getconimagepagelist.do;
http:/ecmc/billing/factor/createpriceexcel.do;
http:/ecmc/billing/factor/importpriceexcel.do;' WHERE id = '40289099562538b00156253dfa450001';


-- 5.添加新的普通数据盘和系统盘价格
-- 系统盘-普通型价格
INSERT INTO money_billing_factor (id,resources_type,billing_factor, factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'0007004002','0007004002003','0007004002003001',res.start_num,res.end_num,res.pay_type,res.price*10,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			mb.dc_id,
			mb.create_time
		FROM
			money_billing_factor mb
		WHERE mb.factor_unit = '0007004002001001'
	) res;
-- 数据盘-普通型价格
INSERT INTO money_billing_factor (id,resources_type,billing_factor, factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'0007004002','0007004002006','0007004002006001',res.start_num,res.end_num,res.pay_type,res.price*10,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			mb.dc_id,
			mb.create_time
		FROM
			money_billing_factor mb
		WHERE mb.factor_unit = '0007004002002001'
	) res;

-- 云硬盘备份价格改为原来的10倍

UPDATE money_billing_factor mbf SET mbf.price = mbf.price*10 WHERE mbf.factor_unit = '0007004003001001';






