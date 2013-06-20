-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2013 at 02:04 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scrum`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_component`
--

CREATE TABLE IF NOT EXISTS `cms_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cms_componenttype_id` int(11) DEFAULT NULL,
  `config` text,
  `is_enabled` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `cms_component`
--

INSERT INTO `cms_component` (`id`, `name`, `cms_componenttype_id`, `config`, `is_enabled`) VALUES
(1, 'Welcome', 1, 'YToxOntzOjQ6InRleHQiO3M6NTQ6InNhb3RlaHVzYW9odQ0KYW9ldSBzYW90bmV1aCBzbm9lDQp1YW8NCmV1DQoNCg0KPGI+dGVzdCI7fQ==', 'Y'),
(2, 'Test2', 1, 'YToxOntzOjQ6InRleHQiO3M6OToiYW9ldWF1YW91Ijt9', 'Y'),
(3, 'Article', 3, 'YToyOntzOjc6ImNvbnRlbnQiO3M6MTI2OiI8aDE+PGltZyBzcmM9Ii9pbWcvNiI+SGVsbG8gV29ybGQ8L2gxPjxkaXY+YW9ldWFvdWFvZXVhb2V1PC9kaXY+PGRpdj5vYWV1PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5vZWF1PC9kaXY+ICAiO3M6NjoiaW1hZ2VzIjtzOjE6IjYiO30=', 'Y'),
(4, 'Test', 1, 'YToxOntzOjQ6InRleHQiO3M6MjU6IldlbGNvbWUgdG8gTG9zdCBhbmQgRk91bmQiO30=', 'Y'),
(5, 'test_crud', 2, 'YTo3OntzOjU6Im1vZGVsIjtzOjQ6Ikl0ZW0iO3M6ODoicGFnaW5hdGUiO3M6MDoiIjtzOjExOiJncmlkX2ZpZWxkcyI7czowOiIiO3M6MTE6ImZvcm1fZmllbGRzIjtzOjA6IiI7czo3OiJjYW5fYWRkIjtpOjE7czo4OiJjYW5fZWRpdCI7aTowO3M6MTA6ImNhbl9kZWxldGUiO2k6MDt9', 'Y'),
(6, 'tetete', 2, 'YTo3OntzOjU6Im1vZGVsIjtzOjc6IkNvdW50cnkiO3M6ODoicGFnaW5hdGUiO3M6MjoiMTAiO3M6MTE6ImdyaWRfZmllbGRzIjtzOjA6IiI7czoxMToiZm9ybV9maWVsZHMiO3M6MDoiIjtzOjc6ImNhbl9hZGQiO2k6MTtzOjg6ImNhbl9lZGl0IjtpOjE7czoxMDoiY2FuX2RlbGV0ZSI7aToxO30=', 'Y'),
(7, 'cucu bau', 3, NULL, 'Y'),
(8, 'a', 3, NULL, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `cms_componenttype`
--

CREATE TABLE IF NOT EXISTS `cms_componenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cms_componenttype`
--

INSERT INTO `cms_componenttype` (`id`, `name`, `class`) VALUES
(1, 'Text', 'cms/Cms_Text'),
(2, 'CRUD', 'cms/Cms_CRUD'),
(3, 'What you see is  what you get', 'cms/Cms_Html');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `api_layout` varchar(255) DEFAULT NULL,
  `page_layout` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`id`, `name`, `api_layout`, `page_layout`) VALUES
