-- SELECT * FROM sys_data_tree WHERE parent_id = '0007002002001';
-- 首先，将原来windows下的Windows 2008类型名称改为"Windows 2008 标准版"
-- 再在windows下新增两条记录"Windows 2008 企业版"和"Windows 2008 数据中心版"
UPDATE sys_data_tree SET node_name = 'Windows 2008 标准版' ,node_name_en = '2008StandardCount' WHERE node_id = '0007002002001002' AND parent_id = '0007002002001';
INSERT INTO `sys_data_tree` VALUES ('0007002002001004', 'Windows 2008 企业版', '0007002002001', '4', '0', null, '1', null, null, null, '2008EnterpriseCount', null);
INSERT INTO `sys_data_tree` VALUES ('0007002002001005', 'Windows 2008 数据中心版', '0007002002001', '5', '0', null, '1', null, null, null, '2008DCCount', null);

-- 将原来windows下的Windows 2012类型名称改为"Windows 2012 标准版"
-- 再在windows下新增两条记录"Windows 2012 企业版"和"Windows 2012 数据中心版"
UPDATE sys_data_tree SET node_name = 'Windows 2012 标准版' ,node_name_en = '2012StandardCount' WHERE node_id = '0007002002001003' AND parent_id = '0007002002001';
INSERT INTO `sys_data_tree` VALUES ('0007002002001006', 'Windows 2012 企业版', '0007002002001', '6', '0', null, '1', null, null, null, '2012EnterpriseCount', null);
INSERT INTO `sys_data_tree` VALUES ('0007002002001007', 'Windows 2012 数据中心版', '0007002002001', '7', '0', null, '1', null, null, null, '2012DCCount', null);


-- 历史数据处理
-- 镜像：1：公共镜像;2:自定义镜像
-- 分别查询出原来属于"Windows 2008"和“Windows 2012”的公共镜像
-- SELECT * FROM cloud_image WHERE os_type = '0007002002001' AND sys_type = '0007002002001002' AND image_ispublic = '1';
-- SELECT * FROM cloud_image WHERE os_type = '0007002002001' AND sys_type = '0007002002001003' AND image_ispublic = '1';
-- 有一个08标准版镜像id为“8e8b4949-afc7-49a0-942b-4c813e278f5c”，一个数据中心版id为“fa47341c-3aa3-4a89-bdbd-87303f7f4def”
-- 有一个12标准版镜像id为“82eebb1e-a36c-4868-b111-40ef4c898e82”，一个数据中心版id为“3500d8ae-9982-46fa-885a-56a9cde48a9a”

-- 公共镜像处理
-- 首先标准版的都保持不变，将两个数据中心版的sys_type都改为新的数据中心版的node_id
UPDATE cloud_image SET sys_type = '0007002002001005' WHERE image_id = 'fa47341c-3aa3-4a89-bdbd-87303f7f4def' AND os_type = '0007002002001';
UPDATE cloud_image SET sys_type = '0007002002001007' WHERE image_id = '3500d8ae-9982-46fa-885a-56a9cde48a9a' AND os_type = '0007002002001';

-- 公共镜像创建的云主机处理：将根据以上两个数据中心版的公共镜像创建的云主机的sys_type改为相应的node_id
UPDATE cloud_vm SET sys_type = '0007002002001005' WHERE os_type = '0007002002001' AND from_imageid = 'fa47341c-3aa3-4a89-bdbd-87303f7f4def';
UPDATE cloud_vm SET sys_type = '0007002002001007' WHERE os_type = '0007002002001' AND from_imageid = '3500d8ae-9982-46fa-885a-56a9cde48a9a';



-- 下面的自定义镜像处理和云主机处理需要根据实际情况循环多次

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;

-- 自定义镜像处理
UPDATE cloud_image im SET im.sys_type = (SELECT vm.sys_type FROM cloud_vm vm WHERE vm.vm_id = im.from_vmid) 
WHERE im.image_ispublic = '2' AND im.os_type = '0007002002001';
-- 自定义镜像创建的云主机处理
UPDATE cloud_vm vm SET vm.sys_type = (SELECT im.sys_type FROM cloud_image im WHERE im.image_id = vm.from_imageid) 
WHERE vm.os_type = '0007002002001' AND vm.from_imageid is not NULL;








-- SELECT im.image_id, im.image_name,im.image_ispublic,im.from_vmid,im.os_type,im.sys_type ,vm.vm_id,vm.vm_name,vm.sys_type
-- FROM cloud_image im LEFT JOIN cloud_vm vm ON im.from_vmid = vm.vm_id 
--  WHERE im.os_type = '0007002002001' ORDER BY image_ispublic;

-- SELECT vm.vm_id,vm.vm_name,vm.from_imageid,vm.os_type,vm.sys_type ,im.image_id, im.image_name,im.image_ispublic,im.sys_type
-- FROM cloud_vm vm 
-- LEFT JOIN cloud_image im ON vm.from_imageid = im.image_id
-- WHERE vm.os_type = '0007002002001';

