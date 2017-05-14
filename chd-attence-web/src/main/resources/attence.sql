/*
Navicat MySQL Data Transfer

Source Server         : 119.29.184.87
Source Server Version : 50636
Source Host           : 119.29.184.87:3306
Source Database       : attence

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-05-14 18:30:41
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
  `class_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('1', '信息工程学院', '通信工程', '2013', '2013240402', '2017-04-23 22:27:56', '2017-04-18 22:28:00');
INSERT INTO `class_info` VALUES ('2', '信息工程学院', '通信工程', '2013', '2013240401', '2017-04-23 22:28:03', '2017-05-08 19:57:56');
INSERT INTO `class_info` VALUES ('3', '信息工程学院', '通信工程', '2012', '2012240401', '2017-05-08 19:58:20', '2017-05-08 19:58:20');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `teacher` varchar(20) DEFAULT NULL,
  `teacher_id` bigint(30) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '信号与系统', '罗向龙', '9', '2017-04-15 22:11:13', '2017-04-16 13:54:39');
INSERT INTO `course` VALUES ('2', '传感器原理', '杨俊', '12', '2017-04-16 13:48:08', '2017-04-16 13:54:50');
INSERT INTO `course` VALUES ('3', '交通控制', '罗向龙', '9', '2017-04-16 13:48:42', '2017-04-16 13:54:57');
INSERT INTO `course` VALUES ('4', '现代交换原理', '刘若辰', '11', '2017-04-16 13:49:15', '2017-04-16 13:55:10');
INSERT INTO `course` VALUES ('5', '自动化控制', '杨阳', '10', '2017-04-16 13:49:47', '2017-04-16 13:55:22');
INSERT INTO `course` VALUES ('6', 'C++程序设计', '何立敏', '17', '2017-04-17 00:22:24', '2017-05-08 11:15:23');

-- ----------------------------
-- Table structure for course_class
-- ----------------------------
DROP TABLE IF EXISTS `course_class`;
CREATE TABLE `course_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` bigint(30) DEFAULT NULL,
  `course_id` bigint(30) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_class
-- ----------------------------
INSERT INTO `course_class` VALUES ('1', '2013240401', '1', '2017-04-16 14:16:21', '2017-04-16 14:16:23');
INSERT INTO `course_class` VALUES ('2', '2013240401', '2', '2017-05-08 10:41:10', '2017-05-08 10:41:13');
INSERT INTO `course_class` VALUES ('3', '2013240401', '3', '2017-05-08 10:41:16', '2017-05-08 10:41:19');
INSERT INTO `course_class` VALUES ('4', '2013240401', '4', '2017-05-08 10:41:22', '2017-05-08 10:41:24');
INSERT INTO `course_class` VALUES ('5', '2013240401', '5', '2017-05-08 10:41:27', '2017-05-08 10:41:29');
INSERT INTO `course_class` VALUES ('6', '2013240402', '1', '2017-05-08 10:41:32', '2017-05-08 10:41:34');
INSERT INTO `course_class` VALUES ('7', '2013240402', '2', '2017-04-16 14:16:25', '2017-04-16 14:16:28');
INSERT INTO `course_class` VALUES ('8', '2013240402', '3', '2017-05-08 10:41:36', '2017-05-08 10:41:44');
INSERT INTO `course_class` VALUES ('9', '2013240402', '4', '2017-05-08 10:41:39', '2017-05-08 10:41:46');
INSERT INTO `course_class` VALUES ('10', '2013240402', '6', '2017-05-08 10:41:42', '2017-05-08 10:41:48');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` bigint(30) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `academy` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `class_id` bigint(30) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `mac_address` varchar(100) DEFAULT NULL,
  `voice` varchar(100) DEFAULT '' COMMENT '声纹密码id',
  PRIMARY KEY (`id`,`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201324040212', '42', '伍龙涛', '信息工程学院', '通信工程', '2013240402', '2013', '1', '2017-04-16 13:56:05', '2017-05-14 17:39:45', '9c:c1:72:ca:23:5a', '8c7556e901b9af09adec97ba5ed2f0cd');
INSERT INTO `student` VALUES ('201324040213', '43', '田博', '信息工程学院', '通信工程', '2013240402', '2013', '1', '2017-04-16 13:57:50', '2017-05-10 17:18:03', '9c:c1:72:ca:23:5a', '');
INSERT INTO `student` VALUES ('201324040112', '44', '黄宝宁', '信息工程学院', '通信工程', '2013240401', '2013', '1', '2017-04-16 13:59:03', '2017-04-16 13:59:03', null, '');
INSERT INTO `student` VALUES ('201324040209', '45', '桂耀刚', '信息工程学院', '通信工程', '2013240402', '2013', '1', '2017-04-16 14:05:42', '2017-05-14 18:25:08', '14:5F:94:37:29:1E', '1186ff4c263dc30cb9447042274fec75');
INSERT INTO `student` VALUES ('201324040101', '46', '郝程序', '信息工程学院', '通信工程', '2013240401', '2013', '1', '2017-04-16 14:06:25', '2017-05-08 16:30:16', '', '');

-- ----------------------------
-- Table structure for student_attence
-- ----------------------------
DROP TABLE IF EXISTS `student_attence`;
CREATE TABLE `student_attence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '声纹密码id',
  `name` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `student_id` bigint(30) DEFAULT NULL,
  `gps` varchar(200) DEFAULT NULL,
  `course_id` bigint(30) DEFAULT NULL,
  `wifi_top5` varchar(200) DEFAULT NULL,
  `teacher_attence_id` int(20) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT '' COMMENT '异常备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_attence
-- ----------------------------
INSERT INTO `student_attence` VALUES ('188', '伍龙涛', '3', '201324040212', null, '1', null, '80', '2017-05-08 16:24:04', '2017-05-08 16:28:38', '');
INSERT INTO `student_attence` VALUES ('189', '田博', '3', '201324040213', null, '1', null, '80', '2017-05-08 16:24:04', '2017-05-08 16:28:38', '');
INSERT INTO `student_attence` VALUES ('190', '桂耀刚', '3', '201324040209', null, '1', null, '80', '2017-05-08 16:24:04', '2017-05-08 16:28:38', '');
INSERT INTO `student_attence` VALUES ('191', '黄宝宁', '3', '201324040112', null, '3', null, '81', '2017-05-08 16:29:41', '2017-05-09 14:22:04', '');
INSERT INTO `student_attence` VALUES ('192', '郝程序', '3', '201324040101', null, '3', null, '81', '2017-05-08 16:29:41', '2017-05-09 14:22:04', '');
INSERT INTO `student_attence` VALUES ('193', '伍龙涛', '3', '201324040212', null, '6', null, '82', '2017-05-09 14:25:49', '2017-05-10 12:20:36', '');
INSERT INTO `student_attence` VALUES ('194', '田博', '3', '201324040213', null, '6', null, '82', '2017-05-09 14:25:49', '2017-05-09 14:25:59', '');
INSERT INTO `student_attence` VALUES ('195', '桂耀刚', '3', '201324040209', null, '6', null, '82', '2017-05-09 14:25:49', '2017-05-09 14:25:59', '');
INSERT INTO `student_attence` VALUES ('196', '伍龙涛', '2', '201324040212', null, '3', null, '83', '2017-05-09 23:06:55', '2017-05-09 23:12:04', '');
INSERT INTO `student_attence` VALUES ('197', '田博', '3', '201324040213', null, '3', null, '83', '2017-05-09 23:06:55', '2017-05-09 23:08:22', null);
INSERT INTO `student_attence` VALUES ('198', '桂耀刚', '3', '201324040209', null, '3', null, '83', '2017-05-09 23:06:55', '2017-05-09 23:08:22', null);
INSERT INTO `student_attence` VALUES ('199', '伍龙涛', '3', '201324040212', null, '1', null, '84', '2017-05-09 23:09:00', '2017-05-10 12:14:24', '');
INSERT INTO `student_attence` VALUES ('200', '田博', '3', '201324040213', null, '1', null, '84', '2017-05-09 23:09:00', '2017-05-09 23:10:47', null);
INSERT INTO `student_attence` VALUES ('201', '桂耀刚', '3', '201324040209', null, '1', null, '84', '2017-05-09 23:09:00', '2017-05-09 23:10:47', null);
INSERT INTO `student_attence` VALUES ('202', '黄宝宁', '3', '201324040112', null, '3', null, '85', '2017-05-09 23:13:06', '2017-05-10 15:35:00', null);
INSERT INTO `student_attence` VALUES ('203', '郝程序', '3', '201324040101', null, '3', null, '85', '2017-05-09 23:13:06', '2017-05-10 15:35:00', null);
INSERT INTO `student_attence` VALUES ('204', '黄宝宁', '3', '201324040112', null, '3', null, '86', '2017-05-10 13:59:00', '2017-05-10 13:59:10', null);
INSERT INTO `student_attence` VALUES ('205', '郝程序', '3', '201324040101', null, '3', null, '86', '2017-05-10 13:59:00', '2017-05-10 13:59:10', null);
INSERT INTO `student_attence` VALUES ('206', '伍龙涛', '3', '201324040212', null, '1', null, '87', '2017-05-10 13:59:22', '2017-05-10 14:00:56', null);
INSERT INTO `student_attence` VALUES ('207', '田博', '3', '201324040213', null, '1', null, '87', '2017-05-10 13:59:22', '2017-05-10 14:00:56', null);
INSERT INTO `student_attence` VALUES ('208', '桂耀刚', '3', '201324040209', null, '1', null, '87', '2017-05-10 13:59:22', '2017-05-10 14:00:56', null);
INSERT INTO `student_attence` VALUES ('209', '伍龙涛', '3', '201324040212', null, '3', null, '88', '2017-05-10 14:01:13', '2017-05-10 14:03:55', null);
INSERT INTO `student_attence` VALUES ('210', '田博', '3', '201324040213', null, '3', null, '88', '2017-05-10 14:01:13', '2017-05-10 14:03:55', null);
INSERT INTO `student_attence` VALUES ('211', '桂耀刚', '2', '201324040209', null, '3', null, '88', '2017-05-10 14:01:13', '2017-05-10 16:09:29', '好的');
INSERT INTO `student_attence` VALUES ('212', '伍龙涛', '1', '201324040212', null, '4', null, '89', '2017-05-10 14:07:01', '2017-05-10 14:07:01', null);
INSERT INTO `student_attence` VALUES ('213', '田博', '1', '201324040213', null, '4', null, '89', '2017-05-10 14:07:01', '2017-05-10 14:07:01', null);
INSERT INTO `student_attence` VALUES ('214', '桂耀刚', '1', '201324040209', null, '4', null, '89', '2017-05-10 14:07:01', '2017-05-10 14:07:01', null);
INSERT INTO `student_attence` VALUES ('215', '伍龙涛', '2', '201324040212', null, '3', null, '90', '2017-05-10 15:35:31', '2017-05-10 15:45:39', null);
INSERT INTO `student_attence` VALUES ('216', '田博', '3', '201324040213', null, '3', null, '90', '2017-05-10 15:35:31', '2017-05-10 16:10:44', null);
INSERT INTO `student_attence` VALUES ('217', '桂耀刚', '2', '201324040209', null, '3', null, '90', '2017-05-10 15:35:31', '2017-05-10 16:11:40', '这');
INSERT INTO `student_attence` VALUES ('218', '伍龙涛', '2', '201324040212', null, '3', null, '91', '2017-05-10 15:54:48', '2017-05-10 16:05:43', null);
INSERT INTO `student_attence` VALUES ('219', '田博', '3', '201324040213', null, '3', null, '91', '2017-05-10 15:54:48', '2017-05-10 16:10:35', null);
INSERT INTO `student_attence` VALUES ('220', '桂耀刚', '2', '201324040209', null, '3', null, '91', '2017-05-10 15:54:48', '2017-05-10 16:07:13', null);
INSERT INTO `student_attence` VALUES ('221', '伍龙涛', '3', '201324040212', null, '3', null, '92', '2017-05-10 18:34:29', '2017-05-10 18:34:47', null);
INSERT INTO `student_attence` VALUES ('222', '田博', '2', '201324040213', null, '3', null, '92', '2017-05-10 18:34:29', '2017-05-10 18:40:41', '公司');
INSERT INTO `student_attence` VALUES ('223', '桂耀刚', '3', '201324040209', null, '3', null, '92', '2017-05-10 18:34:29', '2017-05-10 18:34:47', null);
INSERT INTO `student_attence` VALUES ('224', '黄宝宁', '1', '201324040112', null, '4', null, '93', '2017-05-10 21:37:56', '2017-05-10 21:37:56', null);
INSERT INTO `student_attence` VALUES ('225', '郝程序', '1', '201324040101', null, '4', null, '93', '2017-05-10 21:37:56', '2017-05-10 21:37:56', null);
INSERT INTO `student_attence` VALUES ('226', '黄宝宁', '3', '201324040112', null, '4', null, '94', '2017-05-10 21:42:34', '2017-05-10 22:11:10', null);
INSERT INTO `student_attence` VALUES ('227', '郝程序', '3', '201324040101', null, '4', null, '94', '2017-05-10 21:42:34', '2017-05-10 22:11:10', null);
INSERT INTO `student_attence` VALUES ('228', '伍龙涛', '3', '201324040212', null, '2', null, '95', '2017-05-10 21:48:50', '2017-05-10 22:05:24', null);
INSERT INTO `student_attence` VALUES ('229', '田博', '3', '201324040213', null, '2', null, '95', '2017-05-10 21:48:50', '2017-05-11 00:17:01', '理由');
INSERT INTO `student_attence` VALUES ('230', '桂耀刚', '3', '201324040209', null, '2', null, '95', '2017-05-10 21:48:50', '2017-05-10 22:05:24', null);
INSERT INTO `student_attence` VALUES ('231', '黄宝宁', '3', '201324040112', null, '2', null, '96', '2017-05-11 16:19:31', '2017-05-11 16:20:48', null);
INSERT INTO `student_attence` VALUES ('232', '郝程序', '3', '201324040101', null, '2', null, '96', '2017-05-11 16:19:31', '2017-05-11 16:20:48', null);
INSERT INTO `student_attence` VALUES ('233', '伍龙涛', '3', '201324040212', null, '2', null, '97', '2017-05-11 16:21:09', '2017-05-11 16:29:58', null);
INSERT INTO `student_attence` VALUES ('234', '田博', '3', '201324040213', null, '2', null, '97', '2017-05-11 16:21:09', '2017-05-11 16:29:58', null);
INSERT INTO `student_attence` VALUES ('235', '桂耀刚', '3', '201324040209', null, '2', null, '97', '2017-05-11 16:21:09', '2017-05-11 16:29:58', null);
INSERT INTO `student_attence` VALUES ('236', '黄宝宁', '3', '201324040112', null, '5', null, '98', '2017-05-11 16:31:40', '2017-05-11 16:39:36', null);
INSERT INTO `student_attence` VALUES ('237', '郝程序', '3', '201324040101', null, '5', null, '98', '2017-05-11 16:31:40', '2017-05-11 16:39:36', null);
INSERT INTO `student_attence` VALUES ('238', '黄宝宁', '3', '201324040112', null, '1', null, '99', '2017-05-11 16:41:43', '2017-05-11 16:42:16', null);
INSERT INTO `student_attence` VALUES ('239', '郝程序', '3', '201324040101', null, '1', null, '99', '2017-05-11 16:41:43', '2017-05-11 16:42:16', null);
INSERT INTO `student_attence` VALUES ('240', '黄宝宁', '3', '201324040112', null, '3', null, '100', '2017-05-11 16:42:25', '2017-05-11 18:43:39', null);
INSERT INTO `student_attence` VALUES ('241', '郝程序', '3', '201324040101', null, '3', null, '100', '2017-05-11 16:42:25', '2017-05-11 18:43:39', null);
INSERT INTO `student_attence` VALUES ('242', '黄宝宁', '1', '201324040112', null, '5', null, '101', '2017-05-11 16:43:34', '2017-05-11 16:43:34', null);
INSERT INTO `student_attence` VALUES ('243', '郝程序', '1', '201324040101', null, '5', null, '101', '2017-05-11 16:43:34', '2017-05-11 16:43:34', null);
INSERT INTO `student_attence` VALUES ('244', '黄宝宁', '1', '201324040112', null, '5', null, '102', '2017-05-11 16:43:39', '2017-05-11 16:43:39', null);
INSERT INTO `student_attence` VALUES ('245', '郝程序', '1', '201324040101', null, '5', null, '102', '2017-05-11 16:43:39', '2017-05-11 16:43:39', null);
INSERT INTO `student_attence` VALUES ('246', '黄宝宁', '1', '201324040112', null, '5', null, '103', '2017-05-11 16:43:43', '2017-05-11 16:43:43', null);
INSERT INTO `student_attence` VALUES ('247', '郝程序', '1', '201324040101', null, '5', null, '103', '2017-05-11 16:43:43', '2017-05-11 16:43:43', null);
INSERT INTO `student_attence` VALUES ('248', '黄宝宁', '3', '201324040112', null, '5', null, '104', '2017-05-11 16:47:33', '2017-05-11 16:52:04', null);
INSERT INTO `student_attence` VALUES ('249', '郝程序', '3', '201324040101', null, '5', null, '104', '2017-05-11 16:47:33', '2017-05-11 16:52:04', null);
INSERT INTO `student_attence` VALUES ('250', '黄宝宁', '1', '201324040112', null, '5', null, '105', '2017-05-11 16:52:10', '2017-05-11 16:52:10', null);
INSERT INTO `student_attence` VALUES ('251', '郝程序', '1', '201324040101', null, '5', null, '105', '2017-05-11 16:52:10', '2017-05-11 16:52:10', null);
INSERT INTO `student_attence` VALUES ('252', '黄宝宁', '3', '201324040112', null, '3', null, '106', '2017-05-11 18:43:46', '2017-05-11 18:44:13', null);
INSERT INTO `student_attence` VALUES ('253', '郝程序', '3', '201324040101', null, '3', null, '106', '2017-05-11 18:43:46', '2017-05-11 18:44:13', null);
INSERT INTO `student_attence` VALUES ('254', '伍龙涛', '3', '201324040212', null, '1', null, '107', '2017-05-11 18:44:24', '2017-05-11 18:44:29', null);
INSERT INTO `student_attence` VALUES ('255', '田博', '3', '201324040213', null, '1', null, '107', '2017-05-11 18:44:24', '2017-05-11 18:44:29', null);
INSERT INTO `student_attence` VALUES ('256', '桂耀刚', '3', '201324040209', null, '1', null, '107', '2017-05-11 18:44:24', '2017-05-11 18:44:29', null);
INSERT INTO `student_attence` VALUES ('257', '伍龙涛', '3', '201324040212', null, '1', null, '108', '2017-05-11 18:44:57', '2017-05-11 18:45:03', null);
INSERT INTO `student_attence` VALUES ('258', '田博', '3', '201324040213', null, '1', null, '108', '2017-05-11 18:44:57', '2017-05-11 18:45:03', null);
INSERT INTO `student_attence` VALUES ('259', '桂耀刚', '3', '201324040209', null, '1', null, '108', '2017-05-11 18:44:57', '2017-05-11 18:45:03', null);
INSERT INTO `student_attence` VALUES ('260', '伍龙涛', '1', '201324040212', null, '1', null, '109', '2017-05-11 22:17:52', '2017-05-11 22:17:52', null);
INSERT INTO `student_attence` VALUES ('261', '田博', '1', '201324040213', null, '1', null, '109', '2017-05-11 22:17:52', '2017-05-11 22:17:52', null);
INSERT INTO `student_attence` VALUES ('262', '桂耀刚', '1', '201324040209', null, '1', null, '109', '2017-05-11 22:17:52', '2017-05-11 22:17:52', null);
INSERT INTO `student_attence` VALUES ('263', '伍龙涛', '2', '201324040212', null, '1', null, '110', '2017-05-11 23:00:28', '2017-05-12 15:29:31', '吃饭了');
INSERT INTO `student_attence` VALUES ('264', '田博', '3', '201324040213', null, '1', null, '110', '2017-05-11 23:00:28', '2017-05-11 23:00:46', null);
INSERT INTO `student_attence` VALUES ('265', '桂耀刚', '3', '201324040209', null, '1', null, '110', '2017-05-11 23:00:28', '2017-05-11 23:00:46', null);
INSERT INTO `student_attence` VALUES ('266', '黄宝宁', '3', '201324040112', null, '1', null, '111', '2017-05-12 09:37:39', '2017-05-12 09:38:48', null);
INSERT INTO `student_attence` VALUES ('267', '郝程序', '3', '201324040101', null, '1', null, '111', '2017-05-12 09:37:39', '2017-05-12 09:38:48', null);
INSERT INTO `student_attence` VALUES ('268', '伍龙涛', '1', '201324040212', null, '3', null, '112', '2017-05-12 09:38:58', '2017-05-12 09:38:58', null);
INSERT INTO `student_attence` VALUES ('269', '田博', '2', '201324040213', null, '3', null, '112', '2017-05-12 09:38:58', '2017-05-12 10:47:41', null);
INSERT INTO `student_attence` VALUES ('270', '桂耀刚', '2', '201324040209', null, '3', null, '112', '2017-05-12 09:38:58', '2017-05-12 11:07:58', null);
INSERT INTO `student_attence` VALUES ('271', '黄宝宁', '2', '201324040112', null, '1', null, '113', '2017-05-12 15:23:15', '2017-05-12 15:36:26', '迟到了');
INSERT INTO `student_attence` VALUES ('272', '郝程序', '2', '201324040101', null, '1', null, '113', '2017-05-12 15:23:15', '2017-05-12 15:24:11', null);
INSERT INTO `student_attence` VALUES ('273', '黄宝宁', '3', '201324040112', null, '3', null, '114', '2017-05-12 15:25:12', '2017-05-12 15:26:01', null);
INSERT INTO `student_attence` VALUES ('274', '郝程序', '3', '201324040101', null, '3', null, '114', '2017-05-12 15:25:12', '2017-05-12 15:26:01', null);
INSERT INTO `student_attence` VALUES ('275', '伍龙涛', '1', '201324040212', null, '1', null, '115', '2017-05-12 15:56:05', '2017-05-12 15:56:05', null);
INSERT INTO `student_attence` VALUES ('276', '田博', '1', '201324040213', null, '1', null, '115', '2017-05-12 15:56:05', '2017-05-12 15:56:05', null);
INSERT INTO `student_attence` VALUES ('277', '桂耀刚', '1', '201324040209', null, '1', null, '115', '2017-05-12 15:56:05', '2017-05-12 15:56:05', null);
INSERT INTO `student_attence` VALUES ('278', '伍龙涛', '3', '201324040212', null, '1', null, '116', '2017-05-12 15:59:55', '2017-05-12 16:07:25', null);
INSERT INTO `student_attence` VALUES ('279', '田博', '3', '201324040213', null, '1', null, '116', '2017-05-12 15:59:55', '2017-05-12 16:07:25', null);
INSERT INTO `student_attence` VALUES ('280', '桂耀刚', '3', '201324040209', null, '1', null, '116', '2017-05-12 15:59:55', '2017-05-12 16:07:25', null);
INSERT INTO `student_attence` VALUES ('281', '伍龙涛', '3', '201324040212', null, '1', null, '117', '2017-05-12 16:10:41', '2017-05-12 16:10:45', null);
INSERT INTO `student_attence` VALUES ('282', '田博', '3', '201324040213', null, '1', null, '117', '2017-05-12 16:10:41', '2017-05-12 16:10:45', null);
INSERT INTO `student_attence` VALUES ('283', '桂耀刚', '3', '201324040209', null, '1', null, '117', '2017-05-12 16:10:41', '2017-05-12 16:10:45', null);

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
  `teacher_id` bigint(30) DEFAULT NULL COMMENT '教师工号',
  `mac_address` varchar(100) DEFAULT '' COMMENT '教师手机mac地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('9', '罗向龙', '信息工程学院', '1', '2017-04-16 13:52:38', '2017-05-12 15:23:03', '9', '9c:c1:72:ca:23:5a');
INSERT INTO `teacher` VALUES ('10', '杨阳', '信息工程学院', '1', '2017-04-16 13:53:09', '2017-04-16 13:53:09', '10', '');
INSERT INTO `teacher` VALUES ('11', '刘若辰', '信息工程学院', '1', '2017-04-16 13:53:23', '2017-05-12 14:52:26', '11', '9c:c1:72:ca:23:5a');
INSERT INTO `teacher` VALUES ('12', '杨俊', '信息工程学院', '1', '2017-04-16 13:53:36', '2017-04-16 13:54:02', '12', '');
INSERT INTO `teacher` VALUES ('14', '吴潜蛟', '信息工程学院', '1', '2017-05-08 11:08:07', '2017-05-08 11:11:18', '15', '');
INSERT INTO `teacher` VALUES ('15', '何立敏', '信息工程学院', '1', '2017-05-08 11:15:07', '2017-05-08 11:15:07', '17', '');

-- ----------------------------
-- Table structure for teacher_attence
-- ----------------------------
DROP TABLE IF EXISTS `teacher_attence`;
CREATE TABLE `teacher_attence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT NULL,
  `course_id` bigint(30) DEFAULT NULL,
  `gps` varchar(20) DEFAULT NULL,
  `class_id` varchar(50) DEFAULT NULL,
  `teacher_name` varchar(20) DEFAULT NULL,
  `teacher_id` bigint(30) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `wifi_name` varchar(20) DEFAULT NULL,
  `wifi_pwd` varchar(20) DEFAULT NULL COMMENT 'wifi密码',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_attence
-- ----------------------------
INSERT INTO `teacher_attence` VALUES ('80', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-08 16:24:04', '2017-05-08 16:28:38', 'HBVH', '79444813', '2017-05-08 16:24:04', '2017-05-08 16:28:38');
INSERT INTO `teacher_attence` VALUES ('81', '2', '3', null, '2013240401', '罗向龙', '9', '2017-05-08 16:29:41', '2017-05-09 14:22:04', 'NYJB', '12018123', '2017-05-08 16:29:41', '2017-05-09 14:22:04');
INSERT INTO `teacher_attence` VALUES ('82', '2', '6', null, '2013240402', '何立敏', '17', '2017-05-09 14:25:49', '2017-05-09 14:25:59', 'YANC', '46584111', '2017-05-09 14:25:49', '2017-05-09 14:25:59');
INSERT INTO `teacher_attence` VALUES ('83', '2', '3', null, '2013240402', '罗向龙', '9', '2017-05-09 23:06:55', '2017-05-09 23:08:22', 'HKTK', '59841424', '2017-05-09 23:06:55', '2017-05-09 23:08:22');
INSERT INTO `teacher_attence` VALUES ('84', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-09 23:09:00', '2017-05-09 23:10:47', 'GPXB', '59304524', '2017-05-09 23:09:00', '2017-05-09 23:10:47');
INSERT INTO `teacher_attence` VALUES ('85', '2', '3', null, '2013240401', '罗向龙', '9', '2017-05-09 23:13:06', '2017-05-10 15:35:00', 'LMYJ', '33468724', '2017-05-09 23:13:06', '2017-05-10 15:35:00');
INSERT INTO `teacher_attence` VALUES ('86', '2', '3', null, '2013240401', '罗向龙', '9', '2017-05-10 13:59:00', '2017-05-10 13:59:10', 'GMJF', '14793959', '2017-05-10 13:59:00', '2017-05-10 13:59:10');
INSERT INTO `teacher_attence` VALUES ('87', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-10 13:59:22', '2017-05-10 14:00:56', 'ZKZZ', '11126959', '2017-05-10 13:59:22', '2017-05-10 14:00:56');
INSERT INTO `teacher_attence` VALUES ('88', '2', '3', null, '2013240402', '罗向龙', '9', '2017-05-10 14:01:13', '2017-05-10 14:03:55', 'QJPG', '05827069', '2017-05-10 14:01:13', '2017-05-10 14:03:55');
INSERT INTO `teacher_attence` VALUES ('89', '1', '4', null, '2013240402', '刘若辰', '11', '2017-05-10 14:07:01', null, 'WAZN', '78802469', '2017-05-10 14:07:01', '2017-05-10 14:07:01');
INSERT INTO `teacher_attence` VALUES ('90', '2', '3', null, '2013240402', '罗向龙', '9', '2017-05-10 15:35:31', '2017-05-12 09:35:15', 'OKXC', '33503710', '2017-05-10 15:35:31', '2017-05-12 09:35:15');
INSERT INTO `teacher_attence` VALUES ('91', '2', '3', null, '2013240402', '罗向龙', '9', '2017-05-10 15:54:48', '2017-05-10 16:10:35', 'YBMN', '88088820', '2017-05-10 15:54:48', '2017-05-10 16:10:35');
INSERT INTO `teacher_attence` VALUES ('92', '2', '3', null, '2013240402', '罗向龙', '9', '2017-05-10 18:34:28', '2017-05-10 18:34:47', 'RUTH', '04386421', '2017-05-10 18:34:28', '2017-05-10 18:34:47');
INSERT INTO `teacher_attence` VALUES ('93', '1', '4', null, '2013240401', '刘若辰', '11', '2017-05-10 21:37:56', null, 'KUMC', '36857432', '2017-05-10 21:37:56', '2017-05-10 21:37:56');
INSERT INTO `teacher_attence` VALUES ('94', '2', '4', null, '2013240401', '刘若辰', '11', '2017-05-10 21:42:34', '2017-05-10 22:11:10', 'TORY', '03935732', '2017-05-10 21:42:34', '2017-05-10 22:11:10');
INSERT INTO `teacher_attence` VALUES ('95', '2', '2', null, '2013240402', '杨俊', '12', '2017-05-10 21:48:50', '2017-05-10 22:05:24', 'SASV', '74892142', '2017-05-10 21:48:50', '2017-05-10 22:05:24');
INSERT INTO `teacher_attence` VALUES ('96', '2', '2', null, '2013240401', '杨俊', '12', '2017-05-11 16:19:30', '2017-05-11 16:20:48', 'IAYL', '58407709', '2017-05-11 16:19:30', '2017-05-11 16:20:48');
INSERT INTO `teacher_attence` VALUES ('97', '2', '2', null, '2013240402', '杨俊', '12', '2017-05-11 16:21:09', '2017-05-11 16:29:58', 'WLNB', '70786809', '2017-05-11 16:21:09', '2017-05-11 16:29:58');
INSERT INTO `teacher_attence` VALUES ('98', '2', '5', null, '2013240401', '杨阳', '10', '2017-05-11 16:31:40', '2017-05-11 16:39:36', 'JBSX', '07000519', '2017-05-11 16:31:40', '2017-05-11 16:39:36');
INSERT INTO `teacher_attence` VALUES ('99', '2', '1', null, '2013240401', '罗向龙', '9', '2017-05-11 16:41:43', '2017-05-11 16:42:16', 'JSWR', '60330129', '2017-05-11 16:41:43', '2017-05-11 16:42:16');
INSERT INTO `teacher_attence` VALUES ('100', '2', '3', null, '2013240401', '罗向龙', '9', '2017-05-11 16:42:25', '2017-05-11 18:43:39', 'JLBI', '53454129', '2017-05-11 16:42:25', '2017-05-11 18:43:39');
INSERT INTO `teacher_attence` VALUES ('101', '1', '5', null, '2013240401', '杨阳', '10', '2017-05-11 16:43:34', null, 'QWMC', '01341229', '2017-05-11 16:43:34', '2017-05-11 16:43:34');
INSERT INTO `teacher_attence` VALUES ('102', '1', '5', null, '2013240401', '杨阳', '10', '2017-05-11 16:43:39', null, 'KVSG', '32391229', '2017-05-11 16:43:39', '2017-05-11 16:43:39');
INSERT INTO `teacher_attence` VALUES ('103', '1', '5', null, '2013240401', '杨阳', '10', '2017-05-11 16:43:43', null, 'QHFQ', '77522229', '2017-05-11 16:43:43', '2017-05-11 16:43:43');
INSERT INTO `teacher_attence` VALUES ('104', '2', '5', null, '2013240401', '杨阳', '10', '2017-05-11 16:47:33', '2017-05-11 16:52:04', 'EFHC', '06825429', '2017-05-11 16:47:33', '2017-05-11 16:52:04');
INSERT INTO `teacher_attence` VALUES ('105', '1', '5', null, '2013240401', '杨阳', '10', '2017-05-11 16:52:10', null, 'YVNF', '16403729', '2017-05-11 16:52:10', '2017-05-11 16:52:10');
INSERT INTO `teacher_attence` VALUES ('106', '2', '3', null, '2013240401', '罗向龙', '9', '2017-05-11 18:43:46', '2017-05-11 18:44:13', 'OEIA', '97262499', '2017-05-11 18:43:46', '2017-05-11 18:44:13');
INSERT INTO `teacher_attence` VALUES ('107', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-11 18:44:24', '2017-05-11 18:44:29', 'CHFS', '62146499', '2017-05-11 18:44:24', '2017-05-11 18:44:29');
INSERT INTO `teacher_attence` VALUES ('108', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-11 18:44:56', '2017-05-11 18:45:03', 'FQXQ', '85469499', '2017-05-11 18:44:56', '2017-05-11 18:45:03');
INSERT INTO `teacher_attence` VALUES ('109', '1', '1', null, '2013240402', '罗向龙', '9', '2017-05-11 22:17:52', null, 'JZVW', '99327221', '2017-05-11 22:17:52', '2017-05-11 22:17:52');
INSERT INTO `teacher_attence` VALUES ('110', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-11 23:00:28', '2017-05-11 23:00:46', 'JEZW', '25572841', '2017-05-11 23:00:28', '2017-05-11 23:00:46');
INSERT INTO `teacher_attence` VALUES ('111', '2', '1', null, '2013240401', '罗向龙', '9', '2017-05-12 09:37:39', '2017-05-12 09:38:48', 'ZROC', '61685035', '2017-05-12 09:37:39', '2017-05-12 09:38:48');
INSERT INTO `teacher_attence` VALUES ('112', '1', '3', null, '2013240402', '罗向龙', '9', '2017-05-12 09:38:58', null, 'GHAU', '02773135', '2017-05-12 09:38:58', '2017-05-12 09:38:58');
INSERT INTO `teacher_attence` VALUES ('113', '2', '1', null, '2013240401', '罗向龙', '9', '2017-05-12 15:23:15', '2017-05-12 15:24:33', 'CAPF', '86949737', '2017-05-12 15:23:15', '2017-05-12 15:24:33');
INSERT INTO `teacher_attence` VALUES ('114', '2', '3', null, '2013240401', '罗向龙', '9', '2017-05-12 15:25:12', '2017-05-12 15:26:01', 'SKNY', '36511937', '2017-05-12 15:25:12', '2017-05-12 15:26:01');
INSERT INTO `teacher_attence` VALUES ('115', '1', '1', null, '2013240402', '罗向龙', '9', '2017-05-12 15:56:05', null, 'FCAP', '28846757', '2017-05-12 15:56:05', '2017-05-12 15:56:05');
INSERT INTO `teacher_attence` VALUES ('116', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-12 15:59:55', '2017-05-12 16:07:25', 'GJIF', '23749957', '2017-05-12 15:59:55', '2017-05-12 16:07:25');
INSERT INTO `teacher_attence` VALUES ('117', '2', '1', null, '2013240402', '罗向龙', '9', '2017-05-12 16:10:41', '2017-05-12 16:10:45', 'AEDQ', '84604667', '2017-05-12 16:10:41', '2017-05-12 16:10:45');

-- ----------------------------
-- Table structure for teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE `teacher_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(30) DEFAULT NULL,
  `class_id` bigint(30) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_class
-- ----------------------------
INSERT INTO `teacher_class` VALUES ('1', '9', '2013240402', '2017-05-08 10:43:15', '2017-05-08 10:43:17');
INSERT INTO `teacher_class` VALUES ('2', '10', '2013240402', '2017-05-08 10:43:47', '2017-05-08 10:43:49');
INSERT INTO `teacher_class` VALUES ('3', '11', '2013240402', '2017-05-08 10:43:52', '2017-05-08 10:43:54');
INSERT INTO `teacher_class` VALUES ('4', '12', '2013240402', '2017-05-08 10:43:57', '2017-05-08 10:43:59');
INSERT INTO `teacher_class` VALUES ('5', '9', '2013240401', '2017-05-08 10:44:02', '2017-05-08 10:44:05');
INSERT INTO `teacher_class` VALUES ('6', '10', '2013240401', '2017-05-08 10:44:07', '2017-05-08 10:44:10');
INSERT INTO `teacher_class` VALUES ('7', '11', '2013240401', '2017-05-08 10:44:12', '2017-05-08 10:44:15');
INSERT INTO `teacher_class` VALUES ('8', '12', '2013240401', '2017-05-08 10:44:17', '2017-05-08 10:44:19');
