--
-- Table structure for table `money_chargerecord`
-- Author: fan.zhang
-- Date: 2016-08-01 17:35:53
--

DROP TABLE IF EXISTS `money_chargerecord`;

CREATE TABLE `money_chargerecord` (
  `cr_id` varchar(32) NOT NULL COMMENT '主键',
  `cr_ordernumber` varchar(20) DEFAULT NULL COMMENT '订单编号',
  `cr_datacenterid` varchar(100) DEFAULT NULL COMMENT '数据中心ID',
  `cr_cusid` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `cr_resourceid` varchar(100) DEFAULT NULL COMMENT '资源ID',
  `cr_resourcetype` varchar(100) DEFAULT NULL COMMENT '资源类型',
  `cr_factors` mediumtext COMMENT '计费因子',
  `cr_chargefrom` datetime DEFAULT NULL COMMENT '开始计费时间',
  `cr_isvalid` char(1) DEFAULT NULL COMMENT '记录是否生效',
  `cr_resourcestatus` char(1) DEFAULT NULL COMMENT '资源状态（0-正常，1-已删除，2-已变配，3-已放入回收站）',
  `cr_changetime` datetime DEFAULT NULL COMMENT '资源状态变更时间',
  PRIMARY KEY (`cr_id`),
  KEY `idx_crcusid` (`cr_cusid`),
  KEY `idx_crresouceid` (`cr_resourceid`),
  KEY `idx_crchargefrom` (`cr_chargefrom`)
) ENGINE=InnoDB COMMENT='计费清单记录表';

