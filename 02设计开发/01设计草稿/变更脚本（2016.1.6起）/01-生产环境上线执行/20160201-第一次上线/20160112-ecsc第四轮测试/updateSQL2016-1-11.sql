/*Ϊ·����Ϣ������ֶ�- 2016-01-11 19:10:11 By �ܺ���*/
ALTER TABLE cloud_route
ADD COLUMN default_queue_id  varchar(100) NULL AFTER qos_id,
ADD COLUMN filter_queue_id  varchar(100) NULL AFTER default_queue_id;