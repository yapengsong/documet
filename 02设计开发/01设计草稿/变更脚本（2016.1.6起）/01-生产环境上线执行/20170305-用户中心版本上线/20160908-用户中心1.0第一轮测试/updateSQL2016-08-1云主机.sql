-- cloud_vm的字段调整SQL,
ALTER TABLE cloud_vm
ADD COLUMN self_ip  varchar(100) NULL AFTER reserve5,
ADD COLUMN self_subnetid  varchar(100) NULL AFTER self_ip,
ADD COLUMN port_id  varchar(100) NULL AFTER self_subnetid,
ADD COLUMN self_portid  varchar(100) NULL AFTER port_id,
ADD COLUMN pay_type  char(1) NULL AFTER self_portid,
ADD COLUMN charge_state  char(1) NULL AFTER pay_type,
ADD COLUMN is_visable  char(1) NULL AFTER charge_state;

-- 历史数据处理charge_status的值
update cloud_vm set charge_state ='0' where charge_state is null;
-- 历史数据处理is_visable的值
update cloud_vm set is_visable ='1' where is_visable is null;


-- 创建云主机订单表cloud_vmorder
DROP TABLE IF EXISTS `cloudorder_vm`;
CREATE TABLE `cloudorder_vm` (
	`ordervm_id` VARCHAR (100) NOT NULL,
	`vm_id` VARCHAR (100) NULL,
	`order_no` VARCHAR (18) NULL,
	`dc_id` VARCHAR (100) NULL,
	`prj_id` VARCHAR (100) NULL,
	`vm_name` VARCHAR (100) NULL,
	`net_id` VARCHAR (100) NULL,
	`subnet_id` VARCHAR (100) NULL,
	`self_subnetid` VARCHAR (100) NULL,
	`count` INT NULL,
	`os_type` VARCHAR (100) NULL,
	`sys_type` VARCHAR (100) NULL,
	`cpu` INT NULL,
	`ram` INT NULL,
	`disk` INT NULL,
	`image_type` VARCHAR (100) NULL,
	`image_id` VARCHAR (100) NULL,
	`username` VARCHAR (100) NULL,
	`password` VARCHAR (100) NULL,
	`sg_id` VARCHAR (100) NULL,
	`create_orderdate` datetime NULL,
	`create_user` VARCHAR (100) NULL,
	`cus_id` VARCHAR (100) NULL,
	`buy_cycle` INT NULL,
	`price` NUMERIC(16,3) NULL,
	`buy_floatip` CHAR (1) NULL,
	`order_type` CHAR (1) NULL,
	`pay_type` CHAR (1) NULL,
	`order_resources` VARCHAR (2000) NULL,
	PRIMARY KEY (`ordervm_id`)
)ENGINE=InnoDB;

-- 批量创建资源表
DROP TABLE IF EXISTS `cloud_batchresource`;
CREATE TABLE cloud_batchresource (
	resource_id VARCHAR(100) NOT NULL ,
	resource_type VARCHAR(20) NULL,
	order_no VARCHAR(18) NOT NULL 
)ENGINE=InnoDB;