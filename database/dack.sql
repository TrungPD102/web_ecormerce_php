-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2021 lúc 05:59 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dack`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'OLYM PIANUS'),
(2, 'ORIENT'),
(3, 'BENTLEY'),
(4, 'OGIVAL'),
(5, 'CITIZEN'),
(6, 'SR WATCH');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Đồng Hồ Nam'),
(2, 'Đồng Hồ Nữ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'trung@gmail.com'),
(5, 'trung1012@gmail.com'),
(6, 'trungherok@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Trung pham', 'trung1012@gmail.com', 'Lệ Thủy', 'QB', 'VietNam', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'pham Trung', 'trungherok@gmail.com', 'Lệ thủy', 'VN', 'vietnam', 578962, 'sdfdfsgsd', '3524 5678 5986 5651', '12/12', 1, 7390, 5678);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 3, 1, 7390);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP89322GSK-T', 3130, 'ĐỒNG HỒ OLYM PIANUS OP89322GSK-T', 'olym-pianus-op89322gsk-t_1636084476.jpg', 'olym-pianus'),
(2, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP990-083AMSK-T', 5320, 'ĐỒNG HỒ OLYM PIANUS OP990-083AMSK-T', 'olym-pianus-op990-083amsk-t_1621846793.jpg', 'olym-pianus'),
(3, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP99141-71AGSK-T-CV', 7390, 'ĐỒNG HỒ OLYM PIANUS OP99141-71AGSK-T-CV', 'olym-pianus-op99141-71agsk-t-cv_1622713642.jpg', 'olym-pianus'),
(4, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP990-45ADDGS-GL-T', 8200, 'ĐỒNG HỒ OLYM PIANUS OP990-45ADDGS-GL-T', 'olym-pianus-op990-45addgs-gl-t_1625453596.jpg', 'olym-pianus'),
(5, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP990-163AMSK-T', 5520, 'ĐỒNG HỒ OLYM PIANUS OP990-163AMSK-T', 'olym-pianus-op990-163amsk-t_1625477061.jpg', 'olym-pianus'),
(6, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP990-389AMSK-T', 5750, 'ĐỒNG HỒ OLYM PIANUS OP990-389AMSK-T', 'dong-ho-olym-pianus-op990-389amsk-t_1636083715.jpg', 'olym-pianus'),
(7, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP990-133AMSK-T', 5410, 'ĐỒNG HỒ OLYM PIANUS OP990-133AMSK-T', 'olym-pianus-op990-133amsk-t_1637911191.jpg', 'olym-pianus'),
(8, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP990-083AMK-T', 5320, 'ĐỒNG HỒ OLYM PIANUS OP990-083AMK-T', 'dong-ho-olym-pianus-op990-083amk-t_1587116166.jpg', 'olym-pianus'),
(9, 1, 1, 'ĐỒNG HỒ OLYM PIANUS OP99141-71AGS-GL-T-CV', 6990, 'ĐỒNG HỒ OLYM PIANUS OP99141-71AGS-GL-T-CV', 'olym-pianus-op99141-71ags-gl-t-cv_1621927491.jpg', 'olym-pianus'),
(10, 1, 2, 'ĐỒNG HỒ ORIENT FAC00007W0', 6520, 'ĐỒNG HỒ ORIENT FAC00007W0', 'orient-bambino-gen2-fac00007w0-1_1626253787.jpg', 'orient'),
(11, 1, 2, 'ĐỒNG HỒ ORIENT RE-AV0B05E00B', 23370, 'ĐỒNG HỒ ORIENT RE-AV0B05E00B', 'dng-ho-orient-re-av0b05e00b_1633060485.jpg', 'orient'),
(12, 1, 2, 'ĐỒNG HỒ ORIENT FAG00003W0', 6900, 'ĐỒNG HỒ ORIENT FAG00003W0', 'dong-ho-orient-fag00003w0_1625556099.jpg', 'orient'),
(13, 1, 2, 'ĐỒNG HỒ ORIENT FAG02002W0', 6260, 'ĐỒNG HỒ ORIENT FAG02002W0', 'orient-esteem-fag02002w0-1_1626254111.jpg', 'orient'),
(14, 1, 2, 'ĐỒNG HỒ ORIENT RE-AT0004S00B', 17540, 'ĐỒNG HỒ ORIENT RE-AT0004S00B', 'orient-star-semi-skeleton-re-at0004s00b_1563785757.jpg', 'orient'),
(15, 1, 2, 'ĐỒNG HỒ ORIENT FAC00009W0', 6330, 'ĐỒNG HỒ ORIENT FAC00009W0', 'dong-ho-orient-fac00009w0-14_1587626018.jpg', 'orient'),
(16, 1, 2, 'ĐỒNG HỒ ORIENT FAG00002W0', 7440, 'ĐỒNG HỒ ORIENT FAG00002W0', 'orient-caballero-fag00002w0-1_1626254032.jpg', 'orient'),
(17, 1, 2, 'ĐỒNG HỒ ORIENT RA-AS0102S10B', 9900, 'ĐỒNG HỒ ORIENT RA-AS0102S10B', 'dong-ho-orient-sun-and-moon-ra-as0102s10b_1625556772.jpg', 'orient'),
(19, 1, 2, 'ĐỒNG HỒ ORIENT FAG03001D0-TTWatch', 7990, 'ĐỒNG HỒ ORIENT FAG03001D0', 'orient-fag03001d0_1621847166.jpg', 'orient'),
(20, 1, 3, 'ĐỒNG HỒ BENTLEY BL1831-25MTWI-AMSK-T', 6550, 'ĐỒNG HỒ BENTLEY BL1831-25MTWI-AMSK-T', 'bl1831-25mtwi-amsk-t-avatar_1620789814.jpg', 'bentley'),
(21, 1, 3, 'ĐỒNG HỒ BENTLEY BL1869-101MWWB-DMS-GL-T', 3970, 'ĐỒNG HỒ BENTLEY BL1869-101MWWB-DMS-GL-T', 'bl1869-101mwwb-dms-gl-t-avatar_1620793858.jpg', 'bentley'),
(22, 1, 3, 'ĐỒNG HỒ BENTLEY BL1805-101BKWD-MK-GL-T', 2500, 'ĐỒNG HỒ BENTLEY BL1805-101BKWD-MK-GL-T', 'bl1805-101bkwd-mk-gl-t-avatar_1620788406.jpg', 'bentley'),
(23, 1, 3, 'ĐỒNG HỒ BENTLEY BL1832-25MWNN-AMS-GL-X', 5550, 'ĐỒNG HỒ BENTLEY BL1832-25MWNN-AMS-GL-X', 'bl1832-25mwnn-ams-gl-x-avatar_1620790259.jpg', 'bentley'),
(24, 1, 3, 'ĐỒNG HỒ BENTLEY BL1696-20WNA-MS-X', 6270, 'ĐỒNG HỒ BENTLEY BL1696-20WNA-MS-X', 'bently-bl1696-20wna-ms-x_1568628575.jpg', 'bentley'),
(25, 1, 3, 'ĐỒNG HỒ BENTLEY BL1805-20MKWD-MK-GL-T', 2780, 'ĐỒNG HỒ BENTLEY BL1805-20MKWD-MK-GL-T', 'bentley-bl1805-20mkwd-mk-gl-t_1637375653.jpg', 'bentley'),
(27, 1, 3, 'ĐỒNG HỒ BENTLEY BL1850-15MWNN-AMS-GL-X', 7750, 'ĐỒNG HỒ BENTLEY BL1850-15MWNN-AMS-GL-X', 'bentley-bl1850-15mwnn-ams-gl-x_1589009673.jpg', 'bentley'),
(32, 1, 3, 'ĐỒNG HỒ BENTLEY BL1832-25MKWI-AMK-T', 6140, 'ĐỒNG HỒ BENTLEY BL1832-25MKWI-AMK-T', 'bently-bl1832-25mkwi-amk-t_1568692988.jpg', 'bentley'),
(33, 1, 3, 'ĐỒNG HỒ BENTLEY BL1831-25MKWD-AMK-GL-T', 6320, 'ĐỒNG HỒ BENTLEY BL1831-25MKWD-AMK-GL-T', 'dong-ho-bentley-bl1831-25mkwd-amk-gl-t_1638170116.jpg', 'bentley'),
(34, 1, 4, 'ĐỒNG HỒ OGIVAL OG1929-24AGSR-T', 16970, 'ĐỒNG HỒ OGIVAL OG1929-24AGSR-T', 'ogival-og1929-24agsr-t-avatar_1620718218.jpg', 'ogival'),
(35, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.61AMR-GL', 20780, 'ĐỒNG HỒ OGIVAL OG358.61AMR-GL', 'ogival-og35861amr-gl_1622714219.jpg', 'ogival'),
(36, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.652AGSR-T', 28260, 'ĐỒNG HỒ OGIVAL OG358.652AGSR-T', 'ogival-og358652agsr-t-avatar_1620718017.jpg', 'ogival'),
(37, 1, 4, 'ĐỒNG HỒ OGIVAL OG1930MSR-T', 8420, 'ĐỒNG HỒ OGIVAL OG1930MSR-T', 'dong-ho-ogival-og1930msr-t_1587115148.jpg', 'ogival'),
(38, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.652AGR-GL', 28000, 'ĐỒNG HỒ OGIVAL OG358.652AGR-GL', 'ogival-og358652agr-gl_1622714099.jpg', 'ogival'),
(39, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.88A42GR-GL', 34100, 'ĐỒNG HỒ OGIVAL OG358.88A42GR-GL', 'ogival-og35888a42gr-gl-avatar_1627036455.jpg', 'ogival'),
(40, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.88AGR-GL', 34100, 'ĐỒNG HỒ OGIVAL OG358.88AGR-GL', 'm11_1621210702.jpg', 'ogival'),
(45, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.66AGR-GL', 27600, 'ĐỒNG HỒ OGIVAL OG358.66AGR-GL', 'ogival-og35866agr-gl-avatar_1620717128.jpg', 'ogival'),
(46, 1, 4, 'ĐỒNG HỒ OGIVAL OG358.56AG42R-GL', 26950, 'ĐỒNG HỒ OGIVAL OG358.56AG42R-GL', 'ogival-og35856ag42r-gl_1622714278.jpg', 'ogival'),
(47, 1, 5, 'ĐỒNG HỒ CITIZEN NH8395-00E    ', 9077, 'ĐỒNG HỒ CITIZEN NH8395-00E', 'dong-ho-citizen-nh8395-00e_1626421344.jpg', 'citizen'),
(48, 1, 5, 'ĐỒNG HỒ CITIZEN NH8390-71L', 8177, 'ĐỒNG HỒ CITIZEN NH8390-71L', 'citizen-nh8390-71l_1621846727.jpg', 'citizen'),
(49, 1, 5, 'ĐỒNG HỒ CITIZEN NH8390-11X', 8177, 'ĐỒNG HỒ CITIZEN NH8390-11X', 'citizen-nh8390-11x_1621846677.jpg', 'citizen'),
(50, 1, 5, 'ĐỒNG HỒ CITIZEN NH8350-59A', 5250, 'ĐỒNG HỒ CITIZEN NH8350-59A', 'citizen-nh8350-59a_1621846544.jpg', 'citizen'),
(51, 1, 5, 'ĐỒNG HỒ CITIZEN BM7330-67L', 6930, 'ĐỒNG HỒ CITIZEN BM7330-67L', 'citizen-bm7330-67l_1621846445.jpg', 'citizen'),
(52, 1, 5, 'ĐỒNG HỒ CITIZEN NH8353-00H', 5500, 'ĐỒNG HỒ CITIZEN NH8353-00H', 'citizen-nh8353-00h_1621846624.jpg', 'citizen'),
(53, 1, 5, 'ĐỒNG HỒ CITIZEN BE9170-56A', 3700, 'ĐỒNG HỒ CITIZEN BE9170-56A', 'citizen-be9170-56a_1621845941.jpg', 'citizen'),
(54, 1, 5, 'ĐỒNG HỒ CITIZEN NH8350-59B', 5520, 'ĐỒNG HỒ CITIZEN NH8350-59B', 'citizen-nh8350-59b_1621846587.jpg', 'citizen'),
(55, 1, 5, 'ĐỒNG HỒ CITIZEN NY4053-05A', 8775, 'ĐỒNG HỒ CITIZEN NY4053-05A', 'citizen-ny4053-05a_1621846483.jpg', 'citizen'),
(56, 1, 6, 'ĐỒNG HỒ SRWATCH SG99991.4602GLA', 8950, 'ĐỒNG HỒ SRWATCH SG99991.4602GLA', 'srwatch-sg999914602gla_1622171512.jpg', 'srwatch'),
(57, 1, 6, 'ĐỒNG HỒ SRWATCH SG2089.4102RNT', 2900, 'ĐỒNG HỒ SRWATCH SG2089.4102RNT', 'srwatch-sg20894102rnt_1621847707.jpg', 'srwatch'),
(58, 1, 6, 'ĐỒNG HỒ SRWATCH SG8886.4103AT', 3700, 'ĐỒNG HỒ SRWATCH SG8886.4103AT', 'dong-ho-srwatch-sg88864103at_1576050992.jpg', 'srwatch'),
(59, 1, 6, 'ĐỒNG HỒ SRWATCH SG99991.4102GLA', 8650, 'ĐỒNG HỒ SRWATCH SG99991.4102GLA', 'srwatch-sg999914102gla_1622171367.jpg', 'srwatch'),
(60, 1, 6, 'ĐỒNG HỒ SRWATCH SG1076.1101TE', 1650, 'ĐỒNG HỒ SRWATCH SG1076.1101TE', 'srwatch-sg10761101te_1621847648.jpg', 'srwatch'),
(61, 1, 6, 'ĐỒNG HỒ SRWATCH SG99993.4102GLA', 9650, 'ĐỒNG HỒ SRWATCH SG99993.4102GLA', 'srwatch-sg999934102gla_1622171691.jpg', 'srwatch'),
(62, 1, 6, 'ĐỒNG HỒ SRWATCH SG99993.4603GLA', 9950, 'ĐỒNG HỒ SRWATCH SG99993.4603GLA', 'srwatch-sg999934603gla_1622171898.jpg', 'srwatch'),
(63, 1, 6, 'ĐỒNG HỒ SRWATCH SG99993.4601GLA', 9950, 'ĐỒNG HỒ SRWATCH SG99993.4601GLA', 'srwatch-sg999934601gla_1622171767.jpg', 'srwatch'),
(64, 1, 6, 'ĐỒNG HỒ SRWATCH SG99991.4601GLA', 8950, 'ĐỒNG HỒ SRWATCH SG99991.4601GLA', 'srwatch-sg999914601gla_1622171443.jpg', 'srwatch'),
(65, 2, 1, 'ĐỒNG HỒ OLYM PIANUS OP24591DLK-T', 3940, 'ĐỒNG HỒ OLYM PIANUS OP24591DLK-T', 'dong-ho-olym-pianus-op24591dlk-t_1633949067.jpg', 'olym-pianus'),
(66, 2, 1, 'ĐỒNG HỒ OLYM PIANUS OP24591DLSK-T', 3940, 'ĐỒNG HỒ OLYM PIANUS OP24591DLSK-T', 'dong-ho-olym-pianus-op24591dlsk-t_1633949289.jpg', 'olym-pianus'),
(67, 2, 1, 'ĐỒNG HỒ OLYM PIANUS OP2467LK-T', 3280, 'ĐỒNG HỒ OLYM PIANUS OP2467LK-T', 'dong-ho-olym-pianus-op2467lk-t_1633948253.jpg', 'olym-pianus'),
(68, 2, 1, 'ĐỒNG HỒ OLYMPIA STAR OPA58012DLSK-T', 5100, 'ĐỒNG HỒ OLYMPIA STAR OPA58012DLSK-T', 'olympia-star-opa58012dlsk-t-1_1625820451.jpg', 'olym-pianus'),
(69, 2, 1, 'ĐỒNG HỒ OLYM PIANUS OP68322DSK-T', 3980, 'ĐỒNG HỒ OLYM PIANUS OP68322DSK-T', 'dong-ho-olym-pianus-op68322dsk-t_1633949647.jpg', 'olym-pianus'),
(70, 2, 1, 'ĐỒNG HỒ OLYMPIA STAR OPA28025DLSK-T', 4670, 'ĐỒNG HỒ OLYMPIA STAR OPA28025DLSK-T', 'dong-ho-olumpia-star-opa28025dlsk-t_1633992301.jpg', 'olym-pianus'),
(71, 2, 1, 'ĐỒNG HỒ OLYMPIA STAR OPA28019DLK-T', 5410, 'ĐỒNG HỒ OLYMPIA STAR OPA28019DLK-T', 'dong-ho-op-opa28019dlk-t-avatar_1634008344.jpg', 'olym-pianus'),
(72, 2, 1, 'ĐỒNG HỒ OLYMPIA STAR OPA55958DLSK-T', 4400, 'ĐỒNG HỒ OLYMPIA STAR OPA55958DLSK-T', 'dong-ho-olympia-star-opa55958dlsk-t_1633992580.jpg', 'olym-pianus'),
(73, 2, 1, 'ĐỒNG HỒ OLYMPIA STAR OPA28032DLK-T', 4550, 'ĐỒNG HỒ OLYMPIA STAR OPA28032DLK-T', 'olympia-star-opa28032dlk-t-1_1625820317.jpg', 'olym-pianus'),
(74, 2, 2, 'ĐỒNG HỒ ORIENT RA-KB0004A10B', 6700, 'ĐỒNG HỒ ORIENT RA-KB0004A10B', 'dong-ho-orient-ra-kb0004a10b_1608172908.jpg', 'orient'),
(75, 2, 2, 'ĐỒNG HỒ ORIENT RA-KB0003S10B', 6700, 'ĐỒNG HỒ ORIENT RA-KB0003S10B', 'dong-ho-orient-ra-kb0003s10b_1608172760.jpg', 'orient'),
(76, 2, 2, 'ĐỒNG HỒ ORIENT SE RA-AG0726S00B', 10800, 'ĐỒNG HỒ ORIENT SE RA-AG0726S00B', 'orient1010-ra-ag0726s00b_1577259666.jpg', 'orient'),
(77, 2, 2, 'ĐỒNG HỒ ORIENT FUNG7002W0\r\n', 4360, 'ĐỒNG HỒ ORIENT FUNG7002W0\r\n', 'fung7002w0.jpg', 'orient'),
(78, 2, 2, 'ĐỒNG HỒ ORIENT RA-KA0003S00B', 8080, 'ĐỒNG HỒ ORIENT RA-KA0003S00B', '1-145.jpg', 'orient'),
(79, 2, 2, 'ĐỒNG HỒ ORIENT RA-AG0020S10B CHÍNH HÃNG', 8530, 'ĐỒNG HỒ ORIENT RA-AG0020S10B CHÍNH HÃNG', '1-129.jpg', 'orient'),
(80, 2, 2, 'ĐỒNG HỒ ORIENT RA-AG0017Y10B', 7440, 'ĐỒNG HỒ ORIENT RA-AG0017Y10B', 'dong-ho-orient-ra-ag0017y10b_1574666630.jpg', 'orient'),
(81, 2, 2, 'ĐỒNG HỒ ORIENT RA-KA0004L00B', 7350, 'ĐỒNG HỒ ORIENT RA-KA0004L00B', '1-146.jpg', 'orient'),
(82, 2, 2, 'ĐỒNG HỒ ORIENT FAC0A005T0-TTWatch', 6810, 'ĐỒNG HỒ ORIENT FAC0A005T0', 'dong-ho-orient-fac0a005t0-2_1588749021.jpg', 'orient'),
(83, 2, 3, 'ĐỒNG HỒ BENTLEY BL1868-201LRWI-LR-T', 3960, 'ĐỒNG HỒ BENTLEY BL1868-201LRWI-LR-T', 'dong-ho-bentley-bl1868-201lrwi-lr-t_1633946680.jpg', 'bentley'),
(84, 2, 3, 'ĐỒNG HỒ BENTLEY BL1855-10LTCI-R-LSR-T', 4050, 'ĐỒNG HỒ BENTLEY BL1855-10LTCI-R-LSR-T', 'bently-bl1855-10ltci-r-lsr-t_1568695395.jpg', 'bentley'),
(85, 2, 3, 'ĐỒNG HỒ BENTLEY BL1855-10LTCI-LSK-T', 4050, 'ĐỒNG HỒ BENTLEY BL1855-10LTCI-LSK-T', 'bentley-bl1855-10ltci-lsk-t_1614763341.jpg', 'bentley'),
(86, 2, 3, 'ĐỒNG HỒ BENTLEY BL1805-20LKID-LK-GL-V', 2500, 'ĐỒNG HỒ BENTLEY BL1805-20LKID-LK-GL-V', 'bentley-bl1805-20lkid-lk-gl-v_1619075784.jpg', 'bentley'),
(87, 2, 3, 'ĐỒNG HỒ BENTLEY BL1859-102LRDI-LR-N', 2820, 'ĐỒNG HỒ BENTLEY BL1859-102LRDI-LR-N', 'bl1859-102lrdi-lr-n_1581324006.jpg', 'bentley'),
(88, 2, 3, 'ĐỒNG HỒ BENTLEY BL1815-101BKII-DLK-V', 4910, 'ĐỒNG HỒ BENTLEY BL1815-101BKII-DLK-V', 'bently-bl1815-101bkii-dlk-v_1568687233.jpg', 'bentley'),
(89, 2, 3, 'ĐỒNG HỒ BENTLEY BL1853-10LTCA-R-LSR-T', 3820, 'ĐỒNG HỒ BENTLEY BL1853-10LTCA-R-LSR-T', 'bently-bl1853-10ltca-r-lsr-t_1568694584.jpg', 'bentley'),
(90, 2, 3, 'ĐỒNG HỒ BENTLEY BL1827-101LKCI-DLK-T', 3770, 'ĐỒNG HỒ BENTLEY BL1827-101LKCI-DLK-T', 'bently-bl1827-101lkci-dlk-t_1568687727.jpg', 'bentley'),
(91, 2, 3, 'ĐỒNG HỒ BENTLEY BL1867-102LTWI-SR-LSR-T', 3910, 'ĐỒNG HỒ BENTLEY BL1867-102LTWI-SR-LSR-T', 'bl1867-102ltwi-sr-lsr-t_1581324524.jpg', 'bentley'),
(92, 2, 4, 'ĐỒNG HỒ OGIVAL OG1930LSRT', 8420, 'ĐỒNG HỒ OGIVAL OG1930LSR-T', 'dong-ho-ogival-og1930lsr-t_1633947969.jpg', 'ogival'),
(93, 2, 4, 'ĐỒNG HỒ OGIVAL OG386LSK-T', 11820, 'ĐỒNG HỒ OGIVAL OG386LSK-T', 'dong-ho-ogival-og386lsk-t_1633947620.jpg', 'ogival'),
(94, 2, 4, 'ĐỒNG HỒ OGIVAL OG3811DLK-T', 13530, 'ĐỒNG HỒ OGIVAL OG3811DLK-T', 'og3811dlk-t.jpg', 'ogival'),
(95, 2, 4, 'ĐỒNG HỒ OGIVAL OG3862DLK-T', 15680, 'ĐỒNG HỒ OGIVAL OG3862DLK-T', 'og3862dlk-t.jpg', 'ogival'),
(96, 2, 4, 'ĐỒNG HỒ OGIVAL OG30328L29SK-T', 19970, 'ĐỒNG HỒ OGIVAL OG30328L29SK-T', 'og30328l29sk-t-avatar_1566980534.jpg', 'ogival'),
(97, 2, 4, 'ĐỒNG HỒ OGIVAL OG377DLK-V-COC', 15210, 'ĐỒNG HỒ OGIVAL OG377DLK-V-COC', 'og377dlk-v-coc-min.jpg', 'ogival'),
(98, 2, 4, 'ĐỒNG HỒ OGIVAL OG385-032LSK-T', 9230, 'ĐỒNG HỒ OGIVAL OG385-032LSK-T', 'avatarog385-032lsk-t1.jpg', 'ogival'),
(99, 2, 4, 'ĐỒNG HỒ OGIVAL OG303291LK-V', 31920, 'ĐỒNG HỒ OGIVAL OG303291LK-V', 'og30329lk-v-min.jpg', 'ogival'),
(100, 2, 4, 'ĐỒNG HỒ OGIVAL OG377DLW-T-COC CHÍNH HÃNG', 15210, 'ĐỒNG HỒ OGIVAL OG377DLW-T-COC CHÍNH HÃNG', 'avt_og377dlw-t-coc.png', 'ogival'),
(101, 2, 5, 'ĐỒNG HỒ CITIZEN EW2483-85B', 6670, 'ĐỒNG HỒ CITIZEN EW2483-85B', 'dong-ho-citizen-ew2483-85b-1_1588837663.jpg', 'citizen'),
(102, 2, 5, 'ĐỒNG HỒ CITIZEN EW2310-59E-TTWatch', 9100, 'ĐỒNG HỒ CITIZEN EW2310-59E', 'avatar-ew2310-59e.png', 'citizen'),
(103, 2, 5, 'ĐỒNG HỒ CITIZEN FE6124-85A-TTwatch', 5300, 'ĐỒNG HỒ CITIZEN FE6124-85A', '1-14.jpg', 'citizen'),
(104, 2, 5, 'ĐỒNG HỒ CITIZEN FE6141-86A', 6200, 'ĐỒNG HỒ CITIZEN FE6141-86A', '1-12.jpg', 'citizen'),
(105, 2, 5, 'ĐỒNG HỒ CITIZEN EW3254-87A', 8600, 'ĐỒNG HỒ CITIZEN EW3254-87A', '1-43.jpg', 'citizen'),
(106, 2, 5, 'ĐỒNG HỒ CITIZEN EM0674-81A', 9200, 'ĐỒNG HỒ CITIZEN EM0674-81A', '1-63.jpg', 'citizen'),
(107, 2, 5, 'ĐỒNG HỒ CITIZEN ER0203-51E', 3520, 'ĐỒNG HỒ CITIZEN ER0203-51E', 'er0203-51e-ava-min.jpg', 'citizen'),
(108, 2, 5, 'ĐỒNG HỒ CITIZEN EM0631-83D', 6550, 'ĐỒNG HỒ CITIZEN EM0631-83D', 'em0631-83d-ava.jpg', 'citizen'),
(109, 2, 5, 'ĐỒNG HỒ CITIZEN PC1003-58X', 12500, 'ĐỒNG HỒ CITIZEN PC1003-58X', 'pc1003-58x-1.jpg', 'citizen'),
(110, 2, 6, 'ĐỒNG HỒ SRWATCH SL1072.1102TE', 1650, 'ĐỒNG HỒ SRWATCH SL1072.1102TE', 'dong-ho-srwatch-sl1072_1625557548.jpg', 'srwatch'),
(111, 2, 6, 'ĐỒNG HỒ SRWATCH SL5006.4102BL', 2650, 'ĐỒNG HỒ SRWATCH SL5006.4102BL', 'dong-ho-srwatch-sl50064102bl_1633993221.jpg', 'srwatch'),
(112, 2, 6, 'ĐỒNG HỒ SRWATCH SL3007.4101CV', 900, 'ĐỒNG HỒ SRWATCH SL3007.4101CV', 'dong-ho-srwatch-sl30074101_1633993018.jpg', 'srwatch'),
(113, 2, 6, 'ĐỒNG HỒ SRWATCH SL99993.4102GLA', 7650, 'ĐỒNG HỒ SRWATCH SL99993.4102GLA', 'srwatch-sl999934102gla_1622171969.jpg', 'srwatch'),
(114, 2, 6, 'ĐỒNG HỒ SRWATCH SL99993.4602GLA', 7950, 'ĐỒNG HỒ SRWATCH SL99993.4602GLA', 'srwatch-sl999934602gla_1622172110.jpg', 'srwatch'),
(115, 2, 6, 'ĐỒNG HỒ SRWATCH SL99993.4603GLA', 7950, 'ĐỒNG HỒ SRWATCH SL99993.4603GLA', 'srwatch-sl999934603gla_1622172164.jpg', 'srwatch'),
(116, 2, 6, 'ĐỒNG HỒ SRWATCH SL5005.4102BL', 2650, 'ĐỒNG HỒ SRWATCH SL5005.4102BL', 'dong-ho-nu-srwatch-sl50054102bl_1612422527.jpg', 'srwatch'),
(117, 2, 6, 'ĐỒNG HỒ SRWATCH SL5005.4702BL', 2850, 'ĐỒNG HỒ SRWATCH SL5005.4702BL', 'dong-ho-nu-srwatch-sl50054702bl_1612423988.jpg', 'srwatch'),
(118, 2, 6, 'ĐỒNG HỒ SRWATCH SL2203.4302', 2900, 'ĐỒNG HỒ SRWATCH SL2203.4302', 'srwatch-sl22034302_1572335729.jpg', 'srwatch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'pham', 'Trung', 'trungsingapore@gmail.com', 'trung123', '0776272377', 'Quảng Bình', 'VN'),
(26, 'pham', 'Trung', 'trungherok@gmail.com', '123456789', '0776272377', 'Lệ thủy', 'VN'),
(27, 'sd', 'ada', '2512.minh@gmail.com', 'qưerty123', '1012200120', 'dgdsgs', 'gsdgfsd');

--
-- Bẫy `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'pham', 'Trung', 'trungherok@gmail.com', '123456789', '0776272377', 'Lệ thủy', 'VN'),
(27, 'sd', 'ada', '2512.minh@gmail.com', 'qưerty123', '1012200120', 'dgdsgs', 'gsdgfsd');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Các ràng buộc cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
