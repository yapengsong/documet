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
Reason: Ϊ��Ŀ�б�������б�����ֶ�����������ͳ�Ʊ�ǩ
Author: ����
*/

ALTER table cloud_project add label_id VARCHAR(100);
ALTER table cloud_subnetwork add ( in_label_rule_id VARCHAR(100),out_label_rule_id VARCHAR(100));