-- ɾ�� 512MB���ڴ�
delete from sys_data_tree where node_id='0007002001001001';
-- ������״̬  ���� -- ����
update sys_data_tree set node_name='����' where node_id='0007002004006' and node_name='����';
-- ������״̬  �ػ�  �ѹػ�
update sys_data_tree set node_name='�ѹػ�' where node_id='0007002004008' and node_name='�ػ�';
-- ������״̬  ��������  ������
update sys_data_tree set node_name='������' where node_id='0007002004012' and node_name='��������';
-- Ԥ�����С���ȷ����ȷ�ϵ����� �޸�Ϊ  ������
update sys_data_tree set node_name='������' where node_id in ('0007002004014','0007002004015','0007002004016') and node_name<>'������'; 
-- ɾ��Ӳ����
delete from sys_data_tree where node_id='0007002004013';
-- ɾ��ȡ��������
delete from sys_data_tree where node_id='0007002004017';
	