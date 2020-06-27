-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: jnoj
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `lock_board_time` datetime DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `editorial` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `scenario` smallint(6) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_announcement`
--

DROP TABLE IF EXISTS `contest_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contest_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_contest_id` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_announcement`
--

LOCK TABLES `contest_announcement` WRITE;
/*!40000 ALTER TABLE `contest_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_print`
--

DROP TABLE IF EXISTS `contest_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_print` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `contest_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_contest_id` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_print`
--

LOCK TABLES `contest_print` WRITE;
/*!40000 ALTER TABLE `contest_print` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_print` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_problem`
--

DROP TABLE IF EXISTS `contest_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `num` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_problem_id` (`problem_id`),
  KEY `idx_contest_id` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_problem`
--

LOCK TABLES `contest_problem` WRITE;
/*!40000 ALTER TABLE `contest_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_user`
--

DROP TABLE IF EXISTS `contest_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contest_id` int(11) NOT NULL,
  `user_password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `rating_change` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_contest_id` (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_user`
--

LOCK TABLES `contest_user` WRITE;
/*!40000 ALTER TABLE `contest_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `entity` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_entity_id` (`entity_id`),
  KEY `idx_entity` (`entity`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL,
  `join_policy` tinyint(3) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'c programming context','c programming context , the winner gets 10,000 yuan',1,2,1,'2020-06-08 18:59:17','2020-06-08 19:01:00');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` tinyint(3) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,1,1,6,'2020-06-08 18:59:17');
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1591605293),('m180401_030422_import_initial_table',1591605359),('m180404_135413_insert_basic_data',1591605359),('m180929_073954_update_polygon_status',1591605360),('m181109_032216_index',1591605360),('m181226_104846_fix_contest_announcement',1591605361),('m190309_123832_setting',1591605361),('m190315_134224_solution_change',1591605361),('m190402_104247_group',1591605361),('m190519_024551_problem_solution',1591605361),('m191226_003957_email',1591605362);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polygon_problem`
--

DROP TABLE IF EXISTS `polygon_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polygon_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `input` text COLLATE utf8_unicode_ci,
  `output` text COLLATE utf8_unicode_ci,
  `sample_input` text COLLATE utf8_unicode_ci,
  `sample_output` text COLLATE utf8_unicode_ci,
  `spj` smallint(1) DEFAULT '0',
  `spj_lang` smallint(6) DEFAULT NULL,
  `spj_source` text COLLATE utf8_unicode_ci,
  `hint` text COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `memory_limit` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `accepted` int(11) DEFAULT '0',
  `submit` int(11) DEFAULT '0',
  `solved` int(11) DEFAULT '0',
  `tags` text COLLATE utf8_unicode_ci,
  `solution` text COLLATE utf8_unicode_ci,
  `solution_lang` smallint(6) DEFAULT NULL,
  `solution_source` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polygon_problem`
--

LOCK TABLES `polygon_problem` WRITE;
/*!40000 ALTER TABLE `polygon_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `polygon_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polygon_status`
--

DROP TABLE IF EXISTS `polygon_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polygon_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) DEFAULT NULL,
  `result` smallint(6) NOT NULL DEFAULT '0',
  `time` int(11) DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `language` smallint(6) DEFAULT NULL,
  `source` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_problem_id` (`problem_id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polygon_status`
--

LOCK TABLES `polygon_status` WRITE;
/*!40000 ALTER TABLE `polygon_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `polygon_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `input` text COLLATE utf8_unicode_ci,
  `output` text COLLATE utf8_unicode_ci,
  `sample_input` text COLLATE utf8_unicode_ci,
  `sample_output` text COLLATE utf8_unicode_ci,
  `spj` smallint(1) DEFAULT '0',
  `hint` text COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `memory_limit` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `accepted` int(11) DEFAULT '0',
  `submit` int(11) DEFAULT '0',
  `solved` int(11) DEFAULT '0',
  `tags` text COLLATE utf8_unicode_ci,
  `solution` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `polygon_problem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1000,'[在线测评解答教程] A+B Problem','<p>输入两个数字，输出它们的和。</p>','<p>两个整数: $ a, b(0 \\leq a, b \\leq 100)$。</p>','<p>输出一个整数，该整数为 $a, b$ 两数字之和。</p>\'','a:3:{i:0;s:3:\"1 2\";i:1;s:0:\"\";i:2;s:0:\"\";}','a:3:{i:0;s:1:\"3\";i:1;s:0:\"\";i:2;s:0:\"\";}',0,'<p>Q：输入和输出在哪里？</p><p>A：您的程序应始终从 <code>stdin</code>（标准输入）读取输入，并将输出写入 <code>stdout</code>（标准输出）。例如，您可以使用C中的 <code>scanf</code> 或 C++ 中的 <code>cin</code> 从 <code>stdin</code> 中读取，并使用 C 中的 <code>printf</code> 或 C++ 中的 <code>cout</code> 写入 <code>stdout</code>。如果不是题目要求的，您不得输出任何额外的信息到标准输出，否则您会得到一个 <code>Wrong Answer</code>。 用户程序不允许打开和读取/写入文件。如果您尝试这样做，您将收到 <code>Runtime Error</code> 或 <code>Wrong Answer</code>。</p><p>以下是问题 1000 使用 C / C++ / Java 的示例解决方案：&nbsp;</p><pre><p>#include &lt;stdio.h&gt;\r\nint main()\r\n{\r\n    int a, b;\r\n    scanf(\"%d %d\", &amp;a, &amp;b);\r\n    printf(\"%d\\n\", a + b);\r\n    return 0;\r\n}</p></pre><pre><p>#include &lt;iostream&gt;\r\nusing namespace std;\r\nint  main()\r\n{\r\n    int a, b;\r\n    cin &gt;&gt; a &gt;&gt; b;\r\n    cout &lt;&lt; a + b &lt;&lt; endl;\r\n    return 0;\r\n}</p></pre><pre><p>import java.util.Scanner;\r\n\r\npublic class Main {\r\n    public static void main(String[] args) {\r\n        Scanner in = new Scanner(System.in);\r\n        int a = in.nextInt();\r\n        int b = in.nextInt();\r\n        System.out.print(a + b + \"\\n\");\r\n    }\r\n}</p></pre>',NULL,1,128,1,0,0,0,NULL,NULL,'2020-06-08 16:35:59',NULL,'2020-06-08 16:35:59',NULL),(1001,'[在线测评解答教程] 求和','<p>输入一个数 $n$，你的任务是计算 $1 + 2 + ... + n$ 的结果．</p>','<p>输入的数据有多行，每行一个整数 $n (1 \\le n \\le 1000)$，以 <code>EOF</code> 表示输入结束。</p>','<p>输出数据同样有多行，每行输出一个整数，该整数的值为 $1 + 2 + ... + n$。</p>','a:3:{i:0;s:7:\"10\r\n100\";i:1;N;i:2;N;}','a:3:{i:0;s:8:\"55\r\n5050\";i:1;N;i:2;N;}',0,'<p>通常，题目会要求多组样例输入。对于多组样例输入，一般会是读到 <code>EOF</code> 结束。 <code>EOF</code> 的意思是 <code>End Of File</code>，表示读到文件尾，结束输入。 <code>scanf</code> 函数的返回值如果为 <code>EOF</code> 的话，就表示输入结束了。比如题目输入一个数，以 <code>EOF</code> 结束，你就可以这样写：</p><p>C 语言：</p><pre><p>#include&lt;stdio.h&gt;<br>int main()<br>{<br>    int n;<br>    while (scanf(\"%d\", &amp;n) != EOF) {<br>         //解题代码<br>    }<br>    return 0;<br>}</p></pre><p>C++:&nbsp;</p><pre><p>#include &lt;iostream&gt;<br>using namespace std;<br>int main()<br>{<br>    int n;<br>    while (cin &gt;&gt; n) {<br>        //解题代码<br>    }<br>    return 0;<br>}</p></pre><p>所以，这道题的 Accepted 代码是（以Ｃ语言为例）：</p><pre><p>#include&lt;stdio.h&gt;<br>int main()<br>{<br>    int n;<br>    while (scanf(\"%d\", &amp;n) != EOF) {<br>        printf(\"%d\\n\", n * (n + 1) / 2 );<br>    }<br>    return 0;<br>}</p></pre>',NULL,1,128,1,0,0,0,NULL,NULL,'2020-06-08 16:35:59',NULL,'2020-06-08 16:35:59',NULL),(1002,'[在线测评解答教程] 闰年','<p>给你一个年份，请判断它是不是闰年。</p>','<p>第一行，输入一个整数 $t$，表示有 $t$ 组样例。<br>接下来 $t$ 行，每行输入一个整数 $ n(1000 \\leq n \\leq 4000)$，表示需要你判断的年份。</p>','<p>输出 $ t $ 行。 对于输入的 $n$，如果它是闰年，输出 <code>Yes</code>，否则输出 <code>No</code>。</p>','a:3:{i:0;s:31:\"5\r\n2016\r\n2017\r\n2018\r\n2019\r\n2020\";i:1;N;i:2;N;}','a:3:{i:0;s:20:\"Yes\r\nNo\r\nNo\r\nNo\r\nYes\";i:1;N;i:2;N;}',0,'<p>题目要求输入 $t$ 组样例，那么我们可以这样写：</p><pre><p>#include &lt;stdio.h&gt;<br>int main()<br>{<br>    int t, n;<br>    scanf(\"%d\", &amp;t);<br>    while (t--) {<br>        scanf(\"%d\", &amp;n);<br>        //在这里写判断 n 是否为闰年的代码及输出结果<br>    }<br>    return 0;<br>}</p></pre><p>这道题的解题方法就靠大家发挥了．</p><p>提示：在处理多组样例时，可以一组样例、一组样例地输出，而不必等处理完所有样例才统一输出。</p>',NULL,1,128,1,0,0,0,NULL,NULL,'2020-06-08 16:35:59',NULL,'2020-06-08 16:35:59',NULL);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'ojName','江南'),(2,'schoolName','江南大学'),(3,'scoreboardFrozenTime','7200'),(4,'isShareCode','1'),(5,'oiMode','0'),(6,'passwordResetTokenExpire','7200'),(7,'mustVerifyEmail','0'),(8,'emailHost','smtp.exmail.qq.com'),(9,'emailUsername','no-reply@jnoj.org'),(10,'emailPassword','8hVeA6LN4LPqwHei'),(11,'emailPort','465'),(12,'emailEncryption','ssl');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `memory` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `result` smallint(6) NOT NULL DEFAULT '0',
  `language` smallint(6) NOT NULL,
  `contest_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `code_length` int(11) NOT NULL,
  `judgetime` datetime DEFAULT NULL,
  `pass_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `judge` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_problem_id` (`problem_id`),
  KEY `idx_contest_id` (`contest_id`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solution_info`
--

DROP TABLE IF EXISTS `solution_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solution_info` (
  `solution_id` int(11) NOT NULL,
  `run_info` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`solution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution_info`
--

LOCK TABLES `solution_info` WRITE;
/*!40000 ALTER TABLE `solution_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `solution_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `role` smallint(6) NOT NULL DEFAULT '10',
  `language` smallint(6) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `is_verify_email` smallint(6) NOT NULL DEFAULT '0',
  `verification_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-user-username-unique` (`username`),
  UNIQUE KEY `idx-user-email-unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','ysgDI8YKt_T5SCICZak1Le8f_a43A__S','$2y$13$NIB/1Br2HUHuVuuhE2qiROErL.yH3rzF951JRXlrYiUsC0FT2MBsu',NULL,'admin@gmail.com',10,30,1,'2020-06-08 08:35:58','2020-06-08 08:35:58',NULL,0,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `user_id` int(11) NOT NULL,
  `gender` smallint(6) DEFAULT '0',
  `qq_number` bigint(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `signature` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-27 15:47:49
