CREATE TABLE `sys_sms` (
  `sms_id` varchar(32) NOT NULL,
  `sms_inserttime` datetime DEFAULT NULL,
  `sms_updatetime` datetime DEFAULT NULL,
  `sms_detail` text DEFAULT NULL,
  `sms_status` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;