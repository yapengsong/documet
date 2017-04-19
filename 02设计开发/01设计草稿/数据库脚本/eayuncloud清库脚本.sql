/** ���⻯����Դ */
TRUNCATE TABLE cloud_model;

TRUNCATE TABLE cloud_computenode;

TRUNCATE TABLE cloud_disksnapshot;

TRUNCATE TABLE cloud_firewall;

TRUNCATE TABLE cloud_flavor;

TRUNCATE TABLE cloud_floatip;

TRUNCATE TABLE cloud_fwpolicy;

TRUNCATE TABLE cloud_fwrule;

TRUNCATE TABLE cloud_grouprule;

TRUNCATE TABLE cloud_image;

TRUNCATE TABLE cloud_ldlistener;

TRUNCATE TABLE cloud_ldmember;

TRUNCATE TABLE cloud_ldmonitor;

TRUNCATE TABLE cloud_ldpool;

TRUNCATE TABLE cloud_ldpoolldmonitor;

TRUNCATE TABLE cloud_ldvip;

TRUNCATE TABLE cloud_network;

TRUNCATE TABLE cloud_project;

TRUNCATE TABLE cloud_route;

TRUNCATE TABLE cloud_securitygroup;

TRUNCATE TABLE cloud_subnetwork;

TRUNCATE TABLE cloud_vm;

TRUNCATE TABLE cloud_vmcustomimage;

TRUNCATE TABLE cloud_vmsecuritygroup;

TRUNCATE TABLE cloud_volume;

TRUNCATE TABLE cloud_batchresource;

TRUNCATE TABLE cloud_vpnikepolicy;

TRUNCATE TABLE cloud_vpnconn;

TRUNCATE TABLE cloud_vpnipsecpolicy;

TRUNCATE TABLE cloud_vpnservice;

TRUNCATE TABLE cloud_portmapping;

/** �������Դ */
TRUNCATE TABLE dc_cabinet;

TRUNCATE TABLE dc_cabinet_rf;
/** TRUNCATE TABLE dc_datacenter; */
TRUNCATE TABLE dc_firewall;

TRUNCATE TABLE dc_server;

TRUNCATE TABLE dc_server_model;

TRUNCATE TABLE dc_storage;

TRUNCATE TABLE dc_switch;

TRUNCATE TABLE cloud_outip;

/** �����Ϣ */
TRUNCATE TABLE monitor_alarm_group;

TRUNCATE TABLE monitor_alarm_info;

TRUNCATE TABLE monitor_alarm_object;

TRUNCATE TABLE monitor_alarm_rule;

TRUNCATE TABLE monitor_alarm_template;

TRUNCATE TABLE monitor_alarm_template_detail;

TRUNCATE TABLE monitor_job_pm;

TRUNCATE TABLE monitor_job_quota;

TRUNCATE TABLE monitor_job_vm;

TRUNCATE TABLE monitor_task_pm;

TRUNCATE TABLE monitor_task_quota;

TRUNCATE TABLE monitor_task_vm;

/** QURATZ ϵͳ�� */
TRUNCATE TABLE QRTZ_BLOB_TRIGGERS;

TRUNCATE TABLE QRTZ_CALENDARS;

TRUNCATE TABLE QRTZ_CRON_TRIGGERS;

TRUNCATE TABLE QRTZ_FIRED_TRIGGERS;

TRUNCATE TABLE QRTZ_JOB_DETAILS;

TRUNCATE TABLE QRTZ_LOCKS;

TRUNCATE TABLE QRTZ_PAUSED_TRIGGER_GRPS;

TRUNCATE TABLE QRTZ_SCHEDULER_STATE;

TRUNCATE TABLE QRTZ_SIMPLE_TRIGGERS;

TRUNCATE TABLE QRTZ_SIMPROP_TRIGGERS;

TRUNCATE TABLE QRTZ_TRIGGERS;

/** ��־�� **/
TRUNCATE TABLE sys_oper_log;

TRUNCATE TABLE sys_log;

/** ������ **/
TRUNCATE TABLE work_opinion;

TRUNCATE TABLE workorder;

TRUNCATE TABLE workorder_assess;

TRUNCATE TABLE order_number;

TRUNCATE TABLE work_file;

TRUNCATE TABLE work_quota;

/** ϵͳ�� **/
/** TRUNCATE TABLE sys_user; **/

TRUNCATE TABLE quota_template;

/** ��� **/
TRUNCATE TABLE ecsc_alarmrule;

TRUNCATE TABLE ecsc_alarmcontact;

TRUNCATE TABLE ecsc_contact;

TRUNCATE TABLE ecsc_contactgroup;

TRUNCATE TABLE ecsc_contactgroupdetail;

TRUNCATE TABLE ecsc_alarmtrigger;

