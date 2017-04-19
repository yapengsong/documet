-- 云主机的权限调整
update sys_selfpower set power_name ='重启云主机',power_desc='重启云主机' where power_id ='18b111e2998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='升级配置',power_desc='升级配置' where power_id ='292e1b46998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='绑定公网IP',power_desc='绑定公网IP' where power_id ='36ce9848998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='解绑公网IP',power_desc='解绑公网IP' where power_id ='3a053652998511e5a260001a4a7ae4d4';

delete from sys_selfpower where power_id ='1c5b70f8998511e5a260001a4a7ae4d4';
delete from sys_selfpower where power_id ='221a95e6998511e5a260001a4a7ae4d4';

INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)VALUES(REPLACE (uuid(), '-', ''),'挂载云硬盘','host_bindVolume',111028,'87bdd9c67c5711e58542001a4a7ae4d4','挂载云硬盘');
INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)VALUES(REPLACE (uuid(), '-', ''),'查看监控','host_showMonitor',111029,'87bdd9c67c5711e58542001a4a7ae4d4','查看监控');

INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state)(SELECT REPLACE (uuid(), '-', '') AS rp_id,r.role_id AS role_id,p.power_id AS power_id,'1' AS rp_state FROM sys_selfrole r, sys_selfpower p WHERE (r.role_name = '超级管理员' or r.role_name ='管理员')AND p.power_route IN ('host_bindVolume','host_showMonitor'));
INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state)(SELECT REPLACE (uuid(), '-', '') AS rp_id,r.role_id AS role_id,p.power_id AS power_id,'1' AS rp_state FROM sys_selfrole r, sys_selfpower p WHERE (r.role_name = '普通用户')AND p.power_route IN ('host_showMonitor'));

delete from sys_selfrolepower where power_id ='1c5b70f8998511e5a260001a4a7ae4d4';
delete from sys_selfrolepower where power_id ='221a95e6998511e5a260001a4a7ae4d4';