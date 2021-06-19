CREATE DATABASE  IF NOT EXISTS `med_expert` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `med_expert`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: med_expert
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mkb`
--

DROP TABLE IF EXISTS `mkb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mkb` (
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mkb`
--

LOCK TABLES `mkb` WRITE;
/*!40000 ALTER TABLE `mkb` DISABLE KEYS */;
INSERT INTO `mkb` VALUES ('A15'),('A19'),('D63.0'),('D63.8'),('D65'),('D69'),('D70'),('D77'),('D80'),('D89'),('E00'),('E90'),('F00'),('F99'),('G00'),('G99'),('H00'),('H59'),('H60'),('H95'),('I00'),('I99'),('J00'),('J99'),('K00'),('K93'),('L00'),('L99'),('M00'),('M45'),('M51.1'),('M99'),('N00'),('N99'),('O00'),('O99'),('P00'),('P96'),('Q00'),('Q99'),('R00'),('R99'),('S00'),('T98'),('V01'),('Y98'),('Z00'),('Z99');
/*!40000 ALTER TABLE `mkb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `SNILS` varchar(20) NOT NULL,
  `Users_id` int NOT NULL,
  `MKB_code` varchar(10) NOT NULL,
  PRIMARY KEY (`SNILS`,`Users_id`,`MKB_code`),
  KEY `fk_Patients_Users_idx` (`Users_id`),
  KEY `fk_Patients_MKB1_idx` (`MKB_code`),
  CONSTRAINT `fk_Patients_MKB1` FOREIGN KEY (`MKB_code`) REFERENCES `mkb` (`code`),
  CONSTRAINT `fk_Patients_Users` FOREIGN KEY (`Users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('222-233-445 85',1,'M45');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients_has_services`
--

DROP TABLE IF EXISTS `patients_has_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients_has_services` (
  `Patients_SNILS` varchar(20) NOT NULL,
  `Services_id_Services` varchar(15) NOT NULL,
  `is_done` tinyint NOT NULL,
  PRIMARY KEY (`Patients_SNILS`,`Services_id_Services`),
  KEY `fk_Patients_has_Services_Services1_idx` (`Services_id_Services`),
  KEY `fk_Patients_has_Services_Patients1_idx` (`Patients_SNILS`),
  CONSTRAINT `fk_Patients_has_Services_Patients1` FOREIGN KEY (`Patients_SNILS`) REFERENCES `patients` (`SNILS`),
  CONSTRAINT `fk_Patients_has_Services_Services1` FOREIGN KEY (`Services_id_Services`) REFERENCES `services` (`id_services`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients_has_services`
--

LOCK TABLES `patients_has_services` WRITE;
/*!40000 ALTER TABLE `patients_has_services` DISABLE KEYS */;
INSERT INTO `patients_has_services` VALUES ('222-233-445 85','A02.26.002',0);
/*!40000 ALTER TABLE `patients_has_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id_services` varchar(20) NOT NULL,
  `description` varchar(300) NOT NULL,
  `count` int DEFAULT NULL,
  `Units_idUnits` int NOT NULL,
  `primary_analisys` tinyint DEFAULT NULL,
  `period` double NOT NULL,
  PRIMARY KEY (`id_services`),
  UNIQUE KEY `idServices_UNIQUE` (`id_services`),
  KEY `fk_Services_Units1_idx` (`Units_idUnits`),
  CONSTRAINT `fk_Services_Units1` FOREIGN KEY (`Units_idUnits`) REFERENCES `units` (`idUnits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('A02.26.002','Исследование сред глаза в проходящем свете',NULL,3,NULL,0.5),('A03.04.001','Артроскопия диагностическая',NULL,3,NULL,0.05),('A03.16.001','Эзофагогастродуоденоскопия',NULL,3,NULL,1),('A03.26.001','Биомикроскопия глаза',NULL,3,NULL,0.5),('A04.04.001','Ультразвуковое исследование сустава',NULL,3,NULL,0.5),('A04.10.002','Эхокардиография',NULL,3,NULL,0.3),('A05.03.002','Магнитно-резонансная томография позвоночника (один отдел)',NULL,3,NULL,0.2),('A05.04.001','Магнитно-резонансная томография суставов (один сустав)',NULL,3,NULL,0.1),('A06.03.010','Рентгенография шейного отдела позвоночника',NULL,3,NULL,0.2),('A06.03.011','Рентгенография шейно-дорсального отдела позвоночника',NULL,3,NULL,0.2),('A06.03.015','Рентгенография поясничного отдела позвоночника',NULL,3,NULL,0.5),('A06.03.016','Рентгенография пояснично-крестцового отдела позвоночника',NULL,3,NULL,0.5),('A06.03.032','Рентгенография кисти руки',NULL,3,NULL,1),('A06.03.041','Рентгенография всего таза',NULL,3,NULL,1),('A06.03.042','Рентгенография головки и шейки бедренной кости',NULL,3,NULL,0.1),('A06.03.052','Рентгенография стопы',NULL,3,NULL,1),('A06.04.005','Рентгенография коленного сустава',NULL,3,NULL,0.05),('A06.04.015','Томография височно-нижнечелюстного сустава',NULL,3,NULL,0.1),('A06.04.017','Компьютерная томография сустава',NULL,3,NULL,0.1),('A06.09.007','Рентгенография легких',NULL,3,NULL,1),('A07.03.001','Сцинтиграфия костей',NULL,3,NULL,0.01),('A08.04.001','Морфологическое исследование препарата синовиальной оболочки',NULL,2,NULL,0.05),('A08.04.002','Гистологическое исследование препарата суставной сумки, капсулы суставов',NULL,2,NULL,0.05),('A08.04.003','Цитологическое исследование препарата тканей сустава',NULL,2,NULL,0.05),('A08.19.001','Морфологическое исследование препарата тканей прямой кишки',NULL,2,NULL,0.05),('A08.19.006','Гистохимическое исследование препарата тканей прямой кишки',NULL,2,NULL,0.05),('A08.28.003','Иммуноморфологическое исследование тканей почки',NULL,2,NULL,0.05),('A08.28.014','Морфологическое исследование препарата тканей почки',NULL,2,NULL,0.05),('A09.04.002','Цитологическое исследование синовиальной жидкости',NULL,2,NULL,0.3),('A09.04.003','Исследование химических свойств синовиальной жидкости',NULL,2,NULL,0.3),('A09.04.004','Исследование физических свойств синовиальной жидкости',NULL,2,NULL,0.2),('A09.04.005','Исследование уровня белка в синовиальной жидкости',NULL,2,NULL,0.2),('A09.05.012','Исследование уровня общего глобулина в крови',NULL,2,NULL,1),('A09.05.013','Определение альбумин/глобулинового соотношения в крови',NULL,2,NULL,1),('A09.05.014','Исследование уровня глобулиновых фракций в крови',NULL,2,NULL,1),('A11.04.001','Биопсия тканей сустава',NULL,3,NULL,0.1),('A11.04.003','Диагностическая аспирация сустава',NULL,3,NULL,0.2),('A11.16.002','Биопсия желудка с помощью эндоскопии',NULL,3,NULL,0.05),('A11.16.003','Биопсия двенадцатиперстной кишки с помощью эндоскопии',NULL,3,NULL,0.2),('A11.26.015','Соскоб конъюнктивы',NULL,3,NULL,0.1),('A11.28.001','Биопсия почки',NULL,3,NULL,0.05),('A12.05.005','Определение основных групп крови (А, В, 0)',NULL,2,NULL,0.1),('A12.05.006','Определение резус-принадлежности',NULL,2,NULL,0.1),('A12.05.010','Определение HLA-антигенов',NULL,2,NULL,1),('A12.06.010','Исследование антител к антигенам ядра клетки и ДНК',NULL,2,NULL,0.2),('A12.06.011','Проведение реакции Вассермана (RW)',NULL,2,NULL,1),('A12.06.015','Определение антистрептолизина-О в сыворотке крови',NULL,2,NULL,0.1),('A12.06.016','Проведение серологической реакции на различные инфекции, вирусы',NULL,2,NULL,0.1),('A12.06.019','Исследование ревматоидных факторов в крови',NULL,2,NULL,1),('A12.26.002','Очаговая проба с туберкулином',NULL,2,NULL,0.1),('A26.04.001','Бактериологическое исследование синовиальной жидкости на гонококк (Neisseria gonorrhoeae)',NULL,2,NULL,0.01),('A26.04.002','Бактериологическое исследование синовиальной жидкости на менингококк (Neisseria meningiditis)',NULL,2,NULL,0.01),('A26.04.003','Бактериологическое исследование синовиальной жидкости на микобактерии туберкулеза (Mycobacterium tuberculosis)',NULL,2,NULL,0.01),('A26.04.004','Бактериологическое исследование синовиальной жидкости на аэробные и факультативно-анаэробные микроорганизмы',NULL,2,NULL,0.02),('A26.06.018','Определение антител классов А, М, G (IgA, IgM, IgG) к хламидии трахоматис (Chlamydia trachomatis) в крови',NULL,2,NULL,0.1),('A26.06.073','Определение антител к сальмонелле кишечной (Salmonella enterica) в крови',NULL,2,NULL,0.1),('A26.06.093','Определение антител классов М, G (IgM, IgG) к иерсинии энтероколитика (Yersinia enterocolitica) в крови',NULL,2,NULL,0.2),('A26.06.094','Определение антител классов М, G (IgM, IgG) к иерсинии псевдотуберкулеза (Yersinia pseudotuberculosis) в крови',NULL,2,NULL,0.2),('A26.20.004','Микробиологическое исследование отделяемого женских половых органов на хламидии (Chlamydia trachomatis)',NULL,2,NULL,0.1),('A26.21.003','Микробиологическое исследование отделяемого из уретры на хламидии (Chlamydia trachomatis)',NULL,2,NULL,0.1),('A26.21.007','Молекулярно-биологическое исследование отделяемого из уретры на хламидии (Chlamidia trachomatis)',NULL,2,NULL,0.2),('A26.26.007','Молекулярно-биологическое исследование отделяемого коньюнктивы на хламидии (Chlamidia trachomatis)',NULL,2,NULL,0.1),('B01.003.001','Осмотр (консультация) врачом-анестезиологом-реаниматологом первичный',NULL,1,NULL,0.01),('B01.005.001','Прием (осмотр, консультация) врача-гематолога первичный',NULL,1,NULL,0.05),('B01.008.001','Прием (осмотр, консультация) врача-дерматовенеролога первичный',NULL,1,NULL,0.05),('B01.015.001','Прием (осмотр, консультация) врача-кардиолога первичный',NULL,1,NULL,0.2),('B01.020.001','Прием (осмотр, консультация) врача по лечебной физкультуре',NULL,1,NULL,1),('B01.023.001','Прием (осмотр, консультация) врача-невролога первичный',NULL,1,NULL,0.3),('B01.028.001','Прием (осмотр, консультация) врача-оториноларинголога первичный',NULL,1,NULL,0.05),('B01.029.001','Прием (осмотр, консультация) врача-офтальмолога первичный',NULL,1,NULL,0.2),('B01.034.001','Прием (осмотр, консультация) врача-психотерапевта первичный',NULL,1,NULL,0.2),('B01.035.001','Прием (осмотр, консультация) врача-психиатра первичный',NULL,1,NULL,0.01),('B01.040.001','Прием (осмотр, консультация) врача-ревматолога первичный',NULL,1,NULL,1),('B01.040.002','Прием (осмотр, консультация) врача-ревматолога повторный',NULL,1,NULL,1),('B01.050.001','Прием (осмотр, консультация) врача-травматолога-ортопеда первичный',NULL,1,NULL,0.2),('B01.053.001','Прием (осмотр, консультация) врача-уролога первичный',NULL,1,NULL,0.3),('B01.055.001','Прием (осмотр, консультация) врача-фтизиатра первичный',NULL,1,NULL,0.1),('B01.064.001','Прием (осмотр, консультация) врача-стоматолога первичный',NULL,1,NULL,0.05),('B03.016.002','Общий (клинический) анализ крови',NULL,2,NULL,1),('B03.016.004','Анализ крови биохимический общетерапевтический',NULL,2,NULL,1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `idUnits` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `MKB_code` varchar(10) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`idUnits`,`MKB_code`),
  UNIQUE KEY `idUnits_UNIQUE` (`idUnits`),
  KEY `fk_Units_MKB1_idx` (`MKB_code`),
  CONSTRAINT `fk_Units_MKB1` FOREIGN KEY (`MKB_code`) REFERENCES `mkb` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Прием (осмотр, консультация) врача-специалиста','M45',1),(2,'Лабораторные методы исследования','M45',2),(3,'Инструментаьные методы исследования','M45',3);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'doctor','doctor');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19 18:33:53
