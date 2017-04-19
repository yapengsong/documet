/*
Navicat MySQL Data Transfer

Source Server         : 北京研发库
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-07-01 10:20:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for schedule_info
-- ----------------------------
DROP TABLE IF EXISTS `schedule_info`;
CREATE TABLE `schedule_info` (
  `trigger_name` varchar(200) NOT NULL COMMENT '任务ID（关联QRTZ_TRIGGERS表的TRIGGER_NAME字段）',
  `create_time` datetime NOT NULL COMMENT '任务创建时间',
  `create_by` varchar(32) NOT NULL DEFAULT '' COMMENT '任务创建人',
  PRIMARY KEY (`trigger_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schedule_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_log`;
CREATE TABLE `schedule_log` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `trigger_name` varchar(200) NOT NULL COMMENT '任务ID',
  `bean_name` varchar(200) NOT NULL COMMENT 'bean名称',
  `method_name` varchar(200) NOT NULL COMMENT '方法名称',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `exc_time` datetime NOT NULL COMMENT '执行时间',
  `is_success` char(1) NOT NULL COMMENT '是否成功',
  `error_msg` varchar(2000) DEFAULT NULL COMMENT '异常\\错误信息',
  `take_time` int(20) NOT NULL COMMENT '本次执行耗时（ms）',
  `exc_type` varchar(2) NOT NULL DEFAULT '0' COMMENT '执行类型，0：自动执行；1：手动执行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schedule_statistics
-- ----------------------------
DROP TABLE IF EXISTS `schedule_statistics`;
CREATE TABLE `schedule_statistics` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器名称',
  `statistics_date` date NOT NULL COMMENT '统计日期',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行总次数',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功次数',
  `fal_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
