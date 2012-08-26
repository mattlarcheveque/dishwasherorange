CREATE DATABASE  IF NOT EXISTS `savageworlds` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `savageworlds`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: savageworlds
-- ------------------------------------------------------
-- Server version	5.5.25a

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
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `skill_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned DEFAULT NULL,
  `skill_name` varchar(80) DEFAULT NULL,
  `skill_description` blob,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_character_skills`
--

DROP TABLE IF EXISTS `view_character_skills`;
/*!50001 DROP VIEW IF EXISTS `view_character_skills`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_character_skills` (
  `character_id` int(11) unsigned,
  `character_name` varchar(255),
  `character_level` int(11),
  `skill_id` int(10) unsigned,
  `skill_name` varchar(80),
  `skill_rank` int(10) unsigned,
  `skill_description` blob,
  `skill_attribute` varchar(45)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `character_skills`
--

DROP TABLE IF EXISTS `character_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_skills` (
  `character_id` int(10) unsigned NOT NULL,
  `skill_id` int(10) unsigned NOT NULL,
  `skill_rank` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`character_id`,`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_skills`
--

LOCK TABLES `character_skills` WRITE;
/*!40000 ALTER TABLE `character_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `player_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) DEFAULT NULL,
  `login_name` varchar(100) DEFAULT NULL,
  `login_pass` char(40) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Kaitlyn',NULL,NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `character_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) unsigned NOT NULL,
  `character_level` int(11) DEFAULT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,1,1,'Joe'),(2,1,1,'a');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_attributes`
--

DROP TABLE IF EXISTS `character_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_attributes` (
  `character_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_rank` int(10) unsigned DEFAULT '4',
  PRIMARY KEY (`character_id`,`attribute_id`),
  KEY `player_id_idx` (`character_id`),
  KEY `attribute_id_idx` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_attributes`
--

LOCK TABLES `character_attributes` WRITE;
/*!40000 ALTER TABLE `character_attributes` DISABLE KEYS */;
INSERT INTO `character_attributes` VALUES (1,1,4),(1,2,6),(1,3,8),(1,4,6),(1,5,8),(2,1,4),(2,2,4),(2,3,4),(2,4,4),(2,5,4);
/*!40000 ALTER TABLE `character_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'agility'),(2,'smarts'),(3,'spirit'),(4,'strength'),(5,'vigor');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_all_characters`
--

DROP TABLE IF EXISTS `view_all_characters`;
/*!50001 DROP VIEW IF EXISTS `view_all_characters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_all_characters` (
  `player_id` int(10) unsigned,
  `player_name` varchar(255),
  `character_id` int(11) unsigned,
  `character_name` varchar(255),
  `character_level` int(11),
  `agility` bigint(10) unsigned,
  `smarts` bigint(10) unsigned,
  `spirit` bigint(10) unsigned,
  `strength` bigint(10) unsigned,
  `vigor` bigint(10) unsigned
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_character_skills`
--

/*!50001 DROP TABLE IF EXISTS `view_character_skills`*/;
/*!50001 DROP VIEW IF EXISTS `view_character_skills`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_character_skills` AS select `ac`.`character_id` AS `character_id`,`ac`.`character_name` AS `character_name`,`ac`.`character_level` AS `character_level`,`s`.`skill_id` AS `skill_id`,`s`.`skill_name` AS `skill_name`,`cs`.`skill_rank` AS `skill_rank`,`s`.`skill_description` AS `skill_description`,`a`.`attribute_name` AS `skill_attribute` from (((`view_all_characters` `ac` left join `character_skills` `cs` on((`cs`.`character_id` = `ac`.`character_id`))) left join `skills` `s` on((`cs`.`skill_id` = `s`.`skill_id`))) left join `attributes` `a` on((`a`.`attribute_id` = `s`.`attribute_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_all_characters`
--

/*!50001 DROP TABLE IF EXISTS `view_all_characters`*/;
/*!50001 DROP VIEW IF EXISTS `view_all_characters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_all_characters` AS select `p`.`player_id` AS `player_id`,`p`.`player_name` AS `player_name`,`c`.`character_id` AS `character_id`,`c`.`character_name` AS `character_name`,`c`.`character_level` AS `character_level`,(select `ca1`.`attribute_rank` from `character_attributes` `ca1` where ((`ca1`.`character_id` = `c`.`character_id`) and (`ca1`.`attribute_id` = 1))) AS `agility`,(select `ca1`.`attribute_rank` from `character_attributes` `ca1` where ((`ca1`.`character_id` = `c`.`character_id`) and (`ca1`.`attribute_id` = 2))) AS `smarts`,(select `ca1`.`attribute_rank` from `character_attributes` `ca1` where ((`ca1`.`character_id` = `c`.`character_id`) and (`ca1`.`attribute_id` = 3))) AS `spirit`,(select `ca1`.`attribute_rank` from `character_attributes` `ca1` where ((`ca1`.`character_id` = `c`.`character_id`) and (`ca1`.`attribute_id` = 4))) AS `strength`,(select `ca1`.`attribute_rank` from `character_attributes` `ca1` where ((`ca1`.`character_id` = `c`.`character_id`) and (`ca1`.`attribute_id` = 5))) AS `vigor` from (`players` `p` left join `characters` `c` on((`p`.`player_id` = `c`.`player_id`))) order by `p`.`player_id`,`c`.`character_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'savageworlds'
--

--
-- Dumping routines for database 'savageworlds'
--
/*!50003 DROP PROCEDURE IF EXISTS `procedure_create_character` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `procedure_create_character`(
IN _player_id int, 
IN _character_name varchar(255), 
IN _character_level int,
IN _agility int,
IN _smarts int,
IN _spirit int,
IN _strength int,
IN _vigor int
)
BEGIN

declare _id int;

insert into characters
(character_level, character_name, player_id)
values
(_character_level, _character_name, _player_id);

set _id = last_insert_id();

insert into character_attributes
(attribute_id, attribute_rank, character_id)
values
(1, _agility, _id);

insert into character_attributes
(attribute_id, attribute_rank, character_id)
values
(2, _smarts, _id);

insert into character_attributes
(attribute_id, attribute_rank, character_id)
values
(3, _spirit, _id);

insert into character_attributes
(attribute_id, attribute_rank, character_id)
values
(4, _strength, _id);

insert into character_attributes
(attribute_id, attribute_rank, character_id)
values
(5, _vigor, _id);



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-26 19:38:17
