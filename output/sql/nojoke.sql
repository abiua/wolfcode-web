/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : nojoke

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 07/06/2023 19:18:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `INFO` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `AGE` int NULL DEFAULT NULL,
  `ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES ('555 ASDASD ASDASD ASDASD', 'ASDASDA', '2020-02-12 10:59:35', '1212', 12, 'GD\\SW');
INSERT INTO `demo` VALUES ('ASDA3SD ASDASD', 'SADSAD', '2019-06-22 14:01:54', '212', 13, 'GX\\YS');
INSERT INTO `demo` VALUES ('ASDAS1D ASDASD', 'SADSAD', '2020-02-12 10:59:33', '21121', 14, 'GX\\GL');
INSERT INTO `demo` VALUES ('ASDAS2D ASDASD', 'ASDASDA', '2019-06-22 22:02:00', NULL, 15, 'GD\\GZ');
INSERT INTO `demo` VALUES ('bd7001ce0b6181668226827be6b025e1', 'xxx', '2019-02-12 10:09:10', '123123', 63, 'GD\\A');
INSERT INTO `demo` VALUES ('d5e781aaf42d18bcfc562354e82bad31', '12123', NULL, NULL, 23, 'GD\\B');
INSERT INTO `demo` VALUES ('df4a42791d958e7cdf74ace7c5fc6ba2', '1', '2019-10-09 16:00:00', '1', 34, 'GD\\C');
INSERT INTO `demo` VALUES ('f6d3658605c9363da7274522b6e81015', '12', '2020-02-12 10:59:35', '1', 43, 'GD\\D');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `CONFIG_KEY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '配置key',
  `PARENT_KEY` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属key',
  `INFO` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '说明',
  `CONFIG_VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置的值',
  `DISABLE` int NULL DEFAULT 0 COMMENT '0有效 其他失效',
  PRIMARY KEY (`CONFIG_KEY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1111', '-', '阿斯顿撒的', '奥术大师的', 0);
INSERT INTO `sys_config` VALUES ('111111', '-', '111', '11111', 1);
INSERT INTO `sys_config` VALUES ('666', '-', '666', '6666', 1);
INSERT INTO `sys_config` VALUES ('config', '-', NULL, NULL, 0);
INSERT INTO `sys_config` VALUES ('config1', 'config2222', '系统配置', 'configValue', 1);
INSERT INTO `sys_config` VALUES ('config2', 'config', '系统配置', 'configValue', 0);
INSERT INTO `sys_config` VALUES ('config3', 'config', '系统配置', 'configValue', 0);
INSERT INTO `sys_config` VALUES ('system', '-', '系统配置', '-', 0);
INSERT INTO `sys_config` VALUES ('system1', 'system', '系统配置', 'systemValue', 0);
INSERT INTO `sys_config` VALUES ('system2', 'system', '系统配置', 'systemValue', 0);
INSERT INTO `sys_config` VALUES ('system3', 'system', '系统配置', 'systemValue', 0);
INSERT INTO `sys_config` VALUES ('system4', 'system', '系统配置', 'systemValue', 0);
INSERT INTO `sys_config` VALUES ('system:xss:enabled', '-', 'xss配置开关', 'true', 0);
INSERT INTO `sys_config` VALUES ('white_list', 'white_list', '白名单数据', 'admin', 0);
INSERT INTO `sys_config` VALUES ('wx_config', '-', '微信配置相关', '-', 0);
INSERT INTO `sys_config` VALUES ('wx_token', 'wx_config', '微信授权', 'xxx', 0);

-- ----------------------------
-- Table structure for sys_dept_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_info`;
CREATE TABLE `sys_dept_info`  (
  `DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门名字',
  `PARENT_DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上级部门。一级部门的上级部门为空字符串',
  `DEPT_PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门路径',
  `DEPT_LEVEL` int NOT NULL DEFAULT 0 COMMENT '部门等级',
  `DISABLE` int NOT NULL DEFAULT 0 COMMENT '状态.1代表正常。0代表已删除',
  `NUMBER_LEVEL` int NULL DEFAULT NULL COMMENT '层级',
  `BUSINESS_LEVEL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务层级',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept_info
-- ----------------------------
INSERT INTO `sys_dept_info` VALUES ('1325121829601280001', '总经办', '4444', '跟部门/总经办', 0, 0, 2, '4444:1325121829601280001:');
INSERT INTO `sys_dept_info` VALUES ('1325122003077693442', '市场部', '4444', '跟部门/市场部', 0, 0, 2, '4444:1325122003077693442:');
INSERT INTO `sys_dept_info` VALUES ('1325123225058803713', '软件部', '4444', '', 0, 0, 2, '4444:1325123225058803713:');
INSERT INTO `sys_dept_info` VALUES ('1325123334769213441', '人事部', '4444', '', 0, 0, 2, '4444:1325123334769213441:');
INSERT INTO `sys_dept_info` VALUES ('4444', '跟部门', '0000', '跟部门', 0, 0, 1, '4444:');

-- ----------------------------
-- Table structure for sys_dice_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_dice_info`;
CREATE TABLE `sys_dice_info`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DICE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `DICE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典编码',
  `PARENT_DICE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属字典',
  `DICE_VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字典值',
  `SORT` int NOT NULL DEFAULT 0 COMMENT '排序',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `DISABLE` int NOT NULL DEFAULT 1 COMMENT '状态. 1代表正常。 0代表已删除',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `DICE_CODE`(`DICE_CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dice_info
-- ----------------------------
INSERT INTO `sys_dice_info` VALUES ('1115910753563779073', '质量报告', '质量报告', '', '/quality_report/', 0, '质量报告', 0);
INSERT INTO `sys_dice_info` VALUES ('1115911643695751169', '22', '222', '质量报告', '222', 2, '222', 0);
INSERT INTO `sys_dice_info` VALUES ('1116169054240587778', '1', '1', '质量报告', '1', 1, '12', 0);
INSERT INTO `sys_dice_info` VALUES ('1116262455376044034', 'asd', 'asdsa', '质量报告', '1', 1, '1', 0);
INSERT INTO `sys_dice_info` VALUES ('1116597034087997441', 'sss', 'sss', '', 'sss', 1, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1116601419975192577', '11', 'sssqq11s', '', 'qqq', 0, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1116640222618140673', '11', '11', 'sssqq11s', '11', 11, '11', 0);
INSERT INTO `sys_dice_info` VALUES ('1116640932076285954', '333', '3333ssss', '222', '333', 33, '333333', 0);
INSERT INTO `sys_dice_info` VALUES ('1116640932076285955', '系统编码', 'system', '', 'system', 0, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1148629722358673409', '微信key', 'wx-key', 'system', 'key-wx-key-xxx', 0, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1148629722845212674', '微信value', 'wx-value', 'system', 'key-wx-key-xxx', 0, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1148629723600187393', '支付宝key', 'alipay-key', 'system', 'key-wx-key-xxx', 0, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1148629723990257666', '支付宝value', 'alipay-value', 'system', 'key-wx-key-xxx', 0, '', 0);
INSERT INTO `sys_dice_info` VALUES ('1178552193427894273', '1', '1112', '', '1', 1, '1', 0);

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DISABLE` int NULL DEFAULT 1 COMMENT '状态. 1代表正常. 0代表已删除',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `FILE_KEY` varchar(2047) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '文件key',
  `HEIGHT` int NULL DEFAULT 0 COMMENT '高度',
  `MEDIA_TYPE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件头类型',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '名称',
  `PATH` varchar(1023) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '路径',
  `FILE_SIZE` bigint NOT NULL COMMENT '大小',
  `SUFFIX` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '后缀',
  `THUMB_PATH` varchar(1023) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '压缩路径',
  `FILE_TYPE` int NULL DEFAULT 0 COMMENT '类型',
  `WIDTH` int NULL DEFAULT 0 COMMENT '宽度',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO `sys_files` VALUES ('18a70aa0a05357e1c760c9415f507a72', '2020-01-18 09:22:07', 0, '2020-01-18 09:22:07', 'upload/2020/1/新建文件-ea8437ce20644c7a7a21f4871f7b9fdc.txt', 0, 'text/plain', '新建文件', 'upload/2020/1/新建文件-ea8437ce20644c7a7a21f4871f7b9fdc.txt', 30, 'txt', '', 0, 0);
INSERT INTO `sys_files` VALUES ('1be32a8d24da1a93414a4316fd189d5f', '2020-03-02 15:55:55', 0, '2020-03-02 15:55:55', 'upload/2020/3/1-8141be17491e7538070bae817eb15d74.png', 592, 'image/png', '1', 'upload/2020/3/1-8141be17491e7538070bae817eb15d74.png', 571015, 'png', 'upload/2020/3/1-8141be17491e7538070bae817eb15d74-thumbnail.png', 0, 566);
INSERT INTO `sys_files` VALUES ('2d3a7d5b457a8e33caa0a1cac5ec3441', '2020-03-01 15:50:25', 0, '2020-03-01 15:50:25', 'upload/2020/3/4E7AC6D7759E3A324C8BEC5B19F0044E-1fc9a6ff313e0f9343fea091a7d37954.png', 401, 'image/png', '4E7AC6D7759E3A324C8BEC5B19F0044E', 'upload/2020/3/4E7AC6D7759E3A324C8BEC5B19F0044E-1fc9a6ff313e0f9343fea091a7d37954.png', 7698, 'png', 'upload/2020/3/4E7AC6D7759E3A324C8BEC5B19F0044E-1fc9a6ff313e0f9343fea091a7d37954-thumbnail.png', 0, 567);
INSERT INTO `sys_files` VALUES ('4cbfadcfb86038ebb14f58174af9869e', '2020-03-04 01:44:10', 0, '2020-03-04 01:44:10', 'upload/2020/3/4E7AC6D7759E3A324C8BEC5B19F0044E 2-e2a29b95be57893a9b44cab8cf37b97d.png', 401, 'image/png', '4E7AC6D7759E3A324C8BEC5B19F0044E 2', 'upload/2020/3/4E7AC6D7759E3A324C8BEC5B19F0044E 2-e2a29b95be57893a9b44cab8cf37b97d.png', 7698, 'png', 'upload/2020/3/4E7AC6D7759E3A324C8BEC5B19F0044E 2-e2a29b95be57893a9b44cab8cf37b97d-thumbnail.png', 0, 567);
INSERT INTO `sys_files` VALUES ('4e355fb1e97174a4900502ed7577134f', '2020-01-18 09:28:29', 0, '2020-01-18 09:28:29', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E-6abb1e470ef23f0c540990113625d03a.png', 401, 'image/png', '4E7AC6D7759E3A324C8BEC5B19F0044E', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E-6abb1e470ef23f0c540990113625d03a.png', 7698, 'png', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E-6abb1e470ef23f0c540990113625d03a-thumbnail.png', 0, 567);
INSERT INTO `sys_files` VALUES ('6c4c4bed77e8b4ac61229a7359c7f3d3', '2020-03-02 16:27:29', 0, '2020-03-02 16:27:29', 'upload/2020/3/1-155c2270319f21dfbed8a6fd2ad56011.png', 592, 'image/png', '1', 'upload/2020/3/1-155c2270319f21dfbed8a6fd2ad56011.png', 571015, 'png', 'upload/2020/3/1-155c2270319f21dfbed8a6fd2ad56011-thumbnail.png', 0, 566);
INSERT INTO `sys_files` VALUES ('73a3a2385e9239e32cac7cf55daf1751', '2020-03-02 15:56:20', 0, '2020-03-02 15:56:20', 'upload/2020/3/1-07878b7d73ddf4dbb4f014ed6aa6f27f.png', 592, 'image/png', '1', 'upload/2020/3/1-07878b7d73ddf4dbb4f014ed6aa6f27f.png', 571015, 'png', 'upload/2020/3/1-07878b7d73ddf4dbb4f014ed6aa6f27f-thumbnail.png', 0, 566);
INSERT INTO `sys_files` VALUES ('7df7263789a6ce3661cf2fd3668ddaa4', '2020-03-02 15:56:02', 0, '2020-03-02 15:56:02', 'upload/2020/3/WechatIMG94-2d86cd25e5e691308bfdb881d1f665b1.jpeg', 1000, 'image/jpeg', 'WechatIMG94', 'upload/2020/3/WechatIMG94-2d86cd25e5e691308bfdb881d1f665b1.jpeg', 118676, 'jpeg', 'upload/2020/3/WechatIMG94-2d86cd25e5e691308bfdb881d1f665b1-thumbnail.jpeg', 0, 776);
INSERT INTO `sys_files` VALUES ('93354d120d6f6bf252bdfa55e51b72fe', '2020-03-02 15:56:02', 0, '2020-03-02 15:56:02', 'upload/2020/3/1-3bab7d4d46314933cec76102c9c47213.png', 592, 'image/png', '1', 'upload/2020/3/1-3bab7d4d46314933cec76102c9c47213.png', 571015, 'png', 'upload/2020/3/1-3bab7d4d46314933cec76102c9c47213-thumbnail.png', 0, 566);
INSERT INTO `sys_files` VALUES ('95a0b70c99098afe91cf6f333b4dc11a', '2020-03-02 15:56:58', 0, '2020-03-02 15:56:58', 'upload/2020/3/1-7cd6873cc62471eccbb63dc0141f1ac2.png', 592, 'image/png', '1', 'upload/2020/3/1-7cd6873cc62471eccbb63dc0141f1ac2.png', 571015, 'png', 'upload/2020/3/1-7cd6873cc62471eccbb63dc0141f1ac2-thumbnail.png', 0, 566);
INSERT INTO `sys_files` VALUES ('e0ab277825bb74274fbb6e23325c3dde', '2020-03-02 15:57:20', 0, '2020-03-02 15:57:20', 'upload/2020/3/WechatIMG94-fe2ba6d869f1d790ace36d1ca3ebde57.jpeg', 1000, 'image/jpeg', 'WechatIMG94', 'upload/2020/3/WechatIMG94-fe2ba6d869f1d790ace36d1ca3ebde57.jpeg', 118676, 'jpeg', 'upload/2020/3/WechatIMG94-fe2ba6d869f1d790ace36d1ca3ebde57-thumbnail.jpeg', 0, 776);
INSERT INTO `sys_files` VALUES ('e11baea43b35a8874888217e8b0aa615', '2020-01-18 09:30:13', 0, '2020-01-18 09:30:13', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E-e1ebd5d60c23aaca6b05bd4a492e6c32.png', 401, 'image/png', '4E7AC6D7759E3A324C8BEC5B19F0044E', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E-e1ebd5d60c23aaca6b05bd4a492e6c32.png', 7698, 'png', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E-e1ebd5d60c23aaca6b05bd4a492e6c32-thumbnail.png', 0, 567);
INSERT INTO `sys_files` VALUES ('e13dac0d88ce2210f060511e3d99cdea', '2020-01-18 09:22:37', 0, '2020-01-18 09:22:37', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E 2-ac6143fb82a67b42abac4af8f88c4cd8.png', 401, 'image/png', '4E7AC6D7759E3A324C8BEC5B19F0044E 2', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E 2-ac6143fb82a67b42abac4af8f88c4cd8.png', 7698, 'png', 'upload/2020/1/4E7AC6D7759E3A324C8BEC5B19F0044E 2-ac6143fb82a67b42abac4af8f88c4cd8-thumbnail.png', 0, 567);
INSERT INTO `sys_files` VALUES ('e9897e01fa059f3bd3c2142329b198a9', '2020-03-02 15:55:55', 0, '2020-03-02 15:55:55', 'upload/2020/3/WechatIMG94-6b0b950cc780bfe0741fd005071931a7.jpeg', 1000, 'image/jpeg', 'WechatIMG94', 'upload/2020/3/WechatIMG94-6b0b950cc780bfe0741fd005071931a7.jpeg', 118676, 'jpeg', 'upload/2020/3/WechatIMG94-6b0b950cc780bfe0741fd005071931a7-thumbnail.jpeg', 0, 776);
INSERT INTO `sys_files` VALUES ('eac7d25fa6628c19e46adbd94be34370', '2020-03-02 15:56:20', 0, '2020-03-02 15:56:20', 'upload/2020/3/WechatIMG94-9890e466281dedb689b505ff1692c8b7.jpeg', 1000, 'image/jpeg', 'WechatIMG94', 'upload/2020/3/WechatIMG94-9890e466281dedb689b505ff1692c8b7.jpeg', 118676, 'jpeg', 'upload/2020/3/WechatIMG94-9890e466281dedb689b505ff1692c8b7-thumbnail.jpeg', 0, 776);
INSERT INTO `sys_files` VALUES ('ed0aef000a0371ef0a817f08514f01e5', '2020-03-02 16:27:12', 0, '2020-03-02 16:27:12', 'upload/2020/3/1-a15ea6c12c6fd3d0fffa998659f86fd0.png', 592, 'image/png', '1', 'upload/2020/3/1-a15ea6c12c6fd3d0fffa998659f86fd0.png', 571015, 'png', 'upload/2020/3/1-a15ea6c12c6fd3d0fffa998659f86fd0-thumbnail.png', 0, 566);
INSERT INTO `sys_files` VALUES ('ed7a69eca6dd19b02f88cecb90a3658f', '2020-03-02 15:57:03', 0, '2020-03-02 15:57:03', 'upload/2020/3/WechatIMG94-47d30ee2d73eab5f51afc29655152fe5.jpeg', 1000, 'image/jpeg', 'WechatIMG94', 'upload/2020/3/WechatIMG94-47d30ee2d73eab5f51afc29655152fe5.jpeg', 118676, 'jpeg', 'upload/2020/3/WechatIMG94-47d30ee2d73eab5f51afc29655152fe5-thumbnail.jpeg', 0, 776);
INSERT INTO `sys_files` VALUES ('f568e10b4a71dd90aba1bf6f9bf2b792', '2020-03-02 15:56:11', 0, '2020-03-02 15:56:11', 'upload/2020/3/WechatIMG94-0d1d11b19b01ff9ecb284e502c9cfdb9.jpeg', 1000, 'image/jpeg', 'WechatIMG94', 'upload/2020/3/WechatIMG94-0d1d11b19b01ff9ecb284e502c9cfdb9.jpeg', 118676, 'jpeg', 'upload/2020/3/WechatIMG94-0d1d11b19b01ff9ecb284e502c9cfdb9-thumbnail.jpeg', 0, 776);
INSERT INTO `sys_files` VALUES ('fb63a7c587c815f8f61afca2fbd4d5e5', '2020-03-02 15:57:07', 0, '2020-03-02 15:57:07', 'upload/2020/3/1-a097e516b303e4a324b063335cfd5d5d.png', 592, 'image/png', '1', 'upload/2020/3/1-a097e516b303e4a324b063335cfd5d5d.png', 571015, 'png', 'upload/2020/3/1-a097e516b303e4a324b063335cfd5d5d-thumbnail.png', 0, 566);

-- ----------------------------
-- Table structure for sys_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_info`;
CREATE TABLE `sys_menu_info`  (
  `MENU_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `PARENT_MENU_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上级菜单',
  `MENU_ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标.(参见layui2.x图标即可)',
  `MENU_TYPE` int NOT NULL DEFAULT 1 COMMENT '菜单类型. 1代表目录。2和3代表菜单。4代表按钮.(最大支持3级菜单)',
  `SORT` int NOT NULL DEFAULT 0 COMMENT '排序',
  `MENU_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单英文标识',
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单地址',
  `AUTHORIZATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '授权标识。多个之间用逗号隔开',
  `DISABLE` int NOT NULL DEFAULT 0 COMMENT '状态.1代表正常。0代表已删除',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_info
-- ----------------------------
INSERT INTO `sys_menu_info` VALUES ('1112966344857616386', '系统管理', '', 'layui-icon-set-fill', 1, 10, 'sysMng', '', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1112974755733204993', '用户管理', 'sysMng', '', 2, 19, 'userMng', 'user/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1112975139314933761', '角色管理', 'sysMng', '', 2, 18, 'roleMng', 'role/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1112975278309969922', '菜单管理', 'sysMng', '', 2, 17, 'menuMng', 'menu/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1112975614172987393', '日志管理', '1123', '', 2, 15, 'sysLog', 'log/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1112975721178087426', '登录日志', '1123', '', 2, 14, 'loginLog', 'loginLog/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1112975853831434242', '数据字典', 'sysMng', '', 2, 13, 'dataDict', 'dataDict/dictList.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1113333920829923329', 'echarts集成', '', 'layui-icon-chart-screen', 1, 30, 'echarts', '', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1113334542035636226', '折线图', 'echarts', '', 2, 31, 'line', 'line/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1113334674051395586', '柱状图', 'echarts', '', 2, 31, 'bar', 'bar/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1126023857498173442', '新增用户', 'userMng', '', 4, 0, 'userAdd', '', 'user:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1126024927796473858', '更新用户', 'userMng', '', 4, 0, 'userUpdate', '', 'user:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1126044820419874817', '菜单删除', 'menuMng', '', 4, 0, 'menuDelete', '', 'menu:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1126049280905560066', '用户列表', 'userMng', '', 4, 0, 'userList', '', 'user:userList', 0);
INSERT INTO `sys_menu_info` VALUES ('1126049883098562562', '删除用户', 'userMng', '', 4, 0, 'userDelete', '', 'user:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1126050257549246465', '恢复用户', 'userMng', '', 4, 0, 'userReset', '', 'user:reset', 0);
INSERT INTO `sys_menu_info` VALUES ('1126050484595310593', '重置密码', 'userMng', '', 4, 0, 'userResetPassword', '', 'user:resetPassword', 0);
INSERT INTO `sys_menu_info` VALUES ('1126050805824471041', '导入用户', 'userMng', '', 4, 0, 'userImport', '', 'user:import', 0);
INSERT INTO `sys_menu_info` VALUES ('1126050940436463617', '导出用户', 'userMng', '', 4, 0, 'userExport', '', 'user:export', 0);
INSERT INTO `sys_menu_info` VALUES ('1126056089716285441', '新增数据字典', 'dataDict', '', 4, 0, 'dataDictAdd', '', 'dataDict:save', 0);
INSERT INTO `sys_menu_info` VALUES ('1126056377630089217', '更新数据字典', 'dataDict', '', 4, 0, 'dataDictUpdate', '', 'dataDict:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1126056530101428226', '数据字典列表', 'dataDict', '', 4, 0, 'dictList', '', 'dataDict:dictList', 0);
INSERT INTO `sys_menu_info` VALUES ('1126056749694214145', '导入字典列表', 'dataDict', '', 4, 0, 'dataDictImport', '', 'dataDict:import', 0);
INSERT INTO `sys_menu_info` VALUES ('1126056876265725953', '导出数据字典', 'dataDict', '', 4, 0, 'dataDictExport', '', 'dataDict:export', 0);
INSERT INTO `sys_menu_info` VALUES ('1126057712962265090', '删除数据字典', 'dataDict', '', 4, 0, 'dataDictDelete', '', 'dataDict:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1126063434945089538', '日志列表', 'sysLog', '', 4, 0, 'operationLogList', '', 'log:operationLogList', 0);
INSERT INTO `sys_menu_info` VALUES ('1126063556827369474', '登录日志列表', 'loginLog', '', 4, 0, 'loginLogList', '', 'loginLog:loginLogList', 0);
INSERT INTO `sys_menu_info` VALUES ('1126293684049588226', '菜单列表', 'menuMng', '', 4, 0, 'menuList', '', 'menu:menuList', 0);
INSERT INTO `sys_menu_info` VALUES ('1126293927839313922', '菜单新增', 'menuMng', '', 4, 0, 'menuAdd', '', 'menu:add,select:noButton:menuTree', 0);
INSERT INTO `sys_menu_info` VALUES ('1126294109494620162', '菜单编辑', 'menuMng', '', 4, 0, 'menuUpdate', '', 'menu:update,select:noButton:menuTree', 0);
INSERT INTO `sys_menu_info` VALUES ('1126294703332569089', '角色新增', 'roleMng', '', 4, 0, 'roleAdd', '', 'role:add,select:menuTree', 0);
INSERT INTO `sys_menu_info` VALUES ('1126295042660151297', '角色编辑', 'roleMng', '', 4, 0, 'roleUpdate', '', 'role:update,role:userRoleMenus', 0);
INSERT INTO `sys_menu_info` VALUES ('1126295169936306178', '角色列表', 'roleMng', '', 4, 0, 'roleList', '', 'role:roleList', 0);
INSERT INTO `sys_menu_info` VALUES ('1126295252723478530', '角色删除', 'roleMng', '', 4, 0, 'roleDelete', '', 'role:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1131086857273638914', '演示案例', '', 'layui-icon-group', 1, 1, '1111', '', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1131087041919483905', '基本框架', '1111', '', 2, 3, 'testMng', 'test/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1133280429060288513', '监控', '', 'layui-icon-camera-fill', 1, 1, '1123', '', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1138588743643717633', 'sql监控', '1123', '', 2, 1, '4444', 'druid/index.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1138840604208594945', '机构管理', 'sysMng', '', 2, 1, 'deptMng', 'dept/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1138842267690532865', '部门列表', 'deptMng', '', 4, 0, 'deptList', '', 'dept:deptList', 0);
INSERT INTO `sys_menu_info` VALUES ('1147553800111222786', 'web日志', '1123', '', 2, 1, '123', 'logweb/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1147555115004469249', '列表', '123', '', 4, 0, 'list', '', 'logweb:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1150795687641001985', '系统配置', 'sysMng', '', 2, 10, 'configMng', 'config/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1150796063194787842', '配置列表', 'configMng', '', 4, 0, 'configList', '', 'config:configList', 0);
INSERT INTO `sys_menu_info` VALUES ('1150804439245041666', '删除配置', 'configMng', '', 4, 0, 'configDelete', '', 'config:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1150805629018091521', '修改配置', 'configMng', '', 4, 0, 'configUpdate', '', 'config:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1150805870735831041', '新增配置', 'configMng', '', 4, 0, 'configAdd', '', 'config:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1157847348920324097', '恢复', 'configMng', '', 4, 0, 'configRecovery', '', 'config:recovery', 0);
INSERT INTO `sys_menu_info` VALUES ('1176170190520758273', '文件上传', 'systemTool', '', 2, 1, 'file', 'file/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1182828280830537730', '系统工具', '', 'layui-icon-align-center', 1, 6, 'systemTool', '', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1182829708877803522', '代码生成', 'systemTool', '', 2, 1, 'genaratorCode', 'gen/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1192377180011401218', '恢复数据字典', 'dataDict', '', 4, 0, 'dataDictRecovery', '', 'dataDict:recovery', 0);
INSERT INTO `sys_menu_info` VALUES ('1225261202025451521', '修改部门', 'deptMng', '', 4, 1, 'deptUpdate', '', 'dept:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1225265193530658817', '删除部门', 'deptMng', '', 4, 1, 'deptDelete', '', 'dept:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1225266469668622338', '部门新增', 'deptMng', '', 4, 1, 'deptAdd', '', 'dept:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1225284950367633409', '机构恢复', 'deptMng', '', 4, 1, 'deptRecovery', '', 'dept:recovery', 0);
INSERT INTO `sys_menu_info` VALUES ('1225596235096821761', '测试按钮', 'test2', '', 4, 1, 'xxxx1111', '', 'ljasdlkjad1', 0);
INSERT INTO `sys_menu_info` VALUES ('1227757975306383361', 'demo演示', '1111', '', 2, 1, 'demoMng', 'demo/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1227792297283543041', '新增', 'demoMng', '', 4, 1, 'demoAdd', '', 'demo:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1227796662648037378', '列表', 'demoMng', '', 4, 1, 'demoList', '', 'demo:demoList', 0);
INSERT INTO `sys_menu_info` VALUES ('1227797405371195393', '修改', 'demoMng', '', 4, 1, 'demoUpdate', '', 'demo:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1227802053339430913', '删除', 'demoMng', '', 4, 1, 'demoDelete', '', 'demo:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1234752271292628993', '系统文件管理', 'systemTool', '', 2, 1, 'FilesMng', 'files/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1234752271292628994', '列表', 'FilesMng', '', 4, 1, 'FilesList', '', 'tool:files:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1234752271292628995', '新增', 'FilesMng', '', 4, 1, 'FilesAdd', '', 'tool:files:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1234752271292628996', '修改', 'FilesMng', '', 4, 1, 'FilesUpdate', '', 'tool:files:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1234752271292628997', '删除', 'FilesMng', '', 4, 1, 'FilesDelete', '', 'tool:files:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1238361764459675650', '树形选择框', '1111', '', 2, 3, 'testTree', 'test/tree.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1238392821993127937', '树形单选回显', '1111', '', 2, 4, 'treeCheckMng', 'test/treeCheck.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1302490000092598275', '列表', 'CodeCheckResultMng', '', 4, 1, 'CodeCheckResultList', '', 'sys:codeCheck:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1302490000092598276', '新增', 'CodeCheckResultMng', '', 4, 1, 'CodeCheckResultAdd', '', 'sys:codeCheck:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1302490000092598277', '修改', 'CodeCheckResultMng', '', 4, 1, 'CodeCheckResultUpdate', '', 'sys:codeCheck:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1302490000092598278', '删除', 'CodeCheckResultMng', '', 4, 1, 'CodeCheckResultDelete', '', 'sys:codeCheck:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1663536569467817985', '学生管理', '1111', '', 2, 1, 'StudentMng', 'student/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1663536569467817986', '列表', 'StudentMng', '', 4, 1, 'StudentList', '', 'stu:student:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1663536569467817987', '新增', 'StudentMng', '', 4, 1, 'StudentAdd', '', 'stu:student:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1663536569467817988', '修改', 'StudentMng', '', 4, 1, 'StudentUpdate', '', 'stu:student:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1663536569467817989', '删除', 'StudentMng', '', 4, 1, 'StudentDelete', '', 'stu:student:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1663539944011866114', '企业客户管理', '1663542206985666562', '', 2, 1, 'TbCustomerMng', 'custinfo/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1663539944011866115', '列表', 'TbCustomerMng', '', 4, 1, 'TbCustomerList', '', 'cust:custinfo:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1663539944011866116', '新增', 'TbCustomerMng', '', 4, 1, 'TbCustomerAdd', '', 'cust:custinfo:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1663539944011866117', '修改', 'TbCustomerMng', '', 4, 1, 'TbCustomerUpdate', '', 'cust:custinfo:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1663539944011866118', '删除', 'TbCustomerMng', '', 4, 1, 'TbCustomerDelete', '', 'cust:custinfo:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1663542206985666563', '客户管理', '', 'layui-icon-username', 1, 20, '1663542206985666562', '', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1663740371030552578', '客户联系人管理', '1663542206985666562', '', 2, 1, 'TbCustLinkmanMng', 'custLinkManInfo/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1663740371030552579', '列表', 'TbCustLinkmanMng', '', 4, 1, 'TbCustLinkmanList', '', 'custLinkMan:custLinkManInfo:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1663740371030552580', '新增', 'TbCustLinkmanMng', '', 4, 1, 'TbCustLinkmanAdd', '', 'custLinkMan:custLinkManInfo:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1663740371030552581', '修改', 'TbCustLinkmanMng', '', 4, 1, 'TbCustLinkmanUpdate', '', 'custLinkMan:custLinkManInfo:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1663740371030552582', '删除', 'TbCustLinkmanMng', '', 4, 1, 'TbCustLinkmanDelete', '', 'custLinkMan:custLinkManInfo:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1664089788929593345', '联系人走访管理', '1663542206985666562', '', 2, 1, 'TbVisitMng', 'linkVisitInfo/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1664089788929593346', '列表', 'TbVisitMng', '', 4, 1, 'TbVisitList', '', 'linkVisit:linkVisitInfo:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1664089788929593347', '新增', 'TbVisitMng', '', 4, 1, 'TbVisitAdd', '', 'linkVisit:linkVisitInfo:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1664089788929593348', '修改', 'TbVisitMng', '', 4, 1, 'TbVisitUpdate', '', 'linkVisit:linkVisitInfo:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1664089788929593349', '删除', 'TbVisitMng', '', 4, 1, 'TbVisitDelete', '', 'linkVisit:linkVisitInfo:delete', 0);
INSERT INTO `sys_menu_info` VALUES ('1664426666144837633', '客户合同管理', '1663542206985666562', '', 2, 1, 'TbContractMng', 'custContractInfo/list.html', '', 0);
INSERT INTO `sys_menu_info` VALUES ('1664426666144837634', '列表', 'TbContractMng', '', 4, 1, 'TbContractList', '', 'custContract:custContractInfo:list', 0);
INSERT INTO `sys_menu_info` VALUES ('1664426666144837635', '新增', 'TbContractMng', '', 4, 1, 'TbContractAdd', '', 'custContract:custContractInfo:add', 0);
INSERT INTO `sys_menu_info` VALUES ('1664426666144837636', '修改', 'TbContractMng', '', 4, 1, 'TbContractUpdate', '', 'custContract:custContractInfo:update', 0);
INSERT INTO `sys_menu_info` VALUES ('1664426666144837637', '删除', 'TbContractMng', '', 4, 1, 'TbContractDelete', '', 'custContract:custContractInfo:delete', 0);

-- ----------------------------
-- Table structure for sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info`  (
  `ROLE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级角色',
  `BUSINESS_LEVEL` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业务层级',
  `NUMBER_LEVEL` int NULL DEFAULT 2,
  `ROLE_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `ROLE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DISABLE` int NOT NULL DEFAULT 1 COMMENT '状态. 1代表正常. 0代表已删除',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES ('1111', '0000', '1111:', 1, '超级管理员', '拥有全部权限', 'admin', '2023-06-06 14:42:33', 0);
INSERT INTO `sys_role_info` VALUES ('1218567428905160705', '1111', '1111:1218567428905160706:', 2, '系统管理员', 'system-admin', 'system-admin', '2020-01-18 08:14:50', 0);
INSERT INTO `sys_role_info` VALUES ('1218567729141829633', '1111', '1111:1218567729141829633:', 2, '报表管理员', 'pro-admin', 'pro-admin', '2022-06-17 01:14:21', 0);
INSERT INTO `sys_role_info` VALUES ('1218567872230510594', '1218567729141829633', '1111:1218567729141829633:1218567872230510595:', 3, '用户组长', '用户组长', '用户组长', '2020-01-18 08:16:35', 0);
INSERT INTO `sys_role_info` VALUES ('1218567931940622337', '1218567729141829633', '1111:1218567729141829633:1218567931940622337:', 3, '报表组长', '报表组长', '报表组长', '2020-01-23 20:21:14', 0);
INSERT INTO `sys_role_info` VALUES ('1218717746478055426', '1218567428905160705', '1111:1218567428905160706:1218717746478055426:', 3, '管理员添加', '管理员添加管理员添加22', 'admin-add', '2020-01-19 10:12:29', 0);
INSERT INTO `sys_role_info` VALUES ('1224918778421837825', '1218567428905160705', '1111:1218567428905160706:1224918778421837826:', 3, '11', '11', '11', '2020-07-28 09:12:11', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `ROLE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色id',
  `MENU_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'echarts');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'line');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'bar');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'sysMng');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userMng');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userReset');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userResetPassword');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userImport');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'userExport');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'roleMng');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'roleAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'roleUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'roleList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'roleDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'menuMng');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'menuDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'menuList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'menuAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'menuUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDict');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDictAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDictUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dictList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDictImport');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDictExport');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDictDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'dataDictRecovery');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'configMng');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'configList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'configDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'configUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'configAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'configRecover');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'deptMng');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'deptList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'file');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'systemTool');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'genaratorCode');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', '12');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'testCase');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'testCase/list');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', '222');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', '1123');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'sysLog');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'operationLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'loginLog');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'loginLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', '4444');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', '123');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'list');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'test');
INSERT INTO `sys_role_menu` VALUES ('1218567428905160705', 'test2');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'echarts');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'line');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'bar');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'sysMng');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userMng');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userReset');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userResetPassword');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userImport');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'userExport');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'roleMng');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'roleAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'roleUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'roleList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'roleDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'menuMng');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'menuDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'menuList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'menuAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'menuUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDict');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDictAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDictUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dictList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDictImport');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDictExport');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDictDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'dataDictRecovery');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'configMng');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'configList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'configDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'configUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'configAdd');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'configRecover');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'deptMng');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'deptList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'file');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'systemTool');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'genaratorCode');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', '12');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'testCase');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'testCase/list');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', '222');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', '1123');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'sysLog');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'operationLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'loginLog');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'loginLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', '4444');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', '123');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'list');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'test');
INSERT INTO `sys_role_menu` VALUES ('1218567872230510594', 'test2');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'systemTool');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'genaratorCode');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '12');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'testCase');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'testCase/list');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '222');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '1123');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'sysLog');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'operationLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'loginLog');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'loginLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '4444');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '123');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'list');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'test');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'test2');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', 'testCase');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', 'testCase/list');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', '222');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', 'testCase');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', 'testCase/list');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218717746478055426', '222');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'systemTool');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'genaratorCode');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '12');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'testCase');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'testCase/list');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '222');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '1123');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'sysLog');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'operationLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'loginLog');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'loginLogList');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '4444');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', '123');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'list');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'test');
INSERT INTO `sys_role_menu` VALUES ('1218567931940622337', 'test2');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'echarts');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'line');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'bar');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'sysMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userReset');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userResetPassword');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userImport');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'userExport');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'roleMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'roleAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'roleUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'roleList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'roleDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'menuMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'menuDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'menuList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'menuAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'menuUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDict');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDictAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDictUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dictList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDictImport');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDictExport');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDictDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'dataDictRecovery');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'configMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'configList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'configDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'configUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'configAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'configRecovery');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'deptMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'deptUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'deptDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'deptAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'deptRecovery');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'deptList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'systemTool');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'file');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'genaratorCode');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'FilesMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'FilesList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'FilesAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'FilesUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'FilesDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', '1111');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'treeCheckMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'testMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'testTree');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'demoMng');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'demoAdd');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'demoList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'demoUpdate');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'demoDelete');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', '1123');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'sysLog');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'operationLogList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'loginLog');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'loginLogList');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', '4444');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', '123');
INSERT INTO `sys_role_menu` VALUES ('1224918778421837825', 'list');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', '1111');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'treeCheckMng');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'testTree');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'testMng');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'demoMng');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'demoDelete');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'demoUpdate');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'demoList');
INSERT INTO `sys_role_menu` VALUES ('1218567729141829633', 'demoAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'echarts');
INSERT INTO `sys_role_menu` VALUES ('1111', 'line');
INSERT INTO `sys_role_menu` VALUES ('1111', 'bar');
INSERT INTO `sys_role_menu` VALUES ('1111', '1663542206985666562');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustomerMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustomerList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustomerAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustomerUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustomerDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustLinkmanMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustLinkmanList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustLinkmanUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustLinkmanDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbCustLinkmanAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbVisitMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbVisitList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbVisitAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbVisitUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'TbVisitDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'sysMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userReset');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userResetPassword');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userImport');
INSERT INTO `sys_role_menu` VALUES ('1111', 'userExport');
INSERT INTO `sys_role_menu` VALUES ('1111', 'roleMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'roleAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'roleUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'roleList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'roleDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'menuMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'menuList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'menuAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'menuUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'menuDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDict');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDictAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDictUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dictList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDictImport');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDictExport');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDictDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'dataDictRecovery');
INSERT INTO `sys_role_menu` VALUES ('1111', 'configMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'configList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'configDelete');
INSERT INTO `sys_role_menu` VALUES ('1111', 'configAdd');
INSERT INTO `sys_role_menu` VALUES ('1111', 'configUpdate');
INSERT INTO `sys_role_menu` VALUES ('1111', 'deptMng');
INSERT INTO `sys_role_menu` VALUES ('1111', 'deptList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'systemTool');
INSERT INTO `sys_role_menu` VALUES ('1111', 'file');
INSERT INTO `sys_role_menu` VALUES ('1111', 'genaratorCode');
INSERT INTO `sys_role_menu` VALUES ('1111', '1123');
INSERT INTO `sys_role_menu` VALUES ('1111', 'sysLog');
INSERT INTO `sys_role_menu` VALUES ('1111', 'operationLogList');
INSERT INTO `sys_role_menu` VALUES ('1111', 'loginLog');
INSERT INTO `sys_role_menu` VALUES ('1111', 'loginLogList');
INSERT INTO `sys_role_menu` VALUES ('1111', '4444');
INSERT INTO `sys_role_menu` VALUES ('1111', '123');
INSERT INTO `sys_role_menu` VALUES ('1111', 'list');

-- ----------------------------
-- Table structure for sys_user_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dept`;
CREATE TABLE `sys_user_dept`  (
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID`, `DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `PASSWORD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `OLD_PASSWORD` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '旧密码',
  `NICK_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `PHONE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `CREATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime NULL DEFAULT NULL COMMENT '最近更新时间',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `DISABLE` int NOT NULL DEFAULT 0 COMMENT '1正常,0删除',
  `LOGIN_STATUS` int NOT NULL DEFAULT 0 COMMENT '登录状态。1允许登录。0禁用登录',
  `CREATE_USER_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人ID',
  `DELETE_TIME` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `LOGIN_TIME` datetime NULL DEFAULT NULL COMMENT '最近登录时间',
  `DEPT_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色ID',
  `REMARK` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE,
  UNIQUE INDEX `UQE_TB_USER_INFO_USERNAME`(`USERNAME`) USING BTREE,
  UNIQUE INDEX `IDX_TB_USER_INFO_MOBILE`(`PHONE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES ('1115864230968729601', 'root', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', 'root', '13000001111', '2019-04-08 22:25:44', '2022-06-17 01:13:48', 'root@163.com', 0, 0, '', '2019-09-20 08:23:59', '2022-06-17 01:13:27', '1325121829601280001', NULL);
INSERT INTO `sys_user_info` VALUES ('1115864462813077506', 'admin', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', 'admin', '13000001112', '2019-02-23 00:26:39', '2019-08-05 03:26:17', 'admin@163.com', 0, 0, '', '2019-08-06 09:18:27', '2023-06-07 16:57:13', 'OR1200000703', NULL);
INSERT INTO `sys_user_info` VALUES ('1138460331855884289', 'chensy', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', 'easternUnbeaten', '13000001113', '2019-06-11 06:57:50', '2020-11-07 17:12:47', 'chensy@qq.com', 0, 0, '1115864462813077506', '2019-09-21 16:23:59', '2020-02-05 14:55:11', '1325123334769213441', NULL);
INSERT INTO `sys_user_info` VALUES ('1138463107453333505', 'bubai', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '不败', '13800000000', '2019-06-11 15:08:52', '2020-11-07 17:13:20', '138@qq.com', 0, 0, '1115864462813077506', '2019-09-22 00:23:59', NULL, '1325122003077693442', NULL);
INSERT INTO `sys_user_info` VALUES ('1138463481715273730', 'dongfang', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '东方大佬', '13400002222', '2019-06-11 15:10:21', '2020-11-07 17:14:12', '134@qq.com', 0, 0, '1115864462813077506', '2019-09-22 00:23:59', '2023-06-06 14:43:17', '1325123225058803713', NULL);
INSERT INTO `sys_user_info` VALUES ('1138465382401953793', 'user-1', '98124e2a4b96dc88ba01d49345f62a07', '11111111', '用户调试', '13522220000', '2019-06-11 15:17:54', '2020-11-07 17:13:50', '135@qq.com', 0, 0, '1115864462813077506', '2019-09-22 00:23:31', NULL, '1325123334769213441', NULL);
INSERT INTO `sys_user_info` VALUES ('1147850266972839937', 'zhouliufu', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '周六福', '13300001111', '2019-07-05 12:50:04', '2022-06-17 01:14:10', '13300001111@qq.com', 0, 0, '', '2019-09-20 00:23:31', '2022-06-17 01:14:29', '1325121829601280001', NULL);
INSERT INTO `sys_user_info` VALUES ('1157842323041148930', 'zhangsan', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '张三', '13000001114', '2019-08-04 10:34:56', '2020-11-07 17:13:32', 'xx@163.com', 0, 0, '1115864462813077506', '2019-09-22 00:23:31', NULL, '1325122003077693442', NULL);
INSERT INTO `sys_user_info` VALUES ('1157842678214811649', 'lisi', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '李四', '13000001115', '2019-08-04 10:36:20', '2020-11-07 17:13:02', 'xxx@162.com', 0, 0, '1115864462813077506', '2020-02-05 13:21:19', NULL, '1325122003077693442', NULL);
INSERT INTO `sys_user_info` VALUES ('1176673562082635778', 'wangwu', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '王五', '13000001116', '2019-09-25 01:43:33', '2020-02-06 13:30:34', '631887790@qq.com', 0, 0, '1115864462813077506', NULL, NULL, 'OR1200000387', NULL);
INSERT INTO `sys_user_info` VALUES ('1189475248153251842', 'zhaoliu', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '赵六', '13000001117', '2019-10-30 09:32:56', '2020-11-07 17:14:02', '21312@qq.com', 0, 0, '1115864462813077506', '2020-02-05 14:49:26', '2019-10-30 17:33:14', '1325123334769213441', NULL);
INSERT INTO `sys_user_info` VALUES ('1227877059054125057', 'niuhuanxi', '98124e2a4b96dc88ba01d49345f62a07', '98124e2a4b96dc88ba01d49345f62a07', '牛欢喜', '13000001118', '2020-02-13 08:47:58', '2020-11-07 17:13:13', 'xx@11.com', 0, 0, '1115864462813077506', NULL, NULL, '1325123334769213441', NULL);

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录用户名',
  `LOGIN_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `SUCCESS` int NOT NULL DEFAULT 1 COMMENT '是否登录成功.1代表成功。0代表失败',
  `ERROR_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '错误日志',
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP地址',
  `DURATION` int NOT NULL DEFAULT 0 COMMENT '执行时长(毫秒)',
  `OPERATION_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------
INSERT INTO `sys_user_login_log` VALUES ('025df7099484644c3e15603b421c4dfd', 'admin', '2023-06-07 16:39:54', 1, '', '127.0.0.1', 0, '2023-06-07 16:39:54');
INSERT INTO `sys_user_login_log` VALUES ('02b320b0c1f6bfdc839517b68420863f', 'admin', '2023-06-01 09:21:30', 1, '', '127.0.0.1', 0, '2023-06-01 09:21:29');
INSERT INTO `sys_user_login_log` VALUES ('03c77abf148e39c54b5750785c2dd5e4', 'zhouliufu', '2022-06-17 01:14:29', 1, '', '127.0.0.1', 0, '2022-06-17 01:14:29');
INSERT INTO `sys_user_login_log` VALUES ('049811787d2104f62b3b151957299d71', 'admin', '2023-06-05 17:12:44', 1, '', '127.0.0.1', 0, '2023-06-05 17:12:43');
INSERT INTO `sys_user_login_log` VALUES ('04e47e13e80fcd843c9e6d4562616fc6', 'admin', '2023-06-01 09:29:54', 1, '', '127.0.0.1', 0, '2023-06-01 09:29:53');
INSERT INTO `sys_user_login_log` VALUES ('078458b8f28a229f5e0beb267e34d63d', 'root', '2022-06-17 01:13:27', 1, '', '127.0.0.1', 0, '2022-06-17 01:13:26');
INSERT INTO `sys_user_login_log` VALUES ('0988308ad8bbd3ac73e4ba3f05aefa07', 'admin', '2023-06-05 15:20:44', 1, '', '127.0.0.1', 0, '2023-06-05 15:20:44');
INSERT INTO `sys_user_login_log` VALUES ('09eee3204bfd686f14092990b763cb5f', 'admin', '2023-05-31 09:54:15', 1, '', '127.0.0.1', 0, '2023-05-31 09:54:14');
INSERT INTO `sys_user_login_log` VALUES ('0a2655273ae56236d991f876c543fb3e', 'admin', '2023-06-05 16:26:47', 1, '', '127.0.0.1', 0, '2023-06-05 16:26:47');
INSERT INTO `sys_user_login_log` VALUES ('0b38ce6eb3ffecde0fd055fe305df8d1', 'admin', '2020-08-20 09:09:57', 1, '', '127.0.0.1', 0, '2020-08-20 09:09:57');
INSERT INTO `sys_user_login_log` VALUES ('0c614dd00cd4dba535a5f5e86f36ebbc', 'admin', '2020-09-06 21:26:08', 1, '', '192.168.250.1', 0, '2020-09-07 01:26:08');
INSERT INTO `sys_user_login_log` VALUES ('0e66d91fd655ac03c5fe83a857c41ad3', 'admin', '2023-06-01 14:26:38', 1, '', '127.0.0.1', 0, '2023-06-01 14:26:38');
INSERT INTO `sys_user_login_log` VALUES ('11b88e6993f57b73306f17af4be53098', 'admin', '2020-04-20 07:36:20', 1, '', '127.0.0.1', 0, '2020-04-20 07:36:05');
INSERT INTO `sys_user_login_log` VALUES ('1241897766461341698', 'admin', '2020-03-23 01:21:15', 1, '', '127.0.0.1', 0, '2020-03-23 01:21:15');
INSERT INTO `sys_user_login_log` VALUES ('1241918640572825601', 'admin', '2020-03-23 02:44:12', 1, '', '127.0.0.1', 0, '2020-03-23 02:44:12');
INSERT INTO `sys_user_login_log` VALUES ('1241929388724289538', 'admin', '2020-03-23 03:26:55', 1, '', '127.0.0.1', 0, '2020-03-23 03:26:54');
INSERT INTO `sys_user_login_log` VALUES ('1242721762421448706', 'admin', '2020-03-25 07:55:31', 1, '', '127.0.0.1', 0, '2020-03-25 07:55:31');
INSERT INTO `sys_user_login_log` VALUES ('1242750894731632641', 'admin', '2020-03-25 09:51:17', 1, '', '127.0.0.1', 0, '2020-03-25 09:51:17');
INSERT INTO `sys_user_login_log` VALUES ('1262284484041482242', 'admin', '2020-05-18 07:30:48', 1, '', '127.0.0.1', 0, '2020-05-18 07:30:47');
INSERT INTO `sys_user_login_log` VALUES ('133b0c0c1d0d179dc4a63d754c9f705d', 'admin', '2020-10-24 03:55:00', 1, '', '127.0.0.1', 0, '2020-10-24 03:54:59');
INSERT INTO `sys_user_login_log` VALUES ('13803c245fd54b47022f8a6b4a1b0be5', 'admin', '2020-10-24 03:46:54', 1, '', '127.0.0.1', 0, '2020-10-24 03:46:54');
INSERT INTO `sys_user_login_log` VALUES ('1604493401fd699d1ad2aee3c00ff2b9', 'admin', '2020-05-08 09:08:08', 1, '', '127.0.0.1', 0, '2020-05-08 09:08:07');
INSERT INTO `sys_user_login_log` VALUES ('19ab29664168773692159091e4bc04bc', 'admin', '2020-04-21 02:45:42', 1, '', '127.0.0.1', 0, '2020-04-21 02:45:42');
INSERT INTO `sys_user_login_log` VALUES ('1a648f9f29daddfdef342424972f15ff', 'admin', '2020-09-02 06:59:34', 1, '', '127.0.0.1', 0, '2020-09-02 06:59:33');
INSERT INTO `sys_user_login_log` VALUES ('1be7066022af6a7119980d57634b97d8', 'admin', '2020-03-21 06:43:28', 1, '', '127.0.0.1', 0, '2020-03-21 06:43:34');
INSERT INTO `sys_user_login_log` VALUES ('1c95c980c87e99576305605894e77bfb', 'admin', '2020-05-08 03:51:59', 1, '', '127.0.0.1', 0, '2020-05-08 03:51:59');
INSERT INTO `sys_user_login_log` VALUES ('1e4cab39b07032575d5be2ebc186fd66', 'admin', '2023-06-02 09:10:07', 1, '', '127.0.0.1', 0, '2023-06-02 09:10:07');
INSERT INTO `sys_user_login_log` VALUES ('1f3de3dfde0bb6b6e96bd6fb4269153f', 'admin', '2023-05-31 09:26:45', 1, '', '127.0.0.1', 0, '2023-05-31 09:26:44');
INSERT INTO `sys_user_login_log` VALUES ('1f99a288d9b0b1dbe313a5165b3848b9', 'admin', '2023-06-01 14:02:04', 1, '', '127.0.0.1', 0, '2023-06-01 14:02:03');
INSERT INTO `sys_user_login_log` VALUES ('20511f02e26df9a8968ca0f2ae7dda9e', 'admin', '2020-09-06 04:55:03', 1, '', '127.0.0.1', 0, '2020-09-06 04:55:03');
INSERT INTO `sys_user_login_log` VALUES ('20837f9bf9e623f3153b52beaef3d31d', 'admin', '2023-06-05 15:14:56', 1, '', '127.0.0.1', 0, '2023-06-05 15:14:56');
INSERT INTO `sys_user_login_log` VALUES ('20dfcefa2234e70eb6fd0625509f9964', 'admin', '2023-06-02 09:56:10', 1, '', '127.0.0.1', 0, '2023-06-02 09:56:10');
INSERT INTO `sys_user_login_log` VALUES ('235fab0a9027aa49468fb7472eb9243c', 'admin', '2020-09-02 07:50:56', 1, '', '127.0.0.1', 0, '2020-09-02 07:50:56');
INSERT INTO `sys_user_login_log` VALUES ('246aa5fe0fbd07c55bdaf8ed49625be6', 'admin', '2023-06-01 10:20:22', 1, '', '127.0.0.1', 0, '2023-06-01 10:20:22');
INSERT INTO `sys_user_login_log` VALUES ('2576abb97ee62fe43393420dc7a89478', 'admin', '2020-04-07 08:25:52', 1, '', '127.0.0.1', 0, '2020-04-07 08:25:51');
INSERT INTO `sys_user_login_log` VALUES ('26db8796c813b724802a497a2d715a48', 'admin', '2022-06-16 06:42:42', 1, '', '127.0.0.1', 0, '2022-06-16 14:42:42');
INSERT INTO `sys_user_login_log` VALUES ('2963b24f3476206498254911f8d20178', 'admin', '2020-04-21 10:07:40', 1, '', '127.0.0.1', 0, '2020-04-21 10:07:40');
INSERT INTO `sys_user_login_log` VALUES ('297793e923199eae0278779938c636cf', 'admin', '2023-06-06 14:44:04', 1, '', '127.0.0.1', 0, '2023-06-06 14:44:03');
INSERT INTO `sys_user_login_log` VALUES ('29ddcef8d4d8b07ab93d68eda72714b5', 'admin', '2020-07-29 07:10:42', 1, '', '127.0.0.1', 0, '2020-07-29 07:10:42');
INSERT INTO `sys_user_login_log` VALUES ('2aa93b4af5529d469290c80b1305833b', 'admin', '2023-06-07 15:24:58', 1, '', '127.0.0.1', 0, '2023-06-07 15:24:57');
INSERT INTO `sys_user_login_log` VALUES ('2bccaddc1d5b4a2c0add5f619a128f9a', 'admin', '2020-04-29 14:48:26', 1, '', '127.0.0.1', 0, '2020-04-29 14:48:31');
INSERT INTO `sys_user_login_log` VALUES ('2c1c188e2c00c48bf7ae78e5e9c5f108', 'admin', '2022-06-16 18:12:36', 1, '', '127.0.0.1', 0, '2022-06-17 02:12:35');
INSERT INTO `sys_user_login_log` VALUES ('2c9010ac183e2873133c978bb363259d', 'admin', '2020-08-12 01:50:57', 1, '', '127.0.0.1', 0, '2020-08-12 01:50:57');
INSERT INTO `sys_user_login_log` VALUES ('2d22244e3596ec76237f54508f386f4d', 'admin', '2023-06-02 09:08:40', 1, '', '127.0.0.1', 0, '2023-06-02 09:08:40');
INSERT INTO `sys_user_login_log` VALUES ('2d616256a76fae59b09ae9250b4d6c25', 'admin', '2023-06-05 15:43:20', 1, '', '127.0.0.1', 0, '2023-06-05 15:43:20');
INSERT INTO `sys_user_login_log` VALUES ('3093f95caf14ae9e387abc245571be7e', 'admin', '2020-04-17 08:51:19', 1, '', '127.0.0.1', 0, '2020-04-17 08:51:19');
INSERT INTO `sys_user_login_log` VALUES ('30b1ddcf529e717c727a8626c691a8a4', 'admin', '2020-04-24 01:16:34', 1, '', '127.0.0.1', 0, '2020-04-24 01:16:34');
INSERT INTO `sys_user_login_log` VALUES ('310b64f81dc3d6a7ff3ceae3e58755e4', 'admin', '2023-06-05 16:12:42', 1, '', '127.0.0.1', 0, '2023-06-05 16:12:41');
INSERT INTO `sys_user_login_log` VALUES ('31d848ac5f8a59f69962dab76899d1e7', 'admin', '2023-05-31 09:21:37', 1, '', '127.0.0.1', 0, '2023-05-31 09:21:37');
INSERT INTO `sys_user_login_log` VALUES ('321165bcfc373ed925c4323acd9f5f32', 'admin', '2020-07-27 07:56:17', 1, '', '127.0.0.1', 0, '2020-07-27 07:56:16');
INSERT INTO `sys_user_login_log` VALUES ('32406098bc2aea2f9a92707e37acd527', 'admin', '2023-06-05 17:19:08', 1, '', '127.0.0.1', 0, '2023-06-05 17:19:08');
INSERT INTO `sys_user_login_log` VALUES ('32d93bbd924b905d87e24af12a2802b8', 'admin', '2020-03-23 05:25:51', 1, '', '127.0.0.1', 0, '2020-03-23 05:25:51');
INSERT INTO `sys_user_login_log` VALUES ('34b5c25d8ac2ec3ab197c4bc01aad914', 'admin', '2023-05-31 11:04:43', 1, '', '127.0.0.1', 0, '2023-05-31 11:04:43');
INSERT INTO `sys_user_login_log` VALUES ('352f8bf9ca8b3015d7cd75f9d096c7b1', 'admin', '2020-08-31 02:52:45', 1, '', '127.0.0.1', 0, '2020-08-31 02:52:44');
INSERT INTO `sys_user_login_log` VALUES ('36081a2d17ff3241ceb4c0835c48b3f7', 'admin', '2023-06-06 14:26:28', 1, '', '127.0.0.1', 0, '2023-06-06 14:26:27');
INSERT INTO `sys_user_login_log` VALUES ('360d5efccac1caff3e846f0c4158658e', 'admin', '2023-06-01 09:27:35', 1, '', '127.0.0.1', 0, '2023-06-01 09:27:35');
INSERT INTO `sys_user_login_log` VALUES ('36d27213ed8760e36ef89c6f5ed43b02', 'admin', '2023-06-07 15:49:10', 1, '', '127.0.0.1', 0, '2023-06-07 15:49:10');
INSERT INTO `sys_user_login_log` VALUES ('386f2666a66e061d9cc797c26680d0ff', 'admin', '2023-06-05 17:15:45', 1, '', '127.0.0.1', 0, '2023-06-05 17:15:44');
INSERT INTO `sys_user_login_log` VALUES ('3a380ac7ce36e037349c31f90725c338', 'admin', '2023-05-31 10:28:34', 1, '', '127.0.0.1', 0, '2023-05-31 10:28:33');
INSERT INTO `sys_user_login_log` VALUES ('3a4366bf1f89b67dc4b82e9db0630a07', 'admin', '2023-06-06 15:19:31', 1, '', '127.0.0.1', 0, '2023-06-06 15:19:31');
INSERT INTO `sys_user_login_log` VALUES ('3afdba1e4f939f29685f0bac0c3a4e40', 'admin', '2020-10-24 03:51:27', 1, '', '127.0.0.1', 0, '2020-10-24 03:51:26');
INSERT INTO `sys_user_login_log` VALUES ('3bfd71bf900f8f3869f7854f32c45865', 'admin', '2023-06-06 15:43:42', 1, '', '127.0.0.1', 0, '2023-06-06 15:43:41');
INSERT INTO `sys_user_login_log` VALUES ('3d2707f02e1e400ce0c6df10a8ce4b06', 'admin', '2020-10-24 03:56:50', 1, '', '127.0.0.1', 0, '2020-10-24 03:56:49');
INSERT INTO `sys_user_login_log` VALUES ('3dfeef425ba085492e629e8f98cf5615', 'admin', '2023-06-02 08:09:35', 1, '', '127.0.0.1', 0, '2023-06-02 08:09:34');
INSERT INTO `sys_user_login_log` VALUES ('3e6177e3e22ef9f9cdea90012a8767e7', 'admin', '2020-04-17 07:38:00', 1, '', '127.0.0.1', 0, '2020-04-17 07:37:59');
INSERT INTO `sys_user_login_log` VALUES ('3e66e8786b88207b05e82acbfc84c193', 'admin', '2020-07-28 09:01:25', 1, '', '127.0.0.1', 0, '2020-07-28 09:01:26');
INSERT INTO `sys_user_login_log` VALUES ('3f5985fc4585cc599cbebc968156cb11', 'admin', '2020-08-01 06:07:17', 1, '', '127.0.0.1', 0, '2020-08-01 06:07:18');
INSERT INTO `sys_user_login_log` VALUES ('3fffe1446a8e6b9993ef8a698f29f510', 'admin', '2023-05-31 10:27:02', 1, '', '127.0.0.1', 0, '2023-05-31 10:27:01');
INSERT INTO `sys_user_login_log` VALUES ('404b49bd333e5028cc3b499e8b8e15cd', 'admin', '2020-05-06 15:13:13', 1, '', '127.0.0.1', 0, '2020-05-06 15:13:15');
INSERT INTO `sys_user_login_log` VALUES ('4077754903861d047b96dd9cc44c35ab', 'admin', '2023-06-02 09:22:43', 1, '', '127.0.0.1', 0, '2023-06-02 09:22:42');
INSERT INTO `sys_user_login_log` VALUES ('4171fc43b69c37c5962c98775587b591', 'admin', '2022-06-15 05:39:52', 1, '', '127.0.0.1', 0, '2022-06-15 13:39:52');
INSERT INTO `sys_user_login_log` VALUES ('42ce75e867c4ad183c286b886aafd61c', 'admin', '2020-09-06 22:00:59', 1, '', '127.0.0.1', 0, '2020-09-06 14:00:59');
INSERT INTO `sys_user_login_log` VALUES ('44fb4db32a5ecbb8450682a54fc29387', 'admin', '2020-07-30 06:56:54', 1, '', '127.0.0.1', 0, '2020-07-30 06:56:54');
INSERT INTO `sys_user_login_log` VALUES ('460c124d4f42303ac6a52e847d65f3e0', 'admin', '2020-08-01 06:45:18', 1, '', '127.0.0.1', 0, '2020-08-01 06:45:19');
INSERT INTO `sys_user_login_log` VALUES ('46d2a7a162c766ff94df91c4a4c12c38', 'root', '2022-06-17 01:13:17', 1, '', '127.0.0.1', 0, '2022-06-17 01:13:16');
INSERT INTO `sys_user_login_log` VALUES ('484319439ea58bd3e6925f6d093c5deb', 'admin', '2023-06-05 17:17:20', 1, '', '127.0.0.1', 0, '2023-06-05 17:17:19');
INSERT INTO `sys_user_login_log` VALUES ('48ac263811fab66864998788e60f0951', 'admin', '2020-09-07 09:27:38', 1, '', '127.0.0.1', 0, '2020-09-07 01:27:38');
INSERT INTO `sys_user_login_log` VALUES ('4bd9897e414e82d0f4816d8a63a6e1d0', 'admin', '2020-05-07 10:00:58', 1, '', '127.0.0.1', 0, '2020-05-07 10:00:58');
INSERT INTO `sys_user_login_log` VALUES ('4c78697a794f8a3c072665dfa6391825', 'admin', '2023-05-29 11:00:23', 1, '', '127.0.0.1', 0, '2023-05-29 11:00:23');
INSERT INTO `sys_user_login_log` VALUES ('4cea2c320e0991c30123430fa6f0a23a', 'admin', '2023-06-03 14:03:36', 1, '', '127.0.0.1', 0, '2023-06-03 14:03:36');
INSERT INTO `sys_user_login_log` VALUES ('4e3b6c195a58890ccd6ab33d7fbf6d0c', 'admin', '2020-09-08 16:16:18', 1, '', '127.0.0.1', 0, '2020-09-08 08:16:18');
INSERT INTO `sys_user_login_log` VALUES ('4ed4f976aa782a5ed1833283fa38a16c', 'admin', '2023-05-29 10:22:59', 1, '', '127.0.0.1', 0, '2023-05-29 10:22:58');
INSERT INTO `sys_user_login_log` VALUES ('4ee6f104cd0afb880b0f1630a60eca43', 'admin', '2023-05-29 10:54:24', 1, '', '127.0.0.1', 6000, '2023-05-29 10:54:32');
INSERT INTO `sys_user_login_log` VALUES ('4fda5c71cde3f79711ae869f388e2539', 'admin', '2023-06-05 16:17:18', 1, '', '127.0.0.1', 0, '2023-06-05 16:17:17');
INSERT INTO `sys_user_login_log` VALUES ('50767ff0c6d0a08551aad443bb611e27', 'admin', '2020-07-26 08:57:41', 1, '', '127.0.0.1', 0, '2020-07-26 08:57:41');
INSERT INTO `sys_user_login_log` VALUES ('50a875db8b527d2c7d63803e47d106d7', 'admin', '2023-06-02 10:57:01', 1, '', '127.0.0.1', 0, '2023-06-02 10:57:00');
INSERT INTO `sys_user_login_log` VALUES ('51ed50ed83c892224da63e4784b35bb9', 'admin', '2020-09-05 08:56:47', 1, '', '127.0.0.1', 0, '2020-09-05 08:56:47');
INSERT INTO `sys_user_login_log` VALUES ('525e25b2147a088f85cf2f380862f49d', 'admin', '2023-06-01 09:28:54', 1, '', '127.0.0.1', 0, '2023-06-01 09:28:53');
INSERT INTO `sys_user_login_log` VALUES ('52c6858460314762618dc8b2b128a18e', 'admin', '2020-04-07 07:01:08', 1, '', '127.0.0.1', 0, '2020-04-07 07:01:08');
INSERT INTO `sys_user_login_log` VALUES ('52f3894f3667bab3cb43b32618d6d387', 'admin', '2023-06-05 16:11:17', 1, '', '127.0.0.1', 0, '2023-06-05 16:11:17');
INSERT INTO `sys_user_login_log` VALUES ('5311f984946c23fc709985d359fa6b14', 'admin', '2020-11-07 16:58:12', 1, '', '127.0.0.1', 0, '2020-11-07 16:55:56');
INSERT INTO `sys_user_login_log` VALUES ('54b82ead9dd61073b3cb2a1e3e729695', 'admin', '2023-06-02 17:33:59', 1, '', '127.0.0.1', 0, '2023-06-02 17:33:59');
INSERT INTO `sys_user_login_log` VALUES ('5501cfc7ea36106935885261a5e701a2', 'admin', '2023-05-31 12:31:10', 1, '', '127.0.0.1', 0, '2023-05-31 12:31:10');
INSERT INTO `sys_user_login_log` VALUES ('5522ad59d211e80fbc96f361a16cb417', 'admin', '2023-05-29 11:52:48', 1, '', '127.0.0.1', 0, '2023-05-29 11:52:48');
INSERT INTO `sys_user_login_log` VALUES ('56b3edaac5dbd674990084252c626553', 'admin', '2023-05-31 10:40:52', 1, '', '127.0.0.1', 0, '2023-05-31 10:40:52');
INSERT INTO `sys_user_login_log` VALUES ('575ec122d3e62354f06233eced20992c', 'admin', '2023-06-02 10:02:51', 1, '', '127.0.0.1', 0, '2023-06-02 10:02:51');
INSERT INTO `sys_user_login_log` VALUES ('5776584ac0428f036552eb43b977cda6', 'admin', '2023-06-01 09:24:54', 1, '', '127.0.0.1', 0, '2023-06-01 09:24:53');
INSERT INTO `sys_user_login_log` VALUES ('582f29f7fa8b65ae363f01cdca493b37', 'admin', '2022-06-16 06:43:13', 1, '', '127.0.0.1', 0, '2022-06-16 14:43:13');
INSERT INTO `sys_user_login_log` VALUES ('5846fe8467cd49471d0a86940c0e87fc', 'admin', '2020-05-14 03:09:37', 1, '', '127.0.0.1', 0, '2020-05-14 03:09:37');
INSERT INTO `sys_user_login_log` VALUES ('5966fb1e9432a6751dc91dc6458c499a', 'admin', '2020-04-09 02:51:36', 1, '', '127.0.0.1', 0, '2020-04-09 02:51:36');
INSERT INTO `sys_user_login_log` VALUES ('5a52b41e4d646e447f7236c5d2ccf5e0', 'admin', '2020-04-21 03:42:31', 1, '', '127.0.0.1', 0, '2020-04-21 03:42:30');
INSERT INTO `sys_user_login_log` VALUES ('5b4730e0db285d3d61dda21123284805', 'admin', '2023-06-01 10:32:03', 1, '', '127.0.0.1', 0, '2023-06-01 10:32:03');
INSERT INTO `sys_user_login_log` VALUES ('5c414f959c11318c5eaa3a9b936cc9ca', 'admin', '2022-06-16 08:44:49', 1, '', '127.0.0.1', 0, '2022-06-16 16:44:48');
INSERT INTO `sys_user_login_log` VALUES ('5cc4d21b3e7595f941e501ade5754111', 'admin', '2020-09-06 13:20:23', 1, '', '127.0.0.1', 0, '2020-09-06 13:20:23');
INSERT INTO `sys_user_login_log` VALUES ('5d7918f3bea40e0847215406fadf42ab', 'admin', '2023-05-31 11:20:58', 1, '', '127.0.0.1', 0, '2023-05-31 11:20:58');
INSERT INTO `sys_user_login_log` VALUES ('5ddf3c32d5fc4e5978b8dd33f77ef336', 'admin', '2023-06-03 13:28:32', 1, '', '127.0.0.1', 0, '2023-06-03 13:28:31');
INSERT INTO `sys_user_login_log` VALUES ('5e3936847b6ec75c968ec7c34c67c7a1', 'admin', '2020-04-17 02:18:02', 1, '', '127.0.0.1', 0, '2020-04-17 02:18:02');
INSERT INTO `sys_user_login_log` VALUES ('5e7de60198e14e03436cbaf37dc602b8', 'admin', '2020-09-06 10:19:08', 1, '', '127.0.0.1', 0, '2020-09-06 10:19:07');
INSERT INTO `sys_user_login_log` VALUES ('5f7928a91afbc7658e9b71dc58fd79db', 'admin', '2020-05-07 09:03:38', 1, '', '127.0.0.1', 0, '2020-05-07 09:03:38');
INSERT INTO `sys_user_login_log` VALUES ('6065a999529c5f05edf69280e4378e0f', 'admin', '2023-06-02 08:36:08', 1, '', '127.0.0.1', 0, '2023-06-02 08:36:07');
INSERT INTO `sys_user_login_log` VALUES ('62534e921bce6cbfc9449898ca1a5aab', 'admin', '2020-05-23 05:36:16', 1, '', '127.0.0.1', 0, '2020-05-23 05:36:16');
INSERT INTO `sys_user_login_log` VALUES ('628e25131485e70bc9b4a833d01b8dbc', 'admin', '2020-07-27 07:26:03', 1, '', '127.0.0.1', 0, '2020-07-27 07:26:03');
INSERT INTO `sys_user_login_log` VALUES ('62fce8d0d3e579d34964126e68201569', 'admin', '2023-05-31 12:38:29', 1, '', '127.0.0.1', 0, '2023-05-31 12:38:29');
INSERT INTO `sys_user_login_log` VALUES ('630de31f14dbfe5bc1072a9beb56d716', 'admin', '2023-06-01 14:07:15', 1, '', '127.0.0.1', 0, '2023-06-01 14:07:15');
INSERT INTO `sys_user_login_log` VALUES ('640654200f548f10de7fe9c9282307dc', 'admin', '2020-04-21 10:06:48', 1, '', '127.0.0.1', 0, '2020-04-21 10:06:47');
INSERT INTO `sys_user_login_log` VALUES ('64f85b5819dd33d03bee771f15eb48f2', 'admin', '2020-09-02 07:45:11', 1, '', '127.0.0.1', 0, '2020-09-02 07:45:12');
INSERT INTO `sys_user_login_log` VALUES ('65aa3d22caa252cbcec7f3e6806bbbf9', 'admin', '2020-05-09 01:20:31', 1, '', '127.0.0.1', 0, '2020-05-09 01:20:30');
INSERT INTO `sys_user_login_log` VALUES ('65e6a474a1528c4a3989dc88a1680e6f', 'admin', '2020-09-05 08:57:08', 1, '', '127.0.0.1', 0, '2020-09-05 08:57:07');
INSERT INTO `sys_user_login_log` VALUES ('6795c4ae90a8800e6706401f0ec88aaa', 'admin', '2023-06-01 09:39:08', 1, '', '127.0.0.1', 0, '2023-06-01 09:39:08');
INSERT INTO `sys_user_login_log` VALUES ('67b159dcbf718634faced9591c70cc13', 'admin', '2023-06-07 14:43:54', 1, '', '127.0.0.1', 0, '2023-06-07 14:43:54');
INSERT INTO `sys_user_login_log` VALUES ('68557770e2333f28a33e24ba73dd342f', 'admin', '2020-04-21 07:30:57', 1, '', '127.0.0.1', 0, '2020-04-21 07:30:40');
INSERT INTO `sys_user_login_log` VALUES ('68c17f846e66287eef74228af6cbc69a', 'admin', '2023-05-31 08:20:21', 1, '', '127.0.0.1', 0, '2023-05-31 08:20:21');
INSERT INTO `sys_user_login_log` VALUES ('6a649c5394ef75145b4f6b9eb0c108e8', 'admin', '2020-04-07 10:02:03', 1, '', '127.0.0.1', 0, '2020-04-07 10:02:02');
INSERT INTO `sys_user_login_log` VALUES ('6b47e2b06ef680caa21efc86b0144fd1', 'admin', '2023-06-05 16:04:46', 1, '', '127.0.0.1', 0, '2023-06-05 16:04:45');
INSERT INTO `sys_user_login_log` VALUES ('6bc9571bc7cd222c6b315fcf557b9053', 'admin', '2022-06-15 17:40:34', 1, '', '127.0.0.1', 0, '2022-06-16 01:40:34');
INSERT INTO `sys_user_login_log` VALUES ('6bdade3506fc942fd6e643f13fee3851', 'admin', '2020-04-20 01:22:42', 1, '', '127.0.0.1', 0, '2020-04-20 01:22:42');
INSERT INTO `sys_user_login_log` VALUES ('6d60484010e4e9f94ab93b92f256d144', 'admin', '2023-05-31 09:06:55', 1, '', '127.0.0.1', 0, '2023-05-31 09:06:55');
INSERT INTO `sys_user_login_log` VALUES ('6de11b9aa366d1364c60cd4675e0306a', 'admin', '2023-05-29 10:42:45', 1, '', '127.0.0.1', 0, '2023-05-29 10:42:44');
INSERT INTO `sys_user_login_log` VALUES ('6efc3e3475c302fa388f4e40ea4cacc4', 'admin', '2023-06-06 15:42:46', 1, '', '127.0.0.1', 0, '2023-06-06 15:42:46');
INSERT INTO `sys_user_login_log` VALUES ('6f87e712c12bad502363a9a13fcb7a3e', 'admin', '2022-06-17 00:48:38', 1, '', '127.0.0.1', 0, '2022-06-17 08:48:38');
INSERT INTO `sys_user_login_log` VALUES ('711a8588ae2fa1370ddaaf7cb81796d0', 'admin', '2023-06-07 16:57:12', 1, '', '127.0.0.1', 0, '2023-06-07 16:57:12');
INSERT INTO `sys_user_login_log` VALUES ('724273458d98704f2ca3378cf92c31d0', 'admin', '2023-05-29 11:19:52', 1, '', '127.0.0.1', 0, '2023-05-29 11:19:51');
INSERT INTO `sys_user_login_log` VALUES ('72596256fb039c1e8a89a0ef87dd611d', 'admin', '2020-09-03 06:47:21', 1, '', '127.0.0.1', 0, '2020-09-03 06:47:21');
INSERT INTO `sys_user_login_log` VALUES ('74cf95a0297b8da6112485af55b68e78', 'admin', '2020-05-11 07:50:59', 1, '', '127.0.0.1', 0, '2020-05-11 07:50:58');
INSERT INTO `sys_user_login_log` VALUES ('7651a8ee2aa6c76aac235e5194cdd870', 'admin', '2020-04-20 07:30:18', 1, '', '127.0.0.1', 0, '2020-04-20 07:30:03');
INSERT INTO `sys_user_login_log` VALUES ('765b24fbf8ababbb7107933e46bab0fd', 'admin', '2023-06-02 10:31:19', 1, '', '127.0.0.1', 0, '2023-06-02 10:31:18');
INSERT INTO `sys_user_login_log` VALUES ('769bccd762ac9bf786fe33c0635b3e9a', 'admin', '2020-03-22 13:13:17', 1, '', '127.0.0.1', 0, '2020-03-22 13:13:16');
INSERT INTO `sys_user_login_log` VALUES ('78bf811558a7cb71358ada3d49823838', 'admin', '2020-09-05 08:56:23', 1, '', '127.0.0.1', 0, '2020-09-05 08:56:23');
INSERT INTO `sys_user_login_log` VALUES ('7b703b37b657156c4f4d3c3d49b019c3', 'admin', '2022-06-15 09:26:24', 1, '', '127.0.0.1', 0, '2022-06-15 17:26:24');
INSERT INTO `sys_user_login_log` VALUES ('7ca0ca295a0f287e807f96f39328c897', 'admin', '2023-05-31 10:01:07', 1, '', '127.0.0.1', 0, '2023-05-31 10:01:06');
INSERT INTO `sys_user_login_log` VALUES ('7df37b2c7c283daa2f8eecd1d0d20762', 'admin', '2020-09-03 01:47:42', 1, '', '127.0.0.1', 0, '2020-09-03 01:47:42');
INSERT INTO `sys_user_login_log` VALUES ('7f5793f81ee0912f0863f80fbb6871b1', 'admin', '2022-06-16 08:44:17', 1, '', '127.0.0.1', 0, '2022-06-16 16:44:17');
INSERT INTO `sys_user_login_log` VALUES ('800f3fbba4d220d4dcfcf55a68d78ed0', 'admin', '2023-06-05 16:22:44', 1, '', '127.0.0.1', 0, '2023-06-05 16:22:43');
INSERT INTO `sys_user_login_log` VALUES ('81a46293cac640f8ec95c49300c24ba8', 'admin', '2020-08-31 02:48:34', 1, '', '127.0.0.1', 0, '2020-08-31 02:48:34');
INSERT INTO `sys_user_login_log` VALUES ('829c52ec91e13e554457e98aaf713dd4', 'admin', '2023-05-29 10:22:46', 1, '', '127.0.0.1', 0, '2023-05-29 10:22:46');
INSERT INTO `sys_user_login_log` VALUES ('82a1bb62d96f4e01c13a747a2be963a8', 'admin', '2020-04-29 07:18:57', 1, '', '127.0.0.1', 0, '2020-04-29 07:10:16');
INSERT INTO `sys_user_login_log` VALUES ('8318b018759fc6a5bd58a0a718664f52', 'admin', '2023-06-02 08:38:46', 1, '', '127.0.0.1', 0, '2023-06-02 08:38:45');
INSERT INTO `sys_user_login_log` VALUES ('833a04d0705b8671af7ce267a05c86c8', 'admin', '2020-05-07 05:37:13', 1, '', '127.0.0.1', 0, '2020-05-07 05:37:12');
INSERT INTO `sys_user_login_log` VALUES ('85aa6f085d837d6b62b2f600127f4a62', 'admin', '2020-04-03 14:23:34', 1, '', '127.0.0.1', 0, '2020-04-03 14:23:34');
INSERT INTO `sys_user_login_log` VALUES ('869c8188d93511cf36a2437f1563f78d', 'admin', '2023-05-30 21:29:27', 1, '', '127.0.0.1', 0, '2023-05-30 21:29:27');
INSERT INTO `sys_user_login_log` VALUES ('8729197c64f13504200c81a0fedc818b', 'admin', '2020-10-24 03:51:35', 1, '', '127.0.0.1', 0, '2020-10-24 03:51:34');
INSERT INTO `sys_user_login_log` VALUES ('892c50159a68f1c3cc5890304c27c313', 'admin', '2020-05-07 04:32:22', 1, '', '127.0.0.1', 0, '2020-05-07 04:32:21');
INSERT INTO `sys_user_login_log` VALUES ('897ef7b0b218eef3f1185f4a40f777de', 'admin', '2022-06-16 08:46:43', 1, '', '127.0.0.1', 0, '2022-06-16 16:46:43');
INSERT INTO `sys_user_login_log` VALUES ('8a62f6c2f77573b5481b4254512c734b', 'admin', '2023-05-29 10:06:35', 1, '', '127.0.0.1', 0, '2023-05-29 10:06:35');
INSERT INTO `sys_user_login_log` VALUES ('8af1f9c4c1918b559a8101e5631dbec9', 'admin', '2020-04-17 01:40:48', 1, '', '127.0.0.1', 0, '2020-04-17 01:40:48');
INSERT INTO `sys_user_login_log` VALUES ('8db0f7a086417492e22609375ac1c8bc', 'admin', '2023-06-07 15:15:27', 1, '', '127.0.0.1', 0, '2023-06-07 15:15:27');
INSERT INTO `sys_user_login_log` VALUES ('8de90022605e16ebb8cb3ff3ed3967f1', 'admin', '2020-04-21 09:51:53', 1, '', '127.0.0.1', 0, '2020-04-21 09:51:53');
INSERT INTO `sys_user_login_log` VALUES ('8f1f1b973570da9257fb6d6e475453dd', 'admin', '2020-04-15 06:53:55', 1, '', '127.0.0.1', 0, '2020-04-15 06:53:55');
INSERT INTO `sys_user_login_log` VALUES ('91798532f370103fb945877ceb82ac8e', 'admin', '2020-04-21 07:38:44', 1, '', '127.0.0.1', 0, '2020-04-21 07:38:27');
INSERT INTO `sys_user_login_log` VALUES ('92915be11da82eac5cd7299732ac8f29', 'admin', '2023-06-02 09:05:24', 1, '', '127.0.0.1', 0, '2023-06-02 09:05:24');
INSERT INTO `sys_user_login_log` VALUES ('936da7c9ae498f4ed3c5078b2126a540', 'admin', '2020-04-21 08:29:09', 1, '', '127.0.0.1', 0, '2020-04-21 08:28:52');
INSERT INTO `sys_user_login_log` VALUES ('939e87cd988680c70362ceca759ffb63', 'admin', '2023-06-05 16:57:32', 1, '', '127.0.0.1', 0, '2023-06-05 16:57:31');
INSERT INTO `sys_user_login_log` VALUES ('93fb9082712d7048cae2824ea44cc2ba', 'admin', '2020-10-27 09:01:09', 1, '', '127.0.0.1', 0, '2020-10-27 09:01:09');
INSERT INTO `sys_user_login_log` VALUES ('95da434b804c126da7d9fed67a517042', 'admin', '2020-09-07 09:35:11', 1, '', '127.0.0.1', 0, '2020-09-07 01:35:11');
INSERT INTO `sys_user_login_log` VALUES ('9654cf216af009044ac3643f01c4fe8e', 'admin', '2020-04-20 01:24:45', 1, '', '127.0.0.1', 0, '2020-04-20 01:24:30');
INSERT INTO `sys_user_login_log` VALUES ('9aad7cc58d386a89889ae9167771c834', 'admin', '2022-06-15 05:58:38', 1, '', '127.0.0.1', 0, '2022-06-15 13:58:37');
INSERT INTO `sys_user_login_log` VALUES ('9adf23f3fb0a312eff38f362a595ba34', 'admin', '2023-05-31 12:35:34', 1, '', '127.0.0.1', 0, '2023-05-31 12:35:33');
INSERT INTO `sys_user_login_log` VALUES ('9ebf1cd489ee585e34f6c3ce37656531', 'admin', '2023-05-31 09:57:02', 1, '', '127.0.0.1', 0, '2023-05-31 09:57:02');
INSERT INTO `sys_user_login_log` VALUES ('a0c82b03ddad56822d434a26256c9649', 'admin', '2020-09-05 06:50:41', 1, '', '127.0.0.1', 0, '2020-09-05 06:50:40');
INSERT INTO `sys_user_login_log` VALUES ('a23b01632231410e7ea122c7a9b7db1d', 'admin', '2022-06-17 01:14:40', 1, '', '127.0.0.1', 0, '2022-06-17 01:14:39');
INSERT INTO `sys_user_login_log` VALUES ('a308ff88816bdc2ac85067fadb31fd12', 'admin', '2022-06-16 08:44:05', 1, '', '127.0.0.1', 0, '2022-06-16 16:44:05');
INSERT INTO `sys_user_login_log` VALUES ('a5151665cad3cc85cd172e56b3dfcb21', 'admin', '2020-07-28 08:14:18', 1, '', '127.0.0.1', 0, '2020-07-28 08:14:19');
INSERT INTO `sys_user_login_log` VALUES ('a6aee0085324aa03b6e9701ba57a099e', 'admin', '2023-06-05 16:14:26', 1, '', '127.0.0.1', 0, '2023-06-05 16:14:26');
INSERT INTO `sys_user_login_log` VALUES ('a6d696ffdf5c9cff7353a7df3104d155', 'admin', '2023-05-31 10:57:06', 1, '', '127.0.0.1', 0, '2023-05-31 10:57:06');
INSERT INTO `sys_user_login_log` VALUES ('a70e9e01527e28e133d2ca83bd3494a2', 'admin', '2020-03-22 14:31:20', 1, '', '127.0.0.1', 0, '2020-03-22 14:31:19');
INSERT INTO `sys_user_login_log` VALUES ('a72a4c50f848972ca230931a4eed63da', 'admin', '2023-06-01 15:00:39', 1, '', '127.0.0.1', 0, '2023-06-01 15:00:38');
INSERT INTO `sys_user_login_log` VALUES ('a7b90e8b4ec766b08208a8268f47bebb', 'admin', '2020-07-24 07:55:40', 1, '', '127.0.0.1', 0, '2020-07-24 07:55:40');
INSERT INTO `sys_user_login_log` VALUES ('a7d30c3d9ae179372f7b61c8daebbbf7', 'admin', '2023-06-05 15:32:04', 1, '', '127.0.0.1', 0, '2023-06-05 15:32:04');
INSERT INTO `sys_user_login_log` VALUES ('a801e04054ab9741e588c3fb7e69e83e', 'admin', '2020-04-17 03:48:58', 1, '', '127.0.0.1', 0, '2020-04-17 03:48:57');
INSERT INTO `sys_user_login_log` VALUES ('a81b79189ae656ebf7d20d89c8041628', 'admin', '2020-05-14 10:38:15', 1, '', '127.0.0.1', 0, '2020-05-14 10:38:15');
INSERT INTO `sys_user_login_log` VALUES ('aa99518f88774439fe4c2067b01a9b84', 'admin', '2023-06-05 15:40:40', 1, '', '127.0.0.1', 0, '2023-06-05 15:40:40');
INSERT INTO `sys_user_login_log` VALUES ('ad12ae1becc67fa97c52e8d7d40633e3', 'admin', '2023-06-01 11:11:13', 1, '', '127.0.0.1', 0, '2023-06-01 11:11:12');
INSERT INTO `sys_user_login_log` VALUES ('b145c65c87ba643db149c8b6beccd130', 'admin', '2020-04-16 08:27:52', 1, '', '127.0.0.1', 0, '2020-04-16 08:27:51');
INSERT INTO `sys_user_login_log` VALUES ('b1fb5004dee11e82dff0d72d57df3626', 'admin', '2020-03-22 07:48:15', 1, '', '127.0.0.1', 0, '2020-03-22 07:48:22');
INSERT INTO `sys_user_login_log` VALUES ('b48f9d0e9f515c1d17f071d2ed4704c0', 'admin', '2023-06-05 14:52:23', 1, '', '127.0.0.1', 0, '2023-06-05 14:52:23');
INSERT INTO `sys_user_login_log` VALUES ('b4f7d0c03e18bf87fa3f213951b43d3b', 'admin', '2020-09-02 13:56:31', 1, '', '127.0.0.1', 0, '2020-09-02 13:56:31');
INSERT INTO `sys_user_login_log` VALUES ('b4f8d656477c03e2a49fc7887171b48e', 'admin', '2022-06-15 05:41:03', 1, '', '127.0.0.1', 0, '2022-06-15 13:41:03');
INSERT INTO `sys_user_login_log` VALUES ('b6d8e5ac6f8d72b2c18f08e9fae05630', 'admin', '2023-06-02 10:51:59', 1, '', '127.0.0.1', 0, '2023-06-02 10:51:59');
INSERT INTO `sys_user_login_log` VALUES ('b74edeee31db80390e46f89dbc9fdf41', 'admin', '2020-03-16 09:32:30', 1, '', '127.0.0.1', 0, '2020-03-16 09:32:29');
INSERT INTO `sys_user_login_log` VALUES ('b7d94ddce4a77ceeea6a370ddf1d2aa5', 'admin', '2023-05-29 11:18:30', 1, '', '127.0.0.1', 0, '2023-05-29 11:18:30');
INSERT INTO `sys_user_login_log` VALUES ('b7f8000fe979045af7e10d39ea1dbb67', 'admin', '2020-09-06 07:26:37', 1, '', '127.0.0.1', 0, '2020-09-06 07:26:36');
INSERT INTO `sys_user_login_log` VALUES ('b828bca859c7fb0f88377acc2275b6e7', 'admin', '2022-06-15 17:36:25', 1, '', '127.0.0.1', 0, '2022-06-16 01:36:24');
INSERT INTO `sys_user_login_log` VALUES ('ba90837c830756379a11c64b7f7810d8', 'admin', '2023-05-30 21:42:01', 1, '', '127.0.0.1', 0, '2023-05-30 21:42:00');
INSERT INTO `sys_user_login_log` VALUES ('bb45504c1adc6a543d66409ca83b896e', 'admin', '2023-06-05 16:38:26', 1, '', '127.0.0.1', 0, '2023-06-05 16:38:26');
INSERT INTO `sys_user_login_log` VALUES ('bb9a84401ea9ef247fba3d8f9b1ab17f', 'admin', '2023-06-01 14:48:11', 1, '', '127.0.0.1', 0, '2023-06-01 14:48:11');
INSERT INTO `sys_user_login_log` VALUES ('bba0f8e0cfb714e653d27f36df4a97cf', 'admin', '2023-06-01 09:09:20', 1, '', '127.0.0.1', 0, '2023-06-01 09:09:19');
INSERT INTO `sys_user_login_log` VALUES ('bfac8f36d08a8bd44a5a0cfab7fb04d3', 'admin', '2023-06-05 16:40:15', 1, '', '127.0.0.1', 0, '2023-06-05 16:40:14');
INSERT INTO `sys_user_login_log` VALUES ('c1bdfab2485e2ac3b23ab30fde0fd3ae', 'admin', '2023-05-31 08:56:21', 1, '', '127.0.0.1', 0, '2023-05-31 08:56:21');
INSERT INTO `sys_user_login_log` VALUES ('c24c4709d410cd9cd0b8b40df6649d54', 'admin', '2020-05-09 10:28:05', 1, '', '127.0.0.1', 0, '2020-05-09 10:28:04');
INSERT INTO `sys_user_login_log` VALUES ('c30e5cb927057b6fc0bf51334e564bca', 'admin', '2020-10-04 16:56:08', 1, '', '127.0.0.1', 0, '2020-10-04 16:56:08');
INSERT INTO `sys_user_login_log` VALUES ('c33623e3f32c73450dfcf1dffe584d0a', 'admin', '2022-06-17 00:44:28', 1, '', '127.0.0.1', 0, '2022-06-17 00:44:28');
INSERT INTO `sys_user_login_log` VALUES ('c46a8d34b15d4ad4fe8f0f7af496b1f0', 'admin', '2023-05-31 12:39:25', 1, '', '127.0.0.1', 0, '2023-05-31 12:39:25');
INSERT INTO `sys_user_login_log` VALUES ('c509b6a7b4e5c952dd496e5e7fa3ba1c', 'admin', '2023-06-02 08:16:20', 1, '', '127.0.0.1', 0, '2023-06-02 08:16:20');
INSERT INTO `sys_user_login_log` VALUES ('c61097b222f4dadaa952380d7398de3c', 'admin', '2020-05-08 01:32:24', 1, '', '127.0.0.1', 0, '2020-05-08 01:32:24');
INSERT INTO `sys_user_login_log` VALUES ('c70c1ba82ea33ae328ed0ad67516c602', 'admin', '2023-06-07 14:36:38', 1, '', '127.0.0.1', 0, '2023-06-07 14:36:38');
INSERT INTO `sys_user_login_log` VALUES ('c8154a5aebc25fde195fdd43bdf34bd5', 'admin', '2020-09-06 06:10:31', 1, '', '127.0.0.1', 0, '2020-09-06 06:10:31');
INSERT INTO `sys_user_login_log` VALUES ('c849f97a16a76bc7bb140be38338bb54', 'admin', '2020-04-30 03:54:07', 1, '', '127.0.0.1', 0, '2020-04-30 03:54:07');
INSERT INTO `sys_user_login_log` VALUES ('cb7fe436d5eda047194673b959fc3d2c', 'admin', '2020-09-03 02:22:31', 1, '', '127.0.0.1', 0, '2020-09-03 02:22:31');
INSERT INTO `sys_user_login_log` VALUES ('cbfb18140c7782f7d4667eaf12e3193c', 'admin', '2020-04-08 07:16:33', 1, '', '127.0.0.1', 0, '2020-04-08 07:16:33');
INSERT INTO `sys_user_login_log` VALUES ('cd223bb7037ba44b029d255b595b0dfb', 'admin', '2020-04-21 04:35:55', 1, '', '127.0.0.1', 0, '2020-04-21 04:35:54');
INSERT INTO `sys_user_login_log` VALUES ('cd40013d51d9d0b4c0a34f33224c2a60', 'admin', '2020-09-06 12:58:01', 1, '', '127.0.0.1', 0, '2020-09-06 12:58:00');
INSERT INTO `sys_user_login_log` VALUES ('cd9b7c1a81a6e4c7cec712eabba51754', 'admin', '2023-05-29 11:20:53', 1, '', '127.0.0.1', 0, '2023-05-29 11:20:53');
INSERT INTO `sys_user_login_log` VALUES ('cda34aa5bdd15ee7d48fdccacd83b4a0', 'admin', '2020-04-17 05:47:58', 1, '', '127.0.0.1', 0, '2020-04-17 05:47:57');
INSERT INTO `sys_user_login_log` VALUES ('d12016cb26e2a1011913e5212aef77bd', 'admin', '2023-06-06 15:10:13', 1, '', '127.0.0.1', 0, '2023-06-06 15:10:13');
INSERT INTO `sys_user_login_log` VALUES ('d33c5a4a11f200df21963807cb49a2f9', 'admin', '2020-08-10 07:42:49', 1, '', '127.0.0.1', 0, '2020-08-10 07:42:49');
INSERT INTO `sys_user_login_log` VALUES ('d502c7abd9e2a7b175a5f601c278d9f5', 'admin', '2023-05-31 10:02:40', 1, '', '127.0.0.1', 0, '2023-05-31 10:02:39');
INSERT INTO `sys_user_login_log` VALUES ('d51a42e39b1960e451629dc31c23108c', 'admin', '2023-06-05 15:35:38', 1, '', '127.0.0.1', 0, '2023-06-05 15:35:38');
INSERT INTO `sys_user_login_log` VALUES ('d7af21bae13e97c2b4bea9835ef0b821', 'admin', '2020-04-07 08:09:29', 1, '', '127.0.0.1', 0, '2020-04-07 08:09:28');
INSERT INTO `sys_user_login_log` VALUES ('d91c205f2f8d286cbb09c3956a202a29', 'dongfang', '2023-06-06 14:43:17', 1, '', '127.0.0.1', 0, '2023-06-06 14:43:16');
INSERT INTO `sys_user_login_log` VALUES ('d9424d2e32da2efdb5fe61d623e4fa4b', 'admin', '2020-04-13 02:27:27', 1, '', '127.0.0.1', 0, '2020-04-13 02:27:27');
INSERT INTO `sys_user_login_log` VALUES ('d9d3e92faf88f47df48bbe3ace5d65c3', 'admin', '2023-06-07 16:39:08', 1, '', '127.0.0.1', 0, '2023-06-07 16:39:07');
INSERT INTO `sys_user_login_log` VALUES ('dae9ecd906fa98f263503ca8b6ba401e', 'admin', '2023-06-05 15:56:13', 1, '', '127.0.0.1', 0, '2023-06-05 15:56:13');
INSERT INTO `sys_user_login_log` VALUES ('dbd801c02da60d76fd34185c11de89bd', 'admin', '2023-06-02 15:58:39', 1, '', '127.0.0.1', 0, '2023-06-02 15:58:38');
INSERT INTO `sys_user_login_log` VALUES ('dcf2acb7dcebfdec1ca8925f754a7b7e', 'admin', '2023-05-29 10:51:34', 1, '', '127.0.0.1', 0, '2023-05-29 10:51:34');
INSERT INTO `sys_user_login_log` VALUES ('de69c8e11839da7367493856d8181872', 'admin', '2023-06-06 14:43:08', 1, '', '127.0.0.1', 0, '2023-06-06 14:43:07');
INSERT INTO `sys_user_login_log` VALUES ('e08064bf29efaf98d74f7e63e81a5c9c', 'admin', '2020-05-08 07:16:06', 1, '', '127.0.0.1', 0, '2020-05-08 07:16:05');
INSERT INTO `sys_user_login_log` VALUES ('e1661e670cd6443ef80789969cb7e435', 'admin', '2020-08-11 02:06:04', 1, '', '127.0.0.1', 0, '2020-08-11 02:06:04');
INSERT INTO `sys_user_login_log` VALUES ('e36293c4d89f3b7a719df7fcd8934fc8', 'admin', '2020-05-18 07:37:28', 1, '', '127.0.0.1', 0, '2020-05-18 07:37:28');
INSERT INTO `sys_user_login_log` VALUES ('e372d36d0ff467532c85e88aaef2e533', 'admin', '2023-05-29 16:08:53', 1, '', '127.0.0.1', 0, '2023-05-29 16:08:53');
INSERT INTO `sys_user_login_log` VALUES ('e516a0cf0aa0bea184d057c4941adda7', 'admin', '2023-06-06 16:00:43', 1, '', '127.0.0.1', 0, '2023-06-06 16:00:42');
INSERT INTO `sys_user_login_log` VALUES ('e5ae35673b662dbc184495306b8422ef', 'admin', '2020-03-21 08:07:43', 1, '', '127.0.0.1', 0, '2020-03-21 08:07:50');
INSERT INTO `sys_user_login_log` VALUES ('e6912a9573b8b239f117ad5bc9db028a', 'admin', '2020-04-13 01:32:13', 1, '', '127.0.0.1', 0, '2020-04-13 01:32:12');
INSERT INTO `sys_user_login_log` VALUES ('e6a38ac29d445baeba19a859568a18f4', 'admin', '2020-04-16 08:16:55', 1, '', '127.0.0.1', 0, '2020-04-16 08:16:55');
INSERT INTO `sys_user_login_log` VALUES ('e7d33e96faa7fe9e6a53c279dda6c17c', 'admin', '2020-04-29 13:41:54', 1, '', '127.0.0.1', 0, '2020-04-29 13:41:54');
INSERT INTO `sys_user_login_log` VALUES ('e84d2feb21cc1e994876f2002a34cb6b', 'admin', '2023-06-02 09:31:54', 1, '', '127.0.0.1', 0, '2023-06-02 09:31:54');
INSERT INTO `sys_user_login_log` VALUES ('e9fe1a1336fd9d4782c24923a7eead7a', 'admin', '2023-06-06 15:19:15', 1, '', '127.0.0.1', 0, '2023-06-06 15:19:14');
INSERT INTO `sys_user_login_log` VALUES ('ea2921ce05f3ccbf70a12dd50bf4509e', 'admin', '2020-04-16 07:35:09', 1, '', '192.168.213.1', 0, '2020-04-16 07:34:59');
INSERT INTO `sys_user_login_log` VALUES ('ec6a7ff535ab3f96eebf2053cae375d2', 'admin', '2022-06-15 08:49:01', 1, '', '127.0.0.1', 0, '2022-06-15 16:49:00');
INSERT INTO `sys_user_login_log` VALUES ('edbb8d266c880d197240b860ff86ba0a', 'admin', '2020-08-31 02:25:10', 1, '', '127.0.0.1', 0, '2020-08-31 02:25:10');
INSERT INTO `sys_user_login_log` VALUES ('ee18d557afb7349495c67afa75906417', 'admin', '2020-05-07 08:21:56', 1, '', '127.0.0.1', 0, '2020-05-07 08:21:55');
INSERT INTO `sys_user_login_log` VALUES ('ef7f124ec6c7c3942d9a1aba39665f49', 'admin', '2022-06-15 16:51:11', 1, '', '127.0.0.1', 0, '2022-06-16 00:51:11');
INSERT INTO `sys_user_login_log` VALUES ('efef64abdb8ca07a513fc15bc77b895c', 'admin', '2023-06-02 17:24:20', 1, '', '127.0.0.1', 0, '2023-06-02 17:24:20');
INSERT INTO `sys_user_login_log` VALUES ('f024ec1a99b53db40fb95b62541e6af5', 'admin', '2020-04-16 09:01:37', 1, '', '127.0.0.1', 0, '2020-04-16 09:01:36');
INSERT INTO `sys_user_login_log` VALUES ('f083c8b3cb9048b1cd1cab0bffe95af2', 'admin', '2020-07-27 06:07:51', 1, '', '127.0.0.1', 0, '2020-07-27 06:07:51');
INSERT INTO `sys_user_login_log` VALUES ('f326b1dbac8f5e9d27460471bb6c84e2', 'admin', '2023-05-29 10:24:55', 1, '', '127.0.0.1', 0, '2023-05-29 10:24:55');
INSERT INTO `sys_user_login_log` VALUES ('f38820170d8239f64cb1e8457ef92451', 'admin', '2020-04-13 06:47:53', 1, '', '127.0.0.1', 0, '2020-04-13 06:47:53');
INSERT INTO `sys_user_login_log` VALUES ('f46da8c63d8241cb84017f5632bba9be', 'admin', '2020-04-16 08:25:34', 1, '', '127.0.0.1', 0, '2020-04-16 08:25:34');
INSERT INTO `sys_user_login_log` VALUES ('f5d39238b9bfc390b64cb1484a0cf3cd', 'admin', '2023-05-31 10:20:44', 1, '', '127.0.0.1', 0, '2023-05-31 10:20:44');
INSERT INTO `sys_user_login_log` VALUES ('f5e549f918dbb40cae3c4e509de307e9', 'admin', '2020-03-22 05:37:43', 1, '', '127.0.0.1', 0, '2020-03-22 05:37:49');
INSERT INTO `sys_user_login_log` VALUES ('f5ee046a81d4b09dee0ae3cdec2c192b', 'admin', '2023-06-02 08:58:24', 1, '', '127.0.0.1', 0, '2023-06-02 08:58:24');
INSERT INTO `sys_user_login_log` VALUES ('f7582da45d292a22eee00c891cc131d5', 'admin', '2023-06-05 15:24:24', 1, '', '127.0.0.1', 0, '2023-06-05 15:24:23');
INSERT INTO `sys_user_login_log` VALUES ('f7c8bd8aaf8089beb72bca735cd113a7', 'admin', '2023-06-01 10:41:32', 1, '', '127.0.0.1', 0, '2023-06-01 10:41:31');
INSERT INTO `sys_user_login_log` VALUES ('f85ca52cdced4a828244652621c545e5', 'admin', '2020-09-03 06:31:05', 1, '', '127.0.0.1', 0, '2020-09-03 06:31:05');
INSERT INTO `sys_user_login_log` VALUES ('f87997b3e1c66b655cbc13fa64d402cf', 'admin', '2023-06-02 08:14:38', 1, '', '127.0.0.1', 0, '2023-06-02 08:14:38');
INSERT INTO `sys_user_login_log` VALUES ('f879c550b45271dcce0890145401df5a', 'admin', '2022-06-16 15:18:47', 1, '', '127.0.0.1', 0, '2022-06-16 23:18:47');
INSERT INTO `sys_user_login_log` VALUES ('f8bbe3e8f0d58db1d326d3f32a7e942a', 'admin', '2023-06-01 08:19:49', 1, '', '127.0.0.1', 0, '2023-06-01 08:19:48');
INSERT INTO `sys_user_login_log` VALUES ('f92f12bce57641b35f0fe0925a370c3b', 'admin', '2023-05-29 10:53:01', 1, '', '127.0.0.1', 0, '2023-05-29 10:53:01');
INSERT INTO `sys_user_login_log` VALUES ('fe0026b5dd997924a181c7097d8658cf', 'admin', '2023-05-31 10:43:16', 1, '', '127.0.0.1', 0, '2023-05-31 10:43:16');
INSERT INTO `sys_user_login_log` VALUES ('ff391d6b12b15505f2788c2b0d115a64', 'admin', '2022-06-16 08:44:27', 1, '', '127.0.0.1', 0, '2022-06-16 16:44:27');
INSERT INTO `sys_user_login_log` VALUES ('ff8196eb08546adb5803330d4e6181b2', 'admin', '2023-06-02 09:37:07', 1, '', '127.0.0.1', 0, '2023-06-02 09:37:07');

-- ----------------------------
-- Table structure for sys_user_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_operation_log`;
CREATE TABLE `sys_user_operation_log`  (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `OPERATION_MODULE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作模块',
  `OPERATION_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `VISIT_METHOD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求方法',
  `PARAMETERS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '请求参数',
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP地址',
  `DURATION` int NOT NULL DEFAULT 0 COMMENT '执行时长',
  `OPERATION_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_operation_log
-- ----------------------------
INSERT INTO `sys_user_operation_log` VALUES ('0074431855b68e3c9626e7bf1029129c', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 124, '2020-04-17 02:18:00');
INSERT INTO `sys_user_operation_log` VALUES ('00a69cc7ea45f3f3220994520053d83b', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 63, '2020-05-09 10:29:11');
INSERT INTO `sys_user_operation_log` VALUES ('00b94d2c48510d0d54e3b880ad509b05', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 470, '2022-06-15 05:39:53');
INSERT INTO `sys_user_operation_log` VALUES ('00de95a8c310b8d85a77a52636887da6', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 85, '2023-05-30 21:43:24');
INSERT INTO `sys_user_operation_log` VALUES ('012e8a6abed5c49b07688ede2b0eabcb', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 205, '2020-07-27 07:00:58');
INSERT INTO `sys_user_operation_log` VALUES ('01320cb34192ca62853965e6c6eeb24f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1961, '2020-09-08 16:16:16');
INSERT INTO `sys_user_operation_log` VALUES ('01372ba0aec5ed4ad3d6444792491490', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"4444\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 226, '2020-11-07 17:40:50');
INSERT INTO `sys_user_operation_log` VALUES ('016f3d37559485b6a92ccc1d44c336a9', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 122, '2020-09-03 02:22:28');
INSERT INTO `sys_user_operation_log` VALUES ('01a4943114b794b8c0300f67409d01bb', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"4444\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 167, '2020-11-07 17:14:18');
INSERT INTO `sys_user_operation_log` VALUES ('01baa4f027fab3fcf61ba0e4dfe9e143', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 154, '2023-06-05 16:12:42');
INSERT INTO `sys_user_operation_log` VALUES ('01c3df89f36873424087800909ad9278', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 182, '2020-04-13 07:14:50');
INSERT INTO `sys_user_operation_log` VALUES ('01d002e397db4a36156f736e1bc9673b', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 436, '2020-04-29 14:49:51');
INSERT INTO `sys_user_operation_log` VALUES ('0264280c94a921dd3cd2c4fe346f362c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 228, '2020-10-24 03:56:50');
INSERT INTO `sys_user_operation_log` VALUES ('0286f935ca6a1797eb0e7eea26b5025c', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 27, '2022-06-17 01:07:13');
INSERT INTO `sys_user_operation_log` VALUES ('02b55cf68ae60dd095263c89b403c865', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 27, '2020-11-07 17:06:03');
INSERT INTO `sys_user_operation_log` VALUES ('0311a31519543be7841fd7d4664ab4c6', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 156, '2020-04-13 07:22:18');
INSERT INTO `sys_user_operation_log` VALUES ('033d734bb768782c704ff34adf0579e6', 'root', '用户管理', '列表', 'page', '{\"phone\":\"\",\"nickName\":\"\",\"disable\":\"\",\"roles\":\"\",\"limit\":\"10\",\"deptId\":\"1325121829601280001\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 25, '2022-06-17 01:13:53');
INSERT INTO `sys_user_operation_log` VALUES ('04248b781f9a61882ea36b37ee7c6832', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 146, '2023-06-02 09:37:07');
INSERT INTO `sys_user_operation_log` VALUES ('04864abcb331b5deb821a40b0b5b3fb1', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 57, '2020-09-06 22:11:27');
INSERT INTO `sys_user_operation_log` VALUES ('04af6d6b697264431933335481b9afd5', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 306, '2020-09-06 12:58:01');
INSERT INTO `sys_user_operation_log` VALUES ('04e126f6bd1bfa5f228cd37ef4b1b5dc', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 91, '2020-09-07 09:44:02');
INSERT INTO `sys_user_operation_log` VALUES ('0517d3438e491a17c7b478a02a66fe7c', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-05-08 02:31:35');
INSERT INTO `sys_user_operation_log` VALUES ('05574a6591ffb74d70008b4ce256e5e3', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 77, '2020-05-08 03:47:21');
INSERT INTO `sys_user_operation_log` VALUES ('0559b8843d0878b9dcb6ce3ad44ce4f0', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 353, '2023-06-03 13:28:32');
INSERT INTO `sys_user_operation_log` VALUES ('057edb414bf8388b9cd970971eac52e4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 466, '2023-06-05 15:20:42');
INSERT INTO `sys_user_operation_log` VALUES ('059a77fd19408ddf7a202a2ce6bd529d', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"1325123225058803713\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 12, '2022-06-15 05:40:50');
INSERT INTO `sys_user_operation_log` VALUES ('05a8c7f66a106030379d465d3c9de6de', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 78, '2020-09-03 02:22:24');
INSERT INTO `sys_user_operation_log` VALUES ('05ec6e534c8c505fb5af8e434c7657fe', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 5, '2023-05-29 10:25:16');
INSERT INTO `sys_user_operation_log` VALUES ('0619088f841db7c39cd0b8aac1d703ff', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 22, '2020-10-27 09:01:26');
INSERT INTO `sys_user_operation_log` VALUES ('062a7346f6b2b4bfeac07588ea8945d2', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000411\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 82, '2020-11-07 17:01:54');
INSERT INTO `sys_user_operation_log` VALUES ('069fd03016ff21c992ef9ed4ac857a3b', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 13, '2023-05-31 10:57:40');
INSERT INTO `sys_user_operation_log` VALUES ('06d7d88d74b66de733fc15bdd552dc7d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 355, '2020-04-07 07:01:08');
INSERT INTO `sys_user_operation_log` VALUES ('0711a1501ac7eeead3cac9dc384ab021', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 556, '2020-10-27 09:01:05');
INSERT INTO `sys_user_operation_log` VALUES ('076c57e1dc2e0e786f72db44bbca4a9b', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-05-08 01:55:57');
INSERT INTO `sys_user_operation_log` VALUES ('07eb163c75ff8afbbf02eee440c7f9b0', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 414, '2023-06-07 16:57:12');
INSERT INTO `sys_user_operation_log` VALUES ('085de7a14eec7ce860bc5f33b1fe063a', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 80, '2020-04-07 08:20:26');
INSERT INTO `sys_user_operation_log` VALUES ('0889dbaa38d6fb738bb1dcc80986cf1d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 129, '2020-10-04 16:56:07');
INSERT INTO `sys_user_operation_log` VALUES ('0955cb28e8b8269d5f72d7c3560f4bf3', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 12, '2022-06-17 01:17:06');
INSERT INTO `sys_user_operation_log` VALUES ('097d43cb39771fdbcd63cc96e708eb10', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 169, '2020-04-13 06:51:24');
INSERT INTO `sys_user_operation_log` VALUES ('09b0ea5258137822ff1ce93bd26c47eb', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 35, '2020-11-07 17:09:04');
INSERT INTO `sys_user_operation_log` VALUES ('09f507d2156bf5d75b1c1fa2f97ed227', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 22, '2020-04-07 07:01:59');
INSERT INTO `sys_user_operation_log` VALUES ('0a00833326cd35adb7e6e3a8e2f86d45', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"deptId\":\"OR1200000703\",\"page\":\"1\"}', '127.0.0.1', 208, '2020-04-16 08:58:16');
INSERT INTO `sys_user_operation_log` VALUES ('0a092787e1646ae021e50748d6320061', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 74, '2020-04-13 07:42:39');
INSERT INTO `sys_user_operation_log` VALUES ('0a1bd88603a61c412e36e86c5399b97b', 'admin', '登录模块', '用户登录', 'login', '{}', '192.168.250.1', 595, '2020-09-06 21:26:08');
INSERT INTO `sys_user_operation_log` VALUES ('0a99d461f22d43cd159f9730d277cf5c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 229, '2020-04-17 03:49:02');
INSERT INTO `sys_user_operation_log` VALUES ('0a9c0aae3c4eb8431679249c909010a3', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 23, '2023-05-29 10:24:55');
INSERT INTO `sys_user_operation_log` VALUES ('0abd079435da9d876343a6abb74760c2', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 199, '2020-11-07 17:10:28');
INSERT INTO `sys_user_operation_log` VALUES ('0ad5c43d7ed8ff92c84d6ee615aee20b', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"1233333333333\"}', '127.0.0.1', 59, '2020-10-04 16:56:15');
INSERT INTO `sys_user_operation_log` VALUES ('0ae4feb4c620db3affa96f7ab2f7e76b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 148, '2020-05-07 10:00:57');
INSERT INTO `sys_user_operation_log` VALUES ('0b3508303a1860f0a5991862af74eeec', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 274, '2020-04-13 02:45:22');
INSERT INTO `sys_user_operation_log` VALUES ('0b4df3abf4c87c402289a1214244e0ae', 'admin', 'TbVisit', '修改', 'update', '{}', '127.0.0.1', 8, '2023-06-06 15:59:00');
INSERT INTO `sys_user_operation_log` VALUES ('0c22846c37e72ecaf9d4e1177f4dbf86', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 83, '2020-04-17 07:38:00');
INSERT INTO `sys_user_operation_log` VALUES ('0c22eb5714d002415130d01e5d5f57a4', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"1\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 60, '2020-05-09 10:30:16');
INSERT INTO `sys_user_operation_log` VALUES ('0c291fc1b222199873e3bd91137f01ce', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 216, '2020-03-22 07:48:14');
INSERT INTO `sys_user_operation_log` VALUES ('0c4497cb1c07f9bf2a005b5178800584', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 409, '2023-06-01 10:41:31');
INSERT INTO `sys_user_operation_log` VALUES ('0c54ddc67d9c05a289f264328fa6724d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 62974, '2023-05-29 10:55:06');
INSERT INTO `sys_user_operation_log` VALUES ('0cef947a17a1ec03ef8fca97f17aa872', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 37, '2022-06-16 08:44:24');
INSERT INTO `sys_user_operation_log` VALUES ('0d5a37a22abb18e815b818f98e7bcd54', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 152, '2020-09-07 09:34:33');
INSERT INTO `sys_user_operation_log` VALUES ('0db94968c818bde35d96d0cb2a788d6a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 166, '2023-06-07 15:49:10');
INSERT INTO `sys_user_operation_log` VALUES ('0dfad5f0f3dcc38b5a19a7c50a111590', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000575\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 83, '2020-11-07 17:01:55');
INSERT INTO `sys_user_operation_log` VALUES ('0e67dfa410f0bc7b46784867cc804e04', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 29, '2020-05-18 07:40:32');
INSERT INTO `sys_user_operation_log` VALUES ('0e7e0194893f9ca69602134bbb9564e9', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 77, '2020-05-08 03:52:05');
INSERT INTO `sys_user_operation_log` VALUES ('0f9e8b0829ad9b4aad351e0b4845e7d6', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 5, '2022-06-16 06:43:12');
INSERT INTO `sys_user_operation_log` VALUES ('0fe4b9cd60904b4ecb83662c5a194caf', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 449, '2023-06-01 14:02:03');
INSERT INTO `sys_user_operation_log` VALUES ('1025f2ebd2cef0a38d358baeac1ab23a', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 232, '2020-04-21 09:55:09');
INSERT INTO `sys_user_operation_log` VALUES ('104c26df38c0822bb83b2256614f2ef3', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 31, '2020-11-07 17:06:03');
INSERT INTO `sys_user_operation_log` VALUES ('105672a4ce35b5b7a1bcd34a5ba0ba62', 'Anonymous', '查询用户列表', 'openApi', 'userList', '{\"id\":\"0\"}', '127.0.0.1', 86, '2020-09-07 13:49:19');
INSERT INTO `sys_user_operation_log` VALUES ('1066481da820920a9a4106332f9cb749', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 543, '2020-04-20 07:30:17');
INSERT INTO `sys_user_operation_log` VALUES ('107441d9fa2075a8ebe603f2657d8a59', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 175, '2020-09-05 11:43:54');
INSERT INTO `sys_user_operation_log` VALUES ('10bbbddbd631d483d67534a48e8cba82', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 17, '2022-06-17 01:07:14');
INSERT INTO `sys_user_operation_log` VALUES ('11024140164aa0bb85a4fcfdc01f4ae6', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 5, '2023-05-31 09:29:59');
INSERT INTO `sys_user_operation_log` VALUES ('111c8f7dcf3803521b9f0b12a16a9269', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-04-07 08:20:27');
INSERT INTO `sys_user_operation_log` VALUES ('112d673aa23c00ef6efa68b36c82e21b', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 62, '2020-05-08 02:28:38');
INSERT INTO `sys_user_operation_log` VALUES ('115bfc752995c53abcf8aa60080d5965', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 724, '2023-06-05 16:39:41');
INSERT INTO `sys_user_operation_log` VALUES ('118efda1a2f347c83aa6ee5ff7d24b09', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 119, '2022-06-16 06:42:46');
INSERT INTO `sys_user_operation_log` VALUES ('11939cbc20e00348770a5e08a04a4f8d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 151, '2023-06-01 14:48:12');
INSERT INTO `sys_user_operation_log` VALUES ('12100fb62f6c232b359cb9d98089e376', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"东莞分公司\",\"deptId\":\"OR1200000387\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 73, '2020-08-20 09:13:20');
INSERT INTO `sys_user_operation_log` VALUES ('12312a83b5238a4534097b37e426cb1b', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 12, '2022-06-15 05:40:20');
INSERT INTO `sys_user_operation_log` VALUES ('1241897757699440641', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 3120, '2020-03-23 01:21:13');
INSERT INTO `sys_user_operation_log` VALUES ('1241897766708805634', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 416, '2020-03-23 01:21:16');
INSERT INTO `sys_user_operation_log` VALUES ('1241904177006215170', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 97, '2020-03-23 01:46:44');
INSERT INTO `sys_user_operation_log` VALUES ('1241904298750083073', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 85, '2020-03-23 01:47:13');
INSERT INTO `sys_user_operation_log` VALUES ('1241904424012972033', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 85, '2020-03-23 01:47:43');
INSERT INTO `sys_user_operation_log` VALUES ('1241916917468856321', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 190, '2020-03-23 02:37:21');
INSERT INTO `sys_user_operation_log` VALUES ('1241918640799318017', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 121, '2020-03-23 02:44:12');
INSERT INTO `sys_user_operation_log` VALUES ('1241929379144499202', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 169, '2020-03-23 03:26:53');
INSERT INTO `sys_user_operation_log` VALUES ('1241929388946587649', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 118, '2020-03-23 03:26:55');
INSERT INTO `sys_user_operation_log` VALUES ('1241935624421212162', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 174, '2020-03-23 03:51:42');
INSERT INTO `sys_user_operation_log` VALUES ('1242721743962316802', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 2451, '2020-03-25 07:55:27');
INSERT INTO `sys_user_operation_log` VALUES ('1242721762664718338', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 466, '2020-03-25 07:55:32');
INSERT INTO `sys_user_operation_log` VALUES ('1242750888872189953', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 210, '2020-03-25 09:51:16');
INSERT INTO `sys_user_operation_log` VALUES ('1242750895004262401', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 135, '2020-03-25 09:51:17');
INSERT INTO `sys_user_operation_log` VALUES ('1242750942857076737', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 91, '2020-03-25 09:51:29');
INSERT INTO `sys_user_operation_log` VALUES ('124bd38fe152c2aca61f448a858f91b5', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 147, '2020-03-16 09:12:34');
INSERT INTO `sys_user_operation_log` VALUES ('125e4fd2776e27e078da930ae51ee29f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 190, '2020-04-13 02:28:49');
INSERT INTO `sys_user_operation_log` VALUES ('1262284477498368001', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2727, '2020-05-18 07:30:46');
INSERT INTO `sys_user_operation_log` VALUES ('1262284484335083522', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 468, '2020-05-18 07:30:48');
INSERT INTO `sys_user_operation_log` VALUES ('1262284696067743746', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 102, '2020-05-18 07:31:38');
INSERT INTO `sys_user_operation_log` VALUES ('1291ccec0fa6edf6de19590334afb35a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 146, '2023-06-02 09:08:40');
INSERT INTO `sys_user_operation_log` VALUES ('12b5e068a74f74e19f8dd4b8d732326e', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 132, '2020-05-08 02:30:34');
INSERT INTO `sys_user_operation_log` VALUES ('12d35c86f94aea266a5e715ea9412f2c', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 4, '2022-06-16 08:44:34');
INSERT INTO `sys_user_operation_log` VALUES ('12d7ec1668da3098ad97c3b36ffb90d6', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 142, '2020-04-21 10:07:28');
INSERT INTO `sys_user_operation_log` VALUES ('132e9584268c62f9f78d1192137bf2f9', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 153, '2020-09-02 07:50:14');
INSERT INTO `sys_user_operation_log` VALUES ('133f472460d13d5c2cf64e019478c943', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 538, '2023-05-29 11:20:52');
INSERT INTO `sys_user_operation_log` VALUES ('1358a292523f94f5ababbcc454e403c2', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 224, '2020-04-21 09:52:16');
INSERT INTO `sys_user_operation_log` VALUES ('13c624ab6e368c9a8dc79b17114d7dbc', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 151, '2020-09-06 21:50:31');
INSERT INTO `sys_user_operation_log` VALUES ('148308cf53c6fa780a5d0d8006ddf225', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 527, '2023-05-31 10:40:50');
INSERT INTO `sys_user_operation_log` VALUES ('14d0d0a46952875d1ad19de0dc83bc42', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 27, '2022-06-17 01:13:20');
INSERT INTO `sys_user_operation_log` VALUES ('15212da0c1f0527419fdf8d7d0610b9e', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 144, '2020-11-07 16:58:18');
INSERT INTO `sys_user_operation_log` VALUES ('15a3f660deffb51909913cab0d3fb6a5', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 10, '2022-06-16 08:44:58');
INSERT INTO `sys_user_operation_log` VALUES ('15ff0c825c7327ef19d62b74d142d68c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 96, '2020-05-07 05:37:13');
INSERT INTO `sys_user_operation_log` VALUES ('166e689dbc1eed59a4b9b6df29284afa', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 19, '2023-05-29 10:53:01');
INSERT INTO `sys_user_operation_log` VALUES ('16a682b081c9cb3a10149ef136dec196', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 271, '2020-07-30 06:56:59');
INSERT INTO `sys_user_operation_log` VALUES ('16c8b0d77e087485274ecb91ddbb789b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 166, '2023-06-02 15:58:39');
INSERT INTO `sys_user_operation_log` VALUES ('16e563feb6c0c6bfdabca924b670b01e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 539, '2023-06-05 16:37:20');
INSERT INTO `sys_user_operation_log` VALUES ('1714892a623bde4b12d28767c21e9c75', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 187, '2020-04-13 08:06:13');
INSERT INTO `sys_user_operation_log` VALUES ('17284e6ccae587a77b73d06dd5408108', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 200, '2020-04-13 07:24:48');
INSERT INTO `sys_user_operation_log` VALUES ('17310e860097578d67121d257dd6795a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 145, '2020-10-24 03:46:52');
INSERT INTO `sys_user_operation_log` VALUES ('174181883a7aae73be89a56e46f7ec06', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 756, '2023-06-05 14:52:23');
INSERT INTO `sys_user_operation_log` VALUES ('17b551eae1fc61d6b497d73c94636d7c', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 7, '2022-06-17 01:17:30');
INSERT INTO `sys_user_operation_log` VALUES ('17daed0990b31e1a19a01e719e9e1f40', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000703\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 93, '2020-05-18 07:40:47');
INSERT INTO `sys_user_operation_log` VALUES ('17ffef9c08409af127b7a0121ed0d222', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 231, '2020-03-21 08:07:44');
INSERT INTO `sys_user_operation_log` VALUES ('1801a7bf86db2a0a1e7388d27235c400', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 194, '2020-11-07 17:14:02');
INSERT INTO `sys_user_operation_log` VALUES ('188d2b80c19f593cd4a77d7824428040', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 149, '2023-06-05 16:38:26');
INSERT INTO `sys_user_operation_log` VALUES ('19455bb927987042e3af485a90eecb08', 'admin', '数据字典', '导出', 'export', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 215, '2020-07-24 07:56:05');
INSERT INTO `sys_user_operation_log` VALUES ('19d11d1ad127f7214128cd70295c50af', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1901, '2020-04-17 01:40:45');
INSERT INTO `sys_user_operation_log` VALUES ('19fce692f5dfdcfe75dda96b03e2f2e3', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 507, '2023-05-31 08:56:19');
INSERT INTO `sys_user_operation_log` VALUES ('1a2843673933b9972b31ce31927502a1', 'admin', 'TbCustomer', '删除', 'delete', '{}', '127.0.0.1', 20, '2023-06-02 10:52:06');
INSERT INTO `sys_user_operation_log` VALUES ('1a2a0f414c1a9b6291bab11a8175e6f3', 'admin', '用户管理', '用户模板', 'template', '{}', '127.0.0.1', 151, '2020-03-16 08:10:43');
INSERT INTO `sys_user_operation_log` VALUES ('1a6244c89acad131b6552cfa2187110c', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 21, '2022-06-15 09:39:02');
INSERT INTO `sys_user_operation_log` VALUES ('1aebffcad797fd5db9180631a91ecb3e', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 8, '2023-05-31 11:05:12');
INSERT INTO `sys_user_operation_log` VALUES ('1aeebd90bf64cbdeacacf4af37622fe6', 'admin', 'TbCustLinkman', '删除', 'delete', '{}', '127.0.0.1', 6, '2023-05-31 12:40:33');
INSERT INTO `sys_user_operation_log` VALUES ('1b0c32566e36530e54433bb6d804281c', 'admin', '用户管理', '用户模板', 'template', '{}', '127.0.0.1', 6566, '2020-03-16 08:04:25');
INSERT INTO `sys_user_operation_log` VALUES ('1b1bdd4d27c0887b15fc01303704a32e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 262, '2020-04-07 08:50:12');
INSERT INTO `sys_user_operation_log` VALUES ('1b771bfdf5371328dd141c7b53753086', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 152, '2023-06-06 15:10:13');
INSERT INTO `sys_user_operation_log` VALUES ('1b86b43278499c00713d8705219a7295', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 193, '2020-04-29 13:45:25');
INSERT INTO `sys_user_operation_log` VALUES ('1be4eaf21cb3c18f931f5b2eccab6dd4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 344, '2020-04-21 09:51:53');
INSERT INTO `sys_user_operation_log` VALUES ('1c04aab67767c755c9015650f1620a40', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 157, '2020-10-24 03:50:38');
INSERT INTO `sys_user_operation_log` VALUES ('1c1edd4a83f1c25f22dccd96d98cd279', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 391, '2023-06-05 15:40:38');
INSERT INTO `sys_user_operation_log` VALUES ('1c89aa2fba3e3f1e2f81037b26035d90', 'admin', 'TbCustomer', '新增', 'save', '{}', '127.0.0.1', 14, '2023-06-06 15:22:10');
INSERT INTO `sys_user_operation_log` VALUES ('1ce2c3761715af377f43e78a797193cf', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 856, '2020-08-01 06:07:15');
INSERT INTO `sys_user_operation_log` VALUES ('1d4afa72659fb2a7553bae6c58bd29dc', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 201, '2023-06-02 08:09:35');
INSERT INTO `sys_user_operation_log` VALUES ('1d770adea74d75a06b0ec9636b5fd7a9', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 217, '2023-06-02 08:36:08');
INSERT INTO `sys_user_operation_log` VALUES ('1d7a4b79bf872c1c034dfd7e6aa7771b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 303, '2020-07-30 06:56:55');
INSERT INTO `sys_user_operation_log` VALUES ('1d950a345a7b59c1b0e7fb561fbea5b8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 178, '2020-09-03 01:43:58');
INSERT INTO `sys_user_operation_log` VALUES ('1dd2ea12f4f381622bd6d3cf0696198c', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 5, '2023-05-31 11:10:42');
INSERT INTO `sys_user_operation_log` VALUES ('1e2dde8946db4379a02dae994753d017', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 9, '2023-06-06 15:40:40');
INSERT INTO `sys_user_operation_log` VALUES ('1e79a7224d0e74776c2f9e9608a30e46', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 143, '2020-10-24 03:50:31');
INSERT INTO `sys_user_operation_log` VALUES ('1ecc717a4b05496e0f73ee4e6384eae0', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 503, '2023-06-05 15:31:59');
INSERT INTO `sys_user_operation_log` VALUES ('1f57ff8d03e2959c86f234f43585b6c9', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 56, '2020-05-08 03:05:30');
INSERT INTO `sys_user_operation_log` VALUES ('1f7740cbf9795fa9af4c73b69ec1ceab', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 392, '2023-06-02 09:05:23');
INSERT INTO `sys_user_operation_log` VALUES ('1f81c949841f2be0bfec519c7ec21446', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 189, '2023-05-31 10:01:07');
INSERT INTO `sys_user_operation_log` VALUES ('1fb7f878ade92f67f29df4375f181f58', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 86, '2023-05-29 10:11:43');
INSERT INTO `sys_user_operation_log` VALUES ('202ed0483eed7903f757a4cec9a44340', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 360, '2023-06-07 16:39:54');
INSERT INTO `sys_user_operation_log` VALUES ('20c001f01ebe1685879a06079f67aa28', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 359, '2020-05-08 07:16:06');
INSERT INTO `sys_user_operation_log` VALUES ('20c09559de15178066f97f6eeb082c4e', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 77, '2020-04-15 07:13:33');
INSERT INTO `sys_user_operation_log` VALUES ('20c35223d2b9615f615794ebeb509bd8', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 86, '2020-10-24 03:56:46');
INSERT INTO `sys_user_operation_log` VALUES ('20ed77489a6a81a195c89851c8b3610f', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 369, '2023-06-07 16:39:07');
INSERT INTO `sys_user_operation_log` VALUES ('215273565d75c258c6dbba747b736a80', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1900, '2020-05-14 10:38:15');
INSERT INTO `sys_user_operation_log` VALUES ('21921c2bd8bd226fbd38567816dfef10', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 210, '2020-03-22 05:37:41');
INSERT INTO `sys_user_operation_log` VALUES ('21a8a6a018789886d408da395e3bfc70', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 551, '2023-06-06 14:26:06');
INSERT INTO `sys_user_operation_log` VALUES ('21af0d68689270da8f49b1f3eb75982f', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 24, '2020-11-07 17:09:31');
INSERT INTO `sys_user_operation_log` VALUES ('21c48c892305403a62a3954a8f68d89c', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 8, '2023-05-31 09:09:25');
INSERT INTO `sys_user_operation_log` VALUES ('21ce954cf3b14b242a2d3050b367b61e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 102, '2020-04-13 06:47:53');
INSERT INTO `sys_user_operation_log` VALUES ('21d5c25f24b81c9f66a7d190e284c17c', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 16, '2023-06-02 10:31:31');
INSERT INTO `sys_user_operation_log` VALUES ('22e0b78d2f7181a65cf179e846e90fad', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 391, '2023-05-31 12:38:28');
INSERT INTO `sys_user_operation_log` VALUES ('230aa351157e3647542d443b81991710', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 415, '2020-05-06 15:13:14');
INSERT INTO `sys_user_operation_log` VALUES ('230d0d2f65724cb2d8fe7b25144c62ff', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 927, '2020-07-28 09:12:12');
INSERT INTO `sys_user_operation_log` VALUES ('2365d040128d23491ab702070cbe6210', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:09:58');
INSERT INTO `sys_user_operation_log` VALUES ('23b2bd64eb5f4214055fd247ca2edcf1', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 979, '2022-06-15 17:40:35');
INSERT INTO `sys_user_operation_log` VALUES ('244726676226a1e67001e4719288c5e3', 'admin', '机构管理', '新增', 'save', '{}', '127.0.0.1', 61, '2020-11-07 17:09:57');
INSERT INTO `sys_user_operation_log` VALUES ('24548129997629b5ac88858c3a9371d5', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 72, '2020-08-12 01:51:21');
INSERT INTO `sys_user_operation_log` VALUES ('24c0e1dbe7777ac7a22ac36b3e2d8479', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 301, '2020-09-06 13:20:24');
INSERT INTO `sys_user_operation_log` VALUES ('24c48be53ba5c4b2c2c135afad2391a8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 360, '2023-05-31 12:39:25');
INSERT INTO `sys_user_operation_log` VALUES ('252e3281a1570415412edecc8c951973', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 7, '2023-05-31 09:29:11');
INSERT INTO `sys_user_operation_log` VALUES ('2539eb0bcd3b571a5e3144daf7f668fe', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 458, '2023-06-07 15:48:51');
INSERT INTO `sys_user_operation_log` VALUES ('25475d1ecf2a7461b241eb125df36fd4', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 69, '2020-05-07 05:45:50');
INSERT INTO `sys_user_operation_log` VALUES ('25d2892b67f5482358800344e831f340', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 172, '2020-05-07 10:00:57');
INSERT INTO `sys_user_operation_log` VALUES ('260f96306ac8044ed8b60a203d3cbbab', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 155, '2023-06-01 14:26:38');
INSERT INTO `sys_user_operation_log` VALUES ('262b9e70381478bc32b5a0177c41800f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1373, '2020-11-06 08:18:45');
INSERT INTO `sys_user_operation_log` VALUES ('2735d5e21f16d166f6705e6553df1b5e', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 524, '2023-05-31 09:57:01');
INSERT INTO `sys_user_operation_log` VALUES ('274ede9e91fcbe1b078a1eb92ec953ae', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 139, '2023-06-01 09:29:54');
INSERT INTO `sys_user_operation_log` VALUES ('2759870138181c90bfe9fbb16a2c6a5e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1510, '2020-05-08 09:08:07');
INSERT INTO `sys_user_operation_log` VALUES ('275ca203c095ea812820e60208071431', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 24, '2020-11-07 17:04:40');
INSERT INTO `sys_user_operation_log` VALUES ('2768fa165632df16b9f052229ca86028', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1425, '2020-10-24 03:54:48');
INSERT INTO `sys_user_operation_log` VALUES ('2776c314ed47f9500b61e1a9eea9db16', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 109, '2020-04-21 10:07:38');
INSERT INTO `sys_user_operation_log` VALUES ('283ceac66ed02eadc441f7a91ae7683c', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 25, '2020-05-09 10:29:20');
INSERT INTO `sys_user_operation_log` VALUES ('29fd5a2a354fb21c34a00c7c159257aa', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 400, '2023-06-02 10:56:58');
INSERT INTO `sys_user_operation_log` VALUES ('2a2a6c557f983d5863df6a1f62661818', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"chen\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 51, '2020-05-09 10:30:11');
INSERT INTO `sys_user_operation_log` VALUES ('2a8077e7672342890de6220c6881cbbe', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 411, '2023-06-05 16:14:25');
INSERT INTO `sys_user_operation_log` VALUES ('2a83ae50444dc6e60eeb5651a7a2d54b', 'admin', 'demo', '修改', 'update', '{}', '127.0.0.1', 6, '2022-06-15 06:08:04');
INSERT INTO `sys_user_operation_log` VALUES ('2ae77708cb059ed90988972dfcc74382', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 170, '2020-05-07 10:01:03');
INSERT INTO `sys_user_operation_log` VALUES ('2aebab6abf8eada17b15aaad7a2f148f', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000387\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 86, '2020-11-07 17:01:54');
INSERT INTO `sys_user_operation_log` VALUES ('2b0d9201051d32cd757919089188e9cb', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 122, '2020-08-31 02:26:13');
INSERT INTO `sys_user_operation_log` VALUES ('2b1ddf6e443eb93726c7e418b614a674', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 21, '2022-06-17 01:14:39');
INSERT INTO `sys_user_operation_log` VALUES ('2c1acd52ca63e9f454044455f96b7825', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1649, '2020-10-24 03:46:45');
INSERT INTO `sys_user_operation_log` VALUES ('2c4f69117cd984d32bea2ed3e43cd133', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 271, '2020-05-07 09:22:55');
INSERT INTO `sys_user_operation_log` VALUES ('2c617d5552973f6ac9105354d463659b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 207, '2023-05-31 09:57:03');
INSERT INTO `sys_user_operation_log` VALUES ('2cb327b4c009dffca042824cb5fe8f49', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 231, '2020-04-13 01:36:30');
INSERT INTO `sys_user_operation_log` VALUES ('2d101e74386ddbbc7d83b551fc7c54ac', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 90, '2020-09-06 12:58:17');
INSERT INTO `sys_user_operation_log` VALUES ('2d18f48d0cf48d4a7a18f7dee4b5dec6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 273, '2020-03-22 13:13:15');
INSERT INTO `sys_user_operation_log` VALUES ('2d2b3e4ffd15f50de89c6dff618ff52f', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"1325121829601280001\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 95, '2020-11-07 17:14:17');
INSERT INTO `sys_user_operation_log` VALUES ('2d32fa9173a5c9b48219a1e94112b4de', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 19, '2023-05-29 10:52:50');
INSERT INTO `sys_user_operation_log` VALUES ('2d405ae8ae4313d1dd0e74c794c8b57e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 150, '2023-06-05 16:22:44');
INSERT INTO `sys_user_operation_log` VALUES ('2d5adfaddcc9e9ab898e0ff6e1569daf', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 369, '2023-06-01 14:07:15');
INSERT INTO `sys_user_operation_log` VALUES ('2d6ce7b848f14f0bc2a85bff50fa5b30', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 298, '2020-07-26 08:57:41');
INSERT INTO `sys_user_operation_log` VALUES ('2eac7ede53efaa7f40b0a7b6428a50d1', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 66, '2020-07-24 07:55:54');
INSERT INTO `sys_user_operation_log` VALUES ('2f00d66e935ad155790a0cccfbdd31a5', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"4444\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 84, '2020-11-07 17:08:37');
INSERT INTO `sys_user_operation_log` VALUES ('2f03013753aac532c14bc031aaaa83e3', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 226, '2020-04-07 09:01:20');
INSERT INTO `sys_user_operation_log` VALUES ('2f6f655db029795832504c890aba0767', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 266, '2020-04-08 07:47:17');
INSERT INTO `sys_user_operation_log` VALUES ('2fdf3dc398b64971fde460338948920b', 'root', '用户管理', '修改', 'update', '{}', '127.0.0.1', 16, '2022-06-17 01:14:10');
INSERT INTO `sys_user_operation_log` VALUES ('3032c761112606bb36e355ff2f19b380', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 809, '2020-04-16 08:16:55');
INSERT INTO `sys_user_operation_log` VALUES ('30dd74b546dee4023b3260e4f3b798dd', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 174, '2020-05-07 04:36:40');
INSERT INTO `sys_user_operation_log` VALUES ('30e76e6bc43b296c09b1b8eabb2785b7', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 264, '2020-05-14 03:12:40');
INSERT INTO `sys_user_operation_log` VALUES ('3106bc1d7cd58c932aac9bbdaa375654', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 80, '2020-05-09 10:30:44');
INSERT INTO `sys_user_operation_log` VALUES ('31965aead5f72e3122d2a4b7c04450be', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 21, '2023-06-06 15:19:31');
INSERT INTO `sys_user_operation_log` VALUES ('31ef0dc69f185f62e5a7c49ce5eb9cc2', 'Anonymous', '查询用户列表', 'openApi', 'userList', '{}', '127.0.0.1', 5, '2020-09-05 08:51:43');
INSERT INTO `sys_user_operation_log` VALUES ('324173f861b47be868fc12ced31cd814', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1428, '2020-09-06 07:26:37');
INSERT INTO `sys_user_operation_log` VALUES ('32c39df0562bf3f44cda2dcfd28e95b1', 'admin', 'TbVisit', '新增', 'save', '{}', '127.0.0.1', 9, '2023-06-06 15:43:57');
INSERT INTO `sys_user_operation_log` VALUES ('32ee7a85f6cc3451d4dab9f6daf904c4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2115, '2022-06-17 01:13:14');
INSERT INTO `sys_user_operation_log` VALUES ('33098bc3afe02844d62445d7b09e26e4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1492, '2020-04-08 07:16:32');
INSERT INTO `sys_user_operation_log` VALUES ('33124dc6bc751d5bc998a2cee3c148be', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 172, '2020-11-07 17:13:20');
INSERT INTO `sys_user_operation_log` VALUES ('331af7ab6f2d11cb2d6b844e27050d2e', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 69, '2020-04-13 07:44:51');
INSERT INTO `sys_user_operation_log` VALUES ('33507d81aba34b673604413b3787e429', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 3, '2022-06-15 05:40:59');
INSERT INTO `sys_user_operation_log` VALUES ('3360cb6928e009379912365ac597186e', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 171, '2020-11-07 17:12:55');
INSERT INTO `sys_user_operation_log` VALUES ('3374e34bbd0b74302e42d7c6d32e9bdb', 'admin', 'TbVisit', '修改', 'update', '{}', '127.0.0.1', 7, '2023-06-01 14:26:54');
INSERT INTO `sys_user_operation_log` VALUES ('338b57300224cfc23952d39f04380de1', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 58, '2020-05-07 05:45:21');
INSERT INTO `sys_user_operation_log` VALUES ('3391ccfa6d31f547c88b6f3880f163be', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 357, '2023-06-01 09:29:53');
INSERT INTO `sys_user_operation_log` VALUES ('33b616d763c6b1f2ebb3bd4962bc8113', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 7, '2023-05-31 09:09:49');
INSERT INTO `sys_user_operation_log` VALUES ('33ed2b42624ed43b8a1db977229f079b', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 408, '2023-06-02 09:37:06');
INSERT INTO `sys_user_operation_log` VALUES ('34285a26206f8ea1d757ca994fc2a92e', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:29:31');
INSERT INTO `sys_user_operation_log` VALUES ('34448d682928c7f9c0793a696abe803b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 193, '2020-04-17 07:37:58');
INSERT INTO `sys_user_operation_log` VALUES ('3479f258a9fda0cb300425c7c055eece', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 181, '2020-05-14 03:12:52');
INSERT INTO `sys_user_operation_log` VALUES ('3492a99f78284d2bb107b797d9bea552', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 152, '2023-06-05 15:24:24');
INSERT INTO `sys_user_operation_log` VALUES ('34cf0fdd6d8f92ac1ee6c3f6e1d0b783', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 187, '2022-06-17 00:48:38');
INSERT INTO `sys_user_operation_log` VALUES ('3525e2fde1cbebcd0f2b0482046b0632', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 182, '2023-05-29 11:19:52');
INSERT INTO `sys_user_operation_log` VALUES ('353916f9c3f9aa26bdab9ed80ccfc107', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 265, '2020-04-17 03:49:46');
INSERT INTO `sys_user_operation_log` VALUES ('355d50dfaceb2b17101beaa845543efa', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 67, '2020-05-11 07:52:45');
INSERT INTO `sys_user_operation_log` VALUES ('35a8d28f48e0a169277ce70ad454e9f5', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 421, '2023-06-02 10:02:44');
INSERT INTO `sys_user_operation_log` VALUES ('35b0100e505f6bd9040d3a44d4fde025', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 141, '2020-04-17 08:51:18');
INSERT INTO `sys_user_operation_log` VALUES ('3643a9d578a94bab14b23b338e0ffb29', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 151, '2023-06-05 17:15:45');
INSERT INTO `sys_user_operation_log` VALUES ('36520c0d6b5446006035253a2f5c3952', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 132, '2022-06-16 15:38:04');
INSERT INTO `sys_user_operation_log` VALUES ('3699d70379515c5dd43adbe2c9b4458f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 330, '2020-03-21 08:07:40');
INSERT INTO `sys_user_operation_log` VALUES ('37139c90c422a67e68140c2728dfb900', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 228, '2020-05-18 07:38:39');
INSERT INTO `sys_user_operation_log` VALUES ('3796ede92bcbcf058bed4a1cf9779ee5', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 49, '2022-06-16 08:44:05');
INSERT INTO `sys_user_operation_log` VALUES ('37bc4718e2cf940f26b09b84b293f950', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 520, '2022-06-15 16:51:14');
INSERT INTO `sys_user_operation_log` VALUES ('3824df21a43d4b25b368bfe38fee8e7e', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 756, '2023-06-02 17:33:59');
INSERT INTO `sys_user_operation_log` VALUES ('38319cdb9199ffbb501d70eef7f6a111', 'admin', '代码生成', '新增', 'save', '{}', '127.0.0.1', 217, '2020-09-06 06:13:10');
INSERT INTO `sys_user_operation_log` VALUES ('3851d923820cea6a914cc5d72b271612', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 368, '2023-05-29 11:52:49');
INSERT INTO `sys_user_operation_log` VALUES ('3851e7232b6262d17659756ac0005e62', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 15069, '2020-04-21 10:22:04');
INSERT INTO `sys_user_operation_log` VALUES ('3857f46f8f1113e1ce52d9293f388fef', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 406, '2023-06-02 08:14:28');
INSERT INTO `sys_user_operation_log` VALUES ('38f8ef7f090850421a8ea017bef07a39', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 183, '2020-11-07 17:13:24');
INSERT INTO `sys_user_operation_log` VALUES ('3932fd49ab86a702354bd7dd22a53058', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1534, '2020-04-07 07:01:07');
INSERT INTO `sys_user_operation_log` VALUES ('3991751adf5c3b4c22f3fec6a29fffa3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1737, '2020-05-09 01:20:30');
INSERT INTO `sys_user_operation_log` VALUES ('39c5c74a4bbded8cf7749187e5bae878', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 8, '2023-06-02 09:32:12');
INSERT INTO `sys_user_operation_log` VALUES ('39e04299d90d4bd959bd7444f295fe04', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 21, '2020-04-13 07:56:11');
INSERT INTO `sys_user_operation_log` VALUES ('39f50215a12b3337d3262ec5f90cc3fa', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 70, '2020-05-08 03:05:15');
INSERT INTO `sys_user_operation_log` VALUES ('3a0324a5f1fa3a5f8896ec3e5f4ac56f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 245, '2020-03-22 07:48:22');
INSERT INTO `sys_user_operation_log` VALUES ('3aa654b1ae364ba5c768495a5423497c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 156, '2023-06-05 17:19:08');
INSERT INTO `sys_user_operation_log` VALUES ('3ab831c943fb771d51b0dc4a67a720dc', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 47, '2020-07-26 08:58:34');
INSERT INTO `sys_user_operation_log` VALUES ('3ad4417dd2c010bdd63ce71116e7ea22', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000703\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 83, '2020-11-07 17:01:52');
INSERT INTO `sys_user_operation_log` VALUES ('3ad6d1e48815cc2089fb5f9a86749f9d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 299, '2020-08-11 02:06:05');
INSERT INTO `sys_user_operation_log` VALUES ('3af711dfa2b232ab7c92cf92e61dc837', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 501, '2023-05-29 10:11:38');
INSERT INTO `sys_user_operation_log` VALUES ('3b05b796d35c92d8304210c15b4938df', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 19, '2023-05-29 10:42:45');
INSERT INTO `sys_user_operation_log` VALUES ('3b56e9bcea9e05a55f9b4421f7bb6a3c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 257807, '2023-05-29 10:52:41');
INSERT INTO `sys_user_operation_log` VALUES ('3b8e6c2ee46a4c7616c6c018b9bc252c', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 7, '2023-05-31 09:23:49');
INSERT INTO `sys_user_operation_log` VALUES ('3bff36438a7164da40709682edab4067', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 160, '2020-04-13 02:29:47');
INSERT INTO `sys_user_operation_log` VALUES ('3c3af9f117be8fa263498607987b60b0', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 119, '2020-11-07 17:13:13');
INSERT INTO `sys_user_operation_log` VALUES ('3c6ab7d8cd766724c6db31febe0a0aad', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"东莞分公司\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 92, '2020-08-20 09:13:21');
INSERT INTO `sys_user_operation_log` VALUES ('3cb5bad1086fd2e73e0a152134b01ef9', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 59, '2020-05-08 03:05:20');
INSERT INTO `sys_user_operation_log` VALUES ('3dac50a256ba0713c222403e9443c1e0', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 7043, '2020-04-21 10:29:07');
INSERT INTO `sys_user_operation_log` VALUES ('3dad9d5e679b9a30eed1f2dbf3e8872d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 185, '2020-09-03 01:47:31');
INSERT INTO `sys_user_operation_log` VALUES ('3dda4134ad54c092c635b9dc90f63878', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 173, '2020-09-03 01:43:54');
INSERT INTO `sys_user_operation_log` VALUES ('3dee5d4df7cf822027abf827cd9de056', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 398, '2023-06-05 16:12:41');
INSERT INTO `sys_user_operation_log` VALUES ('3dfcd4b1b8a5c5963db9101f0b0edbe3', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 9, '2023-06-02 08:16:39');
INSERT INTO `sys_user_operation_log` VALUES ('3e01a6bac260d3f69753db2021617f6b', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 10:21:00');
INSERT INTO `sys_user_operation_log` VALUES ('3e1b5e4a71e5bbae852cff84f40f75b4', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 243, '2020-04-07 07:01:14');
INSERT INTO `sys_user_operation_log` VALUES ('3e522c9f18d864b09554e0af43ab91a4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 348, '2020-05-07 08:21:56');
INSERT INTO `sys_user_operation_log` VALUES ('3e68db1bc7d21d39dd64ed6f1202de32', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 24, '2020-03-23 05:26:25');
INSERT INTO `sys_user_operation_log` VALUES ('3e8c75f94eadefb7f9b200b76a2f850d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 540, '2020-04-21 08:29:08');
INSERT INTO `sys_user_operation_log` VALUES ('3eabda970bdcacc8d33ec97581e5211e', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 9, '2023-06-02 10:51:29');
INSERT INTO `sys_user_operation_log` VALUES ('3eeab34a800c13f6479e8c24702caf5a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 388, '2023-05-31 11:20:58');
INSERT INTO `sys_user_operation_log` VALUES ('3f1cf94a5617462e73c26ea70031abea', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 55, '2020-11-07 17:09:44');
INSERT INTO `sys_user_operation_log` VALUES ('3f710660bc55600e86e3e26a480bd5c9', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 264, '2020-05-09 10:29:04');
INSERT INTO `sys_user_operation_log` VALUES ('3ff7d693c34b7a0c2ea8ef69fea44eac', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 14, '2023-06-05 15:49:32');
INSERT INTO `sys_user_operation_log` VALUES ('40090a346d012644034dcb4104c2305c', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 7, '2023-05-31 09:09:38');
INSERT INTO `sys_user_operation_log` VALUES ('40e43e1ba2df92a546d6ae5e6c34db67', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2088, '2020-04-17 03:48:56');
INSERT INTO `sys_user_operation_log` VALUES ('40ed59d24c9b843498aa3d588163846c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1138, '2020-09-06 10:05:32');
INSERT INTO `sys_user_operation_log` VALUES ('41631ccc4e2d43e083f26c23379ca871', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 155, '2020-09-07 10:03:47');
INSERT INTO `sys_user_operation_log` VALUES ('419cbc9b1a7b62ddcc6d025ce5cf53e9', 'admin', '用户管理', '用户模板', 'template', '{}', '127.0.0.1', 126, '2020-03-16 08:05:01');
INSERT INTO `sys_user_operation_log` VALUES ('41a941b42c8cfdc2544a7937f5006517', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 20, '2023-06-06 16:00:43');
INSERT INTO `sys_user_operation_log` VALUES ('41d4c0c5b32679681feda96f800371bd', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 162, '2020-09-06 22:06:23');
INSERT INTO `sys_user_operation_log` VALUES ('41ff4f313d6bda87680fc7f81bbe97b8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 36, '2022-06-16 08:46:43');
INSERT INTO `sys_user_operation_log` VALUES ('42146bb3ba1513dd6fd597f06daf97e8', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 96186, '2020-04-21 10:24:51');
INSERT INTO `sys_user_operation_log` VALUES ('424aff0b8bca92fc5d4bde5fac60b51f', 'admin', 'TbCustomer', '新增', 'save', '{}', '127.0.0.1', 7, '2023-05-31 10:21:49');
INSERT INTO `sys_user_operation_log` VALUES ('426f3e16de929b6fedf6f38c5b25b248', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 142, '2023-06-02 09:31:55');
INSERT INTO `sys_user_operation_log` VALUES ('427cfb896c4b2b4572744ea2d331c3a7', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2340, '2020-08-31 02:25:01');
INSERT INTO `sys_user_operation_log` VALUES ('427fe994766d946fc5f6ab289cb2b1df', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1420, '2020-09-02 13:54:48');
INSERT INTO `sys_user_operation_log` VALUES ('428dfb6b6ddf7b346e3ddd26488311a7', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000467\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 92, '2020-05-18 07:40:38');
INSERT INTO `sys_user_operation_log` VALUES ('42d129312e2c98420193baf80e1e627a', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 157, '2020-09-06 21:49:57');
INSERT INTO `sys_user_operation_log` VALUES ('42db202090bbf0308fe979409904ac66', 'admin', 'TbCustLinkman', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 12:31:22');
INSERT INTO `sys_user_operation_log` VALUES ('42f294f75094bfcf40d668a5216d6ff3', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 407, '2023-06-06 15:43:40');
INSERT INTO `sys_user_operation_log` VALUES ('4323a1dc2929d1ae74d1870a0d175706', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 27, '2020-04-13 07:17:31');
INSERT INTO `sys_user_operation_log` VALUES ('432c8c1012b82e8b1b9ce387ffdb8416', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 137, '2020-05-07 10:00:58');
INSERT INTO `sys_user_operation_log` VALUES ('436607a6160647d8333eec0d981aceba', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 391, '2020-04-16 08:27:52');
INSERT INTO `sys_user_operation_log` VALUES ('43814f7b88b632e112a8a72b44fbe44f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 371, '2020-03-22 14:31:18');
INSERT INTO `sys_user_operation_log` VALUES ('43e0325ab4490ee452a6d2d282cc0aa7', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 63, '2020-03-23 05:26:22');
INSERT INTO `sys_user_operation_log` VALUES ('43e8d630aca9ce26d1fc265991c7daff', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 340, '2023-06-01 15:00:38');
INSERT INTO `sys_user_operation_log` VALUES ('43f1737803491a2c58ba34184a3cb8ee', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 34, '2023-05-29 10:41:55');
INSERT INTO `sys_user_operation_log` VALUES ('445456fcde0375cc6b894ddcc79f3001', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 141, '2023-06-01 15:00:39');
INSERT INTO `sys_user_operation_log` VALUES ('448ff1632f475f6258171a0226b3856e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1311, '2020-09-05 08:51:39');
INSERT INTO `sys_user_operation_log` VALUES ('44a5fa1c751642cf7da234563899c660', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1372, '2020-04-09 02:51:30');
INSERT INTO `sys_user_operation_log` VALUES ('44c9c1a4c051237ca3cbd76e7a5a8029', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 399, '2023-06-02 09:56:09');
INSERT INTO `sys_user_operation_log` VALUES ('44e84b83f83ee1be6a7cd60b5aba0aa8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1558, '2020-05-08 01:32:24');
INSERT INTO `sys_user_operation_log` VALUES ('452d1b8d3ac9c0ee33580f92c83bb6db', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 22, '2023-06-02 17:24:20');
INSERT INTO `sys_user_operation_log` VALUES ('459eb0daad93906bed55873700a7f074', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 22, '2022-06-16 08:46:43');
INSERT INTO `sys_user_operation_log` VALUES ('45c9de5610f4a2c8f558a9fc97ebc532', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 236, '2023-06-05 15:20:44');
INSERT INTO `sys_user_operation_log` VALUES ('45ed9f175f6debe031612b71abaf02b8', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 3, '2022-06-16 08:44:24');
INSERT INTO `sys_user_operation_log` VALUES ('45f4cb3a30e7c5a75dc6d7a45f5ba08f', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 147, '2020-05-09 10:30:45');
INSERT INTO `sys_user_operation_log` VALUES ('45f982103c3e48b831d8ae745580dd32', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 51, '2020-05-08 02:15:05');
INSERT INTO `sys_user_operation_log` VALUES ('4641efa643bd466041c3b2099e3930cb', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 438, '2023-06-05 15:24:23');
INSERT INTO `sys_user_operation_log` VALUES ('46dcff5b89a14dac5340e022e42d7e68', 'admin', 'TbVisit', '新增', 'save', '{}', '127.0.0.1', 8, '2023-06-01 14:08:29');
INSERT INTO `sys_user_operation_log` VALUES ('46f71896a69b5c86d60697c2038fbfc6', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 282, '2020-09-06 22:00:59');
INSERT INTO `sys_user_operation_log` VALUES ('477f0f6a42c7771384125c2212254f77', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 17090, '2023-05-29 11:00:26');
INSERT INTO `sys_user_operation_log` VALUES ('47a4782266700879b41d371a5a54802c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 254, '2020-10-04 16:56:13');
INSERT INTO `sys_user_operation_log` VALUES ('47aac4892f4ecc968865cabbd23ba2bb', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"OR1200000387\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 103, '2020-05-18 07:38:17');
INSERT INTO `sys_user_operation_log` VALUES ('47adedcae059b2b7cef3bd30536ccedf', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 4798, '2022-06-15 17:18:38');
INSERT INTO `sys_user_operation_log` VALUES ('47b2d0862722fb5e7c4f9c3ae9e1ae85', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 151, '2023-06-05 15:35:38');
INSERT INTO `sys_user_operation_log` VALUES ('48045ac7474a5f4a4cc7453e867b1fd6', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1168, '2020-10-24 03:50:30');
INSERT INTO `sys_user_operation_log` VALUES ('481805083f71a28ee9f069b06ea287c9', 'dongfang', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 7, '2023-06-06 14:43:55');
INSERT INTO `sys_user_operation_log` VALUES ('48266373229092afa1804b64ed1d889d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 93, '2020-04-17 08:51:18');
INSERT INTO `sys_user_operation_log` VALUES ('488bae5e1758658fcc128a3a6a7be2a2', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 290, '2020-05-11 07:52:47');
INSERT INTO `sys_user_operation_log` VALUES ('48a8f7ff62619e9573197a70a5c84606', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 9, '2023-06-07 15:25:57');
INSERT INTO `sys_user_operation_log` VALUES ('48ae91db791b104e88d3fbbd0d8ffc03', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 102, '2020-09-03 02:22:22');
INSERT INTO `sys_user_operation_log` VALUES ('48bd72e71c7e15d86f231454f2738a27', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 622, '2023-06-01 09:39:08');
INSERT INTO `sys_user_operation_log` VALUES ('4928275a2160a44226601f3fc902ff58', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 174, '2023-06-01 10:20:22');
INSERT INTO `sys_user_operation_log` VALUES ('49b2ccd807a893bbdc0085ee9a37fcaa', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 110, '2020-04-20 07:37:33');
INSERT INTO `sys_user_operation_log` VALUES ('49e181ac3c8b945242308322bc1eddbe', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 122, '2020-04-07 08:09:29');
INSERT INTO `sys_user_operation_log` VALUES ('4a48e3f171aa371e91a704bf12a8064f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1856, '2020-10-04 16:55:37');
INSERT INTO `sys_user_operation_log` VALUES ('4ab1d43c994d11bb2a51b7088ab94584', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 123, '2020-07-28 09:01:25');
INSERT INTO `sys_user_operation_log` VALUES ('4ab2eb87f16a0b81fac90f7a0978e69e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 171, '2020-04-13 06:48:03');
INSERT INTO `sys_user_operation_log` VALUES ('4ab6cbde230b6e4d80caad096b00f57e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 198, '2023-05-31 09:21:38');
INSERT INTO `sys_user_operation_log` VALUES ('4ad30f6f48fc7021436162b4a7910000', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1674, '2020-04-07 10:01:59');
INSERT INTO `sys_user_operation_log` VALUES ('4af5d3caf309f0495b4bd51864d07363', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 155, '2023-06-02 10:31:19');
INSERT INTO `sys_user_operation_log` VALUES ('4b1a032b5456b67b749a541644314be9', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2544, '2022-06-17 00:48:35');
INSERT INTO `sys_user_operation_log` VALUES ('4b93cab0315498be1c67c8616be372e9', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 11, '2023-05-29 10:25:17');
INSERT INTO `sys_user_operation_log` VALUES ('4b942f6d5f647c9e7dccbe0d0b2e1401', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-05-07 05:48:17');
INSERT INTO `sys_user_operation_log` VALUES ('4bde3d80ed1d9bb4e83a85ef2e6569db', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 33, '2020-11-07 16:58:20');
INSERT INTO `sys_user_operation_log` VALUES ('4be1db314d5479e5387253014698fdae', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 260, '2020-08-31 02:48:34');
INSERT INTO `sys_user_operation_log` VALUES ('4c1523322ab900b29f3f2cd82f8ba563', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 49, '2020-10-27 09:01:23');
INSERT INTO `sys_user_operation_log` VALUES ('4c47977e76273a49a41ba2999e00ff28', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 155, '2020-05-08 01:35:49');
INSERT INTO `sys_user_operation_log` VALUES ('4c847090f8afb001e8c52f1b9b3edd8c', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 181, '2020-11-07 17:12:31');
INSERT INTO `sys_user_operation_log` VALUES ('4c8d315cdc0bb04375e2ec51364ce3e4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 322, '2020-03-23 05:25:52');
INSERT INTO `sys_user_operation_log` VALUES ('4c8fca6c8f59e925d504fce6dafdad5f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1331, '2020-04-29 13:41:54');
INSERT INTO `sys_user_operation_log` VALUES ('4ccd1a4441ce34387125b814b3080d6c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 211, '2020-04-13 02:35:51');
INSERT INTO `sys_user_operation_log` VALUES ('4d05b81019b5197f8c7718991d584f4b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1117, '2020-09-07 09:27:37');
INSERT INTO `sys_user_operation_log` VALUES ('4d76e2f0f1c9c82e515bd4e36e80ce8f', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 331, '2020-05-14 03:09:37');
INSERT INTO `sys_user_operation_log` VALUES ('4d8dc54b320afb03223d8f601dd50058', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 247, '2020-05-07 04:32:30');
INSERT INTO `sys_user_operation_log` VALUES ('4da05e8c1c4b3e963f3522955810205a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 352, '2023-06-07 14:43:51');
INSERT INTO `sys_user_operation_log` VALUES ('4dc57cfd589ec362f6fa3319c4483c19', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 347, '2020-10-24 03:46:54');
INSERT INTO `sys_user_operation_log` VALUES ('4de06aee5c23820370322415c87fe00c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 184, '2020-09-03 01:44:28');
INSERT INTO `sys_user_operation_log` VALUES ('4e4572f795ed6cb31cfee8b7f078e96e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 2083, '2020-05-14 03:09:36');
INSERT INTO `sys_user_operation_log` VALUES ('4e7b61bc5ceb567a6a1163658f694437', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 30, '2020-11-07 17:06:03');
INSERT INTO `sys_user_operation_log` VALUES ('4e87434d93472276e9c5ffa95d6ad4de', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 143, '2023-06-05 16:04:46');
INSERT INTO `sys_user_operation_log` VALUES ('4ea82164a8712c3bc08e46236f2c9dfb', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1117, '2020-10-24 03:51:24');
INSERT INTO `sys_user_operation_log` VALUES ('4ec33251cb0c24e4f665780ffbc2659d', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 224, '2020-08-11 02:07:59');
INSERT INTO `sys_user_operation_log` VALUES ('4ee8195ce0036ae86f57f0acf7b2e396', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 331, '2020-05-14 10:38:16');
INSERT INTO `sys_user_operation_log` VALUES ('4ee836ab4680a2bf461f9399096c8c52', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 29, '2020-05-18 07:39:55');
INSERT INTO `sys_user_operation_log` VALUES ('4f4e3c3beb9505347dcda2ff86139cd1', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 7, '2023-05-31 09:21:54');
INSERT INTO `sys_user_operation_log` VALUES ('4fabe9637b3b567e6e1f05e18a418827', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 83, '2020-04-13 08:06:20');
INSERT INTO `sys_user_operation_log` VALUES ('4ffacab40daeb01074480929fd01ea3d', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"OR1200000703\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 273, '2020-05-18 07:38:20');
INSERT INTO `sys_user_operation_log` VALUES ('501e0af3b7aec9624b273b7656d0ee2c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 253, '2020-05-08 03:51:59');
INSERT INTO `sys_user_operation_log` VALUES ('503e2defd700bf7118216a45039a8ad2', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 75, '2020-05-07 05:41:59');
INSERT INTO `sys_user_operation_log` VALUES ('50455cc85674fa95559016c64fe24746', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 29, '2022-06-16 08:44:58');
INSERT INTO `sys_user_operation_log` VALUES ('504c62d3dacceec452725fe5bc24b277', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 377, '2023-06-01 09:24:53');
INSERT INTO `sys_user_operation_log` VALUES ('507e90be7e6d72bee54f4e66b169e014', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 259, '2020-04-21 03:42:31');
INSERT INTO `sys_user_operation_log` VALUES ('50b2e409946fba3b99efd3029448118c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 215, '2023-05-29 10:22:46');
INSERT INTO `sys_user_operation_log` VALUES ('5100f265057836cd6de78228f785babb', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 700, '2022-06-15 09:26:25');
INSERT INTO `sys_user_operation_log` VALUES ('512440495343103335ee126a0d16916c', 'admin', '机构管理', '删除', 'delete', '{}', '127.0.0.1', 126, '2020-08-20 09:13:30');
INSERT INTO `sys_user_operation_log` VALUES ('512fdec940f575f795af8001856ee1e0', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 742, '2023-05-29 11:00:08');
INSERT INTO `sys_user_operation_log` VALUES ('5187acf71972ed18159e2fde3b82e277', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 148, '2020-09-07 09:34:41');
INSERT INTO `sys_user_operation_log` VALUES ('518e9b50a88d6d9741f40b3158a6763e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 249, '2020-09-06 10:19:08');
INSERT INTO `sys_user_operation_log` VALUES ('519242ded9575dae4148ffccfeadeefd', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1104, '2023-06-07 15:48:23');
INSERT INTO `sys_user_operation_log` VALUES ('51d9bbb15b3b14c3af63d5768d52859e', 'admin', '机构管理', '恢复', 'recovery', '{}', '127.0.0.1', 120, '2020-08-20 09:13:33');
INSERT INTO `sys_user_operation_log` VALUES ('521d916f5888dbd27c5039b6e829d10c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 245, '2023-05-29 10:06:36');
INSERT INTO `sys_user_operation_log` VALUES ('5227707280db4ae6272f8602528be0ef', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 1866, '2020-04-21 10:26:34');
INSERT INTO `sys_user_operation_log` VALUES ('52b226f064a17c91610adc471a9f4788', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 154, '2020-04-21 10:07:39');
INSERT INTO `sys_user_operation_log` VALUES ('52e7ca740f07056a4f6c9f5a09e13da2', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 251, '2022-06-15 05:58:38');
INSERT INTO `sys_user_operation_log` VALUES ('52f572ab5f587073edf251cc7a0cc0e8', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 266, '2020-05-08 03:08:24');
INSERT INTO `sys_user_operation_log` VALUES ('538a4511bf4cfa69de2e306d6e71571b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 159, '2023-06-06 15:42:46');
INSERT INTO `sys_user_operation_log` VALUES ('53bab69e9d986bcf6bd0d0d1cb62cd36', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 155, '2020-03-16 08:04:10');
INSERT INTO `sys_user_operation_log` VALUES ('53d30f20e4a35d06ed9d24429c0c4dc6', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"OR1500058289\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 84, '2020-05-18 07:38:16');
INSERT INTO `sys_user_operation_log` VALUES ('544dc37748807350fa187ae6bff2f4a2', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 439, '2023-05-31 10:57:05');
INSERT INTO `sys_user_operation_log` VALUES ('54a2a020dcf66eb2581f8f8a85b67c39', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 851, '2020-08-10 07:42:49');
INSERT INTO `sys_user_operation_log` VALUES ('54b75dc21ab9ac1b3d23f4e77f9793f9', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 35, '2020-09-07 09:35:14');
INSERT INTO `sys_user_operation_log` VALUES ('54c52bef79812b66e7ca8dda5e03c637', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 143, '2023-06-05 15:14:56');
INSERT INTO `sys_user_operation_log` VALUES ('553f407a44faf79c71b7b730ec33ef6f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 349, '2020-05-18 07:37:33');
INSERT INTO `sys_user_operation_log` VALUES ('555681920e0618489dfcb946a14c63f2', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 54, '2020-05-08 02:08:56');
INSERT INTO `sys_user_operation_log` VALUES ('555b33c9734761851d3faaf5fc4fcb82', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 25, '2023-05-29 10:22:59');
INSERT INTO `sys_user_operation_log` VALUES ('5573f96aeabd36c6439c246536f9f566', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1222, '2020-09-05 06:50:39');
INSERT INTO `sys_user_operation_log` VALUES ('557886fddead29cefb9033120fa9f402', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 140, '2023-06-02 08:16:20');
INSERT INTO `sys_user_operation_log` VALUES ('55a9917c2e69322eb0324e85b11c4b16', 'root', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 24, '2022-06-17 01:13:27');
INSERT INTO `sys_user_operation_log` VALUES ('55acef5cb5f49ba4a7630687e7af9662', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 146, '2023-06-01 11:11:13');
INSERT INTO `sys_user_operation_log` VALUES ('55ae54fcb01a039c6ef573687b682950', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 191, '2023-06-06 14:26:28');
INSERT INTO `sys_user_operation_log` VALUES ('573324b75605a6c68ab18f71b79c1eee', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 197, '2020-11-07 17:14:12');
INSERT INTO `sys_user_operation_log` VALUES ('57c43cc135d2443dd706b607c23103ba', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 156, '2020-11-07 16:58:12');
INSERT INTO `sys_user_operation_log` VALUES ('57e4b0c0870b99f10fb3f3e6e2fea3f4', 'admin', '用户管理', '列表', 'page', '{\"phone\":\"\",\"nickName\":\"\",\"disable\":\"\",\"roles\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 42, '2022-06-17 01:13:10');
INSERT INTO `sys_user_operation_log` VALUES ('5814d02c78855d4a60b3b45fd5de0d15', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1578, '2020-04-21 03:42:29');
INSERT INTO `sys_user_operation_log` VALUES ('5876875f33899fb5f4ececbaab84ebaa', 'root', '用户管理', '修改', 'update', '{}', '127.0.0.1', 34, '2022-06-17 01:13:48');
INSERT INTO `sys_user_operation_log` VALUES ('587e660cd723021255c9bc1776d65291', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 77, '2020-04-13 08:04:21');
INSERT INTO `sys_user_operation_log` VALUES ('58b9ce41a87f584a9c057d3f19fd440b', 'admin', 'DemoTest', '删除', 'delete', '{}', '', 8, '2022-06-17 00:48:00');
INSERT INTO `sys_user_operation_log` VALUES ('59348021b1943eccdbdbf686057ccda1', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 164, '2020-05-07 10:01:05');
INSERT INTO `sys_user_operation_log` VALUES ('5940898a9720c7eff095bae2a740dd18', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 76, '2020-04-13 07:56:23');
INSERT INTO `sys_user_operation_log` VALUES ('5946a450fed8c91093cf00a3705c2bde', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 66, '2020-08-20 09:43:51');
INSERT INTO `sys_user_operation_log` VALUES ('5951f788360c4b5c1a461afef19f3bba', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 40, '2023-06-07 16:13:25');
INSERT INTO `sys_user_operation_log` VALUES ('5984ca6d4dfced22e367ea9d9d043d98', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"2\"}', '127.0.0.1', 105, '2020-04-08 07:33:00');
INSERT INTO `sys_user_operation_log` VALUES ('599c9adbf3ce5425db830feeb048eb5e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 282, '2020-07-27 07:56:48');
INSERT INTO `sys_user_operation_log` VALUES ('59e6ce41033841ede18bb329029f2a1a', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 109, '2020-04-08 07:48:29');
INSERT INTO `sys_user_operation_log` VALUES ('5a5fcafcaaf80005fc4eb5ac17400be8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 204, '2023-05-31 10:40:52');
INSERT INTO `sys_user_operation_log` VALUES ('5a65a34c00f9b8043542a109c1c9d48d', 'admin', '登录模块', '用户登录', 'login', '{}', '192.168.213.1', 1411, '2020-04-16 07:35:10');
INSERT INTO `sys_user_operation_log` VALUES ('5a76cf9ce6c197cd1f39e40c4e5c9a8d', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 469, '2023-06-05 15:43:19');
INSERT INTO `sys_user_operation_log` VALUES ('5b21c283cebc240d96d11d58b861e2ec', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 168, '2020-11-07 17:12:30');
INSERT INTO `sys_user_operation_log` VALUES ('5b3352f5b7794fd1d8f8e89363ae4ced', 'admin', '查询用户列表', 'openApi', 'userList', '{}', '127.0.0.1', 82, '2020-09-06 22:16:00');
INSERT INTO `sys_user_operation_log` VALUES ('5b345a4868f54be0a5551b7321d76e24', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"1325122003077693442\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 117, '2020-11-07 17:40:56');
INSERT INTO `sys_user_operation_log` VALUES ('5b48f4b8bdc15205fccc9d2f0906eea6', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 214, '2023-05-31 08:56:22');
INSERT INTO `sys_user_operation_log` VALUES ('5b931db1f18af2de9f1e9f212a7b1047', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 22, '2020-04-07 07:13:23');
INSERT INTO `sys_user_operation_log` VALUES ('5ba9069349ea33982626744cf75e01f9', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 76, '2020-05-08 07:16:10');
INSERT INTO `sys_user_operation_log` VALUES ('5c9c35206644efaa6a1b293167cdf2cf', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 37, '2022-06-16 08:44:34');
INSERT INTO `sys_user_operation_log` VALUES ('5ccb3978b300f7c30ec7b53e51df2978', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 407, '2020-05-07 09:03:39');
INSERT INTO `sys_user_operation_log` VALUES ('5ce80c1c328a69989cbe168a3f0d7ac9', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 196, '2020-04-13 06:47:46');
INSERT INTO `sys_user_operation_log` VALUES ('5d3d8ea99efe9fec4d9de37e7a1148b9', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 111, '2020-09-02 07:48:58');
INSERT INTO `sys_user_operation_log` VALUES ('5e7498dc74e695c3076413b923cc3c9b', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 126, '2020-11-07 17:14:02');
INSERT INTO `sys_user_operation_log` VALUES ('5eb77432b8f2fe8eb5fd54bcb765afeb', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 184, '2020-03-22 13:13:17');
INSERT INTO `sys_user_operation_log` VALUES ('5ed95a85c35b8d588c346235a6c62fa3', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 186, '2020-08-12 01:53:36');
INSERT INTO `sys_user_operation_log` VALUES ('5f11cf5c9b5dcd10be101450cca72ecd', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 270, '2020-07-29 07:10:43');
INSERT INTO `sys_user_operation_log` VALUES ('5f3fa8ffcc4d5ebd925bfc72b1076be8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 303, '2020-09-02 13:56:31');
INSERT INTO `sys_user_operation_log` VALUES ('5f7d0bb045eddc9ca7f86201ccb8d767', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 141, '2020-10-24 03:51:29');
INSERT INTO `sys_user_operation_log` VALUES ('5f93f22897a3c1d99135be1d76ac8873', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 175, '2020-09-05 08:56:35');
INSERT INTO `sys_user_operation_log` VALUES ('5fd5fb2bfa9174858b2b03c7b25cf369', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 500, '2023-05-31 10:01:06');
INSERT INTO `sys_user_operation_log` VALUES ('60243a2487e0e62494302e2047223932', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 189, '2020-04-13 07:55:04');
INSERT INTO `sys_user_operation_log` VALUES ('60afe7697ac1958894b799ef54d95d9c', 'admin', '查询用户列表', 'openApi', 'userList', '{}', '127.0.0.1', 63, '2020-09-07 09:29:22');
INSERT INTO `sys_user_operation_log` VALUES ('60da0237977603e913f046ae1ded473a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 332, '2020-10-04 16:56:08');
INSERT INTO `sys_user_operation_log` VALUES ('613590cbff458904d0612d8cd362f8a6', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 174, '2020-03-22 14:31:20');
INSERT INTO `sys_user_operation_log` VALUES ('614dc6a59c4f9775883bef9228626bef', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 135, '2020-04-17 05:47:55');
INSERT INTO `sys_user_operation_log` VALUES ('61544cf225f55a18d995be2331e8a308', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 30, '2022-06-16 08:44:17');
INSERT INTO `sys_user_operation_log` VALUES ('6165987cc980dd5480af482e1a73f98c', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"4444\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 31, '2022-06-15 05:40:51');
INSERT INTO `sys_user_operation_log` VALUES ('61a38ac2f77a90241785644ac6e63697', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 239, '2020-08-01 06:07:17');
INSERT INTO `sys_user_operation_log` VALUES ('61b3cbb30d1fd8814ff331aefc475394', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 65, '2020-05-08 03:07:06');
INSERT INTO `sys_user_operation_log` VALUES ('61d804c831c78ccc27074e4ec3da999c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 226, '2020-04-16 08:26:45');
INSERT INTO `sys_user_operation_log` VALUES ('626c29d4f382be44d59472d8512c25fd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 32, '2023-06-03 14:03:35');
INSERT INTO `sys_user_operation_log` VALUES ('6280fcd0c6431bfbc15aab5cc386c7e3', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 68, '2020-08-01 06:45:37');
INSERT INTO `sys_user_operation_log` VALUES ('629f6fdf3bd62ecc217b5337c99bb607', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 196, '2020-07-26 08:58:33');
INSERT INTO `sys_user_operation_log` VALUES ('62cf2c608c7226cf90a71bf9c0df8d0c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 282, '2020-04-29 13:41:54');
INSERT INTO `sys_user_operation_log` VALUES ('62e7c2be9b99b974700b72ea9d99b016', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 262, '2020-05-07 04:34:29');
INSERT INTO `sys_user_operation_log` VALUES ('630828dfa11398cf00ae2edd90ef6164', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 101, '2020-10-24 03:56:54');
INSERT INTO `sys_user_operation_log` VALUES ('63103417d406cf6d5256333ea080f984', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 59, '2020-10-27 09:14:54');
INSERT INTO `sys_user_operation_log` VALUES ('63309e47fc6affc96d88787d44c30283', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 179, '2020-05-07 04:36:18');
INSERT INTO `sys_user_operation_log` VALUES ('6344f2ffc6308925c60c110e4a235ee7', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 162, '2023-06-05 15:32:04');
INSERT INTO `sys_user_operation_log` VALUES ('6374dca393f1e760da89541016841529', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 11, '2022-06-17 01:07:10');
INSERT INTO `sys_user_operation_log` VALUES ('64052c58f854dc18866d2925baf2184a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 187, '2020-07-27 07:09:58');
INSERT INTO `sys_user_operation_log` VALUES ('6418f001b64c2037a6d55f6c6f89bc8e', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"4444\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 194, '2020-11-07 17:41:08');
INSERT INTO `sys_user_operation_log` VALUES ('6469dc6ada116316a686f6efe447b0d4', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 15, '2022-06-15 09:39:02');
INSERT INTO `sys_user_operation_log` VALUES ('6471044ceee52b6f1b9e683bc04f8916', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 231, '2020-04-29 13:42:10');
INSERT INTO `sys_user_operation_log` VALUES ('647b0dba596ec216b2cdba765fc227c0', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1549, '2020-09-23 03:18:14');
INSERT INTO `sys_user_operation_log` VALUES ('64abd6636a23effc94e4dc7e9f51f69d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1896, '2020-09-05 08:32:39');
INSERT INTO `sys_user_operation_log` VALUES ('64d16b5aac9efb9b1ce8a63ad758586e', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 52, '2020-05-08 02:02:59');
INSERT INTO `sys_user_operation_log` VALUES ('64f006051bfaab7d5fb7a8b8ed9bbc6b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 144, '2020-04-17 05:47:56');
INSERT INTO `sys_user_operation_log` VALUES ('653b5baab84c1baf13eae5fc2d73b66c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 164, '2023-05-31 09:54:15');
INSERT INTO `sys_user_operation_log` VALUES ('6552aa3c7918fbec023c0d55c1f21575', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 141, '2020-04-16 09:01:34');
INSERT INTO `sys_user_operation_log` VALUES ('6568a3149f86f77b05cf4a7b4e5da008', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 155, '2023-06-07 16:57:13');
INSERT INTO `sys_user_operation_log` VALUES ('65b607019d52275f7cfdc128dc540836', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 433, '2020-04-29 14:48:27');
INSERT INTO `sys_user_operation_log` VALUES ('65cc5f4dff88386d9c5bc4d603b40698', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 501, '2020-04-21 07:30:56');
INSERT INTO `sys_user_operation_log` VALUES ('65e020ebcab93dfc4d19f41a41195808', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 217, '2020-04-13 07:54:49');
INSERT INTO `sys_user_operation_log` VALUES ('660e4c8927ec4ac2e179c64a4d09aca9', 'admin', 'TbVisit', '新增', 'save', '{}', '127.0.0.1', 8, '2023-06-07 15:49:37');
INSERT INTO `sys_user_operation_log` VALUES ('661994f20cde870ef028b99432919dcd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1681, '2020-05-07 08:21:54');
INSERT INTO `sys_user_operation_log` VALUES ('663340fb611541df3b444d31e646a8ba', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 156, '2020-04-21 10:08:15');
INSERT INTO `sys_user_operation_log` VALUES ('6657685094c3ebcaaa7f43e46cfea5f8', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000478\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 91, '2020-05-18 07:40:39');
INSERT INTO `sys_user_operation_log` VALUES ('6688516bcc935599513eea917c10de8a', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 70, '2020-05-08 02:46:17');
INSERT INTO `sys_user_operation_log` VALUES ('668d5a63117bf78aefe82656a87ac30e', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 71, '2020-04-16 09:28:01');
INSERT INTO `sys_user_operation_log` VALUES ('66ba636cfd601d7af97118561d001ff3', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 90, '2020-04-17 08:51:19');
INSERT INTO `sys_user_operation_log` VALUES ('673681ab1e50ceb09d83d3280469e640', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 28, '2020-11-07 17:01:50');
INSERT INTO `sys_user_operation_log` VALUES ('6741027fd3c474c4b4eb31a72750c72d', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 22, '2023-05-29 10:52:56');
INSERT INTO `sys_user_operation_log` VALUES ('675db9e5f3e0cac0cefc74363d975abe', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 3215, '2020-08-31 02:25:11');
INSERT INTO `sys_user_operation_log` VALUES ('6791b9baf422a78a59dd57ce439ba395', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 152, '2023-06-06 15:43:42');
INSERT INTO `sys_user_operation_log` VALUES ('6799fd67ccc9f18771e73a95bc170a2c', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 66, '2020-05-07 05:51:02');
INSERT INTO `sys_user_operation_log` VALUES ('67c4b9b95f11b8a67ac791753c967c29', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1507, '2020-08-20 09:09:56');
INSERT INTO `sys_user_operation_log` VALUES ('67ceca87db2096527bba585f830ddf7e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 22, '2023-06-06 14:43:08');
INSERT INTO `sys_user_operation_log` VALUES ('681f0f55992b2fccabb829a0df92212a', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 8, '2023-06-01 09:30:45');
INSERT INTO `sys_user_operation_log` VALUES ('6845f86250d74eaa16db171c6edbad6f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 234, '2020-03-23 05:25:58');
INSERT INTO `sys_user_operation_log` VALUES ('68529023cfb77fe16df4fb751d093b06', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 383, '2023-06-05 17:17:07');
INSERT INTO `sys_user_operation_log` VALUES ('686bff76606a17992c6a2be68ec557cb', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 557, '2023-06-01 08:19:45');
INSERT INTO `sys_user_operation_log` VALUES ('68c35f68e69d36f63051f894e865d272', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 401, '2023-06-05 16:26:46');
INSERT INTO `sys_user_operation_log` VALUES ('69c621d5007b1014dc315bf14449e7cb', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 201, '2020-09-03 06:31:03');
INSERT INTO `sys_user_operation_log` VALUES ('6a087ba1fd639befac3f4187583bd22d', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 22, '2020-11-07 17:10:21');
INSERT INTO `sys_user_operation_log` VALUES ('6a5f37e914491e181b2d253c413f2f81', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 525, '2020-04-29 14:48:37');
INSERT INTO `sys_user_operation_log` VALUES ('6aeca27aa552aff8f4822feb466fa482', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 175, '2020-09-06 22:03:30');
INSERT INTO `sys_user_operation_log` VALUES ('6b09bb65e48059bc34370aace38e68d2', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 415, '2023-06-05 17:12:43');
INSERT INTO `sys_user_operation_log` VALUES ('6b6a13c659caabaac8e96c50a52347d0', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 121, '2020-11-07 17:14:12');
INSERT INTO `sys_user_operation_log` VALUES ('6b7fb33fa987e68a80819470d1e7f0f0', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 178, '2020-09-03 07:54:37');
INSERT INTO `sys_user_operation_log` VALUES ('6bac3b569418931a86e02a703a6ad697', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 13, '2023-05-29 10:26:05');
INSERT INTO `sys_user_operation_log` VALUES ('6bb2153d53d93f55d71a9c39b74833a8', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 189, '2020-04-21 10:07:18');
INSERT INTO `sys_user_operation_log` VALUES ('6bf71eb7de87557ffa6b8bc5d0d23fd7', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"1325123334769213441\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 125, '2020-11-07 17:40:57');
INSERT INTO `sys_user_operation_log` VALUES ('6c72d1896445d8c25b1a22c81da566df', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 32, '2020-04-16 09:28:03');
INSERT INTO `sys_user_operation_log` VALUES ('6c7f69982814440ee4b28a02dbfaba22', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 112, '2022-06-17 01:07:07');
INSERT INTO `sys_user_operation_log` VALUES ('6ccb38267f6e27d54b5621ae760d1336', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 56, '2023-06-06 14:41:09');
INSERT INTO `sys_user_operation_log` VALUES ('6cefa3306bbac484c1a7d441ef7c1294', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 142, '2023-06-02 09:10:07');
INSERT INTO `sys_user_operation_log` VALUES ('6d70a9021d06d70b594f145e078f8732', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2064, '2020-05-18 07:37:27');
INSERT INTO `sys_user_operation_log` VALUES ('6d8c5b25779fb77ba156bebda69f770d', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 118, '2022-06-17 01:12:56');
INSERT INTO `sys_user_operation_log` VALUES ('6e0884ea6c411607158d78b559293f39', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 432, '2022-06-15 08:49:01');
INSERT INTO `sys_user_operation_log` VALUES ('6e3c917199e950229dad95102e27871a', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 30, '2020-05-07 05:47:00');
INSERT INTO `sys_user_operation_log` VALUES ('6e482f5ab199e47f5017f32534fe5eec', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 183, '2023-05-29 11:20:53');
INSERT INTO `sys_user_operation_log` VALUES ('6e4ee587c1451861e5f925785f467c47', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 461, '2023-06-01 10:20:19');
INSERT INTO `sys_user_operation_log` VALUES ('6e537fd373e629b9c46156585ac0ece5', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 84, '2020-05-11 07:52:01');
INSERT INTO `sys_user_operation_log` VALUES ('6ebbbda8e1b4c136098227da866ff0fa', 'admin', 'demo', '删除', 'delete', '{}', '127.0.0.1', 9, '2022-06-16 18:15:08');
INSERT INTO `sys_user_operation_log` VALUES ('6f2bbd7efa82ebdec9e45bbdbae0b24d', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 8, '2023-06-05 16:43:59');
INSERT INTO `sys_user_operation_log` VALUES ('6fd90175be18279733b4fa0a37f4064f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '192.168.213.1', 145, '2020-04-16 07:33:33');
INSERT INTO `sys_user_operation_log` VALUES ('7018e065ced441fa2082a320074798dc', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"OR1500058290\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 111, '2020-05-18 07:38:19');
INSERT INTO `sys_user_operation_log` VALUES ('70230dd825d221c356908adade801d47', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 401, '2023-06-01 09:27:34');
INSERT INTO `sys_user_operation_log` VALUES ('71513df5cb035795e3993dff4c6a425b', 'admin', '用户管理', '导出', 'export', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"username\":\"\"}', '127.0.0.1', 885, '2020-05-09 10:29:50');
INSERT INTO `sys_user_operation_log` VALUES ('7155aaab061ff63131cd264e8d6e7a03', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:22:13');
INSERT INTO `sys_user_operation_log` VALUES ('717d7ab1059dabb868acef624a18220e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 153, '2023-06-05 16:57:32');
INSERT INTO `sys_user_operation_log` VALUES ('71d7c5c5015692c7de28daa5c5e7539b', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 118, '2020-08-12 01:51:09');
INSERT INTO `sys_user_operation_log` VALUES ('721abdf8d874cdc7a6fb63ab0ea59567', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 56, '2020-04-13 07:47:14');
INSERT INTO `sys_user_operation_log` VALUES ('72c4d03b21cfdafc5b38dc064b76516b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 28, '2022-06-15 05:41:00');
INSERT INTO `sys_user_operation_log` VALUES ('730122960d459f6bb8da986a0ac4e057', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 8, '2023-06-07 15:54:43');
INSERT INTO `sys_user_operation_log` VALUES ('731e14dcb257cb7d5ae04e8d9bd13e13', 'root', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 182, '2022-06-17 01:13:17');
INSERT INTO `sys_user_operation_log` VALUES ('732e03f091e450b95daca6843b6c647e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 24, '2022-06-16 08:44:49');
INSERT INTO `sys_user_operation_log` VALUES ('735fe919535367dc503df4b8364dffa5', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 430, '2020-04-21 07:38:43');
INSERT INTO `sys_user_operation_log` VALUES ('738b2d05c9659d884f23942defbc0bdd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 196, '2020-09-03 01:47:02');
INSERT INTO `sys_user_operation_log` VALUES ('73c041dff1bca667187a2fbd6a6882fd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 38, '2022-06-16 06:43:12');
INSERT INTO `sys_user_operation_log` VALUES ('73d3ddf1f0c8de27068bec0686e6fa3a', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000691\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 92, '2020-05-18 07:40:41');
INSERT INTO `sys_user_operation_log` VALUES ('73efa01218143c40c19b4bf98d954554', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 840, '2020-08-31 02:48:24');
INSERT INTO `sys_user_operation_log` VALUES ('745b396caef1c65b0c9a7d531a9e00a1', 'admin', 'TbCustomer', '新增', 'save', '{}', '127.0.0.1', 8, '2023-05-30 21:50:59');
INSERT INTO `sys_user_operation_log` VALUES ('746b13650544cedaafbd164227376e97', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 57, '2020-10-27 09:14:54');
INSERT INTO `sys_user_operation_log` VALUES ('7478d778a5e5107e43a5f82df347fb10', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 58, '2020-04-13 07:47:42');
INSERT INTO `sys_user_operation_log` VALUES ('748e4152d797269660c6e45885da50cf', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 26, '2020-10-04 16:56:33');
INSERT INTO `sys_user_operation_log` VALUES ('749d49c9f8dd5cbd3dc754894d0d5a6d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1622, '2020-04-03 14:23:33');
INSERT INTO `sys_user_operation_log` VALUES ('74a4911297b245d01691a849d5c38268', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 239, '2020-10-24 03:55:00');
INSERT INTO `sys_user_operation_log` VALUES ('74c1163da0bf20392fe560d0476bae63', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 990, '2020-04-16 08:25:34');
INSERT INTO `sys_user_operation_log` VALUES ('753e5680fce3ff3812747e62c886df57', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2312, '2020-04-29 14:48:25');
INSERT INTO `sys_user_operation_log` VALUES ('7548e9a871b0f64796dea46611343155', 'admin', '机构管理', '新增', 'save', '{}', '127.0.0.1', 61, '2020-11-07 17:09:31');
INSERT INTO `sys_user_operation_log` VALUES ('756c8f143a90460b22ed54c46803d7ab', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1393, '2020-05-23 05:36:16');
INSERT INTO `sys_user_operation_log` VALUES ('75aa546b3175bf4818e377e422357f0b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 148, '2020-09-06 10:19:07');
INSERT INTO `sys_user_operation_log` VALUES ('75db6134fae7e5de5a65aa1d72a5de2b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 467, '2020-04-17 01:40:48');
INSERT INTO `sys_user_operation_log` VALUES ('7610905bb0e1d58b5a475e157790f0a2', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 189, '2023-05-31 09:06:55');
INSERT INTO `sys_user_operation_log` VALUES ('762619235a8bb5c095ec58b93827b393', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 160, '2023-06-02 08:38:46');
INSERT INTO `sys_user_operation_log` VALUES ('7647fbe71dbba8cf171089d85b7f62a6', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 184, '2020-05-14 03:12:46');
INSERT INTO `sys_user_operation_log` VALUES ('766147e08d2a34257782f1ecd3de48a2', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 442, '2020-05-08 09:08:08');
INSERT INTO `sys_user_operation_log` VALUES ('769542724ee60e26496300ffb12b3561', 'zhouliufu', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 14, '2022-06-17 01:14:29');
INSERT INTO `sys_user_operation_log` VALUES ('772e67624f45bd69b08ef3eb863b4fa6', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 50, '2020-04-13 07:37:28');
INSERT INTO `sys_user_operation_log` VALUES ('775ba7784a2faa9d3d6831fd6ba13f82', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 58, '2020-04-13 07:15:11');
INSERT INTO `sys_user_operation_log` VALUES ('7768cfec9069ff29edf71da79d6fdbbc', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 57, '2020-03-23 05:26:23');
INSERT INTO `sys_user_operation_log` VALUES ('77f900d3489165fd5683c475728d0447', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 172, '2020-11-07 17:13:50');
INSERT INTO `sys_user_operation_log` VALUES ('7813fe9e8b95a9518000223d9ec7d2c4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 239, '2020-07-27 06:07:51');
INSERT INTO `sys_user_operation_log` VALUES ('78bd91f4734acabced8e6d7778f03305', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 141, '2023-06-02 09:05:24');
INSERT INTO `sys_user_operation_log` VALUES ('78c6600aa8db5a4dd37fc71148defa8a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 217, '2023-05-31 08:20:22');
INSERT INTO `sys_user_operation_log` VALUES ('78d98342e373bb2e5d38d7614ee6d2c9', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 214, '2020-04-07 10:02:07');
INSERT INTO `sys_user_operation_log` VALUES ('7945fb33a98fa9c6ef01a72c31c34c00', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 392, '2023-06-05 16:04:39');
INSERT INTO `sys_user_operation_log` VALUES ('794f65e4b749df69ea471e52aabcd9e8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 112, '2020-03-22 07:48:15');
INSERT INTO `sys_user_operation_log` VALUES ('7963580dd4e2d60216960afee9623317', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2004, '2022-06-16 18:12:35');
INSERT INTO `sys_user_operation_log` VALUES ('798ae29db7f09ca96f9b6b287a13dee5', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 174, '2023-06-05 14:52:23');
INSERT INTO `sys_user_operation_log` VALUES ('79999f9ecea740211e0b2effc97e2c42', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 243, '2020-04-17 06:33:52');
INSERT INTO `sys_user_operation_log` VALUES ('7a49602db4359d7e64af859050229d1f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 162, '2020-04-13 07:55:35');
INSERT INTO `sys_user_operation_log` VALUES ('7a5b749387a4e4dc7d4896a2587237f0', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 75, '2020-05-08 02:01:17');
INSERT INTO `sys_user_operation_log` VALUES ('7afd93b9347b63b19ca0a42ed5735052', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 64611, '2020-04-21 10:21:23');
INSERT INTO `sys_user_operation_log` VALUES ('7b08cb46e637d087a8a67ea5e16c0673', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"deptId\":\"OR1500058291\",\"page\":\"1\"}', '127.0.0.1', 81, '2020-04-16 08:58:05');
INSERT INTO `sys_user_operation_log` VALUES ('7b0c5b80fdc60125fcec48b2c7de191d', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 67, '2023-06-06 14:42:33');
INSERT INTO `sys_user_operation_log` VALUES ('7b416688e8a0d0d6aa4c1b077140f0b5', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 31, '2022-06-16 08:44:24');
INSERT INTO `sys_user_operation_log` VALUES ('7b6ebc0af2de659b502fe29f78fb0814', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 527, '2023-06-01 14:48:11');
INSERT INTO `sys_user_operation_log` VALUES ('7b93d87389bc633f72377d9009241acd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1039, '2020-03-21 06:43:25');
INSERT INTO `sys_user_operation_log` VALUES ('7b9df1ba480beb133761b9d79297581c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 269, '2020-04-30 03:54:11');
INSERT INTO `sys_user_operation_log` VALUES ('7bcb1289420509390e9ac8ed5b166ab3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1878, '2020-03-23 05:25:51');
INSERT INTO `sys_user_operation_log` VALUES ('7c13b8369ff696b1b70518dadc5469a3', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 221, '2020-04-07 09:01:07');
INSERT INTO `sys_user_operation_log` VALUES ('7c4e5919f6afe966d64fc8b9103868fe', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 102, '2020-09-03 06:31:05');
INSERT INTO `sys_user_operation_log` VALUES ('7c70dce9e293a09cf9b0718e817bdb68', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 149, '2023-06-02 10:51:59');
INSERT INTO `sys_user_operation_log` VALUES ('7cb32ca63c33db07b2e5dbcc8518a62a', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 37, '2023-05-29 10:24:53');
INSERT INTO `sys_user_operation_log` VALUES ('7ce3a2128ad7534cbf0180e1abf62f34', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 416, '2023-06-05 15:34:10');
INSERT INTO `sys_user_operation_log` VALUES ('7d63b34055b36654b32750331db625aa', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 272, '2020-09-07 09:27:38');
INSERT INTO `sys_user_operation_log` VALUES ('7db8aa8a6a6989327cbe80764eb9b6c2', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 24, '2020-11-07 17:03:45');
INSERT INTO `sys_user_operation_log` VALUES ('7dc78ed2084ec4ea3d07517c4a64404b', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"deptId\":\"OR1200000703\",\"page\":\"1\"}', '127.0.0.1', 217, '2020-04-16 08:58:07');
INSERT INTO `sys_user_operation_log` VALUES ('7dd22e9418dcf4110d6eb5f2d27d5ff1', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 56, '2020-04-13 07:15:09');
INSERT INTO `sys_user_operation_log` VALUES ('7dd7265dcf349f803ce440385dd6fcb4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 361, '2023-06-02 09:10:06');
INSERT INTO `sys_user_operation_log` VALUES ('7de31c48aee09463d16c0b560a9cad36', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 364, '2020-04-17 03:48:58');
INSERT INTO `sys_user_operation_log` VALUES ('7e6046fc2b44b11d8a0b62f692ef579e', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 69, '2020-08-12 01:51:13');
INSERT INTO `sys_user_operation_log` VALUES ('7e6e0e786e5503474f792df5819ffa5e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1850, '2020-05-11 07:50:58');
INSERT INTO `sys_user_operation_log` VALUES ('7e721e6500549081b661cd2a1e35a0e1', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 80, '2020-04-13 07:46:35');
INSERT INTO `sys_user_operation_log` VALUES ('7e894a62dd67088443f2bbf98d747074', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 541, '2022-06-17 00:44:28');
INSERT INTO `sys_user_operation_log` VALUES ('7f08ad7966c4f71fb4ee5552997e58ae', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 28, '2020-11-07 17:08:36');
INSERT INTO `sys_user_operation_log` VALUES ('7f15e192cd55d2e8d57710d6345b50b8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 185, '2023-05-31 12:31:10');
INSERT INTO `sys_user_operation_log` VALUES ('7f596aaf37b76defc7c5c4693845180b', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 12, '2023-05-31 09:27:16');
INSERT INTO `sys_user_operation_log` VALUES ('7fafa1e3d3c1159bc6404d8982044cca', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 2, '2022-06-17 01:14:27');
INSERT INTO `sys_user_operation_log` VALUES ('80557e6cf2928eea5f6ed98d98a1c1cf', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1242, '2020-04-30 03:54:06');
INSERT INTO `sys_user_operation_log` VALUES ('80c57071122335cc36c264c6ab21ff5a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 27, '2023-06-03 14:03:36');
INSERT INTO `sys_user_operation_log` VALUES ('813bbf0d2258ddd2e77c6b6e207e4b9d', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 60, '2022-06-15 05:40:40');
INSERT INTO `sys_user_operation_log` VALUES ('8149333c8f61f7329701641d2e48bb9f', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 399, '2023-06-02 09:31:54');
INSERT INTO `sys_user_operation_log` VALUES ('8171650b81b72c5f90224380fcb89372', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 483, '2022-06-16 15:18:48');
INSERT INTO `sys_user_operation_log` VALUES ('8201b17c912ea2efbd5f04f589d7a1f9', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 486, '2023-06-07 14:36:22');
INSERT INTO `sys_user_operation_log` VALUES ('82295ec8b02e609931b53f8eafb66105', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 161, '2023-06-02 09:56:10');
INSERT INTO `sys_user_operation_log` VALUES ('82a68e8cbcef4b7e638fb6b131ca4f00', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 435, '2020-04-29 14:53:36');
INSERT INTO `sys_user_operation_log` VALUES ('82cf95659117075f6f363a82cd3ae89e', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 68981, '2020-04-21 10:28:16');
INSERT INTO `sys_user_operation_log` VALUES ('8329ab84995625ebf929b35d2ac3e4a0', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 507, '2023-05-31 10:27:01');
INSERT INTO `sys_user_operation_log` VALUES ('833776ace59f56acfae4f720d68c9e8b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 316, '2020-09-06 06:10:31');
INSERT INTO `sys_user_operation_log` VALUES ('834e74208c5fe90a25946c1c458e70de', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 27, '2022-06-16 08:44:34');
INSERT INTO `sys_user_operation_log` VALUES ('83611ac9712339bd65933798c0101d70', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 133, '2020-10-24 03:51:37');
INSERT INTO `sys_user_operation_log` VALUES ('839031b88bc54154977545695ffdf22f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 306, '2020-04-08 07:32:57');
INSERT INTO `sys_user_operation_log` VALUES ('83cf2fc3856e2718cc2e87872b748716', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 61, '2020-05-08 03:07:57');
INSERT INTO `sys_user_operation_log` VALUES ('84332bb5b52f50262353f8e72341491b', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 191, '2020-04-13 02:53:48');
INSERT INTO `sys_user_operation_log` VALUES ('845c4a31b9fb3f9c4e42f1a1409f4290', 'Anonymous', '查询用户列表', 'openApi', 'userList', '{}', '127.0.0.1', 5, '2020-09-05 08:33:00');
INSERT INTO `sys_user_operation_log` VALUES ('84add9075f1b923d2e87ceb085da51bd', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 118, '2020-04-20 07:31:20');
INSERT INTO `sys_user_operation_log` VALUES ('84d83e5493273cd76262f57eb5c76bb6', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 192, '2020-05-14 03:13:10');
INSERT INTO `sys_user_operation_log` VALUES ('84e1c060aa364faf535f9316b6691762', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 401, '2020-10-27 09:01:09');
INSERT INTO `sys_user_operation_log` VALUES ('84e5116ab6f6acfcc208225c61b9236b', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 222, '2020-05-07 08:32:00');
INSERT INTO `sys_user_operation_log` VALUES ('8517d2513e8abfd3816d27e2a9f82d30', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"13333333333333333333\",\"roles\":\"\",\"phone\":\"1233333\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"1233333333333\"}', '127.0.0.1', 58, '2020-10-04 16:56:21');
INSERT INTO `sys_user_operation_log` VALUES ('85d83d3d32c46af60e105ed5e7772051', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 413, '2023-06-05 16:57:31');
INSERT INTO `sys_user_operation_log` VALUES ('85f1afe5f4449a48e272c227e7b14d7a', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 152, '2020-09-06 21:50:23');
INSERT INTO `sys_user_operation_log` VALUES ('85f8d2528dd004a61334ad5c9d1a8f9d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 545, '2020-04-20 07:36:21');
INSERT INTO `sys_user_operation_log` VALUES ('860c0351bff8f7a085f347eb5afb790d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 187, '2023-05-31 10:43:16');
INSERT INTO `sys_user_operation_log` VALUES ('86272c5013f386e3b724bbb8e91d7858', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 313, '2020-07-27 07:56:17');
INSERT INTO `sys_user_operation_log` VALUES ('862c29f13b32c0115e62700bfc532957', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 198, '2020-04-07 08:50:36');
INSERT INTO `sys_user_operation_log` VALUES ('86b297bd65610f52813e78f34bdc179f', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 72, '2020-08-20 09:38:44');
INSERT INTO `sys_user_operation_log` VALUES ('86db4a82e3c8123768f522631f093974', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 35, '2020-09-07 09:33:39');
INSERT INTO `sys_user_operation_log` VALUES ('8715eb83682b3e8ad9a0718b44037524', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 170, '2020-04-08 07:33:09');
INSERT INTO `sys_user_operation_log` VALUES ('87746bc07e014ac21c5e23c298ae18f6', 'admin', 'demo', '修改', 'update', '{}', '127.0.0.1', 4, '2022-06-15 06:08:07');
INSERT INTO `sys_user_operation_log` VALUES ('889667fb96bb0111caf12f9ae7b668ef', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1367, '2020-09-06 06:10:25');
INSERT INTO `sys_user_operation_log` VALUES ('889c2be78d8a31ea32d43ce53ff06af9', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 363, '2020-04-21 07:30:57');
INSERT INTO `sys_user_operation_log` VALUES ('895f1ab63b1b841f0399465652d431a6', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"deptId\":\"OR1500067158\",\"page\":\"1\"}', '127.0.0.1', 84, '2020-04-16 08:58:03');
INSERT INTO `sys_user_operation_log` VALUES ('89e58c92eaf4e0900045a5ea56ee0e04', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 39, '2023-05-31 10:28:32');
INSERT INTO `sys_user_operation_log` VALUES ('89e5c210f43cc7102b543df06bbfccf1', 'Anonymous', '查询用户列表', 'openApi', 'userList', '{\"ddd\":\"ddd\"}', '127.0.0.1', 1, '2020-09-05 13:35:31');
INSERT INTO `sys_user_operation_log` VALUES ('89f92a9060e0948e0aa73ce2f2fd4c9c', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 65, '2020-04-13 07:47:16');
INSERT INTO `sys_user_operation_log` VALUES ('8a23c30ee2ebfd4ce7fd59747f87f2e8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 25, '2023-06-02 17:24:18');
INSERT INTO `sys_user_operation_log` VALUES ('8a257e766e7d505569ddf5094debc466', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 157, '2023-06-05 15:43:20');
INSERT INTO `sys_user_operation_log` VALUES ('8a324bf93131fb61f9f579273f0a54e7', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 8, '2022-06-17 01:07:09');
INSERT INTO `sys_user_operation_log` VALUES ('8a9d67b33c8283f8708af7069668a5ed', 'admin', 'demo', '修改', 'update', '{}', '127.0.0.1', 5, '2022-06-15 06:08:10');
INSERT INTO `sys_user_operation_log` VALUES ('8ad71d9784115c2f8c2e4aacbff74809', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 92, '2020-03-16 09:32:30');
INSERT INTO `sys_user_operation_log` VALUES ('8b38e31970c30f52a212e84a7dc0663e', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"东莞分公司\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 99, '2020-08-20 09:13:30');
INSERT INTO `sys_user_operation_log` VALUES ('8be30d216154ea6ca26b6b7e57017c33', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 144, '2020-09-07 09:34:39');
INSERT INTO `sys_user_operation_log` VALUES ('8c40b4c13d766e7bc0e3b4873b765fb9', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 650, '2023-05-29 11:18:29');
INSERT INTO `sys_user_operation_log` VALUES ('8cc5010e6f0e4af7721b4c29092739ea', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 42, '2022-06-15 05:40:59');
INSERT INTO `sys_user_operation_log` VALUES ('8d1131026368ee0168acdc6852939151', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 210, '2020-04-13 07:22:00');
INSERT INTO `sys_user_operation_log` VALUES ('8d87bb358e7f6a856f46eaaae17d9684', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 237, '2020-09-03 02:20:36');
INSERT INTO `sys_user_operation_log` VALUES ('8da2cab03b63141ccb70052fde67c73b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 810, '2020-09-03 01:40:41');
INSERT INTO `sys_user_operation_log` VALUES ('8e068c29a8f8857f00d327e4fb5630f1', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 64, '2020-11-07 17:41:27');
INSERT INTO `sys_user_operation_log` VALUES ('8e292d35c7f2dd7d6cc1e37b17427336', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 917, '2020-09-02 07:37:38');
INSERT INTO `sys_user_operation_log` VALUES ('8e8599512ab9a92a3c0424486286140a', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"1325123334769213441\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 24, '2022-06-15 05:40:50');
INSERT INTO `sys_user_operation_log` VALUES ('8e94aa49b276d22a419703fde8dd823f', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"4444\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 198, '2020-11-07 17:40:59');
INSERT INTO `sys_user_operation_log` VALUES ('8ea606e1d4dfe036f70b7017005bf8d0', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 23, '2020-11-07 17:09:46');
INSERT INTO `sys_user_operation_log` VALUES ('8eb2115cc9acfac5532bd61b741bd2d4', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 6, '2023-06-05 15:49:57');
INSERT INTO `sys_user_operation_log` VALUES ('8f0268898db54b8521e791c7876598b8', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 139, '2020-05-08 02:44:14');
INSERT INTO `sys_user_operation_log` VALUES ('8fe35d4466953d1a88eb3d25d39bfe70', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 214, '2020-05-07 04:36:50');
INSERT INTO `sys_user_operation_log` VALUES ('9008910eaf37905e8be9f1867f3d794c', 'admin', 'TbCustomer', '新增', 'save', '{}', '127.0.0.1', 10, '2023-05-31 09:50:49');
INSERT INTO `sys_user_operation_log` VALUES ('903900cefb72a768af65f12af43a475e', 'root', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 43, '2022-06-17 01:13:38');
INSERT INTO `sys_user_operation_log` VALUES ('907bf2595b6eb68510b1758c1e3b6468', 'root', '用户管理', '列表', 'page', '{\"phone\":\"\",\"nickName\":\"\",\"disable\":\"\",\"roles\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 45, '2022-06-17 01:13:48');
INSERT INTO `sys_user_operation_log` VALUES ('90e5db89db6010c7c43416a5884921e6', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 161, '2023-06-05 15:56:14');
INSERT INTO `sys_user_operation_log` VALUES ('90f52331aa30b13e122dd8aed5cb37b5', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 112, '2020-11-07 17:13:32');
INSERT INTO `sys_user_operation_log` VALUES ('9126be5a4b26a9cf416fa9c7f9748440', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 95, '2020-05-08 02:28:37');
INSERT INTO `sys_user_operation_log` VALUES ('918b9aa794faab018e65f934b91a0542', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1283, '2020-09-03 06:47:20');
INSERT INTO `sys_user_operation_log` VALUES ('91b4e330de287b42558eba72a55a05dd', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 140, '2023-06-05 16:40:15');
INSERT INTO `sys_user_operation_log` VALUES ('91ce04afcc95a20f09cd2abc26857196', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 437, '2023-06-06 15:19:14');
INSERT INTO `sys_user_operation_log` VALUES ('9215938642e4a327dfb34e9149f90dac', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 31, '2023-05-29 10:40:32');
INSERT INTO `sys_user_operation_log` VALUES ('92512339b8f9a7567360cecf1de2abc8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 187, '2020-04-17 02:18:00');
INSERT INTO `sys_user_operation_log` VALUES ('925f1ad8dcd1732df11ec25a26870b64', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 93, '2020-08-31 02:52:45');
INSERT INTO `sys_user_operation_log` VALUES ('9261984bba06f93d664e9de22c26d075', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000387\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 98, '2020-05-18 07:40:37');
INSERT INTO `sys_user_operation_log` VALUES ('92726f3f6ebc4efde42c7b6e1b005458', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 26, '2020-11-07 17:06:02');
INSERT INTO `sys_user_operation_log` VALUES ('92b6f0eb05ddf6830f6250d37eedecf3', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 9, '2023-05-30 21:45:44');
INSERT INTO `sys_user_operation_log` VALUES ('92f33f0cacd83a25b03a014f323b7b5e', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 29, '2020-04-13 07:43:37');
INSERT INTO `sys_user_operation_log` VALUES ('9300cf1795f7c85db7ff0ebcf0b677e5', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 220, '2020-10-27 09:01:18');
INSERT INTO `sys_user_operation_log` VALUES ('93269e269975ef623477067f26fccd2b', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 2, '2022-06-17 01:14:39');
INSERT INTO `sys_user_operation_log` VALUES ('938f548bb2fdd94a2ab14d6ca679642b', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 221, '2020-04-08 07:47:27');
INSERT INTO `sys_user_operation_log` VALUES ('93ac45e796423efbad70ff64437c7d34', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 377, '2023-06-05 15:14:53');
INSERT INTO `sys_user_operation_log` VALUES ('93f0d59f8efb09725c6bd907a6f46039', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"2\"}', '127.0.0.1', 74, '2020-05-09 10:30:04');
INSERT INTO `sys_user_operation_log` VALUES ('945b254e7ef9df068785c6dd044a05f4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 572, '2020-04-29 07:18:57');
INSERT INTO `sys_user_operation_log` VALUES ('94977979b16bce056570fc87863e7969', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 48, '2022-06-16 08:44:13');
INSERT INTO `sys_user_operation_log` VALUES ('94b44f6a61caf4535ff41ef2b398606a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 44, '2022-06-17 01:13:20');
INSERT INTO `sys_user_operation_log` VALUES ('94f798aa2576b0e3ef640539e1bdc8d3', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 72, '2020-05-07 05:41:05');
INSERT INTO `sys_user_operation_log` VALUES ('952b9cebecaf1eefad531ac0e481ec96', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 175, '2020-04-13 02:27:17');
INSERT INTO `sys_user_operation_log` VALUES ('954138ce44710875f09371ea7fc30c4c', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 251, '2020-04-21 09:52:24');
INSERT INTO `sys_user_operation_log` VALUES ('9557370e1246aa77574ff5a258f839af', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 269, '2020-10-27 09:14:46');
INSERT INTO `sys_user_operation_log` VALUES ('9561918db14a6ddc3b75435b570527e5', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:29:16');
INSERT INTO `sys_user_operation_log` VALUES ('95682cca578afdf64ab2aeb0548ba133', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 35, '2022-06-16 08:44:24');
INSERT INTO `sys_user_operation_log` VALUES ('9568ac1885751f52bb746aa466122876', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 895, '2023-06-02 15:52:42');
INSERT INTO `sys_user_operation_log` VALUES ('959733e5a68fb6247eb5a36d5bbfbff8', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 76, '2022-06-17 01:14:27');
INSERT INTO `sys_user_operation_log` VALUES ('95db9bda6bff79749968b6966a155803', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1423, '2020-10-24 03:56:48');
INSERT INTO `sys_user_operation_log` VALUES ('95e3b3f89e86878d6330b33bf3c4773e', 'admin', '菜单管理', '删除', 'delete', '{}', '127.0.0.1', 110, '2020-11-07 17:43:12');
INSERT INTO `sys_user_operation_log` VALUES ('966602fa3a22442629d793ae220ea552', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 138, '2020-03-16 07:11:48');
INSERT INTO `sys_user_operation_log` VALUES ('96881be9c9fad5398ba265447340b89f', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 301, '2020-08-20 09:09:57');
INSERT INTO `sys_user_operation_log` VALUES ('96db4b1b5c8eff3ed7a5c9ffe8c6303b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 133, '2023-06-02 08:14:38');
INSERT INTO `sys_user_operation_log` VALUES ('972b73066e834b046a451c143834814e', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 184, '2020-07-30 06:57:20');
INSERT INTO `sys_user_operation_log` VALUES ('9770d43fe58b005576e321d7fa312f21', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 420, '2023-06-01 14:26:36');
INSERT INTO `sys_user_operation_log` VALUES ('97a538afd384f8cfa8c51e91ad9fbdc4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 108, '2020-08-01 06:45:18');
INSERT INTO `sys_user_operation_log` VALUES ('981c8a71e947bd2f43f09a102e5375f0', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 47, '2020-05-08 02:06:10');
INSERT INTO `sys_user_operation_log` VALUES ('9844a3a3c72b142a9db3a4977871ba00', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1326, '2020-09-06 22:00:57');
INSERT INTO `sys_user_operation_log` VALUES ('985b4f0b8bf7e6ffb39129f40fbc5492', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 130, '2020-04-17 06:08:55');
INSERT INTO `sys_user_operation_log` VALUES ('9863e797cb43ae5071ff576c451fffb1', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"121\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 75, '2020-08-20 09:14:55');
INSERT INTO `sys_user_operation_log` VALUES ('9968f41085b233d3baea85b322e24d2f', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 16, '2023-06-05 15:00:53');
INSERT INTO `sys_user_operation_log` VALUES ('99acfe34cc87ee01c2265b497697a997', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 53, '2020-09-06 08:46:38');
INSERT INTO `sys_user_operation_log` VALUES ('99b155f4665d5fda945489498ae6d5cf', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"1325121829601280001\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 93, '2020-11-07 17:40:55');
INSERT INTO `sys_user_operation_log` VALUES ('9a020f32f7341c42a4fef3daf30a4eb6', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 76, '2020-09-06 21:43:54');
INSERT INTO `sys_user_operation_log` VALUES ('9a6b98f56d2cc3b59847a4e76142f63e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 184, '2020-04-07 10:02:21');
INSERT INTO `sys_user_operation_log` VALUES ('9a94e1e1da5acf2cd41f4a0e5f6ad262', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 106, '2020-03-22 05:37:43');
INSERT INTO `sys_user_operation_log` VALUES ('9aa0271a1c9c05d188d3b5a89033184a', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 183, '2020-04-13 02:27:33');
INSERT INTO `sys_user_operation_log` VALUES ('9ac4cab89afd6c335fa0b8f7ebd16d6e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1152, '2023-05-29 11:52:47');
INSERT INTO `sys_user_operation_log` VALUES ('9ad4773b31ae5548ec11b692f4529efd', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 19, '2022-06-15 05:41:03');
INSERT INTO `sys_user_operation_log` VALUES ('9af029d79a3764d6a14b04b4e71da3d6', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"1\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 71, '2020-08-20 09:13:43');
INSERT INTO `sys_user_operation_log` VALUES ('9b2b454aa6e65f7ac3d162b0ab0451fc', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"东莞分公司\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 105, '2020-08-20 09:13:17');
INSERT INTO `sys_user_operation_log` VALUES ('9b541e01072cbdcb72c3aa090e52939c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 134, '2023-06-02 08:58:25');
INSERT INTO `sys_user_operation_log` VALUES ('9b6a17d41e5105dcfe504ea42127bf39', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 164, '2020-09-05 08:56:21');
INSERT INTO `sys_user_operation_log` VALUES ('9b997d840ab142f153fcc42342c2be98', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 133, '2020-03-16 08:04:57');
INSERT INTO `sys_user_operation_log` VALUES ('9b99e3e72488c9a262270ef4aaecfdda', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 17, '2023-05-29 10:53:00');
INSERT INTO `sys_user_operation_log` VALUES ('9bb8071769f167961ec5fd07dbf2b0d8', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 258, '2020-09-02 06:59:45');
INSERT INTO `sys_user_operation_log` VALUES ('9bcdcb7797cd82f3044d7109b66b3d6b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 154, '2023-06-01 14:07:16');
INSERT INTO `sys_user_operation_log` VALUES ('9c089d502c1bbfe18a62c73f5baf6955', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 203, '2020-09-07 09:35:11');
INSERT INTO `sys_user_operation_log` VALUES ('9c58ca0e6c49010828adf67433ae9a48', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 166, '2022-06-15 09:26:28');
INSERT INTO `sys_user_operation_log` VALUES ('9ca783928332be94f0f4ed1907fb9157', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 32, '2020-09-03 02:21:46');
INSERT INTO `sys_user_operation_log` VALUES ('9ccfed9fd96ca521d01dcb703a3e3ac4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 407, '2023-05-31 11:04:42');
INSERT INTO `sys_user_operation_log` VALUES ('9ce4742b26c30b6af9a1478346430b15', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 12, '2023-06-01 09:49:51');
INSERT INTO `sys_user_operation_log` VALUES ('9cecd85f1962d455f0b9f0d6a71608e6', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 521, '2023-05-31 10:02:39');
INSERT INTO `sys_user_operation_log` VALUES ('9d02364a39439714689211b6d3ed3c9f', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 57, '2020-05-09 10:29:18');
INSERT INTO `sys_user_operation_log` VALUES ('9d075492b64cac1aa70558e3de549ee4', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"111\"}', '127.0.0.1', 65, '2020-05-09 10:30:47');
INSERT INTO `sys_user_operation_log` VALUES ('9dc95fa884cf7b2bceab55652f714e86', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 70, '2020-09-06 22:03:23');
INSERT INTO `sys_user_operation_log` VALUES ('9e7f84a4b4efd4462df49bfc3f41a782', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1637, '2020-08-12 01:50:57');
INSERT INTO `sys_user_operation_log` VALUES ('9ea1099767e219cea3b7e5a380e99eb6', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 349, '2020-04-09 02:51:36');
INSERT INTO `sys_user_operation_log` VALUES ('9ea9fd5f207458dac6378bf332af2065', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 441, '2020-04-24 01:16:34');
INSERT INTO `sys_user_operation_log` VALUES ('9eac9276ad0fe5c7a33e0c9c685be135', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 188, '2020-08-01 06:45:17');
INSERT INTO `sys_user_operation_log` VALUES ('9ebc3b731a795ebdf2374a2ffd23ea59', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 197, '2023-05-31 10:28:34');
INSERT INTO `sys_user_operation_log` VALUES ('9f2d23af5a15056594c5fcd0cfa6ca9a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1244, '2020-09-02 06:56:59');
INSERT INTO `sys_user_operation_log` VALUES ('9f3c4cc49e0933c4a3647875fee96f09', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 157, '2023-06-07 14:43:54');
INSERT INTO `sys_user_operation_log` VALUES ('9f415217d8fd03fa261f97f4d4829448', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 8, '2023-05-31 09:40:03');
INSERT INTO `sys_user_operation_log` VALUES ('9fde99fcd87eae12f2a886af908d569b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 173, '2020-09-02 07:49:37');
INSERT INTO `sys_user_operation_log` VALUES ('9ff33ee8acaa3d342d10491cc0b4ea19', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 21, '2022-06-16 06:43:13');
INSERT INTO `sys_user_operation_log` VALUES ('a0452f774f17341e9caeb3520f04eafc', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 307, '2020-07-24 07:55:41');
INSERT INTO `sys_user_operation_log` VALUES ('a04e457873a4b47d300cbad69a7e38ba', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 418, '2023-06-02 08:17:16');
INSERT INTO `sys_user_operation_log` VALUES ('a05d6728b56cfca1c0b41560deb5845c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 270, '2020-04-09 02:51:46');
INSERT INTO `sys_user_operation_log` VALUES ('a0b7c23d3587157b72c383660b187669', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"OR1200000387\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 105, '2020-05-18 07:38:25');
INSERT INTO `sys_user_operation_log` VALUES ('a0e93baf6e8ab23e697e22fb459f40d7', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 184, '2020-07-28 09:01:21');
INSERT INTO `sys_user_operation_log` VALUES ('a18497069876eea7e32d3e8edb1ec911', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 113, '2020-04-17 05:47:58');
INSERT INTO `sys_user_operation_log` VALUES ('a1886f2255f9dcd792510c82deb6af24', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 295, '2020-09-05 06:50:41');
INSERT INTO `sys_user_operation_log` VALUES ('a192f2d19e62451161996468921bdf08', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 109, '2020-11-07 17:13:50');
INSERT INTO `sys_user_operation_log` VALUES ('a1c17314cfe09473221943fafb633afe', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 115, '2022-06-15 05:58:48');
INSERT INTO `sys_user_operation_log` VALUES ('a20a194b9171a5610e4b63b90ac7ac23', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 106, '2020-04-21 03:02:47');
INSERT INTO `sys_user_operation_log` VALUES ('a20c8835ec39f44e341bf78f35a9a486', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 514, '2023-06-05 16:17:10');
INSERT INTO `sys_user_operation_log` VALUES ('a24ee2bc16791852914a0ad8fa3ce971', 'admin', 'TbCustomer', '新增', 'save', '{}', '127.0.0.1', 11, '2023-06-02 10:50:48');
INSERT INTO `sys_user_operation_log` VALUES ('a277b3eb53604907b918f571da394ea7', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 50, '2020-05-08 02:00:30');
INSERT INTO `sys_user_operation_log` VALUES ('a285a0522a49ade9d22aa48d606673dd', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 93, '2020-04-21 10:07:40');
INSERT INTO `sys_user_operation_log` VALUES ('a33e1dbbf450b68b0bef9c4218577fcd', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 175, '2023-05-31 11:20:59');
INSERT INTO `sys_user_operation_log` VALUES ('a340608c4380ef1193b90420bf09ced4', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 145, '2020-10-24 03:50:34');
INSERT INTO `sys_user_operation_log` VALUES ('a34dbe6995e4e952cd5c10fd0b812c3a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 99, '2020-09-02 07:50:56');
INSERT INTO `sys_user_operation_log` VALUES ('a3540caa162283461194256796cd38f5', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 888, '2020-07-28 08:14:14');
INSERT INTO `sys_user_operation_log` VALUES ('a39f527b7ddf425c3e5293124ebd37d4', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 154, '2020-09-07 09:35:18');
INSERT INTO `sys_user_operation_log` VALUES ('a3bae2fb16b9034856e3ddbafb3e20ca', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 138, '2023-06-02 09:22:43');
INSERT INTO `sys_user_operation_log` VALUES ('a3dbaffcf5e92c08bb14987c86bb034e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 121, '2022-06-16 18:14:59');
INSERT INTO `sys_user_operation_log` VALUES ('a3df7da1350fe257d28531841214cb6c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 13718, '2023-06-07 14:36:38');
INSERT INTO `sys_user_operation_log` VALUES ('a3e2f5ee34456e997cbb210e80955999', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 137, '2023-06-01 09:24:54');
INSERT INTO `sys_user_operation_log` VALUES ('a4212633ef33e074160769d634f0dc50', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-05-07 05:42:32');
INSERT INTO `sys_user_operation_log` VALUES ('a448a9c74e9f38400023c1e62a6464a2', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 128, '2022-06-15 09:35:51');
INSERT INTO `sys_user_operation_log` VALUES ('a4b05c39b9e88467c39021cede9587b3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 962, '2023-05-29 16:08:51');
INSERT INTO `sys_user_operation_log` VALUES ('a4cc0ebe7326ccd5ec0da6dd2470fb08', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1320, '2020-05-08 03:51:54');
INSERT INTO `sys_user_operation_log` VALUES ('a52cd1dba870d1522e2188f1ab041b34', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 243, '2020-04-07 08:59:30');
INSERT INTO `sys_user_operation_log` VALUES ('a5fb11d2bed4590f5fed52030fa952e8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 147, '2023-06-02 10:02:51');
INSERT INTO `sys_user_operation_log` VALUES ('a61e39b5cb448c4f833ed09ba3945cd4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 552, '2023-05-31 10:43:15');
INSERT INTO `sys_user_operation_log` VALUES ('a68ee08c2e9166c9246f024bc5b5df02', 'admin', 'TbCustomer', '删除', 'delete', '{}', '127.0.0.1', 13, '2023-06-02 10:57:10');
INSERT INTO `sys_user_operation_log` VALUES ('a6adadd44e6199e03348a0ea5baa6fff', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 365, '2020-04-15 06:53:55');
INSERT INTO `sys_user_operation_log` VALUES ('a6d640f283f228cf22ef728d4dc8a982', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 11, '2023-06-02 09:56:42');
INSERT INTO `sys_user_operation_log` VALUES ('a77afdc40a8823aa69b04fd2bcd34885', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 119, '2020-04-17 02:18:02');
INSERT INTO `sys_user_operation_log` VALUES ('a79731bd28afce67aa83359cf23b0fc3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 150, '2020-07-28 09:01:21');
INSERT INTO `sys_user_operation_log` VALUES ('a7af2f755d4bf9bf87d0714d038a31de', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 428, '2023-06-01 09:21:29');
INSERT INTO `sys_user_operation_log` VALUES ('a7b64feaad495d892a1115383856bf06', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 45, '2020-05-08 02:11:08');
INSERT INTO `sys_user_operation_log` VALUES ('a7dc0b1174903c43fac66ffd4186afe1', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 140, '2020-09-07 09:34:32');
INSERT INTO `sys_user_operation_log` VALUES ('a805234a206b13bb3749b9f9fa39bff5', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 48, '2022-06-16 08:44:14');
INSERT INTO `sys_user_operation_log` VALUES ('a80856eb96b50577fc72525aed36e195', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 45, '2023-06-06 16:00:41');
INSERT INTO `sys_user_operation_log` VALUES ('a83b80b36002f1ebb01d8178280e3cc6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1663, '2020-05-08 03:51:54');
INSERT INTO `sys_user_operation_log` VALUES ('a8730ff461345df4e4425107c6ac42bc', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 857, '2023-05-30 21:29:27');
INSERT INTO `sys_user_operation_log` VALUES ('a90684fc37a2358e608d1ffaad0c8fd8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 83, '2020-04-13 02:27:27');
INSERT INTO `sys_user_operation_log` VALUES ('a91fb1bcede93f0407651404a0db507e', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 84, '2020-09-06 12:58:16');
INSERT INTO `sys_user_operation_log` VALUES ('a94df23f62714587f36737ff66019e46', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"1325123225058803713\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 96, '2020-11-07 17:40:56');
INSERT INTO `sys_user_operation_log` VALUES ('a954de8db92d209f666c2f7759633cd4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 146, '2023-06-01 09:27:35');
INSERT INTO `sys_user_operation_log` VALUES ('aa20bff5220f67f290c73a56e9d192e4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 35, '2022-06-17 01:14:39');
INSERT INTO `sys_user_operation_log` VALUES ('aa9952f4ed26958e3d738b6fd0a35252', 'admin', '菜单管理', '新增', 'save', '{}', '127.0.0.1', 111, '2020-05-08 01:37:35');
INSERT INTO `sys_user_operation_log` VALUES ('aaac8cd9d4f2e55c96eb25ffc8123194', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 409, '2022-06-15 17:36:25');
INSERT INTO `sys_user_operation_log` VALUES ('ab5d0f5a6a838955c9c749c540bcd9ac', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 164, '2022-06-16 18:12:36');
INSERT INTO `sys_user_operation_log` VALUES ('abbd0ab70e82ceb5cf59706d17933514', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 51, '2020-04-13 07:37:33');
INSERT INTO `sys_user_operation_log` VALUES ('ac1c75a4c752aed0be9a656f6e5d3839', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 373, '2020-04-13 01:32:13');
INSERT INTO `sys_user_operation_log` VALUES ('ac2df33e84f1496ca94bf1c137ece88d', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 153, '2023-05-31 10:57:06');
INSERT INTO `sys_user_operation_log` VALUES ('ac4ab85c87738ed46062300b23a7392c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 154, '2020-09-05 12:16:23');
INSERT INTO `sys_user_operation_log` VALUES ('ac8566e5b416f294f351df7506274466', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 482, '2023-06-06 15:42:45');
INSERT INTO `sys_user_operation_log` VALUES ('ac8e5a50b0c112965395c03b7bac76ab', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 76, '2020-03-22 07:58:13');
INSERT INTO `sys_user_operation_log` VALUES ('acc6e91f7f10113ca7c91e1e2397d631', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 169, '2020-04-13 06:50:22');
INSERT INTO `sys_user_operation_log` VALUES ('accdcf7221733dd9cd31bbf9d0db52f9', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 136, '2020-10-24 03:50:32');
INSERT INTO `sys_user_operation_log` VALUES ('acd4fbfbb3cde085340d311c9733d53b', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 7, '2023-05-31 10:21:53');
INSERT INTO `sys_user_operation_log` VALUES ('aced7f7ffd82254f22de8a9189129442', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 162, '2023-06-01 14:02:04');
INSERT INTO `sys_user_operation_log` VALUES ('ad6701b3dc9b0c0c665333965078af86', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 114, '2022-06-16 08:42:42');
INSERT INTO `sys_user_operation_log` VALUES ('ada76fe372b5debcab63533909e1dbed', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 151, '2020-09-07 09:33:34');
INSERT INTO `sys_user_operation_log` VALUES ('adba1adb81d513a509c6506471f5a35c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1405, '2020-09-23 07:35:38');
INSERT INTO `sys_user_operation_log` VALUES ('ade90d02284dc8d50acb94364d4547f8', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-05-08 02:48:58');
INSERT INTO `sys_user_operation_log` VALUES ('ae0cd8ec793775b1a2aa1717317b5ec9', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 75, '2020-05-09 10:30:18');
INSERT INTO `sys_user_operation_log` VALUES ('ae1deee67734401b3b933fdb5cab8c5d', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 44, '2022-06-16 06:43:12');
INSERT INTO `sys_user_operation_log` VALUES ('ae4342bc553aa5080acb054860861b2e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1772, '2020-07-26 08:57:39');
INSERT INTO `sys_user_operation_log` VALUES ('aea7534a050dc7f9643695db1b475187', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"2\"}', '127.0.0.1', 78, '2020-04-08 07:47:21');
INSERT INTO `sys_user_operation_log` VALUES ('aeeb26b15329a55ef3c72c5085412118', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1157, '2020-07-24 07:55:40');
INSERT INTO `sys_user_operation_log` VALUES ('af2374106de2932dc1b003f98e24612e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 207, '2020-05-07 04:37:10');
INSERT INTO `sys_user_operation_log` VALUES ('af6f40855034b06f346c333f0b785346', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 136, '2020-10-24 03:50:50');
INSERT INTO `sys_user_operation_log` VALUES ('af7c8b6bf2960ba7fd6065f6f748db75', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1525, '2020-04-21 02:45:42');
INSERT INTO `sys_user_operation_log` VALUES ('afdbf91fc8245c9970f182960ea2ce2b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 335, '2020-03-21 08:03:31');
INSERT INTO `sys_user_operation_log` VALUES ('aff9c363614041bc33cd4934ced9d047', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 143, '2022-06-16 08:46:58');
INSERT INTO `sys_user_operation_log` VALUES ('b03fe30eb4794cadbad04c95e644cd82', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1915, '2022-06-15 05:58:34');
INSERT INTO `sys_user_operation_log` VALUES ('b05407564b598c2e7594f44623d72e99', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 55, '2020-10-04 16:56:31');
INSERT INTO `sys_user_operation_log` VALUES ('b07c8b246a95798a16c4efbeff9713ba', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 467, '2020-03-21 06:43:28');
INSERT INTO `sys_user_operation_log` VALUES ('b087966ad0204ab0f3d78e88f2621607', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '192.168.213.1', 135, '2020-04-16 07:35:03');
INSERT INTO `sys_user_operation_log` VALUES ('b0aeeff97abbb4fa09cc479c11d3996c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 2173, '2020-04-24 01:16:33');
INSERT INTO `sys_user_operation_log` VALUES ('b0cb472ea0ca8e8102c233fa9c01e713', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 396, '2023-06-02 08:38:36');
INSERT INTO `sys_user_operation_log` VALUES ('b169b705997e49f78b6960ecae626530', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 32, '2023-05-29 10:52:47');
INSERT INTO `sys_user_operation_log` VALUES ('b1a1a44f125f61a14aa326508589d466', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 194, '2023-06-05 15:40:40');
INSERT INTO `sys_user_operation_log` VALUES ('b1b6f124083c26df394a5ce459fb5ce3', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 170, '2023-06-05 16:14:26');
INSERT INTO `sys_user_operation_log` VALUES ('b1b81733d79ca608e2f72508b1caad99', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 124, '2020-04-16 09:01:35');
INSERT INTO `sys_user_operation_log` VALUES ('b1ebcc7f2b53ea805b13adcd97c359ca', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 128, '2020-11-07 17:12:47');
INSERT INTO `sys_user_operation_log` VALUES ('b1fad04f3e3cae4e80775322facd651e', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 61, '2020-04-13 08:02:56');
INSERT INTO `sys_user_operation_log` VALUES ('b20d538577a623ad3a531ca7dace6eaa', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 23, '2023-06-06 14:44:04');
INSERT INTO `sys_user_operation_log` VALUES ('b22b0461f0c78cd7bee84f58cc863fdf', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"2\"}', '127.0.0.1', 94, '2020-04-07 07:01:19');
INSERT INTO `sys_user_operation_log` VALUES ('b23569f14b75f1a99f9392713d5f3e22', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1629, '2020-07-30 06:56:54');
INSERT INTO `sys_user_operation_log` VALUES ('b27bbeddb6d229bea341ed03defc68b7', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 145, '2023-06-01 10:41:32');
INSERT INTO `sys_user_operation_log` VALUES ('b2a58a9f90d28e09c08579ae5ddc63aa', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 180, '2020-11-07 17:12:47');
INSERT INTO `sys_user_operation_log` VALUES ('b2ba626162bc870890b1a56e4cc50f88', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 430, '2023-06-02 10:31:11');
INSERT INTO `sys_user_operation_log` VALUES ('b3513e4c8c9e5a537d25f9be2a432fc7', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 926, '2020-04-16 07:32:41');
INSERT INTO `sys_user_operation_log` VALUES ('b3788b16c41738717ec9b4c580f35cb8', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 99, '2020-04-15 06:54:07');
INSERT INTO `sys_user_operation_log` VALUES ('b379e38f602a6f9fd616c6fdd48d45b0', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 403, '2023-06-07 15:15:27');
INSERT INTO `sys_user_operation_log` VALUES ('b3b783cfbef5742ca48e6c895d3cc21c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 219, '2023-06-07 16:39:54');
INSERT INTO `sys_user_operation_log` VALUES ('b45be212d5dc460cf635ef5a9dd9dda4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 840, '2023-05-29 10:06:29');
INSERT INTO `sys_user_operation_log` VALUES ('b48a16b7b5e9ee3938fb5af981c3f88b', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 360, '2023-06-01 11:11:11');
INSERT INTO `sys_user_operation_log` VALUES ('b4fd22377ee0ec103169716c9c16de1a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 181, '2023-05-29 11:18:30');
INSERT INTO `sys_user_operation_log` VALUES ('b55b27c9f4072166bc913d286b41a1a9', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"deptId\":\"OR1200000703\",\"page\":\"1\"}', '127.0.0.1', 210, '2020-04-21 09:55:10');
INSERT INTO `sys_user_operation_log` VALUES ('b5773a60bb440fc171967cdbbcf2be22', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 342, '2020-04-03 14:23:40');
INSERT INTO `sys_user_operation_log` VALUES ('b5d5687fc8e6c741725ef52bdfeab98f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{\"_\":\"1586246938373\"}', '', 88, '2020-04-07 08:08:58');
INSERT INTO `sys_user_operation_log` VALUES ('b5da2fe8954c3f0b8c89a40673bcb6e9', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 371, '2020-11-07 17:40:33');
INSERT INTO `sys_user_operation_log` VALUES ('b5e02f4a3f86087b93f3de81a5480e7c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1393, '2020-04-21 04:35:54');
INSERT INTO `sys_user_operation_log` VALUES ('b656947c4a2bb22369392a43f9b79a17', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 660, '2020-04-20 01:24:42');
INSERT INTO `sys_user_operation_log` VALUES ('b68226b15abbd058f52edd666953ba16', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:09:31');
INSERT INTO `sys_user_operation_log` VALUES ('b737019290a786e763d6f5a3fe1f133a', 'admin', '机构管理', '新增', 'save', '{}', '127.0.0.1', 74, '2020-11-07 17:03:58');
INSERT INTO `sys_user_operation_log` VALUES ('b7455d773f081417ace7698f691aeb4f', 'admin', '数据字典', '导出', 'export', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 208, '2023-06-05 15:50:07');
INSERT INTO `sys_user_operation_log` VALUES ('b74e09088c49713aad767514873e09da', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 252, '2020-07-28 08:14:18');
INSERT INTO `sys_user_operation_log` VALUES ('b85dc42985a55ba9288a2d06ec2a9eb7', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000703\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 93, '2020-08-20 09:13:12');
INSERT INTO `sys_user_operation_log` VALUES ('b956a9af2f38c4da5968e8891459a3c4', 'root', '角色管理', '修改', 'update', '{}', '127.0.0.1', 22, '2022-06-17 01:14:21');
INSERT INTO `sys_user_operation_log` VALUES ('b95d703f229b70398fcd0f554cc4575b', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 97, '2020-05-08 03:51:52');
INSERT INTO `sys_user_operation_log` VALUES ('b9640eb2249c6dbcce9a59cf11e61402', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 173, '2020-09-02 07:48:59');
INSERT INTO `sys_user_operation_log` VALUES ('b980adfdec01684a29dc66eab0024eab', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 72, '2020-05-09 10:29:33');
INSERT INTO `sys_user_operation_log` VALUES ('b9877f1943b35ce907d055391354b974', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 264, '2020-09-03 06:47:21');
INSERT INTO `sys_user_operation_log` VALUES ('b9af65fb8ec3597f395fc6f37abe36ad', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 113, '2020-04-08 07:47:36');
INSERT INTO `sys_user_operation_log` VALUES ('b9bf69522583d9a5a5ea2b95ce6a88e0', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 138, '2020-09-07 09:35:10');
INSERT INTO `sys_user_operation_log` VALUES ('b9f327d884c29547643b3a3422ac74d3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 185, '2020-09-03 01:47:36');
INSERT INTO `sys_user_operation_log` VALUES ('b9f8baa9eac51837cfd1e1dfd2cca562', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 167, '2023-06-05 16:17:18');
INSERT INTO `sys_user_operation_log` VALUES ('ba03d676b14c4dfc855af759f493aa1c', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 119, '2020-09-05 08:56:34');
INSERT INTO `sys_user_operation_log` VALUES ('ba7a0314bbbe75ec2d7e83e229a3c851', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 159, '2020-09-02 13:56:30');
INSERT INTO `sys_user_operation_log` VALUES ('ba9b74871ee9c2cdb817154584ae1efc', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 413, '2023-06-02 08:58:24');
INSERT INTO `sys_user_operation_log` VALUES ('baa7efa39ad4bf29c527fe9f5ed6a022', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 117, '2020-07-27 07:26:03');
INSERT INTO `sys_user_operation_log` VALUES ('bac40a03985c119272ce722eb84698bd', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 107, '2020-09-05 08:57:08');
INSERT INTO `sys_user_operation_log` VALUES ('bae7e8e1b398a80cc19330f6a5209c93', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 27, '2020-04-13 08:06:22');
INSERT INTO `sys_user_operation_log` VALUES ('bb16890181e7dea7ad8023fda8b383cb', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 28, '2020-05-07 05:43:22');
INSERT INTO `sys_user_operation_log` VALUES ('bb49350dbd2bc43e2274be1abf93c47a', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 70, '2020-04-13 08:06:18');
INSERT INTO `sys_user_operation_log` VALUES ('bb606f3ebc64153c1256419d8d5c59e6', 'admin', 'TbCustomer', '新增', 'save', '{}', '127.0.0.1', 11, '2023-05-31 09:07:28');
INSERT INTO `sys_user_operation_log` VALUES ('bb8c598a7060c10e1257e8515a1edb08', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 252, '2020-04-07 08:59:31');
INSERT INTO `sys_user_operation_log` VALUES ('bbad3f0e5c633652f44e921b94642b8c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 175, '2023-06-05 16:26:47');
INSERT INTO `sys_user_operation_log` VALUES ('bbadfed6832dabf06312088af0dfcbcd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 519, '2023-05-31 10:28:02');
INSERT INTO `sys_user_operation_log` VALUES ('bbbe0bff9f6d8213dff73c94cc8c30e7', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 15, '2023-06-05 15:49:31');
INSERT INTO `sys_user_operation_log` VALUES ('bc557f3a023062fad6731620079f4af4', 'admin', '用户管理', '重置密码', 'resetPassword', '{}', '127.0.0.1', 40, '2022-06-17 01:13:10');
INSERT INTO `sys_user_operation_log` VALUES ('bc62a230f2f5001f39606734af4fb4e2', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 822, '2020-03-21 06:43:57');
INSERT INTO `sys_user_operation_log` VALUES ('bcad2c6f103f44a5a750052c11765619', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 392, '2020-05-07 05:44:24');
INSERT INTO `sys_user_operation_log` VALUES ('bcd2df328ce869447b361f604aa9ebe4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 401, '2020-04-08 07:16:33');
INSERT INTO `sys_user_operation_log` VALUES ('bdbdba02df29427cba973884a62b4b8b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2423, '2020-08-11 02:06:02');
INSERT INTO `sys_user_operation_log` VALUES ('bdd42c125bbf55f58c946753fca7b340', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 22, '2023-05-29 10:41:52');
INSERT INTO `sys_user_operation_log` VALUES ('bdd45b1285afe73c04146e8c71d361d7', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:23:44');
INSERT INTO `sys_user_operation_log` VALUES ('bdecee81d527cb9ceb9c4436ae899230', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"111\"}', '127.0.0.1', 60, '2020-05-09 10:30:26');
INSERT INTO `sys_user_operation_log` VALUES ('be8c8f273adf5f322e870a98b587cc9a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 294, '2020-05-09 10:28:05');
INSERT INTO `sys_user_operation_log` VALUES ('befdaa3bd885e262acad86b28f265092', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1395, '2020-04-07 08:08:36');
INSERT INTO `sys_user_operation_log` VALUES ('bf0b31e603a1ace5b03af02a38c9e701', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 265, '2023-05-31 10:02:40');
INSERT INTO `sys_user_operation_log` VALUES ('bf30d346acec3676295ed2a06436e19b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 158, '2020-09-07 09:35:08');
INSERT INTO `sys_user_operation_log` VALUES ('bf7653f56d64467d3b6588e12885d491', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000647\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 85, '2020-11-07 17:01:56');
INSERT INTO `sys_user_operation_log` VALUES ('bf81874e5aad30bb47f926ab05a5bd31', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"4444\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 220, '2020-11-07 17:40:34');
INSERT INTO `sys_user_operation_log` VALUES ('c03ea479a86e460dbe5fbefdf1aaefca', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 61, '2020-09-07 09:44:05');
INSERT INTO `sys_user_operation_log` VALUES ('c0417fd92a9b105990628c45a53d2b53', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1417, '2020-05-08 07:16:05');
INSERT INTO `sys_user_operation_log` VALUES ('c09e059bd69b264ec48ae4372ebf27e1', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 485, '2020-04-17 02:42:46');
INSERT INTO `sys_user_operation_log` VALUES ('c0cf135d992ce95731084d8ad04717a5', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 308, '2020-05-23 05:36:17');
INSERT INTO `sys_user_operation_log` VALUES ('c18b26e9ca695cf6ea5aa1379ef7d785', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 176, '2020-11-07 17:13:33');
INSERT INTO `sys_user_operation_log` VALUES ('c1f2937af4ba5da3ced7593b58a6d193', 'admin', '机构管理', '新增', 'save', '{}', '127.0.0.1', 55, '2020-11-07 17:04:40');
INSERT INTO `sys_user_operation_log` VALUES ('c29f3f03af715c48fbf669554f67a66a', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 83, '2020-08-31 02:26:13');
INSERT INTO `sys_user_operation_log` VALUES ('c31443dd2ef824e39ac0d86f0cfe36c5', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 230, '2020-05-07 05:37:24');
INSERT INTO `sys_user_operation_log` VALUES ('c3517aeb2affe00f92f1fa093acad505', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 57, '2020-05-08 02:15:42');
INSERT INTO `sys_user_operation_log` VALUES ('c39711cc92b6ffd6bf475899951a60eb', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 154, '2023-06-02 10:57:01');
INSERT INTO `sys_user_operation_log` VALUES ('c3d51d98af6eec9124870c1d15e5263e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 219, '2020-04-16 08:57:52');
INSERT INTO `sys_user_operation_log` VALUES ('c3d7529763ed88179705e94e95e7711e', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 88, '2020-09-03 02:21:44');
INSERT INTO `sys_user_operation_log` VALUES ('c3de9202c9398938bf6b2fd5a88e918f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 190, '2020-04-07 08:25:50');
INSERT INTO `sys_user_operation_log` VALUES ('c3f56d2a576906c2faf4730cef72c20e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 139, '2023-06-01 09:21:30');
INSERT INTO `sys_user_operation_log` VALUES ('c45ace28d6d5a5a53ee9d8dacd7faba0', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 274, '2020-09-06 04:55:04');
INSERT INTO `sys_user_operation_log` VALUES ('c485a4aa7b35ec2f22e6806bad8d1d8d', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 61, '2020-05-08 01:54:49');
INSERT INTO `sys_user_operation_log` VALUES ('c4d879bf0cec98e715827e9b730eaedc', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 153, '2020-09-05 08:56:35');
INSERT INTO `sys_user_operation_log` VALUES ('c4e79653a812d410b11005320d2721b6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 2524, '2020-04-16 08:27:50');
INSERT INTO `sys_user_operation_log` VALUES ('c55ff3b2f6cbec17625bfe8093135f4f', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 405, '2020-05-11 07:50:59');
INSERT INTO `sys_user_operation_log` VALUES ('c57aad76b321e2b63c535e5fa1757473', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 297, '2020-04-07 08:09:41');
INSERT INTO `sys_user_operation_log` VALUES ('c59d7c853d208594c82e091176671b91', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 30, '2020-11-07 17:01:40');
INSERT INTO `sys_user_operation_log` VALUES ('c5bfdf41a7aadded3b0b7d27dd0a9f95', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 138, '2023-06-01 09:09:20');
INSERT INTO `sys_user_operation_log` VALUES ('c5f557261245dff25617f6ae190fe9a1', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 150, '2023-05-31 12:39:25');
INSERT INTO `sys_user_operation_log` VALUES ('c64e752a0b48e1d987612779c4700198', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 442, '2023-06-02 08:36:07');
INSERT INTO `sys_user_operation_log` VALUES ('c6879843815c00e5a3b993f168740fee', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 233, '2020-04-21 07:32:04');
INSERT INTO `sys_user_operation_log` VALUES ('c691323daccbba321b4dec170a8e7acd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1197, '2020-09-06 07:26:37');
INSERT INTO `sys_user_operation_log` VALUES ('c6e996715376ae90791eef997990fd7b', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"1325121829601280001\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 21, '2022-06-15 05:40:49');
INSERT INTO `sys_user_operation_log` VALUES ('c6fef700b13f7aaf2709fbe8827dd528', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 95, '2020-08-20 09:13:53');
INSERT INTO `sys_user_operation_log` VALUES ('c7bcccbee0dd78f2f71f1d3667f09d61', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 29, '2020-10-27 09:14:55');
INSERT INTO `sys_user_operation_log` VALUES ('c812a5e20dd9d3a8d7ff0ee5c7d3e363', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 66, '2020-09-06 22:11:43');
INSERT INTO `sys_user_operation_log` VALUES ('c8376d117e6013ea53adf58bb2c6f5da', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 158, '2023-06-05 16:11:17');
INSERT INTO `sys_user_operation_log` VALUES ('c8420214d4344d0144eebbfd07abf126', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 27, '2020-08-12 01:51:12');
INSERT INTO `sys_user_operation_log` VALUES ('c8b6a3ec34dca333fe0e927487410001', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 64, '2020-04-13 07:56:18');
INSERT INTO `sys_user_operation_log` VALUES ('c9084a60213c8cacd13dd0f6923a26ac', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 416, '2020-05-18 07:37:28');
INSERT INTO `sys_user_operation_log` VALUES ('c91aca6558a67a6857679add3dc77729', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 295, '2020-07-24 07:55:47');
INSERT INTO `sys_user_operation_log` VALUES ('c96d64501d5e2fb25c4a53b2bef7b78c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 376, '2020-04-21 10:06:48');
INSERT INTO `sys_user_operation_log` VALUES ('c9d7fa4bb475a737881c339ced66156a', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"1212\",\"roles\":\"1111\",\"phone\":\"1221\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"111\"}', '127.0.0.1', 56, '2020-05-09 10:31:22');
INSERT INTO `sys_user_operation_log` VALUES ('c9e48e46971b6c807afb26158db99419', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 181, '2020-04-13 02:31:10');
INSERT INTO `sys_user_operation_log` VALUES ('ca03601d7e22937c047b82524f1b2579', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 138, '2023-05-31 12:38:29');
INSERT INTO `sys_user_operation_log` VALUES ('ca61eaae10a0167d7867b5afe37ed551', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 15, '2022-06-15 05:40:19');
INSERT INTO `sys_user_operation_log` VALUES ('ca7a1d1cf67e5a4b48c44acd6f6c91c1', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 25, '2020-11-07 17:03:59');
INSERT INTO `sys_user_operation_log` VALUES ('caa3b0da0b4a58ccf02e55dbb190ba18', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 857, '2023-05-31 08:20:19');
INSERT INTO `sys_user_operation_log` VALUES ('cac0e19ed864508dd7c9044ccf5ba2e6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 528, '2023-05-31 09:26:44');
INSERT INTO `sys_user_operation_log` VALUES ('cae124c2ef10776c17774c21cc84c425', 'admin', 'TbCustLinkman', '修改', 'update', '{}', '127.0.0.1', 9, '2023-06-01 09:57:05');
INSERT INTO `sys_user_operation_log` VALUES ('cb1a5b14dc66d7254943e9245c1c51f3', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 317, '2020-09-02 06:59:34');
INSERT INTO `sys_user_operation_log` VALUES ('cb485261bec303b57426413248fbc3a6', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 177, '2023-05-31 10:27:02');
INSERT INTO `sys_user_operation_log` VALUES ('cb5940458b46edf00bf3150ed032fcc9', 'admin', '用户管理', '导出', 'export', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"username\":\"111\"}', '127.0.0.1', 150, '2020-05-09 10:30:51');
INSERT INTO `sys_user_operation_log` VALUES ('cb8195fc390a0408c5e1ce239b60b0ba', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 442, '2023-06-05 15:56:13');
INSERT INTO `sys_user_operation_log` VALUES ('cbfab08f2648ce1c44ffd7a3f1c02928', 'dongfang', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 22, '2023-06-06 14:43:17');
INSERT INTO `sys_user_operation_log` VALUES ('cc8d86abbd7188a71896ede3ad54b4f9', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 09:29:24');
INSERT INTO `sys_user_operation_log` VALUES ('cd1a912e7b7f8fe8a1ea62cb0e513b36', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 5, '2022-06-17 01:13:12');
INSERT INTO `sys_user_operation_log` VALUES ('cd666f16e0414434af606abffc6a6db7', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 57, '2020-04-13 07:55:58');
INSERT INTO `sys_user_operation_log` VALUES ('cdb576795000636c8795bf17772751a1', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 148, '2023-06-01 10:32:03');
INSERT INTO `sys_user_operation_log` VALUES ('ce20c118a44b282fa0e7bec8ee6b6696', 'admin', '用户管理', '列表', 'page', '{\"deptId\":\"1325122003077693442\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 18, '2022-06-15 05:40:49');
INSERT INTO `sys_user_operation_log` VALUES ('ce44b5325a62e1c0ac33a807cbf0927d', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"东莞分公司\",\"deptId\":\"OR1200000703\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 89, '2020-08-20 09:13:33');
INSERT INTO `sys_user_operation_log` VALUES ('ceb57ae89d57c17ba7617c06f7df126d', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 148, '2020-09-06 21:52:49');
INSERT INTO `sys_user_operation_log` VALUES ('cece0d828b6d793951a5c10b0a8ed986', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 97, '2020-09-03 02:22:31');
INSERT INTO `sys_user_operation_log` VALUES ('cf0a792fdd9417f4308a95d501f70009', 'admin', '用户管理', '用户模板', 'template', '{}', '127.0.0.1', 171, '2022-06-16 15:39:19');
INSERT INTO `sys_user_operation_log` VALUES ('cf2a8b2159af017fd2697965eeb26820', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2012, '2020-05-07 04:32:21');
INSERT INTO `sys_user_operation_log` VALUES ('cf9c9c21352df927d1def593e9b5717a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 182, '2020-09-03 01:47:42');
INSERT INTO `sys_user_operation_log` VALUES ('cfa80ec8fcfa1eae7f6940c963566cd1', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 117, '2020-11-07 17:13:20');
INSERT INTO `sys_user_operation_log` VALUES ('d09e454d4038bde20bfaa85a5f0bd168', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 127, '2020-04-08 07:33:17');
INSERT INTO `sys_user_operation_log` VALUES ('d0f2c6c96d69430a7972e9d0dd59a999', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 567, '2023-05-31 09:54:14');
INSERT INTO `sys_user_operation_log` VALUES ('d0ff7c2ee605785af2745acf80898235', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 35, '2020-11-07 17:06:03');
INSERT INTO `sys_user_operation_log` VALUES ('d1126faf8ff67cf651029b0ed93abe70', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 854, '2023-05-30 21:42:01');
INSERT INTO `sys_user_operation_log` VALUES ('d119611b20b59ce4554d311c33db1202', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 397, '2023-06-05 17:19:03');
INSERT INTO `sys_user_operation_log` VALUES ('d12538b55f6fddf3c4c258927c322040', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 188, '2020-05-07 05:37:11');
INSERT INTO `sys_user_operation_log` VALUES ('d13a42648ba5bd7b62fe58f2a09afceb', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 47, '2020-10-27 09:01:24');
INSERT INTO `sys_user_operation_log` VALUES ('d144c4184580594d1de48eb1b7ea42c3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 810, '2020-07-27 06:07:49');
INSERT INTO `sys_user_operation_log` VALUES ('d176ee12c71585f8b014272ce9e528a2', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 530, '2023-06-06 15:10:12');
INSERT INTO `sys_user_operation_log` VALUES ('d178b7b9a5ec1919754d243c22aa92b9', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 75, '2020-04-16 08:43:36');
INSERT INTO `sys_user_operation_log` VALUES ('d17a6302ac7ded08e00227f0d92298e6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 201, '2020-09-02 07:43:01');
INSERT INTO `sys_user_operation_log` VALUES ('d1a7066bfee801bfd46ce52047de8264', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 645, '2023-05-29 11:19:51');
INSERT INTO `sys_user_operation_log` VALUES ('d1cda26acbf02506281f6a2eac958da6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 193, '2020-04-21 10:07:39');
INSERT INTO `sys_user_operation_log` VALUES ('d26cf24dde5aa013fe211e11e5b51526', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 222, '2020-05-18 07:38:12');
INSERT INTO `sys_user_operation_log` VALUES ('d2a2323a09a6dd01a3b13386171dcb8a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1496, '2020-09-06 04:55:02');
INSERT INTO `sys_user_operation_log` VALUES ('d2e9a8f7ab66afc28d3fc8673046ec45', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 120, '2020-11-07 17:13:02');
INSERT INTO `sys_user_operation_log` VALUES ('d2eb4e6f177a4aee4f36dcd661ad239c', 'admin', '菜单管理', '删除', 'delete', '{}', '127.0.0.1', 473, '2020-08-01 06:45:51');
INSERT INTO `sys_user_operation_log` VALUES ('d3113a9fe7fa4d0240af046836567d6d', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 38, '2020-11-07 17:03:33');
INSERT INTO `sys_user_operation_log` VALUES ('d31a1eef4d5bbd636094d91d9ec2914a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1735, '2020-05-09 10:28:04');
INSERT INTO `sys_user_operation_log` VALUES ('d38f879377405c8f07758479968cbaf5', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 192, '2020-04-21 10:29:19');
INSERT INTO `sys_user_operation_log` VALUES ('d39bbdf0bd97a456c1b9066be85f55be', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 181, '2023-05-31 09:26:45');
INSERT INTO `sys_user_operation_log` VALUES ('d3abab191503fc5542516dfd8b8a6b4d', 'admin', '用户管理', '修改', 'update', '{}', '127.0.0.1', 122, '2020-11-07 17:12:54');
INSERT INTO `sys_user_operation_log` VALUES ('d43162d146cbb3301590a34b166e72c8', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 195, '2023-05-31 10:20:44');
INSERT INTO `sys_user_operation_log` VALUES ('d45f8bdcb0f7c2580f69956c92b4e5d8', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 10, '2023-05-31 10:20:52');
INSERT INTO `sys_user_operation_log` VALUES ('d461b2b89c86dd4691cc24c44e7da5b3', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 92, '2020-04-16 09:01:37');
INSERT INTO `sys_user_operation_log` VALUES ('d4ee806dd26367be3aa3b8658d048942', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 958, '2020-05-06 15:13:12');
INSERT INTO `sys_user_operation_log` VALUES ('d5080c095f619ce19f5337f2a8391e15', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 343, '2020-04-08 07:16:39');
INSERT INTO `sys_user_operation_log` VALUES ('d52afbf972432304ce5748dc77bd18fa', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1413, '2020-09-06 13:20:21');
INSERT INTO `sys_user_operation_log` VALUES ('d5623f1f0e80570453478033d66c358a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 179, '2020-09-03 01:46:19');
INSERT INTO `sys_user_operation_log` VALUES ('d57ba801c8d2a040400c82281710e817', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 160, '2020-09-05 08:32:51');
INSERT INTO `sys_user_operation_log` VALUES ('d5ac73a8a23d31a70118f6a5644c42fd', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 504, '2023-05-31 09:21:36');
INSERT INTO `sys_user_operation_log` VALUES ('d5af5575b896b7f9b0e1946ed928b918', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 830, '2020-05-06 15:13:27');
INSERT INTO `sys_user_operation_log` VALUES ('d5df923427a29966851aed82922a1003', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2732, '2020-04-17 03:48:56');
INSERT INTO `sys_user_operation_log` VALUES ('d5ff739874817515016afee9e09fc24e', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000648\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 92, '2020-05-18 07:40:40');
INSERT INTO `sys_user_operation_log` VALUES ('d61d5a07f0a2f42701a8a7cde180afb2', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 180, '2020-09-03 02:22:29');
INSERT INTO `sys_user_operation_log` VALUES ('d637a7ba2df71a82ed7a1f938f9b448d', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 155, '2020-04-13 07:25:11');
INSERT INTO `sys_user_operation_log` VALUES ('d65c544c1fd293dd1b6711dd0461ee31', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 23, '2022-06-16 08:45:14');
INSERT INTO `sys_user_operation_log` VALUES ('d69940d30fd37d7f7652c73d3234eba4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 296, '2020-09-05 08:56:23');
INSERT INTO `sys_user_operation_log` VALUES ('d6ba8ea5b6cd5ace0ae83e0a35c767de', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 434, '2023-06-05 16:11:16');
INSERT INTO `sys_user_operation_log` VALUES ('d811bbd3e68ff1b15281cfecb4965d04', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 368, '2023-06-02 09:22:39');
INSERT INTO `sys_user_operation_log` VALUES ('d8305f66f6282aea924601b6cb316132', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 382, '2023-06-01 09:28:53');
INSERT INTO `sys_user_operation_log` VALUES ('d8e060aca2503da140d1f495fa3eeebe', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 60, '2020-03-16 09:38:36');
INSERT INTO `sys_user_operation_log` VALUES ('d92106f3407d363159380b1881990220', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 164, '2023-06-05 17:17:20');
INSERT INTO `sys_user_operation_log` VALUES ('d95a60d67cb2c40460e39e3ddcfe4ee1', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 226, '2020-04-16 09:03:36');
INSERT INTO `sys_user_operation_log` VALUES ('d9815867224b98438ce71baa385f866e', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 6, '2023-05-31 10:20:58');
INSERT INTO `sys_user_operation_log` VALUES ('d9beae76366ae47e777ccb299c81cd70', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-10-24 03:56:55');
INSERT INTO `sys_user_operation_log` VALUES ('da01be62c9385f8f0b0def39248f2eec', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 72, '2020-04-16 08:43:39');
INSERT INTO `sys_user_operation_log` VALUES ('daa5be45daffb4df4f60a627aa15a11c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 157, '2020-04-13 06:53:32');
INSERT INTO `sys_user_operation_log` VALUES ('daff5f96edf283b42d05d846179c168e', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 172, '2020-11-07 17:13:02');
INSERT INTO `sys_user_operation_log` VALUES ('db137d2ffd21a3e31e0631d738535f82', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"4444\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 183, '2020-11-07 17:41:08');
INSERT INTO `sys_user_operation_log` VALUES ('db7d86a7a41abdcac1fd96db6ef8750a', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 540, '2023-05-31 10:20:43');
INSERT INTO `sys_user_operation_log` VALUES ('dccc73e2abe768e76c096a209651b097', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 298, '2020-09-08 16:16:18');
INSERT INTO `sys_user_operation_log` VALUES ('dd0406c36e849f98ab307ff5ca326fda', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 63, '2020-11-07 17:42:45');
INSERT INTO `sys_user_operation_log` VALUES ('dd4275b789c4677b26fbb014b09bcba9', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 132, '2020-05-11 07:52:06');
INSERT INTO `sys_user_operation_log` VALUES ('dd45e336ea9227c9cd9bb07cce6eb20c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 704, '2020-04-16 08:26:35');
INSERT INTO `sys_user_operation_log` VALUES ('dd4dbe946f1c83ce672b244bb170f2b5', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 25, '2020-04-07 08:26:26');
INSERT INTO `sys_user_operation_log` VALUES ('dd84ae948466668f22e1d57b813c38a0', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 207, '2020-04-17 03:49:45');
INSERT INTO `sys_user_operation_log` VALUES ('ddde63f3f1833f8f1feb77da5ebdcde1', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 82, '2020-04-07 08:25:52');
INSERT INTO `sys_user_operation_log` VALUES ('de0661d43c8f5560fcdb62da370a8c4b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 130, '2020-09-02 07:48:59');
INSERT INTO `sys_user_operation_log` VALUES ('de0d6ffcae22227de88851ecc6edee62', 'admin', 'TbCustLinkman', '修改', 'update', '{}', '127.0.0.1', 9, '2023-05-31 11:21:24');
INSERT INTO `sys_user_operation_log` VALUES ('de25607e0cd793596e1817173ac94d05', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 501, '2023-05-31 09:06:54');
INSERT INTO `sys_user_operation_log` VALUES ('dedc65b30d0b9fa99da16da2c8c91a94', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"111\"}', '127.0.0.1', 56, '2020-05-09 10:30:41');
INSERT INTO `sys_user_operation_log` VALUES ('dee684cb63b2cc3af139aeba51c2753d', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 208, '2020-04-15 07:13:34');
INSERT INTO `sys_user_operation_log` VALUES ('df32f7344e476c87c447facfcaf61792', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 157, '2023-06-07 15:15:27');
INSERT INTO `sys_user_operation_log` VALUES ('df63a50b47b7d687014e77b7725157ae', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1222, '2020-09-06 12:58:00');
INSERT INTO `sys_user_operation_log` VALUES ('df7604e8661a546b56e056dfde4eb3b0', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000724\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 91, '2020-05-18 07:40:41');
INSERT INTO `sys_user_operation_log` VALUES ('df79cefb2214d397cd5037a70e6434dd', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 508, '2023-06-02 08:24:51');
INSERT INTO `sys_user_operation_log` VALUES ('df7cdd848c1cff73cee1312ed54d4c1f', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"111\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 53, '2020-05-09 10:30:21');
INSERT INTO `sys_user_operation_log` VALUES ('dfaef1e545b1ae23579f14c45e869fb4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2305, '2022-06-17 01:13:14');
INSERT INTO `sys_user_operation_log` VALUES ('e005715863135c791c028ec110b2230c', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 42, '2023-06-06 15:19:24');
INSERT INTO `sys_user_operation_log` VALUES ('e0370487c6f1d1ea6f21196b6ca44642', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 268, '2020-04-07 10:02:03');
INSERT INTO `sys_user_operation_log` VALUES ('e037162194114d62a803dfdd082a3e10', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 136, '2023-06-07 16:39:08');
INSERT INTO `sys_user_operation_log` VALUES ('e0462e1ebb08d23690749687017c6752', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 125, '2020-08-31 02:26:13');
INSERT INTO `sys_user_operation_log` VALUES ('e0af54b0a20c9e84f18ab29f25010f11', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 10, '2023-05-30 21:47:18');
INSERT INTO `sys_user_operation_log` VALUES ('e0bcf71397055f9aa7ab0bff145e1e64', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"1111\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 43, '2020-05-09 10:30:14');
INSERT INTO `sys_user_operation_log` VALUES ('e0d593a8b879b92b407da538611ed973', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 386, '2023-06-05 17:15:44');
INSERT INTO `sys_user_operation_log` VALUES ('e0fa927659248c981ee4b269c95cc467', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 80, '2020-05-07 05:48:23');
INSERT INTO `sys_user_operation_log` VALUES ('e118ee6b505e80b9f61d2777330c99d7', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 210, '2023-05-30 21:29:27');
INSERT INTO `sys_user_operation_log` VALUES ('e121b1867f01456304a717db4bcc6f6e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 173, '2023-06-01 08:19:49');
INSERT INTO `sys_user_operation_log` VALUES ('e132117cfb738b84ab213d40e28fe690', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 106, '2023-05-29 10:25:08');
INSERT INTO `sys_user_operation_log` VALUES ('e1426f63e448e09b6be2362f31f5627a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 71, '2022-06-16 08:44:59');
INSERT INTO `sys_user_operation_log` VALUES ('e1a25d040bcf10dbf59614ef91cae588', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"15\"}', '127.0.0.1', 5, '2023-05-29 10:26:16');
INSERT INTO `sys_user_operation_log` VALUES ('e1a3778e3526f551b4ba0ae2de0bf80e', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 692, '2023-06-02 08:09:34');
INSERT INTO `sys_user_operation_log` VALUES ('e1ce336f19244a10de64955537577226', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 26, '2020-04-07 07:01:25');
INSERT INTO `sys_user_operation_log` VALUES ('e2a70f502a8ceff7ab96fb12b1771b3b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 153, '2023-06-06 15:19:15');
INSERT INTO `sys_user_operation_log` VALUES ('e2b360c6ff99676027810a6598409975', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 224, '2020-10-24 03:51:27');
INSERT INTO `sys_user_operation_log` VALUES ('e2c03e1e6324cc3806e26954ddafe616', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 265, '2020-05-07 05:44:26');
INSERT INTO `sys_user_operation_log` VALUES ('e304b3a29872a830c034fc16e45b4f9e', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 3, '2022-06-16 08:44:13');
INSERT INTO `sys_user_operation_log` VALUES ('e3a7a57f88a0a23f12a8b8bf51fcff89', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 507, '2023-05-31 12:35:33');
INSERT INTO `sys_user_operation_log` VALUES ('e3e4e7d2a0dec6ec9f2a00f588dea158', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 415, '2020-04-20 07:30:18');
INSERT INTO `sys_user_operation_log` VALUES ('e4b18583b1f27e651bd1174fd230947e', 'root', '用户管理', '列表', 'page', '{\"phone\":\"\",\"nickName\":\"\",\"disable\":\"\",\"roles\":\"\",\"limit\":\"10\",\"deptId\":\"1325121829601280001\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 22, '2022-06-17 01:14:10');
INSERT INTO `sys_user_operation_log` VALUES ('e4e833af08f2ddfd20aec5930c94b773', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"deptId\":\"1325122003077693442\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"50\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 104, '2020-11-07 17:14:18');
INSERT INTO `sys_user_operation_log` VALUES ('e561eec923377f1ced7246412856e355', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 29, '2020-11-07 17:06:03');
INSERT INTO `sys_user_operation_log` VALUES ('e56668c00bbf9ee1fdce80f42a960b69', 'admin', '数据字典', '导出', 'export', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 437, '2020-07-24 07:55:57');
INSERT INTO `sys_user_operation_log` VALUES ('e5a29197a1f1562ab4cdff829bba3f8f', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 11, '2023-05-29 10:25:16');
INSERT INTO `sys_user_operation_log` VALUES ('e6181ecef4ca08215b79cf3e1a819363', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 69, '2020-09-06 13:23:27');
INSERT INTO `sys_user_operation_log` VALUES ('e655ba3670ec713bff073f3d7ec56bf2', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 385, '2020-08-12 01:50:58');
INSERT INTO `sys_user_operation_log` VALUES ('e6bf9b570b54ca4850b11ac002311eea', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 160, '2020-09-07 09:33:31');
INSERT INTO `sys_user_operation_log` VALUES ('e774ff8f462ad254a10227bdd0761485', 'admin', 'demo', '删除', 'delete', '{}', '127.0.0.1', 8, '2022-06-16 18:15:06');
INSERT INTO `sys_user_operation_log` VALUES ('e779bcc6db0d368cf7d2c0d1893122d1', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 95, '2020-09-06 13:14:00');
INSERT INTO `sys_user_operation_log` VALUES ('e799dcf516d733cbcd0a6c9b2e69d570', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 15, '2022-06-17 01:14:40');
INSERT INTO `sys_user_operation_log` VALUES ('e7c6f847215eec2c1df915d907773c9f', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 150, '2020-03-16 08:03:43');
INSERT INTO `sys_user_operation_log` VALUES ('e81bb96a41447b5b7eeb5cf69b2efdf0', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 146, '2023-06-01 09:28:54');
INSERT INTO `sys_user_operation_log` VALUES ('e821fca384be01ed1ad04c6a88ac56c9', 'admin', '代码检测', '新增', 'save', '{}', '127.0.0.1', 63, '2020-09-07 09:27:51');
INSERT INTO `sys_user_operation_log` VALUES ('e823e210ea8e9e5508345ab13280167b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 156, '2023-06-07 15:24:58');
INSERT INTO `sys_user_operation_log` VALUES ('e89831630653ace07f42be15a08cdf06', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 302, '2023-05-29 16:08:53');
INSERT INTO `sys_user_operation_log` VALUES ('e90c99e5f9b47c415e11454c60c4fa75', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 90, '2020-04-21 04:36:02');
INSERT INTO `sys_user_operation_log` VALUES ('e953e733716ec48afc8f12e2278bc1b7', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 296, '2020-09-06 07:26:37');
INSERT INTO `sys_user_operation_log` VALUES ('e991546d6c39d391187e5d08e0ac8fd0', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000722\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 92, '2020-05-18 07:40:40');
INSERT INTO `sys_user_operation_log` VALUES ('e9a748a0162f2893ca43229f811ab3dd', 'admin', '角色管理', '修改', 'update', '{}', '127.0.0.1', 37683, '2020-04-21 10:12:09');
INSERT INTO `sys_user_operation_log` VALUES ('e9eb5d80e55647a188fe5ceb46376d1b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 36, '2023-06-02 17:24:18');
INSERT INTO `sys_user_operation_log` VALUES ('e9fa151e222c7925eee9fac457dc7756', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 397, '2023-06-02 10:51:58');
INSERT INTO `sys_user_operation_log` VALUES ('ea23611aa0fa18f675a3c830585e50a8', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 78, '2020-04-15 06:54:01');
INSERT INTO `sys_user_operation_log` VALUES ('ea9c38a74249ff67388dac3cb18b4ca1', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 11, '2023-06-01 10:20:43');
INSERT INTO `sys_user_operation_log` VALUES ('eab7537ac06be0c1add6598514a7c280', 'admin', 'TbVisit', '修改', 'update', '{}', '127.0.0.1', 8, '2023-06-02 08:09:52');
INSERT INTO `sys_user_operation_log` VALUES ('eabee62f46d119eaedc5aacd97ea078f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1425, '2020-09-06 10:05:32');
INSERT INTO `sys_user_operation_log` VALUES ('eb7e0abd9f24fd9024e6ba89149a3771', 'admin', '机构管理', '列表', 'page', '{\"deptName\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 24, '2020-11-07 17:09:58');
INSERT INTO `sys_user_operation_log` VALUES ('eba3da0635bb7041ea52c5f6349f3632', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 437, '2023-06-02 15:58:38');
INSERT INTO `sys_user_operation_log` VALUES ('ebb543c7e8c96e91f5ca4bd3b5b4ba0e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 165, '2020-04-13 07:25:28');
INSERT INTO `sys_user_operation_log` VALUES ('ebbe9e9a5b9b8a2d69620d682e7293ab', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 406, '2020-04-20 01:24:45');
INSERT INTO `sys_user_operation_log` VALUES ('ebcd2e0cf9a3e0061003b0cb2f84a8fa', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 317, '2020-04-21 03:42:36');
INSERT INTO `sys_user_operation_log` VALUES ('ec6c22bc7f8d6819ba0675ee480bdb8c', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 234, '2020-11-07 16:58:19');
INSERT INTO `sys_user_operation_log` VALUES ('ecf9d4462eaed41df5fa590a2b909cce', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 419, '2022-06-16 06:42:42');
INSERT INTO `sys_user_operation_log` VALUES ('ed0dc345b1318e3843ef9903c243ee0d', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 19, '2023-05-29 10:42:44');
INSERT INTO `sys_user_operation_log` VALUES ('ed6bcaa6e551fc191268b5cf0d3d9a8c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 788, '2023-06-03 13:28:29');
INSERT INTO `sys_user_operation_log` VALUES ('ed974b55e9d9b1c30de1e7ad75ee2f40', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1846, '2020-04-21 10:06:47');
INSERT INTO `sys_user_operation_log` VALUES ('ed989d3b31686f2970508a4c5c12acc2', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 383, '2020-04-21 02:45:42');
INSERT INTO `sys_user_operation_log` VALUES ('edacd5240a9c8180fc75be30be516f12', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1819, '2020-04-21 09:51:42');
INSERT INTO `sys_user_operation_log` VALUES ('edd36055f725715d57c35bba01608c92', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 154, '2020-04-07 07:01:21');
INSERT INTO `sys_user_operation_log` VALUES ('edef2829810d3d59e95c4e0292f376e8', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 267, '2020-08-20 09:10:03');
INSERT INTO `sys_user_operation_log` VALUES ('ee8fe2f273fcf80d5c2ea47ab799263b', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 319, '2020-08-12 01:51:06');
INSERT INTO `sys_user_operation_log` VALUES ('eeaa1fb67981b387e8656c089172a1c7', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1122, '2020-10-24 03:56:48');
INSERT INTO `sys_user_operation_log` VALUES ('eecc904c9544290cb8f127f68dd5c516', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 57, '2020-09-03 02:21:42');
INSERT INTO `sys_user_operation_log` VALUES ('eef96512b253202cac43da7ebf1647ae', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 159, '2020-03-16 07:13:07');
INSERT INTO `sys_user_operation_log` VALUES ('ef2a13942696b6edf978bfd997866748', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 454, '2023-06-01 10:32:02');
INSERT INTO `sys_user_operation_log` VALUES ('ef9ab929929b0c8c4701cf341d7b482e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 285, '2020-04-21 08:29:09');
INSERT INTO `sys_user_operation_log` VALUES ('f0280f8cd8991dc4b60a49a759b47c2c', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 162, '2023-05-31 11:04:43');
INSERT INTO `sys_user_operation_log` VALUES ('f04a6bb36fb7fc252c35062aa54d371e', 'Anonymous', '登录模块', '用户退出', 'logout', '{}', '127.0.0.1', 3, '2022-06-17 01:13:20');
INSERT INTO `sys_user_operation_log` VALUES ('f06ef61a3c66610768c4efe55b19cf24', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 405, '2020-05-08 01:32:25');
INSERT INTO `sys_user_operation_log` VALUES ('f0d4f1c7fa87dea4ebada6c4782936fc', 'Anonymous', '查询用户列表', 'openApi', 'userList', '{\"id\":\"0\"}', '127.0.0.1', 65, '2020-09-06 22:21:05');
INSERT INTO `sys_user_operation_log` VALUES ('f1088cd69edac550cfed199005e8fa0f', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1117, '2020-09-07 09:35:06');
INSERT INTO `sys_user_operation_log` VALUES ('f11755696c1d2e1b716cc84c44b8f1e4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 150, '2023-06-01 09:39:08');
INSERT INTO `sys_user_operation_log` VALUES ('f1d3dbcb35c9e661fe54f96108f6e4e1', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 352, '2020-04-03 14:23:34');
INSERT INTO `sys_user_operation_log` VALUES ('f20b050b10473d7571a01d2143720c99', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 61, '2023-06-03 14:03:35');
INSERT INTO `sys_user_operation_log` VALUES ('f2565d4e0ccf38bbae17d871cec81069', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 63, '2020-04-13 08:03:01');
INSERT INTO `sys_user_operation_log` VALUES ('f2a0cff4a47da7918de8cc79357b9f7e', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 19, '2022-06-15 09:39:01');
INSERT INTO `sys_user_operation_log` VALUES ('f2ba32e6df7737c70499e41a427680f2', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000647\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 109, '2020-05-18 07:40:39');
INSERT INTO `sys_user_operation_log` VALUES ('f2be86fe5a3b19cca0eed21345f024a6', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 71, '2023-06-07 15:54:42');
INSERT INTO `sys_user_operation_log` VALUES ('f2ec30ec4e3b7467262e864a4212172c', 'admin', 'TbCustomer', '修改', 'update', '{}', '127.0.0.1', 2, '2023-05-31 09:22:19');
INSERT INTO `sys_user_operation_log` VALUES ('f2f117e7ab0bc709517e45e6d40ef1f7', 'admin', 'DemoTest', '删除', 'delete', '{}', '127.0.0.1', 4, '2022-06-17 00:48:04');
INSERT INTO `sys_user_operation_log` VALUES ('f2f572e4d1fb81acd55e4dc69526322c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 161, '2020-04-17 02:18:01');
INSERT INTO `sys_user_operation_log` VALUES ('f30f69ad288202afffefd624d77b7aa1', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 9, '2022-06-17 01:07:09');
INSERT INTO `sys_user_operation_log` VALUES ('f31f40744a6e0e4e2f5a02ac6dd7ff9b', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 142, '2023-06-02 17:33:59');
INSERT INTO `sys_user_operation_log` VALUES ('f328e74f1a0a1d62350dbc7cc819c5b2', 'admin', '代码生成', '新增', 'save', '{}', '127.0.0.1', 198, '2020-09-08 08:37:47');
INSERT INTO `sys_user_operation_log` VALUES ('f3369d7f7df96357584c712091e0c4c5', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 38, '2020-05-07 05:46:22');
INSERT INTO `sys_user_operation_log` VALUES ('f363b42619519809fa804718520c83fa', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"2\"}', '127.0.0.1', 103, '2020-05-07 04:36:47');
INSERT INTO `sys_user_operation_log` VALUES ('f389bf6620217cf589d3199ba9762b51', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 344, '2020-05-07 04:32:22');
INSERT INTO `sys_user_operation_log` VALUES ('f3947af4c4a6aead13a06ab73ede4da1', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 183, '2020-11-07 17:02:33');
INSERT INTO `sys_user_operation_log` VALUES ('f3ebf6adabf3c9fb609a85100cacd151', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 413, '2023-06-05 16:22:40');
INSERT INTO `sys_user_operation_log` VALUES ('f459e160566f71ca225e0ab9f7a910a5', 'admin', '登录日志管理', '日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 65, '2020-04-13 07:47:43');
INSERT INTO `sys_user_operation_log` VALUES ('f47a1ce144432b67979342f74f60be11', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 23, '2022-06-16 08:44:27');
INSERT INTO `sys_user_operation_log` VALUES ('f4d824cec9629d2302a86ce34c4150d3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 5438, '2022-06-15 16:51:18');
INSERT INTO `sys_user_operation_log` VALUES ('f4f8fc2890bf58a6532c8fd0d79e1edf', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 349, '2020-04-21 07:38:44');
INSERT INTO `sys_user_operation_log` VALUES ('f5721adb8a6be7cacde6a0cb34c445a7', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000703\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 92, '2020-05-18 07:40:37');
INSERT INTO `sys_user_operation_log` VALUES ('f5b100e68cc19807269105666bc9d0ce', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1606, '2020-04-15 06:53:54');
INSERT INTO `sys_user_operation_log` VALUES ('f5ba9ff8fcb09c035a08b0a7da48b58d', 'admin', 'TbVisit', '新增', 'save', '{}', '127.0.0.1', 6, '2023-06-01 14:50:04');
INSERT INTO `sys_user_operation_log` VALUES ('f5c1dd24f6eded5ebce12cdf0a147e0a', 'admin', '数据字典', '列表', 'page', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 55, '2020-10-04 16:56:29');
INSERT INTO `sys_user_operation_log` VALUES ('f5cf62d51ff7a3635adf169abc49bd3b', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 548, '2023-06-07 15:24:57');
INSERT INTO `sys_user_operation_log` VALUES ('f5ed3756ea2addb9f0d6733fb66c8d36', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 68, '2020-05-08 03:18:20');
INSERT INTO `sys_user_operation_log` VALUES ('f60eb15d0ba7ba20084d0d4aaa604187', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 159, '2023-06-05 17:12:44');
INSERT INTO `sys_user_operation_log` VALUES ('f62c41eaf11538c5ee1e1046592d0fd3', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 233, '2020-04-13 07:55:48');
INSERT INTO `sys_user_operation_log` VALUES ('f62f0a332ebd8699a8bebb8e92b6f426', 'admin', '登录日志管理', '登录日志列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 74, '2020-04-13 08:04:23');
INSERT INTO `sys_user_operation_log` VALUES ('f65ae977e5320b4c65231c3c9e7e1c03', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"2\",\"username\":\"\"}', '127.0.0.1', 69, '2020-05-09 10:30:28');
INSERT INTO `sys_user_operation_log` VALUES ('f66e5554515e1befb3b5df8305689421', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"13333333333333333333\",\"roles\":\"\",\"phone\":\"1233333\",\"disable\":\"0\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"1233333333333\"}', '127.0.0.1', 54, '2020-10-04 16:56:26');
INSERT INTO `sys_user_operation_log` VALUES ('f67498b3c49d3e153f50e4804177c1ba', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 81, '2022-06-15 09:38:58');
INSERT INTO `sys_user_operation_log` VALUES ('f74f69c88f8e8a79db81a96b301da54e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 352, '2020-04-21 04:35:55');
INSERT INTO `sys_user_operation_log` VALUES ('f77c757165ec65df1628915884ae7b9c', 'admin', '机构管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 31, '2020-08-20 09:12:42');
INSERT INTO `sys_user_operation_log` VALUES ('f7a7d5cf7b002281302eb018a2c71699', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 55, '2020-05-08 03:07:11');
INSERT INTO `sys_user_operation_log` VALUES ('f8447952795224aa75263d014e7608ef', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 142, '2020-09-07 09:34:40');
INSERT INTO `sys_user_operation_log` VALUES ('f886f5c6d28798f87391c2abc529320a', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 273, '2020-04-30 03:54:07');
INSERT INTO `sys_user_operation_log` VALUES ('f8c84b9ebfd1687e24acfc7079c5cce3', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 3442, '2020-04-28 06:25:26');
INSERT INTO `sys_user_operation_log` VALUES ('f980bcad223a4517c23264abe38f502e', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 62, '2020-05-08 01:59:39');
INSERT INTO `sys_user_operation_log` VALUES ('f982e509fafd26dfc8c436278c9d5ce9', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 470, '2023-06-01 09:09:19');
INSERT INTO `sys_user_operation_log` VALUES ('f98bd63b115f577d24d068205e2aca57', 'admin', '菜单管理', '修改', 'update', '{}', '127.0.0.1', 101, '2020-04-21 03:02:31');
INSERT INTO `sys_user_operation_log` VALUES ('f9cd35b5664315ad7f3cf7f668cd7872', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 376, '2020-09-02 07:45:12');
INSERT INTO `sys_user_operation_log` VALUES ('f9ed6cdc7a1b2126fc20ff67a3429ce3', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 97, '2020-05-08 02:44:59');
INSERT INTO `sys_user_operation_log` VALUES ('fa9d98bdb29d2a125a70fbb0f8c4a75a', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 65, '2020-04-13 07:56:05');
INSERT INTO `sys_user_operation_log` VALUES ('fac43526310b2da7e9dcdfc493e56f0e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 118, '2020-09-05 08:56:47');
INSERT INTO `sys_user_operation_log` VALUES ('fb0623f981632b348426777dba5885f4', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 777, '2023-05-31 12:35:35');
INSERT INTO `sys_user_operation_log` VALUES ('fb6d81287919c24fc50092488492119d', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 65, '2020-05-08 03:09:36');
INSERT INTO `sys_user_operation_log` VALUES ('fb95dc4b79af2be09457ca76503aba96', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 373, '2023-06-02 09:08:39');
INSERT INTO `sys_user_operation_log` VALUES ('fb97c8ae0e09ef99c50057524321fbd6', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 1411, '2020-07-27 07:56:16');
INSERT INTO `sys_user_operation_log` VALUES ('fc47e5cbae0d8f7f0e58c0e108302984', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 33, '2022-06-16 08:44:14');
INSERT INTO `sys_user_operation_log` VALUES ('fca1a698a7866630e8e9a9520295217e', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 349, '2020-05-09 01:20:31');
INSERT INTO `sys_user_operation_log` VALUES ('fca8f6b52759ae39623ebc0fb705934e', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 322, '2020-05-07 08:31:58');
INSERT INTO `sys_user_operation_log` VALUES ('fcb6d2a9692abdf7fe3ace58be8c6037', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 100, '2020-10-24 03:51:35');
INSERT INTO `sys_user_operation_log` VALUES ('fcd987a6793a085c5c82c46c74b58dad', 'admin', 'TbCustLinkman', '新增', 'save', '{}', '127.0.0.1', 6, '2023-06-02 10:51:41');
INSERT INTO `sys_user_operation_log` VALUES ('fd14bbb21f74f48262dcb0e066878d0d', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 181, '2020-11-07 17:11:26');
INSERT INTO `sys_user_operation_log` VALUES ('fd38bc1b926841dcdc1f13e41a1e3fd2', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 572, '2020-08-10 07:42:45');
INSERT INTO `sys_user_operation_log` VALUES ('fdc00792a50baaaca3a30e3ab26a9e52', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 160, '2020-09-03 02:22:29');
INSERT INTO `sys_user_operation_log` VALUES ('fdf9e3c0458afbd4a44bd5afc2cac064', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 1777, '2020-04-13 01:32:06');
INSERT INTO `sys_user_operation_log` VALUES ('fe412116cab145b5c439404330a42d14', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 526, '2023-05-31 12:31:10');
INSERT INTO `sys_user_operation_log` VALUES ('fe69758ced138d615a49bc14cb6769fb', 'admin', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 510, '2023-06-02 08:16:19');
INSERT INTO `sys_user_operation_log` VALUES ('fe6b72129643df511f6b84a860988fe7', 'admin', '用户管理', '列表', 'page', '{\"nickName\":\"\",\"roles\":\"\",\"phone\":\"\",\"disable\":\"\",\"limit\":\"10\",\"page\":\"1\",\"username\":\"\"}', '127.0.0.1', 168, '2020-11-07 17:13:13');
INSERT INTO `sys_user_operation_log` VALUES ('fe728aa9c6abdc6503126ee64739d6fe', 'admin', '登录模块', '用户登录', 'login', '{}', '127.0.0.1', 722, '2020-04-20 01:22:42');
INSERT INTO `sys_user_operation_log` VALUES ('fec6ce01ddd0c871a84afe1b270c65c4', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '', 810, '2020-07-29 07:10:41');
INSERT INTO `sys_user_operation_log` VALUES ('fecbff4a59ab24d18612d2a84b3a436e', 'admin', '机构管理', '列表', 'page', '{\"deptId\":\"OR1200000389\",\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 93, '2020-05-18 07:40:38');
INSERT INTO `sys_user_operation_log` VALUES ('fed8a20674a3b48b4ba163b38ab005cf', 'admin', '代码检测', '下载检测结果文件', 'delete', '{}', '127.0.0.1', 157, '2020-09-07 09:33:35');
INSERT INTO `sys_user_operation_log` VALUES ('fedf086cfaa62d452f76d5eec0c46812', 'admin', '用户管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 166, '2020-03-16 07:05:59');
INSERT INTO `sys_user_operation_log` VALUES ('ff382c9dd3d9e72cfea3d1195fa45690', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 79, '2020-11-07 17:02:30');
INSERT INTO `sys_user_operation_log` VALUES ('ff583f1bc94c65f9843ef77abae3285c', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 2121, '2020-05-07 09:03:38');
INSERT INTO `sys_user_operation_log` VALUES ('ff6894b0cbce5b63f6a6d61159637bce', 'admin', '数据字典', '导出', 'export', '{\"diceCodes\":\"\",\"dictName\":\"\"}', '127.0.0.1', 228, '2020-07-24 07:56:10');
INSERT INTO `sys_user_operation_log` VALUES ('ff7b5d517649aeb778b319f053bb076a', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 228, '2020-09-02 07:45:07');
INSERT INTO `sys_user_operation_log` VALUES ('ff82b48d29c01d726f8c58f355a29dd1', 'Anonymous', '登录模块', '登录验证码', 'captcha', '{}', '127.0.0.1', 26, '2022-06-17 01:14:27');
INSERT INTO `sys_user_operation_log` VALUES ('ffc5c1bd7bdf83f3fb8c9a9b296099dd', 'admin', '系统管理', '列表', 'page', '{\"limit\":\"10\",\"page\":\"1\"}', '127.0.0.1', 73, '2020-05-08 03:16:49');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `USER_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`USER_ID`, `ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1115864230968729601', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115864462813077506', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115889682278023169', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115897726932131841', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115897952292085762', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115899722758164481', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115901422860570625', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1115901422860570625', '2');
INSERT INTO `sys_user_role` VALUES ('1115903825278210050', '1');
INSERT INTO `sys_user_role` VALUES ('1116300420066959361', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1116538422137143297', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1117666119402192897', '1');
INSERT INTO `sys_user_role` VALUES ('1117666119402192897', '11111218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1117666119402192897', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1118690678960066561', '1111');
INSERT INTO `sys_user_role` VALUES ('1118706266428194818', '1111');
INSERT INTO `sys_user_role` VALUES ('1118706266428194818', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1138460331855884289', '1111');
INSERT INTO `sys_user_role` VALUES ('1138460331855884289', '1218567428905160705');
INSERT INTO `sys_user_role` VALUES ('1138463107453333505', '1111');
INSERT INTO `sys_user_role` VALUES ('1138463481715273730', '1111');
INSERT INTO `sys_user_role` VALUES ('1138465382401953793', '1218717746478055426');
INSERT INTO `sys_user_role` VALUES ('1147850266972839937', '1218567729141829633');
INSERT INTO `sys_user_role` VALUES ('1157842323041148930', '1111');
INSERT INTO `sys_user_role` VALUES ('1157842678214811649', '1111');
INSERT INTO `sys_user_role` VALUES ('1176673562082635778', '1111');
INSERT INTO `sys_user_role` VALUES ('1189475248153251842', '1218567872230510594');
INSERT INTO `sys_user_role` VALUES ('1227877059054125057', '1111');

-- ----------------------------
-- Table structure for system_message
-- ----------------------------
DROP TABLE IF EXISTS `system_message`;
CREATE TABLE `system_message`  (
  `ID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `TYPE` int NULL DEFAULT NULL,
  `MSG_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME` datetime NULL DEFAULT NULL,
  `TOP` int NULL DEFAULT NULL,
  `SOURCE_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEND_NAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TITLE` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_READER` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 432 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_message
-- ----------------------------
INSERT INTO `system_message` VALUES (1, 1, '祝您中秋团圆,国庆快乐!', '2020-09-22 16:55:42', 0, '张三', '李四', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (2, 1, '祝您中秋团圆,国庆快乐!', '2020-09-23 15:55:42', 0, '王兀', '张柳', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (3, 1, '祝您中秋团圆,国庆快乐!', '2020-09-24 12:55:42', 0, '张柳', '王兀', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (4, 1, '祝您中秋团圆,国庆快乐!', '2020-09-23 10:57:42', 0, '张三', '李四', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (5, 1, '祝您中秋团圆,国庆快乐!', '2020-09-23 13:55:42', 0, '李逵', '张柳', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (6, 1, '祝您中秋团圆,国庆快乐!', '2020-09-23 18:55:42', 0, '李四', '张三', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (7, 1, '祝您中秋团圆,国庆快乐!', '2020-09-23 20:55:42', 0, '赵六', '张三', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (8, 2, '祝您中秋团圆,国庆快乐!', '2020-09-23 16:55:42', 0, '李清', '伍媚', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (9, 1, '祝您中秋团圆,国庆快乐!', '2020-09-22 19:55:42', 0, '伍媚', '王五', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (10, 1, '祝您中秋团圆,国庆快乐!', '2019-12-23 16:55:42', 0, '李白', '张柳', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (11, 1, '祝您中秋团圆,国庆快乐!', '2020-09-22 18:01:42', 0, '张柳', '王兀', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (12, 2, '祝您中秋团圆,国庆快乐!', '2020-06-23 12:55:42', 0, '四一', '污了污了', '来自院长的祝福', 0);
INSERT INTO `system_message` VALUES (13, 1, '我的崽崽们,你们一定要记得吃饭,记得保暖,注意爱护自己,写代码累了,就休息下,但是要按时提交进度,有啥事记得打电话来!!爱你们', '2020-01-09 16:55:42', 1, '老麦,阳阳,谢总', '25,26期的全体同学', '来自啰嗦妈妈的嘱咐', 0);
INSERT INTO `system_message` VALUES (14, 1, '大家中秋快乐,国庆快乐,一周时间看不到你们,挺寂寞孤独的,给你们布置作业的日子,是最开心的日子', '2020-07-23 16:55:42', 1, '赵文贤,魏志伟', '25,26期的全体同学', '来自讲师的关怀', 0);
INSERT INTO `system_message` VALUES (15, 2, '现在是在做企业项目,大家晚上都加班加点,还被项目经理,技术经理虐待,但是,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!\n', '2020-09-23 11:30:42', 1, '任小龙', '25,26期的全体同学', '来自校长的爱戴', 0);
INSERT INTO `system_message` VALUES (16, 2, '如果你们国庆不好好把项目写了,国庆以后我就把你们扬了\n恶魔中的魔鬼--东方不败', '2020-01-09 13:05:42', 1, '东方不败', '25,26期的全体同学', '来自恶魔的忠告', 0);
INSERT INTO `system_message` VALUES (17, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '王兀', '系统消息', 0);
INSERT INTO `system_message` VALUES (18, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '张柳', '系统消息', 0);
INSERT INTO `system_message` VALUES (19, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '李逵', '系统消息', 0);
INSERT INTO `system_message` VALUES (20, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '李四', '系统消息', 0);
INSERT INTO `system_message` VALUES (21, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '赵六', '系统消息', 0);
INSERT INTO `system_message` VALUES (22, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '李清', '系统消息', 0);
INSERT INTO `system_message` VALUES (23, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '伍媚', '系统消息', 0);
INSERT INTO `system_message` VALUES (24, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '李白', '系统消息', 0);
INSERT INTO `system_message` VALUES (25, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '张柳', '系统消息', 0);
INSERT INTO `system_message` VALUES (26, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '四一', '系统消息', 0);
INSERT INTO `system_message` VALUES (27, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '吴起', '系统消息', 0);
INSERT INTO `system_message` VALUES (28, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '赵文贤', '系统消息', 0);
INSERT INTO `system_message` VALUES (29, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '任小龙', '系统消息', 0);
INSERT INTO `system_message` VALUES (30, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 张三', '2020-10-04 08:12:26', NULL, '张三', '东方不败', '系统消息', 0);
INSERT INTO `system_message` VALUES (31, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '张三', '系统消息', 0);
INSERT INTO `system_message` VALUES (32, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '张柳', '系统消息', 0);
INSERT INTO `system_message` VALUES (33, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '李逵', '系统消息', 0);
INSERT INTO `system_message` VALUES (34, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '李四', '系统消息', 0);
INSERT INTO `system_message` VALUES (35, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (36, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (37, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (38, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (39, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (40, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (41, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (42, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (43, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (44, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 王兀', '2020-10-04 08:12:26', NULL, '王兀', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (45, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (46, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (47, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (48, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (49, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (50, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (51, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (52, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (53, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (54, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (55, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (56, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (57, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (58, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (59, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (60, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (61, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (62, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (63, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (64, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (65, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (66, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (67, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (68, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (69, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (70, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (71, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 李逵', '2020-10-04 08:12:26', NULL, '李逵', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (72, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (73, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (74, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (75, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (76, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (77, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (78, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (79, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (80, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (81, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (82, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (83, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (84, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (85, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 李四', '2020-10-04 08:12:26', NULL, '李四', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (86, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (87, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (88, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (89, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (90, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (91, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (92, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (93, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (94, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (95, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (96, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (97, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (98, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (99, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 赵六', '2020-10-04 08:12:26', NULL, '赵六', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (100, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (101, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (102, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (103, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (104, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (105, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (106, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (107, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (108, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (109, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (110, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (111, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (112, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (113, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 李清', '2020-10-04 08:12:26', NULL, '李清', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (114, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (115, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (116, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (117, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (118, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (119, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (120, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (121, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (122, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (123, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (124, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (125, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (126, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (127, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 伍媚', '2020-10-04 08:12:26', NULL, '伍媚', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (128, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (129, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (130, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (131, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (132, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (133, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (134, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (135, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (136, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (137, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (138, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (139, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (140, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (141, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 李白', '2020-10-04 08:12:26', NULL, '李白', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (142, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (143, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (144, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (145, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (146, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '赵六', '系统消息', 0);
INSERT INTO `system_message` VALUES (147, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李清', '系统消息', 0);
INSERT INTO `system_message` VALUES (148, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '伍媚', '系统消息', 0);
INSERT INTO `system_message` VALUES (149, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '李白', '系统消息', 0);
INSERT INTO `system_message` VALUES (150, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '四一', '系统消息', 0);
INSERT INTO `system_message` VALUES (151, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (152, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (153, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (154, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 张柳', '2020-10-04 08:12:26', NULL, '张柳', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (155, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (156, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (157, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (158, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (159, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (160, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (161, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (162, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (163, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (164, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (165, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (166, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (167, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (168, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 四一', '2020-10-04 08:12:26', NULL, '四一', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (169, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (170, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (171, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (172, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (173, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (174, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (175, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (176, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (177, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (178, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (179, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (180, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (181, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (182, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 吴起', '2020-10-04 08:12:26', NULL, '吴起', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (183, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (184, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (185, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (186, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (187, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (188, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (189, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (190, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (191, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (192, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (193, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (194, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (195, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (196, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 赵文贤', '2020-10-04 08:12:26', NULL, '赵文贤', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (197, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (198, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (199, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (200, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (201, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (202, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (203, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (204, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (205, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (206, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (207, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (208, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (209, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (210, 1, '祝您中秋团圆,国庆快乐! TO:东方不败I am: 任小龙', '2020-10-04 08:12:26', NULL, '任小龙', '东方不败', '系统消息', 1);
INSERT INTO `system_message` VALUES (211, 1, '祝您中秋团圆,国庆快乐! TO:张三I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '张三', '系统消息', 1);
INSERT INTO `system_message` VALUES (212, 1, '祝您中秋团圆,国庆快乐! TO:王兀I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '王兀', '系统消息', 1);
INSERT INTO `system_message` VALUES (213, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (214, 1, '祝您中秋团圆,国庆快乐! TO:李逵I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '李逵', '系统消息', 1);
INSERT INTO `system_message` VALUES (215, 1, '祝您中秋团圆,国庆快乐! TO:李四I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '李四', '系统消息', 1);
INSERT INTO `system_message` VALUES (216, 1, '祝您中秋团圆,国庆快乐! TO:赵六I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '赵六', '系统消息', 1);
INSERT INTO `system_message` VALUES (217, 1, '祝您中秋团圆,国庆快乐! TO:李清I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '李清', '系统消息', 1);
INSERT INTO `system_message` VALUES (218, 1, '祝您中秋团圆,国庆快乐! TO:伍媚I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '伍媚', '系统消息', 1);
INSERT INTO `system_message` VALUES (219, 1, '祝您中秋团圆,国庆快乐! TO:李白I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '李白', '系统消息', 1);
INSERT INTO `system_message` VALUES (220, 1, '祝您中秋团圆,国庆快乐! TO:张柳I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '张柳', '系统消息', 1);
INSERT INTO `system_message` VALUES (221, 1, '祝您中秋团圆,国庆快乐! TO:四一I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '四一', '系统消息', 1);
INSERT INTO `system_message` VALUES (222, 1, '祝您中秋团圆,国庆快乐! TO:吴起I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '吴起', '系统消息', 1);
INSERT INTO `system_message` VALUES (223, 1, '祝您中秋团圆,国庆快乐! TO:赵文贤I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '赵文贤', '系统消息', 1);
INSERT INTO `system_message` VALUES (224, 1, '祝您中秋团圆,国庆快乐! TO:任小龙I am: 东方不败', '2020-10-04 08:12:26', NULL, '东方不败', '任小龙', '系统消息', 1);
INSERT INTO `system_message` VALUES (225, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (226, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (227, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (228, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (229, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (230, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (231, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (232, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (233, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (234, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (235, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (236, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (237, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (238, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张三', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (239, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (240, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (241, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (242, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (243, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (244, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (245, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (246, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (247, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (248, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (249, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (250, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (251, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (252, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '王兀', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (253, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (254, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (255, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (256, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李四', '个人消息', 0);
INSERT INTO `system_message` VALUES (257, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '赵六', '个人消息', 0);
INSERT INTO `system_message` VALUES (258, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李清', '个人消息', 0);
INSERT INTO `system_message` VALUES (259, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '伍媚', '个人消息', 0);
INSERT INTO `system_message` VALUES (260, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李白', '个人消息', 0);
INSERT INTO `system_message` VALUES (261, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '四一', '个人消息', 0);
INSERT INTO `system_message` VALUES (262, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '吴起', '个人消息', 0);
INSERT INTO `system_message` VALUES (263, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '赵文贤', '个人消息', 0);
INSERT INTO `system_message` VALUES (264, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '任小龙', '个人消息', 0);
INSERT INTO `system_message` VALUES (265, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '东方不败', '个人消息', 0);
INSERT INTO `system_message` VALUES (266, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '张三', '个人消息', 0);
INSERT INTO `system_message` VALUES (267, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '王兀', '个人消息', 0);
INSERT INTO `system_message` VALUES (268, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (269, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '李四', '个人消息', 0);
INSERT INTO `system_message` VALUES (270, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '赵六', '个人消息', 0);
INSERT INTO `system_message` VALUES (271, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '李清', '个人消息', 0);
INSERT INTO `system_message` VALUES (272, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '伍媚', '个人消息', 0);
INSERT INTO `system_message` VALUES (273, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '李白', '个人消息', 0);
INSERT INTO `system_message` VALUES (274, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (275, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '四一', '个人消息', 0);
INSERT INTO `system_message` VALUES (276, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '吴起', '个人消息', 0);
INSERT INTO `system_message` VALUES (277, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '赵文贤', '个人消息', 0);
INSERT INTO `system_message` VALUES (278, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '任小龙', '个人消息', 0);
INSERT INTO `system_message` VALUES (279, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李逵', '东方不败', '个人消息', 0);
INSERT INTO `system_message` VALUES (280, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '张三', '个人消息', 0);
INSERT INTO `system_message` VALUES (281, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '王兀', '个人消息', 0);
INSERT INTO `system_message` VALUES (282, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (283, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '李逵', '个人消息', 0);
INSERT INTO `system_message` VALUES (284, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '赵六', '个人消息', 0);
INSERT INTO `system_message` VALUES (285, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '李清', '个人消息', 0);
INSERT INTO `system_message` VALUES (286, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '伍媚', '个人消息', 0);
INSERT INTO `system_message` VALUES (287, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '李白', '个人消息', 0);
INSERT INTO `system_message` VALUES (288, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (289, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '四一', '个人消息', 0);
INSERT INTO `system_message` VALUES (290, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '吴起', '个人消息', 0);
INSERT INTO `system_message` VALUES (291, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '赵文贤', '个人消息', 0);
INSERT INTO `system_message` VALUES (292, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '任小龙', '个人消息', 0);
INSERT INTO `system_message` VALUES (293, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李四', '东方不败', '个人消息', 0);
INSERT INTO `system_message` VALUES (294, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '张三', '个人消息', 0);
INSERT INTO `system_message` VALUES (295, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '王兀', '个人消息', 0);
INSERT INTO `system_message` VALUES (296, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (297, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '李逵', '个人消息', 0);
INSERT INTO `system_message` VALUES (298, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '李四', '个人消息', 0);
INSERT INTO `system_message` VALUES (299, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '李清', '个人消息', 0);
INSERT INTO `system_message` VALUES (300, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '伍媚', '个人消息', 0);
INSERT INTO `system_message` VALUES (301, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '李白', '个人消息', 0);
INSERT INTO `system_message` VALUES (302, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (303, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '四一', '个人消息', 0);
INSERT INTO `system_message` VALUES (304, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '吴起', '个人消息', 0);
INSERT INTO `system_message` VALUES (305, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '赵文贤', '个人消息', 0);
INSERT INTO `system_message` VALUES (306, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '任小龙', '个人消息', 0);
INSERT INTO `system_message` VALUES (307, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵六', '东方不败', '个人消息', 0);
INSERT INTO `system_message` VALUES (308, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '张三', '个人消息', 0);
INSERT INTO `system_message` VALUES (309, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '王兀', '个人消息', 0);
INSERT INTO `system_message` VALUES (310, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '张柳', '个人消息', 0);
INSERT INTO `system_message` VALUES (311, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '李逵', '个人消息', 0);
INSERT INTO `system_message` VALUES (312, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (313, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (314, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (315, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (316, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (317, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (318, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (319, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (320, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (321, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李清', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (322, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (323, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (324, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (325, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (326, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (327, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (328, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (329, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (330, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (331, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (332, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (333, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (334, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (335, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '伍媚', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (336, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (337, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (338, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (339, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (340, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (341, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (342, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (343, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (344, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (345, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (346, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (347, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (348, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (349, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '李白', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (350, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (351, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (352, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (353, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (354, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (355, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (356, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (357, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (358, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (359, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (360, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (361, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (362, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '张柳', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (363, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (364, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (365, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (366, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (367, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (368, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (369, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (370, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (371, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (372, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (373, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (374, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (375, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (376, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '四一', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (377, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (378, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (379, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (380, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (381, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (382, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (383, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (384, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (385, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (386, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (387, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (388, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (389, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '任小龙', '个人消息', 1);
INSERT INTO `system_message` VALUES (390, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '吴起', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (391, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (392, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (393, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (394, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (395, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (396, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (397, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (398, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (399, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (400, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (401, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (402, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '吴起', '个人消息', 0);
INSERT INTO `system_message` VALUES (403, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '任小龙', '个人消息', 0);
INSERT INTO `system_message` VALUES (404, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '赵文贤', '东方不败', '个人消息', 0);
INSERT INTO `system_message` VALUES (405, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '张三', '个人消息', 0);
INSERT INTO `system_message` VALUES (406, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (407, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (408, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (409, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (410, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (411, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (412, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (413, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (414, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (415, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (416, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (417, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (418, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '任小龙', '东方不败', '个人消息', 1);
INSERT INTO `system_message` VALUES (419, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '张三', '个人消息', 1);
INSERT INTO `system_message` VALUES (420, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '王兀', '个人消息', 1);
INSERT INTO `system_message` VALUES (421, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (422, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '李逵', '个人消息', 1);
INSERT INTO `system_message` VALUES (423, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '李四', '个人消息', 1);
INSERT INTO `system_message` VALUES (424, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '赵六', '个人消息', 1);
INSERT INTO `system_message` VALUES (425, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '李清', '个人消息', 1);
INSERT INTO `system_message` VALUES (426, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '伍媚', '个人消息', 1);
INSERT INTO `system_message` VALUES (427, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '李白', '个人消息', 1);
INSERT INTO `system_message` VALUES (428, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '张柳', '个人消息', 1);
INSERT INTO `system_message` VALUES (429, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '四一', '个人消息', 1);
INSERT INTO `system_message` VALUES (430, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '吴起', '个人消息', 1);
INSERT INTO `system_message` VALUES (431, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '赵文贤', '个人消息', 1);
INSERT INTO `system_message` VALUES (432, 2, '现在是在做企业项目,一切的辛苦付出,都是为了以后更好的就业,可以走的更远,以后可以过的更好,为了美好的明天,好好加油!!!', '2020-10-04 08:12:26', NULL, '东方不败', '任小龙', '个人消息', 1);

-- ----------------------------
-- Table structure for tb_contract
-- ----------------------------
DROP TABLE IF EXISTS `tb_contract`;
CREATE TABLE `tb_contract`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cust_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '客户id',
  `contract_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同名称',
  `contract_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编码',
  `amounts` int NULL DEFAULT NULL COMMENT '合同金额',
  `start_date` date NULL DEFAULT NULL COMMENT '合同生效开始时间',
  `end_date` date NULL DEFAULT NULL COMMENT '合同生效结束时间',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '合同内容',
  `affix_seal_status` int NULL DEFAULT 0 COMMENT '是否盖章确认 0 否 1 是',
  `audit_status` int NULL DEFAULT 0 COMMENT '审核状态 0 未审核 1 审核通过 -1 审核不通过',
  `nullify_status` int NULL DEFAULT 0 COMMENT '是否作废 1 作废 0 在用',
  `input_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '录入人',
  `input_time` datetime NULL DEFAULT NULL COMMENT '录入时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '合同信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_contract
-- ----------------------------

-- ----------------------------
-- Table structure for tb_cust_linkman
-- ----------------------------
DROP TABLE IF EXISTS `tb_cust_linkman`;
CREATE TABLE `tb_cust_linkman`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cust_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户id',
  `linkman` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名字',
  `sex` int NULL DEFAULT NULL COMMENT '性别 1 男 0 女',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `input_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录入人',
  `input_time` datetime NULL DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer`(`cust_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户联系人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_cust_linkman
-- ----------------------------
INSERT INTO `tb_cust_linkman` VALUES ('639da044db9e3bd10e1d93462d421d4c', '2fadfcc7b3ee5526ad615f5914702e9b', 'AA', 1, 1, '1111111111', '11', '11', '11', '1115864462813077506', '2023-06-07 15:25:57');
INSERT INTO `tb_cust_linkman` VALUES ('6b6b89eef776015fd6d89c0820232f09', 'acb537c8b378a44e8f08ad5f873baa8f', '12', 1, 12, '18818398018', '12', '12', '12', '1115864462813077506', '2023-05-31 11:05:12');
INSERT INTO `tb_cust_linkman` VALUES ('90f9f838ca0cb91912e078f12688bbf7', '2bb6642c3bfcee59ec3d60f53e2c165b', '33', 1, 33, '12345678901', '33', '33', '33', '1138463481715273730', '2023-06-06 14:43:55');
INSERT INTO `tb_cust_linkman` VALUES ('9a1facc16cbfd863cc75626d673c7067', '2bb6642c3bfcee59ec3d60f53e2c165b', '11', 0, 11, '1111111111', '11', '11', '11', '1115864462813077506', '2023-06-05 16:43:59');

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `legal_leader` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法定代表人',
  `register_date` date NULL DEFAULT NULL COMMENT '成立时间',
  `open_status` int NULL DEFAULT NULL COMMENT '经营状态, 0 开业、1 注销、2 破产',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属地区省份',
  `reg_capital` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册资本,(万元)',
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属行业',
  `scope` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营范围',
  `reg_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册地址',
  `input_time` datetime NULL DEFAULT NULL COMMENT '录入时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `input_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '录入人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('2bb6642c3bfcee59ec3d60f53e2c165b', '【】【】【】【】', '1', '2023-05-06', 0, '220000', '1', '1', '1', '1', '2023-05-31 10:21:49', '2023-06-02 08:16:39', '1115864462813077506');
INSERT INTO `tb_customer` VALUES ('2fadfcc7b3ee5526ad615f5914702e9b', '企业A', 'A人', '2023-06-03', 0, '100000', '1000', '未知', '未知', '1', '2023-06-06 15:22:10', NULL, '1115864462813077506');
INSERT INTO `tb_customer` VALUES ('acb537c8b378a44e8f08ad5f873baa8f', '仲恺农业工程学院', 'w', '2023-05-31', 1, '130000', '1', '1', '1', '1', NULL, '2023-06-05 15:00:53', '1115864462813077506');
INSERT INTO `tb_customer` VALUES ('ddd52bc36a6f1593e5b6ac8c9c7af850', '仲恺农业工程', 'wbb', '2023-05-13', 2, '330000', '1000', '教育', '教育', '海珠区', NULL, '2023-06-02 09:56:42', '1115864462813077506');

-- ----------------------------
-- Table structure for tb_visit
-- ----------------------------
DROP TABLE IF EXISTS `tb_visit`;
CREATE TABLE `tb_visit`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '唯一id',
  `cust_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户id',
  `linkman_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系人id',
  `visit_type` int NULL DEFAULT NULL COMMENT '拜访方式, 1 上门走访, 2 电话拜访',
  `visit_reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拜访原因',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交流内容',
  `visit_date` date NULL DEFAULT NULL COMMENT '拜访时间',
  `input_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '录入人',
  `input_time` datetime NULL DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_customer`(`cust_id`) USING BTREE,
  INDEX `IDX_linkman`(`linkman_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拜访信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_visit
-- ----------------------------
INSERT INTO `tb_visit` VALUES ('51bb6a70d974216cf77e17f0d585e370', '2bb6642c3bfcee59ec3d60f53e2c165b', '6b6b89eef776015fd6d89c0820232f09', 2, '1', '1', '2023-06-17', '1115864462813077506', '2023-06-06 15:59:00');
INSERT INTO `tb_visit` VALUES ('b4bbcee20573fd184e0a361a312886a7', '2fadfcc7b3ee5526ad615f5914702e9b', '639da044db9e3bd10e1d93462d421d4c', 1, '你好', 'AA', '2023-06-09', '1115864462813077506', '2023-06-07 15:49:37');

SET FOREIGN_KEY_CHECKS = 1;
