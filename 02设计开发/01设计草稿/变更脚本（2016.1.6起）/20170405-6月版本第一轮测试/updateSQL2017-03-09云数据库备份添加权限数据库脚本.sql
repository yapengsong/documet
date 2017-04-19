select * from sys_selfpower order by power_sort desc;

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'云数据库','','',
		280000,
		'',
		'云数据库',
		''
);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'备份','','',
		281000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '云数据库' AND ss.parent_id = ''),
		'备份',''
	);


INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'列表',
		NULL,
		'rds_backup_view',
		281010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '备份' AND ss.parent_id <> ''),
		'列表',
		NULL
	);


INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建新实例',
		NULL,
		'rds_backup_createinstance',
		281011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '备份' AND ss.parent_id <> ''),
		'创建新实例',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除',
		NULL,
		'rds_backup_delete',
		281012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '备份' AND ss.parent_id <> ''),
		'删除',
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
		('rds_backup_view','rds_backup_createinstance','rds_backup_delete')
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
		('rds_backup_view','rds_backup_createinstance','rds_backup_delete')
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
		('rds_backup_view')
);








