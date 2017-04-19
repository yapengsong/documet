INSERT INTO unit_web_datacenter (
	id,
	web_id,
	dc_id,
	webservice,
	ip
)(
	SELECT
		REPLACE (uuid(), '-', '') AS id,
		web.web_id AS web_id,
		web.dc_id AS dc_id,
		web.web_service AS webservice,
		web.service_ip AS ip
	FROM
		website_info web
);

alter table website_info  modify column domain_name varchar(2000);
alter table website_info modify dc_id varchar(32) null;
alter table website_info modify web_service varchar(32) null;
alter table website_info modify service_ip varchar(20) null;
alter table website_info  modify column domain_url varchar(2000);