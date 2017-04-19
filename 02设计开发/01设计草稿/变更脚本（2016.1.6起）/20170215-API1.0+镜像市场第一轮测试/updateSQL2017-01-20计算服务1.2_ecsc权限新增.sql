-- 计算1.2ecsc权限新增（公共镜像查看、市场镜像查看）
INSERT INTO `sys_selfpower` (
	`power_id`,
	`power_name`,
	`power_url`,
	`power_route`,
	`power_sort`,
	`parent_id`,
	`power_desc`,
	`power_icon`
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'pubimage_view',
		111314,
		(
			SELECT
				ss.power_id
			FROM
				sys_selfpower ss
			WHERE
				ss.power_name = '镜像'
		),
		'公共镜像查看',
		NULL
	);

INSERT INTO `sys_selfpower` (
	`power_id`,
	`power_name`,
	`power_url`,
	`power_route`,
	`power_sort`,
	`parent_id`,
	`power_desc`,
	`power_icon`
)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'marketimage_view',
		111315,
		(
			SELECT
				ss.power_id
			FROM
				sys_selfpower ss
			WHERE
				ss.power_name = '镜像'
		),
		'市场镜像查看',
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
		r.role_name LIKE '%管理员'
	AND p.power_route IN (
		'marketimage_view',
		'pubimage_view'
	)
);

