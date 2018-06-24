/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : hmb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-21 14:08:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a1', 'wxz', '111');

-- ----------------------------
-- Table structure for `buyer`
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `bid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  `sid` char(32) DEFAULT NULL,
  PRIMARY KEY (`bid`),
  UNIQUE KEY `loginname` (`loginname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES ('1', 'bsk', '111', '2423284519@qq.com', '18816793332', '广东省', '1', '2E4049B5F65B4F438A32664B44EA5663863DD67839DF4034813957BAA6AF0A95', '1');
INSERT INTO `buyer` VALUES ('10', 'ydd', '111', 'Lbxxx2017@163.com', '18816793858', '岗顶', '1', '0FEBE745E2E7448A9BC82B22987F18C6904860F965D24A99BF0A8602E9884058', '5');
INSERT INTO `buyer` VALUES ('11', 'btx', '111', 'Lbxx2017@163.com', '13655554448', '广财', '1', '2E4049B5F65B4F438A32664B44EA5663863DD67839DF4013957BAA6AF0A95', '9');
INSERT INTO `buyer` VALUES ('12', 'ltm', '111', 'Lbxx33x2017@163.com', '13225554448', '广药', '1', '2E4049B5F65B4F438A32664B44EA5663863DD6783F4013957BAA6AF0A95', '10');
INSERT INTO `buyer` VALUES ('13', 'rx', '111', 'Lbxxx3332017@163.com', '13655334448', '广金', '1', '2E4049B5F65B4F438A32664B44EA5663863DD67839DF4034813957BAA6AF0A', '11');
INSERT INTO `buyer` VALUES ('14', 'zlmlt', '111', '112sss23@qq.com', '12255554448', '荔湾', '1', '2E4049B5F6333333', '14');
INSERT INTO `buyer` VALUES ('15', '1218', '111', '112ssaas23@qq.com', '13655554448', '岗顶', '1', '4444555666666666', '15');
INSERT INTO `buyer` VALUES ('16', 'ljs', '111', '11dd2sss23@qq.com', '13655557748', '岗顶', '1', '4444555556666666555', '16');
INSERT INTO `buyer` VALUES ('17', 'xbxmc', '111', '112ssssdff23@qq.com', '13622254448', '广药', '1', '44445555566666785555', '17');
INSERT INTO `buyer` VALUES ('2', 'kdj', '111', 'Lbx2017@163.com', '18816793877', '仲恺', '1', '444455555666666666', '2');
INSERT INTO `buyer` VALUES ('3', 'zgf', '111', '1123@qq.com', '18816793858', '北京路', '1', 'E16345BD96E846C8A8F5BEF5F9A31BA25E5871F521054CD1945E7E6E444FD91E', '4');
INSERT INTO `buyer` VALUES ('4', 'lks', '111', '11223@qq.com', '18816793335', '江南西', '1', '43AE81AE62714D90ADAC2D9474E03BB4DBF2A073105B42DCB1D47BC788AA8F06', '3');
INSERT INTO `buyer` VALUES ('5', 'dks', '111', '11dd223@qq.com', '13660368888', '天河', '1', '666666666666666666', '6');
INSERT INTO `buyer` VALUES ('6', 'bbl', '111', '112ff23@qq.com', '13660368878', '仲恺', '1', '666666666666777777', '7');
INSERT INTO `buyer` VALUES ('7', 'sly', '111', '1122223@qq.com', '13660367777', '广东省', '1', '666666666888886667', '8');
INSERT INTO `buyer` VALUES ('8', 'zyw', '111', 'Lbxx8017@163.com', '13633554448', '上下九', '1', '2E4049B5F65B4F438A32664B44EA5663863DD67839DF4034813', '12');
INSERT INTO `buyer` VALUES ('9', 'ygf', '111', 'Lbxxx44417@163.com', '13655554448', '荔湾', '1', '2E4049B5F6', '13');
INSERT INTO `buyer` VALUES ('B07611D8A9274909A997312BB80AB8F8', 'zdm', '123', '1234456@qq.com', '13660566766', 'zhku', '0', '92506F13853C4B00B5B742A153353495515ADD453A4D4224B101BFDC08DB5050', 'BADDC568FD3948D6BCFCD16097C9C478');
INSERT INTO `buyer` VALUES ('B4171460179F4FBC8ED5F20A9793B9E2', 'sss', '123', '77777@qq.com', '14785298352', '广财', '0', '921C78F3ABB1442F9D5B0906566DA1A768F0EA8FB8D844C88B9C284803985A94', null);
INSERT INTO `buyer` VALUES ('EC66299D757A42A6A51D39C85D1B790E', 'xu466252995', '1111', '4444@qq.com', '14785296352', '大元帅府', '0', 'B5CE2E6F7B9B468AB38DAA912981B1DF76645C166AD64D198121AD8121C05AAA', null);

