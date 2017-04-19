CREATE TABLE `sys_taggroup` (
  `tgrp_id` varchar(32) NOT NULL,
  `tgrp_name` varchar(64) DEFAULT NULL,
  `tgrp_abbr` varchar(32) DEFAULT NULL,
  `tgrp_description` varchar(100) DEFAULT NULL,
  `tgrp_enabled` char(1) DEFAULT NULL,
  `tgrp_unique` char(1) DEFAULT NULL,
  `tgrp_creatorid` varchar(32) DEFAULT NULL,
  `tgrp_createdate` datetime DEFAULT NULL,
  `tgrp_cusid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tgrp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_taggroup` ADD INDEX `idx_tgrpcusid` (`tgrp_cusid` ASC);
ALTER TABLE `sys_taggroup` modify column `tgrp_description` varchar(200) ;


CREATE TABLE `sys_tag` (
  `tg_id` varchar(32) NOT NULL,
  `tg_groupid` varchar(32) DEFAULT NULL,
  `tg_name` varchar(64) DEFAULT NULL,
  `tg_description` varchar(100) DEFAULT NULL,
  `tg_creatorid` varchar(32) DEFAULT NULL,
  `tg_createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`tg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_tag` ADD INDEX `idx_tggroupid` (`tg_groupid` ASC);
ALTER TABLE `sys_tag` modify column `tg_description` varchar(200);

CREATE TABLE `sys_tagresource` (
  `tgres_id` varchar(32) NOT NULL,
  `tgres_resourceid` varchar(64) DEFAULT NULL,
  `tgres_tagid` varchar(32) DEFAULT NULL,
  `tgres_projectid` varchar(32) DEFAULT NULL,
  `tgres_resourcetype` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tgres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

ALTER TABLE `sys_tagresource` ADD INDEX `idx_resouceid` (`tgres_resourceid` ASC);
ALTER TABLE `sys_tagresource` ADD INDEX `idx_tagid` (`tgres_tagid` ASC);
ALTER TABLE `sys_tagresource` ADD INDEX `idx_projectid` (`tgres_projectid` ASC);
ALTER TABLE `sys_tagresource` ADD INDEX `idx_resourcetype` (`tgres_resourcetype` ASC);

alter table sys_taggroup add tgrp_restype VARCHAR(32);










