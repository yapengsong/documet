-- 项目表增加机柜位置字段  --曾波
ALTER TABLE `cloud_project`
ADD COLUMN `cabinet_id`  varchar(100) NULL COMMENT '机柜ID',
ADD COLUMN `sms_count`  int(10) default 0 NULL COMMENT '短信数量' ;