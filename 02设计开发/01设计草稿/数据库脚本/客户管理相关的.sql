alter   table   sys_selfcustomer   add   cus_org   VARCHAR(32);
alter   table   cloud_project  add   quota_pool   decimal(10,0) DEFAULT 0;
alter   table   cloud_project   add   is_haswork  VARCHAR(1);
alter   table   cloud_project   add   count_band  decimal(10,0) DEFAULT 0;
alter   table   cloud_project   add   count_vpn   decimal(10,0) DEFAULT 0;
alter   table   cloud_project   drop column   belong_org;
