-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)


DROP TABLE IF EXISTS `cloud_rdsbackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_rdsbackup` (
  `backup_id` varchar(100) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `instance_id` varchar(64) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `config_id` varchar(100) DEFAULT NULL,
  `version_id` varchar(100) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `location_ref` text,
  `datacenter_id` varchar(64) DEFAULT NULL,
  `project_id` varchar(100) DEFAULT NULL,
  `is_visible` char(1) DEFAULT NULL,
  `instance_exist` char(1) DEFAULT NULL,
  `instance_deletetime` datetime DEFAULT NULL,
  PRIMARY KEY (`backup_id`),
  KEY `idx_instanceid` (`instance_id`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup table of cloud rds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cloud_rdsbackupschedule`
--

DROP TABLE IF EXISTS `cloud_rdsbackupschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_rdsbackupschedule` (
  `id` varchar(32) NOT NULL,
  `instance_id` varchar(64) DEFAULT NULL,
  `up_time` datetime DEFAULT NULL,
  `off_time` datetime DEFAULT NULL,
  `is_enabled` char(1) DEFAULT NULL,
  `schedule_time` varchar(20) DEFAULT NULL,
  `datacenter_id` varchar(64) DEFAULT NULL,
  `project_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_instanceid` (`instance_id`),
  KEY `idx_uptime` (`up_time`),
  KEY `idx_datacenterid` (`datacenter_id`),
  KEY `idx_projectid` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='云数据库备份计划表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-09 10:45:35
