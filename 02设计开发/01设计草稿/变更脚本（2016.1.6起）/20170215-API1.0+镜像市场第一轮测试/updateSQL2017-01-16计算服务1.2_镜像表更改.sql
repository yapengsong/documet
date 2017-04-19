-- ¼ÆËã1.2¾µÏñ±íÐÞ¸Ä
ALTER TABLE cloud_image ADD sys_detail VARCHAR(100);
ALTER TABLE cloud_image ADD source_id  VARCHAR(100);
ALTER TABLE cloud_image ADD is_use CHAR(1);
ALTER TABLE cloud_image ADD sysdisk_size DECIMAL(10);
ALTER TABLE cloud_image ADD provider VARCHAR(200);
ALTER TABLE cloud_image ADD integrated_software VARCHAR(800);
ALTER TABLE cloud_image ADD profession_type VARCHAR(100);
ALTER TABLE cloud_image ADD marketimage_depict LONGTEXT;