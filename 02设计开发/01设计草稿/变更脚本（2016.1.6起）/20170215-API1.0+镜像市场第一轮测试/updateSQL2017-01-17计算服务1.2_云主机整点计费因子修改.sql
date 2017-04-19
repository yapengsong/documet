-- ����֮ǰ����������ƷѵļƷ����ӣ���ִ�� ��updateSQL2017-01-17�������1.2_�Զ��徵�����ʷ���ݴ���.sql����
UPDATE money_chargerecord mc
SET mc.cr_factors = (
	SELECT
		CONCAT(
			'{',
			'"cpuSize":',
			flavor_vcpus,
			',"imageId":"',
			image_id,
			'","number":1',
			',"ramCapacity":',
			floor(flavor_ram / 1024),
			',"sysDiskCapacity":',
			flavor_disk,
			'}'
		)
	FROM
		(
			SELECT
				cv.vm_id,
				cf.flavor_vcpus,
				cf.flavor_ram,
				cf.flavor_disk,
				CASE
			WHEN ci.image_ispublic = '2' THEN
				ci.source_id
			ELSE
				ci.image_id
			END AS image_id
			FROM
				cloud_vm cv
			LEFT JOIN cloud_flavor cf ON cv.flavor_id = cf.flavor_id
			AND cv.dc_id = cf.dc_id
			LEFT JOIN cloud_image ci ON cv.from_imageid = ci.image_id
			WHERE
				cv.is_deleted <> '1'
		) a
	WHERE
		a.vm_id = mc.cr_resourceid
)
WHERE
	cr_isvalid = '1'
AND cr_resourcetype = '0';