
-- ���뷢Ʊ��ص�Ȩ��
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'��Ʊ����','','',
		290000,
		'',
		'��Ʊ����',
		''
);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'��Ʊ����','','',
		291000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '��Ʊ����' AND ss.parent_id = ''),
		'��Ʊ����',''
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�鿴��Ʊ',
		NULL,
		'invoice_list',
		291010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '��Ʊ����' AND ss.parent_id <> ''),
		'�鿴��Ʊ',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'���뷢Ʊ',
		NULL,
		'invoice_apply',
		291011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '��Ʊ����' AND ss.parent_id <> ''),
		'���뷢Ʊ',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'ȡ����Ʊ����',
		NULL,
		'invoice_cancel',
		291012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '��Ʊ����' AND ss.parent_id <> ''),
		'ȡ����Ʊ����',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'��Ʊ��Ϣ����',
		NULL,
		'invoice_info',
		291013,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '��Ʊ����' AND ss.parent_id <> ''),
		'��Ʊ��Ϣ����',
		NULL
	);

INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�ʼĵ�ַ����',
		NULL,
		'invoice_address',
		291014,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '��Ʊ����' AND ss.parent_id <> ''),
		'�ʼĵ�ַ����',
		NULL
	);

-- ����Ȩ��-��ɫ��ϵ
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
		r.role_name = '����Ա'
	AND p.power_route 
	IN 
		('invoice_list','invoice_apply','invoice_cancel','invoice_info','invoice_address')
);