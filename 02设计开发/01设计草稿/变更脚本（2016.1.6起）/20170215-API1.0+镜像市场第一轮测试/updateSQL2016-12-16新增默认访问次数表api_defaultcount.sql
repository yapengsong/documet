/*
新增默认访问次数表
曹翔宇

Date: 2016-12-16 10:31:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `api_defaultcount`
-- ----------------------------
DROP TABLE IF EXISTS `api_defaultcount`;
CREATE TABLE `api_defaultcount` (
  `dc_id` varchar(100) NOT NULL DEFAULT '',
  `dc_action` varchar(50) DEFAULT NULL,
  `dc_count` int(10) DEFAULT NULL,
  `dc_apitype` varchar(50) DEFAULT NULL,
  `dc_version` varchar(10) DEFAULT NULL,
  `dc_apitypename` varchar(50) DEFAULT NULL,
  `dc_actionname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dc_id`),
  KEY `idx_dcid` (`dc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api_defaultcount
-- ----------------------------
