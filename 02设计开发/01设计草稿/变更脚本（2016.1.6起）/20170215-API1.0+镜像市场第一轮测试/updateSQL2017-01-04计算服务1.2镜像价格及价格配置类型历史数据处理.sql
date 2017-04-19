-- 将原来六种收费镜像的价格原始数据以新的方式重新存储
INSERT INTO money_billing_factor (id,resources_type,factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'IMAGE',res.image_id,res.start_num,res.end_num,res.pay_type,res.price,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			img.dc_id,
			mb.create_time,
			img.image_id
		FROM
			money_billing_factor mb,
			cloud_image img
		WHERE
			mb.factor_unit = (SELECT sd.node_id FROM sys_data_tree sd WHERE sd.node_name_en = '2008EnterpriseCount' AND sd.node_name = '个数')
		AND img.sys_type = (SELECT sdt.node_id FROM sys_data_tree sdt WHERE sdt.node_name_en = '2008EnterpriseCount' AND sdt.node_name <> '个数')
		AND mb.dc_id = img.dc_id AND img.image_ispublic = '1'
	) res;
INSERT INTO money_billing_factor (id,resources_type,factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'IMAGE',res.image_id,res.start_num,res.end_num,res.pay_type,res.price,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			img.dc_id,
			mb.create_time,
			img.image_id
		FROM
			money_billing_factor mb,
			cloud_image img
		WHERE
			mb.factor_unit = (SELECT sd.node_id FROM sys_data_tree sd WHERE sd.node_name_en = '2012StandardCount' AND sd.node_name = '个数')
		AND img.sys_type = (SELECT sdt.node_id FROM sys_data_tree sdt WHERE sdt.node_name_en = '2012StandardCount' AND sdt.node_name <> '个数')
		AND mb.dc_id = img.dc_id AND img.image_ispublic = '1'
	) res;
INSERT INTO money_billing_factor (id,resources_type,factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'IMAGE',res.image_id,res.start_num,res.end_num,res.pay_type,res.price,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			img.dc_id,
			mb.create_time,
			img.image_id
		FROM
			money_billing_factor mb,
			cloud_image img
		WHERE
			mb.factor_unit = (SELECT sd.node_id FROM sys_data_tree sd WHERE sd.node_name_en = '2012EnterpriseCount' AND sd.node_name = '个数')
		AND img.sys_type = (SELECT sdt.node_id FROM sys_data_tree sdt WHERE sdt.node_name_en = '2012EnterpriseCount' AND sdt.node_name <> '个数')
		AND mb.dc_id = img.dc_id AND img.image_ispublic = '1'
	) res;
INSERT INTO money_billing_factor (id,resources_type,factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'IMAGE',res.image_id,res.start_num,res.end_num,res.pay_type,res.price,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			img.dc_id,
			mb.create_time,
			img.image_id
		FROM
			money_billing_factor mb,
			cloud_image img
		WHERE
			mb.factor_unit = (SELECT sd.node_id FROM sys_data_tree sd WHERE sd.node_name_en = '2012DCCount' AND sd.node_name = '个数')
		AND img.sys_type = (SELECT sdt.node_id FROM sys_data_tree sdt WHERE sdt.node_name_en = '2012DCCount' AND sdt.node_name <> '个数')
		AND mb.dc_id = img.dc_id AND img.image_ispublic = '1'
	) res;
INSERT INTO money_billing_factor (id,resources_type,factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'IMAGE',res.image_id,res.start_num,res.end_num,res.pay_type,res.price,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			img.dc_id,
			mb.create_time,
			img.image_id
		FROM
			money_billing_factor mb,
			cloud_image img
		WHERE
			mb.factor_unit = (SELECT sd.node_id FROM sys_data_tree sd WHERE sd.node_name_en = '2008StandardCount' AND sd.node_name = '个数')
		AND img.sys_type = (SELECT sdt.node_id FROM sys_data_tree sdt WHERE sdt.node_name_en = '2008StandardCount' AND sdt.node_name <> '个数')
		AND mb.dc_id = img.dc_id AND img.image_ispublic = '1'
	) res;
INSERT INTO money_billing_factor (id,resources_type,factor_unit,start_num,end_num,pay_type,price,dc_id,create_time) 
SELECT REPLACE(UUID(),'-',''),'IMAGE',res.image_id,res.start_num,res.end_num,res.pay_type,res.price,res.dc_id,res.create_time
FROM(
		SELECT
			mb.start_num,
			mb.end_num,
			mb.pay_type,
			mb.price,
			img.dc_id,
			mb.create_time,
			img.image_id
		FROM
			money_billing_factor mb,
			cloud_image img
		WHERE
			mb.factor_unit = (SELECT sd.node_id FROM sys_data_tree sd WHERE sd.node_name_en = '2008DCCount' AND sd.node_name = '个数')
		AND img.sys_type = (SELECT sdt.node_id FROM sys_data_tree sdt WHERE sdt.node_name_en = '2008DCCount' AND sdt.node_name <> '个数')
		AND mb.dc_id = img.dc_id AND img.image_ispublic = '1'
	) res;
-- 删除镜像价格原始数据
DELETE FROM money_billing_factor WHERE factor_unit in 
(SELECT node_id FROM sys_data_tree WHERE node_name_en in('2012StandardCount','2012EnterpriseCount','2012DCCount','2008StandardCount','2008EnterpriseCount','2008DCCount') AND node_name = '个数');


-- 删除价格配置类型镜像及其子节点
DELETE FROM sys_data_tree WHERE node_id LIKE '0007004004%';
-- 将系统盘计费类型改为单价计费
UPDATE sys_data_tree SET para2 = '单价计费' WHERE node_name_en = 'sysDiskCapacity';
