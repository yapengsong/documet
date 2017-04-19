-- 云硬盘快照表增加字段
ALTER TABLE cloud_disksnapshot CHANGE reserve1 pay_type CHAR (1);

ALTER TABLE cloud_disksnapshot CHANGE reserve2 charge_state CHAR (1);

ALTER TABLE cloud_disksnapshot CHANGE reserve3 is_deleted CHAR (1);

ALTER TABLE cloud_disksnapshot CHANGE reserve4 delete_time datetime;

ALTER TABLE cloud_disksnapshot CHANGE reserve5 delete_user CHAR (50);

ALTER TABLE cloud_disksnapshot ADD snap_type CHAR (1);

ALTER TABLE cloud_disksnapshot ADD is_visable CHAR (1);
