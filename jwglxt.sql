/*
SQLyog Community Edition- MySQL GUI v6.54
MySQL - 5.0.51a-community-nt : Database - jwglxt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`jwglxt` /*!40100 DEFAULT CHARACTER SET gb2312 */;

USE `jwglxt`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) default NULL,
  `shenfen` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`pwd`,`shenfen`) values (2,'111','111',NULL),(1,'admin','admin',NULL);

/*Table structure for table `banji` */

DROP TABLE IF EXISTS `banji`;

CREATE TABLE `banji` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `nianji` varchar(50) default NULL,
  `banzhuren` varchar(50) default NULL,
  `renshu` varchar(50) default NULL,
  `shuoming` text,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `banji` */

insert  into `banji`(`id`,`name`,`nianji`,`banzhuren`,`renshu`,`shuoming`) values (1,'2010年2班不','三年二班','1','52','无'),(2,'2010年3班好','三年三班','2','50','无说明');

/*Table structure for table `chengji` */

DROP TABLE IF EXISTS `chengji`;

CREATE TABLE `chengji` (
  `id` int(4) NOT NULL auto_increment,
  `xuesheng` int(4) default NULL,
  `kemu` int(4) default NULL,
  `shijian` varchar(50) default NULL,
  `fenshu` varchar(50) default NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gb2312;

/*Data for the table `chengji` */

insert  into `chengji`(`id`,`xuesheng`,`kemu`,`shijian`,`fenshu`) values (1,3,3,'2010-04-30','96'),(5,3,1,'2010-04-30','50'),(6,2,3,'2010-04-30','88'),(7,2,1,'2010-04-30','66'),(8,1,3,'2010-04-30','82'),(9,1,1,'2010-04-30','45');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) default NULL,
  `jiaoshihao` varchar(50) default NULL,
  `zhenname` varchar(50) default NULL,
  `sex` varchar(50) default NULL,
  `shengri` varchar(50) default NULL,
  `yuanxiao` varchar(50) default NULL,
  `zhuanye` varchar(50) default NULL,
  `phone` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `shenfen` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `NewIndex1` (`jiaoshihao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`name`,`pwd`,`jiaoshihao`,`zhenname`,`sex`,`shengri`,`yuanxiao`,`zhuanye`,`phone`,`address`,`email`,`shenfen`) values (1,'111','111','123456789','李四','男','2010-04-13','大连外语学院','英语','13545678912','沈阳市大东区','111@163.com','laoshi'),(2,'222','222','12345678','张三','女','2010-04-20','沈阳师范大学','地理','13545678912','北京市相辅相成区','111@163.com','laoshi');

/*Table structure for table `kecheng` */

DROP TABLE IF EXISTS `kecheng`;

CREATE TABLE `kecheng` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `jiaoshi` varchar(50) default NULL,
  `keshi` varchar(50) default NULL,
  `beizhu` text,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

/*Data for the table `kecheng` */

insert  into `kecheng`(`id`,`name`,`jiaoshi`,`keshi`,`beizhu`) values (1,'地理','2','200课时','无'),(3,'英语','1','180课时','无');

/*Table structure for table `kechengtable` */

DROP TABLE IF EXISTS `kechengtable`;

CREATE TABLE `kechengtable` (
  `id` int(4) NOT NULL auto_increment,
  `kecheng` int(4) default NULL,
  `didian` varchar(50) default NULL,
  `xingqi` varchar(50) default NULL,
  `shangxiawu` varchar(50) default NULL,
  `kejie` varchar(50) default NULL,
  `beizhu` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

/*Data for the table `kechengtable` */

insert  into `kechengtable`(`id`,`kecheng`,`didian`,`xingqi`,`shangxiawu`,`kejie`,`beizhu`) values (1,3,'大教室1','星期三','下午','第一节课','无'),(3,3,'大教室2','星期五','上午','第三节课','无'),(4,1,'大教室1','星期二','上午','第一节课','无'),(5,1,'大教室2','星期四','下午','第一节课','无');

/*Table structure for table `taoke` */

DROP TABLE IF EXISTS `taoke`;

CREATE TABLE `taoke` (
  `id` int(4) NOT NULL auto_increment,
  `xuesheng` int(4) default NULL,
  `dates` varchar(50) default NULL,
  `yuanyin` text,
  `pingyu` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

/*Data for the table `taoke` */

insert  into `taoke`(`id`,`xuesheng`,`dates`,`yuanyin`,`pingyu`) values (2,3,'2010-04-30','无','无'),(3,2,'2010-04-30','无','无');

/*Table structure for table `xuanke` */

DROP TABLE IF EXISTS `xuanke`;

CREATE TABLE `xuanke` (
  `id` int(4) NOT NULL auto_increment,
  `xuesheng` int(4) NOT NULL,
  `kecheng` int(4) NOT NULL,
  PRIMARY KEY  (`xuesheng`,`kecheng`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

/*Data for the table `xuanke` */

insert  into `xuanke`(`id`,`xuesheng`,`kecheng`) values (7,1,3);

/*Table structure for table `xuesheng` */

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pwd` varchar(50) default NULL,
  `banji` varchar(50) default NULL COMMENT '班级',
  `xuehao` varchar(50) default NULL COMMENT '学号',
  `zhiwu` varchar(50) default NULL COMMENT '职务',
  `zhenname` varchar(50) default NULL COMMENT '姓名',
  `sex` varchar(50) default NULL COMMENT '性别',
  `shengri` varchar(50) default NULL COMMENT '出生日期',
  `zuohao` varchar(50) default NULL COMMENT '座号',
  `shenfenzheng` varchar(50) default NULL COMMENT '身份证号',
  `minzu` varchar(50) default NULL COMMENT '民族',
  `jiguan` varchar(50) default NULL COMMENT '籍贯',
  `hukou` varchar(100) default NULL COMMENT '户口所在地',
  `address` varchar(100) default NULL COMMENT '家庭住址',
  `phone` varchar(50) default NULL COMMENT '联系电话',
  `email` varchar(100) default NULL COMMENT '电子邮箱',
  `beizhu` text COMMENT '备注',
  `shenfen` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `NewIndex1` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

/*Data for the table `xuesheng` */

insert  into `xuesheng`(`id`,`name`,`pwd`,`banji`,`xuehao`,`zhiwu`,`zhenname`,`sex`,`shengri`,`zuohao`,`shenfenzheng`,`minzu`,`jiguan`,`hukou`,`address`,`phone`,`email`,`beizhu`,`shenfen`) values (1,'111','111','2','123456','班长','王武','男','2005-04-13','12','123456789123456789','苗族','山东省潍坊','沈阳市大东区','北京市相辅相成区','13545678912','111@163.com','无','xuesheng'),(2,'222','222','2','123123','学习委员','朱红','女','2010-04-13','456','123456789123456789','汉族','辽宁省沈阳市','沈阳市大东区','天津市似是而非区','13812345678','111@163.com','无','xuesheng'),(3,'333','333','1','2010456','学习委员','杨柳','女','2010-04-27','12','123456789123456789','汉族','辽宁省沈阳市','沈阳市大东区','北京市相辅相成区','13545678912','111@163.com','无','xuesheng');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
