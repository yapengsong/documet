/*
ECMC SYS
部门、用户、角色、权限、菜单
Date: 2016-03-04 11:19:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ecmc_sys_authority`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_authority`;
CREATE TABLE `ecmc_sys_authority` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  `permission` text NOT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_department`;
CREATE TABLE `ecmc_sys_department` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `parentid` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_menu`;
CREATE TABLE `ecmc_sys_menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `orderno` int(11) NOT NULL,
  `createtime` datetime DEFAULT NULL,
  `createdby` varchar(32) DEFAULT NULL,
  `enableflag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_role`;
CREATE TABLE `ecmc_sys_role` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_roleauth`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_roleauth`;
CREATE TABLE `ecmc_sys_roleauth` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `auth_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidauthid` (`role_id`,`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_rolemenu`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_rolemenu`;
CREATE TABLE `ecmc_sys_rolemenu` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_roleidmenuid` (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_user`;
CREATE TABLE `ecmc_sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `account` varchar(32) NOT NULL COMMENT '登录帐号',
  `name` varchar(50) NOT NULL COMMENT '名称、姓名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `tel` varchar(100) DEFAULT NULL COMMENT '联系电话',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `depart_id` varchar(32) DEFAULT NULL COMMENT '部门id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `createdby` varchar(32) DEFAULT NULL COMMENT '创建者ID',
  `enableflag` char(1) DEFAULT NULL COMMENT '是否启用',
  `salt` varchar(20) DEFAULT NULL COMMENT '密码干扰串',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_useraccount` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `ecmc_sys_userrole`
-- ----------------------------
DROP TABLE IF EXISTS `ecmc_sys_userrole`;
CREATE TABLE `ecmc_sys_userrole` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecmc_useridroleid` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

