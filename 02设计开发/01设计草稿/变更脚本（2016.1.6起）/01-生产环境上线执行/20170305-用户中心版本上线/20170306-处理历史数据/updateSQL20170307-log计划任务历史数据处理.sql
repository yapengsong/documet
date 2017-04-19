-- by 陈浩
delete FROM eayuncloud.QRTZ_TRIGGERS where TRIGGER_NAME = 'logTrigger';

delete FROM eayuncloud.QRTZ_CRON_TRIGGERS where TRIGGER_NAME='logTrigger';

delete FROM eayuncloud.QRTZ_JOB_DETAILS where JOB_NAME = 'sysLogJob';