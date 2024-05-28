/*
 Navicat Premium Data Transfer

 Source Server         : 靶场1.117
 Source Server Type    : MySQL
 Source Server Version : 50724 (5.7.24-0ubuntu0.16.04.1-log)
 Source Host           : 172.0.0.100:3306
 Source Schema         : newmerger

 Target Server Type    : MySQL
 Target Server Version : 50724 (5.7.24-0ubuntu0.16.04.1-log)
 File Encoding         : 65001

 Date: 28/05/2024 16:13:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for drill_monitor_model
-- ----------------------------
DROP TABLE IF EXISTS `drill_monitor_model`;
CREATE TABLE `drill_monitor_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drill_id` varchar(50) NOT NULL COMMENT '任务ID',
  `monitor_models` varchar(200) DEFAULT NULL COMMENT '设备名称',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与设备绑定表';

SET FOREIGN_KEY_CHECKS = 1;
