-- ��������Ȩ�޵���
update sys_selfpower set power_name ='����������',power_desc='����������' where power_id ='18b111e2998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='��������',power_desc='��������' where power_id ='292e1b46998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='�󶨹���IP',power_desc='�󶨹���IP' where power_id ='36ce9848998511e5a260001a4a7ae4d4';

update sys_selfpower set power_name ='�����IP',power_desc='�����IP' where power_id ='3a053652998511e5a260001a4a7ae4d4';

delete from sys_selfpower where power_id ='1c5b70f8998511e5a260001a4a7ae4d4';
delete from sys_selfpower where power_id ='221a95e6998511e5a260001a4a7ae4d4';

INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)VALUES(REPLACE (uuid(), '-', ''),'������Ӳ��','host_bindVolume',111028,'87bdd9c67c5711e58542001a4a7ae4d4','������Ӳ��');
INSERT INTO sys_selfpower (power_id,power_name,power_route,power_sort,parent_id,power_desc)VALUES(REPLACE (uuid(), '-', ''),'�鿴���','host_showMonitor',111029,'87bdd9c67c5711e58542001a4a7ae4d4','�鿴���');

INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state)(SELECT REPLACE (uuid(), '-', '') AS rp_id,r.role_id AS role_id,p.power_id AS power_id,'1' AS rp_state FROM sys_selfrole r, sys_selfpower p WHERE (r.role_name = '��������Ա' or r.role_name ='����Ա')AND p.power_route IN ('host_bindVolume','host_showMonitor'));
INSERT INTO sys_selfrolepower (rp_id,role_id,power_id,rp_state)(SELECT REPLACE (uuid(), '-', '') AS rp_id,r.role_id AS role_id,p.power_id AS power_id,'1' AS rp_state FROM sys_selfrole r, sys_selfpower p WHERE (r.role_name = '��ͨ�û�')AND p.power_route IN ('host_showMonitor'));

delete from sys_selfrolepower where power_id ='1c5b70f8998511e5a260001a4a7ae4d4';
delete from sys_selfrolepower where power_id ='221a95e6998511e5a260001a4a7ae4d4';