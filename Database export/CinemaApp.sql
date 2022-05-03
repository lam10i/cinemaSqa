-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bus_seat_project
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `current_date_operation`
--

DROP TABLE IF EXISTS `current_date_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_date_operation` (
  `date_id` bigint NOT NULL AUTO_INCREMENT,
  `show_date` date DEFAULT NULL,
  `show_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_date_operation`
--

LOCK TABLES `current_date_operation` WRITE;
/*!40000 ALTER TABLE `current_date_operation` DISABLE KEYS */;
INSERT INTO `current_date_operation` VALUES (1,'2022-03-10','09:00 am'),(2,'2022-03-11','09:00 am'),(3,'2022-03-12','09:00 am'),(4,'2022-03-14','09:00 am'),(5,'2022-03-14','09:00 am'),(6,'2022-03-14','09:00 am'),(7,'2022-03-15','09:00 am'),(8,'2022-03-17','09:00 am'),(9,'2022-03-19','09:00 am'),(10,'2022-03-19','09:00 am'),(11,'2022-03-19','09:00 am'),(12,'2022-03-19','09:00 am'),(13,'2022-03-19','09:00 am'),(14,'2022-03-19','09:00 am'),(15,'2022-03-21','09:00 am'),(16,'2022-03-23','09:00 am'),(17,'2022-03-23','09:00 am'),(18,'2022-03-25','09:00 am'),(19,'2022-04-01','12:00 am'),(20,'2022-05-03','06:00 pm');
/*!40000 ALTER TABLE `current_date_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `b_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`b_id`),
  UNIQUE KEY `UK_dwk6cx0afu8bs9o4t536v1j5v` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'lamvip9e@gmail.com','Thanh Nam','lam310501'),(2,'whomonugiri@gmail.com','Pham Thanh','pham'),(3,'lanngoc@gmail.com','Lan Ngoc','lanngoc123'),(4,'1901040026@s.hanu.edu.vn','anhtran','123456'),(6,'tienduc@gmail.com','Duc','123456'),(7,'namdz@BA.vn','Nam co 10 NY','namdeptrai'),(8,'congchuabongbong@yahoo.com','Nam co 11 nguoi yeu','congchuabongbong'),(9,'thaotaotau@gmail.com','Phuong Thao','thao123'),(10,'mainame@gmail.com','Phuong Mai','mainam123'),(11,'minhname@gmail.com','Ha Minh','minhname'),(12,'halan@gmail.com','Ha Lan','minhmai'),(13,'huephuong@gmail.com','Hue Phuong','huephuong'),(14,'manhduc@gmail.com','Manh Duc','mannhduc'),(15,'lehuyen@gmail.com','Le Huyen','lehuyen'),(16,'phamduc@gmail.com','phamduc','phamduc');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `day` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `image` text,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'4 June','8.00AM - 9.30AM','https://www.galaxycine.vn/media/2021/1/18/1035x660_1610956392715.png','Eco Park','Tri ân thành viên','Thành viên Star chi tiêu đủ mức G-Star, X-Star trong năm 2021 sẽ được nâng hạng và hưởng quyền lợi mới tương ứng. Ngoài ra, các Stars còn tặng thêm 02 vé miễn phí (G-Star) và 04 vé miễn phí (X-Star).'),(2,'20 JUN','2.00PM - 2.30PM','https://www.galaxycine.vn/media/2021/12/10/mbf-1221-1350x900---copy_1639131113561.jpg',' Hilton Quebec','MOTIVATING STUDENT','Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, hic ullam, dicta eaque perspiciatis minima officiis'),(13,'4 APRIL','16.00PM - 18.30PM','https://www.galaxycine.vn/media/2022/3/22/1135x660-1_1647919982925.jpg','Land Mark','Milo Day','Cụ thể vào Thứ 4 cuối cùng mỗi tháng, khách hàng thành viên Galaxy Cinema khi mua 01 hộp bắp sẽ được hưởng ưu đãi mua 01 Milo ly 32oz chỉ với giá 19.000 VNĐ. Bạn chỉ cần trình thẻ thành viên/ app Galaxy là đã có thể sở hữu một ly Milo ngọt ngào với giá siêu “mềm” ');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_details`
--

DROP TABLE IF EXISTS `movies_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_details` (
  `movie_id` bigint NOT NULL AUTO_INCREMENT,
  `image` text,
  `movie_name` varchar(255) NOT NULL,
  `iframe` text,
  `director` varchar(50) DEFAULT NULL,
  `cast` varchar(100) DEFAULT NULL,
  `producer` varchar(100) DEFAULT NULL,
  `nation` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `timeRelease` varchar(100) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `time_release` varchar(255) DEFAULT NULL,
  `movie_detail` text,
  `movie_details` varchar(1000) NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_details`
--

LOCK TABLES `movies_details` WRITE;
/*!40000 ALTER TABLE `movies_details` DISABLE KEYS */;
INSERT INTO `movies_details` VALUES (1,'https://www.galaxycine.vn/media/2022/2/25/1200x1800_1645762245153.jpg','Turning Red - Gấu đỏ biến hình','https://www.youtube.com/watch?v=XdKzUbAiswE&t=12s','Domee Shi','Sandra Oh, Rosalie Chiang','  PIXAR','Mỹ','Hoạt Hình','11/3/2022',7.8,99,'11/3/2022','Turning Red hay còn biết tới cái tên Gấu Đỏ Biến Hình là một bộ phim hoạt hình thuộc Pixar – Disney phát hành. Nội dung chính nhắc đến cô bé 13 tuổi Mai Lee, là một trong những cô nhóc rất cá tính, hội tụ đủ những sự hỗn loạn ở tuổi này. Mẹ của cô bé luôn cố gắng để bảo bọc, ở cạnh cô con gái mọi lúc mọi nơi.','Turning Red hay còn biết tới cái tên Gấu Đỏ Biến Hình là một bộ phim hoạt hình thuộc Pixar – Disney phát hành. Nội dung chính nhắc đến cô bé 13 tuổi Mai Lee, là một trong những cô nhóc rất cá tính, hội tụ đủ những sự hỗn loạn ở tuổi này. Mẹ của cô bé luôn cố gắng để bảo bọc, ở cạnh cô con gái mọi lúc mọi nơi.'),(2,'https://www.galaxycine.vn/media/2022/2/15/900wx1350h_1644909184911.jpg','THE BATMAN','https://www.youtube.com/watch?v=mqqft2x_Aa4','Matt Reeves','Robert Pattinson, Colin Farrell, Zoe Kravitz, Andy Serkis','Warner Bros','Mỹ','Hành động','03/03/2002',9.5,175,'3/3/2022','Nội dung kể về cuộc sống của tỷ phú Bruce Wayne (Robert Pattinson) sau hai năm khoác áo Người Dơi tại thành phố Gotham. Chuyện phim bắt đầu khi anh nhận được lời thách thức của Riddler (Paul Dano) sau khi gã giết thị trưởng. Từ đó, nhiều bí mật xoay quanh giới quan chức bị vạch trần.','Nội dung kể về cuộc sống của tỷ phú Bruce Wayne (Robert Pattinson) sau hai năm khoác áo Người Dơi tại thành phố Gotham. Chuyện phim bắt đầu khi anh nhận được lời thách thức của Riddler (Paul Dano) sau khi gã giết thị trưởng. Từ đó, nhiều bí mật xoay quanh giới quan chức bị vạch trần.'),(3,'https://www.galaxycine.vn/media/2022/2/7/bnn-800x1200_1644223760720.jpg','BẪY NGỌT NGÀO','https://www.youtube.com/watch?v=1ElIav2gMQI','Đinh Hà Uyên Thư','Minh Hằng, Diệu Nhi, Bảo Anh, Thuận Nguyễn','Sao băng','Việt Nam','  Tâm Lý','10/2/2022',7.2,90,'10/2/2022','Bẫy ngọt ngào có nội dung xoay quanh cuộc sống hôn nhân dù giàu sang nhưng đầy nước mắt của Camy (Bảo Anh) với Đăng Minh (Quốc Trường). Người chồng có thể cưỡng hiếp cô mọi lúc mọi nơi để thỏa mãn dục vọng vì trong hắn chỉ có sự chiếm hữu chứ không phải là tình yêu.','Bẫy ngọt ngào có nội dung xoay quanh cuộc sống hôn nhân dù giàu sang nhưng đầy nước mắt của Camy (Bảo Anh) với Đăng Minh (Quốc Trường). Người chồng có thể cưỡng hiếp cô mọi lúc mọi nơi để thỏa mãn dục vọng vì trong hắn chỉ có sự chiếm hữu chứ không phải là tình yêu.'),(4,'https://www.galaxycine.vn/media/2022/3/1/wom-1200x1800_1646105693625.jpg','GÃ ĐIÊN BÁO THÙ','https://www.youtube.com/watch?v=G9jFDrlxeUk','Guy Ritchie','Jason Statham, Scott Eastwood, Josh Hartnett','Metro-Goldwyn-Mayer (MGM)','Anh','Hành động','11/3/2022',9,118,'11/3/2022','Gã Điên Báo Thù có nội dung xoay quanh Patrick Hill (Jason Statham đóng), một nhân viên vừa được Fortico Securities thuê vào đội bảo an sau khi chiếc xe bọc thép chở đầy tiền của hãng hứng chịu một cuộc phục kích chết người. Anh ta nhanh chóng tỏ ra là một nhân viên nổi trội và đáng tin cậy trong việc bảo vệ tài sản.','Gã Điên Báo Thù có nội dung xoay quanh Patrick Hill (Jason Statham đóng), một nhân viên vừa được Fortico Securities thuê vào đội bảo an sau khi chiếc xe bọc thép chở đầy tiền của hãng hứng chịu một cuộc phục kích chết người. Anh ta nhanh chóng tỏ ra là một nhân viên nổi trội và đáng tin cậy trong việc bảo vệ tài sản.'),(5,'https://www.galaxycine.vn/media/2022/3/7/300x450_1646637285608.jpg','ĐÊM TRÓI BUỘC','https://www.youtube.com/watch?v=7YEOZ8mMMfU','Kourosh Ahari','Niousha Noor, Shahab Hosseini','Mammoth Pictures','Mỹ','Kinh dị,ly kì','11/3/2022',6.3,105,'11/3/2022','Phim kể về chuyến đi đến Mỹ của hai vợ chồng trẻ Babak và Neda. Sau khi rời tiệc rượu ở nhà một người bạn, hai vợ chồng và đứa con gái nhỏ tá túc tạm một đêm tại khách sạn Normandie. Vào đây, những chuyện quái dị bắt đầu xảy ra với gia đình nhỏ này. Về cốt truyện, phim dẫn dắt tình huống khá tự nhiên và dễ hiểu.','Phim kể về chuyến đi đến Mỹ của hai vợ chồng trẻ Babak và Neda. Sau khi rời tiệc rượu ở nhà một người bạn, hai vợ chồng và đứa con gái nhỏ tá túc tạm một đêm tại khách sạn Normandie. Vào đây, những chuyện quái dị bắt đầu xảy ra với gia đình nhỏ này. Về cốt truyện, phim dẫn dắt tình huống khá tự nhiên và dễ hiểu.'),(6,'https://www.galaxycine.vn/media/2022/3/5/qxgh-poster_1646449990346.jpg','QUÁI XẾ GIAO HÀNG','https://www.youtube.com/watch?v=O_MfXpURhTo','Park Dae Min','Park So Dam, Yeom Hye Ran, Kim Eui Sung','Edko Films','Hàn Quốc','Hành Động','11/3/2022',9.3,108,'11/3/2022','Nữ chính Jang Eun Ha (Park So Dam) là người chuyên nhận những cuốc xe giúp khách hàng bỏ trốn ra nước ngoài. Cô làm việc cho công ty vận chuyển đặc biệt Baekgang của ông chủ Baek (Kim Eui Sung). Hãng taxi đặc biệt này hoạt động với slogan “Chúng tôi nhận vận chuyển những gì bưu điện không nhận”. Tuy nhiên, nếu chỉ xem trailer, người xem dễ dàng lầm tưởng hãng taxi cũng có nhiều quái xế mà không biết rằng Eun Ha là quái xế “độc quyền và duy nhất”.','Nữ chính Jang Eun Ha (Park So Dam) là người chuyên nhận những cuốc xe giúp khách hàng bỏ trốn ra nước ngoài. Cô làm việc cho công ty vận chuyển đặc biệt Baekgang của ông chủ Baek (Kim Eui Sung). Hãng taxi đặc biệt này hoạt động với slogan “Chúng tôi nhận vận chuyển những gì bưu điện không nhận”. Tuy nhiên, nếu chỉ xem trailer, người xem dễ dàng lầm tưởng hãng taxi cũng có nhiều quái xế mà không biết rằng Eun Ha là quái xế “độc quyền và duy nhất”.');
/*!40000 ALTER TABLE `movies_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_history`
--

DROP TABLE IF EXISTS `o_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `o_history` (
  `h_id` bigint NOT NULL AUTO_INCREMENT,
  `book_on_date` date DEFAULT NULL,
  `movie_name` varchar(255) DEFAULT NULL,
  `show_on_date` date DEFAULT NULL,
  `show_time` varchar(255) DEFAULT NULL,
  `total` double NOT NULL,
  `customer_b_id` bigint DEFAULT NULL,
  PRIMARY KEY (`h_id`),
  KEY `FKgmr4ouybuuka0lcqj426f0nt6` (`customer_b_id`),
  CONSTRAINT `FKgmr4ouybuuka0lcqj426f0nt6` FOREIGN KEY (`customer_b_id`) REFERENCES `customer` (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_history`
--

LOCK TABLES `o_history` WRITE;
/*!40000 ALTER TABLE `o_history` DISABLE KEYS */;
INSERT INTO `o_history` VALUES (1,'2022-03-10','Spider Man','2022-03-10','09:00 am',120000,1),(2,'2022-03-11','Spider Man','2022-03-11','09:00 am',120000,1),(3,'2022-03-12','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-12','09:00 am',120000,1),(4,'2022-03-14','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-14','09:00 am',525.22,1),(5,'2022-03-14','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-14','09:00 am',2100.88,1),(6,'2022-03-14','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-14','09:00 am',120000,1),(7,'2022-03-15','GÃ ĐIÊN BÁO THÙ','2022-03-15','09:00 am',120000,2),(8,'2022-03-17','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-17','09:00 am',1050.44,1),(9,'2022-03-19','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-19','09:00 am',1575.66,1),(10,'2022-03-19','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-19','09:00 am',120000,1),(11,'2022-03-19','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-19','09:00 am',120000,1),(12,'2022-03-19','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-19','09:00 am',1050.44,1),(13,'2022-03-19','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-19','09:00 am',120000,1),(14,'2022-03-19','ĐÊM TRÓI BUỘC','2022-03-19','09:00 am',120000,1),(15,'2022-03-21','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-21','09:00 am',60000,4),(16,'2022-03-23','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-23','09:00 am',60000,6),(17,'2022-03-23','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-23','09:00 am',180000,1),(18,'2022-03-25','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-03-25','09:00 am',120000,7),(19,'2022-03-31','TURNING RED: GẤU ĐỎ BIẾN HÌNH','2022-04-01','12:00 am',120000,12),(20,'2022-05-03','Turning Red - Gấu đỏ biến hình','2022-05-03','06:00 pm',120000,16);
/*!40000 ALTER TABLE `o_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history_price`
--

DROP TABLE IF EXISTS `order_history_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history_price` (
  `order_history_h_id` bigint NOT NULL,
  `price` double DEFAULT NULL,
  KEY `FKlhe2l8oytm44d5iq70gypaucy` (`order_history_h_id`),
  CONSTRAINT `FKlhe2l8oytm44d5iq70gypaucy` FOREIGN KEY (`order_history_h_id`) REFERENCES `o_history` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history_price`
--

LOCK TABLES `order_history_price` WRITE;
/*!40000 ALTER TABLE `order_history_price` DISABLE KEYS */;
INSERT INTO `order_history_price` VALUES (1,60000),(1,60000),(2,60000),(2,60000),(3,60000),(3,60000),(4,60000),(5,60000),(5,60000),(5,60000),(5,60000),(6,60000),(6,60000),(7,60000),(7,60000),(7,60000),(7,60000),(7,60000),(8,60000),(8,60000),(9,60000),(9,60000),(9,60000),(10,60000),(10,60000),(11,60000),(11,60000),(12,525.22),(12,525.22),(13,60000),(13,60000),(14,60000),(14,60000),(15,60000),(16,60000),(17,60000),(17,60000),(17,60000),(18,60000),(18,60000),(19,60000),(19,60000),(20,60000),(20,60000);
/*!40000 ALTER TABLE `order_history_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history_seat`
--

DROP TABLE IF EXISTS `order_history_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history_seat` (
  `order_history_h_id` bigint NOT NULL,
  `seat` varchar(255) DEFAULT NULL,
  KEY `FK1jih8kbsivoaj464k5xbc56tw` (`order_history_h_id`),
  CONSTRAINT `FK1jih8kbsivoaj464k5xbc56tw` FOREIGN KEY (`order_history_h_id`) REFERENCES `o_history` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history_seat`
--

LOCK TABLES `order_history_seat` WRITE;
/*!40000 ALTER TABLE `order_history_seat` DISABLE KEYS */;
INSERT INTO `order_history_seat` VALUES (1,'seat13'),(1,'seat14'),(2,'seat4'),(2,'seat5'),(3,'seat1'),(3,'seat2'),(4,'seat3'),(5,'seat2'),(5,'seat4'),(5,'seat7'),(5,'seat8'),(6,'seat21'),(6,'seat22'),(7,'seat1'),(7,'seat2'),(7,'seat3'),(7,'seat4'),(7,'seat5'),(8,'seat8'),(8,'seat9'),(9,'seat3'),(9,'seat4'),(9,'seat5'),(10,'seat9'),(10,'seat10'),(11,'seat14'),(11,'seat15'),(12,'seat21'),(12,'seat22'),(13,'seat26'),(13,'seat27'),(14,'seat32'),(14,'seat38'),(15,'seat2'),(16,'seat7'),(17,'seat13'),(17,'seat14'),(17,'seat20'),(18,'seat8'),(18,'seat9'),(19,'seat4'),(19,'seat5'),(20,'seat3'),(20,'seat4');
/*!40000 ALTER TABLE `order_history_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `s_id` bigint NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `customer_b_id` bigint DEFAULT NULL,
  `operation_date_id` bigint DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FK4tfvcs3wor0pb0w5mn1cm5t88` (`customer_b_id`),
  KEY `FKrtmqamyrpcpmtb23pwy4kwixt` (`operation_date_id`),
  CONSTRAINT `FK4tfvcs3wor0pb0w5mn1cm5t88` FOREIGN KEY (`customer_b_id`) REFERENCES `customer` (`b_id`),
  CONSTRAINT `FKrtmqamyrpcpmtb23pwy4kwixt` FOREIGN KEY (`operation_date_id`) REFERENCES `current_date_operation` (`date_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,1050.44,1,1),(2,1050.44,1,2),(3,1050.44,1,3),(4,525.22,1,4),(5,2100.88,1,5),(6,1050.44,1,6),(7,2626.1000000000004,2,7),(8,1050.44,1,8),(9,1575.66,1,9),(10,1050.44,1,10),(11,1050.44,1,11),(12,1050.44,1,12),(13,120000,1,13),(14,120000,1,14),(15,60000,4,15),(16,60000,6,16),(17,180000,1,17),(18,120000,7,18),(19,120000,12,19),(20,120000,16,20);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_price`
--

DROP TABLE IF EXISTS `seat_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_price` (
  `seat_s_id` bigint NOT NULL,
  `price` double DEFAULT NULL,
  KEY `FK8kwegnnsc16tcy1p9q76tf70w` (`seat_s_id`),
  CONSTRAINT `FK8kwegnnsc16tcy1p9q76tf70w` FOREIGN KEY (`seat_s_id`) REFERENCES `seat` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_price`
--

LOCK TABLES `seat_price` WRITE;
/*!40000 ALTER TABLE `seat_price` DISABLE KEYS */;
INSERT INTO `seat_price` VALUES (1,60000),(1,60000),(2,60000),(2,60000),(3,60000),(3,60000),(4,60000),(5,60000),(5,60000),(5,60000),(5,60000),(6,60000),(6,60000),(7,60000),(7,60000),(7,60000),(7,60000),(7,60000),(8,60000),(8,60000),(9,60000),(9,60000),(9,60000),(10,60000),(10,60000),(11,60000),(11,60000),(12,60000),(12,60000),(13,60000),(13,60000),(14,60000),(14,60000),(15,60000),(16,60000),(17,60000),(17,60000),(17,60000),(18,60000),(18,60000),(19,60000),(19,60000),(20,60000),(20,60000);
/*!40000 ALTER TABLE `seat_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_seat_no`
--

DROP TABLE IF EXISTS `seat_seat_no`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_seat_no` (
  `seat_s_id` bigint NOT NULL,
  `seat_no` varchar(255) DEFAULT NULL,
  KEY `FKpeplb0hklix4kl4rg3b9kobvk` (`seat_s_id`),
  CONSTRAINT `FKpeplb0hklix4kl4rg3b9kobvk` FOREIGN KEY (`seat_s_id`) REFERENCES `seat` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_seat_no`
--

LOCK TABLES `seat_seat_no` WRITE;
/*!40000 ALTER TABLE `seat_seat_no` DISABLE KEYS */;
INSERT INTO `seat_seat_no` VALUES (1,'seat13'),(1,'seat14'),(2,'seat4'),(2,'seat5'),(3,'seat1'),(3,'seat2'),(4,'seat3'),(5,'seat2'),(5,'seat4'),(5,'seat7'),(5,'seat8'),(6,'seat21'),(6,'seat22'),(7,'seat1'),(7,'seat2'),(7,'seat3'),(7,'seat4'),(7,'seat5'),(8,'seat8'),(8,'seat9'),(9,'seat3'),(9,'seat4'),(9,'seat5'),(10,'seat9'),(10,'seat10'),(11,'seat14'),(11,'seat15'),(12,'seat21'),(12,'seat22'),(13,'seat26'),(13,'seat27'),(14,'seat32'),(14,'seat38'),(15,'seat2'),(16,'seat7'),(17,'seat13'),(17,'seat14'),(17,'seat20'),(18,'seat8'),(18,'seat9'),(19,'seat4'),(19,'seat5'),(20,'seat3'),(20,'seat4');
/*!40000 ALTER TABLE `seat_seat_no` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-03 13:00:10
