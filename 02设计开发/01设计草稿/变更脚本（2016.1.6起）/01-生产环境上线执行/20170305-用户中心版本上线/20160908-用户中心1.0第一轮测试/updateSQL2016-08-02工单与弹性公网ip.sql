/*
Navicat MySQL Data Transfer

Source Server         : 研发192.168.8.34
Source Server Version : 50173
Source Host           : 192.168.8.34:3306
Source Database       : ecmc01

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-08-02 11:24:42
Reason: 工单与弹性公网ip
Author: 陈鹏飞
*/
/*
 * 工单
 */
ALTER TABLE workorder ADD COLUMN apply_username VARCHAR (32);

ALTER TABLE workorder ADD COLUMN head_username VARCHAR (50);

ALTER TABLE workorder ADD COLUMN cre_username VARCHAR (50);

ALTER TABLE work_opinion ADD COLUMN cre_username VARCHAR (50);

ALTER TABLE work_opinion ADD COLUMN reply_username VARCHAR (50);

UPDATE workorder wo
LEFT JOIN sys_selfuser u ON u.user_id = wo.apply_user
LEFT JOIN ecmc_sys_user eu ON eu.id = wo.head_user
LEFT JOIN sys_selfuser u1 ON u1.user_id = wo.cre_user
SET wo.apply_username = IFNULL(
	u.user_account,
	wo.apply_user
),
 wo.head_username = eu.`name`,
 wo.cre_username = IFNULL(
	u1.user_account,
	(
		SELECT
			eu1.`name`
		FROM
			ecmc_sys_user eu1
		WHERE
			eu1.id = wo.cre_user
	)
);

UPDATE work_opinion wo
LEFT JOIN sys_selfuser u ON u.user_id = wo.cre_user_id
LEFT JOIN ecmc_sys_user eu ON eu.id = wo.reply_user
SET wo.cre_username = IFNULL(
	u.user_account,
	(
		SELECT
			eu1.`name`
		FROM
			ecmc_sys_user eu1
		WHERE
			eu1.id = wo.cre_user_id
	)
),
 wo.reply_username = IFNULL(
	eu.`name`,
	(
		SELECT
			u1.user_account
		FROM
			sys_selfuser u1
		WHERE
			u1.user_id = wo.reply_user
	)
);
/*
 *弹性公网ip
 */
 ALTER TABLE cloud_floatip ADD COLUMN end_time DATETIME;
ALTER TABLE cloud_floatip ADD COLUMN charge_state char(1);
ALTER TABLE cloud_floatip ADD COLUMN pay_type char(1);
ALTER TABLE cloud_floatip ADD COLUMN flo_status char(1);