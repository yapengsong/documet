-- Ìí¼Ódns×Ö¶Î
ALTER TABLE cloud_subnetwork ADD COLUMN dns  varchar(100) NULL AFTER out_label_rule_id;

update cloud_subnetwork set dns = '114.114.114.114' ;