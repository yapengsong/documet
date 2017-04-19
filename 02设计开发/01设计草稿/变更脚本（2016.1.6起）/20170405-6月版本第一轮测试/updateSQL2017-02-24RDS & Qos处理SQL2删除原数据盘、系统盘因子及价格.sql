-- RDS & Qos版本
-- 此SQL为删除原有的数据盘和系统盘计费因子和价格，应该在系统升级并稳定后再执行
-- 6.删除原数据盘和系统盘计费因子价格
DELETE FROM money_billing_factor WHERE factor_unit = '0007004002001001';
DELETE FROM money_billing_factor WHERE factor_unit = '0007004002002001'
;
-- 7.删除原价格配置-云硬盘下的计费因子
DELETE FROM sys_data_tree WHERE node_id in('0007004002001','0007004002001001','0007004002002','0007004002002001');