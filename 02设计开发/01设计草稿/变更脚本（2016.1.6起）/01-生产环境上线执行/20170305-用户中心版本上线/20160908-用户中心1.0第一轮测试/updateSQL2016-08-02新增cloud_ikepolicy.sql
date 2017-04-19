--
-- Vpn ike策略数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloud_vpnikepolicy`;
CREATE TABLE `cloud_vpnikepolicy` (
  `ike_id` varchar(100) NOT NULL,
  `ike_name` varchar(50) DEFAULT NULL,
  `ike_version` varchar(10) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `auth_algorithm` varchar(10) DEFAULT NULL,
  `encryption_algorithm` varchar(10) DEFAULT NULL,
  `negotiation_mode` varchar(10) DEFAULT NULL,
  `lifetime_value` int(9) DEFAULT NULL,
  `dh_algorithm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ike_id`)
)ENGINE=InnoDB;