-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: consultorio_dental
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `cat_estado`
--

DROP TABLE IF EXISTS `cat_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_estado`
--

LOCK TABLES `cat_estado` WRITE;
/*!40000 ALTER TABLE `cat_estado` DISABLE KEYS */;
INSERT INTO `cat_estado` VALUES (1,' Baja California',1),(2,' Baja California Sur',1),(3,' Campeche',1),(4,' Chiapas',1),(5,' Chihuahua',1),(6,' Ciudad de México',1),(7,' Coahuila de Zaragoza',1),(8,' Colima',1),(9,' Durango',1),(10,' Estado de México',1),(11,' Guanajuato',1),(12,' Guerrero',1),(13,' Hidalgo',1),(14,' Jalisco',1),(15,' Michoacán de Ocampo',1),(16,' Morelos',1),(17,' Nayarit',1),(18,' Nuevo León',1),(19,' Oaxaca',1),(20,' Puebla',1),(21,' Querétaro',1),(22,' Quintana Roo',1),(23,' San Luis Potosí',1),(24,'Aguascalientes',1),(25,' Sinaloa',1),(26,' Sonora',1),(27,' Tabasco',1),(28,' Tamaulipas',1),(29,' Tlaxcala',1),(30,' Veracruz de Ignacio de la Llave',1),(31,' Yucatán',1),(32,' Zacatecas',1);
/*!40000 ALTER TABLE `cat_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_pais`
--

DROP TABLE IF EXISTS `cat_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_pais`
--

LOCK TABLES `cat_pais` WRITE;
/*!40000 ALTER TABLE `cat_pais` DISABLE KEYS */;
INSERT INTO `cat_pais` VALUES (1,'México',1);
/*!40000 ALTER TABLE `cat_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_roles`
--

DROP TABLE IF EXISTS `cat_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_roles`
--

LOCK TABLES `cat_roles` WRITE;
/*!40000 ALTER TABLE `cat_roles` DISABLE KEYS */;
INSERT INTO `cat_roles` VALUES (1,'Administrador',1),(2,'Doctor',1),(3,'Paciente',1);
/*!40000 ALTER TABLE `cat_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_contacto`
--

DROP TABLE IF EXISTS `data_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_contacto` (
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `telefono_movil` varchar(15) DEFAULT NULL,
  `telefono_fijo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_contacto`
--

LOCK TABLES `data_contacto` WRITE;
/*!40000 ALTER TABLE `data_contacto` DISABLE KEYS */;
INSERT INTO `data_contacto` VALUES (1,'islas_erik@live.com.mx','5514732084',NULL);
/*!40000 ALTER TABLE `data_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_direccion`
--

DROP TABLE IF EXISTS `data_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `no_interior` varchar(5) DEFAULT NULL,
  `no_exterior` varchar(5) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `id_estado` (`estado`),
  KEY `id_pais` (`pais`),
  CONSTRAINT `id_estado` FOREIGN KEY (`estado`) REFERENCES `cat_estado` (`id_estado`),
  CONSTRAINT `id_pais` FOREIGN KEY (`pais`) REFERENCES `cat_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_direccion`
--

LOCK TABLES `data_direccion` WRITE;
/*!40000 ALTER TABLE `data_direccion` DISABLE KEYS */;
INSERT INTO `data_direccion` VALUES (1,'CDA. Prolongación Zarco','Abdias García Soto','05530','S/N','11','Cuajimalpa',6,1);
/*!40000 ALTER TABLE `data_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_persona`
--

DROP TABLE IF EXISTS `data_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apelido_materno` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` int(11) DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `datos_contacto` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_persona`),
  KEY `id_direccion` (`direccion`),
  KEY `id_contacto` (`datos_contacto`),
  CONSTRAINT `id_contacto` FOREIGN KEY (`datos_contacto`) REFERENCES `data_contacto` (`id_contacto`),
  CONSTRAINT `id_direccion` FOREIGN KEY (`direccion`) REFERENCES `data_direccion` (`id_direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_persona`
--

LOCK TABLES `data_persona` WRITE;
/*!40000 ALTER TABLE `data_persona` DISABLE KEYS */;
INSERT INTO `data_persona` VALUES (1,'Erik','Islas','Alvarez','1994-08-29',1,NULL,1,1);
/*!40000 ALTER TABLE `data_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_usuario`
--

DROP TABLE IF EXISTS `data_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` int(11) NOT NULL DEFAULT '3',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  KEY `id_persona` (`id_persona`),
  KEY `id_rol` (`rol`),
  CONSTRAINT `id_persona` FOREIGN KEY (`id_persona`) REFERENCES `data_persona` (`id_persona`),
  CONSTRAINT `id_rol` FOREIGN KEY (`rol`) REFERENCES `cat_roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_usuario`
--

LOCK TABLES `data_usuario` WRITE;
/*!40000 ALTER TABLE `data_usuario` DISABLE KEYS */;
INSERT INTO `data_usuario` VALUES (1,1,'admin','root',1,1);
/*!40000 ALTER TABLE `data_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-20 17:41:17
