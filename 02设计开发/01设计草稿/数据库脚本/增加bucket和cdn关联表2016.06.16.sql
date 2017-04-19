-- 增加bucket和cdn的关联表 段彬彬 2016.06.16
DROP TABLE IF EXISTS `cdn_bucket`;
CREATE TABLE `cdn_bucket` (
  `id` varchar(36) NOT NULL,
  `cdn_provider` varchar(36) DEFAULT NULL,
  `cus_id` varchar(36) DEFAULT NULL,
  `bucket_name` varchar(64) DEFAULT NULL,
  `close_time` datetime DEFAULT NULL,
	`delete_time` datetime DEFAULT NULL,
  `is_opencdn` varchar(10) DEFAULT '0',
  `cdn_status` varchar(10) DEFAULT '0',
  `cdn_path` varchar(255) DEFAULT NULL,
  `domain_id` varchar(36) DEFAULT NULL,
  
  `record_id` varchar(36) DEFAULT NULL,
  `is_delete` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;