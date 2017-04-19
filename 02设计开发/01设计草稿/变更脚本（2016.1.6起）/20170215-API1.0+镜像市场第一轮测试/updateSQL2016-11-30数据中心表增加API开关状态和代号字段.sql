-- 数据中心增加两个字段，API状态和API代号
ALTER TABLE dc_datacenter ADD COLUMN api_status CHAR(1) default 1;
ALTER TABLE dc_datacenter ADD COLUMN api_dc_code VARCHAR(255);