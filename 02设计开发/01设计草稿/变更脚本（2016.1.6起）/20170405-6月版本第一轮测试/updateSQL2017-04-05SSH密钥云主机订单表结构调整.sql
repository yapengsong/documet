-- ���cloudorder_vm ����ֶ�
ALTER TABLE cloudorder_vm ADD COLUMN login_type VARCHAR (10) NULL AFTER data_disk,
 ADD COLUMN secret_key VARCHAR (100) NULL AFTER login_type;

-- ���� �����ǰ�Ĵ����������뷽ʽ
update cloudorder_vm set login_type = 'pwd' where order_type = '0';
