-- 浮动IP的权限调整 
UPDATE sys_selfpower
SET power_name = '公网IP',
 power_desc = '公网IP权限列表'
WHERE
	power_id = '5710c38a996f11e5a260001a4a7ae4d4';

UPDATE sys_selfpower
SET power_name = '绑定/解绑',
 power_desc = '绑定/解绑'
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
		'申请公网IP',
		'float_add',
		121414,
		'5710c38a996f11e5a260001a4a7ae4d4',
		'申请公网IP'
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
		'释放公网IP',
		'float_release',
		121415,
		'5710c38a996f11e5a260001a4a7ae4d4',
		'释放公网IP'
	);

-- 申请的ID 
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
		r.role_name = '超级管理员'
	AND p.power_route IN (
		'float_release',
		'float_add'
	));
	
	
-- 负载均衡的权限调整
UPDATE sys_selfpower
SET power_name = '负载均衡器查看',
 power_desc = '负载均衡器查看'
WHERE
	power_id = '6d2efffc7c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '创建负载均衡器',
 power_desc = '创建负载均衡器'
WHERE
	power_id = '8af830bc7c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '编辑负载均衡器',
 power_desc = '编辑负载均衡器'
WHERE
	power_id = 'a7e3e6307c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '删除负载均衡器',
 power_desc = '删除负载均衡器'
WHERE
	power_id = 'eacc21927c8111e58542001a4a7ae4d4';
UPDATE sys_selfpower
SET power_name = '负载均衡器标签',
 power_desc = '负载均衡器标签'
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
		'绑定公网IP/解绑公网IP',
		'load_bindfloatip',
		121316,
		'69533f667c8011e58542001a4a7ae4d4',
		'绑定公网IP/解绑公网IP'
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
		'添加成员',
		'loadmember_add',
		121317,
		'69533f667c8011e58542001a4a7ae4d4',
		'添加成员'
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
		'编辑成员',
		'loadmember_edit',
		121318,
		'69533f667c8011e58542001a4a7ae4d4',
		'编辑成员'
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
		'删除成员',
		'loadmember_delete',
		121319,
		'69533f667c8011e58542001a4a7ae4d4',
		'删除成员'
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
		'健康检查查看',
		'loadmonitor_view',
		121320,
		'69533f667c8011e58542001a4a7ae4d4',
		'健康检查查看'
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
		'新增健康检查',
		'loadmonitor_add',
		121321,
		'69533f667c8011e58542001a4a7ae4d4',
		'新增健康检查'
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
		'编辑健康检查',
		'loadmonitor_edit',
		121322,
		'69533f667c8011e58542001a4a7ae4d4',
		'编辑健康检查'
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
		'编辑健康标签',
		'loadmonitor_tag',
		121323,
		'69533f667c8011e58542001a4a7ae4d4',
		'健康检查标签'
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
		'删除编辑健康',
		'loadmonitor_delete',
		121324,
		'69533f667c8011e58542001a4a7ae4d4',
		'删除编辑健康'
	);


-- 负载均衡的权限调整
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
		(r.role_name = '超级管理员' or r.role_name ='管理员')
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
		r.role_name = '普通用户'
	AND p.power_route IN (
		'loadmonitor_view'
	)
);
	
	