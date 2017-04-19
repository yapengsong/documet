/*
为成员表/健康检查-负载均衡关联表增加pool_id作为索引

曹翔宇
Date: 2017-04-05 18:41:34
*/

CREATE INDEX idx_poolId ON cloud_ldmember (pool_id);


CREATE INDEX idx_poolId ON cloud_ldpoolldmonitor (pool_id);