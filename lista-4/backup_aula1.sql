-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: aula1
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `ALUNOS`
--

DROP TABLE IF EXISTS `ALUNOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALUNOS` (
  `id_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALUNOS`
--

LOCK TABLES `ALUNOS` WRITE;
/*!40000 ALTER TABLE `ALUNOS` DISABLE KEYS */;
INSERT INTO `ALUNOS` VALUES (1,'Gustavo Borges');
/*!40000 ALTER TABLE `ALUNOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURSOS`
--

DROP TABLE IF EXISTS `CURSOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CURSOS` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vagas` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSOS`
--

LOCK TABLES `CURSOS` WRITE;
/*!40000 ALTER TABLE `CURSOS` DISABLE KEYS */;
INSERT INTO `CURSOS` VALUES (1,'Banco de Dados II',1);
/*!40000 ALTER TABLE `CURSOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATRICULAS`
--

DROP TABLE IF EXISTS `MATRICULAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATRICULAS` (
  `id_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `semestre` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disciplina` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `fk_al_mat` (`id_aluno`),
  KEY `fk_cur_mat` (`id_curso`),
  CONSTRAINT `fk_al_mat` FOREIGN KEY (`id_aluno`) REFERENCES `ALUNOS` (`id_aluno`),
  CONSTRAINT `fk_cur_mat` FOREIGN KEY (`id_curso`) REFERENCES `CURSOS` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATRICULAS`
--

LOCK TABLES `MATRICULAS` WRITE;
/*!40000 ALTER TABLE `MATRICULAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATRICULAS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-13 10:20:24
