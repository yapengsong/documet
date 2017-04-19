--
-- 数据中心表添加dns字段
-- Author: 曹翔宇
-- Date: 2016-09-01
--
ALTER TABLE `dc_datacenter`
ADD COLUMN `dc_dns`  VARCHAR(100) DEFAULT NULL COMMENT 'DNS地址';
