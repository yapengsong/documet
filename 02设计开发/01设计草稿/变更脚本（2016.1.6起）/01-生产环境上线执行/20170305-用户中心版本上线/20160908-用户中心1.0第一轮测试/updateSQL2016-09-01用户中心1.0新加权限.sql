-- 所有语句请从上到下顺序执行，并注意按照注释语句操作！！！


-- 修改原有的名称变化
UPDATE sys_selfpower SET power_name = '标签管理' where power_name = '业务管理';
UPDATE sys_selfpower SET power_name = '基本信息' where power_name = '账号管理';
UPDATE sys_selfpower SET power_name = '公司信息' where power_name = '组织信息';

-- 调整申请配额权限位置开始---------------------
-- 基本信息下新增一个配额信息二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES( 
		'3bc9a5dc6f5811e6aa9a001a4a7ae4d4',
		'配额信息',
		'',
		'',
		151300,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '基本信息' AND ss.parent_id = ''),
		'配额信息（原总览页下面）',
		''
);

UPDATE sys_selfpower SET parent_id = '3bc9a5dc6f5811e6aa9a001a4a7ae4d4' , power_sort = 151310 where power_name = '申请配额';
-- 调整申请配额权限位置结束---------------------

-- 删除原业务参数配置权限开始---------------------
DELETE FROM sys_selfrolepower WHERE power_id in (SELECT ss.power_id FROM sys_selfpower ss WHERE ss.parent_id = (SELECT par.power_id FROM sys_selfpower par WHERE par.power_name = '业务参数配置'));

DELETE FROM sys_selfpower WHERE power_name ='业务参数配置';

DELETE FROM sys_selfpower WHERE power_route in('syssetup_mng','syssetup_view');
-- 删除原业务参数配置权限结束---------------------


-- 新增订单部分权限开始---------------------------
-- 新增一级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'订单管理','','',
		250000,
		'',
		'订单管理',
		''
);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'订单管理',
		'',
		'',
		251000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '订单管理' AND ss.parent_id = ''),
		'订单管理',
		''
	);
-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看订单',
		NULL,
		'order_list',
		251010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
		'查看订单',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查询订单',
		NULL,
		'order_search',
		251011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
		'查询订单',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'重新下单',
		NULL,
		'order_reorder',
		251012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
		'重新下单',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'取消订单',
		NULL,
		'order_cancel',
		251013,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
		'取消订单',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'支付订单',
		NULL,
		'order_pay',
		251014,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
		'支付订单',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看资源',
		NULL,
		'order_resource',
		251015,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '订单管理' AND ss.parent_id <> ''),
		'查看资源',
		NULL
	);
-- 新增订单部分权限结束---------------------------

-- 新增回收站部分权限开始---------------------------
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'回收站','','',
		260000,
		'',
		'回收站',
		''
);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'云主机',
		'',
		'',
		261000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '回收站' AND ss.parent_id = ''),
		'回收站里云主机模块',
		''
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'云硬盘',
		'',
		'',
		261100,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '回收站' AND ss.parent_id = ''),
		'回收站里云硬盘模块',
		''
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES(
		REPLACE (uuid(), '-', ''),
		'云硬盘快照',
		'',
		'',
		261200,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '回收站' AND ss.parent_id = ''),
		'回收站里云硬盘快照模块',
		''
	);
-- 新增三级目录功能权限
-- 云主机
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'recycle_host_view',
		261010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 261000),
		'回收站查看云主机功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'恢复',
		NULL,
		'recycle_host_reset',
		261011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 261000),
		'回收站恢复云主机功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除',
		NULL,
		'recycle_host_drop',
		261012,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 261000),
		'回收站删除云主机功能',
		NULL
	);
-- 云硬盘
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'recycle_disk_view',
		261110,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 261100),
		'回收站查看云硬盘功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'恢复',
		NULL,
		'recycle_disk_reset',
		261111,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 261100),
		'回收站恢复云硬盘功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除',
		NULL,
		'recycle_disk_drop',
		261112,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 261100),
		'回收站删除云硬盘功能',
		NULL
	);
