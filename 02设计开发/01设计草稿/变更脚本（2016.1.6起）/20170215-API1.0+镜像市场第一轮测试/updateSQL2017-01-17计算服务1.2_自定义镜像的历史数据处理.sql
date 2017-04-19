-- �����Զ��徵���source_id ������ ����Ҫ���ִ�У�ֱ���޸Ĵ���Ϊ�㣩
UPDATE cloud_image i
SET i.source_id = (
	SELECT
		a.image_id
	FROM
		(
			SELECT
				cv.vm_id,
				cv.from_imageid,
				CASE
			WHEN ci.image_ispublic = '2' THEN
				ci.source_id
			ELSE
				ci.image_id
			END AS image_id
			FROM
				cloud_vm cv
			LEFT JOIN cloud_image ci ON ci.image_id = cv.from_imageid
		) AS a
	WHERE
		a.vm_id = i.from_vmid
)
WHERE
	image_ispublic = '2';