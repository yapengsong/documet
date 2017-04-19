-- ����IP��Ȩ�޵��� 
UPDATE sys_selfpower
SET power_name = '����IP',
 power_desc = '����IPȨ���б�'
WHERE
	power_id = '5710c38a996f11e5a260001a4a7ae4d4';

UPDATE sys_selfpower
SET power_name = '��/���',
 power_desc = '��/���'
WHERE
	power_id = 'f76b9e48998511e5a260001a4a7ae4d4';

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'���빫��IP',
		'float_add',
		121414,
		'5710c38a996f11e5a260001a4a7ae4d4',
		'���빫��IP'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�ͷŹ���IP',
		'float_release',
		121415,
		'5710c38a996f11e5a260001a4a7ae4d4',
		'�ͷŹ���IP'
	);

-- �����ID 
INSERT INTO sys_selfrolepower (
	rp_id,
	role_id,
	power_id,
	rp_state
) (SELECT
		REPLACE (uuid(), '-', '') as rp_id,
		r.role_id as role_id,
		p.power_id as power_id,
		'1' as rp_state
	FROM
		sys_selfrole r,
		sys_selfpower p
	WHERE
		r.role_name = '��������Ա'
	AND p.power_route IN (
		'float_release',
		'float_add'
	));
	
	
-- ���ؾ����Ȩ�޵���
UPDATE sys_selfpower
SET power_name = '���ؾ������鿴',
 power_desc = '���ؾ������鿴'
WHERE
	power_id = '6d2efffc7c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '�������ؾ�����',
 power_desc = '�������ؾ�����'
WHERE
	power_id = '8af830bc7c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '�༭���ؾ�����',
 power_desc = '�༭���ؾ�����'
WHERE
	power_id = 'a7e3e6307c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = 'ɾ�����ؾ�����',
 power_desc = 'ɾ�����ؾ�����'
WHERE
	power_id = 'eacc21927c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '���ؾ�������ǩ',
 power_desc = '���ؾ�������ǩ'
WHERE
	power_id = 'eb9247de998511e5a260001a4a7ae4d4';

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�󶨹���IP/�����IP',
		'load_bindfloatip',
		121316,
		'69533f667c8011e58542001a4a7ae4d4',
		'�󶨹���IP/�����IP'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'��ӳ�Ա',
		'loadmember_add',
		121317,
		'69533f667c8011e58542001a4a7ae4d4',
		'��ӳ�Ա'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�༭��Ա',
		'loadmember_edit',
		121318,
		'69533f667c8011e58542001a4a7ae4d4',
		'�༭��Ա'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'ɾ����Ա',
		'loadmember_delete',
		121319,
		'69533f667c8011e58542001a4a7ae4d4',
		'ɾ����Ա'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�������鿴',
		'loadmonitor_view',
		121320,
		'69533f667c8011e58542001a4a7ae4d4',
		'�������鿴'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�����������',
		'loadmonitor_add',
		121321,
		'69533f667c8011e58542001a4a7ae4d4',
		'�����������'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�༭�������',
		'loadmonitor_edit',
		121322,
		'69533f667c8011e58542001a4a7ae4d4',
		'�༭�������'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'�༭������ǩ',
		'loadmonitor_tag',
		121323,
		'69533f667c8011e58542001a4a7ae4d4',
		'��������ǩ'
	);

INSERT INTO sys_selfpower (
	power_id,
	power_name,
	power_route,
	power_sort,
	parent_id,
	power_desc
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'ɾ���༭����',
		'loadmonitor_delete',
		121324,
		'69533f667c8011e58542001a4a7ae4d4',
		'ɾ���༭����'
	);


-- ���ؾ����Ȩ�޵���
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
		(r.role_name = '��������Ա' or r.role_name ='����Ա')
	AND p.power_route IN (
		'load_bindfloatip',
		'loadmember_add',
		'loadmember_edit',
		'loadmember_delete',
		'loadmonitor_view',
		'loadmonitor_add',
		'loadmonitor_edit',
		'loadmonitor_delete',
		'loadmonitor_tag'
	)
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
	AND p.power_route IN (
		'loadmonitor_view'
	)
);
	
	