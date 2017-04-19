/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : eayuncloud_baotou

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-12-19 14:08:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ecmc_sys_menu
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
  `icon` varchar(100) DEFAULT NULL,
  `lock` char(1) DEFAULT '0' COMMENT '是否加锁，0:false 可被分配分配给角色、删除;1：true 不可被分配给角色、删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecmc_sys_menu
-- ----------------------------
INSERT INTO `ecmc_sys_menu` VALUES ('2', '主菜单', '123', '123', '2', '1', '2016-03-29 11:42:39', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('3', '二级菜单', '1', '1', '2', '0', '2016-03-30 11:12:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4', '二级菜单2', null, null, '1', '2', null, 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eeb545f98a801545fea5a8a005d', '数据管理', '数据管理', 'app.sysdatatree', 'ff8080815438ac44015438d8d5000018', '80', '2016-04-29 10:47:54', '40288eeb545f98a801545fc5f2ce0001', '1', 'eayunfont ef-data', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eee54eacc470154eb01c0980010', '开发测试', '123', null, '40288eee54eacc470154eb0042e4000d', '1', '2016-05-26 11:00:41', '40288ee4545b5b5001545b901fac0007', null, null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eee54eacc470154eb0825bb001b', '开发测试', '123', null, '40288eee54eacc470154eb065d590018', '1', '2016-05-26 11:07:40', '40288ee4545b5b5001545b901fac0007', null, null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c66cb1f40000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:28:45', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef53c66c150153c670d16f0001', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', '2016-03-30 15:33:15', null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40288eef55775e060155775f66160002', '定时任务', null, 'app.task', 'ff8080815438ac44015438d8d5000018', '100', '2016-06-22 17:09:48', '40288eee545fc01a01545fe4cd06000f', '1', 'eayunfont ef-task', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40289092559069cd0155907110460006', '邮件短信', '邮件短信', 'app.mailsms', 'ff8080815438ac44015438d8d5000018', '90', '2016-06-27 13:59:36', '40289092543bcc8c01543bd161c40000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909556c4f2440156c5db2f8700ea', '回收站', '回收站资源', 'app.recycle', 'ff8080815438ac44015438bcfb260001', '50', '2016-08-26 15:58:11', '40289095547ea16201547ea5b79a0001', '1', 'eayunfont ef-recovery', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890995621747901562187c9ad0001', '价格配置', null, 'app.price', 'ff8080815438ac44015438c14b110006', '50', '2016-07-25 18:09:22', 'ff808081545a6f9d01545c5f4a480007', '1', 'eayunfont ef-cost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('40289099567cb38a01567cb80d6e0000', '在线统计', null, 'app.cusonline', 'ff8080815438ac44015438d8d5000018', '90', '2016-08-12 11:07:32', 'ff808081545a6f9d01545c5f4a480007', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158be9e0d350000', 'API管理', null, null, '', '60', '2016-12-02 16:19:38', '2c91808256f81c44015702bbf9510000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea006250001', 'API概览', '暂用了云主机的图标', 'app.apioverview', '4028909958be99a30158be9e0d350000', '10', '2016-12-02 16:21:48', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea03b880002', '限制管理', '暂用了网络的图标', 'app.apilimit', '4028909958be99a30158be9e0d350000', '20', '2016-12-02 16:22:01', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028909958be99a30158bea8df9a0003', 'API管理', '暂用了组织机构的图标', 'app.apimanage', 'ff8080815438ac44015438d8d5000018', '110', '2016-12-02 16:31:28', '2c91808256f81c44015702bbf9510000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('402890bb5413eb6a01541402ce910000', '云主机管理', '云主机管理', '#/cloud/vm', '111', '2', null, null, '1', '图标地址', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028936f567dd77101567ddad4b00000', '订单管理', null, 'app.order', 'ff8080815438ac44015438c14b110006', '20', '2016-08-12 16:25:08', '40288ef054a94b120154a94f953c0001', '1', 'eayunfont ef-order', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('4028936f567dd77101567dde38270001', '配额模板', null, 'app.quotatemp', 'ff8080815438ac44015438c14b110006', '70', '2016-08-12 16:28:50', '40288ef054a94b120154a94f953c0001', '1', 'eayunfont ef-quota', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('5', '二级菜单1', null, null, '1', '0', '2016-03-30 11:14:22', 'dev', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bb40b20000', '总览', '', 'app.overview', null, '10', '2016-04-21 20:11:16', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-overview', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bcfb260001', '公有云资源管理', null, '', null, '20', '2016-04-21 20:13:09', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438be965d0002', '云主机', null, 'app.cloudhost', 'ff8080815438ac44015438bcfb260001', '10', '2016-04-21 20:14:55', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cloudhost', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bf1f390003', '网络', 'VPC', 'app.net', 'ff8080815438ac44015438bcfb260001', '20', '2016-04-21 20:15:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-net', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438bfc39a0004', '安全', null, 'app.safe', 'ff8080815438ac44015438bcfb260001', '30', '2016-04-21 20:16:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-safe', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c05a8b0005', '对象存储', 'OBS', 'app.obs', 'ff8080815438ac44015438bcfb260001', '40', '2016-04-21 20:16:50', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-obs', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c14b110006', '公有云业务管理', null, '', null, '30', '2016-04-21 20:17:52', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c27e5d0007', '客户管理', null, 'app.customer', 'ff8080815438ac44015438c14b110006', '10', '2016-04-21 20:19:11', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c2e0dc0008', '工单管理', null, 'app.workorder', 'ff8080815438ac44015438c14b110006', '30', '2016-04-21 20:19:36', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-workorder', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c33c7b0009', '消息管理', null, 'app.message', 'ff8080815438ac44015438c14b110006', '40', '2016-04-21 20:19:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-model', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438c8999a000a', '公告管理', null, 'app.notice', 'ff8080815438ac44015438c14b110006', '50', '2016-04-21 20:25:51', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-contacts', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce0059000b', '数据中心管理', null, '', null, '40', '2016-04-21 20:31:45', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438ce7e8e000c', '数据中心', null, 'app.center', 'ff8080815438ac44015438ce0059000b', '10', '2016-04-21 20:32:17', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-center', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cf239e000d', '服务器', null, 'app.server', 'ff8080815438ac44015438ce0059000b', '20', '2016-04-21 20:32:59', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-server', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438cfcf98000e', '机柜', null, 'app.cabinet', 'ff8080815438ac44015438ce0059000b', '30', '2016-04-21 20:33:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-cabinet', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d03f87000f', '交换机', null, 'app.switch', 'ff8080815438ac44015438ce0059000b', '40', '2016-04-21 20:34:12', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-switch', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d1075f0010', '存储', null, 'app.storage', 'ff8080815438ac44015438ce0059000b', '50', '2016-04-21 20:35:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-storage', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d199e40011', '防火墙', null, 'app.firewall', 'ff8080815438ac44015438ce0059000b', '60', '2016-04-21 20:35:41', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-firewall', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d2dc4a0012', '型号维护', null, 'app.model', 'ff8080815438ac44015438ce0059000b', '70', '2016-04-21 20:37:03', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-xinghaoweihu', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d3aa7a0013', 'IP', null, 'app.ip', 'ff8080815438ac44015438ce0059000b', '80', '2016-04-21 20:37:56', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-IP', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d5fe9c0014', '监控管理', null, '', null, '50', '2016-04-21 20:40:29', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d660ff0015', '资源监控', null, 'app.monitor', 'ff8080815438ac44015438d5fe9c0014', '10', '2016-04-21 20:40:54', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-monitor', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d721300016', '报警管理', null, 'app.warning', 'ff8080815438ac44015438d5fe9c0014', '20', '2016-04-21 20:41:43', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-warning', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d7fbd50017', '联系人管理', null, 'app.contacts', 'ff8080815438ac44015438d5fe9c0014', '30', '2016-04-21 20:42:39', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d8d5000018', '系统管理', null, '', null, '60', '2016-04-21 20:43:35', '402890bc540ad19801540ad1fc300000', '1', null, '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d93963001a', '组织机构', null, 'app.department', 'ff8080815438ac44015438d8d5000018', '10', '2016-04-21 20:44:00', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-organization', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438d98eea001c', '菜单管理', null, 'app.menu', 'ff8080815438ac44015438d8d5000018', '20', '2016-04-21 20:44:22', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-menu', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438da284a001d', '角色管理', null, 'app.role', 'ff8080815438ac44015438d8d5000018', '30', '2016-04-21 20:45:01', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-role', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dace02001e', '权限管理', null, 'app.authority', 'ff8080815438ac44015438d8d5000018', '40', '2016-04-21 20:45:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-forbid', '1');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dbb92e001f', '用户管理', null, 'app.user', 'ff8080815438ac44015438d8d5000018', '50', '2016-04-21 20:46:44', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-user', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dc6dfa0020', '日志管理', '', 'app.log', 'ff8080815438ac44015438d8d5000018', '60', '2016-04-21 20:47:30', '402890bc540ad19801540ad1fc300000', '1', 'eayunfont ef-log', '0');
INSERT INTO `ecmc_sys_menu` VALUES ('ff8080815438ac44015438dccfb40021', '数据管理', null, '#/sysdatatree/sysdatatree', 'ff8080815438ac44015438dccfb40021', '70', '2016-04-21 20:47:55', '402890bc540ad19801540ad1fc300000', '1', null, '0');
