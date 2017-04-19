/*
 SELECT table_name, table_type, engine FROM information_schema.tables where table_schema='eayuncloud' and engine<>'InnoDB';
*/
alter table cloud_area engine=innodb;