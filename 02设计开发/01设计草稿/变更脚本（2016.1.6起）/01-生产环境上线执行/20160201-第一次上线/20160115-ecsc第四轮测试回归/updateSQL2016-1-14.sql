/* 创建AccessKey表- 2016-01-13 17:46:11 By 曹翔宇*/
CREATE TABLE `obs_accesskey` (
  `ak_id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `access_key` varchar(50) DEFAULT NULL,
  `secret_key` varchar(50) DEFAULT NULL,
  `acck_state` varchar(1) DEFAULT NULL,
  `acck_isshow` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `is_default` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ak_id`),
  KEY `idx_obsak` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*
创建对象存储用户表  by曹翔宇

Date: 2016-01-13 18:05:14
*/

CREATE TABLE `obs_user` (
  `user_id` varchar(32) NOT NULL,
  `display_name` varchar(50) NOT NULL,
  `suspended` varchar(20) DEFAULT NULL,
  `cus_id` varchar(50) DEFAULT NULL,
  `max_buckets` int(20) DEFAULT NULL,
  `subusers` varchar(100) DEFAULT NULL,
  `swift_keys` varchar(100) DEFAULT NULL,
  `caps` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idx_obsuser` (`cus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*
创建客户开通功能表  by曹翔宇

Date: 2016-01-13 18:05:14
*/

CREATE TABLE `cus_service_state` (
  `cs_id` varchar(32) NOT NULL DEFAULT '',
  `cus_id` varchar(50) DEFAULT NULL,
  `obs_state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cs_id`),
  KEY `idx_cussers` (`cus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;