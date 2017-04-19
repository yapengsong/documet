ALTER TABLE `schedule_log`
ADD INDEX `idx_task_log` (`trigger_name`, `exc_time`, `is_success`) ;