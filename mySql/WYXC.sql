-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-04-29 05:07:26
-- 服务器版本： 10.1.10-MariaDB
-- PHP Version: 7.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WYXC`
--

-- --------------------------------------------------------

--
-- 表的结构 `userInfo`
--

CREATE TABLE `userInfo` (
  `id` bigint(255) NOT NULL,
  `loginId` varchar(255) NOT NULL,
  `name` varchar(512) NOT NULL,
  `nickname` varchar(512) NOT NULL,
  `sex` varchar(512) NOT NULL,
  `avatar` varchar(512) NOT NULL,
  `token` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL,
  `userType` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;



--
-- 转存表中的数据 `userInfo`
--

INSERT INTO `userInfo` (`id`, `loginId`, `name`, `nickname`, `sex`, `avatar`, `token`, `password`, `userType`) VALUES
(1, '13660249975', '李征宇', '风莫逆', '男', '', '123', 'lizhengyu', '1'),
(2, '13613018736', 'limiaohui', '', '男', '', '', '123', '1'),
(3, '1', '1', '', '', '', '123', '1', '1'),
(4, 'q', 'q', '', 'NAN', '', '', 'q', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userInfo`
--
ALTER TABLE `userInfo`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `userInfo`
--
ALTER TABLE `userInfo`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
