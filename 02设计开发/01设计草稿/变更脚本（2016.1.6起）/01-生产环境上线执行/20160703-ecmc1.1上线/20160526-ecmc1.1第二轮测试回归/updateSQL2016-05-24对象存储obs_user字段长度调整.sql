-- 代码中，该字段放置的是公司中文名称，在客户表中，公司中文名称长度为255，而display_name长度为50.
-- 修改到255，以防止某些客户公司中文名称过长（>50）点击开通时插入数据库异常。 张帆 2016-05-24 14:44:21
ALTER TABLE `obs_user` modify column `display_name` varchar(255);