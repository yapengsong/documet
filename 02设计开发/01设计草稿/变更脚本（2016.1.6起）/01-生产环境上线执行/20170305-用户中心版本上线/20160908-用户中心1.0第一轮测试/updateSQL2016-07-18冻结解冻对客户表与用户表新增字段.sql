/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-07-18 17:35:47
Reason: Ϊ�ͻ����û�������ֶ�is_block�����ж��Ƿ񱻶���
Author: ���ҳ�
*/

ALTER TABLE sys_selfcustomer 
ADD COLUMN is_blocked CHAR(1) default 0;

ALTER TABLE sys_selfcustomer 
ADD COLUMN block_opstatus CHAR(1);

ALTER TABLE sys_selfuser 
ADD COLUMN is_blocked CHAR(1) default 0;