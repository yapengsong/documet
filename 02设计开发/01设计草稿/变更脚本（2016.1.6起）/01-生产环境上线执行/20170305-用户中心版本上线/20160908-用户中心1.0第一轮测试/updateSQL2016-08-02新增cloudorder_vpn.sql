--
-- Vpn ipsec 站点链接数据表
-- Author: xiang.gao
-- Date: 2016-08-02
--
DROP TABLE IF EXISTS `cloudorder_vpn`;
CREATE TABLE `cloudorder_vpn` (
  `ordervpn_id` varchar(32) NOT NULL,
  `order_no` varchar(18) DEFAULT NULL,
  `order_type` char(1) DEFAULT NULL,
  `buy_cycle` int(11) DEFAULT NULL,
  `pay_type` char(1) DEFAULT NULL,
  `price` decimal(16,3) DEFAULT NULL,
  `vpn_id` varchar(100) DEFAULT NULL,
  `vpnservice_id` varchar(100) DEFAULT NULL,
  `ike_id` varchar(100) DEFAULT NULL,
  `ipsec_id` varchar(100) DEFAULT NULL,
  `vpn_name` varchar(50) DEFAULT NULL,
  `route_id` varchar(100) DEFAULT NULL,
  `subnet_id` varchar(100) DEFAULT NULL,
  `peer_address` varchar(100) DEFAULT NULL,
  `peer_id` varchar(200) DEFAULT NULL,
  `peer_cidrs` varchar(2000) DEFAULT NULL,
  `mtu` int(11) DEFAULT NULL,
  `dpd_action` varchar(50) DEFAULT NULL,
  `dpd_interval` int(11) DEFAULT NULL,
  `dpd_timeout` int(11) DEFAULT NULL,
  `psk_key` varchar(80) DEFAULT NULL,
  `initiator` varchar(20) DEFAULT NULL,
  `ike_encryption` varchar(10) DEFAULT NULL,
  `ike_version` varchar(10) DEFAULT NULL,
  `ike_auth` varchar(10) DEFAULT NULL,
  `ike_negotiation` varchar(10) DEFAULT NULL,
  `ike_lifetime` int(11) DEFAULT NULL,
  `ike_dh` varchar(10) DEFAULT NULL,
  `ipsec_encryption` varchar(10) DEFAULT NULL,
  `ipsec_protocol` varchar(10) DEFAULT NULL,
  `ipsec_auth` varchar(10) DEFAULT NULL,
  `ipsec_encapsulation` varchar(10) DEFAULT NULL,
  `ipsec_lifetime` int(11) DEFAULT NULL,
  `ipsec_dh` varchar(10) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `cus_id` varchar(100) DEFAULT NULL,
  `network_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ordervpn_id`)
)ENGINE=InnoDB;