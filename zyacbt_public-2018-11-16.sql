-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 16, 2018 at 01:20 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zyacbt`
--
CREATE DATABASE `zyacbt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zyacbt`;

-- --------------------------------------------------------

--
-- Table structure for table `cbt_jawaban`
--

CREATE TABLE IF NOT EXISTS `cbt_jawaban` (
  `jawaban_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `jawaban_soal_id` bigint(20) unsigned NOT NULL,
  `jawaban_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `jawaban_benar` tinyint(1) NOT NULL DEFAULT '0',
  `jawaban_aktif` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`jawaban_id`),
  KEY `p_answer_question_id` (`jawaban_soal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=626 ;

--
-- Dumping data for table `cbt_jawaban`
--

INSERT INTO `cbt_jawaban` (`jawaban_id`, `jawaban_soal_id`, `jawaban_detail`, `jawaban_benar`, `jawaban_aktif`) VALUES
(186, 57, '<p>1 Syawal</p>\r\n', 1, 1),
(187, 57, '<p>1 Agustus</p>', 0, 1),
(188, 57, '<p>1 Januari</p>', 0, 1),
(189, 57, '<p>1 Desember</p>', 0, 1),
(190, 57, '<p>14 Februari</p>', 0, 1),
(191, 56, '<p>Nazril Irham</p>', 1, 1),
(192, 56, '<p>Joko Susilo</p>', 0, 1),
(193, 56, '<p>Wahyu Saputra</p>\r\n', 0, 1),
(194, 56, '<p>Aril Piterpen</p>', 0, 1),
(195, 56, 'Joko Wow', 0, 1),
(196, 55, '<p>Soekarno</p>', 1, 1),
(197, 55, '<p>Soeharto</p>\r\n', 0, 1),
(198, 55, '<p>Susilo Bambang Yudhoyono</p>\r\n', 0, 1),
(199, 55, '<p>BJ. Habibie</p>\r\n', 0, 1),
(200, 55, '<p>Joko Widodo</p>\r\n', 0, 1),
(201, 54, '<p>Sun East Mall</p>', 1, 1),
(202, 54, '<p>Matahari</p>', 0, 1),
(203, 54, '<p>Bulan</p>', 0, 1),
(204, 54, '<p>Tanah Abang</p>', 0, 1),
(205, 54, '<p>Tanah Lempong</p>', 0, 1),
(206, 53, '<p>Sekolah Menengah Kejuruan</p>', 1, 1),
(207, 53, '<p>Sekolah Menengah Kejujuran</p>', 0, 1),
(208, 53, '<p>Sekolah Maju Sendiri</p>', 0, 1),
(209, 53, '<p>Sekolah Mak Ku</p>', 0, 1),
(210, 53, '<p>Sekolah Memilih Kekasih</p>', 0, 1),
(211, 64, 'Akhirnya aku menemukanmu', 1, 1),
(212, 64, 'Akhir dirimu', 0, 1),
(213, 64, 'Susahnya jadi dia', 0, 1),
(214, 64, 'Jones', 0, 1),
(215, 64, 'Josan - Jomblo Pas Pasan', 0, 1),
(621, 161, '<p>Aksi bela Jomblo</p>\r\n', 1, 1),
(622, 161, '<p>Aksi bela cewek</p>\r\n', 0, 1),
(623, 161, '<p>14 Februari</p>\r\n', 0, 1),
(624, 161, '<p>Hari Valentine</p>\r\n', 0, 1),
(625, 161, '<p>Turun ke jalan</p>\r\n', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_modul`
--

CREATE TABLE IF NOT EXISTS `cbt_modul` (
  `modul_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `modul_nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modul_aktif` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`modul_id`),
  UNIQUE KEY `ak_module_name` (`modul_nama`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `cbt_modul`
--

INSERT INTO `cbt_modul` (`modul_id`, `modul_nama`, `modul_aktif`) VALUES
(9, 'Default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_soal`
--

CREATE TABLE IF NOT EXISTS `cbt_soal` (
  `soal_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `soal_topik_id` bigint(20) unsigned NOT NULL,
  `soal_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `soal_tipe` smallint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=Pilihan ganda, 2=essay, 3=jawaban singkat',
  `soal_kunci` text COLLATE utf8_unicode_ci COMMENT 'Kunci untuk soal jawaban singkat',
  `soal_difficulty` smallint(6) NOT NULL DEFAULT '1',
  `soal_aktif` tinyint(1) NOT NULL DEFAULT '0',
  `soal_audio` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soal_audio_play` int(11) NOT NULL DEFAULT '0',
  `soal_timer` smallint(10) DEFAULT NULL,
  `soal_inline_answers` tinyint(1) NOT NULL DEFAULT '0',
  `soal_auto_next` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`soal_id`),
  KEY `p_question_subject_id` (`soal_topik_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=215 ;

--
-- Dumping data for table `cbt_soal`
--

INSERT INTO `cbt_soal` (`soal_id`, `soal_topik_id`, `soal_detail`, `soal_tipe`, `soal_kunci`, `soal_difficulty`, `soal_aktif`, `soal_audio`, `soal_audio_play`, `soal_timer`, `soal_inline_answers`, `soal_auto_next`) VALUES
(53, 7, 'Apakah kepanjangan dari SMK ?', 1, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(54, 7, '<p>Nama salah satu Mall yang ada di kota genteng adalah ...<br></p>', 1, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(55, 7, '<p>Siapakah nama tokoh berikut ?</p><p><img src="[base_url]uploads/topik_7/soekarno.jpg" style="max-width: 600px;"><br></p>', 1, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(56, 7, '<p>Siapakah vokalis band NOAH ?<br></p>', 1, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(57, 7, '<p>Tanggal berapakah hari raya Idul Fitri ?</p>\r\n', 1, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(61, 7, 'Jelaskan apa yang dimaksud dengan Jomblo ?', 2, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(62, 7, '<p>PT. Tiar Perkasa ingin melebarkan sayap usaha di bidang kuliner.</p><p>Dari pernyataan tersebut, sebutkan siapa kekasih mas Tiar ?</p>', 2, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(63, 7, '<p>Jelaskan kenapa Liverpool FC susah sekali untuk juara Premiere Leage !</p>\r\n', 2, NULL, 1, 1, NULL, 1, NULL, 0, 0),
(64, 7, '<p>Apakah judul lagu berikut ini?</p>', 1, NULL, 1, 1, 'naff_-_akhirnya_ku_menemukanmu.mp3', 1, NULL, 0, 0),
(161, 7, '<p>Jelaskan arti poster dibawah ini ?</p>\r\n\r\n<p><img src="[base_url]uploads/topik_7/5a49b252e7aea.jpeg" style="height:283px; width:300px" /></p>\r\n', 1, NULL, 1, 1, NULL, 0, NULL, 0, 0),
(214, 7, '<p>Berapakah 5x10 ?</p>\r\n', 3, '50', 1, 1, NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tes`
--

CREATE TABLE IF NOT EXISTS `cbt_tes` (
  `tes_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tes_nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tes_detail` text COLLATE utf8_unicode_ci NOT NULL,
  `tes_begin_time` datetime DEFAULT NULL,
  `tes_end_time` datetime DEFAULT NULL,
  `tes_duration_time` smallint(10) unsigned NOT NULL DEFAULT '0',
  `tes_ip_range` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '*.*.*.*',
  `tes_results_to_users` tinyint(1) NOT NULL DEFAULT '0',
  `tes_detail_to_users` tinyint(1) NOT NULL DEFAULT '0',
  `tes_score_right` decimal(10,2) DEFAULT '1.00',
  `tes_score_wrong` decimal(10,2) DEFAULT '0.00',
  `tes_score_unanswered` decimal(10,2) DEFAULT '0.00',
  `tes_max_score` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tes_token` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`tes_id`),
  UNIQUE KEY `ak_test_name` (`tes_nama`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cbt_tes`
--

INSERT INTO `cbt_tes` (`tes_id`, `tes_nama`, `tes_detail`, `tes_begin_time`, `tes_end_time`, `tes_duration_time`, `tes_ip_range`, `tes_results_to_users`, `tes_detail_to_users`, `tes_score_right`, `tes_score_wrong`, `tes_score_unanswered`, `tes_max_score`, `tes_token`) VALUES
(2, 'Tes Uji Coba', 'Tes Uji Coba', '2018-11-14 10:48:00', '2018-11-15 10:48:00', 30, '*.*.*.*', 1, 0, 1.00, 0.00, 0.00, 10.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tes_soal`
--

CREATE TABLE IF NOT EXISTS `cbt_tes_soal` (
  `tessoal_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tessoal_tesuser_id` bigint(20) unsigned NOT NULL,
  `tessoal_user_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tessoal_soal_id` bigint(20) unsigned NOT NULL,
  `tessoal_jawaban_text` text COLLATE utf8_unicode_ci,
  `tessoal_nilai` decimal(10,2) DEFAULT NULL,
  `tessoal_creation_time` datetime DEFAULT NULL,
  `tessoal_display_time` datetime DEFAULT NULL,
  `tessoal_change_time` datetime DEFAULT NULL,
  `tessoal_reaction_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tessoal_ragu` int(1) NOT NULL DEFAULT '0' COMMENT '1=ragu, 0=tidak ragu',
  `tessoal_order` smallint(6) NOT NULL DEFAULT '1',
  `tessoal_num_answers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tessoal_comment` text COLLATE utf8_unicode_ci,
  `tessoal_audio_play` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tessoal_id`),
  UNIQUE KEY `ak_testuser_question` (`tessoal_tesuser_id`,`tessoal_soal_id`),
  KEY `p_testlog_question_id` (`tessoal_soal_id`),
  KEY `p_testlog_testuser_id` (`tessoal_tesuser_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `cbt_tes_soal`
--

INSERT INTO `cbt_tes_soal` (`tessoal_id`, `tessoal_tesuser_id`, `tessoal_user_ip`, `tessoal_soal_id`, `tessoal_jawaban_text`, `tessoal_nilai`, `tessoal_creation_time`, `tessoal_display_time`, `tessoal_change_time`, `tessoal_reaction_time`, `tessoal_ragu`, `tessoal_order`, `tessoal_num_answers`, `tessoal_comment`, `tessoal_audio_play`) VALUES
(31, 4, NULL, 214, '50', 1.00, '2018-11-15 07:43:44', '2018-11-15 07:58:50', '2018-11-15 07:58:54', 0, 0, 1, 0, NULL, 0),
(32, 4, NULL, 161, NULL, 1.00, '2018-11-15 07:43:44', '2018-11-15 07:58:56', '2018-11-15 07:59:09', 0, 0, 2, 0, NULL, 0),
(33, 4, NULL, 56, NULL, 1.00, '2018-11-15 07:43:44', '2018-11-15 08:00:03', '2018-11-15 08:00:06', 0, 0, 3, 0, NULL, 0),
(34, 4, NULL, 53, NULL, 1.00, '2018-11-15 07:43:44', '2018-11-15 07:59:18', '2018-11-15 07:59:20', 0, 0, 4, 0, NULL, 0),
(35, 4, NULL, 54, NULL, 1.00, '2018-11-15 07:43:44', '2018-11-15 08:00:07', '2018-11-15 08:00:08', 0, 0, 5, 0, NULL, 0),
(36, 4, NULL, 63, NULL, 0.00, '2018-11-15 07:43:44', '2018-11-15 08:00:09', NULL, 0, 0, 6, 0, NULL, 0),
(37, 4, NULL, 55, NULL, 1.00, '2018-11-15 07:43:44', '2018-11-15 08:02:04', '2018-11-15 08:00:11', 0, 0, 7, 0, NULL, 0),
(38, 4, NULL, 61, NULL, 0.00, '2018-11-15 07:43:44', '2018-11-15 08:02:02', NULL, 0, 0, 8, 0, NULL, 0),
(39, 4, NULL, 57, NULL, 1.00, '2018-11-15 07:43:44', '2018-11-15 08:02:01', '2018-11-15 07:59:28', 0, 0, 9, 0, NULL, 0),
(40, 4, NULL, 62, 'Hahahaha', 1.00, '2018-11-15 07:43:44', '2018-11-15 08:01:05', '2018-11-15 08:01:09', 0, 0, 10, 0, 'Sudah di koreksi admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tes_soal_jawaban`
--

CREATE TABLE IF NOT EXISTS `cbt_tes_soal_jawaban` (
  `soaljawaban_tessoal_id` bigint(20) unsigned NOT NULL,
  `soaljawaban_jawaban_id` bigint(20) unsigned NOT NULL,
  `soaljawaban_selected` smallint(6) NOT NULL DEFAULT '-1',
  `soaljawaban_order` smallint(6) NOT NULL DEFAULT '1',
  `soaljawaban_position` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`soaljawaban_tessoal_id`,`soaljawaban_jawaban_id`),
  KEY `p_logansw_answer_id` (`soaljawaban_jawaban_id`),
  KEY `p_logansw_testlog_id` (`soaljawaban_tessoal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cbt_tes_soal_jawaban`
--

INSERT INTO `cbt_tes_soal_jawaban` (`soaljawaban_tessoal_id`, `soaljawaban_jawaban_id`, `soaljawaban_selected`, `soaljawaban_order`, `soaljawaban_position`) VALUES
(32, 621, 1, 4, NULL),
(32, 622, 0, 1, NULL),
(32, 623, 0, 2, NULL),
(32, 624, 0, 3, NULL),
(32, 625, 0, 5, NULL),
(33, 191, 1, 5, NULL),
(33, 192, 0, 1, NULL),
(33, 193, 0, 4, NULL),
(33, 194, 0, 3, NULL),
(33, 195, 0, 2, NULL),
(34, 206, 1, 3, NULL),
(34, 207, 0, 5, NULL),
(34, 208, 0, 1, NULL),
(34, 209, 0, 2, NULL),
(34, 210, 0, 4, NULL),
(35, 201, 1, 1, NULL),
(35, 202, 0, 4, NULL),
(35, 203, 0, 5, NULL),
(35, 204, 0, 2, NULL),
(35, 205, 0, 3, NULL),
(37, 196, 1, 3, NULL),
(37, 197, 0, 5, NULL),
(37, 198, 0, 2, NULL),
(37, 199, 0, 1, NULL),
(37, 200, 0, 4, NULL),
(39, 186, 1, 1, NULL),
(39, 187, 0, 4, NULL),
(39, 188, 0, 3, NULL),
(39, 189, 0, 5, NULL),
(39, 190, 0, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tes_token`
--

CREATE TABLE IF NOT EXISTS `cbt_tes_token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token_isi` varchar(20) NOT NULL,
  `token_user_id` int(11) NOT NULL,
  `token_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_aktif` int(11) NOT NULL DEFAULT '1' COMMENT 'Umur Token dalam menit, 1 = 1 hari penuh',
  PRIMARY KEY (`token_id`),
  KEY `token_user_id` (`token_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tes_topik_set`
--

CREATE TABLE IF NOT EXISTS `cbt_tes_topik_set` (
  `tset_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tset_tes_id` bigint(20) unsigned NOT NULL,
  `tset_topik_id` bigint(20) unsigned NOT NULL,
  `tset_tipe` smallint(6) NOT NULL DEFAULT '1',
  `tset_difficulty` smallint(6) NOT NULL DEFAULT '1',
  `tset_jumlah` smallint(6) NOT NULL DEFAULT '1',
  `tset_jawaban` smallint(6) NOT NULL DEFAULT '0',
  `tset_acak_jawaban` int(11) NOT NULL DEFAULT '1',
  `tset_acak_soal` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tset_id`),
  KEY `p_tsubset_test_id` (`tset_tes_id`),
  KEY `tsubset_subject_id` (`tset_topik_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cbt_tes_topik_set`
--

INSERT INTO `cbt_tes_topik_set` (`tset_id`, `tset_tes_id`, `tset_topik_id`, `tset_tipe`, `tset_difficulty`, `tset_jumlah`, `tset_jawaban`, `tset_acak_jawaban`, `tset_acak_soal`) VALUES
(3, 2, 7, 0, 1, 10, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tes_user`
--

CREATE TABLE IF NOT EXISTS `cbt_tes_user` (
  `tesuser_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tesuser_tes_id` bigint(20) unsigned NOT NULL,
  `tesuser_user_id` bigint(20) unsigned NOT NULL,
  `tesuser_status` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tesuser_creation_time` datetime NOT NULL,
  `tesuser_comment` text COLLATE utf8_unicode_ci,
  `tesuser_token` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tesuser_id`),
  UNIQUE KEY `ak_testuser` (`tesuser_tes_id`,`tesuser_user_id`,`tesuser_status`),
  KEY `p_testuser_user_id` (`tesuser_user_id`),
  KEY `p_testuser_test_id` (`tesuser_tes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cbt_tes_user`
--

INSERT INTO `cbt_tes_user` (`tesuser_id`, `tesuser_tes_id`, `tesuser_user_id`, `tesuser_status`, `tesuser_creation_time`, `tesuser_comment`, `tesuser_token`) VALUES
(4, 2, 1, 4, '2018-11-15 07:32:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_tesgrup`
--

CREATE TABLE IF NOT EXISTS `cbt_tesgrup` (
  `tstgrp_tes_id` bigint(20) unsigned NOT NULL,
  `tstgrp_grup_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`tstgrp_tes_id`,`tstgrp_grup_id`),
  KEY `p_tstgrp_test_id` (`tstgrp_tes_id`),
  KEY `p_tstgrp_group_id` (`tstgrp_grup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cbt_tesgrup`
--

INSERT INTO `cbt_tesgrup` (`tstgrp_tes_id`, `tstgrp_grup_id`) VALUES
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_topik`
--

CREATE TABLE IF NOT EXISTS `cbt_topik` (
  `topik_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `topik_modul_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `topik_nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `topik_detail` text COLLATE utf8_unicode_ci,
  `topik_aktif` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topik_id`),
  UNIQUE KEY `ak_subject_name` (`topik_modul_id`,`topik_nama`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `cbt_topik`
--

INSERT INTO `cbt_topik` (`topik_id`, `topik_modul_id`, `topik_nama`, `topik_detail`, `topik_aktif`) VALUES
(7, 9, 'Soal Uji Coba', 'Kumpulan Soal untuk Uji Coba ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_user`
--

CREATE TABLE IF NOT EXISTS `cbt_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_grup_id` bigint(20) unsigned NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_birthplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_level` smallint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_user_name` (`user_name`),
  KEY `user_groups_id` (`user_grup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cbt_user`
--

INSERT INTO `cbt_user` (`user_id`, `user_grup_id`, `user_name`, `user_password`, `user_email`, `user_regdate`, `user_ip`, `user_firstname`, `user_birthdate`, `user_birthplace`, `user_level`) VALUES
(1, 5, 'lutfi', 'lutfi', '', '2018-01-11 04:38:27', NULL, 'Muhammad Lutfial Hakim', NULL, NULL, 1),
(2, 5, 'joko', 'joko', '', '2018-08-11 03:49:25', NULL, 'Joko Susanto', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cbt_user_grup`
--

CREATE TABLE IF NOT EXISTS `cbt_user_grup` (
  `grup_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `grup_nama` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`grup_id`),
  UNIQUE KEY `group_name` (`grup_nama`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cbt_user_grup`
--

INSERT INTO `cbt_user_grup` (`grup_id`, `grup_nama`) VALUES
(5, 'XI MM');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `opsi1` varchar(75) NOT NULL,
  `opsi2` varchar(75) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  `level` varchar(50) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `opsi1`, `opsi2`, `keterangan`, `level`, `ts`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Achmad Lutfi', 'testing', '', '', 'admin', '2015-07-29 18:12:03'),
(4, 'operator', 'fe96dd39756ac41b74283a9292652d366d73931f', 'Operator', '', '', 'Operator', 'operator-soal', '2018-03-30 12:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_akses`
--

CREATE TABLE IF NOT EXISTS `user_akses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(75) NOT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `add` int(2) NOT NULL DEFAULT '1' COMMENT '0=false, 1=true',
  `edit` int(2) NOT NULL DEFAULT '1' COMMENT '0=false, 1=true',
  PRIMARY KEY (`id`),
  KEY `akses_kode_menu` (`kode_menu`),
  KEY `akses_level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=413 ;

--
-- Dumping data for table `user_akses`
--

INSERT INTO `user_akses` (`id`, `level`, `kode_menu`, `add`, `edit`) VALUES
(254, 'operator-soal', 'modul-daftar', 1, 1),
(255, 'operator-soal', 'modul-filemanager', 1, 1),
(256, 'operator-soal', 'modul-import', 1, 1),
(257, 'operator-soal', 'modul-soal', 1, 1),
(258, 'operator-soal', 'modul-topik', 1, 1),
(259, 'operator-tes', 'tes-hasil-operator', 1, 1),
(260, 'operator-tes', 'tes-token', 1, 1),
(394, 'admin', 'tool-backup', 1, 1),
(395, 'admin', 'peserta-group', 1, 1),
(396, 'admin', 'peserta-daftar', 1, 1),
(397, 'admin', 'modul-daftar', 1, 1),
(398, 'admin', 'tes-daftar', 1, 1),
(399, 'admin', 'tes-evaluasi', 1, 1),
(400, 'admin', 'modul-filemanager', 1, 1),
(401, 'admin', 'tes-hasil', 1, 1),
(402, 'admin', 'tes-hasil-operator', 1, 1),
(403, 'admin', 'peserta-import', 1, 1),
(404, 'admin', 'modul-import', 1, 1),
(405, 'admin', 'user_level', 1, 1),
(406, 'admin', 'user_menu', 1, 1),
(407, 'admin', 'user_atur', 1, 1),
(408, 'admin', 'tes-rekap', 1, 1),
(409, 'admin', 'modul-soal', 1, 1),
(410, 'admin', 'tes-tambah', 1, 1),
(411, 'admin', 'tes-token', 1, 1),
(412, 'admin', 'modul-topik', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE IF NOT EXISTS `user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`id`, `level`, `keterangan`) VALUES
(1, 'admin', 'Administrator'),
(7, 'operator-soal', 'Operator Soal'),
(8, 'operator-tes', 'Operator Tes');

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE IF NOT EXISTS `user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `log` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE IF NOT EXISTS `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe` int(11) NOT NULL DEFAULT '1' COMMENT '0=parent, 1=child',
  `parent` varchar(50) DEFAULT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `url` varchar(150) NOT NULL DEFAULT '#',
  `icon` varchar(75) NOT NULL DEFAULT 'fa fa-circle-o',
  `urutan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode_menu` (`kode_menu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `tipe`, `parent`, `kode_menu`, `nama_menu`, `url`, `icon`, `urutan`) VALUES
(1, 0, '', 'user', 'Pengaturan', '#', 'fa fa-user', 20),
(3, 1, 'user', 'user_atur', 'Pengaturan User', 'manager/useratur', 'fa fa-circle-o', 5),
(4, 1, 'user', 'user_level', 'Pengaturan Level', 'manager/userlevel', 'fa fa-circle-o', 6),
(5, 1, 'user', 'user_menu', 'Pengaturan Menu', 'manager/usermenu', 'fa fa-circle-o', 7),
(6, 0, '', 'modul', 'Data Modul', '#', 'fa fa-book', 2),
(7, 1, 'modul', 'modul-daftar', 'Daftar Soal', 'manager/modul_daftar', 'fa fa-circle-o', 5),
(8, 1, 'modul', 'modul-topik', 'Topik', 'manager/modul_topik', 'fa fa-circle-o', 2),
(10, 0, '', 'peserta', 'Data Peserta', '#', 'fa fa-users', 1),
(11, 1, 'peserta', 'peserta-daftar', 'Daftar Peserta', 'manager/peserta_daftar', 'fa fa-circle-o', 2),
(12, 1, 'peserta', 'peserta-group', 'Daftar Group', 'manager/peserta_group', 'fa fa-circle-o', 1),
(13, 1, 'peserta', 'peserta-import', 'Import Data Peserta', 'manager/peserta_import', 'fa fa-circle-o', 3),
(14, 0, '', 'tes', 'Data Tes', '#', 'fa fa-tasks', 7),
(15, 1, 'tes', 'tes-tambah', 'Tambah Tes', 'manager/tes_tambah', 'fa fa-circle-o', 1),
(16, 1, 'tes', 'tes-daftar', 'Daftar Tes', 'manager/tes_daftar', 'fa fa-circle-o', 2),
(17, 1, 'tes', 'tes-hasil', 'Hasil Tes', 'manager/tes_hasil', 'fa fa-circle-o', 6),
(18, 1, 'modul', 'modul-soal', 'Soal', 'manager/modul_soal', 'fa fa-circle-o', 3),
(19, 1, 'tes', 'tes-token', 'Token', 'manager/tes_token', 'fa fa-circle-o', 8),
(20, 1, 'modul', 'modul-modul', 'Modul', 'manager/modul', 'fa fa-circle-o', 1),
(22, 1, 'modul', 'modul-filemanager', 'File Manager', 'manager/modul_filemanager', 'fa fa-circle-o', 6),
(24, 1, 'modul', 'modul-import', 'Import Soal', 'manager/modul_import', 'fa fa-circle-o', 4),
(25, 1, 'tes', 'tes-evaluasi', 'Evaluasi Tes', 'manager/tes_evaluasi', 'fa fa-circle-o', 5),
(28, 1, 'tes', 'tes-hasil-operator', 'Hasil Tes Operator', 'manager/tes_hasil_operator', 'fa fa-circle-o', 10),
(30, 0, '', 'tool', 'Tool', '#', 'fa fa-wrench', 5),
(31, 1, 'tool', 'tool-backup', 'Backup Data', 'manager/tool_backup', 'fa fa-database', 1),
(32, 1, 'tes', 'tes-rekap', 'Rekap Hasil Tes', 'manager/tes_rekap_hasil', 'fa fa-circle-o', 7);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cbt_jawaban`
--
ALTER TABLE `cbt_jawaban`
  ADD CONSTRAINT `cbt_jawaban_ibfk_1` FOREIGN KEY (`jawaban_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_soal`
--
ALTER TABLE `cbt_soal`
  ADD CONSTRAINT `cbt_soal_ibfk_1` FOREIGN KEY (`soal_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_tes_soal`
--
ALTER TABLE `cbt_tes_soal`
  ADD CONSTRAINT `cbt_tes_soal_ibfk_1` FOREIGN KEY (`tessoal_tesuser_id`) REFERENCES `cbt_tes_user` (`tesuser_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tes_soal_ibfk_2` FOREIGN KEY (`tessoal_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_tes_soal_jawaban`
--
ALTER TABLE `cbt_tes_soal_jawaban`
  ADD CONSTRAINT `cbt_tes_soal_jawaban_ibfk_1` FOREIGN KEY (`soaljawaban_tessoal_id`) REFERENCES `cbt_tes_soal` (`tessoal_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tes_soal_jawaban_ibfk_2` FOREIGN KEY (`soaljawaban_jawaban_id`) REFERENCES `cbt_jawaban` (`jawaban_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_tes_token`
--
ALTER TABLE `cbt_tes_token`
  ADD CONSTRAINT `cbt_tes_token_ibfk_1` FOREIGN KEY (`token_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cbt_tes_topik_set`
--
ALTER TABLE `cbt_tes_topik_set`
  ADD CONSTRAINT `cbt_tes_topik_set_ibfk_1` FOREIGN KEY (`tset_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tes_topik_set_ibfk_2` FOREIGN KEY (`tset_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_tes_user`
--
ALTER TABLE `cbt_tes_user`
  ADD CONSTRAINT `cbt_tes_user_ibfk_1` FOREIGN KEY (`tesuser_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cbt_tes_user_ibfk_2` FOREIGN KEY (`tesuser_user_id`) REFERENCES `cbt_user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_tesgrup`
--
ALTER TABLE `cbt_tesgrup`
  ADD CONSTRAINT `cbt_tesgrup_ibfk_1` FOREIGN KEY (`tstgrp_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tesgrup_ibfk_2` FOREIGN KEY (`tstgrp_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_topik`
--
ALTER TABLE `cbt_topik`
  ADD CONSTRAINT `cbt_topik_ibfk_1` FOREIGN KEY (`topik_modul_id`) REFERENCES `cbt_modul` (`modul_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cbt_user`
--
ALTER TABLE `cbt_user`
  ADD CONSTRAINT `cbt_user_ibfk_1` FOREIGN KEY (`user_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_akses`
--
ALTER TABLE `user_akses`
  ADD CONSTRAINT `user_akses_ibfk_2` FOREIGN KEY (`kode_menu`) REFERENCES `user_menu` (`kode_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_akses_ibfk_3` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
