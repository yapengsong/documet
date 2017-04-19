/*
money_record表增加索引idx_paytype

Source Server         : 曹翔宇
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-09-12 15:10:37
*/

alter table money_record add index idx_paytype(pay_type);