-- 云硬盘快照
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'recycle_snap_view',
		261210,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 261200),
		'回收站查看云硬盘快照功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'恢复',
		NULL,
		'recycle_snap_reset',
		261211,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 261200),
		'回收站恢复云硬盘快照功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除',
		NULL,
		'recycle_snap_drop',
		261212,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 261200),
		'回收站删除云硬盘快照功能',
		NULL
	);
-- 新增回收站部分权限结束---------------------------

-- 新增云主机部分权限开始---------------------------

INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'修改子网',
		'host_moreIp',
		111030,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 111000),
		'云主机修改子网'
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'host_renew',
		111029,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云主机' AND ss.parent_id <> '' AND ss.power_sort = 111000),
		'云主机续费功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'disk_renew',
		111118,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 111100),
		'云硬盘续费功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'回滚云硬盘',
		NULL,
		'snap_rollback',
		111215,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘快照' AND ss.parent_id <> '' AND ss.power_sort = 111200),
		'云硬盘快照回滚云硬盘功能',
		NULL
	);
-- 新增云主机部分权限结束---------------------------

-- 新增安全部分权限开始---------------------------
-- 安全组
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'添加规则',
		NULL,
		'group_rule_add',
		131116,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
		'安全组添加规则功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除规则',
		NULL,
		'group_rule_delete',
		131117,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
		'安全组删除规则功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'添加云主机',
		NULL,
		'group_host_add',
		131118,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
		'安全组添加云主机功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'移除规则',
		NULL,
		'group_host_delete',
		131119,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '安全组' AND ss.parent_id <> '' AND ss.power_sort = 131100),
		'安全组移除规则功能',
		NULL
	);
-- 防火墙
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'禁用规则',
		NULL,
		'firewallrule_enabled',
		131015,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
		'防火墙禁用规则功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'调整优先级',
		NULL,
		'firewall_policy',
		131016,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
		'防火墙调整优先级功能',
		NULL
	);
-- 新增安全部分权限结束---------------------------


-- 新增网络部分权限开始---------------------------
-- 私有网络
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'net_renew',
		121017,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
		'私有网络续费功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看端口映射',
		NULL,
		'net_port_view',
		121018,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
		'私有网络查看端口映射功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建端口映射',
		NULL,
		'net_port_add',
		121019,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
		'私有网络创建端口映射功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'编辑端口映射',
		NULL,
		'net_port_edit',
		121020,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
		'私有网络编辑端口映射功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除端口映射',
		NULL,
		'net_port_drop',
		121021,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '私有网络' AND ss.parent_id <> '' AND ss.power_sort = 121000),
		'私有网络删除端口映射功能',
		NULL
	);
-- 子网
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'绑定、解绑路由',
		NULL,
		'subnet_route',
		121115,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '子网' AND ss.parent_id <> '' AND ss.power_sort = 121100),
		'受管子网绑定、解绑路由',
		NULL
	);
-- 公网IP
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'float_renew',
		121416,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '公网IP' AND ss.parent_id <> '' AND ss.power_sort = 121400),
		'弹性公网IP续费功能',
		NULL
	);
-- 负载均衡
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'load_renew',
		121325,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '负载均衡' AND ss.parent_id <> '' AND ss.power_sort = 121300),
		'负载均衡续费功能',
		NULL
	);
-- VPN
-- 二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'VPN',
		'',
		'',
		121500,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '网络' AND ss.parent_id = ''),
		'VPN',
		''
	);
-- 添加权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'vpn_view',
		121510,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
		'VPN查看功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'创建',
		NULL,
		'vpn_add',
		121511,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
		'VPN创建功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'编辑',
		NULL,
		'vpn_edit',
		121512,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
		'VPN编辑功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除',
		NULL,
		'vpn_drop',
		121513,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
		'VPN删除功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'续费',
		NULL,
		'vpn_renew',
		121514,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = 'VPN' AND ss.parent_id <> '' AND ss.power_sort = 121500),
		'VPN续费功能',
		NULL
	);
