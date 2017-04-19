/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-01-07 10:32:24
Reason: 为项目列表和子网列表添加字段用以做流量统计标签
Author: 高翔
*/

ALTER table cloud_project add label_id VARCHAR(100);
ALTER table cloud_subnetwork add ( in_label_rule_id VARCHAR(100),out_label_rule_id VARCHAR(100));