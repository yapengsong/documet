--
-- µ¯ÐÔ¹«ÍøÐÞ¸´is_visable×Ö¶Î
-- Author: xiang.gao
-- Date: 2016-09-12
--
ALTER TABLE cloud_floatip
drop column is_visible;
ALTER table cloud_floatip
add column is_visable char(1) DEFAULT null;