-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-05-12 18:17:36
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
(1, 'PHP', 0, '技术类', '2016-03-15 10:07:42', '2016-05-12 14:40:38'),
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
  `keyword` varchar(256) DEFAULT NULL COMMENT 'SEO关键词',
  `description` varchar(256) DEFAULT NULL COMMENT 'SEO描述',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- 转存表中的数据 `cl_content`
--

INSERT INTO `cl_content` (`id`, `uid`, `title`, `content`, `cid`, `status`, `istop`, `created`, `modified`, `keyword`, `description`, `hits`) VALUES
(2, 1, 'Apple/苹果 iPhone 6s HK 海淘手机 玫瑰金 16GB', '&lt;p&gt;uhjtrdshgfythgWERGAEHGSDBZCBDTYHAEHRTSHA&lt;/p&gt;', 1, 1, 0, '2016-04-12 10:38:00', '2016-05-09 17:35:03', 'world！', '', 30),
(3, 1, 'test1', '&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://lib.csdn.net/base/14&quot; title=&quot;MySQL知识库&quot; target=&quot;_blank&quot; style=&quot;color: rgb(223, 52, 52); text-decoration: none; font-weight: bold;&quot;&gt;MySQL&lt;/a&gt;有多种存储引擎，MyISAM和InnoDB是其中常用的两种。这里介绍关于这两种引擎的一些基本概念（非深入介绍）。&lt;/p&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;MyISAM是MySQL的默认存储引擎，基于传统的ISAM类型，支持全文搜索，但不是事务安全的，而且不支持外键。每张MyISAM表存放在三个文件中：frm 文件存放表格定义；数据文件是MYD (MYData)；索引文件是MYI (MYIndex)。&lt;/p&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;InnoDB是事务型引擎，支持回滚、崩溃恢复能力、多版本并发控制、ACID事务，支持行级锁定（InnoDB表的行锁不是绝对的，如果在执行一个SQL语句时MySQL不能确定要扫描的范围，InnoDB表同样会锁全表，如like操作时的SQL语句），以及提供与Oracle类型一致的不加锁读取方式。InnoDB存储它的表和索引在一个表空间中，表空间可以包含数个文件。&lt;/p&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;主要区别：&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;MyISAM是非事务安全型的，而InnoDB是事务安全型的。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;MyISAM锁的粒度是表级，而InnoDB支持行级锁定。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;MyISAM支持全文类型索引，而InnoDB不支持全文索引。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;MyISAM相对简单，所以在效率上要优于InnoDB，小型应用可以考虑使用MyISAM。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;MyISAM表是保存成文件的形式，在跨平台的数据转移中使用MyISAM存储会省去不少的麻烦。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;InnoDB表比MyISAM表更安全，可以在保证数据不会丢失的情况下，切换非事务表到事务表（alter table tablename type=innodb）。&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;应用场景：&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;MyISAM管理非事务表。它提供高速存储和检索，以及全文搜索能力。如果应用中需要执行大量的SELECT查询，那么MyISAM是更好的选择。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;InnoDB用于事务处理应用程序，具有众多特性，包括ACID事务支持。如果应用中需要执行大量的INSERT或UPDATE操作，则应该使用InnoDB，这样可以提高多用户并发操作的性能。&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;常用命令：&lt;/p&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;　　（1）查看表的存储类型（三种）：&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;show create table tablename&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;show table status from&amp;nbsp; dbname&amp;nbsp; where name=tablename&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;mysqlshow&amp;nbsp; -u user -p password --status dbname tablename&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;　　（2）修改表的存储引擎：&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;alter table tablename type=InnoDB&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;　　（3）启动mysql&lt;a href=&quot;http://lib.csdn.net/base/14&quot; title=&quot;MySQL知识库&quot; target=&quot;_blank&quot; style=&quot;color: rgb(223, 52, 52); text-decoration: none; font-weight: bold;&quot;&gt;数据库&lt;/a&gt;的命令行中添加以下参数使新发布的表都默认使用事务：&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;--default-table-type=InnoDB&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;margin-right: auto; margin-left: auto; padding: 0px; word-break: break-all; word-wrap: break-word; color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 25px; white-space: normal; text-align: left; background-color: rgb(255, 255, 255);&quot;&gt;　　（4）临时改变默认表类型：&lt;/p&gt;&lt;ul style=&quot;list-style-type: none;&quot; class=&quot; list-paddingleft-2&quot;&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;set table_type=InnoDB&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p style=&quot;text-align: left;&quot;&gt;show variables like &amp;#39;table_type&amp;#39;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br style=&quot;text-align: left;&quot;/&gt;&lt;/p&gt;', 22, 1, 0, '2016-05-09 17:36:15', '2016-05-12 11:31:34', 'Hello World!', 'Hello World!', 60),
(4, 1, 'test2', '&lt;p&gt;MySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQLMySQL&lt;/p&gt;', 17, 0, 0, '2016-05-09 17:37:13', '2016-05-12 14:31:37', 'MySQL MySQL', 'MySQL MySQL MySQL', 0),
(5, 1, 'test3', '&lt;p&gt;环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境环境&lt;/p&gt;', 19, 1, 0, '2016-05-09 17:37:49', NULL, '环境环境环境环境环境环境环境环境', '环境环境环境环境环境环境', 50),
(6, 1, 'test5', '&lt;p&gt;test5&lt;/p&gt;', 1, 1, 0, '2016-05-09 17:38:38', NULL, 'test5', 'test5', 0),
(7, 1, 'test4', '&lt;p&gt;test4test4test4test4test4test4test4test4&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test4test4test4test4test4test4test4test4test4test4test4&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test4test4&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test4test4test4test4&lt;/p&gt;', 19, 1, 0, '2016-05-09 17:39:23', NULL, 'test4test4', 'test4test4test4', 0),
(8, 1, 'test8', '&lt;p&gt;test8test8test8test8test8&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test8test8&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test8test8&lt;/p&gt;', 1, 1, 0, '2016-05-09 17:39:50', NULL, 'test8test8test8', 'test8test8test8', 30),
(9, 1, 'test6', '&lt;p&gt;test6&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test6&lt;/p&gt;', 1, 1, 0, '2016-05-09 17:40:11', NULL, 'test6test6', 'test6test6', 0),
(10, 1, 'test7', '&lt;p&gt;test7test7&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test7test7&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test7test7&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test7test7&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test7test7&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test7test7&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;test7test7&lt;/p&gt;', 1, 1, 0, '2016-05-09 17:40:37', NULL, 'test7test7', 'test7test7', 0),
(11, 1, 'php截断带html字符串文章内容的方法', '&lt;p&gt;博客后台一般会在搜索页面或者列表页面给出文章标题和截断了的的文章部分作为进一步阅读的入口。&lt;/p&gt;&lt;p&gt;Function: mb_substr( $str, $start, $length, $encoding )&lt;/p&gt;&lt;p&gt;$str，需要截断的字符串&lt;br/&gt;$start，截断开始处&lt;br/&gt;$length，长度（注意，这个跟mb_strimwidth不同，1就代表一个中文字符）&lt;br/&gt;$encoding，编码，我设为 utf-8&lt;/p&gt;&lt;p&gt;例：截断文章标题，控制在15个文字&lt;/p&gt;&lt;p&gt;代码如下&lt;/p&gt;&lt;p&gt;&amp;lt;?php&amp;nbsp;echo&amp;nbsp;mb_substr(&amp;#39;www.111cn.net原创&amp;#39;,&amp;nbsp;0,&amp;nbsp;15,&amp;quot;utf-8&amp;quot;);&amp;nbsp;?&amp;gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;这样对于纯文本没问题，但是我的是中间有html标签的于是问题来了。怎样截断一篇文章。注意，这篇文章不仅仅是普通的字符串文本，而是包含了各种格式化标签和样式内容的文本。如果处理不当，这些闭合标签无法正常关闭，从而破坏整个文档流。&lt;/p&gt;&lt;p&gt;如果单纯是纯文本，下面这个函数差不多是够用的。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;代码如下&lt;/p&gt;&lt;p&gt;&amp;lt;?php&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;/**&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;字符串截取，支持中文和其他编码&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$str&amp;nbsp;需要转换的字符串&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$start&amp;nbsp;开始位置&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$length&amp;nbsp;截取长度&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$charset&amp;nbsp;编码格式&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$suffix&amp;nbsp;截断字符串后缀&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*&amp;nbsp;@return&amp;nbsp;string&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;*/&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;function&amp;nbsp;substr_ext($str,&amp;nbsp;$start=0,&amp;nbsp;$length,&amp;nbsp;$charset=&amp;quot;utf-8&amp;quot;,&amp;nbsp;$suffix=&amp;quot;&amp;quot;)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if(function_exists(&amp;quot;mb_substr&amp;quot;)){&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;mb_substr($str,&amp;nbsp;$start,&amp;nbsp;$length,&amp;nbsp;$charset).$suffix;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;elseif(function_exists(&amp;#39;&lt;br/&gt;iconv&lt;br/&gt;_substr&amp;#39;)){&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;iconv_substr($str,$start,$length,$charset).$suffix;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$re[&amp;#39;utf-8&amp;#39;]&amp;nbsp;&amp;nbsp;=&amp;nbsp;&amp;quot;/[x01-x7f]|[xc2-xdf][x80-xbf]|[xe0-xef][x80-xbf]{2}|[xf0-xff][x80-xbf]{3}/&amp;quot;;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$re[&amp;#39;gb2312&amp;#39;]&amp;nbsp;=&amp;nbsp;&amp;quot;/[x01-x7f]|[xb0-xf7][xa0-xfe]/&amp;quot;;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$re[&amp;#39;gbk&amp;#39;]&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;=&amp;nbsp;&amp;quot;/[x01-x7f]|[x81-xfe][x40-xfe]/&amp;quot;;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$re[&amp;#39;big5&amp;#39;]&amp;nbsp;&amp;nbsp;&amp;nbsp;=&amp;nbsp;&amp;quot;/[x01-x7f]|[x81-xfe]([x40-x7e]|xa1-xfe])/&amp;quot;;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br/&gt;preg_match&lt;br/&gt;_all($re[$charset],&amp;nbsp;$str,&amp;nbsp;$match);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$slice&amp;nbsp;=&amp;nbsp;join(&amp;quot;&amp;quot;,array_slice($match[0],&amp;nbsp;$start,&amp;nbsp;$length));&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;$slice.$suffix;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&lt;/p&gt;&lt;p&gt;但是，如果需要截断是网页中的某部分格式化文本，上面的函数就不够用了。它不具备处理格式化标签的能力。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;这时，需要一个新函数，它应该是以上函数的升级加强版，它必须有能力正确的处理标签,下面找到一个&lt;/p&gt;&lt;p&gt;strip_tags() 函数剥去 HTML、XML 以及 PHP 的标签。&lt;/p&gt;&lt;p&gt;例子 1&lt;/p&gt;&lt;p&gt;代码如下&lt;/p&gt;&lt;p&gt;&amp;lt;?php&lt;br/&gt;echo&amp;nbsp;strip_tags(&amp;quot;Hello&amp;nbsp;&amp;lt;b&amp;gt;world!&amp;lt;/b&amp;gt;&amp;quot;);&lt;br/&gt;?&amp;gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;输出：&lt;/p&gt;&lt;p&gt;Hello world!&lt;/p&gt;&lt;p&gt;这样就好做了我们只要在上面基础上如下操作&lt;/p&gt;&lt;p&gt;代码如下&lt;/p&gt;&lt;p&gt;&amp;lt;?php&lt;br/&gt;$a&amp;nbsp;=&amp;nbsp;strip_tags(&amp;quot;Hello&amp;nbsp;&amp;lt;b&amp;gt;world!&amp;lt;/b&amp;gt;&amp;quot;);substr_ext(&amp;nbsp;$a,10)&amp;nbsp;;&lt;br/&gt;//&amp;nbsp;但是发现html不见了这个也不是什么好的解决办法了。&lt;br/&gt;?&amp;gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;接着google 发现cns写了一个支持html截取字符串的函数&lt;br/&gt;&lt;/p&gt;&lt;p&gt;代码如下&lt;/p&gt;&lt;p&gt;/**&lt;br/&gt;&amp;nbsp;*&amp;nbsp;获取字符在字符串中第N次出现的位置&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$text&amp;nbsp;字符串&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$key&amp;nbsp;字符&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;int&amp;nbsp;$int&amp;nbsp;N&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@return&amp;nbsp;int&lt;br/&gt;&amp;nbsp;*/&lt;br/&gt;function&amp;nbsp;strpos_int($text,&amp;nbsp;$key,&amp;nbsp;$int)&lt;br/&gt;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$keylen&amp;nbsp;=&amp;nbsp;strlen($key);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;global&amp;nbsp;$textlen;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;(!$textlen)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$textlen&amp;nbsp;=&amp;nbsp;strlen($text);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;static&amp;nbsp;$textpos&amp;nbsp;=&amp;nbsp;0;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$pos&amp;nbsp;=&amp;nbsp;strpos($text,&amp;nbsp;$key);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$int--;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($pos)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($int&amp;nbsp;==&amp;nbsp;0)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$textpos+=$pos;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;else&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$textpos+=$pos&amp;nbsp;+&amp;nbsp;$keylen;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;else&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$int&amp;nbsp;=&amp;nbsp;0;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$textpos&amp;nbsp;=&amp;nbsp;$textlen;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($int&amp;nbsp;&amp;gt;&amp;nbsp;0)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;strpos_int(substr($text,&amp;nbsp;$pos&amp;nbsp;+&amp;nbsp;$keylen),&amp;nbsp;$key,&amp;nbsp;$int);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;$textpos;&lt;br/&gt;}&lt;br/&gt;&lt;br/&gt;/**&lt;br/&gt;&amp;nbsp;*&amp;nbsp;截取HTML&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$string&amp;nbsp;&amp;nbsp;HTML&amp;nbsp;字符串&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;int&amp;nbsp;$length&amp;nbsp;截取的长度&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$dot&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@param&amp;nbsp;string&amp;nbsp;$append&lt;br/&gt;&amp;nbsp;*&amp;nbsp;@return&amp;nbsp;string&lt;br/&gt;&amp;nbsp;*/&lt;br/&gt;function&amp;nbsp;cuthtml($string,&amp;nbsp;$length,&amp;nbsp;$dot&amp;nbsp;=&amp;nbsp;&amp;#39;&amp;nbsp;...&amp;#39;,&amp;nbsp;$append&amp;nbsp;=&amp;nbsp;&amp;quot;&amp;quot;)&lt;br/&gt;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$str&amp;nbsp;=&amp;nbsp;strip_tags($string);//先过滤标签&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$new_str&amp;nbsp;=&amp;nbsp;iconv_substr($str,&amp;nbsp;0,&amp;nbsp;$length,&amp;nbsp;&amp;#39;utf-8&amp;#39;);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$last&amp;nbsp;=&amp;nbsp;iconv_substr($new_str,&amp;nbsp;-1,&amp;nbsp;1,&amp;nbsp;&amp;#39;utf-8&amp;#39;);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$sc&amp;nbsp;=&amp;nbsp;substr_count($new_str,&amp;nbsp;$last);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$position&amp;nbsp;=&amp;nbsp;strpos_int($string,&amp;nbsp;$last,&amp;nbsp;$sc);&amp;nbsp;//获取截取真实的长度&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;(function_exists(&amp;#39;tidy_parse_string&amp;#39;))//服务器开启tidy的话&amp;nbsp;直接用函数不全html代码即可&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$options&amp;nbsp;=&amp;nbsp;array(&amp;quot;show-body-only&amp;quot;&amp;nbsp;=&amp;gt;&amp;nbsp;true);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;tidy_parse_string(mb_substr($string,&amp;nbsp;0,&amp;nbsp;$position)&amp;nbsp;.&amp;nbsp;$dot&amp;nbsp;.&amp;nbsp;$append,&amp;nbsp;$options,&amp;nbsp;&amp;#39;UTF8&amp;#39;);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;else&amp;nbsp;//没有开启tidy&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;(strlen($string)&amp;nbsp;&amp;lt;=&amp;nbsp;$position)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;$string;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$pre&amp;nbsp;=&amp;nbsp;chr(1);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$end&amp;nbsp;=&amp;nbsp;chr(1);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$string&amp;nbsp;=&amp;nbsp;str_replace(array(&amp;#39;&amp;amp;&amp;#39;,&amp;nbsp;&amp;#39;&amp;quot;&amp;#39;,&amp;nbsp;&amp;#39;&amp;lt;&amp;#39;,&amp;nbsp;&amp;#39;&amp;gt;&amp;#39;),&amp;nbsp;array($pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;amp;&amp;#39;&amp;nbsp;.&amp;nbsp;$end,&amp;nbsp;$pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;quot;&amp;#39;&amp;nbsp;.&amp;nbsp;$end,&amp;nbsp;$pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;lt;&amp;#39;&amp;nbsp;.&amp;nbsp;$end,&amp;nbsp;$pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;gt;&amp;#39;&amp;nbsp;.&amp;nbsp;$end),&amp;nbsp;$string);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$strcut&amp;nbsp;=&amp;nbsp;&amp;#39;&amp;#39;;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;=&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;$noc&amp;nbsp;=&amp;nbsp;0;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;while&amp;nbsp;($n&amp;nbsp;&amp;lt;&amp;nbsp;strlen($string))&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$t&amp;nbsp;=&amp;nbsp;ord($string[$n]);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($t&amp;nbsp;==&amp;nbsp;9&amp;nbsp;||&amp;nbsp;$t&amp;nbsp;==&amp;nbsp;10&amp;nbsp;||&amp;nbsp;(32&amp;nbsp;&amp;lt;=&amp;nbsp;$t&amp;nbsp;&amp;amp;&amp;amp;&amp;nbsp;$t&amp;nbsp;&amp;lt;=&amp;nbsp;126))&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;1;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n++;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$noc++;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;elseif&amp;nbsp;(194&amp;nbsp;&amp;lt;=&amp;nbsp;$t&amp;nbsp;&amp;amp;&amp;amp;&amp;nbsp;$t&amp;nbsp;&amp;lt;=&amp;nbsp;223)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;+=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$noc&amp;nbsp;+=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;elseif&amp;nbsp;(224&amp;nbsp;&amp;lt;=&amp;nbsp;$t&amp;nbsp;&amp;amp;&amp;amp;&amp;nbsp;$t&amp;nbsp;&amp;lt;=&amp;nbsp;239)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;3;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;+=&amp;nbsp;3;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$noc&amp;nbsp;+=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;elseif&amp;nbsp;(240&amp;nbsp;&amp;lt;=&amp;nbsp;$t&amp;nbsp;&amp;amp;&amp;amp;&amp;nbsp;$t&amp;nbsp;&amp;lt;=&amp;nbsp;247)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;4;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;+=&amp;nbsp;4;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$noc&amp;nbsp;+=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;elseif&amp;nbsp;(248&amp;nbsp;&amp;lt;=&amp;nbsp;$t&amp;nbsp;&amp;amp;&amp;amp;&amp;nbsp;$t&amp;nbsp;&amp;lt;=&amp;nbsp;251)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;5;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;+=&amp;nbsp;5;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$noc&amp;nbsp;+=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;elseif&amp;nbsp;($t&amp;nbsp;==&amp;nbsp;252&amp;nbsp;||&amp;nbsp;$t&amp;nbsp;==&amp;nbsp;253)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$tn&amp;nbsp;=&amp;nbsp;6;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;+=&amp;nbsp;6;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$noc&amp;nbsp;+=&amp;nbsp;2;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&amp;nbsp;else&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n++;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($noc&amp;nbsp;&amp;gt;=&amp;nbsp;$position)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;break;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($noc&amp;nbsp;&amp;gt;&amp;nbsp;$position)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$n&amp;nbsp;-=&amp;nbsp;$tn;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$strcut&amp;nbsp;=&amp;nbsp;substr($string,&amp;nbsp;0,&amp;nbsp;$n);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$strcut&amp;nbsp;=&amp;nbsp;str_replace(array($pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;amp;&amp;#39;&amp;nbsp;.&amp;nbsp;$end,&amp;nbsp;$pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;quot;&amp;#39;&amp;nbsp;.&amp;nbsp;$end,&amp;nbsp;$pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;lt;&amp;#39;&amp;nbsp;.&amp;nbsp;$end,&amp;nbsp;$pre&amp;nbsp;.&amp;nbsp;&amp;#39;&amp;gt;&amp;#39;&amp;nbsp;.&amp;nbsp;$end),&amp;nbsp;array(&amp;#39;&amp;amp;&amp;#39;,&amp;nbsp;&amp;#39;&amp;quot;&amp;#39;,&amp;nbsp;&amp;#39;&amp;lt;&amp;#39;,&amp;nbsp;&amp;#39;&amp;gt;&amp;#39;),&amp;nbsp;$strcut);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$pos&amp;nbsp;=&amp;nbsp;strrpos($strcut,&amp;nbsp;chr(1));&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;if&amp;nbsp;($pos&amp;nbsp;!==&amp;nbsp;false)&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;{&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;$strcut&amp;nbsp;=&amp;nbsp;substr($strcut,&amp;nbsp;0,&amp;nbsp;$pos);&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;return&amp;nbsp;$strcut&amp;nbsp;.&amp;nbsp;$dot&amp;nbsp;.&amp;nbsp;$append;&lt;br/&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;}&lt;br/&gt;}&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 1, 1, 0, '2016-05-12 10:59:19', '2016-05-12 11:26:57', '', '', 0);

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
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序，由大到小排序',
  `display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导航链接类型：0，站外链接；1，站内链接',
  `created` datetime NOT NULL COMMENT '创建时间',
  `modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

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
(9, 'index', '已审核文章列表', 0, 1, '', 1, 0, 8, 3),
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
(43, 'index', '节点列表', 0, 1, '', 1, 0, 42, 3),
(44, 'searchContents', '搜索文章', 0, 1, '', 0, 0, 8, 3),
(45, 'noAuditList', '未审核文章列表', 0, 1, '', 1, 0, 8, 3);

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
(1, 'admin', 'admin', 'e1f1ee0cfcbb93ea2ffe9e44df18395c', '123@11.cc', '13750505530', 16, 1459873044, 1463018884, '0.0.0.0', 1, ''),
(2, 'user', '管理员', '2dcfd9424307baf88a78d67b4b075fd1', '853779003@qq.com', '13750505530', 4, 1461640266, 1461721093, '0.0.0.0', 1, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
