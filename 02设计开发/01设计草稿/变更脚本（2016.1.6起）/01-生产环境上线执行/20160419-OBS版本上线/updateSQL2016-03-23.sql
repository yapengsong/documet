-- 将角色权限展示处的'API管理'改为'密钥管理'  --段彬彬
UPDATE sys_selfpower SET power_name = '密钥管理' WHERE power_name = 'API管理';