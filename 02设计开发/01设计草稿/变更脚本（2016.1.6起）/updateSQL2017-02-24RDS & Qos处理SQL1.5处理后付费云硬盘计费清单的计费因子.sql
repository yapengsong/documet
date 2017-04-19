-- 处理后付费云硬盘资源计费清单中原数据盘和系统盘计费因子，改为新的普通型
UPDATE money_chargerecord SET cr_factors = REPLACE(cr_factors,'dataDiskCapacity','dataDiskOrdinary');

UPDATE money_chargerecord SET cr_factors = REPLACE(cr_factors,'sysDiskCapacity','sysDiskOrdinary');