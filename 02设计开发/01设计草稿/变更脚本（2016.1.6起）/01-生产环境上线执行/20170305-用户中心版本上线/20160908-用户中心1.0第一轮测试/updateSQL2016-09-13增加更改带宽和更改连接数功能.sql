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