-- ��Ŀ�����ӻ���λ���ֶ�  --����
ALTER TABLE `cloud_project`
ADD COLUMN `cabinet_id`  varchar(100) NULL COMMENT '����ID',
ADD COLUMN `sms_count`  int(10) default 0 NULL COMMENT '��������' ;