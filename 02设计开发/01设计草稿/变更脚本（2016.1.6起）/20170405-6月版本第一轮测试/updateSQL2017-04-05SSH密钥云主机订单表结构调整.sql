-- 添加cloudorder_vm 表的字段
ALTER TABLE cloudorder_vm ADD COLUMN login_type VARCHAR (10) NULL AFTER data_disk,
 ADD COLUMN secret_key VARCHAR (100) NULL AFTER login_type;

-- 处理 标记以前的创建都是密码方式
update cloudorder_vm set login_type = 'pwd' where order_type = '0';