-- 新增网络部分权限结束---------------------------

-- 新增费用中心部分权限开始---------------------------
-- 新增一级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'费用中心',
		'',
		'',
		240000,
		'',
		'费用中心',
		''
	);
-- 新增二级目录
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'账户总览',
		'',
		'',
		241000,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '费用中心' AND ss.parent_id = ''),
		'账户总览',
		''
	);
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'费用报表',
		'',
		'',
		241100,
		(SELECT	ss.power_id FROM	sys_selfpower ss	WHERE	ss.power_name = '费用中心' AND ss.parent_id = ''),
		'费用报表',
		''
	);
-- 新增三级目录功能权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'查看',
		NULL,
		'account_view',
		241010,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '账户总览'),
		'账户总览查看',
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
		'report_view',
		241110,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '费用报表'),
		'费用报表查看',
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
	AND p.power_route IN ('account_view','report_view')
);
-- 新增费用中心部分权限结束---------------------------


-- 增加权限-角色关系
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
	AND p.power_route 
	IN 
		('order_list','order_search','order_reorder','order_cancel','order_pay','order_resource',
			'recycle_host_view','recycle_host_reset','recycle_host_drop','recycle_disk_view','recycle_disk_reset',
			'recycle_disk_drop','recycle_snap_view','recycle_snap_reset','recycle_snap_drop','snap_rollback','group_rule_add',
			'group_rule_delete','group_host_add','group_host_delete','firewallrule_enabled','firewall_policy','net_port_view',
			'net_port_add','net_port_edit','net_port_drop','subnet_route','vpn_renew','vpn_add',
			'vpn_edit','vpn_drop',
			'host_renew','disk_renew','net_renew','float_renew','load_renew'
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
		(
			r.role_name = '超级管理员'
			OR r.role_name = '管理员'
			OR r.role_name = '普通用户'
		)
	AND p.power_route IN (
		'host_moreIp','vpn_view'
	)
);

-- 跟产品确认后修改--------------------------------------------------------------------
UPDATE sys_selfpower SET power_name = '删除防火墙'  where power_route = 'firewall_drop';
UPDATE sys_selfpower SET power_name = '删除安全组'  where power_route = 'group_drop';

-- 删除安全组里面的管理规则权限
DELETE FROM sys_selfrolepower WHERE power_id = (SELECT ss.power_id from sys_selfpower ss WHERE ss.power_name ='管理规则');

DELETE FROM sys_selfpower WHERE power_name ='管理规则';

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'导出',
		NULL,
		'account_excel',
		241011,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '账户总览'),
		'账户总览导出',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'导出',
		NULL,
		'report_excel',
		241111,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '费用报表'),
		'费用报表导出',
		NULL
	);
-- 防火墙
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'添加规则',
		NULL,
		'firewallrule_add',
		131017,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
		'防火墙添加规则功能',
		NULL
	);

INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'删除规则',
		NULL,
		'firewallrule_drop',
		131018,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '防火墙' AND ss.parent_id <> '' AND ss.power_sort = 131000),
		'防火墙删除规则功能',
		NULL
	);

-- 增加权限-角色关系
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
	AND p.power_route 
	IN 
		('account_excel','report_excel','firewallrule_add','firewallrule_drop')
);

UPDATE sys_selfpower SET power_name = '禁用/启用规则'  where power_route = 'firewallrule_enabled';


-- 09.06补充云硬盘扩容权限
INSERT INTO `sys_selfpower` (`power_id`,`power_name`,`power_url`,`power_route`,`power_sort`,`parent_id`,`power_desc`,`power_icon`)
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'扩容',
		NULL,
		'disk_setup',
		111119,
		(SELECT ss.power_id FROM sys_selfpower ss WHERE ss.power_name = '云硬盘' AND ss.parent_id <> '' AND ss.power_sort = 111100),
		'云硬盘扩容功能',
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
	AND p.power_route 
	IN 
		('disk_setup')
);