TRUNCATE TABLE ecsc_alarmobject;

TRUNCATE TABLE ecsc_monitoralarmitem;

TRUNCATE TABLE ecsc_alarmmessage;

TRUNCATE TABLE ecmc_contact;

TRUNCATE TABLE ecmc_contactgroup;

TRUNCATE TABLE ecmc_contactgroupdetail;

TRUNCATE TABLE ecmc_alarmrule;

TRUNCATE TABLE ecmc_alarmtrigger;

TRUNCATE TABLE ecmc_alarmobject;

TRUNCATE TABLE ecmc_monitoralarmitem;

TRUNCATE TABLE ecmc_alarmmessage;

TRUNCATE TABLE ecmc_alarmcontact;

/** ���ţ����� **/
TRUNCATE TABLE news_recinfo;

TRUNCATE TABLE news_sendinfo;

TRUNCATE TABLE notice_info;

/** �ļ� **/
TRUNCATE TABLE sys_eayunfile;

/** �ʼ������� **/
TRUNCATE TABLE sys_mail;

TRUNCATE TABLE sys_mailverify;

TRUNCATE TABLE sys_no_send_sms;

TRUNCATE TABLE sys_phoneverify;

TRUNCATE TABLE sys_sms;

/** �û���Ȩ�� **/
TRUNCATE TABLE sys_selfcustomer;

TRUNCATE TABLE sys_selfcustomerbak;

TRUNCATE TABLE sys_selfrole;

TRUNCATE TABLE sys_selfrolepower;

TRUNCATE TABLE sys_selfuser;

TRUNCATE TABLE sys_selfuserbak;

TRUNCATE TABLE sys_selfuserprj;

/** ��ǩ **/
TRUNCATE TABLE sys_tag;

TRUNCATE TABLE sys_taggroup;

TRUNCATE TABLE sys_tagresource;

/** ����洢**/
TRUNCATE TABLE obs_accesskey;

TRUNCATE TABLE obs_user;

TRUNCATE TABLE cus_service_state;

TRUNCATE TABLE cdn_bucket;

TRUNCATE TABLE cus_blockresource;

/** ֧������� **/
TRUNCATE TABLE money_billing_factor;

TRUNCATE TABLE money_chargerecord;

TRUNCATE TABLE money_record;

TRUNCATE TABLE money_account;

TRUNCATE TABLE pay_orderrecord;

TRUNCATE TABLE pay_record;

TRUNCATE TABLE pay_refundrecord;

/** ���� **/
TRUNCATE TABLE cloudorder_vm;

TRUNCATE TABLE cloudorder_floatip;

TRUNCATE TABLE cloudorder_ldpool;

TRUNCATE TABLE cloudorder_network;

TRUNCATE TABLE cloudorder_snapshot;

TRUNCATE TABLE cloudorder_volume;

TRUNCATE TABLE cloudorder_vpn;

TRUNCATE TABLE order_info;

TRUNCATE TABLE order_state_record;

TRUNCATE TABLE order_resource;

/** ���� **/
TRUNCATE TABLE apply_info;

TRUNCATE TABLE unit_apply_web;

TRUNCATE TABLE unit_info;

TRUNCATE TABLE website_info;

/** ɾ��ecmc�û�����ɫ **/
/** ɾ��ecmc�û���������root **/
delete from ecmc_sys_user where account<>'root';
/** ����ecmc root�û�����Ϊ1234qwer **/
update ecmc_sys_user set password='86803E460C2B5564690B795C82A16A2E' ,salt='532172' where account='root';

/** ɾ��ecmc�û����ɫ�Ĺ�ϵ **/
delete from ecmc_sys_userrole where user_id not in (select id from ecmc_sys_user);

/** ɾ��ecmc��֯���� **/
TRUNCATE TABLE ecmc_sys_department;

/** ɾ��ecmc��ɫ **/
delete from ecmc_sys_role where id not in ('40288ee75456549a015456b8df2e000d','40289092543bd6a801543bfeb3fa000a','40289092543bd6a801543bfee6a8000b','40289092543bd6a801543bff30f2000c','40289092543bd6a801543bff655b000d');
delete from ecmc_sys_roleauth where role_id not in ('40288ee75456549a015456b8df2e000d','40289092543bd6a801543bfeb3fa000a','40289092543bd6a801543bfee6a8000b','40289092543bd6a801543bff30f2000c','40289092543bd6a801543bff655b000d');
delete from ecmc_sys_rolemenu where role_id not in ('40288ee75456549a015456b8df2e000d','40289092543bd6a801543bfeb3fa000a','40289092543bd6a801543bfee6a8000b','40289092543bd6a801543bff30f2000c','40289092543bd6a801543bff655b000d');



