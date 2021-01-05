/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : storemanagement

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 31/12/2020 00:04:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for commodity
-- ----------------------------
DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `supplierId` int NOT NULL COMMENT '销售该商品的供应商信息',
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产地信息',
  `status` int NOT NULL COMMENT '逻辑删除时用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supplier_fk`(`supplierId`) USING BTREE,
  CONSTRAINT `supplier_fk` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity
-- ----------------------------
INSERT INTO `commodity` VALUES ('090a0d9e-6ea3-44d5-8c56-13341c3991ad', '甜橙', 2.50, 19, '四川内江', 1);
INSERT INTO `commodity` VALUES ('0fe2f2f7-e8e6-4685-959a-2ba535e39bd2', '灯丝牛肉', 22.00, 3, '四川理塘县', 1);
INSERT INTO `commodity` VALUES ('12', '西瓜', 2.20, 1, '宁夏', 1);
INSERT INTO `commodity` VALUES ('13', '极品奶酪', 4.60, 2, '宁夏', 1);
INSERT INTO `commodity` VALUES ('1efd43b9-0b46-4d50-bc68-4a25114a0c23', '特级车厘子', 32.40, 18, '四川汶川', 1);
INSERT INTO `commodity` VALUES ('22', '雪糕', 3.80, 2, '乌鲁木齐', 1);
INSERT INTO `commodity` VALUES ('2347b027-b28c-44e2-90e9-12d06c3ef23b', '极品虫草', 220.00, 7, '西藏林芝', 1);
INSERT INTO `commodity` VALUES ('28', '番茄', 0.60, 2, '云南楚雄', 1);
INSERT INTO `commodity` VALUES ('29', '土豆', 0.30, 2, '四川大凉山', 1);
INSERT INTO `commodity` VALUES ('2b181d2c-5916-4cb1-a517-115791f388c0', '跑山鸡', 28.00, 4, '四川茂县', 1);
INSERT INTO `commodity` VALUES ('5ac15599-7973-46cd-b742-3db679aa0de5', '西瓜', 1.60, 11, '四川简阳', 1);
INSERT INTO `commodity` VALUES ('6', '优酸乳', 2.30, 1, '齐齐哈尔', 1);
INSERT INTO `commodity` VALUES ('689dc703-9e43-4de9-9601-c6a16819ac9a', '枸杞', 1.80, 20, '山西太原', 1);
INSERT INTO `commodity` VALUES ('7e945e74-e608-4024-aeca-7a8729fb385f', '', 1.80, 5, '四川成都太平镇', 1);
INSERT INTO `commodity` VALUES ('81ee058a-ff3d-4d2c-a5c6-774f846d3609', '特级小米', 3.60, 10, '黑龙江哈尔滨', 1);
INSERT INTO `commodity` VALUES ('830e2b82-85bf-419c-b82f-6460a27f9a0e', '口口脆西瓜', 1.80, 12, '宁夏银川', 1);
INSERT INTO `commodity` VALUES ('845dbd1c-44ad-4d1d-a611-5a3a718c0aae', '螺蛳粉', 8.60, 17, '广西柳州', 1);
INSERT INTO `commodity` VALUES ('c07fbac8-12b2-401e-9be1-ca2372ab5e43', '牦牛肉', 48.20, 3, '四川理塘县', 1);
INSERT INTO `commodity` VALUES ('d9dd721f-faf0-4044-93d1-22c8dfb61876', '特辣火锅底料', 22.60, 9, '重庆合川', 1);
INSERT INTO `commodity` VALUES ('dd6de199-e5ec-4088-89c8-2402dc5c7b4d', '小龙虾', 7.60, 8, '湖北孝感', 1);
INSERT INTO `commodity` VALUES ('ef8f60ca-d1c2-4f8a-a5b9-aa6508dbf282', '巧克力草莓', 23.50, 6, '四川成都兴隆镇', 1);
INSERT INTO `commodity` VALUES ('f055efc7-556c-4c3f-8953-37a34da86175', '香辣皮皮虾', 18.30, 16, '广州', 1);

