-- ** ע��ִ�����SQL����Ҫִ��REDIS�������ֵ仺��ͬ�� **
-- �޸� ��Դ�������վ����ʱ����7*24Сʱ��
update sys_data_tree set para1 = '168' where node_name_en = 'RecycleBinTime';
-- �޸� ��Դ�ѵ��ڻ�����ı���ʱ����1Сʱ��
update sys_data_tree set para1 = '1' where node_name_en = 'KeepTime';
-- �޸� ������Դ�Ŀ�ֵͨ��100Ԫ��
update sys_data_tree set para1 = '100' where node_name_en = 'PostPayResourceOpenLimitValue';
-- �޸� ������Դ���¿�ֵͨ(0Ԫ)
update sys_data_tree set para1 = '0' where node_name_en = 'RestoreValue';