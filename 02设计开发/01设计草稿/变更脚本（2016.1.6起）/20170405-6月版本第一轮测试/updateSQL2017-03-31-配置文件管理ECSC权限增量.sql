INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
	REPLACE (uuid(), '-', ''),
	'配置文件','','',
	281200,
	(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '云数据库' AND ss.parent_id = ''),
	'默认配置文件与客户配置文件管理',''
);
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
(
	REPLACE (uuid(), '-', ''),
	'配置列表',
	NULL,
	'rds_config_view',
	281210,
	(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '配置文件' AND ss.parent_id <> ''),
	'列表',
	NULL
);
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
(
	REPLACE (uuid(), '-', ''),
	'查看',
	NULL,
	'rds_config_detail',
	281211,
	(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '配置文件' AND ss.parent_id <> ''),
	'查看配置文件详情',
	NULL
);
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
(
	REPLACE (uuid(), '-', ''),
	'创建',
	NULL,
	'rds_config_create',
	281212,
	(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '配置文件' AND ss.parent_id <> ''),
	'创建新配置文件',
	NULL
);
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
(
	REPLACE (uuid(), '-', ''),
	'编辑',
	NULL,
	'rds_config_update',
	281213,
	(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '配置文件' AND ss.parent_id <> ''),
	'编辑更新配置文件',
	NULL
);
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
(
	REPLACE (uuid(), '-', ''),
	'删除',
	NULL,
	'rds_config_delete',
	281214,
	(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '配置文件' AND ss.parent_id <> ''),
	'删除配置文件',
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
		('rds_config_view','rds_config_detail','rds_config_create','rds_config_update','rds_config_delete')
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
		('rds_config_view','rds_config_detail','rds_config_create','rds_config_update','rds_config_delete')
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
		('rds_config_view','rds_config_detail')
);