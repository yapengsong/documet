/*
Navicat MySQL Data Transfer

Source Server         : 开发数据库192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-07-28 14:55:28
*/

ALTER TABLE obs_accesskey 
ADD COLUMN is_stopservice CHAR(1) default 0;
