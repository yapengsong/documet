alter table cloud_grouprule add COLUMN icmp VARCHAR(20) DEFAULT '--';


alter table news_sendinfo add COLUMN is_syssend CHAR(1) DEFAULT '0';


alter table news_sendinfo  modify column cus_id mediumtext; 