-- RDS实例详情页权限补充（下载日志）
UPDATE sys_selfpower t
SET t.parent_id = (
	SELECT
		b.*
	FROM
		(
			SELECT
				a.power_id
			FROM
				sys_selfpower a
			WHERE
				a.power_name = 'MySQL'
		) b
)
WHERE
	t.power_route = 'rds_log_download';