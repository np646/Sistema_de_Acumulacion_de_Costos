CREATE DATABASE  IF NOT EXISTS `bdd_enci` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdd_enci`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: bdd_enci
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cliente` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `cli_identificacion` varchar(45) DEFAULT NULL,
  `cli_nombre` varchar(45) DEFAULT NULL,
  `cli_estado` int DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_costopororden`
--

DROP TABLE IF EXISTS `tbl_costopororden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_costopororden` (
  `cop_id` int NOT NULL AUTO_INCREMENT,
  `legr_id` int DEFAULT NULL,
  `opr_id` int DEFAULT NULL,
  `cop_estado` int DEFAULT NULL,
  `cop_comentario` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`cop_id`),
  KEY `oprID2_idx` (`opr_id`),
  KEY `egrID2_idx` (`legr_id`),
  CONSTRAINT `egrID2` FOREIGN KEY (`legr_id`) REFERENCES `tbl_listaegresos` (`legr_id`),
  CONSTRAINT `oprID2` FOREIGN KEY (`opr_id`) REFERENCES `tbl_ordenproduccion` (`opr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costopororden`
--

LOCK TABLES `tbl_costopororden` WRITE;
/*!40000 ALTER TABLE `tbl_costopororden` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_costopororden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalleorden`
--

