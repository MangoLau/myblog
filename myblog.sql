-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-05-06 19:11:27
-- 服务器版本： 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `cl_access`
--

DROP TABLE IF EXISTS `cl_access`;
CREATE TABLE IF NOT EXISTS `cl_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` smallint(6) UNSIGNED NOT NULL,
  `node_id` smallint(6) UNSIGNED NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_access`
--

INSERT INTO `cl_access` (`id`, `role_id`, `node_id`, `level`, `module`) VALUES
(120, 1, 32, 3, NULL),
(119, 1, 31, 3, NULL),
(118, 1, 30, 3, NULL),
(117, 1, 29, 3, NULL),
(116, 1, 28, 3, NULL),
(115, 1, 27, 3, NULL),
(114, 1, 26, 2, NULL),
(113, 1, 14, 3, NULL),
(112, 1, 13, 2, NULL),
(111, 1, 12, 3, NULL),
(110, 1, 11, 3, NULL),
(109, 1, 10, 3, NULL),
(108, 1, 9, 3, NULL),
(107, 1, 8, 2, NULL),
(106, 1, 7, 3, NULL),
(105, 1, 6, 3, NULL),
(104, 1, 5, 3, NULL),
(103, 1, 4, 3, NULL),
(102, 1, 3, 2, NULL),
(101, 1, 18, 3, NULL),
(100, 1, 17, 3, NULL),
(99, 1, 16, 3, NULL),
(98, 1, 15, 3, NULL),
(97, 1, 2, 2, NULL),
(96, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cl_category`
--

DROP TABLE IF EXISTS `cl_category`;
CREATE TABLE IF NOT EXISTS `cl_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '类型名',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '新增时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_category`
--

INSERT INTO `cl_category` (`id`, `name`, `pid`, `remark`, `created`, `modified`) VALUES
(1, 'technology', 0, '技术类', '2016-03-15 10:07:42', '2016-03-15 10:07:42'),
(22, '很好', 20, '', '2016-04-13 10:13:07', '2016-04-13 10:13:07'),
(20, '空气', 19, '', '2016-04-13 10:12:32', '2016-04-28 10:29:07'),
(19, 'environment', 0, '', '2016-04-13 10:12:20', '2016-04-13 10:12:20'),
(17, 'MySQL', 0, '', '2016-04-13 10:11:41', '2016-04-27 10:14:44');

-- --------------------------------------------------------

--
-- 表的结构 `cl_content`
--

DROP TABLE IF EXISTS `cl_content`;
CREATE TABLE IF NOT EXISTS `cl_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '作者id',
  `title` varchar(64) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '所属类别',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文章状态：0，草稿；1已发布（已审核）；2，屏蔽；',
  `istop` tinyint(4) NOT NULL DEFAULT '0' COMMENT '置顶：0，不置顶；1，置顶',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  `introduction` varchar(256) DEFAULT NULL COMMENT '文章简介',
  `keyword` varchar(256) DEFAULT NULL COMMENT 'SEO关键词',
  `description` varchar(256) DEFAULT NULL COMMENT 'SEO描述',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- 转存表中的数据 `cl_content`
--

INSERT INTO `cl_content` (`id`, `uid`, `title`, `content`, `cid`, `status`, `istop`, `created`, `modified`, `introduction`, `keyword`, `description`, `hits`) VALUES
(2, 1, 'Apple/苹果 iPhone 6s HK 海淘手机 玫瑰金 16GB', '&lt;p&gt;uhjtrdshgfythgWERGAEHGSDBZCBDTYHAEHRTSHA&lt;/p&gt;&lt;p style=&quot;line-height: 16px;&quot;&gt;&lt;img style=&quot;vertical-align: middle; margin-right: 2px;&quot; src=&quot;/myblog/Public/UEditor/dialogs/attachment/fileTypeImages/icon_txt.gif&quot;/&gt;&lt;a style=&quot;font-size:12px; color:#0066cc;&quot; href=&quot;/Upload/file/2016/04/22/1461313971418742.txt&quot; title=&quot;sql.txt&quot;&gt;sql.txt&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, 0, 0, '2016-04-12 10:38:00', '2016-04-22 16:32:57', 'Hello World!', 'world！', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cl_homenode`
--

DROP TABLE IF EXISTS `cl_homenode`;
CREATE TABLE IF NOT EXISTS `cl_homenode` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `name` varchar(32) NOT NULL COMMENT '节点名，由英文、下划线、数字组成',
  `title` varchar(32) NOT NULL COMMENT '节点称呼',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父节点',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='前端节点表，用于导航链接选择显示方法';

--
-- 转存表中的数据 `cl_homenode`
--

