--
-- Vpn本端服务数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloud_vpnservice`;
CREATE TABLE `cloud_vpnservice` (
  `vpnservice_id` varchar(100) NOT NULL,
  `vpnservice_name` varchar(100) DEFAULT NULL,
  `vpn_status` varchar(50) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `network_id` varchar(100) DEFAULT NULL,
  `route_id` varchar(100) DEFAULT NULL,
  `subnet_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vpnservice_id`)
)ENGINE=InnoDB;