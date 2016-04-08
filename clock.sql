-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2016 at 06:00 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clock`
--

-- --------------------------------------------------------

--
-- Table structure for table `cl_access`
--

CREATE TABLE `cl_access` (
  `id` int(11) NOT NULL,
  `role_id` smallint(6) UNSIGNED NOT NULL,
  `node_id` smallint(6) UNSIGNED NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cl_category`
--

CREATE TABLE `cl_category` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '类型名',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `created` datetime NOT NULL COMMENT '新增时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_category`
--

INSERT INTO `cl_category` (`id`, `name`, `pid`, `remark`, `created`, `modified`) VALUES
(1, 'technology', 0, '技术类', '2016-03-15 10:07:42', '2016-03-15 10:07:42'),
(2, 'PHP', 1, '', '2016-03-15 10:08:24', '2016-03-15 10:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `cl_content`
--

CREATE TABLE `cl_content` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '作者id',
  `title` varchar(64) NOT NULL COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文章状态：0，草稿；1已发布（已审核）；2，屏蔽；',
  `istop` tinyint(4) NOT NULL DEFAULT '0' COMMENT '置顶：0，不置顶；1，置顶',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- Dumping data for table `cl_content`
--

INSERT INTO `cl_content` (`id`, `uid`, `title`, `content`, `status`, `istop`, `created`, `modified`) VALUES
(1, 1, '第一篇文章', '&lt;p&gt;Hello World!&lt;/p&gt;&lt;p&gt;This is my first content!&lt;/p&gt;', 0, 0, '2016-03-15 11:58:02', '2016-03-15 16:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `cl_node`
--

CREATE TABLE `cl_node` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL,
  `display` smallint(6) NOT NULL DEFAULT '1',
  `sort` smallint(6) UNSIGNED DEFAULT NULL,
  `pid` smallint(6) UNSIGNED NOT NULL,
  `level` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_node`
--

INSERT INTO `cl_node` (`id`, `name`, `title`, `group_id`, `status`, `remark`, `display`, `sort`, `pid`, `level`) VALUES
(1, 'admin', '项目应用', 0, 1, NULL, 1, NULL, 0, 1),
(6, 'Index', '首页模块', 0, 1, '', 0, 0, 1, 2),
(4, 'News', '新闻模块', 0, 1, NULL, 1, 1, 1, 2),
(5, 'newsAdd', '新闻添加', 0, 1, NULL, 1, NULL, 4, 3),
(7, 'index', '后台首页', 0, 1, NULL, 1, NULL, 6, 3),
(8, 'newsDelete', '新闻删除', 0, 1, NULL, 0, NULL, 4, 3),
(9, 'User', '用户管理', 0, 1, NULL, 1, 2, 1, 2),
(10, 'index', '用户列表', 0, 1, NULL, 1, NULL, 9, 3),
(11, 'addUser', '用户添加', 0, 1, NULL, 1, NULL, 9, 3),
(12, 'checkUsername', '检测用户名', 0, 1, '', 0, NULL, 9, 3),
(13, 'changeRole', '更改角色', 0, 1, '', 0, NULL, 9, 3),
(14, 'Role', '角色管理', 0, 1, NULL, 1, 3, 1, 2),
(15, 'index', '角色列表', 0, 1, NULL, 1, NULL, 14, 3),
(16, 'alertPower', '修改角色权限', 0, 1, '', 0, NULL, 14, 3),
(17, 'newsSortList', '新闻分类列表', 0, 1, NULL, 1, NULL, 4, 3),
(18, 'newsClassUpdate', '新闻分类更新', 0, 1, NULL, 0, NULL, 4, 3),
(19, 'newsClassDelete', '新闻分类删除', 0, 1, NULL, 0, NULL, 4, 3),
(20, 'newsClassAdd', '新闻分类添加', 0, 1, '', 0, NULL, 4, 3),
(21, 'newsList', '已审核新闻列表', 0, 1, NULL, 1, NULL, 4, 3),
(22, 'newsEdit', '新闻编辑', 0, 1, NULL, 0, NULL, 4, 3),
(23, 'unauditedNews', '未审核新闻列表', 0, 1, NULL, 1, NULL, 4, 3),
(25, 'newsAlter', '新闻修改', 0, 1, '审核的了和未审核的了都经过这个方法', 0, NULL, 4, 3),
(26, 'newsRemove', '新闻删除(未审核)', 0, 1, NULL, 0, NULL, 4, 3),
(27, 'passNews', '审核通过', 0, 1, NULL, 0, NULL, 4, 3),
(40, 'userAlter', '用户修改', 0, 1, '', 0, NULL, 9, 3),
(28, 'picNewsAdd', '图片新闻添加', 0, 1, '', 0, NULL, 4, 3),
(29, 'passPicNews', '图片新闻审核通过', 0, 1, NULL, 0, NULL, 4, 3),
(30, 'picNewsAlter', '图片新闻修改(未审核)', 0, 1, NULL, 0, NULL, 4, 3),
(31, 'picNewsRemove', '图片新闻删除(未审核)', 0, 1, NULL, 0, NULL, 4, 3),
(32, 'picNewsDelete', '图片新闻删除', 0, 1, NULL, 0, NULL, 4, 3),
(33, 'picNewsEdit', '图片新闻编辑', 0, 1, NULL, 0, NULL, 4, 3),
(34, 'newsSetTop', '新闻置顶', 0, 1, NULL, 0, NULL, 4, 3),
(35, 'newsCancelTop', '新闻取消置顶', 0, 1, NULL, 0, NULL, 4, 3),
(36, 'picNewsCancelTop', '图片新闻置顶取消', 0, 1, NULL, 0, NULL, 4, 3),
(37, 'picNewsSetTop', '图片新闻置顶', 0, 1, NULL, 0, NULL, 4, 3),
(38, 'userInfoAlter', '用户资料修改', 0, 1, '', 1, NULL, 9, 3),
(41, 'userPasswordAlter', '用户密码修改', 0, 1, '', 0, NULL, 9, 3),
(52, 'roleDelete', '角色删除', 0, 1, '', 0, NULL, 14, 3),
(42, 'userDelete', '用户删除', 0, 1, '', 0, NULL, 9, 3),
(43, 'roleInfoAlter', '角色资料修改', 0, 1, '', 0, NULL, 14, 3),
(44, 'addRole', '角色添加', 0, 1, NULL, 1, NULL, 14, 3),
(45, 'roleForbid', '角色禁用', 0, 1, '', 0, NULL, 14, 3),
(46, 'roleStart', '角色启用', 0, 1, '', 0, NULL, 14, 3),
(47, 'userStart', '用户启用', 0, 1, '', 0, NULL, 9, 3),
(48, 'userForbid', '用户禁用', 0, 1, '', 0, NULL, 9, 3),
(49, 'Node', '节点管理', 0, 1, NULL, 1, 4, 1, 2),
(50, 'index', '节点列表', 0, 1, NULL, 1, NULL, 49, 3),
(51, 'nodeInfoAlter', '节点信息修改', 0, 1, '', 0, NULL, 49, 3),
(192, 'commentDelete', '评论删除', 0, 1, NULL, 0, NULL, 177, 3),
(191, 'commentStart', '评论启用', 0, 1, NULL, 0, NULL, 177, 3),
(190, 'commentForbid', '评论禁用', 0, 1, NULL, 0, NULL, 177, 3),
(189, 'lookcomment', '查看评论', 0, 1, NULL, 0, NULL, 177, 3),
(188, 'personDelete', '会员删除', 0, 1, NULL, 0, NULL, 184, 3),
(187, 'personStart', '会员启用', 0, 1, NULL, 0, NULL, 184, 3),
(186, 'personForbid', '会员禁用', 0, 1, NULL, 0, NULL, 184, 3),
(144, 'sending', '发送反馈信息', 0, 1, NULL, 0, NULL, 118, 3),
(143, 'sendmassege', '反馈信息页面', 0, 1, '', 1, NULL, 118, 3),
(73, 'editProject', '修改不需要审核的项目', 0, 1, NULL, 1, NULL, 59, 3),
(74, 'editCheckProject', '修改需要审核的项目', 0, 1, NULL, 1, NULL, 59, 3),
(75, 'addCheckProject', '添加需要审核的项目', 0, 1, NULL, 1, NULL, 59, 3),
(76, 'checkProject', '审核信息', 0, 1, NULL, 1, NULL, 59, 3),
(78, 'DownloadFile', '文件下载模块', 0, 1, '', 0, 20, 1, 2),
(81, 'filelist', '文件列表', 0, 1, NULL, 1, NULL, 78, 3),
(80, 'uploadFile', '上传文件', 0, 1, NULL, 1, NULL, 78, 3),
(82, 'downloadFile', '下载文件', 0, 1, '', 0, NULL, 78, 3),
(112, 'picNewsList', '已审核图片新闻列表', 0, 1, '', 0, NULL, 4, 3),
(84, 'Nav', '导航栏模块', 0, 1, '', 1, 8, 1, 2),
(85, 'fileEdit', '上传文件信息修改', 0, 1, '', 0, NULL, 78, 3),
(86, 'deleteFile', '删除文件', 0, 1, '', 0, NULL, 78, 3),
(87, 'FriendLink', '友情链接', 0, 1, '', 0, 12, 1, 2),
(185, 'index', '会员列表', 0, 1, NULL, 1, NULL, 184, 3),
(94, 'navPosition', '导航栏位置设置', 0, 1, NULL, 1, NULL, 84, 3),
(91, 'Department', '部门导航', 0, 1, '', 0, 21, 1, 2),
(93, 'setNav', '导航设置', 0, 1, NULL, 1, NULL, 84, 3),
(95, 'setLink', '链接设置', 0, 1, NULL, 1, NULL, 87, 3),
(97, 'setDepartment', '设置部门', 0, 1, NULL, 1, NULL, 91, 3),
(98, 'addLink', '添加链接', 0, 1, '', 0, NULL, 87, 3),
(99, 'delLink', '删除链接', 0, 1, '', 0, NULL, 87, 3),
(100, 'updateLink', '更新链接', 0, 1, '', 0, NULL, 87, 3),
(101, 'addDepartment', '添加部门', 0, 1, '', 0, NULL, 91, 3),
(102, 'updateDepartment', '更新部门', 0, 1, '', 0, NULL, 91, 3),
(103, 'delDepartment', '删除部门', 0, 1, '', 0, NULL, 91, 3),
(184, 'Person', '会员管理', 0, 1, NULL, 1, 7, 1, 2),
(183, 'photoDelete', '图片删除', 0, 1, NULL, 0, NULL, 177, 3),
(107, 'addNav', '添加导航', 0, 1, '', 0, NULL, 84, 3),
(108, 'updateNav', '更新导航', 0, 1, '', 0, NULL, 84, 3),
(111, 'ajaxSetPosition', 'ajax异步设置位置', 0, 1, '', 0, NULL, 84, 3),
(110, 'delNav', '删除导航', 0, 1, '', 0, NULL, 84, 3),
(113, 'unauditedPicNews', '未审核图片新闻列表', 0, 1, '', 0, NULL, 4, 3),
(114, 'Logo', 'logo管理', 0, 1, NULL, 1, 9, 1, 2),
(115, 'setLogo', '设置logo', 0, 1, NULL, 1, NULL, 114, 3),
(116, 'delLogo', '删除logo', 0, 1, '', 0, NULL, 114, 3),
(129, 'ajaxAttachUp', '异步附件上传', 0, 1, '', 0, NULL, 4, 3),
(118, 'WordsArea', '留言区', 0, 1, NULL, 1, 10, 1, 2),
(119, 'wordsDisplay', '留言显示', 0, 1, '', 0, NULL, 118, 3),
(120, 'wordsDelete', '留言删除', 0, 1, '', 0, NULL, 118, 3),
(121, 'wordsReply', '留言回复', 0, 1, '', 0, NULL, 118, 3),
(127, 'wordsList', '留言列表', 0, 1, '', 1, NULL, 118, 3),
(123, 'replyEdit', '回复修改', 0, 1, '', 0, NULL, 118, 3),
(124, 'wordsHide', '留言隐藏', 0, 1, '', 0, NULL, 118, 3),
(128, 'ajaxImgUp', '异步图片上传', 0, 1, '', 0, NULL, 4, 3),
(126, 'wordsEdit', '留言修改', 0, 1, '', 0, NULL, 118, 3),
(130, 'ajaxNews', '异步获取新闻', 0, 1, '', 0, NULL, 4, 3),
(131, 'Link', '链接模块', 0, 1, NULL, 1, 11, 1, 2),
(132, 'friendLink', '友情链接', 0, 1, NULL, 1, NULL, 131, 3),
(133, 'weiboLink', '其它链接', 0, 1, '', 1, NULL, 131, 3),
(134, 'WorkLink', '客服中心', 0, 1, '', 1, 12, 1, 2),
(135, 'WorkLinkSet', '中心设置', 0, 1, '', 1, NULL, 134, 3),
(136, 'addLink', '添加功能', 0, 1, '', 0, NULL, 134, 3),
(137, 'updateLink', '更新功能', 0, 1, '', 0, NULL, 134, 3),
(138, 'delLink', '删除功能', 0, 1, '', 0, NULL, 134, 3),
(139, 'addLink', '添加链接', 0, 1, '', 0, NULL, 131, 3),
(140, 'updateLink', '更新链接', 0, 1, '', 0, NULL, 131, 3),
(141, 'delLink', '删除链接', 0, 1, '', 0, NULL, 131, 3),
(142, 'searchNews', '新闻搜索', 0, 1, '', 0, NULL, 4, 3),
(182, 'photo', '图片模块', 0, 1, NULL, 1, NULL, 177, 3),
(181, 'vedioDelete', '视频删除', 0, 1, NULL, 0, NULL, 177, 3),
(180, 'vedioStart', '视频启用', 0, 1, NULL, 0, NULL, 177, 3),
(179, 'vedioForbid', '视频禁用', 0, 1, NULL, 0, NULL, 177, 3),
(178, 'video', '视频模块', 0, 1, NULL, 1, NULL, 177, 3),
(177, 'Resource', '资源管理', 0, 1, NULL, 1, 6, 1, 2),
(173, 'index', '老师列表', 0, 1, NULL, 1, NULL, 172, 3),
(174, 'addTeacher', '名单添加', 0, 1, NULL, 1, NULL, 172, 3),
(175, 'teacherInfoAlter', '更新名单', 0, 1, NULL, 0, NULL, 172, 3),
(176, 'teacherDelete', '删除名单', 0, 1, NULL, 0, NULL, 172, 3),
(172, 'Teacher', '师资管理', 0, 1, NULL, 1, 5, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cl_role`
--

CREATE TABLE `cl_role` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_role`
--

INSERT INTO `cl_role` (`id`, `name`, `title`, `pid`, `status`, `remark`) VALUES
(0, 'Admin', 'admin', NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `cl_role_user`
--

CREATE TABLE `cl_role_user` (
  `role_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_role_user`
--

INSERT INTO `cl_role_user` (`role_id`, `user_id`) VALUES
(0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `cl_user`
--

CREATE TABLE `cl_user` (
  `id` int(11) NOT NULL,
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
  `remark` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cl_user`
--

INSERT INTO `cl_user` (`id`, `username`, `nickname`, `password`, `email`, `phone`, `login_count`, `register_time`, `last_login_time`, `last_login_ip`, `status`, `remark`) VALUES
(0, 'admin', 'admin', 'ff7a0e56e67ead89bf4f0728f20b8faa', '123@11.cc', '13750505530', 0, 1459873044, 1459873044, '0.0.0.0', 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cl_category`
--
ALTER TABLE `cl_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_content`
--
ALTER TABLE `cl_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cl_node`
--
ALTER TABLE `cl_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cl_category`
--
ALTER TABLE `cl_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cl_content`
--
ALTER TABLE `cl_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cl_node`
--
ALTER TABLE `cl_node`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
