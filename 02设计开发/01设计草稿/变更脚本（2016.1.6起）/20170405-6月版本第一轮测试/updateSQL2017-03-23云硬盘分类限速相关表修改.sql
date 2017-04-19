/*
chengxiaodong
云硬盘分类限速qos相关表修改

Date: 2017-03-23 11:26:32
*/


ALTER TABLE api_switch_phone ADD NAME VARCHAR (100);

ALTER TABLE api_switch_phone ADD type CHAR (1);

UPDATE api_switch_phone SET type = '1' WHERE type IS NULL;

ALTER TABLE cloud_volume ADD vol_typeid VARCHAR (100);

ALTER TABLE cloud_volume ADD type_success CHAR (1);

ALTER TABLE cloudorder_volume CHANGE vol_type vol_typeid VARCHAR (100);

ALTER TABLE cloudorder_vm ADD sys_typeid VARCHAR (100);

ALTER TABLE cloudorder_vm ADD data_typeid VARCHAR (100);

ALTER TABLE cloudorder_vm ADD data_disk INT (11);


