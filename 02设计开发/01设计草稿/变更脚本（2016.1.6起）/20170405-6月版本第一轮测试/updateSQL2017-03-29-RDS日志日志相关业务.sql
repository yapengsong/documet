-- 创建RDS日志表
CREATE TABLE cloud_rdslog (
	rdslog_id VARCHAR (100) PRIMARY KEY,
	log_name VARCHAR (100),
	dc_id VARCHAR (100),
	prj_id VARCHAR (100),
	rdsinstance_id VARCHAR (100),
	log_type VARCHAR (10),
	container VARCHAR (200),
	publish_time datetime,
	url VARCHAR (500),
	size INT (11)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

-- 创建RDS日志索引
ALTER TABLE cloud_rdslog
ADD INDEX idx_rdslog_id (rdslog_id) ,
ADD INDEX idx_dcid (dc_id) ,
ADD INDEX idx_prjid (prj_id) ,
ADD INDEX idx_rsdid (rdsinstance_id) ,
ADD INDEX idx_publishtime (publish_time) ;

-- 修改cloud_rdsinstance表结构
ALTER TABLE cloud_rdsinstance
ADD COLUMN log_publishing  varchar(20) NULL AFTER vm_id;

-- ECSC 修改密码的权限
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'修改密码',
		'',
		'host_modify_pwd',
		111031,
		'87bdd9c67c5711e58542001a4a7ae4d4',
		'云主机修改密码',
		''
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
		(r.role_name = '超级管理员' OR r.role_name = '管理员')
	AND p.power_route = 'host_modify_pwd'
);

-- ECSC RDS 日志的权限
INSERT INTO `sys_selfpower` 
(`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'下载日志',
		'',
		'rds_log_download',
		281129,
		'f7732d22079611e7b8cb001a4a7ae4d4',
		'云数据库下载日志',
		''
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
		(r.role_name = '超级管理员' OR r.role_name = '管理员' OR r.role_name = '普通用户')
	AND p.power_route = 'rds_log_download'
);

-- ECMC RDS 下载日志
INSERT INTO ecmc_sys_authority (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('402890955aac8a27015aacb0884a0000', '云数据库_实例_下载日志', '云数据库详情页面的下载日志', '2017-03-08 14:52:14', '2c91808256f81c44015702bbf9510000', '1', 'ui:rds_instance_log;\nhttp:/ecmc/rds/log/getlist.do;\nhttp:/ecmc/rds/log/checklogpublishstate.do;', '2c9082715a83f280015a83f90e690000', '0');
INSERT INTO ecmc_sys_authority (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('402890955aac8a27015aacb4b0620001', '云数据库_日志发布', '云数据库详情日志发布', '2017-03-08 14:56:47', '2c91808256f81c44015702bbf9510000', '1', 'ui:rds_instance_log_publish;\nhttp:/ecmc/rds/log/publish.do', '2c9082715a83f280015a83f90e690000', '0');
INSERT INTO ecmc_sys_authority (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('402890955aac8a27015aacb615ab0002', '云数据库_日志_下载', '云数据库日志下载', '2017-03-08 14:58:18', '2c91808256f81c44015702bbf9510000', '1', 'ui:rds_instance_log_download;\nhttp:/ecmc/rds/log/download.do', '2c9082715a83f280015a83f90e690000', '0');


INSERT INTO ecmc_sys_roleauth (`id`, `role_id`, `auth_id`) VALUES ('402890955b195a3b015b19883c0a0087', '40289092543bd6a801543bfee6a8000b', '402890955aac8a27015aacb0884a0000');
INSERT INTO ecmc_sys_roleauth (`id`, `role_id`, `auth_id`) VALUES ('402890955b195a3b015b19883c1300f3', '40289092543bd6a801543bfee6a8000b', '402890955aac8a27015aacb4b0620001');
INSERT INTO ecmc_sys_roleauth (`id`, `role_id`, `auth_id`) VALUES ('402890955b195a3b015b19883c1300f4', '40289092543bd6a801543bfee6a8000b', '402890955aac8a27015aacb615ab0002');
INSERT INTO ecmc_sys_roleauth (`id`, `role_id`, `auth_id`) VALUES ('402899635adaf2ec015adaf7e4a20229', '40289092543bd6a801543bff30f2000c', '402890955aac8a27015aacb0884a0000');
INSERT INTO ecmc_sys_roleauth (`id`, `role_id`, `auth_id`) VALUES ('402899635adaf2ec015adaf7e4a2022a', '40289092543bd6a801543bff30f2000c', '402890955aac8a27015aacb4b0620001');
INSERT INTO ecmc_sys_roleauth (`id`, `role_id`, `auth_id`) VALUES ('402899635adaf2ec015adaf7e4a2022b', '40289092543bd6a801543bff30f2000c', '402890955aac8a27015aacb615ab0002');

-- 总览界面资源类型调整
INSERT INTO sys_data_tree (`node_id`, `node_name`, `parent_id`, `sort`, `is_root`,  `flag`, `node_name_en`) VALUES ('0007002015016', 'MySQL实例', '0007002015', '16', '0','1','rdsInstanceCount');


