ALTER TABLE workorder ADD is_autoconfirm VARCHAR(1) ;
ALTER TABLE workorder ADD is_autoevaluation VARCHAR(1) ;

ALTER TABLE workorder ADD INDEX idx_credate (cre_date) ;
ALTER TABLE work_opinion ADD INDEX idx_credate (cre_date) ;