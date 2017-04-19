 -- 项目表（cloud_project）结构调整
ALTER TABLE cloud_project 
 ADD COLUMN max_masterinstance DECIMAL (10, 0) NULL AFTER sms_count,
 ADD COLUMN max_slaveofcluster DECIMAL (10, 0) NULL AFTER max_masterinstance,
 ADD COLUMN max_backupbyhand DECIMAL (10, 0) NULL AFTER max_slaveofcluster,
 ADD COLUMN max_backupbyauto DECIMAL (10, 0) NULL AFTER max_backupbyhand,
 ADD COLUMN auto_backuptime VARCHAR (20) NULL AFTER max_backupbyauto;
 
 -- 配额模板表(quota_template)结构调整
 ALTER TABLE quota_template 
 ADD COLUMN max_masterinstance INT (10) NULL AFTER create_time,
 ADD COLUMN max_slaveofcluster INT (10) NULL AFTER max_masterinstance,
 ADD COLUMN max_backupbyhand INT (10) NULL AFTER max_slaveofcluster,
 ADD COLUMN max_backupbyauto INT (10) NULL AFTER max_backupbyhand;
 
 -- 初始化 quota_template 新增字段的值
update  quota_template set max_masterinstance = 0 ,max_slaveofcluster = 3, max_backupbyauto = 3,max_backupbyhand=3;

-- 初始化项目的RDS配额的初始值
update cloud_project set max_masterinstance=0 ,max_slaveofcluster=3 ,max_backupbyhand=3,max_backupbyauto = 3,auto_backuptime ='02:00:00';

-- 工单配额表的修改调整
ALTER TABLE work_quota 
 ADD COLUMN quota_masterinstance INT (10) NULL AFTER quota_portmapping,
 ADD COLUMN quota_slaveinstance INT (10) NULL AFTER quota_masterinstance,
 ADD COLUMN quota_backupbyhand INT (10) NULL AFTER quota_slaveinstance,
 ADD COLUMN quota_backupbyauto INT (10) NULL AFTER quota_backupbyhand;
 
 -- 初始化 work_quota 新增的字段
UPDATE work_quota
SET quota_masterinstance = 0,
 quota_slaveinstance = 0,
 quota_backupbyhand = 0,
 quota_backupbyauto = 0;
 
 -- 添加common_region_url_type字段
ALTER TABLE dc_datacenter ADD COLUMN common_region_url_type VARCHAR (100) NULL AFTER api_dc_code;