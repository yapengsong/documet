ALTER TABLE `cloud_project`
ADD COLUMN `snapshot_size`  decimal(10,0) NULL AFTER `memory`;


/*
   云硬盘快照大小=0
*/
UPDATE cloud_project a SET a.snapshot_size=0;


ALTER TABLE `cloud_project`
ADD COLUMN `vip_count`  decimal(10,0) NULL COMMENT '负载均衡虚拟IP数量' AFTER `snapshot_size`,
ADD COLUMN `portmapping_count`  decimal(10,0) NULL COMMENT '端口映射数量' AFTER `vip_count`;

/*
	负载均衡虚拟IP数量和端口映射数量，端口映射数量=0，负载均衡虚拟IP数量=0
*/
UPDATE cloud_project a SET a.vip_count=0,a.portmapping_count=0;