UPDATE sys_selfpower set power_name = '挂载/解绑云硬盘' WHERE power_route = 'host_bindVolume';

UPDATE sys_selfpower set power_name = '挂载' WHERE power_route = 'disk_bind';

UPDATE sys_selfpower set power_name = '连接/断开路由' WHERE power_route = 'subnet_route';

DELETE FROM sys_selfpower WHERE power_route = 'order_search';
