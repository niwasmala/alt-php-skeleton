/*
Navicat MariaDB Data Transfer

Source Server         : localhost
Source Server Version : 100110
Source Host           : localhost:3306
Source Database       : alt-php

Target Server Type    : MariaDB
Target Server Version : 100110
File Encoding         : 65001

Date: 2016-09-28 17:21:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `field` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `modifeduser` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_session
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `userid` int(11) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `usergroupid` int(11) NOT NULL DEFAULT '0',
  `isenabled` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `sys_usergroup`;
CREATE TABLE `sys_usergroup` (
  `usergroupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(3) NOT NULL DEFAULT '1',
  `isdisplayed` int(1) NOT NULL DEFAULT '1',
  `isallowregistration` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`usergroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sys_userrole
-- ----------------------------
DROP TABLE IF EXISTS `sys_userrole`;
CREATE TABLE `sys_userrole` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `entrytime` datetime DEFAULT NULL,
  `entryuser` varchar(50) DEFAULT NULL,
  `modifiedtime` datetime DEFAULT NULL,
  `modifieduser` varchar(50) DEFAULT NULL,
  `deletedtime` datetime DEFAULT NULL,
  `deleteduser` varchar(50) DEFAULT NULL,
  `isdeleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- View structure for view_sys_user
-- ----------------------------
DROP VIEW IF EXISTS `view_sys_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sys_user` AS select `u`.`userid` AS `userid`,`u`.`username` AS `username`,`u`.`password` AS `password`,`u`.`name` AS `name`,`u`.`email` AS `email`,`u`.`address` AS `address`,`u`.`phone` AS `phone`,`u`.`usergroupid` AS `usergroupid`,`u`.`isenabled` AS `isenabled`,`ug`.`name` AS `usergroupname`,`ug`.`description` AS `usergroupdescription`,`ug`.`isdisplayed` AS `isdisplayed`,`ug`.`isallowregistration` AS `isallowregistration`,`ug`.`level` AS `userlevel`,`r`.`roleid` AS `roleid`,`r`.`name` AS `rolename`,`r`.`level` AS `rolelevel`,`r`.`description` AS `roledescription`,`ur`.`projectid` AS `projectid` from (((`sys_user` `u` left join `sys_usergroup` `ug` on((`u`.`usergroupid` = `ug`.`usergroupid`))) left join `sys_userrole` `ur` on(((`u`.`userid` = `ur`.`userid`) and (`ur`.`isdeleted` = 0)))) left join `sys_role` `r` on((`ur`.`roleid` = `r`.`roleid`))) ;

-- ----------------------------
-- View structure for view_sys_userrole
-- ----------------------------
DROP VIEW IF EXISTS `view_sys_userrole`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_sys_userrole` AS select `ur`.`userid` AS `userid`,`ur`.`roleid` AS `roleid`,`ur`.`projectid` AS `projectid`,`ur`.`entrytime` AS `entrytime`,`ur`.`entryuser` AS `entryuser`,`ur`.`modifiedtime` AS `modifiedtime`,`ur`.`modifieduser` AS `modifieduser`,`ur`.`deletedtime` AS `deletedtime`,`ur`.`deleteduser` AS `deleteduser`,`ur`.`isdeleted` AS `isdeleted`,`u`.`name` AS `username`,`r`.`description` AS `roledescription`,`r`.`level` AS `rolelevel` from ((`sys_userrole` `ur` left join `sys_user` `u` on((`ur`.`userid` = `u`.`userid`))) left join `sys_role` `r` on((`ur`.`roleid` = `r`.`roleid`))) ;
SET FOREIGN_KEY_CHECKS=1;
