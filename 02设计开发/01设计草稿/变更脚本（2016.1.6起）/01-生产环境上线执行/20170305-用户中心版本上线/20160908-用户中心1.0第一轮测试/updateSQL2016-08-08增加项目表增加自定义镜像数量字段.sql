ALTER TABLE `cloud_project`
ADD COLUMN `image_count`  decimal(10,0) default 0 AFTER `portmapping_count`;


/*
   自定义镜像数量=0
*/
UPDATE cloud_project a SET a.snapshot_size=0;