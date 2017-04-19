--
-- 添加弹性公网IP订单数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloudorder_floatip`;
CREATE TABLE `cloudorder_floatip` (
  `cof_id` varchar(32) NOT NULL,
  `flo_id` varchar(2000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(32) DEFAULT NULL,
  `dc_id` varchar(32) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL,
  `cre_user` varchar(32) DEFAULT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cof_id`)
)ENGINE=InnoDB;