-- by 周海涛
-- 默认安全组
update cloud_securitygroup set  default_group = 'defaultGroup' where sg_name in ('Windows安全组放通3389端口','Linux安全组放通22端口');

-- 默认子网类型
update cloud_subnetwork set subnet_type = '1';

-- 镜像
 update cloud_image set sys_type = null ,os_type = null where image_ispublic = '1' and min_cpu = 99;

