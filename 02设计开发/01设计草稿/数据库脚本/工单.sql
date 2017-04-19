alter   table   workorder   add   work_email   VARCHAR(255);
alter   table   workorder   add   work_phone_time   VARCHAR(32);
alter   table   workorder   add   work_complain   VARCHAR(32);
alter   table   workorder   add   work_falg   VARCHAR(32);
alter   table   workorder   add   work_highly   VARCHAR(32);
alter   table   workorder   add   work_state   VARCHAR(1);
alter   table   workorder_assess   add   flow_complain   VARCHAR(32);
alter   table   workorder_assess   add   flow_state   VARCHAR(32);
alter   table   workorder_assess   add   flow_cre_time  datetime;
alter   table   work_opinion  add   opinion_state   VARCHAR(1);
alter table work_opinion alter column opinion_content varchar(12000) 
CREATE TABLE `work_file` (
  `file_id` varchar(32) NOT NULL COMMENT '业务id',
  `opinion_id` varchar(32) DEFAULT NULL COMMENT '工单id',
  `sacc_id` varchar(32) DEFAULT NULL COMMENT '附件id',
  
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
CREATE TABLE `work_quota` (
  `quota_id` varchar(32) NOT NULL,
  `work_id` varchar(32) NOT NULL,
  `prj_id` varchar(32) NOT NULL,
  `quota_vm` int(11) DEFAULT NULL,
  `quota_cpu` int(11) DEFAULT NULL,
  `quota_memory` decimal(10,0) DEFAULT NULL,
  `quota_disk` int(11) DEFAULT NULL,
  `quota_snapshot` int(11) DEFAULT NULL,
  `quota_diskshot` decimal(10,0) DEFAULT NULL,
  `quota_band` int(11) DEFAULT NULL,
  `quota_vpn` int(11) DEFAULT NULL,
  `quota_net` int(11) DEFAULT NULL,
  `quota_subnet` int(11) DEFAULT NULL,
  `quota_firewall` int(11) DEFAULT NULL,
  `quota_route` int(11) DEFAULT NULL,
  `quota_secgroup` int(11) DEFAULT NULL,
  `quota_floatip` int(11) DEFAULT NULL,
  `quota_balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`quota_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
