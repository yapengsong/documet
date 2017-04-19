--
-- 负载均衡添加计费相关字段
-- Author: xiang.gao
-- Date: 2016-08-02
--
ALTER TABLE cloud_ldpool ADD pay_type CHAR (1) DEFAULT NULL COMMENT '1代表预付费，2代表后付费';
ALTER TABLE cloud_ldpool ADD charge_state CHAR (1) DEFAULT NULL COMMENT '0代表正常，1代表余额不足，2代表已到期，3代表停服务';
ALTER TABLE cloud_ldpool ADD end_time datetime DEFAULT NULL COMMENT '针对预付费的到期时间';
ALTER TABLE cloud_ldpool ADD is_visible CHAR(1) DEFAULT NULL COMMENT '是否展示资源给用户，1展示，0不展示';