-- ----------------------------
-- Table structure for `b_order`
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_order_buyer` (`bid`) USING BTREE,
  CONSTRAINT `FK_order_buyer` FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_order
-- ----------------------------
INSERT INTO `b_order` VALUES ('0278232355F8413BA1AE39F920637126', '2017-05-02 09:42:25', '29.99', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('0958BC03D49B41D6A08F7CF5D52EA84D', '2018-06-20 14:56:44', '12.00', 'zhku', '13660566766', 'B07611D8A9274909A997312BB80AB8F8');
INSERT INTO `b_order` VALUES ('132024BCD0F04E3B970D1D1164D78B13', '2018-06-19 21:10:33', '4.00', '广财', '14785298352', 'B4171460179F4FBC8ED5F20A9793B9E2');
INSERT INTO `b_order` VALUES ('1728A8F4F5EB49218545BF01416F5D83', '2018-06-15 21:26:17', '40.00', '广财', '14785298352', 'B4171460179F4FBC8ED5F20A9793B9E2');
INSERT INTO `b_order` VALUES ('22D15D3EE43141F8990C00A88AA54016', '2017-05-03 11:56:47', '59.90', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('245603DF069D454DBB76B54C05B9D457', '2018-06-15 21:35:10', '35.00', '大元帅府', '14785296352', 'EC66299D757A42A6A51D39C85D1B790E');
INSERT INTO `b_order` VALUES ('248641B280CC4F7C8A94A8024CE663D1', '2017-06-02 08:12:54', '64.00', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('32C8B8FF79D148A7ABF0FEB671B741FE', '2017-05-02 09:33:58', '38.90', '广州', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('34991FC330D74E6CB6F59E130BEED4BB', '2018-06-15 14:56:24', '47.00', '广东省', '18816793335', '4');
INSERT INTO `b_order` VALUES ('391AB6B882AB4C47BB50AE08E3DB7857', '2017-05-25 19:44:18', '9.90', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('3A2135E729734AE6A17F4CA99DC93F57', '2017-05-10 12:35:59', '28.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('3EBF3CB73BA54DAD840D367AF974E6F8', '2017-05-12 01:58:44', '413.99', '1', '18816793858', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('42AA379E901D4BBC993901B97402337C', '2017-04-30 22:04:05', '256.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('4366E7885F8A4BA7AFDD5E108ABC7CF7', '2017-04-30 21:42:57', '59.80', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('48ED268C8F1149D4A652B729B5AB382E', '2017-06-07 12:50:27', '384.00', '广州海珠区', '18816793858', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('4C687998A73040EFB14F10F38591A11F', '2017-05-07 09:59:16', '168.30', '2', '2', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('4D87C84BC6AC469E9735CD8BC0927E8C', '2017-05-12 09:24:16', '64.00', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('53438E1531AD40759C43D4D6C3BA657F', '2018-06-21 13:12:29', '12.00', 'zhku', '13660566766', 'B07611D8A9274909A997312BB80AB8F8');
INSERT INTO `b_order` VALUES ('5D321E74DE3B43DBB8FBAEA7C91B99CA', '2017-06-02 08:39:03', '32.00', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('61A2F58B971D42C782A54E13AD047FB6', '2018-06-21 09:37:39', '6.00', 'zhku', '13660566766', 'B07611D8A9274909A997312BB80AB8F8');
INSERT INTO `b_order` VALUES ('647369F3840146E497EF9145ECD1AE2B', '2017-06-02 08:34:09', '8.91', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('66950512BA684C4490E797BCE1C10F76', '2017-05-25 23:48:30', '8.91', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('6765A111007349D3A7B03B996CA6385F', '2018-06-20 16:29:49', '24.00', 'zhku', '13660566766', 'B07611D8A9274909A997312BB80AB8F8');
INSERT INTO `b_order` VALUES ('677EDD889DE047B5BE8E2766E7537B62', '2018-06-14 16:09:51', '128.00', '1', '18816793335', 'C8C9285F4D7E4E459EAEEA5B5E231C23');
INSERT INTO `b_order` VALUES ('6E328ACF974748B69416244A6D94D036', '2017-05-25 19:33:57', '9.90', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('6EC9EC7CF64144B9AA2633CACCE66633', '2017-05-25 19:36:50', '17.00', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('71CF7FF955574F52902C5C6CF945F639', '2017-05-25 19:41:52', '49.00', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('740F3DBAE9EB4DC89970C86B485B9A82', '2017-05-02 07:36:01', '32.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('7572F2316EB7489D8BE29E0C4765A56D', '2017-05-03 10:46:19', '128.00', '水水大大实打实的', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('79DD1C3BBF7B4E0AAB60C6AA5B4442DA', '2017-04-30 22:10:57', '29.90', '1', null, 'C8C9285F4D7E4E459EAEEA5B5E231C23');
INSERT INTO `b_order` VALUES ('7E39FFD18451461F81FB1FE77FCAB126', '2017-04-30 00:52:49', '168.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('80B2131E4A164E83B81B30C454D28568', '2018-06-15 14:55:54', '32.00', '广东省', '18816793335', '4');
INSERT INTO `b_order` VALUES ('87F5E6803D6846E68D3EF7BA3F94BF36', '2017-05-03 11:59:29', '13.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('88CA19182FF24CD28EA70768C8061BBC', '2017-05-02 00:23:28', '88.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('88F4DEBEECDC4AECA8443EE2F4091B2E', '2017-04-30 22:19:08', '29.90', '1', null, 'C8C9285F4D7E4E459EAEEA5B5E231C23');
INSERT INTO `b_order` VALUES ('8A96419C108E4DF9BA731F3E805A6A4F', '2017-05-02 09:56:01', '9.90', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('8BF8B1919B924A518DA666A0473DFCDC', '2017-05-03 11:58:56', '13.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('8C137193BF1E42C691738C9DD8F1C2F2', '2018-06-21 13:26:04', '12.00', 'zhku', '13660566766', 'B07611D8A9274909A997312BB80AB8F8');
INSERT INTO `b_order` VALUES ('8D374B550F6541A8816B372E6F345591', '2017-05-01 20:51:45', '9.90', '1', null, 'C8C9285F4D7E4E459EAEEA5B5E231C23');
INSERT INTO `b_order` VALUES ('9358766343114A7F93C968605729E862', '2018-06-15 16:07:46', '10.00', '荔湾', '12255554448', '14');
INSERT INTO `b_order` VALUES ('94CF310B00424F4494C95A5E0047C568', '2017-05-10 21:46:25', '8.91', '1', '18816793855', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('98C18BE911E245FB8BE6835EF7EE2593', '2018-06-15 14:58:42', '24.00', '仲恺农业工程学院', '18816793322', '4');
INSERT INTO `b_order` VALUES ('9E21FD949C1B4FA3A650C275E5B3C300', '2017-05-12 08:37:50', '9.90', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('A1094B06BFD543EB96626E1069857009', '2017-05-25 19:26:49', '12.50', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('A13CD42948E14F6BA02F1F1EDE00A232', '2017-05-03 11:35:37', '128.00', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('A312576F571F4BC8A1EB6F1DAA045785', '2017-05-12 08:40:23', '9.90', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('A423BC09F8B44CE3B1D8928CA10EB657', '2017-05-25 19:15:48', '9.90', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('A68665082706490EA3315E246B000C6A', '2017-06-02 08:32:40', '15.80', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('A8EE877E34D248E3B23FB61F4DBD3162', '2017-05-10 20:29:28', '62.90', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('AE1D8239BE204A059719106318B44DAA', '2017-05-01 21:36:09', '38.09', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('B019E7F058924E1AB65295F2A0B3581A', '2017-04-30 22:01:55', '88.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('B34E3593C45F48AEA9AD96590D4D0C11', '2017-04-30 21:43:23', '29.90', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('B8D9EAD12DD04E7791913F4501788CF9', '2017-05-02 00:21:35', '88.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('BDB909D2A3464E9FBD4CEFF5EA898B37', '2017-06-07 12:14:07', '384.00', '广州海珠区', '18816793858', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('C00D2C34F61D408CA522487FF94D63D5', '2017-05-10 20:04:26', '143.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('C6EDFD4F5628452DA08288DAD3AD5CB7', '2017-06-02 08:33:02', '55.00', '广东省', '18816793332', '2FC7D8B9E6C04C628BB77ABA018AD4B6');
INSERT INTO `b_order` VALUES ('C8E634A900934338A7011AC4AC5CB46C', '2017-05-07 23:25:42', '16800.00', '啊林博轩大傻逼', '哈哈哈哈哈哈哈', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('CA9546839DC74545BC84C53DED706439', '2017-05-02 00:45:53', '88.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('CD810D4F5C46457CA14F52E855C40346', '2018-06-15 16:04:28', '12.00', '荔湾', '12255554448', '14');
INSERT INTO `b_order` VALUES ('CE7BD9D3CD1B4E518A3BAEF3DEE8A259', '2017-05-10 22:03:04', '8.91', '1', '18816793855', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('D02284F6F5954931B8641F74F55EF2ED', '2017-05-02 09:58:04', '29.90', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('DCC81163268E42E0A5360393A146C990', '2018-06-19 20:52:32', '120.00', '广财', '14785298352', 'B4171460179F4FBC8ED5F20A9793B9E2');
INSERT INTO `b_order` VALUES ('E2B69498DF2848A989C272470E6DAAD0', '2017-05-03 09:57:40', '29.90', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('E37C6B10AB10480D88B690F063F02683', '2017-05-02 07:51:17', '9.90', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('E391F463761745A3B9729C53584B4CF6', '2017-05-03 12:03:43', '13.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('E99ECC6EAFAC4A9488A09F8535031DE9', '2018-06-15 21:26:33', '24.00', '广财', '14785298352', 'B4171460179F4FBC8ED5F20A9793B9E2');
INSERT INTO `b_order` VALUES ('EC9641A84BD34403BA92AA9A66BD62B0', '2017-05-02 10:00:52', '88.00', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('ECD04628F53C449897312D7559C05A60', '2017-05-03 11:57:24', '13.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F0C5381C350F4E3EA3BDC46992736126', '2017-05-03 10:47:19', '128.00', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F0D55A0AC50C4A04BFB7F4CC10D0638E', '2017-05-10 22:03:56', '58.90', '1', '18816793855', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F0D648C7A6C745E38C991E3E37652852', '2017-04-30 22:20:16', '35.80', '1', null, 'C8C9285F4D7E4E459EAEEA5B5E231C23');
INSERT INTO `b_order` VALUES ('F2D68442A5844C20A4ABD29E1941576F', '2017-05-10 21:04:36', '15.80', '1', '18816793855', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F465C09EDC0B45CD9135574069C57D1F', '2017-04-30 00:52:35', '84.70', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F5324D31A9EC473BAC1094DFCD9D7E34', '2017-05-10 12:37:20', '384.00', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F60BB0B3B11B4F8585A452CF5CDB05C7', '2017-05-02 00:22:03', '88.00', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F8487156FA6E4AE8A76BD175FBD8B879', '2017-04-30 21:30:23', '29.99', '1', null, 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('F935EECA2EA94693A17DE09428FCB39C', '2017-05-03 11:30:38', '128.00', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('FBEDFC87ED404C1182824CAFB6098A7B', '2017-05-03 12:00:03', '13.80', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('FCB5A594B9DF4AD6A8D95964A922EB15', '2017-05-10 21:47:41', '15.80', '1', '18816793855', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('FF6AA831EECF43838B1AC0908F659AD8', '2017-05-03 12:54:25', '161.39', '1', '12222222222', 'ED25379027484A6EA7CEEA63C162E118');
INSERT INTO `b_order` VALUES ('FFE75E142ED344D2A216EB9312A9CC35', '2018-06-15 16:08:31', '26.00', '荔湾', '12255554448', '14');

-- ----------------------------
-- Table structure for `cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `gid` char(32) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  KEY `orderBy` (`orderBy`) USING BTREE,
  KEY `FK_cartitem_buyer` (`bid`) USING BTREE,
  KEY `FK_cartitem_goods` (`gid`) USING BTREE,
  CONSTRAINT `FK_cartitem_buyer` FOREIGN KEY (`bid`) REFERENCES `buyer` (`bid`),
  CONSTRAINT `FK_cartitem_goods` FOREIGN KEY (`gid`) REFERENCES `dishes` (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('8B341B492A344400AAE3837FED93423D', '1', '3', 'DF25AA047D4D468EA4EF93C7860CB2A6', '42');
INSERT INTO `cartitem` VALUES ('739D45A49AEA4B759C59D0047F8F8EA1', '1', '100', '14', '58');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cname` (`cname`) USING BTREE,
  KEY `FK_category_category` (`pid`) USING BTREE,
  KEY `orderBy` (`orderBy`) USING BTREE,
  CONSTRAINT `FK_category_category` FOREIGN KEY (`pid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '快餐', null, '快速供应、即刻食用、价格合理', '1');
