-- cloud_project的临时列(end_time)
ALTER TABLE cloud_project ADD COLUMN end_time datetime;

UPDATE cloud_project
SET end_time = '2018-01-01 00:00:00',
 image_count = 10;
-- 项目总数（68，非内部客户（正式客户）：34）
-- 各个项目下的到期时间设定
update cloud_project set end_time = '2017-03-21 00:00:00' where prj_id ='c155d8665b4c49858ce17b55b995ab93' and prj_name ='千金贷_01';
update cloud_project set end_time = '2017-06-24 00:00:00' where prj_id ='577b524527da4165b0cc5ed7a5774ad5' and prj_name ='创星文化_01';
update cloud_project set end_time = '2017-09-04 00:00:00' where prj_id ='d516d58e06134620885fedfa2a34a804' and prj_name ='海颐软件_01';
update cloud_project set end_time = '2017-11-04 00:00:00' where prj_id ='5d32d8001de044e6a7b9c87710a3669c' and prj_name ='广州振亚网络_01';
update cloud_project set end_time = '2017-12-12 00:00:00' where prj_id ='175138f1d54b4ec7abbcab331b81fe78' and prj_name ='拍库科技_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='e7fb0780ad4a424f8ae00b498a60b47e' and prj_name ='亿力吉奥_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='de7e8c8d4f8044dbabfc505e70223e2b' and prj_name ='中工经云_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='bfdec85246a6432aa49984efddc0ab24' and prj_name ='中工经云地图_01';
update cloud_project set end_time = '2017-10-02 00:00:00' where prj_id ='9e2fb3eea3b44de1b0e73c5ec8ced444' and prj_name ='东华理工大学_01';
update cloud_project set end_time = '2017-05-26 00:00:00' where prj_id ='a2d71ffb14564fe1891045616418c418' and prj_name ='呼朋唤友_01';
update cloud_project set end_time = '2017-04-20 00:00:00' where prj_id ='4272fa45cfb14c919cabbbc0c416a0ba' and prj_name ='北京飞锐科技有限公_01';
update cloud_project set end_time = '2017-10-19 00:00:00' where prj_id ='a7f034fe207d4e09be039d028831bc2e' and prj_name ='创意天成_02';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='79de6b4a6cea4a89996497b58614abbe' and prj_name ='沃圃生农业科技_01';
update cloud_project set end_time = '2017-08-01 00:00:00' where prj_id ='027f19cb586e404c9fec691f07bb1d33' and prj_name ='聆喆科技_01';
update cloud_project set end_time = '2017-05-01 00:00:00' where prj_id ='2c415b5b1e644c93a6cb079c61aa0c0c' and prj_name ='用友网络_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='28c8be9e3bbe457b95deec7b9aec0d90' and prj_name ='吉威数源_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='a7682ddfb83a4e5eae904d8d8e1942ab' and prj_name ='清华大学软件学院_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='964b6e203fd94314a59337341ab3457f' and prj_name ='张继勇_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='8c9cab25ce894c9990fed68ae035407f' and prj_name ='北京企智软创_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='0be1b19682e648d9932561d2fe067c6a' and prj_name ='天信瑞安_01';
update cloud_project set end_time = '2017-10-01 00:00:00' where prj_id ='88c8206f6cc347879a48ab96ba1927b8' and prj_name ='青年创业_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='944c826e96f84c81b49b7686a9454e39' and prj_name ='百域联达_01';
update cloud_project set end_time = '2019-10-26 00:00:00' where prj_id ='83aee40f5b7b4f959497e79574c4de13' and prj_name ='云福科技_01';
update cloud_project set end_time = '2019-10-26 00:00:00' where prj_id ='6c95067fd0a648b096e85a48c832896e' and prj_name ='中交信通_01';
update cloud_project set end_time = '2017-09-06 00:00:00' where prj_id ='a877ecc70d294f5c8b5459ae84eeb672' and prj_name ='九其软件_01';
update cloud_project set end_time = '2017-07-07 00:00:00' where prj_id ='f9694bab3f76470e809bebeaf128e9bc' and prj_name ='超算科技_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='80356d6e52a1479a8bdf9fc031be51bb' and prj_name ='北京思拓合众_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='6808cd71c1124daba10c60148ac1dbbe' and prj_name ='北京瑞友科技_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='2d574f0f7c08433c808c379c2264afb7' and prj_name ='天天向上_01';
update cloud_project set end_time = '2018-02-01 00:00:00' where prj_id ='5aae7cf185c1433aa1ea486ee4601024' and prj_name ='北京中智远洋_02';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='87573e898b7b41f8b7bb22ce7640f092' and prj_name ='西科玛口腔_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='f8b28808b79c4669afb5d183e20757c1' and prj_name ='北京元鼎时代科技_01';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='c04c10bd199e4f97a3d99470ce762c18' and prj_name ='中量宝科技有限公司_02';
update cloud_project set end_time = '2018-01-01 00:00:00' where prj_id ='4880a20160c24d0d92877dcdc32f391e' and prj_name ='北京师科阳光信息_01';

-- 处理cloud_vm（云主机）表资源的到期时间
update cloud_vm cv set cv.charge_state = '0', cv.pay_type = '1', cv.is_visable = '1', end_time = (select end_time from cloud_project where prj_id = cv.prj_id) where cv.is_deleted = '0';  
-- 处理cloud_volume（云硬盘）表资源的到期时间
update cloud_volume cv set cv.charge_state = '0', cv.pay_type = '1', cv.is_visable = '1', end_time = (select end_time from cloud_project where prj_id = cv.prj_id) where cv.is_deleted = '0';  
-- 处理cloud_network（网络）表资源的到期时间
update cloud_network cn set cn.charge_state='0', cn.pay_type='1', cn.is_visible='1', end_time=(select end_time from cloud_project where prj_id = cn.prj_id) ;
-- 处理cloud_floatip（公网IP）表资源的到期时间
update cloud_floatip cf set cf.charge_state ='0', cf.pay_type ='1', cf.is_visable ='1', end_time = (select end_time from cloud_project where prj_id = cf.prj_id) where cf.is_deleted = '0';
-- 处理cloud_lbpool（负载均衡）表资源的到期时间
update cloud_ldpool  cldp set cldp.charge_state ='0', cldp.pay_type ='1', cldp.is_visible ='1', end_time = (select end_time from cloud_project where prj_id = cldp.prj_id);



-- 删除 cloud_project的临时列(end_time)
ALTER TABLE cloud_project DROP COLUMN end_time;