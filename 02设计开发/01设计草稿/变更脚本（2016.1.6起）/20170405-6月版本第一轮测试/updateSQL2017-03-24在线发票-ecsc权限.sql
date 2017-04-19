
-- 插入发票相关的权限
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'发票管理','','',
		290000,
		'',
		'发票管理',
		''
);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'发票管理','','',
		291000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '发票管理' AND ss.parent_id = ''),
		'发票管理',''
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看发票',
		NULL,
		'invoice_list',
		291010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '发票管理' AND ss.parent_id <> ''),
		'查看发票',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'申请发票',
		NULL,
		'invoice_apply',
		291011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '发票管理' AND ss.parent_id <> ''),
		'申请发票',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'取消开票申请',
		NULL,
		'invoice_cancel',
		291012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '发票管理' AND ss.parent_id <> ''),
		'取消开票申请',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'开票信息管理',
		NULL,
		'invoice_info',
		291013,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '发票管理' AND ss.parent_id <> ''),
		'开票信息管理',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'邮寄地址管理',
		NULL,
		'invoice_address',
		291014,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '发票管理' AND ss.parent_id <> ''),
		'邮寄地址管理',
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
		('invoice_list','invoice_apply','invoice_cancel','invoice_info','invoice_address')
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
		r.role_name = '管理员'
	AND p.power_route 
	IN 
		('invoice_list','invoice_apply','invoice_cancel','invoice_info','invoice_address')
);