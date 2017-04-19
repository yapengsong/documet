DELETE FROM ecmc_sys_authority WHERE id = '40288eee545fc01a01545fea5416001a';
INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) 
VALUES ('40288eee545fc01a01545fea5416001a', '创建', '创建数据中心', '2016-4-29 10:47:53', '40288eee545fc01a01545fe4cd06000f', '1', 
'ui:phy_datacenter_create;\nhttp:/ecmc/physical/datacenter/createdatacenter.do;
\nhttp:/ecmc/physical/datacenter/checkNameExist.do;\nhttp:/ecmc/physical/datacenter/checkCabinetNum.do;
\nhttp:/ecmc/physical/datacenter/checkDcAddressExist.do;\nhttp:/ecmc/physical/datacenter/checkapidccode.do;',
 'ff8080815438ac44015438ce7e8e000c', '0');