INSERT INTO `category` VALUES ('10', '地方小吃', '2', '地方小吃分类', '10');
INSERT INTO `category` VALUES ('11', '烧烤', '2', '烧烤分类', '11');
INSERT INTO `category` VALUES ('12', '面包蛋糕', '3', '面包蛋糕分类', '12');
INSERT INTO `category` VALUES ('13', '饮品', '3', '咖啡分类', '13');
INSERT INTO `category` VALUES ('14', '奶茶', '3', '奶茶分类', '14');
INSERT INTO `category` VALUES ('15', '甜品', '3', '甜品分类', '15');
INSERT INTO `category` VALUES ('2', '小吃', null, '口味上具有特定风格特色的食品', '2');
INSERT INTO `category` VALUES ('3', '甜品饮品', null, '甜味点心、糖水、各种饮品', '3');
INSERT INTO `category` VALUES ('4', '简餐', '1', '简餐分类', '4');
INSERT INTO `category` VALUES ('5', '米粉面馆', '1', '米粉面馆分类', '5');
INSERT INTO `category` VALUES ('6', '盖浇饭', '1', '盖浇饭分类', '6');
INSERT INTO `category` VALUES ('7', '包子粥店', '1', '包子粥分类', '7');
INSERT INTO `category` VALUES ('8', '麻辣烫', '1', '麻辣烫分类', '8');
INSERT INTO `category` VALUES ('9', '零食', '2', '零食分类', '9');

