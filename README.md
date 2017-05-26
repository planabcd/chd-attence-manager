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


