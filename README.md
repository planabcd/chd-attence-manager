###长安大学点名系统说明文档
2017/5/25 9:41:50 

####概述
	长安大学点名系统由APP客户端和服务端以及后台运营端构成。
	其中APP客户端基于Android开发
	APP服务端和APP运营端基于JAVA Web开发
	由于未做浏览器兼容，在360浏览器上APP运营端界面展示有问题
	建议使用火狐浏览器测试运营端
	客户端目前测试过的机型有华为荣耀6，华为P10，小米4，红米note
- APP客户端
	- 开发软件
		- JDK，建议1.7版本
		- AndroidStudio,建议2.0以上
		- AndroidSDK
		- Genymotion android模拟器
	
	- 基础知识
		- JAVA基础（多线程是重点）
		- Android基础（Activity生命周期，广播等）
		- 集成开放SDK（讯飞声纹识别，极光推送，百度地图）

- APP服务端
	- 开发软件
		- JDK
		- Idea2017.1
		- MySQL 5.4
		- Navicat Premium
		- SecureCRT
		- Tomcat
	- 基础知识
		- JAVA基础
		- Maven
		- Spring（这个框架很重要，可以多了解）
		- MyBatis
		- SQL

- APP运营端
	- 开发软件
		- 同APP服务端
	- 基础知识
		- Html，CSS，JavaScript
		- BootStrap，EasyUI（前端框架）

- 其他
	- 开发软件
		- GitBash，Git
		- PhotoShop，切图
		- EdrawMax，画流程图
		- Search Everything，windows搜索文件插件
		- Sublime Text3，文本编辑器
		- 火狐浏览器
	- 基础知识
		- Git基础（版本控制，利于协同开发）
		- HTTP协议，网络传输基础（重点）
		- 多线程原理（重点）
		- Linux基础（熟悉常用指令，用于部署应用）


####软件流程

	APP客户端发送请求到服务端，服务端操作数据(运营端录入的数据)处理完毕，返回给客户端渲染。

####业务逻辑
- 教师端点名流程图

![](http://i.imgur.com/jzmJfAz.png)

----------

- 学生端点名流程图

![](http://i.imgur.com/sUXCzgJ.png)

----------

- 声纹注册流程

![](http://i.imgur.com/qTU8cE1.png)

----------

- 绑定Mac地址流程

![](http://i.imgur.com/9uXIXE7.png)

----------

####数据库设计
- 服务端和运营端数据模型图

![](http://i.imgur.com/BmzkPsr.png)

####服务端SQL(包括初始数据)
	/*
	Navicat MySQL Data Transfer
	
	Source Server         : 119.29.184.87
	Source Server Version : 50636
	Source Host           : 119.29.184.87:3306
	Source Database       : attence
	
	Target Server Type    : MYSQL
	Target Server Version : 50636
	File Encoding         : 65001
	
	Date: 2017-05-25 10:26:28
	*/
	CREATE DATABASE `attence` CHARACTER SET utf8;
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
	INSERT INTO `student` VALUES ('201324040211', '41', '廖鑫', '信息工程学院', '通信工程', '2013240402', '2013', '1', '2017-05-19 10:35:35', '2017-05-19 10:36:44', '14:5f:94:37:29:1e', '');
	INSERT INTO `student` VALUES ('201324040212', '42', '伍龙涛', '信息工程学院', '通信工程', '2013240402', '2013', '1', '2017-04-16 13:56:05', '2017-05-14 17:39:45', '9c:c1:72:ca:23:5a', '8c7556e901b9af09adec97ba5ed2f0cd');
	INSERT INTO `student` VALUES ('201324040213', '43', '田博', '信息工程学院', '通信工程', '2013240402', '2013', '1', '2017-04-16 13:57:50', '2017-05-14 18:36:26', '9c:c1:72:ca:23:5a', '0f1136577076dbf9b598910876108c39');
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
	) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
	
	
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
	INSERT INTO `teacher` VALUES ('9', '罗向龙', '信息工程学院', '1', '2017-04-16 13:52:38', '2017-05-14 18:41:35', '9', '14:5f:94:37:29:1e');
	INSERT INTO `teacher` VALUES ('10', '杨阳', '信息工程学院', '1', '2017-04-16 13:53:09', '2017-04-16 13:53:09', '10', '');
	INSERT INTO `teacher` VALUES ('11', '刘若辰', '信息工程学院', '1', '2017-04-16 13:53:23', '2017-05-12 14:52:26', '11', '9c:c1:72:ca:23:5a');
	INSERT INTO `teacher` VALUES ('12', '杨俊', '信息工程学院', '1', '2017-04-16 13:53:36', '2017-05-19 11:12:18', '12', '9c:c1:72:ca:23:5a');
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
	) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
	
	

####源码GitHub地址
- APP客户端
	- https://github.com/planabcd/ChdCallApp.git

- APP服务端
	- https://github.com/planabcd/chd-attence-manager.git


