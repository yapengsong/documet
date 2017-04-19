/*
查询所有没有vip的负载均衡信息,根据查询结果针对性的对这些负载均衡进行处理

曹翔宇
Date: 2017-03-16 10:41:34
*/

SELECT
	pool.pool_id AS poolId,
	pool.pool_name AS poolName,
	pool.prj_id AS prjId,
	pool.vip_id AS vipId,
	pool.create_time AS createTime,
	pool.create_name AS createName,
	pool.is_visible AS isVisible,
	prj.prj_name AS prjName,
	cus.cus_name AS cusName,
	cus.cus_id AS cusId,
	cus.cus_org AS cusOrg,
	cus.cus_cpname AS cusCpName,
	cus.cus_phone AS cusPhone,
	cus.cus_email AS cusEmail
FROM
	cloud_ldpool pool
LEFT JOIN
	cloud_project prj ON prj.prj_id=pool.prj_id
LEFT JOIN
	sys_selfcustomer cus ON prj.customer_id=cus.cus_id
WHERE
	pool.vip_id IS NULL;
