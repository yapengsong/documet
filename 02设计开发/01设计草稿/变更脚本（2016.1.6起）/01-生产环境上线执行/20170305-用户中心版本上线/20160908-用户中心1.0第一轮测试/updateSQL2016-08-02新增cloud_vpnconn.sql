--
-- Vpn ipsec 站点链接数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloud_vpnconn`;
CREATE TABLE `cloud_vpnconn` (
  `vpn_id` varchar(100) NOT NULL,
  `vpn_name` varchar(50) DEFAULT NULL,
  `vpn_status` varchar(50) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `peer_address` varchar(100) DEFAULT NULL,
  `peer_id` varchar(200) DEFAULT NULL,
  `peer_cidrs` varchar(2000) DEFAULT NULL,
  `psk_key` varchar(80) DEFAULT NULL,
  `mtu` int(9) DEFAULT NULL,
  `dpd_action` varchar(50) DEFAULT NULL,
  `dpd_interval` int(9) DEFAULT NULL,
  `dpd_timeout` int(9) DEFAULT NULL,
  `initiator` varchar(20) DEFAULT NULL,
  `vpnservice_id` varchar(100) DEFAULT NULL,
  `ipsec_id` varchar(100) DEFAULT NULL,
  `ike_id` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `charge_state` char(1) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `is_visible` char(1) DEFAULT NULL,
  PRIMARY KEY (`vpn_id`)
)ENGINE=InnoDB;