DROP TABLE IF EXISTS `tbl_detalleorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalleorden` (
  `det_id` int NOT NULL AUTO_INCREMENT,
  `opr_id` int DEFAULT NULL,
  `legr_id` int DEFAULT NULL,
  `det_estado` int DEFAULT NULL,
  PRIMARY KEY (`det_id`),
  KEY `egrid_idx` (`legr_id`),
  KEY `oprID_idx` (`opr_id`),
  CONSTRAINT `legrid` FOREIGN KEY (`legr_id`) REFERENCES `tbl_listaegresos` (`legr_id`),
  CONSTRAINT `oprID` FOREIGN KEY (`opr_id`) REFERENCES `tbl_ordenproduccion` (`opr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalleorden`
--

LOCK TABLES `tbl_detalleorden` WRITE;
/*!40000 ALTER TABLE `tbl_detalleorden` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalleorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detalleordenmp`
--

DROP TABLE IF EXISTS `tbl_detalleordenmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detalleordenmp` (
  `detmp_id` int NOT NULL AUTO_INCREMENT,
  `opr_id` int DEFAULT NULL,
  `lmp_id` int DEFAULT NULL,
  `detmp_estado` int DEFAULT NULL,
  PRIMARY KEY (`detmp_id`),
  KEY `oprid2_idx` (`opr_id`),
  KEY `lmpid_idx` (`lmp_id`),
  CONSTRAINT `lmpid3` FOREIGN KEY (`lmp_id`) REFERENCES `tbl_listaegresosmp` (`lmp_id`),
  CONSTRAINT `oprid3` FOREIGN KEY (`opr_id`) REFERENCES `tbl_ordenproduccion` (`opr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detalleordenmp`
--

LOCK TABLES `tbl_detalleordenmp` WRITE;
/*!40000 ALTER TABLE `tbl_detalleordenmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detalleordenmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_detallepedido`
--

DROP TABLE IF EXISTS `tbl_detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_detallepedido` (
  `dped_id` int NOT NULL AUTO_INCREMENT,
  `ped_id` int DEFAULT NULL,
  `itm_id` int DEFAULT NULL,
  `dped_estado` int DEFAULT NULL,
  PRIMARY KEY (`dped_id`),
  KEY `pedID_idx` (`ped_id`),
  KEY `itemID_idx` (`itm_id`),
  CONSTRAINT `itmID` FOREIGN KEY (`itm_id`) REFERENCES `tbl_item` (`itm_id`),
  CONSTRAINT `pedID` FOREIGN KEY (`ped_id`) REFERENCES `tbl_pedido` (`ped_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_detallepedido`
--

LOCK TABLES `tbl_detallepedido` WRITE;
/*!40000 ALTER TABLE `tbl_detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_egreso`
--

DROP TABLE IF EXISTS `tbl_egreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_egreso` (
  `egr_id` int NOT NULL AUTO_INCREMENT,
  `egr_detalle` varchar(45) DEFAULT NULL,
  `egr_clasificacion` varchar(45) DEFAULT NULL,
  `egr_cantidad` int DEFAULT NULL,
  `egr_costounitario` double DEFAULT NULL,
  `egr_costototal` double DEFAULT NULL,
  `egr_total` double DEFAULT NULL,
  `egr_estado` int DEFAULT NULL,
  PRIMARY KEY (`egr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_egreso`
--

LOCK TABLES `tbl_egreso` WRITE;
/*!40000 ALTER TABLE `tbl_egreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_egreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_item`
--

DROP TABLE IF EXISTS `tbl_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_item` (
  `itm_id` int NOT NULL AUTO_INCREMENT,
  `cli_id` int DEFAULT NULL,
  `itm_fecha` datetime DEFAULT NULL,
  `itm_cantidad` int DEFAULT NULL,
  `itm_fechainicio` datetime DEFAULT NULL,
  `itm_fechafinalizacion` datetime DEFAULT NULL,
  `itm_numpedido` int DEFAULT NULL,
  `pro_id` int DEFAULT NULL,
  `itm_estado` int DEFAULT NULL,
  `itm_descripcion` varchar(3000) DEFAULT NULL,
  `itm_total` double DEFAULT NULL,
  PRIMARY KEY (`itm_id`),
  KEY `idcliente_idx` (`cli_id`),
  KEY `idproducto_idx` (`pro_id`),
  CONSTRAINT `idcliente` FOREIGN KEY (`cli_id`) REFERENCES `tbl_cliente` (`cli_id`),
  CONSTRAINT `idproducto` FOREIGN KEY (`pro_id`) REFERENCES `tbl_producto` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item`
--

LOCK TABLES `tbl_item` WRITE;
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_iva`
--

DROP TABLE IF EXISTS `tbl_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_iva` (
  `iva_id` int NOT NULL AUTO_INCREMENT,
  `iva_valor` double DEFAULT NULL,
  `iva_fecha` datetime DEFAULT NULL,
  `iva_estado` int DEFAULT NULL,
  PRIMARY KEY (`iva_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_iva`
--

LOCK TABLES `tbl_iva` WRITE;
/*!40000 ALTER TABLE `tbl_iva` DISABLE KEYS */;
INSERT INTO `tbl_iva` VALUES (1,0.12,'2023-07-21 11:06:13',0);
/*!40000 ALTER TABLE `tbl_iva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_kardex`
--

DROP TABLE IF EXISTS `tbl_kardex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_kardex` (
  `kar_id` int NOT NULL AUTO_INCREMENT,
  `mpr_id` int DEFAULT NULL,
  `kar_fecha` datetime DEFAULT NULL,
  `kar_en_cantidad` double DEFAULT NULL,
  `kar_en_cunitario` double DEFAULT NULL,
  `kar_en_ctotal` double DEFAULT NULL,
  `kar_sa_cantidad` double DEFAULT NULL,
  `kar_sa_cunitario` double DEFAULT NULL,
  `kar_sa_ctotal` double DEFAULT NULL,
  `kar_sd_cantidad` double DEFAULT NULL,
  `kar_sd_cunitario` double DEFAULT NULL,
  `kar_sd_ctotal` double DEFAULT NULL,
  `kar_estado` int DEFAULT NULL,
  `kar_descripcion` varchar(45) DEFAULT NULL,
  `opr_id` int DEFAULT NULL,
  PRIMARY KEY (`kar_id`),
  KEY `mprid_idx` (`mpr_id`),
  CONSTRAINT `mprid` FOREIGN KEY (`mpr_id`) REFERENCES `tbl_materiaprima` (`mpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_kardex`
--

LOCK TABLES `tbl_kardex` WRITE;
/*!40000 ALTER TABLE `tbl_kardex` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_kardex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_listaegresos`
--

DROP TABLE IF EXISTS `tbl_listaegresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_listaegresos` (
  `legr_id` int NOT NULL AUTO_INCREMENT,
  `legr_fecha` datetime DEFAULT NULL,
  `iva_valor` double DEFAULT NULL,
  `egr_id` int DEFAULT NULL,
  `legr_estado` int DEFAULT NULL,
  PRIMARY KEY (`legr_id`),
  KEY `egresoID_idx` (`egr_id`),
  CONSTRAINT `egresoID` FOREIGN KEY (`egr_id`) REFERENCES `tbl_egreso` (`egr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_listaegresos`
--

LOCK TABLES `tbl_listaegresos` WRITE;
/*!40000 ALTER TABLE `tbl_listaegresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_listaegresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_listaegresosmp`
--

DROP TABLE IF EXISTS `tbl_listaegresosmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_listaegresosmp` (
  `lmp_id` int NOT NULL AUTO_INCREMENT,
  `lmp_fecha` datetime DEFAULT NULL,
  `iva_valor` double DEFAULT NULL,
  `mpr_id` int DEFAULT NULL,
  `lmp_estado` int DEFAULT NULL,
  `lmp_costototal` double DEFAULT NULL,
  `lmp_total` double DEFAULT NULL,
  `lmp_cantidad` double DEFAULT NULL,
  `lmp_cunitario` double DEFAULT NULL,
  `lmp_esdevolucion` int DEFAULT NULL,
  `lmp_dev` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lmp_id`),
  KEY `mprid_idx` (`mpr_id`),
  CONSTRAINT `egresomprid` FOREIGN KEY (`mpr_id`) REFERENCES `tbl_materiaprima` (`mpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_listaegresosmp`
--

LOCK TABLES `tbl_listaegresosmp` WRITE;
/*!40000 ALTER TABLE `tbl_listaegresosmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_listaegresosmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_materiaprima`
--

DROP TABLE IF EXISTS `tbl_materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_materiaprima` (
  `mpr_id` int NOT NULL AUTO_INCREMENT,
  `mpr_codigo` varchar(45) DEFAULT NULL,
  `mpr_detalle` varchar(45) DEFAULT NULL,
  `mpr_estado` int DEFAULT NULL,
  `prv_id` int DEFAULT NULL,
  `mpr_cunitario` double DEFAULT NULL,
  `mpr_cantidad` double DEFAULT NULL,
  PRIMARY KEY (`mpr_id`),
  KEY `prvid_idx` (`prv_id`),
  CONSTRAINT `prvid` FOREIGN KEY (`prv_id`) REFERENCES `tbl_proveedor` (`prv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_materiaprima`
--

LOCK TABLES `tbl_materiaprima` WRITE;
/*!40000 ALTER TABLE `tbl_materiaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenproduccion`
--

DROP TABLE IF EXISTS `tbl_ordenproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenproduccion` (
  `opr_id` int NOT NULL AUTO_INCREMENT,
  `itm_id` int DEFAULT NULL,
  `opr_estado` int DEFAULT NULL,
  `opr_total` double DEFAULT NULL,
  `opr_cunitario` double DEFAULT NULL,
  PRIMARY KEY (`opr_id`),
  KEY `itemID_idx` (`itm_id`),
  CONSTRAINT `itemID` FOREIGN KEY (`itm_id`) REFERENCES `tbl_item` (`itm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenproduccion`
--

LOCK TABLES `tbl_ordenproduccion` WRITE;
/*!40000 ALTER TABLE `tbl_ordenproduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pedido`
--

DROP TABLE IF EXISTS `tbl_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pedido` (
  `ped_id` int NOT NULL AUTO_INCREMENT,
  `ped_estado` int DEFAULT NULL,
  `ped_fecha` datetime DEFAULT NULL,
  `cli_id` int DEFAULT NULL,
  `ped_total` double DEFAULT NULL,
  PRIMARY KEY (`ped_id`),
  KEY `cliid2_idx` (`cli_id`),
  CONSTRAINT `cliid2` FOREIGN KEY (`cli_id`) REFERENCES `tbl_cliente` (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pedido`
--

LOCK TABLES `tbl_pedido` WRITE;
/*!40000 ALTER TABLE `tbl_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_producto`
--

DROP TABLE IF EXISTS `tbl_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_producto` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `pro_detalle` varchar(45) DEFAULT NULL,
  `pro_pvp` double DEFAULT NULL,
  `pro_estado` int DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_producto`
--

LOCK TABLES `tbl_producto` WRITE;
/*!40000 ALTER TABLE `tbl_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proveedor`
--

DROP TABLE IF EXISTS `tbl_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_proveedor` (
  `prv_id` int NOT NULL AUTO_INCREMENT,
  `prv_ruc` varchar(45) DEFAULT NULL,
  `prv_autorizacion` varchar(45) DEFAULT NULL,
  `prv_nombre` varchar(45) DEFAULT NULL,
  `prv_estado` int DEFAULT NULL,
  PRIMARY KEY (`prv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proveedor`
--

LOCK TABLES `tbl_proveedor` WRITE;
/*!40000 ALTER TABLE `tbl_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_registros`
--

DROP TABLE IF EXISTS `tbl_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_registros` (
  `reg_id` int NOT NULL AUTO_INCREMENT,
  `reg_fechaingreso` datetime DEFAULT NULL,
  `reg_fechasalida` datetime DEFAULT NULL,
  `reg_estado` int DEFAULT NULL,
  `usu_id` int DEFAULT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `usuarioID_idx` (`usu_id`),
  CONSTRAINT `usuarioID` FOREIGN KEY (`usu_id`) REFERENCES `tbl_usuario` (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_registros`
--

LOCK TABLES `tbl_registros` WRITE;
/*!40000 ALTER TABLE `tbl_registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(45) DEFAULT NULL,
  `usu_contrasena` varchar(45) DEFAULT NULL,
  `usu_estado` int DEFAULT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'admin','7110eda4d09e062aa5e4a390b0a572ac0d2c0220',0);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bdd_enci'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_CLIENTEPORID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_CLIENTEPORID`(in cliid varchar(45))
BEGIN

update bdd_enci.tbl_cliente set cli_estado=1
where bdd_enci.tbl_cliente.cli_id = cliid;
select*from bdd_enci.tbl_cliente where cli_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_DPEDPORITEMID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_DPEDPORITEMID`(in itmid int)
BEGIN

update bdd_enci.tbl_detallepedido set dped_estado=1
where bdd_enci.tbl_detallepedido.itm_id = itmid;
select*from bdd_enci.tbl_detallepedido where dped_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_DPEDPORPEDID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_DPEDPORPEDID`(in pedid int)
BEGIN

update bdd_enci.tbl_detallepedido set dped_estado=1
where bdd_enci.tbl_detallepedido.ped_id = pedid;
select*from bdd_enci.tbl_detallepedido where dped_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_LEGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_LEGRESO`(in legrid int)
BEGIN

update bdd_enci.tbl_listaegresos set legr_estado = 1
where bdd_enci.tbl_listaegresos.legr_id = legrid;
select * from bdd_enci.tbl_listaegresos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_LEGRESOMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_LEGRESOMP`(in lmpid int)
BEGIN

update bdd_enci.tbl_listaegresosmp set lmp_estado = 1
where bdd_enci.tbl_listaegresosmp.lmp_id = lmpid;
select * from bdd_enci.tbl_listaegresosmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_ORDENPRODUCCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_ORDENPRODUCCION`(in oprid varchar(45))
BEGIN

update bdd_enci.tbl_ordenproduccion set opr_estado=1
where bdd_enci.tbl_ordenproduccion.opr_id = oprid;
select*from bdd_enci.tbl_ordenproduccion where opr_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELETE_PEDIDOPORITEMID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELETE_PEDIDOPORITEMID`(in itmid int)
BEGIN

update bdd_enci.tbl_detallepedido set dped_estado=1
where bdd_enci.tbl_detallepedido.itm_id = itmid;
select*from bdd_enci.tbl_detallepedido where dped_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_CLIENTE`(in nombre varchar(45), in  identificacion varchar(45))
BEGIN
insert into bdd_enci.tbl_cliente(cli_nombre,cli_identificacion,cli_estado) 
values(nombre,identificacion,0);
select*from bdd_enci.tbl_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_COSTOPORORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_COSTOPORORDEN`(in oprid int, in legrid int, in comentario varchar(3000))
BEGIN

insert into bdd_enci.tbl_costopororden(opr_id,legr_id,cop_comentario,cop_estado) 
values(
oprid,
legrid,
comentario,
0);

select * from  bdd_enci.tbl_costopororden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_DETALLEORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_DETALLEORDEN`(in oprid int, in legrid int)
BEGIN

insert into bdd_enci.tbl_detalleorden(opr_id,legr_id,det_estado) 
values(
oprid,
legrid,
0);

select * from bdd_enci.tbl_detalleorden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_DETALLEORDENMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_DETALLEORDENMP`(in oprid int, in lmpid int)
BEGIN

insert into bdd_enci.tbl_detalleordenmp(opr_id,lmp_id,detmp_estado) 
values(
oprid,
lmpid,
0);

select * from bdd_enci.tbl_detalleordenmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_DETALLEPEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_DETALLEPEDIDO`(in pedidoid int, in itemid int)
BEGIN

insert into bdd_enci.tbl_detallepedido(ped_id,itm_id,dped_estado) 
values(
pedidoid,
itemid,
0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_DEVOLUCION_KARDEX` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_DEVOLUCION_KARDEX`(in mprid int, in cantidad double, 
in cunitario double, in fecha varchar(45), in oprid int)
BEGIN
/*Se devuelve materia prima desde produccion, no es una compra al proveedor*/

declare ctotal double; /*de la entrada*/
declare ctotalsd double;
declare karid int;
declare cant int; /*anterior cantidad en saldo*/
declare total double; /*anterior ctotal de saldo*/
declare cunitariosd double;
declare cantsd int;
set ctotal = (cunitario*cantidad); /*de la entrada*/
set karid = (select kar_id from bdd_enci.tbl_kardex  WHERE mpr_id = mprid ORDER BY kar_id desc limit 1);

if(karid= 0 or karid IS NULL) then set cant = 0;
set total = 0;

else set cant = (select kar_sd_cantidad from bdd_enci.tbl_kardex  where kar_id = karid);
set total = (select kar_sd_ctotal from bdd_enci.tbl_kardex  where kar_id = karid);
end if;

set cantsd = (cant+cantidad);
set ctotalsd = (total + ctotal);
set cunitariosd = ctotalsd/cantsd;
insert into bdd_enci.tbl_kardex(mpr_id,kar_fecha,kar_descripcion,kar_en_cantidad,kar_en_cunitario,kar_en_ctotal,
kar_sd_cantidad, kar_sd_cunitario, kar_sd_ctotal, kar_estado, opr_id) 
values(mprid,
fecha,
"DEVOLUCION",
cantidad,
ROUND(cunitario,2),
ROUND(ctotal,2),
cantsd,
ROUND(cunitariosd,2),
ROUND(ctotalsd,2),
0,
oprid);

UPDATE `bdd_enci`.`tbl_materiaprima`
SET
`mpr_cunitario` = ROUND(cunitariosd,2),
`mpr_cantidad` = cantsd
WHERE `mpr_id` = mprid;

select*from bdd_enci.tbl_kardex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_EGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_EGRESO`(in detalle varchar(45), in clasificacion varchar(45), in cantidad int, in costounitario double, in iva double)
BEGIN

/*declare iva double;*/
declare total double;
declare costototal double;
declare totalporiva double;
/*CAMBIAR A INGRESO DE IVA MANUAL*/
/*set iva = (select iva_valor from bdd_enci.tbl_iva  ORDER BY iva_id DESC LIMIT 1);*/
set costototal = costounitario * cantidad;
set totalporiva = costototal * iva;
set total = costototal + totalporiva;

insert into bdd_enci.tbl_egreso(egr_detalle,egr_clasificacion,egr_cantidad,egr_costounitario,egr_costototal,egr_total,egr_estado) 
values(detalle,clasificacion,cantidad,ROUND(costounitario,2),ROUND(costototal,2),ROUND(total,2),0);
select*from bdd_enci.tbl_egreso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_ENTRADA_KARDEX` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ENTRADA_KARDEX`(in mprid int, in cantidad double, 
in cunitario double, in fecha varchar(45))
BEGIN

declare ctotal double; /*de la entrada*/
declare ctotalsd double;
declare karid int;
declare cant int; /*anterior cantidad en saldo*/
declare total double; /*anterior ctotal de saldo*/
declare cunitariosd double;
declare cantsd int;
set ctotal = (cunitario*cantidad); /*de la entrada*/
set karid = (select kar_id from bdd_enci.tbl_kardex  WHERE mpr_id = mprid ORDER BY kar_id desc limit 1);

if(karid= 0 or karid IS NULL) then set cant = 0;
set total = 0;

else set cant = (select kar_sd_cantidad from bdd_enci.tbl_kardex  where kar_id = karid);
set total = (select kar_sd_ctotal from bdd_enci.tbl_kardex  where kar_id = karid);
end if;

set cantsd = (cant+cantidad);
set ctotalsd = (total + ctotal);
set cunitariosd = ctotalsd/cantsd;
insert into bdd_enci.tbl_kardex(mpr_id,kar_fecha,kar_descripcion,kar_en_cantidad,kar_en_cunitario,kar_en_ctotal,
kar_sd_cantidad, kar_sd_cunitario, kar_sd_ctotal, kar_estado) 
values(mprid,
fecha,
"ENTRADA",
cantidad,
ROUND(cunitario,2),
ROUND(ctotal,2),
cantsd,
ROUND(cunitariosd,2),
ROUND(ctotalsd,2),
0);

UPDATE `bdd_enci`.`tbl_materiaprima`
SET
`mpr_cunitario` = ROUND(cunitariosd,2),
`mpr_cantidad` = cantsd
WHERE `mpr_id` = mprid;

select*from bdd_enci.tbl_kardex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_ITEM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ITEM`(
in cliid int, in itmcantidad int, in prodetalle varchar(45), in propvp double, in itmfechainicio varchar(45), in itmfechafin varchar(45), in itmdescripcion varchar(100), in itmnumpedido int, in itmtotal double)
BEGIN

declare proid int;
call SP_INSERT_PRODUCTO(prodetalle,propvp);

set proid = (select pro_id from bdd_enci.tbl_producto  ORDER BY pro_id DESC LIMIT 1);
insert into bdd_enci.tbl_item(cli_id,itm_fecha,itm_cantidad,itm_fechainicio,itm_fechafinalizacion,itm_numpedido,pro_id,itm_estado, itm_descripcion, itm_total) 
values(
cliid,
itmfechainicio,
itmcantidad,
itmfechainicio,
itmfechafin, 
itmnumpedido,
proid,
0,
itmdescripcion,
itmtotal);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_IVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_IVA`(in valor double)
BEGIN
insert into bdd_enci.tbl_iva(iva_valor,iva_fecha,iva_estado) 
values(ROUND(valor,2), NOW(), 0);
select*from bdd_enci.tbl_iva;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_KARDEX` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_KARDEX`(in mprid int)
BEGIN
insert into bdd_enci.tbl_kardex(mpr_id,kar_estado) 
values(mprid,0);
select*from bdd_enci.tbl_kardex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_LISTAEGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_LISTAEGRESOS`(
in egrdetalle varchar(45), in egrclasificacion varchar(45), in egrcantidad int, in egrcunitario double, in iva double, in fecha varchar(45))
BEGIN


call SP_INSERT_EGRESO(egrdetalle,egrclasificacion,egrcantidad,egrcunitario,iva);

insert into bdd_enci.tbl_listaegresos(legr_fecha,iva_valor,egr_id,legr_estado) 
values(
fecha,
iva,
(select egr_id from bdd_enci.tbl_egreso  ORDER BY egr_id DESC LIMIT 1),
0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_LISTAEGRESOSMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_LISTAEGRESOSMP`(
in iva double, in mprid int, in cantidad double, in cunitario double, in esdevolucion int, in fecha varchar(45), in dev varchar(45))
BEGIN
declare total double;
declare totaliva double;
declare costototal double;
set total = cantidad * cunitario;
set totaliva = (total * iva);
set costototal = totaliva + total;
/*se va con total y no costototal porque el iva ya viene cargado en el valor unitario desde el kardex*/
insert into bdd_enci.tbl_listaegresosmp(lmp_fecha,iva_valor,mpr_id,lmp_estado,lmp_cantidad,lmp_cunitario,lmp_costototal,lmp_total, lmp_esdevolucion, lmp_dev) 
values(
fecha,
iva,
mprid,
0,
cantidad,
ROUND(cunitario,2),
ROUND(total,2),
ROUND(total,2),
esdevolucion,
dev);

select* from tbl_listaegresosmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_MATERIAPRIMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_MATERIAPRIMA`(
in mprcodigo varchar(45), mprdetalle varchar(45), in prvid int)
BEGIN

insert into bdd_enci.tbl_materiaprima(mpr_codigo,mpr_detalle,mpr_cunitario,mpr_estado,prv_id,mpr_cantidad) 
values(
mprcodigo,
mprdetalle,
0,
0,
prvid,
0);
SELECT * from tbl_materiaprima;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_ORDENPRODUCCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_ORDENPRODUCCION`(in itemid int)
BEGIN
insert into bdd_enci.tbl_ordenproduccion(itm_id,opr_estado, opr_total, opr_cunitario) 
values(itemid,
0,
0,
0
);
select*from bdd_enci.tbl_ordenproduccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PEDIDO`(in cliid int, in fecha varchar(45))
BEGIN
insert into bdd_enci.tbl_pedido(ped_fecha,ped_estado, cli_id, ped_total) 
values(
fecha, 
0, 
cliid,
0);
select*from bdd_enci.tbl_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PRODUCTO`(in detalle varchar(45), in  pvp double)
BEGIN
insert into bdd_enci.tbl_producto(pro_detalle,pro_pvp,pro_estado) 
values(detalle,pvp,0);
select*from bdd_enci.tbl_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_PROVEEDOR`(in ruc varchar(45), in  autorizacion varchar(45), nombre varchar(45))
BEGIN
insert into bdd_enci.tbl_proveedor(prv_ruc,prv_autorizacion,prv_nombre,prv_estado) 
values(ruc,autorizacion,nombre,0);
select*from bdd_enci.tbl_proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_REGISTRO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_REGISTRO`(in nombre varchar(45))
BEGIN

declare usuid int;
set usuid = (select usu_id from bdd_enci.tbl_usuario where usu_nombre = nombre);

insert into bdd_enci.tbl_registros(usu_id,reg_fechaingreso,reg_fechasalida,reg_estado) 
values(
usuid,
NOW(),
"0000-00-00",
0);
select*from bdd_enci.tbl_registros;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_SALIDA_KARDEX` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SALIDA_KARDEX`(in mprid int, in cantidad double,in fecha varchar(45), in oprid int)
BEGIN

declare karid int;
declare ctotal double; /*de la salida*/
declare cant int; /*anterior cantidad en saldo*/
declare total double; /*anterior ctotal de saldo*/
declare cunitariosd double;
declare cantsd int;
declare ctotalsd double;
set karid = (select kar_id from bdd_enci.tbl_kardex  WHERE mpr_id = mprid ORDER BY kar_id desc limit 1);

if(karid= 0 or karid IS NULL) then set cant = 0;
set total = 0;

else set cant = (select kar_sd_cantidad from bdd_enci.tbl_kardex  where kar_id = karid);
end if;

set cantsd = (cant-cantidad);
set cunitariosd = (select kar_sd_cunitario from bdd_enci.tbl_kardex  where kar_id = karid);
set total = (cantidad * cunitariosd);
set ctotalsd = (cantsd * cunitariosd);

insert into bdd_enci.tbl_kardex(mpr_id,kar_fecha,kar_descripcion,kar_sa_cantidad,kar_sa_cunitario,kar_sa_ctotal,
kar_sd_cantidad, kar_sd_cunitario, kar_sd_ctotal, kar_estado, opr_id) 
values(mprid,
fecha,
"SALIDA",
cantidad,
ROUND(cunitariosd,2),
ROUND(total,2),
cantsd,
ROUND(cunitariosd,2),
ROUND(ctotalsd,2),
0, 
oprid);

UPDATE `bdd_enci`.`tbl_materiaprima`
SET
`mpr_cunitario` = ROUND(cunitariosd,2),
`mpr_cantidad` = cantsd

WHERE `mpr_id` = mprid;


select*from bdd_enci.tbl_kardex;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERT_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_USUARIO`(in nombre varchar(45), in  contrasena varchar(45))
BEGIN
insert into bdd_enci.tbl_usuario(usu_nombre,usu_contrasena,usu_estado) 
values(nombre,SHA(contrasena),0);
select*from bdd_enci.tbl_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_CLIENTEPORID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_CLIENTEPORID`(in cliid varchar(45))
BEGIN
select * from bdd_enci.tbl_cliente where cli_id = cliid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_CLIENTEPORIDENTIFICACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_CLIENTEPORIDENTIFICACION`(in identificacion varchar(45))
BEGIN
select * from bdd_enci.tbl_cliente where cli_identificacion = identificacion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_CLIENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_CLIENTES`()
BEGIN
select * from bdd_enci.tbl_cliente where cli_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_COSTOEGRESOPOROP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_COSTOEGRESOPOROP`(in oprid int)
BEGIN

select 


bdd_enci.tbl_egreso.egr_clasificacion,
bdd_enci.tbl_egreso.egr_total


FROM bdd_enci.tbl_detalleorden
INNER JOIN bdd_enci.tbl_listaegresos
    ON bdd_enci.tbl_detalleorden.legr_id = bdd_enci.tbl_listaegresos.legr_id
    
INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.legr_id = bdd_enci.tbl_egreso.egr_id

where bdd_enci.tbl_detalleorden.opr_id = oprid and bdd_enci.tbl_listaegresos.legr_estado = 0;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_COSTOEGRESOTIPO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_COSTOEGRESOTIPO`(in oprid int, in clasificacion varchar(45))
BEGIN

select 

SUM(egr_total) AS suma 


FROM bdd_enci.tbl_detalleorden
INNER JOIN bdd_enci.tbl_listaegresos
    ON bdd_enci.tbl_detalleorden.legr_id = bdd_enci.tbl_listaegresos.legr_id
    
INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.legr_id = bdd_enci.tbl_egreso.egr_id

where bdd_enci.tbl_detalleorden.opr_id = oprid AND bdd_enci.tbl_egreso.egr_clasificacion = clasificacion AND bdd_enci.tbl_listaegresos.legr_estado = 0;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_COSTOITEMPOROP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_COSTOITEMPOROP`(in oprid int)
BEGIN

select 

bdd_enci.tbl_ordenproduccion.opr_id,
bdd_enci.tbl_item.itm_tipo,
bdd_enci.tbl_ordenproduccion.opr_total


FROM bdd_enci.tbl_ordenproduccion
INNER JOIN bdd_enci.tbl_item
    ON bdd_enci.tbl_ordenproduccion.opr_id = bdd_enci.tbl_item.itm_id

where bdd_enci.tbl_detalleorden.opr_id = oprid;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_COSTOPORORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_COSTOPORORDEN`(in legrid int)
BEGIN


select 
bdd_enci.tbl_listaegresos.legr_id,
bdd_enci.tbl_ordenproduccion.opr_id,
bdd_enci.tbl_costopororden.cop_comentario

FROM bdd_enci.tbl_costopororden

INNER JOIN bdd_enci.tbl_ordenproduccion
    ON bdd_enci.tbl_costopororden.opr_id = bdd_enci.tbl_ordenproduccion.opr_id
    
INNER JOIN bdd_enci.tbl_listaegresos
    ON bdd_enci.tbl_costopororden.legr_id = bdd_enci.tbl_listaegresos.legr_id

    WHERE(bdd_enci.tbl_costopororden.legr_id = legrid);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_CUNITARIOOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_CUNITARIOOP`(in total double, in cantidad int)
BEGIN
declare cunitario double;
set cunitario = total/cantidad;
select cunitario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_DETALLEPEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_DETALLEPEDIDO`()
BEGIN
select * FROM bdd_enci.tbl_detallepedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_EGRESOPORLEGRID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_EGRESOPORLEGRID`(in legrid int)
BEGIN
select 
bdd_enci.tbl_listaegresos.egr_id

WHERE bdd_enci.tbl_listaegresos.legr_id = legrid; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ITEM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ITEM`()
BEGIN
select 

bdd_enci.tbl_item.itm_id,

bdd_enci.tbl_cliente.cli_nombre,
bdd_enci.tbl_cliente.cli_identificacion,

bdd_enci.tbl_item.itm_cantidad,

bdd_enci.tbl_producto.pro_detalle,
bdd_enci.tbl_producto.pro_pvp,

bdd_enci.tbl_item.itm_fechainicio,
bdd_enci.tbl_item.itm_fechafinalizacion,
bdd_enci.tbl_item.itm_numpedido,
bdd_enci.tbl_item.itm_descripcion


FROM bdd_enci.tbl_item
INNER JOIN bdd_enci.tbl_cliente
    ON bdd_enci.tbl_item.cli_id = bdd_enci.tbl_cliente.cli_id

INNER JOIN bdd_enci.tbl_producto
    ON bdd_enci.tbl_item.pro_id = bdd_enci.tbl_producto.pro_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ITEMPORPEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ITEMPORPEDIDO`(in pedid int)
BEGIN
select 

bdd_enci.tbl_item.itm_id,

bdd_enci.tbl_cliente.cli_nombre,
bdd_enci.tbl_cliente.cli_identificacion,

bdd_enci.tbl_item.itm_cantidad,

bdd_enci.tbl_producto.pro_detalle,
bdd_enci.tbl_producto.pro_pvp,

bdd_enci.tbl_item.itm_fechainicio,
bdd_enci.tbl_item.itm_fechafinalizacion,
bdd_enci.tbl_item.itm_numpedido,
bdd_enci.tbl_item.itm_descripcion,
bdd_enci.tbl_item.itm_total


FROM bdd_enci.tbl_detallepedido

INNER JOIN bdd_enci.tbl_item
    ON bdd_enci.tbl_detallepedido.itm_id = bdd_enci.tbl_item.itm_id
    
    INNER JOIN bdd_enci.tbl_pedido
    ON bdd_enci.tbl_detallepedido.ped_id = bdd_enci.tbl_pedido.ped_id
    
INNER JOIN bdd_enci.tbl_cliente
    ON bdd_enci.tbl_item.cli_id = bdd_enci.tbl_cliente.cli_id

INNER JOIN bdd_enci.tbl_producto
    ON bdd_enci.tbl_item.pro_id = bdd_enci.tbl_producto.pro_id
    
    WHERE bdd_enci.tbl_detallepedido.ped_id = pedid and dped_estado = 0
    ORDER BY bdd_enci.tbl_item.itm_id DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_IVAACTUAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_IVAACTUAL`()
BEGIN
select * FROM bdd_enci.tbl_iva ORDER BY iva_id DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_IVAHISTORIAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_IVAHISTORIAL`()
BEGIN
select * FROM bdd_enci.tbl_iva;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_KARDEXPORMPRID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_KARDEXPORMPRID`(in mprid int)
BEGIN
select 

bdd_enci.tbl_kardex.kar_id,
bdd_enci.tbl_kardex.opr_id,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_kardex.kar_fecha,
bdd_enci.tbl_kardex.kar_descripcion,
bdd_enci.tbl_kardex.kar_en_cantidad,
bdd_enci.tbl_kardex.kar_en_cunitario,
bdd_enci.tbl_kardex.kar_en_ctotal,

bdd_enci.tbl_kardex.kar_sa_cantidad,
bdd_enci.tbl_kardex.kar_sa_cunitario,
bdd_enci.tbl_kardex.kar_sa_ctotal,

bdd_enci.tbl_kardex.kar_sd_cantidad,
bdd_enci.tbl_kardex.kar_sd_cunitario,
bdd_enci.tbl_kardex.kar_sd_ctotal


FROM bdd_enci.tbl_kardex

INNER JOIN bdd_enci.tbl_materiaprima
    ON bdd_enci.tbl_kardex.mpr_id = bdd_enci.tbl_materiaprima.mpr_id
   
    
WHERE bdd_enci.tbl_kardex.mpr_id = mprid and kar_estado = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_LISTAEGRESOMPPOROP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_LISTAEGRESOMPPOROP`(in oprid int)
BEGIN

select 

bdd_enci.tbl_listaegresosmp.lmp_id,
bdd_enci.tbl_listaegresosmp.lmp_fecha,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_listaegresosmp.lmp_cantidad,
bdd_enci.tbl_listaegresosmp.lmp_cunitario,
bdd_enci.tbl_listaegresosmp.lmp_costototal,
bdd_enci.tbl_listaegresosmp.iva_valor,
bdd_enci.tbl_listaegresosmp.lmp_total,
bdd_enci.tbl_listaegresosmp.lmp_esdevolucion,
bdd_enci.tbl_listaegresosmp.lmp_dev


FROM bdd_enci.tbl_detalleordenmp
INNER JOIN bdd_enci.tbl_listaegresosmp
    ON bdd_enci.tbl_detalleordenmp.lmp_id = bdd_enci.tbl_listaegresosmp.lmp_id
    
    INNER JOIN bdd_enci.tbl_materiaprima
    ON bdd_enci.tbl_listaegresosmp.mpr_id = bdd_enci.tbl_materiaprima.mpr_id

where bdd_enci.tbl_detalleordenmp.opr_id = oprid AND bdd_enci.tbl_listaegresosmp.lmp_estado = 0

ORDER BY bdd_enci.tbl_listaegresosmp.lmp_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_LISTAEGRESOPOROP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_LISTAEGRESOPOROP`(in oprid int)
BEGIN

select 

bdd_enci.tbl_listaegresos.legr_id,
bdd_enci.tbl_listaegresos.legr_fecha,
bdd_enci.tbl_egreso.egr_detalle,
bdd_enci.tbl_egreso.egr_clasificacion,
bdd_enci.tbl_egreso.egr_cantidad,
bdd_enci.tbl_egreso.egr_costounitario,
bdd_enci.tbl_egreso.egr_costototal,
bdd_enci.tbl_listaegresos.iva_valor,
bdd_enci.tbl_egreso.egr_total


FROM bdd_enci.tbl_detalleorden
INNER JOIN bdd_enci.tbl_listaegresos
    ON bdd_enci.tbl_detalleorden.legr_id = bdd_enci.tbl_listaegresos.legr_id
    
    INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id


where bdd_enci.tbl_detalleorden.opr_id = oprid AND bdd_enci.tbl_listaegresos.legr_estado = 0

ORDER BY bdd_enci.tbl_listaegresos.legr_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_LISTAEGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_LISTAEGRESOS`()
BEGIN
select 

bdd_enci.tbl_listaegresos.legr_id,
bdd_enci.tbl_listaegresos.legr_fecha,
bdd_enci.tbl_egreso.egr_detalle,
bdd_enci.tbl_egreso.egr_clasificacion,
bdd_enci.tbl_egreso.egr_cantidad,
bdd_enci.tbl_egreso.egr_costounitario,
bdd_enci.tbl_egreso.egr_costototal,
bdd_enci.tbl_listaegresos.iva_valor,
bdd_enci.tbl_egreso.egr_total


FROM bdd_enci.tbl_listaegresos
INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id

WHERE bdd_enci.tbl_listaegresos.legr_estado = 0 

ORDER BY bdd_enci.tbl_listaegresos.legr_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_LISTAEGRESOSMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_LISTAEGRESOSMP`()
BEGIN
select 

bdd_enci.tbl_listaegresosmp.lmp_id,
bdd_enci.tbl_listaegresosmp.lmp_fecha,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_proveedor.prv_ruc,
bdd_enci.tbl_proveedor.prv_autorizacion,
bdd_enci.tbl_proveedor.prv_nombre,
bdd_enci.tbl_listaegresosmp.lmp_cantidad,
bdd_enci.tbl_listaegresosmp.lmp_cunitario,
bdd_enci.tbl_listaegresosmp.lmp_costototal,
bdd_enci.tbl_listaegresosmp.iva_valor,
bdd_enci.tbl_listaegresosmp.lmp_total


FROM bdd_enci.tbl_listaegresosmp
INNER JOIN bdd_enci.tbl_materiaprima
    ON bdd_enci.tbl_listaegresosmp.mpr_id = bdd_enci.tbl_materiaprima.mpr_id

INNER JOIN bdd_enci.tbl_proveedor
    ON bdd_enci.tbl_materiaprima.prv_id = bdd_enci.tbl_proveedor.prv_id

WHERE bdd_enci.tbl_listaegresosmp.lmp_estado = 0 

ORDER BY bdd_enci.tbl_listaegresosmp.lmp_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_LISTAEGRESOSMPPORLMPID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_LISTAEGRESOSMPPORLMPID`(in lmpid int)
BEGIN
select 

bdd_enci.tbl_listaegresosmp.lmp_id,
bdd_enci.tbl_listaegresosmp.lmp_fecha,
bdd_enci.tbl_materiaprima.mpr_id,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_proveedor.prv_ruc,
bdd_enci.tbl_proveedor.prv_autorizacion,
bdd_enci.tbl_proveedor.prv_nombre,
bdd_enci.tbl_listaegresosmp.lmp_cantidad,
bdd_enci.tbl_listaegresosmp.lmp_cunitario,
bdd_enci.tbl_listaegresosmp.lmp_costototal,
bdd_enci.tbl_listaegresosmp.iva_valor,
bdd_enci.tbl_listaegresosmp.lmp_total


FROM bdd_enci.tbl_listaegresosmp
INNER JOIN bdd_enci.tbl_materiaprima
    ON bdd_enci.tbl_listaegresosmp.mpr_id = bdd_enci.tbl_materiaprima.mpr_id

INNER JOIN bdd_enci.tbl_proveedor
    ON bdd_enci.tbl_materiaprima.prv_id = bdd_enci.tbl_proveedor.prv_id

WHERE bdd_enci.tbl_listaegresosmp.lmp_estado = 0 AND  bdd_enci.tbl_listaegresosmp.lmp_id = lmpid

ORDER BY bdd_enci.tbl_listaegresosmp.lmp_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_LISTAEGRESOSPORLEGRID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_LISTAEGRESOSPORLEGRID`(in legrid int)
BEGIN
select 

bdd_enci.tbl_listaegresos.legr_id,
bdd_enci.tbl_listaegresos.legr_fecha,
bdd_enci.tbl_egreso.egr_detalle,
bdd_enci.tbl_egreso.egr_clasificacion,
bdd_enci.tbl_egreso.egr_cantidad,
bdd_enci.tbl_egreso.egr_costounitario,
bdd_enci.tbl_egreso.egr_costototal,
bdd_enci.tbl_listaegresos.iva_valor,
bdd_enci.tbl_egreso.egr_total


FROM bdd_enci.tbl_listaegresos
INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id


WHERE bdd_enci.tbl_listaegresos.legr_id = legrid; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_MATERIAPRIMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_MATERIAPRIMA`()
BEGIN
select 

bdd_enci.tbl_materiaprima.mpr_id,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_materiaprima.mpr_cunitario,
bdd_enci.tbl_proveedor.prv_nombre

FROM bdd_enci.tbl_materiaprima
INNER JOIN bdd_enci.tbl_proveedor
    ON bdd_enci.tbl_materiaprima.prv_id = bdd_enci.tbl_proveedor.prv_id
 where bdd_enci.tbl_materiaprima.mpr_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_MATERIAPRIMAPORCODIGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_MATERIAPRIMAPORCODIGO`(in mprcodigo varchar(45))
BEGIN
select 

bdd_enci.tbl_materiaprima.mpr_id,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_materiaprima.mpr_cunitario,
bdd_enci.tbl_materiaprima.mpr_cantidad,
bdd_enci.tbl_proveedor.prv_ruc,
bdd_enci.tbl_proveedor.prv_nombre,
bdd_enci.tbl_proveedor.prv_autorizacion


FROM bdd_enci.tbl_materiaprima
INNER JOIN bdd_enci.tbl_proveedor
    ON bdd_enci.tbl_materiaprima.prv_id = bdd_enci.tbl_proveedor.prv_id

where bdd_enci.tbl_materiaprima.mpr_codigo = mprcodigo;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_MATERIAPRIMAPORID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_MATERIAPRIMAPORID`(in mprid varchar(45))
BEGIN
select 

bdd_enci.tbl_materiaprima.mpr_id,
bdd_enci.tbl_materiaprima.mpr_codigo,
bdd_enci.tbl_materiaprima.mpr_detalle,
bdd_enci.tbl_materiaprima.mpr_cunitario,
bdd_enci.tbl_materiaprima.mpr_cantidad,
bdd_enci.tbl_proveedor.prv_ruc,
bdd_enci.tbl_proveedor.prv_nombre,
bdd_enci.tbl_proveedor.prv_autorizacion



FROM bdd_enci.tbl_materiaprima
INNER JOIN bdd_enci.tbl_proveedor
    ON bdd_enci.tbl_materiaprima.prv_id = bdd_enci.tbl_proveedor.prv_id

where bdd_enci.tbl_materiaprima.mpr_id = mprid;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_OPPORITEMID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_OPPORITEMID`(in itemid int)
BEGIN

select 
bdd_enci.tbl_ordenproduccion.opr_id,
bdd_enci.tbl_item.itm_id,
bdd_enci.tbl_producto.pro_detalle,
bdd_enci.tbl_item.itm_cantidad,
bdd_enci.tbl_item.itm_fecha,
bdd_enci.tbl_item.itm_fechainicio,
bdd_enci.tbl_item.itm_fechafinalizacion,
bdd_enci.tbl_item.itm_numpedido

FROM bdd_enci.tbl_ordenproduccion

INNER JOIN bdd_enci.tbl_item
    ON bdd_enci.tbl_ordenproduccion.itm_id = bdd_enci.tbl_item.itm_id
    
INNER JOIN bdd_enci.tbl_producto
    ON bdd_enci.tbl_item.pro_id = bdd_enci.tbl_producto.pro_id
WHERE bdd_enci.tbl_ordenproduccion.itm_id = itemid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ORDENESPRODUCCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ORDENESPRODUCCION`()
BEGIN
select 

bdd_enci.tbl_ordenproduccion.opr_id,
bdd_enci.tbl_ordenproduccion.itm_id,
bdd_enci.tbl_producto.pro_detalle,
bdd_enci.tbl_item.itm_cantidad,
bdd_enci.tbl_item.itm_fecha,
bdd_enci.tbl_producto.pro_pvp,
bdd_enci.tbl_item.itm_fechainicio,
bdd_enci.tbl_item.itm_fechafinalizacion,
bdd_enci.tbl_item.itm_numpedido


FROM bdd_enci.tbl_ordenproduccion
INNER JOIN bdd_enci.tbl_item
    ON bdd_enci.tbl_ordenproduccion.itm_id = bdd_enci.tbl_item.itm_id

INNER JOIN bdd_enci.tbl_producto
    ON bdd_enci.tbl_item.pro_id = bdd_enci.tbl_producto.pro_id
WHERE bdd_enci.tbl_ordenproduccion.opr_estado = 0

ORDER BY bdd_enci.tbl_ordenproduccion.opr_id DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ORDENPORFECHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ORDENPORFECHA`(in inicio varchar(45), in fin varchar(45))
BEGIN
select 
bdd_enci.tbl_ordenproduccion.opr_id,
bdd_enci.tbl_ordenproduccion.itm_id,
bdd_enci.tbl_producto.pro_detalle,
bdd_enci.tbl_item.itm_cantidad,
bdd_enci.tbl_item.itm_fecha,
bdd_enci.tbl_producto.pro_pvp,
bdd_enci.tbl_item.itm_fechainicio,
bdd_enci.tbl_item.itm_fechafinalizacion,
bdd_enci.tbl_item.itm_numpedido


FROM bdd_enci.tbl_ordenproduccion
INNER JOIN bdd_enci.tbl_item
    ON bdd_enci.tbl_ordenproduccion.itm_id = bdd_enci.tbl_item.itm_id

INNER JOIN bdd_enci.tbl_producto
    ON bdd_enci.tbl_item.pro_id = bdd_enci.tbl_producto.pro_id
    
WHERE (itm_fecha BETWEEN inicio AND CONCAT(fin, " 23:59:59"));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PEDIDO`(in pedido_id int)
BEGIN
/*select * FROM bdd_enci.tbl_pedido WHERE ped_id = pedido_id;*/
select

bdd_enci.tbl_pedido.ped_id,
bdd_enci.tbl_cliente.cli_id,
bdd_enci.tbl_cliente.cli_nombre,
bdd_enci.tbl_cliente.cli_identificacion,
bdd_enci.tbl_pedido.ped_fecha

FROM bdd_enci.tbl_pedido
INNER JOIN bdd_enci.tbl_cliente
    ON bdd_enci.tbl_pedido.cli_id = bdd_enci.tbl_cliente.cli_id
WHERE  bdd_enci.tbl_pedido.ped_id = pedido_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PEDIDOPORFECHA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PEDIDOPORFECHA`(in inicio varchar(45), in fin varchar(45))
BEGIN
select 

bdd_enci.tbl_pedido.ped_id,
bdd_enci.tbl_cliente.cli_nombre,
bdd_enci.tbl_cliente.cli_identificacion,
bdd_enci.tbl_pedido.ped_fecha

FROM bdd_enci.tbl_pedido
INNER JOIN bdd_enci.tbl_cliente
    ON bdd_enci.tbl_pedido.cli_id = bdd_enci.tbl_cliente.cli_id

WHERE (ped_fecha BETWEEN inicio AND CONCAT(fin, " 23:59:59"));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PEDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PEDIDOS`()
BEGIN
select * FROM bdd_enci.tbl_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PEDIDOSTODOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PEDIDOSTODOS`()
BEGIN
select 

bdd_enci.tbl_pedido.ped_id,
bdd_enci.tbl_cliente.cli_nombre,
bdd_enci.tbl_cliente.cli_identificacion,
bdd_enci.tbl_pedido.ped_fecha

FROM bdd_enci.tbl_pedido
INNER JOIN bdd_enci.tbl_cliente
    ON bdd_enci.tbl_pedido.cli_id = bdd_enci.tbl_cliente.cli_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PRODUCTOPORITEM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PRODUCTOPORITEM`(in itmid int)
BEGIN
select 

pro_id from bdd_enci.tbl_item
WHERE bdd_enci.tbl_item.itm_id =itmid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PROVEEDORPORLEGR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PROVEEDORPORLEGR`(in legrid int)
BEGIN
select 

prv_id from bdd_enci.tbl_listaegresos
WHERE bdd_enci.tbl_listaegresos.legr_id =legrid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_PROVEEDORTODOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_PROVEEDORTODOS`()
BEGIN
select*from bdd_enci.tbl_proveedor WHERE prv_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_REGISTROS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_REGISTROS`()
BEGIN
select 

bdd_enci.tbl_registros.reg_id,
bdd_enci.tbl_usuario.usu_nombre,
bdd_enci.tbl_registros.reg_fechaingreso,
bdd_enci.tbl_registros.reg_fechasalida


FROM bdd_enci.tbl_registros
INNER JOIN bdd_enci.tbl_usuario
    ON bdd_enci.tbl_registros.usu_id = bdd_enci.tbl_usuario.usu_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_REPORTEGASTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_REPORTEGASTOS`(in inicio varchar(45), in fin varchar(45), in clasificacion varchar(45))
BEGIN


select
bdd_enci.tbl_listaegresos.legr_id,
bdd_enci.tbl_egreso.egr_total
FROM bdd_enci.tbl_listaegresos 

INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id
    WHERE (legr_fecha BETWEEN inicio AND CONCAT(fin, " 23:59:59")) and (
bdd_enci.tbl_egreso.egr_clasificacion = clasificacion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_REPORTEPORDETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_REPORTEPORDETALLE`(in inicio varchar(45), in fin varchar(45), in detalle varchar(45))
BEGIN
select 

bdd_enci.tbl_egreso.egr_id,
bdd_enci.tbl_egreso.egr_detalle,
bdd_enci.tbl_egreso.egr_total
FROM bdd_enci.tbl_listaegresos 

INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id
    WHERE (legr_fecha BETWEEN inicio AND CONCAT(fin, " 23:59:59")) and (
bdd_enci.tbl_egreso.egr_detalle LIKE CONCAT('%', detalle, '%'));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_REPORTETOTALGASTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_REPORTETOTALGASTOS`(in inicio varchar(45), in fin varchar(45), in clasificacion varchar(45))
BEGIN


select 
/*bdd_enci.tbl_listaegresos.legr_id,*/
SUM(egr_total) as suma 
FROM bdd_enci.tbl_listaegresos 

INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id
    WHERE (legr_fecha BETWEEN inicio AND CONCAT(fin, " 23:59:59")) and (
bdd_enci.tbl_egreso.egr_clasificacion = clasificacion);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_SUMALMPTOTAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_SUMALMPTOTAL`(in oprid int, in esdevolucion int, out total double)
BEGIN

select 
bdd_enci.tbl_listaegresosmp.lmp_id,
SUM(lmp_total) AS suma

FROM bdd_enci.tbl_detalleordenmp
INNER JOIN bdd_enci.tbl_listaegresosmp
    ON bdd_enci.tbl_detalleordenmp.lmp_id = bdd_enci.tbl_listaegresosmp.lmp_id
    
INNER JOIN bdd_enci.tbl_materiaprima
    ON bdd_enci.tbl_listaegresosmp.mpr_id = bdd_enci.tbl_materiaprima.mpr_id

where bdd_enci.tbl_detalleordenmp.opr_id = oprid AND bdd_enci.tbl_listaegresosmp.lmp_estado = 0 AND bdd_enci.tbl_listaegresosmp.lmp_esdevolucion = esdevolucion;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_TOTALPORMPOP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_TOTALPORMPOP`(in oprid int)
BEGIN

declare sumasalida double;
declare sumadevolucion double;
declare suma double;

CALL `bdd_enci`.`SP_SELECT_SUMALMPTOTAL`(oprid, 1, @totalsalida);
set sumasalida = @totalsalida;
CALL `bdd_enci`.`SP_SELECT_SUMALMPTOTAL`(oprid, 0, @totaldevolucion);
set sumadevolucion = @totaldevolucion;

set suma = sumasalida+sumadevolucion;

select
bdd_enci.tbl_listaegresosmp.lmp_id,
suma AS suma

FROM bdd_enci.tbl_detalleordenmp
INNER JOIN bdd_enci.tbl_listaegresosmp
    ON bdd_enci.tbl_detalleordenmp.lmp_id = bdd_enci.tbl_listaegresosmp.lmp_id
    
INNER JOIN bdd_enci.tbl_materiaprima
    ON bdd_enci.tbl_listaegresosmp.mpr_id = bdd_enci.tbl_materiaprima.mpr_id

where bdd_enci.tbl_detalleordenmp.opr_id = oprid AND bdd_enci.tbl_listaegresosmp.lmp_estado = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_TOTALPOROP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_TOTALPOROP`(in oprid int)
BEGIN


select 

bdd_enci.tbl_listaegresos.legr_id,
SUM(egr_total) AS suma


FROM bdd_enci.tbl_detalleorden
INNER JOIN bdd_enci.tbl_listaegresos
    ON bdd_enci.tbl_detalleorden.legr_id = bdd_enci.tbl_listaegresos.legr_id
    
INNER JOIN bdd_enci.tbl_egreso
    ON bdd_enci.tbl_listaegresos.egr_id = bdd_enci.tbl_egreso.egr_id

where bdd_enci.tbl_detalleorden.opr_id = oprid AND bdd_enci.tbl_listaegresos.legr_estado = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_TOTALPORPEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_TOTALPORPEDIDO`(in pedid int)
BEGIN


select 

bdd_enci.tbl_item.itm_id,
SUM(itm_total) AS suma


FROM bdd_enci.tbl_detallepedido
INNER JOIN bdd_enci.tbl_item
    ON bdd_enci.tbl_detallepedido.itm_id = bdd_enci.tbl_item.itm_id
    
where bdd_enci.tbl_detallepedido.ped_id = pedid AND  bdd_enci.tbl_detallepedido.dped_estado = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ULTIMALISTAEGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ULTIMALISTAEGRESOS`()
BEGIN
select * FROM bdd_enci.tbl_listaegresos ORDER BY legr_id DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ULTIMALISTAEGRESOSMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ULTIMALISTAEGRESOSMP`()
BEGIN
select * FROM bdd_enci.tbl_listaegresosmp ORDER BY lmp_id DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ULTIMAORDENPRODUCCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ULTIMAORDENPRODUCCION`()
BEGIN
select * FROM bdd_enci.tbl_ordenproduccion ORDER BY opr_id DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ULTIMOITEM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ULTIMOITEM`()
BEGIN
/*selecciona el ultimo item creado*/
select * FROM bdd_enci.tbl_item ORDER BY itm_id DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_ULTIMOPEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_ULTIMOPEDIDO`()
BEGIN
/*selecciona el ultimo pedido creado al pulsar generar pedido*/
select 
 
bdd_enci.tbl_pedido.ped_id,
bdd_enci.tbl_cliente.cli_id,
bdd_enci.tbl_cliente.cli_nombre,
bdd_enci.tbl_cliente.cli_identificacion


FROM bdd_enci.tbl_pedido
INNER JOIN bdd_enci.tbl_cliente
    ON bdd_enci.tbl_pedido.cli_id = bdd_enci.tbl_cliente.cli_id

 ORDER BY ped_id DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SELECT_VERIFICARUSUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SELECT_VERIFICARUSUARIO`(in usuario varchar(45), in pass varchar(45))
BEGIN
SELECT * FROM bdd_enci.tbl_usuario where usu_nombre = usuario and usu_contrasena = SHA(pass);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_CLIENTE`(
in cliid int, in clinombre varchar(45), in cliidentificacion varchar(45))
BEGIN

update bdd_enci.tbl_cliente set cli_nombre = clinombre, cli_identificacion = cliidentificacion 
where bdd_enci.tbl_cliente.cli_id = cliid;

select * from bdd_enci.tbl_cliente  where bdd_enci.tbl_cliente.cli_estado = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_EGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_EGRESO`(
in egrdetalle varchar(45), in prvruc varchar(45), in prvautorizacion varchar(45), in prvnombre varchar(45),
in egrcantidad int, in egrcostounitario double, in iva double, in legrid int)
BEGIN

declare total double;
declare costototal double;
declare totalporiva double;
set costototal = costounitario * cantidad;
set totalporiva = costototal * iva;
set total = costototal + totalporiva;

call SP_UPDATE_PROVEEDOR(prvid,prvruc,prvautorizacion,prvnombre);

update bdd_enci.tbl_egreso set egr_detalle = egrdetalle,  egr_cantidad = egrcantidad, 
egr_costounitario = ROUND(egrcostounitario,2), egr_total = ROUND(total,2)
where bdd_enci.tbl_egreso.egr_id = legrid;
select * from bdd_enci.tbl_listaegresos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_ITEM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ITEM`(
in itmcantidad int, in prodetalle varchar(45), in propvp double, in itmdescripcion varchar(3000), 
in proid int, itmid int, in total double)
BEGIN

call SP_UPDATE_PRODUCTO(proid,prodetalle,propvp);

update bdd_enci.tbl_item set itm_cantidad = itmcantidad,  itm_descripcion = itmdescripcion, itm_total = ROUND(total,2)
where bdd_enci.tbl_item.itm_id = itmid;
select * from bdd_enci.tbl_item;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_LEGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_LEGRESO`(
in egrdetalle varchar(45), in egrcantidad int, in egrcostounitario double, in iva double, 
in egrclasificacion varchar(45), in legrid int)
BEGIN

declare total double;
declare costototal double;
declare totalporiva double;
declare egrid int;
set costototal = egrcostounitario * egrcantidad;
set totalporiva = costototal * iva;
set total = costototal + totalporiva;
set egrid = legrid; 

update bdd_enci.tbl_egreso set egr_detalle = egrdetalle,  egr_cantidad = egrcantidad, 
egr_costounitario = ROUND(egrcostounitario,2), egr_costototal = ROUND(costototal,2), egr_total = ROUND(total,2), egr_clasificacion = egrclasificacion
where bdd_enci.tbl_egreso.egr_id = egrid;

update bdd_enci.tbl_listaegresos set iva_valor = iva
where bdd_enci.tbl_listaegresos.legr_id = legrid;
select * from bdd_enci.tbl_listaegresos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_LEGRESOSMP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_LEGRESOSMP`(
in iva double, in cantidad double, in cunitario double, in lmpid int, in mprid int)
BEGIN

declare total double;
declare costototal double;
declare totalporiva double;
declare egrid int;
set costototal = egrcostounitario * egrcantidad;
set totalporiva = costototal * iva;
set total = costototal + totalporiva;
set egrid = legrid; 

update bdd_enci.tbl_listaegresosmp set  lmp_cantidad = cantidad, 
lmp_cunitario = ROUND(cunitario,2), lmp_costototal = ROUND(costototal,2), lmp_total = ROUND(costototal,2), iva_valor = iva
where bdd_enci.tbl_listaegresosmp.lmp_id = lmpid;

/*
se debe actualizar el kardex y la cantidad de la materia prima pero idk como
update bdd_enci.tbl_materiaprima set mpr_cantidad = cantidad
where bdd_enci.tbl_listaegresos.legr_id = legrid;*/
select * from bdd_enci.tbl_listaegresos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_LISTAEGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_LISTAEGRESOS`(in copid int, in legrid int)
BEGIN
update bdd_enci.tbl_listaegresos set cop_id = copid WHERE  bdd_enci.tbl_listaegresos.legr_id = legrid;
select*from bdd_enci.tbl_listaegresos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_MATERIAPRIMA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_MATERIAPRIMA`(
in cantidad int, in mprid int)
BEGIN

declare cant double;
set cant = (select mpr_cantidad from tbl_materiaprima where mpr_id=mprid);

UPDATE `bdd_enci`.`tbl_materiaprima`
SET
`mpr_cantidad` = (cantidad + cant)
WHERE `mpr_id` = mprid;

select * from bdd_enci.tbl_materiaprima;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_ORDENPRODUCCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_ORDENPRODUCCION`(in oprid int, in total double, in cunitario double)
BEGIN
update bdd_enci.tbl_ordenproduccion set opr_total=total, opr_cunitario = cunitario
where bdd_enci.tbl_ordenproduccion.opr_id = oprid;
select*from bdd_enci.tbl_ordenproduccion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_PEDIDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PEDIDO`(in pedid int, in total double)
BEGIN
update bdd_enci.tbl_pedido set ped_total=total
where bdd_enci.tbl_pedido.ped_id = pedid;
select*from bdd_enci.tbl_pedido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PRODUCTO`(
in proid int, in prodetalle varchar(45), in propvp double)
BEGIN

update bdd_enci.tbl_producto set pro_detalle = prodetalle, pro_pvp = propvp 
where bdd_enci.tbl_producto.pro_id = proid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_PROVEEDOR`(
in prvid int, in identificacion varchar(45), in autorizacion varchar(45), in nombre varchar(45))
BEGIN

update bdd_enci.tbl_proveedor set prv_ruc = identificacion, prv_autorizacion = autorizacion, prv_nombre = nombre 
where bdd_enci.tbl_proveedor.prv_id = prvid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_UPDATE_REGISTRO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UPDATE_REGISTRO`()
BEGIN
update bdd_enci.tbl_registros set reg_fechasalida=NOW() ORDER BY reg_id DESC LIMIT 1;
select*from bdd_enci.tbl_registros;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-21 11:09:56
