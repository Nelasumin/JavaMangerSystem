/*
Navicat MySQL Data Transfer

Source Server         : demome
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : staff

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2020-09-23 09:21:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for demo_users
-- ----------------------------
DROP TABLE IF EXISTS `demo_users`;
CREATE TABLE `demo_users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `realname` varchar(40) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `interest` varchar(200) DEFAULT NULL,
  `degree` tinyint(4) DEFAULT NULL,
  `intro` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo_users
-- ----------------------------
INSERT INTO `demo_users` VALUES ('1', 'flm', '11', 'fulimei', '2020-03-24', '1', '健身', '1', 'sddsd');
INSERT INTO `demo_users` VALUES ('2', 'aaa', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('4', 'aaa1', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('5', 'aaa11', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('6', 'aaa111', '123', null, null, '1', null, null, null);
INSERT INTO `demo_users` VALUES ('7', 'aaa1111', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('8', 'aaa11111', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('9', 'aaa111111', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('10', 'aaa1111111', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('11', 'aaa11111111', '123', null, null, '1', null, null, null);
INSERT INTO `demo_users` VALUES ('12', 'aaa111111111', '123', null, null, '1', null, null, null);
INSERT INTO `demo_users` VALUES ('13', 'aaa1111111111', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('14', 'aaa11111111111', '123', null, null, '1', null, null, null);
INSERT INTO `demo_users` VALUES ('15', 'aaa111111111111', '123', null, null, '0', null, null, null);
INSERT INTO `demo_users` VALUES ('16', 'aaa1111111111111', '123', null, null, '1', null, null, null);
INSERT INTO `demo_users` VALUES ('17', 'flm1', '11', '111', '2020-09-21', '1', '健身,上网', '2', 'sdsd');
INSERT INTO `demo_users` VALUES ('18', 'aaaff', '11', 'rr', '2020-09-23', '1', '登山,上网', '2', 'sfdfsdfsdf');
