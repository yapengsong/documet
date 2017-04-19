ALTER TABLE `cloud_project`
ADD COLUMN `ssh_key_count`  int(10) NOT NULL DEFAULT 50 COMMENT 'ssh密钥数量';

ALTER TABLE `quota_template`
ADD COLUMN `ssh_key_count`  int(10) NOT NULL DEFAULT 50 COMMENT 'SSH密钥数量';