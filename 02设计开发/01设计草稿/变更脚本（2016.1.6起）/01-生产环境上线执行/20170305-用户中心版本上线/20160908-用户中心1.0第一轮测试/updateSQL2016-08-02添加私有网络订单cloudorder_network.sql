--
--
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloudorder_network`;
CREATE TABLE `cloudorder_network` (
  `ordernetwork_id` varchar(32) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) NOT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `net_id` varchar(100) DEFAULT NULL,
  `net_name` varchar(100) DEFAULT NULL,
  `rate` int(9) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `cus_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`ordernetwork_id`)
)ENGINE=InnoDB;

