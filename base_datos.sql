-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 185.236.182.93    Database: jhonatan_solarte
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `creado_en` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (6,'adminjhonatan1@gmail.com','$2b$10$ObeN7QcT0WdyoPmpSotWAesoutCMkyIWkTYqcTXPQ3yShC9wXXtxG','2025-05-28 10:38:57');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) NOT NULL,
  `primer_nombre` varchar(50) DEFAULT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) DEFAULT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` text,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'1234567890','ivan','david','aragon','Gómez','3204565645','Calle 123','juan@example.com'),(3,'1234567899','Ana','María','López','Ramírez','987654321','Calle 456','ana@example.com'),(4,'1234567880','andres','artemio','leon','peres','3222751199','vereda pueblo viejo','andresburbano369@gmail.com'),(5,'TEMP5','andres','artemlm','leon','peres','3222751199','vereda pueblo viejo','hameji4717@peogi.com'),(6,'12525467','david','andres','samboni','altenar','3222751199','barrio miraflores','sharryartex@gmail.com'),(9,'TEMP9','juan','david','samboni','altenar','3222751199','barrio miraflores','alirio_014@hotmail.com'),(10,'TEMP10','luis','pepe','aveiro','jr','3108564787','portugal','luisdjad@gmaill.com'),(19,'1564712349','juan','paton','primer','castillo','3235547898','ciudades bajas','patapin@email.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comisiones`
--