INSERT INTO `cl_homenode` (`id`, `name`, `title`, `pid`, `created`, `modified`) VALUES
(1, 'Content', '文章', 0, '2016-05-03 00:00:00', '2016-05-03 00:00:00'),
(2, 'baseList', '常规展示', 1, '2016-05-03 14:21:31', '2016-05-03 14:26:06');

-- --------------------------------------------------------

--
-- 表的结构 `cl_link`
--

DROP TABLE IF EXISTS `cl_link`;
CREATE TABLE IF NOT EXISTS `cl_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `link_name` varchar(32) NOT NULL COMMENT '链接名',
  `href` varchar(32) NOT NULL COMMENT '链接地址',
  `type` tinyint(4) NOT NULL COMMENT '连接类型：1，友情链接',
  `status` tinyint(4) NOT NULL COMMENT '状态：1，正常；0，屏蔽',
  `img` varchar(32) DEFAULT NULL COMMENT '链接图标',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='链接表';

--
-- 转存表中的数据 `cl_link`
--

INSERT INTO `cl_link` (`id`, `link_name`, `href`, `type`, `status`, `img`, `created`, `modified`) VALUES
(2, '百度', 'http://www.baidu.com', 1, 1, '/Upload/link/1462260667.png', '2016-04-28 11:30:27', '2016-05-03 15:31:07'),
(3, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462239476.jpg', '2016-04-29 10:55:00', '2016-05-03 09:37:56'),
(4, 'Galen', 'http://120.27.50.22/building/', 1, 1, '/Upload/link/1462260678.png', '2016-04-29 11:03:42', '2016-05-03 15:31:18'),
(5, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462260766.png', '2016-04-29 11:08:23', '2016-05-03 15:32:46'),
(6, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462239647.jpg', '2016-04-29 14:09:08', '2016-05-03 09:40:47'),
(8, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462260641.png', '2016-04-29 14:14:35', '2016-05-03 15:30:41'),
(9, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462240297.jpg', '2016-04-29 14:16:29', '2016-05-03 09:51:37'),
(10, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462240660.png', '2016-04-29 17:12:57', '2016-05-03 09:57:40'),
(14, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462240317.jpg', '2016-04-29 17:51:12', '2016-05-03 09:51:57'),
(15, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462260718.png', '2016-04-29 17:51:55', '2016-05-03 15:31:58'),
(16, 'MangoLau''s Blog', 'http://120.27.50.22/wordpress/', 1, 1, '/Upload/link/1462240332.jpg', '2016-04-29 17:52:37', '2016-05-03 09:52:12');

-- --------------------------------------------------------

--
-- 表的结构 `cl_nav`
--

DROP TABLE IF EXISTS `cl_nav`;
CREATE TABLE IF NOT EXISTS `cl_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `nav_name` varchar(32) NOT NULL COMMENT '导航名（英文数字或者下划线）',
  `link` varchar(32) NOT NULL COMMENT '链接',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `path` varchar(64) DEFAULT NULL COMMENT '祖先导航到自己的路径',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序，由大到小排序',
  `display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导航链接类型：0，站外链接；1，站内链接',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_nav`
--

