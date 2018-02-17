-- phpMyAdmin SQL Dump
-- version 4.0.10.1
-- http://www.phpmyadmin.net
--
-- Računalo: localhost
-- Vrijeme generiranja: Lis 18, 2016 u 11:04 PM
-- Verzija poslužitelja: 5.5.53
-- PHP verzija: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza podataka: `zadmin_gp`
--

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `status` text NOT NULL,
  `signature` text CHARACTER SET latin1 NOT NULL,
  `lastactivity` text CHARACTER SET latin1 NOT NULL,
  `boja` text CHARACTER SET latin1 NOT NULL,
  `login_session` text CHARACTER SET latin1 NOT NULL,
  `avatar` varchar(999) CHARACTER SET latin1 DEFAULT 'nema_avatar.png',
  `lastactivityname` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Izbacivanje podataka za tablicu `admin`
--

INSERT INTO `admin` (`id`, `fname`, `lname`, `username`, `password`, `email`, `status`, `signature`, `lastactivity`, `boja`, `login_session`, `avatar`, `lastactivityname`) VALUES
(1, 'Nikita', '1microfix', 'Sibul', '7523d2c7ba5acba8765bc1367bda803f6db2fd8b', '1microfix@1microfix.tk', 'admin', '', '1476824161', '', '', 'nema_avatar.png', 'Pregled strane - Početna'),
(2, 'Vane', 'Spoksy', 'Tomislav', '0500dfffeb46867a86245181d7866cbadf23258c', 'tomica@tomica.com', 'admin', '', '1476824188', 'red', '', 'no_avatar.png', 'Pregled strane - Početna');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `banovi`
--

CREATE TABLE IF NOT EXISTS `banovi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klijentid` int(11) DEFAULT NULL,
  `vreme` int(11) DEFAULT NULL,
  `razlog` text,
  `trajanje` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `billing`
--

CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klijentid` int(11) DEFAULT NULL,
  `iznos` double NOT NULL DEFAULT '0',
  `datum` text,
  `status` varchar(16) DEFAULT 'Na cekanju',
  `vreme` text NOT NULL,
  `invoice` varchar(60) NOT NULL DEFAULT '0',
  `transactionid` varchar(60) NOT NULL DEFAULT '0',
  `currency` int(2) NOT NULL DEFAULT '1',
  `description` varchar(60) NOT NULL DEFAULT '0',
  `paytype` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `billing_currency`
--

CREATE TABLE IF NOT EXISTS `billing_currency` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `multiply` double NOT NULL DEFAULT '1',
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `sign` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `zemlja` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Izbacivanje podataka za tablicu `billing_currency`
--

INSERT INTO `billing_currency` (`cid`, `multiply`, `name`, `sign`, `zemlja`) VALUES
(1, 1, 'Euro', '€', 'cg'),
(2, 123.34, 'Dinar', 'din', 'srb'),
(3, 1.96, 'Konvertabilna marka', 'km', 'bih'),
(4, 7.67, 'Kuna', 'kn', 'hr'),
(5, 61.67, 'Makedonski denar', 'den', 'mk');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `billing_log`
--

CREATE TABLE IF NOT EXISTS `billing_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `adminid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `billing_sms`
--

CREATE TABLE IF NOT EXISTS `billing_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text,
  `time` varchar(164) NOT NULL,
  `message` varchar(64) NOT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `price` varchar(64) DEFAULT NULL,
  `currency` varchar(64) DEFAULT NULL,
  `service_id` varchar(64) DEFAULT NULL,
  `message_id` varchar(64) DEFAULT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `shortcode` varchar(64) DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `billing_type` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `sig` varchar(64) DEFAULT NULL,
  `revenue` double(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `billing_smszemlje`
--

CREATE TABLE IF NOT EXISTS `billing_smszemlje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poruka` text NOT NULL,
  `broj` text NOT NULL,
  `cijena` text NOT NULL,
  `status` text NOT NULL,
  `zemlja` text NOT NULL,
  `currency` text NOT NULL,
  `dodatno` text NOT NULL,
  `disclaimer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Izbacivanje podataka za tablicu `billing_smszemlje`
--

INSERT INTO `billing_smszemlje` (`id`, `poruka`, `broj`, `cijena`, `status`, `zemlja`, `currency`, `dodatno`, `disclaimer`) VALUES
(1, 'TXT EMOST', '091810700', '2.34', 'Da', 'Bosna i Hercegovina', 'KM', '', 'Cena: 2.34 KM Podrška: sms@emax-hosting.info Mobilna Naplata: fortumo.com'),
(2, 'TAP EMOST', '141951', '106.20', 'Da', 'Macedonia', 'MKD', '', '????: 106.20 MKD ???????: sms@emax-hosting.info ??????? ??????? ?a fortumo.com'),
(3, '	FOR EMHOST', '14741', '1.02', 'Da', 'Montenegro', '€', '', 'Price: 1.02 € Support: sms@emax-hosting.info Mobile Payment by Fortumo.com'),
(4, 'TXT15 EMOST', '866866', '15.00', 'Da', 'Croatia', 'HRK', '', 'Cijena: 15 HRK Podrška: sms@emax-hosting.info Mobilni placanja Fortumo.com Tehnicka podrška(davatelj usluge): Telekomunikacijske usluge d.o.o., Medimurska 28, 42000 Varaždin, MB: 070096612, OIB 12385860076. Tel: 042 500 871.'),
(5, '150 EMOST', '1310', '180.00', 'Da', 'Serbia', 'RSD', '+ 1 Standard SMS', '	Price: 180.00 RSD + 1 Standard SMS Support: sms@emax-hosting.info Mobile Payment by Fortumo.com'),
(6, 'FOR EMOST', '89000', '0.99', 'Da', 'Germany', 'EUR', '', 'Preis: 0.99 EUR Support: sms@emax-hosting.info Powered by fortumo.de');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `box`
--

CREATE TABLE IF NOT EXISTS `box` (
  `boxid` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ip` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `routeip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `login` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `password` blob NOT NULL,
  `sshport` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `ftpport` int(11) NOT NULL DEFAULT '21',
  `maxsrv` int(11) NOT NULL,
  `cache` blob,
  `box_load_5min` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `box_load` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `box`
--

INSERT INTO `box` (`boxid`, `name`, `ip`, `routeip`, `login`, `password`, `sshport`, `ftpport`, `maxsrv`, `cache`, `box_load_5min`, `box_load`) VALUES

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `boxdata`
--

CREATE TABLE IF NOT EXISTS `boxdata` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `cache` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `boxip`
--

CREATE TABLE IF NOT EXISTS `boxip` (
`ipid` int(8) unsigned NOT NULL,
  `boxid` int(8) unsigned NOT NULL,
  `ip` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `boxip`
--

INSERT INTO `boxip` (`ipid`, `boxid`, `ip`, `route`) VALUES
(6, 6, '79.137.2.212', '0'),

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `bug`
--

CREATE TABLE IF NOT EXISTS `bug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klijentid` int(11) DEFAULT NULL,
  `naslov` text,
  `text` text,
  `vrsta` int(11) DEFAULT NULL,
  `vreme` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `chat_messages`
--

CREATE TABLE IF NOT EXISTS `chat_messages` (
  `Text` text,
  `Autor` text NOT NULL,
  `Datum` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` varchar(9999) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Izbacivanje podataka za tablicu `chat_messages`
--

INSERT INTO `chat_messages` (`Text`, `Autor`, `Datum`, `ID`, `admin_id`) VALUES
(' hahah', '<span style="color: red" >Tomislav </span>', '18 Oct 2016, 22:1:45', 1, '2'),
('Novi tiket <a href="tiket.php?id=1">aafdfgdf</a>', '<font color="silver">test testic</font>', '18 Oct 2016, 22:17:45', 2, 'klijent_2');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `setting` varchar(255) NOT NULL,
  `value` text NOT NULL,
  KEY `setting` (`setting`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `error_log`
--

CREATE TABLE IF NOT EXISTS `error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `string` varchar(255) DEFAULT NULL,
  `file` mediumtext,
  `line` int(11) DEFAULT NULL,
  `datum` mediumtext,
  `vrsta` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `friends_list`
--

CREATE TABLE IF NOT EXISTS `friends_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `friends_request`
--

CREATE TABLE IF NOT EXISTS `friends_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `invoices`
--

CREATE TABLE IF NOT EXISTS `invoices` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `invoice_status_id` tinyint(2) NOT NULL DEFAULT '1',
  `invoice_date_created` date NOT NULL,
  `invoice_date_modified` datetime NOT NULL,
  `invoice_date_due` date NOT NULL,
  `invoice_number` varchar(20) NOT NULL,
  `invoice_terms` longtext NOT NULL,
  `invoice_url_key` char(32) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  UNIQUE KEY `invoice_url_key` (`invoice_url_key`),
  KEY `user_id` (`client_id`,`invoice_date_created`,`invoice_date_due`,`invoice_number`),
  KEY `invoice_status_id` (`invoice_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `invoice_items`
--

CREATE TABLE IF NOT EXISTS `invoice_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `item_tax_rate_id` int(11) NOT NULL DEFAULT '0',
  `item_date_added` date NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_description` longtext NOT NULL,
  `item_quantity` decimal(10,2) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `item_order` int(2) NOT NULL DEFAULT '0',
  `item_popust` varchar(20) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `invoice_id` (`invoice_id`,`item_tax_rate_id`,`item_date_added`,`item_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `klijenti`
--

CREATE TABLE IF NOT EXISTS `klijenti` (
`klijentid` int(8) unsigned NOT NULL,
  `username` text NOT NULL,
  `sifra` text NOT NULL,
  `ime` text,
  `prezime` text,
  `email` text NOT NULL,
  `beleske` text,
  `novac` double NOT NULL DEFAULT '0',
  `currency` int(2) NOT NULL DEFAULT '1',
  `status` text NOT NULL,
  `lastlogin` datetime NOT NULL,
  `lastactivity` text NOT NULL,
  `lastip` text NOT NULL,
  `lasthost` text NOT NULL,
  `kreiran` date NOT NULL,
  `zemlja` text NOT NULL,
  `avatar` text NOT NULL,
  `cover` varchar(11) NOT NULL DEFAULT 'cover.jpg',
  `banovan` int(2) NOT NULL DEFAULT '0',
  `sigkod` int(11) NOT NULL,
  `token` text,
  `mail` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `klijenti`
--

INSERT INTO `klijenti` (`klijentid`, `username`, `sifra`, `ime`, `prezime`, `email`, `beleske`, `novac`, `currency`, `status`, `lastlogin`, `lastactivity`, `lastip`, `lasthost`, `kreiran`, `zemlja`, `avatar`, `cover`, `banovan`, `sigkod`, `token`, `mail`) VALUES
(3, 'demo_nalog', '6a83bee7952838950189770cdca6ac5eeb701540ab569ee3cae5d1d74fc7fe4958c0ee16a857191d4bb4bef13a6a948cf1422f7831c3c212af0ef7a1aff8455c', 'Demo', 'Nalog', 'demo@demo.com', NULL, 1.1099999999999999, 1, 'Aktivan', '2017-10-04 19:53:03', '1512056278', 'Os kurac', 'p54B27EDC.dip0.t-ipconnect.de', '2017-10-04', 'srb', 'default.png', 'cover.jpg', 0, 1337, '03e7rvl1da2bs8ja9p7ekrsic3', 1),
(4, 'Deamons', '14dc036b36a8c4054c7bb25b8be874f8c43f0b9fada0b042dbcd5d169088b7e352e1d8bd7c00576b1cbeaf255a5f20fff9a3e32a148e21645b28d7db02442438', 'Bogoljub', 'Jevtic', 'deamonsarmy@gmail.com', NULL, 3, 5, 'Aktivan', '2017-11-30 15:45:52', '1512053532', '212.110.90.11', '212.110.90.11', '2017-10-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 1337, '3ntcbocaquiogop5kulk1opqn1', 1),
(5, 'Andrew_Desanta', 'cad4f623eb7cc2142ff6fd3fc356d1c629daa5abb959bb4635047e3f0ea8b4b02ceb42539ab374b487809520a1facc47b9e80659201d3b22e41cac02332c4251', 'Bojan', 'Konstantinov', 'bojan.konstantinov@gmail.com', NULL, 0.6, 2, 'Aktivan', '2017-10-04 20:56:59', '1507147048', '84.178.126.220', 'p54B27EDC.dip0.t-ipconnect.de', '2017-10-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 83049, 'hgl807dcst4cnktgdk7hc6eoi1', 0),
(6, 'EnisUstavdic', 'efa8a85e556b4db51669fa600f39f0fde359edc22e6c395d69ddda697e7916a0ff047d4a9d06729af130eb83e222b16fb528cb304c9392ac396a46e0288ac73d', 'Enis', 'Ustavic', 'ustavdicenis666@gmail.com', NULL, 0.3, 3, 'Aktivan', '2017-11-08 23:36:26', '1510181790', '109.175.107.25', '109.175.107.25', '2017-10-04', 'bih', 'no_avatar.png', 'cover.jpg', 0, 6666, 'ukh43nib5anccme0oblgr0tlp7', 1),
(8, 'Tuzlak', '1927b5321f1f268976935de281f23396a6d8393e76cf733430e191addd7e9c6b94c6efbd06f4f375665fed78d017dd729109f3bee5877c7673b3cda1a0c29dfa', 'Almedin', 'Husagic', 'elvedinhusagic3@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1507367141', '~', '~', '2017-10-07', 'bih', 'no_avatar.png', 'cover.jpg', 0, 38411, '', 0),
(9, 'ahmed1337', '1454715c83a9eb59489a1bc1d20361e12e32ed523ab063308caf1b6c76e5a6cdb0fa3b45cc89db3605a625a5200817dca520ccc8e2ac717cdc01e5a98b4e559c', 'Ahmed', 'Seferovic', 'ahmedseferovicc@gmail.com', NULL, 0.7, 3, 'Aktivan', '2017-11-26 16:32:08', '1511710273', '109.175.97.207', '109.175.97.207', '2017-10-11', 'bih', 'no_avatar.png', 'cover.jpg', 0, 96013, 'bs6it375f9fephtuvln10q4521', 0),
(10, 'hmd1312', '427e81372f24f53037f93f5611d50e606c2240a0ef7c34a08b5992421bf4afbed874cf9e09b9b98b41d2b0e9b167b32a565e7b8a2d0c5d341d6338d1f6733942', 'Ahmed', 'Seferovic', 'streberstreber007@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1507743655', '~', '~', '2017-10-11', 'bih', 'no_avatar.png', 'cover.jpg', 0, 64609, '', 0),
(11, 'stox1337', '9eb994412568cf32514ed6276f85da029a878a401d2d58510494f9cf66392678d42dce972cd18027fda53ca7543b0cde5d35fd6f167d770a212a252efe73f188', 'Stefan', 'Vukmorovic', 'vukma1989@gmail.com', NULL, 1.9500000000000002, 2, 'Aktivan', '2017-10-14 17:51:29', '1507996675', '178.221.0.24', '178-221-0-24.dynamic.isp.telekom.rs', '2017-10-14', 'srb', 'no_avatar.png', 'cover.jpg', 0, 13941, '5vrh4kkqg33e4114fb3n7kbub2', 0),
(12, 'BarioNicholson', 'bb2d96844e1d9584d52ff3b39b3b84154a1d83f62b3e4e205abd010c8d9748acb9a0e56b92a65c3745609b65c793e21019326829e4972fe94f8971a0be723d25', 'David', 'Antic', 'barionicholson@gmail.com', NULL, 1, 5, 'Aktivan', '2017-10-30 08:29:01', '1509917560', '141.136.9.181', '141.136.9.181', '2017-10-15', 'mk', 'no_avatar.png', 'cover.jpg', 0, 8424, '0lfnur3buekhol2ft4b6erd1a7', 1),
(13, 'eldox', '727deb9e7e4866f2b5474aadf111107bff1ed91661a46e29510acd9cd8cf3c3c698fe634d5df3482b4fc343399300ae3439e3b515677a26161a76a4d41cd27f5', 'Eldar', 'Serdarevic', 'miledr123@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508072964', '~', '~', '2017-10-15', 'bih', 'no_avatar.png', 'cover.jpg', 0, 97118, '', 0),
(14, 'Eldoxx', 'f9e13f1e4b151c9f2bf203b17de7ee1396520e430d96c3a7025f197928d706ba81bd7e168c549fff7e0dad27ef0126787d9e3f1080ea64aa5935bf514643afc2', 'Eldar', 'Serdarevic', 'smartsience3@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508073072', '~', '~', '2017-10-15', 'srb', 'no_avatar.png', 'cover.jpg', 0, 88143, '', 0),
(15, 'zokaa', '144f85f4d1a42441e1e6f20fcfe672f08624e40be903909d02dd6b042afc4f192f024c22fdcb6cc4d18f3f363ef106b97a91ddde4bc30006279094c20064bd11', 'Adin', '', 'zokajoka55@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508073960', '~', '~', '2017-10-15', 'bih', 'no_avatar.png', 'cover.jpg', 0, 29770, '', 0),
(16, 'Zokica', 'f87177ca6cca6f092c3af4d8f2b62f899048bfbcf1472512036aa50a749df76d1909569ff3de7f7fe8589d4f51b9d9888d27bac45a640abd28a5838393794e0d', 'Adin', 'Zorlija', 'zajebanko1234@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508074059', '~', '~', '2017-10-15', 'bih', 'no_avatar.png', 'cover.jpg', 0, 84979, '', 0),
(17, 'rrssqq', '186ab495910d8d44301f6286ff091b56058fbfc5de5433ec14502abb9db2ee8e435fca0310f59e3465b34a951a0e55ef7c217bad8cda40641014e256758c6e63', 'Rasim', 'Balic', 'rasimbalic123@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-17 10:52:21', '1510912358', '91.191.18.18', '91.191.18.18', '2017-10-17', 'bih', 'no_avatar.png', 'cover.jpg', 0, 11504, 'pohp1nl4ttinsvqrkifk3v8fv3', 0),
(18, 'SnowMen', '948b77c1428a41132237156e6de0c565b72d7ce82585b5ceb75ca14c869b6f7d3136d4bafb74c584ec4a8962dc6259ce33df099b62a285fe9b1e27ba6eac6dca', 'Konatar', 'Ivan', 'ivankonatarcury@gmail.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1508239255', '~', '~', '2017-10-17', 'cg', 'no_avatar.png', 'cover.jpg', 0, 15316, '', 0),
(19, 'tijana313', 'e1f2e6b611e22749b24b797f6dde3aca373d344365484cf6fc66eaa1cbe00909d8442755a7a5a06ec81a9ed4fbee112b5e5984c96eda2d5565d9bad0af171879', 'Jack', 'Legacy', 'tijanasamp@gmail.com', NULL, 0, 1, 'Aktivan', '2017-10-31 20:28:55', '1509478164', '109.93.201.245', '109-93-201-245.dynamic.isp.telekom.rs', '2017-10-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 25767, 's3untcqvumofvea3028b5s39m2', 0),
(20, 'Merim CaR', '42a0a6155cf8f3e1b53d257ebb8c2f8fd8f6b3f17fcdc12d1fa62eafb17e2e4a8d16cd3ca1e4715fbb8faf22d24b97e9ca2afda6dbbe30e1900e5acb8eb68836', 'Merim', 'Alic', 'crnimerim@gmail.com', NULL, 0, 3, 'Aktivan', '2017-10-20 23:12:30', '1508534025', '109.175.104.26', '109.175.104.26', '2017-10-17', 'bih', 'no_avatar.png', 'cover.jpg', 0, 76624, '8sfrvmhosr453l8ibloa4d3903', 0),
(21, 'OggY1921', '087c87ac093b0c8608ed5d9684c688a40c8c0eddea6038f32453d7d2fe136e87428d534d517672018b2717281d45945da0c717502d4ccd819be0fe87d0c56052', 'Amer', 'Delic', 'ghettolordoggy@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-24 12:51:07', '1511524282', '31.176.197.182', '31.176.197.182', '2017-10-17', 'bih', 'no_avatar.png', 'cover.jpg', 0, 68570, 'tjlu7q4c3s12lqu00te6toj812', 0),
(22, 'NidzaBOG', '0d5ffc3e2d581a88113a6f076003844b496bbe86927493ee11a7d3688279d255fb471f63c566f6be1561a10fab9fd330c95f16b354048957a365e4d3c5f3f2b0', 'Nikola', 'Stojanovic', 'jebigauspeosam@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-24 22:42:23', '1511559749', '37.201.229.208', 'aftr-37-201-229-208.unity-media.net', '2017-10-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 2861, 'v634vi930dr8vk7png9e1cd6d7', 0),
(23, 'Amir757557', '1738d3f979e0a03db0dac29410f10d04fe788f0fc238a483f7c9bddfa15a46d662fdb7589ebb55d33b07c16cfb5b734410b1b204a994dddc38b53b9ebe10bdab', 'Amir', 'Becovic', 'amirbecovic60@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508266916', '~', '~', '2017-10-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 2468, '', 0),
(24, 'Djeni', '6a01961048f6d84959dc1a11004b548f6f90273b9e91a0d886369a64ba5269c1706059da45c632152155cb359f21de114dae725c56bd69018a99a1f8fde033cd', 'Farkas', '', 'danielfarkas11@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508267087', '~', '~', '2017-10-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 73965, '', 0),
(25, 'Muki123', '677eedc267a710c42676728cc76ab60e9f3ae5a806eaefe294f66a9dd9584ce071f563a75af1663b15c0eaea82cb77428c349b16e57761daeddae809f6323ad3', 'Muhamed', '', 'medo.cosovic@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-17 21:08:21', '1508267305', '178.223.223.26', '178-223-223-26.dynamic.isp.telekom.rs', '2017-10-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 14095, 'udqug011llktvbrb7s28n11l41', 0),
(26, 'Djeni123', 'f6cdce88c45676d833eb1b5e6fc308d4f7a6fe293838dcfd87c13e3e58b31034921a389b5fa22651c7b411efce9795d2185ea6b0d0d2550c6832d4c51b291502', 'Daniel', '', 'danielfarkas011@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508267311', '~', '~', '2017-10-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 26207, '', 0),
(27, 'Deagle', 'c5ca0d8d3c19044e72a5f321ffbdba207f2c3aac57d897b32146c78ddc8c49acbb79819d7dd745b992879e2e3b1216ce636c40991567c680bbe3099ef4be290f', 'Digle', '', 'deagleexyu44@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508284453', '~', '~', '2017-10-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 9993, '', 0),
(28, '~EmiR.#', '7313ac9be6a022001d84528792f8731091570b8cca243ca087be468b759f39898071b6ebf89df80180a63ccfe9a9ca54eb6682854b8d066b046a86882897b0b6', 'Emir', 'Pilavdzic', 'smajocar.kraljevi@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508317785', '~', '~', '2017-10-18', 'bih', 'no_avatar.png', 'cover.jpg', 0, 16495, '', 0),
(29, 'Fabri', 'c621f19c6e72d18d0aa15e230c99ffc7114da83a1526e1f1f1daae9663703f58e181a92656f197f5ec13fef4d8b9563dad308656c8a649f67a782c51396c6fc3', 'KURTON', '', 'fabrisamp2@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-18 14:07:01', '1508328508', '87.116.183.216', '87.116.183.216', '2017-10-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 95376, '79g3bguqpmplnv7l0b9drkqi84', 0),
(31, 'Xavi', 'fbc089a5e5eb3d6c9d24512afa3abc1f4df0426edcc8f0cd33b5c1e1934bc92498bb08b63fa49fa988f790e1208d9414dfc2ec62657fd7e4e9a36d18d810fa1b', 'Xavi', 'Script', 'maki.x455@gmail.com', NULL, 0, 1, 'Aktivan', '2017-10-21 15:48:33', '1508595577', '37.220.78.192', 'static-78-192.netnet.rs', '2017-10-18', 'srb', 'default.png', 'cover.jpg', 0, 23, '6mo62hse1vqvdt6mf9170krqc0', 1),
(32, 'thejacky', '50b50327d65441435347ae299277569b9ee159144c0ee4447f399e9113dcc7ce55a7bdacbbf37e8f7bbcc7120b3266d8d340213708446eae8af953553690d850', 'Amer', 'Delic', 'jackyrascall2000@hotmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508357009', '~', '~', '2017-10-18', 'bih', 'no_avatar.png', 'cover.jpg', 0, 67369, '', 0),
(33, 'faxon1337', '749d2ffd06d54aae53baff619ff28c745c157d1289352ab374b9a62dfd11bc31bdfa509a43a437c6656d3d398827d50c20d9158c100e504b720f850605e1a668', 'Dubravko', 'Malijevic', 'fax1ca666@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508411042', '~', '~', '2017-10-19', 'bih', 'no_avatar.png', 'cover.jpg', 0, 34161, '', 0),
(34, 'Makheev', 'be247ab7e93e5f29535e5f45f8ba34bdb8a3ab9ae00ca9a6ab8b5c5dcf8916c5024245984ceb973262258768ca80ffe4552cdd74c929eb54de735a232934154f', 'Taid', 'Nusevic', 'taidnusevic10@outlook.com', NULL, 0, 2, 'Aktivan', '2017-10-19 18:22:10', '1508592794', '89.216.162.98', 'cable-89-216-162-98.dynamic.sbb.rs', '2017-10-19', 'srb', 'no_avatar.png', 'cover.jpg', 0, 92342, 'i9a1bafho8ohvnukm1ufk1udt1', 0),
(35, 'MilosCindra', '06054e576432bb616e68af7832208cf31b765851adfa3dda473d9dade970d749ee0fb57d702bee04195437cef10f7aeee5b0404f35190c9bce6e3a5d3b09932c', 'Milos', 'Milosavljevic', 'milosciki2001@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-31 20:20:46', '1509477978', '82.208.249.47', '82.208.249.47', '2017-10-19', 'srb', 'no_avatar.png', 'cover.jpg', 0, 12218, 'j0l1ckdsfk6eqvukroem6d7dh2', 0),
(37, 'Kipee', 'b4b440044a8929df8b59c553f0e2f38bebfee3d3610ce37734250b742a59dddaddc9678e0fcda3b166cdd0e75d111348c041de3ef7a87f069f8fa18112d78b2f', 'Vasovic', 'Petar', '5ark1p3@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508447639', '~', '~', '2017-10-19', 'srb', 'no_avatar.png', 'cover.jpg', 0, 97835, '', 0),
(38, 'Snow12', 'fd04cff2e44a8e246a9275aca932a645fc096c1d8b8e9c93be93bbe17fe1ba947b7ab2f2f7a20079b5f025b20ae6a2afce1738dbcb05953c0f363f4ef5ad3f79', 'Ivan', 'Konatar', 'ivankonatar8@gmail.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1508448440', '~', '~', '2017-10-19', 'cg', 'no_avatar.png', 'cover.jpg', 0, 4353, '', 0),
(39, 'Aleksa', 'd7a616c9b28716ae7c5b29506c4d624b2c63495fc8e7ef64eeb74c3331b8cf8d6491f7d7455bc8c557723359c460bc885da9d860a985d527fe4ede54a617489d', 'Boriszet', '', 'Aleksa.bojkovic@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508486444', '~', '~', '2017-10-20', 'srb', 'no_avatar.png', 'cover.jpg', 0, 5603, '', 0),
(40, 'bogotac', 'de63e4fdc312540717217b055cdae7b2267c357f3b1533453fa76bb5354d76c3e1511d4f09125f2a0ee6cca0f5b127301039a959053ed99a7c07f4de96518c0c', 'Bog', 'Otac', 'lazic.bussines@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-20 15:11:13', '1508505381', '46.99.11.145', '46.99.11.145', '2017-10-20', 'srb', 'no_avatar.png', 'cover.jpg', 0, 34584, 'de3fo4ildhnm8egvfbi9kmqfs1', 0),
(41, 'Specara', '777d893d7ad2bd47e5b63f4116c97a841a9570f84a84de38589bf24145720e23172e3bf28c73b0b94425b6b2af4addcdb329f279d1000b8977af5ba1d9893f79', 'Nemanja', 'Spec', 'nemanjaforo0@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-20 21:32:41', '1508528245', '212.200.158.132', '212.200.158.132', '2017-10-20', 'srb', 'no_avatar.png', 'cover.jpg', 0, 46519, 'lh2av5p4btuivdp22dk95d3vb1', 0),
(42, 'Mechllone', 'fe83c8444f347019b01f5ed862d1072bf9b4e2265a35896db81ec63e1a45d300379a65468da0484264b6d99728f19fd6ffa85119249f2d78ceda4f2a13c5bc2d', 'Amar', 'Mehovic', 'jamesdelahuntt@gmail.com', NULL, 0, 1, 'Aktivan', '2017-10-30 13:24:04', '1509923034', '178.149.238.44', 'cable-178-149-238-44.dynamic.sbb.rs', '2017-10-21', 'srb', 'default.png', 'cover.jpg', 0, 22688, 'tfvl4404bg6d2hvh5fe0ug4jm6', 1),
(44, 'nelebrt ', '7af0739af0d131a91c1285d81b839ca500cfe4e7cc8c59ecb4b2cc6b2209d029062e82b8aee75a6b788454c446ddea68d4a07bd4954b2f071aea814ddf341147', 'Nenad', 'Cvetkovic', 'ncvetkovic400@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-21 10:05:42', '1508573472', '178.149.227.147', 'cable-178-149-227-147.dynamic.sbb.rs', '2017-10-21', 'srb', 'no_avatar.png', 'cover.jpg', 0, 44567, 'fsdqom9u76pkfpff48rmdlta74', 0),
(45, 'pzyclone1337', '546fcf07c69feac4fb9f6d4a701681636247db8d1f4d93ee189b527223f9f4f878b1cebf3e1e035e72ae7d7b8bbe6b52fa0b90ad1e6ee525cc27f784f5d4f645', 'Pavle', 'Marjanovic', 'tebra32@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-21 21:43:02', '1508614939', '37.201.228.84', 'aftr-37-201-228-84.unity-media.net', '2017-10-21', 'srb', 'no_avatar.png', 'cover.jpg', 0, 48835, 'v8r1sql4vmo2i77euprpaplmq2', 0),
(46, 'Nera3010', '234a0759648c33a488eb7ad413320a57aacc9443716c30bae0797b00af718107dba900d0da4e9111b7afb5225ee83e925bcc9318e8c1ae93182e1eb71fc48af2', 'Djuric', '', 'nera.djuric@gmail.com', NULL, 0, 4, 'Aktivan', '0000-00-00 00:00:00', '1508602297', '~', '~', '2017-10-21', 'hr', 'no_avatar.png', 'cover.jpg', 0, 92539, '', 0),
(47, 'Lexus01', '08c55e346545baf4ed96122114f6a11dfe23859e0917a91dcf57c819e67e1feba80f3dfdbc84bc678b8eec51cf840da42abee690bac3173a367c6f3111a41895', 'Josip', 'Beronja', 'beronja.josip123@gmail.com', NULL, 0, 1, 'Aktivan', '2017-10-22 14:54:34', '1508678063', '95.90.198.40', 'ip5f5ac628.dynamic.kabel-deutschland.de', '2017-10-21', 'cg', 'no_avatar.png', 'cover.jpg', 0, 69811, 'gmq03t0alf1qsd8ak54upf5tt0', 0),
(48, 'Lexus02', '6379d727f282eae52001f9e1b4c4bfab53b1b2cad760998f5fbd8dbf0cf37b0b8f7d03ecfe5bbcbc362efa62b8ef7f9b8c875f63a0b801c383f929e1428bdc14', 'Beronja', 'Josip', 'beki.de2002@gmail.com', NULL, 0, 1, 'Aktivan', '2017-11-04 22:29:51', '1509831005', '95.90.198.40', 'ip5f5ac628.dynamic.kabel-deutschland.de', '2017-10-21', 'cg', 'no_avatar.png', 'cover.jpg', 0, 44297, 'vs4ubj0kqqrr798o5e5cdq8nc5', 0),
(49, 'trifaaA', '67a2f1abba621b20f0590eabdc22431bade0618d101e472505559e45a979521b8661d37d83ed2a15f43873fde35e9d2c9b079ebac6dfdbc947531af790ef47ae', 'Ivan', 'Bajic', 'ivanbajic1111@gmail.com', NULL, 0, 4, 'Aktivan', '2017-10-26 21:07:53', '1509572034', '93.137.228.146', '93-137-228-146.adsl.net.t-com.hr', '2017-10-22', 'hr', 'no_avatar.png', 'cover.jpg', 0, 94864, '1e6kbecejs2rvvoir3t0plh0p2', 0),
(50, 'dybala', 'ad01e3c061a2f13bcd7a6fd0e1df6ddfc6d7c7e65f5ea36009a4c45a6343b239a5aae1b1a363949bbc0378cc0ed0b85d36efe532eb278a8af70080c21d2f18a7', 'Ajdin', 'Husetic', 'majmuntravnik@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-22 13:18:36', '1509122003', '109.175.99.165', '109.175.99.165', '2017-10-22', 'srb', 'no_avatar.png', 'cover.jpg', 0, 32202, 'oicvrr37qtk254s69sc7ob44a2', 0),
(51, 'zexyy', '82f632d1107c01696866b93f1d4f4a3756c5056b89697f2e59393ddfb8a4cd59217f835abd15e9ef22d3d0ed26541bba72633c31adae0e5c0a25591417d3d632', 'Zeljan', 'Nikolic', 'zeljannikolic12345@yahoo.com', NULL, 0, 2, 'Aktivan', '2017-11-03 14:14:58', '1509715487', '77.239.88.66', '066-88.telrad.net', '2017-10-22', 'bih', 'no_avatar.png', 'cover.jpg', 0, 37838, 'fbbuh1nk4i1phrvi3anl9v4jp4', 0),
(52, 'nakov123', 'e3eded0c489039299eddb3a9a84677d45fbf75794b3cc20e6c5bd047daeba73c2fcffb318c9c0d6d9efabd0c21aa06397db6a2f1e168145d1755a24636c181bd', 'Zimoshikato', 'Tokamemoru', 'zoran.nakov123@gmail.com', NULL, 0, 5, 'Aktivan', '2017-10-22 13:46:00', '1508791357', '95.180.182.18', '95.180.182.18', '2017-10-22', 'mk', 'no_avatar.png', 'cover.jpg', 0, 66528, 'lihvqg0hr5dbg64fqcvacm00q1', 0),
(53, 'Berin', '1c8e20c1d77194dbc0b69cdbfe8593204278276092f28d58460362915941c485a461273265a6925d570a107864ca35986404bbe3b4f89dd435f46e6ad12322e8', 'Makarov', '', 'berin.makarov@yahoo.com', NULL, 0, 3, 'Aktivan', '2017-10-22 15:22:40', '1508678924', '37.208.35.107', '37.208.35.107', '2017-10-22', 'bih', 'no_avatar.png', 'cover.jpg', 0, 13555, 'ab3rfnm6u6b9ouf21tcf535441', 0),
(54, 'Markonije', 'b4cbd3e9b9f4a26e81e6d8f061f7cacccae0d60332c925d34d1520a807cb0b18b4a6fb4ff33a766a7662dfaaf7c57812377e122ea3aa2b898979dcc50c248dab', 'Marko', 'Jonicovic', 'mareyt9@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-22 20:06:15', '1508695841', '212.69.3.209', 'IP-212-69-3-209.neobee.net', '2017-10-22', 'srb', 'no_avatar.png', 'cover.jpg', 0, 74297, '26dt4aucgf6ht20q27a6sgeml6', 0),
(55, 'mixyy', '8f31e7b49a0be9139f7de9a930d6dfaba664607db36e0f971059c6fa5465674d608dd5fed379f9bf1e20365f938f57d7d2a29c70ad5e78669621015d5e883b36', 'Amel', 'Haskic', 'haskicamel3@gmail.com', NULL, 0, 3, 'Aktivan', '2017-10-24 09:42:05', '1508830927', '31.176.203.33', '31.176.203.33', '2017-10-22', 'bih', 'no_avatar.png', 'cover.jpg', 0, 8246, 'g340e1q152p0pdc4117c20i7v6', 0),
(56, 'SajoBestEu', '6d6d5ff2e0f98f1a327dc72dd0833b395998d5c214985a2d75fc29a85f723a9b8cfa3c507d62f11ade1f3bcc7b0e8f8fed1cd02aeadb701d274382ed6ad7a1d9', 'Luka', 'Djordjevic', 'lukadjs420@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508702588', '~', '~', '2017-10-22', 'srb', 'no_avatar.png', 'cover.jpg', 0, 2011, '', 0),
(57, 'GamerAlibabic', '9c475ba64cfab893282b18d6261bd357ecb06e395ed01066c5c1e80db434177f0f9e494fe12a71d5804148cedbb362a181e99f82660040c19dc79d9aff4c35c3', 'Alibabic', 'Almedin', 'a.almedin2014@gmail.com', NULL, 0, 3, 'Aktivan', '2017-10-30 21:49:00', '1509396569', '109.175.111.129', '109.175.111.129', '2017-10-22', 'srb', 'no_avatar.png', 'cover.jpg', 0, 63571, 'uojoe1ojc9he1qv7be65ogsv54', 0),
(58, 'Vukasin Pesic', '3d0b13d6979b9656d41318f0478163608dca1aef279e4c627b425016b4ab5e3b257b2a38c6cd057a71d4b57cebdeebdbca9b8020f0bf9bc13815660ff092954a', 'Vukasin', 'Pewic', 'vukasin154@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-25 22:53:51', '1509198871', '109.92.106.114', '109-92-106-114.dynamic.isp.telekom.rs', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 32485, 'lkiep20lis3c5bg2f3mrrgrf70', 0),
(59, 'Dragisa', 'b4b1234a00ae1cb38e148d799fe0b085335b16d8475bcecd595d996d4f71ca7465621638926770ed48e43145700f6b7c4a4a26e22bce86d91fd49047a034ae9b', 'Dragisa', 'Kimpanov', 'Dragisa.kimpanov.2000@gmail.com', NULL, 3.494999999999999, 2, 'Aktivan', '2017-10-23 00:46:03', '1508712366', '79.110.155.146', '79.110.155.146', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 16349, '73tnvh0oam7sj46tjo6q14et52', 0),
(60, 'vukicar3', '3e244b1578781cd8e721f6efd18c753ba23def3fcf6b408d3196ffef1d75228a3923eacf1c6239a98768af98aa90a042c13996a84f3c3da77469819c79491ecd', 'Vukasin', 'Pesic', 'vukasinpesic15@gmail.com', NULL, 1.5, 2, 'Aktivan', '2017-11-27 15:48:55', '1511794080', '31.223.128.51', '31.223.128.51', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 25758, 'a8u1i1p4gmf1ados7c99n5rid6', 0),
(61, 'Stefisha', '3428237d705967b48b0c7a4ca3522776ed84e42379ed71f8d2d96c44c857c0885ce5a5b85fcde889e5467b8bc2ec275b113b1a386e7570caf526e044ae8b68a8', 'Stefan', 'Erdelic', 'stefisha950@gmail.com', NULL, 2, 3, 'Aktivan', '2017-11-27 20:53:45', '1511812429', '31.223.139.139', '31.223.139.139', '2017-10-23', 'bih', 'no_avatar.png', 'cover.jpg', 0, 29365, '3inoju830q5cpj5m1cntgqip26', 0),
(63, 'Koske', '547742a63ae137a25880aaeefb419d8811fb698cf4c1a685007c5385c146b9ba2d1bb83edbb646b8c9ddb4e0e75e167b041ac4b8760ea82483fb0a51368558a5', 'Miljan', 'Trajkovic', 'trajche.trajche038@yahoo.com', NULL, 0, 1, 'Aktivan', '2017-11-03 20:07:39', '1509736242', '80.80.43.72', '80.80.43.72', '2017-10-23', 'srb', 'default.png', 'cover.jpg', 0, 89871, '8ei32ibu39t4a0679ppl4oo0c1', 1),
(64, 'Amir5555', '08debbbf507cb68542c17a15dcfdb354db41ed49d7d8428778c6a60da06e10f0e0126903ae6a6d0a8567bceb755b6df6dbfdd34cda6d45aad84cb2011915a801', 'Amir', '', 'amirbecovic@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508761120', '~', '~', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 36918, '', 0),
(65, 'andrija1337', 'f40c49f0d4bef53c2a23b2c4a8b5e5ff116ff67b21368ee2f79036108a8517714042349812e7c75f09dc6c0fa83566e6f681b77f79f936f090811a1b8cf0e1bf', 'Andrija', 'Miljkovic', 'miljkovic431@gmail.com', NULL, 0.5979999999999999, 2, 'Aktivan', '2017-11-30 15:20:19', '1512051850', '194.54.180.172', '194.54.180.172', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 90430, '7ueu89obv4r2vp5g82ecg6p7f2', 0),
(67, 'Haris', '60490069f9b02aad0d099065ef3013666408a86357f8424913f1d2d09ccb1f324e1e6e810ff71e479b471c51a9caba465e6721576cc82f02df142e5877fa44c1', 'Haris', 'Dacic', 'dacic.haris123@gmail.com', NULL, 0, 1, 'Aktivan', '2017-10-31 07:45:42', '1509432308', '79.143.111.183', '79.143.111.183', '2017-10-23', 'cg', 'no_avatar.png', 'cover.jpg', 0, 43314, 'h3ca8edrnvkjhoi8ee9urj7qq3', 0),
(68, 'Veljko', '4c1e55612a093442dcd6f5b889928cd66be63de3a803d9e2c5f567111d89bc61a54c1003f61a73b2a2fa8fe4a8c6c16c3bfcbbb822ae2f8fd728576e8ac182d0', 'Veljko', 'Bulatovic', 'solovelja@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-23 20:56:29', '1508785364', '37.201.228.84', 'aftr-37-201-228-84.unity-media.net', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 37664, 'f1qi5pf4ls0eb9g1aai9m8i201', 0),
(69, 'anunnaki99', '04c37e388de1ecbbe3bb342a0be9ad328c57131531413b5abb040052b298dc89e3caf0b0c5e6985862ace99db94acbcc380490e9dfa86a9e1507c616eec52ad6', 'Stojkovic', 'Stefan', 'stojkovicbrate_@hotmail.com', NULL, 0, 2, 'Aktivan', '2017-10-27 08:52:50', '1509749019', '178.221.66.2', '178-221-66-2.dynamic.isp.telekom.rs', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 26979, 'm32g1is3e6837av9csd1r8c947', 0),
(70, 'Deyne', 'df133883f1854b4c0f0a1b389fad2ca8bc9a509edc329eff5a6802790a0561c073ec3dd115228bf5c15769793c9412a9e8bff0fa7e3806169d039a3ccb7c53b3', 'Damjan', 'Gosic', 'goshasd10@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-23 22:41:52', '1508839247', '178.220.189.12', '178-220-189-12.dynamic.isp.telekom.rs', '2017-10-23', 'srb', 'no_avatar.png', 'cover.jpg', 0, 62819, 'tfc0frn2e0a5dfbvv7mk1g6hq3', 0),
(71, 'Lazovic', '515f6e8ecadec69a750a8d4ebb93738c14d56e86a4f9b005509ed63096528a58cf5e929a217173b1d96ec720b950bfd87f53adb97e98757a7fbf15ec8e8feb3e', 'Nikola', 'Lazovic', 'nikolalazovic.bgd@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508830941', '~', '~', '2017-10-24', 'srb', 'no_avatar.png', 'cover.jpg', 0, 36919, '', 0),
(72, 'eXtremeSrbin2000', 'e906c3d3bb09f42c57d0f43dd5b42561a9aef5b2b64327e11b7aabb10941500981b76fa28baa9ad5c98ea48d23317a92511b884eee77e1b20822fc4c7691a8a1', 'Veljko', 'Vucic', 'vvucic866@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-24 11:41:34', '1508838096', '178.149.102.238', 'cable-178-149-102-238.dynamic.sbb.rs', '2017-10-24', 'srb', 'no_avatar.png', 'cover.jpg', 0, 15793, 'r6fsbvha2oqpjs7keebaddtg56', 0),
(73, 'Lolisha', '6c536e78ff2d181717a82fe4ae166ea7a9e65e294510d814da159c75cd2da3745a0f10c2cbc572d5bf0da4bd2b18e8136cbc6c28cc39366461e2f0bb2c66ed7a', 'Branislav', 'Vukobrat', 'vukobratbranislav@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-24 14:02:09', '1508847128', '109.245.228.90', '109.245.228.90', '2017-10-24', 'srb', 'no_avatar.png', 'cover.jpg', 0, 45690, '1t3h5ui302nbesg094g4sfldc4', 0),
(74, 'conerowsky', 'cedff29085b6caef096cec6abdf36dd13ddab9fdb43e2b14b024d899dba584869ae49058e7a894887825e282449fc2fd5588386dec036e153500487aeec56be3', 'Nermin', 'Alic', 'conerowsky@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508847738', '~', '~', '2017-10-24', 'bih', 'no_avatar.png', 'cover.jpg', 0, 285, '', 0),
(75, 'Delija123', '8c6b35512181f12cf835ce3ad1557e586f51af4e63bcc7b0b0e2d26dd4d395c9ac8490f2d5931be3898e480680cab77f88ad64f47f6a394be6828e73915a908b', 'Amer', 'Delic', 'amer.delic03@hotmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1508852295', '~', '~', '2017-10-24', 'bih', 'no_avatar.png', 'cover.jpg', 0, 66408, '', 0),
(76, 'tosadesigns', 'f73e671cd600838bb3154f04799e15fef23f45495f9a5ad87b0de207d0d1031b44d7688ea188c3b95ebcc1c96b275167e4cda94c68541260dfe07b2708555c8b', 'Ivan', 'Dusper', 'tosadesigns@gmail.com', NULL, 0, 4, 'Aktivan', '2017-11-25 16:20:39', '1511624146', '89.164.20.175', '20-175.dsl.iskon.hr', '2017-10-24', 'hr', 'no_avatar.png', 'cover.jpg', 0, 39296, '5398p3nqj3sc2r86uvco94r6u3', 0),
(77, 'AmarB', '4987ddd9458d54b7871a548dbd36e63ba914e3a7ed6983ee0a777d91c7996abeca8a2a1753336a3856148b89a497e16b899514758bfa53cee8af85b5abb20b56', 'Amar', 'Ivkovic', 'amci.ivkovic@gmail.com', NULL, 1, 3, 'Aktivan', '2017-11-18 23:14:41', '1511043321', '185.6.107.94', '185.6.107.94', '2017-10-24', 'bih', 'no_avatar.png', 'cover.jpg', 0, 16858, '5nksd7c6lsgmpo6be6k8tm0cu6', 0),
(78, 'Marinac', 'c70b5bce424b209bc3ca209e6853b6a209fe76645398e4cfa508c06c8bb0d30cca0d04a60e189a611890b0b58898f662842da0e707aba9a025367280ef2461f2', 'Nikola', 'Marinkovic', 'marinac@gmail.com', NULL, 0, 1, 'Aktivan', '2017-10-25 10:19:25', '1508919925', '91.148.90.158', '158.90.148.91.adsl.dyn.beotel.net', '2017-10-25', 'srb', 'default.png', 'cover.jpg', 0, 13349, 'lg1e17kqsc5shbpove036j1713', 1),
(79, 'nelesteam', 'f6d86dbe10d47d27a152628177707175190d7fac2b4dd86e9418c21c847b9efe94a4335e36be1380de5c7023ba64b3465db99df7f67eca0e6f99e139c191f4ca', 'Nenad', 'Cvetkovic', 'ncvetkovic400@yahoo.com', NULL, 0, 2, 'Aktivan', '2017-10-26 19:36:43', '1509039407', '178.220.97.1', '178-220-97-1.dynamic.isp.telekom.rs', '2017-10-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 29338, 'u223r3k9asfghpg9mltqpdp3p7', 0),
(80, 'BalkanServer', '1e87e08eb7ec35e6d235a3344993b596afaf98f4bc745140934ebd2c9e8f4f136df8a3bb8a9b1d6379d216293772de2366ab16f35e10e9c0c74f4a1d99fff9bb', 'Stefan', 'Ilijic', 'xdgejmeri77@gmail.com', NULL, 1.5, 1, 'Aktivan', '2017-11-26 15:01:34', '1511705065', '217.65.199.84', 'katelnetwork85.customer.telenor.rs', '2017-10-25', 'srb', 'default.png', 'cover.jpg', 0, 1, 'rgrttda3hggfo64d3nsmkhuu54', 1),
(82, 'lazarjaksic', '8971a33e0f117bf86a39e2bd4b8e8aef160188cb5c2ebbeed3896fff8fcd9aec7e321a640efa395a260eb8cc5f9048c1c11619073e7eff0ceb956486556d2a8f', 'Lazar', 'Jaksic', 'ivictomislav4@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-25 20:58:24', '1508957910', '89.216.176.53', 'cable-89-216-176-53.dynamic.sbb.rs', '2017-10-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 83381, 'ju5rksg17u44oe70venhqpd1f2', 0),
(83, 'Lukaa', '29962a549a20a47f612b7cdc34132eed2934f73eb0bec5ecf2d3fbb69b7ed10cd7736c8f4b2258440705175aaa233b7286d227e173b6beacf1e73c9bc9e2af3a', 'Orescanin', '', 'orescanin077@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508957404', '~', '~', '2017-10-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 99964, '', 0),
(84, 'Saric', '18ae18da39661ea44b7fba350d208418e90beb696300a756e1cf18e751fc2e25ea6c63f3bf1abfe85f920ae174044fa1b7a06d01c673386e2f7416030e395500', 'Dominik', 'Saric', 'boss.samp01@gmail.com', NULL, 0, 4, 'Aktivan', '2017-11-21 11:41:24', '1511260887', '83.139.78.202', 'dh78-202.xnet.hr', '2017-10-25', 'hr', 'no_avatar.png', 'cover.jpg', 0, 61580, 'mfbts35pg6759mv0n4jc62d360', 0),
(85, 'KvAKaan', '251b12e569701176752fdcfac51a6bbfd2ce6c93b5368360c933d614a0c6fff50cd66f9c4e8ccacfcfb8f2bcd21ca46478655880ffb1267798f3fbb0a65a4d5a', 'Djordje', 'Pavlovic', 'pavlovicdjole1337@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1508963486', '~', '~', '2017-10-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 41071, '', 0),
(86, 'Macak', '4d62cd2821a08ab6120ccfea3eec00c4314929424217e96e2011138eb25c4e75f82b7f1f66d54816fbfc0a2bd034910ea33c7973ea5a5f21321885729acc6c5d', 'Macak', 'Dawn', 'macak.dawn13121312@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-06 17:08:23', '1509985056', '81.93.72.86', 'rev-72-86.teol.net', '2017-10-25', 'bih', 'no_avatar.png', 'cover.jpg', 0, 48510, 'ib0shv2eofl3sjpfruj7vua3p4', 0),
(87, 'Andrija123', '76d1a766bbbdb946093ae602e7eaea4c23bee3355d84db68edeabda0848d08fc557d8900e5cc29be0ee449dfed22bcb6dcb2fe77521f6ba2a017cfb45a3a63f0', 'Andrija', 'CsProfil', 'radnickipb@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-26 12:47:49', '1509014902', '109.93.200.69', '109-93-200-69.dynamic.isp.telekom.rs', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 17921, 'cmeb2edgp7g2ksrfa5mmm8qqu1', 0),
(88, 'Ognjen', '173d7d972546814e9e5187e845e253b895e8e092b121cd0ab0c074e5eff6809e6bc5541841a9b8789152a7e17030856168517e2419a8a4f8d6b6099e0bb94ef9', 'Ognjen', 'Predojevic', 'ognjen.predojevic787@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509025369', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 61990, '', 0),
(89, 'Nenad12346', '6c2f02ae99e1ba284e335e45405f2c2bc49c7a507f507ca03a14cfda82665a22ba74156f9d5e87bb4355c49017c877b8eee8edc8ae59e2f60e2097ca9808f2c7', 'Nenad', 'Bogdanovic', 'nenad4188@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509028680', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 3590, '', 0),
(91, 'IceRushBH', 'a6e0f1fef980736f6c770dcab10d25ffccc8988f24f363412ddcfb7a55569be59c7649c7d4c35034aad55b5b76a13970f53c82d1692c108ab9c5c4a21b63bd00', 'Ice', 'Rush', 'sarmasarma123123@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-05 07:49:04', '1509864551', '31.223.132.107', '31.223.132.107', '2017-10-26', 'bih', 'no_avatar.png', 'cover.jpg', 0, 72954, '101nacvl4md50b0eh82rfac993', 0),
(92, 'SaricSB', '583949ce58a8bdea4cec3bba275e368ca34c83df864638e190863c5563c35bcdadc22b62ee01ef866ebd509e82b7197a22bd448a216acd8253b45367eaa8306d', 'Dominik', 'Saric', 'dominik.saric2001@gmail.com', NULL, 0, 4, 'Aktivan', '0000-00-00 00:00:00', '1509038345', '~', '~', '2017-10-26', 'hr', 'no_avatar.png', 'cover.jpg', 0, 8155, '', 0),
(93, 'Nickee', '04eec8c1d82bcc038d59bb7c947a6be5ddcf10d2c28cb9a1a35d7a1b7570d61d7e825fe95927eef08c44966e85afbda1a76f0927966a863419e183f6b8a4dc4c', 'Stojanovic', '', 'hejradio1@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509038859', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 26774, '', 0),
(94, 'Lazar', '75f201e2bc9af80c6ffa39bb9be3290c1f5fc65afebaa8cb2d618b2f3e2fb3b771495388af72ad0da18a831bc6988865e9a253318ce3aea5e1fad4c0c849ddad', 'Anes', 'Suljic', 'lazar.lukic@gmail.com', NULL, 0.25299999999999967, 2, 'Aktivan', '2017-11-28 14:30:45', '1511875935', '217.71.56.224', '217.71.56.224', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 0, '7nog42jvp8ra65c1cp8asjn904', 1),
(95, 'spoksy', '9c4728bd98e41dd183ccfb3be2b287ba1d347d83641ac67ab74502a633b266f9d5b3ad965072f6c7d53e178c10b43e8f1a09ff835efe1794343dc5640dcb5d43', 'Vane', 'Trajkov', 'vanetrajkov28@gmail.com', NULL, 415.4360000000001, 2, 'Aktivan', '2017-11-26 16:15:28', '1511709280', '109.175.97.207', '109.175.97.207', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 1337, 'vi3l2q6vkq4s671ghn2qlogp72', 0),
(96, 'Soild', '5e4dc36651ef8363c959e72b8aeddd14c0245016d9a1c60c1da9f8aadcd3a656ad17f393fdcb002497ae7093ecb47fa6a3ca8e151491f005b5b319733f3a891b', 'Nikola', 'Petkovic', 'jankomarovic@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-26 21:08:28', '1509044928', '91.240.43.75', '91.240.43.75', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 39167, 'kl1kben5q2c4r8rkvbuoidqkl3', 0),
(97, 'PESICHHH', '4d661f47febacf3b5a54922a870aa012bd877fcfd8f079c5de3d7a0c2fa58e497e1a47f2eaecb2f25d9a01eef81770109ed2e7d7671ff8368cbabe6b46e5e4ba', 'PESICHHH', 'A', 'pesic.aleksa321@gmail.com', NULL, 1.9280000000000008, 2, 'Aktivan', '2017-11-03 19:10:48', '1509732776', '178.219.1.108', '178.219.1.108', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 1337, 'pl4r9e8nh515d79dd7medenc50', 0),
(98, 'Marina Rogljacin', 'dd31f64c6ef62f59c5cae6d5db41d24fcea1584bbc2a5b3192ef7ac39a4a20c96f219da7fb0ca90bbb7b52fcca0c39cdb6c7693fe0a1def2d250d5f4e5ac123d', 'Marina', 'Rogljacin', 'makirogljacin0@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509045888', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 34669, '', 0),
(99, 'Marina', '930152a3a773a6fec0cf05797905d96589060234244adb897872de9477499a59360725d8fa95c66a64c5a16b1dab26df7ca154739ebc11dbdbf36481a1e77d3a', 'Marina', 'Rogljacin', 'makirtogljacin0@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509045962', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 59722, '', 0),
(101, 'FTWAhmedYT', 'c95b19c9f589a05095a23275fc9b382f722361dd42122be4c5b85add62a4b95002bb027c8d468fa32f0ce0c8197e3c4a5de2ae3b3e44a65fbfdde55360378321', 'Meho', 'Rikic', 'ahmed22ahmed@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1509049374', '~', '~', '2017-10-26', 'bih', 'no_avatar.png', 'cover.jpg', 0, 97741, '', 0),
(102, 'marko42', 'bfe7af495a71673549148f225273802acd3ae002650d0c980b287fb65dbec5c7d215a5a048d941e07e8259add40870bc85fea65558434b3215305e6dec8bbb1e', 'Marko', 'Zuber', 'markozuber2@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509053431', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 68352, '', 0),
(103, 'marko422', '79600c410a09ea9068a689084632e1dbf6dbab36a752c7334c0a62411a295e10a2305f10a6ee4c46302013d21da97399994b7eea6bf198d249f3747ac1367e5c', 'Marko', 'Zuber', 'markozuber507@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509053505', '~', '~', '2017-10-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 72801, '', 0),
(104, 'Fanso', '11d79026ae76caa435b1cd45ef1e14f76cb78636758097cdfedc282a43d9f4d8e570f59ea5b6e29b125af1282e00a591523bd62f9ce4323b8cf1c752c11d49da', 'Pavle', 'Jovanovic', 'fansosfxoff@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-30 14:07:07', '1509368873', '91.6.174.183', 'p5B06AEB7.dip0.t-ipconnect.de', '2017-10-27', 'srb', 'no_avatar.png', 'cover.jpg', 0, 81082, '555b9dtdmjttp4nmfhos4hdtu4', 0),
(105, 'Jogurt', 'e7c7c1df7ec5225eb86ad385a866dfb9bcedc9baa89ef169e650b94940a38e3733866993a400299f3815af5491ec357de30bbe7f8268d1d10f7e14c3687aa500', 'Pavle', 'Jovanovic', 'jogurtez2@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509108266', '~', '~', '2017-10-27', 'srb', 'no_avatar.png', 'cover.jpg', 0, 68799, '', 0),
(106, 'Stefan', '9d969afefc111b0f473372471b57fac56cc6a5dfccadd5b8000629fadc9eaababf6269b9108734724437632e06afd373b4516c87d3aa9158baae43925da5cbff', 'Stefan', 'Djokic', 'lazargamestv@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509109820', '~', '~', '2017-10-27', 'srb', 'no_avatar.png', 'cover.jpg', 0, 84201, '', 0),
(107, 'Dragan', '9a6231bae9c2e8ea85381260552f0dbbac281dc7ecff0c329fde7f7c6c9221474ea46b3ddbbe1dcdb78c4b62f82b57dc76476681eae7350088d950fa15865506', 'Samper', '', 'kebaametovic123@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-27 17:31:15', '1511800378', '89.216.72.211', '89.216.72.211', '2017-10-27', 'srb', 'no_avatar.png', 'cover.jpg', 0, 1, '3hvlvbmbu8rdn2r51mmm4q29q3', 0),
(108, 'Imran_', 'a3137e5968a91d8ee2ffaba451f1816e1981ffbd8653c07cca3064c352029a8208d7d4595769e971bdbeaf4d72afb10e8a28d306fc7f8f13c88eead49ede897c', 'Imran', 'Cehajic', 'roupegaming123@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-29 13:53:56', '1511960045', '185.16.12.146', '185.16.12.146', '2017-10-27', 'bih', 'no_avatar.png', 'cover.jpg', 0, 74897, 'g82mcpjdh7kasnea9u850ase32', 0),
(109, 'Ciker', '7196efdf928ffe66fc0566269df842f30267b41e6e9e714bb8c37faaee694c5896aeede44901c603015823c2e0217143f492d81240a215bad0a4fd3b1a6dc64a', 'Nikita', 'Sibul', 'microfix1252002@gmail.com', NULL, 999928.5579999997, 1, 'Aktivan', '2017-11-21 22:38:01', '1511302956', '188.2.237.240', 'cable-188-2-237-240.dynamic.sbb.rs', '2017-10-28', 'srb', 'default.png', 'cover.jpg', 0, 19101, 'ns9kgfuch22p1d0t7ik2nspot0', 1),
(110, 'Nebojsa', 'bbfa85f3cfd9573c3e9369a10570d369a6c0a003111d1892864b3ee5fcfc5e5aada3f84c41209bb4c31a95624e09ca8c4e02d9cd51cff23037efeef07594f915', 'Nebosa', 'Mitrovic', 'mojnalogbre@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-28 12:55:13', '1509748350', '93.86.244.18', '93-86-244-18.dynamic.isp.telekom.rs', '2017-10-28', 'srb', 'no_avatar.png', 'cover.jpg', 0, 90940, '8s344u3ds0fe0p1c7tpee17af7', 0),
(112, 'wutra', 'fdcd1659b66579f078d9fd3a6e5ce77b921f81e0a15fd36a9a19d90814bce23db4caa441b57d4b6f21779fe956a2d974dce2bfc3a26e867853126726b28f711f', 'Elvin', '', 'eviiboss825@gmail.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1509188894', '~', '~', '2017-10-28', 'cg', 'no_avatar.png', 'cover.jpg', 0, 70909, '', 0),
(113, 'Kristijan', 'af0c4b3e613aebbe043b895410ca21cf824ba83a48bf1cee2c03ded3e801158b7197e75b7c6b65bf2cb4112881b5ccf8605513b451eebd61ad50492df6a38e0a', 'Kristijan', 'Andov', 'kristijan_andov@yahoo.com', NULL, 0, 5, 'Aktivan', '2017-10-29 10:53:51', '1509812559', '95.180.186.191', '95.180.186.191', '2017-10-28', 'mk', 'no_avatar.png', 'cover.jpg', 0, 25640, '0n14c6ja0opsrkt3llfd246bn4', 0),
(114, 'minefuk131', '2fdd709f852466ecdf6398999056e27b6c3f27bb791d56de62181d06525de4603111979e467f77e8a1a8156d4966bfe0db8c96f2828d83220256ed03d866b118', 'Stefan', 'Mihajlov', 'minefuk131@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-27 19:53:06', '1511808796', '89.216.133.42', 'cable-89-216-133-42.dynamic.sbb.rs', '2017-10-28', 'srb', 'no_avatar.png', 'cover.jpg', 0, 50740, 'l79ihjod57jpm6p6mqembtd3k2', 0),
(115, 'HarunGamesBH', 'ca694053559a4ccf563cecc390c8b181a0efb78f1f034cfc4e44e9d234a2ceeff2d656cc3a03423c2508ee8a312dfe289b3c3251f5d4a140f958d790ef5c9561', 'Kristijan', 'Djuric', 'kristijandjuric@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1509193599', '~', '~', '2017-10-28', 'bih', 'no_avatar.png', 'cover.jpg', 0, 92469, '', 0),
(116, 'Pottery', '8485a4b58fd769d617892eeb01bb19d85ef59d5bbf908f78a108519bb962f03c77b7310e7d4ef2d2deeb4e46bbf16187e2a43ca3cc4d98e3b059d01fa4c1e8ad', 'Harun', 'Djuric', 'harun.youtuber@hotmail.com', NULL, 0, 3, 'Aktivan', '2017-10-28 14:29:41', '1509193783', '37.205.25.133', '37.205.25.133', '2017-10-28', 'bih', 'no_avatar.png', 'cover.jpg', 0, 42135, 'n0cb8hji34ublmnrpil94rk2r5', 0),
(117, 'guarana', 'd957bcace735d83c94bc0167402778a88b6718df3fad9524d0b2208661c9b2a71f3166f6d25156d3751f7e132b5ae7963fd4429adbdf0304010f3d73782ad194', 'Stefan', 'Jovanovic', 'stefanmatrix2002@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-02 20:21:53', '1510091303', '178.149.22.57', 'cable-178-149-22-57.dynamic.sbb.rs', '2017-10-28', 'srb', 'no_avatar.png', 'cover.jpg', 0, 71182, 'aq23ih8ceqi13ki9ti4r37nth2', 0),
(118, 'Mixajlo', '5171fe845315050e58f08c69917ec3552f7dd064fcd8fa30cfcce38b57b7a9a974f31fb2b613b7d8dc0e8e82db18eec25a2829f4d3b444abdc7504e9f222b9c4', 'Mihajlo', 'Krstic', 'mihajlokrstic199@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509203667', '~', '~', '2017-10-28', 'srb', 'no_avatar.png', 'cover.jpg', 0, 67961, '', 0),
(119, 'Mixajlo123', '3f7fa62a4e652c20c66d1eadafabbda64b864d1e5e4762f0f7e6441fd48011e65713fcc82808ae9e7af42f23b12df584d60d5019af545e5a8463ac72ae4586c4', 'Mihajlo', 'Krstic', 'mihajlokrsta123@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509203739', '~', '~', '2017-10-28', 'srb', 'no_avatar.png', 'cover.jpg', 0, 31013, '', 0),
(120, 'Mitch_The_okay', '162cf4d1e96736380a96e163f4907472f17e5bf1580db9351d0035c983440b8ad6df8a8a4c3a3bb07c7c3deb8387c9284722adbc670ceba02d922546016cc1d7', 'Filip', 'Misic', 'mitchokay011@gmail.com', NULL, 0, 4, 'Aktivan', '0000-00-00 00:00:00', '1509226824', '~', '~', '2017-10-28', 'hr', 'no_avatar.png', 'cover.jpg', 0, 47447, '', 0),
(121, 'Mitch_Army', '7046d560f74ed6e2a7a533cd5a53c2d621f367c8bddaa2b2a373f75ec7274ebffccc9b3720c0c9a8a39c63aa3f6a2c863a945f149b2af014de709d404c62c361', 'Privatno', 'bracala', 'mitcharmy011@gmail.com', NULL, 0, 4, 'Aktivan', '2017-10-29 14:30:46', '1509283950', '89.164.34.81', '34-81.dsl.iskon.hr', '2017-10-28', 'hr', 'no_avatar.png', 'cover.jpg', 0, 2752, 'k89l9t077bglqljjm5at66sf44', 0),
(122, 'AnKeZ', '3655d5b30f8ad668b56c250d5ac5601726e58046efc0c8fef6697f1b0596cfb6ee7f8a598579e0b94762bf02d5033cb3b66d0833466a6ce8542b54314225166b', 'Anes', 'Toretto', 'anes223@hotmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1509281745', '~', '~', '2017-10-29', 'bih', 'no_avatar.png', 'cover.jpg', 0, 38014, '', 0),
(123, 'AnesB', '3052762fd56de8b3bc778479f19c0e16738214355f800276289d3ecb6a0bf049121c2c9522706af7c855d4e688869ff92b9b444b93d7dc781f0f3e5bf0e238f1', 'Anes', 'Toretto', 'anesko123@hotmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1509281939', '~', '~', '2017-10-29', 'bih', 'no_avatar.png', 'cover.jpg', 0, 83876, '', 0),
(124, 'KullTV', '354b1cc53f30ef14a1ac3112197970a04745553f035dbbfabec98d6caad060ea89b655526adeb6ee450e8fe79a6c4b29b6b9818c87ead7dbbc3d5d31576a46e3', 'KullTV-Byee', '', 'xdgejmeri88@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-29 16:25:48', '1509290732', '178.148.152.191', 'cable-178-148-152-191.dynamic.sbb.rs', '2017-10-29', 'srb', 'no_avatar.png', 'cover.jpg', 0, 43310, '140gr5v1g3q6ohskqdcvgp1vu1', 0),
(125, 'Bizne97', '0a9c77080435d67d955f52d28afb62c3faed147ff741ec7ac45c7539497193a9d13d3151c51ae8b5bf718b9cf5d1779d62360b0ae80369c38221d7275a1e7a69', 'Darko', 'Petrovic', 'darko.petrovic@yahoo.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509288798', '~', '~', '2017-10-29', 'srb', 'no_avatar.png', 'cover.jpg', 0, 72025, '', 0),
(126, 'Toske', 'dc13c29ff7d7144d09903d4171df11552ac8639a0167528744a7cf63debb4d1a8da82cb3dcf19ab0a402709afd81b355649b0e3bcbbf763a8620e4f2906977e9', 'Danilo', 'Bradic', 'daco.daxilend1@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-30 19:32:47', '1509388372', '178.148.152.191', 'cable-178-148-152-191.dynamic.sbb.rs', '2017-10-29', 'srb', 'no_avatar.png', 'cover.jpg', 0, 42565, 'i91ibfhk7eot2v5b1mj1oeeg01', 0),
(127, 'hmd1337', '013e81ac627d8bb9b863ba7087b6cf01bef2a6aa388e6880d15002a34790a4c5e95768f85fbdefc6eed13a92a551b2e60b0e20a3bc57fe4cc7d1c90f8bbfdcc5', 'Ahmed', 'hmd', 'ahmedprivate@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-09 17:41:39', '1510245789', '109.175.97.54', '109.175.97.54', '2017-10-29', 'bih', 'no_avatar.png', 'cover.jpg', 0, 89320, 'n54cv69vcg6rkrpb7mucu5ug92', 0),
(128, 'BrucYka', '4a59f84dca7e997e61e1636ac91e9918dcccfd244e34f020cfac40ea88be6a94f20bf7409ee3d766a5100b7b3c4b518ff36beb218cf4cd0616416922d38123d1', 'Jovan', 'Cvetkovic', 'karamela0312@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-29 19:24:26', '1509301971', '178.220.68.82', '178-220-68-82.dynamic.isp.telekom.rs', '2017-10-29', 'srb', 'no_avatar.png', 'cover.jpg', 0, 77849, '8diorgjcfej1lr1c2hi4o45r32', 0),
(129, 'David5253', '6e3e7acf1aead5ff135217b99e531e0b994da5a2f55fc18b6737093d2aa3cd26a0897e8f0a1520a3edd0fef97c12c60440559ed87e66b90cf9ea3e4acc00e9c3', 'David', 'Kraljevic', 'daki0fdead@gmail.com', NULL, 0, 4, 'Aktivan', '2017-10-30 06:08:02', '1509340177', '78.2.97.33', '78-2-97-33.adsl.net.t-com.hr', '2017-10-29', 'hr', 'no_avatar.png', 'cover.jpg', 0, 90995, 'dn61isv4jhq5h326sc1s72h3m0', 0),
(130, 'Deagle pro', '7a2ebf9bfc123099781111a2320bf90791b3cf5d3349eb07fdc8915345ac3a2313001c84b5ec7117776ab36d46f194bfdcd1f52bf7fee80a944b7d969d8e9cec', 'Nikola', 'buric', 'bukicnikola8@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-29 21:48:14', '1509310276', '77.243.22.117', '77-243-22-117.dynamic.vipmobile.rs', '2017-10-29', 'srb', 'no_avatar.png', 'cover.jpg', 0, 76795, '3rf26b9df08dhenqhuctpl7f63', 0),
(131, 'Redzovic', '68fc69ddbd728fae8171a3479426477a46472f2ebd83eb235a7b87136bae036ebbe4bab85777855c809cc03e80483e3073e476ea6c4c34704f1dc1fe643f1313', 'Redzovic', 'Ersan', 'ersanmontana2@gmail.com', NULL, 0, 1, 'Aktivan', '2017-11-05 02:23:31', '1509845008', '46.161.83.241', 'adsl-46-161-83241.crnagora.net', '2017-10-29', 'cg', 'no_avatar.png', 'cover.jpg', 0, 7186, '48blrfu8drdulr58g0vrp2gsu4', 0),
(132, 'Afrox2000', 'eb14737202a2178acd838119de4d50869ceabc370afb22fc6807abce49f71fd97fddbf8af2fb713b9f70da6c55691ba49b174488fda5d10d8c3f002952a6965e', 'Milan', 'Pilipovic', 'milanpilipovic20000@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-19 02:24:59', '1511055470', '46.17.121.105', '46.17.121.105', '2017-10-30', 'srb', 'no_avatar.png', 'cover.jpg', 0, 3823, 'm5troh35ogfomof0lldv58a804', 0),
(133, 'Coleman', '13a0c05ef1827a3c5bded2f92b3e804a39c8cefa5bd59807dfa5c49cc1b45a51c9fdf2773b99e9c86858e6134223d81a7ca45f5246a58035ef45bc41ce3b0500', 'Dusan', 'Peric', 'ludikiler.ludi@yandex.com', NULL, 0, 2, 'Aktivan', '2017-10-30 11:54:25', '1509360972', '46.17.150.27', 'cable-46-17-150-27.dynamic.kdsinter.net', '2017-10-30', 'srb', 'no_avatar.png', 'cover.jpg', 0, 8137, 't8um5q5247c7bp77raq9dvgbc7', 0),
(134, 'danijelt99', '1176e461c5c013aec5251536a5245bb2b447ee0fc7b6b9ebc006ad16be1e1fcba426caebfe9a9806cc3c8ad2358eb18c66e3df9e548ee851b968cfd5a4dc19d8', 'Danijel', 'Todorovic', 'kimvisard@gmail.com', NULL, 0, 3, 'Aktivan', '2017-10-30 23:46:32', '1509403846', '93.170.56.112', 'static.res.bb.9317056112.dslon.ws', '2017-10-30', 'bih', 'no_avatar.png', 'cover.jpg', 0, 83112, 'pl3d6lgqjecm42mku4uat81n31', 0),
(135, '1337haxb0i', 'cecd3ed8ad2464f3d99b5038e09d99b62c0626f9db46fc4060c80d2d6fc85565f1f74e485e70db645e15ca3d619deb81b64b17aa74c7327bc14fb42c26874c90', 'HAX', 'HAX', 'sikplejer1337@gmail.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509389594', '~', '~', '2017-10-30', 'mk', 'no_avatar.png', 'cover.jpg', 0, 63971, '', 0),
(136, 'Toske1', 'e234a5b5544ad5466e9f58346ef2cdb3fee1819a9a5a0824e24e7c3e1dcda3fe5ab0972f763de29297c4004df481a6f2a3a099c5e1596b1041cf781561908798', 'Djordje', 'Nesic', 'daco.daxilend2@gmail.ocm', NULL, 0, 2, 'Aktivan', '2017-10-31 21:59:07', '1509483995', '178.148.152.191', 'cable-178-148-152-191.dynamic.sbb.rs', '2017-10-30', 'srb', 'no_avatar.png', 'cover.jpg', 0, 4256, 'q6hoht1pj9i3luhil2nb5ii1l4', 0),
(137, 'ZIrIs', '4edddff00ef96e083892abee159d390c87346058c5e9b80542dbc79171d300c7caf7444ec13b0c038c6ecad34cfcc9655826eb0613309aa9bfda461c2686b0d9', 'Iris', 'Zinrajh', 'zIrIs5@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509397244', '~', '~', '2017-10-30', 'srb', 'no_avatar.png', 'cover.jpg', 0, 33715, '', 0),
(138, 'marko143m', 'd39b19b7758b5fc5a1f90d33db68c675b4ee1265e388ce47f90ae0b0095f3b8f8ffb6760082ef1dd4d7430979d3af519355fa650b51cededa107481ec2a8d2f7', 'Marko', 'Todorovic', 'markotodorovic38@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-02 11:39:36', '1509619244', '79.175.64.104', '79-175-64-104.adsl-a-1.sezampro.rs', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 37816, 'm9j99c0gok1eik43niu47vtvi0', 0),
(139, 'jaksic', 'c18c9ff1517bb6170590b3d19efa7ca94288ec9a94e4e0125c86178ef31a9436e076da81233dcb8ce3825f36876853d4b90746532f25930c0d13da78e25a2ba0', 'Lazar', 'Jaksic', 'jaksic@e-max.xyz', NULL, 2, 1, 'Aktivan', '2017-11-18 14:26:52', '1511011618', '89.216.176.53', 'cable-89-216-176-53.dynamic.sbb.rs', '2017-10-31', 'srb', 'default.png', 'cover.jpg', 0, 1, '094jphu7svn5s4iuu8c7kvi1c4', 0),
(140, 'Eldin', '98da9f2fb8ab8012870e6faece5a4769987af6a886f79e707ee6d84974d3f3f15ac5718e395b7259a379a58a28ecb057b7c3eef22097643278dc745962d735ac', 'Amar', 'SA', 'eldin1513@gmail.com', NULL, 2.3712, 3, 'Aktivan', '2017-11-26 15:40:29', '1511707283', '109.92.76.190', '109-92-76-190.dynamic.isp.telekom.rs', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 84779, '8te5polebpl48nhqkk764avq16', 0),
(141, 'agonytB ', 'cfe9eaae15a8e4474e6944b7c35358da9152d46e250e6bf17031458ad7557a05c2720a51ba30c38e892fd35e8371a9a0a9a8a0c791ecd4027837b2e0a89fe817', 'Marko', 'Vidakovic', 'impumvm@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509457758', '~', '~', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 89704, '', 0),
(142, 'pavle', '30eb188ac6fe3b01984db536c937ff3995d03588768ae23b29235d758aa4e6bab6d117f5b8ff138554c888b6fc645eeda3274eda3f67db9bff494ee3ed7abbcc', 'Pavle', 'Mitrovic', 'pavle.profesional@gmail.com', NULL, 0, 2, 'Aktivan', '2017-10-31 16:32:31', '1509464007', '178.221.183.68', '178-221-183-68.dynamic.isp.telekom.rs', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 3785, 'sll275i6e2lcj17udoiqukffc4', 0),
(143, 'batica', '7fab435fe99037760a51bcd445fdf62c37491ffb0b35aa0fac0ddabcbd719ec3af151a4b66e7ea6022fe75b259ec868615924a8422f9c688a327df5305192597', 'Batica', 'Batica', 'batica@gmail.com', NULL, 0.33000000000000007, 2, 'Aktivan', '2017-11-26 11:13:51', '1511691242', '94.189.192.125', 'cable-94-189-192-125.dynamic.sbb.rs', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 55540, 'rt96vhs8ae40osgbavq07v5ed0', 0),
(144, 'makaveli123', '2760bcf38099e73e5689e6db06e9907dd80bb04c8a97eb49249c8259b8dd210114f7f0526f7a06f6ec29747a7a0323ffd90c537db3e4ee2cf7bd9517bea29aea', 'Bojan', 'Konstantinov', 'ahamokee@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509465948', '~', '~', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 14349, '', 0),
(145, 'bero1210', 'b12fc0283f052c6be4c5d0e8128bbd34f7f9beca66858bee6d9f18af3ee21122473c7dd91c92331649dd2130388dbc38b9a08e4f312e4641b29310d3d3931c95', 'Andrej', 'Berkov', 'andrejberkov98@yahoo.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509468693', '~', '~', '2017-10-31', 'mk', 'no_avatar.png', 'cover.jpg', 0, 55478, '', 0);
INSERT INTO `klijenti` (`klijentid`, `username`, `sifra`, `ime`, `prezime`, `email`, `beleske`, `novac`, `currency`, `status`, `lastlogin`, `lastactivity`, `lastip`, `lasthost`, `kreiran`, `zemlja`, `avatar`, `cover`, `banovan`, `sigkod`, `token`, `mail`) VALUES
(146, 'berocar123', '39958b5344e771fbdb3382be3313cc9b0c67163b4637d1e778d54e53cebf321d750435e52d3eb7fd100b68e5251b4cded3dbad47c0b526e88805cfb468c3254a', 'Andrej', 'Berkovv', 'andrejberkov69@yahoo.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509468823', '~', '~', '2017-10-31', 'mk', 'no_avatar.png', 'cover.jpg', 0, 94804, '', 0),
(147, 'berocar777', 'd94b54e1dda156eebf73eaee61072d5c95a1f8a1b4cfd01b7f3094aa2b00aeade14692f4ab02c31d0ebd1985d8e6ee5d68c21ec4eddb5ff4b6a3490db638647f', 'Berkov', 'Andrej', 'andrejberkov989@yahoo.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509469005', '~', '~', '2017-10-31', 'mk', 'no_avatar.png', 'cover.jpg', 0, 60662, '', 0),
(148, 'berkovandrej', 'daa1bf63841fafaaad14422f43c6f04a889162cc309f6c05532901efda44a3fe8726edfdf003ecd0003f8f2b53765658671ce1d8b0d89dd3d5c90cf135d39f19', 'Andrejj', 'Berkov', 'aberkov69@yahoo.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509469225', '~', '~', '2017-10-31', 'mk', 'no_avatar.png', 'cover.jpg', 0, 9956, '', 0),
(149, 'dzambas21', '74d91977632517435090fa74595fb0ecf7d43dee88c941ea263784a8551e7eb79b2861b771f30818b1563fb16e8a3cd7c6ddb0948031f70cf020cc566370a53f', 'Nemanja', 'Milosavljevic', 'nemanja.dzambas1@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509489952', '~', '~', '2017-10-31', 'srb', 'no_avatar.png', 'cover.jpg', 0, 72722, '', 0),
(150, 'Kemcy', 'd386e54eec6b955a77c1bcf42a81d062fa5799a5467fc3cbcb303f292d6c272b07198215b57290de4cb5a676457ef340353ec7fa294a7e6ab707fb3ed2e6eba6', 'Kemal', 'Pjanic', 'kemcybusiness@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-02 17:48:21', '1509641303', '109.175.98.171', '109.175.98.171', '2017-11-01', 'bih', 'no_avatar.png', 'cover.jpg', 0, 34143, 'em8b0073vvjcb6jakn7nporok3', 0),
(151, 'Black Rose', '941bcafcfa953e1bea98c270db319e5d52d07eb9a0d579f3f87822e0666cd46581c4b1fea2c64bb955035cc1a22719c4746247017d8541502961e6d8a82a221a', 'Andreja', 'Damnjanovic', 'dandreja123@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509619635', '~', '~', '2017-11-02', 'srb', 'no_avatar.png', 'cover.jpg', 0, 48769, '', 0),
(152, 'sandro', '6dd73a03f0ef71b3fd5fda872cd3cf0d9c566da9559a38e58b6266600d77c3f4be512e58e817fef4d29d6bd73e7c118558113ff312255ba0d75929048643b462', 'Sandro', 'Muharemovic', 'vesicveso8@gmail.com', NULL, 0.3, 3, 'Aktivan', '2017-11-06 20:54:45', '1509998288', '5.149.65.15', 'z-dug-15.65.avax.ba', '2017-11-02', 'bih', 'no_avatar.png', 'cover.jpg', 0, 23518, 'i7dnu56f269514k0q44nmcadq0', 0),
(153, 'Djomla', '9e23b0cbf390312818ac6cbaad3be547d77f74938dd2078efeab4100916b2c84ce0b498d0b5371bce9fcbf682e90bcdafd6391e5e0249ba2b62db2d1ffcb93e2', 'Mladen', 'Veljkovic', 'djomlaveljkovic123@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-29 22:50:37', '1511992240', '185.47.210.225', '185.47.210.225', '2017-11-02', 'srb', 'no_avatar.png', 'cover.jpg', 0, 20876, 'tdu1kerqlh3jtgmd4m77vaki63', 0),
(154, 'Anthony', '04b488c2935a32617362d81fdb50d4977e84e825c177bd1f0421af1987249a2b8869e33bb443163e7c7d2fe34db72fb7b7a2636d4863d6b51977047deb352244', 'Anthony', 'Enigama', 'anthony@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509650209', '~', '~', '2017-11-02', 'srb', 'no_avatar.png', 'cover.jpg', 0, 63419, '', 0),
(155, 'Shone', 'be67c03ddb26966373244b096263836a69efa96c82610737d1cee91d1708db1cb949c6e477d3fa6bb7468ee36aaf2c3895e464877cd492dbd177279a6e84d141', 'Shone', 'Chivas', 'samperbalkanski@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509650244', '~', '~', '2017-11-02', 'srb', 'no_avatar.png', 'cover.jpg', 0, 36775, '', 0),
(156, 'Bakir', 'f4efd0045af46327e37092442c3544fc5694366c6e0810b6b89500c81b7643a88872adb707d62d851491a95c69066f76c6ca450c67f61b903456ff04c405cc66', 'Bakir', 'Muric', 'muricamar111@gmail.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1509650687', '~', '~', '2017-11-02', 'cg', 'no_avatar.png', 'cover.jpg', 0, 41180, '', 0),
(157, 'Amarr', '0c56bd8ac70aae3c7f925ba24a0893cdf122f56ee667c3bd8190e1235ca3b773ef9b581deb43f136d1ea768e15570be0650460371e31bbc9c4ef5f20d65364d7', 'Amar', 'Muric', 'bakir121@hotmail.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1509653247', '~', '~', '2017-11-02', 'cg', 'no_avatar.png', 'cover.jpg', 0, 55069, '', 0),
(158, 'Belmin', '6d23962524b1c45faea49886bd9d0f866721ae7817681a7e9993608712410ca3920acb6783c82a624e85c9c06485a8ebf3ac982ad9456dc3ce600aee6cea2588', 'Belmin', 'Muric', 'bakir.agic@hotmail.com', NULL, 0, 1, 'Aktivan', '2017-11-02 21:18:59', '1509654237', '85.94.111.17', 'adsl-lns1-l3857.crnagora.net', '2017-11-02', 'cg', 'no_avatar.png', 'cover.jpg', 0, 68647, 'f4a4ne8rdhoro9eavcl1hfhfc5', 0),
(159, 'Sehaa', 'a296377ccb07a1d9f7362494211f7df7c2b9f837fad12fddffb120670a3967e4e829bdd96a4e74f8642bbdde5e246dd259128992ce9bc835d8f373882875b2fe', 'Keno', 'kaceva', 'sehic_d@yahoo.com', NULL, 37.2092, 3, 'Aktivan', '2017-11-20 17:12:25', '1511194446', '109.93.161.173', '109-93-161-173.dynamic.isp.telekom.rs', '2017-11-02', 'bih', 'no_avatar.png', 'cover.jpg', 0, 99184, 'md868oifv03ke41mhtsqfdlj20', 0),
(160, 'Andrija', 'bf1793797b70fe32c73bc41710017d8d55070accdecfe691cc0408eb7b86bad0f218e456489943b6a123cc3a741fecde17310e5ad2250322eb0df802a7559d29', 'Andrija', 'Vanimy', 'kenisburaz@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-16 10:44:44', '1510825534', '109.93.200.109', '109-93-200-109.dynamic.isp.telekom.rs', '2017-11-03', 'srb', 'no_avatar.png', 'cover.jpg', 0, 83927, 'm2ruaugub1nvmm56bpoof8htl6', 0),
(161, 'Nerazzurri', '8eb9723eaef47eb2870a897bf24453a17c26148180243a8354332e7eca5e799529dfa8a3ad3f2063a880cbf9df1273ce895d98a465537abb1f2a85691287e0c2', 'Valmir', 'Bajri', 'valibajri@gmail.com', NULL, 0, 1, 'Aktivan', '2017-11-03 17:05:35', '1509725165', '62.4.62.163', '62.4.62.163', '2017-11-03', 'cg', 'no_avatar.png', 'cover.jpg', 0, 82171, 'vfbfi0062lm1nbbivpc3imd173', 0),
(162, 'Petar04', '734875c52e6a5aff144be89eb296be4e6ea800e3322f14788d72bde1095b1d8ffa893b5492c787e3d724452c135f73428edcf98d18161a7fe405263b0dce80f7', 'Dokovic', '', 'pdjokovic5@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509726236', '~', '~', '2017-11-03', 'srb', 'no_avatar.png', 'cover.jpg', 0, 82100, '', 0),
(163, 'Dukanac', 'eae09b366e23f7c4c43da8da66f5cdaaf85cb3d4421c9fbd4f625caf8dfbe74ce8d2b31b375babea74bc0d4642b4774247766a418a828682eefd49bdd16c6af1', 'Aleksandar', '', 'dukanac.aleksandar061@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509735739', '~', '~', '2017-11-03', 'srb', 'no_avatar.png', 'cover.jpg', 0, 20864, '', 0),
(164, 'Alexix', '190c3bd805530c1e00708602d0136f20c432c472d39bd0ce3f7b50ebf2b816af2fe100f13cecd16642183d7ac39952d38ad9ef23e738db3896943ff0a4b1c027', 'Aleksandar', '', 'Steam123@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509740518', '~', '~', '2017-11-03', 'srb', 'no_avatar.png', 'cover.jpg', 0, 54359, '', 0),
(165, 'Lakata', '96771ed1b226eb7fc4cbcd6657816342a70d9eff2910fe39ece83c7564404dab20a58ca0d903843c72e9701cf40e9771d4052bacb67eb98f0316a6a746a83db8', 'Lukic', '', 'lakata.lukic@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-04 21:43:46', '1509828189', '178.220.58.226', '178-220-58-226.dynamic.isp.telekom.rs', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 51803, 'kv76r3b5k1hs1dd3rtdck11165', 0),
(166, 'Traktor', '25a82c555468d2ad4c2598213833e60954d2924fbdfefae55df24dc3f7076dc1966c423908a7778fb764dd77cc86900c0dbb89eb426ea7388b5e7a1aa9eeab5c', 'Aleksandar', 'Sreco', 'aleksandarsr2003@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509797579', '~', '~', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 38483, '', 0),
(167, 'Milos_King', 'd7c540729483f4a484e41c031a5c5420f31526c296af05f755748aee005857c503fc7dc03610d7ddfce8a663ca2bdd2cab929ea14f8ae959ee2a2d613920aeaa', 'Milos', 'Nikolic', 'nmilos368@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-04 16:50:30', '1509810656', '109.93.97.4', '109-93-97-4.dynamic.isp.telekom.rs', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 90252, 'h3qofmg7894hti2nf13cg1jt42', 0),
(168, 'Canway', '7180740ffd2a209b9d46042588a6745138331f0e9789bd8d5893ae432b1721f3753c208fc76821989b2405b51ba275f37923cbc364c896a62a36aae0f4be8e49', 'Canway', 'Werz', 'canway@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509808944', '~', '~', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 73646, '', 0),
(169, 'CanwayBOG', '6007c07f93627aed6b11a4c57e75e076314d12ad9df744bfc0a7a85895ab9b12f8b693ae7a1e16ce2d6b1592af96d4d76b8de09902647f8a37cd91d7a3650914', 'Canway', 'GigA', 'bojan.bokara1@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509809251', '~', '~', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 53594, '', 0),
(170, 'Ferid1337', '7d86eafdac45b07cc927b125a5e05056d7a55dabdbb338bd215244c76519b7692e461d8e94dc831fe73f3db6074b99b28bad134bb929593829dd8eb9b130194c', 'Ferid', 'Kapidzic', 'Pixexpert11@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509812952', '~', '~', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 38000, '', 0),
(173, 'Alien_PvP', '729d1bf2a1dbaee69e89b2c760dcf17d6711a8a3c0bc87cbe06c462e9cae1f4a0e5970524fac8b38bc05e8f307188e1443a03592abf6f47361a6df8a34008f79', 'Amil', 'Music', 'alien200pvp@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-04 20:03:04', '1509822312', '91.191.1.174', '91.191.1.174', '2017-11-04', 'bih', 'no_avatar.png', 'cover.jpg', 0, 90736, '9md19kaqk0sjo16mn09e4molc0', 0),
(176, 'DeLaEXPorg', 'b1d70712afa1895dbec6c9f6a301abe4dc6d93f241fb1108821ecd4781121781652e78d6a4efc8bc4be00f01072904f5d222e4f5741ecf6470f9a54783a5d401', 'Deniel', 'Delic', 'exporg2010@gmail.com', NULL, 13.892000000000005, 3, 'Aktivan', '2017-11-21 19:56:46', '1511290612', '37.203.122.78', '37.203.122.78', '2017-11-04', 'bih', 'no_avatar.png', 'cover.jpg', 0, 1337, 'ularcd5nvjku25v8ca5oqpnqr5', 0),
(177, 'Nikolic', 'ac6638c1ed29af5d1da5f91e10c020bb01a6f435ff3f90c6774148ec71213bf311aeab5676c33088da8e283963afa2b5e27f4a842c2c94e08fcf19949cc5b873', 'Mihajlo', 'Nikolic', 'mihajlo.nikolic157@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-04 23:22:24', '1509834215', '178.220.45.202', '178-220-45-202.dynamic.isp.telekom.rs', '2017-11-04', 'srb', 'no_avatar.png', 'cover.jpg', 0, 28530, '0gk3e0l8lg4vtf8cmgqh3rp3s0', 0),
(178, 'Johnson', 'e04fd30a6bdc3f881f35e7b46469988cb037cb068c38c37a3006805f0d026f75b7d36e1850b3498895f3d15ab1490cf8aaacf5fd82d34402984441d2217377cf', 'Eldin', 'Aljukic', 'aljukiceldin@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-05 01:22:09', '1509841368', '185.50.58.64', '185.50.58.64', '2017-11-05', 'bih', 'no_avatar.png', 'cover.jpg', 0, 52844, '68gpvlj0d28mjpf8gsbo9ls3s3', 0),
(179, 'Aleksandar', '423bb19f6ac52d74afb2cb25bb3bdcb539902bfd053929cab8eef47e397f0929be8155e876bad68e95265cd5fd331f84724781d36f40869c484b060c109e8597', 'Stojanovsky', '', 'ace-2002@live.com', NULL, 0, 2, 'Aktivan', '2017-11-05 08:59:18', '1509868756', '62.162.179.204', '62.162.179.204', '2017-11-05', 'srb', 'no_avatar.png', 'cover.jpg', 0, 84792, '3g6449apm3c7mllqhsskub4lj0', 0),
(180, 'Acezica', 'a811c141cd3e7a773a43c2bc1da2969c6860f7a20bfbe6ebcf7ea7d87b38b8a9049ac8366923ba415506422418dae2d979e3bf6b3c3ab71ab97f34ef921707f5', 'Stojanovsky', '', 'ace-zica@live.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509868693', '~', '~', '2017-11-05', 'srb', 'no_avatar.png', 'cover.jpg', 0, 44126, '', 0),
(181, 'Ace_Stojanovsky', 'e4cdf13f51f58356d8c0149c8d6a7e1512e4a6aebb2ab4111ad0229416240681cbd6d7a4a4d9a592a1758dfc126e2def80e2e30dc42c50a3f7665d080bb819d7', 'Aleksandar', 'Stojanovski', 'Ace-2002@yahoo.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509868930', '~', '~', '2017-11-05', 'mk', 'no_avatar.png', 'cover.jpg', 0, 27720, '', 0),
(182, 'Ace_Zicaa', '77dc55feca71feb76310c4a4400ba0eb6e7fb89cb212caa33c6f8bba99a48254d780e08761fea2c0cc2ec4fafdfab0f329a749d5908226515bfa045cfc3a6d3a', 'Aleksandar', 'Stojanovski', '123456@live.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509869070', '~', '~', '2017-11-05', 'mk', 'no_avatar.png', 'cover.jpg', 0, 38037, '', 0),
(183, 'Ace_Zicaaa', '07c440ac17089e0ff03eae0cd1f152e28bcdbd271d89f1f750f5b95288ae33dd949310205d25d27f9fe08e0f865e414d38962cb7a5e16a21737e66f52dd6e272', 'Pande', 'Stojanovski', 'Pandestojanovski@live.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509869229', '~', '~', '2017-11-05', 'mk', 'no_avatar.png', 'cover.jpg', 0, 74524, '', 0),
(184, 'Ace_Baresani', '81db7ed0399329abe579377836a4c3f20a5c6a11446bfc2aa21826357426ea11dea0df4424457ee8bf15211ef923d3ee26d5b023f3de9dd230179e770d865de6', 'Pande', 'Stojanovsky', 'pandes@live.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509869333', '~', '~', '2017-11-05', 'mk', 'no_avatar.png', 'cover.jpg', 0, 62827, '', 0),
(185, 'Ace_iphone', '5076a301e509b31fb0b544a7724fd84305d55701cf112b536cc48ba7399201198733021c0ffd2182f706e69aa4f5b648c1f14fad30b8341228f82eaa419e7393', 'Iphone', 'AJfonovski', 'iphone4@yahoo.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509869554', '~', '~', '2017-11-05', 'mk', 'no_avatar.png', 'cover.jpg', 0, 16320, '', 0),
(186, 'acerocker', 'f6b992ced78f3e51cc6be13a1bb79c27d1e012ec6ed49e8cbfbe2a1e00bca7ffff591ad4050f5be56f651e06400ed150c0e6cbcb38114dc77662775435b78b77', 'Ace', 'Stojanovsky', 'Acerocker.rocker@gmail.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1509869671', '~', '~', '2017-11-05', 'mk', 'no_avatar.png', 'cover.jpg', 0, 82553, '', 0),
(187, 'Kotezanac', '3a051d9025d60dfdee109b70ae4c8dbc1ac70d92a9ddf6ca907c4900b44309e847923b6e6e8ab91ce2d5ae557c220aa5ba09ddefbf0c473d886a9b6156020755', 'Kotez', 'GT', 'hariskotez@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-05 20:56:45', '1509911811', '87.116.153.146', '87.116.153.146', '2017-11-05', 'srb', 'no_avatar.png', 'cover.jpg', 0, 18062, '6hl5c752d3onirj528ge8tfj26', 0),
(188, 'Kotez', '27cab81244da386c1e87b4fc5c60de8f13f0fa4fc899223ad1bb8831f6cd83621a146459b8f8d121bf7a344a638bfa5a1bf95d6c80b7f2c1cbf24dadc74d4a80', 'Kotez', 'Lg', 'kotezsa@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509893833', '~', '~', '2017-11-05', 'srb', 'no_avatar.png', 'cover.jpg', 0, 56267, '', 0),
(189, 'Jeremy', 'f28fbd2d9a57aaf3ddeacb3503a959423287fea1267f3261d823f2e9e78711d1c5c3c47b78fb5c64863b490e38e203a035422806f972c0111bcd60c8ec0c57a5', 'Jeremy', 'Teller', 'jeremy.noobot@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1509901233', '~', '~', '2017-11-05', 'bih', 'no_avatar.png', 'cover.jpg', 0, 30129, '', 0),
(190, 'Limeni', '5e939029e4d64205e4bb3ccba5433658c51046cd5bd47f2424f68ae0ddda330ae6fcddd55150ddc2cbded559d6f941f55c48704b8adfce7d55f85392985c9e73', 'Limeni', 'BRT', 'senadgames277@gmail.com', NULL, 0, 1, 'Aktivan', '2017-11-07 19:40:21', '1510080039', '31.223.143.229', '31.223.143.229', '2017-11-05', 'bih', 'default.png', 'cover.jpg', 0, 28540, '7b0iq488uu8cip1nnosthl12k3', 1),
(191, 'Meriton', '64d19fd1bca600fc4d9e0a8cbab3e8cf96d98a838414818ae513ddbe83c64f6c1b990d90020570b85ecf002ad220c787fc4a2e2fa2b2c3dc30ddd8643e0fd01a', 'Qenaj', '', 'meritonqenaj@hotmail.com', NULL, 0, 4, 'Aktivan', '2017-11-24 18:50:21', '1511546925', '93.137.137.53', '93-137-137-53.adsl.net.t-com.hr', '2017-11-05', 'hr', 'no_avatar.png', 'cover.jpg', 0, 399, 'urc5vgetpap0aul5ei1g02m310', 0),
(192, 'dusankostic', '98d31b01eef733699557b21e34319ae3b632860bf26ca33be824480d22ea757a8b0b70048ed8756348a4bc943d5aa3b1892c66cba9cee6c2a068db321aed6910', 'Dusan', 'Kostic', 'bloodwiner10@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1509986904', '~', '~', '2017-11-06', 'srb', 'no_avatar.png', 'cover.jpg', 0, 2875, '', 0),
(193, 'Koleman', '2686420d9d53ae8f9a675ec3d429dcfb8236d6bc60c29ba5e0b1169caa53dc81b3c6ccee33bd8a9403985d51b84b1dc9fd501ad657c9be5781ff851371b2a43e', 'Adin', 'Tesic', 'kojotpera02@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1509987498', '~', '~', '2017-11-06', 'bih', 'no_avatar.png', 'cover.jpg', 0, 10764, '', 0),
(194, 'mirko123456', 'd87441bcd3d60c9f0075ba46eb4e48cf543dcc98cb71ce60f27271b2b65bada6cdeb8553104d9ab3c21eccaf8d8d33e15254abf4df0b91ea7d06065db8a8ff1b', 'Mirko', 'Obadovic', 'mirko.obadovic@gmail.com', NULL, 0, 1, 'Aktivan', '2017-11-06 20:30:39', '1509996997', '62.4.57.94', '62.4.57.94', '2017-11-06', 'cg', 'no_avatar.png', 'cover.jpg', 0, 2941, '7djqbs3ktg99vq923qemm3ubp7', 0),
(195, 'AhmaHD', 'a8fd2b12ce5b79cf128d4fbcdfd37832b89bba6288a00decb52103f5906595501504c5a656397ea1dfbf07911d37bb05e8630b8622aebdf002b1203c19677825', 'Ahmet', 'Sofic', 'ahmet.sofic1010@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-06 21:33:08', '1510000431', '77.239.68.76', '076-68.telrad.net', '2017-11-06', 'bih', 'no_avatar.png', 'cover.jpg', 0, 15065, '7pjmqam176rr1eadbbh11flqc7', 0),
(196, 'AhmaYT', '583b2018644b976d5788d0d92bd33377fee8b2243cf63aeedaa1a90e20ff504637d5d46ef8e7f3b697050f8463f560e0f84a0f33cecb7306cf88894447dbc557', 'Ahmet', 'Sofic', 'ahmet.sofic@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1510000298', '~', '~', '2017-11-06', 'bih', 'no_avatar.png', 'cover.jpg', 0, 76496, '', 0),
(197, 'Zake666', '288eb17c3bd7faff0bcf6031bed6a93c46b2364fd81606a700d9c00845ede252a28c0242ea8f3d35b1f92f1e56d43436ace5111f75ad41ad2b7ccc354275faae', 'Zake', 'Zake', 'zakelucani@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-06 22:57:46', '1510005950', '109.92.148.75', '109-92-148-75.dynamic.isp.telekom.rs', '2017-11-06', 'srb', 'no_avatar.png', 'cover.jpg', 0, 2930, 'hqeg8ghm23an642q35pvqchsn2', 0),
(198, 'zekalegend', '87ef702b6f917eaac8e537dd307b627755573af3effe1043eb3f4f11923d875327d9ddb93dc12b9e8d043faa4b41ba90bad5956760918088cd4766c841f58681', 'Marko', 'Zekonja', 'markozekonjaa@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-07 07:53:37', '1510037696', '87.116.190.38', '87.116.190.38', '2017-11-07', 'srb', 'no_avatar.png', 'cover.jpg', 0, 43851, 'grpl0o099b2hfn5djqu0bsf8b2', 0),
(199, 'Nesko', '689c17f188f87e91af18af9c407388740ddb128c9638f5d247b23ec920defb4a343aad38b3cfb0d884b476c90a0ecbd7cfe6da342abf4b6d99b28c74a80cd56c', 'Nesko', 'Mitic', 'nesameraklija@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-07 15:26:30', '1510065025', '87.116.178.249', '87.116.178.249', '2017-11-07', 'srb', 'no_avatar.png', 'cover.jpg', 0, 49469, 's320r5pffol5fq7eerisi5et44', 0),
(200, 'shaco98', 'aaab55c2295318c787a328f6ca7a586c6afdef3ec85f74677edbadba9e534e776f93223d263f1e4639a576930651a5f6682d23f7762df5e7330a88315736fcc6', 'Shaco', 'Korleone', 'munchycastello@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-07 19:47:37', '1510080466', '178.220.203.78', '178-220-203-78.dynamic.isp.telekom.rs', '2017-11-07', 'srb', 'no_avatar.png', 'cover.jpg', 0, 61688, 'vgpif54p27b9sjpdm250tqbua7', 0),
(201, 'Minjac', 'dd407721de4790e068b966d12a7bac12262ab4ce0f3ac2956e8c45f0f5d18defb18d5c8da47286b284eb897f6c5eab6ea752a282d283e4ea19b561fe998cfd0f', 'Minjac', '', 'thekulic@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510145915', '~', '~', '2017-11-08', 'srb', 'no_avatar.png', 'cover.jpg', 0, 24491, '', 0),
(202, 'Mixakralj', '256c9456fefcaeeed368bfb71ea39765ce431579b2b708d58e56cb2178ee9ce7e262c3d3a1459081b57dea52ed5995301c155d0ff9be603a76c593500fe5553c', 'Mihajlo', 'Krstic', 'krsticstevan35@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-08 14:36:39', '1510148372', '94.228.226.222', 'ppp-94-228-226-222.exe-net.net', '2017-11-08', 'srb', 'no_avatar.png', 'cover.jpg', 0, 45206, '58rlrr0pupiqig07k7psvdhft7', 0),
(203, 'Marjan ', '3cc2ddbf3ed0e6c9e48d5bb3f38f6519feba26c256d4703e0db2c766e5a10ffb20eab32631bbb9d76aa131624a5bce8b0a0058f3835dd9864e526409a4183027', 'Mitovski', '', 'marjanmitovski0@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510163918', '~', '~', '2017-11-08', 'srb', 'no_avatar.png', 'cover.jpg', 0, 24762, '', 0),
(204, 'Mateja', '610255a1cfa8db7fe713bebf7c37176fd274d7335af0151ef3e56f58e91bc4a653b0b9e1f5162306014d9efb64c52effe79a0fe54dab7c0a2249db5f45e5fe5a', 'Rilak', '', 'matejamilf@ethersports.org', NULL, 0, 2, 'Aktivan', '2017-11-11 15:25:30', '1510410339', '178.79.58.156', '178.79.58.156', '2017-11-08', 'srb', 'no_avatar.png', 'cover.jpg', 0, 87523, 'e83ftirf366ie8ah1pqmv3mum0', 0),
(206, 'sule2511', '8bb52ff81ba7ff676092b8e887a7a6f61374a4308d697c07eb4636b01b0dc0e8192973c825703ce8428157dec7571ade2657fbe64c7b4005b9f6fcd0a79d915a', 'Marko', 'Susnjar', 'susnjar2511@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510182638', '~', '~', '2017-11-09', 'srb', 'no_avatar.png', 'cover.jpg', 0, 49950, '', 0),
(208, 'Erke123', 'a83e7f9166d26b54a853b994898e6cfcf5a6ca6b607b72a4ca8a55aec1466a8e4cc9dd609bf782987ef9bc460c68474a55e9921afbce7589bc466973889bf16f', 'Masic', '', 'erkescofiled@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-30 11:29:56', '1512037799', '109.175.98.155', '109.175.98.155', '2017-11-09', 'bih', 'no_avatar.png', 'cover.jpg', 0, 82039, 'l7ru51ilu26g0kp0907alr4mq4', 0),
(209, 'AkiSub', '806eb2edc55a4b5ff386f01e1de4b3f2c788ed885b1791869f305e1768e26d2e207ccad54c1c696f4d9d83d29d91cca778bf65fb56761e7f7c4e9b4eb51b061b', 'Aleksandar', 'Subotic', 'akisubotic@gmail.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '1510330060', '~', '~', '2017-11-10', 'cg', 'no_avatar.png', 'cover.jpg', 0, 36152, '', 0),
(210, 'Macak _Dawn', '55670475cf686df6ab976d10f35afee26c53ec345623b0a296e931d8e3ae08ecba33817701d7b27f012ec3f26f3f7251c210af9a74bc71ba0a299b9f617026ec', 'Dawn', '', 'macakdawn123@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-12 18:06:15', '1510506375', '109.175.97.212', '109.175.97.212', '2017-11-10', 'bih', 'no_avatar.png', 'cover.jpg', 0, 374, 'tr7kfgqufee4r535pivr1k7i93', 0),
(213, 'Zaeban', 'cd57dab0735600009ee72197049f83a1fa47a5772854cdb676e813251c6d471d9220c347584ee14384b92dcde18230045de902af1c3384e74a635dec95de5310', 'Petrenko', 'Petr', 'necutikazem@picka.cz', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510445597', '~', '~', '2017-11-12', 'srb', 'no_avatar.png', 'cover.jpg', 0, 83132, '', 0),
(214, 'BASHOVSKI', 'a79967f65a0b562d6e1735c39f5c35e82686f8978f59ec8a5b4d97c6fa5530af966569da41aa38eb4fe1925d25de118ec9a932d3ad878d7e6a45258adead8806', 'Rahim', 'Bashovski', 'iloveburekultras@hotmail.com', NULL, 0, 3, 'Aktivan', '2017-11-22 21:43:45', '1511383432', '77.77.237.162', 'cable-77-77-237-162.dynamic.telemach.ba', '2017-11-12', 'bih', 'no_avatar.png', 'cover.jpg', 0, 37857, 'pmmt930au52n30mkffd6sge6l4', 0),
(215, 'zensei198', '890f3917a2939d1f0d01c86b4a39345d834ad53efdac0817ebc00cfad7079cd98b1bd46f175da9e87a77be3b929a0095751e018be0e0f604bc629266f93f49f5', 'Bojan', 'Apostolovski', 'itszensei@gmail.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1510506657', '~', '~', '2017-11-12', 'mk', 'no_avatar.png', 'cover.jpg', 0, 21376, '', 0),
(216, 'Jasmin332', '84f047423f05c78b50ac3e29cba9bdd09ec661149fe78ba836fd05760c2f22349e8cd7d9a6994cb00302aee526e4ca58786a3874ff8d1f413c54bec30d338e18', 'Dzeno', '', 'jasmindzebo113@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1510510135', '~', '~', '2017-11-12', 'bih', 'no_avatar.png', 'cover.jpg', 0, 55071, '', 0),
(217, 'Jasmin', 'facaf09d71a7a52393275fdd7ad72ebedb3225ea5c3404a381901edb518b78201838bb01a3f97917d97f5166d6ddbb340bb7d83787141ff64b765e4c72421c8c', 'Dzebo', '', 'video2.gaming22@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-12 19:12:41', '1510510376', '2a02:27b0:4d01:5b50:5c26:ff0e:c78c:bd65', '2a02:27b0:4d01:5b50:5c26:ff0e:c78c:bd65', '2017-11-12', 'bih', 'no_avatar.png', 'cover.jpg', 0, 55009, 'enmsk5pjic7s7eev1pm770f6g2', 0),
(218, '~Aleksa~', '5e7a89ca7a169ce738244bf9ff5db47e2f6d89141180965d810eb77abbc5ac605e501a26f5c6abef0379ce433bd4c6bb8c631800a11b9353b148751232cac526', 'Aleksa', 'Kojic', 'aleksa.kojic2442@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-12 21:08:38', '1510517421', '178.79.33.198', '178.79.33.198', '2017-11-12', 'srb', 'no_avatar.png', 'cover.jpg', 0, 50210, 'lv7jjojbs8lospjki7mlkgvdn7', 0),
(219, 'UrosSD', '5b10db1deee7d47b78d0597aea05dd75c32824e6cb548787ed14d8b645a919d7c40b8542f6bfb5589a3b1721b5e76f3cab933d7df1901bd7c9b378c8fef9f923', 'Uros', 'Novokmet', 'agariod10@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-24 20:48:45', '1511553071', '91.148.87.103', '103.87.148.91.adsl.dyn.beotel.net', '2017-11-12', 'srb', 'no_avatar.png', 'cover.jpg', 0, 1, 'l7ltmm3hj5in3fkqst2o0bqku4', 0),
(220, 'Milan', '20cda64727b0964e5686c57fb807550ef5c78e11528228cc7d649976533523ce77aa91b9cec0072d856912daa4d505058a3c553998164461fcb37123ef235cf1', 'Milan', '', 'harunpro6@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-23 15:59:18', '1511449217', '178.253.240.136', 'free-240-136.mediaworksit.net', '2017-11-12', 'srb', 'no_avatar.png', 'cover.jpg', 0, 18459, '1dmufuojkq0koiur7kcpr7sgr7', 0),
(221, 'Samir', '4dca17bba6b3b8517a21254033781a83401dd42e1c96bb1781218e275c47b1f64d429b7ed49df9a00d6713f7faeacecf3870f38c3bf5ccc87b0b84f70cad8a9c', 'Samir', 'Golubic', 'gamehosting11@gmail.com', NULL, 0, 1, 'Aktivan', '2017-11-20 00:27:27', '1511134002', '95.156.157.160', 'adsl41mo160.tel.net.ba', '2017-11-12', 'bih', 'default.png', 'cover.jpg', 0, 95647, '0pvjdqetisijftgb0kk8nlhcl6', 1),
(222, 'Dzoni', 'd38e506386f5b97f20204ee00c7d95d37d1123e7bf177fe3d1cfdcfe4048aa6640b4a1b34a21456c233c09a8d8a7aa571be1c942dc9c8195d2d2bd99c402914f', 'Dzoni', 'Corleone', 'nikolamiric339@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510578593', '~', '~', '2017-11-13', 'srb', 'no_avatar.png', 'cover.jpg', 0, 93529, '', 0),
(223, 'Drzic', '053ba7743abe5d34716d18609cc3eb43061786aa83893b5f46049c511c1498996dec2d6bb1ad2619c20f2d8a908e9c23939026af33754ea350a7a7bf81fe7b8f', 'Marin', 'Drzic', 'marindrzic14@gmail.com', NULL, 0, 4, 'Aktivan', '2017-11-17 14:16:44', '1510925807', '193.12.131.2', 'm193-12-131-2.cust.tele2.hr', '2017-11-13', 'hr', 'no_avatar.png', 'cover.jpg', 0, 28203, 'iispuii3krdfcdf583mbsrd1u3', 1),
(224, 'Lackenzi', '2ba757c9dabfd1d0646973d9cf21df66889206334cd3b54329d498066dc6017cc628ef41651c2c00d47db936a56f6be8d389b810e5011012469c47db198e4b0b', 'Vuk', 'Lazarevic', 'vukovsvet121@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510658767', '~', '~', '2017-11-14', 'srb', 'no_avatar.png', 'cover.jpg', 0, 78815, '', 0),
(225, 'laki2233', '6752abab17349d44c425732065e8233398c54f64ea2e2ed69c79abcbf3e7887056a27cffb4e8a4d9beedf0843afdb2d5e44ee232c54356393e4c2146b2cf67db', 'Lazar', 'Simic', 'laki@hotmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510676364', '~', '~', '2017-11-14', 'srb', 'no_avatar.png', 'cover.jpg', 0, 76805, '', 0),
(226, 'DeNi3D_', 'cda0ce4e3a70775eb0d7ef5bffa92333e552e35b7117fdcb8b3ccd0738643655c1ad443ea05f7f577d94866d5fe952635ab1e2828159090dd5d3850ca371c460', 'Deni', 'Nemet', 'nemetdeni22@gmail.com', NULL, 0.6, 4, 'Aktivan', '2017-11-15 19:52:46', '1510772753', '93.143.143.44', '93-143-143-44.adsl.net.t-com.hr', '2017-11-14', 'hr', 'no_avatar.png', 'cover.jpg', 0, 35162, 'lgjsv43a9tcgrn43qcjldhjar5', 0),
(227, 'Knock', '77090f339889c3b0910e10184bc976bc1b8b425876a16866753a36c4b2f67737de2368c96baa9b233394012f940f577f36d8816f961fffd2cd8973c660b4a3dc', 'Dalibor', 'Ilisevic', 'daliborilisevic@yahoo.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510692722', '~', '~', '2017-11-14', 'srb', 'no_avatar.png', 'cover.jpg', 0, 38117, '', 0),
(228, 'rahmellking', 'cab87bbc87eb9dfd202f22a74eca3cfcffc9ece0e8159ed918b0b8ae7bfbe0343e016a9eb3b6e9655dd5ce8a73cdda9af854b9f572b292faafb43f507d49f3f7', 'Rahmell', 'Rexha', 'rhghost16@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-15 07:11:39', '1510726339', '178.175.77.74', '178.175.77.74', '2017-11-15', 'srb', 'no_avatar.png', 'cover.jpg', 0, 15031, 'j23g9nuo32dsl1352h6ek2p6i5', 0),
(229, 'Bakishaa', 'c172037346b681a34140bb1add1a53895cec31983cfbbe1f25d126b4c86bedcd901ea302bdac911c364b5245cba42b33193181a325a5387f69f49cabc8b6af57', 'Alija', 'Kadric', 'alijapro12@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-15 11:40:04', '1510742752', '178.220.77.5', '178-220-77-5.dynamic.isp.telekom.rs', '2017-11-15', 'srb', 'no_avatar.png', 'cover.jpg', 0, 66622, 'nfn0a151v96cl5p6ts3ge3tut2', 0),
(230, 'Nutellaz', '90bc05e44d8636435bf74596dd4ba65c60b9143ef58bb7df640416c383c37265cba99cc04c08a4bcba2a014699d22274fd44f7f0cc96797447fa591f68ab4e89', 'Nutella', 'Nutella', 'slwprocs@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-16 09:59:32', '1510822849', '87.116.190.89', '87.116.190.89', '2017-11-15', 'srb', 'no_avatar.png', 'cover.jpg', 0, 44640, 'uqhlp1usf86bmvuk2l9bqhua33', 0),
(231, 'Nodze', 'c735ed7c384f68e8118ae89af1a741263ebc768b8ce6124b6fcd74e126ddea564d4f89e2466bf73b9b5e29cce368c3a84a0ec256e63b9e550371fba64efee640', 'Dzenan', 'Levic', 'nodzelevic@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1510827381', '~', '~', '2017-11-16', 'bih', 'no_avatar.png', 'cover.jpg', 0, 53200, '', 0),
(232, 'Deltenzi', '17e623993a00ffdccc1ecbaad0e0928dc3633259daf9a5f66baf5d1839c66f0580d3047309f2ad8876b6da6a41fd8bf16a4c23a401a6e8b5e9efc13f6f5558e4', 'Ajdin', 'Omic', 'ajdin.omic.13@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-24 12:26:10', '1511524892', '109.175.107.242', '109.175.107.242', '2017-11-16', 'bih', 'no_avatar.png', 'cover.jpg', 0, 1, 'ieug0mpv9pcrlpc636kl1gh4s6', 0),
(233, 'Miki1231', '1e4cfde37fa347985c3ca38ed70dd4001f744e3234d3f4f303909113bde95bb821cc8aeb5e2d6f641eb3cf11db7d930feef99da25fdb588850af47a514298a21', 'MikiMonster', '', 'alka27444@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1510945044', '~', '~', '2017-11-17', 'srb', 'no_avatar.png', 'cover.jpg', 0, 56659, '', 0),
(234, 'Tony Corleone', '2f23b28c2539d8821cd5a33a0bb6c65e0cd412304c6e307836240c200b37870604f4730c5e850a80610a83a0f3da2c2a07e0bfc43c8128534fbccb2d3752b636', 'Toni', 'Jocic', 'blagojce.damceski6@gmail.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1510946633', '~', '~', '2017-11-17', 'mk', 'no_avatar.png', 'cover.jpg', 0, 23863, '', 0),
(235, 'Tony Coreli', 'c8cc5cd7ad2a68bffa8adbcc7dbfe481c9e834470b286c74a5a407d0916bb37713d534eda2dedb6e294bd146c85cf5ea8ad15414266bc40a870be60e8d15f06d', 'Toni', 'Blazevic', 'blagojce.damceski@gmail.com', NULL, 1.2466200500000002, 5, 'Aktivan', '2017-11-29 19:44:34', '1511981536', '213.135.179.114', '213.135.179.114', '2017-11-17', 'mk', 'no_avatar.png', 'cover.jpg', 0, 22250, 'auuoghchhha1ttuv4985q9mrt4', 0),
(236, 'Jovan', 'bfc6a32c84f299986d0d6dce9814a9db1ebbfc308130f44df977d939d8b891fd1bc011d8f5e8abb2d8b079353d19b1dc6a623e52c2878ff9fa7b88632a25a19b', 'JovanRadovic', '', 'Radovic@yahoo.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1511005111', '~', '~', '2017-11-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 61142, '', 0),
(237, 'gradjanin1', 'ce56b8380d4f4951f26004633e85d14f610abca4e6540a1d9d170ffc7c348e995f22219e4284d0d32c0e431575a334d1f6f6d597dbb3914f57314da97f1f2eb9', 'John', 'Monaco', 'abratee57@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-20 17:46:38', '1511196561', '188.255.220.220', 'free-220-220.mediaworksit.net', '2017-11-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 1, 'fer11hhcc8q4vm3nklqt3328j4', 0),
(238, 'NN3X4', '9ab9b67b692f1b5b8a6bf9e6b8e10853e2cadb2dd04d021419200ce3cf8be71c229f46d0a645eefd927b25333fb96d21054296b3d99652d7a2f47b0b7722e48a', 'Nemanja', 'Mitic', 'NN3X44@gmail.com', NULL, 0.3799999999999999, 2, 'Aktivan', '2017-11-24 14:40:24', '1511533788', '109.94.232.142', '109.94.232.142', '2017-11-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 25726, 'f4vj9ekjr4tkm5mgc78n1o3dk6', 0),
(239, 'Amir944', '165ab0f34fd1d079f17d748c912492fa004f4f2032110b743d53a697568cbf4f11f6891507c144fea11440b14ef04d32c5a277a58ac80f037558bf9f9d593f6c', 'Amir', 'Fajic', 'amirfatim99@gmail.com', NULL, 0, 4, 'Aktivan', '2017-11-19 11:15:42', '1511086493', '94.250.128.187', '94.250.128.187', '2017-11-18', 'hr', 'no_avatar.png', 'cover.jpg', 0, 88483, 'lgdpliueeuj64nj2rid2bib2g1', 0),
(240, 'ZarkoFTW', '4ff03be51cf10da9dacfb7cc6e50cbc4e47f784e2b38feda670f7ad444286037c8e9f2bf63e0f94f133c9c1d4b0ef56e304943f41641180a597255fe114e4a3a', 'Zarko', 'Filipovic', 'zarkofilipovic123@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1511029805', '~', '~', '2017-11-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 33464, '', 0),
(241, 'ZarkoFTW9', '1423092fc53bdc19e2e96d2bdb5583cc055642ba124f20eb8738f633c4ee43d621442a0d73883b63a6a953f42bec5202ccd1edc433affecdc2de6dcab4cb2a33', 'Zarko', 'Filipovic', 'zarkofilipovix123@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1511029906', '~', '~', '2017-11-18', 'srb', 'no_avatar.png', 'cover.jpg', 0, 78682, '', 0),
(242, 'Neko00', '82c6ec3d71b3ff04877a57ee70f43f4c0c0f8f0d267fd642c2122b95072210cc09d11a340096ba141cd9c2af6ada3668ad76aa64d0573ee1e1d0b3f61b9819e3', 'Neko', 'Tamo', 'dev.kevia@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-19 07:41:44', '1511073836', '109.228.111.79', 'adsl-109-228-l12111.crnagora.net', '2017-11-19', 'srb', 'no_avatar.png', 'cover.jpg', 0, 23146, 'ne79mj7ugmglg8uspqgc8p3tu4', 0),
(243, 'Zarko999', 'c8c36d2442f6c4716abaeb5a4352c0b5247d529ffa0c9bdf97a97c1f5902cb0647d76f62b9be5ed0facd0c28420a82ccce4876c0dc9e2021f9119fd48296c6a1', 'ZarkoFTW', '', 'nikolafilipovic395@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1511124015', '~', '~', '2017-11-19', 'srb', 'no_avatar.png', 'cover.jpg', 0, 77178, '', 0),
(244, 'Jovika', '4c67c29dd10c137a178cfe56df8096cc9eff308be4bf5f0490e25f3c7e2a4feba110698ba11563ef23e8ef0c9445c38ab586019941e87c395daa5d4a0a8bd192', 'Jovika', '', 'nexuscityrp@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-19 22:30:34', '1511127048', '31.223.132.134', '31.223.132.134', '2017-11-19', 'bih', 'no_avatar.png', 'cover.jpg', 0, 19343, '0pc54d7glf8jbs0dp3j3k3i695', 0),
(245, 'Exnas', 'e0905460695646517fe364bff7168ffd2ba0d0984ba94dd5ff8471d6201b1c6a7afee9ad76f0ced1aef8e2a78da48adfb2109da53aaa2e0f8233c765a7362729', 'Vedran', 'Vucic', 'vedran.bre@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1511259176', '~', '~', '2017-11-21', 'bih', 'no_avatar.png', 'cover.jpg', 0, 90865, '', 0),
(246, 'dacolinjo', '8b7b6ace53131e7ddf59df40bd436ba13febe5ec1a87a23e220cba2207e65071b4ca5025cc8b8cdb8c184be1ab1d55e4f9cfee09e0ae0239e1013f0d36b23ef5', 'Dacolinjo', 'Daca', 'dacholihobog@gmail.com', NULL, 1.5999999999999996, 1, 'Aktivan', '2017-11-24 23:57:49', '1511564297', '46.33.214.145', 'adsl-46-33-l22145.crnagora.net', '2017-11-21', 'cg', 'no_avatar.png', 'cover.jpg', 0, 31374, '8249cu6eka9fshvcu1aum8g5r1', 0),
(247, 'ZarkoFTW99', '924505be09b39d692fd014c2c62cdebce7b62db67d2f2ab366b5f708c2ed371b0a6264c31ae19a8f236315fdae097a7d564575159ba91bcdafef0090cbd1c232', 'Zarko', 'Filipovic', 'paydie04@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-22 18:16:36', '1511371400', '178.149.37.115', 'cable-178-149-37-115.dynamic.sbb.rs', '2017-11-22', 'srb', 'no_avatar.png', 'cover.jpg', 0, 74465, 'pc0154e1faegtbt7mqdk0de6u3', 0),
(248, 'Shorty', '85555fbb2c2090a7e83ec2c6b895a799114d52b1ee654dc61f467953e81c5f3dca8a1179cb0870a51f1295904e5244ec57f6753bc42fed1e8df7573834923559', 'Adam', 'Ctbg', 'blejab@gmail.com', NULL, 0, 2, 'Aktivan', '0000-00-00 00:00:00', '1511389023', '~', '~', '2017-11-22', 'srb', 'no_avatar.png', 'cover.jpg', 0, 21498, '', 0),
(249, 'zoxtoo', '3975b447a653c3a7794e38a1d67c65ef42506488ef2d6cc2acf5366e8744636bfdc6bc2b3b61b21f1cc8658449388904635cd2fb56f23e5ae9c646ccb1c1a29b', 'Masar', 'Tair', 'zoxtoo@gmail.com', NULL, 0, 5, 'Aktivan', '0000-00-00 00:00:00', '1511508315', '~', '~', '2017-11-24', 'mk', 'no_avatar.png', 'cover.jpg', 0, 53141, '', 0),
(250, 'Rope1337', 'fec700c8a8fc0de9e6d4ec4191a7bb15ab3dc4c8ac4b6f143430222cb8db9a4b73a9c21be57d10aca923c520bdc54de29ff4491410afce9f6efc58305a75f932', 'Milan', 'Cvetic', 'nropej@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-25 12:13:13', '1511608417', '95.180.106.130', '95.180.106.130', '2017-11-24', 'srb', 'no_avatar.png', 'cover.jpg', 0, 39496, 'bbdue39kvjilvj5ravrhfj5324', 0),
(251, 'Scania_Counter123', 'e1805e636f02db0eeb64f2e253b39f1765e5407e822592b10e84522fd887544fdf0344a9f4da9e42470149b73915f36ca9363565cb43d5afd0b8061400f20c09', 'Scania', 'Counter', 'msteam717@gmail.com', NULL, 0.18999999999999995, 2, 'Aktivan', '2017-11-29 19:10:23', '1511980944', '178.175.9.63', '178.175.9.63', '2017-11-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 46355, 'ijb6jqvc94k0vteresm9pltrb5', 1),
(252, 'Steve Reys', 'c7fccfb3800056d421d52d6343d2f7affb0dd9a994cb41b23cf826d41a3703f66890452d36c8d3079e686056f47bd4c2d20d79cb0b4e6b83a6f2d75de80d4c89', 'Steve', 'Rays', 'kurcovicslobodan@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-26 18:31:22', '1511731597', '93.137.162.201', '93-137-162-201.adsl.net.t-com.hr', '2017-11-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 16143, 'pllf08jhfgb8rb25lkg5g7t5c5', 0),
(253, 'KneLe Kane', '0e03931d1a246dc7f1073b414af4c05d0d62bb591cbd3e3b7bf1c2b0afaec80b8bf34e84d48f6b7687c74ea7d21ae18f629645b3c408108c343a9199eb44fa09', 'KneLe', 'kane', 'antonio.mileski1@gmail.com', NULL, 2, 2, 'Aktivan', '2017-11-30 15:32:18', '1512055202', '31.11.116.37', 'ctel-31-11-116-37.cabletel.com.mk', '2017-11-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 8062, 'ctb7tpu4pgqjomokv5dap4a694', 1),
(254, 'ShomY071', '2540cfcd163ffcb11e74795023dac286e7a4e885892cde9f34a70ab8190be9c74dc3bf127ebd7185e9436b103fa15ecd0ee0e421d89516acc02e208e021c241f', 'Milos', 'Desic', 'milos.desic@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-25 15:13:59', '1511619245', '46.99.3.205', '46.99.3.205', '2017-11-25', 'srb', 'no_avatar.png', 'cover.jpg', 0, 92948, '6bn5jl34i18ivqhvu66t9r4ch7', 0),
(255, 'AlanOfisl', 'e774e2add6ebea5224061d019dc3aaa0890db959719dd98360a1673dd20cc77967a6ca7b346c5e6cfbf3c01b35d015c92eeef830a4c315b58afeb012603335eb', 'Alan', 'Walker', 'alan.ofisl@gmail.com', NULL, 0, 3, 'Aktivan', '0000-00-00 00:00:00', '1511628677', '~', '~', '2017-11-25', 'bih', 'no_avatar.png', 'cover.jpg', 0, 61032, '', 0),
(256, 'deagle1337', '1dd27788dab20310003298eebe85c0e73c4cc4900c136ad8be339b7ea43012444305b7a630115ba7dbbfa4e8ddfe86c89fc27cfe378ed0b77c6f2f26b1683ece', 'Nikola', '', 'Buricnikola9@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-26 03:51:51', '1511665027', '37.19.109.189', '37-19-109-189.dynamic.vipmobile.rs', '2017-11-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 75005, 'd74mf16q6pp9psmje66siq47t4', 0),
(257, 'Kosta', '9a1686fd4ad1f7de6e3ca98d01e1a255f59b5564cedf265606cd2e1647a4e3fd32571e06ba3eb7a0d1a3b2c454f69fdabdc501c5ba4431b22f2ab74b888741dc', 'KostaJovanovski', '', 'kostajovanovski23@outlook.com', NULL, 0, 5, 'Aktivan', '2017-11-26 20:01:59', '1511723934', '95.86.54.199', '95.86.54.199', '2017-11-26', 'mk', 'no_avatar.png', 'cover.jpg', 0, 37646, '70eie3tschg4tfujd1i50j7ie2', 0),
(258, 'Harun', '58f717e5e664e4004c4814d74c20bace3cd55e385d8477b1c06e5681a9edda27980f80ac4d4e657f1f250e2052faabf6a071cb0a19ca7b85e7b05167a7be8d54', 'Harun', 'Begovic', 'ademaema09@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-30 14:50:31', '1512056787', '109.175.104.44', '109.175.104.44', '2017-11-26', 'bih', 'no_avatar.png', 'cover.jpg', 0, 45495, 'g9hmd23ftqutcigc1m533snjb6', 0),
(259, 'boost', 'e13517adb3d0fb879476561c2dc40ac03860510977dcebfdf0ef00067dfc882abffbb64d69b95f9a7460eac0cb943363b571bd1395d7c54845c4d757e6b7101f', 'speedy', 'csboost', 'info@speedy-csboost.com', NULL, 0, 1, 'Aktivan', '0000-00-00 00:00:00', '0', '~', '~', '2017-11-26', 'srb', 'default.png', 'cover.jpg', 0, 30640, '', 1),
(260, 'ahmed1946', '2d41f6961e7b6488699cb8d152c492b3dc797dcafb38857761d967d7f42a29396e42b0437d2218961a3b42719d8381db3474dc81d82fea4ee57e1bf90edcd9b7', 'Ahmed', 'Seferovic', 'ahmed.seferovic666@gmail.com', NULL, 0, 3, 'Aktivan', '2017-11-29 14:23:26', '1511961811', '109.175.99.16', '109.175.99.16', '2017-11-26', 'bih', 'no_avatar.png', 'cover.jpg', 0, 55937, 'lt603m9qt3l581rtomjo346me1', 0),
(261, 'DeSerT', '0bf6802201a13d3ced062215488fb61a1c3863c92da46944d0a88e5c06f56c12d70000adc942249bfce1978f36fbc8d2d45415945d8ac42f8f9a8894b66cf4b5', 'Danilo', 'Stojkov', 'stojkovdanilo8@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-30 13:27:27', '1512044849', '178.221.0.245', '178-221-0-245.dynamic.isp.telekom.rs', '2017-11-26', 'srb', 'no_avatar.png', 'cover.jpg', 0, 66631, 'lq88dms5nq8l2fmogruembgop0', 1),
(262, 'Nikoladigle', '0858a10b7741dffdf4d11c31132e5c715f10e5fd22b5356bef35240c9c74c4b3f1eae13231e4239c6eef732bf60369aeaf5ee55969a9d872ce4418987af73509', 'Nikola', '', 'buricn7@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-30 04:23:30', '1512012225', '77.243.27.39', '77.243.27.39', '2017-11-27', 'srb', 'no_avatar.png', 'cover.jpg', 0, 58417, 'kqnalbeecp5cf150a5bu2jn9e1', 0),
(263, 'WuDu5', '7c67b8362990adaab207bdfbcdec13e080d05fa051a24191338ef0d3076eebb39c123d96d98c02c265027d3b586ed90c2c9066f426196cb8aac45dd7b8c38833', 'Milan', 'Pejica', 'jebackarac9@gmail.com', NULL, 0, 2, 'Aktivan', '2017-11-27 15:26:21', '1511792811', '109.245.159.154', 'net154-159-245-109.dynamic.mbb.telenor.rs', '2017-11-27', 'srb', 'no_avatar.png', 'cover.jpg', 0, 45102, '7ak28p1c2skc597ckbrp5ems45', 0),
(264, 'LoadingFX', '437c1f9c8d7ceccaf2a254cde065301804efe142b1e7498242d86fbe6a39e8937675165e52bb8c731947d658b6c6f7d5338a1f0f14ffb6666cdac7c02f681d1e', 'Marko', 'Kostoski', 'loadingmk0@icloud.com', NULL, 0, 1, 'Aktivan', '2017-11-28 16:06:34', '1511881605', '46.217.145.126', '46.217.145.126', '2017-11-28', 'mk', 'default.png', 'cover.jpg', 0, 29031, '8ie3q86t8rqkntqetet2tk7m77', 1);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `klijenti_komentari`
--

CREATE TABLE IF NOT EXISTS `klijenti_komentari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klijentid` int(11) DEFAULT NULL,
  `profilid` int(11) DEFAULT NULL,
  `komentar` text,
  `vreme` text,
  `novo` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `komentari`
--

CREATE TABLE IF NOT EXISTS `komentari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL,
  `profilid` int(11) DEFAULT NULL,
  `komentar` text CHARACTER SET latin1,
  `vreme` text CHARACTER SET latin1,
  `novo` varchar(11) CHARACTER SET latin1 NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `lgsl`
--

CREATE TABLE IF NOT EXISTS `lgsl` (
  `id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `c_port` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `q_port` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `s_port` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `cache` text COLLATE utf8_unicode_ci NOT NULL,
  `cache_time` text COLLATE utf8_unicode_ci NOT NULL,
  `igraci` text COLLATE utf8_unicode_ci NOT NULL,
  `igraci_5min` text COLLATE utf8_unicode_ci NOT NULL,
  `rank_bodovi` float NOT NULL DEFAULT '0',
  `idu` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idu`),
  KEY `rank_bodovi` (`rank_bodovi`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `lgsl`
--

INSERT INTO `lgsl` (`id`, `type`, `ip`, `c_port`, `q_port`, `s_port`, `zone`, `disabled`, `comment`, `status`, `cache`, `cache_time`, `igraci`, `igraci_5min`, `rank_bodovi`, `idu`) VALUES
(1, 'samp', '176.31.207.211', '7787', '7787', '0', '0', 0, 'testic', 1, 'a:5:{s:1:"b";a:7:{s:4:"type";s:4:"samp";s:2:"ip";s:14:"176.31.207.211";s:6:"c_port";s:4:"7787";s:6:"q_port";s:4:"7787";s:6:"s_port";s:1:"0";s:6:"status";s:1:"1";s:7:"pending";i:0;}s:1:"o";a:3:{s:7:"request";s:3:"sep";s:2:"id";s:1:"1";s:8:"location";s:0:"";}s:1:"s";a:6:{s:4:"game";s:4:"samp";s:4:"name";s:16:"SA-MP 0.3 Server";s:3:"map";s:1:"-";s:7:"players";s:1:"0";s:10:"playersmax";s:2:"20";s:8:"password";s:1:"0";}s:1:"e";a:7:{s:8:"gamemode";s:13:"Grand Larceny";s:7:"lagcomp";s:2:"On";s:7:"mapname";s:11:"San Andreas";s:7:"version";s:8:"0.3.7-R2";s:7:"weather";s:1:"2";s:6:"weburl";s:13:"www.sa-mp.com";s:9:"worldtime";s:5:"17:00";}s:1:"p";a:0:{}}', '1476824620_1476824620_1476824620', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `logovi`
--

CREATE TABLE IF NOT EXISTS `logovi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `vreme` varchar(255) DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Izbacivanje podataka za tablicu `logovi`
--

INSERT INTO `logovi` (`id`, `clientid`, `message`, `name`, `ip`, `vreme`, `adminid`) VALUES
(1, NULL, 'Uspešan login.', 'Alen Morenja', '31.176.204.142', '1476818699', 1),
(2, NULL, 'Promena svog profila', 'Alen Morenja', '31.176.204.142', '1476818725', 1),
(3, NULL, 'Dodao mod #', 'Alen Morenja', '31.176.204.142', '1476819099', 1),
(4, NULL, 'Dodao mašinu <m>#1 - 176.31.207.211</m>', 'Alen Morenja', '31.176.204.142', '1476819148', 1),
(5, NULL, 'Dodao ip adresu #176.31.207.211', 'Alen Morenja', '31.176.204.142', '1476819158', 1),
(6, NULL, 'Dodao klijenta <m>Demo Nalog</m>', 'Alen Morenja', '31.176.204.142', '1476819196', 1),
(7, 1, 'Logout', 'Demo Nalog', '31.176.204.142', '1476819333', NULL),
(8, NULL, 'Dodao klijenta <m>test testic</m>', 'Alen Morenja', '31.176.204.142', '1476819371', 1),
(9, 2, 'Uspešan login.', 'test testic', '31.176.204.142', '1476819380', NULL),
(10, NULL, 'Promenio mašinu <m>#1 - 176.31.207.211</m>', 'Alen Morenja', '31.176.204.142', '1476819429', 1),
(11, 2, 'Startovao <a href=''gp-server.php?id=1''><z>testic</z></a> server', 'test testic', '31.176.204.142', '1476819539', NULL),
(12, NULL, 'Promenio mašinu <m>#1 - 176.31.207.211</m>', 'Alen Morenja', '31.176.204.142', '1476820791', 1),
(13, NULL, 'Dodao admina <m>Tomislav </m>', 'Alen Morenja', '31.176.204.142', '1476820873', 1),
(14, NULL, 'Uspešan login.', 'Tomislav ', '46.128.27.180', '1476820891', 2),
(15, 1, 'Logout', 'Demo Nalog', '46.128.27.180', '1476821330', NULL),
(16, 1, 'Logout', 'Demo Nalog', '46.128.27.180', '1476821452', NULL),
(17, NULL, 'Promenio klijenta <m>test testic</m>', 'Tomislav ', '46.128.27.180', '1476821526', 2),
(18, 2, 'Uspešan login.', 'test testic', '46.128.27.180', '1476821535', NULL),
(19, 2, 'Logout', 'test testic', '46.128.27.180', '1476822011', NULL),
(20, 2, 'Uspešan login.', 'test testic', '24.135.180.87', '1476822013', NULL),
(21, NULL, 'Uspešan login.', 'Alen Morenja', '24.135.180.87', '1476822311', 1),
(22, 2, 'Uspešan login.', 'test testic', '93.86.203.176', '1476822625', NULL),
(23, 1, 'Logout', 'Demo Nalog', '46.128.27.180', '1476823915', NULL),
(24, 2, 'Logout', 'test testic', '24.135.180.87', '1476823941', NULL),
(25, 2, 'Uspešan login.', 'test testic', '46.128.27.180', '1476823945', NULL),
(26, 2, 'Uspešan login.', 'test testic', '24.135.180.87', '1476824546', NULL);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `modovi`
--

CREATE TABLE IF NOT EXISTS `modovi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `putanja` text NOT NULL,
  `ime` text NOT NULL,
  `opis` mediumtext NOT NULL,
  `igra` text NOT NULL,
  `komanda` text NOT NULL,
  `sakriven` int(11) NOT NULL DEFAULT '1',
  `mapa` mediumtext,
  `cena` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `modovi`
--

INSERT INTO `modovi` (`id`, `putanja`, `ime`, `opis`, `igra`, `komanda`, `sakriven`, `mapa`, `cena`) VALUES
(1, '/home/gamefiles/samp', 'Default', 'Uskoro opis dodan ce biti', '2', './samp03svr', 0, 'San Andreas', '||||');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `obavestenja`
--

CREATE TABLE IF NOT EXISTS `obavestenja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` text,
  `poruka` text,
  `datum` text,
  `vrsta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `online`
--

CREATE TABLE IF NOT EXISTS `online` (
  `online` varchar(2) DEFAULT NULL,
  `poruka` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `paypal_ipn`
--

CREATE TABLE IF NOT EXISTS `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `raw` mediumtext NOT NULL,
  `time` int(11) NOT NULL,
  `invoice` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `plugins`
--

CREATE TABLE IF NOT EXISTS `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` text,
  `deskripcija` text,
  `prikaz` text,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `plugins`
--

INSERT INTO `plugins` (`id`, `ime`, `deskripcija`, `prikaz`, `text`) VALUES
(1, 'xRedirekt', 'Ovaj plugin služi za redirektovanje igrača sa ovoga na drugi željeni server.\r\n\r\nViše info o podešavanju: http://pastebin.com/gAWe4xwj', 'plugins-xredi.ini', 'xredirect.amxx');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `reputacija`
--

CREATE TABLE IF NOT EXISTS `reputacija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klijentid` int(11) DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL,
  `tiketid` int(11) DEFAULT NULL,
  `rep` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `reputacija`
--

INSERT INTO `reputacija` (`id`, `klijentid`, `adminid`, `tiketid`, `rep`) VALUES
(1, 2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `serveri`
--

CREATE TABLE IF NOT EXISTS `serveri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `rank` int(12) NOT NULL DEFAULT '99999',
  `mod` mediumtext NOT NULL,
  `map` text NOT NULL,
  `port` mediumtext NOT NULL,
  `fps` int(11) NOT NULL DEFAULT '300',
  `slotovi` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `istice` mediumtext NOT NULL,
  `status` text NOT NULL,
  `startovan` int(11) NOT NULL DEFAULT '0',
  `free` mediumtext,
  `uplatnica` mediumtext,
  `igra` mediumtext,
  `komanda` mediumtext NOT NULL,
  `cena` mediumtext NOT NULL,
  `boost` mediumtext NOT NULL,
  `cache` blob NOT NULL,
  `reinstaliran` int(11) NOT NULL,
  `backup` varchar(12) NOT NULL DEFAULT '0',
  `napomena` text NOT NULL,
  `autorestart` varchar(11) DEFAULT '-1',
  `backupstatus` varchar(30) NOT NULL DEFAULT '0',
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `serveri`
--

INSERT INTO `serveri` (`id`, `user_id`, `box_id`, `ip_id`, `name`, `rank`, `mod`, `map`, `port`, `fps`, `slotovi`, `username`, `password`, `istice`, `status`, `startovan`, `free`, `uplatnica`, `igra`, `komanda`, `cena`, `boost`, `cache`, `reinstaliran`, `backup`, `napomena`, `autorestart`, `backupstatus`, `aid`) VALUES

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `serveri_naruceni`
--

CREATE TABLE IF NOT EXISTS `serveri_naruceni` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klijentid` int(11) DEFAULT NULL,
  `igra` int(2) DEFAULT NULL,
  `lokacija` int(2) DEFAULT NULL,
  `slotovi` int(4) DEFAULT NULL,
  `meseci` int(3) DEFAULT NULL,
  `cena` varchar(8) DEFAULT NULL,
  `status` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `server_backup`
--

CREATE TABLE IF NOT EXISTS `server_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srvid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '0',
  `size` varchar(20) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `slajdovi`
--

CREATE TABLE IF NOT EXISTS `slajdovi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naslov` text,
  `text` text,
  `slika` text,
  `datum` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Izbacivanje podataka za tablicu `slajdovi`
--

INSERT INTO `slajdovi` (`id`, `naslov`, `text`, `slika`, `datum`) VALUES
(5, 'Uplata putem SMS-a', 'Samo kod nas možete uplatiti putem SMS-a bez provizije\r\nVaš Morenja.info', '/assets/img/slider/2.png', '18.09.2016');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `smslog`
--

CREATE TABLE IF NOT EXISTS `smslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `message` varchar(64) NOT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `price` varchar(64) DEFAULT NULL,
  `revenue` varchar(11) NOT NULL DEFAULT '0',
  `currency` varchar(64) DEFAULT NULL,
  `service_id` varchar(64) DEFAULT NULL,
  `message_id` varchar(64) DEFAULT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `shortcode` varchar(64) DEFAULT NULL,
  `operator` varchar(64) DEFAULT NULL,
  `billing_type` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `tiketi`
--

CREATE TABLE IF NOT EXISTS `tiketi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` text,
  `prioritet` int(11) NOT NULL,
  `vrsta` int(11) NOT NULL,
  `datum` text,
  `naslov` text,
  `billing` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) NOT NULL,
  `otvoren` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `tiketi`
--

INSERT INTO `tiketi` (`id`, `admin_id`, `server_id`, `user_id`, `status`, `prioritet`, `vrsta`, `datum`, `naslov`, `billing`, `admin`, `otvoren`) VALUES
(5, NULL, 47, 4, '3', 2, 3, '1508601382', 'test asdasda', 0, 0, '2017-10-21'),
(6, NULL, 55, 21, '3', 2, 1, '1508688389', 'POMOC HITNO!', 0, 0, '2017-10-22'),
(7, NULL, 55, 21, '3', 2, 1, '1508766995', 'HITNO POMOC', 0, 0, '2017-10-23'),
(8, NULL, 58, 63, '3', 2, 1, '1508768349', 'Nisam dobio KOD', 0, 0, '2017-10-23'),
(9, NULL, 55, 21, '3', 2, 1, '1508852774', 'HITNO POMOC', 0, 0, '2017-10-24'),
(10, NULL, 55, 21, '3', 2, 1, '1508855599', 'Pomoc opet', 0, 0, '2017-10-24'),
(11, NULL, 16, 4, '3', 3, 1, '1508881433', 'TEST', 0, 0, '2017-10-24'),
(12, NULL, 78, 77, '3', 2, 1, '1508958922', 'FDL-', 0, 0, '2017-10-25'),
(13, NULL, 78, 77, '3', 2, 1, '1508963529', 'Dodaj Plugin', 0, 0, '2017-10-25'),
(14, NULL, 16, 4, '3', 2, 1, '1508964717', 'Fast Download ', 0, 0, '2017-10-25'),
(15, NULL, 55, 21, '3', 2, 1, '1509017051', 'CW SERVER', 0, 0, '2017-10-26'),
(16, NULL, 77, 4, '3', 2, 1, '1509047576', '.cfg i .ini', 0, 0, '2017-10-26'),
(17, NULL, 16, 4, '3', 2, 1, '1509050809', 'Sound', 0, 0, '2017-10-26'),
(18, NULL, 85, 94, '3', 2, 1, '1509107613', 'odgovorite hitno', 0, 0, '2017-10-27'),
(19, NULL, 96, 108, '3', 2, 1, '1509121641', 'FDL za Cs 1.6 server ', 0, 0, '2017-10-27'),
(20, NULL, 78, 77, '3', 2, 1, '1509124969', 'vacc', 0, 0, '2017-10-27'),
(21, NULL, 16, 4, '3', 2, 3, '1509199946', 'Problem', 0, 0, '2017-10-28'),
(22, NULL, 58, 63, '3', 2, 1, '1509206586', 'dm mod', 0, 0, '2017-10-28'),
(23, NULL, 62, 61, '3', 2, 3, '1509209926', 'Top 15', 0, 0, '2017-10-28'),
(24, NULL, 55, 21, '3', 2, 1, '1509214034', 'HITNNOOOO', 0, 0, '2017-10-28'),
(25, NULL, 55, 21, '3', 2, 1, '1509272803', 'HITNO POMOC', 0, 0, '2017-10-29'),
(26, NULL, 62, 61, '3', 2, 1, '1509278515', 'ct-tt', 0, 0, '2017-10-29'),
(27, NULL, 16, 4, '3', 2, 3, '1509289883', 'Voice', 0, 0, '2017-10-29'),
(28, NULL, 16, 4, '3', 2, 3, '1509304578', 'Sigurnosni Kod', 0, 0, '2017-10-29'),
(29, NULL, 123, 127, '3', 2, 1, '1509311845', 'Gamepanel', 0, 0, '2017-10-29'),
(30, NULL, 60, 65, '3', 2, 1, '1509552086', 'Sigurnosni Kod', 0, 0, '2017-11-01'),
(31, NULL, 0, 51, '3', 1, 1, '1509715485', 'Billing: <z>Nova uplata</z>', 3, 0, '2017-11-03'),
(32, NULL, 97, 21, '3', 2, 1, '1509725242', 'HELP PLS', 0, 0, '2017-11-03'),
(33, NULL, 140, 140, '3', 2, 3, '1509725669', 'Voice (Greske)', 0, 0, '2017-11-03'),
(34, NULL, 78, 77, '3', 2, 1, '1509727889', 'Flag', 0, 0, '2017-11-03'),
(35, NULL, 78, 77, '3', 2, 1, '1509743218', 'Lagg', 0, 0, '2017-11-03'),
(36, NULL, 78, 77, '3', 2, 1, '1509745795', 'Opettt', 0, 0, '2017-11-03'),
(37, NULL, 140, 140, '3', 2, 3, '1509815550', 'VOICE GRESKA', 0, 4, '2017-11-04'),
(38, NULL, 128, 94, '3', 1, 1, '1509819660', 'Billing: <z>Nova uplata</z>', 4, 0, '2017-11-04'),
(39, NULL, 128, 94, '3', 2, 3, '1509821780', 'problem oko reinstalacije', 0, 0, '2017-11-04'),
(40, NULL, 62, 61, '3', 2, 3, '1509830589', 'tOP15', 0, 0, '2017-11-04'),
(41, NULL, 62, 61, '3', 2, 1, '1509833971', 'FreeBoost', 0, 0, '2017-11-04'),
(42, NULL, 128, 94, '3', 1, 1, '1509900383', 'Billing: Nova uplata - Leglo', 5, 1, '2017-11-05'),
(43, NULL, 128, 94, '3', 2, 3, '1509905176', 'Molimmm vasssss', 0, 0, '2017-11-05'),
(44, NULL, 78, 77, '3', 2, 1, '1509909071', 'FREE BOOST NE RADI', 0, 0, '2017-11-05'),
(45, NULL, 0, 132, '3', 1, 1, '1509919211', 'Billing: Nova uplata - Nije leglo', 6, 0, '2017-11-05'),
(46, NULL, 169, 191, '3', 2, 1, '1510000685', 'BaseBuilder MOD', 0, 0, '2017-11-06'),
(47, NULL, 169, 191, '3', 2, 1, '1510001676', 'BaseBuilder MOD', 0, 0, '2017-11-06'),
(49, NULL, 169, 191, '3', 2, 1, '1510064513', 'BaseBuilder', 0, 0, '2017-11-07'),
(50, NULL, 78, 77, '3', 2, 1, '1510086903', 'Modd', 0, 0, '2017-11-07'),
(51, NULL, 128, 94, '3', 2, 1, '1510087352', 'Bag?', 0, 0, '2017-11-07'),
(52, NULL, 16, 4, '3', 2, 3, '1510149071', 'Nema mi server', 0, 10, '2017-11-08'),
(53, NULL, 128, 94, '3', 2, 1, '1510171014', 'Pomoc', 0, 14, '2017-11-08'),
(54, NULL, 62, 61, '3', 2, 1, '1510415961', 'PaintBall Mod', 0, 0, '2017-11-11'),
(55, NULL, 62, 61, '3', 2, 1, '1510434222', 'Kutije', 0, 0, '2017-11-11'),
(56, NULL, 62, 61, '3', 2, 1, '1510447469', 'Kutije Plugin', 0, 0, '2017-11-12'),
(57, NULL, 62, 61, '3', 2, 1, '1510481502', 'top15', 0, 0, '2017-11-12'),
(58, NULL, 62, 61, '3', 2, 1, '1510495336', 'FreeBoost', 0, 0, '2017-11-12'),
(59, NULL, 62, 61, '3', 2, 1, '1510603215', 'VIPs', 0, 1, '2017-11-13'),
(60, NULL, 126, 95, '3', 2, 1, '1510609851', 'Server ne radi ', 0, 0, '2017-11-13'),
(61, NULL, 141, 95, '3', 2, 1, '1510610166', 'Server ne radi ', 0, 0, '2017-11-13'),
(62, NULL, 141, 95, '3', 2, 1, '1510611143', 'Obrisan tiket server ne radi', 0, 0, '2017-11-13'),
(63, NULL, 141, 95, '3', 2, 1, '1510615503', 'timeleft', 0, 0, '2017-11-14'),
(64, NULL, 62, 61, '3', 2, 1, '1510686582', 'VIPovi', 0, 0, '2017-11-14'),
(65, NULL, 140, 140, '3', 2, 1, '1510688570', 'Server SUSPEND', 0, 0, '2017-11-14'),
(66, NULL, 62, 61, '3', 2, 1, '1510698441', 'Mape', 0, 0, '2017-11-14'),
(67, NULL, 62, 61, '3', 2, 3, '1510870601', 'Mape ', 0, 0, '2017-11-16'),
(68, NULL, 62, 61, '3', 2, 1, '1510947279', 'FreeBoost', 0, 0, '2017-11-17'),
(69, NULL, 62, 61, '3', 2, 3, '1511003391', 'VIps', 0, 0, '2017-11-18'),
(70, NULL, 62, 61, '3', 2, 3, '1511025938', 'Deathmac', 0, 19, '2017-11-18'),
(71, NULL, 62, 61, '3', 2, 1, '1511048936', 'Skinovi ', 0, 0, '2017-11-19'),
(72, NULL, 175, 4, '3', 2, 1, '1511095191', 'Reinstall', 0, 0, '2017-11-19'),
(73, NULL, 62, 61, '3', 2, 3, '1511106892', 'Server', 0, 0, '2017-11-19'),
(74, NULL, 62, 61, '3', 2, 3, '1511136543', 'Knifes', 0, 0, '2017-11-20'),
(75, NULL, 208, 220, '3', 2, 1, '1511377742', 'FDL  VANE REKO DA SE JAVIM', 0, 0, '2017-11-22'),
(76, NULL, 208, 220, '3', 2, 1, '1511378461', 'FDL NISTE DODALI!', 0, 0, '2017-11-22'),
(77, NULL, 220, 65, '3', 2, 1, '1511379044', 'Pomoc nece mi uci u server', 0, 0, '2017-11-22'),
(78, NULL, 221, 61, '3', 2, 3, '1511387187', 'Paintball', 0, 0, '2017-11-22'),
(79, NULL, 221, 61, '3', 2, 1, '1511452398', 'Server', 0, 0, '2017-11-23'),
(80, NULL, 221, 61, '3', 2, 3, '1511457915', 'Server', 0, 0, '2017-11-23'),
(81, NULL, 221, 61, '3', 2, 3, '1511459173', 'PaintBall', 0, 0, '2017-11-23'),
(82, NULL, 16, 4, '3', 2, 3, '1511478052', 'Ukljucite mi server', 0, 0, '2017-11-24'),
(83, NULL, 221, 61, '3', 2, 3, '1511548780', 'Server Mod', 0, 0, '2017-11-24'),
(84, NULL, 221, 61, '3', 2, 1, '1511563978', 'Server', 0, 0, '2017-11-24'),
(85, NULL, 228, 251, '3', 2, 3, '1511610811', 'pomoc', 0, 0, '2017-11-25'),
(86, NULL, 228, 251, '3', 2, 1, '1511611527', 'pomoc', 0, 0, '2017-11-25'),
(87, NULL, 230, 251, '3', 2, 1, '1511701279', 'Potreban mi je pin za srw  PIN', 0, 0, '2017-11-26'),
(91, NULL, 236, 261, '2', 2, 3, '1511724075', 'Ae neko pomoc', 0, 0, '2017-11-26'),
(92, NULL, 221, 61, '3', 2, 1, '1511725946', 'GTRS', 0, 0, '2017-11-26'),
(93, NULL, 221, 61, '3', 2, 1, '1511731328', 'Zombie', 0, 0, '2017-11-26');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `tiketi_odgovori`
--

CREATE TABLE IF NOT EXISTS `tiketi_odgovori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `odgovor` text NOT NULL,
  `vreme_odgovora` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Izbacivanje podataka za tablicu `tiketi_odgovori`
--

CREATE TABLE IF NOT EXISTS `tiketi_odgovori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `odgovor` text NOT NULL,
  `vreme_odgovora` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Izbacivanje podataka za tablicu `tiketi_odgovori`
--

INSERT INTO `tiketi_odgovori` (`id`, `tiket_id`, `user_id`, `admin_id`, `odgovor`, `vreme_odgovora`) VALUES
(12, 5, 4, NULL, 'asdadasdad asdasd asdasasfasdkasdkkais dsssssssss', '1508601382'),
(13, 5, NULL, 1, 'okej', '1508601388'),
(14, 6, 21, NULL, 'Pomoc moze li mi netko reci zasto mi se ime servera nece promijeniti u pitanje je CS 1.6 server stavio sam ime [PUB] ReduX ali i dalje stoji ono New CS server is born, PLS POMOC!', '1508688389'),

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
