alter table dc_datacenter add provinces varchar(20) Null;
UPDATE dc_datacenter set provinces = '北京' WHERE id='1509211142230';
UPDATE dc_datacenter set provinces = '四川' WHERE id='1604271035270';