select * from sys_selfpower order by power_sort desc;

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'MySQL','','',
		281100,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '云数据库' AND ss.parent_id = ''),
		'包含云数据库实例MySQL的所有权限',''
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'数据库列表',
		NULL,
		'rds_db_list',
		281110,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'查看云数据库实例MySQL的数据库列表',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建数据库',
		NULL,
		'rds_db_create',
		281111,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'创建新数据库',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除数据库',
		NULL,
		'rds_db_delete',
		281112,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'删除数据库',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'账户列表',
		NULL,
		'rds_account_list',
		281113,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'查看云数据库实例MySQL的账户列表',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建账户',
		NULL,
		'rds_account_create',
		281114,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'创建新账户',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'修改账户权限',
		NULL,
		'rds_account_authorize',
		281115,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'修改账户权限',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'修改账户密码',
		NULL,
		'rds_account_updatepw',
		281116,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'修改账户密码',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除账户',
		NULL,
		'rds_account_delete',
		281117,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'删除账户',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'重置root账户密码',
		NULL,
		'rds_account_resetpw',
		281118,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'重置root账户密码',
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
		r.role_name = '超级管理员'
	AND p.power_route 
	IN 
		('rds_db_list','rds_db_create','rds_db_delete','rds_account_list','rds_account_create','rds_account_authorize','rds_account_updatepw','rds_account_delete','rds_account_resetpw')
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
		('rds_db_list','rds_db_create','rds_db_delete','rds_account_list','rds_account_create','rds_account_authorize','rds_account_updatepw','rds_account_delete','rds_account_resetpw')
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
		r.role_name = '普通用户'
	AND p.power_route 
	IN 
		('rds_db_list','rds_account_list')
);