-- ----------------------------
-- Table structure for `dishes`
-- ----------------------------
DROP TABLE IF EXISTS `dishes`;
CREATE TABLE `dishes` (
  `gid` char(32) NOT NULL,
  `gname` varchar(255) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `shopname` varchar(32) DEFAULT NULL,
  `gbrand` varchar(32) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `place` varchar(100) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  `image_s` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `score` float(11,2) DEFAULT NULL,
  `orderBy` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`gid`),
  KEY `orderBy` (`orderBy`) USING BTREE,
  KEY `FK_goods_category` (`cid`) USING BTREE,
  KEY `FK_goods_seller` (`shopname`) USING BTREE,
  CONSTRAINT `FK_goods_category` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`),
  CONSTRAINT `FK_goods_seller` FOREIGN KEY (`shopname`) REFERENCES `seller` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dishes
-- ----------------------------
INSERT INTO `dishes` VALUES ('1', '地中海风情烤蔬菜披萨', '4', '必胜客', '维达', '58.90', '中国大陆', '地中海风情烤蔬菜披萨', 'dishes_img/1s.jpg', 'dishes_img/1b.jpg', '0.00', '19');
INSERT INTO `dishes` VALUES ('10', '美式大薯格', '4', '必胜客', '保府纸业', '26.00', '中国大陆', '美式大薯格', 'dishes_img/2s.jpg', 'dishes_img/2b.jpg', '0.00', '1');
INSERT INTO `dishes` VALUES ('100', '欧式培根炒饭', '6', '必胜客', '北冰洋', '29.90', '中国大陆', '欧式培根炒饭', 'dishes_img/3s.jpg', 'dishes_img/3b.jpg', '0.00', '3');
INSERT INTO `dishes` VALUES ('101', '多味麻薯', '9', '邻家嫂', '', '3.00', '', '多种口味', 'dishes_img/101s.jpg', 'dishes_img/101b.jpg', null, '103');
INSERT INTO `dishes` VALUES ('102', '红丝绒蛋糕', '12', '邻家嫂', null, '15.00', null, null, 'dishes_img/102s.jpg', 'dishes_img/102b.jpg', null, '104');
INSERT INTO `dishes` VALUES ('103', '拉肠', '7', '邻家嫂', '', '10.00', '', '广东人的口味', 'dishes_img/103s.jpg', 'dishes_img/103b.jpg', null, '105');
INSERT INTO `dishes` VALUES ('104', '虎皮蛋糕', '12', '西贝莜面村', null, '10.00', null, null, 'dishes_img/104s.jpg', 'dishes_img/104b.jpg', null, '106');
INSERT INTO `dishes` VALUES ('105', '蓝莓三明治', '12', '西贝莜面村', null, '15.00', null, null, 'dishes_img/105s.jpg', 'dishes_img/105b.jpg', null, '107');
INSERT INTO `dishes` VALUES ('106', '瑞士卷', '12', '西贝莜面村', null, '8.00', null, null, 'dishes_img/106s.jpg', 'dishes_img/106b.jpg', null, '108');
INSERT INTO `dishes` VALUES ('107', '鲜鲜菠萝包', '12', '西贝莜面村', null, '4.00', null, null, 'dishes_img/107s.jpg', 'dishes_img/107b.jpg', null, '112');
INSERT INTO `dishes` VALUES ('11', '丝滑奶茶', '14', '必胜客', '天堂', '25.00', '中国大陆', '丝滑奶茶', 'dishes_img/4s.jpg', 'dishes_img/4b.jpg', '0.00', '88');
INSERT INTO `dishes` VALUES ('12', '提拉米苏', '12', '必胜客', '沐风沐雨', '25.00', '中国大陆', '提拉米苏', 'dishes_img/5s.jpg', 'dishes_img/5b.jpg', '0.00', '52');
INSERT INTO `dishes` VALUES ('13', '西班牙风情海鲜面', '5', '必胜客', '新宝', '32.00', '中国大陆', '西班牙风情海鲜面', 'dishes_img/6s.jpg', 'dishes_img/6b.jpg', '0.00', '7');
INSERT INTO `dishes` VALUES ('14', '甄选和风四拼披萨', '4', '必胜客', '升旺', '59.00', '中国大陆', '甄选和风四拼披萨', 'dishes_img/7s.jpg', 'dishes_img/7b.jpg', '0.00', '68');
INSERT INTO `dishes` VALUES ('15', '竹蔗马蹄饮', '13', '必胜客', '梵爵', '29.00', '中国大陆', '竹蔗马蹄饮', 'dishes_img/8s.jpg', 'dishes_img/8b.jpg', '0.00', '70');
INSERT INTO `dishes` VALUES ('16', '大饼卷京酱肉丝', '4', '肯德基', '迪士尼', '39.00', '中国大陆', '大饼卷京酱肉丝', 'dishes_img/9s.jpg', 'dishes_img/9b.jpg', '0.00', '80');
INSERT INTO `dishes` VALUES ('17', '鸡肉火腿帕尼尼', '4', '肯德基', '晨曼', '26.00', '中国大陆', '鸡肉火腿帕尼尼', 'dishes_img/10s.jpg', 'dishes_img/10b.jpg', '0.00', '57');
INSERT INTO `dishes` VALUES ('18', '鸡肉卷', '4', '肯德基', '果然有雨', '24.00', '中国大陆', '鸡肉卷', 'dishes_img/11s.jpg', 'dishes_img/11b.jpg', '3.50', '22');
INSERT INTO `dishes` VALUES ('19', '葡式蛋挞', '9', '肯德基', '好旺', '6.00', '中国大陆', '葡式蛋挞', 'dishes_img/12s.jpg', 'dishes_img/12b.jpg', '0.00', '64');
INSERT INTO `dishes` VALUES ('1A5E3A81BDE04CFF9E15379AE712E357', '奥利奥奶盖', '14', '大卡司', null, '20.00', null, '奥利奥', 'dishes_img/3C95497E5CC84E1CABADCFED2CEBBB31_200s.jpg', 'dishes_img/C57852E2296F4ADAB4BFCFE3FA3BF07A_200b.jpg', '0.00', '113');
INSERT INTO `dishes` VALUES ('2', '藤椒嫩笋鸡块饭', '6', '肯德基', '清风', '35.00', '中国大陆', '藤椒嫩笋鸡块饭', 'dishes_img/13s.jpg', 'dishes_img/13b.jpg', '3.50', '79');
INSERT INTO `dishes` VALUES ('20', '鲜果茶', '13', '肯德基', '羚羊早安', '18.00', '中国大陆', '鲜果茶', 'dishes_img/14s.jpg', 'dishes_img/14b.jpg', '0.00', '32');
INSERT INTO `dishes` VALUES ('21', '香辣烤翅', '9', '肯德基', '蓝月亮', '16.00', '广东广州', '香辣烤翅', 'dishes_img/15s.jpg', 'dishes_img/15b.jpg', '0.00', '8');
INSERT INTO `dishes` VALUES ('22', '新奥尔良烤鸡腿堡', '4', '肯德基', '超能', '22.00', '广东广州', '新奥尔良烤鸡腿堡', 'dishes_img/16s.jpg', 'dishes_img/16b.jpg', '0.00', '4');
INSERT INTO `dishes` VALUES ('23', '海鲜至尊披萨', '4', '乐凯撒', '立白', '39.00', '广东广州', '海鲜至尊披萨', 'dishes_img/17s.jpg', 'dishes_img/17b.jpg', '0.00', '99');
INSERT INTO `dishes` VALUES ('24', '榴莲多多披萨', '4', '乐凯撒', '香馜', '39.00', '中国大陆', '榴莲多多披萨', 'dishes_img/18s.jpg', 'dishes_img/18b.jpg', '0.00', '62');
INSERT INTO `dishes` VALUES ('25', '美式至尊四拼披萨', '4', '乐凯撒', '威露士', '39.00', '中国大陆', '新旧包装，成分温和，低泡易过水，深层洁净', 'dishes_img/19s.jpg', 'dishes_img/19b.jpg', '0.00', '74');
INSERT INTO `dishes` VALUES ('26', '三味小吃拼盘', '10', '乐凯撒', '肌玉', '39.00', '中国大陆', '洁净抑菌，超强去污', 'dishes_img/20s.jpg', 'dishes_img/20b.jpg', '0.00', '77');
INSERT INTO `dishes` VALUES ('27', '松子鸡肉意面', '5', '乐凯撒', '奥妙', '27.00', '中国大陆', '清除十大死角，呵护双手，适合全家衣物', 'dishes_img/21s.jpg', 'dishes_img/21b.jpg', '0.00', '78');
INSERT INTO `dishes` VALUES ('28', '酥炸鱿鱼', '4', '乐凯撒', '清雅香', '26.00', '中国大陆', '6斤大瓶装，无磷无荧光，护衣不伤手', 'dishes_img/22s.jpg', 'dishes_img/22b.jpg', '0.00', '71');
INSERT INTO `dishes` VALUES ('29', '新奥尔良烤肉披萨', '4', '乐凯撒', '汰渍', '59.00', '中国大陆', '双重洁净，去渍无残留', 'dishes_img/23s.jpg', 'dishes_img/23b.jpg', '0.00', '72');
INSERT INTO `dishes` VALUES ('3', '鱼子酱虾球', '4', '乐凯撒', '植护', '39.00', '中国大陆', '优选原浆，密韧纤维，三层不掉屑', 'dishes_img/24s.jpg', 'dishes_img/24b.jpg', '0.00', '2');
INSERT INTO `dishes` VALUES ('30', '照烧鸡肉炒饭', '6', '乐凯撒', '好爸爸', '35.00', '中国大陆', '亲肤无刺激，无化学残留', 'dishes_img/25s.jpg', 'dishes_img/25b.jpg', '0.00', '63');
INSERT INTO `dishes` VALUES ('31', '冬菇鸡腿肉饭', '6', '真功夫', '洁丽雅', '35.00', '中国大陆', '棉朵洁白，柔软亲肤，吸水性佳', 'dishes_img/26s.jpg', 'dishes_img/26b.jpg', '0.00', '36');
INSERT INTO `dishes` VALUES ('32', '荷香糯米鸡', '7', '真功夫', '金号', '12.00', '中国大陆', '手感柔软平滑，吸湿性好，韧性好', 'dishes_img/27s.jpg', 'dishes_img/27b.jpg', '5.00', '53');
INSERT INTO `dishes` VALUES ('33', '瘦肉粉', '5', '真功夫', '笑宣', '10.00', '中国大陆', '天然纯棉，平整柔滑', 'dishes_img/28s.jpg', 'dishes_img/28b.jpg', '0.00', '59');
INSERT INTO `dishes` VALUES ('34', '四季猪骨汤', '10', '真功夫', '古田兔', '15.00', '中国大陆', '亲肤，安全，环保，耐用', 'dishes_img/29s.jpg', 'dishes_img/29b.jpg', '0.00', '26');
INSERT INTO `dishes` VALUES ('35', '酸菜卤肉饭', '6', '真功夫', '绿竹坊', '18.00', '中国大陆', '纯棉毛巾，舒适平整，吸水柔软', 'dishes_img/30s.jpg', 'dishes_img/30b.jpg', '0.00', '98');
INSERT INTO `dishes` VALUES ('36', '鲜肉酱蒸米粉', '5', '真功夫', '南极人', '12.00', '中国大陆', '天然纯棉浴巾，吸水性极强', 'dishes_img/31s.jpg', 'dishes_img/31b.jpg', '0.00', '95');
INSERT INTO `dishes` VALUES ('37', '香汁排骨饭', '6', '真功夫', '爱尔思', '22.00', '中国大陆', '健康无异味，快干超吸水，柔软不粗糙', 'dishes_img/32s.jpg', 'dishes_img/32b.jpg', '0.00', '44');
INSERT INTO `dishes` VALUES ('38', '元气竹丝鸡汤', '10', '真功夫', '三利', '14.00', '中国大陆', '健康亲肤，透气，厚度适中，吸水性高', 'dishes_img/33s.jpg', 'dishes_img/33b.jpg', '0.00', '39');
INSERT INTO `dishes` VALUES ('39', '金桔柠檬', '13', '大卡司', '誉洋', '12.00', '中国大陆', '毛圈蓬松密实，做工精细，送礼首选', 'dishes_img/34s.jpg', 'dishes_img/34b.jpg', '4.00', '6');
INSERT INTO `dishes` VALUES ('4', '经典醇香奶茶', '14', '大卡司', '洁柔', '12.00', '中国大陆', '精选原生木浆，轻松易开口，节约0浪费', 'dishes_img/35s.jpg', 'dishes_img/35b.jpg', '5.00', '91');
INSERT INTO `dishes` VALUES ('40', '鲜果饮品', '13', '大卡司', '毛毛雨', '12.00', '中国大陆', 'A类纯棉，婴幼儿可用，超柔吸水', 'dishes_img/36s.jpg', 'dishes_img/36b.jpg', '0.00', '38');
INSERT INTO `dishes` VALUES ('41', '鲜味芒果乐', '13', '大卡司', '云南白药', '12.00', '中国大陆', '减轻牙龈出血，修复粘膜损，祛除口腔异味', 'dishes_img/37s.jpg', 'dishes_img/37b.jpg', '0.00', '28');
INSERT INTO `dishes` VALUES ('42', '波霸奶茶', '14', '一点点', '舒客', '15.00', '中国大陆', '清爽薄荷味，防蛀固齿清口气', 'dishes_img/38s.jpg', 'dishes_img/38b.jpg', '0.00', '89');
INSERT INTO `dishes` VALUES ('43', '红茶玛奇朵', '14', '一点点', '黑人', '14.00', '中国大陆', '人气单品，炭白出击深度清洁口腔，双重美白', 'dishes_img/39s.jpg', 'dishes_img/39b.jpg', '0.00', '29');
INSERT INTO `dishes` VALUES ('44', '红茶拿铁', '14', '一点点', 'Aquafresh', '15.00', '中国大陆', '直立按压，三色洁净，高效亮白', 'dishes_img/40s.jpg', 'dishes_img/40b.jpg', '0.00', '16');
INSERT INTO `dishes` VALUES ('45', '可可芭蕾', '14', '一点点', '佳洁士', '18.00', '中国大陆', '干净洁白，清凉薄荷气味', 'dishes_img/41s.jpg', 'dishes_img/41b.jpg', '0.00', '9');
INSERT INTO `dishes` VALUES ('46', '卡布奇诺', '14', '巴贝拉', '纳美', '15.00', '中国大陆', '小苏打，祛口气，美白牙齿', 'dishes_img/42s.jpg', 'dishes_img/42b.jpg', '0.00', '15');
INSERT INTO `dishes` VALUES ('47', '芒果布丁', '15', '巴贝拉', '无限极', '17.00', '中国大陆', '美白，抗敏感，去牙渍，口气清新', 'dishes_img/43s.jpg', 'dishes_img/43b.jpg', '0.00', '51');
INSERT INTO `dishes` VALUES ('48', '抹茶蛋糕', '12', '巴贝拉', '狮王', '20.00', '日本', '有效，分解牙垢，强化牙质，美白牙齿', 'dishes_img/44s.jpg', 'dishes_img/44b.jpg', '0.00', '94');
INSERT INTO `dishes` VALUES ('49', '慕斯蛋糕', '12', '巴贝拉', '舒适达', '20.00', '中国大陆', '护理牙龈、牙齿，薄荷香型，抗敏感', 'dishes_img/45s.jpg', 'dishes_img/45b.jpg', '0.00', '73');
INSERT INTO `dishes` VALUES ('5', '盆栽蛋糕', '12', '巴贝拉', '心相印', '24.00', '中国大陆', '清新茶语体验，便携包装，自然洁白', 'dishes_img/46s.jpg', 'dishes_img/46b.jpg', '0.00', '24');
INSERT INTO `dishes` VALUES ('50', '巧克力千层', '12', '巴贝拉', '高露洁', '28.00', '中国大陆', '新老包装交替，冰爽清新，消除口干口燥', 'dishes_img/47s.jpg', 'dishes_img/47b.jpg', '0.00', '18');
INSERT INTO `dishes` VALUES ('51', '草莓鲜味', '15', '萨莉亚', '晨光', '26.00', '中国大陆', '外观简约时尚，不宜氧化，手感舒适', 'dishes_img/48s.jpg', 'dishes_img/48b.jpg', '0.00', '10');
INSERT INTO `dishes` VALUES ('52', '奶味浓蛋糕', '12', '萨莉亚', '得力', '27.00', '中国大陆', '自带可擦橡皮，防窒息笔盖，顺滑流畅', 'dishes_img/49s.jpg', 'dishes_img/49b.jpg', '0.00', '58');
INSERT INTO `dishes` VALUES ('53', '培根披萨', '4', '萨莉亚', '百乐', '39.00', '中国大陆', '顺滑流畅,适合各种纸张，环保无毒，高性价比', 'dishes_img/50s.jpg', 'dishes_img/50b.jpg', '0.00', '5');
INSERT INTO `dishes` VALUES ('54', '三鲜时令浓汤', '10', '萨莉亚', '真彩', '24.00', '中国大陆', '全针管纤细笔芯，不易断墨，不易漏水，防滑', 'dishes_img/51s.jpg', 'dishes_img/51b.jpg', '0.00', '87');
INSERT INTO `dishes` VALUES ('55', '蔬果鲜鲜', '10', '萨莉亚', '英雄', '15.00', '中国大陆', '高档金属，黑色签字笔', 'dishes_img/52s.jpg', 'dishes_img/52b.jpg', '0.00', '45');
INSERT INTO `dishes` VALUES ('56', '酥炸牛排饭', '6', '萨莉亚', '宝克', '37.00', '中国大陆', '进口颜料性油墨，墨蓝签字笔', 'dishes_img/53s.jpg', 'dishes_img/53b.jpg', '0.00', '20');
INSERT INTO `dishes` VALUES ('57', '芝士鲜味饭', '6', '萨莉亚', '派克', '38.00', '中国大陆', '威雅钢杆，黑色不可擦', 'dishes_img/54s.jpg', 'dishes_img/54b.jpg', '-5.00', '43');
INSERT INTO `dishes` VALUES ('58', '叉烧包', '7', '包天下', '爱好', '3.00', '中国大陆', '优质笔头，出墨均匀流畅，书写顺滑', 'dishes_img/55s.jpg', 'dishes_img/55b.jpg', '0.00', '75');
INSERT INTO `dishes` VALUES ('59', '豆沙包', '7', '包天下', '齐心', '2.00', '中国大陆', '镀金笔夹，高端商务人士必备签字笔', 'dishes_img/56s.jpg', 'dishes_img/56b.jpg', '0.00', '34');
INSERT INTO `dishes` VALUES ('6', '流沙包', '7', '包天下', '慕逸适', '2.00', '日本', '硬盒装面，宝宝专用，无香无印花木浆', 'dishes_img/57s.jpg', 'dishes_img/57b.jpg', '0.00', '30');
INSERT INTO `dishes` VALUES ('60', '马蹄肉包', '7', '包天下', '无印良品', '4.00', '中国大陆', '书写流畅的凝胶墨水圆珠笔', 'dishes_img/58s.jpg', 'dishes_img/58b.jpg', '0.00', '42');
INSERT INTO `dishes` VALUES ('61', '奶黄包', '7', '包天下', '申士', '2.00', '中国大陆', '两本送笔，创意拼接，米黄纸内页', 'dishes_img/59s.jpg', 'dishes_img/59b.jpg', '0.00', '92');
INSERT INTO `dishes` VALUES ('62', '素三鲜包', '7', '包天下', '得力', '4.00', '中国大陆', '软面抄，胶钉式装订，米黄色纸张不刺眼', 'dishes_img/60s.jpg', 'dishes_img/60b.jpg', '0.00', '31');
INSERT INTO `dishes` VALUES ('63', '鲜味汤包', '7', '包天下', '法拉蒙', '4.00', '中国大陆', '封面仿皮，简约复古，创意潮流，商务', 'dishes_img/61s.jpg', 'dishes_img/61b.jpg', '5.00', '23');
INSERT INTO `dishes` VALUES ('64', '紫薯包', '7', '包天下', '广博', '2.00', '中国大陆', '创意潮流，封面仿皮，线装式装订', 'dishes_img/62s.jpg', 'dishes_img/62b.jpg', '0.00', '69');
INSERT INTO `dishes` VALUES ('65', '灌汤包', '7', '老台门包子', '晨光', '5.00', '中国大陆', '线圈/螺旋装订方式，行距合适，商务', 'dishes_img/63s.jpg', 'dishes_img/63b.jpg', '0.00', '100');
INSERT INTO `dishes` VALUES ('66', '牛肉包', '7', '老台门包子', '国誉', '6.00', '中国大陆', '软面抄，线圈装订，两面印制，减少浪费', 'dishes_img/64s.jpg', 'dishes_img/64b.jpg', '0.00', '93');
INSERT INTO `dishes` VALUES ('67', '拼盘甜包', '7', '老台门包子', '朗捷', '7.00', '中国大陆', '硬面抄，活页夹装订，小清新，简约，日韩，商务', 'dishes_img/65s.jpg', 'dishes_img/65b.jpg', '0.00', '86');
INSERT INTO `dishes` VALUES ('68', '生煎包', '7', '老台门包子', '顺达', '3.00', '中国大陆', '线圈式装订，硬面抄，加厚纸张，不易掉页散页', 'dishes_img/66s.jpg', 'dishes_img/66b.jpg', '0.00', '81');
INSERT INTO `dishes` VALUES ('69', '香菇猪肉包', '7', '老台门包子', '糖果派', '5.00', '中国大陆', '线圈/螺旋装订，小巧便携，人物，自然', 'dishes_img/67s.jpg', 'dishes_img/67b.jpg', '0.00', '82');
INSERT INTO `dishes` VALUES ('7', '小笼包', '7', '老台门包子', '得宝', '6.00', '香港', '杀减99%细菌(包括猪流感、禽流感)', 'dishes_img/68s.jpg', 'dishes_img/68b.jpg', '0.00', '90');
INSERT INTO `dishes` VALUES ('70', '羊肉包', '7', '老台门包子', '广新', '8.00', '中国大陆', '骑马钉装订，翻页自然，牢固耐用', 'dishes_img/69s.jpg', 'dishes_img/69b.jpg', '0.00', '35');
INSERT INTO `dishes` VALUES ('71', '多宝粥', '7', '如轩砂锅粥', '得力', '8.00', '中国大陆', '双金属强力夹，持久耐用，用户人群广', 'dishes_img/70s.jpg', 'dishes_img/70b.jpg', '0.00', '60');
INSERT INTO `dishes` VALUES ('72', '鸡蛋粥', '7', '如轩砂锅粥', '创易', '5.00', '中国大陆', 'PP材质，简约时尚，五金夹具', 'dishes_img/71s.jpg', 'dishes_img/71b.jpg', '0.00', '66');
INSERT INTO `dishes` VALUES ('73', '米酒汤圆粥', '7', '如轩砂锅粥', '新时达', '6.00', '中国大陆', '环保材质，高性价比，透明PP材料', 'dishes_img/72s.jpg', 'dishes_img/72b.jpg', '0.00', '83');
INSERT INTO `dishes` VALUES ('74', '南瓜小米粥', '7', '如轩砂锅粥', '齐心', '6.00', '中国大陆', '办公必备，紧密厚实，持久不变形', 'dishes_img/73s.jpg', 'dishes_img/73b.jpg', '0.00', '47');
INSERT INTO `dishes` VALUES ('75', '皮蛋牛肉粥', '7', '如轩砂锅粥', '树德', '10.00', '中国大陆', '外表硬朗，内心细腻，灵敏插扣，使用方便', 'dishes_img/74s.jpg', 'dishes_img/74b.jpg', '0.00', '37');
INSERT INTO `dishes` VALUES ('76', '艇仔粥', '7', '如轩砂锅粥', '博煌', '8.00', '中国大陆', '厂家直销，适用范围广，牢固上', 'dishes_img/75s.jpg', 'dishes_img/75b.jpg', '0.00', '61');
INSERT INTO `dishes` VALUES ('77', '燕麦水果粥', '7', '如轩砂锅粥', '得力', '8.00', '中国大陆', '手提式设计，携带方便，简单大方', 'dishes_img/76s.jpg', 'dishes_img/76b.jpg', '0.00', '56');
INSERT INTO `dishes` VALUES ('78', '八宝粥', '7', '粥员外', 'KOBEST', '8.00', '中国大陆', '手提式风琴包，容量大，外观可爱', 'dishes_img/77s.jpg', 'dishes_img/77b.jpg', '0.00', '54');
INSERT INTO `dishes` VALUES ('79', '粗粮糙米粥', '7', '粥员外', '泸州老窖', '8.00', '四川省', '高度白酒（50%以上），常温储存，无食品添加剂', 'dishes_img/78s.jpg', 'dishes_img/78b.jpg', '0.00', '55');
INSERT INTO `dishes` VALUES ('8', '桂圆红枣薏米粥', '7', '粥员外', '顺清柔', '10.00', '中国大陆', '有芯卷纸，无印花木浆，湿水不破', 'dishes_img/79s.jpg', 'dishes_img/79b.jpg', '0.00', '14');
INSERT INTO `dishes` VALUES ('80', '海鲜粥', '7', '粥员外', '五粮液', '12.00', '四川省', '适用于商务宴请区，无食品添加剂', 'dishes_img/80s.jpg', 'dishes_img/80b.jpg', '0.00', '40');
INSERT INTO `dishes` VALUES ('81', '皮蛋瘦肉粥', '7', '粥员外', '拉菲庄园', '6.00', '法国', '避光恒温保存，原汁进口，水果香，送礼佳品', 'dishes_img/81s.jpg', 'dishes_img/81b.jpg', '1.80', '97');
INSERT INTO `dishes` VALUES ('82', '什锦粥', '7', '粥员外', '青克', '15.00', '山东省', '水、优质麦芽等优质配料，中浓度麦汁黄啤酒', 'dishes_img/82s.jpg', 'dishes_img/82b.jpg', '0.00', '65');
INSERT INTO `dishes` VALUES ('83', '树莓水果粥', '7', '粥员外', '锐澳', '10.00', '上海', '避免阳光直射，低度酒（A<38%），果汁+洋酒', 'dishes_img/83s.jpg', 'dishes_img/83b.jpg', '0.00', '25');
INSERT INTO `dishes` VALUES ('84', '杨国福A套餐', '8', '杨国福', '金沙回沙酒', '25.00', '贵州省', '常温密封，高度白酒（50%以上），酱香型', 'dishes_img/84s.jpg', 'dishes_img/84b.jpg', '-1.00', '76');
INSERT INTO `dishes` VALUES ('85', '杨国福B套餐', '8', '杨国福', '茅台', '23.00', '贵州省', '度数: 53%vol，高贵，送礼佳品', 'dishes_img/85s.jpg', 'dishes_img/85b.jpg', '0.00', '50');
INSERT INTO `dishes` VALUES ('86', '杨国福C套餐', '8', '杨国福', '百岁山', '29.00', '中国大陆', '水中贵族，优质水源，甘醇清冽', 'dishes_img/86s.jpg', 'dishes_img/86b.jpg', '0.00', '13');
INSERT INTO `dishes` VALUES ('87', '杨国福D套餐', '8', '杨国福', '怡宝', '30.00', '江苏南京', '天然甘甜，清润安全，无添加剂纯净水', 'dishes_img/87s.jpg', 'dishes_img/87b.jpg', '0.00', '85');
INSERT INTO `dishes` VALUES ('88', '杨国福E套餐', '8', '杨国福', '农夫山泉', '40.00', '浙江杭州', '饮用天然水，优质水', 'dishes_img/88s.jpg', 'dishes_img/88b.jpg', '0.00', '41');
INSERT INTO `dishes` VALUES ('89', '海鲜麻辣烫', '8', '张亮麻辣烫', '康师傅', '20.00', '天津', '开盖即饮，冷藏更佳，避免阳光直射', 'dishes_img/89s.jpg', 'dishes_img/89b.jpg', '0.00', '21');
INSERT INTO `dishes` VALUES ('9', '清汤麻辣烫', '8', '张亮麻辣烫', '妮飘', '12.00', '中国大陆', '湿巾，吸水性好，手感细滑柔软', 'dishes_img/90s.jpg', 'dishes_img/90b.jpg', '0.00', '67');
INSERT INTO `dishes` VALUES ('90', '川味麻辣烫', '8', '张亮麻辣烫', '娃哈哈', '18.00', '浙江杭州', '天然纯净，清爽甘甜，无添加剂', 'dishes_img/91s.jpg', 'dishes_img/91b.jpg', '0.00', '12');
INSERT INTO `dishes` VALUES ('91', '鸡肉饭便当', '6', '1218便当', '燕塘', '20.00', '广东广州', '常温储藏，盒装，开启后须冷藏', 'dishes_img/92s.jpg', 'dishes_img/92b.jpg', '0.00', '49');
INSERT INTO `dishes` VALUES ('92', '牛肉丸便当', '6', '1218便当', '光明', '20.00', '天津', '原味牛奶，超值营养，品质保证', 'dishes_img/93s.jpg', 'dishes_img/93b.jpg', '0.00', '46');
INSERT INTO `dishes` VALUES ('93', '日式肉菇饭', '6', '1218便当', '伊利', '26.00', '中国大陆', '有机纯牛奶，甘醇清甜，非转基因', 'dishes_img/94s.jpg', 'dishes_img/94b.jpg', '0.00', '27');
INSERT INTO `dishes` VALUES ('94', '寿司便当', '6', '1218便当', '蒙牛', '20.00', '中国大陆', '低脂高钙，更健康，纯牛奶', 'dishes_img/95s.jpg', 'dishes_img/95b.jpg', '0.00', '96');
INSERT INTO `dishes` VALUES ('95', '扬州炒饭', '6', '1218便当', '雀巢', '12.00', '上海', '全脂纯牛奶，稳定迅速打出，咖啡奶泡', 'dishes_img/96s.jpg', 'dishes_img/96b.jpg', '0.00', '11');
INSERT INTO `dishes` VALUES ('96', '羊肉多多便当', '6', '1218便当', '可口可乐', '26.00', '中国大陆', '畅爽怡神，健身、聚会、休闲饮品', 'dishes_img/97s.jpg', 'dishes_img/97b.jpg', '0.00', '33');
INSERT INTO `dishes` VALUES ('97', '鱼块拼拼便当', '6', '1218便当', '百事可乐', '24.00', '中国大陆', '清爽可口解渴，渴望就是力量', 'dishes_img/98s.jpg', 'dishes_img/98b.jpg', '0.00', '84');
INSERT INTO `dishes` VALUES ('98', '海外进口零食', '9', '邻家嫂', '雪碧', '23.00', '中国大陆', '齐分享', 'dishes_img/99s.jpg', 'dishes_img/99b.jpg', '0.00', '48');
INSERT INTO `dishes` VALUES ('99', '蔓越莓饼干', '9', '邻家嫂', null, '14.00', null, null, 'dishes_img/100s.jpg', 'dishes_img/100b.jpg', null, '101');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `gid` char(32) DEFAULT NULL,
  `gname` varchar(200) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `image_s` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `shopname` char(32) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `appraise` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_orderitem_order` (`oid`) USING BTREE,
  CONSTRAINT `FK_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `b_order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('04859DDBCA0E45B1BD38A30250D2871A', '1', '12.00', '39', '金桔柠檬', '12.00', 'dishes_img/34s.jpg', '4', '大卡司', 'B4C802E678064DB4B27838D1BAFDA404', '5', '');
