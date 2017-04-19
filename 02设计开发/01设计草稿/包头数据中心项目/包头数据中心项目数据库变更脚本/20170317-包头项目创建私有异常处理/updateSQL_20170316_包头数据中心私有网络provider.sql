-- 包头数据中心的net_provider 和 network_type 
ALTER TABLE dc_datacenter ADD COLUMN net_provider VARCHAR (100) NULL AFTER api_dc_code,
 ADD COLUMN network_type VARCHAR (50) NULL AFTER net_provider ;