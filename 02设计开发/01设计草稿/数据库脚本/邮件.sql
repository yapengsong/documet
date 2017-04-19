CREATE TABLE `sys_mail` (
  `mail_id` varchar(32) NOT NULL,
  `mail_inserttime` datetime DEFAULT NULL,
  `mail_updatetime` datetime DEFAULT NULL,
  `mail_detail` text DEFAULT NULL,
  `mail_status` char(1) DEFAULT NULL,
  `mail_cause` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





