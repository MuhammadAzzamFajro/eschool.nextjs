-- PostgreSQL/Supabase compatible SQL
-- Auto-converted from MySQL dump (eschool-saas)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- ------------------------------------------------------

--
-- Table structure for table absensi_settings
--

DROP TABLE IF EXISTS "absensi_settings" CASCADE;
CREATE TABLE "absensi_settings" (
  "id" bigserial NOT NULL,
  "point_kehadiran" numeric(8,2) NOT NULL,
  "point_tatib" numeric(8,2) NOT NULL,
  "tatib" varchar(191) NOT NULL,
  "kesiswaan" varchar(191) NOT NULL,
  "nip_tatib" varchar(191) NOT NULL,
  "nip_kesiswaan" varchar(191) NOT NULL,
  "ttd_kesiswaan" varchar(191) NOT NULL,
  "ttd_petugas" varchar(191) NOT NULL,
  "logo_sekolah" varchar(191) NOT NULL,
  "kesiswaan_user_id" bigint DEFAULT NULL,
  "tatib_user_id" bigint DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "absensi_settings_school_id_foreign" ON "absensi_settings" ("school_id");
CREATE INDEX IF NOT EXISTS "absensi_settings_kesiswaan_user_id_foreign" ON "absensi_settings" ("kesiswaan_user_id");
CREATE INDEX IF NOT EXISTS "absensi_settings_tatib_user_id_foreign" ON "absensi_settings" ("tatib_user_id");
CREATE INDEX IF NOT EXISTS "absensi_settings_school_id_kesiswaan_user_id_index" ON "absensi_settings" ("school_id", "kesiswaan_user_id");
CREATE INDEX IF NOT EXISTS "absensi_settings_school_id_tatib_user_id_index" ON "absensi_settings" ("school_id", "tatib_user_id");

--
-- Dumping data for table absensi_settings
--

--
-- Table structure for table academic_calendars
--

DROP TABLE IF EXISTS "academic_calendars" CASCADE;
CREATE TABLE "academic_calendars" (
  "id" bigserial NOT NULL,
  "date" date NOT NULL,
  "title" varchar(512) NOT NULL,
  "description" varchar(1024) DEFAULT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "academic_calendars_school_id_foreign" ON "academic_calendars" ("school_id");
CREATE INDEX IF NOT EXISTS "academic_calendars_session_year_id_foreign" ON "academic_calendars" ("session_year_id");

--
-- Dumping data for table academic_calendars
--

--
-- Table structure for table accepted_file
--

DROP TABLE IF EXISTS "accepted_file" CASCADE;
CREATE TABLE "accepted_file" (
  "id" bigserial NOT NULL,
  "assignment_id" bigint DEFAULT NULL,
  "filetype_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "accepted_file_assignment_id_foreign" ON "accepted_file" ("assignment_id");
CREATE INDEX IF NOT EXISTS "accepted_file_filetype_id_foreign" ON "accepted_file" ("filetype_id");

--
-- Dumping data for table accepted_file
--

--
-- Table structure for table addon_subscriptions
--

DROP TABLE IF EXISTS "addon_subscriptions" CASCADE;
CREATE TABLE "addon_subscriptions" (
  "id" bigserial NOT NULL,
  "subscription_id" bigint DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "feature_id" bigint NOT NULL,
  "price" numeric(64,4) NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date NOT NULL,
  "status" smallint NOT NULL DEFAULT '1',
  "payment_transaction_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "addon_subscriptions_school_id_foreign" ON "addon_subscriptions" ("school_id");
CREATE INDEX IF NOT EXISTS "addon_subscriptions_feature_id_foreign" ON "addon_subscriptions" ("feature_id");
CREATE INDEX IF NOT EXISTS "addon_subscriptions_subscription_id_foreign" ON "addon_subscriptions" ("subscription_id");
CREATE INDEX IF NOT EXISTS "addon_subscriptions_payment_transaction_id_foreign" ON "addon_subscriptions" ("payment_transaction_id");

--
-- Dumping data for table addon_subscriptions
--

--
-- Table structure for table addons
--

DROP TABLE IF EXISTS "addons" CASCADE;
CREATE TABLE "addons" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "price" numeric(8,4) NOT NULL,
  "feature_id" bigint NOT NULL,
  "status" smallint NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "addons_feature_id_unique" ON "addons" ("feature_id");

--
-- Dumping data for table addons
--

--
-- Table structure for table announcement_classes
--

DROP TABLE IF EXISTS "announcement_classes" CASCADE;
CREATE TABLE "announcement_classes" (
  "id" bigserial NOT NULL,
  "announcement_id" bigint DEFAULT NULL,
  "class_section_id" bigint DEFAULT NULL,
  "class_subject_id" bigint DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_columns" ON "announcement_classes" ("announcement_id", "class_section_id", "school_id");
CREATE INDEX IF NOT EXISTS "announcement_classes_school_id_foreign" ON "announcement_classes" ("school_id");
CREATE INDEX IF NOT EXISTS "announcement_classes_announcement_id_index" ON "announcement_classes" ("announcement_id");
CREATE INDEX IF NOT EXISTS "announcement_classes_class_section_id_index" ON "announcement_classes" ("class_section_id");
CREATE INDEX IF NOT EXISTS "announcement_classes_class_subject_id_foreign" ON "announcement_classes" ("class_subject_id");

--
-- Dumping data for table announcement_classes
--

--
-- Table structure for table announcements
--

DROP TABLE IF EXISTS "announcements" CASCADE;
CREATE TABLE "announcements" (
  "id" bigserial NOT NULL,
  "title" varchar(128) NOT NULL,
  "description" varchar(1024) DEFAULT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "announcements_school_id_foreign" ON "announcements" ("school_id");
CREATE INDEX IF NOT EXISTS "announcements_session_year_id_foreign" ON "announcements" ("session_year_id");

--
-- Dumping data for table announcements
--

--
-- Table structure for table api_tokens
--

DROP TABLE IF EXISTS "api_tokens" CASCADE;
CREATE TABLE "api_tokens" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "name" varchar(191) DEFAULT NULL,
  "token_hash" text NOT NULL,
  "last_used_at" timestamp NULL DEFAULT NULL,
  "expires_at" timestamp NULL DEFAULT NULL,
  "is_active" smallint NOT NULL DEFAULT '1',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "api_tokens_user_id_foreign" ON "api_tokens" ("user_id");

--
-- Dumping data for table api_tokens
--

--
-- Table structure for table assignment_submissions
--

DROP TABLE IF EXISTS "assignment_submissions" CASCADE;
CREATE TABLE "assignment_submissions" (
  "id" bigserial NOT NULL,
  "assignment_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "feedback" text,
  "points" integer DEFAULT NULL,
  "status" smallint NOT NULL DEFAULT '0',
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "assignment_submissions_assignment_id_foreign" ON "assignment_submissions" ("assignment_id");
CREATE INDEX IF NOT EXISTS "assignment_submissions_school_id_foreign" ON "assignment_submissions" ("school_id");
CREATE INDEX IF NOT EXISTS "assignment_submissions_student_id_foreign" ON "assignment_submissions" ("student_id");
CREATE INDEX IF NOT EXISTS "assignment_submissions_session_year_id_foreign" ON "assignment_submissions" ("session_year_id");

--
-- Dumping data for table assignment_submissions
--

--
-- Table structure for table assignments
--

DROP TABLE IF EXISTS "assignments" CASCADE;
CREATE TABLE "assignments" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "name" varchar(128) NOT NULL,
  "instructions" varchar(1024) DEFAULT NULL,
  "due_date" timestamp NOT NULL,
  "points" integer DEFAULT NULL,
  "resubmission" smallint NOT NULL DEFAULT '0',
  "extra_days_for_resubmission" integer DEFAULT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_by" bigint NOT NULL,
  "edited_by" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "assignments_school_id_foreign" ON "assignments" ("school_id");
CREATE INDEX IF NOT EXISTS "assignments_class_section_id_foreign" ON "assignments" ("class_section_id");
CREATE INDEX IF NOT EXISTS "assignments_class_subject_id_foreign" ON "assignments" ("class_subject_id");
CREATE INDEX IF NOT EXISTS "assignments_session_year_id_foreign" ON "assignments" ("session_year_id");
CREATE INDEX IF NOT EXISTS "assignments_created_by_foreign" ON "assignments" ("created_by");
CREATE INDEX IF NOT EXISTS "assignments_edited_by_foreign" ON "assignments" ("edited_by");

--
-- Dumping data for table assignments
--

--
-- Table structure for table attachments
--

DROP TABLE IF EXISTS "attachments" CASCADE;
CREATE TABLE "attachments" (
  "id" bigserial NOT NULL,
  "message_id" bigint NOT NULL,
  "file" varchar(191) DEFAULT NULL,
  "file_type" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "attachments_message_id_foreign" ON "attachments" ("message_id");

--
-- Dumping data for table attachments
--

--
-- Table structure for table attendance_days
--

DROP TABLE IF EXISTS "attendance_days" CASCADE;
CREATE TABLE "attendance_days" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "day_key" varchar(10) NOT NULL,
  "day_name" varchar(20) NOT NULL,
  "is_active" smallint NOT NULL DEFAULT '1',
  "max_jp" smallint NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "attendance_days_school_id_day_key_unique" ON "attendance_days" ("school_id", "day_key");
CREATE INDEX IF NOT EXISTS "attendance_days_school_id_index" ON "attendance_days" ("school_id");

--
-- Dumping data for table attendance_days
--

--
-- Table structure for table attendance_points
--

DROP TABLE IF EXISTS "attendance_points" CASCADE;
CREATE TABLE "attendance_points" (
  "id" bigserial NOT NULL,
  "starting_range" integer NOT NULL,
  "ending_range" integer NOT NULL,
  "rules" varchar(191) NOT NULL,
  "school_id" integer NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table attendance_points
--

--
-- Table structure for table attendances
--

DROP TABLE IF EXISTS "attendances" CASCADE;
CREATE TABLE "attendances" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "grade_level_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "type" smallint NOT NULL,
  "date" date NOT NULL,
  "remark" varchar(512) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "attendances_school_id_foreign" ON "attendances" ("school_id");
CREATE INDEX IF NOT EXISTS "attendances_class_section_id_foreign" ON "attendances" ("class_section_id");
CREATE INDEX IF NOT EXISTS "attendances_student_id_foreign" ON "attendances" ("student_id");
CREATE INDEX IF NOT EXISTS "attendances_session_year_id_foreign" ON "attendances" ("session_year_id");
CREATE INDEX IF NOT EXISTS "attendances_grade_level_id_foreign" ON "attendances" ("grade_level_id");

--
-- Dumping data for table attendances
--

--
-- Table structure for table auto_absen_admins
--

DROP TABLE IF EXISTS "auto_absen_admins" CASCADE;
CREATE TABLE "auto_absen_admins" (
  "id" bigserial NOT NULL,
  "month_year" varchar(7) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table auto_absen_admins
--

--
-- Table structure for table bank_soal
--

DROP TABLE IF EXISTS "bank_soal" CASCADE;
CREATE TABLE "bank_soal" (
  "id" bigserial NOT NULL,
  "teacher_id" bigint NOT NULL,
  "subject_id" bigint NOT NULL,
  "question" varchar(191) NOT NULL,
  "image_url" varchar(191) DEFAULT NULL,
  "note" varchar(191) DEFAULT NULL,
  "type" text NOT NULL,
  "options" text,
  "answers" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "bank_soal_teacher_id_foreign" ON "bank_soal" ("teacher_id");
CREATE INDEX IF NOT EXISTS "bank_soal_subject_id_foreign" ON "bank_soal" ("subject_id");

--
-- Dumping data for table bank_soal
--

--
-- Table structure for table bank_soal_detail
--

DROP TABLE IF EXISTS "bank_soal_detail" CASCADE;
CREATE TABLE "bank_soal_detail" (
  "id" bigserial NOT NULL,
  "bank_soal_id" bigint NOT NULL,
  "subject_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "bank_soal_detail_bank_soal_id_foreign" ON "bank_soal_detail" ("bank_soal_id");
CREATE INDEX IF NOT EXISTS "bank_soal_detail_subject_id_foreign" ON "bank_soal_detail" ("subject_id");

--
-- Dumping data for table bank_soal_detail
--

--
-- Table structure for table bank_soal_versions
--

DROP TABLE IF EXISTS "bank_soal_versions" CASCADE;
CREATE TABLE "bank_soal_versions" (
  "id" bigserial NOT NULL,
  "bank_soal_detail_id" bigint NOT NULL,
  "version" varchar(50) NOT NULL,
  "question" text NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "note" text,
  "image" varchar(255) DEFAULT NULL,
  "default_point" integer DEFAULT '1',
  "type" varchar(50) NOT NULL,
  "options" text NOT NULL,
  "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_by" bigint DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "bank_soal_versions_updated_by_foreign" ON "bank_soal_versions" ("updated_by");
CREATE INDEX IF NOT EXISTS "bank_soal_versions_bank_soal_detail_id_foreign" ON "bank_soal_versions" ("bank_soal_detail_id");

--
-- Dumping data for table bank_soal_versions
--

--
-- Table structure for table beginning_balance
--

DROP TABLE IF EXISTS "beginning_balance" CASCADE;
CREATE TABLE "beginning_balance" (
  "id" bigserial NOT NULL,
  "cut_off_date" date NOT NULL,
  "cash_balance" numeric(15,2) NOT NULL DEFAULT '0.00',
  "bank_balance" numeric(15,2) NOT NULL DEFAULT '0.00',
  "receivables" numeric(15,2) NOT NULL DEFAULT '0.00',
  "payables" numeric(15,2) NOT NULL DEFAULT '0.00',
  "expenditure" numeric(15,2) NOT NULL DEFAULT '0.00',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "beginning_balance_cut_off_date_unique" ON "beginning_balance" ("cut_off_date");
CREATE INDEX IF NOT EXISTS "beginning_balance_cut_off_date_index" ON "beginning_balance" ("cut_off_date");

--
-- Dumping data for table beginning_balance
--

--
-- Table structure for table categories
--

DROP TABLE IF EXISTS "categories" CASCADE;
CREATE TABLE "categories" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "school_id" bigint NOT NULL,
  "status" smallint NOT NULL DEFAULT '1',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "categories_school_id_foreign" ON "categories" ("school_id");

--
-- Dumping data for table categories
--

--
-- Table structure for table certificate_templates
--

DROP TABLE IF EXISTS "certificate_templates" CASCADE;
CREATE TABLE "certificate_templates" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "page_layout" varchar(191) NOT NULL,
  "height" numeric(8,2) DEFAULT NULL,
  "width" numeric(8,2) DEFAULT NULL,
  "user_image_shape" varchar(191) NOT NULL,
  "image_size" numeric(8,2) DEFAULT NULL,
  "background_image" varchar(191) DEFAULT NULL,
  "description" text,
  "fields" varchar(191) DEFAULT NULL,
  "style" text,
  "type" varchar(191) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "certificate_templates_school_id_foreign" ON "certificate_templates" ("school_id");

--
-- Dumping data for table certificate_templates
--

--
-- Table structure for table chats
--

DROP TABLE IF EXISTS "chats" CASCADE;
CREATE TABLE "chats" (
  "id" bigserial NOT NULL,
  "sender_id" bigint NOT NULL,
  "receiver_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "chats_sender_id_foreign" ON "chats" ("sender_id");
CREATE INDEX IF NOT EXISTS "chats_receiver_id_foreign" ON "chats" ("receiver_id");

--
-- Dumping data for table chats
--

--
-- Table structure for table class_groups
--

DROP TABLE IF EXISTS "class_groups" CASCADE;
CREATE TABLE "class_groups" (
  "id" bigserial NOT NULL,
  "name" varchar(191) DEFAULT NULL,
  "description" text,
  "image" varchar(191) DEFAULT NULL,
  "class_ids" varchar(191) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "class_groups_school_id_foreign" ON "class_groups" ("school_id");

--
-- Dumping data for table class_groups
--

--
-- Table structure for table class_sections
--

DROP TABLE IF EXISTS "class_sections" CASCADE;
CREATE TABLE "class_sections" (
  "id" bigserial NOT NULL,
  "class_id" bigint NOT NULL,
  "grade_level_id" bigint DEFAULT NULL,
  "section_id" bigint NOT NULL,
  "medium_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "pkl" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_id" ON "class_sections" ("class_id", "section_id", "medium_id");
CREATE INDEX IF NOT EXISTS "class_sections_school_id_foreign" ON "class_sections" ("school_id");
CREATE INDEX IF NOT EXISTS "class_sections_section_id_foreign" ON "class_sections" ("section_id");
CREATE INDEX IF NOT EXISTS "class_sections_medium_id_foreign" ON "class_sections" ("medium_id");
CREATE INDEX IF NOT EXISTS "class_sections_grade_level_id_foreign" ON "class_sections" ("grade_level_id");
CREATE INDEX IF NOT EXISTS "class_sections_session_year_id_foreign" ON "class_sections" ("session_year_id");

--
-- Dumping data for table class_sections
--

--
-- Table structure for table class_subjects
--

DROP TABLE IF EXISTS "class_subjects" CASCADE;
CREATE TABLE "class_subjects" (
  "id" bigserial NOT NULL,
  "class_id" bigint NOT NULL,
  "subject_id" bigint NOT NULL,
  "type" varchar(32) NOT NULL,
  "elective_subject_group_id" bigint DEFAULT NULL,
  "semester_id" bigint DEFAULT NULL,
  "virtual_semester_id" integer DEFAULT 0,
  "school_id" bigint NOT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_ids" ON "class_subjects" ("class_id", "subject_id", "virtual_semester_id");
CREATE INDEX IF NOT EXISTS "class_subjects_elective_subject_group_id_foreign" ON "class_subjects" ("elective_subject_group_id");
CREATE INDEX IF NOT EXISTS "class_subjects_school_id_foreign" ON "class_subjects" ("school_id");
CREATE INDEX IF NOT EXISTS "class_subjects_subject_id_foreign" ON "class_subjects" ("subject_id");
CREATE INDEX IF NOT EXISTS "class_subjects_semester_id_foreign" ON "class_subjects" ("semester_id");

--
-- Dumping data for table class_subjects
--

--
-- Table structure for table class_teachers
--

DROP TABLE IF EXISTS "class_teachers" CASCADE;
CREATE TABLE "class_teachers" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "teacher_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_id" ON "class_teachers" ("class_section_id", "teacher_id");
CREATE INDEX IF NOT EXISTS "class_teachers_school_id_foreign" ON "class_teachers" ("school_id");
CREATE INDEX IF NOT EXISTS "class_teachers_teacher_id_foreign" ON "class_teachers" ("teacher_id");

--
-- Dumping data for table class_teachers
--

--
-- Table structure for table classes
--

DROP TABLE IF EXISTS "classes" CASCADE;
CREATE TABLE "classes" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "include_semesters" smallint NOT NULL DEFAULT '0',
  "medium_id" bigint NOT NULL,
  "grade_level_id" bigint DEFAULT NULL,
  "shift_id" bigint DEFAULT NULL,
  "stream_id" bigint DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "classes_school_id_foreign" ON "classes" ("school_id");
CREATE INDEX IF NOT EXISTS "classes_medium_id_foreign" ON "classes" ("medium_id");
CREATE INDEX IF NOT EXISTS "classes_shift_id_foreign" ON "classes" ("shift_id");
CREATE INDEX IF NOT EXISTS "classes_stream_id_foreign" ON "classes" ("stream_id");
CREATE INDEX IF NOT EXISTS "classes_grade_level_id_foreign" ON "classes" ("grade_level_id");

--
-- Dumping data for table classes
--

--
-- Table structure for table compulsory_fees
--

DROP TABLE IF EXISTS "compulsory_fees" CASCADE;
CREATE TABLE "compulsory_fees" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "payment_transaction_id" bigint DEFAULT NULL,
  "type" text NOT NULL,
  "installment_id" bigint DEFAULT NULL,
  "mode" text NOT NULL,
  "cheque_no" varchar(191) DEFAULT NULL,
  "amount" numeric(8,2) NOT NULL,
  "due_charges" numeric(8,2) DEFAULT NULL,
  "fees_paid_id" bigint DEFAULT NULL,
  "status" text NOT NULL,
  "date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "compulsory_fees_installment_id_foreign" ON "compulsory_fees" ("installment_id");
CREATE INDEX IF NOT EXISTS "compulsory_fees_school_id_foreign" ON "compulsory_fees" ("school_id");
CREATE INDEX IF NOT EXISTS "compulsory_fees_student_id_foreign" ON "compulsory_fees" ("student_id");
CREATE INDEX IF NOT EXISTS "compulsory_fees_payment_transaction_id_foreign" ON "compulsory_fees" ("payment_transaction_id");
CREATE INDEX IF NOT EXISTS "compulsory_fees_fees_paid_id_foreign" ON "compulsory_fees" ("fees_paid_id");

--
-- Dumping data for table compulsory_fees
--

--
-- Table structure for table contact_inquiries
--

DROP TABLE IF EXISTS "contact_inquiries" CASCADE;
CREATE TABLE "contact_inquiries" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "email" varchar(191) NOT NULL,
  "subject" varchar(191) NOT NULL,
  "message" text NOT NULL,
  "type" varchar(191) DEFAULT NULL,
  "status" text NOT NULL DEFAULT 'new',
  "replied_at" timestamp NULL DEFAULT NULL,
  "replied_by" bigint DEFAULT NULL,
  "admin_reply" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "contact_inquiries_status_index" ON "contact_inquiries" ("status");

--
-- Dumping data for table contact_inquiries
--

--
-- Table structure for table database_backups
--

DROP TABLE IF EXISTS "database_backups" CASCADE;
CREATE TABLE "database_backups" (
  "id" bigserial NOT NULL,
  "name" varchar(191) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "last_backup_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "database_backups_school_id_foreign" ON "database_backups" ("school_id");

--
-- Dumping data for table database_backups
--

--
-- Table structure for table device_tokens
--

DROP TABLE IF EXISTS "device_tokens" CASCADE;
CREATE TABLE "device_tokens" (
  "id" bigserial NOT NULL,
  "user_id" bigint DEFAULT NULL,
  "fcm_id" varchar(191) NOT NULL,
  "platform" varchar(10) NOT NULL,
  "last_seen_at" timestamp NULL DEFAULT NULL,
  "is_active" smallint NOT NULL DEFAULT '1',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "device_tokens_user_id_fcm_id_unique" ON "device_tokens" ("user_id", "fcm_id");
CREATE INDEX IF NOT EXISTS "device_tokens_user_id_is_active_index" ON "device_tokens" ("user_id", "is_active");
CREATE INDEX IF NOT EXISTS "device_tokens_fcm_id_is_active_index" ON "device_tokens" ("fcm_id", "is_active");
CREATE INDEX IF NOT EXISTS "device_tokens_platform_index" ON "device_tokens" ("platform");

--
-- Dumping data for table device_tokens
--

--
-- Table structure for table document_files
--

DROP TABLE IF EXISTS "document_files" CASCADE;
CREATE TABLE "document_files" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "owner_type" text NOT NULL,
  "owner_id" bigint NOT NULL,
  "folder_id" bigint DEFAULT NULL,
  "uuid" char(36) NOT NULL,
  "name" varchar(191) NOT NULL,
  "description" text,
  "path" varchar(1024) NOT NULL,
  "mime" varchar(120) DEFAULT NULL,
  "size" bigint NOT NULL DEFAULT '0',
  "uploader_id" bigint DEFAULT NULL,
  "visible_to_teacher" smallint NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "document_files_uuid_unique" ON "document_files" ("uuid");
CREATE INDEX IF NOT EXISTS "idx_df_owner_folder" ON "document_files" ("school_id", "owner_type", "owner_id", "folder_id");
CREATE INDEX IF NOT EXISTS "idx_df_folder_id" ON "document_files" ("folder_id");
CREATE INDEX IF NOT EXISTS "idx_df_school_id" ON "document_files" ("school_id");
CREATE INDEX IF NOT EXISTS "idx_df_uploader_id" ON "document_files" ("uploader_id");
CREATE INDEX IF NOT EXISTS "idx_df_deleted_at" ON "document_files" ("deleted_at");
CREATE INDEX IF NOT EXISTS "idx_df_visible_teacher" ON "document_files" ("visible_to_teacher");

--
-- Dumping data for table document_files
--

--
-- Table structure for table document_folders
--

DROP TABLE IF EXISTS "document_folders" CASCADE;
CREATE TABLE "document_folders" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "owner_type" text NOT NULL,
  "owner_id" bigint NOT NULL,
  "parent_id" bigint DEFAULT NULL,
  "name" varchar(191) NOT NULL,
  "sort" integer NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "idx_owner" ON "document_folders" ("school_id", "owner_type", "owner_id", "parent_id");
CREATE INDEX IF NOT EXISTS "idx_parent" ON "document_folders" ("parent_id");
CREATE INDEX IF NOT EXISTS "idx_deleted_at" ON "document_folders" ("deleted_at");

--
-- Dumping data for table document_folders
--

--
-- Table structure for table edu_level
--

DROP TABLE IF EXISTS "edu_level" CASCADE;
CREATE TABLE "edu_level" (
  "id" bigserial NOT NULL,
  "name" varchar(100) NOT NULL,
  "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table edu_level
--

INSERT INTO "edu_level" VALUES (1,'PAUD','2026-02-24 04:05:01','2026-02-24 04:05:01'),(2,'TK','2026-02-24 04:05:01','2026-02-24 04:05:01'),(3,'SD','2026-02-24 04:05:01','2026-02-24 04:05:01'),(4,'MI','2026-02-24 04:05:01','2026-02-24 04:05:01'),(5,'SMP','2026-02-24 04:05:01','2026-02-24 04:05:01'),(6,'MTs','2026-02-24 04:05:01','2026-02-24 04:05:01'),(7,'SMA','2026-02-24 04:05:01','2026-02-24 04:05:01'),(8,'MA','2026-02-24 04:05:01','2026-02-24 04:05:01'),(9,'SMK','2026-02-24 04:05:01','2026-02-24 04:05:01'),(10,'SLB','2026-02-24 04:05:01','2026-02-24 04:05:01'),(11,'Paket A','2026-02-24 04:05:01','2026-02-24 04:05:01'),(12,'Paket B','2026-02-24 04:05:01','2026-02-24 04:05:01'),(13,'Paket C','2026-02-24 04:05:01','2026-02-24 04:05:01'),(14,'Ponpes','2026-02-24 04:05:01','2026-02-24 04:05:01'),(15,'Lainnya','2026-02-24 04:05:01','2026-02-24 04:05:01');

--
-- Table structure for table elective_subject_groups
--

DROP TABLE IF EXISTS "elective_subject_groups" CASCADE;
CREATE TABLE "elective_subject_groups" (
  "id" bigserial NOT NULL,
  "total_subjects" integer NOT NULL,
  "total_selectable_subjects" integer NOT NULL,
  "class_id" bigint NOT NULL,
  "semester_id" bigint DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "elective_subject_groups_school_id_foreign" ON "elective_subject_groups" ("school_id");
CREATE INDEX IF NOT EXISTS "elective_subject_groups_class_id_foreign" ON "elective_subject_groups" ("class_id");
CREATE INDEX IF NOT EXISTS "elective_subject_groups_semester_id_foreign" ON "elective_subject_groups" ("semester_id");

--
-- Dumping data for table elective_subject_groups
--

--
-- Table structure for table eskul_absensis
--

DROP TABLE IF EXISTS "eskul_absensis" CASCADE;
CREATE TABLE "eskul_absensis" (
  "id" bigserial NOT NULL,
  "eskul_detail_id" bigint NOT NULL,
  "date" date NOT NULL,
  "type" smallint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "eskul_absensis_eskul_detail_id_foreign" ON "eskul_absensis" ("eskul_detail_id");

--
-- Dumping data for table eskul_absensis
--

--
-- Table structure for table eskul_details
--

DROP TABLE IF EXISTS "eskul_details" CASCADE;
CREATE TABLE "eskul_details" (
  "id" bigserial NOT NULL,
  "estrakulikuler_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "status" varchar(191) NOT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "eskul_details_estrakulikuler_id_foreign" ON "eskul_details" ("estrakulikuler_id");
CREATE INDEX IF NOT EXISTS "eskul_details_student_id_foreign" ON "eskul_details" ("student_id");

--
-- Dumping data for table eskul_details
--

--
-- Table structure for table eskul_timetables
--

DROP TABLE IF EXISTS "eskul_timetables" CASCADE;
CREATE TABLE "eskul_timetables" (
  "id" bigserial NOT NULL,
  "estrakulikuler_id" bigint NOT NULL,
  "day" varchar(191) NOT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "eskul_timetables_estrakulikuler_id_foreign" ON "eskul_timetables" ("estrakulikuler_id");

--
-- Dumping data for table eskul_timetables
--

--
-- Table structure for table estrakulikulers
--

DROP TABLE IF EXISTS "estrakulikulers" CASCADE;
CREATE TABLE "estrakulikulers" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "description" text NOT NULL,
  "coach_id" bigint NOT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "estrakulikulers_coach_id_foreign" ON "estrakulikulers" ("coach_id");

--
-- Dumping data for table estrakulikulers
--

--
-- Table structure for table exam_marks
--

DROP TABLE IF EXISTS "exam_marks" CASCADE;
CREATE TABLE "exam_marks" (
  "id" bigserial NOT NULL,
  "exam_timetable_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "grade_level_id" bigint DEFAULT NULL,
  "obtained_marks" numeric(8,2) NOT NULL,
  "teacher_review" varchar(1024) DEFAULT NULL,
  "passing_status" smallint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "grade" text,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "exam_marks_school_id_foreign" ON "exam_marks" ("school_id");
CREATE INDEX IF NOT EXISTS "exam_marks_exam_timetable_id_foreign" ON "exam_marks" ("exam_timetable_id");
CREATE INDEX IF NOT EXISTS "exam_marks_student_id_foreign" ON "exam_marks" ("student_id");
CREATE INDEX IF NOT EXISTS "exam_marks_class_subject_id_foreign" ON "exam_marks" ("class_subject_id");
CREATE INDEX IF NOT EXISTS "exam_marks_session_year_id_foreign" ON "exam_marks" ("session_year_id");
CREATE INDEX IF NOT EXISTS "exam_marks_grade_level_id_foreign" ON "exam_marks" ("grade_level_id");

--
-- Dumping data for table exam_marks
--

--
-- Table structure for table exam_results
--

DROP TABLE IF EXISTS "exam_results" CASCADE;
CREATE TABLE "exam_results" (
  "id" bigserial NOT NULL,
  "exam_id" bigint NOT NULL,
  "class_section_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "total_marks" integer NOT NULL,
  "obtained_marks" numeric(8,2) NOT NULL,
  "percentage" numeric(8,2) NOT NULL,
  "grade" text NOT NULL,
  "status" integer NOT NULL DEFAULT '1',
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "exam_results_school_id_foreign" ON "exam_results" ("school_id");
CREATE INDEX IF NOT EXISTS "exam_results_exam_id_foreign" ON "exam_results" ("exam_id");
CREATE INDEX IF NOT EXISTS "exam_results_class_section_id_foreign" ON "exam_results" ("class_section_id");
CREATE INDEX IF NOT EXISTS "exam_results_student_id_foreign" ON "exam_results" ("student_id");
CREATE INDEX IF NOT EXISTS "exam_results_session_year_id_foreign" ON "exam_results" ("session_year_id");

--
-- Dumping data for table exam_results
--

--
-- Table structure for table exam_timetables
--

DROP TABLE IF EXISTS "exam_timetables" CASCADE;
CREATE TABLE "exam_timetables" (
  "id" bigserial NOT NULL,
  "exam_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "total_marks" numeric(8,2) NOT NULL,
  "passing_marks" numeric(8,2) NOT NULL,
  "date" date NOT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "exam_timetables_exam_id_foreign" ON "exam_timetables" ("exam_id");
CREATE INDEX IF NOT EXISTS "exam_timetables_school_id_foreign" ON "exam_timetables" ("school_id");
CREATE INDEX IF NOT EXISTS "exam_timetables_class_subject_id_foreign" ON "exam_timetables" ("class_subject_id");
CREATE INDEX IF NOT EXISTS "exam_timetables_session_year_id_foreign" ON "exam_timetables" ("session_year_id");

--
-- Dumping data for table exam_timetables
--

--
-- Table structure for table exams
--

DROP TABLE IF EXISTS "exams" CASCADE;
CREATE TABLE "exams" (
  "id" bigserial NOT NULL,
  "grade_level_id" bigint DEFAULT NULL,
  "name" varchar(128) NOT NULL,
  "description" varchar(1024) DEFAULT NULL,
  "class_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "start_date" date DEFAULT NULL,
  "end_date" date DEFAULT NULL,
  "publish" smallint NOT NULL DEFAULT '0',
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "exams_school_id_foreign" ON "exams" ("school_id");
CREATE INDEX IF NOT EXISTS "exams_class_id_foreign" ON "exams" ("class_id");
CREATE INDEX IF NOT EXISTS "exams_session_year_id_foreign" ON "exams" ("session_year_id");
CREATE INDEX IF NOT EXISTS "exams_grade_level_id_foreign" ON "exams" ("grade_level_id");

--
-- Dumping data for table exams
--

--
-- Table structure for table expense_categories
--

DROP TABLE IF EXISTS "expense_categories" CASCADE;
CREATE TABLE "expense_categories" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "description" varchar(191) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "expense_categories_school_id_foreign" ON "expense_categories" ("school_id");

--
-- Dumping data for table expense_categories
--

--
-- Table structure for table expenses
--

DROP TABLE IF EXISTS "expenses" CASCADE;
CREATE TABLE "expenses" (
  "id" bigserial NOT NULL,
  "category_id" bigint DEFAULT NULL,
  "ref_no" varchar(191) DEFAULT NULL,
  "staff_id" bigint DEFAULT NULL,
  "basic_salary" bigint NOT NULL DEFAULT '0',
  "paid_leaves" numeric(8,2) NOT NULL DEFAULT '0.00',
  "month" bigint DEFAULT NULL,
  "year" integer DEFAULT NULL,
  "title" varchar(512) NOT NULL,
  "description" varchar(191) DEFAULT NULL,
  "amount" numeric(64,2) NOT NULL,
  "date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "salary_unique_records" ON "expenses" ("staff_id", "month", "year");
CREATE INDEX IF NOT EXISTS "expenses_school_id_foreign" ON "expenses" ("school_id");
CREATE INDEX IF NOT EXISTS "expenses_category_id_foreign" ON "expenses" ("category_id");
CREATE INDEX IF NOT EXISTS "expenses_session_year_id_foreign" ON "expenses" ("session_year_id");

--
-- Dumping data for table expenses
--

--
-- Table structure for table extra_student_datas
--

DROP TABLE IF EXISTS "extra_student_datas" CASCADE;
CREATE TABLE "extra_student_datas" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "form_field_id" bigint NOT NULL,
  "data" text,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "extra_student_datas_form_field_id_foreign" ON "extra_student_datas" ("form_field_id");
CREATE INDEX IF NOT EXISTS "extra_student_datas_school_id_foreign" ON "extra_student_datas" ("school_id");
CREATE INDEX IF NOT EXISTS "extra_student_datas_student_id_foreign" ON "extra_student_datas" ("student_id");

--
-- Dumping data for table extra_student_datas
--

--
-- Table structure for table failed_jobs
--

DROP TABLE IF EXISTS "failed_jobs" CASCADE;
CREATE TABLE "failed_jobs" (
  "id" bigserial NOT NULL,
  "uuid" varchar(191) NOT NULL,
  "connection" text NOT NULL,
  "queue" text NOT NULL,
  "payload" text NOT NULL,
  "exception" text NOT NULL,
  "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "failed_jobs_uuid_unique" ON "failed_jobs" ("uuid");

--
-- Dumping data for table failed_jobs
--

--
-- Table structure for table faqs
--

DROP TABLE IF EXISTS "faqs" CASCADE;
CREATE TABLE "faqs" (
  "id" bigserial NOT NULL,
  "title" varchar(191) NOT NULL,
  "description" text NOT NULL,
  "school_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "faqs_school_id_foreign" ON "faqs" ("school_id");

--
-- Dumping data for table faqs
--

--
-- Table structure for table feature_section_lists
--

DROP TABLE IF EXISTS "feature_section_lists" CASCADE;
CREATE TABLE "feature_section_lists" (
  "id" bigserial NOT NULL,
  "feature_section_id" bigint NOT NULL,
  "feature" varchar(191) DEFAULT NULL,
  "description" text,
  "image" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "feature_section_lists_feature_section_id_foreign" ON "feature_section_lists" ("feature_section_id");

--
-- Dumping data for table feature_section_lists
--

--
-- Table structure for table feature_sections
--

DROP TABLE IF EXISTS "feature_sections" CASCADE;
CREATE TABLE "feature_sections" (
  "id" bigserial NOT NULL,
  "title" varchar(191) NOT NULL,
  "heading" varchar(191) DEFAULT NULL,
  "rank" integer NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table feature_sections
--

--
-- Table structure for table features
--

DROP TABLE IF EXISTS "features" CASCADE;
CREATE TABLE "features" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "is_default" smallint NOT NULL DEFAULT '0',
  "status" integer NOT NULL DEFAULT '1',
  "required_vps" integer NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table features
--

INSERT INTO "features" VALUES (1,'Student Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(2,'Academics Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(3,'Slider Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(4,'Teacher Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(5,'Session Year Management',1,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(6,'Holiday Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(7,'Timetable Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(8,'Attendance Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(9,'Exam Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(10,'Lesson Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(11,'Assignment Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(12,'Announcement Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(13,'Staff Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(14,'Expense Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(15,'Staff Leave Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(16,'Fees Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(17,'School Gallery Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(18,'ID Card - Certificate Generation',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(19,'Website Management',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(20,'Chat Module',0,1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00');

--
-- Table structure for table fees
--

DROP TABLE IF EXISTS "fees" CASCADE;
CREATE TABLE "fees" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "due_date" date NOT NULL,
  "end_date" date DEFAULT NULL,
  "due_charges" numeric(8,2) NOT NULL,
  "due_charges_amount" numeric(8,2) NOT NULL,
  "class_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "payment_method" varchar(50) DEFAULT NULL,
  "paid_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fees_session_year_id_foreign" ON "fees" ("session_year_id");
CREATE INDEX IF NOT EXISTS "fees_school_id_foreign" ON "fees" ("school_id");
CREATE INDEX IF NOT EXISTS "fees_class_id_foreign" ON "fees" ("class_id");

--
-- Dumping data for table fees
--

--
-- Table structure for table fees_advance
--

DROP TABLE IF EXISTS "fees_advance" CASCADE;
CREATE TABLE "fees_advance" (
  "id" bigserial NOT NULL,
  "compulsory_fee_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "parent_id" bigint NOT NULL,
  "amount" numeric(8,2) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fees_advance_compulsory_fee_id_foreign" ON "fees_advance" ("compulsory_fee_id");
CREATE INDEX IF NOT EXISTS "fees_advance_student_id_foreign" ON "fees_advance" ("student_id");
CREATE INDEX IF NOT EXISTS "fees_advance_parent_id_foreign" ON "fees_advance" ("parent_id");

--
-- Dumping data for table fees_advance
--

--
-- Table structure for table fees_class
--

DROP TABLE IF EXISTS "fees_class" CASCADE;
CREATE TABLE "fees_class" (
  "class_section_id" bigint NOT NULL,
  "fees_id" bigint NOT NULL,
  PRIMARY KEY ("class_section_id", "fees_id")
);
CREATE INDEX IF NOT EXISTS "fees_class_fees_id_foreign" ON "fees_class" ("fees_id");

--
-- Dumping data for table fees_class
--

--
-- Table structure for table fees_class_types
--

DROP TABLE IF EXISTS "fees_class_types" CASCADE;
CREATE TABLE "fees_class_types" (
  "id" bigserial NOT NULL,
  "class_id" bigint NOT NULL,
  "fees_id" bigint NOT NULL,
  "fees_type_id" bigint NOT NULL,
  "amount" numeric(64,2) NOT NULL,
  "optional" smallint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_ids" ON "fees_class_types" ("class_id", "fees_type_id", "school_id", "fees_id");
CREATE INDEX IF NOT EXISTS "fees_class_types_fees_id_foreign" ON "fees_class_types" ("fees_id");
CREATE INDEX IF NOT EXISTS "fees_class_types_fees_type_id_foreign" ON "fees_class_types" ("fees_type_id");
CREATE INDEX IF NOT EXISTS "fees_class_types_school_id_foreign" ON "fees_class_types" ("school_id");

--
-- Dumping data for table fees_class_types
--

--
-- Table structure for table fees_installments
--

DROP TABLE IF EXISTS "fees_installments" CASCADE;
CREATE TABLE "fees_installments" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "due_date" date NOT NULL,
  "due_charges_type" text NOT NULL DEFAULT 'percentage',
  "due_charges" integer NOT NULL,
  "fees_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fees_installments_fees_id_foreign" ON "fees_installments" ("fees_id");
CREATE INDEX IF NOT EXISTS "fees_installments_session_year_id_foreign" ON "fees_installments" ("session_year_id");
CREATE INDEX IF NOT EXISTS "fees_installments_school_id_foreign" ON "fees_installments" ("school_id");

--
-- Dumping data for table fees_installments
--

--
-- Table structure for table fees_paids
--

DROP TABLE IF EXISTS "fees_paids" CASCADE;
CREATE TABLE "fees_paids" (
  "id" bigserial NOT NULL,
  "fees_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "is_fully_paid" smallint NOT NULL,
  "is_used_installment" smallint NOT NULL,
  "amount" numeric(8,2) NOT NULL,
  "date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_ids" ON "fees_paids" ("student_id", "fees_id", "school_id");
CREATE INDEX IF NOT EXISTS "fees_paids_school_id_foreign" ON "fees_paids" ("school_id");
CREATE INDEX IF NOT EXISTS "fees_paids_fees_id_foreign" ON "fees_paids" ("fees_id");

--
-- Dumping data for table fees_paids
--

--
-- Table structure for table fees_payment_type
--

DROP TABLE IF EXISTS "fees_payment_type" CASCADE;
CREATE TABLE "fees_payment_type" (
  "id" serial NOT NULL,
  "type" varchar(255) NOT NULL,
  "an" varchar(255) NOT NULL,
  "norek" varchar(50) NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table fees_payment_type
--

--
-- Table structure for table fees_types
--

DROP TABLE IF EXISTS "fees_types" CASCADE;
CREATE TABLE "fees_types" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "description" varchar(191) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fees_types_school_id_foreign" ON "fees_types" ("school_id");

--
-- Dumping data for table fees_types
--

--
-- Table structure for table files
--

DROP TABLE IF EXISTS "files" CASCADE;
CREATE TABLE "files" (
  "id" bigserial NOT NULL,
  "modal_type" varchar(191) NOT NULL,
  "modal_id" bigint NOT NULL,
  "file_name" varchar(1024) DEFAULT NULL,
  "file_thumbnail" varchar(1024) DEFAULT NULL,
  "type" text NOT NULL,
  "file_url" varchar(1024) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "files_modal_type_modal_id_index" ON "files" ("modal_type", "modal_id");
CREATE INDEX IF NOT EXISTS "files_school_id_foreign" ON "files" ("school_id");

--
-- Dumping data for table files
--

--
-- Table structure for table filetype
--

DROP TABLE IF EXISTS "filetype" CASCADE;
CREATE TABLE "filetype" (
  "id" bigserial NOT NULL,
  "name" varchar(10) NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table filetype
--

--
-- Table structure for table folder_bendahara
--

DROP TABLE IF EXISTS "folder_bendahara" CASCADE;
CREATE TABLE "folder_bendahara" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_bendahara
--

--
-- Table structure for table folder_humas
--

DROP TABLE IF EXISTS "folder_humas" CASCADE;
CREATE TABLE "folder_humas" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_humas
--

--
-- Table structure for table folder_kesiswaan
--

DROP TABLE IF EXISTS "folder_kesiswaan" CASCADE;
CREATE TABLE "folder_kesiswaan" (
  "id" bigserial NOT NULL,
  "nama" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kesiswaan
--

--
-- Table structure for table folder_kpk
--

DROP TABLE IF EXISTS "folder_kpk" CASCADE;
CREATE TABLE "folder_kpk" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kpk
--

--
-- Table structure for table folder_kpk_elin
--

DROP TABLE IF EXISTS "folder_kpk_elin" CASCADE;
CREATE TABLE "folder_kpk_elin" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kpk_elin
--

--
-- Table structure for table folder_kpk_metro
--

DROP TABLE IF EXISTS "folder_kpk_metro" CASCADE;
CREATE TABLE "folder_kpk_metro" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kpk_metro
--

--
-- Table structure for table folder_kpk_rpl
--

DROP TABLE IF EXISTS "folder_kpk_rpl" CASCADE;
CREATE TABLE "folder_kpk_rpl" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kpk_rpl
--

--
-- Table structure for table folder_kpk_tkj
--

DROP TABLE IF EXISTS "folder_kpk_tkj" CASCADE;
CREATE TABLE "folder_kpk_tkj" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kpk_tkj
--

--
-- Table structure for table folder_kurikulum
--

DROP TABLE IF EXISTS "folder_kurikulum" CASCADE;
CREATE TABLE "folder_kurikulum" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_kurikulum
--

--
-- Table structure for table folder_pdsm
--

DROP TABLE IF EXISTS "folder_pdsm" CASCADE;
CREATE TABLE "folder_pdsm" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_pdsm
--

--
-- Table structure for table folder_perpus
--

DROP TABLE IF EXISTS "folder_perpus" CASCADE;
CREATE TABLE "folder_perpus" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_perpus
--

--
-- Table structure for table folder_sarpas
--

DROP TABLE IF EXISTS "folder_sarpas" CASCADE;
CREATE TABLE "folder_sarpas" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_sarpas
--

--
-- Table structure for table folder_tatib
--

DROP TABLE IF EXISTS "folder_tatib" CASCADE;
CREATE TABLE "folder_tatib" (
  "id" bigserial NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_tatib
--

--
-- Table structure for table folder_tu
--

DROP TABLE IF EXISTS "folder_tu" CASCADE;
CREATE TABLE "folder_tu" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table folder_tu
--

--
-- Table structure for table form_fields
--

DROP TABLE IF EXISTS "form_fields" CASCADE;
CREATE TABLE "form_fields" (
  "id" bigserial NOT NULL,
  "name" varchar(128) NOT NULL,
  "type" varchar(128) NOT NULL,
  "is_required" smallint NOT NULL DEFAULT '0',
  "default_values" text,
  "other" text,
  "school_id" bigint NOT NULL,
  "rank" integer NOT NULL DEFAULT '0',
  "display_on_id" integer NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "name" ON "form_fields" ("name", "school_id");
CREATE INDEX IF NOT EXISTS "form_fields_school_id_foreign" ON "form_fields" ("school_id");

--
-- Dumping data for table form_fields
--

--
-- Table structure for table galleries
--

DROP TABLE IF EXISTS "galleries" CASCADE;
CREATE TABLE "galleries" (
  "id" bigserial NOT NULL,
  "title" varchar(191) NOT NULL,
  "description" varchar(191) DEFAULT NULL,
  "thumbnail" varchar(191) DEFAULT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "galleries_session_year_id_foreign" ON "galleries" ("session_year_id");
CREATE INDEX IF NOT EXISTS "galleries_school_id_foreign" ON "galleries" ("school_id");

--
-- Dumping data for table galleries
--

--
-- Table structure for table grade_level
--

DROP TABLE IF EXISTS "grade_level" CASCADE;
CREATE TABLE "grade_level" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "grade_level_school_id_foreign" ON "grade_level" ("school_id");

--
-- Dumping data for table grade_level
--

--
-- Table structure for table grades
--

DROP TABLE IF EXISTS "grades" CASCADE;
CREATE TABLE "grades" (
  "id" bigserial NOT NULL,
  "starting_range" numeric(8,2) NOT NULL,
  "ending_range" numeric(8,2) NOT NULL,
  "grade" text NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "grades_school_id_foreign" ON "grades" ("school_id");

--
-- Dumping data for table grades
--

--
-- Table structure for table guardian_details
--

DROP TABLE IF EXISTS "guardian_details" CASCADE;
CREATE TABLE "guardian_details" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "nama_wali" varchar(191) NOT NULL,
  "tahun_lahir_wali" varchar(191) NOT NULL,
  "jenjang_pendidikan_wali" varchar(191) NOT NULL,
  "pekerjaan_wali" varchar(191) NOT NULL,
  "penghasilan_wali" varchar(191) NOT NULL,
  "NIK_wali" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "guardian_details_user_id_foreign" ON "guardian_details" ("user_id");

--
-- Dumping data for table guardian_details
--

--
-- Table structure for table guidances
--

DROP TABLE IF EXISTS "guidances" CASCADE;
CREATE TABLE "guidances" (
  "id" bigserial NOT NULL,
  "name" varchar(100) DEFAULT NULL,
  "link" text,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table guidances
--

--
-- Table structure for table holidays
--

DROP TABLE IF EXISTS "holidays" CASCADE;
CREATE TABLE "holidays" (
  "id" bigserial NOT NULL,
  "date" date NOT NULL,
  "title" varchar(128) NOT NULL,
  "description" varchar(1024) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "holidays_school_id_foreign" ON "holidays" ("school_id");

--
-- Dumping data for table holidays
--

--
-- Table structure for table jobs
--

DROP TABLE IF EXISTS "jobs" CASCADE;
CREATE TABLE "jobs" (
  "id" bigserial NOT NULL,
  "queue" varchar(191) NOT NULL,
  "payload" text NOT NULL,
  "attempts" smallint NOT NULL,
  "reserved_at" integer DEFAULT NULL,
  "available_at" integer NOT NULL,
  "created_at" integer NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "jobs_queue_index" ON "jobs" ("queue");

--
-- Dumping data for table jobs
--

--
-- Table structure for table kpks
--

DROP TABLE IF EXISTS "kpks" CASCADE;
CREATE TABLE "kpks" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "stream_id" bigint DEFAULT NULL,
  "name" varchar(150) NOT NULL,
  "mode_source" text NOT NULL DEFAULT 'crud',
  "is_active" smallint NOT NULL DEFAULT '1',
  "created_by" bigint DEFAULT NULL,
  "updated_by" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "uniq_kpk_school_name" ON "kpks" ("school_id", "name");
CREATE INDEX IF NOT EXISTS "idx_kpk_school_stream" ON "kpks" ("school_id", "stream_id");
CREATE INDEX IF NOT EXISTS "kpks_stream_id_foreign" ON "kpks" ("stream_id");

--
-- Dumping data for table kpks
--

--
-- Table structure for table languages
--

DROP TABLE IF EXISTS "languages" CASCADE;
CREATE TABLE "languages" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "code" varchar(64) NOT NULL,
  "file" varchar(512) NOT NULL,
  "status" smallint NOT NULL DEFAULT '0',
  "is_rtl" smallint NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "languages_code_unique" ON "languages" ("code");

--
-- Dumping data for table languages
--

INSERT INTO "languages" VALUES (1,'English','en','en.json',1,0,'2026-02-24 04:05:00','2026-02-24 04:05:00');

--
-- Table structure for table leave_details
--

DROP TABLE IF EXISTS "leave_details" CASCADE;
CREATE TABLE "leave_details" (
  "id" bigserial NOT NULL,
  "leave_id" bigint NOT NULL,
  "date" date NOT NULL,
  "type" varchar(191) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "leave_details_leave_id_foreign" ON "leave_details" ("leave_id");
CREATE INDEX IF NOT EXISTS "leave_details_school_id_foreign" ON "leave_details" ("school_id");

--
-- Dumping data for table leave_details
--

--
-- Table structure for table leave_masters
--

DROP TABLE IF EXISTS "leave_masters" CASCADE;
CREATE TABLE "leave_masters" (
  "id" bigserial NOT NULL,
  "leaves" numeric(8,2) NOT NULL,
  "holiday" varchar(191) NOT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "leave_masters_session_year_id_foreign" ON "leave_masters" ("session_year_id");
CREATE INDEX IF NOT EXISTS "leave_masters_school_id_foreign" ON "leave_masters" ("school_id");

--
-- Dumping data for table leave_masters
--

--
-- Table structure for table leaves
--

DROP TABLE IF EXISTS "leaves" CASCADE;
CREATE TABLE "leaves" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "reason" varchar(191) NOT NULL,
  "from_date" date NOT NULL,
  "to_date" date NOT NULL,
  "status" integer NOT NULL DEFAULT '0',
  "rejection_reason" text,
  "school_id" bigint NOT NULL,
  "leave_master_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "leaves_school_id_foreign" ON "leaves" ("school_id");
CREATE INDEX IF NOT EXISTS "leaves_leave_master_id_foreign" ON "leaves" ("leave_master_id");
CREATE INDEX IF NOT EXISTS "leaves_user_id_foreign" ON "leaves" ("user_id");

--
-- Dumping data for table leaves
--

--
-- Table structure for table lesson_topics
--

DROP TABLE IF EXISTS "lesson_topics" CASCADE;
CREATE TABLE "lesson_topics" (
  "id" bigserial NOT NULL,
  "lesson_id" bigint NOT NULL,
  "name" varchar(128) NOT NULL,
  "description" varchar(1024) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "lesson_topics_lesson_id_foreign" ON "lesson_topics" ("lesson_id");
CREATE INDEX IF NOT EXISTS "lesson_topics_school_id_foreign" ON "lesson_topics" ("school_id");

--
-- Dumping data for table lesson_topics
--

--
-- Table structure for table lessons
--

DROP TABLE IF EXISTS "lessons" CASCADE;
CREATE TABLE "lessons" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "description" varchar(1024) DEFAULT NULL,
  "class_section_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "lessons_school_id_foreign" ON "lessons" ("school_id");
CREATE INDEX IF NOT EXISTS "lessons_class_section_id_foreign" ON "lessons" ("class_section_id");
CREATE INDEX IF NOT EXISTS "lessons_class_subject_id_foreign" ON "lessons" ("class_subject_id");

--
-- Dumping data for table lessons
--

--
-- Table structure for table mediums
--

DROP TABLE IF EXISTS "mediums" CASCADE;
CREATE TABLE "mediums" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "school_id" bigint NOT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "mediums_school_id_foreign" ON "mediums" ("school_id");

--
-- Dumping data for table mediums
--

--
-- Table structure for table messages
--

DROP TABLE IF EXISTS "messages" CASCADE;
CREATE TABLE "messages" (
  "id" bigserial NOT NULL,
  "chat_id" bigint NOT NULL,
  "sender_id" bigint NOT NULL,
  "message" text,
  "read_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "messages_chat_id_foreign" ON "messages" ("chat_id");
CREATE INDEX IF NOT EXISTS "messages_sender_id_foreign" ON "messages" ("sender_id");

--
-- Dumping data for table messages
--

--
-- Table structure for table migrations
--

DROP TABLE IF EXISTS "migrations" CASCADE;
CREATE TABLE "migrations" (
  "id" serial NOT NULL,
  "migration" varchar(191) NOT NULL,
  "batch" integer NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table migrations
--

INSERT INTO "migrations" VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_04_01_091033_create_permission_tables',1),(6,'2022_04_01_105826_all_tables',1),(7,'2023_11_16_134449_version1-0-1',1),(8,'2023_12_07_120054_version1_1_0',1),(9,'2024_01_30_092228_version1_2_0',1),(10,'2024_03_12_173521_version1_3_0',1),(11,'2024_05_21_094714_version1_3_2',1),(12,'2024_07_21_093657_version1_4_0',1),(13,'2024_08_08_094709_version1_4_1',1),(16,'2024_12_18_150019_create_folder_kesiswaans_table',2),(17,'2024_12_18_150019_create_folder_kesiswaan_table',3),(18,'2024_12_18_153439_create_folder_tatib_table',4),(19,'2024_12_17_085057_create_upload_file_and_tag_dokumen_tatib_tables',5),(20,'2024_12_17_090441_create_upload_file_and_tag_dokumen_kesiswaan_tables',6),(21,'2024_10_03_173555_version_1_4_1',7),(22,'2024_10_15_083944_create_subject_attendances_table',7),(23,'2024_10_16_082506_create_guardian_details_table',7),(24,'2024_10_16_090246_create_subject_attendance_students_table',7),(25,'2024_10_17_110509_create_special_fees_table',7),(26,'2024_10_24_094601_create_bank_soal_table',7),(27,'2024_10_29_091912_create_absensi_settings_table',7),(28,'2024_11_04_083600_create_recap_edits_table',7),(29,'2024_11_04_085138_create_attendance_points_table',7),(30,'2024_12_19_074541_folder_humas',8),(31,'2024_01_01_000001_create_user_relation_table',9),(32,'2024_03_21_111000_create_edu_level_table',9),(33,'2024_03_21_112000_create_grade_level_table',9),(34,'2024_03_21_154023_create_schools_table',9),(35,'2024_03_21_154026_create_session_years_table',9),(36,'2025_01_10_112325_add_subject_id_and_type_to_bank_soal_table',9),(37,'2025_01_19_000000_add_timezone_to_schools_table',9),(38,'2025_03_21_153843_create_absensi_settings_table',9),(39,'2025_03_21_153844_create_academic_calendars_table',9),(40,'2025_03_21_153845_create_accepted_file_table',9),(41,'2025_03_21_153846_create_addon_subscriptions_table',9),(42,'2025_03_21_153847_create_addons_table',9),(43,'2025_03_21_153848_create_announcement_classes_table',9),(44,'2025_03_21_153849_create_announcements_table',9),(45,'2025_03_21_153850_create_assignment_submissions_table',9),(46,'2025_03_21_153851_create_assignments_table',9),(47,'2025_03_21_153852_create_attachments_table',9),(48,'2025_03_21_153853_create_attendance_points_table',9),(49,'2025_03_21_153854_create_attendances_table',9),(50,'2025_03_21_153855_create_auto_absen_admins_table',9),(51,'2025_03_21_153856_create_bank_soal_table',9),(52,'2025_03_21_153857_create_bank_soal_detail_table',9),(53,'2025_03_21_153858_create_bank_soal_versions_table',9),(54,'2025_03_21_153859_create_categories_table',9),(55,'2025_03_21_153900_create_certificate_templates_table',9),(56,'2025_03_21_153901_create_chats_table',9),(57,'2025_03_21_153902_create_class_groups_table',9),(58,'2025_03_21_153903_create_class_sections_table',9),(59,'2025_03_21_153904_create_class_subjects_table',9),(60,'2025_03_21_153905_create_class_teachers_table',9),(61,'2025_03_21_153906_create_classes_table',9),(62,'2025_03_21_153907_create_compulsory_fees_table',9),(63,'2025_03_21_153908_create_database_backups_table',9),(64,'2025_03_21_153909_create_elective_subject_groups_table',9),(65,'2025_03_21_153910_create_exam_marks_table',9),(66,'2025_03_21_153911_create_exam_results_table',9),(67,'2025_03_21_153912_create_exam_timetables_table',9),(68,'2025_03_21_153913_create_exams_table',9),(69,'2025_03_21_153914_create_expense_categories_table',9),(70,'2025_03_21_153915_create_expenses_table',9),(71,'2025_03_21_153916_create_extra_student_datas_table',9),(72,'2025_03_21_153917_create_failed_jobs_table',9),(73,'2025_03_21_153918_create_faqs_table',9),(74,'2025_03_21_153919_create_feature_section_lists_table',9),(75,'2025_03_21_153920_create_feature_sections_table',9),(76,'2025_03_21_153921_create_features_table',9),(77,'2025_03_21_153922_create_fees_table',9),(78,'2025_03_21_153923_create_fees_advance_table',9),(79,'2025_03_21_153924_create_fees_class_types_table',9),(80,'2025_03_21_153925_create_fees_installments_table',9),(81,'2025_03_21_153926_create_fees_paids_table',9),(82,'2025_03_21_153927_create_fees_payment_types_table',9),(83,'2025_03_21_153928_create_fees_types_table',9),(84,'2025_03_21_153929_create_files_table',9),(85,'2025_03_21_153930_create_filetype_table',9),(86,'2025_03_21_153931_create_folder_bendahara_table',9),(87,'2025_03_21_153932_create_folder_humas_table',9),(88,'2025_03_21_153933_create_folder_kesiswaan_table',9),(89,'2025_03_21_153934_create_folder_kpk_table',9),(90,'2025_03_21_153935_create_folder_kpk_elin_table',9),(91,'2025_03_21_153936_create_folder_kpk_metro_table',9),(92,'2025_03_21_153937_create_folder_kpk_rpl_table',9),(93,'2025_03_21_153938_create_folder_kpk_tkj_table',9),(94,'2025_03_21_153939_create_folder_kurikulum_table',9),(95,'2025_03_21_153940_create_folder_pdsm_table',9),(96,'2025_03_21_153941_create_folder_perpus_table',9),(97,'2025_03_21_153942_create_folder_sarpas_table',9),(98,'2025_03_21_153943_create_folder_tatib_table',9),(99,'2025_03_21_153944_create_folder_tu_table',9),(100,'2025_03_21_153945_create_form_fields_table',9),(101,'2025_03_21_153946_create_galleries_table',9),(102,'2025_03_21_153947_create_grades_table',9),(103,'2025_03_21_153948_create_guardian_details_table',9),(104,'2025_03_21_153949_create_guidances_table',9),(105,'2025_03_21_153950_create_holidays_table',9),(106,'2025_03_21_153951_create_languages_table',9),(107,'2025_03_21_153952_create_leave_details_table',9),(108,'2025_03_21_153953_create_leave_masters_table',9),(109,'2025_03_21_153954_create_leaves_table',9),(110,'2025_03_21_153955_create_lesson_topics_table',9),(111,'2025_03_21_153956_create_lessons_table',9),(112,'2025_03_21_153957_create_mediums_table',9),(113,'2025_03_21_153958_create_messages_table',9),(114,'2025_03_21_153959_create_model_has_permissions_table',9),(115,'2025_03_21_154000_create_model_has_roles_table',9),(116,'2025_03_21_154001_create_notifications_table',9),(117,'2025_03_21_154002_create_online_exam_answer_not_multiple_choices_table',9),(118,'2025_03_21_154003_create_online_exam_question_choices_table',9),(119,'2025_03_21_154004_create_online_exam_question_options_table',9),(120,'2025_03_21_154005_create_online_exam_questions_table',9),(121,'2025_03_21_154006_create_online_exam_student_answers_table',9),(122,'2025_03_21_154007_create_online_exam_student_marks_table',9),(123,'2025_03_21_154008_create_online_exams_table',9),(124,'2025_03_21_154009_create_optional_fees_table',9),(125,'2025_03_21_154010_create_package_features_table',9),(126,'2025_03_21_154011_create_packages_table',9),(127,'2025_03_21_154012_create_password_resets_table',9),(128,'2025_03_21_154013_create_payment_configurations_table',9),(129,'2025_03_21_154014_create_payment_transactions_table',9),(130,'2025_03_21_154015_create_payroll_settings_table',9),(131,'2025_03_21_154016_create_permissions_table',9),(132,'2025_03_21_154017_create_personal_access_tokens_table',9),(133,'2025_03_21_154018_create_promote_students_table',9),(134,'2025_03_21_154019_create_recap_edits_table',9),(135,'2025_03_21_154020_create_role_has_permissions_table',9),(136,'2025_03_21_154021_create_roles_table',9),(137,'2025_03_21_154022_create_school_settings_table',9),(138,'2025_03_21_154024_create_sections_table',9),(139,'2025_03_21_154025_create_semesters_table',9),(140,'2025_03_21_154027_create_shifts_table',9),(141,'2025_03_21_154028_create_sliders_table',9),(142,'2025_03_21_154029_create_special_fees_table',9),(143,'2025_03_21_154030_create_staff_payrolls_table',9),(144,'2025_03_21_154031_create_staff_salaries_table',9),(145,'2025_03_21_154032_create_staff_support_schools_table',9),(146,'2025_03_21_154033_create_staffs_table',9),(147,'2025_03_21_154034_create_streams_table',9),(148,'2025_03_21_154035_create_student_online_exam_statuses_table',9),(149,'2025_03_21_154036_create_student_subjects_table',9),(150,'2025_03_21_154037_create_students_table',9),(151,'2025_03_21_154038_create_subject_attendance_students_table',9),(152,'2025_03_21_154039_create_subject_attendances_table',9),(153,'2025_03_21_154040_create_subject_teachers_table',9),(154,'2025_03_21_154041_create_subjects_table',9),(155,'2025_03_21_154042_create_subscription_bills_table',9),(156,'2025_03_21_154043_create_subscription_features_table',9),(157,'2025_03_21_154044_create_subscriptions_table',9),(158,'2025_03_21_154045_create_system_settings_table',9),(159,'2025_03_21_154046_create_tag_dokumen_bendahara_table',9),(160,'2025_03_21_154047_create_tag_dokumen_humas_table',9),(161,'2025_03_21_154048_create_tag_dokumen_kesiswaan_table',9),(162,'2025_03_21_154049_create_tag_dokumen_kpk_table',9),(163,'2025_03_21_154050_create_tag_dokumen_kpk_elin_table',9),(164,'2025_03_21_154051_create_tag_dokumen_kpk_metro_table',9),(165,'2025_03_21_154052_create_tag_dokumen_kpk_rpl_table',9),(166,'2025_03_21_154053_create_tag_dokumen_kpk_tkj_table',9),(167,'2025_03_21_154054_create_tag_dokumen_kurikulum_table',9),(168,'2025_03_21_154055_create_tag_dokumen_pdsm_table',9),(169,'2025_03_21_154056_create_tag_dokumen_perpus_table',9),(170,'2025_03_21_154057_create_tag_dokumen_sarpas_table',9),(171,'2025_03_21_154058_create_tag_dokumen_tatib_table',9),(172,'2025_03_21_154059_create_tag_dokumen_tu_table',9),(173,'2025_03_21_154100_create_timetables_table',9),(174,'2025_03_21_154101_create_upload_file_bendahara_table',9),(175,'2025_03_21_154102_create_upload_file_humas_table',9),(176,'2025_03_21_154103_create_upload_file_kesiswaan_table',9),(177,'2025_03_21_154104_create_upload_file_kpk_table',9),(178,'2025_03_21_154105_create_upload_file_kpk_elin_table',9),(179,'2025_03_21_154106_create_upload_file_kpk_metro_table',9),(180,'2025_03_21_154107_create_upload_file_kpk_rpl_table',9),(181,'2025_03_21_154108_create_upload_file_kpk_tkj_table',9),(182,'2025_03_21_154109_create_upload_file_kurikulum_table',9),(183,'2025_03_21_154110_create_upload_file_pdsm_table',9),(184,'2025_03_21_154111_create_upload_file_perpus_table',9),(185,'2025_03_21_154112_create_upload_file_sarpas_table',9),(186,'2025_03_21_154113_create_upload_file_tatib_table',9),(187,'2025_03_21_154114_create_upload_file_tu_table',9),(188,'2025_03_21_154115_create_user_status_for_next_cycles_table',9),(189,'2025_03_21_154116_create_users_table',9),(190,'2025_03_21_155714_add_foreign_key_constraints',9),(191,'2025_04_25_092206_create_recap_absensi_table',9),(192,'2025_04_29_142252_create_payment_methods_table',9),(193,'2025_06_30_123456_create_payment_history_table',9),(194,'2025_07_18_135038_add_original_class_section_id_to_recap_absensi_table',9),(195,'2025_07_19_173235_add_original_class_section_id_to_promote_students_table',9),(196,'2025_07_21_161849_add_edu_level_id_to_schools_table',9),(197,'2025_07_22_090331_add_school_id_to_grade_level_table',9),(198,'2025_07_22_101102_add_deleted_at_to_grade_level_table',9),(199,'2025_07_22_111926_add_grade_level_id_to_classes_table',9),(200,'2025_07_22_162049_add_grade_level_id_to_class_sections_table',9),(201,'2025_07_23_095441_add_grade_level_id_to_students_table',9),(202,'2025_07_23_101200_add_grade_levels_to_promote_students_table',9),(203,'2025_07_23_112929_add_original_class_section_id_to_students_table',9),(204,'2025_07_23_145441_add_session_year_id_to_class_sections_table',9),(205,'2025_07_24_100206_fill_address_and_mobile_in_student_table',9),(206,'2025_07_24_113610_fill_class_grade_data_in_students_table',9),(207,'2025_08_12_092724_add_grade_level_id_to_subject_attendances_table',9),(208,'2025_08_12_222930_add_grade_level_id_to_attendances_table',9),(209,'2025_08_12_225702_add_grade_level_id_to_exam_marks',9),(210,'2025_08_12_232512_add_grade_level_id_to_online_exams',9),(211,'2025_08_14_133248_create_original_classes_table',9),(212,'2025_08_16_171101_create_kpks_table',9),(213,'2025_08_16_171745_create_modules_table',9),(214,'2025_08_16_172629_create_document_folders_table',9),(215,'2025_08_16_173107_create_document_files_table',9),(216,'2025_08_20_093357_add_delete_at_to_kpks_table',9),(217,'2025_08_20_095255_alter_enum_add_image_choice',9),(218,'2025_08_20_095831_add_billing_disabled_columns_to_students_table',9),(219,'2025_08_20_101059_add_image_url_to_online_exam_question_options_table',9),(220,'2025_08_21_091916_add_grade_level_id_to_exams_table',9),(221,'2025_08_21_145225_add_description_to_document_files_table',9),(222,'2025_08_27_154444_add_nip_to_users_table',9),(223,'2025_08_28_112737_create_attendance_days_table',9),(224,'2025_09_03_152932_add_rejection_reason_to_payment_history_table',9),(225,'2025_09_04_143350_add_description_to_payment_methods_table',9),(226,'2025_09_08_105721_add_end_date_to_fees_table',9),(227,'2025_09_08_140102_add_staff_fk_to_absensi_settings_table',9),(228,'2025_09_09_144416_create_receipt_settings_table',9),(229,'2025_09_11_160146_add_start_date_to_fees_table',9),(230,'2025_09_12_153829_device_tokens_table',9),(231,'2025_09_29_142653_create_school_inquiries_table',9),(232,'2025_09_29_155716_create_contact_inquiries_table',9),(233,'2025_10_07_update_contact_inquiries_add_status',9),(234,'2025_10_08_160307_add_database_status_to_school_inquiries_table',9),(235,'2025_10_13_085414_create_jobs_table',9),(236,'2025_10_13_093032_add_last_backup_at_to_database_backups_table',9),(237,'2025_10_14_000001_add_trial_days_to_packages_table',9),(238,'2025_10_15_000000_create_trial_reminder_logs_table',9),(239,'2025_10_15_132256_add_type_to_contact_inquiries_table',9),(240,'2025_10_31_085727_create_estrakulikulers_table',9),(241,'2025_10_31_090447_create_eskul_timetables_table',9),(242,'2025_10_31_091106_create_eskul_details_table',9),(243,'2025_10_31_103620_create_eskul_absensis_table',9),(244,'2025_11_03_000001_add_trial_limits',9),(245,'2025_11_04_000001_remove_subscriptions_school_id_foreign_key',9),(246,'2025_11_04_105846_create_sessions_table',9),(247,'2026_01_22_100532_create_api_tokens_table',9),(248,'2026_01_22_113841_create_otp_verifications_table',9),(249,'2026_01_22_125603_add_phone_to_users_table',9),(250,'2026_01_23_103409_add_school_info_to_otp_verifications',9),(251,'2026_01_23_111500_add_phone_to_users_table',9),(252,'2026_02_02_131845_create_beginning_balance_table',9),(253,'2026_02_02_add_xendit_fields_to_schools_table',9),(254,'2026_02_02_create_xendit_invoice_fees_table',9),(255,'2026_02_02_create_xendit_invoices_table',9),(256,'2026_02_05_100100_add_payment_tracking_to_fees_table',9),(257,'2026_02_05_100200_update_payment_transactions_table',9),(258,'2026_02_18_100725_add_limit_columns_to_packages_table',9),(259,'2026_02_20_000001_sync_schema_fields',9);

--
-- Table structure for table model_has_permissions
--

DROP TABLE IF EXISTS "model_has_permissions" CASCADE;
CREATE TABLE "model_has_permissions" (
  "permission_id" bigint NOT NULL,
  "model_type" varchar(191) NOT NULL,
  "model_id" bigint NOT NULL,
  PRIMARY KEY ("permission_id", "model_id", "model_type")
);
CREATE INDEX IF NOT EXISTS "model_has_permissions_model_id_model_type_index" ON "model_has_permissions" ("model_id", "model_type");

--
-- Dumping data for table model_has_permissions
--

--
-- Table structure for table model_has_roles
--

DROP TABLE IF EXISTS "model_has_roles" CASCADE;
CREATE TABLE "model_has_roles" (
  "role_id" bigint NOT NULL,
  "model_type" varchar(191) NOT NULL,
  "model_id" bigint NOT NULL,
  PRIMARY KEY ("role_id", "model_id", "model_type")
);
CREATE INDEX IF NOT EXISTS "model_has_roles_model_id_model_type_index" ON "model_has_roles" ("model_id", "model_type");

--
-- Dumping data for table model_has_roles
--

INSERT INTO "model_has_roles" VALUES (3,'App\\Models\\User',1),(2,'App\\Models\\User',2),(1,'App\\Models\\User',3),(1,'App\\Models\\User',4),(1,'App\\Models\\User',5),(1,'App\\Models\\User',6),(1,'App\\Models\\User',7);

--
-- Table structure for table modules
--

DROP TABLE IF EXISTS "modules" CASCADE;
CREATE TABLE "modules" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "code" varchar(50) NOT NULL,
  "name" varchar(100) NOT NULL,
  "is_active" smallint NOT NULL DEFAULT '1',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "uniq_module_school_code" ON "modules" ("school_id", "code");

--
-- Dumping data for table modules
--

--
-- Table structure for table notifications
--

DROP TABLE IF EXISTS "notifications" CASCADE;
CREATE TABLE "notifications" (
  "id" bigserial NOT NULL,
  "title" varchar(191) NOT NULL,
  "message" varchar(191) DEFAULT NULL,
  "image" varchar(191) DEFAULT NULL,
  "send_to" varchar(191) NOT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "notifications_session_year_id_foreign" ON "notifications" ("session_year_id");
CREATE INDEX IF NOT EXISTS "notifications_school_id_foreign" ON "notifications" ("school_id");

--
-- Dumping data for table notifications
--

--
-- Table structure for table online_exam_answer_not_multiple_choices
--

DROP TABLE IF EXISTS "online_exam_answer_not_multiple_choices" CASCADE;
CREATE TABLE "online_exam_answer_not_multiple_choices" (
  "id" bigserial NOT NULL,
  "answer" text NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "is_answer_correction" smallint DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table online_exam_answer_not_multiple_choices
--

--
-- Table structure for table online_exam_question_choices
--

DROP TABLE IF EXISTS "online_exam_question_choices" CASCADE;
CREATE TABLE "online_exam_question_choices" (
  "id" bigserial NOT NULL,
  "online_exam_id" bigint NOT NULL,
  "question_id" bigint NOT NULL,
  "marks" integer DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "online_exam_question_choices_school_id_foreign" ON "online_exam_question_choices" ("school_id");
CREATE INDEX IF NOT EXISTS "online_exam_question_choices_online_exam_id_foreign" ON "online_exam_question_choices" ("online_exam_id");
CREATE INDEX IF NOT EXISTS "online_exam_question_choices_question_id_foreign" ON "online_exam_question_choices" ("question_id");

--
-- Dumping data for table online_exam_question_choices
--

--
-- Table structure for table online_exam_question_options
--

DROP TABLE IF EXISTS "online_exam_question_options" CASCADE;
CREATE TABLE "online_exam_question_options" (
  "id" bigserial NOT NULL,
  "question_id" bigint NOT NULL,
  "option" varchar(1024) NOT NULL,
  "image_url" varchar(1024) DEFAULT NULL,
  "is_answer" smallint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "online_exam_question_options_question_id_foreign" ON "online_exam_question_options" ("question_id");
CREATE INDEX IF NOT EXISTS "online_exam_question_options_school_id_foreign" ON "online_exam_question_options" ("school_id");

--
-- Dumping data for table online_exam_question_options
--

--
-- Table structure for table online_exam_questions
--

DROP TABLE IF EXISTS "online_exam_questions" CASCADE;
CREATE TABLE "online_exam_questions" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "question" varchar(1024) NOT NULL,
  "image_url" varchar(1024) DEFAULT NULL,
  "note" varchar(1024) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "last_edited_by" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "type" text NOT NULL DEFAULT 'multiple_choice',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "online_exam_questions_school_id_foreign" ON "online_exam_questions" ("school_id");
CREATE INDEX IF NOT EXISTS "online_exam_questions_class_section_id_foreign" ON "online_exam_questions" ("class_section_id");
CREATE INDEX IF NOT EXISTS "online_exam_questions_class_subject_id_foreign" ON "online_exam_questions" ("class_subject_id");
CREATE INDEX IF NOT EXISTS "online_exam_questions_last_edited_by_foreign" ON "online_exam_questions" ("last_edited_by");

--
-- Dumping data for table online_exam_questions
--

--
-- Table structure for table online_exam_student_answers
--

DROP TABLE IF EXISTS "online_exam_student_answers" CASCADE;
CREATE TABLE "online_exam_student_answers" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "online_exam_id" bigint NOT NULL,
  "question_id" bigint NOT NULL,
  "option_id" bigint NOT NULL,
  "submitted_date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "online_exam_student_answers_school_id_foreign" ON "online_exam_student_answers" ("school_id");
CREATE INDEX IF NOT EXISTS "online_exam_student_answers_student_id_foreign" ON "online_exam_student_answers" ("student_id");
CREATE INDEX IF NOT EXISTS "online_exam_student_answers_online_exam_id_foreign" ON "online_exam_student_answers" ("online_exam_id");
CREATE INDEX IF NOT EXISTS "online_exam_student_answers_question_id_foreign" ON "online_exam_student_answers" ("question_id");
CREATE INDEX IF NOT EXISTS "online_exam_student_answers_option_id_foreign" ON "online_exam_student_answers" ("option_id");

--
-- Dumping data for table online_exam_student_answers
--

--
-- Table structure for table online_exam_student_marks
--

DROP TABLE IF EXISTS "online_exam_student_marks" CASCADE;
CREATE TABLE "online_exam_student_marks" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "online_exam_id" bigint NOT NULL,
  "marks" numeric(5,2) NOT NULL DEFAULT '0.00',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "online_exam_student_marks_student_id_foreign" ON "online_exam_student_marks" ("student_id");
CREATE INDEX IF NOT EXISTS "online_exam_student_marks_online_exam_id_foreign" ON "online_exam_student_marks" ("online_exam_id");

--
-- Dumping data for table online_exam_student_marks
--

--
-- Table structure for table online_exams
--

DROP TABLE IF EXISTS "online_exams" CASCADE;
CREATE TABLE "online_exams" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "grade_level_id" bigint DEFAULT NULL,
  "class_subject_id" bigint NOT NULL,
  "title" varchar(128) NOT NULL,
  "exam_key" bigint NOT NULL,
  "duration" integer NOT NULL,
  "start_date" timestamp NOT NULL,
  "end_date" timestamp NOT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "online_exams_school_id_foreign" ON "online_exams" ("school_id");
CREATE INDEX IF NOT EXISTS "online_exams_class_section_id_foreign" ON "online_exams" ("class_section_id");
CREATE INDEX IF NOT EXISTS "online_exams_class_subject_id_foreign" ON "online_exams" ("class_subject_id");
CREATE INDEX IF NOT EXISTS "online_exams_session_year_id_foreign" ON "online_exams" ("session_year_id");
CREATE INDEX IF NOT EXISTS "idx_online_exams_grade_level_id" ON "online_exams" ("grade_level_id");

--
-- Dumping data for table online_exams
--

--
-- Table structure for table optional_fees
--

DROP TABLE IF EXISTS "optional_fees" CASCADE;
CREATE TABLE "optional_fees" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "class_id" bigint NOT NULL,
  "payment_transaction_id" bigint DEFAULT NULL,
  "fees_class_id" bigint DEFAULT NULL,
  "mode" text NOT NULL,
  "cheque_no" varchar(191) DEFAULT NULL,
  "amount" numeric(8,2) NOT NULL,
  "fees_paid_id" bigint DEFAULT NULL,
  "date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "status" text NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "optional_fees_school_id_foreign" ON "optional_fees" ("school_id");
CREATE INDEX IF NOT EXISTS "optional_fees_student_id_foreign" ON "optional_fees" ("student_id");
CREATE INDEX IF NOT EXISTS "optional_fees_class_id_foreign" ON "optional_fees" ("class_id");
CREATE INDEX IF NOT EXISTS "optional_fees_payment_transaction_id_foreign" ON "optional_fees" ("payment_transaction_id");
CREATE INDEX IF NOT EXISTS "optional_fees_fees_paid_id_foreign" ON "optional_fees" ("fees_paid_id");
CREATE INDEX IF NOT EXISTS "optional_fees_fees_class_id_foreign" ON "optional_fees" ("fees_class_id");

--
-- Dumping data for table optional_fees
--

--
-- Table structure for table original_classes
--

DROP TABLE IF EXISTS "original_classes" CASCADE;
CREATE TABLE "original_classes" (
  "id" bigserial NOT NULL,
  "original_key" char(36) NOT NULL,
  "student_id" bigint DEFAULT NULL,
  "user_id" bigint DEFAULT NULL,
  "class_id" bigint DEFAULT NULL,
  "class_section_id" bigint DEFAULT NULL,
  "session_year_id" bigint DEFAULT NULL,
  "school_id" bigint DEFAULT NULL,
  "admission_no" varchar(512) DEFAULT NULL,
  "roll_number" integer DEFAULT NULL,
  "admission_date" date DEFAULT NULL,
  "student_name" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "original_classes_user_id_foreign" ON "original_classes" ("user_id");
CREATE INDEX IF NOT EXISTS "original_classes_class_id_foreign" ON "original_classes" ("class_id");
CREATE INDEX IF NOT EXISTS "original_classes_class_section_id_foreign" ON "original_classes" ("class_section_id");
CREATE INDEX IF NOT EXISTS "oc_sess_cls_idx" ON "original_classes" ("session_year_id", "class_section_id");
CREATE INDEX IF NOT EXISTS "oc_student_sess_idx" ON "original_classes" ("student_id", "session_year_id");
CREATE INDEX IF NOT EXISTS "oc_original_key_idx" ON "original_classes" ("original_key");

--
-- Dumping data for table original_classes
--

--
-- Table structure for table otp_verifications
--

DROP TABLE IF EXISTS "otp_verifications" CASCADE;
CREATE TABLE "otp_verifications" (
  "id" bigserial NOT NULL,
  "phone" varchar(191) NOT NULL,
  "school_id" integer DEFAULT NULL,
  "school_code" varchar(50) DEFAULT NULL,
  "otp" varchar(6) NOT NULL,
  "expires_at" timestamp NOT NULL,
  "is_verified" smallint NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table otp_verifications
--

--
-- Table structure for table package_features
--

DROP TABLE IF EXISTS "package_features" CASCADE;
CREATE TABLE "package_features" (
  "id" bigserial NOT NULL,
  "package_id" bigint NOT NULL,
  "feature_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique" ON "package_features" ("package_id", "feature_id");
CREATE INDEX IF NOT EXISTS "package_features_package_id_index" ON "package_features" ("package_id");
CREATE INDEX IF NOT EXISTS "package_features_feature_id_index" ON "package_features" ("feature_id");

--
-- Dumping data for table package_features
--

--
-- Table structure for table packages
--

DROP TABLE IF EXISTS "packages" CASCADE;
CREATE TABLE "packages" (
  "id" bigserial NOT NULL,
  "name" varchar(191) DEFAULT NULL,
  "description" varchar(191) DEFAULT NULL,
  "tagline" varchar(191) DEFAULT NULL,
  "student_charge" numeric(8,2) NOT NULL,
  "staff_charge" numeric(8,2) NOT NULL,
  "days" integer NOT NULL DEFAULT '1',
  "type" integer NOT NULL DEFAULT '1',
  "no_of_students" integer NOT NULL DEFAULT '0',
  "no_of_staffs" integer NOT NULL DEFAULT '0',
  "charges" numeric(8,2) NOT NULL,
  "status" smallint NOT NULL DEFAULT '0',
  "is_trial" integer NOT NULL DEFAULT '0',
  "student_limit" integer NOT NULL DEFAULT '0',
  "staff_limit" integer NOT NULL DEFAULT '0',
  "class_limit" integer NOT NULL DEFAULT '0',
  "subject_limit" integer NOT NULL DEFAULT '0',
  "announcement_limit" integer NOT NULL DEFAULT '0',
  "assignment_limit" integer NOT NULL DEFAULT '0',
  "exam_limit" integer NOT NULL DEFAULT '0',
  "holiday_limit" integer NOT NULL DEFAULT '0',
  "features_json" text,
  "trial_days" integer NOT NULL DEFAULT '14',
  "highlight" smallint NOT NULL DEFAULT '0',
  "rank" integer NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table packages
--

--
-- Table structure for table password_resets
--

DROP TABLE IF EXISTS "password_resets" CASCADE;
CREATE TABLE "password_resets" (
  "email" varchar(191) NOT NULL,
  "token" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL
);
CREATE INDEX IF NOT EXISTS "password_resets_email_index" ON "password_resets" ("email");

--
-- Dumping data for table password_resets
--

--
-- Table structure for table payment_configurations
--

DROP TABLE IF EXISTS "payment_configurations" CASCADE;
CREATE TABLE "payment_configurations" (
  "id" bigserial NOT NULL,
  "payment_method" varchar(191) NOT NULL,
  "api_key" varchar(191) NOT NULL,
  "secret_key" varchar(191) NOT NULL,
  "webhook_secret_key" varchar(191) NOT NULL,
  "bank_name" varchar(191) DEFAULT NULL,
  "account_name" varchar(191) DEFAULT NULL,
  "account_no" varchar(191) DEFAULT NULL,
  "currency_code" varchar(128) DEFAULT NULL,
  "status" smallint NOT NULL DEFAULT '1',
  "school_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "payment_configurations_school_id_foreign" ON "payment_configurations" ("school_id");

--
-- Dumping data for table payment_configurations
--

--
-- Table structure for table payment_history
--

DROP TABLE IF EXISTS "payment_history" CASCADE;
CREATE TABLE "payment_history" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "fees_id" bigint NOT NULL,
  "status" text NOT NULL DEFAULT 'pending',
  "rejection_reason" text,
  "amount" numeric(21,2) NOT NULL,
  "proof_image" varchar(255) DEFAULT NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "time" timestamp DEFAULT NULL,
  "payment_method_id" bigint NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "payment_history_user_id_index" ON "payment_history" ("user_id");
CREATE INDEX IF NOT EXISTS "payment_history_student_id_index" ON "payment_history" ("student_id");
CREATE INDEX IF NOT EXISTS "payment_history_fees_id_index" ON "payment_history" ("fees_id");
CREATE INDEX IF NOT EXISTS "payment_history_payment_method_id_index" ON "payment_history" ("payment_method_id");

--
-- Dumping data for table payment_history
--

--
-- Table structure for table payment_methods
--

DROP TABLE IF EXISTS "payment_methods" CASCADE;
CREATE TABLE "payment_methods" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "account_number" varchar(191) NOT NULL,
  "account_holder" varchar(191) NOT NULL,
  "description" text,
  "image" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table payment_methods
--

--
-- Table structure for table payment_transactions
--

DROP TABLE IF EXISTS "payment_transactions" CASCADE;
CREATE TABLE "payment_transactions" (
  "id" bigserial NOT NULL,
  "invoice_id" varchar(255) DEFAULT NULL,
  "transaction_id" varchar(255) DEFAULT NULL,
  "user_id" bigint NOT NULL,
  "amount" numeric(64,2) NOT NULL,
  "payment_gateway" varchar(191) NOT NULL,
  "order_id" varchar(191) DEFAULT NULL,
  "payment_id" varchar(191) DEFAULT NULL,
  "payment_signature" varchar(191) DEFAULT NULL,
  "payment_status" text NOT NULL,
  "payment_method" varchar(50) DEFAULT NULL,
  "fee_ids" json DEFAULT NULL,
  "confirmed_at" timestamp NULL DEFAULT NULL,
  "confirmed_by" bigint DEFAULT NULL,
  "status" varchar(50) DEFAULT NULL,
  "school_id" bigint DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "payment_transactions_transaction_id_unique" ON "payment_transactions" ("transaction_id");
CREATE INDEX IF NOT EXISTS "payment_transactions_school_id_foreign" ON "payment_transactions" ("school_id");
CREATE INDEX IF NOT EXISTS "payment_transactions_user_id_foreign" ON "payment_transactions" ("user_id");

--
-- Dumping data for table payment_transactions
--

--
-- Table structure for table payroll_settings
--

DROP TABLE IF EXISTS "payroll_settings" CASCADE;
CREATE TABLE "payroll_settings" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "amount" double precision DEFAULT NULL,
  "percentage" numeric(8,2) DEFAULT NULL,
  "type" varchar(191) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "payroll_settings_school_id_foreign" ON "payroll_settings" ("school_id");

--
-- Dumping data for table payroll_settings
--

--
-- Table structure for table permissions
--

DROP TABLE IF EXISTS "permissions" CASCADE;
CREATE TABLE "permissions" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "guard_name" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "permissions_name_guard_name_unique" ON "permissions" ("name", "guard_name");

--
-- Dumping data for table permissions
--

INSERT INTO "permissions" VALUES (1,'role-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(2,'role-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(3,'role-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(4,'role-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(5,'language-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(6,'language-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(7,'language-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(8,'language-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(9,'schools-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(10,'schools-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(11,'schools-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(12,'schools-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(13,'package-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(14,'package-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(15,'package-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(16,'package-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(17,'addons-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(18,'addons-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(19,'addons-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(20,'addons-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(21,'guidance-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(22,'guidance-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(23,'guidance-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(24,'guidance-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(25,'system-setting-manage','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(26,'fcm-setting-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(27,'email-setting-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(28,'privacy-policy','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(29,'contact-us','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(30,'about-us','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(31,'terms-condition','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(32,'app-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(33,'subscription-view','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(34,'staff-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(35,'staff-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(36,'staff-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(37,'staff-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(38,'faqs-list','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(39,'faqs-create','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(40,'faqs-edit','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(41,'faqs-delete','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(42,'fcm-setting-manage','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(43,'front-site-setting','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(44,'assignment-monitoring','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(45,'payment-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(46,'subscription-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(47,'subscription-change-bills','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(48,'school-terms-condition','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(49,'subscription-bill-payment','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(50,'web-settings','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(51,'email-template','web','2026-02-24 04:05:00','2026-02-24 04:11:04'),(52,'custom-school-email','web','2026-02-24 04:05:00','2026-02-24 04:11:04');

--
-- Table structure for table personal_access_tokens
--

DROP TABLE IF EXISTS "personal_access_tokens" CASCADE;
CREATE TABLE "personal_access_tokens" (
  "id" bigserial NOT NULL,
  "tokenable_type" varchar(191) NOT NULL,
  "tokenable_id" bigint NOT NULL,
  "name" varchar(191) NOT NULL,
  "token" varchar(64) NOT NULL,
  "abilities" text,
  "last_used_at" timestamp NULL DEFAULT NULL,
  "expires_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "personal_access_tokens_token_unique" ON "personal_access_tokens" ("token");
CREATE INDEX IF NOT EXISTS "personal_access_tokens_tokenable_type_tokenable_id_index" ON "personal_access_tokens" ("tokenable_type", "tokenable_id");

--
-- Dumping data for table personal_access_tokens
--

--
-- Table structure for table promote_students
--

DROP TABLE IF EXISTS "promote_students" CASCADE;
CREATE TABLE "promote_students" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "original_class_section_id" bigint DEFAULT NULL,
  "from_grade_level_id" bigint DEFAULT NULL,
  "to_grade_level_id" bigint DEFAULT NULL,
  "class_section_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "result" smallint NOT NULL DEFAULT '1',
  "status" smallint NOT NULL DEFAULT '1',
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_columns" ON "promote_students" ("student_id", "class_section_id", "session_year_id");
CREATE INDEX IF NOT EXISTS "promote_students_school_id_foreign" ON "promote_students" ("school_id");
CREATE INDEX IF NOT EXISTS "promote_students_class_section_id_foreign" ON "promote_students" ("class_section_id");
CREATE INDEX IF NOT EXISTS "promote_students_session_year_id_foreign" ON "promote_students" ("session_year_id");
CREATE INDEX IF NOT EXISTS "idx_original_class_section_id" ON "promote_students" ("original_class_section_id");
CREATE INDEX IF NOT EXISTS "promote_students_from_grade_level_id_foreign" ON "promote_students" ("from_grade_level_id");
CREATE INDEX IF NOT EXISTS "promote_students_to_grade_level_id_foreign" ON "promote_students" ("to_grade_level_id");

--
-- Dumping data for table promote_students
--

--
-- Table structure for table recap_absensi
--

DROP TABLE IF EXISTS "recap_absensi" CASCADE;
CREATE TABLE "recap_absensi" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "thbln" varchar(10) NOT NULL,
  "class_section_id" bigint NOT NULL,
  "original_class_section_id" bigint DEFAULT NULL,
  "session_year_id" bigint NOT NULL,
  "t1" varchar(10) DEFAULT NULL,
  "t2" varchar(10) DEFAULT NULL,
  "t3" varchar(10) DEFAULT NULL,
  "t4" varchar(10) DEFAULT NULL,
  "t5" varchar(10) DEFAULT NULL,
  "t6" varchar(10) DEFAULT NULL,
  "t7" varchar(10) DEFAULT NULL,
  "t8" varchar(10) DEFAULT NULL,
  "t9" varchar(10) DEFAULT NULL,
  "t10" varchar(10) DEFAULT NULL,
  "t11" varchar(10) DEFAULT NULL,
  "t12" varchar(10) DEFAULT NULL,
  "t13" varchar(10) DEFAULT NULL,
  "t14" varchar(10) DEFAULT NULL,
  "t15" varchar(10) DEFAULT NULL,
  "t16" varchar(10) DEFAULT NULL,
  "t17" varchar(10) DEFAULT NULL,
  "t18" varchar(10) DEFAULT NULL,
  "t19" varchar(10) DEFAULT NULL,
  "t20" varchar(10) DEFAULT NULL,
  "t21" varchar(10) DEFAULT NULL,
  "t22" varchar(10) DEFAULT NULL,
  "t23" varchar(10) DEFAULT NULL,
  "t24" varchar(10) DEFAULT NULL,
  "t25" varchar(10) DEFAULT NULL,
  "t26" varchar(10) DEFAULT NULL,
  "t27" varchar(10) DEFAULT NULL,
  "t28" varchar(10) DEFAULT NULL,
  "t29" varchar(10) DEFAULT NULL,
  "t30" varchar(10) DEFAULT NULL,
  "t31" varchar(10) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "recap_absensi_student_id_foreign" ON "recap_absensi" ("student_id");
CREATE INDEX IF NOT EXISTS "recap_absensi_class_section_id_foreign" ON "recap_absensi" ("class_section_id");
CREATE INDEX IF NOT EXISTS "recap_absensi_session_year_id_foreign" ON "recap_absensi" ("session_year_id");
CREATE INDEX IF NOT EXISTS "idx_original_class_section_id" ON "recap_absensi" ("original_class_section_id");

--
-- Dumping data for table recap_absensi
--

--
-- Table structure for table recap_edits
--

DROP TABLE IF EXISTS "recap_edits" CASCADE;
CREATE TABLE "recap_edits" (
  "id" bigserial NOT NULL,
  "subject_attendance_id" bigint NOT NULL,
  "subject_attendance_student_id" bigint NOT NULL,
  "text" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "recap_edits_subject_attendance_id_foreign" ON "recap_edits" ("subject_attendance_id");
CREATE INDEX IF NOT EXISTS "recap_edits_subject_attendance_student_id_foreign" ON "recap_edits" ("subject_attendance_student_id");

--
-- Dumping data for table recap_edits
--

--
-- Table structure for table receipt_settings
--

DROP TABLE IF EXISTS "receipt_settings" CASCADE;
CREATE TABLE "receipt_settings" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "receipt_size" varchar(2) NOT NULL DEFAULT 'm',
  "receipt_print_mode" text NOT NULL DEFAULT 'confirm',
  "receipt_logo_path" varchar(191) DEFAULT NULL,
  "receipt_header_html" text,
  "receipt_footer_html" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "receipt_settings_school_id_unique" ON "receipt_settings" ("school_id");

--
-- Dumping data for table receipt_settings
--

--
-- Table structure for table role_has_permissions
--

DROP TABLE IF EXISTS "role_has_permissions" CASCADE;
CREATE TABLE "role_has_permissions" (
  "permission_id" bigint NOT NULL,
  "role_id" bigint NOT NULL,
  PRIMARY KEY ("permission_id", "role_id")
);
CREATE INDEX IF NOT EXISTS "role_has_permissions_role_id_foreign" ON "role_has_permissions" ("role_id");

--
-- Dumping data for table role_has_permissions
--

INSERT INTO "role_has_permissions" VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(44,1),(46,1),(47,1),(48,1),(49,1),(50,1),(52,1);

--
-- Table structure for table roles
--

DROP TABLE IF EXISTS "roles" CASCADE;
CREATE TABLE "roles" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "guard_name" varchar(191) NOT NULL,
  "school_id" bigint DEFAULT NULL,
  "custom_role" smallint NOT NULL DEFAULT '1',
  "editable" smallint NOT NULL DEFAULT '1',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "roles_name_guard_name_school_id_unique" ON "roles" ("name", "guard_name", "school_id");
CREATE INDEX IF NOT EXISTS "roles_school_id_foreign" ON "roles" ("school_id");

--
-- Dumping data for table roles
--

INSERT INTO "roles" VALUES (1,'Super Admin','web',NULL,0,0,'2026-02-24 04:05:00','2026-02-24 04:05:00'),(2,'Teacher','web',NULL,1,1,'2026-02-24 04:05:01','2026-02-24 04:05:01'),(3,'School Admin','web',NULL,0,0,NULL,NULL);

--
-- Table structure for table school_inquiries
--

DROP TABLE IF EXISTS "school_inquiries" CASCADE;
CREATE TABLE "school_inquiries" (
  "id" bigserial NOT NULL,
  "school_name" varchar(191) NOT NULL,
  "school_email" varchar(191) NOT NULL,
  "school_phone" varchar(191) DEFAULT NULL,
  "school_address" varchar(191) DEFAULT NULL,
  "school_tagline" varchar(191) DEFAULT NULL,
  "date" date DEFAULT NULL,
  "status" text NOT NULL DEFAULT 'pending',
  "payment_proof" varchar(191) DEFAULT NULL,
  "payment_date" date DEFAULT NULL,
  "payment_status" text NOT NULL DEFAULT 'pending',
  "notes" text,
  "database_status" text NOT NULL DEFAULT 'not_created',
  "database_created_at" timestamp NULL DEFAULT NULL,
  "database_error" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "school_inquiries_school_email_unique" ON "school_inquiries" ("school_email");

--
-- Dumping data for table school_inquiries
--

--
-- Table structure for table school_settings
--

DROP TABLE IF EXISTS "school_settings" CASCADE;
CREATE TABLE "school_settings" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "data" text NOT NULL,
  "type" varchar(191) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "school_settings_name_school_id_unique" ON "school_settings" ("name", "school_id");
CREATE INDEX IF NOT EXISTS "school_settings_school_id_foreign" ON "school_settings" ("school_id");

--
-- Dumping data for table school_settings
--

--
-- Table structure for table schools
--

DROP TABLE IF EXISTS "schools" CASCADE;
CREATE TABLE "schools" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "address" varchar(191) NOT NULL,
  "support_phone" varchar(191) NOT NULL,
  "support_email" varchar(191) NOT NULL,
  "tagline" varchar(191) NOT NULL,
  "logo" varchar(191) NOT NULL,
  "admin_id" bigint DEFAULT NULL,
  "status" smallint NOT NULL DEFAULT '0',
  "trial_start_date" timestamp NULL DEFAULT NULL,
  "trial_end_date" timestamp NULL DEFAULT NULL,
  "is_trial" smallint NOT NULL DEFAULT '1',
  "timezone" varchar(191) NOT NULL DEFAULT 'Asia/Jakarta',
  "edu_level_id" bigint DEFAULT NULL,
  "domain" varchar(191) DEFAULT NULL,
  "database_name" varchar(191) DEFAULT NULL,
  "code" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  "xendit_api_key_test" text,
  "xendit_api_key_live" text,
  "xendit_callback_token" varchar(191) DEFAULT NULL,
  "xendit_enabled" smallint NOT NULL DEFAULT '0',
  "payment_mode" text NOT NULL DEFAULT 'manual',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "schools_admin_id_foreign" ON "schools" ("admin_id");
CREATE INDEX IF NOT EXISTS "fk_schools_edu_level" ON "schools" ("edu_level_id");

--
-- Dumping data for table schools
--

INSERT INTO "schools" VALUES (1,'SMK Negeri 8 Malang','Malang','081234567890','adminsmk8malang@gmail.com','Excellent School','logo.png',1,1,NULL,NULL,1,'Asia/Jakarta',NULL,NULL,'eschool-7-smkn8malang',NULL,'2026-02-24 04:05:01','2026-02-24 04:19:13',NULL,NULL,NULL,NULL,0,'manual');

--
-- Table structure for table sections
--

DROP TABLE IF EXISTS "sections" CASCADE;
CREATE TABLE "sections" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "sections_school_id_foreign" ON "sections" ("school_id");

--
-- Dumping data for table sections
--

--
-- Table structure for table semesters
--

DROP TABLE IF EXISTS "semesters" CASCADE;
CREATE TABLE "semesters" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "start_month" smallint NOT NULL,
  "end_month" smallint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "semesters_school_id_foreign" ON "semesters" ("school_id");

--
-- Dumping data for table semesters
--

--
-- Table structure for table session_years
--

DROP TABLE IF EXISTS "session_years" CASCADE;
CREATE TABLE "session_years" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "default" smallint NOT NULL DEFAULT '0',
  "start_date" date NOT NULL,
  "end_date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "session_years_name_school_id_unique" ON "session_years" ("name", "school_id");
CREATE INDEX IF NOT EXISTS "session_years_school_id_foreign" ON "session_years" ("school_id");

--
-- Dumping data for table session_years
--

--
-- Table structure for table sessions
--

DROP TABLE IF EXISTS "sessions" CASCADE;
CREATE TABLE "sessions" (
  "id" varchar(191) NOT NULL,
  "user_id" bigint DEFAULT NULL,
  "ip_address" varchar(45) DEFAULT NULL,
  "user_agent" text,
  "payload" text NOT NULL,
  "last_activity" integer NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "sessions_user_id_index" ON "sessions" ("user_id");
CREATE INDEX IF NOT EXISTS "sessions_last_activity_index" ON "sessions" ("last_activity");

--
-- Dumping data for table sessions
--

--
-- Table structure for table shifts
--

DROP TABLE IF EXISTS "shifts" CASCADE;
CREATE TABLE "shifts" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
  "status" integer NOT NULL DEFAULT '1',
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "shifts_school_id_foreign" ON "shifts" ("school_id");

--
-- Dumping data for table shifts
--

--
-- Table structure for table sliders
--

DROP TABLE IF EXISTS "sliders" CASCADE;
CREATE TABLE "sliders" (
  "id" bigserial NOT NULL,
  "image" varchar(1024) NOT NULL,
  "link" varchar(191) DEFAULT NULL,
  "type" integer NOT NULL DEFAULT '1',
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "sliders_school_id_foreign" ON "sliders" ("school_id");

--
-- Dumping data for table sliders
--

--
-- Table structure for table special_fees
--

DROP TABLE IF EXISTS "special_fees" CASCADE;
CREATE TABLE "special_fees" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "fees_id" bigint NOT NULL,
  "discount" numeric(8,2) NOT NULL,
  "notes" text NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "special_fees_student_id_foreign" ON "special_fees" ("student_id");
CREATE INDEX IF NOT EXISTS "special_fees_fees_id_foreign" ON "special_fees" ("fees_id");
CREATE INDEX IF NOT EXISTS "special_fees_school_id_foreign" ON "special_fees" ("school_id");

--
-- Dumping data for table special_fees
--

--
-- Table structure for table staff_payrolls
--

DROP TABLE IF EXISTS "staff_payrolls" CASCADE;
CREATE TABLE "staff_payrolls" (
  "id" bigserial NOT NULL,
  "expense_id" bigint DEFAULT NULL,
  "payroll_setting_id" bigint DEFAULT NULL,
  "amount" double precision DEFAULT NULL,
  "percentage" numeric(8,2) DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_ids" ON "staff_payrolls" ("expense_id", "payroll_setting_id");
CREATE INDEX IF NOT EXISTS "staff_payrolls_payroll_setting_id_foreign" ON "staff_payrolls" ("payroll_setting_id");
CREATE INDEX IF NOT EXISTS "staff_payrolls_school_id_foreign" ON "staff_payrolls" ("school_id");

--
-- Dumping data for table staff_payrolls
--

--
-- Table structure for table staff_salaries
--

DROP TABLE IF EXISTS "staff_salaries" CASCADE;
CREATE TABLE "staff_salaries" (
  "id" bigserial NOT NULL,
  "staff_id" bigint DEFAULT NULL,
  "payroll_setting_id" bigint DEFAULT NULL,
  "amount" double precision DEFAULT NULL,
  "percentage" numeric(8,2) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_ids" ON "staff_salaries" ("staff_id", "payroll_setting_id");
CREATE INDEX IF NOT EXISTS "staff_salaries_payroll_setting_id_foreign" ON "staff_salaries" ("payroll_setting_id");

--
-- Dumping data for table staff_salaries
--

--
-- Table structure for table staff_support_schools
--

DROP TABLE IF EXISTS "staff_support_schools" CASCADE;
CREATE TABLE "staff_support_schools" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "user_school" ON "staff_support_schools" ("user_id", "school_id");
CREATE INDEX IF NOT EXISTS "staff_support_schools_school_id_foreign" ON "staff_support_schools" ("school_id");

--
-- Dumping data for table staff_support_schools
--

--
-- Table structure for table staffs
--

DROP TABLE IF EXISTS "staffs" CASCADE;
CREATE TABLE "staffs" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "qualification" varchar(512) DEFAULT NULL,
  "salary" double precision NOT NULL DEFAULT '0',
  "joining_date" date DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "staffs_user_id_foreign" ON "staffs" ("user_id");

--
-- Dumping data for table staffs
--

INSERT INTO "staffs" VALUES (1,2,'Teacher',5000000,NULL,'2026-02-24 04:05:01','2026-02-24 04:05:01');

--
-- Table structure for table streams
--

DROP TABLE IF EXISTS "streams" CASCADE;
CREATE TABLE "streams" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "streams_school_id_foreign" ON "streams" ("school_id");

--
-- Dumping data for table streams
--

--
-- Table structure for table student_online_exam_statuses
--

DROP TABLE IF EXISTS "student_online_exam_statuses" CASCADE;
CREATE TABLE "student_online_exam_statuses" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "online_exam_id" bigint NOT NULL,
  "status" smallint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "student_online_exam_statuses_school_id_foreign" ON "student_online_exam_statuses" ("school_id");
CREATE INDEX IF NOT EXISTS "student_online_exam_statuses_student_id_foreign" ON "student_online_exam_statuses" ("student_id");
CREATE INDEX IF NOT EXISTS "student_online_exam_statuses_online_exam_id_foreign" ON "student_online_exam_statuses" ("online_exam_id");

--
-- Dumping data for table student_online_exam_statuses
--

--
-- Table structure for table student_subjects
--

DROP TABLE IF EXISTS "student_subjects" CASCADE;
CREATE TABLE "student_subjects" (
  "id" bigserial NOT NULL,
  "student_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "class_section_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "student_subjects_school_id_foreign" ON "student_subjects" ("school_id");
CREATE INDEX IF NOT EXISTS "student_subjects_student_id_foreign" ON "student_subjects" ("student_id");
CREATE INDEX IF NOT EXISTS "student_subjects_class_subject_id_foreign" ON "student_subjects" ("class_subject_id");
CREATE INDEX IF NOT EXISTS "student_subjects_class_section_id_foreign" ON "student_subjects" ("class_section_id");
CREATE INDEX IF NOT EXISTS "student_subjects_session_year_id_foreign" ON "student_subjects" ("session_year_id");

--
-- Dumping data for table student_subjects
--

--
-- Table structure for table students
--

DROP TABLE IF EXISTS "students" CASCADE;
CREATE TABLE "students" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "class_id" bigint DEFAULT NULL,
  "class_section_id" bigint DEFAULT NULL,
  "billing_disabled" smallint NOT NULL DEFAULT '0',
  "billing_disabled_at" timestamp NULL DEFAULT NULL,
  "billing_disabled_reason" text,
  "original_class_section_id" bigint DEFAULT NULL,
  "grade_level_id" bigint DEFAULT NULL,
  "application_type" varchar(191) DEFAULT 'offline',
  "admission_no" varchar(512) NOT NULL,
  "roll_number" integer DEFAULT NULL,
  "admission_date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "application_status" integer DEFAULT '1',
  "guardian_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "students_school_id_foreign" ON "students" ("school_id");
CREATE INDEX IF NOT EXISTS "students_user_id_foreign" ON "students" ("user_id");
CREATE INDEX IF NOT EXISTS "students_class_section_id_foreign" ON "students" ("class_section_id");
CREATE INDEX IF NOT EXISTS "students_guardian_id_foreign" ON "students" ("guardian_id");
CREATE INDEX IF NOT EXISTS "students_session_year_id_foreign" ON "students" ("session_year_id");
CREATE INDEX IF NOT EXISTS "students_class_id_foreign" ON "students" ("class_id");
CREATE INDEX IF NOT EXISTS "students_grade_level_id_foreign" ON "students" ("grade_level_id");
CREATE INDEX IF NOT EXISTS "students_original_class_section_id_foreign" ON "students" ("original_class_section_id");
CREATE INDEX IF NOT EXISTS "idx_students_billing_disabled" ON "students" ("billing_disabled");

--
-- Dumping data for table students
--

--
-- Table structure for table subject_attendance_students
--

DROP TABLE IF EXISTS "subject_attendance_students" CASCADE;
CREATE TABLE "subject_attendance_students" (
  "id" bigserial NOT NULL,
  "subject_attendance_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "type" smallint NOT NULL,
  "note" text,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "subject_attendance_students_subject_attendance_id_foreign" ON "subject_attendance_students" ("subject_attendance_id");
CREATE INDEX IF NOT EXISTS "subject_attendance_students_student_id_foreign" ON "subject_attendance_students" ("student_id");

--
-- Dumping data for table subject_attendance_students
--

--
-- Table structure for table subject_attendances
--

DROP TABLE IF EXISTS "subject_attendances" CASCADE;
CREATE TABLE "subject_attendances" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "grade_level_id" bigint NOT NULL,
  "session_year_id" bigint NOT NULL,
  "date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "timetable_id" bigint NOT NULL,
  "jumlah_jp" integer NOT NULL,
  "materi" text NOT NULL,
  "lampiran" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "subject_attendances_class_section_id_foreign" ON "subject_attendances" ("class_section_id");
CREATE INDEX IF NOT EXISTS "subject_attendances_session_year_id_foreign" ON "subject_attendances" ("session_year_id");
CREATE INDEX IF NOT EXISTS "subject_attendances_school_id_foreign" ON "subject_attendances" ("school_id");
CREATE INDEX IF NOT EXISTS "subject_attendances_timetable_id_foreign" ON "subject_attendances" ("timetable_id");
CREATE INDEX IF NOT EXISTS "subject_attendances_grade_level_id_foreign" ON "subject_attendances" ("grade_level_id");

--
-- Dumping data for table subject_attendances
--

--
-- Table structure for table subject_teachers
--

DROP TABLE IF EXISTS "subject_teachers" CASCADE;
CREATE TABLE "subject_teachers" (
  "id" bigserial NOT NULL,
  "class_section_id" bigint NOT NULL,
  "subject_id" bigint NOT NULL,
  "teacher_id" bigint NOT NULL,
  "class_subject_id" bigint NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique_ids" ON "subject_teachers" ("class_section_id", "class_subject_id", "teacher_id");
CREATE INDEX IF NOT EXISTS "subject_teachers_school_id_foreign" ON "subject_teachers" ("school_id");
CREATE INDEX IF NOT EXISTS "subject_teachers_subject_id_foreign" ON "subject_teachers" ("subject_id");
CREATE INDEX IF NOT EXISTS "subject_teachers_teacher_id_foreign" ON "subject_teachers" ("teacher_id");
CREATE INDEX IF NOT EXISTS "subject_teachers_class_subject_id_foreign" ON "subject_teachers" ("class_subject_id");

--
-- Dumping data for table subject_teachers
--

--
-- Table structure for table subjects
--

DROP TABLE IF EXISTS "subjects" CASCADE;
CREATE TABLE "subjects" (
  "id" bigserial NOT NULL,
  "name" varchar(512) NOT NULL,
  "code" varchar(64) DEFAULT NULL,
  "bg_color" varchar(32) NOT NULL,
  "image" varchar(512) NOT NULL,
  "medium_id" bigint NOT NULL,
  "type" varchar(64) NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "subjects_school_id_foreign" ON "subjects" ("school_id");
CREATE INDEX IF NOT EXISTS "subjects_medium_id_foreign" ON "subjects" ("medium_id");

--
-- Dumping data for table subjects
--

--
-- Table structure for table subscription_bills
--

DROP TABLE IF EXISTS "subscription_bills" CASCADE;
CREATE TABLE "subscription_bills" (
  "id" bigserial NOT NULL,
  "subscription_id" bigint NOT NULL,
  "description" varchar(191) DEFAULT NULL,
  "amount" numeric(64,4) NOT NULL,
  "total_student" bigint NOT NULL,
  "total_staff" bigint NOT NULL,
  "payment_transaction_id" bigint DEFAULT NULL,
  "due_date" date NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "subscription_bill" ON "subscription_bills" ("subscription_id", "school_id");
CREATE INDEX IF NOT EXISTS "subscription_bills_school_id_foreign" ON "subscription_bills" ("school_id");
CREATE INDEX IF NOT EXISTS "subscription_bills_payment_transaction_id_foreign" ON "subscription_bills" ("payment_transaction_id");

--
-- Dumping data for table subscription_bills
--

--
-- Table structure for table subscription_features
--

DROP TABLE IF EXISTS "subscription_features" CASCADE;
CREATE TABLE "subscription_features" (
  "id" bigserial NOT NULL,
  "subscription_id" bigint NOT NULL,
  "feature_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "unique" ON "subscription_features" ("subscription_id", "feature_id");
CREATE INDEX IF NOT EXISTS "subscription_features_feature_id_foreign" ON "subscription_features" ("feature_id");

--
-- Dumping data for table subscription_features
--

--
-- Table structure for table subscriptions
--

DROP TABLE IF EXISTS "subscriptions" CASCADE;
CREATE TABLE "subscriptions" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "package_id" bigint NOT NULL,
  "name" varchar(191) NOT NULL,
  "student_charge" numeric(8,4) NOT NULL,
  "staff_charge" numeric(8,4) NOT NULL,
  "start_date" date NOT NULL,
  "end_date" date NOT NULL,
  "package_type" integer NOT NULL DEFAULT '1',
  "no_of_students" integer NOT NULL DEFAULT '0',
  "no_of_staffs" integer NOT NULL DEFAULT '0',
  "charges" numeric(64,4) NOT NULL DEFAULT '0.0000',
  "billing_cycle" integer NOT NULL DEFAULT '0',
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "subscriptions_school_id_foreign" ON "subscriptions" ("school_id");
CREATE INDEX IF NOT EXISTS "subscriptions_package_id_foreign" ON "subscriptions" ("package_id");

--
-- Dumping data for table subscriptions
--

--
-- Table structure for table system_settings
--

DROP TABLE IF EXISTS "system_settings" CASCADE;
CREATE TABLE "system_settings" (
  "id" bigserial NOT NULL,
  "name" varchar(191) NOT NULL,
  "data" text NOT NULL,
  "type" varchar(191) DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "system_settings_name_unique" ON "system_settings" ("name");

--
-- Dumping data for table system_settings
--

INSERT INTO "system_settings" VALUES (1,'time_zone','Asia/Kolkata','string'),(2,'date_format','d-m-Y','date'),(3,'time_format','h:i A','time'),(4,'theme_color','#d22f3c','string'),(5,'session_year','1','string'),(6,'system_version','1.4.1','string'),(7,'email_verified','0','boolean'),(8,'subscription_alert','7','integer'),(9,'currency_code','USD','string'),(10,'currency_symbol','$','string'),(11,'additional_billing_days','5','integer'),(12,'system_name','eSchool - Software Manajemen Sekolah','string'),(13,'system_email','admin@eschool.com','string'),(14,'address','Ruko Modern Kav A16-A17, Jl Loncat Indah, Tasikmadu, Kota Malang 65143','string'),(15,'billing_cycle_in_days','30','integer'),(16,'current_plan_expiry_warning_days','7','integer'),(17,'front_site_theme_color','#d22f3c','text'),(18,'primary_color','#d22f3c','text'),(19,'secondary_color','#d22f3c','text'),(20,'short_description','eSchool UBIG: Solusi digital modern untuk manajemen sekolah, dengan fitur lengkap, tampilan menarik, dan kemudahan penggunaan. Tingkatkan kualitas pendidikan dan efisiensi sekolah Anda bersama kami!','text'),(21,'facebook','','text'),(22,'instagram','','text'),(23,'linkedin','','text'),(24,'footer_text','<p>&copy;&nbsp;<strong>UBIG</strong>. All Rights Reserved</p>','text'),(25,'tagline','Transformasi Digital Sekolah Anda Bersama UBIG!','text'),(26,'super_admin_name','Super Admin','text'),(27,'support_email','suratkita@gmail.com','text'),(28,'mobile','0812-1212-2388','text'),(29,'hero_title_1','eSchool memberikan pengalaman baru yang lebih menyenangkan','text'),(30,'hero_title_2','Layanan Terbaik','text'),(31,'about_us_title','eSchool - Software Manajemen Sekolah','text'),(32,'about_us_heading','Platform Manajemen Sekolah Terbaik','text'),(33,'about_us_description','eSchool adalah solusi manajemen sekolah digital terdepan di Indonesia. Dengan fitur lengkap, tampilan modern, dan kemudahan penggunaan, eSchool membantu sekolah mengelola seluruh aktivitas akademik dan non-akademik secara efisien.','text'),(34,'about_us_points','Harga terjangkau,Mudah dikelola panel admin,Keamanan data terjamin','text'),(35,'custom_package_status','1','text'),(36,'custom_package_description','Sesuaikan kebutuhan sekolah Anda dengan paket khusus dari UBIG. Layanan personal dan solusi fleksibel untuk setiap kebutuhan unik.','text'),(37,'download_our_app_description','Bergabunglah bersama UBIG dan nikmati kemudahan manajemen sekolah digital. Tingkatkan efisiensi, kolaborasi, dan akses informasi di mana saja dan kapan saja.','text'),(38,'theme_primary_color','#d22f3c','text'),(39,'theme_secondary_color','#d22f3c','text'),(40,'theme_secondary_color_1','#d22f3c','text'),(41,'theme_primary_background_color','#f2f5f7','text'),(42,'theme_text_secondary_color','#5c788c','text'),(43,'tag_line','Diakses sekolah, siswa dan orangtua','text'),(44,'hero_description','Software manajemen sekolah terbaik dan termurah di Indonesia. Fitur lengkap dan sesuai kebutuhan. Tampilan menarik dan mudah digunakan. Keamanan data terjamin.','text'),(45,'display_school_logos','1','text'),(46,'display_counters','1','text'),(47,'email_template_school_registration','&lt;p&gt;Yth. {school_admin_name},&lt;/p&gt;&lt;p&gt;Selamat datang di {system_name}!&lt;/p&gt;&lt;p&gt;Kami sangat senang Anda bergabung dalam komunitas pendidikan UBIG. Berikut detail pendaftaran Anda untuk mengakses sistem:&lt;/p&gt;&lt;hr&gt;&lt;p&gt;&lt;strong&gt;Nama Sekolah:&lt;/strong&gt; {school_name}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;URL Sistem:&lt;/strong&gt; {url}&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Akun Login Anda:&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;Email:&lt;/strong&gt; {email}&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Password:&lt;/strong&gt; {password}&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Kode Sekolah:&lt;/strong&gt; {school_code}&lt;/li&gt;&lt;/ul&gt;&lt;hr&gt;&lt;p&gt;&lt;strong&gt;Langkah-langkah untuk menyelesaikan pendaftaran:&lt;/strong&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;Klik URL sistem di atas.&lt;/li&gt;&lt;li&gt;Masukkan email dan password Anda.&lt;/li&gt;&lt;li&gt;Ikuti instruksi untuk melengkapi profil Anda.&lt;/li&gt;&lt;/ol&gt;&lt;p&gt;&lt;strong&gt;Penting:&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Demi keamanan, segera ganti password Anda setelah login pertama.&lt;/li&gt;&lt;li&gt;Jika mengalami kendala saat pendaftaran, silakan hubungi tim dukungan kami di {support_email} atau {contact}.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Terima kasih telah memilih {system_name}. Kami berkomitmen memberikan solusi pendidikan terbaik untuk Anda.&lt;/p&gt;&lt;p&gt;Salam hangat,&lt;/p&gt;&lt;p&gt;{super_admin_name}&lt;br&gt;{system_name}&lt;br&gt;{support_email}&lt;br&gt;{url}&lt;/p&gt;','text'),(48,'mail_send_from','','string'),(82,'favicon','http://127.0.0.1:8000/assets/favicon-icon.png',NULL);

--
-- Table structure for table tag_dokumen_bendahara
--

DROP TABLE IF EXISTS "tag_dokumen_bendahara" CASCADE;
CREATE TABLE "tag_dokumen_bendahara" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_bendahara
--

--
-- Table structure for table tag_dokumen_humas
--

DROP TABLE IF EXISTS "tag_dokumen_humas" CASCADE;
CREATE TABLE "tag_dokumen_humas" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_humas
--

--
-- Table structure for table tag_dokumen_kesiswaan
--

DROP TABLE IF EXISTS "tag_dokumen_kesiswaan" CASCADE;
CREATE TABLE "tag_dokumen_kesiswaan" (
  "id" bigserial NOT NULL,
  "nama" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kesiswaan
--

--
-- Table structure for table tag_dokumen_kpk
--

DROP TABLE IF EXISTS "tag_dokumen_kpk" CASCADE;
CREATE TABLE "tag_dokumen_kpk" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kpk
--

--
-- Table structure for table tag_dokumen_kpk_elin
--

DROP TABLE IF EXISTS "tag_dokumen_kpk_elin" CASCADE;
CREATE TABLE "tag_dokumen_kpk_elin" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kpk_elin
--

--
-- Table structure for table tag_dokumen_kpk_metro
--

DROP TABLE IF EXISTS "tag_dokumen_kpk_metro" CASCADE;
CREATE TABLE "tag_dokumen_kpk_metro" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kpk_metro
--

--
-- Table structure for table tag_dokumen_kpk_rpl
--

DROP TABLE IF EXISTS "tag_dokumen_kpk_rpl" CASCADE;
CREATE TABLE "tag_dokumen_kpk_rpl" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kpk_rpl
--

--
-- Table structure for table tag_dokumen_kpk_tkj
--

DROP TABLE IF EXISTS "tag_dokumen_kpk_tkj" CASCADE;
CREATE TABLE "tag_dokumen_kpk_tkj" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kpk_tkj
--

--
-- Table structure for table tag_dokumen_kurikulum
--

DROP TABLE IF EXISTS "tag_dokumen_kurikulum" CASCADE;
CREATE TABLE "tag_dokumen_kurikulum" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_kurikulum
--

--
-- Table structure for table tag_dokumen_pdsm
--

DROP TABLE IF EXISTS "tag_dokumen_pdsm" CASCADE;
CREATE TABLE "tag_dokumen_pdsm" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_pdsm
--

--
-- Table structure for table tag_dokumen_perpus
--

DROP TABLE IF EXISTS "tag_dokumen_perpus" CASCADE;
CREATE TABLE "tag_dokumen_perpus" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_perpus
--

--
-- Table structure for table tag_dokumen_sarpas
--

DROP TABLE IF EXISTS "tag_dokumen_sarpas" CASCADE;
CREATE TABLE "tag_dokumen_sarpas" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_sarpas
--

--
-- Table structure for table tag_dokumen_tatib
--

DROP TABLE IF EXISTS "tag_dokumen_tatib" CASCADE;
CREATE TABLE "tag_dokumen_tatib" (
  "id" bigserial NOT NULL,
  "nama" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_tatib
--

--
-- Table structure for table tag_dokumen_tu
--

DROP TABLE IF EXISTS "tag_dokumen_tu" CASCADE;
CREATE TABLE "tag_dokumen_tu" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table tag_dokumen_tu
--

--
-- Table structure for table tennant
--

DROP TABLE IF EXISTS "tennant" CASCADE;
CREATE TABLE "tennant" (
  "user_id" integer NOT NULL,
  "email" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "database_name" varchar(255) NOT NULL,
  PRIMARY KEY ("user_id", "database_name")
);
CREATE UNIQUE INDEX IF NOT EXISTS "email_database_unique" ON "tennant" ("email", "database_name");

--
-- Dumping data for table tennant
--

--
-- Table structure for table timetables
--

DROP TABLE IF EXISTS "timetables" CASCADE;
CREATE TABLE "timetables" (
  "id" bigserial NOT NULL,
  "subject_teacher_id" bigint DEFAULT NULL,
  "class_section_id" bigint NOT NULL,
  "subject_id" bigint DEFAULT NULL,
  "start_time" time NOT NULL,
  "end_time" time NOT NULL,
  "note" varchar(1024) DEFAULT NULL,
  "day" text NOT NULL,
  "type" text NOT NULL,
  "semester_id" bigint DEFAULT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "timetables_subject_teacher_id_foreign" ON "timetables" ("subject_teacher_id");
CREATE INDEX IF NOT EXISTS "timetables_school_id_foreign" ON "timetables" ("school_id");
CREATE INDEX IF NOT EXISTS "timetables_class_section_id_foreign" ON "timetables" ("class_section_id");
CREATE INDEX IF NOT EXISTS "timetables_subject_id_foreign" ON "timetables" ("subject_id");
CREATE INDEX IF NOT EXISTS "timetables_semester_id_foreign" ON "timetables" ("semester_id");

--
-- Dumping data for table timetables
--

--
-- Table structure for table trial_reminder_logs
--

DROP TABLE IF EXISTS "trial_reminder_logs" CASCADE;
CREATE TABLE "trial_reminder_logs" (
  "id" bigserial NOT NULL,
  "subscription_id" bigint NOT NULL,
  "days_left" integer NOT NULL,
  "sent_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "trial_reminder_logs_subscription_id_days_left_unique" ON "trial_reminder_logs" ("subscription_id", "days_left");

--
-- Dumping data for table trial_reminder_logs
--

--
-- Table structure for table upload_file_bendahara
--

DROP TABLE IF EXISTS "upload_file_bendahara" CASCADE;
CREATE TABLE "upload_file_bendahara" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_bendahara" ON "upload_file_bendahara" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_bendahara" ON "upload_file_bendahara" ("id_folder");

--
-- Dumping data for table upload_file_bendahara
--

--
-- Table structure for table upload_file_humas
--

DROP TABLE IF EXISTS "upload_file_humas" CASCADE;
CREATE TABLE "upload_file_humas" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_humas" ON "upload_file_humas" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_humas" ON "upload_file_humas" ("id_folder");

--
-- Dumping data for table upload_file_humas
--

--
-- Table structure for table upload_file_kesiswaan
--

DROP TABLE IF EXISTS "upload_file_kesiswaan" CASCADE;
CREATE TABLE "upload_file_kesiswaan" (
  "id" bigserial NOT NULL,
  "nama" varchar(191) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(191) NOT NULL,
  "id_tag" bigint NOT NULL,
  "pengunggah" varchar(191) NOT NULL,
  "modifikasi" varchar(191) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "upload_file_kesiswaan_id_tag_foreign" ON "upload_file_kesiswaan" ("id_tag");

--
-- Dumping data for table upload_file_kesiswaan
--

--
-- Table structure for table upload_file_kpk
--

DROP TABLE IF EXISTS "upload_file_kpk" CASCADE;
CREATE TABLE "upload_file_kpk" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_kpk" ON "upload_file_kpk" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_kpk" ON "upload_file_kpk" ("id_folder");

--
-- Dumping data for table upload_file_kpk
--

--
-- Table structure for table upload_file_kpk_elin
--

DROP TABLE IF EXISTS "upload_file_kpk_elin" CASCADE;
CREATE TABLE "upload_file_kpk_elin" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "tacher_edit" smallint NOT NULL DEFAULT '0',
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_kpk_elin" ON "upload_file_kpk_elin" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_kpk_elin" ON "upload_file_kpk_elin" ("id_folder");

--
-- Dumping data for table upload_file_kpk_elin
--

--
-- Table structure for table upload_file_kpk_metro
--

DROP TABLE IF EXISTS "upload_file_kpk_metro" CASCADE;
CREATE TABLE "upload_file_kpk_metro" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "tacher_edit" smallint NOT NULL DEFAULT '0',
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_kpk_metro" ON "upload_file_kpk_metro" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_kpk_metro" ON "upload_file_kpk_metro" ("id_folder");

--
-- Dumping data for table upload_file_kpk_metro
--

--
-- Table structure for table upload_file_kpk_rpl
--

DROP TABLE IF EXISTS "upload_file_kpk_rpl" CASCADE;
CREATE TABLE "upload_file_kpk_rpl" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "tacher_edit" smallint NOT NULL DEFAULT '0',
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_kpk_rpl" ON "upload_file_kpk_rpl" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_kpk_rpl" ON "upload_file_kpk_rpl" ("id_folder");

--
-- Dumping data for table upload_file_kpk_rpl
--

--
-- Table structure for table upload_file_kpk_tkj
--

DROP TABLE IF EXISTS "upload_file_kpk_tkj" CASCADE;
CREATE TABLE "upload_file_kpk_tkj" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "tacher_edit" smallint NOT NULL DEFAULT '0',
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_kpk_tkj" ON "upload_file_kpk_tkj" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_kpk_tkj" ON "upload_file_kpk_tkj" ("id_folder");

--
-- Dumping data for table upload_file_kpk_tkj
--

--
-- Table structure for table upload_file_kurikulum
--

DROP TABLE IF EXISTS "upload_file_kurikulum" CASCADE;
CREATE TABLE "upload_file_kurikulum" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_kurikulum" ON "upload_file_kurikulum" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_kurikulum" ON "upload_file_kurikulum" ("id_folder");

--
-- Dumping data for table upload_file_kurikulum
--

--
-- Table structure for table upload_file_pdsm
--

DROP TABLE IF EXISTS "upload_file_pdsm" CASCADE;
CREATE TABLE "upload_file_pdsm" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_pdsm" ON "upload_file_pdsm" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_pdsm" ON "upload_file_pdsm" ("id_folder");

--
-- Dumping data for table upload_file_pdsm
--

--
-- Table structure for table upload_file_perpus
--

DROP TABLE IF EXISTS "upload_file_perpus" CASCADE;
CREATE TABLE "upload_file_perpus" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_perpus" ON "upload_file_perpus" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_perpus" ON "upload_file_perpus" ("id_folder");

--
-- Dumping data for table upload_file_perpus
--

--
-- Table structure for table upload_file_sarpas
--

DROP TABLE IF EXISTS "upload_file_sarpas" CASCADE;
CREATE TABLE "upload_file_sarpas" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_sarpras" ON "upload_file_sarpas" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_sarpras" ON "upload_file_sarpas" ("id_folder");

--
-- Dumping data for table upload_file_sarpas
--

--
-- Table structure for table upload_file_tatib
--

DROP TABLE IF EXISTS "upload_file_tatib" CASCADE;
CREATE TABLE "upload_file_tatib" (
  "id" bigserial NOT NULL,
  "nama" varchar(191) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(191) NOT NULL,
  "id_tag" bigint NOT NULL,
  "pengunggah" varchar(191) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "modifikasi" varchar(191) DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "upload_file_tatib_id_tag_foreign" ON "upload_file_tatib" ("id_tag");

--
-- Dumping data for table upload_file_tatib
--

--
-- Table structure for table upload_file_tu
--

DROP TABLE IF EXISTS "upload_file_tu" CASCADE;
CREATE TABLE "upload_file_tu" (
  "id" bigserial NOT NULL,
  "nama" varchar(255) NOT NULL,
  "deskripsi" text,
  "tanggal" date NOT NULL,
  "file" varchar(255) NOT NULL,
  "id_tag" bigint NOT NULL,
  "id_folder" bigint NOT NULL,
  "pengunggah" varchar(255) NOT NULL,
  "modifikasi" varchar(255) DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "teacher_edit" smallint NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
CREATE INDEX IF NOT EXISTS "fk_tag_dokumen_tu" ON "upload_file_tu" ("id_tag");
CREATE INDEX IF NOT EXISTS "fk_folder_tu" ON "upload_file_tu" ("id_folder");

--
-- Dumping data for table upload_file_tu
--

--
-- Table structure for table user_relation
--

DROP TABLE IF EXISTS "user_relation" CASCADE;
CREATE TABLE "user_relation" (
  "id" serial NOT NULL,
  "email" varchar(255) NOT NULL,
  "school_code" varchar(255) NOT NULL,
  "status" smallint NOT NULL DEFAULT '1',
  "role" text NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Dumping data for table user_relation
--

--
-- Table structure for table user_status_for_next_cycles
--

DROP TABLE IF EXISTS "user_status_for_next_cycles" CASCADE;
CREATE TABLE "user_status_for_next_cycles" (
  "id" bigserial NOT NULL,
  "user_id" bigint NOT NULL,
  "status" integer NOT NULL,
  "school_id" bigint NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "user_status_for_next_cycles_user_id_unique" ON "user_status_for_next_cycles" ("user_id");
CREATE INDEX IF NOT EXISTS "user_status_for_next_cycles_school_id_foreign" ON "user_status_for_next_cycles" ("school_id");

--
-- Dumping data for table user_status_for_next_cycles
--

--
-- Table structure for table users
--

DROP TABLE IF EXISTS "users" CASCADE;
CREATE TABLE "users" (
  "id" bigserial NOT NULL,
  "nip" varchar(20) DEFAULT NULL,
  "first_name" varchar(128) NOT NULL,
  "last_name" varchar(128) NOT NULL,
  "mobile" varchar(191) DEFAULT NULL,
  "phone" varchar(20) DEFAULT NULL,
  "email" varchar(191) NOT NULL,
  "password" varchar(191) NOT NULL,
  "gender" varchar(16) DEFAULT NULL,
  "image" varchar(512) DEFAULT NULL,
  "dob" date DEFAULT NULL,
  "current_address" varchar(191) DEFAULT NULL,
  "permanent_address" varchar(191) DEFAULT NULL,
  "occupation" varchar(128) DEFAULT NULL,
  "status" smallint NOT NULL DEFAULT '1',
  "reset_request" smallint NOT NULL DEFAULT '0',
  "fcm_id" varchar(1024) DEFAULT NULL,
  "school_id" bigint DEFAULT NULL,
  "language" varchar(191) NOT NULL DEFAULT 'en',
  "remember_token" varchar(100) DEFAULT NULL,
  "email_verified_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  "deleted_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "users_email_unique" ON "users" ("email");
CREATE UNIQUE INDEX IF NOT EXISTS "users_nip_unique" ON "users" ("nip");
CREATE INDEX IF NOT EXISTS "users_school_id_foreign" ON "users" ("school_id");
CREATE INDEX IF NOT EXISTS "users_phone_index" ON "users" ("phone");

--
-- Dumping data for table users
--

INSERT INTO "users" VALUES (1,NULL,'Admin','SMK8','',NULL,'adminsmk8malang@gmail.com','$2y$10$bswhV6GhqHci21OmgZTHD.tNZPzV21eG3EWnuoOqOrV2Hp3j.3VzS','male','logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,1,'en',NULL,'2026-02-26 05:53:21','2026-02-24 04:05:01','2026-02-26 05:53:21',NULL),(2,NULL,'Agung','Cahyono','081299998888',NULL,'agungcahyono533@gmail.com','$2y$10$0HKWR9hW0vhPvf4mYOrq/OuU/z4B2sHqsboVHwwoUnEksYYcQR7DG','male','logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,1,'en',NULL,'2026-02-26 05:53:22','2026-02-24 04:05:01','2026-02-26 05:53:22',NULL),(3,NULL,'Super','Admin','',NULL,'superadmin@eschool.ac.id','$2y$10$5dfOiq41AEyN7W4LQHCpsubyNxyvnoqaKvGsYfG0qOGq1fTADUJpy','male','logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'en',NULL,'2026-02-26 01:26:30','2026-02-26 01:26:30','2026-02-26 01:26:30',NULL),(7,NULL,'Super','Admin',NULL,NULL,'superadmin@gmail.com','$2y$10$A0s4R4676xU1SJngOowj1u6mWRvG8TzhYWHsi3nWYgvu3kg6Jm.Oy',NULL,'logo.svg',NULL,NULL,NULL,NULL,1,0,NULL,NULL,'en',NULL,NULL,'2026-02-26 07:22:18','2026-02-26 07:22:18',NULL);

--
-- Table structure for table xendit_invoice_fees
--

DROP TABLE IF EXISTS "xendit_invoice_fees" CASCADE;
CREATE TABLE "xendit_invoice_fees" (
  "id" bigserial NOT NULL,
  "xendit_invoice_id" bigint NOT NULL,
  "fee_id" bigint NOT NULL,
  "amount" numeric(15,2) NOT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "xendit_invoice_fees_xendit_invoice_id_fee_id_unique" ON "xendit_invoice_fees" ("xendit_invoice_id", "fee_id");
CREATE INDEX IF NOT EXISTS "xendit_invoice_fees_xendit_invoice_id_index" ON "xendit_invoice_fees" ("xendit_invoice_id");
CREATE INDEX IF NOT EXISTS "xendit_invoice_fees_fee_id_index" ON "xendit_invoice_fees" ("fee_id");

--
-- Dumping data for table xendit_invoice_fees
--

--
-- Table structure for table xendit_invoices
--

DROP TABLE IF EXISTS "xendit_invoices" CASCADE;
CREATE TABLE "xendit_invoices" (
  "id" bigserial NOT NULL,
  "school_id" bigint NOT NULL,
  "student_id" bigint NOT NULL,
  "parent_id" bigint NOT NULL,
  "invoice_id" varchar(191) NOT NULL,
  "external_id" varchar(191) NOT NULL,
  "amount" numeric(15,2) NOT NULL,
  "status" text NOT NULL DEFAULT 'pending',
  "invoice_url" text NOT NULL,
  "payer_email" varchar(191) DEFAULT NULL,
  "description" text,
  "expiry_date" timestamp NOT NULL,
  "paid_at" timestamp NULL DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT NULL,
  "updated_at" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("id")
);
CREATE UNIQUE INDEX IF NOT EXISTS "xendit_invoices_invoice_id_unique" ON "xendit_invoices" ("invoice_id");
CREATE INDEX IF NOT EXISTS "xendit_invoices_student_id_foreign" ON "xendit_invoices" ("student_id");
CREATE INDEX IF NOT EXISTS "xendit_invoices_parent_id_foreign" ON "xendit_invoices" ("parent_id");
CREATE INDEX IF NOT EXISTS "xendit_invoices_invoice_id_index" ON "xendit_invoices" ("invoice_id");
CREATE INDEX IF NOT EXISTS "xendit_invoices_external_id_index" ON "xendit_invoices" ("external_id");
CREATE INDEX IF NOT EXISTS "xendit_invoices_status_index" ON "xendit_invoices" ("status");
CREATE INDEX IF NOT EXISTS "xendit_invoices_school_id_student_id_index" ON "xendit_invoices" ("school_id", "student_id");

--
-- Dumping data for table xendit_invoices
--


-- ============================================================
-- FOREIGN KEY CONSTRAINTS
-- ============================================================

ALTER TABLE "absensi_settings" ADD CONSTRAINT "absensi_settings_kesiswaan_user_id_foreign" FOREIGN KEY ("kesiswaan_user_id") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "absensi_settings" ADD CONSTRAINT "absensi_settings_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "absensi_settings" ADD CONSTRAINT "absensi_settings_tatib_user_id_foreign" FOREIGN KEY ("tatib_user_id") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "academic_calendars" ADD CONSTRAINT "academic_calendars_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "academic_calendars" ADD CONSTRAINT "academic_calendars_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "accepted_file" ADD CONSTRAINT "accepted_file_assignment_id_foreign" FOREIGN KEY ("assignment_id") REFERENCES "assignments" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "accepted_file" ADD CONSTRAINT "accepted_file_filetype_id_foreign" FOREIGN KEY ("filetype_id") REFERENCES "filetype" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "addon_subscriptions" ADD CONSTRAINT "addon_subscriptions_feature_id_foreign" FOREIGN KEY ("feature_id") REFERENCES "features" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "addon_subscriptions" ADD CONSTRAINT "addon_subscriptions_payment_transaction_id_foreign" FOREIGN KEY ("payment_transaction_id") REFERENCES "payment_transactions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "addon_subscriptions" ADD CONSTRAINT "addon_subscriptions_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "addon_subscriptions" ADD CONSTRAINT "addon_subscriptions_subscription_id_foreign" FOREIGN KEY ("subscription_id") REFERENCES "subscriptions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "addons" ADD CONSTRAINT "addons_feature_id_foreign" FOREIGN KEY ("feature_id") REFERENCES "features" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "announcement_classes" ADD CONSTRAINT "announcement_classes_announcement_id_foreign" FOREIGN KEY ("announcement_id") REFERENCES "announcements" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "announcement_classes" ADD CONSTRAINT "announcement_classes_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "announcement_classes" ADD CONSTRAINT "announcement_classes_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "announcement_classes" ADD CONSTRAINT "announcement_classes_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "announcements" ADD CONSTRAINT "announcements_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "announcements" ADD CONSTRAINT "announcements_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "api_tokens" ADD CONSTRAINT "api_tokens_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_assignment_id_foreign" FOREIGN KEY ("assignment_id") REFERENCES "assignments" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignment_submissions" ADD CONSTRAINT "assignment_submissions_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_created_by_foreign" FOREIGN KEY ("created_by") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_edited_by_foreign" FOREIGN KEY ("edited_by") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "assignments" ADD CONSTRAINT "assignments_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "attachments" ADD CONSTRAINT "attachments_message_id_foreign" FOREIGN KEY ("message_id") REFERENCES "messages" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "attendances" ADD CONSTRAINT "attendances_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "attendances" ADD CONSTRAINT "attendances_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "attendances" ADD CONSTRAINT "attendances_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "attendances" ADD CONSTRAINT "attendances_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "attendances" ADD CONSTRAINT "attendances_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "bank_soal" ADD CONSTRAINT "bank_soal_subject_id_foreign" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "bank_soal" ADD CONSTRAINT "bank_soal_teacher_id_foreign" FOREIGN KEY ("teacher_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "bank_soal_detail" ADD CONSTRAINT "bank_soal_detail_bank_soal_id_foreign" FOREIGN KEY ("bank_soal_id") REFERENCES "bank_soal" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "bank_soal_detail" ADD CONSTRAINT "bank_soal_detail_subject_id_foreign" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "bank_soal_versions" ADD CONSTRAINT "bank_soal_versions_bank_soal_detail_id_foreign" FOREIGN KEY ("bank_soal_detail_id") REFERENCES "bank_soal_detail" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "bank_soal_versions" ADD CONSTRAINT "bank_soal_versions_updated_by_foreign" FOREIGN KEY ("updated_by") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "categories" ADD CONSTRAINT "categories_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "certificate_templates" ADD CONSTRAINT "certificate_templates_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "chats" ADD CONSTRAINT "chats_receiver_id_foreign" FOREIGN KEY ("receiver_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "chats" ADD CONSTRAINT "chats_sender_id_foreign" FOREIGN KEY ("sender_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_groups" ADD CONSTRAINT "class_groups_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_sections" ADD CONSTRAINT "class_sections_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_sections" ADD CONSTRAINT "class_sections_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "class_sections" ADD CONSTRAINT "class_sections_medium_id_foreign" FOREIGN KEY ("medium_id") REFERENCES "mediums" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_sections" ADD CONSTRAINT "class_sections_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_sections" ADD CONSTRAINT "class_sections_section_id_foreign" FOREIGN KEY ("section_id") REFERENCES "sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_sections" ADD CONSTRAINT "class_sections_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_subjects" ADD CONSTRAINT "class_subjects_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_subjects" ADD CONSTRAINT "class_subjects_elective_subject_group_id_foreign" FOREIGN KEY ("elective_subject_group_id") REFERENCES "elective_subject_groups" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_subjects" ADD CONSTRAINT "class_subjects_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_subjects" ADD CONSTRAINT "class_subjects_semester_id_foreign" FOREIGN KEY ("semester_id") REFERENCES "semesters" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_subjects" ADD CONSTRAINT "class_subjects_subject_id_foreign" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_teachers" ADD CONSTRAINT "class_teachers_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_teachers" ADD CONSTRAINT "class_teachers_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "class_teachers" ADD CONSTRAINT "class_teachers_teacher_id_foreign" FOREIGN KEY ("teacher_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "classes" ADD CONSTRAINT "classes_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "classes" ADD CONSTRAINT "classes_medium_id_foreign" FOREIGN KEY ("medium_id") REFERENCES "mediums" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "classes" ADD CONSTRAINT "classes_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "classes" ADD CONSTRAINT "classes_shift_id_foreign" FOREIGN KEY ("shift_id") REFERENCES "shifts" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "classes" ADD CONSTRAINT "classes_stream_id_foreign" FOREIGN KEY ("stream_id") REFERENCES "streams" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "compulsory_fees" ADD CONSTRAINT "compulsory_fees_fees_paid_id_foreign" FOREIGN KEY ("fees_paid_id") REFERENCES "fees_paids" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "compulsory_fees" ADD CONSTRAINT "compulsory_fees_installment_id_foreign" FOREIGN KEY ("installment_id") REFERENCES "fees_installments" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "compulsory_fees" ADD CONSTRAINT "compulsory_fees_payment_transaction_id_foreign" FOREIGN KEY ("payment_transaction_id") REFERENCES "payment_transactions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "compulsory_fees" ADD CONSTRAINT "compulsory_fees_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "compulsory_fees" ADD CONSTRAINT "compulsory_fees_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "database_backups" ADD CONSTRAINT "database_backups_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "device_tokens" ADD CONSTRAINT "device_tokens_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "document_files" ADD CONSTRAINT "document_files_folder_id_foreign" FOREIGN KEY ("folder_id") REFERENCES "document_folders" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "document_files" ADD CONSTRAINT "document_files_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "document_files" ADD CONSTRAINT "document_files_uploader_id_foreign" FOREIGN KEY ("uploader_id") REFERENCES "users" ("id") ON DELETE SET NULL ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "document_folders" ADD CONSTRAINT "document_folders_parent_id_foreign" FOREIGN KEY ("parent_id") REFERENCES "document_folders" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "document_folders" ADD CONSTRAINT "document_folders_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "elective_subject_groups" ADD CONSTRAINT "elective_subject_groups_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "elective_subject_groups" ADD CONSTRAINT "elective_subject_groups_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "elective_subject_groups" ADD CONSTRAINT "elective_subject_groups_semester_id_foreign" FOREIGN KEY ("semester_id") REFERENCES "semesters" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "eskul_absensis" ADD CONSTRAINT "eskul_absensis_eskul_detail_id_foreign" FOREIGN KEY ("eskul_detail_id") REFERENCES "eskul_details" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "eskul_details" ADD CONSTRAINT "eskul_details_estrakulikuler_id_foreign" FOREIGN KEY ("estrakulikuler_id") REFERENCES "estrakulikulers" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "eskul_details" ADD CONSTRAINT "eskul_details_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "eskul_timetables" ADD CONSTRAINT "eskul_timetables_estrakulikuler_id_foreign" FOREIGN KEY ("estrakulikuler_id") REFERENCES "estrakulikulers" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "estrakulikulers" ADD CONSTRAINT "estrakulikulers_coach_id_foreign" FOREIGN KEY ("coach_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_marks" ADD CONSTRAINT "exam_marks_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_marks" ADD CONSTRAINT "exam_marks_exam_timetable_id_foreign" FOREIGN KEY ("exam_timetable_id") REFERENCES "exam_timetables" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_marks" ADD CONSTRAINT "exam_marks_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "exam_marks" ADD CONSTRAINT "exam_marks_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_marks" ADD CONSTRAINT "exam_marks_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_marks" ADD CONSTRAINT "exam_marks_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_exam_id_foreign" FOREIGN KEY ("exam_id") REFERENCES "exams" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_results" ADD CONSTRAINT "exam_results_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_timetables" ADD CONSTRAINT "exam_timetables_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_timetables" ADD CONSTRAINT "exam_timetables_exam_id_foreign" FOREIGN KEY ("exam_id") REFERENCES "exams" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_timetables" ADD CONSTRAINT "exam_timetables_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exam_timetables" ADD CONSTRAINT "exam_timetables_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exams" ADD CONSTRAINT "exams_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exams" ADD CONSTRAINT "exams_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "exams" ADD CONSTRAINT "exams_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "exams" ADD CONSTRAINT "exams_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "expense_categories" ADD CONSTRAINT "expense_categories_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "expenses" ADD CONSTRAINT "expenses_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "expense_categories" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "expenses" ADD CONSTRAINT "expenses_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "expenses" ADD CONSTRAINT "expenses_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "expenses" ADD CONSTRAINT "expenses_staff_id_foreign" FOREIGN KEY ("staff_id") REFERENCES "staffs" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "extra_student_datas" ADD CONSTRAINT "extra_student_datas_form_field_id_foreign" FOREIGN KEY ("form_field_id") REFERENCES "form_fields" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "extra_student_datas" ADD CONSTRAINT "extra_student_datas_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "extra_student_datas" ADD CONSTRAINT "extra_student_datas_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "faqs" ADD CONSTRAINT "faqs_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "feature_section_lists" ADD CONSTRAINT "feature_section_lists_feature_section_id_foreign" FOREIGN KEY ("feature_section_id") REFERENCES "feature_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees" ADD CONSTRAINT "fees_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees" ADD CONSTRAINT "fees_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees" ADD CONSTRAINT "fees_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_advance" ADD CONSTRAINT "fees_advance_compulsory_fee_id_foreign" FOREIGN KEY ("compulsory_fee_id") REFERENCES "compulsory_fees" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_advance" ADD CONSTRAINT "fees_advance_parent_id_foreign" FOREIGN KEY ("parent_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_advance" ADD CONSTRAINT "fees_advance_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_class" ADD CONSTRAINT "fees_class_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_class" ADD CONSTRAINT "fees_class_fees_id_foreign" FOREIGN KEY ("fees_id") REFERENCES "fees" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_class_types" ADD CONSTRAINT "fees_class_types_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_class_types" ADD CONSTRAINT "fees_class_types_fees_id_foreign" FOREIGN KEY ("fees_id") REFERENCES "fees" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_class_types" ADD CONSTRAINT "fees_class_types_fees_type_id_foreign" FOREIGN KEY ("fees_type_id") REFERENCES "fees_types" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_class_types" ADD CONSTRAINT "fees_class_types_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_installments" ADD CONSTRAINT "fees_installments_fees_id_foreign" FOREIGN KEY ("fees_id") REFERENCES "fees" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_installments" ADD CONSTRAINT "fees_installments_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_installments" ADD CONSTRAINT "fees_installments_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_paids" ADD CONSTRAINT "fees_paids_fees_id_foreign" FOREIGN KEY ("fees_id") REFERENCES "fees" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_paids" ADD CONSTRAINT "fees_paids_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_paids" ADD CONSTRAINT "fees_paids_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "fees_types" ADD CONSTRAINT "fees_types_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "files" ADD CONSTRAINT "files_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "form_fields" ADD CONSTRAINT "form_fields_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "galleries" ADD CONSTRAINT "galleries_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "galleries" ADD CONSTRAINT "galleries_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "grade_level" ADD CONSTRAINT "grade_level_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "grades" ADD CONSTRAINT "grades_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "guardian_details" ADD CONSTRAINT "guardian_details_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "holidays" ADD CONSTRAINT "holidays_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "kpks" ADD CONSTRAINT "kpks_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "kpks" ADD CONSTRAINT "kpks_stream_id_foreign" FOREIGN KEY ("stream_id") REFERENCES "streams" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "leave_details" ADD CONSTRAINT "leave_details_leave_id_foreign" FOREIGN KEY ("leave_id") REFERENCES "leaves" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "leave_details" ADD CONSTRAINT "leave_details_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "leave_masters" ADD CONSTRAINT "leave_masters_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "leave_masters" ADD CONSTRAINT "leave_masters_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "leaves" ADD CONSTRAINT "leaves_leave_master_id_foreign" FOREIGN KEY ("leave_master_id") REFERENCES "leave_masters" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "leaves" ADD CONSTRAINT "leaves_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "leaves" ADD CONSTRAINT "leaves_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "lesson_topics" ADD CONSTRAINT "lesson_topics_lesson_id_foreign" FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "lesson_topics" ADD CONSTRAINT "lesson_topics_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "lessons" ADD CONSTRAINT "lessons_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "lessons" ADD CONSTRAINT "lessons_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "lessons" ADD CONSTRAINT "lessons_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "mediums" ADD CONSTRAINT "mediums_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "messages" ADD CONSTRAINT "messages_chat_id_foreign" FOREIGN KEY ("chat_id") REFERENCES "chats" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "messages" ADD CONSTRAINT "messages_sender_id_foreign" FOREIGN KEY ("sender_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "model_has_permissions" ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "model_has_roles" ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "modules" ADD CONSTRAINT "modules_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_question_choices" ADD CONSTRAINT "online_exam_question_choices_online_exam_id_foreign" FOREIGN KEY ("online_exam_id") REFERENCES "online_exams" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_question_choices" ADD CONSTRAINT "online_exam_question_choices_question_id_foreign" FOREIGN KEY ("question_id") REFERENCES "online_exam_questions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_question_choices" ADD CONSTRAINT "online_exam_question_choices_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_question_options" ADD CONSTRAINT "online_exam_question_options_question_id_foreign" FOREIGN KEY ("question_id") REFERENCES "online_exam_questions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_question_options" ADD CONSTRAINT "online_exam_question_options_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_questions" ADD CONSTRAINT "online_exam_questions_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_questions" ADD CONSTRAINT "online_exam_questions_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_questions" ADD CONSTRAINT "online_exam_questions_last_edited_by_foreign" FOREIGN KEY ("last_edited_by") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_questions" ADD CONSTRAINT "online_exam_questions_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_answers" ADD CONSTRAINT "online_exam_student_answers_online_exam_id_foreign" FOREIGN KEY ("online_exam_id") REFERENCES "online_exams" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_answers" ADD CONSTRAINT "online_exam_student_answers_option_id_foreign" FOREIGN KEY ("option_id") REFERENCES "online_exam_question_options" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_answers" ADD CONSTRAINT "online_exam_student_answers_question_id_foreign" FOREIGN KEY ("question_id") REFERENCES "online_exam_question_choices" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_answers" ADD CONSTRAINT "online_exam_student_answers_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_answers" ADD CONSTRAINT "online_exam_student_answers_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_marks" ADD CONSTRAINT "online_exam_student_marks_online_exam_id_foreign" FOREIGN KEY ("online_exam_id") REFERENCES "online_exams" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exam_student_marks" ADD CONSTRAINT "online_exam_student_marks_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exams" ADD CONSTRAINT "online_exams_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exams" ADD CONSTRAINT "online_exams_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exams" ADD CONSTRAINT "online_exams_fk_grade_level_id" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "online_exams" ADD CONSTRAINT "online_exams_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "online_exams" ADD CONSTRAINT "online_exams_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "optional_fees" ADD CONSTRAINT "optional_fees_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "optional_fees" ADD CONSTRAINT "optional_fees_fees_class_id_foreign" FOREIGN KEY ("fees_class_id") REFERENCES "fees_class_types" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "optional_fees" ADD CONSTRAINT "optional_fees_fees_paid_id_foreign" FOREIGN KEY ("fees_paid_id") REFERENCES "fees_paids" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "optional_fees" ADD CONSTRAINT "optional_fees_payment_transaction_id_foreign" FOREIGN KEY ("payment_transaction_id") REFERENCES "payment_transactions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "optional_fees" ADD CONSTRAINT "optional_fees_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "optional_fees" ADD CONSTRAINT "optional_fees_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "original_classes" ADD CONSTRAINT "original_classes_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "original_classes" ADD CONSTRAINT "original_classes_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "original_classes" ADD CONSTRAINT "original_classes_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "original_classes" ADD CONSTRAINT "original_classes_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "package_features" ADD CONSTRAINT "package_features_feature_id_foreign" FOREIGN KEY ("feature_id") REFERENCES "features" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "package_features" ADD CONSTRAINT "package_features_package_id_foreign" FOREIGN KEY ("package_id") REFERENCES "packages" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "payment_configurations" ADD CONSTRAINT "payment_configurations_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "payment_history" ADD CONSTRAINT "payment_history_fees_id_foreign" FOREIGN KEY ("fees_id") REFERENCES "fees" ("id") NOT VALID NOT VALID;
ALTER TABLE "payment_history" ADD CONSTRAINT "payment_history_payment_method_id_foreign" FOREIGN KEY ("payment_method_id") REFERENCES "payment_methods" ("id") NOT VALID NOT VALID;
ALTER TABLE "payment_history" ADD CONSTRAINT "payment_history_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "students" ("id") NOT VALID NOT VALID;
ALTER TABLE "payment_history" ADD CONSTRAINT "payment_history_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") NOT VALID NOT VALID;
ALTER TABLE "payment_transactions" ADD CONSTRAINT "payment_transactions_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "payment_transactions" ADD CONSTRAINT "payment_transactions_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "payroll_settings" ADD CONSTRAINT "payroll_settings_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "promote_students_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "promote_students_from_grade_level_id_foreign" FOREIGN KEY ("from_grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "promote_students_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "promote_students_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "promote_students_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "promote_students_to_grade_level_id_foreign" FOREIGN KEY ("to_grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "promote_students" ADD CONSTRAINT "ps_fk_original_class_section" FOREIGN KEY ("original_class_section_id") REFERENCES "class_sections" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "recap_absensi" ADD CONSTRAINT "fk_original_class_section" FOREIGN KEY ("original_class_section_id") REFERENCES "class_sections" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "recap_absensi" ADD CONSTRAINT "recap_absensi_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "recap_absensi" ADD CONSTRAINT "recap_absensi_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "recap_absensi" ADD CONSTRAINT "recap_absensi_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "recap_edits" ADD CONSTRAINT "recap_edits_subject_attendance_id_foreign" FOREIGN KEY ("subject_attendance_id") REFERENCES "subject_attendances" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "recap_edits" ADD CONSTRAINT "recap_edits_subject_attendance_student_id_foreign" FOREIGN KEY ("subject_attendance_student_id") REFERENCES "subject_attendance_students" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "roles" ADD CONSTRAINT "roles_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "school_settings" ADD CONSTRAINT "school_settings_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "schools" ADD CONSTRAINT "fk_schools_edu_level" FOREIGN KEY ("edu_level_id") REFERENCES "edu_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "schools" ADD CONSTRAINT "schools_admin_id_foreign" FOREIGN KEY ("admin_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "sections" ADD CONSTRAINT "sections_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "semesters" ADD CONSTRAINT "semesters_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "session_years" ADD CONSTRAINT "session_years_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "shifts" ADD CONSTRAINT "shifts_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "sliders" ADD CONSTRAINT "sliders_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "special_fees" ADD CONSTRAINT "special_fees_fees_id_foreign" FOREIGN KEY ("fees_id") REFERENCES "fees" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "special_fees" ADD CONSTRAINT "special_fees_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "special_fees" ADD CONSTRAINT "special_fees_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_payrolls" ADD CONSTRAINT "staff_payrolls_expense_id_foreign" FOREIGN KEY ("expense_id") REFERENCES "expenses" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_payrolls" ADD CONSTRAINT "staff_payrolls_payroll_setting_id_foreign" FOREIGN KEY ("payroll_setting_id") REFERENCES "payroll_settings" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_payrolls" ADD CONSTRAINT "staff_payrolls_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_salaries" ADD CONSTRAINT "staff_salaries_payroll_setting_id_foreign" FOREIGN KEY ("payroll_setting_id") REFERENCES "payroll_settings" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_salaries" ADD CONSTRAINT "staff_salaries_staff_id_foreign" FOREIGN KEY ("staff_id") REFERENCES "staffs" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_support_schools" ADD CONSTRAINT "staff_support_schools_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staff_support_schools" ADD CONSTRAINT "staff_support_schools_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "staffs" ADD CONSTRAINT "staffs_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "streams" ADD CONSTRAINT "streams_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_online_exam_statuses" ADD CONSTRAINT "student_online_exam_statuses_online_exam_id_foreign" FOREIGN KEY ("online_exam_id") REFERENCES "online_exams" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_online_exam_statuses" ADD CONSTRAINT "student_online_exam_statuses_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_online_exam_statuses" ADD CONSTRAINT "student_online_exam_statuses_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_subjects" ADD CONSTRAINT "student_subjects_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_subjects" ADD CONSTRAINT "student_subjects_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_subjects" ADD CONSTRAINT "student_subjects_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_subjects" ADD CONSTRAINT "student_subjects_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "student_subjects" ADD CONSTRAINT "student_subjects_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_class_id_foreign" FOREIGN KEY ("class_id") REFERENCES "classes" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_guardian_id_foreign" FOREIGN KEY ("guardian_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_original_class_section_id_foreign" FOREIGN KEY ("original_class_section_id") REFERENCES "class_sections" ("id") ON DELETE SET NULL NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "students" ADD CONSTRAINT "students_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendance_students" ADD CONSTRAINT "subject_attendance_students_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendance_students" ADD CONSTRAINT "subject_attendance_students_subject_attendance_id_foreign" FOREIGN KEY ("subject_attendance_id") REFERENCES "subject_attendances" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendances" ADD CONSTRAINT "subject_attendances_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendances" ADD CONSTRAINT "subject_attendances_grade_level_id_foreign" FOREIGN KEY ("grade_level_id") REFERENCES "grade_level" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendances" ADD CONSTRAINT "subject_attendances_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendances" ADD CONSTRAINT "subject_attendances_session_year_id_foreign" FOREIGN KEY ("session_year_id") REFERENCES "session_years" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_attendances" ADD CONSTRAINT "subject_attendances_timetable_id_foreign" FOREIGN KEY ("timetable_id") REFERENCES "timetables" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_class_subject_id_foreign" FOREIGN KEY ("class_subject_id") REFERENCES "class_subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_subject_id_foreign" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subject_teachers" ADD CONSTRAINT "subject_teachers_teacher_id_foreign" FOREIGN KEY ("teacher_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subjects" ADD CONSTRAINT "subjects_medium_id_foreign" FOREIGN KEY ("medium_id") REFERENCES "mediums" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subjects" ADD CONSTRAINT "subjects_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subscription_bills" ADD CONSTRAINT "subscription_bills_payment_transaction_id_foreign" FOREIGN KEY ("payment_transaction_id") REFERENCES "payment_transactions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subscription_bills" ADD CONSTRAINT "subscription_bills_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subscription_bills" ADD CONSTRAINT "subscription_bills_subscription_id_foreign" FOREIGN KEY ("subscription_id") REFERENCES "subscriptions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subscription_features" ADD CONSTRAINT "subscription_features_feature_id_foreign" FOREIGN KEY ("feature_id") REFERENCES "features" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subscription_features" ADD CONSTRAINT "subscription_features_subscription_id_foreign" FOREIGN KEY ("subscription_id") REFERENCES "subscriptions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "subscriptions" ADD CONSTRAINT "subscriptions_package_id_foreign" FOREIGN KEY ("package_id") REFERENCES "packages" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "timetables" ADD CONSTRAINT "timetables_class_section_id_foreign" FOREIGN KEY ("class_section_id") REFERENCES "class_sections" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "timetables" ADD CONSTRAINT "timetables_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "timetables" ADD CONSTRAINT "timetables_semester_id_foreign" FOREIGN KEY ("semester_id") REFERENCES "semesters" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "timetables" ADD CONSTRAINT "timetables_subject_id_foreign" FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "timetables" ADD CONSTRAINT "timetables_subject_teacher_id_foreign" FOREIGN KEY ("subject_teacher_id") REFERENCES "subject_teachers" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "trial_reminder_logs" ADD CONSTRAINT "trial_reminder_logs_subscription_id_foreign" FOREIGN KEY ("subscription_id") REFERENCES "subscriptions" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_bendahara" ADD CONSTRAINT "fk_folder_bendahara" FOREIGN KEY ("id_folder") REFERENCES "folder_bendahara" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_bendahara" ADD CONSTRAINT "fk_tag_dokumen_bendahara" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_bendahara" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_bendahara" ADD CONSTRAINT "upload_file_bendahara_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_bendahara" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_bendahara" ADD CONSTRAINT "upload_file_bendahara_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_bendahara" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_humas" ADD CONSTRAINT "fk_folder_humas" FOREIGN KEY ("id_folder") REFERENCES "folder_humas" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_humas" ADD CONSTRAINT "fk_tag_dokumen_humas" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_humas" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_humas" ADD CONSTRAINT "upload_file_humas_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_humas" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_humas" ADD CONSTRAINT "upload_file_humas_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_humas" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kesiswaan" ADD CONSTRAINT "upload_file_kesiswaan_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kesiswaan" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk" ADD CONSTRAINT "fk_folder_kpk" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk" ADD CONSTRAINT "fk_tag_dokumen_kpk" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk" ADD CONSTRAINT "upload_file_kpk_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk" ADD CONSTRAINT "upload_file_kpk_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_elin" ADD CONSTRAINT "fk_folder_kpk_elin" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_elin" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_elin" ADD CONSTRAINT "fk_tag_dokumen_kpk_elin" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_elin" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_elin" ADD CONSTRAINT "upload_file_kpk_elin_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_elin" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_elin" ADD CONSTRAINT "upload_file_kpk_elin_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_elin" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_metro" ADD CONSTRAINT "fk_folder_kpk_metro" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_metro" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_metro" ADD CONSTRAINT "fk_tag_dokumen_kpk_metro" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_metro" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_metro" ADD CONSTRAINT "upload_file_kpk_metro_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_metro" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_metro" ADD CONSTRAINT "upload_file_kpk_metro_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_metro" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_rpl" ADD CONSTRAINT "fk_folder_kpk_rpl" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_rpl" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_rpl" ADD CONSTRAINT "fk_tag_dokumen_kpk_rpl" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_rpl" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_rpl" ADD CONSTRAINT "upload_file_kpk_rpl_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_rpl" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_rpl" ADD CONSTRAINT "upload_file_kpk_rpl_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_rpl" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_tkj" ADD CONSTRAINT "fk_folder_kpk_tkj" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_tkj" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_tkj" ADD CONSTRAINT "fk_tag_dokumen_kpk_tkj" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_tkj" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_tkj" ADD CONSTRAINT "upload_file_kpk_tkj_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_kpk_tkj" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kpk_tkj" ADD CONSTRAINT "upload_file_kpk_tkj_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kpk_tkj" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kurikulum" ADD CONSTRAINT "fk_folder_kurikulum" FOREIGN KEY ("id_folder") REFERENCES "folder_kurikulum" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kurikulum" ADD CONSTRAINT "fk_tag_dokumen_kurikulum" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kurikulum" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kurikulum" ADD CONSTRAINT "upload_file_kurikulum_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_kurikulum" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_kurikulum" ADD CONSTRAINT "upload_file_kurikulum_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_kurikulum" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_pdsm" ADD CONSTRAINT "fk_folder_pdsm" FOREIGN KEY ("id_folder") REFERENCES "folder_pdsm" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_pdsm" ADD CONSTRAINT "fk_tag_dokumen_pdsm" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_pdsm" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_pdsm" ADD CONSTRAINT "upload_file_pdsm_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_pdsm" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_pdsm" ADD CONSTRAINT "upload_file_pdsm_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_pdsm" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_perpus" ADD CONSTRAINT "fk_folder_perpus" FOREIGN KEY ("id_folder") REFERENCES "folder_perpus" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_perpus" ADD CONSTRAINT "fk_tag_dokumen_perpus" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_perpus" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_perpus" ADD CONSTRAINT "upload_file_perpus_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_perpus" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_perpus" ADD CONSTRAINT "upload_file_perpus_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_perpus" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_sarpas" ADD CONSTRAINT "fk_folder_sarpras" FOREIGN KEY ("id_folder") REFERENCES "folder_sarpas" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_sarpas" ADD CONSTRAINT "fk_tag_dokumen_sarpras" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_sarpas" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_sarpas" ADD CONSTRAINT "upload_file_sarpas_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_sarpas" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_sarpas" ADD CONSTRAINT "upload_file_sarpas_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_sarpas" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_tatib" ADD CONSTRAINT "upload_file_tatib_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_tatib" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_tu" ADD CONSTRAINT "fk_folder_tu" FOREIGN KEY ("id_folder") REFERENCES "folder_tu" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_tu" ADD CONSTRAINT "fk_tag_dokumen_tu" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_tu" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_tu" ADD CONSTRAINT "upload_file_tu_id_folder_foreign" FOREIGN KEY ("id_folder") REFERENCES "folder_tu" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "upload_file_tu" ADD CONSTRAINT "upload_file_tu_id_tag_foreign" FOREIGN KEY ("id_tag") REFERENCES "tag_dokumen_tu" ("id") ON DELETE CASCADE ON UPDATE CASCADE NOT VALID NOT VALID;
ALTER TABLE "user_status_for_next_cycles" ADD CONSTRAINT "user_status_for_next_cycles_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "user_status_for_next_cycles" ADD CONSTRAINT "user_status_for_next_cycles_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "users" ADD CONSTRAINT "users_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "xendit_invoices" ADD CONSTRAINT "xendit_invoices_parent_id_foreign" FOREIGN KEY ("parent_id") REFERENCES "users" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "xendit_invoices" ADD CONSTRAINT "xendit_invoices_school_id_foreign" FOREIGN KEY ("school_id") REFERENCES "schools" ("id") ON DELETE CASCADE NOT VALID NOT VALID;
ALTER TABLE "xendit_invoices" ADD CONSTRAINT "xendit_invoices_student_id_foreign" FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE NOT VALID NOT VALID;

-- ============================================================
-- CAST TINYINT(1) TO BOOLEAN
-- (Done here so that INSERT INTO 0 and 1 works flawlessly!)
-- ============================================================

ALTER TABLE "api_tokens" ALTER COLUMN "is_active" DROP DEFAULT;
ALTER TABLE "api_tokens" ALTER COLUMN "is_active" TYPE boolean USING ("is_active" <> 0);
ALTER TABLE "api_tokens" ALTER COLUMN "is_active" SET DEFAULT false;
ALTER TABLE "assignments" ALTER COLUMN "resubmission" DROP DEFAULT;
ALTER TABLE "assignments" ALTER COLUMN "resubmission" TYPE boolean USING ("resubmission" <> 0);
ALTER TABLE "assignments" ALTER COLUMN "resubmission" SET DEFAULT false;
ALTER TABLE "attendance_days" ALTER COLUMN "is_active" DROP DEFAULT;
ALTER TABLE "attendance_days" ALTER COLUMN "is_active" TYPE boolean USING ("is_active" <> 0);
ALTER TABLE "attendance_days" ALTER COLUMN "is_active" SET DEFAULT false;
ALTER TABLE "class_sections" ALTER COLUMN "pkl" DROP DEFAULT;
ALTER TABLE "class_sections" ALTER COLUMN "pkl" TYPE boolean USING ("pkl" <> 0);
ALTER TABLE "class_sections" ALTER COLUMN "pkl" SET DEFAULT false;
ALTER TABLE "device_tokens" ALTER COLUMN "is_active" DROP DEFAULT;
ALTER TABLE "device_tokens" ALTER COLUMN "is_active" TYPE boolean USING ("is_active" <> 0);
ALTER TABLE "device_tokens" ALTER COLUMN "is_active" SET DEFAULT false;
ALTER TABLE "document_files" ALTER COLUMN "visible_to_teacher" DROP DEFAULT;
ALTER TABLE "document_files" ALTER COLUMN "visible_to_teacher" TYPE boolean USING ("visible_to_teacher" <> 0);
ALTER TABLE "document_files" ALTER COLUMN "visible_to_teacher" SET DEFAULT false;
ALTER TABLE "exam_marks" ALTER COLUMN "passing_status" DROP DEFAULT;
ALTER TABLE "exam_marks" ALTER COLUMN "passing_status" TYPE boolean USING ("passing_status" <> 0);
ALTER TABLE "exam_marks" ALTER COLUMN "passing_status" SET DEFAULT false;
ALTER TABLE "fees_class_types" ALTER COLUMN "optional" DROP DEFAULT;
ALTER TABLE "fees_class_types" ALTER COLUMN "optional" TYPE boolean USING ("optional" <> 0);
ALTER TABLE "fees_class_types" ALTER COLUMN "optional" SET DEFAULT false;
ALTER TABLE "fees_paids" ALTER COLUMN "is_fully_paid" DROP DEFAULT;
ALTER TABLE "fees_paids" ALTER COLUMN "is_fully_paid" TYPE boolean USING ("is_fully_paid" <> 0);
ALTER TABLE "fees_paids" ALTER COLUMN "is_fully_paid" SET DEFAULT false;
ALTER TABLE "fees_paids" ALTER COLUMN "is_used_installment" DROP DEFAULT;
ALTER TABLE "fees_paids" ALTER COLUMN "is_used_installment" TYPE boolean USING ("is_used_installment" <> 0);
ALTER TABLE "fees_paids" ALTER COLUMN "is_used_installment" SET DEFAULT false;
ALTER TABLE "form_fields" ALTER COLUMN "is_required" DROP DEFAULT;
ALTER TABLE "form_fields" ALTER COLUMN "is_required" TYPE boolean USING ("is_required" <> 0);
ALTER TABLE "form_fields" ALTER COLUMN "is_required" SET DEFAULT false;
ALTER TABLE "online_exam_answer_not_multiple_choices" ALTER COLUMN "is_answer_correction" DROP DEFAULT;
ALTER TABLE "online_exam_answer_not_multiple_choices" ALTER COLUMN "is_answer_correction" TYPE boolean USING ("is_answer_correction" <> 0);
ALTER TABLE "online_exam_answer_not_multiple_choices" ALTER COLUMN "is_answer_correction" SET DEFAULT false;
ALTER TABLE "otp_verifications" ALTER COLUMN "is_verified" DROP DEFAULT;
ALTER TABLE "otp_verifications" ALTER COLUMN "is_verified" TYPE boolean USING ("is_verified" <> 0);
ALTER TABLE "otp_verifications" ALTER COLUMN "is_verified" SET DEFAULT false;
ALTER TABLE "payment_configurations" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "payment_configurations" ALTER COLUMN "status" TYPE boolean USING ("status" <> 0);
ALTER TABLE "payment_configurations" ALTER COLUMN "status" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "custom_role" DROP DEFAULT;
ALTER TABLE "roles" ALTER COLUMN "custom_role" TYPE boolean USING ("custom_role" <> 0);
ALTER TABLE "roles" ALTER COLUMN "custom_role" SET DEFAULT false;
ALTER TABLE "roles" ALTER COLUMN "editable" DROP DEFAULT;
ALTER TABLE "roles" ALTER COLUMN "editable" TYPE boolean USING ("editable" <> 0);
ALTER TABLE "roles" ALTER COLUMN "editable" SET DEFAULT false;
ALTER TABLE "schools" ALTER COLUMN "is_trial" DROP DEFAULT;
ALTER TABLE "schools" ALTER COLUMN "is_trial" TYPE boolean USING ("is_trial" <> 0);
ALTER TABLE "schools" ALTER COLUMN "is_trial" SET DEFAULT false;
ALTER TABLE "schools" ALTER COLUMN "xendit_enabled" DROP DEFAULT;
ALTER TABLE "schools" ALTER COLUMN "xendit_enabled" TYPE boolean USING ("xendit_enabled" <> 0);
ALTER TABLE "schools" ALTER COLUMN "xendit_enabled" SET DEFAULT false;
ALTER TABLE "students" ALTER COLUMN "billing_disabled" DROP DEFAULT;
ALTER TABLE "students" ALTER COLUMN "billing_disabled" TYPE boolean USING ("billing_disabled" <> 0);
ALTER TABLE "students" ALTER COLUMN "billing_disabled" SET DEFAULT false;
ALTER TABLE "user_relation" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "user_relation" ALTER COLUMN "status" TYPE boolean USING ("status" <> 0);
ALTER TABLE "user_relation" ALTER COLUMN "status" SET DEFAULT false;
