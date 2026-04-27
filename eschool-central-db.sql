-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: eschool-saas
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `absensi_settings`
--

DROP TABLE IF EXISTS `absensi_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absensi_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `point_kehadiran` double(8,2) NOT NULL,
  `point_tatib` double(8,2) NOT NULL,
  `tatib` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kesiswaan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip_tatib` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip_kesiswaan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttd_kesiswaan` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ttd_petugas` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_sekolah` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kesiswaan_user_id` bigint unsigned DEFAULT NULL,
  `tatib_user_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absensi_settings_school_id_foreign` (`school_id`),
  KEY `absensi_settings_kesiswaan_user_id_foreign` (`kesiswaan_user_id`),
  KEY `absensi_settings_tatib_user_id_foreign` (`tatib_user_id`),
  KEY `absensi_settings_school_id_kesiswaan_user_id_index` (`school_id`,`kesiswaan_user_id`),
  KEY `absensi_settings_school_id_tatib_user_id_index` (`school_id`,`tatib_user_id`),
  CONSTRAINT `absensi_settings_kesiswaan_user_id_foreign` FOREIGN KEY (`kesiswaan_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `absensi_settings_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `absensi_settings_tatib_user_id_foreign` FOREIGN KEY (`tatib_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absensi_settings`
--

LOCK TABLES `absensi_settings` WRITE;
/*!40000 ALTER TABLE `absensi_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `absensi_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academic_calendars`
--

DROP TABLE IF EXISTS `academic_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_calendars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academic_calendars_school_id_foreign` (`school_id`),
  KEY `academic_calendars_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `academic_calendars_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `academic_calendars_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_calendars`
--

LOCK TABLES `academic_calendars` WRITE;
/*!40000 ALTER TABLE `academic_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accepted_file`
--

DROP TABLE IF EXISTS `accepted_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accepted_file` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `assignment_id` bigint unsigned DEFAULT NULL,
  `filetype_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `accepted_file_assignment_id_foreign` (`assignment_id`),
  KEY `accepted_file_filetype_id_foreign` (`filetype_id`),
  CONSTRAINT `accepted_file_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accepted_file_filetype_id_foreign` FOREIGN KEY (`filetype_id`) REFERENCES `filetype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accepted_file`
--

LOCK TABLES `accepted_file` WRITE;
/*!40000 ALTER TABLE `accepted_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `accepted_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_subscriptions`
--

DROP TABLE IF EXISTS `addon_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL,
  `price` double(64,4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '0 => Discontinue next billing, 1 => Continue',
  `payment_transaction_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addon_subscriptions_school_id_foreign` (`school_id`),
  KEY `addon_subscriptions_feature_id_foreign` (`feature_id`),
  KEY `addon_subscriptions_subscription_id_foreign` (`subscription_id`),
  KEY `addon_subscriptions_payment_transaction_id_foreign` (`payment_transaction_id`),
  CONSTRAINT `addon_subscriptions_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addon_subscriptions_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addon_subscriptions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addon_subscriptions_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_subscriptions`
--

LOCK TABLES `addon_subscriptions` WRITE;
/*!40000 ALTER TABLE `addon_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,4) NOT NULL COMMENT 'Daily price',
  `feature_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Inactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addons_feature_id_unique` (`feature_id`),
  CONSTRAINT `addons_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_classes`
--

DROP TABLE IF EXISTS `announcement_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint unsigned DEFAULT NULL,
  `class_section_id` bigint unsigned DEFAULT NULL,
  `class_subject_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_columns` (`announcement_id`,`class_section_id`,`school_id`),
  KEY `announcement_classes_school_id_foreign` (`school_id`),
  KEY `announcement_classes_announcement_id_index` (`announcement_id`),
  KEY `announcement_classes_class_section_id_index` (`class_section_id`),
  KEY `announcement_classes_class_subject_id_foreign` (`class_subject_id`),
  CONSTRAINT `announcement_classes_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcement_classes_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcement_classes_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcement_classes_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_classes`
--

LOCK TABLES `announcement_classes` WRITE;
/*!40000 ALTER TABLE `announcement_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcements_school_id_foreign` (`school_id`),
  KEY `announcements_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `announcements_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `announcements_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Token name/label',
  `token_hash` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `api_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_submissions`
--

DROP TABLE IF EXISTS `assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_submissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `assignment_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `points` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = Pending/In Review , 1 = Accepted , 2 = Rejected , 3 = Resubmitted',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignment_submissions_assignment_id_foreign` (`assignment_id`),
  KEY `assignment_submissions_school_id_foreign` (`school_id`),
  KEY `assignment_submissions_student_id_foreign` (`student_id`),
  KEY `assignment_submissions_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `assignment_submissions_assignment_id_foreign` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignment_submissions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignment_submissions_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignment_submissions_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_submissions`
--

LOCK TABLES `assignment_submissions` WRITE;
/*!40000 ALTER TABLE `assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `class_subject_id` bigint unsigned NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `points` int DEFAULT NULL,
  `resubmission` tinyint(1) NOT NULL DEFAULT '0',
  `extra_days_for_resubmission` int DEFAULT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL COMMENT 'teacher_user_id',
  `edited_by` bigint unsigned DEFAULT NULL COMMENT 'teacher_user_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assignments_school_id_foreign` (`school_id`),
  KEY `assignments_class_section_id_foreign` (`class_section_id`),
  KEY `assignments_class_subject_id_foreign` (`class_subject_id`),
  KEY `assignments_session_year_id_foreign` (`session_year_id`),
  KEY `assignments_created_by_foreign` (`created_by`),
  KEY `assignments_edited_by_foreign` (`edited_by`),
  CONSTRAINT `assignments_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_edited_by_foreign` FOREIGN KEY (`edited_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assignments_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message_id` bigint unsigned NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_message_id_foreign` (`message_id`),
  CONSTRAINT `attachments_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_days`
--

DROP TABLE IF EXISTS `attendance_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_days` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `day_key` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `max_jp` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attendance_days_school_id_day_key_unique` (`school_id`,`day_key`),
  KEY `attendance_days_school_id_index` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_days`
--

LOCK TABLES `attendance_days` WRITE;
/*!40000 ALTER TABLE `attendance_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_points`
--

DROP TABLE IF EXISTS `attendance_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_points` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `starting_range` int NOT NULL,
  `ending_range` int NOT NULL,
  `rules` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_points`
--

LOCK TABLES `attendance_points` WRITE;
/*!40000 ALTER TABLE `attendance_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `grade_level_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `session_year_id` bigint unsigned NOT NULL,
  `type` tinyint NOT NULL COMMENT '0=Absent, 1=Present',
  `date` date NOT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_school_id_foreign` (`school_id`),
  KEY `attendances_class_section_id_foreign` (`class_section_id`),
  KEY `attendances_student_id_foreign` (`student_id`),
  KEY `attendances_session_year_id_foreign` (`session_year_id`),
  KEY `attendances_grade_level_id_foreign` (`grade_level_id`),
  CONSTRAINT `attendances_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_absen_admins`
--

DROP TABLE IF EXISTS `auto_absen_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto_absen_admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `month_year` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_absen_admins`
--

LOCK TABLES `auto_absen_admins` WRITE;
/*!40000 ALTER TABLE `auto_absen_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_absen_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_soal`
--

DROP TABLE IF EXISTS `bank_soal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_soal` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned NOT NULL,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('multiple_choice','essay','true_false','numeric','short_answer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_soal_teacher_id_foreign` (`teacher_id`),
  KEY `bank_soal_subject_id_foreign` (`subject_id`),
  CONSTRAINT `bank_soal_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bank_soal_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_soal`
--

LOCK TABLES `bank_soal` WRITE;
/*!40000 ALTER TABLE `bank_soal` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_soal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_soal_detail`
--

DROP TABLE IF EXISTS `bank_soal_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_soal_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_soal_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bank_soal_detail_bank_soal_id_foreign` (`bank_soal_id`),
  KEY `bank_soal_detail_subject_id_foreign` (`subject_id`),
  CONSTRAINT `bank_soal_detail_bank_soal_id_foreign` FOREIGN KEY (`bank_soal_id`) REFERENCES `bank_soal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_soal_detail_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_soal_detail`
--

LOCK TABLES `bank_soal_detail` WRITE;
/*!40000 ALTER TABLE `bank_soal_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_soal_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_soal_versions`
--

DROP TABLE IF EXISTS `bank_soal_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_soal_versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_soal_detail_id` bigint unsigned NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_point` int DEFAULT '1',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_soal_versions_updated_by_foreign` (`updated_by`),
  KEY `bank_soal_versions_bank_soal_detail_id_foreign` (`bank_soal_detail_id`),
  CONSTRAINT `bank_soal_versions_bank_soal_detail_id_foreign` FOREIGN KEY (`bank_soal_detail_id`) REFERENCES `bank_soal_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bank_soal_versions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_soal_versions`
--

LOCK TABLES `bank_soal_versions` WRITE;
/*!40000 ALTER TABLE `bank_soal_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_soal_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beginning_balance`
--

DROP TABLE IF EXISTS `beginning_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beginning_balance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cut_off_date` date NOT NULL COMMENT 'Tanggal cut-off saldo',
  `cash_balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Saldo kas',
  `bank_balance` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Saldo bank',
  `receivables` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Piutang',
  `payables` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'Utang',
  `expenditure` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT 'pengeuaran',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `beginning_balance_cut_off_date_unique` (`cut_off_date`),
  KEY `beginning_balance_cut_off_date_index` (`cut_off_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beginning_balance`
--

LOCK TABLES `beginning_balance` WRITE;
/*!40000 ALTER TABLE `beginning_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `beginning_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_school_id_foreign` (`school_id`),
  CONSTRAINT `categories_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate_templates`
--

DROP TABLE IF EXISTS `certificate_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_layout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A4 Portrait, A4 Landscape, Custom',
  `height` double(8,2) DEFAULT NULL,
  `width` double(8,2) DEFAULT NULL,
  `user_image_shape` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Round, Square',
  `image_size` double(8,2) DEFAULT NULL,
  `background_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fields` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `style` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Student, Staff',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `certificate_templates_school_id_foreign` (`school_id`),
  CONSTRAINT `certificate_templates_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `certificate_templates_chk_1` CHECK (json_valid(`style`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_templates`
--

LOCK TABLES `certificate_templates` WRITE;
/*!40000 ALTER TABLE `certificate_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_sender_id_foreign` (`sender_id`),
  KEY `chats_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `chats_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chats_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_groups`
--

DROP TABLE IF EXISTS `class_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_groups_school_id_foreign` (`school_id`),
  CONSTRAINT `class_groups_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_groups`
--

LOCK TABLES `class_groups` WRITE;
/*!40000 ALTER TABLE `class_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sections`
--

DROP TABLE IF EXISTS `class_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned NOT NULL,
  `grade_level_id` bigint unsigned DEFAULT NULL,
  `section_id` bigint unsigned NOT NULL,
  `medium_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `pkl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`class_id`,`section_id`,`medium_id`),
  KEY `class_sections_school_id_foreign` (`school_id`),
  KEY `class_sections_section_id_foreign` (`section_id`),
  KEY `class_sections_medium_id_foreign` (`medium_id`),
  KEY `class_sections_grade_level_id_foreign` (`grade_level_id`),
  KEY `class_sections_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `class_sections_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_sections_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `class_sections_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_sections_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_sections_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_sections_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sections`
--

LOCK TABLES `class_sections` WRITE;
/*!40000 ALTER TABLE `class_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_subjects`
--

DROP TABLE IF EXISTS `class_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Compulsory / Elective',
  `elective_subject_group_id` bigint unsigned DEFAULT NULL COMMENT 'if type=Elective',
  `semester_id` bigint unsigned DEFAULT NULL,
  `virtual_semester_id` int GENERATED ALWAYS AS ((case when (`semester_id` is not null) then `semester_id` else 0 end)) VIRTUAL,
  `school_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids` (`class_id`,`subject_id`,`virtual_semester_id`),
  KEY `class_subjects_elective_subject_group_id_foreign` (`elective_subject_group_id`),
  KEY `class_subjects_school_id_foreign` (`school_id`),
  KEY `class_subjects_subject_id_foreign` (`subject_id`),
  KEY `class_subjects_semester_id_foreign` (`semester_id`),
  CONSTRAINT `class_subjects_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_subjects_elective_subject_group_id_foreign` FOREIGN KEY (`elective_subject_group_id`) REFERENCES `elective_subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_subjects_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_subjects_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_subjects`
--

LOCK TABLES `class_subjects` WRITE;
/*!40000 ALTER TABLE `class_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_teachers`
--

DROP TABLE IF EXISTS `class_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`class_section_id`,`teacher_id`),
  KEY `class_teachers_school_id_foreign` (`school_id`),
  KEY `class_teachers_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `class_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_teachers`
--

LOCK TABLES `class_teachers` WRITE;
/*!40000 ALTER TABLE `class_teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `include_semesters` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no 1 - yes',
  `medium_id` bigint unsigned NOT NULL,
  `grade_level_id` bigint unsigned DEFAULT NULL,
  `shift_id` bigint unsigned DEFAULT NULL,
  `stream_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_school_id_foreign` (`school_id`),
  KEY `classes_medium_id_foreign` (`medium_id`),
  KEY `classes_shift_id_foreign` (`shift_id`),
  KEY `classes_stream_id_foreign` (`stream_id`),
  KEY `classes_grade_level_id_foreign` (`grade_level_id`),
  CONSTRAINT `classes_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `classes_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `classes_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `classes_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `classes_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compulsory_fees`
--

DROP TABLE IF EXISTS `compulsory_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compulsory_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `payment_transaction_id` bigint unsigned DEFAULT NULL,
  `type` enum('Full Payment','Installment Payment') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `installment_id` bigint unsigned DEFAULT NULL,
  `mode` enum('Cash','Cheque','Online') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `due_charges` double(8,2) DEFAULT NULL,
  `fees_paid_id` bigint unsigned DEFAULT NULL,
  `status` enum('Success','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compulsory_fees_installment_id_foreign` (`installment_id`),
  KEY `compulsory_fees_school_id_foreign` (`school_id`),
  KEY `compulsory_fees_student_id_foreign` (`student_id`),
  KEY `compulsory_fees_payment_transaction_id_foreign` (`payment_transaction_id`),
  KEY `compulsory_fees_fees_paid_id_foreign` (`fees_paid_id`),
  CONSTRAINT `compulsory_fees_fees_paid_id_foreign` FOREIGN KEY (`fees_paid_id`) REFERENCES `fees_paids` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compulsory_fees_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `fees_installments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compulsory_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compulsory_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compulsory_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compulsory_fees`
--

LOCK TABLES `compulsory_fees` WRITE;
/*!40000 ALTER TABLE `compulsory_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `compulsory_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_inquiries`
--

DROP TABLE IF EXISTS `contact_inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_inquiries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('new','replied','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `replied_at` timestamp NULL DEFAULT NULL,
  `replied_by` bigint unsigned DEFAULT NULL,
  `admin_reply` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_inquiries_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_inquiries`
--

LOCK TABLES `contact_inquiries` WRITE;
/*!40000 ALTER TABLE `contact_inquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_backups`
--

DROP TABLE IF EXISTS `database_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_backups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `last_backup_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `database_backups_school_id_foreign` (`school_id`),
  CONSTRAINT `database_backups_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_backups`
--

LOCK TABLES `database_backups` WRITE;
/*!40000 ALTER TABLE `database_backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `database_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `fcm_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_seen_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_user_id_fcm_id_unique` (`user_id`,`fcm_id`),
  KEY `device_tokens_user_id_is_active_index` (`user_id`,`is_active`),
  KEY `device_tokens_fcm_id_is_active_index` (`fcm_id`,`is_active`),
  KEY `device_tokens_platform_index` (`platform`),
  CONSTRAINT `device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_files`
--

DROP TABLE IF EXISTS `document_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `owner_type` enum('kpk','module') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pemiliknya: kpk/module',
  `owner_id` bigint unsigned NOT NULL COMMENT 'id kpks / modules',
  `folder_id` bigint unsigned DEFAULT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nama unik (untuk storage)',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nama tampil/original',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'deskripsi file',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'path file di storage',
  `mime` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'byte',
  `uploader_id` bigint unsigned DEFAULT NULL,
  `visible_to_teacher` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'tampil di guru?',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_files_uuid_unique` (`uuid`),
  KEY `idx_df_owner_folder` (`school_id`,`owner_type`,`owner_id`,`folder_id`),
  KEY `idx_df_folder_id` (`folder_id`),
  KEY `idx_df_school_id` (`school_id`),
  KEY `idx_df_uploader_id` (`uploader_id`),
  KEY `idx_df_deleted_at` (`deleted_at`),
  KEY `idx_df_visible_teacher` (`visible_to_teacher`),
  CONSTRAINT `document_files_folder_id_foreign` FOREIGN KEY (`folder_id`) REFERENCES `document_folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_files_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_files_uploader_id_foreign` FOREIGN KEY (`uploader_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_files`
--

LOCK TABLES `document_files` WRITE;
/*!40000 ALTER TABLE `document_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_folders`
--

DROP TABLE IF EXISTS `document_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `owner_type` enum('kpk','module') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pemiliknya: kpk / module',
  `owner_id` bigint unsigned NOT NULL COMMENT 'id dari kpks / modules',
  `parent_id` bigint unsigned DEFAULT NULL COMMENT 'folder induk (boleh null)',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nama folder',
  `sort` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_owner` (`school_id`,`owner_type`,`owner_id`,`parent_id`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_deleted_at` (`deleted_at`),
  CONSTRAINT `document_folders_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `document_folders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_folders_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_folders`
--

LOCK TABLES `document_folders` WRITE;
/*!40000 ALTER TABLE `document_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_level`
--

DROP TABLE IF EXISTS `edu_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_level` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_level`
--

LOCK TABLES `edu_level` WRITE;
/*!40000 ALTER TABLE `edu_level` DISABLE KEYS */;
INSERT INTO `edu_level` VALUES (1,'PAUD','2026-02-24 04:05:01','2026-02-24 04:05:01'),(2,'TK','2026-02-24 04:05:01','2026-02-24 04:05:01'),(3,'SD','2026-02-24 04:05:01','2026-02-24 04:05:01'),(4,'MI','2026-02-24 04:05:01','2026-02-24 04:05:01'),(5,'SMP','2026-02-24 04:05:01','2026-02-24 04:05:01'),(6,'MTs','2026-02-24 04:05:01','2026-02-24 04:05:01'),(7,'SMA','2026-02-24 04:05:01','2026-02-24 04:05:01'),(8,'MA','2026-02-24 04:05:01','2026-02-24 04:05:01'),(9,'SMK','2026-02-24 04:05:01','2026-02-24 04:05:01'),(10,'SLB','2026-02-24 04:05:01','2026-02-24 04:05:01'),(11,'Paket A','2026-02-24 04:05:01','2026-02-24 04:05:01'),(12,'Paket B','2026-02-24 04:05:01','2026-02-24 04:05:01'),(13,'Paket C','2026-02-24 04:05:01','2026-02-24 04:05:01'),(14,'Ponpes','2026-02-24 04:05:01','2026-02-24 04:05:01'),(15,'Lainnya','2026-02-24 04:05:01','2026-02-24 04:05:01');
/*!40000 ALTER TABLE `edu_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elective_subject_groups`
--

DROP TABLE IF EXISTS `elective_subject_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elective_subject_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `total_subjects` int NOT NULL,
  `total_selectable_subjects` int NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `semester_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `elective_subject_groups_school_id_foreign` (`school_id`),
  KEY `elective_subject_groups_class_id_foreign` (`class_id`),
  KEY `elective_subject_groups_semester_id_foreign` (`semester_id`),
  CONSTRAINT `elective_subject_groups_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elective_subject_groups_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elective_subject_groups_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elective_subject_groups`
--

LOCK TABLES `elective_subject_groups` WRITE;
/*!40000 ALTER TABLE `elective_subject_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `elective_subject_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskul_absensis`
--

DROP TABLE IF EXISTS `eskul_absensis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskul_absensis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `eskul_detail_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `type` tinyint NOT NULL COMMENT '0=Absent, 1=Present',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eskul_absensis_eskul_detail_id_foreign` (`eskul_detail_id`),
  CONSTRAINT `eskul_absensis_eskul_detail_id_foreign` FOREIGN KEY (`eskul_detail_id`) REFERENCES `eskul_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskul_absensis`
--

LOCK TABLES `eskul_absensis` WRITE;
/*!40000 ALTER TABLE `eskul_absensis` DISABLE KEYS */;
/*!40000 ALTER TABLE `eskul_absensis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskul_details`
--

DROP TABLE IF EXISTS `eskul_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskul_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `estrakulikuler_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eskul_details_estrakulikuler_id_foreign` (`estrakulikuler_id`),
  KEY `eskul_details_student_id_foreign` (`student_id`),
  CONSTRAINT `eskul_details_estrakulikuler_id_foreign` FOREIGN KEY (`estrakulikuler_id`) REFERENCES `estrakulikulers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eskul_details_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskul_details`
--

LOCK TABLES `eskul_details` WRITE;
/*!40000 ALTER TABLE `eskul_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `eskul_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eskul_timetables`
--

DROP TABLE IF EXISTS `eskul_timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eskul_timetables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `estrakulikuler_id` bigint unsigned NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eskul_timetables_estrakulikuler_id_foreign` (`estrakulikuler_id`),
  CONSTRAINT `eskul_timetables_estrakulikuler_id_foreign` FOREIGN KEY (`estrakulikuler_id`) REFERENCES `estrakulikulers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eskul_timetables`
--

LOCK TABLES `eskul_timetables` WRITE;
/*!40000 ALTER TABLE `eskul_timetables` DISABLE KEYS */;
/*!40000 ALTER TABLE `eskul_timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estrakulikulers`
--

DROP TABLE IF EXISTS `estrakulikulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estrakulikulers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coach_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estrakulikulers_coach_id_foreign` (`coach_id`),
  CONSTRAINT `estrakulikulers_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estrakulikulers`
--

LOCK TABLES `estrakulikulers` WRITE;
/*!40000 ALTER TABLE `estrakulikulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `estrakulikulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_marks`
--

DROP TABLE IF EXISTS `exam_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_marks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `exam_timetable_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint unsigned NOT NULL,
  `grade_level_id` bigint unsigned DEFAULT NULL,
  `obtained_marks` double(8,2) NOT NULL,
  `teacher_review` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_status` tinyint(1) NOT NULL COMMENT '1=Pass, 0=Fail',
  `session_year_id` bigint unsigned NOT NULL,
  `grade` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_marks_school_id_foreign` (`school_id`),
  KEY `exam_marks_exam_timetable_id_foreign` (`exam_timetable_id`),
  KEY `exam_marks_student_id_foreign` (`student_id`),
  KEY `exam_marks_class_subject_id_foreign` (`class_subject_id`),
  KEY `exam_marks_session_year_id_foreign` (`session_year_id`),
  KEY `exam_marks_grade_level_id_foreign` (`grade_level_id`),
  CONSTRAINT `exam_marks_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_marks_exam_timetable_id_foreign` FOREIGN KEY (`exam_timetable_id`) REFERENCES `exam_timetables` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_marks_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `exam_marks_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_marks_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_marks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_marks`
--

LOCK TABLES `exam_marks` WRITE;
/*!40000 ALTER TABLE `exam_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_results`
--

DROP TABLE IF EXISTS `exam_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` bigint unsigned NOT NULL,
  `class_section_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `total_marks` int NOT NULL,
  `obtained_marks` double(8,2) NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `grade` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '0 -> Failed, 1 -> Pass',
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_results_school_id_foreign` (`school_id`),
  KEY `exam_results_exam_id_foreign` (`exam_id`),
  KEY `exam_results_class_section_id_foreign` (`class_section_id`),
  KEY `exam_results_student_id_foreign` (`student_id`),
  KEY `exam_results_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `exam_results_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_results_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_results_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_results`
--

LOCK TABLES `exam_results` WRITE;
/*!40000 ALTER TABLE `exam_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_timetables`
--

DROP TABLE IF EXISTS `exam_timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_timetables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` bigint unsigned NOT NULL,
  `class_subject_id` bigint unsigned NOT NULL,
  `total_marks` double(8,2) NOT NULL,
  `passing_marks` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_timetables_exam_id_foreign` (`exam_id`),
  KEY `exam_timetables_school_id_foreign` (`school_id`),
  KEY `exam_timetables_class_subject_id_foreign` (`class_subject_id`),
  KEY `exam_timetables_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `exam_timetables_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_timetables_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_timetables_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_timetables_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_timetables`
--

LOCK TABLES `exam_timetables` WRITE;
/*!40000 ALTER TABLE `exam_timetables` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `grade_level_id` bigint unsigned DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `publish` tinyint NOT NULL DEFAULT '0',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_school_id_foreign` (`school_id`),
  KEY `exams_class_id_foreign` (`class_id`),
  KEY `exams_session_year_id_foreign` (`session_year_id`),
  KEY `exams_grade_level_id_foreign` (`grade_level_id`),
  CONSTRAINT `exams_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exams_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `exams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_school_id_foreign` (`school_id`),
  CONSTRAINT `expense_categories_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned DEFAULT NULL,
  `ref_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` bigint unsigned DEFAULT NULL,
  `basic_salary` bigint NOT NULL DEFAULT '0',
  `paid_leaves` double(8,2) NOT NULL DEFAULT '0.00',
  `month` bigint DEFAULT NULL,
  `year` int DEFAULT NULL,
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(64,2) NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salary_unique_records` (`staff_id`,`month`,`year`),
  KEY `expenses_school_id_foreign` (`school_id`),
  KEY `expenses_category_id_foreign` (`category_id`),
  KEY `expenses_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_student_datas`
--

DROP TABLE IF EXISTS `extra_student_datas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extra_student_datas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `form_field_id` bigint unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `extra_student_datas_form_field_id_foreign` (`form_field_id`),
  KEY `extra_student_datas_school_id_foreign` (`school_id`),
  KEY `extra_student_datas_student_id_foreign` (`student_id`),
  CONSTRAINT `extra_student_datas_form_field_id_foreign` FOREIGN KEY (`form_field_id`) REFERENCES `form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extra_student_datas_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `extra_student_datas_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_student_datas`
--

LOCK TABLES `extra_student_datas` WRITE;
/*!40000 ALTER TABLE `extra_student_datas` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_student_datas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_school_id_foreign` (`school_id`),
  CONSTRAINT `faqs_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_section_lists`
--

DROP TABLE IF EXISTS `feature_section_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_section_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `feature_section_id` bigint unsigned NOT NULL,
  `feature` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_section_lists_feature_section_id_foreign` (`feature_section_id`),
  CONSTRAINT `feature_section_lists_feature_section_id_foreign` FOREIGN KEY (`feature_section_id`) REFERENCES `feature_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_section_lists`
--

LOCK TABLES `feature_section_lists` WRITE;
/*!40000 ALTER TABLE `feature_section_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_section_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_sections`
--

DROP TABLE IF EXISTS `feature_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feature_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_sections`
--

LOCK TABLES `feature_sections` WRITE;
/*!40000 ALTER TABLE `feature_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `status` int NOT NULL DEFAULT '1',
  `required_vps` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,'Student Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(2,'Academics Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(3,'Slider Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(4,'Teacher Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(5,'Session Year Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(6,'Holiday Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(7,'Timetable Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(8,'Attendance Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(9,'Exam Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(10,'Lesson Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(11,'Assignment Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(12,'Announcement Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(13,'Staff Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(14,'Expense Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(15,'Staff Leave Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(16,'Fees Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(17,'School Gallery Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(18,'ID Card - Certificate Generation',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(19,'Website Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(20,'Chat Module',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `due_charges` double(8,2) NOT NULL COMMENT 'in percentage (%)',
  `due_charges_amount` double(8,2) NOT NULL,
  `class_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fees_session_year_id_foreign` (`session_year_id`),
  KEY `fees_school_id_foreign` (`school_id`),
  KEY `fees_class_id_foreign` (`class_id`),
  CONSTRAINT `fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_advance`
--

DROP TABLE IF EXISTS `fees_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_advance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `compulsory_fee_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `parent_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fees_advance_compulsory_fee_id_foreign` (`compulsory_fee_id`),
  KEY `fees_advance_student_id_foreign` (`student_id`),
  KEY `fees_advance_parent_id_foreign` (`parent_id`),
  CONSTRAINT `fees_advance_compulsory_fee_id_foreign` FOREIGN KEY (`compulsory_fee_id`) REFERENCES `compulsory_fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_advance_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_advance_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_advance`
--

LOCK TABLES `fees_advance` WRITE;
/*!40000 ALTER TABLE `fees_advance` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_class`
--

DROP TABLE IF EXISTS `fees_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_class` (
  `class_section_id` bigint unsigned NOT NULL,
  `fees_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`class_section_id`,`fees_id`),
  KEY `fees_class_fees_id_foreign` (`fees_id`),
  CONSTRAINT `fees_class_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_class_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_class`
--

LOCK TABLES `fees_class` WRITE;
/*!40000 ALTER TABLE `fees_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_class_types`
--

DROP TABLE IF EXISTS `fees_class_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_class_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned NOT NULL,
  `fees_id` bigint unsigned NOT NULL,
  `fees_type_id` bigint unsigned NOT NULL,
  `amount` double(64,2) NOT NULL,
  `optional` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids` (`class_id`,`fees_type_id`,`school_id`,`fees_id`),
  KEY `fees_class_types_fees_id_foreign` (`fees_id`),
  KEY `fees_class_types_fees_type_id_foreign` (`fees_type_id`),
  KEY `fees_class_types_school_id_foreign` (`school_id`),
  CONSTRAINT `fees_class_types_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_class_types_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_class_types_fees_type_id_foreign` FOREIGN KEY (`fees_type_id`) REFERENCES `fees_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_class_types_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_class_types`
--

LOCK TABLES `fees_class_types` WRITE;
/*!40000 ALTER TABLE `fees_class_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_class_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_installments`
--

DROP TABLE IF EXISTS `fees_installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_installments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `due_charges_type` enum('fixed','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `due_charges` int NOT NULL,
  `fees_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fees_installments_fees_id_foreign` (`fees_id`),
  KEY `fees_installments_session_year_id_foreign` (`session_year_id`),
  KEY `fees_installments_school_id_foreign` (`school_id`),
  CONSTRAINT `fees_installments_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_installments_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_installments_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_installments`
--

LOCK TABLES `fees_installments` WRITE;
/*!40000 ALTER TABLE `fees_installments` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_installments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_paids`
--

DROP TABLE IF EXISTS `fees_paids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_paids` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fees_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `is_fully_paid` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `is_used_installment` tinyint(1) NOT NULL COMMENT '0 - No, 1 - Yes',
  `amount` double(8,2) NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids` (`student_id`,`fees_id`,`school_id`),
  KEY `fees_paids_school_id_foreign` (`school_id`),
  KEY `fees_paids_fees_id_foreign` (`fees_id`),
  CONSTRAINT `fees_paids_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_paids_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fees_paids_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_paids`
--

LOCK TABLES `fees_paids` WRITE;
/*!40000 ALTER TABLE `fees_paids` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_paids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_payment_type`
--

DROP TABLE IF EXISTS `fees_payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `an` varchar(255) NOT NULL,
  `norek` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_payment_type`
--

LOCK TABLES `fees_payment_type` WRITE;
/*!40000 ALTER TABLE `fees_payment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_types`
--

DROP TABLE IF EXISTS `fees_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fees_types_school_id_foreign` (`school_id`),
  CONSTRAINT `fees_types_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_types`
--

LOCK TABLES `fees_types` WRITE;
/*!40000 ALTER TABLE `fees_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `fees_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `modal_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal_id` bigint unsigned NOT NULL,
  `file_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_thumbnail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_modal_type_modal_id_index` (`modal_type`,`modal_id`),
  KEY `files_school_id_foreign` (`school_id`),
  CONSTRAINT `files_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filetype`
--

DROP TABLE IF EXISTS `filetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filetype` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filetype`
--

LOCK TABLES `filetype` WRITE;
/*!40000 ALTER TABLE `filetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `filetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_bendahara`
--

DROP TABLE IF EXISTS `folder_bendahara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_bendahara` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_bendahara`
--

LOCK TABLES `folder_bendahara` WRITE;
/*!40000 ALTER TABLE `folder_bendahara` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_bendahara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_humas`
--

DROP TABLE IF EXISTS `folder_humas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_humas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_humas`
--

LOCK TABLES `folder_humas` WRITE;
/*!40000 ALTER TABLE `folder_humas` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_humas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kesiswaan`
--

DROP TABLE IF EXISTS `folder_kesiswaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kesiswaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kesiswaan`
--

LOCK TABLES `folder_kesiswaan` WRITE;
/*!40000 ALTER TABLE `folder_kesiswaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kesiswaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kpk`
--

DROP TABLE IF EXISTS `folder_kpk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kpk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kpk`
--

LOCK TABLES `folder_kpk` WRITE;
/*!40000 ALTER TABLE `folder_kpk` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kpk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kpk_elin`
--

DROP TABLE IF EXISTS `folder_kpk_elin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kpk_elin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kpk_elin`
--

LOCK TABLES `folder_kpk_elin` WRITE;
/*!40000 ALTER TABLE `folder_kpk_elin` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kpk_elin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kpk_metro`
--

DROP TABLE IF EXISTS `folder_kpk_metro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kpk_metro` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kpk_metro`
--

LOCK TABLES `folder_kpk_metro` WRITE;
/*!40000 ALTER TABLE `folder_kpk_metro` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kpk_metro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kpk_rpl`
--

DROP TABLE IF EXISTS `folder_kpk_rpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kpk_rpl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kpk_rpl`
--

LOCK TABLES `folder_kpk_rpl` WRITE;
/*!40000 ALTER TABLE `folder_kpk_rpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kpk_rpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kpk_tkj`
--

DROP TABLE IF EXISTS `folder_kpk_tkj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kpk_tkj` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kpk_tkj`
--

LOCK TABLES `folder_kpk_tkj` WRITE;
/*!40000 ALTER TABLE `folder_kpk_tkj` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kpk_tkj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_kurikulum`
--

DROP TABLE IF EXISTS `folder_kurikulum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_kurikulum` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_kurikulum`
--

LOCK TABLES `folder_kurikulum` WRITE;
/*!40000 ALTER TABLE `folder_kurikulum` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_kurikulum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_pdsm`
--

DROP TABLE IF EXISTS `folder_pdsm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_pdsm` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_pdsm`
--

LOCK TABLES `folder_pdsm` WRITE;
/*!40000 ALTER TABLE `folder_pdsm` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_pdsm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_perpus`
--

DROP TABLE IF EXISTS `folder_perpus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_perpus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_perpus`
--

LOCK TABLES `folder_perpus` WRITE;
/*!40000 ALTER TABLE `folder_perpus` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_perpus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_sarpas`
--

DROP TABLE IF EXISTS `folder_sarpas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_sarpas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_sarpas`
--

LOCK TABLES `folder_sarpas` WRITE;
/*!40000 ALTER TABLE `folder_sarpas` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_sarpas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_tatib`
--

DROP TABLE IF EXISTS `folder_tatib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_tatib` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_tatib`
--

LOCK TABLES `folder_tatib` WRITE;
/*!40000 ALTER TABLE `folder_tatib` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_tatib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_tu`
--

DROP TABLE IF EXISTS `folder_tu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder_tu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_tu`
--

LOCK TABLES `folder_tu` WRITE;
/*!40000 ALTER TABLE `folder_tu` DISABLE KEYS */;
/*!40000 ALTER TABLE `folder_tu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_fields`
--

DROP TABLE IF EXISTS `form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'text,number,textarea,dropdown,checkbox,radio,fileupload',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `default_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'values of radio,checkbox,dropdown,etc',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'extra HTML attributes',
  `school_id` bigint unsigned NOT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `display_on_id` int NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`school_id`),
  KEY `form_fields_school_id_foreign` (`school_id`),
  CONSTRAINT `form_fields_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_fields`
--

LOCK TABLES `form_fields` WRITE;
/*!40000 ALTER TABLE `form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_session_year_id_foreign` (`session_year_id`),
  KEY `galleries_school_id_foreign` (`school_id`),
  CONSTRAINT `galleries_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `galleries_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_level`
--

DROP TABLE IF EXISTS `grade_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_level` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grade_level_school_id_foreign` (`school_id`),
  CONSTRAINT `grade_level_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_level`
--

LOCK TABLES `grade_level` WRITE;
/*!40000 ALTER TABLE `grade_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `starting_range` double(8,2) NOT NULL,
  `ending_range` double(8,2) NOT NULL,
  `grade` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grades_school_id_foreign` (`school_id`),
  CONSTRAINT `grades_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_details`
--

DROP TABLE IF EXISTS `guardian_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `nama_wali` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun_lahir_wali` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenjang_pendidikan_wali` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan_wali` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `penghasilan_wali` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NIK_wali` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guardian_details_user_id_foreign` (`user_id`),
  CONSTRAINT `guardian_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_details`
--

LOCK TABLES `guardian_details` WRITE;
/*!40000 ALTER TABLE `guardian_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guidances`
--

DROP TABLE IF EXISTS `guidances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guidances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guidances`
--

LOCK TABLES `guidances` WRITE;
/*!40000 ALTER TABLE `guidances` DISABLE KEYS */;
/*!40000 ALTER TABLE `guidances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidays_school_id_foreign` (`school_id`),
  CONSTRAINT `holidays_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kpks`
--

DROP TABLE IF EXISTS `kpks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kpks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `stream_id` bigint unsigned DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode_source` enum('looping_jurusan','crud') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'crud',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_by` bigint unsigned DEFAULT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_kpk_school_name` (`school_id`,`name`),
  KEY `idx_kpk_school_stream` (`school_id`,`stream_id`),
  KEY `kpks_stream_id_foreign` (`stream_id`),
  CONSTRAINT `kpks_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `kpks_stream_id_foreign` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpks`
--

LOCK TABLES `kpks` WRITE;
/*!40000 ALTER TABLE `kpks` DISABLE KEYS */;
/*!40000 ALTER TABLE `kpks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>active',
  `is_rtl` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en.json',1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_details`
--

DROP TABLE IF EXISTS `leave_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_details_leave_id_foreign` (`leave_id`),
  KEY `leave_details_school_id_foreign` (`school_id`),
  CONSTRAINT `leave_details_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_details_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_details`
--

LOCK TABLES `leave_details` WRITE;
/*!40000 ALTER TABLE `leave_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_masters`
--

DROP TABLE IF EXISTS `leave_masters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_masters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leaves` double(8,2) NOT NULL COMMENT 'Leaves per month',
  `holiday` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_masters_session_year_id_foreign` (`session_year_id`),
  KEY `leave_masters_school_id_foreign` (`school_id`),
  CONSTRAINT `leave_masters_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_masters_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_masters`
--

LOCK TABLES `leave_masters` WRITE;
/*!40000 ALTER TABLE `leave_masters` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_masters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `reason` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `status` int NOT NULL DEFAULT '0' COMMENT '0 => Pending, 1 => Approved, 2 => Rejected',
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `school_id` bigint unsigned NOT NULL,
  `leave_master_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leaves_school_id_foreign` (`school_id`),
  KEY `leaves_leave_master_id_foreign` (`leave_master_id`),
  KEY `leaves_user_id_foreign` (`user_id`),
  CONSTRAINT `leaves_leave_master_id_foreign` FOREIGN KEY (`leave_master_id`) REFERENCES `leave_masters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson_topics`
--

DROP TABLE IF EXISTS `lesson_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson_topics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint unsigned NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_topics_lesson_id_foreign` (`lesson_id`),
  KEY `lesson_topics_school_id_foreign` (`school_id`),
  CONSTRAINT `lesson_topics_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_topics_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson_topics`
--

LOCK TABLES `lesson_topics` WRITE;
/*!40000 ALTER TABLE `lesson_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_section_id` bigint unsigned NOT NULL,
  `class_subject_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_school_id_foreign` (`school_id`),
  KEY `lessons_class_section_id_foreign` (`class_section_id`),
  KEY `lessons_class_subject_id_foreign` (`class_subject_id`),
  CONSTRAINT `lessons_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lessons_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lessons_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediums`
--

DROP TABLE IF EXISTS `mediums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mediums_school_id_foreign` (`school_id`),
  CONSTRAINT `mediums_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediums`
--

LOCK TABLES `mediums` WRITE;
/*!40000 ALTER TABLE `mediums` DISABLE KEYS */;
/*!40000 ALTER TABLE `mediums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint unsigned NOT NULL,
  `sender_id` bigint unsigned NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_chat_id_foreign` (`chat_id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_04_01_091033_create_permission_tables',1),(6,'2022_04_01_105826_all_tables',1),(7,'2023_11_16_134449_version1-0-1',1),(8,'2023_12_07_120054_version1_1_0',1),(9,'2024_01_30_092228_version1_2_0',1),(10,'2024_03_12_173521_version1_3_0',1),(11,'2024_05_21_094714_version1_3_2',1),(12,'2024_07_21_093657_version1_4_0',1),(13,'2024_08_08_094709_version1_4_1',1),(16,'2024_12_18_150019_create_folder_kesiswaans_table',2),(17,'2024_12_18_150019_create_folder_kesiswaan_table',3),(18,'2024_12_18_153439_create_folder_tatib_table',4),(19,'2024_12_17_085057_create_upload_file_and_tag_dokumen_tatib_tables',5),(20,'2024_12_17_090441_create_upload_file_and_tag_dokumen_kesiswaan_tables',6),(21,'2024_10_03_173555_version_1_4_1',7),(22,'2024_10_15_083944_create_subject_attendances_table',7),(23,'2024_10_16_082506_create_guardian_details_table',7),(24,'2024_10_16_090246_create_subject_attendance_students_table',7),(25,'2024_10_17_110509_create_special_fees_table',7),(26,'2024_10_24_094601_create_bank_soal_table',7),(27,'2024_10_29_091912_create_absensi_settings_table',7),(28,'2024_11_04_083600_create_recap_edits_table',7),(29,'2024_11_04_085138_create_attendance_points_table',7),(30,'2024_12_19_074541_folder_humas',8),(31,'2024_01_01_000001_create_user_relation_table',9),(32,'2024_03_21_111000_create_edu_level_table',9),(33,'2024_03_21_112000_create_grade_level_table',9),(34,'2024_03_21_154023_create_schools_table',9),(35,'2024_03_21_154026_create_session_years_table',9),(36,'2025_01_10_112325_add_subject_id_and_type_to_bank_soal_table',9),(37,'2025_01_19_000000_add_timezone_to_schools_table',9),(38,'2025_03_21_153843_create_absensi_settings_table',9),(39,'2025_03_21_153844_create_academic_calendars_table',9),(40,'2025_03_21_153845_create_accepted_file_table',9),(41,'2025_03_21_153846_create_addon_subscriptions_table',9),(42,'2025_03_21_153847_create_addons_table',9),(43,'2025_03_21_153848_create_announcement_classes_table',9),(44,'2025_03_21_153849_create_announcements_table',9),(45,'2025_03_21_153850_create_assignment_submissions_table',9),(46,'2025_03_21_153851_create_assignments_table',9),(47,'2025_03_21_153852_create_attachments_table',9),(48,'2025_03_21_153853_create_attendance_points_table',9),(49,'2025_03_21_153854_create_attendances_table',9),(50,'2025_03_21_153855_create_auto_absen_admins_table',9),(51,'2025_03_21_153856_create_bank_soal_table',9),(52,'2025_03_21_153857_create_bank_soal_detail_table',9),(53,'2025_03_21_153858_create_bank_soal_versions_table',9),(54,'2025_03_21_153859_create_categories_table',9),(55,'2025_03_21_153900_create_certificate_templates_table',9),(56,'2025_03_21_153901_create_chats_table',9),(57,'2025_03_21_153902_create_class_groups_table',9),(58,'2025_03_21_153903_create_class_sections_table',9),(59,'2025_03_21_153904_create_class_subjects_table',9),(60,'2025_03_21_153905_create_class_teachers_table',9),(61,'2025_03_21_153906_create_classes_table',9),(62,'2025_03_21_153907_create_compulsory_fees_table',9),(63,'2025_03_21_153908_create_database_backups_table',9),(64,'2025_03_21_153909_create_elective_subject_groups_table',9),(65,'2025_03_21_153910_create_exam_marks_table',9),(66,'2025_03_21_153911_create_exam_results_table',9),(67,'2025_03_21_153912_create_exam_timetables_table',9),(68,'2025_03_21_153913_create_exams_table',9),(69,'2025_03_21_153914_create_expense_categories_table',9),(70,'2025_03_21_153915_create_expenses_table',9),(71,'2025_03_21_153916_create_extra_student_datas_table',9),(72,'2025_03_21_153917_create_failed_jobs_table',9),(73,'2025_03_21_153918_create_faqs_table',9),(74,'2025_03_21_153919_create_feature_section_lists_table',9),(75,'2025_03_21_153920_create_feature_sections_table',9),(76,'2025_03_21_153921_create_features_table',9),(77,'2025_03_21_153922_create_fees_table',9),(78,'2025_03_21_153923_create_fees_advance_table',9),(79,'2025_03_21_153924_create_fees_class_types_table',9),(80,'2025_03_21_153925_create_fees_installments_table',9),(81,'2025_03_21_153926_create_fees_paids_table',9),(82,'2025_03_21_153927_create_fees_payment_types_table',9),(83,'2025_03_21_153928_create_fees_types_table',9),(84,'2025_03_21_153929_create_files_table',9),(85,'2025_03_21_153930_create_filetype_table',9),(86,'2025_03_21_153931_create_folder_bendahara_table',9),(87,'2025_03_21_153932_create_folder_humas_table',9),(88,'2025_03_21_153933_create_folder_kesiswaan_table',9),(89,'2025_03_21_153934_create_folder_kpk_table',9),(90,'2025_03_21_153935_create_folder_kpk_elin_table',9),(91,'2025_03_21_153936_create_folder_kpk_metro_table',9),(92,'2025_03_21_153937_create_folder_kpk_rpl_table',9),(93,'2025_03_21_153938_create_folder_kpk_tkj_table',9),(94,'2025_03_21_153939_create_folder_kurikulum_table',9),(95,'2025_03_21_153940_create_folder_pdsm_table',9),(96,'2025_03_21_153941_create_folder_perpus_table',9),(97,'2025_03_21_153942_create_folder_sarpas_table',9),(98,'2025_03_21_153943_create_folder_tatib_table',9),(99,'2025_03_21_153944_create_folder_tu_table',9),(100,'2025_03_21_153945_create_form_fields_table',9),(101,'2025_03_21_153946_create_galleries_table',9),(102,'2025_03_21_153947_create_grades_table',9),(103,'2025_03_21_153948_create_guardian_details_table',9),(104,'2025_03_21_153949_create_guidances_table',9),(105,'2025_03_21_153950_create_holidays_table',9),(106,'2025_03_21_153951_create_languages_table',9),(107,'2025_03_21_153952_create_leave_details_table',9),(108,'2025_03_21_153953_create_leave_masters_table',9),(109,'2025_03_21_153954_create_leaves_table',9),(110,'2025_03_21_153955_create_lesson_topics_table',9),(111,'2025_03_21_153956_create_lessons_table',9),(112,'2025_03_21_153957_create_mediums_table',9),(113,'2025_03_21_153958_create_messages_table',9),(114,'2025_03_21_153959_create_model_has_permissions_table',9),(115,'2025_03_21_154000_create_model_has_roles_table',9),(116,'2025_03_21_154001_create_notifications_table',9),(117,'2025_03_21_154002_create_online_exam_answer_not_multiple_choices_table',9),(118,'2025_03_21_154003_create_online_exam_question_choices_table',9),(119,'2025_03_21_154004_create_online_exam_question_options_table',9),(120,'2025_03_21_154005_create_online_exam_questions_table',9),(121,'2025_03_21_154006_create_online_exam_student_answers_table',9),(122,'2025_03_21_154007_create_online_exam_student_marks_table',9),(123,'2025_03_21_154008_create_online_exams_table',9),(124,'2025_03_21_154009_create_optional_fees_table',9),(125,'2025_03_21_154010_create_package_features_table',9),(126,'2025_03_21_154011_create_packages_table',9),(127,'2025_03_21_154012_create_password_resets_table',9),(128,'2025_03_21_154013_create_payment_configurations_table',9),(129,'2025_03_21_154014_create_payment_transactions_table',9),(130,'2025_03_21_154015_create_payroll_settings_table',9),(131,'2025_03_21_154016_create_permissions_table',9),(132,'2025_03_21_154017_create_personal_access_tokens_table',9),(133,'2025_03_21_154018_create_promote_students_table',9),(134,'2025_03_21_154019_create_recap_edits_table',9),(135,'2025_03_21_154020_create_role_has_permissions_table',9),(136,'2025_03_21_154021_create_roles_table',9),(137,'2025_03_21_154022_create_school_settings_table',9),(138,'2025_03_21_154024_create_sections_table',9),(139,'2025_03_21_154025_create_semesters_table',9),(140,'2025_03_21_154027_create_shifts_table',9),(141,'2025_03_21_154028_create_sliders_table',9),(142,'2025_03_21_154029_create_special_fees_table',9),(143,'2025_03_21_154030_create_staff_payrolls_table',9),(144,'2025_03_21_154031_create_staff_salaries_table',9),(145,'2025_03_21_154032_create_staff_support_schools_table',9),(146,'2025_03_21_154033_create_staffs_table',9),(147,'2025_03_21_154034_create_streams_table',9),(148,'2025_03_21_154035_create_student_online_exam_statuses_table',9),(149,'2025_03_21_154036_create_student_subjects_table',9),(150,'2025_03_21_154037_create_students_table',9),(151,'2025_03_21_154038_create_subject_attendance_students_table',9),(152,'2025_03_21_154039_create_subject_attendances_table',9),(153,'2025_03_21_154040_create_subject_teachers_table',9),(154,'2025_03_21_154041_create_subjects_table',9),(155,'2025_03_21_154042_create_subscription_bills_table',9),(156,'2025_03_21_154043_create_subscription_features_table',9),(157,'2025_03_21_154044_create_subscriptions_table',9),(158,'2025_03_21_154045_create_system_settings_table',9),(159,'2025_03_21_154046_create_tag_dokumen_bendahara_table',9),(160,'2025_03_21_154047_create_tag_dokumen_humas_table',9),(161,'2025_03_21_154048_create_tag_dokumen_kesiswaan_table',9),(162,'2025_03_21_154049_create_tag_dokumen_kpk_table',9),(163,'2025_03_21_154050_create_tag_dokumen_kpk_elin_table',9),(164,'2025_03_21_154051_create_tag_dokumen_kpk_metro_table',9),(165,'2025_03_21_154052_create_tag_dokumen_kpk_rpl_table',9),(166,'2025_03_21_154053_create_tag_dokumen_kpk_tkj_table',9),(167,'2025_03_21_154054_create_tag_dokumen_kurikulum_table',9),(168,'2025_03_21_154055_create_tag_dokumen_pdsm_table',9),(169,'2025_03_21_154056_create_tag_dokumen_perpus_table',9),(170,'2025_03_21_154057_create_tag_dokumen_sarpas_table',9),(171,'2025_03_21_154058_create_tag_dokumen_tatib_table',9),(172,'2025_03_21_154059_create_tag_dokumen_tu_table',9),(173,'2025_03_21_154100_create_timetables_table',9),(174,'2025_03_21_154101_create_upload_file_bendahara_table',9),(175,'2025_03_21_154102_create_upload_file_humas_table',9),(176,'2025_03_21_154103_create_upload_file_kesiswaan_table',9),(177,'2025_03_21_154104_create_upload_file_kpk_table',9),(178,'2025_03_21_154105_create_upload_file_kpk_elin_table',9),(179,'2025_03_21_154106_create_upload_file_kpk_metro_table',9),(180,'2025_03_21_154107_create_upload_file_kpk_rpl_table',9),(181,'2025_03_21_154108_create_upload_file_kpk_tkj_table',9),(182,'2025_03_21_154109_create_upload_file_kurikulum_table',9),(183,'2025_03_21_154110_create_upload_file_pdsm_table',9),(184,'2025_03_21_154111_create_upload_file_perpus_table',9),(185,'2025_03_21_154112_create_upload_file_sarpas_table',9),(186,'2025_03_21_154113_create_upload_file_tatib_table',9),(187,'2025_03_21_154114_create_upload_file_tu_table',9),(188,'2025_03_21_154115_create_user_status_for_next_cycles_table',9),(189,'2025_03_21_154116_create_users_table',9),(190,'2025_03_21_155714_add_foreign_key_constraints',9),(191,'2025_04_25_092206_create_recap_absensi_table',9),(192,'2025_04_29_142252_create_payment_methods_table',9),(193,'2025_06_30_123456_create_payment_history_table',9),(194,'2025_07_18_135038_add_original_class_section_id_to_recap_absensi_table',9),(195,'2025_07_19_173235_add_original_class_section_id_to_promote_students_table',9),(196,'2025_07_21_161849_add_edu_level_id_to_schools_table',9),(197,'2025_07_22_090331_add_school_id_to_grade_level_table',9),(198,'2025_07_22_101102_add_deleted_at_to_grade_level_table',9),(199,'2025_07_22_111926_add_grade_level_id_to_classes_table',9),(200,'2025_07_22_162049_add_grade_level_id_to_class_sections_table',9),(201,'2025_07_23_095441_add_grade_level_id_to_students_table',9),(202,'2025_07_23_101200_add_grade_levels_to_promote_students_table',9),(203,'2025_07_23_112929_add_original_class_section_id_to_students_table',9),(204,'2025_07_23_145441_add_session_year_id_to_class_sections_table',9),(205,'2025_07_24_100206_fill_address_and_mobile_in_student_table',9),(206,'2025_07_24_113610_fill_class_grade_data_in_students_table',9),(207,'2025_08_12_092724_add_grade_level_id_to_subject_attendances_table',9),(208,'2025_08_12_222930_add_grade_level_id_to_attendances_table',9),(209,'2025_08_12_225702_add_grade_level_id_to_exam_marks',9),(210,'2025_08_12_232512_add_grade_level_id_to_online_exams',9),(211,'2025_08_14_133248_create_original_classes_table',9),(212,'2025_08_16_171101_create_kpks_table',9),(213,'2025_08_16_171745_create_modules_table',9),(214,'2025_08_16_172629_create_document_folders_table',9),(215,'2025_08_16_173107_create_document_files_table',9),(216,'2025_08_20_093357_add_delete_at_to_kpks_table',9),(217,'2025_08_20_095255_alter_enum_add_image_choice',9),(218,'2025_08_20_095831_add_billing_disabled_columns_to_students_table',9),(219,'2025_08_20_101059_add_image_url_to_online_exam_question_options_table',9),(220,'2025_08_21_091916_add_grade_level_id_to_exams_table',9),(221,'2025_08_21_145225_add_description_to_document_files_table',9),(222,'2025_08_27_154444_add_nip_to_users_table',9),(223,'2025_08_28_112737_create_attendance_days_table',9),(224,'2025_09_03_152932_add_rejection_reason_to_payment_history_table',9),(225,'2025_09_04_143350_add_description_to_payment_methods_table',9),(226,'2025_09_08_105721_add_end_date_to_fees_table',9),(227,'2025_09_08_140102_add_staff_fk_to_absensi_settings_table',9),(228,'2025_09_09_144416_create_receipt_settings_table',9),(229,'2025_09_11_160146_add_start_date_to_fees_table',9),(230,'2025_09_12_153829_device_tokens_table',9),(231,'2025_09_29_142653_create_school_inquiries_table',9),(232,'2025_09_29_155716_create_contact_inquiries_table',9),(233,'2025_10_07_update_contact_inquiries_add_status',9),(234,'2025_10_08_160307_add_database_status_to_school_inquiries_table',9),(235,'2025_10_13_085414_create_jobs_table',9),(236,'2025_10_13_093032_add_last_backup_at_to_database_backups_table',9),(237,'2025_10_14_000001_add_trial_days_to_packages_table',9),(238,'2025_10_15_000000_create_trial_reminder_logs_table',9),(239,'2025_10_15_132256_add_type_to_contact_inquiries_table',9),(240,'2025_10_31_085727_create_estrakulikulers_table',9),(241,'2025_10_31_090447_create_eskul_timetables_table',9),(242,'2025_10_31_091106_create_eskul_details_table',9),(243,'2025_10_31_103620_create_eskul_absensis_table',9),(244,'2025_11_03_000001_add_trial_limits',9),(245,'2025_11_04_000001_remove_subscriptions_school_id_foreign_key',9),(246,'2025_11_04_105846_create_sessions_table',9),(247,'2026_01_22_100532_create_api_tokens_table',9),(248,'2026_01_22_113841_create_otp_verifications_table',9),(249,'2026_01_22_125603_add_phone_to_users_table',9),(250,'2026_01_23_103409_add_school_info_to_otp_verifications',9),(251,'2026_01_23_111500_add_phone_to_users_table',9),(252,'2026_02_02_131845_create_beginning_balance_table',9),(253,'2026_02_02_add_xendit_fields_to_schools_table',9),(254,'2026_02_02_create_xendit_invoice_fees_table',9),(255,'2026_02_02_create_xendit_invoices_table',9),(256,'2026_02_05_100100_add_payment_tracking_to_fees_table',9),(257,'2026_02_05_100200_update_payment_transactions_table',9),(258,'2026_02_18_100725_add_limit_columns_to_packages_table',9),(259,'2026_02_20_000001_sync_schema_fields',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (3,'App\\Models\\User',1),(2,'App\\Models\\User',2),(1,'App\\Models\\User',3),(1,'App\\Models\\User',4),(1,'App\\Models\\User',5),(1,'App\\Models\\User',6),(1,'App\\Models\\User',7);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'kode unik: humas, kurikulum, dll',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'nama tampil',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_module_school_code` (`school_id`,`code`),
  CONSTRAINT `modules_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_session_year_id_foreign` (`session_year_id`),
  KEY `notifications_school_id_foreign` (`school_id`),
  CONSTRAINT `notifications_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exam_answer_not_multiple_choices`
--

DROP TABLE IF EXISTS `online_exam_answer_not_multiple_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exam_answer_not_multiple_choices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_answer_correction` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exam_answer_not_multiple_choices`
--

LOCK TABLES `online_exam_answer_not_multiple_choices` WRITE;
/*!40000 ALTER TABLE `online_exam_answer_not_multiple_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exam_answer_not_multiple_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exam_question_choices`
--

DROP TABLE IF EXISTS `online_exam_question_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exam_question_choices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `online_exam_id` bigint unsigned NOT NULL,
  `question_id` bigint unsigned NOT NULL,
  `marks` int DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_exam_question_choices_school_id_foreign` (`school_id`),
  KEY `online_exam_question_choices_online_exam_id_foreign` (`online_exam_id`),
  KEY `online_exam_question_choices_question_id_foreign` (`question_id`),
  CONSTRAINT `online_exam_question_choices_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_question_choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_question_choices_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exam_question_choices`
--

LOCK TABLES `online_exam_question_choices` WRITE;
/*!40000 ALTER TABLE `online_exam_question_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exam_question_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exam_question_options`
--

DROP TABLE IF EXISTS `online_exam_question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exam_question_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint unsigned NOT NULL,
  `option` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_answer` tinyint NOT NULL COMMENT '1 - yes, 0 - no',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_exam_question_options_question_id_foreign` (`question_id`),
  KEY `online_exam_question_options_school_id_foreign` (`school_id`),
  CONSTRAINT `online_exam_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_question_options_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exam_question_options`
--

LOCK TABLES `online_exam_question_options` WRITE;
/*!40000 ALTER TABLE `online_exam_question_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exam_question_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exam_questions`
--

DROP TABLE IF EXISTS `online_exam_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exam_questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `class_subject_id` bigint unsigned NOT NULL,
  `question` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `last_edited_by` bigint unsigned NOT NULL COMMENT 'teacher_user_id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` enum('essay','short_answer','multiple_choice','true_false','numeric','image_choice') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'multiple_choice',
  PRIMARY KEY (`id`),
  KEY `online_exam_questions_school_id_foreign` (`school_id`),
  KEY `online_exam_questions_class_section_id_foreign` (`class_section_id`),
  KEY `online_exam_questions_class_subject_id_foreign` (`class_subject_id`),
  KEY `online_exam_questions_last_edited_by_foreign` (`last_edited_by`),
  CONSTRAINT `online_exam_questions_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_questions_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_questions_last_edited_by_foreign` FOREIGN KEY (`last_edited_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_questions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exam_questions`
--

LOCK TABLES `online_exam_questions` WRITE;
/*!40000 ALTER TABLE `online_exam_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exam_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exam_student_answers`
--

DROP TABLE IF EXISTS `online_exam_student_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exam_student_answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `online_exam_id` bigint unsigned NOT NULL,
  `question_id` bigint unsigned NOT NULL,
  `option_id` bigint unsigned NOT NULL,
  `submitted_date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_exam_student_answers_school_id_foreign` (`school_id`),
  KEY `online_exam_student_answers_student_id_foreign` (`student_id`),
  KEY `online_exam_student_answers_online_exam_id_foreign` (`online_exam_id`),
  KEY `online_exam_student_answers_question_id_foreign` (`question_id`),
  KEY `online_exam_student_answers_option_id_foreign` (`option_id`),
  CONSTRAINT `online_exam_student_answers_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_student_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `online_exam_question_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_student_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_question_choices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_student_answers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exam_student_answers_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exam_student_answers`
--

LOCK TABLES `online_exam_student_answers` WRITE;
/*!40000 ALTER TABLE `online_exam_student_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exam_student_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exam_student_marks`
--

DROP TABLE IF EXISTS `online_exam_student_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exam_student_marks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `online_exam_id` bigint unsigned NOT NULL,
  `marks` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_exam_student_marks_student_id_foreign` (`student_id`),
  KEY `online_exam_student_marks_online_exam_id_foreign` (`online_exam_id`),
  CONSTRAINT `online_exam_student_marks_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `online_exam_student_marks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exam_student_marks`
--

LOCK TABLES `online_exam_student_marks` WRITE;
/*!40000 ALTER TABLE `online_exam_student_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exam_student_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `online_exams`
--

DROP TABLE IF EXISTS `online_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `online_exams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `grade_level_id` bigint unsigned DEFAULT NULL,
  `class_subject_id` bigint unsigned NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_key` bigint NOT NULL,
  `duration` int NOT NULL COMMENT 'in minutes',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `online_exams_school_id_foreign` (`school_id`),
  KEY `online_exams_class_section_id_foreign` (`class_section_id`),
  KEY `online_exams_class_subject_id_foreign` (`class_subject_id`),
  KEY `online_exams_session_year_id_foreign` (`session_year_id`),
  KEY `idx_online_exams_grade_level_id` (`grade_level_id`),
  CONSTRAINT `online_exams_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exams_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exams_fk_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `online_exams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `online_exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `online_exams`
--

LOCK TABLES `online_exams` WRITE;
/*!40000 ALTER TABLE `online_exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `online_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optional_fees`
--

DROP TABLE IF EXISTS `optional_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optional_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `class_id` bigint unsigned NOT NULL,
  `payment_transaction_id` bigint unsigned DEFAULT NULL,
  `fees_class_id` bigint unsigned DEFAULT NULL,
  `mode` enum('Cash','Cheque','Online') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cheque_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `fees_paid_id` bigint unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `status` enum('Success','Pending','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `optional_fees_school_id_foreign` (`school_id`),
  KEY `optional_fees_student_id_foreign` (`student_id`),
  KEY `optional_fees_class_id_foreign` (`class_id`),
  KEY `optional_fees_payment_transaction_id_foreign` (`payment_transaction_id`),
  KEY `optional_fees_fees_paid_id_foreign` (`fees_paid_id`),
  KEY `optional_fees_fees_class_id_foreign` (`fees_class_id`),
  CONSTRAINT `optional_fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `optional_fees_fees_class_id_foreign` FOREIGN KEY (`fees_class_id`) REFERENCES `fees_class_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `optional_fees_fees_paid_id_foreign` FOREIGN KEY (`fees_paid_id`) REFERENCES `fees_paids` (`id`) ON DELETE CASCADE,
  CONSTRAINT `optional_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `optional_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `optional_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optional_fees`
--

LOCK TABLES `optional_fees` WRITE;
/*!40000 ALTER TABLE `optional_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `optional_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `original_classes`
--

DROP TABLE IF EXISTS `original_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `original_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `original_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `class_id` bigint unsigned DEFAULT NULL,
  `class_section_id` bigint unsigned DEFAULT NULL,
  `session_year_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned DEFAULT NULL,
  `admission_no` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roll_number` int unsigned DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `student_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `original_classes_user_id_foreign` (`user_id`),
  KEY `original_classes_class_id_foreign` (`class_id`),
  KEY `original_classes_class_section_id_foreign` (`class_section_id`),
  KEY `oc_sess_cls_idx` (`session_year_id`,`class_section_id`),
  KEY `oc_student_sess_idx` (`student_id`,`session_year_id`),
  KEY `oc_original_key_idx` (`original_key`),
  CONSTRAINT `original_classes_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `original_classes_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE SET NULL,
  CONSTRAINT `original_classes_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL,
  CONSTRAINT `original_classes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `original_classes`
--

LOCK TABLES `original_classes` WRITE;
/*!40000 ALTER TABLE `original_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `original_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_verifications`
--

DROP TABLE IF EXISTS `otp_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` int DEFAULT NULL,
  `school_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_verifications`
--

LOCK TABLES `otp_verifications` WRITE;
/*!40000 ALTER TABLE `otp_verifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_verifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_features`
--

DROP TABLE IF EXISTS `package_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `package_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`package_id`,`feature_id`),
  KEY `package_features_package_id_index` (`package_id`),
  KEY `package_features_feature_id_index` (`feature_id`),
  CONSTRAINT `package_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  CONSTRAINT `package_features_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_features`
--

LOCK TABLES `package_features` WRITE;
/*!40000 ALTER TABLE `package_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_charge` double(8,2) NOT NULL,
  `staff_charge` double(8,2) NOT NULL,
  `days` int NOT NULL DEFAULT '1',
  `type` int NOT NULL DEFAULT '1' COMMENT '0 => Prepaid, 1 => Postpaid',
  `no_of_students` int NOT NULL DEFAULT '0',
  `no_of_staffs` int NOT NULL DEFAULT '0',
  `charges` double(8,2) NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Unpublished, 1 => Published',
  `is_trial` int NOT NULL DEFAULT '0',
  `student_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum students allowed. -1 = unlimited, 0 = use system default',
  `staff_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum staff allowed. -1 = unlimited, 0 = use system default',
  `class_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum classes allowed. -1 = unlimited, 0 = use system default',
  `subject_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum subjects allowed. -1 = unlimited, 0 = use system default',
  `announcement_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum announcements per month. -1 = unlimited, 0 = use system default',
  `assignment_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum assignments per month. -1 = unlimited, 0 = use system default',
  `exam_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum exams per month. -1 = unlimited, 0 = use system default',
  `holiday_limit` int NOT NULL DEFAULT '0' COMMENT 'Maximum holidays per year. -1 = unlimited, 0 = use system default',
  `features_json` text COLLATE utf8mb4_unicode_ci COMMENT 'JSON array of allowed features for this package',
  `trial_days` int NOT NULL DEFAULT '14',
  `highlight` tinyint NOT NULL DEFAULT '0' COMMENT '0 => No, 1 => Yes',
  `rank` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_configurations`
--

DROP TABLE IF EXISTS `payment_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_configurations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `webhook_secret_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 - Disabled, 1 - Enabled',
  `school_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_configurations_school_id_foreign` (`school_id`),
  CONSTRAINT `payment_configurations_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_configurations`
--

LOCK TABLES `payment_configurations` WRITE;
/*!40000 ALTER TABLE `payment_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `fees_id` bigint unsigned NOT NULL,
  `status` enum('pending','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `rejection_reason` text COLLATE utf8mb4_unicode_ci,
  `amount` decimal(21,2) NOT NULL,
  `proof_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `payment_method_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_history_user_id_index` (`user_id`),
  KEY `payment_history_student_id_index` (`student_id`),
  KEY `payment_history_fees_id_index` (`fees_id`),
  KEY `payment_history_payment_method_id_index` (`payment_method_id`),
  CONSTRAINT `payment_history_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`),
  CONSTRAINT `payment_history_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `payment_history_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `payment_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_holder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transactions`
--

DROP TABLE IF EXISTS `payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `amount` double(64,2) NOT NULL,
  `payment_gateway` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'order_id / payment_intent_id',
  `payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_signature` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('failed','succeed','pending') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee_ids` json DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL,
  `confirmed_by` bigint unsigned DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_transactions_transaction_id_unique` (`transaction_id`),
  KEY `payment_transactions_school_id_foreign` (`school_id`),
  KEY `payment_transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `payment_transactions_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transactions`
--

LOCK TABLES `payment_transactions` WRITE;
/*!40000 ALTER TABLE `payment_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll_settings`
--

DROP TABLE IF EXISTS `payroll_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double DEFAULT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payroll_settings_school_id_foreign` (`school_id`),
  CONSTRAINT `payroll_settings_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll_settings`
--

LOCK TABLES `payroll_settings` WRITE;
/*!40000 ALTER TABLE `payroll_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'role-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(2,'role-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(3,'role-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(4,'role-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(5,'language-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(6,'language-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(7,'language-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(8,'language-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(9,'schools-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(10,'schools-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(11,'schools-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(12,'schools-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(13,'package-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(14,'package-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(15,'package-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(16,'package-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(17,'addons-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(18,'addons-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(19,'addons-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(20,'addons-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(21,'guidance-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(22,'guidance-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(23,'guidance-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(24,'guidance-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(25,'system-setting-manage','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(26,'fcm-setting-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(27,'email-setting-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(28,'privacy-policy','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(29,'contact-us','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(30,'about-us','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(31,'terms-condition','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(32,'app-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(33,'subscription-view','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(34,'staff-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(35,'staff-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(36,'staff-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(37,'staff-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(38,'faqs-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(39,'faqs-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(40,'faqs-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(41,'faqs-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(42,'fcm-setting-manage','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(43,'front-site-setting','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(44,'assignment-monitoring','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(45,'payment-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(46,'subscription-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(47,'subscription-change-bills','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(48,'school-terms-condition','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(49,'subscription-bill-payment','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(50,'web-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(51,'email-template','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(52,'custom-school-email','web','2026-02-24 04:05:00','2026-02-24 04:11:04');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promote_students`
--

DROP TABLE IF EXISTS `promote_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promote_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `original_class_section_id` bigint unsigned DEFAULT NULL,
  `from_grade_level_id` bigint unsigned DEFAULT NULL,
  `to_grade_level_id` bigint unsigned DEFAULT NULL,
  `class_section_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `result` tinyint NOT NULL DEFAULT '1' COMMENT '1=>Pass,0=>fail',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=>continue,0=>leave',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_columns` (`student_id`,`class_section_id`,`session_year_id`),
  KEY `promote_students_school_id_foreign` (`school_id`),
  KEY `promote_students_class_section_id_foreign` (`class_section_id`),
  KEY `promote_students_session_year_id_foreign` (`session_year_id`),
  KEY `idx_original_class_section_id` (`original_class_section_id`),
  KEY `promote_students_from_grade_level_id_foreign` (`from_grade_level_id`),
  KEY `promote_students_to_grade_level_id_foreign` (`to_grade_level_id`),
  CONSTRAINT `promote_students_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promote_students_from_grade_level_id_foreign` FOREIGN KEY (`from_grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `promote_students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promote_students_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promote_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `promote_students_to_grade_level_id_foreign` FOREIGN KEY (`to_grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ps_fk_original_class_section` FOREIGN KEY (`original_class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promote_students`
--

LOCK TABLES `promote_students` WRITE;
/*!40000 ALTER TABLE `promote_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `promote_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recap_absensi`
--

DROP TABLE IF EXISTS `recap_absensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recap_absensi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `thbln` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_section_id` bigint unsigned NOT NULL,
  `original_class_section_id` bigint unsigned DEFAULT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `t1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t4` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t5` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t6` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t7` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t8` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t9` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t10` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t11` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t12` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t13` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t14` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t15` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t16` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t17` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t18` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t19` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t20` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t21` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t22` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t23` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t24` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t25` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t26` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t27` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t28` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t29` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t30` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t31` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recap_absensi_student_id_foreign` (`student_id`),
  KEY `recap_absensi_class_section_id_foreign` (`class_section_id`),
  KEY `recap_absensi_session_year_id_foreign` (`session_year_id`),
  KEY `idx_original_class_section_id` (`original_class_section_id`),
  CONSTRAINT `fk_original_class_section` FOREIGN KEY (`original_class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE SET NULL,
  CONSTRAINT `recap_absensi_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recap_absensi_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recap_absensi_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recap_absensi`
--

LOCK TABLES `recap_absensi` WRITE;
/*!40000 ALTER TABLE `recap_absensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `recap_absensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recap_edits`
--

DROP TABLE IF EXISTS `recap_edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recap_edits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject_attendance_id` bigint unsigned NOT NULL,
  `subject_attendance_student_id` bigint unsigned NOT NULL,
  `text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recap_edits_subject_attendance_id_foreign` (`subject_attendance_id`),
  KEY `recap_edits_subject_attendance_student_id_foreign` (`subject_attendance_student_id`),
  CONSTRAINT `recap_edits_subject_attendance_id_foreign` FOREIGN KEY (`subject_attendance_id`) REFERENCES `subject_attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recap_edits_subject_attendance_student_id_foreign` FOREIGN KEY (`subject_attendance_student_id`) REFERENCES `subject_attendance_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recap_edits`
--

LOCK TABLES `recap_edits` WRITE;
/*!40000 ALTER TABLE `recap_edits` DISABLE KEYS */;
/*!40000 ALTER TABLE `recap_edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_settings`
--

DROP TABLE IF EXISTS `receipt_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `receipt_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm',
  `receipt_print_mode` enum('none','confirm','auto') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'confirm',
  `receipt_logo_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_header_html` text COLLATE utf8mb4_unicode_ci,
  `receipt_footer_html` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `receipt_settings_school_id_unique` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_settings`
--

LOCK TABLES `receipt_settings` WRITE;
/*!40000 ALTER TABLE `receipt_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(44,1),(46,1),(47,1),(48,1),(49,1),(50,1),(52,1);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned DEFAULT NULL,
  `custom_role` tinyint(1) NOT NULL DEFAULT '1',
  `editable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_school_id_unique` (`name`,`guard_name`,`school_id`),
  KEY `roles_school_id_foreign` (`school_id`),
  CONSTRAINT `roles_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Admin','web',NULL,0,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(2,'Teacher','web',NULL,1,1,'2026-02-24 04:05:01','2026-02-24 04:05:01'),(3,'School Admin','web',NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_inquiries`
--

DROP TABLE IF EXISTS `school_inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_inquiries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_proof` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` enum('pending','verified','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `database_status` enum('not_created','creating','created','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_created',
  `database_created_at` timestamp NULL DEFAULT NULL,
  `database_error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_inquiries_school_email_unique` (`school_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_inquiries`
--

LOCK TABLES `school_inquiries` WRITE;
/*!40000 ALTER TABLE `school_inquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_settings`
--

DROP TABLE IF EXISTS `school_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'datatype like string , file etc',
  `school_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_settings_name_school_id_unique` (`name`,`school_id`),
  KEY `school_settings_school_id_foreign` (`school_id`),
  CONSTRAINT `school_settings_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_settings`
--

LOCK TABLES `school_settings` WRITE;
/*!40000 ALTER TABLE `school_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schools` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `support_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint unsigned DEFAULT NULL COMMENT 'user_id',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Deactivate, 1 => Active',
  `trial_start_date` timestamp NULL DEFAULT NULL COMMENT 'When trial period started (when school was activated)',
  `trial_end_date` timestamp NULL DEFAULT NULL COMMENT 'When trial period ends (trial_start_date + 14 days)',
  `is_trial` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Whether school is in trial mode',
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Jakarta' COMMENT 'Timezone untuk setiap school/tenant',
  `edu_level_id` bigint unsigned DEFAULT NULL,
  `domain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `xendit_api_key_test` text COLLATE utf8mb4_unicode_ci,
  `xendit_api_key_live` text COLLATE utf8mb4_unicode_ci,
  `xendit_callback_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `xendit_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `payment_mode` enum('manual','xendit','both') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual',
  PRIMARY KEY (`id`),
  KEY `schools_admin_id_foreign` (`admin_id`),
  KEY `fk_schools_edu_level` (`edu_level_id`),
  CONSTRAINT `fk_schools_edu_level` FOREIGN KEY (`edu_level_id`) REFERENCES `edu_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `schools_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'SMK Negeri 8 Malang','Malang','081234567890','adminsmk8malang@gmail.com','Excellent School','logo.png',1,1,NULL,NULL,1,'Asia/Jakarta',NULL,NULL,'eschool-7-smkn8malang',NULL,'2026-02-24 04:05:01','2026-02-24 04:19:13',NULL,NULL,NULL,NULL,0,'manual');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_school_id_foreign` (`school_id`),
  CONSTRAINT `sections_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semesters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_month` tinyint NOT NULL,
  `end_month` tinyint NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `semesters_school_id_foreign` (`school_id`),
  CONSTRAINT `semesters_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_years`
--

DROP TABLE IF EXISTS `session_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_years` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_years_name_school_id_unique` (`name`,`school_id`),
  KEY `session_years_school_id_foreign` (`school_id`),
  CONSTRAINT `session_years_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_years`
--

LOCK TABLES `session_years` WRITE;
/*!40000 ALTER TABLE `session_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shifts_school_id_foreign` (`school_id`),
  CONSTRAINT `shifts_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1' COMMENT '1 => App, 2 => web, 3 => Both',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_school_id_foreign` (`school_id`),
  CONSTRAINT `sliders_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_fees`
--

DROP TABLE IF EXISTS `special_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `special_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `fees_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `discount` decimal(8,2) NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `special_fees_student_id_foreign` (`student_id`),
  KEY `special_fees_fees_id_foreign` (`fees_id`),
  KEY `special_fees_school_id_foreign` (`school_id`),
  CONSTRAINT `special_fees_fees_id_foreign` FOREIGN KEY (`fees_id`) REFERENCES `fees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_fees_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `special_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_fees`
--

LOCK TABLES `special_fees` WRITE;
/*!40000 ALTER TABLE `special_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `special_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_payrolls`
--

DROP TABLE IF EXISTS `staff_payrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_payrolls` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expense_id` bigint unsigned DEFAULT NULL,
  `payroll_setting_id` bigint unsigned DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids` (`expense_id`,`payroll_setting_id`),
  KEY `staff_payrolls_payroll_setting_id_foreign` (`payroll_setting_id`),
  KEY `staff_payrolls_school_id_foreign` (`school_id`),
  CONSTRAINT `staff_payrolls_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_payrolls_payroll_setting_id_foreign` FOREIGN KEY (`payroll_setting_id`) REFERENCES `payroll_settings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_payrolls_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_payrolls`
--

LOCK TABLES `staff_payrolls` WRITE;
/*!40000 ALTER TABLE `staff_payrolls` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_payrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_salaries`
--

DROP TABLE IF EXISTS `staff_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint unsigned DEFAULT NULL,
  `payroll_setting_id` bigint unsigned DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids` (`staff_id`,`payroll_setting_id`),
  KEY `staff_salaries_payroll_setting_id_foreign` (`payroll_setting_id`),
  CONSTRAINT `staff_salaries_payroll_setting_id_foreign` FOREIGN KEY (`payroll_setting_id`) REFERENCES `payroll_settings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_salaries_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_salaries`
--

LOCK TABLES `staff_salaries` WRITE;
/*!40000 ALTER TABLE `staff_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_support_schools`
--

DROP TABLE IF EXISTS `staff_support_schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_support_schools` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_school` (`user_id`,`school_id`),
  KEY `staff_support_schools_school_id_foreign` (`school_id`),
  CONSTRAINT `staff_support_schools_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `staff_support_schools_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_support_schools`
--

LOCK TABLES `staff_support_schools` WRITE;
/*!40000 ALTER TABLE `staff_support_schools` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_support_schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `qualification` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double NOT NULL DEFAULT '0',
  `joining_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffs_user_id_foreign` (`user_id`),
  CONSTRAINT `staffs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,2,'Teacher',5000000,NULL,'2026-02-24 04:05:01','2026-02-24 04:05:01');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `streams_school_id_foreign` (`school_id`),
  CONSTRAINT `streams_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_online_exam_statuses`
--

DROP TABLE IF EXISTS `student_online_exam_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_online_exam_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `online_exam_id` bigint unsigned NOT NULL,
  `status` tinyint NOT NULL COMMENT '1 - in progress 2 - completed',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_online_exam_statuses_school_id_foreign` (`school_id`),
  KEY `student_online_exam_statuses_student_id_foreign` (`student_id`),
  KEY `student_online_exam_statuses_online_exam_id_foreign` (`online_exam_id`),
  CONSTRAINT `student_online_exam_statuses_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_online_exam_statuses_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_online_exam_statuses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_online_exam_statuses`
--

LOCK TABLES `student_online_exam_statuses` WRITE;
/*!40000 ALTER TABLE `student_online_exam_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_online_exam_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_subjects`
--

DROP TABLE IF EXISTS `student_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint unsigned NOT NULL,
  `class_section_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_subjects_school_id_foreign` (`school_id`),
  KEY `student_subjects_student_id_foreign` (`student_id`),
  KEY `student_subjects_class_subject_id_foreign` (`class_subject_id`),
  KEY `student_subjects_class_section_id_foreign` (`class_section_id`),
  KEY `student_subjects_session_year_id_foreign` (`session_year_id`),
  CONSTRAINT `student_subjects_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subjects_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subjects_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subjects_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_subjects`
--

LOCK TABLES `student_subjects` WRITE;
/*!40000 ALTER TABLE `student_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned DEFAULT NULL,
  `class_section_id` bigint unsigned DEFAULT NULL,
  `billing_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `billing_disabled_at` timestamp NULL DEFAULT NULL,
  `billing_disabled_reason` text COLLATE utf8mb4_unicode_ci,
  `original_class_section_id` bigint unsigned DEFAULT NULL,
  `grade_level_id` bigint unsigned DEFAULT NULL,
  `application_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'offline',
  `admission_no` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_number` int DEFAULT NULL,
  `admission_date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `application_status` int DEFAULT '1' COMMENT '1- accepted, 0- rejected',
  `guardian_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_school_id_foreign` (`school_id`),
  KEY `students_user_id_foreign` (`user_id`),
  KEY `students_class_section_id_foreign` (`class_section_id`),
  KEY `students_guardian_id_foreign` (`guardian_id`),
  KEY `students_session_year_id_foreign` (`session_year_id`),
  KEY `students_class_id_foreign` (`class_id`),
  KEY `students_grade_level_id_foreign` (`grade_level_id`),
  KEY `students_original_class_section_id_foreign` (`original_class_section_id`),
  KEY `idx_students_billing_disabled` (`billing_disabled`),
  CONSTRAINT `students_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_guardian_id_foreign` FOREIGN KEY (`guardian_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_original_class_section_id_foreign` FOREIGN KEY (`original_class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE SET NULL,
  CONSTRAINT `students_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_attendance_students`
--

DROP TABLE IF EXISTS `subject_attendance_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_attendance_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject_attendance_id` bigint unsigned NOT NULL COMMENT 'subject_attendance_id',
  `student_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `type` tinyint NOT NULL COMMENT '0=Absent, 1=Present',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_attendance_students_subject_attendance_id_foreign` (`subject_attendance_id`),
  KEY `subject_attendance_students_student_id_foreign` (`student_id`),
  CONSTRAINT `subject_attendance_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_attendance_students_subject_attendance_id_foreign` FOREIGN KEY (`subject_attendance_id`) REFERENCES `subject_attendances` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_attendance_students`
--

LOCK TABLES `subject_attendance_students` WRITE;
/*!40000 ALTER TABLE `subject_attendance_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_attendance_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_attendances`
--

DROP TABLE IF EXISTS `subject_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `grade_level_id` bigint unsigned NOT NULL,
  `session_year_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `timetable_id` bigint unsigned NOT NULL,
  `jumlah_jp` int NOT NULL,
  `materi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lampiran` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_attendances_class_section_id_foreign` (`class_section_id`),
  KEY `subject_attendances_session_year_id_foreign` (`session_year_id`),
  KEY `subject_attendances_school_id_foreign` (`school_id`),
  KEY `subject_attendances_timetable_id_foreign` (`timetable_id`),
  KEY `subject_attendances_grade_level_id_foreign` (`grade_level_id`),
  CONSTRAINT `subject_attendances_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_attendances_grade_level_id_foreign` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_level` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_attendances_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_attendances_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_attendances_timetable_id_foreign` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_attendances`
--

LOCK TABLES `subject_attendances` WRITE;
/*!40000 ALTER TABLE `subject_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_teachers`
--

DROP TABLE IF EXISTS `subject_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_section_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned NOT NULL,
  `teacher_id` bigint unsigned NOT NULL COMMENT 'user_id',
  `class_subject_id` bigint unsigned NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids` (`class_section_id`,`class_subject_id`,`teacher_id`),
  KEY `subject_teachers_school_id_foreign` (`school_id`),
  KEY `subject_teachers_subject_id_foreign` (`subject_id`),
  KEY `subject_teachers_teacher_id_foreign` (`teacher_id`),
  KEY `subject_teachers_class_subject_id_foreign` (`class_subject_id`),
  CONSTRAINT `subject_teachers_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_teachers_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_teachers_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_teachers_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_teachers_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_teachers`
--

LOCK TABLES `subject_teachers` WRITE;
/*!40000 ALTER TABLE `subject_teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` bigint unsigned NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Theory / Practical',
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subjects_school_id_foreign` (`school_id`),
  KEY `subjects_medium_id_foreign` (`medium_id`),
  CONSTRAINT `subjects_medium_id_foreign` FOREIGN KEY (`medium_id`) REFERENCES `mediums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subjects_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_bills`
--

DROP TABLE IF EXISTS `subscription_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_bills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(64,4) NOT NULL,
  `total_student` bigint NOT NULL,
  `total_staff` bigint NOT NULL,
  `payment_transaction_id` bigint unsigned DEFAULT NULL,
  `due_date` date NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_bill` (`subscription_id`,`school_id`),
  KEY `subscription_bills_school_id_foreign` (`school_id`),
  KEY `subscription_bills_payment_transaction_id_foreign` (`payment_transaction_id`),
  CONSTRAINT `subscription_bills_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscription_bills_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscription_bills_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_bills`
--

LOCK TABLES `subscription_bills` WRITE;
/*!40000 ALTER TABLE `subscription_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_features`
--

DROP TABLE IF EXISTS `subscription_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`subscription_id`,`feature_id`),
  KEY `subscription_features_feature_id_foreign` (`feature_id`),
  CONSTRAINT `subscription_features_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscription_features_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_features`
--

LOCK TABLES `subscription_features` WRITE;
/*!40000 ALTER TABLE `subscription_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_charge` double(8,4) NOT NULL,
  `staff_charge` double(8,4) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `package_type` int NOT NULL DEFAULT '1' COMMENT '0 => Prepaid, 1 => Postpaid',
  `no_of_students` int NOT NULL DEFAULT '0',
  `no_of_staffs` int NOT NULL DEFAULT '0',
  `charges` double(64,4) NOT NULL DEFAULT '0.0000',
  `billing_cycle` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_school_id_foreign` (`school_id`),
  KEY `subscriptions_package_id_foreign` (`package_id`),
  CONSTRAINT `subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'datatype like string , file etc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_settings_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` VALUES (1,'time_zone','Asia/Kolkata','string'),(2,'date_format','d-m-Y','date'),(3,'time_format','h:i A','time'),(4,'theme_color','#d22f3c','string'),(5,'session_year','1','string'),(6,'system_version','1.4.1','string'),(7,'email_verified','0','boolean'),(8,'subscription_alert','7','integer'),(9,'currency_code','USD','string'),(10,'currency_symbol','$','string'),(11,'additional_billing_days','5','integer'),(12,'system_name','eSchool - Software Manajemen Sekolah','string'),(13,'system_email','admin@eschool.com','string'),(14,'address','Ruko Modern Kav A16-A17, Jl Loncat Indah, Tasikmadu, Kota Malang 65143','string'),(15,'billing_cycle_in_days','30','integer'),(16,'current_plan_expiry_warning_days','7','integer'),(17,'front_site_theme_color','#d22f3c','text'),(18,'primary_color','#d22f3c','text'),(19,'secondary_color','#d22f3c','text'),(20,'short_description','eSchool UBIG: Solusi digital modern untuk manajemen sekolah, dengan fitur lengkap, tampilan menarik, dan kemudahan penggunaan. Tingkatkan kualitas pendidikan dan efisiensi sekolah Anda bersama kami!','text'),(21,'facebook','','text'),(22,'instagram','','text'),(23,'linkedin','','text'),(24,'footer_text','<p>&copy;&nbsp;<strong>UBIG</strong>. All Rights Reserved</p>','text'),(25,'tagline','Transformasi Digital Sekolah Anda Bersama UBIG!','text'),(26,'super_admin_name','Super Admin','text'),(27,'support_email','suratkita@gmail.com','text'),(28,'mobile','0812-1212-2388','text'),(29,'hero_title_1','eSchool memberikan pengalaman baru yang lebih menyenangkan','text'),(30,'hero_title_2','Layanan Terbaik','text'),(31,'about_us_title','eSchool - Software Manajemen Sekolah','text'),(32,'about_us_heading','Platform Manajemen Sekolah Terbaik','text'),(33,'about_us_description','eSchool adalah solusi manajemen sekolah digital terdepan di Indonesia. Dengan fitur lengkap, tampilan modern, dan kemudahan penggunaan, eSchool membantu sekolah mengelola seluruh aktivitas akademik dan non-akademik secara efisien.','text'),(34,'about_us_points','Harga terjangkau,Mudah dikelola panel admin,Keamanan data terjamin','text'),(35,'custom_package_status','1','text'),(36,'custom_package_description','Sesuaikan kebutuhan sekolah Anda dengan paket khusus dari UBIG. Layanan personal dan solusi fleksibel untuk setiap kebutuhan unik.','text'),(37,'download_our_app_description','Bergabunglah bersama UBIG dan nikmati kemudahan manajemen sekolah digital. Tingkatkan efisiensi, kolaborasi, dan akses informasi di mana saja dan kapan saja.','text'),(38,'theme_primary_color','#d22f3c','text'),(39,'theme_secondary_color','#d22f3c','text'),(40,'theme_secondary_color_1','#d22f3c','text'),(41,'theme_primary_background_color','#f2f5f7','text'),(42,'theme_text_secondary_color','#5c788c','text'),(43,'tag_line','Diakses sekolah, siswa dan orangtua','text'),(44,'hero_description','Software manajemen sekolah terbaik dan termurah di Indonesia. Fitur lengkap dan sesuai kebutuhan. Tampilan menarik dan mudah digunakan. Keamanan data terjamin.','text'),(45,'display_school_logos','1','text'),(46,'display_counters','1','text'),(47,'email_template_school_registration','&lt;p&gt;Yth. {school_admin_name},&lt;/p&gt;&lt;p&gt;Selamat datang di {system_name}!&lt;/p&gt;&lt;p&gt;Kami sangat senang Anda bergabung dalam komunitas pendidikan UBIG. Berikut detail pendaftaran Anda untuk mengakses sistem:&lt;/p&gt;&lt;hr&gt;&lt;p&gt;&lt;strong&gt;Nama Sekolah:&lt;/strong&gt; {school_name}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;URL Sistem:&lt;/strong&gt; {url}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Akun Login Anda:&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;Email:&lt;/strong&gt; {email}&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Password:&lt;/strong&gt; {password}&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Kode Sekolah:&lt;/strong&gt; {school_code}&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;strong&gt;Langkah-langkah untuk menyelesaikan pendaftaran:&lt;/strong&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Klik URL sistem di atas.&lt;/li&gt;&lt;li&gt;Masukkan email dan password Anda.&lt;/li&gt;&lt;li&gt;Ikuti instruksi untuk melengkapi profil Anda.&lt;/li&gt;&lt;/ol&gt;&lt;p&gt;&lt;strong&gt;Penting:&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Demi keamanan, segera ganti password Anda setelah login pertama.&lt;/li&gt;&lt;li&gt;Jika mengalami kendala saat pendaftaran, silakan hubungi tim dukungan kami di {support_email} atau {contact}.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Terima kasih telah memilih {system_name}. Kami berkomitmen memberikan solusi pendidikan terbaik untuk Anda.&lt;/p&gt;&lt;p&gt;Salam hangat,&lt;/p&gt;&lt;p&gt;{super_admin_name}&lt;br&gt;{system_name}&lt;br&gt;{support_email}&lt;br&gt;{url}&lt;/p&gt;','text'),(48,'mail_send_from','','string'),(82,'favicon','http://127.0.0.1:8000/assets/favicon-icon.png',NULL);
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_bendahara`
--

DROP TABLE IF EXISTS `tag_dokumen_bendahara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_bendahara` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_bendahara`
--

LOCK TABLES `tag_dokumen_bendahara` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_bendahara` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_bendahara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_humas`
--

DROP TABLE IF EXISTS `tag_dokumen_humas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_humas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_humas`
--

LOCK TABLES `tag_dokumen_humas` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_humas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_humas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kesiswaan`
--

DROP TABLE IF EXISTS `tag_dokumen_kesiswaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kesiswaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kesiswaan`
--

LOCK TABLES `tag_dokumen_kesiswaan` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kesiswaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kesiswaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kpk`
--

DROP TABLE IF EXISTS `tag_dokumen_kpk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kpk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kpk`
--

LOCK TABLES `tag_dokumen_kpk` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kpk` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kpk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kpk_elin`
--

DROP TABLE IF EXISTS `tag_dokumen_kpk_elin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kpk_elin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kpk_elin`
--

LOCK TABLES `tag_dokumen_kpk_elin` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kpk_elin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kpk_elin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kpk_metro`
--

DROP TABLE IF EXISTS `tag_dokumen_kpk_metro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kpk_metro` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kpk_metro`
--

LOCK TABLES `tag_dokumen_kpk_metro` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kpk_metro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kpk_metro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kpk_rpl`
--

DROP TABLE IF EXISTS `tag_dokumen_kpk_rpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kpk_rpl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kpk_rpl`
--

LOCK TABLES `tag_dokumen_kpk_rpl` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kpk_rpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kpk_rpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kpk_tkj`
--

DROP TABLE IF EXISTS `tag_dokumen_kpk_tkj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kpk_tkj` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kpk_tkj`
--

LOCK TABLES `tag_dokumen_kpk_tkj` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kpk_tkj` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kpk_tkj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_kurikulum`
--

DROP TABLE IF EXISTS `tag_dokumen_kurikulum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_kurikulum` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_kurikulum`
--

LOCK TABLES `tag_dokumen_kurikulum` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_kurikulum` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_kurikulum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_pdsm`
--

DROP TABLE IF EXISTS `tag_dokumen_pdsm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_pdsm` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_pdsm`
--

LOCK TABLES `tag_dokumen_pdsm` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_pdsm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_pdsm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_perpus`
--

DROP TABLE IF EXISTS `tag_dokumen_perpus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_perpus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_perpus`
--

LOCK TABLES `tag_dokumen_perpus` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_perpus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_perpus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_sarpas`
--

DROP TABLE IF EXISTS `tag_dokumen_sarpas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_sarpas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_sarpas`
--

LOCK TABLES `tag_dokumen_sarpas` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_sarpas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_sarpas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_tatib`
--

DROP TABLE IF EXISTS `tag_dokumen_tatib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_tatib` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_tatib`
--

LOCK TABLES `tag_dokumen_tatib` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_tatib` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_tatib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_dokumen_tu`
--

DROP TABLE IF EXISTS `tag_dokumen_tu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_dokumen_tu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_dokumen_tu`
--

LOCK TABLES `tag_dokumen_tu` WRITE;
/*!40000 ALTER TABLE `tag_dokumen_tu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_dokumen_tu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tennant`
--

DROP TABLE IF EXISTS `tennant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tennant` (
  `user_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`database_name`),
  UNIQUE KEY `email_database_unique` (`email`,`database_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tennant`
--

LOCK TABLES `tennant` WRITE;
/*!40000 ALTER TABLE `tennant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tennant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetables`
--

DROP TABLE IF EXISTS `timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject_teacher_id` bigint unsigned DEFAULT NULL,
  `class_section_id` bigint unsigned NOT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Lecture','Break') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_id` bigint unsigned DEFAULT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetables_subject_teacher_id_foreign` (`subject_teacher_id`),
  KEY `timetables_school_id_foreign` (`school_id`),
  KEY `timetables_class_section_id_foreign` (`class_section_id`),
  KEY `timetables_subject_id_foreign` (`subject_id`),
  KEY `timetables_semester_id_foreign` (`semester_id`),
  CONSTRAINT `timetables_class_section_id_foreign` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timetables_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timetables_semester_id_foreign` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timetables_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timetables_subject_teacher_id_foreign` FOREIGN KEY (`subject_teacher_id`) REFERENCES `subject_teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetables`
--

LOCK TABLES `timetables` WRITE;
/*!40000 ALTER TABLE `timetables` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trial_reminder_logs`
--

DROP TABLE IF EXISTS `trial_reminder_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trial_reminder_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `days_left` int unsigned NOT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trial_reminder_logs_subscription_id_days_left_unique` (`subscription_id`,`days_left`),
  CONSTRAINT `trial_reminder_logs_subscription_id_foreign` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trial_reminder_logs`
--

LOCK TABLES `trial_reminder_logs` WRITE;
/*!40000 ALTER TABLE `trial_reminder_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `trial_reminder_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_bendahara`
--

DROP TABLE IF EXISTS `upload_file_bendahara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_bendahara` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_bendahara` (`id_tag`),
  KEY `fk_folder_bendahara` (`id_folder`),
  CONSTRAINT `fk_folder_bendahara` FOREIGN KEY (`id_folder`) REFERENCES `folder_bendahara` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_bendahara` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_bendahara` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_bendahara_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_bendahara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_bendahara_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_bendahara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_bendahara`
--

LOCK TABLES `upload_file_bendahara` WRITE;
/*!40000 ALTER TABLE `upload_file_bendahara` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_bendahara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_humas`
--

DROP TABLE IF EXISTS `upload_file_humas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_humas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_humas` (`id_tag`),
  KEY `fk_folder_humas` (`id_folder`),
  CONSTRAINT `fk_folder_humas` FOREIGN KEY (`id_folder`) REFERENCES `folder_humas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_humas` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_humas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_humas_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_humas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_humas_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_humas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_humas`
--

LOCK TABLES `upload_file_humas` WRITE;
/*!40000 ALTER TABLE `upload_file_humas` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_humas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kesiswaan`
--

DROP TABLE IF EXISTS `upload_file_kesiswaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kesiswaan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `pengunggah` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modifikasi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `upload_file_kesiswaan_id_tag_foreign` (`id_tag`),
  CONSTRAINT `upload_file_kesiswaan_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kesiswaan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kesiswaan`
--

LOCK TABLES `upload_file_kesiswaan` WRITE;
/*!40000 ALTER TABLE `upload_file_kesiswaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kesiswaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kpk`
--

DROP TABLE IF EXISTS `upload_file_kpk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kpk` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_kpk` (`id_tag`),
  KEY `fk_folder_kpk` (`id_folder`),
  CONSTRAINT `fk_folder_kpk` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_kpk` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_kpk_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_kpk_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kpk`
--

LOCK TABLES `upload_file_kpk` WRITE;
/*!40000 ALTER TABLE `upload_file_kpk` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kpk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kpk_elin`
--

DROP TABLE IF EXISTS `upload_file_kpk_elin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kpk_elin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `tacher_edit` tinyint NOT NULL DEFAULT '0',
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_kpk_elin` (`id_tag`),
  KEY `fk_folder_kpk_elin` (`id_folder`),
  CONSTRAINT `fk_folder_kpk_elin` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_elin` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_kpk_elin` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_elin` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_kpk_elin_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_elin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_kpk_elin_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_elin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kpk_elin`
--

LOCK TABLES `upload_file_kpk_elin` WRITE;
/*!40000 ALTER TABLE `upload_file_kpk_elin` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kpk_elin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kpk_metro`
--

DROP TABLE IF EXISTS `upload_file_kpk_metro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kpk_metro` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `tacher_edit` tinyint NOT NULL DEFAULT '0',
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_kpk_metro` (`id_tag`),
  KEY `fk_folder_kpk_metro` (`id_folder`),
  CONSTRAINT `fk_folder_kpk_metro` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_metro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_kpk_metro` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_metro` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_kpk_metro_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_metro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_kpk_metro_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_metro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kpk_metro`
--

LOCK TABLES `upload_file_kpk_metro` WRITE;
/*!40000 ALTER TABLE `upload_file_kpk_metro` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kpk_metro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kpk_rpl`
--

DROP TABLE IF EXISTS `upload_file_kpk_rpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kpk_rpl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `tacher_edit` tinyint NOT NULL DEFAULT '0',
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_kpk_rpl` (`id_tag`),
  KEY `fk_folder_kpk_rpl` (`id_folder`),
  CONSTRAINT `fk_folder_kpk_rpl` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_rpl` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_kpk_rpl` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_rpl` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_kpk_rpl_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_rpl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_kpk_rpl_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_rpl` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kpk_rpl`
--

LOCK TABLES `upload_file_kpk_rpl` WRITE;
/*!40000 ALTER TABLE `upload_file_kpk_rpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kpk_rpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kpk_tkj`
--

DROP TABLE IF EXISTS `upload_file_kpk_tkj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kpk_tkj` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `tacher_edit` tinyint NOT NULL DEFAULT '0',
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_kpk_tkj` (`id_tag`),
  KEY `fk_folder_kpk_tkj` (`id_folder`),
  CONSTRAINT `fk_folder_kpk_tkj` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_tkj` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_kpk_tkj` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_tkj` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_kpk_tkj_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_kpk_tkj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_kpk_tkj_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kpk_tkj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kpk_tkj`
--

LOCK TABLES `upload_file_kpk_tkj` WRITE;
/*!40000 ALTER TABLE `upload_file_kpk_tkj` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kpk_tkj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_kurikulum`
--

DROP TABLE IF EXISTS `upload_file_kurikulum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_kurikulum` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_kurikulum` (`id_tag`),
  KEY `fk_folder_kurikulum` (`id_folder`),
  CONSTRAINT `fk_folder_kurikulum` FOREIGN KEY (`id_folder`) REFERENCES `folder_kurikulum` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_kurikulum` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kurikulum` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_kurikulum_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_kurikulum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_kurikulum_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_kurikulum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_kurikulum`
--

LOCK TABLES `upload_file_kurikulum` WRITE;
/*!40000 ALTER TABLE `upload_file_kurikulum` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_kurikulum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_pdsm`
--

DROP TABLE IF EXISTS `upload_file_pdsm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_pdsm` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_pdsm` (`id_tag`),
  KEY `fk_folder_pdsm` (`id_folder`),
  CONSTRAINT `fk_folder_pdsm` FOREIGN KEY (`id_folder`) REFERENCES `folder_pdsm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_pdsm` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_pdsm` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_pdsm_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_pdsm` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_pdsm_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_pdsm` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_pdsm`
--

LOCK TABLES `upload_file_pdsm` WRITE;
/*!40000 ALTER TABLE `upload_file_pdsm` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_pdsm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_perpus`
--

DROP TABLE IF EXISTS `upload_file_perpus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_perpus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_perpus` (`id_tag`),
  KEY `fk_folder_perpus` (`id_folder`),
  CONSTRAINT `fk_folder_perpus` FOREIGN KEY (`id_folder`) REFERENCES `folder_perpus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_perpus` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_perpus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_perpus_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_perpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_perpus_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_perpus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_perpus`
--

LOCK TABLES `upload_file_perpus` WRITE;
/*!40000 ALTER TABLE `upload_file_perpus` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_perpus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_sarpas`
--

DROP TABLE IF EXISTS `upload_file_sarpas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_sarpas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_sarpras` (`id_tag`),
  KEY `fk_folder_sarpras` (`id_folder`),
  CONSTRAINT `fk_folder_sarpras` FOREIGN KEY (`id_folder`) REFERENCES `folder_sarpas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_sarpras` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_sarpas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_sarpas_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_sarpas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_sarpas_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_sarpas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_sarpas`
--

LOCK TABLES `upload_file_sarpas` WRITE;
/*!40000 ALTER TABLE `upload_file_sarpas` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_sarpas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_tatib`
--

DROP TABLE IF EXISTS `upload_file_tatib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_tatib` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date NOT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `pengunggah` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `modifikasi` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `upload_file_tatib_id_tag_foreign` (`id_tag`),
  CONSTRAINT `upload_file_tatib_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_tatib` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_tatib`
--

LOCK TABLES `upload_file_tatib` WRITE;
/*!40000 ALTER TABLE `upload_file_tatib` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_tatib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_tu`
--

DROP TABLE IF EXISTS `upload_file_tu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_file_tu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tanggal` date NOT NULL,
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_tag` bigint unsigned NOT NULL,
  `id_folder` bigint unsigned NOT NULL,
  `pengunggah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_edit` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tag_dokumen_tu` (`id_tag`),
  KEY `fk_folder_tu` (`id_folder`),
  CONSTRAINT `fk_folder_tu` FOREIGN KEY (`id_folder`) REFERENCES `folder_tu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tag_dokumen_tu` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_tu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_file_tu_id_folder_foreign` FOREIGN KEY (`id_folder`) REFERENCES `folder_tu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `upload_file_tu_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `tag_dokumen_tu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_tu`
--

LOCK TABLES `upload_file_tu` WRITE;
/*!40000 ALTER TABLE `upload_file_tu` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_tu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_relation`
--

DROP TABLE IF EXISTS `user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_relation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `school_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `role` enum('Guardian','Teacher','School Admin','Student') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_relation`
--

LOCK TABLES `user_relation` WRITE;
/*!40000 ALTER TABLE `user_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_status_for_next_cycles`
--

DROP TABLE IF EXISTS `user_status_for_next_cycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_status_for_next_cycles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `status` int NOT NULL,
  `school_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_for_next_cycles_user_id_unique` (`user_id`),
  KEY `user_status_for_next_cycles_school_id_foreign` (`school_id`),
  CONSTRAINT `user_status_for_next_cycles_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_status_for_next_cycles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_status_for_next_cycles`
--

LOCK TABLES `user_status_for_next_cycles` WRITE;
/*!40000 ALTER TABLE `user_status_for_next_cycles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_status_for_next_cycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `reset_request` tinyint NOT NULL DEFAULT '0',
  `fcm_id` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` bigint unsigned DEFAULT NULL,
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_nip_unique` (`nip`),
  KEY `users_school_id_foreign` (`school_id`),
  KEY `users_phone_index` (`phone`),
  CONSTRAINT `users_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Admin','SMK8','',NULL,'adminsmk8malang@gmail.com','$2y$10$bswhV6GhqHci21OmgZTHD.tNZPzV21eG3EWnuoOqOrV2Hp3j.3VzS','male','logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,1,'en',NULL,'2026-02-26 05:53:21','2026-02-24 04:05:01','2026-02-26 05:53:21',NULL),(2,NULL,'Agung','Cahyono','081299998888',NULL,'agungcahyono533@gmail.com','$2y$10$0HKWR9hW0vhPvf4mYOrq/OuU/z4B2sHqsboVHwwoUnEksYYcQR7DG','male','logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,1,'en',NULL,'2026-02-26 05:53:22','2026-02-24 04:05:01','2026-02-26 05:53:22',NULL),(3,NULL,'Super','Admin','',NULL,'superadmin@eschool.ac.id','$2y$10$5dfOiq41AEyN7W4LQHCpsubyNxyvnoqaKvGsYfG0qOGq1fTADUJpy','male','logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'en',NULL,'2026-02-26 01:26:30','2026-02-26 01:26:30','2026-02-26 01:26:30',NULL),(7,NULL,'Super','Admin',NULL,NULL,'superadmin@gmail.com','$2y$10$A0s4R4676xU1SJngOowj1u6mWRvG8TzhYWHsi3nWYgvu3kg6Jm.Oy',NULL,'logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'en',NULL,NULL,'2026-02-26 07:22:18','2026-02-26 07:22:18',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xendit_invoice_fees`
--

DROP TABLE IF EXISTS `xendit_invoice_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xendit_invoice_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `xendit_invoice_id` bigint unsigned NOT NULL,
  `fee_id` bigint unsigned NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xendit_invoice_fees_xendit_invoice_id_fee_id_unique` (`xendit_invoice_id`,`fee_id`),
  KEY `xendit_invoice_fees_xendit_invoice_id_index` (`xendit_invoice_id`),
  KEY `xendit_invoice_fees_fee_id_index` (`fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xendit_invoice_fees`
--

LOCK TABLES `xendit_invoice_fees` WRITE;
/*!40000 ALTER TABLE `xendit_invoice_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `xendit_invoice_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xendit_invoices`
--

DROP TABLE IF EXISTS `xendit_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xendit_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL,
  `invoice_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `status` enum('pending','paid','expired','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `invoice_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `expiry_date` timestamp NOT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `xendit_invoices_invoice_id_unique` (`invoice_id`),
  KEY `xendit_invoices_student_id_foreign` (`student_id`),
  KEY `xendit_invoices_parent_id_foreign` (`parent_id`),
  KEY `xendit_invoices_invoice_id_index` (`invoice_id`),
  KEY `xendit_invoices_external_id_index` (`external_id`),
  KEY `xendit_invoices_status_index` (`status`),
  KEY `xendit_invoices_school_id_student_id_index` (`school_id`,`student_id`),
  CONSTRAINT `xendit_invoices_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xendit_invoices_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE,
  CONSTRAINT `xendit_invoices_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xendit_invoices`
--

LOCK TABLES `xendit_invoices` WRITE;
/*!40000 ALTER TABLE `xendit_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `xendit_invoices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-27 10:01:51