INSERT INTO `orderitem` VALUES ('089100CC04AF4FA3B4504D54035FFEDE', '1', '12.00', '32', '荷香糯米鸡', '12.00', 'dishes_img/27s.jpg', '4', '真功夫', '0958BC03D49B41D6A08F7CF5D52EA84D', '5', '');
INSERT INTO `orderitem` VALUES ('1B7C64741C84414889D60EE9CE440B92', '1', '12.00', '4', '经典醇香奶茶', '12.00', 'dishes_img/35s.jpg', '4', '大卡司', '34991FC330D74E6CB6F59E130BEED4BB', '5', '');
INSERT INTO `orderitem` VALUES ('22108C20F9354DC3B8C07089940AED3D', '2', '24.00', '39', '金桔柠檬', '12.00', 'dishes_img/34s.jpg', '4', '大卡司', 'DCC81163268E42E0A5360393A146C990', '2', '好喝！！');
INSERT INTO `orderitem` VALUES ('46E34D7826444EE1B66043639FEE624C', '1', '12.00', '4', '经典醇香奶茶', '12.00', 'dishes_img/35s.jpg', '3', '大卡司', 'D85B14329992490AA91770334116CDBD', '1', null);
INSERT INTO `orderitem` VALUES ('4FD54948A11D462A8FB6BB503AFB2BA8', '1', '4.00', '63', '鲜味汤包', '4.00', 'dishes_img/61s.jpg', '4', '包天下', '90400C88CEEF41BABCFCE143815C6B9E', '5', '');
INSERT INTO `orderitem` VALUES ('53FAFB4576B5484BA7063B88C65491C4', '1', '40.00', '88', '杨国福E套餐', '40.00', 'dishes_img/88s.jpg', '3', '杨国福', '1728A8F4F5EB49218545BF01416F5D83', '1', null);
INSERT INTO `orderitem` VALUES ('559C6BEE3E254C9E9E27CBB8A82BDEDC', '1', '24.00', '18', '鸡肉卷', '24.00', 'dishes_img/11s.jpg', '1', '肯德基', 'E99ECC6EAFAC4A9488A09F8535031DE9', '1', null);
INSERT INTO `orderitem` VALUES ('57866B83D76849BE93027F47826F5E4E', '1', '12.00', '4', '经典醇香奶茶', '12.00', 'dishes_img/35s.jpg', '1', '大卡司', 'CABBCA53F8914029A4130D03C5D44BD9', '1', null);
INSERT INTO `orderitem` VALUES ('5E0587559D8A4D6A91C7F29C88CEE2EA', '1', '12.00', '4', '经典醇香奶茶', '12.00', 'dishes_img/35s.jpg', '4', '大卡司', '9A7E0F8779114F199BCB96307DE5F113', '5', '');
INSERT INTO `orderitem` VALUES ('5F2864B16EFF4FC0AA934632CD6EA37C', '1', '6.00', '81', '皮蛋瘦肉粥', '6.00', 'dishes_img/81s.jpg', '1', '粥员外', 'FFE75E142ED344D2A216EB9312A9CC35', '1', null);
INSERT INTO `orderitem` VALUES ('5FC4E005D58C449289786E64EF89C22F', '1', '4.00', '63', '鲜味汤包', '4.00', 'dishes_img/61s.jpg', '4', '包天下', '132024BCD0F04E3B970D1D1164D78B13', '5', '');
INSERT INTO `orderitem` VALUES ('60EDFD4F66844F6C9468500E21407E98', '1', '20.00', '91', '鸡肉饭便当', '20.00', 'dishes_img/92s.jpg', '1', '1218便当', 'FFE75E142ED344D2A216EB9312A9CC35', '1', null);
INSERT INTO `orderitem` VALUES ('6924C966154842EA8B8AC2914A07FF44', '1', '12.00', '39', '金桔柠檬', '12.00', 'dishes_img/34s.jpg', '1', '大卡司', '17AC575683ED42DE96297FFADBF3425C', '1', null);
INSERT INTO `orderitem` VALUES ('74E6ADAB001F4096A59C2C9DB7DB43A7', '1', '26.00', '17', '鸡肉火腿帕尼尼', '26.00', 'dishes_img/10s.jpg', '1', '肯德基', 'DCC81163268E42E0A5360393A146C990', '1', null);
INSERT INTO `orderitem` VALUES ('818C64A860C64F66A1292819B9BD2207', '1', '39.00', '53', '培根披萨', '39.00', 'dishes_img/50s.jpg', '3', '萨莉亚', 'D85B14329992490AA91770334116CDBD', '1', null);
INSERT INTO `orderitem` VALUES ('8746480D0B234C47A70A4431DDC942AB', '1', '39.00', '53', '培根披萨', '39.00', 'dishes_img/50s.jpg', '4', '萨莉亚', 'CCC96CE7035A45438229042716B96A02', '1', null);
INSERT INTO `orderitem` VALUES ('8823905A0A264849AD96A787EAE23556', '1', '59.00', '14', '甄选和风四拼披萨', '59.00', 'dishes_img/7s.jpg', '3', '必胜客', '5910440976AA414695CF2DCAEDBA02D7', '1', null);
INSERT INTO `orderitem` VALUES ('90811E44B1194C46B99709602814C055', '1', '6.00', '81', '皮蛋瘦肉粥', '6.00', 'dishes_img/81s.jpg', '2', '粥员外', '61A2F58B971D42C782A54E13AD047FB6', '1', null);
INSERT INTO `orderitem` VALUES ('A5414396DC6F4597AED0915E2EBCC451', '1', '35.00', '2', '藤椒嫩笋鸡块饭', '35.00', 'dishes_img/13s.jpg', '4', '肯德基', '34991FC330D74E6CB6F59E130BEED4BB', '5', '');
INSERT INTO `orderitem` VALUES ('A98AA777699E4EC683CCE30905BB14B9', '1', '12.00', '4', '经典醇香奶茶', '12.00', 'dishes_img/35s.jpg', '4', '大卡司', 'AB6F01C3EC0140398B97869567EB3B3E', '1', null);
INSERT INTO `orderitem` VALUES ('A9F129F5565B43278FFB476D577D0EAD', '1', '24.00', '18', '鸡肉卷', '24.00', 'dishes_img/11s.jpg', '4', '肯德基', '6765A111007349D3A7B03B996CA6385F', '5', '很棒');
INSERT INTO `orderitem` VALUES ('AA5EE0296F9A40CAB7DE9711FE00A0B4', '1', '12.00', '39', '金桔柠檬', '12.00', 'dishes_img/34s.jpg', '4', '大卡司', 'CD810D4F5C46457CA14F52E855C40346', '5', '');
INSERT INTO `orderitem` VALUES ('B065F3B40C9A417781F035B5D03D51B4', '1', '12.00', '39', '金桔柠檬', '12.00', 'dishes_img/34s.jpg', '3', '大卡司', '28C9A448A711411D8306287395003343', '1', null);
INSERT INTO `orderitem` VALUES ('B7FF3A1E5E354E96B0314A95F4534103', '2', '70.00', '2', '藤椒嫩笋鸡块饭', '35.00', 'dishes_img/13s.jpg', '1', '肯德基', 'DCC81163268E42E0A5360393A146C990', '1', null);
INSERT INTO `orderitem` VALUES ('C35862C6240E4B548D418BDF7BE92B59', '1', '6.00', '81', '皮蛋瘦肉粥', '6.00', 'dishes_img/81s.jpg', '3', '粥员外', '9358766343114A7F93C968605729E862', '1', null);
INSERT INTO `orderitem` VALUES ('C8335447D62B49E7BF1F96A62D6DAC0A', '1', '35.00', '2', '藤椒嫩笋鸡块饭', '35.00', 'dishes_img/13s.jpg', '4', '肯德基', '245603DF069D454DBB76B54C05B9D457', '2', '灌灌灌灌');
INSERT INTO `orderitem` VALUES ('CB5AC22121664AA998025BFCC0BBB517', '1', '12.00', '4', '经典醇香奶茶', '12.00', 'dishes_img/35s.jpg', '3', '大卡司', '53438E1531AD40759C43D4D6C3BA657F', '1', null);
INSERT INTO `orderitem` VALUES ('D9B5CD61D18F4091B465815156FB9D38', '1', '12.00', '40', '鲜果饮品', '12.00', 'dishes_img/36s.jpg', '3', '大卡司', 'A4D6C87661594D3D8EDAA351FBB502EC', '1', null);
INSERT INTO `orderitem` VALUES ('DD4D7DD48E874557B767413550FB15CE', '1', '4.00', '63', '鲜味汤包', '4.00', 'dishes_img/61s.jpg', '4', '包天下', 'F05D7E81A3E8401A826BE4BAA8D4D84F', '1', null);
INSERT INTO `orderitem` VALUES ('DE6E01FE0F7C4AF3A3479B52E833F2EF', '1', '12.00', '40', '鲜果饮品', '12.00', 'dishes_img/36s.jpg', '3', '大卡司', '8C137193BF1E42C691738C9DD8F1C2F2', '1', null);
INSERT INTO `orderitem` VALUES ('E820DA97BCDB4AEA9D459E2B2D733A41', '1', '24.00', '18', '鸡肉卷', '24.00', 'dishes_img/11s.jpg', '4', '肯德基', '98C18BE911E245FB8BE6835EF7EE2593', '2', '');
INSERT INTO `orderitem` VALUES ('F79BDFAFC7794405991C1062A04507F1', '1', '4.00', '63', '鲜味汤包', '4.00', 'dishes_img/61s.jpg', '4', '包天下', '9358766343114A7F93C968605729E862', '1', null);

