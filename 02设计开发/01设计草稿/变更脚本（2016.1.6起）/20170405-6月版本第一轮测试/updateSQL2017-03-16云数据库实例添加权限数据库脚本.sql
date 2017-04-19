INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建实例',
		NULL,
		'rds_instance_create',
		281119,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'创建新的数据库实例',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'rds_instance_renew',
		281120,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'MySQL数据库实例的续费',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'重启',
		NULL,
		'rds_instance_restart',
		281121,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'MySQL数据库实例重启',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建从库',
		NULL,
		'rds_instance_createreplica',
		281122,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'创建从库',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'从库升级为主库',
		NULL,
		'rds_instance_detachreplica',
		281123,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'从库升级为主库',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'监控',
		NULL,
		'rds_instance_monitor',
		281124,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'监控',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'升降配置',
		NULL,
		'rds_instance_resize',
		281125,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'升降配置',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除',
		NULL,
		'rds_instance_delete',
		281126,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'云数据库实例的删除',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'修改配置',
		NULL,
		'rds_instance_modifyconfiguration',
		281127,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'云数据库实例修改配置',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'修改名称和描述',
		NULL,
		'rds_instance_edit',
		281128,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'云数据库实例修改修改名称和描述',
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
		('rds_instance_create','rds_instance_renew','rds_instance_restart','rds_instance_createreplica','rds_instance_detachreplica',
'rds_instance_monitor', 'rds_instance_resize', 'rds_instance_delete', 'rds_instance_modifyconfiguration', 'rds_instance_edit')
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
		('rds_instance_create','rds_instance_renew','rds_instance_restart','rds_instance_createreplica','rds_instance_detachreplica',
'rds_instance_monitor', 'rds_instance_resize', 'rds_instance_delete', 'rds_instance_modifyconfiguration', 'rds_instance_edit')
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
		('rds_instance_restart','rds_instance_detachreplica', 'rds_instance_monitor')
);