DROP TABLE IF EXISTS `comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comisiones` (
  `id_comision` int NOT NULL AUTO_INCREMENT,
  `id_vendedor` int DEFAULT NULL,
  `id_venta` int DEFAULT NULL,
  `monto_comision` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_comision`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_venta` (`id_venta`),
  CONSTRAINT `comisiones_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comisiones`
--

LOCK TABLES `comisiones` WRITE;
/*!40000 ALTER TABLE `comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `cantidad_disponible` int DEFAULT '0',
  `unidad_medida` varchar(20) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `fecha_ultima_compra` date DEFAULT NULL,
  `fecha_ultima_venta` date DEFAULT NULL,
  `punto_reorden` int DEFAULT '0',
  `ubicacion` varchar(100) DEFAULT NULL,
  `estado_producto` enum('Activo','Agotado','Descontinuado') DEFAULT 'Activo',
  `historial_movimientos` text,
  PRIMARY KEY (`id_inventario`),
  KEY `id_producto` (`id_producto`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `precio_compra` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `stock` int NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_vencimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (3,'Laptop HP','asus tuf 15',2500000.00,3200000.00,'Tecnología',8,2,'2025-05-26 16:57:40',NULL),(4,'papa','kilogramo',25000.00,50000.00,'verduras',47,1,'2025-05-26 16:57:40','2025-07-31'),(5,'lentejas','kg',3500.00,4500.00,'granos',500,1,'2025-05-26 20:30:28','2025-10-15'),(6,'maiz','arroba',25000.00,32000.00,'granos',297,2,'2025-05-26 20:37:05','2025-08-26'),(7,'arroz','45kg',50000.00,67000.00,'granos',140,1,'2025-05-26 20:42:10',NULL),(8,'control de xbox','por unidad',270000.00,320000.00,'Tecnología',54,2,'2025-05-26 20:47:29',NULL),(9,'aromáticas','caja x 15 unidades',1700.00,2000.00,'consumo',79,2,'2025-05-26 20:58:32',NULL),(10,'speed max','lata 175ml unidad',1500.00,2300.00,'bebidas',90,1,'2025-05-26 21:04:06','2028-10-10'),(11,'arroz','roa-kg',4500.00,5000.00,'granos',79,1,'2025-05-29 23:33:54','2026-05-29');
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
  `nombre_empresa` varchar(100) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `contacto_nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text,
  `sitio_web` varchar(100) DEFAULT NULL,
  `tipo_productos` varchar(255) DEFAULT NULL,
  `condiciones_pago` varchar(100) DEFAULT NULL,
  `banco` varchar(50) DEFAULT NULL,
  `numero_cuenta` varchar(30) DEFAULT NULL,
  `tipo_cuenta` enum('Corriente','Ahorros','Otro') DEFAULT NULL,
  `titular_cuenta` varchar(100) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` text,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `nit` (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'pan','251478','carlos','3105468997','carlos@gmail.com','calle  13','ahddhajdah//https.com','panaderia','ninguna','bbva','10054682','Otro','carlos carrascal','Activo','2025-05-27 20:58:32','muy cochino'),(2,'aliexpress','123457878451','gloria trevi','3254565665','todosmemiran@gmail.com','venezuela','','productos de aseo','ninguna','agripuerca','15461232','Corriente','gloria trevi','Activo','2025-05-28 07:09:55','ninguna');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'usuario',
  `creado_por` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'talia','thalia@gmail.com','123','usuario',6);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sueldo_base` decimal(10,2) DEFAULT NULL,
  `comision` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Laura ','Gómez','3124567890','laura.gomez@empresa.com',NULL,5.00);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `id_producto` int NOT NULL,
  `cantidad_vendida` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total_venta` decimal(10,2) GENERATED ALWAYS AS ((`cantidad_vendida` * `precio_unitario`)) STORED,
  `metodo_pago` varchar(30) NOT NULL,
  `id_usuario` int NOT NULL,
  `tipo_usuario` enum('usuario','administrador') NOT NULL DEFAULT 'usuario',
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id_venta`, `fecha_venta`, `id_cliente`, `id_producto`, `cantidad_vendida`, `precio_unitario`, `metodo_pago`, `id_usuario`, `tipo_usuario`) VALUES (1,'2025-06-02 06:48:32',2,4,30,50000.00,'Efectivo',1,'usuario'),(3,'2025-06-02 06:56:30',4,3,2,3200000.00,'Efectivo',1,'usuario'),(4,'2025-06-02 07:00:35',2,6,3,32000.00,'Efectivo',6,'usuario'),(5,'2025-06-02 07:05:02',2,7,3,67000.00,'Efectivo',6,'usuario'),(6,'2025-06-02 11:51:48',NULL,11,21,5000.00,'Efectivo',6,'administrador'),(7,'2025-06-02 11:54:53',4,4,3,50000.00,'Efectivo',1,'usuario'),(8,'2025-06-02 14:18:13',3,10,3,2300.00,'Efectivo',6,'administrador'),(9,'2025-06-02 14:25:00',6,8,1,320000.00,'Efectivo',6,'administrador'),(10,'2025-06-02 14:25:34',10,5,1,4500.00,'Transferencia',1,'usuario'),(11,'2025-06-02 14:36:07',NULL,11,19,5000.00,'Efectivo',1,'usuario'),(12,'2025-06-02 14:36:44',10,11,1,5000.00,'Transferencia',6,'administrador'),(13,'2025-06-02 14:39:15',4,11,19,5000.00,'Transferencia',1,'usuario'),(14,'2025-06-02 14:43:42',5,4,5,50000.00,'Transferencia',6,'administrador'),(15,'2025-06-02 14:44:12',6,3,2,3200000.00,'Transferencia',1,'usuario'),(16,'2025-06-02 14:46:25',4,3,2,3200000.00,'Transferencia',6,'administrador'),(17,'2025-06-02 14:48:09',6,3,2,3200000.00,'Transferencia',1,'usuario'),(18,'2025-06-02 14:54:41',2,3,1,3200000.00,'Transferencia',1,'usuario'),(19,'2025-06-02 15:02:36',2,3,1,3200000.00,'Transferencia',1,'usuario'),(20,'2025-06-02 23:11:25',NULL,3,1,3200000.00,'Transferencia',6,'administrador');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 18:20:47
