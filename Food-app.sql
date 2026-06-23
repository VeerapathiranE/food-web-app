CREATE DATABASE  IF NOT EXISTS `foodapplication` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `foodapplication`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: foodapplication
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f00ece31-f5ca-11f0-a7a6-e89c251cd093:1-377';

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `description` text,
  `price` double DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Butter Chicken','Creamy chicken curry',250,1,'images/butterchicken.jpg'),(2,1,'Paneer Tikka','Grilled paneer cubes',180,1,'images/paneertikka.jpg'),(3,1,'Chicken Biryani','Spicy biryani rice',220,1,'images/biryani.jpg'),(4,2,'Sushi Roll','Fresh salmon sushi',300,1,'images/sushi.jpg'),(5,2,'Ramen','Japanese noodle soup',240,1,'images/ramen.jpg'),(6,5,'Vegan Salad','Healthy salad bowl',160,1,'images/salad.jpg'),(7,5,'Smoothie Bowl','Fruit smoothie',140,1,'images/smoothie.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,4,5,1,240),(2,5,4,1,300),(3,5,5,1,240),(4,6,4,1,300),(5,7,2,1,180),(6,7,5,1,240),(7,8,5,1,240),(8,9,1,3,750),(9,9,3,1,220),(10,10,1,2,500),(11,10,3,1,220),(12,11,1,2,500),(13,11,2,2,360),(14,12,4,4,1200),(15,12,5,8,1920),(16,13,4,5,1500),(17,14,1,2,500),(18,14,2,1,180);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` double DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `payment_mode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,17,2,'2026-03-31 18:52:50',1020,'pending',NULL),(2,17,2,'2026-04-01 07:57:16',490,'pending',NULL),(3,17,2,'2026-04-01 18:54:50',480,'pending',NULL),(4,17,2,'2026-04-01 18:55:43',240,'pending',NULL),(5,22,2,'2026-04-14 16:23:58',540,'pending',NULL),(6,22,2,'2026-04-14 16:24:33',300,'pending',NULL),(7,22,2,'2026-04-14 16:34:30',420,'pending',NULL),(8,22,2,'2026-04-14 16:37:40',240,'pending',NULL),(9,22,1,'2026-04-14 18:10:09',970,'pending',NULL),(10,22,1,'2026-04-14 18:14:17',720,'pending',NULL),(11,23,1,'2026-06-06 04:46:50',860,'pending',NULL),(12,23,2,'2026-06-06 04:50:00',3120,'pending',NULL),(13,23,2,'2026-06-06 04:57:40',1500,'pending',NULL),(14,24,1,'2026-06-16 15:49:33',680,'pending',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `cuisine_type` varchar(100) DEFAULT NULL,
  `delivery_time` int DEFAULT NULL,
  `address` text,
  `admin_user_id` int DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'The Spice Hub','Indian',30,'123 Main Street, City',NULL,4.5,1,'images/spicehub.jpg'),(2,'Sushi World','Japanese',45,'456 Elm Street, City',NULL,4.7,1,'images/sushiworld.jpg'),(3,'Pizza Palace','Italian',25,'789 Oak Avenue, City',NULL,4.2,1,'images/pizzapalace.jpg'),(4,'Burger Barn','Fast Food',20,'321 Pine Road, City',NULL,4,1,'images/burgerbarn.png'),(5,'Green Delight','Vegan',35,'654 Maple Lane, City',NULL,4.8,1,'images/greendelight.jpg'),(6,'Biryani House','Indian',30,'MG Road, Bangalore',NULL,4.6,1,'images/biryanihouse.jpg'),(7,'Tandoori Treats','North Indian',40,'Indiranagar, Bangalore',NULL,4.4,1,'images/tandoori.jpg'),(8,'Dragon Wok','Chinese',35,'Whitefield, Bangalore',NULL,4.5,1,'images/dragonwok.jpg');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text,
  `role` varchar(20) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (17,'AdminOps','$2a$10$uQFvJHiFfBtlA2xP.aWC0ePgc0umVEx7k4LJKhLGy7.2pULkocifG','admin@foodapp.com','9000000001','MG Road, Bangalore','customer','2026-03-20 19:18:20','2026-04-01 18:55:36'),(18,'Manoj','1234',NULL,NULL,NULL,NULL,'2026-04-04 07:29:28',NULL),(19,'VeeraSabari','1234',NULL,NULL,NULL,NULL,'2026-04-04 07:38:36',NULL),(20,'Manoj','12345',NULL,NULL,NULL,NULL,'2026-04-04 07:40:06',NULL),(21,'veera','1234',NULL,NULL,NULL,NULL,'2026-04-04 07:43:52',NULL),(22,'Siva','$2a$10$qQTpPuWkTN/ppxLxOQIn4.igHay4hFnhV3Xm7/kIGv1HCAVInOeR.','siva@gmail.com','6952486573','HSR Layout, Bangalore','customer','2026-04-14 16:23:13','2026-04-14 18:13:22'),(23,'demo','$2a$10$p6wH08I1hDLm1raK1smSReIEwbfzbewjGVDu.zoW8nTbzPpuCUBJ6','demo@gmail.com','6374754473','12 MG Road, Bangalore','customer','2026-06-06 04:46:09','2026-06-06 04:48:27'),(24,'Ken','$2a$10$VBLURkLI3TxiioMuDUgCXeu2as9wLVruK5sR6YfHLVEvXuRVJbGmW','ken@gmail.com','6548754896','2nd Stage BTM, Bangalore ','customer','2026-06-16 15:41:40','2026-06-16 15:47:52');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23 18:57:54
