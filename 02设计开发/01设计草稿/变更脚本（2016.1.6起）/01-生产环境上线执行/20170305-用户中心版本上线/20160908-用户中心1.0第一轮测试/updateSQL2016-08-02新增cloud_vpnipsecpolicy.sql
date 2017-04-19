--
-- Vpn Ipsec策略数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloud_vpnipsecpolicy`;
CREATE TABLE `cloud_vpnipsecpolicy` (
  `ipsec_id` varchar(100) NOT NULL,
  `ipsec_name` varchar(50) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `transform_protocol` varchar(10) DEFAULT NULL,
  `auth_algorithm` varchar(10) DEFAULT NULL,
  `encapsulation_mode` varchar(10) DEFAULT NULL,
  `encryption_algorithm` varchar(10) DEFAULT NULL,
  `lifetime_value` int(9) DEFAULT NULL,
  `dh_algorithm` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ipsec_id`)
)ENGINE=InnoDB;