DROP TABLE IF EXISTS `cloud_portmapping`;
CREATE TABLE `cloud_portmapping` (
  `pm_id` varchar(100) NOT NULL,
  `dc_id` varchar(100) DEFAULT NULL,
  `prj_id` varchar(100) DEFAULT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  `resource_id` varchar(100) DEFAULT NULL,
  `resource_ip` varchar(50) DEFAULT NULL,
  `resource_port` varchar(10) DEFAULT NULL,
  `destiny_id` varchar(100) DEFAULT NULL,
  `destiny_ip` varchar(50) DEFAULT NULL,
  `destiny_port` varchar(10) DEFAULT NULL,
  `create_name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pm_id`)
)ENGINE=InnoDB;