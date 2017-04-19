/*为路由信息表添加字段- 2016-01-11 19:10:11 By 周海涛*/
ALTER TABLE cloud_route
ADD COLUMN default_queue_id  varchar(100) NULL AFTER qos_id,
ADD COLUMN filter_queue_id  varchar(100) NULL AFTER default_queue_id;