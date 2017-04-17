/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : chd-attence

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-04-17 23:44:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academy` varchar(40) DEFAULT NULL COMMENT '学院',
  `marjor` varchar(40) DEFAULT NULL COMMENT '专业',
  `grade` varchar(40) DEFAULT NULL COMMENT '年级',
  `class_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('1', '信息工程学院', '通信工程', '2013', '240402');
INSERT INTO `class_info` VALUES ('2', '信息工程学院', '通信工程', '2013', '240401');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '信号与系统', '罗向龙', '9', '2017-04-15 22:11:13', '2017-04-16 13:54:39');
INSERT INTO `course` VALUES ('2', '传感器原理', '杨俊', '12', '2017-04-16 13:48:08', '2017-04-16 13:54:50');
INSERT INTO `course` VALUES ('3', '交通控制', '罗向龙', '9', '2017-04-16 13:48:42', '2017-04-16 13:54:57');
INSERT INTO `course` VALUES ('4', '现代交换原理', '刘若辰', '11', '2017-04-16 13:49:15', '2017-04-16 13:55:10');
INSERT INTO `course` VALUES ('5', '自动化控制', '杨阳', '10', '2017-04-16 13:49:47', '2017-04-16 13:55:22');
INSERT INTO `course` VALUES ('6', 'C++程序设计', '何立敏', '13', '2017-04-17 00:22:24', '2017-04-17 00:22:24');

-- ----------------------------
-- Table structure for course_class
-- ----------------------------
DROP TABLE IF EXISTS `course_class`;
CREATE TABLE `course_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_class
-- ----------------------------
INSERT INTO `course_class` VALUES ('1', '240402', '1', '2017-04-16 14:16:21', '2017-04-16 14:16:23');
INSERT INTO `course_class` VALUES ('2', '240401', '2', null, null);
INSERT INTO `course_class` VALUES ('3', '240402', '3', null, null);
INSERT INTO `course_class` VALUES ('4', '240402', '4', null, null);
INSERT INTO `course_class` VALUES ('5', '240402', '5', null, null);
INSERT INTO `course_class` VALUES ('6', '240401', '1', null, null);
INSERT INTO `course_class` VALUES ('7', '240402', '2', '2017-04-16 14:16:25', '2017-04-16 14:16:28');
INSERT INTO `course_class` VALUES ('8', '240401', '3', null, null);
INSERT INTO `course_class` VALUES ('9', '240401', '4', null, null);
INSERT INTO `course_class` VALUES ('10', '240401', '5', null, null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(12) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `academy` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('212', '42', '伍龙涛', '信息工程学院', '通信工程', '240402', '2013', '1', '2017-04-16 13:56:05', '2017-04-17 00:08:02', null);
INSERT INTO `student` VALUES ('213', '43', '田博', '信息工程学院', '通信工程', '240402', '2013', '1', '2017-04-16 13:57:50', '2017-04-16 13:58:28', null);
INSERT INTO `student` VALUES ('112', '44', '黄宝宁', '信息工程学院', '通信工程', '240401', '2013', '1', '2017-04-16 13:59:03', '2017-04-16 13:59:03', null);
INSERT INTO `student` VALUES ('209', '45', '桂耀刚', '信息工程学院', '通信工程', '240402', '2013', '1', '2017-04-16 14:05:42', '2017-04-16 14:05:55', null);
INSERT INTO `student` VALUES ('101', '46', '郝程序', '信息工程学院', '通信工程', '204401', '2013', '1', '2017-04-16 14:06:25', '2017-04-17 01:39:10', null);

-- ----------------------------
-- Table structure for student_attence
-- ----------------------------
DROP TABLE IF EXISTS `student_attence`;
CREATE TABLE `student_attence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `student_id` int(30) DEFAULT NULL,
  `gps` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `wifi_top5` varchar(20) DEFAULT NULL,
  `teacher_attence_id` int(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `teacher_id` int(20) DEFAULT NULL COMMENT '教师工号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('9', '罗向龙', '信息工程学院', '1', '2017-04-16 13:52:38', '2017-04-16 13:52:38', null);
INSERT INTO `teacher` VALUES ('10', '杨阳', '信息工程学院', '1', '2017-04-16 13:53:09', '2017-04-16 13:53:09', null);
INSERT INTO `teacher` VALUES ('11', '刘若辰', '信息工程学院', '1', '2017-04-16 13:53:23', '2017-04-16 13:53:47', null);
INSERT INTO `teacher` VALUES ('12', '杨俊', '信息工程学院', '1', '2017-04-16 13:53:36', '2017-04-16 13:54:02', null);

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
  `wifi_pwd` varchar(20) DEFAULT NULL COMMENT 'wifi密码',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_attence
-- ----------------------------
INSERT INTO `teacher_attence` VALUES ('2', '1', '1', 'gps', '240402', 'lxl', '9', '2013-10-10 00:00:00', '2013-10-10 00:00:00', 'ww', null, '2017-04-17 02:11:11', '2017-04-17 02:11:11');
INSERT INTO `teacher_attence` VALUES ('3', '2', '1', 'g', '240401', 'lxl', '9', '2013-10-19 00:00:00', '2013-10-19 00:00:00', 'a', null, '2017-04-17 02:15:36', '2017-04-17 02:15:36');
INSERT INTO `teacher_attence` VALUES ('4', '1', '1', null, '240402', '罗向龙', '9', '2017-04-17 16:58:08', null, '85798886', '14924194', '2017-04-17 16:58:08', '2017-04-17 16:58:08');
INSERT INTO `teacher_attence` VALUES ('5', '1', '1', null, '240402', '罗向龙', '9', '2017-04-17 17:01:51', null, 'ZDNC', '78211791', '2017-04-17 17:01:51', '2017-04-17 17:01:51');
INSERT INTO `teacher_attence` VALUES ('6', '1', '1', null, '240402', '罗向龙', '9', '2017-04-17 17:03:39', null, 'PIKF', '56091891', '2017-04-17 17:03:39', '2017-04-17 17:03:39');
INSERT INTO `teacher_attence` VALUES ('7', '1', '1', null, '240402', '罗向龙', '9', '2017-04-17 17:05:12', null, 'BIHT', '18521991', '2017-04-17 17:05:12', '2017-04-17 17:05:12');
INSERT INTO `teacher_attence` VALUES ('8', '1', '1', null, '240402', '罗向龙', '9', '2017-04-17 17:06:05', null, 'CQDQ', '40356991', '2017-04-17 17:06:05', '2017-04-17 17:06:05');
INSERT INTO `teacher_attence` VALUES ('9', '1', '1', null, '240402', '罗向龙', '9', '2017-04-17 17:13:21', null, 'HJWL', '16310402', '2017-04-17 17:13:21', '2017-04-17 17:13:21');

-- ----------------------------
-- Table structure for teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE `teacher_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_class
-- ----------------------------
INSERT INTO `teacher_class` VALUES ('1', '9', '240402', null, null);
INSERT INTO `teacher_class` VALUES ('2', '10', '240402', null, null);
INSERT INTO `teacher_class` VALUES ('3', '11', '240402', null, null);
INSERT INTO `teacher_class` VALUES ('4', '12', '240402', null, null);
INSERT INTO `teacher_class` VALUES ('5', '9', '240401', null, null);
INSERT INTO `teacher_class` VALUES ('6', '10', '240401', null, null);
INSERT INTO `teacher_class` VALUES ('7', '11', '240401', null, null);
INSERT INTO `teacher_class` VALUES ('8', '12', '240401', null, null);
