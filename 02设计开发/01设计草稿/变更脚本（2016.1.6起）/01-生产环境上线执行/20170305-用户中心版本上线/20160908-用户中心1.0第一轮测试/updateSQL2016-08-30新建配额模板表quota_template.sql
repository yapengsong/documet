/*
Navicat MySQL Data Transfer

Source Server         : 北京研发库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-08-30 11:02:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for quota_template
-- ----------------------------
DROP TABLE IF EXISTS `quota_template`;
CREATE TABLE `quota_template` (
  `qt_id` varchar(32) NOT NULL COMMENT '主键ID',
  `qt_name` varchar(64) NOT NULL COMMENT '模板名称',
  `cpu_count` int(11) NOT NULL DEFAULT '0' COMMENT 'CPU数量',
  `memory` int(11) NOT NULL DEFAULT '0' COMMENT '内存数量',
  `host_count` int(11) NOT NULL DEFAULT '0' COMMENT '云主机数量',
  `disk_count` int(11) NOT NULL DEFAULT '0' COMMENT '云硬盘数量',
  `disk_snapshot` int(11) NOT NULL DEFAULT '0' COMMENT '云硬盘快照数量',
  `count_band` int(11) NOT NULL DEFAULT '0' COMMENT '带宽大小',
  `net_work` int(11) NOT NULL DEFAULT '0' COMMENT '网络数量',
  `subnet_count` int(11) NOT NULL DEFAULT '0' COMMENT '子网数量',
  `outerip` int(11) NOT NULL DEFAULT '0' COMMENT '公网IP数量',
  `safe_group` int(11) NOT NULL DEFAULT '0' COMMENT '安全组数量',
  `quota_pool` int(11) NOT NULL DEFAULT '0' COMMENT '负载均衡数量',
  `sms_count` int(11) NOT NULL DEFAULT '0' COMMENT '报警短信数量',
  `qt_desc` varchar(2000) DEFAULT '' COMMENT '描述',
  `disk_capacity` int(11) NOT NULL COMMENT '云硬盘大小',
  `snapshot_size` int(11) NOT NULL COMMENT '云快照大小',
  `count_vpn` int(11) NOT NULL COMMENT 'VPN数量',
  `portmapping_count` int(11) NOT NULL COMMENT '端口映射数量',
  `image_count` int(11) NOT NULL COMMENT '镜像数量',
  PRIMARY KEY (`qt_id`)
) ENGINE=InnoDB;
