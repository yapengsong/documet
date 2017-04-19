-- 数据库表

CREATE TABLE `cloud_rdsdatabase` (
  `database_id` varchar(100) NOT NULL,
  `database_name` varchar(64) NOT NULL,
  `instance_id` varchar(100) NOT NULL,
  `prj_id` varchar(100) NOT NULL,
  `dc_id` varchar(100) NOT NULL,
  `character_set` varchar(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`database_id`),
  KEY `Idx_instanceid` (`instance_id`),
  KEY `Idx_prjid` (`prj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 账户表

CREATE TABLE `cloud_rdsdbaccount` (
  `account_id` varchar(100) NOT NULL,
  `account_name` varchar(20) NOT NULL,
  `instance_id` varchar(100) NOT NULL,
  `prj_id` varchar(100) NOT NULL,
  `dc_id` varchar(100) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `Idx_instanceid` (`instance_id`),
  KEY `Idx_prjid` (`prj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据库账户关系表

CREATE TABLE `cloud_rdsdbaccountrelation` (
  `relation_id` varchar(100) NOT NULL,
  `account_id` varchar(100) NOT NULL,
  `database_id` varchar(100) NOT NULL,
  PRIMARY KEY (`relation_id`),
  KEY `Idx_accountid` (`account_id`),
  KEY `Idx_databaseid` (`database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;