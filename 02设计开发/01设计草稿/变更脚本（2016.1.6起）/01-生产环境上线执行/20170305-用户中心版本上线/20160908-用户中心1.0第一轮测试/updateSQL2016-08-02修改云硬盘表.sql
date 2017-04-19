-- ÔÆÓ²ÅÌ±íÔö¼Ó×Ö¶Î
ALTER TABLE cloud_volume ADD pay_type CHAR(1);
ALTER TABLE cloud_volume ADD end_time datetime;
ALTER TABLE cloud_volume ADD charge_state CHAR(1);
ALTER TABLE cloud_volume ADD is_visable CHAR(1);
