/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : chd-attence

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-12 21:10:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `teacher` varchar(20) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for course_class
-- ----------------------------
DROP TABLE IF EXISTS `course_class`;
CREATE TABLE `course_class` (
  `class_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_class
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `academy` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for student_attence
-- ----------------------------
DROP TABLE IF EXISTS `student_attence`;
CREATE TABLE `student_attence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `gps` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `wifi_top5` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_attence
-- ----------------------------

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `academy` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_attence
-- ----------------------------
DROP TABLE IF EXISTS `teacher_attence`;
CREATE TABLE `teacher_attence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `gps` varchar(20) DEFAULT NULL,
  `class_id` varchar(50) DEFAULT NULL,
  `teacher_name` varchar(20) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `wifi_name` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_attence
-- ----------------------------

-- ----------------------------
-- Table structure for teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE `teacher_class` (
  `teacher_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_class
-- ----------------------------
