-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: ProyectoGestionBDDu1
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Asistencia`
--

DROP TABLE IF EXISTS `Asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Asistencia` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `horario` varchar(50) DEFAULT NULL,
  `id_niño` int NOT NULL,
  `id_aula` int NOT NULL,
  `id_sacramento` int NOT NULL,
  `id_catequista` int NOT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_catequista` (`id_catequista`),
  KEY `id_sacramento` (`id_sacramento`),
  KEY `id_aula` (`id_aula`),
  KEY `id_niño` (`id_niño`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_catequista`) REFERENCES `Catequista` (`id_catequista`),
  CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`id_sacramento`) REFERENCES `Sacramento` (`id_sacramento`),
  CONSTRAINT `asistencia_ibfk_3` FOREIGN KEY (`id_aula`) REFERENCES `Aula` (`id_aula`),
  CONSTRAINT `asistencia_ibfk_4` FOREIGN KEY (`id_niño`) REFERENCES `Niño` (`id_niño`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asistencia`
--

LOCK TABLES `Asistencia` WRITE;
/*!40000 ALTER TABLE `Asistencia` DISABLE KEYS */;
INSERT INTO `Asistencia` VALUES (1,'Viernes 4:00 PM',1,1,1,1),(2,'Sábado 2:00 PM',2,2,2,2),(3,'Sábado 10:00 AM',3,3,3,3);
/*!40000 ALTER TABLE `Asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aula`
--

DROP TABLE IF EXISTS `Aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aula` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `nombre_aula` varchar(255) NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id_aula`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aula`
--

LOCK TABLES `Aula` WRITE;
/*!40000 ALTER TABLE `Aula` DISABLE KEYS */;
INSERT INTO `Aula` VALUES (1,'Salón 101',30),(2,'Salón 202',25),(3,'Salón 303',20),(4,'Salón 404',35),(5,'salon 2',22),(6,'salon 2',22);
/*!40000 ALTER TABLE `Aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Catequista`
--

DROP TABLE IF EXISTS `Catequista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Catequista` (
  `id_catequista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `id_iglesia` int NOT NULL,
  PRIMARY KEY (`id_catequista`),
  KEY `id_iglesia` (`id_iglesia`),
  CONSTRAINT `catequista_ibfk_1` FOREIGN KEY (`id_iglesia`) REFERENCES `Iglesia` (`id_iglesia`),
  CONSTRAINT `catequista_chk_1` CHECK (regexp_like(`telefono`,_utf8mb4'^[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Catequista`
--

LOCK TABLES `Catequista` WRITE;
/*!40000 ALTER TABLE `Catequista` DISABLE KEYS */;
INSERT INTO `Catequista` VALUES (1,'Carlos','Ruiz','0986965077',1),(2,'Laura','Fernández','0987254352',2),(3,'Pedro','Díaz','0990290806',3),(4,'Isabel','Sánchez','0990565877',4),(5,'Dayana','Vergara','0962759035',1);
/*!40000 ALTER TABLE `Catequista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Iglesia`
--

DROP TABLE IF EXISTS `Iglesia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Iglesia` (
  `id_iglesia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  PRIMARY KEY (`id_iglesia`),
  CONSTRAINT `iglesia_chk_1` CHECK (regexp_like(`telefono`,_utf8mb4'^[0-9]{10}$')),
  CONSTRAINT `iglesia_chk_2` CHECK (((`correo_electronico` like _utf8mb4'%@%') and (locate(_utf8mb4'.',substring_index(`correo_electronico`,_utf8mb4'@',-(1))) > 0)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Iglesia`
--

LOCK TABLES `Iglesia` WRITE;
/*!40000 ALTER TABLE `Iglesia` DISABLE KEYS */;
INSERT INTO `Iglesia` VALUES (1,'Parroquia San Juan','Calle Principal 123','0969760425','info@parroquiasanjuan.com'),(2,'Iglesia Santa María','Avenida Central 456','0987654321','contacto@santamariaiglesia.org'),(3,'Capilla San José','Plaza Secundaria 789','0959113863','capillasanjose@hotmail.com'),(4,'Parroquia de la Resurrección','Calle Resurrección 321','0963976235','resurreccionparroquia@gmail.com');
/*!40000 ALTER TABLE `Iglesia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Niño`
--

DROP TABLE IF EXISTS `Niño`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Niño` (
  `id_niño` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `edad` int NOT NULL,
  `telefonopadres` varchar(10) NOT NULL,
  PRIMARY KEY (`id_niño`),
  CONSTRAINT `niño_chk_1` CHECK ((`edad` > 0)),
  CONSTRAINT `niño_chk_2` CHECK (regexp_like(`telefonopadres`,_utf8mb4'^[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Niño`
--

LOCK TABLES `Niño` WRITE;
/*!40000 ALTER TABLE `Niño` DISABLE KEYS */;
INSERT INTO `Niño` VALUES (1,'Luis','García',12,'0962759035'),(2,'Ana','Rodríguez',9,'0999152929'),(3,'Juan','Fernández',7,'0963143032');
/*!40000 ALTER TABLE `Niño` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Padre`
--

DROP TABLE IF EXISTS `Padre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Padre` (
  `id_padre` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `id_iglesia` int NOT NULL,
  PRIMARY KEY (`id_padre`),
  KEY `id_iglesia` (`id_iglesia`),
  CONSTRAINT `padre_ibfk_1` FOREIGN KEY (`id_iglesia`) REFERENCES `Iglesia` (`id_iglesia`),
  CONSTRAINT `padre_chk_1` CHECK (regexp_like(`telefono`,_utf8mb4'^[0-9]{10}$'))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Padre`
--

LOCK TABLES `Padre` WRITE;
/*!40000 ALTER TABLE `Padre` DISABLE KEYS */;
INSERT INTO `Padre` VALUES (1,'Juan','Pérez','0962034822','juan.perez@parroquiasanjuan.com',1),(2,'María','Gómez','0983254321','maria.gomez@santamariaiglesia.es',2),(3,'José','López','0985663654','jose.lopez@hotmail.com',3),(4,'Ana','Martínez','0985862034','ana.martinez@gmail.com',4);
/*!40000 ALTER TABLE `Padre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sacramento`
--

DROP TABLE IF EXISTS `Sacramento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sacramento` (
  `id_sacramento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_sacramento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sacramento`
--

LOCK TABLES `Sacramento` WRITE;
/*!40000 ALTER TABLE `Sacramento` DISABLE KEYS */;
INSERT INTO `Sacramento` VALUES (1,'Año bíblico','Ceremonia de año bíblico'),(2,'Comunión','Ceremonia de comunión'),(3,'Confirmación','Confirmación de la fe');
/*!40000 ALTER TABLE `Sacramento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_catequista`
--

DROP TABLE IF EXISTS `vista_catequista`;
/*!50001 DROP VIEW IF EXISTS `vista_catequista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_catequista` AS SELECT 
 1 AS `id_catequista`,
 1 AS `nombre_catequista`,
 1 AS `apellido`,
 1 AS `telefono`,
 1 AS `id_iglesia`,
 1 AS `nombre_iglesia`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_catequista`
--

/*!50001 DROP VIEW IF EXISTS `vista_catequista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_catequista` AS select `C`.`id_catequista` AS `id_catequista`,`C`.`nombre` AS `nombre_catequista`,`C`.`apellido` AS `apellido`,`C`.`telefono` AS `telefono`,`C`.`id_iglesia` AS `id_iglesia`,`I`.`nombre` AS `nombre_iglesia` from (`catequista` `C` join `iglesia` `I` on((`C`.`id_iglesia` = `I`.`id_iglesia`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-09 13:24:59
