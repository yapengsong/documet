DROP TABLE IF EXISTS `sys_selfuser`;
CREATE TABLE `sys_selfuser` (
  `user_id` varchar(32) NOT NULL,
  `user_account` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `user_person` varchar(100) DEFAULT NULL,
  `user_phone` varchar(32) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  `user_sex` char(1) DEFAULT NULL,
  `last_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `user_explain` varchar(32) DEFAULT NULL,
  `user_isemailvalid` char(1) DEFAULT NULL,
  `user_isphonevalid` char(1) DEFAULT NULL,
  `is_admin` char(1) DEFAULT '0' COMMENT '是否是超级管理员',
  `salt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `idx_usercusid` (`cus_id`),
  KEY `idx_useraccount` (`user_account`),
  KEY `idx_userperson` (`user_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_selfuser` ADD INDEX `idx_usercusid` (`cus_id` ASC);
ALTER TABLE `sys_selfuser` ADD INDEX `idx_useraccount` (`user_account` ASC);
ALTER TABLE `sys_selfuser` ADD INDEX `idx_userperson` (`user_person` ASC);

CREATE TABLE `sys_selfuserprj` (
  `userprj_id` varchar(32) NOT NULL,
  `project_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `userprj_desc` varchar(500) DEFAULT NULL,
  `userprj_sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`userprj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_selfuserprj` ADD INDEX `idx_userprjuser` (`user_id` ASC);

CREATE TABLE `sys_selfrole` (
  `role_id` varchar(32) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `role_desc` varchar(500) DEFAULT NULL,
  `role_valid` char(1) DEFAULT NULL,
  `cus_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_selfrole` ADD INDEX `idx_selfrolecusid` (`cus_id` ASC);
ALTER TABLE `sys_selfrole` ADD INDEX `idx_selfrolename` (`role_name` ASC);


CREATE TABLE `sys_selfpower` (
  `power_id` varchar(32) NOT NULL,
  `power_name` varchar(100) DEFAULT NULL,
  `power_url` varchar(100) DEFAULT NULL,
  `power_route` varchar(200) DEFAULT NULL,
  `power_sort` int(10) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `power_desc` varchar(500) DEFAULT NULL,
  `power_icon` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_selfpower` ADD INDEX `idx_selfpowerparentid` (`parent_id` ASC);
ALTER TABLE `sys_selfpower` ADD INDEX `idx_selfpowerroute` (`power_route` ASC);
ALTER TABLE `sys_selfpower` ADD INDEX `idx_selfpowername` (`power_name` ASC);

CREATE TABLE `sys_selfrolepower` (
  `rp_id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `power_id` varchar(32) DEFAULT NULL,
  `rp_desc` varchar(500) DEFAULT NULL,
  `rp_sort` int(10) DEFAULT NULL,
  `rp_state` char(1) DEFAULT NULL,
  PRIMARY KEY (`rp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_selfrolepower` ADD INDEX `idx_power` (`role_id` ASC, `power_id` ASC);


-- ----------------------------
-- Table structure for sys_phoneverify
-- ----------------------------
DROP TABLE IF EXISTS `sys_phoneverify`;
CREATE TABLE `sys_phoneverify` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户id',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `phone_code` varchar(255) DEFAULT NULL COMMENT '短信验证码',
  `invalid_time` datetime DEFAULT NULL COMMENT '失效时间',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_verify` char(1) DEFAULT NULL COMMENT '是否已使用',
  `verify_time` datetime DEFAULT NULL COMMENT '校验时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table structure for sys_mailverify
-- ----------------------------
DROP TABLE IF EXISTS `sys_mailverify`;
CREATE TABLE `sys_mailverify` (
  `id` varchar(255) NOT NULL COMMENT '主键',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户id',
  `email` varchar(255) DEFAULT NULL COMMENT '验证邮箱',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `verify_time` datetime DEFAULT NULL COMMENT '验证时间',
  `invalid_time` datetime DEFAULT NULL COMMENT '失效时间',
  `is_verify` char(1) DEFAULT NULL COMMENT '是否已验证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;












