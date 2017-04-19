/*
新增客户访问次数表
曹翔宇

Date: 2016-12-16 10:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `api_countrestrict`
-- ----------------------------
DROP TABLE IF EXISTS `api_countrestrict`;
CREATE TABLE `api_countrestrict` (
  `cr_id` varchar(100) NOT NULL DEFAULT '',
  `cr_cusid` varchar(32) DEFAULT NULL,
  `cr_version` varchar(10) DEFAULT NULL,
  `cr_action` varchar(50) DEFAULT NULL,
  `cr_count` int(11) DEFAULT NULL,
  `cr_apitype` varchar(50) DEFAULT NULL,
  `cr_apitypename` varchar(50) DEFAULT NULL,
  `cr_actionname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cr_id`),
  KEY `idx_crid` (`cr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_countrestrict
-- ----------------------------
