-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: workaway
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `attivita`
--

DROP TABLE IF EXISTS `attivita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attivita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `oreTot` int DEFAULT NULL,
  `id_viaggi` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_viaggi` (`id_viaggi`),
  CONSTRAINT `attivita_ibfk_1` FOREIGN KEY (`id_viaggi`) REFERENCES `viaggi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attivita`
--

LOCK TABLES `attivita` WRITE;
/*!40000 ALTER TABLE `attivita` DISABLE KEYS */;
INSERT INTO `attivita` VALUES (1,'Trekking','Ricreativa',10,19),(2,'Surf','Ricreativa',12,19),(3,'Kayak','Ricreativa',6,19),(4,'Castello di Rosenborg','Ricreativa',6,20),(5,'Quartieri Nyhavn','Ricreativa',16,20),(6,'Appartamenti Imperiali','Ricreativa',8,18),(7,'Musica Classica','Ricreativa',6,18),(8,'Laghi Plitvice','Ricreativa',8,17),(9,'Tour Guerra D\'Indipendenza','Ricreativa',10,17),(10,'Tour Fori Romani','Ricreativa',8,4),(11,'Tour Musei Vaticani','Ricreativa',8,4),(12,'Tour Transilvania','Ricreativa',18,5),(13,'Gita sul Danubio','Ricreativa',8,5),(14,'Kit','Ricreativa',10,1),(15,'Diving','Ricreativa',12,1),(16,'Trekking nel Deserto','Ricreativa',8,1),(17,'Visita Sagrada Familia','Ricreativa',8,7),(18,'Yoga in Spiaggia','Ricreativa',12,7),(19,'Tour Culinario','Ricreativa',6,2),(20,'Visita a Panarea','Ricreativa',8,2),(21,'Visita Parchi Reali','Ricreativa',8,8),(22,'Visita Tower of London','Ricreativa',8,8),(23,'Visita Jungle Island','Ricreativa',8,9),(24,'Tour Florida Keys','Ricreativa',10,9),(25,'Parco Ses Salines','Ricreativa',6,3),(26,'Snorkeling','Ricreativa',10,3),(27,'Tempio di Meiji Shinto','Ricreativa',8,16),(28,'Visita Ginza','Ricreativa',6,16),(29,'Crociera Sprea','Ricreativa',15,15),(30,'Palazzo del Reichstag','Ricreativa',7,15),(31,'Tour Palazzo Reale','Ricreativa',8,6),(32,'Museo del Prado','Ricreativa',6,6),(33,'Visita a Grotta Azzurra','Ricreativa',8,13),(34,'Gita Templi di Ggantija','Ricreativa',8,13),(35,'Visita Parlamento','Ricreativa',6,10),(36,'Bagni Széchenyi','Ricreativa',10,10),(37,'Quartiere di Belém','Ricreativa',12,14),(38,'Monastero dos Jerónimos','Ricreativa',8,14),(39,'Quartiere Santa Cruz','Ricreativa',8,12),(40,'Visita Palazzi Reali','Ricreativa',6,12),(41,'Visita Museo Van Gogh','Ricreativa',6,11),(42,'Crocera Serale','Ricreativa',5,11),(43,'Corso Python','Formativa',5,1),(44,'Corso Java','Formativa',5,2),(45,'English Business','Formativa',5,3),(46,'Corso Scrum','Formativa',5,4),(47,'Corso Agile','Formativa',5,5),(48,'Corso Soft SKills','Formativa',5,6),(49,'Corso Base Inglese','Formativa',5,7),(50,'Corso base php','Formativa',5,8),(51,'Corso Analisi Dati','Formativa',5,9),(52,'Digital Marketing','Formativa',5,10),(53,'Corso Machine Learning','Formativa',5,11),(54,'Corso Analisi dati','Formativa',5,12),(55,'Corso Management','Formativa',5,13),(56,'Corso Java','Formativa',5,14),(57,'Corso Python','Formativa',5,15),(58,'English Business','Formativa',5,16),(59,'Corso Scrum','Formativa',5,17),(60,'Corso Soft Skills','Formativa',5,18),(61,'Corso Inglese Avanzato','Formativa',5,19),(62,'Corso Java','Formativa',5,20);
/*!40000 ALTER TABLE `attivita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr`
--

DROP TABLE IF EXISTS `hr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hr` (
  `id` int NOT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `azienda` varchar(30) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `cognome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `hr_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr`
--

LOCK TABLES `hr` WRITE;
/*!40000 ALTER TABLE `hr` DISABLE KEYS */;
INSERT INTO `hr` VALUES (2,'pizza@libero.it','3407653219','Attanasio','Grace','Di Falco'),(4,'calzoni@libero.it','3256789012','Mutti','Vincenzo','Di Razza'),(5,'prova@libero.it','3252769014','DeG','Fabio','De Luca'),(7,'test@libero.it','3293769533','Accenture','Davide','Rossi'),(8,'team@libero.it','3888577038','Ferrari','Alessia','Russo'),(10,'fabio@gmail.com','3334445556','Legacy','Fabio','De Luca'),(11,'gabriele@gmail.com','5556664447','Losil','Gabriele','Albanese'),(12,'costanza.s@gmail.com','3509084916','Generation','Costanza','Sciaccaluga'),(13,'jotarokujo@gmail.com','3497766611','Ferrero','Giorsano','Orlacchio'),(14,'filippofi@gmail.com','3334475556','Azienda1','Filippo','Rosselli');
/*!40000 ALTER TABLE `hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazioni`
--

DROP TABLE IF EXISTS `prenotazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nDipendenti` int DEFAULT NULL,
  `nCamere` int DEFAULT NULL,
  `codice_prenotazione` varchar(10) DEFAULT NULL,
  `id_hr` int DEFAULT NULL,
  `id_viaggi` int DEFAULT NULL,
  `data_prenotazione` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_hr` (`id_hr`),
  KEY `id_viaggi` (`id_viaggi`),
  CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`id_hr`) REFERENCES `hr` (`id`),
  CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`id_viaggi`) REFERENCES `viaggi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazioni`
--

LOCK TABLES `prenotazioni` WRITE;
/*!40000 ALTER TABLE `prenotazioni` DISABLE KEYS */;
INSERT INTO `prenotazioni` VALUES (3,10,5,'HB182IVA00',2,2,'2023-03-17'),(4,20,10,'HBA4CAPG00',2,4,'2023-08-27'),(5,13,13,'HTTP3657',5,5,'2023-03-27'),(6,7,3,'HTTP3657',7,6,'2023-03-27'),(7,5,2,'HTTP3657',8,7,'2023-03-27'),(8,5,5,'HTTP3657',8,8,'2023-03-27'),(15,15,15,'NSGI6EUU',4,3,'2023-03-31'),(17,3,3,'Z5Z9PLMB',13,2,'2023-03-31'),(18,3,3,'I64DL6C4',13,6,'2023-03-31'),(19,1,1,'FUFRUAGB',4,4,'2023-04-01'),(20,1,1,'H5TZE9H8',4,1,'2023-04-01'),(21,1,1,'MHFLAGUS',4,3,'2023-04-01');
/*!40000 ALTER TABLE `prenotazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `ruolo` varchar(30) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'Antonio','Antonio1','Admin',1),(2,'Grace','Grace1','Utente',0),(3,'Mario','Mario1','Admin',1),(4,'Utente1','Utente1','Utente',1),(5,'Fabio','Fabio1','Utente',1),(6,'Webmaster','Webmaster1','Webmaster',1),(7,'Davide','Davide1','Utente',0),(8,'Alessia','Alessia1','Utente',0),(9,'Admin','Admin1','Admin',0),(10,'Fabietto','Fabietto1','Utente',1),(11,'Gabrielino','Gabriele1','Utente',1),(12,'Costanza.s','Costanza.s9','Utente',1),(13,'DioBrando','Draven97','Utente',1),(14,'Filippino','Filippo12','Utente',0);
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaggi`
--

DROP TABLE IF EXISTS `viaggi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaggi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(50) DEFAULT NULL,
  `data_viaggio` date DEFAULT NULL,
  `partenza` varchar(30) DEFAULT NULL,
  `destinazione` varchar(30) DEFAULT NULL,
  `tariffa` double DEFAULT NULL,
  `tipo_pernottamento` varchar(30) DEFAULT NULL,
  `disponibili` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaggi`
--

LOCK TABLES `viaggi` WRITE;
/*!40000 ALTER TABLE `viaggi` DISABLE KEYS */;
INSERT INTO `viaggi` VALUES (1,'dubai.jpg','2023-12-12','Firenze','Dubai',120.5,'full board',29),(2,'palermo.jpg','2023-07-24','Bari','Palermo',250.99,'full board',0),(3,'ibiza.jpg','2023-09-09','Bologna','Ibiza',130,'half board',0),(4,'roma.jpg','2023-08-10','Firenze','Roma',150,'full board',79),(5,'bucarest.jpg','2023-04-18','Napoli','Bucarest',100,'half board',12),(6,'madrid.jpg','2023-12-15','Milano','Madrid',89,'half board',1),(7,'barcellona.jpg','2023-02-22','Roma','Barcellona',70,'full board',13),(8,'londra.jpg','2023-06-12','Pisa','Londra',250,'full board',62),(9,'miami.jpg','2023-01-15','Roma','Miami',900,'half board',14),(10,'budapest.jpg','2023-03-17','Firenze','Budapest',170,'half board',1),(11,'amsterdam.jpg','2023-03-17','Cagliari','Amsterdam',80,'full board',22),(12,'siviglia.jpg','2023-03-17','Palermo','Siviglia',160,'full board',9),(13,'malta.jpg','2023-11-18','Roma','Malta',74,'half board',44),(14,'lisbona.jpg','2023-07-11','Genova','Lisbona',55,'half board',10),(15,'berlino.jpg','2023-11-18','Napoli','Berlino',220,'full board',34),(16,'tokyo.jpg','2023-08-27','Roma','Tokyo',1200,'full board',16),(17,'zagabria.jpg','2023-07-12','Venezia','Zagabria',150,'half board',4),(18,'vienna.jpg','2023-02-10','Roma','Vienna',70,'half board',3),(19,'Ten1.jpg','2023-04-16','Bologna','Tenerife',50,'half board',6),(20,'Copen.jpg','2023-07-23','Roma','Copenaghen',30,'full board',12);
/*!40000 ALTER TABLE `viaggi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-03 10:50:21
