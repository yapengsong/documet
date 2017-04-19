

INSERT INTO `ecmc_sys_authority` (`id`, `name`, `description`, `createtime`, `createdby`, `enableflag`, `permission`, `menu_id`, `lock`) VALUES ('4028995d5a83628d015a836b38020000', '查询SSH密钥', '查询密钥', '2017-2-28 14:32:06', '2c91808256f81c44015702bbf9510000', '1', 'ui:secretkey_qurey;\nhttp:/ecmc/virtual/secretkey/getsecretkeylist.do;\nhttp:/ecmc/virtual/secretkey/getsecretkeybyid.do\nhttp:/ecmc/virtual/secretkey/getsecretkeyByIdAndVmList.do', 'ff8080815438ac44015438bfc39a0004', '0');





INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('402899745a8cabe0015a8cbfc51400e0', '40289092543bd6a801543bfee6a8000b', '4028995d5a83628d015a836b38020000');
INSERT INTO `ecmc_sys_roleauth` (`id`, `role_id`, `auth_id`) VALUES ('402890ab5a89e491015a89e910fe0122', '40289092543bd6a801543bff30f2000c', '4028995d5a83628d015a836b38020000');
