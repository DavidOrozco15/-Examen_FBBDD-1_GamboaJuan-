-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: campusbike
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.22.04.1

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nom_cliente` varchar(100) NOT NULL,
  `apell_cliente` varchar(100) NOT NULL,
  `email_cliente` varchar(100) DEFAULT NULL,
  `tel_cliente` varchar(13) DEFAULT NULL,
  `dir_cliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_detalle`
--

DROP TABLE IF EXISTS `compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_detalle` (
  `id_compra_detalle` int NOT NULL AUTO_INCREMENT,
  `id_compra_fk` int NOT NULL,
  `id_producto_fk` int NOT NULL,
  `cantidad` int NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_compra_detalle`),
  KEY `id_compra_fk` (`id_compra_fk`),
  KEY `id_producto_fk` (`id_producto_fk`),
  CONSTRAINT `compra_detalle_ibfk_1` FOREIGN KEY (`id_compra_fk`) REFERENCES `compra_encabezado` (`id_compra`) ON DELETE RESTRICT,
  CONSTRAINT `compra_detalle_ibfk_2` FOREIGN KEY (`id_producto_fk`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_detalle`
--

LOCK TABLES `compra_detalle` WRITE;
/*!40000 ALTER TABLE `compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_encabezado`
--

DROP TABLE IF EXISTS `compra_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_encabezado` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor_fk` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `estado_pedido` varchar(20) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proveedor_fk` (`id_proveedor_fk`),
  CONSTRAINT `compra_encabezado_ibfk_1` FOREIGN KEY (`id_proveedor_fk`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_encabezado`
--

LOCK TABLES `compra_encabezado` WRITE;
/*!40000 ALTER TABLE `compra_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interacciones`
--

DROP TABLE IF EXISTS `interacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interacciones` (
  `id_interaccion` int NOT NULL AUTO_INCREMENT,
  `id_cliente_fk` int NOT NULL,
  `fecha` date NOT NULL,
  `tipo_contacto` varchar(100) DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_interaccion`),
  KEY `id_cliente_fk` (`id_cliente_fk`),
  CONSTRAINT `interacciones_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interacciones`
--

LOCK TABLES `interacciones` WRITE;
/*!40000 ALTER TABLE `interacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `interacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nom_producto` varchar(100) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `stock_actual` int NOT NULL,
  `stock_min` int NOT NULL,
  `id_proveedor_fk` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proveedor_fk` (`id_proveedor_fk`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor_fk`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nom_proveedor` varchar(100) NOT NULL,
  `tel_proveedor` varchar(13) NOT NULL,
  `dir_proveedor` varchar(100) NOT NULL,
  `termino_suministro` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_detalle` (
  `id_venta_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta_fk` int NOT NULL,
  `id_producto_fk` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta_detalle`),
  KEY `id_venta_fk` (`id_venta_fk`),
  KEY `id_producto_fk` (`id_producto_fk`),
  CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`id_venta_fk`) REFERENCES `venta_encabezado` (`id_venta`) ON DELETE RESTRICT,
  CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`id_producto_fk`) REFERENCES `productos` (`id_producto`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_encabezado`
--

DROP TABLE IF EXISTS `venta_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_encabezado` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_cliente_fk` int NOT NULL,
  `fecha_venta` date NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `total_venta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente_fk` (`id_cliente_fk`),
  CONSTRAINT `venta_encabezado_ibfk_1` FOREIGN KEY (`id_cliente_fk`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_encabezado`
--

LOCK TABLES `venta_encabezado` WRITE;
/*!40000 ALTER TABLE `venta_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_encabezado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-05 20:51:44
