UPDATE sys_selfpower SET power_name = '移除云主机' where power_name = '移除规则';

-- 这两句只在此次的测试环境中执行
UPDATE sys_selfpower SET power_id = '3bc9a5dc6f5811e6aa9a001a4a7ae4d4' where power_name = '配额信息';
UPDATE sys_selfpower SET parent_id = '3bc9a5dc6f5811e6aa9a001a4a7ae4d4' , power_sort = 151310 where power_name = '申请配额';
-- 这两句只在此次的测试环境中执行



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