INSERT INTO `cl_nav` (`id`, `nav_name`, `link`, `pid`, `cid`, `path`, `sort`, `display`, `type`, `created`, `modified`) VALUES
(16, 'environment', 'Content/baseList?cid=19', 0, 19, NULL, 0, 0, 1, '2016-05-06 18:59:45', NULL),
(15, 'technology', 'Content/baseList?cid=1', 0, 1, NULL, 0, 0, 1, '2016-05-06 18:55:59', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cl_node`
--

DROP TABLE IF EXISTS `cl_node`;
CREATE TABLE IF NOT EXISTS `cl_node` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL,
  `display` smallint(6) NOT NULL DEFAULT '1',
  `sort` smallint(6) UNSIGNED DEFAULT NULL,
  `pid` smallint(6) UNSIGNED NOT NULL,
  `level` tinyint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_node`
--

INSERT INTO `cl_node` (`id`, `name`, `title`, `group_id`, `status`, `remark`, `display`, `sort`, `pid`, `level`) VALUES
(1, 'Admin', '后台管理', 0, 1, '', 1, 0, 0, 1),
(2, 'Node', '节点管理', 0, 1, '', 1, 0, 1, 2),
(3, 'Category', '类型', 0, 1, '', 1, 0, 1, 2),
(4, 'index', '类型列表', 0, 1, '', 1, 0, 3, 3),
(5, 'altCategory', '修改类型', 0, 1, '', 0, 0, 3, 3),
(6, 'addCategory', '增加类型', 0, 1, '', 1, 0, 3, 3),
(7, 'delCategory', '删除类型', 0, 1, '', 0, 0, 3, 3),
(8, 'Content', '文章', 0, 1, '', 1, 0, 1, 2),
(9, 'index', '文章列表', 0, 1, '', 1, 0, 8, 3),
(10, 'addContent', '文章添加', 0, 1, '', 1, 0, 8, 3),
(11, 'altContent', '文章修改', 0, 1, '', 0, 0, 8, 3),
(12, 'delContent', '文章删除', 0, 1, '', 0, 0, 8, 3),
(13, 'Index', '后台首页', 0, 1, '', 0, 0, 1, 2),
(14, 'index', '首页显示', 0, 1, '', 0, 0, 13, 3),
(15, 'index', '节点列表', 0, 1, '', 1, 0, 2, 3),
(16, 'addNode', '添加节点', 0, 1, '', 0, 0, 2, 3),
(17, 'updateNode', '编辑节点', 0, 1, '', 0, 0, 2, 3),
(18, 'deleteNode', '删除节点', 0, 1, '', 0, 0, 2, 3),
(19, 'Role', '角色', 0, 1, '', 1, 0, 1, 2),
(20, 'index', '角色列表', 0, 1, '', 1, 0, 19, 3),
(21, 'addRole', '添加角色', 0, 1, '', 1, 0, 19, 3),
(22, 'access', '配置权限', 0, 1, '', 0, 0, 19, 3),
(23, 'setAccess', '修改权限', 0, 1, '', 0, 0, 19, 3),
(24, 'updateRole', '编辑角色', 0, 1, '', 0, 0, 19, 3),
(25, 'deleteRole', '删除角色', 0, 1, '', 0, 0, 19, 3),
(26, 'User', '用户', 0, 1, '', 1, 0, 1, 2),
(27, 'index', '用户列表', 0, 1, '', 1, 0, 26, 3),
(28, 'addUser', '添加用户', 0, 1, '', 1, 0, 26, 3),
(29, 'access', '赋予角色', 0, 1, '', 0, 0, 26, 3),
(30, 'updateUser', '编辑用户', 0, 1, '', 1, 0, 26, 3),
(31, 'altPassword', '修改密码', 0, 1, '', 0, 0, 26, 3),
(32, 'deleteUser', '删除用户', 0, 1, '', 0, 0, 26, 3),
(33, 'Link', '链接管理', 0, 1, '', 1, 0, 1, 2),
(34, 'index', '链接列表', 0, 1, '', 1, 0, 33, 3),
(35, 'addLink', '新增链接', 0, 1, '', 1, 0, 33, 3),
(36, 'altLink', '编辑链接', 0, 1, '', 0, 0, 33, 3),
(37, 'delLink', '删除链接', 0, 1, '', 0, 0, 33, 3),
(38, 'Copyright', '版权信息', 0, 1, '', 1, 0, 1, 2),
(39, 'index', '版权显示', 0, 1, '', 1, 0, 38, 3),
(40, 'Nav', '导航管理', 0, 1, '', 1, 0, 1, 2),
(41, 'index', '导航设置', 0, 1, '', 1, 0, 40, 3),
(42, 'Homenode', '前端链接节点', 0, 1, '', 1, 0, 1, 2),
(43, 'index', '节点列表', 0, 1, '', 1, 0, 42, 3);

-- --------------------------------------------------------

--
-- 表的结构 `cl_role`
--

DROP TABLE IF EXISTS `cl_role`;
CREATE TABLE IF NOT EXISTS `cl_role` (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_role`
--

INSERT INTO `cl_role` (`id`, `name`, `title`, `pid`, `status`, `remark`) VALUES
(1, 'user', '管理员', NULL, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `cl_role_user`
--

DROP TABLE IF EXISTS `cl_role_user`;
CREATE TABLE IF NOT EXISTS `cl_role_user` (
  `role_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_role_user`
--

INSERT INTO `cl_role_user` (`role_id`, `user_id`) VALUES
(1, '2');

-- --------------------------------------------------------

--
-- 表的结构 `cl_user`
--

DROP TABLE IF EXISTS `cl_user`;
CREATE TABLE IF NOT EXISTS `cl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) NOT NULL COMMENT '手机号码',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `register_time` int(11) NOT NULL,
  `last_login_time` int(11) NOT NULL,
  `last_login_ip` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remark` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cl_user`
--

INSERT INTO `cl_user` (`id`, `username`, `nickname`, `password`, `email`, `phone`, `login_count`, `register_time`, `last_login_time`, `last_login_ip`, `status`, `remark`) VALUES
(1, 'admin', 'admin', 'e1f1ee0cfcbb93ea2ffe9e44df18395c', '123@11.cc', '13750505530', 13, 1459873044, 1462530531, '0.0.0.0', 1, ''),
(2, 'user', '管理员', '2dcfd9424307baf88a78d67b4b075fd1', '853779003@qq.com', '13750505530', 4, 1461640266, 1461721093, '0.0.0.0', 1, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
