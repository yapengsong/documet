-- 新增备案中心部分权限开始---------------------------
-- 新增一级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'备案中心','','',
		270000,
		'',
		'备案中心',
		''
);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'开始备案','','',
		271000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '备案中心' AND ss.parent_id = ''),
		'开始备案',''
	);
-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'新增备案',
		NULL,
		'record_add_new',
		271010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'新增备案',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'已备案列表',
		NULL,
		'record_list',
		271011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'已备案列表',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'新增接入',
		NULL,
		'record_add_access',
		271012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'新增接入',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'新增网站',
		NULL,
		'record_add_web',
		271013,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'新增网站',
		NULL
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'变更备案',
		NULL,
		'record_update_web',
		271014,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '开始备案' AND ss.parent_id <> ''),
		'变更备案',
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
		('record_add_new','record_list','record_add_access','record_add_web','record_update_web')
);