-- ----------------------------
-- Table structure for commodity_supplier
-- ----------------------------
DROP TABLE IF EXISTS `commodity_supplier`;
CREATE TABLE `commodity_supplier`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid_FK`(`sid`) USING BTREE,
  INDEX `cid_FK`(`cid`) USING BTREE,
  CONSTRAINT `cid_FK` FOREIGN KEY (`cid`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sid_FK` FOREIGN KEY (`sid`) REFERENCES `supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commodity_supplier
-- ----------------------------
INSERT INTO `commodity_supplier` VALUES (15, '6', 1);
INSERT INTO `commodity_supplier` VALUES (16, '12', 2);
INSERT INTO `commodity_supplier` VALUES (17, '13', 2);
INSERT INTO `commodity_supplier` VALUES (18, '22', 2);
INSERT INTO `commodity_supplier` VALUES (19, '28', 2);
INSERT INTO `commodity_supplier` VALUES (20, '29', 2);
INSERT INTO `commodity_supplier` VALUES (22, 'dd6de199-e5ec-4088-89c8-2402dc5c7b4d', 8);
INSERT INTO `commodity_supplier` VALUES (23, '5ac15599-7973-46cd-b742-3db679aa0de5', 11);
INSERT INTO `commodity_supplier` VALUES (24, 'c07fbac8-12b2-401e-9be1-ca2372ab5e43', 3);
INSERT INTO `commodity_supplier` VALUES (25, '7e945e74-e608-4024-aeca-7a8729fb385f', 5);
INSERT INTO `commodity_supplier` VALUES (26, '2b181d2c-5916-4cb1-a517-115791f388c0', 4);
INSERT INTO `commodity_supplier` VALUES (27, 'ef8f60ca-d1c2-4f8a-a5b9-aa6508dbf282', 6);
INSERT INTO `commodity_supplier` VALUES (28, '2347b027-b28c-44e2-90e9-12d06c3ef23b', 7);
INSERT INTO `commodity_supplier` VALUES (29, 'f055efc7-556c-4c3f-8953-37a34da86175', 16);
INSERT INTO `commodity_supplier` VALUES (30, 'd9dd721f-faf0-4044-93d1-22c8dfb61876', 9);
INSERT INTO `commodity_supplier` VALUES (31, '845dbd1c-44ad-4d1d-a611-5a3a718c0aae', 17);
INSERT INTO `commodity_supplier` VALUES (32, '1efd43b9-0b46-4d50-bc68-4a25114a0c23', 18);
INSERT INTO `commodity_supplier` VALUES (33, '090a0d9e-6ea3-44d5-8c56-13341c3991ad', 19);
INSERT INTO `commodity_supplier` VALUES (34, '81ee058a-ff3d-4d2c-a5c6-774f846d3609', 10);
INSERT INTO `commodity_supplier` VALUES (35, '830e2b82-85bf-419c-b82f-6460a27f9a0e', 12);
INSERT INTO `commodity_supplier` VALUES (36, '689dc703-9e43-4de9-9601-c6a16819ac9a', 20);
INSERT INTO `commodity_supplier` VALUES (37, '0fe2f2f7-e8e6-4685-959a-2ba535e39bd2', 3);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reputation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '该客户的信誉度如何，低信誉度客户下订单时要严格检查订单信息',
  `priority` int NULL DEFAULT NULL COMMENT '用户的重要程度，1-10，数字越大优先级越高，可以根据这个字段来适当调整发货时间',
  `phoneNum` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (3, '刘德华', '华阳邓毛肚', '不错', 80, '82220333', 1);
INSERT INTO `customer` VALUES (4, '王二麻子', '成都市新津县幸福村六组', '差', 50, '13541613211', 1);
INSERT INTO `customer` VALUES (5, '田菜农', '成都太平镇骑龙村', '不错', 80, '13584612321', 1);
INSERT INTO `customer` VALUES (6, '铁公鸡', '成都兴隆镇火石岩村', '差劲', 40, '13584612321', 1);
INSERT INTO `customer` VALUES (7, '凤姐', '成都市新津幸福村1组', '不错', 80, '13623646132', 1);
INSERT INTO `customer` VALUES (8, '粉丝妹儿', '成都新津县幸福村7组', '好', 90, '13856261311', 1);
INSERT INTO `customer` VALUES (9, '张麻子', '成都胜利镇', '一般', 70, '13721661513', 1);
INSERT INTO `customer` VALUES (10, '王淑芬', '成都怡心街道骑龙家园2期', '不错', 80, '13551320321', 1);
INSERT INTO `customer` VALUES (11, '胡仁德', '成都太平镇倒骑龙村2组', '不错', 80, '13623646132', 1);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '采购管理', 0, NULL);
INSERT INTO `menu` VALUES (2, '库存管理', 0, NULL);
INSERT INTO `menu` VALUES (3, '账号管理', 0, NULL);
INSERT INTO `menu` VALUES (4, '统计查询', 0, NULL);
INSERT INTO `menu` VALUES (5, '申请审核', 0, NULL);
INSERT INTO `menu` VALUES (7, '采购订单管理', 1, 'page/sys/purchase_order.jsp');
INSERT INTO `menu` VALUES (8, '入库申请', 2, 'page/sys/approval_in.jsp');
INSERT INTO `menu` VALUES (9, '出库申请', 2, 'page/sys/approval_out.jsp');
INSERT INTO `menu` VALUES (11, '查看账号', 3, 'page/sys/users.jsp');
INSERT INTO `menu` VALUES (13, '采购审核', 5, 'page/sys/verify_supply.jsp');
INSERT INTO `menu` VALUES (14, '入库审核', 5, 'page/sys/verify_in.jsp');
INSERT INTO `menu` VALUES (15, '出库审核', 5, 'page/sys/verify_out.jsp');
INSERT INTO `menu` VALUES (17, '入库统计', 4, 'page/sys/in_store_statistics.jsp');
INSERT INTO `menu` VALUES (18, '出库统计', 4, 'page/sys/out_store_statistics.jsp');
INSERT INTO `menu` VALUES (19, '商品管理', 1, 'page/sys/commodity.jsp');
INSERT INTO `menu` VALUES (20, '供应商管理', 1, 'page/sys/supplier.jsp');
INSERT INTO `menu` VALUES (21, '角色管理', 3, 'page/sys/role.jsp');
INSERT INTO `menu` VALUES (22, '客户管理', 1, 'page/sys/customer.jsp');
INSERT INTO `menu` VALUES (23, '销售订单管理', 2, 'page/sys/sale_order.jsp');
INSERT INTO `menu` VALUES (24, '入库', 2, 'page/sys/store_in.jsp');
INSERT INTO `menu` VALUES (25, '出库', 2, 'page/sys/store_out.jsp');
INSERT INTO `menu` VALUES (26, '库存统计', 4, 'page/sys/store_all.jsp');

-- ----------------------------
-- Table structure for purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `purchase_order`;
CREATE TABLE `purchase_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `finishtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierId` int NOT NULL COMMENT '供应商ID，表明该订单是想那一个供应商发起的，如果货物出问题，那么可以根据该字段找到供应商',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '订单状态，采购订单的状态可以分为4种，\r\n0：申请采购货物，但是系统管理员未批准该申请   \r\n1：等待系统管理员审批该订单 \r\n2：审批通过，供应商发货，但是该货物还未入库  \r\n3: 仓库管理员提交入库申请，系统管理员可以依此来查看入库申请\r\n4:系统管理员同意入库，审核通过\r\n5：订单完成，货物已经入库',
  `amount` decimal(10, 0) NOT NULL COMMENT '采购数量，采购成功后，仓库中的该货物对应的库存要加上amount',
  `commodityId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID，表明采购的是哪一种商品',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supplierId_fk`(`supplierId`) USING BTREE,
  INDEX `commodity_FK`(`commodityId`) USING BTREE,
  CONSTRAINT `commodity_FK` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `supplierId_fk` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_order
