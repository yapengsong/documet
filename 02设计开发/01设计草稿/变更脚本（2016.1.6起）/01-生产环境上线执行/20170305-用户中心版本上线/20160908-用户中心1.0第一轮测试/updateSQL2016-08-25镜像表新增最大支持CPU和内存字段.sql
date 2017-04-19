-- 段彬彬 2016.08.25
ALTER TABLE `cloud_image`
ADD COLUMN `max_cpu`  int(5) NULL COMMENT '最大支持CPU（核）',
ADD COLUMN `max_ram`  int(10) NULL COMMENT '最大支持内存（GB）';