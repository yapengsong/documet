-- 网络1.1升级数据结构调整和数据初始化处理

-- 添加处理cloud_floatip的表结构
ALTER TABLE `cloud_floatip`
CHANGE COLUMN `vm_id` `resource_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `dc_id`,
ADD COLUMN `resource_type`  varchar(100) NULL AFTER `reserve5`,
ADD COLUMN `delete_time`  datetime NULL AFTER `resource_type`,
ADD COLUMN `is_deleted`  char(1) NULL AFTER `delete_time`;

ALTER TABLE `cloud_ldmonitor`
ADD COLUMN `ldm_name`  varchar(100) NULL AFTER `reserve1`;

-- 对历史数据 处理
update cloud_floatip set is_deleted = '0';
update cloud_floatip set resource_type = 'vm' where resource_id is not null;

-- 添加处理cloud_ldvip的表结构 port_id
ALTER TABLE `cloud_ldvip`
ADD COLUMN `port_id`  varchar(100) NULL AFTER `vip_address`;
-- 添加处理cloud_ldmember的表结构 vm_id
ALTER TABLE `cloud_ldmember`
ADD COLUMN `vm_id`  varchar(100) NULL AFTER `reserve3`;

 -- 健康检查名称  历史数据处理
 update cloud_ldmonitor set ldm_name = concat('monitor_',left(ldm_id,8)) where ldm_name is null ;
 
 -- 云主机IP处理（fixed:xxx.xxx.xxx.xxx）变为 xxx.xxx.xxx.xxx
 update cloud_vm set vm_ip = substr(vm_ip,7) where vm_ip like 'fixed:%';
 
-- 处理以前的成员信息的vm_id （主机正常存在的）
UPDATE cloud_ldmember AS m
inner join cloud_vm v 
SET m.vm_id = v.vm_id
WHERE m.vm_id IS NULL
and v.vm_ip = m.member_address
and v.prj_id = m.prj_id 
and v.is_deleted ='0' ;

-- （主机已删除的，垃圾数据 ） 线上环境 只有运维项目下存在两个这样的数据（ 需要手动清除）
UPDATE cloud_ldmember AS m
inner join cloud_vm v 
SET m.vm_id = v.vm_id
WHERE m.vm_id IS NULL
and v.vm_ip = m.member_address
and v.prj_id = m.prj_id 
and v.is_deleted ='1' ;