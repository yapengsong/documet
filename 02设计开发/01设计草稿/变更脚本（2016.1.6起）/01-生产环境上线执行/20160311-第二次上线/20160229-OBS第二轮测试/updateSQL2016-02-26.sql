-- 2016-02-26添加对象存储及API管理部分的功能权限列表；段彬彬
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317c188aa0006', 'API管理', NULL, '', 220000, '', 'API管理', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317c84ee00007', 'API管理', NULL, '', 221000, '40289099531765a6015317c188aa0006', 'API管理', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317c90a1f0008', 'API管理', NULL, 'api_mng', 221010, '40289099531765a6015317c84ee00007', 'API管理（该模块只有超级管理员有权限）', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317cc9fdc0009', '对象存储', NULL, '', 230000, '', '对象存储（分为bucket和资源报表）', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317cdd318000a', 'Bucket管理', NULL, '', 231000, '40289099531765a6015317cc9fdc0009', 'Bucket管理', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317ce3c41000b', '资源报表', NULL, '', 232000, '40289099531765a6015317cc9fdc0009', '资源报表', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317d02049000c', '创建Bucket', NULL, 'bucket_create', 231011, '40289099531765a6015317cdd318000a', '创建', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317d22a65000d', '详情', NULL, 'bucket_details', 231012, '40289099531765a6015317cdd318000a', '详情', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317d2a38c000e', '删除', NULL, 'bucket_delete', 231013, '40289099531765a6015317cdd318000a', '删除', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317ddc019000f', '上传文件', NULL, 'object_add', 231014, '40289099531765a6015317cdd318000a', 'Object上传文件', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317de91670010', '新建文件夹', NULL, 'object_new', 231015, '40289099531765a6015317cdd318000a', 'Object新建文件夹', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317df63550011', 'Object多选删除', NULL, 'object_alldelete', 231016, '40289099531765a6015317cdd318000a', 'Object多选删除', NULL);
INSERT INTO `sys_selfpower` VALUES ('40289099531765a6015317dff3fe0012', 'Object删除', NULL, 'object_delete', 231017, '40289099531765a6015317cdd318000a', 'Object删除', NULL);
