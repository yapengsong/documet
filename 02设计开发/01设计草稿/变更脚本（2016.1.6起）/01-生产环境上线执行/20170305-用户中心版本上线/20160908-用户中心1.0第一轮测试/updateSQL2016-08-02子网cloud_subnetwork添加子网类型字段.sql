--
-- 子网表添加子网类型字段
-- Author: xiang.gao
-- Date: 2016-08-02
--
ALTER TABLE cloud_subnetwork 
ADD subnet_type CHAR (1) DEFAULT NULL COMMENT '0代表自管子网，1代表受管子网';