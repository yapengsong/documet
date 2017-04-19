--
-- 添加负载均衡订单数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloudorder_ldpool`;
CREATE TABLE `cloudorder_ldpool` (
  `orderpool_id` varchar(32) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) NOT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `pool_id` varchar(100) DEFAULT NULL,
  `pool_name` varchar(100) DEFAULT NULL,
  `connection_limit` decimal(11,0) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `pool_description` varchar(255) DEFAULT NULL,
  `pool_provider` varchar(255) DEFAULT NULL,
  `subnet_id` varchar(200) DEFAULT NULL,
  `pool_protocol` varchar(32) DEFAULT NULL,
  `ld_method` varchar(32) DEFAULT NULL,
  `vip_port` decimal(11,0) DEFAULT NULL,
  `vip_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderpool_id`)
)ENGINE=InnoDB;