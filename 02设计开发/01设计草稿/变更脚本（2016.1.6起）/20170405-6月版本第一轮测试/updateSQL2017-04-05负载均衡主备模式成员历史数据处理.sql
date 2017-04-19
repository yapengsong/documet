/*
这个sql需要在
document\02设计开发\01设计草稿\变更脚本（2016.1.6起）\20170405-June \updateSQL2017-03-16负载均衡主备模式表结构修改.sql
执行后再执行

曹翔宇
Date: 2017-04-05 18:41:34
*/

update cloud_ldmember set priority=256 where priority is null;
