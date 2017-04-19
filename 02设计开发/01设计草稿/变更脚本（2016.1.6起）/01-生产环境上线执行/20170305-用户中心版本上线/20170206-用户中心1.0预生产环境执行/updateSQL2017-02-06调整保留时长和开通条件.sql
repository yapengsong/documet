-- ** 注意执行完此SQL还需要执行REDIS的数据字典缓存同步 **
-- 修改 资源进入回收站保留时长（7*24小时）
update sys_data_tree set para1 = '168' where node_name_en = 'RecycleBinTime';
-- 修改 资源已到期或余额不足的保留时长（1小时）
update sys_data_tree set para1 = '1' where node_name_en = 'KeepTime';
-- 修改 按需资源的开通值（100元）
update sys_data_tree set para1 = '100' where node_name_en = 'PostPayResourceOpenLimitValue';
-- 修改 按需资源重新开通值(0元)
update sys_data_tree set para1 = '0' where node_name_en = 'RestoreValue';