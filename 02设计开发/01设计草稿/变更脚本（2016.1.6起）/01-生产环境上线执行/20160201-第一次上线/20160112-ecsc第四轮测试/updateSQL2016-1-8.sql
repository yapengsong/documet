/*Ϊ������Ϣ������ֶκ����� - 2016-01-08 09:50:11 By �ŷ�*/
ALTER TABLE `ecsc_alarmmessage` ADD `am_monitoralarmitemid` varchar(32);

ALTER TABLE `ecsc_alarmmessage` ADD INDEX `idx_amvmid` (`am_vmid` ASC);
ALTER TABLE `ecsc_alarmmessage` ADD INDEX `idx_ammonitoralarmitemid` (`am_monitoralarmitemid` ASC);
ALTER TABLE `ecsc_alarmmessage` ADD `am_alarmruleid` varchar(32);
ALTER TABLE `ecsc_alarmmessage` ADD INDEX `idx_amalarmruleid` (`am_alarmruleid` ASC);