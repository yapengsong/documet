-- 计算1.2ecmc权限新增
UPDATE ecmc_sys_authority
SET permission = 'ui:image_publicimage;\nhttp:/ecmc/cloud/image/getconimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/vm/getallvmsyslist.do;\nhttp:/ecmc/cloud/image/checksavingcount.do;\nhttp:/ecmc/cloud/image/getostypelist.do;'
WHERE
	id = '40289099547b104601547b427a1f0008';


INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'公共镜像_启用',
		'公共镜像启用的权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:publicimage_open;\nhttp:/ecmc/cloud/image/useimage.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'公共镜像_停用',
		'公共镜像停用的权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:publicimage_close;\nhttp:/ecmc/cloud/image/closeimage.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'市场镜像_查看',
		'市场镜像查看权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:image_marketimage;\nhttp:/ecmc/cloud/image/getmarketimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/image/checksavingcount.do;http:/ecmc/cloud/image/getmarkettypelist.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'市场镜像_上传',
		'用于市场镜像的上传',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:marketimage_add;\nhttp:/ecmc/cloud/image/createmarketimage.do;\nhttp:/ecmc/cloud/image/getimageformat.do;\nhttp:/ecmc/cloud/image/checkimagename.do;\nhttp:/ecmc/cloud/vm/getallvmsyslist.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'市场镜像_编辑',
		'用于市场镜像编辑的权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:marketimage_edit;\nhttp:/ecmc/cloud/image/updatemarketimage.do;\nhttp:/ecmc/cloud/image/updatemarketimagedesc.do;\nhttp:/ecmc/cloud/image/checkimagename.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'市场镜像_启用',
		'用于市场镜像的启用',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:marketimage_open;\nhttp:/ecmc/cloud/image/useimage.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'市场镜像_停用',
		'用于市场镜像的停用权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:marketimage_close;\nhttp:/ecmc/cloud/image/closeimage.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'市场镜像_删除',
		'用于市场镜像的删除',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:marketimage_delete;\nhttp:/ecmc/cloud/image/deleteimage.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'未分类镜像_查看',
		'用于未分类镜像的查看权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:image_unclassifiedimage;\nhttp:/ecmc/cloud/image/getunclassifiedimagepagelist.do;\nhttp:/ecmc/cloud/image/getimagebyid.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'未分类镜像_编辑',
		'用于未分类镜像编辑的权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:unclassifiedimage_edit;\nhttp:/ecmc/cloud/image/updateunclassifiedimage.do;\nhttp:/ecmc/cloud/image/checkimagename.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);

INSERT INTO `ecmc_sys_authority`
VALUES
	(
		REPLACE (uuid(), '-', ''),
		'未分类镜像_删除',
		'用于未分类镜像删除的权限',
		NOW(),
		'2c91808256f81c44015702bbf9510000',
		'1',
		'ui:unclassifiedimage_delete;\nhttp:/ecmc/cloud/image/deleteimage.do;',
		(
			SELECT
				men.id
			FROM
				ecmc_sys_menu men
			WHERE
				men. NAME = '云主机'
		),
		'0'
	);




INSERT INTO ecmc_sys_roleauth (id, role_id, auth_id)(
	SELECT
		REPLACE (uuid(), '-', '') AS id,
		r.id AS role_id,
		p.id AS auth_id
	FROM
		ecmc_sys_role r,
		ecmc_sys_authority p
	WHERE
		r. NAME LIKE '%管理员'
	AND p. NAME IN (
		'公共镜像_启用',
		'公共镜像_停用',
		'市场镜像_查看',
		'市场镜像_上传',
		'市场镜像_编辑',
		'市场镜像_删除',
		'市场镜像_启用',
		'市场镜像_停用',
		'未分类镜像_查看',
		'未分类镜像_编辑',
		'未分类镜像_删除'
	)
);

INSERT INTO ecmc_sys_roleauth (id, role_id, auth_id)(
	SELECT
		REPLACE (uuid(), '-', '') AS id,
		r.id AS role_id,
		p.id AS auth_id
	FROM
		ecmc_sys_role r,
		ecmc_sys_authority p
	WHERE
		r. NAME = '运维工程师'
	AND p. NAME IN (
		'市场镜像_查看',
		'市场镜像_上传',
		'市场镜像_编辑',
		'未分类镜像_查看',
		'未分类镜像_编辑'
	)
);





