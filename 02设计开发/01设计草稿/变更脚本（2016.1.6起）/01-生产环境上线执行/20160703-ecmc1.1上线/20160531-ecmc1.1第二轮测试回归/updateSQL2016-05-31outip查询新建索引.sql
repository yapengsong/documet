
-- 2016/05/31  刘金钢 outip查询优化，新增索引--
-- cloud_outip: 

ALTER TABLE `cloud_outip` ADD INDEX idx_ip_id(`ip_id`);

ALTER TABLE `cloud_outip` ADD INDEX idx_used_type(`used_type`);

ALTER TABLE `cloud_outip` ADD INDEX idx_dc_id(`dc_id`);

ALTER TABLE `cloud_outip` ADD INDEX idx_net_id(`net_id`);


-- cloud_floatip

ALTER TABLE `cloud_floatip` ADD INDEX idx_resource_id(`resource_id`);

ALTER TABLE `cloud_floatip` ADD INDEX idx_flo_ip(`flo_ip`);

ALTER TABLE `cloud_floatip` ADD INDEX idx_net_id(`net_id`);

ALTER TABLE `cloud_floatip` ADD INDEX idx_dc_id(`dc_id`);


-- cloud_project

ALTER TABLE `cloud_project` ADD INDEX idx_prj_name(`prj_name`);

ALTER TABLE `cloud_project` ADD INDEX idx_project_id(`prj_id`);


-- sys_selfcustomer

ALTER TABLE `sys_selfcustomer` ADD INDEX idx_cus_org(`cus_org`);


-- cloud_vm

ALTER TABLE `cloud_vm` ADD INDEX idx_vm_id(`vm_id`);

-- dc_datacenter

ALTER TABLE `dc_datacenter` ADD INDEX idx_datacenter_id(`id`);

