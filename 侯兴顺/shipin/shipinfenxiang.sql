/*
Navicat MySQL Data Transfer

Source Server         : 本地8
Source Server Version : 80020
Source Host           : localhost:3307
Source Database       : shequchongwu

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2021-04-09 09:18:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `ip` varchar(45) DEFAULT NULL,
  `isStaff` bit(1) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `adoption` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_1_idx` (`questionId`,`status`,`adoption`),
  KEY `answer_2_idx` (`userName`,`isStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '因为你还在努力敲代码', '0:0:0:0:0:0:0:1', '', '2020-03-29 00:42:26', '2', '20', 'tim', '');
INSERT INTO `answer` VALUES ('2', '好吃，特别好吃，我吃过', '0:0:0:0:0:0:0:1', '', '2020-03-29 14:30:42', '4', '20', 'tim', '');
INSERT INTO `answer` VALUES ('3', '说实话，不容易，特别费劲，昨晚改到了一点半', '0:0:0:0:0:0:0:1', '', '2020-03-29 14:33:16', '5', '20', 'tom', '');
INSERT INTO `answer` VALUES ('4', '在大门口右拐咱们物业那里', '0:0:0:0:0:0:0:1', '', '2021-02-20 12:06:02', '6', '20', 'tim', '');
INSERT INTO `answer` VALUES ('5', '我家也能。哈哈', '0:0:0:0:0:0:0:1', '', '2021-02-24 14:42:07', '6', '20', 'tom', '');
INSERT INTO `answer` VALUES ('6', '尝试重启路由器，不行就恢复出厂设置，总可以的', '0:0:0:0:0:0:0:1', '', '2021-02-24 14:43:53', '7', '20', 'tim', '');
INSERT INTO `answer` VALUES ('7', 'dasdas&nbsp;', '0:0:0:0:0:0:0:1', '', '2021-02-24 16:27:19', '7', '20', 'tom', '');

-- ----------------------------
-- Table structure for `answerreply`
-- ----------------------------
DROP TABLE IF EXISTS `answerreply`;
CREATE TABLE `answerreply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answerId` bigint DEFAULT NULL,
  `content` longtext,
  `ip` varchar(45) DEFAULT NULL,
  `isStaff` bit(1) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answerReply_1_idx` (`answerId`,`status`),
  KEY `answerReply_2_idx` (`questionId`),
  KEY `answerReply_3_idx` (`userName`,`isStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of answerreply
-- ----------------------------
INSERT INTO `answerreply` VALUES ('1', '4', '感谢！我知道了', '0:0:0:0:0:0:0:1', '', '2021-02-20 12:07:59', '6', '20', 'tom');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `ip` varchar(45) DEFAULT NULL,
  `isStaff` bit(1) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `quote` longtext,
  `quoteIdGroup` varchar(255) DEFAULT NULL,
  `quoteUpdateId` varchar(255) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_1_idx` (`topicId`,`status`),
  KEY `comment_2_idx` (`quoteIdGroup`(191)),
  KEY `comment_3_idx` (`userName`,`isStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('3', '可以自己对自己评论，大家给个赞啊', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:14:39', null, ',', ',', '10', 'tom', '20');
INSERT INTO `comment` VALUES ('4', '<span style=\"background-color: #FFFFFF; color: #333333; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; \">你是不是取得网吧不干净，里面有啥插件被检测了，不过可以去微信客服小程序里面反馈申诉，如果是误封会给你解开的。</span>', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:19:01', null, ',', ',', '11', 'tim', '20');
INSERT INTO `comment` VALUES ('5', '你好啊，兔子好玩吗', '0:0:0:0:0:0:0:1', '', '2021-03-31 23:41:50', null, ',', ',', '14', 'tom', '20');
INSERT INTO `comment` VALUES ('6', '我也想要个小兔兔', '0:0:0:0:0:0:0:1', '', '2021-03-31 23:42:56', null, ',', ',', '14', 'tim', '20');
INSERT INTO `comment` VALUES ('7', 'tom，你的摄影很棒哦，我值得学习！', '0:0:0:0:0:0:0:1', '', '2021-04-03 14:51:44', null, ',', ',', '16', 'tim', '20');
INSERT INTO `comment` VALUES ('8', 'tom，你的作品太棒啊', '0:0:0:0:0:0:0:1', '', '2021-04-08 23:04:20', null, ',', ',', '19', 'tim', '20');

-- ----------------------------
-- Table structure for `customreply`
-- ----------------------------
DROP TABLE IF EXISTS `customreply`;
CREATE TABLE `customreply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `customCommentId` bigint DEFAULT NULL,
  `customItemId` bigint DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `staff` bit(1) NOT NULL,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customReply_1_idx` (`customCommentId`),
  KEY `customReply_2_idx` (`customItemId`),
  KEY `customReply_3_idx` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of customreply
-- ----------------------------

-- ----------------------------
-- Table structure for `disableusername`
-- ----------------------------
DROP TABLE IF EXISTS `disableusername`;
CREATE TABLE `disableusername` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of disableusername
-- ----------------------------
INSERT INTO `disableusername` VALUES ('1', '*admin*');

-- ----------------------------
-- Table structure for `favorites_0`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_0`;
CREATE TABLE `favorites_0` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `module` int DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of favorites_0
-- ----------------------------

-- ----------------------------
-- Table structure for `favorites_1`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_1`;
CREATE TABLE `favorites_1` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `module` int DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of favorites_1
-- ----------------------------

-- ----------------------------
-- Table structure for `favorites_2`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_2`;
CREATE TABLE `favorites_2` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `module` int DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of favorites_2
-- ----------------------------
INSERT INTO `favorites_2` VALUES ('9adfbf1e2a1544609d750d516544a7810002', '2021-03-31 23:41:39', 'tom', '14', 'tom', '10', null);
INSERT INTO `favorites_2` VALUES ('a8574fd0779b4491b7408c747f9e3e710002', '2020-03-29 00:39:08', 'tom', null, 'tom', '20', '2');
INSERT INTO `favorites_2` VALUES ('d380cdfbb3514e0f9abbe147a5ad455b0002', '2021-04-03 15:00:44', 'tim', '17', 'tom', '10', null);

-- ----------------------------
-- Table structure for `favorites_3`
-- ----------------------------
DROP TABLE IF EXISTS `favorites_3`;
CREATE TABLE `favorites_3` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `module` int DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of favorites_3
-- ----------------------------
INSERT INTO `favorites_3` VALUES ('2313e25837344f5ba00ca7a1b6f54fc90003', '2021-04-09 08:45:03', 'tim', '17', 'tim', '10', null);
INSERT INTO `favorites_3` VALUES ('5432732672cd4f4192ce29d021ba725d0003', '2021-04-09 08:47:22', 'tom', '19', 'tim', '10', null);
INSERT INTO `favorites_3` VALUES ('e84d5215772e4313b00422bc1583d9910003', '2020-03-29 14:30:29', 'tom', null, 'tim', '20', '4');
INSERT INTO `favorites_3` VALUES ('f50002200b5f4d3d907389c301923a4c0003', '2021-04-03 14:51:25', 'tom', '16', 'tim', '10', null);

-- ----------------------------
-- Table structure for `feedback`
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contact` varchar(190) DEFAULT NULL,
  `content` longtext,
  `createDate` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_1_idx` (`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `follower_0`
-- ----------------------------
DROP TABLE IF EXISTS `follower_0`;
CREATE TABLE `follower_0` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follower_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follower_0
-- ----------------------------

-- ----------------------------
-- Table structure for `follower_1`
-- ----------------------------
DROP TABLE IF EXISTS `follower_1`;
CREATE TABLE `follower_1` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follower_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follower_1
-- ----------------------------

-- ----------------------------
-- Table structure for `follower_2`
-- ----------------------------
DROP TABLE IF EXISTS `follower_2`;
CREATE TABLE `follower_2` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follower_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follower_2
-- ----------------------------
INSERT INTO `follower_2` VALUES ('3-2', '2020-03-29 14:30:52', 'tim', 'tom');

-- ----------------------------
-- Table structure for `follower_3`
-- ----------------------------
DROP TABLE IF EXISTS `follower_3`;
CREATE TABLE `follower_3` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follower_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follower_3
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_0`
-- ----------------------------
DROP TABLE IF EXISTS `follow_0`;
CREATE TABLE `follow_0` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follow_0
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_1`
-- ----------------------------
DROP TABLE IF EXISTS `follow_1`;
CREATE TABLE `follow_1` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follow_1
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_2`
-- ----------------------------
DROP TABLE IF EXISTS `follow_2`;
CREATE TABLE `follow_2` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follow_2
-- ----------------------------

-- ----------------------------
-- Table structure for `follow_3`
-- ----------------------------
DROP TABLE IF EXISTS `follow_3`;
CREATE TABLE `follow_3` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `friendUserName` varchar(30) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of follow_3
-- ----------------------------
INSERT INTO `follow_3` VALUES ('2-3', '2020-03-29 14:30:52', 'tom', 'tim');

-- ----------------------------
-- Table structure for `forum`
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dirName` varchar(40) DEFAULT NULL,
  `displayType` varchar(10) DEFAULT NULL,
  `formValue` longtext,
  `forumChildType` varchar(40) DEFAULT NULL,
  `forumType` varchar(40) DEFAULT NULL,
  `invokeMethod` int DEFAULT NULL,
  `layoutFile` varchar(40) DEFAULT NULL,
  `layoutId` varchar(36) DEFAULT NULL,
  `layoutType` int DEFAULT NULL,
  `module` varchar(80) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `queryMode` int DEFAULT NULL,
  `referenceCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('1', 'default', 'page', '{\"topic_id\":\"4a52e57deb194acd881262f4bb2eb20b\",\"topic_quantity\":null,\"topic_sort\":1,\"topic_more\":null,\"topic_moreValue\":null,\"topic_maxResult\":30,\"topic_pageCount\":10,\"topic_tagId\":null,\"topic_tagName\":null,\"topic_tag_transferPrameter\":true,\"topic_recommendTopicList\":{}}', '话题列表', '话题', '1', 'index.html', '32df80989f8d4b4ebc359364bef9a07d', '1', 'topicRelated_topic_page_default', '话题列表', '0', 'topicRelated_topic_1');
INSERT INTO `forum` VALUES ('4', 'default', 'entityBean', null, '话题内容', '话题', '2', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'topicRelated_topicContent_entityBean_default', '话题内容', '0', 'topicRelated_topicContent_1');
INSERT INTO `forum` VALUES ('5', 'default', 'page', '{\"comment_id\":\"88c04787605d40b1aa25fc689ae3de88\",\"comment_maxResult\":8,\"comment_pageCount\":null,\"comment_sort\":1}', '评论列表', '话题', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'topicRelated_comment_page_default', '评论列表', '0', 'topicRelated_comment_2');
INSERT INTO `forum` VALUES ('6', 'default', 'collection', null, '添加评论', '话题', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'topicRelated_addComment_collection_default', '添加评论', '0', 'topicRelated_addComment_1');
INSERT INTO `forum` VALUES ('7', 'default', 'collection', null, '回复评论', '话题', '1', 'blank_2.html', 'e447aa94ad9e47e4be5d58482d75dc23', '4', 'topicRelated_replyComment_collection_default', '回复评论', '0', 'topicRelated_replyComment_1');
INSERT INTO `forum` VALUES ('8', 'default', 'collection', null, '引用评论', '话题', '1', 'blank_3.html', '72242bb3ca3a463eae46ed0c07826f4f', '4', 'topicRelated_quoteComment_collection_default', '引用评论', '0', 'topicRelated_quoteComment_1');
INSERT INTO `forum` VALUES ('9', 'default', 'collection', null, '添加话题', '话题', '1', 'index.html', '32df80989f8d4b4ebc359364bef9a07d', '1', 'topicRelated_addTopic_collection_default', '添加话题', '0', 'topicRelated_addTopic_1');
INSERT INTO `forum` VALUES ('11', 'default', 'collection', null, '标签列表', '话题', '1', null, '1c3a08c1f26e49d2a31be02187010ef3', '6', 'topicRelated_tag_collection_default', '标签列表', '0', 'quote_1');
INSERT INTO `forum` VALUES ('12', 'default', 'collection', null, '标签列表', '话题', '2', 'index.html', '32df80989f8d4b4ebc359364bef9a07d', '1', 'topicRelated_tag_collection_default', '标签列表', '0', 'topicRelated_tag_1');
INSERT INTO `forum` VALUES ('13', 'default', 'collection', null, '站点栏目列表', '站点栏目', '1', 'newPublic_2.html', '90e9a5ef12b843adb3d282332fbd27df', '5', 'columnRelated_column_collection_default', '站点栏目', '0', 'columnRelated_column_1');
INSERT INTO `forum` VALUES ('14', 'default', 'collection', null, '标签列表', '话题', '1', 'index.html', '32df80989f8d4b4ebc359364bef9a07d', '1', 'topicRelated_tag_collection_navigation', '标签导航', '0', 'topicRelated_tag_2');
INSERT INTO `forum` VALUES ('15', 'default', 'collection', null, '标签列表', '话题', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'topicRelated_tag_collection_navigation2', '导航标签', '0', 'topicRelated_tag_3');
INSERT INTO `forum` VALUES ('16', 'default', 'entityBean', '{\"html_id\":\"f0b49796852644acb8a6e557390b54c0\",\"html_content\":\"欢迎您注册成为本站用户！<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 请仔细阅读下面的协议，只有接受协议才能继续进行注册。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1．服务条款的确认和接纳<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站用户服务的所有权和运作权归本站拥有。本站所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与本站达成协议并接受所有的服务条款。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2． 本站服务简介<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户必须： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)个人上网和支付与此服务有关的电话费用、网络费用。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户同意： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)提供及时、详尽及准确的个人资料。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，本站合理地认为用户的行为可能违反上述法律、法规，本站可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3． 服务条款的修改<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4． 服务修订<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站保留随时修改或中断服务而不需知照用户的权利。本站行使修改或中断服务的权利，不需对用户或第三方负责。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5． 用户隐私制度<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;尊重用户个人隐私是本站的基本政策。本站不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或本站在诚信的基础上认为透露这些信息在以下三种情况是必要的： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)遵守有关法律规定，遵从合法服务程序。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)保持维护本站的商标所有权。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;4)符合其他相关的要求。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6．用户的帐号，密码和安全性<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;一旦注册成功成为本站用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知本站。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7． 免责条款<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户明确同意网站服务的使用由用户个人承担风险。 &emsp;&emsp; <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过本站服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8．有限责任<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站对任何直接、间接、偶然、特殊及继起的损害不负责任。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9． 不提供零售和商业性服务 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经本站同意，不能利用网站服务进行销售或其他商业用途。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10．用户责任 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户单独承担传输内容的责任。用户必须遵循： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;1)从中国境内向外传输技术性资料时必须符合中国有关法规。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;2)使用网站服务不作非法用途。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;3)不干扰或混乱网络服务。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;4)不在论坛BBS或留言簿发表任何与政治相关的信息。 <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;5)遵守所有使用网站服务的网络协议、规定、程序和惯例。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;7)不得利用本站制作、复制和传播下列信息： <br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;1、煽动抗拒、破坏宪法和法律、行政法规实施的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;2、煽动颠覆国家政权，推翻社会主义制度的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;3、煽动分裂国家、破坏国家统一的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;4、煽动民族仇恨、民族歧视，破坏民族团结的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;8、损害国家机关信誉的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;9、其他违反宪法和法律行政法规的；<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;&emsp;10、进行商业广告行为的。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，本站将取消用户服务帐号。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11．网站内容的所有权<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本站定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；本站为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12．附加信息服务<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;用户在享用本站提供的免费服务的同时，同意接受本站提供的各类附加信息服务。<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13．解释权<br />\\r\\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &emsp;&emsp;本注册协议的解释权归本站所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。\"}', '用户自定义HTML', '自定义版块', '1', null, '4ecf97fde2584bd9a5f495ac447dd091', '4', 'customForumRelated_customHTML_entityBean_default', '服务条款', '0', 'customForumRelated_customHTML_1');
INSERT INTO `forum` VALUES ('17', 'default', 'page', '{\"topic_id\":\"6b3b554e2c354275bab82771e8dc803a\",\"topic_quantity\":null,\"topic_sort\":1,\"topic_more\":null,\"topic_moreValue\":null,\"topic_maxResult\":30,\"topic_pageCount\":null,\"topic_tagId\":null,\"topic_tagName\":null,\"topic_tag_transferPrameter\":true,\"topic_recommendTopicList\":{}}', '话题列表', '话题', '1', null, '51c556e4c09a44f8bbf2721b2fde7c55', '4', 'topicRelated_topic_page_default', '话题列表', '0', 'topicRelated_topic_2');
INSERT INTO `forum` VALUES ('18', 'default', 'collection', null, '标签列表', '话题', '1', null, '79065de632934072944d1dcfb224ea28', '4', 'topicRelated_tag_collection_default', '全部标签', '0', 'topicRelated_tag_4');
INSERT INTO `forum` VALUES ('19', 'default', 'entityBean', null, '话题内容', '话题', '1', null, 'a70dcb211a154bbba81697508113668b', '4', 'topicRelated_topicContent_entityBean_default', '话题内容', '0', 'topicRelated_topicContent_2');
INSERT INTO `forum` VALUES ('20', 'default', 'page', '{\"comment_id\":\"c64441bfb1b6433781bac22264e65bf6\",\"comment_maxResult\":30,\"comment_pageCount\":null,\"comment_sort\":2}', '评论列表', '话题', '1', null, '375cd75aaa974f779a3efd448b6ef483', '4', 'topicRelated_comment_page_default', '评论列表', '0', 'topicRelated_comment_3');
INSERT INTO `forum` VALUES ('21', 'default', 'collection', null, '添加话题', '话题', '1', null, '55fd045cac664aea8704b7f821f074a2', '4', 'topicRelated_addTopic_collection_default', '发表话题', '0', 'topicRelated_addTopic_2');
INSERT INTO `forum` VALUES ('22', 'default', 'collection', null, '添加评论', '话题', '1', null, '6f1b6d4452b64c5ea3cbffff1dab6b6e', '4', 'topicRelated_addComment_collection_default', '添加评论', '0', 'topicRelated_addComment_2');
INSERT INTO `forum` VALUES ('23', 'default', 'collection', null, '引用评论', '话题', '1', null, '88f5becc14d34ec6969feaf39a637b69', '4', 'topicRelated_quoteComment_collection_default', '引用评论', '0', 'topicRelated_quoteComment_2');
INSERT INTO `forum` VALUES ('24', 'default', 'collection', null, '回复评论', '话题', '1', null, '730fec12b0e846a1acfa81e9c4c99efc', '4', 'topicRelated_replyComment_collection_default', '回复评论', '0', 'topicRelated_replyComment_2');
INSERT INTO `forum` VALUES ('25', 'default', 'collection', null, '友情链接列表', '友情链接', '1', 'index.html', '32df80989f8d4b4ebc359364bef9a07d', '1', 'linksRelated_links_collection_default', '友情链接', '0', 'linksRelated_links_1');
INSERT INTO `forum` VALUES ('26', 'default', 'collection', null, '添加在线留言', '在线留言', '1', 'blank_4.html', 'e906542026964981b8251aac0894c494', '4', 'feedbackRelated_addFeedback_collection_default', '添加在线留言', '0', 'feedbackRelated_addFeedback_1');
INSERT INTO `forum` VALUES ('28', 'default', 'entityBean', null, '话题会员收藏总数', '收藏夹', '1', null, '5b37a52dc0604914881d767664f39ca2', '4', 'favoriteRelated_favoriteCount_entityBean_default', '查询话题会员收藏总数', '0', 'favoriteRelated_favoriteCount_1');
INSERT INTO `forum` VALUES ('29', 'default', 'entityBean', null, '用户是否已经收藏话题', '收藏夹', '1', null, '4a9681cc36d54a88be3ca330c28d1675', '4', 'favoriteRelated_alreadyCollected_entityBean_default', '查询用户是否已收藏话题', '0', 'favoriteRelated_alreadyCollected_1');
INSERT INTO `forum` VALUES ('30', 'default', 'collection', null, '加入收藏夹', '收藏夹', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'favoriteRelated_addFavorite_collection_default', '加入收藏夹', '0', 'favoriteRelated_addFavorite_1');
INSERT INTO `forum` VALUES ('31', 'default', 'collection', null, '话题取消隐藏', '话题', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'topicRelated_topicUnhide_collection_default', '话题取消隐藏', '0', 'topicRelated_topicUnhide_1');
INSERT INTO `forum` VALUES ('32', 'default', 'collection', null, '话题取消隐藏', '话题', '1', 'userDynamicList.html', '5c7624ced2c845b28741c724594b6b0c', '1', 'topicRelated_topicUnhide_collection_default', '话题取消隐藏', '0', 'topicRelated_topicUnhide_2');
INSERT INTO `forum` VALUES ('33', 'default', 'collection', null, '给话题点赞', '点赞', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'likeRelated_addLike_collection_default', '给话题点赞', '0', 'likeRelated_addLike_1');
INSERT INTO `forum` VALUES ('34', 'default', 'entityBean', null, '话题点赞总数', '点赞', '1', null, '91fcfa258f41472096f57db6308856cf', '4', 'likeRelated_likeCount_entityBean_default', '话题点赞总数', '0', 'likeRelated_likeCount_1');
INSERT INTO `forum` VALUES ('35', 'default', 'entityBean', null, '用户是否已经点赞该话题', '点赞', '1', null, '402eabef91f246859d854838997e6eb6', '4', 'likeRelated_alreadyLiked_entityBean_default', '用户是否已经点赞该话题', '0', 'likeRelated_alreadyLiked_1');
INSERT INTO `forum` VALUES ('36', 'default', 'collection', null, '关注用户', '关注', '1', 'home.html', '440b1b2f202d4de38f450226083ca174', '1', 'followRelated_addFollow_collection_default', '关注用户', '0', 'followRelated_addFollow_1');
INSERT INTO `forum` VALUES ('37', 'default', 'entityBean', null, '粉丝总数', '关注', '1', null, '65735bf28feb47088a5102ff644a0d77', '4', 'followRelated_followerCount_entityBean_default', '查询粉丝总数', '0', 'followRelated_followerCount_1');
INSERT INTO `forum` VALUES ('38', 'default', 'entityBean', null, '是否已经关注该用户', '关注', '1', null, '6c6f77c044024be0a56486f0336df56c', '4', 'followRelated_following_entityBean_default', '查询是否已经关注该用户', '0', 'followRelated_following_1');
INSERT INTO `forum` VALUES ('39', 'default', 'collection', '{\"likeTopic_id\":\"1642cff6571245dabe16ae94a8ced94e\",\"likeTopic_maxResult\":10}', '相似话题', '话题', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'topicRelated_likeTopic_collection_default', '相似话题', '0', 'topicRelated_likeTopic_1');
INSERT INTO `forum` VALUES ('40', 'default', 'collection', null, '会员卡列表', '会员卡', '1', 'blank_5.html', '7f2d29e0c92d43b4844e0c9400b62ebd', '4', 'membershipCardRelated_membershipCard_collection_default', '会员卡列表', '0', 'membershipCardRelated_membershipCard_1');
INSERT INTO `forum` VALUES ('41', 'default', 'entityBean', null, '会员卡内容', '会员卡', '1', 'blank_6.html', '8bf2670aafb9429a92a2dab3c1f08d60', '4', 'membershipCardRelated_membershipCardContent_entityBean_default', '会员卡内容', '0', 'membershipCardRelated_membershipCardContent_1');
INSERT INTO `forum` VALUES ('42', 'default', 'collection', null, '购买会员卡', '会员卡', '1', 'blank_6.html', '8bf2670aafb9429a92a2dab3c1f08d60', '4', 'membershipCardRelated_buyMembershipCard_collection_default', '购买会员卡', '0', 'membershipCardRelated_buyMembershipCard_1');
INSERT INTO `forum` VALUES ('43', 'default', 'collection', null, '会员卡列表', '会员卡', '1', null, 'd548ee0e9d84456c8f616671022d043b', '4', 'membershipCardRelated_membershipCard_collection_default', '查询会员卡列表', '0', 'membershipCardRelated_membershipCard_2');
INSERT INTO `forum` VALUES ('44', 'default', 'entityBean', null, '会员卡内容', '会员卡', '1', null, '5d6067bbc62646f7a22f8095cca01f98', '4', 'membershipCardRelated_membershipCardContent_entityBean_default', '会员卡内容', '0', 'membershipCardRelated_membershipCardContent_2');
INSERT INTO `forum` VALUES ('45', 'default', 'collection', null, '修改话题', '话题', '1', 'blank_7.html', '0f667ec7b1884604a164a22c0fe037e0', '4', 'topicRelated_editTopic_collection_default', '修改话题', '0', 'topicRelated_editTopic_1');
INSERT INTO `forum` VALUES ('46', 'default', 'collection', null, '修改话题', '话题', '1', null, '0f61e4a78bba476faa52040b15c25597', '4', 'topicRelated_editTopic_collection_default', '修改话题', '0', 'topicRelated_editTopic_2');
INSERT INTO `forum` VALUES ('47', 'default', 'page', '{\"question_id\":\"94cbe208feb5483a82b98cc12f1bcf4f\",\"question_quantity\":null,\"question_sort\":1,\"question_more\":null,\"question_moreValue\":null,\"question_maxResult\":30,\"question_pageCount\":null,\"question_tagId\":null,\"question_tagName\":null,\"question_tag_transferPrameter\":true,\"question_filterCondition\":null,\"question_filterCondition_transferPrameter\":true,\"question_recommendQuestionList\":{}}', '问题列表', '问答', '1', 'blank_8.html', '197fb4524ba0483d8406ee25fdc21487', '4', 'questionRelated_question_page_default', '问题列表', '0', 'questionRelated_question_1');
INSERT INTO `forum` VALUES ('48', 'default', 'entityBean', null, '问题内容', '问答', '2', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'questionRelated_questionContent_entityBean_default', '问题内容', '0', 'questionRelated_questionContent_1');
INSERT INTO `forum` VALUES ('49', 'default', 'collection', null, '关注用户', '关注', '1', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'followRelated_addFollow_collection_default', '关注用户', '0', 'followRelated_addFollow_2');
INSERT INTO `forum` VALUES ('50', 'default', 'page', '{\"answer_id\":\"6cbe1e2efad64c85a245da5ff9d1a4c8\",\"answer_maxResult\":15,\"answer_pageCount\":null,\"answer_sort\":2}', '答案列表', '问答', '1', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'questionRelated_answer_page_default', '答案列表', '0', 'questionRelated_answer_1');
INSERT INTO `forum` VALUES ('51', 'default', 'collection', null, '问题标签列表', '问答', '1', 'blank_8.html', '197fb4524ba0483d8406ee25fdc21487', '4', 'questionRelated_questionTag_collection_default', '问题标签', '0', 'questionRelated_questionTag_1');
INSERT INTO `forum` VALUES ('52', 'default', 'collection', null, '添加问题', '问答', '1', 'blank_10.html', '9e9cafbe93314ca585aedbe98f3b4e11', '4', 'questionRelated_addQuestion_collection_default', '添加问题', '0', 'questionRelated_addQuestion_1');
INSERT INTO `forum` VALUES ('53', 'default', 'collection', null, '问题标签列表', '问答', '1', null, '7c79820f306143378169167088f17cc2', '4', 'questionRelated_questionTag_collection_default', '问题标签', '0', 'questionRelated_questionTag_2');
INSERT INTO `forum` VALUES ('54', 'default', 'collection', null, '添加答案', '问答', '1', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'questionRelated_addAnswer_collection_default', '添加答案', '0', 'questionRelated_addAnswer_1');
INSERT INTO `forum` VALUES ('55', 'default', 'collection', null, '回复答案', '问答', '1', 'blank_11.html', '894c1ee85cb34067a0f2c82364178a66', '4', 'questionRelated_replyAnswer_collection_default', '回复答案', '0', 'questionRelated_replyAnswer_1');
INSERT INTO `forum` VALUES ('56', 'default', 'collection', null, '采纳答案', '问答', '1', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'questionRelated_adoptionAnswer_collection_default', '采纳答案', '0', 'questionRelated_adoptionAnswer_1');
INSERT INTO `forum` VALUES ('57', 'default', 'entityBean', null, '关注总数', '关注', '1', null, '4605cd9bb304408883ecc648ba911e37', '4', 'followRelated_followCount_entityBean_default', '关注总数', '0', 'followRelated_followCount_1');
INSERT INTO `forum` VALUES ('58', 'default', 'entityBean', null, '回答总数', '问答', '1', null, 'b9d3684fd5004247b4820ca5b9a5bff3', '4', 'questionRelated_answerCount_entityBean_default', '回答总数', '0', 'questionRelated_answerCount_1');
INSERT INTO `forum` VALUES ('59', 'default', 'collection', '{\"likeQuestion_id\":\"1e2c10a7a96241bb9e7572eea9830b7e\",\"likeQuestion_maxResult\":10}', '相似问题', '问答', '1', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'questionRelated_likeQuestion_collection_default', '相似问题', '0', 'questionRelated_likeQuestion_1');
INSERT INTO `forum` VALUES ('60', 'default', 'page', '{\"question_id\":\"9075b80be5aa4b719bc2d38eab3ab017\",\"question_quantity\":null,\"question_sort\":1,\"question_more\":null,\"question_moreValue\":null,\"question_maxResult\":30,\"question_pageCount\":null,\"question_tagId\":null,\"question_tagName\":null,\"question_tag_transferPrameter\":true,\"question_filterCondition\":null,\"question_filterCondition_transferPrameter\":true,\"question_recommendQuestionList\":{}}', '问题列表', '问答', '1', null, '4f98b0ca689c4fb495c0a12cafe5a650', '4', 'questionRelated_question_page_default', '问题列表', '0', 'questionRelated_question_2');
INSERT INTO `forum` VALUES ('61', 'default', 'entityBean', null, '问题内容', '问答', '1', null, '1d95af33c5ff4eff96c56a79d3ec68dd', '4', 'questionRelated_questionContent_entityBean_default', '问题内容', '0', 'questionRelated_questionContent_2');
INSERT INTO `forum` VALUES ('62', 'default', 'page', '{\"answer_id\":\"44936843f7b24741a92ffabf8f41e2a7\",\"answer_maxResult\":15,\"answer_pageCount\":null,\"answer_sort\":2}', '答案列表', '问答', '1', null, '69b1d61a5afa47a0a05760c5ac7ac282', '4', 'questionRelated_answer_page_default', '答案列表', '0', 'questionRelated_answer_2');
INSERT INTO `forum` VALUES ('63', 'default', 'collection', null, '添加问题', '问答', '1', null, '31f359bb910044749c8073b861fa2909', '4', 'questionRelated_addQuestion_collection_default', '添加问题', '0', 'questionRelated_addQuestion_2');
INSERT INTO `forum` VALUES ('64', 'default', 'collection', null, '添加答案', '问答', '1', null, 'd734da046f784ff2a80dc79515b93646', '4', 'questionRelated_addAnswer_collection_default', '添加答案', '0', 'questionRelated_addAnswer_2');
INSERT INTO `forum` VALUES ('65', 'default', 'collection', null, '回复答案', '问答', '1', null, '62077b6844e2413d9f5e73d1996c7ee9', '4', 'questionRelated_replyAnswer_collection_default', '回复答案', '0', 'questionRelated_replyAnswer_2');
INSERT INTO `forum` VALUES ('66', 'default', 'collection', null, '关注用户', '关注', '1', 'blank_1.html', '7747c7fa3dd6451783f94d01f1678a0b', '4', 'followRelated_addFollow_collection_default', '关注用户', '0', 'followRelated_addFollow_3');
INSERT INTO `forum` VALUES ('67', 'default', 'collection', null, '追加问题', '问答', '1', 'blank_12.html', '53349d99e80c4667883ffffdd9ff9e8e', '4', 'questionRelated_appendQuestion_collection_default', '追加提问', '0', 'questionRelated_appendQuestion_1');
INSERT INTO `forum` VALUES ('68', 'default', 'collection', null, '追加问题', '问答', '1', null, 'eee858f7902c49e5b7adf4e23fc41960', '4', 'questionRelated_appendQuestion_collection_default', '追加提问', '0', 'questionRelated_appendQuestion_2');
INSERT INTO `forum` VALUES ('69', 'default', 'collection', null, '加入收藏夹', '收藏夹', '1', 'blank_9.html', 'd7e5fcb22e1b463cb2616616e42d3b63', '4', 'favoriteRelated_addFavorite_collection_question', '加入收藏夹', '0', 'favoriteRelated_addFavorite_2');
INSERT INTO `forum` VALUES ('70', 'default', 'entityBean', null, '用户是否已经收藏问题', '收藏夹', '1', null, 'eccf8e7e476c4714845687037d6daf96', '4', 'favoriteRelated_alreadyFavoriteQuestion_entityBean_default', '用户是否已收藏该问题', '0', 'favoriteRelated_alreadyFavoriteQuestion_1');
INSERT INTO `forum` VALUES ('71', 'default', 'entityBean', null, '问题会员收藏总数', '收藏夹', '1', null, '843e3bf4f6b645dca42522ee2779d691', '4', 'favoriteRelated_questionFavoriteCount_entityBean_default', '用户问题收藏总数', '0', 'favoriteRelated_questionFavoriteCount_1');

-- ----------------------------
-- Table structure for `help`
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `helpTypeId` bigint DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `help_idx` (`helpTypeId`,`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of help
-- ----------------------------

-- ----------------------------
-- Table structure for `helptype`
-- ----------------------------
DROP TABLE IF EXISTS `helptype`;
CREATE TABLE `helptype` (
  `id` bigint NOT NULL,
  `childNodeNumber` int DEFAULT NULL,
  `helpQuantity` bigint DEFAULT NULL,
  `mergerTypeId` varchar(1000) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `parentId` bigint DEFAULT NULL,
  `parentIdGroup` varchar(200) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `totalHelp` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `helpType_1_idx` (`parentId`),
  KEY `helpType_2_idx` (`parentIdGroup`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of helptype
-- ----------------------------

-- ----------------------------
-- Table structure for `layout`
-- ----------------------------
DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `id` varchar(36) NOT NULL,
  `dirName` varchar(40) DEFAULT NULL,
  `forumData` int DEFAULT NULL,
  `layoutFile` varchar(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `referenceCode` varchar(40) DEFAULT NULL,
  `returnData` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of layout
-- ----------------------------
INSERT INTO `layout` VALUES ('0133f7f7319441138e4a70248c33829b', 'default', '-1', 'login.html', '登录页', 'login', '0', '160', '1');
INSERT INTO `layout` VALUES ('03961f034c7f406f9208f16d199512a2', 'default', '-1', 'updatePhoneBinding_step1.html', '更换绑定手机第一步', 'user/control/updatePhoneBinding/step1', '0', '276', '1');
INSERT INTO `layout` VALUES ('0f61e4a78bba476faa52040b15c25597', 'default', '-1', null, '修改话题(移动版)', 'queryEditTopic', '1', '1740', '4');
INSERT INTO `layout` VALUES ('0f667ec7b1884604a164a22c0fe037e0', 'default', '-1', 'blank_7.html', '修改话题', 'user/editTopic', '0', '1730', '4');
INSERT INTO `layout` VALUES ('10494f8de46746e0886518832a168d9c', 'default', '-1', 'balance.html', '余额', 'user/control/balance', '0', '1400', '1');
INSERT INTO `layout` VALUES ('197fb4524ba0483d8406ee25fdc21487', 'default', '-1', 'blank_8.html', '问题列表', 'askList', '0', '1750', '4');
INSERT INTO `layout` VALUES ('1c3a08c1f26e49d2a31be02187010ef3', 'default', '-1', null, '标签列表', 'quote_1', '0', '390', '6');
INSERT INTO `layout` VALUES ('1d95af33c5ff4eff96c56a79d3ec68dd', 'default', '-1', null, '问题内容(移动版)', 'queryQuestionContent', '1', '2040', '4');
INSERT INTO `layout` VALUES ('1e409d85a5e744f19970258e8ca87f48', 'default', '-1', 'agreement.html', '用户协议', 'agreement', '0', '135', '1');
INSERT INTO `layout` VALUES ('20a1d2ffa25c4f4299b94e905b098218', 'default', '-1', 'newPublic_5.html', '单页应用模板(移动版)', 'newPublic_5', '0', '400', '5');
INSERT INTO `layout` VALUES ('264de55f35114b2f94e8048de00d7c29', 'default', '-1', 'newPublic_4.html', '服务导航', 'newPublic_4', '0', '380', '5');
INSERT INTO `layout` VALUES ('2bbbed906eac4491b0878573e8211406', 'default', '-1', 'point.html', '积分', 'user/control/point', '0', '220', '1');
INSERT INTO `layout` VALUES ('2f0b565a37f24ed5a874ee587dda4394', 'default', '-1', 'topicFavoriteList.html', '话题收藏列表', 'user/control/topicFavoriteList', '0', '700', '1');
INSERT INTO `layout` VALUES ('31f359bb910044749c8073b861fa2909', 'default', '-1', null, '发表问题(移动版)', 'queryAddQuestion', '1', '2060', '4');
INSERT INTO `layout` VALUES ('32df80989f8d4b4ebc359364bef9a07d', 'default', '-1', 'index.html', '首页', 'index', '0', '10', '1');
INSERT INTO `layout` VALUES ('35c54a00b15148eb93ba8068fae4a8e1', 'default', '-1', 'updatePhoneBinding_step2.html', '更换绑定手机第二步', 'user/control/updatePhoneBinding/step2', '0', '277', '1');
INSERT INTO `layout` VALUES ('375cd75aaa974f779a3efd448b6ef483', 'default', '-1', null, '评论列表(移动版)', 'queryCommentList', '1', '450', '4');
INSERT INTO `layout` VALUES ('3ada0d609b9b47388cdadfcbb1b02a6c', 'default', '-1', 'userLoginLogList.html', '用户登录日志列表', 'user/control/userLoginLogList', '0', '310', '1');
INSERT INTO `layout` VALUES ('402eabef91f246859d854838997e6eb6', 'default', '-1', null, '查询用户是否已经点赞该话题', 'queryAlreadyLiked', '1', '920', '4');
INSERT INTO `layout` VALUES ('440b1b2f202d4de38f450226083ca174', 'default', '-1', 'home.html', '用户中心页', 'user/control/home', '0', '170', '1');
INSERT INTO `layout` VALUES ('444c325c26504de9913e844f8648ce1e', 'default', '-1', 'followerList.html', '粉丝列表', 'user/control/followerList', '0', '1300', '1');
INSERT INTO `layout` VALUES ('4605cd9bb304408883ecc648ba911e37', 'default', '-1', null, '查询关注总数', 'queryFollowCount', '1', '2010', '4');
INSERT INTO `layout` VALUES ('4a9681cc36d54a88be3ca330c28d1675', 'default', '-1', null, '查询用户是否已收藏话题', 'queryAlreadyCollected', '1', '720', '4');
INSERT INTO `layout` VALUES ('4ecf97fde2584bd9a5f495ac447dd091', 'default', '-1', null, '服务条款(移动版)', 'termsService', '1', '410', '4');
INSERT INTO `layout` VALUES ('4f98b0ca689c4fb495c0a12cafe5a650', 'default', '-1', null, '问题列表(移动版)', 'queryQuestionList', '1', '2030', '4');
INSERT INTO `layout` VALUES ('50f0a08d6cf34fa699f549a95aa5bc47', 'default', '-1', 'remindList.html', '提醒列表', 'user/control/remindList', '0', '550', '1');
INSERT INTO `layout` VALUES ('51c556e4c09a44f8bbf2721b2fde7c55', 'default', '-1', null, '话题列表(移动版)', 'queryTopicList', '1', '420', '4');
INSERT INTO `layout` VALUES ('53349d99e80c4667883ffffdd9ff9e8e', 'default', '-1', 'blank_12.html', '追加提问', 'user/appendQuestion', '0', '2090', '4');
INSERT INTO `layout` VALUES ('55fd045cac664aea8704b7f821f074a2', 'default', '-1', null, '发表话题(移动版)', 'queryAddTopic', '1', '460', '4');
INSERT INTO `layout` VALUES ('56ac118fbdc14057923af976ac5b92d0', 'default', '-1', 'topicUnhideList.html', '话题取消隐藏用户列表', 'user/control/topicUnhideList', '0', '800', '1');
INSERT INTO `layout` VALUES ('5a4c852fc55f4ad9aade573003ddc546', 'default', '-1', 'message.html', '默认消息页', 'message', '0', '150', '1');
INSERT INTO `layout` VALUES ('5b37a52dc0604914881d767664f39ca2', 'default', '-1', null, '查询话题会员收藏总数', 'queryFavoriteCount', '1', '710', '4');
INSERT INTO `layout` VALUES ('5bd647d07828441d86ec647466dba3b1', 'default', '-1', 'newPublic_3.html', '页脚', 'newPublic_3', '0', '370', '5');
INSERT INTO `layout` VALUES ('5c7624ced2c845b28741c724594b6b0c', 'default', '-1', 'userDynamicList.html', '用户动态列表', 'user/control/userDynamicList', '0', '900', '1');
INSERT INTO `layout` VALUES ('5d03785446d44a0a9dbcc3966ffb377c', 'default', '-1', 'newPublic_1.html', '分页', 'newPublic_1', '0', '320', '5');
INSERT INTO `layout` VALUES ('5d6067bbc62646f7a22f8095cca01f98', 'default', '-1', null, '会员卡(移动版)', 'queryMembershipCard', '1', '1720', '4');
INSERT INTO `layout` VALUES ('62077b6844e2413d9f5e73d1996c7ee9', 'default', '-1', null, '发表答案回复(移动版)', 'queryAddAnswerReply', '1', '2080', '4');
INSERT INTO `layout` VALUES ('65735bf28feb47088a5102ff644a0d77', 'default', '-1', null, '查询粉丝总数', 'queryFollowerCount', '1', '1110', '4');
INSERT INTO `layout` VALUES ('69b1d61a5afa47a0a05760c5ac7ac282', 'default', '-1', null, '答案列表(移动版)', 'queryAnswerList', '1', '2050', '4');
INSERT INTO `layout` VALUES ('69ee523bbe154dd5a506e1c0cebf71e8', 'default', '-1', 'findPassWord_step2.html', '找回密码第二步', 'findPassWord/step2', '0', '137', '1');
INSERT INTO `layout` VALUES ('6c6f77c044024be0a56486f0336df56c', 'default', '-1', null, '查询是否已经关注该用户', 'queryFollowing', '1', '1120', '4');
INSERT INTO `layout` VALUES ('6c93b3c854804de983ccd807ade0da3c', 'default', '-1', 'questionList.html', '我的问题', 'user/control/questionList', '0', '1800', '1');
INSERT INTO `layout` VALUES ('6f1b6d4452b64c5ea3cbffff1dab6b6e', 'default', '-1', null, '发表评论(移动版) ', 'queryAddComment', '1', '470', '4');
INSERT INTO `layout` VALUES ('72242bb3ca3a463eae46ed0c07826f4f', 'default', '-1', 'blank_3.html', '评论引用', 'comment_quote', '0', '350', '4');
INSERT INTO `layout` VALUES ('725640fa18ce499e8c425689c8bdd134', 'default', '-1', 'likeList.html', '点赞列表', 'user/control/likeList', '0', '1000', '1');
INSERT INTO `layout` VALUES ('730fec12b0e846a1acfa81e9c4c99efc', 'default', '-1', null, '发表回复(移动版)', 'queryAddReply', '1', '490', '4');
INSERT INTO `layout` VALUES ('7747c7fa3dd6451783f94d01f1678a0b', 'default', '-1', 'blank_1.html', '话题内容', 'thread', '0', '330', '4');
INSERT INTO `layout` VALUES ('78c4d33956394003927421d221d57dd1', 'default', '-1', 'phoneBinding.html', '绑定手机', 'user/control/phoneBinding', '0', '275', '1');
INSERT INTO `layout` VALUES ('79065de632934072944d1dcfb224ea28', 'default', '-1', null, '全部标签(移动版) ', 'allTag', '1', '430', '4');
INSERT INTO `layout` VALUES ('7c79820f306143378169167088f17cc2', 'default', '-1', null, '查询全部问题标签(json)', 'queryAllQuestionTag', '1', '1780', '4');
INSERT INTO `layout` VALUES ('7f2d29e0c92d43b4844e0c9400b62ebd', 'default', '-1', 'blank_5.html', '会员卡列表', 'membershipCardList', '0', '1310', '4');
INSERT INTO `layout` VALUES ('7f5b0839442446148b5f56f0f2648d45', 'default', '-1', 'followList.html', '关注列表', 'user/control/followList', '0', '1200', '1');
INSERT INTO `layout` VALUES ('7f92073f42c84b67bf89b64b3ba3f5d1', 'default', '-1', 'favoriteList.html', '收藏夹列表', 'user/control/favoriteList', '0', '600', '1');
INSERT INTO `layout` VALUES ('82df735f38f245ccb8160120e717c9ba', 'default', '-1', 'register.html', '注册页', 'register', '0', '130', '1');
INSERT INTO `layout` VALUES ('843e3bf4f6b645dca42522ee2779d691', 'default', '-1', null, '查询用户问题收藏总数', 'queryQuestionFavoriteCount', '1', '2120', '4');
INSERT INTO `layout` VALUES ('85b9fb209cdb437e9f50e849d2c7402b', 'default', '3', 'more_help.html', '在线帮助\'更多\'', 'more', '0', '60', '1');
INSERT INTO `layout` VALUES ('88f5becc14d34ec6969feaf39a637b69', 'default', '-1', null, '引用评论(移动版)', 'queryAddQuote', '1', '480', '4');
INSERT INTO `layout` VALUES ('894c1ee85cb34067a0f2c82364178a66', 'default', '-1', 'blank_11.html', '答案回复', 'answer_reply', '0', '1790', '4');
INSERT INTO `layout` VALUES ('8b5dd591aa3548e78fd8688230f8cd76', 'default', '-1', 'topicList.html', '我的话题', 'user/control/topicList', '0', '180', '1');
INSERT INTO `layout` VALUES ('8ba23e3d267c427da37de1b8b037edff', 'default', '-1', 'findPassWord_step1.html', '找回密码第一步', 'findPassWord/step1', '0', '136', '1');
INSERT INTO `layout` VALUES ('8bf2670aafb9429a92a2dab3c1f08d60', 'default', '-1', 'blank_6.html', '会员卡', 'membershipCard', '0', '1320', '4');
INSERT INTO `layout` VALUES ('8fea6a5b0d4148cea24ed8c648c26107', 'default', '-1', 'realNameAuthentication.html', '实名认证', 'user/control/realNameAuthentication', '0', '274', '1');
INSERT INTO `layout` VALUES ('90e9a5ef12b843adb3d282332fbd27df', 'default', '-1', 'newPublic_2.html', '页头', 'newPublic_2', '0', '360', '5');
INSERT INTO `layout` VALUES ('91fcfa258f41472096f57db6308856cf', 'default', '-1', null, '查询话题点赞总数', 'queryLikeCount', '1', '910', '4');
INSERT INTO `layout` VALUES ('9e9cafbe93314ca585aedbe98f3b4e11', 'default', '-1', 'blank_10.html', '发表问题', 'user/addQuestion', '0', '1770', '4');
INSERT INTO `layout` VALUES ('9fdd67aa7e3d4dd7aabbe1ab0fd324e5', 'default', '-1', 'answerReplyList.html', '我的答案回复', 'user/control/answerReplyList', '0', '2000', '1');
INSERT INTO `layout` VALUES ('a14b8228d72b4c72b306111be88fc1bb', 'default', '-1', 'membershipCardOrderList.html', '会员卡订单列表', 'membershipCardOrderList', '0', '1700', '1');
INSERT INTO `layout` VALUES ('a4a0399a222f48039c84acd45e4df52f', 'default', '-1', 'addPrivateMessage.html', '添加私信', 'user/control/addPrivateMessage', '0', '450', '1');
INSERT INTO `layout` VALUES ('a70dcb211a154bbba81697508113668b', 'default', '-1', null, '话题内容(移动版)', 'queryTopicContent', '1', '440', '4');
INSERT INTO `layout` VALUES ('abb3fc5ca2354ea287fd87d816c2d0bb', 'default', '-1', 'commentList.html', '我的评论', 'user/control/commentList', '0', '180', '1');
INSERT INTO `layout` VALUES ('acbffd6b80804f58a3457edf57b5ee1d', 'default', '-1', 'privateMessageChatList.html', '私信对话列表', 'user/control/privateMessageChatList', '0', '400', '1');
INSERT INTO `layout` VALUES ('b2fbec2d094d41e49e7d1111c120098c', 'default', '-1', 'replyList.html', '我的回复', 'user/control/replyList', '0', '180', '1');
INSERT INTO `layout` VALUES ('b5b0e4b3c19145b497bc7cb529bf2519', 'default', '-1', 'privateMessageList.html', '私信列表', 'user/control/privateMessageList', '0', '350', '1');
INSERT INTO `layout` VALUES ('b9d3684fd5004247b4820ca5b9a5bff3', 'default', '-1', null, '查询回答总数', 'queryAnswerCount', '1', '2020', '4');
INSERT INTO `layout` VALUES ('ba85aac8b3924ea980ad39087d0a722f', 'default', '-1', 'systemNotifyList.html', '系统通知列表', 'user/control/systemNotifyList', '0', '500', '1');
INSERT INTO `layout` VALUES ('bc920d0af10443828316bbc8bcb2b4c3', 'default', '-1', 'payment.html', '付款页面', 'user/control/payment', '0', '1500', '1');
INSERT INTO `layout` VALUES ('d40efbb845cc446ea520eec7e732cf4f', 'default', '-1', 'questionFavoriteList.html', '问题收藏列表', 'user/control/questionFavoriteList', '0', '2100', '1');
INSERT INTO `layout` VALUES ('d548ee0e9d84456c8f616671022d043b', 'default', '-1', null, '查询会员卡列表(移动版)', 'queryMembershipCardList', '1', '1710', '4');
INSERT INTO `layout` VALUES ('d734da046f784ff2a80dc79515b93646', 'default', '-1', null, '发表答案(移动版)', 'queryAddAnswer', '1', '2070', '4');
INSERT INTO `layout` VALUES ('d7e5fcb22e1b463cb2616616e42d3b63', 'default', '-1', 'blank_9.html', '问题内容', 'question', '0', '1760', '4');
INSERT INTO `layout` VALUES ('d9bc3f88bc184f6a98a8bf2d7429653e', 'default', '-1', 'jump.html', '默认跳转页', 'jump', '0', '140', '1');
INSERT INTO `layout` VALUES ('e165692880c2439ea24164a545477616', 'default', '-1', 'paymentCompleted.html', '付款完成页面', 'paymentCompleted', '0', '1600', '1');
INSERT INTO `layout` VALUES ('e447aa94ad9e47e4be5d58482d75dc23', 'default', '-1', 'blank_2.html', '评论回复', 'comment_reply', '0', '340', '4');
INSERT INTO `layout` VALUES ('e55ba5ae4efe4ba4b55857d00cfaab0d', 'default', '-1', 'search.html', '话题搜索页', 'search', '0', '30', '1');
INSERT INTO `layout` VALUES ('e906542026964981b8251aac0894c494', 'default', '-1', 'blank_4.html', '在线留言', 'feedback', '0', '500', '4');
INSERT INTO `layout` VALUES ('eccf8e7e476c4714845687037d6daf96', 'default', '-1', null, '查询用户是否已收藏问题', 'queryAlreadyFavoriteQuestion', '1', '2110', '4');
INSERT INTO `layout` VALUES ('eee858f7902c49e5b7adf4e23fc41960', 'default', '-1', null, '追加提问(移动版)', 'queryAppendQuestion', '1', '2100', '4');
INSERT INTO `layout` VALUES ('f24e26d8f5fb4f408f32fdff4089d083', 'default', '-1', 'answerList.html', '我的答案', 'user/control/answerList', '0', '1900', '1');
INSERT INTO `layout` VALUES ('fc0b41f454dd4a10916be238d295a0b9', 'default', '-1', 'editUser.html', '修改会员', 'user/control/editUser', '0', '270', '1');
INSERT INTO `layout` VALUES ('ffbc4af71a024cbd861e5dd621bf45a1', 'default', '-1', 'topicLikeList.html', '话题点赞列表', 'user/control/topicLikeList', '0', '1100', '1');

-- ----------------------------
-- Table structure for `like_0`
-- ----------------------------
DROP TABLE IF EXISTS `like_0`;
CREATE TABLE `like_0` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `like_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of like_0
-- ----------------------------

-- ----------------------------
-- Table structure for `like_1`
-- ----------------------------
DROP TABLE IF EXISTS `like_1`;
CREATE TABLE `like_1` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `like_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of like_1
-- ----------------------------

-- ----------------------------
-- Table structure for `like_2`
-- ----------------------------
DROP TABLE IF EXISTS `like_2`;
CREATE TABLE `like_2` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `like_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of like_2
-- ----------------------------
INSERT INTO `like_2` VALUES ('152dde5fd79942fead519b4a79d754b50002', '2021-03-31 23:41:38', 'tom', '14', 'tom');
INSERT INTO `like_2` VALUES ('3f4c85d805e641f9b2882e6da1485cdc0002', '2021-04-03 15:00:46', 'tim', '17', 'tom');

-- ----------------------------
-- Table structure for `like_3`
-- ----------------------------
DROP TABLE IF EXISTS `like_3`;
CREATE TABLE `like_3` (
  `id` varchar(36) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `like_1_idx` (`userName`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of like_3
-- ----------------------------
INSERT INTO `like_3` VALUES ('36f7b1838b9f449c9ddbe541f32591130003', '2021-03-20 18:19:26', 'tom', '11', 'tim');
INSERT INTO `like_3` VALUES ('7d773e6cbfb744029484d60ad0ea49910003', '2021-04-09 08:45:05', 'tim', '17', 'tim');
INSERT INTO `like_3` VALUES ('7eba84fe471343748541e9d11d0e40450003', '2021-04-08 23:04:08', 'tom', '19', 'tim');
INSERT INTO `like_3` VALUES ('a0c9a07d3d2d4896a2c4d78daad2d6f30003', '2021-04-03 14:51:27', 'tom', '16', 'tim');

-- ----------------------------
-- Table structure for `links`
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `website` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of links
-- ----------------------------

-- ----------------------------
-- Table structure for `membershipcard`
-- ----------------------------
DROP TABLE IF EXISTS `membershipcard`;
CREATE TABLE `membershipcard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createDate` datetime DEFAULT NULL,
  `descriptionTagFormat` longtext,
  `highestPoint` bigint DEFAULT NULL,
  `highestPrice` decimal(12,2) DEFAULT NULL,
  `introduction` longtext,
  `lowestPoint` bigint DEFAULT NULL,
  `lowestPrice` decimal(12,2) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `state` int DEFAULT NULL,
  `subtitle` varchar(190) DEFAULT NULL,
  `userRoleId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `membershipCard_1_idx` (`createDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of membershipcard
-- ----------------------------
INSERT INTO `membershipcard` VALUES ('1', '2020-03-29 13:38:06', '[\"上传图片\",\"私信无限制\",\"发表话题使用隐藏标签\",\"各专区资源全部权益\"]', null, '280.00', '<span>白金会员拥有专属身份标识；&nbsp;</span> \n<span>&nbsp;</span> \n<span>拥有各区资源查看特权</span>', null, '30.00', '白金会员', '0', '1', '购买时间越长优惠越多', 'ba608ad2ee4a4608bb8aca126f4d74c6');

-- ----------------------------
-- Table structure for `membershipcardorder`
-- ----------------------------
DROP TABLE IF EXISTS `membershipcardorder`;
CREATE TABLE `membershipcardorder` (
  `orderId` bigint NOT NULL,
  `accountPayable` decimal(12,2) NOT NULL,
  `accountPoint` bigint DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `membershipCardId` bigint DEFAULT NULL,
  `paymentAmount` decimal(12,2) NOT NULL,
  `paymentPoint` bigint DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `roleName` varchar(192) DEFAULT NULL,
  `specificationId` bigint DEFAULT NULL,
  `specificationName` varchar(192) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `userRoleId` varchar(32) DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `membershipCardOrder_1_idx` (`userName`,`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of membershipcardorder
-- ----------------------------
INSERT INTO `membershipcardorder` VALUES ('323461184000309994', '30.00', '0', '2020-04-01 19:20:46', '1', '1', '30.00', '0', '1', '白金会员', '1', '白金会员1个月', '30', 'tim', 'ba608ad2ee4a4608bb8aca126f4d74c6', '0');

-- ----------------------------
-- Table structure for `onlinepaymentinterface`
-- ----------------------------
DROP TABLE IF EXISTS `onlinepaymentinterface`;
CREATE TABLE `onlinepaymentinterface` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dynamicParameter` longtext,
  `enable` bit(1) NOT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `supportEquipment` varchar(5) DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of onlinepaymentinterface
-- ----------------------------

-- ----------------------------
-- Table structure for `paymentlog_0`
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_0`;
CREATE TABLE `paymentlog_0` (
  `paymentRunningNumber` varchar(32) NOT NULL,
  `amount` decimal(14,4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `paymentModule` int DEFAULT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `tradeNo` varchar(255) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`),
  KEY `paymentlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paymentlog_0
-- ----------------------------

-- ----------------------------
-- Table structure for `paymentlog_1`
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_1`;
CREATE TABLE `paymentlog_1` (
  `paymentRunningNumber` varchar(32) NOT NULL,
  `amount` decimal(14,4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `paymentModule` int DEFAULT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `tradeNo` varchar(255) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`),
  KEY `paymentlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paymentlog_1
-- ----------------------------

-- ----------------------------
-- Table structure for `paymentlog_2`
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_2`;
CREATE TABLE `paymentlog_2` (
  `paymentRunningNumber` varchar(32) NOT NULL,
  `amount` decimal(14,4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `paymentModule` int DEFAULT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `tradeNo` varchar(255) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`),
  KEY `paymentlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paymentlog_2
-- ----------------------------
INSERT INTO `paymentlog_2` VALUES ('20210220120500680000206267139', '1.0000', '2', '0', 'tom', '2', '6', '90', '', '2021-02-20 12:05:01', null, 'tom');
INSERT INTO `paymentlog_2` VALUES ('20210224144044465000208103498', '100.0000', '2', '0', 'tom', '2', '7', '90', '', '2021-02-24 14:40:44', null, 'tom');

-- ----------------------------
-- Table structure for `paymentlog_3`
-- ----------------------------
DROP TABLE IF EXISTS `paymentlog_3`;
CREATE TABLE `paymentlog_3` (
  `paymentRunningNumber` varchar(32) NOT NULL,
  `amount` decimal(14,4) NOT NULL,
  `amountState` int NOT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `paymentModule` int DEFAULT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `tradeNo` varchar(255) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`paymentRunningNumber`),
  KEY `paymentlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paymentlog_3
-- ----------------------------
INSERT INTO `paymentlog_3` VALUES ('20200401192045649000304848207', '30.0000', '2', '-1', 'tim', '2', '323461184000309994', '1', '', '2020-04-01 19:20:46', '', 'tim');
INSERT INTO `paymentlog_3` VALUES ('20210320182205686000382261606', '1.0000', '2', '0', 'tim', '2', '8', '90', '', '2021-03-20 18:22:06', null, 'tim');

-- ----------------------------
-- Table structure for `paymentverificationlog`
-- ----------------------------
DROP TABLE IF EXISTS `paymentverificationlog`;
CREATE TABLE `paymentverificationlog` (
  `id` varchar(32) NOT NULL,
  `parameterId` bigint DEFAULT NULL,
  `paymentAmount` decimal(12,2) NOT NULL,
  `paymentModule` int DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userName_idx` (`parameterId`,`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of paymentverificationlog
-- ----------------------------

-- ----------------------------
-- Table structure for `pointlog_0`
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_0`;
CREATE TABLE `pointlog_0` (
  `id` varchar(36) NOT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pointlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pointlog_0
-- ----------------------------
INSERT INTO `pointlog_0` VALUES ('6b70db0e1b734ffe9320cdcd7e9e0cf30004', 'xiaohong', '2', '2', '100', '10', '1', '', '2020-03-29 14:35:59', 'xiaohong');

-- ----------------------------
-- Table structure for `pointlog_1`
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_1`;
CREATE TABLE `pointlog_1` (
  `id` varchar(36) NOT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pointlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pointlog_1
-- ----------------------------

-- ----------------------------
-- Table structure for `pointlog_2`
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_2`;
CREATE TABLE `pointlog_2` (
  `id` varchar(36) NOT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pointlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pointlog_2
-- ----------------------------
INSERT INTO `pointlog_2` VALUES ('007e615a8802491dad0e8d1b0cee6cd70002', 'tom', '2', '12', '100', '10', '1', '', '2021-03-31 23:34:14', 'tom');
INSERT INTO `pointlog_2` VALUES ('065d84de4f8b431fbec143b0ff7ad7ad0002', 'tom', '2', '7', '700', '10', '1', '', '2021-02-24 14:40:45', 'tom');
INSERT INTO `pointlog_2` VALUES ('0edb638053144ffbba01784e6845478b0002', 'tom', '2', '5', '800', '5', '1', '', '2021-02-24 14:42:07', 'tom');
INSERT INTO `pointlog_2` VALUES ('126331232436483b9a5b3e62c2c6b9780002', 'tom', '2', '6', '100', '10', '1', '', '2021-03-20 17:24:33', 'tom');
INSERT INTO `pointlog_2` VALUES ('1441f6bdd1f040cb9d57701f6d1bb4c30002', 'tom', '2', '7', '1000', '5', '2', '', '2021-02-24 14:40:44', 'tom');
INSERT INTO `pointlog_2` VALUES ('149e7431726d4970b0b5f7162fc559490002', 'tom', '2', '14', '100', '10', '1', '', '2021-03-31 23:40:25', 'tom');
INSERT INTO `pointlog_2` VALUES ('233bbf2caf2b47e690bc15dbecf6cb680002', 'tom', '2', '6', '1000', '1', '2', '', '2021-02-20 12:05:01', 'tom');
INSERT INTO `pointlog_2` VALUES ('2978bae7d4174820a844e34ebb4127390002', 'tom', '2', '1', '200', '5', '1', '', '2021-02-20 12:08:20', 'tom');
INSERT INTO `pointlog_2` VALUES ('2f372622f88f4f5e96f3615e462746c40002', 'tom', '2', '19', '100', '10', '1', '', '2021-04-08 23:02:27', 'tom');
INSERT INTO `pointlog_2` VALUES ('31e5bd80bc154f51a736cdcd7428d24a0002', 'tom', '2', '15', '100', '10', '1', '', '2021-04-01 00:01:56', 'tom');
INSERT INTO `pointlog_2` VALUES ('3cefaa4f55c84cdf98b64c85926bd4f90002', 'tom', '2', '13', '100', '10', '1', '', '2021-03-31 23:35:21', 'tom');
INSERT INTO `pointlog_2` VALUES ('3fbf06f05301464cad510cbe156ed5510002', 'tom', '2', '7', '800', '5', '1', '', '2021-02-24 16:27:19', 'tom');
INSERT INTO `pointlog_2` VALUES ('49cd2aa48c914539b19193f4edd40d240002', 'tom', '2', '7', '100', '10', '1', '', '2021-03-20 17:25:40', 'tom');
INSERT INTO `pointlog_2` VALUES ('4e282f0b7cd44c9289313375665bac400002', 'tom', '2', '4', '100', '10', '1', '', '2021-02-24 14:39:32', 'tom');
INSERT INTO `pointlog_2` VALUES ('6bd8b5c4b1b548bcbb3dde2aff7729270002', 'tom', '2', '8', '300', '5', '1', '', '2021-04-08 23:05:17', 'tom');
INSERT INTO `pointlog_2` VALUES ('6e6a46423dd6435c85ebbf62d497f40e0002', 'tom', '2', '7', '300', '5', '1', '', '2021-04-03 14:59:51', 'tom');
INSERT INTO `pointlog_2` VALUES ('73a7a0a591f3413b8640d5c8357fd7030002', 'tom', '2', '3', '800', '5', '1', '', '2020-03-29 14:33:16', 'tom');
INSERT INTO `pointlog_2` VALUES ('797809d58e3d4a828008d87af18986d30002', 'tom', '2', '4', '1000', '2', '2', '', '2020-03-29 14:28:00', 'tom');
INSERT INTO `pointlog_2` VALUES ('83e4240196d34c1f936d5dafd455a6c70002', 'tom', '2', '16', '100', '10', '1', '', '2021-04-03 14:47:00', 'tom');
INSERT INTO `pointlog_2` VALUES ('864f60628edd472c9411549433d56aeb0002', 'tom', '2', '6', '700', '10', '1', '', '2021-02-20 12:05:01', 'tom');
INSERT INTO `pointlog_2` VALUES ('8827ce554cc54d018fcf59bd4688d7810002', 'tom', '2', '3', '1000', '1', '2', '', '2020-03-29 14:26:48', 'tom');
INSERT INTO `pointlog_2` VALUES ('8f18d18845e44e79a124ec4e2e9581910002', 'tom', '2', '8', '100', '10', '1', '', '2021-03-20 17:42:13', 'tom');
INSERT INTO `pointlog_2` VALUES ('90751089e83f4132a55ae0a2a0fb68db0002', 'tom', '2', '4', '900', '5', '1', '', '2021-02-20 12:07:59', 'tom');
INSERT INTO `pointlog_2` VALUES ('91e165c30f5945b68a333ccd80beb8e40002', 'tom', '2', '2', '700', '10', '1', '', '2020-03-29 00:38:36', 'tom');
INSERT INTO `pointlog_2` VALUES ('a0f88d6639a14a3690939b0112f329980002', 'tom', '2', '5', '100', '10', '1', '', '2021-02-24 14:41:38', 'tom');
INSERT INTO `pointlog_2` VALUES ('b79460c3f9a9466f9aa6764c6a3f3ce00002', 'tom', '2', '9', '100', '10', '1', '', '2021-03-20 18:03:07', 'tom');
INSERT INTO `pointlog_2` VALUES ('ba2d8e5e6c6948f39d98a43610226e260002', 'tom', '2', '4', '300', '5', '1', '', '2021-03-20 18:23:29', 'tom');
INSERT INTO `pointlog_2` VALUES ('bd566df3f432474a99557dcf76ee03520002', 'tom', '2', '3', '200', '5', '1', '', '2021-03-20 18:14:39', 'tom');
INSERT INTO `pointlog_2` VALUES ('c9c54d98e4ae465894701cc220d4c3d40002', 'tom', '2', '3', '700', '10', '1', '', '2020-03-29 14:26:48', 'tom');
INSERT INTO `pointlog_2` VALUES ('d214aaf67fc84284be0b64ba39f211b00002', 'tom', '2', '4', '700', '10', '1', '', '2020-03-29 14:28:00', 'tom');
INSERT INTO `pointlog_2` VALUES ('d32bda3e19434012aa52bb00c9680ec90002', 'tom', '2', '2', '1000', '1', '2', '', '2020-03-29 00:38:36', 'tom');
INSERT INTO `pointlog_2` VALUES ('dc09beef2f3d419c8f9899b3808660b00002', 'tom', '2', '1', '700', '10', '1', '', '2020-03-28 23:47:58', 'tom');
INSERT INTO `pointlog_2` VALUES ('e8c590cd621844f9be70f8f36b2548650002', 'tom', '2', '10', '100', '10', '1', '', '2021-03-20 18:13:42', 'tom');
INSERT INTO `pointlog_2` VALUES ('f3c21eafa0da4da081b67688851f98a50002', 'tom', '2', '18', '100', '10', '1', '', '2021-04-08 23:01:35', 'tom');
INSERT INTO `pointlog_2` VALUES ('faddd556477548a1b27841eeb102942a0002', 'tom', '2', '11', '100', '10', '1', '', '2021-03-20 18:16:10', 'tom');
INSERT INTO `pointlog_2` VALUES ('fc2de230dba348d7832da0600fb427600002', 'tom', '2', '5', '200', '5', '1', '', '2021-03-31 23:41:50', 'tom');

-- ----------------------------
-- Table structure for `pointlog_3`
-- ----------------------------
DROP TABLE IF EXISTS `pointlog_3`;
CREATE TABLE `pointlog_3` (
  `id` varchar(36) NOT NULL,
  `operationUserName` varchar(50) DEFAULT NULL,
  `operationUserType` int DEFAULT NULL,
  `parameterId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `pointState` int NOT NULL,
  `remark` longtext,
  `times` datetime DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pointlog_idx` (`userName`,`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pointlog_3
-- ----------------------------
INSERT INTO `pointlog_3` VALUES ('0c614f831a964d388f768155f0900c560003', 'tim', '2', '2', '800', '5', '1', '', '2020-03-29 14:30:42', 'tim');
INSERT INTO `pointlog_3` VALUES ('1fa13073cb3e44eea73b1f5dde1b2af90003', 'tim', '2', '3', '100', '10', '1', '', '2021-02-20 12:07:09', 'tim');
INSERT INTO `pointlog_3` VALUES ('28b89693f11e436c8930a89ea04a575c0003', 'tim', '2', '6', '200', '5', '1', '', '2021-03-31 23:42:56', 'tim');
INSERT INTO `pointlog_3` VALUES ('3ef8a2824e334f43887c2d2302ad59ad0003', 'tim', '2', '4', '200', '5', '1', '', '2021-03-20 18:19:02', 'tim');
INSERT INTO `pointlog_3` VALUES ('47a3366269d44184a04dbd4b8dae5fab0003', 'tim', '2', '17', '100', '10', '1', '', '2021-04-03 14:57:55', 'tim');
INSERT INTO `pointlog_3` VALUES ('4dc12ce112954d6a8332a3bb392d9f680003', 'tim', '2', '5', '1000', '1', '2', '', '2020-03-29 14:31:41', 'tim');
INSERT INTO `pointlog_3` VALUES ('5eee075ac2594d7183f295c3594c5dad0003', 'tim', '2', '7', '200', '5', '1', '', '2021-04-03 14:51:44', 'tim');
INSERT INTO `pointlog_3` VALUES ('6e1a0e54ce18457c8ddcdd3070454be00003', 'tim', '2', '4', '800', '5', '1', '', '2021-02-20 12:06:02', 'tim');
INSERT INTO `pointlog_3` VALUES ('71d7a618f5a8481395c1fa38137ec6e60003', 'tim', '2', '5', '300', '5', '1', '', '2021-03-31 23:43:43', 'tim');
INSERT INTO `pointlog_3` VALUES ('a3eb27ce183c4ea3865f1dfb8b421c640003', 'tim', '2', '8', '700', '10', '1', '', '2021-03-20 18:22:06', 'tim');
INSERT INTO `pointlog_3` VALUES ('a8c68c49ec5948e7aed463e4532656da0003', 'tim', '2', '8', '200', '5', '1', '', '2021-04-08 23:04:20', 'tim');
INSERT INTO `pointlog_3` VALUES ('b8180af612984c708aefc8181224d4a60003', 'tom', '2', '1', '1100', '1', '1', '', '2020-03-29 00:44:04', 'tim');
INSERT INTO `pointlog_3` VALUES ('bb3ddae530ae456897389a676387fa870003', 'tim', '2', '8', '1000', '1', '2', '', '2021-03-20 18:22:06', 'tim');
INSERT INTO `pointlog_3` VALUES ('c77380ce3bef4c0f93b7cbcc03603c920003', 'tim', '2', '5', '700', '10', '1', '', '2020-03-29 14:31:42', 'tim');
INSERT INTO `pointlog_3` VALUES ('d48f2b0414ad4e8cae3df8a2a2ba81c40003', 'tim', '2', '6', '800', '5', '1', '', '2021-02-24 14:43:53', 'tim');
INSERT INTO `pointlog_3` VALUES ('db0023ac9a104bd79d8643d2270484970003', 'tim', '2', '1', '800', '5', '1', '', '2020-03-29 00:42:27', 'tim');

-- ----------------------------
-- Table structure for `privatemessage_0`
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_0`;
CREATE TABLE `privatemessage_0` (
  `id` varchar(36) NOT NULL,
  `friendUserId` bigint DEFAULT NULL,
  `messageContent` longtext,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privateMessage_1_idx` (`userId`,`status`,`sendTimeFormat`),
  KEY `privateMessage_2_idx` (`userId`,`friendUserId`,`status`,`sendTimeFormat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of privatemessage_0
-- ----------------------------

-- ----------------------------
-- Table structure for `privatemessage_1`
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_1`;
CREATE TABLE `privatemessage_1` (
  `id` varchar(36) NOT NULL,
  `friendUserId` bigint DEFAULT NULL,
  `messageContent` longtext,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privateMessage_1_idx` (`userId`,`status`,`sendTimeFormat`),
  KEY `privateMessage_2_idx` (`userId`,`friendUserId`,`status`,`sendTimeFormat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of privatemessage_1
-- ----------------------------

-- ----------------------------
-- Table structure for `privatemessage_2`
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_2`;
CREATE TABLE `privatemessage_2` (
  `id` varchar(36) NOT NULL,
  `friendUserId` bigint DEFAULT NULL,
  `messageContent` longtext,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privateMessage_1_idx` (`userId`,`status`,`sendTimeFormat`),
  KEY `privateMessage_2_idx` (`userId`,`friendUserId`,`status`,`sendTimeFormat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of privatemessage_2
-- ----------------------------
INSERT INTO `privatemessage_2` VALUES ('078bc9006d534b1da8087531253d78780002', '3', 'hha', '1614155271671', '3', '1614155271671', '2', '120', '2');
INSERT INTO `privatemessage_2` VALUES ('2c64337a3486428a8fc8ac4b5b8a8a9c0002', '3', '当然可以啊，我正缺男朋友呢', '1614155267599', '2', '1614149071090', '3', '120', '2');
INSERT INTO `privatemessage_2` VALUES ('36811948141741609070dcf4b394a3260002', '3', '你好，咋啦老弟？', '1617929184215', '3', '1617929184215', '2', '20', '2');
INSERT INTO `privatemessage_2` VALUES ('858d1ac6afc6479ab24e9a6180e546ab0002', '3', '笑啥', null, '2', '1614155297154', '3', '110', '2');
INSERT INTO `privatemessage_2` VALUES ('882910ee527540c4a70d130ca8fe93d60002', '3', '你好啊，可以交个朋友吗', '1614148965727', '3', '1614148965727', '2', '120', '2');
INSERT INTO `privatemessage_2` VALUES ('9b551bbc46bc444fb4cde03d4fcfa9660002', '3', '你好啊兄弟', '1617929175342', '2', '1617929135898', '3', '20', '2');
INSERT INTO `privatemessage_2` VALUES ('aace1507b3c84626b086430be2b51bbd0002', '3', '没事，客户不相信我，草', null, '2', '1617929217918', '3', '10', '2');

-- ----------------------------
-- Table structure for `privatemessage_3`
-- ----------------------------
DROP TABLE IF EXISTS `privatemessage_3`;
CREATE TABLE `privatemessage_3` (
  `id` varchar(36) NOT NULL,
  `friendUserId` bigint DEFAULT NULL,
  `messageContent` longtext,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `privateMessage_1_idx` (`userId`,`status`,`sendTimeFormat`),
  KEY `privateMessage_2_idx` (`userId`,`friendUserId`,`status`,`sendTimeFormat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of privatemessage_3
-- ----------------------------
INSERT INTO `privatemessage_3` VALUES ('02864fa0b81b4205b2d7d6662e503afb0003', '2', '笑啥', '1614155297154', '2', '1614155297154', '3', '20', '3');
INSERT INTO `privatemessage_3` VALUES ('11e01676070045a3b0871478135364f40003', '2', '你好，咋啦老弟？', '1617929204977', '3', '1617929184215', '2', '20', '3');
INSERT INTO `privatemessage_3` VALUES ('41a45e9590d54a07a81d52c5ca35690c0003', '2', 'hha', '1614155287497', '3', '1614155271671', '2', '20', '3');
INSERT INTO `privatemessage_3` VALUES ('6ba6a4071c4b4ababd4f692f83b670200003', '2', '当然可以啊，我正缺男朋友呢', '1614149071090', '2', '1614149071090', '3', '20', '3');
INSERT INTO `privatemessage_3` VALUES ('7d8dda805a574aae80c46886393323700003', '2', '没事，客户不相信我，草', '1617929217918', '2', '1617929217918', '3', '20', '3');
INSERT INTO `privatemessage_3` VALUES ('925614dbdd37497cbc91a6f9edb0b3770003', '2', '你好啊兄弟', '1617929135898', '2', '1617929135898', '3', '20', '3');
INSERT INTO `privatemessage_3` VALUES ('f8a68988608a4cce9071f587c42a6cdb0003', '2', '你好啊，可以交个朋友吗', '1614149056826', '3', '1614148965727', '2', '20', '3');

-- ----------------------------
-- Table structure for `pv`
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv` (
  `id` varchar(32) NOT NULL,
  `browserName` varchar(255) DEFAULT NULL,
  `deviceType` varchar(255) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `operatingSystem` varchar(255) DEFAULT NULL,
  `referrer` longtext,
  `times` datetime DEFAULT NULL,
  `url` longtext,
  PRIMARY KEY (`id`),
  KEY `pv_1_idx` (`times`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of pv
-- ----------------------------
INSERT INTO `pv` VALUES ('0011ddfa9df14ea496d8a588ee1cc0c7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2021-04-03 13:58:14', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('005fb833a6ed45bca1c25a097c0e1fdb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tim', '2021-02-24 14:42:34', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('0062ce422eca44bfb7a51aab524363e8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:17:17', 'http://localhost:8081/null?topicId=11');
INSERT INTO `pv` VALUES ('008f1563fc6843b4a24cd9677fb3d371', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317794071180', '2020-03-29 14:25:49', 'http://localhost:8081/askList?questionTagId=32317952481172');
INSERT INTO `pv` VALUES ('00f03e12b76d4e4a804ae993b4a9a8e2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-08 22:45:35', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('01348d78f3954e8fa2d8ebc6eceef5d3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:06:59', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('0147facd2b8f435094723f9b6a4bac31', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:42:17', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('0161b4b81ce9439fa1a1e250aeb3ec7d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-20 17:13:36', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('017d9cc7ecaa448088aee8da6c9963c9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-24 16:26:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('017dd3fbb16a4583b664ffcc87ae9273', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 00:37:40', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('01a95b21d5d146199c34a4861be5b057', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 17:13:22', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('01cf67fbf2ee43d9be6230f6bff812d7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL3ByaXZhdGVNZXNzYWdlQ2hhdExpc3Q_ZnJpZW5kVXNlck5hbWU9dGlt', '2021-04-09 08:46:37', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('02361bffde7746eebbf7b1ffb6349e1d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=6', '2021-03-20 17:25:19', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('024cc23b6a894d71bab147c75b7ee9d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-05 12:39:02', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('02a4ba5812614ee99b40db12d7b02ef5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/membershipCardOrderList', '2021-03-31 23:18:34', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('02a58ba053a2485d898cc1012e3c1f8b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-04-03 13:57:55', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('02b858dd2791492ca74a7fd58b4d7f67', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%BA%91%E9%A1%B6%E4%B9%8B%E5%BC%88', '2021-03-20 18:25:23', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('02e74a8e85c44d9c8ce9424dd0d31715', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-31 23:18:49', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('02f4210cb3514930a5e9565b0fe8b0e9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-20 12:07:26', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('0318168d2b7e4dbdb973d3f4af3f2e6b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-09 08:44:38', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('03a2369754284033a2edd2e8737292fe', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:32:18', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('03a3a2862b3741d8bb517a6352c4739f', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 00:29:28', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0404c662574e4eada9e86e4e49d892ab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2021-03-31 23:18:21', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('0424b26577da44bd849572fb65459d2a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:15', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('043951ff22dd42778825dc5bd06e4cbb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317791871179', '2020-03-29 14:25:48', 'http://localhost:8081/askList?questionTagId=32317794071180');
INSERT INTO `pv` VALUES ('043cbdbc0c39472b9dd52cff8b285685', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('04b1279cfbf24cf396fe376b6e492bfb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:26', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('04e49016db67479b99ce90172fee096a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-03 13:58:41', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('05229739879f4b0a89fdaa8e3018b46f', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-01 13:29:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('05418e45b5be416ab2568af8979c880b', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2020-04-01 19:21:53', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('058eb8f5a94042159ad796b5cb72c591', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318005581175', '2021-02-24 16:28:34', 'http://localhost:8081/askList?questionTagId=32317954181173');
INSERT INTO `pv` VALUES ('05bee861a24c49bd8820f10ce1167900', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:08:40', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('05f22029ad5a4bdc91fdcb95f54752ce', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-02-24 14:44:07', 'http://localhost:8081/user/control/home?userName=tom');
INSERT INTO `pv` VALUES ('0643ba16bb5c4440a8bded1631be7abb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2020-03-29 14:26:57', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('065a2905e621410bab350b80beb4dbfd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-20 12:06:14', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('0687525d7ff54ff08035667868b4719b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-08 22:45:12', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('0687869019764bbba02dbd988895b84b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:33', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('06f923a26dc34ae28351a74787388ed5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317749526769', '2021-02-24 13:47:50', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('06fa9ef021c14d36bca8ca80eddd2764', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:58:08', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('070a0daa813541379deebc95edb45651', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 23:42:15', 'http://localhost:8081/register?jumpUrl=');
INSERT INTO `pv` VALUES ('073bd11f3ff7440bbda1616790b531f2', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/payment?paymentModule=5', '2020-04-01 19:18:16', 'http://localhost:8081/user/control/payment?paymentModule=5');
INSERT INTO `pv` VALUES ('07438cf049934736b6ea6836b3a3a147', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:48:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0774279d933f4c9d9046a477f1570304', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-02-24 16:26:48', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('077a6efbe1474824ae09ddfcfe220623', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-20 12:07:35', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('078d26d343e6467ba0cb1dbe67d57462', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-03-29 14:28:11', 'http://localhost:8081/user/control/answerList');
INSERT INTO `pv` VALUES ('0798a356387743eb9ff395dd28e57a2f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:07:46', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('07ca9bfe76df42f7b86145f6a319186a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:11:52', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('0836a1a349d84d8680e1a835c151d67a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=4', '2020-03-29 14:30:46', 'http://localhost:8081/question?questionId=4');
INSERT INTO `pv` VALUES ('0896a5e3313446f9a7236a1b300c826d', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-04-01 19:16:58', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('08ad8fa1a7b047a8b8d0977526d9a365', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2020-03-29 13:24:21', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('08b8e3f8a1034e0a97998369aebe028c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:48:40', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('08cd704815bc472cbe86e6ca49bb2726', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-31 23:11:46', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('092ae73bc74b4a0aa9b4b892c920805c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-01 13:32:43', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('094286f643634242ab6af0bcafabc80b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=8', '2021-03-20 18:22:54', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('0969470f8277467db0b7e2258302c617', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 23:16:48', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('09b9e34039264a6fa1d4f99aa31c3c06', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 23:35:53', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0a03142bc3c849ff930f57ee12c1ea62', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:48:49', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('0a03fe2359824703888c8c2db8b092f8', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 23:35:49', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0a040ac9c0214287abdf93ea0ff31dc0', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 22:01:34', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('0a1d1143ca7943ba86ebf88703424f1b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 14:43:25', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('0a5dd2c8ea0a4dcf9c5dc8468e483610', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2020-03-29 00:43:34', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('0a77b553d8634edf8d1b7549395792e8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-08 22:45:02', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('0aaabf0d0de647959628fc8ef81aa44d', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 12:38:40', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0af2a7b397b048c1a00b4488ee2aa998', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-24 16:26:47', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('0afdc372e95b4d0082ea908f199c8de9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:41:54', 'http://localhost:8081/question?questionId=6');
INSERT INTO `pv` VALUES ('0b1d7f38b62f4a0e8568a731a8d42f41', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:50:42', 'http://localhost:8081/search?keyword=%E7%9D%A1');
INSERT INTO `pv` VALUES ('0b2739b3a2e44cfaa57df3b0d8e07425', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:38:12', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('0b2ed8c3347a49b4becb14604c8a5402', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:38:12', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('0b33f080d1c94fed90114129eef3a9e9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2021-03-31 23:18:22', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('0b5ee220644d4330bdec87fd4c8a2e56', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:36:24', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('0bd42ce128f34841843e5457e42392ba', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 00:41:44', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('0bf61a12bf5346e19816ee1ec31708cf', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-09 08:39:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0bfcd9223e02451d90e522d86861731f', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 22:40:05', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0c272cc92381482d9ce1ccb8b5c436ad', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:35:36', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('0c33460a2acf43ca8322ff2e154551e0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:32', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('0c3b821de001459b85810f3e9f1eea03', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=xiaohong', '2020-04-01 19:24:15', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('0c3fa39a417147abb8683104ece01069', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16&commentId=7', '2021-04-03 15:00:07', 'http://localhost:8081/thread?topicId=16&commentId=7');
INSERT INTO `pv` VALUES ('0c66e2bd97564cfb83517cb10879cac5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:34:30', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('0c9aed1fc91a4dab9591bc809b3f4ae2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=3', '2021-02-20 12:08:28', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA');
INSERT INTO `pv` VALUES ('0cb5f9bd05ec48b3b628deebc57c3c55', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:10:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0cd04f94d14342e088e84b02eab25d8f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 13:47:47', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('0ce808ea246a4f20bfeaf1ea5a89fb47', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11&commentId=4', '2021-03-20 18:23:33', 'http://localhost:8081/thread?topicId=11&commentId=4');
INSERT INTO `pv` VALUES ('0d194a057c4c438ebed7c99d4015a11b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-03-29 14:28:18', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('0d96c6d7513c498299248ee38574c13f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:49:40', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('0deca671a48b47e28ed992ff3a487c69', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:36:35', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('0e861f765f8340c1b9ec52089e05ab0d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2020-03-29 13:44:23', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('0ec5c4a939024169a6f272a1de500fbc', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 00:54:55', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0ee46bd7085e492a9de9a75814808a3b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:43:51', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('0f669033c57e42eba4790284f5e5741d', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-04-01 19:21:55', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('0f855c0de8eb42528a9d7602544a916c', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 21:39:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('0fb674722e084257b871e2c9e958851c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-20 12:07:13', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('102ec49d0a0e46ad85ec9fccbe395628', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:29', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('107576e23ff942b5b26686ab20e17861', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:48', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('11a52d4fc93944be943c331fc5c53973', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 15:00:34', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('11b23d11f2ad40118a5f0532dad97395', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:03:45', 'http://localhost:8081/askList?questionTagId=32317791871179');
INSERT INTO `pv` VALUES ('122405818f1f46a2aa9c47d7b6bf2d87', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-24 13:45:49', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('12489205bfd44017a5ee6031e9008790', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-28 23:42:32', 'http://localhost:8081/askList?filterCondition=20');
INSERT INTO `pv` VALUES ('124acfa535664208b9c0ef89be2d5e49', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318034681186', '2021-03-20 17:14:06', 'http://localhost:8081/askList?filterCondition=20');
INSERT INTO `pv` VALUES ('124c5e8bef8e4d5a88910219cbc798b6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/findPassWord/step1', '2021-02-24 13:49:40', 'http://localhost:8081/login?jumpUrl=ZmluZFBhc3NXb3JkL3N0ZXAx');
INSERT INTO `pv` VALUES ('12ab0373dcb043d68cdec4b79497cb1a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:38:10', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('12b4ffd5f14d46419958ea02ecab2184', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 23:35:48', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('12e2f262385a4738a7c73284347825c9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-04-08 23:06:07', 'http://localhost:8081/thread?topicId=19&commentId=8');
INSERT INTO `pv` VALUES ('12e42bb724b642c19af64fc09919ee83', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 13:24:16', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('131a51e77c1141939090198d51c1e357', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:28:07', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('133870bebba6490eb052916494550610', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 14:02:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('13476b3a876b41ebac0f9b970944313f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=6&answerId=4', '2021-02-20 12:07:52', 'http://localhost:8081/answer_reply.htm?&answerId=4&timestamp=1613794072168');
INSERT INTO `pv` VALUES ('135cb7fdd9e04cfea93473d9b382e4c2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=6', '2021-02-24 14:42:32', 'http://localhost:8081/user/control/home?userName=tim');
INSERT INTO `pv` VALUES ('137e55dd7c544bad810c1f3d0698080f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-02-24 16:28:04', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('13a077a309a243419aeede5ac32cca34', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tom', '2020-03-29 14:30:27', 'http://localhost:8081/question?questionId=4');
INSERT INTO `pv` VALUES ('13fd7ebc803d4fbeb5d8df678f27c100', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-31 23:34:32', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('1428a6ce900b495392fa88e092dc7073', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-28 23:49:06', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('15676bef4b6f4c3b9d711fd8d01fb92c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tim', '2021-02-20 12:07:48', 'http://localhost:8081/question?questionId=6&answerId=4');
INSERT INTO `pv` VALUES ('157b588c61ab42528f54791e498a49ef', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:43:43', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('15d4f1e15f9347f79ab691e27d34d2cc', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-08 22:40:46', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('15ed8b50c0154c4a9f4f4615c4c69c91', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 22:48:48', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('160223df82ca423d8af95caac199e38a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2020-03-29 14:26:02', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('1627bed6a4b1421a9a0380322a5c3ae9', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 23:05:22', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('1661b4c2ea444edfa27d76371b03ae8e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:32:15', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('1688d242d2814f8d996a507685d40a5f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:18:11', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('16be2027f9a448dc9381e107e1610427', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=4', '2020-03-29 14:32:49', 'http://localhost:8081/question?questionId=5');
INSERT INTO `pv` VALUES ('16f47343aa1749a1aedde145c3adbfea', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2021-03-31 23:18:21', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('170ed5b30a1b47998342989857a43708', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-20 12:06:08', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1721a9d4cf7f43968a55ddf51bc4d52a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 16:28:27', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1732be5ba29f4053add1eaa4c0b09b16', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 00:50:32', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('17462a794b5244daaafe95d796cc6cef', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 17:13:13', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('17b7a0e34de84d3bb3bbfcbe6e59ff91', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-04-09 08:45:39', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('17dd5d78074e4313a142194b5e8023d2', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/realNameAuthentication', '2020-03-29 00:39:43', 'http://localhost:8081/user/control/phoneBinding');
INSERT INTO `pv` VALUES ('18303a61500740d6b7156931f75488ce', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:34:43', 'http://localhost:8081/null?topicId=14');
INSERT INTO `pv` VALUES ('18386340f0e34fbfb257ea8c843ff9ae', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-09 08:47:17', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('18cab5eb08ab450082b852842606f081', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:01:44', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('18d3afe7aef64cdcb42dc91b5085ab31', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:02:33', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('18fa6816681840e39d9faf5702c624b7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:34:54', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('18fdabf83bf44f9d87715a27b3cfc171', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2021-04-09 08:47:56', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('191158a260c94cc38ea25cd676662550', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-02-24 14:42:25', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('19875978923d4402a948216d31d5948c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=40', '2020-03-28 23:47:43', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('19974ca88d134da08d47f852d02a4903', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-04-08 23:04:58', 'http://localhost:8081/thread?topicId=19&commentId=8');
INSERT INTO `pv` VALUES ('19ade2d46d1048f0a0152460df6cdeb5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:01:39', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('19bfc39f2c3b4fc6880a9de6d73bb3a7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:48:30', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('19c135f9492b4b51a232621915bb633d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2020-03-29 14:07:15', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('1a2c696730484f2595cc51bb7ee909a8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 01:24:59', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('1a2fad1958694f74a8594ae3f1849816', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:43:45', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1a40575829b64a48ad4fce62436ef02f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 23:02:34', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('1a56ea75d0364924bf1f448ae0377e66', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:48:03', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('1a9ff8dde4f5476d8f4b0cc445d63057', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-20 12:05:18', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('1aefd923648f455dac0870da128ee2cc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-01 13:32:01', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('1b32e4feb5a94f04afb8c6100e4547ab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2021-02-24 14:45:02', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('1b4ae6da9d5f455fadc07dd110ea01fa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tom', '2021-04-03 13:57:47', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('1b6e22be34894d728db5e82e8ecdbff3', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 22:59:15', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('1bc3741241ba4e5397f2666885b5cc79', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:16:31', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('1beed2afbf0648898ae2b347c48305e0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-02-24 14:38:54', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('1c0b2b6d10ad47d9860039d609d01323', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:04', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('1c15b44cb8924b0ba1c62a150397472f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('1c677feab3dc45a7951aa76a2176e474', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-08 22:48:22', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('1c77b71efda24c288085c5e65a2b809a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:51:19', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('1c9168a17f0c452f9a2f621ef0081cbc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 16:27:23', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('1cd5ae4258584ab2bc0ced19fcdc2d90', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:43:17', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('1ce03be577614972bb8a195ec6f23ef4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:38:11', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('1cf10e0797fe4a45a75acab7ccbdac55', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-31 23:18:14', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('1d3fc66227f641d9ac16980c3c360eca', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-24 16:27:32', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1d46efb6e77f4c4289f7cd05c6d56810', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:37:47', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1d6a392c00f24999901b14459b69d1c0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16&commentId=7', '2021-04-03 15:00:16', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('1d6d061f1e2142f08308d63972d64a73', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-24 16:26:46', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('1d7fc21d518e42e2a1002f8cbb6277ad', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-04-01 00:01:29', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('1dde43a65a8d4a1ca4b7a96a98142145', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2020-03-29 14:32:17', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('1e05ec60e79a4c1b9bb669313f6d6371', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-05 22:40:06', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('1e1522418a734521af08b7880b4a795a', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-01 13:31:32', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('1e93c121b7d0443b8fc932e1b62f6700', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:41:06', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('1e9b5b063705463e83683d1b3e5fc5d6', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerList', '2020-04-01 19:22:37', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('1edd8d7af3534736babaa28f3d7d268f', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2020-04-01 19:22:47', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('1eddeaf3aa054826be83829bbfdc16df', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-08 22:43:01', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('1ef0d710669f489cb25ac1b77b9d42a4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:16:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('1f085791aae24ad6aa9e2103de0b563c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:25:39', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1f4cbb6ee0d44a65b96465be19e2893e', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=xiaohong', '2020-04-01 19:23:31', 'http://localhost:8081/user/control/home?userName=xiaohong');
INSERT INTO `pv` VALUES ('1f89169e8c0749ff98764204d7e3964d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:31', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1fa14c9e06e64edbb9f332b79be9c2f5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:13:56', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('1fd375f664cb42a0bc33b1b5a617cb4e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 00:38:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('2002699cd4d848eca7a790a9be076b3a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:35:28', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('2090a931c9744006acb673bf784986b6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 23:03:22', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('20b98c61bf1144f3a2f075886599c834', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 14:43:30', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('2126c05d725b4e989091e4fe8c844241', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=cXVlc3Rpb24_cXVlc3Rpb25JZD03', '2021-02-24 16:27:13', 'http://localhost:8081/question?questionId=7');
INSERT INTO `pv` VALUES ('2129f8511b754d0fb1eefd2db44a1f51', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-03 13:58:41', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('2135b487096f47ac8146ac3924aac72a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:41:53', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('2136a1ab15284c3f837dde9e09b92d9c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:44:42', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('213eacb826484a47b84f92b20271fd87', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-03 13:45:08', 'http://localhost:8081/user/control/systemNotifyList');
INSERT INTO `pv` VALUES ('217c0b0eee2042d284ca277bd23dc3f3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 01:26:00', 'http://localhost:8081/askList?filterCondition=20');
INSERT INTO `pv` VALUES ('21e30a23df1741948c3acc90bc0ea4d2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2021-02-24 16:26:49', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('22199d4f22144240b696aeff3f83eb24', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:03:08', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('22592dc105b248e7ab2d9886ac328839', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:43:36', 'http://localhost:8081/thread?topicId=8');
INSERT INTO `pv` VALUES ('22638f6468774300acf16256c29d700a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:40', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('227db1da90b245f78c8cced3167bdf56', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2020-03-29 14:21:25', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('227eb66ea4a14471b14be2d81263343b', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 21:39:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('22a1fa9772cc4df78b5381c9220554ef', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-20 12:01:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('22feda40df2a4cf686f53c60103d39a8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-03-20 17:13:20', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('23ae4efa5c8c4669bb57ff3974d61b62', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 15:00:37', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('23b2dae8240042e2a2be668b90ee48ae', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerReplyList', '2020-03-29 00:43:30', 'http://localhost:8081/user/control/answerList');
INSERT INTO `pv` VALUES ('23d41985f60c4320919ab1b74ab22814', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:37:27', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('23e434f5ae634dbf8a9c456e7724bcb1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:25:28', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('242dfe35cf2b46dd8da6409c1742cec7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:10:34', 'http://localhost:8081/register?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('24380849ee434c389cd69a28c773ff68', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:40:52', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('245d5523aac14d89996ad4f152648a01', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-28 22:19:45', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('24719bce14ee4abc8935f15aa677b095', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-03-31 23:08:34', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('24d84124f5d24a2d8ffaf254947dab96', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 23:48:52', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('25079374c260414ca14ee91d347aa5e8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerList', '2021-04-03 13:58:11', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('25204e71a2b34d199b260d8d7c5d0267', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-04-01 19:21:50', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('25329a1f709b4483ac5830dec07facf5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:40:33', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('2559078d51b6404fafb9b487c8776269', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 23:49:09', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('255d5bf77b4b4453826ad13f775eb0ee', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-03-29 13:44:24', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('258cc32271bc4336aee9b5660aa800f9', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/membershipCardOrderList', '2020-04-01 19:22:55', 'http://localhost:8081/user/control/systemNotifyList');
INSERT INTO `pv` VALUES ('25a17339022f4127a9e8f87555c527c7', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-04-01 19:22:25', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('25bb5d8f373846eeb4ca7fd3cf7d26b1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=4', '2020-03-29 14:32:37', 'http://localhost:8081/user/appendQuestion.htm?questionId=4&timestamp=1585463556798');
INSERT INTO `pv` VALUES ('25e49fe1679d4252a4e94441063280f6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-04-08 22:44:59', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('25eff88eb7844d03beb784c5cbd91489', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 16:28:31', 'http://localhost:8081/askList?questionTagId=32318046281193');
INSERT INTO `pv` VALUES ('25f4ff791908491d8b30505c7a22e013', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 13:24:15', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('26081b3c6f9d49ed957d76ec188321f0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-03-20 18:10:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('262802d635e344ca8044fe630d76ab67', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 23:16:52', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('266bee2bc4a64e529b49f392e9cab122', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-04-01 19:23:24', 'http://localhost:8081/user/control/home?userName=xiaohong');
INSERT INTO `pv` VALUES ('268ec1059dea4c54b43e6983e121a626', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:49:35', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('26af313265ca47e3a11cf61e0d6c0759', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-24 13:47:39', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('26ea97d6f5f844cfb2f76636e54516b1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-20 18:23:50', 'http://localhost:8081/user/control/editUser');
INSERT INTO `pv` VALUES ('271fd0289c4b4f28bb41f19d0517f449', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2021-03-20 18:19:40', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('2729e02fe8ad40ceab407f89e1899a95', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2021-02-24 13:47:49', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('280b56b79d2e4e50b891d14fc700883c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-02-24 16:28:24', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('282d907ad4e445a18a20647fb580b64c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:40:31', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('288da800c41f4192af487a0769dab27e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:47:53', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('28aaa8e98c3d463cac4cb920e9a477d5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:50:19', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('28d8ecdc841d429b9471256755cb5a81', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:42:38', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('28f3f8e6a8f845469bbe87893fc36703', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-03-29 14:35:38', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('298c8bc07188473dbaeaffcd19306170', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:23:19', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzEwNDI2NzYx');
INSERT INTO `pv` VALUES ('29fe033a02be4e51a8b0a425ab6d39d6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 01:46:53', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('2a0aa605f9b24cff951d3bb752ff8f60', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:06:52', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('2a235bab198148ca94be7a41e933243a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:48:51', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('2a42de07c3cf48db9e5f250230b222d4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=', '2020-03-29 00:41:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('2a43699edf984297a852ebf1fd011781', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:40:30', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('2a5eb670c9df4051b816dc7991b0920f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:07:13', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('2a612c1600c345bbbdfc34b0f2e29da4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:42:22', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('2a77cfbc2e584e08bf10e5789f0511f8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317791871179', '2021-02-20 12:03:47', 'http://localhost:8081/askList?questionTagId=32317794071180');
INSERT INTO `pv` VALUES ('2ad0e0f71a9441fdbfcbd4942060c246', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:50:24', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('2af34f2f2dfa442f836e1e4274e86fe9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:02:33', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('2b3cf0b83f9649b3ab0afe0c1f5a47d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14&commentId=5', '2021-04-03 13:57:19', 'http://localhost:8081/comment_quote.htm?&commentId=5&timestamp=1617429439164');
INSERT INTO `pv` VALUES ('2b4cd227fe5d45b0b6148e3d52fc9d49', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-20 18:23:01', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('2b7b1c21306449199e1e4dca01ef1d0a', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-04-01 19:22:24', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('2b8de41675e54203af0e5385a3069053', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:40:54', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('2bbac2df30254b459724b397b09c644f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318005581175', '2020-03-29 14:26:00', 'http://localhost:8081/askList?questionTagId=32317954181173');
INSERT INTO `pv` VALUES ('2be3f6b80bfd45f18409c1fda93fffc1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:22:37', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('2c0f375b43c24e85892ad03fd7372981', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-03-20 17:13:44', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('2c385a8c79744305a2ff16649fd908d4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU_dXNlck5hbWU9dGlt', '2021-03-31 23:44:56', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('2c47612194114ed897d550f390019421', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:44:22', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTQ');
INSERT INTO `pv` VALUES ('2c741406b6b94eaa9a5af3d1939c3faa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:44:40', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('2cc7caae220b4960878f062a697e6c7e', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 14:02:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('2cdec8dbcbbd4e9a8c05d63dbd2d9abe', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2020-04-01 19:22:58', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('2cf4500d15364ffc96923d656084be35', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:13:53', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('2d55ad1f10654c9ebce2c6415565ce81', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:34:29', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('2d5b90fed7844505aae8317131993965', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:57:59', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('2e10f2b21c1a40078b1a010a0a180b45', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:43:30', 'http://localhost:8081/question?questionId=7');
INSERT INTO `pv` VALUES ('2e26fbffaf1e4531a39ba9062e387d09', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2021-03-20 18:22:15', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('2e53de35aa7b46279786f74c0253b7aa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-24 14:45:00', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('2e882f6663954ea08b4ed8d480829e98', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-04-09 08:45:56', 'http://localhost:8081/user/control/home?userName=tim');
INSERT INTO `pv` VALUES ('2e8b080a9a7942e0b4ccac5c55c5e16d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-03-20 17:15:19', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('2ed701db61b34e3ebfebda456fdbd34f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=7', '2021-02-24 16:27:21', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('2f0fc955319746b2841407ebe3899f57', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-04-01 19:21:56', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('2f126d86c54340b69151389d434ea552', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=xiaohong', '2020-04-01 19:24:12', 'http://localhost:8081/user/control/home?userName=xiaohong');
INSERT INTO `pv` VALUES ('2f3a8b279035431f83c986cbf16d1fbe', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:51:00', 'http://localhost:8081/search?keyword=%E4%B8%8D');
INSERT INTO `pv` VALUES ('2f4ceca286034033b5dab663b1e51879', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=40', '2020-03-28 23:42:35', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('2f905fd90e434c78aac9b246a5eb2de5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:05:31', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA');
INSERT INTO `pv` VALUES ('2fd2692b6360475a8eeddc9a017b1844', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:26', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('2ffda5097ec548bda75dc8d685aa786b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-31 23:11:49', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('302b3a47e4e140f4b262e75d615f4d70', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-09 08:44:21', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('303d958c1066422ba8e1fc58dc598c70', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=40', '2021-03-20 17:14:08', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('30f02cf85f2a46fd971740bd28df7d2c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:27:15', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('31029ff544284e8f89d8e68d46f5dc0b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-03-20 17:15:20', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('31d6c38462524f4f9a32bae69f0dd4c5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2020-03-29 14:28:21', 'http://localhost:8081/user/control/systemNotifyList');
INSERT INTO `pv` VALUES ('31fbbfe93a5f494c8c02534f124d6f40', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:50:28', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('325dbe33e3fb414bbd978e331ddbf8aa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-04-08 22:46:00', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('32ccb416e6fe4b5fb23e98452c0efefe', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2021-03-20 18:22:18', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('32da3ed495834c33b0e9b18adabbf991', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:37:36', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('33482425b9ef4797ba9d0e05fffe57b5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:39:52', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('33c7eb992f2342e4b739c109cf2c816d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 01:47:01', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('33d865157f784f699b2331842dba85f8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:06:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('34cda9b7160d4bfcb4f653d9199c97fe', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-20 17:13:36', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('3511f7377f8d4bdb97000e8287d874d6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL3ByaXZhdGVNZXNzYWdlQ2hhdExpc3Q_ZnJpZW5kVXNlck5hbWU9dGlt', '2021-02-24 16:28:01', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('3576b0df69c74896b2f5cfec3aeedcd3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 13:58:37', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('35fce3ec4c42495e8f92199e25bfc167', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14&commentId=5', '2021-04-03 13:57:37', 'http://localhost:8081/user/control/home?userName=tom');
INSERT INTO `pv` VALUES ('3656312347a54027a15a90607940109f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-02-24 14:42:48', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('372b75290be947908d378540e25e9347', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-04-01 19:21:54', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('3733033e527743d08a6fce1c5e0030b4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 13:24:36', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('3747ccf72a3a4691927f20251da46e31', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-02-24 14:38:56', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('37635c2f86744d7a836e00521196e9e7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-04-03 13:43:45', 'http://localhost:8081/user/control/topicUnhideList?topicId=14');
INSERT INTO `pv` VALUES ('37cbf253f44849668d26d2653d76da5f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:38:08', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('37cea2323f584eb09244d6327b66492c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 22:23:29', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1hVzVrWlhn');
INSERT INTO `pv` VALUES ('380f19c8b0b64189a0c50e034c082469', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 01:26:20', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('381de64c0200470598670c40376bea3f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2020-03-29 14:21:24', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('382c93af97ee442eb9adf7597b861d3d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 13:58:00', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('38694f587a824f8db18bdf9c2a9aa9d5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 13:24:14', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('3945de22c62e4774a4b4a4cad1dba59a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-03-29 13:24:10', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('397451a2f01d42529f21851f36793005', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:43:47', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('39790396793c4f65957c289761c2ab1d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-24 16:27:30', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('3995fdf22cea494db847f0a1f7dc6abb', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 12:15:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('39c4668603df49d182fb69177773230b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tom', '2021-02-24 14:44:00', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('39c84a3e22054b759627f9516681aa9d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-03 13:43:10', 'http://localhost:8081/user/editTopic?topicId=14');
INSERT INTO `pv` VALUES ('3a3f6d95d9ae419d873a031d8be71235', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:49:35', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('3a8efec5bcff43c4a4445f29a7a7e0b6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:33', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('3aa00ae73167434ba23b00e1366d0206', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=8', '2021-03-20 17:54:21', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('3aa306e5eade40f3a239e1cdc2146b34', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:41:01', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('3ab77915918548f4b9109ee1016d36eb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-04-05 12:39:08', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('3aedfb1c72534775b6257054af987724', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:07:57', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('3b0e05f57ef34e498cdca4a06c7b7e67', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 23:36:09', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('3b3202da78a246f2817ffffaf9c70c61', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:18:09', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('3b323225843a4e34b8b69e319a5d31ae', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2020-03-29 00:43:28', 'http://localhost:8081/user/control/answerReplyList');
INSERT INTO `pv` VALUES ('3b6e0617214249ac8b87c16a492b258a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E7%9D%A1', '2020-03-29 00:44:30', 'http://localhost:8081/search?keyword=%E4%B8%BA%E4%BB%80%E4%B9%88%E8%BF%98%E4%B8%8D%E7%9D%A1');
INSERT INTO `pv` VALUES ('3b77cd79a88949a099ffa427daab85e3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:34:55', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('3b92166cb6d4419ea9b2afa1230fe698', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-24 16:26:51', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('3b9d4ea04957420d96e22828ef654518', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-04-09 08:47:04', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('3bf2941636fb4b849bc1563e746516aa', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerList', '2020-03-29 14:28:12', 'http://localhost:8081/user/control/answerReplyList');
INSERT INTO `pv` VALUES ('3bf9f4911e9244119234c1c41eee8394', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 22:23:22', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1hVzVrWlhn');
INSERT INTO `pv` VALUES ('3c63b839d61c4ac4b098dfe2a011f76e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-01 00:01:33', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('3c649b1cf49f4d358f231d04cb836c8d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('3c88d8e2f56142a2b83fda8bf2cc4444', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:21:38', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('3d93c6ad4b1c475ca4009070fce25179', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:41:00', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('3da6e24acb1c4e70bb67352e98a1262a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTQ', '2021-03-31 23:42:36', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('3db3e868dd9b44bbb069418603870bca', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 16:27:30', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('3dfe01ee5773432599c9ea501bc1340a', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-05 12:38:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('3e3f5aaacd5240c290c927671f01cca7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:19:35', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('3e459e5bca844baaa9bb34ec0bb532d3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:36:31', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('3e69f62694574fa9a0b4b1b0c1526f22', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:36:32', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('3e6d8d6d3c4f49928cfe999776c7bbdb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 13:44:21', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('3e732fa94da54e8bb3143f6d20fbabab', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2020-04-01 19:22:31', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('3e785099264f499282af1880dc860e4c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 01:31:06', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('3e8a28500d7d4e56985ae0103c3adecc', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:16:57', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('3ef38cd84e674642b48879efc672faf3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:35', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('3fdb0b108f4941968501425cc4eedb64', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-24 14:44:59', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('4049ede2b03843cab523c2f14beb0cee', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 01:16:11', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('404a0ae090bf479c9e066fa19bb42ddc', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-04-01 19:20:42', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('40536e98696d4087a5c4b08588e052f4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:47:09', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('40b456312e84408bb86f0570da8be5e4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2020-03-29 14:07:07', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('40c435d4aff34fe0bbc6d2b470d60de0', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2020-03-29 14:26:54', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('40eb028920be457d90429c5b6801ab80', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU', '2020-03-29 00:43:41', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('411547e9492a4e11a7bbfcfd191041bc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('411b6fcffdfb454ebb6e11700c1a70d2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 18:19:38', 'http://localhost:8081/askList?questionTagId=32317954181173');
INSERT INTO `pv` VALUES ('4157c1488bd44cd38f28e7352bc8e429', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2020-03-29 14:28:17', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('417126218986452ab1494c258ae9c7e8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-20 12:03:41', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('417acefacb164711a4ea21e7e238ea22', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:31:54', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA');
INSERT INTO `pv` VALUES ('423cb75d7c9b485e9ce83d7b993d8ae3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-03 14:41:01', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('429067af39584b9a83babaf77d0d474a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:44:03', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('429ad6e07f0b48409da995f6fc68d1ae', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-24 14:41:41', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('42d814fabe504457b4663f0272b2b15c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-04-07 20:38:17', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1hVzVrWlhn');
INSERT INTO `pv` VALUES ('42f77ba417984a5ebd00c4ca5390a905', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/editTopic?topicId=8', '2021-03-20 17:54:59', 'http://localhost:8081/thread?topicId=8');
INSERT INTO `pv` VALUES ('435e17eeb1974f0fbd046a438ec47951', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:39:22', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('43683d4c56284efc9f801f88915b94f1', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-04-01 19:21:59', 'http://localhost:8081/user/control/home?userName=xiaohong');
INSERT INTO `pv` VALUES ('43902deae2274b918126d07d2152ddd0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:41:05', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('439389b9111e4da5a13f10197b47bb4a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:52:05', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('43f09476ad6440f2b9a2e2f34d6f60bd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-03-20 18:24:59', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('440b867920be4a92bca632d7ac9b28b9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-03-29 00:43:32', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('442d5093f59a4a359903b3418deaa304', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:48:47', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('443843bbb08b4bfeb0f86dc75eed0b96', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-24 16:26:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('443edd3373d44af3a208937c620fa152', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=40', '2020-03-29 01:26:02', 'http://localhost:8081/askList?filterCondition=50');
INSERT INTO `pv` VALUES ('44589faf641f43b2bbdcd60d80c3a09d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:52:09', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('448b4fa51bec4ec28602135214915277', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:27:18', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('44ab01220e44430997e4797fbcaa3407', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 16:26:52', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('45667db895a3467a9b8aea32bb4a740a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E5%8F%AA', '2020-03-29 00:52:19', 'http://localhost:8081/search?keyword=%E4%BB%8E%E8%BD%A6');
INSERT INTO `pv` VALUES ('456c82db7c404e349c81f850a599bd06', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2020-03-29 14:32:14', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('45704e41117646048836c9bc187dd7b4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:34:03', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('4591f711d68a4881b9d36edac9227c59', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 16:28:28', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('45ad1941533843fd9342ec1a05e12d17', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19&commentId=8', '2021-04-08 23:05:47', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTkmY29tbWVudElkPTg');
INSERT INTO `pv` VALUES ('45ee825838ec4c22a28edc3ec3587ed1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:40:37', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA');
INSERT INTO `pv` VALUES ('45f7457280da4504a0236f3f171faa2a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerReplyList', '2021-04-03 14:01:17', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('45fb88c1db1f4162a4e99f9db726a7e1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=10', '2021-03-20 18:14:50', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('468246408a034fc28357714e3f6e3b64', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicUnhideList?topicId=14', '2021-04-03 13:43:50', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('46c513f9aa104fdabccdc2e1dab93215', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 13:47:42', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('46dc3450f02e44698aead143dae9f83a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:34:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('46fbbd66c7774f6a9feb6193aebcf39c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16', '2021-04-08 22:49:09', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTY');
INSERT INTO `pv` VALUES ('47312be4b57a4adf9bd2ff2971fa5669', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16&commentId=7', '2021-04-03 14:59:54', 'http://localhost:8081/thread?topicId=16&commentId=7');
INSERT INTO `pv` VALUES ('4744ef0bd6394cc5aeebbedd4d94b114', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2021-02-24 14:39:47', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('476b09eb2cb0411e8669f84cd659c7b9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-03-29 13:24:11', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('47af2d97cf5540efa752ea30b21baca7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:13:41', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('47df71d26ed74274bbaf7dba57cd1c7c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:02:36', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('48303f7e37fa421ab47963fe876bb769', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 23:02:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4842ca0b653e43698bf2d79ca8a9c608', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-04-01 19:22:32', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('485052e7ddb642f7aeb596ba128ef32f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:38:06', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('48e32871c0e44968bc179da036f03f33', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:34:33', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('491ad913c2564207b8ca058bf63f7a7c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-02-24 14:45:01', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('491babe5d0154ba6900fe67001e6d90f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-03-29 00:43:59', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('495b3990bd294342a7968ceb684e0d30', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 14:37:09', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('4994840267d54a2585ef69f3ceec5ded', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-04-01 19:22:22', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('4a748c7794674498bbc97b840d71a228', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 23:03:52', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('4a9307051e15447192a99af971348024', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317952481172', '2020-03-29 14:25:49', 'http://localhost:8081/askList?questionTagId=32317954181173');
INSERT INTO `pv` VALUES ('4a9540a84a0b4d67a2d75bac695b74e5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:34:43', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('4aa4fc682d7b4752bd16200ef841e8be', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:41:49', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('4b2ada2f00ea46ef873786cc9999b619', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA%E4%BB%80%E4%B9%88%E8%BF%98%E4%B8%8D%E7%9D%A1', '2020-03-29 00:44:41', 'http://localhost:8081/search?keyword=%C3%A4%C2%B8%C2%BA%C3%A4%C2%BB%C2%80%C3%A4%C2%B9%C2%88%C3%A8%C2%BF%C2%98%C3%A4%C2%B8%C2%8D%C3%A7%C2%9D%C2%A1');
INSERT INTO `pv` VALUES ('4b6a90241e0a4c6886b0f752b1654570', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-28 23:49:08', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('4bc519ecfc4c4a3191024e6875a55b3e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-02-20 12:06:21', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('4c06e246027f43549d04fba1b48f26dc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-08 22:44:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4c1b5b538b974f3fb5e7b5cc50c672f3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:16:34', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4c4f54116d3548d894080a6ca97f4435', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-01 00:01:32', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('4c5228dcdd4d491ca1b6adf685784240', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2020-03-29 14:06:50', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('4c6185c0fcdc4dc7bf56b1f7b4b98f00', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317749526769', '2020-04-01 19:21:51', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('4c6773fe978748d1a1eb1970f8cc6a7f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTY', '2021-04-03 14:50:51', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('4c98133537f74567b0fa1e427426eb0e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2Zhdm9yaXRlTGlzdA', '2021-04-09 08:45:51', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('4caec6a684c7442b808e405382b217ec', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19&commentId=8', '2021-04-08 23:05:58', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('4cb4d946a0954f1da014917b24dace17', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 21:56:55', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4d14d31a3adc414d9fec14718d5aeafc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:35:28', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('4d4af223185740b8ae3e316851f6abfe', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 19:14:16', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4d888a0150a542a984ea0ecebd0ce738', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:17:57', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4d9c9f0c2d2047ea952f7bd0014ee0d8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14&commentId=5', '2021-04-03 14:41:38', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('4dad90388c9c405face685041ee40cbc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-04-03 14:41:27', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('4de2e172bfd44873b64d50065ae8273b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:43:02', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('4df6bc5730bf4b409faa527052042ee9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-03-29 13:24:19', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('4e29b7434cdc46ea8759c8ed1c9f0a30', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 14:41:34', 'http://localhost:8081/thread?topicId=14&commentId=5');
INSERT INTO `pv` VALUES ('4e600ff86d404a889b4964651187cc46', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:05:46', 'http://localhost:8081/question?questionId=6');
INSERT INTO `pv` VALUES ('4ea5afab24b34e28962eba501bb7761b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 16:26:48', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('4eda8ecab1bb4573846265586723d3a5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:38:10', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('4ee8ceb677eb49f88fc4997668326d32', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:43:17', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4f0bdbf0b16346049f488d6f47e514c2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:50:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('4f103fb14bc2441cad7ce198b0e09252', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2021-04-03 13:58:28', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('4f593f3cb04c49e685b075cd0a7d2d8f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-04-09 08:46:31', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL3ByaXZhdGVNZXNzYWdlQ2hhdExpc3Q_ZnJpZW5kVXNlck5hbWU9dGlt');
INSERT INTO `pv` VALUES ('4f5abf10e07844b080e412d320636748', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=50', '2020-03-29 01:26:03', 'http://localhost:8081/askList?filterCondition=40');
INSERT INTO `pv` VALUES ('4faa56cd71a044deb3caea81c2367108', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:38', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('500d1d2f30124043bb16e6c9a36bcb86', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:41:06', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('505c2bb47f8541a3a8bba6aeb7d5ef03', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 01:16:07', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('506aa7e6a3664d71b898c80e61660c66', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19&commentId=8', '2021-04-08 23:05:41', 'http://localhost:8081/thread?topicId=19&commentId=8');
INSERT INTO `pv` VALUES ('507d9b1a830e408ea3c1306a89ce03da', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-08 22:45:07', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('50e1dfeae16c4f17b149f3006acfa1bf', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:15:18', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('5128f05baa2645218c8aaff01a61bbf6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 14:40:57', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('516512414a3a48468929973c352701ab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-04-09 08:46:16', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('516ca6a3703c4c7e985f03363c212791', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 01:21:59', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('51b4f972b9014689a2969d851a01cef7', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 00:37:37', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('51c662d84141490d9eac5cc3cbdf24f1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-08 22:45:44', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('52a8d49b47014890adb3721616fd6e82', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E5%88%86%E4%BA%AB%E4%B8%80%E9%83%A8', '2021-04-09 08:48:38', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('53086749788341e18d408144d6ac36f0', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 01:24:56', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('533c5838d03f40fd8035503cfa8b3f5d', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 22:25:45', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('53a9886a227e4ddcb32b0713944824d3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-08 23:04:54', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('53c970d04c234969b2a560697d85eba8', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 22:25:41', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('53ceaa54205642248786c87e976f25b2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:48', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('53d67ce1404a4ecf9ada90098f1fe6e8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:21:11', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('53f9da92945440369726b24df0952047', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-03 12:41:34', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('541cccae9d354aa0b7884310a3069c63', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 13:43:27', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('5472d9736cdf4c719b5255b3976dac5c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerReplyList', '2021-04-08 22:45:49', 'http://localhost:8081/question?questionId=6');
INSERT INTO `pv` VALUES ('54751308bdfb465eb7919d422dd97e8d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 14:39:40', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('54924f0f8fe1430bb5e3562e841156c8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:30:07', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU');
INSERT INTO `pv` VALUES ('54a54fbe513d481884a803b6c8bc2886', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:45:53', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('54a8c538bf1d4a8890e2d65b5ec3149e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:45:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('54cbdc0719ef4097ab72c92a3bf94e40', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 00:36:14', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('54e1d9c09a34454197ddb7105c06e83d', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 22:25:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('55553aac760446eb937ed4014febaae3', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-04-01 19:16:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('559510012d1d46cb91dceafd59dc533d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2021-04-09 08:45:44', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2Zhdm9yaXRlTGlzdA');
INSERT INTO `pv` VALUES ('55bb86d5fbf04337b0d0a4552d42950b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2021-04-09 08:45:52', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('55fb6aed660e42eb8b33ff1672bc0fcd', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 22:19:43', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('5604439043f14025b95354bcfa67a3db', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-02-24 16:28:21', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('561de0332ce244b9bad3350df7edfeb8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-24 13:47:43', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('564c7e9acf3342878921d432d11891f9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:09:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('569100f9442544f7b22d0559174e6b64', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:36:36', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('56a66bc4581645d68c299a69061adc6b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 01:25:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('56b8eedd0dae48d5a88fc8940c925fa6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2020-03-29 13:44:25', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('57673d9c1be94ba7abad94fedd60b62e', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-09 08:39:40', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('57c2bb8f2eb54e4da315f88fe455e891', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:42:28', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('57c59d80afe14b459fde2983902c5541', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 22:19:59', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1hVzVrWlhn');
INSERT INTO `pv` VALUES ('58338a31f1c2470da3e8a634e8c83878', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 14:06:26', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5844e117c7de49fb855bd7bb73e70523', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2021-02-24 14:45:21', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('5860264551ce4c6a998c9ba2751b4091', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:44:36', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('59d2bb5f22914354b0e2563ac163da3f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-05 12:38:58', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('59d5d0ca17fb45289baf58d0e88c3a11', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:23:05', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('59d9ef034d23475f8981475bb1d4f06c', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2020-04-01 19:22:33', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('5a35a59ce8484d6180bc9f38d092e8f7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTQ', '2021-03-31 23:44:28', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('5a60006b89244b3fa4b7f2952eb2d044', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-08 22:47:27', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('5a6a83f0cd844cf28d7c284f63351eda', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:34:22', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('5a6f9af49a564b55ac82887cefbb33a0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-04-09 08:46:06', 'http://localhost:8081/user/control/home?userName=tim');
INSERT INTO `pv` VALUES ('5af7a40b7cc6490a9b2bc19347d0f84f', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:29:26', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5b0476f35744416a8bc6c8d3cce6cb0f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:39:01', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('5b0810b8e2744abf8dba0972cfd3f0d5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-03-31 23:18:17', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('5b0fa97f28f84131b7bf14810719467e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 16:27:44', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('5b507ac4688f4f3a9a4bb4e678edb6f6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:38:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5b5fa69e661142c795d0ac4edef4bf2b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:34:26', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('5bdc8e882ac849a6af5f0671087f3993', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 23:02:35', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('5be17469d92b4369b3e9f6fb2511d9f5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:20', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('5bf1d660ac414586849c94556aca37cb', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 14:17:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5c29eab8bc4c46bebe87eebe152efbe7', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:30:21', 'http://localhost:8081/user/control/home?userName=tom');
INSERT INTO `pv` VALUES ('5c9b1c75775c42deb8f2166db36a5dd2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2021-04-09 08:45:15', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('5cb20dd454074555a74a48efda74e72d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 23:42:02', 'http://localhost:8081/agreement.htm');
INSERT INTO `pv` VALUES ('5cf13d5707ef4edf94fd6133be363f34', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:44:16', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('5cf44b6116354a89b0617fde2c2d013c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-24 13:46:05', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5d5e2aa8fab64357b1b4937efee185ac', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 14:38:43', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('5da475f87e4c45eb8953074cb2e1b87c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 13:43:35', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('5da937e3324f465eaf9a7dd7beb562f8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:18:47', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('5dc2165efb064708bad350ed54934fe6', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=xiaohong', '2020-04-01 19:22:02', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=xiaohong');
INSERT INTO `pv` VALUES ('5dd27f9a03e8430196daeaa7d7239a54', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:43:15', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('5df092cb049a4a0d8468245fe6daab46', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:47:05', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('5df912f504a44accb642f43f60e09e13', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTk', '2021-04-08 23:03:46', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('5e01d9c56b7848c79e5a21451f40108a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 14:25:38', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('5e5fa8da2670426abdb96977cac6f20f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-03-20 18:16:13', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('5e921874aafd4e3fb312ec3f1463c9ac', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 14:44:59', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('5eb5e18bd0e4447fb0075302ff3ec4a4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=', '2021-02-24 14:42:22', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('5edf6b73d4304c0bbe146a7c44d3884c', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:35:12', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5ee4c940a3194827924df5dedf72ffd8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:41:47', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('5f07a4fa95554099bda70df09454dbf0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2021-04-09 08:45:23', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('5f547a4bd7704f3f9d956dafd329e51a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:03:52', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('5f6c9a4bbd9049a181de21febfa650d7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:40:58', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('5fae376ea5904969868ac40ecbee5351', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 12:15:29', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('5fd0c5dda33340b0b6c9c3fb686e8979', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:52:06', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('600812d592f445bb990067acd2eee250', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2020-03-29 13:44:24', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('605a54d758ec41c1a5dd3cc75227ac15', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:05:31', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('609d664482c34ce9a0fe00656eee7277', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:33:34', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('60d043bf2c1846739ca56a5f752a37e6', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-03-20 17:02:34', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('60ec965f0cd64627916af30b2c884f10', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-20 12:08:07', 'http://localhost:8081/thread?topicId=3');
INSERT INTO `pv` VALUES ('611e0a48ce4e4aa49f1a87fecfc8b363', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:19:35', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('61265c5272ee467880cac4926ff3426f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:49:32', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('612aacef0ca54b4593c747177028d5e2', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-03-29 13:24:18', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('6145696535f64b5ebf28c1a6af739f98', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515300054769', '2021-04-03 14:41:03', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('61c47944e8fe49ce8189fbcced07346b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-05 19:05:43', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA');
INSERT INTO `pv` VALUES ('61f7466fd62d4596aeeaef61e8e8124c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318015581178', '2020-03-29 14:25:54', 'http://localhost:8081/askList?questionTagId=32317954181173');
INSERT INTO `pv` VALUES ('620348b6d66745dfb6b1f933295c1cc3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-31 23:44:37', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('62599791a60e438089223c8b685b9a65', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:08:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6260c215a50f47b79a6f4dfb1b11a9bb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 22:23:23', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1hVzVrWlhn');
INSERT INTO `pv` VALUES ('62855204a51f40b0a56781e9d01c6147', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:19:18', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('6288d065d40446708ade86bdcf3ff8ba', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:39:54', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('62957f42e20242108edb8a4095431610', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:46:01', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('62f4420cd11a4500b928081f48105864', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2020-04-01 19:22:34', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('62f98cd93c45434ba42d0402c83c1ac0', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%8D%E7%9D%A1', '2020-03-29 14:37:41', 'http://localhost:8081/search?keyword=%E4%B8%BA%E4%BB%80%E4%B9%88');
INSERT INTO `pv` VALUES ('6303171bc04f455ca8155fc48df99c01', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-20 18:23:14', 'http://localhost:8081/thread?topicId=11&commentId=4');
INSERT INTO `pv` VALUES ('6305b9072fb84abe899331966b2c6050', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-03-20 17:21:36', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('63069ce39fbd43b29601d08c5fed0aad', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318015581178', '2021-02-20 12:04:03', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('634527428eab4b668fdfe105189f48d7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:18:59', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('639ac5a68c4c4756b8435a30140d0c2b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-08 22:48:48', 'http://localhost:8081/?tagId=35515300054769');
INSERT INTO `pv` VALUES ('63a1335a9c8741398c5997527f40aeef', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:40:33', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('63bafa0099a248788d90fd5a86f6272f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL3BvaW50', '2020-03-29 14:34:00', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1kWE5sY2k5amIyNTBjbTlzTDNCdmFXNTA');
INSERT INTO `pv` VALUES ('63c0d70921694c3ab7ea1dd0f18e4fa5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-08 22:42:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('63cce84846224d3487531f410e692649', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('63e0bc3c8e564223b2bbf47b7fcaaa93', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=xiaohong', '2020-04-01 19:22:07', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('645d019c01e24f06b9d50fd2de559a63', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-20 12:01:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('645e0fbed85247348918d7cabbd6cf15', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-03-29 14:06:53', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('646b777cb62f4b95bdb0c41d5e5e853c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-02-24 16:28:08', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('6484d4a787ba4f2392413134d7fbb1e6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:36:30', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('65657b321c1645ea8d5bdf66e679c274', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:35:27', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('65907c99e81247d5a77f7188a194b84c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 22:19:44', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('65aa7167f746418daa1075f5a056ab21', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 22:59:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('65ef7903b3d44762bb04718fe070c0b4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-08 22:43:13', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('65f05b56bcdd48c3903d295cbcf0d53b', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/membershipCardOrderList', '2020-04-01 19:22:48', 'http://localhost:8081/user/control/systemNotifyList');
INSERT INTO `pv` VALUES ('6670f70e5b394bed9e403790bbc85c26', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E5%8F%AA%E9%9C%80', '2020-03-29 00:52:29', 'http://localhost:8081/search?keyword=%E4%BB%98');
INSERT INTO `pv` VALUES ('6696006f5f5040938c4154aebcd11a12', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-22 12:32:23', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('66986cf70860436fb8ea9ec2395e311e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:49:15', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('66af67ceb8a14cfbb8069129b73de767', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11&commentId=4', '2021-03-20 18:23:39', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('66efccdddf80496fb5a726d2e6acf60a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=4', '2020-03-29 14:32:48', 'http://localhost:8081/question?questionId=4');
INSERT INTO `pv` VALUES ('66feeb32dad24569887ba6cebbfc6126', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:13:46', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('676dd2c2858b40beb448054868be374d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:32:01', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('676e5a64e9e54c169a52fcc160885586', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA', '2020-03-29 00:40:58', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1ZWE5yVEdsemRB');
INSERT INTO `pv` VALUES ('678f73b4f3e14f99819cf6021494f8d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:58:07', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('67b385a5df72473cb824fbc3b51cb7ab', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:29:25', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('67baddcf48c14de59a4f1b6cf273af18', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:43:04', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('6817199e6e954a6bae452fdb1b191178', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:32:07', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('6826404b399a4fc281896bcb8ed39eaa', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 23:02:19', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6878080783c04cff8cf2b5cd3c2a97ab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 12:42:50', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('68948e7cfeb34318b5fb7425404d45d2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:45:22', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('68b9207dd34543a9a87ab7cc6f6396ad', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:44:17', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('6904f2463d2341c69c1e05de88e6ecda', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-20 17:13:46', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('6914c543158b41bcb81adc84a3ac4972', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:56:26', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('69b639a637be4d72bb84bedebab7186f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515300054769', '2021-04-03 14:41:22', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('69c0cba891c943b384df47775a550663', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-20 12:01:41', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('69c32d3eb6e84545957325338d0e8971', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerList', '2021-04-03 13:58:31', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('69d212d54f17422facc9d7455f815e4c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:32:04', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('6a1e009c7e76499a83cfee5171d2241e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-02-24 16:28:27', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('6a83712f7dc84ee3963b6a26284fcf5e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-02-24 14:44:47', 'http://localhost:8081/thread?topicId=5');
INSERT INTO `pv` VALUES ('6aa5b6e46a6344d7a48fbabed15c6726', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:40:31', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('6ab3c14bbd2947dd91fb4b35e91cd019', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-02-24 14:44:17', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('6b0ec75c483945878a4a54c777f5d61f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-20 12:07:31', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('6b3d9f89fb50424890a63de1439efe13', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2021-04-03 13:58:01', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('6b4bd5c8e9194710934a008147553936', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=6', '2021-02-24 14:42:18', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=');
INSERT INTO `pv` VALUES ('6b63cb84566a44bd9deb45dec2a4d4ce', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:35:27', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('6bd82f9d750a470ba83676fc691e314f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:34:37', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6c363a9ce7264b1b990aca157c17c06e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:43:07', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('6c759b9d889a4c3fa268a3f1ba3f8abb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerReplyList', '2021-04-03 13:58:30', 'http://localhost:8081/user/control/answerList');
INSERT INTO `pv` VALUES ('6d46271cb4204038a786775999f55415', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 18:59:26', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6d47efec6b184883b378173de090506f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2021-02-24 14:45:05', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('6d550da1d8a441fdbe191d15f70dbf71', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:50:30', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6d59c878fbe84e2abcbb697f7bb4838e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 14:41:40', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('6d6cc9b4b39848e3986d5649401ca23b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-08 22:45:46', 'http://localhost:8081/user/control/answerReplyList');
INSERT INTO `pv` VALUES ('6d94888d2dac4437986886b211e095de', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-03-31 23:56:22', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6dc216dcb31a40deac8b52ae7001c286', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:25:30', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('6debd301f2e74d09a9f60137f3424d79', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 12:42:51', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('6e50b302513045ebbb77a4b189cb8bf0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:47:33', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('6e632ff16f4540c8900d225cc79b64a8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:40:59', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6e943664047f40dbbed4bf487caf6f89', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 22:02:41', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('6ec034f9da26473f873fe614ae328fdb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/systemNotifyList', '2020-03-29 14:28:22', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('6ed9c58894ee4c03b409758e6b369109', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:49:17', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzQyODI2NzYy');
INSERT INTO `pv` VALUES ('6f0878d7c17b43bbb3e9145a59b3f2d3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:03:26', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('6f1dcd5c2e6a427b9c8970f2b74b9665', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:58:46', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('6f23f1135ac94fe0982597edb185a3a1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=17', '2021-04-03 15:00:56', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('6f355118c00348d5bae76ad0ccb4a61f', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 11:33:41', 'http://localhost:8080/');
INSERT INTO `pv` VALUES ('6f88c1fcbe2841ab968fda821da819ca', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:13:49', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('6ff34f9fe553427b8472bfda436f2c76', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=', '2021-04-09 08:45:29', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('703a4b9fbb004630a8a5d36c361a9a41', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 00:24:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('70981da3a746440f8f2bb30f5914a1c7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:36:37', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('709bf6149ff2416cbfc6ae7ae0e0f146', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA', '2020-03-29 14:31:57', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('70ad2f68b92b4d18be27455084af3cc2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-07 20:36:03', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('70b46ef1d3aa4078a43bac0759698a34', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/feedback', '2020-03-29 14:08:00', 'http://localhost:8081/feedback');
INSERT INTO `pv` VALUES ('70e3dc8fc9164022bce207c45edfc980', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2021-04-03 13:58:29', 'http://localhost:8081/user/control/answerReplyList');
INSERT INTO `pv` VALUES ('70e691e99c4a4b368e6e507998c22831', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=30', '2021-03-20 17:14:07', 'http://localhost:8081/askList?filterCondition=40');
INSERT INTO `pv` VALUES ('7108def70fd34469ae94db92e04ed3f1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2021-04-09 08:47:34', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('711736c560cf4aea96d1c463f0859a70', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA', '2021-02-20 12:08:33', 'http://localhost:8081/search?keyword=%E6%B1%82%E5%8A%A9');
INSERT INTO `pv` VALUES ('71ae3b60b5ab4e8aa69eb84a34672a4d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-01 00:01:38', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('71b3d95e504541fd8e59aaf871869683', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 12:18:23', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('71ebf917fdbd4ea88516f3bf8a177580', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2021-02-20 12:05:10', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('71fa2075935e4bc4b06e8ddea50a2aab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515300054769', '2021-04-08 22:48:49', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('7253cae0a62e484ba74549b2021ad73f', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-24 16:26:34', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('725503bb90df4fda871f6f98d2cf5696', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E7%9D%A1', '2020-03-29 00:50:54', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('725738e600934979a8624a0c623c7e2a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:40:32', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('725f0fdc42c747369b7435b2359b691f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:43:24', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('72897a6254aa4e07801d609e1fea048d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=5', '2020-03-29 14:33:30', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('72d7f9b928894aa689a8569988a3ebda', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:22:24', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('72ddae1e61eb478f8940bea6df531098', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-03-29 13:24:19', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('73201e0a4c554d3796274a8a98cc5cdb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-08 23:03:53', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('732b839ec18e43b6aa90455842c4edd1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:43:21', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('73641c4fcca343e6a1746a19b0d6720c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:24:37', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('7381b4d9d0944cbf95baeabc4ff143e7', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%BB%8E', '2020-03-29 00:52:45', 'http://localhost:8081/search?keyword=%E8%BD%A6');
INSERT INTO `pv` VALUES ('73b8bde7925740f3988f92ac3e50e583', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-03-29 14:35:40', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('73d4085196a44b7c90d2236779058a63', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:43:04', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU');
INSERT INTO `pv` VALUES ('73e459901b604b8a9ea6100f7291cc4b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:04:04', 'http://localhost:8081/askList?filterCondition=20');
INSERT INTO `pv` VALUES ('73ef46f1f3f3459dabbfbb3bfec3cada', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/findPassWord/step1', '2021-02-24 13:49:19', 'http://localhost:8081/findPassWord/step1');
INSERT INTO `pv` VALUES ('7407165c532c4174b2a072bea3f0a820', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 22:49:37', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('74137ecdc2b14089936a6c120cbd0241', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318015581178', '2020-03-29 14:25:59', 'http://localhost:8081/askList?questionTagId=32318008181176');
INSERT INTO `pv` VALUES ('741bf11202f14f4aa82048e60e16d6cb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:33:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7442b6819e2b4d8db43e0cef6cbcd2ef', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-03-29 00:43:53', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('7450a5715d714a04add35481b7d0b74d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzQ2OTI2NzY1', '2021-02-20 12:07:23', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('74b33a453a974f03a76e0e8f106ba7e3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 17:18:37', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('74ba49702bc1469aa7e766ecfc36bb63', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:42:31', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('74f563acb6974bf5bb0a0b0a835bb594', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:44:14', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('754727e0a2ba46eb97af8bc83453509b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 14:41:25', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('754dfe985ef84e988f4d1cbc16dd3d6b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA%E4%BB%80%E4%B9%88', '2020-03-29 00:51:14', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('755ca2bc2fb54540a80caa15c5c6127a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 16:26:55', 'http://localhost:8081/question?questionId=7');
INSERT INTO `pv` VALUES ('75bd4e7fba2d4753bfeacb192d40e44a', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8080/', '2020-03-29 12:07:16', 'http://localhost:8080/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('75c0052d38a6400286c69944ff390a8e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 16:28:05', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('75d1fc11043e4db9873fca741a7669ea', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA', '2020-03-29 00:40:42', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1ZWE5yVEdsemRB');
INSERT INTO `pv` VALUES ('75df8cb43f904056a8359d71cb7f5512', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317749526769', '2021-02-24 16:26:51', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('75ebff2d55d6432e8d41ad530e892231', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:44:40', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('768f521da43742ad99e40d47ce8d74c7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-03 13:57:14', 'http://localhost:8081/thread?topicId=14&commentId=5');
INSERT INTO `pv` VALUES ('76d1ab899ca7454bbca5a953f9ceb969', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16', '2021-04-03 14:52:24', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('76f61f44eab34e96930793ac16e15396', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2020-03-29 14:31:46', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('771638f0ca2a447e963fae3d714c0370', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:42:30', 'http://localhost:8081/question?questionId=6');
INSERT INTO `pv` VALUES ('773b5473b39d44d9b29e16c4273012cb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:44:47', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7768f8fbb5bb40b69f2715b6ab9fa397', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2021-03-20 17:15:23', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('776ac7399d674e13a50566a38f24404d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1ZWE5yVEdsemRB', '2020-03-29 00:41:35', 'http://localhost:8081/register?jumpUrl=');
INSERT INTO `pv` VALUES ('7789e38b2e084124b4db2b5250de7f3a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2021-04-03 13:58:42', 'http://localhost:8081/user/control/answerReplyList');
INSERT INTO `pv` VALUES ('77a744b58c014e2c803e1ad290e64514', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:25:29', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('77f24742572f4b2a894444b9dcd88fda', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%BB%98', '2020-03-29 00:52:35', 'http://localhost:8081/search?keyword=%E8%BD%A6%E5%8F%AA');
INSERT INTO `pv` VALUES ('784302d4a50f434db939eefba6bb47be', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-02-24 16:27:24', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('78a017359b8f4b1b8ed2cc3aa09248fb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:48:47', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('78a73ea726234a269c9e59efdbf37ebb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-20 12:06:19', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('78b887654a704b0aaceb58bc70d2436c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 14:27:17', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('78bff95f52c544588a0223abd6c996d0', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:08:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('793b2ba8fd1a4454a1d93865d19239c7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-24 13:47:41', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('7945e024770646f9a875509a0333bf94', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:42:30', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTQ');
INSERT INTO `pv` VALUES ('797be0410b614186b5ed8d60b7d9ee1e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-08 22:43:03', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('797cabf779c9403ea9ddf5b37c17ac13', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-20 12:05:19', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('7988b23fdd6c43eb95be4e716eba7019', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318046281193', '2021-02-24 16:28:33', 'http://localhost:8081/askList?questionTagId=32318005581175');
INSERT INTO `pv` VALUES ('798fb8eb7e8749579541444e203e2156', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-22 12:32:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7a65ca1550ab44adbcbbed775bc18887', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCard?membershipCardId=1', '2020-04-01 19:17:49', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('7a74727aac9944e285fa3d10419cf111', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2020-03-29 00:42:53', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('7aa1b1aad2f040389becd8328e59486f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 17:15:11', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('7ab48365241644a09db1a2818768d6c6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-03-31 23:38:06', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('7ab6eb61f0a24ba4ac6488401433aa24', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:34:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('7af169f45f2b48ae822a5acda65b953d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E8%BD%A6', '2020-03-29 00:52:49', 'http://localhost:8081/search?keyword=%E5%8F%AA');
INSERT INTO `pv` VALUES ('7b38487aa45547369146a3ca26a7e2a1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 13:47:40', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('7b9f1cba31c641d59bebf302f0061618', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-24 16:26:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7bb8a6acc1b8404b8701afdadec99c0c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 18:02:49', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7bbf9b43930149f583481d6f7f5cddfa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2021-03-31 23:18:28', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('7bc72dacf0e446fead3c7dd47c1ef8cf', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 14:38:40', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7c5ce7d191c049f698d674835b87605e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-20 12:03:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7c6f7e8b4a4e438c8062b52d5b3bcaa9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/systemNotifyList', '2021-04-03 13:58:18', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('7c84b42aa83449c4a88ee8a7fd55ef32', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:34', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('7c9247f9639a485f89fbe1002c6704bb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318028581181', '2020-03-29 14:25:57', 'http://localhost:8081/askList?questionTagId=32318028581181');
INSERT INTO `pv` VALUES ('7ce85a26e7c64d14b1dedb7514a7a59d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=8', '2021-03-20 17:53:53', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('7d2033104be4471da5c079a5a654b21c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-20 17:15:27', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('7d50384945c8460599c31d669619e223', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 23:42:31', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('7d55f3779a5d46838dc16a1a486a91b6', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-04-01 19:18:27', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('7dd1b2bd2c9443c48719303eeb715375', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-03-29 14:33:42', 'http://localhost:8081/user/control/editUser');
INSERT INTO `pv` VALUES ('7de3a7e6563c4b63be33f83065134f44', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19&commentId=8', '2021-04-08 23:05:20', 'http://localhost:8081/thread?topicId=19&commentId=8');
INSERT INTO `pv` VALUES ('7dff432b4250443582c953977fd2c6c6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:36:42', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('7e29a305191d4ea49139d4ac322aeead', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-05 19:05:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7e35248e6d6a43ec84d300146d559657', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-03 14:41:42', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('7e48d66831bc4f79856643ac92e59a02', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 16:27:32', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('7e5e82a68073412c85b247deb7c6d2cc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-08 22:43:16', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('7e5f17ae5eb842839988f81295085aab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 18:22:29', 'http://localhost:8081/question?questionId=8');
INSERT INTO `pv` VALUES ('7e6468dd972242a79d00a3dce354ce4c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:27:01', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('7ea7436210ad4efc945f3da5f3ba7ecc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-09 08:48:36', 'http://localhost:8081/search?keyword=%E5%88%86%E4%BA%AB%E4%B8%80%E9%83%A8');
INSERT INTO `pv` VALUES ('7ebb155bdf5c4e0da3e2269c074e2e07', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-04-01 19:16:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7f2d3fe3da7a4baaa1e7d41946846062', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 14:17:33', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('7f5a1538db9c434e881dabc43e1d56ee', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-04-03 13:58:39', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('7fbe807b4d6d494cb963f3bd3e376689', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:03:19', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('800467b77c1048a68c5437f03506b12d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA%E4%BB%80%E4%B9%88', '2020-03-29 14:37:47', 'http://localhost:8081/search?keyword=%E7%BD%90%E5%A4%B4');
INSERT INTO `pv` VALUES ('8038b378186e4a3d8fc65e14061a946a', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-24 13:45:53', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('805c76396db04ec8bbfbfec0b8fee208', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:17:17', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('8063d0e70f8f4be7a5796ef5a6c58e6a', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:24:32', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8081497cc53b42e086ecedfd93b54209', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:44:07', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('80b9845cda034890b9981bea0a749037', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:42:59', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('80c7bc54cb524649af2ef8695f45cfaf', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=', '2020-03-29 00:42:52', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('80e4d000c6f04e86b5926e8dbc99c7cb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:47:09', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('80eb9b70859f4885946c8a03abdb856f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2020-03-29 13:24:20', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('80ec9b5c630146d592e013d7ae5fbd13', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-03-20 18:16:18', 'http://localhost:8081/null?topicId=11');
INSERT INTO `pv` VALUES ('811e6f4408ed453ea90b3161e82569b4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%8D', '2020-03-29 00:51:04', 'http://localhost:8081/search?keyword=%E7%9D%A1');
INSERT INTO `pv` VALUES ('81c5c5a77b4546d9b5d8a751b5a9d55f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:44:43', 'http://localhost:8081/user/control/home?userName=tim');
INSERT INTO `pv` VALUES ('81dc57786d814a60a1fb2d087fbd8a71', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:39:14', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('82311d39337e454ebc299f167508a423', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-24 13:47:40', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('825a2edf1d9949109afd071ae1c5005e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-03-31 23:18:20', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('828c32634cc7449f9d186981ae08b02a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:43:37', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU');
INSERT INTO `pv` VALUES ('8292f4c784764b37af8cb5401bde6c5f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 13:24:01', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('82a07ae85f854af487cf634a9a5d716b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 13:24:08', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('82f148657eb74352bb626f9fde62d3d4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:45:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('82f66113526044d6b2df70227c901abd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:43:25', 'http://localhost:8081/comment_reply.htm?&commentId=5&timestamp=1617205404639');
INSERT INTO `pv` VALUES ('8308f6ec378946c1820e33251b1d8aeb', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 12:46:46', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('830eb1071a3a4cba8a2668af29762765', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:44:37', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('8335feb80a29467c81dd3b0e7e9f4be1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2021-04-03 13:58:27', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('837ca8c0d0224bd590d40d8f1d880a1c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:35:08', 'http://localhost:8081/null?topicId=14');
INSERT INTO `pv` VALUES ('837e642bc2094c28a98360a8f9e54d22', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:45:56', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU');
INSERT INTO `pv` VALUES ('8380ba7d70d84eddb12834c0d2050ec3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317749526769', '2020-03-29 13:24:22', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('83cb3969f6ad4b6d993bddbc42945ee5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 14:39:45', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('840e24d4be9c483e9aab50b9358c5758', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 22:00:19', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('8492192f6d7f4b9d9378c275748c8835', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:39:50', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('849b51667af441e88c45d9ae82d931ac', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:44:50', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('84e35c6afafd4bc4b1bd74930916e092', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-03-29 00:43:25', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('84fe461987fa44839d7b1207661b3c77', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:58:02', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('85607519c0914b88b51eeeee76e16ae3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-04-09 08:47:01', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('85d2d8326b6a49488faf5e826fd7907b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-03-29 14:35:32', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('864ab027aff1447bbe7b71efd0a90e89', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:30:58', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('86d91fb042f14f229f1917896ce6c7e1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-24 14:45:02', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('86fdc08d0dcf4c429651799a1c1263cd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:25:20', 'http://localhost:8081/search?keyword=%E4%BA%91%E9%A1%B6%E4%B9%8B%E5%BC%88');
INSERT INTO `pv` VALUES ('87008573001d41bbb62fe75bc3e274ac', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdA', '2021-02-20 12:05:39', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('8777caf5ce664ebe8487f66bdaaa7560', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 01:22:11', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('8780ae3225234c559affe3de9edcb3c5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:38:00', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('879900d15113499095eb43c098bfec80', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:08:00', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('87affaff0105425d851e0b60294d6b36', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-03 14:41:42', 'http://localhost:8081/null?topicId=11');
INSERT INTO `pv` VALUES ('87da558f912e453da24ae8e70eb7c021', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:23:13', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzEwNDI2NzYx');
INSERT INTO `pv` VALUES ('88177c181b834168a16b610d92a7e3f8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515300054769', '2021-04-03 14:44:46', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('883598bb59db4180b0d4b9fa1aec37e8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-02-24 14:44:34', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('8964616f42ed4869a266746a21bc1a9d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2020-03-29 13:24:18', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('899bfff0042a4f7c99ac773b66912a18', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2021-04-03 13:58:16', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('89b7daa48884407b8bd64790178969f7', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU', '2020-03-29 14:30:11', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('89f5a79790f040ec9824e43132142c64', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2021-03-20 17:13:54', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('8a0a681280b040f7ad0416dcf3e4e0c6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-24 14:38:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8a1a5f362a7241eab8222af93369ed33', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-01 00:02:00', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('8a5f6ec1c9e44afe896a1b0c68fcabeb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-03-20 17:21:18', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8a79ceb970294a53bd1d3f637b4359e6', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-08 22:40:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8ad87a49e71d4503862d921fd4756400', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 16:27:22', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('8b088af540d24578bb6f8dbeef8d224d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%C3%A4%C2%B8%C2%BA%C3%A4%C2%BB%C2%80%C3%A4%C2%B9%C2%88%C3%A8%C2%BF%C2%98%C3%A4%C2%B8%C2%8D%C3%A7%C2%9D%C2%A1', '2020-03-29 00:45:10', 'http://localhost:8081/search?keyword=%E9%98%BF%E8%A5%BF%E5%90%A7');
INSERT INTO `pv` VALUES ('8b7247c166134b858c7daaf8a6881a6c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:29', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('8bd325a96ecf43e683fd3af641965eda', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:11:53', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('8c8f0e105bc24a8f9788d87f216ec40a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16', '2021-04-03 14:50:53', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('8ca4f08778c842b6880b48152c3875f0', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2020-04-01 19:21:52', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('8cbc2fae88864e3da4b9d50d81cc3af2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317749526769', '2021-03-20 17:15:23', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('8cca63272ed94006978d31dc380c291f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:12:30', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8ce58107fc594fe9aca4dfdd124b0f2b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=cXVlc3Rpb24_cXVlc3Rpb25JZD04', '2021-03-20 18:22:48', 'http://localhost:8081/question?questionId=8');
INSERT INTO `pv` VALUES ('8ce8996168554e44a343c3a36e790b22', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=10', '2021-03-20 18:14:43', 'http://localhost:8081/thread?topicId=10');
INSERT INTO `pv` VALUES ('8cf85c4fa71f449aa46cce727f153a17', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:39', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('8d405bbbfc844a24ba40641dd2a76460', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:44:58', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('8d71b6175ced472ca576edfba8cf3b1a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:41:26', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('8d7bc3dc961f42169c57efd9948cf33f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:39:00', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('8d90755a964b4891b48b3d011ce0ab40', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:36:39', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('8ddf47546b0048b8a90968e9b77e6ad1', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 19:14:18', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8e2c3e6898194cd6b00dcb5c6da3ab1f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-24 13:47:48', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('8e691d269eef481dbb4e78c652887562', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:11:48', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('8e791f83a6c947489ff1b14ad1465f32', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-02-24 14:42:54', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('8f3b2f6dc9de4b7088856b2005bbebfc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:24:43', 'http://localhost:8081/thread?topicId=6');
INSERT INTO `pv` VALUES ('8f413961edaf4883b86681a09d516269', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:42:55', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('8f5c4bbf18fb42a1ad84bad5c7929408', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:58:57', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('8f6849d0e0c748ecbcab02e8b1143c1e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 22:43:26', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('8f754542bd1c42c0b55962d43e29be43', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:23', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('8f86dd308946454bb9bb4c89ec571773', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:51:17', 'http://localhost:8081/search?keyword=%E4%B8%8D%E7%9D%A1');
INSERT INTO `pv` VALUES ('8fa529adf1ec42a49a1d997528e72128', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:35:26', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('8fb3cdd5db3e4af0bd78c251cf8ecae5', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 22:40:03', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('8fd3566b7e3744779b89c8ca21105de2', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 11:33:33', 'http://localhost:8080/');
INSERT INTO `pv` VALUES ('8fe1fcffb8df4c2ba681b69fc94c58e9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2021-04-03 13:58:31', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('900cce4b58844753a2a30f9d1e1b4abb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:44:10', 'http://localhost:8081/user/editTopic?topicId=14');
INSERT INTO `pv` VALUES ('90a7c508c46c45f9a7e479241153d619', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2021-03-31 23:18:21', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('914b40f8a56844fbb2cc0afc7d57c185', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 00:37:55', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('915f3dd3478244f4a06ea793ae270985', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-07 20:34:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9189dfc673df482bb930f6a0b988dbbe', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:11:51', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('918d661c71ae407d9d0af3b9a94507cd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('91c7a7e322db45a6b342d7be44f14974', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:52:14', 'http://localhost:8081/search?keyword=%E5%8F%AA');
INSERT INTO `pv` VALUES ('924ab606bb5448f5891485c63b50d5b3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-03-20 17:54:28', 'http://localhost:8081/user/editTopic?topicId=8');
INSERT INTO `pv` VALUES ('92920a3a76e549d1bc2e1fe130e0ed41', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 18:59:25', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('929da5fce81a4648b7b503ba51276dc1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:08', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('92c61337d58243da9b2264b4ec082a7e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:06:56', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('92cf7078d42f45ebbd74029cb5698d4d', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2020-04-01 19:22:35', 'http://localhost:8081/user/control/answerList');
INSERT INTO `pv` VALUES ('92ed101734924675a58d48e841361105', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:37:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('930b684f4da549aebee874dabd21c113', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tim', '2021-03-31 23:44:53', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU_dXNlck5hbWU9dGlt');
INSERT INTO `pv` VALUES ('9328edc59b8e419d866833729bbdebde', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:32:10', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('9349239a81784e5fa79f16511617d726', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:42:47', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=');
INSERT INTO `pv` VALUES ('939a604884c748dbb5957dccbc560813', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 22:43:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('93a3ea2f2ee44b86aec29098d47c8f98', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-02-20 12:07:33', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('93e237a5c85445478beb29113fdfa5e9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-02-24 13:48:54', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('93fb72c1933948ae97f8e40469bd8765', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-03-20 17:13:43', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('942bf7ff5f0b47b89e0b38b54e33e161', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 00:41:42', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('94d8bbeccc8b4ecdb4d80b9217a75e3e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:44:53', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('94fec6a4326b4886af48276fd0fd06b3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzQ2OTI2NzY1', '2021-02-24 14:38:39', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('950b7c31ee6e4ad080518c5878dd38ad', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-05 22:41:35', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA');
INSERT INTO `pv` VALUES ('951dca1aae7044fd9eff4281bd91b8d2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318045381192', '2021-02-24 14:45:16', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('9545b1e2fdfc46aa93e2227520c1aabb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 17:15:25', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('9566ed231d5644f9a0d3d3fde95c00f6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:38:05', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('95b603500fe8475aa46479e770888f06', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTc', '2021-04-03 14:59:23', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('95fb16a5b81b491dbc984d97a97ad86a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-03-29 14:36:10', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('9605a324c8bd4f94a7a862ad5eb3717d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-05 19:11:33', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA');
INSERT INTO `pv` VALUES ('9629d086846449c2a76d14debb33145f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:38:57', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('964ab493a37e4e2e894e1c39ef9815d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:56:13', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('96842d7a664645e28014000786b4ba84', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-24 14:37:10', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('96f47cb77b02432d8e47c612ee508358', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:19:33', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('971840c6278647b1b358d450af9318dc', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:27:28', 'http://localhost:8081/askList?questionTagId=32318034681186');
INSERT INTO `pv` VALUES ('985789bd850e4175b47893f845c111d5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 01:24:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('98799bd59e994558963967d9478f9948', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 17:13:15', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('98c1e30992524b2dab888005f92de58c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:44:42', 'http://localhost:8081/?tagId=35515300054769');
INSERT INTO `pv` VALUES ('98cc6b9340fa49089b555b76e0f11cb2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:45:12', 'http://localhost:8081/askList?questionTagId=32318045381192');
INSERT INTO `pv` VALUES ('98d3c3f9e1074fb7a6f90dc9a34f6db4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-08 23:03:48', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('99223e6949d44d74869064b1ad6fcd9b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2020-03-29 14:28:09', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('99a18b6d7e704ca3b6d6b1e82c81da7f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-02-24 16:27:54', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL3ByaXZhdGVNZXNzYWdlQ2hhdExpc3Q_ZnJpZW5kVXNlck5hbWU9dGlt');
INSERT INTO `pv` VALUES ('99b18a1b29e14689bdad530c4238346d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2020-03-29 13:24:06', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('99bd623fee6f42b582fa494a7bfd66f1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 14:45:01', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('9a02e025c4d7481f9d39a86054d7bcb5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/editUser', '2020-03-29 14:33:48', 'http://localhost:8081/user/control/point');
INSERT INTO `pv` VALUES ('9a27e7c08b5d43babf44c53d4b471b1c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 17:14:04', 'http://localhost:8081/askList?questionTagId=32318034681186');
INSERT INTO `pv` VALUES ('9a2f1d9974df4088a965b60cd0af9f13', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:40:48', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9a5a629e94fd4e438026233dd7937580', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-03 12:41:33', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9a6a351abbd14f1d9a45ff52e71b589b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:41:04', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('9aa408ce56d645c6940ab986d8661b52', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:57:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9ae287bdc2eb47ed9d48bda2dcc8866e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2020-03-29 13:44:25', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('9af06e35bd964d05a2e7941ae36fd6cb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:41', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9b2d6c6cdc6845d3af2ec95c68302032', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-24 14:38:32', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzQ2OTI2NzY1');
INSERT INTO `pv` VALUES ('9b391ccc068c45f098e150f4a037b0e4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 23:40:20', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9bebc76f44164043850b1bfd88137284', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:35:05', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9c0789e80648409192d3ab1c69de2c7a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-03-29 14:07:06', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('9c1572282b444acebe6931715b1e2a8e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 21:56:58', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('9c5ab04fb9694c7e97251b800fa2989e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2020-03-29 14:07:06', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('9c63106e964049a8b784e7f370101533', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:32', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('9c93aef86bd04b4681a7b7b37e11be89', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2021-04-03 13:58:26', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('9d651483967541ccabca5042a3b84782', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:07:08', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9dbcb484f91a48f189c441be694a0c6f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 13:34:02', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9dbd2f2075164625a5a313d241789779', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-20 12:06:20', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('9debc432119a4c6a8a36f94c0fd445b4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-02-24 16:28:25', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('9e114c44b60c4dfbbf334177b825a0c9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=aW5kZXg', '2020-03-28 22:23:23', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1hVzVrWlhn');
INSERT INTO `pv` VALUES ('9e461614fee548308a9eacb4212fa59c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:17:58', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('9e4d023f51f24ff7b4cb4394554ed4d0', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-07 20:32:13', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('9ea92b67409d4ab883cb8794a1233207', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317952481172', '2021-02-24 16:28:35', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdD9xdWVzdGlvblRhZ0lkPTMyMzE3OTUyNDgxMTcy');
INSERT INTO `pv` VALUES ('9eb05722bb914ae094778fa8ae6d7d09', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:38:27', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('9eb90926dc654dc49546e8ba1c79e915', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2021-04-03 13:58:15', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('9f0bd0b898e74272bb752362f3bbacc1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-20 18:23:54', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('9f7d5c8af55448e8bbabbadfff7b9f6a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-03-20 17:13:52', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('9f8329ad76354041b16a6cfae3d905de', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-03 13:58:36', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('9f9a35eba996408089b06bd7d77e193f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-02-24 16:28:25', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('9fedaf6b4b98426ba0e81f74fbea4feb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:32', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('a00892e51c304f55b39c9e338808b925', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=30', '2020-03-28 23:42:34', 'http://localhost:8081/askList?filterCondition=40');
INSERT INTO `pv` VALUES ('a045db63aaa5407bb86ab99806e63772', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=7', '2021-02-24 16:27:05', 'http://localhost:8081/login?jumpUrl=cXVlc3Rpb24_cXVlc3Rpb25JZD03');
INSERT INTO `pv` VALUES ('a04ad0f642f545f99b1d99c06bdb6589', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:43:25', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('a062143dfea34f15872080498bc1e546', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:37', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('a08aa4b4a9234c16a38eec9831833a3d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:23:16', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('a0d2392780454fc2bac2230e359d0e38', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-24 14:39:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a0da4beb4bdb42a293a1b1bf0e83d516', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:03:56', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('a1126f6c3dba49e8989f97c21e7d956c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=7', '2021-02-24 14:43:56', 'http://localhost:8081/user/control/home?userName=tom');
INSERT INTO `pv` VALUES ('a13097274b9e48e39747c09956693916', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:30:06', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('a15d55ca614d41b88622d03583d233aa', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-05 12:38:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a166691fecba45f2bccb630382fec2fa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:38:45', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('a1863e6ec62749e09cea1976282ef553', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/editTopic?topicId=14', '2021-04-03 13:43:13', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('a1890a63d1ca4531a21c0fa8cbe002b1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-02-24 16:27:25', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a1cf0774d72047ed8ce88c88f4cc2832', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:22:57', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('a1f805ca0103495693153f2b382e6e20', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2021-04-03 13:58:27', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('a2182da5a5934a589d8fe7b1dc0da83b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 12:42:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a2270141e08047dd9165425a5653daf4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:35:34', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a2471b59392147aab682e95f8ef74ed7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 13:00:59', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a25b4a563cac4319a5485239447e3c93', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 13:44:13', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('a30102f645e54548bbb05c94189286db', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1kWE5sY2k5amIyNTBjbTlzTDNCdmFXNTA', '2020-03-29 14:35:03', 'http://localhost:8081/register?jumpUrl=');
INSERT INTO `pv` VALUES ('a30a140208c2463ebefa4be0c4db17bf', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:27:19', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('a313289902c94a37bdfd086174d6469b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:37:41', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('a31fc20763c542f68d90042236fd7904', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 22:49:41', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('a32b6f23f88b4e7993ade05194d397e3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:18:55', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('a391ec155a0a41628602a435962e49a9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:32:04', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a3b79001b0314947a2b07310f3a649cc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-20 18:18:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a429df289024428e8dd789265f0352b9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-03-29 14:28:10', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('a44bc1d834f841628102ab952512c5be', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:16:31', 'http://localhost:8081/null?topicId=11');
INSERT INTO `pv` VALUES ('a482c99cb7084397867570ffa8233235', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:43:55', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('a499858f3f3044528a03eab1324c53d2', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:24:34', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a4ab27c27deb42d781f2eb35a2ddb95a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317955281174', '2021-02-20 12:03:49', 'http://localhost:8081/askList?questionTagId=32318005581175');
INSERT INTO `pv` VALUES ('a4adce083400483d9c817263f2af7b1b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:49:37', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('a4fc2482323d4bf093dbb2cb2ba00123', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:43:10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=');
INSERT INTO `pv` VALUES ('a50254e71eec43b38c6b7b44fef11f37', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=', '2020-03-28 23:42:22', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a504a83e331244879b57a6bf005da807', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:43:00', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('a5086cca02644b608222237bd90016e4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 01:22:07', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a54e4fbe5e70449483a3620592cb62bd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2021-03-31 23:18:47', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('a565cef56d3f42e1b2b321fcbba3cc09', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2021-02-20 12:03:48', 'http://localhost:8081/askList?questionTagId=32317955281174');
INSERT INTO `pv` VALUES ('a57d928b416c45d89625adc322756064', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:47:07', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a5ae0678b70d4602b5847c36cbaa0aab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:36', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('a5b4d991128344fb8932bd899a0d3daa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:28', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('a5d3b850d3514fdc8d6408f6609a869b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:42', 'http://localhost:8081/user/control/realNameAuthentication');
INSERT INTO `pv` VALUES ('a60885c48a4a496e96096a7d2a57d331', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:39:15', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a62e820cd8134d419bd664b85ba3db17', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:44:51', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a67201cacc5c4f1da9adc1a7f7cce68b', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/payment?paymentModule=5', '2020-04-01 19:18:21', 'http://localhost:8081/user/control/answerList');
INSERT INTO `pv` VALUES ('a6742001f2134ad8bbf0a5f843e27dee', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=bWVtYmVyc2hpcENhcmQ_bWVtYmVyc2hpcENhcmRJZD0x', '2020-04-01 19:17:41', 'http://localhost:8081/membershipCard?membershipCardId=1');
INSERT INTO `pv` VALUES ('a677eb3cb09745439aa12efc5d30a94d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-03 13:56:39', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('a67c7386396e4cb78f828a8e43488ea6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-28 22:19:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a6a1e75929234af5bda79a553b4d3d54', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-08 22:40:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a6e30b5151fa41ff825084c775c0cf31', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-01 00:01:20', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a6e3fb8c7d764ac784c3f301af6d3483', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-03 14:41:07', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('a70b898d3fdd4e53ad102581545514c7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:52:39', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('a72f0c59e8dd46ceb502f0a2b4f251be', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:45:55', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('a740d02062da4534ad9534a4be1f448f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-24 16:26:49', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('a7c8cd8c845042faa31a4378c1cc707e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:35:30', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('a7e6b9f0d3714a20b9b5cb455d2ed392', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:31:08', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a840097589ce41879b872bd5419f0cec', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-04-08 22:42:51', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a87ede27666f47c0af23aa71aedcc796', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 13:49:00', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU_dXNlck5hbWU9YWRtaW4');
INSERT INTO `pv` VALUES ('a8e4ea43abb842ec957d7cc8733ecc1b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16', '2021-04-03 14:52:33', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('a8fb0127d7794250b746b5cf7d47a97a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 14:35:37', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('a97d7e2494f146e1908ea41a0ec8f86b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:36:27', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('a99867a596714d99b24f0b9ff64bd852', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-08 22:43:05', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a9aa6e46e51b423eb2c0668ce5ae699a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:37:50', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('a9c5e683a0ee4864afebcc983fb5a38a', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 12:46:47', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('a9fa77256f264f588989822c99201b0d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:21:42', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('aa0883cf63ef45ecb3cf8b4974dd26da', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:04:06', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('aa40248641f3485fb28ce462966eaeda', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:06:11', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('aaaaedde3cc242568ba3ca82485b6a33', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:29', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('aae50515e3cc479abbff876c4a11aca2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 22:48:49', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('aae63620359549c7a3851fa7226ee442', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:39:11', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=');
INSERT INTO `pv` VALUES ('ab08b41aff7147eea54ee83f6c8b0ae1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:32:12', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('ab2f7d0023cd43f5970a047d2a980f79', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=40', '2020-03-28 23:48:31', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('ab3717c62d504ef3a0ea7258f744846c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2020-03-29 14:25:50', 'http://localhost:8081/askList?questionTagId=32317955281174');
INSERT INTO `pv` VALUES ('ab7d8a60cebd4faa8d7743701e72ef4d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318025381180', '2020-03-29 14:25:58', 'http://localhost:8081/askList?questionTagId=32318017081179');
INSERT INTO `pv` VALUES ('aba1a1ee05e14ca28a0da4b253fba008', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=', '2020-03-29 14:35:07', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('aba9f008666a472f8231a5a4177693ae', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:48:04', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('abaf5e5bca5e46d590cb47c81e82f1cc', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 00:37:49', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('abbd2e8b1f934283ab246c88d057ce1f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:34:24', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('abcb6434df2045109159bfd05595730a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 13:22:51', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('abcce17312d34f73901783aa91d26217', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:18:28', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('abe0befb11bf460a81286b94b08c6d6c', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-04-01 19:18:23', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('ac05416ed59f4d1396096b4c2ce65d29', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzEwNDI2NzYx', '2021-03-31 23:18:09', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('ac06e804d22b42708371af20ebd6e8a0', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-07 20:32:09', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ad15b307e84b476180632c449a920707', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 00:41:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ad263e35935b47cf9854afe7173828b3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-08 23:04:37', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('ad2f2361148743f2b14442011a473a47', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2020-03-29 00:37:32', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ad5d4d6f51f741d2b1b8dd529816d0a6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:35:24', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('ad924280d8e04260af297f403cbe024f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTkmY29tbWVudElkPTg', '2021-04-08 23:05:52', 'http://localhost:8081/thread?topicId=19&commentId=8');
INSERT INTO `pv` VALUES ('ae0cbc0acbde439c8c389dd5a1053c6d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:41:21', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('ae1d50fde5bb4fb486a9b8bc77b63ad5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTQ', '2021-04-03 13:42:43', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('ae43b2fffb504c528abce41035e1d5e2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-03-31 23:38:34', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('aeb0562d9dd14f35bc2fc38a5eb2811a', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-05 19:14:20', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('af05c65790af44cea69bcca2897cc3db', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-22 12:41:59', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('af0a0479143a462784a87e8fcc9bd7cd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-20 12:05:15', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('af228e9e3d9f43faa9e6f4594faeaca7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-08 23:06:01', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('af22fc9726a1482e86427f875bfecbf3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:40:06', 'http://localhost:8081/user/control/point');
INSERT INTO `pv` VALUES ('af259c7d5e614679b687a2fc6a24bf91', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 16:26:47', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('af574ac404e34b52a5a6b7f49198350f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 18:09:28', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('af8e41c37f63436faf2961555712cbca', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=20', '2021-02-20 12:04:05', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('afceeafb6457458dbe90b918a1bdee2b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317749526769', '2021-02-24 14:39:46', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('afefd4fa0c334d159a84e22991e2d6a8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2021-03-31 23:18:38', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2JhbGFuY2U');
INSERT INTO `pv` VALUES ('aff22cb0874343aabc754d6539cc38df', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 13:47:38', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('b0094f7dbe214f73ab4d211671f16c1e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:07:03', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('b0235c580fcd4821b2da82d54dfed3e3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-20 12:06:13', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('b043d17f7c7644e6ba7c1034874996d1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-28 23:48:51', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('b05e838a1cbb405aa2422d7ce172b40d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:31:14', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('b07d4cd276364e1dbdcf59009aaa6c59', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 01:31:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b0a79d4bde5c4b48b603e5b1d0ebc737', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-04-03 14:41:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b0c091f6be0f413d93214a4d80dd955e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b0e7c3a053214ca2936e8f7a854eff4c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-09 08:47:50', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('b1105dc5ed2d471d993b11dc1f332946', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-28 23:48:48', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b11d9bc7664c4155a6a8662089dbdd3d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=17', '2021-04-09 08:45:17', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('b1227ea529e74524928bc8d5072b7115', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-03-20 18:18:34', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('b13d26c35761426191bbe9d265f1bcc4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:40:26', 'http://localhost:8081/register?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('b1586ba8496742bbb2b739b5d83bb7f1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318005581175', '2021-02-20 12:03:50', 'http://localhost:8081/askList?questionTagId=32318015581178');
INSERT INTO `pv` VALUES ('b1707c4b92214de8917235f2cbbc753c', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/payment?paymentModule=5', '2020-04-01 19:18:13', 'http://localhost:8081/user/control/payment?paymentModule=5');
INSERT INTO `pv` VALUES ('b267964c31be4ce3bee44e40d30a88d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1abWx1WkZCaGMzTlhiM0prTDNOMFpYQXg', '2021-02-24 13:53:10', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1iRzluYVc0X2FuVnRjRlZ5YkQxYWJXeDFXa1pDYUdNelRsaGlNMHByVEROT01GcFlRWGc');
INSERT INTO `pv` VALUES ('b27c4b3ef48b4c14bf48e1b8cdae190a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:34:18', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('b2d5aeca392f4e06bdaae40e1637d8a4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:11:45', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('b2ef52d3404d4c59a340d79fc535541d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:44:55', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('b35c60f1055f406ab0c5f184515a1212', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:02:34', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('b3b01fab02ae40abaa9423a0b5b7b487', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-03-20 17:13:42', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('b3c2e8f3b09347e2bc326d5ec362cd41', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 12:46:50', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b3e5ffe8fb4d40c1bb9be95f4be3c57f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 13:45:13', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('b3f0e633cfd446a18728640b32e87125', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-01 13:32:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b447edb5d5094517a355ad8299e0360d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-04-03 14:51:12', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('b47b1ccdf7ac4a2e9624d264c9b3a4d8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2021-02-24 13:47:49', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('b4a0a526f17b412e940d8aaa1cd29975', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:43:14', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b4a3da621a0d4a688c4ee7d73447562a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:33:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b4fe7c9a921b4193b7500e376530aaac', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdD9xdWVzdGlvblRhZ0lkPTMyMzE4MDE1NTgxMTc4', '2021-02-20 12:03:59', 'http://localhost:8081/askList?questionTagId=32318015581178');
INSERT INTO `pv` VALUES ('b542b3b55f32411f89a6556697f3c1a2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-04-09 08:46:09', 'http://localhost:8081/user/control/home?userName=tim');
INSERT INTO `pv` VALUES ('b55ca4a7df194627ae5b72f8193429d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11&commentId=4', '2021-03-20 18:23:21', 'http://localhost:8081/comment_reply.htm?&commentId=4&timestamp=1616235801000');
INSERT INTO `pv` VALUES ('b56e7d2f1efc4217b69dc8ca9860ed15', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 22:19:37', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b5b0de2ea66045cba2ff3d4dbb86c2cd', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:26', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('b5e3b01a34744b0586ac23ebea52d9df', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318008181176', '2020-03-29 14:26:00', 'http://localhost:8081/askList?questionTagId=32318005581175');
INSERT INTO `pv` VALUES ('b5ee0e3f3d694652b87a17484186d569', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:43:47', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('b62b253cca1f437199975b14a44a31e2', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCard?membershipCardId=1', '2020-04-01 19:21:01', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('b645cf528cd64b40a8f220b2df89eb54', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 13:01:00', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b64ec976de164f88a283d1be20dd69d7', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:30:16', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('b69d7fa5ce3f4e28a9f5b05d2f16bef9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/point', '2020-03-29 14:33:57', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL3BvaW50');
INSERT INTO `pv` VALUES ('b6be5fe2612f47fdbfe043e45f8573a5', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 14:27:23', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('b6bf1a1688134f209fc964abbb0bdf14', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:49:31', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('b6da8a39a2ef43b3b2cb66e2c5a67f57', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:42:50', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('b77835753564468daa8f6281d05389c2', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/payment?paymentModule=5', '2020-04-01 19:18:01', 'http://localhost:8081/user/control/payment?paymentModule=5');
INSERT INTO `pv` VALUES ('b7ac12d4691d457fa27565e30bf42061', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 23:03:51', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('b7e36469258a468b8945560ada4e9032', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2021-02-24 14:40:50', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('b7eb0193ac444c0881f91f99d3712dad', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-24 16:27:31', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('b82b0113080441028f34ce1c9699173b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:42:46', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('b830398edc0048288f805666d583e4f5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:10:38', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('b845a6bac09a424193e9762c1e3467bc', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 13:24:17', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('b84d1947a2b046e189e262a3fe05c79c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2020-03-29 14:28:19', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('b8689cc5236e4bcf872f40d0f3c2ec7a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-03-20 17:13:43', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('b88280d9115e4ad7a1dc3baedb4d19da', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-03-31 23:56:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b8cda2c4fd6140f9868eac7ffdfeb681', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:15:17', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('b8d47b6f06904fedb6929e1602f52ce4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:38:03', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('b8ee5f08bb5a4a818e49aed918cfede8', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:32:25', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b9035fbcadd74be1bd010c158235a8c6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:08:46', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b91767c56aba48f8be8562f5d43aa9ad', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 14:27:23', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('b98ff3d1acc149cb9d5183f68203bbca', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-01 13:29:29', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('b99883bef5994fa5a9132c0f5b89d715', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318008181176', '2020-03-29 14:25:53', 'http://localhost:8081/askList?questionTagId=32318015581178');
INSERT INTO `pv` VALUES ('ba0fbc77bce544ab9bd4f1fd49b8747c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2020-03-29 13:24:12', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ba17a601134949dc820c06281084f52d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:03:11', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ba1a3f1bfd74427bacca106cb9122109', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-03-29 14:07:15', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('ba3046f0eda7462b9ba67b371cb7477d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 23:02:37', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('ba380d94e8424b4996df72b93fbf2978', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16', '2021-04-03 14:51:48', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('ba4689b64e884fbeb4f3d1405b67e52a', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 00:35:10', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ba4cbce43c4f42ad9c6aa70cca5316d2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 14:39:36', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('ba676ed3fc8b40f89efaa19b1431b1d1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-20 17:15:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ba6dc6cc81854f7eaf5c906b6bc9d47d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-08 22:45:37', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('ba834af854a942e4b40aa9aee267cf93', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-24 16:27:31', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('ba854f5d75ea4c1797ea626cdd7b7df4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:39:19', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('bae189049fff4ceb91d35f22fc8be9f9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:48:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('bb7a60a47ec04a17b6da35289a3ce9a3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-24 14:37:07', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('bb7c8916fadf4cdaae566d4473f9c28e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:44', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('bbb579d40bcc4d848487dc60aae5ecb4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-03-20 17:15:19', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('bbbcc9cdce764094968b4614309f7d84', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:42:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('bc0e0d40a73f4b3eabbd6f5c9c1e64a3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:30', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('bc0fe049c51a437299ae07f3353a1590', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:48:50', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('bc24d633481f4655b51ba6da5c9bcda3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-05 12:39:10', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('bc61d8d123874cb09ead903c52a1556c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 01:31:07', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('bc84253340624f5a9efd0d09c8dc074c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:45:13', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('bc90d6e789cd44beb0f54b9381370f7c', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 14:17:35', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('bc95fc842b12409d964ff1c746b8096e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:41:44', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('bccce25ecbec4f08a9883c129615fa95', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:48:48', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('bcee96028e934b96abc562fd959de861', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:05:00', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('bd14e2ab911f46f8afda1a3c88aa566e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 17:15:13', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('bd1926f5b00445a39b451f8c178c61ed', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:37:50', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('bd38f2113227417cb2e0a9fb443ea864', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=17', '2021-04-09 08:45:09', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('bd9ee8fc13ba4d19923924c74afbba4b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318017081179', '2020-03-29 14:25:58', 'http://localhost:8081/askList?questionTagId=32318015581178');
INSERT INTO `pv` VALUES ('bd9eed61e8874302928bb1662b08c447', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:03:14', 'http://localhost:8081/thread?topicId=9');
INSERT INTO `pv` VALUES ('bdc54f955b5e42adbdef01bf50bc404d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:44:37', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('bde4d0140e7341cb8e47f951d161adc8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 01:25:52', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('be194386b52e4e1a9433262b57d2a81e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:16:23', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('be3514c8d7864544b8818aab74af6405', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1iRzluYVc0X2FuVnRjRlZ5YkQxYWJXeDFXa1pDYUdNelRsaGlNMHByVEROT01GcFlRWGc', '2021-02-24 13:54:20', 'http://localhost:8081/login');
INSERT INTO `pv` VALUES ('bef959c28c614e98a87795921ea9ac02', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-08 22:45:33', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('bf15349606074fbba2237fa544e09077', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-03 13:58:12', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('bf48006aec03433bbe061fe8ac76f38b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:38:41', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('bf66500d59fb4fe4946e447dfe12b9b3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-03-29 14:06:55', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('bf76719186bb4443ac98135562481807', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=7', '2021-03-20 17:41:02', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('bfb8dad1b5da404d84a26ac0205fd260', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 14:38:29', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('bfe6fb79095f43ad94858f15432b6a79', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2020-04-01 19:21:52', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('c012b5b8b29943ea8e4ab182a5cf19bc', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:42:01', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c04d087271914e8f86e64020fb5b8a7f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=20', '2020-03-28 23:42:33', 'http://localhost:8081/askList?filterCondition=30');
INSERT INTO `pv` VALUES ('c05eb184ed6242f19d39471ee679d7d8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:30', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('c0a923da50564c92bb75545ab803c640', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-09 08:39:42', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c0bbecd108f742c48072ce94e4504a6c', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2020-04-01 19:22:25', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('c0fef4d49b8447b08527e93ad7a6ef8a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/systemNotifyList', '2021-04-03 13:45:10', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('c10a0bc6bb50412482c4d0a54e4a619d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-31 23:38:02', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('c117639affff42d18ba4f9152df1d13c', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-04-01 19:24:16', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('c11b9af72f4241a4824fd7a153a36743', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:47:06', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('c16d45f22c6b450abc9f60ba71d200f1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=6&answerId=4', '2021-02-20 12:08:02', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c1aff95aeb0b45d7b20d739be4c99397', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-01 00:01:31', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('c1d2cbdefc9c4f84aef866faf69e3fdf', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318028581181', '2020-03-29 14:25:57', 'http://localhost:8081/askList?questionTagId=32318025381180');
INSERT INTO `pv` VALUES ('c27972ef6a494ad0a005cbded7ebe276', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:43:19', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('c287856f9e0d4197a679a97ea63da30e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-02-24 14:44:47', 'http://localhost:8081/null?topicId=5');
INSERT INTO `pv` VALUES ('c2dcde9348b0440db66bf0e128945ecc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:45:54', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('c2e8fa2ea6d840aeaafc2165c7f6856d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:25:46', 'http://localhost:8081/thread?topicId=7');
INSERT INTO `pv` VALUES ('c31ff37b7f8846189f9d5b1c85f26cc2', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=5', '2020-03-29 14:33:20', 'http://localhost:8081/question?questionId=5');
INSERT INTO `pv` VALUES ('c354335be6ea402986afb2bdc5c60866', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 14:51:17', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('c3f9dd48ebce480c96d3aa21967bc061', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318034681186', '2020-03-29 14:27:29', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('c40cad9ea6504c18bc44c10ad6171ae8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=ZmluZFBhc3NXb3JkL3N0ZXAx', '2021-02-24 13:50:06', 'http://localhost:8081/register?jumpUrl=bG9naW4_anVtcFVybD1abWx1WkZCaGMzTlhiM0prTDNOMFpYQXg');
INSERT INTO `pv` VALUES ('c411a0dd86d54b6083a5e909d2d7d54d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-03-31 23:44:31', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('c453a6f0dcc945eb8063698f0aeb7d48', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/systemNotifyList', '2020-04-01 19:22:49', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('c47d3c9696414eacb3664ce687bb40f4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=17', '2021-04-03 14:59:24', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('c47e27e622494f1abf49461925ede248', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerList', '2020-04-01 19:18:22', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('c493888661e04682a4692c8efe6e54ae', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:54:18', 'http://localhost:8081/thread?topicId=8');
INSERT INTO `pv` VALUES ('c49a5db15fa6488399e5460f560052dd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTY', '2021-04-08 22:49:11', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c4bf64179a334022ae2a4913f27faa89', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-03 14:44:41', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('c4d55896448b478aa299e23cd055352e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:46:43', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('c53b784d13154ec3a2697b052472ffcd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 14:38:06', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c560f0cb447c4169a14aa8941e6fd63d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-20 12:05:22', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('c5bd94213baf4c0c8827b6e312002a80', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-08 22:46:03', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('c5e17f6decda4ded807d31116df08c6c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:41:49', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('c6283d2981244f9b82713dcc98500107', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCard?membershipCardId=1', '2020-04-01 19:17:15', 'http://localhost:8081/login?jumpUrl=bWVtYmVyc2hpcENhcmQ_bWVtYmVyc2hpcENhcmRJZD0x');
INSERT INTO `pv` VALUES ('c63dad6f1b224d9d9263953f3c6bd784', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 11:33:31', 'http://localhost:8080/');
INSERT INTO `pv` VALUES ('c649ef1e0e8f4c55a5c2bfe8a9adfac9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:07:19', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c69e44836717418eace1355f04431fb0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 12:58:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c6c202ada31a4d678b7015d0af61e47d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-04-09 08:46:45', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom');
INSERT INTO `pv` VALUES ('c6ffa425139d4085bc50659efe1c7167', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515296854767', '2021-04-08 22:49:36', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('c70304989c1f407db3e6c9cd425abb34', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-08 23:04:24', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('c7049c16d7ba4a548c2093e0a4ccea5a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-28 23:48:39', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c73d934166a14fc49d850c82f020888c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:43:04', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('c75cf52a7fb64216ad8ea400e24fb01c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 13:58:13', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('c75e7efb2fbf4c3f8801e0f0d706feff', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 23:49:07', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('c77f09fa6c6f43248c3cc69eba159f47', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 13:24:09', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('c7bd008051964430bc939262b81634ef', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tom', '2021-02-24 14:44:12', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('c7f0b6dca7494328b9f0b1d3aa5baa6a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-20 12:06:15', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('c7f48d4c192b46aab96d9cb5928374bb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19&commentId=8', '2021-04-08 23:05:05', 'http://localhost:8081/comment_reply.htm?&commentId=8&timestamp=1617894305085');
INSERT INTO `pv` VALUES ('c7fe901167f94ac0887f5829bc636650', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:41:08', 'http://localhost:8081/?tagId=35515300054769');
INSERT INTO `pv` VALUES ('c823418a311b4c6d907675d707e49c00', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 14:02:37', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c825ab9ab4864a89a98aab4cb2eb4ada', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 14:38:52', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('c83434cc92af403d9feb00d9840c7353', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-02-24 16:28:29', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('c85175a71b0940398dae1af25d8e2945', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:47:05', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('c87a5eb97b7d44cb8881218ef19bbc01', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 22:19:50', 'http://localhost:8081/register?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('c8900be5f976461db484d255bed7bc4f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:34:24', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('c89e715824d348f093a87ef39170253f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E8%BD%A6%E5%8F%AA', '2020-03-29 00:52:42', 'http://localhost:8081/search?keyword=%E4%BB%8E');
INSERT INTO `pv` VALUES ('c8a4ff6f23e947189aff45a9065605a3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-24 16:27:38', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('c8fabaf87c334bd69e80422c7f76f7d0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-02-24 14:43:03', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('c9015a3fbd944a8cafe8cf397b5973d9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:16:45', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('c908cd7e626b4f308dc9e6b66d4a0946', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-05 19:11:39', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA');
INSERT INTO `pv` VALUES ('c91e9f7c74b244048052d4368bdd2512', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 14:06:28', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c926dc4096d84f289eb6e5bdfa2e20ab', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:58:06', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('c92bc389d30645b3ab0141aae5c890bf', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:44', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('c931495319fc4f8c8d21a050cf633a87', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:16:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('c954e0b87e8f473999380e813af617ee', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:41:46', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('c997d155cc1d4a218505733f421b99a3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-03-29 14:36:03', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('c9e3b94e909e4207989f0509da2a2cb8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-09 08:47:08', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ca0cfc03f78645e99b4746d04a007531', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTk', '2021-04-08 23:04:50', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('ca165fbf232145179a1afdba98bc8e32', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:25:46', 'http://localhost:8081/askList?questionTagId=32317791871179');
INSERT INTO `pv` VALUES ('ca4563a5edee417ba4fae77f5c00875f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2020-03-29 00:43:33', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('ca7a34433eab4043bf03b50e0aa13425', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2020-03-28 23:48:35', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('cb3f705d04fe41cabc725bca8b9eb145', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:43:04', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('cb5b2d7fcd9640328866c6e25fbb6a82', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home?userName=tim', '2021-04-09 08:45:59', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('cb7633aa4bae453fbf0d7951aa047d89', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:48:00', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('cb91bd770f794a6790e96d0f66d05d49', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=', '2020-03-29 00:43:19', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('cba5977645ae47c7861f689d6a694ebe', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-09 08:47:25', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('cba92cd3599e48c79dd31e9ec49e2169', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 14:43:27', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('cc072926e7a4450e8f950b18d5015f1b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-03-20 18:16:18', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('cc344a9d83cd408e927fb1ad6763fd9e', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-04-01 19:23:17', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('cc63e120a58549c4b6cc1968407c6ad9', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:33', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ccda3b7774a848f59f0f0b563bb3f86b', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-28 23:05:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ccf6f7d51f0e4e6eb9097caa9c3b0ec4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2020-03-29 01:24:48', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('cd0b5a65fe5a4d9487fe64b8c3726fbb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 14:52:37', 'http://localhost:8081/?tagId=35515298054768');
INSERT INTO `pv` VALUES ('cd315e5b996d4c21807bea465d374b49', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:40:28', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('cda9228dbe1a44fe96be338537f8acfb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2020-03-29 14:25:56', 'http://localhost:8081/askList?questionTagId=32318028581181');
INSERT INTO `pv` VALUES ('cde25cb9573d4809b276fd3738f229af', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/membershipCardOrderList', '2020-04-01 19:21:45', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ce46c6384a50404b9ca98271fd696cb4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU', '2021-04-09 08:44:49', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('ce9ebcbd3ff3421b9296854717e4e85d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-20 17:15:17', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('cef138643169419d86b5232f34295b44', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tom', '2021-02-24 14:44:38', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('cef91aeebdec4625b37fb2f3557af28b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:38:12', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('cefbe010e3e84bb192948b831857c076', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 16:26:46', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('cf231ac11b8f4131b1cf8609c2fca4d3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317952481172', '2021-02-20 12:03:48', 'http://localhost:8081/askList?questionTagId=32317954181173');
INSERT INTO `pv` VALUES ('cf3ca3bdf02547d7b0f4815a96b2b78f', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-04-01 19:18:28', 'http://localhost:8081/membershipCard?membershipCardId=1');
INSERT INTO `pv` VALUES ('cf40896501524805be0cdd182eee2802', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-03-31 23:19:08', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('cfc70e55c1b44f3b8e5194a778c62d73', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-03-20 17:54:23', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('cfd1b1aed67d468b94eed3c6ff6211a1', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-04-01 19:21:05', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('cfd56bdef6dc4194993106c23470e7e7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:15:12', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('cffc2c9255ea43789d695d8b234740c9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-03-29 13:24:11', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('d0191a4d9f92479296c3dd251e1482b7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 13:47:57', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('d0771eb2cbf0457396d643a0a1ef8f4f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 14:59:29', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('d08e543627e64922b671be53363cea26', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:07:55', 'http://localhost:8081/feedback');
INSERT INTO `pv` VALUES ('d0957053d0c34f0d804f2c26097aefee', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:35:14', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('d0b3acd176d540d8b0b13481732025a1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 01:25:54', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('d0bca93d63d440a6bcb94285fa13054f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2021-04-03 13:57:09', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('d0f08b9cb80748f6bfbf7f74e18a9d16', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:40:32', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('d1364c2418f849b59740a27ad0c6e739', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2021-04-03 13:57:53', 'http://localhost:8081/user/control/topicList');
INSERT INTO `pv` VALUES ('d18861bec88b4b6c9863b442fa9cb33f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=20', '2020-03-29 01:26:01', 'http://localhost:8081/askList?filterCondition=30');
INSERT INTO `pv` VALUES ('d1d99d4b3bb44242a099c690306e7657', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16', '2021-04-03 14:50:44', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTY');
INSERT INTO `pv` VALUES ('d2a6a3e0af7d485f875fa2cd31bc44b2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2021-04-03 13:58:04', 'http://localhost:8081/user/control/answerList');
INSERT INTO `pv` VALUES ('d337c925c5dd44d8ace40afb5b4d9e34', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=17', '2021-04-03 14:59:18', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTc');
INSERT INTO `pv` VALUES ('d34990139f5b45539e3afb1db828fc04', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:13:48', 'http://localhost:8081/thread?topicId=10');
INSERT INTO `pv` VALUES ('d3ab20318af64fa1914911d6398a4452', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-24 13:45:51', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('d3ae9208697e4390a1f6e27fcbe2073d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:47:03', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('d43c4b31bafa4613b13d8cb5413ba9d7', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-02-20 12:06:11', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('d44d56af2ce947778d888f4d54ad659a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-04-09 08:46:42', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('d46dadd7a49747e685af0c6ef6405b4e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2020-03-29 13:44:25', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('d47fd779654646e1b72f370f9b3ae48b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 13:42:58', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('d485df5e39f24b358d1a933b7e00bb59', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/replyList', '2020-04-01 19:22:23', 'http://localhost:8081/user/control/questionList');
INSERT INTO `pv` VALUES ('d4a67440feac42f08228aa45f1413ba4', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-04-07 20:32:11', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('d52683911ed3436ab6eaf34ec85ec078', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:37:02', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('d5413826594b4a46b3fb466bade42de4', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 01:16:08', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('d5b31da4f99d47f9a3e11cebeebfdeaa', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerList', '2020-03-29 00:43:31', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('d5bdc2f9c5ef42f485d16c81f1bde9c4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-02-24 13:47:51', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('d626828ed98747aca59900f9c6a870a8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:14:10', 'http://localhost:8081/thread?topicId=10');
INSERT INTO `pv` VALUES ('d643adac2572488db2141f1ce1f6bb28', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-09 08:44:53', 'http://localhost:8081/thread?topicId=17');
INSERT INTO `pv` VALUES ('d65545570622464cab49e7e38660a645', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:18:39', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('d68b53ef45f04bdfb5797e49c5fb6000', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2020-03-29 14:28:02', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('d6a8d61b726a4f94a15afc79295e4bf1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 14:06:54', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('d6b12ab00267417eb945cf9ec7e5de2c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-20 12:06:20', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('d704deb571c14759aac5bc96013e4875', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E8%BF%98%E4%B8%8D', '2020-03-29 00:51:27', 'http://localhost:8081/search?keyword=%E4%BB%80%E4%B9%88');
INSERT INTO `pv` VALUES ('d705e8bfe6194ffaafdf50490526b735', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:16:46', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('d72740394f5d42ce908b5a74abff1a8d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2020-03-29 00:43:26', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('d78325a621634811b40014f962b4fc9e', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/systemNotifyList', '2020-04-01 19:22:56', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('d7848b80b7634866abf090e61d99ba88', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=3', '2021-02-20 12:08:24', 'http://localhost:8081/thread?topicId=3');
INSERT INTO `pv` VALUES ('d797df14eb5549378ec96ecb693d2fe3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:30:13', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('d7a18c7e8fd94a72b838c0f84bf36599', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzEwNDI2NzYx', '2021-03-31 23:30:11', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('d7d9d7c3ac0843db9546e4122406109e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=17', '2021-04-09 08:45:27', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=');
INSERT INTO `pv` VALUES ('d8211fe7a8b74f5a8cff4fe241368122', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:58:47', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('d83171f934d948a89302ae60a95d631d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2021-02-24 14:37:11', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('d85397caae70429dbe2705b14e61529e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-04-03 13:58:17', 'http://localhost:8081/user/control/remindList');
INSERT INTO `pv` VALUES ('d9202b33f0fb4933a0d242f157abe0db', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%BB%80%E4%B9%88', '2020-03-29 00:51:32', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('d94daf64d4e54c068a240b35477a6210', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-03-29 13:44:22', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('d9f4229f8529430f851e43fb83d02e60', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:01:09', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('da070b4fa3794c078a5693d69884a2ea', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:38:36', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('da5bf30b69674c9f870313fc7397179d', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2020-04-01 19:22:26', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('da6d6fa5eaed4bd18835ef12ee3108d8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:03:25', 'http://localhost:8081/thread?topicId=19');
INSERT INTO `pv` VALUES ('da97680bb9df43f496e476acd51f38d6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-28 23:02:29', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('da976c83c7a14aee9dd82759a241b2be', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:44:57', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('db5617e5e49642f188b2be869f001827', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=6', '2021-02-24 14:42:11', 'http://localhost:8081/question?questionId=6');
INSERT INTO `pv` VALUES ('db86db12d6354a3da7eb8b220cd1edd2', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2020-03-29 14:28:10', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('dba2260bc8d148b6aa4eb6dbd0b0f8f5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:19:12', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('dc22775b3603437fbe2bd2f11f650119', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 13:44:19', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('dc242793eb904f81a02072b8ba0636e0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU_dXNlck5hbWU9YWRtaW4', '2021-02-24 13:49:08', 'http://localhost:8081/findPassWord/step1');
INSERT INTO `pv` VALUES ('dc771270dfbf48f789335ffc64e9b9df', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-03-31 23:18:33', 'http://localhost:8081/user/control/membershipCardOrderList');
INSERT INTO `pv` VALUES ('dcb72c6722b14036b0c72dc8e837a93c', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-03 12:41:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('dccab82317614422bdca19b0c0f050c6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-02-24 13:47:42', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('dce8c9ae954b47d69b3760dba48d070a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-02-24 16:26:48', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('dcf5ab22bc8c4e48b3a847dfc7cb06ca', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:35:19', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('dcfaab501a7f4fb09df83f647af6fe3e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 14:01:18', 'http://localhost:8081/user/control/replyList');
INSERT INTO `pv` VALUES ('dd397525a58e430a9fb8c773659f97c1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:35:10', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('dd890249af2647b49b9bd3984f39fdd1', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 00:36:09', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('de306b086cf34f8f841bd55621d2fa8b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-01 00:01:33', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('de309cde91744b24ba811cda1b349c22', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:48', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('de87ab2817d04d99a76e5c4372aeda68', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 00:38:09', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('dec3c503b8164129a90e001b8f7999c6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:18:25', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('df087bff532d4b6c8b472b1a64a43043', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2021-03-20 17:15:21', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('df65078e81f444edb5c2b4b41d318dfd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 13:44:23', 'http://localhost:8081/user/control/userDynamicList');
INSERT INTO `pv` VALUES ('df734faf33ea4822a3f9024729ae7369', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-09 08:44:17', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('df7a4cb5b49449a5a4f7ecd50aabd0cc', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-04-03 14:59:34', 'http://localhost:8081/thread?topicId=16&commentId=7');
INSERT INTO `pv` VALUES ('dffbd9b690e1427e94b39a7f73658974', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:01:09', 'http://localhost:8081/null?topicId=14');
INSERT INTO `pv` VALUES ('e0081aab69404d7ebf5e2185a5320d11', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2020-03-29 14:35:23', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('e03c4c612af344d582d4b95a26d33cf6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 23:48:38', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('e04943b5a10d470db5d89a498ef0966a', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-01 13:29:31', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e08e3d6d746643018c19729a2ef5dea2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 14:38:30', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('e0ded6a29ad1446ba5141268e193a8d9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2020-03-29 14:25:34', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e0f4e02277ea40739ec33bbbc22343a5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:44:58', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('e102d5e093864b6b9c98039521104e9c', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 12:15:33', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e11a1a851dea4b8187bf8815eb3ba57d', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-04-01 19:17:01', 'http://localhost:8081/membershipCard?membershipCardId=1');
INSERT INTO `pv` VALUES ('e175c46c78474665bb8846dd8f625846', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzQyODI2NzYy', '2021-04-08 22:49:29', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('e1776713493945a19942190d04d3c0da', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2020-03-29 14:36:12', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('e1ae6272dc12443f9e10cb9342fd1351', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-03 14:41:28', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('e1af530b0be24749a37df16eac483871', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317745626764', '2021-02-20 12:05:21', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('e1e4e0db45454b4eb04e5bd619628fa4', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:37:43', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('e1f8fd14f6664266a58320e928e38066', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 12:42:49', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('e200f0be36fd453287e17cf0126488b9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2020-03-29 00:42:56', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('e22180c4c5004fff89644de9030392d3', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 14:51:06', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('e25a8ecdd2a94507999c015c101decc1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-24 16:26:47', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('e29548cfd8464cdbb8c233046c7e5695', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/commentList', '2021-04-03 13:43:57', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('e2ca180de15b4c42b5758a45db2fac72', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:45:23', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('e2cd035e0d55449c9eb381f4e42c4e65', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2020-03-29 14:36:13', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e2d9b134e44941d2ad594ed49219e1eb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/topicList', '2020-03-29 01:25:42', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e2db1d6d4a0c42f392e0d1295381fa60', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 14:30:04', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e2f90b0896134db19bb39b24dce3275f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=aW5kZXg', '2021-04-09 08:44:33', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e317c1b893144588badc9f54aee44bea', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:13:14', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('e322c61051974c439306cc7f01436090', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 17:21:23', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('e33e9f47c8264cf2adfec02aa0f9d0a8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2021-03-20 17:15:21', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('e350bc95c40a4a01aa68e816c38d7fc6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2020-03-29 00:43:24', 'http://localhost:8081/user/control/followerList');
INSERT INTO `pv` VALUES ('e3c9b6d3a2a24941955f0c0dd66b8eac', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=2', '2020-03-29 00:44:18', 'http://localhost:8081/search?keyword=%E7%9D%A1');
INSERT INTO `pv` VALUES ('e3cc712cc96043b599a59865db2aa54c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:37:35', 'http://localhost:8081/search?keyword=%E4%B8%8D%E7%9D%A1');
INSERT INTO `pv` VALUES ('e40a2845de0b4d419d6209c93336b8aa', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-08 23:03:40', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTk');
INSERT INTO `pv` VALUES ('e4207ad2da4d4d7cb07fd0c286f53090', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2020-03-29 00:43:36', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('e469eb86fa904c4b8d6d02ba82ece102', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-20 12:07:11', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e49394e5d1b641f39f44ff7ddeb8bffb', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 22:49:36', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('e4c5634a71194677a643cb877f5b7795', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 18:10:23', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e50ff3bd52e248e8acd85a591d9aa384', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:34:29', 'http://localhost:8081/null?topicId=14');
INSERT INTO `pv` VALUES ('e5513b899eb34f2389c6c43d45c5faff', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-03-20 17:20:10', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e5581e2cd3ae42a7a7a3dd3e8cae4015', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 14:38:44', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('e558ecba569048ada51348a42ce7443b', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/balance', '2020-04-01 19:17:57', 'http://localhost:8081/user/control/payment?paymentModule=5');
INSERT INTO `pv` VALUES ('e5d313ec51b442e5b038e07596095957', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 22:43:02', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('e6494c2f63e94087b6b19f00f7bf8bba', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:54', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('e67628414c0c466da5e4ea286bc3410c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:32:37', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e6e03f72fa7942a0a34f379424b75c3b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=16&commentId=7', '2021-04-03 14:59:39', 'http://localhost:8081/comment_reply.htm?&commentId=7&timestamp=1617433178976');
INSERT INTO `pv` VALUES ('e74515aa6084439883f4bfa4c588c364', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 23:16:49', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e74ceb8458ec4fe59edec4ff7c4f5dd6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E7%9D%A1', '2020-03-29 00:51:10', 'http://localhost:8081/search?keyword=%E4%B8%BA%E4%BB%80%E4%B9%88');
INSERT INTO `pv` VALUES ('e7d8ca4681874c66928041fb26f36bfd', 'Chrome 63 63.0.3239.132', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 00:35:14', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e8112a19af6b4fc1a865e7f2eaaf68a8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:13:34', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('e819cdc4975a4a2d89ef06a5f1a74a7d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 00:41:47', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e833ba25c6e34201ae29b6034f2ac30a', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:02:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e841351082f849bbbd335a1d4bb83b50', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-03-20 17:02:36', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e8bdb410144c4215b9c7e88adf652e16', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-03 14:38:11', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('e8df60e9943a4a5299eb200c4822053f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-20 12:07:16', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzQ2OTI2NzY1');
INSERT INTO `pv` VALUES ('e93172e5774147009f7df872b055f8dd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-05 21:52:06', 'http://localhost:8081/search?keyword=%E6%89%8B%E6%9C%BA');
INSERT INTO `pv` VALUES ('e934f1ff19654f6093e57422134aba6a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-02-24 14:39:41', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('e93ca5a912e846afaacb196dc1f4b714', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=8', '2021-03-20 18:22:41', 'http://localhost:8081/login?jumpUrl=cXVlc3Rpb24_cXVlc3Rpb25JZD04');
INSERT INTO `pv` VALUES ('e97548e60a554511bd965c5af257142e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317955281174', '2020-03-29 14:25:51', 'http://localhost:8081/askList?questionTagId=32318005581175');
INSERT INTO `pv` VALUES ('e986974dc3ff455a92b19bea7aa7be42', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:38', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('e990ef71e4c14ba8b4d92e155af0d313', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 00:37:46', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('e9b2db42aa104670bed8c55238250014', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:13:09', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('e9e5e8d3e1a64f8b9348b6dae6ba0b01', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 21:39:38', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ea4f84ee3a384c24ba8121878fd605b7', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=4', '2020-03-29 14:30:56', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('ea9dbef1f75b41a98cb04f99c98aa889', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/membershipCardOrderList', '2021-04-03 13:58:19', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('eaf81e6a81ea484d86d4064bb0374b88', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-08 23:02:31', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('eb1b4b85babd47ceb43f9e220020342b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-02-24 16:27:29', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('eb9c428d51fb4326833ad1e8c596995b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 13:35:08', 'http://localhost:8081/thread?topicId=14');
INSERT INTO `pv` VALUES ('eba25afed0f44ca4883bc2f1de54a78c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=30', '2020-03-29 01:26:01', 'http://localhost:8081/askList?filterCondition=40');
INSERT INTO `pv` VALUES ('ebb069efc6de4123a7756b6d4d5914bd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:48:32', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('ebe8fc10ed814a4bbc93c08cd14e6bda', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:50:56', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('ec02d46ab6d44f0ab5f93d2e6da04ba6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2020-03-29 14:35:39', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('ec2eca62f19c4dd8991c3035102727f5', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-02-22 12:41:57', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ec4ad8e6b2e44905b524ec4eb358a9b0', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2021-02-20 12:05:20', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('ec6886cab4514bbab238535de403d64f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-02-20 12:07:44', 'http://localhost:8081/user/control/home?userName=tim');
INSERT INTO `pv` VALUES ('ec85f047713b48c28dcdd5ee3ecbfa53', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzEwNDI2NzYx', '2021-03-31 23:23:14', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ecd25a12ed3649d5bc3706d298bfa8da', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim', '2021-04-09 08:46:28', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('ed193ba30be8496cbca2ddace3d61bda', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU', '2021-02-24 14:43:11', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('ed1c9ba46e2745b0b2aaa7308080d5dc', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 00:37:38', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('ed20e4c0ccea41fcb4a87654227c63cb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-03-29 14:25:27', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('ed370c1ebc514590bb40fa99119c81e0', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:37:56', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('ed5fc931862842ffb64336fe7a0e300e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:18:00', 'http://localhost:8081/login?jumpUrl=P3RhZ0lkPTMyMzE3NzEwNDI2NzYx');
INSERT INTO `pv` VALUES ('ed6d68a967fa4bf784fe09727667b62f', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-04-03 13:58:18', 'http://localhost:8081/user/control/systemNotifyList');
INSERT INTO `pv` VALUES ('ed845a21f6734c418e9aa06c72adcca5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-31 23:35:43', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('eddcd83e22ca4cbb810ae646638ac05a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followList', '2021-03-31 23:18:31', 'http://localhost:8081/user/control/privateMessageList');
INSERT INTO `pv` VALUES ('ede783aef74e4e88a29a73c5ca2b6252', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-03-29 13:44:23', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('edefbc4aec994d28a8410e8d05de7d5f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317746926765', '2020-03-29 13:24:20', 'http://localhost:8081/?tagId=32317747826766');
INSERT INTO `pv` VALUES ('ee392bda7fba4177b1908e99d46ab3a4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:44:57', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('ee8635b54a854f01bb6637084207c1ed', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=35515298054768', '2021-04-03 14:41:02', 'http://localhost:8081/?tagId=35515300054769');
INSERT INTO `pv` VALUES ('eec1925a6d4a4ba3bb074ccedcb0b5f4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:44:51', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('eef7e0121eaa4509905f9d4f09adf697', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%BB%8E%E8%BD%A6', '2020-03-29 00:52:25', 'http://localhost:8081/search?keyword=%E5%8F%AA%E9%9C%80');
INSERT INTO `pv` VALUES ('ef24404b156e46e3a6b0329e7b6e242b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/privateMessageList', '2021-02-24 16:27:48', 'http://localhost:8081/user/control/privateMessageChatList?friendUserName=tim');
INSERT INTO `pv` VALUES ('ef5f8ca4dd2e43c688f7eb268ac7d018', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-24 14:38:29', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('efb7218ecc834750890a8bc97e6b8299', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-02-22 12:39:14', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('efbb346ce66349c3a2d684f4b9a8c297', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E9%98%BF%E8%A5%BF%E5%90%A7', '2020-03-29 00:50:30', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU');
INSERT INTO `pv` VALUES ('efbff36e65494be2b5f25780aa249b46', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:42:14', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('f01142edd2d54401aeaa3d8aa4889d0d', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-04-01 19:17:55', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('f0303e6160aa4c11864df9c9a86c5627', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:19:45', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('f06b6924910848dc8a60b2dbd58761d2', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:13:45', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('f0baa50e20c1498f9d2f1fba0f99ccd0', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/favoriteList', '2020-03-29 14:28:14', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('f0fcb4ddb00347e2ba3f16d153350c9a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/remindList', '2021-02-24 14:44:54', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('f14384c2ef4b466797c63c7727ed1d86', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:37:47', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('f150d6e09049456e83fa1a508e7b4d16', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:52:04', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('f161dab8e5ee49ada0231a2cb08c178e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317744226763', '2020-03-29 14:36:11', 'http://localhost:8081/?tagId=32317745626764');
INSERT INTO `pv` VALUES ('f17a6b3d0d4241fdb1b6f4d7d2fdeae4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317954181173', '2021-02-24 16:28:34', 'http://localhost:8081/askList?questionTagId=32317952481172');
INSERT INTO `pv` VALUES ('f17d5d6e5a174a7c991d51d839d31898', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/addQuestion', '2020-03-29 00:39:00', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('f1ac8db4a5bd4ea0bc67236c96958cdf', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 23:05:21', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f1c5456bf50f40489fe4e546f81af786', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2020-04-01 19:16:45', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f1db9666edcf490097af7cabf3780d73', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318005581175', '2020-03-29 14:25:52', 'http://localhost:8081/askList?questionTagId=32318008181176');
INSERT INTO `pv` VALUES ('f20f37d9e7214c35afd2e6a7320eba19', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-03-20 17:13:19', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('f215f873b2ba408e9470cfc0054bd5d6', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-03 14:40:58', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('f224c14bccf34149b953e2799ba3cbca', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2021-03-31 23:08:32', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f2569b8ba4bb4883a98ff578e9b26c9e', 'Internet Explorer 11 11.0', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-05 18:59:28', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f26a509bdbb5468aae8201b6d75d9be8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/membershipCardOrderList', '2020-03-29 14:28:23', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('f274d3c76bb5427fb9369265763f3a19', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-20 17:13:45', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('f29305c98eb1433a811aff51d8373a17', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-03-20 17:11:22', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f2cd1e654367435196e6841e7e4c64f2', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU', '2020-03-29 00:50:35', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('f2efb30f7ac7460ebe33b02c6f636074', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-07 20:37:51', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('f315b22398e54e318c0b9a19ba668dbc', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:21:22', 'http://localhost:8081/?tagId=32317748626767');
INSERT INTO `pv` VALUES ('f31fe6da10564fb9a7f20a23639d56ac', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-04-01 19:20:43', 'http://localhost:8081/membershipCard?membershipCardId=1');
INSERT INTO `pv` VALUES ('f325320673274019a72e22b805a8f4ae', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=40', '2020-03-28 23:44:57', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('f3269f5f80cf48099b61824970270bcd', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=11', '2021-03-20 18:19:05', 'http://localhost:8081/thread?topicId=11');
INSERT INTO `pv` VALUES ('f382f3ce92d3436d8505f18c32be08be', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/questionList', '2020-03-29 14:32:22', 'http://localhost:8081/question?questionId=4');
INSERT INTO `pv` VALUES ('f3a73b2e923c4c719a78b1f97b9d9bae', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-31 23:34:48', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('f3c20a3573094cecb31de08067e6244b', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2020-03-29 13:24:20', 'http://localhost:8081/?tagId=32317748626768');
INSERT INTO `pv` VALUES ('f40f1588ee7a4111ae146581adeb8c83', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-02-24 14:37:11', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('f41dbe66fa9d4be4828441c6f61d3606', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-29 14:06:24', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f4a1551f73e340d2933168dc7df1d5b1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2021-04-03 13:01:06', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f4c75530a702439299b35c9a5878ad2d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-03-20 18:16:23', 'http://localhost:8081/null?topicId=11');
INSERT INTO `pv` VALUES ('f4e345f1c4d14b35bbecd97282a13d5d', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:31:11', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('f5325624660e480d8a5e58094e693376', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerReplyList', '2021-04-08 22:45:59', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('f5689949e75a47d792a9e37eaa19b86c', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 14:27:20', 'http://localhost:8081/membershipCard?membershipCardId=1');
INSERT INTO `pv` VALUES ('f5925f06b5e74888923fed260407dd24', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=14', '2021-04-03 13:42:34', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTQ');
INSERT INTO `pv` VALUES ('f5b49a7f56474336950d6607a8541f36', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:47:08', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('f5bd3111b1614cc58f0c171ae42ec87c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-03 14:50:26', 'http://localhost:8081/thread?topicId=16');
INSERT INTO `pv` VALUES ('f601213f31f542d38464479872c9b3d4', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?filterCondition=20', '2021-03-20 17:14:07', 'http://localhost:8081/askList?filterCondition=30');
INSERT INTO `pv` VALUES ('f64c821d9df545949a0d3f840e268ca8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-08 23:04:44', 'http://localhost:8081/login?jumpUrl=dGhyZWFkP3RvcGljSWQ9MTk');
INSERT INTO `pv` VALUES ('f6558bd8ae2e49a9bd32514ba13a5c4f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/control/center/admin.htm', '2020-03-29 14:03:49', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f69f4feac8624b2285d0655b3483e5f1', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-07 20:34:45', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f6a999f895864537b6690952f4b7769a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%8D%E7%9D%A1', '2020-03-29 00:51:22', 'http://localhost:8081/search?keyword=%E8%BF%98%E4%B8%8D');
INSERT INTO `pv` VALUES ('f6acbfe5928d4c458fe16b76814b0fce', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626767', '2021-02-24 14:39:48', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('f6d8619635264c3695861c908adc720e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:34:26', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('f7397ffa87404339812a33dd154b02e8', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 00:39:49', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('f770f1014c524797aa09e425ee0b47a9', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:38:58', 'http://localhost:8081/user/addQuestion');
INSERT INTO `pv` VALUES ('f78392cce56642198d9a5cfdf3364b37', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-04-01 00:01:21', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('f7992e49954f466c8b0d63a24f37de0d', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-20 17:13:48', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('f79ecffac7c44d1795f09175db39261e', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-08 22:48:41', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('f7a19963ae7e414bae29aacedabce240', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-31 23:36:34', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('f7c17b3474584dbf914101c92f570680', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:25:24', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('f7cb10157d8b4654ade1346a91bbd750', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-03-29 14:35:28', 'http://localhost:8081/user/control/home');
INSERT INTO `pv` VALUES ('f8008208876848dc971f5a2f05f18e58', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32318015581178', '2021-02-20 12:03:51', 'http://localhost:8081/login?jumpUrl=YXNrTGlzdD9xdWVzdGlvblRhZ0lkPTMyMzE4MDE1NTgxMTc4');
INSERT INTO `pv` VALUES ('f81b5600ed0d450c8fa78f3e1bc9b565', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-03-31 23:36:36', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('f82ab04aaa894f97a1004a1ebee4ae7f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/search?keyword=%E4%B8%BA', '2020-03-29 00:52:05', 'http://localhost:8081/search?keyword=%E4%B8%BA');
INSERT INTO `pv` VALUES ('f8e97da9526e4191b9a88b0b113f6c9b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-03-20 17:25:43', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('f92f1968b17a43ba8b0dcfbad71156d6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 00:39:06', 'http://localhost:8081/question?questionId=2');
INSERT INTO `pv` VALUES ('f9365324183849bdb511c10a12cb2d19', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:37:28', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('f9419801be9341d7b02a4f63d7658e11', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-04-03 14:38:10', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('f95151ee66754754b619a8afff1cf8a6', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-28 23:42:30', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('f960e4624edd4feea53d199476fbf157', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList?questionTagId=32317794071180', '2021-02-20 12:03:47', 'http://localhost:8081/askList?questionTagId=32317952481172');
INSERT INTO `pv` VALUES ('f97376952d3d483db0a0a4e1ca843d71', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2020-03-29 14:35:22', 'http://localhost:8081/user/control/commentList');
INSERT INTO `pv` VALUES ('f984cd6a98ba451890cea702cb6d22ae', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=cmVnaXN0ZXI_anVtcFVybD1iRzluYVc0X2FuVnRjRlZ5YkQxYWJXeDFXa1pDYUdNelRsaGlNMHByVEROT01GcFlRWGc', '2021-02-24 14:17:15', 'http://localhost:8081/login');
INSERT INTO `pv` VALUES ('f9d9ae065f0b462eb8434183fbf151bb', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/answerReplyList', '2020-03-29 14:28:13', 'http://localhost:8081/user/control/favoriteList');
INSERT INTO `pv` VALUES ('f9f2b82492cb460c847ea4f6d028d936', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', null, '2021-04-01 00:01:18', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('fa3afa4d56064be0b353ba5422de32be', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 23:01:45', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('fa53d576d94f4ae5a662836c20b29193', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2021-04-03 14:41:07', 'http://localhost:8081/?tagId=35515296854767');
INSERT INTO `pv` VALUES ('fa5cf2715e1448399bc5d08d822ab871', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/followerList', '2020-04-01 19:22:59', 'http://localhost:8081/user/control/followList');
INSERT INTO `pv` VALUES ('fa6e22ddf2f044c78514f9a458c46d90', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2020-03-29 14:35:13', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('fa9befae52094c5a914ea6d46c9a6c23', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317748626768', '2021-02-24 16:26:50', 'http://localhost:8081/?tagId=32317749526769');
INSERT INTO `pv` VALUES ('fb3bf0eef0064c11929adae34ed94fa3', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 01:24:45', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('fb83585a28c04655b5276b25dcca3838', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2020-03-29 14:25:36', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('fc09e2c2ffed483db7d8202494d00c5a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2020-03-29 00:37:55', 'http://localhost:8081/membershipCardList');
INSERT INTO `pv` VALUES ('fc5d22fb75f94b3fb0e12c8cb5c6e91f', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/userDynamicList', '2020-03-29 01:25:57', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('fc6bf3609dfd45deaf0d90aea89ebc82', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2020-03-29 13:24:10', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('fc70b896aaaa4e10a50c1d11bc0e714b', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-02-20 12:03:40', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('fce31c2ff5d245ed8b75549b92216e78', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/askList', '2021-04-03 14:38:13', 'http://localhost:8081/index');
INSERT INTO `pv` VALUES ('fceae6d7fc8c400cb94d0a8dcdffe73a', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2020-03-29 13:44:22', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('fd441898d0eb4ae0a4b72cd2191c4c58', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317710426761', '2021-04-08 23:03:51', 'http://localhost:8081/?tagId=32317742826762');
INSERT INTO `pv` VALUES ('fd5f6b63fd3c4333896529e8f239b499', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2021-04-08 22:43:12', 'http://localhost:8081/?tagId=32313143073265');
INSERT INTO `pv` VALUES ('fdc66d09789c4eafb8502b945bdac17e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/', '2020-03-29 14:06:45', 'http://localhost:8081/login?jumpUrl=aW5kZXg');
INSERT INTO `pv` VALUES ('fe1fb1fd4cec41edbe617fcc6d0aae79', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/home', '2021-04-09 08:44:42', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2hvbWU');
INSERT INTO `pv` VALUES ('fe27a9f99ea943219869a2f3d121e3f8', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/index', '2021-03-20 17:15:16', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('fe3a68afa7464ce585cdb8f8aeecf3dd', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/user/control/likeList', '2020-03-29 14:28:16', 'http://localhost:8081/user/control/likeList');
INSERT INTO `pv` VALUES ('fe4fa2b29117448083834d189b934d9f', null, '未知设备', '127.0.0.1', 'UNKNOWN', null, '2020-03-28 22:59:16', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('fe55b3ef930f405eaa98b8553f6b575a', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-03-31 23:35:27', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('fe710934a8cf45bc83cb78636239bb0c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/membershipCardList', '2021-04-03 14:38:09', 'http://localhost:8081/askList');
INSERT INTO `pv` VALUES ('feb5307c8ed6453c8e9b462c3feb517c', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/question?questionId=6', '2021-02-20 12:06:05', 'http://localhost:8081/');
INSERT INTO `pv` VALUES ('fefcbc66340d4252bd33853d2afcc36e', 'Chrome 8 80.0.3987.149', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317742826762', '2020-03-29 14:06:55', 'http://localhost:8081/?tagId=32317744226763');
INSERT INTO `pv` VALUES ('ff0a1fa528c94b3bb06019a8691e0a61', 'Chrome 8 80.0.3987.162', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32317747826766', '2020-04-01 19:21:52', 'http://localhost:8081/?tagId=32317746926765');
INSERT INTO `pv` VALUES ('ff10a8239c0a439482f63b23d744f8be', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/login?jumpUrl=dXNlci9jb250cm9sL2JhbGFuY2U', '2021-03-31 23:18:44', 'http://localhost:8081/user/control/balance');
INSERT INTO `pv` VALUES ('ffa2b54614784f8e865aeb791241a4e5', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/?tagId=32313143073265', '2021-04-03 14:47:09', 'http://localhost:8081/?tagId=32317710426761');
INSERT INTO `pv` VALUES ('ffd715dcf96042958c8e0d56b117eb95', 'Chrome 8 83.0.4103.106', '电脑', '0:0:0:0:0:0:0:1', 'WINDOWS_10', 'http://localhost:8081/thread?topicId=19', '2021-04-08 23:04:51', 'http://localhost:8081/user/control/home');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `allow` bit(1) NOT NULL,
  `answerTotal` bigint DEFAULT NULL,
  `appendContent` longtext,
  `content` longtext,
  `ip` varchar(45) DEFAULT NULL,
  `isStaff` bit(1) DEFAULT NULL,
  `lastAnswerTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `summary` longtext,
  `title` varchar(190) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `viewTotal` bigint DEFAULT NULL,
  `adoptionAnswerId` bigint DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `point` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_1_idx` (`userName`,`postTime`),
  KEY `question_4_idx` (`status`,`sort`,`lastAnswerTime`),
  KEY `question_5_idx` (`adoptionAnswerId`,`status`,`sort`,`lastAnswerTime`),
  KEY `question_6_idx` (`point`,`status`,`sort`,`lastAnswerTime`),
  KEY `question_7_idx` (`amount`,`status`,`sort`,`lastAnswerTime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '', '0', '[', 'V型从', '0:0:0:0:0:0:0:1', '', '2020-03-28 23:47:58', null, '2020-03-28 23:47:58', '0', '120', 'v型从..', '从车只需付', 'tom', '0', '0', '0.00', '0');
INSERT INTO `question` VALUES ('2', '', '1', '[', '为什么还不睡？？', '0:0:0:0:0:0:0:1', '', '2020-03-29 00:42:27', null, '2020-03-29 00:38:36', '0', '120', '为什么还不睡？？..', '为什么还不睡', 'tom', '1', '1', '0.00', '1');
INSERT INTO `question` VALUES ('3', '', '0', '[', '你的电脑是什么牌子的？？我的是惠普的，大家来说说', '0:0:0:0:0:0:0:1', '', '2020-03-29 14:26:47', null, '2020-03-29 14:26:48', '0', '120', '你的电脑是什么牌子的？？我的是惠普的，大家来说说..', '你的电脑是什么牌子的', 'tom', '0', '0', '0.00', '1');
INSERT INTO `question` VALUES ('4', '', '1', '[{\"id\":\"574f1844051242e2bbb92733505b05fa\",\"content\":\"你吃的什么罐头\",\"postTime\":\"2020-03-29 14:32:44\"},', '罐头好吃吗', '0:0:0:0:0:0:0:1', '', '2020-03-29 14:30:43', null, '2020-03-29 14:28:00', '0', '120', '罐头好吃吗..', '罐头好吃吗', 'tom', '1', '0', '0.00', '2');
INSERT INTO `question` VALUES ('5', '', '1', '[', '做个系统容易吗？', '0:0:0:0:0:0:0:1', '', '2020-03-29 14:33:16', null, '2020-03-29 14:31:41', '0', '120', '做个系统容易吗？..', '做个系统容易吗', 'tim', '1', '0', '0.00', '1');
INSERT INTO `question` VALUES ('6', '', '2', '[', '大家好，听说最近做核酸呢咱们小区，在哪做呢？？', '0:0:0:0:0:0:0:1', '', '2021-02-24 14:42:08', null, '2021-02-20 12:05:01', '0', '120', '大家好，听说最近做核酸呢咱们小区，在哪做呢？？..', '谁去做核酸了，请问在几单元', 'tom', '2', '0', '1.00', '1');
INSERT INTO `question` VALUES ('7', '', '2', '[', '我家里的路由器突然连不上网了，请问大神有啥解决办法', '0:0:0:0:0:0:0:1', '', '2021-02-24 16:27:19', null, '2021-02-24 14:40:44', '0', '120', '我家里的路由器突然连不上网了，请问大神有啥解决办法..', '家里连不上网了咋办', 'tom', '1', '0', '100.00', '5');
INSERT INTO `question` VALUES ('8', '', '0', '[', '<p> 请问这是bug吗，为什么出峡谷不能进化W </p> \n<p> <img src=\"file/question/2021-03-20/image/19f90b5e377c4df9ac3f1f407013d730b3.jpg\" alt=\"\"> </p> \n<p> <img src=\"file/question/2021-03-20/image/a9ed5a67afe148f0a2bd77c63013d170b3.jpg\" alt=\"\"> </p>', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:22:06', null, '2021-03-20 18:22:06', '0', '120', '请问这是bug吗，为什么出峡谷不能进化w..', '请问这是bug吗，为什么出峡谷不能进化W', 'tim', '0', '0', '1.00', '1');

-- ----------------------------
-- Table structure for `questionfavorite_0`
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_0`;
CREATE TABLE `questionfavorite_0` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionFavorite_1_idx` (`questionId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questionfavorite_0
-- ----------------------------
INSERT INTO `questionfavorite_0` VALUES ('4_3', '2020-03-29 14:30:29', 'tom', '4', 'tim');

-- ----------------------------
-- Table structure for `questionfavorite_1`
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_1`;
CREATE TABLE `questionfavorite_1` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionFavorite_1_idx` (`questionId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questionfavorite_1
-- ----------------------------

-- ----------------------------
-- Table structure for `questionfavorite_2`
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_2`;
CREATE TABLE `questionfavorite_2` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionFavorite_1_idx` (`questionId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questionfavorite_2
-- ----------------------------
INSERT INTO `questionfavorite_2` VALUES ('2_2', '2020-03-29 00:39:08', 'tom', '2', 'tom');

-- ----------------------------
-- Table structure for `questionfavorite_3`
-- ----------------------------
DROP TABLE IF EXISTS `questionfavorite_3`;
CREATE TABLE `questionfavorite_3` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionFavorite_1_idx` (`questionId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questionfavorite_3
-- ----------------------------

-- ----------------------------
-- Table structure for `questionindex`
-- ----------------------------
DROP TABLE IF EXISTS `questionindex`;
CREATE TABLE `questionindex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataId` varchar(32) DEFAULT NULL,
  `indexState` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questionindex
-- ----------------------------

-- ----------------------------
-- Table structure for `questionrewardplatformshare`
-- ----------------------------
DROP TABLE IF EXISTS `questionrewardplatformshare`;
CREATE TABLE `questionrewardplatformshare` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `adoptionTime` datetime DEFAULT NULL,
  `answerUserName` varchar(30) DEFAULT NULL,
  `answerUserShareRunningNumber` varchar(32) DEFAULT NULL,
  `platformShareProportion` int DEFAULT NULL,
  `postUserName` varchar(80) DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `shareAmount` decimal(14,4) NOT NULL,
  `staff` bit(1) NOT NULL,
  `totalAmount` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionRewardPlatformShare_1_idx` (`adoptionTime`),
  KEY `questionRewardPlatformShare_2_idx` (`questionId`,`answerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questionrewardplatformshare
-- ----------------------------

-- ----------------------------
-- Table structure for `questiontag`
-- ----------------------------
DROP TABLE IF EXISTS `questiontag`;
CREATE TABLE `questiontag` (
  `id` bigint NOT NULL,
  `childNodeNumber` int DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `parentId` bigint DEFAULT NULL,
  `parentIdGroup` varchar(190) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionTag_1_idx` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questiontag
-- ----------------------------
INSERT INTO `questiontag` VALUES ('32313146004181', '2', '抖机灵', '0', ',0,', '1');
INSERT INTO `questiontag` VALUES ('32317791871179', '0', '脑洞大开', '32313146004181', ',0,32313146004181,', '1');
INSERT INTO `questiontag` VALUES ('32317794071180', '0', '神回答', '32313146004181', ',0,32313146004181,', '1');
INSERT INTO `questiontag` VALUES ('32317938481171', '5', '硬件', '0', ',0,', '1');
INSERT INTO `questiontag` VALUES ('32317952481172', '0', '小主机', '32317938481171', ',0,32317938481171,', '1');
INSERT INTO `questiontag` VALUES ('32317954181173', '0', '电脑', '32317938481171', ',0,32317938481171,', '1');
INSERT INTO `questiontag` VALUES ('32317955281174', '0', '手机', '32317938481171', ',0,32317938481171,', '1');
INSERT INTO `questiontag` VALUES ('32318005581175', '0', '键盘', '32317938481171', ',0,32317938481171,', '1');
INSERT INTO `questiontag` VALUES ('32318008181176', '0', '鼠标', '32317938481171', ',0,32317938481171,', '1');
INSERT INTO `questiontag` VALUES ('32318014181177', '5', '人工智能', '0', ',0,', '1');
INSERT INTO `questiontag` VALUES ('32318015581178', '0', '自然语言处理', '32318014181177', ',0,32318014181177,', '1');
INSERT INTO `questiontag` VALUES ('32318017081179', '0', '自动驾驶', '32318014181177', ',0,32318014181177,', '1');
INSERT INTO `questiontag` VALUES ('32318025381180', '0', '神经网络', '32318014181177', ',0,32318014181177,', '1');
INSERT INTO `questiontag` VALUES ('32318028581181', '0', '机器学习', '32318014181177', ',0,32318014181177,', '1');
INSERT INTO `questiontag` VALUES ('32318029681182', '0', '深度学习', '32318014181177', ',0,32318014181177,', '1');
INSERT INTO `questiontag` VALUES ('32318031481183', '7', '食物', '0', ',0,', '1');
INSERT INTO `questiontag` VALUES ('32318033281184', '0', '美食', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318033981185', '0', '小吃', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318034681186', '0', '罐头', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318035381187', '0', '甜品', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318036381188', '0', '臭味食品', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318037181189', '0', '黑暗料理', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318038081190', '0', '饮食', '32318031481183', ',0,32318031481183,', '1');
INSERT INTO `questiontag` VALUES ('32318040781191', '2', '????', '0', ',0,', '1');
INSERT INTO `questiontag` VALUES ('32318045381192', '0', 'Linux', '32318040781191', ',0,32318040781191,', '1');
INSERT INTO `questiontag` VALUES ('32318046281193', '0', 'Windows', '32318040781191', ',0,32318040781191,', '1');

-- ----------------------------
-- Table structure for `questiontagassociation`
-- ----------------------------
DROP TABLE IF EXISTS `questiontagassociation`;
CREATE TABLE `questiontagassociation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questionId` bigint DEFAULT NULL,
  `questionTagId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionTagAssociation_1_idx` (`questionId`),
  KEY `questionTagAssociation_2_idx` (`questionTagId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of questiontagassociation
-- ----------------------------
INSERT INTO `questiontagassociation` VALUES ('1', '1', '32317791871179', 'tom');
INSERT INTO `questiontagassociation` VALUES ('2', '2', '32317791871179', 'tom');
INSERT INTO `questiontagassociation` VALUES ('3', '3', '32317954181173', 'tom');
INSERT INTO `questiontagassociation` VALUES ('4', '4', '32318034681186', 'tom');
INSERT INTO `questiontagassociation` VALUES ('5', '5', '32318046281193', 'tim');
INSERT INTO `questiontagassociation` VALUES ('7', '7', '32317954181173', 'tom');
INSERT INTO `questiontagassociation` VALUES ('8', '6', '32317794071180', 'tom');
INSERT INTO `questiontagassociation` VALUES ('9', '8', '32317794071180', 'tim');

-- ----------------------------
-- Table structure for `remind_0`
-- ----------------------------
DROP TABLE IF EXISTS `remind_0`;
CREATE TABLE `remind_0` (
  `id` varchar(36) NOT NULL,
  `friendTopicCommentId` bigint DEFAULT NULL,
  `friendTopicReplyId` bigint DEFAULT NULL,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicCommentId` bigint DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `topicReplyId` bigint DEFAULT NULL,
  `typeCode` int DEFAULT NULL,
  `friendQuestionAnswerId` bigint DEFAULT NULL,
  `friendQuestionReplyId` bigint DEFAULT NULL,
  `questionAnswerId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `questionReplyId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remind_1_idx` (`receiverUserId`,`status`,`sendTimeFormat`),
  KEY `remind_2_idx` (`topicId`),
  KEY `remind_3_idx` (`receiverUserId`,`typeCode`,`sendTimeFormat`),
  KEY `remind_4_idx` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of remind_0
-- ----------------------------

-- ----------------------------
-- Table structure for `remind_1`
-- ----------------------------
DROP TABLE IF EXISTS `remind_1`;
CREATE TABLE `remind_1` (
  `id` varchar(36) NOT NULL,
  `friendTopicCommentId` bigint DEFAULT NULL,
  `friendTopicReplyId` bigint DEFAULT NULL,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicCommentId` bigint DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `topicReplyId` bigint DEFAULT NULL,
  `typeCode` int DEFAULT NULL,
  `friendQuestionAnswerId` bigint DEFAULT NULL,
  `friendQuestionReplyId` bigint DEFAULT NULL,
  `questionAnswerId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `questionReplyId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remind_1_idx` (`receiverUserId`,`status`,`sendTimeFormat`),
  KEY `remind_2_idx` (`topicId`),
  KEY `remind_3_idx` (`receiverUserId`,`typeCode`,`sendTimeFormat`),
  KEY `remind_4_idx` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of remind_1
-- ----------------------------

-- ----------------------------
-- Table structure for `remind_2`
-- ----------------------------
DROP TABLE IF EXISTS `remind_2`;
CREATE TABLE `remind_2` (
  `id` varchar(36) NOT NULL,
  `friendTopicCommentId` bigint DEFAULT NULL,
  `friendTopicReplyId` bigint DEFAULT NULL,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicCommentId` bigint DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `topicReplyId` bigint DEFAULT NULL,
  `typeCode` int DEFAULT NULL,
  `friendQuestionAnswerId` bigint DEFAULT NULL,
  `friendQuestionReplyId` bigint DEFAULT NULL,
  `questionAnswerId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `questionReplyId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remind_1_idx` (`receiverUserId`,`status`,`sendTimeFormat`),
  KEY `remind_2_idx` (`topicId`),
  KEY `remind_3_idx` (`receiverUserId`,`typeCode`,`sendTimeFormat`),
  KEY `remind_4_idx` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of remind_2
-- ----------------------------
INSERT INTO `remind_2` VALUES ('32d00a5664f34e60b393bc6e29e4bc230002', null, null, '1617433168631', '2', '1617432686969', '3', '20', null, '16', null, '70', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('3af7323a673042c18829df437694f1ab0002', '6', null, '1617205476551', '2', '1617205375622', '3', '20', null, '14', null, '10', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('40ee15ff873240e3abf935c44ec74c2f0002', null, '2', '1617205476551', '2', '1617205422564', '3', '20', '5', '14', null, '40', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('41d161cfa1bf41f38b8a37006e6b51ce0002', null, null, '1617894293934', '2', '1617894248681', '3', '20', null, '19', null, '70', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('65ed87ad7e9248e3ab7c067f0634c65c0002', '4', null, '1616235781017', '2', '1616235541000', '3', '20', null, '11', null, '100', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('6b9aa046bc5f4d12b848ab5e8e2ca7b10002', '8', null, '1617894293934', '2', '1617894260008', '3', '20', null, '19', null, '10', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('80494f7496e442319d1fe0e350a9da8c0002', null, null, '1613794055274', '2', '1585463442264', '3', '20', null, '-1', null, '120', '2', null, null, '4', null);
INSERT INTO `remind_2` VALUES ('8d25003f29fd44d0bc2ae74885b9dcfc0002', '4', null, '1616235781017', '2', '1616235541478', '3', '20', null, '11', null, '10', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('9728b70a46874acb80835e41afbd72870002', null, null, '1613794055274', '2', '1613793961786', '3', '20', null, '-1', null, '120', '4', null, null, '6', null);
INSERT INTO `remind_2` VALUES ('9f8d19cebfdb4029abd88223afdd7ae60002', null, null, '1616235781017', '2', '1614149032787', '3', '20', null, '-1', null, '120', '6', null, null, '7', null);
INSERT INTO `remind_2` VALUES ('d8612712e335434d8140d11d6a62a56f0002', null, null, '1585463298627', '2', '1585413746374', '3', '20', null, '-1', null, '120', '1', null, null, '2', null);
INSERT INTO `remind_2` VALUES ('ef1cb66f2bda428c856eafd6e2b819b60002', null, null, '1616235781017', '2', '1616235566366', '3', '20', null, '11', null, '70', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('f2e47d14e7f24e16900780baccad72d20002', '7', null, '1617433168631', '2', '1617432703782', '3', '20', null, '16', null, '10', null, null, null, '-1', null);
INSERT INTO `remind_2` VALUES ('fce5919a50724b3c8c61422e7fb0078f0002', null, null, '1613794055274', '2', '1585463452466', '3', '20', null, '-1', null, '80', null, null, null, '-1', null);

-- ----------------------------
-- Table structure for `remind_3`
-- ----------------------------
DROP TABLE IF EXISTS `remind_3`;
CREATE TABLE `remind_3` (
  `id` varchar(36) NOT NULL,
  `friendTopicCommentId` bigint DEFAULT NULL,
  `friendTopicReplyId` bigint DEFAULT NULL,
  `readTimeFormat` bigint DEFAULT NULL,
  `receiverUserId` bigint DEFAULT NULL,
  `sendTimeFormat` bigint DEFAULT NULL,
  `senderUserId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicCommentId` bigint DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `topicReplyId` bigint DEFAULT NULL,
  `typeCode` int DEFAULT NULL,
  `friendQuestionAnswerId` bigint DEFAULT NULL,
  `friendQuestionReplyId` bigint DEFAULT NULL,
  `questionAnswerId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `questionReplyId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remind_1_idx` (`receiverUserId`,`status`,`sendTimeFormat`),
  KEY `remind_2_idx` (`topicId`),
  KEY `remind_3_idx` (`receiverUserId`,`typeCode`,`sendTimeFormat`),
  KEY `remind_4_idx` (`questionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of remind_3
-- ----------------------------
INSERT INTO `remind_3` VALUES ('00c74433feef4c5ca26703923e67a9790003', null, null, '1617894361182', '3', '1617894095000', '2', '20', null, '18', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('352ffc510534477897153fa9162ec91f0003', null, null, '1617894361182', '3', '1617433245761', '2', '20', null, '17', null, '70', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('44fafec7c29a4965a81ec098f33a87cc0003', null, null, '1617203929045', '3', '1616232340000', '2', '120', null, '7', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('54f5172691614a7aa035ea2769d35cd40003', null, null, '1617894361182', '3', '1617205225000', '2', '20', null, '14', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('560a316478814ea5b7629c1aceb0dc6b0003', '7', '3', '1617894361182', '3', '1617433190000', '2', '20', null, '16', null, '110', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('6112a38c20264f5da456136bd9e7a7f30003', null, null, '1614149081843', '3', '1613794078668', '2', '120', null, '-1', null, '140', null, '1', '4', '6', null);
INSERT INTO `remind_3` VALUES ('65f94062026c419784ebc356cbed73df0003', null, '4', '1617894361182', '3', '1617894316605', '2', '20', '8', '19', null, '40', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('6f0bf63bf2d24ccf82ce50056b19b24f0003', null, null, '1617894361182', '3', '1617894147000', '2', '20', null, '19', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('795ef8452e1940b199ae4e9052b8de500003', '5', null, '1617894361182', '3', '1617205310000', '2', '20', null, '14', null, '100', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('7b28daf3c0c44212b7b4ef9f6fb9251f0003', null, null, '1617203929045', '3', '1616234587000', '2', '120', null, '9', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('82465e8a017a4301b5cb6004dedd63fe0003', null, null, '1617203929045', '3', '1616232273000', '2', '120', null, '6', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('854500505b724040a4440d373bb6c6120003', null, null, '1617894361182', '3', '1617206516000', '2', '20', null, '15', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('87943ab69d4a40669ad92eca842711680003', '4', '1', '1617203929045', '3', '1616235809000', '2', '120', null, '11', null, '110', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('9ab7a80b094147c8a3922f16bafc21540003', null, '1', '1617203929045', '3', '1616235809103', '2', '120', '4', '11', null, '40', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('9bc8e2ee45024f4a9898545abb60258d0003', null, '3', '1617894361182', '3', '1617433190398', '2', '20', '7', '16', null, '40', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('a271ef7dc5ce46e8a02be8c74d882f470003', null, null, '1614149081843', '3', '1585463607495', '2', '120', null, '-1', null, '80', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('abf91dc98dad4154b23724e36eb459480003', null, null, '1617894361182', '3', '1617204921000', '2', '20', null, '13', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('af56deda1e254fa880581d7e8ef8e90f0003', '3', null, '1617203929045', '3', '1616235279000', '2', '120', null, '10', null, '100', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('ce3d512550804e9a85d361970da8b77f0003', null, null, '1617894361182', '3', '1617432419000', '2', '20', null, '16', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('d315dae6b45143949a6b7184c9a402f10003', null, null, '1617894361182', '3', '1617204854000', '2', '20', null, '12', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('e8829d84f1504d6ba75f04f1df861bf70003', '8', '4', '1617894361182', '3', '1617894317000', '2', '20', null, '19', null, '110', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('ea23838c39714044bf5b6ac152b834370003', null, null, '1617203929045', '3', '1616233333000', '2', '120', null, '8', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('ecffde3e14764d2b85fc5b9c4396769c0003', null, null, '1614149081843', '3', '1585463595750', '2', '120', null, '-1', null, '120', '3', null, null, '5', null);
INSERT INTO `remind_3` VALUES ('f4cb7dbef3844694b86de82d3958e3e30003', null, null, '1617203929045', '3', '1616235222000', '2', '120', null, '10', null, '90', null, null, null, '-1', null);
INSERT INTO `remind_3` VALUES ('f8225233868d4e409611a863b5216dd40003', null, null, '1617203929045', '3', '1616235370000', '2', '120', null, '11', null, '90', null, null, null, '-1', null);

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `commentId` bigint DEFAULT NULL,
  `content` longtext,
  `ip` varchar(45) DEFAULT NULL,
  `isStaff` bit(1) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_1_idx` (`commentId`,`status`),
  KEY `reply_2_idx` (`topicId`),
  KEY `reply_3_idx` (`userName`,`isStaff`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '4', '你说的太对了，谢谢', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:23:29', '11', 'tom', '20');
INSERT INTO `reply` VALUES ('2', '5', '你好啊tom，咱们一起氧吧', '0:0:0:0:0:0:0:1', '', '2021-03-31 23:43:43', '14', 'tim', '20');
INSERT INTO `reply` VALUES ('3', '7', '谢谢你的夸奖，我会继续努力的！', '0:0:0:0:0:0:0:1', '', '2021-04-03 14:59:50', '16', 'tom', '20');
INSERT INTO `reply` VALUES ('4', '8', '谢谢你哦，我也是瞎搞得', '0:0:0:0:0:0:0:1', '', '2021-04-08 23:05:17', '19', 'tom', '20');

-- ----------------------------
-- Table structure for `sendsmslog`
-- ----------------------------
DROP TABLE IF EXISTS `sendsmslog`;
CREATE TABLE `sendsmslog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(60) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `serviceId` int DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sendsmslog
-- ----------------------------

-- ----------------------------
-- Table structure for `smsinterface`
-- ----------------------------
DROP TABLE IF EXISTS `smsinterface`;
CREATE TABLE `smsinterface` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dynamicParameter` longtext,
  `enable` bit(1) NOT NULL,
  `interfaceProduct` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sendService` longtext,
  `sort` int DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of smsinterface
-- ----------------------------

-- ----------------------------
-- Table structure for `specification`
-- ----------------------------
DROP TABLE IF EXISTS `specification`;
CREATE TABLE `specification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `enable` bit(1) NOT NULL,
  `marketPrice` decimal(12,2) DEFAULT NULL,
  `membershipCardId` bigint DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `sellingPrice` decimal(12,2) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `specificationName` varchar(100) DEFAULT NULL,
  `stock` bigint DEFAULT NULL,
  `stockOccupy` bigint DEFAULT NULL,
  `unit` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `specification_1_idx` (`membershipCardId`,`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of specification
-- ----------------------------
INSERT INTO `specification` VALUES ('1', '1', '', '10.00', '1', null, '30.00', '0', '白金会员1个月', '99', '1', '30');
INSERT INTO `specification` VALUES ('2', '3', '', '120.00', '1', null, '80.00', '1', '白金会员3个月', '100', '0', '30');
INSERT INTO `specification` VALUES ('3', '6', '', '240.00', '1', null, '150.00', '2', '白金会员半年', '100', '0', '30');
INSERT INTO `specification` VALUES ('4', '1', '', '480.00', '1', null, '280.00', '3', '白金会员1年', '100', '0', '40');

-- ----------------------------
-- Table structure for `staffloginlog_0`
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_0`;
CREATE TABLE `staffloginlog_0` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `staffId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffLoginLog_idx` (`staffId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staffloginlog_0
-- ----------------------------

-- ----------------------------
-- Table structure for `staffloginlog_1`
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_1`;
CREATE TABLE `staffloginlog_1` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `staffId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffLoginLog_idx` (`staffId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staffloginlog_1
-- ----------------------------

-- ----------------------------
-- Table structure for `staffloginlog_2`
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_2`;
CREATE TABLE `staffloginlog_2` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `staffId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffLoginLog_idx` (`staffId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staffloginlog_2
-- ----------------------------

-- ----------------------------
-- Table structure for `staffloginlog_3`
-- ----------------------------
DROP TABLE IF EXISTS `staffloginlog_3`;
CREATE TABLE `staffloginlog_3` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `staffId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffLoginLog_idx` (`staffId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of staffloginlog_3
-- ----------------------------
INSERT INTO `staffloginlog_3` VALUES ('00923855852d4deb99f25b81ae4f75957019', '0:0:0:0:0:0:0:1', '2020-03-29 00:25:06', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('06ca864845e64092a6010e468aa4c98c7019', '0:0:0:0:0:0:0:1', '2021-03-20 18:24:16', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('1110400f549b4698aab08f21f134e3417019', '0:0:0:0:0:0:0:1', '2020-03-29 14:36:35', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('168b4ed7523e4024848a515ebba5345f7019', '0:0:0:0:0:0:0:1', '2020-03-28 23:37:28', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('1eb56a2741cd4f2c8422be7cc60b42617019', '0:0:0:0:0:0:0:1', '2021-04-05 12:42:48', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('217bb3d4c7014c54be53801c08b4cd017019', '0:0:0:0:0:0:0:1', '2020-03-29 01:22:28', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('2528694a77384c1d8f349298ac5bab3a7019', '0:0:0:0:0:0:0:1', '2021-03-20 17:55:16', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('3adcd90866a5414daa986dcc0d37f3b47019', '0:0:0:0:0:0:0:1', '2021-03-31 23:58:07', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('3bc8850ada3442489db9d03005a68bca7019', '0:0:0:0:0:0:0:1', '2020-03-29 14:21:08', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('3bcb54cf59af4f05be4b65f78d5cd5ea7019', '0:0:0:0:0:0:0:1', '2021-04-08 22:47:04', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('3e0b0a809a294d058fea0080b6bbf8267019', '0:0:0:0:0:0:0:1', '2020-03-28 23:44:35', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('436f79d969394f8fa9211044de73f7d97019', '0:0:0:0:0:0:0:1', '2020-03-29 14:03:04', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('4a89c759fbca432d8b4effaf6551365b7019', '0:0:0:0:0:0:0:1', '2020-03-29 00:35:19', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('4b33dd58efa44a81ad5e529b3edca56f7019', '0:0:0:0:0:0:0:1', '2021-04-01 13:32:15', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('4b3409871c3a4c8cb41a4d0b1d1200a87019', '0:0:0:0:0:0:0:1', '2021-03-20 18:16:55', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('5a178c8622054c82bcba01b6226401a77019', '0:0:0:0:0:0:0:1', '2021-04-03 14:52:10', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('5dc6d6552729479395c549c4f7d197967019', '0:0:0:0:0:0:0:1', '2021-03-20 17:15:41', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('6fc409213f7e4bd28a32dd3b39426ad07019', '0:0:0:0:0:0:0:1', '2020-03-29 00:00:05', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('740d5574b75845c1b99683adae72bcd37019', '0:0:0:0:0:0:0:1', '2021-04-08 23:02:54', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('81f17b7b7fe1406d8beba1004a457f417019', '0:0:0:0:0:0:0:1', '2021-02-24 16:28:52', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('8a252366762f4dcc9c90e92babe4a12b7019', '0:0:0:0:0:0:0:1', '2020-03-29 12:18:38', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('8d15b67b564e4323ba6f853a16b76e5f7019', '0:0:0:0:0:0:0:1', '2021-02-24 14:29:03', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('8ee8ab56fc8843239dac4b10da84e0d97019', '0:0:0:0:0:0:0:1', '2021-03-20 18:17:32', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('91bdce79ab964f3c86b313768ddafabc7019', '0:0:0:0:0:0:0:1', '2020-03-29 14:28:40', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('95bae20b96c44cda8cd43eaf7a27bddd7019', '0:0:0:0:0:0:0:1', '2020-03-29 00:31:52', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('9cb64587d76a4f249fa6061ef27d698b7019', '0:0:0:0:0:0:0:1', '2020-03-29 00:55:15', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('a520d3327baf4ea294f2ebe1eea196787019', '0:0:0:0:0:0:0:1', '2021-03-31 23:36:01', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('b3a998e5c9b14648892f9e4ab937ad677019', '0:0:0:0:0:0:0:1', '2020-03-29 12:51:42', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('b9484964bda84f11a1085317806013ef7019', '0:0:0:0:0:0:0:1', '2021-04-03 14:34:32', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('bad1a3bf828c47bfa72c9c0d7b9255e07019', '0:0:0:0:0:0:0:1', '2021-03-31 23:09:08', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('bc6f515fdb2b487692996256fda7899a7019', '0:0:0:0:0:0:0:1', '2021-02-24 14:46:15', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('c6cf715b05484177b0ad373ce8ffa3177019', '0:0:0:0:0:0:0:1', '2021-04-03 12:43:09', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('e4804ba3e0d14bdca81bea9852ab3b757019', '0:0:0:0:0:0:0:1', '2021-03-31 23:40:57', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');
INSERT INTO `staffloginlog_3` VALUES ('fde1427aea614d168fea2d4cbec1e9557019', '0:0:0:0:0:0:0:1', '2021-04-08 22:43:35', '4aa5a9a9d54c4a22a8fff3bc27f35aa5');

-- ----------------------------
-- Table structure for `subscriptionsystemnotify_0`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_0`;
CREATE TABLE `subscriptionsystemnotify_0` (
  `id` varchar(36) NOT NULL,
  `readTime` datetime DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `systemNotifyId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptionSystemNotify_1_idx` (`systemNotifyId`),
  KEY `subscriptionSystemNotify_2_idx` (`userId`,`status`,`systemNotifyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of subscriptionsystemnotify_0
-- ----------------------------

-- ----------------------------
-- Table structure for `subscriptionsystemnotify_1`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_1`;
CREATE TABLE `subscriptionsystemnotify_1` (
  `id` varchar(36) NOT NULL,
  `readTime` datetime DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `systemNotifyId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptionSystemNotify_1_idx` (`systemNotifyId`),
  KEY `subscriptionSystemNotify_2_idx` (`userId`,`status`,`systemNotifyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of subscriptionsystemnotify_1
-- ----------------------------

-- ----------------------------
-- Table structure for `subscriptionsystemnotify_2`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_2`;
CREATE TABLE `subscriptionsystemnotify_2` (
  `id` varchar(36) NOT NULL,
  `readTime` datetime DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `systemNotifyId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptionSystemNotify_1_idx` (`systemNotifyId`),
  KEY `subscriptionSystemNotify_2_idx` (`userId`,`status`,`systemNotifyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of subscriptionsystemnotify_2
-- ----------------------------

-- ----------------------------
-- Table structure for `subscriptionsystemnotify_3`
-- ----------------------------
DROP TABLE IF EXISTS `subscriptionsystemnotify_3`;
CREATE TABLE `subscriptionsystemnotify_3` (
  `id` varchar(36) NOT NULL,
  `readTime` datetime DEFAULT NULL,
  `sendTime` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `systemNotifyId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptionSystemNotify_1_idx` (`systemNotifyId`),
  KEY `subscriptionSystemNotify_2_idx` (`userId`,`status`,`systemNotifyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of subscriptionsystemnotify_3
-- ----------------------------

-- ----------------------------
-- Table structure for `syspermission`
-- ----------------------------
DROP TABLE IF EXISTS `syspermission`;
CREATE TABLE `syspermission` (
  `id` varchar(32) NOT NULL,
  `methods` varchar(4) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of syspermission
-- ----------------------------
INSERT INTO `syspermission` VALUES ('030ebf82676c4160920670728bce3cb2', 'POST', 'AUTH_d0482512ccd5439bb6610672c11f0cb2_POST_DELETE', '1', '删除模板');
INSERT INTO `syspermission` VALUES ('048060184aa747db94413aef590e6b97', 'POST', 'AUTH_fd848496836843b49ee6ed3ccdf6c14d_POST_UPDATE', '1', '审核话题');
INSERT INTO `syspermission` VALUES ('04931b8ad2db4512bb8c49d48f600b18', 'POST', 'AUTH_8dd0e634ff4647e0b438b75fbde1148f_POST_UPDATE', '1', '修改会员卡');
INSERT INTO `syspermission` VALUES ('05bd42ccee274a6393edf7e5be2ed902', 'GET', 'AUTH_b9512c1642a54356b453ef6e9df32aee_GET_READ', '1', '模板列表');
INSERT INTO `syspermission` VALUES ('0998399706604b298db6533ef23ec0ac', 'POST', 'AUTH_52bc2dbe4c0e437ebf93ce8b6575c6bb_POST_UPDATE', '2', '修改');
INSERT INTO `syspermission` VALUES ('0b9dd9f7be554a4eb07ff7bf716a81b9', 'POST', 'AUTH_0d87e1fe8fdd45d48c5f259b8e423b2e_POST_UPDATE', '2', '布局编辑');
INSERT INTO `syspermission` VALUES ('0bee0cbdc5514c02adf8f0910971c90f', 'GET', 'AUTH_9246901afe1b4d3fb501c3fc51be23c5_GET_READ', '1', '修改等级页');
INSERT INTO `syspermission` VALUES ('0c1ff61fb5664ba5b41d844b2bcbc5c5', 'POST', 'AUTH_70889956fee3475fb8487313d46f94c7_POST_ADD', '2', '添加模板');
INSERT INTO `syspermission` VALUES ('0cb6e21b9d254dd881c201b577fa46f6', 'POST', 'AUTH_71e587d45b384855831dcfa5db98f8fe_POST_UPDATE', '2', '修改答案回复');
INSERT INTO `syspermission` VALUES ('0e0d51db38d54019883a97efae6a613c', 'GET', 'AUTH_08a343e33ec44fe59228442dd56e96a3_GET_READ', '1', '缩略图列表');
INSERT INTO `syspermission` VALUES ('0e5fa569a5584aacadc631e738257aeb', 'GET', 'AUTH_a02b3694e4d542398d3a39f4156e992f_GET_READ', '1', '添加页');
INSERT INTO `syspermission` VALUES ('0f0ec2999fbb44f8846a20d58e828e59', 'POST', 'AUTH_45f5ca24bf7441c08680d66b3aa6a8f6_POST_DELETE', '1', '删除');
INSERT INTO `syspermission` VALUES ('0f7d3d4af8954ad18178b62d2f25d7f9', 'GET', 'AUTH_0ae67eaf13ab4fc199a4406126dbaef4_GET_READ', '1', '发表的评论');
INSERT INTO `syspermission` VALUES ('10aefb57f2f247b290c91e2253e8ce2d', 'GET', 'AUTH_d297f75ec0514aa1953d9d1738634090_GET_READ', '1', '下载压缩文件');
INSERT INTO `syspermission` VALUES ('11ac0bb2d9074573bdfcb40511a302b9', 'GET', 'AUTH_5417c2d6e8a8453b972682fee374ec3a_GET_READ', '1', '在线帮助列表');
INSERT INTO `syspermission` VALUES ('12d63c0e375a47728d4c182372529b8e', 'POST', 'AUTH_3b87a0950675425d9b46b0a9526acb46_POST_ADD', '2', '追加问题');
INSERT INTO `syspermission` VALUES ('1313b93cb906494d896c059eca62762a', 'POST', 'AUTH_fb9bce585d7d4aa89ddf30262540e660_POST_DELETE', '1', '删除导出模板');
INSERT INTO `syspermission` VALUES ('139ded1d586348f78e3751c9dc8dec13', 'GET', 'AUTH_7e6b62b229a84c0fa739373313f381c0_GET_READ', '1', '修改追加问题页');
INSERT INTO `syspermission` VALUES ('13f7169f2a0b48a591e701d5f5a034d0', 'GET', 'AUTH_2bf084e1e8d84e89a1c2da9c5f6c8f5d_GET_READ', '1', '私信对话列表');
INSERT INTO `syspermission` VALUES ('1474318f7e2240739d00a85ff21778d1', 'GET', 'AUTH_98e03673f0c847a2bc8f93008b1729ef_GET_READ', '1', '点赞用户');
INSERT INTO `syspermission` VALUES ('15c5191b69af4eb0a1862930c6fe176d', 'GET', 'AUTH_a4775968ad2e4b238ed49b4e4808a011_GET_READ', '1', '修改回复页');
INSERT INTO `syspermission` VALUES ('1889c935ddca4f81bf1046dccfcfe906', 'POST', 'AUTH_d75adb28b87d496e8627c11272b47476_POST_DELETE', '1', '删除在线帮助');
INSERT INTO `syspermission` VALUES ('18d7283440854ef68e30bcc83671777f', 'GET', 'AUTH_24bac9f0b1c84b0394a39c8933c7739d_GET_READ', '1', '资源文件查看');
INSERT INTO `syspermission` VALUES ('1931aeb8dd194f8282ebbd4085166f52', 'POST', 'AUTH_62c2facd01254ffe99ce7692def6815f_POST_DELETE', '1', '删除答案回复');
INSERT INTO `syspermission` VALUES ('194e1a7a1fdc4a6eae2bd4db1dea2661', 'GET', 'AUTH_922f6908c5a1434aba4b0f6f8f008c1c_GET_READ', '1', '添加版块页');
INSERT INTO `syspermission` VALUES ('19b5f1637e174a31a91c4ddcef3bb4c0', 'GET', 'AUTH_5af3e8652bd14b48aea03fac91e1e0b7_GET_READ', '1', '修改布局页');
INSERT INTO `syspermission` VALUES ('19facbaf34104cad9e532d40286753e7', 'GET', 'AUTH_27af89b4f9344c73b1b792334e7fdfe2_GET_READ', '1', '会员注册项列表');
INSERT INTO `syspermission` VALUES ('1a362749eebe4b1f8d41643521125336', 'POST', 'AUTH_fc8554db852a4f128bdee595b4cd1ed8_POST_UPDATE', '1', '更换头像');
INSERT INTO `syspermission` VALUES ('1a631db6c36e499cafd7d5211e61939f', 'GET', 'AUTH_061d18aeb1044870b94cf6144a6004ea_GET_READ', '1', '话题列表');
INSERT INTO `syspermission` VALUES ('1b80ca8dc02c4591997d420cc917d80b', 'GET', 'AUTH_53ae04bf6468464ea15826a8d1bb7417_GET_READ', '1', '留言列表');
INSERT INTO `syspermission` VALUES ('1cc026a6afec4d2c823901413e192bee', 'GET', 'AUTH_d71d35ca222a43e2bec6ceb76ac8097f_GET_READ', '1', '添加会员卡页');
INSERT INTO `syspermission` VALUES ('1d34b3ce43ae4d8f962a8b27381a3dec', 'POST', 'AUTH_670eb3b034d34a82a6053de088e27d0a_POST_UPDATE', '1', '还原问题');
INSERT INTO `syspermission` VALUES ('1e5cbc88d0d8489cabf925e70094b882', 'POST', 'AUTH_838e778a22c0424ab11914d1e3b44379_POST_UPDATE', '2', '修改角色');
INSERT INTO `syspermission` VALUES ('1f394709c4b74ac5a982ceea26a42d6e', 'POST', 'AUTH_efa66bc116bc409fbf7bf23e4882d2d9_POST_ADD', '2', '添加员工');
INSERT INTO `syspermission` VALUES ('1f8a51f44c3f4dfe878c0b978a5720d6', 'GET', 'AUTH_0d87e1fe8fdd45d48c5f259b8e423b2e_GET_READ', '1', '布局编辑页');
INSERT INTO `syspermission` VALUES ('2059b44286c3402c84e89d5d449eb305', 'POST', 'AUTH_a02b3694e4d542398d3a39f4156e992f_POST_ADD', '2', '添加');
INSERT INTO `syspermission` VALUES ('211fa9879cdc41b7b7e8ed3fe308278e', 'POST', 'AUTH_decb896d7fee40f09a958647cf14b849_POST_UPDATE', '1', '审核问题');
INSERT INTO `syspermission` VALUES ('21d93e122d3a4df4ac1b4748ef5a99a7', 'GET', 'AUTH_bee77a45dcdb428db42dcb2317648fe9_GET_READ', '1', '修改员工页');
INSERT INTO `syspermission` VALUES ('22262588cd464d568f4d756512152c3d', 'POST', 'AUTH_8ce45be5ea284190b9d76138d8d5f6b2_POST_ADD', '2', '打包文件');
INSERT INTO `syspermission` VALUES ('22d30d3080cc422e8878470f6db173fc', 'POST', 'AUTH_9246901afe1b4d3fb501c3fc51be23c5_POST_UPDATE', '2', '修改等级');
INSERT INTO `syspermission` VALUES ('238bd1047afc4fc0a220977c44a07336', 'GET', 'AUTH_d613442d18c1465d8a981f420b3aa8cd_GET_READ', '1', '维护数据页');
INSERT INTO `syspermission` VALUES ('260db4f1552c4f09a5f6f999e896cdac', 'GET', 'AUTH_9be9600772e3420a91ee019acc3ba379_GET_READ', '1', '添加答案回复页');
INSERT INTO `syspermission` VALUES ('26767c89eeb84e56a411f686b3242491', 'GET', 'AUTH_b805b7dbbf0140b2a2fcb962e3fe4a4d_GET_READ', '1', '修改分类页');
INSERT INTO `syspermission` VALUES ('27464511268442c39980b0a8a25c2663', 'GET', 'AUTH_f2ddeb0bb4c94342854c6a2461869fb4_GET_READ', '1', '提醒列表');
INSERT INTO `syspermission` VALUES ('283b82e93f0f45e9aebe62a6fa3194bd', 'POST', 'AUTH_9c3ddbaa3457496ab9315ce6f271db8d_POST_UPDATE', '1', '还原在线帮助');
INSERT INTO `syspermission` VALUES ('2857b3c00f5841c4920497ac57beac6b', 'POST', 'AUTH_32ae2070e23d42ba8dc38de061e7ed47_POST_DELETE', '1', '删除');
INSERT INTO `syspermission` VALUES ('294be5897f7c4770b7b2d0190e0a6bdd', 'POST', 'AUTH_7d7842f34d6940738a767b3d7dd9a6ec_POST_ADD', '1', '充值');
INSERT INTO `syspermission` VALUES ('2a881ff2307942a888e84ce2b7cb9a57', 'POST', 'AUTH_d71d35ca222a43e2bec6ceb76ac8097f_POST_ADD', '2', '添加会员卡');
INSERT INTO `syspermission` VALUES ('2b07e05a06784b4c8095ce0345b407a1', 'GET', 'AUTH_f365c635400e47eda1fc10589d7dbbcd_GET_READ', '1', '会员搜索');
INSERT INTO `syspermission` VALUES ('2d05a9c495ea48598814eb46f3852102', 'GET', 'AUTH_75a262c3c48d4e21817541cd87fac000_GET_READ', '1', '合并分类页');
INSERT INTO `syspermission` VALUES ('2d5b3555fd764225bbdd1e8787d8198f', 'POST', 'AUTH_513d70ed7f3e46eb91f8ea4bbfc89317_POST_DELETE', '1', '删除会员注册项');
INSERT INTO `syspermission` VALUES ('2dabdbe7ec924ed2b8a15d8f06f9f457', 'POST', 'AUTH_281466f5c0654966a68653b7383c6d9a_POST_ADD', '2', '添加评论');
INSERT INTO `syspermission` VALUES ('2eb3a442ae964e03b0626dee0115a7cd', 'GET', 'AUTH_efa66bc116bc409fbf7bf23e4882d2d9_GET_READ', '1', '添加员工页');
INSERT INTO `syspermission` VALUES ('2f44f50ef9184640b7578bd1eeb9888c', 'GET', 'AUTH_4ab032ea2c53438799d6b32b0eebb60b_GET_READ', '1', '问题标签列表');
INSERT INTO `syspermission` VALUES ('3093827bb1314f9ab1ba5068fa94bdf6', 'GET', 'AUTH_37f5d0f7095b4093a772593dd4e28a39_GET_READ', '1', '提交的问题');
INSERT INTO `syspermission` VALUES ('3107b49684c54d51b54c45a7307228e0', 'POST', 'AUTH_3338673059d44af39b27bf4cddc15bcc_POST_UPDATE', '1', '还原提醒');
INSERT INTO `syspermission` VALUES ('3402b228fb604030a83eac3c0e94373f', 'GET', 'AUTH_d5290b702acf41f286dc3d66c659d081_GET_READ', '1', '会员卡订单');
INSERT INTO `syspermission` VALUES ('34b600ff3fd4494cb3c34af2910b9c5e', 'POST', 'AUTH_c673918d949d4cc3aa38b43660b354b8_POST_ADD', '2', '添加在线帮助');
INSERT INTO `syspermission` VALUES ('356b58ddff4a4f85aa3dd1f874964314', 'POST', 'AUTH_2a03829ee62c4283913dc440537f3fe9_POST_UPDATE', '2', '修改角色');
INSERT INTO `syspermission` VALUES ('35e6084d7dc44b1ca8e9033302969275', 'POST', 'AUTH_bd36d2aa14774c8d81b56fc7fde02b4f_POST_DELETE', '1', '删除短信接口');
INSERT INTO `syspermission` VALUES ('36001fdc50254da8a40de770517d148e', 'POST', 'AUTH_7caf26294048452cafbb5972ef502d88_POST_UPDATE', '1', '还原系统通知');
INSERT INTO `syspermission` VALUES ('36aaf8e88b324c3b8ce50276cb83e901', 'GET', 'AUTH_ad17b7a816ea45b09be8084be966ba4b_GET_READ', '1', '问题搜索');
INSERT INTO `syspermission` VALUES ('370562231d9447c797d9c9d4df04413b', 'GET', 'AUTH_5ef5747987074212be7ef9cc9fdb50af_GET_READ', '1', '修改在线帮助页');
INSERT INTO `syspermission` VALUES ('381f2e01b83742149361cb116c106e12', 'POST', 'AUTH_da63bf83542e47bdacdada8a8abf8166_POST_DELETE', '1', '删除在线支付接口');
INSERT INTO `syspermission` VALUES ('3944c3265a08408db9c8ac3a95862cfe', 'GET', 'AUTH_a15cab18081d4ec7b85b03646b873166_GET_READ', '1', '查看支付日志');
INSERT INTO `syspermission` VALUES ('3a459f7f04b64379bea2ae724cf3f78a', 'GET', 'AUTH_ca0e7a1a86384639a025a3fab07bd963_GET_READ', '1', '问题列表');
INSERT INTO `syspermission` VALUES ('3aa152ed6319424097a29e41f3dd14d4', 'POST', 'AUTH_ef3e2b9c32634f4088f4066880c70677_POST_UPDATE', '2', '修改版块');
INSERT INTO `syspermission` VALUES ('3add22feb0064256bc19c209d14b5aeb', 'GET', 'AUTH_3d630529412f44c8be0c409bf12bbba7_GET_READ', '1', '资源文件下载');
INSERT INTO `syspermission` VALUES ('3bca1bc44826413db5693edc927dd863', 'POST', 'AUTH_2f4d3ec6741b4552a27d20781426df12_POST_UPDATE', '1', '还原');
INSERT INTO `syspermission` VALUES ('3c05fdd591c8470b8622091893ff004c', 'GET', 'AUTH_4ce5c77610864d8885298a21793732ad_GET_READ', '1', '修改标签页');
INSERT INTO `syspermission` VALUES ('3c6e8be51c62407c9d6a9072866c728d', 'GET', 'AUTH_05568f678d8e43018b884f0bba9dd600_GET_READ', '1', '在线支付接口列表');
INSERT INTO `syspermission` VALUES ('3d795b3a0b1849fb8da486151cba9b8b', 'POST', 'AUTH_aa355abf953e42078517a3dded03e785_POST_UPDATE', '2', '修改系统通知');
INSERT INTO `syspermission` VALUES ('3ddf4b633d8f474f9a8aaffd73db0482', 'GET', 'AUTH_07dc355d349a41379673ede8b926520e_GET_READ', '1', '短信发送错误日志');
INSERT INTO `syspermission` VALUES ('3f59fbbaac5c4618a7766c775050bee5', 'GET', 'AUTH_b47dd6012f88406795205481d2916fd2_GET_READ', '1', '引用评论页');
INSERT INTO `syspermission` VALUES ('3fcd60e96e85430fa99e85886804dbc5', 'POST', 'AUTH_5ef5747987074212be7ef9cc9fdb50af_POST_UPDATE', '2', '修改在线帮助');
INSERT INTO `syspermission` VALUES ('40609cc4a8d24b1cae714d3b26549718', 'POST', 'AUTH_aa971ce1dc6f43e3b026d235fa7263e6_POST_ADD', '1', '添加版块代码');
INSERT INTO `syspermission` VALUES ('4174d434346d4043935285874652531e', 'POST', 'AUTH_a5cb52cd59a040a1b34a7f401361fe31_POST_DELETE', '1', '删除私信');
INSERT INTO `syspermission` VALUES ('447a7075ee9241b4b39e8976aa24709d', 'GET', 'AUTH_aa355abf953e42078517a3dded03e785_GET_READ', '1', '修改系统通知页');
INSERT INTO `syspermission` VALUES ('47d2591d01cf49dd8122cc9a77d16094', 'POST', 'AUTH_521ab07ea093458b8c0711c9783cfdec_POST_UPDATE', '2', '审核回复');
INSERT INTO `syspermission` VALUES ('4831ce8be1af4dd9862ab173a19907d3', 'POST', 'AUTH_8b9594bb5b8343dbadca64a4f8066b6e_POST_ADD', '2', '添加回复');
INSERT INTO `syspermission` VALUES ('490b90c22bd74cc49ffac5a8bf339cc3', 'GET', 'AUTH_d72acdb07d1540bab400c194ba3329f8_GET_READ', '1', '资源列表');
INSERT INTO `syspermission` VALUES ('4c701cb29334419fa58b66c9913532ea', 'GET', 'AUTH_82462825c1dd4ecdb3ce22e68b70f5e9_GET_READ', '1', '添加等级页');
INSERT INTO `syspermission` VALUES ('4c87a7846ac54b09bb723808825be222', 'GET', 'AUTH_1f706068a9d547dea69f89a64c89a741_GET_READ', '1', '查看');
INSERT INTO `syspermission` VALUES ('4ca50a54e8f54bb6ab063331f78a96d8', 'GET', 'AUTH_b83b0d29f07e4249b70067e00f54ef67_GET_READ', '1', '添加禁止的用户名称页');
INSERT INTO `syspermission` VALUES ('4ce1fa996a4445849b169415cfb89826', 'POST', 'AUTH_82462825c1dd4ecdb3ce22e68b70f5e9_POST_ADD', '2', '添加等级');
INSERT INTO `syspermission` VALUES ('4dbb7acd1a964ccfac105ca77368552e', 'POST', 'AUTH_2690d4cb2beb425daa06ff9faf8d97ec_POST_UPDATE', '1', '修改栏目');
INSERT INTO `syspermission` VALUES ('4e150361440b4132baf9d65563ccb6c7', 'GET', 'AUTH_5a8bd389628a4faaa96194435a14b384_GET_READ', '1', '全部待审核答案回复');
INSERT INTO `syspermission` VALUES ('50eb45ee72014011a3828b594988af72', 'GET', 'AUTH_088ec0225b114039aab46c17888125f2_GET_READ', '1', '点赞列表');
INSERT INTO `syspermission` VALUES ('5357d79b9cad4dc4b6b3ee3434977281', 'POST', 'AUTH_97bc7db41f8743978c70a104e49dd1c5_POST_DELETE', '1', '删除会员卡');
INSERT INTO `syspermission` VALUES ('53c95658c1a94f35bf5088be357f2d38', 'POST', 'AUTH_21a24ac2443043fbae750e4d6897e4be_POST_ADD', '2', '添加分类');
INSERT INTO `syspermission` VALUES ('5532bf13ebbc4881925c21c1aa96302c', 'GET', 'AUTH_5b89f2dc65b54197940c9f1b614c669e_GET_READ', '1', '布局列表');
INSERT INTO `syspermission` VALUES ('56d01e5582ce44b5a1cbe553a3336f21', 'GET', 'AUTH_673e0fdf492e4d97a19a761f8dcc203b_GET_READ', '1', '短信接口列表');
INSERT INTO `syspermission` VALUES ('57ceef23523041babd9cec2026f3fd7b', 'GET', 'AUTH_44406f79d290492aa113d528da21b317_GET_READ', '1', '添加在线支付接口页');
INSERT INTO `syspermission` VALUES ('57f777df1fd84e7a9ce88da91459c4dd', 'GET', 'AUTH_ef3e2b9c32634f4088f4066880c70677_GET_READ', '1', '修改版块页');
INSERT INTO `syspermission` VALUES ('58429820b3764a56a8fda45833ec4737', 'GET', 'AUTH_453b956048b044cfb4f3df143624aa68_GET_READ', '1', '解锁话题隐藏内容分成');
INSERT INTO `syspermission` VALUES ('5b9a0913454e47b4bef6d3e31ae38734', 'GET', 'AUTH_9e9721bf5cad43bdba3a7adecb47726f_GET_READ', '1', '添加页');
INSERT INTO `syspermission` VALUES ('5d52c02bc2754881b37cda5efcd765c5', 'GET', 'AUTH_3c98bf1cf2294c059cf0241fba5cfa00_GET_READ', '1', '导入模板列表');
INSERT INTO `syspermission` VALUES ('5e6c9bdfffbf4622854aedb55bd2eabf', 'GET', 'AUTH_35b5f850ff1c40fcbc9e57c1f2124a1b_GET_READ', '1', '积分日志');
INSERT INTO `syspermission` VALUES ('5f2c77490e4a4106b2b4c22fb0c59aaf', 'POST', 'AUTH_922f6908c5a1434aba4b0f6f8f008c1c_POST_ADD', '2', '添加版块');
INSERT INTO `syspermission` VALUES ('5f8d5f1735d145b59282e5eb840459f7', 'POST', 'AUTH_685794fae29a45b6a5d61416b39d7f71_POST_DELETE', '1', '删除版块');
INSERT INTO `syspermission` VALUES ('606368bc5d894dc69213360eeb3f3c1d', 'GET', 'AUTH_10f76770be4040a4bf50d0efb4dce35a_GET_READ', '1', '查看敏感词');
INSERT INTO `syspermission` VALUES ('61b55531648c46f89fd561cdcea09a64', 'POST', 'AUTH_607bbd310ec147519e8f988adf4c30a6_POST_UPDATE', '2', '修改评论');
INSERT INTO `syspermission` VALUES ('621036c4c1e94863a8600c3f771ed176', 'POST', 'AUTH_a046d8a39d3b44d694d8c7720cd6a7d2_POST_DELETE', '1', '删除答案');
INSERT INTO `syspermission` VALUES ('6271f4f215a349538099bd5ac40a5ddc', 'POST', 'AUTH_9be9600772e3420a91ee019acc3ba379_POST_ADD', '2', '添加答案回复');
INSERT INTO `syspermission` VALUES ('633e13950b7540eebf0d07022784962f', 'GET', 'AUTH_11f96911716c4498b562658224750b02_GET_READ', '1', '栏目列表');
INSERT INTO `syspermission` VALUES ('6446b6074a744354a67ca2fa983c213f', 'GET', 'AUTH_e25b31db1abd48eeb81f13881e314f91_GET_READ', '1', '会员列表');
INSERT INTO `syspermission` VALUES ('64cd7f08d9f941a4965f07aaf876b41b', 'POST', 'AUTH_e7443c7b35bc44a1a60f5f6a7530905b_POST_ADD', '1', '上传敏感词库');
INSERT INTO `syspermission` VALUES ('64e00e15204f4b9e8a87a03e161d2cd6', 'GET', 'AUTH_95a1e6ab0ea64972ab36f85f2940d8e9_GET_READ', '1', '提交的答案');
INSERT INTO `syspermission` VALUES ('657d2b2dcbd44934aad101f1e304e465', 'POST', 'AUTH_afa39379327e4461b3444cf9b416efae_POST_ADD', '2', '添加系统通知');
INSERT INTO `syspermission` VALUES ('66218378244c4c4fbe640f367b170a2a', 'GET', 'AUTH_1a95dfe74bec4c0b986e9f96b001bc7e_GET_READ', '1', '取消隐藏用户');
INSERT INTO `syspermission` VALUES ('66bca0f5d7064f0fa3217eb1b4b3dff9', 'POST', 'AUTH_ab10d2b5dc5e48a69727a6292ca072b4_POST_ADD', '2', '添加缩略图裁剪尺寸');
INSERT INTO `syspermission` VALUES ('6716c5bd261d4808ba41700b69f061e8', 'POST', 'AUTH_7ed8aa6ff34241329b9183e2f114ca64_POST_ADD', '2', '添加角色');
INSERT INTO `syspermission` VALUES ('694588ee74f9488ab0d647e6e722ccc4', 'GET', 'AUTH_01fe645ae71e4925892c159e948063e9_GET_READ', '1', '私信列表');
INSERT INTO `syspermission` VALUES ('697107528fb949c5a719e3208cd00908', 'GET', 'AUTH_c76fd58d86fd44c3ac6accebc12ae7fa_GET_READ', '1', '添加角色页');
INSERT INTO `syspermission` VALUES ('6ade5a05842c4d17ba41346b74724acd', 'GET', 'AUTH_bce6c687ee5645cda651cd6dfff74fa4_GET_READ', '1', '标签列表');
INSERT INTO `syspermission` VALUES ('6b0484a6e0a54374b82846816e108b46', 'GET', 'AUTH_838e778a22c0424ab11914d1e3b44379_GET_READ', '1', '修改角色页');
INSERT INTO `syspermission` VALUES ('6be1d4d0c2e04294b83075a44f4c5a87', 'POST', 'AUTH_5d697fdf29434ff4bbcd5bc6f1a9a415_POST_ADD', '1', '立即升级');
INSERT INTO `syspermission` VALUES ('6e9b4ddd5cf34072a01953fc220a2fd5', 'GET', 'AUTH_412fd399deac43cb8354a15db3b47bbf_GET_READ', '1', '添加布局页');
INSERT INTO `syspermission` VALUES ('7058d03b34d749f78d942940581cdbca', 'POST', 'AUTH_c128236bfefd4cf3b241357733581002_POST_UPDATE', '1', '审核答案');
INSERT INTO `syspermission` VALUES ('70a4210d51a246e396fd336a83e6397e', 'GET', 'AUTH_822e43c8499149d59fd5ee6f77153d35_GET_READ', '1', '发表的回复');
INSERT INTO `syspermission` VALUES ('70aa9bea6b8b4cd4aef87b9f28782d51', 'GET', 'AUTH_a2b73c63005149699adb7fb395467b49_GET_READ', '1', '版块代码源码编辑页');
INSERT INTO `syspermission` VALUES ('72ea89819e2248a3951dbe0be592f55f', 'POST', 'AUTH_b47dd6012f88406795205481d2916fd2_POST_ADD', '2', '引用评论');
INSERT INTO `syspermission` VALUES ('73e33d43deed43ae8f631f61ea4c7d93', 'POST', 'AUTH_ab73276d43184b2db5fa5a6bd76b1def_POST_DELETE', '1', '删除布局');
INSERT INTO `syspermission` VALUES ('74e6343d6b144a24a219185e6fab2f4f', 'GET', 'AUTH_c459ab7aa99e4f528c961dd45df4d8e5_GET_READ', '1', '会员详细');
INSERT INTO `syspermission` VALUES ('7565855bdad4464a9b2ef86ae988b163', 'POST', 'AUTH_bc413423f03f4f1d8d37178ae73eb9ed_POST_UPDATE', '2', '修改在线支付接口');
INSERT INTO `syspermission` VALUES ('75e4692e5c614f5abc7d7b5810cf59d9', 'GET', 'AUTH_1a93fe93805849d68e478bb91c28480b_GET_READ', '1', '添加问题页');
INSERT INTO `syspermission` VALUES ('763dd4de4298424387cf13c099fef025', 'POST', 'AUTH_cbe2d7086fee4d5390afe686e9cddad1_POST_UPDATE', '2', '修改模板');
INSERT INTO `syspermission` VALUES ('764fd678f9894d759a278734fb63d460', 'GET', 'AUTH_0e17c398c3dc46ef90657028e5a81b0f_GET_READ', '1', '问答悬赏平台分成');
INSERT INTO `syspermission` VALUES ('76ad5ec096c540d983dd318969a64f6f', 'GET', 'AUTH_c6d4bed764194be0a377be158ecdee4d_GET_READ', '1', '会员注册禁止用户名称列表');
INSERT INTO `syspermission` VALUES ('774d0cdd7c8c443e868c8192d787ff3b', 'POST', 'AUTH_9f27719619c244879c74ef032bf67684_POST_UPDATE', '2', '修改问题');
INSERT INTO `syspermission` VALUES ('7753d328281740808acf1ae0eadcbb3b', 'GET', 'AUTH_fbee16533927408789b4c0a096413635_GET_READ', '1', '角色列表');
INSERT INTO `syspermission` VALUES ('778a695cbabb4defb7e5e7d728c1ce97', 'POST', 'AUTH_59bb52174d2e4f318e0c5ed09f9bedb3_POST_ADD', '1', '资源文件上传');
INSERT INTO `syspermission` VALUES ('778b7933eb5c4171a2b53e167e22cd08', 'POST', 'AUTH_f58f9516975847fbbd8a2cd0230973f5_POST_DELETE', '1', '删除等级');
INSERT INTO `syspermission` VALUES ('78d335071bb0422badf8832a6faed506', 'GET', 'AUTH_c6e0d05a7d8a4a63b7d8b0c5ed44207f_GET_READ', '1', '登录日志');
INSERT INTO `syspermission` VALUES ('78f7f0b1dee44977a383578846eed604', 'GET', 'AUTH_64730717bf3e42169b22ff5f4529b0a8_GET_READ', '1', '话题搜索');
INSERT INTO `syspermission` VALUES ('7b4fdeb8d7014269aadf0744468743f7', 'GET', 'AUTH_d0f97697d6984656927b6dbcc9f9c4a0_GET_READ', '1', '登录日志');
INSERT INTO `syspermission` VALUES ('7dfbd05de7a14c9f87928c90bdda2192', 'GET', 'AUTH_ae66d24114ea4cf28923f5fe8757e4e6_GET_READ', '1', '服务器节点参数');
INSERT INTO `syspermission` VALUES ('7f29278f5aaf461988e0ca6ae380c212', 'POST', 'AUTH_bc248879066f4af58c99a822f4228015_POST_DELETE', '1', '删除资源');
INSERT INTO `syspermission` VALUES ('80fdfc5251234915924d6b310d510af7', 'GET', 'AUTH_c673918d949d4cc3aa38b43660b354b8_GET_READ', '1', '添加在线帮助页');
INSERT INTO `syspermission` VALUES ('81aec7f346434308beb898b261c90aee', 'POST', 'AUTH_4ce5c77610864d8885298a21793732ad_POST_UPDATE', '2', '修改标签');
INSERT INTO `syspermission` VALUES ('8540783c287245698b4e41c14c56e606', 'POST', 'AUTH_9c443950eb9746b49c7314dbf8e3d523_POST_UPDATE', '2', '基本设置');
INSERT INTO `syspermission` VALUES ('8556d08d0aa1479a980a2068dad291e5', 'GET', 'AUTH_90cd4aa4e6ef4154849630ae701fe37d_GET_READ', '1', '版块代码列表');
INSERT INTO `syspermission` VALUES ('86610021504e4daa814b0724804ff87d', 'GET', 'AUTH_21a24ac2443043fbae750e4d6897e4be_GET_READ', '1', '添加分类页');
INSERT INTO `syspermission` VALUES ('86d67b11fc0149bfad3a4189e2b94f36', 'POST', 'AUTH_e0aa4b8b3c51428eb6dd8227ffffe283_POST_UPDATE', '1', '导出模板');
INSERT INTO `syspermission` VALUES ('8761b202576a4f7189faffd32bf299ba', 'GET', 'AUTH_862368fdca464ebbb2937623648880d1_GET_READ', '1', '全部待审核话题');
INSERT INTO `syspermission` VALUES ('87af232710634e8ebab31d8d432c51da', 'GET', 'AUTH_afa39379327e4461b3444cf9b416efae_GET_READ', '1', '添加系统通知页');
INSERT INTO `syspermission` VALUES ('89404919a18c4bc5b68828c5d08a6598', 'GET', 'AUTH_cbe2d7086fee4d5390afe686e9cddad1_GET_READ', '1', '修改模板页');
INSERT INTO `syspermission` VALUES ('897746313447415da446fdb1fcae070c', 'POST', 'AUTH_c76fd58d86fd44c3ac6accebc12ae7fa_POST_ADD', '2', '添加角色');
INSERT INTO `syspermission` VALUES ('8987621aa88a4479b62d665b09e309e6', 'GET', 'AUTH_71b0cd5212874f21a2eb46d87278bc25_GET_READ', '1', '添加问题标签页');
INSERT INTO `syspermission` VALUES ('8acdceb3d436410b95c33ab0943df4bb', 'POST', 'AUTH_3a3f2b720eb74733b2e661de78decea0_POST_UPDATE', '1', '审核答案回复');
INSERT INTO `syspermission` VALUES ('8ad5245678b9413a94c7f27a181998bf', 'POST', 'AUTH_b83b0d29f07e4249b70067e00f54ef67_POST_ADD', '2', '添加禁止的用户名称');
INSERT INTO `syspermission` VALUES ('8ca6b8d1b2a74fc79126bbf910396c18', 'POST', 'AUTH_70737a78770041a18bccc71b4d17ecf8_POST_UPDATE', '1', '修改版块代码');
INSERT INTO `syspermission` VALUES ('8d35c5c4667747619886eda5b61e80f1', 'POST', 'AUTH_214f40c320124e839e7d0d7b00af2cbd_POST_UPDATE', '1', '删除浏览量数据');
INSERT INTO `syspermission` VALUES ('8f0d0bef28c34fc59c3a643eea3ad0f2', 'GET', 'AUTH_2a90880355b44225a7e42e3a394d020c_GET_READ', '1', '升级列表');
INSERT INTO `syspermission` VALUES ('8faaec7f982d4d3b9847b955fc8d973c', 'POST', 'AUTH_1a93fe93805849d68e478bb91c28480b_POST_ADD', '2', '添加问题');
INSERT INTO `syspermission` VALUES ('8fc70392b4fd405aabdb48c7a3bae7ed', 'POST', 'AUTH_7e6b62b229a84c0fa739373313f381c0_POST_UPDATE', '2', '修改追加问题');
INSERT INTO `syspermission` VALUES ('906235e44bc1410681174f4b350bac22', 'GET', 'AUTH_be324f36fad2467688724082c285d16e_GET_READ', '1', '后台框架');
INSERT INTO `syspermission` VALUES ('90acac5c5e9e4969b2a78f0613ee6b9a', 'POST', 'AUTH_412fd399deac43cb8354a15db3b47bbf_POST_ADD', '2', '添加布局');
INSERT INTO `syspermission` VALUES ('9117004d87d84d68992d737742a7fc98', 'GET', 'AUTH_74e391ff7c0d41aeab64e9373f16776a_GET_READ', '1', '会员卡列表');
INSERT INTO `syspermission` VALUES ('929524e601fd458993317a4f8a8be33a', 'POST', 'AUTH_75a262c3c48d4e21817541cd87fac000_POST_UPDATE', '2', '合并分类');
INSERT INTO `syspermission` VALUES ('9546840461a64c81bd080fcfffd3df0e', 'GET', 'AUTH_c09977cf64ef4a008e672a4ba8d8e004_GET_READ', '1', '全部待审核评论 ');
INSERT INTO `syspermission` VALUES ('958dd7d75ef547ea8ea0af5ed2a816c1', 'GET', 'AUTH_dcd7b0f0c5e44566b116694b96dac0e1_GET_READ', '1', '系统通知列表');
INSERT INTO `syspermission` VALUES ('9676a76072744b9b893b080389667675', 'POST', 'AUTH_a8b4ea7341944f03b4c468b0354371cc_POST_UPDATE', '1', '资源重命名');
INSERT INTO `syspermission` VALUES ('967733f255964ca3ac38a5cfdd4b3cd0', 'GET', 'AUTH_84b8ba7c751a488885fbfdeb25a0eca3_GET_READ', '1', '全部待审核问题');
INSERT INTO `syspermission` VALUES ('983b4609b07f403390d2df8b7a738bfe', 'POST', 'AUTH_baa1c014792c40edae687b4e169657ef_POST_UPDATE', '1', '重建话题索引');
INSERT INTO `syspermission` VALUES ('99014ba26f30421dbac81e489c444ebe', 'GET', 'AUTH_dd231daf558d4526bf0d95ee6cc6970e_GET_READ', '1', '数据库备份/还原列表');
INSERT INTO `syspermission` VALUES ('99999999999999999999999999999999', null, 'AUTH_ADMIN', '99999999', '查看');
INSERT INTO `syspermission` VALUES ('99d76e6d914d42cf9765ff1b6927d1f7', 'POST', 'AUTH_8dab213a3c11412795f51a834ba6bd05_POST_UPDATE', '1', '采纳答案');
INSERT INTO `syspermission` VALUES ('9b6b32f8e1d74a12ae60eff39caa5e1e', 'GET', 'AUTH_4de9ba43424146678772a69d0cd6ea4d_GET_READ', '1', '下载导出模板');
INSERT INTO `syspermission` VALUES ('9cd6aa6943934ec9b1b5dbe67edd6308', 'GET', 'AUTH_9c443950eb9746b49c7314dbf8e3d523_GET_READ', '1', '基本设置页');
INSERT INTO `syspermission` VALUES ('9fc9acd39cfb42e1960472bda97f87ce', 'POST', 'AUTH_0e2aa6a61c994088819af6a79c519ebf_POST_ADD', '1', '添加栏目');
INSERT INTO `syspermission` VALUES ('a1b1c49fc8f64d9aa7497d5b25816eee', 'GET', 'AUTH_407a285c7ec744a4b284b85339c296ec_GET_READ', '1', '查看话题');
INSERT INTO `syspermission` VALUES ('a2265142da1a43cd93794d3450935e03', 'POST', 'AUTH_face85b769b94dc489e719551eb58bbd_POST_UPDATE', '2', '修改');
INSERT INTO `syspermission` VALUES ('a3358191e3084c8a906fdd3fcd23cf65', 'GET', 'AUTH_71e587d45b384855831dcfa5db98f8fe_GET_READ', '1', '修改答案回复页');
INSERT INTO `syspermission` VALUES ('a4421d798f254077ab73cb440d23b126', 'POST', 'AUTH_a2b73c63005149699adb7fb395467b49_POST_UPDATE', '2', '版块代码源码编辑');
INSERT INTO `syspermission` VALUES ('a65e7b106ae7449880200557e60d014e', 'POST', 'AUTH_0e80dcd0f37940658faf50a8f3f9c331_POST_UPDATE', '1', '清空系统所有缓存');
INSERT INTO `syspermission` VALUES ('a6a211b1bc5b4c31a4b444ccddfc9c1b', 'GET', 'AUTH_7dee9a00f4dc474fa502cf0f8bc83224_GET_READ', '1', '添加会员注册项页');
INSERT INTO `syspermission` VALUES ('a75786d463494a21b2d8e0664141e92a', 'GET', 'AUTH_76ffb8fb053647c5b5905b0f605104fe_GET_READ', '1', '全部待审核答案');
INSERT INTO `syspermission` VALUES ('a8e77195a8ba42b3880f4d6935f8d1a1', 'GET', 'AUTH_8f440666921741ed8c4804732b34d75d_GET_READ', '1', '修改话题页');
INSERT INTO `syspermission` VALUES ('a97915e1f0864c9c93a88f268284df5f', 'GET', 'AUTH_8b9594bb5b8343dbadca64a4f8066b6e_GET_READ', '1', '添加回复页');
INSERT INTO `syspermission` VALUES ('a97984e18c42486bae7b5b9709309981', 'GET', 'AUTH_a7f6e1dcc5e943f48f4270dcfa056557_GET_READ', '1', '粉丝列表');
INSERT INTO `syspermission` VALUES ('aa7e41324b0d49f085fcbb400355f970', 'POST', 'AUTH_9e9721bf5cad43bdba3a7adecb47726f_POST_ADD', '2', '添加');
INSERT INTO `syspermission` VALUES ('aa95f8a8cc5542ee828b889f22583210', 'POST', 'AUTH_c4ab05ec118740c4bb01395e5e519332_POST_DELETE', '1', '删除');
INSERT INTO `syspermission` VALUES ('ace2d0e6f02f4189b08a63380f4f6b5a', 'POST', 'AUTH_ff3bfef595c1473a9dd2a1ba279ca010_POST_ADD', '1', '上传升级包');
INSERT INTO `syspermission` VALUES ('ad186f105f5344908a66dac76dbf7d06', 'POST', 'AUTH_5af3e8652bd14b48aea03fac91e1e0b7_POST_UPDATE', '2', '修改布局');
INSERT INTO `syspermission` VALUES ('aeb1ad5106554199bb6c16dfe6597c92', 'GET', 'AUTH_f6518fc5a5f84c11a5a569c493218f8f_GET_READ', '1', '压缩文件列表');
INSERT INTO `syspermission` VALUES ('aeb36a2e6c8848a7a35223e8961cfed4', 'POST', 'AUTH_7dee9a00f4dc474fa502cf0f8bc83224_POST_ADD', '2', '添加会员注册项');
INSERT INTO `syspermission` VALUES ('aff1310185ef404ba5fae9faff402468', 'GET', 'AUTH_8dd0e634ff4647e0b438b75fbde1148f_GET_READ', '1', '修改会员卡页');
INSERT INTO `syspermission` VALUES ('b0087f154eaf40be87fa3675768fd414', 'GET', 'AUTH_336407134b204deebb6d335ffe080612_GET_READ', '1', '修改问题标签页');
INSERT INTO `syspermission` VALUES ('b01cdaa1a9b14ba6970a31506f56ff23', 'POST', 'AUTH_eadf2a9785af45b08c5c42d6b1263133_POST_UPDATE', '1', '重建问题索引');
INSERT INTO `syspermission` VALUES ('b09e8b722bd6426388e7694a371cd9fd', 'POST', 'AUTH_e08a84e681ea4850be0a33c1f6d4c5f0_POST_DELETE', '1', '删除回复');
INSERT INTO `syspermission` VALUES ('b0d6061db5e24b2aa9b648b82acbca5e', 'POST', 'AUTH_5e5fc2f249c144f198b3aad24f665cdd_POST_DELETE', '1', '删除压缩文件');
INSERT INTO `syspermission` VALUES ('b1d0484dce464b06900be842cb6487a9', 'POST', 'AUTH_a0116147816444319d37e0e1562189b0_POST_DELETE', '1', '删除版块代码');
INSERT INTO `syspermission` VALUES ('b2b558e723eb4d75ae4c35c8b36b5c64', 'POST', 'AUTH_a1e816f03692448698b01a7ac01d2964_POST_ADD', '2', '添加话题');
INSERT INTO `syspermission` VALUES ('b343696f562c437facda8fb136de09c9', 'POST', 'AUTH_c370e4821b0e45b6946a7ab3181b3844_POST_DELETE', '1', '删除系统通知');
INSERT INTO `syspermission` VALUES ('b5c65a65008a46e3a9894825b98b182e', 'GET', 'AUTH_2e51f370f3c34d0bbfaf4a9f1ca7ee02_GET_READ', '1', '数据库还原页');
INSERT INTO `syspermission` VALUES ('b6506ade40334589b8d7f9a469645be5', 'GET', 'AUTH_ef3c77fb708c4775988e888f0e9186d4_GET_READ', '1', '员工列表');
INSERT INTO `syspermission` VALUES ('b6d19989f45c4c918a5588d5d339893a', 'POST', 'AUTH_c74888ede5e74dce8a656d722836d8b1_POST_UPDATE', '2', '修改答案');
INSERT INTO `syspermission` VALUES ('b6e330a0c462407590a51a6e1063677a', 'POST', 'AUTH_b0857fe7e73e487798150bd09b2063f6_POST_UPDATE', '1', '取消采纳答案');
INSERT INTO `syspermission` VALUES ('b6eeebf8952b4bc9a74b2e143911441d', 'GET', 'AUTH_6b12cf5fb0ce4927979775f3c76419ab_GET_READ', '1', '数据库备份页');
INSERT INTO `syspermission` VALUES ('b7b2dba53e1e41c98c15f1689a90d00b', 'POST', 'AUTH_27ac945d8df8433894da098a1192476d_POST_DELETE', '1', '删除角色');
INSERT INTO `syspermission` VALUES ('b8c3e2f7114e414b8fb99e001bdc1ca4', 'GET', 'AUTH_87ad98da3e7642e68109c33199968181_GET_READ', '1', '在线帮助分类列表');
INSERT INTO `syspermission` VALUES ('b98179ff230b4c8baf7abd8affb33468', 'GET', 'AUTH_fd7988fae4484db7a98a1d67b6d54cdc_GET_READ', '1', '全部待审核回复');
INSERT INTO `syspermission` VALUES ('bb1867da82bc4bf9ba1c404f7de7e0a4', 'GET', 'AUTH_607bbd310ec147519e8f988adf4c30a6_GET_READ', '1', '修改评论页');
INSERT INTO `syspermission` VALUES ('bb27abfac38e466db47a10922057429c', 'GET', 'AUTH_5c9e1ad37d2241d6b5eebe4d591f5da5_GET_READ', '1', '支付日志');
INSERT INTO `syspermission` VALUES ('bb4ca5ddf1884eb38e667274445372d7', 'GET', 'AUTH_e050f5451e4f4f7dba6c2cb51f7c393e_GET_READ', '1', '修改短信接口页');
INSERT INTO `syspermission` VALUES ('bb8ada1fcff747a7868d17bebda7e0f2', 'POST', 'AUTH_5485ebcbc00541458cd96eb6deda2eab_POST_UPDATE', '1', '审核评论');
INSERT INTO `syspermission` VALUES ('bc3cdb8d556f48098fdbb1bbb06bd273', 'POST', 'AUTH_71b0cd5212874f21a2eb46d87278bc25_POST_ADD', '2', '添加问题标签');
INSERT INTO `syspermission` VALUES ('c095eeeee5064a739c7856ffaf8a7e60', 'GET', 'AUTH_3b87a0950675425d9b46b0a9526acb46_GET_READ', '1', '追加问题页');
INSERT INTO `syspermission` VALUES ('c2442a047cc940cb862f97ae1fb4a21f', 'GET', 'AUTH_2a34da73c3ca436e9fb658f8a1639895_GET_READ', '1', '提交的答案回复');
INSERT INTO `syspermission` VALUES ('c418cc0799d1495aa02ab635819bf6fb', 'POST', 'AUTH_bee77a45dcdb428db42dcb2317648fe9_POST_UPDATE', '2', '修改员工');
INSERT INTO `syspermission` VALUES ('c4a175eaf6eb4e34b94bea54018391b1', 'GET', 'AUTH_042dc8a1921d4232bf4b01817011a960_GET_READ', '1', '发表的话题');
INSERT INTO `syspermission` VALUES ('c4c47e534e3048ed839d5a637b07020c', 'POST', 'AUTH_6b12cf5fb0ce4927979775f3c76419ab_POST_ADD', '2', '数据库备份');
INSERT INTO `syspermission` VALUES ('c511a5d43fd2483c9980a3ddd774caa7', 'GET', 'AUTH_8ce45be5ea284190b9d76138d8d5f6b2_GET_READ', '1', '打包文件页');
INSERT INTO `syspermission` VALUES ('c5491e097dfa4571b8a0b7117c79c978', 'POST', 'AUTH_d885d220f87a4b1a928e3eb93f922c02_POST_DELETE', '1', '删除升级包');
INSERT INTO `syspermission` VALUES ('c59de06e2db1498e97920d0d51ce8f32', 'POST', 'AUTH_d3f057d1100a4a79b97ab9715e01be04_POST_ADD_POST_UPDATE', '2', '添加标签');
INSERT INTO `syspermission` VALUES ('c60995081b5a434eab404e350a181d66', 'GET', 'AUTH_9a797b54d630450cb3cfadb1f2d94243_GET_READ', '1', '会员卡订单列表');
INSERT INTO `syspermission` VALUES ('c706d0be75314aefadedad63df77b056', 'POST', 'AUTH_336407134b204deebb6d335ffe080612_POST_UPDATE', '2', '修改问题标签');
INSERT INTO `syspermission` VALUES ('c78f3947c772431bb95dfbad58fe0fc3', 'GET', 'AUTH_75349725155243d2932fc754cea5f3ab_GET_READ', '1', '浏览量列表');
INSERT INTO `syspermission` VALUES ('c875a39da823436e8a77f4c251096dd4', 'POST', 'AUTH_0d5362ae1983422fa01bc03c079c850f_POST_DELETE', '1', '删除评论');
INSERT INTO `syspermission` VALUES ('c932f31b97a947d4a123222d8ae7fe92', 'GET', 'AUTH_557735f0f8ba4626b78224719e77cea3_GET_READ', '1', '修改禁止的用户名称页');
INSERT INTO `syspermission` VALUES ('ca00b2ec92d54b21b57b823a72f1024e', 'GET', 'AUTH_4bac717853cb4a7faf79905ea6cad412_GET_READ', '1', '版块源码编辑页');
INSERT INTO `syspermission` VALUES ('caeb9888ba65418d8a757ed91c69fe26', 'POST', 'AUTH_43c2cd191bd14af18ecabe5fa81b60cc_POST_DELETE', '1', '删除分类');
INSERT INTO `syspermission` VALUES ('cb607ae60b204da3b2c80c85929a190d', 'GET', 'AUTH_52bc2dbe4c0e437ebf93ce8b6575c6bb_GET_READ', '1', '修改页');
INSERT INTO `syspermission` VALUES ('cbc6da71f75d4ac582d0e88f257e7669', 'POST', 'AUTH_c027259a21a240d48b73c1683a346056_POST_DELETE', '1', '删除禁止的用户名称');
INSERT INTO `syspermission` VALUES ('cc2b89e39e374669980b67dabbd727eb', 'GET', 'AUTH_bc413423f03f4f1d8d37178ae73eb9ed_GET_READ', '1', '修改在线支付接口页');
INSERT INTO `syspermission` VALUES ('cc4fc4640905436a8fafe8533ffbe18f', 'GET', 'AUTH_face85b769b94dc489e719551eb58bbd_GET_READ', '1', '修改页');
INSERT INTO `syspermission` VALUES ('cd62c57b27af4b95bf3e9b868c318e98', 'GET', 'AUTH_399207e1956d465a8eb536e80ee5f5f0_GET_READ', '1', '系统通知列表');
INSERT INTO `syspermission` VALUES ('cd6e65c8117d47d6b905cd699953440d', 'POST', 'AUTH_e4d93f4f930a455f85868cfd5480f5d0_POST_DELETE', '1', '删除缩略图裁剪尺寸');
INSERT INTO `syspermission` VALUES ('ceb28608464548d58f191f29e987c858', 'GET', 'AUTH_607959c1d66c4900835c30532ebf656e_GET_READ', '1', '查看问题');
INSERT INTO `syspermission` VALUES ('cfe10d0e303b4eb1acfb725110af3570', 'GET', 'AUTH_c74888ede5e74dce8a656d722836d8b1_GET_READ', '1', '修改答案页');
INSERT INTO `syspermission` VALUES ('d17cf7897d1f42cbbfdc509ebf5f38de', 'GET', 'AUTH_515cd5fbdd72423ca083d3f44217fd25_GET_READ', '1', '添加短信接口页');
INSERT INTO `syspermission` VALUES ('d1c449631db742d79f5426739f8bbed7', 'POST', 'AUTH_557735f0f8ba4626b78224719e77cea3_POST_UPDATE', '2', '修改禁止的用户名称');
INSERT INTO `syspermission` VALUES ('d2912b5dd3b84ab396c0a87210e3ab30', 'POST', 'AUTH_b77f796a65694fed859fe1684d365589_POST_UPDATE', '1', '目录重命名');
INSERT INTO `syspermission` VALUES ('d39647de8f5b4b2b844a4eb9fc089c8e', 'GET', 'AUTH_d8ad4df8213e491c96bd143e1eec7b4c_GET_READ', '1', '收藏用户');
INSERT INTO `syspermission` VALUES ('d443ecbbb48d48a0adb0df74140510da', 'POST', 'AUTH_8f440666921741ed8c4804732b34d75d_POST_UPDATE', '2', '修改话题');
INSERT INTO `syspermission` VALUES ('d53a434d16b14b23b79bf31dee90a1ea', 'POST', 'AUTH_51a9dc467fb54948a1c71dc2365b5049_POST_UPDATE', '1', '删除用户登录日志数据');
INSERT INTO `syspermission` VALUES ('d7afdec202d44a85ad3239987d2fcf00', 'POST', 'AUTH_000d1e49b1984cceacaf4dbc2a38be86_POST_DELETE', '1', '删除标签');
INSERT INTO `syspermission` VALUES ('d7b687d7dd9e4b758dbc143625915076', 'POST', 'AUTH_4bac717853cb4a7faf79905ea6cad412_POST_UPDATE', '2', '版块源码编辑');
INSERT INTO `syspermission` VALUES ('d98a8e8c57b64a8fb89f7a0d994978eb', 'POST', 'AUTH_a4775968ad2e4b238ed49b4e4808a011_POST_UPDATE', '2', '修改回复');
INSERT INTO `syspermission` VALUES ('da0dad28fa434e9190fe67619c28bf59', 'POST', 'AUTH_c418c587feb14ecfabd9690d9f52d440_POST_UPDATE', '1', '还原私信');
INSERT INTO `syspermission` VALUES ('da332d9db98e4ce7b9023a9e76752ad3', 'GET', 'AUTH_a1e816f03692448698b01a7ac01d2964_GET_READ', '1', '添加话题页');
INSERT INTO `syspermission` VALUES ('dbc37f628d514de99469585bb89d4a45', 'POST', 'AUTH_31f98ef57f0a48a69c0ebb36c920dd1f_POST_DELETE', '1', '删除角色');
INSERT INTO `syspermission` VALUES ('dc1ba71e0da24d53a552beb64d1e3505', 'POST', 'AUTH_129aa71dc14049ccb0715268f24281aa_POST_ADD', '1', '上传模板');
INSERT INTO `syspermission` VALUES ('dca0b9b3bf664e9795c63bcf78633946', 'POST', 'AUTH_938b9dff2a27416abf6ae6ac21eaaaad_POST_DELETE', '1', '删除问题');
INSERT INTO `syspermission` VALUES ('dd280caa96f24e5b96a586071a7e6ff1', 'POST', 'AUTH_515cd5fbdd72423ca083d3f44217fd25_POST_ADD', '2', '添加短信接口');
INSERT INTO `syspermission` VALUES ('ddab9ef583b84da78fb60d2505430396', 'POST', 'AUTH_66af4e938332484f8a4f6e764a1d106c_POST_UPDATE', '2', '修改会员注册项');
INSERT INTO `syspermission` VALUES ('de2ae43b2077478ead903fa969172e1c', 'POST', 'AUTH_c0b306017906415abce45445b5606bd6_POST_ADD', '2', '添加答案');
INSERT INTO `syspermission` VALUES ('de484d1d48ce4b42b086f51b62af403f', 'GET', 'AUTH_9f27719619c244879c74ef032bf67684_GET_READ', '1', '修改问题页');
INSERT INTO `syspermission` VALUES ('dec929f879a74636a22f2f4992470c5d', 'POST', 'AUTH_b805b7dbbf0140b2a2fcb962e3fe4a4d_POST_UPDATE', '2', '修改分类');
INSERT INTO `syspermission` VALUES ('e04459a1d0b749ff9d619941fe747750', 'GET', 'AUTH_d2a54b45642a42fcac64fb15f1ac78e2_GET_READ', '1', '友情链接列表');
INSERT INTO `syspermission` VALUES ('e189c9ff166d48f19369852c9bee511a', 'GET', 'AUTH_58dc8b9d637a4ceda36b7083cd94bb76_GET_READ', '1', '关注列表');
INSERT INTO `syspermission` VALUES ('e2623b25d9884cfe9cb0a93b785d8362', 'GET', 'AUTH_7db8b118e2ec4ce9992e027eddda1648_GET_READ', '1', '版块列表');
INSERT INTO `syspermission` VALUES ('e2e27149dde94c078489038669e19e58', 'GET', 'AUTH_d3f057d1100a4a79b97ab9715e01be04_GET_READ', '1', '添加标签页');
INSERT INTO `syspermission` VALUES ('e38df097dc62482382dcf1bafe82ab6b', 'GET', 'AUTH_2a03829ee62c4283913dc440537f3fe9_GET_READ', '1', '修改角色页');
INSERT INTO `syspermission` VALUES ('e3e1aa79ab624d338eca2ba5be687262', 'GET', 'AUTH_32361852ba844d1f9ccdb220ce3b3cb1_GET_READ', '1', '版块引用代码');
INSERT INTO `syspermission` VALUES ('e4033ddf5bf14ea19249242cf83e5662', 'POST', 'AUTH_1ac87d3f1c0f4c99b9fdd9b713e304bf_POST_UPDATE', '1', '移动在线帮助');
INSERT INTO `syspermission` VALUES ('e587d664edc04f1199c76922c6444a43', 'GET', 'AUTH_66af4e938332484f8a4f6e764a1d106c_GET_READ', '1', '修改会员注册项页');
INSERT INTO `syspermission` VALUES ('e5b92c26f1d24283898773c273b6aaab', 'GET', 'AUTH_ab10d2b5dc5e48a69727a6292ca072b4_GET_READ', '1', '添加缩略图裁剪尺寸页');
INSERT INTO `syspermission` VALUES ('e96baee9362449d7b498fb527dec1d54', 'POST', 'AUTH_7f22ef589ea74b1c874b10fa6cd36b99_POST_DELETE', '1', '删除话题');
INSERT INTO `syspermission` VALUES ('eb186fe0b20447fba47e45846b51c344', 'POST', 'AUTH_e050f5451e4f4f7dba6c2cb51f7c393e_POST_UPDATE', '2', '修改短信接口');
INSERT INTO `syspermission` VALUES ('ec871e4a3c7842309abc22e3f6b9a1c3', 'POST', 'AUTH_9c5bebaa673b45bd9d1c5cba7a9dead9_POST_ADD', '1', '导入模板');
INSERT INTO `syspermission` VALUES ('ecd38983cce54e65b9b465c70c9c484e', 'GET', 'AUTH_7ed8aa6ff34241329b9183e2f114ca64_GET_READ', '1', '添加角色页');
INSERT INTO `syspermission` VALUES ('edcfef9b3d58434cbccebb85cc192bf7', 'GET', 'AUTH_803dc508fa8542f1a2be86cdb85b19f1_GET_READ', '1', '会员角色列表');
INSERT INTO `syspermission` VALUES ('ede920bcd4a7443ab7bc61e24994468e', 'POST', 'AUTH_032710d13fbe479686fff302b9e2a2ce_POST_UPDATE', '1', '还原话题');
INSERT INTO `syspermission` VALUES ('f0da7798ecc74190ab17da47634e5401', 'POST', 'AUTH_2c60d084290e4ac196c490864a292ae1_POST_UPDATE', '1', '启用短信接口');
INSERT INTO `syspermission` VALUES ('f1939cc01644444bba162f2a8325b91a', 'POST', 'AUTH_3aa16023dbcd43cb8ccba4352f9b7e58_POST_DELETE', '1', '删除追加问题');
INSERT INTO `syspermission` VALUES ('f19ccdc2eeea49939b4ed4c0cd3c0b49', 'GET', 'AUTH_abdea9b5ed4c4636a55062cf4f36ea0a_GET_READ', '1', '查看在线帮助');
INSERT INTO `syspermission` VALUES ('f2516b2ddfb44106a6c0c2f74201f4e9', 'GET', 'AUTH_6a87425f50f14afc98ebcc42c1e54637_GET_READ', '1', '会员等级列表');
INSERT INTO `syspermission` VALUES ('f25dd684c4954768ab254a9693a3b8af', 'POST', 'AUTH_1800baca07bc44ac986556dd30d37254_POST_ADD', '1', '资源新建文件夹');
INSERT INTO `syspermission` VALUES ('f36038f6f48040d9ba40b94342490736', 'POST', 'AUTH_f285c691b0f74b9ca549344722e5d780_POST_DELETE', '1', '删除栏目');
INSERT INTO `syspermission` VALUES ('f399670d423442909dadfe3238915cb8', 'GET', 'AUTH_70889956fee3475fb8487313d46f94c7_GET_READ', '1', '添加模板页');
INSERT INTO `syspermission` VALUES ('f574660f6bd24202aec13b86d95e7da9', 'POST', 'AUTH_7e763e0f214d42bfb2ba3cbeb9178c56_POST_DELETE', '1', '删除员工');
INSERT INTO `syspermission` VALUES ('f871f8eb397e40b9bd69b4496942875b', 'POST', 'AUTH_2e51f370f3c34d0bbfaf4a9f1ca7ee02_POST_ADD', '2', '数据库还原');
INSERT INTO `syspermission` VALUES ('fa3278919bba435e857a341de20f95c2', 'POST', 'AUTH_44406f79d290492aa113d528da21b317_POST_ADD', '2', '添加在线支付接口');
INSERT INTO `syspermission` VALUES ('fab2055b35d040d9b28f02c6630c630f', 'POST', 'AUTH_3c7306248d7a4788894ca4d9107e233e_POST_UPDATE', '1', '修改数据库密码');
INSERT INTO `syspermission` VALUES ('fb848a5fa3bf46919f54044aa3bb7c6f', 'GET', 'AUTH_4c891b4c92af4f6783e6b7d1b245e345_GET_READ', '1', '收藏夹列表');
INSERT INTO `syspermission` VALUES ('fc7adea930dc418886e8f791fce7dd8f', 'POST', 'AUTH_ad32af8a5d784a979da7b5362ca77882_POST_UPDATE', '1', '模板设为使用');
INSERT INTO `syspermission` VALUES ('fcd89db7a4fc4c25ad967366a3f9d19f', 'GET', 'AUTH_3b5ccd12071e49ccac480cc55b3f520a_GET_READ', '1', '收藏用户');
INSERT INTO `syspermission` VALUES ('fdde776dc2f44554871b0706b5fe89fc', 'POST', 'AUTH_7710a45b7cfa484183ee104ffe20f6c4_POST_DELETE', '1', '删除问题标签');

-- ----------------------------
-- Table structure for `syspermissionresources`
-- ----------------------------
DROP TABLE IF EXISTS `syspermissionresources`;
CREATE TABLE `syspermissionresources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` varchar(255) DEFAULT NULL,
  `resourceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1513 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of syspermissionresources
-- ----------------------------
INSERT INTO `syspermissionresources` VALUES ('48', '99999999999999999999999999999999', '4da6c6c0d67b49b7879bc160eac08c32');
INSERT INTO `syspermissionresources` VALUES ('399', '2b07e05a06784b4c8095ce0345b407a1', 'f365c635400e47eda1fc10589d7dbbcd');
INSERT INTO `syspermissionresources` VALUES ('400', '6446b6074a744354a67ca2fa983c213f', 'e25b31db1abd48eeb81f13881e314f91');
INSERT INTO `syspermissionresources` VALUES ('401', '0e5fa569a5584aacadc631e738257aeb', 'a02b3694e4d542398d3a39f4156e992f');
INSERT INTO `syspermissionresources` VALUES ('402', '2059b44286c3402c84e89d5d449eb305', 'a02b3694e4d542398d3a39f4156e992f');
INSERT INTO `syspermissionresources` VALUES ('405', 'aa95f8a8cc5542ee828b889f22583210', 'c4ab05ec118740c4bb01395e5e519332');
INSERT INTO `syspermissionresources` VALUES ('406', '3bca1bc44826413db5693edc927dd863', '2f4d3ec6741b4552a27d20781426df12');
INSERT INTO `syspermissionresources` VALUES ('413', 'cc4fc4640905436a8fafe8533ffbe18f', 'face85b769b94dc489e719551eb58bbd');
INSERT INTO `syspermissionresources` VALUES ('414', 'a2265142da1a43cd93794d3450935e03', 'face85b769b94dc489e719551eb58bbd');
INSERT INTO `syspermissionresources` VALUES ('425', '5e6c9bdfffbf4622854aedb55bd2eabf', '35b5f850ff1c40fcbc9e57c1f2124a1b');
INSERT INTO `syspermissionresources` VALUES ('426', '7b4fdeb8d7014269aadf0744468743f7', 'd0f97697d6984656927b6dbcc9f9c4a0');
INSERT INTO `syspermissionresources` VALUES ('431', 'f2516b2ddfb44106a6c0c2f74201f4e9', '6a87425f50f14afc98ebcc42c1e54637');
INSERT INTO `syspermissionresources` VALUES ('432', '4c701cb29334419fa58b66c9913532ea', '82462825c1dd4ecdb3ce22e68b70f5e9');
INSERT INTO `syspermissionresources` VALUES ('433', '4ce1fa996a4445849b169415cfb89826', '82462825c1dd4ecdb3ce22e68b70f5e9');
INSERT INTO `syspermissionresources` VALUES ('434', '0bee0cbdc5514c02adf8f0910971c90f', '9246901afe1b4d3fb501c3fc51be23c5');
INSERT INTO `syspermissionresources` VALUES ('435', '22d30d3080cc422e8878470f6db173fc', '9246901afe1b4d3fb501c3fc51be23c5');
INSERT INTO `syspermissionresources` VALUES ('437', '778b7933eb5c4171a2b53e167e22cd08', 'f58f9516975847fbbd8a2cd0230973f5');
INSERT INTO `syspermissionresources` VALUES ('438', '19facbaf34104cad9e532d40286753e7', '27af89b4f9344c73b1b792334e7fdfe2');
INSERT INTO `syspermissionresources` VALUES ('439', 'a6a211b1bc5b4c31a4b444ccddfc9c1b', '7dee9a00f4dc474fa502cf0f8bc83224');
INSERT INTO `syspermissionresources` VALUES ('440', 'aeb36a2e6c8848a7a35223e8961cfed4', '7dee9a00f4dc474fa502cf0f8bc83224');
INSERT INTO `syspermissionresources` VALUES ('441', 'e587d664edc04f1199c76922c6444a43', '66af4e938332484f8a4f6e764a1d106c');
INSERT INTO `syspermissionresources` VALUES ('442', 'ddab9ef583b84da78fb60d2505430396', '66af4e938332484f8a4f6e764a1d106c');
INSERT INTO `syspermissionresources` VALUES ('444', '2d5b3555fd764225bbdd1e8787d8198f', '513d70ed7f3e46eb91f8ea4bbfc89317');
INSERT INTO `syspermissionresources` VALUES ('448', 'b6506ade40334589b8d7f9a469645be5', 'ef3c77fb708c4775988e888f0e9186d4');
INSERT INTO `syspermissionresources` VALUES ('454', '78d335071bb0422badf8832a6faed506', 'c6e0d05a7d8a4a63b7d8b0c5ed44207f');
INSERT INTO `syspermissionresources` VALUES ('456', '7753d328281740808acf1ae0eadcbb3b', 'fbee16533927408789b4c0a096413635');
INSERT INTO `syspermissionresources` VALUES ('457', '697107528fb949c5a719e3208cd00908', 'c76fd58d86fd44c3ac6accebc12ae7fa');
INSERT INTO `syspermissionresources` VALUES ('458', '897746313447415da446fdb1fcae070c', 'c76fd58d86fd44c3ac6accebc12ae7fa');
INSERT INTO `syspermissionresources` VALUES ('462', 'e38df097dc62482382dcf1bafe82ab6b', '2a03829ee62c4283913dc440537f3fe9');
INSERT INTO `syspermissionresources` VALUES ('463', '356b58ddff4a4f85aa3dd1f874964314', '2a03829ee62c4283913dc440537f3fe9');
INSERT INTO `syspermissionresources` VALUES ('467', '2eb3a442ae964e03b0626dee0115a7cd', 'efa66bc116bc409fbf7bf23e4882d2d9');
INSERT INTO `syspermissionresources` VALUES ('468', '1f394709c4b74ac5a982ceea26a42d6e', 'efa66bc116bc409fbf7bf23e4882d2d9');
INSERT INTO `syspermissionresources` VALUES ('469', '21d93e122d3a4df4ac1b4748ef5a99a7', 'bee77a45dcdb428db42dcb2317648fe9');
INSERT INTO `syspermissionresources` VALUES ('470', 'c418cc0799d1495aa02ab635819bf6fb', 'bee77a45dcdb428db42dcb2317648fe9');
INSERT INTO `syspermissionresources` VALUES ('471', 'f574660f6bd24202aec13b86d95e7da9', '7e763e0f214d42bfb2ba3cbeb9178c56');
INSERT INTO `syspermissionresources` VALUES ('472', 'b7b2dba53e1e41c98c15f1689a90d00b', '27ac945d8df8433894da098a1192476d');
INSERT INTO `syspermissionresources` VALUES ('614', 'b8c3e2f7114e414b8fb99e001bdc1ca4', '87ad98da3e7642e68109c33199968181');
INSERT INTO `syspermissionresources` VALUES ('615', '86610021504e4daa814b0724804ff87d', '21a24ac2443043fbae750e4d6897e4be');
INSERT INTO `syspermissionresources` VALUES ('616', '53c95658c1a94f35bf5088be357f2d38', '21a24ac2443043fbae750e4d6897e4be');
INSERT INTO `syspermissionresources` VALUES ('619', 'caeb9888ba65418d8a757ed91c69fe26', '43c2cd191bd14af18ecabe5fa81b60cc');
INSERT INTO `syspermissionresources` VALUES ('626', '2d05a9c495ea48598814eb46f3852102', '75a262c3c48d4e21817541cd87fac000');
INSERT INTO `syspermissionresources` VALUES ('627', '929524e601fd458993317a4f8a8be33a', '75a262c3c48d4e21817541cd87fac000');
INSERT INTO `syspermissionresources` VALUES ('628', '2d05a9c495ea48598814eb46f3852102', 'cec90ad171374546b81868015755f9f8');
INSERT INTO `syspermissionresources` VALUES ('631', '11ac0bb2d9074573bdfcb40511a302b9', '5417c2d6e8a8453b972682fee374ec3a');
INSERT INTO `syspermissionresources` VALUES ('632', '11ac0bb2d9074573bdfcb40511a302b9', 'a6bc8f310a2642d7ad537e620eff3f85');
INSERT INTO `syspermissionresources` VALUES ('639', '80fdfc5251234915924d6b310d510af7', 'c673918d949d4cc3aa38b43660b354b8');
INSERT INTO `syspermissionresources` VALUES ('640', '34b600ff3fd4494cb3c34af2910b9c5e', 'c673918d949d4cc3aa38b43660b354b8');
INSERT INTO `syspermissionresources` VALUES ('641', '80fdfc5251234915924d6b310d510af7', 'd692c8ee90394774b449fc4060ee711d');
INSERT INTO `syspermissionresources` VALUES ('642', '34b600ff3fd4494cb3c34af2910b9c5e', 'b306453ca1f24bdabc62261b687e44a2');
INSERT INTO `syspermissionresources` VALUES ('659', '1889c935ddca4f81bf1046dccfcfe906', 'd75adb28b87d496e8627c11272b47476');
INSERT INTO `syspermissionresources` VALUES ('661', 'e4033ddf5bf14ea19249242cf83e5662', '1ac87d3f1c0f4c99b9fdd9b713e304bf');
INSERT INTO `syspermissionresources` VALUES ('662', '283b82e93f0f45e9aebe62a6fa3194bd', '9c3ddbaa3457496ab9315ce6f271db8d');
INSERT INTO `syspermissionresources` VALUES ('663', 'f19ccdc2eeea49939b4ed4c0cd3c0b49', 'abdea9b5ed4c4636a55062cf4f36ea0a');
INSERT INTO `syspermissionresources` VALUES ('665', '26767c89eeb84e56a411f686b3242491', 'b805b7dbbf0140b2a2fcb962e3fe4a4d');
INSERT INTO `syspermissionresources` VALUES ('666', 'dec929f879a74636a22f2f4992470c5d', 'b805b7dbbf0140b2a2fcb962e3fe4a4d');
INSERT INTO `syspermissionresources` VALUES ('667', '370562231d9447c797d9c9d4df04413b', '5ef5747987074212be7ef9cc9fdb50af');
INSERT INTO `syspermissionresources` VALUES ('668', '3fcd60e96e85430fa99e85886804dbc5', '5ef5747987074212be7ef9cc9fdb50af');
INSERT INTO `syspermissionresources` VALUES ('669', '370562231d9447c797d9c9d4df04413b', '2f6e1c7e19024a23ad13442f8a082e45');
INSERT INTO `syspermissionresources` VALUES ('670', '3fcd60e96e85430fa99e85886804dbc5', 'da59992eae3a4181bd14d31476aa8714');
INSERT INTO `syspermissionresources` VALUES ('772', '05bd42ccee274a6393edf7e5be2ed902', 'b9512c1642a54356b453ef6e9df32aee');
INSERT INTO `syspermissionresources` VALUES ('773', 'f399670d423442909dadfe3238915cb8', '70889956fee3475fb8487313d46f94c7');
INSERT INTO `syspermissionresources` VALUES ('774', '0c1ff61fb5664ba5b41d844b2bcbc5c5', '70889956fee3475fb8487313d46f94c7');
INSERT INTO `syspermissionresources` VALUES ('775', '89404919a18c4bc5b68828c5d08a6598', 'cbe2d7086fee4d5390afe686e9cddad1');
INSERT INTO `syspermissionresources` VALUES ('776', '763dd4de4298424387cf13c099fef025', 'cbe2d7086fee4d5390afe686e9cddad1');
INSERT INTO `syspermissionresources` VALUES ('784', '030ebf82676c4160920670728bce3cb2', 'd0482512ccd5439bb6610672c11f0cb2');
INSERT INTO `syspermissionresources` VALUES ('785', '8556d08d0aa1479a980a2068dad291e5', '90cd4aa4e6ef4154849630ae701fe37d');
INSERT INTO `syspermissionresources` VALUES ('786', '8556d08d0aa1479a980a2068dad291e5', 'fdbe57ac70804feea4e8679a190740ed');
INSERT INTO `syspermissionresources` VALUES ('787', '8556d08d0aa1479a980a2068dad291e5', '7df278798d2f448a90ea0be3f76fc629');
INSERT INTO `syspermissionresources` VALUES ('788', '40609cc4a8d24b1cae714d3b26549718', 'aa971ce1dc6f43e3b026d235fa7263e6');
INSERT INTO `syspermissionresources` VALUES ('789', '8ca6b8d1b2a74fc79126bbf910396c18', '70737a78770041a18bccc71b4d17ecf8');
INSERT INTO `syspermissionresources` VALUES ('790', 'b1d0484dce464b06900be842cb6487a9', 'a0116147816444319d37e0e1562189b0');
INSERT INTO `syspermissionresources` VALUES ('794', '490b90c22bd74cc49ffac5a8bf339cc3', 'd72acdb07d1540bab400c194ba3329f8');
INSERT INTO `syspermissionresources` VALUES ('795', '490b90c22bd74cc49ffac5a8bf339cc3', '8b1d44fee22c460dabb3381e97f1820f');
INSERT INTO `syspermissionresources` VALUES ('801', '7f29278f5aaf461988e0ca6ae380c212', 'bc248879066f4af58c99a822f4228015');
INSERT INTO `syspermissionresources` VALUES ('803', '5532bf13ebbc4881925c21c1aa96302c', '5b89f2dc65b54197940c9f1b614c669e');
INSERT INTO `syspermissionresources` VALUES ('804', '9b6b32f8e1d74a12ae60eff39caa5e1e', '4de9ba43424146678772a69d0cd6ea4d');
INSERT INTO `syspermissionresources` VALUES ('805', '1313b93cb906494d896c059eca62762a', 'fb9bce585d7d4aa89ddf30262540e660');
INSERT INTO `syspermissionresources` VALUES ('810', '19b5f1637e174a31a91c4ddcef3bb4c0', '5af3e8652bd14b48aea03fac91e1e0b7');
INSERT INTO `syspermissionresources` VALUES ('811', '19b5f1637e174a31a91c4ddcef3bb4c0', '5dad80e6fa6e4255b34181bd17c5fe02');
INSERT INTO `syspermissionresources` VALUES ('812', '19b5f1637e174a31a91c4ddcef3bb4c0', '77b721b60c014517a73134daaad021d9');
INSERT INTO `syspermissionresources` VALUES ('813', 'ad186f105f5344908a66dac76dbf7d06', '5af3e8652bd14b48aea03fac91e1e0b7');
INSERT INTO `syspermissionresources` VALUES ('814', '6e9b4ddd5cf34072a01953fc220a2fd5', '412fd399deac43cb8354a15db3b47bbf');
INSERT INTO `syspermissionresources` VALUES ('815', '90acac5c5e9e4969b2a78f0613ee6b9a', '412fd399deac43cb8354a15db3b47bbf');
INSERT INTO `syspermissionresources` VALUES ('816', '6e9b4ddd5cf34072a01953fc220a2fd5', '86307e97f57a4c8daecd6b13ea4a60e8');
INSERT INTO `syspermissionresources` VALUES ('817', '6e9b4ddd5cf34072a01953fc220a2fd5', 'd73f435972544a7fb03b6618948c07eb');
INSERT INTO `syspermissionresources` VALUES ('818', '70aa9bea6b8b4cd4aef87b9f28782d51', 'a2b73c63005149699adb7fb395467b49');
INSERT INTO `syspermissionresources` VALUES ('819', 'a4421d798f254077ab73cb440d23b126', 'a2b73c63005149699adb7fb395467b49');
INSERT INTO `syspermissionresources` VALUES ('820', '73e33d43deed43ae8f631f61ea4c7d93', 'ab73276d43184b2db5fa5a6bd76b1def');
INSERT INTO `syspermissionresources` VALUES ('821', '1f8a51f44c3f4dfe878c0b978a5720d6', '0d87e1fe8fdd45d48c5f259b8e423b2e');
INSERT INTO `syspermissionresources` VALUES ('822', '0b9dd9f7be554a4eb07ff7bf716a81b9', '0d87e1fe8fdd45d48c5f259b8e423b2e');
INSERT INTO `syspermissionresources` VALUES ('823', 'e2623b25d9884cfe9cb0a93b785d8362', '7db8b118e2ec4ce9992e027eddda1648');
INSERT INTO `syspermissionresources` VALUES ('866', '5f8d5f1735d145b59282e5eb840459f7', '685794fae29a45b6a5d61416b39d7f71');
INSERT INTO `syspermissionresources` VALUES ('889', '57f777df1fd84e7a9ce88da91459c4dd', 'ef3e2b9c32634f4088f4066880c70677');
INSERT INTO `syspermissionresources` VALUES ('890', '3aa152ed6319424097a29e41f3dd14d4', 'ef3e2b9c32634f4088f4066880c70677');
INSERT INTO `syspermissionresources` VALUES ('891', '57f777df1fd84e7a9ce88da91459c4dd', '41a824d4663243b39b2d34256eb3dbf2');
INSERT INTO `syspermissionresources` VALUES ('892', '57f777df1fd84e7a9ce88da91459c4dd', 'b002385af8e245aa823bf75adbd96eac');
INSERT INTO `syspermissionresources` VALUES ('893', '57f777df1fd84e7a9ce88da91459c4dd', '1d36080345f74b9a919b16bec5c235a6');
INSERT INTO `syspermissionresources` VALUES ('894', '57f777df1fd84e7a9ce88da91459c4dd', 'ef310b9be13a4630b40c99fe3baf1e4a');
INSERT INTO `syspermissionresources` VALUES ('895', '57f777df1fd84e7a9ce88da91459c4dd', 'd96a00544fcf470e98a4f062bc017559');
INSERT INTO `syspermissionresources` VALUES ('896', '57f777df1fd84e7a9ce88da91459c4dd', 'caedcace4fe746499146e97459919bb4');
INSERT INTO `syspermissionresources` VALUES ('897', '57f777df1fd84e7a9ce88da91459c4dd', '77b55fcc33184a009e1376e20e294eca');
INSERT INTO `syspermissionresources` VALUES ('898', '57f777df1fd84e7a9ce88da91459c4dd', 'de86a8fa661041ca9794a78275d0fcb1');
INSERT INTO `syspermissionresources` VALUES ('899', '57f777df1fd84e7a9ce88da91459c4dd', '120c74ce95624dbfacd192b90923958b');
INSERT INTO `syspermissionresources` VALUES ('900', '57f777df1fd84e7a9ce88da91459c4dd', 'c34676a187044553a4c42c56257413fd');
INSERT INTO `syspermissionresources` VALUES ('901', '57f777df1fd84e7a9ce88da91459c4dd', '567f89abd7e04a1988c08b9764cf918c');
INSERT INTO `syspermissionresources` VALUES ('902', '57f777df1fd84e7a9ce88da91459c4dd', '53662c3fbcd145068ba4760a6d1d39a9');
INSERT INTO `syspermissionresources` VALUES ('903', '3aa152ed6319424097a29e41f3dd14d4', '16f7e69c2af54ccda1d8414b6cef7d32');
INSERT INTO `syspermissionresources` VALUES ('906', 'ca00b2ec92d54b21b57b823a72f1024e', '4bac717853cb4a7faf79905ea6cad412');
INSERT INTO `syspermissionresources` VALUES ('907', 'd7b687d7dd9e4b758dbc143625915076', '4bac717853cb4a7faf79905ea6cad412');
INSERT INTO `syspermissionresources` VALUES ('916', 'fc7adea930dc418886e8f791fce7dd8f', 'ad32af8a5d784a979da7b5362ca77882');
INSERT INTO `syspermissionresources` VALUES ('917', '5d52c02bc2754881b37cda5efcd765c5', '3c98bf1cf2294c059cf0241fba5cfa00');
INSERT INTO `syspermissionresources` VALUES ('918', '86d67b11fc0149bfad3a4189e2b94f36', 'e0aa4b8b3c51428eb6dd8227ffffe283');
INSERT INTO `syspermissionresources` VALUES ('919', 'ec871e4a3c7842309abc22e3f6b9a1c3', '9c5bebaa673b45bd9d1c5cba7a9dead9');
INSERT INTO `syspermissionresources` VALUES ('920', '18d7283440854ef68e30bcc83671777f', '24bac9f0b1c84b0394a39c8933c7739d');
INSERT INTO `syspermissionresources` VALUES ('921', '778a695cbabb4defb7e5e7d728c1ce97', '59bb52174d2e4f318e0c5ed09f9bedb3');
INSERT INTO `syspermissionresources` VALUES ('923', 'f25dd684c4954768ab254a9693a3b8af', '1800baca07bc44ac986556dd30d37254');
INSERT INTO `syspermissionresources` VALUES ('924', '9676a76072744b9b893b080389667675', 'a8b4ea7341944f03b4c468b0354371cc');
INSERT INTO `syspermissionresources` VALUES ('925', '3add22feb0064256bc19c209d14b5aeb', '3d630529412f44c8be0c409bf12bbba7');
INSERT INTO `syspermissionresources` VALUES ('926', '633e13950b7540eebf0d07022784962f', '11f96911716c4498b562658224750b02');
INSERT INTO `syspermissionresources` VALUES ('927', '633e13950b7540eebf0d07022784962f', 'bdfb84d1d65b4325aa8a74a61a70a6a3');
INSERT INTO `syspermissionresources` VALUES ('928', '194e1a7a1fdc4a6eae2bd4db1dea2661', '922f6908c5a1434aba4b0f6f8f008c1c');
INSERT INTO `syspermissionresources` VALUES ('929', '5f2c77490e4a4106b2b4c22fb0c59aaf', '922f6908c5a1434aba4b0f6f8f008c1c');
INSERT INTO `syspermissionresources` VALUES ('930', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'd93b927d889a41f487efc41845f9c4ea');
INSERT INTO `syspermissionresources` VALUES ('931', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'a7bdf3297cc2431f9dd3f748374bf877');
INSERT INTO `syspermissionresources` VALUES ('932', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'b794e4584425495a8070fdc71d09258b');
INSERT INTO `syspermissionresources` VALUES ('933', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'a92781bed96b4a6e9f8348321ac2ddbc');
INSERT INTO `syspermissionresources` VALUES ('934', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'c7936b830e654abba9a0c1e76895747a');
INSERT INTO `syspermissionresources` VALUES ('935', '194e1a7a1fdc4a6eae2bd4db1dea2661', '81d79685ac4240c281dcda09bba59b53');
INSERT INTO `syspermissionresources` VALUES ('936', '194e1a7a1fdc4a6eae2bd4db1dea2661', '9c44a7e09b2744d58bccef05d11cdca7');
INSERT INTO `syspermissionresources` VALUES ('937', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'ec17504e564f4c958cb679377a39715d');
INSERT INTO `syspermissionresources` VALUES ('938', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'e8cfa842e1c24b54b67f1bbc6b828dbe');
INSERT INTO `syspermissionresources` VALUES ('939', '194e1a7a1fdc4a6eae2bd4db1dea2661', '7f520a1fe9ef45f79c7ac1d01a8c2e56');
INSERT INTO `syspermissionresources` VALUES ('940', '194e1a7a1fdc4a6eae2bd4db1dea2661', '0321d480f7604cc797b765d0ad0753a6');
INSERT INTO `syspermissionresources` VALUES ('941', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'ae6eeb2fbd23472d89022d9a7366b0cd');
INSERT INTO `syspermissionresources` VALUES ('942', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'c930706b667749d1b5784c37c6a4ffd4');
INSERT INTO `syspermissionresources` VALUES ('943', '5f2c77490e4a4106b2b4c22fb0c59aaf', 'c9791f2412c04860a0f8b4ddfc64cecb');
INSERT INTO `syspermissionresources` VALUES ('945', 'f36038f6f48040d9ba40b94342490736', 'f285c691b0f74b9ca549344722e5d780');
INSERT INTO `syspermissionresources` VALUES ('946', '4dbb7acd1a964ccfac105ca77368552e', '2690d4cb2beb425daa06ff9faf8d97ec');
INSERT INTO `syspermissionresources` VALUES ('947', '9fc9acd39cfb42e1960472bda97f87ce', '0e2aa6a61c994088819af6a79c519ebf');
INSERT INTO `syspermissionresources` VALUES ('948', 'e3e1aa79ab624d338eca2ba5be687262', '32361852ba844d1f9ccdb220ce3b3cb1');
INSERT INTO `syspermissionresources` VALUES ('1077', '74e6343d6b144a24a219185e6fab2f4f', 'c459ab7aa99e4f528c961dd45df4d8e5');
INSERT INTO `syspermissionresources` VALUES ('1078', '74e6343d6b144a24a219185e6fab2f4f', '3cb6db13692b4bebb71da2045154efe7');
INSERT INTO `syspermissionresources` VALUES ('1079', '74e6343d6b144a24a219185e6fab2f4f', '67cc5e6e087c4c6192d8448402765751');
INSERT INTO `syspermissionresources` VALUES ('1080', '74e6343d6b144a24a219185e6fab2f4f', 'c912c21f92ca46e693b8645e7ad89a8d');
INSERT INTO `syspermissionresources` VALUES ('1127', '9cd6aa6943934ec9b1b5dbe67edd6308', '9c443950eb9746b49c7314dbf8e3d523');
INSERT INTO `syspermissionresources` VALUES ('1128', '8540783c287245698b4e41c14c56e606', '9c443950eb9746b49c7314dbf8e3d523');
INSERT INTO `syspermissionresources` VALUES ('1129', '238bd1047afc4fc0a220977c44a07336', 'd613442d18c1465d8a981f420b3aa8cd');
INSERT INTO `syspermissionresources` VALUES ('1133', 'd53a434d16b14b23b79bf31dee90a1ea', '51a9dc467fb54948a1c71dc2365b5049');
INSERT INTO `syspermissionresources` VALUES ('1134', '99014ba26f30421dbac81e489c444ebe', 'dd231daf558d4526bf0d95ee6cc6970e');
INSERT INTO `syspermissionresources` VALUES ('1138', 'b6eeebf8952b4bc9a74b2e143911441d', '6b12cf5fb0ce4927979775f3c76419ab');
INSERT INTO `syspermissionresources` VALUES ('1139', 'c4c47e534e3048ed839d5a637b07020c', '6b12cf5fb0ce4927979775f3c76419ab');
INSERT INTO `syspermissionresources` VALUES ('1140', 'b6eeebf8952b4bc9a74b2e143911441d', 'da89532f94ed4e4193f9980c48609aac');
INSERT INTO `syspermissionresources` VALUES ('1141', 'b5c65a65008a46e3a9894825b98b182e', '2e51f370f3c34d0bbfaf4a9f1ca7ee02');
INSERT INTO `syspermissionresources` VALUES ('1142', 'b5c65a65008a46e3a9894825b98b182e', 'a5068ccfff8b42cf920f56aa780cbdad');
INSERT INTO `syspermissionresources` VALUES ('1143', 'f871f8eb397e40b9bd69b4496942875b', '2e51f370f3c34d0bbfaf4a9f1ca7ee02');
INSERT INTO `syspermissionresources` VALUES ('1145', '7dfbd05de7a14c9f87928c90bdda2192', 'ae66d24114ea4cf28923f5fe8757e4e6');
INSERT INTO `syspermissionresources` VALUES ('1146', '8f0d0bef28c34fc59c3a643eea3ad0f2', '2a90880355b44225a7e42e3a394d020c');
INSERT INTO `syspermissionresources` VALUES ('1147', '8f0d0bef28c34fc59c3a643eea3ad0f2', 'cee7dda9dd5e4a739b42f0dfa8b4b16d');
INSERT INTO `syspermissionresources` VALUES ('1148', '8f0d0bef28c34fc59c3a643eea3ad0f2', '3686068be6704f78a2ec5e30b78f043f');
INSERT INTO `syspermissionresources` VALUES ('1150', '6be1d4d0c2e04294b83075a44f4c5a87', '5d697fdf29434ff4bbcd5bc6f1a9a415');
INSERT INTO `syspermissionresources` VALUES ('1151', '6be1d4d0c2e04294b83075a44f4c5a87', 'ee03a28bd12f41b4a1e243ec05ca062b');
INSERT INTO `syspermissionresources` VALUES ('1152', 'ace2d0e6f02f4189b08a63380f4f6b5a', 'ff3bfef595c1473a9dd2a1ba279ca010');
INSERT INTO `syspermissionresources` VALUES ('1153', 'c5491e097dfa4571b8a0b7117c79c978', 'd885d220f87a4b1a928e3eb93f922c02');
INSERT INTO `syspermissionresources` VALUES ('1211', '0e0d51db38d54019883a97efae6a613c', '08a343e33ec44fe59228442dd56e96a3');
INSERT INTO `syspermissionresources` VALUES ('1212', 'e5b92c26f1d24283898773c273b6aaab', 'ab10d2b5dc5e48a69727a6292ca072b4');
INSERT INTO `syspermissionresources` VALUES ('1213', '66bca0f5d7064f0fa3217eb1b4b3dff9', 'ab10d2b5dc5e48a69727a6292ca072b4');
INSERT INTO `syspermissionresources` VALUES ('1214', 'cd6e65c8117d47d6b905cd699953440d', 'e4d93f4f930a455f85868cfd5480f5d0');
INSERT INTO `syspermissionresources` VALUES ('1237', 'a65e7b106ae7449880200557e60d014e', '0e80dcd0f37940658faf50a8f3f9c331');
INSERT INTO `syspermissionresources` VALUES ('1238', 'fab2055b35d040d9b28f02c6630c630f', '3c7306248d7a4788894ca4d9107e233e');
INSERT INTO `syspermissionresources` VALUES ('1250', '906235e44bc1410681174f4b350bac22', 'be324f36fad2467688724082c285d16e');
INSERT INTO `syspermissionresources` VALUES ('1251', '906235e44bc1410681174f4b350bac22', '47b25f8c2c6844c39025bce8ddfaa7fb');
INSERT INTO `syspermissionresources` VALUES ('1252', '56d01e5582ce44b5a1cbe553a3336f21', '673e0fdf492e4d97a19a761f8dcc203b');
INSERT INTO `syspermissionresources` VALUES ('1255', 'd17cf7897d1f42cbbfdc509ebf5f38de', '515cd5fbdd72423ca083d3f44217fd25');
INSERT INTO `syspermissionresources` VALUES ('1256', 'dd280caa96f24e5b96a586071a7e6ff1', '515cd5fbdd72423ca083d3f44217fd25');
INSERT INTO `syspermissionresources` VALUES ('1257', 'bb4ca5ddf1884eb38e667274445372d7', 'e050f5451e4f4f7dba6c2cb51f7c393e');
INSERT INTO `syspermissionresources` VALUES ('1258', 'eb186fe0b20447fba47e45846b51c344', 'e050f5451e4f4f7dba6c2cb51f7c393e');
INSERT INTO `syspermissionresources` VALUES ('1259', 'f0da7798ecc74190ab17da47634e5401', '2c60d084290e4ac196c490864a292ae1');
INSERT INTO `syspermissionresources` VALUES ('1260', '35e6084d7dc44b1ca8e9033302969275', 'bd36d2aa14774c8d81b56fc7fde02b4f');
INSERT INTO `syspermissionresources` VALUES ('1261', '3ddf4b633d8f474f9a8aaffd73db0482', '07dc355d349a41379673ede8b926520e');
INSERT INTO `syspermissionresources` VALUES ('1262', '76ad5ec096c540d983dd318969a64f6f', 'c6d4bed764194be0a377be158ecdee4d');
INSERT INTO `syspermissionresources` VALUES ('1263', '4ca50a54e8f54bb6ab063331f78a96d8', 'b83b0d29f07e4249b70067e00f54ef67');
INSERT INTO `syspermissionresources` VALUES ('1264', '8ad5245678b9413a94c7f27a181998bf', 'b83b0d29f07e4249b70067e00f54ef67');
INSERT INTO `syspermissionresources` VALUES ('1265', 'c932f31b97a947d4a123222d8ae7fe92', '557735f0f8ba4626b78224719e77cea3');
INSERT INTO `syspermissionresources` VALUES ('1266', 'd1c449631db742d79f5426739f8bbed7', '557735f0f8ba4626b78224719e77cea3');
INSERT INTO `syspermissionresources` VALUES ('1267', 'cbc6da71f75d4ac582d0e88f257e7669', 'c027259a21a240d48b73c1683a346056');
INSERT INTO `syspermissionresources` VALUES ('1305', 'dc1ba71e0da24d53a552beb64d1e3505', '129aa71dc14049ccb0715268f24281aa');
INSERT INTO `syspermissionresources` VALUES ('1306', 'd2912b5dd3b84ab396c0a87210e3ab30', 'b77f796a65694fed859fe1684d365589');
INSERT INTO `syspermissionresources` VALUES ('1321', '1a631db6c36e499cafd7d5211e61939f', '061d18aeb1044870b94cf6144a6004ea');
INSERT INTO `syspermissionresources` VALUES ('1328', 'da332d9db98e4ce7b9023a9e76752ad3', 'a1e816f03692448698b01a7ac01d2964');
INSERT INTO `syspermissionresources` VALUES ('1329', 'b2b558e723eb4d75ae4c35c8b36b5c64', 'a1e816f03692448698b01a7ac01d2964');
INSERT INTO `syspermissionresources` VALUES ('1330', 'da332d9db98e4ce7b9023a9e76752ad3', '657208b0b240489da050e672cbe10a85');
INSERT INTO `syspermissionresources` VALUES ('1331', 'b2b558e723eb4d75ae4c35c8b36b5c64', '517d8e1ea108440ebf3f01ca0f7bd322');
INSERT INTO `syspermissionresources` VALUES ('1332', 'a8e77195a8ba42b3880f4d6935f8d1a1', '8f440666921741ed8c4804732b34d75d');
INSERT INTO `syspermissionresources` VALUES ('1333', 'd443ecbbb48d48a0adb0df74140510da', '8f440666921741ed8c4804732b34d75d');
INSERT INTO `syspermissionresources` VALUES ('1334', 'a8e77195a8ba42b3880f4d6935f8d1a1', '559123bb91364943b1853c875901a598');
INSERT INTO `syspermissionresources` VALUES ('1335', 'd443ecbbb48d48a0adb0df74140510da', 'a9c55c3b3b45494dacef8fb058c7e7a7');
INSERT INTO `syspermissionresources` VALUES ('1336', 'e96baee9362449d7b498fb527dec1d54', '7f22ef589ea74b1c874b10fa6cd36b99');
INSERT INTO `syspermissionresources` VALUES ('1337', 'ede920bcd4a7443ab7bc61e24994468e', '032710d13fbe479686fff302b9e2a2ce');
INSERT INTO `syspermissionresources` VALUES ('1338', '78f7f0b1dee44977a383578846eed604', '64730717bf3e42169b22ff5f4529b0a8');
INSERT INTO `syspermissionresources` VALUES ('1339', '78f7f0b1dee44977a383578846eed604', 'b15ff404e0b64afcaa888311b1d0b0c8');
INSERT INTO `syspermissionresources` VALUES ('1340', '048060184aa747db94413aef590e6b97', 'fd848496836843b49ee6ed3ccdf6c14d');
INSERT INTO `syspermissionresources` VALUES ('1343', '2dabdbe7ec924ed2b8a15d8f06f9f457', '281466f5c0654966a68653b7383c6d9a');
INSERT INTO `syspermissionresources` VALUES ('1344', '2dabdbe7ec924ed2b8a15d8f06f9f457', '901d1d332b214483a90b5ef1738077a1');
INSERT INTO `syspermissionresources` VALUES ('1348', '3f59fbbaac5c4618a7766c775050bee5', 'b47dd6012f88406795205481d2916fd2');
INSERT INTO `syspermissionresources` VALUES ('1349', '72ea89819e2248a3951dbe0be592f55f', 'b47dd6012f88406795205481d2916fd2');
INSERT INTO `syspermissionresources` VALUES ('1350', '72ea89819e2248a3951dbe0be592f55f', '5ad1e2bb0bc846a1a0fa4da30031a719');
INSERT INTO `syspermissionresources` VALUES ('1351', 'bb1867da82bc4bf9ba1c404f7de7e0a4', '607bbd310ec147519e8f988adf4c30a6');
INSERT INTO `syspermissionresources` VALUES ('1352', '61b55531648c46f89fd561cdcea09a64', '607bbd310ec147519e8f988adf4c30a6');
INSERT INTO `syspermissionresources` VALUES ('1353', '61b55531648c46f89fd561cdcea09a64', 'd4b7953538294b67843c56f721d51a58');
INSERT INTO `syspermissionresources` VALUES ('1354', 'c875a39da823436e8a77f4c251096dd4', '0d5362ae1983422fa01bc03c079c850f');
INSERT INTO `syspermissionresources` VALUES ('1355', 'bb8ada1fcff747a7868d17bebda7e0f2', '5485ebcbc00541458cd96eb6deda2eab');
INSERT INTO `syspermissionresources` VALUES ('1356', 'a97915e1f0864c9c93a88f268284df5f', '8b9594bb5b8343dbadca64a4f8066b6e');
INSERT INTO `syspermissionresources` VALUES ('1357', '4831ce8be1af4dd9862ab173a19907d3', '8b9594bb5b8343dbadca64a4f8066b6e');
INSERT INTO `syspermissionresources` VALUES ('1358', '15c5191b69af4eb0a1862930c6fe176d', 'a4775968ad2e4b238ed49b4e4808a011');
INSERT INTO `syspermissionresources` VALUES ('1359', 'd98a8e8c57b64a8fb89f7a0d994978eb', 'a4775968ad2e4b238ed49b4e4808a011');
INSERT INTO `syspermissionresources` VALUES ('1360', 'b09e8b722bd6426388e7694a371cd9fd', 'e08a84e681ea4850be0a33c1f6d4c5f0');
INSERT INTO `syspermissionresources` VALUES ('1361', '47d2591d01cf49dd8122cc9a77d16094', '521ab07ea093458b8c0711c9783cfdec');
INSERT INTO `syspermissionresources` VALUES ('1362', '6ade5a05842c4d17ba41346b74724acd', 'bce6c687ee5645cda651cd6dfff74fa4');
INSERT INTO `syspermissionresources` VALUES ('1363', 'e2e27149dde94c078489038669e19e58', 'd3f057d1100a4a79b97ab9715e01be04');
INSERT INTO `syspermissionresources` VALUES ('1364', 'c59de06e2db1498e97920d0d51ce8f32', 'd3f057d1100a4a79b97ab9715e01be04');
INSERT INTO `syspermissionresources` VALUES ('1367', '3c05fdd591c8470b8622091893ff004c', '4ce5c77610864d8885298a21793732ad');
INSERT INTO `syspermissionresources` VALUES ('1368', '81aec7f346434308beb898b261c90aee', '4ce5c77610864d8885298a21793732ad');
INSERT INTO `syspermissionresources` VALUES ('1370', 'd7afdec202d44a85ad3239987d2fcf00', '000d1e49b1984cceacaf4dbc2a38be86');
INSERT INTO `syspermissionresources` VALUES ('1371', '8761b202576a4f7189faffd32bf299ba', '862368fdca464ebbb2937623648880d1');
INSERT INTO `syspermissionresources` VALUES ('1372', '9546840461a64c81bd080fcfffd3df0e', 'c09977cf64ef4a008e672a4ba8d8e004');
INSERT INTO `syspermissionresources` VALUES ('1373', 'b98179ff230b4c8baf7abd8affb33468', 'fd7988fae4484db7a98a1d67b6d54cdc');
INSERT INTO `syspermissionresources` VALUES ('1374', '1b80ca8dc02c4591997d420cc917d80b', '53ae04bf6468464ea15826a8d1bb7417');
INSERT INTO `syspermissionresources` VALUES ('1375', '4c87a7846ac54b09bb723808825be222', '1f706068a9d547dea69f89a64c89a741');
INSERT INTO `syspermissionresources` VALUES ('1376', '2857b3c00f5841c4920497ac57beac6b', '32ae2070e23d42ba8dc38de061e7ed47');
INSERT INTO `syspermissionresources` VALUES ('1377', 'e04459a1d0b749ff9d619941fe747750', 'd2a54b45642a42fcac64fb15f1ac78e2');
INSERT INTO `syspermissionresources` VALUES ('1378', '5b9a0913454e47b4bef6d3e31ae38734', '9e9721bf5cad43bdba3a7adecb47726f');
INSERT INTO `syspermissionresources` VALUES ('1379', 'aa7e41324b0d49f085fcbb400355f970', '9e9721bf5cad43bdba3a7adecb47726f');
INSERT INTO `syspermissionresources` VALUES ('1380', 'cb607ae60b204da3b2c80c85929a190d', '52bc2dbe4c0e437ebf93ce8b6575c6bb');
INSERT INTO `syspermissionresources` VALUES ('1381', '0998399706604b298db6533ef23ec0ac', '52bc2dbe4c0e437ebf93ce8b6575c6bb');
INSERT INTO `syspermissionresources` VALUES ('1382', '0f0ec2999fbb44f8846a20d58e828e59', '45f5ca24bf7441c08680d66b3aa6a8f6');
INSERT INTO `syspermissionresources` VALUES ('1383', 'c78f3947c772431bb95dfbad58fe0fc3', '75349725155243d2932fc754cea5f3ab');
INSERT INTO `syspermissionresources` VALUES ('1384', '983b4609b07f403390d2df8b7a738bfe', 'baa1c014792c40edae687b4e169657ef');
INSERT INTO `syspermissionresources` VALUES ('1385', '8d35c5c4667747619886eda5b61e80f1', '214f40c320124e839e7d0d7b00af2cbd');
INSERT INTO `syspermissionresources` VALUES ('1386', 'a1b1c49fc8f64d9aa7497d5b25816eee', '407a285c7ec744a4b284b85339c296ec');
INSERT INTO `syspermissionresources` VALUES ('1387', '606368bc5d894dc69213360eeb3f3c1d', '10f76770be4040a4bf50d0efb4dce35a');
INSERT INTO `syspermissionresources` VALUES ('1388', '64cd7f08d9f941a4965f07aaf876b41b', 'e7443c7b35bc44a1a60f5f6a7530905b');
INSERT INTO `syspermissionresources` VALUES ('1389', 'c4a175eaf6eb4e34b94bea54018391b1', '042dc8a1921d4232bf4b01817011a960');
INSERT INTO `syspermissionresources` VALUES ('1390', '0f7d3d4af8954ad18178b62d2f25d7f9', '0ae67eaf13ab4fc199a4406126dbaef4');
INSERT INTO `syspermissionresources` VALUES ('1391', '70a4210d51a246e396fd336a83e6397e', '822e43c8499149d59fd5ee6f77153d35');
INSERT INTO `syspermissionresources` VALUES ('1392', 'aeb1ad5106554199bb6c16dfe6597c92', 'f6518fc5a5f84c11a5a569c493218f8f');
INSERT INTO `syspermissionresources` VALUES ('1404', '10aefb57f2f247b290c91e2253e8ce2d', 'd297f75ec0514aa1953d9d1738634090');
INSERT INTO `syspermissionresources` VALUES ('1405', 'b0d6061db5e24b2aa9b648b82acbca5e', '5e5fc2f249c144f198b3aad24f665cdd');
INSERT INTO `syspermissionresources` VALUES ('1406', 'c511a5d43fd2483c9980a3ddd774caa7', '8ce45be5ea284190b9d76138d8d5f6b2');
INSERT INTO `syspermissionresources` VALUES ('1407', '22262588cd464d568f4d756512152c3d', '8ce45be5ea284190b9d76138d8d5f6b2');
INSERT INTO `syspermissionresources` VALUES ('1408', 'c511a5d43fd2483c9980a3ddd774caa7', '0afab98ea71c4550a3020156aea1e7c3');
INSERT INTO `syspermissionresources` VALUES ('1409', '694588ee74f9488ab0d647e6e722ccc4', '01fe645ae71e4925892c159e948063e9');
INSERT INTO `syspermissionresources` VALUES ('1410', '13f7169f2a0b48a591e701d5f5a034d0', '2bf084e1e8d84e89a1c2da9c5f6c8f5d');
INSERT INTO `syspermissionresources` VALUES ('1411', 'da0dad28fa434e9190fe67619c28bf59', 'c418c587feb14ecfabd9690d9f52d440');
INSERT INTO `syspermissionresources` VALUES ('1412', '4174d434346d4043935285874652531e', 'a5cb52cd59a040a1b34a7f401361fe31');
INSERT INTO `syspermissionresources` VALUES ('1413', '958dd7d75ef547ea8ea0af5ed2a816c1', 'dcd7b0f0c5e44566b116694b96dac0e1');
INSERT INTO `syspermissionresources` VALUES ('1414', '36001fdc50254da8a40de770517d148e', '7caf26294048452cafbb5972ef502d88');
INSERT INTO `syspermissionresources` VALUES ('1415', 'cd62c57b27af4b95bf3e9b868c318e98', '399207e1956d465a8eb536e80ee5f5f0');
INSERT INTO `syspermissionresources` VALUES ('1416', '87af232710634e8ebab31d8d432c51da', 'afa39379327e4461b3444cf9b416efae');
INSERT INTO `syspermissionresources` VALUES ('1417', '657d2b2dcbd44934aad101f1e304e465', 'afa39379327e4461b3444cf9b416efae');
INSERT INTO `syspermissionresources` VALUES ('1418', '447a7075ee9241b4b39e8976aa24709d', 'aa355abf953e42078517a3dded03e785');
INSERT INTO `syspermissionresources` VALUES ('1419', '3d795b3a0b1849fb8da486151cba9b8b', 'aa355abf953e42078517a3dded03e785');
INSERT INTO `syspermissionresources` VALUES ('1420', 'b343696f562c437facda8fb136de09c9', 'c370e4821b0e45b6946a7ab3181b3844');
INSERT INTO `syspermissionresources` VALUES ('1421', '1a362749eebe4b1f8d41643521125336', 'fc8554db852a4f128bdee595b4cd1ed8');
INSERT INTO `syspermissionresources` VALUES ('1428', '27464511268442c39980b0a8a25c2663', 'f2ddeb0bb4c94342854c6a2461869fb4');
INSERT INTO `syspermissionresources` VALUES ('1429', '3107b49684c54d51b54c45a7307228e0', '3338673059d44af39b27bf4cddc15bcc');
INSERT INTO `syspermissionresources` VALUES ('1430', 'fb848a5fa3bf46919f54044aa3bb7c6f', '4c891b4c92af4f6783e6b7d1b245e345');
INSERT INTO `syspermissionresources` VALUES ('1431', 'fcd89db7a4fc4c25ad967366a3f9d19f', '3b5ccd12071e49ccac480cc55b3f520a');
INSERT INTO `syspermissionresources` VALUES ('1432', '66218378244c4c4fbe640f367b170a2a', '1a95dfe74bec4c0b986e9f96b001bc7e');
INSERT INTO `syspermissionresources` VALUES ('1433', '1474318f7e2240739d00a85ff21778d1', '98e03673f0c847a2bc8f93008b1729ef');
INSERT INTO `syspermissionresources` VALUES ('1434', '50eb45ee72014011a3828b594988af72', '088ec0225b114039aab46c17888125f2');
INSERT INTO `syspermissionresources` VALUES ('1435', 'e189c9ff166d48f19369852c9bee511a', '58dc8b9d637a4ceda36b7083cd94bb76');
INSERT INTO `syspermissionresources` VALUES ('1436', 'a97984e18c42486bae7b5b9709309981', 'a7f6e1dcc5e943f48f4270dcfa056557');
INSERT INTO `syspermissionresources` VALUES ('1437', 'edcfef9b3d58434cbccebb85cc192bf7', '803dc508fa8542f1a2be86cdb85b19f1');
INSERT INTO `syspermissionresources` VALUES ('1438', 'ecd38983cce54e65b9b465c70c9c484e', '7ed8aa6ff34241329b9183e2f114ca64');
INSERT INTO `syspermissionresources` VALUES ('1439', '6716c5bd261d4808ba41700b69f061e8', '7ed8aa6ff34241329b9183e2f114ca64');
INSERT INTO `syspermissionresources` VALUES ('1440', '6b0484a6e0a54374b82846816e108b46', '838e778a22c0424ab11914d1e3b44379');
INSERT INTO `syspermissionresources` VALUES ('1441', '1e5cbc88d0d8489cabf925e70094b882', '838e778a22c0424ab11914d1e3b44379');
INSERT INTO `syspermissionresources` VALUES ('1442', 'dbc37f628d514de99469585bb89d4a45', '31f98ef57f0a48a69c0ebb36c920dd1f');
INSERT INTO `syspermissionresources` VALUES ('1443', '3402b228fb604030a83eac3c0e94373f', 'd5290b702acf41f286dc3d66c659d081');
INSERT INTO `syspermissionresources` VALUES ('1444', 'bb27abfac38e466db47a10922057429c', '5c9e1ad37d2241d6b5eebe4d591f5da5');
INSERT INTO `syspermissionresources` VALUES ('1445', '3944c3265a08408db9c8ac3a95862cfe', 'a15cab18081d4ec7b85b03646b873166');
INSERT INTO `syspermissionresources` VALUES ('1446', '294be5897f7c4770b7b2d0190e0a6bdd', '7d7842f34d6940738a767b3d7dd9a6ec');
INSERT INTO `syspermissionresources` VALUES ('1447', '9117004d87d84d68992d737742a7fc98', '74e391ff7c0d41aeab64e9373f16776a');
INSERT INTO `syspermissionresources` VALUES ('1448', '1cc026a6afec4d2c823901413e192bee', 'd71d35ca222a43e2bec6ceb76ac8097f');
INSERT INTO `syspermissionresources` VALUES ('1449', '2a881ff2307942a888e84ce2b7cb9a57', 'd71d35ca222a43e2bec6ceb76ac8097f');
INSERT INTO `syspermissionresources` VALUES ('1450', 'aff1310185ef404ba5fae9faff402468', '8dd0e634ff4647e0b438b75fbde1148f');
INSERT INTO `syspermissionresources` VALUES ('1451', '04931b8ad2db4512bb8c49d48f600b18', '8dd0e634ff4647e0b438b75fbde1148f');
INSERT INTO `syspermissionresources` VALUES ('1452', '5357d79b9cad4dc4b6b3ee3434977281', '97bc7db41f8743978c70a104e49dd1c5');
INSERT INTO `syspermissionresources` VALUES ('1453', 'c60995081b5a434eab404e350a181d66', '9a797b54d630450cb3cfadb1f2d94243');
INSERT INTO `syspermissionresources` VALUES ('1454', '58429820b3764a56a8fda45833ec4737', '453b956048b044cfb4f3df143624aa68');
INSERT INTO `syspermissionresources` VALUES ('1455', '3c6e8be51c62407c9d6a9072866c728d', '05568f678d8e43018b884f0bba9dd600');
INSERT INTO `syspermissionresources` VALUES ('1456', '57ceef23523041babd9cec2026f3fd7b', '44406f79d290492aa113d528da21b317');
INSERT INTO `syspermissionresources` VALUES ('1457', 'fa3278919bba435e857a341de20f95c2', '44406f79d290492aa113d528da21b317');
INSERT INTO `syspermissionresources` VALUES ('1458', 'cc2b89e39e374669980b67dabbd727eb', 'bc413423f03f4f1d8d37178ae73eb9ed');
INSERT INTO `syspermissionresources` VALUES ('1459', '7565855bdad4464a9b2ef86ae988b163', 'bc413423f03f4f1d8d37178ae73eb9ed');
INSERT INTO `syspermissionresources` VALUES ('1460', '381f2e01b83742149361cb116c106e12', 'da63bf83542e47bdacdada8a8abf8166');
INSERT INTO `syspermissionresources` VALUES ('1461', '3a459f7f04b64379bea2ae724cf3f78a', 'ca0e7a1a86384639a025a3fab07bd963');
INSERT INTO `syspermissionresources` VALUES ('1462', 'ceb28608464548d58f191f29e987c858', '607959c1d66c4900835c30532ebf656e');
INSERT INTO `syspermissionresources` VALUES ('1463', '75e4692e5c614f5abc7d7b5810cf59d9', '1a93fe93805849d68e478bb91c28480b');
INSERT INTO `syspermissionresources` VALUES ('1464', '8faaec7f982d4d3b9847b955fc8d973c', '1a93fe93805849d68e478bb91c28480b');
INSERT INTO `syspermissionresources` VALUES ('1465', '75e4692e5c614f5abc7d7b5810cf59d9', 'b4f51bedcc8d45448e980aec0f32a79f');
INSERT INTO `syspermissionresources` VALUES ('1466', '8faaec7f982d4d3b9847b955fc8d973c', '680e74218d4e4703b6f672cb7d51b7b9');
INSERT INTO `syspermissionresources` VALUES ('1467', 'de484d1d48ce4b42b086f51b62af403f', '9f27719619c244879c74ef032bf67684');
INSERT INTO `syspermissionresources` VALUES ('1468', '774d0cdd7c8c443e868c8192d787ff3b', '9f27719619c244879c74ef032bf67684');
INSERT INTO `syspermissionresources` VALUES ('1469', 'de484d1d48ce4b42b086f51b62af403f', '669021ae338942df96d09b1ffe0729b9');
INSERT INTO `syspermissionresources` VALUES ('1470', '774d0cdd7c8c443e868c8192d787ff3b', '8f22d9489e3b488d8ee59a76377ee96b');
INSERT INTO `syspermissionresources` VALUES ('1471', 'dca0b9b3bf664e9795c63bcf78633946', '938b9dff2a27416abf6ae6ac21eaaaad');
INSERT INTO `syspermissionresources` VALUES ('1472', '1d34b3ce43ae4d8f962a8b27381a3dec', '670eb3b034d34a82a6053de088e27d0a');
INSERT INTO `syspermissionresources` VALUES ('1473', '211fa9879cdc41b7b7e8ed3fe308278e', 'decb896d7fee40f09a958647cf14b849');
INSERT INTO `syspermissionresources` VALUES ('1474', '99d76e6d914d42cf9765ff1b6927d1f7', '8dab213a3c11412795f51a834ba6bd05');
INSERT INTO `syspermissionresources` VALUES ('1475', 'b6e330a0c462407590a51a6e1063677a', 'b0857fe7e73e487798150bd09b2063f6');
INSERT INTO `syspermissionresources` VALUES ('1476', 'de2ae43b2077478ead903fa969172e1c', 'c0b306017906415abce45445b5606bd6');
INSERT INTO `syspermissionresources` VALUES ('1477', 'de2ae43b2077478ead903fa969172e1c', 'ef1afb617a754220a0b27ec0cb01efa8');
INSERT INTO `syspermissionresources` VALUES ('1478', 'cfe10d0e303b4eb1acfb725110af3570', 'c74888ede5e74dce8a656d722836d8b1');
INSERT INTO `syspermissionresources` VALUES ('1479', 'b6d19989f45c4c918a5588d5d339893a', 'c74888ede5e74dce8a656d722836d8b1');
INSERT INTO `syspermissionresources` VALUES ('1480', 'b6d19989f45c4c918a5588d5d339893a', 'cf8e8bd2ea2549ae9a4cfe7356c04be4');
INSERT INTO `syspermissionresources` VALUES ('1481', '621036c4c1e94863a8600c3f771ed176', 'a046d8a39d3b44d694d8c7720cd6a7d2');
INSERT INTO `syspermissionresources` VALUES ('1482', 'a3358191e3084c8a906fdd3fcd23cf65', '71e587d45b384855831dcfa5db98f8fe');
INSERT INTO `syspermissionresources` VALUES ('1483', '0cb6e21b9d254dd881c201b577fa46f6', '71e587d45b384855831dcfa5db98f8fe');
INSERT INTO `syspermissionresources` VALUES ('1484', '260db4f1552c4f09a5f6f999e896cdac', '9be9600772e3420a91ee019acc3ba379');
INSERT INTO `syspermissionresources` VALUES ('1485', '6271f4f215a349538099bd5ac40a5ddc', '9be9600772e3420a91ee019acc3ba379');
INSERT INTO `syspermissionresources` VALUES ('1486', '1931aeb8dd194f8282ebbd4085166f52', '62c2facd01254ffe99ce7692def6815f');
INSERT INTO `syspermissionresources` VALUES ('1487', '7058d03b34d749f78d942940581cdbca', 'c128236bfefd4cf3b241357733581002');
INSERT INTO `syspermissionresources` VALUES ('1488', '8acdceb3d436410b95c33ab0943df4bb', '3a3f2b720eb74733b2e661de78decea0');
INSERT INTO `syspermissionresources` VALUES ('1489', '2f44f50ef9184640b7578bd1eeb9888c', '4ab032ea2c53438799d6b32b0eebb60b');
INSERT INTO `syspermissionresources` VALUES ('1490', '8987621aa88a4479b62d665b09e309e6', '71b0cd5212874f21a2eb46d87278bc25');
INSERT INTO `syspermissionresources` VALUES ('1491', 'bc3cdb8d556f48098fdbb1bbb06bd273', '71b0cd5212874f21a2eb46d87278bc25');
INSERT INTO `syspermissionresources` VALUES ('1492', 'b0087f154eaf40be87fa3675768fd414', '336407134b204deebb6d335ffe080612');
INSERT INTO `syspermissionresources` VALUES ('1493', 'c706d0be75314aefadedad63df77b056', '336407134b204deebb6d335ffe080612');
INSERT INTO `syspermissionresources` VALUES ('1494', 'fdde776dc2f44554871b0706b5fe89fc', '7710a45b7cfa484183ee104ffe20f6c4');
INSERT INTO `syspermissionresources` VALUES ('1495', '967733f255964ca3ac38a5cfdd4b3cd0', '84b8ba7c751a488885fbfdeb25a0eca3');
INSERT INTO `syspermissionresources` VALUES ('1496', 'a75786d463494a21b2d8e0664141e92a', '76ffb8fb053647c5b5905b0f605104fe');
INSERT INTO `syspermissionresources` VALUES ('1497', '4e150361440b4132baf9d65563ccb6c7', '5a8bd389628a4faaa96194435a14b384');
INSERT INTO `syspermissionresources` VALUES ('1498', '36aaf8e88b324c3b8ce50276cb83e901', 'ad17b7a816ea45b09be8084be966ba4b');
INSERT INTO `syspermissionresources` VALUES ('1499', '36aaf8e88b324c3b8ce50276cb83e901', '6c6b8190a0864463b68f9f514b1ad4d0');
INSERT INTO `syspermissionresources` VALUES ('1500', '3093827bb1314f9ab1ba5068fa94bdf6', '37f5d0f7095b4093a772593dd4e28a39');
INSERT INTO `syspermissionresources` VALUES ('1501', '64e00e15204f4b9e8a87a03e161d2cd6', '95a1e6ab0ea64972ab36f85f2940d8e9');
INSERT INTO `syspermissionresources` VALUES ('1502', 'c2442a047cc940cb862f97ae1fb4a21f', '2a34da73c3ca436e9fb658f8a1639895');
INSERT INTO `syspermissionresources` VALUES ('1503', 'b01cdaa1a9b14ba6970a31506f56ff23', 'eadf2a9785af45b08c5c42d6b1263133');
INSERT INTO `syspermissionresources` VALUES ('1504', 'c095eeeee5064a739c7856ffaf8a7e60', '3b87a0950675425d9b46b0a9526acb46');
INSERT INTO `syspermissionresources` VALUES ('1505', '12d63c0e375a47728d4c182372529b8e', '3b87a0950675425d9b46b0a9526acb46');
INSERT INTO `syspermissionresources` VALUES ('1506', '12d63c0e375a47728d4c182372529b8e', '44b819a086634eb894a353009c49fc9d');
INSERT INTO `syspermissionresources` VALUES ('1507', '139ded1d586348f78e3751c9dc8dec13', '7e6b62b229a84c0fa739373313f381c0');
INSERT INTO `syspermissionresources` VALUES ('1508', '8fc70392b4fd405aabdb48c7a3bae7ed', '7e6b62b229a84c0fa739373313f381c0');
INSERT INTO `syspermissionresources` VALUES ('1509', '8fc70392b4fd405aabdb48c7a3bae7ed', '005a590d129146aeb8a1989690235b30');
INSERT INTO `syspermissionresources` VALUES ('1510', 'f1939cc01644444bba162f2a8325b91a', '3aa16023dbcd43cb8ccba4352f9b7e58');
INSERT INTO `syspermissionresources` VALUES ('1511', 'd39647de8f5b4b2b844a4eb9fc089c8e', 'd8ad4df8213e491c96bd143e1eec7b4c');
INSERT INTO `syspermissionresources` VALUES ('1512', '764fd678f9894d759a278734fb63d460', '0e17c398c3dc46ef90657028e5a81b0f');

-- ----------------------------
-- Table structure for `sysresources`
-- ----------------------------
DROP TABLE IF EXISTS `sysresources`;
CREATE TABLE `sysresources` (
  `id` varchar(32) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `urlParentId` varchar(255) DEFAULT NULL,
  `urlType` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysresources
-- ----------------------------
INSERT INTO `sysresources` VALUES ('000d1e49b1984cceacaf4dbc2a38be86', '话题管理', '删除标签', '15500', null, '/control/tag/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('005a590d129146aeb8a1989690235b30', '问答管理', '文件上传', '0', null, '/control/question/manage.htm?method=upload&*', '7e6b62b229a84c0fa739373313f381c0', '2');
INSERT INTO `sysresources` VALUES ('01fe645ae71e4925892c159e948063e9', '会员管理', '私信列表', '27000', '', '/control/privateMessage/manage.htm?method=privateMessageList&*', null, null);
INSERT INTO `sysresources` VALUES ('0321d480f7604cc797b765d0ad0753a6', '模板管理', '查询在线帮助分类', '10', null, '/control/helpType/manage.htm?method=helpTypePageSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('032710d13fbe479686fff302b9e2a2ce', '话题管理', '还原话题', '12600', null, '/control/topic/manage.htm?method=reduction*', null, null);
INSERT INTO `sysresources` VALUES ('042dc8a1921d4232bf4b01817011a960', '会员管理', '发表的话题', '26700', null, '/control/user/manage.htm?method=allTopic*', null, null);
INSERT INTO `sysresources` VALUES ('05568f678d8e43018b884f0bba9dd600', '支付管理', '在线支付接口列表', '52000', '', '/control/onlinePaymentInterface/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('061d18aeb1044870b94cf6144a6004ea', '话题管理', '话题列表', '10000', null, '/control/topic/list*', null, null);
INSERT INTO `sysresources` VALUES ('07dc355d349a41379673ede8b926520e', '短信管理', '短信发送错误日志列表', '48550', null, '/control/sendSmsLog/list*', null, null);
INSERT INTO `sysresources` VALUES ('088ec0225b114039aab46c17888125f2', '会员管理', '点赞列表', '27465', '', '/control/like/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('08a343e33ec44fe59228442dd56e96a3', '样式缩略图管理', '缩略图列表', '59000', null, '/control/thumbnail/list*', null, null);
INSERT INTO `sysresources` VALUES ('0ae67eaf13ab4fc199a4406126dbaef4', '会员管理', '发表的评论', '26800', null, '/control/user/manage.htm?method=allComment*', null, null);
INSERT INTO `sysresources` VALUES ('0afab98ea71c4550a3020156aea1e7c3', '文件打包管理', '查询子目录', '0', null, '/control/filePackage/manage.htm?method=querySubdirectory&*', '8ce45be5ea284190b9d76138d8d5f6b2', '1');
INSERT INTO `sysresources` VALUES ('0d5362ae1983422fa01bc03c079c850f', '话题管理', '删除评论', '13500', null, '/control/comment/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('0d87e1fe8fdd45d48c5f259b8e423b2e', '模板管理', '布局编辑', '42600', null, '/control/layout/manage.htm?method=editLayoutCode&*', null, null);
INSERT INTO `sysresources` VALUES ('0e17c398c3dc46ef90657028e5a81b0f', '平台收益管理', '问答悬赏平台分成', '46450', '', '/control/questionRewardPlatformShare/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('0e2aa6a61c994088819af6a79c519ebf', '模板管理', '添加栏目', '43400', null, '/control/column/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('0e80dcd0f37940658faf50a8f3f9c331', '全站设置', '清空系统所有缓存', '49240', null, '/control/systemSetting/manage.htm?method=clearAllCache&*', null, null);
INSERT INTO `sysresources` VALUES ('10f76770be4040a4bf50d0efb4dce35a', '全站设置', '查看敏感词', '49550', null, '/control/filterWord/manage.htm?method=view*', null, null);
INSERT INTO `sysresources` VALUES ('11f96911716c4498b562658224750b02', '模板管理', '栏目列表', '43200', null, '/control/column/manage.htm?method=list&*', null, null);
INSERT INTO `sysresources` VALUES ('120c74ce95624dbfacd192b90923958b', '模板管理', '查询资讯分页', '8', null, '/control/information/manage.htm?method=ajax_searchInformationPage&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('129aa71dc14049ccb0715268f24281aa', '模板管理', '上传模板', '40550', null, '/control/template/manage.htm?method=upload*', null, null);
INSERT INTO `sysresources` VALUES ('16f7e69c2af54ccda1d8414b6cef7d32', '模板管理', '文件上传', '0', null, '/control/forum/manage.htm?method=upload&*', 'ef3e2b9c32634f4088f4066880c70677', '2');
INSERT INTO `sysresources` VALUES ('1800baca07bc44ac986556dd30d37254', '模板管理', '资源新建文件夹', '41800', null, '/control/resource/manage.htm?method=newFolder*', null, null);
INSERT INTO `sysresources` VALUES ('1a93fe93805849d68e478bb91c28480b', '问答管理', '添加问题', '20200', '', '/control/question/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('1a95dfe74bec4c0b986e9f96b001bc7e', '话题管理', '取消隐藏用户', '12630', '', '/control/topic/topicUnhideList.htm*', null, null);
INSERT INTO `sysresources` VALUES ('1ac87d3f1c0f4c99b9fdd9b713e304bf', '在线帮助管理', '移动在线帮助', '38900', null, '/control/help/manage.htm?method=move*', null, null);
INSERT INTO `sysresources` VALUES ('1d36080345f74b9a919b16bec5c235a6', '模板管理', '查询商品分类属性', '2', null, '/control/productTypeAttribute/manage.htm?method=queryProductTypeAttribute&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('1f706068a9d547dea69f89a64c89a741', '留言管理', '查看', '16100', null, '/control/feedback/manage.htm?method=view*', null, null);
INSERT INTO `sysresources` VALUES ('214f40c320124e839e7d0d7b00af2cbd', '全站设置', '删除浏览量数据', '49300', null, '/control/systemSetting/manage.htm?method=deletePageViewData&*', null, null);
INSERT INTO `sysresources` VALUES ('21a24ac2443043fbae750e4d6897e4be', '在线帮助管理', '添加分类', '38100', null, '/control/helpType/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('24bac9f0b1c84b0394a39c8933c7739d', '模板管理', '资源文件查看', '41600', null, '/control/resource/manage.htm?method=showFileUI&*', null, null);
INSERT INTO `sysresources` VALUES ('2690d4cb2beb425daa06ff9faf8d97ec', '模板管理', '修改栏目', '43500', null, '/control/column/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('27ac945d8df8433894da098a1192476d', '员工管理', '删除角色', '31600', null, '/control/acl/manage.htm?method=deleteRoles*', null, null);
INSERT INTO `sysresources` VALUES ('27af89b4f9344c73b1b792334e7fdfe2', '会员管理', '会员注册项列表', '28400', null, '/control/userCustom/list*', null, null);
INSERT INTO `sysresources` VALUES ('281466f5c0654966a68653b7383c6d9a', '话题管理', '添加评论', '13100', null, '/control/comment/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('2a03829ee62c4283913dc440537f3fe9', '员工管理', '修改角色', '31500', null, '/control/acl/manage.htm?method=editRoles*', null, null);
INSERT INTO `sysresources` VALUES ('2a34da73c3ca436e9fb658f8a1639895', '会员管理', '提交的答案回复', '26970', '', '/control/user/manage.htm?method=allAnswerReply*', null, null);
INSERT INTO `sysresources` VALUES ('2a90880355b44225a7e42e3a394d020c', '全站设置', '升级列表', '50000', null, '/control/upgrade/manage.htm?method=upgradeSystemList*', null, null);
INSERT INTO `sysresources` VALUES ('2bf084e1e8d84e89a1c2da9c5f6c8f5d', '会员管理', '私信对话列表', '27100', '', '/control/privateMessage/manage.htm?method=privateMessageChatList&*', null, null);
INSERT INTO `sysresources` VALUES ('2c60d084290e4ac196c490864a292ae1', '短信管理', '启用短信接口', '48530', null, '/control/smsInterface/manage.htm?method=enableInterface*', null, null);
INSERT INTO `sysresources` VALUES ('2e51f370f3c34d0bbfaf4a9f1ca7ee02', '全站设置', '数据库还原', '49800', null, '/control/dataBase/manage.htm?method=reset&*', null, null);
INSERT INTO `sysresources` VALUES ('2f4d3ec6741b4552a27d20781426df12', '会员管理', '还原', '26500', null, '/control/user/manage.htm?method=reduction*', null, null);
INSERT INTO `sysresources` VALUES ('2f6e1c7e19024a23ad13442f8a082e45', '在线帮助管理', '查询帮助分类', '0', null, '/control/helpType/manage.htm?method=helpTypePageSelect_move&*', '5ef5747987074212be7ef9cc9fdb50af', '1');
INSERT INTO `sysresources` VALUES ('31f98ef57f0a48a69c0ebb36c920dd1f', '会员管理', '删除角色', '27830', '', '/control/userRole/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('32361852ba844d1f9ccdb220ce3b3cb1', '模板管理', '版块引用代码', '43300', null, '/control/template/referenceCode*', null, null);
INSERT INTO `sysresources` VALUES ('32ae2070e23d42ba8dc38de061e7ed47', '留言管理', '删除', '16300', null, '/control/feedback/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('3338673059d44af39b27bf4cddc15bcc', '会员管理', '还原提醒', '27450', '', '/control/remind/manage.htm?method=reductionRemind&*', null, null);
INSERT INTO `sysresources` VALUES ('336407134b204deebb6d335ffe080612', '问答管理', '修改问题标签', '22200', '', '/control/questionTag/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('35b5f850ff1c40fcbc9e57c1f2124a1b', '会员管理', '积分日志', '27500', null, '/control/pointLog/list*', null, null);
INSERT INTO `sysresources` VALUES ('3686068be6704f78a2ec5e30b78f043f', '全站设置', '查询升级包列表', '1', null, '/control/upgrade/manage.htm?method=queryUpgradePackageList&*', '2a90880355b44225a7e42e3a394d020c', '1');
INSERT INTO `sysresources` VALUES ('37f5d0f7095b4093a772593dd4e28a39', '会员管理', '提交的问题', '26950', '', '/control/user/manage.htm?method=allQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('399207e1956d465a8eb536e80ee5f5f0', '系统通知管理', '系统通知列表', '46000', '', '/control/systemNotify/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('3a3f2b720eb74733b2e661de78decea0', '问答管理', '审核答案回复', '21600', '', '/control/answer/manage.htm?method=auditAnswerReply&*', null, null);
INSERT INTO `sysresources` VALUES ('3aa16023dbcd43cb8ccba4352f9b7e58', '问答管理', '删除追加问题', '20670', '', '/control/question/manage.htm?method=deleteAppendQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('3b5ccd12071e49ccac480cc55b3f520a', '话题管理', '收藏用户', '12620', '', '/control/topicFavorite/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('3b87a0950675425d9b46b0a9526acb46', '问答管理', '追加问题', '20650', '', '/control/question/manage.htm?method=appendQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('3c7306248d7a4788894ca4d9107e233e', '全站设置', '修改数据库密码', '49230', null, '/control/systemSetting/manage.htm?method=updateDatabasePassword&*', null, null);
INSERT INTO `sysresources` VALUES ('3c98bf1cf2294c059cf0241fba5cfa00', '模板管理', '导入模板列表', '40500', null, '/control/template/manage.htm?method=importTemplateList*', null, null);
INSERT INTO `sysresources` VALUES ('3cb6db13692b4bebb71da2045154efe7', '会员管理', '支付校验日志分页', '0', null, '/control/paymentLog/manage.htm?method=ajax_paymentVerificationLogPage&*', 'c459ab7aa99e4f528c961dd45df4d8e5', '1');
INSERT INTO `sysresources` VALUES ('3d630529412f44c8be0c409bf12bbba7', '模板管理', '资源文件下载', '42000', null, '/control/resource/manage.htm?method=download*', null, null);
INSERT INTO `sysresources` VALUES ('407a285c7ec744a4b284b85339c296ec', '话题管理', '查看话题', '12000', null, '/control/topic/manage.htm?method=view*', null, null);
INSERT INTO `sysresources` VALUES ('412fd399deac43cb8354a15db3b47bbf', '模板管理', '添加布局', '42300', null, '/control/layout/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('41a824d4663243b39b2d34256eb3dbf2', '模板管理', '查询\'更多\'', '0', null, '/control/layout/manage.htm?method=ajax_more&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('43c2cd191bd14af18ecabe5fa81b60cc', '在线帮助管理', '删除分类', '38300', null, '/control/helpType/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('44406f79d290492aa113d528da21b317', '支付管理', '添加在线支付接口', '52100', '', '/control/onlinePaymentInterface/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('44b819a086634eb894a353009c49fc9d', '问答管理', '文件上传', '0', null, '/control/question/manage.htm?method=upload&*', '3b87a0950675425d9b46b0a9526acb46', '2');
INSERT INTO `sysresources` VALUES ('453b956048b044cfb4f3df143624aa68', '平台收益管理', '解锁话题隐藏内容分成', '46400', '', '/control/topicUnhidePlatformShare/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('45f5ca24bf7441c08680d66b3aa6a8f6', '友情链接管理', '删除', '17300', null, '/control/links/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('47b25f8c2c6844c39025bce8ddfaa7fb', '系统', '后台首页', '0', null, '/control/center/home*', 'be324f36fad2467688724082c285d16e', '1');
INSERT INTO `sysresources` VALUES ('4ab032ea2c53438799d6b32b0eebb60b', '问答管理', '问题标签列表', '22000', '', '/control/questionTag/list*', null, null);
INSERT INTO `sysresources` VALUES ('4bac717853cb4a7faf79905ea6cad412', '模板管理', '版块源码编辑', '43100', null, '/control/forumCode/manage.htm?method=source&*', null, null);
INSERT INTO `sysresources` VALUES ('4c891b4c92af4f6783e6b7d1b245e345', '会员管理', '收藏夹列表', '27460', '', '/control/favorite/list*', null, null);
INSERT INTO `sysresources` VALUES ('4ce5c77610864d8885298a21793732ad', '话题管理', '修改标签', '15300', null, '/control/tag/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('4da6c6c0d67b49b7879bc160eac08c32', '系统', '系统后台', '99999999', null, '/control/**', null, '3');
INSERT INTO `sysresources` VALUES ('4de9ba43424146678772a69d0cd6ea4d', '模板管理', '下载导出模板', '40800', null, '/control/template/manage.htm?method=templateDownload&*', null, null);
INSERT INTO `sysresources` VALUES ('513d70ed7f3e46eb91f8ea4bbfc89317', '会员管理', '删除会员注册项', '28700', null, '/control/userCustom/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('515cd5fbdd72423ca083d3f44217fd25', '短信管理', '添加短信接口', '48510', null, '/control/smsInterface/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('517d8e1ea108440ebf3f01ca0f7bd322', '话题管理', '文件上传', '0', null, '/control/topic/manage.htm?method=upload&*', 'a1e816f03692448698b01a7ac01d2964', '2');
INSERT INTO `sysresources` VALUES ('51a9dc467fb54948a1c71dc2365b5049', '全站设置', '删除用户登录日志数据', '49500', null, '/control/systemSetting/manage.htm?method=deleteUserLoginLogData&*', null, null);
INSERT INTO `sysresources` VALUES ('521ab07ea093458b8c0711c9783cfdec', '话题管理', '审核回复', '14600', null, '/control/comment/manage.htm?method=auditReply*', null, null);
INSERT INTO `sysresources` VALUES ('52bc2dbe4c0e437ebf93ce8b6575c6bb', '友情链接管理', '修改', '17200', null, '/control/links/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('53662c3fbcd145068ba4760a6d1d39a9', '模板管理', '查询问题标签分页', '11', null, '/control/questionTag/manage.htm?method=questionTagPage&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('53ae04bf6468464ea15826a8d1bb7417', '留言管理', '留言列表', '16000', null, '/control/feedback/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('5417c2d6e8a8453b972682fee374ec3a', '在线帮助管理', '在线帮助列表', '38500', null, '/control/help/list*', null, null);
INSERT INTO `sysresources` VALUES ('5485ebcbc00541458cd96eb6deda2eab', '话题管理', '审核评论', '13600', null, '/control/comment/manage.htm?method=auditComment*', null, null);
INSERT INTO `sysresources` VALUES ('557735f0f8ba4626b78224719e77cea3', '会员管理', '修改禁止的用户名称', '28760', null, '/control/disableUserName/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('559123bb91364943b1853c875901a598', '话题管理', '查询标签', '0', null, '/control/tag/manage.htm?method=allTag&*', '8f440666921741ed8c4804732b34d75d', '1');
INSERT INTO `sysresources` VALUES ('567f89abd7e04a1988c08b9764cf918c', '模板管理', '查询在线帮助分页', '10', null, '/control/help/manage.htm?method=ajax_searchHelpPage&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('58dc8b9d637a4ceda36b7083cd94bb76', '会员管理', '关注列表', '27470', '', '/control/follow/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('59bb52174d2e4f318e0c5ed09f9bedb3', '模板管理', '资源文件上传', '41700', null, '/control/resource/manage.htm?method=upload&*', null, null);
INSERT INTO `sysresources` VALUES ('5a8bd389628a4faaa96194435a14b384', '问答管理', '全部待审核答案回复', '22600', '', '/control/question/allAuditAnswerReply.htm*', null, null);
INSERT INTO `sysresources` VALUES ('5ad1e2bb0bc846a1a0fa4da30031a719', '话题管理', '图片上传', '0', null, '/control/comment/manage.htm?method=uploadImage&*', 'b47dd6012f88406795205481d2916fd2', '2');
INSERT INTO `sysresources` VALUES ('5af3e8652bd14b48aea03fac91e1e0b7', '模板管理', '修改布局', '42400', null, '/control/layout/manage.htm?method=editLayout&*', null, null);
INSERT INTO `sysresources` VALUES ('5b89f2dc65b54197940c9f1b614c669e', '模板管理', '布局列表', '42200', null, '/control/layout/list*', null, null);
INSERT INTO `sysresources` VALUES ('5c9e1ad37d2241d6b5eebe4d591f5da5', '会员管理', '支付日志', '27560', '', '/control/paymentLog/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('5d697fdf29434ff4bbcd5bc6f1a9a415', '全站设置', '立即升级', '51100', null, '/control/upgrade/manage.htm?method=upgradeNow&*', null, null);
INSERT INTO `sysresources` VALUES ('5dad80e6fa6e4255b34181bd17c5fe02', '模板管理', '校验url名称', '0', null, '/control/layout/manage.htm?method=checkUrlName&*', '5af3e8652bd14b48aea03fac91e1e0b7', '1');
INSERT INTO `sysresources` VALUES ('5e5fc2f249c144f198b3aad24f665cdd', '文件打包管理', '删除压缩文件', '45200', null, '/control/filePackage/manage.htm?method=delete&*', null, null);
INSERT INTO `sysresources` VALUES ('5ef5747987074212be7ef9cc9fdb50af', '在线帮助管理', '修改在线帮助', '38700', null, '/control/help/manage.htm?method=edit&*', null, null);
INSERT INTO `sysresources` VALUES ('607959c1d66c4900835c30532ebf656e', '问答管理', '查看问题', '20100', '', '/control/question/manage.htm?method=view*', null, null);
INSERT INTO `sysresources` VALUES ('607bbd310ec147519e8f988adf4c30a6', '话题管理', '修改评论', '13300', null, '/control/comment/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('62c2facd01254ffe99ce7692def6815f', '问答管理', '删除答案回复', '21500', '', '/control/answer/manage.htm?method=deleteAnswerReply*', null, null);
INSERT INTO `sysresources` VALUES ('64730717bf3e42169b22ff5f4529b0a8', '话题管理', '话题搜索', '12700', null, '/control/topic/search*', null, null);
INSERT INTO `sysresources` VALUES ('657208b0b240489da050e672cbe10a85', '话题管理', '查询标签', '0', null, '/control/tag/manage.htm?method=allTag&*', 'a1e816f03692448698b01a7ac01d2964', '1');
INSERT INTO `sysresources` VALUES ('669021ae338942df96d09b1ffe0729b9', '问答管理', '查询标签', '0', null, '/control/questionTag/manage.htm?method=allTag&*', '9f27719619c244879c74ef032bf67684', '1');
INSERT INTO `sysresources` VALUES ('66af4e938332484f8a4f6e764a1d106c', '会员管理', '修改会员注册项', '28600', null, '/control/userCustom/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('670eb3b034d34a82a6053de088e27d0a', '问答管理', '还原问题', '20500', '', '/control/question/manage.htm?method=reduction*', null, null);
INSERT INTO `sysresources` VALUES ('673e0fdf492e4d97a19a761f8dcc203b', '短信管理', '短信接口列表', '48500', null, '/control/smsInterface/list*', null, null);
INSERT INTO `sysresources` VALUES ('67cc5e6e087c4c6192d8448402765751', '会员管理', '提现校验', '1', null, '/control/user/manage.htm?method=withdrawVerification&*', 'c459ab7aa99e4f528c961dd45df4d8e5', '1');
INSERT INTO `sysresources` VALUES ('680e74218d4e4703b6f672cb7d51b7b9', '问答管理', '文件上传', '0', null, '/control/question/manage.htm?method=upload&*', '1a93fe93805849d68e478bb91c28480b', '2');
INSERT INTO `sysresources` VALUES ('685794fae29a45b6a5d61416b39d7f71', '模板管理', '删除版块', '43000', null, '/control/forum/manage.htm?method=delete&*', null, null);
INSERT INTO `sysresources` VALUES ('6a87425f50f14afc98ebcc42c1e54637', '会员管理', '会员等级列表', '28000', null, '/control/userGrade/list*', null, null);
INSERT INTO `sysresources` VALUES ('6b12cf5fb0ce4927979775f3c76419ab', '全站设置', '数据库备份', '49700', null, '/control/dataBase/manage.htm?method=backup*', null, null);
INSERT INTO `sysresources` VALUES ('6c6b8190a0864463b68f9f514b1ad4d0', '问答管理', '查询标签', '0', null, '/control/questionTag/manage.htm?method=questionTagPage&*', 'ad17b7a816ea45b09be8084be966ba4b', '1');
INSERT INTO `sysresources` VALUES ('70737a78770041a18bccc71b4d17ecf8', '模板管理', '修改版块代码', '41200', null, '/control/forumCode/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('70889956fee3475fb8487313d46f94c7', '模板管理', '添加模板', '40100', null, '/control/template/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('71b0cd5212874f21a2eb46d87278bc25', '问答管理', '添加问题标签', '22100', '', '/control/questionTag/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('71e587d45b384855831dcfa5db98f8fe', '问答管理', '修改答案回复', '21400', '', '/control/answer/manage.htm?method=editAnswerReply*', null, null);
INSERT INTO `sysresources` VALUES ('74e391ff7c0d41aeab64e9373f16776a', '会员卡管理', '会员卡列表', '28780', '', '/control/membershipCard/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('75349725155243d2932fc754cea5f3ab', '浏览量管理', '浏览量列表', '44000', null, '/control/pageView/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('75a262c3c48d4e21817541cd87fac000', '在线帮助管理', '合并分类', '38400', null, '/control/helpType/manage.htm?method=merger*', null, null);
INSERT INTO `sysresources` VALUES ('76ffb8fb053647c5b5905b0f605104fe', '问答管理', '全部待审核答案', '22500', '', '/control/question/allAuditAnswer.htm*', null, null);
INSERT INTO `sysresources` VALUES ('7710a45b7cfa484183ee104ffe20f6c4', '问答管理', '删除问题标签', '22300', '', '/control/questionTag/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('77b55fcc33184a009e1376e20e294eca', '模板管理', '查询话题标签', '6', null, '/control/tag/manage.htm?method=allTag&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('77b721b60c014517a73134daaad021d9', '模板管理', '查询商品分类', '1', null, '/control/product/type/manage.htm?method=productTypePageSelect&*', '5af3e8652bd14b48aea03fac91e1e0b7', '1');
INSERT INTO `sysresources` VALUES ('7caf26294048452cafbb5972ef502d88', '会员管理', '还原系统通知', '27350', '', '/control/systemNotify/manage.htm?method=reductionSubscriptionSystemNotify&*', null, null);
INSERT INTO `sysresources` VALUES ('7d7842f34d6940738a767b3d7dd9a6ec', '会员管理', '充值', '27570', '', '/control/user/manage.htm?method=payment&*', null, null);
INSERT INTO `sysresources` VALUES ('7db8b118e2ec4ce9992e027eddda1648', '模板管理', '版块列表', '42700', null, '/control/forum/list*', null, null);
INSERT INTO `sysresources` VALUES ('7dee9a00f4dc474fa502cf0f8bc83224', '会员管理', '添加会员注册项', '28500', null, '/control/userCustom/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('7df278798d2f448a90ea0be3f76fc629', '模板管理', '查询版块代码', '1', null, '/control/forumCode/query.htm?method=forumCode*', '90cd4aa4e6ef4154849630ae701fe37d', '1');
INSERT INTO `sysresources` VALUES ('7e6b62b229a84c0fa739373313f381c0', '问答管理', '修改追加问题', '20660', '', '/control/question/manage.htm?method=editAppendQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('7e763e0f214d42bfb2ba3cbeb9178c56', '员工管理', '删除员工', '31100', null, '/control/staff/manage.htm?method=deleteStaff*', null, null);
INSERT INTO `sysresources` VALUES ('7ed8aa6ff34241329b9183e2f114ca64', '会员管理', '添加角色', '27810', '', '/control/userRole/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('7f22ef589ea74b1c874b10fa6cd36b99', '话题管理', '删除话题', '12500', null, '/control/topic/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('7f520a1fe9ef45f79c7ac1d01a8c2e56', '模板管理', '查询资讯分页', '9', null, '/control/information/manage.htm?method=ajax_searchInformationPage&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('803dc508fa8542f1a2be86cdb85b19f1', '会员管理', '会员角色列表', '27800', '', '/control/userRole/list*', null, null);
INSERT INTO `sysresources` VALUES ('81d79685ac4240c281dcda09bba59b53', '模板管理', '查询商品扩展属性', '5', null, '/control/productAttribute/manage.htm?method=ajax_productAttributeExpansion&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('822e43c8499149d59fd5ee6f77153d35', '会员管理', '发表的回复', '26900', null, '/control/user/manage.htm?method=allReply*', null, null);
INSERT INTO `sysresources` VALUES ('82462825c1dd4ecdb3ce22e68b70f5e9', '会员管理', '添加等级', '28100', null, '/control/userGrade/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('838e778a22c0424ab11914d1e3b44379', '会员管理', '修改角色', '27820', '', '/control/userRole/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('84b8ba7c751a488885fbfdeb25a0eca3', '问答管理', '全部待审核问题', '22400', '', '/control/question/allAuditQuestion.htm*', null, null);
INSERT INTO `sysresources` VALUES ('862368fdca464ebbb2937623648880d1', '话题管理', '全部待审核话题', '15600', null, '/control/topic/allAuditTopic.htm*', null, null);
INSERT INTO `sysresources` VALUES ('86307e97f57a4c8daecd6b13ea4a60e8', '模板管理', '校验url名称', '0', null, '/control/layout/manage.htm?method=checkUrlName&*', '412fd399deac43cb8354a15db3b47bbf', '1');
INSERT INTO `sysresources` VALUES ('87ad98da3e7642e68109c33199968181', '在线帮助管理', '在线帮助分类列表', '38000', null, '/control/helpType/list*', null, null);
INSERT INTO `sysresources` VALUES ('8b1d44fee22c460dabb3381e97f1820f', '模板管理', '查询资源子节点', '0', null, '/control/resource/query*', 'd72acdb07d1540bab400c194ba3329f8', '1');
INSERT INTO `sysresources` VALUES ('8b9594bb5b8343dbadca64a4f8066b6e', '话题管理', '添加回复', '14100', null, '/control/comment/manage.htm?method=addReply*', null, null);
INSERT INTO `sysresources` VALUES ('8ce45be5ea284190b9d76138d8d5f6b2', '文件打包管理', '打包文件', '45500', null, '/control/filePackage/manage.htm?method=package*', null, null);
INSERT INTO `sysresources` VALUES ('8dab213a3c11412795f51a834ba6bd05', '问答管理', '采纳答案', '20700', '', '/control/answer/manage.htm?method=adoptionAnswer*', null, null);
INSERT INTO `sysresources` VALUES ('8dd0e634ff4647e0b438b75fbde1148f', '会员卡管理', '修改会员卡', '28790', '', '/control/membershipCard/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('8f22d9489e3b488d8ee59a76377ee96b', '问答管理', '文件上传', '0', null, '/control/question/manage.htm?method=upload&*', '9f27719619c244879c74ef032bf67684', '2');
INSERT INTO `sysresources` VALUES ('8f440666921741ed8c4804732b34d75d', '话题管理', '修改话题', '12300', null, '/control/topic/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('901d1d332b214483a90b5ef1738077a1', '话题管理', '图片上传', '0', null, '/control/comment/manage.htm?method=uploadImage&*', '281466f5c0654966a68653b7383c6d9a', '2');
INSERT INTO `sysresources` VALUES ('90cd4aa4e6ef4154849630ae701fe37d', '模板管理', '版块代码列表', '41000', null, '/control/forumCode/list*', null, null);
INSERT INTO `sysresources` VALUES ('922f6908c5a1434aba4b0f6f8f008c1c', '模板管理', '添加版块', '42800', null, '/control/forum/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('9246901afe1b4d3fb501c3fc51be23c5', '会员管理', '修改等级', '28200', null, '/control/userGrade/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('938b9dff2a27416abf6ae6ac21eaaaad', '问答管理', '删除问题', '20400', '', '/control/question/manage.htm?method=deleteQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('95a1e6ab0ea64972ab36f85f2940d8e9', '会员管理', '提交的答案', '26960', '', '/control/user/manage.htm?method=allAnswer*', null, null);
INSERT INTO `sysresources` VALUES ('97bc7db41f8743978c70a104e49dd1c5', '会员卡管理', '删除会员卡', '28795', '', '/control/membershipCard/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('98e03673f0c847a2bc8f93008b1729ef', '话题管理', '点赞用户', '12625', '', '/control/topicLike/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('9a797b54d630450cb3cfadb1f2d94243', '会员卡管理', '会员卡订单列表', '28797', '', '/control/membershipCardOrder/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('9be9600772e3420a91ee019acc3ba379', '问答管理', '添加答案回复', '21300', '', '/control/answer/manage.htm?method=addAnswerReply*', null, null);
INSERT INTO `sysresources` VALUES ('9c3ddbaa3457496ab9315ce6f271db8d', '在线帮助管理', '还原在线帮助', '39000', null, '/control/help/manage.htm?method=reduction*', null, null);
INSERT INTO `sysresources` VALUES ('9c443950eb9746b49c7314dbf8e3d523', '全站设置', '基本设置', '49000', null, '/control/systemSetting/manage/edit*', null, null);
INSERT INTO `sysresources` VALUES ('9c44a7e09b2744d58bccef05d11cdca7', '模板管理', '查询品牌分页', '6', null, '/control/brand/manage.htm?method=ajax_queryBrandSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('9c5bebaa673b45bd9d1c5cba7a9dead9', '模板管理', '导入模板', '40600', null, '/control/template/manage.htm?method=import&*', null, null);
INSERT INTO `sysresources` VALUES ('9e9721bf5cad43bdba3a7adecb47726f', '友情链接管理', '添加', '17100', null, '/control/links/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('9f27719619c244879c74ef032bf67684', '问答管理', '修改问题', '20300', '', '/control/question/manage.htm?method=editQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('a0116147816444319d37e0e1562189b0', '模板管理', '删除版块代码', '41300', null, '/control/forumCode/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('a02b3694e4d542398d3a39f4156e992f', '会员管理', '添加', '26200', null, '/control/user/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('a046d8a39d3b44d694d8c7720cd6a7d2', '问答管理', '删除答案', '21100', '', '/control/answer/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('a15cab18081d4ec7b85b03646b873166', '会员管理', '查看支付日志', '27565', '', '/control/paymentLog/manage.htm?method=show&*', null, null);
INSERT INTO `sysresources` VALUES ('a1e816f03692448698b01a7ac01d2964', '话题管理', '添加话题', '12100', null, '/control/topic/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('a2b73c63005149699adb7fb395467b49', '模板管理', '版块代码源码编辑', '41400', null, '/control/forumCode/manage.htm?method=forumSource&*', null, null);
INSERT INTO `sysresources` VALUES ('a4775968ad2e4b238ed49b4e4808a011', '话题管理', '修改回复', '14300', null, '/control/comment/manage.htm?method=editReply*', null, null);
INSERT INTO `sysresources` VALUES ('a5068ccfff8b42cf920f56aa780cbdad', '全站设置', '查询还原进度', '0', null, '/control/dataBase/manage.htm?method=queryResetProgress&*', '2e51f370f3c34d0bbfaf4a9f1ca7ee02', '1');
INSERT INTO `sysresources` VALUES ('a5cb52cd59a040a1b34a7f401361fe31', '会员管理', '删除私信', '27200', '', '/control/privateMessage/manage.htm?method=deletePrivateMessageChat&*', null, null);
INSERT INTO `sysresources` VALUES ('a6bc8f310a2642d7ad537e620eff3f85', '在线帮助管理', '查询帮助分类', '0', null, '/control/helpType/manage.htm?method=helpTypePageSelect_move&*', '5417c2d6e8a8453b972682fee374ec3a', '1');
INSERT INTO `sysresources` VALUES ('a7bdf3297cc2431f9dd3f748374bf877', '模板管理', '查询\'更多\'', '1', null, '/control/layout/manage.htm?method=ajax_more&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('a7f6e1dcc5e943f48f4270dcfa056557', '会员管理', '粉丝列表', '27475', '', '/control/follower/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('a8b4ea7341944f03b4c468b0354371cc', '模板管理', '资源重命名', '41900', null, '/control/resource/manage.htm?method=rename*', null, null);
INSERT INTO `sysresources` VALUES ('a92781bed96b4a6e9f8348321ac2ddbc', '模板管理', '查询商品分类属性', '3', null, '/control/productTypeAttribute/manage.htm?method=queryProductTypeAttribute&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('a9c55c3b3b45494dacef8fb058c7e7a7', '话题管理', '文件上传', '0', null, '/control/topic/manage.htm?method=upload&*', '8f440666921741ed8c4804732b34d75d', '2');
INSERT INTO `sysresources` VALUES ('aa355abf953e42078517a3dded03e785', '系统通知管理', '修改系统通知', '46200', '', '/control/systemNotify/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('aa971ce1dc6f43e3b026d235fa7263e6', '模板管理', '添加版块代码', '41100', null, '/control/forumCode/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('ab10d2b5dc5e48a69727a6292ca072b4', '样式缩略图管理', '添加缩略图裁剪尺寸', '59100', null, '/control/thumbnail/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('ab73276d43184b2db5fa5a6bd76b1def', '模板管理', '删除布局', '42500', null, '/control/layout/manage.htm?method=deleteLayout&*', null, null);
INSERT INTO `sysresources` VALUES ('abdea9b5ed4c4636a55062cf4f36ea0a', '在线帮助管理', '查看在线帮助', '39100', null, '/control/help/manage.htm?method=view&*', null, null);
INSERT INTO `sysresources` VALUES ('ad17b7a816ea45b09be8084be966ba4b', '问答管理', '问题搜索', '22700', '', '/control/question/search*', null, null);
INSERT INTO `sysresources` VALUES ('ad32af8a5d784a979da7b5362ca77882', '模板管理', '模板设为使用', '40400', null, '/control/template/manage.htm?method=setTemplate*', null, null);
INSERT INTO `sysresources` VALUES ('ae66d24114ea4cf28923f5fe8757e4e6', '全站设置', '服务器节点参数', '49900', null, '/control/systemSetting/manage.htm?method=nodeParameter*', null, null);
INSERT INTO `sysresources` VALUES ('ae6eeb2fbd23472d89022d9a7366b0cd', '模板管理', '查询在线帮助分页', '11', null, '/control/help/manage.htm?method=ajax_searchHelpPage&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('afa39379327e4461b3444cf9b416efae', '系统通知管理', '添加系统通知', '46100', '', '/control/systemNotify/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('b002385af8e245aa823bf75adbd96eac', '模板管理', '查询商品分类', '1', null, '/control/product/type/manage.htm?method=productTypePageSelect&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('b0857fe7e73e487798150bd09b2063f6', '问答管理', '取消采纳答案', '20800', '', '/control/answer/manage.htm?method=cancelAdoptionAnswer*', null, null);
INSERT INTO `sysresources` VALUES ('b15ff404e0b64afcaa888311b1d0b0c8', '话题管理', '查询标签', '0', null, '/control/tag/manage.htm?method=allTag&*', '64730717bf3e42169b22ff5f4529b0a8', '1');
INSERT INTO `sysresources` VALUES ('b306453ca1f24bdabc62261b687e44a2', '在线帮助管理', '文件上传', '0', null, '/control/help/manage.htm?method=upload&*', 'c673918d949d4cc3aa38b43660b354b8', '2');
INSERT INTO `sysresources` VALUES ('b47dd6012f88406795205481d2916fd2', '话题管理', '引用评论', '13400', null, '/control/comment/manage.htm?method=addQuote*', null, null);
INSERT INTO `sysresources` VALUES ('b4f51bedcc8d45448e980aec0f32a79f', '问答管理', '查询标签', '0', null, '/control/questionTag/manage.htm?method=allTag&*', '1a93fe93805849d68e478bb91c28480b', '1');
INSERT INTO `sysresources` VALUES ('b77f796a65694fed859fe1684d365589', '模板管理', '目录重命名', '40560', null, '/control/template/manage.htm?method=directoryRename&*', null, null);
INSERT INTO `sysresources` VALUES ('b794e4584425495a8070fdc71d09258b', '模板管理', '查询商品分类', '2', null, '/control/product/type/manage.htm?method=productTypePageSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('b805b7dbbf0140b2a2fcb962e3fe4a4d', '在线帮助管理', '修改分类', '38200', null, '/control/helpType/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('b83b0d29f07e4249b70067e00f54ef67', '会员管理', '添加禁止的用户名称', '28755', null, '/control/disableUserName/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('b9512c1642a54356b453ef6e9df32aee', '模板管理', '模板列表', '40000', null, '/control/template/list*', null, null);
INSERT INTO `sysresources` VALUES ('baa1c014792c40edae687b4e169657ef', '全站设置', '重建话题索引', '49200', null, '/control/systemSetting/manage.htm?method=rebuildTopicIndex&*', null, null);
INSERT INTO `sysresources` VALUES ('bc248879066f4af58c99a822f4228015', '模板管理', '删除资源', '42100', null, '/control/resource/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('bc413423f03f4f1d8d37178ae73eb9ed', '支付管理', '修改在线支付接口', '52200', '', '/control/onlinePaymentInterface/manage.htm?method=edit&*', null, null);
INSERT INTO `sysresources` VALUES ('bce6c687ee5645cda651cd6dfff74fa4', '话题管理', '标签列表', '14800', null, '/control/tag/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('bd36d2aa14774c8d81b56fc7fde02b4f', '短信管理', '删除短信接口', '48540', null, '/control/smsInterface/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('bdfb84d1d65b4325aa8a74a61a70a6a3', '模板管理', '查询栏目', '0', null, '/control/column/manage.htm?method=queryColumn*', '11f96911716c4498b562658224750b02', '1');
INSERT INTO `sysresources` VALUES ('be324f36fad2467688724082c285d16e', '系统', '后台框架', '88888888', null, '/control/center/admin*', null, null);
INSERT INTO `sysresources` VALUES ('bee77a45dcdb428db42dcb2317648fe9', '员工管理', '修改员工', '30000', null, '/control/staff/manage.htm?method=editStaff*', null, null);
INSERT INTO `sysresources` VALUES ('c027259a21a240d48b73c1683a346056', '会员管理', '删除禁止的用户名称', '28765', null, '/control/disableUserName/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('c09977cf64ef4a008e672a4ba8d8e004', '话题管理', '全部待审核评论 ', '15800', null, '/control/topic/allAuditComment.htm*', null, null);
INSERT INTO `sysresources` VALUES ('c0b306017906415abce45445b5606bd6', '问答管理', '添加答案', '20900', '', '/control/answer/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('c128236bfefd4cf3b241357733581002', '问答管理', '审核答案', '21200', '', '/control/answer/manage.htm?method=auditAnswer&*', null, null);
INSERT INTO `sysresources` VALUES ('c34676a187044553a4c42c56257413fd', '模板管理', '查询在线帮助分类', '9', null, '/control/helpType/manage.htm?method=helpTypePageSelect&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('c370e4821b0e45b6946a7ab3181b3844', '系统通知管理', '删除系统通知', '46300', '', '/control/systemNotify/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('c418c587feb14ecfabd9690d9f52d440', '会员管理', '还原私信', '27150', '', '/control/privateMessage/manage.htm?method=reductionPrivateMessage&*', null, null);
INSERT INTO `sysresources` VALUES ('c459ab7aa99e4f528c961dd45df4d8e5', '会员管理', '会员详细', '26600', null, '/control/user/manage.htm?method=show*', null, null);
INSERT INTO `sysresources` VALUES ('c4ab05ec118740c4bb01395e5e519332', '会员管理', '删除', '26400', null, '/control/user/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('c673918d949d4cc3aa38b43660b354b8', '在线帮助管理', '添加在线帮助', '38600', null, '/control/help/manage.htm?method=add&*', null, null);
INSERT INTO `sysresources` VALUES ('c6d4bed764194be0a377be158ecdee4d', '会员管理', '会员注册禁止用户名称列表', '28750', null, '/control/disableUserName/list*', null, null);
INSERT INTO `sysresources` VALUES ('c6e0d05a7d8a4a63b7d8b0c5ed44207f', '员工管理', '登录日志', '31200', null, '/control/staffLoginLog/list*', null, null);
INSERT INTO `sysresources` VALUES ('c74888ede5e74dce8a656d722836d8b1', '问答管理', '修改答案', '21000', '', '/control/answer/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('c76fd58d86fd44c3ac6accebc12ae7fa', '员工管理', '添加角色', '31400', null, '/control/acl/manage.htm?method=addRoles*', null, null);
INSERT INTO `sysresources` VALUES ('c7936b830e654abba9a0c1e76895747a', '模板管理', '查询商品属性分页', '4', null, '/control/productAttribute/manage.htm?method=ajax_queryProductAttributeSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('c912c21f92ca46e693b8645e7ad89a8d', '会员管理', '查询银行', '2', null, '/control/systemSetting/manage.htm?method=queryBankName&*', 'c459ab7aa99e4f528c961dd45df4d8e5', '1');
INSERT INTO `sysresources` VALUES ('c930706b667749d1b5784c37c6a4ffd4', '模板管理', '查询问题标签分页', '12', null, '/control/questionTag/manage.htm?method=questionTagPage&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('c9791f2412c04860a0f8b4ddfc64cecb', '模板管理', '文件上传', '0', null, '/control/forum/manage.htm?method=upload&*', '922f6908c5a1434aba4b0f6f8f008c1c', '2');
INSERT INTO `sysresources` VALUES ('ca0e7a1a86384639a025a3fab07bd963', '问答管理', '问题列表', '20000', '', '/control/question/list*', null, null);
INSERT INTO `sysresources` VALUES ('caedcace4fe746499146e97459919bb4', '模板管理', '查询品牌分页', '5', null, '/control/brand/manage.htm?method=ajax_queryBrandSelect&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('cbe2d7086fee4d5390afe686e9cddad1', '模板管理', '修改模板', '40200', null, '/control/template/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('cec90ad171374546b81868015755f9f8', '在线帮助管理', '查询帮助分类', '0', null, '/control/helpType/manage.htm?method=helpTypePageSelect&*', '75a262c3c48d4e21817541cd87fac000', '1');
INSERT INTO `sysresources` VALUES ('cee7dda9dd5e4a739b42f0dfa8b4b16d', '全站设置', '查询说明', '0', null, '/control/upgrade/manage.htm?method=queryUpgrade&*', '2a90880355b44225a7e42e3a394d020c', '1');
INSERT INTO `sysresources` VALUES ('cf8e8bd2ea2549ae9a4cfe7356c04be4', '问答管理', '图片上传', '0', null, '/control/answer/manage.htm?method=uploadImage&*', 'c74888ede5e74dce8a656d722836d8b1', '2');
INSERT INTO `sysresources` VALUES ('d0482512ccd5439bb6610672c11f0cb2', '模板管理', '删除模板', '40300', null, '/control/template/manage.htm?method=delete&*', null, null);
INSERT INTO `sysresources` VALUES ('d0f97697d6984656927b6dbcc9f9c4a0', '会员管理', '登录日志', '27600', null, '/control/userLoginLog/list*', null, null);
INSERT INTO `sysresources` VALUES ('d297f75ec0514aa1953d9d1738634090', '文件打包管理', '下载压缩文件', '45100', null, '/control/filePackage/manage.htm?method=download&*', null, null);
INSERT INTO `sysresources` VALUES ('d2a54b45642a42fcac64fb15f1ac78e2', '友情链接管理', '友情链接列表', '17000', null, '/control/links/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('d3f057d1100a4a79b97ab9715e01be04', '话题管理', '添加标签', '14900', null, '/control/tag/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('d4b7953538294b67843c56f721d51a58', '话题管理', '图片上传', '0', null, '/control/comment/manage.htm?method=uploadImage&*', '607bbd310ec147519e8f988adf4c30a6', '2');
INSERT INTO `sysresources` VALUES ('d5290b702acf41f286dc3d66c659d081', '会员管理', '会员卡订单', '27550', '', '/control/membershipCard/manage.htm?method=membershipCardOrderList*', null, null);
INSERT INTO `sysresources` VALUES ('d613442d18c1465d8a981f420b3aa8cd', '全站设置', '维护数据', '49100', null, '/control/systemSetting/manage.htm?method=maintainData*', null, null);
INSERT INTO `sysresources` VALUES ('d692c8ee90394774b449fc4060ee711d', '在线帮助管理', '查询帮助分类', '0', null, '/control/helpType/manage.htm?method=helpTypePageSelect_move&*', 'c673918d949d4cc3aa38b43660b354b8', '1');
INSERT INTO `sysresources` VALUES ('d71d35ca222a43e2bec6ceb76ac8097f', '会员卡管理', '添加会员卡', '28785', '', '/control/membershipCard/manage.htm?method=add*', null, null);
INSERT INTO `sysresources` VALUES ('d72acdb07d1540bab400c194ba3329f8', '模板管理', '资源列表', '41500', null, '/control/resource/list*', null, null);
INSERT INTO `sysresources` VALUES ('d73f435972544a7fb03b6618948c07eb', '模板管理', '查询商品分类', '1', null, '/control/product/type/manage.htm?method=productTypePageSelect&*', '412fd399deac43cb8354a15db3b47bbf', '1');
INSERT INTO `sysresources` VALUES ('d75adb28b87d496e8627c11272b47476', '在线帮助管理', '删除在线帮助', '38800', null, '/control/help/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('d885d220f87a4b1a928e3eb93f922c02', '全站设置', '删除升级包', '51300', null, '/control/upgrade/manage.htm?method=deleteUpgradePackage&*', null, null);
INSERT INTO `sysresources` VALUES ('d8ad4df8213e491c96bd143e1eec7b4c', '问答管理', '收藏用户', '20620', '', '/control/questionFavorite/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('d93b927d889a41f487efc41845f9c4ea', '模板管理', '查询版块模板', '0', null, '/control/forum/manage.htm?method=forumTemplateFileNameUI&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('d96a00544fcf470e98a4f062bc017559', '模板管理', '查询商品扩展属性', '4', null, '/control/productAttribute/manage.htm?method=ajax_productAttributeExpansion&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('da59992eae3a4181bd14d31476aa8714', '在线帮助管理', '文件上传', '0', null, '/control/help/manage.htm?method=upload&*', '5ef5747987074212be7ef9cc9fdb50af', '2');
INSERT INTO `sysresources` VALUES ('da63bf83542e47bdacdada8a8abf8166', '支付管理', '删除在线支付接口', '52300', '', '/control/onlinePaymentInterface/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('da89532f94ed4e4193f9980c48609aac', '全站设置', '查询备份进度', '0', null, '/control/dataBase/manage.htm?method=queryBackupProgress&*', '6b12cf5fb0ce4927979775f3c76419ab', '1');
INSERT INTO `sysresources` VALUES ('dcd7b0f0c5e44566b116694b96dac0e1', '会员管理', '系统通知列表', '27300', '', '/control/systemNotify/manage.htm?method=subscriptionSystemNotifyList&*', null, null);
INSERT INTO `sysresources` VALUES ('dd231daf558d4526bf0d95ee6cc6970e', '全站设置', '数据库备份/还原列表', '49600', null, '/control/dataBase/list*', null, null);
INSERT INTO `sysresources` VALUES ('de86a8fa661041ca9794a78275d0fcb1', '模板管理', '查询资讯分类', '7', null, '/control/informationType/manage.htm?method=informationTypePageSelect&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('decb896d7fee40f09a958647cf14b849', '问答管理', '审核问题', '20600', '', '/control/question/manage.htm?method=auditQuestion*', null, null);
INSERT INTO `sysresources` VALUES ('e050f5451e4f4f7dba6c2cb51f7c393e', '短信管理', '修改短信接口', '48520', null, '/control/smsInterface/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('e08a84e681ea4850be0a33c1f6d4c5f0', '话题管理', '删除回复', '14500', null, '/control/comment/manage.htm?method=deleteReply*', null, null);
INSERT INTO `sysresources` VALUES ('e0aa4b8b3c51428eb6dd8227ffffe283', '模板管理', '导出模板', '40700', null, '/control/template/manage.htm?method=export*', null, null);
INSERT INTO `sysresources` VALUES ('e25b31db1abd48eeb81f13881e314f91', '会员管理', '会员列表', '26100', null, '/control/user/list*', null, null);
INSERT INTO `sysresources` VALUES ('e4d93f4f930a455f85868cfd5480f5d0', '样式缩略图管理', '删除缩略图裁剪尺寸', '59200', null, '/control/thumbnail/manage.htm?method=delete&*', null, null);
INSERT INTO `sysresources` VALUES ('e7443c7b35bc44a1a60f5f6a7530905b', '全站设置', '上传敏感词库', '49560', null, '/control/filterWord/manage.htm?method=uploadFilterWord*', null, null);
INSERT INTO `sysresources` VALUES ('e8cfa842e1c24b54b67f1bbc6b828dbe', '模板管理', '查询资讯分类', '8', null, '/control/informationType/manage.htm?method=informationTypePageSelect&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('eadf2a9785af45b08c5c42d6b1263133', '全站设置', '重建问题索引', '49210', '', '/control/systemSetting/manage.htm?method=rebuildQuestionIndex&*', null, null);
INSERT INTO `sysresources` VALUES ('ec17504e564f4c958cb679377a39715d', '模板管理', '查询话题标签', '7', null, '/control/tag/manage.htm?method=allTag&*', '922f6908c5a1434aba4b0f6f8f008c1c', '1');
INSERT INTO `sysresources` VALUES ('ee03a28bd12f41b4a1e243ec05ca062b', '全站设置', '继续升级', '0', null, '/control/upgrade/manage.htm?method=continueUpgrade&*', '5d697fdf29434ff4bbcd5bc6f1a9a415', '2');
INSERT INTO `sysresources` VALUES ('ef1afb617a754220a0b27ec0cb01efa8', '问答管理', '图片上传', '0', null, '/cms/control/answer/manage.htm?method=uploadImage&*', 'c0b306017906415abce45445b5606bd6', '2');
INSERT INTO `sysresources` VALUES ('ef310b9be13a4630b40c99fe3baf1e4a', '模板管理', '查询商品属性分页', '3', null, '/control/productAttribute/manage.htm?method=ajax_queryProductAttributeSelect&*', 'ef3e2b9c32634f4088f4066880c70677', '1');
INSERT INTO `sysresources` VALUES ('ef3c77fb708c4775988e888f0e9186d4', '员工管理', '员工列表', '28800', null, '/control/staff/list*', null, null);
INSERT INTO `sysresources` VALUES ('ef3e2b9c32634f4088f4066880c70677', '模板管理', '修改版块', '42900', null, '/control/forum/manage.htm?method=edit&*', null, null);
INSERT INTO `sysresources` VALUES ('efa66bc116bc409fbf7bf23e4882d2d9', '员工管理', '添加员工', '28900', null, '/control/staff/manage.htm?method=addStaff*', null, null);
INSERT INTO `sysresources` VALUES ('f285c691b0f74b9ca549344722e5d780', '模板管理', '删除栏目', '43600', null, '/control/column/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('f2ddeb0bb4c94342854c6a2461869fb4', '会员管理', '提醒列表', '27400', '', '/control/remind/manage.htm?method=remindList&*', null, null);
INSERT INTO `sysresources` VALUES ('f365c635400e47eda1fc10589d7dbbcd', '会员管理', '会员搜索', '26000', null, '/control/user/search*', null, null);
INSERT INTO `sysresources` VALUES ('f58f9516975847fbbd8a2cd0230973f5', '会员管理', '删除等级', '28300', null, '/control/userGrade/manage.htm?method=delete*', null, null);
INSERT INTO `sysresources` VALUES ('f6518fc5a5f84c11a5a569c493218f8f', '文件打包管理', '压缩文件列表', '45000', null, '/control/filePackage/list.htm*', null, null);
INSERT INTO `sysresources` VALUES ('face85b769b94dc489e719551eb58bbd', '会员管理', '修改', '26300', null, '/control/user/manage.htm?method=edit*', null, null);
INSERT INTO `sysresources` VALUES ('fb9bce585d7d4aa89ddf30262540e660', '模板管理', '删除导出模板', '40900', null, '/control/template/manage.htm?method=deleteExport&*', null, null);
INSERT INTO `sysresources` VALUES ('fbee16533927408789b4c0a096413635', '员工管理', '角色列表', '31300', null, '/control/roles/list*', null, null);
INSERT INTO `sysresources` VALUES ('fc8554db852a4f128bdee595b4cd1ed8', '会员管理', '更换头像', '27700', '', '/control/user/manage.htm?method=updateAvatar*', null, null);
INSERT INTO `sysresources` VALUES ('fd7988fae4484db7a98a1d67b6d54cdc', '话题管理', '全部待审核回复', '15840', null, '/control/topic/allAuditReply.htm*', null, null);
INSERT INTO `sysresources` VALUES ('fd848496836843b49ee6ed3ccdf6c14d', '话题管理', '审核话题', '12610', null, '/control/topic/manage.htm?method=auditTopic*', null, null);
INSERT INTO `sysresources` VALUES ('fdbe57ac70804feea4e8679a190740ed', '模板管理', '查询版块目录', '0', null, '/control/forumCode/query.htm?method=directory*', '90cd4aa4e6ef4154849630ae701fe37d', '1');
INSERT INTO `sysresources` VALUES ('ff3bfef595c1473a9dd2a1ba279ca010', '全站设置', '上传升级包', '51200', null, '/control/upgrade/manage.htm?method=uploadUpgradePackage*', null, null);

-- ----------------------------
-- Table structure for `sysroles`
-- ----------------------------
DROP TABLE IF EXISTS `sysroles`;
CREATE TABLE `sysroles` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysroles
-- ----------------------------
INSERT INTO `sysroles` VALUES ('a7f5845b565f4a9b9e63ff2c987ea9c6', '管理员', '');

-- ----------------------------
-- Table structure for `sysrolespermission`
-- ----------------------------
DROP TABLE IF EXISTS `sysrolespermission`;
CREATE TABLE `sysrolespermission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permissionId` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysrolespermission
-- ----------------------------
INSERT INTO `sysrolespermission` VALUES ('1', '1a631db6c36e499cafd7d5211e61939f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('2', 'a1b1c49fc8f64d9aa7497d5b25816eee', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('3', 'da332d9db98e4ce7b9023a9e76752ad3', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('4', 'b2b558e723eb4d75ae4c35c8b36b5c64', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('5', 'a8e77195a8ba42b3880f4d6935f8d1a1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('6', 'd443ecbbb48d48a0adb0df74140510da', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('7', 'e96baee9362449d7b498fb527dec1d54', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('8', 'ede920bcd4a7443ab7bc61e24994468e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('9', '048060184aa747db94413aef590e6b97', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('10', 'fcd89db7a4fc4c25ad967366a3f9d19f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('11', '1474318f7e2240739d00a85ff21778d1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('12', '66218378244c4c4fbe640f367b170a2a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('13', '78f7f0b1dee44977a383578846eed604', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('14', '2dabdbe7ec924ed2b8a15d8f06f9f457', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('15', 'bb1867da82bc4bf9ba1c404f7de7e0a4', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('16', '61b55531648c46f89fd561cdcea09a64', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('17', '3f59fbbaac5c4618a7766c775050bee5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('18', '72ea89819e2248a3951dbe0be592f55f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('19', 'c875a39da823436e8a77f4c251096dd4', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('20', 'bb8ada1fcff747a7868d17bebda7e0f2', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('21', 'a97915e1f0864c9c93a88f268284df5f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('22', '4831ce8be1af4dd9862ab173a19907d3', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('23', '15c5191b69af4eb0a1862930c6fe176d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('24', 'd98a8e8c57b64a8fb89f7a0d994978eb', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('25', 'b09e8b722bd6426388e7694a371cd9fd', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('26', '47d2591d01cf49dd8122cc9a77d16094', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('27', '6ade5a05842c4d17ba41346b74724acd', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('28', 'e2e27149dde94c078489038669e19e58', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('29', 'c59de06e2db1498e97920d0d51ce8f32', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('30', '3c05fdd591c8470b8622091893ff004c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('31', '81aec7f346434308beb898b261c90aee', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('32', 'd7afdec202d44a85ad3239987d2fcf00', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('33', '8761b202576a4f7189faffd32bf299ba', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('34', '9546840461a64c81bd080fcfffd3df0e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('35', 'b98179ff230b4c8baf7abd8affb33468', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('36', '1b80ca8dc02c4591997d420cc917d80b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('37', '4c87a7846ac54b09bb723808825be222', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('38', '2857b3c00f5841c4920497ac57beac6b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('39', 'e04459a1d0b749ff9d619941fe747750', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('40', '5b9a0913454e47b4bef6d3e31ae38734', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('41', 'aa7e41324b0d49f085fcbb400355f970', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('42', 'cb607ae60b204da3b2c80c85929a190d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('43', '0998399706604b298db6533ef23ec0ac', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('44', '0f0ec2999fbb44f8846a20d58e828e59', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('45', '3a459f7f04b64379bea2ae724cf3f78a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('46', 'ceb28608464548d58f191f29e987c858', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('47', '75e4692e5c614f5abc7d7b5810cf59d9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('48', '8faaec7f982d4d3b9847b955fc8d973c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('49', 'de484d1d48ce4b42b086f51b62af403f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('50', '774d0cdd7c8c443e868c8192d787ff3b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('51', 'dca0b9b3bf664e9795c63bcf78633946', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('52', '1d34b3ce43ae4d8f962a8b27381a3dec', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('53', '211fa9879cdc41b7b7e8ed3fe308278e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('54', 'd39647de8f5b4b2b844a4eb9fc089c8e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('55', 'c095eeeee5064a739c7856ffaf8a7e60', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('56', '12d63c0e375a47728d4c182372529b8e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('57', '139ded1d586348f78e3751c9dc8dec13', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('58', '8fc70392b4fd405aabdb48c7a3bae7ed', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('59', 'f1939cc01644444bba162f2a8325b91a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('60', '99d76e6d914d42cf9765ff1b6927d1f7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('61', 'b6e330a0c462407590a51a6e1063677a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('62', 'de2ae43b2077478ead903fa969172e1c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('63', 'cfe10d0e303b4eb1acfb725110af3570', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('64', 'b6d19989f45c4c918a5588d5d339893a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('65', '621036c4c1e94863a8600c3f771ed176', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('66', '7058d03b34d749f78d942940581cdbca', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('67', '260db4f1552c4f09a5f6f999e896cdac', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('68', '6271f4f215a349538099bd5ac40a5ddc', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('69', 'a3358191e3084c8a906fdd3fcd23cf65', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('70', '0cb6e21b9d254dd881c201b577fa46f6', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('71', '1931aeb8dd194f8282ebbd4085166f52', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('72', '8acdceb3d436410b95c33ab0943df4bb', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('73', '2f44f50ef9184640b7578bd1eeb9888c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('74', '8987621aa88a4479b62d665b09e309e6', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('75', 'bc3cdb8d556f48098fdbb1bbb06bd273', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('76', 'b0087f154eaf40be87fa3675768fd414', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('77', 'c706d0be75314aefadedad63df77b056', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('78', 'fdde776dc2f44554871b0706b5fe89fc', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('79', '967733f255964ca3ac38a5cfdd4b3cd0', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('80', 'a75786d463494a21b2d8e0664141e92a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('81', '4e150361440b4132baf9d65563ccb6c7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('82', '36aaf8e88b324c3b8ce50276cb83e901', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('83', '2b07e05a06784b4c8095ce0345b407a1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('84', '6446b6074a744354a67ca2fa983c213f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('85', '0e5fa569a5584aacadc631e738257aeb', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('86', '2059b44286c3402c84e89d5d449eb305', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('87', 'cc4fc4640905436a8fafe8533ffbe18f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('88', 'a2265142da1a43cd93794d3450935e03', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('89', 'aa95f8a8cc5542ee828b889f22583210', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('90', '3bca1bc44826413db5693edc927dd863', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('91', '74e6343d6b144a24a219185e6fab2f4f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('92', 'c4a175eaf6eb4e34b94bea54018391b1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('93', '0f7d3d4af8954ad18178b62d2f25d7f9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('94', '70a4210d51a246e396fd336a83e6397e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('95', '3093827bb1314f9ab1ba5068fa94bdf6', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('96', '64e00e15204f4b9e8a87a03e161d2cd6', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('97', 'c2442a047cc940cb862f97ae1fb4a21f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('98', '694588ee74f9488ab0d647e6e722ccc4', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('99', '13f7169f2a0b48a591e701d5f5a034d0', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('100', 'da0dad28fa434e9190fe67619c28bf59', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('101', '4174d434346d4043935285874652531e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('102', '958dd7d75ef547ea8ea0af5ed2a816c1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('103', '36001fdc50254da8a40de770517d148e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('104', '27464511268442c39980b0a8a25c2663', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('105', '3107b49684c54d51b54c45a7307228e0', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('106', 'fb848a5fa3bf46919f54044aa3bb7c6f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('107', '50eb45ee72014011a3828b594988af72', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('108', 'e189c9ff166d48f19369852c9bee511a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('109', 'a97984e18c42486bae7b5b9709309981', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('110', '5e6c9bdfffbf4622854aedb55bd2eabf', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('111', '3402b228fb604030a83eac3c0e94373f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('112', 'bb27abfac38e466db47a10922057429c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('113', '3944c3265a08408db9c8ac3a95862cfe', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('114', '294be5897f7c4770b7b2d0190e0a6bdd', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('115', '7b4fdeb8d7014269aadf0744468743f7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('116', '1a362749eebe4b1f8d41643521125336', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('117', 'edcfef9b3d58434cbccebb85cc192bf7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('118', 'ecd38983cce54e65b9b465c70c9c484e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('119', '6716c5bd261d4808ba41700b69f061e8', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('120', '6b0484a6e0a54374b82846816e108b46', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('121', '1e5cbc88d0d8489cabf925e70094b882', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('122', 'dbc37f628d514de99469585bb89d4a45', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('123', 'f2516b2ddfb44106a6c0c2f74201f4e9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('124', '4c701cb29334419fa58b66c9913532ea', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('125', '4ce1fa996a4445849b169415cfb89826', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('126', '0bee0cbdc5514c02adf8f0910971c90f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('127', '22d30d3080cc422e8878470f6db173fc', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('128', '778b7933eb5c4171a2b53e167e22cd08', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('129', '19facbaf34104cad9e532d40286753e7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('130', 'a6a211b1bc5b4c31a4b444ccddfc9c1b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('131', 'aeb36a2e6c8848a7a35223e8961cfed4', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('132', 'e587d664edc04f1199c76922c6444a43', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('133', 'ddab9ef583b84da78fb60d2505430396', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('134', '2d5b3555fd764225bbdd1e8787d8198f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('135', '76ad5ec096c540d983dd318969a64f6f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('136', '4ca50a54e8f54bb6ab063331f78a96d8', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('137', '8ad5245678b9413a94c7f27a181998bf', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('138', 'c932f31b97a947d4a123222d8ae7fe92', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('139', 'd1c449631db742d79f5426739f8bbed7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('140', 'cbc6da71f75d4ac582d0e88f257e7669', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('141', '9117004d87d84d68992d737742a7fc98', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('142', '1cc026a6afec4d2c823901413e192bee', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('143', '2a881ff2307942a888e84ce2b7cb9a57', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('144', 'aff1310185ef404ba5fae9faff402468', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('145', '04931b8ad2db4512bb8c49d48f600b18', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('146', '5357d79b9cad4dc4b6b3ee3434977281', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('147', 'c60995081b5a434eab404e350a181d66', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('148', 'b6506ade40334589b8d7f9a469645be5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('149', '2eb3a442ae964e03b0626dee0115a7cd', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('150', '1f394709c4b74ac5a982ceea26a42d6e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('151', '21d93e122d3a4df4ac1b4748ef5a99a7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('152', 'c418cc0799d1495aa02ab635819bf6fb', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('153', 'f574660f6bd24202aec13b86d95e7da9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('154', '78d335071bb0422badf8832a6faed506', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('155', '7753d328281740808acf1ae0eadcbb3b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('156', '697107528fb949c5a719e3208cd00908', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('157', '897746313447415da446fdb1fcae070c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('158', 'e38df097dc62482382dcf1bafe82ab6b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('159', '356b58ddff4a4f85aa3dd1f874964314', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('160', 'b7b2dba53e1e41c98c15f1689a90d00b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('161', 'b8c3e2f7114e414b8fb99e001bdc1ca4', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('162', '86610021504e4daa814b0724804ff87d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('163', '53c95658c1a94f35bf5088be357f2d38', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('164', '26767c89eeb84e56a411f686b3242491', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('165', 'dec929f879a74636a22f2f4992470c5d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('166', 'caeb9888ba65418d8a757ed91c69fe26', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('167', '2d05a9c495ea48598814eb46f3852102', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('168', '929524e601fd458993317a4f8a8be33a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('169', '11ac0bb2d9074573bdfcb40511a302b9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('170', '80fdfc5251234915924d6b310d510af7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('171', '34b600ff3fd4494cb3c34af2910b9c5e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('172', '370562231d9447c797d9c9d4df04413b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('173', '3fcd60e96e85430fa99e85886804dbc5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('174', '1889c935ddca4f81bf1046dccfcfe906', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('175', 'e4033ddf5bf14ea19249242cf83e5662', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('176', '283b82e93f0f45e9aebe62a6fa3194bd', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('177', 'f19ccdc2eeea49939b4ed4c0cd3c0b49', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('178', '05bd42ccee274a6393edf7e5be2ed902', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('179', 'f399670d423442909dadfe3238915cb8', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('180', '0c1ff61fb5664ba5b41d844b2bcbc5c5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('181', '89404919a18c4bc5b68828c5d08a6598', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('182', '763dd4de4298424387cf13c099fef025', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('183', '030ebf82676c4160920670728bce3cb2', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('184', 'fc7adea930dc418886e8f791fce7dd8f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('185', '5d52c02bc2754881b37cda5efcd765c5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('186', 'dc1ba71e0da24d53a552beb64d1e3505', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('187', 'd2912b5dd3b84ab396c0a87210e3ab30', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('188', 'ec871e4a3c7842309abc22e3f6b9a1c3', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('189', '86d67b11fc0149bfad3a4189e2b94f36', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('190', '9b6b32f8e1d74a12ae60eff39caa5e1e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('191', '1313b93cb906494d896c059eca62762a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('192', '8556d08d0aa1479a980a2068dad291e5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('193', '40609cc4a8d24b1cae714d3b26549718', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('194', '8ca6b8d1b2a74fc79126bbf910396c18', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('195', 'b1d0484dce464b06900be842cb6487a9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('196', '70aa9bea6b8b4cd4aef87b9f28782d51', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('197', 'a4421d798f254077ab73cb440d23b126', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('198', '490b90c22bd74cc49ffac5a8bf339cc3', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('199', '18d7283440854ef68e30bcc83671777f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('200', '778a695cbabb4defb7e5e7d728c1ce97', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('201', 'f25dd684c4954768ab254a9693a3b8af', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('202', '9676a76072744b9b893b080389667675', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('203', '3add22feb0064256bc19c209d14b5aeb', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('204', '7f29278f5aaf461988e0ca6ae380c212', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('205', '5532bf13ebbc4881925c21c1aa96302c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('206', '6e9b4ddd5cf34072a01953fc220a2fd5', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('207', '90acac5c5e9e4969b2a78f0613ee6b9a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('208', '19b5f1637e174a31a91c4ddcef3bb4c0', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('209', 'ad186f105f5344908a66dac76dbf7d06', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('210', '73e33d43deed43ae8f631f61ea4c7d93', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('211', '1f8a51f44c3f4dfe878c0b978a5720d6', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('212', '0b9dd9f7be554a4eb07ff7bf716a81b9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('213', 'e2623b25d9884cfe9cb0a93b785d8362', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('214', '194e1a7a1fdc4a6eae2bd4db1dea2661', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('215', '5f2c77490e4a4106b2b4c22fb0c59aaf', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('216', '57f777df1fd84e7a9ce88da91459c4dd', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('217', '3aa152ed6319424097a29e41f3dd14d4', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('218', '5f8d5f1735d145b59282e5eb840459f7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('219', 'ca00b2ec92d54b21b57b823a72f1024e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('220', 'd7b687d7dd9e4b758dbc143625915076', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('221', '633e13950b7540eebf0d07022784962f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('222', 'e3e1aa79ab624d338eca2ba5be687262', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('223', '9fc9acd39cfb42e1960472bda97f87ce', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('224', '4dbb7acd1a964ccfac105ca77368552e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('225', 'f36038f6f48040d9ba40b94342490736', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('226', 'c78f3947c772431bb95dfbad58fe0fc3', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('227', 'aeb1ad5106554199bb6c16dfe6597c92', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('228', '10aefb57f2f247b290c91e2253e8ce2d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('229', 'b0d6061db5e24b2aa9b648b82acbca5e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('230', 'c511a5d43fd2483c9980a3ddd774caa7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('231', '22262588cd464d568f4d756512152c3d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('232', 'cd62c57b27af4b95bf3e9b868c318e98', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('233', '87af232710634e8ebab31d8d432c51da', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('234', '657d2b2dcbd44934aad101f1e304e465', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('235', '447a7075ee9241b4b39e8976aa24709d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('236', '3d795b3a0b1849fb8da486151cba9b8b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('237', 'b343696f562c437facda8fb136de09c9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('238', '58429820b3764a56a8fda45833ec4737', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('239', '764fd678f9894d759a278734fb63d460', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('240', '56d01e5582ce44b5a1cbe553a3336f21', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('241', 'd17cf7897d1f42cbbfdc509ebf5f38de', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('242', 'dd280caa96f24e5b96a586071a7e6ff1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('243', 'bb4ca5ddf1884eb38e667274445372d7', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('244', 'eb186fe0b20447fba47e45846b51c344', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('245', 'f0da7798ecc74190ab17da47634e5401', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('246', '35e6084d7dc44b1ca8e9033302969275', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('247', '3ddf4b633d8f474f9a8aaffd73db0482', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('248', '9cd6aa6943934ec9b1b5dbe67edd6308', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('249', '8540783c287245698b4e41c14c56e606', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('250', '238bd1047afc4fc0a220977c44a07336', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('251', '983b4609b07f403390d2df8b7a738bfe', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('252', 'b01cdaa1a9b14ba6970a31506f56ff23', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('253', 'fab2055b35d040d9b28f02c6630c630f', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('254', 'a65e7b106ae7449880200557e60d014e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('255', '8d35c5c4667747619886eda5b61e80f1', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('256', 'd53a434d16b14b23b79bf31dee90a1ea', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('257', '606368bc5d894dc69213360eeb3f3c1d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('258', '64cd7f08d9f941a4965f07aaf876b41b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('259', '99014ba26f30421dbac81e489c444ebe', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('260', 'b6eeebf8952b4bc9a74b2e143911441d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('261', 'c4c47e534e3048ed839d5a637b07020c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('262', 'b5c65a65008a46e3a9894825b98b182e', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('263', 'f871f8eb397e40b9bd69b4496942875b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('264', '7dfbd05de7a14c9f87928c90bdda2192', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('265', '8f0d0bef28c34fc59c3a643eea3ad0f2', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('266', '6be1d4d0c2e04294b83075a44f4c5a87', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('267', 'ace2d0e6f02f4189b08a63380f4f6b5a', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('268', 'c5491e097dfa4571b8a0b7117c79c978', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('269', '3c6e8be51c62407c9d6a9072866c728d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('270', '57ceef23523041babd9cec2026f3fd7b', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('271', 'fa3278919bba435e857a341de20f95c2', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('272', 'cc2b89e39e374669980b67dabbd727eb', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('273', '7565855bdad4464a9b2ef86ae988b163', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('274', '381f2e01b83742149361cb116c106e12', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('275', '0e0d51db38d54019883a97efae6a613c', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('276', 'e5b92c26f1d24283898773c273b6aaab', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('277', '66bca0f5d7064f0fa3217eb1b4b3dff9', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('278', 'cd6e65c8117d47d6b905cd699953440d', 'a7f5845b565f4a9b9e63ff2c987ea9c6');
INSERT INTO `sysrolespermission` VALUES ('279', '906235e44bc1410681174f4b350bac22', 'a7f5845b565f4a9b9e63ff2c987ea9c6');

-- ----------------------------
-- Table structure for `systemnotify`
-- ----------------------------
DROP TABLE IF EXISTS `systemnotify`;
CREATE TABLE `systemnotify` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `sendTime` datetime DEFAULT NULL,
  `staffName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `systemNotify_1_idx` (`sendTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of systemnotify
-- ----------------------------

-- ----------------------------
-- Table structure for `systemsetting`
-- ----------------------------
DROP TABLE IF EXISTS `systemsetting`;
CREATE TABLE `systemsetting` (
  `id` int NOT NULL,
  `allowRegister` bit(1) NOT NULL,
  `backstagePageNumber` int DEFAULT NULL,
  `closeSite` int DEFAULT NULL,
  `closeSitePrompt` longtext,
  `description` varchar(255) DEFAULT NULL,
  `editorTag` longtext,
  `forestagePageNumber` int DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `login_submitQuantity` int DEFAULT NULL,
  `registerCaptcha` bit(1) NOT NULL,
  `supportAccessDevice` int DEFAULT NULL,
  `temporaryFileValidPeriod` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userSentSmsCount` int DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `comment_submitQuantity` int DEFAULT NULL,
  `topic_submitQuantity` int DEFAULT NULL,
  `realNameUserAllowComment` bit(1) NOT NULL,
  `realNameUserAllowTopic` bit(1) NOT NULL,
  `comment_rewardPoint` bigint DEFAULT NULL,
  `reply_rewardPoint` bigint DEFAULT NULL,
  `topic_rewardPoint` bigint DEFAULT NULL,
  `allowTopic` bit(1) NOT NULL,
  `allowFeedback` bit(1) NOT NULL,
  `allowComment` bit(1) NOT NULL,
  `allowFilterWord` bit(1) NOT NULL,
  `filterWordReplace` varchar(255) DEFAULT NULL,
  `privateMessage_submitQuantity` int DEFAULT NULL,
  `topicEditorTag` longtext,
  `comment_review` int DEFAULT NULL,
  `reply_review` int DEFAULT NULL,
  `topic_review` int DEFAULT NULL,
  `topicUnhidePlatformShareProportion` int DEFAULT NULL,
  `fileSecureLinkExpire` bigint DEFAULT NULL,
  `fileSecureLinkSecret` varchar(190) DEFAULT NULL,
  `allowAnswer` bit(1) NOT NULL,
  `allowQuestion` bit(1) NOT NULL,
  `answerEditorTag` longtext,
  `answerReply_review` int DEFAULT NULL,
  `answerReply_rewardPoint` bigint DEFAULT NULL,
  `answer_review` int DEFAULT NULL,
  `answer_rewardPoint` bigint DEFAULT NULL,
  `answer_submitQuantity` int DEFAULT NULL,
  `questionEditorTag` longtext,
  `question_review` int DEFAULT NULL,
  `question_rewardPoint` bigint DEFAULT NULL,
  `question_submitQuantity` int DEFAULT NULL,
  `realNameUserAllowAnswer` bit(1) NOT NULL,
  `realNameUserAllowQuestion` bit(1) NOT NULL,
  `maxQuestionTagQuantity` int DEFAULT NULL,
  `questionRewardPlatformShareProportion` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of systemsetting
-- ----------------------------
INSERT INTO `systemsetting` VALUES ('1', '', '30', '1', '网站暂时关闭', '视频创作分享网', '{\"fontname\":true,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":false,\"fileFormat\":[],\"fileSize\":null,\"embedVideo\":false,\"uploadVideo\":false,\"videoFormat\":[],\"videoSize\":null,\"hidePassword\":false,\"hideComment\":false,\"hideGrade\":false,\"hidePoint\":false,\"hideAmount\":false,\"fullscreen\":true}', '30', '视频创作分享网', '10', '', '1', '120', '视频创作分享网', '10', '1617893244036', '10', '10', '', '', '5', '5', '10', '', '', '', '', '*', '10', '{\"fontname\":true,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":true,\"fileFormat\":[\"mp4\",\"avi\",\"mkv\",\"wmv\",\"wav\",\"rm\",\"rmvb\",\"mp3\",\"flac\",\"ape\",\"zip\",\"rar\",\"7z\",\"txt\",\"docx\",\"doc\",\"pptx\",\"ppt\",\"xlsx\",\"xls\"],\"fileSize\":\"5000\",\"embedVideo\":true,\"uploadVideo\":true,\"videoFormat\":[\"mp4\",\"avi\",\"mkv\",\"wmv\",\"rm\",\"rmvb\"],\"videoSize\":\"50000\",\"hidePassword\":true,\"hideComment\":true,\"hideGrade\":true,\"hidePoint\":true,\"hideAmount\":true,\"fullscreen\":true}', '10', '10', '10', '0', '300', '', '', '', '{\"fontname\":true,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":false,\"fileFormat\":[],\"fileSize\":null,\"embedVideo\":false,\"uploadVideo\":false,\"videoFormat\":[],\"videoSize\":null,\"hidePassword\":false,\"hideComment\":false,\"hideGrade\":false,\"hidePoint\":false,\"hideAmount\":false,\"fullscreen\":true}', '10', '5', '10', '5', '10', '{\"fontname\":true,\"fontsize\":true,\"forecolor\":true,\"hilitecolor\":true,\"bold\":true,\"italic\":true,\"underline\":true,\"removeformat\":true,\"link\":true,\"unlink\":true,\"justifyleft\":true,\"justifycenter\":true,\"justifyright\":true,\"insertorderedlist\":true,\"insertunorderedlist\":true,\"emoticons\":true,\"image\":true,\"imageFormat\":[\"jpg\",\"jpeg\",\"bmp\",\"png\",\"gif\"],\"imageSize\":\"5000\",\"file\":false,\"fileFormat\":[],\"fileSize\":null,\"embedVideo\":false,\"uploadVideo\":false,\"videoFormat\":[],\"videoSize\":null,\"hidePassword\":false,\"hideComment\":false,\"hideGrade\":false,\"hidePoint\":false,\"hideAmount\":false,\"fullscreen\":true}', '10', '10', '10', '', '', '5', '0');

-- ----------------------------
-- Table structure for `sysusers`
-- ----------------------------
DROP TABLE IF EXISTS `sysusers`;
CREATE TABLE `sysusers` (
  `userId` varchar(32) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `issys` bit(1) NOT NULL,
  `userDesc` varchar(255) DEFAULT NULL,
  `userDuty` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userAccount` varchar(30) DEFAULT NULL,
  `securityDigest` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UKi13uxat3wa9pt2glvqr05g7rn` (`userAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysusers
-- ----------------------------
INSERT INTO `sysusers` VALUES ('4aa5a9a9d54c4a22a8fff3bc27f35aa5', '', 'admin', '', null, '管理员', '$2a$10$lzT8h9dX0FqweQBzg/dvL.rwjxHS0KSxrv4thNVWcaJZhngH7lz1G', 'admin', '966e822bb7804fefb8b76bc2a21a653c');
INSERT INTO `sysusers` VALUES ('8f2507b36a73444f96e03e39ec4fb399', '', 'admin2', '', '', '管理员', '$2a$10$LQ1G0r648hAwd8ltPAxAr.e5JijJbRVqeRFIXEd/5G3yUR96Hsl4e', 'admin2', '71f334dc8fb642efa1e5425ec07c2b2f');

-- ----------------------------
-- Table structure for `sysusersroles`
-- ----------------------------
DROP TABLE IF EXISTS `sysusersroles`;
CREATE TABLE `sysusersroles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) DEFAULT NULL,
  `userAccount` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of sysusersroles
-- ----------------------------

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` bigint NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_1_idx` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('32317710426761', '人物摄影', '200');
INSERT INTO `tag` VALUES ('32317742826762', '专业单反摄影', '150');
INSERT INTO `tag` VALUES ('35515296854767', '口碑微单摄影', '0');
INSERT INTO `tag` VALUES ('35515298054768', '手机摄影', '0');
INSERT INTO `tag` VALUES ('35515300054769', '日常分享', '0');

-- ----------------------------
-- Table structure for `templates`
-- ----------------------------
DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `columns` longtext,
  `dirName` varchar(40) DEFAULT NULL,
  `introduction` longtext,
  `name` varchar(255) DEFAULT NULL,
  `thumbnailSuffix` varchar(20) DEFAULT NULL,
  `uses` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of templates
-- ----------------------------
INSERT INTO `templates` VALUES ('1', '[{\"id\":1,\"name\":\"首页\",\"parentId\":0,\"childColumn\":[],\"sort\":100,\"linkMode\":3,\"url\":\"index\"},{\"id\":3,\"name\":\"问答\",\"parentId\":0,\"childColumn\":[],\"sort\":75,\"linkMode\":3,\"url\":\"askList\"},{\"id\":2,\"name\":\"会员卡\",\"parentId\":0,\"childColumn\":[],\"sort\":50,\"linkMode\":3,\"url\":\"membershipCardList\"}]', 'default', '', '默认', 'jpg', '');

-- ----------------------------
-- Table structure for `thumbnail`
-- ----------------------------
DROP TABLE IF EXISTS `thumbnail`;
CREATE TABLE `thumbnail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `high` int DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `specificationGroup` varchar(25) DEFAULT NULL,
  `width` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKi1c51f71y0grwc0d7wyoe5mig` (`specificationGroup`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of thumbnail
-- ----------------------------
INSERT INTO `thumbnail` VALUES ('1', '120', '120乘120', '120x120', '120');

-- ----------------------------
-- Table structure for `timetask`
-- ----------------------------
DROP TABLE IF EXISTS `timetask`;
CREATE TABLE `timetask` (
  `id` varchar(191) NOT NULL,
  `cron` varchar(250) DEFAULT NULL,
  `misfireInstruction` int DEFAULT NULL,
  `performType` varchar(20) DEFAULT NULL,
  `remark` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of timetask
-- ----------------------------

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `allow` bit(1) NOT NULL,
  `commentTotal` bigint DEFAULT NULL,
  `content` longtext,
  `ip` varchar(45) DEFAULT NULL,
  `isStaff` bit(1) DEFAULT NULL,
  `lastReplyTime` datetime DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `tagId` bigint DEFAULT NULL,
  `title` varchar(190) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `viewTotal` bigint DEFAULT NULL,
  `image` longtext,
  `status` int DEFAULT NULL,
  `summary` longtext,
  `sort` int DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_idx` (`tagId`,`status`),
  KEY `topic_3_idx` (`userName`,`postTime`),
  KEY `topic_5_idx` (`status`,`sort`,`lastReplyTime`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('6', '', '0', '<div> \n <div>\n   这波是vn和他的4个破绽 \n </div> \n <div> \n  <a href=\"http://localhost:8081/#\" rel=\"nofollow\"></a> \n  <a href=\"http://localhost:8081/#\" rel=\"nofollow\"></a> \n  <div> \n   <div> \n    <ul> \n     <li> <a rel=\"nofollow\"><img src=\"http://tiebapic.baidu.com/forum/wh%3D90%2C106%3Bcrop%3D0%2C0%2C90%2C90/sign=c594325e650e0cf3a0a246f23a6ac32f/42713ddbb6fd526685d0a358bc18972bd5073639.jpg\"></a> \n      <div> \n      </div> </li> \n    </ul> \n   </div> \n  </div> \n </div> \n</div>', '0:0:0:0:0:0:0:1', '', '2021-03-20 17:24:33', '2021-03-20 17:24:33', '32317742826762', '黑色玫瑰这五个人', 'tom', '1', null, '120', '这波是vn和他的4个破绽..', '0', null);
INSERT INTO `topic` VALUES ('7', '', '0', '<img src=\"http://tiebapic.baidu.com/forum/wh%3D203%2C90/sign=8a3ee96a7a224f4a57cc7b1139c4bc6b/bc846309c93d70cf03023541efdcd100bba12b38.jpg\">', '0:0:0:0:0:0:0:1', '', '2021-03-20 17:25:40', '2021-03-20 17:25:40', '32317742826762', '测试内容', 'tom', '1', null, '120', null, '0', null);
INSERT INTO `topic` VALUES ('8', '', '0', '<span style=\"background-color: #FFFFFF; color: #333333; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; \">LOL刚进去的时候基本90-110帧左右，玩几分钟以后就会慢慢降到50多到60多帧，之后就会在50左右。而且结束的时候，在结算界面偶尔会出现大黑块，而且大黑块位置也不一样。用的是华硕笔记本飞行堡垒fx50j，i5-4200u，显卡GTX950M，自装的三星固态860EVO，英雄联盟也在固态里。（注：游戏录制已关闭，英伟达官网最新显卡驱动，已开性能模式，没有开垂直同步），好难受啊，试了好多办法都没效果，求助各位大神，先谢谢了</span> \n<img src=\"https://tb2.bdstatic.com/tb/editor/images/face/i_f19.png?t=20140803\"> \n<img src=\"http://tiebapic.baidu.com/forum/w%3D580/sign=6d26a1f3da11728b302d8c2af8fcc3b3/65a4acd3fd1f41342b2c2b1c321f95cad0c85ef7.jpg\"> \n<br> \n<img src=\"http://tiebapic.baidu.com/forum/w%3D580/sign=43faca52ada1cd1105b672288912c8b0/4131a21ea8d3fd1ffa128c58274e251f94ca5ff7.jpg\"> \n<br> \n<img src=\"http://tiebapic.baidu.com/forum/w%3D580/sign=24ecca9ab086c91708035231f93d70c6/70649882d158ccbfdda79b580ed8bc3eb03541f7.jpg\"> \n<br> \n<img src=\"http://tiebapic.baidu.com/forum/w%3D580/sign=4f2fa88c8b82d158bb8259b9b00a19d5/4fee90eef01f3a29b3d3fbac8e25bc315d607cf7.jpg\">', '0:0:0:0:0:0:0:1', '', '2021-03-20 17:42:13', '2021-03-20 17:42:13', '32317742826762', '看看我的新皮肤', 'tom', '1', null, '120', 'lol刚进去的时候基本90-110帧左右，玩几分钟以后就会慢慢降到50多到60多帧，之后就会在50左右。而且结束的时候，在结算界面偶尔会出现大黑块，而且大黑块位置也不一样。用的是华硕笔记本飞行堡垒fx50j，i5-4200u，显卡gtx950m，自装的三星固态860evo，英雄联盟也在固态里。（注：游戏录制已关闭，英伟达官网最新显卡驱动，已开性能模式，没有开..', '0', null);
INSERT INTO `topic` VALUES ('9', '', '0', '<img src=\"file/topic/2021-03-20/image/b352fb75c7944550a7fcc5391ae1633eb2.png\" alt=\"\">', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:03:07', '2021-03-20 18:03:07', '32313143073265', '测试内容', 'tom', '1', '[{\"path\":\"file/topic/2021-03-20/image/\",\"name\":\"b352fb75c7944550a7fcc5391ae1633eb2.png\"}]', '120', null, '0', null);
INSERT INTO `topic` VALUES ('10', '', '1', '<video src=\"file/topic/2021-03-20/media/f75a8835fa514669a5223e2b97e70f58b2.mp4\" width=\"550\" height=\"400\" controls=\"controls\"></video>', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:14:39', '2021-03-20 18:13:42', '32317710426761', ' 全新云顶之弈模式来了！全模式最强英雄居然是亚索？', 'tom', '1', null, '120', null, '0', null);
INSERT INTO `topic` VALUES ('11', '', '1', '<p> <span style=\"background-color: #FFFFFF; color: #333333; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; \">被误封怎么办。着急！我就玩个大乱斗，说我使用第三方插件。?腾讯到底要干嘛！申诉也说需要三天的时间。也没人工客服。叫天天不应，叫地地不灵！</span> </p> \n<p> <span style=\"background-color: #FFFFFF; color: #333333; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; \"><img src=\"file/topic/2021-03-20/image/4dae1c66cfc94fecae674b2bbab63093b2.jpg\" alt=\"\"><br> </span> </p>', '0:0:0:0:0:0:0:1', '', '2021-03-20 18:23:29', '2021-03-20 18:16:10', '32317744226763', '被误封怎么办。着急！我就玩个大乱斗，说我使用第三方插件。', 'tom', '2', '[{\"path\":\"file/topic/2021-03-20/image/\",\"name\":\"4dae1c66cfc94fecae674b2bbab63093b2.jpg\"}]', '120', '被误封怎么办。着急！我就玩个大乱斗，说我使用第三方插件。?腾讯到底要干嘛！申诉也说需要三天的时间。也没人工客服。叫天天不应，叫地地不灵！..', '0', null);
INSERT INTO `topic` VALUES ('12', '', '0', '<p> 我看？小兔子这么喜欢吃。白菜叶，看起来她很喜欢吃白菜叶呢。这个小兔子吃白菜的时候可以用狼吞虎咽来形容。 </p> \n<p> <img src=\"file/topic/2021-03-31/image/5d9ff214ae6e4761b5c1aa78ccf30ac9b2.jpg\" alt=\"\"> </p> \n<p> </p> \n<div style=\"background-color: #FFFFFF; padding: 10px 50px; color: #333333; font-size: 16px; font-family: PingFangSC-Regular; \"> \n <div style=\"padding: 0px; font-family: PingFangSC-light; text-align: justify; \">\n   我是从卖菜阿姨那儿领养的， 阿姨叫我领养两天 \n </div> \n <div style=\"padding: 0px; \"> \n </div> \n</div> \n<div style=\"background-color: #FFFFFF; padding: 10px 50px; color: #333333; font-size: 16px; font-family: PingFangSC-Regular; \"> \n <div style=\"padding: 0px; font-family: PingFangSC-light; text-align: justify; \"> \n </div> \n</div> \n<video src=\"file/topic/2021-03-31/media/f43cb602ae82412c861a38bd047c2d95b2.mp4\" width=\"550\" height=\"400\" controls=\"controls\"></video> \n<p></p> \n<p> </p> 这是我和我的朋友，还有小兔子的合影，是不是很温和呢。 \n<p></p>', '0:0:0:0:0:0:0:1', '', '2021-03-31 23:34:14', '2021-03-31 23:34:14', '32317710426761', '我想领养一个小兔兔', 'tom', '0', '[{\"path\":\"file/topic/2021-03-31/image/\",\"name\":\"5d9ff214ae6e4761b5c1aa78ccf30ac9b2.jpg\"}]', '120', '我看？小兔子这么喜欢吃。白菜叶，看起来她很喜欢吃白菜叶呢。这个小兔子吃白菜的时候可以用狼吞虎咽来形容。         我是从卖菜阿姨那儿领养的， 阿姨叫我领养两天             这是我和我的朋友，还有小兔子的合影，是不是很温和呢。..', '0', null);
INSERT INTO `topic` VALUES ('13', '', '0', '<video src=\"file/topic/2021-03-31/media/a2664529fddb484b8b633cd2db8625dbb2.mp4\" width=\"550\" height=\"400\" controls=\"controls\"></video>', '0:0:0:0:0:0:0:1', '', '2021-03-31 23:35:21', '2021-03-31 23:35:21', '32317710426761', 'fgbn', 'tom', '0', null, '110', null, '0', null);
INSERT INTO `topic` VALUES ('14', '', '2', '<p> 我看？小兔子这么喜欢吃。白菜叶，看起来她很喜欢吃白菜叶呢。这个小兔子吃白菜的时候可以用狼吞虎咽来形容。 </p> \n<p> <img src=\"file/topic/2021-03-31/image/7fec9bdeaa4e42839066ffdbe3f41b47b2.jpg\" alt=\"\"> </p> \n<p> </p> 我是从卖菜阿姨那儿领养的， 阿姨叫我领养两天 \n<video src=\"file/topic/2021-03-31/media/ea382c1fb0e741fb8f31dc51a020b6c1b2.mp4\" width=\"550\" height=\"400\" controls=\"controls\"></video> \n<p></p> \n<p> </p> 这是小兔子单独照，她正在低头找东西呢。 这是小兔子单独照，她正在低头找东西呢。 \n<p></p>', '0:0:0:0:0:0:0:1', '', '2021-03-31 23:43:43', '2021-03-31 23:40:25', '32317710426761', '我想养个小兔兔', 'tom', '1', '[{\"path\":\"file/topic/2021-03-31/image/\",\"name\":\"7fec9bdeaa4e42839066ffdbe3f41b47b2.jpg\"}]', '120', '我看？小兔子这么喜欢吃。白菜叶，看起来她很喜欢吃白菜叶呢。这个小兔子吃白菜的时候可以用狼吞虎咽来形容。       我是从卖菜阿姨那儿领养的， 阿姨叫我领养两天     这是小兔子单独照，她正在低头找东西呢。 这是小兔子单独照，她正在低头找东西呢。..', '0', null);
INSERT INTO `topic` VALUES ('15', '', '0', '* 哈哈哈 达四大', '0:0:0:0:0:0:0:1', '', '2021-04-01 00:01:56', '2021-04-01 00:01:56', '32313143073265', 'caonim', 'tom', '0', null, '110', '* 哈哈哈 达四大..', '0', null);
INSERT INTO `topic` VALUES ('16', '', '1', '<p> 原标题：优秀人像摄影作品分析 </p> \n<p> <strong>人像摄影的魅力在于摄影家对景象、人物、事件的瞬间把握。一种角度、一个神态、一束光线，都是构成一幅佳作的要素。然而，现实中天时地利人和的机会并不经常出现，即便出现，摄影家也不易捕捉到。这便是传统摄影的缺憾。</strong> </p> \n<p> <strong>数码摄影技术的进步在一定程度上弥补了这样的缺憾。今天小编为大家介绍的作者唐民皓先生就是这样一位在数码摄影领域不断尝试和创作的探索者。他在良好抓拍技能的基础上，充分利用数码后期制作的技术优势，把人文、自然环境中的精彩场景组合成一幅幅鲜活的人像作品，再造了在瞬间中无法捕捉到的画面。</strong> </p> \n<p> 以下是 <strong>人像摄影作品欣赏及分析案例</strong>，不多说，我们一起欣赏吧。。。。。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649495760309.JPEG\"> </p> \n<p> ■ 《母爱的眼神》，摄于德国威斯巴登。构图颇有惠斯勒画作《母亲》的神韵。画面中母亲的眼神目不转睛地凝聚在孩子身上，母爱的温柔、真切和细腻在此刻成为永恒。作品大幅压低了背景的亮度，突出了母子对视的深情一刻。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649530746363.JPEG\"> </p> \n<p> ▲ 《老屋门前》，摄于浙江前童古镇，后期合成。少女蒙娜丽莎般的眼神，与两个小动物和谐相处，让人体悟到桃花源南山下生活的氛围。整幅作品压低了影调，减弱了色彩的浓度，安逸和宁静的气氛油然而生。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649554617259.JPEG\"> </p> \n<p> ▲ 《马与他的主人》，摄于上海松江某马场。作品以男子与黑骏马相拥相吻的瞬间，刻画了人与动物之间超然的情感，显现出生活中令人感动的真实场景。后期对画面进行了模糊处理，并突出了男子红衣的鲜活色调。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649595146561.JPEG\"> </p> \n<p> ■ 《回娘家》，摄于云南，后期合成。薄雾气氛中的画面近实远虚，急切探母的妈妈与回头顾盼的孩子。作品用湖蓝的淡色调，吟诵出“斜风细雨不须归”的淡淡诗意。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649628100857.JPEG\"> </p> \n<p> ■ 《母亲·俄罗斯后裔》，摄于内蒙古呼伦贝尔。作品光影对比强烈，画面在具有视觉冲击力的同时，仿佛讲述着一个平凡而曲折的家庭故事。身后的家人在幽暗的内室忙碌着，而身为家庭主妇的她，侧身回顾，秉承着一颗操劳的心。作品压暗背景亮度，营造了北方家庭简朴的氛围。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649670244403.JPEG\"> </p> \n<p> ■ 《巴伐利亚少女》，摄于德国巴伐利亚。作品恰到好处地捕捉到少女那由衷欢笑的瞬间，造型生动，前后呼应，清新的色彩，高雅的灰层次，一派别致的灿烂春光。 </p> \n<p> <img src=\"http://n1.itc.cn/img8/wb/recom/2016/05/31/146466649718089246.PNG\"> </p> \n<p> ■ 《放飞时刻》，摄于浙江前童古镇。作品中两个夕阳下归家的孩童，雀跃的神情，飞奔的脚步，刹那间喷射出欢快、纯真的童趣。作品降低了背景色彩的饱和度，反映出作者心中对乡间生活的体悟。 </p> \n<p> <strong>作者在数码后期中，尤其注重画面色彩的调整，针对不同作品的场景，赋予画面在前期摄影中无法得到的个性化色调，使作品形成了一般摄影作品不具有的视觉冲击效果。作者既练就了对人物神态敏锐的捕捉技巧，更具有画家的审美眼光和构思能力。相比传统的摄影作品，他的作品承载了深厚的人文功底、相当的艺术修养和娴熟的图片驾驭能力。在数码技术飞速发展的今天，他的创作实践再次阐释了数码摄影后期制作的“魅力”。</strong><a href=\"https://www.sohu.com/?strategyid=00001&amp;spm=smpc.content.content.2.1617432315370tEFpvaJ\" target=\"_blank\" rel=\"nofollow\"><span><i></i>返回搜狐，查看更多</span></a> </p> \n<p> 责任编辑：<span></span> </p>', '0:0:0:0:0:0:0:1', '', '2021-04-03 14:59:51', '2021-04-03 14:46:59', '32317710426761', '人物摄影', 'tom', '2', null, '20', '原标题：优秀人像摄影作品分析   人像摄影的魅力在于摄影家对景象、人物、事件的瞬间把握。一种角度、一个神态、一束光线，都是构成一幅佳作的要素。然而，现实中天时地利人和的机会并不经常出现，即便出现，摄影家也不易捕捉到。这便是传统摄影的缺憾。   数码摄影技术的进步在一定程度上弥补了这样的缺憾。今天小编为大家介绍的作者唐民皓先生就是这样一位在数码摄影领域不断尝试..', '0', null);
INSERT INTO `topic` VALUES ('17', '', '0', '<div> \n <div> \n  <p> <img src=\"https://zhongces3.sina.com.cn/products/201905/e27b11cd558fa442030bdd97e22c5c73.jpeg\"> </p> \n  <div> \n   <p> 我是如何在手机上摄影的：手机摄影心得分享 </p> \n   <p> <a href=\"http://zhongce.sina.com.cn/space/index/6533162342/\" target=\"_blank\" rel=\"nofollow\"> <img title=\"极客的笔\" alt=\"极客的笔\" src=\"https://tvax2.sinaimg.cn/crop.0.0.1080.1080.50/00788tYaly8gn2brc41ssj30u00u0wf3.jpg?KID=imgbed,tva&amp;Expires=1617442461&amp;ssig=Rpzg4KeD%2B3\"> <span>极客的笔</span> <em></em> </a> <span>2019-05-03 09:10</span> </p> \n  </div> \n </div> \n <div> \n  <div> \n   <p> 从去年的11月到现在，已依偎新浪众测的怀抱里有一年了，在这一年中学到了很多，平时喜欢看他人的原创，可以学到许多东西，我在这一年中也写了几篇文章其中有热度很高的，也有无人问津的，文章的配图基本上都是用<strong>手机拍摄和后期</strong>，也算小有心得吧。所以今天来分享下我对手机摄影和后期的理解同时还有一些技巧分享。 </p> \n   <p> 由于用手机自带的相机拍照后期可塑性更高，所以我在手机上拍开箱照基本上都是用<strong>原生相机</strong>，拍生活照才会用到一些摄影软件，原生相机有几个常用的技巧我分享下，或许你已经知道并掌握了这几个技巧，那么你可以看本文后面分享的我在手机上摄影常用的App和常用的后期App。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/0bee89467e97a509d26f00e8a21c7e6f.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 常用App </p> \n   <p> <strong>一，苹果自带相机使用技巧1</strong> </p> \n   <p> <strong>1，巧用曝光</strong> </p> \n   <p> 用原生相机拍照没有过多的修饰，也没有花里胡哨，但是有时候看手机直出的照片时总感觉少了点什么，摄影最高的技巧是<strong>光的处理</strong>，有时候一张很平常的照片把曝光度调低了以后会发现照片很有质感。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/25f3c6420c24f528991ca847f7c000fd.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 高曝光 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/bd1b68eff26a8f6ea4f5f442d7a32420.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 低曝光 </p> \n   <p> 所以我常常在拍照时会把照片的曝光调低点以得到不错的照片，具体操作方法是打开相机来到照相界面，对准要拍的对象找到合适的焦距，然后按住屏幕一段时间直到屏幕显示一个小方框和一个<strong>小太阳</strong>为止，然后通过上拉和下拉小太阳使得照片的曝光度增大减小，知道你认为能得到一张好照片为止。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/058d8ca86b2759c1a60a34dc0ab93b54.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 小太阳 </p> \n   <p> <strong>2，利用Live Photo（实况照片）获取长曝光照片</strong> </p> \n   <p> Live Photo也就是实况照片很少人用，它能够记录一段拍摄前一秒动态信息而不是静态的照片，其实利用实况照片可以得到类似于长曝光的照片，比如拍城市风光照时利用长曝光可以得到完整的车流光影轨迹，拍水面可以使水面更“丝滑柔顺”。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/d92bce88f5019fb03d3e7b92083d9582.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 图片出自‘果核Group’ </p> \n   <p> 需要注意的是拍摄动态照片的时候<strong>手要稳不能抖</strong>，拍好之后在照片里打开此实况照片向<strong>上拉</strong>就可以找到长曝光选项，通过这技巧是不是又感觉自己的摄影技术更进了一步？这个技巧我也是学来的。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/af46c37360c493cebf95c4986359b716.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 长曝光选项 </p> \n   <p> <strong>3，利用三分线构图</strong> </p> \n   <p> 想要用手机拍出一张好照片构图很重要，但是很多人都不会构图，其实苹果相机早就帮你想好了，在设置里找到相机打开网格选项，在相机界面就出现了<strong>网格</strong>，拍照时只需要尽量将所拍物体<strong>放在线上或者交点上</strong>，就能轻松拍出一张好照片。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/00c33fd9cdbce94eafb569c0b8fcdd47.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 网格线 </p> \n   <p> 这张拍的建筑，建筑正好在右边的线上，看着比在中间更好看。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/e209307ed5e7cf4973415d9d800c6ba0.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 拍建筑 </p> \n   <p> 这张也是一样，把主体放在中间就不协调了。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/0d9878fe089f0d0090cc495ab38f0318.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 打羽毛球的人 </p> \n   <p> 以上就是我用iPhone原生相机的心得感受，下面分享一些我在手机上常用的摄影App和后期App。&nbsp; </p> \n   <strong>二，我在手机上摄影常用的App</strong> \n   <p> 生活中有许多值得记住的瞬间，这时候手机成了最方便的工具，拍后也不怎么需要后期，所以选一个自带滤镜的摄影App来拍生活照再适合不过了。 </p> \n   <p> 下面介绍几款我常用的手机后期App。 </p> \n   <p> <strong>1，摄影</strong> </p> \n   <p> <strong>a，NOMO</strong> </p> \n   <p> Nomo是一款非常好用的<strong>胶片相机</strong>，里面有众多胶片相机型号可以选择，并且目前还在以<strong>两周一款</strong>的速度增加着（官方这样说的），适合喜欢复古胶片色彩的朋友用，平时用它拍照发朋友圈逼格满满，NOMO相机吸引人的原因还有一个是<strong>使用它的过程</strong>，无论是模拟相机界面，还是甩甩出片更快都赋予了这款相机App独一无二的灵魂。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/0493ea21342a064314d7158ddaa61d04.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> NOMO </p> \n   <p> 放几张我用NOMO拍的照片 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/236b9d45d6b6c3c34ab50fade7819506.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 演唱会 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/733e6de373b0b9c2be137e71d1aa23eb.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 木桥 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/d413beb9074443a0839bce4755be2269.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 湖 </p> \n   <p> 软件是免费的，但是里面的相机需要单独购买，也可以按年订阅138一年，我平时都是单独购买喜欢的相机，这样有更大的选择空间，135Ti那款相机甚是喜欢。&nbsp; </p> \n   <p> <strong>b，一闪</strong> </p> \n   <p> 一闪和NOMO是兄弟App，二者是一家公司开发的，NOMO更偏重于胶片拍照，而一闪则更侧重于<strong>视频的拍摄及剪辑</strong>，当然还可以利用它来拍一些照片，里面有很多有质感的滤镜，正适合手机拍照。 </p> \n   <p> 平时我都是拿它来剪辑手机视频，不用开电脑不用打开电脑上大型的剪辑软件，重在方便。很多Vloger用它来拍和<strong>剪辑Vlog</strong>，感兴趣的可以下载下来看看自己喜不喜欢。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/f16eba9a1789cc8b5366b253d89d7ba0.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 一闪编辑视频 </p> \n   <p> <strong>c，&nbsp; VSCO</strong> </p> \n   <p> VSCO是我个人非常喜欢的一款手机摄影与后期App，软件里面也有很多<strong>预设调色</strong>，它和Snapseed是我最常用的手机后期App，有时候我会拿VSCO来拍几张照片发朋友圈，App内还有许多作品可以欣赏。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/02dcd1d922732215b8869f97722692ce.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n    <p> VSCO </p> \n   </div> \n   <p> <strong>2，后期</strong> </p> \n   <p> <strong>a，Snapseed</strong> </p> \n   <p> 毫不夸张地说，Snapseed在移动设备上的地位犹如PS在PC上的地位，几乎每一位手机摄影玩家的手机中都有一个Snapseed，网上有许多文章是关于如何使用Snapseed的，有兴趣的可以搜索关键词学习学习。 </p> \n   <p> 我手机摄影照片80%都是出自Snapseed，虽然和PC上专业修图软件相比还是有不小的差距，但是它胜在容易上手和使用方便，在Snapseed里你可以调整图片的方方面面，比如拉个曲线、调个白平衡、加个滤镜美个颜，我关于对后期一些名词的认识很多都是在Snapseed上学到的。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/db201fc86cfb34592cabfd48517b2d1c.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> Snapseed </p> \n   <p> 不得不说谷歌的软件就是好用，谷歌相机这款软件也强烈推荐，如果你的手机是安卓手机同时拍照素质比较差，那么推荐你下载“<strong>谷歌相机</strong>”这款软件，你会回来感谢我的。 </p> \n   <p> <strong>b，VSCO</strong> </p> \n   <p> 用VSCO后期处理图片比较方便，我大多数情况下都是直接使用预设，只不过免费的预设有限，有时候喜欢的预设需要开通订阅，我没有订阅，因为还可以手动啊，手动不行的话还有Lr啊。 </p> \n   <p> VSCO整体给我的感觉是一款很文艺的软件，文艺青年适合用它来拍照后期发朋友圈，是一款不可多得的软件。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/c50c6ecc59bf650decf8c8121a2d2a38.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/01f4f5e776b15bed4044b38dd6a28f1c.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> <strong>c，&nbsp; Picsew</strong> </p> \n   <p> Picsew是一款集图片拼接、带壳截图、加水印、打马赛克于一体的软件，我常用它来进行拼接图片和实现苹果手机的<strong>带壳截图</strong>，虽然没有什么很让人惊艳的功能但是很实用，来编辑文章配图还是绰绰有余的。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/4b2f73357e0a03aa864b592385de0cc5.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 带壳截图 </p> \n   <p> <strong>d,&nbsp; 圈点</strong> </p> \n   <p> 这款软件我主要用来标记图片，用一个红色的<strong>小箭头</strong>使重点突出，它还有其它的功能比如给图片加字等。 </p> \n   <div> \n    <p> <img src=\"http://sinastorage.com/storage.miaosha.sina.com.cn/product/20190501/7000748ca01a9ed652da3a7f13a6d5a3.jpeg\" alt=\"我是如何在手机上摄影的—手机摄影心得分享_新浪众测\"> </p> \n   </div> \n   <p> 小箭头标注 </p> \n   <p> <strong>e， 美图秀秀</strong> </p> \n   <p> 美图秀秀不是只可以美颜，我拿它来做后期，美图秀秀里有许多贴纸和文字样式，用它来给<strong>图片</strong>加字，有许多的样式可以选择。 </p> \n   <p> 以上就是我今天分享的我在手机上摄影和后期的的心得体会的全部内容，没有什么技术含量，和大佬们比起来还差得远，但是人总是在不断学习的，摄影和后期是通过慢慢摸索慢慢<strong>提高自己的审美</strong>来提高出片质量的，所以要一直努力。 </p> \n   <p> 在手机上能做到上述这些是过去不敢想的，科技发展飞速，而像华为这样的手机厂商在手机影像方面的突破带给消费者是直接的受益，即使现阶段手机摄影和专业相机还是有很大的差距，手机摄影这一块蛋糕是每个手机厂商都想吃的，未来可期！ </p> \n   <p> 谢谢捧场！喜欢的朋友可以点赞打赏评论一条龙哦！ </p> \n  </div> \n </div> \n <div> \n  <div>\n    （声明: 本文著作权归作者本人和新浪众测共同所有，未经许可不得转载。本文仅代表作者观点，不代表新浪众测立场。） \n  </div> \n  <div> \n   <div> \n    <div> \n     <a rel=\"nofollow\"></a> \n     <a rel=\"nofollow\">57</a> \n     <a href=\"http://localhost:8081/#viewComment\" rel=\"nofollow\"><span>43</span></a> \n     <div> \n      <a href=\"http://service.weibo.com/share/share.php?url=http%3A%2F%2Fzhongce.sina.com.cn%2Farticle%2Fview%2F17664%2F&amp;title=%E6%88%91%E6%98%AF%E5%A6%82%E4%BD%95%E5%9C%A8%E6%89%8B%E6%9C%BA%E4%B8%8A%E6%91%84%E5%BD%B1%E7%9A%84%EF%BC%9A%E6%89%8B%E6%9C%BA%E6%91%84%E5%BD%B1%E5%BF%83%E5%BE%97%E5%88%86%E4%BA%AB%20(%E5%88%86%E4%BA%AB%E8%87%AA%40%E6%96%B0%E6%B5%AA%E4%BC%97%E6%B5%8B)&amp;pic=http%3A%2F%2Fsinastorage.com%2Fstorage.miaosha.sina.com.cn%2Fproduct%2F20190501%2F0bee89467e97a509d26f00e8a21c7e6f.jpeg\" target=\"_blank\" rel=\"nofollow\"></a> \n      <a rel=\"nofollow\"></a> \n      <a href=\"http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http%3A%2F%2Fzhongce.sina.com.cn%2Farticle%2Fview%2F17664%2F&amp;title=%E6%88%91%E6%98%AF%E5%A6%82%E4%BD%95%E5%9C%A8%E6%89%8B%E6%9C%BA%E4%B8%8A%E6%91%84%E5%BD%B1%E7%9A%84%EF%BC%9A%E6%89%8B%E6%9C%BA%E6%91%84%E5%BD%B1%E5%BF%83%E5%BE%97%E5%88%86%E4%BA%AB%20(%E5%88%86%E4%BA%AB%E8%87%AA%40%E6%96%B0%E6%B5%AA%E4%BC%97%E6%B5%8B)&amp;desc=&amp;summary=&amp;pics=http%3A%2F%2Fsinastorage.com%2Fstorage.miaosha.sina.com.cn%2Fproduct%2F20190501%2F0bee89467e97a509d26f00e8a21c7e6f.jpeg\" target=\"_blank\" rel=\"nofollow\"></a> \n     </div> \n    </div> \n   </div> \n  </div> \n  <div> \n   <div> \n    <p> 一直申请不到试用资格？ </p> \n    <p> 投稿优质的原创内容会增加试用机会哦~ </p> \n   </div> \n   <div> \n    <a href=\"http://localhost:8081/article/create\" target=\"_blank\" rel=\"nofollow\">去投稿</a> \n   </div> \n  </div> \n  <div> \n   <div> \n    <div> \n     <div> \n      <span><em><a href=\"http://comment5.news.sina.com.cn/comment/skin/default.html?channel=kj&amp;newsid=zhongce_ugc_article_17664\" rel=\"nofollow\">43</a></em>条评论<span>|</span><em><a href=\"http://comment5.news.sina.com.cn/comment/skin/default.html?channel=kj&amp;newsid=zhongce_ugc_article_17664\" rel=\"nofollow\">43</a></em>人参与</span> \n      <span>我有话说</span> \n     </div> \n     <div> \n      <div> \n       <div> \n       </div> \n       <span></span> \n      </div> \n      <div> \n       <div> \n        <a href=\"http://weibo.com/\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://img.t.sinajs.cn/t5/style/images/face/male_180.png\" alt=\"\"></a> \n       </div> \n       <span></span> \n       <a rel=\"nofollow\">退出</a> \n      </div> \n      <div> \n       <div> \n        <a href=\"http://weibo.com/\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://img.t.sinajs.cn/t5/style/images/face/male_180.png\"></a> \n       </div> \n      </div> \n     </div> \n     <div> \n      <div> \n       <a rel=\"nofollow\">表情</a> \n      </div> \n      <div> \n       <i></i> \n       <span>分享到微博</span> \n      </div> \n      <a rel=\"nofollow\">发布</a> \n      <div> \n       <a rel=\"nofollow\">登录</a>| \n       <a target=\"_blank\" href=\"https://login.sina.com.cn/signup/signup.php\" rel=\"nofollow\">注册</a> \n      </div> \n     </div> \n    </div> \n    <div> \n     <div> \n      <div> \n       <span>最热评论</span> \n       <a rel=\"nofollow\">刷新</a> \n      </div> \n      <div> \n       <a rel=\"nofollow\"></a> \n      </div> \n      <div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/7041502181\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://n.sinaimg.cn/sinanews/eb9bf575/20190108/TouXiang120.png\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/7041502181\" rel=\"nofollow\">用户7041502181</a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           真好 \n         </div> \n         <div> \n          <span>2019-6-6 10:16</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CF8778C-A0D002C-1A3B4CBE5-880-8FD\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/5821093877\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva3.sinaimg.cn/crop.0.0.960.960.50/006lWIqVjw8eznu7azoxjj30qo0qodhk.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5821093877\" rel=\"nofollow\">陌路5821093877</a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           好物分享谢谢分享 \n         </div> \n         <div> \n          <span>2019-5-7 07:56</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CD0C9BC-A0D20D2-15AF6D7F5-880-8BA\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/1147896091\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva3.sinaimg.cn/crop.0.3.560.560.50/446b811bjw8f6nqqdse7hj20xc0ncdii.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1147896091\" rel=\"nofollow\">杉木不是大叔<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           学习一下 \n         </div> \n         <div> \n          <span>2019-5-6 10:36</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCF9DA8-A0D20D2-446B811B-880-8E1\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/5652640552\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax2.sinaimg.cn/crop.0.0.664.664.50/006axU1Oly8fwrk05d93fj30ig0igabu.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5652640552\" rel=\"nofollow\">PhysxVIP</a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           不错 \n         </div> \n         <div> \n          <span>2019-5-5 23:37</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCF0324-A0D20D0-150EC7328-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/5303662998\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.996.996.50/005MVD1Aly8fyio94m7jzj30ro0romyu.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5303662998\" rel=\"nofollow\">极客洋洋STAR<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           真棒，另外多拍多练习是王道 \n         </div> \n         <div> \n          <span>2019-5-5 14:19</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE8077-A47309C-13C1F7996-880-857\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/1615278425\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.996.996.50/60473159ly8fxdglteg7vj20ro0rotai.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1615278425\" rel=\"nofollow\">霹雳旋风腿</a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           不错 \n         </div> \n         <div> \n          <span>2019-5-5 12:39</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE68E5-A0D20D0-60473159-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/3672652854\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.320.140.800.800.50/dae83c36ly8fy9ldlvi0gj21400u016e.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/3672652854\" rel=\"nofollow\">缘与博</a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           不错 \n         </div> \n         <div> \n          <span>2019-5-5 12:17</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE63E7-A0D20D0-DAE83C36-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/2352016701\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://n.sinaimg.cn/sinanews/eb9bf575/20190108/TouXiang120.png\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/2352016701\" rel=\"nofollow\">ak898988</a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           写得很好，值得学习 \n         </div> \n         <div> \n          <span>2019-5-5 10:27</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE49F9-A47309B-8C30ED3D-880-893\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/2093297141\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.512.512.50/7cc52df5ly8fp6m5b4k4lj20e80e8q3o.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/2093297141\" rel=\"nofollow\">吖羞歪<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           不错 \n         </div> \n         <div> \n          <span>2019-5-5 09:22</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE3AE9-A0D20D0-7CC52DF5-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <a href=\"http://weibo.com/u/5027011984\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax4.sinaimg.cn/crop.42.1.635.635.50/005ucPssly8fvdzhtvqcnj30jd0hpaby.jpg\"></a> \n        </div> \n        <div> \n         <div> \n          <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5027011984\" rel=\"nofollow\">莫名的醉意<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n          <span>[北京海淀]</span> \n         </div> \n         <div>\n           已阅 \n         </div> \n         <div> \n          <span>2019-5-5 07:47</span> \n          <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE2494-A290E90-12BA21D90-880-97F\" target=\"_blank\" rel=\"nofollow\">举报</a> \n          <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n         </div> \n        </div> \n       </div> \n      </div> \n     </div> \n     <div> \n      <div> \n       <span>最新评论</span> \n       <a rel=\"nofollow\">刷新</a> \n      </div> \n      <div> \n       <a rel=\"nofollow\"></a> \n      </div> \n      <div> \n       <div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/7041502181\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://n.sinaimg.cn/sinanews/eb9bf575/20190108/TouXiang120.png\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/7041502181\" rel=\"nofollow\">用户7041502181</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            真好 \n          </div> \n          <div> \n           <span>2019-6-6 10:16</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CF8778C-A0D002C-1A3B4CBE5-880-8FD\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/5821093877\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva3.sinaimg.cn/crop.0.0.960.960.50/006lWIqVjw8eznu7azoxjj30qo0qodhk.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5821093877\" rel=\"nofollow\">陌路5821093877</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            好物分享谢谢分享 \n          </div> \n          <div> \n           <span>2019-5-7 07:56</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CD0C9BC-A0D20D2-15AF6D7F5-880-8BA\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1147896091\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva3.sinaimg.cn/crop.0.3.560.560.50/446b811bjw8f6nqqdse7hj20xc0ncdii.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1147896091\" rel=\"nofollow\">杉木不是大叔<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            学习一下 \n          </div> \n          <div> \n           <span>2019-5-6 10:36</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCF9DA8-A0D20D2-446B811B-880-8E1\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/5652640552\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax2.sinaimg.cn/crop.0.0.664.664.50/006axU1Oly8fwrk05d93fj30ig0igabu.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5652640552\" rel=\"nofollow\">PhysxVIP</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            不错 \n          </div> \n          <div> \n           <span>2019-5-5 23:37</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCF0324-A0D20D0-150EC7328-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/5303662998\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.996.996.50/005MVD1Aly8fyio94m7jzj30ro0romyu.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5303662998\" rel=\"nofollow\">极客洋洋STAR<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            真棒，另外多拍多练习是王道 \n          </div> \n          <div> \n           <span>2019-5-5 14:19</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE8077-A47309C-13C1F7996-880-857\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1615278425\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.996.996.50/60473159ly8fxdglteg7vj20ro0rotai.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1615278425\" rel=\"nofollow\">霹雳旋风腿</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            不错 \n          </div> \n          <div> \n           <span>2019-5-5 12:39</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE68E5-A0D20D0-60473159-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/3672652854\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.320.140.800.800.50/dae83c36ly8fy9ldlvi0gj21400u016e.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/3672652854\" rel=\"nofollow\">缘与博</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            不错 \n          </div> \n          <div> \n           <span>2019-5-5 12:17</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE63E7-A0D20D0-DAE83C36-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/2352016701\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://n.sinaimg.cn/sinanews/eb9bf575/20190108/TouXiang120.png\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/2352016701\" rel=\"nofollow\">ak898988</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            写得很好，值得学习 \n          </div> \n          <div> \n           <span>2019-5-5 10:27</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE49F9-A47309B-8C30ED3D-880-893\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/2093297141\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.512.512.50/7cc52df5ly8fp6m5b4k4lj20e80e8q3o.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/2093297141\" rel=\"nofollow\">吖羞歪<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            不错 \n          </div> \n          <div> \n           <span>2019-5-5 09:22</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE3AE9-A0D20D0-7CC52DF5-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/5027011984\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax4.sinaimg.cn/crop.42.1.635.635.50/005ucPssly8fvdzhtvqcnj30jd0hpaby.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5027011984\" rel=\"nofollow\">莫名的醉意<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            已阅 \n          </div> \n          <div> \n           <span>2019-5-5 07:47</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE2494-A290E90-12BA21D90-880-97F\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n       </div> \n       <div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1909791142\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax1.sinaimg.cn/crop.0.0.1010.1010.50/71d519a6ly8fwmijd6xobj20s20s2mz3.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1909791142\" rel=\"nofollow\">Godlove文章</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            楼主真棒 \n          </div> \n          <div> \n           <span>2019-5-5 07:32</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCE2124-A290FC6-71D519A6-880-7DC\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1271794052\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.156.795.795.50/4bce0984ly1fde4kxtv2mj20m80towjv.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1271794052\" rel=\"nofollow\">我的招财猫猫</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            好产品，值得分享 \n          </div> \n          <div> \n           <span>2019-5-4 23:00</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCDA91D-A0D2025-4BCE0984-880-86E\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/5184942777\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax3.sinaimg.cn/crop.0.0.1002.1002.50/005ETutjly8fu0e3rc69wj30ru0rudgc.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5184942777\" rel=\"nofollow\">马特搞机<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            学到了 \n          </div> \n          <div> \n           <span>2019-5-4 21:50</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCD9894-A290ED7-1350BF2B9-880-7F8\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1149053232\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva4.sinaimg.cn/crop.0.0.180.180.50/447d2930jw1e8qgp5bmzyj2050050aa8.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1149053232\" rel=\"nofollow\">涧亭<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            学习 \n          </div> \n          <div> \n           <span>2019-5-4 21:12</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCD8FDB-A0D20D2-447D2930-880-8F0\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/5969761755\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://n.sinaimg.cn/sinanews/eb9bf575/20190108/TouXiang120.png\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/5969761755\" rel=\"nofollow\">江苏美儿</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            不错 \n          </div> \n          <div> \n           <span>2019-5-4 18:42</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCD6C84-A290E90-163D355DB-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/6222878985\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax1.sinaimg.cn/crop.0.0.996.996.50/006N8z5Tly8ff6a9kkackj30ro0rotda.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/6222878985\" rel=\"nofollow\">快乐努力吧小胖1994</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            学习了！ \n          </div> \n          <div> \n           <span>2019-5-4 17:26</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCD5ABC-A290ED7-172E99909-880-81C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/3226519113\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva4.sinaimg.cn/crop.0.1.510.510.50/c050c649jw8f8h9tcklobj20e60e80tb.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/3226519113\" rel=\"nofollow\">渐行渐远渐无书001</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            赞 \n          </div> \n          <div> \n           <span>2019-5-4 08:33</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCCDDE3-A0D2025-C050C649-880-8D4\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1143905975\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva2.sinaimg.cn/crop.0.0.1242.1242.50/442e9eb7jw8epv6dhxv1lj20yi0yj44g.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1143905975\" rel=\"nofollow\">268l1<img src=\"http://www.sinaimg.cn/dy/deco/2013/0608/vy.png\" title=\"新浪个人认证\"></a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            厉害了 \n          </div> \n          <div> \n           <span>2019-5-4 08:28</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCCDC91-A4F70A7-442E9EB7-880-80A\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1873632372\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tva4.sinaimg.cn/crop.0.0.996.996.50/6fad5c74jw8f8u8cg8tp6j20ro0romyr.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1873632372\" rel=\"nofollow\">爱搞数码</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            期待啊！ \n          </div> \n          <div> \n           <span>2019-5-4 06:19</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCCBE5D-A290ED7-6FAD5C74-880-804\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n        <div> \n         <div> \n          <a href=\"http://weibo.com/u/1876100631\" target=\"_blank\" rel=\"nofollow\"><img src=\"http://tvax2.sinaimg.cn/crop.0.0.751.751.50/6fd30617ly8fx7w9yoggjj20kv0kvq47.jpg\"></a> \n         </div> \n         <div> \n          <div> \n           <span><span><a target=\"_blank\" href=\"http://weibo.com/u/1876100631\" rel=\"nofollow\">去往华尔街的小伙</a></span></span> \n           <span>[北京海淀]</span> \n          </div> \n          <div>\n            不错 \n          </div> \n          <div> \n           <span>2019-5-4 02:47</span> \n           <a href=\"http://comment5.news.sina.com.cn/comment/skin/feedback_jb.html?mid=5CCC8CC7-A290FC6-6FD30617-880-89C\" target=\"_blank\" rel=\"nofollow\">举报</a> \n           <span><a rel=\"nofollow\"><span>赞<em></em></span></a><a rel=\"nofollow\">回复</a></span> \n          </div> \n         </div> \n        </div> \n       </div> \n      </div> \n      <div> \n       <a target=\"_blank\" href=\"http://comment5.news.sina.com.cn/comment/skin/default.html?channel=kj&amp;newsid=zhongce_ugc_article_17664&amp;group=0\" rel=\"nofollow\"><span>还有<em>33</em>条评论，</span>查看更多精彩评论&gt;&gt;</a> \n      </div> \n     </div> \n     <div> \n      <a rel=\"nofollow\"></a> \n     </div> \n    </div> \n   </div> \n  </div> \n </div> \n</div>', '0:0:0:0:0:0:0:1', '', '2021-04-03 14:57:54', '2021-04-03 14:57:54', '35515298054768', '手机摄影分享', 'tim', '2', null, '20', '我是如何在手机上摄影的：手机摄影心得分享     极客的笔   2019-05-03 09:10       从去年的11月到现在，已依偎新浪众测的怀抱里有一年了，在这一年中学到了很多，平时喜欢看他人的原创，可以学到许多东西，我在这一年中也写了几篇文章其中有热度很高的，也有无人问津的，文章的配图基本上都是用手机拍摄和后期，也算小有心得吧。所以今天来分享下我对..', '0', null);
INSERT INTO `topic` VALUES ('18', '', '0', '<p> 大家好，最近做了一个新的视频，你们看一下我的作品，分享一下，哈哈<img src=\"common/default/pc/js/kindeditor/plugins/emoticons/twemoji/3.svg\" border=\"0\" alt=\"\" width=\"32px\" height=\"32px\"><img src=\"common/default/pc/js/kindeditor/plugins/emoticons/twemoji/3.svg\" border=\"0\" alt=\"\" width=\"32px\" height=\"32px\"> </p> \n<p> <br> </p>', '0:0:0:0:0:0:0:1', '', '2021-04-08 23:01:35', '2021-04-08 23:01:35', '32317742826762', '分享一部专业单反摄影作品', 'tom', '0', null, '20', '大家好，最近做了一个新的视频，你们看一下我的作品，分享一下，哈哈..', '0', null);
INSERT INTO `topic` VALUES ('19', '', '1', '<p> 分享一部专业单反摄影作品分享一部专业单反摄影作品分享一部专业单反摄影作品分享一部专业单反摄影作品大家不要笑话我啊<img src=\"common/default/pc/js/kindeditor/plugins/emoticons/twemoji/3.svg\" border=\"0\" alt=\"\" width=\"32px\" height=\"32px\"> </p> \n<p> \n <video src=\"file/topic/2021-04-08/media/2421afe3a7624b33a3e33cd90d997e7eb2.mp4\" width=\"550\" height=\"400\" controls=\"controls\"></video> </p>', '0:0:0:0:0:0:0:1', '', '2021-04-08 23:05:17', '2021-04-08 23:02:27', '32317742826762', '分享一部专业单反摄影作品', 'tom', '2', null, '20', '分享一部专业单反摄影作品分享一部专业单反摄影作品分享一部专业单反摄影作品分享一部专业单反摄影作品大家不要笑话我啊..', '0', null);

-- ----------------------------
-- Table structure for `topicfavorite_0`
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_0`;
CREATE TABLE `topicfavorite_0` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicFavorite_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicfavorite_0
-- ----------------------------
INSERT INTO `topicfavorite_0` VALUES ('16_3', '2021-04-03 14:51:25', 'tom', '16', 'tim');

-- ----------------------------
-- Table structure for `topicfavorite_1`
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_1`;
CREATE TABLE `topicfavorite_1` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicFavorite_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicfavorite_1
-- ----------------------------
INSERT INTO `topicfavorite_1` VALUES ('17_2', '2021-04-03 15:00:44', 'tim', '17', 'tom');
INSERT INTO `topicfavorite_1` VALUES ('17_3', '2021-04-09 08:45:03', 'tim', '17', 'tim');

-- ----------------------------
-- Table structure for `topicfavorite_2`
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_2`;
CREATE TABLE `topicfavorite_2` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicFavorite_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicfavorite_2
-- ----------------------------
INSERT INTO `topicfavorite_2` VALUES ('14_2', '2021-03-31 23:41:39', 'tom', '14', 'tom');

-- ----------------------------
-- Table structure for `topicfavorite_3`
-- ----------------------------
DROP TABLE IF EXISTS `topicfavorite_3`;
CREATE TABLE `topicfavorite_3` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicFavorite_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicfavorite_3
-- ----------------------------
INSERT INTO `topicfavorite_3` VALUES ('19_3', '2021-04-09 08:47:22', 'tom', '19', 'tim');

-- ----------------------------
-- Table structure for `topicindex`
-- ----------------------------
DROP TABLE IF EXISTS `topicindex`;
CREATE TABLE `topicindex` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataId` varchar(32) DEFAULT NULL,
  `indexState` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicindex
-- ----------------------------

-- ----------------------------
-- Table structure for `topiclike_0`
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_0`;
CREATE TABLE `topiclike_0` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicLike_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topiclike_0
-- ----------------------------
INSERT INTO `topiclike_0` VALUES ('16_3', '2021-04-03 14:51:27', 'tom', '16', 'tim');

-- ----------------------------
-- Table structure for `topiclike_1`
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_1`;
CREATE TABLE `topiclike_1` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicLike_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topiclike_1
-- ----------------------------
INSERT INTO `topiclike_1` VALUES ('17_2', '2021-04-03 15:00:46', 'tim', '17', 'tom');
INSERT INTO `topiclike_1` VALUES ('17_3', '2021-04-09 08:45:05', 'tim', '17', 'tim');

-- ----------------------------
-- Table structure for `topiclike_2`
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_2`;
CREATE TABLE `topiclike_2` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicLike_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topiclike_2
-- ----------------------------
INSERT INTO `topiclike_2` VALUES ('14_2', '2021-03-31 23:41:38', 'tom', '14', 'tom');

-- ----------------------------
-- Table structure for `topiclike_3`
-- ----------------------------
DROP TABLE IF EXISTS `topiclike_3`;
CREATE TABLE `topiclike_3` (
  `id` varchar(40) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicLike_1_idx` (`topicId`,`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topiclike_3
-- ----------------------------
INSERT INTO `topiclike_3` VALUES ('11_3', '2021-03-20 18:19:26', 'tom', '11', 'tim');
INSERT INTO `topiclike_3` VALUES ('19_3', '2021-04-08 23:04:08', 'tom', '19', 'tim');

-- ----------------------------
-- Table structure for `topicunhideplatformshare`
-- ----------------------------
DROP TABLE IF EXISTS `topicunhideplatformshare`;
CREATE TABLE `topicunhideplatformshare` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `platformShareProportion` int DEFAULT NULL,
  `postUserName` varchar(80) DEFAULT NULL,
  `shareAmount` decimal(14,4) NOT NULL,
  `staff` bit(1) NOT NULL,
  `topicId` bigint DEFAULT NULL,
  `totalAmount` decimal(12,2) NOT NULL,
  `unlockTime` datetime DEFAULT NULL,
  `unlockUserName` varchar(30) DEFAULT NULL,
  `postUserShareRunningNumber` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicUnhidePlatformShare_1_idx` (`unlockTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicunhideplatformshare
-- ----------------------------

-- ----------------------------
-- Table structure for `topicunhide_0`
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_0`;
CREATE TABLE `topicunhide_0` (
  `id` varchar(43) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `cancelTime` datetime DEFAULT NULL,
  `hideTagType` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicUnhide_1_idx` (`topicId`,`cancelTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicunhide_0
-- ----------------------------

-- ----------------------------
-- Table structure for `topicunhide_1`
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_1`;
CREATE TABLE `topicunhide_1` (
  `id` varchar(43) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `cancelTime` datetime DEFAULT NULL,
  `hideTagType` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicunhide_1_idx` (`topicId`,`cancelTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicunhide_1
-- ----------------------------

-- ----------------------------
-- Table structure for `topicunhide_2`
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_2`;
CREATE TABLE `topicunhide_2` (
  `id` varchar(43) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `cancelTime` datetime DEFAULT NULL,
  `hideTagType` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicunhide_1_idx` (`topicId`,`cancelTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicunhide_2
-- ----------------------------

-- ----------------------------
-- Table structure for `topicunhide_3`
-- ----------------------------
DROP TABLE IF EXISTS `topicunhide_3`;
CREATE TABLE `topicunhide_3` (
  `id` varchar(43) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `cancelTime` datetime DEFAULT NULL,
  `hideTagType` int DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `postUserName` varchar(30) DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topicunhide_1_idx` (`topicId`,`cancelTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of topicunhide_3
-- ----------------------------

-- ----------------------------
-- Table structure for `upgradesystem`
-- ----------------------------
DROP TABLE IF EXISTS `upgradesystem`;
CREATE TABLE `upgradesystem` (
  `id` varchar(32) NOT NULL,
  `deleteFilePath` longtext,
  `explanation` longtext,
  `interruptStatus` int DEFAULT NULL,
  `oldSystemVersion` varchar(100) DEFAULT NULL,
  `runningStatus` int DEFAULT NULL,
  `sort` bigint DEFAULT NULL,
  `updatePackageFirstDirectory` varchar(100) DEFAULT NULL,
  `updatePackageName` varchar(100) DEFAULT NULL,
  `updatePackageTime` datetime DEFAULT NULL,
  `updatePackageVersion` varchar(100) DEFAULT NULL,
  `upgradeLog` longtext,
  `upgradeTime` datetime DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of upgradesystem
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answer` varchar(80) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `password` varchar(160) DEFAULT NULL,
  `point` bigint DEFAULT NULL,
  `realNameAuthentication` bit(1) NOT NULL,
  `registrationDate` datetime DEFAULT NULL,
  `remarks` longtext,
  `salt` varchar(80) DEFAULT NULL,
  `state` int DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `userVersion` int DEFAULT NULL,
  `securityDigest` bigint DEFAULT NULL,
  `avatarName` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `allowUserDynamic` bit(1) DEFAULT NULL,
  `deposit` decimal(14,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4bakctviobmdk6ddh2nwg08c2` (`userName`),
  KEY `user_idx` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', '49dc52e6bf2abe5ef6e2bb5b0f1ee2d765b922ae6cc8b95d39dc06c21c848f8c', '15532946938@163.com', '密码是123456', null, '51725b33008b342ecfab026d18b40ed76fd7bbf736531c5360a969bce2de5737', '250', '', '2020-03-28 23:42:15', '', '29d7327c7c9c489f8fc2a27b95a25f68', '1', 'tom', '42', '1585410134872', null, null, '', '899.0000');
INSERT INTO `user` VALUES ('3', '49dc52e6bf2abe5ef6e2bb5b0f1ee2d765b922ae6cc8b95d39dc06c21c848f8c', '15532946937@163.com', '123456', null, '4d9687c2c592aa0e97aea1828d9f160fca303719bd4192517110d0a8f58b8355', '84', '', '2020-03-29 00:41:35', '', '2543134e7619411885bb4922f864519a', '1', 'tim', '20', '1585413694962', null, null, '', '969.0000');
INSERT INTO `user` VALUES ('4', '49dc52e6bf2abe5ef6e2bb5b0f1ee2d765b922ae6cc8b95d39dc06c21c848f8c', '15532946937@163.com', '密码是？？？6', null, 'cdf035135e7a809f5d0160672a4155f32d667ff03af921756a125a8784b9bd32', '10', '', '2020-03-29 14:35:03', '', '95e30c18e1ab4f7ca2505c261a841915', '1', 'xiaohong', '2', '1585463702641', null, null, '', '1000.0000');

-- ----------------------------
-- Table structure for `usercustom`
-- ----------------------------
DROP TABLE IF EXISTS `usercustom`;
CREATE TABLE `usercustom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chooseType` int DEFAULT NULL,
  `cols` int DEFAULT NULL,
  `fieldFilter` int DEFAULT NULL,
  `maxlength` int DEFAULT NULL,
  `multiple` bit(1) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `regular` longtext,
  `required` bit(1) NOT NULL,
  `rows` int DEFAULT NULL,
  `search` bit(1) NOT NULL,
  `selete_size` int DEFAULT NULL,
  `size` int DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `tip` varchar(250) DEFAULT NULL,
  `value` longtext,
  `visible` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of usercustom
-- ----------------------------

-- ----------------------------
-- Table structure for `userdynamic_0`
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_0`;
CREATE TABLE `userdynamic_0` (
  `id` varchar(36) NOT NULL,
  `commentId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `replyId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `quoteCommentId` bigint DEFAULT NULL,
  `answerId` bigint DEFAULT NULL,
  `answerReplyId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `functionIdGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userDynamic_1_idx` (`userName`,`status`,`postTime`),
  KEY `userDynamic_5_idx` (`functionIdGroup`,`userName`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userdynamic_0
-- ----------------------------

-- ----------------------------
-- Table structure for `userdynamic_1`
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_1`;
CREATE TABLE `userdynamic_1` (
  `id` varchar(36) NOT NULL,
  `commentId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `replyId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `quoteCommentId` bigint DEFAULT NULL,
  `answerId` bigint DEFAULT NULL,
  `answerReplyId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `functionIdGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userDynamic_1_idx` (`userName`,`status`,`postTime`),
  KEY `userDynamic_5_idx` (`functionIdGroup`,`userName`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userdynamic_1
-- ----------------------------

-- ----------------------------
-- Table structure for `userdynamic_2`
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_2`;
CREATE TABLE `userdynamic_2` (
  `id` varchar(36) NOT NULL,
  `commentId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `replyId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `quoteCommentId` bigint DEFAULT NULL,
  `answerId` bigint DEFAULT NULL,
  `answerReplyId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `functionIdGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userDynamic_1_idx` (`userName`,`status`,`postTime`),
  KEY `userDynamic_5_idx` (`functionIdGroup`,`userName`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userdynamic_2
-- ----------------------------
INSERT INTO `userdynamic_2` VALUES ('0fcde3d057cc402bac849fda0705422d0002', '-1', '100', '2021-04-03 14:46:59', '-1', '20', '16', 'tom', '-1', '-1', '-1', '-1', ',16,');
INSERT INTO `userdynamic_2` VALUES ('1098ed25568b450a8551a9b64b5177fe0002', '-1', '100', '2021-04-01 00:01:56', '-1', '110', '15', 'tom', '-1', '-1', '-1', '-1', ',15,');
INSERT INTO `userdynamic_2` VALUES ('1502445ffb9c49c4853f0e563542ff930002', '-1', '100', '2021-03-20 17:24:33', '-1', '120', '6', 'tom', '-1', '-1', '-1', '-1', ',6,');
INSERT INTO `userdynamic_2` VALUES ('22f68e3e94744881a6b1036f9331ec060002', '-1', '100', '2021-03-20 18:03:07', '-1', '120', '9', 'tom', '-1', '-1', '-1', '-1', ',9,');
INSERT INTO `userdynamic_2` VALUES ('2f0029bbe3284cc18bf9ea7284105cbb0002', '-1', '100', '2021-03-20 17:42:13', '-1', '120', '8', 'tom', '-1', '-1', '-1', '-1', ',8,');
INSERT INTO `userdynamic_2` VALUES ('30536d152cc6471a856252fd5d6c65010002', '-1', '600', '2021-02-24 14:42:07', '-1', '20', '-1', 'tom', '-1', '5', '-1', '6', ',6,5,');
INSERT INTO `userdynamic_2` VALUES ('3ca897ce87a4407ca17c345f215193d50002', '-1', '600', '2021-02-24 16:27:19', '-1', '20', '-1', 'tom', '-1', '7', '-1', '7', ',7,7,');
INSERT INTO `userdynamic_2` VALUES ('41b03c5f21f346389f6357e9808e0dce0002', '-1', '100', '2021-03-20 18:13:42', '-1', '120', '10', 'tom', '-1', '-1', '-1', '-1', ',10,');
INSERT INTO `userdynamic_2` VALUES ('4f3c7307ed3741bebd92a2beec1aa42b0002', '8', '400', '2021-04-08 23:05:17', '4', '20', '19', 'tom', '-1', '-1', '-1', '-1', ',19,8,4,');
INSERT INTO `userdynamic_2` VALUES ('53309b19aa88411d934577b0851d94510002', '5', '200', '2021-03-31 23:41:50', '-1', '20', '14', 'tom', '-1', '-1', '-1', '-1', ',14,5,');
INSERT INTO `userdynamic_2` VALUES ('72af1f16ae994e2c8db410d4231302fe0002', '-1', '100', '2021-03-20 18:16:10', '-1', '120', '11', 'tom', '-1', '-1', '-1', '-1', ',11,');
INSERT INTO `userdynamic_2` VALUES ('7360df4c104349f8a7b7252920e9b7da0002', '3', '200', '2021-03-20 18:14:39', '-1', '20', '10', 'tom', '-1', '-1', '-1', '-1', ',10,3,');
INSERT INTO `userdynamic_2` VALUES ('831e769a497b421289d594c1afdf78450002', '-1', '100', '2021-03-31 23:35:21', '-1', '110', '13', 'tom', '-1', '-1', '-1', '-1', ',13,');
INSERT INTO `userdynamic_2` VALUES ('9af2fa3d6fa84fa7ab0f25cb7a3f9b870002', '-1', '100', '2021-03-31 23:40:25', '-1', '120', '14', 'tom', '-1', '-1', '-1', '-1', ',14,');
INSERT INTO `userdynamic_2` VALUES ('a6dd3a2404a04592923d8a8da1b82d4b0002', '-1', '100', '2021-03-20 17:25:40', '-1', '120', '7', 'tom', '-1', '-1', '-1', '-1', ',7,');
INSERT INTO `userdynamic_2` VALUES ('ae816a933e1a4901b3bdeee35808681f0002', '-1', '100', '2021-04-08 23:02:27', '-1', '20', '19', 'tom', '-1', '-1', '-1', '-1', ',19,');
INSERT INTO `userdynamic_2` VALUES ('b35a956840d4426e9ace43559a0170c50002', '-1', '100', '2021-04-08 23:01:35', '-1', '20', '18', 'tom', '-1', '-1', '-1', '-1', ',18,');
INSERT INTO `userdynamic_2` VALUES ('b7835857b4034b6bb29ba185c88565120002', '-1', '500', '2021-02-20 12:05:01', '-1', '120', '-1', 'tom', '-1', '-1', '-1', '6', ',6,');
INSERT INTO `userdynamic_2` VALUES ('bb95148b656743448c0a5b244ac37f2c0002', '7', '400', '2021-04-03 14:59:50', '3', '20', '16', 'tom', '-1', '-1', '-1', '-1', ',16,7,3,');
INSERT INTO `userdynamic_2` VALUES ('c88bd332c0a2498d9e88b2f2ffe9a7940002', '-1', '500', '2021-02-24 14:40:44', '-1', '120', '-1', 'tom', '-1', '-1', '-1', '7', ',7,');
INSERT INTO `userdynamic_2` VALUES ('de15e7d28f9f45dc877c03fb0dee5e1c0002', '-1', '700', '2021-02-20 12:07:59', '-1', '20', '-1', 'tom', '-1', '4', '1', '6', ',6,4,1,');
INSERT INTO `userdynamic_2` VALUES ('e783ec2d0a0844128098be90d863d8630002', '-1', '100', '2021-03-31 23:34:14', '-1', '120', '12', 'tom', '-1', '-1', '-1', '-1', ',12,');
INSERT INTO `userdynamic_2` VALUES ('fa87e839af3d46a5966f38a61fa160f20002', '4', '400', '2021-03-20 18:23:29', '1', '20', '11', 'tom', '-1', '-1', '-1', '-1', ',11,4,1,');

-- ----------------------------
-- Table structure for `userdynamic_3`
-- ----------------------------
DROP TABLE IF EXISTS `userdynamic_3`;
CREATE TABLE `userdynamic_3` (
  `id` varchar(36) NOT NULL,
  `commentId` bigint DEFAULT NULL,
  `module` int DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `replyId` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  `topicId` bigint DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `quoteCommentId` bigint DEFAULT NULL,
  `answerId` bigint DEFAULT NULL,
  `answerReplyId` bigint DEFAULT NULL,
  `questionId` bigint DEFAULT NULL,
  `functionIdGroup` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userDynamic_1_idx` (`userName`,`status`,`postTime`),
  KEY `userDynamic_5_idx` (`functionIdGroup`,`userName`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userdynamic_3
-- ----------------------------
INSERT INTO `userdynamic_3` VALUES ('2b21f690a7bd42d8a9c3da1e0f227aaa0003', '6', '200', '2021-03-31 23:42:56', '-1', '20', '14', 'tim', '-1', '-1', '-1', '-1', ',14,6,');
INSERT INTO `userdynamic_3` VALUES ('2bdf8c4e77034360829d3cd194e1e8ab0003', '8', '200', '2021-04-08 23:04:20', '-1', '20', '19', 'tim', '-1', '-1', '-1', '-1', ',19,8,');
INSERT INTO `userdynamic_3` VALUES ('39154efb2f5242a08f7703d2f0bc27990003', '-1', '600', '2021-02-24 14:43:53', '-1', '20', '-1', 'tim', '-1', '6', '-1', '7', ',7,6,');
INSERT INTO `userdynamic_3` VALUES ('3e09062d0ac5429385eba0a885cf2a7b0003', '-1', '100', '2021-04-03 14:57:54', '-1', '20', '17', 'tim', '-1', '-1', '-1', '-1', ',17,');
INSERT INTO `userdynamic_3` VALUES ('4876840b354c4c5b90c20e010654ea090003', '4', '200', '2021-03-20 18:19:01', '-1', '20', '11', 'tim', '-1', '-1', '-1', '-1', ',11,4,');
INSERT INTO `userdynamic_3` VALUES ('587e2b625fe7459a986460d516cf58420003', '-1', '600', '2021-02-20 12:06:02', '-1', '20', '-1', 'tim', '-1', '4', '-1', '6', ',6,4,');
INSERT INTO `userdynamic_3` VALUES ('7930e725900e4898b7c2ba498d48ba610003', '-1', '500', '2021-03-20 18:22:06', '-1', '120', '-1', 'tim', '-1', '-1', '-1', '8', ',8,');
INSERT INTO `userdynamic_3` VALUES ('95bc2ceceb4a44a1abb57ede64c2cdb90003', '7', '200', '2021-04-03 14:51:44', '-1', '20', '16', 'tim', '-1', '-1', '-1', '-1', ',16,7,');
INSERT INTO `userdynamic_3` VALUES ('d754dc5b13a74333a8b078e048d8d9fb0003', '5', '400', '2021-03-31 23:43:43', '2', '20', '14', 'tim', '-1', '-1', '-1', '-1', ',14,5,2,');

-- ----------------------------
-- Table structure for `usergrade`
-- ----------------------------
DROP TABLE IF EXISTS `usergrade`;
CREATE TABLE `usergrade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `needPoint` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of usergrade
-- ----------------------------
INSERT INTO `usergrade` VALUES ('1', '精英人物', '10000');
INSERT INTO `usergrade` VALUES ('2', '知名人士', '5000');
INSERT INTO `usergrade` VALUES ('3', '小有名气', '200');
INSERT INTO `usergrade` VALUES ('4', '初来乍到', '0');

-- ----------------------------
-- Table structure for `userinputvalue`
-- ----------------------------
DROP TABLE IF EXISTS `userinputvalue`;
CREATE TABLE `userinputvalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `options` varchar(32) DEFAULT NULL,
  `userCustomId` int DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userinputvalue_idx` (`userId`,`options`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userinputvalue
-- ----------------------------

-- ----------------------------
-- Table structure for `userloginlog_0`
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_0`;
CREATE TABLE `userloginlog_0` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `typeNumber` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userLoginLog_idx` (`userId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userloginlog_0
-- ----------------------------
INSERT INTO `userloginlog_0` VALUES ('eab992c97ebc4f26aa28457a778b404f0004', '0:0:0:0:0:0:0:1', '2020-03-29 14:35:03', '4', '10');

-- ----------------------------
-- Table structure for `userloginlog_1`
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_1`;
CREATE TABLE `userloginlog_1` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `typeNumber` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userLoginLog_idx` (`userId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userloginlog_1
-- ----------------------------

-- ----------------------------
-- Table structure for `userloginlog_2`
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_2`;
CREATE TABLE `userloginlog_2` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `typeNumber` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userLoginLog_idx` (`userId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userloginlog_2
-- ----------------------------
INSERT INTO `userloginlog_2` VALUES ('04f765b9e2a341449d877340fd50bbb40002', '0:0:0:0:0:0:0:1', '2021-03-20 17:21:36', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('0917c005902749798b9b1a0ccdd98a880002', '0:0:0:0:0:0:0:1', '2020-03-28 23:42:15', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('0c1f8b5301d54c97b4a8fb3f0766a8d50002', '0:0:0:0:0:0:0:1', '2021-04-09 08:45:50', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('29b02d3f77f6424782072a425fe076d00002', '0:0:0:0:0:0:0:1', '2021-04-03 14:50:51', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('2c280510f3b445e1a28da4b387dbf5520002', '0:0:0:0:0:0:0:1', '2020-03-29 14:06:49', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('4117efd1ea444b239126d0b83355ac7a0002', '0:0:0:0:0:0:0:1', '2021-03-31 23:44:28', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('41d3cbb93bc9406ab6c539dd85f2d4ba0002', '0:0:0:0:0:0:0:1', '2021-03-20 18:22:47', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('46bd3cc5f27948aa9a87f7b532eaaf3c0002', '0:0:0:0:0:0:0:1', '2020-03-29 00:50:34', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('56e29a81d8aa47779603fd2215d8b6e40002', '0:0:0:0:0:0:0:1', '2020-03-29 14:31:57', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('58ef45f96ff64722b58b87fd802e380c0002', '0:0:0:0:0:0:0:1', '2020-03-29 00:43:41', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('5ace58d26e404f2db77aa077e49a31020002', '0:0:0:0:0:0:0:1', '2021-02-24 16:27:13', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('5fa050b44dc947de80f8b6834c6602ce0002', '0:0:0:0:0:0:0:1', '2021-04-09 08:44:33', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('6818e48fca0d4caba2ee20129e4c0a4a0002', '0:0:0:0:0:0:0:1', '2021-02-24 14:38:39', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('7b60852406f84fffa2ae7afc38ac20bb0002', '0:0:0:0:0:0:0:1', '2021-04-03 13:42:43', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('856b67a321e84ca0ac760ac9918da7ef0002', '0:0:0:0:0:0:0:1', '2020-03-29 14:25:34', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('85fa6249b3ad4a2fa5c67e5cdd26594f0002', '0:0:0:0:0:0:0:1', '2020-03-29 01:24:48', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('8d1592267f904ba38aec7e22773d9ee30002', '0:0:0:0:0:0:0:1', '2021-03-20 18:10:47', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('922f1fefb42a42d1a8077936b6db2e6c0002', '0:0:0:0:0:0:0:1', '2021-04-08 23:04:49', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('93d4b908b7574b6cb7c3b2cec0ca7eb50002', '0:0:0:0:0:0:0:1', '2020-03-29 13:24:06', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('a16cd37fe2e04319b4f7112e3aa0b3c80002', '0:0:0:0:0:0:0:1', '2021-03-31 23:30:11', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('a385cc916c324976841dc3b82511248f0002', '0:0:0:0:0:0:0:1', '2020-03-29 00:37:32', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('a7b527c8d7a14cb2ae57b963ce92ffbb0002', '0:0:0:0:0:0:0:1', '2021-04-08 22:49:29', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('aafe204aa80d4182ad7c758d7e1b89a90002', '0:0:0:0:0:0:0:1', '2021-03-31 23:18:09', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('ad76e24981b34352af10a64322b94fff0002', '0:0:0:0:0:0:0:1', '2021-02-20 12:07:23', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('bbcf9e67be12475994838aa5b44282cc0002', '0:0:0:0:0:0:0:1', '2021-03-31 23:38:33', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('bd86271f39aa4f8197a7441db819d9780002', '0:0:0:0:0:0:0:1', '2021-04-05 12:39:08', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('c31e62e1cfa747e99a2b18d31b59d5690002', '0:0:0:0:0:0:0:1', '2021-04-01 00:01:28', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('c661441861a04294ac1aeb4374fde6b10002', '0:0:0:0:0:0:0:1', '2021-04-03 14:59:23', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('c922fb8545b9465c877e0dbc2aeaa3680002', '0:0:0:0:0:0:0:1', '2021-02-20 12:03:59', '2', '10');
INSERT INTO `userloginlog_2` VALUES ('d12cbab0b9bc44e598bf312ca45e7abd0002', '0:0:0:0:0:0:0:1', '2021-04-08 22:44:59', '2', '10');

-- ----------------------------
-- Table structure for `userloginlog_3`
-- ----------------------------
DROP TABLE IF EXISTS `userloginlog_3`;
CREATE TABLE `userloginlog_3` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `logonTime` datetime DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `typeNumber` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userLoginLog_idx` (`userId`,`logonTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userloginlog_3
-- ----------------------------
INSERT INTO `userloginlog_3` VALUES ('1baa5a06fdaa42bfbb600968d697ac320003', '0:0:0:0:0:0:0:1', '2021-04-08 23:03:45', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('316abb169aa5472490f1c07d387cd3ba0003', '0:0:0:0:0:0:0:1', '2021-03-31 23:42:36', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('35085883904641609d9334423ff494ad0003', '0:0:0:0:0:0:0:1', '2021-03-31 23:18:44', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('469f732fb55b415fb3fa7fe5917f2cd60003', '0:0:0:0:0:0:0:1', '2021-04-08 23:05:52', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('53bf6a71c9e746aea41244b7369568730003', '0:0:0:0:0:0:0:1', '2021-03-20 18:18:34', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('7855e2e8ac1d4a8bb1c54da72e23a6310003', '0:0:0:0:0:0:0:1', '2020-03-29 00:41:35', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('953f4de227ee4a8698b71a59ca5303550003', '0:0:0:0:0:0:0:1', '2021-04-09 08:44:49', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('ae2164fdfd574a798d9576850dbfd6780003', '0:0:0:0:0:0:0:1', '2021-04-09 08:46:37', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('b3dc366e1fa649ebaaf8232afff31fe80003', '0:0:0:0:0:0:0:1', '2021-02-20 12:05:39', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('bf8674642edc4f5a81c3d0c31c145fda0003', '0:0:0:0:0:0:0:1', '2021-02-24 16:28:01', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('ef150d481cda4741b1217a7083d781020003', '0:0:0:0:0:0:0:1', '2020-03-29 14:30:10', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('f1da8b536b314917ac9ccdd198bf365e0003', '0:0:0:0:0:0:0:1', '2021-04-03 14:51:12', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('f7c4540eae304586b97df30aae17cc150003', '0:0:0:0:0:0:0:1', '2020-04-01 19:17:41', '3', '10');
INSERT INTO `userloginlog_3` VALUES ('ff0d410a250f48838ed1db7ce33f37a30003', '0:0:0:0:0:0:0:1', '2021-02-24 14:43:11', '3', '10');

-- ----------------------------
-- Table structure for `userrole`
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `id` varchar(32) NOT NULL,
  `defaultRole` bit(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` longtext,
  `sort` int DEFAULT NULL,
  `userResourceFormat` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('561aeba0312e4ed2a037bd65a4764a01', '', 'VIP', null, '0', '[{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32313143073265\",\"tagName\":\"综合\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317710426761\",\"tagName\":\"发布领养\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317742826762\",\"tagName\":\"发布寻宠\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":10000000,\"name\":\"问答\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":false,\"userResourceList\":[{\"code\":2000,\"name\":\"提交问题\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":3000,\"name\":\"追加问题\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":6000,\"name\":\"问题免审核\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":7000,\"name\":\"提交答案\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":12000,\"name\":\"答案免审核\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":13000,\"name\":\"提交答案回复\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":16000,\"name\":\"答案回复免审核\",\"resourceGroupCode\":10000000,\"selected\":false}]},{\"code\":2000000,\"name\":\"上传\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"头像上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":2000,\"name\":\"图片上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":3000,\"name\":\"文件上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":4000,\"name\":\"视频上传\",\"resourceGroupCode\":2000000,\"selected\":true}]},{\"code\":3000000,\"name\":\"收藏\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加收藏\",\"resourceGroupCode\":3000000,\"selected\":true},{\"code\":2000,\"name\":\"删除收藏\",\"resourceGroupCode\":3000000,\"selected\":true}]},{\"code\":4000000,\"name\":\"点赞\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加点赞\",\"resourceGroupCode\":4000000,\"selected\":true},{\"code\":2000,\"name\":\"删除点赞\",\"resourceGroupCode\":4000000,\"selected\":true}]},{\"code\":5000000,\"name\":\"关注\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加关注\",\"resourceGroupCode\":5000000,\"selected\":true},{\"code\":2000,\"name\":\"删除关注\",\"resourceGroupCode\":5000000,\"selected\":true}]},{\"code\":6000000,\"name\":\"私信\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"发送私信\",\"resourceGroupCode\":6000000,\"selected\":true},{\"code\":2000,\"name\":\"删除私信\",\"resourceGroupCode\":6000000,\"selected\":true}]}]');
INSERT INTO `userrole` VALUES ('57c094d277bb48629ebf60f31ba93978', '', '普通会员', null, '0', '[{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32313143073265\",\"tagName\":\"综合\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317710426761\",\"tagName\":\"人物摄影\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317742826762\",\"tagName\":\"专业单反摄影\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"35515296854767\",\"tagName\":\"口碑微单摄影\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"35515298054768\",\"tagName\":\"手机摄影\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"35515300054769\",\"tagName\":\"日常分享\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":10000000,\"name\":\"问答\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":2000,\"name\":\"提交问题\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":3000,\"name\":\"追加问题\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":6000,\"name\":\"问题免审核\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":7000,\"name\":\"提交答案\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":12000,\"name\":\"答案免审核\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":13000,\"name\":\"提交答案回复\",\"resourceGroupCode\":10000000,\"selected\":true},{\"code\":16000,\"name\":\"答案回复免审核\",\"resourceGroupCode\":10000000,\"selected\":true}]},{\"code\":2000000,\"name\":\"上传\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"头像上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":2000,\"name\":\"图片上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":3000,\"name\":\"文件上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":4000,\"name\":\"视频上传\",\"resourceGroupCode\":2000000,\"selected\":true}]},{\"code\":3000000,\"name\":\"收藏\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加收藏\",\"resourceGroupCode\":3000000,\"selected\":true},{\"code\":2000,\"name\":\"删除收藏\",\"resourceGroupCode\":3000000,\"selected\":true}]},{\"code\":4000000,\"name\":\"点赞\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加点赞\",\"resourceGroupCode\":4000000,\"selected\":true},{\"code\":2000,\"name\":\"删除点赞\",\"resourceGroupCode\":4000000,\"selected\":true}]},{\"code\":5000000,\"name\":\"关注\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加关注\",\"resourceGroupCode\":5000000,\"selected\":true},{\"code\":2000,\"name\":\"删除关注\",\"resourceGroupCode\":5000000,\"selected\":true}]},{\"code\":6000000,\"name\":\"私信\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"发送私信\",\"resourceGroupCode\":6000000,\"selected\":true},{\"code\":2000,\"name\":\"删除私信\",\"resourceGroupCode\":6000000,\"selected\":true}]}]');
INSERT INTO `userrole` VALUES ('ba608ad2ee4a4608bb8aca126f4d74c6', '', '白金会员', null, '0', '[{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32313143073265\",\"tagName\":\"综合\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317710426761\",\"tagName\":\"玩机技巧\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317742826762\",\"tagName\":\"测评晒单\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317744226763\",\"tagName\":\"第三方配件\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317745626764\",\"tagName\":\"公告\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317746926765\",\"tagName\":\"求助\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317747826766\",\"tagName\":\"功能建议\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317748626767\",\"tagName\":\"VIP专区\\t\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317748626768\",\"tagName\":\"VIP专区\\t\",\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":true}]},{\"code\":1000000,\"name\":\"标签\",\"type\":20,\"tagId\":\"32317749526769\",\"tagName\":\"白金会员专区\",\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"查看话题内容\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":2000,\"name\":\"发表话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":3000,\"name\":\"修改话题\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":6000,\"name\":\"话题免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":7000,\"name\":\"发表评论\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":12000,\"name\":\"评论免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":13000,\"name\":\"发表回复\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":16000,\"name\":\"回复免审核\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":20000,\"name\":\"发表话题使用\'输入密码可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":21000,\"name\":\"发表话题使用\'回复话题可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":22000,\"name\":\"发表话题使用\'达到等级可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":23000,\"name\":\"发表话题使用\'积分购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false},{\"code\":24000,\"name\":\"发表话题使用\'余购购买可见\'功能\",\"resourceGroupCode\":1000000,\"selected\":false}]},{\"code\":10000000,\"name\":\"问答\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":false,\"userResourceList\":[{\"code\":2000,\"name\":\"提交问题\",\"resourceGroupCode\":10000000,\"selected\":false},{\"code\":3000,\"name\":\"追加问题\",\"resourceGroupCode\":10000000,\"selected\":false},{\"code\":6000,\"name\":\"问题免审核\",\"resourceGroupCode\":10000000,\"selected\":false},{\"code\":7000,\"name\":\"提交答案\",\"resourceGroupCode\":10000000,\"selected\":false},{\"code\":12000,\"name\":\"答案免审核\",\"resourceGroupCode\":10000000,\"selected\":false},{\"code\":13000,\"name\":\"提交答案回复\",\"resourceGroupCode\":10000000,\"selected\":false},{\"code\":16000,\"name\":\"答案回复免审核\",\"resourceGroupCode\":10000000,\"selected\":false}]},{\"code\":2000000,\"name\":\"上传\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":false,\"userResourceList\":[{\"code\":1000,\"name\":\"头像上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":2000,\"name\":\"图片上传\",\"resourceGroupCode\":2000000,\"selected\":true},{\"code\":3000,\"name\":\"文件上传\",\"resourceGroupCode\":2000000,\"selected\":false},{\"code\":4000,\"name\":\"视频上传\",\"resourceGroupCode\":2000000,\"selected\":false}]},{\"code\":3000000,\"name\":\"收藏\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加收藏\",\"resourceGroupCode\":3000000,\"selected\":true},{\"code\":2000,\"name\":\"删除收藏\",\"resourceGroupCode\":3000000,\"selected\":true}]},{\"code\":4000000,\"name\":\"点赞\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加点赞\",\"resourceGroupCode\":4000000,\"selected\":true},{\"code\":2000,\"name\":\"删除点赞\",\"resourceGroupCode\":4000000,\"selected\":true}]},{\"code\":5000000,\"name\":\"关注\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"添加关注\",\"resourceGroupCode\":5000000,\"selected\":true},{\"code\":2000,\"name\":\"删除关注\",\"resourceGroupCode\":5000000,\"selected\":true}]},{\"code\":6000000,\"name\":\"私信\",\"type\":10,\"tagId\":null,\"tagName\":null,\"selected\":true,\"userResourceList\":[{\"code\":1000,\"name\":\"发送私信\",\"resourceGroupCode\":6000000,\"selected\":true},{\"code\":2000,\"name\":\"删除私信\",\"resourceGroupCode\":6000000,\"selected\":true}]}]');

-- ----------------------------
-- Table structure for `userrolegroup`
-- ----------------------------
DROP TABLE IF EXISTS `userrolegroup`;
CREATE TABLE `userrolegroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `userRoleId` varchar(32) DEFAULT NULL,
  `validPeriodEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userRoleGroup_1_idx` (`userName`,`validPeriodEnd`),
  KEY `userRoleGroup_3_idx` (`userRoleId`,`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userrolegroup
-- ----------------------------
INSERT INTO `userrolegroup` VALUES ('2', 'tim', '561aeba0312e4ed2a037bd65a4764a01', '2999-01-01 00:00:00');
INSERT INTO `userrolegroup` VALUES ('3', 'tim', 'ba608ad2ee4a4608bb8aca126f4d74c6', '2999-02-01 00:00:00');
INSERT INTO `userrolegroup` VALUES ('4', 'xiaohong', '561aeba0312e4ed2a037bd65a4764a01', '2999-01-01 00:00:00');
INSERT INTO `userrolegroup` VALUES ('5', 'tom', '561aeba0312e4ed2a037bd65a4764a01', '2999-01-01 00:00:00');
