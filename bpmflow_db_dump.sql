-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: bpmflow_db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add department',1,'add_department'),(2,'Can change department',1,'change_department'),(3,'Can delete department',1,'delete_department'),(4,'Can view department',1,'view_department'),(5,'Can add user',2,'add_customuser'),(6,'Can change user',2,'change_customuser'),(7,'Can delete user',2,'delete_customuser'),(8,'Can view user',2,'view_customuser'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_PMSapp_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_PMSapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `pmsapp_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'contenttypes','contenttype'),(2,'PMSapp','customuser'),(1,'PMSapp','department'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-13 22:42:39.896567'),(2,'contenttypes','0002_remove_content_type_name','2024-06-13 22:42:40.020483'),(3,'auth','0001_initial','2024-06-13 22:42:40.281953'),(4,'auth','0002_alter_permission_name_max_length','2024-06-13 22:42:40.341346'),(5,'auth','0003_alter_user_email_max_length','2024-06-13 22:42:40.347371'),(6,'auth','0004_alter_user_username_opts','2024-06-13 22:42:40.353345'),(7,'auth','0005_alter_user_last_login_null','2024-06-13 22:42:40.362241'),(8,'auth','0006_require_contenttypes_0002','2024-06-13 22:42:40.365207'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-13 22:42:40.371189'),(10,'auth','0008_alter_user_username_max_length','2024-06-13 22:42:40.377214'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-13 22:42:40.383195'),(12,'auth','0010_alter_group_name_max_length','2024-06-13 22:42:40.410894'),(13,'auth','0011_update_proxy_permissions','2024-06-13 22:42:40.417875'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-13 22:42:40.423887'),(15,'PMSapp','0001_initial','2024-06-13 22:42:40.896446'),(16,'admin','0001_initial','2024-06-13 22:42:41.031637'),(17,'admin','0002_logentry_remove_auto_add','2024-06-13 22:42:41.039616'),(18,'admin','0003_logentry_add_action_flag_choices','2024-06-13 22:42:41.048592'),(19,'sessions','0001_initial','2024-06-13 22:42:41.084000');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('nkisg79v5air71ri9qonj8zw91jiehja','e30:1sHu18:agoKsXUQLezUhSdzczzE5RcswJPwKOfjREquxTp9K0Y','2024-06-27 23:38:06.130605'),('ynql72isooldh3y3btoq916o9q517x7b','e30:1sHtkC:hwUqcIUa-osAGWv8hwGtHaDHe1AlcxkiZUc2d1xBwxA','2024-06-27 23:20:36.086805');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_customuser`
--

DROP TABLE IF EXISTS `pmsapp_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(10) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `patronymic` varchar(30) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `passport_data` varchar(100) NOT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `PMSapp_customuser_department_id_801c894b_fk_PMSapp_department_id` (`department_id`),
  CONSTRAINT `PMSapp_customuser_department_id_801c894b_fk_PMSapp_department_id` FOREIGN KEY (`department_id`) REFERENCES `pmsapp_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_customuser`
--

LOCK TABLES `pmsapp_customuser` WRITE;
/*!40000 ALTER TABLE `pmsapp_customuser` DISABLE KEYS */;
INSERT INTO `pmsapp_customuser` VALUES (1,'pbkdf2_sha256$720000$llMuWQI7S7MF3yIlFD09ll$ZWL52zC4VifA0YZfPamKs0vCQ7rbGbiklZHkDwG7aOY=','2024-06-13 23:20:36.094660',1,'root','slava.volkov.228@yandex.ru',1,1,'2024-06-13 22:43:55.154372','','','','','','',NULL),(2,'pbkdf2_sha256$720000$XtrhtfaCb1DDXTvqPNk5FA$KLZiZocPTpq/qYuHgu3K4vTuQpA5uRCCx+DiDXIY/S4=','2024-06-13 23:38:06.137713',0,'Rekvizit8bit','',0,1,'2024-06-13 23:38:05.639697','employee','╨Ф╨╝╨╕╤В╤А╨╕╨╣','╨Ъ╤Г╨┐╨╗╨╕╨╜╨╛╨▓','╨Ы╨╡╤В╤Б╨┐╨╗╨╡╨╡╨▓╨╕╤З','+79160749725','4619234277',1);
/*!40000 ALTER TABLE `pmsapp_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_customuser_groups`
--

DROP TABLE IF EXISTS `pmsapp_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PMSapp_customuser_groups_customuser_id_group_id_283305b8_uniq` (`customuser_id`,`group_id`),
  KEY `PMSapp_customuser_groups_group_id_814e1342_fk_auth_group_id` (`group_id`),
  CONSTRAINT `PMSapp_customuser_gr_customuser_id_33adef09_fk_PMSapp_cu` FOREIGN KEY (`customuser_id`) REFERENCES `pmsapp_customuser` (`id`),
  CONSTRAINT `PMSapp_customuser_groups_group_id_814e1342_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_customuser_groups`
--

LOCK TABLES `pmsapp_customuser_groups` WRITE;
/*!40000 ALTER TABLE `pmsapp_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmsapp_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_customuser_user_permissions`
--

DROP TABLE IF EXISTS `pmsapp_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PMSapp_customuser_user_p_customuser_id_permission_9bf74597_uniq` (`customuser_id`,`permission_id`),
  KEY `PMSapp_customuser_us_permission_id_8cc7299f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `PMSapp_customuser_us_customuser_id_5cae4642_fk_PMSapp_cu` FOREIGN KEY (`customuser_id`) REFERENCES `pmsapp_customuser` (`id`),
  CONSTRAINT `PMSapp_customuser_us_permission_id_8cc7299f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_customuser_user_permissions`
--

LOCK TABLES `pmsapp_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `pmsapp_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmsapp_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_department`
--

DROP TABLE IF EXISTS `pmsapp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_department`
--

LOCK TABLES `pmsapp_department` WRITE;
/*!40000 ALTER TABLE `pmsapp_department` DISABLE KEYS */;
INSERT INTO `pmsapp_department` VALUES (2,'Finance Department'),(1,'IT Department');
/*!40000 ALTER TABLE `pmsapp_department` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-14  2:47:03
