--
-- ���ؾ�����ӼƷ�����ֶ�
-- Author: xiang.gao
-- Date: 2016-08-02
--
ALTER TABLE cloud_ldpool ADD pay_type CHAR (1) DEFAULT NULL COMMENT '1����Ԥ���ѣ�2����󸶷�';
ALTER TABLE cloud_ldpool ADD charge_state CHAR (1) DEFAULT NULL COMMENT '0����������1�������㣬2�����ѵ��ڣ�3����ͣ����';
ALTER TABLE cloud_ldpool ADD end_time datetime DEFAULT NULL COMMENT '���Ԥ���ѵĵ���ʱ��';
ALTER TABLE cloud_ldpool ADD is_visible CHAR(1) DEFAULT NULL COMMENT '�Ƿ�չʾ��Դ���û���1չʾ��0��չʾ';