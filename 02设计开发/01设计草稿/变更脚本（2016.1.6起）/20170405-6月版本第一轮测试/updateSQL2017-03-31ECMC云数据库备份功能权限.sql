/*
-- Query: select * from ecmc_sys_authority where menu_id='2c9082715a83f280015a83f90e690000' and name like '%备份%'
-- Date: 2017-03-31 11:38
*/
INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('4028908f5a9e93ae015a9e991c3f0000','云数据库_查看备份列表','查看云数据库备份列表','2017-03-05 21:11:58','2c91808256f81c44015702bbf9510000','1','ui:rds_backup_list;\nhttp:/ecmc/rds/backup/getBackups.do;','2c9082715a83f280015a83f90e690000','0');
INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('4028908f5a9f6b0d015aa18a4aa00000','云数据库_创建手动备份','创建手动备份','2017-03-06 10:54:39','2c91808256f81c44015702bbf9510000','1','ui:rds_backup_create;\nhttp:/ecmc/rds/backup/verifyBackupName.do;\nhttp:/ecmc/rds/backup/createBackup.do;','2c9082715a83f280015a83f90e690000','0');
INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('4028908f5aae23ac015aae6330f50000','云数据库_开启自动备份','开启自动备份','2017-03-08 22:47:00','2c91808256f81c44015702bbf9510000','1','ui:rds_autobackup_enable;\nhttp:/ecmc/rds/backup/enableAutomaticBackup.do;','2c9082715a83f280015a83f90e690000','0');
INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('4028908f5aae23ac015aae6383100001','云数据库_关闭自动备份','关闭自动备份','2017-03-08 22:47:21','2c91808256f81c44015702bbf9510000','1','ui:rds_autobackup_disable;\nhttp:/ecmc/rds/backup/disableAutomaticBackup.do;','2c9082715a83f280015a83f90e690000','0');
INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('4028908f5aae23ac015aae6419ff0002','云数据库_修改备份时间','修改自动备份的备份执行时间','2017-03-08 22:48:00','2c91808256f81c44015702bbf9510000','1','ui:rds_backupscheduletime_modify;\nhttp:/ecmc/rds/backup/modifyScheduleTime.do;','2c9082715a83f280015a83f90e690000','0');
INSERT INTO `ecmc_sys_authority` (`id`,`name`,`description`,`createtime`,`createdby`,`enableflag`,`permission`,`menu_id`,`lock`) VALUES ('4028908f5aae23ac015aae649a370003','云数据库_删除备份','删除备份——含自动备份和手动备份','2017-03-08 22:48:33','2c91808256f81c44015702bbf9510000','1','ui:rds_backup_delete;\nhttp:/ecmc/rds/backup/deleteBackup.do;','2c9082715a83f280015a83f90e690000','0');

/*
-- Query: select * from ecmc_sys_roleauth  where auth_id in (select id from ecmc_sys_authority where menu_id='2c9082715a83f280015a83f90e690000' and name like '%备份%')
-- Date: 2017-03-31 11:39
*/
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402890955b195a3b015b19883c070065','40289092543bd6a801543bfee6a8000b','4028908f5a9e93ae015a9e991c3f0000');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402890955b195a3b015b19883c070066','40289092543bd6a801543bfee6a8000b','4028908f5a9f6b0d015aa18a4aa00000');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402890955b195a3b015b19883c070067','40289092543bd6a801543bfee6a8000b','4028908f5aae23ac015aae6330f50000');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402890955b195a3b015b19883c070068','40289092543bd6a801543bfee6a8000b','4028908f5aae23ac015aae6383100001');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402890955b195a3b015b19883c070069','40289092543bd6a801543bfee6a8000b','4028908f5aae23ac015aae6419ff0002');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402899635adaf2ec015adaf7e49e01f6','40289092543bd6a801543bff30f2000c','4028908f5a9e93ae015a9e991c3f0000');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402899635adaf2ec015adaf7e49e01f7','40289092543bd6a801543bff30f2000c','4028908f5a9f6b0d015aa18a4aa00000');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402899635adaf2ec015adaf7e49e01f8','40289092543bd6a801543bff30f2000c','4028908f5aae23ac015aae6330f50000');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402899635adaf2ec015adaf7e49e01f9','40289092543bd6a801543bff30f2000c','4028908f5aae23ac015aae6383100001');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402899635adaf2ec015adaf7e49e01fa','40289092543bd6a801543bff30f2000c','4028908f5aae23ac015aae6419ff0002');
INSERT INTO `ecmc_sys_roleauth` (`id`,`role_id`,`auth_id`) VALUES ('402899635adaf2ec015adaf7e49e01fb','40289092543bd6a801543bff30f2000c','4028908f5aae23ac015aae649a370003');
