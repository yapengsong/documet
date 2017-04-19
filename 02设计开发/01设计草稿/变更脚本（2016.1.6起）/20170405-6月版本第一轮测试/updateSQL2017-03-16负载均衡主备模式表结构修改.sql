/*
cloud_ldpool 增加mode字段
cloud_ldmember	增加role,priority,is_undertaker字段
cloudorder_ldpool 增加mode字段

执行cloud_ldpool历史数据处理

曹翔宇
Date: 2017-03-16 10:41:34
*/

alter table cloud_ldpool add mode char(1);

alter table cloud_ldmember add role varchar(10);
alter table cloud_ldmember add priority int(11);
alter table cloud_ldmember add is_undertaker char(1);

alter table cloudorder_ldpool add mode char(1);





update cloud_ldpool set mode='0' where mode is null;


