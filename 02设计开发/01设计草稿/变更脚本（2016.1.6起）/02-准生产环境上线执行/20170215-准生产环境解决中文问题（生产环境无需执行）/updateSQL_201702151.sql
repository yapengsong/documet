
create table sys_selfrolepower_0215 as select * from sys_selfrolepower;

select * from sys_selfrolepower x where exists (
SELECT
		1
	FROM
		sys_selfrole r,
		sys_selfpower p
	WHERE
		r.role_name = '超级管理员'
	AND p.power_route 
	IN 
		('record_add_new','record_list','record_add_access','record_add_web','record_update_web')
and x.role_id=r.role_id 
and x.power_id=p.power_id
);

delete from sys_selfrolepower where rp_id in (
'998083a85a3bf88f015a3f8a9d61001c',
'998083a85a3bf88f015a3f8a9d61001d',
'998083a85a3bf88f015a3f8a9d61001e',
'998083a85a3bf88f015a3f8a9d61001f',
'998083a85a3bf88f015a3f8a9d620020',
'998083a85a3bf88f015a3f987d79017d',
'998083a85a3bf88f015a3f987d79017e',
'998083a85a3bf88f015a3f987d79017f',
'998083a85a3bf88f015a3f987d790180',
'998083a85a3bf88f015a3f987d790181',
'998083a85a3bf88f015a3fb7d32902df',
'998083a85a3bf88f015a3fb7d32902e0',
'998083a85a3bf88f015a3fb7d32902e1',
'998083a85a3bf88f015a3fb7d32a02e2',
'998083a85a3bf88f015a3fb7d32a02e3',
'998083a85a3bf88f015a405e84c90443',
'998083a85a3bf88f015a405e84ca0444',
'998083a85a3bf88f015a405e84ca0445',
'998083a85a3bf88f015a405e84ca0446',
'998083a85a3bf88f015a405e84ca0447'
);

INSERT INTO sys_selfrolepower (
	rp_id,
	role_id,
	power_id,
	rp_state
)(
	SELECT
		REPLACE (uuid(), '-', '') AS rp_id,
		r.role_id AS role_id,
		p.power_id AS power_id,
		'1' AS rp_state
	FROM
		sys_selfrole r,
		sys_selfpower p
	WHERE
		r.role_name = '超级管理员'
	AND p.power_route 
	IN 
		('record_add_new','record_list','record_add_access','record_add_web','record_update_web')
);