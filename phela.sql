-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: phela
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `detailed_address` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `is_default` bit(1) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `ward` varchar(255) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK93c3js0e22ll1xlu21nvrhqgg` (`customer_id`),
  CONSTRAINT `FK93c3js0e22ll1xlu21nvrhqgg` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('1ce196f9-ea37-42dc-81d0-fda123fd9a3c','H├á Nß╗Öi','61, Phß╗æ N├║i Tr├║c, Ph╞░ß╗¥ng Kim M├ú, Quß║¡n Ba ─É├¼nh, H├á Nß╗Öi, 10060, Viß╗çt Nam','Ba ─É├¼nh',_binary '\0',21.0300227,105.8228526,'0364111402','capcap','Kim M├ú','6339bd20-0f50-4053-bfc2-16536757389d'),('5c824f9d-209d-4a2c-8cdf-28ea877ef51c','H├á Nß╗Öi','Hß╗ìc viß╗çn Ng├ón h├áng, 12, Phß╗æ Ch├╣a Bß╗Öc, Ph╞░ß╗¥ng Quang Trung, Quß║¡n ─Éß╗æng ─Éa, H├á Nß╗Öi, 10306, Viß╗çt Nam','─Éß╗æng ─Éa',_binary '',21.0094822,105.8290404,'0364111402','capcap','Quang Trung','6339bd20-0f50-4053-bfc2-16536757389d');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `employ_code` varchar(255) NOT NULL,
  `failed_login_attempts` int NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `role` enum('ADMIN','CUSTOMER','DELIVERY_STAFF','STAFF','SUPER_ADMIN') NOT NULL,
  `status` enum('ACTIVE','BLOCKED','INACTIVE','PENDING') NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `username` varchar(100) NOT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKt05gvpvcr1nkfq77ieqkcj4rx` (`employ_code`),
  UNIQUE KEY `UKrriw0ffsm8tmnprap50hfsrvk` (`fullname`),
  UNIQUE KEY `UKgfn44sntic2k93auag97juyij` (`username`),
  KEY `FK42v5puxogxrn2piminrx5yvlc` (`branch_code`),
  CONSTRAINT `FK42v5puxogxrn2piminrx5yvlc` FOREIGN KEY (`branch_code`) REFERENCES `branch` (`branch_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('b765a120-29f6-4869-977a-c327936bbef0','2025-06-11 12:06:04.314357','2002-06-19','ducanhku@gmail.com','PLB00002',0,'Nguyß╗àn Quß╗│nh Anh','Nß╗»','0:0:0:0:0:0:0:1','$2a$10$FQHZfD936hX8XMPQzpTKLO5dyDe0MxduWhggHXB/mRMZG4inUm1N.','0364111204','DELIVERY_STAFF','ACTIVE','2025-06-11 20:16:09.575284','quynhanh','CH0001'),('dee3036b-1ceb-461b-953b-8d46f6e9ca4c','2025-06-11 14:09:27.820009','2001-07-16','langyvu@gmail.com','PLB00003',0,'B├╣i Ph╞░╞íng Linh','Nß╗»','0:0:0:0:0:0:0:1','$2a$10$rD0P9hx39D21DgDoXpq5xuEeP1HDg3yl0jDoSRSTc0s0PAixRiewy','0956253467','STAFF','ACTIVE','2025-06-11 15:03:33.664581','builinh','CH0012'),('e6c9c6f8-6ff2-4fa2-a01b-f5b42473cd30','2025-06-04 16:12:26.698323','2004-01-04','linhxinh414@gmail.com','PLB00001',0,'L├¬ Ph╞░╞íng Linh','Nam','0:0:0:0:0:0:0:1','$2a$10$hbuStIFoPix7fjrLS0NKz.vabwd9sy/O0xJR.LWXfGFqcNQOxWK6S','0364111402','SUPER_ADMIN','ACTIVE','2025-06-05 05:47:25.395612','capcap','CH0001');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `application_id` varchar(255) NOT NULL,
  `application_date` datetime(6) NOT NULL,
  `cv_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('ACCEPTED','PENDING','REJECTED','REVIEWED') NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `job_posting_id` varchar(255) NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `FKtik35v4x0cxa4j8xngfdfjodh` (`job_posting_id`),
  CONSTRAINT `FKtik35v4x0cxa4j8xngfdfjodh` FOREIGN KEY (`job_posting_id`) REFERENCES `job_posting` (`job_posting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES ('141e9c72-2bf5-47f3-8417-12530e1d188b','2025-06-07 04:58:37.437444','/uploads/cv/CV_da5d2d8d-ec54-4c02-96f0-74867f3ccd8a_1749247117433.pdf','thuyanh23@gmail.com','Nguyß╗àn Th├╣y Anh','0364111789','ACCEPTED','2025-06-11 13:36:50.844090','2116fd70-188a-426f-b265-31c11685ddc1'),('ab38a899-87bb-49bb-9510-81dab11902be','2025-06-05 18:24:32.831972','/uploads/cv/CV_6ac8f135-0586-412e-8a12-ec943b86d096_1749122672741.pdf','linhxinh414@gmail.com','L├¬ Ph╞░╞íng Linh','0364111402','ACCEPTED','2025-06-07 03:55:43.376728','2116fd70-188a-426f-b265-31c11685ddc1'),('c0c1f286-29fd-48f9-b97d-bd3e103f9042','2025-06-10 14:44:06.612541','/uploads/cv/CV_601ab5f8-328b-4a81-b2ae-00bc325af5ba_1749541446527.pdf','linhxinh414@gmail.com','L├¬ Ph╞░╞íng Linh','0364111648','PENDING','2025-06-10 14:44:06.612541','3f7559d6-bd87-48a5-99e2-5ab9c17761d6'),('ff407f89-ba14-4096-8088-801d8ea1e750','2025-06-07 04:27:07.497638','/uploads/cv/CV_4e4661f5-0371-4cd3-9334-ca61dc13b202_1749245227445.pdf','hungnguyen0405qt@gmail.com','Nguyß╗àn Viß╗çt H╞░ng','0789397680','REJECTED','2025-06-07 04:27:25.129070','2116fd70-188a-426f-b265-31c11685ddc1');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `banner_id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  CONSTRAINT `banner_chk_1` CHECK ((`status` between 0 and 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES ('222a1b34-d532-4d21-85fa-45eb443bd8be','2025-06-09 16:18:02.042207','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460681/banners/hg6cgpxk1epknq27vaqi.jpg',0,'2025-06-09 16:18:02.042207'),('2fad1f6b-a5cc-4b2b-998f-3876b53c3399','2025-06-09 16:17:36.334152','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460655/banners/qgd8qzg9yka5mukftoan.jpg',0,'2025-06-09 16:17:36.334152'),('6863ddd8-f982-4d61-9b24-f8ee411f48f2','2025-06-09 16:17:46.507766','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460666/banners/sdrioijes55lnyxwpzvq.jpg',0,'2025-06-09 16:17:46.507766'),('78e2b091-613e-43c0-bb72-e576e350f102','2025-06-09 16:17:11.209052','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460630/banners/fm4fm4snsogj5f18ivyt.jpg',0,'2025-06-09 16:17:11.209052'),('92f570fa-2573-455c-950e-23df383ff9df','2025-06-09 16:17:20.460534','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460640/banners/bxwch2a71h81t1vnzmex.jpg',0,'2025-06-09 16:17:20.460534'),('eb174905-5420-44dd-9034-b2ac1a5cd3a4','2025-06-09 16:17:54.358247','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460673/banners/t3sk0xzq8hnzxlcolo2o.jpg',0,'2025-06-11 15:05:39.489655'),('f4c00049-e4ec-4bd1-9d68-fae3f4398dac','2025-06-09 16:17:27.884648','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749460647/banners/tgtjfhjrtunlyqtoifmo.jpg',0,'2025-06-09 16:17:27.884648');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`branch_code`),
  CONSTRAINT `branch_chk_1` CHECK ((`status` between 0 and 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('CH0001',' Sß╗æ 14 ─Éß║╖ng Tiß║┐n ─É├┤ng, Ph╞░ß╗¥ng Trung Liß╗çt, Quß║¡n ─Éß╗æng ─Éa, H├á Nß╗Öi','Ph├¬ La ─Éß║╖ng Tiß║┐n ─É├┤ng','H├á Nß╗Öi','─Éß╗æng ─Éa',21.0134122,105.8228421,1),('CH0002',' Sß╗æ 65 Phß║ím Ngß╗ìc Thß║ích, Ph╞░ß╗¥ng Trung Tß╗▒, Quß║¡n ─Éß╗æng ─Éa, H├á Nß╗Öi','Ph├¬ La Phß║ím Ngß╗ìc Thß║ích','H├á Nß╗Öi','─Éß╗æng ─Éa',21.0087906,105.8346209,1),('CH0003','L├┤ 2BT5, K─ÉT Bß║»c Linh ─É├ám, Ph╞░ß╗¥ng Ho├áng Liß╗çt, Quß║¡n Ho├áng Mai, H├á Nß╗Öi','Ph├¬ La Bß║»c Linh ─É├ám','H├á Nß╗Öi','Ho├áng Mai',20.9681919,105.82714,1),('CH0004','  Sß╗æ 3B L├¬ Th├íi Tß╗ò, Ph╞░╞í╠Çng H├áng Trß╗æng, Qu├ó╠ún Ho├án Kiß║┐m, H├á Nß╗Öi','Ph├¬ La L├¬ Th├íi Tß╗ò','H├á Nß╗Öi','Ho├án Kiß║┐m',21.0320482,105.851222,1),('CH0005',' Sß╗æ 24 H├áng C├│t, Ph╞░ß╗¥ng H├áng M├ú, Quß║¡n Ho├án Kiß║┐m, H├á Nß╗Öi','Ph├¬ La H├áng C├│t','H├á Nß╗Öi','Ho├án Kiß║┐m',21.0376302,105.8471149,1),('CH0006','Sß╗æ 45B L├╜ Th╞░ß╗¥ng Kiß╗çt, Ph╞░ß╗¥ng Trß║ºn H╞░ng ─Éß║ío, Quß║¡n Ho├án Kiß║┐m, H├á Nß╗Öi','Ph├¬ La L├╜ Th╞░ß╗¥ng Kiß╗çt','H├á Nß╗Öi','Ho├án Kiß║┐m',21.024043,105.8480486,1),('CH0007','Sß╗æ 25 T├┤ng ─Éß║ún, Ph╞░ß╗¥ng Tr├áng Tiß╗ün, Quß║¡n Ho├án Kiß║┐m, H├á Nß╗Öi','Ph├¬ La T├┤ng ─Éß║ún','H├á Nß╗Öi','Ho├án Kiß║┐m',21.0268786,105.8576027,1),('CH0008','Sß╗æ 24 ng├╡ 128C ─Éß║íi La, Ph╞░ß╗¥ng ─Éß╗ông T├óm, Quß║¡n Hai B├á Tr╞░ng, H├á Nß╗Öi','Ph├¬ La ─Éß║íi La','H├á Nß╗Öi','Hai B├á Tr╞░ng',20.9987099,105.8446289,1),('CH0009','Sß╗æ N04 - B1 Th├ánh Th├íi, Ph╞░ß╗¥ng Dß╗ïch Vß╗ìng, Quß║¡n Cß║ºu Giß║Ñy, H├á Nß╗Öi','Ph├¬ La Th├ánh Th├íi','H├á Nß╗Öi','Cß║ºu Giß║Ñy',21.0285253,105.7950845,1),('CH0010',' Sß╗æ 46 Trß║ºn Quß╗æc Ho├án, Ph╞░ß╗¥ng Dß╗ïch Vß╗ìng, Quß║¡n Cß║ºu Giß║Ñy, H├á Nß╗Öi.','Ph├¬ La Trß║ºn Quß╗æc Ho├án','H├á Nß╗Öi','Cß║ºu Giß║Ñy',21.0418741,105.7863384,1),('CH0011',' Sß╗æ 2 N├║i Tr├║c, Ph╞░ß╗¥ng Kim M├ú, Quß║¡n Ba ─É├¼nh, Ha╠Ç N├┤╠úi','Ph├¬ La N├║i Tr├║c','H├á Nß╗Öi','Ba ─É├¼nh',21.0320543,105.8217956,1),('CH0012',' Sß╗æ 19 Ngß╗ìc H├á, Ph╞░ß╗¥ng ─Éß╗Öi Cß║Ñn, Quß║¡n Ba ─É├¼nh, H├á Nß╗Öi','Ph├¬ La Ngß╗ìc H├á','H├á Nß╗Öi','Ba ─É├¼nh',21.0356168,105.8326294,1),('CH0013','Sß╗æ 42 Y├¬n Phß╗Ñ, Ph╞░ß╗¥ng Tr├║c Bß║ích, Quß║¡n Ba ─É├¼nh, H├á Nß╗Öi','Ph├¬ La y├¬n Phß╗Ñ','H├á Nß╗Öi','Ba ─É├¼nh',21.0466904,105.8433949,1),('CH0014','Sß╗æ 35 L├¬ V─ân Thi├¬m (t├▓a nh├á Stellar Garden), Quß║¡n Thanh Xu├ón, H├á Nß╗Öi','Ph├¬ La L├¬ V─ân Thi├¬m','H├á Nß╗Öi','Thanh Xu├ón',21.0004871,105.8035191,1),('CH0015',' Sß╗æ 19 L├¬ V─ân L╞░╞íng (To├á nh├á Sao Mai), Quß║¡n Thanh Xu├ón, H├á Nß╗Öi','Ph├¬ La L├¬ V─ân L╞░╞íng','H├á Nß╗Öi','Thanh Xu├ón',21.0076437,105.8085433,1),('CH0016',' Sß╗æ 453 Nguyß╗àn V─ân Cß╗½, Ph╞░ß╗¥ng Gia Thß╗Ñy, Quß║¡n Long Bi├¬n, H├á Nß╗Öi','Ph├¬ La Nguyß╗àn V─ân Cß╗½','H├á Nß╗Öi','Long Bi├¬n',21.0473679,105.8828125,1),('CH0017','Sß╗æ 34 Nguyß╗àn V─ân Lß╗Öc, Ph╞░ß╗¥ng Mß╗Ö Lao, Quß║¡n H├á ─É├┤ng, H├á Nß╗Öi','Ph├¬ La Nguyß╗àn V─ân Lß╗Öc','H├á Nß╗Öi','H├á ─É├┤ng',20.9832129,105.7895404,1),('CH0018','Sß╗æ 145 Tr├¡ch S├ái, Quß║¡n T├óy Hß╗ô, H├á Nß╗Öi','Ph├¬ La Tr├¡ch S├ái','H├á Nß╗Öi','T├óy Hß╗ô',21.0532329,105.8124903,1),('CH0019',' Sß╗æ 1 - 3 Phan Chu Trinh, Ph╞░ß╗¥ng Bß║┐n Th├ánh, Quß║¡n 1, TP HCM','Ph├¬ La Phan Chu Trinh','Th├ánh phß╗æ Hß╗ô Ch├¡ Minh','Quß║¡n 1',10.7725218,106.6973621,1),('CH0020','Sß╗æ 125 Hß╗ô T├╣ng Mß║¡u, Ph╞░ß╗¥ng Bß║┐n Ngh├⌐, Quß║¡n 1, TP HCM','Ph├¬ La Hß╗ô T├╣ng Mß║¡u','Th├ánh phß╗æ Hß╗ô Ch├¡ Minh','Quß║¡n 1',10.7722015,106.7037266,1),('CH0021',' Sß╗æ 89 Xu├ón Thß╗ºy, Ph╞░ß╗¥ng Thß║úo ─Éiß╗ün, Quß║¡n 2, TP HCM','Ph├¬ La Xu├ón Thß╗ºy','Th├ánh phß╗æ Hß╗ô Ch├¡ Minh','Quß║¡n 2',10.8037679,106.7347025,1),('CH0022',' Sß╗æ 7 Nguyß╗àn Ch├¡ Thanh, Th├ánh phß╗æ ─É├á Lß║ít, L├óm ─Éß╗ông','Ph├¬ La Nguyß╗àn Ch├¡ Thanh','─É├á Lß║ít','Th├ánh phß╗æ ─É├á Lß║ít',11.9396637,108.4349164,1),('CH0023','Sß╗æ 10 Phan Ch├óu Trinh, Ph╞░ß╗¥ng Cß║⌐m Ch├óu, Th├ánh phß╗æ Hß╗Öi An, Quß║úng Nam','Ph├¬ La Phan Ch├óu Trinh','Hß╗Öi An','Th├ánh phß╗æ Hß╗Öi An',15.8785158,108.3312695,1),('CH0024',' Sß╗æ 35 - 41 Nguyß╗àn V─ân Linh, Quß║¡n Hß║úi Ch├óu, ─É├á Nß║╡ng','Ph├¬ La Nguyß╗àn V─ân Linh','─É├á Nß║╡ng','Ph╞░ß╗¥ng Hß║úi Ch├óu',16.0602628,108.213763,1),('CH0025','Sß╗æ 288 V├╡ Thß╗ï S├íu, Khu phß╗æ 7, Th├ánh phß╗æ Bi├¬n H├▓a, ─Éß╗ông Nai','Ph├¬ La V├╡ Thß╗ï S├íu','─Éß╗ông Nai','Th├ánh phß╗æ Bi├¬n H├▓a',10.944645,106.8215998,1),('CH0026','Sß╗æ 41+41A L╞░╞íng Kh├ính Thiß╗çn, Ph╞░ß╗¥ng Cß║ºu ─Éß║Ñt, Quß║¡n Ng├┤ Quyß╗ün, TP. Hß║úi Ph├▓ng','Ph├¬ La L╞░╞íng Kh├ính Thiß╗çn','Hß║úi Ph├▓ng','Quß║¡n Ng├┤ Quyß╗ün',20.8589772,106.689626,1),('CH0027','Tß║ºng 1 TTTM Vincom Plaza Imperia Hß║úi Ph├▓ng, Ph╞░ß╗¥ng Th╞░ß╗úng L├╜, Quß║¡n Hß╗ông B├áng, Hß║úi Ph├▓ng','Ph├¬ La Hß╗ông B├áng','Hß║úi Ph├▓ng','Quß║¡n Hß╗ông B├áng',20.8621916,106.6677772,1),('CH0028','Sß╗æ 289 ─Éinh Bß╗Ö L─⌐nh, Ph╞░╞í╠Çng 26, Qu├ó╠ún Bi╠Çnh Tha╠únh, TP HCM','Ph├¬ La ─Éinh Bß╗Ö L─⌐nh','Th├ánh phß╗æ Hß╗ô Ch├¡ Minh','Quß║¡n B├¼nh Thß║ính',10.8150697,106.7103937,1),('CH0029',' Sß╗æ 103 ─Éß╗ông ─Éen, Ph╞░ß╗¥ng 12, Quß║¡n T├ón B├¼nh, TP HCM','Ph├¬ La ─Éß╗ông ─Éen','Th├ánh phß╗æ Hß╗ô Ch├¡ Minh','Quß║¡n T├ón B├¼nh',10.7928397,106.6444611,1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `total_amount` double DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address_id` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `customer_id` varchar(36) NOT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `UK867x3yysb1f3jk41cv3vsoejj` (`customer_id`),
  KEY `FKrgitg9w8ege609hlfahe29rjc` (`address_id`),
  KEY `FKhi7nvi5q50rf8dw4qywvjpire` (`branch_code`),
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKhi7nvi5q50rf8dw4qywvjpire` FOREIGN KEY (`branch_code`) REFERENCES `branch` (`branch_code`),
  CONSTRAINT `FKrgitg9w8ege609hlfahe29rjc` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('ab213ebb-b807-454f-a8dc-a2eba862ab92','2025-06-11 14:23:07.277514',0,'2025-06-11 14:23:07.277514',NULL,NULL,'79f9122b-9626-48b3-844e-11f61f5015f2'),('f06349e3-3aa8-4e21-b219-a5595e72a025','2025-06-07 21:54:15.888293',0,'2025-06-11 23:56:57.441718','5c824f9d-209d-4a2c-8cdf-28ea877ef51c','CH0002','6339bd20-0f50-4053-bfc2-16536757389d');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_item_id` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `cart_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_code` varchar(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`category_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('DM0001','Syphon','2025-06-04 16:17:32.393105','Mß╗Öt h╞░╞íng ph├íp pha c├á ph├¬ bß║▒ng ├íp suß║Ñt ch├ón kh├┤ng,tß║ío ra ly c├á ph├¬ c├│h╞░╞íng vß╗ï tinh tß║┐, trong trß║╗o. D├ánh cho ng╞░ß╗¥i y├¬u th├¡ch trß║úi nghiß╗çm pha chß║┐ v├á h╞░╞íng th╞ím phß╗⌐c tß║íp.','2025-06-04 16:17:32.393105'),('DM0002','Moka pot','2025-06-04 16:17:59.746803','Pha bß║▒ng nß╗ôi moka cß╗ºa ├¥, c├á ph├¬ cho ra ─æß║¡m ─æ├á, mß║ính mß║╜, gß║ºn giß╗æng espresso. Th├¡ch hß╗úp cho ng╞░ß╗¥i th├¡ch vß╗ï ─æß║¡m, uß╗æng k├¿m sß╗»a hoß║╖c ─æ├í.','2025-06-04 16:17:59.746803'),('DM0003','C├á ph├¬','2025-06-04 16:18:14.930771','C├íc sß║ún phß║⌐m c├á ph├¬ thß╗º c├┤ng hoß║╖c pha sß║╡n, mang ─æß║¡m phong c├ích ─æß║╖c tr╞░ng cß╗ºa Ph├¬ La.','2025-06-04 16:18:14.930771'),('DM0004','French press','2025-06-04 16:18:27.320288','Dß╗Ñng cß╗Ñ ├⌐p kiß╗âu Ph├íp, giß╗» trß╗ìn dß║ºu c├á ph├¬ v├á h╞░╞íng th╞ím. H╞░╞íng vß╗ï ─æß║ºy ─æß║╖n, mß╗Öc mß║íc, dß╗à d├╣ng tß║íi nh├á.','2025-06-04 16:18:27.320288'),('DM0005','Cold brew','2025-06-04 16:18:43.489781','C├á ph├¬ ß╗º lß║ính trong nhiß╗üu giß╗¥, ├¡t ─æß║»ng v├á m╞░ß╗út m├á. Ph├╣ hß╗úp vß╗¢i ng╞░ß╗¥i th├¡ch c├á ph├¬ nhß║╣, uß╗æng m├ít lß║ính v├áo m├╣a h├¿.','2025-06-04 16:18:43.489781'),('DM0006','├ö long matcha','2025-06-04 16:18:56.236577','D├▓ng sß║ún phß║⌐m hiß╗çn ─æß║íi kß║┐t hß╗úp giß╗»a ├ö long v├á Matcha','2025-06-04 16:18:56.236577'),('DM0007','Plus - Lon/Chai tiß╗çn lß╗úi','2025-06-04 16:19:13.780258','Sß║ún phß║⌐m ─æ├│ng lon hoß║╖c chai, dß╗à d├áng mang ─æi','2025-06-04 16:19:13.780258'),('DM0008','Topping','2025-06-04 16:19:25.070493','C├íc loß║íi th├¬m k├¿m nh╞░ tr├ón ch├óu, thß║ích,..','2025-06-04 16:19:25.070493'),('DM0009','Mang Ph├¬ La vß╗ü nh├á','2025-06-04 16:19:41.151572','D├▓ng sß║ún phß║⌐m d├ánh cho kh├ích h├áng mua mang ─æi hoß║╖c d├╣ng tß║íi nh├á','2025-06-04 16:19:41.151572');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `recipient_id` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES ('005a7c4d-9d30-4043-bacd-2041977b04bb','hihi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:16:43.021171'),('01910772-52c9-4d63-aa4c-638af4602bb3','huhuhu','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-10 18:35:53.456495'),('0937fa02-391d-4b45-9f2e-a478983b1adf','kh├┤ng y├¬u','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-09 19:22:40.623367'),('0a523ff8-8a68-4392-a88e-4caf0f604d7c','hi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:16:02.758746'),('10b544a0-1f0f-4bd4-aca6-ec41b67c070d','m├ú ─æ╞ín #ORD00003','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 21:13:26.978575'),('11040d81-4b3d-475c-a926-60fc7982e113','dß║í bß║ín c├│ khiß║┐u nß║íi vß╗ü vß║Ñn ─æß╗ü g├¼ ß║í','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 18:59:46.946631'),('11f109b5-2202-4215-ac74-e4827596451e','hihih','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-10 18:35:23.440135'),('198c6b34-d38a-48ec-8ecd-69c852db1160','hi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:16:06.236115'),('3b6aa3ac-7994-46fc-acc7-b2bb349cec6b','hihi','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 20:07:39.111357'),('3ddcf0cd-be62-4755-872c-90026deab7e3','ch├áo em','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-10 14:46:59.272729'),('486be92e-6575-422f-bc97-dfacc4b49396','t├┤i muß╗æn ─æß║╖t phe ela','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-10 18:35:13.815064'),('4b23f125-326a-4d62-b62d-53dcfeba036f','t├┤i muß╗æn khiß║┐u nß║íi','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-09 18:59:29.857286'),('51396de8-ffcc-495f-936c-32ddbef54afe','ch├áo bß║ín','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 20:07:31.208186'),('54aacf52-73fd-4fab-a9f4-e464ef4733f7','hihi','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-10 18:35:57.771046'),('566296ef-e33b-428d-8cd2-3abcb1eca231','hello','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-09 18:50:56.505609'),('569d7401-036c-420c-821e-e3418053457d','hihi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:22:29.708871'),('5d7757e7-c77f-4b0f-9dca-6b858ba6243b','th├¡ch','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:18:24.833070'),('63a12424-ac65-4b90-ad8e-daf039ec59f3','hihi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-10 18:34:04.900949'),('6566cddf-90dd-4dd3-860b-0e70b5388212','hahgahah','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-10 18:35:46.018548'),('6cc742ca-34b0-49b4-87a9-1f4b3a7a93cc','hhii','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 11:43:33.865690'),('70785a8a-969d-46a8-a2aa-b8ef34e3aff7','ch├áo bß║ín, bß║ín c├│ y├¬u cß║ºu g├¼ kh├┤ng ','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 18:51:23.639015'),('81e62077-3c41-4873-ba31-a4e8739894ee','kh├┤ng','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-09 19:18:32.024159'),('83c198ef-b066-4765-b3b5-5ab04be197c8','bß║ín cho m├¼nh xin m├ú ─æ╞ín h├áng v├á y├¬u cß║ºu khiß║┐u nß║íi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-11 21:13:06.793605'),('86c63a1d-fa30-40c9-80e5-ff9b0b0cbb89','vß╗¢i t├┤i thiß║┐u 1 shot tr├ón ch├óu ├┤ long','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 21:14:25.667316'),('88e07244-a427-4a6b-a1e0-3d765f989d56','c├│','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:18:37.355938'),('94ba5717-e661-4f92-a8db-bc2813fc0ba2','hihi','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-10 18:35:40.523557'),('9e97d2ef-e7d9-4bf9-a213-a328ca0afef0','t├┤i muß╗æn khiß║┐u nß║íi ─æ╞ín h├áng','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 21:12:24.052909'),('a589d461-8651-4838-a0a5-35d54d2eb0f5','hahaha','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-11 11:43:37.490897'),('b68c758b-0e33-42e8-9161-21a246e17fab','vui','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:16:18.324418'),('cfe50179-bc06-4564-b428-d370ea97ac74','t├┤i muß╗æn khiß║┐u nß║íi','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 11:31:24.519610'),('dc14265b-7e33-4bfb-93df-e2f87f675455','hihi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:00:01.511243'),('de52005f-044b-4d14-8e1e-33e1d2722e01','ch├áo','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','Nguyß╗àn Quß╗│nh Anh','2025-06-11 12:08:09.800089'),('e30844f4-3f79-48b7-bb54-ac42ea16e766','dß║í bß║ín c├│ khiß║┐u nß║íi g├¼ ß║í','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-11 11:42:51.490468'),('eb485931-b855-46cb-9fea-2a7d5b4e41cc','kh├┤ng vui','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-09 19:16:35.090987'),('ee2674f7-6a89-4043-b2b2-e8e6b222de4d','y├¬u ','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-09 19:22:36.157395'),('f045b9dd-c3ab-4b9a-87cc-b166086afa33','kh├┤ng','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-09 18:52:42.021848'),('f0eb5efb-20a8-4006-b874-42591b0d6fd0','hhihi','6339bd20-0f50-4053-bfc2-16536757389d','ADMIN','L├¬ Ph╞░╞íng Linh','2025-06-11 20:07:44.508000'),('f5406334-c445-4860-b208-ab6da7ca5f14','xin ch├áo','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 11:29:01.196266'),('f7457256-b6c7-4523-96c8-d32a647a9772','bß╗ï nhß║ºm cß╗æc ├┤ long size la th├ánh size ph├¬ ß║í','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 21:13:58.990307'),('ffaca914-fc07-4c59-bb91-fca10e0d96a5','linh ngu vl','ADMIN','6339bd20-0f50-4053-bfc2-16536757389d','linhne','2025-06-11 11:44:05.747136');
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contact_id` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `customer_code` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `failed_login_attempts` int NOT NULL,
  `gender` varchar(255) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `order_cancel_times` int NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `point_use` double NOT NULL,
  `role` enum('ADMIN','CUSTOMER','DELIVERY_STAFF','STAFF','SUPER_ADMIN') NOT NULL,
  `status` enum('ACTIVE','BLOCKED','INACTIVE','PENDING') NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `username` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK114lxb57nwilrwigcoi6nm3ln` (`customer_code`),
  UNIQUE KEY `UKirnrrncatp2fvw52vp45j7rlw` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('6339bd20-0f50-4053-bfc2-16536757389d','2025-06-07 21:54:15.866143','KH000001','lplinh404@gmail.com',0,'Nß╗»',21.00910779102083,105.82850078471668,0,'$2a$10$z3cXLQxMUloCEiSgOvBtEuXw399THhxNRmgMkh/WeQyhGGZa.6HYW',6,'CUSTOMER','ACTIVE','2025-06-11 23:55:47.244625','linhne'),('79f9122b-9626-48b3-844e-11f61f5015f2','2025-06-11 14:23:07.219857','KH000002','bplinh374@gmail.com',0,'Nß╗»',NULL,NULL,0,'$2a$10$kHTiRj7iQ1Ob04Shbucuve7i8Yy1.KWp3yqEItZtY.cWeck2iCJIW',0,'CUSTOMER','PENDING','2025-06-11 14:23:07.219857','blinhne');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_posting`
--

DROP TABLE IF EXISTS `job_posting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_posting` (
  `job_posting_id` varchar(255) NOT NULL,
  `deadline` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `experience_level` enum('EXPERT','FRESHER','JUNIOR','SENIOR') NOT NULL,
  `job_code` varchar(255) NOT NULL,
  `posting_date` datetime(6) NOT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `salary_range` varchar(255) DEFAULT NULL,
  `status` enum('CLOSED','FILLED','OPEN') NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  PRIMARY KEY (`job_posting_id`),
  UNIQUE KEY `UK6cml6j3twr131ierka6e0p7gq` (`job_code`),
  KEY `FKhk043c7gq3wirengpehojdkry` (`branch_code`),
  CONSTRAINT `FKhk043c7gq3wirengpehojdkry` FOREIGN KEY (`branch_code`) REFERENCES `branch` (`branch_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_posting`
--

LOCK TABLES `job_posting` WRITE;
/*!40000 ALTER TABLE `job_posting` DISABLE KEYS */;
INSERT INTO `job_posting` VALUES ('2116fd70-188a-426f-b265-31c11685ddc1','2025-07-01','Tß║¡p hß╗úp h├│a ─æ╞ín chß╗⌐ng tß╗½ mua v├áo, kiß╗âm tra t├¡nh hß╗úp l├╜, hß╗úp lß╗ç cß╗ºa h├│a ─æ╞ín, chß╗⌐ng tß╗½;','FRESHER','JB0001','2025-06-05 15:48:05.889979','2 - 5 n─âm kinh nghiß╗çm','14 triß╗çu - 18 triß╗çu','OPEN','Nh├ón sß╗▒ Kß║┐ to├ín','2025-06-07 05:44:56.937652','CH0003'),('3f7559d6-bd87-48a5-99e2-5ab9c17761d6','2025-07-10','Ch├áo ─æ├│n kh├ích ─æß║┐n vß╗¢i cß╗¡a h├áng. Nß║»m ─æ╞░ß╗úc th├┤ng tin ─æß╗ô uß╗æng, b├ính ngß╗ìt hiß╗çn c├│ sß║╡n trong cß╗¡a h├áng. Mang ─æß╗ô uß╗æng l├¬n khu vß╗▒c tß╗▒ phß╗Ñc vß╗Ñ v├á bß║Ñm thß║╗ gß╗ìi kh├ích khi ─æ╞░ß╗úc chuß║⌐n bß╗ï xong.','FRESHER','JB0002','2025-06-07 05:40:29.917014','─Éß╗º 18 tuß╗òi trß╗ƒ l├¬n, ╞░u ti├¬n tß╗æt nghiß╗çp THPT. Sß╗⌐c khß╗Åe tß╗æt, chß╗ïu ─æ╞░ß╗úc ─æi, ─æß╗⌐ng trong nhiß╗üu giß╗¥. Thß╗¥i gian l├ám viß╗çc linh hoß║ít.','Tß╗½ 19.000─æ/giß╗¥ ─æß║┐n 23.000─æ/giß╗¥','OPEN','Nh├ón vi├¬n Phß╗Ñc vß╗Ñ','2025-06-07 05:40:29.917014','CH0006'),('541bc1f5-7842-40d1-b124-51f54a41aeb2','2025-08-10','T╞░ vß║Ñn sß║ún phß║⌐m cß╗ºa th╞░╞íng hiß╗çu cho kh├ích h├áng. Thß╗▒c hiß╗çn order sß║ún phß║⌐m cho kh├ích h├áng. Tß╗òng hß╗úp doanh thu mß╗ùi ca, b├án giao ca v├á kß║┐t ca v├áo cuß╗æi mß╗ùi ng├áy l├ám viß╗çc','FRESHER','JB0003','2025-06-07 05:42:46.668373','─Éß╗º 18 tuß╗òi trß╗ƒ l├¬n, ╞░u ti├¬n tß╗æt nghiß╗çp THPT. Sß╗⌐c khß╗Åe tß╗æt, chß╗ïu ─æ╞░ß╗úc ─æi, ─æß╗⌐ng trong nhiß╗üu giß╗¥. Thß╗¥i gian l├ám viß╗çc linh hoß║ít.','Tß╗½ 19.000─æ/giß╗¥ ─æß║┐n 23.000─æ/giß╗¥','OPEN','Nh├ón vi├¬n Thu ng├ón','2025-06-07 05:54:12.540484','CH0001');
/*!40000 ALTER TABLE `job_posting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` varchar(255) NOT NULL,
  `content` text,
  `created_at` datetime(6) DEFAULT NULL,
  `summary` text,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES ('2adef42e-925f-47d0-9fa6-6ca36009c22f','I. ─Éß╗ÉI T╞»ß╗óNG Dß╗░ THI\r\n\r\nTß║Ñt cß║ú ─Éß╗ông Chill 03 miß╗ün (chß╗ë ├íp dß╗Ñng vß╗¢i t├ái khoß║ún c├í nh├ón)\r\n\r\nII. THß╗é Lß╗å V├Ç H├îNH THß╗¿C Dß╗░ THI\r\n\r\nTß╗½ ng├áy 09/05  ΓÇô 15/05/2025, Ph├¬ La tß╗ò chß╗⌐c cuß╗Öc thi CHILL LY CHILL HOA gß╗ôm 04 b╞░ß╗¢c tham gia:\r\n\r\nB╞░ß╗¢c 1: T╞»╞áNG T├üC v├á CHIA Sß║║/─É─éNG Lß║áI b├ái viß║┐t vß╗ü cuß╗Öc thi l├¬n trang c├í nh├ón Facebook/Threads ß╗ƒ chß║┐ ─æß╗Ö C├öNG KHAI.\r\n\r\nB╞░ß╗¢c 2: ─Éß╗ông Chill tß╗▒ do s├íng tß║ío cß║»m hoa/trang tr├¡ c├╣ng Ly T├¡m Mß╗Öng M╞í vß╗¢i:\r\n\r\nChß╗º ─æß╗ü: Chill Ly Chill Hoa\r\nChß║Ñt liß╗çu: S├íng tß║ío vß╗¢i mß╗ìi loß║íi hoa kh├┤ng giß╗¢i hß║ín giß╗æng/lo├ái, c├│ thß╗â l├á hoa t╞░╞íi, hoa bß║▒ng vß║úi, hoa bß║▒ng len, hoa bß║▒ng kß║╜m nhung, hoa bß║▒ng giß║Ñy,ΓÇª\r\nB╞░ß╗¢c 3:  \r\n\r\n─Éß╗æi vß╗¢i Facebook: ─É─âng tß║úi h├¼nh ß║únh Ly T├¡m ─æ╞░ß╗úc trang tr├¡ c├╣ng hoa tr├¬n trang Facebook c├í nh├ón/ tr├¬n Group Hß╗Öi ─Éß╗ông Chill Ph├¬ La d╞░ß╗¢i chß║┐ ─æß╗Ö c├┤ng khai b├ái ─æ─âng & l╞░ß╗út t╞░╞íng t├íc k├¿m hashtag #Ph├¬La #LyT├¡mMß╗ÖngM╞í #ChillLyChillHoa\r\n─Éß╗æi vß╗¢i Threads: ─É─âng tß║úi h├¼nh ß║únh Ly T├¡m ─æ╞░ß╗úc trang tr├¡ c├╣ng hoa tr├¬n trang Threads c├í nh├ón ß╗ƒ chß║┐ ─æß╗Ö c├┤ng khai b├ái ─æ─âng & l╞░ß╗út t╞░╞íng t├íc k├¿m hashtag #Ph├¬La #LyT├¡mMß╗ÖngM╞í #ChillLyChillHoa\r\nB╞░ß╗¢c 4: Sao ch├⌐p link b├ái dß╗▒ thi v├á ─æiß╗ün th├┤ng tin v├áo Form ─æ─âng k├╜ dß╗▒ thi Tß║áI ─É├éY\r\n\r\nL╞░u ├╜: Ph├¬ La chß╗ë ghi nhß║¡n b├ái dß╗▒ thi ─æ├ú thß╗▒c hiß╗çn ─æß╗º 04 b╞░ß╗¢c tr├¬n v├á t├¡nh ─æiß╗âm b├¼nh chß╗ìn ─æß║┐n hß║┐t 17:59 ng├áy 15/05/2025.\r\n\r\nIII. THß╗£I GIAN TRIß╗éN KHAI CUß╗ÿC THI\r\n\r\nThß╗¥i gian nhß║¡n b├ái dß╗▒ thi: Tß╗½ 07:00 09/05/2025 ─æß║┐n hß║┐t 17:59 ng├áy 15/05/2025\r\nThß╗¥i gian chß║Ñm ─æiß╗âm: Tß╗½ 18:00 ng├áy 15/05/2025 ─æß║┐n ng├áy 16/05/2025\r\nThß╗¥i gian c├┤ng bß╗æ kß║┐t quß║ú: Tß╗½ 19:00 ng├áy 16/05/2025 tr├¬n trang Facebook/Threads ch├¡nh thß╗⌐c cß╗ºa Ph├¬ La\r\nThß╗¥i gian nhß║¡n giß║úi th╞░ß╗ƒng: tß╗½ 09:00 ng├áy 20/05/2025 vß╗¢i Hß║ín sß╗¡ dß╗Ñng E-Voucher tß╗½ 20/05 ─æß║┐n hß║┐t ng├áy 20/06/2025\r\nIII. TI├èU CH├ì ─É├üNH GI├ü\r\n\r\nB├ái dß╗▒ thi sß║╜ ─æ╞░ß╗úc t├¡nh ─æiß╗âm dß╗▒a tr├¬n 02 ti├¬u ch├¡, Ph├¬ La sß║╜ chß╗ìn ra Top 20 ─Éß╗ông Chill c├│ tß╗òng sß╗æ ─æiß╗âm cao nhß║Ñt ß╗ƒ cß║ú 02 ti├¬u ch├¡ v├á tiß║┐n h├ánh trao giß║úi vß╗¢i c├ích t├¡nh nh╞░ sau:\r\n\r\nTß╗öNG ─ÉIß╗éM B├ÇI Dß╗░ THI = 70% x ─Éiß╗âm do ─Éß╗ông Chill B├¼nh Chß╗ìn + 30% x ─Éiß╗âm do Ph├¬ La ─æ├ính gi├í\r\nV. GIß║óI TH╞»ß╗₧NG\r\n\r\nGiß║úi th╞░ß╗ƒng S├íng Tß║ío ΓÇ£Chill Ph├¬ La 01 th├íng miß╗àn ph├¡ΓÇ¥ d├ánh cho Top 05 c├│ sß╗æ ─æiß╗âm cao nhß║Ñt (Mß╗ùi giß║úi t╞░╞íng ß╗⌐ng 30 E-Voucher ΓÇ£Miß╗àn Ph├¡ 01 sß║ún phß║⌐m size Ph├¬ bß║Ñt kß╗│ tß╗æi ─æa 54.000vn─æΓÇ¥)\r\n\r\nGiß║úi th╞░ß╗ƒng Mß╗Öng M╞í d├ánh cho Top 15 b├ái dß╗▒ thi nß║▒m trong Top 20 (kh├┤ng bao gß╗ôm Top 10).\r\n\r\n(Mß╗ùi giß║úi t╞░╞íng ß╗⌐ng 03 E-Voucher ΓÇ£Miß╗àn Ph├¡ 01 sß║ún phß║⌐m size Ph├¬ bß║Ñt kß╗│ tß╗æi ─æa 54.000vn─æΓÇ¥)\r\n\r\nVI. C├ích thß╗⌐c trao v├á nhß║¡n giß║úi: \r\n\r\nNg├áy 16/05/2025: BTC sß║╜ c├┤ng bß╗æ ─Éß╗ông Chill thß║»ng giß║úi cß╗ºa cuß╗Öc thi tr├¬n trang Facebook/Threads ch├¡nh thß╗⌐c cß╗ºa Ph├¬ La.\r\nNg├áy 16/05/2025: BTC gß╗ìi x├íc nhß║¡n qua sß╗æ ─æiß╗çn thoß║íi ─æ─âng k├╜ nhß║¡n giß║úi (S─ÉT khi ─æiß╗ün form ─æ─âng k├╜ dß╗▒ thi).\r\nNg├áy 20/05/2025: Top 05 Giß║úi S├íng Tß║ío & Top 15 Giß║úi Mß╗Öng M╞í nhß║¡n giß║úi th╞░ß╗ƒng E-Voucher ß╗ƒ mß╗Ñc ΓÇ£Voucher cß╗ºa t├┤iΓÇ¥ khi ─æ─âng nhß║¡p qua app Ph├¬ La bß║▒ng sß╗æ ─æiß╗çn thoß║íi ─æ├ú ─æ─âng k├╜.\r\n─Éiß╗üu kiß╗çn sß╗¡ dß╗Ñng E-voucher:\r\n\r\n01 E-Voucher t╞░╞íng ß╗⌐ng vß╗¢i mß╗Öt ly size Ph├¬ bß║Ñt kß╗│ tß╗æi ─æa 54.000vn─æ tß║íi c├íc cß╗¡a h├áng tr├¬n khß║»p chß╗æn chill 3 miß╗ün.\r\nKh├┤ng ├íp dß╗Ñng tß║íi quß║ºy PCTC tß║íi Ph├¬ La Xu├ón Thuß╗╖ (TP. HCM) v├á Ph├¬ La Ngß╗ìc H├á (HN).\r\nE-Voucher ├íp dß╗Ñng ─æß╗æi vß╗¢i nguß╗ôn ─æ╞ín Tß║íi chß╗ù v├á Mang vß╗ü.\r\nKh├ích h├áng vß║½n ─æ╞░ß╗úc t├¡ch ─æiß╗âm dß╗▒a tr├¬n gi├í trß╗ï h├│a ─æ╞ín sau giß║úm gi├í (kh├┤ng bao gß╗ôm hß║íng Internal).\r\nE-Voucher ─æ├ú ─æ╞░ß╗úc cß║Ñp kh├┤ng c├│ gi├í trß╗ï quy ─æß╗òi th├ánh tiß╗ün mß║╖t. Nhß╗»ng E-Voucher kh├┤ng ─æ╞░ß╗úc sß╗¡ dß╗Ñng hß║┐t trong thß╗¥i hß║ín quy ─æß╗ïnh sß║╜ kh├┤ng c├▓n hiß╗çu lß╗▒c.\r\nMß╗ùi E-Voucher chß╗ë c├│ gi├í trß╗ï sß╗¡ dß╗Ñng 1 lß║ºn duy nhß║Ñt.\r\nE-Voucher c├│ hß║ín sß╗¡ dß╗Ñng ─æß║┐n hß║┐t ng├áy 30/04/2025.\r\n(*) L╞░u ├╜ khi sß╗¡ dß╗Ñng E-Voucher: Kh├ích h├áng xuß║Ñt tr├¼nh m├ú E-Voucher tr╞░ß╗¢c khi gß╗ìi m├│n, thu ng├ón scan m├ú qua m├íy v├á tiß║┐n h├ánh thanh to├ín nh╞░ b├¼nh th╞░ß╗¥ng.\r\n\r\nVII. QUY ─Éß╗èNH Vß╗Ç B├ÇI Dß╗░ THI\r\n\r\n1. Quy ─æß╗ïnh vß╗ü b├ái dß╗▒ thi: \r\n\r\nKh├┤ng giß╗¢i hß║ín sß╗æ lß║ºn dß╗▒ thi, mß╗ùi link b├ái thi ─æ╞░ß╗úc ghitr├¬n Form ─æ─âng k├╜ t╞░╞íng ─æ╞░╞íng 01 b├ái dß╗▒ thi.\r\nNß╗Öi dung/h├¼nh ß║únh kh├┤ng ─æ╞░ß╗úc ph├⌐p tr├╣ng lß║╖p nhau tr├¬n 01 nß╗ün tß║úng.\r\nNß║┐u ─Éß╗ông Chill c├│ tß╗½ 02 b├ái dß╗▒ thi trß╗ƒ l├¬n v├á c├╣ng lß╗ìt Top 20, Ph├¬ La sß║╜ lß╗▒a chß╗ìn 02 b├ái dß╗▒ thi c├│ sß╗æ ─æiß╗âm cao nhß║Ñt (trong tß╗òng sß╗æ c├íc b├ái dß╗▒ thi gß╗¡i vß╗ü) ─æß╗â v├áo chß║Ñm ─æiß╗âm ß╗ƒ ti├¬u ch├¡ 02.\r\n2. B├ái thi sß║╜ lß║¡p tß╗⌐c bß╗ï loß║íi bß╗Å m├á kh├┤ng th├┤ng b├ío tr╞░ß╗¢c nß║┐u nh╞░:\r\n\r\nChß╗⌐a h├¼nh ß║únh/nß╗Öi dung c├│ nß╗Öi dung phß║ún cß║úm, xuy├¬n tß║íc, g├óy k├¡ch ─æß╗Öng, vi phß║ím thuß║ºn phong mß╗╣ tß╗Ñc, chuß║⌐n mß╗▒c ─æß║ío ─æß╗⌐c.\r\nC├│ h├ánh vi gian lß║¡n (mua t╞░╞íng t├íc, mua b├¼nh luß║¡n, chß║íy quß║úng c├ío, spam,ΓÇª).\r\n3. ─Éß╗æi vß╗¢i quyß╗ün sß╗¡ dß╗Ñng h├¼nh ß║únh:\r\n\r\nPh├¬ La c├│ quyß╗ün sß╗¡ dß╗Ñng h├¼nh ß║únh ─æ─âng tß║úi tr├¬n c├íc k├¬nh truyß╗ün th├┤ng ch├¡nh thß╗⌐c (c├│ ghi nguß╗ôn cß╗Ñ thß╗â).\r\nPh├¬ La sß║╜ kh├┤ng chß╗ïu tr├ích nhiß╗çm vß╗ü viß╗çc tranh chß║Ñp bß║ún quyß╗ün h├¼nh ß║únh.\r\n4. Ph├¬ La c├│ to├án quyß╗ün quyß║┐t ─æß╗ïnh cuß╗æi c├╣ng trong mß╗ìi tr╞░ß╗¥ng hß╗úp','2025-06-09 15:37:58.529034','Cuß╗Öc thi CHILL LY CHILL HOA','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749458278/news/nqq8mafpy97eyctxzzzf.jpg','C├╣ng Ly T├¡m Mß╗Öng M╞í, lan tß╗Åa khoß║únh khß║»c ΓÇ£Chill Ly Chill HoaΓÇ¥ ≡ƒÄ╢','2025-06-09 15:37:58.529034'),('87a0eb03-2158-4095-965f-62367863436a','L├á nhß╗»ng ng├áy trß╗¥i cao trong vß║»t, m├¼nh lß║íi thong dong dß║ío chill trong khu v╞░ß╗¥n quen thuß╗Öc cß╗ºa b├á ΓÇô n╞íi h╞░╞íng hoa b╞░ß╗ƒi th╞ím ng├áo ngß║ít lan toß║ú khß║»p chß╗æn, n╞íi nhß╗»ng tr├íi b╞░ß╗ƒi ch├¡n khß║╜ ─æong ─æ╞░a theo l├án gi├│ h├¿. Nhß║╣ nh├áng v├á thanh m├ít, B├▓ng B╞░ß╗ƒi cß╗ºa Ph├¬ La nh╞░ ─æ├ính thß╗⌐c k├╜ ß╗⌐c vß╗ü mß╗Öt m├╣a h├¿ b├¼nh y├¬n.\r\nTr├¬n nß╗ün tr├á ├ö Long ─Éß║╖c Sß║ún quen thuß╗Öc, vß╗ï B╞░ß╗ƒi the the v├á m├ít dß╗ïu, len lß╗Åi c├╣ng Nha ─Éam gi├▓n dai sß║ºn sß║¡t. Mß╗ìi thß╗⌐ h├▓a quyß╗çn mß╗Öt c├ích c├ón bß║▒ng, vß╗½a vß║╖n ΓÇô tß╗▒a l├án gi├│ trong l├ánh l╞░ß╗¢t qua v╞░ß╗¥n b╞░ß╗ƒi, xoa dß╗ïu c├íi nß║»ng oi ß║ú buß╗òi tr╞░a h├¿.\r\nCß║ú mß╗Öt m├╣a h├¿ g├│i gß╗ìn trong B├▓ng B╞░ß╗ƒi ΓÇô ├ö Long B╞░ß╗ƒi Nha ─Éam! 20.05.2025 n├áy, mß╗¥i ─Éß╗ông Chill 03 miß╗ün chill h╞░╞íng m├╣a h├¿, ─æ├│n hß║í tß╗¢i c├╣ng Ph├¬ La nha ≡ƒÄ╢','2025-06-09 15:20:03.047187','L├á nhß╗»ng ng├áy trß╗¥i cao trong vß║»t, m├¼nh lß║íi thong dong dß║ío chill trong khu v╞░ß╗¥n quen thuß╗Öc cß╗ºa b├á ΓÇô n╞íi h╞░╞íng hoa b╞░ß╗ƒi th╞ím ng├áo ngß║ít lan toß║ú khß║»p chß╗æn, n╞íi nhß╗»ng tr├íi b╞░ß╗ƒi ch├¡n khß║╜ ─æong ─æ╞░a theo l├án gi├│ h├¿. Nhß║╣ nh├áng v├á thanh m├ít, B├▓ng B╞░ß╗ƒi cß╗ºa Ph├¬ La nh╞░ ─æ├ính thß╗⌐c k├╜ ß╗⌐c vß╗ü mß╗Öt m├╣a h├¿ b├¼nh y├¬n.\r\n','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749457202/news/vpgp1i6lz693b2zup8ut.jpg','B├▓ng B╞░ß╗ƒi ΓÇô ├ö Long B╞░ß╗ƒi Nha ─Éam','2025-06-09 15:20:03.047187'),('a729f36e-7a61-4fc0-b3c8-266d66fb12b6','G├│p nhß║╖t tinh hoa ─æß║Ñt trß╗¥i, hß║ít gß║ío tuy nhß╗Å b├⌐ nh╞░ng nu├┤i d╞░ß╗íng bao thß║┐ hß╗ç ng╞░ß╗¥i Viß╗çt m├¼nh. Tß╗½ sß╗▒ mß╗Öc mß║íc v├á th├ón th╞░╞íng ß║Ñy, Ph├¬ La hß╗ìa n├¬n Ly Gß║ío L├áng Chill ─æß║ºy chß║Ñt th╞í, mang theo cß║úm hß╗⌐ng tß╗½ n├⌐t vß║╜ tranh ─É├┤ng Hß╗ô truyß╗ün thß╗æng. Mß╗ùi chi tiß║┐t tr├¬n ly l├á tß╗½ng th╞░ß╗¢c phim chß║¡m r├úi tua vß╗ü h├¼nh ß║únh Hß║ít Gß║ío L├áng Chill, n╞íi em b├⌐ mß╗Ñc ─æß╗ông thong dong giß╗»a biß╗ân v├áng l├║a ch├¡n.','2025-06-09 15:40:02.070695','Tß╗½ 01.04.2025, mß╗¥i bß║ín vß╗ü L├áng Chill, chill giß╗»a biß╗ân v├áng c├╣ng Ly Gß║ío tß║íi Ph├¬ La 03 miß╗ün nha ≡ƒÄ╢','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749458401/news/xn5w2f5iacwky4fuuanr.jpg','LY Gß║áO L├ÇNG CHILL ≡ƒÄ╢≡ƒî╛','2025-06-09 15:40:02.070695'),('f345b8ed-637b-4dd2-975b-4ed3f4ce4beb','I. ─Éß╗ÉI T╞»ß╗óNG Dß╗░ THI\r\n\r\nTß║Ñt cß║ú ─Éß╗ông Chill 03 miß╗ün (chß╗ë ├íp dß╗Ñng vß╗¢i t├ái khoß║ún c├í nh├ón)\r\n\r\nII. THß╗é Lß╗å V├Ç H├îNH THß╗¿C Dß╗░ THI\r\n\r\nTß╗½ ng├áy 15 ΓÇô  18/03/2025 (4 ng├áy), Ph├¬ La gß╗¡i tß║╖ng postcard Hß║ít Gß║ío L├áng Chill cho mß╗ìi ho├í ─æ╞ín bß║Ñt kß╗│ tß╗½ 100.000vn─æ.\r\nPostcard Hß║ít Gß║ío L├áng Chill mang theo k├╜ ß╗⌐c vß╗ü h├¼nh ß║únh c├ính ─æß╗ông l├║a ch├¡n v├áng ╞░╞ím, c├╣ng niß╗üm tß╗▒ h├áo ΓÇ£hß║ít gß║ío l├áng taΓÇ¥ cß╗ºa ng╞░ß╗¥i Viß╗çt, lß║Ñy cß║úm hß╗⌐ng tß╗½ n├⌐t vß║╜ cß╗ºa Tranh ─É├┤ng Hß╗ô truyß╗ün thß╗æng.\r\nTß╗½ ng├áy 15 ΓÇô 21/03/2025, Ph├¬ La tß╗ò chß╗⌐c cuß╗Öc thi ΓÇ£Gieo Vß║ºn Chill Chill ΓÇô Gß║╖t ΓÇ£Bß╗ô Lß╗Ña Gß║íoΓÇ¥ gß╗ôm 04 b╞░ß╗¢c tham gia:\r\nB╞░ß╗¢c 1: T╞»╞áNG T├üC v├á CHIA Sß║║/─É─éNG Lß║áI b├ái viß║┐t n├áy vß╗ü trang c├í nh├ón Facebook/Threads ß╗ƒ chß║┐ ─æß╗Ö C├öNG KHAI.\r\n\r\nB╞░ß╗¢c 2: ─Éß╗ông Chill tß╗▒ do s├íng tß║ío gieo vß║ºn v├á viß║┐t tr├¬n postcard Hß║ít Gß║ío L├áng Chill vß╗¢i:\r\n\r\nChß╗º ─æß╗ü: Vß╗Ñ M├╣a & L├║a Gß║ío \r\nThß╗â loß║íi: Gieo vß║ºn tß╗▒ do tß╗æi ─æa 05 c├óu.\r\nB╞░ß╗¢c 3:\r\n\r\n─Éß╗æi vß╗¢i Facebook: ─É─âng tß║úi h├¼nh ß║únh b├ái th╞í tr├¬n postcard ΓÇ£Hß║ít Gß║ío L├áng ChillΓÇ¥ tr├¬n trang Facebook c├í nh├ón d╞░ß╗¢i chß║┐ ─æß╗Ö c├┤ng khai b├ái ─æ─âng & l╞░ß╗út t╞░╞íng t├íc (reaction, b├¼nh luß║¡n & chia sß║╗) k├¿m hashtag #PheLa #├öLongSß╗»aT╞░╞íiPh├¬La #GieoVß║ºnChillChill\r\n─Éß╗æi vß╗¢i Threads: ─É─âng tß║úi h├¼nh ß║únh b├ái th╞í tr├¬n postcard Hß║ít Gß║ío L├áng Chill d╞░ß╗¢i phß║ºn b├¼nh luß║¡n b├ái c├┤ng bß╗æ cuß╗Öc thi cß╗ºa Ph├¬ La ß╗ƒ chß║┐ ─æß╗Ö c├┤ng khai b├ái ─æ─âng & l╞░ß╗út t╞░╞íng t├íc (reaction, b├¼nh luß║¡n & ─æ─âng lß║íi) k├¿m hashtag #PheLa #├öLongSß╗»aT╞░╞íiPh├¬La #GieoVß║ºnChillChill\r\nB╞░ß╗¢c 4: Sao ch├⌐p link b├ái dß╗▒ thi v├á ─æiß╗ün th├┤ng tin v├áo Form ─æ─âng k├╜ dß╗▒ thi tß║íi ─É├éY.\r\n\r\nL╞░u ├╜: Ph├¬ La chß╗ë ghi nhß║¡n b├ái dß╗▒ thi ─æ├ú thß╗▒c hiß╗çn ─æß╗º 04 b╞░ß╗¢c tr├¬n v├á t├¡nh ─æiß╗âm b├¼nh chß╗ìn ─æß║┐n hß║┐t 23:59 ng├áy 21/03/2025.\r\n\r\n─Éß╗ông Chill h├úy k├¬u gß╗ìi bß║ín b├¿ t╞░╞íng t├íc v├á chia sß║╗ cho cß║úm hß╗⌐ng s├íng tß║ío Gieo Vß║ºn Chill Chill cß╗ºa m├¼nh bß║ín nh├⌐!\r\n\r\nIII. THß╗£I GIAN TRIß╗éN KHAI CUß╗ÿC THI\r\n\r\nThß╗¥i gian nhß║¡n b├ái dß╗▒ thi: Tß╗½ 07:00ΓÇÖ 15/03/2025 ─æß║┐n hß║┐t 23:59ΓÇÖ ng├áy 21/03/2025\r\nThß╗¥i gian c├┤ng bß╗æ kß║┐t quß║ú: 25.03.2025 tr├¬n trang Facebook/Threads ch├¡nh thß╗⌐c cß╗ºa Ph├¬ La\r\nThß╗¥i gian nhß║¡n giß║úi th╞░ß╗ƒng: 31.03.2025\r\nIII. TI├èU CH├ì ─É├üNH GI├ü\r\n\r\nB├ái dß╗▒ thi sß║╜ ─æ╞░ß╗úc t├¡nh ─æiß╗âm dß╗▒a tr├¬n 02 ti├¬u ch├¡, Ph├¬ La sß║╜ chß╗ìn ra Top 20 ─Éß╗ông Chill c├│ tß╗òng sß╗æ ─æiß╗âm cao nhß║Ñt ß╗ƒ cß║ú 02 ti├¬u ch├¡ v├á tiß║┐n h├ánh trao giß║úi vß╗¢i c├ích t├¡nh nh╞░ sau:\r\n\r\nTß╗öNG ─ÉIß╗éM B├ÇI Dß╗░ THI = 70% x ─Éiß╗âm do ─Éß╗ông Chill B├¼nh Chß╗ìn + 30% x ─Éiß╗âm do Ph├¬ La ─æ├ính gi├í\r\n\r\nV. GIß║óI TH╞»ß╗₧NG\r\n\r\nGiß║úi th╞░ß╗ƒng S├íng Tß║ío d├ánh cho Top 10 c├│ sß╗æ ─æiß╗âm cao nhß║Ñt: Mß╗ùi th├¡ sinh nhß║¡n ─æ╞░ß╗úc 01 Bß╗ô (Lß╗Ña) Gß║ío bao gß╗ôm c├íc Merchandise cß╗ºa Ph├¬ La: \r\n\r\n01 Hß╗Öp Phin giß║Ñy ├ö Long Nh├ái Sß╗»a/ ├ö Long Sß╗»a (Hß╗Öp 10 phin)\r\n01 Hß╗Öp Qu├á Tr├á Sß╗»a Tiß╗çn Lß╗úi (06 ly tr├á sß╗»a ├ö Long ─Éß║╖c Sß║ún)\r\n01 C├á Ph├¬ Phin Giß║Ñy ΓÇô Ph├¬ Truffle (Hß╗Öp 12 Phin)\r\n01 Hß╗Öp Tr├ón Ch├óu Gß║ío Rang 500gram\r\n01 Lon Lß╗Ña Gß║ío lon 500ml & 01 Lon Lß╗Ña ─É├áo lon 500m\r\n05 E-Voucher Chill Lß╗Ña Gß║ío hoß║╖c Lß╗Ña ─É├áo (size Ph├¬) Ph├¬ La Miß╗àn Ph├¡\r\nGiß║úi th╞░ß╗ƒng Nhiß╗çt Huyß║┐t d├ánh cho Top 10 b├ái dß╗▒ thi nß║▒m trong Top 20 (kh├┤ng bao gß╗ôm Top 10): Mß╗ùi th├¡ sinh nhß║¡n ─æ╞░ß╗úc ΓÇ£02 E-Voucher Chill Lß╗Ña Gß║ío hoß║╖c Lß╗Ña ─É├áo (size Ph├¬) Miß╗àn Ph├¡ΓÇ¥\r\n\r\nVI. C├ích thß╗⌐c trao v├á nhß║¡n giß║úi: \r\n\r\nNg├áy 25/03/2025: BTC sß║╜ c├┤ng bß╗æ ─Éß╗ông Chill thß║»ng giß║úi cß╗ºa cuß╗Öc thi tr├¬n trang Facebook/Threads ch├¡nh thß╗⌐c cß╗ºa Ph├¬ La.\r\nNg├áy 25 ΓÇô 26/03/2025: BTC gß╗ìi x├íc nhß║¡n qua sß╗æ ─æiß╗çn thoß║íi ─æ─âng k├╜ nhß║¡n giß║úi (S─ÉT khi ─æiß╗ün form ─æ─âng k├╜ dß╗▒ thi).\r\nNg├áy 31/03/2025: \r\nVß╗¢i Top 10 Giß║úi ─Éß║╖c Biß╗çt: ─Éß╗ông Chill nhß║¡n giß║úi th╞░ß╗ƒng Bß╗ô Gß║ío trß╗▒c tiß║┐p tß║íi chß╗æn chill ─æ╞░ß╗úc Ph├¬ La cung cß║Ñp.\r\nVß╗¢i Top 20 Giß║úi Nhiß╗çt Huyß║┐t: ─Éß╗ông Chill nhß║¡n giß║úi th╞░ß╗ƒng E-Voucher ß╗ƒ mß╗Ñc ΓÇ£Voucher cß╗ºa t├┤iΓÇ¥ khi ─æ─âng nhß║¡p qua app Ph├¬ La bß║▒ng sß╗æ ─æiß╗çn thoß║íi ─æ├ú ─æ─âng k├╜.\r\n─Éiß╗üu kiß╗çn sß╗¡ dß╗Ñng E-voucher:\r\n\r\nMß╗Öt E-Voucher t╞░╞íng ß╗⌐ng vß╗¢i mß╗Öt ly size Ph├¬ bß║Ñt kß╗│ tß╗æi ─æa 54.000vn─æ tß║íi c├íc cß╗¡a h├áng tr├¬n khß║»p chß╗æn chill 3 miß╗ün.\r\nKh├┤ng ├íp dß╗Ñng tß║íi quß║ºy PCTC tß║íi Ph├¬ La Xu├ón Thuß╗╖ (TP. HCM) v├á Ph├¬ La Ngß╗ìc H├á (HN).\r\nE-Voucher ├íp dß╗Ñng ─æß╗æi vß╗¢i nguß╗ôn ─æ╞ín Tß║íi chß╗ù v├á Mang vß╗ü.\r\nKh├ích h├áng xuß║Ñt tr├¼nh m├ú E-Voucher tr╞░ß╗¢c khi gß╗ìi m├│n, thu ng├ón scan m├ú qua m├íy v├á tiß║┐n h├ánh thanh to├ín nh╞░ b├¼nh th╞░ß╗¥ng.\r\nKh├ích h├áng vß║½n ─æ╞░ß╗úc t├¡ch ─æiß╗âm dß╗▒a tr├¬n gi├í trß╗ï h├│a ─æ╞ín sau giß║úm gi├í (kh├┤ng bao gß╗ôm hß║íng Internal).\r\nE-Voucher ─æ├ú ─æ╞░ß╗úc cß║Ñp kh├┤ng c├│ gi├í trß╗ï quy ─æß╗òi th├ánh tiß╗ün mß║╖t. Nhß╗»ng E-Voucher kh├┤ng ─æ╞░ß╗úc sß╗¡ dß╗Ñng hß║┐t trong thß╗¥i hß║ín quy ─æß╗ïnh sß║╜ kh├┤ng c├▓n hiß╗çu lß╗▒c.\r\nMß╗ùi E-Voucher chß╗ë c├│ gi├í trß╗ï sß╗¡ dß╗Ñng 1 lß║ºn duy nhß║Ñt.\r\nE-Voucher c├│ hß║ín sß╗¡ dß╗Ñng ─æß║┐n hß║┐t ng├áy 30/04/2025.\r\nVII. QUY ─Éß╗èNH Vß╗Ç B├ÇI Dß╗░ THI\r\n\r\n1. Quy ─æß╗ïnh vß╗ü b├ái dß╗▒ thi: \r\n\r\nKh├┤ng giß╗¢i hß║ín sß╗æ lß║ºn dß╗▒ thi, mß╗ùi form ─æ─âng k├╜ t╞░╞íng ─æ╞░╞íng 01 b├ái dß╗▒ thi.\r\nNß╗Öi dung/h├¼nh ß║únh kh├┤ng ─æ╞░ß╗úc ph├⌐p tr├╣ng lß║╖p nhau tr├¬n 01 nß╗ün tß║úng.\r\nNß║┐u ─Éß╗ông Chill c├│ tß╗½ 02 b├ái dß╗▒ thi trß╗ƒ l├¬n v├á c├╣ng lß╗ìt Top 20, Ph├¬ La sß║╜ lß╗▒a chß╗ìn 02 b├ái dß╗▒ thi c├│ sß╗æ ─æiß╗âm cao nhß║Ñt (trong tß╗òng sß╗æ c├íc b├ái dß╗▒ thi gß╗¡i vß╗ü) ─æß╗â v├áo chß║Ñm ─æiß╗âm ß╗ƒ ti├¬u ch├¡ 02.\r\n2. B├ái thi sß║╜ lß║¡p tß╗⌐c bß╗ï loß║íi bß╗Å m├á kh├┤ng th├┤ng b├ío tr╞░ß╗¢c nß║┐u nh╞░:\r\n\r\nChß╗⌐a h├¼nh ß║únh/nß╗Öi dung c├│ nß╗Öi dung phß║ún cß║úm, xuy├¬n tß║íc, g├óy k├¡ch ─æß╗Öng, vi phß║ím thuß║ºn phong mß╗╣ tß╗Ñc, chuß║⌐n mß╗▒c ─æß║ío ─æß╗⌐c.\r\nC├│ h├ánh vi gian lß║¡n (mua t╞░╞íng t├íc, mua b├¼nh luß║¡n, chß║íy quß║úng c├ío, spam,ΓÇª).\r\n3. ─Éß╗æi vß╗¢i quyß╗ün sß╗¡ dß╗Ñng h├¼nh ß║únh:\r\n\r\nPh├¬ La c├│ quyß╗ün sß╗¡ dß╗Ñng h├¼nh ß║únh ─æ─âng tß║úi tr├¬n c├íc k├¬nh truyß╗ün th├┤ng ch├¡nh thß╗⌐c (c├│ ghi nguß╗ôn cß╗Ñ thß╗â).\r\nPh├¬ La sß║╜ kh├┤ng chß╗ïu tr├ích nhiß╗çm vß╗ü viß╗çc tranh chß║Ñp bß║ún quyß╗ün h├¼nh ß║únh.\r\n4. Ph├¬ La c├│ to├án quyß╗ün quyß║┐t ─æß╗ïnh cuß╗æi c├╣ng trong mß╗ìi tr╞░ß╗¥ng hß╗úp','2025-06-09 15:41:49.801256','Tß╗½ ng├áy 15 ΓÇô  18/03/2025 (4 ng├áy), Ph├¬ La gß╗¡i tß║╖ng postcard Hß║ít Gß║ío L├áng Chill cho mß╗ìi ho├í ─æ╞ín bß║Ñt kß╗│ tß╗½ 100.000vn─æ.\r\nTß╗½ ng├áy 15 ΓÇô 21/03/2025, Ph├¬ La tß╗ò chß╗⌐c cuß╗Öc thi ΓÇ£Gieo Vß║ºn Chill Chill ΓÇô Gß║╖t ΓÇ£Bß╗ô Lß╗Ña Gß║íoΓÇ¥ ','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749458509/news/me2intzwjimq84op1fun.jpg','Cuß╗Öc thi ΓÇ£Gieo Vß║ºn Chill Chill ΓÇô Gß║╖t Bß╗ô Lß╗Ña Gß║íoΓÇ¥ Ph├¬ La','2025-06-09 15:53:59.103335');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_item_id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (23,128000,NULL,2,'e4ce9b4e-83e4-4c62-8683-2d93a339b52e','3de0f821-49fb-4495-9f8f-9bc576d82dd6'),(24,54000,'70% ─æ╞░ß╗¥ng, 100% ─æ├í',1,'e4ce9b4e-83e4-4c62-8683-2d93a339b52e','7166c0c6-a190-4ddc-b00a-62b14d145f34'),(25,69000,'50% ─æ╞░ß╗¥ng, 50% ─æ├í',1,'e4ce9b4e-83e4-4c62-8683-2d93a339b52e','abfa7f77-8f87-48c7-8a46-b98e1e635025'),(26,50000,'',1,'0e28aba8-43bb-445e-85fc-f029d9fd5976','211e7a8b-8720-4981-998d-2b9c93c1aa09'),(27,50000,'',1,'0e28aba8-43bb-445e-85fc-f029d9fd5976','f72a7447-c08f-4448-b6a3-ba702bfc9a75'),(28,69000,'',1,'a569ba4f-2b32-45cb-a6ba-bcad3b684a38','b4f660e2-e09a-4ede-8afc-69b4a2b12448'),(29,64000,'70% ─æ╞░ß╗¥ng, 100% ─æ├í',1,'a74dd3de-30b3-4db5-ae2f-720cfe451ba9','c976d479-fe11-4279-80a5-75c0ddf2f1c8'),(30,108000,'',1,'a74dd3de-30b3-4db5-ae2f-720cfe451ba9','53a119fc-b99e-4241-aa93-a5d602813b2f'),(31,10000,'',1,'a74dd3de-30b3-4db5-ae2f-720cfe451ba9','a0f5b903-6086-4b9c-8970-aa8581a5f89c');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `final_amount` double NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `payment_method` enum('BANK_TRANSFER','COD') NOT NULL,
  `payment_status` enum('AWAITING_PAYMENT','COMPLETED','FAILED','PENDING') NOT NULL,
  `shipping_fee` double NOT NULL,
  `status` enum('CANCELLED','CONFIRMED','DELIVERED','DELIVERING','PENDING') NOT NULL,
  `total_amount` double NOT NULL,
  `total_discount` double DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `address_id` varchar(255) NOT NULL,
  `branch_id` varchar(255) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `UKdhk2umg8ijjkg4njg6891trit` (`order_code`),
  KEY `FKf5464gxwc32ongdvka2rtvw96` (`address_id`),
  KEY `FK53yogclg5ufvhbm3n14lsn2vo` (`branch_id`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  CONSTRAINT `FK53yogclg5ufvhbm3n14lsn2vo` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_code`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKf5464gxwc32ongdvka2rtvw96` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('0e28aba8-43bb-445e-85fc-f029d9fd5976',NULL,101168,'ORD00002','2025-06-11 23:55:26.108156','BANK_TRANSFER','COMPLETED',11168,'CONFIRMED',100000,10000,'2025-06-11 23:55:47.238112','5c824f9d-209d-4a2c-8cdf-28ea877ef51c','CH0002','6339bd20-0f50-4053-bfc2-16536757389d'),('a569ba4f-2b32-45cb-a6ba-bcad3b684a38',NULL,80168,'ORD00003','2025-06-11 23:56:18.688043','COD','PENDING',11168,'CONFIRMED',69000,0,'2025-06-11 23:56:26.808499','5c824f9d-209d-4a2c-8cdf-28ea877ef51c','CH0002','6339bd20-0f50-4053-bfc2-16536757389d'),('a74dd3de-30b3-4db5-ae2f-720cfe451ba9',NULL,193168,'ORD00004','2025-06-11 23:56:57.437630','COD','PENDING',11168,'CONFIRMED',182000,0,'2025-06-11 23:57:03.414350','5c824f9d-209d-4a2c-8cdf-28ea877ef51c','CH0002','6339bd20-0f50-4053-bfc2-16536757389d'),('e4ce9b4e-83e4-4c62-8683-2d93a339b52e','2025-06-11 23:55:07.103026',262168,'ORD00001','2025-06-11 23:54:49.485645','COD','COMPLETED',11168,'DELIVERED',251000,0,'2025-06-11 23:55:07.104026','5c824f9d-209d-4a2c-8cdf-28ea877ef51c','CH0002','6339bd20-0f50-4053-bfc2-16536757389d');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `original_price` double NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `status` tinyint DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_code` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `UKhcpr86kgtroqvxu1mxoyx4ahm` (`product_code`),
  KEY `FKq2is6nuh9082to0kr959h9tum` (`category_code`),
  CONSTRAINT `FKq2is6nuh9082to0kr959h9tum` FOREIGN KEY (`category_code`) REFERENCES `category` (`category_code`),
  CONSTRAINT `product_chk_1` CHECK ((`status` between 0 and 1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('0227b7a8-1a76-410a-97df-00fb0ebb6557','2025-06-11 23:50:15.551465','├ö Long Nhiß╗çt ─Éß╗¢i sß╗▒ kß║┐t hß╗úp ho├án hß║úo giß╗»a Tr├á ├ö Long ─Éß║╖c Sß║ún ho├á quyß╗çn c├╣ng tr├íi c├óy nhiß╗çt ─æß╗¢i tß║ío n├¬n h╞░╞íng vß╗ï t╞░╞íi m├ít, nhß║╣ nh├áng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660615/products/awne5yxtkvwfvqe46exg.jpg',54000,'SP0049','├ö Long Nhi├¬╠út ─É╞í╠üi',1,'2025-06-11 23:50:15.551465','DM0005'),('06bd8f2c-84f2-4e37-a900-16c09ed461a1','2025-06-11 23:40:45.184617','Tr├á ├ö Long ─É├áo - sß╗▒ kß║┐t hß╗úp ho├án hß║úo giß╗»a vß╗ï tr├á thanh nhß║╣, vß╗ï ngß╗ìt thanh m├ít cß╗ºa nhß╗»ng miß║┐ng ─æ├áo t╞░╞íi ngon, mang ─æß║┐n cho bß║ín trß║úi nghiß╗çm v├┤ c├╣ng tuyß╗çt vß╗¥i.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660044/products/p98ks79blebieh5rsiaq.jpg',69000,'SP0039','├ö Long ─Éa╠Ço ─Éo╠ë (Size La)',1,'2025-06-11 23:40:45.184617','DM0004'),('09876ecb-c91c-4b0e-a029-d032cf632f11','2025-06-05 05:25:24.673956','Kh├│i B\'Lao sß╗▒ ho├á quyß╗çn cß╗ºa c├íc tß║ºng h╞░╞íng: Nß╗æt h╞░╞íng ─æß║ºu l├á kh├│i ─æß║¡m, h╞░╞íng giß╗»a l├á kh├│i nhß║╣ & ─æß╗ìng lß║íi ß╗ƒ hß║¡u vß╗ï l├á h╞░╞íng hoa ngß╗ìc lan.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749075920/products/vm6mwp6oeir9tdpbg7iy.jpg',54000,'SP0013','Kh├│i B\'Lao',1,'2025-06-05 05:25:24.673956','DM0002'),('0ec8143e-9147-4cce-8512-bd9a2a71ccbc','2025-06-05 05:29:40.397751','Kß╗│ kß╗│, cß╗ì cß╗ì, lß╗ì mß╗ì vß║½n chill c├╣ng Bß╗ìt biß╗ân Ph├¬ La. Tiß║┐p th├¬m n─âng l╞░ß╗úng t├¡ch cß╗▒c cho ─Éß╗ông Chill kß╗â cß║ú khi l├ám viß╗çc nh├á.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749076176/products/zb5ymyjoqfkzk1bobp3a.jpg',25000,'SP0019','Bß╗ìt biß╗ân Ph├¬ La - ├ö Long Sß╗»a Ph├¬ La',1,'2025-06-05 05:29:40.398747','DM0009'),('12713ae0-eb2c-4913-ac97-6c72d32f464f','2025-06-04 17:07:02.257458','├ö Long Sß╗»a Ph├¬ La - Mang ─æß║┐n trß║úi nghiß╗çm vß╗ï gi├íc tuyß╗çt vß╗¥i vß╗¢i h╞░╞íng tr├á ├ö Long ─æß║╖c sß║ún ─æß║¡m ─æ├á quyß╗çn c├╣ng vß╗ï sß╗»a th╞ím ngß║¡y.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031618/products/dg8xtjw3ciuyujoj1fc1.jpg',54000,'SP0006','├ö long sß╗»a Ph├¬ La',1,'2025-06-04 17:07:02.257458','DM0001'),('173609ec-fd6b-4e22-9f4b-d0a9a45acf74','2025-06-11 23:40:01.326951','Tr├á Vß╗Å C├á Ph├¬ - thß╗⌐c uß╗æng ─æß╗Öc ─æ├ío ─æ╞░ß╗úc l├ám tß╗½ vß╗Å quß║ú c├á ph├¬, h╞░╞íng tr├á th╞ím nhß║╣ h├▓a quyß╗çn c├╣ng vß╗ï chua dß╗ïu cß╗ºa chanh v├áng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660000/products/naefkpqslfwwarlefxo0.jpg',69000,'SP0038','Tra╠Ç Vo╠ë Ca╠Ç Ph├¬ (Size La)',1,'2025-06-11 23:40:01.326951','DM0004'),('211e7a8b-8720-4981-998d-2b9c93c1aa09','2025-06-11 23:25:50.752202','C├á Ph├¬ ─Éß║╖c Sß║ún vß╗¢i nß╗æt h╞░╞íng: Peach - Orange - Juicy Body - Sweet Aftertaste With Chocolate.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659150/products/bd2dos2vndffo0mpt1vo.jpg',50000,'SP0021','Ph├¬ ESPRESSO (Hß║ít Colom, Ethi)',1,'2025-06-11 23:25:50.753195','DM0003'),('2479d73b-d7b1-4574-b989-5c67118fbe03','2025-06-04 17:06:16.889638','Th╞░ß╗ƒng thß╗⌐c bß║ún giao h╞░ß╗ƒng ho├án hß║úo cß╗ºa h╞░╞íng vß╗ï vß╗¢i Ph├╣ V├ón - Tuyß╗çt phß║⌐m tr├á ├ö Long ─Éß╗Å th╞░ß╗úng hß║íng kß║┐t hß╗úp c├╣ng kem whipping nhß║╣ nh├áng, s├ính ngß║¡y.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031572/products/a37zci4pmilyist0vudn.jpg',45000,'SP0005',' Ph├╣ v├ón',1,'2025-06-04 17:06:16.889638','DM0001'),('28751a90-0eb8-4808-9c4a-4f4c7a5408cf','2025-06-11 23:27:02.332172','C├á Ph├¬ vß╗¢i nß╗æt h╞░╞íng: Dark Chocolate - Roasted Walnut - Strong Body - Long Aftertaste With Chocolate.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659221/products/dgmegoe41pby02l4vpxm.jpg',45000,'SP0022','Ph├¬ ESPRESSO (Hß║ít Ro, Ara)',1,'2025-06-11 23:27:02.332172','DM0003'),('2cba77e5-74cc-4da0-ac81-34ea002c86df','2025-06-11 23:34:33.392691','Ph├¬ N├óu c├│ vß╗ï chua nhß║╣ tß╗▒ nhi├¬n cß╗ºa hß║ít Arabica Cß║ºu ─Éß║Ñt kß║┐t hß╗úp c├╣ng Robusta Gia Lai ─æ╞░ß╗úc tuyß╗ân chß╗ìn kß╗╣ l╞░ß╗íng, ho├á quyß╗çn c├╣ng sß╗»a ─æß║╖c ─æem ─æß║┐n h╞░╞íng vß╗ï ─æß║¡m m╞░ß╗út v├á gß║ºn g┼⌐i.  ','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659672/products/sfo2375ht5urjxehyzg9.jpg',39000,'SP0031','Ph├¬ n├óu',1,'2025-06-11 23:34:33.392691','DM0003'),('34bf1efd-d544-4fd0-8e94-2a49a6f21a5c','2025-06-11 23:39:18.365242','Tr├á ├ö Long Lß╗Ña ─É├áo th╞ím hoa ngß╗ìt ng├áo, kß║┐t hß╗úp c├╣ng Sß╗»a T╞░╞íi Thanh Tr├╣ng Ph├¬ La, kß║┐t hß╗úp c├╣ng ß╗Éng H├║t Bung H╞░╞íng mang ─æß║┐n trß║úi nghiß╗çm t╞░╞íi m├ít & nhß║╣ nh├áng.\n','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659957/products/dpi4vdmopuqscgcohx95.jpg',54000,'SP0037','Lß╗Ña ─æ├áo - ├ö long ─æ├áo sß╗»a t╞░╞íi',1,'2025-06-11 23:39:18.365242','DM0004'),('3de0f821-49fb-4495-9f8f-9bc576d82dd6','2025-06-11 23:46:08.257992','Tr├á ├ö Long ─Éß║╖c Sß║ún kß║┐t hß╗úp c├╣ng vß╗ï B╞░ß╗ƒi the m├ít, th├¬m Vß╗Å B╞░ß╗ƒi sß║Ñy v├á Nha ─Éam gi├▓n dai sß║ºn sß║¡t, mang ─æß║┐n h╞░╞íng vß╗ï thanh m├ít & nhß║╣ nh├áng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660367/products/kezm4xipsswwjalxz2rt.jpg',64000,'SP0044','B├▓ng b╞░ß╗ƒi - ├ö long b╞░ß╗ƒi nha ─æam',1,'2025-06-11 23:46:08.257992','DM0005'),('4124cec7-1ec6-4e25-9d7f-feb035f636de','2025-06-11 23:36:41.896524','Tr├á ├ö Long Gß║ío Rang th╞ím hoa ngß╗ìt ng├áo, kß║┐t hß╗úp c├╣ng Sß╗»a T╞░╞íi Thanh Tr├╣ng Ph├¬ La, mang ─æß║┐n trß║úi nghiß╗çm mß╗üm m╞░ß╗út, t╞░╞íi m├ít & nhß║╣ nh├áng. Sß╗¡ dß╗Ñng k├¿m ß╗Éng H├║t Bung H╞░╞íng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659801/products/ar8zzzvuc5mmdkthchyt.jpg',69000,'SP0034','Lß╗Ña gß║ío - ├ö long gß║ío sß╗»a t╞░╞íi (Size La)',1,'2025-06-11 23:36:41.896524','DM0004'),('4d68e5f4-49d8-4697-9a62-c45d5c86ccd6','2025-06-11 23:32:51.707275','C├á Ph├¬ ─Éß║╖c Sß║ún vß╗¢i nß╗æt h╞░╞íng: Peach - Orange - Juicy Body - Sweet Aftertaste With Chocolate.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659571/products/kgl53vbt4csmynjlatlh.jpg',50000,'SP0028','Ph├¬ AME (Hß║ít Colom, Ethi)',1,'2025-06-11 23:32:51.707275','DM0003'),('5139aeeb-2afb-457e-b079-59e8b2d94ebd','2025-06-11 23:35:33.656450','C├á ph├¬ Arabica ─É├á Lß║ít ─æß║¡m ─æ├á ho├á quyß╗çn c├╣ng kem whipping th╞ím ngß║¡y.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659733/products/jffpdnjux1dptacpzarl.jpg',45000,'SP0033','─É├á lß║ít',1,'2025-06-11 23:35:33.656450','DM0003'),('53a119fc-b99e-4241-aa93-a5d602813b2f','2025-06-05 05:30:18.456108','Lon 500ml. Tr├á ├ö Long Gß║ío Rang th╞ím hoa ngß╗ìt ng├áo, kß║┐t hß╗úp c├╣ng Sß╗»a T╞░╞íi Thanh Tr├╣ng. HSD 3 ng├áy tß╗½ NSX. Bß║úo quß║ún 2-5 ─æß╗Ö C. Lß║»c ─æß╗üu tr╞░ß╗¢c khi d├╣ng. Sß╗¡ dß╗Ñng trong v├▓ng 24h sau khi mß╗ƒ nß║»p.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749076214/products/urtyuaijamb0leytlpwn.jpg',108000,'SP0020','Plus - Lß╗Ña gß║ío',1,'2025-06-05 05:30:18.456108','DM0007'),('57a079f2-91a4-4aac-8198-b25fddabd9eb','2025-06-04 17:07:46.074681','├ö Long Nh├ái sß╗»a - Mang ─æß║┐n trß║úi nghiß╗çm vß╗ï gi├íc ─æß╗Öc ─æ├ío vß╗¢i tr├á ├ö Long ─Éß║╖c Sß║ún ─æß║¡m ─æ├á quyß╗çn c├╣ng h╞░╞íng nh├ái th╞ím tinh tß║┐, th├¬m ch├║t th╞ím ngß║¡y tß╗½ sß╗»a.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031662/products/oq2s8jfhnakbg9nsyuqp.jpg',54000,'SP0007','├ö long nh├ái sß╗»a',1,'2025-06-04 17:07:46.074681','DM0001'),('5825a685-f28d-40de-88a8-9cdfea4b8757','2025-06-11 23:27:35.935961','C├á Ph├¬ ─Éß║╖c Sß║ún vß╗¢i nß╗æt h╞░╞íng: Peach - Orange - Juicy Body - Sweet Aftertaste With Chocolate. Sß║ún phß║⌐m c├│ thß╗â d├╣ng n├│ng/─æ├í.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659255/products/bzbr24etx0wr1knbi263.jpg',59000,'SP0023','Ph├¬ LATTE (Hß║ít Colom, Ethi)',1,'2025-06-11 23:27:35.935961','DM0003'),('5b3929a6-1ea2-4dce-a096-b223929d5221','2025-06-11 23:41:31.772710','Gß║Ñm sß╗▒ kß║┐t hß╗úp giß╗»a Tr├á ├ö Long Vß║úi th╞ím m├ít c├╣ng vß╗¢i tr├íi vß║úi c─âng mß╗ìng, ─æem ─æß║┐n d╞░ vß╗ï ngß╗ìt m├ít v├á thanh khiß║┐t.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660091/products/dwqumwnae90fp4fynhuh.jpg',69000,'SP0040','Gß║Ñm (Size La)',1,'2025-06-11 23:41:31.772710','DM0004'),('7166c0c6-a190-4ddc-b00a-62b14d145f34','2025-06-11 23:49:33.842026','Lang Biang vß╗¢i h╞░╞íng vß╗ï thuß║ºn khiß║┐t cß╗ºa tr├á ├ö Long ─Éß║╖c Sß║ún c├╣ng mß╗⌐t hoa nh├ái th╞ím nhß║╣.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660573/products/mzpbtzqhzqccijk8we0y.jpg',54000,'SP0048','Lang Biang',1,'2025-06-11 23:49:33.842026','DM0005'),('7b2d1b9b-55ec-49de-ba6d-46998a6d0c80','2025-06-05 05:26:02.967154','Tß║Ñm l├á sß╗▒ kß║┐t hß╗úp ho├án hß║úo giß╗»a vß╗ï ─æß║¡m ─æ├á cß╗ºa tr├á ├ö Long v├á h╞░╞íng th╞ím b├╣i cß╗ºa gß║ío rang nguy├¬n chß║Ñt, mang ─æß║┐n thß╗⌐c uß╗æng ─æß╗Öc ─æ├ío v├á ─æß║ºy hß║Ñp dß║½n.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749075958/products/glhfvh95ttiw1glz8mc8.jpg',54000,'SP0014','Tß║Ñm',1,'2025-06-05 05:26:02.967154','DM0002'),('7d0696d3-13f0-4199-ba63-a6d1c426501b','2025-06-05 05:22:29.158963','Matcha Coco Latte vß╗¢i Lß╗¢p kem ├ö Long Matcha bß╗ông bß╗ünh s├ính mß╗ïn ho├á quyß╗çn c├╣ng sß╗»a dß╗½a Bß║┐n Tre hß╗»u c╞í ngß╗ìt th╞ím.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749075745/products/vrhwm2dnx9yezbifqtht.jpg',59000,'SP0010','Matcha coco latte',1,'2025-06-05 05:22:29.158963','DM0006'),('81d7ed44-2764-4370-90b0-8b9bef231dce','2025-06-11 23:29:41.513422','C├á Ph├¬ ─Éß║╖c Sß║ún vß╗¢i nß╗æt h╞░╞íng: Peach - Orange - Juicy Body - Sweet Aftertaste With Chocolate. Sß║ún phß║⌐m c├│ thß╗â d├╣ng n├│ng/─æ├í.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659381/products/wxqusttexvv8npegjrhl.jpg',59000,'SP0026','Ph├¬ CAPPU (Hß║ít Colom, Ethi)',1,'2025-06-11 23:29:41.513422','DM0003'),('8fedcde7-2781-4277-a06c-0a9285dd16a9','2025-06-11 23:32:03.285706','C├á Ph├¬ vß╗¢i nß╗æt h╞░╞íng: Dark Chocolate - Roasted Walnut - Strong Body - Long Aftertaste With Chocolate.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659522/products/ldnulepvmam8wt8t7j0n.jpg',45000,'SP0027','Ph├¬ AME (Hß║ít Ro, Ara)',1,'2025-06-11 23:32:03.285706','DM0003'),('97c7a6f9-f06b-4dae-a4cc-35de1e27c3d6','2025-06-11 23:42:14.428413','Gß║Ñm - Vß╗ï tr├á ├ö Long h├▓a quyß╗çn c├╣ng tr├íi vß║úi c─âng mß╗ìng, mang ─æß║┐n d╞░ vß╗ï ngß╗ìt m├ít v├á thanh khiß║┐t giß║úi nhiß╗çt tuyß╗çt vß╗¥i cho ng├áy h├¿.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660134/products/zpi7jjpex7nyrak0yw9q.jpg',54000,'SP0041','Gß║Ñm',1,'2025-06-11 23:42:14.428413','DM0004'),('a0f5b903-6086-4b9c-8970-aa8581a5f89c','2025-06-05 05:28:34.491680','Tr├ón Ch├óu Phong Lan gi├▓n dai - kh├┤ng chß║Ñt bß║úo quß║ún, xen lß║½n hß║ít Vani ─æen tß╗▒ nhi├¬n & h╞░╞íng vß╗ï nhß║╣ nh├áng. Ph├╣ hß╗úp vß╗¢i mß╗ìi ─æß╗ô uß╗æng tß║íi Ph├¬ La.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749076110/products/ywb6xe2x5ajpeola3fmf.jpg',10000,'SP0017','Tr├ón ch├óu phong lan',1,'2025-06-05 05:28:34.491680','DM0008'),('a640cf1f-3f85-4d51-873a-43dfdea9eb0d','2025-06-11 23:28:10.287414','C├á Ph├¬ vß╗¢i nß╗æt h╞░╞íng: Dark Chocolate - Roasted Walnut - Strong Body - Long Aftertaste With Chocolate.\nSß║ún phß║⌐m c├│ thß╗â d├╣ng n├│ng/─æ├í.\n','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659289/products/xln2lvhttjdf7hw7uqxx.jpg',54000,'SP0024','Ph├¬ LATTE (Hß║ít Ro, Ara)',1,'2025-06-11 23:28:10.287414','DM0003'),('abfa1c08-4a75-4589-9106-7c4d909c0954','2025-06-04 17:04:28.942022','├ö Long Nh├ái Sß╗»a l├á sß╗▒ kß║┐t hß╗úp ho├án hß║úo giß╗½a Tr├á ├ö Long ─Éß║╖c Sß║ún ─æß║¡m ─æ├á c├╣ng h╞░╞íng nh├ái th╞ím tinh tß║┐, th├¬m ch├║t th╞ím ngß║¡y tß╗½ sß╗»a.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031465/products/dzutn0hiqup1s7iliccl.jpg',69000,'SP0002','├ö long nh├ái sß╗»a (Size La)',1,'2025-06-04 17:04:28.942022','DM0001'),('abfa7f77-8f87-48c7-8a46-b98e1e635025','2025-06-05 05:24:02.680708','Sß╗▒ ho├á quyß╗çn cß╗ºa c├íc tß║ºng h╞░╞íng: Nß╗æt h╞░╞íng ─æß║ºu l├á kh├│i ─æß║¡m, h╞░╞íng giß╗»a l├á kh├│i nhß║╣ & ─æß╗ìng lß║íi ß╗ƒ hß║¡u vß╗ï l├á h╞░╞íng hoa ngß╗ìc lan.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749075838/products/mez0s6zvx4w8yvr2odig.jpg',69000,'SP0012','Kho╠üi B\'Lao (Size La)',1,'2025-06-05 05:24:02.680708','DM0002'),('ac8a19bd-7ef5-4655-93d2-53881d44cec7','2025-06-11 23:48:43.941932','Tr├á ├ö Long ─Éß║╖c Sß║ún ß╗º lß║ính, kß║┐t hß╗úp c├╣ng M╞í M├í ─É├áo v├á ─É├áo Hß╗ông dß║ºm, th├¬m Thß║ích Tr├á Vß╗Å mß╗üm dai mang ─æß║┐n h╞░╞íng vß╗ï thanh m├ít & nhß║╣ nh├áng','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660523/products/k0nlq0ik0ltwb85jz28q.jpg',64000,'SP0047','Si m╞í - Cold brew ├┤ long m╞í ─æ├áo (Size La)',1,'2025-06-11 23:48:43.941932','DM0005'),('b0abb88f-ecc3-4dbd-a051-5ef7de16e6f4','2025-06-11 23:28:50.877357','C├á Ph├¬ vß╗¢i nß╗æt h╞░╞íng: Dark Chocolate - Roasted Walnut - Strong Body - Long Aftertaste With Chocolate.\nSß║ún phß║⌐m c├│ thß╗â d├╣ng n├│ng/─æ├í.\n','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659330/products/dsbfb2jjz7slcxvintar.jpg',54000,'SP0025','Ph├¬ CAPPU (Hß║ít Ro, Ara)',1,'2025-06-11 23:28:50.877357','DM0003'),('b47300ac-c9b4-4bc8-a696-a78a3655edc0','2025-06-04 17:10:22.431572','(Sß║ún phß║⌐m ─æ├í xay v├á c├│ thß╗â bß╗ï tan vß╗¢i khoß║úng c├ích xa tr├¬n 3,5km) Phan Xi P─âng sß╗▒ kß║┐t hß╗úp ─æß╗Öc ─æ├ío giß╗»a vß╗ï ch├ít thanh tao cß╗ºa Tr├á ├ö Long ─Éß╗Å v├á vß╗ï ngß╗ìt b├⌐o cß╗ºa cß╗æt dß╗½a ─æ├í xay mang ─æß║┐n trß║úi nghiß╗çm vß╗ï gi├íc mß╗¢i lß║í v├á ─æß║ºy th├║ vß╗ï.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031818/products/m0h9cwme1xtvbad2sqql.jpg',54000,'SP0008','Phan xi p─âng',1,'2025-06-04 17:10:22.431572','DM0001'),('b4f660e2-e09a-4ede-8afc-69b4a2b12448','2025-06-11 23:46:56.077544','Tr├á ├ö Long ─Éß║╖c Sß║ún nß╗òi tiß║┐ng vß╗¢i h╞░╞íng vß╗ï th╞ím ngon, h├▓a quyß╗çn c├╣ng tr├íi c├óy nhiß╗çt ─æß╗¢i tß║ío n├¬n h╞░╞íng vß╗ï t╞░╞íi m├ít, nhß║╣ nh├áng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660415/products/y2qnbs2p8hinj7dn2bsj.jpg',69000,'SP0045','├ö Long Nhi├¬╠út ─É╞í╠üi (Size La)',1,'2025-06-11 23:46:56.077544','DM0005'),('b77eaed9-4129-4e86-a994-61a19429e672','2025-06-11 23:43:17.691994','Tr├á ├ö Long ─É├áo - Thß╗⌐c uß╗æng ─æ╞░ß╗úc l├ám tß╗½ tr├á ├ö Long th╞░ß╗úng hß║íng v├á ─æ├áo t╞░╞íi ngon, mang ─æß║┐n h╞░╞íng vß╗ï tß╗▒ nhi├¬n, thß╗⌐c uß╗æng giß║úi nhiß╗çt ng├áy h├¿ ho├án hß║úo.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660197/products/cs9adnbkwoyx1hj9x8av.jpg',54000,'SP0042','├ö Long ─Éa╠Ço ─Éo╠ë',1,'2025-06-11 23:43:17.691994','DM0004'),('b83cb4e7-7108-47bd-94fe-2e5414248510','2025-06-05 05:27:54.857577','Thß║ích Tr├á Vß╗Å mß╗üm dai - kh├┤ng chß║Ñt bß║úo quß║ún - thß╗º c├┤ng s├íng tß║ío tß╗½ Tr├á Vß╗Å C├á Ph├¬ & ├ö Mai D├óy gia truyß╗ün (X├¡ Muß╗Öi). Ph├╣ hß╗úp vß╗¢i mß╗ìi tr├á tr├íi c├óy tß║íi Ph├¬ La.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749076070/products/umirpliugziniqviup1w.jpg',15000,'SP0016','Thß║ích tr├á vß╗Å',1,'2025-06-05 05:27:54.857577','DM0008'),('c425d8da-8565-43da-9f78-6058d4a4ee9c','2025-06-11 23:38:32.450222','Tr├á ├ö Long Lß╗Ña ─É├áo th╞ím hoa ngß╗ìt ng├áo, kß║┐t hß╗úp c├╣ng Sß╗»a T╞░╞íi Thanh Tr├╣ng Ph├¬ La, kß║┐t hß╗úp c├╣ng ß╗Éng H├║t Bung H╞░╞íng mang ─æß║┐n trß║úi nghiß╗çm t╞░╞íi m├ít & nhß║╣ nh├áng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659911/products/j6lsmsiznovnzcvkfnuo.jpg',69000,'SP0036','Lß╗Ña ─æ├áo - ├ö long ─æ├áo sß╗»a t╞░╞íi (Size La)',1,'2025-06-11 23:38:32.450222','DM0004'),('c976d479-fe11-4279-80a5-75c0ddf2f1c8','2025-06-05 05:21:30.914778','Lß╗¢p kem ├ö Long Matcha kß║┐t hß╗úp c├╣ng cß╗æt dß╗½a ─æ├í xay m├ít lß║ính, th╞░ß╗ƒng thß╗⌐c c├╣ng Thß║ích ├ö Long Matcha mß╗üm m╞░ß╗út mang ─æß║┐n trß║úi nghiß╗çm th├║ vß╗ï.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749075686/products/pe93vhgqior9tlqsfyx2.jpg',64000,'SP0009','Matcha phan xi p─âng',1,'2025-06-05 05:21:30.914778','DM0006'),('cb357e1c-71a0-4b32-b0d2-ab5f6888c68e','2025-06-11 23:35:02.394312','(Sß║ún phß║⌐m kh├┤ng ─æ╞░ß╗¥ng) Ph├¬ ─Éen c├│ vß╗ï chua nhß║╣ tß╗▒ nhi├¬n cß╗ºa hß║ít Arabica Cß║ºu ─Éß║Ñt kß║┐t hß╗úp c├╣ng Robusta Gia Lai ─æ╞░ß╗úc tuyß╗ân chß╗ìn kß╗╣ l╞░ß╗íng, tß║ío n├¬n h╞░╞íng vß╗ï ─æß║¡m m╞░ß╗út ─æß║ºy tinh tß║┐.  \n','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659701/products/hgjvqkqohrxijomclm0m.png',39000,'SP0032','Ph├¬ ─æen',1,'2025-06-11 23:35:02.394312','DM0003'),('cc60a0bd-71b2-4286-80ec-9c9cf8e4b794','2025-06-05 05:29:04.870384','Tr├ón ch├óu mß╗üm dß║╗o - vß╗ï tr├á ├ö Long ho├á quyß╗çn c├╣ng gß║ío rang th╞ím b├╣i nhß║╣ nh├áng. Ph├╣ hß╗úp th╞░ß╗ƒng thß╗⌐c c├╣ng tr├á sß╗»a. Kh├┤ng chß║Ñt bß║úo quß║ún. Nguy├¬n bß║ún - thß╗º c├┤ng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749076140/products/d8lrykepudqrseaaxsnl.jpg',10000,'SP0018','Tr├ón ch├óu gß║ío rang',1,'2025-06-05 05:29:04.870384','DM0008'),('ccb3834b-573a-4df9-8cad-b7e34a603457','2025-06-05 05:27:20.441900','Thß║ích ├ö Long Matcha mß╗üm m╞░ß╗út - kh├┤ng chß║Ñt bß║úo quß║ún - thß╗º c├┤ng s├íng tß║ío tß╗½ Tr├á ├ö Long Matcha & Sß╗»a Dß╗½a Bß║┐n Tre. Ph├╣ hß╗úp vß╗¢i mß╗ìi sß║ún phß║⌐m tr├á sß╗»a v├á ├ö Long Matcha tß║íi Ph├¬ La.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749076036/products/uvrzzolum8mmzuuc4shq.jpg',15000,'SP0015','Thß║ích ├┤ long matcha',1,'2025-06-05 05:27:20.441900','DM0008'),('d492c011-63be-4ccf-ab4e-30083d224672','2025-06-11 23:44:16.249737','Tr├á Vß╗Å C├á Ph├¬ ─æ╞░ß╗úc ß╗º tß╗½ vß╗Å c├á ph├¬, h╞░╞íng tr├á th╞ím nhß║╣ ho├á quyß╗çn c├╣ng vß╗ï chua dß╗ïu cß╗ºa chanh v├áng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660255/products/aqhh46oifrzof7hkt7wg.jpg',54000,'SP0043','Tra╠Ç Vo╠ë Ca╠Ç Ph├¬',1,'2025-06-11 23:44:16.249737','DM0004'),('d9e27e07-ceb8-4974-a559-60417c6b3fa4','2025-06-04 17:03:56.616668','Phong Lan sß╗▒ kß║┐t hß╗úp ho├án hß║úo giß╗»a Tr├á ├ö Long ─Éß║╖c Sß║ún h├▓a quyß╗çn c├╣ng Vani tß╗▒ nhi├¬n, th╞ím nhß║╣ nh├áng v├á vß╗ï ngß╗ìt tinh tß║┐.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031432/products/rasvh3mjt8crjtyczvbk.jpg',69000,'SP0001','Phong Lan (Size La)',1,'2025-06-04 17:03:56.616668','DM0001'),('db627802-4df2-4ae0-a769-16a904b7bd05','2025-06-04 17:05:04.363316','├ö Long Sß╗»a sß╗▒ kß║┐t hß╗úp ho├án hß║úo giß╗»a Tr├á ├ö Long ─Éß║╖c Sß║ún ─æß║¡m ─æ├á h├▓a quyß╗çn c├╣ng vß╗ï sß╗»a th╞ím ngß║¡y.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031500/products/afyhagan1mpkygb4e7if.jpg',69000,'SP0003','├ö long sß╗»a Ph├¬ La (Size La)',1,'2025-06-04 17:05:04.363316','DM0001'),('e62ed933-c3a9-4021-bc37-bae4f6c7ab51','2025-06-11 23:37:17.045099','Tr├á ├ö Long Gß║ío Rang th╞ím hoa ngß╗ìt ng├áo, kß║┐t hß╗úp c├╣ng Sß╗»a T╞░╞íi Thanh Tr├╣ng Ph├¬ La, mang ─æß║┐n trß║úi nghiß╗çm mß╗üm m╞░ß╗út, t╞░╞íi m├ít & nhß║╣ nh├áng. Sß╗¡ dß╗Ñng k├¿m ß╗Éng H├║t Bung H╞░╞íng.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659836/products/vanqwb6uh6klqqdmep5j.jpg',54000,'SP0035','Lß╗Ña gß║ío - ├ö long gß║ío sß╗»a t╞░╞íi',1,'2025-06-11 23:37:17.045099','DM0004'),('eda4768a-1a66-4c45-af5d-6b8f978b3bfa','2025-06-11 23:47:41.557778','Lang Biang h╞░╞íng vß╗ï thuß║ºn khiß║┐t cß╗ºa tr├á ├ö Long ─Éß║╖c Sß║ún c├╣ng mß╗⌐t hoa nh├ái th╞ím nhß║╣.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749660460/products/j7h9r1rhdckicyjxbkiw.jpg',69000,'SP0046','Lang Biang (Size La)',1,'2025-06-11 23:47:41.557778','DM0005'),('ee730bf6-f468-40fd-b1ce-d8eec9725e44','2025-06-05 05:23:23.518278','Tr├á ├ö Long ─æß║¡m ─æ├á kß║┐t hß╗úp h├ái ho├á vß╗¢i gß║ío rang th╞ím b├╣i.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749075799/products/xjvp4twenst0tyasyxbc.jpg',69000,'SP0011','Tß║Ñm (Size La)',1,'2025-06-05 05:23:23.519279','DM0002'),('f340ed84-16a9-4621-a398-5c2e25a13caa','2025-06-04 17:05:35.687489','Phong Lan ─æ╞░ß╗úc kß║┐t hß╗úp tß╗½ Tr├á ├ö Long ─Éß║╖c Sß║ún h├▓a quyß╗çn nhß║╣ nh├áng c├╣ng Vani tß╗▒ nhi├¬n, h╞░╞íng vß╗ï ngß╗ìt ng├áo chuß║⌐n gu tinh tß║┐.','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749031531/products/psd0vh9qqq1bw6mu1mbj.jpg',54000,'SP0004',' Phong Lan (├ö Long Vani Sß╗»a)',1,'2025-06-04 17:05:35.687489','DM0001'),('f72a7447-c08f-4448-b6a3-ba702bfc9a75','2025-06-11 23:34:02.238823','Ph├¬ Truffle ─æ╞░ß╗úc s├íng tß║ío tß╗½ C├á Ph├¬ ─Éß║¡m M╞░ß╗út v├á Kem Nß║Ñm Truffle ─Éen th╞ím ngß║¡y, h╞░╞íng vß╗ï b├╣ng nß╗ò ─æß║ºy ph├│ng kho├íng.  ','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659641/products/dv34bpnp1lh7wkddgtet.jpg',50000,'SP0030','Ph├¬ TRUFFLE',1,'2025-06-11 23:34:02.238823','DM0003'),('fd19da9c-140c-47c8-945f-7137d9e4a8df','2025-06-11 23:33:29.271680','Ph├¬ Lan ─æ╞░ß╗úc s├íng tß║ío tß╗½ C├á Ph├¬ ─Éß║¡m M╞░ß╗út & Vani tß╗▒ nhi├¬n vß╗¢i nß╗æt h╞░╞íng: Vanilla - Chocolate - Roasted Walnut - Creamy Mouthfeel. Sß║ún phß║⌐m c├│ thß╗â d├╣ng n├│ng/lß║ính.\n','https://res.cloudinary.com/dtzitoo8i/image/upload/v1749659608/products/afiecwfrisgp4njrvc3c.jpg',59000,'SP0029','Ph├¬ lan',1,'2025-06-11 23:33:29.271680','DM0003');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount_type` enum('FIXED_AMOUNT','PERCENTAGE') NOT NULL,
  `discount_value` double NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `promotion_code` varchar(255) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `status` enum('ACTIVE','EXPIRED','INACTIVE') NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`),
  UNIQUE KEY `UKo72hlunsj1rlisekchpp6e9v` (`promotion_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES ('6287b2e0-b986-4c2d-8b6d-0200e231d5a6','2025-06-04 17:33:14.535810','Giß║úm gi├í 10% cho ─æ╞ín tß╗½ 50.000VN─É','PERCENTAGE',10,'2025-06-15 17:33:00.000000',20000,50000,'KMHE2025','KM0001','2025-06-01 17:33:00.000000','ACTIVE','2025-06-04 23:44:13.929962'),('effecbdd-49ba-41f6-9127-b3e1942993ca','2025-06-05 02:23:15.274431','Giß║úm 10.000 cho ─æ╞ín tß╗æi thiß╗âu 200.000','FIXED_AMOUNT',10000,'2025-06-10 02:23:00.000000',NULL,200000,'TETTHIEUNHI','KM0002','2025-06-01 02:23:00.000000','ACTIVE','2025-06-07 17:20:29.756603');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_cart`
--

DROP TABLE IF EXISTS `promotion_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_cart` (
  `promotion_cart_id` bigint NOT NULL AUTO_INCREMENT,
  `applied_at` datetime(6) NOT NULL,
  `discount_amount` double NOT NULL,
  `cart_id` varchar(255) NOT NULL,
  `promotion_id` varchar(255) NOT NULL,
  PRIMARY KEY (`promotion_cart_id`),
  KEY `FK745jk0s69jwmsnuxpc95fkgln` (`cart_id`),
  KEY `FKnqq35ws1om6yfh7mjeplmfgjw` (`promotion_id`),
  CONSTRAINT `FK745jk0s69jwmsnuxpc95fkgln` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `FKnqq35ws1om6yfh7mjeplmfgjw` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_cart`
--

LOCK TABLES `promotion_cart` WRITE;
/*!40000 ALTER TABLE `promotion_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_tokens`
--

DROP TABLE IF EXISTS `verification_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_tokens` (
  `id` varchar(255) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `admin_id` varchar(255) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7pxi2e2922lk2j0hcve3x13xq` (`admin_id`),
  UNIQUE KEY `UKr6v8yggddhccc6edbkck0e9sa` (`customer_id`),
  CONSTRAINT `FKm35v4c29qr7agbxqqopsb6eh6` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FKs6d9n63fup2bm6ps3v2mtw4gg` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_tokens`
--

LOCK TABLES `verification_tokens` WRITE;
/*!40000 ALTER TABLE `verification_tokens` DISABLE KEYS */;
INSERT INTO `verification_tokens` VALUES ('4644c89d-9266-4cc6-af39-ec16758a5891','2025-06-12 14:23:01.191651','62c2742b-fa0d-4d35-9f9a-53a13951b0ea',NULL,'79f9122b-9626-48b3-844e-11f61f5015f2');
/*!40000 ALTER TABLE `verification_tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12  0:00:20
