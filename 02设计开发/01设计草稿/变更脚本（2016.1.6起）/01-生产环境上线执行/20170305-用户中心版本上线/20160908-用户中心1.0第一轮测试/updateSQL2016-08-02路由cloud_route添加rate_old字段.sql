--
-- 路由表添加rate_old字段
-- Author: xiang.gao
-- Date: 2016-08-02
--
ALTER TABLE cloud_route 
ADD rate_old INT (9) DEFAULT NULL COMMENT '存储带宽限制前的值';