-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: horsestable
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ContactInfo` varchar(255) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `WorkSchedule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Alice Johnson','alice@example.com','Manager','9 AM - 5 PM'),(2,'Bob Brown','bob@example.com','Veterinarian','10 AM - 6 PM');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `EquipmentID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Value` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`EquipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Saddle',150.00,5),(2,'Bridle',75.00,10),(3,'Horse Feed',50.00,20);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horse` (
  `HorseID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `HealthStatus` varchar(100) DEFAULT NULL,
  `StallNumber` int DEFAULT NULL,
  `OwnerID` int DEFAULT NULL,
  `TrainingSchedule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HorseID`),
  KEY `OwnerID` (`OwnerID`),
  CONSTRAINT `horse_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `owner` (`OwnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse`
--

LOCK TABLES `horse` WRITE;
/*!40000 ALTER TABLE `horse` DISABLE KEYS */;
INSERT INTO `horse` VALUES (1,'Thunder',5,'Healthy',1,1,'Mon-Wed-Fri'),(2,'Blaze',4,'Minor Injury',2,2,'Tue-Thu-Sat');
/*!40000 ALTER TABLE `horse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `OwnerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `ContactInfo` varchar(255) NOT NULL,
  `AccountCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'John Doe','john@example.com','2024-09-25 10:02:29'),(2,'Jane Smith','jane@example.com','2024-09-25 10:02:29');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccess`
--

DROP TABLE IF EXISTS `useraccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraccess` (
  `AccessID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `Role` varchar(50) NOT NULL,
  `Permissions` text,
  PRIMARY KEY (`AccessID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `useraccess_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccess`
--

LOCK TABLES `useraccess` WRITE;
/*!40000 ALTER TABLE `useraccess` DISABLE KEYS */;
INSERT INTO `useraccess` VALUES (1,1,'Manager','All Access'),(2,2,'Veterinarian','View Veterinary Records');
/*!40000 ALTER TABLE `useraccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinaryprocedure`
--

DROP TABLE IF EXISTS `veterinaryprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinaryprocedure` (
  `ProcedureID` int NOT NULL AUTO_INCREMENT,
  `HorseID` int DEFAULT NULL,
  `ProcedureType` varchar(100) NOT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Notes` text,
  PRIMARY KEY (`ProcedureID`),
  KEY `HorseID` (`HorseID`),
  CONSTRAINT `veterinaryprocedure_ibfk_1` FOREIGN KEY (`HorseID`) REFERENCES `horse` (`HorseID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinaryprocedure`
--

LOCK TABLES `veterinaryprocedure` WRITE;
/*!40000 ALTER TABLE `veterinaryprocedure` DISABLE KEYS */;
INSERT INTO `veterinaryprocedure` VALUES (1,1,'Vaccination','2024-09-01 10:00:00','Flu vaccine'),(2,2,'Checkup','2024-09-15 11:00:00','Minor injury check');
/*!40000 ALTER TABLE `veterinaryprocedure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-25 10:04:35
