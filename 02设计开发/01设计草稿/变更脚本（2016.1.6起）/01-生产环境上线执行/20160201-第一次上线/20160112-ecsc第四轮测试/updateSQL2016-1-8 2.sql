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
Reason: Ϊ��Ŀ�б�����ֶ�label_in_id��label_out_id����������ͳ�Ʊ�ǩ������ȥ��ԭ�����ֶ�label_id
Author: ����
*/

ALTER TABLE cloud_project 
ADD COLUMN (label_in_id VARCHAR(100),label_out_id VARCHAR(100));
ALTER TABLE `cloud_project` 
DROP COLUMN `label_id`;