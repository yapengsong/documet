/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-01-08 17:35:47
Reason: 为项目列表添加字段label_in_id和label_out_id用以做流量统计标签，并且去掉原本的字段label_id
Author: 高翔
*/

ALTER TABLE cloud_project 
ADD COLUMN (label_in_id VARCHAR(100),label_out_id VARCHAR(100));
ALTER TABLE `cloud_project` 
DROP COLUMN `label_id`;