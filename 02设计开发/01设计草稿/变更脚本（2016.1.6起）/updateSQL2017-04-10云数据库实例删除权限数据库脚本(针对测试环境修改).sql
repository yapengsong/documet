 DELETE FROM sys_selfrolepower WHERE role_id in (
	SELECT
		r.role_id AS role_id
	FROM
		sys_selfrole r,
		sys_selfpower p
	WHERE
		r.role_name = '∆’Õ®”√ªß'
	AND p.power_route = 'rds_instance_edit') AND power_id = (SELECT power_id FROM sys_selfpower WHERE power_route = 'rds_instance_edit');