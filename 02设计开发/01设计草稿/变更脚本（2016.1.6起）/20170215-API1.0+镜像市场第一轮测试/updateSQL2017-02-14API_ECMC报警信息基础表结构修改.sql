-- 新增了客户端IP以及报警触发条件ID两列
ALTER TABLE ecmc_alarmmessage ADD COLUMN ip varchar(32);
ALTER TABLE ecmc_alarmmessage ADD COLUMN am_alarmtriggerid varchar(32);
