-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'SSH密钥','','',
		(SELECT	ss.power_sort FROM	sys_selfpower ss	WHERE	ss.power_name = '安全' AND ss.parent_id = '')+2000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '安全' AND ss.parent_id = ''),
		'SSH密钥',''
	);

-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建密钥',
		NULL,
		'secretkey_add',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+10,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'创建密钥',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'修改密钥',
		NULL,
		'secretkey_update',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+11,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'修改密钥',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'密钥列表',
		NULL,
		'secretkey_list',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+12,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'密钥列表',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'密钥详情',
		NULL,
		'secretkey_details',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+13,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'密钥详情',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'密钥绑定',
		NULL,
		'secretkey_bind',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+14,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'密钥绑定',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'密钥解绑',
		NULL,
		'secretkey_unbind',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+15,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'密钥解绑',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除密钥',
		NULL,
		'secretkey_delete',
		(SELECT ss.power_sort FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> '')+16,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'SSH密钥' AND ss.parent_id <> ''),
		'删除密钥',
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
		('secretkey_add','secretkey_update','secretkey_list','secretkey_details','secretkey_bind','secretkey_unbind','secretkey_delete')
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
		('secretkey_add','secretkey_update','secretkey_list','secretkey_details','secretkey_bind','secretkey_unbind','secretkey_delete')
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
		('secretkey_list','secretkey_details')
);