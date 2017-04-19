select * from sys_selfpower order by power_sort desc;

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'MySQL','','',
		281100,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '�����ݿ�' AND ss.parent_id = ''),
		'���������ݿ�ʵ��MySQL������Ȩ��',''
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'���ݿ��б�',
		NULL,
		'rds_db_list',
		281110,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'�鿴�����ݿ�ʵ��MySQL�����ݿ��б�',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�������ݿ�',
		NULL,
		'rds_db_create',
		281111,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'���������ݿ�',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'ɾ�����ݿ�',
		NULL,
		'rds_db_delete',
		281112,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'ɾ�����ݿ�',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�˻��б�',
		NULL,
		'rds_account_list',
		281113,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'�鿴�����ݿ�ʵ��MySQL���˻��б�',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�����˻�',
		NULL,
		'rds_account_create',
		281114,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'�������˻�',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�޸��˻�Ȩ��',
		NULL,
		'rds_account_authorize',
		281115,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'�޸��˻�Ȩ��',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�޸��˻�����',
		NULL,
		'rds_account_updatepw',
		281116,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'�޸��˻�����',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'ɾ���˻�',
		NULL,
		'rds_account_delete',
		281117,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'ɾ���˻�',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'����root�˻�����',
		NULL,
		'rds_account_resetpw',
		281118,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'MySQL' AND ss.parent_id <> ''),
		'����root�˻�����',
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
		r.role_name = '��������Ա'
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
		r.role_name = '����Ա'
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
		r.role_name = '��ͨ�û�'
	AND p.power_route 
	IN 
		('rds_db_list','rds_account_list')
);