-- ----------------------------
-- Table structure for `seller`
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `sid` varchar(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `honour` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `loginname` (`loginname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', '必胜客', '必胜客', '666666666666666666', '1', '105');
INSERT INTO `seller` VALUES ('10', '老台门包子', '老台门包子', '599598888859955555', '1', '98');
INSERT INTO `seller` VALUES ('11', '如轩砂锅粥', '如轩砂锅粥', '599598888859959999', '1', '110');
INSERT INTO `seller` VALUES ('12', '粥员外', '粥员外', '599598448859959999', '1', '100');
INSERT INTO `seller` VALUES ('13', '杨国福', '杨国福', '499598448859959999', '1', '130');
INSERT INTO `seller` VALUES ('14', '张亮麻辣烫', '张亮麻辣烫', '444778448859959999', '1', '120');
INSERT INTO `seller` VALUES ('15', '1218便当', '1218便当', '444598448859977999', '1', '113');
INSERT INTO `seller` VALUES ('16', '邻家嫂', '邻家嫂', '444598448822959999', '1', '112');
INSERT INTO `seller` VALUES ('17', '西贝莜面村', '西贝莜面村', '444598448859119999', '1', '110');
INSERT INTO `seller` VALUES ('2', '肯德基', '肯德基', '666666666666666667', '1', '139');
INSERT INTO `seller` VALUES ('3', '乐凯撒', '乐凯撒', '666666666666666644', '1', '100');
INSERT INTO `seller` VALUES ('4', '真功夫', '真功夫', '123456789123456789', '1', '105');
INSERT INTO `seller` VALUES ('5', '一点点', '一点点', '111111111111111111', '1', '100');
INSERT INTO `seller` VALUES ('6', '大卡司', '大卡司', '123456789123456788', '1', '112');
INSERT INTO `seller` VALUES ('7', '巴贝拉', '巴贝拉', '111111112111111111', '1', '100');
INSERT INTO `seller` VALUES ('8', '萨莉亚', '萨莉亚', '599598888859959888', '1', '110');
INSERT INTO `seller` VALUES ('9', '包天下', '包天下', '599598888859959877', '1', '105');
INSERT INTO `seller` VALUES ('E89BD923F99F42188EDC962074E274FC', '大家说说', '对的', '333333333333333333', '1', '100');
