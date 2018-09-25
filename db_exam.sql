/*
Navicat MySQL Data Transfer

Source Server         : MySQL57
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : db_exam

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-05-26 13:52:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for timu_type
-- ----------------------------
DROP TABLE IF EXISTS `timu_type`;
CREATE TABLE `timu_type` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timu_type
-- ----------------------------
INSERT INTO `timu_type` VALUES ('1', 'jianda');
INSERT INTO `timu_type` VALUES ('2', 'duoxuan');
INSERT INTO `timu_type` VALUES ('3', 'danxuan');
INSERT INTO `timu_type` VALUES ('4', 'chengxusheji');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', '1', '11');

-- ----------------------------
-- Table structure for t_fenshu
-- ----------------------------
DROP TABLE IF EXISTS `t_fenshu`;
CREATE TABLE `t_fenshu` (
  `fenshu_id` int(11) NOT NULL DEFAULT '0',
  `shiti_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `fenshu` int(11) DEFAULT NULL,
  `yuejuan_date` timestamp NULL DEFAULT NULL,
  `tea_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fenshu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fenshu
-- ----------------------------
INSERT INTO `t_fenshu` VALUES ('1', '3', '1', '20', null, null);
INSERT INTO `t_fenshu` VALUES ('2', '4', '1', '30', null, null);
INSERT INTO `t_fenshu` VALUES ('3', '3', '2', '25', null, null);
INSERT INTO `t_fenshu` VALUES ('4', '4', '2', '50', null, null);
INSERT INTO `t_fenshu` VALUES ('5', '6', '1', '10', null, null);
INSERT INTO `t_fenshu` VALUES ('6', '7', '1', '50', null, null);
INSERT INTO `t_fenshu` VALUES ('7', '8', '1', '30', null, null);
INSERT INTO `t_fenshu` VALUES ('8', '4', '7', '20', null, null);
INSERT INTO `t_fenshu` VALUES ('9', '5', '1', '10', null, null);
INSERT INTO `t_fenshu` VALUES ('10', '12', '1', '0', null, null);
INSERT INTO `t_fenshu` VALUES ('11', '15', '11', '222', null, null);
INSERT INTO `t_fenshu` VALUES ('12', '3', '1', '1111', null, null);
INSERT INTO `t_fenshu` VALUES ('13', '3', '1', '111', '2017-05-02 17:48:07', null);
INSERT INTO `t_fenshu` VALUES ('14', '3', '1', '111', '2017-05-02 18:08:28', null);
INSERT INTO `t_fenshu` VALUES ('15', '3', '1', '111', '2017-05-02 18:09:20', null);
INSERT INTO `t_fenshu` VALUES ('16', '18', '11', '50', '2017-05-05 03:32:15', null);
INSERT INTO `t_fenshu` VALUES ('17', '21', '11', '0', '2017-05-06 16:29:26', null);

-- ----------------------------
-- Table structure for t_jiaoyuan
-- ----------------------------
DROP TABLE IF EXISTS `t_jiaoyuan`;
CREATE TABLE `t_jiaoyuan` (
  `jiaojuan_id` int(11) NOT NULL DEFAULT '0',
  `stu_id` int(11) DEFAULT NULL,
  `shiti_id` int(11) DEFAULT NULL,
  `timu_id` int(11) DEFAULT NULL,
  `timu_daan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jiaojuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jiaoyuan
-- ----------------------------
INSERT INTO `t_jiaoyuan` VALUES ('13', '1', '3', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('14', '1', '3', '5', 'C');
INSERT INTO `t_jiaoyuan` VALUES ('15', '1', '3', '3', 'ACD');
INSERT INTO `t_jiaoyuan` VALUES ('16', '1', '3', '6', 'cc');
INSERT INTO `t_jiaoyuan` VALUES ('17', '1', '3', '1', 'cc');
INSERT INTO `t_jiaoyuan` VALUES ('18', '1', '4', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('19', '1', '4', '5', 'C');
INSERT INTO `t_jiaoyuan` VALUES ('20', '1', '4', '3', 'AD');
INSERT INTO `t_jiaoyuan` VALUES ('21', '1', '4', '6', 'vvv');
INSERT INTO `t_jiaoyuan` VALUES ('22', '1', '4', '1', 'vv');
INSERT INTO `t_jiaoyuan` VALUES ('23', '2', '3', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('24', '2', '3', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('25', '2', '3', '3', 'ACD');
INSERT INTO `t_jiaoyuan` VALUES ('26', '2', '3', '6', '');
INSERT INTO `t_jiaoyuan` VALUES ('27', '2', '3', '1', '');
INSERT INTO `t_jiaoyuan` VALUES ('28', '2', '4', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('29', '2', '4', '5', 'D');
INSERT INTO `t_jiaoyuan` VALUES ('30', '2', '4', '3', 'AD');
INSERT INTO `t_jiaoyuan` VALUES ('31', '2', '4', '6', '111');
INSERT INTO `t_jiaoyuan` VALUES ('32', '2', '4', '1', 'ccccc');
INSERT INTO `t_jiaoyuan` VALUES ('33', '1', '6', '7', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('34', '1', '6', '4', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('35', '1', '6', '5', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('36', '1', '6', '6', '');
INSERT INTO `t_jiaoyuan` VALUES ('37', '1', '7', '3', 'ABCD');
INSERT INTO `t_jiaoyuan` VALUES ('38', '1', '7', '1', '不知道');
INSERT INTO `t_jiaoyuan` VALUES ('39', '1', '7', '8', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('40', '1', '7', '9', '考试');
INSERT INTO `t_jiaoyuan` VALUES ('41', '1', '8', '8', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('42', '1', '8', '9', '考试啊');
INSERT INTO `t_jiaoyuan` VALUES ('43', '2', '7', '3', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('44', '2', '7', '1', '');
INSERT INTO `t_jiaoyuan` VALUES ('45', '2', '7', '8', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('46', '2', '7', '9', '');
INSERT INTO `t_jiaoyuan` VALUES ('47', '2', '6', '7', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('48', '2', '6', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('49', '2', '6', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('50', '2', '6', '6', '');
INSERT INTO `t_jiaoyuan` VALUES ('51', '1', '9', '12', 'C');
INSERT INTO `t_jiaoyuan` VALUES ('52', '1', '9', '4', 'C');
INSERT INTO `t_jiaoyuan` VALUES ('53', '1', '9', '14', 'AC');
INSERT INTO `t_jiaoyuan` VALUES ('54', '1', '9', '13', 'AB');
INSERT INTO `t_jiaoyuan` VALUES ('55', '1', '9', '1', 'ce');
INSERT INTO `t_jiaoyuan` VALUES ('56', '1', '9', '6', 'd');
INSERT INTO `t_jiaoyuan` VALUES ('57', '7', '3', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('58', '7', '3', '5', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('59', '7', '3', '3', 'ABC');
INSERT INTO `t_jiaoyuan` VALUES ('60', '7', '3', '6', '1');
INSERT INTO `t_jiaoyuan` VALUES ('61', '7', '3', '1', '1');
INSERT INTO `t_jiaoyuan` VALUES ('62', '7', '3', '11', '1');
INSERT INTO `t_jiaoyuan` VALUES ('63', '7', '4', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('64', '7', '4', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('65', '7', '4', '3', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('66', '7', '4', '6', '');
INSERT INTO `t_jiaoyuan` VALUES ('67', '7', '4', '1', '');
INSERT INTO `t_jiaoyuan` VALUES ('68', '1', '5', '7', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('69', '1', '12', '16', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('70', '1', '12', '14', 'AB');
INSERT INTO `t_jiaoyuan` VALUES ('71', '1', '12', '1', '2222');
INSERT INTO `t_jiaoyuan` VALUES ('72', '9', '3', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('73', '9', '3', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('74', '9', '3', '3', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('75', '9', '3', '6', '');
INSERT INTO `t_jiaoyuan` VALUES ('76', '9', '3', '1', '');
INSERT INTO `t_jiaoyuan` VALUES ('77', '9', '3', '11', '');
INSERT INTO `t_jiaoyuan` VALUES ('78', '1', '15', '16', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('79', '1', '15', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('80', '1', '15', '12', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('81', '11', '17', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('82', '11', '17', '12', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('83', '11', '17', '13', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('84', '11', '15', '16', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('85', '11', '15', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('86', '11', '15', '12', 'D');
INSERT INTO `t_jiaoyuan` VALUES ('87', '11', '3', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('88', '11', '3', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('89', '11', '3', '12', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('90', '11', '18', '16', 'D');
INSERT INTO `t_jiaoyuan` VALUES ('91', '11', '18', '4', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('92', '11', '18', '5', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('93', '11', '18', '12', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('94', '11', '18', '3', 'ABCD');
INSERT INTO `t_jiaoyuan` VALUES ('95', '11', '18', '13', 'AC');
INSERT INTO `t_jiaoyuan` VALUES ('96', '11', '18', '14', 'A');
INSERT INTO `t_jiaoyuan` VALUES ('97', '11', '18', '11', '更好');
INSERT INTO `t_jiaoyuan` VALUES ('98', '11', '21', '4', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('99', '11', '21', '5', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('100', '11', '21', '16', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('101', '11', '21', '22', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('102', '11', '21', '11', '都是');

-- ----------------------------
-- Table structure for t_kecheng
-- ----------------------------
DROP TABLE IF EXISTS `t_kecheng`;
CREATE TABLE `t_kecheng` (
  `kecheng_id` int(11) NOT NULL DEFAULT '0',
  `kecheng_bianhao` varchar(50) DEFAULT NULL,
  `kecheng_name` varchar(50) DEFAULT NULL,
  `kecheng_xueshi` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kecheng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_kecheng
-- ----------------------------
INSERT INTO `t_kecheng` VALUES ('2', null, '高级语言程序设计实验', null, 'no');
INSERT INTO `t_kecheng` VALUES ('3', null, '计算机组成原理', null, 'no');
INSERT INTO `t_kecheng` VALUES ('4', null, '计算机科学技术导论', null, 'no');
INSERT INTO `t_kecheng` VALUES ('5', null, '高级语言程序设计', null, 'no');
INSERT INTO `t_kecheng` VALUES ('6', null, '电子技术基础实验', null, 'no');
INSERT INTO `t_kecheng` VALUES ('7', null, '数据结构', null, 'yes');
INSERT INTO `t_kecheng` VALUES ('8', null, '数据结构实验', null, 'no');
INSERT INTO `t_kecheng` VALUES ('9', null, '高等数学', null, 'no');
INSERT INTO `t_kecheng` VALUES ('10', null, '军事理论', null, 'no');
INSERT INTO `t_kecheng` VALUES ('11', null, '大学生职业发展与创业教育', null, 'no');
INSERT INTO `t_kecheng` VALUES ('12', null, '大学生心理健康教育', null, 'no');
INSERT INTO `t_kecheng` VALUES ('13', null, '大学体育', null, 'yes');
INSERT INTO `t_kecheng` VALUES ('14', null, '大学英语', null, 'yes');
INSERT INTO `t_kecheng` VALUES ('15', null, '线性代数', null, 'yes');
INSERT INTO `t_kecheng` VALUES ('16', null, '概率统计', null, 'no');
INSERT INTO `t_kecheng` VALUES ('17', null, '大学物理', null, 'no');
INSERT INTO `t_kecheng` VALUES ('18', null, '大学物理实验', null, 'no');
INSERT INTO `t_kecheng` VALUES ('19', null, '大声道', null, 'no');

-- ----------------------------
-- Table structure for t_shiti
-- ----------------------------
DROP TABLE IF EXISTS `t_shiti`;
CREATE TABLE `t_shiti` (
  `shiti_id` int(11) NOT NULL DEFAULT '0',
  `shiti_name` varchar(50) DEFAULT NULL,
  `shiti_jieshao` varchar(255) DEFAULT NULL,
  `shiti_shijian` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  `shiti_nandu` int(11) DEFAULT NULL,
  `kecheng_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shiti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shiti
-- ----------------------------
INSERT INTO `t_shiti` VALUES ('3', 'C语言课堂测试1', 'C语言课堂测试1', '2017-5-6 15:21:07', 'no', '2', '2');
INSERT INTO `t_shiti` VALUES ('4', 'C语言课堂测试2', 'C语言课堂测试2', '2016-10-25 17:32:25', 'no', '3', '3');
INSERT INTO `t_shiti` VALUES ('5', 'C语言课堂测试3', 'C语言课堂测试3', '2016-10-25 17:32:25', 'no', '3', '4');
INSERT INTO `t_shiti` VALUES ('6', 'C语言课堂测试4', 'C语言课堂测试4', '2016-10-25 17:32:25', 'no', '3', '5');
INSERT INTO `t_shiti` VALUES ('7', 'C语言课堂测试5', 'C语言课堂测试5', '2016-10-25 17:32:25', 'no', '3', '6');
INSERT INTO `t_shiti` VALUES ('8', '期末试卷', '期末试卷', '2016-10-25 17:32:25', 'no', '3', '13');
INSERT INTO `t_shiti` VALUES ('9', '期中试卷', '期中试卷', '2016-10-25 17:32:25', 'no', '3', '13');
INSERT INTO `t_shiti` VALUES ('10', 'bbb', '请输入内容', '2017-4-10 19:56:03', 'no', '3', '2');
INSERT INTO `t_shiti` VALUES ('11', '44444', '<p>4444</p>', '2017-4-10 19:58:21', 'yes', '3', '3');
INSERT INTO `t_shiti` VALUES ('12', 'ttt', '<p>tttt</p>', '2017-4-10 20:01:16', 'yes', '3', '2');
INSERT INTO `t_shiti` VALUES ('13', '龙虾', '哈哈哈', '2017-4-22 20:46:14', 'no', '3', '17');
INSERT INTO `t_shiti` VALUES ('14', '龙虾', '期末评测', '2017-4-22 20:48:26', 'yes', '2', '17');
INSERT INTO `t_shiti` VALUES ('15', '11', '请输入内容', '2017-4-26 10:15:27', 'no', '3', '2');
INSERT INTO `t_shiti` VALUES ('16', '问问', '微微的', '2017-5-6 14:24:53', 'no', '3', '8');
INSERT INTO `t_shiti` VALUES ('17', 'FGFDGFGFG', '请输入内容SDFSDFDSFDS', '2017-5-2 15:59:56', 'no', '3', '2');
INSERT INTO `t_shiti` VALUES ('18', 'C语言考核', '测试1', '2017-5-5 3:24:17', 'no', '2', '2');
INSERT INTO `t_shiti` VALUES ('19', '应试', '请输入内容', '2017-5-6 15:25:04', 'no', '1', '2');
INSERT INTO `t_shiti` VALUES ('20', '放的地方', '请输入内容', '2017-5-6 16:24:52', 'no', '3', '2');
INSERT INTO `t_shiti` VALUES ('21', '应试1', '大是大非', '2017-5-6 16:25:22', 'no', '3', '2');

-- ----------------------------
-- Table structure for t_stu
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu` (
  `stu_id` int(11) NOT NULL DEFAULT '0',
  `stu_xuehao` varchar(50) DEFAULT NULL,
  `stu_realname` varchar(50) DEFAULT NULL,
  `stu_sex` varchar(50) DEFAULT NULL,
  `stu_age` varchar(50) DEFAULT NULL,
  `stu_xueyuan` varchar(50) DEFAULT NULL,
  `stu_zhuanye` varchar(50) DEFAULT NULL,
  `stu_banji` varchar(50) DEFAULT NULL,
  `login_pw` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stu
-- ----------------------------
INSERT INTO `t_stu` VALUES ('1', '2017001', '刘星', '男', '23', '信息学院', '软件工程', '17软1', '2013701', 'no');
INSERT INTO `t_stu` VALUES ('2', '2017002', '小红', '女', '23', '信息学院', '软件工程', '17软1', '2017002', 'no');
INSERT INTO `t_stu` VALUES ('7', '2017003', '张三', '男', '13', '土木学院', '工程架构', '土木0001', '2013003', 'no');
INSERT INTO `t_stu` VALUES ('8', '2017004', '李四', '男', '22', '信息学院', '软件工程', '软件0001', '2013004', 'yes');
INSERT INTO `t_stu` VALUES ('9', '2017005', '王五', '男', '24', '土木学院', '工程架构', '土木0001', '2013005', 'yes');
INSERT INTO `t_stu` VALUES ('10', '2017006', '丽丽', '女', '23', '食品学院', '食品安全', '食品0001', '2013006', 'yes');
INSERT INTO `t_stu` VALUES ('11', '1', '1', '男', '22', '信电学院', '软件工程', '17计1', '1', 'no');
INSERT INTO `t_stu` VALUES ('12', '2017005', '禄运恒', '男', '21', '信电', '计算机科学与技术', '17计1', '1001', 'no');
INSERT INTO `t_stu` VALUES ('13', '2017004', '丙端丽', '女', '21', '信电', '计算机科学与技术', '17计1', '1003', 'no');
INSERT INTO `t_stu` VALUES ('14', '2017006', '枝书兰', '女', '22', '信电学院', '计算机科学与技术', '17计1', '1006', 'no');
INSERT INTO `t_stu` VALUES ('15', '2017007', '盈蔓蔓', '女', '21', '信电学院', '计算机科学与技术', '17计1', '1007', 'no');
INSERT INTO `t_stu` VALUES ('16', '2017007', '胡灵卉', '女', '23', '信电学院', '计算机科学与技术', '17计1', '1007', 'no');
INSERT INTO `t_stu` VALUES ('17', '2017008', '蔡秋荷', '女', '21', '信电学院', '计算机科学与技术', '17计1', '1008', 'no');
INSERT INTO `t_stu` VALUES ('18', '2017009', '逢雅惠', '男', '23', '信电学院', '计算机科学与技术', '17计1', '1009', 'no');
INSERT INTO `t_stu` VALUES ('19', '2017010', '芒涵易', '男', '21', '信电学院', '计算机科学与技术', '17计1', '1010', 'no');
INSERT INTO `t_stu` VALUES ('20', '2017011', '解元嘉', '男', '21', '信电学院', '计算机科学与技术', '17计1', '1011', 'no');
INSERT INTO `t_stu` VALUES ('21', '2017012', '理兰若', '男', '22', '信电学院', '计算机科学与技术', '17计1', '1012', 'no');
INSERT INTO `t_stu` VALUES ('22', '2017013', '古鸿卓', '男', '22', '信电学院', '计算机科学与技术', '17计1', '1013', 'no');
INSERT INTO `t_stu` VALUES ('23', '2017014', '戊安安', '男', '21', '信电学院', '计算机科学与技术', '17计1', '1014', 'no');
INSERT INTO `t_stu` VALUES ('24', '2017015', '郏依柔', '女', '21', '信电学院', '计算机科学与技术', '17计1', '1015', 'no');
INSERT INTO `t_stu` VALUES ('25', '2017016', '图门婉清', '女', '21', '信电学院', '计算机科学与技术', '17计1', '1016', 'no');

-- ----------------------------
-- Table structure for t_tea
-- ----------------------------
DROP TABLE IF EXISTS `t_tea`;
CREATE TABLE `t_tea` (
  `tea_id` int(11) NOT NULL DEFAULT '0',
  `tea_bianhao` varchar(50) DEFAULT NULL,
  `tea_realname` varchar(50) DEFAULT NULL,
  `tea_sex` varchar(50) DEFAULT NULL,
  `tea_age` varchar(50) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `login_pw` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tea
-- ----------------------------
INSERT INTO `t_tea` VALUES ('0', null, null, null, null, null, null, null);
INSERT INTO `t_tea` VALUES ('1', '001', '11', '女', '1', '1', '11', 'no');
INSERT INTO `t_tea` VALUES ('4', null, '2', '男', '2', '2', '', 'yes');
INSERT INTO `t_tea` VALUES ('5', null, '23', '男', '23', '23', '23', 'yes');
INSERT INTO `t_tea` VALUES ('6', null, '2', '男', '', '', '', 'yes');
INSERT INTO `t_tea` VALUES ('7', null, '002', '男', '25', '002', '002', 'yes');
INSERT INTO `t_tea` VALUES ('8', null, '周树', '男', '30', '001', '001', 'no');
INSERT INTO `t_tea` VALUES ('9', null, '李颖', '女', '26', '002', '002', 'no');
INSERT INTO `t_tea` VALUES ('10', null, '赵龙', '男', '31', '003', '003', 'no');
INSERT INTO `t_tea` VALUES ('11', null, '鞠秀娟', '女', '32', '004', '004', 'no');
INSERT INTO `t_tea` VALUES ('12', null, '卢静丹', '女', '29', '005', '005', 'no');
INSERT INTO `t_tea` VALUES ('13', null, '徐和昌', '男', '47', '005', '005', 'yes');
INSERT INTO `t_tea` VALUES ('14', null, '徐和昌', '男', '49', '006', '006', 'no');
INSERT INTO `t_tea` VALUES ('15', null, '石云亮', '男', '50', '007', '007', 'no');
INSERT INTO `t_tea` VALUES ('16', null, '梅俊杰', '男', '36', '008', '008', 'no');
INSERT INTO `t_tea` VALUES ('17', null, '阮晓曼', '女', '36', '009', '009', 'no');
INSERT INTO `t_tea` VALUES ('18', null, '齐雪曼', '女', '33', '010', '010', 'no');
INSERT INTO `t_tea` VALUES ('19', null, '苏汗颜', '男', '33', '011', '011', 'no');
INSERT INTO `t_tea` VALUES ('20', null, '怀芷文', '女', '46', '012', '012', 'no');
INSERT INTO `t_tea` VALUES ('21', null, '褒翊君', '男', '23', '012', '012', 'yes');
INSERT INTO `t_tea` VALUES ('22', null, '保馥芬', '女', '54', '013', '013', 'no');
INSERT INTO `t_tea` VALUES ('23', null, '冀涵煦', '男', '54', '014', '014', 'no');
INSERT INTO `t_tea` VALUES ('24', null, '伯贞婉', '女', '43', '015', '015', 'no');
INSERT INTO `t_tea` VALUES ('25', null, '爱映颖', '女', '32', '016', '016', 'no');
INSERT INTO `t_tea` VALUES ('26', null, '王逸仙', '男', '45', '017', '017', 'no');
INSERT INTO `t_tea` VALUES ('27', null, '缪巧春', '男', '34', '018', '018', 'no');
INSERT INTO `t_tea` VALUES ('28', null, '北春华', '男', '23', '019', '019', 'no');
INSERT INTO `t_tea` VALUES ('29', null, '行子默', '男', '43', '020', '020', 'no');
INSERT INTO `t_tea` VALUES ('30', null, '帖玉环', '女', '54', '023', '023', 'no');
INSERT INTO `t_tea` VALUES ('31', null, '慕容念梦', '女', '31', '021', '021', 'no');
INSERT INTO `t_tea` VALUES ('32', null, '求怀薇', '女', '43', '022', '022', 'no');
INSERT INTO `t_tea` VALUES ('33', null, '称秋双', '男', '34', '024', '024', 'no');
INSERT INTO `t_tea` VALUES ('34', null, '绍绮露', '女', '32', '025', '025', 'no');

-- ----------------------------
-- Table structure for t_timu
-- ----------------------------
DROP TABLE IF EXISTS `t_timu`;
CREATE TABLE `t_timu` (
  `timu_id` int(11) NOT NULL DEFAULT '0',
  `timu_name` varchar(255) DEFAULT NULL,
  `timu_leixing` varchar(255) DEFAULT NULL,
  `timu_xuanxianga` varchar(255) DEFAULT NULL,
  `timu_xuanxiangb` varchar(255) DEFAULT NULL,
  `timu_xuanxiangc` varchar(255) DEFAULT NULL,
  `timu_xuanxiangd` varchar(255) DEFAULT NULL,
  `timu_daan` varchar(255) DEFAULT NULL,
  `timu_fenshu` int(11) DEFAULT NULL,
  `kecheng_id` int(11) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  `timu_nandu` int(11) DEFAULT NULL,
  `kind_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`timu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_timu
-- ----------------------------
INSERT INTO `t_timu` VALUES ('1', 'C语言核心思想是什么？', 'jianda', null, null, null, null, '封装继承和多态', '10', '4', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('3', 'C语言的基本数据类型是？', 'duoxuan', 'int', 'string', 'boolean', 'char', 'ABCD', '10', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('4', 'C语言是那个公司的？', 'danxuan', 'sun', 'jbuder', 'microsoft', 'ibm', 'A', '10', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('5', 'C语言诞生于那一年？', 'danxuan', '1980', '1981', '1982', '1983', 'A', '10', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('6', '测试1', 'jianda', null, null, null, null, '测试题答案', '10', '2', 'yes', '3', null);
INSERT INTO `t_timu` VALUES ('7', '用一个字节表示无符号整数，其最大值是十进制数', 'danxuan', '128', '256', '255', '127', 'A', '5', '4', 'no', '1', null);
INSERT INTO `t_timu` VALUES ('8', 'C语言全名叫什么', 'danxuan', '中央处理器', 'cccu', 'pu', 'PPU', 'A', '5', '5', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('9', '计算机基础课程建设目的是什么？', 'jianda', null, null, null, null, '考试啊', '20', '5', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('10', '二极管的死电区电压随温度的升高', 'danxuan', '升高', '降低', '不变', '反复', 'A', '5', '6', 'no', '2', null);
INSERT INTO `t_timu` VALUES ('11', '若全局整型变量未初始化,则默认的初始值是', 'jianda', null, null, null, null, '无存储类型，或静态，static，生命周期从定义点到整个程序结束', '10', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('12', '测试题单选1', 'danxuan', '测试a', '测试b', '测试c', '测试d', 'C', '3', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('13', '测试多选1', 'duoxuan', '测试a', '测试b', '测试c', '测试d', 'B', '5', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('14', '测试多选2', 'duoxuan', '测试a', '测试b', '测试c', '测试d', 'A', '5', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('16', '设int x=2,y=4; 值为非0的表达式是', 'danxuan', '1/x*y', 'l/(x*y)', '1.0/x/y ', '1/x/(double)y', 'D', '5', '2', 'no', '2', null);
INSERT INTO `t_timu` VALUES ('17', '小明搬家到哪', 'danxuan', '南京', '徐州', '上海', '湖北', 'B', '10', '17', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('18', '小明去哪了', 'duoxuan', '上海', '北京', '南京', '湖北', 'AB', '10', '17', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('19', '不属于字符型常量的是', 'danxuan', '”s”', '‘8\'', '\'A;', '‘\\n’', 'D', '5', '2', 'no', '1', null);
INSERT INTO `t_timu` VALUES ('20', '正确定义无符号整型变量m的语句是', 'danxuan', 'int m;', 'unsigned int m;', 'signed int m;', 'unsigned signed m;', 'B', '5', '2', 'no', '1', null);
INSERT INTO `t_timu` VALUES ('21', '设typedef float REAL;REAL x = 1;,表达式x/2的值是', 'jianda', null, null, null, null, '0.5', '11', '2', 'no', '2', null);
INSERT INTO `t_timu` VALUES ('22', '在一个C语言中', 'chengxusheji', '主函数只能有一个', '主函数可以有很多个', '非主函数只能有一个', '主函数和非主函数都可以有多个', 'A', '5', '2', 'no', '1', null);
INSERT INTO `t_timu` VALUES ('23', '123', 'chengxusheji', null, null, null, null, '23344434', '0', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('24', '6 ', 'danxuan', '1', '1', '1', '127', 'A', '0', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('25', 'CESBUASDHUSDHKJAS HDJKASDH ', 'chengxusheji', null, null, null, null, 'AHJKSDHSKJ HAKSJD', '0', '6', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('26', '课程设计', 'chengxusheji', null, null, null, null, '设计选型', '0', '19', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('27', '123', 'chengxusheji', null, null, null, null, '1', '3', '2', 'no', '3', null);
INSERT INTO `t_timu` VALUES ('28', '111', 'chengxusheji', null, null, null, null, '111', '0', '2', 'no', '3', null);

-- ----------------------------
-- Table structure for t_timu_shiti
-- ----------------------------
DROP TABLE IF EXISTS `t_timu_shiti`;
CREATE TABLE `t_timu_shiti` (
  `id` int(11) NOT NULL DEFAULT '0',
  `shitiId` int(11) DEFAULT NULL,
  `timuId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_timu_shiti
-- ----------------------------
INSERT INTO `t_timu_shiti` VALUES ('12', '6', '7');
INSERT INTO `t_timu_shiti` VALUES ('13', '6', '4');
INSERT INTO `t_timu_shiti` VALUES ('14', '6', '5');
INSERT INTO `t_timu_shiti` VALUES ('15', '6', '6');
INSERT INTO `t_timu_shiti` VALUES ('16', '7', '3');
INSERT INTO `t_timu_shiti` VALUES ('17', '7', '1');
INSERT INTO `t_timu_shiti` VALUES ('18', '7', '8');
INSERT INTO `t_timu_shiti` VALUES ('19', '7', '9');
INSERT INTO `t_timu_shiti` VALUES ('22', '4', '4');
INSERT INTO `t_timu_shiti` VALUES ('23', '4', '5');
INSERT INTO `t_timu_shiti` VALUES ('24', '4', '3');
INSERT INTO `t_timu_shiti` VALUES ('25', '4', '6');
INSERT INTO `t_timu_shiti` VALUES ('26', '4', '1');
INSERT INTO `t_timu_shiti` VALUES ('27', '9', '12');
INSERT INTO `t_timu_shiti` VALUES ('28', '9', '4');
INSERT INTO `t_timu_shiti` VALUES ('29', '9', '14');
INSERT INTO `t_timu_shiti` VALUES ('30', '9', '13');
INSERT INTO `t_timu_shiti` VALUES ('31', '9', '1');
INSERT INTO `t_timu_shiti` VALUES ('32', '9', '6');
INSERT INTO `t_timu_shiti` VALUES ('35', '5', '7');
INSERT INTO `t_timu_shiti` VALUES ('39', '11', '15');
INSERT INTO `t_timu_shiti` VALUES ('45', '12', '16');
INSERT INTO `t_timu_shiti` VALUES ('46', '12', '14');
INSERT INTO `t_timu_shiti` VALUES ('47', '12', '1');
INSERT INTO `t_timu_shiti` VALUES ('48', '4', '15');
INSERT INTO `t_timu_shiti` VALUES ('49', '15', '16');
INSERT INTO `t_timu_shiti` VALUES ('50', '15', '5');
INSERT INTO `t_timu_shiti` VALUES ('51', '15', '12');
INSERT INTO `t_timu_shiti` VALUES ('55', '17', '4');
INSERT INTO `t_timu_shiti` VALUES ('56', '17', '12');
INSERT INTO `t_timu_shiti` VALUES ('57', '17', '13');
INSERT INTO `t_timu_shiti` VALUES ('58', '18', '16');
INSERT INTO `t_timu_shiti` VALUES ('59', '18', '4');
INSERT INTO `t_timu_shiti` VALUES ('60', '18', '5');
INSERT INTO `t_timu_shiti` VALUES ('61', '18', '12');
INSERT INTO `t_timu_shiti` VALUES ('62', '18', '3');
INSERT INTO `t_timu_shiti` VALUES ('63', '18', '13');
INSERT INTO `t_timu_shiti` VALUES ('64', '18', '14');
INSERT INTO `t_timu_shiti` VALUES ('65', '18', '11');
INSERT INTO `t_timu_shiti` VALUES ('72', '3', '16');
INSERT INTO `t_timu_shiti` VALUES ('73', '3', '21');
INSERT INTO `t_timu_shiti` VALUES ('79', '19', '22');
INSERT INTO `t_timu_shiti` VALUES ('80', '21', '4');
INSERT INTO `t_timu_shiti` VALUES ('81', '21', '5');
INSERT INTO `t_timu_shiti` VALUES ('82', '21', '16');
INSERT INTO `t_timu_shiti` VALUES ('83', '21', '22');
INSERT INTO `t_timu_shiti` VALUES ('84', '21', '11');
