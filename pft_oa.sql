/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : pft_oa

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-09-29 21:14:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_department
-- ----------------------------
DROP TABLE IF EXISTS `bs_department`;
CREATE TABLE `bs_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `departmentno` varchar(40) DEFAULT NULL COMMENT '部门编码',
  `departmentname` varchar(50) NOT NULL COMMENT '部门名称',
  `departmentalias` varchar(50) NOT NULL COMMENT '部门别名',
  `remark` varchar(200) DEFAULT NULL COMMENT '部门描述',
  `fixed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固有部门',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orgid` (`departmentno`,`departmentname`,`fixed`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门定义表';

-- ----------------------------
-- Records of bs_department
-- ----------------------------
INSERT INTO `bs_department` VALUES ('1', '1', '1', '2017-09-15 17:30:53', '1', '2017-09-15 17:30:56', 'technology', '技术部', '技术部', null, '1');
INSERT INTO `bs_department` VALUES ('2', '1', '1', '2017-09-15 17:30:53', '1', '2017-09-15 17:30:56', 'operation', '运维部', '运维部', '', '1');
INSERT INTO `bs_department` VALUES ('3', '1', '1', '2017-09-15 17:30:53', '1', '2017-09-15 17:30:56', 'market', '市场部', '市场部', '', '1');
INSERT INTO `bs_department` VALUES ('4', '1', '1', '2017-09-15 17:30:53', '1', '2017-09-15 17:30:56', 'manager', '管理层', '管理层', '', '1');
INSERT INTO `bs_department` VALUES ('5', '1', '1', '2017-09-15 17:30:53', '1', '2017-09-15 17:30:56', 'personnel', '人事部', '人事部', '', '1');
INSERT INTO `bs_department` VALUES ('6', '1506516231993', '1', '2017-09-27 20:43:52', '1', '2017-09-27 20:56:12', 'test', 'test', 'test', 'testsss', '1');

