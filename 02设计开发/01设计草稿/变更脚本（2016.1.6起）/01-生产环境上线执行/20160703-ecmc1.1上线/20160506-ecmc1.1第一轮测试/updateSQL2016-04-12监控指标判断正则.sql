-- 监控指标正则判断
-- 段彬彬
UPDATE  sys_data_tree SET para2 = '/^(?:0|[1-9][0-9]?|100)$/' WHERE node_id = '0010003001001' OR node_id ='0010003001002';

UPDATE  sys_data_tree SET para2 = '/^(0|([1-9][0-9]{0,4}))$/' WHERE node_id in ('0010003001003','0010003001004','0010003001005','0010003001006');
