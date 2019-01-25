SET NAMES UTF8;
DROP DATABASE IF EXISTS jd;
create database jd CHARSET=UTF8;
USE jd;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `addressinfo` varchar(400) DEFAULT NULL,
  `isdefault` varchar(11) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `addressarea` varchar(400) DEFAULT NULL,
  `sname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', '1', 'dsa', '0', '18389379755', '广东深圳罗湖区', '澈澈');
INSERT INTO `address` VALUES ('4', '1', 'vsdscd', '0', '18389379226', '江苏苏州金阊区', 'chacha');
INSERT INTO `address` VALUES ('7', '1', 'dsa', '1', '18308596034', '重庆重庆沙坪坝区', 'picture');
INSERT INTO `address` VALUES ('8', '1', 'csacsacsa', '0', '18389379777', '广西桂林七星区', 'qiuqaaaaa');
INSERT INTO `address` VALUES ('10', '3', 'csaca', '1', '18389379755', '海南海口秀英区', 'huangche');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_pid` int(11) DEFAULT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('3', '100001', '女装');
INSERT INTO `category` VALUES ('4', '100001', '男装');
INSERT INTO `category` VALUES ('5', '100001', '童装');
INSERT INTO `category` VALUES ('6', '100002', '皮鞋');
INSERT INTO `category` VALUES ('7', '100002', '运动鞋');
INSERT INTO `category` VALUES ('8', '100002', '休闲鞋');
INSERT INTO `category` VALUES ('9', '100002', '高帮鞋');
INSERT INTO `category` VALUES ('10', '100002', '帆布鞋');
INSERT INTO `category` VALUES ('11', '100002', '靴子');
INSERT INTO `category` VALUES ('12', '100003', '冰箱');
INSERT INTO `category` VALUES ('13', '100003', '洗衣机');
INSERT INTO `category` VALUES ('14', '100003', '平板电视');
INSERT INTO `category` VALUES ('15', '100003', '空调');
INSERT INTO `category` VALUES ('16', '100003', '烟灶消套装');
INSERT INTO `category` VALUES ('17', '100004', '数码相机');
INSERT INTO `category` VALUES ('18', '100004', '单反相机');
INSERT INTO `category` VALUES ('19', '100004', '摄像机');
INSERT INTO `category` VALUES ('20', '100004', '长焦相机');
INSERT INTO `category` VALUES ('21', '100005', '居家');
INSERT INTO `category` VALUES ('22', '100005', '饰物');
INSERT INTO `category` VALUES ('23', '100005', '玩具');
INSERT INTO `category` VALUES ('24', '100005', '文具');
INSERT INTO `category` VALUES ('25', '100006', '西式糕点');
INSERT INTO `category` VALUES ('26', '100006', '饼干');
INSERT INTO `category` VALUES ('27', '100006', '肌肉类零食');
INSERT INTO `category` VALUES ('28', '100006', '糖果');
INSERT INTO `category` VALUES ('29', '100007', '拉杠箱');
INSERT INTO `category` VALUES ('30', '100007', '登机箱');
INSERT INTO `category` VALUES ('31', '100007', '旅行包');
INSERT INTO `category` VALUES ('32', '100007', '双肩包');
INSERT INTO `category` VALUES ('33', '100007', '托运箱');
INSERT INTO `category` VALUES ('34', '100004', '手机');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collect_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `goods_cart`
-- ----------------------------
DROP TABLE IF EXISTS `goods_cart`;
CREATE TABLE `goods_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `goods_num` int(11) DEFAULT NULL,
  `created` varchar(200) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goods_cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `goods_cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_cart
-- ----------------------------
INSERT INTO `goods_cart` VALUES ('11', '1', '11', '1', '2016-04-04 02:34:14', null);
INSERT INTO `goods_cart` VALUES ('12', '3', '107', '1', '2016-04-11 11:53:21', null);
INSERT INTO `goods_cart` VALUES ('14', '3', '12', '1', '2016-04-11 11:53:57', null);
INSERT INTO `goods_cart` VALUES ('15', '3', '154', '1', '2016-04-11 13:52:06', null);

-- ----------------------------
-- Table structure for `lhg_city`
-- ----------------------------
DROP TABLE IF EXISTS `lhg_city`;
CREATE TABLE `lhg_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `fename` varchar(2) NOT NULL DEFAULT '',
  `ename` varchar(40) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` int(3) NOT NULL DEFAULT '0',
  `region` int(11) NOT NULL COMMENT '1是(北部沿海)2是(东部沿海)3是(南部沿海)4是(西部沿海)5是(中部内陆)',
  `map_x` varchar(50) NOT NULL DEFAULT '',
  `map_y` varchar(50) NOT NULL DEFAULT '',
  `map_z` varchar(5) NOT NULL DEFAULT '',
  `orders` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `city_area` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `name` (`name`),
  KEY `ename` (`ename`),
  KEY `pid` (`pid`),
  KEY `orders` (`orders`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lhg_city
-- ----------------------------


-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `ocount` int(11) DEFAULT NULL,
  `total_price` decimal(8,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `stauts` int(11) DEFAULT NULL,
  `flag` varchar(11) DEFAULT NULL,
  `buid_time` varchar(200) DEFAULT NULL,
  `orderno` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  KEY `address_id` (`address_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`cart_id`) REFERENCES `goods_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_price` decimal(8,2) DEFAULT NULL,
  `product_img_url` varchar(400) DEFAULT NULL,
  `product_uprice` decimal(8,2) DEFAULT NULL,
  `product_num` varchar(100) DEFAULT NULL,
  `product_detail` text,
  `product_comment_num` int(8) DEFAULT NULL,
  `product_hot` int(11) DEFAULT NULL,
  `product_special` int(11) DEFAULT NULL,
  `product_search_hot` int(8) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('3', '3', '1', '素缕2015冬装新款文艺百搭羊毛毛呢外套女九分袖短款SL546031栐', '379.00', 'https://gd1.alicdn.com/bao/uploaded/i1/2254228937/TB2pqExhpXXXXXkXXXXXXXXXXXX_!!2254228937.jpg', '329.00', '100', '素缕 2015冬装新款文艺百搭羊毛毛呢外套女九分袖短款SL546031栐 面料自然肌理 精致小短款 微喇设计 优雅易搭配', '51', '1', '0', '0');
INSERT INTO `product` VALUES ('4', '3', '2', 'S家原创设计欧洲站女装街头风斗篷立领个性短款棉衣a字蓬蓬棉服女', '596.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB100kJKFXXXXbIXVXXXXXXXXXX_!!0-item_pic.jpg', '298.00', '100', '品牌: sibyl of no.17\n 货号: C1510074\n 服装版型: 斗篷型\n 厚薄: 常规\n 风格: 街头\n 街头: 欧美\n 衣长: 短款\n 袖长: 长袖\n 领子: 立领\n 袖型: 其他\n 衣门襟: 单排扣\n 图案: 形状\n 面料材质: 其他\n 成分含量: 91%(含)-95%(含)\n 填充物: 其他\n 适用年龄: 25-29周岁\n 年份/季节: 2015年冬季\n 颜色分类: 白色 黑色\n 尺码: S M L\n', '503', '1', '0', '1');
INSERT INTO `product` VALUES ('5', '3', '3', '七七之缘2015秋冬新款女装韩版 黑色v领蕾丝修身显瘦背带裙连衣裙', '358.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1xmimJFXXXXXJXpXXXXXXXXXX_!!0-item_pic.jpg', '148.00', '100', '廓形: A型\n 材质成分: 棉65% 聚酰胺纤维(锦纶)30% 聚氨酯弹性纤维(氨纶)5%\n 销售渠道类型: 纯电商(只在线上销售)\n 货号: QA5Q125\n 风格: 通勤\n 通勤: 韩版\n 组合形式: 单件\n 裙长: 短裙\n 款式: 背带\n 袖长: 无袖\n 领型: V领\n 袖型: 常规\n 腰型: 高腰\n 衣门襟: 拉链\n 裙型: A字裙\n 图案: 纯色\n 流行元素/工艺: 抽褶 褶皱 拼接 拉链 蕾丝\n 品牌: 七七之缘\n 面料: 其他\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 黑色\n 尺码: XL L M S\n', '317', '1', '1', '0');
INSERT INTO `product` VALUES ('6', '3', '3', '七七之缘诗钎姿锦女装2015秋冬新款代购旗舰店高斯雪岚羽绒服', '722.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1VKOcKXXXXXXZXXXXXXXXXXXX_!!0-item_pic.jpg', '685.90', '100', '充绒量: 150g(含)-200g(不含)\n 含绒量: 90%\n 品牌: 稻草朵\n 货号: 105478\n 服装版型: 修身\n 厚薄: 常规\n 风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 领子: 连帽\n 袖型: 常规\n 衣门襟: 拉链\n 图案: 花色\n 流行元素/工艺: 带毛领 口袋\n 主材质含量: 96%及以上\n 材质: 聚酯纤维\n 填充物: 白鸭绒\n 适用年龄: 25-29周岁\n 上市年份季节: 2015年冬季\n 颜色分类: 黑色\n 尺码: S M L XL 2XL\n 面料: 尼丝纺\n', '1', '1', '0', '1');
INSERT INTO `product` VALUES ('7', '3', '4', '2015冬季新款韩版羽绒服女中长款加厚修身大毛领棉衣女装外套潮', '388.00', 'http://gd3.alicdn.com/bao/uploaded/i3/TB1Xjs9JpXXXXXVXFXXXXXXXXXX_!!0-item_pic.jpg', '280.00', '100', '品牌: other/其他\n 货号: XY8806\n 服装版型: 修身\n 厚薄: 加厚\n 风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 领子: 连帽\n 袖型: 常规\n 衣门襟: 拉链\n 图案: 纯色\n 主材质含量: 51%(含)-70%(含)\n 材质: 棉\n 填充物: 其他\n 适用年龄: 18-24周岁\n 上市年份季节: 2015年冬季\n 颜色分类: 灰色 黑色 粉红色 绿色\n 尺码: M L XL 2XL\n', '217', '0', '0', '0');
INSERT INTO `product` VALUES ('8', '3', '5', '2015冬装淑女衣坊女装韩版蘑菇街韩范羊绒尼子大衣中长款毛呢外套', '516.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1WRi9GpXXXXagaXXXXXXXXXXX_!!0-item_pic.jpg', '258.00', '100', '风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 领子: 西装领\n 袖型: 常规\n 衣门襟: 拉链\n 图案: 纯色\n 面料材质: 羊毛\n 面料主材质含量: 31%(含)-50%(含)\n 里料图案: 纯色\n 里料材质: 涤纶\n 上市年份季节: 2015年冬季\n 颜色分类: 草绿色 水蓝色 红色 黄色 藏青色\n 尺码: XXL M L XL\n', '185', '0', '1', '0');
INSERT INTO `product` VALUES ('9', '3', '5', '韩舍艳2015新款棉质修身格子衬衫秋冬款女装上衣翻领长袖休闲外套', '398.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1nOOcHXXXXXaBXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '68.00', '100', '材质成分: 棉96% 其他4%\n 销售渠道类型: 纯电商(只在线上销售)\n 货号: 8868\n 服装版型: 修身\n 风格: 通勤\n 通勤: 韩版\n 衣长: 常规款\n 袖长: 长袖\n 袖型: 常规\n 领型: 方领\n 衣门襟: 单排多扣\n 图案: 格子\n 服装款式细节: 口袋\n 品牌: 韩舍艳\n 适用年龄: 18-24周岁\n 年份季节: 2015年秋季\n 颜色分类: 886809 886808 886807 886806 886804 886803 886801 886802 886810 886805\n 尺码: XXXL XXL XL L M\n', '224', '0', '0', '0');
INSERT INTO `product` VALUES ('10', '3', '5', '韩舍艳 秋季外套2014女新款韩版学生套装中腰牛仔裤长袖卫衣裤子', '498.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1Y_LMFVXXXXXfXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '218.00', '100', '品牌: 韩舍艳\n 货号: 10034\n 颜色分类: 黄色 卡其 蓝色 粉红 灰色\n 尺码: XXL XL S M L\n 上市年份季节: 2015年春季\n', '54', '0', '0', '1');
INSERT INTO `product` VALUES ('11', '3', '6', '卫衣女中长款粉红大布娃娃预2015秋冬女加厚修身连帽卫衣休闲上衣', '210.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1IBrkKpXXXXb.aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '155.00', '100', '内胆类型: 毛内胆\n 材质成分: 棉72.6% 聚酯纤维27.4%\n 销售渠道类型: 纯电商(只在线上销售)\n 货号: D13ASW098\n 服装版型: 修身\n 厚薄: 常规\n 风格: 通勤\n 通勤: 韩版\n 款式: 开衫\n 组合形式: 单件\n 衣长: 中长款\n 袖长: 长袖\n 领子: 连帽\n 袖型: 泡泡袖\n 品牌: 粉红大布娃娃\n 衣门襟: 拉链\n 图案: 纯色\n 服装款式细节: 拉链\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 黑色（现货） 宝蓝色（3月22日发货） 草绿色（现货） 亮紫色（3月22日发货） 玫紫色（现货） 橘红色（现货） 紫色（3月22日发货） 天蓝色（3月22日发货） 水蓝色（现货）\n 尺码: L M S XL\n', '426', '0', '0', '0');
INSERT INTO `product` VALUES ('12', '3', '6', '秋冬打底连衣裙粉红大布娃娃2015新女装加厚显瘦修身长袖连衣裙', '798.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1hOzLKpXXXXcdXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '399.00', '100', '廓形: A型\n 材质成分: 聚酯纤维100%\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: D15CDR105\n 风格: 通勤\n 通勤: 淑女\n 组合形式: 单件\n 裙长: 短裙\n 款式: 其他/other\n 袖长: 九分袖\n 领型: 其他\n 袖型: 泡泡袖\n 腰型: 中腰\n 衣门襟: 套头\n 裙型: 百褶裙\n 图案: 纯色\n 流行元素/工艺: 蝴蝶结\n 品牌: 粉红大布娃娃\n 面料: 其他\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 枣红色\n 尺码: XXL XL L M S\n', '113', '0', '1', '1');
INSERT INTO `product` VALUES ('13', '3', '6', '春装连衣裙粉红大布娃娃2016新款拼接女装ol气质职业裙包臀连衣裙', '878.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1c5qPLXXXXXcXXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '439.00', '100', '材质成分: 聚酯纤维100%\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: D16ADR081\n 风格: 通勤\n 通勤: 淑女\n 组合形式: 单件\n 裙长: 短裙\n 款式: 其他/other\n 袖长: 九分袖\n 领型: 立领\n 袖型: 泡泡袖\n 腰型: 高腰\n 衣门襟: 套头\n 裙型: 其他\n 图案: 纯色\n 流行元素/工艺: 纱网\n 品牌: 粉红大布娃娃\n 适用年龄: 25-29周岁\n 年份季节: 2016年春季\n 颜色分类: 黑白色拼色\n 尺码: XXL XL L M S XS\n', '19', '0', '0', '1');
INSERT INTO `product` VALUES ('14', '3', '6', '连体裤女长裤粉红大布娃娃2016春季新款女装ol条纹直筒连体裤', '798.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1sc95LXXXXXaaXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '399.00', '100', '材质成分: 聚酰胺纤维(锦纶)84.2% 聚氨酯弹性纤维(氨纶)13.7% 聚酯纤维2.1%\n 裤长: 长裤\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: D16AJP004\n 女裤裤型: 直筒裤\n 女裤腰高: 高腰\n 面料: 其他\n 风格: 通勤\n 通勤: 淑女\n 颜色分类: 藏蓝色条格\n 品牌: 粉红大布娃娃\n 尺寸: XXL XL L M S XS\n 成分含量: 81%(含)-90%(含)\n 服装款式细节: 纽扣\n 厚薄: 常规\n 年份季节: 2016年春季\n', '36', '0', '1', '0');
INSERT INTO `product` VALUES ('15', '3', '6', '衬衫女秋粉红大布娃娃2015秋装潮女装韩版显瘦气质雪纺长袖衬衫女', '538.00', 'https://img.alicdn.com/bao/uploaded/i2/TB17bDBKpXXXXX.XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '269.00', '100', '材质成分: 聚酯纤维100%\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: D15CST024\n 服装版型: 直筒\n 风格: 通勤\n 通勤: 淑女\n 衣长: 常规款\n 袖长: 长袖\n 袖型: 泡泡袖\n 领型: 其他\n 衣门襟: 单排多扣\n 图案: 纯色\n 服装款式细节: 蕾丝\n 品牌: 粉红大布娃娃\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 杏色\n 尺码: S L M XXL XL\n', '19', '0', '0', '1');
INSERT INTO `product` VALUES ('16', '3', '6', '粉红大布娃娃2015秋冬新镶拼亮片蝴蝶结修身蓬蓬裙摆收腰连衣裙', '658.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1F_Z.KFXXXXawXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '329.00', '100', '材质成分: 粘胶纤维(粘纤)66.8% 聚酰胺纤维(锦纶)29% 聚氨酯弹性纤维(氨纶)4.2%\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: D15DDR060\n 风格: 通勤\n 通勤: 淑女\n 组合形式: 单件\n 裙长: 短裙\n 款式: 其他/other\n 袖长: 长袖\n 领型: 娃娃领\n 袖型: 其他\n 腰型: 中腰\n 衣门襟: 套头\n 裙型: 其他\n 图案: 纯色\n 流行元素/工艺: 蝴蝶结\n 品牌: 粉红大布娃娃\n 面料: 其他\n 适用年龄: 25-29周岁\n 年份季节: 2015年冬季\n 颜色分类: 酒红色\n 尺码: XXL XL L M S XS\n', '36', '0', '0', '1');
INSERT INTO `product` VALUES ('17', '3', '6', '套头卫衣女粉红大布娃娃2016春装新款韩版显瘦潮印花宽松卫衣女', '478.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1NlsyKVXXXXaqXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '239.00', '100', '材质成分: 聚酯纤维72.2% 粘胶纤维(粘纤)15.8% 聚氨酯弹性纤维(氨纶)12%\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: D16ASW001\n 服装版型: 直筒\n 厚薄: 常规\n 风格: 通勤\n 通勤: 淑女\n 款式: 套头\n 组合形式: 单件\n 衣长: 常规\n 袖长: 九分袖\n 领子: 圆领\n 袖型: 常规\n 品牌: 粉红大布娃娃\n 图案: 纯色\n 服装款式细节: 印花\n 适用年龄: 25-29周岁\n 年份季节: 2016年春季\n 颜色分类: 本白色印花\n 尺码: XXL XL L M S XS\n', '32', '0', '0', '1');
INSERT INTO `product` VALUES ('18', '3', '7', '韩版夏装秋冬毛呢外套淘宝网京东商城天猫唯品会品牌特卖女装大衣', '268.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1.CDlJFXXXXamXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '138.00', '100', '服装版型: 修身\n 风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 领子: 西装领\n 袖型: 常规\n 衣门襟: 一粒扣\n 图案: 纯色\n 流行元素/工艺: 口袋 拼接 纽扣\n 面料: 法兰绒\n 面料材质: 聚酯\n 面料主材质含量: 91%(含)-95%(不含)\n 里料图案: 纯色\n 里料材质: 锦纶\n 适用年龄: 25-29周岁\n 上市年份季节: 2015年秋季\n 颜色分类: 灰色 红色 蓝色 紫色\n 尺码: S M L XL\n', '5', '0', '0', '0');
INSERT INTO `product` VALUES ('19', '3', '8', '歌慕妮2016春装新款女装韩版潮流百搭波浪拼色条纹打底针织衫毛衣', '188.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1AImnLXXXXXbWXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '79.00', '100', '材质成分: 其他100%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 货号: 2015122090\n 品牌: 歌慕妮\n 服装版型: 直筒\n 厚薄: 常规款\n 款式: 套头\n 组合形式: 单件\n 衣长: 常规款\n 袖长: 长袖\n 领子: 圆领\n 袖型: 常规\n 图案: 条纹\n 服装款式细节: 印花\n 功能性: 保暖发热\n 毛线粗细: 常规毛线\n 适用年龄: 18-24周岁\n 年份/季节: 2016年春季\n 颜色分类: 灰色 黑色 藏青\n 尺码: L M S\n', '43', '0', '1', '0');
INSERT INTO `product` VALUES ('20', '3', '8', '歌慕妮2015秋冬新款韩版宽松纯色灯笼袖V领针织打底衫女毛衣上衣', '246.00', 'https://img.alicdn.com/imgextra/i4/1734524150/TB20mk0hVXXXXctXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg', '89.00', '100', '材质成分: 其他100%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 货号: 2015128006\n 品牌: 歌慕妮\n 服装版型: 直筒\n 厚薄: 常规款\n 款式: 套头\n 组合形式: 单件\n 衣长: 常规款\n 袖长: 长袖\n 领子: V领\n 袖型: 灯笼袖\n 图案: 纯色\n 功能性: 保暖发热\n 毛线粗细: 常规毛线\n 适用年龄: 18-24周岁\n 年份/季节: 2015年冬季\n 颜色分类: 咖色 粉色 黑色 灰色\n 尺码: L M S\n', '605', '0', '1', '1');
INSERT INTO `product` VALUES ('21', '3', '8', '歌慕妮2015年冬季新款韩版毛衣女装宽松中长款休闲蕾丝拼接针织衫', '226.00', 'https://img.alicdn.com/bao/uploaded/i3/TB14Nx5KVXXXXagXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '118.00', '100', '材质成分: 其他100%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 货号: 2015129101\n 品牌: 歌慕妮\n 服装版型: 直筒\n 厚薄: 常规款\n 款式: 套头\n 组合形式: 单件\n 衣长: 中长款\n 袖长: 长袖\n 领子: 圆领\n 袖型: 常规\n 图案: 圆点\n 服装款式细节: 蕾丝边\n 功能性: 保暖发热\n 毛线粗细: 常规毛线\n 适用年龄: 18-24周岁\n 年份/季节: 2015年冬季\n 颜色分类: 酒红 灰色 黑色 咖啡色\n 尺码: L M S\n', '71', '0', '0', '0');
INSERT INTO `product` VALUES ('22', '3', '8', '歌慕妮2016春装新款女装韩版百搭中长款拼色下摆开叉针织打底毛衣', '206.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1YZGXLXXXXXaDXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '108.00', '100', '材质成分: 其他100%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 货号: 2015122676\n 品牌: 歌慕妮\n 服装版型: 直筒\n 厚薄: 常规款\n 款式: 套头\n 组合形式: 单件\n 衣长: 中长款\n 袖长: 长袖\n 领子: 半高领\n 袖型: 常规\n 图案: 纯色\n 服装款式细节: 印花\n 功能性: 保暖发热\n 毛线粗细: 常规毛线\n 适用年龄: 18-24周岁\n 年份/季节: 2016年春季\n 颜色分类: 酒红 黑色 灰色\n 尺码: L M S\n', '44', '0', '0', '1');
INSERT INTO `product` VALUES ('23', '3', '8', '歌慕妮2015年新款韩版毛衣女装宽松圆领中长款休闲显瘦针织衫外套', '226.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1LExAKVXXXXaHaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '118.00', '100', '材质成分: 其他100%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 货号: 2015129102\n 品牌: 歌慕妮\n 服装版型: 直筒\n 厚薄: 常规款\n 款式: 套头\n 组合形式: 单件\n 衣长: 中长款\n 袖长: 长袖\n 领子: 圆领\n 袖型: 常规\n 图案: 形状\n 服装款式细节: 纱网\n 功能性: 保暖发热\n 毛线粗细: 常规毛线\n 适用年龄: 18-24周岁\n 年份/季节: 2015年冬季\n 颜色分类: 黑色 灰色 酒红\n 尺码: L M S\n', '47', '0', '1', '1');
INSERT INTO `product` VALUES ('24', '3', '8', '歌慕妮秋季女韩版直筒上衣纯色流苏下摆上衣针织套头打底长袖潮', '188.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1QawyJFXXXXbmXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '99.00', '100', '材质成分: 其他100%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 货号: 2015097333\n 品牌: 歌慕妮\n 服装版型: 直筒\n 厚薄: 常规款\n 款式: 套头\n 组合形式: 单件\n 衣长: 常规款\n 袖长: 长袖\n 领子: 圆领\n 袖型: 常规\n 图案: 纯色\n 服装款式细节: 流苏\n 适用年龄: 18-24周岁\n 年份/季节: 2015年秋季\n 颜色分类: 灰色 藏青\n 尺码: L M S\n', '219', '0', '1', '0');
INSERT INTO `product` VALUES ('25', '3', '9', '阿姐家 qlz情侣装冬装2015新款韩版拼接中长款呢子大衣女毛呢外套', '265.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1WlnNKFXXXXaLaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '265.00', '100', '品牌: 阿姐家\n 货号: 独家定制HGK\n 服装版型: 修身\n 风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 领子: 半开领\n 袖型: 包袖\n 衣门襟: 一粒扣\n 流行元素/工艺: 口袋 拼接 螺纹 立体装饰 纽扣 3D\n 面料: 仿呢料\n 面料材质: 其他\n 面料主材质含量: 81%(含)-90%(含)\n 里料图案: 纯色\n 里料材质: 棉\n 适用年龄: 18-24周岁\n 上市年份季节: 2015年冬季\n 颜色分类: 如图\n 尺码: 女M 女L 女XL 男M 男L 男XL\n', '77', '0', '1', '0');
INSERT INTO `product` VALUES ('26', '3', '9', '◤CHEN MENG LI 阿姐家◥ 灰色羊羔毛领皮外套 ', '78.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1BcrEKpXXXXahXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '78.00', '100', '货号: 01\n 服装版型: 直筒\n 厚薄: 常规\n 风格: 街头\n 街头: 欧美\n 衣长: 短款\n 袖长: 长袖\n 袖型: 常规\n 衣门襟: 其他\n 图案: 纯色\n 面料材质: 羊毛\n 成分含量: 31%(含)-50%(含)\n 填充物: 棉71%-80%\n 适用年龄: 18-24周岁\n 年份/季节: 2015年冬季\n 颜色分类: 黑色\n 尺码: S M\n', '0', '0', '0', '0');
INSERT INTO `product` VALUES ('27', '3', '9', '阿姐家 学院风高领麻花毛衣', '135.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1jWL0LXXXXXbjXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '120.00', '100', '面料: 其他\n 面料主材质含量: 81%(含)-90%(含)\n 年份/季节: 2015年冬季\n 颜色分类: 米白色 藏青色\n 尺码: 女M 女L 女XL 男M 男L 男XL\n', '5', '0', '0', '1');
INSERT INTO `product` VALUES ('28', '3', '9', '阿姐家 独家自制 卡通人像太空棉情侣装', '105.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1kMseIVXXXXX2apXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '105.00', '100', '货号: 自制款秋4\n 服装版型: 宽松\n 厚薄: 常规\n 风格: 通勤\n 通勤: 英伦\n 款式: 套头\n 组合形式: 单件\n 衣长: 常规\n 袖长: 长袖\n 领子: 圆领\n 袖型: 包袖\n 品牌: 阿姐家\n 图案: 卡通动漫\n 服装款式细节: 印花 拼接 不对称 植绒 做旧 3D\n 适用年龄: 18-24周岁\n 年份季节: 2015年秋季\n 颜色分类: 白色\n 尺码: 女M 女L 女XL 男M 男L 男XL \n', '0', '0', '0', '0');
INSERT INTO `product` VALUES ('29', '3', '10', 'e尚小站 2015新款夏装女装 韩版职业衬衫OL女士衬衣时尚短袖衬衫', '158.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1ZxsjGVXXXXa1XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '59.00', '100', '货号: B23D\n 服装版型: 修身\n 风格: 百搭\n 衣长: 中长款\n 袖长: 短袖\n 袖型: 常规\n 领型: POLO领\n 衣门襟: 单排多扣\n 图案: 纯色\n 品牌: E尚小站\n 成分含量: 51%(含)-70%(含)\n 质地: 棉\n 年份季节: 2015年夏季\n 颜色分类: 浅蓝色 浅粉色\n 尺码: S M L XXL XL XXXL\n', '3', '0', '0', '1');
INSERT INTO `product` VALUES ('30', '3', '10', '2015韩版新款秋冬保暖衬衫加绒加厚中长款修身长袖大码女装白衬衣', '198.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1pO7DJFXXXXbbXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '89.00', '100', '材质成分: 棉61.6% 聚酯纤维38.4%\n 销售渠道类型: 纯电商(只在线上销售)\n 货号: T1553\n 服装版型: 修身\n 风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 袖型: 常规\n 领型: 方领\n 衣门襟: 单排多扣\n 图案: 纯色\n 服装款式细节: 拼接 口袋 纽扣 燕尾\n 品牌: E尚小站\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 白色 浅蓝（加绒） 白色（加绒） 浅蓝（常规） 白色（常规）\n 尺码: 3XL 2XL XL L M S\n', '31', '0', '1', '1');
INSERT INTO `product` VALUES ('31', '3', '10', '2015秋季新款韩版格子长袖衬衫百搭修身显瘦女士衬衣棉女装衬衫潮', '182.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1I64GHXXXXXc_XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '货号: T1469C\n 服装版型: 修身\n 风格: 百搭\n 衣长: 中长款\n 袖长: 长袖\n 袖型: 常规\n 领型: 方领\n 衣门襟: 单排多扣\n 图案: 格子\n 服装款式细节: 拼接 口袋 纽扣\n 品牌: E尚小站\n 成分含量: 96%及以上\n 质地: 其他\n 适用年龄: 25-29周岁\n 年份季节: 2015年春季\n 颜色分类: 格子衫\n 尺码: M L XXL XL\n', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('32', '3', '10', '2015秋冬新款韩版毛衣开衫上衣中长款修身长袖针织衫秋季女装外套', '198.00', 'https://img.alicdn.com/bao/uploaded/i3/TB136XAJFXXXXXCXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '119.00', '100', '材质成分: 聚酯纤维65% 棉35%\n 销售渠道类型: 纯电商(只在线上销售)\n 品牌: E尚小站\n 服装版型: 修身\n 货号: TD826\n 厚薄: 常规\n 风格: 通勤\n 通勤: 韩版\n 款式: 开衫\n 组合形式: 单件\n 衣长: 中长款\n 袖长: 长袖\n 领子: 低圆领\n 袖型: 常规\n 衣门襟: 单排扣\n 图案: 纯色\n 流行元素/工艺: 肩章 拼接 纽扣\n 适用年龄: 25-29周岁\n 上市年份/季节: 2015年秋季\n 颜色分类: 深蓝 米白 玫红 酒红 粉红\n 尺码: 4XL 3XL 2XL XL L M\n', '34', '0', '0', '0');
INSERT INTO `product` VALUES ('33', '3', '10', '2015秋季新品韩版女装衬衫女长袖蝴蝶结雪纺衬衫大码职业打底衫潮', '258.00', 'https://img.alicdn.com/bao/uploaded/i4/T1c.LlFqVbXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '袖长: 长袖\n 品牌: E尚小站\n 货号: B17C\n 服装版型: 修身\n 风格: 通勤\n 通勤: 韩版\n 穿着方式: 开衫\n 组合形式: 单件\n 衣长: 常规款\n 领型: 荷叶领\n 袖型: 常规\n 图案: 纯色\n 服装款式细节: 蝴蝶结 荷叶边 拼接 纽扣\n 适用年龄: 25-29周岁\n 年份季节: 2015年春季\n 颜色分类: 黑色 卡其色 酒红色 紫色 白色\n 尺码: S M L XXL XL XXXL\n', '52', '0', '1', '0');
INSERT INTO `product` VALUES ('66', '3', '10', '2015秋季新品韩版衬衫女长袖修身显瘦拼色雪纺衫打底衫大码女装潮', '298.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1dpL6HXXXXXc1XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '袖长: 长袖 品牌: E尚小站 货号: LMF2061 服装版型: 修身 风格: 百搭 穿着方式: 开衫 组合形式: 单件 衣长: 短款 领型: POLO领 袖型: 常规 图案: 其他 服装款式细节: 拼接 适用年龄: 25-29周岁 年份季节: 2015年春季 颜色分类: 黑拼蓝色 黑拼红色 尺码: S M L XXL XL XXXL ', '162', '0', '1', '0');
INSERT INTO `product` VALUES ('68', '3', '10', '2015新品夏装韩版薄款雪纺衫女短袖宽松印花女装中长大码夏季衬衫', '186.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1fRrmHpXXXXbfXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '\n        袖长: 五分袖\n	 品牌: E尚小站\n	 货号: B1218D\n	 服装版型: 宽松\n	 风格: 通勤\n	 通勤: 民族风\n	 穿着方式: 开衫\n	 组合形式: 单件\n	 衣长: 中长款\n	 领型: POLO领\n	 袖型: 堆堆袖\n	 图案: 花色\n	 服装款式细节: 印花 不对称\n	 年份季节: 2015年夏季\n	 颜色分类: 粉色 白色\n	 尺码: S（雪纺面料） M（舒适透气） L\n        ', '134', '0', '0', '1');
INSERT INTO `product` VALUES ('69', '3', '11', '小西装女外套秋天2015新款女装韩版中长款长袖气质修身休闲西服夏', '218.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1EfZeJpXXXXX_aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '89.00', '100', '\n        材质成分: 聚酯纤维92% 聚氨酯弹性纤维(氨纶)8%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 服装版型: 修身\n 品牌: 黛蜜妃\n 货号: dmf1543\n 衣长: 中长款\n 袖长: 长袖\n 领子: 圆领\n 袖型: 耸肩\n 衣门襟: 一粒扣\n 图案: 纯色\n 服装款式细节: 口袋 纽扣 拼接\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 宝蓝色 绿色 酒红色 棕黄色\n 尺码: XL L M S\n        ', '337', '0', '0', '1');
INSERT INTO `product` VALUES ('70', '3', '11', '小西装女外套2015新款春秋女装中长款韩版修身长袖女士休闲西服潮', '216.00', 'https://img.alicdn.com/bao/uploaded/i1/TB111s6HFXXXXapaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '\n       材质成分: 聚酯纤维95.7% 聚氨酯弹性纤维(氨纶)4.3%\n 销售渠道类型: 纯电商(只在线上销售)\n 风格: 通勤\n 服装版型: 修身\n 品牌: 黛蜜妃\n 货号: dmf0008\n 衣长: 中长款\n 袖长: 长袖\n 领子: V领\n 袖型: 常规\n 衣门襟: 一粒扣\n 图案: 纯色\n 服装款式细节: 口袋 纽扣 3D\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 黄色 蓝色 果绿色 紫色 白色 玫红色\n 尺码: XL L M S\n        ', '29', '0', '0', '1');
INSERT INTO `product` VALUES ('71', '3', '11', '秋季连衣裙lyq修身中长款长袖时尚 2015秋装新款冬季加厚A字秋裙', '216.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1gBWrHFXXXXXxaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '89.00', '100', '\n      廓形: A型\n 材质成分: 聚酯纤维69% 羊毛31%\n 销售渠道类型: 纯电商(只在线上销售)\n 货号: dmf1515.\n 风格: 通勤\n 通勤: 韩版\n 组合形式: 单件\n 裙长: 中长裙\n 款式: 其他/other\n 袖长: 长袖\n 领型: 圆领\n 袖型: 常规\n 腰型: 中腰\n 衣门襟: 套头\n 裙型: A字裙\n 图案: 花色\n 流行元素/工艺: 拉链 印花\n 品牌: 黛蜜妃\n 面料: 毛呢\n 适用年龄: 25-29周岁\n 年份季节: 2015年秋季\n 颜色分类: 橘色\n 尺码: XXL XL L M S\n        ', '20', '0', '0', '0');
INSERT INTO `product` VALUES ('72', '3', '11', '毛呢外套女中长款秋冬装2015新款妮子韩版加厚中款呢子羊绒大衣潮', '516.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1UZ6AKXXXXXbFXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '259.00', '100', '\n 材质成分: 聚酯纤维67.7% 羊毛32.3%\n 销售渠道类型: 纯电商(只在线上销售)\n 品牌: 黛蜜妃\n 货号: dmf0027.\n 服装版型: 修身\n 风格: 通勤\n 通勤: 韩版\n 衣长: 中长款\n 袖长: 长袖\n 领子: 西装领\n 袖型: 常规\n 衣门襟: 双排扣\n 图案: 纯色\n 流行元素/工艺: 口袋 系带 纽扣\n 面料: 粗花呢\n 里料图案: 纯色\n 里料材质: 涤纶\n 适用年龄: 25-29周岁\n 上市年份季节: 2015年冬季\n 颜色分类: 藏蓝色 酒红色\n 尺码: XXL XL L M\n        ', '20', '0', '1', '1');
INSERT INTO `product` VALUES ('73', '4', '74', '柒名龙牌意树2015秋季学生休闲金利班尼来路旗舰店特贝凡西T恤男', '130.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1_1SPIpXXXXXxXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '130.00', '100', '\n 款式: 套头\n 货号: WY2206\n 版型: 宽松\n 领型: 圆领\n 颜色: 白色\n 尺码: M L XL\n 面料分类: 涤棉\n 袖型: 常规\n 品牌: Jeomantry/乔曼姿\n 图案: 创意\n 适用季节: 秋季\n 适用场景: 休闲\n 适用对象: 青年\n 厚薄: 常规\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('74', '4', '74', '意树VUUG简雷2015夏季装光头杰洛巴伦旗舰店嘎嘎诺布男士短袖T恤', '104.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1dV27HpXXXXbsXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '104.00', '100', '\n 印花主题: 创意趣味\n 厚薄: 薄\n 品牌类型: 国内非知名品牌\n 袖长: 短袖\n 货号: 短袖印花T恤\n 领型: 圆领\n 颜色: 白色 黑色\n 尺码: 170/90(M) 175/95(L) 180/100(XL) 185/105(XXL)\n 面料分类: 棉毛布\n 款式细节: 印花\n 服饰工艺: 吊染\n 品牌: Other 其他\n 袖型: 常规\n 花型图案: 字母数字\n 版型: 修身\n 材质: 棉\n 棉含量: 95%以上\n 适用季节: 夏季\n 适用场景: 旅游\n 适用对象: 青少年\n 基础风格: 时尚都市\n 细分风格: 日系复古\n        ', '0', '0', '1', '1');
INSERT INTO `product` VALUES ('75', '4', '74', '柒名龙牌意树2015秋季学生休闲圣希依拾贰梵旗舰店衣品天成T恤男', '118.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB13QS4IpXXXXbAXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '118.00', '100', '\n 厚薄: 常规\n 袖长: 长袖\n 货号: T2204\n 领型: 圆领\n 颜色: 乳白色 黑色\n 尺码: M L XL\n 款式细节: 印花\n 服饰工艺: 免烫处理\n 品牌: Jeomantry/乔曼姿\n 袖型: 常规\n 花型图案: 大满花\n 版型: 宽松\n 适用季节: 秋季\n 上市时间: 2015年\n 适用场景: 日常\n 适用对象: 青年\n 基础风格: 青春流行\n 细分风格: 日系复古\n        ', '0', '0', '0', '0');
INSERT INTO `product` VALUES ('76', '4', '75', '秋冬季男士长袖格子修身保暖衬衫加绒加厚韩版潮男装花衬衣', '368.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1M8v3KpXXXXaKXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '39.50', '100', '\n 工艺/流行 细分风格：小清新\n 图案：碎花\n 服饰工艺：免烫处理\n \n关键信息 上市年份季节：2015年秋季\n 厚薄：加绒加厚\n 材质成分：聚对苯二甲酸乙二酯(涤纶)100%\n 货号：8系列保暖\n 销售渠道类型：纯电商(只在线上销售)\n 品牌：南极甲\n 基础风格：青春流行\n \n版型款式 袖长：长袖\n 版型：修身\n 领型：扣领尖领\n        ', '85803', '0', '0', '1');
INSERT INTO `product` VALUES ('77', '4', '75', 'JEANS牛仔裤男秋冬款直筒修身韩版流行男装男士长裤纯棉加绒裤潮', '309.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1NH.XKpXXXXb1XVXXXXXXXXXX_!!2-item_pic.png_400x400.jpg', '59.90', '100', '\n 裤长: 长裤\n 货号: 620款\n 颜色: 620款不加绒 6699款不加绒 8018款不加绒 2000浅色不加绒 2000深色不加绒 830加绒款蓝色 830加绒款黑色 604加绒款 919卡其加绒款 919宝蓝加绒款 919湖蓝加绒款 919黑色加绒款\n 尺码: 28码2尺1质量好 29码2尺2质量好 30码2尺3质量好 31码2尺4质量好 32码2尺5质量好 33码2尺6质量好 34码2尺7质量好 36码2尺8质量好 38码2尺9质量好 40码3尺08质量好\n 牛仔面料: 常规牛仔布\n 工艺处理: 压皱 漂白 猫须 手擦 磨边 电磨 赤耳 马骝 镶边 做旧 蜡染 磨毛 水洗 其他 免烫处理 丝光 涂层 石磨\n 品牌: JEANS\n 款式细节: 多口袋\n 上市时间: 2015年\n 适用季节: 冬季\n 适用场景: 其他休闲\n 适用对象: 青年\n 材质: 棉\n 弹力: 无弹\n 腰型: 中腰\n 裤脚口款式: 直脚\n 裤门襟: 拉链\n 洗水工艺: 水洗 石洗/石磨 砂洗 石漂洗 漂染 碧纹洗 酵素洗\n 厚薄: 常规\n 款式版型: 合体直筒\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '655', '0', '1', '1');
INSERT INTO `product` VALUES ('78', '4', '75', '冬季加绒加厚V领毛衣男装韩版修身长袖t恤男士打底衫针织衫线衣潮', '95.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1_8hZKFXXXXb1XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '55.00', '100', '\n 款式: 套头\n 版型: 修身型\n 厚薄: 加厚\n 领型: V领\n 颜色: 3228黑色 3228白色 3228酒红 3280白色 3280黑色 3280酒红 5103白色 5103黑色 5601白色 5601藏青 5601灰色 6041白色 6041黑色 6041灰色 6607白色 6607黑色 6607灰色\n 尺码: M（165）修身保暖 L（170）加绒加厚 XL（175）高品质 2XL（180）赠运险\n 款式细节: 撞色\n 工艺处理: 免烫处理\n 品牌: 其它/other\n 袖型: 常规\n 袖长: 长袖\n 毛线粗细: 细毛线 （16针和14针）\n 材质: 纯棉（95%以上）\n 适用场景: 休闲\n 上市时间: 2015年\n 适用对象: 青少年\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '431', '0', '0', '0');
INSERT INTO `product` VALUES ('79', '4', '75', '秋冬季男士长袖t恤纯棉圆领打底衫青年大码衣服潮流小衫男装体恤', '128.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1w1cQJFXXXXXHXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '39.00', '100', '\n 印花主题: 几何图案\n 厚薄: 常规\n 品牌类型: 时尚潮牌\n 袖长: 长袖\n 领型: 圆领\n 颜色: 白色 黑色\n 尺码: S M L XL 2XL\n 面料分类: 汗布\n 款式细节: 印花\n 服饰工艺: 免烫处理\n 品牌: 元野\n 袖型: 常规\n 花型图案: 纯色\n 版型: 标准\n 材质: 棉\n 棉含量: 90%(含)-95%(含)\n 适用季节: 秋季\n 上市时间: 2015年\n 适用场景: 日常\n 适用对象: 青年\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '6154', '0', '1', '0');
INSERT INTO `product` VALUES ('80', '4', '75', '秋冬季男士长袖衬衫男装韩版修身型牛津纺寸衫休闲纯色打底衬衣男', '118.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1ZoDGKVXXXXcaXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '96.00', '100', '\n 厚薄: 常规\n 袖长: 长袖\n 版型: 修身\n 领型: 方领\n 颜色: 白色 灰色 黑色 粉红色 墨绿色 绿色 浅蓝色 湖蓝色 藏青色\n 尺码: M L XL 2XL 3XL 4XL 5XL\n 面料分类: 牛津纺\n 品牌: 其他/other\n 材质: 棉\n 上市时间: 2015年\n 适用场景: 其他休闲\n 适用季节: 秋季\n 适用对象: 青少年\n 基础风格: 青春流行\n 细分风格: 潮\n 面料功能: 免烫\n 图案: 纯色\n 服饰工艺: 免烫处理\n 服装款式细节: 纽扣装饰\n        ', '5049', '0', '1', '1');
INSERT INTO `product` VALUES ('81', '4', '75', '冬季男士加绒加厚休闲裤男裤青年直筒长裤男装韩版修身纯棉裤子潮', '399.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1B4XsJXXXXXc5XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '\n 工艺/流行 工艺处理：水洗\n 细分风格：商务休闲\n 图案：其他\n \n关键信息 上市年份季节：2015年冬季\n 材质成分：棉100%\n 货号：667\n 销售渠道类型：纯电商(只在线上销售)\n 品牌：本色豹\n 弹力：无弹\n 厚薄：加绒加厚\n 基础风格：商务绅士\n 面料：其他\n \n其他 适用场景：其他休闲\n 适用对象：青少年\n        ', '20225', '0', '1', '0');
INSERT INTO `product` VALUES ('82', '4', '75', '男装秋季圆领男打底衫男士上衣冬季小衫印花保暖加绒长袖T恤男潮', '138.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1PKk5KVXXXXaJXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '58.00', '100', '\n 印花主题: 人物图案\n 厚薄: 加绒加厚\n 品牌类型: 时尚潮牌\n 袖长: 长袖\n 领型: 圆领\n 颜色: 加绒白色 加绒黑色 白色 黑色\n 尺码: 4XL 5XL M L XL 2XL 3XL\n 面料分类: 罗纹布\n 款式细节: 其他\n 服饰工艺: 水洗\n 品牌: 其它/other\n 袖型: 常规\n 花型图案: 几何图案\n 版型: 宽松\n 材质: 棉\n 适用季节: 冬季\n 上市时间: 2016年\n 适用场景: 日常\n 适用对象: 青少年\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '293', '0', '1', '0');
INSERT INTO `product` VALUES ('83', '4', '75', '秋冬季新款男装加绒加厚长袖t恤男纯棉青年打底衫针织内搭毛衣潮', '269.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1YraPKXXXXXcGXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '69.00', '100', '\n印花主题: 环保\n 厚薄: 加绒加厚\n 品牌类型: 设计师品牌\n 袖长: 长袖\n 领型: 翻领\n 颜色: 黑灰 中灰 卡其色 蓝色\n 尺码: M L XL 2XL 3XL\n 面料分类: 其他\n 款式细节: 贴布\n 服饰工艺: 水洗\n 品牌: SENLEIS/森雷司\n 袖型: 常规\n 花型图案: 纯色\n 版型: 宽松\n 材质: 棉\n 适用季节: 冬季\n 上市时间: 2015年\n 适用场景: 日常\n 适用对象: 青年\n 基础风格: 青春流行\n 细分风格: 青春活力\n        ', '795', '0', '0', '0');
INSERT INTO `product` VALUES ('84', '4', '75', '秋冬新款男装西裤厚直筒宽松长裤子免烫抗皱西装裤爸爸装羊毛西裤', '468.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1WlJ9JFXXXXc_XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '468.00', '100', '\n 裤长: 长裤\n 货号: 90465无折\n 裤型: 直筒\n 颜色: 无褶深灰 无褶浅灰 无褶黑色 无褶蓝色 有褶深灰 有褶浅灰 有褶黑灰 有褶黑色 有褶蓝色 有褶中灰\n 品牌: 其它/other\n 尺码: 29（腰围2.2尺） 30（腰围2.3尺） 31（腰围2.4尺） 32（腰围2.5尺） 33（腰围2.6尺） 34（腰围2.7尺） 35（腰围2.8尺） 36（腰围2.9尺） 38（腰围3尺） 40（腰围3.1尺） 41（腰围3.2尺） 42（腰围3.3尺）\n 材质: 羊毛\n 羊毛含量: 50%(含)-69%(含)\n 适用季节: 秋季\n 适用场景: 休闲\n 适用对象: 中年\n 基础风格: 商务绅士\n 细分风格: 商务休闲\n 服饰工艺: 免烫处理\n 服装款式细节: 绗缝\n 图案: 纯色\n        ', '85', '0', '0', '1');
INSERT INTO `product` VALUES ('85', '4', '75', '青少年t恤大码纯棉圆领长袖男装学生长袖T恤衫加肥加大男款运动服', '55.00', 'https://gd3.alicdn.com/bao/uploaded/i3/T1KKmxFhlhXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '49.00', '100', '\n 印花主题: 人文风景\n 厚薄: 常规\n 品牌类型: 时尚潮牌\n 袖长: 长袖\n 领型: 圆领\n 颜色: 04黄色 04黑色 04蓝色 04红色 04白色 2218蓝色 2218红色 2218白色 2218黑色 2218浅灰 2218黄色 5218白色 3218蓝色 3218绿色 8218深蓝 5218黑色 5218浅灰 3218紫色 3218桔色 白色 黑色 红色 黄色 蓝色 浅灰色\n 尺码: 180(XL) 175(L) 185(XXL) 190(XXXL) 170(M) 195/115(XXXXL)\n 面料分类: 其他\n 款式细节: 印花\n 服饰工艺: 免烫处理\n 品牌: 其它/other\n 袖型: 常规\n 花型图案: 字母数字\n 版型: 宽松\n 材质: 棉\n 棉含量: 95%以上\n 适用季节: 秋季\n 上市时间: 2015年\n 适用场景: 运动\n 适用对象: 青少年\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '2713', '0', '0', '0');
INSERT INTO `product` VALUES ('86', '4', '75', '秋冬装日系加绒长袖t恤男士加大码青少年上衣服打底衫外套潮男装', '220.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1h74SKVXXXXXNaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '38.80', '100', '\n 印花主题: 人文风景\n 厚薄: 常规\n 袖长: 长袖\n 领型: 圆领\n 颜色: 玫瑰黑色不加绒 玫瑰白色不加绒 牡丹黑色不加绒 牡丹白色不加绒 玫瑰白色加绒 玫瑰黑色加绒 星空小鹿不加绒 梅花鹿黑色不加绒 梅花鹿白色不加绒 牡丹白色加绒 牡丹黑色加绒 星空小鹿加绒 梅花鹿黑色加绒 梅花鹿白色加绒 吉普车T恤 红星星T恤 涂鸦太阳T恤 收藏宝贝送手链 买2件送袜子\n 尺码: S M L XL 2XL\n 面料分类: 棉毛布\n 品牌: G-T\n 袖型: 常规\n 花型图案: 大满花\n 版型: 标准\n 材质: 棉\n 棉含量: 95%以上\n 适用季节: 四季\n 上市时间: 2015年\n 适用场景: 上班\n 适用对象: 青少年\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '992', '0', '0', '1');
INSERT INTO `product` VALUES ('87', '4', '75', '羊毛呢中老年西服套装商务休闲厚男士中年西装爸爸装宽松秋冬男装', '1280.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1RJ6_KpXXXXX7XFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '240.00', '100', '\n 厚薄: 厚\n 开衩方式: 无开衩\n 版型: 标准\n 西服工艺: 粘合衬工艺\n 货号: 4款\n 领型: 平驳领\n 领型宽度: 规则领型（领宽7-9cm）\n 门襟/纽扣: 两粒单排扣\n 颜色: 灰色9905 经典暗纹款（藏青色）8821 灰色细纹款0821 麻灰色8860 深蓝色9319 深灰色8809 纯黑色9316\n 尺码: 165/72 170/74 175/76 180/78 185/80 190/82 拍下留言身高体重腰围 支持15天无理由退换货 赠送运费险 退换货无忧\n 面料分类: 毛呢布\n 品牌: 范达尔\n 材质: 羊毛\n 羊毛含量: 80%(含)-89%(含)\n 适用季节: 秋季\n 适用场景: 上班\n 适用对象: 中年\n 基础风格: 商务绅士\n 细分风格: 商务休闲\n 图案: 其他\n        ', '1223', '0', '0', '0');
INSERT INTO `product` VALUES ('88', '4', '75', '秋冬宽松加大码牛仔裤男士加肥加大牛仔裤超大号男装胖子肥仔包邮', '268.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1lWATFVXXXXazXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '88.00', '100', '\n 裤长: 长裤\n 颜色: 深蓝色 蓝色\n 尺码: 30（2.3尺） 31（2.4尺） 32（2.5尺） 33（2.6尺） 34（2.7尺） 36（2.8尺） 38(2.92尺) 40（3.1尺） 42（3.23尺） 44（3.35尺） 46（3.5尺） 48（3.65尺） 50（3.8尺）\n 牛仔面料: 常规牛仔布\n 工艺处理: 漂白\n 品牌: 其它/other\n 款式细节: 五袋款\n 上市时间: 2015年\n 适用季节: 春季\n 适用场景: 其他休闲\n 适用对象: 大码\n 材质: 棉\n 弹力: 无弹\n 腰型: 高腰\n 裤脚口款式: 直脚\n 裤门襟: 拉链\n 洗水工艺: 砂洗\n 厚薄: 常规\n 款式版型: 宽松直筒\n 基础风格: 时尚都市\n 细分风格: 小清新\n        ', '229', '0', '1', '1');
INSERT INTO `product` VALUES ('89', '4', '75', '金盾男装衬衫白色商务衬衫男士长袖职业衬衣韩版免烫正装工装寸衫', '368.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1gJpmHFXXXXaZXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '78.00', '100', '\n 工艺/流行 细分风格：商务正装\n 图案：纯色\n 服饰工艺：免烫处理\n \n关键信息 上市年份季节：2015年春季\n 厚薄：常规\n 材质成分：聚酯纤维65% 棉35%\n 货号：K8001\n 销售渠道类型：纯电商(只在线上销售)\n 面料分类：色织布\n 品牌：KIN DON/金盾\n 基础风格：商务绅士\n \n版型款式 袖长：长袖\n 版型：标准\n 领型：方领\n        ', '2124', '0', '1', '1');
INSERT INTO `product` VALUES ('90', '4', '75', '秋冬男士加绒PU皮衣修身加大码青年皮夹克韩版机车皮外套水洗男装', '198.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB18zhIKXXXXXb3XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '98.00', '100', '\n 衣长: 常规\n 货号: 888\n 版型: 修身型\n 领型: 立领\n 门襟: 拉链\n 颜色: 黑色加绒 黑篮/薄 黑篮加绒 咖啡色加绒 卡其色加绒 黑色 卡其色 咖啡色\n 尺码: 4XL/190 M L XL 2XL 3XL\n 皮衣材质: 绵羊皮\n 款式细节: 拉链装饰\n 品牌: 其它/other\n 款式: 仿皮皮衣\n 适用季节: 冬季\n 适用场景: 休闲\n 适用对象: 青年\n 下摆设计: 罗纹下摆\n 服装口袋样式: 侧缝插袋\n 基础风格: 青春流行\n 细分风格: 精致韩风\n 图案: 色块\n 材质工艺: 免烫处理\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('91', '4', '75', '冬季新款男士棉衣青年男装韩版加厚棉服修身外套冬装流行棉袄男款', '499.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1tKj3KpXXXXacXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '158.00', '100', '\n 衣长: 常规\n 版型: 修身\n 领型: 连帽\n 门襟: 拉链\n 颜色: 077藏青色 077黑色 M06黑色 M06酒红 M06藏青色 M06香槟色 M07l蓝色 M07黑色 077红色\n 尺码: 165/80A 170/84A 175/88A 180/92A 185/96A\n 面料分类: 涂层布\n 款式细节: 拉链装饰\n 品牌: 其它/other\n 适用场景: 其他休闲\n 适用对象: 青少年\n 下摆设计: 圆下摆\n 基础风格: 青春流行\n 细分风格: 精致韩风\n 图案: 纯色\n 材质工艺: 免烫处理\n        ', '6882', '0', '0', '1');
INSERT INTO `product` VALUES ('92', '4', '75', '秋冬季男士全棉灯芯绒长袖衬衫男装纯棉商务休闲修身纯色衬衣厚款', '228.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB14xDNGXXXXXcuXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '69.00', '100', '\n 厚薄: 厚\n 袖长: 长袖\n 货号: DXRM-11\n 版型: 修身\n 领型: 扣领尖领\n 颜色: 橄榄绿 牛仔蓝 棕黄色 枣红色 浅灰色 卡其色 墨绿色 浅蓝色 藏青色 咖啡色\n 尺码: (165/84A) 38码 (170/88A) 39码 (175/92A) 40码 (175/96A) 41码 (180/100A) 42码 (180/104A) 43码 (185/108A) 44码 【2件立减10元】 【赠送运费险】\n 面料分类: 法兰绒（磨毛）\n 品牌: 其他/other\n 材质: 棉\n 棉含量: 95%以上\n 上市时间: 2015年\n 适用场景: 其他休闲\n 适用季节: 冬季\n 适用对象: 青年\n 基础风格: 时尚都市\n 细分风格: 商务休闲\n 面料功能: 保暖隔热\n 图案: 纯色\n 服饰工艺: 磨毛\n 服装款式细节: 拼接\n        ', '3271', '0', '1', '0');
INSERT INTO `product` VALUES ('93', '4', '75', '秋冬季加绒加厚男士保暖衬衫男长袖条纹中年男装休闲修身保暖衬衣', '388.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1jTYSKFXXXXa1XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '218.00', '100', '\n 厚薄: 加绒加厚\n 袖长: 长袖\n 货号: FS8820\n 版型: 标准\n 领型: 方领\n 颜色: 8819 8820 8836 8837 8838 8839 8840 8841 8842 8843 8845 8846 8847 8848 8849 8850 8851 8852 8853 8855 8856\n 尺码: 38 39 40 41 42 43 44\n 面料分类: 色织布\n 品牌: 其他/other\n 材质: 棉\n 棉含量: 50%(含)-69%(含)\n 上市时间: 2015年\n 适用场景: 日常\n 适用季节: 冬季\n 适用对象: 中年\n 基础风格: 时尚都市\n 细分风格: 商务休闲\n 面料功能: 免烫\n 图案: 条纹\n 服饰工艺: 免烫处理\n 服装款式细节: 印花\n        ', '223', '0', '0', '1');
INSERT INTO `product` VALUES ('94', '4', '75', '秋冬款灯芯绒衬衫男长袖全棉男装 休闲 条绒衬衣男士长袖纯棉厚版', '289.00', 'https://gd4.alicdn.com/imgextra/i4/TB17NO5HVXXXXbxXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '79.00', '100', '\n 厚薄: 厚\n 袖长: 长袖\n 货号: YYMJX0094\n 版型: 修身\n 领型: 扣领尖领\n 颜色: 17格调蓝 01优雅灰 07沉稳棕 06神秘黑 09帅气军绿 27深沉藏青 20倩影黄 22质感粉 11气质酒红 浅蓝色\n 尺码: S【15天退换货】 M【16条灯芯绒面料】 L【低价冲量期】 XL【亏本促销】 XXL【今日疯抢】 XXXL【低价冲量期】 XXXXL【全棉水洗】 灯芯多色可选\n 品牌: YYMJX\n 材质: 棉\n 棉含量: 95%以上\n 上市时间: 2015年\n 适用场景: 其他休闲\n 适用季节: 秋季\n 适用对象: 青年\n 基础风格: 时尚都市\n 细分风格: 青春活力\n 面料功能: 免烫\n 图案: 其他\n 服饰工艺: 免烫处理\n 服装款式细节: 其他\n        ', '1763', '0', '1', '0');
INSERT INTO `product` VALUES ('95', '4', '75', '中年男士长袖保暖T恤中老年冬季打底衫棉体恤男装加绒加厚爸爸装', '658.00', 'https://gd1.alicdn.com/bao/uploaded/i4/TB13UhgKVXXXXcSXFXXYXGcGpXX_M2.SS2_400x400.jpg', '118.00', '100', '\n 厚薄: 加绒加厚\n 品牌类型: 时尚潮牌\n 袖长: 长袖\n 货号: 9835\n 领型: 翻领\n 颜色: 9835蓝色 9835红色 9831蓝色 9831红色 9832蓝色 9832红色 9833蓝色 9833红色\n 尺码: 165/M 170/L 175/XL 180/2XL 185/3XL\n 款式细节: 口袋\n 服饰工艺: 免烫处理\n 品牌: 卡巴熊\n 袖型: 常规\n 花型图案: 波点\n 版型: 标准\n 材质: 棉\n 适用季节: 冬季\n 上市时间: 2015年\n 适用场景: 日常\n 适用对象: 中年\n 基础风格: 商务绅士\n 细分风格: 商务休闲\n        ', '296', '0', '0', '1');
INSERT INTO `product` VALUES ('96', '4', '75', '男士长袖加绒衬衫保暖加厚商务修身白衬衣秋冬季纯棉韩版拼接男装', '399.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1S36UKFXXXXaRXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '69.00', '100', '\n 厚薄: 加绒加厚\n 袖长: 长袖\n 货号: 1306加绒\n 版型: 修身\n 领型: 扣领尖领\n 颜色: 钻蓝 1306加绒款 灰色 12103加绒款 白色 12103加绒款 钻蓝 12103加绒款 黑色 12103加绒款 深蓝 1311加绒款 酒红 1311加绒款 浅蓝 1311加绒款 湖蓝 1311加绒款 卡其 1311加绒款 灰色 1311加绒款 白色 1311加绒款 酒红 2207加绒款 深蓝 2207加绒款 白色 2207加绒款 卡其 2207加绒款 浅蓝 1306不加绒 灰色 1306不加绒 白色 1306不加绒 卡其 1306不加绒 深蓝 1306不加绒 钻蓝 12103不加绒 灰色 12103不加绒 深蓝 12103不加绒 白色 灰色 卡其色 浅蓝色 深蓝色 蓝色\n 尺码: 165/M 170/L 175/XL 180/2XL 185/3XL 190/4XL 195/5XL 【100%纯棉衬衫】 【买2件减5元】 【好评返3元】\n 面料分类: 色织布\n 品牌: 佑哲\n 材质: 棉\n 棉含量: 95%以上\n 上市时间: 2015年\n 适用场景: 其他休闲\n 适用季节: 冬季\n 适用对象: 青年\n 基础风格: 时尚都市\n 细分风格: 商务休闲\n 图案: 纯色\n 服饰工艺: 免烫处理\n 服装款式细节: 其他\n        ', '844', '0', '1', '0');
INSERT INTO `product` VALUES ('97', '4', '75', '2015新款冬季男装直筒加绒加厚牛仔裤牛仔长裤韩加绒牛仔长裤', '508.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1UxPPJFXXXXXRXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '79.00', '100', '\n 裤长: 长裤\n 货号: 812\n 颜色: 812黑色 812蓝色\n 尺码: 28 29 30 31 32 33 34 36 38\n 牛仔面料: 加厚牛仔布\n 工艺处理: 猫须 马骝\n 品牌: NEWMANHILL/纽曼希尔\n 款式细节: 多口袋\n 上市时间: 2015年\n 适用季节: 冬季\n 适用场景: 其他休闲\n 适用对象: 青年\n 材质: 棉涤\n 弹力: 无弹\n 腰型: 中腰\n 裤脚口款式: 直脚\n 裤门襟: 拉链\n 洗水工艺: 水洗 石洗/石磨\n 厚薄: 加绒加厚\n 款式版型: 合体直筒\n 基础风格: 青春流行\n 细分风格: 青春活力\n        ', '216', '0', '1', '1');
INSERT INTO `product` VALUES ('98', '4', '75', '朗蒙秋冬商务休闲免烫衬衣修身男装格子加绒加厚保暖男士长袖衬衫', '298.00', 'https://img.alicdn.com/bao/uploaded/i4/TB18jCZKXXXXXa7XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '\n 工艺/流行 细分风格：商务休闲\n 图案：格子\n 服饰工艺：免烫处理\n \n关键信息 上市年份季节：2015年秋季\n 厚薄：加绒加厚\n 材质成分：聚酯纤维60% 棉40%\n 货号：LML5C050\n 面料分类：色织布\n 品牌：朗蒙\n 基础风格：时尚都市\n \n版型款式 袖长：长袖\n 版型：修身\n 领型：扣领尖领\n        ', '4236', '0', '0', '0');
INSERT INTO `product` VALUES ('99', '4', '75', '春秋薄款男士长袖衬衫 纯棉韩版修身男装潮流亚麻布休闲免烫上衣', '128.00', 'https://gd2.alicdn.com/imgextra/i2/839668272/TB2rqvIgpXXXXbRXXXXXXXXXXXX_!!839668272.jpg_400x400.jpg', '45.00', '100', '\n 厚薄: 常规\n 袖长: 长袖\n 版型: 修身\n 领型: 尖领（常规）\n 颜色: 726白色 704白色 711白色 711蓝色 709蓝色 709白色 701蓝色 713蓝色 708蓝色 705深蓝 704蓝色 701白色 705浅蓝 708白色 707白色 713白色 715白色 715蓝色 707蓝色\n 尺码: 都偏小，请拍大一码 M L XL XXL\n 面料分类: 亚麻布\n 品牌: 炫潮\n 材质: 棉\n 棉含量: 95%以上\n 上市时间: 2015年\n 适用场景: 日常\n 适用季节: 秋季\n 适用对象: 青年\n 基础风格: 青春流行\n 细分风格: 潮\n 面料功能: 免烫\n 图案: 纯色\n 服饰工艺: 免烫处理\n 服装款式细节: 印花\n        ', '184', '0', '0', '1');
INSERT INTO `product` VALUES ('100', '4', '75', '春季卡通印花长袖T恤男士加肥加大码打底衫体恤日系潮休闲胖男装', '99.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1Po6sIVXXXXcjaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '49.00', '100', '\n 印花主题: 创意趣味\n 厚薄: 常规\n 品牌类型: 设计师品牌\n 袖长: 长袖\n 领型: 圆领\n 颜色: 白色 灰色 藏青色 黑色\n 尺码: 4XL 5XL M L XL 2XL 3XL\n 面料分类: 棉毛布\n 款式细节: 印花\n 服饰工艺: 免烫处理\n 品牌: 胖胖哥\n 袖型: 常规\n 花型图案: 卡通动漫\n 版型: 修身\n 材质: 棉\n 适用季节: 春季\n 上市时间: 2016年\n 适用场景: 其他休闲\n 适用对象: 大码\n 基础风格: 青春流行\n 细分风格: 潮\n        ', '309', '0', '0', '0');
INSERT INTO `product` VALUES ('101', '4', '75', '男装秋冬潮男士毛衣韩版修身复古针织衫日系圆领外套青年套头线衣', '195.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1Ut3sKXXXXXcoXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '88.00', '100', '\n 工艺/流行 工艺处理：免烫处理\n 图案：几何图案\n 细分风格：潮\n \n关键信息 上市年份季节：2015年秋季\n 材质成分：棉70% 聚酯纤维30%\n 货号：M32\n 厚薄：常规\n 品牌：乔邦鼠\n 基础风格：青春流行\n \n其他 毛线粗细：常规毛线 （10针，12针）\n 适用场景：上班\n 适用对象：青年\n \n版型款式 款式：套头\n 版型：修身型\n 领型：圆领\n        ', '15679', '0', '1', '0');
INSERT INTO `product` VALUES ('102', '4', '75', '冬季加绒加厚男装保暧机车皮裤男士修身小脚黑色韩版潮男皮裤子', '190.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1SuTKGFXXXXcrXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '105.00', '100', '\n 裤长: 长裤\n 货号: CP149B\n 裤型: 紧身\n 颜色: 黑色加绒 (皱裤脚) 黑色加绒 (小直脚)\n 尺码: 27（2.10尺） 28（2.17尺） 29（2.25尺） 30（2.32尺） 31（2.40尺） 32（2.47尺） 33（2.55尺） 34（2.62尺） 35（2.70尺） 36（2.77尺）\n 面料材质: PU\n 款式细节: 其他\n 品牌: 其它/other\n 适用季节: 冬季\n 适用场景: 休闲\n 适用对象: 青年\n 基础风格: 青春流行\n 细分风格: 潮\n 图案: 纯色\n        ', '474', '0', '1', '1');
INSERT INTO `product` VALUES ('103', '4', '76', '青年冬季立领风衣男韩版修身男士中长款毛呢外套春季帅气男装大衣', '499.00', 'https://img.alicdn.com/bao/uploaded/i1/2057696833/TB2DRfugpXXXXbMXpXXXXXXXXXX_!!2057696833.jpg_430x430q90.jpg', '288.00', '100', '\n 工艺/流行 工艺处理：免烫处理\n 细分风格：精致韩风\n 图案：纯色\n \n关键信息 上市年份季节：2015年冬季\n 材质成分：羊毛50% 聚酯纤维38% 粘胶纤维(粘纤)12%\n 货号：YYFY0577\n 销售渠道类型：纯电商(只在线上销售)\n 面料分类：毛呢布\n 品牌：Z．T．K\n 基础风格：青春流行\n \n版型款式 衣长：常规\n 版型：修身\n 领型：立领\n        ', '3128', '0', '1', '0');
INSERT INTO `product` VALUES ('104', '4', '76', '2015加洲鹿新款中年男士夹克外套中老年男装立领休闲夹克衫爸爸装', '580.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1CHXWGFXXXXaPXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '158.00', '100', '\n 工艺/流行 工艺处理：免烫处理\n 细分风格：商务休闲\n 图案：纯色\n \n关键信息 上市年份季节：2015年春季\n 货号：1321\n 面料分类：格子布\n 品牌：CalifDeer/加洲鹿\n 厚薄：常规\n 基础风格：商务绅士\n \n其他 适用场景：其他休闲\n 适用对象：中年\n \n版型款式 领型：立领\n 款式细节：拉链装饰\n 版型：修身\n        ', '5005', '0', '0', '1');
INSERT INTO `product` VALUES ('105', '4', '76', '秋冬季男士衬衫男长袖修身纯棉加绒保暖青年时尚商务休闲衬衣男装', '198.00', 'https://img.alicdn.com/bao/uploaded/i3/1735932067/TB2GjIlipXXXXcqXXXXXXXXXXXX_!!1735932067.jpg_430x430q90.jpg', '99.00', '100', '\n 工艺/流行 细分风格：商务休闲\n 图案：纯色\n 服饰工艺：免烫处理\n \n关键信息 上市年份季节：2015年秋季\n 厚薄：加绒加厚\n 材质成分：棉100%\n 货号：TZL8307\n 销售渠道类型：纯电商(只在线上销售)\n 面料分类：牛津纺\n 品牌：泰芝郎\n 基础风格：时尚都市\n \n版型款式 袖长：长袖\n 版型：修身\n 领型：方领\n        ', '5130', '0', '0', '1');
INSERT INTO `product` VALUES ('106', '6', '145', '秋冬季隐形内增高男鞋低帮男士休闲鞋英伦潮鞋反绒皮板鞋小码鞋', '298.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1_f_UHFXXXXbFXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '149.00', '100', '\n 货号: 8806\n 鞋垫材质: 二层猪皮\n 鞋跟高: 低跟(1-3cm)\n 品牌: GIVE FIVE\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 牛反绒\n 真皮材质工艺: 反绒皮\n 鞋面内里材质: 二层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 内增高\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 卡其色内增高 驼色内增高 黑色内增高 咖啡色内增高 天木蓝非内增高 黑色非内增高 咖啡色非内增高 驼色非内增高 天木蓝内增高 卡其色非内增高\n 尺码: 比运动鞋偏大两码 比休闲鞋偏大一码 36 37 38 39 40 41 42 43 44\n 款式: 板鞋\n 功能: 增高\n 适用对象: 青年（18-40周岁）\n        ', '119', '0', '1', '0');
INSERT INTO `product` VALUES ('107', '6', '145', '冬男士休闲鞋磨砂男鞋青春潮流英伦布洛克雕花鞋厚底大码45 46 47 ', '338.00', 'https://gd1.alicdn.com/imgextra/i1/677978154/TB2o7HueFXXXXc5XXXXXXXXXXXX_!!677978154.jpg_400x400.jpg', '169.00', '100', '\n 货号: YGS-HF-580\n 鞋垫材质: PU\n 品牌: other/其他\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: EVA发泡胶\n 鞋面材质: 牛反绒\n 真皮材质工艺: 反绒皮\n 鞋面内里材质: 二层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 松糕底\n 图案: 纯色\n 流行元素: 雕花\n 风格: 青春潮流\n 细分风格: 韩版\n 场合: 日常\n 季节: 春秋\n 颜色分类: 灰色 蓝色 浅棕色\n 尺码: 38 39 40 41 42 43 44 45 46 47\n 款式: 休闲皮鞋\n 功能: 增高\n 适用对象: 青年（18-40周岁）\n        ', '13', '0', '0', '0');
INSERT INTO `product` VALUES ('108', '6', '145', '冬季低帮真皮英伦青春潮流学生板鞋男式休闲鞋男鞋加大码46码47码', '398.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1I9p_GXXXXXXAXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '199.00', '100', '\n 货号: YGS-ABK-6537\n 鞋垫材质: 头层猪皮\n 品牌: Five\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: TPR(牛筋）\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 摔纹皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 拼色\n 流行元素: 皮革拼接\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 白色 黑色 深棕色\n 尺码: 38 39 40 41 42 43 44 45 46 47\n 款式: 板鞋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n        ', '2', '0', '1', '0');
INSERT INTO `product` VALUES ('109', '6', '145', '冬季青春潮流加绒保暖男棉鞋复古铆钉靴男士休闲英伦马丁靴军靴子', '516.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1I9p_GXXXXXXAXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '228.00', '100', '\n 跟底款式: 平跟\n 靴筒内里材质: 人造短毛绒\n 鞋头款式: 圆头\n 鞋跟高: 低跟(1-3cm)\n 款式: 马丁靴\n 货号: YGS-ACK-1088\n 流行元素: 铆钉\n 风格: 复古\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 季节: 冬季\n 鞋面材质: 二层牛皮（除牛反绒）\n 靴筒材质: 牛皮\n 真皮材质工艺: 擦色皮\n 颜色分类: 深灰色 黑色 深棕色 褐色\n 尺码: 38 39 40 41 42 43 44\n 靴筒高度: 中筒\n 鞋面内里材质: 人造短毛绒\n 功能: 保暖\n 适用对象: 青年（18-40周岁）\n        ', '1', '0', '0', '1');
INSERT INTO `product` VALUES ('110', '6', '145', '冬季青春潮流加绒保暖男棉鞋复古铆钉靴男士休闲英伦马丁靴军靴子', '338.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1ilzdHFXXXXcqXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '169.00', '100', '\n 货号: HSK-GH-6601\n 鞋垫材质: 头层猪皮\n 品牌: FIVE\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 印花皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 皮革拼接\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 夏季\n 颜色分类: 黑色 蓝色 深棕色\n 尺码: 38 39 40 41 42 43 44\n 款式: 休闲皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '21', '0', '1', '1');
INSERT INTO `product` VALUES ('112', '6', '146', '冬季男鞋休闲鞋男士休闲大头皮鞋男真皮英伦工装鞋男大头鞋 潮鞋', '578.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1ilzdHFXXXXcqXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '169.00', '100', '\n 上市年份季节: 2014年秋季\n 货号: MD1407025\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋垫材质: PU\n 品牌: Maden/马登\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 二层牛皮（除牛反绒）\n 真皮材质工艺: 疯马皮\n 鞋面内里材质: 网纱\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 户外休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 木炭黑 蜜蜡色\n 尺码: 38 39 40 41 42 43\n 款式: 工装鞋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 工装鞋（大头鞋）\n        ', '3951', '0', '1', '1');
INSERT INTO `product` VALUES ('113', '6', '146', '马丁靴男靴工装靴真皮英伦冬季男士棉鞋雪地短靴皮靴加绒高帮男鞋', '534.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1QsfwKFXXXXXNaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '179.00', '100', '\n 上市年份季节: 2015年秋季\n 跟底款式: 平跟\n 靴筒内里材质: 无内里\n 鞋头款式: 圆头\n 款式: 工装靴\n 货号: MD1407028\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 闭合方式: 系带\n 品牌: Maden/马登\n 鞋底材质: 橡胶\n 季节: 冬季\n 鞋面材质: 二层牛皮（除牛反绒）\n 靴筒材质: 牛皮\n 真皮材质工艺: 疯马皮\n 颜色分类: 古巴棕（加绒版） 木炭黑（加绒版） 蜜蜡色（加绒版） 木炭黑 蜜蜡色 古巴棕\n 尺码: 38 39 40 41 42 43 44\n 靴筒高度: 短筒\n 鞋面内里材质: 无内里\n 功能: 耐磨\n 靴子品名: 工装靴\n        ', '9456', '0', '1', '0');
INSERT INTO `product` VALUES ('114', '6', '146', '男士鞋子冬季休闲鞋男英伦大头鞋工装鞋男鞋大头皮鞋男真皮 潮鞋', '538.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1Dc0vJFXXXXb5XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '159.00', '100', '\n 上市年份季节: 2015年秋季\n 货号: MD1407027\n 品牌: Maden/马登\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 二层牛皮（除牛反绒）\n 真皮材质工艺: 疯马皮\n 鞋面内里材质: 网纱\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 冬季\n 颜色分类: 木炭黑 蜜蜡色\n 尺码: 38 39 40 41 42 43 44\n 款式: 工装鞋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 工装鞋（大头鞋）\n        ', '4614', '0', '1', '0');
INSERT INTO `product` VALUES ('115', '6', '146', '马登马丁靴男靴子男版潮流反绒鞋子男英伦沙漠靴男士休闲鞋工装靴', '608.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1k1xXLpXXXXcBXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '189.00', '100', '\n 上市年份季节: 2014年秋季\n 跟底款式: 平跟\n 靴筒内里材质: 棉\n 鞋垫材质: 布\n 鞋头款式: 圆头\n 鞋跟高: 低跟(1-3cm)\n 款式: 沙漠靴\n 货号: MD1407024\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 闭合方式: 系带\n 品牌: Maden/马登\n 鞋底材质: 橡胶\n 季节: 春秋\n 鞋面材质: 二层牛皮（除牛反绒）\n 靴筒材质: 牛皮\n 真皮材质工艺: 反绒皮\n 颜色分类: 深棕色 透明色 卡其色 玛瑙红（女款） 天目兰 驼色（女款） 黄棕色 黄棕色（女款） 驼色\n 尺码: 34 35 36 37 38 39 40 41 42 43 44\n 靴筒高度: 短筒\n 鞋面内里材质: 棉\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n 靴子品名: 马丁靴\n        ', '1880', '0', '0', '1');
INSERT INTO `product` VALUES ('116', '6', '146', 'Maden/马登冬季男士棉鞋加绒雪地靴男潮流马丁靴男真皮保暖男鞋', '932.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1ZOsFKpXXXXaZaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '229.00', '100', '\n 上市年份季节: 2015年冬季\n 跟底款式: 平跟\n 销售渠道类型: 纯电商(只在线上销售)\n 靴筒内里材质: 人造短毛绒\n 鞋头款式: 圆头\n 款式: 雪地靴\n 货号: MD1511106\n 流行元素: 编制\n 风格: 休闲\n 细分风格: 日常休闲\n 闭合方式: 套筒\n 品牌: Maden/马登\n 鞋底材质: 橡胶\n 季节: 冬季\n 鞋面材质: 牛反绒\n 靴筒材质: 牛反绒\n 真皮材质工艺: 反绒皮\n 颜色分类: 黑色 藏青色 古巴棕\n 尺码: 39 40 41 42 43\n 靴筒高度: 短筒\n 鞋面内里材质: 人造短毛绒\n 功能: 保暖\n 靴子品名: 雪地靴\n        ', '26', '0', '1', '1');
INSERT INTO `product` VALUES ('117', '34', '330', 'vivo X6移动联通双4G超薄八核大屏双卡智能触屏指纹手机vivox6', '2498.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1nU6PLXXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2498.00', '100', '\n 产品名称：vivo X6\n CPU型号: MT6752\n 型号: X6\n 机身颜色: 玫瑰金 金色\n 运行内存RAM: 4GB\n 机身内存: 32GB\n 网络模式: 双卡多模\n 电池容量: 2400mAh\n        ', '6560', '0', '0', '0');
INSERT INTO `product` VALUES ('118', '34', '330', 'vivo X5Pro3G运存版 移动联通双4g 超薄八核双卡双待大屏智能手机', '2298.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1zHvHLXXXXXcNXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '1998.00', '100', '\n 产品名称：vivo X5Pro3G运存版\n CPU型号: MT6752\n 型号: X5Pro3G运存版\n 机身颜色: 极光白\n 运行内存RAM: 3GB\n 机身内存: 16GB\n 网络模式: 双卡多模\n 电池容量: 2450mAh\n        ', '474', '0', '1', '1');
INSERT INTO `product` VALUES ('119', '34', '330', 'vivo X6PlusA全网通4G双卡超薄八核高清大屏智能音乐拍照指纹手机', '3198.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1ZoDeLXXXXXXxaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2999.00', '100', '\n 产品名称：vivo X6PlusA全网通\n CPU型号: 骁龙615\n 型号: X6PlusA全网通\n 机身颜色: 玫瑰金 金色\n 运行内存RAM: 4GB\n 机身内存: 64GB\n 网络模式: 双卡多模\n 电池容量: 4000mAh\n        ', '973', '0', '1', '0');
INSERT INTO `product` VALUES ('120', '34', '394', '分期12期免息Samsung/三星 SM-G9280 S6 Edge+ S6 edge Plus 手机 ', '5888.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1igtsLpXXXXc7XXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '25888.00', '100', '\n 证书编号：2015011606795366\n 证书状态：有效\n 申请人名称：惠州三星电子有限公司\n 制造商名称：惠州三星电子有限公司\n 产品名称：TD-LTE数字移动电话机\n 3C产品型号：SM-G9280（旅行充电器：EP-TA20CBC,输出：9.0VDC；1.67A 或5.0VDC;...\n 产品名称：Samsung/三星 SM-G9280\n CPU型号: Exynos 7420\n 三星型号: SM-G9280\n 机身颜色: 樱粉金 雪晶白 铂光金 钛泽银\n 运行内存RAM: 4GB\n 机身内存: 32GB 64GB\n 网络模式: 双卡多模\n 电池容量: 3000mAh\n        ', '327', '0', '0', '1');
INSERT INTO `product` VALUES ('121', '34', '394', 'Samsung/三星 SM-G6000 Galaxy On7 O7 手机 全网通', '1399.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1ONrGKVXXXXb0XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '1398.00', '100', '\n产品名称：Samsung/三星 SM-G6000\n CPU型号: 骁龙410\n 三星型号: SM-G6000\n 机身颜色: 静夜黑 流沙金\n 运行内存RAM: 1.5GB\n 机身内存: 8GB 16GB\n 网络模式: 双卡多模\n 电池容量: 3000mAh\n        ', '112', '0', '1', '0');
INSERT INTO `product` VALUES ('122', '34', '395', 'Apple/苹果 iPhone 6s plus 移动联通电信版4g手机全网通智能手机', '6088.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1LVOQLXXXXXcsXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '5598.00', '100', '\n产品名称：Apple/苹果 iPhone 6s Pl...\n CPU型号: 其他\n Apple型号: iPhone 6s Plus\n 机身颜色: 玫瑰金色 深空灰色 金色 银色\n 运行内存RAM: 不详\n 机身内存: 16GB 64GB 128GB\n 网络模式: 无需合约版\n 电池容量: 2750mAh\n        ', '4213', '0', '1', '1');
INSERT INTO `product` VALUES ('123', '14', '396', 'Hisense/海信 LED58EC620UA 58英寸14核4K超清智能平板液晶电视机', '4999.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1IApgLpXXXXa_XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '4799.00', '100', '\n 证书编号：2015010808775460\n 证书状态：有效\n 申请人名称：青岛海信电器股份有限公司\n 制造商名称：青岛海信电器股份有限公司\n 产品名称：液晶电视\n 3C产品型号：LED58EC620UA：220VAC 50Hz 150W\n 产品名称：Hisense/海信 LED58EC620...\n 品牌: Hisense/海信\n 型号: LED58EC620UA\n 分辨率: 3840x2160\n 3D类型: 无\n 能效等级: 三级\n 网络连接方式: 全部支持\n 操作系统: SMART TV操作系统\n        ', '684', '0', '0', '0');
INSERT INTO `product` VALUES ('124', '14', '396', 'Hisense/海信 LED55EC760UC 55吋曲面4K超高清液晶电视机平板', '5999.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1GPMkLXXXXXXGXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '5799.00', '100', '\n 产品名称：Hisense/海信 LED55EC760...\n 品牌: Hisense/海信\n 型号: LED55EC760UC\n 分辨率: 3840x2160\n 3D类型: 无\n 能效等级: 三级\n 网络连接方式: 全部支持\n 操作系统: VIDAA3\n        ', '371', '0', '1', '1');
INSERT INTO `product` VALUES ('125', '14', '396', 'Hisense/海信 LED58EC320A 58吋巨屏智能液晶全高清平板电视60', '3799.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1JVZCLXXXXXX6XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3799.00', '100', '\n 产品名称：Hisense/海信 LED58EC320...\n 品牌: Hisense/海信\n 型号: LED58EC320A\n 分辨率: 1920x1080\n 3D类型: 无\n 能效等级: 二级\n 网络连接方式: 全部支持\n 操作系统: VIDAA3\n        ', '278', '0', '0', '1');
INSERT INTO `product` VALUES ('126', '13', '397', 'SIEMENS/西门子 WM10N1C00W 8公斤变频滚筒全自动洗衣机', '9999.00', 'https://img.alicdn.com/imgextra/i4/872411436/TB2h8dYjpXXXXb8XpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg', '3999.00', '100', '\n 产品名称：SIEMENS/西门子 WM10N1C0...\n 洗衣机品牌: SIEMENS/西门子\n 型号: WM10N1C00W\n 产品类型: 滚筒洗衣机\n 使用方式: 全自动\n 洗衣程序: 衬衫,内衣,窗帘,护肤,羽绒服 羊毛洗 化纤洗 棉麻洗 快洗 单漂 单甩 真丝洗 牛仔洗 抗菌洗 标准洗 筒自洁\n 能效等级: 一级\n 电机类型: 变频电机\n        ', '795', '0', '1', '0');
INSERT INTO `product` VALUES ('127', '13', '397', 'SIEMENS/西门子 KA92NV66TI 610L双开门变频对开门冰箱旗舰款', '12999.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1OSVwLpXXXXXsXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '8999.00', '100', '\n 产品名称：SIEMENS/西门子 KA92NV66...\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 能效等级: 一级\n        ', '115', '0', '0', '0');
INSERT INTO `product` VALUES ('128', '13', '397', 'SIEMENS/西门子 WM10E1C81W 西门子滚筒洗衣机全自动 7KG', '8890.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1rb0sLpXXXXXCXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3399.00', '100', '\n 产品名称：SIEMENS/西门子 WM10E1C8...\n 洗衣机品牌: SIEMENS/西门子\n 型号: WM10E1C81W\n 产品类型: 滚筒洗衣机\n 使用方式: 全自动\n 洗衣程序: 手洗 羊毛洗 大件洗 化纤洗 棉麻洗 快洗 预洗 单漂 单甩 单排 强力洗 真丝洗 牛仔洗 毛巾洗 单洗 标准洗 筒自洁\n 能效等级: 一级\n 电机类型: 普通电机\n        ', '531', '0', '1', '1');
INSERT INTO `product` VALUES ('129', '12', '398', 'Midea/美的 BCD-535WKZM(E)对开门电冰箱双开门冰箱智能风冷无霜', '4999.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1tpV.JpXXXXaNXXXX.02G.XXX_101155.jpg_430x430q90.jpg', '3799.00', '100', '\n 产品名称：Midea/美的 BCD-535WKZM...\n 美的冰箱型号: BCD-535WKZM(E)\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 能效等级: 一级\n        ', '868', '0', '0', '1');
INSERT INTO `product` VALUES ('130', '12', '398', 'Midea/美的 BCD-303WTZMA(E)多开门电冰箱风冷无霜阿里云智能', '4599.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1S6VfLpXXXXboXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2999.00', '100', '\n 产品名称：Midea/美的 BCD-303WTZM...\n 美的冰箱型号: BCD-303WTZMA(E)\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 多门式\n 能效等级: 一级\n        ', '410', '0', '0', '0');
INSERT INTO `product` VALUES ('131', '12', '398', 'Midea/美的 BCD-516WKZM(E)对开门电冰箱/双门智能风冷无霜冰箱', '4999.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1N4ZYLXXXXXc1XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3399.00', '100', '\n 产品名称：Midea/美的 BCD-516WKZM...\n 美的冰箱型号: BCD-516WKZM(E)\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 能效等级: 一级\n        ', '30', '0', '1', '0');
INSERT INTO `product` VALUES ('132', '12', '398', 'Midea/美的 BCD-515WKM(E) 对开门吧台电冰箱双开门风冷无霜薄款', '4999.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1ygw6LXXXXXcnXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3799.00', '100', '\n 产品名称：Midea/美的 BCD-515WKM(...\n 美的冰箱型号: BCD-515WKM(E)\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 能效等级: 一级\n        ', '59', '0', '1', '0');
INSERT INTO `product` VALUES ('133', '12', '399', 'Haier/海尔 BCD-648WDBE 648升大容量节能对开门电冰箱 冷藏冷冻', '4199.00', 'https://img.alicdn.com/bao/uploaded/i7/TB1zj3jHXXXXXbCaFXXfmID7VXX_015758.jpg_430x430q90.jpg', '3899.00', '100', '\n 产品名称：Haier/海尔 BCD-648WDBE\n 海尔冰箱型号: BCD-648WDBE\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 能效等级: 一级\n        ', '671', '0', '0', '0');
INSERT INTO `product` VALUES ('134', '12', '399', 'Midea/美的 BCD-535WKZM(E)对开门电冰箱双开门冰箱智能风冷无霜', '4999.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1BlkzLXXXXXbEXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3799.00', '100', '\n 产品名称：Midea/美的 BCD-535WKZM...\n 美的冰箱型号: BCD-535WKZM(E)\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 能效等级: 一级\n        ', '868', '0', '1', '1');
INSERT INTO `product` VALUES ('136', '12', '399', '海尔官网官方旗舰店大型对开门风冷无霜 电冰箱 送货上门全国联保', '44399.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1ItEaHVXXXXadXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '4399.00', '100', '\n 上市时间: 2015-4\n 冰箱冰柜品牌: Haier/海尔\n 海尔冰箱型号: 452WDPF\n 冷冻室容积: 177L\n 冷藏室容积: 275L\n 净重: 92kg\n 包装尺寸: 905x740x1890mm\n 噪声: 38dB\n 堆码层数极限: 2层\n 尺寸: 833x665x1790mm\n 总容量: 452L\n 最大容积: 452L\n 毛重: 102kg\n 耗电量: 0.95Kwh/24h\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 面板类型: VCM覆膜板\n 能效等级: 一级\n 售后服务: 全国联保\n 同城服务: 同城卖家送货上门\n 颜色分类: 白色\n 制冷控制系统: 电脑温控\n        ', '0', '0', '0', '1');
INSERT INTO `product` VALUES ('137', '12', '399', '海尔官网官方旗舰店455升 多门风冷无霜 电冰箱 送货上门全国联保', '9999.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1L.HyHpXXXXauXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '9999.00', '100', '\n 上市时间: 2015-4\n 冰箱冰柜品牌: Haier/海尔\n 海尔冰箱型号: 452WDPF\n 冷冻室容积: 177L\n 冷藏室容积: 275L\n 净重: 92kg\n 包装尺寸: 905x740x1890mm\n 噪声: 38dB\n 堆码层数极限: 2层\n 尺寸: 833x665x1790mm\n 总容量: 452L\n 最大容积: 452L\n 毛重: 102kg\n 耗电量: 0.95Kwh/24h\n 冰箱冷柜机型: 冷藏冷冻冰箱\n 制冷方式: 风冷\n 箱门结构: 对开双门式\n 面板类型: VCM覆膜板\n 能效等级: 一级\n 售后服务: 全国联保\n 同城服务: 同城卖家送货上门\n 颜色分类: 白色\n 制冷控制系统: 电脑温控\n        ', '0', '0', '0', '1');
INSERT INTO `product` VALUES ('139', '18', '400', 'Nikon/尼康Df套机50/1.8G全画幅复古单反相机尼康DF 大陆行货', '16999.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1mV1RJFXXXXbnXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '16999.00', '100', '\n 产品名称：Nikon/尼康 Df套机(50mm...\n 单反级别: 高级\n 屏幕尺寸: 3.2英寸\n 像素: 1600万\n 储存介质: SD卡\n 电池类型: 锂电池\n 上市时间: 2013年11月\n 单反画幅: 全画幅\n 感光元件类型: CMOS\n 对焦点数: 39点\n 是否支持外接闪光灯: 支持\n 是否支持机身除尘: 支持\n 是否支持机身马达: 支持\n 传感器尺寸: 36mmx23.9mm\n 品牌: Nikon/尼康\n 曝光模式: 快门优先 光圈优先 手动曝光 AE自动曝光\n 影像处理类型: EXPEED 3\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('140', '18', '400', 'Leica/徕卡 Mini M LEICA X Vario 数码相机 xv单反相机 五码合一', '21700.00', 'https://gd4.alicdn.com/imgextra/i4/215441878/T2DeUjXhdXXXXXXXXX_!!215441878.jpg_400x400.jpg', '9900.00', '100', '\n 产品名称: Leica/徕卡 Mini M LEICA X Vario\n 品牌: Leica/徕卡\n 型号: Mini M LEICA X Vario\n 感光元件类型: CMOS\n 传感器尺寸: 23.6mmx15.8mm\n 特殊功能: 无特殊功能\n 上市时间: 2013年\n 13年上市月份: 2013年6月\n 像素: 1600万及以上\n 光学变焦: 2.5倍\n 成色: 全新\n 显示屏尺寸: 3英寸\n 电池类型: 锂电池\n 售后服务: 店铺三包\n 颜色分类: 鳄鱼皮黑（德国代购） 爱马仕银(德国代购) 银色(德国代购) 炫红山羊皮(德国代购) 爱马仕黑(德国代购) 黑色(德国代购)\n 套餐: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五 套餐六 套餐七 套餐八\n 屏幕类型: 普屏\n 有效像素: 1600-2000万\n 防抖性能: 不防抖\n 高清摄像: 标清（640x480）\n 镜头类型: 伸缩式\n 适用场景: 专业旗舰\n 重量: 601g(含)-700g(含)\n        ', '0', '0', '1', '1');
INSERT INTO `product` VALUES ('141', '18', '400', '特价促销 佳能单反相机EOS5D MarkIII 佳能5D3 单机身国行联保', '14600.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1BJcfFVXXXXczXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '14600.00', '100', '\n 产品名称：Canon/佳能 5D Mark III单...\n 单反级别: 高级\n 屏幕尺寸: 3.2英寸\n 像素: 1800万\n 储存介质: CF卡 SD卡\n 电池类型: 锂电池\n 上市时间: 2012年\n 单反画幅: 全画幅\n 感光元件类型: CMOS\n 对焦点数: 61点\n 是否支持外接闪光灯: 支持\n 是否支持机身除尘: 支持\n 是否支持机身马达: 支持\n 传感器尺寸: 36mmx24mm\n 品牌: Canon/佳能\n 5D Mark III型号: 5D Mark III单机\n 曝光模式: 快门优先 光圈优先 手动曝光 AE自动曝光\n 影像处理类型: DIGIC 5+\n        ', '4', '0', '0', '0');
INSERT INTO `product` VALUES ('142', '18', '400', '未拆封 佳能70D大套 Canon/佳能 EOS 70D套机(18-200mm) 高端单反', '7480.00', 'https://img.alicdn.com/bao/uploaded/i3/T1PuiRFkXcXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '7480.00', '100', '\n 产品名称：Canon/佳能 EOS 70D套机(...\n 单反级别: 中级\n 屏幕尺寸: 3.0\n 像素: 1800万\n 储存介质: SD卡\n 电池类型: 锂电池\n 上市时间: 2013年\n 单反画幅: APS-C画幅\n 感光元件类型: CMOS\n 对焦点数: 19点\n 是否支持外接闪光灯: 支持\n 是否支持机身除尘: 支持\n 是否支持机身马达: 不支持\n 传感器尺寸: 22.5mmx15.0mm\n 品牌: Canon/佳能\n 曝光模式: 快门优先 光圈优先 手动曝光\n 影像处理类型: DIGIC 5+\n        ', '4', '0', '1', '1');
INSERT INTO `product` VALUES ('143', '18', '400', '【二年质保】Nikon/尼康 D7000 18-105套机VR D7000单反相机d7000', '4130.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1Tz5OJFXXXXblXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '4130.00', '100', '\n 产品名称：Nikon/尼康 D7000套机(1...\n 单反级别: 中级\n 屏幕尺寸: 3.0\n 像素: 1600万\n 储存介质: SD卡\n 电池类型: 锂电池\n 上市时间: 2010年\n 单反画幅: APS-C画幅\n 感光元件类型: CMOS\n 对焦点数: 39点\n 是否支持外接闪光灯: 支持\n 是否支持机身除尘: 支持\n 是否支持机身马达: 支持\n 传感器尺寸: 23.6mmx15.6mm\n 品牌: Nikon/尼康\n 曝光模式: 快门优先 光圈优先 手动曝光\n 影像处理类型: EXPEED 2\n        ', '9', '0', '0', '0');
INSERT INTO `product` VALUES ('144', '18', '400', 'JVC/杰伟世 GC-P100AC 高速摄像机 摄录一体机 单反高清DV家用', '5489.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1KOSpGVXXXXcrXXXXXXXXXXXX_!!2-item_pic.png_430x430q90.jpg', '5489.00', '100', '\n 产品名称：JVC/杰伟世 GC-P100AC\n 品牌: JVC/杰伟世\n JVC型号: GC-P100AC\n 存储介质: 闪存式DV\n 数码像素: 501-600万\n 光学变焦: 10倍\n 上市时间: 2013年\n 感光元件: CMOS\n 屏幕尺寸: 3\n 传感器尺寸: 1/2.3英寸\n 防抖性能: 双重防抖\n 是否触摸屏: 触摸屏\n 是否支持夜摄功能: 支持\n 摄像机类型: 高清摄像机\n 静态有效像素: 2000万\n 动态有效像素: 1280万\n 接口类型: HDMI USB AV 耳机接口\n 电池类型: 锂电池\n        ', '7', '0', '0', '0');
INSERT INTO `product` VALUES ('145', '18', '400', 'Nikon/尼康 1 V1套机(10-30mm) V1微单数码相机 全国联 保亏本甩', '1999.00', 'https://img.alicdn.com/bao/uploaded/i4/TB14NOSJFXXXXXcXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '1999.00', '100', '\n 产品名称：Nikon/尼康 1 V1套机(10...\n 品牌: Nikon/尼康\n 像素: 1000万\n 上市时间: 2011年\n 传感器尺寸: 13.2mmx8.8mm\n 感光元件类型: CMOS\n 存储类型: TF(microSD)卡\n 闪光灯及附件类型: 外接闪光灯\n 快门类型: 电子快门\n        ', '8', '0', '1', '0');
INSERT INTO `product` VALUES ('146', '18', '401', '【全新国行】佳能单反数码相机5DS R 佳能5DSR 单机身 5060万像素', '19888.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1mdcMKpXXXXbMXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '19588.00', '100', '\n 产品名称：Canon/佳能 EOS 5DS R单机\n 单反级别: 高级\n 屏幕尺寸: 3.2英寸\n 储存介质: CF卡 SD卡\n 电池类型: 锂电池\n 上市时间: 2015年\n 单反画幅: 全画幅\n 感光元件类型: CMOS\n 对焦点数: 61点\n 是否支持外接闪光灯: 支持\n 是否支持机身除尘: 支持\n 是否支持机身马达: 不支持\n 传感器尺寸: 36mmx24mm\n 品牌: Canon/佳能\n 曝光模式: 程序自动曝光\n        ', '16', '0', '1', '1');
INSERT INTO `product` VALUES ('147', '18', '401', '佳能750D单反相机机身可选配18-55/18-135 STM/18-200IS等多镜头', '5050.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1xukmKVXXXXctXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '5050.00', '100', '\n 是否支持机身除尘: 支持\n 是否支持机身马达: 不支持\n 传感器尺寸: 22.3mmx14.9mm\n 品牌: Canon/佳能\n        ', '29', '0', '0', '1');
INSERT INTO `product` VALUES ('148', '18', '401', 'Canon/佳能EOS 7D Mark II 18-135 STM 镜头7D2套机', '9100.00', 'https://img.alicdn.com/bao/uploaded/i4/TB14ecBGVXXXXaqXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '9100.00', '100', '\n 产品名称：Canon/佳能 EOS 7D Mark ...\n 单反级别: 高级\n 屏幕尺寸: 3英寸\n 像素: 2020万\n 储存介质: CF卡 SD卡\n 电池类型: 锂电池\n 上市时间: 2014年\n 单反画幅: APS-C画幅\n 感光元件类型: CMOS\n 对焦点数: 65点\n 是否支持外接闪光灯: 支持\n 是否支持机身除尘: 支持\n 是否支持机身马达: 支持\n 传感器尺寸: 22.4mmx15.0mm\n 品牌: Canon/佳能\n 曝光模式: 快门优先 光圈优先\n 影像处理类型: 双DIGIC 6\n        ', '27', '0', '0', '0');
INSERT INTO `product` VALUES ('149', '11', '402', '戎美【SH1028441】魅力双选 弹力布拼接 显瘦过膝长筒靴', '1240.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1qMFtKVXXXXb2XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '620.00', '100', '\n 靴筒内里材质: 羊皮\n 靴筒面材质: 多种材质拼接\n 鞋垫材质: 羊皮\n 品牌: RUMERE\n 货号: SH1028441\n 上市年份季节: 2015年冬季\n 帮面材质: 多种材质拼接\n 鞋面内里材质: 羊皮\n 鞋底材质: 橡胶\n 筒高: 长筒\n 鞋头款式: 圆头\n 后跟高: 中跟(3-5cm)\n 跟底款式: 粗跟\n 闭合方式: 套筒\n 颜色分类: 黑色羊皮(现货) 黑色羊猄(现货)\n 尺码: 35 36 37 38 39\n 适合季节: 冬季\n 适用对象: 青年（18-40周岁）\n        ', '367', '0', '1', '1');
INSERT INTO `product` VALUES ('150', '11', '402', '冬季内增高真皮短靴女磨砂平底马丁靴英伦风平跟加绒鞋棉靴', '399.00', 'https://gd1.alicdn.com/imgextra/i1/2611679577/TB2a5R7hVXXXXXdXpXXXXXXXXXX_!!2611679577.jpg_400x400.jpg', '128.00', '100', '\n 靴筒内里材质: 人造长毛绒\n 靴筒面材质: 牛反绒（磨砂皮）\n 鞋垫材质: 人造长毛绒\n 品牌: 小红人\n 货号: 1556\n 上市年份季节: 2015年冬季\n 风格: 英伦\n 帮面材质: 牛反绒（磨砂皮）\n 鞋面内里材质: 人造长毛绒\n 皮质特征: 磨砂\n 鞋底材质: TPR(牛筋）\n 靴款品名: 马丁靴\n 筒高: 短筒\n 鞋头款式: 圆头\n 后跟高: 低跟(1-3cm)\n 跟底款式: 平底\n 闭合方式: 后拉链\n 流行元素: 坡跟 防水台\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 黑色厚绒 卡其色厚绒 黑色 卡其色\n 尺码: 35 36 37 38 39 40\n 图案: 纯色\n 适合季节: 冬季\n        ', '7903', '0', '1', '0');
INSERT INTO `product` VALUES ('151', '28', '403', '香港优之良品卡通啫喱糖礼盒正品创意零食喜糖水果软糖果精美礼物', '155.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1DsxfJXXXXXbXaXXXXXXXXXXX_!!2-item_pic.png_400x400.jpg', '95.80', '100', '\n 生产许可证编号: 441917010448\n 产品标准号: \n 厂名: 东莞市中港食品有限公司\n 厂址: 东莞市东坑镇寮边头村桃源工业区\n 厂家联系方式: 00852-2770 2611\n 配料表: 糖、葡萄糖、果汁、明胶、植物油、调味料、食用色素\n 储藏方法: 放置于干燥阴凉处\n 保质期: 300\n 食品添加剂: 调味料，食用色素\n 产品: 软糖\n 净含量: 250g\n 包装方式: 包装\n 包装种类: 盒装\n 商品条形码: 4892590109685\n 品牌: AJI ICHIBAN/优の良品\n 系列: 卡通糖果\n 是否含糖: 含糖\n 产地: 中国大陆\n 省份: 广东省\n 城市: 东莞市\n        ', '89', '0', '1', '1');
INSERT INTO `product` VALUES ('152', '28', '403', '休闲美食昌林牌坚果炒货手剥巴西松子30g*2小包零食小吃特产美食', '58.80', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1uuR.IXXXXXcOXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '26.80', '100', '\n 生产许可证编号: 330118010202\n 产品标准号: \n 厂名: 杭州昌林炒货食品有限公司\n 厂址: 杭州市萧山区蜀山街道章潘桥村(姚家畈自然村)\n 厂家联系方式: 13968032992\n 配料表: 巴西松子\n 储藏方法: \n 保质期: 240\n 食品添加剂: 无\n 净含量: 60g\n 包装方式: 包装\n 包装种类: 袋装\n 品牌: 昌林\n 产地: 中国大陆\n 省份: 浙江省\n 套餐份量: 1人份\n 套餐周期: 1周\n 配送频次: 1周2次\n 是否新货: 是\n 热销系列: 松子\n 零食种类: 巴西松子\n        ', '86', '0', null, '0');
INSERT INTO `product` VALUES ('153', '28', '403', '菲丽嘟瑞典进口糖果心形创意零食水果软糖儿童休闲食品无添加糖果', '42.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1M_egGVXXXXXpXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '38.00', '100', '\n 生产许可证编号: \n 产品标准号: \n 厂名: 菲丽嘟（上海）贸易有限公司\n 厂址: 上海市黄浦区瑞金南路1号8D\n 厂家联系方式: 021-64225727\n 配料表: 白砂糖，果葡糖浆，明胶，苹果酸，食用香料，胭脂虫红\n 储藏方法: 请置于阴凉干燥处，避免阳光直射，避免重压\n 保质期: 730\n 食品添加剂: 果葡糖浆 明胶 苹果酸\n 产品: 软糖\n 净含量: 180g\n 包装方式: 包装\n 包装种类: 桶装\n 商品条形码: 6928924100122\n 品牌: fillidutt/菲丽嘟\n 是否含糖: 含糖\n 产地: 其它国家\n 口味: 莓果味\n        ', '86', '0', '0', '1');
INSERT INTO `product` VALUES ('154', '31', '404', '男士旅行包手提斜挎包旅游休闲男包 韩版商务出差单肩包行李包皮', '276.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1X5AOLXXXXXacXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '149.00', '100', '\n 上市时间: 2015年秋季\n 货号: ZF6629\n 适用对象: 青年\n 销售渠道类型: 纯电商(只在线上销售)\n 性别: 男\n 质地: PU\n 材质工艺: 软面\n 提拎部件类型: 软把\n 内部结构: 拉链暗袋 手机袋 证件袋\n 流行元素: 拼接\n 图案: 纯色\n 颜色分类: 咖啡 黑色\n 有无拉杆: 无\n 是否可折叠: 否\n 适用场景: 旅行\n 包袋大小: 中\n 品牌: Zerofront\n 风格: 欧美时尚\n 旅行袋类型: 提包型\n 肩带样式: 单根\n 里料材质: 涤棉\n 箱包尺寸: 450mm*250mm*145mm\n        ', '702', '0', null, '1');
INSERT INTO `product` VALUES ('155', '23', '405', '美国B.Toys大嘴猫钢琴儿童电子琴玩具宝宝早教音乐琴带麦克风录音', '388.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1xPI5KpXXXXbhXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '248.00', '100', '\n 品牌: B.Toys\n 适用年龄: 3岁\n 类型: 婴幼儿玩乐型\n 是否有导购视频: 无\n        ', '111', '0', '1', '0');
INSERT INTO `product` VALUES ('156', '33', '406', '思慕尔 专业PC商务登机箱 万向轮 托运拉杆箱 超轻差旅手提箱16寸', '528.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1fJR4FVXXXXbFXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '528.00', '100', '\n 尺寸: 16寸高端商务款 质保三年\n 是否有扩展层: 是\n 锁的类型: TSA密码锁\n 货号: JL118-2B\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: Smooire\n 质地: PC\n 性别: 男\n 图案: 纯色\n 颜色分类: 酒红色 银色拉丝 黑色拉丝 蓝色拉丝\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 商务/OL\n        ', '10', '0', null, '1');
INSERT INTO `product` VALUES ('157', '33', '406', 'joinwalker新款特价拉杆箱24寸托运旅行箱行李箱万向轮TSA海关锁', '368.00', 'https://gd2.alicdn.com/bao/uploaded/i2/12675030780382451/T1XqtdXz4kXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '368.00', '100', '\n 尺寸: 24寸\n 货号: JWT-9113\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: JOIN WALKER\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 珠光黑 珠光蓝 珠光紫\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 拉链暗袋 夹层拉链袋\n 里料材质: 涤纶\n 风格: 复古\n        ', '10', '0', '0', '1');
INSERT INTO `product` VALUES ('159', '33', '406', '思慕尔纯PC拉杆箱 手拉旅行箱子 登机托运皮箱 旅行箱万向轮20寸', '498.00', 'https://gd2.alicdn.com/bao/uploaded/i2/18024029414712172/T1Qk3xXfBgXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '498.00', '100', '\n 尺寸: 20寸\n 货号: JL-911-2\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: Smooire\n 质地: PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 桔色 深蓝色\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 拉链暗袋 证件袋 夹层拉链袋 相机插袋\n 里料材质: 涤棉\n 风格: 商务/OL\n        ', '0', '0', null, '0');
INSERT INTO `product` VALUES ('160', '33', '407', '高档镁铝合金框旅行箱20登机箱子24/26/29寸行李箱男女托运拉杆箱', '476.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1Xo8sJVXXXXXPXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '358.00', '100', '\n 尺寸: 20寸【高档镁铝框-终身保修】 22寸【高档镁铝框-终身保修】 24寸【高档镁铝框-终身保修】 26寸【高档镁铝框-终身保修】 29寸【高档镁铝框-终身保修】 终身免费保修/赠运费险 限时特价包邮/极速发货\n 适用对象: 青年\n 锁的类型: TSA密码锁\n 货号: 0805\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 品牌: ZD/袋黛安\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 时尚铝框-银色 时尚铝框-蓝色 时尚铝框-黑色 时尚铝框-红色 时尚铝框-钛金色 时尚铝框-紫色 时尚铝框-玫瑰金 高档铝框-黑色 高档铝框-钛金色 高档铝框-蓝色 高档铝框-红色 高档铝框-银色 高档铝框-玫瑰金 经典铝框-气质银 经典铝框-宝石蓝 经典铝框-公主粉 经典铝框-坚毅黑 经典铝框-玫红色 经典铝框-土豪金 时尚拉链款-红色 时尚拉链款-银色 时尚拉链款-黑色 时尚拉链款钛金色 时尚拉链款-蓝色\n 成色: 全新\n 闭合方式: 锁扣\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 商务/OL\n        ', '2119', '0', '1', '1');
INSERT INTO `product` VALUES ('161', '33', '407', '袋黛安高档旅行箱铝框拉杆箱万向轮箱20/26/29寸行李箱女男旅行箱', '796.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1rDivJVXXXXaraXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '398.00', '100', '\n 尺寸: 20寸【高级平框-终身保修】 22寸【高级平框-终身保修】 24寸【高级平框-终身保修】 26寸【高级平框-终身保修】 29寸【高级平框-终身保修】\n 是否有扩展层: 否\n 适用对象: 青年\n 锁的类型: TSA密码锁\n 货号: 8002\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: ZD/袋黛安\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 坚毅黑【8002】 气质银【8002】 天使白【8002】 紫罗兰【8002】 玫瑰红【8002】 香槟色【8002】 气质银【017】 坚毅黑【017】 玫瑰红【017】 土豪金【017】 公主粉【017】 冰抹茶【017】 紫罗兰【017】 法拉利红【017】 宝石蓝【017】\n 成色: 全新\n 闭合方式: 锁扣\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 相机插袋\n 里料材质: 涤纶\n 风格: 商务/OL\n        ', '10', '0', null, '1');
INSERT INTO `product` VALUES ('162', '33', '407', '袋黛安铝框拉杆箱万向轮20/24寸旅行箱男女硬箱行李箱包登机箱子', '856.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB184VzJVXXXXXWXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '342.40', '100', '\n 尺寸: 20寸 24寸 29寸\n 货号: 9012\n 是否带锁: 是\n 滚轮样式: 万向轮\n 品牌: ZD/袋黛安\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 黑色-9012 红色-9012 金色-9012 银色-9012\n 成色: 全新\n 内部结构: 拉链暗袋 手机袋 证件袋 \n        ', '2', '0', '1', '0');
INSERT INTO `product` VALUES ('163', '33', '407', '包邮特价正品万向轮箱子20旅行箱24拉杆箱行李箱包28寸男女登机箱', '336.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1oG6mKpXXXXctXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '238.00', '100', '\n尺寸: 20寸【拉链款】 24寸【拉链款】 28寸【拉链款】 20寸【高档铝框款】 22寸【高档铝框款】 24寸【高档铝框款】 26寸【高档铝框款】 28寸【高档铝框款】 海关锁！终身保修！专柜正品！\n 适用对象: 青年\n 货号: 8001\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: maito\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 天使白（送十） 坚毅黑（送十） 公主粉（送十） 富贵紫（送十） 巧克力（送十） 印度红（送十） 天空蓝（送十） 气质银（送十） 玫瑰红（送十） 酥杏红（送十） 大黄蜂（送十） 芥末绿（送十） 冰抹茶（送十） 桃红色（送十） 白金框（送十） 香槟金(送十） 湖蓝色(送十） 紫罗兰(送十）\n 成色: 全新\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 时尚潮流\n        ', '190', '0', null, '1');
INSERT INTO `product` VALUES ('164', '33', '407', '袋黛安 正品卡通拉杆箱万向轮密码箱24寸韩国行李箱拉杆女旅行箱 ', '456.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1WmJhLpXXXXabapXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '456.00', '100', '\n 尺寸: 20寸专柜正品【终身质保】 22寸专柜正品【终身质保】 24寸专柜正品【终身质保】 26寸专柜正品【终身质保】 28寸专柜正品【终身质保】 29寸专柜正品【终身质保】\n 适用对象: 青年\n 锁的类型: TSA密码锁\n 货号: 8036\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 飞机轮\n 是否配包: 否\n 品牌: ZD/袋黛安\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 卡通动漫\n 颜色分类: 橙配-动物园 黑配-动物园 白天黑夜 黑天白夜 公主粉 坚毅黑 法拉利红 大黄蜂 土豪金 冰抹茶 玫红色. 气质银 紫罗兰. 宝石蓝\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 时尚潮流\n        ', '651', '0', '1', '0');
INSERT INTO `product` VALUES ('165', '33', '408', 'Artmi2015秋冬新款 印花铝框万向轮拉杆旅行箱硬箱24寸托运箱女潮', '628.00', 'https://img.alicdn.com/imgextra/i3/823258756/TB2OyOTipXXXXcIXpXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg', '432.00', '100', '\n 上市时间: 2015年秋季\n 尺寸: 24寸\n 箱包硬度: 硬\n 适用对象: 青年\n 货号: ADX0006\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: Artmi\n 质地: ABS+PC\n 性别: 女\n 图案: 动物图案\n 颜色分类: 花兔瓷白\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 夹层拉链袋\n 里料材质: 涤纶\n 风格: 小清新\n        ', '4', '0', null, '0');
INSERT INTO `product` VALUES ('166', '33', '408', 'Artmi2015新品 旅行箱简易万向轮女铝框拉杆箱登机箱软箱托运箱潮', '1278.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1JDJKIpXXXXXpXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '639.00', '100', '\n 上市时间: 2014年秋冬季\n 尺寸: 24寸 20寸\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: AVX0001\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: Artmi\n 质地: PVC\n 性别: 女\n 图案: 几何图案\n 颜色分类: (24寸)绅士棕 (20寸)绅士棕\n 闭合方式: 拉链\n 内部结构: 夹层拉链袋\n 风格: 欧美\n        ', '0', '0', '1', '1');
INSERT INTO `product` VALUES ('167', '33', '408', 'Artmi2015新品 复古休闲时尚拉杆箱万向轮女行李箱旅行箱24寸托运', '595.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1a0ypIpXXXXaNXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '425.00', '100', '\n 上市时间: 2015年夏季\n 尺寸: 24寸\n 箱包硬度: 硬\n 适用对象: 青年\n 销售渠道类型: 商场同款(线上线下都销售)\n 货号: XDX0008\n 有无拉杆: 有\n 是否带锁: 否\n 滚轮样式: 万向轮\n 是否配包: 否\n 品牌: Artmi\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 动物图案\n 颜色分类: 萌宠褐\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 夹层拉链袋\n 里料材质: 涤纶\n 风格: 卡通\n        ', '0', '0', null, '1');
INSERT INTO `product` VALUES ('168', '33', '409', '浪漫之旅拉杆箱旅行箱男女万向轮潮pc硬登机行李箱包20 22 24 26', '318.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1eVDiLXXXXXXJXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '159.00', '100', '\n 尺寸: 20寸 22寸【推荐】 24寸【推荐】 26寸【推荐】 28寸【超大，怕大慎拍】\n 适用对象: 青年\n 锁的类型: TSA密码锁\n 货号: LM-031B\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 品牌: 浪漫之旅\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 橙黄色 反射银(带挂钩) 土豪金(带挂钩) 枚红色(带挂钩) 果绿色(带挂钩) 天蓝色(带挂钩) 土豪金(带扩展层) 反射银(带扩展层) 枚红色(带扩展层) 可爱粉(带扩展层) 大红色(带扩展层) 反射银(高端品味) 土豪金(高端品味) 神秘黑(高端品味) 宝石蓝(高端品味) 经典红(高端品味) 可爱粉(高端品味) 银色 黑色 粉红色 红色 金色 绿色 紫色\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 时尚潮流\n        ', '1012', '0', '1', '0');
INSERT INTO `product` VALUES ('169', '33', '409', '浪漫之旅商务拉杆箱铝框行李箱29旅行箱20登机箱22寸24双密码锁26', '1190.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1diulLpXXXXcNXXXXXXXXXXXX_!!2-item_pic.png_400x400.jpg', '158.00', '100', '\n 尺寸: 20寸【买一送十终身保修】 22寸【买一送十终身保修】 24寸【买一送十终身保修】 26寸【买一送十终身保修】 28寸【买一送十终身保修】 29寸【买一送十终身保修】\n 适用对象: 青年\n 锁的类型: TSA密码锁\n 货号: LM-033#\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 品牌: 浪漫之旅\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 炫酷黑（锁扣式） 天空蓝（锁扣式） 可爱粉（锁扣式） 奢华银（锁扣式） 香槟金（锁扣式） 经典红（锁扣式） 神秘黑（锁扣式） 反射银（锁扣式） 土豪金（锁扣式） 经典黑（锁扣式） 大红色（锁扣式） 宝石蓝（锁扣式） 公主粉（锁扣式） 抹茶绿（锁扣式） 枚红色（锁扣式） 紫罗兰（锁扣式） 流光银（锁扣式） 古铜色（锁扣式） 深蓝色（锁扣式） 黑镍色（锁扣式） 酒红色（锁扣式） 玫瑰金（锁扣式） 银色 黑色 粉红色 红色 金色 蓝色\n 成色: 全新\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 商务/OL\n        ', '2585', '0', null, '1');
INSERT INTO `product` VALUES ('170', '33', '409', '浪漫之旅母箱20寸男行李箱24寸女拉杆箱包时尚顽皮熊旅行箱28寸', '727.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1T_E7KVXXXXb8aXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '258.00', '100', '\n 尺寸: 20寸【登机箱】 24寸【推荐】 28寸【超大，怕大慎拍】\n 是否有扩展层: 是\n 适用对象: 青年\n 锁的类型: TSA密码锁\n 货号: LM-002\n 有无拉杆: 有\n 是否带锁: 是\n 滚轮样式: 万向轮\n 品牌: 浪漫之旅\n 质地: ABS+PC\n 性别: 男女通用\n 图案: 纯色\n 颜色分类: 反射银 枚红色 可爱粉 芥末绿 草绿色 流光银 高贵紫 樱花粉 大红色 绚丽紫 神秘黑 末绿色 可爱蓝 炫彩色 粉白条色\n 成色: 全新\n 闭合方式: 拉链\n 内部结构: 拉链暗袋 手机袋 证件袋 夹层拉链袋 电脑插袋 相机插袋\n 里料材质: 涤纶\n 风格: 时尚潮流\n        ', '21', '0', '1', '0');
INSERT INTO `product` VALUES ('171', '5', '410', '2015新款冬季儿童装秋冬装男童卫衣加绒加厚三件套运动套装潮衣服', '599.00', 'https://img.alicdn.com/imgextra/i1/723795671/TB2dR5UhVXXXXarXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg', '149.00', '100', '\n 上市年份季节: 2015年冬季\n 品牌: 朵道尔\n 安全等级: B类\n 材质成分: 棉95% 聚酯纤维5%\n 货号: DDE15JD06\n 适用性别: 男\n 颜色分类: JD05藏蓝色 JD05暗红色 JD06藏蓝色 JD06深灰色\n 参考身高: 120码建议105身高左右 130码建议115身高左右 140码建议125身高左右 150码建议135身高左右 160码建议145身高左右\n 模特实拍: 实拍有模特\n 适用场景: 上学送礼\n 按关系送礼: 孩子\n 是否带帽子: 有帽不可拆\n 组合形式: 长袖+裤子\n 面料: 棉混纺布\n 厚薄: 加厚\n 适用季节: 冬季\n 风格: 运动\n 衣门襟: 套头\n 图案: 卡通动漫\n 件数: 3件\n        ', '850', '0', null, '1');
INSERT INTO `product` VALUES ('172', '5', '410', '2015新款冬季儿童装男童冬装加绒牛仔外套中长款秋冬款夹克上衣潮', '399.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1tlo0KXXXXXbAXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '99.90', '100', '\n 品牌: 朵道尔\n 安全等级: B类\n 材质成分: 棉68% 聚酯纤维19.5% 聚氨酯弹性纤维(氨纶)0.8% 其他11.7%\n 货号: DDE15YD07\n 适用性别: 男\n 颜色分类: YD07蓝色【现货直供中】\n 参考身高: 110码建议100身高左右 120码建议110身高左右 130码建议120身高左右 140码建议130身高左右 150码建议140身高左右 160码建议150身高左右\n 模特实拍: 实拍有模特\n 是否带帽子: 有帽不可拆\n 衣门襟: 单排扣\n 领型: 圆领\n 面料: 牛仔布\n 适用季节: 冬季\n 风格: 休闲\n 图案: 其他\n 厚薄: 加厚\n        ', '2', '0', '1', '0');
INSERT INTO `product` VALUES ('173', '5', '410', '男童春装外套2016新款儿童装春季牛仔外套夹克春秋款小西装上衣潮', '399.00', 'https://img.alicdn.com/imgextra/i1/723795671/TB2QcnMdVXXXXa_XXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg', '89.90', '100', '\n 上市年份季节: 2016年春季\n 内胆类型: 棉内胆\n 安全等级: B类\n 材质成分: 棉64.2% 聚酯纤维35% 其他0.8%\n 颜色分类: YQ34蓝色上衣(新品现货)\n 货号: DDE15YQ34\n 适用性别: 男\n 参考身高: 110码建议100身高左右 120码建议110身高左右 130码建议120身高左右 140码建议130身高左右 150码建议140身高左右 160码建议150身高左右\n 模特实拍: 实拍有模特\n 面料: 牛仔布\n 图案: 条纹\n 风格: 休闲\n 厚薄: 常规\n 适用季节: 春秋\n 衣门襟: 单排扣\n 品牌: 朵道尔\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('174', '5', '410', '2015新款冬季儿童装4套装5女童棉衣卫衣三件套6加厚7秋冬装8岁9潮', '450.00', 'https://img.alicdn.com/imgextra/i2/723795671/TB25en1jXXXXXXeXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg', '139.80', '100', '\n 品牌: 朵道尔\n 安全等级: B类\n 材质成分: 聚酯纤维90% 棉8% 聚氨酯弹性纤维(氨纶)2%\n 货号: DDE14TD05\n 适用性别: 女\n 颜色分类: TD08酒红色 TD08大红色 TD05酒红色 TD05大红色 TD05紫色\n 参考身高: 110码建议100身高左右 120码建议110身高左右（酒红色19号发货） 130码建议120身高左右 140码建议130身高左右 150码建议140身高左右 160码建议150身高左右（酒红和大红都19号发货）\n 模特实拍: 实拍有模特\n 适用场景: 上学送礼\n 按关系送礼: 孩子\n 是否带帽子: 无\n 组合形式: 长袖+裤子\n 面料: 棉混纺布\n 厚薄: 加厚\n 适用季节: 冬季\n 风格: 休闲\n 衣门襟: 单排扣\n 图案: 纯色\n 件数: 3件\n        ', '1632', '0', null, '1');
INSERT INTO `product` VALUES ('175', '5', '410', '2015儿童装冬季女童毛衣加厚针织衫套头高领打底衫小孩线衣秋冬装', '288.00', 'https://img.alicdn.com/imgextra/i3/723795671/TB2OgaRipXXXXagXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg', '78.00', '100', '\n 品牌: 朵道尔\n 安全等级: B类\n 材质成分: 棉88% 锦纶10.2% 聚氨酯弹性纤维(氨纶)1.8%\n 货号: DDE15HQ06\n 适用性别: 女\n 颜色分类: TQ29黑色 HQ06美酒红（现货直供中！） HQ06宝石蓝（现货直供中！）\n 参考身高: 110码建议3-4岁100身高左右 120码建议110身高左右 130码建议120身高左右 140码建议130身高左右 150码建议140身高左右 160码建议150身高左右\n 模特实拍: 实拍有模特\n 毛线粗细: 细毛线\n 厚薄: 常规\n 针织面料: 棉\n 风格: 百搭\n 衣门襟: 套头\n 领型: 高领\n 图案: 纯色\n 是否带帽子: 无\n 袖长: 长袖\n        ', '29', '0', '1', '1');
INSERT INTO `product` VALUES ('176', '5', '410', '女童春装2016新款外套儿童装长袖牛仔外套春秋小女孩春季上衣春款', '223.00', 'https://img.alicdn.com/imgextra/i3/723795671/T2LcitXz8XXXXXXXXX_!!723795671.jpg_430x430q90.jpg', '69.90', '100', '\n 品牌: 朵道尔\n 安全等级: B类\n 材质成分: 棉65% 聚酯纤维35%\n 货号: DDE15YC07\n 适用性别: 女\n 颜色分类: YC07蓝色（薄款） YC07蓝色（加厚不倒绒）现货\n 参考身高: 100码建议85身高左右 110码建议95身高左右 120码建议105身高左右 130码建议115身高左右 140码建议125身高左右\n 模特实拍: 实拍有模特\n 是否带帽子: 无\n 衣门襟: 单排扣\n 领型: 方领\n 面料: 牛仔布\n 适用季节: 春秋\n 风格: 休闲\n 图案: 其他\n 厚薄: 常规\n        ', '3', '0', null, '0');
INSERT INTO `product` VALUES ('177', '5', '411', 'snoopy童装儿童春装男童加绒运动套装中小童春季起绒卫衣两件套', '348.00', 'https://img.alicdn.com/imgextra/i3/1734379566/TB2i6dYjFXXXXaHXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg', '109.00', '100', '\n 品牌: Snoopy/史努比\n 安全等级: A类\n 货号: 9BW51011\n 适用性别: 男\n 颜色分类: 550宝蓝 430绿 130红\n 参考身高: 90cm 100cm 110cm 120cm 130cm\n 模特实拍: 实拍无模特\n 适用场景: 学习奖励\n 按关系送礼: 孩子\n 是否带帽子: 无\n 组合形式: 长袖+裤子\n 面料: 混纺\n 厚薄: 加绒\n 适用季节: 春秋\n 风格: 百搭\n 衣门襟: 套头\n 图案: 卡通动漫\n 件数: 2件\n        ', '325', '0', '1', '1');
INSERT INTO `product` VALUES ('178', '5', '411', '史努比儿童轻薄羽绒服', '538.00', 'https://img.alicdn.com/bao/uploaded/i3/TB15DuBLpXXXXaYXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '159.00', '100', '\n 100% 正品：\n海外直采：合作商家直接从海外或从国内一级经销商采货。\n免费退货（天猫国际商家适用天猫国际商户服务协议及天猫国际规则）：\n7天任退：收到货7天内（以物流签收单时间为准）可发起无理由免费退货，要求商品有完整的外包装、配件、吊牌等。\n无需邮费：根据不同地区，退货时提供 5-20元的邮费补偿。\n30天包退（仅限美妆商品）：美妆商品支持30天无理由包退，包括开封使用后（高单价的奢侈品除外，注意页面说明）。\n品牌维修（仅限手表商品）：支持品牌维修服务，聚名品购买的手表在中国境内享受对应品牌全球联保点的保养服务。\n全场包邮：\n境内免邮：所有聚名品商品均免邮费，除收货地为港澳台和国外地区，这些地区按商家自定义补邮费说明执行。\n        ', '785', '0', '1', '0');
INSERT INTO `product` VALUES ('179', '5', '411', 'snoopy童装儿童春装外套男童女童春季双面摇粒绒绒衫短款上衣外套', '178.00', 'https://img.alicdn.com/imgextra/i4/1734379566/TB2QmhZjFXXXXaAXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg', '69.00', '100', '\n 品牌: Snoopy/史努比\n 材质成分: 聚酯纤维100%\n 货号: 9BW50742\n 适用性别: 中性\n 颜色分类: 130红 230橙 550宝蓝 520粉蓝 090玫红\n 参考身高: 90cm 100cm 110cm 120cm 130cm\n 模特实拍: 实拍有模特\n 是否带帽子: 无\n 衣门襟: 拉链衫\n 领型: 圆领\n 适用季节: 不限季节\n 风格: 休闲\n 图案: 卡通动漫\n 厚薄: 常规\n        ', '584', '0', null, '1');
INSERT INTO `product` VALUES ('180', '7', '177', '2015春秋季韩版N字母运动休闲鞋女鞋厚底单鞋马蹄跟学生跑步鞋潮', '389.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1PjqxHXXXXXcYXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '79.00', '100', '\n 流行卖点 风格：韩版\n 流行元素：交叉绑带 拼色 粗跟\n 图案：纯色\n \n适用 适用对象：青年（18-40周岁）\n 适用场景：休闲\n \n基础信息 鞋垫材质：布\n 品牌：稳步\n 鞋底材质：橡胶\n 开口深度：中口\n 鞋头款式：圆头\n 跟底款式：内增高\n 闭合方式：系带\n 鞋制作工艺：胶粘鞋\n 款式：单鞋\n        ', '5', '0', '1', '1');
INSERT INTO `product` VALUES ('181', '7', '177', '秋季男鞋跑步鞋男士运动休闲鞋男女学生情侣耐磨透气减震弹簧潮鞋', '215.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1cZaXLpXXXXc3XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '119.00', '100', '\n 上市年份季节: 2015年夏季\n 货号: 5607\n 销售渠道类型: 商场同款(线上线下都销售)\n 鞋垫材质: 布\n 品牌: 稳步\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 网布\n 鞋面内里材质: 网纱\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 拼色\n 流行元素: 车缝线\n 风格: 青春潮流\n 细分风格: 韩版\n 场合: 运动休闲\n 季节: 夏季\n 颜色分类: 梅红女款 灰粉女款 黑绿女款 黑桔女款 黑粉女款 黑桔男款 黑蓝男款 黑色男款\n 尺码: 36 37 38 39 40 41 42 43 44\n 款式: 运动休闲鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 板鞋\n        ', '8', '0', null, '1');
INSERT INTO `product` VALUES ('182', '7', '177', '春季男士透气耐磨运动休闲鞋男鞋学生轻便网面跑步鞋系带圆头板鞋', '160.00', 'https://img.alicdn.com/imgextra/i1/2143043876/TB2mJjEjXXXXXXZXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg', '89.00', '100', '\n 上市年份季节: 2016年春季\n 货号: 51216\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋垫材质: 布\n 鞋跟高: 中跟(3-5cm)\n 品牌: 稳步\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 网布\n 鞋面内里材质: 布\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 运动休闲\n 场合: 运动休闲\n 季节: 春秋\n 颜色分类: 深兰 浅灰 黑色 大红 宝兰\n 尺码: 40 41 42 43 44\n 款式: 运动休闲鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 板鞋\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('183', '7', '178', '秋冬季潮男运动鞋青少年男款学生跑步鞋韩版男生休闲鞋初中生男鞋', '138.00', 'https://img.alicdn.com/imgextra/i4/2244471764/TB2_oRPgFXXXXX6XXXXXXXXXXXX_!!2244471764.jpg_430x430q90.jpg', '65.00', '100', '\n 上市年份季节: 2015年秋季\n 货号: T0E07\n 销售渠道类型: 天猫独家(只在天猫销售)\n 鞋垫材质: 布\n 鞋跟高: 低跟(1-3cm)\n 品牌: TNJ\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: PU\n 鞋面内里材质: 布\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 厚底\n 图案: 拼色\n 流行元素: 车缝线\n 风格: 运动\n 场合: 运动休闲\n 季节: 春秋\n 颜色分类: 黑色 蓝色\n 尺码: 39 40 41 42 43 44\n 款式: 运动休闲鞋\n 功能: 减震\n 适用对象: 青年（18-40周岁） 儿童（18周岁以下）\n 低帮鞋品名: 运动户外鞋\n        ', '27', '0', null, '0');
INSERT INTO `product` VALUES ('184', '7', '178', '秋冬季男版高帮运动鞋秋季高帮鞋男生冬鞋板鞋潮男休闲鞋气垫男鞋', '158.00', 'https://img.alicdn.com/imgextra/i2/TB1U2bbKXXXXXX6XFXXYXGcGpXX_M2.SS2_430x430q90.jpg', '75.00', '100', '\n 上市年份季节: 2015年秋季\n 品牌: TNJ\n 帮面内里材质: 布\n 款式: 高帮板鞋\n 货号: T0E05\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋垫材质: 布\n 鞋跟高: 低跟(1-3cm)\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋面材质: PU\n 帮面材质: PU\n 鞋底材质: 橡胶\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 厚底\n 鞋面内里材质: 布\n 图案: 拼色\n 流行元素: 车缝线\n 颜色分类: 红色 黄色 白色\n 尺码: 39 40 41 42 43 44\n 场合: 运动休闲\n 风格: 运动\n 季节: 春秋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁） 儿童（18\n        ', '17', '0', null, '1');
INSERT INTO `product` VALUES ('185', '7', '179', '秋冬季保暖运动休闲鞋男椰子红鞋厚底跑步鞋增高板鞋男学生潮鞋子', '153.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1M31BJVXXXXcMXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '79.00', '100', '\n 上市年份季节: 2015年秋季\n 货号: J01\n 销售渠道类型: 天猫独家(只在天猫销售)\n 鞋垫材质: PU\n 鞋跟高: 低跟(1-3cm)\n 品牌: zelldoo/哲度\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: PU\n 真皮材质工艺: 粒面皮\n 鞋面内里材质: PU\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 厚底\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 运动休闲\n 场合: 运动休闲\n 季节: 春秋\n 颜色分类: J01红色 J01白色 J01黑色\n 尺码: 39 40 41 42 43 44\n 款式: 板鞋\n 功能: 增高\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 板鞋\n        ', '10', '0', '1', '1');
INSERT INTO `product` VALUES ('186', '7', '224', '特步官方正品男鞋秋冬季跑步鞋新款时尚百搭舒适男子休闲鞋运动鞋', '339.00', 'https://img.alicdn.com/bao/uploaded/i2/TB12q7iJVXXXXclXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '179.00', '100', '\n 产品名称：XTEP/特步 984119119517\n 是否商场同款: 是\n 颜色分类: 红黑 黑黄\n 款号: 984119119517\n 品牌: XTEP/特步\n 上市时间: 2015年秋季\n 吊牌价: 339\n 性别: 男子\n 帮面材质: 合成革\n 外底材料: 天然橡胶\n 适合路面: 小道 公路 跑道\n 功能: 减震 防滑 耐磨 轻便\n 鞋码: 39 40 41 42 43 44 45\n 闭合方式: 系带\n 运动系列: 运动生活系列\n 是否瑕疵: 否\n        ', '5033', '0', null, '1');
INSERT INTO `product` VALUES ('187', '7', '224', '特步正品男子篮球鞋春季 新品防滑耐磨减震篮球战靴时尚篮球鞋', '339.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1O3KXLpXXXXXoXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '199.00', '100', '\n 产品名称：XTEP/特步 985419129663\n 是否商场同款: 否\n 颜色分类: 红黄 黑红\n 款号: 985419129663\n 品牌: XTEP/特步\n 上市时间: 2015年夏季\n 吊牌价: 399\n 性别: 男子\n 鞋帮高度: 高帮\n 帮面材质: 合成革\n 外底材料: 橡胶+PHYLON\n 适合场地: 室外水泥地 室内地板\n 功能: 减震 防滑 耐磨 包裹性 支撑 平衡 抗冲击 增高\n 鞋码: 40 41 42 43 44 45\n 是否瑕疵: 否\n 运动系列: 篮球场地鞋\n        ', '593', '0', '1', '1');
INSERT INTO `product` VALUES ('188', '7', '224', '特步官方男鞋正品新款室内外实战缓震耐磨防滑护踝男子篮球鞋', '339.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1c0JhJpXXXXajXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '199.00', '100', '\n 产品名称：XTEP/特步 986119129796\n 是否商场同款: 否\n 颜色分类: 白黑 白黄\n 款号: 986119129796\n 品牌: XTEP/特步\n 上市时间: 2014年春季\n 吊牌价: 339.00\n 性别: 男子\n 鞋帮高度: 高帮\n 帮面材质: 人造革+织物\n 外底材料: MD+RB+ESS\n 适合场地: 室外水泥地 室内地板\n 运动鞋科技: 缓震胶\n 功能: 减震 防滑 耐磨 包裹性 支撑 平衡\n 鞋码: 39 40 41 42 43 44 45\n 是否瑕疵: 否\n 运动系列: 篮球系列\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('189', '7', '224', '正品篮球鞋男秋新款中帮球鞋耐磨防滑运动战靴高帮', '459.00', 'https://img.alicdn.com/bao/uploaded/i4/TB18nPwIpXXXXXYXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '239.00', '100', '\n 产品名称：XTEP/特步 986219129601\n 是否商场同款: 否\n 颜色分类: 兰 红黑\n 款号: 986219129601\n 品牌: XTEP/特步\n 上市时间: 2014年夏季\n 吊牌价: 459\n 性别: 男子\n 鞋帮高度: 高帮\n 帮面材质: 超纤合成革+网布\n 外底材料: 橡胶大底+PHYLON中底\n 适合场地: 室外水泥地 室内地板\n 运动鞋科技: 其他\n 功能: 减震 防滑 耐磨 支撑 抗冲击\n 鞋码: 40 41 42 43 44 45\n 是否瑕疵: 否\n 运动系列: 常规篮球鞋\n        ', '8', '0', null, '1');
INSERT INTO `product` VALUES ('190', '7', '224', '特步官方正品时尚百搭男款篮球鞋舒适休闲轻便运动鞋耐磨篮球鞋', '319.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1oTGrLpXXXXaCXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '179.00', '100', '\n 产品名称：XTEP/特步 986219129601\n 是否商场同款: 否\n 颜色分类: 兰 红黑\n 款号: 986219129601\n 品牌: XTEP/特步\n 上市时间: 2014年夏季\n 吊牌价: 459\n 性别: 男子\n 鞋帮高度: 高帮\n 帮面材质: 超纤合成革+网布\n 外底材料: 橡胶大底+PHYLON中底\n 适合场地: 室外水泥地 室内地板\n 运动鞋科技: 其他\n 功能: 减震 防滑 耐磨 支撑 抗冲击\n 鞋码: 40 41 42 43 44 45\n 是否瑕疵: 否\n 运动系列: 常规篮球鞋\n        ', '42', '0', '1', '0');
INSERT INTO `product` VALUES ('191', '7', '412', '正品篮球鞋男科比11代低帮精英版nike zk10战靴全明星鸳鸯运动鞋', '660.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB12VhqLpXXXXarXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '588.00', '100', '\n 颜色分类: 红白 红黑 白灰 黑黄 绿白 深蓝\n 款号: 科比11代\n 品牌: other/其他\n 性别: 男子\n 鞋帮高度: 低帮\n 帮面材质: 人造革+织物\n 外底材料: 橡胶+IP+TPU\n 适合场地: 室外水泥地 室内地板\n 运动鞋科技: 缓震胶\n 功能: 耐磨 透气\n 鞋码: 40 41 42 43 44 45 46\n        ', '14', '0', null, '1');
INSERT INTO `product` VALUES ('192', '7', '412', '虎扑正品男鞋詹姆斯13代篮球鞋LBJ气垫高帮战靴运动全明星 807220', '568.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1Slp5LpXXXXcPXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '568.00', '100', '\n 颜色分类: 枣紫色 MVP 多彩纹 黑金色 红黑色 万圣节\n 款号: 詹姆斯13代\n 品牌: other/其他\n 性别: 男子\n 鞋帮高度: 高帮\n 帮面材质: 人造革+织物\n 外底材料: 耐磨橡胶\n 适合场地: 室外水泥地 室内地板\n 运动鞋科技: 缓震胶\n 功能: 耐磨 支撑 平衡\n 鞋码: 40 41 42 43 44 45 46\n 是否瑕疵: 否\n        ', '31', '0', '1', '0');
INSERT INTO `product` VALUES ('193', '7', '412', 'Nike Kobe IX Xdr 男鞋科比九实战运动篮球鞋 653972-474', '1399.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1ERuBLpXXXXaRXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '799.00', '100', '\n 产品名称：Nike/耐克 653972\n 是否商场同款: 是\n 颜色分类: 深石榴红/金/深红/黑紫 474体育馆蓝/大学金/蓝黑\n 款号: 653972\n 品牌: Nike/耐克\n 上市时间: 2014年春季\n 吊牌价: 1399\n 性别: 男子\n 鞋帮高度: 低帮\n 帮面材质: 织物/人造材料\n 外底材料: 耐磨橡胶\n 适合场地: 室外水泥地 室内地板\n 运动鞋科技: 缓震胶\n 功能: 平衡\n 鞋码: 40.5 41 42 42.5 43 44 44.5 45 46 47.5\n 是否瑕疵: 否\n 运动系列: 篮球文化鞋\n        ', '7', '0', null, '1');
INSERT INTO `product` VALUES ('194', '7', '412', '正品科比10代篮球鞋zk10男鞋全明星低帮战靴独立日丝绸之路运动鞋', '1399.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1NK0uIFXXXXaTaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '839.40', '100', '\n 颜色分类: 贝多芬 王者归来 丝绸之路 复活节 黑曼巴黑 黑曼巴蓝 全明星 独立日 精英版\n 款号: zk10\n 品牌: other/其他\n 上市时间: 2015年秋季\n 吊牌价: 1599\n 性别: 男子\n 鞋帮高度: 低帮\n 帮面材质: 人造革+织物\n 外底材料: 耐磨橡胶\n 运动鞋科技: 气垫 缓震胶 扭转系统\n 功能: 减震 防滑 耐磨 平衡 抗冲击 轻便\n 鞋码: 40 41 42 43 44 45 46\n 是否瑕疵: 否\n 运动系列: 篮球专业比赛鞋\n        ', '7', '0', null, '0');
INSERT INTO `product` VALUES ('195', '8', '162', '2015秋季男士休闲鞋英伦风豆豆鞋真皮男鞋驾车鞋一脚蹬套脚懒人鞋', '158.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1FcjuKXXXXXbOXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '29.00', '100', '\n 货号: 6636\n 鞋垫材质: PU\n 鞋跟高: 低跟(1-3cm)\n 鞋头款式: 圆头\n 闭合方式: 套脚\n 鞋底材质: 橡胶\n 鞋面材质: 二层牛皮（除牛反绒）\n 真皮材质工艺: 贴膜皮\n 鞋面内里材质: 无内里\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 6636黑色 6636棕色 6636咖啡色\n 尺码: 38 39 40 41 42 43 44 45 46 47\n 款式: 休闲皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '151', '0', '1', '0');
INSERT INTO `product` VALUES ('196', '8', '162', '男士休闲网鞋2015夏季新款透气网面潮鞋大码45懒人男鞋子46运动47', '138.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1xxBPIpXXXXc4XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '24.90', '100', '\n 货号: 666\n 鞋垫材质: 布\n 鞋头款式: 圆头\n 闭合方式: 套脚\n 鞋底材质: 橡胶\n 鞋面材质: 网布\n 鞋面内里材质: 网纱\n 鞋制作工艺: 注压鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 镂空\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 夏季\n 颜色分类: 灰色 金色 蓝色\n 尺码: 38码 39码 40码 41码 42码 43码 44码 45码 46码 47码\n 款式: 网面鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '298', '0', null, '1');
INSERT INTO `product` VALUES ('197', '8', '162', '秋季新款休闲男鞋子男士韩版潮鞋大码45系带单板鞋46反绒47真皮48', '199.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1NF3JGXXXXXc1XFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '69.00', '100', '\n 货号: F639\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 二层牛皮（除牛反绒）\n 真皮材质工艺: 磨砂皮\n 鞋面内里材质: 网纱\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 拼色\n 流行元素: 皮革拼接\n 场合: 运动休闲\n 季节: 春秋\n 颜色分类: F639天木蓝 F639葡萄紫 F639棕色 F639黑色 F639灰色 F639驼色\n 尺码: 38 39 40 41 42 43 44 45 46 47 48\n 款式: 板鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '5', '0', '1', '0');
INSERT INTO `product` VALUES ('198', '8', '162', '2015大牌潮鞋个性真皮高帮鞋时尚潮流高帮板鞋休闲男鞋', '1184.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1eZMGLXXXXXaCXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '947.20', '100', '\n 品牌: IT\n 帮面内里材质: 头层猪皮\n 款式: 高帮板鞋\n 鞋垫材质: 头层猪皮\n 鞋跟高: 低跟(1-3cm)\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋面材质: 头层牛皮（除牛反绒）\n 帮面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 粒面皮\n 鞋底材质: 橡胶\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 鞋面内里材质: 头层猪皮\n 图案: 手绘\n 流行元素: 金属\n 颜色分类: 其他颜色 黑色\n 尺码: 38 39 40 41 42 43 44\n 场合: 日常\n 风格: 青春潮流\n 细分风格: 欧美\n 季节: 春秋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '50', '0', null, '1');
INSERT INTO `product` VALUES ('199', '8', '162', '秋冬季欧美雕花男士休闲皮鞋真皮英伦布洛克男鞋潮鞋', '1250.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1jpU2JXXXXXcOXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '1000.00', '100', '\n 鞋垫材质: 头层猪皮\n 鞋跟高: 中跟(3-5cm)\n 品牌: IT\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 擦色皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 厚底\n 图案: 拼色\n 流行元素: 雕花\n 风格: 欧美\n 场合: 日常\n 季节: 春秋\n 颜色分类: 黑色 酒红色\n 尺码: 38 39 40 41 42 43\n 款式: 布洛克鞋\n 功能: 增高\n 适用对象: 青年（18-40周岁）\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('200', '8', '162', '香港代购2015新款秋款高帮鞋男真皮套脚潮鞋欧美潮牌高帮板鞋男鞋', '1148.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1uq.uLXXXXXayXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '918.40', '100', '\n 帮面内里材质: 头层猪皮\n 款式: 休闲高帮皮鞋\n 鞋垫材质: 头层猪皮\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋面材质: 二层牛皮（除牛反绒）\n 帮面材质: 头层牛皮（除牛反绒）\n 鞋底材质: 橡胶\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 鞋面内里材质: 头层猪皮\n 图案: 纯色\n 流行元素: 金属\n 颜色分类: 黑色\n 尺码: 38 39 40 41 42 43\n 场合: 日常\n 风格: 青春潮流\n 细分风格: 欧美\n 季节: 春秋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '0', '0', '1', '0');
INSERT INTO `product` VALUES ('201', '8', '164', '名爵士春季反绒皮伐木鞋男休闲鞋男鞋英伦潮鞋真皮系带青年男鞋子', '426.00', 'https://img.alicdn.com/imgextra/i3/1660939881/TB2GV1ZhXXXXXaJXpXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg', '109.00', '100', '\n 上市年份季节: 2015年春季\n 货号: M24289\n 品牌: 名爵士\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: TPR(牛筋）\n 鞋面材质: 牛反绒\n 真皮材质工艺: 反绒皮\n 鞋面内里材质: PU\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 名爵士棕色 名爵士蓝色 名爵士驼色\n 尺码: 38 39 40 41 42 43 44\n 款式: 伐木鞋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 伐木鞋\n        ', '6', '0', null, '1');
INSERT INTO `product` VALUES ('202', '8', '164', '名爵士工装休闲皮鞋商务男士系带磨砂皮英伦2015冬季新品青年男鞋', '288.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1pFQyJFXXXXb0XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '149.00', '100', '\n 上市年份季节: 2015年秋季\n 货号: M6501\n 品牌: 名爵士\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 磨砂皮\n 真皮材质工艺: 磨砂皮\n 鞋面内里材质: PU\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 名爵士深棕色 名爵士红棕色 名爵士卡其色 名爵士黑色\n 尺码: 38 39 40 41 42 43\n 款式: 休闲皮鞋\n 功能: 耐磨\n 低帮鞋品名: 工装鞋（大头鞋）\n        ', '1', '0', '1', '1');
INSERT INTO `product` VALUES ('203', '8', '164', '名爵士春季新款男士日常休闲皮鞋男系带反绒皮男鞋韩版潮流单鞋子', '468.00', 'https://img.alicdn.com/imgextra/i2/1660939881/TB2zta5hXXXXXc2XXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg', '149.00', '100', '\n 上市年份季节: 2015年夏季\n 货号: M8635\n 品牌: 名爵士\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 牛反绒\n 真皮材质工艺: 反绒皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 皮革拼接\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 名爵士卡其色 名爵士蓝色 名爵士黑色\n 尺码: 37 38 39 40 41 42\n 款式: 休闲皮鞋\n 功能: 增高\n 低帮鞋品名: 休闲皮鞋\n        ', '0', '0', null, '0');
INSERT INTO `product` VALUES ('204', '8', '166', '耐宾新品青春时尚运动休闲真皮头层皮男士鞋韩版流行男鞋夏季单鞋', '1380.00', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2xR4tbXXXXXcoXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg', '248.00', '100', '\n 上市年份季节: 2013年冬季\n 货号: K60128\n 销售渠道类型: 商场同款(线上线下都销售)\n 鞋垫材质: 头层猪皮\n 鞋跟高: 平跟(小于等于1cm)\n 品牌: 耐宾\n 鞋头款式: 圆头\n 闭合方式: 套脚\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 油蜡皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 运动\n 场合: 运动休闲\n 季节: 春秋\n 颜色分类: 黑色 红色 棕色 橘黄色\n 尺码: 37 38 39 40 41 42 43 44\n 款式: 休闲皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 休闲皮鞋\n        ', '3', '0', '1', '1');
INSERT INTO `product` VALUES ('205', '8', '166', '耐宾正品真皮头层皮休闲鞋流行男鞋韩版潮流豆豆鞋男士夏季透气', '488.00', 'https://img.alicdn.com/imgextra/i3/1055263121/TB21EFpbXXXXXczXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg', '242.00', '100', '\n 上市年份季节: 2012年秋季\n 货号: KD96801\n 销售渠道类型: 商场同款(线上线下都销售)\n 鞋垫材质: 头层猪皮\n 鞋跟高: 平跟(小于等于1cm)\n 品牌: 耐宾\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 压花皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 韩版\n 场合: 日常\n 季节: 春秋\n 颜色分类: 黑色 棕色 酒红 黑色加绒 土黄\n 尺码: 37 38 39 40 41 42 43 44\n 款式: 豆豆鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 豆豆鞋\n        ', '3', '0', null, '0');
INSERT INTO `product` VALUES ('206', '8', '166', '耐宾豆豆鞋新款真皮头层皮时尚流行男鞋韩版透气包邮', '598.00', 'https://img.alicdn.com/imgextra/i1/1055263121/T24L6cXz4XXXXXXXXX_!!1055263121.jpg_430x430q90.jpg', '278.00', '100', '\n 上市年份季节: 2013年秋季\n 货号: k60127\n 销售渠道类型: 商场同款(线上线下都销售)\n 鞋垫材质: 头层猪皮\n 鞋跟高: 平跟(小于等于1cm)\n 品牌: 耐宾\n 鞋头款式: 尖头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 水染皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 黑色 棕色 橘色\n 尺码: 37 38 39 40 41 42 43 44\n 款式: 豆豆鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 豆豆鞋\n        ', '0', '0', '1', '1');
INSERT INTO `product` VALUES ('207', '8', '166', '耐宾男士休闲鞋 男英伦日常休闲鞋男鞋 时尚潮流休闲鞋牛皮鞋子夏', '498.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1CQXkIVXXXXaRXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '248.00', '100', '\n 上市年份季节: 2015年夏季\n 货号: ik60227\n 鞋垫材质: 头层猪皮\n 鞋跟高: 平跟(小于等于1cm)\n 品牌: 耐宾\n 鞋头款式: 尖头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 水染皮\n 鞋面内里材质: 头层牛皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 墨绿 蓝色 酒红 黑色\n 尺码: 37 38 39 40 41 42 43 44\n 款式: 休闲皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 休闲皮鞋\n        ', '3', '0', '1', '0');
INSERT INTO `product` VALUES ('208', '8', '166', '耐宾2015男鞋夏季透气新款休闲皮鞋男系带英伦真皮头层皮男士鞋子', '1180.00', 'https://img.alicdn.com/imgextra/i1/1055263121/TB2qXlsbXXXXXXRXpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg', '348.00', '100', '\n 上市年份季节: 2014年秋季\n 货号: K60210\n 销售渠道类型: 商场同款(线上线下都销售)\n 鞋垫材质: 头层猪皮\n 鞋跟高: 低跟(1-3cm)\n 品牌: 耐宾\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 磨砂皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 户外休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 黑色 棕色\n 尺码: 37 38 39 40 41 42 43 44\n 款式: 休闲皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 休闲皮鞋\n        ', '3', '0', null, '1');
INSERT INTO `product` VALUES ('209', '8', '166', '耐宾男士休闲鞋 真皮头层皮磨砂皮鞋单鞋系带男鞋透气韩版秋季', '1280.00', 'https://img.alicdn.com/imgextra/i3/1055263121/TB2oV57aFXXXXa.XpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg', '248.00', '100', '\n 上市年份季节: 2014年夏季\n 货号: k60211\n 销售渠道类型: 商场同款(线上线下都销售)\n 鞋垫材质: 头层猪皮\n 鞋跟高: 低跟(1-3cm)\n 品牌: 耐宾\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 磨砂皮\n 鞋面内里材质: 头层猪皮\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 场合: 日常\n 季节: 春秋\n 颜色分类: 土黄色 深蓝色 灰色 镂空土黄色\n 尺码: 37 38 39 40 41 42 43 44\n 款式: 镂空皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 镂空皮鞋\n        ', '1', '0', '1', '0');
INSERT INTO `product` VALUES ('210', '8', '168', '2015新款男士休闲鞋商务休闲皮鞋英伦风秋季正装男鞋真皮圆头系带', '688.00', 'https://gd3.alicdn.com/bao/uploaded/i3/TB12BMnJpXXXXXiXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '154.00', '100', '\n 货号: 1395\n 鞋垫材质: 二层猪皮\n 鞋跟高: 低跟(1-3cm)\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 鞋面内里材质: 二层猪皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 风格: 商务\n 场合: 日常\n 季节: 春秋\n 颜色分类: 暗棕色 浅棕色\n 尺码: 38 39 40 41 42 43 44\n 款式: 休闲皮鞋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n        ', '457', '0', null, '1');
INSERT INTO `product` VALUES ('211', '8', '168', '秋冬真皮男士休闲鞋潮流英伦日常商务皮鞋透气青年正装男鞋子圆头', '599.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1TrGyIXXXXXbeXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '138.00', '100', '\n 货号: 9918\n 鞋垫材质: 二层猪皮\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 鞋面内里材质: 二层猪皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 纯色\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 季节: 春秋\n 颜色分类: 古巴棕 黑色 浅棕色\n 尺码: 38 39 40 41 42 43 44\n 款式: 休闲皮鞋\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '34', '0', '1', '1');
INSERT INTO `product` VALUES ('212', '8', '168', '秋冬季男士休闲鞋英伦板鞋套脚反绒皮真皮男鞋皮鞋青年潮男鞋子男', '588.00', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1qY66IFXXXXc7XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '138.00', '100', '\n 货号: 1509\n 鞋垫材质: 二层猪皮\n 鞋头款式: 方头\n 闭合方式: 套脚\n 鞋底材质: 橡胶\n 鞋面材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 反绒皮\n 鞋面内里材质: 二层猪皮\n 鞋制作工艺: 缝制鞋\n 跟底款式: 平跟\n 图案: 拼色\n 流行元素: 车缝线\n 风格: 英伦\n 场合: 日常\n 季节: 春秋\n 颜色分类: 天蓝色 深蓝色 浅棕色\n 尺码: 38 39 40 41 42 43 44\n 功能: 透气\n 适用对象: 青年（18-40周岁）\n        ', '3', '0', '1', '0');
INSERT INTO `product` VALUES ('213', '9', '186', 'jkjk冬季男鞋休闲鞋英伦马丁靴加绒保暖棉鞋男工装鞋男高帮鞋靴子', '558.00', 'https://img.alicdn.com/imgextra/i2/1704064299/TB2DQSPjFXXXXcNXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg', '146.00', '100', '\n 上市年份季节: 2015年秋季\n 品牌: jkjk\n 帮面内里材质: 人造短毛绒\n 货号: JK15M0828\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋面材质: 超纤\n 帮面材质: 超纤\n 鞋底材质: 橡胶\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 鞋面内里材质: 超纤\n 图案: 纯色\n 流行元素: 车缝线\n 颜色分类: 黄棕单鞋 棕色单鞋 黄棕加绒 棕色加绒\n 尺码: 38 39 40 41 42 43\n 场合: 日常\n 风格: 休闲\n 细分风格: 日常休闲\n 季节: 冬季\n 功能: 保暖\n 适用对象: 青年（18-40周岁）\n        ', '4556', '0', null, '1');
INSERT INTO `product` VALUES ('214', '9', '234', '内增高女鞋冬季新款韩版加厚加绒运动高帮鞋冬鞋女潮休闲高邦棉鞋', '369.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1J57VKpXXXXa7XXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '188.00', '100', '\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋垫材质: 人造短毛绒\n 品牌: 低调女人\n 货号: G4151032\n 上市年份季节: 2015年冬季\n 风格: 韩版\n 帮面材质: 多种材质拼接\n 拼接主要材质: 绒面\n 里料材质: 人造短毛绒\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 魔术贴\n 后跟高: 高跟(5-8cm)\n 跟底款式: 内增高\n 流行元素: 交叉绑带 防水台\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 卡其色 黑色 灰色\n 尺码: 35 36 37 38 39\n 图案: 纯色\n 适用对象: 青年（18-40周岁）\n 适用场景: 休闲\n        ', '585', '0', '1', '0');
INSERT INTO `product` VALUES ('215', '9', '234', '2015秋冬韩版魔术贴高帮鞋女时尚休闲运动风隐形内增高女鞋单鞋潮', '339.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1YCrQJFXXXXXFXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '158.00', '100', '\n 品牌: 低调女人\n 货号: G3132001\n 上市年份季节: 2015年秋季\n 风格: 韩版\n 帮面材质: 多种材质拼接\n 拼接主要材质: PU\n 里料材质: 布\n 皮质特征: 软面\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 魔术贴\n 后跟高: 中跟(3-5cm)\n 跟底款式: 内增高\n 流行元素: 拼色 坡跟 金属装饰\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 黑色绒里 金色绒里 黑色 银色绒里 银色 金色\n 尺码: 35 36 37 38 39\n 图案: 拼色\n 适用对象: 青年（18-40周岁）\n 适用场景: 运动\n        ', '411', '0', '1', '1');
INSERT INTO `product` VALUES ('216', '9', '234', '2016春秋明星同款高帮内增高女鞋韩版镜面厚底运动亮面休闲鞋女潮', '289.00', 'https://img.alicdn.com/bao/uploaded/i3/TB16CYXLXXXXXc0XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '168.00', '100', '\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋垫材质: 布\n 品牌: 低调女人\n 货号: G1161044\n 上市年份季节: 2016年春季\n 风格: 韩版\n 帮面材质: PU\n 里料材质: 布\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 系带\n 后跟高: 高跟(5-8cm)\n 跟底款式: 内增高\n 流行元素: 交叉绑带 松糕跟 防水台\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 蓝色 枪色 红色\n 尺码: 35 36 37 38 39\n 图案: 纯色\n 适用对象: 青年（18-40周岁）\n 适用场景: 休闲\n        ', '59', '0', null, '0');
INSERT INTO `product` VALUES ('217', '9', '234', '低调女人加绒内增高女鞋运动休闲鞋女潮韩版冬季高帮鞋加厚保暖', '398.00', 'https://img.alicdn.com/bao/uploaded/i3/TB1uC5hLpXXXXaGXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '188.00', '100', '\n 销售渠道类型: 纯电商(只在线上销售)\n 品牌: 低调女人\n 货号: G3142094\n 上市年份季节: 2015年冬季\n 风格: 韩版\n 帮面材质: 牛二层皮覆膜\n 里料材质: 人造短毛绒\n 皮质特征: 软面\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 系带\n 后跟高: 高跟(5-8cm)\n 跟底款式: 内增高\n 流行元素: 交叉绑带 坡跟\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 黑色 紫红色 米色\n 尺码: 35 36 37 38 39\n 图案: 纯色\n 适用对象: 青年（18-40周岁）\n 适用场景: 休闲\n        ', '14', '0', '1', '0');
INSERT INTO `product` VALUES ('218', '9', '186', 'jkjk时尚休闲男靴英伦马丁靴男真皮靴子男军靴男士短靴高帮男棉鞋', '438.00', 'https://img.alicdn.com/imgextra/i4/1704064299/TB2GzdNjFXXXXcCXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg', '149.00', '100', '\n 上市年份季节: 2015年秋季\n 跟底款式: 平跟\n 销售渠道类型: 纯电商(只在线上销售)\n 靴筒内里材质: 羊皮\n 鞋垫材质: 羊皮\n 鞋头款式: 圆头\n 鞋跟高: 低跟(1-3cm)\n 款式: 马丁靴\n 货号: JK15M9688\n 流行元素: 金属\n 风格: 休闲\n 细分风格: 户外休闲\n 闭合方式: 系带\n 品牌: jkjk\n 鞋底材质: 橡胶\n 季节: 冬季\n 鞋面材质: 头层牛皮（除牛反绒）\n 靴筒材质: 头层牛皮（除牛反绒）\n 真皮材质工艺: 纳帕纹\n 颜色分类: 棕色 黑色\n 尺码: 39 40 41 42 43\n 靴筒高度: 中筒\n 鞋面内里材质: 纯羊毛\n 功能: 保暖\n 适用对象: 青年（18-40周岁）\n 靴子品名: 马丁靴\n        ', '376', '0', null, '0');
INSERT INTO `product` VALUES ('219', '9', '186', 'jkjk时尚休闲男靴英伦马丁靴男真皮靴子男军靴男士短靴高帮男棉鞋', '699.00', 'https://img.alicdn.com/imgextra/i1/1704064299/TB2yHYWiFXXXXXiXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg', '99.00', '100', '\n 上市年份季节: 2015年冬季\n 跟底款式: 平跟\n 销售渠道类型: 纯电商(只在线上销售)\n 靴筒内里材质: PU\n 鞋垫材质: PU\n 鞋头款式: 圆头\n 鞋跟高: 低跟(1-3cm)\n 款式: 马丁靴\n 货号: JM15M0803\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 户外休闲\n 闭合方式: 系带\n 品牌: jkjk\n 鞋底材质: 橡胶\n 季节: 冬季\n 鞋面材质: 超纤皮\n 靴筒材质: 超纤\n 真皮材质工艺: 擦色皮\n 颜色分类: 黑色\n 尺码: 38 39 40 41 42 43\n 靴筒高度: 高筒\n 鞋面内里材质: PU\n 功能: 保暖\n 适用对象: 青年（18-40周岁）\n 靴子品名: 马丁靴\n        ', '20', '0', '1', '1');
INSERT INTO `product` VALUES ('220', '9', '186', 'JKJK男靴英伦马丁靴男真皮靴子工装靴军靴男士短靴潮高帮男鞋', '980.00', 'https://img.alicdn.com/imgextra/i1/1704064299/TB2vHqcjFXXXXcfXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg', '188.00', '100', '\n 上市年份季节: 2014年秋季\n 靴筒内里材质: 人造短毛绒\n 鞋头款式: 圆头\n 款式: 马丁靴\n 货号: JK14C7591\n 流行元素: 车缝线\n 风格: 休闲\n 细分风格: 日常休闲\n 闭合方式: 拉链\n 品牌: jkjk\n 鞋底材质: 橡胶\n 季节: 冬季\n 鞋面材质: 头层牛皮（除牛反绒）\n 靴筒材质: 牛皮\n 颜色分类: 黑色 棕色\n 尺码: 38 39 40 41 42 43\n 靴筒高度: 中筒\n 鞋面内里材质: 人造短毛绒\n 功能: 保暖\n 靴子品名: 马丁靴\n        ', '5', '0', null, '1');
INSERT INTO `product` VALUES ('221', '9', '413', '韩版2015春秋新款高帮鞋女真皮休闲运动鞋松糕厚底内增高鞋魔术贴', '288.00', 'https://gd2.alicdn.com/bao/uploaded/i2/TB12W08JFXXXXbHXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '65.80', '100', '\n 鞋垫材质: 超纤皮\n 品牌: 凤舞真皮女鞋\n 货号: 2039\n 上市年份季节: 2015年夏季\n 风格: 韩版\n 帮面材质: 牛反绒（磨砂皮）\n 里料材质: 超细纤维\n 皮质特征: 磨砂皮\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 魔术贴\n 后跟高: 平跟(小于等于1cm)\n 跟底款式: 内增高\n 流行元素: 皮带装饰 坡跟 松糕跟 防水台\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 灰色 黑色\n 尺码: 【收藏有礼】 【不合适不满意】 【包邮退换】 【好评返现哦】 34 35 36 37 38 39 40\n 图案: 纯色\n 包装体积: 0.35*0.25\n 毛重: 0.8\n 适用对象: 青年（18-40周岁）\n        ', '224', '0', '1', '1');
INSERT INTO `product` VALUES ('222', '9', '413', '韩版2016秋冬新款内增高鞋女休闲侧拉链保暖真皮高帮女鞋毛毛靴', '288.00', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1uMMnKpXXXXbDXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg', '59.00', '100', '\n 鞋垫材质: 人造短毛绒\n 品牌: DL\n 货号: 1158\n 上市年份季节: 2015年冬季\n 风格: 韩版\n 帮面材质: 牛反绒（磨砂皮）\n 里料材质: 人造短毛绒\n 皮质特征: 磨砂\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 拉链\n 后跟高: 高跟(5-8cm)\n 跟底款式: 内增高\n 流行元素: 坡跟 防水台 金属装饰\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 黑色 深棕色\n 尺码: 【收藏有惊喜】 【好评返现哦】 35 36 37 38 39\n 图案: 纯色\n 包装体积: 1\n 毛重: 0.7\n 适用对象: 青年（18-40周岁）\n        ', '308', '0', null, '1');
INSERT INTO `product` VALUES ('223', '9', '413', '韩版春秋新款真皮高帮鞋女学生系带运动鞋内增高平底松糕鞋魔术贴', '398.00', 'https://gd2.alicdn.com/imgextra/i2/807689187/TB2ugqkjpXXXXbiXpXXXXXXXXXX_!!807689187.jpg_400x400.jpg', '59.90', '100', '\n 鞋垫材质: 棉\n 品牌: liwuxieye\n 货号: 20-89\n 上市年份季节: 2015年秋季\n 风格: 学院\n 帮面材质: 牛反绒（磨砂皮）\n 里料材质: 棉\n 皮质特征: 磨砂皮\n 鞋底材质: 橡胶\n 鞋头款式: 圆头\n 闭合方式: 系带\n 后跟高: 平跟(小于等于1cm)\n 跟底款式: 内增高\n 流行元素: 交叉绑带 拼色 松糕跟 防水台 细带组合\n 鞋制作工艺: 胶粘鞋\n 颜色分类: 灰色 黑色\n 尺码: 34 35 36 37 38 39 40\n 图案: 拼色\n 包装体积: 0.6\n 毛重: 0.8\n 适用对象: 青年（18-40周岁）\n        ', '16', '0', '1', '0');
INSERT INTO `product` VALUES ('224', '9', '413', '春秋新款高帮鞋女韩版休闲学生潮鞋运动松糕厚底内增高女鞋魔术贴', '198.00', 'https://gd2.alicdn.com/imgextra/i2/807689187/TB244pMgpXXXXX3XpXXXXXXXXXX_!!807689187.jpg_400x400.jpg', '65.80', '100', '\n 鞋制作工艺: 胶粘工艺\n 品牌: 真皮女鞋\n 货号: 2039\n 上市年份季节: 2015年夏季\n 风格: 韩版\n 鞋底材质: 橡胶\n 鞋帮高度: 高帮\n 闭合方式: 魔术贴\n 流行元素: 松糕跟 防水台\n 颜色分类: 【2069】黑色 灰色 黑色 粉红色\n 尺码: 【收藏有惊喜】 不合适不满意 包邮退换哦 好评返现 34 35 36 37 38 39 40\n 图案: 纯色\n 包装体积: 0.3\n 毛重: 0.8\n 适用对象: 青年（18-40周岁）\n        ', '607', '0', null, '1');
INSERT INTO `product` VALUES ('225', '10', '414', '静熙男士帆布鞋透气布鞋秋季休闲鞋潮鞋板鞋内增高男鞋子低帮男鞋', '337.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1W7aVLpXXXXaLXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '112.00', '100', '\n 上市年份季节: 2012年夏季\n 鞋制作工艺: 胶粘鞋\n 鞋帮高度: 低帮\n 鞋跟: 内增高\n 风格: 韩版\n 货号: F11\n 闭合方式: 系带\n 品牌: Jeansie/静熙\n 流行元素: 车缝线\n 图案: 纯色\n 季节: 春秋\n 鞋底材质: 橡胶\n 颜色分类: 红色 米白 蓝色 灰色 沙色 军绿色\n 尺码: 37 38 39 40 41 42 43 44\n 内里材质: 网纱\n 功能: 增高\n 适用对象: 青年（18-40周岁）\n        ', '3513', '0', '1', '0');
INSERT INTO `product` VALUES ('226', '10', '414', '静熙高帮帆布鞋潮鞋冬季高邦布鞋内增高板鞋男鞋子秋季男士休闲鞋', '395.00', 'https://img.alicdn.com/bao/uploaded/i2/TB11pfaLpXXXXc_XXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '136.00', '100', '\n 上市年份季节: 2013年秋季\n 鞋制作工艺: 胶粘鞋\n 鞋帮高度: 高帮\n 鞋跟: 内增高\n 风格: 韩版\n 货号: F85\n 闭合方式: 系带\n 品牌: Jeansie/静熙\n 流行元素: 车缝线\n 图案: 纯色\n 季节: 春秋\n 鞋底材质: 牛筋\n 颜色分类: 象牙白 灰色 桔色 军绿色\n 尺码: 37 38 39 40 41 42 43 44\n 内里材质: 棉\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n        ', '820', '0', null, '0');
INSERT INTO `product` VALUES ('227', '10', '414', '静熙拼色韩版潮男士休闲鞋男鞋鞋子 夏季牛仔风鞋帆布鞋男板鞋F30', '337.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1jQ57LpXXXXXsXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '128.00', '100', '\n 上市年份季节: 2013年冬季\n 鞋制作工艺: 缝制鞋\n 鞋帮高度: 低帮\n 鞋跟: 平跟\n 风格: 休闲\n 细分风格: 日常休闲\n 货号: F30\n 闭合方式: 系带\n 品牌: Jeansie/静熙\n 流行元素: 车缝线\n 图案: 拼色\n 季节: 春秋\n 鞋底材质: 橡胶\n 颜色分类: 米黑色 米棕色 米蓝色\n 尺码: 38 39 40 41 42 43 44\n 内里材质: 棉\n 功能: 轻质\n 适用对象: 青年（18-40周岁）\n        ', '32', '0', '1', '1');
INSERT INTO `product` VALUES ('228', '10', '415', '2015春夏帆布鞋女韩版低帮玛丽鞋平底孕妇布鞋女鞋一脚登懒人鞋女', '258.00', 'https://img.alicdn.com/bao/uploaded/i4/T1NN8nFPpbXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '49.90', '100', '\n 流行卖点 风格：甜美\n 图案：条纹\n \n适用 适用对象：青年（18-40周岁）\n \n基础信息 品牌：Luminosity/光度\n 鞋底材质：橡胶\n 闭合方式：套脚\n        ', '9', '0', null, '1');
INSERT INTO `product` VALUES ('229', '10', '415', '新款透气休闲鞋男士板鞋男韩版帆布低帮鞋夏季潮流学生男鞋子潮鞋', '298.00', 'https://img.alicdn.com/imgextra/i4/735195464/TB2PjZXepXXXXXGXXXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg', '78.00', '100', '\n 上市年份季节: 2015年夏季\n 货号: 890\n 销售渠道类型: 天猫独家(只在天猫销售)\n 鞋垫材质: 布\n 品牌: Luminosity/光度\n 鞋头款式: 圆头\n 闭合方式: 系带\n 鞋底材质: 橡胶\n 鞋面材质: 磨砂皮\n 鞋面内里材质: 网纱\n 鞋制作工艺: 胶粘鞋\n 跟底款式: 平跟\n 图案: 拼色\n 流行元素: 车缝线\n 风格: 英伦\n 场合: 日常\n 季节: 春秋\n 颜色分类: 红色 黑色 蓝色\n 尺码: 39 40 41 42 43 44\n 款式: 板鞋\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n 低帮鞋品名: 板鞋\n        ', '0', '0', '1', '1');
INSERT INTO `product` VALUES ('230', '10', '415', '2016春季新品潮鞋低帮鞋男韩版男鞋透气休闲帆布鞋男潮流鞋子单鞋', '298.00', 'https://img.alicdn.com/imgextra/i1/TB1af2NLXXXXXa8XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '69.00', '100', '\n上市年份季节: 2016年春季\n 销售渠道类型: 纯电商(只在线上销售)\n 鞋制作工艺: 胶粘鞋\n 鞋帮高度: 低帮\n 鞋跟: 平跟\n 风格: 青春潮流\n 细分风格: 韩版\n 货号: 615\n 闭合方式: 系带\n 品牌: Luminosity/光度\n 流行元素: 车缝线\n 图案: 拼色\n 季节: 春秋\n 鞋底材质: 橡胶\n 颜色分类: 棕色 红色 灰色\n 尺码: 39 40 41 42 43 44\n 内里材质: 棉\n 功能: 耐磨\n 适用对象: 青年（18-40周岁）\n        ', '0', '0', null, '0');
INSERT INTO `product` VALUES ('231', '15', '416', 'Panasonic/松下 KFR-25GW/BpSJ1正1匹去雾霾冷暖变频空调挂机', '3699.00', 'https://img.alicdn.com/imgextra/i3/TB1qguGHFXXXXawXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3198.00', '100', '\n 证书编号：2014010703668395\n 证书状态：有效\n 申请人名称：广州松下空调器有限公司\n 制造商名称：广州松下空调器有限公司\n 产品名称：分体式房间空调器\n 3C产品型号：CS-LE9KH1/CU-LE9KH1, CS-LE9KH1P/CU-LE9KH1, CS-E9KH...\n 产品名称：Panasonic/松下 KFR-25G...\n 松下空调型号: KFR-25GW/BpSJ1\n 空调类型: 壁挂式\n 冷暖类型: 冷暖型\n 空调功率: 1匹\n 适用面积: 10-16㎡\n 工作方式: 变频\n 能效等级: 三级\n        ', '125', '0', '1', '0');
INSERT INTO `product` VALUES ('232', '15', '416', 'Panasonic/松下 KFR-35GW/BpSJ1大1.5匹冷暖变频空调挂机去雾霾', '3999.00', 'https://img.alicdn.com/imgextra/i1/TB1qDewHFXXXXcuXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3498.00', '100', '\n 证书编号：2014010703668202\n 证书状态：有效\n 申请人名称：广州松下空调器有限公司\n 制造商名称：广州松下空调器有限公司\n 产品名称：分体式房间空调器\n 3C产品型号：CS-LE13KH1/CU-LE13KH1, CS-LE13KH1P/CU-LE13KH1, CS-...\n 产品名称：Panasonic/松下 KFR-35G...\n 松下空调型号: KFR-35GW/BpSJ1\n 空调类型: 壁挂式\n 冷暖类型: 冷暖型\n 空调功率: 大1.5匹\n 适用面积: 15-22㎡\n 工作方式: 变频\n 能效等级: 三级\n        ', '101', '0', null, '1');
INSERT INTO `product` VALUES ('233', '15', '416', 'Panasonic/松下 KFR-51GW/BpSJ1S大2匹无氟变频冷暖空调挂机', '5999.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1vu5XJXXXXXbdaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '5699.00', '100', '\n 证书编号：2014010703737557\n 证书状态：有效\n 申请人名称：广州松下空调器有限公司\n 制造商名称：广州松下空调器有限公司\n 产品名称：分体式房间空调器\n 3C产品型号：CS-E18KJ1/CU-E18KJ1, CS-E18KJ1A/CU-E18KJ1, CS-KE18...\n 产品名称：Panasonic/松下 KFR-51G...\n 松下空调型号: KFR-51GW/BpSJ1S\n 空调类型: 壁挂式\n 冷暖类型: 冷暖型\n 空调功率: 大2匹\n 适用面积: 20-32㎡\n 工作方式: 变频\n 能效等级: 三级\n        ', '1', '0', '1', '1');
INSERT INTO `product` VALUES ('234', '15', '417', 'Gree/格力 KFR-26GW/(26596)FNAa-A3 变频大1匹 壁挂式空调 Q铂', '3680.00', 'https://img.alicdn.com/bao/uploaded/i3/TB12hd9LpXXXXbWXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2799.00', '100', '\n 产品名称：Gree/格力 KFR-26GW/(...\n 格力空调型号: KFR-26GW/(26596)FNAa-A3\n 空调类型: 壁挂式\n 冷暖类型: 冷暖电辅\n 空调功率: 大1匹\n 适用面积: 约10-16㎡\n 工作方式: 变频\n 能效等级: 三级\n        ', '123', '0', null, '0');
INSERT INTO `product` VALUES ('235', '15', '417', 'Gree/格力 KFR-26GW/(26592)FNhDa-A3 大1匹除甲醛变频空调 品圆', '3880.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1MG9iLpXXXXXRXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2799.00', '100', '\n 产品名称：Gree/格力 KFR-26GW/(...\n 格力空调型号: KFR-26GW/(26592)FNhDa-A3\n 空调类型: 壁挂式\n 冷暖类型: 冷暖电辅\n 空调功率: 大1匹\n 适用面积: 10-16㎡\n 工作方式: 变频\n 能效等级: 三级\n        ', '383', '0', '1', '1');
INSERT INTO `product` VALUES ('236', '15', '417', 'Gree/格力 KFR-50LW/(50595)NhAa-3 定频大2匹立式柜机空调 Q雅', '5780.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1YSd6LpXXXXXNXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '4599.00', '100', '\n 产品名称：Gree/格力 KFR-50LW/(...\n 格力空调型号: KFR-50LW/(50595)NhAa-3\n 空调类型: 柜机\n 冷暖类型: 冷暖电辅\n 空调功率: 大2匹\n 适用面积: 约20-32㎡\n 工作方式: 定速\n 能效等级: 三级\n        ', '44', '0', null, '0');
INSERT INTO `product` VALUES ('237', '15', '417', 'Gree/格力 KFR-23GW/(23592)NhDa-3 小1匹定速除甲醛功能空调', '3180.00', 'https://img.alicdn.com/bao/uploaded/i2/TB1qXpNLpXXXXbMaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2199.00', '100', '\n 产品名称：Gree/格力 KFR-23GW/(...\n 格力空调型号: KFR-23GW/(23592)NhDa-3\n 空调类型: 壁挂式\n 冷暖类型: 冷暖电辅\n 空调功率: 1匹\n 适用面积: 约8-13㎡\n 工作方式: 定速\n 能效等级: 三级\n        ', '174', '0', '1', '1');
INSERT INTO `product` VALUES ('238', '15', '418', 'Changhong/长虹 KFR-35GW/ZDHID(W1-J)+A3变频大1.5匹冷暖空调', '2499.00', 'https://img.alicdn.com/bao/uploaded/i4/TB1dySwLpXXXXbxXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '2099.00', '100', '\n 证书编号：2013010703637887\n 证书状态：有效\n 申请人名称：四川长虹电器股份有限公司\n 制造商名称：四川长虹电器股份有限公司\n 产品名称：分体热泵型挂壁式变频房间空调器、分体冷风型挂壁式变频房间空调器\n 3C产品型号：见附件\n 产品名称：Changhong/长虹 KFR-35G...\n 长虹空调型号: KFR-35GW/ZDHID(W1-J)+A3\n 空调类型: 壁挂式\n 冷暖类型: 冷暖电辅\n 空调功率: 大1.5匹\n 适用面积: 15m^2（含）-22m^2（含）\n 工作方式: 变频\n 能效等级: 三级\n        ', '155', '0', null, '0');
INSERT INTO `product` VALUES ('239', '15', '418', 'Changhong/长虹 KFR-72LW/DHIF(W2-J)+2立式冷暖客厅3匹柜机空调', '4899.00', 'https://img.alicdn.com/bao/uploaded/i1/TB1QniHLpXXXXatXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg', '3899.00', '100', '\n 证书编号：2011010703482141\n 证书状态：有效\n 申请人名称：四川长虹电器股份有限公司\n 制造商名称：四川长虹电器股份有限公司\n 产品名称：分体热泵型落地式房间空调器、分体冷风型落地式房间空调器\n 3C产品型号：见附件\n 产品名称：Changhong/长虹 KFR-72L...\n 长虹空调型号: KFR-72LW/DHIF(W2-J)+2\n 空调类型: 柜机\n 冷暖类型: 冷暖电辅\n 空调功率: 3匹\n 适用面积: 28m^2（含）-45m^2（含）\n 工作方式: 定速\n 能效等级: 三级\n        ', '15', '0', '1', '1');
INSERT INTO `product` VALUES ('243', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `image_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_id` int(100) DEFAULT NULL,
  `image_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=922 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('1', '3', 'https://gd1.alicdn.com/bao/uploaded/i1/2254228937/TB2pqExhpXXXXXkXXXXXXXXXXXX_!!2254228937.jpg');
INSERT INTO `product_image` VALUES ('2', '3', 'https://gd4.alicdn.com/imgextra/i4/TB15ilqKpXXXXXSaXXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('3', '3', 'https://gd2.alicdn.com/imgextra/i2/2254228937/TB2W47hhpXXXXcyXXXXXXXXXXXX_!!2254228937.jpg');
INSERT INTO `product_image` VALUES ('4', '3', 'https://gd4.alicdn.com/imgextra/i4/2254228937/TB2LT62hpXXXXbRXpXXXXXXXXXX_!!2254228937.jpg');
INSERT INTO `product_image` VALUES ('5', '3', 'https://gd2.alicdn.com/imgextra/i2/2254228937/TB20yY8hpXXXXaRXpXXXXXXXXXX_!!2254228937.jpg');
INSERT INTO `product_image` VALUES ('6', '4', 'https://gd1.alicdn.com/bao/uploaded/i1/TB100kJKFXXXXbIXVXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('7', '4', 'https://gd3.alicdn.com/imgextra/i3/115410951/TB24n_3iVXXXXXtXpXXXXXXXXXX_!!115410951.jpg');
INSERT INTO `product_image` VALUES ('8', '4', 'https://gd2.alicdn.com/imgextra/i2/115410951/TB2ducfiVXXXXaKXXXXXXXXXXXX_!!115410951.jpg');
INSERT INTO `product_image` VALUES ('9', '4', 'https://gd1.alicdn.com/imgextra/i1/115410951/TB2own.iVXXXXbVXXXXXXXXXXXX_!!115410951.jpg');
INSERT INTO `product_image` VALUES ('10', '4', 'https://gd4.alicdn.com/imgextra/i4/115410951/TB2sjv9iVXXXXceXXXXXXXXXXXX_!!115410951.jpg');
INSERT INTO `product_image` VALUES ('11', '4', 'https://gd4.alicdn.com/imgextra/i4/115410951/TB2sjv9iVXXXXceXXXXXXXXXXXX_!!115410951.jpg');
INSERT INTO `product_image` VALUES ('12', '5', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1xmimJFXXXXXJXpXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('13', '5', 'https://gd4.alicdn.com/imgextra/i4/114443615/TB2F1jpfpXXXXa0XXXXXXXXXXXX_!!114443615.jpg');
INSERT INTO `product_image` VALUES ('14', '5', 'https://gd3.alicdn.com/imgextra/i3/114443615/TB2Ima7fpXXXXbqXpXXXXXXXXXX_!!114443615.jpg');
INSERT INTO `product_image` VALUES ('15', '5', 'https://gd3.alicdn.com/imgextra/i3/114443615/TB2Z_PgfpXXXXc5XXXXXXXXXXXX_!!114443615.jpg');
INSERT INTO `product_image` VALUES ('16', '6', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1VKOcKXXXXXXZXXXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('17', '6', 'https://gd2.alicdn.com/imgextra/i2/2618602797/TB2lar3iFXXXXaAXpXXXXXXXXXX_!!2618602797.jpg');
INSERT INTO `product_image` VALUES ('18', '6', 'https://gd1.alicdn.com/imgextra/i1/2618602797/TB2VpL7iFXXXXXYXpXXXXXXXXXX_!!2618602797.jpg');
INSERT INTO `product_image` VALUES ('19', '6', 'https://gd1.alicdn.com/imgextra/i1/2618602797/TB2ntD0iFXXXXbaXpXXXXXXXXXX_!!2618602797.jpg');
INSERT INTO `product_image` VALUES ('20', '6', 'https://gd4.alicdn.com/imgextra/i4/2618602797/TB2bRZjiFXXXXapXXXXXXXXXXXX_!!2618602797.jpg');
INSERT INTO `product_image` VALUES ('21', '7', 'http://gd3.alicdn.com/bao/uploaded/i3/TB1Xjs9JpXXXXXVXFXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('22', '7', 'http://gd3.alicdn.com/imgextra/i3/768145972/TB28hzRfpXXXXXCXpXXXXXXXXXX_!!768145972.jpg');
INSERT INTO `product_image` VALUES ('23', '7', 'https://gd1.alicdn.com/imgextra/i1/TB1rwA3JpXXXXczXFXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('24', '8', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1WRi9GpXXXXagaXXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('25', '8', 'https://gd2.alicdn.com/imgextra/i2/863352317/TB2.bOCgXXXXXckXpXXXXXXXXXX_!!863352317.jpg');
INSERT INTO `product_image` VALUES ('26', '8', 'https://gd3.alicdn.com/imgextra/i3/863352317/TB2IoqzgXXXXXcDXpXXXXXXXXXX_!!863352317.jpg');
INSERT INTO `product_image` VALUES ('27', '8', 'https://gd3.alicdn.com/imgextra/i3/863352317/TB2ImeQgXXXXXcjXXXXXXXXXXXX_!!863352317.jpg');
INSERT INTO `product_image` VALUES ('28', '8', 'https://gd4.alicdn.com/imgextra/i4/TB1YRvKKXXXXXX2XVXXXXXXXXXX_!!0-item_pic.jpg');
INSERT INTO `product_image` VALUES ('29', '9', 'https://img.alicdn.com/bao/uploaded/i2/TB1nOOcHXXXXXaBXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('30', '9', 'https://img.alicdn.com/imgextra/i3/2076307274/TB2aRidgFXXXXcuXXXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('31', '9', 'https://img.alicdn.com/imgextra/i1/2076307274/TB2iO4BfFXXXXXWXXXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('32', '9', 'https://img.alicdn.com/imgextra/i3/2076307274/TB2p4lnfFXXXXcRXXXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('33', '9', 'https://img.alicdn.com/imgextra/i1/2076307274/TB26IM8fpXXXXcqXpXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('34', '10', 'https://img.alicdn.com/bao/uploaded/i3/TB1Y_LMFVXXXXXfXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('35', '10', 'https://img.alicdn.com/imgextra/i3/2076307274/TB2RF8JaXXXXXXWXpXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('36', '10', 'https://img.alicdn.com/imgextra/i4/2076307274/TB2O3tPaXXXXXcaXXXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('37', '10', 'https://img.alicdn.com/imgextra/i4/2076307274/TB2no0SaXXXXXXDXXXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('38', '10', 'https://img.alicdn.com/imgextra/i1/2076307274/TB2SkBLaXXXXXXKXpXXXXXXXXXX_!!2076307274.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('39', '11', 'https://img.alicdn.com/bao/uploaded/i2/TB1IBrkKpXXXXb.aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('40', '11', 'https://img.alicdn.com/imgextra/i3/479218086/TB2vqWcfXXXXXXOXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('41', '11', 'https://img.alicdn.com/imgextra/i4/479218086/TB2cOP5apXXXXXEXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('42', '11', 'https://img.alicdn.com/imgextra/i2/479218086/TB2ZHr2apXXXXazXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('43', '12', 'https://img.alicdn.com/bao/uploaded/i1/TB1hOzLKpXXXXcdXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('44', '12', 'https://img.alicdn.com/imgextra/i1/479218086/TB2KcBkfXXXXXXEXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('45', '12', 'https://img.alicdn.com/imgextra/i3/479218086/TB2rhLVepXXXXXPXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('46', '12', 'https://img.alicdn.com/imgextra/i1/479218086/TB2XMzYepXXXXXiXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('47', '12', 'https://img.alicdn.com/imgextra/i2/479218086/TB2bn1xeFXXXXXIXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('48', '13', 'https://img.alicdn.com/bao/uploaded/i2/TB1c5qPLXXXXXcXXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('49', '13', 'https://img.alicdn.com/imgextra/i2/479218086/TB21ZiRiVXXXXXcXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('50', '13', 'https://img.alicdn.com/imgextra/i2/479218086/TB2w12ViVXXXXaxXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('51', '13', 'https://img.alicdn.com/imgextra/i3/479218086/TB2DHTOiVXXXXbxXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('52', '13', 'https://img.alicdn.com/imgextra/i3/479218086/TB2QW7ZiVXXXXa5XXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('53', '14', 'https://img.alicdn.com/bao/uploaded/i4/TB1sc95LXXXXXaaXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('54', '14', 'https://img.alicdn.com/imgextra/i2/479218086/TB2F5EmiVXXXXXvXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('55', '14', 'https://img.alicdn.com/imgextra/i1/479218086/TB2zO9_iVXXXXXgXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('56', '14', 'https://img.alicdn.com/imgextra/i1/479218086/TB2HlGuiVXXXXXPXFXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('57', '15', 'https://img.alicdn.com/bao/uploaded/i2/TB17bDBKpXXXXX.XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('58', '15', 'https://img.alicdn.com/imgextra/i1/479218086/TB24wYafXXXXXa.XXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('59', '16', 'https://img.alicdn.com/bao/uploaded/i4/TB1F_Z.KFXXXXawXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('60', '16', 'https://img.alicdn.com/imgextra/i3/479218086/TB20IEjhVXXXXbWXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('61', '16', 'https://img.alicdn.com/imgextra/i1/479218086/TB2VwfRhpXXXXbxXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('62', '16', 'https://img.alicdn.com/imgextra/i4/479218086/TB2JPT2hpXXXXXrXXXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('63', '17', 'https://img.alicdn.com/bao/uploaded/i3/TB1NlsyKVXXXXaqXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('64', '17', 'https://img.alicdn.com/imgextra/i1/479218086/TB2iHPwipXXXXcLXpXXXXXXXXXX_!!479218086.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('65', '18', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1.CDlJFXXXXamXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('66', '18', 'https://gd2.alicdn.com/imgextra/i2/96843031/TB2je.PfpXXXXb0XpXXXXXXXXXX_!!96843031.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('67', '18', 'https://gd1.alicdn.com/imgextra/i1/96843031/TB2W38ffFXXXXaAXXXXXXXXXXXX_!!96843031.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('68', '18', 'https://gd4.alicdn.com/imgextra/i4/96843031/TB2BMQTfpXXXXbZXpXXXXXXXXXX_!!96843031.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('69', '19', 'https://img.alicdn.com/bao/uploaded/i2/TB1AImnLXXXXXbWXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('70', '19', 'https://img.alicdn.com/imgextra/i2/1734524150/TB21dw2iFXXXXXCXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('71', '19', 'https://img.alicdn.com/imgextra/i1/1734524150/TB2ow4fiVXXXXasXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('72', '19', 'https://img.alicdn.com/imgextra/i3/1734524150/TB2yHddiVXXXXaYXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('73', '20', 'https://img.alicdn.com/imgextra/i4/1734524150/TB20mk0hVXXXXctXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('74', '20', 'https://img.alicdn.com/imgextra/i1/1734524150/TB2tFcKhVXXXXcAXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('75', '20', 'https://img.alicdn.com/imgextra/i3/1734524150/TB2Hus2hVXXXXcVXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('76', '20', 'https://img.alicdn.com/imgextra/i4/1734524150/TB20mk0hVXXXXctXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('77', '21', 'https://img.alicdn.com/bao/uploaded/i3/TB14Nx5KVXXXXagXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('78', '21', 'https://img.alicdn.com/imgextra/i1/1734524150/TB2VC..hVXXXXagXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('79', '21', 'https://img.alicdn.com/imgextra/i4/1734524150/TB2Rj8diXXXXXc5XXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('80', '21', 'https://img.alicdn.com/imgextra/i3/1734524150/TB2UYJriXXXXXayXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('81', '21', 'https://img.alicdn.com/imgextra/i1/1734524150/TB2OsVgiXXXXXcFXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('82', '22', 'https://img.alicdn.com/bao/uploaded/i1/TB1YZGXLXXXXXaDXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('83', '22', 'https://img.alicdn.com/imgextra/i1/1734524150/TB2DVsNiFXXXXbZXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('84', '22', 'https://img.alicdn.com/imgextra/i3/1734524150/TB29F36iFXXXXclXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('85', '22', 'https://img.alicdn.com/imgextra/i4/1734524150/TB2S1c8iFXXXXb8XXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('86', '22', 'https://img.alicdn.com/imgextra/i4/1734524150/TB2S1c8iFXXXXb8XXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('88', '23', 'https://img.alicdn.com/bao/uploaded/i4/TB1LExAKVXXXXaHaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('89', '23', 'https://img.alicdn.com/imgextra/i2/1734524150/TB2udXriXXXXXaxXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('90', '23', 'https://img.alicdn.com/imgextra/i4/1734524150/TB2I1FmiXXXXXbBXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('91', '23', 'https://img.alicdn.com/imgextra/i4/1734524150/TB2dnhniXXXXXbmXXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('92', '24', 'https://img.alicdn.com/bao/uploaded/i1/TB1QawyJFXXXXbmXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('93', '24', 'https://img.alicdn.com/imgextra/i1/1734524150/TB24D91fFXXXXasXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('94', '24', 'https://img.alicdn.com/imgextra/i2/1734524150/TB2v4yQfFXXXXcOXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('95', '24', 'https://img.alicdn.com/imgextra/i3/1734524150/TB2yR2kfFXXXXX8XXXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('96', '24', 'https://img.alicdn.com/imgextra/i1/1734524150/TB26R5RfFXXXXchXpXXXXXXXXXX_!!1734524150.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('97', '25', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1WlnNKFXXXXaLaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('98', '25', 'https://gd3.alicdn.com/imgextra/i3/717695857/TB2jJcRhFXXXXXKXXXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('99', '25', 'https://gd1.alicdn.com/imgextra/i1/717695857/TB2MiMPhFXXXXalXXXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('100', '25', 'https://gd4.alicdn.com/imgextra/i4/717695857/TB2.RUwhFXXXXX6XpXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('101', '25', 'https://gd3.alicdn.com/imgextra/i3/717695857/TB2WccthFXXXXaEXpXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('102', '25', 'https://gd1.alicdn.com/imgextra/i1/TB1OffIKFXXXXbqaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('103', '26', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1BcrEKpXXXXahXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('104', '26', 'https://gd1.alicdn.com/imgextra/i1/TB1KIbiKpXXXXbfaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('105', '26', 'https://gd4.alicdn.com/imgextra/i4/TB1TjhBKpXXXXXeXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('106', '26', 'https://gd1.alicdn.com/imgextra/i1/TB1P5UuKpXXXXawaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('107', '27', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1jWL0LXXXXXbjXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('108', '27', 'https://gd1.alicdn.com/imgextra/i1/717695857/TB26WCRjXXXXXXvXXXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('109', '27', 'https://gd3.alicdn.com/imgextra/i3/717695857/TB2i3GFjXXXXXbPXXXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('110', '27', 'https://gd1.alicdn.com/imgextra/i1/717695857/TB25mWNjXXXXXX7XXXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('111', '27', 'https://gd3.alicdn.com/imgextra/i3/717695857/TB2BTyAjXXXXXcrXXXXXXXXXXXX_!!717695857.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('112', '27', 'https://gd4.alicdn.com/imgextra/i4/TB1qwscLXXXXXb6XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('113', '28', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1kMseIVXXXXX2apXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('114', '28', 'https://gd3.alicdn.com/imgextra/i3/315112083/TB2DJG3epXXXXXsXXXXXXXXXXXX_!!315112083.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('115', '28', 'https://gd1.alicdn.com/imgextra/i1/315112083/TB2LNqzepXXXXb9XpXXXXXXXXXX_!!315112083.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('116', '28', 'https://gd2.alicdn.com/imgextra/i2/315112083/TB2Uk91epXXXXX4XXXXXXXXXXXX_!!315112083.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('117', '28', 'https://gd4.alicdn.com/imgextra/i4/315112083/TB2AeiFepXXXXayXpXXXXXXXXXX_!!315112083.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('118', '29', 'https://img.alicdn.com/bao/uploaded/i1/TB1ZxsjGVXXXXa1XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('119', '29', 'https://img.alicdn.com/imgextra/i2/2030101063/TB220e6bpXXXXXuXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('120', '29', 'https://img.alicdn.com/imgextra/i1/2030101063/TB2V9C.bpXXXXbkXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('121', '29', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2fwHcbpXXXXXfXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('122', '29', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2fwHcbpXXXXXfXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('123', '30', 'https://img.alicdn.com/bao/uploaded/i1/TB1pO7DJFXXXXbbXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('124', '30', 'https://img.alicdn.com/imgextra/i3/TB1K97sJFXXXXbkXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('125', '30', 'https://img.alicdn.com/imgextra/i1/2030101063/TB26sK7fFXXXXbyXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('126', '30', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2GeGVfFXXXXXGXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('127', '30', 'https://img.alicdn.com/imgextra/i1/2030101063/TB2L3WWfFXXXXXCXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('128', '31', 'https://img.alicdn.com/bao/uploaded/i4/TB1I64GHXXXXXc_XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('129', '31', 'https://img.alicdn.com/imgextra/i1/2030101063/TB2Y6i9bpXXXXcmXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('130', '31', 'https://img.alicdn.com/imgextra/i1/2030101063/TB2NlPXbpXXXXaEXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('131', '31', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2kV99bpXXXXcVXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('132', '31', 'https://img.alicdn.com/imgextra/i1/2030101063/TB2hjq3bpXXXXa1XpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('133', '32', 'https://img.alicdn.com/bao/uploaded/i3/TB136XAJFXXXXXCXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('134', '32', 'https://img.alicdn.com/imgextra/i4/TB1hYcXJXXXXXXTXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('135', '32', 'https://img.alicdn.com/imgextra/i3/2030101063/TB29Yt9fpXXXXcWXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('136', '32', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2MP1afpXXXXb0XpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('137', '32', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2YrOnfpXXXXXIXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('138', '33', 'https://img.alicdn.com/bao/uploaded/i4/T1c.LlFqVbXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('139', '33', 'https://img.alicdn.com/imgextra/i4/2030101063/TB2I992bpXXXXbkXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('140', '33', 'https://img.alicdn.com/imgextra/i4/2030101063/TB20CO9bpXXXXcbXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('141', '33', 'https://img.alicdn.com/imgextra/i4/2030101063/TB2NDa3bpXXXXazXpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('142', '33', 'https://img.alicdn.com/imgextra/i1/2030101063/TB2L0a9bpXXXXb.XXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('144', '66', 'https://img.alicdn.com/bao/uploaded/i2/TB1y5UiGVXXXXbCXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('145', '66', 'https://img.alicdn.com/imgextra/i4/2030101063/T2MEUAXAdXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('146', '66', 'https://img.alicdn.com/imgextra/i4/2030101063/T26KQxXsVaXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('147', '66', 'https://img.alicdn.com/imgextra/i4/2030101063/T2dg7CXsxXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('148', '68', 'https://img.alicdn.com/bao/uploaded/i1/TB1fRrmHpXXXXbfXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('149', '68', 'https://img.alicdn.com/imgextra/i2/2030101063/TB2hyCMcXXXXXb0XpXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('150', '68', 'https://img.alicdn.com/imgextra/i4/2030101063/TB2mUO1cXXXXXX3XXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('151', '68', 'https://img.alicdn.com/imgextra/i2/2030101063/TB24HC0cXXXXXazXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('152', '68', 'https://img.alicdn.com/imgextra/i3/2030101063/TB2cAS3cXXXXXXlXXXXXXXXXXXX_!!2030101063.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('153', '69', 'https://img.alicdn.com/bao/uploaded/i2/TB1EfZeJpXXXXX_aXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('154', '69', 'https://img.alicdn.com/imgextra/i3/2174957589/TB224c3eFXXXXakXpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('155', '69', 'https://img.alicdn.com/imgextra/i2/2174957589/TB2QEI_eFXXXXcyXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('156', '69', 'https://img.alicdn.com/imgextra/i1/2174957589/TB2SJoZeFXXXXbdXpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('157', '69', 'https://img.alicdn.com/imgextra/i3/2174957589/TB2twNleVXXXXXuXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('158', '70', 'https://img.alicdn.com/bao/uploaded/i1/TB111s6HFXXXXapaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('159', '70', 'https://img.alicdn.com/imgextra/i2/2174957589/TB2gQS0cpXXXXcIXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('160', '70', 'https://img.alicdn.com/imgextra/i4/2174957589/TB2FM.pbFXXXXcmXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('161', '70', 'https://img.alicdn.com/imgextra/i4/2174957589/TB2X5EobFXXXXXHXpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('162', '70', 'https://img.alicdn.com/imgextra/i3/2174957589/TB2jm4heFXXXXapXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('163', '71', 'https://img.alicdn.com/bao/uploaded/i4/TB1gBWrHFXXXXXxaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('164', '71', 'https://img.alicdn.com/imgextra/i4/2174957589/TB2tuQzcpXXXXclXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('165', '71', 'https://img.alicdn.com/imgextra/i4/2174957589/TB2ZvsvcpXXXXaKXpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('166', '71', 'https://img.alicdn.com/imgextra/i3/2174957589/TB2NlAwcpXXXXX1XpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('167', '71', 'https://img.alicdn.com/imgextra/i4/2174957589/TB2KSwucpXXXXblXpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('168', '72', 'https://img.alicdn.com/bao/uploaded/i1/TB1UZ6AKXXXXXbFXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('169', '72', 'https://img.alicdn.com/imgextra/i3/2174957589/TB2bF3cgpXXXXbEXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('170', '72', 'https://img.alicdn.com/imgextra/i4/2174957589/TB2xGL8gpXXXXcyXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('171', '72', 'https://img.alicdn.com/imgextra/i1/2174957589/TB2KX2WgpXXXXbqXpXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('172', '72', 'https://img.alicdn.com/imgextra/i3/2174957589/TB29.AdgpXXXXbnXXXXXXXXXXXX_!!2174957589.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('173', '73', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1_1SPIpXXXXXxXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('174', '73', 'https://gd3.alicdn.com/imgextra/i3/279050215/TB2RQxReXXXXXbyXXXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('175', '73', 'https://gd3.alicdn.com/imgextra/i3/279050215/TB2Ky4yeXXXXXcgXpXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('176', '73', 'https://gd3.alicdn.com/imgextra/i3/279050215/TB23FRVeXXXXXbbXXXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('177', '73', 'https://gd4.alicdn.com/imgextra/i4/279050215/TB2CCXNeXXXXXbmXXXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('178', '74', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1dV27HpXXXXbsXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('179', '74', 'https://gd1.alicdn.com/imgextra/i1/370447121/TB2SUc8cpXXXXawXpXXXXXXXXXX_!!370447121.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('180', '75', 'https://gd3.alicdn.com/bao/uploaded/i3/TB13QS4IpXXXXbAXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('181', '75', 'https://gd2.alicdn.com/imgextra/i2/279050215/TB2.PJIeXXXXXXNXpXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('182', '75', 'https://gd3.alicdn.com/imgextra/i3/279050215/TB28D0HeXXXXXXnXpXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('183', '75', 'https://gd2.alicdn.com/imgextra/i2/279050215/TB2cwXSeXXXXXbrXXXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('184', '75', 'https://gd1.alicdn.com/imgextra/i1/279050215/TB2DbXVeXXXXXa9XXXXXXXXXXXX_!!279050215.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('185', '76', 'https://img.alicdn.com/bao/uploaded/i3/TB1M8v3KpXXXXaKXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('186', '76', 'https://img.alicdn.com/imgextra/i2/1715794551/TB2va6PhFXXXXXNXpXXXXXXXXXX_!!1715794551.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('187', '76', 'https://img.alicdn.com/imgextra/i4/1715794551/TB22tjGgVXXXXbQXpXXXXXXXXXX_!!1715794551.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('188', '76', 'https://img.alicdn.com/imgextra/i2/1715794551/TB2kCS8iVXXXXaeXpXXXXXXXXXX_!!1715794551.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('189', '75', 'https://img.alicdn.com/imgextra/i3/1715794551/TB2Sku.hVXXXXabXXXXXXXXXXXX_!!1715794551.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('190', '76', 'https://img.alicdn.com/imgextra/i3/1715794551/TB2Sku.hVXXXXabXXXXXXXXXXXX_!!1715794551.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('191', '77', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1NH.XKpXXXXb1XVXXXXXXXXXX_!!2-item_pic.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('192', '77', 'https://gd3.alicdn.com/imgextra/i3/2596791060/TB2tMxugpXXXXXDXXXXXXXXXXXX_!!2596791060.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('193', '77', 'https://gd4.alicdn.com/imgextra/i4/2596791060/TB2HsmxgXXXXXX_XpXXXXXXXXXX_!!2596791060.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('194', '77', 'https://gd2.alicdn.com/imgextra/i2/2596791060/TB2pNSygXXXXXXRXpXXXXXXXXXX_!!2596791060.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('195', '77', 'https://gd1.alicdn.com/imgextra/i1/2596791060/TB22S5PgXXXXXb6XpXXXXXXXXXX_!!2596791060.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('196', '77', 'https://gd3.alicdn.com/imgextra/i3/TB1zTUHJpXXXXcaXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('197', '78', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1_8hZKFXXXXb1XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('198', '78', 'https://gd1.alicdn.com/imgextra/i1/2167425226/TB2wECHgXXXXXbPXXXXXXXXXXXX_!!2167425226.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('199', '78', 'https://gd3.alicdn.com/imgextra/i3/2167425226/TB2eRaKgXXXXXbdXXXXXXXXXXXX_!!2167425226.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('200', '78', 'https://gd1.alicdn.com/imgextra/i1/2167425226/TB2jieMgXXXXXajXXXXXXXXXXXX_!!2167425226.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('201', '77', 'https://gd1.alicdn.com/imgextra/i1/TB1nXcFJVXXXXXzXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('202', '79', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1w1cQJFXXXXXHXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('203', '79', 'https://gd2.alicdn.com/imgextra/i2/2270737518/TB2KbPwfFXXXXaZXpXXXXXXXXXX_!!2270737518.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('204', '79', 'https://gd1.alicdn.com/imgextra/i1/2270737518/TB2C4HMfFXXXXbFXXXXXXXXXXXX_!!2270737518.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('205', '79', 'https://gd3.alicdn.com/imgextra/i3/2270737518/TB24rzQfFXXXXaLXXXXXXXXXXXX_!!2270737518.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('206', '79', 'https://gd3.alicdn.com/imgextra/i3/2270737518/TB24PPSfFXXXXX9XXXXXXXXXXXX_!!2270737518.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('207', '80', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1ZoDGKVXXXXcaXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('208', '80', 'https://gd4.alicdn.com/imgextra/i4/1050724148/TB2wcXofFXXXXbZXpXXXXXXXXXX_!!1050724148.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('209', '80', 'https://gd4.alicdn.com/imgextra/i4/1050724148/TB2UuXffFXXXXaOXpXXXXXXXXXX_!!1050724148.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('210', '80', 'https://gd3.alicdn.com/imgextra/i3/1050724148/TB2hYNGfFXXXXcbXXXXXXXXXXXX_!!1050724148.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('211', '80', 'https://gd4.alicdn.com/imgextra/i4/1050724148/TB2H14AfFXXXXXmXpXXXXXXXXXX_!!1050724148.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('212', '81', 'https://img.alicdn.com/bao/uploaded/i3/TB1B4XsJXXXXXc5XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('213', '81', 'https://img.alicdn.com/imgextra/i4/2090185144/TB2siQLepXXXXX3XXXXXXXXXXXX_!!2090185144.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('214', '81', 'https://img.alicdn.com/imgextra/i4/2090185144/TB2siQLepXXXXX3XXXXXXXXXXXX_!!2090185144.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('215', '81', 'https://img.alicdn.com/imgextra/i1/2090185144/TB2yWckepXXXXccXpXXXXXXXXXX_!!2090185144.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('216', '81', 'https://img.alicdn.com/imgextra/i4/2090185144/TB2UeMrepXXXXa.XpXXXXXXXXXX_!!2090185144.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('217', '82', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1PKk5KVXXXXaJXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('218', '82', 'https://gd3.alicdn.com/imgextra/i3/2276737355/TB2qz.jgpXXXXcdXXXXXXXXXXXX_!!2276737355.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('219', '82', 'https://gd2.alicdn.com/imgextra/i2/2276737355/TB2n2ImgpXXXXbDXXXXXXXXXXXX_!!2276737355.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('220', '82', 'https://gd1.alicdn.com/imgextra/i1/2276737355/TB2hAUsgpXXXXadXXXXXXXXXXXX_!!2276737355.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('221', '82', 'https://gd4.alicdn.com/imgextra/i4/2276737355/TB2QA8bhFXXXXX5XpXXXXXXXXXX_!!2276737355.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('222', '83', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1YraPKXXXXXcGXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('223', '83', 'https://gd2.alicdn.com/imgextra/i2/705235447/TB27vHFgVXXXXbXXpXXXXXXXXXX_!!705235447.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('224', '83', 'https://gd2.alicdn.com/imgextra/i2/705235447/TB290TZgVXXXXaLXXXXXXXXXXXX_!!705235447.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('225', '83', 'https://gd2.alicdn.com/imgextra/i2/705235447/TB2Xd_GgVXXXXaRXpXXXXXXXXXX_!!705235447.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('226', '83', 'https://gd2.alicdn.com/imgextra/i2/705235447/TB2AiY3gVXXXXXzXXXXXXXXXXXX_!!705235447.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('227', '84', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1WlJ9JFXXXXc_XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('228', '84', 'https://gd2.alicdn.com/imgextra/i2/404876642/TB2pUYdfpXXXXasXXXXXXXXXXXX_!!404876642.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('229', '84', 'https://gd3.alicdn.com/imgextra/i3/TB16Pd5JFXXXXa9XFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('230', '84', 'https://gd3.alicdn.com/imgextra/i3/404876642/TB2koWDfpXXXXa4XpXXXXXXXXXX_!!404876642.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('231', '84', 'https://gd4.alicdn.com/imgextra/i4/404876642/TB25BSIfpXXXXX_XpXXXXXXXXXX_!!404876642.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('232', '85', 'https://gd3.alicdn.com/bao/uploaded/i3/T1KKmxFhlhXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('233', '85', 'https://gd1.alicdn.com/imgextra/i1/11264027076206196/T1qzWzFmNcXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('234', '85', 'https://gd2.alicdn.com/imgextra/i2/708811264/T29jGYXmxbXXXXXXXX_!!708811264.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('235', '85', 'https://gd2.alicdn.com/imgextra/i2/708811264/T2FDI7XalaXXXXXXXX_!!708811264.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('236', '85', 'https://gd1.alicdn.com/imgextra/i1/708811264/TB2KxKhbXXXXXbGXXXXXXXXXXXX_!!708811264.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('237', '86', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1h74SKVXXXXXNaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('238', '86', 'https://gd3.alicdn.com/imgextra/i3/TB1kPbpLXXXXXXIXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('239', '86', 'https://gd3.alicdn.com/imgextra/i3/TB1HIKwKVXXXXaQXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('240', '86', 'https://gd2.alicdn.com/imgextra/i2/775679175/TB25icCfFXXXXcGXXXXXXXXXXXX_!!775679175.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('241', '87', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1RJ6_KpXXXXX7XFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('242', '87', 'https://gd4.alicdn.com/imgextra/i4/1111336523/TB2JB1NaFXXXXaIXXXXXXXXXXXX_!!1111336523.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('243', '87', 'https://gd4.alicdn.com/imgextra/i4/1111336523/TB2t0WNaFXXXXbcXXXXXXXXXXXX_!!1111336523.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('244', '87', 'https://gd3.alicdn.com/imgextra/i3/1111336523/TB2YWKFaFXXXXX0XpXXXXXXXXXX_!!1111336523.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('245', '87', 'https://gd4.alicdn.com/imgextra/i4/1111336523/TB21u1QaFXXXXXqXXXXXXXXXXXX_!!1111336523.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('246', '87', 'https://gd1.alicdn.com/imgextra/i1/TB1vulKJFXXXXcbXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('247', '88', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1lWATFVXXXXazXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('248', '88', 'https://gd1.alicdn.com/imgextra/i1/2466276267/TB2_9IRcVXXXXX_XXXXXXXXXXXX_!!2466276267.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('249', '88', 'https://gd1.alicdn.com/imgextra/i1/2466276267/TB2BvIJcVXXXXXmXpXXXXXXXXXX_!!2466276267.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('250', '89', 'https://img.alicdn.com/bao/uploaded/i2/TB1gJpmHFXXXXaZXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('251', '89', 'https://img.alicdn.com/imgextra/i2/2089040235/TB2iDu0cpXXXXbJXXXXXXXXXXXX_!!2089040235.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('252', '89', 'https://img.alicdn.com/imgextra/i2/2089040235/TB2ZnaVcpXXXXXQXpXXXXXXXXXX_!!2089040235.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('253', '89', 'https://img.alicdn.com/imgextra/i3/2089040235/TB2lmi0cpXXXXbLXXXXXXXXXXXX_!!2089040235.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('254', '89', 'https://img.alicdn.com/imgextra/i4/2089040235/TB2P5mzfpXXXXb2XpXXXXXXXXXX_!!2089040235.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('255', '90', 'https://gd1.alicdn.com/bao/uploaded/i1/TB18zhIKXXXXXb3XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('256', '90', 'https://gd2.alicdn.com/imgextra/i2/1935713747/TB2dy9LhXXXXXb5XpXXXXXXXXXX_!!1935713747.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('257', '90', 'https://gd4.alicdn.com/imgextra/i4/1935713747/TB2A_y4hXXXXXc4XXXXXXXXXXXX_!!1935713747.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('258', '90', 'https://gd2.alicdn.com/imgextra/i2/1935713747/TB2ym0GhFXXXXaVXpXXXXXXXXXX_!!1935713747.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('259', '90', 'https://gd4.alicdn.com/imgextra/i4/1935713747/TB2ym5ZhXXXXXauXpXXXXXXXXXX_!!1935713747.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('260', '90', 'https://gd1.alicdn.com/imgextra/i1/TB1es5dKFXXXXX8XFXXXXXXXXXX_!!2-item_pic.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('261', '91', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1tKj3KpXXXXacXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('262', '91', 'https://gd4.alicdn.com/imgextra/i4/TB15zKUKpXXXXXfXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('263', '91', 'https://gd4.alicdn.com/imgextra/i4/2691844682/TB2ShDdhFXXXXbgXpXXXXXXXXXX_!!2691844682.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('264', '91', 'https://gd4.alicdn.com/imgextra/i4/2691844682/TB2gh85hFXXXXb8XXXXXXXXXXXX_!!2691844682.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('265', '91', 'https://gd2.alicdn.com/imgextra/i2/2691844682/TB2jYuJipXXXXbXXXXXXXXXXXXX_!!2691844682.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('266', '92', 'https://gd2.alicdn.com/bao/uploaded/i2/TB14xDNGXXXXXcuXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('267', '92', 'https://gd3.alicdn.com/imgextra/i3/85056358/TB2B7PJaFXXXXahXXXXXXXXXXXX_!!85056358.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('268', '92', 'https://gd2.alicdn.com/imgextra/i2/85056358/TB2xqVVfFXXXXcCXXXXXXXXXXXX_!!85056358.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('269', '92', 'https://gd3.alicdn.com/imgextra/i3/85056358/TB2BO0EfFXXXXb_XpXXXXXXXXXX_!!85056358.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('270', '93', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1jTYSKFXXXXa1XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('271', '93', 'https://gd2.alicdn.com/imgextra/i2/706866823/TB2K4DuhFXXXXcKXXXXXXXXXXXX_!!706866823.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('272', '93', 'https://gd4.alicdn.com/imgextra/i4/706866823/TB256rwhFXXXXciXXXXXXXXXXXX_!!706866823.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('273', '93', 'https://gd3.alicdn.com/imgextra/i3/706866823/TB25DffhFXXXXbFXpXXXXXXXXXX_!!706866823.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('274', '93', 'https://gd2.alicdn.com/imgextra/i2/706866823/TB2eNPJhFXXXXXUXXXXXXXXXXXX_!!706866823.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('275', '94', 'https://gd2.alicdn.com/bao/uploaded/i2/TB18metLXXXXXXZXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('276', '94', 'https://gd3.alicdn.com/imgextra/i3/TB1SjaIKFXXXXcAXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('277', '94', 'https://gd4.alicdn.com/imgextra/i4/TB1OeJAHpXXXXbMaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('278', '94', 'https://gd3.alicdn.com/imgextra/i3/756946923/TB2ndlrhFXXXXXQXXXXXXXXXXXX_!!756946923.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('279', '94', 'https://gd1.alicdn.com/imgextra/i1/756946923/TB2VvUChXXXXXa1XXXXXXXXXXXX_!!756946923.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('280', '95', 'https://gd1.alicdn.com/bao/uploaded/i4/TB13UhgKVXXXXcSXFXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('281', '95', 'https://gd1.alicdn.com/imgextra/i1/1725447528/TB2bTI7hpXXXXa_XXXXXXXXXXXX_!!1725447528.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('282', '95', 'https://gd1.alicdn.com/imgextra/i1/1725447528/TB2I.cYhpXXXXc6XXXXXXXXXXXX_!!1725447528.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('283', '95', 'https://gd2.alicdn.com/imgextra/i2/1725447528/TB2VlK.gFXXXXbWXXXXXXXXXXXX_!!1725447528.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('284', '95', 'https://gd4.alicdn.com/imgextra/i4/1725447528/TB2RxfhgFXXXXalXXXXXXXXXXXX_!!1725447528.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('285', '96', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1S36UKFXXXXaRXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('286', '96', 'https://gd3.alicdn.com/imgextra/i3/1973499364/TB2pIrHiVXXXXcCXXXXXXXXXXXX_!!1973499364.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('287', '96', 'https://gd2.alicdn.com/imgextra/i2/1973499364/TB2x.KwipXXXXcCXpXXXXXXXXXX_!!1973499364.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('288', '96', 'https://gd4.alicdn.com/imgextra/i4/1973499364/TB2aAPqhFXXXXbZXXXXXXXXXXXX_!!1973499364.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('289', '96', 'https://gd1.alicdn.com/imgextra/i1/1973499364/TB27EeNgXXXXXaMXXXXXXXXXXXX_!!1973499364.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('290', '97', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1UxPPJFXXXXXRXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('291', '97', 'https://gd4.alicdn.com/imgextra/i4/677490090/TB2BTitfVXXXXavXXXXXXXXXXXX_!!677490090.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('292', '97', 'https://gd4.alicdn.com/imgextra/i4/677490090/TB2k2ukfVXXXXctXXXXXXXXXXXX_!!677490090.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('293', '97', 'https://gd2.alicdn.com/imgextra/i2/677490090/TB2tt8.fVXXXXbaXpXXXXXXXXXX_!!677490090.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('294', '97', 'https://gd4.alicdn.com/imgextra/i4/677490090/TB2cjJ.fVXXXXa5XpXXXXXXXXXX_!!677490090.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('295', '98', 'https://img.alicdn.com/bao/uploaded/i4/TB18jCZKXXXXXa7XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('296', '98', 'https://img.alicdn.com/imgextra/i4/1027572081/TB28mI2eFXXXXXOXXXXXXXXXXXX_!!1027572081.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('297', '98', 'https://img.alicdn.com/imgextra/i1/1027572081/TB2u5U5eXXXXXXTXpXXXXXXXXXX_!!1027572081.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('298', '98', 'https://img.alicdn.com/imgextra/i2/1027572081/TB2ijllepXXXXXBXXXXXXXXXXXX_!!1027572081.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('299', '98', 'https://img.alicdn.com/imgextra/i3/1027572081/TB2G.I5eXXXXXXPXpXXXXXXXXXX_!!1027572081.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('300', '99', 'https://gd2.alicdn.com/imgextra/i2/839668272/TB2rqvIgpXXXXbRXXXXXXXXXXXX_!!839668272.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('301', '99', 'https://gd3.alicdn.com/bao/uploaded/i3/TB14yLvJpXXXXavXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('302', '99', 'https://gd1.alicdn.com/imgextra/i1/839668272/TB27OYLgpXXXXaSXXXXXXXXXXXX_!!839668272.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('303', '99', 'https://gd2.alicdn.com/imgextra/i2/839668272/TB2ls6rgpXXXXaTXpXXXXXXXXXX_!!839668272.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('304', '100', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1Po6sIVXXXXcjaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('305', '100', 'https://gd3.alicdn.com/imgextra/i3/677608399/TB2bFyZeVXXXXb2XpXXXXXXXXXX_!!677608399.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('306', '100', 'https://gd2.alicdn.com/imgextra/i2/677608399/TB2tNi1eVXXXXbbXpXXXXXXXXXX_!!677608399.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('307', '100', 'https://gd3.alicdn.com/imgextra/i3/677608399/TB27zzbeVXXXXcwXXXXXXXXXXXX_!!677608399.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('308', '100', 'https://gd3.alicdn.com/imgextra/i3/677608399/TB2qwa8eVXXXXXJXpXXXXXXXXXX_!!677608399.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('309', '100', 'https://gd4.alicdn.com/imgextra/i4/TB13OF0JpXXXXbJXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('310', '101', 'https://img.alicdn.com/bao/uploaded/i4/TB1Ut3sKXXXXXcoXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('311', '101', 'https://img.alicdn.com/imgextra/i3/1955432108/TB2Uk_dgFXXXXX_XpXXXXXXXXXX_!!1955432108.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('312', '101', 'https://img.alicdn.com/imgextra/i4/1955432108/TB2UG_igFXXXXc_XXXXXXXXXXXX_!!1955432108.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('313', '101', 'https://img.alicdn.com/imgextra/i3/1955432108/TB2CcYcgFXXXXX4XpXXXXXXXXXX_!!1955432108.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('314', '102', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1SuTKGFXXXXcrXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('315', '102', 'https://gd1.alicdn.com/imgextra/i1/496404974/TB2HtK8aVXXXXbOXXXXXXXXXXXX_!!496404974.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('316', '102', 'https://gd1.alicdn.com/imgextra/i1/496404974/TB2CtW7aVXXXXcgXXXXXXXXXXXX_!!496404974.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('317', '102', 'https://gd4.alicdn.com/imgextra/i4/496404974/TB2Rzu6aVXXXXXqXpXXXXXXXXXX_!!496404974.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('318', '102', 'https://gd3.alicdn.com/imgextra/i3/496404974/TB2VPm5aVXXXXaBXpXXXXXXXXXX_!!496404974.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('319', '102', 'https://gd1.alicdn.com/imgextra/i5/TB1IYBUKFXXXXXEXVXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('320', '103', 'https://img.alicdn.com/bao/uploaded/i1/2057696833/TB2DRfugpXXXXbMXpXXXXXXXXXX_!!2057696833.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('321', '103', 'https://img.alicdn.com/imgextra/i3/2057696833/TB2AcrRgpXXXXbrXXXXXXXXXXXX_!!2057696833.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('322', '103', 'https://img.alicdn.com/imgextra/i3/2057696833/TB2vYrOgpXXXXcXXXXXXXXXXXXX_!!2057696833.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('323', '103', 'https://img.alicdn.com/imgextra/i4/2057696833/TB2hD2MgpXXXXcEXXXXXXXXXXXX_!!2057696833.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('324', '103', 'https://img.alicdn.com/imgextra/i3/2057696833/TB2fsnFgpXXXXXVXpXXXXXXXXXX_!!2057696833.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('325', '104', 'https://img.alicdn.com/bao/uploaded/i1/TB1CHXWGFXXXXaPXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('326', '104', 'https://img.alicdn.com/imgextra/i3/1792201176/TB2AHN3aVXXXXX4XpXXXXXXXXXX_!!1792201176.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('327', '104', 'https://img.alicdn.com/imgextra/i2/1792201176/TB2ABq7hXXXXXXWXpXXXXXXXXXX_!!1792201176.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('328', '104', 'https://img.alicdn.com/imgextra/i3/1792201176/TB2dDvQgVXXXXXAXpXXXXXXXXXX_!!1792201176.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('329', '104', 'https://img.alicdn.com/imgextra/i4/1792201176/TB2TWbrfXXXXXbSXXXXXXXXXXXX_!!1792201176.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('330', '105', 'https://img.alicdn.com/bao/uploaded/i3/1735932067/TB2GjIlipXXXXcqXXXXXXXXXXXX_!!1735932067.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('331', '105', 'https://img.alicdn.com/imgextra/i4/1735932067/TB2Q7gngVXXXXXwXXXXXXXXXXXX_!!1735932067.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('332', '105', 'https://img.alicdn.com/imgextra/i3/1735932067/TB2TZvGbVXXXXX5XXXXXXXXXXXX_!!1735932067.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('333', '105', 'https://img.alicdn.com/imgextra/i1/1735932067/TB2QGvwbVXXXXaXXXXXXXXXXXXX_!!1735932067.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('334', '106', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1_f_UHFXXXXbFXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('335', '106', 'https://gd3.alicdn.com/imgextra/i3/TB11JDaHFXXXXc1XFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('336', '106', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB2Vi_MhVXXXXXsXpXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('337', '106', 'https://gd1.alicdn.com/imgextra/i1/677978154/TB2dJD6hVXXXXX9XXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('338', '106', 'https://gd1.alicdn.com/imgextra/i1/677978154/TB2V6LIhVXXXXagXpXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('339', '107', 'https://gd1.alicdn.com/imgextra/i1/677978154/TB2o7HueFXXXXc5XXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('340', '107', 'https://gd3.alicdn.com/imgextra/i3/677978154/TB2Qn_HeFXXXXXWXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('341', '107', 'https://gd3.alicdn.com/imgextra/i3/677978154/TB2Qn_HeFXXXXXWXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('342', '107', 'https://gd1.alicdn.com/imgextra/i1/677978154/TB2LSLLeFXXXXXkXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('343', '107', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1I9p_GXXXXXXAXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('344', '107', 'https://gd1.alicdn.com/imgextra/i1/TB1yEVTGXXXXXa2XVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('345', '107', 'https://gd3.alicdn.com/imgextra/i3/TB1z5tXGXXXXXXaaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('346', '107', 'https://gd2.alicdn.com/imgextra/i2/677978154/TB2t53yaXXXXXaAXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('347', '107', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB235oraXXXXXaCXpXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('348', '108', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1I9p_GXXXXXXAXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('349', '108', 'https://gd4.alicdn.com/imgextra/i4/TB14K1dGpXXXXXVXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('350', '108', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB2bZoFaFXXXXaaXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('351', '108', 'https://gd3.alicdn.com/imgextra/i3/677978154/TB24VQFaFXXXXaOXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('352', '108', 'https://gd1.alicdn.com/imgextra/i1/677978154/TB22BufbXXXXXb4XXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('353', '109', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1ilzdHFXXXXcqXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('354', '109', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB2dHBpcFXXXXcwXXXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('355', '109', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB29AllcFXXXXasXpXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('356', '109', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB2aGRmcFXXXXapXpXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('357', '109', 'https://gd4.alicdn.com/imgextra/i4/677978154/TB2lw8lcFXXXXaHXpXXXXXXXXXX_!!677978154.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('358', '110', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1ilzdHFXXXXcqXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('359', '110', 'https://img.alicdn.com/bao/uploaded/i2/TB1UM6FLXXXXXbgXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('360', '110', 'https://img.alicdn.com/imgextra/i4/701751992/TB2KTawiFXXXXaTXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('361', '110', 'https://img.alicdn.com/imgextra/i3/701751992/TB2_uOMhpXXXXXJXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('362', '111', 'https://img.alicdn.com/bao/uploaded/i3/TB1QsfwKFXXXXXNaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('363', '111', 'https://img.alicdn.com/imgextra/i4/701751992/TB2CApVipXXXXXrXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('364', '111', 'https://img.alicdn.com/imgextra/i1/701751992/TB2BcZ0iFXXXXajXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('365', '111', 'https://img.alicdn.com/imgextra/i1/701751992/TB2pY5rgVXXXXcMXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('366', '111', 'https://img.alicdn.com/imgextra/i3/701751992/TB2Sg3.iFXXXXb9XXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('367', '112', 'https://img.alicdn.com/bao/uploaded/i3/TB1Dc0vJFXXXXb5XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('368', '112', 'https://img.alicdn.com/imgextra/i2/701751992/TB24nV4ipXXXXbvXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('369', '112', 'https://img.alicdn.com/imgextra/i1/701751992/TB2WySGgpXXXXaiXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('370', '112', 'https://img.alicdn.com/imgextra/i1/701751992/TB2SWpIdFXXXXX1XpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('371', '112', 'https://img.alicdn.com/imgextra/i1/701751992/TB2AO91fFXXXXcTXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('372', '113', 'https://img.alicdn.com/bao/uploaded/i2/TB1k1xXLpXXXXcBXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('373', '113', 'https://img.alicdn.com/imgextra/i1/701751992/TB27sFNipXXXXaYXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('374', '113', 'https://img.alicdn.com/imgextra/i1/701751992/TB2UJ93hpXXXXXSXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('375', '113', 'https://img.alicdn.com/imgextra/i3/701751992/TB2ISTFeVXXXXXtXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('376', '113', 'https://img.alicdn.com/imgextra/i4/701751992/TB2x40.fpXXXXbyXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('377', '114', 'https://img.alicdn.com/bao/uploaded/i2/TB1ZOsFKpXXXXaZaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('378', '114', 'https://img.alicdn.com/imgextra/i4/701751992/TB2.bmXipXXXXaaXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('379', '114', 'https://img.alicdn.com/imgextra/i4/701751992/TB2L_BLhpXXXXcjXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('380', '114', 'https://img.alicdn.com/imgextra/i2/701751992/TB2N_tRhpXXXXaBXpXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('381', '114', 'https://img.alicdn.com/imgextra/i2/701751992/TB2lhCXhpXXXXaCXXXXXXXXXXXX_!!701751992.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('382', '115', 'https://img.alicdn.com/bao/uploaded/i1/TB1nU6PLXXXXXavXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('383', '115', 'https://img.alicdn.com/imgextra/i4/883737303/TB2HlebhVXXXXavXXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('384', '115', 'https://img.alicdn.com/imgextra/i1/883737303/TB2am3whVXXXXbiXXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('385', '115', 'https://img.alicdn.com/imgextra/i2/883737303/TB2F9wxhVXXXXa_XXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('386', '115', 'https://img.alicdn.com/imgextra/i3/883737303/TB2bWsHhVXXXXXvXXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('387', '116', 'https://img.alicdn.com/bao/uploaded/i1/TB1zHvHLXXXXXcNXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('388', '116', 'https://img.alicdn.com/imgextra/i3/TB1Mte9JFXXXXatXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('389', '117', 'https://img.alicdn.com/imgextra/i1/883737303/TB2UbEmfpXXXXc6XXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('390', '117', 'https://img.alicdn.com/bao/uploaded/i1/TB1zHvHLXXXXXcNXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('391', '117', 'https://img.alicdn.com/imgextra/i3/TB1Mte9JFXXXXatXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('392', '117', 'https://img.alicdn.com/imgextra/i1/883737303/TB2xq.afpXXXXcgXpXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('393', '118', 'https://img.alicdn.com/bao/uploaded/i1/TB1tHjWLXXXXXXHXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('394', '118', 'https://img.alicdn.com/imgextra/i1/TB1wdqWKVXXXXXHXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('395', '118', 'https://img.alicdn.com/imgextra/i2/883737303/TB25OggiXXXXXa_XXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('396', '118', 'https://img.alicdn.com/imgextra/i3/883737303/TB27xwriXXXXXXHXXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('397', '118', 'https://img.alicdn.com/imgextra/i4/883737303/TB2ZAIkiXXXXXbiXXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('398', '119', 'https://img.alicdn.com/bao/uploaded/i1/TB1ZoDeLXXXXXXxaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('399', '119', 'https://img.alicdn.com/imgextra/i1/TB1b3pyLXXXXXaGXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('400', '119', 'https://img.alicdn.com/imgextra/i2/883737303/TB2vTjwiFXXXXbwXpXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('401', '119', 'https://img.alicdn.com/imgextra/i3/883737303/TB2MXrYiFXXXXbhXXXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('402', '119', 'https://img.alicdn.com/imgextra/i2/883737303/TB2_0_AiFXXXXa_XpXXXXXXXXXX_!!883737303.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('403', '120', 'https://img.alicdn.com/bao/uploaded/i2/TB1igtsLpXXXXc7XXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('404', '120', 'https://img.alicdn.com/imgextra/i2/551995190/TB2DzX2fFXXXXb9XXXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('405', '120', 'https://img.alicdn.com/imgextra/i4/551995190/TB2wmRJfFXXXXbGXpXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('406', '120', 'https://img.alicdn.com/imgextra/i4/551995190/TB2ND8HfFXXXXcaXpXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('407', '120', 'https://img.alicdn.com/imgextra/i2/551995190/TB2r_KugVXXXXbZXpXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('408', '121', 'https://img.alicdn.com/bao/uploaded/i2/TB1ONrGKVXXXXb0XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('409', '121', 'https://img.alicdn.com/imgextra/i1/551995190/TB2FRTMhXXXXXboXpXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('410', '121', 'https://img.alicdn.com/imgextra/i4/551995190/TB2qucchXXXXXXLXXXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('411', '121', 'https://img.alicdn.com/imgextra/i4/551995190/TB2dg25hXXXXXbAXXXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('412', '121', 'https://img.alicdn.com/imgextra/i2/551995190/TB2zLFThpXXXXXJXXXXXXXXXXXX_!!551995190.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('413', '122', 'https://img.alicdn.com/bao/uploaded/i4/TB1LVOQLXXXXXcsXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('414', '122', 'https://img.alicdn.com/imgextra/i4/2616970884/TB2Y5t1ipXXXXb3XXXXXXXXXXXX_!!2616970884.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('415', '122', 'https://img.alicdn.com/imgextra/i1/TB1n_DhKVXXXXclaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('416', '122', 'https://img.alicdn.com/imgextra/i1/2616970884/TB2eqV1ipXXXXb2XXXXXXXXXXXX_!!2616970884.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('417', '122', 'https://img.alicdn.com/imgextra/i3/2616970884/TB2OqG9hXXXXXbWXXXXXXXXXXXX_!!2616970884.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('418', '123', 'https://img.alicdn.com/bao/uploaded/i3/TB1IApgLpXXXXa_XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('419', '123', 'https://img.alicdn.com/imgextra/i4/429413615/TB2A6J_fpXXXXXLXpXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('420', '123', 'https://img.alicdn.com/imgextra/i2/429413615/TB24oJzhpXXXXbpXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('421', '123', 'https://img.alicdn.com/imgextra/i1/429413615/TB2W8hoeFXXXXacXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('422', '123', 'https://img.alicdn.com/imgextra/i4/429413615/TB2YaupcVXXXXX4XXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('423', '124', 'https://img.alicdn.com/bao/uploaded/i1/TB1GPMkLXXXXXXGXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('424', '124', 'https://img.alicdn.com/imgextra/i4/429413615/TB2WYjEfFXXXXaHXpXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('425', '124', 'https://img.alicdn.com/imgextra/i3/429413615/TB2qRLwfFXXXXX.XpXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('426', '124', 'https://img.alicdn.com/imgextra/i4/429413615/TB2x5D4fFXXXXXkXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('427', '124', 'https://img.alicdn.com/imgextra/i4/429413615/TB2iPgigFXXXXaRXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('428', '125', 'https://img.alicdn.com/bao/uploaded/i3/TB1JVZCLXXXXXX6XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('429', '125', 'https://img.alicdn.com/imgextra/i2/429413615/TB2j5SIgVXXXXXVXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('430', '125', 'https://img.alicdn.com/imgextra/i4/429413615/TB2s7E6gpXXXXXjXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('431', '125', 'https://img.alicdn.com/imgextra/i3/429413615/TB2_wHahFXXXXXsXFXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('432', '125', 'https://img.alicdn.com/imgextra/i4/429413615/TB2fpzugVXXXXaTXXXXXXXXXXXX_!!429413615.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('433', '126', 'https://img.alicdn.com/imgextra/i4/872411436/TB2h8dYjpXXXXb8XpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('434', '126', 'https://img.alicdn.com/bao/uploaded/i2/TB1cIcXLXXXXXX7XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('435', '126', 'https://img.alicdn.com/imgextra/i1/872411436/TB20du8hXXXXXcxXXXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('436', '126', 'https://img.alicdn.com/imgextra/i2/872411436/TB2A7_PepXXXXb_XpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('437', '126', 'https://img.alicdn.com/imgextra/i1/872411436/TB2Q.iMgFXXXXbEXpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('438', '127', 'https://img.alicdn.com/bao/uploaded/i2/TB1OSVwLpXXXXXsXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('439', '127', 'https://img.alicdn.com/imgextra/i4/872411436/TB24CpPjpXXXXbmXXXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('440', '127', 'https://img.alicdn.com/imgextra/i2/872411436/TB2eeeVfpXXXXaQXpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('441', '127', 'https://img.alicdn.com/imgextra/i3/872411436/TB2cbi0fpXXXXXQXpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('442', '127', 'https://img.alicdn.com/imgextra/i2/872411436/TB21rYhfpXXXXXyXXXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('443', '128', 'https://img.alicdn.com/bao/uploaded/i4/TB1rb0sLpXXXXXCXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('444', '128', 'https://img.alicdn.com/imgextra/i4/872411436/TB2.bifjpXXXXcuXXXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('445', '128', 'https://img.alicdn.com/imgextra/i4/872411436/TB2wua9cVXXXXb8XpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('446', '128', 'https://img.alicdn.com/imgextra/i4/872411436/TB2GgTncVXXXXasXXXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('447', '128', 'https://img.alicdn.com/imgextra/i4/872411436/TB2x.amhXXXXXXtXpXXXXXXXXXX_!!872411436.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('448', '129', 'https://img.alicdn.com/bao/uploaded/i1/TB1tpV.JpXXXXaNXXXX.02G.XXX_101155.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('449', '129', 'https://img.alicdn.com/bao/uploaded/i1/TB1BlkzLXXXXXbEXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('450', '129', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2nD6phpXXXXcVXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('451', '129', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2_LHXgpXXXXbWXXXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('452', '129', 'https://img.alicdn.com/imgextra/i4/1014281128/TB2WoragpXXXXbCXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('453', '130', 'https://img.alicdn.com/bao/uploaded/i3/TB1S6VfLpXXXXboXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('454', '130', 'https://img.alicdn.com/imgextra/i1/TB1qKexJFXXXXXCXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('455', '130', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2cf6AhpXXXXaFXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('456', '130', 'https://img.alicdn.com/imgextra/i2/1014281128/TB2138TiXXXXXcNXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('457', '130', 'https://img.alicdn.com/imgextra/i3/1014281128/TB2JwwvgpXXXXcbXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('458', '131', 'https://img.alicdn.com/bao/uploaded/i4/TB1N4ZYLXXXXXc1XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('459', '131', 'https://img.alicdn.com/imgextra/i2/1014281128/TB23Su9iFXXXXcNXXXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('460', '131', 'https://img.alicdn.com/imgextra/i4/1014281128/TB26HOWiFXXXXXtXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('461', '131', 'https://img.alicdn.com/imgextra/i3/1014281128/TB2a4i1iFXXXXc1XXXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('462', '131', 'https://img.alicdn.com/imgextra/i3/1014281128/TB2ZDf3iVXXXXbeXXXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('463', '132', 'https://img.alicdn.com/bao/uploaded/i1/TB1ygw6LXXXXXcnXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('464', '132', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2G4lybVXXXXbcXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('465', '132', 'https://img.alicdn.com/imgextra/i4/1014281128/TB2IcJdjXXXXXclXXXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('466', '132', 'https://img.alicdn.com/imgextra/i2/1014281128/TB2T281cVXXXXcqXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('467', '132', 'https://img.alicdn.com/imgextra/i4/1014281128/TB20vCgiFXXXXctXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('468', '133', 'https://img.alicdn.com/bao/uploaded/i7/TB1zj3jHXXXXXbCaFXXfmID7VXX_015758.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('469', '133', 'https://img.alicdn.com/bao/uploaded/i3/TB1avkpLXXXXXb3XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('470', '133', 'https://img.alicdn.com/imgextra/i1/470168984/TB2.IVJcFXXXXcRXXXXXXXXXXXX_!!470168984.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('471', '133', 'https://img.alicdn.com/imgextra/i4/470168984/TB2kidLcFXXXXbaXXXXXXXXXXXX_!!470168984.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('472', '133', 'https://img.alicdn.com/imgextra/i4/470168984/TB2nOencXXXXXXfXXXXXXXXXXXX_!!470168984.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('473', '134', 'https://img.alicdn.com/bao/uploaded/i1/TB1BlkzLXXXXXbEXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('474', '134', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2AN_zeVXXXXXdXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('475', '134', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2nD6phpXXXXcVXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('476', '134', 'https://img.alicdn.com/imgextra/i1/1014281128/TB2_LHXgpXXXXbWXXXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('477', '134', 'https://img.alicdn.com/imgextra/i4/1014281128/TB2WoragpXXXXbCXpXXXXXXXXXX_!!1014281128.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('478', '135', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1ItEaHVXXXXadXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('479', '135', 'https://gd2.alicdn.com/imgextra/i2/36129546/TB2V1zOeFXXXXX1XpXXXXXXXXXX_!!36129546.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('480', '135', 'https://gd1.alicdn.com/imgextra/i1/36129546/TB2g1fPeFXXXXabXpXXXXXXXXXX_!!36129546.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('481', '135', 'https://gd4.alicdn.com/imgextra/i4/36129546/TB2mT6MeFXXXXa3XpXXXXXXXXXX_!!36129546.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('482', '136', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1L.HyHpXXXXauXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('483', '136', 'https://gd3.alicdn.com/imgextra/i3/36129546/TB2KTD6eFXXXXXZXXXXXXXXXXXX_!!36129546.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('484', '136', 'https://gd2.alicdn.com/imgextra/i2/36129546/TB2b1_DeFXXXXc8XpXXXXXXXXXX_!!36129546.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('485', '136', 'https://gd1.alicdn.com/imgextra/i1/36129546/TB2h.vJeFXXXXa6XpXXXXXXXXXX_!!36129546.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('486', '137', 'https://img.alicdn.com/bao/uploaded/i4/TB1mV1RJFXXXXbnXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('487', '137', 'https://img.alicdn.com/imgextra/i3/1787161658/T2yi15XqXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('488', '137', 'https://img.alicdn.com/imgextra/i1/1787161658/T2b1W5XpdXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('489', '137', 'https://img.alicdn.com/imgextra/i4/1787161658/T2ig94XwRXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('490', '139', 'https://gd4.alicdn.com/imgextra/i4/215441878/T2DeUjXhdXXXXXXXXX_!!215441878.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('491', '139', 'https://gd4.alicdn.com/imgextra/i4/T1wn9SFyBcXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('492', '139', 'https://gd4.alicdn.com/imgextra/i4/215441878/T2DeUjXhdXXXXXXXXX_!!215441878.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('493', '139', 'https://gd3.alicdn.com/imgextra/i3/11878028803950963/T1CWmRXERfXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('494', '139', 'https://gd4.alicdn.com/imgextra/i4/215441878/T2DeUjXhdXXXXXXXXX_!!215441878.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('495', '140', 'https://img.alicdn.com/bao/uploaded/i1/TB1BJcfFVXXXXczXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('496', '140', 'https://img.alicdn.com/imgextra/i3/1787161658/TB22siVaXXXXXXnXpXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('497', '140', 'https://img.alicdn.com/imgextra/i1/1787161658/TB2zFyWaXXXXXXdXpXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('498', '140', 'https://img.alicdn.com/imgextra/i4/1787161658/TB2fjmQaXXXXXX1XpXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('499', '141', 'https://img.alicdn.com/bao/uploaded/i3/T1PuiRFkXcXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('500', '141', 'https://img.alicdn.com/imgextra/i1/1787161658/TB2uIXTapXXXXXGXpXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('501', '141', 'https://img.alicdn.com/imgextra/i2/1787161658/TB2caXSapXXXXcdXXXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('502', '141', 'https://img.alicdn.com/imgextra/i2/1787161658/TB25itQapXXXXbhXpXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('503', '142', 'https://img.alicdn.com/bao/uploaded/i1/TB1Tz5OJFXXXXblXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('504', '142', 'https://img.alicdn.com/imgextra/i1/1787161658/TB20Zf6apXXXXayXXXXXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('505', '143', 'https://img.alicdn.com/bao/uploaded/i1/TB1KOSpGVXXXXcrXXXXXXXXXXXX_!!2-item_pic.png_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('506', '143', 'https://img.alicdn.com/imgextra/i2/1787161658/T2UiBGXplbXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('507', '143', 'https://img.alicdn.com/imgextra/i3/1787161658/T2EGQVXchbXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('508', '143', 'https://img.alicdn.com/imgextra/i2/1787161658/T2lZlyXBNaXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('509', '143', 'https://img.alicdn.com/imgextra/i4/1787161658/T248lgXDhaXXXXXXXX_!!1787161658.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('510', '144', 'https://img.alicdn.com/bao/uploaded/i4/TB14NOSJFXXXXXcXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('511', '144', 'https://img.alicdn.com/imgextra/i2/T19S4NFvxfXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('512', '145', 'https://img.alicdn.com/bao/uploaded/i2/TB1mdcMKpXXXXbMXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('513', '145', 'https://img.alicdn.com/imgextra/i4/299716693/TB2kONbhpXXXXbZXpXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('514', '145', 'https://img.alicdn.com/imgextra/i4/TB1YOViJVXXXXX7XpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('515', '146', 'https://img.alicdn.com/bao/uploaded/i1/TB1xukmKVXXXXctXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('516', '146', 'https://img.alicdn.com/imgextra/i1/TB1.FoBKVXXXXbvXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('517', '146', 'https://img.alicdn.com/imgextra/i3/299716693/TB2JF.vipXXXXXRXpXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('518', '146', 'https://img.alicdn.com/imgextra/i1/299716693/TB2NJ3sipXXXXaGXpXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('519', '146', 'https://img.alicdn.com/imgextra/i4/299716693/TB2QfwDipXXXXcMXXXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('520', '147', 'https://img.alicdn.com/bao/uploaded/i4/TB14ecBGVXXXXaqXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('521', '147', 'https://img.alicdn.com/imgextra/i4/299716693/TB2lSEvaVXXXXXAXpXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('522', '147', 'https://img.alicdn.com/imgextra/i1/TB1zwyNGXXXXXb2aXXXXXXXXXXX_!!2-item_pic.png_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('523', '147', 'https://img.alicdn.com/imgextra/i4/299716693/TB2k4slaVXXXXcbXpXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('524', '148', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1qMFtKVXXXXb2XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('525', '148', 'https://gd2.alicdn.com/imgextra/i2/35199816/TB2wUWKhFXXXXbmXXXXXXXXXXXX_!!35199816.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('526', '148', 'https://gd1.alicdn.com/imgextra/i4/TB1j6p6KFXXXXcvXXXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('527', '148', 'https://gd1.alicdn.com/imgextra/i4/TB1iZhIKFXXXXavXVXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('528', '149', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1qMFtKVXXXXb2XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('529', '149', 'https://gd2.alicdn.com/imgextra/i2/35199816/TB2wUWKhFXXXXbmXXXXXXXXXXXX_!!35199816.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('530', '149', 'https://gd1.alicdn.com/imgextra/i4/TB1j6p6KFXXXXcvXXXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('531', '149', 'https://gd1.alicdn.com/imgextra/i4/TB1iZhIKFXXXXavXVXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('532', '149', 'https://img.alicdn.com/imgextra/i4/299716693/TB2QfwDipXXXXcMXXXXXXXXXXXX_!!299716693.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('533', '150', 'https://gd1.alicdn.com/imgextra/i1/2611679577/TB2a5R7hVXXXXXdXpXXXXXXXXXX_!!2611679577.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('534', '150', 'https://gd2.alicdn.com/imgextra/i2/2611679577/TB2ufMyiXXXXXXTXXXXXXXXXXXX_!!2611679577.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('535', '150', 'https://gd2.alicdn.com/imgextra/i2/2611679577/TB2_RZvhXXXXXbFXXXXXXXXXXXX_!!2611679577.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('536', '150', 'https://gd2.alicdn.com/imgextra/i2/2611679577/TB2ufMyiXXXXXXTXXXXXXXXXXXX_!!2611679577.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('537', '150', 'https://gd2.alicdn.com/imgextra/i2/2611679577/TB2ufMyiXXXXXXTXXXXXXXXXXXX_!!2611679577.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('538', '151', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1DsxfJXXXXXbXaXXXXXXXXXXX_!!2-item_pic.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('539', '151', 'https://gd3.alicdn.com/imgextra/i3/TB1H1wZIVXXXXX.XFXXXXXXXXXX_!!2-item_pic.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('540', '151', 'https://gd1.alicdn.com/imgextra/i1/15556660/TB2gsnGepXXXXaNXXXXXXXXXXXX_!!15556660.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('541', '151', 'https://gd1.alicdn.com/imgextra/i1/15556660/TB2PsvCepXXXXbvXXXXXXXXXXXX_!!15556660.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('542', '151', 'https://gd1.alicdn.com/imgextra/i1/15556660/TB2PsvCepXXXXbvXXXXXXXXXXXX_!!15556660.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('543', '152', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1uuR.IXXXXXcOXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('544', '152', 'https://gd2.alicdn.com/imgextra/i2/15556660/TB2V9IdcpXXXXc7XXXXXXXXXXXX_!!15556660.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('545', '152', 'https://gd4.alicdn.com/imgextra/i4/15556660/TB2f3EkcpXXXXXnXXXXXXXXXXXX_!!15556660.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('546', '153', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1M_egGVXXXXXpXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('547', '153', 'https://gd2.alicdn.com/imgextra/i2/15556660/TB2wzMTcFXXXXbOXXXXXXXXXXXX_!!15556660.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('548', '153', 'https://gd3.alicdn.com/imgextra/i3/15556660/TB2KbZOcFXXXXb.XXXXXXXXXXXX_!!15556660.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('549', '154', 'https://img.alicdn.com/bao/uploaded/i3/TB1X5AOLXXXXXacXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('550', '154', 'https://img.alicdn.com/imgextra/i1/676387207/TB2tWQYjXXXXXbEXXXXXXXXXXXX_!!676387207.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('551', '154', 'https://img.alicdn.com/imgextra/i4/676387207/TB2M_wYjXXXXXbnXXXXXXXXXXXX_!!676387207.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('552', '154', 'https://img.alicdn.com/imgextra/i2/676387207/TB2_DILjXXXXXabXpXXXXXXXXXX_!!676387207.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('553', '154', 'https://img.alicdn.com/imgextra/i3/676387207/TB2x1IUjXXXXXb0XXXXXXXXXXXX_!!676387207.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('554', '155', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1xPI5KpXXXXbhXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('555', '155', 'https://gd1.alicdn.com/imgextra/i1/TB1YYHHHFXXXXafXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('556', '155', 'https://gd1.alicdn.com/imgextra/i1/87414624/TB2Zb79hXXXXXcBXXXXXXXXXXXX_!!87414624.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('557', '155', 'https://gd3.alicdn.com/imgextra/i3/87414624/TB2xzlbhpXXXXaTXXXXXXXXXXXX_!!87414624.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('558', '156', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1fJR4FVXXXXbFXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('559', '156', 'https://gd3.alicdn.com/imgextra/i3/795598024/TB2NlJobXXXXXbKXXXXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('560', '156', 'https://gd1.alicdn.com/imgextra/i1/795598024/TB23aR_bpXXXXXWXXXXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('561', '156', 'https://gd4.alicdn.com/imgextra/i4/795598024/TB2QmOifXXXXXaRXpXXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('562', '156', 'https://gd1.alicdn.com/imgextra/i1/795598024/T2QehbXupXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('563', '157', 'https://gd2.alicdn.com/bao/uploaded/i2/12675030780382451/T1XqtdXz4kXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('564', '157', 'https://gd4.alicdn.com/imgextra/i4/12675031076778737/T1oMFOFb0fXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('565', '157', 'https://gd4.alicdn.com/imgextra/i4/1114102675/T2xOpOXfpeXXXXXXXX_!!1114102675.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('566', '157', 'https://gd1.alicdn.com/imgextra/i1/1114102675/T2isxNXgNeXXXXXXXX_!!1114102675.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('567', '157', 'https://gd4.alicdn.com/imgextra/i4/1114102675/T2WwWEXlNcXXXXXXXX_!!1114102675.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('568', '158', 'https://gd2.alicdn.com/bao/uploaded/i2/18024029414712172/T1Qk3xXfBgXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('569', '158', 'https://gd4.alicdn.com/imgextra/i4/795598024/T2AmDcXolaXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('570', '158', 'https://gd2.alicdn.com/imgextra/i2/795598024/T2l1BpXhlOXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('571', '158', 'https://gd2.alicdn.com/imgextra/i2/795598024/T2zbTdXlFXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('572', '158', 'https://gd1.alicdn.com/imgextra/i1/795598024/T28TjdXfRXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('573', '159', 'https://gd2.alicdn.com/bao/uploaded/i2/18024029414712172/T1Qk3xXfBgXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('574', '159', 'https://gd4.alicdn.com/imgextra/i4/795598024/T2AmDcXolaXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('575', '159', 'https://gd2.alicdn.com/imgextra/i2/795598024/T2l1BpXhlOXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('576', '159', 'https://gd2.alicdn.com/imgextra/i2/795598024/T2zbTdXlFXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('577', '159', 'https://gd1.alicdn.com/imgextra/i1/795598024/T28TjdXfRXXXXXXXXX_!!795598024.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('578', '160', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1Xo8sJVXXXXXPXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('579', '160', 'https://gd3.alicdn.com/imgextra/i3/704281834/TB28.Y7hpXXXXX9XpXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('580', '160', 'https://gd2.alicdn.com/imgextra/i2/704281834/TB2_Db.hpXXXXXkXpXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('581', '160', 'https://gd2.alicdn.com/imgextra/i2/704281834/TB2JwM6eFXXXXc5XpXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('582', '160', 'https://gd4.alicdn.com/imgextra/i4/704281834/TB2T2RqeVXXXXbvXXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('583', '161', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1rDivJVXXXXaraXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('584', '161', 'https://gd1.alicdn.com/imgextra/i3/TB1wT3KKpXXXXaHXFXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('585', '161', 'https://gd2.alicdn.com/imgextra/i2/704281834/TB2eIhTfXXXXXbQXXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('586', '161', 'https://gd4.alicdn.com/imgextra/i4/704281834/TB2HilMfXXXXXXEXpXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('587', '161', 'https://gd2.alicdn.com/imgextra/i2/704281834/TB2XnlzfXXXXXccXpXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('588', '162', 'https://gd4.alicdn.com/bao/uploaded/i4/TB184VzJVXXXXXWXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('589', '162', 'https://gd3.alicdn.com/imgextra/i3/704281834/TB2OMtcfVXXXXawXXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('590', '162', 'https://gd1.alicdn.com/imgextra/i1/704281834/TB29jZMfFXXXXb7XpXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('591', '162', 'https://gd2.alicdn.com/imgextra/i2/704281834/TB2JSk2fFXXXXc1XXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('592', '163', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1oG6mKpXXXXctXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('593', '163', 'https://gd2.alicdn.com/imgextra/i2/704281834/T2EumIXxtXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('594', '163', 'https://gd3.alicdn.com/imgextra/i3/11834028315656340/T1g_3qXXRfXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('595', '163', 'https://gd4.alicdn.com/imgextra/i4/704281834/T29xVKXAXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('596', '163', 'https://gd3.alicdn.com/imgextra/i3/704281834/T2h3SDXjtaXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('597', '164', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1WmJhLpXXXXabapXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('598', '164', 'https://gd1.alicdn.com/imgextra/i1/TB1yMnLKpXXXXcyXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('599', '164', 'https://gd4.alicdn.com/imgextra/i4/704281834/TB2zRHDjpXXXXc2XXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('600', '164', 'https://gd2.alicdn.com/imgextra/i2/704281834/TB2RonTjpXXXXbfXXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('601', '164', 'https://gd1.alicdn.com/imgextra/i1/704281834/TB2xdvSjpXXXXbiXXXXXXXXXXXX_!!704281834.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('602', '165', 'https://img.alicdn.com/imgextra/i3/823258756/TB2OyOTipXXXXcIXpXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('603', '165', 'https://img.alicdn.com/imgextra/i3/823258756/TB2QEHcipXXXXb.XXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('604', '165', 'https://img.alicdn.com/imgextra/i3/823258756/TB2OyOTipXXXXcIXpXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('605', '165', 'https://img.alicdn.com/imgextra/i4/823258756/TB2FecpgpXXXXaYXXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('606', '165', 'https://img.alicdn.com/imgextra/i4/823258756/TB2PDgjgpXXXXb6XXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('607', '166', 'https://img.alicdn.com/bao/uploaded/i2/TB1JDJKIpXXXXXpXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('608', '166', 'https://img.alicdn.com/imgextra/i2/823258756/TB2dLdzipXXXXc0XpXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('609', '166', 'https://img.alicdn.com/imgextra/i3/823258756/TB2lyZzdXXXXXXNXXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('610', '166', 'https://img.alicdn.com/imgextra/i3/823258756/TB2VbsDdXXXXXXrXXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('611', '166', 'https://img.alicdn.com/imgextra/i2/823258756/TB2AdsgdXXXXXbkXpXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('612', '167', 'https://img.alicdn.com/bao/uploaded/i1/TB1a0ypIpXXXXaNXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('613', '167', 'https://img.alicdn.com/imgextra/i4/823258756/TB2d1qaipXXXXXkXXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('614', '167', 'https://img.alicdn.com/imgextra/i3/823258756/TB2holJdpXXXXagXXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('615', '167', 'https://img.alicdn.com/imgextra/i3/823258756/TB2MLhydpXXXXb3XXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('616', '167', 'https://img.alicdn.com/imgextra/i1/823258756/TB2agFNdpXXXXXpXXXXXXXXXXXX_!!823258756.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('617', '168', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1eVDiLXXXXXXJXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('618', '168', 'https://gd4.alicdn.com/imgextra/i4/TB1UgqnKFXXXXbOXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('619', '168', 'https://gd4.alicdn.com/imgextra/i4/2121315529/TB20Zy8hXXXXXcwXXXXXXXXXXXX_!!2121315529.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('620', '168', 'https://gd1.alicdn.com/imgextra/i6/TB1D3SlKFXXXXcJXpXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('621', '168', 'https://gd1.alicdn.com/imgextra/i7/TB1NKyvKFXXXXcqXXXXYXGcGpXX_M2.SS2_400x400.jpg');
INSERT INTO `product_image` VALUES ('622', '169', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1diulLpXXXXcNXXXXXXXXXXXX_!!2-item_pic.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('623', '169', 'https://gd2.alicdn.com/imgextra/i2/TB1FaalKFXXXXcVXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('624', '169', 'https://gd2.alicdn.com/imgextra/i2/TB1MPcTJVXXXXavXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('625', '169', 'https://gd3.alicdn.com/imgextra/i3/2121315529/TB2oztDjFXXXXbuXXXXXXXXXXXX_!!2121315529.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('626', '169', 'https://gd3.alicdn.com/imgextra/i3/2121315529/TB2f_VzjFXXXXb8XXXXXXXXXXXX_!!2121315529.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('627', '170', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1T_E7KVXXXXb8aXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('628', '170', 'https://gd4.alicdn.com/imgextra/i4/TB1kJ7jKpXXXXXjaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('629', '170', 'https://gd3.alicdn.com/imgextra/i3/2121315529/TB2bjOQgXXXXXXtXXXXXXXXXXXX_!!2121315529.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('630', '170', 'https://gd3.alicdn.com/imgextra/i3/2121315529/TB2c_5pgXXXXXbsXpXXXXXXXXXX_!!2121315529.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('631', '170', 'https://gd2.alicdn.com/imgextra/i2/2121315529/TB2bjyIgXXXXXbvXXXXXXXXXXXX_!!2121315529.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('632', '171', 'https://img.alicdn.com/imgextra/i1/723795671/TB2dR5UhVXXXXarXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('633', '171', 'https://img.alicdn.com/imgextra/i4/723795671/TB20V7cipXXXXb0XXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('634', '171', 'https://img.alicdn.com/imgextra/i1/723795671/TB2a.cahVXXXXXNXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('635', '171', 'https://img.alicdn.com/imgextra/i2/723795671/TB2Dr47iVXXXXcMXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('636', '172', 'https://img.alicdn.com/bao/uploaded/i4/TB1tlo0KXXXXXbAXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('637', '172', 'https://img.alicdn.com/imgextra/i1/TB1Q1oiKXXXXXX7XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('638', '172', 'https://img.alicdn.com/imgextra/i3/723795671/TB2wcuhgFXXXXbEXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('639', '172', 'https://img.alicdn.com/imgextra/i1/723795671/TB2VTR9gFXXXXXDXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('640', '173', 'https://img.alicdn.com/imgextra/i1/723795671/TB2QcnMdVXXXXa_XXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('641', '173', 'https://img.alicdn.com/imgextra/i3/723795671/TB2MdTEdVXXXXXgXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('642', '173', 'https://img.alicdn.com/imgextra/i4/723795671/TB2dtPMdVXXXXbhXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('643', '173', 'https://img.alicdn.com/imgextra/i2/723795671/TB2kLnodVXXXXceXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('644', '174', 'https://img.alicdn.com/imgextra/i2/723795671/TB25en1jXXXXXXeXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('645', '174', 'https://img.alicdn.com/imgextra/i2/723795671/TB2Q.8GfXXXXXX5XpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('646', '174', 'https://img.alicdn.com/imgextra/i3/723795671/TB28AKciVXXXXbxXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('647', '174', 'https://img.alicdn.com/imgextra/i1/723795671/TB26PUCiFXXXXa.XpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('648', '175', 'https://img.alicdn.com/imgextra/i3/723795671/TB2OgaRipXXXXagXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('649', '175', 'https://img.alicdn.com/imgextra/i2/723795671/TB2HEvXgXXXXXcNXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('650', '175', 'https://img.alicdn.com/imgextra/i1/723795671/TB2LuTAipXXXXXIXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('651', '175', 'https://img.alicdn.com/imgextra/i2/723795671/TB2c0bigXXXXXaLXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('652', '176', 'https://img.alicdn.com/imgextra/i3/723795671/T2LcitXz8XXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('653', '176', 'https://img.alicdn.com/imgextra/i3/723795671/TB2cYLOaVXXXXXOXXXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('654', '176', 'https://img.alicdn.com/imgextra/i3/723795671/TB2IdYKbVXXXXXaXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('655', '176', 'https://img.alicdn.com/imgextra/i3/723795671/TB2qqPJaVXXXXbKXpXXXXXXXXXX_!!723795671.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('656', '177', 'https://img.alicdn.com/imgextra/i3/1734379566/TB2i6dYjFXXXXaHXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('657', '177', 'https://img.alicdn.com/imgextra/i1/1734379566/TB21b.khFXXXXaWXXXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('658', '177', 'https://img.alicdn.com/imgextra/i2/1734379566/TB29OkghFXXXXbPXXXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('659', '177', 'https://img.alicdn.com/imgextra/i3/1734379566/TB2bS.ghFXXXXb5XXXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('660', '178', 'https://img.alicdn.com/bao/uploaded/i3/TB15DuBLpXXXXaYXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('661', '178', 'https://img.alicdn.com/imgextra/i4/1734379566/TB2kmQbjXXXXXXYXpXXXXXXXXXX_!!1734379566.png_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('662', '178', 'https://img.alicdn.com/imgextra/i1/1734379566/TB2qQU0ipXXXXbQXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('663', '178', 'https://img.alicdn.com/imgextra/i4/1734379566/TB2fbmIhVXXXXbpXXXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('664', '179', 'https://img.alicdn.com/imgextra/i4/1734379566/TB2QmhZjFXXXXaAXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('665', '179', 'https://img.alicdn.com/imgextra/i2/1734379566/TB2WbLThFXXXXckXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('666', '179', 'https://img.alicdn.com/imgextra/i4/1734379566/TB2I6L9hFXXXXXkXpXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('667', '179', 'https://img.alicdn.com/imgextra/i2/1734379566/TB2TpoghFXXXXbLXXXXXXXXXXXX_!!1734379566.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('668', '180', 'https://img.alicdn.com/bao/uploaded/i3/TB1PjqxHXXXXXcYXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('669', '180', 'https://img.alicdn.com/imgextra/i3/2143043876/TB2ghyKbFXXXXbJXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('670', '180', 'https://img.alicdn.com/imgextra/i4/2143043876/TB208WNbFXXXXcDXXXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('671', '180', 'https://img.alicdn.com/imgextra/i2/2143043876/TB2hmNccFXXXXbRXXXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('672', '180', 'https://img.alicdn.com/imgextra/i4/2143043876/TB2rjhbcFXXXXcuXXXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('673', '181', 'https://img.alicdn.com/bao/uploaded/i4/TB1cZaXLpXXXXc3XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('674', '181', 'https://img.alicdn.com/imgextra/i1/2143043876/TB2atdPjFXXXXbmXXXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('675', '181', 'https://img.alicdn.com/imgextra/i4/TB1QcKtIpXXXXaPaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('676', '181', 'https://img.alicdn.com/imgextra/i2/2143043876/TB2fiOXdpXXXXaSXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('677', '181', 'https://img.alicdn.com/imgextra/i2/2143043876/TB2ZzybdpXXXXXPXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('678', '182', 'https://img.alicdn.com/imgextra/i1/2143043876/TB2mJjEjXXXXXXZXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('679', '182', 'https://img.alicdn.com/bao/uploaded/i3/TB1GRZDLXXXXXbZXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('680', '182', 'https://img.alicdn.com/imgextra/i3/2143043876/TB2cnP0jXXXXXXSXXXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('681', '182', 'https://img.alicdn.com/imgextra/i1/2143043876/TB2w8nnjXXXXXcKXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('682', '182', 'https://img.alicdn.com/imgextra/i3/2143043876/TB2xsHBjXXXXXaDXpXXXXXXXXXX_!!2143043876.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('683', '183', 'https://img.alicdn.com/imgextra/i4/2244471764/TB2_oRPgFXXXXX6XXXXXXXXXXXX_!!2244471764.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('684', '183', 'https://img.alicdn.com/bao/uploaded/i3/TB1trb4KXXXXXcDXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('685', '183', 'https://img.alicdn.com/imgextra/i8/TB1TJvKKXXXXXXVXVXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('686', '183', 'https://img.alicdn.com/imgextra/i6/TB1b12RKXXXXXa_XFXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('687', '183', 'https://img.alicdn.com/imgextra/i4/TB1uqYOKXXXXXb_XFXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('688', '184', 'https://img.alicdn.com/imgextra/i2/TB1U2bbKXXXXXX6XFXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('689', '184', 'https://img.alicdn.com/bao/uploaded/i2/TB1fPvIKXXXXXbJXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('690', '184', 'https://img.alicdn.com/imgextra/i8/TB15szoKXXXXXXgaXXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('691', '184', 'https://img.alicdn.com/imgextra/i1/TB1og6EKXXXXXXkXFXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('692', '184', 'https://img.alicdn.com/imgextra/i4/TB1CqDwKXXXXXc_XFXXYXGcGpXX_M2.SS2_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('693', '185', 'https://img.alicdn.com/bao/uploaded/i2/TB1M31BJVXXXXcMXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('694', '185', 'https://img.alicdn.com/imgextra/i2/TB1U5b5JXXXXXclaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('695', '185', 'https://img.alicdn.com/imgextra/i2/2271241536/TB23JKEeFXXXXaiXpXXXXXXXXXX_!!2271241536.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('696', '186', 'https://img.alicdn.com/bao/uploaded/i2/TB12q7iJVXXXXclXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('697', '186', 'https://img.alicdn.com/imgextra/i4/353571709/TB2BcVqipXXXXXAXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('698', '186', 'https://img.alicdn.com/imgextra/i2/353571709/TB27GA_fVXXXXc9XXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('699', '186', 'https://img.alicdn.com/imgextra/i4/353571709/TB2BwZejpXXXXbeXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('700', '186', 'https://img.alicdn.com/imgextra/i4/353571709/TB2BwZejpXXXXbeXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('701', '187', 'https://img.alicdn.com/bao/uploaded/i1/TB1O3KXLpXXXXXoXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('702', '187', 'https://img.alicdn.com/imgextra/i3/353571709/TB23caCcFXXXXb.XXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('703', '187', 'https://img.alicdn.com/imgextra/i1/353571709/TB20tWqcFXXXXaMXpXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('704', '187', 'https://img.alicdn.com/imgextra/i3/353571709/TB25QEygVXXXXcqXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('705', '187', 'https://img.alicdn.com/imgextra/i1/353571709/TB2OUqHhpXXXXXZXpXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('706', '188', 'https://img.alicdn.com/bao/uploaded/i1/TB1c0JhJpXXXXajXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('707', '188', 'https://img.alicdn.com/imgextra/i1/353571709/TB2di5veVXXXXXJXpXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('708', '188', 'https://img.alicdn.com/imgextra/i1/353571709/TB22yWAeVXXXXchXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('709', '188', 'https://img.alicdn.com/imgextra/i4/353571709/TB2.iyseVXXXXatXpXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('710', '188', 'https://img.alicdn.com/imgextra/i1/353571709/TB22yWAeVXXXXchXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('711', '189', 'https://img.alicdn.com/bao/uploaded/i4/TB18nPwIpXXXXXYXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('712', '189', 'https://img.alicdn.com/imgextra/i2/353571709/TB2dAp8aVXXXXcZXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('713', '189', 'https://img.alicdn.com/imgextra/i1/353571709/TB2wvWXaVXXXXXQXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('714', '189', 'https://img.alicdn.com/imgextra/i1/353571709/TB2qDiXaVXXXXXJXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('715', '189', 'https://img.alicdn.com/imgextra/i2/353571709/TB2VK04aVXXXXaKXpXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('716', '190', 'https://img.alicdn.com/bao/uploaded/i1/TB1oTGrLpXXXXaCXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('717', '190', 'https://img.alicdn.com/imgextra/i3/353571709/TB2bWyZgFXXXXaaXXXXXXXXXXXX_!!353571709.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('718', '191', 'https://gd4.alicdn.com/bao/uploaded/i4/TB12VhqLpXXXXarXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('719', '192', 'http://gd3.alicdn.com/bao/uploaded/i3/TB1Slp5LpXXXXcPXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('720', '193', 'https://img.alicdn.com/bao/uploaded/i3/TB1ERuBLpXXXXaRXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('721', '193', 'https://img.alicdn.com/imgextra/i2/320868932/TB236zzipXXXXbzXXXXXXXXXXXX_!!320868932.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('722', '193', 'https://img.alicdn.com/imgextra/i1/320868932/TB2jyfBipXXXXa7XXXXXXXXXXXX_!!320868932.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('723', '193', 'https://img.alicdn.com/imgextra/i1/320868932/TB2s6ryipXXXXbjXXXXXXXXXXXX_!!320868932.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('724', '193', 'https://img.alicdn.com/imgextra/i3/320868932/TB2NPvKipXXXXXyXXXXXXXXXXXX_!!320868932.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('725', '194', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1NK0uIFXXXXaTaXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('726', '195', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1FcjuKXXXXXbOXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('727', '195', 'https://gd3.alicdn.com/imgextra/i3/1924576555/TB2yX38gpXXXXadXXXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('728', '195', 'https://gd2.alicdn.com/imgextra/i2/1924576555/TB2LtQVgpXXXXcyXXXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('729', '195', 'https://gd4.alicdn.com/imgextra/i4/1924576555/TB2EkUJgpXXXXaNXpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('730', '195', 'https://gd3.alicdn.com/imgextra/i3/1924576555/TB2nowKgpXXXXaIXpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('731', '196', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1xxBPIpXXXXc4XpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('732', '196', 'https://gd2.alicdn.com/imgextra/i2/1924576555/TB28g3zcFXXXXa5XpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('733', '196', 'https://gd1.alicdn.com/imgextra/i1/1924576555/TB2h13IcFXXXXXGXpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('734', '196', 'https://gd2.alicdn.com/imgextra/i2/1924576555/TB2Bk7.cXXXXXa5XpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('735', '196', 'https://gd4.alicdn.com/imgextra/i4/1924576555/TB2Uq7KcFXXXXXdXpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('736', '197', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1NF3JGXXXXXc1XFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('737', '197', 'https://gd3.alicdn.com/imgextra/i3/1924576555/TB2sf1GaXXXXXa6XpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('738', '197', 'https://gd4.alicdn.com/imgextra/i4/1924576555/TB2bEOFaXXXXXa9XpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('739', '197', 'https://gd4.alicdn.com/imgextra/i4/1924576555/TB2Ls9PaXXXXXXwXXXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('740', '197', 'https://gd3.alicdn.com/imgextra/i3/1924576555/TB258aGaXXXXXaAXpXXXXXXXXXX_!!1924576555.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('741', '198', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1eZMGLXXXXXaCXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('742', '198', 'https://gd4.alicdn.com/imgextra/i4/TB1GL0aJXXXXXaIXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('743', '198', 'https://gd1.alicdn.com/imgextra/i1/2500034072/TB2dDldfFXXXXXwXpXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('744', '198', 'https://gd2.alicdn.com/imgextra/i2/2500034072/TB2UXFgfFXXXXXmXpXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('745', '199', 'https://gd3.alicdn.com/bao/uploaded/i3/TB1jpU2JXXXXXcOXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('746', '199', 'https://gd1.alicdn.com/imgextra/i1/2500034072/TB2vEKgfXXXXXbgXXXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('747', '199', 'https://gd2.alicdn.com/imgextra/i2/2500034072/TB2Yw85fXXXXXaEXpXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('748', '199', 'https://gd2.alicdn.com/imgextra/i2/2500034072/TB2JqV1fXXXXXbQXpXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('749', '199', 'https://gd1.alicdn.com/imgextra/i1/2500034072/TB2_MhZfXXXXXbQXpXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('750', '200', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1uq.uLXXXXXayXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('751', '200', 'https://gd4.alicdn.com/imgextra/i4/2500034072/TB2NibrdVXXXXXEXXXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('752', '200', 'https://gd1.alicdn.com/imgextra/i1/2500034072/TB28cnpdVXXXXaBXXXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('753', '200', 'https://gd4.alicdn.com/imgextra/i4/2500034072/TB2FW2XdVXXXXaTXpXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('754', '200', 'https://gd1.alicdn.com/imgextra/i1/2500034072/TB2Z8HhdVXXXXcAXXXXXXXXXXXX_!!2500034072.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('755', '201', 'https://img.alicdn.com/imgextra/i3/1660939881/TB2GV1ZhXXXXXaJXpXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('756', '201', 'https://img.alicdn.com/bao/uploaded/i1/TB1G1xJLXXXXXXUXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('757', '201', 'https://img.alicdn.com/imgextra/i1/1660939881/TB2LQwliFXXXXaoXXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('758', '201', 'https://img.alicdn.com/imgextra/i3/1660939881/TB2eD.XiFXXXXcOXXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('759', '201', 'https://img.alicdn.com/imgextra/i1/1660939881/TB26RMniFXXXXX8XXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('760', '202', 'https://img.alicdn.com/bao/uploaded/i3/TB1pFQyJFXXXXb0XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('761', '202', 'https://img.alicdn.com/imgextra/i3/1660939881/TB2PkB.ipXXXXX.XXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('762', '202', 'https://img.alicdn.com/imgextra/i2/1660939881/TB2OtCKgFXXXXb7XXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('763', '202', 'https://img.alicdn.com/imgextra/i4/1660939881/TB2MY9KgFXXXXcaXXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('764', '202', 'https://img.alicdn.com/imgextra/i1/1660939881/TB2rurbfFXXXXa3XpXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('765', '203', 'https://img.alicdn.com/imgextra/i2/1660939881/TB2zta5hXXXXXc2XXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('766', '203', 'https://img.alicdn.com/bao/uploaded/i1/TB1HtV1LXXXXXXPXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('767', '203', 'https://img.alicdn.com/imgextra/i3/1660939881/TB288cecXXXXXb1XpXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('768', '203', 'https://img.alicdn.com/imgextra/i3/1660939881/TB2nZ.lcXXXXXcBXXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('769', '203', 'https://img.alicdn.com/imgextra/i3/1660939881/TB2nZ.lcXXXXXcBXXXXXXXXXXXX_!!1660939881.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('770', '204', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2xR4tbXXXXXcoXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('771', '204', 'https://img.alicdn.com/imgextra/i4/1055263121/T2YbPpXG8XXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('772', '204', 'https://img.alicdn.com/imgextra/i1/1055263121/T2oSPdXLXaXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('773', '204', 'https://img.alicdn.com/imgextra/i1/1055263121/TB2P6c3aVXXXXcSXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('774', '205', 'https://img.alicdn.com/imgextra/i3/1055263121/TB21EFpbXXXXXczXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('775', '205', 'https://img.alicdn.com/bao/uploaded/i4/TB1yRJRGXXXXXcVXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('776', '205', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2OkDehFXXXXa0XpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('777', '205', 'https://img.alicdn.com/imgextra/i1/1055263121/T2rE96XhVbXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('778', '205', 'https://img.alicdn.com/imgextra/i1/1055263121/T2wa4PXiheXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('779', '206', 'https://img.alicdn.com/imgextra/i1/1055263121/T24L6cXz4XXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('780', '206', 'https://img.alicdn.com/imgextra/i2/1055263121/T2wtU5XftaXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('781', '206', 'https://img.alicdn.com/imgextra/i1/1055263121/T2x8s6XXFXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('782', '206', 'https://img.alicdn.com/imgextra/i4/1055263121/T2Lcc5XgRaXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('783', '207', 'https://img.alicdn.com/bao/uploaded/i4/TB1CQXkIVXXXXaRXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('784', '207', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2A9RweXXXXXbdXpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('785', '207', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2yipDeXXXXXc_XXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('786', '207', 'https://img.alicdn.com/imgextra/i3/1055263121/TB21.pweXXXXXXUXpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('787', '207', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2MqNLeXXXXXa.XXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('788', '208', 'https://img.alicdn.com/imgextra/i1/1055263121/TB2qXlsbXXXXXXRXpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('789', '208', 'https://img.alicdn.com/bao/uploaded/i3/TB1m8V3HXXXXXceapXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('790', '208', 'https://img.alicdn.com/imgextra/i4/1055263121/TB2nIwDaFXXXXb4XXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('791', '208', 'https://img.alicdn.com/imgextra/i4/1055263121/TB2WKMBaFXXXXc4XXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('792', '208', 'https://img.alicdn.com/imgextra/i3/1055263121/TB21NwCaFXXXXctXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('793', '209', 'https://img.alicdn.com/imgextra/i3/1055263121/TB2oV57aFXXXXa.XpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('794', '209', 'https://img.alicdn.com/imgextra/i2/1055263121/TB2UNgtdXXXXXasXXXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('795', '209', 'https://img.alicdn.com/imgextra/i3/1055263121/TB2oV57aFXXXXa.XpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('796', '209', 'https://img.alicdn.com/imgextra/i4/TB1FnXuIpXXXXbQXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('797', '209', 'https://img.alicdn.com/imgextra/i4/1055263121/TB22XWsXpXXXXb6XpXXXXXXXXXX_!!1055263121.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('798', '210', 'https://gd3.alicdn.com/bao/uploaded/i3/TB12BMnJpXXXXXiXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('799', '210', 'https://gd4.alicdn.com/imgextra/i4/680443512/TB2P_YJfXXXXXa0XpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('800', '210', 'https://gd4.alicdn.com/imgextra/i4/680443512/TB2VZf9fXXXXXXiXXXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('801', '210', 'https://gd4.alicdn.com/imgextra/i4/680443512/TB2GsDZfXXXXXbtXXXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('802', '210', 'https://gd4.alicdn.com/imgextra/i4/680443512/TB2nl6EfXXXXXbQXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('803', '211', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1TrGyIXXXXXbeXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('804', '211', 'https://gd3.alicdn.com/imgextra/i3/680443512/TB25LBugXXXXXcAXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('805', '211', 'https://gd1.alicdn.com/imgextra/i1/680443512/TB2RmFvgXXXXXceXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('806', '211', 'https://gd1.alicdn.com/imgextra/i1/680443512/TB2LetGgXXXXXXDXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('807', '211', 'https://gd1.alicdn.com/imgextra/i1/680443512/TB2Cl8ygXXXXXboXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('808', '212', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1qY66IFXXXXc7XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('809', '212', 'https://gd4.alicdn.com/imgextra/i4/680443512/TB2K.0HgXXXXXXrXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('810', '212', 'https://gd3.alicdn.com/imgextra/i3/680443512/TB2TSFAgXXXXXaQXpXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('811', '212', 'https://gd1.alicdn.com/imgextra/i1/680443512/TB2WFtKgXXXXXcVXXXXXXXXXXXX_!!680443512.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('812', '213', 'https://img.alicdn.com/imgextra/i2/1704064299/TB2DQSPjFXXXXcNXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('813', '213', 'https://img.alicdn.com/bao/uploaded/i1/TB1BS1WLpXXXXbLXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('814', '213', 'https://img.alicdn.com/imgextra/i3/1704064299/TB2GMAFgpXXXXc7XXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('815', '213', 'https://img.alicdn.com/imgextra/i3/1704064299/TB2vyaxjXXXXXbPXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('816', '214', 'https://img.alicdn.com/bao/uploaded/i2/TB1J57VKpXXXXa7XXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('817', '214', 'https://img.alicdn.com/imgextra/i2/692092802/TB2ctBSipXXXXXnXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('818', '214', 'https://img.alicdn.com/imgextra/i3/692092802/TB2O9PkhXXXXXXuXXXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('819', '214', 'https://img.alicdn.com/imgextra/i3/692092802/TB2NlwrgXXXXXXEXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('820', '214', 'https://img.alicdn.com/imgextra/i3/692092802/TB2B69HfVXXXXbpXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('821', '215', 'https://img.alicdn.com/bao/uploaded/i2/TB1YCrQJFXXXXXFXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('822', '215', 'https://img.alicdn.com/imgextra/i3/692092802/TB2Sr5cipXXXXXlXXXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('823', '215', 'https://img.alicdn.com/imgextra/i3/692092802/TB2RItrhFXXXXX0XpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('824', '215', 'https://img.alicdn.com/imgextra/i1/692092802/TB2VzBihFXXXXbfXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('825', '215', 'https://img.alicdn.com/imgextra/i1/692092802/TB2x4lcbFXXXXcbXXXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('826', '216', 'https://img.alicdn.com/bao/uploaded/i3/TB16CYXLXXXXXc0XVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('827', '216', 'https://img.alicdn.com/imgextra/i4/692092802/TB20gUSiVXXXXayXXXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('828', '216', 'https://img.alicdn.com/imgextra/i2/692092802/TB20iAuiVXXXXa_XpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('829', '216', 'https://img.alicdn.com/imgextra/i4/692092802/TB2y8MPiVXXXXa_XXXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('830', '216', 'https://img.alicdn.com/imgextra/i4/692092802/TB26eUkiVXXXXcCXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('831', '217', 'https://img.alicdn.com/bao/uploaded/i3/TB1uC5hLpXXXXaGXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('832', '217', 'https://img.alicdn.com/imgextra/i1/692092802/TB25jt9jFXXXXaDXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('833', '217', 'https://img.alicdn.com/imgextra/i4/692092802/TB2ZQlUbpXXXXaCXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('834', '217', 'https://img.alicdn.com/imgextra/i1/692092802/TB28BXRbpXXXXcOXpXXXXXXXXXX_!!692092802.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('835', '218', 'https://img.alicdn.com/imgextra/i4/1704064299/TB2GzdNjFXXXXcCXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('836', '218', 'https://img.alicdn.com/imgextra/i3/TB1Z.jEKpXXXXaMXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('837', '218', 'https://img.alicdn.com/imgextra/i2/1704064299/TB2USLUhFXXXXaIXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('838', '218', 'https://img.alicdn.com/imgextra/i4/1704064299/TB2ZBMbhFXXXXa8XXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('839', '219', 'https://img.alicdn.com/imgextra/i1/1704064299/TB2yHYWiFXXXXXiXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('840', '219', 'https://img.alicdn.com/imgextra/i4/1704064299/TB2seLriFXXXXaaXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('841', '219', 'https://img.alicdn.com/imgextra/i4/1704064299/TB27qzYiFXXXXXgXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('842', '219', 'https://img.alicdn.com/imgextra/i4/1704064299/TB27qzYiFXXXXXgXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('843', '220', 'https://img.alicdn.com/imgextra/i1/1704064299/TB2vHqcjFXXXXcfXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('844', '220', 'https://img.alicdn.com/imgextra/i2/1704064299/TB2e5oMhVXXXXazXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('845', '220', 'https://img.alicdn.com/imgextra/i4/1704064299/TB2B9cShVXXXXXlXpXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('846', '220', 'https://img.alicdn.com/imgextra/i3/1704064299/TB24kZyaFXXXXXWXXXXXXXXXXXX_!!1704064299.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('847', '221', 'https://gd2.alicdn.com/bao/uploaded/i2/TB12W08JFXXXXbHXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('848', '221', 'https://gd2.alicdn.com/imgextra/i2/TB1xTteIVXXXXX4XXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('849', '221', 'https://gd2.alicdn.com/imgextra/i2/TB1baAkJFXXXXXMXFXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('850', '221', 'https://gd4.alicdn.com/imgextra/i4/807689187/TB28lT6gpXXXXXYXXXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('851', '222', 'https://gd4.alicdn.com/bao/uploaded/i4/TB1uMMnKpXXXXbDXVXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('852', '222', 'https://gd3.alicdn.com/imgextra/i3/807689187/TB2m_OvipXXXXb0XXXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('853', '222', 'https://gd2.alicdn.com/imgextra/i2/807689187/TB2hDOtipXXXXcjXXXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('854', '222', 'https://gd4.alicdn.com/imgextra/i4/807689187/TB22IRBiFXXXXaPXpXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('855', '222', 'https://gd4.alicdn.com/imgextra/i4/807689187/TB2QCXRiFXXXXcuXXXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('856', '223', 'https://gd2.alicdn.com/bao/uploaded/i2/TB1yzRLJXXXXXbSXpXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('857', '223', 'https://gd2.alicdn.com/imgextra/i2/807689187/TB2ugqkjpXXXXbiXpXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('858', '223', 'https://gd2.alicdn.com/imgextra/i2/807689187/TB22YevjpXXXXXEXpXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('859', '224', 'https://gd2.alicdn.com/imgextra/i2/807689187/TB244pMgpXXXXX3XpXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('860', '224', 'https://gd1.alicdn.com/bao/uploaded/i1/TB1gw4kJXXXXXXDXXXXXXXXXXXX_!!0-item_pic.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('861', '224', 'https://gd3.alicdn.com/imgextra/i3/TB1BPDIJpXXXXc8XFXXXXXXXXXX_!!2-item_pic.png_400x400.jpg');
INSERT INTO `product_image` VALUES ('862', '224', 'https://gd1.alicdn.com/imgextra/i1/807689187/TB2y4B4ipXXXXbFXXXXXXXXXXXX_!!807689187.jpg_400x400.jpg');
INSERT INTO `product_image` VALUES ('863', '225', 'https://img.alicdn.com/bao/uploaded/i4/TB1W7aVLpXXXXaLXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('864', '225', 'https://img.alicdn.com/imgextra/i2/738517069/TB2_7joeVXXXXXvXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('865', '225', 'https://img.alicdn.com/imgextra/i2/738517069/TB28PmPgFXXXXXQXpXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('866', '225', 'https://img.alicdn.com/imgextra/i4/738517069/TB2RcKWgFXXXXbMXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('867', '226', 'https://img.alicdn.com/bao/uploaded/i2/TB11pfaLpXXXXc_XXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('868', '226', 'https://img.alicdn.com/imgextra/i3/738517069/TB2VFYMjFXXXXc8XXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('869', '226', 'https://img.alicdn.com/imgextra/i4/738517069/TB2OuaEgFXXXXaWXpXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('870', '226', 'https://img.alicdn.com/imgextra/i2/738517069/TB2pe5WgFXXXXbZXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('871', '226', 'https://img.alicdn.com/imgextra/i4/738517069/TB2ysiQfpXXXXbkXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('872', '227', 'https://img.alicdn.com/bao/uploaded/i2/TB1jQ57LpXXXXXsXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('873', '227', 'https://img.alicdn.com/imgextra/i2/738517069/TB2VPYLjFXXXXcJXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('874', '227', 'https://img.alicdn.com/imgextra/i3/738517069/TB2PFWmcFXXXXadXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('875', '227', 'https://img.alicdn.com/imgextra/i3/738517069/TB2wJKccFXXXXbUXpXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('876', '227', 'https://img.alicdn.com/imgextra/i1/738517069/TB2lmKkcFXXXXaOXXXXXXXXXXXX_!!738517069.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('877', '228', 'https://img.alicdn.com/bao/uploaded/i4/T1NN8nFPpbXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('878', '228', 'https://img.alicdn.com/imgextra/i2/735195464/TB2rWW1cpXXXXbTXpXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('879', '228', 'https://img.alicdn.com/imgextra/i4/735195464/TB2cC56cpXXXXXGXpXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('880', '228', 'https://img.alicdn.com/imgextra/i1/735195464/TB2nFfacpXXXXamXXXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('881', '228', 'https://img.alicdn.com/imgextra/i1/735195464/TB2nFfacpXXXXamXXXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('882', '229', 'https://img.alicdn.com/imgextra/i4/735195464/TB2PjZXepXXXXXGXXXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('883', '229', 'https://img.alicdn.com/bao/uploaded/i3/TB1R6o8IFXXXXXTXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('884', '229', 'https://img.alicdn.com/imgextra/i4/735195464/TB2jGP.epXXXXX8XXXXXXXXXXXX_!!735195464.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('885', '230', 'https://img.alicdn.com/imgextra/i1/TB1af2NLXXXXXa8XFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('886', '231', 'https://img.alicdn.com/imgextra/i3/TB1qguGHFXXXXawXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('887', '231', 'https://img.alicdn.com/imgextra/i4/1666865507/TB2YhhNcFXXXXaNXXXXXXXXXXXX_!!1666865507.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('888', '231', 'https://img.alicdn.com/imgextra/i4/1666865507/TB2ZoJHcFXXXXX7XpXXXXXXXXXX_!!1666865507.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('889', '232', 'https://img.alicdn.com/imgextra/i1/TB1qDewHFXXXXcuXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('890', '232', 'https://img.alicdn.com/bao/uploaded/i3/TB1FqmkLpXXXXcdXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('891', '232', 'https://img.alicdn.com/imgextra/i3/1666865507/TB28mVOcFXXXXXGXXXXXXXXXXXX_!!1666865507.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('892', '232', 'https://img.alicdn.com/imgextra/i1/1666865507/TB2ezBHcFXXXXadXpXXXXXXXXXX_!!1666865507.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('893', '233', 'https://img.alicdn.com/bao/uploaded/i2/TB1vu5XJXXXXXbdaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('894', '233', 'https://img.alicdn.com/imgextra/i2/TB1vdGmHFXXXXbOXVXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('895', '233', 'https://img.alicdn.com/imgextra/i2/1666865507/TB2qCdGcFXXXXaGXpXXXXXXXXXX_!!1666865507.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('896', '233', 'https://img.alicdn.com/imgextra/i1/1666865507/TB2YJNJcFXXXXXmXpXXXXXXXXXX_!!1666865507.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('897', '234', 'https://img.alicdn.com/bao/uploaded/i3/TB12hd9LpXXXXbWXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('898', '234', 'https://img.alicdn.com/imgextra/i2/1838142851/TB2dzxKcFXXXXa2XXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('899', '234', 'https://img.alicdn.com/imgextra/i1/1838142851/TB2EQ0ObVXXXXauXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('900', '234', 'https://img.alicdn.com/imgextra/i1/1838142851/TB2N0R0bVXXXXXoXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('901', '234', 'https://img.alicdn.com/imgextra/i2/1838142851/TB2k4pObVXXXXaWXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('902', '235', 'https://img.alicdn.com/bao/uploaded/i4/TB1MG9iLpXXXXXRXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('903', '235', 'https://img.alicdn.com/imgextra/i2/TB1ayrZJFXXXXbYXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('904', '235', 'https://img.alicdn.com/imgextra/i2/1838142851/TB2KCc3fVXXXXaxXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('905', '235', 'https://img.alicdn.com/imgextra/i2/1838142851/TB2TBiWgXXXXXaTXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('906', '235', 'https://img.alicdn.com/imgextra/i1/1838142851/TB2UDYPfVXXXXXbXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('907', '236', 'https://img.alicdn.com/bao/uploaded/i1/TB1YSd6LpXXXXXNXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('908', '236', 'https://img.alicdn.com/imgextra/i1/1838142851/TB20HEqbVXXXXbpXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('909', '236', 'https://img.alicdn.com/imgextra/i2/1838142851/TB2o5b7cpXXXXabXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('910', '236', 'https://img.alicdn.com/imgextra/i3/1838142851/TB2ocklbVXXXXasXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('911', '236', 'https://img.alicdn.com/imgextra/i4/1838142851/TB2a2y7dFXXXXaEXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('912', '237', 'https://img.alicdn.com/bao/uploaded/i2/TB1qXpNLpXXXXbMaXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('913', '237', 'https://img.alicdn.com/imgextra/i2/1838142851/TB2UiROgVXXXXafXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('914', '237', 'https://img.alicdn.com/imgextra/i1/1838142851/TB2DyRLgpXXXXbGXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('915', '237', 'https://img.alicdn.com/imgextra/i4/1838142851/TB20AtwgpXXXXaQXpXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('916', '237', 'https://img.alicdn.com/imgextra/i4/1838142851/TB2cjFOgpXXXXaxXXXXXXXXXXXX_!!1838142851.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('917', '238', 'https://img.alicdn.com/bao/uploaded/i4/TB1dySwLpXXXXbxXpXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('918', '238', 'https://img.alicdn.com/imgextra/i3/TB1hDseIXXXXXbrXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('919', '238', 'https://img.alicdn.com/imgextra/i2/389772453/TB2NRjZcFXXXXXMXpXXXXXXXXXX_!!389772453.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('920', '238', 'https://img.alicdn.com/imgextra/i2/389772453/TB2RVrRcFXXXXaxXpXXXXXXXXXX_!!389772453.jpg_430x430q90.jpg');
INSERT INTO `product_image` VALUES ('921', '239', 'https://img.alicdn.com/bao/uploaded/i1/TB1QniHLpXXXXatXXXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int(100) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(200) DEFAULT NULL,
  `shop_address` varchar(400) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=419 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '素缕旗舰店', '山东济南', '3');
INSERT INTO `shop` VALUES ('2', 'S家原创设计女装', '四川成都', '3');
INSERT INTO `shop` VALUES ('3', '七七之缘', '广东惠州', '3');
INSERT INTO `shop` VALUES ('4', '默默家精品女装', '浙江杭州', '3');
INSERT INTO `shop` VALUES ('5', '韩舍艳旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('6', '粉红大布娃娃', '上海', null);
INSERT INTO `shop` VALUES ('7', '顺淘企业店铺', '广东广州', null);
INSERT INTO `shop` VALUES ('8', '歌慕妮旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('9', '阿姐家', '浙江温州', null);
INSERT INTO `shop` VALUES ('10', 'e尚小站旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('11', '黛蜜妃女装旗舰店', '河南郑州', null);
INSERT INTO `shop` VALUES ('12', '怡然有衣街拍时尚', '浙江杭州', null);
INSERT INTO `shop` VALUES ('13', '薇漫蕾旗舰店', '河南郑州', null);
INSERT INTO `shop` VALUES ('14', '悦风铃旗舰店', '浙江宁波', null);
INSERT INTO `shop` VALUES ('15', '泌彩流纱旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('16', '井薇家店主实拍欧韩范', '广东广州', null);
INSERT INTO `shop` VALUES ('17', 'TWICELIFE 韩风女装', '广东广州', null);
INSERT INTO `shop` VALUES ('18', '温莎芭莎旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('19', '歌诗娅女装', '广东广州', null);
INSERT INTO `shop` VALUES ('20', 'omont服饰旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('21', '慕兮旗舰店', '广东深圳', null);
INSERT INTO `shop` VALUES ('22', '九美雪狐连锁店', '北京', null);
INSERT INTO `shop` VALUES ('23', '悦风铃旗舰店', '浙江宁波', null);
INSERT INTO `shop` VALUES ('24', 'qfour旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('25', '小诗原创设计', '浙江杭州', null);
INSERT INTO `shop` VALUES ('26', '库恩玛维旗舰店', '江苏连云港', null);
INSERT INTO `shop` VALUES ('27', 'MOKA中韩合营店', '广东广州', null);
INSERT INTO `shop` VALUES ('28', 'Ar show 艾日秀', '江苏无锡', null);
INSERT INTO `shop` VALUES ('29', '红相竹旗舰店', '广东东莞', null);
INSERT INTO `shop` VALUES ('30', '诺茵祥服饰总店', '四川成都', null);
INSERT INTO `shop` VALUES ('31', '百变伊伊', '广东广州', null);
INSERT INTO `shop` VALUES ('32', 'Shezshow 熙之秀女装', '广东广州', null);
INSERT INTO `shop` VALUES ('33', '依形于色旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('34', '柚子美衣韩版爆款店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('35', '富多莉服饰专营店', '广东广州', null);
INSERT INTO `shop` VALUES ('36', '美人鱼 日韩潮流女装', '广东广州', null);
INSERT INTO `shop` VALUES ('37', '穿花点水旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('38', '依名美旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('39', '女神范私人定制', '浙江杭州', null);
INSERT INTO `shop` VALUES ('40', 'Jenney珍妮衣橱', '广东广州', null);
INSERT INTO `shop` VALUES ('41', '恰那时花开', '广东揭阳', null);
INSERT INTO `shop` VALUES ('42', '潮流前线购', '香港香港岛', null);
INSERT INTO `shop` VALUES ('43', '香港正品女装名媛店', '福建厦门', null);
INSERT INTO `shop` VALUES ('44', '芸寇旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('45', '茵曼自营店', '广东广州', null);
INSERT INTO `shop` VALUES ('46', '恋色倾曼服饰旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('47', '丽人庄潮流女装', '浙江杭州', null);
INSERT INTO `shop` VALUES ('48', '慕娜时尚女装店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('49', '芷蔓服装', '广东广州', null);
INSERT INTO `shop` VALUES ('50', '索耳旗舰店', '河南郑州', null);
INSERT INTO `shop` VALUES ('51', '随衣服饰旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('52', '妙楚旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('53', '昕薇旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('54', '骆汐 大厂直供中高端女装', '福建宁德', null);
INSERT INTO `shop` VALUES ('55', '米欧奈旗舰店', '广东东莞', null);
INSERT INTO `shop` VALUES ('56', '卓越非凡衣橱', '上海', null);
INSERT INTO `shop` VALUES ('57', '半妆服饰品牌店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('58', '粉红大布娃娃云时尚专卖店', '上海', null);
INSERT INTO `shop` VALUES ('59', '星尚主流の女装', '吉林延边朝鲜族', null);
INSERT INTO `shop` VALUES ('60', '七月天使JulyStudio', '黑龙江哈尔滨', null);
INSERT INTO `shop` VALUES ('61', '奢娜旗舰店', '广东深圳', null);
INSERT INTO `shop` VALUES ('62', '梦妮原创女装', '浙江杭州', null);
INSERT INTO `shop` VALUES ('63', '路边滴新娘', '浙江嘉兴', null);
INSERT INTO `shop` VALUES ('64', '夏天家 韩国潮流女装', '浙江杭州', null);
INSERT INTO `shop` VALUES ('65', 'Shes Story', '浙江嘉兴', null);
INSERT INTO `shop` VALUES ('66', '夏阳美衣多风格快时尚', '浙江杭州', null);
INSERT INTO `shop` VALUES ('67', 'Zara香港专业代购', '香港香港岛', null);
INSERT INTO `shop` VALUES ('68', '依乐蜜', '浙江嘉兴', null);
INSERT INTO `shop` VALUES ('69', '香港爱美汇', '广东惠州', null);
INSERT INTO `shop` VALUES ('70', '韩都衣舍惟真专卖店', '山东济南', null);
INSERT INTO `shop` VALUES ('71', '不定义专柜店', '广东东莞', null);
INSERT INTO `shop` VALUES ('72', '飞絮游丝旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('73', '银色衣馆', '上海', null);
INSERT INTO `shop` VALUES ('74', '意树旗舰店', '上海', null);
INSERT INTO `shop` VALUES ('75', '巴黎格调男装专场', '福州', null);
INSERT INTO `shop` VALUES ('76', 'amii铭致专卖店', '浙江宁波', null);
INSERT INTO `shop` VALUES ('77', '独野服饰专营店', '上海', null);
INSERT INTO `shop` VALUES ('78', 'karrbleton旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('79', '红杉堡旗舰店', '山东淄博', null);
INSERT INTO `shop` VALUES ('80', 'ekecel旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('81', '贵公子休闲时尚男装', '浙江杭州', null);
INSERT INTO `shop` VALUES ('82', 'onttno傲徒旗舰店', '广东东莞', null);
INSERT INTO `shop` VALUES ('83', 'onttno傲徒旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('84', 'vanzols旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('85', '红杉堡旗舰店', '山东淄博', null);
INSERT INTO `shop` VALUES ('86', '男霸优衣库', '江苏苏州', null);
INSERT INTO `shop` VALUES ('87', '独野服饰专营店', '上海', null);
INSERT INTO `shop` VALUES ('88', '宝爵宾诺旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('89', '胖哥传奇旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('90', '凡转服饰', '广东广州', null);
INSERT INTO `shop` VALUES ('91', '汉森尼奥旗舰店', '浙江嘉兴', null);
INSERT INTO `shop` VALUES ('92', '永帅旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('93', '意大鹿旗舰店', '广东中山', null);
INSERT INTO `shop` VALUES ('94', '宝爵宾诺旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('95', '柠檬青衣', '浙江温州', null);
INSERT INTO `shop` VALUES ('96', '格莱鸟品牌专柜', '浙江嘉兴', null);
INSERT INTO `shop` VALUES ('97', '拓凡服饰专营店', '浙江宁波', null);
INSERT INTO `shop` VALUES ('98', '卡罗华旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('99', 'VA双人汇', '浙江杭州', null);
INSERT INTO `shop` VALUES ('100', '威克帝国旗舰店', '湖北武汉', null);
INSERT INTO `shop` VALUES ('101', '潮朝旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('102', 'noxwel旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('103', 'kiss潮界服饰', '广东广州', null);
INSERT INTO `shop` VALUES ('104', '「良木潮流男装」日系复古韩', '浙江杭州', null);
INSERT INTO `shop` VALUES ('105', '潮生服饰1988', '广东广州', null);
INSERT INTO `shop` VALUES ('106', '宾凯服饰专营店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('107', 'lzx服饰旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('108', 'd[s111370233]', '广东广州', null);
INSERT INTO `shop` VALUES ('109', '神奇布衣', '江苏苏州', null);
INSERT INTO `shop` VALUES ('110', '霆酷格柏专卖店', '广东广州', null);
INSERT INTO `shop` VALUES ('111', '简毅旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('112', '堡狮酷旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('113', '男神家大码男装', '上海', null);
INSERT INTO `shop` VALUES ('114', '方式旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('115', '缤慕左莎专卖店', '广东广州', null);
INSERT INTO `shop` VALUES ('116', 'summer男装时尚型男会社', '福建泉州', null);
INSERT INTO `shop` VALUES ('117', '香港专柜男装代购', '香港九龙', null);
INSERT INTO `shop` VALUES ('118', '麦酷狼族直销店', '福建泉州', null);
INSERT INTO `shop` VALUES ('119', '莱库旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('120', '密斯特服饰', '广东广州', null);
INSERT INTO `shop` VALUES ('121', 'vanzols旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('122', '蒙迪蚂蚁服饰旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('123', '棉田服饰旗舰店', '浙江金华', null);
INSERT INTO `shop` VALUES ('124', '名牌促销店', '广东广州', null);
INSERT INTO `shop` VALUES ('125', '七原润依专卖店', '福建泉州', null);
INSERT INTO `shop` VALUES ('126', '麻吉岛旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('127', '请大家支持薄利多销', '江苏苏州', null);
INSERT INTO `shop` VALUES ('128', '意树旗舰店', '上海', null);
INSERT INTO `shop` VALUES ('129', 'yezoe英佐旗厦专卖店', '上海', null);
INSERT INTO `shop` VALUES ('130', 'kissmepeople旗舰店', '广东中山', null);
INSERT INTO `shop` VALUES ('131', 'busttnd布圣尼旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('132', '名豪正品男装', '山东淄博', null);
INSERT INTO `shop` VALUES ('133', '戈蓝笛旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('134', '方式旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('135', '菲诺德旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('136', '牛仔潮儿', '广东广州', null);
INSERT INTO `shop` VALUES ('137', '九号球男装', '广东广州', null);
INSERT INTO `shop` VALUES ('138', 'lehondies旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('139', '百年祥狐男装店', '福建厦门', null);
INSERT INTO `shop` VALUES ('140', 'MRCYC原创日系男装 ', '上海', null);
INSERT INTO `shop` VALUES ('141', '步加图旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('142', '霆酷班佐专卖店', '广东广州', null);
INSERT INTO `shop` VALUES ('143', '骆驼男装旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('144', '流行坊男装o', '北京', null);
INSERT INTO `shop` VALUES ('145', 'Give Five', '浙江温州', null);
INSERT INTO `shop` VALUES ('146', '马登旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('147', '雅士町旗帜店', '浙江温州', null);
INSERT INTO `shop` VALUES ('148', '卡劲森旗舰店', '江苏苏州', null);
INSERT INTO `shop` VALUES ('149', '乔奈旗舰店', '浙江宁波', null);
INSERT INTO `shop` VALUES ('150', '雅玛登英伦风', '浙江温州', null);
INSERT INTO `shop` VALUES ('151', '马丁男士皮鞋', '上海', null);
INSERT INTO `shop` VALUES ('152', '拓岸男士皮鞋', '上海', null);
INSERT INTO `shop` VALUES ('153', 'crown皇冠鞋类官方旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('154', '韩都优鞋店', '上海', null);
INSERT INTO `shop` VALUES ('155', '乔奈旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('156', '诚信国际鞋业', '北京', null);
INSERT INTO `shop` VALUES ('157', 'andysworld旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('158', '公羊金品旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('159', '联泰商城', '浙江温州', null);
INSERT INTO `shop` VALUES ('160', '意大利代购Milano商务皮鞋', '福建厦门', null);
INSERT INTO `shop` VALUES ('161', '灵兔男鞋专营店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('162', '万鑫商城', '浙江温州', null);
INSERT INTO `shop` VALUES ('163', '冰冰小空姐代购', '香港香港岛', null);
INSERT INTO `shop` VALUES ('164', '名爵士旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('165', '沙驰旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('166', '耐宾鞋类旗舰店 ', '浙江温州', null);
INSERT INTO `shop` VALUES ('167', '穿尚鞋吧男鞋铺', '河北石家庄', null);
INSERT INTO `shop` VALUES ('168', '香港白玉店鞋业舰旗店', '福建泉州', null);
INSERT INTO `shop` VALUES ('169', '意大利阿玛尼男鞋皮鞋潮鞋馆', '福建泉州', null);
INSERT INTO `shop` VALUES ('170', '掏宝掏到宝', '浙江温州', null);
INSERT INTO `shop` VALUES ('171', '宝商服饰专营店', '河南郑州', null);
INSERT INTO `shop` VALUES ('172', '男鞋之家315鞋业', '北京', null);
INSERT INTO `shop` VALUES ('173', '贵族时尚男装城', '浙江杭州', null);
INSERT INTO `shop` VALUES ('174', '高档男鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('175', '神鞋正品', '广东深圳', null);
INSERT INTO `shop` VALUES ('176', '爱尚男鞋专购店', '广东深圳', null);
INSERT INTO `shop` VALUES ('177', '稳步旗舰店', '北京', null);
INSERT INTO `shop` VALUES ('178', 'tnj旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('179', '哲度旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('180', '欢迎皇家鞋柜', '福建泉州', null);
INSERT INTO `shop` VALUES ('181', '森足鞋吧', '浙江杭州', null);
INSERT INTO `shop` VALUES ('182', '狼峰嚎', '浙江温州', null);
INSERT INTO `shop` VALUES ('183', '缘名巷官旗店', '福建泉州', null);
INSERT INTO `shop` VALUES ('185', 'pardasaul帕达索旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('186', 'jkjk旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('187', '金莱仕男鞋', '浙江杭州', null);
INSERT INTO `shop` VALUES ('188', '足上生辉潮鞋店', '山西太原', null);
INSERT INTO `shop` VALUES ('189', '时尚百分百男鞋店', '上海', null);
INSERT INTO `shop` VALUES ('190', '豪瑞丨商城', '浙江温州', null);
INSERT INTO `shop` VALUES ('191', '尊贵品牌舰旗总店', '福建泉州', null);
INSERT INTO `shop` VALUES ('192', 'AT纯手工男鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('193', '一鞋走四方', '浙江温州', null);
INSERT INTO `shop` VALUES ('194', 'JQL上海英伦皮鞋总店', '上海', null);
INSERT INTO `shop` VALUES ('196', '爱格鞋业', '山东聊城', null);
INSERT INTO `shop` VALUES ('197', '足上生辉潮鞋店', '山西太原', null);
INSERT INTO `shop` VALUES ('198', '奥斯曼佰莱工厂店', '广东广州', null);
INSERT INTO `shop` VALUES ('199', '朗亨皮鞋', '山东聊城', null);
INSERT INTO `shop` VALUES ('200', '周氏鞋行2011', '北京', null);
INSERT INTO `shop` VALUES ('201', 'd[s109933323]', '浙江温州', null);
INSERT INTO `shop` VALUES ('202', '真诚男鞋', '北京', null);
INSERT INTO `shop` VALUES ('203', '路特斯鞋类专营店', '福建泉州', null);
INSERT INTO `shop` VALUES ('204', '红蜻蜓力弘专卖店', '上海', null);
INSERT INTO `shop` VALUES ('205', '骆驼男装旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('206', 'Heat爱3男鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('207', '风云男鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('208', 'playboy尚兔专卖店', '福建厦门', null);
INSERT INTO `shop` VALUES ('209', '柒拓品牌直销店', '山东聊城', null);
INSERT INTO `shop` VALUES ('210', 'XLK鞋铺', '山东聊城', null);
INSERT INTO `shop` VALUES ('211', '奔跑吧 兄弟鞋庄', '上海', null);
INSERT INTO `shop` VALUES ('212', '花花世界寻找公子 ', '浙江温州', null);
INSERT INTO `shop` VALUES ('213', '潮鞋一角', '浙江温州', null);
INSERT INTO `shop` VALUES ('214', '雅煊旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('215', 'vandimi范德米旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('216', '真皮品牌鞋厂销店', '浙江温州', null);
INSERT INTO `shop` VALUES ('218', '都市红孩子旗舰店', '浙江台州', null);
INSERT INTO `shop` VALUES ('219', '咖咖比熊旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('220', '巴布豆橙叶专卖店', '福建泉州', null);
INSERT INTO `shop` VALUES ('221', '上淇母婴专营店', '浙江温州', null);
INSERT INTO `shop` VALUES ('222', '木木兔旗舰店', '杭州', null);
INSERT INTO `shop` VALUES ('223', '浩特童鞋', '浙江台州', null);
INSERT INTO `shop` VALUES ('224', '特步官方旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('225', 'CXG潮鞋铺', '浙江杭州', null);
INSERT INTO `shop` VALUES ('226', '欧韩范儿高端女鞋', '香港九龙', null);
INSERT INTO `shop` VALUES ('227', '洋洋宝贝童鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('228', '行川鞋行', '浙江杭州', null);
INSERT INTO `shop` VALUES ('229', '361度童装旗舰店', '福建厦门', null);
INSERT INTO `shop` VALUES ('230', '洋洋宝贝童鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('231', '香港步步高童鞋折扣店', '福建泉州', null);
INSERT INTO `shop` VALUES ('232', '七波辉官方旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('233', '小七北鼻 童鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('234', 'didiaonvren旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('235', 'My方少潮牌男装', '浙江温州', null);
INSERT INTO `shop` VALUES ('236', '久久龙旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('237', '本店今日店庆全场5折', '北京', null);
INSERT INTO `shop` VALUES ('238', '圣得斯旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('239', '芭蒂兰旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('240', '匡跑鞋业', '浙江温州', null);
INSERT INTO `shop` VALUES ('241', '马登旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('242', '独角公羊潮鞋店', '山西太原', null);
INSERT INTO `shop` VALUES ('243', '尚步奇旗舰店', '福建厦门', null);
INSERT INTO `shop` VALUES ('244', '肆叶草鞋', '福建泉州', null);
INSERT INTO `shop` VALUES ('245', '正品男鞋购物中心', '浙江温州', null);
INSERT INTO `shop` VALUES ('246', 'andysworld旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('247', '点点光点男鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('248', '鞋在这儿鞋在这儿', '浙江温州', null);
INSERT INTO `shop` VALUES ('249', 'ouse讴色', '福建莆田', null);
INSERT INTO `shop` VALUES ('250', '美洋洋 鞋铺', '福建泉州', null);
INSERT INTO `shop` VALUES ('251', 'wlgd沃立谷德旗舰店', '上海', null);
INSERT INTO `shop` VALUES ('252', '娟娟货柜', '湖北武汉', null);
INSERT INTO `shop` VALUES ('253', '牧邮旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('254', 'PathFinder鞋类品牌店', '广东佛山', null);
INSERT INTO `shop` VALUES ('255', '上海精品鞋业', '上海', null);
INSERT INTO `shop` VALUES ('256', '豪川行鞋类专营店', '福建泉州', null);
INSERT INTO `shop` VALUES ('257', '爱购1号店', '广东广州', null);
INSERT INTO `shop` VALUES ('258', '柔沙鞋类旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('259', '花花公子杉米直销店', '浙江温州', null);
INSERT INTO `shop` VALUES ('260', '阿乐迪旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('261', '范哲仕', '福建泉州', null);
INSERT INTO `shop` VALUES ('262', '雷友旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('263', '狠爱旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('264', '丹丹2号店 金牌', '福建泉州', null);
INSERT INTO `shop` VALUES ('265', 'sk鞋类旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('266', 'dickies鞋类旗舰店', '上海', null);
INSERT INTO `shop` VALUES ('267', '福德轩鞋类旗舰店', '河南郑州', null);
INSERT INTO `shop` VALUES ('268', '库都概念旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('269', '有型鞋族', '浙江温州', null);
INSERT INTO `shop` VALUES ('270', '小凯鞋铺文艺轻复古男鞋', '浙江宁波', null);
INSERT INTO `shop` VALUES ('271', '联合创景品牌店', '浙江温州', null);
INSERT INTO `shop` VALUES ('272', '潮流时尚网络鞋店', '福建泉州', null);
INSERT INTO `shop` VALUES ('273', '太古原创品牌男鞋', '浙江杭州', null);
INSERT INTO `shop` VALUES ('274', '米戈邦旗舰店', '广东广州', null);
INSERT INTO `shop` VALUES ('275', '摩驰旗舰店', '福建厦门', null);
INSERT INTO `shop` VALUES ('276', 'cppc旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('277', '盛杰运动专营店', '福建泉州', null);
INSERT INTO `shop` VALUES ('278', '宅族部落旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('279', 'playboy花花公子 上俊店', '浙江温州', null);
INSERT INTO `shop` VALUES ('280', 'buuqqs旗舰店', '福建莆田', null);
INSERT INTO `shop` VALUES ('281', 'PLAYBOY正品直销店', '浙江温州', null);
INSERT INTO `shop` VALUES ('282', 'Mr bok男鞋男装店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('283', '阿源金牌卖家男鞋店', '福建泉州', null);
INSERT INTO `shop` VALUES ('284', '潮郎仔旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('285', '米戈邦原创男鞋', '广东广州', null);
INSERT INTO `shop` VALUES ('286', 'NG男鞋工厂1号店', '广东广州', null);
INSERT INTO `shop` VALUES ('287', '子俊男装', '浙江杭州', null);
INSERT INTO `shop` VALUES ('288', '法希澳尼旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('289', '佐拉奴旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('290', '亿聚鞋类专营店', '福建泉州', null);
INSERT INTO `shop` VALUES ('291', '森蒂旗航店', '福建泉州', null);
INSERT INTO `shop` VALUES ('292', '大唐世家熠致专卖店', '浙江温州', null);
INSERT INTO `shop` VALUES ('293', '美洲爵士旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('294', 'okko旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('295', 'vismix旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('296', '惟森旗舰店', '福建莆田', null);
INSERT INTO `shop` VALUES ('298', '杰希尼旗舰店', '福建福州', null);
INSERT INTO `shop` VALUES ('299', '昊远国际鞋业', '福建泉州', null);
INSERT INTO `shop` VALUES ('300', 'Lz 潮鞋馆', '陕西西安', null);
INSERT INTO `shop` VALUES ('301', '奈堡罗鞋城', '陕西西安', null);
INSERT INTO `shop` VALUES ('302', '潮府男鞋', '福建泉州', null);
INSERT INTO `shop` VALUES ('303', '立欧娜真皮品牌店', '浙江温州', null);
INSERT INTO `shop` VALUES ('304', '『伊文高』高端定制', '广东广州', null);
INSERT INTO `shop` VALUES ('305', '牛奋男鞋社', '广东广州', null);
INSERT INTO `shop` VALUES ('306', '森列夫旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('307', '履舍鞋铺', '陕西西安', null);
INSERT INTO `shop` VALUES ('308', '佧特森旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('309', '2018旗舰店', '浙江温州', null);
INSERT INTO `shop` VALUES ('310', '奇步森旗航店', '福建泉州', null);
INSERT INTO `shop` VALUES ('311', '三和鞋社', '浙江杭州', null);
INSERT INTO `shop` VALUES ('312', '时尚男鞋专售', '福建泉州', null);
INSERT INTO `shop` VALUES ('313', '木林森鞋类旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('314', '古洋城鞋类旗舰店 ', '福建泉州', null);
INSERT INTO `shop` VALUES ('315', '瑞瑞淘淘精品鞋铺', '福建泉州', null);
INSERT INTO `shop` VALUES ('316', 'usy旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('317', '大花小花小小花原创定制小码男装店FLOWERZOU', '广东广州', null);
INSERT INTO `shop` VALUES ('318', '鞋柜驿站', '浙江温州', null);
INSERT INTO `shop` VALUES ('319', '希路猎人旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('320', '小歪帆布鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('321', '爱酷时尚坊', '江苏徐州', null);
INSERT INTO `shop` VALUES ('322', '扬天鞋类专营店', '福建福州', null);
INSERT INTO `shop` VALUES ('323', '非凡鞋族', '浙江温州', null);
INSERT INTO `shop` VALUES ('324', '瞭望者男鞋', '浙江温州', null);
INSERT INTO `shop` VALUES ('325', '淘鞋网人本帆布鞋店', '广东广州', null);
INSERT INTO `shop` VALUES ('326', '乌77 wu77style 欧美韩系 原', '广东广州', null);
INSERT INTO `shop` VALUES ('327', '信步布鞋店', '山东临沂', null);
INSERT INTO `shop` VALUES ('328', '德拉玛旗舰店', '福建泉州', null);
INSERT INTO `shop` VALUES ('329', '爱快运动户外专营店', '福建泉州', null);
INSERT INTO `shop` VALUES ('330', 'vivo官方旗舰店 ', '广东东莞', null);
INSERT INTO `shop` VALUES ('394', '蓝易数码专营店', '广东深圳', null);
INSERT INTO `shop` VALUES ('395', '苏宁易购官方旗舰店 ', '江苏南京', null);
INSERT INTO `shop` VALUES ('396', '海信电视官方旗舰店 ', '电器城佛山仓', null);
INSERT INTO `shop` VALUES ('397', '西门子百诚专卖店 ', '浙江杭州', null);
INSERT INTO `shop` VALUES ('398', '美的冰箱旗舰店 ', '电器城佛山仓', null);
INSERT INTO `shop` VALUES ('399', '海尔官方旗舰店 ', '山东青岛', null);
INSERT INTO `shop` VALUES ('400', '多隆数码专营店 ', '浙江杭州', null);
INSERT INTO `shop` VALUES ('401', '京东数码专营店 ', '北京', null);
INSERT INTO `shop` VALUES ('402', '戎美 慢时光快时尚', '江苏苏州', null);
INSERT INTO `shop` VALUES ('403', '星期八全球进口美食汇', '重庆', null);
INSERT INTO `shop` VALUES ('404', 'zerofront旗舰店', '浙江杭州', null);
INSERT INTO `shop` VALUES ('405', '宸心宸翼 TB环球母婴店 ', '湖北武汉', null);
INSERT INTO `shop` VALUES ('406', '大品牌小店面 ', '福建泉州', null);
INSERT INTO `shop` VALUES ('407', '鸭子不漂亮箱包 ', '上海', null);
INSERT INTO `shop` VALUES ('408', 'artmi旗舰店 ', '浙江杭州', null);
INSERT INTO `shop` VALUES ('409', '浪漫之旅中国体验店', '北京', null);
INSERT INTO `shop` VALUES ('410', '朵道尔旗舰店 ', '广东广州', null);
INSERT INTO `shop` VALUES ('411', 'snoopy童装旗舰店 ', '上海', null);
INSERT INTO `shop` VALUES ('412', '巨爵体育 ', '上海', null);
INSERT INTO `shop` VALUES ('413', '凤舞真皮女鞋 ', '上海', null);
INSERT INTO `shop` VALUES ('414', '静熙旗舰店 ', '福建莆田', null);
INSERT INTO `shop` VALUES ('415', '光度旗舰店 ', '福建泉州', null);
INSERT INTO `shop` VALUES ('416', '松下空调旗舰店', '电器城佛山', null);
INSERT INTO `shop` VALUES ('417', '格力官方旗舰店 ', '浙江杭州', null);
INSERT INTO `shop` VALUES ('418', '长虹空调旗舰店 ', '电器城佛山', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `login_password` varchar(100) NOT NULL,
  `pay_password` varchar(100) DEFAULT NULL,
  `user_phone` char(11) NOT NULL,
  `user_number` varchar(40) DEFAULT NULL,
  `user_photo` varchar(200) DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