-- ----------------------------
-- Table structure for bs_departmentpermission
-- ----------------------------
DROP TABLE IF EXISTS `bs_departmentpermission`;
CREATE TABLE `bs_departmentpermission` (
  `departmentid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `permission` varchar(40) NOT NULL COMMENT '权限项',
  `url` varchar(30) NOT NULL COMMENT '请求路径',
  UNIQUE KEY `departmentid` (`departmentid`,`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门授权';

-- ----------------------------
-- Records of bs_departmentpermission
-- ----------------------------
INSERT INTO `bs_departmentpermission` VALUES ('5', 'user.create', '/oa/user/user/create.do');
INSERT INTO `bs_departmentpermission` VALUES ('5', 'user.query', '/oa/user/user/query.do');

-- ----------------------------
-- Table structure for bs_permission
-- ----------------------------
DROP TABLE IF EXISTS `bs_permission`;
CREATE TABLE `bs_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `permission` varchar(40) NOT NULL COMMENT '权限项',
  `name` varchar(40) NOT NULL COMMENT '名称',
  `alias` varchar(40) NOT NULL COMMENT '别名',
  `remark` varchar(200) DEFAULT NULL COMMENT '描述',
  `url` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`permission`,`name`,`url`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='权限项(子系统)';

-- ----------------------------
-- Records of bs_permission
-- ----------------------------
INSERT INTO `bs_permission` VALUES ('1', '1505131964000', '1', '2017-09-11 20:12:44', '1', '2017-09-28 14:26:47', 'user.create', '新建用户', '新建用户', 'ss', '/oa/user/user/create.do');
INSERT INTO `bs_permission` VALUES ('2', '1505132149000', '1', '2017-09-11 20:15:49', '1', '2017-09-11 20:15:49', 'user.query', '查询用户', '查询用户', '', '/oa/user/user/query.do');
INSERT INTO `bs_permission` VALUES ('3', '1505132225000', '1', '2017-09-11 20:17:05', '1', '2017-09-21 11:50:02', 'user.update', '更改用户', '更改用户ss', '', '/oa/user/user/update.do');
INSERT INTO `bs_permission` VALUES ('4', '1505132242000', '1', '2017-09-11 20:17:22', '1', '2017-09-22 13:18:39', 'user.delete', '删除用户', '删除用户', 'ssssssss', '/oa/user/user/delete.do');
INSERT INTO `bs_permission` VALUES ('5', '1505132242000', '1', '2017-09-11 20:17:22', '1', '2017-09-11 20:17:22', 'user.edit', '编辑用户', '编辑用户', '', '/oa/user/user/edit.do');
INSERT INTO `bs_permission` VALUES ('6', '1505132242000', '1', '2017-09-11 20:17:22', '1', '2017-09-11 20:17:22', 'user.insert', '插入用户', '插入用户', '', '/oa/user/user/insert.do');

-- ----------------------------
-- Table structure for bs_role
-- ----------------------------
DROP TABLE IF EXISTS `bs_role`;
CREATE TABLE `bs_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `rolecode` varchar(40) DEFAULT NULL COMMENT '角色编码',
  `rolename` varchar(50) NOT NULL COMMENT '角色名称',
  `rolealias` varchar(50) NOT NULL COMMENT '角色别名',
  `remark` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `fixed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固有角色',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orgid` (`rolecode`,`rolename`,`fixed`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='角色定义表';

-- ----------------------------
-- Records of bs_role
-- ----------------------------
INSERT INTO `bs_role` VALUES ('1', '1', '1', '2017-09-15 15:43:32', '1', '2017-09-19 11:00:25', 'charge', '部门主管', '部门主管', '部门主管', '1');
INSERT INTO `bs_role` VALUES ('2', '12', '1', '2017-09-15 15:43:32', '1', '2017-09-20 19:52:23', 'normal', '普通员工', '普通员工', 'ssssss', '1');
INSERT INTO `bs_role` VALUES ('3', '1', '1', '2017-09-15 15:43:32', '1', '2017-09-19 11:00:25', 'group', '小组组长', '小组组长', '', '1');
INSERT INTO `bs_role` VALUES ('4', '1', '1', '2017-09-15 15:43:32', '1', '2017-09-19 11:00:25', 'manager', '总经理', '总经理', '', '1');
INSERT INTO `bs_role` VALUES ('6', '1505794864438', '1', '2017-09-19 12:21:04', '1', '2017-09-22 13:19:17', 'test', 'test', 'test', 'tss', '0');
INSERT INTO `bs_role` VALUES ('23', '1505909013882', '1', '2017-09-20 20:03:34', '1', '2017-09-22 14:46:37', 'www', 'qwe', 'we', 'sss', '1');
INSERT INTO `bs_role` VALUES ('31', '1505911827279', '1', '2017-09-20 20:50:27', '1', '2017-09-22 14:46:32', 'qwess', 'qwe', 'qwe', 'qwesssssssss', '0');
INSERT INTO `bs_role` VALUES ('32', '1505912334113', '1', '2017-09-20 20:58:54', '1', '2017-09-22 14:46:28', 'sadss', 'wqe', 'qw', 'qwessssss', '1');
INSERT INTO `bs_role` VALUES ('33', '1505999546702', '1', '2017-09-21 21:12:27', '1', '2017-09-22 14:25:58', 'tes', 's', 's', 'sssswsss', '0');

-- ----------------------------
-- Table structure for bs_rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `bs_rolepermission`;
CREATE TABLE `bs_rolepermission` (
  `roleid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `permission` varchar(40) NOT NULL COMMENT '权限项',
  `url` varchar(30) NOT NULL COMMENT '请求路径',
  UNIQUE KEY `roleid` (`roleid`,`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色授权';

-- ----------------------------
-- Records of bs_rolepermission
-- ----------------------------
INSERT INTO `bs_rolepermission` VALUES ('1', 'user.create', '/oa/user/user/create.do');
INSERT INTO `bs_rolepermission` VALUES ('1', 'user.edit', '/oa/user/user/edit.do');
INSERT INTO `bs_rolepermission` VALUES ('1', 'user.query', '/oa/user/user/query.do');
INSERT INTO `bs_rolepermission` VALUES ('1', 'user.update', '/oa/user/user/update.do');
INSERT INTO `bs_rolepermission` VALUES ('2', 'user.edit', '/oa/user/user/edit.do');
INSERT INTO `bs_rolepermission` VALUES ('2', 'user.query', '/oa/user/user/query.do');
INSERT INTO `bs_rolepermission` VALUES ('2', 'user.update', '/oa/user/user/update.do');
INSERT INTO `bs_rolepermission` VALUES ('6', 'test', 'test');
INSERT INTO `bs_rolepermission` VALUES ('6', 'user.create', '/oa/user/user/create.do');
INSERT INTO `bs_rolepermission` VALUES ('6', 'user.delete', '/oa/user/user/delete.do');
INSERT INTO `bs_rolepermission` VALUES ('6', 'user.edit', '/oa/user/user/edit.do');
INSERT INTO `bs_rolepermission` VALUES ('6', 'user.insert', '/oa/user/user/insert.do');
INSERT INTO `bs_rolepermission` VALUES ('6', 'user.query', '/oa/user/user/query.do');
INSERT INTO `bs_rolepermission` VALUES ('6', 'user.update', '/oa/user/user/update.do');

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `userno` varchar(50) NOT NULL COMMENT '工号',
  `sex` char(1) NOT NULL DEFAULT 'N' COMMENT '性别',
  `pwd` varchar(128) DEFAULT NULL COMMENT '密码',
  `addr` varchar(100) DEFAULT NULL COMMENT '地址',
  `phoneno` varchar(30) DEFAULT NULL COMMENT '电话',
  `mobileno` varchar(30) DEFAULT NULL COMMENT '手机号',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `suspended` tinyint(4) NOT NULL DEFAULT '0' COMMENT '停职标志',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标志',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `wxuserid` varchar(40) DEFAULT NULL COMMENT '微信用户ID',
  `otuserid` varchar(40) DEFAULT NULL COMMENT '备用用户ID',
  `reserve1` varchar(40) DEFAULT NULL COMMENT '备用1',
  `reserve2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `reserve3` varchar(40) DEFAULT NULL COMMENT '备用3',
  `externid` varchar(40) DEFAULT NULL COMMENT '外部id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userno` (`username`,`userno`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='员工表 ';

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('1', '1505094886000', '1', '2017-09-11 09:54:46', '1', '2017-09-15 13:31:24', '超级管理员', 'admin', '1', '123', 'ssd', '', '13333333333', '@163.com', '0', '0', '', null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('3', '1505122739730', '1', '2017-09-11 17:39:00', '1', '2017-09-15 14:31:06', 'jw', 'jw', '1', '123', '153', null, '13333333333', '11', '0', '0', '13', 'JiangWei', null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('6', '1505391465198', '4', '2017-09-14 20:17:45', '3', '2017-09-15 16:16:48', '韩祖贻', 'hzy', '1', '123', '杭州西湖区', null, '12222222222', '@qq.com', '0', '0', '', null, null, null, null, null, null);
INSERT INTO `bs_user` VALUES ('8', '1505454714884', '1', '2017-09-15 13:51:55', '1', '2017-09-15 13:57:49', 'hz', 'hz', '1', '123', '12', null, '12', '12', '0', '0', '12', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for bs_userdepartment
-- ----------------------------
DROP TABLE IF EXISTS `bs_userdepartment`;
CREATE TABLE `bs_userdepartment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `departmentid` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='员工部门表';

-- ----------------------------
-- Records of bs_userdepartment
-- ----------------------------
INSERT INTO `bs_userdepartment` VALUES ('1', '1505635270807', '1', '2017-09-17 16:01:11', '1', '2017-09-17 16:01:11', '1', '1');

-- ----------------------------
-- Table structure for bs_userrole
-- ----------------------------
DROP TABLE IF EXISTS `bs_userrole`;
CREATE TABLE `bs_userrole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `userid` bigint(20) NOT NULL COMMENT '员工ID',
  `roleid` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`,`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='员工角色表';

-- ----------------------------
-- Records of bs_userrole
-- ----------------------------
INSERT INTO `bs_userrole` VALUES ('1', '1505635259462', '1', '2017-09-17 16:00:59', '1', '2017-09-17 16:00:59', '1', '1');

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('1', '测试', 'sfasgfaf', '24');
INSERT INTO `user_t` VALUES ('3', 'test', 'test', '1');
INSERT INTO `user_t` VALUES ('6', 'test', 'test', '1');

-- ----------------------------
-- Table structure for wx_binduser
-- ----------------------------
DROP TABLE IF EXISTS `wx_binduser`;
CREATE TABLE `wx_binduser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `rowstamp` bigint(20) NOT NULL COMMENT '时间戳',
  `createuser` bigint(20) NOT NULL COMMENT '创建人',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `modifyuser` bigint(20) NOT NULL COMMENT '最后修改人',
  `modifytime` datetime NOT NULL COMMENT '最后修改时间',
  `userid` bigint(20) NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '姓名',
  `userno` varchar(50) NOT NULL COMMENT '登录编码',
  `wxuserid` varchar(40) NOT NULL COMMENT '微信用户ID',
  `deviceid` varchar(40) DEFAULT NULL COMMENT '微信设备ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wxbind` (`userno`,`wxuserid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='微信用户绑定信息表';

-- ----------------------------
-- Records of wx_binduser
-- ----------------------------
INSERT INTO `wx_binduser` VALUES ('11', '1505457066287', '1', '2017-09-15 14:31:06', '1', '2017-09-15 14:31:06', '3', 'jw', 'jw', 'JiangWei', '');
