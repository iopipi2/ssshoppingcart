-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingcart
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_date` timestamp NULL DEFAULT NULL,
  `price_total` mediumint DEFAULT NULL,
  `buyer_id` int DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `pay` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_user_idx` (`buyer_id`),
  CONSTRAINT `fk_bill_user` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_line`
--

DROP TABLE IF EXISTS `cart_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product` (`product_id`),
  KEY `fk_cart_bill_idx` (`cart_id`),
  CONSTRAINT `fk_cart_cartline` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_line`
--

LOCK TABLES `cart_line` WRITE;
/*!40000 ALTER TABLE `cart_line` DISABLE KEYS */;
INSERT INTO `cart_line` VALUES (7,20,1,2),(8,21,1,2),(9,42,1,2),(10,20,NULL,2),(11,20,NULL,2),(12,20,NULL,2),(13,20,NULL,2),(14,20,NULL,2);
/*!40000 ALTER TABLE `cart_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_cate` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `active` tinyint NOT NULL,
  PRIMARY KEY (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Women',1),(2,'Men',1),(3,'Bag',1),(4,'Shoes',1),(5,'Watches',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin NOT NULL,
  `price` bigint NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `categories_id` int DEFAULT NULL,
  `img_main` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `img_hover` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `img_sub` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pro_cate_idx` (`categories_id`),
  CONSTRAINT `fk_pro_cate` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id_cate`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'??o T-Shirt Oversize',20,'<div><ul><li>Ch???t li???u: Cotton 230 GSM</li><li> S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao</li><li> ????? b???n cao, l???n tr??i ??o khi gi???t</li><ul></div>',2,'product1.2.jpg','product1.1.jpg','product1.3.jpg',1),(2,'??o T-Shirt Blood Diamond',40,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'blooddiamond2.jpg','blooddiamond1.jpg','blooddiamond3.jpg',1),(3,'??o T-Shirt Basic Over',120,'Ch???t li???u 100% cotton, s??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, kh??ng b??? bong tr??c khi gi???t',2,'basicover1.jpg','basicover2.jpg','basicover3.jpg',1),(4,'??o T-Shirt Racing',120,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'racing1.jpg','racing2.jpg','racing3.jpg',1),(5,'??o T-Shirt Teddie',120,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'teddie1.jpg','teddie2.jpg','teddie3.jpg',1),(6,'??o T-Shirt King of School ',120,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'KingofSchool1.jpg','kingofschool2.jpg','kingofschool3.jpg',1),(7,'??o T-Shirt Skull ',100,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'skull1.jpg','skull2.jpg','skull3.jpg',1),(8,'??o T-Shirt Agent',100,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'agent1.jpg','agent2.jpg','agent3.jpg',1),(9,'??o T-Shirt Waster',100,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'8.1.jpg','8.2.jpg','8.3.jpg',1),(10,'??o T-Shirt Skull ',100,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'10-1.jpg','10-2.jpg','10-3.jpg',1),(11,'??o T-Shirt Skull ',100,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',2,'skull1.jpg','skull2.jpg','skull3.jpg',1),(14,'??o T-Shirt Basic',35,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',1,'product-01.jpg','product-012.jpg','product-013.jpg',1),(15,'??o T-Shirt Slevee',35,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',1,'product-161.jpg','product-162.jpg','product-163.jpg',1),(16,'??o T-Shirt Black',35,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',1,'chi-ghi-trc.jpg','chi-ghi-sau.jpg','chi-trang-sau.jpg',1),(17,'??o T-Shirt Color',70,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',1,'v1-vang.png','0c530625-700d-4923-8268-43af5e699580.jpg','58bb88e1-5dbe-44de-a5a1-77ad1aff1131.jpg',1),(18,'??o COAST Brown',120,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',1,'clowz-5-1-2.jpg','clowz-5-9.jpg','clowz-5-3.jpg',1),(19,'Converse Basic',100,'Ch???t li???u: Cotton 230 GSM, S??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, l???n tr??i ??o khi gi???t',4,'product-09.jpg','product092.jpg','product-093.jpg',1),(20,'?????ng h??? Basic',300,'Ch???t li???u 100% cotton, s??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, kh??ng b??? bong tr??c khi gi???t',5,'product-06.jpg','product-062.jpg','product-063.jpg',1),(21,'?????ng h??? BlackPanther',300,'Ch???t li???u 100% cotton, s??? d???ng c??ng ngh??? in ??p nhi???t ch???t l?????ng cao. ????? b???n cao, kh??ng b??? bong tr??c khi gi???t',5,'product-15.jpg','product-152.jpg','product-153.jpg',1),(42,'T??i Utility',35,'Size: 23x16x8 cm\r , M?? t???: T??i 3 ng??n in logo\r,  D??y quai ??eo: H???a ti???t caro ??en tr???ng in ch???y d???c quai ??eo',3,'bag1.jpg','bag3.jpg','bag2.jpg',1),(43,' T??i Ulitity SATCHEL',40,'D??y quai ??eo: H???a ti???t caro ??en tr???ng in ch???y d???c quai ??eo. D??y ??eo c?? th??? ??i???u ch???nh ho???c th??o r???i, Thi???t k???, ch???t li???u, v?? h??nh in ch???t l?????ng cao.',3,'clowz-1-1.jpg','clowz1-2.jpg','clowz-3-1.jpg',1),(45,'T??i Crytal Clear',35,'D??y ??eo: Ch??? \"CLOWNZ\" thi???t k??? theo phong c??ch graphic in ch??m, d??y ??eo d??i c?? th??? ??i???u ch???nh v?? th??o r???i.Ch???t li???u: Nh???a PU, Thi???t k???, ch???t li???u, v?? h??nh in ch???t l?????ng cao.',3,'clear-bag-black.jpg','1a7ff27f-75e2-4917-98bb-6d62bd9c3518.jpg','35e41285-3b94-4dca-96de-fff0b8b19273.jpg',1),(56,'?????ng h??? Rolex Luxury',1000,'?????ng h??? Rolex Luxury',5,'mua-?????ng-h???-Rolex-Deepsea-??en.jpeg','Daytona-2-1580886196.jpg','dong-ho-rolex-nam-nu-chinh-hang-gia-bao-nhieu-danh-gia-chi-tiet.jpg',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  `one_time_password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (52,'iamghost06@gmail.com','123456','Nguyen Ngoc Bach',NULL,NULL,NULL,NULL,0,NULL,'ROLE_USER',1,NULL,NULL,NULL),(54,'iamghost827@gmail.com','123456','Nguy???n Ng???c B??ch','0969374719','64, Nguy???n V??n Tr???i, H?? ????ng, H?? N???i','Ha Noi','Ha Noi',100000,NULL,'ROLE_ADMIN',1,100000,'ba2b7156370cf989082c7daa8a8c336f.jpg',NULL),(90,'ngocbachnguyen100@gmail.com','$2a$10$XZOHSDmtkUdck5M7NdelMe6Xnupo1csaviwZ3JLr8yoCUEnUYnRDm','Nguy???n Ng???c B??ch',NULL,NULL,NULL,NULL,0,'2021-09-24 09:08:31','ROLE_USER',1,NULL,'69402738_2326329874274213_15742996465057792_n.jpg',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-12 15:10:15
