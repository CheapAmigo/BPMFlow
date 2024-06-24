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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-17 22:09:12.220374','1','╨ж╨╕╤Д╤А╨╛╨▓╤Л╨╡ ╨в╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╨╕',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',1,1),(2,'2024-06-17 22:30:55.596933','2','╨Я╨╕╤В╨░╨╜╨╕╨╡ ╨╕ ╨│╨░╤Б╤В╤А╨╛╨╜╨╛╨╝╨╕╤П',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\"]}}]',1,1),(3,'2024-06-17 23:38:09.313359','3','CheapAmigo (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',2,'[{\"changed\": {\"fields\": [\"Position\", \"Responsibilities\"]}}]',2,1),(4,'2024-06-18 00:34:58.051666','2','Rekvizit8bit (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',2,'[{\"changed\": {\"fields\": [\"Position\", \"Responsibilities\"]}}]',2,1),(5,'2024-06-19 02:04:37.137302','2','Rekvizit8bit (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',2,1),(6,'2024-06-19 02:22:01.554651','2','Rekvizit8bit (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',2,1),(7,'2024-06-19 02:22:38.252352','4','MegaManage (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(8,'2024-06-19 02:22:53.136171','4','MegaManage (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(9,'2024-06-19 16:18:08.866852','4','MegaManage (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(10,'2024-06-21 03:32:56.667331','13','88877 (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(11,'2024-06-21 03:32:56.673242','14','888776 (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(12,'2024-06-21 03:32:56.679558','3','CheapAmigo (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(13,'2024-06-21 03:32:56.687175','7','Colambus (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(14,'2024-06-21 03:32:56.694284','8','Dan1k (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(15,'2024-06-21 03:32:56.700505','5','kekowka (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(16,'2024-06-21 03:32:56.706138','16','kekowka1 (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(17,'2024-06-21 03:32:56.712054','17','kekowka11 (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(18,'2024-06-21 03:32:56.718112','18','kekowka22 (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(19,'2024-06-21 03:32:56.724476','19','kekowka23 (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(20,'2024-06-21 03:32:56.730639','20','kekowka23_sus (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(21,'2024-06-21 03:32:56.735897','4','MegaManage (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(22,'2024-06-21 03:32:56.741979','15','Miagi722 (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(23,'2024-06-21 03:32:56.748260','2','Rekvizit8bit (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(24,'2024-06-21 03:32:56.754766','6','Thommy (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(25,'2024-06-21 03:32:56.760469','9','╨▓╨░╨▓╨░ (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',3,'',2,1),(26,'2024-06-21 03:32:56.767596','11','╨║╤Г╨║╨╡╤А (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(27,'2024-06-21 03:32:56.773189','12','╨║╤Г╨║╨╡╤А╨░ (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(28,'2024-06-21 03:32:56.779233','10','╤Б╤Г╨┐╨╡╤А╤Б╨╛╨│╨░╨╝╨░ (╨Ь╨╡╨╜╨╡╨┤╨╢╨╡╤А)',3,'',2,1),(29,'2024-06-21 07:19:13.423081','36','HQDfan (╨а╨░╨▒╨╛╤В╨╜╨╕╨║)',2,'[{\"changed\": {\"fields\": [\"Department\"]}}]',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('iotpbkdz9p8c7tqu1frpsykv9sl8jbte','e30:1sIyFr:ADT6H_Rd3993xqX_pmKtCuM7M8jJeISivRC3_MuSHvA','2024-06-30 22:21:43.918043'),('lrj100lxc1f7i2625fuki9egph6pelba','e30:1sIv1N:76c5Auw-ef7vILMT-b4TELvl7dIsjd2xwbr-avij3UA','2024-06-30 18:54:33.437851'),('nkisg79v5air71ri9qonj8zw91jiehja','e30:1sHu18:agoKsXUQLezUhSdzczzE5RcswJPwKOfjREquxTp9K0Y','2024-06-27 23:38:06.130605'),('pn3ot30osgclrv5qm8cnm9ytk6dnqwu9','e30:1sITre:erMOLqEO2dW_9fKTE5Yg0gOwEYl8oqAvtB91TSgWKVQ','2024-06-29 13:54:42.323597'),('rn10isc4u74h79emr9k9j2glwd741zbn','.eJxVjEEOwiAQRe_C2pCZQil16d4zEIYZpGpoUtqV8e7apAvd_vfef6kQt7WErckSJlZnZUGdfkeK6SF1J3yP9TbrNNd1mUjvij5o09eZ5Xk53L-DElv51p1A9h7FJLAOuM-9eAZKNic3DMl5mxmzYeMJiEgER2-YMCLKiNCp9wcZeDiI:1sKzy0:6Y5tSnnsAF_KyczFFHD3DVfcgLS8qoP3MjGWQp4ysPY','2024-07-06 12:35:40.822076'),('urffuxl20j1u38385mmvuqj1xbt6ttig','.eJxVjEsOwjAMBe-SNYr6cT5myZ4zRE5s0wJqpaZdIe4OlbqA7ZuZ9zKJtnVIW5UljWzOpovm9DtmKg-ZdsJ3mm6zLfO0LmO2u2IPWu11ZnleDvfvYKA6fGtUiaVD1ygExqzsyFPvuZe-BSgFHCN6CIqeoOlilKIB0Gn2ioyteX8AF1E4QQ:1sLVyU:YBdKipRaTHIHIAUsIiRqxhK8a5uu1HQc13bKWSfKMBU','2024-07-07 22:46:18.543337'),('vpwzyxtg4i7yb7gq8hv7qx65ws65eh7y','e30:1sIStr:nto-RtWD0QGdNeJUXCChjJMBNfA5qO_M0qLAlAXmDjg','2024-06-29 12:52:55.912481'),('wn2oaygzsowwio789ywtrg2elgu5kifw','.eJxVjEEOwiAQRe_C2hBhRhCX7nuGZpgBqRpISrsy3l2bdKHb_977LzXSupRx7WkeJ1EXherwu0XiR6obkDvVW9Pc6jJPUW-K3mnXQ5P0vO7u30GhXr61pwSEEoyJwWTLFBDQZM8cgnOMmQDAJCIGI0gOj5TlhNbbFBHgrN4f7q038w:1sJjjr:kpOe6Xaw0p71I9FcVsf5jnAahH-otP94bTBOdrtYoec','2024-07-03 01:03:51.014137'),('ynql72isooldh3y3btoq916o9q517x7b','e30:1sHtkC:hwUqcIUa-osAGWv8hwGtHaDHe1AlcxkiZUc2d1xBwxA','2024-06-27 23:20:36.086805');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_customuser`
--

LOCK TABLES `pmsapp_customuser` WRITE;
/*!40000 ALTER TABLE `pmsapp_customuser` DISABLE KEYS */;
INSERT INTO `pmsapp_customuser` VALUES (1,'pbkdf2_sha256$720000$llMuWQI7S7MF3yIlFD09ll$ZWL52zC4VifA0YZfPamKs0vCQ7rbGbiklZHkDwG7aOY=','2024-06-21 07:18:42.578188',1,'root','slava.volkov.228@yandex.ru',1,1,'2024-06-13 22:43:55.154372','','','','','','',NULL,NULL,NULL,0,0),(21,'pbkdf2_sha256$720000$oLvr0qDZ5WMVU8kZLCVcJO$lAinI93JN6dZLzltHBGjCqlAtqDpgBtEP1QvH7GiIbw=','2024-06-21 03:54:30.135562',0,'Shelby','',0,1,'2024-06-21 03:43:10.487127','employee','╨Ъ╨╕╤А╨╕╨╗╨╗','╨в╨╡╨╜╨╡╤В╨╕╨╗╨╛╨▓','╨Р╨╗╨╡╨║╤Б╨░╨╜╨┤╤А╨╛╨▓╨╕╤З','79152975694','46194442944',1,'╨Р╨╜╨░╨╗╨╕╤В╨╕╨║ ╨┤╨░╨╜╨╜╤Л╤Е','╨Р╨╜╨░╨╗╨╕╨╖╨╕╤А╤Г╨╡╤В ╨┤╨░╨╜╨╜╤Л╨╡, ╤Б╨╛╨▒╤А╨░╨╜╨╜╤Л╨╡ ╨▓ ╤Г╤З╨╡╨▒╨╜╨╛╨╝ ╨╖╨░╨▓╨╡╨┤╨╡╨╜╨╕╨╕, ╨┤╨╗╤П ╤Г╨╗╤Г╤З╤И╨╡╨╜╨╕╤П ╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨░. ╨Я╨╛╨┤╨│╨╛╤В╨░╨▓╨╗╨╕╨▓╨░╨╡╤В ╨╛╤В╤З╨╡╤В╤Л ╨╕ ╨▓╨╕╨╖╤Г╨░╨╗╨╕╨╖╨░╤Ж╨╕╨╕ ╨┤╨░╨╜╨╜╤Л╤Е ╨┤╨╗╤П ╤А╤Г╨║╨╛╨▓╨╛╨┤╤Б╤В╨▓╨░.',0,0),(22,'pbkdf2_sha256$720000$Po0602TZekdykdcHhUDW5m$nPxSt2La9ngBsRQopTCh+iKn/Jd4X+c3pfXjnqibFYY=','2024-06-21 19:15:14.377180',0,'CheapAmigo','',0,1,'2024-06-21 03:46:11.730459','employee','╨б╨▓╤П╤В╨╛╤Б╨╗╨░╨▓','╨Т╨╛╨╗╨║╨╛╨▓','╨б╨╡╤А╨│╨╡╨╡╨▓╨╕╤З','79153720975','4619233266',1,'╨б╨╕╤Б╤В╨╡╨╝╨╜╤Л╨╣ ╨░╨┤╨╝╨╕╨╜╨╕╤Б╤В╤А╨░╤В╨╛╤А','╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╨╡╤В ╨▒╨╡╤Б╨┐╨╡╤А╨╡╨▒╨╛╨╣╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╤Б╨╡╤А╨▓╨╡╤А╨╛╨▓ ╨╕ ╤Б╨╡╤В╨╡╨▓╨╛╨╣ ╨╕╨╜╤Д╤А╨░╤Б╤В╤А╤Г╨║╤В╤Г╤А╤Л. ╨г╤Б╤В╨░╨╜╨░╨▓╨╗╨╕╨▓╨░╨╡╤В ╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╤П╨╡╤В ╨┐╤А╨╛╨│╤А╨░╨╝╨╝╨╜╨╛╨╡ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ ╨╕ ╨░╨┐╨┐╨░╤А╨░╤В╨╜╨╛╨╡ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡.',0,0),(23,'pbkdf2_sha256$720000$06320c9ESMvRq247fjR9SP$PdysU2DJIJaOcInPqrdJcya4zka/LlgMNWAdx/U4/xI=','2024-06-22 16:04:33.918995',0,'Stalker','',0,1,'2024-06-21 03:48:20.379534','manager','╨Х╨▓╨│╨╡╨╜╨╕╨╣','╨Я╨╛╨▓╨╕╤А╨░╨╡╨▓','╨б╨╡╤А╨│╨╡╨╡╨▓╨╕╤З','79995453576','4245964004',1,'','',0,0),(24,'pbkdf2_sha256$720000$Tfb1IKlOm9DmIJXOBrA2m7$2twkcfTIcXySrVfii1SO5k0lXYCLEFdL6/g4Un9hC94=','2024-06-22 15:54:18.212633',0,'Granny','',0,1,'2024-06-21 05:17:35.832696','employee','╨Ф╨╝╨╕╤В╤А╨╕╨╣','╨С╨╛╨╣╨║╨╛','╨о╤А╤М╨╡╨▓╨╕╤З','88005553535','4619574994',1,'╨а╨░╨╖╤А╨░╨▒╨╛╤В╤З╨╕╨║ ╨┐╤А╨╛╨│╤А╨░╨╝╨╝╨╜╨╛╨│╨╛ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╤П','╨а╨░╨╖╤А╨░╨▒╨░╤В╤Л╨▓╨░╨╡╤В ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨▓╨╜╤Г╤В╤А╨╡╨╜╨╜╨╕╨╡ ╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╤П ╨╕ ╤Б╨╕╤Б╤В╨╡╨╝╤Л. ╨а╨░╨▒╨╛╤В╨░╨╡╤В ╨╜╨░╨┤ ╨╕╨╜╤В╨╡╨│╤А╨░╤Ж╨╕╨╡╨╣ ╤А╨░╨╖╨╗╨╕╤З╨╜╤Л╤Е ╤Б╨╕╤Б╤В╨╡╨╝ ╨╕ ╤Б╨╡╤А╨▓╨╕╤Б╨╛╨▓.',0,0),(25,'pbkdf2_sha256$720000$RulcLXsnyfMo2Y3GMA9g8w$MJaT7zhBpsSQA2WcrAUXVEPwEsUkoiOO62UpAm2fVd8=','2024-06-21 05:32:30.289301',0,'Dan1k','',0,1,'2024-06-21 05:32:29.845537','employee','╨Ф╨░╨╜╨╕╨╕╨╗','╨Р╨▒╨┤╨╕╤И╨╡╨▓','╨н╨╗╨┤╨░╤А╨╛╨▓╨╕╤З','795496516','4619894581',1,'╨Р╨┤╨╝╨╕╨╜╨╕╤Б╤В╤А╨░╤В╨╛╤А ╨▒╨░╨╖ ╨┤╨░╨╜╨╜╤Л╤Е','╨г╨┐╤А╨░╨▓╨╗╤П╨╡╤В ╨▒╨░╨╖╨░╨╝╨╕ ╨┤╨░╨╜╨╜╤Л╤Е ╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛ ╨╖╨░╨▓╨╡╨┤╨╡╨╜╨╕╤П. ╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╨╡╤В ╨▒╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╤М ╨╕ ╨┤╨╛╤Б╤В╤Г╨┐╨╜╨╛╤Б╤В╤М ╨┤╨░╨╜╨╜╤Л╤Е.',0,0),(26,'pbkdf2_sha256$720000$DToEW9m74rkb0l8UF0hmVO$5lDXYyTqxttf1Li9So2JkDVxiasIgoy8gmVG/qm419Y=','2024-06-21 05:38:24.967275',0,'Tteoman','',0,1,'2024-06-21 05:38:24.520649','employee','╨Ь╨░╤А╨║','╨в╨▓╨░╤А╨╛╨▓╤Б╨║╨╕╨╣','╨Р╨╗╨╡╨║╤Б╨░╨╜╨┤╤А╨╛╨▓╨╕╤З','7977164474','4618049233',1,'╨б╨┐╨╡╤Ж╨╕╨░╨╗╨╕╤Б╤В ╨┐╨╛ ╨╕╨╜╤Д╨╛╤А╨╝╨░╤Ж╨╕╨╛╨╜╨╜╨╛╨╣ ╨▒╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╨╕','╨Ч╨░╤Й╨╕╤Й╨░╨╡╤В ╨┤╨░╨╜╨╜╤Л╨╡ ╨╕ ╤Б╨╕╤Б╤В╨╡╨╝╤Л ╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛ ╨╖╨░╨▓╨╡╨┤╨╡╨╜╨╕╤П ╨╛╤В ╨║╨╕╨▒╨╡╤А╤Г╨│╤А╨╛╨╖. ╨а╨░╨╖╤А╨░╨▒╨░╤В╤Л╨▓╨░╨╡╤В ╨╕ ╨▓╨╜╨╡╨┤╤А╤П╨╡╤В ╨┐╨╛╨╗╨╕╤В╨╕╨║╨╕ ╨▒╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╨╕.',0,0),(27,'pbkdf2_sha256$720000$psJh7XFCVmDHDbtxvMx1xv$vg8xaeqIxGdSimArLF134HLSkE9jLHcITtUx3phySmI=','2024-06-21 05:41:07.958702',0,'SuperDendy','',0,1,'2024-06-21 05:41:07.505351','employee','╨Ф╨░╨╜╨╕╨╗╨░','╨з╨╕╤Б╤В╤П╨║╨╛╨▓','╨Р╨╜╨┤╤А╨╡╨╡╨▓╨╕╤З','7986319007','4620841071',1,'╨б╨┐╨╡╤Ж╨╕╨░╨╗╨╕╤Б╤В ╨┐╨╛ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨║╨╡ ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╨╡╨╣','╨Я╨╛╨╝╨╛╨│╨░╨╡╤В ╤Б╤В╤Г╨┤╨╡╨╜╤В╨░╨╝ ╨╕ ╨┐╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╤П╨╝ ╤Б ╤В╨╡╤Е╨╜╨╕╤З╨╡╤Б╨║╨╕╨╝╨╕ ╨┐╤А╨╛╨▒╨╗╨╡╨╝╨░╨╝╨╕. ╨Я╤А╨╛╨▓╨╛╨┤╨╕╤В ╨╛╨▒╤Г╤З╨╡╨╜╨╕╨╡ ╨╕ ╨║╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╕ ╨┐╨╛ ╨╕╤Б╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╨╜╨╕╤О IT-╤А╨╡╤Б╤Г╤А╤Б╨╛╨▓.',0,0),(28,'pbkdf2_sha256$390000$W4cPIVtwKtLnjCQb2b6XoL$JfFTFkhV2o99KVNu7zXoAipKKnfVtE+NAg0DUK6E7P8=','2024-06-23 22:46:18.535037',0,'9miceKing','',0,1,'2024-06-21 05:45:47.239737','employee','╨а╨╛╨╝╨░╨╜','╨Ы╤О╤Б╤В╨╛╤З╨║╨╕╨╜','╨б╨╡╤А╨│╨╡╨╡╨▓╨╕╤З','7977253900','461684158',1,'╨б╨╡╤В╨╡╨▓╨╛╨╣ ╨╕╨╜╨╢╨╡╨╜╨╡╤А','╨Я╤А╨╛╨╡╨║╤В╨╕╤А╤Г╨╡╤В ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╤Б╨╡╤В╤М ╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛ ╨╖╨░╨▓╨╡╨┤╨╡╨╜╨╕╤П. ╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╨╡╤В ╨▒╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╤М ╨╕ ╨╜╨░╨┤╨╡╨╢╨╜╨╛╤Б╤В╤М ╤Б╨╡╤В╨╡╨▓╤Л╤Е ╨┐╨╛╨┤╨║╨╗╤О╤З╨╡╨╜╨╕╨╣.',0,0),(29,'pbkdf2_sha256$720000$iGCkfWtl8hahc8BILVvVBx$tPFQvCZNvDvVMCKOSLICMGWm/z1K5GCiX0RAZxavgAo=','2024-06-22 12:51:32.063267',0,'Cheburus','',0,1,'2024-06-21 05:48:41.947728','employee','╨о╨╗╨╕╨░╨╜','╨Э╤Г╤И╤В╨░╨╣╨║╨╕╨╜','╨п╨╜╨╕╤Б╨╛╨▓╨╕╤З','7915845093','4618540943',1,'╨в╨╡╤Е╨╜╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨┐╨╕╤Б╨░╤В╨╡╨╗╤М','╨б╨╛╨╖╨┤╨░╨╡╤В ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨┤╨╛╨║╤Г╨╝╨╡╨╜╤В╨░╤Ж╨╕╤О ╨┤╨╗╤П IT-╤Б╨╕╤Б╤В╨╡╨╝ ╨╕ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╨▓. ╨Я╨╕╤И╨╡╤В ╨╕╨╜╤Б╤В╤А╤Г╨║╤Ж╨╕╨╕ ╨╕ ╤А╤Г╨║╨╛╨▓╨╛╨┤╤Б╤В╨▓╨░ ╨┤╨╗╤П ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╨╡╨╣.',0,0),(30,'pbkdf2_sha256$720000$TpPHde2aAxwd3YpKUsbAdE$LYc+rLDDoVA+XKS67kbpzCMBSrwfGM+X22qTlAiIkuA=','2024-06-21 19:26:01.221795',0,'Danila2Trankvila','',0,1,'2024-06-21 05:51:51.722152','employee','╨а╤П╨▒╤З╨╡╨▓╤Б╨║╨╕╨╣','╨Ф╨░╨╜╨╕╨╕╨╗','╨а╤Г╤Б╨╗╨░╨╜╨╛╨▓╨╕╤З','7916077437','4616854316',1,'╨Т╨╡╨▒-╤А╨░╨╖╤А╨░╨▒╨╛╤В╤З╨╕╨║','╨Я╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╤П╨╡╤В ╨▓╨╡╨▒-╤Б╨░╨╣╤В╤Л ╤Г╤З╨╡╨▒╨╜╨╛╨│╨╛ ╨╖╨░╨▓╨╡╨┤╨╡╨╜╨╕╤П. ╨а╨░╨▒╨╛╤В╨░╨╡╤В ╨╜╨░╨┤ ╤Г╨╗╤Г╤З╤И╨╡╨╜╨╕╨╡╨╝ ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╤Б╨║╨╛╨│╨╛ ╨╛╨┐╤Л╤В╨░ ╨╜╨░ ╨▓╨╡╨▒-╤А╨╡╤Б╤Г╤А╤Б╨░╤Е.',0,0),(31,'pbkdf2_sha256$720000$CnXzrVBlQNNrbaLPZrE1FG$UrrSqT0qCaM5rfbhTysRmDLbJtnoGWfuzP1nUa6IRuw=','2024-06-21 07:43:23.349444',0,'Amigus','',0,1,'2024-06-21 06:31:59.851376','manager','╨Х╤А╨╡╨╝╨╕╨╜','╨Э╨╕╨║╨╕╤В╨░','╨а╤Г╤Б╨╗╨░╨╜╨╛╨▓╨╕╤З','61631304','4619958724',2,'','',0,0),(32,'pbkdf2_sha256$720000$jVgJO1sFAot0WikVYlNqEo$fjLJQyRrTJlBBD5xfom3HwNC8TwW74Af/GyDUI94ovE=','2024-06-21 06:46:39.414961',0,'Zek229','',0,1,'2024-06-21 06:46:38.962744','employee','╨Ч╨░╤Е╨░╤А','╨б╨╕╨╝╨░╨║╨╛╨▓','╨Ф╨╝╨╕╤В╤А╨╕╨╡╨▓╨╕╤З','7916544825','4618905361',2,'╨б╤Г-╤И╨╡╤Д','╨Я╨╛╨╝╨╛╤Й╤М ╨▓ ╤Г╨┐╤А╨░╨▓╨╗╨╡╨╜╨╕╨╕ ╨║╤Г╤Е╨╜╨╡╨╣ ╨╕ ╨║╨╛╨╜╤В╤А╨╛╨╗╤М ╨╖╨░ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨░╨╝╨╕ ╨┐╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╤П ╨▒╨╗╤О╨┤. ╨Ю╨▒╤Г╤З╨╡╨╜╨╕╨╡ ╤Б╨╛╤В╤А╤Г╨┤╨╜╨╕╨║╨╛╨▓ ╨╜╨╛╨▓╤Л╨╝ ╤А╨╡╤Ж╨╡╨┐╤В╨░╨╝ ╨╕ ╨║╤Г╨╗╨╕╨╜╨░╤А╨╜╤Л╨╝ ╤В╨╡╤Е╨╜╨╕╨║╨░╨╝. ╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ ╤Б╨╗╨░╨╢╨╡╨╜╨╜╨╛╨╣ ╤А╨░╨▒╨╛╤В╤Л ╨▓╤Б╨╡╤Е ╨┐╨╛╨┤╤А╨░╨╖╨┤╨╡╨╗╨╡╨╜╨╕╨╣ ╨║╤Г╤Е╨╜╨╕. ╨г╤З╨░╤Б╤В╨╕╨╡ ╨▓ ╤Б╨╛╨╖╨┤╨░╨╜╨╕╨╕ ╨╜╨╛╨▓╤Л╤Е ╨▒╨╗╤О╨┤ ╨╕ ╤Г╨╗╤Г╤З╤И╨╡╨╜╨╕╨╕ ╤Б╤Г╤Й╨╡╤Б╤В╨▓╤Г╤О╤Й╨╕╤Е ╤А╨╡╤Ж╨╡╨┐╤В╨╛╨▓.',0,0),(33,'pbkdf2_sha256$720000$cpTE77LjjO1UFtr3a8S2wc$2P3zgwZik1osaEP+7ybisQ1h8ipVeL5aa7DG466x1LI=','2024-06-21 06:51:58.879516',0,'VarVar','',0,1,'2024-06-21 06:51:58.437192','employee','╨б╨╡╤А╨│╨╡╨╣','╨в╨░╤А╨░╨╜','╨о╤А╤М╨╡╨▓╨╕╤З','79159852206','461927701',2,'╨Я╨╛╨▓╨░╤А ╨│╨╛╤А╤П╤З╨╡╨│╨╛ ╤Ж╨╡╤Е╨░','╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╨╛╤Б╨╜╨╛╨▓╨╜╤Л╤Е ╨│╨╛╤А╤П╤З╨╕╤Е ╨▒╨╗╤О╨┤ ╨┐╨╛ ╤А╨╡╤Ж╨╡╨┐╤В╨░╨╝. ╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ ╤Б╨▓╨╛╨╡╨▓╤А╨╡╨╝╨╡╨╜╨╜╨╛╨│╨╛ ╨┐╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╤П ╨╕ ╨┐╨╛╨┤╨░╤З╨╕ ╨▒╨╗╤О╨┤. ╨Я╨╛╨┤╨┤╨╡╤А╨╢╨░╨╜╨╕╨╡ ╤З╨╕╤Б╤В╨╛╤В╤Л ╨╕ ╨┐╨╛╤А╤П╨┤╨║╨░ ╨╜╨░ ╤А╨░╨▒╨╛╤З╨╡╨╝ ╨╝╨╡╤Б╤В╨╡. ╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓ ╨┤╨╗╤П ╨┐╨╛╤Б╨╗╨╡╨┤╤Г╤О╤Й╨╡╨│╨╛ ╨┐╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╤П.',0,0),(34,'pbkdf2_sha256$720000$pTOD4UGXlHOmXRJCSm4234$rhA18HPU8YamdNMsDd501xq0UpTIEIOhxrUeevJAX2g=','2024-06-21 06:57:07.173745',0,'AntiRacistMan','',0,1,'2024-06-21 06:57:06.680068','employee','╨и╨░╤Е╨▒╨╛╨╖','╨С╨╡╨│╨╝╨░╤В╨╛╨▓','╨У╨╛╨╗╨╕╨▒╨╢╨╛╨╜╨╛╨▓╨╕╤З','7916844901','4619084261',2,'╨Я╨╛╨▓╨░╤А ╤Е╨╛╨╗╨╛╨┤╨╜╨╛╨│╨╛ ╤Ж╨╡╤Е╨░','╨б╨╛╨╖╨┤╨░╨╜╨╕╨╡ ╤Б╨░╨╗╨░╤В╨╛╨▓, ╨╖╨░╨║╤Г╤Б╨╛╨║ ╨╕ ╨┤╨╡╤Б╨╡╤А╤В╨╛╨▓ ╨┐╨╛ ╤А╨╡╤Ж╨╡╨┐╤В╨░╨╝. ╨Я╤А╨╛╨▓╨╡╤А╨║╨░ ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨╕ ╤Б╨▓╨╡╨╢╨╡╤Б╤В╨╕ ╨╕╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╨╝╤Л╤Е ╨╕╨╜╨│╤А╨╡╨┤╨╕╨╡╨╜╤В╨╛╨▓. ╨н╤Б╤В╨╡╤В╨╕╤З╨╡╤Б╨║╨╛╨╡ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨▒╨╗╤О╨┤ ╨┐╨╡╤А╨╡╨┤ ╨┐╨╛╨┤╨░╤З╨╡╨╣. ╨б╨╛╨▒╨╗╤О╨┤╨╡╨╜╨╕╨╡ ╨┐╤А╨░╨▓╨╕╨╗ ╤Е╤А╨░╨╜╨╡╨╜╨╕╤П ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓ ╨┤╨╗╤П ╨┐╤А╨╡╨┤╨╛╤В╨▓╤А╨░╤Й╨╡╨╜╨╕╤П ╨┐╨╛╤А╤З╨╕. ╨Я╨╛╨┤╨┤╨╡╤А╨╢╨░╨╜╨╕╨╡ ╤А╨░╨▒╨╛╤З╨╡╨│╨╛ ╨╝╨╡╤Б╤В╨░ ╨▓ ╤З╨╕╤Б╤В╨╛╤В╨╡ ╨╕ ╤Б╨╛╨▒╨╗╤О╨┤╨╡╨╜╨╕╨╡ ╤Б╨░╨╜╨╕╤В╨░╤А╨╜╤Л╤Е ╨╜╨╛╤А╨╝.',0,0),(35,'pbkdf2_sha256$720000$3aG8rBgXLtgDHqRSpMDl9I$XT0BK9X0/nBGr3looYTuaVpQQnz9nYpmot1B5x37e2s=','2024-06-21 07:03:54.220335',0,'PCgamingLord','',0,1,'2024-06-21 07:03:53.771978','employee','╨Ф╨╝╨╕╤В╤А╨╕╨╣','╨Э╨░╨╗╨▒╨░╨╜╤В╨╛╨▓','╨о╤А╤М╨╡╨▓╨╕╤З','7917955924','4619095461',2,'╨Я╨╡╨║╨░╤А╤М','╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╤Е╨╗╨╡╨▒╨░, ╨▒╤Г╨╗╨╛╤З╨╡╨║, ╨┐╨╕╤А╨╛╨│╨╛╨▓ ╨╕ ╨┤╤А╤Г╨│╨╛╨╣ ╨▓╤Л╨┐╨╡╤З╨║╨╕. ╨а╨╡╨│╤Г╨╗╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨▓╤А╨╡╨╝╨╡╨╜╨╕ ╨╕ ╤В╨╡╨╝╨┐╨╡╤А╨░╤В╤Г╤А╤Л ╨▓╤Л╨┐╨╡╨║╨░╨╜╨╕╤П. ╨Я╤А╨░╨▓╨╕╨╗╤М╨╜╨╛╨╡ ╨╖╨░╨╝╨╡╤И╨╕╨▓╨░╨╜╨╕╨╡ ╤В╨╡╤Б╤В╨░ ╨┐╨╛ ╤А╨╡╤Ж╨╡╨┐╤В╨░╨╝. ╨н╨║╤Б╨┐╨╡╤А╨╕╨╝╨╡╨╜╤В╤Л ╤Б ╨╜╨╛╨▓╤Л╨╝╨╕ ╤А╨╡╤Ж╨╡╨┐╤В╨░╨╝╨╕ ╨╕ ╨▓╨║╤Г╤Б╨░╨╝╨╕. ╨Я╨╛╨┤╨┤╨╡╤А╨╢╨░╨╜╨╕╨╡ ╤З╨╕╤Б╤В╨╛╤В╤Л ╨╜╨░ ╤А╨░╨▒╨╛╤З╨╡╨╝ ╨╝╨╡╤Б╤В╨╡ ╨╕ ╤Б╨╛╨▒╨╗╤О╨┤╨╡╨╜╨╕╨╡ ╨│╨╕╨│╨╕╨╡╨╜╨╕╤З╨╡╤Б╨║╨╕╤Е ╨╜╨╛╤А╨╝.',0,0),(36,'pbkdf2_sha256$720000$xL1OQzPysBtew6tgNqdOLi$IMUx2iq0phmsv7zbfbbYtB2t/yPK7QAzzd244pkxSbo=','2024-06-21 07:06:55.000000',0,'HQDfan','',0,1,'2024-06-21 07:06:54.000000','employee','╨Ф╨╝╨╕╤В╤А╨╕╨╣','╨Э╨░╨╗╨░╨┐╨║╨╕╨╜','╨б╨╡╤А╨│╨╡╨╡╨▓╨╕╤З','7414988057','4619845018',2,'╨Ъ╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╨╜╤В ╨┐╨╛ ╨┐╨╕╤В╨░╨╜╨╕╤О','╨б╨╛╤Б╤В╨░╨▓╨╗╨╡╨╜╨╕╨╡ ╤Б╨▒╨░╨╗╨░╨╜╤Б╨╕╤А╨╛╨▓╨░╨╜╨╜╨╛╨│╨╛ ╨╝╨╡╨╜╤О ╤Б ╤Г╤З╨╡╤В╨╛╨╝ ╨┐╨╕╤В╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨┐╨╛╤В╤А╨╡╨▒╨╜╨╛╤Б╤В╨╡╨╣ ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓. ╨Я╤А╨╛╨▓╨╡╨┤╨╡╨╜╨╕╨╡ ╨║╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╣ ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨╕ ╤Б╨╛╤В╤А╤Г╨┤╨╜╨╕╨║╨╛╨▓ ╨┐╨╛ ╨▓╨╛╨┐╤А╨╛╤Б╨░╨╝ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨│╨╛ ╨┐╨╕╤В╨░╨╜╨╕╤П. ╨Ю╤Ж╨╡╨╜╨║╨░ ╨╕ ╤А╨░╤Б╤З╨╡╤В ╨║╨░╨╗╨╛╤А╨╕╨╣╨╜╨╛╤Б╤В╨╕ ╨╕ ╨┐╨╕╤В╨░╤В╨╡╨╗╤М╨╜╨╛╨╣ ╤Ж╨╡╨╜╨╜╨╛╤Б╤В╨╕ ╨▒╨╗╤О╨┤. ╨Ю╤А╨│╨░╨╜╨╕╨╖╨░╤Ж╨╕╤П ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨╝╨╡╤А╨╛╨┐╤А╨╕╤П╤В╨╕╨╣ ╨╕ ╨╗╨╡╨║╤Ж╨╕╨╣ ╨╛ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨╝ ╨┐╨╕╤В╨░╨╜╨╕╨╕. ╨Ю╤В╤Б╨╗╨╡╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╤Б╨╛╤Б╤В╨╛╤П╨╜╨╕╤П ╨╖╨┤╨╛╤А╨╛╨▓╤М╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨╕ ╨║╨╛╤А╤А╨╡╨║╤В╨╕╤А╨╛╨▓╨║╨░ ╨╝╨╡╨╜╤О ╨┐╤А╨╕ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛╤Б╤В╨╕.',0,0),(37,'pbkdf2_sha256$720000$408PUAssHkb3MLe7eN2e3K$53l9NAVxIDacjlXrdo/SEBUwH3Yr0jdV6AJGCS4h8qM=','2024-06-21 07:13:34.516293',0,'JesusJoker','',0,1,'2024-06-21 07:13:34.070116','employee','╨Р╨╜╨┤╤А╨╡╨╣','╨в╤А╤Г╤Е╨╕╨╜','╨Р╨╗╨╡╨║╤Б╨░╨╜╨┤╤А╨╛╨▓╨╕╤З','7815666999','4610493021',2,'╨Ю╤Д╨╕╤Ж╨╕╨░╨╜╤В','╨Я╤А╨╕╨╡╨╝ ╨╖╨░╨║╨░╨╖╨╛╨▓, ╨┐╨╛╨┤╨░╤З╨░ ╨▒╨╗╤О╨┤ ╨╕ ╨╜╨░╨┐╨╕╤В╨║╨╛╨▓, ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ ╨▓╤Л╤Б╨╛╨║╨╛╨│╨╛ ╤Г╤А╨╛╨▓╨╜╤П ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╤П. ╨б╨╛╨┤╨╡╤А╨╢╨░╨╜╨╕╨╡ ╨╖╨░╨╗╨░ ╤Б╤В╨╛╨╗╨╛╨▓╨╛╨╣ ╨▓ ╤З╨╕╤Б╤В╨╛╤В╨╡ ╨╕ ╨┐╨╛╤А╤П╨┤╨║╨╡, ╤Г╨▒╨╛╤А╨║╨░ ╤Б╤В╨╛╨╗╨╛╨▓ ╨┐╨╛╤Б╨╗╨╡ ╨┐╨╛╤Б╨╡╤В╨╕╤В╨╡╨╗╨╡╨╣. ╨Я╨╛╨╝╨╛╤Й╤М ╨┐╨╛╤Б╨╡╤В╨╕╤В╨╡╨╗╤П╨╝ ╨▓ ╨▓╤Л╨▒╨╛╤А╨╡ ╨▒╨╗╤О╨┤ ╨╕ ╨╜╨░╨┐╨╕╤В╨║╨╛╨▓, ╨╛╤В╨▓╨╡╤В╤Л ╨╜╨░ ╨▓╨╛╨┐╤А╨╛╤Б╤Л ╨┐╨╛ ╨╝╨╡╨╜╤О. ╨Ю╨▒╤А╨░╨▒╨╛╤В╨║╨░ ╨╢╨░╨╗╨╛╨▒ ╨╕ ╨┐╨╛╨╢╨╡╨╗╨░╨╜╨╕╨╣ ╨┐╨╛╤Б╨╡╤В╨╕╤В╨╡╨╗╨╡╨╣, ╤А╨╡╤И╨╡╨╜╨╕╨╡ ╨║╨╛╨╜╤Д╨╗╨╕╨║╤В╨╜╤Л╤Е ╤Б╨╕╤В╤Г╨░╤Ж╨╕╨╣. ╨б╨╗╨╡╨┤╨╛╨▓╨░╨╜╨╕╨╡ ╤Г╤Б╤В╨░╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤Л╨╝ ╤Б╤В╨░╨╜╨┤╨░╤А╤В╨░╨╝ ╨╕ ╨┐╤А╨╛╤Ж╨╡╨┤╤Г╤А╨░╨╝ ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╤П.',0,0),(38,'pbkdf2_sha256$720000$gvHbvqQpjlUrMcMcpk2A7X$orrFBmPDdOjDZbR9nExz844GPebu4u1u7JkxR2bbzhU=','2024-06-21 07:22:54.758619',0,'ZaWarka','',0,1,'2024-06-21 07:22:54.310191','employee','╨Ч╨░╨▓╨░╤А╨╖╨░╨╡╨▓╨░','╨б╨╛╤Д╤М╤П','╨Ф╨╝╨╕╤В╤А╨╕╨╡╨▓╨╜╨░','791650436','4617953721',2,'╨и╨╡╤Д-╨┐╨╛╨▓╨░╤А','╨б╨╛╤Б╤В╨░╨▓╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╨╝╨╡╨╜╤О, ╤Г╤З╨╕╤В╤Л╨▓╨░╤П ╤А╨░╨╖╨╜╨╛╨╛╨▒╤А╨░╨╖╨╕╨╡ ╨╕ ╤Б╨▒╨░╨╗╨░╨╜╤Б╨╕╤А╨╛╨▓╨░╨╜╨╜╨╛╤Б╤В╤М ╨▒╨╗╤О╨┤. ╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ ╨▓╤Л╤Б╨╛╨║╨╛╨│╨╛ ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨┐╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╤П ╨▒╨╗╤О╨┤ ╨╕ ╤Б╨╛╨▒╨╗╤О╨┤╨╡╨╜╨╕╨╡ ╤Б╨░╨╜╨╕╤В╨░╤А╨╜╤Л╤Е ╨╜╨╛╤А╨╝. ╨а╤Г╨║╨╛╨▓╨╛╨┤╤Б╤В╨▓╨╛ ╨║╤Г╤Е╨╛╨╜╨╜╨╛╨╣ ╨║╨╛╨╝╨░╨╜╨┤╨╛╨╣, ╤А╨░╤Б╨┐╤А╨╡╨┤╨╡╨╗╨╡╨╜╨╕╨╡ ╨╛╨▒╤П╨╖╨░╨╜╨╜╨╛╤Б╤В╨╡╨╣ ╨╕ ╨╛╨▒╤Г╤З╨╡╨╜╨╕╨╡ ╨╜╨╛╨▓╤Л╤Е ╤Б╨╛╤В╤А╤Г╨┤╨╜╨╕╨║╨╛╨▓. ╨Ъ╨╛╨╜╤В╤А╨╛╨╗╤М ╨╖╨░ ╨╖╨░╨║╤Г╨┐╨║╨╛╨╣ ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓, ╨╕╤Е ╨║╨░╤З╨╡╤Б╤В╨▓╨╛╨╝ ╨╕ ╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╛╨╝. ╨Ю╤В╤Б╨╗╨╡╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨║╤Г╨╗╨╕╨╜╨░╤А╨╜╤Л╤Е ╤В╤А╨╡╨╜╨┤╨╛╨▓ ╨╕ ╨╕╤Е ╨▓╨╜╨╡╨┤╤А╨╡╨╜╨╕╨╡ ╨▓ ╨╝╨╡╨╜╤О.',0,0),(39,'pbkdf2_sha256$720000$8bmp4OAymvVqshAEm0IJAw$QCNnLG+GeZy9s+T+YPjUxGsau2RbaL98qc6F+PEzGA4=','2024-06-21 07:25:56.763861',0,'SigmaProgger','',0,1,'2024-06-21 07:25:56.315681','employee','╨У╨╡╨▓╨╛╤А╨│','╨Ь╨╡╨╗╨║╨╛╨╜╤П╨╜','╨Р╤А╤В╤Г╤А╨╛╨▓╨╕╤З','7915834032','4916045834',2,'╨Ъ╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╨╜╤В ╨┐╨╛ ╨┐╨╕╤В╨░╨╜╨╕╤О','╨б╨╛╤Б╤В╨░╨▓╨╗╨╡╨╜╨╕╨╡ ╤Б╨▒╨░╨╗╨░╨╜╤Б╨╕╤А╨╛╨▓╨░╨╜╨╜╨╛╨│╨╛ ╨╝╨╡╨╜╤О ╤Б ╤Г╤З╨╡╤В╨╛╨╝ ╨┐╨╕╤В╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨┐╨╛╤В╤А╨╡╨▒╨╜╨╛╤Б╤В╨╡╨╣ ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓. ╨Я╤А╨╛╨▓╨╡╨┤╨╡╨╜╨╕╨╡ ╨║╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╣ ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨╕ ╤Б╨╛╤В╤А╤Г╨┤╨╜╨╕╨║╨╛╨▓ ╨┐╨╛ ╨▓╨╛╨┐╤А╨╛╤Б╨░╨╝ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨│╨╛ ╨┐╨╕╤В╨░╨╜╨╕╤П. ╨Ю╤Ж╨╡╨╜╨║╨░ ╨╕ ╤А╨░╤Б╤З╨╡╤В ╨║╨░╨╗╨╛╤А╨╕╨╣╨╜╨╛╤Б╤В╨╕ ╨╕ ╨┐╨╕╤В╨░╤В╨╡╨╗╤М╨╜╨╛╨╣ ╤Ж╨╡╨╜╨╜╨╛╤Б╤В╨╕ ╨▒╨╗╤О╨┤. ╨Ю╤А╨│╨░╨╜╨╕╨╖╨░╤Ж╨╕╤П ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨╝╨╡╤А╨╛╨┐╤А╨╕╤П╤В╨╕╨╣ ╨╕ ╨╗╨╡╨║╤Ж╨╕╨╣ ╨╛ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨╝ ╨┐╨╕╤В╨░╨╜╨╕╨╕. ╨Ю╤В╤Б╨╗╨╡╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╤Б╨╛╤Б╤В╨╛╤П╨╜╨╕╤П ╨╖╨┤╨╛╤А╨╛╨▓╤М╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨╕ ╨║╨╛╤А╤А╨╡╨║╤В╨╕╤А╨╛╨▓╨║╨░ ╨╝╨╡╨╜╤О ╨┐╤А╨╕ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛╤Б╤В╨╕.',0,0),(40,'pbkdf2_sha256$720000$G67zoqrKPHr1wzmzAKcBTG$aPl+1q+uVVciQAY/F3cgI9CZEeeXXXKzNFxj1N7//sE=','2024-06-22 12:35:41.631908',0,'Frontoender','',0,1,'2024-06-21 08:10:27.461512','manager','╨б╤В╨╡╨┐╨░╨╜','╨б╤В╨╡╨┐╨░╨╜╨╛╨▓','╨Ю╨╗╨╡╨│╨╛╨▓╨╕╤З','7916264052','4002494290',1,'','',0,0);
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
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_department`
--

LOCK TABLES `pmsapp_department` WRITE;
/*!40000 ALTER TABLE `pmsapp_department` DISABLE KEYS */;
INSERT INTO `pmsapp_department` VALUES (1,'╨ж╨╕╤Д╤А╨╛╨▓╤Л╨╡ ╨в╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╨╕','╨Ю╤В╨┤╨╡╨╗ ╨╕╨│╤А╨░╨╡╤В ╨║╨╗╤О╤З╨╡╨▓╤Г╤О ╤А╨╛╨╗╤М ╨▓ ╤А╨░╨╖╤А╨░╨▒╨╛╤В╨║╨╡ ╨╕ ╨▓╨╜╨╡╨┤╤А╨╡╨╜╨╕╨╕ ╨┐╨╡╤А╨╡╨┤╨╛╨▓╤Л╤Е IT-╤А╨╡╤И╨╡╨╜╨╕╨╣, ╨╜╨░╨┐╤А╨░╨▓╨╗╨╡╨╜╨╜╤Л╤Е ╨╜╨░ ╤Г╨╗╤Г╤З╤И╨╡╨╜╨╕╨╡ ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╨╛╨│╨╛ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨░. ╨б╨┐╨╡╤Ж╨╕╨░╨╗╨╕╨╖╨░╤Ж╨╕╤П ╨╜╨░ ╤Б╨╛╨╖╨┤╨░╨╜╨╕╨╕ ╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨║╨╡ ╤Ж╨╕╤Д╤А╨╛╨▓╤Л╤Е ╨┐╨╗╨░╤В╤Д╨╛╤А╨╝ ╨┤╨╗╤П ╨┤╨╕╤Б╤В╨░╨╜╤Ж╨╕╨╛╨╜╨╜╨╛╨│╨╛ ╨╛╨▒╤Г╤З╨╡╨╜╨╕╤П, ╤А╨░╨╖╤А╨░╨▒╨╛╤В╨║╨╡ ╤Г╤З╨╡╨▒╨╜╤Л╤Е ╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╣ ╨╕ ╤Б╨╕╤Б╤В╨╡╨╝ ╤Н╨╗╨╡╨║╤В╤А╨╛╨╜╨╜╨╛╨│╨╛ ╨╛╨▒╤Г╤З╨╡╨╜╨╕╤П. ╨Ъ╨╛╨╝╨░╨╜╨┤╨░ ╤А╨░╨▒╨╛╤В╨░╨╡╤В ╨╜╨░╨┤ ╨░╨▓╤В╨╛╨╝╨░╤В╨╕╨╖╨░╤Ж╨╕╨╡╨╣ ╤Г╨┐╤А╨░╨▓╨╗╨╡╨╜╤З╨╡╤Б╨║╨╕╤Е ╨╕ ╨░╨┤╨╝╨╕╨╜╨╕╤Б╤В╤А╨░╤В╨╕╨▓╨╜╤Л╤Е ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╨▓, ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╤П ╤Г╨┤╨╛╨▒╤Б╤В╨▓╨╛ ╨╕ ╨┤╨╛╤Б╤В╤Г╨┐╨╜╨╛╤Б╤В╤М ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨╕ ╨┐╤А╨╡╨┐╨╛╨┤╨░╨▓╨░╤В╨╡╨╗╨╡╨╣. ╨Ч╨░╨╜╨╕╨╝╨░╤О╤В╤Б╤П ╨▓╨╜╨╡╨┤╤А╨╡╨╜╨╕╨╡╨╝ ╨╜╨╛╨▓╤Л╨╡ ╤В╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╨╕ ╨╕ ╨╕╨╜╨╜╨╛╨▓╨░╤Ж╨╕╨╕, ╤З╤В╨╛╨▒╤Л ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╤В╤М ╨▓╤Л╤Б╨╛╨║╨╕╨╡ ╤Б╤В╨░╨╜╨┤╨░╤А╤В╤Л ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╨╛╨│╨╛ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨░ ╨╕ ╤Б╨┐╨╛╤Б╨╛╨▒╤Б╤В╨▓╨╛╨▓╨░╤В╤М ╤А╨░╨╖╨▓╨╕╤В╨╕╤О ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╨╛╨│╨╛ ╤Г╤З╤А╨╡╨╢╨┤╨╡╨╜╨╕╤П ╨▓ ╤Ж╨╕╤Д╤А╨╛╨▓╤Г╤О ╤Н╨┐╨╛╤Е╤Г.'),(2,'╨Я╨╕╤В╨░╨╜╨╕╨╡ ╨╕ ╨│╨░╤Б╤В╤А╨╛╨╜╨╛╨╝╨╕╤П','╨Ю╤В╨┤╨╡╨╗ ╨╖╨░╨╜╨╕╨╝╨░╨╡╤В╤Б╤П ╨╛╤А╨│╨░╨╜╨╕╨╖╨░╤Ж╨╕╨╡╨╣ ╨┐╨╕╤В╨░╨╜╨╕╤П ╨▓ ╤Г╤З╨╡╨▒╨╜╨╛╨╝ ╨╖╨░╨▓╨╡╨┤╨╡╨╜╨╕╨╕, ╤Б╨╛╨╖╨┤╨░╨╜╨╕╨╡╨╝ ╤А╨░╨╖╨╜╨╛╨╛╨▒╤А╨░╨╖╨╜╤Л╤Е ╨╝╨╡╨╜╤О ╨╕ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡╨╝ ╨▓╤Л╤Б╨╛╨║╨╛╨│╨╛ ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨▒╨╗╤О╨┤. ╨Ъ╨╛╨╝╨░╨╜╨┤╨░ ╤Б╨╗╨╡╨┤╨╕╤В ╨╖╨░ ╤Б╨╛╨▒╨╗╤О╨┤╨╡╨╜╨╕╨╡╨╝ ╤Б╤В╨░╨╜╨┤╨░╤А╤В╨╛╨▓ ╨▒╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╨╕ ╨╕ ╨┐╨╕╤Й╨╡╨▓╨╛╨╣ ╨│╨╕╨│╨╕╨╡╨╜╤Л, ╤Б╤В╤А╨╡╨╝╤П╤Б╤М ╨┐╤А╨╡╨┤╨╗╨╛╨╢╨╕╤В╤М ╤Б╤В╤Г╨┤╨╡╨╜╤В╨░╨╝ ╨╕ ╨┐╨╡╤А╤Б╨╛╨╜╨░╨╗╤Г ╨▓╨║╤Г╤Б╨╜╤Л╨╡, ╨░ ╤В╨░╨║╨╢╨╡ ╨┐╨╛╨╗╨╡╨╖╨╜╤Л╨╡ ╨╛╨┐╤Ж╨╕╨╕ ╨┐╨╕╤В╨░╨╜╨╕╤П.');
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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_schedule`
--

LOCK TABLES `pmsapp_schedule` WRITE;
/*!40000 ALTER TABLE `pmsapp_schedule` DISABLE KEYS */;
INSERT INTO `pmsapp_schedule` VALUES (118,'2024-06-21',22,0,0),(119,'2024-06-17',22,0,0),(120,'2024-06-18',22,0,0),(121,'2024-06-19',22,0,0),(122,'2024-06-20',22,0,0),(123,'2024-06-22',22,0,0),(124,'2024-06-23',22,0,0),(125,'2024-06-21',21,0,1),(126,'2024-06-17',21,0,1),(127,'2024-06-18',21,0,0),(128,'2024-06-19',21,0,0),(129,'2024-06-20',21,0,0),(130,'2024-06-22',21,0,1),(131,'2024-06-23',21,0,0),(132,'2024-06-21',24,0,1),(133,'2024-06-17',24,0,0),(134,'2024-06-18',24,0,0),(135,'2024-06-19',24,0,0),(136,'2024-06-20',24,0,0),(137,'2024-06-22',24,0,0),(138,'2024-06-23',24,0,0),(139,'2024-06-21',26,1,0),(140,'2024-06-21',32,0,0),(141,'2024-06-17',32,0,0),(142,'2024-06-18',32,0,1),(143,'2024-06-19',32,0,0),(144,'2024-06-20',32,0,0),(145,'2024-06-22',32,0,0),(146,'2024-06-23',32,0,0),(147,'2024-06-19',33,0,0),(148,'2024-06-19',34,0,0),(149,'2024-06-19',35,0,0),(150,'2024-06-19',36,0,0),(151,'2024-06-19',37,0,0),(152,'2024-06-19',38,0,0),(153,'2024-06-19',39,0,0),(154,'2024-06-21',33,0,0),(155,'2024-06-21',34,0,0),(156,'2024-06-21',35,0,0),(157,'2024-06-21',36,0,0),(158,'2024-06-21',37,0,0),(159,'2024-06-21',38,0,0),(160,'2024-06-21',39,0,0),(161,'2024-06-17',33,0,0),(162,'2024-06-18',33,0,0),(163,'2024-06-20',33,0,0),(164,'2024-06-17',34,0,0),(165,'2024-06-18',34,0,0),(166,'2024-06-20',34,0,0),(167,'2024-06-17',35,0,0),(168,'2024-06-18',35,0,0),(169,'2024-06-20',36,0,0),(170,'2024-06-20',35,0,0),(171,'2024-06-22',35,0,0),(172,'2024-06-23',35,0,0),(173,'2024-06-17',36,0,0),(174,'2024-06-18',36,0,0),(175,'2024-06-22',36,0,0),(176,'2024-06-23',36,0,0),(177,'2024-06-17',37,0,0),(178,'2024-06-18',37,0,0),(179,'2024-06-20',37,0,0),(180,'2024-06-22',37,0,0),(181,'2024-06-23',37,0,0),(182,'2024-06-17',38,0,0),(183,'2024-06-18',38,0,0),(184,'2024-06-20',38,0,0),(185,'2024-06-17',39,0,0),(186,'2024-06-18',39,0,0),(187,'2024-06-20',39,0,0),(188,'2024-06-18',25,0,0),(189,'2024-06-18',26,0,0),(190,'2024-06-18',27,0,0),(191,'2024-06-18',28,0,0),(192,'2024-06-18',29,0,0),(193,'2024-06-18',30,0,0),(194,'2024-06-17',25,0,0),(195,'2024-06-17',26,0,0),(196,'2024-06-17',27,0,0),(197,'2024-06-17',28,0,0),(198,'2024-06-17',29,0,0),(199,'2024-06-17',30,0,0),(200,'2024-06-19',29,0,0),(201,'2024-06-20',29,0,0),(202,'2024-06-21',29,0,0),(203,'2024-06-22',29,0,0),(204,'2024-06-23',29,0,0),(205,'2024-06-21',25,0,0),(206,'2024-06-21',27,0,1),(207,'2024-06-21',28,0,0),(208,'2024-06-21',30,0,0),(209,'2024-06-19',27,0,0),(210,'2024-06-20',27,0,0),(211,'2024-06-22',27,0,0),(212,'2024-06-23',27,0,0),(213,'2024-06-24',28,0,0),(214,'2024-06-25',28,0,0),(215,'2024-06-26',28,0,0),(216,'2024-06-27',28,0,0),(217,'2024-06-28',28,0,0),(218,'2024-06-29',28,0,0),(219,'2024-06-30',28,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmsapp_task`
--

LOCK TABLES `pmsapp_task` WRITE;
/*!40000 ALTER TABLE `pmsapp_task` DISABLE KEYS */;
INSERT INTO `pmsapp_task` VALUES (30,'╨Я╨╛╨┤╨┤╨╡╤А╨╢╨║╨░ ╤Б╨╡╤А╨▓╨╡╤А╨╛╨▓','╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ ╨▒╨╡╤Б╨┐╨╡╤А╨╡╨▒╨╛╨╣╨╜╨╛╨╣ ╤А╨░╨▒╨╛╤В╤Л ╤Б╨╡╤А╨▓╨╡╤А╨╛╨▓, ╨╝╨╛╨╜╨╕╤В╨╛╤А╨╕╨╜╨│ ╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╤Б╨╕╤Б╤В╨╡╨╝ ╨▓ ╨╛╤З╨╡╨╜╤М ╨▓╨░╨╢╨╜╤Л╨╣ ╨┤╨╡╨╜╤М.','2024-06-21',0,NULL,22,'╨Ф╨╛ ╤Б╨╕╤Е ╨┐╨╛╤А ╨▒╨╛╨╗╤М╤И╨╕╨╡ ╤В╤А╤Г╨┤╨╜╨╛╤Б╤В╨╕ ╨▓ ╨┐╨╡╤А╨╡╨┤╨░╤З╨╡ ╨┐╨░╨║╨╡╤В╨╛╨▓ ╨┤╨░╨╜╨╜╤Л╤Е!','rejected','work_time'),(31,'╨в╨╡╤Б╤В╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨Я╨Ю','╨Я╤А╨╛╨▓╨╡╨┤╨╡╨╜╨╕╨╡ ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨░╨╜╨╕╤П ╨╜╨╛╨▓╤Л╤Е ╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤Л╤Е ╨┐╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╣ ╨┤╨╗╤П ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╤П ╨╕╤Е ╤А╨░╨▒╨╛╤В╨╛╤Б╨┐╨╛╤Б╨╛╨▒╨╜╨╛╤Б╤В╨╕.','2024-06-21',0,NULL,24,'','accepted','after_hours'),(32,'╨б╨▒╨╛╤А ╤Б╤В╨░╤В╨╕╤Б╤В╨╕╨║╨╕ ╨╕ ╨░╨║╤В╤Г╨░╨╗╤М╨╜╤Л╤Е ╨┤╨░╨╜╨╜╤Л╤Е','╨б╨╛╨╖╨┤╨░╨╜╨╕╨╡ ╨┤╨╕╨░╨│╤А╨░╨╝╨╝, ╨│╤А╨░╤Д╨╕╨║╨╛╨▓ ╨╕ ╨┤╤А╤Г╨│╨╕╤Е ╨▓╨╕╨╖╤Г╨░╨╗╨╕╨╖╨░╤Ж╨╕╨╣ ╨┤╨╗╤П ╨╜╨░╨│╨╗╤П╨┤╨╜╨╛╨│╨╛ ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╗╨╡╨╜╨╕╤П ╤А╨╡╨╖╤Г╨╗╤М╤В╨░╤В╨╛╨▓ ╨░╨╜╨░╨╗╨╕╨╖╨░ ╨╝╨╛╤В╨╕╨▓╨░╤Ж╨╕╨╕ ╤Г╤З╨░╤Й╨╕╤Е╤Б╤П.','2024-06-18',0,NULL,21,NULL,'pending','work_time'),(33,'╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨╛╤В╤З╨╡╤В╨╛╨▓','╨б╨╛╨╖╨┤╨░╨╜╨╕╨╡ ╨╛╤В╤З╨╡╤В╨╛╨▓ ╨┤╨╗╤П ╤А╤Г╨║╨╛╨▓╨╛╨┤╤Б╤В╨▓╨░ ╤Б ╨▓╤Л╨▓╨╛╨┤╨░╨╝╨╕ ╨╕ ╤А╨╡╨║╨╛╨╝╨╡╨╜╨┤╨░╤Ж╨╕╤П╨╝╨╕ ╨╜╨░ ╨╛╤Б╨╜╨╛╨▓╨╡ ╨░╨╜╨░╨╗╨╕╨╖╨░ ╨┤╨░╨╜╨╜╤Л╤Е ╨┐╨╛ ╨┐╨╛╤Б╨╗╨╡╨┤╨╜╨╕╨╝ ╨┐╨╛╤Е╨╛╨┤╨░╨╝ ╨▓ ╤В╤Г╨░╨╗╨╡╤В.','2024-06-19',0,NULL,21,NULL,'pending','work_time'),(34,'╨б╨▒╨╛╤А ╨╕ ╨╛╨▒╤А╨░╨▒╨╛╤В╨║╨░ ╨┤╨░╨╜╨╜╤Л╤Е','╨б╨▒╨╛╤А ╨┤╨░╨╜╨╜╤Л╤Е ╨╕╨╖ ╤А╨░╨╖╨╗╨╕╤З╨╜╤Л╤Е ╨┐╨░╨▒╨╗╨╕╨║╨╛╨▓, ╨╕╤Е ╨╛╤З╨╕╤Б╤В╨║╨░ ╨╕ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨║ ╨░╨╜╨░╨╗╨╕╨╖╤Г.','2024-06-17',0,NULL,21,NULL,'pending','work_time'),(35,'╨а╨░╨╖╤А╨░╨▒╨╛╤В╨║╨░ ╨╕ ╨╛╨┐╤В╨╕╨╝╨╕╨╖╨░╤Ж╨╕╤П ╨╝╨╡╤В╤А╨╕╨║','╨Ю╨┐╤А╨╡╨┤╨╡╨╗╨╡╨╜╨╕╨╡ ╨║╨╗╤О╤З╨╡╨▓╤Л╤Е ╨┐╨╛╨║╨░╨╖╨░╤В╨╡╨╗╨╡╨╣ ╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛╤Б╤В╨╕ (KPI) ╨╕ ╤А╨░╨╖╤А╨░╨▒╨╛╤В╨║╨░ ╨╝╨╡╤В╨╛╨┤╨╛╨▓ ╨╕╤Е ╨╝╨╛╨╜╨╕╤В╨╛╤А╨╕╨╜╨│╨░ ╨╕ ╨░╨╜╨░╨╗╨╕╨╖╨░.','2024-06-20',0,NULL,21,NULL,'pending','work_time'),(36,'╨Р╨╜╨░╨╗╨╕╨╖ ╨┤╨░╨╜╨╜╤Л╤Е','╨Я╤А╨╛╨▓╨╡╨┤╨╡╨╜╨╕╨╡ ╤Б╤В╨░╤В╨╕╤Б╤В╨╕╤З╨╡╤Б╨║╨╛╨│╨╛ ╨╕ ╨║╨╛╨╗╨╕╤З╨╡╤Б╤В╨▓╨╡╨╜╨╜╨╛╨│╨╛ ╨░╨╜╨░╨╗╨╕╨╖╨░ ╨┤╨░╨╜╨╜╤Л╤Е ╨┤╨╗╤П ╨▓╤Л╤П╨▓╨╗╨╡╨╜╨╕╤П ╤В╨╡╨╜╨┤╨╡╨╜╤Ж╨╕╨╣ ╨╕ ╨╖╨░╨║╨╛╨╜╨╛╨╝╨╡╤А╨╜╨╛╤Б╤В╨╡╨╣ ╨┐╨╛╤Е╨╛╨┤╨╛╨▓ ╨▓ \"╨║╤Г╤А╨╕╨╗╨║╤Г\"','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(37,'╨г╨┐╤А╨░╨▓╨╗╨╡╨╜╨╕╨╡ ╤Г╤З╨╡╤В╨╜╤Л╨╝╨╕ ╨╖╨░╨┐╨╕╤Б╤П╨╝╨╕','╨б╨╛╨╖╨┤╨░╨╜╨╕╨╡ ╨╕ ╤Г╨┐╤А╨░╨▓╨╗╨╡╨╜╨╕╨╡ ╤Г╤З╨╡╤В╨╜╤Л╨╝╨╕ ╨╖╨░╨┐╨╕╤Б╤П╨╝╨╕ ╨╜╨╛╨▓╤Л╤Е ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╨╡╨╣ ╨┐╤А╨╕╨╡╤Е╨░╨▓╤И╨╕╤Е ╤Б╨╡╨│╨╛╨┤╨╜╤П.','2024-06-17',0,NULL,22,NULL,'pending','work_time'),(38,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,32,NULL,'pending','work_time'),(39,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,33,NULL,'pending','work_time'),(40,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,34,NULL,'pending','work_time'),(41,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,35,NULL,'pending','work_time'),(42,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,36,NULL,'pending','work_time'),(43,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,37,NULL,'pending','work_time'),(44,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,38,NULL,'pending','work_time'),(45,'╨Т╤Б╨╡╨╛╨▒╤Й╨░╤П ╨╕╨╜╨▓╨╡╨╜╤В╨░╤А╨╕╨╖╨░╤Ж╨╕╤П','╨Ф╨╗╤П ╤Г╤Б╨┐╨╡╤Е╨░ ╨║╨╗╨░╨┤╨╛╨▓╤Й╨╕╨║╨░, ╨╜╨░╨╝ ╤В╤А╨╡╨▒╤Г╤О╤В╤Б╤П ╨▓╤Б╨╡ ╤Г╤Б╨╕╨╗╨╕╤П ╨▓╤Б╨╡╤Е ╤А╨░╨▒╨╛╤В╨╜╨╕╨║╨╛╨▓.','2024-06-19',0,NULL,39,NULL,'pending','work_time'),(46,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,32,NULL,'pending','work_time'),(47,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,33,NULL,'pending','work_time'),(48,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,34,NULL,'pending','work_time'),(49,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,35,NULL,'pending','work_time'),(50,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,36,NULL,'pending','work_time'),(51,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,37,NULL,'pending','work_time'),(52,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,38,NULL,'pending','work_time'),(53,'╨Ч╨░╨║╨░╨╖ ╨╛╤В ╤Б╨╕╤А╨╛╤В','╨Ъ ╨╜╨░╨╝ ╨┐╤А╨╕╨╡╨╖╨╢╨░╤О╤В ╤Б╨╕╤А╨╛╤В╤Л ╨╕ ╨╝╤Л ╨┤╨╛╨╗╨╢╨╜╤Л ╨┐╨╛╨║╨░╨╖╨░╤В╤М ╨╝╨░╤Б╤В╨╡╤А-╨║╨╗╨░╤Б╤Б, ╤А╨░╨▒╨╛╤В╨░╨╡╨╝ ╤В╨╛╨╗╤М╨║╨╛ ╨╜╨░ ╨╜╨╕╤Е.','2024-06-21',0,NULL,39,NULL,'pending','work_time'),(54,'╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨╕╨╜╨│╤А╨╡╨┤╨╕╨╡╨╜╤В╨╛╨▓','╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨╕ ╨╜╨░╤А╨╡╨╖╨░╤В╤М ╨▓╤Б╨╡ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╤Л╨╡ ╨╕╨╜╨│╤А╨╡╨┤╨╕╨╡╨╜╤В╤Л ╨┤╨╗╤П ╨▒╨╗╤О╨┤, ╨╖╨░╨┐╨╗╨░╨╜╨╕╤А╨╛╨▓╨░╨╜╨╜╤Л╤Е ╨╜╨░ ╨▓╨╡╤З╨╡╤А╨╜╨╡╨╡ ╨╝╨╡╨╜╤О.','2024-06-17',0,NULL,33,NULL,'pending','work_time'),(55,'╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╨╛╤Б╨╜╨╛╨▓╨╜╤Л╤Е ╨▒╨╗╤О╨┤','╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨│╨╛╤А╤П╤З╨╕╨╡ ╨▒╨╗╤О╨┤╨░ ╨┤╨╗╤П ╨╛╨▒╨╡╨┤╨░ ╨┐╨╛ ╤Г╤Б╤В╨░╨╜╨╛╨▓╨╗╨╡╨╜╨╜╤Л╨╝ ╤А╨╡╤Ж╨╡╨┐╤В╨░╨╝ ╨╕ ╤Б╤В╨░╨╜╨┤╨░╤А╤В╨░╨╝.','2024-06-18',0,NULL,33,NULL,'pending','work_time'),(56,'╨з╨╕╤Б╤В╨╛╤В╨░ ╤А╨░╨▒╨╛╤З╨╡╨│╨╛ ╨╝╨╡╤Б╤В╨░','╨Я╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╤В╤М ╤А╨░╨▒╨╛╤З╨╡╨╡ ╨╝╨╡╤Б╤В╨╛ ╨▓ ╤З╨╕╤Б╤В╨╛╤В╨╡, ╨┐╤А╨╛╨▓╨╛╨┤╨╕╤В╤М ╤Г╨▒╨╛╤А╨║╤Г ╨╕ ╨┤╨╡╨╖╨╕╨╜╤Д╨╡╨║╤Ж╨╕╤О ╨┐╨╛ ╨╝╨╡╤А╨╡ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛╤Б╤В╨╕.','2024-06-20',0,NULL,33,NULL,'pending','work_time'),(57,'╨Я╤А╨╛╨▓╨╡╤А╨║╨░ ╤Б╨▓╨╡╨╢╨╡╤Б╤В╨╕ ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨┐╤А╨╛╨▓╨╡╤А╨║╤Г ╤Б╨▓╨╡╨╢╨╡╤Б╤В╨╕ ╨╕ ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨▓╤Б╨╡╤Е ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓, ╨┐╨╛╤Б╤В╤Г╨┐╨╕╨▓╤И╨╕╤Е ╨╜╨░ ╨║╤Г╤Е╨╜╤О, ╨╕ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╤В╤М ╨╕╤Е ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╨╛╨╡ ╤Е╤А╨░╨╜╨╡╨╜╨╕╨╡.','2024-06-17',0,NULL,32,NULL,'pending','work_time'),(58,'╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨║ ╨╛╨▒╨╡╨┤╤Г','╨Ю╨▒╨╡╤Б╨┐╨╡╤З╨╕╤В╤М ╤Б╨▓╨╛╨╡╨▓╤А╨╡╨╝╨╡╨╜╨╜╤Г╤О ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨▓╤Б╨╡╤Е ╨╕╨╜╨│╤А╨╡╨┤╨╕╨╡╨╜╤В╨╛╨▓ ╨┤╨╗╤П ╨│╨╛╤А╤П╤З╨╕╤Е ╨╕ ╤Е╨╛╨╗╨╛╨┤╨╜╤Л╤Е ╨▒╨╗╤О╨┤, ╨║╨╛╤В╨╛╤А╤Л╨╡ ╨▒╤Г╨┤╤Г╤В ╨┐╨╛╨┤╨░╨▓╨░╤В╤М╤Б╤П ╨╜╨░ ╨╛╨▒╨╡╨┤.','2024-06-18',0,NULL,32,NULL,'pending','work_time'),(59,'╨Ъ╨╛╨╛╤А╨┤╨╕╨╜╨░╤Ж╨╕╤П ╤А╨░╨▒╨╛╤В╤Л ╨║╨╛╨╝╨░╨╜╨┤╤Л','╨а╨░╤Б╨┐╤А╨╡╨┤╨╡╨╗╨╕╤В╤М ╨╖╨░╨┤╨░╤З╨╕ ╤Б╤А╨╡╨┤╨╕ ╨║╤Г╤Е╨╛╨╜╨╜╨╛╨│╨╛ ╨┐╨╡╤А╤Б╨╛╨╜╨░╨╗╨░ ╨╜╨░ ╤В╨╡╨║╤Г╤Й╨╕╨╣ ╨┤╨╡╨╜╤М ╨╕ ╨║╨╛╨╜╤В╤А╨╛╨╗╨╕╤А╨╛╨▓╨░╤В╤М ╨╕╤Е ╨▓╤Л╨┐╨╛╨╗╨╜╨╡╨╜╨╕╨╡.','2024-06-20',0,NULL,32,NULL,'pending','work_time'),(60,'╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╤Б╨░╨╗╨░╤В╨╛╨▓ ╨╕ ╨╖╨░╨║╤Г╤Б╨╛╨║','╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╤Е╨╛╨╗╨╛╨┤╨╜╤Л╨╡ ╨▒╨╗╤О╨┤╨░, ╤В╨░╨║╨╕╨╡ ╨║╨░╨║ ╤Б╨░╨╗╨░╤В╤Л ╨╕ ╨╖╨░╨║╤Г╤Б╨║╨╕, ╨┤╨╗╤П ╨╛╨▒╨╡╨┤╨░.','2024-06-17',0,NULL,34,NULL,'pending','work_time'),(61,'╨Ю╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨▒╨╗╤О╨┤','╨н╤Б╤В╨╡╤В╨╕╤З╨╡╤Б╨║╨╕ ╨╛╤Д╨╛╤А╨╝╨╕╤В╤М ╨│╨╛╤В╨╛╨▓╤Л╨╡ ╤Е╨╛╨╗╨╛╨┤╨╜╤Л╨╡ ╨▒╨╗╤О╨┤╨░ ╨┐╨╡╤А╨╡╨┤ ╨╕╤Е ╨┐╨╛╨┤╨░╤З╨╡╨╣.','2024-06-18',0,NULL,34,NULL,'pending','work_time'),(62,'╨Ъ╨╛╨╜╤В╤А╨╛╨╗╤М ╤Б╨▓╨╡╨╢╨╡╤Б╤В╨╕ ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓','╨Я╤А╨╛╨▓╨╡╤А╨╕╤В╤М ╤Б╨▓╨╡╨╢╨╡╤Б╤В╤М ╨╕ ╨║╨░╤З╨╡╤Б╤В╨▓╨╛ ╨╕╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╨╝╤Л╤Е ╨┐╤А╨╛╨┤╤Г╨║╤В╨╛╨▓, ╤Б╨▓╨╛╨╡╨▓╤А╨╡╨╝╨╡╨╜╨╜╨╛ ╤Г╨▒╤А╨░╤В╤М ╨╕ ╨╖╨░╨╝╨╡╨╜╨╕╤В╤М ╨┐╤А╨╛╨┤╤Г╨║╤В╤Л ╤Б ╨╕╤Б╤В╨╡╨║╨░╤О╤Й╨╕╨╝ ╤Б╤А╨╛╨║╨╛╨╝ ╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕.','2024-06-20',0,NULL,34,NULL,'pending','work_time'),(63,'╨Т╤Л╨┐╨╡╤З╨║╨░ ╤Е╨╗╨╡╨▒╨╛╨▒╤Г╨╗╨╛╤З╨╜╤Л╤Е ╨╕╨╖╨┤╨╡╨╗╨╕╨╣','╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨╕ ╨▓╤Л╨┐╨╡╤З╤М ╤Е╨╗╨╡╨▒, ╨▒╤Г╨╗╨╛╤З╨║╨╕ ╨╕ ╨┐╨╕╤А╨╛╨│╨╕ ╨┤╨╗╤П ╤Г╤В╤А╨╡╨╜╨╜╨╡╨│╨╛ ╨╕ ╨╛╨▒╨╡╨┤╨╡╨╜╨╜╨╛╨│╨╛ ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╤П.','2024-06-17',0,NULL,35,NULL,'pending','work_time'),(64,'╨Ч╨░╨╝╨╡╤И╨╕╨▓╨░╨╜╨╕╨╡ ╤В╨╡╤Б╤В╨░','╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨╕ ╨╖╨░╨╝╨╡╤Б╨╕╤В╤М ╤В╨╡╤Б╤В╨╛ ╨┤╨╗╤П ╤А╨░╨╖╨╗╨╕╤З╨╜╤Л╤Е ╨▓╨╕╨┤╨╛╨▓ ╨▓╤Л╨┐╨╡╤З╨║╨╕ ╨╜╨░ ╤Б╨╗╨╡╨┤╤Г╤О╤Й╨╕╨╣ ╨┤╨╡╨╜╤М.','2024-06-18',0,NULL,35,NULL,'pending','work_time'),(65,'╨Ъ╨╛╨╜╤В╤А╨╛╨╗╤М ╨▓╤Л╨┐╨╡╨║╨░╨╜╨╕╤П','╨б╨╗╨╡╨┤╨╕╤В╤М ╨╖╨░ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╨╝ ╨▓╤Л╨┐╨╡╨║╨░╨╜╨╕╤П, ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╤В╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Г╤О ╤В╨╡╨╝╨┐╨╡╤А╨░╤В╤Г╤А╤Г ╨╕ ╨▓╤А╨╡╨╝╤П ╨▓╤Л╨┐╨╡╨║╨░╨╜╨╕╤П ╨┤╨╗╤П ╨║╨░╨╢╨┤╨╛╨│╨╛ ╨╕╨╖╨┤╨╡╨╗╨╕╤П.','2024-06-20',0,NULL,36,NULL,'pending','work_time'),(66,'╨Т╤Л╨┐╨╡╤З╨║╨░ ╤Е╨╗╨╡╨▒╨╛╨▒╤Г╨╗╨╛╤З╨╜╤Л╤Е ╨╕╨╖╨┤╨╡╨╗╨╕╨╣','╨Я╤А╨╕╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨╕ ╨▓╤Л╨┐╨╡╤З╤М ╤Е╨╗╨╡╨▒, ╨▒╤Г╨╗╨╛╤З╨║╨╕ ╨╕ ╨┐╨╕╤А╨╛╨│╨╕ ╨┤╨╗╤П ╤Г╤В╤А╨╡╨╜╨╜╨╡╨│╨╛ ╨╕ ╨╛╨▒╨╡╨┤╨╡╨╜╨╜╨╛╨│╨╛ ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╤П.','2024-06-20',0,NULL,35,NULL,'pending','work_time'),(67,'╨Ъ╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╕ ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨╕╨╜╨┤╨╕╨▓╨╕╨┤╤Г╨░╨╗╤М╨╜╤Л╨╡ ╨║╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╕ ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨┐╨╛ ╨▓╨╛╨┐╤А╨╛╤Б╨░╨╝ ╨┐╨╕╤В╨░╨╜╨╕╤П ╨╕ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨│╨╛ ╨╛╨▒╤А╨░╨╖╨░ ╨╢╨╕╨╖╨╜╨╕.','2024-06-17',0,NULL,36,NULL,'pending','work_time'),(68,'╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨╝╨░╤В╨╡╤А╨╕╨░╨╗╨╛╨▓','╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╤Л╨╡ ╨╝╨░╤В╨╡╤А╨╕╨░╨╗╤Л ╨╕ ╨╕╨╜╤Д╨╛╤А╨╝╨░╤Ж╨╕╨╛╨╜╨╜╤Л╨╡ ╨╗╨╕╤Б╤В╨╛╨▓╨║╨╕ ╨╛ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨╝ ╨┐╨╕╤В╨░╨╜╨╕╨╕ ╨┤╨╗╤П ╤А╨░╨╖╨╝╨╡╤Й╨╡╨╜╨╕╤П ╨▓ ╤Б╤В╨╛╨╗╨╛╨▓╨╛╨╣.','2024-06-18',0,NULL,36,NULL,'pending','work_time'),(69,'╨Ю╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╤Б╤В╨╛╨╗╨╕╨║╨╛╨▓','╨Я╤А╨╕╨╜╤П╤В╤М ╨╖╨░╨║╨░╨╖╤Л ╤Г ╨┐╨╛╤Б╨╡╤В╨╕╤В╨╡╨╗╨╡╨╣, ╨┐╨╛╨┤╨░╤В╤М ╨▒╨╗╤О╨┤╨░ ╨╕ ╨╜╨░╨┐╨╕╤В╨║╨╕, ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╤В╤М ╨▓╤Л╤Б╨╛╨║╨╕╨╣ ╤Г╤А╨╛╨▓╨╡╨╜╤М ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╤П.','2024-06-17',0,NULL,37,NULL,'pending','work_time'),(70,'╨Я╨╛╨┤╨┤╨╡╤А╨╢╨░╨╜╨╕╨╡ ╤З╨╕╤Б╤В╨╛╤В╤Л','╨г╨▒╨╕╤А╨░╤В╤М ╤Б╤В╨╛╨╗╤Л ╨┐╨╛╤Б╨╗╨╡ ╤Г╤Е╨╛╨┤╨░ ╨┐╨╛╤Б╨╡╤В╨╕╤В╨╡╨╗╨╡╨╣, ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╤В╤М ╤З╨╕╤Б╤В╨╛╤В╤Г ╨▓ ╨╖╨░╨╗╨╡.','2024-06-18',0,NULL,37,NULL,'pending','work_time'),(71,'╨Ъ╨╛╨╜╤Б╤Г╨╗╤М╤В╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨┐╨╛ ╨╝╨╡╨╜╤О','╨Я╨╛╨╝╨╛╨│╨░╤В╤М ╨┐╨╛╤Б╨╡╤В╨╕╤В╨╡╨╗╤П╨╝ ╤Б ╨▓╤Л╨▒╨╛╤А╨╛╨╝ ╨▒╨╗╤О╨┤, ╨╛╤В╨▓╨╡╤З╨░╤В╤М ╨╜╨░ ╨▓╨╛╨┐╤А╨╛╤Б╤Л ╨┐╨╛ ╨╝╨╡╨╜╤О ╨╕ ╨┐╤А╨╡╨┤╨╗╨░╨│╨░╤В╤М ╤А╨╡╨║╨╛╨╝╨╡╨╜╨┤╨░╤Ж╨╕╨╕.','2024-06-20',0,NULL,37,NULL,'pending','work_time'),(72,'╨а╨░╨╖╤А╨░╨▒╨╛╤В╨║╨░ ╨╜╨╛╨▓╨╛╨│╨╛ ╨╝╨╡╨╜╤О ╨╜╨░ ╨╜╨╡╨┤╨╡╨╗╤О','╨б╨╛╤Б╤В╨░╨▓╨╕╤В╤М ╤А╨░╨╖╨╜╨╛╨╛╨▒╤А╨░╨╖╨╜╨╛╨╡ ╨╕ ╤Б╨▒╨░╨╗╨░╨╜╤Б╨╕╤А╨╛╨▓╨░╨╜╨╜╨╛╨╡ ╨╝╨╡╨╜╤О ╨╜╨░ ╨┐╤А╨╡╨┤╤Б╤В╨╛╤П╤Й╤Г╤О ╨╜╨╡╨┤╨╡╨╗╤О, ╤Г╤З╨╕╤В╤Л╨▓╨░╤П ╤Б╨╡╨╖╨╛╨╜╨╜╤Л╨╡ ╨┐╤А╨╛╨┤╤Г╨║╤В╤Л ╨╕ ╨┤╨╕╨╡╤В╨╕╤З╨╡╤Б╨║╨╕╨╡ ╨┐╨╛╤В╤А╨╡╨▒╨╜╨╛╤Б╤В╨╕ ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓.','2024-06-17',0,NULL,38,NULL,'pending','work_time'),(73,'╨Ъ╨╛╨╜╤В╤А╨╛╨╗╤М ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨▒╨╗╤О╨┤','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨┐╤А╨╛╨▓╨╡╤А╨║╤Г ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨╕ ╨▓╨║╤Г╤Б╨╛╨▓╤Л╤Е ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║ ╨▒╨╗╤О╨┤, ╨│╨╛╤В╨╛╨▓╤П╤Й╨╕╤Е╤Б╤П ╨╜╨░ ╨╛╨▒╨╡╨┤, ╨╕ ╨▓╨╜╨╡╤Б╤В╨╕ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╤Л╨╡ ╨║╨╛╤А╤А╨╡╨║╤В╨╕╨▓╤Л.','2024-06-18',0,NULL,38,NULL,'pending','work_time'),(74,'╨Ю╨▒╤Г╤З╨╡╨╜╨╕╨╡ ╨┐╨╡╤А╤Б╨╛╨╜╨░╨╗╨░','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨╛╨▒╤Г╤З╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╨╜╨╛╨▓╤Л╤Е ╤Б╨╛╤В╤А╤Г╨┤╨╜╨╕╨║╨╛╨▓ ╨┐╨╛ ╤Б╤В╨░╨╜╨┤╨░╤А╤В╨░╨╝ ╨┐╤А╨╕╨│╨╛╤В╨╛╨▓╨╗╨╡╨╜╨╕╤П ╨╕ ╨┐╤А╨╡╨╖╨╡╨╜╤В╨░╤Ж╨╕╨╕ ╨▒╨╗╤О╨┤.','2024-06-20',0,NULL,38,NULL,'pending','work_time'),(75,'╨Ъ╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╕ ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨╕╨╜╨┤╨╕╨▓╨╕╨┤╤Г╨░╨╗╤М╨╜╤Л╨╡ ╨║╨╛╨╜╤Б╤Г╨╗╤М╤В╨░╤Ж╨╕╨╕ ╨┤╨╗╤П ╤Б╤В╤Г╨┤╨╡╨╜╤В╨╛╨▓ ╨┐╨╛ ╨▓╨╛╨┐╤А╨╛╤Б╨░╨╝ ╨┐╨╕╤В╨░╨╜╨╕╤П ╨╕ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨│╨╛ ╨╛╨▒╤А╨░╨╖╨░ ╨╢╨╕╨╖╨╜╨╕.','2024-06-17',0,NULL,39,NULL,'pending','work_time'),(76,'╨Р╨╜╨░╨╗╨╕╨╖ ╨╝╨╡╨╜╤О','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨░╨╜╨░╨╗╨╕╨╖ ╤В╨╡╨║╤Г╤Й╨╡╨│╨╛ ╨╝╨╡╨╜╤О ╨╜╨░ ╤Б╨╛╨┤╨╡╤А╨╢╨░╨╜╨╕╨╡ ╨┐╨╕╤В╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨▓╨╡╤Й╨╡╤Б╤В╨▓ ╨╕ ╨┐╤А╨╡╨┤╨╗╨╛╨╢╨╕╤В╤М ╨╕╨╖╨╝╨╡╨╜╨╡╨╜╨╕╤П ╨┤╨╗╤П ╤Г╨╗╤Г╤З╤И╨╡╨╜╨╕╤П ╨╡╨│╨╛ ╤Б╨▒╨░╨╗╨░╨╜╤Б╨╕╤А╨╛╨▓╨░╨╜╨╜╨╛╤Б╤В╨╕.','2024-06-18',0,NULL,39,NULL,'pending','work_time'),(77,'╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╨░ ╨╝╨░╤В╨╡╤А╨╕╨░╨╗╨╛╨▓','╨Я╨╛╨┤╨│╨╛╤В╨╛╨▓╨╕╤В╤М ╨╛╨▒╤А╨░╨╖╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╤Л╨╡ ╨╝╨░╤В╨╡╤А╨╕╨░╨╗╤Л ╨╕ ╨╕╨╜╤Д╨╛╤А╨╝╨░╤Ж╨╕╨╛╨╜╨╜╤Л╨╡ ╨╗╨╕╤Б╤В╨╛╨▓╨║╨╕ ╨╛ ╨╖╨┤╨╛╤А╨╛╨▓╨╛╨╝ ╨┐╨╕╤В╨░╨╜╨╕╨╕ ╨┤╨╗╤П ╤А╨░╨╖╨╝╨╡╤Й╨╡╨╜╨╕╤П ╨▓ ╤Б╤В╨╛╨╗╨╛╨▓╨╛╨╣.','2024-06-20',0,NULL,39,NULL,'pending','work_time'),(78,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,21,NULL,'pending','after_hours'),(79,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,22,NULL,'pending','after_hours'),(80,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,24,NULL,'pending','after_hours'),(81,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,25,NULL,'pending','after_hours'),(82,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,26,NULL,'pending','after_hours'),(83,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,27,NULL,'pending','after_hours'),(84,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,28,NULL,'pending','after_hours'),(85,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,29,NULL,'pending','after_hours'),(86,'╨Ь╨╕╤В╨╕╨╜╨│ ╨▓ ╨Ф╨╕╤Б╨║╨╛╤А╨┤','╨Ю╨▒╤Б╤Г╨╢╨┤╨╡╨╜╨╕╨╡ ╨╛╨▒╤Й╨╕╤Е ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╨╝╨╡╨╢╨┤╤Г ╨╛╤В╨┤╨╡╨╗╨░╨╝╨╕','2024-06-18',0,NULL,30,NULL,'pending','after_hours'),(87,'╨Я╤А╨╛╤Б╨╗╤Г╤И╨░╨╣╤В╨╡ ╨▓╤Б╨╡ ╨У╨б ╨╛╤В ╨╜╨░╤З╨░╨╗╤М╨╜╨╕╨║╨░','╨а╨░╨▒╨╛╤В╨░ ╨┐╨╛╨┤╨╛╨╢╨┤╤С╤В ╨▒╤Г╨┤╤Г╤Й╨░╤П ╨╖╨░╤А╨┐╨╗╨░╤В╨░ ╨┐╨╛╨┤ ╤Г╨│╤А╨╛╨╖╨╛╨╣, ╨┐╤А╨╛╤Б╨╗╤Г╤И╨░╨╣╤В╨╡ ╨╕╨╜╤Д╨╛╤А╨╝╨░╤Ж╨╕╤О','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(88,'╨Ю╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╤Б╨╡╤А╨▓╨╡╤А╨╛╨▓','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╕╨╡ ╨╛╨┐╨╡╤А╨░╤Ж╨╕╨╛╨╜╨╜╤Л╤Е ╤Б╨╕╤Б╤В╨╡╨╝ ╨╜╨░ ╨▓╤Б╨╡╤Е ╤Б╨╡╤А╨▓╨╡╤А╨░╤Е. ╨г╤Б╤В╨░╨╜╨╛╨▓╨╕╤В╤М ╨┐╨╛╤Б╨╗╨╡╨┤╨╜╨╕╨╡ ╨┐╨░╤В╤З╨╕ ╨▒╨╡╨╖╨╛╨┐╨░╤Б╨╜╨╛╤Б╤В╨╕ ╨╕ ╨╛╨▒╨╜╨╛╨▓╨╗╨╡╨╜╨╕╤П ╨┐╤А╨╛╨│╤А╨░╨╝╨╝╨╜╨╛╨│╨╛ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╤П.','2024-06-19',0,NULL,22,NULL,'pending','work_time'),(89,'╨а╨╡╨╖╨╡╤А╨▓╨╜╨╛╨╡ ╨║╨╛╨┐╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨┤╨░╨╜╨╜╤Л╤Е','╨Т╤Л╨┐╨╛╨╗╨╜╨╕╤В╤М ╨┐╨╗╨░╨╜╨╛╨▓╨╛╨╡ ╤А╨╡╨╖╨╡╤А╨▓╨╜╨╛╨╡ ╨║╨╛╨┐╨╕╤А╨╛╨▓╨░╨╜╨╕╨╡ ╨║╤А╨╕╤В╨╕╤З╨╡╤Б╨║╨╕ ╨▓╨░╨╢╨╜╤Л╤Е ╨┤╨░╨╜╨╜╤Л╤Е. ╨Я╤А╨╛╨▓╨╡╤А╨╕╤В╤М ╤Ж╨╡╨╗╨╛╤Б╤В╨╜╨╛╤Б╤В╤М ╨╕ ╨┤╨╛╤Б╤В╤Г╨┐╨╜╨╛╤Б╤В╤М ╤А╨╡╨╖╨╡╤А╨▓╨╜╤Л╤Е ╨║╨╛╨┐╨╕╨╣.','2024-06-20',0,NULL,22,NULL,'pending','work_time'),(90,'╨Ь╨╛╨╜╨╕╤В╨╛╤А╨╕╨╜╨│ ╤Б╨╡╤В╨╡╨▓╨╛╨╣ ╨░╨║╤В╨╕╨▓╨╜╨╛╤Б╤В╨╕','╨Я╤А╨╛╨▓╨╡╤Б╤В╨╕ ╨░╨╜╨░╨╗╨╕╨╖ ╤В╨╡╨║╤Г╤Й╨╡╨╣ ╤Б╨╡╤В╨╡╨▓╨╛╨╣ ╨░╨║╤В╨╕╨▓╨╜╨╛╤Б╤В╨╕ ╨╜╨░ ╨┐╤А╨╡╨┤╨╝╨╡╤В ╨┐╨╛╨┤╨╛╨╖╤А╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╨┤╨╡╨╣╤Б╤В╨▓╨╕╨╣ ╨╕╨╗╨╕ ╨░╨╜╨╛╨╝╨░╨╗╨╕╨╣. ╨Я╤А╨╛╨▓╨╡╤А╨╕╤В╤М ╤Б╨╛╤Б╤В╨╛╤П╨╜╨╕╨╡ ╤Б╨╡╤В╨╡╨▓╤Л╤Е ╤Г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓ ╨╕ ╨╕╤Е ╨╗╨╛╨│-╤Д╨░╨╣╨╗╤Л.','2024-06-21',0,NULL,22,NULL,'pending','work_time'),(91,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,21,NULL,'pending','after_hours'),(92,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,22,NULL,'pending','after_hours'),(93,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,24,NULL,'pending','after_hours'),(94,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,25,NULL,'pending','after_hours'),(95,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,26,NULL,'pending','after_hours'),(96,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,27,NULL,'pending','after_hours'),(97,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,28,NULL,'pending','after_hours'),(98,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,29,NULL,'pending','after_hours'),(99,'╨Т╤Л╨╡╨╖╨┤ ╨╜╨░ ╨▓╤Л╤Б╤В╨░╨▓╨║╤Г','╨Т╤Б╨╡ ╤П╨▓╨╗╤П╨╡╤В╨╡╤Б╤М ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╕╤В╨╡╨╗╤П╨╝╨╕, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨╛╤В╨╗╨╛╨╢╨╕╤В╤М ╤Б╤А╨╛╤З╨╜╤Г╤О ╤А╨░╨▒╨╛╤В╤Г ╨╕ ╨┐╤А╨╛╨╣╤В╨╕ ╨╗╨╕╨║╨▒╨╡╨╖╤Л ╨┐╤А╨╛╨╢╨░╤А╨║╨╕ ╨┐╨╛ ╨╜╨░╤И╨╡╨╣ ╨╛╨▒╨╗╨░╤Б╤В╨╕','2024-06-17',0,NULL,30,NULL,'pending','after_hours'),(100,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,21,NULL,'pending','after_hours'),(101,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,22,NULL,'pending','after_hours'),(102,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,24,NULL,'pending','after_hours'),(103,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,25,NULL,'pending','after_hours'),(104,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,26,NULL,'pending','after_hours'),(105,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,27,NULL,'pending','after_hours'),(106,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,28,NULL,'pending','after_hours'),(107,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,29,NULL,'pending','after_hours'),(108,'╨н╨║╨╖╨░╨╝╨╡╨╜ ╨┐╨╛ ╨┐╤А╨╛╤Д. ╨┐╤А╨╕╨│╨╛╨┤╨╜╨╛╤Б╤В╨╕','╨Т╨╝╨╡╤Б╤В╨╛ ╤А╨░╨▒╨╛╤В╤Л ╨▓ ╨║╨╛╨╜╤Ж╨╡ ╨┤╨╜╤П ╤Г╤Е╨╛╨┤╨╕╤В╨╡ ╤Б╨║╨╛╤А╨╡╨╡ ╨╜╨░ ╨┐╨╛╨┤╨│╨╛╤В╨╛╨▓╨║╤Г ╨┤╨╛╨╝╨╛╨╣.','2024-06-17',0,NULL,30,NULL,'pending','after_hours'),(109,'╨б╨╛╨▓╨╡╤Й╨░╨╜╨╕╨╡ ╨╜╨╡╤Б╨║╨╛╨╗╤М╨║╨╕╤Е ╨║╨╛╤А╨┐╤Г╤Б╨╛╨▓','╨Э╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝╨╛ ╨┐╤А╨╕╤Б╤Г╤В╤Б╤В╨▓╨╛╨▓╨░╤В╤М, ╨╖╨░╨╝╨╡╨╜╤П╨╡╤В ╤А╨░╨▒╨╛╤З╨╕╨╣ ╨┤╨╡╨╜╤М','2024-06-19',0,NULL,21,NULL,'pending','work_time'),(110,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(111,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,22,NULL,'pending','work_time'),(112,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,24,NULL,'pending','work_time'),(113,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,25,NULL,'pending','work_time'),(114,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,26,NULL,'pending','work_time'),(115,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,27,NULL,'pending','work_time'),(116,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,28,NULL,'pending','work_time'),(117,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,29,NULL,'pending','work_time'),(118,'╨Э╨░╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨╛╤З╨╕╨╜╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╤В╨╡╤Б╤В╨╕╤А╨╛╨▓╨║╨╕ ╨╛╤В ╨│╨╛╤Б╤Г╨┤╨░╤А╤Б╤В╨▓╨░','╨Я╨╛╤Б╨╗╨╡ ╤А╨░╨▒╨╛╤В╤Л ╨╖╨░╨╣╨╝╨╕╤В╨╡╤Б╤М ╨┐╤А╨░╨▓╨╕╨╗╤М╨╜╤Л╨╝ ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨╕╨╡ ╨╕ ╨▓╨┤╤Г╨╝╤З╨╕╨▓╨╛ ╤А╨░╤Б╨┐╨╕╤И╨╕╤В╨╡ ╤Б╨▓╨╛╤С \"╨╗╨╕╤В╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜╨╕╨╡\"','2024-06-21',0,NULL,30,NULL,'pending','work_time'),(119,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,21,NULL,'pending','work_time'),(120,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,22,NULL,'pending','work_time'),(121,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,24,NULL,'pending','work_time'),(122,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,25,NULL,'pending','work_time'),(123,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,26,NULL,'pending','work_time'),(124,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,27,NULL,'pending','work_time'),(125,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,28,NULL,'pending','work_time'),(126,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,29,NULL,'pending','work_time'),(127,'╨Т 12:00','╨б╨▒╨╛╤А ╨╜╨░ ╨┐╨╡╤А╨▓╨╛╨╝ ╤Н╤В╨░╨╢╨╡, ╨▓╨╡╤Б╤М ╤Б╨╛╤Б╤В╨░╨▓ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╨┐╨╡╤А╨╡╨╜╨╛╤Б╨╕╤В╤М ╨╜╨╛╨▓╨╛╨╡ ╨╛╨▒╨╛╤А╤Г╨┤╨╛╨▓╨░╨╜╨╕╨╡.','2024-06-21',0,NULL,30,NULL,'pending','work_time');
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

-- Dump completed on 2024-06-24 19:08:07
