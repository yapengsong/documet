-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.8.34    Database: ecmc01
-- ------------------------------------------------------
-- Server version	5.1.73-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cloud_rdsdefaultconfigparams`
--

DROP TABLE IF EXISTS `cloud_rdsdefaultconfigparams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_rdsdefaultconfigparams` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `min_size` varchar(50) DEFAULT NULL,
  `max_size` varchar(50) DEFAULT NULL,
  `restart` varchar(1) DEFAULT NULL,
  `override` varchar(1) DEFAULT NULL,
  `default_value` varchar(50) DEFAULT NULL,
  `version` varchar(36) DEFAULT NULL,
  `is_static` varchar(1) DEFAULT NULL,
  `option_values` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_rdsdefaultconfigparams`
--

LOCK TABLES `cloud_rdsdefaultconfigparams` WRITE;
/*!40000 ALTER TABLE `cloud_rdsdefaultconfigparams` DISABLE KEYS */;
INSERT INTO `cloud_rdsdefaultconfigparams` VALUES ('402890ba5ab6137f015ab614ada10000','auto_increment_increment','int','1','65535','0','0','1','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adad0001','auto_increment_offset','int','1','65535','0','0','1','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adad0002','autocommit','int','0','1','0','0','1','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adad0003','bulk_insert_buffer_size','int','1','18446744073709547520','0','0','8388608','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adad0004','character_set_client','string',NULL,NULL,'0','0','latin1','mysql 5.5','0','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adae0005','character_set_connection','string',NULL,NULL,'0','0','latin1','mysql 5.5','2','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adae0006','character_set_database','string',NULL,NULL,'0','0','latin1','mysql 5.5','2','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adae0007','character_set_filesystem','string',NULL,NULL,'0','0','binary','mysql 5.5','0','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adae0008','character_set_results','string',NULL,NULL,'0','0','latin1','mysql 5.5','2','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adaf0009','character_set_server','string',NULL,NULL,'0','0','latin1','mysql 5.5','0','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adaf000a','collation_connection','string',NULL,NULL,'0','0','latin1_swedish_ci','mysql 5.5','2','latin1_swedish_ci;utf8_general_ci;utf8mb4_general_ci;utf8_unicode_ci'),('402890ba5ab6137f015ab614adaf000b','collation_database','string',NULL,NULL,'0','0','latin1_swedish_ci','mysql 5.5','2','latin1_swedish_ci;utf8_bin;utf8_general_ci;utf8_unicode_ci;utf8mb4_general_ci'),('402890ba5ab6137f015ab614adaf000c','collation_server','string',NULL,NULL,'0','0','latin1_swedish_ci','mysql 5.5','2','latin1_swedish_ci;utf8_bin;utf8_general_ci;utf8_unicode_ci;utf8mb4_general_ci'),('402890ba5ab6137f015ab614adb1000d','connect_timeout','int','1','65535','0','1','15','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb1000e','expire_logs_days','int','1','65535','0','0','0','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb1000f','innodb_buffer_pool_size','int','5242880','68719476736','1','1','5242880','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb20010','innodb_file_per_table','int','0','1','1','1','1','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb20011','innodb_flush_log_at_trx_commit','int','0','2','0','0','1','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb20012','innodb_log_buffer_size','int','1048576','4294967296','1','1','8388608','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb20013','innodb_open_files','int','10','4294967296','1','0','300','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb20014','innodb_thread_concurrency','int','0','1000','0','0','0','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb30015','interactive_timeout','int','1','65535','0','0','28800','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb30016','join_buffer_size','int','0','4294967296','0','1','1024','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb30017','key_buffer_size','int','0','4294967297','0','1','51200','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb30018','local_infile','int','0','1','0','1','0','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb30019','max_allowed_packet','int','1024','1073741824','0','1','16777216','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb3001a','max_connect_errors','int','1','18446744073709547520','0','0','1000000','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb4001b','max_connections','int','1','65535','0','1','2000','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb4001c','max_user_connections','int','1','10000','0','1','2000','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb4001d','myisam_sort_buffer_size','int','4','18446744073709547520','0','0','8388608','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb4001e','server_id','int','1','100000','1','1','{{server_id}}','mysql 5.5','2',NULL),('402890ba5ab6137f015ab614adb4001f','sort_buffer_size','int','32776','18446744073709547520','0','1','524288','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb40020','sync_binlog','int','0','18446744073709547520','0','0','0','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb50021','wait_timeout','int','1','31536000','0','1','120','mysql 5.5','0',NULL),('402890ba5ab6137f015ab614adb50022','auto_increment_increment','int','1','65535','0','0','1','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb50023','auto_increment_offset','int','1','65535','0','0','1','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb50024','autocommit','int','0','1','0','0','1','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb50025','bulk_insert_buffer_size','int','1','18446744073709547520','0','0','8388608','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb50026','character_set_client','string',NULL,NULL,'0','0','latin1','mysql 5.6','0','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adb50027','character_set_connection','string',NULL,NULL,'0','0','latin1','mysql 5.6','2','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adb60028','character_set_database','string',NULL,NULL,'0','0','latin1','mysql 5.6','2','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adb60029','character_set_filesystem','string',NULL,NULL,'0','0','binary','mysql 5.6','0','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adb6002a','character_set_results','string',NULL,NULL,'0','0','latin1','mysql 5.6','2','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adb6002b','character_set_server','string',NULL,NULL,'0','0','latin1','mysql 5.6','0','ascii;big5;binary;gb2312;gbk;latin1;latin2;latin5;latin7;utf16;utf32;utf8;utf8mb4'),('402890ba5ab6137f015ab614adb6002c','collation_connection','string',NULL,NULL,'0','0','latin1_swedish_ci','mysql 5.6','2','latin1_swedish_ci;utf8_general_ci;utf8mb4_general_ci;utf8_unicode_ci'),('402890ba5ab6137f015ab614adb7002d','collation_database','string',NULL,NULL,'0','0','latin1_swedish_ci','mysql 5.6','2','latin1_swedish_ci;utf8_bin;utf8_general_ci;utf8_unicode_ci;utf8mb4_general_ci'),('402890ba5ab6137f015ab614adb7002e','collation_server','string',NULL,NULL,'0','0','latin1_swedish_ci','mysql 5.6','2','latin1_swedish_ci;utf8_bin;utf8_general_ci;utf8_unicode_ci;utf8mb4_general_ci'),('402890ba5ab6137f015ab614adb7002f','connect_timeout','int','1','65535','0','1','15','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb70030','expire_logs_days','int','1','65535','0','0','0','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb70031','innodb_buffer_pool_size','int','5242880','68719476736','1','1','5242880','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb70032','innodb_file_per_table','int','0','1','1','1','1','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb80033','innodb_flush_log_at_trx_commit','int','0','2','0','0','1','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb80034','innodb_log_buffer_size','int','1048576','4294967296','1','1','8388608','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb80035','innodb_open_files','int','10','4294967296','1','0','300','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb80036','innodb_thread_concurrency','int','0','1000','0','0','0','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb80037','interactive_timeout','int','1','65535','0','0','28800','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb80038','join_buffer_size','int','0','4294967296','0','1','1024','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb90039','key_buffer_size','int','0','4294967297','0','1','51200','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb9003a','local_infile','int','0','1','0','1','0','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb9003b','max_allowed_packet','int','1024','1073741824','0','1','16777216','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb9003c','max_connect_errors','int','1','18446744073709547520','0','0','1000000','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb9003d','max_connections','int','1','65535','0','1','2000','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adb9003e','max_user_connections','int','1','10000','0','1','2000','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adba003f','myisam_sort_buffer_size','int','4','18446744073709547520','0','0','8388608','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adba0040','server_id','int','1','100000','1','1','{{server_id}}','mysql 5.6','2',NULL),('402890ba5ab6137f015ab614adba0041','sort_buffer_size','int','32776','18446744073709547520','0','1','524288','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adba0042','sync_binlog','int','0','18446744073709547520','0','0','0','mysql 5.6','0',NULL),('402890ba5ab6137f015ab614adbb0043','wait_timeout','int','1','31536000','0','1','120','mysql 5.6','0',NULL);
/*!40000 ALTER TABLE `cloud_rdsdefaultconfigparams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-31 10:24:09
