/*
chengxiaodong
新增云硬盘分类限速qos权限

Date: 2017-03-23 11:26:32
*/


UPDATE ecmc_sys_menu
SET `name` = '操作验证管理',
 url = 'app.phoneverify',
 icon = ' eayunfont ef-operational'
WHERE
	id = '4028909958be99a30158bea8df9a0003'
AND url = 'app.apimanage';


INSERT INTO `ecmc_sys_menu`
VALUES
	(
		'2c9082eb5a59735f015a598975150000',
		'硬盘分类限速',
		NULL,
		'app.volumetype',
		'ff8080815438ac44015438c14b110006',
		'80',
		'2017-02-20 11:21:05',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'eayunfont ef-speed-limit',
		'0'
	);

INSERT INTO `ecmc_sys_rolemenu`
VALUES
	(
		'402890915aa40fe0015aa414bdc40027',
		'40289092543bd6a801543bfee6a8000b',
		'2c9082eb5a59735f015a598975150000'
	);

INSERT INTO `ecmc_sys_rolemenu`
VALUES
	(
		'4028908f5a9f6b0d015aa18aa14f0002',
		'40289092543bd6a801543bff30f2000c',
		'2c9082eb5a59735f015a598975150000'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6ea2e6015a6ed974eb0000',
		'查看云硬盘分类操作验证',
		NULL,
		'2017-02-24 14:40:29',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:type_phone;\nhttp:/ecmc/verify/volumetype/getvolumetypephone.do;',
		'4028909958be99a30158bea8df9a0003',
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6ea2e6015a6eda80860001',
		'修改云硬盘分类操作验证',
		NULL,
		'2017-02-24 14:41:37',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:edit_voltype_phone;\nhttp:/ecmc/verify/volumetype/sendvolumetypephonecode.do;\nhttp:/ecmc/verify/volumetype/editvolumetypephone.do;\nhttp:/ecmc/verify/volumetype/editvolumetypeperson.do;',
		'4028909958be99a30158bea8df9a0003',
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6377bc015a63cd6b4c0001',
		'云硬盘类型查询',
		NULL,
		'2017-02-22 11:11:31',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:volumetype_query;\nhttp:/ecmc/cloud/volumetype/getvolumetypelist.do;\nhttp:/ecmc/verify/volumetype/ischeckedphone.do;',
		'2c9082eb5a59735f015a598975150000',
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6a3d43015a6a4854160000',
		'获取操作权限',
		NULL,
		'2017-02-23 17:23:29',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:volumetype_phone;\nhttp:/ecmc/verify/volumetype/getvolumetypephone.do;\nhttp:/ecmc/verify/volumetype/getcodeforvolumetype.do;\nhttp:/ecmc/verify/volumetype/checkvolumephonecode.do;',
		'2c9082eb5a59735f015a598975150000',
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6b5038015a6b52ed5f0000',
		'编辑云硬盘类型',
		NULL,
		'2017-02-23 22:14:41',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:volumetype_edit;\nhttp:/ecmc/cloud/volumetype/updatetype.do;',
		'2c9082eb5a59735f015a598975150000',
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6ea2e6015a6f16e22d0002',
		'启用云硬盘类型',
		NULL,
		'2017-02-24 15:47:35',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:volumetype_open;\nhttp:/ecmc/cloud/volumetype/changeuse.do;',
		'2c9082eb5a59735f015a598975150000',
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		'402890915a6ea2e6015a6f1899dc0003',
		'停用云硬盘类型',
		NULL,
		'2017-02-24 15:49:27',
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:volumetype_close;\nhttp:/ecmc/cloud/volumetype/changeuse.do;',
		'2c9082eb5a59735f015a598975150000',
		'0'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'823c8e76fa5e11e6b8cb001a4a7ae4d4',
		'40288ee75456549a015456b8df2e000d',
		'402890915a6ea2e6015a6ed974eb0000'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'8239856efa5e11e6b8cb001a4a7ae4d4',
		'40288ee75456549a015456b8df2e000d',
		'402890915a6ea2e6015a6eda80860001'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'402890915aa40fe0015aa414bdda00e2',
		'40289092543bd6a801543bfee6a8000b',
		'402890915a6377bc015a63cd6b4c0001'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'4028908f5a9f6b0d015aa18aa1590096',
		'40289092543bd6a801543bff30f2000c',
		'402890915a6377bc015a63cd6b4c0001'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'4028908f5a9f6b0d015aa18aa1590097',
		'40289092543bd6a801543bff30f2000c',
		'402890915a6a3d43015a6a4854160000'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'4028908f5a9f6b0d015aa18aa1590098',
		'40289092543bd6a801543bff30f2000c',
		'402890915a6b5038015a6b52ed5f0000'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'4028908f5a9f6b0d015aa18aa1590099',
		'40289092543bd6a801543bff30f2000c',
		'402890915a6ea2e6015a6f16e22d0002'
	);

INSERT INTO `ecmc_sys_roleauth`
VALUES
	(
		'4028908f5a9f6b0d015aa18aa159009a',
		'40289092543bd6a801543bff30f2000c',
		'402890915a6ea2e6015a6f1899dc0003'
	);

