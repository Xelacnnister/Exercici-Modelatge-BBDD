-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: 6_cul_d'ampolla
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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `nom` char(45) NOT NULL,
  `adreça_postal` varchar(100) NOT NULL,
  `telèfon` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `data_registre` date NOT NULL,
  `recomanació_client` char(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_id_UNIQUE` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Alex Flores Peláez','A B C 1',666666666,'alex@mail.com','2020-09-23','Luís González Mérida'),(2,'Jordi Sabaté Cadenas','B C A 4',777777777,'jordi@mail.com','2020-07-29','Dídac Fortuny Domenech'),(3,'Dídac Fortuny Domenech','C A B 2',888888888,'didac@mail.com','2020-05-14','Luís González Mérida'),(4,'Luís González Mérida','D E F 1',999999999,'luis@mail.com','2020-03-09',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleat`
--

DROP TABLE IF EXISTS `empleat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleat` (
  `empleat_id` int NOT NULL AUTO_INCREMENT,
  `nom` char(45) NOT NULL,
  PRIMARY KEY (`empleat_id`),
  UNIQUE KEY `empleat_id_UNIQUE` (`empleat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleat`
--

LOCK TABLES `empleat` WRITE;
/*!40000 ALTER TABLE `empleat` DISABLE KEYS */;
INSERT INTO `empleat` VALUES (1,'Rick'),(2,'Morty'),(3,'Mr. Pickles');
/*!40000 ALTER TABLE `empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `marca_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `proveïdor_id` int NOT NULL,
  PRIMARY KEY (`marca_id`),
  UNIQUE KEY `marca_id_UNIQUE` (`marca_id`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  KEY `fk_marca_proveïdor_idx` (`proveïdor_id`),
  CONSTRAINT `fk_marca_proveïdor` FOREIGN KEY (`proveïdor_id`) REFERENCES `proveïdor` (`proveïdor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Raiban',1),(2,'Carrera',1),(3,'Polaroid',2),(4,'Lacoste',3);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveïdor`
--

DROP TABLE IF EXISTS `proveïdor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveïdor` (
  `proveïdor_id` int NOT NULL AUTO_INCREMENT,
  `nom` char(45) NOT NULL,
  `adreça_carrer` varchar(45) NOT NULL,
  `adreça_num` smallint NOT NULL,
  `adreça_pis` smallint NOT NULL,
  `adreça_porta` varchar(15) NOT NULL,
  `adreça_ciutat` char(20) NOT NULL,
  `adreça_codi_postal` varchar(10) NOT NULL,
  `país` char(20) NOT NULL,
  `telèfon` bigint NOT NULL,
  `nif` varchar(15) NOT NULL,
  `fax` varchar(45) NOT NULL,
  PRIMARY KEY (`proveïdor_id`),
  UNIQUE KEY `proveïdor_id_UNIQUE` (`proveïdor_id`),
  UNIQUE KEY `nom_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveïdor`
--

LOCK TABLES `proveïdor` WRITE;
/*!40000 ALTER TABLE `proveïdor` DISABLE KEYS */;
INSERT INTO `proveïdor` VALUES (1,'Gafas Kost','Carrer Roma',1,1,'1','Esparreguera','08292','Espanya',555555555,'G5555555','1234567890'),(2,'Gafas Mount','Avinguda València',99,3,'2','Barcelona','08001','Espanya',333333333,'G4444444','0987654321'),(3,'Gafas Sun','Tamesis Avenue',23,10,'9','Londres','E1W','Regne Unit',44222222222,'G2222222','2143658709');
/*!40000 ALTER TABLE `proveïdor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `ulleres_id` int NOT NULL AUTO_INCREMENT,
  `graduació_d` decimal(4,2) NOT NULL,
  `graduació_e` decimal(4,2) NOT NULL,
  `montura_flotant` enum('si','no') NOT NULL,
  `montura_pasta` enum('si','no') NOT NULL,
  `montura_metàl·lica` enum('si','no') NOT NULL,
  `color_montura` varchar(15) NOT NULL,
  `color_vidre_d` varchar(15) NOT NULL,
  `color_vidre_e` varchar(15) NOT NULL,
  `preu` decimal(6,2) NOT NULL,
  `nom_marca` varchar(45) NOT NULL,
  `marca_marca_id` int NOT NULL,
  `empleat_empleat_id` int NOT NULL,
  PRIMARY KEY (`ulleres_id`),
  UNIQUE KEY `ulleres_id_UNIQUE` (`ulleres_id`),
  KEY `fk_ulleres_marca1_idx` (`marca_marca_id`),
  KEY `fk_ulleres_empleat1_idx` (`empleat_empleat_id`),
  CONSTRAINT `fk_ulleres_empleat1` FOREIGN KEY (`empleat_empleat_id`) REFERENCES `empleat` (`empleat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_marca1` FOREIGN KEY (`marca_marca_id`) REFERENCES `marca` (`marca_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,2.50,2.20,'si','no','no','blau','transparent','transparent',200.89,'Raiban',1,1),(2,1.20,1.40,'no','no','si','daurat','marró','marró',299.99,'Polaroid',3,1),(3,2.00,1.90,'no','si','no','negre','negre','negre',249.99,'Carrera',2,2),(4,2.30,2.40,'no','si','no','verd','transparent','transparent',150.00,'Lacoste',4,3);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `ulleres_id` int NOT NULL,
  `client_id` int NOT NULL,
  `empleat_empleat_id` int NOT NULL,
  PRIMARY KEY (`ulleres_id`,`client_id`),
  KEY `fk_ulleres_has_client_client1_idx` (`client_id`),
  KEY `fk_ulleres_has_client_ulleres1_idx` (`ulleres_id`),
  KEY `fk_venda_empleat1_idx` (`empleat_empleat_id`),
  CONSTRAINT `fk_ulleres_has_client_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_has_client_ulleres1` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`ulleres_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_empleat1` FOREIGN KEY (`empleat_empleat_id`) REFERENCES `empleat` (`empleat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,2,1),(2,1,1),(3,4,2),(4,3,3);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-01 13:37:46