(1, 'cms/test', NULL, NULL),
(2, 'index', NULL, NULL),
(3, 'cms/testa', NULL, NULL),
(4, 'cms/testd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pagecomponent`
--

CREATE TABLE IF NOT EXISTS `cms_pagecomponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cms_page_id` int(11) DEFAULT NULL,
  `cms_component_id` int(11) DEFAULT NULL,
  `template_spot` text,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `cms_pagecomponent`
--

INSERT INTO `cms_pagecomponent` (`id`, `cms_page_id`, `cms_component_id`, `template_spot`, `ord`) VALUES
(1, 1, 1, 'Content', NULL),
(3, 1, 3, 'Content', NULL),
(4, 2, 4, 'Content', NULL),
(5, 2, 5, 'Content', NULL),
(7, 3, 7, 'Content', NULL),
(8, 4, 8, 'Content', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_route`
--

CREATE TABLE IF NOT EXISTS `cms_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule` text,
  `target` text,
  `params` text,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cms_route`
--

INSERT INTO `cms_route` (`id`, `rule`, `target`, `params`, `ord`) VALUES
(1, '(cms\\/.*)', 'cms', 'cms_page', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_tag`
--

CREATE TABLE IF NOT EXISTS `cms_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `cms_tag_n` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user1` (`user_id`),
  KEY `fk_comment_item1` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `nume` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `companie` varchar(50) NOT NULL,
  `detalii` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`nume`, `email`, `telefon`, `companie`, `detalii`, `id`) VALUES
('Malus Alexandru', 'mitzu_alex2002@yahoo.com', '0', '', '', 1),
('45eytu', '456uy7ikl@', '0', '', '5ytiukl', 5),
('4r5ytu', 'tyukj', '0', '', '56u7i', 6),
('4r5yturtujkl', 'tyukj', '0', '', '56u7i', 7),
('ewrthfgh', 'rthgj', '0', '', 'ertjh,', 8),
('rthgrerfg', 'gh', '19', '', 'wefgbn ', 12),
('rtujhkertjh', 'rtyjhktyujh', '', '', 'rtytyuhj', 15),
('rtujhkertjh', 'rtyjhktyujh', 'rtghrty', '', 'rtytyuhj', 16),
('r4thkfdtgh', 'ertjh,', 'erth,', 'w3retjh,m', 'a', 18),
('r4thkfdtgh', 'ertjh,', 'erth,', 'w3retjh,m', 'aaaaaa', 19);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(8) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `eu_member` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=249 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `code`, `name`, `eu_member`) VALUES
(1, 'IE', 'Ireland', 1),
(2, 'UK', 'United Kingdom', 1),
(3, 'US', 'United States', 0),
(4, 'CH', 'Switzerland', 0),
(5, 'LV', 'Latvia', 1),
(6, 'RU', 'Russia', 0),
(7, '', 'United Kingdom Not EU', 0),
(8, 'AF', 'Afghanistan', 0),
(9, 'AX', '&ETH;', 0),
(10, 'AL', 'Albania', 0),
(11, 'DZ', 'Algeria', 0),
(12, 'AS', 'American Samoa', 0),
(13, 'AD', 'Andorra', 0),
(14, 'AO', 'Angola', 0),
(15, 'AI', 'Anguilla', 0),
(16, 'AQ', 'Antarctica', 0),
(17, 'AG', 'Antigua And Barbuda', 0),
(18, 'AR', 'Argentina', 0),
(19, 'AM', 'Armenia', 0),
(20, 'AW', 'Aruba', 0),
(21, 'AU', 'Australia', 0),
(22, 'AT', 'Austria', 1),
(23, 'AZ', 'Azerbaijan', 0),
(24, 'BS', 'Bahamas', 0),
(25, 'BH', 'Bahrain', 0),
(26, 'BD', 'Bangladesh', 0),
(27, 'BB', 'Barbados', 0),
(28, 'BY', 'Belarus', 0),
(29, 'BE', 'Belgium', 1),
(30, 'BZ', 'Belize', 0),
(31, 'BJ', 'Benin', 0),
(32, 'BM', 'Bermuda', 0),
(33, 'BT', 'Bhutan', 0),
(34, 'BO', 'Bolivia, Plurinational State Of', 0),
(35, 'BA', 'Bosnia And Herzegovina', 0),
(36, 'BW', 'Botswana', 0),
(37, 'BV', 'Bouvet Island', 0),
(38, 'BR', 'Brazil', 0),
(39, 'IO', 'British Indian Ocean Territory', 0),
(40, 'BN', 'Brunei Darussalam', 0),
(41, 'BG', 'Bulgaria', 1),
(42, 'BF', 'Burkina Faso', 0),
(43, 'BI', 'Burundi', 0),
(44, 'KH', 'Cambodia', 0),
(45, 'CM', 'Cameroon', 0),
(46, 'CA', 'Canada', 0),
(47, 'CV', 'Cape Verde', 0),
(48, 'KY', 'Cayman Islands', 0),
(49, 'CF', 'Central African Republic', 0),
(50, 'TD', 'Chad', 0),
(51, 'CL', 'Chile', 0),
(52, 'CN', 'China', 0),
(53, 'CX', 'Christmas Island', 0),
(54, 'CC', 'Cocos (keeling) Islands', 0),
(55, 'CO', 'Colombia', 0),
(56, 'KM', 'Comoros', 0),
(57, 'CG', 'Congo', 0),
(58, 'CD', 'Congo, The Democratic Republic Of The', 0),
(59, 'CK', 'Cook Islands', 0),
(60, 'CR', 'Costa Rica', 0),
(61, 'CI', 'C&ETH;&curren;te D''ivoire', 0),
(62, 'HR', 'Croatia', 0),
(63, 'CU', 'Cuba', 0),
(64, 'CY', 'Cyprus', 1),
(65, 'CZ', 'Czech Republic', 1),
(66, 'DK', 'Denmark', 1),
(67, 'DJ', 'Djibouti', 0),
(68, 'DM', 'Dominica', 0),
(69, 'DO', 'Dominican Republic', 0),
(70, 'EC', 'Ecuador', 0),
(71, 'EG', 'Egypt', 0),
(72, 'SV', 'El Salvador', 0),
(73, 'GQ', 'Equatorial Guinea', 0),
(74, 'ER', 'Eritrea', 0),
(75, 'EE', 'Estonia', 1),
(76, 'ET', 'Ethiopia', 0),
(77, 'FK', 'Falkland Islands (malvinas)', 0),
(78, 'FO', 'Faroe Islands', 0),
(79, 'FJ', 'Fiji', 0),
(80, 'FI', 'Finland', 1),
(81, 'FR', 'France', 1),
(82, 'GF', 'French Guiana', 0),
(83, 'PF', 'French Polynesia', 0),
(84, 'TF', 'French Southern Territories', 0),
(85, 'GA', 'Gabon', 0),
(86, 'GM', 'Gambia', 0),
(87, 'GE', 'Georgia', 0),
(88, 'DE', 'Germany', 1),
(89, 'GH', 'Ghana', 0),
(90, 'GI', 'Gibraltar', 0),
(91, 'GR', 'Greece', 1),
(92, 'GL', 'Greenland', 0),
(93, 'GD', 'Grenada', 0),
(94, 'GP', 'Guadeloupe', 0),
(95, 'GU', 'Guam', 0),
(96, 'GT', 'Guatemala', 0),
(97, 'GG', 'Guernsey', 0),
(98, 'GN', 'Guinea', 0),
(99, 'GW', 'Guinea-bissau', 0),
(100, 'GY', 'Guyana', 0),
(101, 'HT', 'Haiti', 0),
(102, 'HM', 'Heard Island And Mcdonald Islands', 0),
(103, 'VA', 'Holy See (vatican City State)', 0),
(104, 'HN', 'Honduras', 0),
(105, 'HK', 'Hong Kong', 0),
(106, 'HU', 'Hungary', 1),
(107, 'IS', 'Iceland', 0),
(108, 'IN', 'India', 0),
(109, 'ID', 'Indonesia', 0),
(110, 'IR', 'Iran, Islamic Republic Of', 0),
(111, 'IQ', 'Iraq', 0),
(112, 'IM', 'Isle Of Man', 0),
(113, 'IL', 'Israel', 0),
(114, 'IT', 'Italy', 1),
(115, 'JM', 'Jamaica', 0),
(116, 'JP', 'Japan', 0),
(117, 'JE', 'Jersey', 0),
(118, 'JO', 'Jordan', 0),
(119, 'KZ', 'Kazakhstan', 0),
(120, 'KE', 'Kenya', 0),
(121, 'KI', 'Kiribati', 0),
(122, 'KP', 'Korea, Democratic People''s Republic Of', 0),
(123, 'KR', 'Korea, Republic Of', 0),
(124, 'KW', 'Kuwait', 0),
(125, 'KG', 'Kyrgyzstan', 0),
(126, 'LA', 'Lao People''s Democratic Republic', 0),
(127, 'LB', 'Lebanon', 0),
(128, 'LS', 'Lesotho', 0),
(129, 'LR', 'Liberia', 0),
(130, 'LY', 'Libyan Arab Jamahiriya', 0),
(131, 'LI', 'Liechtenstein', 0),
(132, 'LT', 'Lithuania', 1),
(133, 'LU', 'Luxembourg', 1),
(134, 'MO', 'Macao', 0),
(135, 'MK', 'Macedonia, The Former Yugoslav Republic Of', 0),
(136, 'MG', 'Madagascar', 0),
(137, 'MW', 'Malawi', 0),
(138, 'MY', 'Malaysia', 0),
(139, 'MV', 'Maldives', 0),
(140, 'ML', 'Mali', 0),
(141, 'MT', 'Malta', 1),
(142, 'MH', 'Marshall Islands', 0),
(143, 'MQ', 'Martinique', 0),
(144, 'MR', 'Mauritania', 0),
(145, 'MU', 'Mauritius', 0),
(146, 'YT', 'Mayotte', 0),
(147, 'MX', 'Mexico', 0),
(148, 'FM', 'Micronesia, Federated States Of', 0),
(149, 'MD', 'Moldova, Republic Of', 0),
(150, 'MC', 'Monaco', 0),
(151, 'MN', 'Mongolia', 0),
(152, 'ME', 'Montenegro', 0),
(153, 'MS', 'Montserrat', 0),
(154, 'MA', 'Morocco', 0),
(155, 'MZ', 'Mozambique', 0),
(156, 'MM', 'Myanmar', 0),
(157, 'NA', 'Namibia', 0),
(158, 'NR', 'Nauru', 0),
(159, 'NP', 'Nepal', 0),
(160, 'NL', 'Netherlands', 1),
(161, 'AN', 'Netherlands Antilles', 0),
(162, 'NC', 'New Caledonia', 0),
(163, 'NZ', 'New Zealand', 0),
(164, 'NI', 'Nicaragua', 0),
(165, 'NE', 'Niger', 0),
(166, 'NG', 'Nigeria', 0),
(167, 'NU', 'Niue', 0),
(168, 'NF', 'Norfolk Island', 0),
(169, 'MP', 'Northern Mariana Islands', 0),
(170, 'NO', 'Norway', 0),
(171, 'OM', 'Oman', 0),
(172, 'PK', 'Pakistan', 0),
(173, 'PW', 'Palau', 0),
(174, 'PS', 'Palestinian Territory, Occupied', 0),
(175, 'PA', 'Panama', 0),
(176, 'PG', 'Papua New Guinea', 0),
(177, 'PY', 'Paraguay', 0),
(178, 'PE', 'Peru', 0),
(179, 'PH', 'Philippines', 0),
(180, 'PN', 'Pitcairn', 0),
(181, 'PL', 'Poland', 1),
(182, 'PT', 'Portugal', 1),
(183, 'PR', 'Puerto Rico', 0),
(184, 'QA', 'Qatar', 0),
(185, 'RE', 'Reunion', 0),
(186, 'RO', 'Romania', 1),
(187, 'RW', 'Rwanda', 0),
(188, 'BL', 'Saint Barth&ETH;', 0),
(189, 'SH', 'Saint Helena', 0),
(190, 'KN', 'Saint Kitts And Nevis', 0),
(191, 'LC', 'Saint Lucia', 0),
(192, 'MF', 'Saint Martin', 0),
(193, 'PM', 'Saint Pierre And Miquelon', 0),
(194, 'VC', 'Saint Vincent And The Grenadines', 0),
(195, 'WS', 'Samoa', 0),
(196, 'SM', 'San Marino', 0),
(197, 'ST', 'Sao Tome And Principe', 0),
(198, 'SA', 'Saudi Arabia', 0),
(199, 'SN', 'Senegal', 0),
(200, 'RS', 'Serbia', 0),
(201, 'SC', 'Seychelles', 0),
(202, 'SL', 'Sierra Leone', 0),
(203, 'SG', 'Singapore', 0),
(204, 'SK', 'Slovakia', 1),
(205, 'SI', 'Slovenia', 1),
(206, 'SB', 'Solomon Islands', 0),
(207, 'SO', 'Somalia', 0),
(208, 'ZA', 'South Africa', 0),
(209, 'GS', 'South Georgia And The South Sandwich Islands', 0),
(210, 'ES', 'Spain', 1),
(211, 'LK', 'Sri Lanka', 0),
(212, 'SD', 'Sudan', 0),
(213, 'SR', 'Suriname', 0),
(214, 'SJ', 'Svalbard And Jan Mayen', 0),
(215, 'SZ', 'Swaziland', 0),
(216, 'SE', 'Sweden', 1),
(217, 'SY', 'Syrian Arab Republic', 0),
(218, 'TW', 'Taiwan, Province Of China', 0),
(219, 'TJ', 'Tajikistan', 0),
(220, 'TZ', 'Tanzania, United Republic Of', 0),
(221, 'TH', 'Thailand', 0),
(222, 'TL', 'Timor-leste', 0),
(223, 'TG', 'Togo', 0),
(224, 'TK', 'Tokelau', 0),
(225, 'TO', 'Tonga', 0),
(226, 'TT', 'Trinidad And Tobago', 0),
(227, 'TN', 'Tunisia', 0),
(228, 'TR', 'Turkey', 0),
(229, 'TM', 'Turkmenistan', 0),
(230, 'TC', 'Turks And Caicos Islands', 0),
(231, 'TV', 'Tuvalu', 0),
(232, 'UG', 'Uganda', 0),
(233, 'UA', 'Ukraine', 0),
(234, 'AE', 'United Arab Emirates', 0),
(235, 'GB', 'United Kingdom', 1),
(236, 'UM', 'United States Minor Outlying Islands', 0),
(237, 'UY', 'Uruguay', 0),
(238, 'UZ', 'Uzbekistan', 0),
(239, 'VU', 'Vanuatu', 0),
(240, 'VE', 'Venezuela', 0),
(241, 'VN', 'Viet Nam', 0),
(242, 'VG', 'Virgin Islands, British', 0),
(243, 'VI', 'Virgin Islands, U.s.', 0),
(244, 'WF', 'Wallis And Futuna', 0),
(245, 'EH', 'Western Sahara', 0),
(246, 'YE', 'Yemen', 0),
(247, 'ZM', 'Zambia', 0),
(248, 'ZW', 'Zimbabwe', 0);

-- --------------------------------------------------------

--
-- Table structure for table `filestore_file`
--

CREATE TABLE IF NOT EXISTS `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(1, 1, 1, '0/fsNDNnLS', 'bg-hex.png', 4167, 0, ''),
(2, 1, 1, '0/fsJEa33c', 'bg-hex.png', 4167, 0, ''),
(3, 1, 1, '0/fsKNkzpC', 'logo.png', 3756, 0, ''),
(4, 1, 1, '0/fsJUCSLg', 'bg-hex.png', 4167, 0, ''),
(5, 1, 1, '0/fsEUWQSy', 'thumb_bg-hex.png', 0, 0, ''),
(6, 1, 1, '0/fsKeOzDl', 'bg-hex.png', 4167, 0, ''),
(7, 2, 1, '0/20130528135844__2013-03-27-21.48.12.jpg', '2013-03-27-21.48.12.jpg', 79824, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_image`
--

CREATE TABLE IF NOT EXISTS `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `filestore_image`
--

INSERT INTO `filestore_image` (`id`, `name`, `original_file_id`, `thumb_file_id`) VALUES
(1, NULL, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `filestore_type`
--

CREATE TABLE IF NOT EXISTS `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `filestore_type`
--

INSERT INTO `filestore_type` (`id`, `name`, `mime_type`, `extension`) VALUES
(1, 'png', 'image/png', 'png'),
(2, 'jpeg', 'image/jpeg', 'jpeg'),
(3, 'gif', 'image/gif', 'gif');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_volume`
--

CREATE TABLE IF NOT EXISTS `filestore_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL DEFAULT '',
  `total_space` bigint(20) NOT NULL DEFAULT '0',
  `used_space` bigint(20) NOT NULL DEFAULT '0',
  `stored_files_cnt` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') DEFAULT 'Y',
  `last_filenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `filestore_volume`
--

INSERT INTO `filestore_volume` (`id`, `name`, `dirname`, `total_space`, `used_space`, `stored_files_cnt`, `enabled`, `last_filenum`) VALUES
(1, 'upload', 'upload', 1000000000, 0, 7, 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `proiect_id` int(10) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Priority` int(10) NOT NULL,
  `TargetDate` date NOT NULL,
  `is_fixed` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `proiect_id`, `Title`, `Priority`, `TargetDate`, `is_fixed`) VALUES
(1, 1, 'No Hardware', 22, '2013-06-20', 1),
(5, 3, 'ale', 22, '1990-04-19', 0),
(6, 1, 'alex', 1, '1000-09-10', 0),
(7, 4, 'aaa', 223, '2013-06-21', 0),
(8, 3, 'stef', 23, '2013-06-29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id of item',
  `title` varchar(64) DEFAULT NULL COMMENT 'for example "red purse", "black belt", "green gucci shoes"',
  `state` enum('lost','found') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_type_id` int(1) DEFAULT NULL,
  `description` text COMMENT 'detailed description of item',
  `spot` varchar(128) DEFAULT NULL COMMENT 'Name of place where item was found/lost',
  `street` varchar(128) DEFAULT NULL COMMENT 'Street where item was found or lost (depending on type of item)',
  `city` varchar(128) DEFAULT NULL COMMENT 'city where item was lost/found',
  `zip` varchar(16) DEFAULT NULL COMMENT 'postcode',
  `country_id` int(11) DEFAULT NULL COMMENT 'id of country',
  `created` datetime DEFAULT NULL,
  `is_found` tinyint(1) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_country` (`country_id`),
  KEY `fk_item_item_type1` (`item_type_id`),
  KEY `fk_item_user1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`id`, `name`) VALUES
(1, 'Wallet'),
(2, 'Key'),
(3, 'Umbrella'),
(4, 'Jacket'),
(5, 'Mobile Phone');

-- --------------------------------------------------------

--
-- Table structure for table `proiect`
--

CREATE TABLE IF NOT EXISTS `proiect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `realizare` tinyint(4) NOT NULL,
  `nume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `proiect`
--

INSERT INTO `proiect` (`id`, `user_id`, `realizare`, `nume`) VALUES
(1, 8, 1, 'Sistem de tranzactii bancare online'),
(2, 8, 0, 'Alt Proiect'),
(3, 11, 0, 'Tralala'),
(4, 11, 0, 'Ciuki');

-- --------------------------------------------------------

--
-- Table structure for table `sprint_backlog`
--

CREATE TABLE IF NOT EXISTS `sprint_backlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(255) NOT NULL,
  `Prioritate` int(10) NOT NULL,
  `Estimare` int(10) NOT NULL,
  `Finalizare` int(10) NOT NULL,
  `MetodaValidare` varchar(255) NOT NULL,
  `Note` varchar(255) NOT NULL,
  `nrSprint` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sprint_backlog`
--

INSERT INTO `sprint_backlog` (`id`, `Nume`, `Prioritate`, `Estimare`, `Finalizare`, `MetodaValidare`, `Note`, `nrSprint`) VALUES
(1, 'Fa ceva', 22, 2, 0, 'o metoda', 'o nota', 1),
(2, 'Another record of Story', 33, 2, 0, 'in a way', '', 2),
(3, 'un nume', 2, 33, 0, 'll', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sprint_summary`
--

CREATE TABLE IF NOT EXISTS `sprint_summary` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Nume` varchar(255) NOT NULL,
  `DataIncepere` datetime NOT NULL,
  `DataSfarsit` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `story`
--

CREATE TABLE IF NOT EXISTS `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_po` int(11) NOT NULL,
  `proiect_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sprint_id` int(10) NOT NULL,
  `Nume` varchar(255) DEFAULT NULL,
  `Prioritate` int(10) DEFAULT NULL,
  `Estimare` int(10) DEFAULT NULL,
  `Finalizare` int(10) NOT NULL,
  `MetodaValidare` varchar(255) DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `story`
--

INSERT INTO `story` (`id`, `id_po`, `proiect_id`, `user_id`, `sprint_id`, `Nume`, `Prioritate`, `Estimare`, `Finalizare`, `MetodaValidare`, `Note`) VALUES
(1, 0, 0, 3, 1, 'Depunere in Cont', 55, 10, 0, 'autentificare', 'trebuie diagrama UML'),
(2, 0, 0, 4, 1, 'Istoric Tranzactii', 5, 15, 0, 'Autentificare, deschidere tranzactii', 'Folosire memorie virtuala'),
(3, 0, 0, 2, 2, 'Depunere in cevA', 44, 2, 0, 'uml', 'ALTE NOTIte'),
(4, 0, 0, 2, 0, 'o poveste', 22, 3, 0, 'prin ceva', 'o notita');

-- --------------------------------------------------------

--
-- Table structure for table `subnotite`
--

CREATE TABLE IF NOT EXISTS `subnotite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `story_id` int(10) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `estimare` int(10) NOT NULL,
  `Finalizare` int(10) NOT NULL,
  `Utilitate` int(10) NOT NULL,
  `is_used` int(1) NOT NULL,
  `is_done` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `subnotite`
--

INSERT INTO `subnotite` (`id`, `user_id`, `story_id`, `nume`, `estimare`, `Finalizare`, `Utilitate`, `is_used`, `is_done`) VALUES
(1, 0, 0, 'sub note', 22, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`name`, `surname`, `gender`, `id`) VALUES
('alex', 'malus', 'F', 1),
('Pia', 'mea', 'F', 2),
('Alina', 'SeJoaca', 'F', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tmp_test`
--

CREATE TABLE IF NOT EXISTS `tmp_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tmp_test`
--

INSERT INTO `tmp_test` (`id`, `name`, `price`, `parent_id`) VALUES
(1, 'Name [1,1]', -2.75, NULL),
(2, 'Name [1,2]', -2.13, NULL),
(3, 'Name [1,3]', -3.83, NULL),
(4, 'Name [2,1]', 8.39, '2'),
(5, 'Name [2,2]', 0.68, '2'),
(6, 'Name [2,3]', 1.78, '2'),
(7, 'Name [3,1]', 3.22, '3'),
(8, 'Name [3,2]', 9.18, '3'),
(9, 'Name [3,3]', 5.14, '3'),
(10, 'Name [4,1]', -2.54, '4'),
(11, 'Name [4,2]', -2.06, '4'),
(12, 'Name [4,3]', 0.56, '4'),
(13, 'Name [5,1]', 4.53, '5'),
(14, 'Name [5,2]', -4.32, '5'),
(15, 'Name [5,3]', 0.48, '5'),
(16, 'lala', 222.00, '2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_po` tinyint(1) NOT NULL DEFAULT '0',
  `is_scrum` tinyint(4) DEFAULT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(254) DEFAULT NULL COMMENT 'HASH of password',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `is_admin`, `is_po`, `is_scrum`, `first_name`, `last_name`, `company`, `email`, `password`, `created`) VALUES
(1, 1, 0, 0, 'Alex', 'Malus', NULL, 'alex@a.com', 'admin', '2013-05-31 10:14:00'),
(2, 0, 1, 0, 'ProductOwner', 'Boss', NULL, 'prod@prod.com', 'prod', NULL),
(3, 0, 0, 1, 'ScrumMaster', 'BossMic', NULL, 'prog@prog.com', 'prog', NULL),
(4, 0, 0, 0, 'Programator', 'Mic', NULL, 'prog@prog2.com', 'prog', NULL),
(5, 0, 0, 0, 'AlDoileaProgramator', 'Mic', NULL, 'prog2@prog2.com', 'prog', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_item1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_item_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_item_type1` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
