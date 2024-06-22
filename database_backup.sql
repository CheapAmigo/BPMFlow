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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add department',1,'add_department'),(2,'Can change department',1,'change_department'),(3,'Can delete department',1,'delete_department'),(4,'Can view department',1,'view_department'),(5,'Can add user',2,'add_customuser'),(6,'Can change user',2,'change_customuser'),(7,'Can delete user',2,'delete_customuser'),(8,'Can view user',2,'view_customuser'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add task',8,'add_task'),(30,'Can change task',8,'change_task'),(31,'Can delete task',8,'delete_task'),(32,'Can view task',8,'view_task'),(33,'Can add schedule',9,'add_schedule'),(34,'Can change schedule',9,'change_schedule'),(35,'Can delete schedule',9,'delete_schedule'),(36,'Can view schedule',9,'view_schedule'),(37,'Can add position',10,'add_position'),(38,'Can change position',10,'change_position'),(39,'Can delete position',10,'delete_position'),(40,'Can view position',10,'view_position');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-17 22:09:12.220374','1','Цифровые Технологии',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',1,1),(2,'2024-06-17 22:30:55.596933','2','Питание и гастрономия',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',1,1),(3,'2024-06-17 23:38:09.313359','3','CheapAmigo (Работник)',2,'[{\"changed\": {\"fields\": [\"Position\", \"Responsibilities\"]}}]',2,1),(4,'2024-06-18 00:34:58.051666','2','Rekvizit8bit (Работник)',2,'[{\"changed\": {\"fields\": [\"Position\", \"Responsibilities\"]}}]',2,1),(5,'2024-06-19 02:04:37.137302','2','Rekvizit8bit (Менеджер)',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',2,1),(6,'2024-06-19 02:22:01.554651','2','Rekvizit8bit (Работник)',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',2,1),(7,'2024-06-19 02:22:38.252352','4','MegaManage (Менеджер)',3,'',2,1),(8,'2024-06-19 02:22:53.136171','4','MegaManage (Менеджер)',3,'',2,1),(9,'2024-06-19 16:18:08.866852','4','MegaManage (Менеджер)',3,'',2,1),(10,'2024-06-21 03:32:56.667331','13','88877 (Менеджер)',3,'',2,1),(11,'2024-06-21 03:32:56.673242','14','888776 (Менеджер)',3,'',2,1),(12,'2024-06-21 03:32:56.679558','3','CheapAmigo (Работник)',3,'',2,1),(13,'2024-06-21 03:32:56.687175','7','Colambus (Менеджер)',3,'',2,1),(14,'2024-06-21 03:32:56.694284','8','Dan1k (Работник)',3,'',2,1),(15,'2024-06-21 03:32:56.700505','5','kekowka (Работник)',3,'',2,1),(16,'2024-06-21 03:32:56.706138','16','kekowka1 (Менеджер)',3,'',2,1),(17,'2024-06-21 03:32:56.712054','17','kekowka11 (Работник)',3,'',2,1),(18,'2024-06-21 03:32:56.718112','18','kekowka22 (Менеджер)',3,'',2,1),(19,'2024-06-21 03:32:56.724476','19','kekowka23 (Менеджер)',3,'',2,1),(20,'2024-06-21 03:32:56.730639','20','kekowka23_sus (Менеджер)',3,'',2,1),(21,'2024-06-21 03:32:56.735897','4','MegaManage (Менеджер)',3,'',2,1),(22,'2024-06-21 03:32:56.741979','15','Miagi722 (Менеджер)',3,'',2,1),(23,'2024-06-21 03:32:56.748260','2','Rekvizit8bit (Работник)',3,'',2,1),(24,'2024-06-21 03:32:56.754766','6','Thommy (Работник)',3,'',2,1),(25,'2024-06-21 03:32:56.760469','9','вава (Работник)',3,'',2,1),(26,'2024-06-21 03:32:56.767596','11','кукер (Менеджер)',3,'',2,1),(27,'2024-06-21 03:32:56.773189','12','кукера (Менеджер)',3,'',2,1),(28,'2024-06-21 03:32:56.779233','10','суперсогама (Менеджер)',3,'',2,1),(29,'2024-06-21 07:19:13.423081','36','HQDfan (Работник)',2,'[{\"changed\": {\"fields\": [\"Department\"]}}]',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'contenttypes','contenttype'),(2,'PMSapp','customuser'),(1,'PMSapp','department'),(10,'PMSapp','position'),(9,'PMSapp','schedule'),(8,'PMSapp','task'),(7,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-13 22:42:39.896567'),(2,'contenttypes','0002_remove_content_type_name','2024-06-13 22:42:40.020483'),(3,'auth','0001_initial','2024-06-13 22:42:40.281953'),(4,'auth','0002_alter_permission_name_max_length','2024-06-13 22:42:40.341346'),(5,'auth','0003_alter_user_email_max_length','2024-06-13 22:42:40.347371'),(6,'auth','0004_alter_user_username_opts','2024-06-13 22:42:40.353345'),(7,'auth','0005_alter_user_last_login_null','2024-06-13 22:42:40.362241'),(8,'auth','0006_require_contenttypes_0002','2024-06-13 22:42:40.365207'),(9,'auth','0007_alter_validators_add_error_messages','2024-06-13 22:42:40.371189'),(10,'auth','0008_alter_user_username_max_length','2024-06-13 22:42:40.377214'),(11,'auth','0009_alter_user_last_name_max_length','2024-06-13 22:42:40.383195'),(12,'auth','0010_alter_group_name_max_length','2024-06-13 22:42:40.410894'),(13,'auth','0011_update_proxy_permissions','2024-06-13 22:42:40.417875'),(14,'auth','0012_alter_user_first_name_max_length','2024-06-13 22:42:40.423887'),(15,'PMSapp','0001_initial','2024-06-13 22:42:40.896446'),(16,'admin','0001_initial','2024-06-13 22:42:41.031637'),(17,'admin','0002_logentry_remove_auto_add','2024-06-13 22:42:41.039616'),(18,'admin','0003_logentry_add_action_flag_choices','2024-06-13 22:42:41.048592'),(19,'sessions','0001_initial','2024-06-13 22:42:41.084000'),(20,'PMSapp','0002_task','2024-06-16 16:16:19.309492'),(21,'PMSapp','0003_remove_task_assignee_remove_task_status_and_more','2024-06-16 21:53:04.624826'),(22,'PMSapp','0004_remove_task_assigned_to_delete_schedule_delete_task','2024-06-16 21:53:04.869669'),(23,'PMSapp','0005_task_schedule','2024-06-16 21:53:05.539941'),(24,'PMSapp','0006_remove_task_assigned_to_delete_schedule_delete_task','2024-06-16 21:53:05.758384'),(25,'PMSapp','0007_task_schedule','2024-06-16 21:54:24.041958'),(26,'PMSapp','0008_department_description','2024-06-17 21:17:50.228364'),(27,'PMSapp','0009_position','2024-06-17 23:16:21.935171'),(28,'PMSapp','0010_delete_position_customuser_position_and_more','2024-06-17 23:36:21.369166'),(29,'PMSapp','0011_customuser_leave_of_absence_customuser_sick_leave_and_more','2024-06-18 21:24:49.331155'),(30,'PMSapp','0012_alter_schedule_user_alter_schedule_unique_together','2024-06-18 23:27:31.706321'),(31,'PMSapp','0013_task_review_comment_task_status_alter_schedule_user','2024-06-19 00:59:33.756459'),(32,'PMSapp','0014_task_time_period','2024-06-19 17:56:02.969042'),(33,'PMSapp','0015_remove_task_time_period','2024-06-19 23:52:37.969111'),(34,'PMSapp','0016_task_time_period','2024-06-20 01:13:16.361378'),(35,'PMSapp','0017_alter_task_time_period','2024-06-20 03:36:41.521698'),(36,'PMSapp','0018_alter_task_time_period','2024-06-20 04:15:53.675113');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('17iuay7letc6brljcbyva0jot7hkrhji','.eJxVjEEOwiAQRe_C2pCZQil16d4zEIYZpGpoUtqV8e7apAvd_vfef6kQt7WErckSJlZnZUGdfkeK6SF1J3yP9TbrNNd1mUjvij5o09eZ5Xk53L-DElv51p1A9h7FJLAOuM-9eAZKNic3DMl5mxmzYeMJiEgER2-YMCLKiNCp9wcZeDiI:1sKZLn:NrcUZR1I0j-Yy_V4qqSK9jETW-NIazAIO1qJIFS4Mdo','2024-07-05 08:10:27.945964'),('iotpbkdz9p8c7tqu1frpsykv9sl8jbte','e30:1sIyFr:ADT6H_Rd3993xqX_pmKtCuM7M8jJeISivRC3_MuSHvA','2024-06-30 22:21:43.918043'),('lrj100lxc1f7i2625fuki9egph6pelba','e30:1sIv1N:76c5Auw-ef7vILMT-b4TELvl7dIsjd2xwbr-avij3UA','2024-06-30 18:54:33.437851'),('nkisg79v5air71ri9qonj8zw91jiehja','e30:1sHu18:agoKsXUQLezUhSdzczzE5RcswJPwKOfjREquxTp9K0Y','2024-06-27 23:38:06.130605'),('pn3ot30osgclrv5qm8cnm9ytk6dnqwu9','e30:1sITre:erMOLqEO2dW_9fKTE5Yg0gOwEYl8oqAvtB91TSgWKVQ','2024-06-29 13:54:42.323597'),('vpwzyxtg4i7yb7gq8hv7qx65ws65eh7y','e30:1sIStr:nto-RtWD0QGdNeJUXCChjJMBNfA5qO_M0qLAlAXmDjg','2024-06-29 12:52:55.912481'),('wn2oaygzsowwio789ywtrg2elgu5kifw','.eJxVjEEOwiAQRe_C2hBhRhCX7nuGZpgBqRpISrsy3l2bdKHb_977LzXSupRx7WkeJ1EXherwu0XiR6obkDvVW9Pc6jJPUW-K3mnXQ5P0vO7u30GhXr61pwSEEoyJwWTLFBDQZM8cgnOMmQDAJCIGI0gOj5TlhNbbFBHgrN4f7q038w:1sJjjr:kpOe6Xaw0p71I9FcVsf5jnAahH-otP94bTBOdrtYoec','2024-07-03 01:03:51.014137'),('ynql72isooldh3y3btoq916o9q517x7b','e30:1sHtkC:hwUqcIUa-osAGWv8hwGtHaDHe1AlcxkiZUc2d1xBwxA','2024-06-27 23:20:36.086805');
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
  `position` varchar(100) DEFAULT NULL,
  `responsibilities` longtext,
  `leave_of_absence` tinyint(1) NOT NULL,
  `sick_leave` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `PMSapp_customuser_department_id_801c894b_fk_PMSapp_department_id` (`department_id`),
  CONSTRAINT `PMSapp_customuser_department_id_801c894b_fk_PMSapp_department_id` FOREIGN KEY (`department_id`) REFERENCES `pmsapp_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_customuser`
--

LOCK TABLES `pmsapp_customuser` WRITE;
/*!40000 ALTER TABLE `pmsapp_customuser` DISABLE KEYS */;
INSERT INTO `pmsapp_customuser` VALUES (1,'pbkdf2_sha256$720000$llMuWQI7S7MF3yIlFD09ll$ZWL52zC4VifA0YZfPamKs0vCQ7rbGbiklZHkDwG7aOY=','2024-06-21 07:18:42.578188',1,'root','slava.volkov.228@yandex.ru',1,1,'2024-06-13 22:43:55.154372','','','','','','',NULL,NULL,NULL,0,0),(21,'pbkdf2_sha256$720000$oLvr0qDZ5WMVU8kZLCVcJO$lAinI93JN6dZLzltHBGjCqlAtqDpgBtEP1QvH7GiIbw=','2024-06-21 03:54:30.135562',0,'Shelby','',0,1,'2024-06-21 03:43:10.487127','employee','Кирилл','Тенетилов','Александрович','79152975694','46194442944',1,'Аналитик данных','Анализирует данные, собранные в учебном заведении, для улучшения учебного процесса. Подготавливает отчеты и визуализации данных для руководства.',0,0),(22,'pbkdf2_sha256$720000$Po0602TZekdykdcHhUDW5m$nPxSt2La9ngBsRQopTCh+iKn/Jd4X+c3pfXjnqibFYY=','2024-06-21 04:11:29.003487',0,'CheapAmigo','',0,1,'2024-06-21 03:46:11.730459','employee','Святослав','Волков','Сергеевич','79153720975','4619233266',1,'Системный администратор','Обеспечивает бесперебойную работу серверов и сетевой инфраструктуры. Устанавливает и обновляет программное обеспечение и аппаратное обеспечение.',0,0),(23,'pbkdf2_sha256$720000$06320c9ESMvRq247fjR9SP$PdysU2DJIJaOcInPqrdJcya4zka/LlgMNWAdx/U4/xI=','2024-06-21 08:05:03.638100',0,'Stalker','',0,1,'2024-06-21 03:48:20.379534','manager','Евгений','Повираев','Сергеевич','79995453576','4245964004',1,'','',0,0),(24,'pbkdf2_sha256$720000$Tfb1IKlOm9DmIJXOBrA2m7$2twkcfTIcXySrVfii1SO5k0lXYCLEFdL6/g4Un9hC94=','2024-06-21 05:26:14.677921',0,'Granny','',0,1,'2024-06-21 05:17:35.832696','employee','Дмитрий','Бойко','Юрьевич','88005553535','4619574994',1,'Разработчик программного обеспечения','Разрабатывает и поддерживает внутренние приложения и системы. Работает над интеграцией различных систем и сервисов.',0,0),(25,'pbkdf2_sha256$720000$RulcLXsnyfMo2Y3GMA9g8w$MJaT7zhBpsSQA2WcrAUXVEPwEsUkoiOO62UpAm2fVd8=','2024-06-21 05:32:30.289301',0,'Dan1k','',0,1,'2024-06-21 05:32:29.845537','employee','Даниил','Абдишев','Элдарович','795496516','4619894581',1,'Администратор баз данных','Управляет базами данных учебного заведения. Обеспечивает безопасность и доступность данных.',0,0),(26,'pbkdf2_sha256$720000$DToEW9m74rkb0l8UF0hmVO$5lDXYyTqxttf1Li9So2JkDVxiasIgoy8gmVG/qm419Y=','2024-06-21 05:38:24.967275',0,'Tteoman','',0,1,'2024-06-21 05:38:24.520649','employee','Марк','Тваровский','Александрович','7977164474','4618049233',1,'Специалист по информационной безопасности','Защищает данные и системы учебного заведения от киберугроз. Разрабатывает и внедряет политики безопасности.',0,0),(27,'pbkdf2_sha256$720000$psJh7XFCVmDHDbtxvMx1xv$vg8xaeqIxGdSimArLF134HLSkE9jLHcITtUx3phySmI=','2024-06-21 05:41:07.958702',0,'SuperDendy','',0,1,'2024-06-21 05:41:07.505351','employee','Данила','Чистяков','Андреевич','7986319007','4620841071',1,'Специалист по поддержке пользователей','Помогает студентам и преподавателям с техническими проблемами. Проводит обучение и консультации по использованию IT-ресурсов.',0,0),(28,'pbkdf2_sha256$720000$U1wmLnMMBkYmgRP4gol5YL$ZnjvtDvnddnZqBt3/DOK3A2X/Oy8zXuMdRTlFnefJ/o=','2024-06-21 05:45:47.679141',0,'9miceKing','',0,1,'2024-06-21 05:45:47.239737','employee','Роман','Люсточкин','Сергеевич','7977253900','461684158',1,'Сетевой инженер','Проектирует и поддерживает сеть учебного заведения. Обеспечивает безопасность и надежность сетевых подключений.',0,0),(29,'pbkdf2_sha256$720000$iGCkfWtl8hahc8BILVvVBx$tPFQvCZNvDvVMCKOSLICMGWm/z1K5GCiX0RAZxavgAo=','2024-06-21 05:48:42.403133',0,'Cheburus','',0,1,'2024-06-21 05:48:41.947728','employee','Юлиан','Нуштайкин','Янисович','7915845093','4618540943',1,'Технический писатель','Создает и поддерживает документацию для IT-систем и процессов. Пишет инструкции и руководства для пользователей.',0,0),(30,'pbkdf2_sha256$720000$TpPHde2aAxwd3YpKUsbAdE$LYc+rLDDoVA+XKS67kbpzCMBSrwfGM+X22qTlAiIkuA=','2024-06-21 05:51:52.201098',0,'Danila2Trankvila','',0,1,'2024-06-21 05:51:51.722152','employee','Рябчевский','Даниил','Русланович','7916077437','4616854316',1,'Веб-разработчик','Поддерживает и обновляет веб-сайты учебного заведения. Работает над улучшением пользовательского опыта на веб-ресурсах.',0,0),(31,'pbkdf2_sha256$720000$CnXzrVBlQNNrbaLPZrE1FG$UrrSqT0qCaM5rfbhTysRmDLbJtnoGWfuzP1nUa6IRuw=','2024-06-21 07:43:23.349444',0,'Amigus','',0,1,'2024-06-21 06:31:59.851376','manager','Еремин','Никита','Русланович','61631304','4619958724',2,'','',0,0),(32,'pbkdf2_sha256$720000$jVgJO1sFAot0WikVYlNqEo$fjLJQyRrTJlBBD5xfom3HwNC8TwW74Af/GyDUI94ovE=','2024-06-21 06:46:39.414961',0,'Zek229','',0,1,'2024-06-21 06:46:38.962744','employee','Захар','Симаков','Дмитриевич','7916544825','4618905361',2,'Су-шеф','Помощь в управлении кухней и контроль за процессами приготовления блюд. Обучение сотрудников новым рецептам и кулинарным техникам. Обеспечение слаженной работы всех подразделений кухни. Участие в создании новых блюд и улучшении существующих рецептов.',0,0),(33,'pbkdf2_sha256$720000$cpTE77LjjO1UFtr3a8S2wc$2P3zgwZik1osaEP+7ybisQ1h8ipVeL5aa7DG466x1LI=','2024-06-21 06:51:58.879516',0,'VarVar','',0,1,'2024-06-21 06:51:58.437192','employee','Сергей','Таран','Юрьевич','79159852206','461927701',2,'Повар горячего цеха','Приготовление основных горячих блюд по рецептам. Обеспечение своевременного приготовления и подачи блюд. Поддержание чистоты и порядка на рабочем месте. Подготовка продуктов для последующего приготовления.',0,0),(34,'pbkdf2_sha256$720000$pTOD4UGXlHOmXRJCSm4234$rhA18HPU8YamdNMsDd501xq0UpTIEIOhxrUeevJAX2g=','2024-06-21 06:57:07.173745',0,'AntiRacistMan','',0,1,'2024-06-21 06:57:06.680068','employee','Шахбоз','Бегматов','Голибжонович','7916844901','4619084261',2,'Повар холодного цеха','Создание салатов, закусок и десертов по рецептам. Проверка качества и свежести используемых ингредиентов. Эстетическое оформление блюд перед подачей. Соблюдение правил хранения продуктов для предотвращения порчи. Поддержание рабочего места в чистоте и соблюдение санитарных норм.',0,0),(35,'pbkdf2_sha256$720000$3aG8rBgXLtgDHqRSpMDl9I$XT0BK9X0/nBGr3looYTuaVpQQnz9nYpmot1B5x37e2s=','2024-06-21 07:03:54.220335',0,'PCgamingLord','',0,1,'2024-06-21 07:03:53.771978','employee','Дмитрий','Налбантов','Юрьевич','7917955924','4619095461',2,'Пекарь','Приготовление хлеба, булочек, пирогов и другой выпечки. Регулирование времени и температуры выпекания. Правильное замешивание теста по рецептам. Эксперименты с новыми рецептами и вкусами. Поддержание чистоты на рабочем месте и соблюдение гигиенических норм.',0,0),(36,'pbkdf2_sha256$720000$xL1OQzPysBtew6tgNqdOLi$IMUx2iq0phmsv7zbfbbYtB2t/yPK7QAzzd244pkxSbo=','2024-06-21 07:06:55.000000',0,'HQDfan','',0,1,'2024-06-21 07:06:54.000000','employee','Дмитрий','Налапкин','Сергеевич','7414988057','4619845018',2,'Консультант по питанию','Составление сбалансированного меню с учетом питательных потребностей студентов. Проведение консультаций для студентов и сотрудников по вопросам здорового питания. Оценка и расчет калорийности и питательной ценности блюд. Организация образовательных мероприятий и лекций о здоровом питании. Отслеживание состояния здоровья студентов и корректировка меню при необходимости.',0,0),(37,'pbkdf2_sha256$720000$408PUAssHkb3MLe7eN2e3K$53l9NAVxIDacjlXrdo/SEBUwH3Yr0jdV6AJGCS4h8qM=','2024-06-21 07:13:34.516293',0,'JesusJoker','',0,1,'2024-06-21 07:13:34.070116','employee','Андрей','Трухин','Александрович','7815666999','4610493021',2,'Официант','Прием заказов, подача блюд и напитков, обеспечение высокого уровня обслуживания. Содержание зала столовой в чистоте и порядке, уборка столов после посетителей. Помощь посетителям в выборе блюд и напитков, ответы на вопросы по меню. Обработка жалоб и пожеланий посетителей, решение конфликтных ситуаций. Следование установленным стандартам и процедурам обслуживания.',0,0),(38,'pbkdf2_sha256$720000$gvHbvqQpjlUrMcMcpk2A7X$orrFBmPDdOjDZbR9nExz844GPebu4u1u7JkxR2bbzhU=','2024-06-21 07:22:54.758619',0,'ZaWarka','',0,1,'2024-06-21 07:22:54.310191','employee','Заварзаева','Софья','Дмитриевна','791650436','4617953721',2,'Шеф-повар','Составление и обновление меню, учитывая разнообразие и сбалансированность блюд. Обеспечение высокого качества приготовления блюд и соблюдение санитарных норм. Руководство кухонной командой, распределение обязанностей и обучение новых сотрудников. Контроль за закупкой продуктов, их качеством и количеством. Отслеживание кулинарных трендов и их внедрение в меню.',0,0),(39,'pbkdf2_sha256$720000$8bmp4OAymvVqshAEm0IJAw$QCNnLG+GeZy9s+T+YPjUxGsau2RbaL98qc6F+PEzGA4=','2024-06-21 07:25:56.763861',0,'SigmaProgger','',0,1,'2024-06-21 07:25:56.315681','employee','Геворг','Мелконян','Артурович','7915834032','4916045834',2,'Консультант по питанию','Составление сбалансированного меню с учетом питательных потребностей студентов. Проведение консультаций для студентов и сотрудников по вопросам здорового питания. Оценка и расчет калорийности и питательной ценности блюд. Организация образовательных мероприятий и лекций о здоровом питании. Отслеживание состояния здоровья студентов и корректировка меню при необходимости.',0,0),(40,'pbkdf2_sha256$720000$G67zoqrKPHr1wzmzAKcBTG$aPl+1q+uVVciQAY/F3cgI9CZEeeXXXKzNFxj1N7//sE=','2024-06-21 08:10:27.935819',0,'Frontoender','',0,1,'2024-06-21 08:10:27.461512','manager','Степан','Степанов','Олегович','7916264052','4002494290',1,'','',0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_department`
--

LOCK TABLES `pmsapp_department` WRITE;
/*!40000 ALTER TABLE `pmsapp_department` DISABLE KEYS */;
INSERT INTO `pmsapp_department` VALUES (1,'Цифровые Технологии','Отдел играет ключевую роль в разработке и внедрении передовых IT-решений, направленных на улучшение образовательного процесса. Специализация на создании и поддержке цифровых платформ для дистанционного обучения, разработке учебных приложений и систем электронного обучения. Команда работает над автоматизацией управленческих и административных процессов, обеспечивая удобство и доступность для студентов и преподавателей. Занимаются внедрением новые технологии и инновации, чтобы поддерживать высокие стандарты образовательного процесса и способствовать развитию образовательного учреждения в цифровую эпоху.'),(2,'Питание и гастрономия','Отдел занимается организацией питания в учебном заведении, созданием разнообразных меню и обеспечением высокого качества блюд. Команда следит за соблюдением стандартов безопасности и пищевой гигиены, стремясь предложить студентам и персоналу вкусные, а также полезные опции питания.');
/*!40000 ALTER TABLE `pmsapp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_schedule`
--

DROP TABLE IF EXISTS `pmsapp_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day` date NOT NULL,
  `user_id` bigint NOT NULL,
  `leave_of_absence` tinyint(1) NOT NULL,
  `sick_leave` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PMSapp_schedule_user_id_day_8b19add1_uniq` (`user_id`,`day`),
  KEY `PMSapp_schedule_user_id_7b0b6e9a` (`user_id`),
  CONSTRAINT `PMSapp_schedule_user_id_7b0b6e9a_fk_PMSapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `pmsapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_schedule`
--

LOCK TABLES `pmsapp_schedule` WRITE;
/*!40000 ALTER TABLE `pmsapp_schedule` DISABLE KEYS */;
INSERT INTO `pmsapp_schedule` VALUES (118,'2024-06-21',22,0,0),(119,'2024-06-17',22,0,0),(120,'2024-06-18',22,0,0),(121,'2024-06-19',22,0,0),(122,'2024-06-20',22,0,0),(123,'2024-06-22',22,0,0),(124,'2024-06-23',22,0,0),(125,'2024-06-21',21,0,1),(126,'2024-06-17',21,0,0),(127,'2024-06-18',21,0,0),(128,'2024-06-19',21,0,0),(129,'2024-06-20',21,0,0),(130,'2024-06-22',21,0,0),(131,'2024-06-23',21,0,0),(132,'2024-06-21',24,0,1),(133,'2024-06-17',24,0,0),(134,'2024-06-18',24,0,0),(135,'2024-06-19',24,0,0),(136,'2024-06-20',24,0,0),(137,'2024-06-22',24,0,0),(138,'2024-06-23',24,0,0),(139,'2024-06-21',26,1,0),(140,'2024-06-21',32,0,0),(141,'2024-06-17',32,0,0),(142,'2024-06-18',32,0,1),(143,'2024-06-19',32,0,0),(144,'2024-06-20',32,0,0),(145,'2024-06-22',32,0,0),(146,'2024-06-23',32,0,0),(147,'2024-06-19',33,0,0),(148,'2024-06-19',34,0,0),(149,'2024-06-19',35,0,0),(150,'2024-06-19',36,0,0),(151,'2024-06-19',37,0,0),(152,'2024-06-19',38,0,0),(153,'2024-06-19',39,0,0),(154,'2024-06-21',33,0,0),(155,'2024-06-21',34,0,0),(156,'2024-06-21',35,0,0),(157,'2024-06-21',36,0,0),(158,'2024-06-21',37,0,0),(159,'2024-06-21',38,0,0),(160,'2024-06-21',39,0,0),(161,'2024-06-17',33,0,0),(162,'2024-06-18',33,0,0),(163,'2024-06-20',33,0,0),(164,'2024-06-17',34,0,0),(165,'2024-06-18',34,0,0),(166,'2024-06-20',34,0,0),(167,'2024-06-17',35,0,0),(168,'2024-06-18',35,0,0),(169,'2024-06-20',36,0,0),(170,'2024-06-20',35,0,0),(171,'2024-06-22',35,0,0),(172,'2024-06-23',35,0,0),(173,'2024-06-17',36,0,0),(174,'2024-06-18',36,0,0),(175,'2024-06-22',36,0,0),(176,'2024-06-23',36,0,0),(177,'2024-06-17',37,0,0),(178,'2024-06-18',37,0,0),(179,'2024-06-20',37,0,0),(180,'2024-06-22',37,0,0),(181,'2024-06-23',37,0,0),(182,'2024-06-17',38,0,0),(183,'2024-06-18',38,0,0),(184,'2024-06-20',38,0,0),(185,'2024-06-17',39,0,0),(186,'2024-06-18',39,0,0),(187,'2024-06-20',39,0,0),(188,'2024-06-18',25,0,0),(189,'2024-06-18',26,0,0),(190,'2024-06-18',27,0,0),(191,'2024-06-18',28,0,0),(192,'2024-06-18',29,0,0),(193,'2024-06-18',30,0,0),(194,'2024-06-17',25,0,0),(195,'2024-06-17',26,0,0),(196,'2024-06-17',27,0,0),(197,'2024-06-17',28,0,0),(198,'2024-06-17',29,0,0),(199,'2024-06-17',30,0,0),(200,'2024-06-19',29,0,0),(201,'2024-06-20',29,0,0),(202,'2024-06-21',29,0,0),(203,'2024-06-22',29,0,0),(204,'2024-06-23',29,0,0),(205,'2024-06-21',25,0,0),(206,'2024-06-21',27,0,1),(207,'2024-06-21',28,0,0),(208,'2024-06-21',30,0,0),(209,'2024-06-19',27,0,0),(210,'2024-06-20',27,0,0),(211,'2024-06-22',27,0,0),(212,'2024-06-23',27,0,0);
/*!40000 ALTER TABLE `pmsapp_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_schedule_tasks`
--

DROP TABLE IF EXISTS `pmsapp_schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_schedule_tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PMSapp_schedule_tasks_schedule_id_task_id_d9c4277e_uniq` (`schedule_id`,`task_id`),
  KEY `PMSapp_schedule_tasks_task_id_1000b93d_fk_PMSapp_task_id` (`task_id`),
  CONSTRAINT `PMSapp_schedule_tasks_schedule_id_da2550f8_fk_PMSapp_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `pmsapp_schedule` (`id`),
  CONSTRAINT `PMSapp_schedule_tasks_task_id_1000b93d_fk_PMSapp_task_id` FOREIGN KEY (`task_id`) REFERENCES `pmsapp_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_schedule_tasks`
--

LOCK TABLES `pmsapp_schedule_tasks` WRITE;
/*!40000 ALTER TABLE `pmsapp_schedule_tasks` DISABLE KEYS */;
INSERT INTO `pmsapp_schedule_tasks` VALUES (23,118,30),(83,118,90),(104,118,111),(113,118,120),(30,119,37),(85,119,92),(94,119,101),(72,120,79),(81,121,88),(82,122,89),(29,125,36),(80,125,87),(103,125,110),(112,125,119),(27,126,34),(84,126,91),(93,126,100),(25,127,32),(71,127,78),(26,128,33),(102,128,109),(28,129,35),(24,132,31),(105,132,112),(114,132,121),(86,133,93),(95,133,102),(73,134,80),(107,139,114),(116,139,123),(39,140,46),(50,141,57),(51,142,58),(31,143,38),(52,144,59),(32,147,39),(33,148,40),(34,149,41),(35,150,42),(36,151,43),(37,152,44),(38,153,45),(40,154,47),(41,155,48),(42,156,49),(43,157,50),(44,158,51),(45,159,52),(46,160,53),(47,161,54),(48,162,55),(49,163,56),(53,164,60),(54,165,61),(55,166,62),(56,167,63),(57,168,64),(58,169,65),(59,170,66),(60,173,67),(61,174,68),(62,177,69),(63,178,70),(64,179,71),(65,182,72),(66,183,73),(67,184,74),(68,185,75),(69,186,76),(70,187,77),(74,188,81),(75,189,82),(76,190,83),(77,191,84),(78,192,85),(79,193,86),(87,194,94),(96,194,103),(88,195,95),(97,195,104),(89,196,96),(98,196,105),(90,197,97),(99,197,106),(91,198,98),(100,198,107),(92,199,99),(101,199,108),(110,202,117),(119,202,126),(106,205,113),(115,205,122),(108,206,115),(117,206,124),(109,207,116),(118,207,125),(111,208,118),(120,208,127);
/*!40000 ALTER TABLE `pmsapp_schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmsapp_task`
--

DROP TABLE IF EXISTS `pmsapp_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pmsapp_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `due_date` date NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `completion_date` date DEFAULT NULL,
  `assigned_to_id` bigint NOT NULL,
  `review_comment` longtext,
  `status` varchar(20) NOT NULL,
  `time_period` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PMSapp_task_assigned_to_id_6a0eb559_fk_PMSapp_customuser_id` (`assigned_to_id`),
  CONSTRAINT `PMSapp_task_assigned_to_id_6a0eb559_fk_PMSapp_customuser_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `pmsapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_task`
--

LOCK TABLES `pmsapp_task` WRITE;
/*!40000 ALTER TABLE `pmsapp_task` DISABLE KEYS */;
INSERT INTO `pmsapp_task` VALUES (30,'Поддержка серверов','Обеспечение бесперебойной работы серверов, мониторинг и обновление систем в очень важный день.','2024-06-21',0,NULL,22,'До сих пор большие трудности в передаче пакетов данных!','rejected','work_time'),(31,'Тестирование ПО','Проведение тестирования новых и обновленных приложений для обеспечения их работоспособности.','2024-06-21',0,NULL,24,NULL,'pending','after_hours'),(32,'Сбор статистики и актуальных данных','Создание диаграмм, графиков и других визуализаций для наглядного представления результатов анализа мотивации учащихся.','2024-06-18',0,NULL,21,NULL,'pending','work_time'),(33,'Подготовка отчетов','Создание отчетов для руководства с выводами и рекомендациями на основе анализа данных по последним походам в туалет.','2024-06-19',0,NULL,21,NULL,'pending','work_time'),(34,'Сбор и обработка данных','Сбор данных из различных пабликов, их очистка и подготовка к анализу.','2024-06-17',0,NULL,21,NULL,'pending','work_time'),(35,'Разработка и оптимизация метрик','Определение ключевых показателей эффективности (KPI) и разработка методов их мониторинга и анализа.','2024-06-20',0,NULL,21,NULL,'pending','work_time'),(36,'Анализ данных','Проведение статистического и количественного анализа данных для выявления тенденций и закономерностей походов в \"курилку\"','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(37,'Управление учетными записями','Создание и управление учетными записями новых пользователей приехавших сегодня.','2024-06-17',0,NULL,22,NULL,'pending','work_time'),(38,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,32,NULL,'pending','work_time'),(39,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,33,NULL,'pending','work_time'),(40,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,34,NULL,'pending','work_time'),(41,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,35,NULL,'pending','work_time'),(42,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,36,NULL,'pending','work_time'),(43,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,37,NULL,'pending','work_time'),(44,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,38,NULL,'pending','work_time'),(45,'Всеобщая инвентаризация','Для успеха кладовщика, нам требуются все усилия всех работников.','2024-06-19',0,NULL,39,NULL,'pending','work_time'),(46,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,32,NULL,'pending','work_time'),(47,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,33,NULL,'pending','work_time'),(48,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,34,NULL,'pending','work_time'),(49,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,35,NULL,'pending','work_time'),(50,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,36,NULL,'pending','work_time'),(51,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,37,NULL,'pending','work_time'),(52,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,38,NULL,'pending','work_time'),(53,'Заказ от сирот','К нам приезжают сироты и мы должны показать мастер-класс, работаем только на них.','2024-06-21',0,NULL,39,NULL,'pending','work_time'),(54,'Подготовка ингредиентов','Подготовить и нарезать все необходимые ингредиенты для блюд, запланированных на вечернее меню.','2024-06-17',0,NULL,33,NULL,'pending','work_time'),(55,'Приготовление основных блюд','Приготовить горячие блюда для обеда по установленным рецептам и стандартам.','2024-06-18',0,NULL,33,NULL,'pending','work_time'),(56,'Чистота рабочего места','Поддерживать рабочее место в чистоте, проводить уборку и дезинфекцию по мере необходимости.','2024-06-20',0,NULL,33,NULL,'pending','work_time'),(57,'Проверка свежести продуктов','Провести проверку свежести и качества всех продуктов, поступивших на кухню, и обеспечить их правильное хранение.','2024-06-17',0,NULL,32,NULL,'pending','work_time'),(58,'Подготовка к обеду','Обеспечить своевременную подготовку всех ингредиентов для горячих и холодных блюд, которые будут подаваться на обед.','2024-06-18',0,NULL,32,NULL,'pending','work_time'),(59,'Координация работы команды','Распределить задачи среди кухонного персонала на текущий день и контролировать их выполнение.','2024-06-20',0,NULL,32,NULL,'pending','work_time'),(60,'Приготовление салатов и закусок','Приготовить холодные блюда, такие как салаты и закуски, для обеда.','2024-06-17',0,NULL,34,NULL,'pending','work_time'),(61,'Оформление блюд','Эстетически оформить готовые холодные блюда перед их подачей.','2024-06-18',0,NULL,34,NULL,'pending','work_time'),(62,'Контроль свежести продуктов','Проверить свежесть и качество используемых продуктов, своевременно убрать и заменить продукты с истекающим сроком годности.','2024-06-20',0,NULL,34,NULL,'pending','work_time'),(63,'Выпечка хлебобулочных изделий','Приготовить и выпечь хлеб, булочки и пироги для утреннего и обеденного обслуживания.','2024-06-17',0,NULL,35,NULL,'pending','work_time'),(64,'Замешивание теста','Подготовить и замесить тесто для различных видов выпечки на следующий день.','2024-06-18',0,NULL,35,NULL,'pending','work_time'),(65,'Контроль выпекания','Следить за процессом выпекания, обеспечивать правильную температуру и время выпекания для каждого изделия.','2024-06-20',0,NULL,36,NULL,'pending','work_time'),(66,'Выпечка хлебобулочных изделий','Приготовить и выпечь хлеб, булочки и пироги для утреннего и обеденного обслуживания.','2024-06-20',0,NULL,35,NULL,'pending','work_time'),(67,'Консультации для студентов','Провести индивидуальные консультации для студентов по вопросам питания и здорового образа жизни.','2024-06-17',0,NULL,36,NULL,'pending','work_time'),(68,'Подготовка материалов','Подготовить образовательные материалы и информационные листовки о здоровом питании для размещения в столовой.','2024-06-18',0,NULL,36,NULL,'pending','work_time'),(69,'Обслуживание столиков','Принять заказы у посетителей, подать блюда и напитки, обеспечить высокий уровень обслуживания.','2024-06-17',0,NULL,37,NULL,'pending','work_time'),(70,'Поддержание чистоты','Убирать столы после ухода посетителей, поддерживать чистоту в зале.','2024-06-18',0,NULL,37,NULL,'pending','work_time'),(71,'Консультирование по меню','Помогать посетителям с выбором блюд, отвечать на вопросы по меню и предлагать рекомендации.','2024-06-20',0,NULL,37,NULL,'pending','work_time'),(72,'Разработка нового меню на неделю','Составить разнообразное и сбалансированное меню на предстоящую неделю, учитывая сезонные продукты и диетические потребности студентов.','2024-06-17',0,NULL,38,NULL,'pending','work_time'),(73,'Контроль качества блюд','Провести проверку качества и вкусовых характеристик блюд, готовящихся на обед, и внести необходимые коррективы.','2024-06-18',0,NULL,38,NULL,'pending','work_time'),(74,'Обучение персонала','Провести обучение для новых сотрудников по стандартам приготовления и презентации блюд.','2024-06-20',0,NULL,38,NULL,'pending','work_time'),(75,'Консультации для студентов','Провести индивидуальные консультации для студентов по вопросам питания и здорового образа жизни.','2024-06-17',0,NULL,39,NULL,'pending','work_time'),(76,'Анализ меню','Провести анализ текущего меню на содержание питательных веществ и предложить изменения для улучшения его сбалансированности.','2024-06-18',0,NULL,39,NULL,'pending','work_time'),(77,'Подготовка материалов','Подготовить образовательные материалы и информационные листовки о здоровом питании для размещения в столовой.','2024-06-20',0,NULL,39,NULL,'pending','work_time'),(78,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,21,NULL,'pending','after_hours'),(79,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,22,NULL,'pending','after_hours'),(80,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,24,NULL,'pending','after_hours'),(81,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,25,NULL,'pending','after_hours'),(82,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,26,NULL,'pending','after_hours'),(83,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,27,NULL,'pending','after_hours'),(84,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,28,NULL,'pending','after_hours'),(85,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,29,NULL,'pending','after_hours'),(86,'Митинг в Дискорд','Обсуждение общих проблем между отделами','2024-06-18',0,NULL,30,NULL,'pending','after_hours'),(87,'Прослушайте все ГС от начальника','Работа подождёт будущая зарплата под угрозой, прослушайте информацию','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(88,'Обновление серверов','Провести обновление операционных систем на всех серверах. Установить последние патчи безопасности и обновления программного обеспечения.','2024-06-19',0,NULL,22,NULL,'pending','work_time'),(89,'Резервное копирование данных','Выполнить плановое резервное копирование критически важных данных. Проверить целостность и доступность резервных копий.','2024-06-20',0,NULL,22,NULL,'pending','work_time'),(90,'Мониторинг сетевой активности','Провести анализ текущей сетевой активности на предмет подозрительных действий или аномалий. Проверить состояние сетевых устройств и их лог-файлы.','2024-06-21',0,NULL,22,NULL,'pending','work_time'),(91,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,21,NULL,'pending','after_hours'),(92,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,22,NULL,'pending','after_hours'),(93,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,24,NULL,'pending','after_hours'),(94,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,25,NULL,'pending','after_hours'),(95,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,26,NULL,'pending','after_hours'),(96,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,27,NULL,'pending','after_hours'),(97,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,28,NULL,'pending','after_hours'),(98,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,29,NULL,'pending','after_hours'),(99,'Выезд на выставку','Все являетесь представителями, поэтому необходимо отложить срочную работу и пройти ликбезы прожарки по нашей области','2024-06-17',0,NULL,30,NULL,'pending','after_hours'),(100,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,21,NULL,'pending','after_hours'),(101,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,22,NULL,'pending','after_hours'),(102,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,24,NULL,'pending','after_hours'),(103,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,25,NULL,'pending','after_hours'),(104,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,26,NULL,'pending','after_hours'),(105,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,27,NULL,'pending','after_hours'),(106,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,28,NULL,'pending','after_hours'),(107,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,29,NULL,'pending','after_hours'),(108,'Экзамен по проф. пригодности','Вместо работы в конце дня уходите скорее на подготовку домой.','2024-06-17',0,NULL,30,NULL,'pending','after_hours'),(109,'Совещание нескольких корпусов','Необходимо присутствовать, заменяет рабочий день','2024-06-19',0,NULL,21,NULL,'pending','work_time'),(110,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(111,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,22,NULL,'pending','work_time'),(112,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,24,NULL,'pending','work_time'),(113,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,25,NULL,'pending','work_time'),(114,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,26,NULL,'pending','work_time'),(115,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,27,NULL,'pending','work_time'),(116,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,28,NULL,'pending','work_time'),(117,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,29,NULL,'pending','work_time'),(118,'Напишите сочинение для тестировки от государства','После работы займитесь правильным оформление и вдумчиво распишите своё \"литературное произведение\"','2024-06-21',0,NULL,30,NULL,'pending','work_time'),(119,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(120,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,22,NULL,'pending','work_time'),(121,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,24,NULL,'pending','work_time'),(122,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,25,NULL,'pending','work_time'),(123,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,26,NULL,'pending','work_time'),(124,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,27,NULL,'pending','work_time'),(125,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,28,NULL,'pending','work_time'),(126,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,29,NULL,'pending','work_time'),(127,'В 12:00','Сбор на первом этаже, весь состав помогает переносить новое оборудование.','2024-06-21',0,NULL,30,NULL,'pending','work_time');
/*!40000 ALTER TABLE `pmsapp_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 13:03:38
