-- �������ڵ�ά��
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017', '����Դ�����������', '0007002', '16', '0','1', 'PayBefore');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002', '�긶', '0007002017', '2', '0','1', 'yearly');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002001', '1��', '0007002017002', '1', '0','1','12');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002002', '2��', '0007002017002', '2', '0', '1', '24');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017002003', '3��', '0007002017002', '3', '0', '1', '36');
INSERT INTO sys_data_tree (node_id, node_name, parent_id, sort, is_root, flag, node_name_en) VALUES ('0007002017001', '�¸�', '0007002017', '1', '0', '1', 'monthly');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001001','1����','0007002017001','1','0','1','1');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001002','2����','0007002017001','2','0','1','2');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001003','3����','0007002017001','3','0','1','3');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001004','4����','0007002017001','4','0','1','4');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001005','5����','0007002017001','5','0','1','5');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001006','6����','0007002017001','6','0','1','6');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001007','7����','0007002017001','7','0','1','7');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001008','8����','0007002017001','8','0','1','8');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002017001009','9����','0007002017001','9','0','1','9');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('00070020170010010','10����','0007002017001','10','0','1','10');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('00070020170010011','11����','0007002017001','11','0','1','11');

-- ������״̬����
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002004018','ɾ����','0007002004','18','0','1','SOFT_DELETING');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002004019','�ָ���','0007002004','19','0','1','SOFT_RESUME');
INSERT INTO sys_data_tree (node_id,node_name,parent_id,sort,is_root,flag,node_name_en)VALUES('0007002004020','��ɾ��','0007002004','20','0','1','SOFT_DELETED');

update sys_data_tree set node_name = '��ͣ������' where node_id ='0007002004009';
update sys_data_tree set node_name = '��ͣ����' where node_id ='0007002004010';


-- ϵͳͼ��
update sys_data_tree set icon ='ef-Windows' where node_id='0007002002001';
update sys_data_tree set icon ='ef-CentOS' where node_id='0007002002002001';
update sys_data_tree set icon ='ef-Ubuntu' where node_id='0007002002002002';
update sys_data_tree set icon ='ef-Debian' where node_id='0007002002002004';

-- ��Ӳ��״̬
INSERT INTO `sys_data_tree` VALUES ('0007002005009', '�ָ�������', '0007002005', '2', '0', null, '1', null, null, null, 'RESTORING-BACKUP', null);

-- ��Ӳ�̿���״̬
INSERT INTO `sys_data_tree` VALUES ('0007002006005', '�ع���', '0007002006', '3', '0', null, '1', null, null, null, 'RESTORING', null);
