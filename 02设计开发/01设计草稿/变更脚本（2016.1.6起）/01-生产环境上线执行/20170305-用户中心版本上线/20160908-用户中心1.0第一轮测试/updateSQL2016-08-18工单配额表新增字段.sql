-- 段彬彬 2016.08.18
ALTER TABLE `work_quota`
ADD COLUMN `quota_disksize`  int(10) default 0 NULL COMMENT '云硬盘容量配额（GB）',
ADD COLUMN `quota_shotsize`  int(10) default 0 NULL COMMENT '云硬盘快照容量配额（GB）',
ADD COLUMN `quota_portmapping`  int(10) default 0 NULL COMMENT '端口映射' ;