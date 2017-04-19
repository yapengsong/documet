-- ����1.1�������ݽṹ���������ݳ�ʼ������

-- ��Ӵ���cloud_floatip�ı�ṹ
ALTER TABLE `cloud_floatip`
CHANGE COLUMN `vm_id` `resource_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `dc_id`,
ADD COLUMN `resource_type`  varchar(100) NULL AFTER `reserve5`,
ADD COLUMN `delete_time`  datetime NULL AFTER `resource_type`,
ADD COLUMN `is_deleted`  char(1) NULL AFTER `delete_time`;

ALTER TABLE `cloud_ldmonitor`
ADD COLUMN `ldm_name`  varchar(100) NULL AFTER `reserve1`;

-- ����ʷ���� ����
update cloud_floatip set is_deleted = '0';
update cloud_floatip set resource_type = 'vm' where resource_id is not null;

-- ��Ӵ���cloud_ldvip�ı�ṹ port_id
ALTER TABLE `cloud_ldvip`
ADD COLUMN `port_id`  varchar(100) NULL AFTER `vip_address`;
-- ��Ӵ���cloud_ldmember�ı�ṹ vm_id
ALTER TABLE `cloud_ldmember`
ADD COLUMN `vm_id`  varchar(100) NULL AFTER `reserve3`;

 -- �����������  ��ʷ���ݴ���
 update cloud_ldmonitor set ldm_name = concat('monitor_',left(ldm_id,8)) where ldm_name is null ;
 
 -- ������IP����fixed:xxx.xxx.xxx.xxx����Ϊ xxx.xxx.xxx.xxx
 update cloud_vm set vm_ip = substr(vm_ip,7) where vm_ip like 'fixed:%';
 
-- ������ǰ�ĳ�Ա��Ϣ��vm_id �������������ڵģ�
UPDATE cloud_ldmember AS m
inner join cloud_vm v 
SET m.vm_id = v.vm_id
WHERE m.vm_id IS NULL
and v.vm_ip = m.member_address
and v.prj_id = m.prj_id 
and v.is_deleted ='0' ;

-- ��������ɾ���ģ��������� �� ���ϻ��� ֻ����ά��Ŀ�´����������������ݣ� ��Ҫ�ֶ������
UPDATE cloud_ldmember AS m
inner join cloud_vm v 
SET m.vm_id = v.vm_id
WHERE m.vm_id IS NULL
and v.vm_ip = m.member_address
and v.prj_id = m.prj_id 
and v.is_deleted ='1' ;