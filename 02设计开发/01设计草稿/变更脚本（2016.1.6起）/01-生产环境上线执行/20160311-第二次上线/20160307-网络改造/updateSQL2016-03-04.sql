--  角色权限中仍然展示原来的‘网络’‘路由’等权限，需要修改 段彬彬
-- 1.修改权限名称
update sys_selfpower SET power_name = '私有网络' WHERE power_name = '网络' AND parent_id <> '' AND parent_id IS NOT null;

-- 2.查询出路由模块的记录id
SELECT power_id FROM sys_selfpower WHERE power_name = "路由";

-- 3.删除角色-权限关联表记录（id为第二步查询出的id）
DELETE FROM sys_selfrolepower WHERE power_id in (SELECT power_id FROM sys_selfpower WHERE  parent_id = 'fa168e347c7d11e58542001a4a7ae4d4');

-- 4.删除三级权限（id为第二步查询出的id）
DELETE FROM sys_selfpower WHERE parent_id = 'fa168e347c7d11e58542001a4a7ae4d4';

-- 5.删除路由二级目录
DELETE FROM sys_selfpower WHERE power_name = '路由';

-- 6.在私有网络目录下增加一条记录
INSERT INTO `sys_selfpower` (`power_id`, `power_name`, `power_url`, `power_route`, `power_sort`, `parent_id`, `power_desc`, `power_icon`) VALUES ('402890995340723f015340d74a960001', '设置网关/清除网关', NULL, 'net_setup', 121016, 'ee534f167c7c11e58542001a4a7ae4d4', '设置网关/清除网关', NULL);

-- 7.线下操作修改ecmc下role-power.xls文件，然后ecmc上点击同步按钮