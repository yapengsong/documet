-- 2016-04-05 段彬彬
-- 运维报警信息表增加四个字段
alter table ecmc_alarmmessage add cus_id varchar(32);
alter table ecmc_alarmmessage add prj_id varchar(32);
alter table ecmc_alarmmessage add dc_id varchar(32);
alter table ecmc_alarmmessage add obj_name varchar(100);
-- 运维报警对象表增加一个字段
alter table ecmc_alarmobject add cus_id varchar(32);
alter table ecmc_alarmobject add prj_id varchar(32);
alter table ecmc_alarmobject add dc_id varchar(32);
alter table ecmc_alarmobject add obj_name varchar(100);