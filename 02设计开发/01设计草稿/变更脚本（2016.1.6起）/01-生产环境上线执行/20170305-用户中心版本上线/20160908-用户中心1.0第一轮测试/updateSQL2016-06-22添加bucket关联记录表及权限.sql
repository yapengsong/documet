
-- 增加bucket和cdn的关联表 段彬彬 2016.06.16
DROP TABLE IF EXISTS `cdn_bucket`;
CREATE TABLE `cdn_bucket` (
  `id` varchar(36) NOT NULL,
  `cdn_provider` varchar(36) DEFAULT NULL,
  `cus_id` varchar(36) DEFAULT NULL,
  `bucket_name` varchar(64) DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
	`delete_time` datetime DEFAULT NULL,
  `is_opencdn` varchar(10) DEFAULT '0',
  `cdn_status` varchar(10) DEFAULT '0',
  `cdn_path` varchar(255) DEFAULT NULL,
  `domain_id` varchar(36) DEFAULT NULL,
  
  `record_id` varchar(36) DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


-- OBS1.1CDN加速地址前缀和缓存规则
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0009005', 'CDN加速地址', '0009', 5, '0', '线上环境用和测试环境用', '1', 'file.eayun.com', '', NULL, 'cdn.eayunCDNHost', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0009006', 'CDN加速缓存配置', '0009', 6, '0', 'para1：缓存资源\npara2：缓存时间', '1', NULL, NULL, NULL, 'CDNCACHE', NULL);
INSERT INTO `sys_data_tree` (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`, `memo`, `flag`, `para1`, `para2`, `image_path`, `node_name_en`, `icon`) VALUES ('0009006001', '缓存规则1', '0009006', 1, '0', '缓存30天', '1', '/*', '2592000', NULL, NULL, NULL);

-- 添加CDN设置权限
INSERT INTO `sys_selfpower` (`power_id`, `power_name`, `power_url`, `power_route`, `power_sort`, `parent_id`, `power_desc`, `power_icon`) VALUES ('5438cb44385711e69ea0001a4a7ae4d4', 'CDN设置', NULL, 'bucket_cdnconfig', 231018, '40289099531765a6015317cdd318000a', '包括开启和关闭', NULL);

-- 添加CDN设置权限-角色关联记录，超级管理员和管理员有权限，普通用户无权限
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
	AND p.power_route = 'bucket_cdnconfig'
);