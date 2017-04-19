-- 修改运维报警管理中与云主机id相关的表字段长度，段彬彬
alter table ecmc_alarmmessage modify am_objectid varchar(36) ;
alter table ecmc_alarmobject modify ao_objectid varchar(36) ;