-- ----------------------------
INSERT INTO `purchase_order` VALUES ('10', '2020-12-28 21:50:25', '2020-12-30 11:17:06', 4, 1416.80, 5, 51, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('11', '2020-12-28 21:50:53', NULL, 3, 2410.00, 0, 50, 'c07fbac8-12b2-401e-9be1-ca2372ab5e43');
INSERT INTO `purchase_order` VALUES ('12', '2020-12-28 21:51:49', '2020-12-30 11:17:33', 12, 216.90, 5, 121, '830e2b82-85bf-419c-b82f-6460a27f9a0e');
INSERT INTO `purchase_order` VALUES ('13', '2020-12-28 22:44:43', '2020-12-30 15:40:26', 8, 1520.00, 5, 200, 'dd6de199-e5ec-4088-89c8-2402dc5c7b4d');
INSERT INTO `purchase_order` VALUES ('14', '2020-12-28 22:50:35', '2020-12-30 15:40:26', 3, 9640.00, 5, 200, 'c07fbac8-12b2-401e-9be1-ca2372ab5e43');
INSERT INTO `purchase_order` VALUES ('15', '2020-12-28 22:50:45', '2020-12-30 15:40:26', 16, 2379.00, 5, 130, 'f055efc7-556c-4c3f-8953-37a34da86175');
INSERT INTO `purchase_order` VALUES ('16', '2020-12-28 22:51:08', '2020-12-30 15:40:26', 2, 72.30, 5, 121, '28');
INSERT INTO `purchase_order` VALUES ('17', '2020-12-28 22:51:28', '2020-12-30 15:40:26', 12, 1440.00, 5, 800, '830e2b82-85bf-419c-b82f-6460a27f9a0e');
INSERT INTO `purchase_order` VALUES ('18', '2020-12-28 22:51:54', '2020-12-30 15:40:26', 10, 43200.00, 5, 12000, '81ee058a-ff3d-4d2c-a5c6-774f846d3609');
INSERT INTO `purchase_order` VALUES ('1acd2b12-cdb6-45c4-b71a-f7ca8a66fce6', '2020-12-30 20:06:17', NULL, 19, 52.00, 0, 20, '090a0d9e-6ea3-44d5-8c56-13341c3991ad');
INSERT INTO `purchase_order` VALUES ('4f0167e8-9cd1-4697-a026-66f6a2c9142a', '2020-12-30 15:42:12', NULL, 4, 1260.00, 5, 45, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('5e0eb1ff-dce7-464b-aa7b-9858ec226334', '2020-12-30 15:39:10', '2020-12-30 15:40:26', 4, 840.00, 5, 30, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('5e555aa0-4ab4-4d42-8913-77f1a250fd4c', '2020-12-30 15:41:49', NULL, 4, 1176.00, 5, 42, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('6', '2020-12-28 16:06:36', '2020-12-30 15:40:26', 18, 3240.00, 5, 100, '1efd43b9-0b46-4d50-bc68-4a25114a0c23');
INSERT INTO `purchase_order` VALUES ('64f190fd-359a-4356-b536-58556a707286', '2020-12-30 15:39:03', '2020-12-30 15:40:32', 4, 840.00, 5, 30, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('670af396-43b9-4989-a281-c6327bac5718', '2020-12-30 15:41:10', NULL, 4, 3640.00, 5, 130, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('6c553d7a-cba3-463c-9597-11c390791ced', '2020-12-30 15:38:17', '2020-12-30 15:40:32', 4, 2800.00, 5, 100, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('7', '2020-12-28 21:48:36', '2020-12-30 15:40:32', 19, 260.00, 5, 100, '090a0d9e-6ea3-44d5-8c56-13341c3991ad');
INSERT INTO `purchase_order` VALUES ('70c93027-0feb-4ab0-9347-8231b6ffd301', '2020-12-30 15:38:47', '2020-12-30 15:40:32', 4, 2856.00, 5, 102, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('7484153b-9b8a-4a6d-aa66-21ba2b6ebac4', '2020-12-30 11:41:59', NULL, 20, 21.60, 0, 12, '689dc703-9e43-4de9-9601-c6a16819ac9a');
INSERT INTO `purchase_order` VALUES ('7f0b2534-5d76-4aef-8300-af1e5a7c1ba6', '2020-12-30 21:35:37', '2020-12-30 22:05:22', 19, 75.00, 0, 30, '090a0d9e-6ea3-44d5-8c56-13341c3991ad');
INSERT INTO `purchase_order` VALUES ('8', '2020-12-28 21:49:44', '2020-12-30 15:40:32', 18, 3904.20, 5, 121, '1efd43b9-0b46-4d50-bc68-4a25114a0c23');
INSERT INTO `purchase_order` VALUES ('89273fd2-de86-41d3-a955-48ae6a96bc36', '2020-12-30 15:41:26', NULL, 4, 840.00, 5, 30, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('9', '2020-12-28 21:50:08', '2020-12-30 15:40:32', 2, 2400.00, 5, 8000, '29');
INSERT INTO `purchase_order` VALUES ('909ac62b-8746-4ed9-bf08-a90782cc60c0', '2020-12-30 15:41:34', NULL, 4, 1120.00, 5, 40, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('947a2e2f-6e01-469f-9d9e-676c11964825', '2020-12-30 15:41:19', NULL, 4, 1680.00, 5, 60, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('a19f2a3d-da86-41fd-8ab8-cffe422a55aa', '2020-12-30 15:41:41', NULL, 4, 840.00, 5, 30, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('a8dce6ad-1a39-41bc-9c81-d21bce9a02ae', '2020-12-30 15:38:25', '2020-12-30 15:40:32', 4, 280.00, 5, 10, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('c18b8439-137e-4093-be3f-dcfcf164b017', '2020-12-30 11:43:14', '2020-12-30 11:43:53', 20, 540.00, 5, 300, '689dc703-9e43-4de9-9601-c6a16819ac9a');
INSERT INTO `purchase_order` VALUES ('da17933d-7f14-4096-8092-fd474d73f9b8', '2020-12-30 15:38:34', '2020-12-30 15:40:32', 4, 840.00, 5, 30, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('e0f83a2c-e70b-4c4c-93c6-a930c51fc6aa', '2020-12-30 15:39:20', '2020-12-30 15:40:35', 4, 840.00, 5, 30, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('e666bb85-605e-4a4d-b16c-34c1f815047b', '2020-12-30 15:41:58', NULL, 4, 1176.00, 5, 42, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('f1c23518-b9e5-4b70-888b-f249fdf55495', '2020-12-30 15:42:04', NULL, 4, 1736.00, 5, 62, '2b181d2c-5916-4cb1-a517-115791f388c0');
INSERT INTO `purchase_order` VALUES ('fa1b01e0-a25e-4338-a41e-f50acb6551eb', '2020-12-30 20:09:16', '2020-12-30 22:05:22', 2, 76.00, 0, 20, '22');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL,
  `remark` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '采购员', 1, '负责去供应商那里采购货物');
INSERT INTO `role` VALUES (2, '仓库管理员', 1, '负责货物的出入库');
INSERT INTO `role` VALUES (3, '系统管理员', 1, '负责整个仓库整体运营状况的控制');
INSERT INTO `role` VALUES (4, '销售员', 0, '卖东西');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rid` int NOT NULL,
  `mid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid_fk`(`rid`) USING BTREE,
  INDEX `mid_fk`(`mid`) USING BTREE,
  CONSTRAINT `mid_fk` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rid_fk` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (2, 1, 1);
INSERT INTO `role_menu` VALUES (3, 1, 7);
INSERT INTO `role_menu` VALUES (4, 2, 2);
INSERT INTO `role_menu` VALUES (5, 2, 8);
INSERT INTO `role_menu` VALUES (6, 2, 9);
INSERT INTO `role_menu` VALUES (9, 2, 4);
INSERT INTO `role_menu` VALUES (10, 2, 17);
INSERT INTO `role_menu` VALUES (11, 2, 18);
INSERT INTO `role_menu` VALUES (12, 3, 1);
INSERT INTO `role_menu` VALUES (13, 3, 2);
INSERT INTO `role_menu` VALUES (14, 3, 3);
INSERT INTO `role_menu` VALUES (15, 3, 4);
INSERT INTO `role_menu` VALUES (16, 3, 5);
INSERT INTO `role_menu` VALUES (18, 3, 7);
INSERT INTO `role_menu` VALUES (19, 3, 8);
INSERT INTO `role_menu` VALUES (20, 3, 9);
INSERT INTO `role_menu` VALUES (22, 3, 11);
INSERT INTO `role_menu` VALUES (25, 3, 14);
INSERT INTO `role_menu` VALUES (26, 3, 15);
INSERT INTO `role_menu` VALUES (27, 3, 17);
INSERT INTO `role_menu` VALUES (28, 3, 18);
INSERT INTO `role_menu` VALUES (29, 3, 19);
INSERT INTO `role_menu` VALUES (30, 3, 20);
INSERT INTO `role_menu` VALUES (31, 3, 21);
INSERT INTO `role_menu` VALUES (32, 3, 22);
INSERT INTO `role_menu` VALUES (33, 2, 24);
INSERT INTO `role_menu` VALUES (34, 2, 25);
INSERT INTO `role_menu` VALUES (35, 3, 24);
INSERT INTO `role_menu` VALUES (36, 3, 25);
INSERT INTO `role_menu` VALUES (37, 3, 26);
INSERT INTO `role_menu` VALUES (38, 2, 26);
INSERT INTO `role_menu` VALUES (39, 1, 19);
INSERT INTO `role_menu` VALUES (40, 1, 20);
INSERT INTO `role_menu` VALUES (41, 1, 22);
INSERT INTO `role_menu` VALUES (42, 2, 23);
INSERT INTO `role_menu` VALUES (43, 3, 23);
INSERT INTO `role_menu` VALUES (44, 3, 13);

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单创建时间',
  `finishtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NOT NULL COMMENT '订单状态，\r\n0：系统管理员检查销售订单后发现问题，拒绝出库申请\r\n1：客户已下单，仓库管理员依次来查看所有需要出库的订单\r\n2：仓库管理员已经提交出库申请，但是系统管理员还未批准\r\n3：系统管理员批准出库申请。\r\n4：客户收货，订单完成',
  `commodityId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID，根据这个字段可以找到该订单的商品的详细信息',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '该笔订单的总价\r\n',
  `customerId` int NOT NULL COMMENT '客户ID，订单出现问题时可以根据这个字段找到客户\r\n',
  `amount` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commodityId_FK`(`commodityId`) USING BTREE,
  INDEX `customerId_FK`(`customerId`) USING BTREE,
  CONSTRAINT `commodityId_FK` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `customerId_FK` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES ('2c21f46f-da89-4939-878a-435690741830', '2020-12-30 16:26:36', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 280.00, 10, 10);
INSERT INTO `sale_order` VALUES ('35d42c1f-907b-49d8-b1ca-5204f4bbed20', '2020-12-30 11:44:19', NULL, 4, '689dc703-9e43-4de9-9601-c6a16819ac9a', 183.60, 3, 102);
INSERT INTO `sale_order` VALUES ('3717f788-abf7-49a7-940b-1b480b14a776', '2020-12-30 16:26:15', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 56.00, 3, 2);
INSERT INTO `sale_order` VALUES ('66ceefb8-31c0-4365-9e5c-501dc556ff33', '2020-12-30 16:30:14', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 364.00, 3, 13);
INSERT INTO `sale_order` VALUES ('68e582fd-f5da-46c6-9978-cbd70e62ee4e', '2020-12-30 16:27:57', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 2800.00, 3, 100);
INSERT INTO `sale_order` VALUES ('74d42d4f-a618-4c8f-84d3-b11e28105aef', '2020-12-30 16:26:50', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 980.00, 3, 35);
INSERT INTO `sale_order` VALUES ('801e6087-ec82-499c-bd88-4a511c1171d4', '2020-12-30 11:18:00', '2020-12-30 11:18:31', 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 1428.00, 3, 51);
INSERT INTO `sale_order` VALUES ('ab4a4f42-d063-4b11-acd2-0de34c389552', '2020-12-30 16:27:10', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 336.00, 3, 12);
INSERT INTO `sale_order` VALUES ('bcce80d9-d78c-4f81-b906-5f5d71bac31e', '2020-12-30 16:27:01', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 616.00, 3, 22);
INSERT INTO `sale_order` VALUES ('d2e846e2-e0f1-4ed7-8cc7-94540f555085', '2020-12-30 16:33:29', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 840.00, 3, 30);
INSERT INTO `sale_order` VALUES ('deb10f68-64f4-45d9-b9e7-0991de23c41a', '2020-12-30 16:27:36', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 28.00, 3, 1);
INSERT INTO `sale_order` VALUES ('fa1effd5-d27e-4eae-961d-5214fd8e643e', '2020-12-30 16:26:26', NULL, 4, '2b181d2c-5916-4cb1-a517-115791f388c0', 84.00, 3, 3);

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commodityId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stockBalance` decimal(10, 0) NOT NULL COMMENT '库存量，表明该商品在仓库中还有多少',
  `status` int NOT NULL COMMENT '库存状态，表明该商品在仓库中是否充足  \r\n0：库存不足，此时应该叫采购员进货\r\n1：库存正常\r\n2：库存积压，采购员要停止采购\r\n',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `commodityId_FK_stores`(`commodityId`) USING BTREE,
  CONSTRAINT `commodityId_FK_stores` FOREIGN KEY (`commodityId`) REFERENCES `commodity` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES ('30faeeb2-a877-4cac-8dbe-e2315f9acab7', '090a0d9e-6ea3-44d5-8c56-13341c3991ad', 100, 1);
INSERT INTO `stores` VALUES ('3416376d-b894-42db-9cb9-560bdfca7ddd', '81ee058a-ff3d-4d2c-a5c6-774f846d3609', 12000, 1);
INSERT INTO `stores` VALUES ('73358aed-ef4e-47f2-975e-e457452e6f14', 'c07fbac8-12b2-401e-9be1-ca2372ab5e43', 200, 1);
INSERT INTO `stores` VALUES ('7e5d6cac-0a8e-4a12-bd93-9d2ac6f1be0f', '2b181d2c-5916-4cb1-a517-115791f388c0', 155, 1);
INSERT INTO `stores` VALUES ('80742851-fb5b-4fd9-b8e9-e563a3912988', '1efd43b9-0b46-4d50-bc68-4a25114a0c23', 221, 1);
INSERT INTO `stores` VALUES ('ad1ab55c-b9e6-4b9d-8788-5817a234f9b9', 'f055efc7-556c-4c3f-8953-37a34da86175', 130, 1);
INSERT INTO `stores` VALUES ('b5c32142-c4ed-48c5-8e17-4088dc6a0f34', '689dc703-9e43-4de9-9601-c6a16819ac9a', 198, 1);
INSERT INTO `stores` VALUES ('b8a156a2-a162-4d2a-9fd6-f52b955ebd2e', '830e2b82-85bf-419c-b82f-6460a27f9a0e', 921, 1);
INSERT INTO `stores` VALUES ('d1dd4d29-620f-4c85-9dd9-33e4542ec635', 'dd6de199-e5ec-4088-89c8-2402dc5c7b4d', 200, 1);
INSERT INTO `stores` VALUES ('e40145fa-1d90-411d-839c-4666ee89628f', '29', 8000, 1);
INSERT INTO `stores` VALUES ('fb58dc1c-8489-43b2-9424-de5286e6e315', '28', 121, 1);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reputation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '伊利', '新疆塔里木盆地', '很好', '13551323103', 1);
INSERT INTO `supplier` VALUES (2, '蒙牛', '内蒙古', '很好', '13551320321', 1);
INSERT INTO `supplier` VALUES (3, '理塘鸿运食品生厂商', '四川理塘县', '很好', '13551320321', 1);
INSERT INTO `supplier` VALUES (4, '茂县养鸡场', '四川茂县', '一般', '85213425', 1);
INSERT INTO `supplier` VALUES (5, '太平琵琶果园', '成都太平镇骑龙村', '很好', '82128123', 1);
INSERT INTO `supplier` VALUES (6, '兴隆草莓基地', '成都兴隆镇火石岩村', '很好', '13546563155', 1);
INSERT INTO `supplier` VALUES (7, '西藏虫草基地', '西藏林芝', '很好', '85454165', 1);
INSERT INTO `supplier` VALUES (8, '湖北龙虾养殖基地', '湖北孝感', '一般', '81245255', 1);
INSERT INTO `supplier` VALUES (9, '重庆火锅城', '重庆解放碑', '很好', '13554643211', 1);
INSERT INTO `supplier` VALUES (10, '东北小米基地', '吉林长春', '很好', '13551326231', 1);
INSERT INTO `supplier` VALUES (11, '四川8424西瓜基地', '四川简阳三岔镇', '好', '13623564122', 1);
INSERT INTO `supplier` VALUES (12, '宁夏口口脆西瓜基地', '宁夏回族自治区', '很好', '13561646115', 1);
INSERT INTO `supplier` VALUES (13, '西藏牦牛肉', '西藏拉萨市', '', '15756485432', 1);
INSERT INTO `supplier` VALUES (14, '简阳汪式羊肉集团', '四川简阳市三岔镇', '', '15756324456', 1);
INSERT INTO `supplier` VALUES (15, '汉源花椒基地', '四川汉源', '很好', '13584612321', 1);
INSERT INTO `supplier` VALUES (16, '广州皮皮虾养殖场', '广东省广州市', '不错', '13856261311', 1);
INSERT INTO `supplier` VALUES (17, '柳州螺蛳粉', '广西柳州', '', '13721661513', 1);
INSERT INTO `supplier` VALUES (18, '汶川车厘子果园', '四川汶川映秀镇', '很好', '13623564122', 1);
INSERT INTO `supplier` VALUES (19, '内江甜橙基地', '四川内江', '很好', '13546563155', 1);
INSERT INTO `supplier` VALUES (20, '太原嘉宏枸杞基地', '山西太原', '很好', '13551320321', 1);
INSERT INTO `supplier` VALUES (21, '', '双流百家镇', '很好', '15645661220', 1);
INSERT INTO `supplier` VALUES (22, '双流乔一乔', '双流东升镇', '很好', '15756485432', 1);
INSERT INTO `supplier` VALUES (23, '', '', '', '', 0);
INSERT INTO `supplier` VALUES (24, '三星云崖兔养殖场', '成都三星镇', '很好', '15756485432', 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `roleId` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleID_FK`(`roleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'zhangsan', '123', 2, 1);
INSERT INTO `users` VALUES (2, 'lisi', '123123', 3, 1);
INSERT INTO `users` VALUES (3, 'wangwu', '123', 2, 1);
INSERT INTO `users` VALUES (4, 'zhaoliu', '123', 3, 1);
INSERT INTO `users` VALUES (11, 'joewin', '123', 2, 1);
INSERT INTO `users` VALUES (12, 'hanjieming', '123', 1, 1);
INSERT INTO `users` VALUES (13, 'admistrator', '123', 3, 1);
INSERT INTO `users` VALUES (14, 'abc123', '123', 1, 0);
INSERT INTO `users` VALUES (15, 'wangermaz', '123', 3, 1);
INSERT INTO `users` VALUES (16, 'xiaoxue', '123', 1, 1);
INSERT INTO `users` VALUES (17, 'liuxiaomei', 'abc123', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
