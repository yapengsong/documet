-- 2016-03-01 网络改造路由与私有网络之间的关联 周海涛
ALTER TABLE `cloud_route` ADD COLUMN `network_id`  varchar(100) NULL AFTER `filter_queue_id`;

